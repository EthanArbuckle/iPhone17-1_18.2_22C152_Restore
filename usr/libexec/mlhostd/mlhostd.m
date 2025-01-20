int main(int argc, const char **argv, const char **envp)
{
  if (qword_100064F98 != -1) {
    swift_once();
  }
  sub_1000250D8();
}

uint64_t sub_100005470(uint64_t a1, uint64_t a2)
{
  return sub_100005568(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100005488()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000054DC()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100005550(uint64_t a1, uint64_t a2)
{
  return sub_100005568(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100005568(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1000055AC(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_100005624(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1000056A4@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

id sub_1000056E8()
{
  return *v0;
}

uint64_t sub_1000056F0@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_1000056F8()
{
  uint64_t v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_100005784()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100005794(uint64_t a1)
{
  uint64_t v2 = sub_100005E78(&qword_100064FE8, type metadata accessor for BGSystemTaskSchedulerError);

  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_100005800(uint64_t a1)
{
  uint64_t v2 = sub_100005E78(&qword_100064FE8, type metadata accessor for BGSystemTaskSchedulerError);

  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_10000586C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100005E78(&qword_100064FE8, type metadata accessor for BGSystemTaskSchedulerError);
  id v5 = a1;

  return _BridgedStoredNSError.init(_bridgedNSError:)(v5, a2, v4);
}

uint64_t sub_1000058FC()
{
  id v1 = *v0;
  uint64_t v2 = NSObject.hashValue.getter();

  return v2;
}

uint64_t sub_100005934(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005E78(&qword_100064FE8, type metadata accessor for BGSystemTaskSchedulerError);

  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_1000059B0()
{
  return Hasher._finalize()();
}

void *sub_100005A10@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100005A20(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100005A2C@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100005A74@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
}

void type metadata accessor for Code(uint64_t a1)
{
}

void type metadata accessor for BGSystemTaskSchedulerError(uint64_t a1)
{
}

void type metadata accessor for APSIncomingMessagePriority(uint64_t a1)
{
}

void type metadata accessor for APSIncomingMessagePushType(uint64_t a1)
{
}

void sub_100005B18(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100005B60(uint64_t a1)
{
  uint64_t v2 = sub_100005E78(&qword_100065038, type metadata accessor for FileAttributeKey);
  uint64_t v3 = sub_100005E78((unint64_t *)&unk_100065040, type metadata accessor for FileAttributeKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100005C1C(uint64_t a1)
{
  uint64_t v2 = sub_100005E78(&qword_100065008, type metadata accessor for BGSystemTaskSchedulerError);

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100005C88(uint64_t a1)
{
  uint64_t v2 = sub_100005E78(&qword_100065008, type metadata accessor for BGSystemTaskSchedulerError);

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_100005CF8(uint64_t a1)
{
  uint64_t v2 = sub_100005E78(&qword_100064FE8, type metadata accessor for BGSystemTaskSchedulerError);

  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_100005D64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100005E78(&qword_100064FE8, type metadata accessor for BGSystemTaskSchedulerError);

  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

uint64_t sub_100005DE8()
{
  return sub_100005E78(&qword_100064FD0, type metadata accessor for BGSystemTaskSchedulerError);
}

uint64_t sub_100005E30()
{
  return sub_100005E78(&qword_100064FD8, type metadata accessor for BGSystemTaskSchedulerError);
}

uint64_t sub_100005E78(unint64_t *a1, void (*a2)(uint64_t))
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

BOOL sub_100005EC0(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100005ED4()
{
  return sub_100005E78(&qword_100064FE0, type metadata accessor for Code);
}

uint64_t sub_100005F1C()
{
  return sub_100005E78(&qword_100064FE8, type metadata accessor for BGSystemTaskSchedulerError);
}

uint64_t sub_100005F64()
{
  return sub_100005E78(&qword_100064FF0, type metadata accessor for FileAttributeKey);
}

uint64_t sub_100005FAC()
{
  return sub_100005E78(&qword_100064FF8, type metadata accessor for FileAttributeKey);
}

uint64_t sub_100005FF4()
{
  return sub_100005E78(&qword_100065000, type metadata accessor for FileAttributeKey);
}

uint64_t sub_10000603C()
{
  return sub_100005E78(&qword_100065008, type metadata accessor for BGSystemTaskSchedulerError);
}

uint64_t sub_100006084()
{
  return sub_100005E78(&qword_100065010, type metadata accessor for BGSystemTaskSchedulerError);
}

uint64_t sub_1000060CC()
{
  return sub_100005E78(&qword_100065018, type metadata accessor for BGSystemTaskSchedulerError);
}

uint64_t sub_100006114()
{
  return sub_100005E78(&qword_100065020, type metadata accessor for Code);
}

uint64_t sub_10000615C()
{
  return sub_100005E78(&qword_100065028, type metadata accessor for Code);
}

unint64_t sub_1000061A8()
{
  unint64_t result = qword_100065030;
  if (!qword_100065030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065030);
  }
  return result;
}

BOOL sub_1000061FC(char a1, char a2)
{
  return a1 == a2;
}

void sub_10000620C(uint64_t a1, unsigned __int8 a2)
{
}

uint64_t sub_100006234(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F697461657263 && a2 == 0xEC00000065746144 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x696665446B736174 && a2 == 0xEE006E6F6974696ELL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000100055D40 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x617261506B736174 && a2 == 0xEE0073726574656DLL)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

Swift::Int sub_1000064AC(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

unint64_t sub_1000064F4(char a1)
{
  unint64_t result = 0x6E6F6973726576;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6E6F697461657263;
      break;
    case 2:
      unint64_t result = 0x696665446B736174;
      break;
    case 3:
      unint64_t result = 0xD000000000000010;
      break;
    case 4:
      unint64_t result = 0x617261506B736174;
      break;
    default:
      return result;
  }
  return result;
}

BOOL sub_1000065C8(char *a1, char *a2)
{
  return sub_1000061FC(*a1, *a2);
}

Swift::Int sub_1000065E0()
{
  return sub_1000064AC(*v0);
}

void sub_1000065F0(uint64_t a1)
{
  sub_10000620C(a1, *v1);
}

Swift::Int sub_100006600()
{
  Hasher.init(_seed:)();
  sub_10000620C((uint64_t)v2, *v0);
  return Hasher._finalize()();
}

unint64_t sub_10000664C()
{
  return sub_1000064F4(*v0);
}

uint64_t sub_10000665C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100006234(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100006690()
{
  return 0;
}

uint64_t sub_10000669C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10000FA30();
  *a1 = result;
  return result;
}

uint64_t sub_1000066D0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return CodingKey.description.getter(a1, WitnessTable);
}

uint64_t sub_100006724(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return CodingKey.debugDescription.getter(a1, WitnessTable);
}

uint64_t sub_100006778(void *a1, uint64_t a2)
{
  v10[2] = a2;
  uint64_t v3 = *(void *)(a2 + 16);
  v10[0] = *(void *)(a2 + 32);
  v10[1] = v3;
  type metadata accessor for MLHostPushMessage.CodingKeys();
  swift_getWitnessTable();
  uint64_t v4 = type metadata accessor for KeyedEncodingContainer();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)v10 - v6;
  sub_100010424(a1, a1[3]);
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v15 = 0;
  uint64_t v8 = v10[3];
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v8)
  {
    char v14 = 1;
    type metadata accessor for Date();
    sub_10001036C(&qword_100065260, (void (*)(uint64_t))&type metadata accessor for Date);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    char v13 = 2;
    type metadata accessor for TaskDefinition();
    sub_10001036C(&qword_100065268, (void (*)(uint64_t))&type metadata accessor for TaskDefinition);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    char v12 = 3;
    type metadata accessor for MLHostSystemParameters();
    sub_10001036C(&qword_100065270, (void (*)(uint64_t))&type metadata accessor for MLHostSystemParameters);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    char v11 = 4;
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_100006AB8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v34 = a4;
  uint64_t v7 = type metadata accessor for Optional();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v35 = v7;
  uint64_t v36 = v8;
  __chkstk_darwin(v7);
  v37 = (char *)&v33 - v9;
  uint64_t v10 = sub_10000E508(&qword_100065240);
  __chkstk_darwin(v10 - 8);
  v40 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = type metadata accessor for TaskDefinition();
  uint64_t v41 = *(void *)(v47 - 8);
  __chkstk_darwin(v47);
  v46 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Date();
  uint64_t v42 = *(void *)(v13 - 8);
  uint64_t v43 = v13;
  __chkstk_darwin(v13);
  v45 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MLHostPushMessage.CodingKeys();
  swift_getWitnessTable();
  uint64_t v49 = type metadata accessor for KeyedDecodingContainer();
  uint64_t v44 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  v16 = (char *)&v33 - v15;
  uint64_t v38 = a2;
  uint64_t v39 = a3;
  uint64_t v17 = type metadata accessor for MLHostPushMessage();
  uint64_t v33 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  v19 = (uint64_t *)((char *)&v33 - v18);
  *(uint64_t *)((char *)&v33 - v18) = 1;
  sub_100010424(a1, a1[3]);
  v48 = v16;
  uint64_t v20 = (uint64_t)v50;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v20) {
    return sub_1000101AC((uint64_t)a1);
  }
  v22 = v45;
  v21 = v46;
  v50 = a1;
  uint64_t v23 = v47;
  char v55 = 0;
  v24 = v19;
  uint64_t *v19 = KeyedDecodingContainer.decode(_:forKey:)();
  char v54 = 1;
  sub_10001036C(&qword_100065248, (void (*)(uint64_t))&type metadata accessor for Date);
  v25 = v22;
  uint64_t v26 = v43;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v27 = (int *)v17;
  (*(void (**)(char *, char *, uint64_t))(v42 + 32))((char *)v24 + *(int *)(v17 + 44), v25, v26);
  char v53 = 2;
  sub_10001036C(&qword_100065250, (void (*)(uint64_t))&type metadata accessor for TaskDefinition);
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v28 = v24;
  (*(void (**)(char *, char *, uint64_t))(v41 + 32))((char *)v24 + v27[12], v21, v23);
  type metadata accessor for MLHostSystemParameters();
  char v52 = 3;
  sub_10001036C(&qword_100065258, (void (*)(uint64_t))&type metadata accessor for MLHostSystemParameters);
  uint64_t v29 = (uint64_t)v40;
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  sub_100010514(v29, (uint64_t)v24 + v27[13], &qword_100065240);
  char v51 = 4;
  v30 = v37;
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v48, v49);
  (*(void (**)(char *, char *, uint64_t))(v36 + 32))((char *)v28 + v27[14], v30, v35);
  uint64_t v31 = v33;
  (*(void (**)(uint64_t, uint64_t *, int *))(v33 + 16))(v34, v28, v27);
  sub_1000101AC((uint64_t)v50);
  return (*(uint64_t (**)(uint64_t *, int *))(v31 + 8))(v28, v27);
}

uint64_t sub_1000071D8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_100006AB8(a1, *(void *)(a2 + 16), *(void *)(a2 + 24), a3);
}

uint64_t sub_1000071FC(void *a1, uint64_t a2)
{
  return sub_100006778(a1, a2);
}

uint64_t sub_100007214(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v76 = a1;
  uint64_t v75 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v8 = *(void *)(v75 - 8);
  __chkstk_darwin(v75);
  uint64_t v10 = (char *)v70 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v11);
  uint64_t v12 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v12 - 8);
  unint64_t v13 = sub_100025898((uint64_t)_swiftEmptyArrayStorage);
  v72 = v4;
  v4[3] = v13;
  v4[9] = sub_1000259BC((uint64_t)_swiftEmptyArrayStorage);
  v70[1] = a2;
  uint64_t v71 = a3;
  if (!a3)
  {
    a2 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
    a3 = v14;
  }
  uint64_t v15 = v72;
  v72[5] = a2;
  v15[6] = a3;
  if (a4)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = (uint64_t)a4;
  }
  else
  {
    int64_t v74 = sub_100010330(0, &qword_1000652B8);
    swift_bridgeObjectRetain();
    static DispatchQoS.unspecified.getter();
    v77 = _swiftEmptyArrayStorage;
    sub_10001036C(&qword_1000652C0, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
    sub_10000E508(&qword_1000652C8);
    sub_100010468((unint64_t *)&qword_1000652D0, &qword_1000652C8);
    dispatch thunk of SetAlgebra.init<A>(_:)();
    (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v75);
    uint64_t v16 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  }
  v72[4] = v16;
  uint64_t v17 = *(void *)(v76 + 64);
  uint64_t v73 = v76 + 64;
  uint64_t v18 = 1 << *(unsigned char *)(v76 + 32);
  uint64_t v19 = -1;
  if (v18 < 64) {
    uint64_t v19 = ~(-1 << v18);
  }
  unint64_t v20 = v19 & v17;
  int64_t v74 = (unint64_t)(v18 + 63) >> 6;
  v70[0] = a4;
  int64_t v21 = 0;
  uint64_t v75 = (uint64_t)(v4 + 3);
  while (1)
  {
    if (v20)
    {
      unint64_t v23 = __clz(__rbit64(v20));
      v20 &= v20 - 1;
      unint64_t v24 = v23 | (v21 << 6);
      goto LABEL_27;
    }
    int64_t v25 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      goto LABEL_50;
    }
    if (v25 >= v74) {
      break;
    }
    unint64_t v26 = *(void *)(v73 + 8 * v25);
    ++v21;
    if (!v26)
    {
      int64_t v21 = v25 + 1;
      if (v25 + 1 >= v74) {
        break;
      }
      unint64_t v26 = *(void *)(v73 + 8 * v21);
      if (!v26)
      {
        int64_t v21 = v25 + 2;
        if (v25 + 2 >= v74) {
          break;
        }
        unint64_t v26 = *(void *)(v73 + 8 * v21);
        if (!v26)
        {
          int64_t v27 = v25 + 3;
          if (v27 >= v74) {
            break;
          }
          unint64_t v26 = *(void *)(v73 + 8 * v27);
          if (!v26)
          {
            while (1)
            {
              int64_t v21 = v27 + 1;
              if (__OFADD__(v27, 1)) {
                goto LABEL_51;
              }
              if (v21 >= v74) {
                goto LABEL_43;
              }
              unint64_t v26 = *(void *)(v73 + 8 * v21);
              ++v27;
              if (v26) {
                goto LABEL_26;
              }
            }
          }
          int64_t v21 = v27;
        }
      }
    }
LABEL_26:
    unint64_t v20 = (v26 - 1) & v26;
    unint64_t v24 = __clz(__rbit64(v26)) + (v21 << 6);
LABEL_27:
    v28 = (uint64_t *)(*(void *)(v76 + 48) + 16 * v24);
    uint64_t v29 = *v28;
    uint64_t v30 = v28[1];
    uint64_t v31 = *(void *)(*(void *)(v76 + 56) + 8 * v24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v32 = Set.init(minimumCapacity:)();
    v78 = (void *)v32;
    uint64_t v33 = *(void *)(v31 + 16);
    if (v33)
    {
      int64_t v34 = v21;
      uint64_t v35 = (Swift::Int *)(v31 + 40);
      do
      {
        Swift::Int v36 = *(v35 - 1);
        Swift::Int v37 = *v35;
        swift_bridgeObjectRetain();
        sub_100035310((Swift::Int *)&v77, v36, v37);
        swift_bridgeObjectRelease();
        v35 += 2;
        --v33;
      }
      while (v33);
      swift_bridgeObjectRelease();
      uint64_t v38 = (uint64_t)v78;
      int64_t v21 = v34;
    }
    else
    {
      uint64_t v38 = v32;
      swift_bridgeObjectRelease();
    }
    uint64_t v39 = (void *)v75;
    swift_beginAccess();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v78 = (void *)*v39;
    uint64_t v41 = v78;
    *uint64_t v39 = 0x8000000000000000;
    unint64_t v43 = sub_100034E9C(v29, v30);
    uint64_t v44 = v41[2];
    BOOL v45 = (v42 & 1) == 0;
    uint64_t v46 = v44 + v45;
    if (__OFADD__(v44, v45))
    {
      __break(1u);
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
      goto LABEL_52;
    }
    char v47 = v42;
    if (v41[3] >= v46)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        v50 = v78;
        if (v42) {
          goto LABEL_9;
        }
      }
      else
      {
        sub_100020DC0();
        v50 = v78;
        if (v47) {
          goto LABEL_9;
        }
      }
    }
    else
    {
      sub_100035760(v46, isUniquelyReferenced_nonNull_native);
      unint64_t v48 = sub_100034E9C(v29, v30);
      if ((v47 & 1) != (v49 & 1)) {
        goto LABEL_53;
      }
      unint64_t v43 = v48;
      v50 = v78;
      if (v47)
      {
LABEL_9:
        uint64_t v22 = v50[7];
        swift_bridgeObjectRelease();
        *(void *)(v22 + 8 * v43) = v38;
        goto LABEL_10;
      }
    }
    v50[(v43 >> 6) + 8] |= 1 << v43;
    char v51 = (uint64_t *)(v50[6] + 16 * v43);
    *char v51 = v29;
    v51[1] = v30;
    *(void *)(v50[7] + 8 * v43) = v38;
    uint64_t v52 = v50[2];
    BOOL v53 = __OFADD__(v52, 1);
    uint64_t v54 = v52 + 1;
    if (v53) {
      goto LABEL_49;
    }
    v50[2] = v54;
    swift_bridgeObjectRetain();
LABEL_10:
    *uint64_t v39 = v50;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
LABEL_43:
  swift_release();
  sub_10000E508(&qword_1000652D8);
  uint64_t v55 = swift_allocObject();
  *(_DWORD *)(v55 + 16) = 0;
  v56 = v72;
  v72[2] = v55;
  v56[8] = [objc_allocWithZone((Class)type metadata accessor for MLHostAPSListener()) init];
  v57 = (void *)v56[4];
  if (v71)
  {
    id v58 = v57;
    NSString v59 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v60 = v57;
    NSString v59 = 0;
  }
  id v61 = objc_allocWithZone((Class)APSConnection);
  NSString v62 = String._bridgeToObjectiveC()();
  id v63 = [v61 initWithEnvironmentName:v59 namedDelegatePort:v62 queue:v57];

  if (v63)
  {
    v64 = (void (*)(uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v72;
    v72[7] = v63;
    v65 = (void *)*((void *)v64 + 8);
    id v66 = v63;
    id v67 = v65;
    [v66 setDelegate:v67];

    v68 = (void (**)(uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*((void *)v64 + 8) + OBJC_IVAR____TtC7mlhostd17MLHostAPSListener_handleMessage);
    *v68 = sub_1000103B4;
    v68[1] = v64;
    swift_retain();
    swift_release();
    return (uint64_t)v64;
  }
LABEL_52:
  __break(1u);
LABEL_53:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

void sub_100007974(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v84 = a8;
  uint64_t v87 = a7;
  uint64_t v86 = a6;
  uint64_t v85 = a5;
  uint64_t v92 = a3;
  uint64_t v91 = sub_10000E508(&qword_1000652E0);
  uint64_t v89 = *(void *)(v91 - 8);
  __chkstk_darwin(v91);
  uint64_t v93 = (uint64_t)&v75 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = sub_10000E508(&qword_1000652E8);
  __chkstk_darwin(v90);
  uint64_t v94 = (uint64_t)&v75 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v95 = v9;
  uint64_t v15 = (os_unfair_lock_s *)(v9[2] + 16);
  os_unfair_lock_lock(v15);
  if (qword_100064F68 != -1) {
    swift_once();
  }
  uint64_t v16 = type metadata accessor for Logger();
  id v17 = (id)sub_100010174(v16, (uint64_t)qword_1000667D0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    id v83 = v17;
    *(void *)&long long v105 = v21;
    *(_DWORD *)uint64_t v20 = 136315394;
    v88 = v15;
    swift_bridgeObjectRetain();
    *(void *)&long long v107 = sub_10000E564(a1, a2, (uint64_t *)&v105);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v20 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(void *)&long long v107 = sub_10000E564(v92, a4, (uint64_t *)&v105);
    uint64_t v15 = v88;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Processing push message: topic: %s channel: %s", (uint8_t *)v20, 0x16u);
    swift_arrayDestroy();
    id v17 = v83;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v22 = v95;
  swift_beginAccess();
  uint64_t v23 = v22[9];
  if (!*(void *)(v23 + 16)) {
    goto LABEL_12;
  }
  swift_bridgeObjectRetain();
  unint64_t v24 = sub_100034E9C(a1, a2);
  if ((v25 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_12:
    swift_endAccess();
    swift_bridgeObjectRetain_n();
    uint64_t v30 = Logger.logObject.getter();
    os_log_type_t v31 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v30, v31))
    {

      swift_bridgeObjectRelease_n();
      goto LABEL_48;
    }
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v105 = swift_slowAlloc();
    *(_DWORD *)uint64_t v32 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)&long long v107 = sub_10000E564(a1, a2, (uint64_t *)&v105);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v30, v31, "No handler registered for topic: %s", v32, 0xCu);
    swift_arrayDestroy();
    goto LABEL_46;
  }
  uint64_t v76 = a1;
  uint64_t v26 = *(void *)(v23 + 56) + 16 * v24;
  uint64_t v27 = *(void *)(v26 + 8);
  uint64_t v75 = *(void (**)(long long *, void *, void *, void *, void **))v26;
  swift_endAccess();
  swift_retain();
  swift_bridgeObjectRelease();
  strcpy((char *)&v103, "messageBundle");
  HIWORD(v103) = -4864;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a9 + 16) && (unint64_t v28 = sub_100034FA8((uint64_t)&v105), (v29 & 1) != 0))
  {
    sub_1000101FC(*(void *)(a9 + 56) + 32 * v28, (uint64_t)&v103);
  }
  else
  {
    long long v103 = 0u;
    long long v104 = 0u;
  }
  sub_1000103C0((uint64_t)&v105);
  if (!*((void *)&v104 + 1))
  {
    swift_release();
    sub_100010578((uint64_t)&v103, &qword_1000652F0);
    goto LABEL_44;
  }
  uint64_t v81 = v27;
  sub_100010414(&v103, &v107);
  uint64_t v33 = self;
  sub_100010424(&v107, v108);
  uint64_t v34 = _bridgeAnythingToObjectiveC<A>(_:)();
  id v83 = v33;
  LODWORD(v33) = [v33 isValidJSONObject:v34];
  swift_unknownObjectRelease();
  if (!v33
    || (sub_1000101FC((uint64_t)&v107, (uint64_t)&v105), sub_10000E508(&qword_1000652F8), (swift_dynamicCast() & 1) == 0))
  {
    swift_release();
    sub_1000101AC((uint64_t)&v107);
LABEL_44:
    uint64_t v30 = Logger.logObject.getter();
    os_log_type_t v59 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v30, v59))
    {
LABEL_47:

      goto LABEL_48;
    }
    id v60 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v105 = swift_slowAlloc();
    *(_DWORD *)id v60 = 136315138;
    *(void *)&long long v107 = sub_10000E564(0x426567617373656DLL, 0xED0000656C646E75, (uint64_t *)&v105);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v30, v59, "The push message body must be a JSON dictionary with key: %s.", v60, 0xCu);
    swift_arrayDestroy();
LABEL_46:
    swift_slowDealloc();
    swift_slowDealloc();
    goto LABEL_47;
  }
  v88 = v15;
  v100 = _swiftEmptyArrayStorage;
  uint64_t v82 = v103;
  uint64_t v79 = *(void *)(v103 + 16);
  if (v79)
  {
    uint64_t v35 = 0;
    Swift::Int v36 = _swiftEmptyArrayStorage;
    v80 = (char *)&type metadata for Any + 8;
    unint64_t v77 = (unint64_t)"com.apple.aps.mlhostd";
    unint64_t v78 = 0x8000000100055D40;
    while (1)
    {
      v95 = v36;
      uint64_t v37 = *(void *)(v82 + 8 * v35 + 32);
      swift_bridgeObjectRetain();
      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      *(void *)&long long v105 = 0;
      id v39 = [v83 dataWithJSONObject:isa options:0 error:&v105];

      id v40 = (id)v105;
      if (!v39) {
        break;
      }
      id v41 = v17;
      uint64_t v42 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v44 = v43;

      type metadata accessor for JSONDecoder();
      swift_allocObject();
      JSONDecoder.init()();
      sub_100010468(&qword_100065300, &qword_1000652E8);
      dispatch thunk of JSONDecoder.decode<A>(_:from:)();
      swift_release();
      unint64_t v45 = sub_100025D10((uint64_t)_swiftEmptyArrayStorage);
      *(void *)&long long v101 = 0xD000000000000010;
      *((void *)&v101 + 1) = v78;
      AnyHashable.init<A>(_:)();
      if (*(void *)(v37 + 16) && (unint64_t v46 = sub_100034FA8((uint64_t)&v105), (v47 & 1) != 0))
      {
        sub_1000101FC(*(void *)(v37 + 56) + 32 * v46, (uint64_t)&v101);
      }
      else
      {
        long long v101 = 0u;
        long long v102 = 0u;
      }
      sub_1000103C0((uint64_t)&v105);
      if (*((void *)&v102 + 1))
      {
        sub_100010414(&v101, &v103);
        sub_1000101FC((uint64_t)&v103, (uint64_t)&v105);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(void *)&long long v101 = v45;
        sub_1000367D8(&v105, 0xD000000000000010, v77 | 0x8000000000000000, isUniquelyReferenced_nonNull_native);
        uint64_t v49 = v101;
        swift_bridgeObjectRelease();
        sub_1000101AC((uint64_t)&v103);
      }
      else
      {
        sub_100010578((uint64_t)&v101, &qword_1000652F0);
        unint64_t v50 = sub_100025E48((uint64_t)_swiftEmptyArrayStorage);
        uint64_t v106 = sub_10000E508(qword_100065308);
        *(void *)&long long v105 = v50;
        sub_100010414(&v105, &v103);
        char v51 = swift_isUniquelyReferenced_nonNull_native();
        *(void *)&long long v101 = v45;
        sub_1000367D8(&v103, 0xD000000000000010, v77 | 0x8000000000000000, v51);
        uint64_t v49 = v101;
        swift_bridgeObjectRelease();
      }
      strcpy((char *)&v103, "taskParameters");
      HIBYTE(v103) = -18;
      AnyHashable.init<A>(_:)();
      if (*(void *)(v37 + 16) && (unint64_t v52 = sub_100034FA8((uint64_t)&v105), (v53 & 1) != 0))
      {
        sub_1000101FC(*(void *)(v37 + 56) + 32 * v52, (uint64_t)&v101);
      }
      else
      {
        long long v101 = 0u;
        long long v102 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_1000103C0((uint64_t)&v105);
      if (*((void *)&v102 + 1))
      {
        sub_100010414(&v101, &v103);
        sub_1000101FC((uint64_t)&v103, (uint64_t)&v105);
        char v54 = swift_isUniquelyReferenced_nonNull_native();
        *(void *)&long long v101 = v49;
        sub_1000367D8(&v105, 0x617261506B736174, 0xEE0073726574656DLL, v54);
        uint64_t v49 = v101;
        swift_bridgeObjectRelease();
        sub_1000101AC((uint64_t)&v103);
      }
      else
      {
        sub_100010578((uint64_t)&v101, &qword_1000652F0);
      }
      uint64_t v55 = *(int *)(v91 + 48);
      uint64_t v56 = v93;
      sub_1000104AC(v94, v93);
      *(void *)(v56 + v55) = v49;
      Swift::Int v36 = v95;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        Swift::Int v36 = (void *)sub_1000203B8(0, v36[2] + 1, 1, (unint64_t)v36);
      }
      unint64_t v58 = v36[2];
      unint64_t v57 = v36[3];
      if (v58 >= v57 >> 1) {
        Swift::Int v36 = (void *)sub_1000203B8(v57 > 1, v58 + 1, 1, (unint64_t)v36);
      }
      ++v35;
      v36[2] = v58 + 1;
      sub_100010514(v93, (uint64_t)v36+ ((*(unsigned __int8 *)(v89 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v89 + 80))+ *(void *)(v89 + 72) * v58, &qword_1000652E0);
      sub_100010270(v42, v44);
      v100 = v36;
      sub_100010578(v94, &qword_1000652E8);
      id v17 = v41;
      if (v79 == v35) {
        goto LABEL_49;
      }
    }
    v68 = v40;
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRetain();
    swift_errorRetain();
    v69 = Logger.logObject.getter();
    uint64_t v70 = static os_log_type_t.error.getter();
    BOOL v71 = os_log_type_enabled(v69, (os_log_type_t)v70);
    uint64_t v15 = v88;
    if (v71)
    {
      v72 = (uint8_t *)swift_slowAlloc();
      uint64_t v73 = (void *)swift_slowAlloc();
      *(_DWORD *)v72 = 138412290;
      swift_errorRetain();
      uint64_t v74 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)&long long v105 = v74;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v73 = v74;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v69, (os_log_type_t)v70, "Received invalid push message, error: %@. Skipping callback.", v72, 0xCu);
      sub_10000E508(&qword_100065290);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
    sub_1000101AC((uint64_t)&v107);
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_49:
    v95 = (void *)a4;
    swift_bridgeObjectRelease();
    id v61 = Logger.logObject.getter();
    os_log_type_t v62 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v61, v62))
    {
      id v63 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v105 = swift_slowAlloc();
      *(_DWORD *)id v63 = 136315138;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      uint64_t v64 = Array.description.getter();
      unint64_t v66 = v65;
      swift_bridgeObjectRelease();
      *(void *)&long long v101 = sub_10000E564(v64, v66, (uint64_t *)&v105);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v61, v62, "Decoded pushed message bundle: %s", v63, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    uint64_t v67 = v76;
    swift_beginAccess();
    *(void *)&long long v101 = v67;
    *((void *)&v101 + 1) = a2;
    v99[0] = v92;
    v99[1] = v95;
    v98[0] = v85;
    v98[1] = v86;
    v97[0] = v87;
    v97[1] = v84;
    v96 = v100;
    swift_bridgeObjectRetain();
    v75(&v101, v99, v98, v97, &v96);
    swift_bridgeObjectRelease();
    swift_release();
    sub_1000101AC((uint64_t)&v107);
    swift_bridgeObjectRelease();
    uint64_t v15 = v88;
  }
LABEL_48:
  os_unfair_lock_unlock(v15);
}

void sub_1000089FC()
{
  lock = (os_unfair_lock_s *)(*(void *)(v0 + 16) + 16);
  os_unfair_lock_lock(lock);
  if (qword_100064F68 == -1) {
    goto LABEL_2;
  }
LABEL_74:
  swift_once();
LABEL_2:
  uint64_t v1 = type metadata accessor for Logger();
  sub_100010174(v1, (uint64_t)qword_1000667D0);
  BOOL v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Subscribing to all topics and channels", v4, 2u);
    swift_slowDealloc();
  }

  swift_beginAccess();
  uint64_t v5 = *(void *)(v72 + 24);
  uint64_t v65 = v5 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(v5 + 32);
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v5 + 64);
  int64_t v66 = (unint64_t)(v6 + 63) >> 6;
  uint64_t v67 = *(void *)(v72 + 24);
  swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v10 = __clz(__rbit64(v8));
      uint64_t v11 = (v8 - 1) & v8;
      int64_t v68 = v9;
      unint64_t v12 = v10 | (v9 << 6);
      goto LABEL_25;
    }
    int64_t v13 = v9 + 1;
    if (__OFADD__(v9, 1)) {
      goto LABEL_72;
    }
    if (v13 >= v66) {
      break;
    }
    unint64_t v14 = *(void *)(v65 + 8 * v13);
    int64_t v15 = v9 + 1;
    if (!v14)
    {
      int64_t v15 = v9 + 2;
      if (v9 + 2 >= v66) {
        break;
      }
      unint64_t v14 = *(void *)(v65 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v9 + 3;
        if (v9 + 3 >= v66) {
          break;
        }
        unint64_t v14 = *(void *)(v65 + 8 * v15);
        if (!v14)
        {
          uint64_t v16 = v9 + 4;
          if (v9 + 4 >= v66) {
            break;
          }
          unint64_t v14 = *(void *)(v65 + 8 * v16);
          if (!v14)
          {
            while (1)
            {
              int64_t v15 = v16 + 1;
              if (__OFADD__(v16, 1)) {
                goto LABEL_73;
              }
              if (v15 >= v66) {
                goto LABEL_69;
              }
              unint64_t v14 = *(void *)(v65 + 8 * v15);
              ++v16;
              if (v14) {
                goto LABEL_24;
              }
            }
          }
          int64_t v15 = v9 + 4;
        }
      }
    }
LABEL_24:
    uint64_t v11 = (v14 - 1) & v14;
    int64_t v68 = v15;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
LABEL_25:
    id v17 = (uint64_t *)(*(void *)(v67 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    unint64_t v18 = v17[1];
    uint64_t v20 = *(void *)(*(void *)(v67 + 56) + 8 * v12);
    swift_bridgeObjectRetain();
    uint64_t v74 = v20;
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_1000092C4(v72);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.debug.getter();
    uint64_t v71 = v19;
    unint64_t v69 = v11;
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = swift_slowAlloc();
      v77[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v24 = 136315394;
      swift_bridgeObjectRetain();
      sub_10000E564(v19, v18, v77);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v24 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v25 = Set.description.getter();
      unint64_t v27 = v26;
      swift_bridgeObjectRelease();
      sub_10000E564(v25, v27, v77);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Currently subscribed channels for topic %s: %s", (uint8_t *)v24, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    int64_t v28 = 0;
    uint64_t v29 = v74 + 56;
    uint64_t v30 = 1 << *(unsigned char *)(v74 + 32);
    if (v30 < 64) {
      uint64_t v31 = ~(-1 << v30);
    }
    else {
      uint64_t v31 = -1;
    }
    unint64_t v32 = v31 & *(void *)(v74 + 56);
    int64_t v33 = (unint64_t)(v30 + 63) >> 6;
    uint64_t v73 = v21 + 56;
    uint64_t v70 = v21;
    if (v32)
    {
      while (1)
      {
        unint64_t v60 = __clz(__rbit64(v32));
        uint64_t v37 = (v32 - 1) & v32;
        unint64_t v38 = v60 | (v28 << 6);
LABEL_48:
        unint64_t v76 = v37;
        id v39 = (uint64_t *)(*(void *)(v74 + 48) + 16 * v38);
        uint64_t v41 = *v39;
        unint64_t v40 = v39[1];
        if (!*(void *)(v21 + 16)) {
          break;
        }
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v42 = Hasher._finalize()();
        uint64_t v43 = -1 << *(unsigned char *)(v21 + 32);
        unint64_t v44 = v42 & ~v43;
        if ((*(void *)(v73 + ((v44 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v44))
        {
          uint64_t v45 = *(void *)(v21 + 48);
          unint64_t v46 = (void *)(v45 + 16 * v44);
          BOOL v47 = *v46 == v41 && v46[1] == v40;
          if (!v47 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
          {
            uint64_t v48 = ~v43;
            do
            {
              unint64_t v44 = (v44 + 1) & v48;
              if (((*(void *)(v73 + ((v44 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v44) & 1) == 0) {
                goto LABEL_64;
              }
              uint64_t v49 = (void *)(v45 + 16 * v44);
              BOOL v50 = *v49 == v41 && v49[1] == v40;
            }
            while (!v50 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
          }
          swift_bridgeObjectRelease();
          unint64_t v32 = v76;
          if (!v76) {
            goto LABEL_34;
          }
        }
        else
        {
LABEL_64:
          int64_t v75 = v28;
          char v51 = *(void **)(v72 + 56);
          id v52 = objc_allocWithZone((Class)PKPublicChannel);
          swift_bridgeObjectRetain();
          id v53 = v51;
          NSString v54 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease();
          id v55 = [v52 initWithChannelID:v54];

          NSString v56 = String._bridgeToObjectiveC()();
          [v53 subscribeToChannel:v55 forTopic:v56];

          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain();
          unint64_t v57 = Logger.logObject.getter();
          os_log_type_t v58 = static os_log_type_t.info.getter();
          if (os_log_type_enabled(v57, v58))
          {
            uint64_t v59 = swift_slowAlloc();
            v77[0] = swift_slowAlloc();
            *(_DWORD *)uint64_t v59 = 136315394;
            swift_bridgeObjectRetain();
            *(void *)(v59 + 4) = sub_10000E564(v41, v40, v77);
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v59 + 12) = 2080;
            swift_bridgeObjectRetain();
            uint64_t v21 = v70;
            *(void *)(v59 + 14) = sub_10000E564(v71, v18, v77);
            swift_bridgeObjectRelease_n();
            _os_log_impl((void *)&_mh_execute_header, v57, v58, "Subscribed to channel: %s for topic: %s", (uint8_t *)v59, 0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {

            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
          }
          int64_t v28 = v75;
          unint64_t v32 = v76;
          if (!v76) {
            goto LABEL_34;
          }
        }
      }
      swift_bridgeObjectRetain();
      goto LABEL_64;
    }
LABEL_34:
    int64_t v34 = v28 + 1;
    if (__OFADD__(v28, 1))
    {
      __break(1u);
LABEL_71:
      __break(1u);
LABEL_72:
      __break(1u);
LABEL_73:
      __break(1u);
      goto LABEL_74;
    }
    if (v34 < v33)
    {
      unint64_t v35 = *(void *)(v29 + 8 * v34);
      ++v28;
      if (v35) {
        goto LABEL_47;
      }
      int64_t v28 = v34 + 1;
      if (v34 + 1 < v33)
      {
        unint64_t v35 = *(void *)(v29 + 8 * v28);
        if (v35) {
          goto LABEL_47;
        }
        int64_t v28 = v34 + 2;
        if (v34 + 2 < v33)
        {
          unint64_t v35 = *(void *)(v29 + 8 * v28);
          if (v35) {
            goto LABEL_47;
          }
          int64_t v36 = v34 + 3;
          if (v36 < v33)
          {
            unint64_t v35 = *(void *)(v29 + 8 * v36);
            if (v35)
            {
              int64_t v28 = v36;
LABEL_47:
              uint64_t v37 = (v35 - 1) & v35;
              unint64_t v38 = __clz(__rbit64(v35)) + (v28 << 6);
              goto LABEL_48;
            }
            while (1)
            {
              int64_t v28 = v36 + 1;
              if (__OFADD__(v36, 1)) {
                goto LABEL_71;
              }
              if (v28 >= v33) {
                break;
              }
              unint64_t v35 = *(void *)(v29 + 8 * v28);
              ++v36;
              if (v35) {
                goto LABEL_47;
              }
            }
          }
        }
      }
    }
    swift_bridgeObjectRelease();
    swift_release();
    int64_t v9 = v68;
    unint64_t v8 = v69;
    swift_bridgeObjectRelease();
  }
LABEL_69:
  swift_release();
  id v61 = *(id *)(v72 + 56);
  uint64_t v62 = swift_bridgeObjectRetain();
  sub_100037EDC(v62);
  swift_bridgeObjectRelease();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_release();
  [v61 _setEnabledTopics:isa];

  os_unfair_lock_unlock(lock);
}

uint64_t sub_1000092C4(uint64_t a1)
{
  id v1 = *(id *)(a1 + 56);
  NSString v2 = String._bridgeToObjectiveC()();
  id v11 = 0;
  id v3 = [v1 registeredChannelsForTopic:v2 error:&v11];

  id v4 = v11;
  if (v3)
  {
    sub_100010330(0, &qword_100065280);
    unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    id v6 = v4;

    uint64_t v7 = sub_10000940C(v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = v11;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease();
    uint64_t v7 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v9 = sub_1000383C8((uint64_t)v7);
  swift_bridgeObjectRelease();
  return v9;
}

char *sub_10000940C(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_17;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = _CocoaArrayWrapper.endIndex.getter())
  {
    id v3 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v4 = 4;
    while (1)
    {
      id v5 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
         : *(id *)(a1 + 8 * v4);
      id v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      id v8 = [v5 channelID];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v12 = v11;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          id v3 = sub_1000202A8(0, *((void *)v3 + 2) + 1, 1, v3);
        }
        unint64_t v14 = *((void *)v3 + 2);
        unint64_t v13 = *((void *)v3 + 3);
        if (v14 >= v13 >> 1) {
          id v3 = sub_1000202A8((char *)(v13 > 1), v14 + 1, 1, v3);
        }
        *((void *)v3 + 2) = v14 + 1;
        int64_t v15 = &v3[16 * v14];
        *((void *)v15 + 4) = v10;
        *((void *)v15 + 5) = v12;
      }
      else
      {
      }
      ++v4;
      if (v7 == v2) {
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
  }
  id v3 = (char *)&_swiftEmptyArrayStorage;
LABEL_19:
  swift_bridgeObjectRelease();
  return v3;
}

void sub_1000095A4(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  id v6 = (os_unfair_lock_s *)(*(void *)(v2 + 16) + 16);
  os_unfair_lock_lock(v6);
  if (qword_100064F68 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_100010174(v7, (uint64_t)qword_1000667D0);
  swift_bridgeObjectRetain_n();
  id v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v63 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315138;
    swift_bridgeObjectRetain();
    sub_10000E564(a1, a2, &v63);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Subscribing to a random channel on topic: %s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_beginAccess();
  uint64_t v11 = *(void *)(v3 + 24);
  if (*(void *)(v11 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v12 = sub_100034E9C(a1, a2);
    if (v13)
    {
      uint64_t v14 = *(void *)(*(void *)(v11 + 56) + 8 * v12);
      swift_endAccess();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      int64_t v15 = sub_10000A2B0(v3, a1, a2);
      uint64_t v16 = sub_10000940C((unint64_t)v15);
      uint64_t v17 = sub_1000383C8((uint64_t)v16);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      unint64_t v18 = Logger.logObject.getter();
      os_log_type_t v19 = static os_log_type_t.debug.getter();
      uint64_t v62 = v6;
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v61 = a1;
        uint64_t v20 = swift_slowAlloc();
        uint64_t v63 = swift_slowAlloc();
        *(_DWORD *)uint64_t v20 = 136315394;
        swift_bridgeObjectRetain();
        uint64_t v21 = Set.description.getter();
        unint64_t v23 = v22;
        swift_bridgeObjectRelease();
        sub_10000E564(v21, v23, &v63);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v20 + 12) = 2080;
        swift_bridgeObjectRetain();
        sub_10000E564(v61, a2, &v63);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "Currently subscribed to channels: %s, for topic %s", (uint8_t *)v20, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        a1 = v61;
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      if (*(void *)(sub_10000ECC4(v14, v17) + 16) == 1)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain_n();
        swift_retain();
        unint64_t v27 = Logger.logObject.getter();
        os_log_type_t v28 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v27, v28))
        {
          uint64_t v29 = swift_slowAlloc();
          uint64_t v63 = swift_slowAlloc();
          *(_DWORD *)uint64_t v29 = 136315394;
          swift_retain();
          uint64_t v30 = Set.description.getter();
          unint64_t v32 = v31;
          swift_release();
          sub_10000E564(v30, v32, &v63);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v29 + 12) = 2080;
          swift_bridgeObjectRetain();
          sub_10000E564(a1, a2, &v63);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v27, v28, "There already exists one valid channel subscription %s for topic: %s. Skipping new subscription.", (uint8_t *)v29, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
LABEL_30:
          swift_slowDealloc();

          goto LABEL_34;
        }

        swift_bridgeObjectRelease_n();
        swift_release_n();
LABEL_34:
        id v6 = v62;
        goto LABEL_35;
      }
      swift_release();
      swift_bridgeObjectRetain_n();
      int64_t v33 = Logger.logObject.getter();
      os_log_type_t v34 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v33, v34))
      {
        unint64_t v35 = (uint8_t *)swift_slowAlloc();
        uint64_t v63 = swift_slowAlloc();
        *(_DWORD *)unint64_t v35 = 136315138;
        swift_bridgeObjectRetain();
        sub_10000E564(a1, a2, &v63);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v33, v34, "Unsubscribing from all current channels for topic %s and subscribing to a new random channel.", v35, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      int64_t v36 = *(void **)(v3 + 56);
      sub_100010330(0, &qword_100065280);
      id v37 = v36;
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      NSString v39 = String._bridgeToObjectiveC()();
      [v37 unsubscribeFromChannels:isa forTopic:v39];

      uint64_t v40 = sub_10000A5F8(v14);
      unint64_t v42 = v41;
      swift_bridgeObjectRelease();
      if (v42)
      {
        id v43 = [*(id *)(v3 + 56) opportunisticTopics];
        if (v43)
        {
          unint64_t v44 = v43;
          uint64_t v45 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
        }
        else
        {
          uint64_t v45 = &_swiftEmptyArrayStorage;
        }
        uint64_t v49 = sub_1000383C8((uint64_t)v45);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_100035310(&v63, a1, a2);
        swift_bridgeObjectRelease();
        uint64_t v50 = v49;
        id v51 = *(id *)(v3 + 56);
        sub_100037DF4(v50);
        swift_bridgeObjectRelease();
        Class v52 = Array._bridgeToObjectiveC()().super.isa;
        swift_release();
        [v51 _setOpportunisticTopics:v52];

        id v53 = *(void **)(v3 + 56);
        id v54 = objc_allocWithZone((Class)PKPublicChannel);
        id v55 = v53;
        swift_bridgeObjectRetain();
        NSString v56 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        id v57 = [v54 initWithChannelID:v56];

        NSString v58 = String._bridgeToObjectiveC()();
        [v55 subscribeToChannel:v57 forTopic:v58];

        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        unint64_t v27 = Logger.logObject.getter();
        os_log_type_t v59 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v27, v59))
        {
          uint64_t v60 = swift_slowAlloc();
          uint64_t v63 = swift_slowAlloc();
          *(_DWORD *)uint64_t v60 = 136315394;
          swift_bridgeObjectRetain();
          sub_10000E564(v40, v42, &v63);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v60 + 12) = 2080;
          swift_bridgeObjectRetain();
          sub_10000E564(a1, a2, &v63);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v27, v59, "Subscribed to random channel: %s for topic: %s", (uint8_t *)v60, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          goto LABEL_30;
        }

        swift_bridgeObjectRelease_n();
      }
      else
      {
        swift_bridgeObjectRetain_n();
        unint64_t v46 = Logger.logObject.getter();
        uint64_t v47 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v46, (os_log_type_t)v47))
        {
          uint64_t v48 = (uint8_t *)swift_slowAlloc();
          uint64_t v63 = swift_slowAlloc();
          *(_DWORD *)uint64_t v48 = 136315138;
          swift_bridgeObjectRetain();
          sub_10000E564(a1, a2, &v63);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v46, (os_log_type_t)v47, "No channel options are provided for topic %s. Failed to register new random channel for this topic.", v48, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          goto LABEL_34;
        }
      }
      swift_bridgeObjectRelease_n();
      goto LABEL_34;
    }
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  swift_bridgeObjectRetain_n();
  uint64_t v24 = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v24, v25))
  {
    unint64_t v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v63 = swift_slowAlloc();
    *(_DWORD *)unint64_t v26 = 136315138;
    swift_bridgeObjectRetain();
    sub_10000E564(a1, a2, &v63);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "There is no channel for topic: %s", v26, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
LABEL_35:
  os_unfair_lock_unlock(v6);
}

void *sub_10000A2B0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  id v5 = *(id *)(a1 + 56);
  NSString v6 = String._bridgeToObjectiveC()();
  id v19 = 0;
  id v7 = [v5 registeredChannelsForTopic:v6 error:&v19];

  id v8 = v19;
  if (v7)
  {
    sub_100010330(0, &qword_100065280);
    uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    id v10 = v8;
  }
  else
  {
    id v11 = v19;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    if (qword_100064F68 != -1) {
      swift_once();
    }
    uint64_t v12 = type metadata accessor for Logger();
    sub_100010174(v12, (uint64_t)qword_1000667D0);
    swift_bridgeObjectRetain();
    swift_errorRetain();
    swift_bridgeObjectRetain();
    swift_errorRetain();
    char v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v16 = (void *)swift_slowAlloc();
      id v19 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315394;
      swift_bridgeObjectRetain();
      sub_10000E564(a2, a3, (uint64_t *)&v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v15 + 12) = 2112;
      swift_errorRetain();
      uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v16 = v18;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Failed at querying registered channes for topic: %s -- %@", (uint8_t *)v15, 0x16u);
      sub_10000E508(&qword_100065290);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_bridgeObjectRelease_n();
      swift_errorRelease();
      swift_errorRelease();
    }
    return &_swiftEmptyArrayStorage;
  }
  return (void *)v9;
}

uint64_t sub_10000A5F8(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return 0;
  }
  unint64_t v3 = sub_10000EC38(v2);
  uint64_t result = sub_10000F858(a1);
  if ((v3 & 0x8000000000000000) == 0)
  {
    uint64_t v7 = result;
    uint64_t v8 = v5;
    char v9 = v6;
    uint64_t v10 = v6 & 1;
    if (v3)
    {
      sub_1000102D4(result, v5, v6 & 1);
      int64_t v11 = v7;
      uint64_t v18 = v8;
      do
      {
        uint64_t v12 = v8;
        uint64_t v13 = v11;
        char v14 = v10 & 1;
        int64_t v11 = sub_10000F8F8(v11, v8, v10 & 1, a1);
        uint64_t v8 = v15;
        uint64_t v10 = v16 & 1;
        sub_1000102C8(v13, v12, v14);
        --v3;
      }
      while (v3);
      sub_1000102C8(v7, v18, v9 & 1);
    }
    else
    {
      int64_t v11 = result;
    }
    uint64_t v17 = sub_10000F9DC(v11, v8, v10, a1);
    swift_bridgeObjectRetain();
    sub_1000102C8(v11, v8, v10);
    return v17;
  }
  __break(1u);
  return result;
}

void sub_10000A730()
{
  id v1 = (id *)v0;
  unint64_t v2 = *(void *)(v0 + 16) + 16;
  os_unfair_lock_lock((os_unfair_lock_t)v2);
  if (qword_100064F68 != -1) {
    goto LABEL_39;
  }
  while (1)
  {
    uint64_t v3 = type metadata accessor for Logger();
    sub_100010174(v3, (uint64_t)qword_1000667D0);
    uint64_t v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v4, v5))
    {
      char v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Unsubscribing all topics and channels", v6, 2u);
      swift_slowDealloc();
    }

    uint64_t v7 = sub_10000AF34((uint64_t)v1);
    swift_bridgeObjectRetain_n();
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.info.getter();
    id v55 = v1;
    NSString v56 = v7;
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      id v64 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v11 = Array.description.getter();
      unint64_t v13 = v12;
      swift_bridgeObjectRelease();
      sub_10000E564(v11, v13, (uint64_t *)&v64);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "unregistering channels from topics: %s", v10, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v61 = (os_unfair_lock_s *)v7[2];
    if (!v61) {
      break;
    }
    id v54 = (os_unfair_lock_s *)v2;
    unint64_t v2 = 0;
    uint64_t v60 = v7 + 4;
    while (v2 < v7[2])
    {
      uint64_t v15 = &v60[2 * v2];
      uint64_t v16 = *v15;
      unint64_t v17 = v15[1];
      id v18 = v1[7];
      swift_bridgeObjectRetain();
      id v19 = v18;
      uint64_t v63 = v16;
      NSString v20 = String._bridgeToObjectiveC()();
      id v64 = 0;
      id v21 = [v19 registeredChannelsForTopic:v20 error:&v64];

      id v22 = v64;
      if (v21)
      {
        sub_100010330(0, &qword_100065280);
        uint64_t v62 = v21;
        unint64_t v23 = v17;
        unint64_t v24 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
        swift_bridgeObjectRetain_n();
        id v25 = v22;
        swift_bridgeObjectRetain();
        unint64_t v26 = Logger.logObject.getter();
        os_log_type_t v59 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v26, v59))
        {
          unint64_t v58 = v23;
          uint64_t v27 = swift_slowAlloc();
          id v1 = (id *)swift_slowAlloc();
          id v64 = v1;
          *(_DWORD *)uint64_t v27 = 136315394;
          if (v24 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v28 = _CocoaArrayWrapper.endIndex.getter();
          }
          else
          {
            uint64_t v28 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain();
          }
          log = v26;
          if (v28)
          {
            if (v28 < 1) {
              goto LABEL_38;
            }
            uint64_t v29 = 0;
            uint64_t v30 = (char *)_swiftEmptyArrayStorage;
            do
            {
              if ((v24 & 0xC000000000000001) != 0) {
                id v31 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
              }
              else {
                id v31 = *(id *)(v24 + 8 * v29 + 32);
              }
              id v32 = v31;
              id v33 = [v32 channelID];
              if (v33)
              {
                os_log_type_t v34 = v33;
                uint64_t v35 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                uint64_t v37 = v36;

                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                  uint64_t v30 = sub_1000202A8(0, *((void *)v30 + 2) + 1, 1, v30);
                }
                unint64_t v39 = *((void *)v30 + 2);
                unint64_t v38 = *((void *)v30 + 3);
                if (v39 >= v38 >> 1) {
                  uint64_t v30 = sub_1000202A8((char *)(v38 > 1), v39 + 1, 1, v30);
                }
                *((void *)v30 + 2) = v39 + 1;
                uint64_t v40 = &v30[16 * v39];
                *((void *)v40 + 4) = v35;
                *((void *)v40 + 5) = v37;
              }
              else
              {
              }
              ++v29;
            }
            while (v28 != v29);
          }
          swift_bridgeObjectRelease();
          uint64_t v41 = Array.description.getter();
          unint64_t v43 = v42;
          swift_bridgeObjectRelease();
          *(void *)(v27 + 4) = sub_10000E564(v41, v43, (uint64_t *)&v64);
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v27 + 12) = 2080;
          swift_bridgeObjectRetain();
          *(void *)(v27 + 14) = sub_10000E564(v63, v58, (uint64_t *)&v64);
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, log, v59, "Unsubscribed channels: %s for topic: %s", (uint8_t *)v27, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          id v1 = v55;
          uint64_t v7 = v56;
        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
        }
        id v44 = v1[7];
        NSString v45 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        [v44 unsubscribeFromChannels:v62 forTopic:v45];
      }
      else
      {
        id v14 = v64;
        swift_bridgeObjectRelease();
        _convertNSErrorToError(_:)();

        swift_willThrow();
        swift_errorRelease();
      }
      if ((os_unfair_lock_s *)++v2 == v61)
      {
        swift_bridgeObjectRelease();
        unint64_t v2 = (unint64_t)v54;
        goto LABEL_36;
      }
    }
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    swift_once();
  }
  swift_bridgeObjectRelease();
LABEL_36:
  id v46 = v1[7];
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  [v46 _setEnabledTopics:isa];

  id v48 = v1[7];
  Class v49 = Array._bridgeToObjectiveC()().super.isa;
  [v48 _setOpportunisticTopics:v49];

  id v50 = v1[7];
  Class v51 = Array._bridgeToObjectiveC()().super.isa;
  [v50 _setIgnoredTopics:v51];

  id v52 = v1[7];
  Class v53 = Array._bridgeToObjectiveC()().super.isa;
  [v52 _setNonWakingTopics:v53];

  os_unfair_lock_unlock((os_unfair_lock_t)v2);
}

void *sub_10000AF34(uint64_t a1)
{
  os_log_type_t v34 = &_swiftEmptySetSingleton;
  id v2 = [*(id *)(a1 + 56) enabledTopics];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v5 = v4[2];
    if (!v5) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v4 = _swiftEmptyArrayStorage;
    uint64_t v5 = _swiftEmptyArrayStorage[2];
    if (!v5) {
      goto LABEL_7;
    }
  }
  char v6 = v4 + 5;
  do
  {
    Swift::Int v7 = *(v6 - 1);
    Swift::Int v8 = *v6;
    swift_bridgeObjectRetain();
    sub_100035310(&v33, v7, v8);
    swift_bridgeObjectRelease();
    v6 += 2;
    --v5;
  }
  while (v5);
LABEL_7:
  swift_bridgeObjectRelease();
  id v9 = [*(id *)(a1 + 56) opportunisticTopics];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v12 = v11[2];
    if (!v12) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v11 = _swiftEmptyArrayStorage;
    uint64_t v12 = _swiftEmptyArrayStorage[2];
    if (!v12) {
      goto LABEL_13;
    }
  }
  unint64_t v13 = v11 + 5;
  do
  {
    Swift::Int v14 = *(v13 - 1);
    Swift::Int v15 = *v13;
    swift_bridgeObjectRetain();
    sub_100035310(&v33, v14, v15);
    swift_bridgeObjectRelease();
    v13 += 2;
    --v12;
  }
  while (v12);
LABEL_13:
  swift_bridgeObjectRelease();
  id v16 = [*(id *)(a1 + 56) ignoredTopics];
  if (v16)
  {
    unint64_t v17 = v16;
    id v18 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v19 = v18[2];
    if (!v19) {
      goto LABEL_19;
    }
  }
  else
  {
    id v18 = _swiftEmptyArrayStorage;
    uint64_t v19 = _swiftEmptyArrayStorage[2];
    if (!v19) {
      goto LABEL_19;
    }
  }
  NSString v20 = v18 + 5;
  do
  {
    Swift::Int v21 = *(v20 - 1);
    Swift::Int v22 = *v20;
    swift_bridgeObjectRetain();
    sub_100035310(&v33, v21, v22);
    swift_bridgeObjectRelease();
    v20 += 2;
    --v19;
  }
  while (v19);
LABEL_19:
  swift_bridgeObjectRelease();
  id v23 = [*(id *)(a1 + 56) nonWakingTopics];
  if (v23)
  {
    unint64_t v24 = v23;
    id v25 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v26 = v25[2];
    if (!v26) {
      goto LABEL_25;
    }
  }
  else
  {
    id v25 = _swiftEmptyArrayStorage;
    uint64_t v26 = _swiftEmptyArrayStorage[2];
    if (!v26) {
      goto LABEL_25;
    }
  }
  uint64_t v27 = v25 + 5;
  do
  {
    Swift::Int v28 = *(v27 - 1);
    Swift::Int v29 = *v27;
    swift_bridgeObjectRetain();
    sub_100035310(&v33, v28, v29);
    swift_bridgeObjectRelease();
    v27 += 2;
    --v26;
  }
  while (v26);
LABEL_25:
  swift_bridgeObjectRelease();
  swift_beginAccess();
  uint64_t v30 = swift_bridgeObjectRetain();
  sub_10000B200(v30);
  id v31 = sub_100037DF4((uint64_t)v34);
  swift_bridgeObjectRelease();
  return v31;
}

uint64_t sub_10000B200(uint64_t result)
{
  uint64_t v1 = result;
  int64_t v2 = 0;
  uint64_t v3 = result + 64;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    int64_t v13 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
LABEL_27:
      __break(1u);
      return result;
    }
    if (v13 >= v7) {
      goto LABEL_23;
    }
    unint64_t v14 = *(void *)(v3 + 8 * v13);
    ++v2;
    if (!v14)
    {
      int64_t v2 = v13 + 1;
      if (v13 + 1 >= v7) {
        goto LABEL_23;
      }
      unint64_t v14 = *(void *)(v3 + 8 * v2);
      if (!v14)
      {
        int64_t v2 = v13 + 2;
        if (v13 + 2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v14 = *(void *)(v3 + 8 * v2);
        if (!v14)
        {
          int64_t v2 = v13 + 3;
          if (v13 + 3 >= v7) {
            goto LABEL_23;
          }
          unint64_t v14 = *(void *)(v3 + 8 * v2);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v14 - 1) & v14;
    unint64_t v9 = __clz(__rbit64(v14)) + (v2 << 6);
LABEL_5:
    uint64_t v10 = (Swift::Int *)(*(void *)(v1 + 48) + 16 * v9);
    Swift::Int v11 = *v10;
    Swift::Int v12 = v10[1];
    swift_bridgeObjectRetain();
    sub_100035310(&v16, v11, v12);
    uint64_t result = swift_bridgeObjectRelease();
  }
  int64_t v15 = v13 + 4;
  if (v15 < v7)
  {
    unint64_t v14 = *(void *)(v3 + 8 * v15);
    if (!v14)
    {
      while (1)
      {
        int64_t v2 = v15 + 1;
        if (__OFADD__(v15, 1)) {
          goto LABEL_27;
        }
        if (v2 >= v7) {
          goto LABEL_23;
        }
        unint64_t v14 = *(void *)(v3 + 8 * v2);
        ++v15;
        if (v14) {
          goto LABEL_22;
        }
      }
    }
    int64_t v2 = v15;
    goto LABEL_22;
  }
LABEL_23:

  return swift_release();
}

uint64_t sub_10000B380()
{
  uint64_t v1 = (os_unfair_lock_s *)(v0[2] + 16);
  os_unfair_lock_lock(v1);
  _StringGuts.grow(_:)(42);
  uint64_t v2 = _typeName(_:qualified:)();
  swift_bridgeObjectRelease();
  uint64_t v10 = v2;
  v3._object = (void *)0x8000000100055A70;
  v3._countAndFlagsBits = 0xD000000000000011;
  String.append(_:)(v3);
  uint64_t v4 = v0[5];
  uint64_t v5 = (void *)v0[6];
  swift_bridgeObjectRetain();
  v6._countAndFlagsBits = v4;
  v6._object = v5;
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  v7._countAndFlagsBits = 0xD000000000000013;
  v7._object = (void *)0x8000000100055A90;
  String.append(_:)(v7);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_10000E508(&qword_100065238);
  v8._countAndFlagsBits = Dictionary.description.getter();
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v1);
  return v10;
}

uint64_t sub_10000B508()
{
  lock = (os_unfair_lock_s *)(*(void *)(v0 + 16) + 16);
  os_unfair_lock_lock(lock);
  uint64_t v1 = (void *)sub_100025734((uint64_t)_swiftEmptyArrayStorage);
  swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = *(void *)(v2 + 64);
  uint64_t v37 = v2 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & v3;
  int64_t v38 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v39 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v7 << 6);
    }
    else
    {
      int64_t v11 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        goto LABEL_43;
      }
      if (v11 >= v38)
      {
LABEL_39:
        swift_release();
        os_unfair_lock_unlock(lock);
        return (uint64_t)v1;
      }
      unint64_t v12 = *(void *)(v37 + 8 * v11);
      ++v7;
      if (!v12)
      {
        int64_t v7 = v11 + 1;
        if (v11 + 1 >= v38) {
          goto LABEL_39;
        }
        unint64_t v12 = *(void *)(v37 + 8 * v7);
        if (!v12)
        {
          int64_t v7 = v11 + 2;
          if (v11 + 2 >= v38) {
            goto LABEL_39;
          }
          unint64_t v12 = *(void *)(v37 + 8 * v7);
          if (!v12)
          {
            int64_t v13 = v11 + 3;
            if (v13 >= v38) {
              goto LABEL_39;
            }
            unint64_t v12 = *(void *)(v37 + 8 * v13);
            if (!v12)
            {
              while (1)
              {
                int64_t v7 = v13 + 1;
                if (__OFADD__(v13, 1)) {
                  goto LABEL_44;
                }
                if (v7 >= v38) {
                  goto LABEL_39;
                }
                unint64_t v12 = *(void *)(v37 + 8 * v7);
                ++v13;
                if (v12) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v7 = v13;
          }
        }
      }
LABEL_21:
      unint64_t v6 = (v12 - 1) & v12;
      unint64_t v10 = __clz(__rbit64(v12)) + (v7 << 6);
    }
    unint64_t v14 = (uint64_t *)(*(void *)(v39 + 48) + 16 * v10);
    uint64_t v16 = *v14;
    uint64_t v15 = v14[1];
    uint64_t v17 = *(void *)(*(void *)(v39 + 56) + 8 * v10);
    uint64_t v18 = *(void *)(v17 + 16);
    if (v18)
    {
      uint64_t v40 = *v14;
      sub_10000E508(&qword_100065298);
      uint64_t v19 = (void *)swift_allocObject();
      int64_t v20 = j__malloc_size(v19);
      uint64_t v21 = v20 - 32;
      if (v20 < 32) {
        uint64_t v21 = v20 - 17;
      }
      v19[2] = v18;
      v19[3] = 2 * (v21 >> 4);
      uint64_t v41 = sub_100037FC8((uint64_t)&v42, v19 + 4, v18, v17);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_1000102E0();
      if (v41 != v18) {
        goto LABEL_41;
      }
      swift_bridgeObjectRelease();
      uint64_t v16 = v40;
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v19 = _swiftEmptyArrayStorage;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v42 = v1;
    unint64_t v24 = sub_100034E9C(v16, v15);
    uint64_t v25 = v1[2];
    BOOL v26 = (v23 & 1) == 0;
    uint64_t v27 = v25 + v26;
    if (__OFADD__(v25, v26)) {
      break;
    }
    char v28 = v23;
    if (v1[3] >= v27)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t v1 = v42;
        if (v23) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_10002145C();
        uint64_t v1 = v42;
        if (v28) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      sub_100036184(v27, isUniquelyReferenced_nonNull_native);
      unint64_t v29 = sub_100034E9C(v16, v15);
      if ((v28 & 1) != (v30 & 1)) {
        goto LABEL_45;
      }
      unint64_t v24 = v29;
      uint64_t v1 = v42;
      if (v28)
      {
LABEL_4:
        uint64_t v8 = v1[7];
        swift_bridgeObjectRelease();
        *(void *)(v8 + 8 * v24) = v19;
        goto LABEL_5;
      }
    }
    v1[(v24 >> 6) + 8] |= 1 << v24;
    id v31 = (uint64_t *)(v1[6] + 16 * v24);
    *id v31 = v16;
    v31[1] = v15;
    *(void *)(v1[7] + 8 * v24) = v19;
    uint64_t v32 = v1[2];
    BOOL v33 = __OFADD__(v32, 1);
    uint64_t v34 = v32 + 1;
    if (v33) {
      goto LABEL_42;
    }
    v1[2] = v34;
    swift_bridgeObjectRetain();
LABEL_5:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
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
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_10000B8D4()
{
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(v0 + 16) + 16);
  os_unfair_lock_lock(v1);
  uint64_t v54 = v0;
  uint64_t v2 = sub_10000BF14(v0);
  NSString v56 = (void *)sub_100025734((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v53 = v2[2];
  if (v53)
  {
    os_unfair_lock_t lock = v1;
    unint64_t v3 = 0;
    id v52 = v2 + 4;
    Class v51 = v2;
    while (1)
    {
      if (v3 >= v2[2])
      {
        __break(1u);
LABEL_43:
        __break(1u);
LABEL_44:
        __break(1u);
LABEL_45:
        __break(1u);
      }
      uint64_t v5 = &v52[2 * v3];
      uint64_t v7 = *v5;
      unint64_t v6 = v5[1];
      uint64_t v8 = *(void **)(v54 + 56);
      swift_bridgeObjectRetain();
      id v9 = v8;
      NSString v10 = String._bridgeToObjectiveC()();
      id v58 = 0;
      id v11 = [v9 registeredChannelsForTopic:v10 error:&v58];

      id v12 = v58;
      uint64_t v57 = v7;
      if (!v11)
      {
        id v28 = v58;
        _convertNSErrorToError(_:)();

        swift_willThrow();
        if (qword_100064F68 != -1) {
          swift_once();
        }
        uint64_t v29 = type metadata accessor for Logger();
        sub_100010174(v29, (uint64_t)qword_1000667D0);
        swift_errorRetain();
        swift_bridgeObjectRetain();
        swift_errorRetain();
        char v30 = Logger.logObject.getter();
        os_log_type_t v31 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v30, v31))
        {
          uint64_t v32 = swift_slowAlloc();
          BOOL v33 = (void *)swift_slowAlloc();
          id v58 = (id)swift_slowAlloc();
          *(_DWORD *)uint64_t v32 = 136315394;
          swift_bridgeObjectRetain();
          *(void *)(v32 + 4) = sub_10000E564(v7, v6, (uint64_t *)&v58);
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v32 + 12) = 2112;
          swift_errorRetain();
          uint64_t v34 = _swift_stdlib_bridgeErrorToNSError();
          *(void *)(v32 + 14) = v34;
          *BOOL v33 = v34;
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl((void *)&_mh_execute_header, v30, v31, "Failed at fetching registered channels for topic: %s - %@", (uint8_t *)v32, 0x16u);
          sub_10000E508(&qword_100065290);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_arrayDestroy();
          uint64_t v2 = v51;
          swift_slowDealloc();
          swift_slowDealloc();

          swift_errorRelease();
        }
        else
        {
          swift_errorRelease();
          swift_bridgeObjectRelease_n();
          swift_errorRelease();
          swift_errorRelease();
        }
        goto LABEL_5;
      }
      uint64_t v55 = v6;
      sub_100010330(0, &qword_100065280);
      unint64_t v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
      id v14 = v12;

      if (v13 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
        if (v15)
        {
LABEL_10:
          if (v15 < 1) {
            goto LABEL_44;
          }
          uint64_t v16 = 0;
          uint64_t v17 = (char *)_swiftEmptyArrayStorage;
          do
          {
            if ((v13 & 0xC000000000000001) != 0) {
              id v18 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
            }
            else {
              id v18 = *(id *)(v13 + 8 * v16 + 32);
            }
            id v19 = v18;
            id v20 = [v19 channelID];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
              uint64_t v24 = v23;

              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v17 = sub_1000202A8(0, *((void *)v17 + 2) + 1, 1, v17);
              }
              unint64_t v26 = *((void *)v17 + 2);
              unint64_t v25 = *((void *)v17 + 3);
              if (v26 >= v25 >> 1) {
                uint64_t v17 = sub_1000202A8((char *)(v25 > 1), v26 + 1, 1, v17);
              }
              *((void *)v17 + 2) = v26 + 1;
              uint64_t v27 = &v17[16 * v26];
              *((void *)v27 + 4) = v22;
              *((void *)v27 + 5) = v24;
            }
            else
            {
            }
            ++v16;
          }
          while (v15 != v16);
          goto LABEL_30;
        }
      }
      else
      {
        uint64_t v15 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v15) {
          goto LABEL_10;
        }
      }
      uint64_t v17 = (char *)_swiftEmptyArrayStorage;
LABEL_30:
      swift_bridgeObjectRelease_n();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      id v58 = v56;
      unint64_t v37 = sub_100034E9C(v57, v55);
      uint64_t v38 = v56[2];
      BOOL v39 = (v36 & 1) == 0;
      uint64_t v40 = v38 + v39;
      if (__OFADD__(v38, v39)) {
        goto LABEL_43;
      }
      char v41 = v36;
      if (v56[3] >= v40)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          sub_10002145C();
        }
      }
      else
      {
        sub_100036184(v40, isUniquelyReferenced_nonNull_native);
        unint64_t v42 = sub_100034E9C(v57, v55);
        if ((v41 & 1) != (v43 & 1))
        {
          uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
          __break(1u);
          return result;
        }
        unint64_t v37 = v42;
      }
      id v44 = v58;
      NSString v56 = v58;
      if (v41)
      {
        uint64_t v4 = *((void *)v58 + 7);
        swift_bridgeObjectRelease();
        *(void *)(v4 + 8 * v37) = v17;
      }
      else
      {
        *((void *)v58 + (v37 >> 6) + 8) |= 1 << v37;
        NSString v45 = (uint64_t *)(v44[6] + 16 * v37);
        uint64_t *v45 = v57;
        v45[1] = v55;
        *(void *)(v44[7] + 8 * v37) = v17;
        uint64_t v46 = v44[2];
        BOOL v47 = __OFADD__(v46, 1);
        uint64_t v48 = v46 + 1;
        if (v47) {
          goto LABEL_45;
        }
        v44[2] = v48;
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v2 = v51;
LABEL_5:
      if (++v3 == v53)
      {
        swift_bridgeObjectRelease();
        uint64_t v1 = lock;
        goto LABEL_41;
      }
    }
  }
  swift_bridgeObjectRelease();
LABEL_41:
  os_unfair_lock_unlock(v1);
  return (uint64_t)v56;
}

void *sub_10000BF14(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 56) enabledTopics];
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  unint64_t v3 = result;
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  sub_10000C064(v4);
  uint64_t result = [*(id *)(a1 + 56) opportunisticTopics];
  if (!result)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = result;
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  sub_10000C064(v6);
  uint64_t result = [*(id *)(a1 + 56) ignoredTopics];
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v7 = result;
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  sub_10000C064(v8);
  uint64_t result = [*(id *)(a1 + 56) nonWakingTopics];
  if (result)
  {
    id v9 = result;
    uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    sub_10000C064(v10);
    return _swiftEmptyArrayStorage;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_10000C064(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  unint64_t v3 = sub_1000202A8(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v10 = (unint64_t)&v3[16 * v9 + 32];
  if (a1 + 32 < v10 + 16 * v8 && v10 < a1 + 32 + 16 * v8) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = *((void *)v3 + 2);
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    *((void *)v3 + 2) = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000C1BC(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
    swift_bridgeObjectRelease();
    *uint64_t v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_10000F624(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return specialized Array._endMutation()();
}

id *sub_10000C388()
{
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_10000C3D8()
{
  sub_10000C388();

  return _swift_deallocClassInstance(v0, 80, 7);
}

uint64_t type metadata accessor for NotificationRegistry()
{
  return self;
}

uint64_t sub_10000C430()
{
  return sub_10000B380();
}

id sub_10000C68C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t type metadata accessor for MLHostAPSListener()
{
  return self;
}

uint64_t sub_10000C6FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 48);
}

void sub_10000C704()
{
  type metadata accessor for Date();
  if (v0 <= 0x3F)
  {
    type metadata accessor for TaskDefinition();
    if (v1 <= 0x3F)
    {
      sub_10000E4B0();
      if (v2 <= 0x3F)
      {
        type metadata accessor for Optional();
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

uint64_t *sub_10000C858(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v37 = type metadata accessor for Date();
  uint64_t v3 = *(void *)(v37 - 8);
  int v4 = *(_DWORD *)(v3 + 80);
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(v3 + 64);
  uint64_t v36 = type metadata accessor for TaskDefinition();
  uint64_t v7 = *(void *)(v36 - 8);
  int v8 = *(_DWORD *)(v7 + 80);
  uint64_t v9 = v6 + v8;
  uint64_t v10 = *(void *)(v7 + 64);
  uint64_t v39 = type metadata accessor for MLHostSystemParameters();
  uint64_t v11 = *(void *)(v39 - 8);
  uint64_t v12 = *(_DWORD *)(v11 + 80);
  uint64_t v13 = v10 + v12;
  if (*(_DWORD *)(v11 + 84)) {
    uint64_t v14 = *(void *)(v11 + 64);
  }
  else {
    uint64_t v14 = *(void *)(v11 + 64) + 1;
  }
  uint64_t v42 = *(void *)(a3 + 16);
  uint64_t v15 = *(void *)(v42 - 8);
  uint64_t v40 = v15;
  uint64_t v16 = *(_DWORD *)(v15 + 80);
  size_t __n = v14;
  if (*(_DWORD *)(v15 + 84)) {
    uint64_t v17 = *(void *)(*(void *)(v42 - 8) + 64);
  }
  else {
    uint64_t v17 = *(void *)(*(void *)(v42 - 8) + 64) + 1;
  }
  unint64_t v18 = v8 | (unint64_t)v4 | v12 | v16;
  if (v18 > 7
    || ((v8 | v4 | *(_DWORD *)(v11 + 80) | *(_DWORD *)(v15 + 80)) & 0x100000) != 0
    || v17
     + ((v14
       + *(_DWORD *)(v15 + 80)
       + ((v13
         + ((v9 + ((v4 + 8) & ~(unint64_t)v4)) & ~(unint64_t)v8)) & ~v12)) & ~(unint64_t)*(_DWORD *)(v15 + 80)) > 0x18)
  {
    uint64_t v21 = *a2;
    *a1 = *a2;
    uint64_t v22 = (uint64_t *)(v21 + ((v18 & 0xF8 ^ 0x1F8) & (v18 + 16)));
    swift_retain();
  }
  else
  {
    unint64_t v23 = ~(unint64_t)v8;
    uint64_t v24 = ~v12;
    size_t v34 = v17;
    uint64_t v35 = ~v16;
    *a1 = *a2;
    unint64_t v25 = ((unint64_t)a1 + v4 + 8) & ~(unint64_t)v4;
    uint64_t v26 = ((unint64_t)a2 + v5 + 8) & ~v5;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 16))(v25, v26, v37);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 16))((v25 + v9) & v23, (v26 + v9) & v23, v36);
    uint64_t v27 = (void *)((((v25 + v9) & v23) + v13) & v24);
    id v28 = (const void *)((((v26 + v9) & v23) + v13) & v24);
    if ((*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v11 + 48))((((v26 + v9) & v23) + v13) & v24, 1, v39))
    {
      size_t v29 = __n;
      memcpy(v27, v28, __n);
      uint64_t v30 = v42;
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v27, v28, v39);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v27, 0, 1, v39);
      uint64_t v30 = v42;
      size_t v29 = __n;
    }
    os_log_type_t v31 = (void *)(((unint64_t)v27 + v29 + v16) & v35);
    uint64_t v32 = (const void *)(((unint64_t)v28 + v29 + v16) & v35);
    uint64_t v22 = a1;
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v40 + 48))(v32, 1, v30))
    {
      memcpy(v31, v32, v34);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v40 + 16))(v31, v32, v30);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v40 + 56))(v31, 0, 1, v30);
    }
  }
  return v22;
}

uint64_t sub_10000CC5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = v5 + 8;
  unint64_t v7 = (a1 + *(unsigned __int8 *)(v5 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v8 = *(void *)(v6 + 56);
  uint64_t v9 = type metadata accessor for TaskDefinition();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = v10 + 8;
  unint64_t v12 = (v7 + v8 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  (*(void (**)(unint64_t, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v13 = *(void *)(v11 + 56);
  uint64_t v14 = type metadata accessor for MLHostSystemParameters();
  uint64_t v15 = *(void *)(v14 - 8);
  unint64_t v16 = (v12 + v13 + *(unsigned __int8 *)(v15 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v15 + 48))(v16, 1, v14)) {
    (*(void (**)(unint64_t, uint64_t))(v15 + 8))(v16, v14);
  }
  uint64_t v17 = *(void *)(a2 + 16);
  uint64_t v22 = *(void *)(v17 - 8);
  unint64_t v18 = *(void *)(v15 + 64) + v16;
  if (!*(_DWORD *)(v15 + 84)) {
    ++v18;
  }
  unint64_t v19 = (v18 + *(unsigned __int8 *)(v22 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48))(v19, 1, v17);
  if (!result)
  {
    uint64_t v21 = *(uint64_t (**)(unint64_t, uint64_t))(v22 + 8);
    return v21(v19, v17);
  }
  return result;
}

void *sub_10000CE80(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7 + 16;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = ((unint64_t)a1 + v9 + 8) & ~v9;
  uint64_t v11 = ((unint64_t)a2 + v9 + 8) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v10, v11, v6);
  uint64_t v12 = *(void *)(v8 + 48);
  uint64_t v13 = type metadata accessor for TaskDefinition();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = v14 + 16;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = (v12 + v16 + v10) & ~v16;
  uint64_t v18 = (v12 + v16 + v11) & ~v16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v17, v18, v13);
  uint64_t v19 = *(void *)(v15 + 48);
  uint64_t v20 = type metadata accessor for MLHostSystemParameters();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v23 = v19 + v22;
  uint64_t v24 = (void *)((v19 + v22 + v17) & ~v22);
  unint64_t v25 = (const void *)((v23 + v18) & ~v22);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v21 + 48))(v25, 1, v20))
  {
    int v26 = *(_DWORD *)(v21 + 84);
    uint64_t v27 = *(void *)(v21 + 64);
    if (v26) {
      size_t v28 = *(void *)(v21 + 64);
    }
    else {
      size_t v28 = v27 + 1;
    }
    memcpy(v24, v25, v28);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v21 + 16))(v24, v25, v20);
    uint64_t v30 = *(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56);
    uint64_t v29 = v21 + 56;
    v30(v24, 0, 1, v20);
    int v26 = *(_DWORD *)(v29 + 28);
    uint64_t v27 = *(void *)(v29 + 8);
  }
  if (v26) {
    uint64_t v31 = v27;
  }
  else {
    uint64_t v31 = v27 + 1;
  }
  uint64_t v32 = *(void *)(a3 + 16);
  uint64_t v33 = *(void *)(v32 - 8);
  uint64_t v34 = *(unsigned __int8 *)(v33 + 80);
  uint64_t v35 = v31 + v34;
  uint64_t v36 = (void *)(((unint64_t)v24 + v35) & ~v34);
  uint64_t v37 = (const void *)(((unint64_t)v25 + v35) & ~v34);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v33 + 48))(v37, 1, v32))
  {
    if (*(_DWORD *)(v33 + 84)) {
      size_t v38 = *(void *)(v33 + 64);
    }
    else {
      size_t v38 = *(void *)(v33 + 64) + 1;
    }
    memcpy(v36, v37, v38);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v33 + 16))(v36, v37, v32);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v33 + 56))(v36, 0, 1, v32);
  }
  return a1;
}

void *sub_10000D140(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7 + 24;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = ((unint64_t)a1 + v9 + 8) & ~v9;
  uint64_t v11 = ((unint64_t)a2 + v9 + 8) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(v10, v11, v6);
  uint64_t v12 = *(void *)(v8 + 40);
  uint64_t v13 = type metadata accessor for TaskDefinition();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = v14 + 24;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = (v12 + v16 + v10) & ~v16;
  uint64_t v18 = (v12 + v16 + v11) & ~v16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 24))(v17, v18, v13);
  uint64_t v19 = *(void *)(v15 + 40);
  uint64_t v20 = type metadata accessor for MLHostSystemParameters();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v23 = v19 + v22;
  uint64_t v24 = (void *)((v19 + v22 + v17) & ~v22);
  unint64_t v25 = (void *)((v23 + v18) & ~v22);
  int v26 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v21 + 48);
  LODWORD(v18) = v26(v24, 1, v20);
  int v27 = v26(v25, 1, v20);
  if (v18)
  {
    if (!v27)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 16))(v24, v25, v20);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v24, 0, 1, v20);
      goto LABEL_12;
    }
    int v28 = *(_DWORD *)(v21 + 84);
    size_t v29 = *(void *)(v21 + 64);
  }
  else
  {
    if (!v27)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 24))(v24, v25, v20);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v21 + 8))(v24, v20);
    int v28 = *(_DWORD *)(v21 + 84);
    size_t v29 = *(void *)(v21 + 64);
  }
  if (v28) {
    size_t v30 = v29;
  }
  else {
    size_t v30 = v29 + 1;
  }
  memcpy(v24, v25, v30);
LABEL_12:
  uint64_t v31 = *(void *)(v21 + 64);
  if (!*(_DWORD *)(v21 + 84)) {
    ++v31;
  }
  uint64_t v32 = *(void *)(a3 + 16);
  uint64_t v33 = *(void *)(v32 - 8);
  uint64_t v34 = *(unsigned __int8 *)(v33 + 80);
  uint64_t v35 = v31 + v34;
  uint64_t v36 = (void *)(((unint64_t)v24 + v35) & ~v34);
  uint64_t v37 = (void *)(((unint64_t)v25 + v35) & ~v34);
  size_t v38 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v33 + 48);
  int v39 = v38(v36, 1, v32);
  int v40 = v38(v37, 1, v32);
  if (v39)
  {
    if (!v40)
    {
      (*(void (**)(void *, void *, uint64_t))(v33 + 16))(v36, v37, v32);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v33 + 56))(v36, 0, 1, v32);
      return a1;
    }
    int v41 = *(_DWORD *)(v33 + 84);
    size_t v42 = *(void *)(v33 + 64);
  }
  else
  {
    if (!v40)
    {
      (*(void (**)(void *, void *, uint64_t))(v33 + 24))(v36, v37, v32);
      return a1;
    }
    id v44 = *(void (**)(void *, uint64_t))(v33 + 8);
    uint64_t v43 = v33 + 8;
    v44(v36, v32);
    int v41 = *(_DWORD *)(v43 + 76);
    size_t v42 = *(void *)(v43 + 56);
  }
  if (v41) {
    size_t v45 = v42;
  }
  else {
    size_t v45 = v42 + 1;
  }
  memcpy(v36, v37, v45);
  return a1;
}

void *sub_10000D4E4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7 + 32;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = ((unint64_t)a1 + v9 + 8) & ~v9;
  uint64_t v11 = ((unint64_t)a2 + v9 + 8) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v10, v11, v6);
  uint64_t v12 = *(void *)(v8 + 32);
  uint64_t v13 = type metadata accessor for TaskDefinition();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = v14 + 32;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = (v12 + v16 + v10) & ~v16;
  uint64_t v18 = (v12 + v16 + v11) & ~v16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32))(v17, v18, v13);
  uint64_t v19 = *(void *)(v15 + 32);
  uint64_t v20 = type metadata accessor for MLHostSystemParameters();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v23 = v19 + v22;
  uint64_t v24 = (void *)((v19 + v22 + v17) & ~v22);
  unint64_t v25 = (const void *)((v23 + v18) & ~v22);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v21 + 48))(v25, 1, v20))
  {
    int v26 = *(_DWORD *)(v21 + 84);
    uint64_t v27 = *(void *)(v21 + 64);
    if (v26) {
      size_t v28 = *(void *)(v21 + 64);
    }
    else {
      size_t v28 = v27 + 1;
    }
    memcpy(v24, v25, v28);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v21 + 32))(v24, v25, v20);
    size_t v30 = *(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56);
    uint64_t v29 = v21 + 56;
    v30(v24, 0, 1, v20);
    int v26 = *(_DWORD *)(v29 + 28);
    uint64_t v27 = *(void *)(v29 + 8);
  }
  if (v26) {
    uint64_t v31 = v27;
  }
  else {
    uint64_t v31 = v27 + 1;
  }
  uint64_t v32 = *(void *)(a3 + 16);
  uint64_t v33 = *(void *)(v32 - 8);
  uint64_t v34 = *(unsigned __int8 *)(v33 + 80);
  uint64_t v35 = v31 + v34;
  uint64_t v36 = (void *)(((unint64_t)v24 + v35) & ~v34);
  uint64_t v37 = (const void *)(((unint64_t)v25 + v35) & ~v34);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v33 + 48))(v37, 1, v32))
  {
    if (*(_DWORD *)(v33 + 84)) {
      size_t v38 = *(void *)(v33 + 64);
    }
    else {
      size_t v38 = *(void *)(v33 + 64) + 1;
    }
    memcpy(v36, v37, v38);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v33 + 32))(v36, v37, v32);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v33 + 56))(v36, 0, 1, v32);
  }
  return a1;
}

void *sub_10000D7A4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7 + 40;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = ((unint64_t)a1 + v9 + 8) & ~v9;
  uint64_t v11 = ((unint64_t)a2 + v9 + 8) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40))(v10, v11, v6);
  uint64_t v12 = *(void *)(v8 + 24);
  uint64_t v13 = type metadata accessor for TaskDefinition();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = v14 + 40;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = (v12 + v16 + v10) & ~v16;
  uint64_t v18 = (v12 + v16 + v11) & ~v16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 40))(v17, v18, v13);
  uint64_t v19 = *(void *)(v15 + 24);
  uint64_t v20 = type metadata accessor for MLHostSystemParameters();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(unsigned __int8 *)(v21 + 80);
  uint64_t v23 = v19 + v22;
  uint64_t v24 = (void *)((v19 + v22 + v17) & ~v22);
  unint64_t v25 = (void *)((v23 + v18) & ~v22);
  int v26 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v21 + 48);
  LODWORD(v18) = v26(v24, 1, v20);
  int v27 = v26(v25, 1, v20);
  if (v18)
  {
    if (!v27)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 32))(v24, v25, v20);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v24, 0, 1, v20);
      goto LABEL_12;
    }
    int v28 = *(_DWORD *)(v21 + 84);
    size_t v29 = *(void *)(v21 + 64);
  }
  else
  {
    if (!v27)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 40))(v24, v25, v20);
      goto LABEL_12;
    }
    (*(void (**)(void *, uint64_t))(v21 + 8))(v24, v20);
    int v28 = *(_DWORD *)(v21 + 84);
    size_t v29 = *(void *)(v21 + 64);
  }
  if (v28) {
    size_t v30 = v29;
  }
  else {
    size_t v30 = v29 + 1;
  }
  memcpy(v24, v25, v30);
LABEL_12:
  uint64_t v31 = *(void *)(v21 + 64);
  if (!*(_DWORD *)(v21 + 84)) {
    ++v31;
  }
  uint64_t v32 = *(void *)(a3 + 16);
  uint64_t v33 = *(void *)(v32 - 8);
  uint64_t v34 = *(unsigned __int8 *)(v33 + 80);
  uint64_t v35 = v31 + v34;
  uint64_t v36 = (void *)(((unint64_t)v24 + v35) & ~v34);
  uint64_t v37 = (void *)(((unint64_t)v25 + v35) & ~v34);
  size_t v38 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v33 + 48);
  int v39 = v38(v36, 1, v32);
  int v40 = v38(v37, 1, v32);
  if (v39)
  {
    if (!v40)
    {
      (*(void (**)(void *, void *, uint64_t))(v33 + 32))(v36, v37, v32);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v33 + 56))(v36, 0, 1, v32);
      return a1;
    }
    int v41 = *(_DWORD *)(v33 + 84);
    size_t v42 = *(void *)(v33 + 64);
  }
  else
  {
    if (!v40)
    {
      (*(void (**)(void *, void *, uint64_t))(v33 + 40))(v36, v37, v32);
      return a1;
    }
    id v44 = *(void (**)(void *, uint64_t))(v33 + 8);
    uint64_t v43 = v33 + 8;
    v44(v36, v32);
    int v41 = *(_DWORD *)(v43 + 76);
    size_t v42 = *(void *)(v43 + 56);
  }
  if (v41) {
    size_t v45 = v42;
  }
  else {
    size_t v45 = v42 + 1;
  }
  memcpy(v36, v37, v45);
  return a1;
}

uint64_t sub_10000DB48(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v46 = type metadata accessor for Date();
  uint64_t v6 = *(void *)(v46 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t v45 = type metadata accessor for TaskDefinition();
  uint64_t v8 = *(void *)(v45 - 8);
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  if (v9 <= v7) {
    unsigned int v10 = v7;
  }
  else {
    unsigned int v10 = *(_DWORD *)(v8 + 84);
  }
  uint64_t v11 = *(void *)(type metadata accessor for MLHostSystemParameters() - 8);
  uint64_t v12 = v11;
  int v13 = *(_DWORD *)(v11 + 84);
  if (v13) {
    unsigned int v14 = v13 - 1;
  }
  else {
    unsigned int v14 = 0;
  }
  if (v14 <= v10) {
    unsigned int v15 = v10;
  }
  else {
    unsigned int v15 = v14;
  }
  uint64_t v16 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v17 = v16;
  uint64_t v18 = *(unsigned int *)(v16 + 84);
  unsigned int v19 = v18 - 1;
  if (!v18) {
    unsigned int v19 = 0;
  }
  if (v19 > v15) {
    unsigned int v15 = v19;
  }
  uint64_t v20 = *(void *)(v11 + 64);
  if (v13) {
    uint64_t v21 = v20;
  }
  else {
    uint64_t v21 = v20 + 1;
  }
  uint64_t v22 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v23 = *(void *)(v6 + 64);
  uint64_t v24 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v25 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v26 = *(unsigned __int8 *)(v16 + 80);
  uint64_t v27 = *(void *)(v16 + 64);
  if (v18) {
    uint64_t v28 = v27;
  }
  else {
    uint64_t v28 = v27 + 1;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v29 = *(void *)(v8 + 64) + v25;
  uint64_t v30 = v21 + v26;
  if (a2 <= v15) {
    goto LABEL_40;
  }
  uint64_t v31 = v28 + ((v30 + ((v29 + ((v23 + v24 + ((v22 + 8) & ~v22)) & ~v24)) & ~v25)) & ~v26);
  char v32 = 8 * v31;
  if (v31 > 3) {
    goto LABEL_23;
  }
  unsigned int v34 = ((a2 - v15 + ~(-1 << v32)) >> v32) + 1;
  if (HIWORD(v34))
  {
    int v33 = *(_DWORD *)((char *)a1 + v31);
    if (!v33) {
      goto LABEL_40;
    }
    goto LABEL_30;
  }
  if (v34 > 0xFF)
  {
    int v33 = *(unsigned __int16 *)((char *)a1 + v31);
    if (!*(unsigned __int16 *)((char *)a1 + v31)) {
      goto LABEL_40;
    }
    goto LABEL_30;
  }
  if (v34 >= 2)
  {
LABEL_23:
    int v33 = *((unsigned __int8 *)a1 + v31);
    if (!*((unsigned char *)a1 + v31)) {
      goto LABEL_40;
    }
LABEL_30:
    int v35 = (v33 - 1) << v32;
    if (v31 > 3) {
      int v35 = 0;
    }
    if (v31)
    {
      if (v31 <= 3) {
        int v36 = v31;
      }
      else {
        int v36 = 4;
      }
      switch(v36)
      {
        case 2:
          int v37 = *a1;
          break;
        case 3:
          int v37 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
          break;
        case 4:
          int v37 = *(_DWORD *)a1;
          break;
        default:
          int v37 = *(unsigned __int8 *)a1;
          break;
      }
    }
    else
    {
      int v37 = 0;
    }
    return v15 + (v37 | v35) + 1;
  }
LABEL_40:
  if (!v15) {
    return 0;
  }
  uint64_t v38 = ((unint64_t)a1 + v22 + 8) & ~v22;
  if (v7 == v15)
  {
    int v39 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
    uint64_t v40 = v7;
    uint64_t v41 = v46;
LABEL_46:
    return v39(v38, v40, v41);
  }
  uint64_t v38 = (v38 + v23 + v24) & ~v24;
  if (v9 == v15)
  {
    int v39 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    uint64_t v40 = v9;
    uint64_t v41 = v45;
    goto LABEL_46;
  }
  uint64_t v43 = (v29 + v38) & ~v25;
  if (v14 == v15) {
    unsigned int v44 = (*(uint64_t (**)(uint64_t))(v12 + 48))(v43);
  }
  else {
    unsigned int v44 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 48))((v30 + v43) & ~v26, v18);
  }
  if (v44 >= 2) {
    return v44 - 1;
  }
  else {
    return 0;
  }
}

void sub_10000DF40(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v52 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v52 - 8);
  uint64_t v54 = v7;
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  uint64_t v51 = type metadata accessor for TaskDefinition();
  uint64_t v9 = *(void *)(v51 - 8);
  uint64_t v10 = *(unsigned int *)(v9 + 84);
  if (v10 <= v8) {
    unsigned int v11 = v8;
  }
  else {
    unsigned int v11 = *(_DWORD *)(v9 + 84);
  }
  int v12 = 0;
  uint64_t v13 = *(void *)(type metadata accessor for MLHostSystemParameters() - 8);
  uint64_t v14 = v13;
  int v15 = *(_DWORD *)(v13 + 84);
  if (v15) {
    unsigned int v16 = v15 - 1;
  }
  else {
    unsigned int v16 = 0;
  }
  if (v16 <= v11) {
    unsigned int v17 = v11;
  }
  else {
    unsigned int v17 = v16;
  }
  uint64_t v18 = *(void *)(a4 + 16);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(unsigned int *)(v19 + 84);
  uint64_t v21 = *(void *)(v13 + 64);
  uint64_t v22 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v23 = *(void *)(v7 + 64);
  uint64_t v24 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v25 = *(void *)(v9 + 64);
  uint64_t v26 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v27 = *(unsigned __int8 *)(v19 + 80);
  unsigned int v28 = v20 - 1;
  if (!v20) {
    unsigned int v28 = 0;
  }
  if (v28 <= v17) {
    unsigned int v29 = v17;
  }
  else {
    unsigned int v29 = v28;
  }
  if (v15) {
    uint64_t v30 = v21;
  }
  else {
    uint64_t v30 = v21 + 1;
  }
  uint64_t v31 = v25 + v26;
  uint64_t v32 = v30 + v27;
  uint64_t v33 = (v30 + v27 + ((v25 + v26 + ((v23 + v24 + ((v22 + 8) & ~v22)) & ~v24)) & ~v26)) & ~v27;
  if (v20) {
    size_t v34 = *(void *)(v19 + 64);
  }
  else {
    size_t v34 = *(void *)(v19 + 64) + 1;
  }
  size_t v35 = v33 + v34;
  if (a3 > v29)
  {
    if (v35 <= 3)
    {
      unsigned int v36 = ((a3 - v29 + ~(-1 << (8 * v35))) >> (8 * v35)) + 1;
      if (HIWORD(v36))
      {
        int v12 = 4;
      }
      else if (v36 >= 0x100)
      {
        int v12 = 2;
      }
      else
      {
        int v12 = v36 > 1;
      }
    }
    else
    {
      int v12 = 1;
    }
  }
  if (v29 < a2)
  {
    unsigned int v37 = ~v29 + a2;
    if (v35 < 4)
    {
      int v38 = (v37 >> (8 * v35)) + 1;
      if (v35)
      {
        int v40 = v37 & ~(-1 << (8 * v35));
        bzero(a1, v35);
        if (v35 == 3)
        {
          *(_WORD *)a1 = v40;
          a1[2] = BYTE2(v40);
        }
        else if (v35 == 2)
        {
          *(_WORD *)a1 = v40;
        }
        else
        {
          *a1 = v40;
        }
      }
    }
    else
    {
      bzero(a1, v35);
      *(_DWORD *)a1 = v37;
      int v38 = 1;
    }
    switch(v12)
    {
      case 1:
        a1[v35] = v38;
        return;
      case 2:
        *(_WORD *)&a1[v35] = v38;
        return;
      case 3:
        goto LABEL_75;
      case 4:
        *(_DWORD *)&a1[v35] = v38;
        return;
      default:
        return;
    }
  }
  uint64_t v39 = ~v26;
  switch(v12)
  {
    case 1:
      a1[v35] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_41;
    case 2:
      *(_WORD *)&a1[v35] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_41;
    case 3:
LABEL_75:
      __break(1u);
      JUMPOUT(0x10000E460);
    case 4:
      *(_DWORD *)&a1[v35] = 0;
      goto LABEL_40;
    default:
LABEL_40:
      if (!a2) {
        return;
      }
LABEL_41:
      uint64_t v41 = (unint64_t)&a1[v22 + 8] & ~v22;
      if (v8 == v29)
      {
        size_t v42 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v54 + 56);
        uint64_t v43 = a2;
        uint64_t v44 = v8;
        uint64_t v18 = v52;
LABEL_45:
        v42(v41, v43, v44, v18);
        return;
      }
      uint64_t v41 = (v41 + v23 + v24) & ~v24;
      if (v10 == v29)
      {
        size_t v42 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
        uint64_t v43 = a2;
        uint64_t v44 = v10;
        uint64_t v18 = v51;
        goto LABEL_45;
      }
      uint64_t v45 = (v31 + v41) & v39;
      if (v16 == v29)
      {
        uint64_t v46 = *(void (**)(uint64_t, void))(v14 + 56);
        v46(v45, (a2 + 1));
      }
      else
      {
        uint64_t v47 = (v32 + v45) & ~v27;
        if (v28 >= a2)
        {
          uint64_t v43 = (a2 + 1);
          size_t v42 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56);
          uint64_t v41 = (v32 + v45) & ~v27;
          uint64_t v44 = v20;
          goto LABEL_45;
        }
        if (v34 <= 3) {
          int v48 = ~(-1 << (8 * v34));
        }
        else {
          int v48 = -1;
        }
        if (v34)
        {
          int v49 = v48 & (~v28 + a2);
          if (v34 <= 3) {
            int v50 = v34;
          }
          else {
            int v50 = 4;
          }
          bzero((void *)((v32 + v45) & ~v27), v34);
          switch(v50)
          {
            case 2:
              *(_WORD *)uint64_t v47 = v49;
              break;
            case 3:
              *(_WORD *)uint64_t v47 = v49;
              *(unsigned char *)(v47 + 2) = BYTE2(v49);
              break;
            case 4:
              *(_DWORD *)uint64_t v47 = v49;
              break;
            default:
              *(unsigned char *)uint64_t v47 = v49;
              break;
          }
        }
      }
      return;
  }
}

uint64_t type metadata accessor for MLHostPushMessage()
{
  return sub_1000105D4();
}

void sub_10000E4B0()
{
  if (!qword_100065230)
  {
    type metadata accessor for MLHostSystemParameters();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100065230);
    }
  }
}

uint64_t sub_10000E508(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for MLHostPushMessage.CodingKeys()
{
  return sub_1000105D4();
}

uint64_t sub_10000E564(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000E638(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000101FC((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1000101FC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000101AC((uint64_t)v12);
  return v7;
}

uint64_t sub_10000E638(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000E7F4(a5, a6);
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
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t sub_10000E7F4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000E88C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000EAE8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000EAE8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000E88C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000EA04(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000EA04(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_10000E508(&qword_100065278);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000EA6C(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = String.UTF16View.index(_:offsetBy:)();
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
    uint64_t v5 = String.UTF8View._foreignIndex(_:offsetBy:)();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_10000EAE8(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000E508(&qword_100065278);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t sub_10000EC38(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    swift_stdlib_random();
    uint64_t result = (0 * (unsigned __int128)v1) >> 64;
    if (-(uint64_t)v1 % v1)
    {
      while (1)
        swift_stdlib_random();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000ECC4(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  size_t v6 = 8 * v5;
  if (v4 & 0x3Fu) <= 0xD || (swift_stdlib_isStackAllocationSafe())
  {
    __chkstk_darwin();
    bzero((char *)&v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    uint64_t v7 = sub_10000EE4C((uint64_t)&v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v5, a2, a1);
    swift_release();
  }
  else
  {
    int64_t v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    uint64_t v7 = sub_10000EE4C((uint64_t)v8, v5, a2, a1);
    swift_release();
    swift_slowDealloc();
  }
  return v7;
}

uint64_t sub_10000EE4C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  uint64_t v57 = (unint64_t *)result;
  if (*(void *)(a4 + 16) < *(void *)(a3 + 16))
  {
    int64_t v6 = 0;
    uint64_t v58 = a4 + 56;
    uint64_t v7 = 1 << *(unsigned char *)(a4 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(a4 + 56);
    int64_t v59 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v61 = 0;
    uint64_t v10 = a3 + 56;
    while (1)
    {
      while (1)
      {
        if (v9)
        {
          unint64_t v11 = __clz(__rbit64(v9));
          v9 &= v9 - 1;
          int64_t v62 = v6;
          unint64_t v12 = v11 | (v6 << 6);
        }
        else
        {
          int64_t v13 = v6 + 1;
          if (__OFADD__(v6, 1))
          {
            __break(1u);
            goto LABEL_81;
          }
          if (v13 >= v59) {
            goto LABEL_79;
          }
          unint64_t v14 = *(void *)(v58 + 8 * v13);
          int64_t v15 = v6 + 1;
          if (!v14)
          {
            int64_t v15 = v6 + 2;
            if (v6 + 2 >= v59) {
              goto LABEL_79;
            }
            unint64_t v14 = *(void *)(v58 + 8 * v15);
            if (!v14)
            {
              int64_t v15 = v6 + 3;
              if (v6 + 3 >= v59) {
                goto LABEL_79;
              }
              unint64_t v14 = *(void *)(v58 + 8 * v15);
              if (!v14)
              {
                uint64_t v16 = v6 + 4;
                if (v6 + 4 >= v59) {
                  goto LABEL_79;
                }
                unint64_t v14 = *(void *)(v58 + 8 * v16);
                if (!v14)
                {
                  while (1)
                  {
                    int64_t v15 = v16 + 1;
                    if (__OFADD__(v16, 1)) {
                      goto LABEL_83;
                    }
                    if (v15 >= v59) {
                      goto LABEL_79;
                    }
                    unint64_t v14 = *(void *)(v58 + 8 * v15);
                    ++v16;
                    if (v14) {
                      goto LABEL_22;
                    }
                  }
                }
                int64_t v15 = v6 + 4;
              }
            }
          }
LABEL_22:
          unint64_t v9 = (v14 - 1) & v14;
          int64_t v62 = v15;
          unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
        }
        unsigned int v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v12);
        uint64_t v19 = *v17;
        uint64_t v18 = v17[1];
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v20 = Hasher._finalize()();
        uint64_t v21 = -1 << *(unsigned char *)(v5 + 32);
        unint64_t v22 = v20 & ~v21;
        unint64_t v23 = v22 >> 6;
        uint64_t v24 = 1 << v22;
        if (((1 << v22) & *(void *)(v10 + 8 * (v22 >> 6))) != 0) {
          break;
        }
LABEL_6:
        uint64_t result = swift_bridgeObjectRelease();
        int64_t v6 = v62;
        uint64_t v5 = a3;
        uint64_t v4 = a4;
      }
      uint64_t v25 = *(void *)(a3 + 48);
      uint64_t v26 = (void *)(v25 + 16 * v22);
      BOOL v27 = *v26 == v19 && v26[1] == v18;
      if (!v27 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
      {
        uint64_t v28 = ~v21;
        for (unint64_t i = v22 + 1; ; unint64_t i = v30 + 1)
        {
          unint64_t v30 = i & v28;
          if (((*(void *)(v10 + (((i & v28) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v28)) & 1) == 0) {
            break;
          }
          uint64_t v31 = (void *)(v25 + 16 * v30);
          BOOL v32 = *v31 == v19 && v31[1] == v18;
          if (v32 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            uint64_t result = swift_bridgeObjectRelease();
            unint64_t v23 = v30 >> 6;
            uint64_t v24 = 1 << v30;
            goto LABEL_38;
          }
        }
        goto LABEL_6;
      }
      uint64_t result = swift_bridgeObjectRelease();
LABEL_38:
      int64_t v6 = v62;
      uint64_t v5 = a3;
      v57[v23] |= v24;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v4 = a4;
      if (v33) {
        goto LABEL_82;
      }
    }
  }
  int64_t v34 = 0;
  uint64_t v60 = a3 + 56;
  uint64_t v61 = 0;
  uint64_t v35 = 1 << *(unsigned char *)(a3 + 32);
  if (v35 < 64) {
    uint64_t v36 = ~(-1 << v35);
  }
  else {
    uint64_t v36 = -1;
  }
  unint64_t v37 = v36 & *(void *)(a3 + 56);
  int64_t v63 = (unint64_t)(v35 + 63) >> 6;
  uint64_t v38 = a4 + 56;
  while (1)
  {
    if (v37)
    {
      unint64_t v39 = __clz(__rbit64(v37));
      v37 &= v37 - 1;
      unint64_t v40 = v39 | (v34 << 6);
      goto LABEL_63;
    }
    int64_t v41 = v34 + 1;
    if (__OFADD__(v34, 1))
    {
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
      goto LABEL_84;
    }
    if (v41 >= v63) {
      goto LABEL_79;
    }
    unint64_t v42 = *(void *)(v60 + 8 * v41);
    ++v34;
    if (!v42)
    {
      int64_t v34 = v41 + 1;
      if (v41 + 1 >= v63) {
        goto LABEL_79;
      }
      unint64_t v42 = *(void *)(v60 + 8 * v34);
      if (!v42)
      {
        int64_t v34 = v41 + 2;
        if (v41 + 2 >= v63) {
          goto LABEL_79;
        }
        unint64_t v42 = *(void *)(v60 + 8 * v34);
        if (!v42) {
          break;
        }
      }
    }
LABEL_62:
    unint64_t v37 = (v42 - 1) & v42;
    unint64_t v40 = __clz(__rbit64(v42)) + (v34 << 6);
LABEL_63:
    uint64_t v44 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v40);
    uint64_t v46 = *v44;
    uint64_t v45 = v44[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    Swift::Int v47 = Hasher._finalize()();
    uint64_t v48 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v49 = v47 & ~v48;
    if (((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49) & 1) == 0) {
      goto LABEL_46;
    }
    uint64_t v50 = *(void *)(a4 + 48);
    uint64_t v51 = (void *)(v50 + 16 * v49);
    BOOL v52 = *v51 == v46 && v51[1] == v45;
    if (v52 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_76:
      uint64_t result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v57 + ((v40 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v40;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v5 = a3;
      uint64_t v4 = a4;
      if (v33)
      {
        __break(1u);
LABEL_79:
        swift_retain();
        return sub_10000F38C(v57, a2, v61, v5);
      }
    }
    else
    {
      uint64_t v53 = ~v48;
      while (1)
      {
        unint64_t v49 = (v49 + 1) & v53;
        if (((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49) & 1) == 0) {
          break;
        }
        uint64_t v54 = (void *)(v50 + 16 * v49);
        BOOL v55 = *v54 == v46 && v54[1] == v45;
        if (v55 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
          goto LABEL_76;
        }
      }
LABEL_46:
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v5 = a3;
      uint64_t v4 = a4;
    }
  }
  int64_t v43 = v41 + 3;
  if (v43 >= v63) {
    goto LABEL_79;
  }
  unint64_t v42 = *(void *)(v60 + 8 * v43);
  if (v42)
  {
    int64_t v34 = v43;
    goto LABEL_62;
  }
  while (1)
  {
    int64_t v34 = v43 + 1;
    if (__OFADD__(v43, 1)) {
      break;
    }
    if (v34 >= v63) {
      goto LABEL_79;
    }
    unint64_t v42 = *(void *)(v60 + 8 * v34);
    ++v43;
    if (v42) {
      goto LABEL_62;
    }
  }
LABEL_84:
  __break(1u);
  return result;
}

uint64_t sub_10000F38C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = &_swiftEmptySetSingleton;
LABEL_36:
    swift_release();
    return (uint64_t)v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_10000E508(&qword_100065288);
  uint64_t result = static _SetStorage.allocate(capacity:)();
  uint64_t v8 = (unsigned char *)result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    uint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_39;
    }
    if (v14 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_36;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_36;
        }
        unint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    unsigned int v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v20 = -1 << v8[32];
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*((void *)v8 + 6) + 16 * v23);
    void *v28 = v18;
    v28[1] = v19;
    ++*((void *)v8 + 2);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_36;
  }
  unint64_t v15 = a1[v16];
  if (v15)
  {
    uint64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_36;
    }
    unint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_10000F624(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100010468(&qword_1000652B0, &qword_1000652A0);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_10000E508(&qword_1000652A0);
          unint64_t v12 = sub_100012B2C(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_100010330(0, (unint64_t *)&qword_1000652A8);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000F858(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
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
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
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

int64_t sub_10000F8F8(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_10000F9DC(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(unsigned char *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)result >> 6) + 56) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    return *(void *)(*(void *)(a4 + 48) + 16 * result);
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_10000FA30()
{
  return 5;
}

void sub_10000FA38(void *a1)
{
  uint64_t v2 = v1;
  if (qword_100064F68 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100010174(v4, (uint64_t)qword_1000667D0);
  unint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    unint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Received relay push", v7, 2u);
    swift_slowDealloc();
  }

  if (!a1)
  {
    uint64_t v46 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v46, v20))
    {
      unint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, v20, "Push message has nil message.", v21, 2u);
      swift_slowDealloc();
    }
    goto LABEL_18;
  }
  uint64_t v46 = a1;
  id v8 = [v46 topic];
  if (v8)
  {
    unint64_t v9 = v8;
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v12 = v11;

    id v13 = [v46 channelID];
    if (v13)
    {
      id v14 = v13;
      os_log_t oslog = (os_log_t)static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v16 = v15;

      id v17 = [v46 pushType];
      if (v17 == (id)4)
      {
        unint64_t v18 = 0xEA0000000000646ELL;
        uint64_t v19 = 0x756F72676B636162;
      }
      else if (v17 == (id)8)
      {
        unint64_t v18 = 0xE500000000000000;
        uint64_t v19 = 0x7472656C61;
      }
      else if (v17 == (id)1024)
      {
        unint64_t v18 = 0xEC00000079746976;
        uint64_t v19 = 0x697463416576696CLL;
      }
      else
      {
        uint64_t v47 = (uint64_t)v17;
        type metadata accessor for APSIncomingMessagePushType(0);
        uint64_t v19 = String.init<A>(describing:)();
        unint64_t v18 = v25;
      }
      id v26 = [v46 priority];
      if (v26 == (id)1)
      {
        unint64_t v27 = 0xE300000000000000;
        uint64_t v43 = 7827308;
      }
      else if (v26 == (id)10)
      {
        unint64_t v27 = 0xE400000000000000;
        uint64_t v43 = 1751607656;
      }
      else if (v26 == (id)5)
      {
        unint64_t v27 = 0xE600000000000000;
        uint64_t v43 = 0x6D756964656DLL;
      }
      else
      {
        uint64_t v47 = (uint64_t)v26;
        type metadata accessor for APSIncomingMessagePriority(0);
        uint64_t v43 = String.init<A>(describing:)();
        unint64_t v27 = v28;
      }
      id v29 = [v46 userInfo];
      if (v29)
      {
        uint64_t v30 = v29;
        unint64_t v42 = v27;
        uint64_t v31 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        BOOL v32 = Logger.logObject.getter();
        os_log_type_t v33 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v32, v33))
        {
          uint64_t v41 = v19;
          uint64_t v34 = swift_slowAlloc();
          uint64_t v47 = swift_slowAlloc();
          *(_DWORD *)uint64_t v34 = 136315650;
          swift_bridgeObjectRetain();
          sub_10000E564(v10, v12, &v47);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v34 + 12) = 2080;
          swift_bridgeObjectRetain();
          sub_10000E564((uint64_t)oslog, v16, &v47);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v34 + 22) = 2080;
          uint64_t v35 = Dictionary.description.getter();
          sub_10000E564(v35, v36, &v47);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v32, v33, "Received push message for topic %s on channel %s: %s", (uint8_t *)v34, 0x20u);
          swift_arrayDestroy();
          swift_slowDealloc();
          uint64_t v19 = v41;
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
        }
        unint64_t v40 = *(void (**)(uint64_t, unint64_t, os_log_t, unint64_t, uint64_t, unint64_t, uint64_t, unint64_t, uint64_t))(v2 + OBJC_IVAR____TtC7mlhostd17MLHostAPSListener_handleMessage);
        swift_retain();
        v40(v10, v12, oslog, v16, v19, v18, v43, v42, v31);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t v37 = Logger.logObject.getter();
        os_log_type_t v38 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v37, v38))
        {
          unint64_t v39 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)unint64_t v39 = 0;
          _os_log_impl((void *)&_mh_execute_header, v37, v38, "Push message has nil userInfo.", v39, 2u);
          swift_slowDealloc();
        }
        else
        {
        }
      }
      return;
    }
    swift_bridgeObjectRelease();
  }
  os_log_t osloga = (os_log_t)Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(osloga, v22))
  {

LABEL_18:
    char v24 = v46;
    goto LABEL_19;
  }
  unint64_t v23 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)unint64_t v23 = 0;
  _os_log_impl((void *)&_mh_execute_header, osloga, v22, "Push message has nil topic / channel.", v23, 2u);
  swift_slowDealloc();

  char v24 = osloga;
LABEL_19:
}

uint64_t sub_100010174(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000101AC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000101FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10001025C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100010270(a1, a2);
  }
  return a1;
}

uint64_t sub_100010270(uint64_t a1, unint64_t a2)
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

uint64_t sub_1000102C8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000102D4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1000102E0()
{
  return swift_release();
}

uint64_t sub_1000102E8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100010330(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_10001036C(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_1000103B4(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_1000103C0(uint64_t a1)
{
  return a1;
}

_OWORD *sub_100010414(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void *sub_100010424(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100010468(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000102E8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000104AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000E508(&qword_1000652E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100010514(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000E508(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100010578(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000E508(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000105D4()
{
  return swift_getGenericMetadata();
}

uint64_t sub_100010604(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

unsigned char *sub_10001060C(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_10001061C(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *sub_1000106AC(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100010778);
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

uint64_t sub_1000107A0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000107A8(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

uint64_t sub_1000107B0()
{
  return swift_getWitnessTable();
}

uint64_t sub_1000107CC()
{
  return swift_getWitnessTable();
}

uint64_t sub_1000107E8()
{
  return swift_getWitnessTable();
}

void *sub_100010804()
{
  uint64_t result = &_swiftEmptyArrayStorage;
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    unsigned int v4 = self;
    swift_bridgeObjectRetain();
    uint64_t v5 = (uint64_t *)(v2 + 40);
    do
    {
      uint64_t v7 = *(v5 - 1);
      uint64_t v6 = *v5;
      id v8 = objc_allocWithZone((Class)_EXQuery);
      swift_bridgeObjectRetain();
      NSString v9 = String._bridgeToObjectiveC()();
      id v10 = [v8 initWithExtensionPointIdentifier:v9];

      id v11 = [v4 executeQuery:v10];
      sub_1000137E0();
      unint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      id v13 = sub_100013070(v12, v7, v6);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_10000C1BC((unint64_t)v13);

      v5 += 2;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void sub_100010954()
{
  os_unfair_lock_t lock = (os_unfair_lock_s *)(*(void *)(v0 + 16) + 16);
  os_unfair_lock_lock(lock);
  *(void *)(v0 + 24) = sub_100010804();
  swift_bridgeObjectRelease();
  uint64_t v17 = v0;
  unint64_t v1 = *(void *)(v0 + 24);
  if (v1 >> 62)
  {
LABEL_16:
    swift_bridgeObjectRetain_n();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    if (v2) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (v2)
    {
LABEL_3:
      uint64_t v3 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v4 = 4;
      while (1)
      {
        uint64_t v5 = v4 - 4;
        if ((v1 & 0xC000000000000001) != 0)
        {
          id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          uint64_t v7 = v4 - 3;
          if (__OFADD__(v5, 1)) {
            goto LABEL_15;
          }
        }
        else
        {
          id v6 = *(id *)(v1 + 8 * v4);
          uint64_t v7 = v4 - 3;
          if (__OFADD__(v5, 1))
          {
LABEL_15:
            __break(1u);
            goto LABEL_16;
          }
        }
        id v8 = v6;
        id v9 = [v8 bundleIdentifier];
        uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v12 = v11;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v3 = sub_1000202A8(0, *((void *)v3 + 2) + 1, 1, v3);
        }
        unint64_t v14 = *((void *)v3 + 2);
        unint64_t v13 = *((void *)v3 + 3);
        if (v14 >= v13 >> 1) {
          uint64_t v3 = sub_1000202A8((char *)(v13 > 1), v14 + 1, 1, v3);
        }
        *((void *)v3 + 2) = v14 + 1;
        unint64_t v15 = &v3[16 * v14];
        *((void *)v15 + 4) = v10;
        *((void *)v15 + 5) = v12;
        ++v4;
        if (v7 == v2) {
          goto LABEL_18;
        }
      }
    }
  }
  uint64_t v3 = (char *)&_swiftEmptyArrayStorage;
LABEL_18:
  swift_bridgeObjectRelease_n();
  uint64_t v16 = sub_1000383C8((uint64_t)v3);
  swift_bridgeObjectRelease();
  *(void *)(v17 + 40) = v16;
  swift_bridgeObjectRelease();

  os_unfair_lock_unlock(lock);
}

char *sub_100010B4C()
{
  uint64_t v1 = v0;
  uint64_t v49 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v48 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10000E508(&qword_1000654E0);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for ExtensionRecord();
  uint64_t v36 = *(void *)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v47 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v46 = (char *)&v34 - v11;
  __chkstk_darwin(v10);
  uint64_t v35 = (char *)&v34 - v12;
  os_unfair_lock_t v34 = (os_unfair_lock_t)(*(void *)(v1 + 16) + 16);
  os_unfair_lock_lock(v34);
  unint64_t v13 = *(void *)(v1 + 24);
  if (!(v13 >> 62))
  {
    uint64_t v14 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = (char *)swift_bridgeObjectRetain_n();
    if (v14) {
      goto LABEL_3;
    }
LABEL_17:
    uint64_t v50 = (char *)_swiftEmptyArrayStorage;
LABEL_18:
    swift_bridgeObjectRelease_n();
    os_unfair_lock_unlock(v34);
    return v50;
  }
  swift_bridgeObjectRetain_n();
  uint64_t result = (char *)_CocoaArrayWrapper.endIndex.getter();
  uint64_t v14 = (uint64_t)result;
  if (!result) {
    goto LABEL_17;
  }
LABEL_3:
  if (v14 >= 1)
  {
    uint64_t v16 = 0;
    uint64_t v41 = (void (**)(char *, uint64_t))(v2 + 8);
    unint64_t v42 = v13 & 0xC000000000000001;
    unint64_t v39 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v36 + 56);
    unint64_t v40 = (void (**)(char *, char *, uint64_t))(v36 + 32);
    os_log_type_t v38 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v36 + 48);
    uint64_t v50 = (char *)_swiftEmptyArrayStorage;
    uint64_t v44 = v7;
    uint64_t v45 = v6;
    unint64_t v37 = v13;
    uint64_t v43 = v14;
    uint64_t v17 = v46;
    do
    {
      if (v42) {
        id v18 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v18 = *(id *)(v13 + 8 * v16 + 32);
      }
      id v19 = v18;
      id v20 = [v19 localizedName];
      uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v51 = v22;
      uint64_t v52 = v21;

      id v23 = [v19 bundleIdentifier];
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      id v24 = [v19 url];
      unint64_t v25 = v48;
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      URL.absoluteString.getter();
      (*v41)(v25, v49);
      id v26 = [v19 extensionPointIdentifier];
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      ExtensionRecord.init(name:bundleIdentifier:url:extensionPointIdentifier:)();
      unint64_t v27 = *v40;
      uint64_t v29 = v44;
      uint64_t v28 = (uint64_t)v45;
      (*v40)(v45, v17, v44);
      (*v39)(v28, 0, 1, v29);

      if ((*v38)(v28, 1, v29) == 1)
      {
        sub_100010578(v28, &qword_1000654E0);
        unint64_t v13 = v37;
      }
      else
      {
        uint64_t v30 = v35;
        v27(v35, (char *)v28, v29);
        v27(v47, v30, v29);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v50 = (char *)sub_100020628(0, *((void *)v50 + 2) + 1, 1, (unint64_t)v50);
        }
        unint64_t v13 = v37;
        unint64_t v32 = *((void *)v50 + 2);
        unint64_t v31 = *((void *)v50 + 3);
        if (v32 >= v31 >> 1) {
          uint64_t v50 = (char *)sub_100020628(v31 > 1, v32 + 1, 1, (unint64_t)v50);
        }
        os_log_type_t v33 = v50;
        *((void *)v50 + 2) = v32 + 1;
        v27(&v33[((*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80))+ *(void *)(v36 + 72) * v32], v47, v29);
      }
      ++v16;
    }
    while (v43 != v16);
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

void sub_100011084(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v69 = a3;
  uint64_t v78 = a5;
  uint64_t v9 = sub_10000E508(&qword_1000654A8);
  __chkstk_darwin(v9 - 8);
  uint64_t v71 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000E508(&qword_1000654B0);
  __chkstk_darwin(v11 - 8);
  unint64_t v13 = (char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for UUID();
  uint64_t v75 = *(void *)(v14 - 8);
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  unint64_t v76 = (char *)&v61 - v18;
  uint64_t v19 = type metadata accessor for _AppExtensionIdentity();
  __chkstk_darwin(v19 - 8);
  uint64_t v20 = type metadata accessor for _AppExtensionProcess.Configuration();
  uint64_t v72 = *(void *)(v20 - 8);
  uint64_t v73 = v20;
  uint64_t v21 = __chkstk_darwin(v20);
  uint64_t v70 = (char *)&v61 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  id v24 = (char *)&v61 - v23;
  os_unfair_lock_t v77 = (os_unfair_lock_t)(*(void *)(v5 + 16) + 16);
  os_unfair_lock_lock(v77);
  swift_bridgeObjectRetain();
  unint64_t v25 = swift_bridgeObjectRetain();
  uint64_t v74 = a1;
  uint64_t v26 = a1;
  uint64_t v27 = 0;
  uint64_t v28 = sub_10001322C(v25, v26, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v28)
  {
    id v68 = v28;
    _AppExtensionIdentity.init(_:)();
    _AppExtensionProcess.Configuration.init(appExtension:onInterruption:)();
    if (a4)
    {
      uint64_t v67 = 0;
      uint64_t v65 = v24;
      swift_bridgeObjectRetain();
      uint64_t v29 = (uint64_t)v76;
      sub_100011BD4(0xD000000000000011, 0x8000000100055DF0, v69, a4, (uint64_t)v76);
      if (qword_100064F68 != -1) {
        swift_once();
      }
      uint64_t v30 = type metadata accessor for Logger();
      sub_100010174(v30, (uint64_t)qword_1000667D0);
      uint64_t v31 = v75;
      int64_t v66 = *(void (**)(char *, uint64_t, uint64_t))(v75 + 16);
      v66(v17, v29, v14);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      unint64_t v32 = Logger.logObject.getter();
      os_log_type_t v33 = static os_log_type_t.debug.getter();
      int v34 = v33;
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v35 = swift_slowAlloc();
        uint64_t v64 = swift_slowAlloc();
        v80[0] = v64;
        *(_DWORD *)uint64_t v35 = 136315650;
        int v63 = v34;
        os_log_t v62 = v32;
        uint64_t v36 = UUID.uuidString.getter();
        uint64_t v79 = sub_10000E564(v36, v37, v80);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        os_log_type_t v38 = *(void (**)(char *, uint64_t))(v75 + 8);
        v38(v17, v14);
        *(_WORD *)(v35 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v79 = sub_10000E564(v69, (unint64_t)a4, v80);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v35 + 22) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v79 = sub_10000E564(v74, a2, v80);
        uint64_t v29 = (uint64_t)v76;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        os_log_t v39 = v62;
        _os_log_impl((void *)&_mh_execute_header, v62, (os_log_type_t)v63, "Requesting instanceIdentifier %s for taskName %s and bundleId %s", (uint8_t *)v35, 0x20u);
        swift_arrayDestroy();
        swift_slowDealloc();
        uint64_t v31 = v75;
        swift_slowDealloc();
      }
      else
      {
        os_log_type_t v38 = *(void (**)(char *, uint64_t))(v31 + 8);
        v38(v17, v14);

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      v66(v13, v29, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v13, 0, 1, v14);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v13, 1, v14) == 1)
      {
        Class isa = 0;
      }
      else
      {
        Class isa = UUID._bridgeToObjectiveC()().super.isa;
        v38(v13, v14);
      }
      id v24 = v65;
      [objc_allocWithZone((Class)_EXExtensionInstanceIdentifier) initWithIdentifier:isa];

      _AppExtensionProcess.Configuration.instanceIdentifier.setter();
      v38(v76, v14);
      uint64_t v27 = v67;
    }
    uint64_t v46 = v72;
    uint64_t v45 = v73;
    uint64_t v47 = v24;
    (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v70, v24, v73);
    uint64_t v48 = (uint64_t)v71;
    _AppExtensionProcess.init(configuration:)();
    if (v27)
    {
      swift_errorRelease();
      uint64_t v49 = type metadata accessor for _AppExtensionProcess();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v48, 1, 1, v49);
    }
    else
    {
      uint64_t v50 = type metadata accessor for _AppExtensionProcess();
      uint64_t v51 = *(void *)(v50 - 8);
      uint64_t v52 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v51 + 56);
      v52(v48, 0, 1, v50);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v51 + 48))(v48, 1, v50) != 1)
      {

        (*(void (**)(char *, uint64_t))(v46 + 8))(v47, v45);
        uint64_t v60 = v78;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 32))(v78, v48, v50);
        v52(v60, 0, 1, v50);
        uint64_t v58 = v77;
        goto LABEL_27;
      }
    }
    sub_100010578(v48, &qword_1000654A8);
    if (qword_100064F68 != -1) {
      swift_once();
    }
    uint64_t v53 = type metadata accessor for Logger();
    sub_100010174(v53, (uint64_t)qword_1000667D0);
    swift_bridgeObjectRetain_n();
    uint64_t v54 = Logger.logObject.getter();
    os_log_type_t v55 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v54, v55))
    {
      NSString v56 = (uint8_t *)swift_slowAlloc();
      v80[0] = swift_slowAlloc();
      *(_DWORD *)NSString v56 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v79 = sub_10000E564(v74, a2, v80);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v54, v55, "Failed at getting app extension process for bundle: %s", v56, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(char *, uint64_t))(v46 + 8))(v47, v45);
  }
  else
  {
    if (qword_100064F68 != -1) {
      swift_once();
    }
    uint64_t v40 = type metadata accessor for Logger();
    sub_100010174(v40, (uint64_t)qword_1000667D0);
    swift_bridgeObjectRetain_n();
    uint64_t v41 = Logger.logObject.getter();
    os_log_type_t v42 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      v80[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v43 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v79 = sub_10000E564(v74, a2, v80);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "No extension identifier available in registry: %s", v43, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  uint64_t v58 = v77;
  uint64_t v57 = v78;
  uint64_t v59 = type metadata accessor for _AppExtensionProcess();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v59 - 8) + 56))(v57, 1, 1, v59);
LABEL_27:
  os_unfair_lock_unlock(v58);
}

uint64_t sub_100011BD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v34 = sub_10000E508(&qword_1000654B8);
  __chkstk_darwin(v34);
  uint64_t v11 = (uint64_t *)((char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = type metadata accessor for SHA256();
  uint64_t v33 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = type metadata accessor for SHA256Digest();
  uint64_t v35 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  uint64_t v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v36 = a1;
  *((void *)&v36 + 1) = a2;
  swift_bridgeObjectRetain();
  v17._countAndFlagsBits = 58;
  v17._object = (void *)0xE100000000000000;
  String.append(_:)(v17);
  v18._countAndFlagsBits = a3;
  v18._object = a4;
  String.append(_:)(v18);
  uint64_t v19 = sub_100012148(v36, *((unint64_t *)&v36 + 1));
  unint64_t v21 = v20;
  sub_10001342C(&qword_1000654C0, (void (*)(uint64_t))&type metadata accessor for SHA256);
  dispatch thunk of HashFunction.init()();
  switch(v21 >> 62)
  {
    case 1uLL:
      if (v19 >> 32 < (int)v19) {
        goto LABEL_15;
      }
      uint64_t v31 = a5;
      sub_1000133D4(v19, v21);
      sub_100012F04((int)v19, v19 >> 32);
      break;
    case 2uLL:
      uint64_t v31 = a5;
      uint64_t v22 = *(void *)(v19 + 16);
      uint64_t v23 = *(void *)(v19 + 24);
      sub_1000133D4(v19, v21);
      swift_retain();
      swift_retain();
      sub_100012F04(v22, v23);
      swift_release();
      swift_release();
      break;
    case 3uLL:
      *(void *)((char *)&v36 + 6) = 0;
      *(void *)&long long v36 = 0;
      goto LABEL_7;
    default:
      *(void *)&long long v36 = v19;
      WORD4(v36) = v21;
      BYTE10(v36) = BYTE2(v21);
      BYTE11(v36) = BYTE3(v21);
      BYTE12(v36) = BYTE4(v21);
      BYTE13(v36) = BYTE5(v21);
LABEL_7:
      dispatch thunk of HashFunction.update(bufferPointer:)();
      break;
  }
  sub_100010270(v19, v21);
  uint64_t v24 = v32;
  dispatch thunk of HashFunction.finalize()();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v14, v12);
  sub_100010270(v19, v21);
  uint64_t v25 = v35;
  (*(void (**)(void *, char *, uint64_t))(v35 + 16))(v11, v16, v24);
  *(void *)((char *)v11 + *(int *)(v34 + 36)) = 16;
  uint64_t v26 = sub_100012C64(v11);
  sub_100010578((uint64_t)v11, &qword_1000654B8);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v26 = (uint64_t)sub_1000129F4((void *)v26);
  }
  unint64_t v27 = *(void *)(v26 + 16);
  if (v27 < 7)
  {
    __break(1u);
    goto LABEL_14;
  }
  *(unsigned char *)(v26 + 38) = *(unsigned char *)(v26 + 38) & 0xF | 0x50;
  if (v27 < 9)
  {
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
  }
  *(unsigned char *)(v26 + 40) = *(unsigned char *)(v26 + 40) & 0x3F | 0x80;
  id v28 = [objc_allocWithZone((Class)NSUUID) initWithUUIDBytes:v26 + 32];
  swift_bridgeObjectRelease();
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v16, v24);
}

uint64_t sub_1000120D4()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for ExtensionKitRegistry()
{
  return self;
}

uint64_t sub_100012148(unint64_t a1, unint64_t a2)
{
  *(void *)&long long v40 = a1;
  *((void *)&v40 + 1) = a2;
  swift_bridgeObjectRetain();
  sub_10000E508(&qword_1000654D0);
  if (swift_dynamicCast())
  {
    sub_1000137A8(v38, (uint64_t)&v41);
    sub_100010424(&v41, v43);
    dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
    swift_bridgeObjectRelease();
    v38[0] = v40;
    sub_1000101AC((uint64_t)&v41);
    return *(void *)&v38[0];
  }
  uint64_t v39 = 0;
  memset(v38, 0, sizeof(v38));
  sub_100010578((uint64_t)v38, &qword_1000654D8);
  unint64_t v2 = a1;
  unint64_t v3 = a2;
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = a1;
      uint64_t v42 = a2 & 0xFFFFFFFFFFFFFFLL;
      id v6 = (char *)&v41 + (HIBYTE(a2) & 0xF);
      uint64_t v7 = &v41;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v4 = _StringObject.sharedUTF8.getter();
      }
      if (v4) {
        id v6 = (unsigned char *)(v4 + v5);
      }
      else {
        id v6 = 0;
      }
      uint64_t v7 = (uint64_t *)v4;
    }
    uint64_t v8 = sub_100013638(v7, v6);
    unint64_t v10 = v9;
    if (v9 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(void *)&v38[0] = v8;
      *((void *)&v38[0] + 1) = v10;
      return *(void *)&v38[0];
    }
    unint64_t v2 = a1;
    unint64_t v3 = a2;
    if ((a2 & 0x1000000000000000) == 0) {
      goto LABEL_14;
    }
LABEL_70:
    Swift::Int v11 = String.UTF8View._foreignCount()();
    goto LABEL_17;
  }
LABEL_69:
  uint64_t v8 = 0;
  unint64_t v10 = 0xF000000000000000;
  if ((v3 & 0x1000000000000000) != 0) {
    goto LABEL_70;
  }
LABEL_14:
  if ((v3 & 0x2000000000000000) != 0) {
    Swift::Int v11 = HIBYTE(v3) & 0xF;
  }
  else {
    Swift::Int v11 = v2 & 0xFFFFFFFFFFFFLL;
  }
LABEL_17:
  *(void *)&v38[0] = sub_10001369C(v11);
  *((void *)&v38[0] + 1) = v12;
  __chkstk_darwin(*(void *)&v38[0]);
  unint64_t v13 = (unint64_t)sub_100012678((void *(*)(uint64_t *__return_ptr, char *, char *))sub_10001373C);
  uint64_t v16 = *((void *)&v38[0] + 1) >> 62;
  uint64_t v17 = v13;
  uint64_t v18 = v3;
  unint64_t v19 = v14;
  switch(*((void *)&v38[0] + 1) >> 62)
  {
    case 1:
      LODWORD(v20) = DWORD1(v38[0]) - LODWORD(v38[0]);
      if (__OFSUB__(DWORD1(v38[0]), v38[0])) {
        goto LABEL_73;
      }
      uint64_t v20 = (int)v20;
LABEL_23:
      if (v15 != v20)
      {
        if (v16)
        {
          if (v16 == 1) {
            uint64_t v24 = *(uint64_t *)&v38[0] >> 32;
          }
          else {
            uint64_t v24 = *(void *)(*(void *)&v38[0] + 24);
          }
        }
        else
        {
          uint64_t v24 = BYTE14(v38[0]);
        }
LABEL_61:
        if (v24 < v15)
        {
          __break(1u);
LABEL_73:
          __break(1u);
LABEL_74:
          __break(1u);
        }
        Data._Representation.replaceSubrange(_:with:count:)();
LABEL_63:
        swift_bridgeObjectRelease();
        goto LABEL_64;
      }
LABEL_29:
      if ((v3 & 0x2000000000000000) != 0) {
        unint64_t v25 = HIBYTE(v3) & 0xF;
      }
      else {
        unint64_t v25 = v13 & 0xFFFFFFFFFFFFLL;
      }
      *(void *)((char *)&v40 + 7) = 0;
      *(void *)&long long v40 = 0;
      if (4 * v25 == v14 >> 14) {
        goto LABEL_58;
      }
      LOBYTE(v26) = 0;
      uint64_t v27 = (v13 >> 59) & 1;
      if ((v3 & 0x1000000000000000) == 0) {
        LOBYTE(v27) = 1;
      }
      uint64_t v28 = 4 << v27;
      uint64_t v35 = v3 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v33 = (uint64_t)v8;
      uint64_t v34 = (v3 & 0xFFFFFFFFFFFFFFFLL) + 32;
      break;
    case 2:
      uint64_t v22 = *(void *)(*(void *)&v38[0] + 16);
      uint64_t v21 = *(void *)(*(void *)&v38[0] + 24);
      BOOL v23 = __OFSUB__(v21, v22);
      uint64_t v20 = v21 - v22;
      if (!v23) {
        goto LABEL_23;
      }
      goto LABEL_74;
    case 3:
      if (!v15) {
        goto LABEL_29;
      }
      uint64_t v24 = 0;
      goto LABEL_61;
    default:
      uint64_t v20 = BYTE14(v38[0]);
      goto LABEL_23;
  }
  do
  {
    unint64_t v29 = v19 & 0xC;
    unint64_t v2 = v19;
    if (v29 == v28) {
      unint64_t v2 = sub_10000EA6C(v19, v17, v18);
    }
    unint64_t v30 = v2 >> 16;
    if (v2 >> 16 >= v25)
    {
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    if ((v18 & 0x1000000000000000) != 0)
    {
      unint64_t v2 = String.UTF8View._foreignSubscript(position:)();
      char v31 = v2;
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else if ((v18 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = v17;
      uint64_t v42 = v35;
      char v31 = *((unsigned char *)&v41 + v30);
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else
    {
      unint64_t v2 = v34;
      if ((v17 & 0x1000000000000000) == 0) {
        unint64_t v2 = _StringObject.sharedUTF8.getter();
      }
      char v31 = *(unsigned char *)(v2 + v30);
      if (v29 != v28)
      {
LABEL_47:
        if ((v18 & 0x1000000000000000) == 0) {
          goto LABEL_48;
        }
        goto LABEL_51;
      }
    }
    unint64_t v2 = sub_10000EA6C(v19, v17, v18);
    unint64_t v19 = v2;
    if ((v18 & 0x1000000000000000) == 0)
    {
LABEL_48:
      unint64_t v19 = (v19 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_53;
    }
LABEL_51:
    if (v25 <= v19 >> 16) {
      goto LABEL_68;
    }
    unint64_t v2 = String.UTF8View._foreignIndex(after:)();
    unint64_t v19 = v2;
LABEL_53:
    *((unsigned char *)&v40 + v26) = v31;
    unsigned int v26 = v26 + 1;
    if ((v26 >> 8)) {
      goto LABEL_67;
    }
    BYTE14(v40) = v26;
    if (v26 == 14)
    {
      uint64_t v41 = v40;
      LODWORD(v42) = DWORD2(v40);
      WORD2(v42) = WORD6(v40);
      Data._Representation.append(contentsOf:)();
      LOBYTE(v26) = 0;
      BYTE14(v40) = 0;
    }
  }
  while (4 * v25 != v19 >> 14);
  uint64_t v8 = (unsigned char *)v33;
  if ((_BYTE)v26)
  {
    uint64_t v41 = v40;
    LODWORD(v42) = DWORD2(v40);
    WORD2(v42) = WORD6(v40);
    Data._Representation.append(contentsOf:)();
    sub_10001025C(v33, v10);
    goto LABEL_63;
  }
LABEL_58:
  swift_bridgeObjectRelease();
  sub_10001025C((uint64_t)v8, v10);
LABEL_64:
  swift_bridgeObjectRelease();
  return *(void *)&v38[0];
}

char *sub_100012678(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)uint64_t v1 = xmmword_10004C990;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_16;
      }
      if (v11 < (int)v4) {
        goto LABEL_23;
      }
      if (__DataStorage._bytes.getter() && __OFSUB__((int)v4, __DataStorage._offset.getter())) {
        goto LABEL_24;
      }
      type metadata accessor for __DataStorage();
      swift_allocObject();
      uint64_t v13 = __DataStorage.init(bytes:length:copy:deallocator:offset:)();
      swift_release();
      uint64_t v9 = v13;
      uint64_t v11 = v4 >> 32;
LABEL_16:
      if (v11 < (int)v4)
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
      }
      uint64_t result = sub_100012A78((int)v4, v11, a1);
      unint64_t v12 = v9 | 0x4000000000000000;
      if (v2)
      {
        *uint64_t v5 = v4;
        goto LABEL_19;
      }
      *uint64_t v5 = v4;
      v5[1] = v12;
      break;
    case 2uLL:
      uint64_t v14 = *v1;
      uint64_t v15 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      Data.LargeSlice.ensureUniqueReference()();
      uint64_t result = sub_100012A78(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
      unint64_t v12 = v15 | 0x8000000000000000;
      if (v2)
      {
        *uint64_t v1 = v14;
LABEL_19:
        v5[1] = v12;
      }
      else
      {
        *uint64_t v1 = v14;
        v1[1] = v12;
      }
      break;
    case 3uLL:
      memset(v16, 0, 15);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16);
      if (!v2) {
        return (char *)v14;
      }
      return result;
    default:
      v16[0] = *v1;
      LOWORD(v16[1]) = v3;
      BYTE2(v16[1]) = BYTE2(v3);
      BYTE3(v16[1]) = BYTE3(v3);
      BYTE4(v16[1]) = BYTE4(v3);
      BYTE5(v16[1]) = BYTE5(v3);
      BYTE6(v16[1]) = BYTE6(v3);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16 + BYTE6(v3));
      if (!v2) {
        uint64_t result = (char *)v14;
      }
      unint64_t v8 = LODWORD(v16[1]) | ((unint64_t)BYTE4(v16[1]) << 32) | ((unint64_t)BYTE5(v16[1]) << 40) | ((unint64_t)BYTE6(v16[1]) << 48);
      *uint64_t v1 = v16[0];
      v1[1] = v8;
      return result;
  }
  return result;
}

unsigned char *sub_10001297C@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    uint64_t result = (unsigned char *)sub_100013474(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)sub_100013538((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)sub_1000135B4((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

void *sub_1000129F4(void *a1)
{
  return sub_10002064C(0, a1[2], 0, a1);
}

void *sub_100012A08(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    uint64_t result = a1(&v6, a3, a4 - a3);
    if (v4) {
      return result;
    }
    return (void *)v6;
  }
  uint64_t result = a1(&v6, 0, 0);
  if (!v4) {
    return (void *)v6;
  }
  return result;
}

char *sub_100012A78(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t result = (char *)__DataStorage._bytes.getter();
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v8 = result;
  uint64_t result = (char *)__DataStorage._offset.getter();
  uint64_t v9 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v12 = __DataStorage._length.getter();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

void (*sub_100012B2C(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100012BDC(v6, a2, a3);
  return sub_100012B94;
}

void sub_100012B94(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_100012BDC(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_100012C5C;
  }
  __break(1u);
  return result;
}

void sub_100012C5C(id *a1)
{
}

uint64_t sub_100012C64(void *a1)
{
  uint64_t v3 = type metadata accessor for SHA256Digest();
  __chkstk_darwin(v3);
  (*(void (**)(char *, void *, uint64_t))(v5 + 16))((char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  sub_10001342C(&qword_1000654C8, (void (*)(uint64_t))&type metadata accessor for SHA256Digest);
  dispatch thunk of Sequence.makeIterator()();
  uint64_t result = sub_10000E508(&qword_1000654B8);
  uint64_t v7 = *(void *)((char *)a1 + *(int *)(result + 36));
  uint64_t v8 = v29;
  if (!v7 || (unint64_t v9 = v30, v10 = *(void *)(v29 + 16), v30 == v10))
  {
    uint64_t result = swift_bridgeObjectRelease();
    size_t v1 = 0;
    a1 = _swiftEmptyArrayStorage;
    goto LABEL_27;
  }
  if ((v30 & 0x8000000000000000) == 0)
  {
    if (v30 < *(void *)(v29 + 16))
    {
      size_t v1 = 0;
      a1 = _swiftEmptyArrayStorage;
      uint64_t v11 = v7 - 1;
      uint64_t v12 = &_swiftEmptyArrayStorage[4];
      uint64_t v13 = v10 - 1;
      uint64_t v28 = v13;
      while (1)
      {
        char v14 = *(unsigned char *)(v8 + v9 + 32);
        if (!v1)
        {
          unint64_t v15 = a1[3];
          if ((uint64_t)((v15 >> 1) + 0x4000000000000000) < 0) {
            goto LABEL_32;
          }
          int64_t v16 = v15 & 0xFFFFFFFFFFFFFFFELL;
          if (v16 <= 1) {
            uint64_t v17 = 1;
          }
          else {
            uint64_t v17 = v16;
          }
          sub_10000E508(&qword_100065278);
          uint64_t v18 = (void *)swift_allocObject();
          size_t v19 = 2 * j__malloc_size(v18) - 64;
          v18[2] = v17;
          v18[3] = v19;
          unint64_t v20 = (unint64_t)(v18 + 4);
          size_t v21 = a1[3] >> 1;
          if (a1[2])
          {
            if (v18 != a1 || v20 >= (unint64_t)a1 + v21 + 32) {
              memmove(v18 + 4, a1 + 4, v21);
            }
            a1[2] = 0;
          }
          uint64_t v12 = (unsigned char *)(v20 + v21);
          size_t v1 = (v19 >> 1) - v21;
          uint64_t result = swift_release();
          a1 = v18;
          uint64_t v13 = v28;
        }
        BOOL v23 = __OFSUB__(v1--, 1);
        if (v23) {
          break;
        }
        *uint64_t v12 = v14;
        if (!v11 || v13 == v9) {
          goto LABEL_26;
        }
        ++v9;
        ++v12;
        --v11;
        if (v9 >= *(void *)(v8 + 16)) {
          goto LABEL_25;
        }
      }
      __break(1u);
LABEL_32:
      __break(1u);
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
LABEL_25:
    __break(1u);
LABEL_26:
    uint64_t result = swift_bridgeObjectRelease();
LABEL_27:
    unint64_t v24 = a1[3];
    if (v24 < 2) {
      return (uint64_t)a1;
    }
    unint64_t v25 = v24 >> 1;
    BOOL v23 = __OFSUB__(v25, v1);
    unint64_t v26 = v25 - v1;
    if (!v23)
    {
      a1[2] = v26;
      return (uint64_t)a1;
    }
    goto LABEL_33;
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_100012F04(uint64_t a1, uint64_t a2)
{
  uint64_t result = __DataStorage._bytes.getter();
  if (!result || (uint64_t result = __DataStorage._offset.getter(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      __DataStorage._length.getter();
      type metadata accessor for SHA256();
      sub_10001342C(&qword_1000654C0, (void (*)(uint64_t))&type metadata accessor for SHA256);
      return dispatch thunk of HashFunction.update(bufferPointer:)();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_100012FE4@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    uint64_t result = _StringGuts.copyUTF8(into:)();
    if ((v3 & 1) == 0)
    {
      uint64_t v4 = result;
      uint64_t result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void *sub_100013070(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >> 62) {
    goto LABEL_22;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v5)
  {
    while (1)
    {
      unint64_t v6 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_9:
        uint64_t v8 = v7;
        unint64_t v9 = v6 + 1;
        if (__OFADD__(v6, 1)) {
          goto LABEL_21;
        }
        uint64_t v10 = v5;
        id v11 = [v7 extensionPointIdentifier];
        uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v14 = v13;

        if (v12 == a2 && v14 == a3)
        {
          swift_bridgeObjectRelease();
LABEL_17:
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
          goto LABEL_5;
        }
        char v16 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v16) {
          goto LABEL_17;
        }

LABEL_5:
        ++v6;
        uint64_t v5 = v10;
        if (v9 == v10) {
          return &_swiftEmptyArrayStorage;
        }
      }
      if (v6 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_21:
      __break(1u);
LABEL_22:
      uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
      if (!v5) {
        return &_swiftEmptyArrayStorage;
      }
    }
    id v7 = *(id *)(a1 + 8 * v6 + 32);
    goto LABEL_9;
  }
  return &_swiftEmptyArrayStorage;
}

void *sub_10001322C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  unint64_t v7 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_3:
      uint64_t v22 = v4;
      unint64_t v23 = v7;
      unint64_t v24 = v7 & 0xC000000000000001;
      uint64_t v4 = 4;
      do
      {
        uint64_t v9 = v4 - 4;
        if (v24)
        {
          id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          uint64_t v11 = v4 - 3;
          if (__OFADD__(v9, 1)) {
            goto LABEL_19;
          }
        }
        else
        {
          id v10 = *(id *)(v7 + 8 * v4);
          uint64_t v11 = v4 - 3;
          if (__OFADD__(v9, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        uint64_t v12 = v8;
        uint64_t v13 = v10;
        uint64_t v14 = a3;
        id v15 = [v10 bundleIdentifier:v22];
        uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v18 = v17;

        a3 = v14;
        BOOL v19 = v16 == a2 && v18 == v14;
        if (v19)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v13;
        }
        char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_18;
        }

        ++v4;
        uint64_t v8 = v12;
        BOOL v19 = v11 == v12;
        unint64_t v7 = v23;
      }
      while (!v19);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1000133D4(uint64_t a1, unint64_t a2)
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

uint64_t sub_10001342C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100013474(unsigned char *__src, unsigned char *a2)
{
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

uint64_t sub_100013538(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  type metadata accessor for __DataStorage();
  swift_allocObject();
  uint64_t result = __DataStorage.init(bytes:length:)();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    type metadata accessor for Data.RangeReference();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_1000135B4(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  type metadata accessor for __DataStorage();
  swift_allocObject();
  uint64_t result = __DataStorage.init(bytes:length:)();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

unsigned char *sub_100013638(unsigned char *result, unsigned char *a2)
{
  if (result)
  {
    uint64_t v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (unsigned char *)sub_100013474(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (unsigned char *)sub_100013538((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (unsigned char *)sub_1000135B4((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_10001369C(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      type metadata accessor for __DataStorage();
      swift_allocObject();
      __DataStorage.init(length:)();
      if (v1 >= 0x7FFFFFFF)
      {
        type metadata accessor for Data.RangeReference();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

void *sub_10001373C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  char v5 = *(uint64_t **)(v3 + 16);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  uint64_t result = sub_100012A08((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_1000137C0, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_1000137A8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1000137C0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_100012FE4(a1, a2);
}

unint64_t sub_1000137E0()
{
  unint64_t result = qword_1000652A8;
  if (!qword_1000652A8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000652A8);
  }
  return result;
}

uint64_t sub_100013820(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_10000E508(&qword_1000655E8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for MLHostTask();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(a1, 1, v11) == 1)
  {
    sub_100010578(a1, &qword_1000655E8);
    sub_1000209EC(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_100010578((uint64_t)v10, &qword_1000655E8);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v14, a1, v11);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    sub_1000364A4((uint64_t)v14, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1000139FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    Hasher.init(_seed:)();
    String.hash(into:)();
    Swift::Int v6 = Hasher._finalize()();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

unint64_t sub_100013B34()
{
  sub_10000E508(&qword_100065630);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10004C9E0;
  *(void *)(inited + 64) = &type metadata for Int;
  *(void *)(inited + 32) = NSFilePosixPermissions;
  *(void *)(inited + 40) = 448;
  unint64_t v1 = NSFilePosixPermissions;
  unint64_t result = sub_100025740(inited);
  qword_1000654E8 = result;
  return result;
}

uint64_t sub_100013BB0(uint64_t a1, char *a2, char *a3)
{
  uint64_t v84 = a2;
  uint64_t v81 = a3;
  *(void *)&long long v85 = a1;
  uint64_t v3 = type metadata accessor for URL.DirectoryHint();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  Swift::Int v6 = (char *)&v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000E508(&qword_1000655C0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = type metadata accessor for URL();
  uint64_t v75 = *(void *)(v82 - 8);
  uint64_t v10 = __chkstk_darwin(v82);
  BOOL v12 = (char *)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v71 - v13;
  uint64_t v16 = *(char **)(v15 + 56);
  uint64_t v79 = (char *)(v15 + 56);
  v80 = v16;
  uint64_t v74 = v9;
  ((void (*)(char *, uint64_t, uint64_t))v16)(v9, 1, 1);
  uint64_t v17 = enum case for URL.DirectoryHint.inferFromPath(_:);
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  unsigned int v73 = enum case for URL.DirectoryHint.inferFromPath(_:);
  v18(v6, enum case for URL.DirectoryHint.inferFromPath(_:), v3);
  uint64_t v72 = v18;
  swift_bridgeObjectRetain();
  URL.init(filePath:directoryHint:relativeTo:)();
  uint64_t v87 = (void *)0xD00000000000001BLL;
  unint64_t v88 = 0x8000000100055F70;
  v18(v6, v17, v3);
  unint64_t v78 = sub_100024B80();
  URL.appending<A>(path:directoryHint:)();
  BOOL v19 = *(void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v76 = v4 + 8;
  os_unfair_lock_t v77 = v19;
  v19(v6, v3);
  swift_bridgeObjectRelease();
  char v20 = *(char **)(v75 + 8);
  uint64_t v21 = v82;
  ((void (*)(char *, uint64_t))v20)(v12, v82);
  Swift::String v22 = URL.path(percentEncoded:)(0);
  ((void (*)(char *, uint64_t))v20)(v14, v21);
  *(Swift::String *)(v83 + 24) = v22;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v80)(v74, 1, 1, v21);
  uint64_t v23 = v73;
  unint64_t v24 = v72;
  v72(v6, v73, v3);
  URL.init(filePath:directoryHint:relativeTo:)();
  uint64_t v87 = (void *)0xD00000000000001FLL;
  unint64_t v88 = 0x8000000100055F90;
  v24(v6, v23, v3);
  URL.appending<A>(path:directoryHint:)();
  v77(v6, v3);
  swift_bridgeObjectRelease();
  uint64_t v25 = v82;
  ((void (*)(char *, uint64_t))v20)(v12, v82);
  Swift::String v26 = URL.path(percentEncoded:)(0);
  ((void (*)(char *, uint64_t))v20)(v14, v25);
  uint64_t v27 = (void *)v83;
  *(Swift::String *)(v83 + 40) = v26;
  sub_10000E508(&qword_1000652D8);
  uint64_t v28 = swift_allocObject();
  *(_DWORD *)(v28 + 16) = 0;
  v27[7] = v28;
  uint64_t v29 = _swiftEmptyArrayStorage;
  v27[8] = sub_100025870((uint64_t)_swiftEmptyArrayStorage);
  id v30 = [(id)BiomeLibrary() Lighthouse];
  swift_unknownObjectRelease();
  id v31 = [v30 Ledger];
  swift_unknownObjectRelease();
  id v32 = [v31 TaskStatus];
  swift_unknownObjectRelease();
  v27[9] = v32;
  id v33 = (id)BiomeLibrary();
  uint64_t v34 = v81;
  id v35 = [v33 Lighthouse];
  swift_unknownObjectRelease();
  long long v36 = [v35 Ledger];
  swift_unknownObjectRelease();
  id v37 = [v36 TaskError];
  swift_unknownObjectRelease();
  v27[10] = v37;
  uint64_t v39 = (char *)*((void *)v34 + 2);
  if (!v39) {
    goto LABEL_21;
  }
  long long v40 = 0;
  uint64_t v41 = v34 + 40;
  uint64_t v79 = v39 - 1;
  *(void *)&long long v38 = 136315138;
  long long v85 = v38;
  uint64_t v84 = (char *)&type metadata for Any + 8;
  v80 = v34 + 40;
  do
  {
    uint64_t v82 = (uint64_t)v29;
    uint64_t v42 = (unint64_t *)&v41[16 * (void)v40];
    uint64_t v43 = v40;
    while (1)
    {
      if ((unint64_t)v43 >= *((void *)v34 + 2))
      {
        __break(1u);
        goto LABEL_32;
      }
      uint64_t v44 = *(v42 - 1);
      unint64_t v45 = *v42;
      char v86 = 1;
      uint64_t v46 = self;
      swift_bridgeObjectRetain();
      long long v36 = [v46 defaultManager];
      NSString v47 = String._bridgeToObjectiveC()();
      char v20 = (char *)[v36 fileExistsAtPath:v47 isDirectory:&v86];

      if (!v20)
      {
        if (qword_100064F68 != -1) {
          swift_once();
        }
        uint64_t v48 = type metadata accessor for Logger();
        sub_100010174(v48, (uint64_t)qword_1000667D0);
        swift_bridgeObjectRetain_n();
        long long v36 = Logger.logObject.getter();
        os_log_type_t v49 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v36, v49))
        {
          char v20 = (char *)swift_slowAlloc();
          uint64_t v89 = swift_slowAlloc();
          *(_DWORD *)char v20 = v85;
          swift_bridgeObjectRetain();
          *(void *)(v20 + 4) = sub_10000E564(v44, v45, &v89);
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v36, v49, "Skipping staticTask folder %s because doesn't exist.", (uint8_t *)v20, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
          swift_bridgeObjectRelease();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        goto LABEL_5;
      }
      if (v86) {
        break;
      }
      swift_bridgeObjectRelease();
LABEL_5:
      ++v43;
      v42 += 2;
      if (v39 == v43)
      {
        uint64_t v29 = (void *)v82;
        goto LABEL_21;
      }
    }
    uint64_t v29 = (void *)v82;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v87 = v29;
    char v20 = v34;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_100021618(0, v29[2] + 1, 1);
      uint64_t v29 = v87;
    }
    unint64_t v52 = v29[2];
    unint64_t v51 = v29[3];
    long long v36 = (v52 + 1);
    if (v52 >= v51 >> 1)
    {
      sub_100021618(v51 > 1, v52 + 1, 1);
      uint64_t v29 = v87;
    }
    long long v40 = v43 + 1;
    v29[2] = v36;
    uint64_t v53 = &v29[2 * v52];
    v53[4] = v44;
    v53[5] = v45;
    uint64_t v41 = v80;
    uint64_t v34 = v20;
  }
  while (v79 != v43);
LABEL_21:
  swift_bridgeObjectRelease();
  *(void *)(v83 + 16) = v29;
  long long v36 = self;
  uint64_t v43 = (char *)[v36 defaultManager];
  swift_bridgeObjectRetain();
  char v20 = (char *)String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (qword_100064F60 != -1) {
LABEL_32:
  }
    swift_once();
  type metadata accessor for FileAttributeKey(0);
  sub_100024C88(&qword_100065038, type metadata accessor for FileAttributeKey);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  uint64_t v87 = 0;
  unsigned __int8 v55 = [v43 createDirectoryAtPath:v20 withIntermediateDirectories:1 attributes:isa error:&v87];

  id v56 = v87;
  if ((v55 & 1) == 0) {
    goto LABEL_25;
  }
  uint64_t v57 = v87;
  id v58 = [v36 defaultManager];
  swift_bridgeObjectRetain();
  NSString v59 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  Class v60 = Dictionary._bridgeToObjectiveC()().super.isa;
  uint64_t v87 = 0;
  unsigned int v61 = [v58 createDirectoryAtPath:v59 withIntermediateDirectories:1 attributes:v60 error:&v87];

  id v56 = v87;
  if (v61)
  {
    os_log_t v62 = v87;
  }
  else
  {
LABEL_25:
    id v63 = v56;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    if (qword_100064F68 != -1) {
      swift_once();
    }
    uint64_t v64 = type metadata accessor for Logger();
    sub_100010174(v64, (uint64_t)qword_1000667D0);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v65 = Logger.logObject.getter();
    os_log_type_t v66 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v65, v66))
    {
      uint64_t v67 = (uint8_t *)swift_slowAlloc();
      id v68 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v67 = 138412290;
      swift_errorRetain();
      uint64_t v69 = (void *)_swift_stdlib_bridgeErrorToNSError();
      uint64_t v87 = v69;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v68 = v69;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v65, v66, "Failed at creating folder: %@", v67, 0xCu);
      sub_10000E508(&qword_100065290);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
  }
  return v83;
}

uint64_t sub_10001476C()
{
  unint64_t v1 = v0;
  _StringGuts.grow(_:)(49);
  uint64_t v2 = _typeName(_:qualified:)();
  swift_bridgeObjectRelease();
  uint64_t v17 = v2;
  v3._countAndFlagsBits = 0x203A736B73617428;
  v3._object = (void *)0xE800000000000000;
  String.append(_:)(v3);
  uint64_t v4 = (os_unfair_lock_s *)(v0[7] + 16);
  os_unfair_lock_lock(v4);
  swift_beginAccess();
  os_unfair_lock_unlock(v4);
  v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = 0x636974617473202CLL;
  v6._object = (void *)0xEA0000000000203ALL;
  String.append(_:)(v6);
  swift_bridgeObjectRetain();
  v7._countAndFlagsBits = Array.description.getter();
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 0x696D616E7964202CLL;
  v8._object = (void *)0xEB00000000203A63;
  String.append(_:)(v8);
  uint64_t v9 = v1[3];
  uint64_t v10 = (void *)v1[4];
  swift_bridgeObjectRetain();
  v11._countAndFlagsBits = v9;
  v11._object = v10;
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 0x737465737361202CLL;
  v12._object = (void *)0xEA0000000000203ALL;
  String.append(_:)(v12);
  uint64_t v14 = v1[5];
  uint64_t v13 = (void *)v1[6];
  swift_bridgeObjectRetain();
  v15._countAndFlagsBits = v14;
  v15._object = v13;
  String.append(_:)(v15);
  swift_bridgeObjectRelease();
  return v17;
}

void *sub_100014960()
{
  id v0 = [self defaultManager];
  NSString v1 = String._bridgeToObjectiveC()();
  id v19 = 0;
  id v2 = [v0 contentsOfDirectoryAtPath:v1 error:&v19];

  id v3 = v19;
  if (v2)
  {
    uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    id v5 = v3;

    uint64_t v6 = *(void *)(v4 + 16);
    if (v6)
    {
      Swift::String v7 = (uint64_t *)(v4 + 40);
      Swift::String v8 = _swiftEmptyArrayStorage;
      do
      {
        uint64_t v10 = *(v7 - 1);
        uint64_t v9 = *v7;
        swift_bridgeObjectRetain();
        v11._countAndFlagsBits = 0x7473696C702ELL;
        v11._object = (void *)0xE600000000000000;
        if (String.hasSuffix(_:)(v11))
        {
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          id v19 = v8;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_100021618(0, v8[2] + 1, 1);
            Swift::String v8 = v19;
          }
          unint64_t v14 = v8[2];
          unint64_t v13 = v8[3];
          if (v14 >= v13 >> 1)
          {
            sub_100021618(v13 > 1, v14 + 1, 1);
            Swift::String v8 = v19;
          }
          v8[2] = v14 + 1;
          Swift::String v15 = &v8[2 * v14];
          v15[4] = v10;
          v15[5] = v9;
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        v7 += 2;
        --v6;
      }
      while (v6);
    }
    else
    {
      Swift::String v8 = _swiftEmptyArrayStorage;
    }
    swift_bridgeObjectRelease();
    uint64_t v17 = sub_1000383C8((uint64_t)v8);
    swift_release();
  }
  else
  {
    id v16 = v19;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease();
    return &_swiftEmptySetSingleton;
  }
  return (void *)v17;
}

uint64_t sub_100014B6C()
{
  id v1 = [*(id *)(v0 + 72) pruner];
  NSString v2 = String._bridgeToObjectiveC()();
  Swift::String v12 = sub_100014D90;
  uint64_t v13 = 0;
  Swift::String v8 = _NSConcreteStackBlock;
  uint64_t v9 = 1107296256;
  uint64_t v10 = sub_100025098;
  Swift::String v11 = &unk_100061EE0;
  id v3 = _Block_copy(&v8);
  swift_release();
  [v1 deleteWithPolicy:v2 eventsPassingTest:v3];

  _Block_release(v3);
  uint64_t result = swift_isEscapingClosureAtFileLocation();
  if (result)
  {
    __break(1u);
    goto LABEL_5;
  }
  id v5 = [*(id *)(v0 + 80) pruner];
  NSString v6 = String._bridgeToObjectiveC()();
  Swift::String v12 = sub_100014D90;
  uint64_t v13 = 0;
  Swift::String v8 = _NSConcreteStackBlock;
  uint64_t v9 = 1107296256;
  uint64_t v10 = sub_100014D98;
  Swift::String v11 = &unk_100061F08;
  Swift::String v7 = _Block_copy(&v8);
  swift_release();
  [v5 deleteWithPolicy:v6 eventsPassingTest:v7];

  _Block_release(v7);
  uint64_t result = swift_isEscapingClosureAtFileLocation();
  if (result) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t sub_100014D90()
{
  return 1;
}

uint64_t sub_100014D98(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(uint64_t (**)(void *, uint64_t))(a1 + 32);
  id v6 = a2;
  LOBYTE(a3) = v5(a2, a3);

  return a3 & 1;
}

uint64_t sub_100014DF4(uint64_t a1)
{
  NSString v2 = (uint64_t *)(a1 + 64);
  swift_beginAccess();
  if (*(void *)(*(void *)(a1 + 64) + 16))
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v5 = *v2;
    *NSString v2 = 0x8000000000000000;
    sub_10000E508(&qword_100065658);
    _NativeDictionary.removeAll(isUnique:)(isUniquelyReferenced_nonNull_native);
    *NSString v2 = v5;
    swift_bridgeObjectRelease();
  }
  return swift_endAccess();
}

uint64_t sub_100014E9C(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = type metadata accessor for URL.DirectoryHint();
  uint64_t v107 = *(void *)(v5 - 8);
  uint64_t v108 = v5;
  __chkstk_darwin(v5);
  uint64_t v106 = (char *)&v94 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000E508(&qword_1000655C0);
  __chkstk_darwin(v7 - 8);
  long long v102 = (char *)&v94 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = type metadata accessor for URL();
  uint64_t v105 = *(void *)(v110 - 8);
  uint64_t v9 = __chkstk_darwin(v110);
  long long v103 = (char *)&v94 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  long long v104 = (char *)&v94 - v11;
  uint64_t v12 = type metadata accessor for TaskType();
  uint64_t v109 = *(void *)(v12 - 8);
  uint64_t v13 = __chkstk_darwin(v12);
  Swift::String v15 = (char *)&v94 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v94 - v16;
  uint64_t v18 = sub_10000E508(&qword_1000655E8);
  __chkstk_darwin(v18 - 8);
  char v20 = (char *)&v94 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for MLHostTask();
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  v112 = (char *)&v94 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v24 = (os_unfair_lock_s *)(*(void *)(v2 + 56) + 16);
  os_unfair_lock_lock(v24);
  swift_beginAccess();
  uint64_t v111 = v2;
  uint64_t v25 = *(void *)(v2 + 64);
  if (*(void *)(v25 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v26 = sub_100034E9C(a1, a2);
    if (v27)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v22 + 16))(v20, *(void *)(v25 + 56) + *(void *)(v22 + 72) * v26, v21);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v20, 0, 1, v21);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56))(v20, 1, 1, v21);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56))(v20, 1, 1, v21);
  }
  swift_endAccess();
  os_unfair_lock_unlock(v24);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21) == 1)
  {
    sub_100010578((uint64_t)v20, &qword_1000655E8);
LABEL_22:
    if (qword_100064F68 != -1) {
      swift_once();
    }
    uint64_t v62 = type metadata accessor for Logger();
    sub_100010174(v62, (uint64_t)qword_1000667D0);
    swift_bridgeObjectRetain_n();
    id v63 = Logger.logObject.getter();
    os_log_type_t v64 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v63, v64))
    {
      uint64_t v65 = (uint8_t *)swift_slowAlloc();
      id v116 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v65 = 136315138;
      swift_bridgeObjectRetain();
      id v114 = (id)sub_10000E564(a1, a2, (uint64_t *)&v116);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v63, v64, "DynamicTask %s not found in registry.", v65, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  v96 = v24;
  uint64_t v28 = v112;
  (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v112, v20, v21);
  uint64_t v29 = v22;
  id v30 = sub_100014960();
  swift_bridgeObjectRetain();
  uint64_t v100 = a1;
  v98 = (void *)sub_100022B28((uint64_t)v30);
  unint64_t v32 = v31;
  swift_bridgeObjectRelease();
  unint64_t v101 = a2;
  swift_bridgeObjectRelease();
  unint64_t v99 = v32;
  if (!v32)
  {
    (*(void (**)(char *, uint64_t))(v29 + 8))(v28, v21);
    goto LABEL_21;
  }
  uint64_t v95 = v29;
  uint64_t v97 = v21;
  MLHostTask.taskType.getter();
  uint64_t v33 = v109;
  (*(void (**)(char *, void, uint64_t))(v109 + 104))(v15, enum case for TaskType.dynamicTask(_:), v12);
  sub_100024C88(&qword_100065620, (void (*)(uint64_t))&type metadata accessor for TaskType);
  dispatch thunk of RawRepresentable.rawValue.getter();
  dispatch thunk of RawRepresentable.rawValue.getter();
  if (v116 != v114 || v117 != v115)
  {
    char v35 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    long long v36 = *(void (**)(char *, uint64_t))(v33 + 8);
    v36(v15, v12);
    v36(v17, v12);
    if (v35) {
      goto LABEL_15;
    }
    (*(void (**)(char *, uint64_t))(v95 + 8))(v28, v97);
    swift_bridgeObjectRelease();
LABEL_21:
    a1 = v100;
    a2 = v101;
    goto LABEL_22;
  }
  swift_bridgeObjectRelease_n();
  uint64_t v34 = *(void (**)(char *, uint64_t))(v33 + 8);
  v34(v15, v12);
  v34(v17, v12);
LABEL_15:
  uint64_t v94 = 0;
  uint64_t v109 = *(void *)(v111 + 24);
  uint64_t v37 = v105;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v105 + 56))(v102, 1, 1, v110);
  uint64_t v38 = enum case for URL.DirectoryHint.inferFromPath(_:);
  long long v40 = v106;
  uint64_t v39 = v107;
  uint64_t v41 = *(void (**)(char *, uint64_t, uint64_t))(v107 + 104);
  uint64_t v42 = v108;
  v41(v106, enum case for URL.DirectoryHint.inferFromPath(_:), v108);
  swift_bridgeObjectRetain();
  uint64_t v43 = v103;
  URL.init(filePath:directoryHint:relativeTo:)();
  unint64_t v44 = v99;
  id v116 = v98;
  unint64_t v117 = v99;
  v41(v40, v38, v42);
  sub_100024B80();
  unint64_t v45 = v104;
  URL.appending<A>(path:directoryHint:)();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v40, v42);
  uint64_t v46 = *(void (**)(char *, uint64_t))(v37 + 8);
  uint64_t v47 = v110;
  v46(v43, v110);
  URL.path(percentEncoded:)(0);
  v46(v45, v47);
  uint64_t v48 = self;
  os_log_type_t v49 = &OBJC_PROTOCOL____TtP20LighthouseBackground26MLHostExtensionXPCProtocol_;
  id v50 = [v48 defaultManager];
  NSString v51 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v116 = 0;
  LODWORD(v38) = [v50 removeItemAtPath:v51 error:&v116];

  id v52 = v116;
  if (!v38) {
    goto LABEL_32;
  }
  uint64_t v53 = qword_100064F68;
  id v54 = v116;
  if (v53 != -1) {
    swift_once();
  }
  uint64_t v55 = type metadata accessor for Logger();
  sub_100010174(v55, (uint64_t)qword_1000667D0);
  swift_bridgeObjectRetain();
  id v56 = Logger.logObject.getter();
  os_log_type_t v57 = static os_log_type_t.info.getter();
  BOOL v58 = os_log_type_enabled(v56, v57);
  unint64_t v59 = v101;
  if (v58)
  {
    unint64_t v60 = v101;
    unsigned int v61 = (uint8_t *)swift_slowAlloc();
    id v116 = (id)swift_slowAlloc();
    *(_DWORD *)unsigned int v61 = 136315138;
    swift_bridgeObjectRetain();
    id v114 = (id)sub_10000E564((uint64_t)v98, v44, (uint64_t *)&v116);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    unint64_t v59 = v60;
    os_log_type_t v49 = &OBJC_PROTOCOL____TtP20LighthouseBackground26MLHostExtensionXPCProtocol_;
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v56, v57, "Removed task definition: %s", v61, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v66 = v97;
  uint64_t v67 = v96;
  uint64_t v68 = MLHostTask.taskFolder.getter();
  if (!v69) {
    goto LABEL_40;
  }
  uint64_t v70 = v68;
  unint64_t v71 = v69;
  id v72 = [v48 v49[42].opt_inst_meths];
  NSString v73 = String._bridgeToObjectiveC()();
  id v116 = 0;
  unsigned int v74 = [v72 removeItemAtPath:v73 error:&v116];

  id v52 = v116;
  if (!v74)
  {
LABEL_32:
    id v79 = v52;
    swift_bridgeObjectRelease();
    v80 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    id v116 = v80;
    sub_10000E508(&qword_1000655D0);
    sub_100010330(0, &qword_1000655D8);
    swift_dynamicCast();
    uint64_t v81 = v114;
    if (qword_100064F68 != -1) {
      swift_once();
    }
    uint64_t v82 = type metadata accessor for Logger();
    sub_100010174(v82, (uint64_t)qword_1000667D0);
    id v83 = v81;
    uint64_t v84 = Logger.logObject.getter();
    os_log_type_t v85 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v84, v85))
    {
      char v86 = (uint8_t *)swift_slowAlloc();
      uint64_t v87 = (void *)swift_slowAlloc();
      *(_DWORD *)char v86 = 138412290;
      id v113 = v83;
      id v88 = v83;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v87 = v83;

      _os_log_impl((void *)&_mh_execute_header, v84, v85, "Failed removing items: %@", v86, 0xCu);
      sub_10000E508(&qword_100065290);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v89 = v97;

    (*(void (**)(char *, uint64_t))(v95 + 8))(v112, v89);
    swift_errorRelease();
    return 0;
  }
  id v75 = v116;
  swift_bridgeObjectRetain();
  uint64_t v76 = Logger.logObject.getter();
  os_log_type_t v77 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v76, v77))
  {
    unint64_t v78 = (uint8_t *)swift_slowAlloc();
    id v116 = (id)swift_slowAlloc();
    *(_DWORD *)unint64_t v78 = 136315138;
    swift_bridgeObjectRetain();
    id v114 = (id)sub_10000E564(v70, v71, (uint64_t *)&v116);
    uint64_t v67 = v96;
    uint64_t v66 = v97;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v76, v77, "Removed task folder: %s", v78, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v68 = swift_bridgeObjectRelease_n();
  }
LABEL_40:
  uint64_t v91 = __chkstk_darwin(v68);
  uint64_t v92 = v100;
  *(&v94 - 4) = v111;
  *(&v94 - 3) = v92;
  *(&v94 - 2) = v59;
  __chkstk_darwin(v91);
  *(&v94 - 2) = (uint64_t)sub_100024C30;
  *(&v94 - 1) = v93;
  os_unfair_lock_lock(v67);
  sub_1000250A0();
  os_unfair_lock_unlock(v67);
  (*(void (**)(char *, uint64_t))(v95 + 8))(v112, v66);
  return 1;
}

uint64_t sub_100015E18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_10000E508(&qword_1000655E8);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  sub_1000209EC(a2, a3, (uint64_t)v7);
  swift_endAccess();
  return sub_100010578((uint64_t)v7, &qword_1000655E8);
}

char *sub_100015EEC()
{
  id v1 = sub_1000160A0();
  uint64_t v2 = v1;
  if (*((void *)v1 + 2))
  {
    uint64_t v3 = __chkstk_darwin(v1);
    __chkstk_darwin(v3);
    uint64_t v5 = v4 + 4;
    os_unfair_lock_lock(v4 + 4);
    sub_100024BF0();
    os_unfair_lock_unlock(v5);
    swift_bridgeObjectRetain();
    sub_100022E8C(v0, v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    if (qword_100064F68 != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    sub_100010174(v6, (uint64_t)qword_1000667D0);
    uint64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "No task pruned. Skipping cleanup.", v9, 2u);
      swift_slowDealloc();
    }

    return (char *)_swiftEmptyArrayStorage;
  }
  return v2;
}

char *sub_1000160A0()
{
  uint64_t v1 = sub_10000E508(&qword_1000655F8);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v106 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = type metadata accessor for Date();
  uint64_t v4 = *(void *)(v127 - 8);
  uint64_t v5 = __chkstk_darwin(v127);
  v112 = (char *)&v106 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  v118 = (char *)&v106 - v8;
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v106 - v9;
  uint64_t v11 = sub_10000E508(&qword_100065600);
  __chkstk_darwin(v11 - 8);
  v141 = (char *)&v106 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v144 = type metadata accessor for TaskDefinition();
  uint64_t v13 = *(void *)(v144 - 8);
  uint64_t v14 = __chkstk_darwin(v144);
  uint64_t v115 = (char *)&v106 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v143 = (char *)&v106 - v16;
  uint64_t v140 = type metadata accessor for URL.DirectoryHint();
  uint64_t v17 = *(void *)(v140 - 8);
  __chkstk_darwin(v140);
  v139 = (char *)&v106 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_10000E508(&qword_1000655C0);
  __chkstk_darwin(v19 - 8);
  v138 = (char *)&v106 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v148 = type metadata accessor for URL();
  uint64_t v21 = *(void *)(v148 - 8);
  uint64_t v22 = __chkstk_darwin(v148);
  v137 = (char *)&v106 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  v136 = (char *)&v106 - v24;
  uint64_t v25 = sub_100014960();
  int64_t v27 = 0;
  uint64_t v120 = 0;
  uint64_t v28 = v25[7];
  v128 = (char *)(v25 + 7);
  v142 = v25;
  uint64_t v29 = 1 << *((unsigned char *)v25 + 32);
  uint64_t v30 = -1;
  if (v29 < 64) {
    uint64_t v30 = ~(-1 << v29);
  }
  unint64_t v31 = v30 & v28;
  int64_t v129 = (unint64_t)(v29 + 63) >> 6;
  v135 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56);
  unsigned int v134 = enum case for URL.DirectoryHint.inferFromPath(_:);
  v133 = (void (**)(char *, uint64_t, uint64_t))(v17 + 104);
  v132 = (void (**)(char *, uint64_t))(v17 + 8);
  v131 = (void (**)(char *, uint64_t))(v21 + 8);
  v130 = (unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  v124 = (void (**)(char *, char *, uint64_t))(v13 + 32);
  v123 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  unint64_t v117 = (void (**)(char *, uint64_t, uint64_t))(v4 + 32);
  v126 = (void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v111 = (void (**)(char *, char *, uint64_t))(v13 + 16);
  uint64_t v110 = (void (**)(char *, char *, uint64_t))(v4 + 16);
  v122 = (void (**)(char *, uint64_t))(v13 + 8);
  uint64_t v108 = &v152;
  id v113 = &v151;
  uint64_t v107 = (char *)_swiftEmptyArrayStorage;
  *(void *)&long long v26 = 136315138;
  long long v119 = v26;
  id v116 = (char *)&type metadata for Any + 8;
  *(void *)&long long v26 = 136315394;
  long long v114 = v26;
  uint64_t v149 = v0;
  v125 = v3;
  v121 = v10;
  while (1)
  {
    if (v31)
    {
      uint64_t v146 = (v31 - 1) & v31;
      int64_t v147 = v27;
      unint64_t v32 = __clz(__rbit64(v31)) | (v27 << 6);
      goto LABEL_19;
    }
    BOOL v33 = __OFADD__(v27, 1);
    int64_t v34 = v27 + 1;
    if (v33)
    {
      __break(1u);
      goto LABEL_56;
    }
    if (v34 >= v129) {
      goto LABEL_54;
    }
    unint64_t v35 = *(void *)&v128[8 * v34];
    if (!v35) {
      break;
    }
LABEL_18:
    uint64_t v146 = (v35 - 1) & v35;
    int64_t v147 = v34;
    unint64_t v32 = __clz(__rbit64(v35)) + (v34 << 6);
LABEL_19:
    uint64_t v37 = v142[6] + 16 * v32;
    uint64_t v39 = *(void (**)(char *, uint64_t))v37;
    uint64_t v38 = *(void **)(v37 + 8);
    v145 = *(void (**)(char *, uint64_t))(v149 + 24);
    (*v135)(v138, 1, 1, v148);
    long long v40 = *v133;
    uint64_t v41 = v139;
    uint64_t v42 = v140;
    uint64_t v43 = v134;
    (*v133)(v139, v134, v140);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v44 = v137;
    unint64_t v45 = (unint64_t)v38;
    URL.init(filePath:directoryHint:relativeTo:)();
    v145 = v39;
    v154[0] = v39;
    v154[1] = v38;
    v40(v41, v43, v42);
    sub_100024B80();
    uint64_t v46 = v136;
    URL.appending<A>(path:directoryHint:)();
    (*v132)(v41, v42);
    uint64_t v47 = *v131;
    uint64_t v48 = v148;
    (*v131)(v44, v148);
    Swift::String v49 = URL.path(percentEncoded:)(1);
    v47(v46, v48);
    id v50 = v141;
    sub_1000178F0(v49._countAndFlagsBits, (unint64_t)v49._object, v141);
    uint64_t v51 = v144;
    if ((*v130)(v50, 1, v144) == 1)
    {
      swift_bridgeObjectRelease();
      sub_100010578((uint64_t)v50, &qword_100065600);
      if (qword_100064F68 != -1) {
        swift_once();
      }
      uint64_t v52 = type metadata accessor for Logger();
      sub_100010174(v52, (uint64_t)qword_1000667D0);
      swift_bridgeObjectRetain();
      uint64_t v53 = Logger.logObject.getter();
      os_log_type_t v54 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v53, v54))
      {
        uint64_t v55 = swift_slowAlloc();
        v154[0] = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v55 = v119;
        swift_bridgeObjectRetain();
        *(void *)(v55 + 4) = sub_10000E564((uint64_t)v145, v45, (uint64_t *)v154);
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v53, v54, "Found invalid definition file: %s", (uint8_t *)v55, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      goto LABEL_5;
    }
    (*v124)(v143, v50, v51);
    uint64_t v56 = (uint64_t)v125;
    TaskDefinition.endDate.getter();
    uint64_t v57 = v127;
    int v58 = (*v123)(v56, 1, v127);
    unint64_t v59 = v126;
    if (v58 == 1)
    {
      sub_100010578(v56, &qword_1000655F8);
      goto LABEL_32;
    }
    unint64_t v60 = v121;
    (*v117)(v121, v56, v57);
    unsigned int v61 = v118;
    static Date.now.getter();
    char v62 = static Date.> infix(_:_:)();
    id v63 = *v59;
    (*v59)(v61, v57);
    if ((v62 & 1) == 0)
    {
      v63(v60, v57);
      uint64_t v51 = v144;
LABEL_32:
      id v78 = [self defaultManager];
      NSString v79 = String._bridgeToObjectiveC()();
      v154[0] = 0;
      unsigned int v80 = [v78 removeItemAtPath:v79 error:v154];

      if (v80)
      {
        id v92 = v154[0];
        swift_bridgeObjectRelease();
        if (qword_100064F68 != -1) {
          swift_once();
        }
        uint64_t v93 = type metadata accessor for Logger();
        sub_100010174(v93, (uint64_t)qword_1000667D0);
        swift_bridgeObjectRetain();
        uint64_t v94 = Logger.logObject.getter();
        os_log_type_t v95 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v94, v95))
        {
          uint64_t v96 = swift_slowAlloc();
          v154[0] = (id)swift_slowAlloc();
          *(_DWORD *)uint64_t v96 = v119;
          swift_bridgeObjectRetain();
          *(void *)(v96 + 4) = sub_10000E564((uint64_t)v145, v45, (uint64_t *)v154);
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v94, v95, "Removed expired task definition: %s", (uint8_t *)v96, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        uint64_t v97 = v143;
        uint64_t v98 = TaskDefinition.name.getter();
        uint64_t v100 = v99;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v107 = sub_1000202A8(0, *((void *)v107 + 2) + 1, 1, v107);
        }
        unint64_t v102 = *((void *)v107 + 2);
        unint64_t v101 = *((void *)v107 + 3);
        if (v102 >= v101 >> 1) {
          uint64_t v107 = sub_1000202A8((char *)(v101 > 1), v102 + 1, 1, v107);
        }
        long long v103 = v107;
        *((void *)v107 + 2) = v102 + 1;
        long long v104 = &v103[16 * v102];
        *((void *)v104 + 4) = v98;
        *((void *)v104 + 5) = v100;
        (*v122)(v97, v51);
      }
      else
      {
        id v81 = v154[0];
        swift_bridgeObjectRelease();
        uint64_t v82 = (void *)_convertNSErrorToError(_:)();

        swift_willThrow();
        v154[0] = v82;
        sub_10000E508(&qword_1000655D0);
        sub_100010330(0, &qword_1000655D8);
        swift_dynamicCast();
        id v83 = (void *)v151;
        if (qword_100064F68 != -1) {
          swift_once();
        }
        uint64_t v84 = type metadata accessor for Logger();
        sub_100010174(v84, (uint64_t)qword_1000667D0);
        id v85 = v83;
        swift_bridgeObjectRetain();
        char v86 = Logger.logObject.getter();
        os_log_type_t v87 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v86, v87))
        {
          uint64_t v88 = swift_slowAlloc();
          uint64_t v89 = (void *)swift_slowAlloc();
          uint64_t v153 = swift_slowAlloc();
          *(_DWORD *)uint64_t v88 = v114;
          swift_bridgeObjectRetain();
          uint64_t v150 = sub_10000E564(v49._countAndFlagsBits, (unint64_t)v49._object, &v153);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v88 + 12) = 2112;
          uint64_t v150 = (uint64_t)v85;
          id v90 = v85;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *uint64_t v89 = v85;

          _os_log_impl((void *)&_mh_execute_header, v86, v87, "Failed at removing task definition: %s %@", (uint8_t *)v88, 0x16u);
          sub_10000E508(&qword_100065290);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          (*v122)(v143, v144);
        }
        else
        {
          swift_bridgeObjectRelease_n();

          (*v122)(v143, v51);
        }
        swift_errorRelease();
        uint64_t v120 = 0;
      }
      goto LABEL_5;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_100064F68 != -1) {
      swift_once();
    }
    uint64_t v64 = type metadata accessor for Logger();
    sub_100010174(v64, (uint64_t)qword_1000667D0);
    uint64_t v65 = v115;
    uint64_t v67 = v143;
    uint64_t v66 = v144;
    (*v111)(v115, v143, v144);
    uint64_t v68 = v112;
    unint64_t v69 = v121;
    (*v110)(v112, v121, v57);
    uint64_t v70 = Logger.logObject.getter();
    os_log_type_t v71 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v70, v71))
    {
      uint64_t v72 = swift_slowAlloc();
      uint64_t v109 = (void *)swift_slowAlloc();
      v154[0] = v109;
      *(_DWORD *)uint64_t v72 = v114;
      uint64_t v73 = TaskDefinition.name.getter();
      uint64_t v151 = sub_10000E564(v73, v74, (uint64_t *)v154);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v145 = *v122;
      v145(v115, v144);
      *(_WORD *)(v72 + 12) = 2080;
      sub_100024C88(&qword_100065608, (void (*)(uint64_t))&type metadata accessor for Date);
      uint64_t v75 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v151 = sub_10000E564(v75, v76, (uint64_t *)v154);
      uint64_t v77 = v127;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v63(v68, v77);
      _os_log_impl((void *)&_mh_execute_header, v70, v71, "Skipping %s because expiration date is in the future %s", (uint8_t *)v72, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v63(v69, v77);
      v145(v143, v144);
    }
    else
    {

      v63(v68, v57);
      uint64_t v91 = *v122;
      (*v122)(v65, v66);
      v63(v69, v57);
      v91(v67, v66);
    }
LABEL_5:
    unint64_t v31 = v146;
    int64_t v27 = v147;
  }
  int64_t v36 = v34 + 1;
  if (v34 + 1 >= v129) {
    goto LABEL_54;
  }
  unint64_t v35 = *(void *)&v128[8 * v36];
  if (v35) {
    goto LABEL_17;
  }
  int64_t v36 = v34 + 2;
  if (v34 + 2 >= v129) {
    goto LABEL_54;
  }
  unint64_t v35 = *(void *)&v128[8 * v36];
  if (v35)
  {
LABEL_17:
    int64_t v34 = v36;
    goto LABEL_18;
  }
  int64_t v36 = v34 + 3;
  if (v34 + 3 < v129)
  {
    unint64_t v35 = *(void *)&v128[8 * v36];
    if (!v35)
    {
      while (1)
      {
        int64_t v34 = v36 + 1;
        if (__OFADD__(v36, 1)) {
          break;
        }
        if (v34 >= v129) {
          goto LABEL_54;
        }
        unint64_t v35 = *(void *)&v128[8 * v34];
        ++v36;
        if (v35) {
          goto LABEL_18;
        }
      }
LABEL_56:
      __break(1u);
    }
    goto LABEL_17;
  }
LABEL_54:
  swift_release();
  return v107;
}

uint64_t sub_100017338(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_10000E508(&qword_1000655E8);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for MLHostTask();
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t result = __chkstk_darwin(v9);
  uint64_t v47 = (char *)v38 - v13;
  uint64_t v14 = *(void *)(a1 + 16);
  if (v14)
  {
    uint64_t v45 = v12;
    uint64_t v46 = v11;
    long long v38[2] = v2;
    uint64_t v15 = (uint64_t *)(a2 + 64);
    Swift::String v49 = (void (**)(char *, char *, uint64_t))(v11 + 32);
    id v50 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
    uint64_t v48 = (unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    uint64_t v42 = (void (**)(uint64_t, uint64_t))(v11 + 8);
    uint64_t v43 = (void (**)(uint64_t, char *, uint64_t))(v11 + 16);
    swift_bridgeObjectRetain();
    v38[1] = a1;
    uint64_t v16 = (uint64_t *)(a1 + 40);
    *(void *)&long long v17 = 136315138;
    long long v39 = v17;
    v38[3] = (char *)&type metadata for Any + 8;
    long long v40 = v7;
    unint64_t v44 = (uint64_t *)(a2 + 64);
    do
    {
      uint64_t v18 = *(v16 - 1);
      uint64_t v19 = *v16;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v20 = sub_100034E9C(v18, v19);
      char v22 = v21;
      swift_bridgeObjectRelease();
      if (v22)
      {
        int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v24 = *v15;
        uint64_t v52 = *v15;
        *uint64_t v15 = 0x8000000000000000;
        if (!isUniquelyReferenced_nonNull_native)
        {
          sub_100020DEC((uint64_t (*)(void))&type metadata accessor for MLHostTask, &qword_1000655F0);
          uint64_t v24 = v52;
        }
        swift_bridgeObjectRelease();
        (*(void (**)(char *, unint64_t, uint64_t))(v46 + 32))(v7, *(void *)(v24 + 56) + *(void *)(v46 + 72) * v20, v8);
        sub_100020BB0(v20, v24);
        *uint64_t v15 = v24;
        swift_bridgeObjectRelease();
        uint64_t v25 = 0;
      }
      else
      {
        uint64_t v25 = 1;
      }
      (*v50)(v7, v25, 1, v8);
      swift_endAccess();
      swift_bridgeObjectRelease();
      if ((*v48)(v7, 1, v8) == 1)
      {
        sub_100010578((uint64_t)v7, &qword_1000655E8);
      }
      else
      {
        long long v26 = v47;
        (*v49)(v47, v7, v8);
        uint64_t v27 = v8;
        if (qword_100064F68 != -1) {
          swift_once();
        }
        uint64_t v28 = type metadata accessor for Logger();
        sub_100010174(v28, (uint64_t)qword_1000667D0);
        uint64_t v29 = v45;
        (*v43)(v45, v26, v27);
        uint64_t v30 = Logger.logObject.getter();
        os_log_type_t v31 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v30, v31))
        {
          uint64_t v32 = swift_slowAlloc();
          uint64_t v41 = swift_slowAlloc();
          v51[0] = v41;
          *(_DWORD *)uint64_t v32 = v39;
          uint64_t v33 = MLHostTask.name.getter();
          *(void *)(v32 + 4) = sub_10000E564(v33, v34, v51);
          swift_bridgeObjectRelease();
          unint64_t v35 = *v42;
          (*v42)(v29, v27);
          int64_t v36 = (void (*)(char *, uint64_t))v35;
          _os_log_impl((void *)&_mh_execute_header, v30, v31, "Task %s is removed from TaskRegistry", (uint8_t *)v32, 0xCu);
          swift_arrayDestroy();
          uint64_t v7 = v40;
          swift_slowDealloc();
          swift_slowDealloc();

          v36(v47, v27);
        }
        else
        {

          uint64_t v37 = *v42;
          (*v42)(v29, v27);
          v37((uint64_t)v26, v27);
        }
        uint64_t v8 = v27;
        uint64_t v15 = v44;
      }
      v16 += 2;
      --v14;
    }
    while (v14);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100017828(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1000178F0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v6 = type metadata accessor for TaskValidationError();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v48 = (char *)v40 - v10;
  __chkstk_darwin(v9);
  uint64_t v11 = sub_10000E508(&qword_100065600);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = type metadata accessor for TaskDefinition();
  uint64_t v14 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v16 = (char *)v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17._countAndFlagsBits = 0x7473696C702ELL;
  v17._object = (void *)0xE600000000000000;
  if (String.hasSuffix(_:)(v17))
  {
    uint64_t v42 = v7;
    uint64_t v47 = a3;
    id v18 = [self defaultManager];
    uint64_t v46 = a1;
    NSString v19 = String._bridgeToObjectiveC()();
    id v20 = [v18 contentsAtPath:v19];

    if (v20)
    {
      uint64_t v41 = v16;
      uint64_t v21 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v23 = v22;

      type metadata accessor for PropertyListDecoder();
      swift_allocObject();
      uint64_t v24 = PropertyListDecoder.init()();
      sub_100024C88(&qword_100065250, (void (*)(uint64_t))&type metadata accessor for TaskDefinition);
      uint64_t v25 = v49;
      uint64_t v44 = v21;
      unint64_t v45 = v23;
      uint64_t v43 = v24;
      dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
      v40[5] = v6;
      v40[6] = a2;
      unint64_t v35 = *(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56);
      v35(v13, 0, 1, v25);
      v40[7] = v14;
      int64_t v36 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
      uint64_t v37 = v41;
      v36(v41, v13, v25);
      validateTaskDefinition(_:)();
      swift_release();
      sub_100010270(v44, v45);
      uint64_t v38 = v47;
      v36(v47, v37, v25);
      return ((uint64_t (*)(char *, void, uint64_t, uint64_t))v35)(v38, 0, 1, v25);
    }
    else
    {
      if (qword_100064F68 != -1) {
        swift_once();
      }
      uint64_t v31 = type metadata accessor for Logger();
      sub_100010174(v31, (uint64_t)qword_1000667D0);
      swift_bridgeObjectRetain_n();
      uint64_t v32 = Logger.logObject.getter();
      os_log_type_t v33 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v32, v33))
      {
        unint64_t v34 = (uint8_t *)swift_slowAlloc();
        v51[0] = swift_slowAlloc();
        *(_DWORD *)unint64_t v34 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v50 = sub_10000E564(v46, a2, v51);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v32, v33, "Failed reading data from: %s", v34, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v47, 1, 1, v49);
    }
  }
  else
  {
    uint64_t v26 = a1;
    if (qword_100064F68 != -1) {
      swift_once();
    }
    uint64_t v27 = type metadata accessor for Logger();
    sub_100010174(v27, (uint64_t)qword_1000667D0);
    swift_bridgeObjectRetain_n();
    uint64_t v28 = Logger.logObject.getter();
    os_log_type_t v29 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      v51[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v50 = sub_10000E564(v26, a2, v51);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "Invalid task definition file: %s", v30, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(a3, 1, 1, v49);
  }
}

uint64_t sub_1000188C0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, unsigned char *a3@<X8>)
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v6 = swift_bridgeObjectRetain();
  char v7 = sub_100024CD0(v6, a1, a2);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_100018964(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v30 = a1;
  uint64_t v5 = sub_10000E508(&qword_1000655F8);
  __chkstk_darwin(v5 - 8);
  char v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TaskStatus();
  uint64_t v28 = *(void *)(v8 - 8);
  uint64_t v29 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000E508(&qword_1000655E8);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for MLHostTask();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  Swift::String v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v18 = (os_unfair_lock_s *)(*(void *)(v2 + 56) + 16);
  os_unfair_lock_lock(v18);
  swift_beginAccess();
  uint64_t v19 = *(void *)(v2 + 64);
  if (*(void *)(v19 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v20 = sub_100034E9C(v30, a2);
    if (v21)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v13, *(void *)(v19 + 56) + *(void *)(v15 + 72) * v20, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v13, 0, 1, v14);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
  }
  swift_endAccess();
  os_unfair_lock_unlock(v18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1) {
    return sub_100010578((uint64_t)v13, &qword_1000655E8);
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v13, v14);
  (*(void (**)(char *, void, uint64_t))(v28 + 104))(v10, enum case for TaskStatus.taskNotStarted(_:), v29);
  MLHostTask.status.setter();
  Date.init()();
  uint64_t v23 = type metadata accessor for Date();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v7, 0, 1, v23);
  uint64_t v24 = MLHostTask.lastExecutionDate.setter();
  uint64_t v25 = __chkstk_darwin(v24);
  *(&v27 - 2) = v3;
  *(&v27 - 1) = (uint64_t)v17;
  __chkstk_darwin(v25);
  *(&v27 - 2) = (uint64_t)sub_100024C50;
  *(&v27 - 1) = v26;
  os_unfair_lock_lock(v18);
  sub_1000250A0();
  os_unfair_lock_unlock(v18);
  sub_100019560((uint64_t)v17);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

uint64_t sub_100018D90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v28 = a3;
  uint64_t v7 = type metadata accessor for TaskStatus();
  uint64_t v26 = *(void *)(v7 - 8);
  uint64_t v27 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10000E508(&qword_1000655E8);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for MLHostTask();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  Swift::String v17 = (os_unfair_lock_s *)(*(void *)(v3 + 56) + 16);
  os_unfair_lock_lock(v17);
  swift_beginAccess();
  uint64_t v18 = *(void *)(v3 + 64);
  if (*(void *)(v18 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v19 = sub_100034E9C(a1, a2);
    if (v20)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v12, *(void *)(v18 + 56) + *(void *)(v14 + 72) * v19, v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
  }
  swift_endAccess();
  os_unfair_lock_unlock(v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1) {
    return sub_100010578((uint64_t)v12, &qword_1000655E8);
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v9, v28, v27);
  uint64_t v22 = MLHostTask.status.setter();
  uint64_t v23 = __chkstk_darwin(v22);
  *(&v25 - 2) = v4;
  *(&v25 - 1) = (uint64_t)v16;
  __chkstk_darwin(v23);
  *(&v25 - 2) = (uint64_t)sub_1000250BC;
  *(&v25 - 1) = v24;
  os_unfair_lock_lock(v17);
  sub_1000250A0();
  os_unfair_lock_unlock(v17);
  sub_100019560((uint64_t)v16);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

void sub_100019120(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5 = v4;
  if (qword_100064F68 != -1) {
    swift_once();
  }
  uint64_t v10 = type metadata accessor for Logger();
  sub_100010174(v10, (uint64_t)qword_1000667D0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v20 = v5;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315394;
    swift_bridgeObjectRetain();
    sub_10000E564(a1, a2, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_10000E564(a3, a4, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Persisting task error: %s %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v5 = v20;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  sub_100010330(0, &qword_100065628);
  Class isa = NSNumber.init(integerLiteral:)(1).super.super.isa;
  id v15 = objc_allocWithZone((Class)BMLighthouseTaskError);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  NSString v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v18 = [v15 initWithVersion:isa taskName:v16 errorCode:v17];

  id v19 = [*(id *)(v5 + 80) source];
  [v19 sendEvent:v18];
}

uint64_t sub_100019418(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_10000E508(&qword_1000655E8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MLHostTask.name.getter();
  uint64_t v8 = v7;
  uint64_t v9 = type metadata accessor for MLHostTask();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v5, a2, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v5, 0, 1, v9);
  swift_beginAccess();
  sub_100013820((uint64_t)v5, v6, v8);
  return swift_endAccess();
}

void sub_100019560(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for TaskStatus();
  uint64_t v26 = *(void *)(v4 - 8);
  uint64_t v27 = v4;
  __chkstk_darwin(v4);
  uint64_t v25 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for MLHostTask();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100064F68 != -1) {
    swift_once();
  }
  uint64_t v10 = type metadata accessor for Logger();
  sub_100010174(v10, (uint64_t)qword_1000667D0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    v23[1] = a1;
    uint64_t v24 = v1;
    *(_DWORD *)uint64_t v13 = 136315138;
    uint64_t v14 = MLHostTask.description.getter();
    uint64_t v28 = sub_10000E564(v14, v15, &v29);
    uint64_t v2 = v24;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Persisting task: %s", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }

  sub_100010330(0, &qword_100065628);
  Class isa = NSNumber.init(integerLiteral:)(1).super.super.isa;
  MLHostTask.name.getter();
  NSString v17 = v25;
  MLHostTask.status.getter();
  TaskStatus.rawValue.getter();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v17, v27);
  id v18 = objc_allocWithZone((Class)BMLighthouseTaskStatus);
  NSString v19 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v21 = [v18 initWithVersion:isa taskName:v19 taskState:v20 taskSource:0 pushMetadata:0 pullMetadata:0];

  id v22 = [*(id *)(v2 + 72) source];
  [v22 sendEvent:v21];
}

void sub_10001994C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v83 = a3;
  uint64_t v84 = a1;
  unint64_t v85 = a2;
  uint64_t v7 = sub_10000E508(&qword_1000655F8);
  __chkstk_darwin(v7 - 8);
  unsigned int v80 = (char *)&v76 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for TaskStatus();
  uint64_t v79 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v76 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000E508(&qword_100065638);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v76 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10000E508(&qword_100065640);
  __chkstk_darwin(v15 - 8);
  NSString v17 = (char *)&v76 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for PushMetadata();
  uint64_t v86 = *(void *)(v18 - 8);
  uint64_t v87 = v18;
  __chkstk_darwin(v18);
  NSString v20 = (char *)&v76 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for DynamicTaskSource();
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)&v76 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 16);
  uint64_t v81 = a4;
  v25(v24, a4, v21);
  int v26 = (*(uint64_t (**)(char *, uint64_t))(v22 + 88))(v24, v21);
  if (v26 == enum case for DynamicTaskSource.push(_:))
  {
    sub_100024E4C(a5, (uint64_t)v14);
    uint64_t v27 = type metadata accessor for TaskMetadata();
    uint64_t v28 = *(void *)(v27 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v14, 1, v27) == 1)
    {
      sub_100010578((uint64_t)v14, &qword_100065638);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v86 + 56))(v17, 1, 1, v87);
LABEL_10:
      sub_100010578((uint64_t)v17, &qword_100065640);
      if (qword_100064F68 != -1) {
        swift_once();
      }
      uint64_t v36 = type metadata accessor for Logger();
      sub_100010174(v36, (uint64_t)qword_1000667D0);
      uint64_t v30 = Logger.logObject.getter();
      os_log_type_t v31 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled(v30, v31)) {
        goto LABEL_15;
      }
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v32 = 0;
      os_log_type_t v33 = "Incomplete push metadata.";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v30, v31, v33, v32, 2u);
      swift_slowDealloc();
LABEL_15:

      return;
    }
    TaskMetadata.pushMetadata.getter();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v14, v27);
    uint64_t v35 = v86;
    uint64_t v34 = v87;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v86 + 48))(v17, 1, v87) == 1) {
      goto LABEL_10;
    }
    (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v20, v17, v34);
    if (qword_100064F68 != -1) {
      swift_once();
    }
    uint64_t v41 = type metadata accessor for Logger();
    sub_100010174(v41, (uint64_t)qword_1000667D0);
    uint64_t v42 = v79;
    (*(void (**)(char *, uint64_t, uint64_t))(v79 + 16))(v11, v83, v9);
    unint64_t v43 = v85;
    swift_bridgeObjectRetain_n();
    uint64_t v44 = Logger.logObject.getter();
    os_log_type_t v45 = static os_log_type_t.debug.getter();
    BOOL v46 = os_log_type_enabled(v44, v45);
    uint64_t v47 = v84;
    if (v46)
    {
      uint64_t v48 = v42;
      uint64_t v49 = swift_slowAlloc();
      uint64_t v78 = swift_slowAlloc();
      uint64_t v89 = v78;
      *(_DWORD *)uint64_t v49 = 136315394;
      os_log_t v77 = v44;
      swift_bridgeObjectRetain();
      uint64_t v88 = sub_10000E564(v47, v43, &v89);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v49 + 12) = 2080;
      uint64_t v50 = TaskStatus.rawValue.getter();
      uint64_t v88 = sub_10000E564(v50, v51, &v89);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v11, v9);
      os_log_t v52 = v77;
      _os_log_impl((void *)&_mh_execute_header, v77, v45, "Donating task status for push event: taskName: %s, taskStatus: %s", (uint8_t *)v49, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v42 + 8))(v11, v9);
    }
    uint64_t v53 = PushMetadata.topic.getter();
    uint64_t v78 = v54;
    uint64_t v79 = v53;
    uint64_t v55 = PushMetadata.channelID.getter();
    uint64_t v57 = v56;
    uint64_t v58 = PushMetadata.pushType.getter();
    uint64_t v60 = v59;
    uint64_t v61 = PushMetadata.pushPriority.getter();
    uint64_t v63 = v62;
    uint64_t v64 = (uint64_t)v80;
    PushMetadata.creationDate.getter();
    uint64_t v65 = type metadata accessor for Date();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v65 - 8) + 56))(v64, 0, 1, v65);
    id v66 = objc_allocWithZone((Class)BMLighthouseTaskStatusPushMetadata);
    id v67 = sub_1000200B8(v79, v78, v55, v57, v58, v60, v61, v63, v64);
    sub_100010330(0, &qword_100065628);
    Class isa = NSNumber.init(integerLiteral:)(1).super.super.isa;
    TaskStatus.rawValue.getter();
    DynamicTaskSource.rawValue.getter();
    id v69 = objc_allocWithZone((Class)BMLighthouseTaskStatus);
    swift_bridgeObjectRetain();
    id v70 = v67;
    NSString v71 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    NSString v72 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    NSString v73 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v74 = [v69 initWithVersion:isa taskName:v71 taskState:v72 taskSource:v73 pushMetadata:v70 pullMetadata:0];

    id v75 = [*(id *)(v82 + 72) source];
    [v75 sendEvent:v74];

    (*(void (**)(char *, uint64_t))(v86 + 8))(v20, v87);
  }
  else
  {
    if (v26 == enum case for DynamicTaskSource.pull(_:))
    {
      if (qword_100064F68 != -1) {
        swift_once();
      }
      uint64_t v29 = type metadata accessor for Logger();
      sub_100010174(v29, (uint64_t)qword_1000667D0);
      uint64_t v30 = Logger.logObject.getter();
      os_log_type_t v31 = static os_log_type_t.debug.getter();
      if (!os_log_type_enabled(v30, v31)) {
        goto LABEL_15;
      }
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v32 = 0;
      os_log_type_t v33 = "Donating task status for pull events is not implemented yet.";
      goto LABEL_14;
    }
    if (qword_100064F68 != -1) {
      swift_once();
    }
    uint64_t v37 = type metadata accessor for Logger();
    sub_100010174(v37, (uint64_t)qword_1000667D0);
    uint64_t v38 = Logger.logObject.getter();
    os_log_type_t v39 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v38, v39))
    {
      long long v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v40 = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "Invalid taskSource, skipping donation.", v40, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  }
}

uint64_t sub_10001A388@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v153 = a2;
  uint64_t v3 = type metadata accessor for TaskValidationError();
  uint64_t v149 = *(void (**)(void, void, void))(v3 - 8);
  uint64_t v150 = (char *)v3;
  uint64_t v4 = __chkstk_darwin(v3);
  v142 = (char *)v128 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v148 = (char *)v128 - v7;
  __chkstk_darwin(v6);
  countAndFlagsBits = (char *)v128 - v8;
  uint64_t v134 = type metadata accessor for TaskType();
  uint64_t v133 = *(void *)(v134 - 8);
  __chkstk_darwin(v134);
  v132 = (char *)v128 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for MLHostTask();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v151 = v10;
  uint64_t v152 = v11;
  __chkstk_darwin(v10);
  v135 = (char *)v128 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v156 = type metadata accessor for TaskDefinition();
  uint64_t v154 = *(void *)(v156 - 8);
  uint64_t v13 = __chkstk_darwin(v156);
  v143 = (void (*)(char *, char *))((char *)v128 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v144 = (char *)v128 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v146 = (char *)v128 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  v136 = (char *)v128 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  v130 = (char *)v128 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v131 = (uint64_t)v128 - v24;
  __chkstk_darwin(v23);
  int64_t v129 = (char *)v128 - v25;
  v145 = (void *)type metadata accessor for URL.DirectoryHint();
  uint64_t v140 = *(v145 - 1);
  __chkstk_darwin(v145);
  v139 = (char *)v128 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_10000E508(&qword_1000655C0);
  __chkstk_darwin(v27 - 8);
  v137 = (char *)v128 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = type metadata accessor for URL();
  uint64_t v138 = *(void *)(v29 - 8);
  uint64_t v30 = __chkstk_darwin(v29);
  uint64_t v32 = (char *)v128 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  uint64_t v34 = (char *)v128 - v33;
  uint64_t v35 = sub_10000E508(&qword_1000655F8);
  __chkstk_darwin(v35 - 8);
  uint64_t v37 = (char *)v128 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = type metadata accessor for Date();
  uint64_t v39 = *(void *)(v38 - 8);
  uint64_t v40 = __chkstk_darwin(v38);
  uint64_t v42 = (char *)v128 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v40);
  uint64_t v44 = (char *)v128 - v43;
  validateTaskDefinition(_:)();
  uint64_t v155 = a1;
  countAndFlagsBits = v32;
  uint64_t v148 = v34;
  uint64_t v149 = (void (*)(void, void, void))v29;
  os_log_type_t v45 = v145;
  v128[1] = 0;
  BOOL v46 = v146;
  uint64_t v150 = v44;
  TaskDefinition.endDate.getter();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v37, 1, v38) == 1)
  {
    sub_100010578((uint64_t)v37, &qword_1000655F8);
LABEL_13:
    uint64_t v88 = v155;
    uint64_t v89 = v156;
    uint64_t v90 = v154;
    if (qword_100064F68 != -1) {
      swift_once();
    }
    uint64_t v91 = type metadata accessor for Logger();
    sub_100010174(v91, (uint64_t)qword_1000667D0);
    (*(void (**)(char *, uint64_t, uint64_t))(v90 + 16))(v46, v88, v89);
    id v92 = Logger.logObject.getter();
    os_log_type_t v93 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v92, v93))
    {
      uint64_t v94 = (uint8_t *)swift_slowAlloc();
      v158[0] = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v94 = 136315138;
      uint64_t v95 = TaskDefinition.name.getter();
      uint64_t v160 = sub_10000E564(v95, v96, (uint64_t *)v158);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v90 + 8))(v46, v89);
      _os_log_impl((void *)&_mh_execute_header, v92, v93, "Task %s must have a valid endDate (> now).", v94, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v90 + 8))(v46, v89);
    }

    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v152 + 56))(v153, 1, 1, v151);
  }
  uint64_t v47 = v150;
  (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v150, v37, v38);
  static Date.now.getter();
  char v48 = static Date.> infix(_:_:)();
  unint64_t v51 = *(char **)(v39 + 8);
  uint64_t v50 = (char *)(v39 + 8);
  uint64_t v49 = v51;
  ((void (*)(char *, uint64_t))v51)(v42, v38);
  if ((v48 & 1) == 0)
  {
    ((void (*)(char *, uint64_t))v49)(v47, v38);
    goto LABEL_13;
  }
  uint64_t v144 = (char *)v38;
  uint64_t v146 = v50;
  uint64_t v52 = v155;
  uint64_t v53 = v141;
  sub_10001BE14(v155);
  if (!v54)
  {
    if (qword_100064F68 != -1) {
      swift_once();
    }
    uint64_t v98 = type metadata accessor for Logger();
    sub_100010174(v98, (uint64_t)qword_1000667D0);
    uint64_t v99 = v154;
    uint64_t v100 = v136;
    uint64_t v101 = v156;
    (*(void (**)(char *, uint64_t, uint64_t))(v154 + 16))(v136, v52, v156);
    unint64_t v102 = Logger.logObject.getter();
    os_log_type_t v103 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v102, v103))
    {
      long long v104 = (uint8_t *)swift_slowAlloc();
      uint64_t v105 = (void *)swift_slowAlloc();
      v143 = (void (*)(char *, char *))v49;
      v158[0] = v105;
      *(_DWORD *)long long v104 = 136315138;
      uint64_t v106 = TaskDefinition.name.getter();
      uint64_t v160 = sub_10000E564(v106, v107, (uint64_t *)v158);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v99 + 8))(v100, v101);
      _os_log_impl((void *)&_mh_execute_header, v102, v103, "Failed at storing taskDefinition: %s", v104, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v143(v150, v144);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v99 + 8))(v100, v101);
      ((void (*)(char *, char *))v49)(v150, v144);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v152 + 56))(v153, 1, 1, v151);
  }
  v143 = (void (*)(char *, char *))v49;
  swift_bridgeObjectRelease();
  v142 = *(char **)(v53 + 40);
  uint64_t v55 = v138;
  (*(void (**)(char *, uint64_t, uint64_t, void (*)(void, void, void)))(v138 + 56))(v137, 1, 1, v149);
  uint64_t v56 = enum case for URL.DirectoryHint.inferFromPath(_:);
  uint64_t v57 = v140;
  uint64_t v58 = *(void (**)(char *, uint64_t, void *))(v140 + 104);
  uint64_t v59 = v139;
  uint64_t v60 = v45;
  v58(v139, enum case for URL.DirectoryHint.inferFromPath(_:), v45);
  swift_bridgeObjectRetain();
  uint64_t v61 = (uint64_t)countAndFlagsBits;
  URL.init(filePath:directoryHint:relativeTo:)();
  v158[0] = (id)TaskDefinition.name.getter();
  v158[1] = v62;
  v58(v59, v56, v60);
  sub_100024B80();
  uint64_t v63 = v148;
  URL.appending<A>(path:directoryHint:)();
  (*(void (**)(char *, void *))(v57 + 8))(v59, v60);
  swift_bridgeObjectRelease();
  uint64_t v64 = *(void (**)(void, void))(v55 + 8);
  uint64_t v65 = v149;
  v64(v61, v149);
  Swift::String v66 = URL.path(percentEncoded:)(0);
  v64(v63, v65);
  id v67 = [self defaultManager];
  NSString v68 = String._bridgeToObjectiveC()();
  if (qword_100064F60 != -1) {
    swift_once();
  }
  type metadata accessor for FileAttributeKey(0);
  sub_100024C88(&qword_100065038, type metadata accessor for FileAttributeKey);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v158[0] = 0;
  unsigned int v70 = [v67 createDirectoryAtPath:v68 withIntermediateDirectories:1 attributes:isa error:v158];

  uint64_t v71 = v156;
  uint64_t v72 = v154;
  if (v70)
  {
    countAndFlagsBits = (char *)v66._countAndFlagsBits;
    uint64_t v73 = qword_100064F68;
    id v74 = v158[0];
    if (v73 != -1) {
      swift_once();
    }
    uint64_t v75 = type metadata accessor for Logger();
    sub_100010174(v75, (uint64_t)qword_1000667D0);
    uint64_t v76 = v129;
    uint64_t v149 = *(void (**)(void, void, void))(v72 + 16);
    v149(v129, v155, v71);
    swift_bridgeObjectRetain_n();
    os_log_t v77 = Logger.logObject.getter();
    os_log_type_t v78 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v77, v78))
    {
      uint64_t v79 = v76;
      uint64_t v80 = swift_slowAlloc();
      v145 = (void *)swift_slowAlloc();
      v158[0] = v145;
      *(_DWORD *)uint64_t v80 = 136315394;
      uint64_t v81 = TaskDefinition.name.getter();
      uint64_t v160 = sub_10000E564(v81, v82, (uint64_t *)v158);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v148 = *(char **)(v72 + 8);
      ((void (*)(char *, uint64_t))v148)(v79, v156);
      *(_WORD *)(v80 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v160 = sub_10000E564((uint64_t)countAndFlagsBits, (unint64_t)v66._object, (uint64_t *)v158);
      uint64_t v71 = v156;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v77, v78, "Created taskFolder for %s: %s", (uint8_t *)v80, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v148 = *(char **)(v72 + 8);
      ((void (*)(char *, uint64_t))v148)(v76, v71);

      swift_bridgeObjectRelease_n();
    }
    uint64_t v83 = v135;
    uint64_t v84 = v134;
    uint64_t v85 = v133;
    uint64_t v86 = v132;
    uint64_t v87 = v131;
    sub_10001C7D0(v155, v131);
    v149(v130, v87, v71);
    (*(void (**)(char *, void, uint64_t))(v85 + 104))(v86, enum case for TaskType.dynamicTask(_:), v84);
    uint64_t v119 = MLHostTask.init(taskDefinition:taskType:taskFolder:)();
    uint64_t v120 = __chkstk_darwin(v119);
    v128[-2] = v121;
    v128[-1] = v83;
    __chkstk_darwin(v120);
    v128[-2] = sub_100024C6C;
    v128[-1] = v122;
    v124 = v123 + 4;
    os_unfair_lock_lock(v123 + 4);
    sub_1000250A0();
    os_unfair_lock_unlock(v124);
    ((void (*)(uint64_t, uint64_t))v148)(v87, v71);
    v143(v150, v144);
    uint64_t v126 = v152;
    uint64_t v125 = v153;
    uint64_t v127 = v151;
    (*(void (**)(uint64_t, char *, uint64_t))(v152 + 32))(v153, v83, v151);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v126 + 56))(v125, 0, 1, v127);
  }
  else
  {
    id v108 = v158[0];
    uint64_t v109 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    v158[0] = v109;
    sub_10000E508(&qword_1000655D0);
    sub_100010330(0, &qword_1000655D8);
    swift_dynamicCast();
    uint64_t v110 = (void *)v160;
    if (qword_100064F68 != -1) {
      swift_once();
    }
    uint64_t v111 = type metadata accessor for Logger();
    sub_100010174(v111, (uint64_t)qword_1000667D0);
    id v112 = v110;
    swift_bridgeObjectRetain();
    id v113 = v112;
    long long v114 = Logger.logObject.getter();
    os_log_type_t v115 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v114, v115))
    {
      uint64_t v116 = swift_slowAlloc();
      unint64_t v117 = (void *)swift_slowAlloc();
      uint64_t v159 = swift_slowAlloc();
      *(_DWORD *)uint64_t v116 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v157 = sub_10000E564(v66._countAndFlagsBits, (unint64_t)v66._object, &v159);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v116 + 12) = 2112;
      uint64_t v157 = (uint64_t)v113;
      id v118 = v113;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *unint64_t v117 = v113;

      _os_log_impl((void *)&_mh_execute_header, v114, v115, "Failed at creating taskFolder: %s %@", (uint8_t *)v116, 0x16u);
      sub_10000E508(&qword_100065290);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
    v143(v150, v144);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v152 + 56))(v153, 1, 1, v151);
    return swift_errorRelease();
  }
}

uint64_t sub_10001BE14(uint64_t a1)
{
  uint64_t v51 = a1;
  uint64_t v52 = type metadata accessor for TaskDefinition();
  uint64_t v47 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  BOOL v46 = (char *)&v44 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = type metadata accessor for URL.DirectoryHint();
  uint64_t v53 = *(void *)(v2 - 8);
  uint64_t v3 = v53;
  uint64_t v54 = v2;
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000E508(&qword_1000655C0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v49 = *(void *)(v9 - 8);
  uint64_t v10 = v49;
  uint64_t v11 = __chkstk_darwin(v9);
  os_log_type_t v45 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v44 - v14;
  __chkstk_darwin(v13);
  uint64_t v55 = (char *)&v44 - v16;
  uint64_t v57 = TaskDefinition.name.getter();
  uint64_t v58 = v17;
  v18._uint64_t countAndFlagsBits = 0x7473696C702ELL;
  v18._object = (void *)0xE600000000000000;
  String.append(_:)(v18);
  uint64_t v50 = v57;
  char v48 = v58;
  uint64_t v19 = v9;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
  uint64_t v20 = enum case for URL.DirectoryHint.inferFromPath(_:);
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  uint64_t v22 = v54;
  v21(v5, enum case for URL.DirectoryHint.inferFromPath(_:), v54);
  swift_bridgeObjectRetain();
  URL.init(filePath:directoryHint:relativeTo:)();
  uint64_t v57 = v50;
  uint64_t v58 = v48;
  uint64_t v23 = v20;
  uint64_t v24 = v49;
  v21(v5, v23, v22);
  sub_100024B80();
  URL.appending<A>(path:directoryHint:)();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v5, v22);
  uint64_t v53 = *(void *)(v24 + 8);
  uint64_t v54 = v19;
  ((void (*)(char *, uint64_t))v53)(v15, v19);
  swift_bridgeObjectRelease();
  type metadata accessor for PropertyListEncoder();
  swift_allocObject();
  uint64_t v25 = PropertyListEncoder.init()();
  dispatch thunk of PropertyListEncoder.outputFormat.setter();
  sub_100024C88(&qword_100065268, (void (*)(uint64_t))&type metadata accessor for TaskDefinition);
  uint64_t v26 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
  unint64_t v28 = v27;
  uint64_t v29 = v45;
  if (qword_100064F68 != -1) {
    swift_once();
  }
  uint64_t v30 = type metadata accessor for Logger();
  uint64_t v31 = sub_100010174(v30, (uint64_t)qword_1000667D0);
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v29, v55, v54);
  uint64_t v52 = v31;
  uint64_t v32 = Logger.logObject.getter();
  os_log_type_t v33 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = v29;
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    uint64_t v51 = v25;
    uint64_t v57 = v36;
    uint64_t v49 = v26;
    *(_DWORD *)uint64_t v35 = 136315138;
    char v48 = v35 + 4;
    sub_100024C88(&qword_1000655E0, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v50 = v28;
    uint64_t v37 = v54;
    uint64_t v38 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v56 = sub_10000E564(v38, v39, &v57);
    uint64_t v26 = v49;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v40 = v37;
    unint64_t v28 = v50;
    ((void (*)(char *, uint64_t))v53)(v34, v40);
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "Storing taskDefinition at URL: %s", v35, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    ((void (*)(char *, uint64_t))v53)(v29, v54);
  }

  Data.write(to:options:)();
  uint64_t v41 = v55;
  uint64_t countAndFlagsBits = URL.path(percentEncoded:)(0)._countAndFlagsBits;
  sub_100010270(v26, v28);
  swift_release();
  ((void (*)(char *, uint64_t))v53)(v41, v54);
  return countAndFlagsBits;
}

uint64_t sub_10001C7D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = type metadata accessor for TaskRequest();
  uint64_t v4 = *(void *)(v24 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for TaskDefinition();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  v11(a2, a1, v7);
  sub_10000E508(&qword_100065298);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10004C9E0;
  v11((uint64_t)v10, a2, v7);
  uint64_t v13 = TaskDefinition.bundleIdentifier.getter();
  uint64_t v15 = v14;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  *(void *)(inited + 32) = v13;
  *(void *)(inited + 40) = v15;
  uint64_t v16 = sub_1000383C8(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  uint64_t v26 = v16;
  TaskDefinition.taskRequest.getter();
  uint64_t v17 = TaskRequest.relatedApplications.getter();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v24);
  if (v17)
  {
    uint64_t v18 = *(void *)(v17 + 16);
    if (v18)
    {
      uint64_t v19 = (Swift::Int *)(v17 + 40);
      do
      {
        Swift::Int v20 = *(v19 - 1);
        Swift::Int v21 = *v19;
        swift_bridgeObjectRetain();
        sub_100035310(&v25, v20, v21);
        swift_bridgeObjectRelease();
        v19 += 2;
        --v18;
      }
      while (v18);
    }
    swift_bridgeObjectRelease();
  }
  sub_100037DF4(v26);
  swift_bridgeObjectRelease();
  uint64_t v22 = (uint64_t (*)(Swift::Int *, void))TaskDefinition.taskRequest.modify();
  TaskRequest.relatedApplications.setter();
  return v22(&v25, 0);
}

uint64_t sub_10001CA90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000E508(&qword_1000655E8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for MLHostTask();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v11 = *(void *)(a1 + 64);
  swift_bridgeObjectRetain();
  uint64_t v12 = MLHostTask.name.getter();
  if (*(void *)(v11 + 16))
  {
    sub_100034E9C(v12, v13);
    char v15 = v14;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v15)
    {
      if (qword_100064F68 != -1) {
        swift_once();
      }
      uint64_t v16 = type metadata accessor for Logger();
      sub_100010174(v16, (uint64_t)qword_1000667D0);
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a2, v7);
      uint64_t v17 = Logger.logObject.getter();
      os_log_type_t v18 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v17, v18))
      {
        os_log_t v29 = v17;
        uint64_t v19 = (uint8_t *)swift_slowAlloc();
        uint64_t v28 = swift_slowAlloc();
        v30[0] = v28;
        unint64_t v27 = v19;
        *(_DWORD *)uint64_t v19 = 136315138;
        v26[1] = v19 + 4;
        uint64_t v20 = MLHostTask.name.getter();
        v30[7] = sub_10000E564(v20, v21, v30);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
        uint64_t v17 = v29;
        _os_log_impl((void *)&_mh_execute_header, v29, v18, "Task %s already present in TaskRegistry is being replaced.", v27, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      }
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v22 = MLHostTask.name.getter();
  uint64_t v24 = v23;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v6, a2, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  swift_beginAccess();
  sub_100013820((uint64_t)v6, v22, v24);
  return swift_endAccess();
}

void sub_10001CE44(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v146 = type metadata accessor for URL.DirectoryHint();
  v139 = *(void (***)(char *, uint64_t))(v146 - 8);
  __chkstk_darwin(v146);
  v145 = (char *)&v132 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10000E508(&qword_1000655C0);
  __chkstk_darwin(v5 - 8);
  uint64_t v144 = (char *)&v132 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v150 = type metadata accessor for URL();
  uint64_t v138 = *(void (***)(char *, uint64_t))(v150 - 8);
  uint64_t v7 = __chkstk_darwin(v150);
  v143 = (char *)&v132 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v142 = (char *)&v132 - v9;
  uint64_t v172 = type metadata accessor for TaskType();
  uint64_t v10 = *(char **)(v172 - 8);
  __chkstk_darwin(v172);
  v171 = (char *)&v132 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v170 = type metadata accessor for MLHostTask();
  uint64_t v12 = *(uint64_t **)(v170 - 8);
  uint64_t v13 = __chkstk_darwin(v170);
  v169 = (char *)&v132 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v168 = (char *)&v132 - v15;
  uint64_t v175 = type metadata accessor for TaskDefinition();
  uint64_t v159 = *(void *)(v175 - 8);
  uint64_t v16 = __chkstk_darwin(v175);
  uint64_t v156 = (char *)&v132 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v16);
  v162 = (char *)&v132 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v153 = (char *)&v132 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v152 = (uint64_t *)((char *)&v132 - v23);
  __chkstk_darwin(v22);
  v167 = (char *)&v132 - v24;
  uint64_t v25 = sub_10000E508(&qword_100065668);
  uint64_t v26 = __chkstk_darwin(v25 - 8);
  uint64_t v157 = (uint64_t *)((char *)&v132 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v28 = __chkstk_darwin(v26);
  uint64_t v154 = (uint64_t)&v132 - v29;
  uint64_t v30 = __chkstk_darwin(v28);
  uint64_t v32 = (char *)&v132 - v31;
  __chkstk_darwin(v30);
  uint64_t v160 = (uint64_t)&v132 - v33;
  if (qword_100064F68 == -1) {
    goto LABEL_2;
  }
  while (1)
  {
    swift_once();
LABEL_2:
    uint64_t v34 = type metadata accessor for Logger();
    uint64_t v35 = sub_100010174(v34, (uint64_t)qword_1000667D0);
    uint64_t v36 = Logger.logObject.getter();
    os_log_type_t v37 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "Loading tasks from StaticRegistry.", v38, 2u);
      swift_slowDealloc();
    }

    uint64_t v39 = sub_10001E2F4(*(void *)(v2 + 16), a1);
    uint64_t v134 = v35;
    uint64_t v40 = Logger.logObject.getter();
    os_log_type_t v41 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v42 = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "Loading tasks from DynamicRegistry.", v42, 2u);
      swift_slowDealloc();
    }

    sub_10000E508(&qword_100065298);
    uint64_t v43 = swift_allocObject();
    *(_OWORD *)(v43 + 16) = xmmword_10004C9E0;
    uint64_t v44 = *(void *)(v2 + 32);
    *(void *)(v43 + 32) = *(void *)(v2 + 24);
    *(void *)(v43 + 40) = v44;
    swift_bridgeObjectRetain();
    uint64_t v45 = sub_10001E2F4(v43, a1);
    uint64_t v46 = swift_bridgeObjectRelease();
    uint64_t v155 = v2;
    if (a1)
    {
      __chkstk_darwin(v46);
      *(&v132 - 2) = a1;
      uint64_t v39 = sub_100022318(v39, (uint64_t (*)(uint64_t, uint64_t, char *))sub_1000250D4, (uint64_t)(&v132 - 4));
      uint64_t v47 = swift_bridgeObjectRelease();
      __chkstk_darwin(v47);
      *(&v132 - 2) = a1;
      uint64_t v48 = sub_100022318(v45, (uint64_t (*)(uint64_t, uint64_t, char *))sub_100025078, (uint64_t)(&v132 - 4));
      swift_bridgeObjectRelease();
      uint64_t v45 = v48;
    }
    uint64_t v2 = sub_1000217A4(v39);
    swift_bridgeObjectRelease();
    uint64_t v148 = sub_1000217A4(v45);
    uint64_t v158 = 0;
    swift_bridgeObjectRelease();
    unint64_t v49 = sub_100025870((uint64_t)&_swiftEmptyArrayStorage);
    int64_t v161 = 0;
    id v176 = (id)v49;
    uint64_t v50 = *(void *)(v2 + 64);
    uint64_t v140 = (void (**)(char *, uint64_t, uint64_t))(v2 + 64);
    int64_t v147 = (void (**)(char *, uint64_t, uint64_t, uint64_t))v2;
    uint64_t v51 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v52 = -1;
    if (v51 < 64) {
      uint64_t v52 = ~(-1 << v51);
    }
    a1 = v52 & v50;
    v174 = (void (**)(void, void, void))(v159 + 16);
    v166 = (void (**)(char *, uint64_t, uint64_t))(v159 + 32);
    unsigned int v151 = enum case for TaskType.staticTask(_:);
    v164 = (void (**)(char *, char *, uint64_t))(v12 + 4);
    v165 = (void (**)(char *, void, uint64_t))(v10 + 104);
    v163 = (uint64_t *)(v159 + 8);
    int64_t v141 = (unint64_t)(v51 + 63) >> 6;
    int64_t v136 = v141 - 1;
    uint64_t v12 = (uint64_t *)&unk_100065670;
    if ((v52 & v50) != 0) {
      break;
    }
LABEL_15:
    int64_t v74 = v161 + 1;
    if (!__OFADD__(v161, 1))
    {
      if (v74 < v141)
      {
        unint64_t v75 = (unint64_t)v140[v74];
        if (v75)
        {
LABEL_18:
          uint64_t v66 = (v75 - 1) & v75;
          unint64_t v67 = __clz(__rbit64(v75)) + (v74 << 6);
          int64_t v161 = v74;
          goto LABEL_14;
        }
        int64_t v76 = v161 + 2;
        ++v161;
        if (v74 + 1 < v141)
        {
          unint64_t v75 = (unint64_t)v140[v76];
          if (v75)
          {
LABEL_21:
            int64_t v74 = v76;
            goto LABEL_18;
          }
          int64_t v161 = v74 + 1;
          if (v74 + 2 < v141)
          {
            unint64_t v75 = (unint64_t)v140[v74 + 2];
            if (v75)
            {
              v74 += 2;
              goto LABEL_18;
            }
            int64_t v76 = v74 + 3;
            int64_t v161 = v74 + 2;
            if (v74 + 3 < v141)
            {
              unint64_t v75 = (unint64_t)v140[v76];
              if (v75) {
                goto LABEL_21;
              }
              while (1)
              {
                int64_t v74 = v76 + 1;
                if (__OFADD__(v76, 1))
                {
                  __break(1u);
LABEL_77:
                  __break(1u);
                }
                if (v74 >= v141) {
                  break;
                }
                unint64_t v75 = (unint64_t)v140[v74];
                ++v76;
                if (v75) {
                  goto LABEL_18;
                }
              }
              int64_t v161 = v136;
            }
          }
        }
      }
      uint64_t v77 = sub_10000E508(v12);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v77 - 8) + 56))(v32, 1, 1, v77);
      uint64_t v66 = 0;
      goto LABEL_33;
    }
    __break(1u);
LABEL_74:
    __break(1u);
  }
  while (1)
  {
    unint64_t v65 = __clz(__rbit64(a1));
    uint64_t v66 = (a1 - 1) & a1;
    unint64_t v67 = v65 | (v161 << 6);
LABEL_14:
    NSString v68 = v147[7];
    id v69 = (void *)((char *)v147[6] + 16 * v67);
    uint64_t v70 = v69[1];
    *(void *)uint64_t v32 = *v69;
    *((void *)v32 + 1) = v70;
    uint64_t v71 = v159;
    uint64_t v72 = (uint64_t)v68 + *(void *)(v159 + 72) * v67;
    uint64_t v73 = sub_10000E508(v12);
    (*(void (**)(char *, uint64_t, uint64_t))(v71 + 16))(&v32[*(int *)(v73 + 48)], v72, v175);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v73 - 8) + 56))(v32, 0, 1, v73);
    swift_bridgeObjectRetain();
LABEL_33:
    uint64_t v10 = v32;
    uint64_t v78 = v160;
    sub_100025010((uint64_t)v32, v160);
    uint64_t v2 = (uint64_t)v12;
    uint64_t v79 = sub_10000E508(v12);
    uint64_t v80 = *(void *)(v79 - 8);
    uint64_t v12 = *(uint64_t **)(v80 + 48);
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v12)(v78, 1, v79) == 1) {
      break;
    }
    uint64_t v53 = *(void *)(v78 + 8);
    v173 = *(void **)v78;
    uint64_t v54 = v78 + *(int *)(v79 + 48);
    uint64_t v55 = (uint64_t)v167;
    uint64_t v56 = v175;
    (*v166)(v167, v54, v175);
    uint64_t v57 = (void (**)(void, void, void, void))v152;
    sub_10001C7D0(v55, (uint64_t)v152);
    (*v174)(v153, v57, v56);
    (*v165)(v171, v151, v172);
    unint64_t v58 = v66;
    uint64_t v59 = v168;
    MLHostTask.init(taskDefinition:taskType:taskFolder:)();
    uint64_t v60 = (uint64_t)v169;
    uint64_t v61 = v59;
    a1 = v58;
    (*v164)(v169, v61, v170);
    uint64_t v62 = v176;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v177[0] = v62;
    sub_1000364A4(v60, (uint64_t)v173, v53, isUniquelyReferenced_nonNull_native);
    id v176 = v177[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v64 = (void (*)(uint64_t, uint64_t))*v163;
    ((void (*)(void (**)(void, void, void, void), uint64_t))*v163)(v57, v56);
    v64(v55, v56);
    uint64_t v32 = v10;
    uint64_t v12 = (uint64_t *)v2;
    if (!v58) {
      goto LABEL_15;
    }
  }
  uint64_t v153 = (char *)(v80 + 48);
  swift_release();
  int64_t v81 = 0;
  uint64_t v82 = *(void *)(v148 + 64);
  uint64_t v135 = v148 + 64;
  uint64_t v83 = 1 << *(unsigned char *)(v148 + 32);
  uint64_t v84 = -1;
  if (v83 < 64) {
    uint64_t v84 = ~(-1 << v83);
  }
  unint64_t v85 = v84 & v82;
  uint64_t v152 = (uint64_t *)(v80 + 56);
  int64_t v147 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v138 + 7);
  LODWORD(v141) = enum case for URL.DirectoryHint.inferFromPath(_:);
  uint64_t v140 = (void (**)(char *, uint64_t, uint64_t))(v139 + 13);
  ++v139;
  ++v138;
  unsigned int v151 = enum case for TaskType.dynamicTask(_:);
  int64_t v136 = (unint64_t)(v83 + 63) >> 6;
  int64_t v133 = v136 - 1;
  a1 = (unint64_t)v156;
  uint64_t v149 = v12;
  uint64_t v137 = v79;
  while (1)
  {
    uint64_t v99 = (uint64_t)v157;
    if (v85)
    {
      unint64_t v100 = __clz(__rbit64(v85));
      uint64_t v101 = (v85 - 1) & v85;
      unint64_t v102 = v100 | (v81 << 6);
LABEL_41:
      uint64_t v103 = *(void *)(v148 + 56);
      long long v104 = (void *)(*(void *)(v148 + 48) + 16 * v102);
      uint64_t v105 = v104[1];
      *uint64_t v157 = *v104;
      *(void *)(v99 + 8) = v105;
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v159 + 16))(v99 + *(int *)(v79 + 48), v103 + *(void *)(v159 + 72) * v102, v175);
      ((void (*)(uint64_t, void, uint64_t, uint64_t))*v152)(v99, 0, 1, v79);
      swift_bridgeObjectRetain();
      goto LABEL_47;
    }
    int64_t v106 = v81 + 1;
    if (__OFADD__(v81, 1)) {
      goto LABEL_74;
    }
    if (v106 < v136)
    {
      unint64_t v107 = *(void *)(v135 + 8 * v106);
      if (v107) {
        goto LABEL_45;
      }
      v81 += 2;
      if (v106 + 1 >= v136)
      {
        int64_t v81 = v106;
      }
      else
      {
        unint64_t v107 = *(void *)(v135 + 8 * v81);
        if (v107)
        {
          ++v106;
LABEL_45:
          uint64_t v101 = (v107 - 1) & v107;
          unint64_t v102 = __clz(__rbit64(v107)) + (v106 << 6);
          int64_t v81 = v106;
          goto LABEL_41;
        }
        if (v106 + 2 < v136)
        {
          unint64_t v107 = *(void *)(v135 + 8 * (v106 + 2));
          if (v107)
          {
            v106 += 2;
            goto LABEL_45;
          }
          int64_t v124 = v106 + 3;
          if (v106 + 3 >= v136)
          {
            int64_t v81 = v106 + 2;
          }
          else
          {
            unint64_t v107 = *(void *)(v135 + 8 * v124);
            if (v107)
            {
              v106 += 3;
              goto LABEL_45;
            }
            while (1)
            {
              int64_t v106 = v124 + 1;
              if (__OFADD__(v124, 1)) {
                goto LABEL_77;
              }
              if (v106 >= v136) {
                break;
              }
              unint64_t v107 = *(void *)(v135 + 8 * v106);
              ++v124;
              if (v107) {
                goto LABEL_45;
              }
            }
            int64_t v81 = v133;
          }
        }
      }
    }
    ((void (*)(void *, uint64_t, uint64_t, uint64_t))*v152)(v157, 1, 1, v79);
    uint64_t v101 = 0;
LABEL_47:
    uint64_t v108 = v154;
    sub_100025010(v99, v154);
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v12)(v108, 1, v79) == 1) {
      break;
    }
    uint64_t v160 = v101;
    int64_t v161 = v81;
    uint64_t v109 = *(void **)v108;
    uint64_t v10 = *(char **)(v108 + 8);
    uint64_t v110 = v108 + *(int *)(v79 + 48);
    uint64_t v111 = (uint64_t)v162;
    (*v166)(v162, v110, v175);
    sub_10001C7D0(v111, a1);
    id v112 = [self defaultManager];
    uint64_t v113 = v155;
    NSString v114 = String._bridgeToObjectiveC()();
    v177[0] = 0;
    id v115 = [v112 contentsOfDirectoryAtPath:v114 error:v177];

    id v116 = v177[0];
    if (v115)
    {
      uint64_t v117 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
      id v118 = v116;

      swift_retain();
      uint64_t v119 = v158;
      uint64_t v120 = sub_100022490(v117, v113);
      uint64_t v158 = v119;
      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v121 = (void *)sub_1000383C8((uint64_t)v120);
      swift_bridgeObjectRelease();
    }
    else
    {
      id v122 = v177[0];
      _convertNSErrorToError(_:)();

      swift_willThrow();
      swift_errorRelease();
      uint64_t v158 = 0;
      uint64_t v121 = &_swiftEmptySetSingleton;
    }
    char v123 = sub_1000139FC((uint64_t)v109, (uint64_t)v10, (uint64_t)v121);
    swift_bridgeObjectRelease();
    v173 = v109;
    if (v123)
    {
      (*v147)(v144, 1, 1, v150);
      uint64_t v86 = *v140;
      uint64_t v87 = v145;
      uint64_t v88 = v141;
      uint64_t v89 = v146;
      (*v140)(v145, v141, v146);
      swift_bridgeObjectRetain();
      uint64_t v90 = v143;
      URL.init(filePath:directoryHint:relativeTo:)();
      v177[0] = v173;
      v177[1] = v10;
      v86(v87, v88, v89);
      uint64_t v79 = v137;
      sub_100024B80();
      uint64_t v91 = v142;
      URL.appending<A>(path:directoryHint:)();
      (*v139)(v87, v89);
      id v92 = *v138;
      uint64_t v93 = v150;
      (*v138)(v90, v150);
      URL.path(percentEncoded:)(0);
      a1 = (unint64_t)v156;
      v92(v91, v93);
      uint64_t v12 = v149;
    }
    else
    {
      uint64_t v12 = v149;
      a1 = (unint64_t)v156;
    }
    uint64_t v94 = v175;
    uint64_t v32 = v167;
    (*v174)(v167, a1, v175);
    (*v165)(v171, v151, v172);
    uint64_t v95 = v168;
    MLHostTask.init(taskDefinition:taskType:taskFolder:)();
    uint64_t v96 = (uint64_t)v169;
    (*v164)(v169, v95, v170);
    uint64_t v97 = v176;
    char v98 = swift_isUniquelyReferenced_nonNull_native();
    v177[0] = v97;
    sub_1000364A4(v96, (uint64_t)v173, (uint64_t)v10, v98);
    id v176 = v177[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v2 = *v163;
    ((void (*)(unint64_t, uint64_t))*v163)(a1, v94);
    ((void (*)(char *, uint64_t))v2)(v162, v94);
    int64_t v81 = v161;
    unint64_t v85 = v160;
  }
  swift_release();
  uint64_t v125 = v155;
  uint64_t v126 = (os_unfair_lock_s *)(*(void *)(v155 + 56) + 16);
  os_unfair_lock_lock(v126);
  uint64_t v127 = (id *)v176;
  swift_bridgeObjectRetain();
  v128 = Logger.logObject.getter();
  os_log_type_t v129 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v128, v129))
  {
    v130 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v130 = 134217984;
    v177[0] = v127[2];
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v128, v129, "Injecting %ld tasks in TaskRegistry.", v130, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  id v131 = v176;
  swift_beginAccess();
  *(void *)(v125 + 64) = v131;
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v126);
}

uint64_t sub_10001E2F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_10000E508(&qword_100065600);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v125 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for TaskDefinition();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v148 = (char *)&v125 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  v142 = (char *)&v125 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v138 = (char *)&v125 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  int64_t v133 = (char *)&v125 - v18;
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v125 - v19;
  v163 = (void *)sub_100025AE8((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v132 = *(void *)(a1 + 16);
  if (v132)
  {
    id v131 = self;
    uint64_t v130 = a1 + 32;
    uint64_t v156 = (unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
    uint64_t v146 = (void (**)(char *, char *, uint64_t))(v10 + 32);
    uint64_t v150 = (void (**)(char *, char *, uint64_t))(v10 + 16);
    uint64_t v154 = (void (**)(char *, uint64_t))(v10 + 8);
    uint64_t v137 = &v162;
    uint64_t v135 = v10 + 40;
    swift_bridgeObjectRetain();
    uint64_t v21 = 0;
    uint64_t v126 = 0;
    *(void *)&long long v22 = 136315138;
    long long v153 = v22;
    v128 = (char *)&type metadata for Any + 8;
    *(void *)&long long v22 = 138412290;
    long long v125 = v22;
    *(void *)&long long v22 = 136315394;
    long long v136 = v22;
    uint64_t v141 = v3;
    uint64_t v155 = v9;
    uint64_t v140 = v10;
    unsigned int v151 = v20;
    uint64_t v127 = a1;
    uint64_t v144 = a2;
    uint64_t v152 = v8;
    do
    {
      uint64_t v134 = v21;
      uint64_t v23 = (void **)(v130 + 16 * v21);
      uint64_t v24 = *v23;
      unint64_t v25 = (unint64_t)v23[1];
      uint64_t v26 = qword_100064F68;
      swift_bridgeObjectRetain();
      if (v26 != -1) {
        swift_once();
      }
      uint64_t v27 = type metadata accessor for Logger();
      uint64_t v28 = sub_100010174(v27, (uint64_t)qword_1000667D0);
      swift_bridgeObjectRetain_n();
      uint64_t v160 = v28;
      uint64_t v29 = Logger.logObject.getter();
      os_log_type_t v30 = static os_log_type_t.info.getter();
      BOOL v31 = os_log_type_enabled(v29, v30);
      uint64_t v157 = v24;
      unint64_t v158 = v25;
      if (v31)
      {
        uint64_t v32 = swift_slowAlloc();
        v164 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v32 = v153;
        swift_bridgeObjectRetain();
        *(void *)(v32 + 4) = sub_10000E564((uint64_t)v157, v158, (uint64_t *)&v164);
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "Loading tasks from folder: %s", (uint8_t *)v32, 0xCu);
        swift_arrayDestroy();
        unint64_t v25 = v158;
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v33 = v152;
      id v34 = [v131 defaultManager:v125 v126];
      NSString v35 = String._bridgeToObjectiveC()();
      v164 = 0;
      id v36 = [v34 contentsOfDirectoryAtPath:v35 error:&v164];

      id v37 = v164;
      if (v36)
      {
        uint64_t v38 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
        id v39 = v37;

        uint64_t v40 = *(void *)(v38 + 16);
        if (v40)
        {
          uint64_t v129 = v38;
          os_log_type_t v41 = (void **)(v38 + 40);
          do
          {
            uint64_t v159 = v40;
            uint64_t v42 = (uint64_t)*(v41 - 1);
            uint64_t v43 = *v41;
            v164 = v157;
            unint64_t v165 = v25;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v44._uint64_t countAndFlagsBits = 47;
            v44._object = (void *)0xE100000000000000;
            String.append(_:)(v44);
            swift_bridgeObjectRetain();
            v45._uint64_t countAndFlagsBits = v42;
            v45._object = v43;
            String.append(_:)(v45);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v47 = (uint64_t)v164;
            unint64_t v46 = v165;
            swift_bridgeObjectRetain_n();
            uint64_t v48 = Logger.logObject.getter();
            os_log_type_t v49 = static os_log_type_t.debug.getter();
            if (os_log_type_enabled(v48, v49))
            {
              uint64_t v50 = v3;
              uint64_t v51 = v47;
              uint64_t v52 = swift_slowAlloc();
              v164 = (void *)swift_slowAlloc();
              *(_DWORD *)uint64_t v52 = v153;
              swift_bridgeObjectRetain();
              *(void *)(v52 + 4) = sub_10000E564(v51, v46, (uint64_t *)&v164);
              swift_bridgeObjectRelease_n();
              _os_log_impl((void *)&_mh_execute_header, v48, v49, "Loading task from: %s", (uint8_t *)v52, 0xCu);
              swift_arrayDestroy();
              uint64_t v9 = v155;
              swift_slowDealloc();
              uint64_t v47 = v51;
              uint64_t v3 = v50;
              swift_slowDealloc();
            }
            else
            {

              swift_bridgeObjectRelease_n();
            }
            sub_1000178F0(v47, v46, v33);
            if ((*v156)(v33, 1, v9) == 1)
            {
              sub_100010578((uint64_t)v33, &qword_100065600);
              swift_bridgeObjectRetain();
              uint64_t v53 = Logger.logObject.getter();
              os_log_type_t v54 = static os_log_type_t.error.getter();
              if (os_log_type_enabled(v53, v54))
              {
                uint64_t v55 = swift_slowAlloc();
                v164 = (void *)swift_slowAlloc();
                *(_DWORD *)uint64_t v55 = v153;
                swift_bridgeObjectRetain();
                *(void *)(v55 + 4) = sub_10000E564(v47, v46, (uint64_t *)&v164);
                swift_bridgeObjectRelease_n();
                _os_log_impl((void *)&_mh_execute_header, v53, v54, "Skipping loading from: %s", (uint8_t *)v55, 0xCu);
                swift_arrayDestroy();
                swift_slowDealloc();
                uint64_t v33 = v152;
                swift_slowDealloc();
              }
              else
              {

                swift_bridgeObjectRelease_n();
              }
            }
            else
            {
              uint64_t v149 = v47;
              uint64_t v56 = *v146;
              (*v146)(v20, v33, v9);
              uint64_t v57 = v144;
              if (v144
                && (uint64_t v58 = TaskDefinition.bundleIdentifier.getter(),
                    char v60 = sub_1000139FC(v58, v59, v57),
                    swift_bridgeObjectRelease(),
                    (v60 & 1) == 0))
              {
                swift_bridgeObjectRelease();
                unint64_t v75 = v133;
                (*v150)(v133, v20, v9);
                int64_t v76 = Logger.logObject.getter();
                os_log_type_t v77 = static os_log_type_t.info.getter();
                if (os_log_type_enabled(v76, v77))
                {
                  uint64_t v78 = swift_slowAlloc();
                  v164 = (void *)swift_slowAlloc();
                  *(_DWORD *)uint64_t v78 = v153;
                  uint64_t v79 = TaskDefinition.name.getter();
                  *(void *)(v78 + 4) = sub_10000E564(v79, v80, (uint64_t *)&v164);
                  swift_bridgeObjectRelease();
                  int64_t v81 = v75;
                  uint64_t v82 = *v154;
                  (*v154)(v81, v155);
                  _os_log_impl((void *)&_mh_execute_header, v76, v77, "Task %s is discared because its bundleIdentifier is not available in the OS.", (uint8_t *)v78, 0xCu);
                  swift_arrayDestroy();
                  uint64_t v9 = v155;
                  swift_slowDealloc();
                  swift_slowDealloc();
                }
                else
                {

                  uint64_t v83 = v75;
                  uint64_t v82 = *v154;
                  (*v154)(v83, v9);
                }
                v82(v20, v9);
              }
              else
              {
                v145 = v56;
                uint64_t v61 = v163;
                swift_bridgeObjectRetain();
                uint64_t v62 = TaskDefinition.name.getter();
                if (v61[2])
                {
                  sub_100034E9C(v62, v63);
                  char v65 = v64;
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  uint64_t v66 = *v150;
                  unint64_t v67 = v142;
                  NSString v68 = v138;
                  if (v65)
                  {
                    v66(v138, v20, v9);
                    swift_bridgeObjectRetain_n();
                    id v69 = Logger.logObject.getter();
                    uint64_t v70 = v9;
                    os_log_type_t v71 = static os_log_type_t.error.getter();
                    if (os_log_type_enabled(v69, v71))
                    {
                      uint64_t v72 = swift_slowAlloc();
                      v164 = (void *)swift_slowAlloc();
                      *(_DWORD *)uint64_t v72 = v136;
                      uint64_t v73 = TaskDefinition.name.getter();
                      uint64_t v161 = sub_10000E564(v73, v74, (uint64_t *)&v164);
                      v143 = v66;
                      UnsafeMutableRawBufferPointer.copyMemory(from:)();
                      swift_bridgeObjectRelease();
                      (*v154)(v138, v70);
                      *(_WORD *)(v72 + 12) = 2080;
                      swift_bridgeObjectRetain();
                      uint64_t v161 = sub_10000E564(v149, v46, (uint64_t *)&v164);
                      unint64_t v67 = v142;
                      UnsafeMutableRawBufferPointer.copyMemory(from:)();
                      swift_bridgeObjectRelease_n();
                      uint64_t v66 = v143;
                      _os_log_impl((void *)&_mh_execute_header, v69, v71, "Task %s already in registry is overlayed by %s", (uint8_t *)v72, 0x16u);
                      swift_arrayDestroy();
                      swift_slowDealloc();
                      swift_slowDealloc();
                    }
                    else
                    {
                      (*v154)(v68, v70);

                      swift_bridgeObjectRelease_n();
                    }
                    uint64_t v9 = v70;
                    uint64_t v20 = v151;
                  }
                  v66(v67, v20, v9);
                }
                else
                {
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  uint64_t v66 = *v150;
                  unint64_t v67 = v142;
                  (*v150)(v142, v20, v9);
                }
                swift_bridgeObjectRetain();
                uint64_t v84 = Logger.logObject.getter();
                uint64_t v85 = v9;
                os_log_type_t v86 = static os_log_type_t.info.getter();
                if (os_log_type_enabled(v84, v86))
                {
                  uint64_t v87 = swift_slowAlloc();
                  v139 = (void *)swift_slowAlloc();
                  v164 = v139;
                  *(_DWORD *)uint64_t v87 = v136;
                  v143 = v66;
                  uint64_t v88 = TaskDefinition.name.getter();
                  uint64_t v161 = sub_10000E564(v88, v89, (uint64_t *)&v164);
                  UnsafeMutableRawBufferPointer.copyMemory(from:)();
                  swift_bridgeObjectRelease();
                  int64_t v147 = *v154;
                  v147(v67, v85);
                  *(_WORD *)(v87 + 12) = 2080;
                  swift_bridgeObjectRetain();
                  uint64_t v161 = sub_10000E564(v149, v46, (uint64_t *)&v164);
                  UnsafeMutableRawBufferPointer.copyMemory(from:)();
                  swift_bridgeObjectRelease_n();
                  uint64_t v66 = v143;
                  _os_log_impl((void *)&_mh_execute_header, v84, v86, "Loaded %s from: %s", (uint8_t *)v87, 0x16u);
                  swift_arrayDestroy();
                  swift_slowDealloc();
                  swift_slowDealloc();
                }
                else
                {
                  int64_t v147 = *v154;
                  v147(v67, v85);

                  swift_bridgeObjectRelease_n();
                }
                uint64_t v90 = v151;
                uint64_t v91 = TaskDefinition.name.getter();
                uint64_t v93 = v92;
                v66(v148, v90, v85);
                uint64_t v94 = v163;
                int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                v163 = (void *)0x8000000000000000;
                v164 = v94;
                unint64_t v97 = sub_100034E9C(v91, v93);
                uint64_t v98 = v94[2];
                BOOL v99 = (v96 & 1) == 0;
                uint64_t v100 = v98 + v99;
                if (__OFADD__(v98, v99))
                {
                  __break(1u);
LABEL_61:
                  __break(1u);
                  goto LABEL_62;
                }
                char v101 = v96;
                if (v94[3] >= v100)
                {
                  uint64_t v104 = v140;
                  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
                    sub_100020DEC((uint64_t (*)(void))&type metadata accessor for TaskDefinition, &qword_100065678);
                  }
                }
                else
                {
                  sub_10003576C(v100, isUniquelyReferenced_nonNull_native);
                  unint64_t v102 = sub_100034E9C(v91, v93);
                  uint64_t v104 = v140;
                  if ((v101 & 1) != (v103 & 1))
                  {
                    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
                    __break(1u);
                    return result;
                  }
                  unint64_t v97 = v102;
                }
                uint64_t v3 = v141;
                uint64_t v105 = v164;
                if (v101)
                {
                  uint64_t v9 = v155;
                  (*(void (**)(unint64_t, char *, uint64_t))(v104 + 40))(v164[7] + *(void *)(v104 + 72) * v97, v148, v155);
                }
                else
                {
                  v164[(v97 >> 6) + 8] |= 1 << v97;
                  int64_t v106 = (uint64_t *)(v105[6] + 16 * v97);
                  *int64_t v106 = v91;
                  v106[1] = v93;
                  uint64_t v9 = v155;
                  v145((char *)(v105[7] + *(void *)(v104 + 72) * v97), v148, v155);
                  uint64_t v107 = v105[2];
                  BOOL v108 = __OFADD__(v107, 1);
                  uint64_t v109 = v107 + 1;
                  if (v108) {
                    goto LABEL_61;
                  }
                  v105[2] = v109;
                  swift_bridgeObjectRetain();
                }
                v163 = v164;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                uint64_t v20 = v151;
                v147(v151, v9);
              }
              uint64_t v33 = v152;
            }
            unint64_t v25 = v158;
            v41 += 2;
            uint64_t v40 = v159 - 1;
          }
          while (v159 != 1);
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v110 = v164;
        swift_bridgeObjectRelease();
        _convertNSErrorToError(_:)();

        swift_willThrow();
        uint64_t v126 = 0;
        swift_errorRetain();
        swift_errorRetain();
        uint64_t v111 = Logger.logObject.getter();
        os_log_type_t v112 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v111, v112))
        {
          uint64_t v113 = swift_slowAlloc();
          NSString v114 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v113 = v125;
          swift_errorRetain();
          uint64_t v115 = _swift_stdlib_bridgeErrorToNSError();
          *(void *)(v113 + 4) = v115;
          *NSString v114 = v115;
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl((void *)&_mh_execute_header, v111, v112, "Failed at reading tasks from disk: %@", (uint8_t *)v113, 0xCu);
          sub_10000E508(&qword_100065290);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          swift_errorRelease();
        }
        else
        {
          swift_errorRelease();
          swift_errorRelease();
          swift_errorRelease();
        }
      }
      uint64_t v21 = v134 + 1;
    }
    while (v134 + 1 != v132);
    swift_bridgeObjectRelease();
  }
  if (qword_100064F68 != -1) {
LABEL_62:
  }
    swift_once();
  uint64_t v116 = type metadata accessor for Logger();
  sub_100010174(v116, (uint64_t)qword_1000667D0);
  uint64_t v117 = v163;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  id v118 = Logger.logObject.getter();
  os_log_type_t v119 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v118, v119))
  {
    uint64_t v120 = swift_slowAlloc();
    v164 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v120 = 134218242;
    uint64_t v161 = v117[2];
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v120 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v121 = Array.description.getter();
    unint64_t v123 = v122;
    swift_bridgeObjectRelease();
    uint64_t v161 = sub_10000E564(v121, v123, (uint64_t *)&v164);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v118, v119, "Loaded %ld tasks from: %s.", (uint8_t *)v120, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  return (uint64_t)v163;
}

uint64_t sub_10001F61C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = TaskDefinition.bundleIdentifier.getter();
  char v9 = sub_1000139FC(v7, v8, a4);
  swift_bridgeObjectRelease();
  if ((v9 & 1) == 0)
  {
    if (qword_100064F68 != -1) {
      swift_once();
    }
    uint64_t v10 = type metadata accessor for Logger();
    sub_100010174(v10, (uint64_t)qword_1000667D0);
    swift_bridgeObjectRetain_n();
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 136315138;
      swift_bridgeObjectRetain();
      sub_10000E564(a1, a2, &v15);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Task %s is discarded because its bundleIdentifier is not available in the OS.", v13, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  return v9 & 1;
}

uint64_t sub_10001F7F8(uint64_t a1, uint64_t a2)
{
  uint64_t v61 = a2;
  uint64_t v58 = a1;
  uint64_t v2 = sub_10000E508(&qword_1000655F8);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v56 - v6;
  uint64_t v8 = type metadata accessor for Date();
  char v9 = *(char **)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v57 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v59 = (char *)&v56 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v56 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (char *)&v56 - v18;
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v56 - v20;
  TaskDefinition.startDate.getter();
  long long v22 = (uint64_t (*)(char *, uint64_t, uint64_t))*((void *)v9 + 6);
  int v23 = v22(v7, 1, v8);
  char v60 = (void (**)(char *, char *, uint64_t))v9;
  if (v23 == 1)
  {
    sub_100010578((uint64_t)v7, &qword_1000655F8);
    unint64_t v24 = v61;
  }
  else
  {
    uint64_t v56 = v16;
    (*((void (**)(char *, char *, uint64_t))v9 + 4))(v21, v7, v8);
    static Date.now.getter();
    char v25 = static Date.< infix(_:_:)();
    uint64_t v26 = v21;
    uint64_t v27 = v8;
    uint64_t v28 = (void (*)(char *, uint64_t))*((void *)v9 + 1);
    v28(v19, v27);
    if (v25)
    {
      uint64_t v59 = (char *)v28;
      if (qword_100064F68 != -1) {
        swift_once();
      }
      uint64_t v29 = type metadata accessor for Logger();
      sub_100010174(v29, (uint64_t)qword_1000667D0);
      os_log_type_t v30 = v56;
      v60[2](v56, v26, v27);
      unint64_t v31 = v61;
      swift_bridgeObjectRetain_n();
      uint64_t v32 = Logger.logObject.getter();
      os_log_type_t v33 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v34 = swift_slowAlloc();
        uint64_t v57 = (char *)swift_slowAlloc();
        uint64_t v63 = v57;
        *(_DWORD *)uint64_t v34 = 136315394;
        swift_bridgeObjectRetain();
        uint64_t v62 = sub_10000E564(v58, v31, (uint64_t *)&v63);
        char v60 = (void (**)(char *, char *, uint64_t))v26;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v34 + 12) = 2080;
        sub_100024C88(&qword_100065608, (void (*)(uint64_t))&type metadata accessor for Date);
        uint64_t v35 = dispatch thunk of CustomStringConvertible.description.getter();
        uint64_t v62 = sub_10000E564(v35, v36, (uint64_t *)&v63);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        id v37 = v59;
        ((void (*)(char *, uint64_t))v59)(v30, v27);
        _os_log_impl((void *)&_mh_execute_header, v32, v33, "Task %s is discarded due to startDate %s", (uint8_t *)v34, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        uint64_t v38 = (char *)v60;
      }
      else
      {

        id v37 = v59;
        ((void (*)(char *, uint64_t))v59)(v30, v27);
        swift_bridgeObjectRelease_n();
        uint64_t v38 = v26;
      }
      ((void (*)(char *, uint64_t))v37)(v38, v27);
      return 0;
    }
    v28(v26, v27);
    unint64_t v24 = v61;
    uint64_t v8 = v27;
  }
  TaskDefinition.endDate.getter();
  if (v22(v5, 1, v8) == 1)
  {
    sub_100010578((uint64_t)v5, &qword_1000655F8);
    return 1;
  }
  uint64_t v40 = v59;
  id v39 = v60;
  v60[4](v59, v5, v8);
  static Date.now.getter();
  char v41 = static Date.> infix(_:_:)();
  uint64_t v42 = v39[1];
  ((void (*)(char *, uint64_t))v42)(v19, v8);
  if ((v41 & 1) == 0)
  {
    ((void (*)(char *, uint64_t))v42)(v40, v8);
    return 1;
  }
  if (qword_100064F68 != -1) {
    swift_once();
  }
  uint64_t v43 = type metadata accessor for Logger();
  sub_100010174(v43, (uint64_t)qword_1000667D0);
  Swift::String v44 = v57;
  v39[2](v57, v40, v8);
  swift_bridgeObjectRetain_n();
  Swift::String v45 = Logger.logObject.getter();
  os_log_type_t v46 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v45, v46))
  {
    uint64_t v47 = v8;
    unint64_t v48 = v24;
    os_log_type_t v49 = v44;
    uint64_t v50 = swift_slowAlloc();
    uint64_t v61 = swift_slowAlloc();
    uint64_t v63 = (char *)v61;
    *(_DWORD *)uint64_t v50 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v62 = sub_10000E564(v58, v48, (uint64_t *)&v63);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v50 + 12) = 2080;
    sub_100024C88(&qword_100065608, (void (*)(uint64_t))&type metadata accessor for Date);
    uint64_t v51 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v62 = sub_10000E564(v51, v52, (uint64_t *)&v63);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    ((void (*)(char *, uint64_t))v42)(v49, v47);
    _os_log_impl((void *)&_mh_execute_header, v45, v46, "Task %s is discarded due to endDate %s", (uint8_t *)v50, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v53 = v59;
    uint64_t v54 = v47;
  }
  else
  {

    ((void (*)(char *, uint64_t))v42)(v44, v8);
    swift_bridgeObjectRelease_n();
    uint64_t v53 = v40;
    uint64_t v54 = v8;
  }
  ((void (*)(char *, uint64_t))v42)(v53, v54);
  return 0;
}

uint64_t sub_10001FFEC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t sub_10002003C()
{
  sub_10001FFEC();

  return _swift_deallocClassInstance(v0, 88, 7);
}

uint64_t type metadata accessor for TaskRegistry()
{
  return self;
}

uint64_t sub_100020094()
{
  return sub_10001476C();
}

id sub_1000200B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = v9;
  if (a2)
  {
    NSString v14 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    NSString v14 = 0;
    if (a4)
    {
LABEL_3:
      NSString v15 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      uint64_t v16 = a9;
      if (a6) {
        goto LABEL_4;
      }
LABEL_8:
      NSString v17 = 0;
      if (a8) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  NSString v15 = 0;
  uint64_t v16 = a9;
  if (!a6) {
    goto LABEL_8;
  }
LABEL_4:
  NSString v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (a8)
  {
LABEL_5:
    NSString v18 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
LABEL_9:
  NSString v18 = 0;
LABEL_10:
  uint64_t v19 = type metadata accessor for Date();
  uint64_t v20 = *(void *)(v19 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v16, 1, v19) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v16, v19);
  }
  id v22 = [v10 initWithTopic:v14 channelID:v15 pushType:v17 pushPriority:v18 creationDate:isa];

  return v22;
}

uint64_t sub_100020280(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

char *sub_1000202A8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_10000E508(&qword_100065298);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100021F64(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000203B8(char a1, int64_t a2, char a3, unint64_t a4)
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
    uint64_t v13 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_10000E508(&qword_100065680);
  uint64_t v10 = *(void *)(sub_10000E508(&qword_1000652E0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  void v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_10000E508(&qword_1000652E0) - 8);
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
    sub_1000229CC(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_100020628(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10002076C(a1, a2, a3, a4, &qword_100065648, (uint64_t (*)(void))&type metadata accessor for ExtensionRecord, (uint64_t (*)(void))&type metadata accessor for ExtensionRecord);
}

void *sub_10002064C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = a4[2];
    if (v7 <= v8) {
      int64_t v9 = a4[2];
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      sub_10000E508(&qword_100065278);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * v11 - 64;
      unint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= (void *)((char *)a4 + v8 + 32)) {
          memmove(v12, a4 + 4, v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      unint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_100022DA4(0, v8, (char *)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100020748(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_10002076C(a1, a2, a3, a4, &qword_100065650, (uint64_t (*)(void))&type metadata accessor for MLHostTask, (uint64_t (*)(void))&type metadata accessor for MLHostTask);
}

uint64_t sub_10002076C(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    unint64_t v18 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_10000E508(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  unint64_t v18 = (void *)swift_allocObject();
  size_t v19 = j__malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100024EB4(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

uint64_t sub_1000209EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_100034E9C(a1, a2);
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
      sub_100020DEC((uint64_t (*)(void))&type metadata accessor for MLHostTask, &qword_1000655F0);
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = type metadata accessor for MLHostTask();
    uint64_t v20 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a3, v12 + *(void *)(v20 + 72) * v8, v13);
    sub_100020BB0(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = type metadata accessor for MLHostTask();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

unint64_t sub_100020BB0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v9 = Hasher._finalize()();
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
        uint64_t v15 = *(void *)(*(void *)(type metadata accessor for MLHostTask() - 8) + 72);
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

void *sub_100020DC0()
{
  return sub_100021468(&qword_100065690);
}

void *sub_100020DCC()
{
  return sub_100020DEC((uint64_t (*)(void))&type metadata accessor for MLHostTask, &qword_1000655F0);
}

void *sub_100020DEC(uint64_t (*a1)(void), uint64_t *a2)
{
  uint64_t v39 = a1(0);
  uint64_t v4 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  unint64_t v6 = (char *)&v33 - v5;
  sub_10000E508(a2);
  uint64_t v34 = v2;
  uint64_t v7 = *v2;
  uint64_t v8 = static _DictionaryStorage.copy(original:)();
  uint64_t v9 = *(void *)(v7 + 16);
  uint64_t v40 = v8;
  if (!v9)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v32 = v40;
    unint64_t v31 = v34;
LABEL_28:
    *unint64_t v31 = v32;
    return result;
  }
  uint64_t v10 = v8;
  uint64_t result = (void *)(v8 + 64);
  unint64_t v12 = (unint64_t)((1 << *(unsigned char *)(v10 + 32)) + 63) >> 6;
  if (v10 != v7 || (unint64_t)result >= v7 + 64 + 8 * v12)
  {
    uint64_t result = memmove(result, (const void *)(v7 + 64), 8 * v12);
    uint64_t v10 = v40;
  }
  int64_t v14 = 0;
  *(void *)(v10 + 16) = *(void *)(v7 + 16);
  uint64_t v15 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  unint64_t v17 = v16 & *(void *)(v7 + 64);
  uint64_t v35 = v7 + 64;
  int64_t v36 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v37 = v4 + 32;
  uint64_t v38 = v4 + 16;
  uint64_t v18 = v39;
  while (1)
  {
    if (v17)
    {
      unint64_t v19 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_12;
    }
    int64_t v28 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v28 >= v36) {
      goto LABEL_26;
    }
    unint64_t v29 = *(void *)(v35 + 8 * v28);
    ++v14;
    if (!v29)
    {
      int64_t v14 = v28 + 1;
      if (v28 + 1 >= v36) {
        goto LABEL_26;
      }
      unint64_t v29 = *(void *)(v35 + 8 * v14);
      if (!v29) {
        break;
      }
    }
LABEL_25:
    unint64_t v17 = (v29 - 1) & v29;
    unint64_t v20 = __clz(__rbit64(v29)) + (v14 << 6);
LABEL_12:
    uint64_t v21 = 16 * v20;
    uint64_t v22 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v20);
    uint64_t v23 = *v22;
    uint64_t v24 = v22[1];
    unint64_t v25 = *(void *)(v4 + 72) * v20;
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v6, *(void *)(v7 + 56) + v25, v18);
    uint64_t v26 = v40;
    uint64_t v27 = (void *)(*(void *)(v40 + 48) + v21);
    void *v27 = v23;
    v27[1] = v24;
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(*(void *)(v26 + 56) + v25, v6, v18);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v30 = v28 + 2;
  if (v30 >= v36)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    unint64_t v31 = v34;
    uint64_t v32 = v40;
    goto LABEL_28;
  }
  unint64_t v29 = *(void *)(v35 + 8 * v30);
  if (v29)
  {
    int64_t v14 = v30;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v14 = v30 + 1;
    if (__OFADD__(v30, 1)) {
      break;
    }
    if (v14 >= v36) {
      goto LABEL_26;
    }
    unint64_t v29 = *(void *)(v35 + 8 * v14);
    ++v30;
    if (v29) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1000210B0()
{
  uint64_t v1 = v0;
  sub_10000E508(&qword_100065618);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
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
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    long long v20 = *(_OWORD *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = v19;
    v21[1] = v18;
    *(_OWORD *)(*(void *)(v4 + 56) + v16) = v20;
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

void *sub_100021274()
{
  uint64_t v1 = v0;
  sub_10000E508(&qword_100065688);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t v25 = v1;
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
      goto LABEL_30;
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
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_1000101FC(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = v19;
    v21[1] = v18;
    sub_100010414(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
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
LABEL_30:
  __break(1u);
  return result;
}

void *sub_10002145C()
{
  return sub_100021468(&qword_100065660);
}

void *sub_100021468(uint64_t *a1)
{
  uint64_t v2 = v1;
  sub_10000E508(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = static _DictionaryStorage.copy(original:)();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v2 = v5;
    return result;
  }
  uint64_t result = (void *)(v4 + 64);
  uint64_t v7 = v3 + 64;
  unint64_t v8 = (unint64_t)((1 << *(unsigned char *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8) {
    uint64_t result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  }
  int64_t v10 = 0;
  *(void *)(v5 + 16) = *(void *)(v3 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v3 + 64);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      int64_t v10 = v23 + 1;
      if (v23 + 1 >= v14) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v7 + 8 * v10);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    uint64_t v17 = 16 * v16;
    uint64_t v18 = (void *)(*(void *)(v3 + 48) + 16 * v16);
    uint64_t v19 = v18[1];
    uint64_t v20 = 8 * v16;
    uint64_t v21 = *(void *)(*(void *)(v3 + 56) + v20);
    int64_t v22 = (void *)(*(void *)(v5 + 48) + v17);
    void *v22 = *v18;
    v22[1] = v19;
    *(void *)(*(void *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v14) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v7 + 8 * v25);
  if (v24)
  {
    int64_t v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v10 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v10 >= v14) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v7 + 8 * v10);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_100021618(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100021638(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100021638(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    sub_10000E508(&qword_100065298);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    int64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  int64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000217A4(uint64_t isStackAllocationSafe)
{
  uint64_t v2 = isStackAllocationSafe;
  char v3 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v4 = (unint64_t)((1 << v3) + 63) >> 6;
  size_t v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    uint64_t v6 = sub_1000218FC((unint64_t *)((char *)&v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0)), v4, v2);
    if (v1) {
      swift_willThrow();
    }
    else {
      return v6;
    }
  }
  else
  {
    int64_t v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    uint64_t v2 = sub_1000218FC((unint64_t *)v7, v4, v2);
    swift_slowDealloc();
  }
  return v2;
}

uint64_t sub_1000218FC(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v24 = a2;
  int64_t v25 = a1;
  uint64_t v4 = type metadata accessor for TaskDefinition();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t result = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v9 = 0;
  uint64_t v10 = *(void *)(a3 + 64);
  uint64_t v26 = 0;
  uint64_t v27 = a3 + 64;
  uint64_t v11 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & v10;
  uint64_t v30 = v5 + 16;
  int64_t v28 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v29 = v5 + 8;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_5;
    }
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v19 >= v28) {
      return sub_100021BA8(v25, v24, v26, (void *)a3);
    }
    unint64_t v20 = *(void *)(v27 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v28) {
        return sub_100021BA8(v25, v24, v26, (void *)a3);
      }
      unint64_t v20 = *(void *)(v27 + 8 * v9);
      if (!v20)
      {
        int64_t v9 = v19 + 2;
        if (v19 + 2 >= v28) {
          return sub_100021BA8(v25, v24, v26, (void *)a3);
        }
        unint64_t v20 = *(void *)(v27 + 8 * v9);
        if (!v20) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_5:
    unint64_t v16 = (uint64_t *)(*(void *)(a3 + 48) + 16 * v15);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v8, *(void *)(a3 + 56) + *(void *)(v5 + 72) * v15, v4);
    swift_bridgeObjectRetain();
    LOBYTE(v18) = sub_10001F7F8(v18, v17);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    uint64_t result = swift_bridgeObjectRelease();
    if (v18)
    {
      *(unint64_t *)((char *)v25 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      if (__OFADD__(v26++, 1))
      {
        __break(1u);
        return sub_100021BA8(v25, v24, v26, (void *)a3);
      }
    }
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v28) {
    return sub_100021BA8(v25, v24, v26, (void *)a3);
  }
  unint64_t v20 = *(void *)(v27 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v28) {
      return sub_100021BA8(v25, v24, v26, (void *)a3);
    }
    unint64_t v20 = *(void *)(v27 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_100021BA8(unint64_t *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = type metadata accessor for TaskDefinition();
  uint64_t v50 = *(void *)(v8 - 8);
  uint64_t v9 = __chkstk_darwin(v8);
  unint64_t v52 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  os_log_type_t v49 = (char *)&v43 - v12;
  if (!a3) {
    return (uint64_t)&_swiftEmptyDictionarySingleton;
  }
  if (a4[2] == a3)
  {
    swift_retain();
    return (uint64_t)a4;
  }
  uint64_t v48 = v11;
  sub_10000E508(&qword_100065678);
  uint64_t result = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v14 = result;
  uint64_t v43 = a1;
  uint64_t v44 = a2;
  if (a2 < 1) {
    unint64_t v15 = 0;
  }
  else {
    unint64_t v15 = *a1;
  }
  uint64_t v16 = 0;
  uint64_t v46 = v50 + 32;
  uint64_t v47 = v50 + 16;
  uint64_t v17 = result + 64;
  uint64_t v18 = v48;
  Swift::String v45 = a4;
  while (1)
  {
    if (v15)
    {
      unint64_t v19 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      uint64_t v51 = v16;
      unint64_t v20 = v19 | (v16 << 6);
    }
    else
    {
      uint64_t v21 = v16 + 1;
      if (__OFADD__(v16, 1)) {
        goto LABEL_40;
      }
      if (v21 >= v44) {
        return v14;
      }
      unint64_t v22 = v43[v21];
      uint64_t v23 = v16 + 1;
      if (!v22)
      {
        uint64_t v23 = v16 + 2;
        if (v16 + 2 >= v44) {
          return v14;
        }
        unint64_t v22 = v43[v23];
        if (!v22)
        {
          uint64_t v23 = v16 + 3;
          if (v16 + 3 >= v44) {
            return v14;
          }
          unint64_t v22 = v43[v23];
          if (!v22)
          {
            uint64_t v24 = v16 + 4;
            if (v16 + 4 >= v44) {
              return v14;
            }
            unint64_t v22 = v43[v24];
            if (!v22)
            {
              while (1)
              {
                uint64_t v23 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_41;
                }
                if (v23 >= v44) {
                  return v14;
                }
                unint64_t v22 = v43[v23];
                ++v24;
                if (v22) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v23 = v16 + 4;
          }
        }
      }
LABEL_24:
      unint64_t v15 = (v22 - 1) & v22;
      uint64_t v51 = v23;
      unint64_t v20 = __clz(__rbit64(v22)) + (v23 << 6);
    }
    uint64_t v25 = a4[7];
    uint64_t v26 = (uint64_t *)(a4[6] + 16 * v20);
    uint64_t v27 = *v26;
    uint64_t v28 = v26[1];
    uint64_t v29 = v49;
    uint64_t v30 = v50;
    uint64_t v31 = *(void *)(v50 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v50 + 16))(v49, v25 + v31 * v20, v18);
    uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
    v32(v52, v29, v18);
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v33 = -1 << *(unsigned char *)(v14 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v17 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v36 = __clz(__rbit64((-1 << v34) & ~*(void *)(v17 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
      uint64_t v18 = v48;
    }
    else
    {
      char v37 = 0;
      unint64_t v38 = (unint64_t)(63 - v33) >> 6;
      uint64_t v18 = v48;
      do
      {
        if (++v35 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v39 = v35 == v38;
        if (v35 == v38) {
          unint64_t v35 = 0;
        }
        v37 |= v39;
        uint64_t v40 = *(void *)(v17 + 8 * v35);
      }
      while (v40 == -1);
      unint64_t v36 = __clz(__rbit64(~v40)) + (v35 << 6);
    }
    *(void *)(v17 + ((v36 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v36;
    char v41 = (void *)(*(void *)(v14 + 48) + 16 * v36);
    *char v41 = v27;
    v41[1] = v28;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v32)(*(void *)(v14 + 56) + v36 * v31, v52, v18);
    ++*(void *)(v14 + 16);
    if (__OFSUB__(a3--, 1)) {
      break;
    }
    a4 = v45;
    uint64_t v16 = v51;
    if (!a3) {
      return v14;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_100021F64(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100022058(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, char *))
{
  uint64_t v25 = a2;
  uint64_t v32 = a4;
  uint64_t v26 = a1;
  uint64_t v5 = type metadata accessor for TaskDefinition();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t result = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v10 = 0;
  uint64_t v33 = (void *)a3;
  uint64_t v11 = *(void *)(a3 + 64);
  uint64_t v27 = 0;
  uint64_t v28 = a3 + 64;
  uint64_t v12 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & v11;
  uint64_t v31 = v6 + 16;
  int64_t v29 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v30 = v6 + 8;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_5;
    }
    int64_t v20 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v20 >= v29) {
      return sub_100021BA8(v26, v25, v27, v33);
    }
    unint64_t v21 = *(void *)(v28 + 8 * v20);
    ++v10;
    if (!v21)
    {
      int64_t v10 = v20 + 1;
      if (v20 + 1 >= v29) {
        return sub_100021BA8(v26, v25, v27, v33);
      }
      unint64_t v21 = *(void *)(v28 + 8 * v10);
      if (!v21)
      {
        int64_t v10 = v20 + 2;
        if (v20 + 2 >= v29) {
          return sub_100021BA8(v26, v25, v27, v33);
        }
        unint64_t v21 = *(void *)(v28 + 8 * v10);
        if (!v21) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v14 = (v21 - 1) & v21;
    unint64_t v16 = __clz(__rbit64(v21)) + (v10 << 6);
LABEL_5:
    uint64_t v17 = (uint64_t *)(v33[6] + 16 * v16);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v9, v33[7] + *(void *)(v6 + 72) * v16, v5);
    swift_bridgeObjectRetain();
    LOBYTE(v18) = v32(v18, v19, v9);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    uint64_t result = swift_bridgeObjectRelease();
    if (v18)
    {
      *(unint64_t *)((char *)v26 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      if (__OFADD__(v27++, 1))
      {
        __break(1u);
        return sub_100021BA8(v26, v25, v27, v33);
      }
    }
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v29) {
    return sub_100021BA8(v26, v25, v27, v33);
  }
  unint64_t v21 = *(void *)(v28 + 8 * v22);
  if (v21)
  {
    int64_t v10 = v22;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v10 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v10 >= v29) {
      return sub_100021BA8(v26, v25, v27, v33);
    }
    unint64_t v21 = *(void *)(v28 + 8 * v10);
    ++v22;
    if (v21) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_100022318(uint64_t isStackAllocationSafe, uint64_t (*a2)(uint64_t, uint64_t, char *), uint64_t a3)
{
  uint64_t v6 = isStackAllocationSafe;
  char v7 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v8 = (unint64_t)((1 << v7) + 63) >> 6;
  size_t v9 = 8 * v8;
  if ((v7 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v9);
    uint64_t v10 = sub_100022058((unint64_t *)((char *)&v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0)), v8, v6, a2);
    if (v3) {
      swift_willThrow();
    }
    else {
      return v10;
    }
  }
  else
  {
    uint64_t v11 = (void *)swift_slowAlloc();
    bzero(v11, v9);
    a3 = sub_100022058((unint64_t *)v11, v8, v6, a2);
    swift_slowDealloc();
  }
  return a3;
}

void *sub_100022490(uint64_t a1, uint64_t a2)
{
  uint64_t v55 = a2;
  uint64_t v54 = type metadata accessor for URL.DirectoryHint();
  uint64_t v4 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  unint64_t v52 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000E508(&qword_1000655C0);
  __chkstk_darwin(v6 - 8);
  uint64_t v53 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = type metadata accessor for URL();
  uint64_t v8 = __chkstk_darwin(v60);
  uint64_t v51 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v50 = (char *)&v39 - v11;
  unint64_t v12 = *(void *)(a1 + 16);
  if (!v12) {
    return &_swiftEmptyArrayStorage;
  }
  unint64_t v13 = 0;
  uint64_t v48 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  unsigned int v47 = enum case for URL.DirectoryHint.inferFromPath(_:);
  Swift::String v45 = (void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v46 = (void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  uint64_t v44 = (void (**)(char *, uint64_t))(v10 + 8);
  uint64_t v14 = a1 + 40;
  uint64_t v43 = -(uint64_t)v12;
  unint64_t v15 = &_swiftEmptyArrayStorage;
  uint64_t v41 = v2;
  unint64_t v40 = v12;
  uint64_t v39 = a1 + 40;
  do
  {
    uint64_t v42 = v15;
    if (v13 <= v12) {
      unint64_t v16 = v12;
    }
    else {
      unint64_t v16 = v13;
    }
    uint64_t v49 = -(uint64_t)v16;
    uint64_t v17 = (void *)(v14 + 16 * v13);
    unint64_t v18 = v13 + 1;
    while (1)
    {
      if (v49 + v18 == 1) {
        __break(1u);
      }
      uint64_t v19 = *v17;
      uint64_t v58 = *(v17 - 1);
      unint64_t v59 = v18;
      uint64_t v56 = v17;
      char v63 = 1;
      uint64_t v57 = *(void *)(v55 + 40);
      (*v48)(v53, 1, 1, v60);
      int64_t v20 = *v46;
      unint64_t v21 = v52;
      uint64_t v22 = v47;
      uint64_t v23 = v54;
      (*v46)(v52, v47, v54);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v24 = v51;
      uint64_t v25 = v19;
      URL.init(filePath:directoryHint:relativeTo:)();
      uint64_t v26 = v58;
      uint64_t v61 = v58;
      uint64_t v62 = v25;
      v20(v21, v22, v23);
      sub_100024B80();
      uint64_t v27 = v50;
      URL.appending<A>(path:directoryHint:)();
      (*v45)(v21, v23);
      uint64_t v28 = *v44;
      uint64_t v29 = v60;
      (*v44)(v24, v60);
      URL.path(percentEncoded:)(0);
      v28(v27, v29);
      id v30 = [self defaultManager];
      NSString v31 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      unsigned int v32 = [v30 fileExistsAtPath:v31 isDirectory:&v63];

      if (v32)
      {
        if (v63) {
          break;
        }
      }
      swift_bridgeObjectRelease();
      unint64_t v18 = v59 + 1;
      uint64_t v17 = v56 + 2;
      if (v43 + v59 + 1 == 1) {
        return v42;
      }
    }
    uint64_t v33 = v42;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v15 = v33;
    char v64 = v33;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_100021618(0, v33[2] + 1, 1);
      unint64_t v15 = v64;
    }
    unint64_t v12 = v40;
    unint64_t v13 = v59;
    uint64_t v14 = v39;
    unint64_t v36 = v15[2];
    unint64_t v35 = v15[3];
    if (v36 >= v35 >> 1)
    {
      sub_100021618(v35 > 1, v36 + 1, 1);
      unint64_t v15 = v64;
    }
    v15[2] = v36 + 1;
    char v37 = (char *)&v15[2 * v36];
    *((void *)v37 + 4) = v26;
    *((void *)v37 + 5) = v25;
  }
  while (v43 + v13);
  return v15;
}

uint64_t sub_1000229CC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_10000E508(&qword_1000652E0) - 8);
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100022B28(uint64_t a1)
{
  uint64_t v2 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  unint64_t v4 = v3 & *(void *)(a1 + 56);
  int64_t v19 = (unint64_t)(v2 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t j = 0;
  if (!v4) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v7 = __clz(__rbit64(v4));
  v4 &= v4 - 1;
  for (unint64_t i = v7 | (j << 6); ; unint64_t i = __clz(__rbit64(v10)) + (j << 6))
  {
    unint64_t v12 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
    uint64_t v14 = *v12;
    uint64_t v13 = v12[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v20 = String.init<A>(_:)();
    uint64_t v21 = v15;
    String.append<A>(contentsOf:)();
    if (v14 == v20 && v13 == v21)
    {
      swift_release();
      swift_bridgeObjectRelease();
      return v14;
    }
    char v17 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v17)
    {
      swift_release();
      return v14;
    }
    uint64_t result = swift_bridgeObjectRelease();
    if (v4) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v9 = j + 1;
    if (__OFADD__(j, 1)) {
      break;
    }
    if (v9 >= v19) {
      goto LABEL_29;
    }
    unint64_t v10 = *(void *)(v18 + 8 * v9);
    ++j;
    if (v10) {
      goto LABEL_19;
    }
    int64_t j = v9 + 1;
    if (v9 + 1 >= v19) {
      goto LABEL_29;
    }
    unint64_t v10 = *(void *)(v18 + 8 * j);
    if (v10) {
      goto LABEL_19;
    }
    int64_t j = v9 + 2;
    if (v9 + 2 >= v19) {
      goto LABEL_29;
    }
    unint64_t v10 = *(void *)(v18 + 8 * j);
    if (v10) {
      goto LABEL_19;
    }
    int64_t j = v9 + 3;
    if (v9 + 3 >= v19) {
      goto LABEL_29;
    }
    unint64_t v10 = *(void *)(v18 + 8 * j);
    if (v10) {
      goto LABEL_19;
    }
    int64_t v11 = v9 + 4;
    if (v11 >= v19)
    {
LABEL_29:
      swift_release();
      return 0;
    }
    unint64_t v10 = *(void *)(v18 + 8 * v11);
    for (int64_t j = v11; !v10; ++v11)
    {
      int64_t j = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_32;
      }
      if (j >= v19) {
        goto LABEL_29;
      }
      unint64_t v10 = *(void *)(v18 + 8 * j);
    }
LABEL_19:
    unint64_t v4 = (v10 - 1) & v10;
  }
  __break(1u);
LABEL_32:
  __break(1u);
  return result;
}

char *sub_100022DA4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + a1 + 32);
    uint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_100022E8C(uint64_t a1, void *a2)
{
  uint64_t v122 = type metadata accessor for URL.DirectoryHint();
  uint64_t v4 = *(void *)(v122 - 8);
  __chkstk_darwin(v122);
  uint64_t v121 = (char *)&v102 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000E508(&qword_1000655C0);
  __chkstk_darwin(v6 - 8);
  uint64_t v120 = (char *)&v102 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v124 - 8);
  uint64_t v9 = __chkstk_darwin(v124);
  BOOL v108 = (char *)&v102 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  unint64_t v102 = (char *)&v102 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  os_log_type_t v119 = (char *)&v102 - v14;
  __chkstk_darwin(v13);
  uint64_t v127 = (char *)&v102 - v15;
  id v118 = self;
  id v16 = [v118 defaultManager];
  uint64_t v17 = *(void *)(a1 + 48);
  uint64_t v117 = *(void *)(a1 + 40);
  uint64_t v116 = v17;
  NSString v18 = String._bridgeToObjectiveC()();
  v135[0] = 0;
  id v19 = [v16 contentsOfDirectoryAtPath:v18 error:v135];

  id v20 = v135[0];
  if (v19)
  {
    uint64_t v21 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    id v22 = v20;

    swift_retain();
    uint64_t v23 = sub_100022490(v21, a1);
    uint64_t v107 = 0;
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v24 = (void *)sub_1000383C8((uint64_t)v23);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v26 = v135[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease();
    uint64_t v107 = 0;
    uint64_t v24 = &_swiftEmptySetSingleton;
  }
  int64_t v27 = 0;
  uint64_t v28 = v24[7];
  long long v125 = (char *)(v24 + 7);
  uint64_t v29 = 1 << *((unsigned char *)v24 + 32);
  uint64_t v30 = -1;
  if (v29 < 64) {
    uint64_t v30 = ~(-1 << v29);
  }
  unint64_t v31 = v30 & v28;
  int64_t v126 = (unint64_t)(v29 + 63) >> 6;
  NSString v114 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
  unsigned int v113 = enum case for URL.DirectoryHint.inferFromPath(_:);
  os_log_type_t v112 = (void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  uint64_t v111 = (void (**)(char *, uint64_t))(v4 + 8);
  id v131 = (void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v110 = (void (**)(char *, char *, uint64_t))(v8 + 16);
  uint64_t v104 = a2 + 7;
  char v103 = (char *)_swiftEmptyArrayStorage;
  *(void *)&long long v25 = 136315138;
  long long v109 = v25;
  uint64_t v105 = (char *)&type metadata for Any + 8;
  *(void *)&long long v25 = 136315394;
  long long v106 = v25;
  unint64_t v123 = a2;
  uint64_t v115 = v24;
  while (1)
  {
    if (v31)
    {
      unint64_t v33 = __clz(__rbit64(v31));
      v31 &= v31 - 1;
      unint64_t v34 = v33 | (v27 << 6);
      goto LABEL_20;
    }
    if (__OFADD__(v27++, 1)) {
      goto LABEL_64;
    }
    if (v27 >= v126) {
      break;
    }
    unint64_t v36 = *(void *)&v125[8 * v27];
    if (!v36)
    {
      int64_t v37 = v27 + 1;
      if (v27 + 1 >= v126) {
        break;
      }
      unint64_t v36 = *(void *)&v125[8 * v37];
      if (v36) {
        goto LABEL_18;
      }
      int64_t v37 = v27 + 2;
      if (v27 + 2 >= v126) {
        break;
      }
      unint64_t v36 = *(void *)&v125[8 * v37];
      if (v36)
      {
LABEL_18:
        int64_t v27 = v37;
      }
      else
      {
        int64_t v85 = v27 + 3;
        if (v27 + 3 >= v126) {
          break;
        }
        unint64_t v36 = *(void *)&v125[8 * v85];
        for (v27 += 3; !v36; ++v85)
        {
          int64_t v27 = v85 + 1;
          if (__OFADD__(v85, 1)) {
            goto LABEL_65;
          }
          if (v27 >= v126) {
            goto LABEL_62;
          }
          unint64_t v36 = *(void *)&v125[8 * v27];
        }
      }
    }
    unint64_t v31 = (v36 - 1) & v36;
    unint64_t v34 = __clz(__rbit64(v36)) + (v27 << 6);
LABEL_20:
    uint64_t v38 = v24[6] + 16 * v34;
    unint64_t v40 = *(void **)v38;
    uint64_t v39 = *(void **)(v38 + 8);
    uint64_t v41 = a2[2];
    if (!v41) {
      goto LABEL_43;
    }
    BOOL v42 = (void *)a2[4] == v40 && a2[5] == (void)v39;
    if (v42 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_26:
      uint64_t v132 = v40;
      uint64_t v43 = qword_100064F68;
      swift_bridgeObjectRetain();
      if (v43 != -1) {
        swift_once();
      }
      uint64_t v44 = type metadata accessor for Logger();
      uint64_t v45 = sub_100010174(v44, (uint64_t)qword_1000667D0);
      swift_bridgeObjectRetain_n();
      uint64_t v128 = v45;
      uint64_t v46 = Logger.logObject.getter();
      os_log_type_t v47 = static os_log_type_t.debug.getter();
      BOOL v48 = os_log_type_enabled(v46, v47);
      unint64_t v129 = v31;
      int64_t v130 = v27;
      if (v48)
      {
        uint64_t v49 = swift_slowAlloc();
        v135[0] = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v49 = v109;
        swift_bridgeObjectRetain();
        *(void *)(v49 + 4) = sub_10000E564((uint64_t)v132, (unint64_t)v39, (uint64_t *)v135);
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v46, v47, "Pruning taskFolder: %s", (uint8_t *)v49, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v50 = v124;
      (*v114)(v120, 1, 1, v124);
      uint64_t v51 = *v112;
      uint64_t v53 = v121;
      uint64_t v52 = v122;
      uint64_t v54 = v113;
      (*v112)(v121, v113, v122);
      swift_bridgeObjectRetain();
      uint64_t v55 = v119;
      URL.init(filePath:directoryHint:relativeTo:)();
      v135[0] = v132;
      v135[1] = v39;
      v51(v53, v54, v52);
      sub_100024B80();
      uint64_t v56 = v127;
      URL.appending<A>(path:directoryHint:)();
      (*v111)(v53, v52);
      uint64_t v57 = *v131;
      (*v131)(v55, v50);
      id v58 = [v118 defaultManager];
      URL._bridgeToObjectiveC()(v59);
      uint64_t v61 = v60;
      v135[0] = 0;
      LODWORD(v53) = [v58 removeItemAtURL:v60 error:v135];

      id v62 = v135[0];
      if (v53)
      {
        os_log_type_t v86 = v102;
        (*v110)(v102, v56, v50);
        id v87 = v62;
        uint64_t v88 = Logger.logObject.getter();
        uint64_t v89 = v50;
        os_log_type_t v90 = static os_log_type_t.info.getter();
        BOOL v91 = os_log_type_enabled(v88, v90);
        unint64_t v31 = v129;
        if (v91)
        {
          uint64_t v92 = swift_slowAlloc();
          v135[0] = (id)swift_slowAlloc();
          *(_DWORD *)uint64_t v92 = v109;
          sub_100024C88(&qword_1000655E0, (void (*)(uint64_t))&type metadata accessor for URL);
          uint64_t v93 = dispatch thunk of CustomStringConvertible.description.getter();
          *(void *)(v92 + 4) = sub_10000E564(v93, v94, (uint64_t *)v135);
          swift_bridgeObjectRelease();
          v57(v86, v89);
          _os_log_impl((void *)&_mh_execute_header, v88, v90, "Removed taskFolder: %s", (uint8_t *)v92, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          uint64_t v56 = v127;
          swift_slowDealloc();
        }
        else
        {
          v57(v86, v89);
        }

        a2 = v123;
        uint64_t v95 = v132;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v24 = v115;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          char v103 = sub_1000202A8(0, *((void *)v103 + 2) + 1, 1, v103);
        }
        unint64_t v98 = *((void *)v103 + 2);
        unint64_t v97 = *((void *)v103 + 3);
        if (v98 >= v97 >> 1) {
          char v103 = sub_1000202A8((char *)(v97 > 1), v98 + 1, 1, v103);
        }
        BOOL v99 = v103;
        *((void *)v103 + 2) = v98 + 1;
        uint64_t v100 = &v99[16 * v98];
        *((void *)v100 + 4) = v95;
        *((void *)v100 + 5) = v39;
        v57(v56, v124);
        int64_t v27 = v130;
      }
      else
      {
        id v63 = v135[0];
        swift_bridgeObjectRelease();
        char v64 = (void *)_convertNSErrorToError(_:)();

        swift_willThrow();
        v135[0] = v64;
        sub_10000E508(&qword_1000655D0);
        sub_100010330(0, &qword_1000655D8);
        swift_dynamicCast();
        char v65 = v133;
        uint64_t v66 = v108;
        (*v110)(v108, v56, v50);
        id v67 = v65;
        NSString v68 = Logger.logObject.getter();
        uint64_t v69 = v50;
        os_log_type_t v70 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v68, v70))
        {
          os_log_type_t v71 = v66;
          uint64_t v72 = swift_slowAlloc();
          uint64_t v73 = (void *)swift_slowAlloc();
          uint64_t v134 = swift_slowAlloc();
          *(_DWORD *)uint64_t v72 = v106;
          sub_100024C88(&qword_1000655E0, (void (*)(uint64_t))&type metadata accessor for URL);
          uint64_t v74 = dispatch thunk of CustomStringConvertible.description.getter();
          *(void *)(v72 + 4) = sub_10000E564(v74, v75, &v134);
          swift_bridgeObjectRelease();
          v57(v71, v69);
          *(_WORD *)(v72 + 12) = 2112;
          *(void *)(v72 + 14) = v67;
          *uint64_t v73 = v67;

          _os_log_impl((void *)&_mh_execute_header, v68, v70, "Failed at removing taskFolder: %s %@", (uint8_t *)v72, 0x16u);
          sub_10000E508(&qword_100065290);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          unsigned int v32 = v127;
        }
        else
        {

          v57(v66, v69);
          unsigned int v32 = v56;
        }
        v57(v32, v69);
        a2 = v123;
        swift_errorRelease();
        uint64_t v107 = 0;
        uint64_t v24 = v115;
        unint64_t v31 = v129;
        int64_t v27 = v130;
      }
    }
    else
    {
      if (v41 != 1)
      {
        int64_t v76 = v104;
        uint64_t v77 = 1;
        while (1)
        {
          uint64_t v78 = v77 + 1;
          if (__OFADD__(v77, 1)) {
            break;
          }
          BOOL v79 = (void *)*(v76 - 1) == v40 && *v76 == (void)v39;
          if (v79 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
            goto LABEL_26;
          }
          v76 += 2;
          ++v77;
          if (v78 == v41) {
            goto LABEL_43;
          }
        }
        __break(1u);
LABEL_64:
        __break(1u);
LABEL_65:
        __break(1u);
      }
LABEL_43:
      uint64_t v80 = qword_100064F68;
      swift_bridgeObjectRetain();
      if (v80 != -1) {
        swift_once();
      }
      uint64_t v81 = type metadata accessor for Logger();
      sub_100010174(v81, (uint64_t)qword_1000667D0);
      swift_bridgeObjectRetain();
      uint64_t v82 = Logger.logObject.getter();
      os_log_type_t v83 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v82, v83))
      {
        uint64_t v84 = swift_slowAlloc();
        v135[0] = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v84 = v109;
        swift_bridgeObjectRetain();
        *(void *)(v84 + 4) = sub_10000E564((uint64_t)v40, (unint64_t)v39, (uint64_t *)v135);
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v82, v83, "Skipping taskFolder: %s", (uint8_t *)v84, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
  }
LABEL_62:
  swift_release();
  return v103;
}

char *sub_100023D0C(uint64_t a1, uint64_t a2)
{
  uint64_t v123 = type metadata accessor for URL.DirectoryHint();
  uint64_t v4 = *(void *)(v123 - 8);
  __chkstk_darwin(v123);
  uint64_t v122 = (char *)&v103 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000E508(&qword_1000655C0);
  __chkstk_darwin(v6 - 8);
  uint64_t v121 = (char *)&v103 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v134 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v134 - 8);
  uint64_t v9 = __chkstk_darwin(v134);
  uint64_t v110 = (char *)&v103 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v104 = (char *)&v103 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v117 = (char *)&v103 - v14;
  __chkstk_darwin(v13);
  id v16 = (char *)&v103 - v15;
  id v120 = self;
  id v17 = [v120 defaultManager];
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v119 = *(void *)(a1 + 40);
  uint64_t v118 = v18;
  NSString v19 = String._bridgeToObjectiveC()();
  v137[0] = 0;
  id v20 = [v17 contentsOfDirectoryAtPath:v19 error:v137];

  id v21 = v137[0];
  if (v20)
  {
    uint64_t v22 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    id v23 = v21;

    swift_retain();
    uint64_t v24 = sub_100022490(v22, a1);
    uint64_t v109 = 0;
    swift_bridgeObjectRelease();
    swift_release();
    long long v25 = (void *)sub_1000383C8((uint64_t)v24);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v27 = v137[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease();
    uint64_t v109 = 0;
    long long v25 = &_swiftEmptySetSingleton;
  }
  int64_t v133 = 0;
  uint64_t v28 = v25[7];
  int64_t v126 = (char *)(v25 + 7);
  uint64_t v29 = 1 << *((unsigned char *)v25 + 32);
  uint64_t v30 = -1;
  if (v29 < 64) {
    uint64_t v30 = ~(-1 << v29);
  }
  unint64_t v31 = v30 & v28;
  int64_t v127 = (unint64_t)(v29 + 63) >> 6;
  uint64_t v115 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
  unsigned int v114 = enum case for URL.DirectoryHint.inferFromPath(_:);
  unsigned int v113 = (void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  os_log_type_t v112 = (void (**)(char *, uint64_t))(v4 + 8);
  uint64_t v132 = (void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v111 = (void (**)(char *, char *, uint64_t))(v8 + 16);
  long long v106 = (char *)_swiftEmptyArrayStorage;
  unsigned int v32 = &OBJC_PROTOCOL____TtP20LighthouseBackground26MLHostExtensionXPCProtocol_;
  *(void *)&long long v26 = 136315138;
  long long v125 = v26;
  BOOL v108 = (char *)&type metadata for Any + 8;
  *(void *)&long long v26 = 136315394;
  long long v107 = v26;
  uint64_t v124 = a2;
  uint64_t v128 = v16;
  uint64_t v116 = v25;
LABEL_7:
  int64_t v33 = v133;
  while (v31)
  {
    unint64_t v34 = __clz(__rbit64(v31));
    v31 &= v31 - 1;
    unint64_t v35 = v34 | (v33 << 6);
LABEL_22:
    uint64_t v39 = v25[6] + 16 * v35;
    unint64_t v40 = *(void **)v39;
    unint64_t v41 = *(void *)(v39 + 8);
    swift_bridgeObjectRetain();
    char v42 = sub_1000139FC((uint64_t)v40, v41, a2);
    inst_props = v32[54].inst_props;
    if (v42)
    {
      if (inst_props != (__objc2_prop_list *)-1) {
        swift_once();
      }
      uint64_t v44 = type metadata accessor for Logger();
      sub_100010174(v44, (uint64_t)qword_1000667D0);
      swift_bridgeObjectRetain();
      uint64_t v45 = Logger.logObject.getter();
      os_log_type_t v46 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v45, v46))
      {
        os_log_type_t v47 = v25;
        unint64_t v48 = v31;
        uint64_t v49 = swift_slowAlloc();
        v137[0] = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v49 = v125;
        swift_bridgeObjectRetain();
        *(void *)(v49 + 4) = sub_10000E564((uint64_t)v40, v41, (uint64_t *)v137);
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v45, v46, "Skipping taskFolder: %s", (uint8_t *)v49, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        unint64_t v31 = v48;
        long long v25 = v47;
        unsigned int v32 = &OBJC_PROTOCOL____TtP20LighthouseBackground26MLHostExtensionXPCProtocol_;
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
    else
    {
      if (inst_props != (__objc2_prop_list *)-1) {
        swift_once();
      }
      uint64_t v50 = type metadata accessor for Logger();
      uint64_t v51 = sub_100010174(v50, (uint64_t)qword_1000667D0);
      swift_bridgeObjectRetain_n();
      uint64_t v52 = Logger.logObject.getter();
      os_log_type_t v53 = static os_log_type_t.debug.getter();
      BOOL v54 = os_log_type_enabled(v52, v53);
      int64_t v133 = v33;
      uint64_t v130 = v51;
      unint64_t v131 = v31;
      unint64_t v129 = (void *)v41;
      if (v54)
      {
        uint64_t v55 = swift_slowAlloc();
        v137[0] = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v55 = v125;
        swift_bridgeObjectRetain();
        *(void *)(v55 + 4) = sub_10000E564((uint64_t)v40, v41, (uint64_t *)v137);
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v52, v53, "Pruning taskFolder: %s", (uint8_t *)v55, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v56 = v134;
      (*v115)(v121, 1, 1, v134);
      uint64_t v57 = *v113;
      unint64_t v59 = v122;
      uint64_t v58 = v123;
      uint64_t v60 = v114;
      (*v113)(v122, v114, v123);
      swift_bridgeObjectRetain();
      uint64_t v61 = v117;
      URL.init(filePath:directoryHint:relativeTo:)();
      v137[0] = v40;
      id v62 = v129;
      v137[1] = v129;
      v57(v59, v60, v58);
      sub_100024B80();
      id v63 = v128;
      URL.appending<A>(path:directoryHint:)();
      char v64 = v59;
      char v65 = v63;
      (*v112)(v64, v58);
      uint64_t v66 = *v132;
      (*v132)(v61, v56);
      id v67 = [v120 defaultManager];
      URL._bridgeToObjectiveC()(v68);
      os_log_type_t v70 = v69;
      v137[0] = 0;
      LODWORD(v63) = [v67 removeItemAtURL:v69 error:v137];

      id v71 = v137[0];
      if (v63)
      {
        uint64_t v105 = v66;
        os_log_type_t v86 = v104;
        uint64_t v87 = v134;
        (*v111)(v104, v65, v134);
        id v88 = v71;
        uint64_t v89 = Logger.logObject.getter();
        os_log_type_t v90 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v89, v90))
        {
          BOOL v91 = v40;
          uint64_t v92 = v86;
          uint64_t v93 = swift_slowAlloc();
          v137[0] = (id)swift_slowAlloc();
          *(_DWORD *)uint64_t v93 = v125;
          sub_100024C88(&qword_1000655E0, (void (*)(uint64_t))&type metadata accessor for URL);
          uint64_t v94 = dispatch thunk of CustomStringConvertible.description.getter();
          *(void *)(v93 + 4) = sub_10000E564(v94, v95, (uint64_t *)v137);
          swift_bridgeObjectRelease();
          char v96 = v92;
          unint64_t v40 = v91;
          char v65 = v128;
          v105(v96, v87);
          _os_log_impl((void *)&_mh_execute_header, v89, v90, "Removed taskFolder: %s", (uint8_t *)v93, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          v105(v86, v87);
        }

        a2 = v124;
        long long v25 = v116;
        unsigned int v32 = &OBJC_PROTOCOL____TtP20LighthouseBackground26MLHostExtensionXPCProtocol_;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v31 = v131;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          long long v106 = sub_1000202A8(0, *((void *)v106 + 2) + 1, 1, v106);
        }
        unint64_t v99 = *((void *)v106 + 2);
        unint64_t v98 = *((void *)v106 + 3);
        if (v99 >= v98 >> 1) {
          long long v106 = sub_1000202A8((char *)(v98 > 1), v99 + 1, 1, v106);
        }
        uint64_t v100 = v106;
        *((void *)v106 + 2) = v99 + 1;
        char v101 = &v100[16 * v99];
        *((void *)v101 + 4) = v40;
        *((void *)v101 + 5) = v62;
        v105(v65, v134);
        goto LABEL_7;
      }
      id v72 = v137[0];
      swift_bridgeObjectRelease();
      uint64_t v73 = (void *)_convertNSErrorToError(_:)();

      swift_willThrow();
      v137[0] = v73;
      sub_10000E508(&qword_1000655D0);
      sub_100010330(0, &qword_1000655D8);
      swift_dynamicCast();
      uint64_t v74 = v135;
      unint64_t v75 = v110;
      (*v111)(v110, v65, v134);
      id v76 = v74;
      uint64_t v77 = Logger.logObject.getter();
      os_log_type_t v78 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v77, v78))
      {
        uint64_t v79 = swift_slowAlloc();
        uint64_t v80 = swift_slowAlloc();
        uint64_t v81 = v134;
        uint64_t v82 = (void *)v80;
        uint64_t v136 = swift_slowAlloc();
        *(_DWORD *)uint64_t v79 = v107;
        sub_100024C88(&qword_1000655E0, (void (*)(uint64_t))&type metadata accessor for URL);
        uint64_t v83 = dispatch thunk of CustomStringConvertible.description.getter();
        *(void *)(v79 + 4) = sub_10000E564(v83, v84, &v136);
        swift_bridgeObjectRelease();
        v66(v75, v81);
        *(_WORD *)(v79 + 12) = 2112;
        *(void *)(v79 + 14) = v76;
        *uint64_t v82 = v76;

        _os_log_impl((void *)&_mh_execute_header, v77, v78, "Failed at removing taskFolder: %s %@", (uint8_t *)v79, 0x16u);
        sub_10000E508(&qword_100065290);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v66(v128, v81);
      }
      else
      {

        uint64_t v85 = v134;
        v66(v75, v134);

        v66(v65, v85);
      }
      a2 = v124;
      long long v25 = v116;
      int64_t v33 = v133;
      unint64_t v31 = v131;
      swift_errorRelease();
      uint64_t v109 = 0;
      unsigned int v32 = &OBJC_PROTOCOL____TtP20LighthouseBackground26MLHostExtensionXPCProtocol_;
    }
  }
  if (__OFADD__(v33++, 1))
  {
    __break(1u);
    goto LABEL_51;
  }
  if (v33 >= v127) {
    goto LABEL_49;
  }
  unint64_t v37 = *(void *)&v126[8 * v33];
  if (v37)
  {
LABEL_21:
    unint64_t v31 = (v37 - 1) & v37;
    unint64_t v35 = __clz(__rbit64(v37)) + (v33 << 6);
    goto LABEL_22;
  }
  int64_t v38 = v33 + 1;
  if (v33 + 1 >= v127) {
    goto LABEL_49;
  }
  unint64_t v37 = *(void *)&v126[8 * v38];
  if (v37) {
    goto LABEL_20;
  }
  int64_t v38 = v33 + 2;
  if (v33 + 2 >= v127) {
    goto LABEL_49;
  }
  unint64_t v37 = *(void *)&v126[8 * v38];
  if (v37)
  {
LABEL_20:
    int64_t v33 = v38;
    goto LABEL_21;
  }
  int64_t v38 = v33 + 3;
  if (v33 + 3 < v127)
  {
    unint64_t v37 = *(void *)&v126[8 * v38];
    if (!v37)
    {
      while (1)
      {
        int64_t v33 = v38 + 1;
        if (__OFADD__(v38, 1)) {
          break;
        }
        if (v33 >= v127) {
          goto LABEL_49;
        }
        unint64_t v37 = *(void *)&v126[8 * v33];
        ++v38;
        if (v37) {
          goto LABEL_21;
        }
      }
LABEL_51:
      __break(1u);
    }
    goto LABEL_20;
  }
LABEL_49:
  swift_release();
  return v106;
}

unint64_t sub_100024B80()
{
  unint64_t result = qword_1000655C8;
  if (!qword_1000655C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000655C8);
  }
  return result;
}

uint64_t sub_100024BD4()
{
  return sub_100017338(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_100024BF0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100024C18(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100024C28()
{
  return swift_release();
}

uint64_t sub_100024C30()
{
  return sub_100015E18(v0[2], v0[3], v0[4]);
}

uint64_t sub_100024C50()
{
  return sub_100019418(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_100024C6C()
{
  return sub_10001CA90(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_100024C88(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100024CD0(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = result;
  int64_t v6 = 0;
  uint64_t v7 = result + 64;
  uint64_t v8 = 1 << *(unsigned char *)(result + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(result + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  while (v10)
  {
    unint64_t v12 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    unint64_t v13 = v12 | (v6 << 6);
LABEL_22:
    id v17 = (void *)(*(void *)(v5 + 48) + 16 * v13);
    if (*v17 != a2 || v17[1] != a3)
    {
      uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
      if ((result & 1) == 0) {
        continue;
      }
    }
    return 1;
  }
  int64_t v14 = v6 + 1;
  if (__OFADD__(v6, 1))
  {
    __break(1u);
    goto LABEL_30;
  }
  if (v14 >= v11) {
    return 0;
  }
  unint64_t v15 = *(void *)(v7 + 8 * v14);
  ++v6;
  if (v15) {
    goto LABEL_21;
  }
  int64_t v6 = v14 + 1;
  if (v14 + 1 >= v11) {
    return 0;
  }
  unint64_t v15 = *(void *)(v7 + 8 * v6);
  if (v15) {
    goto LABEL_21;
  }
  int64_t v6 = v14 + 2;
  if (v14 + 2 >= v11) {
    return 0;
  }
  unint64_t v15 = *(void *)(v7 + 8 * v6);
  if (v15) {
    goto LABEL_21;
  }
  int64_t v6 = v14 + 3;
  if (v14 + 3 >= v11) {
    return 0;
  }
  unint64_t v15 = *(void *)(v7 + 8 * v6);
  if (v15)
  {
LABEL_21:
    unint64_t v10 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v6 << 6);
    goto LABEL_22;
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v11) {
    return 0;
  }
  unint64_t v15 = *(void *)(v7 + 8 * v16);
  if (v15)
  {
    int64_t v6 = v16;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v6 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v6 >= v11) {
      return 0;
    }
    unint64_t v15 = *(void *)(v7 + 8 * v6);
    ++v16;
    if (v15) {
      goto LABEL_21;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100024E4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000E508(&qword_100065638);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100024EB4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100025010(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000E508(&qword_100065668);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100025078(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_10001F61C(a1, a2, a3, *(void *)(v3 + 16)) & 1;
}

uint64_t sub_1000250A0()
{
  return sub_100024BF0();
}

uint64_t sub_1000250BC()
{
  return sub_100024C50();
}

void sub_1000250D8()
{
  uint64_t v1 = v0;
  if (qword_100064F68 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100010174(v2, (uint64_t)qword_1000667D0);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "MLHostDaemon starting", v5, 2u);
    swift_slowDealloc();
  }

  int64_t v6 = self;
  id v7 = [v6 sharedScheduler];
  NSString v8 = String._bridgeToObjectiveC()();
  unint64_t v34 = sub_10002C3CC;
  uint64_t v35 = 0;
  aBos_unfair_lock_t lock = (uint64_t)_NSConcreteStackBlock;
  uint64_t v31 = 1107296256;
  unsigned int v32 = sub_1000287F8;
  int64_t v33 = &unk_100061F30;
  uint64_t v9 = _Block_copy(&aBlock);
  [v7 registerForTaskWithIdentifier:v8 usingQueue:0 launchHandler:v9];
  _Block_release(v9);

  sub_1000278F0();
  sub_10002AF70();
  sub_10002B70C();
  type metadata accessor for XPCListener();
  id v10 = *(id *)(v1 + 40);
  swift_retain();
  XPCListener.__allocating_init(serviceName:queue:handler:)();
  swift_retain();
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v11, v12))
  {
    unint64_t v13 = (uint8_t *)swift_slowAlloc();
    aBos_unfair_lock_t lock = swift_slowAlloc();
    *(_DWORD *)unint64_t v13 = 136315138;
    uint64_t v14 = XPCListener.description.getter();
    sub_10000E564(v14, v15, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "XPC listener: (%s)", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  uint64_t v16 = *(void *)(v1 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_notificationRegistry);
  sub_1000095A4(0xD000000000000016, 0x80000001000560D0);
  id v17 = (os_unfair_lock_s *)(*(void *)(v16 + 16) + 16);
  swift_retain();
  os_unfair_lock_lock(v17);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = sub_100034C0C;
  *(void *)(v18 + 24) = v1;
  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v29 = *(void *)(v16 + 72);
  *(void *)(v16 + 72) = 0x8000000000000000;
  sub_100036640((uint64_t)sub_100034C6C, v18, 0xD000000000000016, 0x80000001000560D0, isUniquelyReferenced_nonNull_native);
  *(void *)(v16 + 72) = v29;
  swift_bridgeObjectRelease();
  swift_endAccess();
  os_unfair_lock_unlock(v17);
  swift_release();
  id v20 = [v6 sharedScheduler];
  NSString v21 = String._bridgeToObjectiveC()();
  unint64_t v34 = sub_1000367C8;
  uint64_t v35 = v1;
  aBos_unfair_lock_t lock = (uint64_t)_NSConcreteStackBlock;
  uint64_t v31 = 1107296256;
  unsigned int v32 = sub_1000287F8;
  int64_t v33 = &unk_100061F80;
  uint64_t v22 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  [v20 registerForTaskWithIdentifier:v21 usingQueue:0 launchHandler:v22];
  _Block_release(v22);

  id v23 = [v6 sharedScheduler];
  NSString v24 = String._bridgeToObjectiveC()();
  unint64_t v34 = sub_1000367D0;
  uint64_t v35 = v1;
  aBos_unfair_lock_t lock = (uint64_t)_NSConcreteStackBlock;
  uint64_t v31 = 1107296256;
  unsigned int v32 = sub_1000287F8;
  int64_t v33 = &unk_100061FA8;
  long long v25 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  [v23 registerForTaskWithIdentifier:v24 usingQueue:0 launchHandler:v25];
  _Block_release(v25);

  long long v26 = Logger.logObject.getter();
  os_log_type_t v27 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "MLHostDaemon started", v28, 2u);
    swift_slowDealloc();
  }

  dispatch_main();
}

unint64_t sub_100025734(uint64_t a1)
{
  return sub_1000258A4(a1, &qword_100065660);
}

unint64_t sub_100025740(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000E508(&qword_100065858);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_10004A580(v6, (uint64_t)&v13, &qword_100065860);
    uint64_t v7 = v13;
    unint64_t result = sub_100034F14(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_100010414(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
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

unint64_t sub_100025870(uint64_t a1)
{
  return sub_100025B10(a1, &qword_100065900, &qword_1000655F0, (uint64_t (*)(void))&type metadata accessor for MLHostTask);
}

unint64_t sub_100025898(uint64_t a1)
{
  return sub_1000258A4(a1, &qword_100065690);
}

unint64_t sub_1000258A4(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000E508(a2);
  uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v6 = *(v5 - 2);
    uint64_t v7 = *(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_100034E9C(v6, v7);
    if (v10) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    BOOL v11 = (uint64_t *)(v3[6] + 16 * result);
    *BOOL v11 = v6;
    v11[1] = v7;
    *(void *)(v3[7] + 8 * result) = v8;
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v5 += 3;
    if (!--v4)
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

unint64_t sub_1000259BC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000E508(&qword_100065618);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (_OWORD *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    long long v13 = *v4;
    swift_bridgeObjectRetain();
    swift_retain();
    unint64_t result = sub_100034E9C(v5, v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v9 = (uint64_t *)(v2[6] + 16 * result);
    *char v9 = v5;
    v9[1] = v6;
    *(_OWORD *)(v2[7] + 16 * result) = v13;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 2;
    if (!--v3)
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

unint64_t sub_100025AE8(uint64_t a1)
{
  return sub_100025B10(a1, &qword_100065908, &qword_100065678, (uint64_t (*)(void))&type metadata accessor for TaskDefinition);
}

unint64_t sub_100025B10(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v30 = a4;
  uint64_t v31 = a2;
  uint64_t v6 = sub_10000E508(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  char v9 = (void *)((char *)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    BOOL v11 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000E508(a3);
  uint64_t v10 = static _DictionaryStorage.allocate(capacity:)();
  BOOL v11 = (void *)v10;
  uint64_t v12 = *(void *)(a1 + 16);
  if (!v12)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v11;
  }
  long long v13 = (char *)v9 + *(int *)(v6 + 48);
  uint64_t v14 = v10 + 64;
  unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v29[1] = a1;
  uint64_t v16 = a1 + v15;
  uint64_t v17 = *(void *)(v7 + 72);
  swift_retain();
  while (1)
  {
    sub_10004A580(v16, (uint64_t)v9, v31);
    uint64_t v18 = *v9;
    uint64_t v19 = v9[1];
    unint64_t result = sub_100034E9C(*v9, v19);
    if (v21) {
      break;
    }
    unint64_t v22 = result;
    *(void *)(v14 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    id v23 = (uint64_t *)(v11[6] + 16 * result);
    *id v23 = v18;
    v23[1] = v19;
    uint64_t v24 = v11[7];
    uint64_t v25 = v30(0);
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v25 - 8) + 32))(v24 + *(void *)(*(void *)(v25 - 8) + 72) * v22, v13, v25);
    uint64_t v26 = v11[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27) {
      goto LABEL_11;
    }
    v11[2] = v28;
    v16 += v17;
    if (!--v12)
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

unint64_t sub_100025D10(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000E508(&qword_100065688);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_10004A580(v6, (uint64_t)&v15, &qword_100065928);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100034E9C(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    BOOL v11 = (uint64_t *)(v3[6] + 16 * result);
    *BOOL v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_100010414(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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

unint64_t sub_100025E48(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000E508(&qword_100065918);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_10004A580(v6, (uint64_t)v15, &qword_100065920);
    unint64_t result = sub_100034FA8((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_100010414(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
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

unint64_t sub_100025F8C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000E508(&qword_1000658F8);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_100034E9C(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    long long v10 = (uint64_t *)(v2[6] + 16 * result);
    *long long v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 3;
    v2[2] = v13;
    if (!--v3)
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

unint64_t sub_1000260A0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000E508(&qword_1000657E0);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_100034E9C(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
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

uint64_t sub_1000261BC()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100034B88(v0, qword_1000667D0);
  sub_100010174(v0, (uint64_t)qword_1000667D0);
  return Logger.init(subsystem:category:)();
}

void sub_100026234()
{
  qword_100065698 = (uint64_t)&off_100061BC0;
}

void sub_100026248()
{
  qword_1000656A0 = (uint64_t)&off_100061C00;
}

void sub_10002625C()
{
  qword_1000656A8 = (uint64_t)&off_100061C50;
}

void *sub_100026270()
{
  unint64_t result = (void *)sub_100025F8C((uint64_t)&off_100061C90);
  off_1000656B0 = result;
  return result;
}

unint64_t sub_100026298()
{
  sub_10000E508(&qword_100065910);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10004C9E0;
  *(void *)(inited + 32) = 0xD000000000000016;
  *(void *)(inited + 40) = 0x80000001000560D0;
  *(void *)(inited + 48) = &off_10005D650;
  unint64_t result = sub_1000258A4(inited, &qword_100065660);
  qword_1000656B8 = result;
  return result;
}

void *sub_100026310@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_10002631C(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_100026324@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_100026338@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_10002634C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_100026360(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_100026390@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_1000263BC@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_1000263E0(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_1000263F4(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_100026408(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_10002641C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_100026430(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_100026444(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_100026458(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_10002646C()
{
  return *v0 == 0;
}

uint64_t sub_10002647C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

void *sub_100026494(void *result)
{
  *v1 &= ~*result;
  return result;
}

uint64_t sub_1000264A8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_100039958(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_1000264E8()
{
  type metadata accessor for MLHostDaemon();
  swift_allocObject();
  uint64_t result = sub_100026528();
  qword_1000667E8 = result;
  return result;
}

uint64_t sub_100026528()
{
  uint64_t v1 = v0;
  uint64_t v83 = *v0;
  uint64_t v2 = type metadata accessor for MLHostConfig();
  uint64_t v85 = *(void *)(v2 - 8);
  uint64_t v86 = v2;
  __chkstk_darwin(v2);
  unint64_t v84 = (char *)v76 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v78 = *(void *)(v80 - 8);
  __chkstk_darwin(v80);
  uint64_t v79 = (char *)v76 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v77);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_10000E508(&qword_1000655C0);
  __chkstk_darwin(v6 - 8);
  id v8 = (char *)v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  BOOL v13 = (char *)v76 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v87 = (char *)v76 - v14;
  *((unsigned char *)v1 + 16) = os_variant_has_internal_diagnostics();
  id v15 = [self defaultManager];
  NSString v16 = String._bridgeToObjectiveC()();
  id v17 = [v15 containerURLForSecurityApplicationGroupIdentifier:v16];

  if (!v17)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
    goto LABEL_36;
  }
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v18 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v18(v8, v13, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
  uint64_t v81 = v10;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
LABEL_36:
    sub_100010578((uint64_t)v8, &qword_1000655C0);
    v89[0] = 0;
    v89[1] = 0xE000000000000000;
    _StringGuts.grow(_:)(42);
    swift_bridgeObjectRelease();
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  uint64_t v82 = v9;
  v18(v87, v8, v9);
  *(Swift::String *)(v1 + 3) = URL.path(percentEncoded:)(0);
  sub_100010330(0, &qword_1000652B8);
  static DispatchQoS.unspecified.getter();
  v89[0] = (uint64_t)_swiftEmptyArrayStorage;
  v76[1] = sub_100049750(&qword_1000652C0, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  v76[0] = sub_10000E508(&qword_1000652C8);
  v76[2] = sub_10004A524();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  uint64_t v19 = enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:);
  id v20 = v79;
  uint64_t v78 = *(void *)(v78 + 104);
  char v21 = v1;
  uint64_t v22 = v80;
  ((void (*)(char *, void, uint64_t))v78)(v79, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v80);
  v21[5] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  static DispatchQoS.background.getter();
  v89[0] = (uint64_t)_swiftEmptyArrayStorage;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  uint64_t v23 = v22;
  uint64_t v24 = v21;
  ((void (*)(char *, uint64_t, uint64_t))v78)(v20, v19, v23);
  v21[6] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  uint64_t v25 = v84;
  sub_100027510();
  (*(void (**)(uint64_t, char *, uint64_t))(v85 + 32))((uint64_t)v21 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_config, v25, v86);
  if (*((unsigned char *)v21 + 16) == 1)
  {
    swift_beginAccess();
    MLHostConfig.cloudEnvironment.setter();
    MLHostConfig.cloudContainer.setter();
    swift_endAccess();
  }
  swift_beginAccess();
  uint64_t v26 = MLHostConfig.apsEnvironment.getter();
  uint64_t v28 = v27;
  swift_endAccess();
  if (!v28) {
    goto LABEL_13;
  }
  if (v26 != 0x6D706F6C65766564 || v28 != 0xEB00000000746E65)
  {
    char v29 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v29) {
      goto LABEL_10;
    }
LABEL_13:
    sub_10000E508(&qword_100065910);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10004C9E0;
    *(void *)(inited + 32) = 0xD000000000000016;
    *(void *)(inited + 40) = 0x80000001000560D0;
    unsigned int v32 = &off_100061560;
    if (*((unsigned char *)v21 + 16)) {
      unsigned int v32 = &off_1000614A0;
    }
    v89[0] = (uint64_t)v32;
    uint64_t v33 = swift_bridgeObjectRetain();
    sub_10000C064(v33);
    *(void *)(inited + 48) = v89[0];
    unint64_t v30 = sub_1000258A4(inited, &qword_100065660);
    goto LABEL_16;
  }
  swift_bridgeObjectRelease();
LABEL_10:
  if (qword_100064F90 != -1) {
    swift_once();
  }
  unint64_t v30 = qword_1000656B8;
  swift_bridgeObjectRetain();
LABEL_16:
  if (qword_100064F70 != -1) {
    swift_once();
  }
  uint64_t v34 = qword_100065698;
  type metadata accessor for ExtensionKitRegistry();
  uint64_t v35 = (void *)swift_allocObject();
  v35[3] = _swiftEmptyArrayStorage;
  v35[5] = &_swiftEmptySetSingleton;
  sub_10000E508(&qword_1000652D8);
  uint64_t v36 = swift_allocObject();
  *(_DWORD *)(v36 + 16) = 0;
  v35[2] = v36;
  v35[4] = v34;
  *(void *)((char *)v24 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_extensionRegistry) = v35;
  uint64_t v37 = v24[3];
  int64_t v38 = (char *)v24[4];
  uint64_t v39 = qword_100064F78;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v39 != -1) {
    swift_once();
  }
  unint64_t v40 = (char *)qword_1000656A0;
  type metadata accessor for TaskRegistry();
  swift_allocObject();
  swift_bridgeObjectRetain();
  *(void *)((char *)v24 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry) = sub_100013BB0(v37, v38, v40);
  swift_beginAccess();
  unint64_t v41 = (void *)MLHostConfig.apsEnvironment.getter();
  uint64_t v43 = v42;
  swift_endAccess();
  type metadata accessor for NotificationRegistry();
  swift_allocObject();
  *(void *)((char *)v24 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_notificationRegistry) = sub_100007214(v30, v41, v43, 0);
  if (qword_100064F68 != -1) {
    swift_once();
  }
  uint64_t v44 = type metadata accessor for Logger();
  uint64_t v45 = sub_100010174(v44, (uint64_t)qword_1000667D0);
  swift_retain_n();
  os_log_type_t v46 = Logger.logObject.getter();
  os_log_type_t v47 = static os_log_type_t.info.getter();
  BOOL v48 = os_log_type_enabled(v46, v47);
  uint64_t v83 = v45;
  if (v48)
  {
    uint64_t v49 = (uint8_t *)swift_slowAlloc();
    uint64_t v80 = swift_slowAlloc();
    v89[0] = v80;
    *(_DWORD *)uint64_t v49 = 136315138;
    uint64_t v79 = (char *)(v49 + 4);
    uint64_t v50 = v84;
    uint64_t v51 = v85;
    uint64_t v52 = v86;
    (*(void (**)(char *, uint64_t, uint64_t))(v85 + 16))(v84, (uint64_t)v24 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_config, v86);
    sub_100049750(&qword_1000658E0, (void (*)(uint64_t))&type metadata accessor for MLHostConfig);
    uint64_t v53 = dispatch thunk of CustomStringConvertible.description.getter();
    unint64_t v55 = v54;
    (*(void (**)(char *, uint64_t))(v51 + 8))(v50, v52);
    uint64_t v88 = sub_10000E564(v53, v55, v89);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v46, v47, "MLHostDaemon config: %s", v49, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  swift_retain();
  uint64_t v56 = Logger.logObject.getter();
  os_log_type_t v57 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v56, v57))
  {
    uint64_t v58 = (uint8_t *)swift_slowAlloc();
    v89[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v58 = 136315138;
    uint64_t v59 = v24[3];
    unint64_t v60 = v24[4];
    swift_bridgeObjectRetain();
    uint64_t v88 = sub_10000E564(v59, v60, v89);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v56, v57, "MLHostDaemon baseFolder: %s", v58, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release();
  }
  swift_retain_n();
  uint64_t v61 = Logger.logObject.getter();
  os_log_type_t v62 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v61, v62))
  {
    id v63 = (uint8_t *)swift_slowAlloc();
    uint64_t v64 = swift_slowAlloc();
    *(_DWORD *)id v63 = 136315138;
    v89[0] = v64;
    swift_retain();
    uint64_t v65 = sub_10001476C();
    unint64_t v67 = v66;
    swift_release();
    uint64_t v88 = sub_10000E564(v65, v67, v89);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v61, v62, "MLHostDaemon taskRegistry: %s", v63, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  swift_retain_n();
  NSString v68 = Logger.logObject.getter();
  os_log_type_t v69 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v68, v69))
  {
    os_log_type_t v70 = (uint8_t *)swift_slowAlloc();
    uint64_t v71 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v70 = 136315138;
    v89[0] = v71;
    swift_retain();
    uint64_t v72 = sub_10000B380();
    unint64_t v74 = v73;
    swift_release();
    uint64_t v88 = sub_10000E564(v72, v74, v89);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v68, v69, "MLHostDaemon notificationRegistry: %s", v70, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_release_n();
  }

  (*(void (**)(char *, uint64_t))(v81 + 8))(v87, v82);
  return (uint64_t)v24;
}

void sub_100027510()
{
  id v0 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v1 = String._bridgeToObjectiveC()();
  id v12 = [v0 initWithSuiteName:v1];

  if (v12)
  {
    NSString v2 = String._bridgeToObjectiveC()();
    id v3 = [v12 stringForKey:v2];

    if (v3)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)();
    }
    NSString v4 = String._bridgeToObjectiveC()();
    id v5 = [v12 stringForKey:v4];

    if (v5)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)();
    }
    NSString v10 = String._bridgeToObjectiveC()();
    id v11 = [v12 stringForKey:v10];

    static String._unconditionallyBridgeFromObjectiveC(_:)();
    if (v11) {

    }
    MLHostConfig.init(cloudEnvironment:cloudContainer:apsEnvironment:)();
  }
  else
  {
    if (qword_100064F68 != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    sub_100010174(v6, (uint64_t)qword_1000667D0);
    uint64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 136315138;
      sub_10000E564(0xD000000000000010, 0x80000001000562E0, &v13);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Failed at reading UserDefaults(%s). Using default config.", v9, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    static String._unconditionallyBridgeFromObjectiveC(_:)();
    MLHostConfig.init(cloudEnvironment:cloudContainer:apsEnvironment:)();
  }
}

uint64_t sub_1000278F0()
{
  os_transaction_create();
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_extensionRegistry);
  sub_100010954();
  NSString v2 = (os_unfair_lock_s *)(*(void *)(v1 + 16) + 16);
  os_unfair_lock_lock(v2);
  uint64_t v3 = swift_bridgeObjectRetain();
  NSString v4 = sub_100037DF4(v3);
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v2);
  unint64_t v5 = sub_1000383C8((uint64_t)v4);
  swift_release();
  if (qword_100064F68 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100010174(v6, (uint64_t)qword_1000667D0);
  swift_bridgeObjectRetain_n();
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v10 = Set.description.getter();
    unint64_t v12 = v11;
    swift_bridgeObjectRelease();
    sub_10000E564(v10, v12, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Discovered extensions identifiers: %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_10001CE44(v5);
  swift_unknownObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100027B5C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_100027BA0(uint64_t a1, const char *a2)
{
  uint64_t v4 = type metadata accessor for MLHostTask();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100064F68 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_100010174(v8, (uint64_t)qword_1000667D0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    NSString v16 = a2;
    unint64_t v12 = (uint8_t *)v11;
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)unint64_t v12 = 136315138;
    uint64_t v13 = MLHostTask.bundleIdentifier.getter();
    uint64_t v17 = sub_10000E564(v13, v14, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, v16, v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_100027DF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for TaskStatus();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for MLHostTask();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  os_log_type_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = swift_projectBox();
  if (qword_100064F68 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  sub_100010174(v11, (uint64_t)qword_1000667D0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a2, v7);
  swift_errorRetain();
  swift_errorRetain();
  unint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v24 = v4;
    uint64_t v15 = v14;
    char v21 = (void *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    v28[0] = v22;
    *(_DWORD *)uint64_t v15 = 136315394;
    uint64_t v25 = v3;
    uint64_t v16 = MLHostTask.bundleIdentifier.getter();
    uint64_t v27 = sub_10000E564(v16, v17, v28);
    uint64_t v23 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    *(_WORD *)(v15 + 12) = 2112;
    swift_errorRetain();
    uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v27 = v18;
    uint64_t v6 = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v21 = v18;
    uint64_t v3 = v25;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Error for XPCConnection with %s: %@", (uint8_t *)v15, 0x16u);
    sub_10000E508(&qword_100065290);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v4 = v24;
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    swift_errorRelease();
    swift_errorRelease();
  }

  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for TaskStatus.taskFailed(_:), v3);
  uint64_t v19 = v26;
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 40))(v19, v6, v3);
}

void sub_1000281F4(uint64_t a1, void *a2)
{
}

uint64_t sub_1000281FC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v52 = a5;
  uint64_t v9 = type metadata accessor for MLHostTask();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  os_log_type_t v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v46 - v14;
  if (qword_100064F68 != -1) {
    swift_once();
  }
  uint64_t v56 = (void **)(a3 + 16);
  uint64_t v16 = type metadata accessor for Logger();
  uint64_t v17 = sub_100010174(v16, (uint64_t)qword_1000667D0);
  uint64_t v53 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v54 = v10 + 16;
  v53(v15, a2, v9);
  id v18 = a1;
  uint64_t v55 = v17;
  uint64_t v19 = Logger.logObject.getter();
  os_log_type_t v20 = static os_log_type_t.info.getter();
  BOOL v21 = os_log_type_enabled(v19, v20);
  uint64_t v51 = v10;
  if (v21)
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v48 = a4;
    uint64_t v23 = v22;
    os_log_type_t v46 = (void *)swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    v60[0] = v47;
    *(_DWORD *)uint64_t v23 = 136315394;
    uint64_t v50 = a2;
    uint64_t v24 = MLHostTask.name.getter();
    uint64_t v59 = sub_10000E564(v24, v25, v60);
    uint64_t v49 = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v26 = *(void ***)(v10 + 8);
    ((void (*)(char *, uint64_t))v26)(v15, v9);
    *(_WORD *)(v23 + 12) = 2112;
    uint64_t v59 = (uint64_t)v18;
    id v27 = v18;
    os_log_type_t v13 = v49;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v46 = v18;

    a2 = v50;
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Task %s completed shouldRun with result %@.", (uint8_t *)v23, 0x16u);
    sub_10000E508(&qword_100065290);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    a4 = v48;
    swift_slowDealloc();
  }
  else
  {
    uint64_t v26 = *(void ***)(v10 + 8);
    ((void (*)(char *, uint64_t))v26)(v15, v9);
  }
  uint64_t v28 = v56;
  swift_beginAccess();
  char v29 = *v28;
  uint8_t *v28 = v18;

  id v30 = v18;
  MLHostResult.status.getter();
  uint64_t v31 = MLHostResultStatus.rawValue.getter();
  BOOL v33 = 0;
  if (v31 == MLHostResultStatus.rawValue.getter())
  {
    MLHostResult.policy.getter();
    uint64_t v32 = MLHostResultPolicy.rawValue.getter();
    if (v32 == MLHostResultPolicy.rawValue.getter()) {
      BOOL v33 = 1;
    }
  }
  swift_beginAccess();
  *(unsigned char *)(a4 + 16) = v33;
  uint64_t result = MLHostResult.errorString.getter();
  if (v35)
  {
    uint64_t v36 = result;
    unint64_t v37 = v35;
    uint64_t v56 = v26;
    v53(v13, a2, v9);
    swift_bridgeObjectRetain_n();
    int64_t v38 = Logger.logObject.getter();
    os_log_type_t v39 = static os_log_type_t.debug.getter();
    int v40 = v39;
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v41 = swift_slowAlloc();
      uint64_t v55 = swift_slowAlloc();
      uint64_t v58 = v55;
      *(_DWORD *)uint64_t v41 = 136315394;
      LODWORD(v54) = v40;
      uint64_t v42 = MLHostTask.name.getter();
      uint64_t v57 = sub_10000E564(v42, v43, &v58);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      ((void (*)(char *, uint64_t))v56)(v13, v9);
      *(_WORD *)(v41 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v57 = sub_10000E564(v36, v37, &v58);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v38, (os_log_type_t)v54, "Task %s returned error in shouldRun: %s", (uint8_t *)v41, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      ((void (*)(char *, uint64_t))v56)(v13, v9);

      swift_bridgeObjectRelease_n();
    }
    uint64_t v44 = MLHostTask.name.getter();
    sub_100019120(v44, v45, v36, v37);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1000287F8(uint64_t a1, void *a2)
{
}

uint64_t sub_100028800(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v60 = a5;
  uint64_t v8 = type metadata accessor for TaskStatus();
  uint64_t v64 = *(void (**)(char *, uint64_t))(v8 - 8);
  uint64_t v65 = v8;
  __chkstk_darwin(v8);
  id v63 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for MLHostTask();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v51 - v15;
  uint64_t v62 = swift_projectBox();
  if (qword_100064F68 != -1) {
    swift_once();
  }
  uint64_t v61 = (void **)(a3 + 16);
  uint64_t v17 = type metadata accessor for Logger();
  uint64_t v18 = sub_100010174(v17, (uint64_t)qword_1000667D0);
  uint64_t v57 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v58 = v11 + 16;
  v57(v16, a2, v10);
  id v19 = a1;
  uint64_t v59 = v18;
  os_log_type_t v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.info.getter();
  BOOL v22 = os_log_type_enabled(v20, v21);
  uint64_t v55 = v11;
  if (v22)
  {
    uint64_t v23 = swift_slowAlloc();
    uint64_t v56 = a2;
    uint64_t v24 = v23;
    uint64_t v52 = (void *)swift_slowAlloc();
    uint64_t v53 = swift_slowAlloc();
    v69[0] = v53;
    *(_DWORD *)uint64_t v24 = 136315394;
    uint64_t v25 = MLHostTask.name.getter();
    uint64_t v68 = sub_10000E564(v25, v26, v69);
    uint64_t v54 = v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    id v27 = *(void (**)(char *, uint64_t))(v11 + 8);
    v27(v16, v10);
    *(_WORD *)(v24 + 12) = 2112;
    uint64_t v68 = (uint64_t)v19;
    id v28 = v19;
    uint64_t v14 = v54;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v52 = v19;

    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Task %s completed doWork with result %@.", (uint8_t *)v24, 0x16u);
    sub_10000E508(&qword_100065290);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    a2 = v56;
    swift_slowDealloc();
  }
  else
  {
    id v27 = *(void (**)(char *, uint64_t))(v11 + 8);
    v27(v16, v10);
  }
  uint64_t v29 = v65;
  id v30 = v61;
  swift_beginAccess();
  uint64_t v31 = *v30;
  char *v30 = v19;

  id v32 = v19;
  uint64_t v33 = MLHostResult.status.getter();
  uint64_t v34 = v63;
  if (v33 == 2)
  {
    uint64_t v36 = enum case for TaskStatus.taskCompleted(_:);
    unint64_t v35 = (void (**)(char *, void, uint64_t))v64;
  }
  else
  {
    unint64_t v35 = (void (**)(char *, void, uint64_t))v64;
    uint64_t v36 = enum case for TaskStatus.taskFailed(_:);
  }
  v35[13](v63, v36, v29);
  uint64_t v37 = v62;
  swift_beginAccess();
  ((void (**)(char *, char *, uint64_t))v35)[5]((char *)v37, v34, v29);
  uint64_t result = MLHostResult.errorString.getter();
  if (v39)
  {
    uint64_t v40 = result;
    unint64_t v41 = v39;
    v57(v14, a2, v10);
    swift_bridgeObjectRetain_n();
    uint64_t v42 = Logger.logObject.getter();
    os_log_type_t v43 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = swift_slowAlloc();
      uint64_t v56 = a2;
      uint64_t v45 = v44;
      uint64_t v46 = swift_slowAlloc();
      uint64_t v64 = v27;
      uint64_t v65 = v46;
      uint64_t v67 = v46;
      *(_DWORD *)uint64_t v45 = 136315394;
      uint64_t v47 = MLHostTask.name.getter();
      uint64_t v66 = sub_10000E564(v47, v48, &v67);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v64(v14, v10);
      *(_WORD *)(v45 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v66 = sub_10000E564(v40, v41, &v67);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "Task %s returned error: %s", (uint8_t *)v45, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      v27(v14, v10);

      swift_bridgeObjectRelease_n();
    }
    uint64_t v49 = MLHostTask.name.getter();
    sub_100019120(v49, v50, v40, v41);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100028EA8(uint64_t a1, char a2)
{
  uint64_t v4 = type metadata accessor for MLHostTask();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v46 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = v7;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v40 - v8;
  if (a2)
  {
    aBos_unfair_lock_t lock = MLHostTask.name.getter();
    uint64_t v51 = v10;
    v11._uint64_t countAndFlagsBits = 0x6E616D65646E6F2ELL;
    v11._object = (void *)0xE900000000000064;
    String.append(_:)(v11);
    unint64_t v12 = v51;
    uint64_t v48 = aBlock;
  }
  else
  {
    uint64_t v48 = MLHostTask.name.getter();
    unint64_t v12 = v13;
  }
  if (qword_100064F68 != -1) {
    swift_once();
  }
  uint64_t v14 = type metadata accessor for Logger();
  uint64_t v15 = sub_100010174(v14, (uint64_t)qword_1000667D0);
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v45 = a1;
  uint64_t v42 = v16;
  v16(v9, a1, v4);
  swift_bridgeObjectRetain_n();
  uint64_t v44 = v15;
  uint64_t v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v41 = swift_slowAlloc();
    aBos_unfair_lock_t lock = v41;
    *(_DWORD *)uint64_t v19 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v49 = sub_10000E564(v48, v12, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v19 + 12) = 2080;
    os_log_t v40 = v17;
    uint64_t v20 = MLHostTask.bundleIdentifier.getter();
    uint64_t v49 = sub_10000E564(v20, v21, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
    os_log_t v22 = v40;
    _os_log_impl((void *)&_mh_execute_header, v40, v18, "Registering task %s with bundleIdentifier %s.", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
  }
  id v23 = [self sharedScheduler];
  uint64_t v24 = v48;
  NSString v25 = String._bridgeToObjectiveC()();
  id v27 = v46;
  uint64_t v26 = v47;
  uint64_t v41 = *(void *)(v47 + 48);
  v42(v46, v45, v4);
  unint64_t v28 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v29 = (v43 + v28 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v30 = swift_allocObject();
  uint64_t v31 = v4;
  uint64_t v32 = v30;
  *(void *)(v30 + 16) = v26;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v30 + v28, v27, v31);
  uint64_t v33 = (uint64_t *)(v32 + v29);
  *uint64_t v33 = v24;
  v33[1] = v12;
  uint64_t v54 = sub_1000498E8;
  uint64_t v55 = v32;
  aBos_unfair_lock_t lock = (uint64_t)_NSConcreteStackBlock;
  uint64_t v51 = 1107296256;
  uint64_t v52 = sub_1000287F8;
  uint64_t v53 = &unk_100062098;
  uint64_t v34 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  unsigned int v35 = [v23 registerForTaskWithIdentifier:v25 usingQueue:v41 launchHandler:v34];
  _Block_release(v34);

  swift_bridgeObjectRetain_n();
  uint64_t v36 = Logger.logObject.getter();
  os_log_type_t v37 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v38 = swift_slowAlloc();
    aBos_unfair_lock_t lock = swift_slowAlloc();
    *(_DWORD *)uint64_t v38 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v49 = sub_10000E564(v48, v12, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v38 + 12) = 1024;
    LODWORD(v49) = v35;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v36, v37, "Task %s registration info: %{BOOL}d", (uint8_t *)v38, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return v48;
}

id sub_1000294A4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v54 = a4;
  uint64_t v55 = a5;
  id v61 = a1;
  uint64_t v7 = sub_10000E508(&qword_1000657F8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for TaskStatus();
  uint64_t v57 = *(void *)(v10 - 8);
  uint64_t v58 = v10;
  __chkstk_darwin(v10);
  uint64_t v56 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = type metadata accessor for MLHostTask();
  uint64_t v12 = *(void *)(v60 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v14 = __chkstk_darwin(v60);
  uint64_t v15 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v53 - v16;
  uint64_t v59 = a2;
  uint64_t v18 = *(void *)(a2 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_extensionRegistry);
  uint64_t v19 = a3;
  uint64_t v20 = MLHostTask.bundleIdentifier.getter();
  uint64_t v22 = v21;
  id v23 = (os_unfair_lock_s *)(*(void *)(v18 + 16) + 16);
  os_unfair_lock_lock(v23);
  uint64_t v24 = *(void *)(v18 + 40);
  swift_bridgeObjectRetain();
  LOBYTE(v20) = sub_1000139FC(v20, v22, v24);
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v23);
  swift_bridgeObjectRelease();
  if (v20)
  {
    uint64_t v25 = swift_allocObject();
    *(unsigned char *)(v25 + 16) = 0;
    aBlock[4] = (uint64_t)sub_10004999C;
    aBlock[5] = v25;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100027B5C;
    aBlock[3] = (uint64_t)&unk_1000620E8;
    uint64_t v26 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    uint64_t v53 = v9;
    [v61 setExpirationHandler:v26];
    _Block_release(v26);
    uint64_t v27 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v9, 1, 1, v27);
    uint64_t v28 = v60;
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v19, v60);
    unint64_t v29 = (*(unsigned __int8 *)(v12 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
    unint64_t v30 = (v13 + v29 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v31 = (v30 + 15) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v32 = (char *)swift_allocObject();
    *((void *)v32 + 2) = 0;
    *((void *)v32 + 3) = 0;
    *((void *)v32 + 4) = v59;
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v32[v29], v15, v28);
    *(void *)&v32[v30] = v25;
    id v33 = v61;
    *(void *)&v32[v31] = v61;
    uint64_t v34 = &v32[(v31 + 15) & 0xFFFFFFFFFFFFFFF8];
    uint64_t v35 = v55;
    *(void *)uint64_t v34 = v54;
    *((void *)v34 + 1) = v35;
    swift_retain();
    swift_retain();
    id v36 = v33;
    swift_bridgeObjectRetain();
    sub_10002AD58((uint64_t)v53, (uint64_t)&unk_100065808, (uint64_t)v32);
    swift_release();
    return (id)swift_release();
  }
  else
  {
    uint64_t v38 = v60;
    if (qword_100064F68 != -1) {
      swift_once();
    }
    uint64_t v39 = type metadata accessor for Logger();
    sub_100010174(v39, (uint64_t)qword_1000667D0);
    uint64_t v40 = v12;
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v17, v19, v38);
    uint64_t v41 = Logger.logObject.getter();
    os_log_type_t v42 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v43 = 136315138;
      uint64_t v44 = MLHostTask.bundleIdentifier.getter();
      aBlock[6] = sub_10000E564(v44, v45, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v40 + 8))(v17, v60);
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "Invalid extension name: %s", v43, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v38);
    }

    id v46 = v61;
    uint64_t v47 = MLHostTask.name.getter();
    uint64_t v49 = v48;
    uint64_t v51 = (uint64_t)v56;
    uint64_t v50 = v57;
    uint64_t v52 = v58;
    (*(void (**)(char *, void, uint64_t))(v57 + 104))(v56, enum case for TaskStatus.taskFailed(_:), v58);
    sub_100018D90(v47, v49, v51);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v51, v52);
    return [v46 setTaskCompleted];
  }
}

uint64_t sub_100029AEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[15] = a8;
  v8[16] = v14;
  v8[13] = a6;
  v8[14] = a7;
  v8[11] = a4;
  v8[12] = a5;
  uint64_t v9 = type metadata accessor for TaskRequest();
  v8[17] = v9;
  v8[18] = *(void *)(v9 - 8);
  v8[19] = swift_task_alloc();
  v8[20] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for TaskDefinition();
  v8[21] = v10;
  v8[22] = *(void *)(v10 - 8);
  v8[23] = swift_task_alloc();
  v8[24] = swift_task_alloc();
  uint64_t v11 = type metadata accessor for MLHostTask();
  v8[25] = v11;
  v8[26] = *(void *)(v11 - 8);
  v8[27] = swift_task_alloc();
  v8[28] = swift_task_alloc();
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_100029CD0, 0, 0);
}

uint64_t sub_100029CD0()
{
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[29] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100029DA0;
  uint64_t v3 = v0[12];
  uint64_t v2 = v0[13];
  uint64_t v4 = v0[11];
  return sub_10003A1D0(v3, v4, v2);
}

uint64_t sub_100029DA0(uint64_t a1)
{
  *(void *)(*(void *)v1 + 240) = a1;
  swift_task_dealloc();
  swift_release();
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_100029EEC, 0, 0);
}

uint64_t sub_100029EEC()
{
  uint64_t v102 = v0;
  uint64_t v1 = *(void **)(v0 + 240);
  if (v1)
  {
    uint64_t v2 = v0 + 72;
    id v3 = v1;
    MLHostResult.status.getter();
    uint64_t v4 = MLHostResultStatus.rawValue.getter();
    if (v4 != MLHostResultStatus.rawValue.getter()
      || (MLHostResult.policy.getter(),
          uint64_t v5 = MLHostResultPolicy.rawValue.getter(),
          v5 != MLHostResultPolicy.rawValue.getter()))
    {
      uint64_t v19 = *(void *)(v0 + 192);
      uint64_t v20 = *(void *)(v0 + 168);
      uint64_t v21 = *(void *)(v0 + 176);
      uint64_t v22 = *(void *)(v0 + 160);
      uint64_t v23 = *(void *)(v0 + 136);
      uint64_t v24 = *(void *)(v0 + 144);
      MLHostTask.taskDefinition.getter();
      TaskDefinition.taskRequest.getter();
      uint64_t v100 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
      v100(v19, v20);
      uint64_t v25 = TaskRequest.dependencies.getter();
      unint64_t v98 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
      v98(v22, v23);
      if (v25)
      {
        v101[0] = (uint64_t)_swiftEmptyArrayStorage;
        uint64_t v26 = *(void *)(v25 + 16);
        if (v26)
        {
          swift_bridgeObjectRetain();
          uint64_t v27 = v25 + 40;
          do
          {
            id v28 = objc_allocWithZone((Class)BGSystemTaskResult);
            swift_bridgeObjectRetain();
            NSString v29 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease();
            id v30 = [v28 initWithIdentifier:v29 consumptionCount:1];

            if (v30)
            {
              specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
              if (*(void *)((v101[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v101[0] & 0xFFFFFFFFFFFFFF8)
                                                                                    + 0x18) >> 1)
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
              specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
              specialized Array._endMutation()();
            }
            v27 += 16;
            --v26;
          }
          while (v26);
          swift_bridgeObjectRelease();
          uint64_t v44 = (void *)v101[0];
        }
        else
        {
          uint64_t v44 = _swiftEmptyArrayStorage;
        }
        unint64_t v45 = *(void **)(v0 + 112);
        swift_bridgeObjectRelease();
        sub_100039804((unint64_t)v44);
        swift_bridgeObjectRelease();
        sub_100010330(0, &qword_100065828);
        sub_100049E0C();
        Class isa = Set._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        *(void *)(v0 + 48) = 0;
        LOBYTE(v45) = [v45 consumedResults:isa error:v0 + 48];

        uint64_t v47 = *(void **)(v0 + 48);
        if (v45)
        {
          id v48 = v47;
        }
        else
        {
          id v49 = v47;
          _convertNSErrorToError(_:)();

          swift_willThrow();
          if (qword_100064F68 != -1) {
            swift_once();
          }
          uint64_t v50 = type metadata accessor for Logger();
          sub_100010174(v50, (uint64_t)qword_1000667D0);
          swift_bridgeObjectRetain();
          swift_errorRetain();
          swift_bridgeObjectRetain();
          swift_errorRetain();
          uint64_t v51 = Logger.logObject.getter();
          os_log_type_t v52 = static os_log_type_t.error.getter();
          BOOL v53 = os_log_type_enabled(v51, v52);
          unint64_t v54 = *(void *)(v0 + 128);
          if (v53)
          {
            uint64_t v94 = *(void *)(v0 + 120);
            uint64_t v55 = swift_slowAlloc();
            unint64_t v95 = (void *)swift_slowAlloc();
            v101[0] = swift_slowAlloc();
            *(_DWORD *)uint64_t v55 = 136315394;
            swift_bridgeObjectRetain();
            *(void *)(v0 + 56) = sub_10000E564(v94, v54, v101);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v55 + 12) = 2112;
            swift_errorRetain();
            uint64_t v56 = _swift_stdlib_bridgeErrorToNSError();
            *(void *)(v0 + 64) = v56;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            void *v95 = v56;
            swift_errorRelease();
            swift_errorRelease();
            _os_log_impl((void *)&_mh_execute_header, v51, v52, "Failed at consuming results for task: %s. Error: %@", (uint8_t *)v55, 0x16u);
            sub_10000E508(&qword_100065290);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            swift_errorRelease();
          }
          else
          {
            swift_errorRelease();
            swift_bridgeObjectRelease_n();
            swift_errorRelease();
            swift_errorRelease();
          }
        }
      }
      uint64_t v66 = *(void *)(v0 + 184);
      uint64_t v67 = *(void *)(v0 + 168);
      uint64_t v68 = *(void *)(v0 + 152);
      uint64_t v69 = *(void *)(v0 + 136);
      MLHostTask.taskDefinition.getter();
      TaskDefinition.taskRequest.getter();
      v100(v66, v67);
      uint64_t v70 = TaskRequest.producedResultIdentifiers.getter();
      v98(v68, v69);
      if (v70)
      {
        v101[0] = (uint64_t)_swiftEmptyArrayStorage;
        uint64_t v71 = *(void *)(v70 + 16);
        if (v71)
        {
          swift_bridgeObjectRetain();
          uint64_t v72 = v70 + 40;
          do
          {
            id v73 = objc_allocWithZone((Class)BGSystemTaskResult);
            swift_bridgeObjectRetain();
            NSString v74 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease();
            id v75 = [v73 initWithIdentifier:v74 cumulativeProductionCount:1];

            if (v75)
            {
              specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
              if (*(void *)((v101[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v101[0] & 0xFFFFFFFFFFFFFF8)
                                                                                    + 0x18) >> 1)
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
              specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
              specialized Array._endMutation()();
            }
            v72 += 16;
            --v71;
          }
          while (v71);
          swift_bridgeObjectRelease();
          id v76 = (void *)v101[0];
        }
        else
        {
          id v76 = _swiftEmptyArrayStorage;
        }
        uint64_t v77 = *(void **)(v0 + 112);
        swift_bridgeObjectRelease();
        sub_100039804((unint64_t)v76);
        swift_bridgeObjectRelease();
        sub_100010330(0, &qword_100065828);
        sub_100049E0C();
        Class v78 = Set._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        *(void *)(v0 + 24) = 0;
        unsigned __int8 v79 = [v77 producedCumulativeResults:v78 error:v0 + 24];

        uint64_t v80 = *(void **)(v0 + 24);
        if (v79)
        {
          id v81 = v80;
        }
        else
        {
          id v82 = v80;
          _convertNSErrorToError(_:)();

          swift_willThrow();
          if (qword_100064F68 != -1) {
            swift_once();
          }
          uint64_t v83 = type metadata accessor for Logger();
          sub_100010174(v83, (uint64_t)qword_1000667D0);
          swift_bridgeObjectRetain();
          swift_errorRetain();
          swift_bridgeObjectRetain();
          swift_errorRetain();
          unint64_t v84 = Logger.logObject.getter();
          os_log_type_t v85 = static os_log_type_t.error.getter();
          BOOL v86 = os_log_type_enabled(v84, v85);
          unint64_t v87 = *(void *)(v0 + 128);
          if (v86)
          {
            uint64_t v88 = *(void *)(v0 + 120);
            uint64_t v89 = swift_slowAlloc();
            id v96 = v3;
            os_log_type_t v90 = (void *)swift_slowAlloc();
            v101[0] = swift_slowAlloc();
            *(_DWORD *)uint64_t v89 = 136315394;
            swift_bridgeObjectRetain();
            *(void *)(v0 + 32) = sub_10000E564(v88, v87, v101);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v89 + 12) = 2112;
            swift_errorRetain();
            uint64_t v91 = _swift_stdlib_bridgeErrorToNSError();
            *(void *)(v0 + 40) = v91;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            *os_log_type_t v90 = v91;
            swift_errorRelease();
            swift_errorRelease();
            _os_log_impl((void *)&_mh_execute_header, v84, v85, "Failed at generating results for task: %s. Error: %@", (uint8_t *)v89, 0x16u);
            sub_10000E508(&qword_100065290);
            swift_arrayDestroy();
            id v3 = v96;
            swift_slowDealloc();
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            swift_errorRelease();
          }
          else
          {
            swift_errorRelease();
            swift_bridgeObjectRelease_n();
            swift_errorRelease();
            swift_errorRelease();
          }
        }
      }
      [*(id *)(v0 + 112) setTaskCompleted:v94];
      goto LABEL_55;
    }
    if (qword_100064F68 != -1) {
      swift_once();
    }
    uint64_t v7 = *(void *)(v0 + 208);
    uint64_t v6 = *(void *)(v0 + 216);
    uint64_t v8 = *(void *)(v0 + 200);
    uint64_t v9 = *(void *)(v0 + 96);
    uint64_t v10 = type metadata accessor for Logger();
    sub_100010174(v10, (uint64_t)qword_1000667D0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v9, v8);
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.info.getter();
    BOOL v13 = os_log_type_enabled(v11, v12);
    uint64_t v14 = *(void *)(v0 + 208);
    uint64_t v15 = *(void *)(v0 + 216);
    if (v13)
    {
      uint64_t v97 = *(void *)(v0 + 200);
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      v101[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 136315138;
      uint64_t v17 = MLHostTask.name.getter();
      *(void *)(v0 + 80) = sub_10000E564(v17, v18, v101);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v15, v97);
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Task %s has reschedule policy, passing retry to DAS.", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v2 = v0 + 72;
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(void, void))(v14 + 8))(*(void *)(v0 + 216), *(void *)(v0 + 200));
    }

    uint64_t v57 = *(void **)(v0 + 112);
    *(void *)(v0 + 72) = 0;
    unsigned int v58 = [v57 setTaskExpiredWithRetryAfter:v2 error:300.0];
    uint64_t v59 = *(void **)(v0 + 72);
    if (v58)
    {
      id v60 = v59;
LABEL_55:

      goto LABEL_56;
    }
    id v61 = v59;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v62 = Logger.logObject.getter();
    os_log_type_t v63 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v62, v63))
    {
      uint64_t v64 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v64 = 0;
      _os_log_impl((void *)&_mh_execute_header, v62, v63, "Task setTaskExpiredWithRetryAfter failed. Fallback to default strategy.", v64, 2u);
      swift_slowDealloc();
    }
    uint64_t v65 = *(void **)(v0 + 112);

    [v65 setTaskCompleted];
    swift_errorRelease();
  }
  else
  {
    if (qword_100064F68 != -1) {
      swift_once();
    }
    uint64_t v31 = *(void *)(v0 + 224);
    uint64_t v32 = *(void *)(v0 + 200);
    uint64_t v33 = *(void *)(v0 + 208);
    uint64_t v34 = *(void *)(v0 + 96);
    uint64_t v35 = type metadata accessor for Logger();
    sub_100010174(v35, (uint64_t)qword_1000667D0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 16))(v31, v34, v32);
    id v36 = Logger.logObject.getter();
    os_log_type_t v37 = static os_log_type_t.debug.getter();
    BOOL v38 = os_log_type_enabled(v36, v37);
    uint64_t v39 = *(void *)(v0 + 224);
    uint64_t v40 = *(void *)(v0 + 208);
    if (v38)
    {
      uint64_t v99 = *(void *)(v0 + 200);
      uint64_t v41 = (uint8_t *)swift_slowAlloc();
      v101[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v41 = 136315138;
      uint64_t v42 = MLHostTask.name.getter();
      *(void *)(v0 + 16) = sub_10000E564(v42, v43, v101);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v39, v99);
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "Task %s returned nil, marking DAS task as completed.", v41, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(void, void))(v40 + 8))(*(void *)(v0 + 224), *(void *)(v0 + 200));
    }

    [*(id *)(v0 + 112) setTaskCompleted];
  }
LABEL_56:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v92 = *(uint64_t (**)(void))(v0 + 8);
  return v92();
}

uint64_t sub_10002AD58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100010578(a1, &qword_1000657F8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_10002AF04(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_10002AF70()
{
  uint64_t v1 = sub_10000E508(&qword_1000655E8);
  __chkstk_darwin(v1 - 8);
  id v3 = (char *)&v44 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for MLHostTask();
  uint64_t v50 = *(void *)(v4 - 8);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v44 - v8;
  uint64_t v44 = os_transaction_create();
  uint64_t v57 = v0;
  uint64_t v10 = *(void *)(v0 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
  uint64_t v11 = (os_unfair_lock_s *)(*(void *)(v10 + 56) + 16);
  os_unfair_lock_lock(v11);
  uint64_t v60 = v10 + 64;
  swift_beginAccess();
  uint64_t v12 = swift_bridgeObjectRetain();
  BOOL v13 = sub_100037EE0(v12);
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v11);
  unint64_t v45 = v13;
  uint64_t v15 = v13[2];
  if (v15)
  {
    uint64_t v59 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v50 + 56);
    uint64_t v55 = (void (**)(char *, char *, uint64_t))(v50 + 16);
    unsigned int v58 = (unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48);
    os_log_type_t v52 = (void (**)(char *, char *, uint64_t))(v50 + 32);
    uint64_t v53 = OBJC_IVAR____TtC7mlhostd12MLHostDaemon_extensionRegistry;
    uint64_t v51 = (void (**)(char *, uint64_t))(v50 + 8);
    uint64_t v16 = v45 + 5;
    *(void *)&long long v14 = 136315138;
    long long v49 = v14;
    id v48 = (char *)&type metadata for Any + 8;
    *(void *)&long long v14 = 136315394;
    long long v46 = v14;
    uint64_t v56 = v3;
    uint64_t v54 = v10;
    do
    {
      uint64_t v62 = v15;
      uint64_t v17 = *(v16 - 1);
      unint64_t v18 = *v16;
      uint64_t v19 = (os_unfair_lock_s *)(*(void *)(v10 + 56) + 16);
      swift_bridgeObjectRetain();
      os_unfair_lock_lock(v19);
      swift_beginAccess();
      uint64_t v20 = *(void *)(v10 + 64);
      uint64_t v21 = *(void *)(v20 + 16);
      uint64_t v61 = v17;
      if (v21)
      {
        swift_bridgeObjectRetain();
        unint64_t v22 = sub_100034E9C(v17, v18);
        if (v23)
        {
          uint64_t v24 = v50;
          (*(void (**)(char *, unint64_t, uint64_t))(v50 + 16))(v3, *(void *)(v20 + 56) + *(void *)(v50 + 72) * v22, v4);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v3, 0, 1, v4);
        }
        else
        {
          (*v59)(v3, 1, 1, v4);
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        (*v59)(v3, 1, 1, v4);
      }
      swift_endAccess();
      os_unfair_lock_unlock(v19);
      if ((*v58)(v3, 1, v4) == 1)
      {
        sub_100010578((uint64_t)v3, &qword_1000655E8);
        if (qword_100064F68 != -1) {
          swift_once();
        }
        uint64_t v25 = type metadata accessor for Logger();
        sub_100010174(v25, (uint64_t)qword_1000667D0);
        swift_bridgeObjectRetain();
        uint64_t v26 = Logger.logObject.getter();
        os_log_type_t v27 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v26, v27))
        {
          uint64_t v28 = swift_slowAlloc();
          v63[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v28 = v49;
          swift_bridgeObjectRetain();
          *(void *)(v28 + 4) = sub_10000E564(v61, v18, v63);
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v26, v27, "Skipping %s because is not available in TaskRegistry", (uint8_t *)v28, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          id v3 = v56;
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
      }
      else
      {
        (*v52)(v9, v3, v4);
        uint64_t v29 = *(void *)(v57 + v53);
        uint64_t v30 = MLHostTask.bundleIdentifier.getter();
        uint64_t v32 = v31;
        uint64_t v33 = (os_unfair_lock_s *)(*(void *)(v29 + 16) + 16);
        os_unfair_lock_lock(v33);
        uint64_t v34 = *(void *)(v29 + 40);
        swift_bridgeObjectRetain();
        LOBYTE(v30) = sub_1000139FC(v30, v32, v34);
        swift_bridgeObjectRelease();
        os_unfair_lock_unlock(v33);
        swift_bridgeObjectRelease();
        if (v30)
        {
          swift_bridgeObjectRelease();
          sub_100028EA8((uint64_t)v9, 0);
          swift_bridgeObjectRelease();
          (*v51)(v9, v4);
          id v3 = v56;
        }
        else
        {
          if (qword_100064F68 != -1) {
            swift_once();
          }
          uint64_t v35 = type metadata accessor for Logger();
          sub_100010174(v35, (uint64_t)qword_1000667D0);
          (*v55)(v7, v9, v4);
          swift_bridgeObjectRetain();
          id v36 = Logger.logObject.getter();
          os_log_type_t v37 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v36, v37))
          {
            uint64_t v38 = swift_slowAlloc();
            uint64_t v47 = swift_slowAlloc();
            v63[0] = v47;
            *(_DWORD *)uint64_t v38 = v46;
            swift_bridgeObjectRetain();
            *(void *)(v38 + 4) = sub_10000E564(v61, v18, v63);
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v38 + 12) = 2080;
            uint64_t v39 = MLHostTask.bundleIdentifier.getter();
            *(void *)(v38 + 14) = sub_10000E564(v39, v40, v63);
            swift_bridgeObjectRelease();
            uint64_t v41 = *v51;
            (*v51)(v7, v4);
            _os_log_impl((void *)&_mh_execute_header, v36, v37, "Skipping %s because invalid extension: %s", (uint8_t *)v38, 0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            v41(v9, v4);
          }
          else
          {

            uint64_t v42 = *v51;
            (*v51)(v7, v4);
            swift_bridgeObjectRelease_n();
            v42(v9, v4);
          }
          id v3 = v56;
        }
        uint64_t v10 = v54;
      }
      v16 += 2;
      uint64_t v15 = v62 - 1;
    }
    while (v62 != 1);
  }
  swift_unknownObjectRelease();
  return swift_release();
}

uint64_t sub_10002B70C()
{
  uint64_t v1 = sub_10000E508(&qword_1000655E8);
  __chkstk_darwin(v1 - 8);
  id v3 = (char *)v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for MLHostTask();
  uint64_t v35 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28[1] = os_transaction_create();
  uint64_t v7 = *(void *)(v0 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
  uint64_t v8 = (os_unfair_lock_s *)(*(void *)(v7 + 56) + 16);
  os_unfair_lock_lock(v8);
  uint64_t v40 = v7 + 64;
  swift_beginAccess();
  uint64_t v9 = swift_bridgeObjectRetain();
  uint64_t v10 = sub_100037EE0(v9);
  uint64_t v11 = v7;
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v8);
  uint64_t v29 = v10;
  uint64_t v13 = v10[2];
  if (v13)
  {
    uint64_t v34 = v35 + 16;
    uint64_t v38 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v35 + 56);
    uint64_t v39 = (unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48);
    id v36 = (void (**)(char *, uint64_t))(v35 + 8);
    os_log_type_t v37 = (void (**)(char *, char *, uint64_t))(v35 + 32);
    long long v14 = v29 + 5;
    *(void *)&long long v12 = 136315138;
    long long v31 = v12;
    uint64_t v30 = (char *)&type metadata for Any + 8;
    uint64_t v32 = v11;
    uint64_t v33 = v6;
    do
    {
      uint64_t v16 = *(v14 - 1);
      unint64_t v15 = *v14;
      uint64_t v17 = (os_unfair_lock_s *)(*(void *)(v11 + 56) + 16);
      swift_bridgeObjectRetain();
      os_unfair_lock_lock(v17);
      swift_beginAccess();
      uint64_t v18 = *(void *)(v11 + 64);
      if (*(void *)(v18 + 16))
      {
        swift_bridgeObjectRetain();
        unint64_t v19 = sub_100034E9C(v16, v15);
        if (v20)
        {
          uint64_t v21 = *(void *)(v18 + 56);
          uint64_t v22 = v35;
          (*(void (**)(char *, unint64_t, uint64_t))(v35 + 16))(v3, v21 + *(void *)(v35 + 72) * v19, v4);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v3, 0, 1, v4);
        }
        else
        {
          (*v38)(v3, 1, 1, v4);
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        (*v38)(v3, 1, 1, v4);
      }
      swift_endAccess();
      os_unfair_lock_unlock(v17);
      if ((*v39)(v3, 1, v4) == 1)
      {
        sub_100010578((uint64_t)v3, &qword_1000655E8);
        if (qword_100064F68 != -1) {
          swift_once();
        }
        uint64_t v23 = type metadata accessor for Logger();
        sub_100010174(v23, (uint64_t)qword_1000667D0);
        swift_bridgeObjectRetain();
        uint64_t v24 = Logger.logObject.getter();
        os_log_type_t v25 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v24, v25))
        {
          uint64_t v26 = swift_slowAlloc();
          v41[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v26 = v31;
          swift_bridgeObjectRetain();
          *(void *)(v26 + 4) = sub_10000E564(v16, v15, v41);
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v24, v25, "Skipping %s because is not available in TaskRegistry", (uint8_t *)v26, 0xCu);
          swift_arrayDestroy();
          uint64_t v6 = v33;
          swift_slowDealloc();
          uint64_t v11 = v32;
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        (*v37)(v6, v3, v4);
        sub_100038460(v6);
        (*v36)(v6, v4);
      }
      v14 += 2;
      --v13;
    }
    while (v13);
  }
  swift_unknownObjectRelease();
  return swift_release();
}

uint64_t sub_10002BBB4()
{
  os_transaction_create();
  uint64_t v1 = (os_unfair_lock_s *)(*(void *)(*(void *)(v0 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry) + 56)
                          + 16);
  os_unfair_lock_lock(v1);
  swift_beginAccess();
  uint64_t v2 = swift_bridgeObjectRetain();
  id v3 = sub_100037EE0(v2);
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v1);
  uint64_t v4 = v3[2];
  if (v4)
  {
    uint64_t v5 = v3 + 5;
    do
    {
      uint64_t v6 = *(v5 - 1);
      unint64_t v7 = *v5;
      swift_bridgeObjectRetain();
      sub_1000491FC(v6, v7);
      swift_bridgeObjectRelease();
      v5 += 2;
      --v4;
    }
    while (v4);
  }
  swift_unknownObjectRelease();
  return swift_release();
}

void sub_10002BC94(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = v2;
  uint64_t v7 = sub_10000E508(&qword_1000655E8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for MLHostTask();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  validateTaskDefinition(_:)();
  if (!v3)
  {
    uint64_t v53 = v10;
    uint64_t v55 = a2;
    uint64_t v56 = v11;
    uint64_t v14 = *(void *)&v4[OBJC_IVAR____TtC7mlhostd12MLHostDaemon_extensionRegistry];
    uint64_t v15 = TaskDefinition.bundleIdentifier.getter();
    uint64_t v16 = v4;
    uint64_t v18 = v17;
    unint64_t v19 = (os_unfair_lock_s *)(*(void *)(v14 + 16) + 16);
    os_unfair_lock_lock(v19);
    uint64_t v20 = *(void *)(v14 + 40);
    swift_bridgeObjectRetain();
    LOBYTE(v15) = sub_1000139FC(v15, v18, v20);
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v19);
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
    {
      uint64_t v31 = type metadata accessor for TaskValidationError();
      sub_100049750(&qword_100065610, (void (*)(uint64_t))&type metadata accessor for TaskValidationError);
      swift_allocError();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v31 - 8) + 104))(v32, enum case for TaskValidationError.invalidBundleIdentifier(_:), v31);
      swift_willThrow();
      return;
    }
    uint64_t v21 = TaskDefinition.name.getter();
    os_log_type_t v52 = v16;
    uint64_t v22 = *(uint8_t **)&v16[OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry];
    uint64_t v23 = __chkstk_darwin(v21);
    *(&v48 - 4) = v22;
    *(&v48 - 3) = (uint8_t *)v23;
    uint64_t v51 = v23;
    unint64_t v54 = v24;
    *(&v48 - 2) = (uint8_t *)v24;
    __chkstk_darwin(v23);
    *(&v48 - 2) = (uint8_t *)sub_100049798;
    *(&v48 - 1) = v25;
    os_log_type_t v27 = v26 + 4;
    os_unfair_lock_lock(v26 + 4);
    sub_1000497B8(&v58);
    os_unfair_lock_unlock(v27);
    int v28 = v58;
    uint64_t v50 = v22;
    sub_10001A388(a1, (uint64_t)v9);
    uint64_t v29 = v56;
    uint64_t v30 = v53;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v56 + 48))(v9, 1, v53) == 1)
    {
      swift_bridgeObjectRelease();
      sub_100010578((uint64_t)v9, &qword_1000655E8);
    }
    else
    {
      uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v29 + 32);
      v33(v13, v9, v30);
      unint64_t v34 = v54;
      if (v28)
      {
        long long v49 = v33;
        if (qword_100064F68 != -1) {
          swift_once();
        }
        uint64_t v35 = type metadata accessor for Logger();
        sub_100010174(v35, (uint64_t)qword_1000667D0);
        swift_bridgeObjectRetain_n();
        id v36 = Logger.logObject.getter();
        os_log_type_t v37 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v36, v37))
        {
          uint64_t v38 = (uint8_t *)swift_slowAlloc();
          uint64_t v58 = swift_slowAlloc();
          *(_DWORD *)uint64_t v38 = 136315138;
          id v48 = v38 + 4;
          swift_bridgeObjectRetain();
          uint64_t v57 = sub_10000E564(v51, v54, &v58);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v36, v37, "Task %s is replacing an existing task, unregistering its existing activity.", v38, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          unint64_t v34 = v54;
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        uint64_t v33 = v49;
        uint64_t v39 = MLHostTask.name.getter();
        sub_1000491FC(v39, v40);
        swift_bridgeObjectRelease();
      }
      sub_100028EA8((uint64_t)v13, 0);
      swift_bridgeObjectRelease();
      if (sub_100038460(v13))
      {
        swift_bridgeObjectRelease();
        uint64_t v41 = v55;
        v33(v55, v13, v30);
        uint64_t v42 = 0;
        uint64_t v29 = v56;
LABEL_22:
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v29 + 56))(v41, v42, 1, v30);
        return;
      }
      if (qword_100064F68 != -1) {
        swift_once();
      }
      uint64_t v43 = type metadata accessor for Logger();
      sub_100010174(v43, (uint64_t)qword_1000667D0);
      swift_bridgeObjectRetain_n();
      uint64_t v44 = Logger.logObject.getter();
      os_log_type_t v45 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v44, v45))
      {
        long long v46 = (uint8_t *)swift_slowAlloc();
        uint64_t v58 = swift_slowAlloc();
        *(_DWORD *)long long v46 = 136315138;
        os_log_type_t v52 = v46 + 4;
        swift_bridgeObjectRetain();
        uint64_t v47 = v51;
        uint64_t v57 = sub_10000E564(v51, v54, &v58);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v44, v45, "Task %s failed registration with DAS.", v46, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        unint64_t v34 = v54;
        swift_slowDealloc();

        uint64_t v29 = v56;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        uint64_t v29 = v56;
        uint64_t v47 = v51;
      }
      sub_100014E9C(v47, v34);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v13, v30);
    }
    uint64_t v42 = 1;
    uint64_t v41 = v55;
    goto LABEL_22;
  }
}

id sub_10002C3CC(void *a1)
{
  if (qword_100064F68 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100010174(v2, (uint64_t)qword_1000667D0);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    sub_10000E564(0xD000000000000019, 0x8000000100056070, &v7);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Daemon performing %s activity.", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return [a1 setTaskCompleted];
}

uint64_t sub_10002C55C(uint64_t a1, uint64_t a2)
{
  if (qword_100064F68 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_100010174(v3, (uint64_t)qword_1000667D0);
  swift_retain();
  os_log_type_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 67109120;
    LODWORD(v29) = dispatch thunk of XPCIncomingConnection.pid.getter();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Incoming connection from: %d", v6, 8u);
    swift_slowDealloc();
  }
  else
  {

    swift_release();
  }
  char v7 = sub_10002D0F4();
  char v9 = v8;
  swift_retain();
  uint64_t v10 = Logger.logObject.getter();
  if ((v9 & 1) == 0)
  {
    os_log_type_t v11 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 67109378;
      dispatch thunk of XPCIncomingConnection.pid.getter();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      *(_WORD *)(v12 + 8) = 2080;
      sub_10004A498();
      uint64_t v13 = String.init<A>(_:radix:uppercase:)();
      sub_10000E564(v13, v14, &v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Accepting connection from: %d with entitlements: %s", (uint8_t *)v12, 0x12u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release();
    }
    type metadata accessor for XPCConnection();
    swift_retain();
    uint64_t v17 = XPCConnection.__allocating_init(incomingConnection:)();
    if ((v7 & 4) != 0)
    {
      type metadata accessor for ListTasksRequest();
      sub_100049750(&qword_1000658A8, (void (*)(uint64_t))&type metadata accessor for ListTasksRequest);
      swift_retain();
      dispatch thunk of XPCConnection.handle<A>(_:handler:)();
      swift_release();
      type metadata accessor for GetTaskRequest();
      sub_100049750(&qword_1000658B0, (void (*)(uint64_t))&type metadata accessor for GetTaskRequest);
      swift_retain();
      dispatch thunk of XPCConnection.handle<A>(_:handler:)();
      swift_release();
      type metadata accessor for ListExtensionsRequest();
      sub_100049750(&qword_1000658B8, (void (*)(uint64_t))&type metadata accessor for ListExtensionsRequest);
      swift_retain();
      dispatch thunk of XPCConnection.handle<A>(_:handler:)();
      swift_release();
      type metadata accessor for GetExtensionRequest();
      sub_100049750(&qword_1000658C0, (void (*)(uint64_t))&type metadata accessor for GetExtensionRequest);
      swift_retain();
      dispatch thunk of XPCConnection.handle<A>(_:handler:)();
      swift_release();
      if ((v7 & 8) == 0)
      {
LABEL_14:
        if ((v7 & 0x10) == 0) {
          goto LABEL_15;
        }
        goto LABEL_25;
      }
    }
    else if ((v7 & 8) == 0)
    {
      goto LABEL_14;
    }
    type metadata accessor for AddTaskRequest();
    sub_100049750(&qword_1000658A0, (void (*)(uint64_t))&type metadata accessor for AddTaskRequest);
    swift_retain();
    dispatch thunk of XPCConnection.handle<A>(_:handler:)();
    swift_release();
    if ((v7 & 0x10) == 0)
    {
LABEL_15:
      if ((v7 & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_26;
    }
LABEL_25:
    type metadata accessor for ResetTasksRequest();
    sub_100049750(&qword_100065890, (void (*)(uint64_t))&type metadata accessor for ResetTasksRequest);
    swift_retain();
    dispatch thunk of XPCConnection.handle<A>(_:handler:)();
    swift_release();
    type metadata accessor for CleanTasksRequest();
    sub_100049750(&qword_100065898, (void (*)(uint64_t))&type metadata accessor for CleanTasksRequest);
    swift_retain();
    dispatch thunk of XPCConnection.handle<A>(_:handler:)();
    swift_release();
    if ((v7 & 1) == 0)
    {
LABEL_16:
      if ((v7 & 2) == 0) {
        goto LABEL_17;
      }
      goto LABEL_27;
    }
LABEL_26:
    type metadata accessor for GetHostConfigurationRequest();
    sub_100049750(&qword_100065888, (void (*)(uint64_t))&type metadata accessor for GetHostConfigurationRequest);
    swift_retain();
    dispatch thunk of XPCConnection.handle<A>(_:handler:)();
    swift_release();
    if ((v7 & 2) == 0)
    {
LABEL_17:
      if ((v7 & 1) == 0) {
        goto LABEL_18;
      }
      goto LABEL_28;
    }
LABEL_27:
    type metadata accessor for SetHostConfigurationRequest();
    sub_100049750(&qword_100065880, (void (*)(uint64_t))&type metadata accessor for SetHostConfigurationRequest);
    swift_retain();
    dispatch thunk of XPCConnection.handle<A>(_:handler:)();
    swift_release();
    if ((v7 & 1) == 0)
    {
LABEL_18:
      if ((v7 & 2) == 0) {
        goto LABEL_19;
      }
      goto LABEL_29;
    }
LABEL_28:
    type metadata accessor for GetNotificationsConfigRequest();
    sub_100049750(&qword_100065878, (void (*)(uint64_t))&type metadata accessor for GetNotificationsConfigRequest);
    swift_retain();
    dispatch thunk of XPCConnection.handle<A>(_:handler:)();
    swift_release();
    if ((v7 & 2) == 0)
    {
LABEL_19:
      if ((v7 & 0x20) == 0) {
        return v17;
      }
LABEL_30:
      uint64_t v18 = dispatch thunk of XPCIncomingConnection.valueStringArray(forEntitlement:)();
      if (v18) {
        unint64_t v19 = (void *)v18;
      }
      else {
        unint64_t v19 = _swiftEmptyArrayStorage;
      }
      uint64_t v20 = sub_1000383C8((uint64_t)v19);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain_n();
      uint64_t v21 = Logger.logObject.getter();
      os_log_type_t v22 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v23 = (uint8_t *)swift_slowAlloc();
        uint64_t v29 = swift_slowAlloc();
        *(_DWORD *)uint64_t v23 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v24 = Set.description.getter();
        unint64_t v26 = v25;
        swift_bridgeObjectRelease();
        sub_10000E564(v24, v26, &v29);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "Accepted connection with allowedTasks: %s", v23, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      type metadata accessor for GetOnDemandTaskRequest();
      uint64_t v27 = swift_allocObject();
      *(void *)(v27 + 16) = v20;
      *(void *)(v27 + 24) = a2;
      sub_100049750(&qword_100065868, (void (*)(uint64_t))&type metadata accessor for GetOnDemandTaskRequest);
      swift_retain();
      dispatch thunk of XPCConnection.handle<A>(_:handler:)();
      swift_release();
      return v17;
    }
LABEL_29:
    type metadata accessor for ResetNotificationsRequest();
    sub_100049750(&qword_100065870, (void (*)(uint64_t))&type metadata accessor for ResetNotificationsRequest);
    swift_retain();
    dispatch thunk of XPCConnection.handle<A>(_:handler:)();
    swift_release();
    if ((v7 & 0x20) == 0) {
      return v17;
    }
    goto LABEL_30;
  }
  os_log_type_t v15 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v10, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 67109120;
    LODWORD(v29) = dispatch thunk of XPCIncomingConnection.pid.getter();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v10, v15, "Invalid entitlements. Dropping connection from: %d", v16, 8u);
    swift_slowDealloc();
  }
  else
  {

    swift_release();
  }
  return 0;
}

uint64_t sub_10002D0F4()
{
  if (qword_100064F88 == -1) {
    goto LABEL_2;
  }
LABEL_33:
  swift_once();
LABEL_2:
  uint64_t v0 = off_1000656B0;
  uint64_t v1 = (char *)off_1000656B0 + 64;
  uint64_t v2 = 1 << *((unsigned char *)off_1000656B0 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  unint64_t v4 = v3 & *((void *)off_1000656B0 + 8);
  int64_t v5 = (unint64_t)(v2 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v6 = 0;
  uint64_t v17 = 0;
  if (v4)
  {
LABEL_5:
    unint64_t v7 = __clz(__rbit64(v4));
    v4 &= v4 - 1;
    unint64_t v8 = v7 | (v6 << 6);
    goto LABEL_6;
  }
  while (1)
  {
    int64_t v11 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
    if (v11 >= v5) {
      goto LABEL_30;
    }
    unint64_t v12 = *(void *)&v1[8 * v11];
    ++v6;
    if (!v12)
    {
      int64_t v6 = v11 + 1;
      if (v11 + 1 >= v5) {
        goto LABEL_30;
      }
      unint64_t v12 = *(void *)&v1[8 * v6];
      if (!v12)
      {
        int64_t v6 = v11 + 2;
        if (v11 + 2 >= v5) {
          goto LABEL_30;
        }
        unint64_t v12 = *(void *)&v1[8 * v6];
        if (!v12) {
          break;
        }
      }
    }
LABEL_21:
    unint64_t v4 = (v12 - 1) & v12;
    unint64_t v8 = __clz(__rbit64(v12)) + (v6 << 6);
LABEL_6:
    uint64_t v9 = *(void *)(v0[7] + 8 * v8);
    swift_bridgeObjectRetain();
    char v10 = dispatch thunk of XPCIncomingConnection.valueBool(forEntitlement:)();
    swift_bridgeObjectRelease();
    if (v10 == 2)
    {
      if (v4) {
        goto LABEL_5;
      }
    }
    else
    {
      if ((v9 & ~v17) == 0 || (v10 & 1) == 0) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = v9;
      }
      v17 |= v15;
      if (v4) {
        goto LABEL_5;
      }
    }
  }
  int64_t v13 = v11 + 3;
  if (v13 < v5)
  {
    unint64_t v12 = *(void *)&v1[8 * v13];
    if (!v12)
    {
      while (1)
      {
        int64_t v6 = v13 + 1;
        if (__OFADD__(v13, 1)) {
          goto LABEL_32;
        }
        if (v6 >= v5) {
          goto LABEL_30;
        }
        unint64_t v12 = *(void *)&v1[8 * v6];
        ++v13;
        if (v12) {
          goto LABEL_21;
        }
      }
    }
    int64_t v6 = v13;
    goto LABEL_21;
  }
LABEL_30:
  swift_release();
  return v17;
}

uint64_t sub_10002D2E0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  v33[1] = a2;
  uint64_t v3 = sub_10000E508(&qword_1000655E8);
  __chkstk_darwin(v3 - 8);
  int64_t v5 = (char *)v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for MLHostTask();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v42 = (char *)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v41 = (char *)v33 - v10;
  uint64_t v11 = *(void *)(a1 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
  unint64_t v12 = (os_unfair_lock_s *)(*(void *)(v11 + 56) + 16);
  os_unfair_lock_lock(v12);
  uint64_t v39 = v11 + 64;
  swift_beginAccess();
  uint64_t v40 = v11;
  uint64_t v13 = swift_bridgeObjectRetain();
  unint64_t v14 = sub_100037EE0(v13);
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v12);
  uint64_t v15 = v14[2];
  v33[0] = v14;
  if (v15)
  {
    unint64_t v34 = (void (**)(char *, char *, uint64_t))(v7 + 16);
    uint64_t v35 = v7;
    uint64_t v38 = (unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
    id v36 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
    os_log_type_t v37 = (void (**)(char *, char *, uint64_t))(v7 + 32);
    v33[3] = v7 + 8;
    uint64_t v16 = v14 + 5;
    uint64_t v17 = (char *)_swiftEmptyArrayStorage;
    do
    {
      uint64_t v19 = *(v16 - 1);
      uint64_t v18 = *v16;
      uint64_t v20 = v40;
      uint64_t v21 = (os_unfair_lock_s *)(*(void *)(v40 + 56) + 16);
      swift_bridgeObjectRetain();
      os_unfair_lock_lock(v21);
      swift_beginAccess();
      uint64_t v22 = *(void *)(v20 + 64);
      if (*(void *)(v22 + 16))
      {
        swift_bridgeObjectRetain();
        unint64_t v23 = sub_100034E9C(v19, v18);
        if (v24)
        {
          uint64_t v25 = *(void *)(v22 + 56);
          uint64_t v26 = v35;
          (*(void (**)(char *, unint64_t, uint64_t))(v35 + 16))(v5, v25 + *(void *)(v35 + 72) * v23, v6);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v5, 0, 1, v6);
        }
        else
        {
          (*v36)(v5, 1, 1, v6);
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        (*v36)(v5, 1, 1, v6);
      }
      swift_endAccess();
      os_unfair_lock_unlock(v21);
      swift_bridgeObjectRelease();
      if ((*v38)(v5, 1, v6) == 1)
      {
        sub_100010578((uint64_t)v5, &qword_1000655E8);
      }
      else
      {
        uint64_t v27 = *v37;
        int v28 = v41;
        (*v37)(v41, v5, v6);
        (*v34)(v42, v28, v6);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v17 = (char *)sub_100020748(0, *((void *)v17 + 2) + 1, 1, (unint64_t)v17);
        }
        unint64_t v30 = *((void *)v17 + 2);
        unint64_t v29 = *((void *)v17 + 3);
        if (v30 >= v29 >> 1) {
          uint64_t v17 = (char *)sub_100020748(v29 > 1, v30 + 1, 1, (unint64_t)v17);
        }
        *((void *)v17 + 2) = v30 + 1;
        uint64_t v31 = v35;
        v27(&v17[((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80))+ *(void *)(v35 + 72) * v30], v42, v6);
        (*(void (**)(char *, uint64_t))(v31 + 8))(v41, v6);
      }
      v16 += 2;
      --v15;
    }
    while (v15);
  }
  swift_release();
  return ListTasksResponse.init(tasks:)();
}

uint64_t sub_10002D718@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v3 = sub_10000E508(&qword_1000655E8);
  __chkstk_darwin(v3 - 8);
  int64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for MLHostTask();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  char v24 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - v10;
  uint64_t v12 = *(void *)(a1 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
  uint64_t Task = GetTaskRequest.name.getter();
  uint64_t v15 = v14;
  uint64_t v16 = (os_unfair_lock_s *)(*(void *)(v12 + 56) + 16);
  os_unfair_lock_lock(v16);
  swift_beginAccess();
  uint64_t v17 = *(void *)(v12 + 64);
  if (*(void *)(v17 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v18 = sub_100034E9C(Task, v15);
    if (v19)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v5, *(void *)(v17 + 56) + *(void *)(v7 + 72) * v18, v6);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  }
  swift_endAccess();
  os_unfair_lock_unlock(v16);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_100010578((uint64_t)v5, &qword_1000655E8);
    uint64_t v20 = type metadata accessor for XPCRemoteError();
    sub_100049750(&qword_1000658D0, (void (*)(uint64_t))&type metadata accessor for XPCRemoteError);
    swift_allocError();
    strcpy(v21, "taskNotFound");
    v21[13] = 0;
    *((_WORD *)v21 + 7) = -5120;
    (*(void (**)(char *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v21, enum case for XPCRemoteError.genericError(_:), v20);
    return swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v11, v5, v6);
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v24, v11, v6);
    GetTaskResponse.init(task:)();
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v11, v6);
  }
}

uint64_t sub_10002DAC4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v3 = sub_10000E508(&qword_1000654E0);
  __chkstk_darwin(v3 - 8);
  int64_t v5 = (char *)v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for ExtensionRecord();
  uint64_t v39 = *(void *)(v6 - 8);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v38 = (char *)v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)v35 - v10;
  __chkstk_darwin(v9);
  os_log_type_t v37 = (char *)v35 - v12;
  uint64_t v13 = *(void *)(a1 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_extensionRegistry);
  uint64_t Extension = GetExtensionRequest.bundleIdentifier.getter();
  uint64_t v16 = v15;
  uint64_t v17 = (os_unfair_lock_s *)(*(void *)(v13 + 16) + 16);
  os_unfair_lock_lock(v17);
  uint64_t v18 = *(void *)(v13 + 40);
  swift_bridgeObjectRetain();
  char v19 = sub_1000139FC(Extension, v16, v18);
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v17);
  if (v19)
  {
    id v36 = v5;
    uint64_t v20 = sub_100010B4C();
    uint64_t v21 = *((void *)v20 + 2);
    uint64_t v22 = v6;
    if (v21)
    {
      uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v39 + 16);
      char v24 = &v20[(*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80)];
      uint64_t v25 = (void (**)(char *, uint64_t))(v39 + 8);
      uint64_t v43 = v39 + 16;
      uint64_t v41 = *(void *)(v39 + 72);
      uint64_t v42 = v23;
      v35[1] = v20;
      swift_bridgeObjectRetain();
      while (1)
      {
        v42(v11, v24, v22);
        if (ExtensionRecord.bundleIdentifier.getter() == Extension && v26 == v16) {
          break;
        }
        uint64_t v27 = v16;
        char v28 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v28) {
          goto LABEL_12;
        }
        (*v25)(v11, v22);
        v24 += v41;
        --v21;
        uint64_t v16 = v27;
        if (!v21)
        {
          swift_bridgeObjectRelease();
          goto LABEL_9;
        }
      }
      swift_bridgeObjectRelease();
LABEL_12:
      swift_bridgeObjectRelease();
      uint64_t v29 = v39;
      uint64_t v30 = (uint64_t)v36;
      (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v36, v11, v22);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v29 + 56))(v30, 0, 1, v22);
      swift_bridgeObjectRelease();
    }
    else
    {
LABEL_9:
      uint64_t v29 = v39;
      uint64_t v30 = (uint64_t)v36;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v39 + 56))(v36, 1, 1, v22);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v29 = v39;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v39 + 56))(v5, 1, 1, v6);
    uint64_t v30 = (uint64_t)v5;
    uint64_t v22 = v6;
  }
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v29 + 48))(v30, 1, v22) == 1)
  {
    sub_100010578(v30, &qword_1000654E0);
    uint64_t v31 = type metadata accessor for XPCRemoteError();
    sub_100049750(&qword_1000658D0, (void (*)(uint64_t))&type metadata accessor for XPCRemoteError);
    swift_allocError();
    *uint64_t v32 = 0xD000000000000011;
    v32[1] = 0x80000001000562A0;
    (*(void (**)(void *, void, uint64_t))(*(void *)(v31 - 8) + 104))(v32, enum case for XPCRemoteError.genericError(_:), v31);
    return swift_willThrow();
  }
  else
  {
    unint64_t v34 = v37;
    (*(void (**)(char *, uint64_t, uint64_t))(v29 + 32))(v37, v30, v22);
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v38, v34, v22);
    GetExtensionResponse.init(extensionRecord:)();
    return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v34, v22);
  }
}

uint64_t sub_10002DFD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v70 = a2;
  uint64_t v5 = type metadata accessor for TaskValidationError();
  uint64_t v73 = *(void *)(v5 - 8);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v64 = (char *)v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v72 = (char *)v58 - v9;
  __chkstk_darwin(v8);
  os_log_type_t v63 = (char *)v58 - v10;
  uint64_t v11 = sub_10000E508(&qword_1000658D8);
  __chkstk_darwin(v11 - 8);
  uint64_t v66 = (char *)v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10000E508(&qword_1000655E8);
  __chkstk_darwin(v13 - 8);
  uint64_t v68 = (char *)v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for TaskDefinition();
  uint64_t v74 = *(void *)(v15 - 8);
  uint64_t v75 = v15;
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v67 = (char *)v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  char v19 = (char *)v58 - v18;
  uint64_t v20 = type metadata accessor for AddTaskRequest();
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v23 = (char *)v58 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100064F68 != -1) {
    swift_once();
  }
  uint64_t v24 = type metadata accessor for Logger();
  uint64_t v25 = sub_100010174(v24, (uint64_t)qword_1000667D0);
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 16);
  uint64_t v69 = a1;
  v26(v23, a1, v20);
  uint64_t v62 = v25;
  uint64_t v27 = Logger.logObject.getter();
  os_log_type_t v28 = static os_log_type_t.info.getter();
  BOOL v29 = os_log_type_enabled(v27, v28);
  uint64_t v65 = a3;
  if (v29)
  {
    uint64_t v30 = swift_slowAlloc();
    uint64_t v61 = v5;
    uint64_t v31 = (uint8_t *)v30;
    uint64_t v60 = swift_slowAlloc();
    uint64_t v77 = v60;
    *(_DWORD *)uint64_t v31 = 136315138;
    v58[1] = v31 + 4;
    uint64_t v59 = v31;
    AddTaskRequest.taskDefinition.getter();
    uint64_t v32 = TaskDefinition.name.getter();
    unint64_t v34 = v33;
    (*(void (**)(char *, uint64_t))(v74 + 8))(v19, v75);
    uint64_t v76 = sub_10000E564(v32, v34, &v77);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    uint64_t v5 = v61;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Processing AddTaskRequest for task: %s", v59, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  }

  uint64_t v35 = (uint64_t)v67;
  AddTaskRequest.taskDefinition.getter();
  id v36 = v68;
  os_log_type_t v37 = v71;
  sub_10002BC94(v35, v68);
  uint64_t v38 = v72;
  uint64_t v39 = v73;
  if (v37)
  {
    (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v35, v75);
    uint64_t v77 = (uint64_t)v37;
    swift_errorRetain();
    sub_10000E508(&qword_1000655D0);
    uint64_t v40 = v64;
    if (swift_dynamicCast())
    {
      uint64_t v75 = 0;
      swift_errorRelease();
      uint64_t v41 = v63;
      (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v63, v40, v5);
      uint64_t v74 = *(void *)(v39 + 16);
      ((void (*)(char *, char *, uint64_t))v74)(v38, v41, v5);
      uint64_t v42 = Logger.logObject.getter();
      os_log_type_t v43 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v42, v43))
      {
        uint64_t v44 = (uint8_t *)swift_slowAlloc();
        os_log_type_t v45 = (void *)swift_slowAlloc();
        uint64_t v71 = v44;
        *(_DWORD *)uint64_t v44 = 138412290;
        sub_100049750(&qword_100065610, (void (*)(uint64_t))&type metadata accessor for TaskValidationError);
        swift_allocError();
        ((void (*)(uint64_t, char *, uint64_t))v74)(v46, v38, v5);
        uint64_t v47 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v76 = v47;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        void *v45 = v47;
        uint64_t v39 = v73;
        id v48 = *(void (**)(char *, uint64_t))(v73 + 8);
        v48(v38, v5);
        _os_log_impl((void *)&_mh_execute_header, v42, v43, "Failed to register task due to TaskValidation error: %@", v71, 0xCu);
        sub_10000E508(&qword_100065290);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        id v48 = *(void (**)(char *, uint64_t))(v39 + 8);
        v48(v38, v5);
      }

      uint64_t v56 = v66;
      uint64_t v57 = v63;
      ((void (*)(char *, char *, uint64_t))v74)(v66, v63, v5);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v39 + 56))(v56, 0, 1, v5);
      AddTaskResponse.init(result:error:)();
      v48(v57, v5);
      return swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v50 = Logger.logObject.getter();
      os_log_type_t v51 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v50, v51))
      {
        uint64_t v52 = swift_slowAlloc();
        uint64_t v75 = 0;
        uint64_t v53 = (uint8_t *)v52;
        unint64_t v54 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v53 = 138412290;
        swift_errorRetain();
        uint64_t v55 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v77 = v55;
        uint64_t v39 = v73;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *unint64_t v54 = v55;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v50, v51, "Failed to register task with error: %@", v53, 0xCu);
        sub_10000E508(&qword_100065290);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
      }

      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v39 + 56))(v66, 1, 1, v5);
      AddTaskResponse.init(result:error:)();
      return swift_errorRelease();
    }
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v35, v75);
    sub_100010578((uint64_t)v36, &qword_1000655E8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v39 + 56))(v66, 1, 1, v5);
    return AddTaskResponse.init(result:error:)();
  }
}

void sub_10002E95C()
{
  if (qword_100064F68 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100010174(v1, (uint64_t)qword_1000667D0);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Resetting Tasks", v4, 2u);
    swift_slowDealloc();
  }

  uint64_t v5 = sub_10002BBB4();
  __chkstk_darwin(v5);
  uint64_t v7 = v6 + 4;
  os_unfair_lock_lock(v6 + 4);
  sub_10004A508(v8);
  if (v0)
  {
    os_unfair_lock_unlock(v7);
    __break(1u);
  }
  else
  {
    os_unfair_lock_unlock(v7);
    sub_100014B6C();
    ResetTasksResponse.init(reloaded:)();
    if (ResetTasksRequest.reload.getter())
    {
      sub_1000278F0();
      sub_10002AF70();
      sub_10002B70C();
      ResetTasksResponse.reloaded.setter();
    }
  }
}

uint64_t sub_10002EB1C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  v50[1] = a2;
  uint64_t v71 = type metadata accessor for TaskType();
  uint64_t v3 = *(void *)(v71 - 8);
  uint64_t v4 = __chkstk_darwin(v71);
  uint64_t v70 = (char *)v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v69 = (char *)v50 - v6;
  uint64_t v7 = sub_10000E508(&qword_1000655E8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for MLHostTask();
  uint64_t v61 = *(void *)(v10 - 8);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v53 = (char *)v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v50 - v13;
  if (qword_100064F68 != -1) {
    swift_once();
  }
  uint64_t v15 = type metadata accessor for Logger();
  uint64_t v52 = sub_100010174(v15, (uint64_t)qword_1000667D0);
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Cleaning dynamicTasks", v18, 2u);
    swift_slowDealloc();
  }

  uint64_t v19 = *(void *)(a1 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
  uint64_t v20 = (os_unfair_lock_s *)(*(void *)(v19 + 56) + 16);
  os_unfair_lock_lock(v20);
  uint64_t v68 = v19 + 64;
  swift_beginAccess();
  uint64_t v75 = v19;
  uint64_t v21 = swift_bridgeObjectRetain();
  uint64_t v22 = sub_100037EE0(v21);
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v20);
  uint64_t v24 = v22[2];
  v50[0] = v22;
  if (v24)
  {
    uint64_t v67 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v61 + 56);
    uint64_t v58 = (void (**)(char *, char *, uint64_t))(v61 + 16);
    uint64_t v65 = (void (**)(char *, char *, uint64_t))(v61 + 32);
    uint64_t v66 = (unsigned int (**)(char *, uint64_t, uint64_t))(v61 + 48);
    unsigned int v57 = enum case for TaskType.dynamicTask(_:);
    uint64_t v56 = (void (**)(char *, void, uint64_t))(v3 + 104);
    uint64_t v55 = (void (**)(char *, uint64_t))(v3 + 8);
    unint64_t v54 = (void (**)(char *, uint64_t))(v61 + 8);
    os_log_type_t v63 = (char *)_swiftEmptyArrayStorage;
    uint64_t v25 = v22 + 5;
    *(void *)&long long v23 = 136315138;
    long long v51 = v23;
    v50[3] = (char *)&type metadata for Any + 8;
    uint64_t v59 = v10;
    uint64_t v60 = v9;
    uint64_t v62 = v14;
    while (1)
    {
      uint64_t v27 = *(v25 - 1);
      unint64_t v26 = *v25;
      uint64_t v28 = v75;
      BOOL v29 = (os_unfair_lock_s *)(*(void *)(v75 + 56) + 16);
      swift_bridgeObjectRetain();
      os_unfair_lock_lock(v29);
      swift_beginAccess();
      uint64_t v30 = *(void *)(v28 + 64);
      if (*(void *)(v30 + 16))
      {
        swift_bridgeObjectRetain();
        unint64_t v31 = sub_100034E9C(v27, v26);
        if (v32)
        {
          uint64_t v33 = *(void *)(v30 + 56);
          uint64_t v34 = v61;
          (*(void (**)(char *, unint64_t, uint64_t))(v61 + 16))(v9, v33 + *(void *)(v61 + 72) * v31, v10);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v9, 0, 1, v10);
        }
        else
        {
          (*v67)(v9, 1, 1, v10);
        }
        swift_bridgeObjectRelease();
      }
      else
      {
        (*v67)(v9, 1, 1, v10);
      }
      swift_endAccess();
      os_unfair_lock_unlock(v29);
      if ((*v66)(v9, 1, v10) != 1) {
        break;
      }
      swift_bridgeObjectRelease();
      sub_100010578((uint64_t)v9, &qword_1000655E8);
LABEL_8:
      v25 += 2;
      if (!--v24) {
        goto LABEL_33;
      }
    }
    uint64_t v64 = *v65;
    v64(v14, v9, v10);
    MLHostTask.taskType.getter();
    (*v56)(v70, v57, v71);
    sub_100049750(&qword_100065620, (void (*)(uint64_t))&type metadata accessor for TaskType);
    dispatch thunk of RawRepresentable.rawValue.getter();
    dispatch thunk of RawRepresentable.rawValue.getter();
    if (v74[0] == v72 && v74[1] == v73)
    {
      swift_bridgeObjectRelease_n();
      uint64_t v35 = *v55;
      uint64_t v36 = v71;
      (*v55)(v70, v71);
      v35(v69, v36);
    }
    else
    {
      char v37 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v38 = *v55;
      uint64_t v39 = v71;
      (*v55)(v70, v71);
      v38(v69, v39);
      if ((v37 & 1) == 0)
      {
        uint64_t v14 = v62;
        uint64_t v10 = v59;
        (*v54)(v62, v59);
        swift_bridgeObjectRelease();
LABEL_31:
        uint64_t v9 = v60;
        goto LABEL_8;
      }
    }
    char v40 = sub_100014E9C(v27, v26);
    uint64_t v10 = v59;
    uint64_t v14 = v62;
    if (v40)
    {
      sub_1000491FC(v27, v26);
      swift_bridgeObjectRelease();
      (*v58)(v53, v14, v10);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        os_log_type_t v63 = (char *)sub_100020748(0, *((void *)v63 + 2) + 1, 1, (unint64_t)v63);
      }
      uint64_t v41 = v64;
      unint64_t v43 = *((void *)v63 + 2);
      unint64_t v42 = *((void *)v63 + 3);
      if (v43 >= v42 >> 1) {
        os_log_type_t v63 = (char *)sub_100020748(v42 > 1, v43 + 1, 1, (unint64_t)v63);
      }
      uint64_t v44 = v63;
      *((void *)v63 + 2) = v43 + 1;
      uint64_t v45 = v61;
      v41(&v44[((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(void *)(v61 + 72) * v43], v53, v10);
      (*(void (**)(char *, uint64_t))(v45 + 8))(v14, v10);
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v46 = Logger.logObject.getter();
      os_log_type_t v47 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v46, v47))
      {
        uint64_t v48 = swift_slowAlloc();
        v74[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v48 = v51;
        swift_bridgeObjectRetain();
        *(void *)(v48 + 4) = sub_10000E564(v27, v26, v74);
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v46, v47, "Failed at removing task: %s", (uint8_t *)v48, 0xCu);
        swift_arrayDestroy();
        uint64_t v14 = v62;
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      (*v54)(v14, v10);
    }
    goto LABEL_31;
  }
  os_log_type_t v63 = (char *)_swiftEmptyArrayStorage;
LABEL_33:
  swift_release();
  return CleanTasksResponse.init(tasks:)();
}

uint64_t sub_10002F420(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for MLHostConfig();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a2 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_config;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  return GetHostConfigurationResponse.init(config:)();
}

uint64_t sub_10002F524@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v37 = a2;
  uint64_t v5 = type metadata accessor for SetHostConfigurationRequest();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for MLHostConfig();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = a1;
  SetHostConfigurationRequest.config.getter();
  BOOL v13 = sub_100039990();
  uint64_t v36 = v10;
  uint64_t v14 = *(void (**)(char *, uint64_t))(v10 + 8);
  v14(v12, v9);
  if (v13)
  {
    BOOL v34 = v13;
    if (qword_100064F68 != -1) {
      swift_once();
    }
    uint64_t v35 = a3;
    uint64_t v15 = type metadata accessor for Logger();
    sub_100010174(v15, (uint64_t)qword_1000667D0);
    uint64_t v16 = v5;
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v38, v5);
    os_log_type_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.info.getter();
    int v19 = v18;
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v31 = v16;
      uint64_t v20 = swift_slowAlloc();
      int v32 = v19;
      uint64_t v21 = (uint8_t *)v20;
      uint64_t v33 = swift_slowAlloc();
      v39[0] = v33;
      os_log_t v29 = v17;
      uint64_t v30 = v21;
      *(_DWORD *)uint64_t v21 = 136315138;
      v28[1] = v21 + 4;
      SetHostConfigurationRequest.config.getter();
      sub_100049750(&qword_1000658E0, (void (*)(uint64_t))&type metadata accessor for MLHostConfig);
      uint64_t v22 = dispatch thunk of CustomStringConvertible.description.getter();
      unint64_t v24 = v23;
      v14(v12, v9);
      v39[4] = sub_10000E564(v22, v24, v39);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v31);
      os_log_t v25 = v29;
      _os_log_impl((void *)&_mh_execute_header, v29, (os_log_type_t)v32, "Updated MLHost config: %s", v30, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v16);
    }
    SetHostConfigurationRequest.config.getter();
    uint64_t v26 = v37 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_config;
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v36 + 40))(v26, v12, v9);
    swift_endAccess();
  }
  return SetHostConfigurationResponse.init(success:error:)();
}

uint64_t sub_10002F938()
{
  if (GetNotificationsConfigRequest.registeredOnly.getter()) {
    sub_10000B8D4();
  }
  else {
    sub_10000B508();
  }
  return GetNotificationsConfigResponse.init(channelsByTopic:)();
}

uint64_t sub_10002F998()
{
  if (ResetNotificationsRequest.reload.getter()) {
    sub_1000089FC();
  }
  ResetNotificationsRequest.reload.getter();
  return ResetTasksResponse.init(reloaded:)();
}

uint64_t sub_10002FA10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v120 = type metadata accessor for OnDemandResult();
  uint64_t v119 = *(void *)(v120 - 8);
  __chkstk_darwin(v120);
  uint64_t v118 = (char *)v115 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for OnDemandError();
  uint64_t v140 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)v115 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = type metadata accessor for TaskStatus();
  uint64_t v131 = *(void *)(v126 - 8);
  uint64_t v12 = __chkstk_darwin(v126);
  uint64_t v130 = (char *)v115 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  unint64_t v129 = (char *)v115 - v14;
  uint64_t v125 = type metadata accessor for TaskDefinition();
  uint64_t v124 = *(void *)(v125 - 8);
  __chkstk_darwin(v125);
  uint64_t v16 = (char *)v115 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for TaskRequest();
  uint64_t v132 = *(void *)(v17 - 8);
  uint64_t v133 = v17;
  __chkstk_darwin(v17);
  uint64_t v135 = (char *)v115 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for GetOnDemandTaskRequest();
  uint64_t v127 = *(void *)(v19 - 8);
  uint64_t v128 = v19;
  __chkstk_darwin(v19);
  uint64_t v134 = (uint8_t *)v115 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_10000E508(&qword_1000655E8);
  __chkstk_darwin(v21 - 8);
  unint64_t v23 = (char *)v115 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v136 = type metadata accessor for MLHostTask();
  uint64_t v138 = *(void *)(v136 - 8);
  uint64_t v24 = __chkstk_darwin(v136);
  uint64_t v122 = (char *)v115 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  uint64_t v137 = (char *)v115 - v26;
  uint64_t v27 = GetOnDemandTaskRequest.taskName.getter();
  LOBYTE(a2) = sub_1000139FC(v27, v28, a2);
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
  {
    if (qword_100064F68 != -1) {
      swift_once();
    }
    uint64_t v40 = type metadata accessor for Logger();
    sub_100010174(v40, (uint64_t)qword_1000667D0);
    uint64_t v41 = Logger.logObject.getter();
    os_log_type_t v42 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v41, v42))
    {
      unint64_t v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v43 = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "Client not authorized for onDemand requests.", v43, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, void, uint64_t))(v140 + 104))(v11, enum case for OnDemandError.clientUnauthorized(_:), v9);
    return GetOnDemandTaskRequestResponse.init(error:)();
  }
  uint64_t v121 = v9;
  uint64_t v123 = v11;
  uint64_t v117 = a4;
  v115[1] = a3;
  uint64_t v29 = *(void *)(a3 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
  uint64_t v116 = a1;
  uint64_t v30 = GetOnDemandTaskRequest.taskName.getter();
  uint64_t v32 = v31;
  uint64_t v33 = (os_unfair_lock_s *)(*(void *)(v29 + 56) + 16);
  os_unfair_lock_lock(v33);
  swift_beginAccess();
  uint64_t v34 = *(void *)(v29 + 64);
  if (*(void *)(v34 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v35 = sub_100034E9C(v30, v32);
    uint64_t v36 = v136;
    if (v37)
    {
      uint64_t v38 = *(void *)(v34 + 56);
      uint64_t v39 = v138;
      (*(void (**)(char *, unint64_t, uint64_t))(v138 + 16))(v23, v38 + *(void *)(v138 + 72) * v35, v136);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v39 + 56))(v23, 0, 1, v36);
    }
    else
    {
      uint64_t v39 = v138;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v138 + 56))(v23, 1, 1, v136);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v39 = v138;
    uint64_t v36 = v136;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v138 + 56))(v23, 1, 1, v136);
  }
  uint64_t v44 = v137;
  swift_endAccess();
  os_unfair_lock_unlock(v33);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v23, 1, v36) == 1)
  {
    sub_100010578((uint64_t)v23, &qword_1000655E8);
    if (qword_100064F68 != -1) {
      swift_once();
    }
    uint64_t v45 = type metadata accessor for Logger();
    sub_100010174(v45, (uint64_t)qword_1000667D0);
    uint64_t v47 = v127;
    uint64_t v46 = v128;
    uint64_t v48 = v134;
    (*(void (**)(uint8_t *, uint64_t, uint64_t))(v127 + 16))(v134, v116, v128);
    long long v49 = Logger.logObject.getter();
    os_log_type_t v50 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v49, v50))
    {
      long long v51 = (uint8_t *)swift_slowAlloc();
      v143[0] = (id)swift_slowAlloc();
      *(_DWORD *)long long v51 = 136315138;
      uint64_t v52 = GetOnDemandTaskRequest.taskName.getter();
      id v142 = (id)sub_10000E564(v52, v53, (uint64_t *)v143);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(uint8_t *, uint64_t))(v47 + 8))(v134, v46);
      _os_log_impl((void *)&_mh_execute_header, v49, v50, "Invalid taskName for onDemand request: %s", v51, 0xCu);
      swift_arrayDestroy();
      uint64_t v54 = v121;
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v55 = v123;
    }
    else
    {
      (*(void (**)(uint8_t *, uint64_t))(v47 + 8))(v48, v46);

      uint64_t v55 = v123;
      uint64_t v54 = v121;
    }
    (*(void (**)(char *, void, uint64_t))(v140 + 104))(v55, enum case for OnDemandError.taskInvalid(_:), v54);
    return GetOnDemandTaskRequestResponse.init(error:)();
  }
  uint64_t v56 = (uint64_t)v44;
  (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v44, v23, v36);
  MLHostTask.taskDefinition.getter();
  unsigned int v57 = v135;
  TaskDefinition.taskRequest.getter();
  (*(void (**)(char *, uint64_t))(v124 + 8))(v16, v125);
  uint64_t v58 = v129;
  MLHostTask.status.getter();
  uint64_t v60 = v130;
  uint64_t v59 = v131;
  uint64_t v61 = v126;
  (*(void (**)(char *, void, uint64_t))(v131 + 104))(v130, enum case for TaskStatus.taskRunning(_:), v126);
  sub_100049750(&qword_1000658E8, (void (*)(uint64_t))&type metadata accessor for TaskStatus);
  char v62 = dispatch thunk of static Equatable.== infix(_:_:)();
  os_log_type_t v63 = *(void (**)(char *, uint64_t))(v59 + 8);
  v63(v60, v61);
  v63(v58, v61);
  uint64_t v64 = v123;
  if (v62)
  {
    if (qword_100064F68 != -1) {
      swift_once();
    }
    uint64_t v65 = type metadata accessor for Logger();
    sub_100010174(v65, (uint64_t)qword_1000667D0);
    uint64_t v66 = v138;
    uint64_t v67 = v122;
    (*(void (**)(char *, uint64_t, uint64_t))(v138 + 16))(v122, v56, v36);
    uint64_t v68 = Logger.logObject.getter();
    os_log_type_t v69 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v68, v69))
    {
      uint64_t v70 = (uint8_t *)swift_slowAlloc();
      v143[0] = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v70 = 136315138;
      uint64_t v136 = (uint64_t)(v70 + 4);
      sub_100049750(&qword_1000657F0, (void (*)(uint64_t))&type metadata accessor for MLHostTask);
      uint64_t v71 = dispatch thunk of CustomStringConvertible.description.getter();
      id v142 = (id)sub_10000E564(v71, v72, (uint64_t *)v143);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v73 = *(void (**)(char *, uint64_t))(v66 + 8);
      v73(v67, v36);
      _os_log_impl((void *)&_mh_execute_header, v68, v69, "Found existing running task: %s", v70, 0xCu);
      swift_arrayDestroy();
      unsigned int v57 = v135;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      uint64_t v73 = *(void (**)(char *, uint64_t))(v66 + 8);
      v73(v67, v36);
    }

    (*(void (**)(char *, void, uint64_t))(v140 + 104))(v123, enum case for OnDemandError.taskRunning(_:), v121);
    GetOnDemandTaskRequestResponse.init(error:)();
    (*(void (**)(char *, uint64_t))(v132 + 8))(v57, v133);
    return ((uint64_t (*)(char *, uint64_t))v73)(v137, v36);
  }
  else
  {
    v143[0] = (id)MLHostTask.name.getter();
    v143[1] = v75;
    v76._uint64_t countAndFlagsBits = 0x6E616D65646E6F2ELL;
    v76._object = (void *)0xE900000000000064;
    String.append(_:)(v76);
    uint64_t v77 = self;
    id v78 = [v77 sharedScheduler];
    NSString v79 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v80 = [v78 taskRequestForIdentifier:v79];

    if (v80)
    {
      uint64_t v81 = qword_100064F68;
      id v82 = v80;
      if (v81 != -1) {
        swift_once();
      }
      uint64_t v83 = type metadata accessor for Logger();
      sub_100010174(v83, (uint64_t)qword_1000667D0);
      unint64_t v84 = v82;
      os_log_type_t v85 = Logger.logObject.getter();
      os_log_type_t v86 = static os_log_type_t.error.getter();
      BOOL v87 = os_log_type_enabled(v85, v86);
      uint64_t v88 = v121;
      if (v87)
      {
        uint64_t v89 = (uint8_t *)swift_slowAlloc();
        uint64_t v131 = swift_slowAlloc();
        uint64_t v134 = v89;
        *(_DWORD *)uint64_t v89 = 138412290;
        v143[0] = v84;
        os_log_type_t v90 = v84;
        uint64_t v91 = v137;
        uint64_t v92 = v121;
        uint64_t v93 = v123;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(void *)uint64_t v131 = v80;

        uint64_t v64 = v93;
        uint64_t v56 = (uint64_t)v91;
        uint64_t v88 = v92;
        uint64_t v36 = v136;
        _os_log_impl((void *)&_mh_execute_header, v85, v86, "Found existing taskRequest: %@", v134, 0xCu);
        sub_10000E508(&qword_100065290);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        os_log_type_t v85 = v84;
      }

      (*(void (**)(char *, void, uint64_t))(v140 + 104))(v64, enum case for OnDemandError.taskPending(_:), v88);
      GetOnDemandTaskRequestResponse.init(error:)();

      (*(void (**)(char *, uint64_t))(v132 + 8))(v135, v133);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v138 + 8))(v56, v36);
    }
    else
    {
      uint64_t v94 = v121;
      uint64_t v95 = sub_100028EA8(v56, 1);
      unint64_t v97 = v96;
      id v98 = objc_allocWithZone((Class)BGNonRepeatingSystemTaskRequest);
      swift_bridgeObjectRetain();
      NSString v99 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      id v100 = [v98 initWithIdentifier:v99];

      v143[0] = v100;
      id v101 = v100;
      [v101 setScheduleAfter:0.5];
      [v101 setTrySchedulingBefore:10.0];

      sub_100010330(0, &qword_1000658F0);
      uint64_t v102 = v135;
      TaskRequest.asSystemRequest<A>(request:)();
      id v103 = [v77 sharedScheduler];
      id v104 = v143[0];
      id v142 = 0;
      LOBYTE(v101) = [v103 submitTaskRequest:v143[0] error:&v142];

      if (v101)
      {
        id v105 = v142;
        swift_bridgeObjectRelease();
        (*(void (**)(char *, void, uint64_t))(v119 + 104))(v118, enum case for OnDemandResult.taskScheduled(_:), v120);
        GetOnDemandTaskRequestResponse.init(result:)();

        (*(void (**)(char *, uint64_t))(v132 + 8))(v102, v133);
        return (*(uint64_t (**)(uint64_t, uint64_t))(v138 + 8))(v56, v136);
      }
      else
      {
        id v106 = v142;
        uint64_t v107 = _convertNSErrorToError(_:)();

        swift_willThrow();
        if (qword_100064F68 != -1) {
          swift_once();
        }
        uint64_t v108 = type metadata accessor for Logger();
        sub_100010174(v108, (uint64_t)qword_1000667D0);
        swift_bridgeObjectRetain_n();
        uint64_t v109 = Logger.logObject.getter();
        os_log_type_t v110 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v109, v110))
        {
          uint64_t v111 = swift_slowAlloc();
          uint64_t v139 = v107;
          os_log_type_t v112 = (uint8_t *)v111;
          id v142 = (id)swift_slowAlloc();
          *(_DWORD *)os_log_type_t v112 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v141 = sub_10000E564(v95, v97, (uint64_t *)&v142);
          uint64_t v94 = v121;
          uint64_t v56 = (uint64_t)v137;
          unsigned int v113 = v123;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v109, v110, "Failed at scheduling ondemand task: %s", v112, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          unsigned int v114 = v135;
        }
        else
        {

          swift_bridgeObjectRelease_n();
          unsigned int v114 = v135;
          unsigned int v113 = v123;
        }
        sub_1000491FC(v95, v97);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, void, uint64_t))(v140 + 104))(v113, enum case for OnDemandError.schedulingError(_:), v94);
        GetOnDemandTaskRequestResponse.init(error:)();
        swift_errorRelease();

        (*(void (**)(char *, uint64_t))(v132 + 8))(v114, v133);
        return (*(uint64_t (**)(uint64_t, uint64_t))(v138 + 8))(v56, v136);
      }
    }
  }
}

void sub_100030D50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v312 = a8;
  uint64_t v311 = a7;
  uint64_t v310 = a6;
  uint64_t v309 = a5;
  uint64_t v308 = a4;
  uint64_t v307 = a3;
  uint64_t v306 = a2;
  uint64_t v305 = a1;
  uint64_t v273 = type metadata accessor for URL.DirectoryHint();
  v352 = *(unsigned char **)(v273 - 8);
  __chkstk_darwin(v273);
  v272 = &v254[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = sub_10000E508(&qword_1000655C0);
  __chkstk_darwin(v11 - 8);
  v271 = &v254[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v280 = type metadata accessor for URL();
  uint64_t v351 = *(void *)(v280 - 8);
  uint64_t v13 = __chkstk_darwin(v280);
  uint64_t v15 = &v254[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = __chkstk_darwin(v13);
  v270 = &v254[-v17];
  __chkstk_darwin(v16);
  uint64_t v19 = &v254[-v18];
  uint64_t v314 = type metadata accessor for MLHostTask();
  uint64_t v350 = *(void *)(v314 - 8);
  __chkstk_darwin(v314);
  v282 = &v254[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v21 = sub_10000E508(&qword_1000655E8);
  uint64_t v22 = __chkstk_darwin(v21 - 8);
  v284 = &v254[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v24 = __chkstk_darwin(v22);
  v304 = &v254[-v25];
  __chkstk_darwin(v24);
  v326 = &v254[-v26];
  uint64_t v27 = sub_10000E508(&qword_100065638);
  __chkstk_darwin(v27 - 8);
  v334 = &v254[-((v28 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v29 = type metadata accessor for DynamicTaskSource();
  uint64_t v30 = *(void *)(v29 - 8);
  uint64_t v348 = v29;
  uint64_t v349 = v30;
  __chkstk_darwin(v29);
  v333 = &v254[-((v31 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v347 = type metadata accessor for TaskStatus();
  uint64_t v339 = *(void *)(v347 - 8);
  __chkstk_darwin(v347);
  v332 = &v254[-((v32 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v33 = sub_10000E508(&qword_1000657E8);
  __chkstk_darwin(v33 - 8);
  v303 = &v254[-((v34 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v35 = sub_10000E508(&qword_100065640);
  __chkstk_darwin(v35 - 8);
  v302 = &v254[-((v36 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v331 = type metadata accessor for TaskMetadata();
  uint64_t v37 = *(void *)(v331 - 8);
  __chkstk_darwin(v331);
  v346 = &v254[-((v38 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v325 = type metadata accessor for PushMetadata();
  uint64_t v39 = *(void *)(v325 - 8);
  __chkstk_darwin(v325);
  v324 = &v254[-((v40 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v323 = type metadata accessor for Date();
  v345 = *(void (***)(void, void, void))(v323 - 8);
  __chkstk_darwin(v323);
  v313 = &v254[-((v41 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v316 = sub_10000E508(&qword_1000652E8);
  uint64_t v42 = __chkstk_darwin(v316);
  v269 = &v254[-((v43 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v44 = __chkstk_darwin(v42);
  v287 = &v254[-v45];
  uint64_t v46 = __chkstk_darwin(v44);
  v279 = &v254[-v47];
  uint64_t v48 = __chkstk_darwin(v46);
  v259 = &v254[-v49];
  uint64_t v50 = __chkstk_darwin(v48);
  v268 = &v254[-v51];
  uint64_t v52 = __chkstk_darwin(v50);
  v267 = &v254[-v53];
  uint64_t v54 = __chkstk_darwin(v52);
  v301 = &v254[-v55];
  uint64_t v56 = __chkstk_darwin(v54);
  uint64_t v58 = &v254[-v57];
  uint64_t v59 = __chkstk_darwin(v56);
  v329 = (uint64_t *)&v254[-v60];
  __chkstk_darwin(v59);
  v354 = &v254[-v61];
  uint64_t v62 = sub_10000E508(&qword_1000652E0);
  uint64_t v63 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  v322 = &v254[-((v64 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_100064F68 != -1) {
    swift_once();
  }
  uint64_t v65 = type metadata accessor for Logger();
  uint64_t v66 = sub_100010174(v65, (uint64_t)qword_1000667D0);
  swift_bridgeObjectRetain();
  uint64_t v353 = v66;
  uint64_t v67 = Logger.logObject.getter();
  os_log_type_t v68 = static os_log_type_t.info.getter();
  BOOL v69 = os_log_type_enabled(v67, v68);
  v260 = v15;
  v281 = v19;
  if (v69)
  {
    uint64_t v70 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v70 = 134217984;
    v357[0] = *(id *)(a9 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v67, v68, "Received push notification with %ld messages.", v70, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  uint64_t v71 = *(void *)(a9 + 16);
  unint64_t v72 = v354;
  if (v71)
  {
    uint64_t v321 = *(int *)(v62 + 48);
    uint64_t v300 = OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry;
    uint64_t v73 = a9 + ((*(unsigned __int8 *)(v63 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v63 + 80));
    uint64_t v320 = *(void *)(v63 + 72);
    v319 = (void (**)(unsigned char *, uint64_t))(v345 + 1);
    v299 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v345 + 2);
    v298 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v39 + 16);
    v297 = (void (**)(unsigned char *, void, uint64_t, uint64_t))(v39 + 56);
    unsigned int v296 = enum case for TaskStatus.taskCreated(_:);
    v345 = (void (**)(void, void, void))(v339 + 104);
    unsigned int v344 = enum case for DynamicTaskSource.push(_:);
    v342 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v37 + 16);
    v343 = (void (**)(unsigned char *, void, uint64_t))(v349 + 104);
    v340 = (void (**)(uint64_t, uint64_t))(v349 + 8);
    v341 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v37 + 56);
    v330 = (void (**)(uint64_t, uint64_t))(v339 + 8);
    unsigned int v295 = enum case for TaskStatus.taskReceived(_:);
    v294 = (void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v350 + 56);
    v286 = &v356;
    unsigned int v289 = enum case for TaskStatus.taskFailedToRegister(_:);
    v293 = (void (**)(unsigned char *, uint64_t))(v37 + 8);
    v292 = (void (**)(unsigned char *, uint64_t))(v39 + 8);
    unsigned int v266 = enum case for TaskStatus.taskSuccessfullyRegistered(_:);
    v265 = (void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v351 + 56);
    unsigned int v264 = enum case for URL.DirectoryHint.inferFromPath(_:);
    v263 = (void (**)(unsigned char *, uint64_t, uint64_t))(v352 + 104);
    v262 = (void (**)(unsigned char *, uint64_t))(v352 + 8);
    v278 = (void *)(v351 + 8);
    v256 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v351 + 16);
    unsigned int v255 = enum case for TaskStatus.taskParametersStored(_:);
    v283 = (unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v350 + 48);
    v276 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v350 + 32);
    v275 = (void (**)(unsigned char *, uint64_t))(v350 + 8);
    unsigned int v261 = enum case for TaskStatus.taskParametersFailedToStore(_:);
    uint64_t v318 = a10;
    uint64_t v258 = a9;
    swift_bridgeObjectRetain();
    uint64_t v349 = 0;
    *(void *)&long long v74 = 134218242;
    long long v291 = v74;
    v290 = (char *)&type metadata for Any + 8;
    *(void *)&long long v74 = 136315138;
    long long v288 = v74;
    *(void *)&long long v74 = 136315394;
    long long v285 = v74;
    uint64_t v75 = v313;
    uint64_t v76 = v316;
    v315 = v58;
    uint64_t v77 = v329;
    while (1)
    {
      uint64_t v350 = v73;
      uint64_t v79 = v73;
      id v80 = v322;
      sub_10004A580(v79, (uint64_t)v322, &qword_1000652E0);
      uint64_t v81 = *(void **)&v80[v321];
      sub_100010514((uint64_t)v80, (uint64_t)v72, &qword_1000652E8);
      sub_10004A580((uint64_t)v72, (uint64_t)v77, &qword_1000652E8);
      sub_10004A580((uint64_t)v72, (uint64_t)v58, &qword_1000652E8);
      id v82 = Logger.logObject.getter();
      os_log_type_t v83 = static os_log_type_t.info.getter();
      BOOL v84 = os_log_type_enabled(v82, v83);
      uint64_t v351 = v71;
      if (v84)
      {
        uint64_t v85 = swift_slowAlloc();
        v357[0] = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v85 = v291;
        uint64_t v86 = *v77;
        sub_100010578((uint64_t)v77, &qword_1000652E8);
        *(void *)(v85 + 4) = v86;
        *(_WORD *)(v85 + 12) = 2080;
        uint64_t v87 = TaskDefinition.name.getter();
        *(void *)(v85 + 14) = sub_10000E564(v87, v88, (uint64_t *)v357);
        swift_bridgeObjectRelease();
        sub_100010578((uint64_t)v58, &qword_1000652E8);
        _os_log_impl((void *)&_mh_execute_header, v82, v83, "Received new push message: version: %ld, task: %s", (uint8_t *)v85, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        sub_100010578((uint64_t)v77, &qword_1000652E8);
        sub_100010578((uint64_t)v58, &qword_1000652E8);
      }

      uint64_t v89 = v354;
      os_log_type_t v90 = &v354[*(int *)(v76 + 44)];
      static Date.now.getter();
      char v91 = static Date.> infix(_:_:)();
      uint64_t v92 = v323;
      (*v319)(v75, v323);
      if (v91)
      {
        swift_bridgeObjectRelease();
        uint64_t v93 = v301;
        sub_10004A580((uint64_t)v89, (uint64_t)v301, &qword_1000652E8);
        uint64_t v94 = Logger.logObject.getter();
        os_log_type_t v95 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v94, v95))
        {
          unint64_t v96 = v93;
          uint64_t v97 = swift_slowAlloc();
          v357[0] = (id)swift_slowAlloc();
          *(_DWORD *)uint64_t v97 = v288;
          uint64_t v98 = TaskDefinition.name.getter();
          *(void *)(v97 + 4) = sub_10000E564(v98, v99, (uint64_t *)v357);
          swift_bridgeObjectRelease();
          uint64_t v100 = (uint64_t)v96;
          uint64_t v58 = v315;
          sub_100010578(v100, &qword_1000652E8);
          _os_log_impl((void *)&_mh_execute_header, v94, v95, "Push task cannot be registered before created, task name: %s.", (uint8_t *)v97, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          sub_100010578((uint64_t)v93, &qword_1000652E8);
        }
        sub_100010578((uint64_t)v89, &qword_1000652E8);
        uint64_t v77 = v329;
        unint64_t v72 = v89;
        uint64_t v78 = v350;
        goto LABEL_10;
      }
      v317 = v81;
      (*v299)(v75, v90, v92);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v101 = v324;
      PushMetadata.init(topic:channelID:pushType:pushPriority:creationDate:)();
      uint64_t v102 = v302;
      uint64_t v103 = v325;
      (*v298)(v302, v101, v325);
      (*v297)(v102, 0, 1, v103);
      uint64_t v104 = type metadata accessor for PullMetadata();
      (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v104 - 8) + 56))(v303, 1, 1, v104);
      id v105 = v346;
      TaskMetadata.init(pushMetadata:pullMetadata:)();
      uint64_t v339 = *(void *)(v318 + v300);
      v352 = &v89[*(int *)(v76 + 48)];
      uint64_t v106 = TaskDefinition.name.getter();
      unint64_t v108 = v107;
      v335 = (void (*)(unsigned char *, void, uint64_t))*v345;
      uint64_t v109 = (uint64_t)v332;
      uint64_t v110 = v347;
      v335(v332, v296, v347);
      v336 = *v343;
      uint64_t v111 = (uint64_t)v333;
      uint64_t v112 = v348;
      v336(v333, v344, v348);
      v337 = *v342;
      uint64_t v113 = (uint64_t)v334;
      unsigned int v114 = v105;
      uint64_t v115 = v331;
      v337(v334, v114, v331);
      v338 = *v341;
      v338(v113, 0, 1, v115);
      sub_10001994C(v106, v108, v109, v111, v113);
      swift_bridgeObjectRelease();
      sub_100010578(v113, &qword_100065638);
      uint64_t v116 = *v340;
      (*v340)(v111, v112);
      uint64_t v117 = *v330;
      (*v330)(v109, v110);
      uint64_t v118 = TaskDefinition.name.getter();
      unint64_t v120 = v119;
      v335((unsigned char *)v109, v295, v110);
      uint64_t v121 = v348;
      v336((unsigned char *)v111, v344, v348);
      v337((unsigned char *)v113, v346, v115);
      v338(v113, 0, 1, v115);
      sub_10001994C(v118, v120, v109, v111, v113);
      swift_bridgeObjectRelease();
      sub_100010578(v113, &qword_100065638);
      v327 = v116;
      v116(v111, v121);
      v328 = v117;
      v117(v109, v347);
      uint64_t v122 = v326;
      uint64_t v123 = v314;
      (*v294)(v326, 1, 1, v314);
      uint64_t v124 = v304;
      uint64_t v125 = v349;
      sub_10002BC94((uint64_t)v352, v304);
      uint64_t v349 = v125;
      if (v125)
      {
        swift_bridgeObjectRelease();
        uint64_t v126 = v287;
        sub_10004A580((uint64_t)v354, (uint64_t)v287, &qword_1000652E8);
        swift_errorRetain();
        swift_errorRetain();
        uint64_t v127 = Logger.logObject.getter();
        os_log_type_t v128 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v127, v128))
        {
          uint64_t v129 = swift_slowAlloc();
          uint64_t v130 = (void *)swift_slowAlloc();
          v317 = (void *)swift_slowAlloc();
          v357[0] = v317;
          *(_DWORD *)uint64_t v129 = v285;
          uint64_t v131 = TaskDefinition.name.getter();
          uint64_t v355 = sub_10000E564(v131, v132, (uint64_t *)v357);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          sub_100010578((uint64_t)v126, &qword_1000652E8);
          *(_WORD *)(v129 + 12) = 2112;
          swift_errorRetain();
          uint64_t v133 = _swift_stdlib_bridgeErrorToNSError();
          uint64_t v355 = v133;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          void *v130 = v133;
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl((void *)&_mh_execute_header, v127, v128, "Failed to register push task %s. Error: %@", (uint8_t *)v129, 0x16u);
          sub_10000E508(&qword_100065290);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          sub_100010578((uint64_t)v126, &qword_1000652E8);
          swift_errorRelease();
          swift_errorRelease();
        }

        uint64_t v78 = v350;
        uint64_t v136 = TaskDefinition.name.getter();
        unint64_t v138 = v137;
        uint64_t v139 = (uint64_t)v332;
        uint64_t v140 = v347;
        v335(v332, v289, v347);
        uint64_t v141 = (uint64_t)v333;
        uint64_t v142 = v348;
        v336(v333, v344, v348);
        uint64_t v143 = (uint64_t)v334;
        uint64_t v144 = v346;
        uint64_t v145 = v331;
        v337(v334, v346, v331);
        v338(v143, 0, 1, v145);
        sub_10001994C(v136, v138, v139, v141, v143);
        swift_bridgeObjectRelease();
        swift_errorRelease();
        sub_100010578(v143, &qword_100065638);
        v327(v141, v142);
        v328(v139, v140);
        sub_100010578((uint64_t)v326, &qword_1000655E8);
        (*v293)(v144, v145);
        (*v292)(v324, v325);
        unint64_t v72 = v354;
        sub_100010578((uint64_t)v354, &qword_1000652E8);
        uint64_t v349 = 0;
        goto LABEL_49;
      }
      sub_100010578((uint64_t)v122, &qword_1000655E8);
      sub_100010514((uint64_t)v124, (uint64_t)v122, &qword_1000655E8);
      uint64_t v134 = v284;
      sub_10004A580((uint64_t)v122, (uint64_t)v284, &qword_1000655E8);
      if ((*v283)(v134, 1, v123) == 1) {
        break;
      }
      uint64_t v146 = v282;
      (*v276)(v282, v134, v123);
      uint64_t v147 = MLHostTask.taskFolder.getter();
      uint64_t v135 = v354;
      if (!v148)
      {
        (*v275)(v146, v123);
        swift_bridgeObjectRelease();
        goto LABEL_28;
      }
      os_log_t v274 = v148;
      v277 = (void (*)(unsigned char *, uint64_t))v147;
      uint64_t v149 = v267;
      sub_10004A580((uint64_t)v354, (uint64_t)v267, &qword_1000652E8);
      uint64_t v150 = Logger.logObject.getter();
      os_log_type_t v151 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v150, v151))
      {
        uint64_t v152 = (uint8_t *)swift_slowAlloc();
        v357[0] = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v152 = v288;
        uint64_t v153 = TaskDefinition.name.getter();
        uint64_t v355 = sub_10000E564(v153, v154, (uint64_t *)v357);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        sub_100010578((uint64_t)v149, &qword_1000652E8);
        _os_log_impl((void *)&_mh_execute_header, v150, v151, "Task %s is successfully registered via push message.", v152, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        sub_100010578((uint64_t)v149, &qword_1000652E8);
      }

      uint64_t v171 = TaskDefinition.name.getter();
      unint64_t v173 = v172;
      uint64_t v174 = (uint64_t)v332;
      uint64_t v175 = v347;
      v335(v332, v266, v347);
      uint64_t v176 = (uint64_t)v333;
      uint64_t v177 = v348;
      v336(v333, v344, v348);
      uint64_t v178 = (uint64_t)v334;
      uint64_t v179 = v331;
      v337(v334, v346, v331);
      v338(v178, 0, 1, v179);
      sub_10001994C(v171, v173, v174, v176, v178);
      swift_bridgeObjectRelease();
      sub_100010578(v178, &qword_100065638);
      v327(v176, v177);
      v328(v174, v175);
      uint64_t v180 = v280;
      (*v265)(v271, 1, 1, v280);
      v181 = *v263;
      v182 = v272;
      uint64_t v183 = v264;
      uint64_t v184 = v273;
      (*v263)(v272, v264, v273);
      v185 = v270;
      URL.init(filePath:directoryHint:relativeTo:)();
      v357[0] = (id)0x6574656D61726170;
      v357[1] = (id)0xEF6E6F736A2E7372;
      v181(v182, v183, v184);
      sub_100024B80();
      v186 = v281;
      URL.appending<A>(path:directoryHint:)();
      (*v262)(v182, v184);
      swift_bridgeObjectRelease();
      v187 = (void (*)(unsigned char *, uint64_t))*v278;
      ((void (*)(unsigned char *, uint64_t))*v278)(v185, v180);
      v188 = v354;
      v189 = v268;
      sub_10004A580((uint64_t)v354, (uint64_t)v268, &qword_1000652E8);
      swift_bridgeObjectRetain_n();
      v190 = Logger.logObject.getter();
      os_log_type_t v191 = static os_log_type_t.debug.getter();
      int v192 = v191;
      BOOL v193 = os_log_type_enabled(v190, v191);
      v277 = v187;
      if (v193)
      {
        uint64_t v194 = swift_slowAlloc();
        os_log_t v274 = (os_log_t)swift_slowAlloc();
        v357[0] = v274;
        *(_DWORD *)uint64_t v194 = v285;
        int v257 = v192;
        uint64_t v195 = TaskDefinition.name.getter();
        uint64_t v355 = sub_10000E564(v195, v196, (uint64_t *)v357);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        sub_100010578((uint64_t)v189, &qword_1000652E8);
        *(_WORD *)(v194 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v197 = Dictionary.description.getter();
        unint64_t v199 = v198;
        swift_bridgeObjectRelease();
        uint64_t v200 = v197;
        v186 = v281;
        uint64_t v355 = sub_10000E564(v200, v199, (uint64_t *)v357);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v190, (os_log_type_t)v257, "Task %s parameters %s", (uint8_t *)v194, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        v188 = v354;
        swift_slowDealloc();
      }
      else
      {
        sub_100010578((uint64_t)v189, &qword_1000652E8);

        swift_bridgeObjectRelease_n();
      }
      uint64_t v201 = (uint64_t)v269;
      v202 = self;
      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      v357[0] = 0;
      id v204 = [v202 dataWithJSONObject:isa options:1 error:v357];

      id v205 = v357[0];
      if (v204)
      {
        v206 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v208 = v207;

        v209 = (void *)v349;
        Data.write(to:options:)();
        if (!v209)
        {
          v317 = (void *)v208;
          v231 = v259;
          sub_10004A580((uint64_t)v188, (uint64_t)v259, &qword_1000652E8);
          v232 = v186;
          v233 = v260;
          uint64_t v234 = v280;
          (*v256)(v260, v232, v280);
          v235 = Logger.logObject.getter();
          os_log_type_t v236 = static os_log_type_t.debug.getter();
          int v237 = v236;
          BOOL v238 = os_log_type_enabled(v235, v236);
          uint64_t v349 = 0;
          os_log_t v274 = v206;
          if (v238)
          {
            uint64_t v239 = swift_slowAlloc();
            v357[0] = (id)swift_slowAlloc();
            *(_DWORD *)uint64_t v239 = v285;
            int v257 = v237;
            uint64_t v240 = TaskDefinition.name.getter();
            uint64_t v355 = sub_10000E564(v240, v241, (uint64_t *)v357);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            sub_100010578((uint64_t)v231, &qword_1000652E8);
            *(_WORD *)(v239 + 12) = 2080;
            sub_100049750(&qword_1000655E0, (void (*)(uint64_t))&type metadata accessor for URL);
            uint64_t v242 = dispatch thunk of CustomStringConvertible.description.getter();
            uint64_t v355 = sub_10000E564(v242, v243, (uint64_t *)v357);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            v277(v233, v234);
            _os_log_impl((void *)&_mh_execute_header, v235, (os_log_type_t)v257, "Task %s parameters are stored at: %s", (uint8_t *)v239, 0x16u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
            sub_100010578((uint64_t)v231, &qword_1000652E8);
            v277(v233, v234);
          }

          uint64_t v78 = v350;
          uint64_t v244 = TaskDefinition.name.getter();
          unint64_t v246 = v245;
          uint64_t v247 = (uint64_t)v332;
          uint64_t v248 = v347;
          v335(v332, v255, v347);
          uint64_t v249 = (uint64_t)v333;
          uint64_t v250 = v348;
          v336(v333, v344, v348);
          uint64_t v251 = (uint64_t)v334;
          v252 = v346;
          uint64_t v253 = v331;
          v337(v334, v346, v331);
          v338(v251, 0, 1, v253);
          sub_10001994C(v244, v246, v247, v249, v251);
          swift_bridgeObjectRelease();
          sub_100010270((uint64_t)v274, (unint64_t)v317);
          sub_100010578(v251, &qword_100065638);
          v327(v249, v250);
          v328(v247, v248);
          v277(v281, v280);
          (*v275)(v282, v314);
          sub_100010578((uint64_t)v326, &qword_1000655E8);
          (*v293)(v252, v253);
          goto LABEL_48;
        }
        sub_100010270((uint64_t)v206, v208);
        v210 = v209;
      }
      else
      {
        v211 = v205;
        v210 = (void *)_convertNSErrorToError(_:)();

        swift_willThrow();
      }
      sub_10004A580((uint64_t)v188, v201, &qword_1000652E8);
      swift_errorRetain();
      swift_errorRetain();
      v212 = Logger.logObject.getter();
      os_log_type_t v213 = static os_log_type_t.error.getter();
      BOOL v214 = os_log_type_enabled(v212, v213);
      uint64_t v349 = 0;
      v317 = v210;
      if (v214)
      {
        uint64_t v215 = swift_slowAlloc();
        v216 = (void *)swift_slowAlloc();
        v357[0] = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v215 = v285;
        os_log_t v274 = v212;
        uint64_t v217 = TaskDefinition.name.getter();
        uint64_t v355 = sub_10000E564(v217, v218, (uint64_t *)v357);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        sub_100010578(v201, &qword_1000652E8);
        *(_WORD *)(v215 + 12) = 2112;
        swift_errorRetain();
        uint64_t v219 = _swift_stdlib_bridgeErrorToNSError();
        uint64_t v355 = v219;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        void *v216 = v219;
        swift_errorRelease();
        swift_errorRelease();
        os_log_t v220 = v274;
        _os_log_impl((void *)&_mh_execute_header, v274, v213, "Failed at storing parameters for pushed task %s, with error: %@", (uint8_t *)v215, 0x16u);
        sub_10000E508(&qword_100065290);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        sub_100010578(v201, &qword_1000652E8);
        swift_errorRelease();
        swift_errorRelease();
      }
      uint64_t v78 = v350;
      uint64_t v221 = TaskDefinition.name.getter();
      unint64_t v223 = v222;
      uint64_t v224 = (uint64_t)v332;
      uint64_t v225 = v347;
      v335(v332, v261, v347);
      uint64_t v226 = (uint64_t)v333;
      uint64_t v227 = v348;
      v336(v333, v344, v348);
      uint64_t v228 = (uint64_t)v334;
      v229 = v346;
      uint64_t v230 = v331;
      v337(v334, v346, v331);
      v338(v228, 0, 1, v230);
      sub_10001994C(v221, v223, v224, v226, v228);
      swift_bridgeObjectRelease();
      swift_errorRelease();
      sub_100010578(v228, &qword_100065638);
      v327(v226, v227);
      v328(v224, v225);
      v277(v281, v280);
      (*v275)(v282, v314);
      sub_100010578((uint64_t)v326, &qword_1000655E8);
      (*v293)(v229, v230);
LABEL_48:
      (*v292)(v324, v325);
      unint64_t v72 = v354;
      sub_100010578((uint64_t)v354, &qword_1000652E8);
LABEL_49:
      uint64_t v75 = v313;
      uint64_t v76 = v316;
      uint64_t v58 = v315;
      uint64_t v77 = v329;
LABEL_10:
      uint64_t v73 = v78 + v320;
      uint64_t v71 = v351 - 1;
      if (v351 == 1)
      {
        swift_bridgeObjectRelease();
        return;
      }
    }
    swift_bridgeObjectRelease();
    sub_100010578((uint64_t)v134, &qword_1000655E8);
    uint64_t v135 = v354;
LABEL_28:
    uint64_t v155 = v279;
    sub_10004A580((uint64_t)v135, (uint64_t)v279, &qword_1000652E8);
    uint64_t v156 = Logger.logObject.getter();
    os_log_type_t v157 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v156, v157))
    {
      unint64_t v158 = (uint8_t *)swift_slowAlloc();
      v357[0] = (id)swift_slowAlloc();
      *(_DWORD *)unint64_t v158 = v288;
      uint64_t v159 = TaskDefinition.name.getter();
      uint64_t v355 = sub_10000E564(v159, v160, (uint64_t *)v357);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_100010578((uint64_t)v155, &qword_1000652E8);
      _os_log_impl((void *)&_mh_execute_header, v156, v157, "Failed to fetch task folder for pushed task %s. Skipping task.", v158, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_100010578((uint64_t)v155, &qword_1000652E8);
    }

    uint64_t v78 = v350;
    uint64_t v161 = TaskDefinition.name.getter();
    unint64_t v163 = v162;
    uint64_t v164 = (uint64_t)v332;
    uint64_t v165 = v347;
    v335(v332, v289, v347);
    uint64_t v166 = (uint64_t)v333;
    uint64_t v167 = v348;
    v336(v333, v344, v348);
    uint64_t v168 = (uint64_t)v334;
    v169 = v346;
    uint64_t v170 = v331;
    v337(v334, v346, v331);
    v338(v168, 0, 1, v170);
    sub_10001994C(v161, v163, v164, v166, v168);
    swift_bridgeObjectRelease();
    sub_100010578(v168, &qword_100065638);
    v327(v166, v167);
    v328(v164, v165);
    sub_100010578((uint64_t)v326, &qword_1000655E8);
    (*v293)(v169, v170);
    goto LABEL_48;
  }
}

id sub_100033874(void *a1, uint64_t a2)
{
  if (qword_100064F68 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100010174(v4, (uint64_t)qword_1000667D0);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.info.getter();
  uint64_t v7 = (void *)&loc_10004C000;
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    sub_10000E564(0xD00000000000001DLL, 0x80000001000560F0, aBlock);
    uint64_t v7 = &loc_10004C000;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Daemon performing %s activity.", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  aBlock[4] = (uint64_t)nullsub_1;
  aBlock[5] = 0;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100027B5C;
  aBlock[3] = (uint64_t)&unk_100062048;
  uint64_t v9 = _Block_copy(aBlock);
  [a1 setExpirationHandler:v9];
  _Block_release(v9);
  if (*(unsigned char *)(a2 + 16) == 1) {
    sub_100014B6C();
  }
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = v7[230];
    sub_10000E564(0xD00000000000001DLL, 0x80000001000560F0, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Daemon completed %s activity.", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return [a1 setTaskCompleted];
}

void sub_100033BB0(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CoreAnalyticsEvents();
  uint64_t v78 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  os_log_type_t v6 = (char *)&v76 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Calendar();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  BOOL v84 = (char *)&v76 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = type metadata accessor for Date();
  uint64_t v83 = *(void *)(v89 - 8);
  uint64_t v10 = __chkstk_darwin(v89);
  unint64_t v88 = (char *)&v76 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  id v82 = (char *)&v76 - v13;
  __chkstk_darwin(v12);
  char v91 = (char *)&v76 - v14;
  unint64_t v99 = nullsub_1;
  uint64_t v100 = 0;
  aBos_unfair_lock_t lock = (uint64_t)_NSConcreteStackBlock;
  uint64_t v96 = 1107296256;
  uint64_t v97 = sub_100027B5C;
  uint64_t v98 = &unk_100061FD0;
  uint64_t v15 = _Block_copy(&aBlock);
  [a1 setExpirationHandler:v15];
  _Block_release(v15);
  if (qword_100064F68 != -1) {
    swift_once();
  }
  uint64_t v16 = type metadata accessor for Logger();
  uint64_t v17 = sub_100010174(v16, (uint64_t)qword_1000667D0);
  swift_retain();
  uint64_t v93 = v17;
  uint64_t v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.info.getter();
  BOOL v20 = os_log_type_enabled(v18, v19);
  uint64_t v79 = v4;
  id v80 = a1;
  uint64_t v77 = v6;
  uint64_t v85 = v8;
  uint64_t v86 = v7;
  if (v20)
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v21 = 134217984;
    uint64_t v22 = *(void *)(a2 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
    uint64_t v23 = (os_unfair_lock_s *)(*(void *)(v22 + 56) + 16);
    os_unfair_lock_lock(v23);
    swift_beginAccess();
    uint64_t v24 = *(void *)(*(void *)(v22 + 64) + 16);
    os_unfair_lock_unlock(v23);
    aBos_unfair_lock_t lock = v24;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "MLHostDaemon: TaskRegistry has %ld tasks before pruning.", v21, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    swift_release();
  }
  uint64_t v81 = a2;
  uint64_t v90 = *(void *)(a2 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
  uint64_t v87 = sub_100015EEC();
  uint64_t v26 = *((void *)v87 + 2);
  if (v26)
  {
    uint64_t v27 = (unint64_t *)(v87 + 40);
    *(void *)&long long v25 = 136315138;
    long long v92 = v25;
    do
    {
      uint64_t v29 = *(v27 - 1);
      unint64_t v28 = *v27;
      swift_bridgeObjectRetain_n();
      uint64_t v30 = Logger.logObject.getter();
      os_log_type_t v31 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v32 = swift_slowAlloc();
        aBos_unfair_lock_t lock = swift_slowAlloc();
        *(_DWORD *)uint64_t v32 = v92;
        swift_bridgeObjectRetain();
        *(void *)(v32 + 4) = sub_10000E564(v29, v28, &aBlock);
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v30, v31, "Unregistering task %s because it was pruned.", (uint8_t *)v32, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v27 += 2;
      sub_1000491FC(v29, v28);
      swift_bridgeObjectRelease();
      --v26;
    }
    while (v26);
  }
  swift_bridgeObjectRelease();
  swift_retain();
  uint64_t v33 = Logger.logObject.getter();
  os_log_type_t v34 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v35 = 134217984;
    uint64_t v36 = v90;
    uint64_t v37 = (os_unfair_lock_s *)(*(void *)(v90 + 56) + 16);
    os_unfair_lock_lock(v37);
    swift_beginAccess();
    uint64_t v38 = *(void *)(*(void *)(v36 + 64) + 16);
    os_unfair_lock_unlock(v37);
    aBos_unfair_lock_t lock = v38;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "MLHostDaemon: TaskRegistry has %ld tasks after pruning.", v35, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    swift_release();
    uint64_t v36 = v90;
  }
  uint64_t v39 = (os_unfair_lock_s *)(*(void *)(v36 + 56) + 16);
  os_unfair_lock_lock(v39);
  swift_beginAccess();
  uint64_t v40 = swift_bridgeObjectRetain();
  uint64_t v41 = sub_100037EE0(v40);
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v39);
  uint64_t v42 = sub_1000383C8((uint64_t)v41);
  swift_release();
  swift_bridgeObjectRetain();
  sub_100023D0C(v36, v42);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRetain();
  uint64_t v43 = Logger.logObject.getter();
  os_log_type_t v44 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v43, v44))
  {
    uint64_t v45 = (uint8_t *)swift_slowAlloc();
    aBos_unfair_lock_t lock = swift_slowAlloc();
    *(_DWORD *)uint64_t v45 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v46 = Array.description.getter();
    unint64_t v48 = v47;
    swift_bridgeObjectRelease();
    uint64_t v94 = sub_10000E564(v46, v48, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v43, v44, "MLHostDaemon: pruned orphaned taskFolders: %s", v45, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v50 = v85;
  uint64_t v49 = v86;
  uint64_t v51 = v84;
  uint64_t v52 = Logger.logObject.getter();
  os_log_type_t v53 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v52, v53))
  {
    uint64_t v54 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v54 = 0;
    _os_log_impl((void *)&_mh_execute_header, v52, v53, "MLHostDaemon: sending device telemetry", v54, 2u);
    swift_slowDealloc();
  }

  static Calendar.current.getter();
  uint64_t v55 = v82;
  static Date.now.getter();
  uint64_t v56 = v91;
  Calendar.startOfDay(for:)();
  uint64_t v57 = v83;
  uint64_t v58 = *(void (**)(char *, uint64_t))(v83 + 8);
  uint64_t v59 = v89;
  v58(v55, v89);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v51, v49);
  (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v55, v56, v59);
  Date.init(timeInterval:since:)();
  sub_10000E508(&qword_1000657C8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10004CA90;
  *(void *)(inited + 32) = 0x49747865746E6F63;
  *(void *)(inited + 40) = 0xE900000000000064;
  sub_100010330(0, &qword_1000657D0);
  *(void *)(inited + 48) = NSString.init(stringLiteral:)();
  *(void *)(inited + 56) = 0x756F43736B736174;
  *(void *)(inited + 64) = 0xEA0000000000746ELL;
  uint64_t v61 = (os_unfair_lock_s *)(*(void *)(v90 + 56) + 16);
  os_unfair_lock_lock(v61);
  os_unfair_lock_unlock(v61);
  *(NSNumber *)(inited + 72) = Int._bridgeToObjectiveC()();
  *(void *)(inited + 80) = 0x6E7552736B736174;
  *(void *)(inited + 88) = 0xE800000000000000;
  sub_100010330(0, &qword_100065628);
  *(NSNumber *)(inited + 96) = NSNumber.init(integerLiteral:)(-1);
  strcpy((char *)(inited + 104), "tasksDeferred");
  *(_WORD *)(inited + 118) = -4864;
  *(NSNumber *)(inited + 120) = NSNumber.init(integerLiteral:)(-1);
  *(void *)(inited + 128) = 0x696146736B736174;
  *(void *)(inited + 136) = 0xEB0000000064656CLL;
  *(NSNumber *)(inited + 144) = NSNumber.init(integerLiteral:)(-1);
  strcpy((char *)(inited + 152), "tasksCompleted");
  *(unsigned char *)(inited + 167) = -18;
  *(NSNumber *)(inited + 168) = NSNumber.init(integerLiteral:)(-1);
  *(void *)(inited + 176) = 0x745374656B637562;
  *(void *)(inited + 184) = 0xEB00000000747261;
  Date.timeIntervalSince1970.getter();
  if ((~*(void *)&v62 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (v62 <= -9.22337204e18)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (v62 >= 9.22337204e18)
  {
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  id v63 = [objc_allocWithZone((Class)NSNumber) initWithLongLong:(uint64_t)v62];
  id v64 = [v63 stringValue];

  if (!v64)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  *(void *)(inited + 192) = v64;
  *(void *)(inited + 200) = 0x6E4574656B637562;
  *(void *)(inited + 208) = 0xE900000000000064;
  Date.timeIntervalSince1970.getter();
  if ((~*(void *)&v65 & 0x7FF0000000000000) == 0) {
    goto LABEL_32;
  }
  if (v65 <= -9.22337204e18)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  if (v65 >= 9.22337204e18)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  id v66 = [objc_allocWithZone((Class)NSNumber) initWithLongLong:(uint64_t)v65];
  id v67 = [v66 stringValue];

  if (v67)
  {
    *(void *)(inited + 216) = v67;
    unint64_t v68 = sub_1000260A0(inited);
    uint64_t v70 = v77;
    uint64_t v69 = v78;
    uint64_t v71 = v79;
    (*(void (**)(char *, void, uint64_t))(v78 + 104))(v77, enum case for CoreAnalyticsEvents.deviceStatusTelemetry(_:), v79);
    CoreAnalyticsEvents.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v69 + 8))(v70, v71);
    NSString v72 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    uint64_t v73 = swift_allocObject();
    *(void *)(v73 + 16) = v68;
    unint64_t v99 = sub_100049748;
    uint64_t v100 = v73;
    aBos_unfair_lock_t lock = (uint64_t)_NSConcreteStackBlock;
    uint64_t v96 = 1107296256;
    uint64_t v97 = sub_1000348EC;
    uint64_t v98 = &unk_100062020;
    long long v74 = _Block_copy(&aBlock);
    swift_release();
    AnalyticsSendEventLazy();
    _Block_release(v74);

    [v80 setTaskCompleted];
    uint64_t v75 = v89;
    v58(v88, v89);
    v58(v91, v75);
    return;
  }
LABEL_36:
  __break(1u);
}

Class sub_1000348EC(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_100010330(0, &qword_1000657D8);
    v4.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.Class isa = 0;
  }

  return v4.super.isa;
}

uint64_t sub_100034988()
{
  swift_bridgeObjectRelease();

  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_config;
  uint64_t v2 = type metadata accessor for MLHostConfig();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_100034A70()
{
  return type metadata accessor for MLHostDaemon();
}

uint64_t type metadata accessor for MLHostDaemon()
{
  uint64_t result = qword_100065708;
  if (!qword_100065708) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100034AC4()
{
  uint64_t result = type metadata accessor for MLHostConfig();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t *sub_100034B88(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100034BEC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100034BFC()
{
  return swift_release();
}

uint64_t sub_100034C04(uint64_t a1)
{
  return sub_10002C55C(a1, v1);
}

void sub_100034C0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_100030D50(a1, a2, a3, a4, a5, a6, a7, a8, a9, v9);
}

uint64_t sub_100034C34()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100034C6C(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  return (*(uint64_t (**)(void, void, void, void, void, void, void, void, void))(v5 + 16))(*a1, a1[1], *a2, a2[1], *a3, a3[1], *a4, a4[1], *a5);
}

uint64_t sub_100034CC8(uint64_t a1, int *a2)
{
  os_log_type_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100034DA4;
  return v6(a1);
}

uint64_t sub_100034DA4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_100034E9C(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_100034FEC(a1, a2, v4);
}

unint64_t sub_100034F14(uint64_t a1)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();

  return sub_1000350D0(a1, v2);
}

unint64_t sub_100034FA8(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_100035248(a1, v4);
}

unint64_t sub_100034FEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
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
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1000350D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
    if (v6 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v15 = v14;
          if (v13 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v15 == v16) {
            break;
          }
          char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_100035248(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10004A5E4(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_1000103C0((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100035310(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      char v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_100037244(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1000354C0(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = __CocoaSet.member(for:)();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_100010330(0, &qword_100065828);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = __CocoaSet.count.getter();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_100036A48(v7, result + 1);
    unint64_t v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_100036F20();
      uint64_t v23 = v28;
    }
    else
    {
      uint64_t v23 = (void *)v22;
      id v24 = v8;
    }
    sub_1000371C0((uint64_t)v8, v23);
    *uint64_t v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = NSObject._rawHashValue(seed:)(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      sub_100010330(0, &qword_100065828);
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = static NSObject.== infix(_:_:)();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        BOOL v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
        *a1 = v20;
        id v21 = v20;
        return 0;
      }
      uint64_t v17 = ~v13;
      while (1)
      {
        unint64_t v14 = (v14 + 1) & v17;
        if (((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
        char v19 = static NSObject.== infix(_:_:)();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    id v8 = a2;
    sub_1000373E0((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_100035760(uint64_t a1, char a2)
{
  return sub_100036190(a1, a2, &qword_100065690);
}

uint64_t sub_10003576C(uint64_t a1, int a2)
{
  return sub_10003578C(a1, a2, (uint64_t (*)(void))&type metadata accessor for TaskDefinition, &qword_100065678);
}

uint64_t sub_10003578C(uint64_t a1, int a2, uint64_t (*a3)(void), uint64_t *a4)
{
  uint64_t v6 = v4;
  uint64_t v52 = a3(0);
  uint64_t v8 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  uint64_t v51 = (char *)&v44 - v9;
  uint64_t v10 = *v4;
  sub_10000E508(a4);
  int v50 = a2;
  uint64_t v11 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v12 = v11;
  if (!*(void *)(v10 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v10 + 32);
  uint64_t v14 = *(void *)(v10 + 64);
  unint64_t v47 = (void *)(v10 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  uint64_t v45 = v4;
  int64_t v46 = (unint64_t)(v13 + 63) >> 6;
  unint64_t v48 = (void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v49 = v8;
  uint64_t v17 = (void (**)(char *, uint64_t, uint64_t))(v8 + 32);
  uint64_t v18 = v11 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  while (1)
  {
    if (v16)
    {
      unint64_t v23 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v24 = v23 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v25 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v46) {
      break;
    }
    id v26 = v47;
    unint64_t v27 = v47[v25];
    ++v20;
    if (!v27)
    {
      int64_t v20 = v25 + 1;
      if (v25 + 1 >= v46) {
        goto LABEL_34;
      }
      unint64_t v27 = v47[v20];
      if (!v27)
      {
        int64_t v28 = v25 + 2;
        if (v28 >= v46)
        {
LABEL_34:
          swift_release();
          uint64_t v6 = v45;
          if ((v50 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v27 = v47[v28];
        if (!v27)
        {
          while (1)
          {
            int64_t v20 = v28 + 1;
            if (__OFADD__(v28, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v46) {
              goto LABEL_34;
            }
            unint64_t v27 = v47[v20];
            ++v28;
            if (v27) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v28;
      }
    }
LABEL_21:
    unint64_t v16 = (v27 - 1) & v27;
    unint64_t v24 = __clz(__rbit64(v27)) + (v20 << 6);
LABEL_22:
    uint64_t v29 = *(void *)(v10 + 56);
    uint64_t v30 = v10;
    os_log_type_t v31 = (uint64_t *)(*(void *)(v10 + 48) + 16 * v24);
    uint64_t v32 = *v31;
    uint64_t v33 = v31[1];
    uint64_t v34 = *(void *)(v49 + 72);
    uint64_t v35 = v29 + v34 * v24;
    if (v50)
    {
      (*v17)(v51, v35, v52);
    }
    else
    {
      (*v48)(v51, v35, v52);
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v36 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v37 = result & ~v36;
    unint64_t v38 = v37 >> 6;
    if (((-1 << v37) & ~*(void *)(v18 + 8 * (v37 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v37) & ~*(void *)(v18 + 8 * (v37 >> 6)))) | v37 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v39 = 0;
      unint64_t v40 = (unint64_t)(63 - v36) >> 6;
      do
      {
        if (++v38 == v40 && (v39 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v41 = v38 == v40;
        if (v38 == v40) {
          unint64_t v38 = 0;
        }
        v39 |= v41;
        uint64_t v42 = *(void *)(v18 + 8 * v38);
      }
      while (v42 == -1);
      unint64_t v21 = __clz(__rbit64(~v42)) + (v38 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    Swift::Int v22 = (void *)(*(void *)(v12 + 48) + 16 * v21);
    void *v22 = v32;
    v22[1] = v33;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 56) + v34 * v21, v51, v52);
    ++*(void *)(v12 + 16);
    uint64_t v10 = v30;
  }
  swift_release();
  uint64_t v6 = v45;
  id v26 = v47;
  if ((v50 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v43 = 1 << *(unsigned char *)(v10 + 32);
  if (v43 >= 64) {
    bzero(v26, ((unint64_t)(v43 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *id v26 = -1 << v43;
  }
  *(void *)(v10 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v6 = v12;
  return result;
}

uint64_t sub_100035B78(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000E508(&qword_100065618);
  char v6 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v8 = v7;
  if (*(void *)(v5 + 16))
  {
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v36 = (void *)(v5 + 64);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = v7 + 64;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v21 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v22 = v21 | (v14 << 6);
      }
      else
      {
        int64_t v23 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v23 >= v35) {
          goto LABEL_33;
        }
        unint64_t v24 = v36[v23];
        ++v14;
        if (!v24)
        {
          int64_t v14 = v23 + 1;
          if (v23 + 1 >= v35) {
            goto LABEL_33;
          }
          unint64_t v24 = v36[v14];
          if (!v24)
          {
            int64_t v25 = v23 + 2;
            if (v25 >= v35)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if (v6)
              {
                uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
                if (v34 >= 64) {
                  bzero(v36, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v36 = -1 << v34;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v24 = v36[v25];
            if (!v24)
            {
              while (1)
              {
                int64_t v14 = v25 + 1;
                if (__OFADD__(v25, 1)) {
                  goto LABEL_40;
                }
                if (v14 >= v35) {
                  goto LABEL_33;
                }
                unint64_t v24 = v36[v14];
                ++v25;
                if (v24) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v14 = v25;
          }
        }
LABEL_30:
        unint64_t v11 = (v24 - 1) & v24;
        unint64_t v22 = __clz(__rbit64(v24)) + (v14 << 6);
      }
      uint64_t v30 = 16 * v22;
      os_log_type_t v31 = (uint64_t *)(*(void *)(v5 + 48) + v30);
      uint64_t v33 = *v31;
      uint64_t v32 = v31[1];
      long long v37 = *(_OWORD *)(*(void *)(v5 + 56) + v30);
      if ((v6 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_retain();
      }
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
      unint64_t v16 = result & ~v15;
      unint64_t v17 = v16 >> 6;
      if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v28 = v17 == v27;
          if (v17 == v27) {
            unint64_t v17 = 0;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v12 + 8 * v17);
        }
        while (v29 == -1);
        unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
      }
      *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      uint64_t v19 = 16 * v18;
      int64_t v20 = (void *)(*(void *)(v8 + 48) + v19);
      *int64_t v20 = v33;
      v20[1] = v32;
      *(_OWORD *)(*(void *)(v8 + 56) + v19) = v37;
      ++*(void *)(v8 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v8;
  return result;
}

uint64_t sub_100035E84(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000E508(&qword_100065688);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      unint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      unint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_100010414(v24, v35);
      }
      else
      {
        sub_1000101FC((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *uint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_100010414(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_100036184(uint64_t a1, char a2)
{
  return sub_100036190(a1, a2, &qword_100065660);
}

uint64_t sub_100036190(uint64_t a1, char a2, uint64_t *a3)
{
  unint64_t v4 = v3;
  uint64_t v6 = *v3;
  sub_10000E508(a3);
  char v37 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16)) {
    goto LABEL_40;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v36 = v6 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & *(void *)(v6 + 64);
  int64_t v35 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v35) {
      break;
    }
    uint64_t v23 = (void *)(v6 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_33:
          swift_release();
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v35) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    BOOL v30 = (uint64_t *)(*(void *)(v6 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(*(void *)(v6 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v15 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    void *v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }
  swift_release();
  uint64_t v23 = (void *)(v6 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v6 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v34;
  }
  *(void *)(v6 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *unint64_t v4 = v8;
  return result;
}

uint64_t sub_1000364A4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_100034E9C(a2, a3);
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
      sub_100020DCC();
      goto LABEL_7;
    }
    sub_10003578C(v15, a4 & 1, (uint64_t (*)(void))&type metadata accessor for MLHostTask, &qword_1000655F0);
    unint64_t v26 = sub_100034E9C(a2, a3);
    if ((v16 & 1) == (v27 & 1))
    {
      unint64_t v12 = v26;
      unint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = type metadata accessor for MLHostTask();
    uint64_t v21 = *(void *)(v20 - 8);
    int64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 40);
    uint64_t v23 = v20;
    uint64_t v24 = v19 + *(void *)(v21 + 72) * v12;
    return v22(v24, a1, v23);
  }
LABEL_13:
  sub_10003692C(v12, a2, a3, a1, v18);

  return swift_bridgeObjectRetain();
}

uint64_t sub_100036640(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_100034E9C(a3, a4);
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
    sub_1000210B0();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_release();
      void *v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_100035B78(v17, a5 & 1);
  unint64_t v23 = sub_100034E9C(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  int64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  uint64_t *v25 = a3;
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

id sub_1000367C8(void *a1)
{
  return sub_100033874(a1, v1);
}

void sub_1000367D0(void *a1)
{
  sub_100033BB0(a1, v1);
}

_OWORD *sub_1000367D8(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_100034E9C(a2, a3);
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
      sub_100021274();
      goto LABEL_7;
    }
    sub_100035E84(v15, a4 & 1);
    unint64_t v21 = sub_100034E9C(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      char v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  char v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    sub_1000101AC((uint64_t)v19);
    return sub_100010414(a1, v19);
  }
LABEL_13:
  sub_1000369DC(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

uint64_t sub_10003692C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = (void *)(a5[6] + 16 * a1);
  *uint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = type metadata accessor for MLHostTask();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, a4, v10);
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

_OWORD *sub_1000369DC(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_100010414(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

Swift::Int sub_100036A48(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_10000E508(&qword_100065838);
    uint64_t v2 = static _SetStorage.convert(_:capacity:)();
    uint64_t v14 = v2;
    __CocoaSet.makeIterator()();
    if (__CocoaSet.Iterator.next()())
    {
      sub_100010330(0, &qword_100065828);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_100036F20();
          uint64_t v2 = v14;
        }
        Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v2 + 40));
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (__CocoaSet.Iterator.next()());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v2;
}

uint64_t sub_100036C40()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10000E508(&qword_100065288);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    BOOL v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *uint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_100036F20()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10000E508(&qword_100065838);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = NSObject._rawHashValue(seed:)(*(void *)(v4 + 40));
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

unint64_t sub_1000371C0(uint64_t a1, void *a2)
{
  NSObject._rawHashValue(seed:)(a2[5]);
  unint64_t result = _HashTable.nextHole(atOrAfter:)();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

Swift::Int sub_100037244(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_100036C40();
  }
  else
  {
    if (v10 > v9)
    {
      unint64_t result = (Swift::Int)sub_100037568();
      goto LABEL_22;
    }
    sub_1000378C8();
  }
  uint64_t v11 = *v4;
  Hasher.init(_seed:)();
  String.hash(into:)();
  unint64_t result = Hasher._finalize()();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (unint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
    {
LABEL_21:
      unint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          unint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  unint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  Swift::Int *v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void sub_1000373E0(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_100036F20();
  }
  else
  {
    if (v7 > v6)
    {
      sub_10003771C();
      goto LABEL_14;
    }
    sub_100037B78();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = NSObject._rawHashValue(seed:)(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_100010330(0, &qword_100065828);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = static NSObject.== infix(_:_:)();

    if (v12)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = static NSObject.== infix(_:_:)();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

void *sub_100037568()
{
  uint64_t v1 = v0;
  sub_10000E508(&qword_100065288);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    void *v19 = *v17;
    v19[1] = v18;
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_10003771C()
{
  uint64_t v1 = v0;
  sub_10000E508(&qword_100065838);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1000378C8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10000E508(&qword_100065288);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_100037B78()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10000E508(&qword_100065838);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v28 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    Swift::Int v19 = *(void *)(v4 + 40);
    id v20 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = NSObject._rawHashValue(seed:)(v19);
    uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v28;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void *sub_100037DF4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  sub_10000E508(&qword_100065298);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_100037FC8((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1000102E0();
  if (v6 != v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v3;
}

void *sub_100037EE0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  sub_10000E508(&qword_100065298);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_1000381C8((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1000102E0();
  if (v6 != v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v3;
}

uint64_t sub_100037FC8(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  int64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    id v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *int64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1000381C8(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  int64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    id v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *int64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1000383C8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v8 = result;
  if (v2)
  {
    int64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_100035310(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_100038460(void *a1)
{
  uint64_t v2 = type metadata accessor for MLHostTask();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v135 = v2;
  uint64_t v136 = v3;
  uint64_t v4 = __chkstk_darwin(v2);
  os_log_type_t v128 = (char *)&v121 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v133 = (char *)&v121 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v121 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  unint64_t v132 = (char *)&v121 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v130 = (char *)&v121 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v131 = (char *)&v121 - v16;
  __chkstk_darwin(v15);
  unint64_t v18 = (char *)&v121 - v17;
  uint64_t v19 = type metadata accessor for TaskRequest();
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  unint64_t v22 = (char *)&v121 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for TaskDefinition();
  uint64_t v24 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  BOOL v26 = (char *)&v121 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MLHostTask.taskDefinition.getter();
  TaskDefinition.taskRequest.getter();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
  uint64_t v134 = a1;
  MLHostTask.name.getter();
  uint64_t v27 = (void *)TaskRequest.getSystemTaskRequest(identifier:)();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  if (!v27)
  {
    if (qword_100064F68 != -1) {
      swift_once();
    }
    uint64_t v33 = type metadata accessor for Logger();
    sub_100010174(v33, (uint64_t)qword_1000667D0);
    uint64_t v34 = v135;
    uint64_t v35 = v136;
    (*(void (**)(char *, void *, uint64_t))(v136 + 16))(v10, v134, v135);
    uint64_t v36 = Logger.logObject.getter();
    os_log_type_t v37 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v36, v37))
    {
      unint64_t v38 = (uint8_t *)swift_slowAlloc();
      id v141 = (id)swift_slowAlloc();
      *(_DWORD *)unint64_t v38 = 136315138;
      sub_100049750(&qword_1000657F0, (void (*)(uint64_t))&type metadata accessor for MLHostTask);
      uint64_t v39 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v139 = sub_10000E564(v39, v40, (uint64_t *)&v141);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v10, v34);
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "Failed at generating BGSystemTaskRequest from taskDefinition: %s", v38, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v35 + 8))(v10, v34);
    }
    goto LABEL_43;
  }
  id v28 = v27;
  id v29 = [v27 groupName];
  id v126 = v27;
  if (v29)
  {

    uint64_t v31 = v135;
    uint64_t v30 = v136;
    uint64_t v32 = v134;
  }
  else
  {
    uint64_t v32 = v134;
    MLHostTask.bundleIdentifier.getter();
    NSString v41 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v28 setGroupName:v41];

    [v28 setGroupConcurrencyLimit:1];
    uint64_t v31 = v135;
    uint64_t v30 = v136;
    if (qword_100064F68 != -1) {
      swift_once();
    }
    uint64_t v42 = type metadata accessor for Logger();
    sub_100010174(v42, (uint64_t)qword_1000667D0);
    uint64_t v43 = *(void (**)(char *, void *, uint64_t))(v30 + 16);
    v43(v18, v32, v31);
    uint64_t v44 = v131;
    v43(v131, v32, v31);
    uint64_t v45 = Logger.logObject.getter();
    os_log_type_t v46 = static os_log_type_t.debug.getter();
    int v47 = v46;
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v48 = swift_slowAlloc();
      id v129 = (id)swift_slowAlloc();
      id v141 = v129;
      *(_DWORD *)uint64_t v48 = 136315394;
      LODWORD(v127) = v47;
      uint64_t v49 = MLHostTask.name.getter();
      uint64_t v139 = sub_10000E564(v49, v50, (uint64_t *)&v141);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v51 = *(void (**)(char *, uint64_t))(v136 + 8);
      v51(v18, v135);
      *(_WORD *)(v48 + 12) = 2080;
      uint64_t v52 = MLHostTask.bundleIdentifier.getter();
      uint64_t v139 = sub_10000E564(v52, v53, (uint64_t *)&v141);
      uint64_t v30 = v136;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v51(v44, v135);
      id v28 = v126;
      uint64_t v31 = v135;
      _os_log_impl((void *)&_mh_execute_header, v45, (os_log_type_t)v127, "Modified request for task %s: assigned group name: %s", (uint8_t *)v48, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v32 = v134;
      swift_slowDealloc();
    }
    else
    {
      uint64_t v54 = *(void (**)(char *, uint64_t))(v30 + 8);
      v54(v18, v31);
      v54(v44, v31);
    }
  }
  id v129 = self;
  id v55 = [v129 sharedScheduler];
  MLHostTask.name.getter();
  NSString v56 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v57 = [v55 taskRequestForIdentifier:v56];

  if (qword_100064F68 != -1) {
    swift_once();
  }
  uint64_t v58 = type metadata accessor for Logger();
  uint64_t v59 = sub_100010174(v58, (uint64_t)qword_1000667D0);
  id v60 = v57;
  uint64_t v131 = (char *)v59;
  uint64_t v61 = Logger.logObject.getter();
  os_log_type_t v62 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v61, v62))
  {
    id v63 = (uint8_t *)swift_slowAlloc();
    id v141 = (id)swift_slowAlloc();
    *(_DWORD *)id v63 = 136315138;
    if (v60)
    {
      id v64 = v60;
      id v65 = [v60 description];
      uint64_t v66 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v68 = v67;
    }
    else
    {
      unint64_t v68 = 0xE300000000000000;
      uint64_t v66 = 4271950;
      id v64 = 0;
    }
    uint64_t v139 = sub_10000E564(v66, v68, (uint64_t *)&v141);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v61, v62, "Existing BGST.taskRequest: %s", v63, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    id v60 = v64;
    uint64_t v31 = v135;
    uint64_t v30 = v136;
  }
  else
  {
  }
  uint64_t v69 = v132;
  uint64_t v70 = *(void (**)(char *, void *, uint64_t))(v30 + 16);
  id v127 = v60;
  if (v60)
  {
    uint64_t v71 = v130;
    v70(v130, v32, v31);
    NSString v72 = (char *)v28;
    uint64_t v73 = Logger.logObject.getter();
    os_log_type_t v74 = static os_log_type_t.info.getter();
    int v75 = v74;
    BOOL v76 = os_log_type_enabled(v73, v74);
    unint64_t v132 = v72;
    if (v76)
    {
      uint64_t v77 = v30;
      uint64_t v78 = swift_slowAlloc();
      uint64_t v124 = (void *)swift_slowAlloc();
      uint64_t v125 = (void *)swift_slowAlloc();
      id v141 = v125;
      *(_DWORD *)uint64_t v78 = 136315394;
      LODWORD(v123) = v75;
      os_log_t v122 = v73;
      uint64_t v79 = MLHostTask.name.getter();
      uint64_t v139 = sub_10000E564(v79, v80, (uint64_t *)&v141);
      id v81 = v28;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      id v82 = *(void (**)(char *, uint64_t))(v77 + 8);
      NSString v72 = v132;
      v82(v71, v31);
      *(_WORD *)(v78 + 12) = 2112;
      uint64_t v139 = (uint64_t)v72;
      uint64_t v83 = v72;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v124 = v81;
      uint64_t v32 = v134;

      os_log_t v84 = v122;
      _os_log_impl((void *)&_mh_execute_header, v122, (os_log_type_t)v123, "Task %s has existing request, updating request: %@.", (uint8_t *)v78, 0x16u);
      sub_10000E508(&qword_100065290);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      id v82 = *(void (**)(char *, uint64_t))(v30 + 8);
      v82(v71, v31);
    }
    long long v92 = v133;
    id v93 = [v129 sharedScheduler];
    id v141 = 0;
    unsigned int v94 = [v93 updateTaskRequest:v72 error:&v141];

    id v95 = v141;
    if (v94)
    {
      id v96 = v141;

      return 1;
    }
    unint64_t v132 = (char *)v82;
  }
  else
  {
    uint64_t v125 = (void *)(v30 + 16);
    uint64_t v130 = (char *)v70;
    v70(v132, v32, v31);
    id v85 = v28;
    uint64_t v86 = Logger.logObject.getter();
    os_log_type_t v87 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v86, v87))
    {
      uint64_t v88 = swift_slowAlloc();
      uint64_t v123 = (void *)swift_slowAlloc();
      uint64_t v124 = (void *)swift_slowAlloc();
      id v141 = v124;
      *(_DWORD *)uint64_t v88 = 136315394;
      uint64_t v89 = MLHostTask.name.getter();
      uint64_t v139 = sub_10000E564(v89, v90, (uint64_t *)&v141);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      unint64_t v132 = *(char **)(v136 + 8);
      ((void (*)(char *, uint64_t))v132)(v69, v31);
      *(_WORD *)(v88 + 12) = 2112;
      uint64_t v139 = (uint64_t)v85;
      id v91 = v85;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v123 = v28;

      uint64_t v32 = v134;
      _os_log_impl((void *)&_mh_execute_header, v86, v87, "Task %s has no request, submitting request: %@", (uint8_t *)v88, 0x16u);
      sub_10000E508(&qword_100065290);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      unint64_t v132 = *(char **)(v136 + 8);
      ((void (*)(char *, uint64_t))v132)(v69, v31);
    }
    long long v92 = v133;
    id v98 = [v129 sharedScheduler];
    id v141 = 0;
    unsigned int v99 = [v98 submitTaskRequest:v85 error:&v141];

    id v95 = v141;
    uint64_t v70 = (void (*)(char *, void *, uint64_t))v130;
    if (v99)
    {
      id v100 = v141;

      return 1;
    }
  }
  id v101 = v95;
  uint64_t v102 = (void *)_convertNSErrorToError(_:)();

  swift_willThrow();
  id v141 = v102;
  swift_errorRetain();
  sub_10000E508(&qword_1000655D0);
  type metadata accessor for BGSystemTaskSchedulerError(0);
  if (swift_dynamicCast())
  {
    swift_errorRelease();
    uint64_t v103 = (void *)v139;
    uint64_t v104 = v135;
    v70(v92, v32, v135);
    id v105 = v103;
    uint64_t v106 = Logger.logObject.getter();
    os_log_type_t v107 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v106, v107))
    {
      uint64_t v108 = swift_slowAlloc();
      uint64_t v140 = swift_slowAlloc();
      *(_DWORD *)uint64_t v108 = 136315394;
      uint64_t v109 = MLHostTask.name.getter();
      uint64_t v138 = sub_10000E564(v109, v110, &v140);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      ((void (*)(char *, uint64_t))v132)(v92, v104);
      *(_WORD *)(v108 + 12) = 2080;
      uint64_t v137 = (uint64_t)v105;
      sub_100049750(&qword_100064FE8, type metadata accessor for BGSystemTaskSchedulerError);
      _BridgedStoredNSError.code.getter();
      uint64_t v137 = v138;
      type metadata accessor for Code(0);
      uint64_t v111 = String.init<A>(describing:)();
      uint64_t v138 = sub_10000E564(v111, v112, &v140);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v106, v107, "Task %s schedule request failed: %s", (uint8_t *)v108, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      ((void (*)(char *, uint64_t))v132)(v92, v104);
    }
    swift_errorRelease();
    return 0;
  }
  swift_errorRelease();
  uint64_t v113 = v128;
  uint64_t v114 = v135;
  v70(v128, v32, v135);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v36 = Logger.logObject.getter();
  os_log_type_t v115 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v36, v115))
  {

    swift_errorRelease();
    ((void (*)(char *, uint64_t))v132)(v113, v114);
    swift_errorRelease();
    swift_errorRelease();
LABEL_43:

    return 0;
  }
  uint64_t v116 = swift_slowAlloc();
  uint64_t v117 = (void *)swift_slowAlloc();
  uint64_t v134 = (void *)swift_slowAlloc();
  id v141 = v134;
  *(_DWORD *)uint64_t v116 = 136315394;
  uint64_t v118 = MLHostTask.name.getter();
  uint64_t v139 = sub_10000E564(v118, v119, (uint64_t *)&v141);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease();
  ((void (*)(char *, uint64_t))v132)(v113, v114);
  *(_WORD *)(v116 + 12) = 2112;
  swift_errorRetain();
  uint64_t v120 = _swift_stdlib_bridgeErrorToNSError();
  uint64_t v139 = v120;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *uint64_t v117 = v120;
  swift_errorRelease();
  swift_errorRelease();
  _os_log_impl((void *)&_mh_execute_header, v36, v115, "Task %s schedule request failed: %@", (uint8_t *)v116, 0x16u);
  sub_10000E508(&qword_100065290);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  swift_errorRelease();
  return 0;
}

uint64_t sub_100039804(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  sub_100010330(0, &qword_100065828);
  sub_100049E0C();
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        uint64_t v6 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)();
        sub_1000354C0(&v9, v6);
      }
    }
    else
    {
      uint64_t v7 = (void **)(a1 + 32);
      do
      {
        uint64_t v8 = *v7++;
        sub_1000354C0(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100039958(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

BOOL sub_100039990()
{
  id v0 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithSuiteName:v1];

  if (v2)
  {
    MLHostConfig.cloudEnvironment.getter();
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    NSString v4 = String._bridgeToObjectiveC()();
    [v2 setObject:v3 forKey:v4];

    MLHostConfig.cloudContainer.getter();
    if (v5)
    {
      NSString v6 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v6 = 0;
    }
    NSString v11 = String._bridgeToObjectiveC()();
    [v2 setObject:v6 forKey:v11];
    swift_unknownObjectRelease();

    MLHostConfig.apsEnvironment.getter();
    if (v12)
    {
      NSString v13 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v13 = 0;
    }
    NSString v14 = String._bridgeToObjectiveC()();
    [v2 setObject:v13 forKey:v14];
    swift_unknownObjectRelease();
  }
  else
  {
    if (qword_100064F68 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_100010174(v7, (uint64_t)qword_1000667D0);
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136315138;
      sub_10000E564(0xD000000000000010, 0x80000001000562E0, &v16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Failed at reading UserDefaults(%s). Skipping saving config.", v10, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
  }
  return v2 != 0;
}

void sub_100039C94(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)RBSTerminateContext);
  swift_bridgeObjectRetain();
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v22 = [v2 initWithExplanation:v3];

  [v22 setReportType:0];
  [v22 setMaximumTerminationResistance:20];
  NSString v4 = [self identifierWithPid:a1];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = [self predicateMatchingIdentifier:v4];
    id v7 = [objc_allocWithZone((Class)RBSTerminateRequest) initWithPredicate:v6 context:v22];
    if (qword_100064F68 != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    sub_100010174(v8, (uint64_t)qword_1000667D0);
    os_log_type_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v9, v10))
    {
      NSString v11 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)NSString v11 = 67109120;
      LODWORD(v23) = a1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "RBS request termination for pid: %d", v11, 8u);
      swift_slowDealloc();
    }

    id v23 = 0;
    if ([v7 execute:&v23])
    {
      id v12 = v23;

LABEL_12:
      return;
    }
    id v16 = v23;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v19 = 138412290;
      swift_errorRetain();
      uint64_t v21 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v23 = v21;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v20 = v21;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "RBS request failed: %@", v19, 0xCu);
      sub_10000E508(&qword_100065290);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
  }
  else
  {
    if (qword_100064F68 != -1) {
      swift_once();
    }
    uint64_t v13 = type metadata accessor for Logger();
    sub_100010174(v13, (uint64_t)qword_1000667D0);
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v5, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 67109120;
      LODWORD(v23) = a1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v5, v14, "RBS failed at creating identifier for pid: %d", v15, 8u);
      swift_slowDealloc();

      goto LABEL_12;
    }
  }
}

uint64_t sub_10003A1D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[146] = a3;
  v3[145] = a2;
  v3[144] = a1;
  uint64_t v4 = type metadata accessor for ContinuousClock();
  v3[147] = v4;
  v3[148] = *(void *)(v4 - 8);
  v3[149] = swift_task_alloc();
  v3[150] = swift_task_alloc();
  v3[151] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for ContinuousClock.Instant();
  v3[152] = v5;
  v3[153] = *(void *)(v5 - 8);
  v3[154] = swift_task_alloc();
  v3[155] = swift_task_alloc();
  v3[156] = swift_task_alloc();
  v3[157] = swift_task_alloc();
  v3[158] = swift_task_alloc();
  v3[159] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for UUID();
  v3[160] = v6;
  v3[161] = *(void *)(v6 - 8);
  v3[162] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for SandboxError();
  v3[163] = v7;
  v3[164] = *(void *)(v7 - 8);
  v3[165] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for URL.DirectoryHint();
  v3[166] = v8;
  v3[167] = *(void *)(v8 - 8);
  v3[168] = swift_task_alloc();
  sub_10000E508(&qword_1000655C0);
  v3[169] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for URL();
  v3[170] = v9;
  v3[171] = *(void *)(v9 - 8);
  v3[172] = swift_task_alloc();
  sub_10000E508(&qword_1000654A8);
  v3[173] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for _AppExtensionProcess();
  v3[174] = v10;
  v3[175] = *(void *)(v10 - 8);
  v3[176] = swift_task_alloc();
  uint64_t v11 = type metadata accessor for TaskStatus();
  v3[177] = v11;
  v3[178] = *(void *)(v11 - 8);
  v3[179] = swift_task_alloc();
  uint64_t v12 = type metadata accessor for MLHostTask();
  v3[180] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v3[181] = v13;
  v3[182] = *(void *)(v13 + 64);
  v3[183] = swift_task_alloc();
  v3[184] = swift_task_alloc();
  v3[185] = swift_task_alloc();
  v3[186] = swift_task_alloc();
  v3[187] = swift_task_alloc();
  v3[188] = swift_task_alloc();
  v3[189] = swift_task_alloc();
  v3[190] = swift_task_alloc();
  v3[191] = swift_task_alloc();
  v3[192] = swift_task_alloc();
  v3[193] = swift_task_alloc();
  v3[194] = swift_task_alloc();
  v3[195] = swift_task_alloc();
  v3[196] = swift_task_alloc();
  v3[197] = swift_task_alloc();
  v3[198] = swift_task_alloc();
  uint64_t v14 = type metadata accessor for Logger();
  v3[199] = v14;
  v3[200] = *(void *)(v14 - 8);
  v3[201] = swift_task_alloc();
  v3[202] = swift_task_alloc();
  v3[203] = swift_task_alloc();
  v3[204] = swift_task_alloc();
  v3[205] = swift_task_alloc();
  v3[206] = swift_task_alloc();
  v3[207] = swift_task_alloc();
  v3[208] = swift_task_alloc();
  swift_retain_n();
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_10003A7F0, 0, 0);
}

uint64_t sub_10003A7F0()
{
  v597 = v0;
  NSString v1 = v0;
  uint64_t v2 = v0[146];
  strcpy((char *)v596, "transaction_");
  BYTE5(v596[1]) = 0;
  HIWORD(v596[1]) = -5120;
  v3._uint64_t countAndFlagsBits = MLHostTask.name.getter();
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  String.utf8CString.getter();
  swift_bridgeObjectRelease();
  v0[209] = os_transaction_create();
  swift_release();
  swift_beginAccess();
  if (*(unsigned char *)(v2 + 16) == 1)
  {
    if (qword_100064F68 != -1) {
      swift_once();
    }
    sub_100010174(v0[199], (uint64_t)qword_1000667D0);
    uint64_t v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Task was deferred before acquiring process. Exiting early.", v6, 2u);
      swift_slowDealloc();
    }
    uint64_t v7 = v1[179];
    uint64_t v8 = v1[178];
    uint64_t v9 = v1[177];

    uint64_t v10 = MLHostTask.name.getter();
    uint64_t v12 = v11;
    (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v7, enum case for TaskStatus.taskDeferred(_:), v9);
    sub_100018D90(v10, v12, v7);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    id v13 = objc_allocWithZone((Class)type metadata accessor for MLHostResult());
    id v586 = (id)MLHostResult.init(status:policy:)();
    swift_unknownObjectRelease();
    goto LABEL_25;
  }
  v524 = (unsigned char *)(v2 + 16);
  if (qword_100064F68 != -1) {
    swift_once();
  }
  uint64_t v14 = v0[208];
  uint64_t v15 = v0[200];
  uint64_t v16 = v0[198];
  uint64_t v17 = v0[181];
  uint64_t v18 = v0[180];
  uint64_t v19 = v0[144];
  uint64_t v20 = sub_100010174(v0[199], (uint64_t)qword_1000667D0);
  v0[210] = v20;
  uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16);
  v0[211] = v21;
  v0[212] = (v15 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  uint64_t v587 = v20;
  v553 = v21;
  ((void (*)(uint64_t))v21)(v14);
  id v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
  v0[213] = v22;
  v0[214] = (v17 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v565 = v22;
  v22(v16, v19, v18);
  id v23 = Logger.logObject.getter();
  os_log_type_t v24 = static os_log_type_t.debug.getter();
  BOOL v25 = os_log_type_enabled(v23, v24);
  uint64_t v26 = v1[208];
  uint64_t v27 = v1[200];
  uint64_t v28 = v1[199];
  uint64_t v29 = v1[198];
  uint64_t v30 = v1[181];
  v478 = v1;
  if (v25)
  {
    uint64_t v539 = v1[180];
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    v596[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v31 = 136315138;
    uint64_t v32 = MLHostTask.bundleIdentifier.getter();
    v1[116] = sub_10000E564(v32, v33, v596);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v34 = v539;
    v540 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
    v540(v29, v34);
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "Requesting process for extension: %s", v31, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    v540 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
    v540(v29, v1[180]);
  }
  v549 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
  v549(v26, v28);
  uint64_t v35 = v1[175];
  uint64_t v36 = v1[174];
  uint64_t v37 = v1[173];
  uint64_t v38 = MLHostTask.bundleIdentifier.getter();
  unint64_t v40 = v39;
  uint64_t v41 = MLHostTask.name.getter();
  sub_100011084(v38, v40, v41, v42, v37);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int v43 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v37, 1, v36);
  uint64_t v44 = v1[199];
  uint64_t v45 = v1[180];
  if (v43 == 1)
  {
    uint64_t v46 = v1[206];
    uint64_t v47 = v1[196];
    uint64_t v48 = v1[144];
    sub_100010578(v1[173], &qword_1000654A8);
    v553(v46, v587, v44);
    v565(v47, v48, v45);
    uint64_t v49 = Logger.logObject.getter();
    os_log_type_t v50 = static os_log_type_t.error.getter();
    BOOL v51 = os_log_type_enabled(v49, v50);
    uint64_t v52 = v1[206];
    uint64_t v53 = v1[199];
    uint64_t v54 = v1[196];
    if (v51)
    {
      uint64_t v588 = v1[206];
      uint64_t v558 = v1[180];
      uint64_t v577 = v1[199];
      id v55 = (uint8_t *)swift_slowAlloc();
      v596[0] = swift_slowAlloc();
      *(_DWORD *)id v55 = 136315138;
      uint64_t v56 = MLHostTask.bundleIdentifier.getter();
      v1[132] = sub_10000E564(v56, v57, v596);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v540(v54, v558);
      _os_log_impl((void *)&_mh_execute_header, v49, v50, "Failed at starting process for extension: %s", v55, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v58 = v577;
      uint64_t v59 = v588;
    }
    else
    {
      v540(v1[196], v1[180]);

      uint64_t v59 = v52;
      uint64_t v58 = v53;
    }
    v549(v59, v58);
    uint64_t v75 = v1[179];
    uint64_t v76 = v1[178];
    uint64_t v77 = v1[177];
    uint64_t v78 = MLHostTask.name.getter();
    uint64_t v80 = v79;
    (*(void (**)(uint64_t, void, uint64_t))(v76 + 104))(v75, enum case for TaskStatus.taskFailed(_:), v77);
    sub_100018D90(v78, v80, v75);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v75, v77);
    swift_unknownObjectRelease();
    goto LABEL_35;
  }
  uint64_t v60 = v1[207];
  uint64_t v61 = v1[197];
  uint64_t v62 = v1[144];
  (*(void (**)(void, void, void))(v1[175] + 32))(v1[176], v1[173], v1[174]);
  v553(v60, v587, v44);
  v565(v61, v62, v45);
  id v63 = Logger.logObject.getter();
  os_log_type_t v64 = static os_log_type_t.debug.getter();
  BOOL v65 = os_log_type_enabled(v63, v64);
  uint64_t v66 = v1[207];
  uint64_t v67 = v1[199];
  uint64_t v68 = v1[197];
  uint64_t v69 = v1[180];
  if (v65)
  {
    uint64_t v491 = v1[199];
    uint64_t v70 = (uint8_t *)swift_slowAlloc();
    v596[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v70 = 136315138;
    uint64_t v71 = MLHostTask.bundleIdentifier.getter();
    v1[124] = sub_10000E564(v71, v72, v596);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v540(v68, v69);
    _os_log_impl((void *)&_mh_execute_header, v63, v64, "Acquired process for extension: %s", v70, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v74 = v491;
    uint64_t v73 = v66;
  }
  else
  {
    v540(v68, v69);

    uint64_t v73 = v66;
    uint64_t v74 = v67;
  }
  v549(v73, v74);
  swift_beginAccess();
  if (*v524 == 1)
  {
    id v81 = Logger.logObject.getter();
    os_log_type_t v82 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v81, v82))
    {
      uint64_t v83 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v83 = 0;
      _os_log_impl((void *)&_mh_execute_header, v81, v82, "Task was deferred while acquiring process. Exiting early.", v83, 2u);
      swift_slowDealloc();
    }
    uint64_t v84 = v1[179];
    uint64_t v85 = v1[178];
    uint64_t v86 = v1[177];
    uint64_t v87 = v1[176];
    uint64_t v88 = v1[175];
    uint64_t v89 = v1[174];

    uint64_t v90 = MLHostTask.name.getter();
    uint64_t v92 = v91;
    (*(void (**)(uint64_t, void, uint64_t))(v85 + 104))(v84, enum case for TaskStatus.taskDeferred(_:), v86);
    sub_100018D90(v90, v92, v84);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v85 + 8))(v84, v86);
    id v93 = objc_allocWithZone((Class)type metadata accessor for MLHostResult());
    id v586 = (id)MLHostResult.init(status:policy:)();
    _AppExtensionProcess.invalidate()();
    (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v87, v89);
    goto LABEL_24;
  }
  v94.super.Class isa = _AppExtensionProcess.makeXPCConnection()().super.isa;
  v1[215] = v94.super.isa;
  if (v95)
  {
    uint64_t v96 = v1[205];
    uint64_t v97 = v1[199];
    uint64_t v98 = v1[195];
    uint64_t v99 = v1[180];
    uint64_t v100 = v1[144];
    swift_errorRelease();
    v553(v96, v587, v97);
    v565(v98, v100, v99);
    id v101 = Logger.logObject.getter();
    os_log_type_t v102 = static os_log_type_t.error.getter();
    BOOL v103 = os_log_type_enabled(v101, v102);
    uint64_t v104 = v1[205];
    uint64_t v105 = v1[199];
    uint64_t v106 = v1[195];
    if (v103)
    {
      uint64_t v589 = v1[205];
      uint64_t v559 = v1[180];
      uint64_t v578 = v1[199];
      os_log_type_t v107 = (uint8_t *)swift_slowAlloc();
      v596[0] = swift_slowAlloc();
      *(_DWORD *)os_log_type_t v107 = 136315138;
      uint64_t v108 = MLHostTask.bundleIdentifier.getter();
      v1[140] = sub_10000E564(v108, v109, v596);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v540(v106, v559);
      _os_log_impl((void *)&_mh_execute_header, v101, v102, "Failed at opening XPCConnection for extension: %s", v107, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v110 = v578;
      uint64_t v111 = v589;
    }
    else
    {
      v540(v1[195], v1[180]);

      uint64_t v111 = v104;
      uint64_t v110 = v105;
    }
    v549(v111, v110);
    uint64_t v125 = v1[179];
    uint64_t v126 = v1[178];
    uint64_t v127 = v1[177];
    uint64_t v128 = v1[176];
    uint64_t v129 = v1[175];
    uint64_t v130 = v1[174];
    uint64_t v131 = MLHostTask.name.getter();
    uint64_t v133 = v132;
    (*(void (**)(uint64_t, void, uint64_t))(v126 + 104))(v125, enum case for TaskStatus.taskFailed(_:), v127);
    sub_100018D90(v131, v133, v125);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v126 + 8))(v125, v127);
    _AppExtensionProcess.invalidate()();
    (*(void (**)(uint64_t, uint64_t))(v129 + 8))(v128, v130);
    swift_unknownObjectRelease();
    goto LABEL_35;
  }
  Class isa = v94.super.isa;
  swift_beginAccess();
  if (*v524)
  {
    uint64_t v113 = Logger.logObject.getter();
    os_log_type_t v114 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v113, v114))
    {
      os_log_type_t v115 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v115 = 0;
      _os_log_impl((void *)&_mh_execute_header, v113, v114, "Task was deferred while opening XPC connection to process. Exiting early.", v115, 2u);
      swift_slowDealloc();
    }
    uint64_t v116 = v1[179];
    uint64_t v117 = v1[178];
    uint64_t v118 = v1[177];
    uint64_t v119 = v1[176];
    uint64_t v120 = v1[175];
    uint64_t v566 = v1[174];

    uint64_t v121 = MLHostTask.name.getter();
    uint64_t v123 = v122;
    (*(void (**)(uint64_t, void, uint64_t))(v117 + 104))(v116, enum case for TaskStatus.taskDeferred(_:), v118);
    sub_100018D90(v121, v123, v116);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v117 + 8))(v116, v118);
    id v124 = objc_allocWithZone((Class)type metadata accessor for MLHostResult());
    id v586 = (id)MLHostResult.init(status:policy:)();

    _AppExtensionProcess.invalidate()();
    (*(void (**)(uint64_t, uint64_t))(v120 + 8))(v119, v566);
    goto LABEL_24;
  }
  uint64_t v136 = v1[194];
  uint64_t v137 = v1[182];
  uint64_t v138 = v1[181];
  uint64_t v139 = v1[180];
  uint64_t v550 = v1[178];
  uint64_t v140 = v1[144];
  uint64_t v541 = v140;
  id v141 = [self interfaceWithProtocol:&OBJC_PROTOCOL____TtP20LighthouseBackground26MLHostExtensionXPCProtocol_];
  [(objc_class *)isa setRemoteObjectInterface:v141];

  v565(v136, v140, v139);
  int v142 = *(_DWORD *)(v138 + 80);
  *((_DWORD *)v1 + 492) = v142;
  unint64_t v533 = (v142 + 16) & ~(unint64_t)v142;
  uint64_t v143 = swift_allocObject();
  uint64_t v144 = *(void (**)(unint64_t, uint64_t, uint64_t))(v138 + 32);
  v1[216] = v144;
  v1[217] = (v138 + 32) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
  uint64_t v145 = v136;
  v144(v143 + v533, v136, v139);
  v1[30] = sub_100049E78;
  v1[31] = v143;
  v1[26] = _NSConcreteStackBlock;
  v1[27] = 1107296256;
  v1[28] = sub_100027B5C;
  v1[29] = &unk_100062188;
  uint64_t v146 = _Block_copy(v1 + 26);
  swift_release();
  [(objc_class *)isa setInterruptionHandler:v146];
  _Block_release(v146);
  v565(v145, v541, v139);
  uint64_t v147 = swift_allocObject();
  v144(v147 + v533, v145, v139);
  v1[24] = sub_100049F18;
  v1[25] = v147;
  v1[20] = _NSConcreteStackBlock;
  v1[21] = 1107296256;
  v1[22] = sub_100027B5C;
  v1[23] = &unk_1000621D8;
  uint64_t v148 = _Block_copy(v1 + 20);
  swift_release();
  [(objc_class *)isa setInvalidationHandler:v148];
  _Block_release(v148);
  [(objc_class *)isa resume];
  uint64_t v149 = swift_allocBox();
  uint64_t v151 = v150;
  v1[218] = v149;
  v1[219] = v150;
  LODWORD(v150) = enum case for TaskStatus.taskRunning(_:);
  *((_DWORD *)v1 + 493) = enum case for TaskStatus.taskRunning(_:);
  uint64_t v152 = *(void (**)(void))(v550 + 104);
  v1[220] = v152;
  v1[221] = (v550 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
  unsigned int v482 = v150;
  v480 = (void (*)(uint64_t, void, uint64_t))v152;
  v152(v151);
  v565(v145, v541, v139);
  uint64_t v153 = swift_allocObject();
  v484 = v144;
  v144(v153 + v533, v145, v139);
  aBos_unfair_lock_t lock = (char *)((v533 + v137 + 7) & 0xFFFFFFFFFFFFFFF8);
  *(void *)&aBlock[v153] = v149;
  v1[18] = sub_10004A02C;
  v1[19] = v153;
  v1[14] = _NSConcreteStackBlock;
  v1[15] = 1107296256;
  v1[16] = sub_1000281F4;
  v1[17] = &unk_100062228;
  unint64_t v154 = _Block_copy(v1 + 14);
  swift_retain();
  swift_release();
  id v155 = [(objc_class *)isa remoteObjectProxyWithErrorHandler:v154];
  _Block_release(v154);
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_10000E508(&qword_100065840);
  swift_dynamicCast();
  id v490 = (id)v1[136];
  v1[222] = v490;
  uint64_t v156 = MLHostTask.taskFolder.getter();
  unint64_t v158 = v157;
  *((unsigned char *)v1 + 785) = 1;
  if (qword_100064F80 != -1) {
    swift_once();
  }
  uint64_t v159 = (void *)qword_1000656A8;
  swift_bridgeObjectRetain();
  uint64_t v160 = MLHostTask.bundleIdentifier.getter();
  char v162 = sub_100017828(v160, v161, v159);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v162)
  {
    uint64_t v163 = v1[145];
    swift_bridgeObjectRelease();
    *((unsigned char *)v1 + 785) = 0;
    uint64_t v164 = *(void *)(v163 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
    unint64_t v158 = *(void *)(v164 + 48);
    uint64_t v542 = *(void *)(v164 + 40);
    swift_bridgeObjectRetain_n();
  }
  else
  {
    uint64_t v542 = v156;
    if (!v158) {
      goto LABEL_49;
    }
    swift_bridgeObjectRetain();
  }
  v565(v1[193], v1[144], v1[180]);
  swift_bridgeObjectRetain_n();
  uint64_t v165 = Logger.logObject.getter();
  os_log_type_t v166 = static os_log_type_t.debug.getter();
  BOOL v167 = os_log_type_enabled(v165, v166);
  uint64_t v168 = v1[193];
  uint64_t v169 = v1[181];
  uint64_t v170 = v1[180];
  if (v167)
  {
    uint64_t v171 = swift_slowAlloc();
    uint64_t v477 = swift_slowAlloc();
    v596[0] = v477;
    *(_DWORD *)uint64_t v171 = 67109634;
    *((_DWORD *)v1 + 203) = (v162 & 1) == 0;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v171 + 8) = 2080;
    uint64_t v172 = MLHostTask.name.getter();
    v1[135] = sub_10000E564(v172, v173, v596);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v169 + 8))(v168, v170);
    *(_WORD *)(v171 + 18) = 2080;
    swift_bridgeObjectRetain();
    v1[133] = sub_10000E564(v542, v158, v596);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v165, v166, "Granting sandbox extension (ro: %{BOOL}d) to %s for taskFolder: %s", (uint8_t *)v171, 0x1Cu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v169 + 8))(v168, v170);
    swift_bridgeObjectRelease_n();
  }

  uint64_t v174 = v1[171];
  uint64_t v175 = v1[170];
  uint64_t v176 = v1[169];
  uint64_t v177 = v1[168];
  uint64_t v178 = v1[167];
  uint64_t v179 = v1[166];
  type metadata accessor for SandboxExtension();
  _AppExtensionProcess.auditToken.getter();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v174 + 56))(v176, 1, 1, v175);
  (*(void (**)(uint64_t, void, uint64_t))(v178 + 104))(v177, enum case for URL.DirectoryHint.inferFromPath(_:), v179);
  URL.init(filePath:directoryHint:relativeTo:)();
  swift_beginAccess();
  static SandboxExtension.issue(auditToken:url:readonly:)();
  (*(void (**)(void, void))(v1[171] + 8))(v1[172], v1[170]);
  SandboxExtension.token.getter();
  NSString v180 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v490 consumeSandboxExtensionWithToken:v180];

  swift_release();
LABEL_49:
  uint64_t v181 = v1[204];
  uint64_t v182 = v1[199];
  *(void *)type = v1[192];
  uint64_t v492 = v1[191];
  uint64_t v183 = v1[180];
  uint64_t v184 = v1[162];
  uint64_t v185 = v1[161];
  uint64_t v186 = v1[160];
  uint64_t v187 = v1[144];
  UUID.init()();
  UUID.uuidString.getter();
  (*(void (**)(uint64_t, uint64_t))(v185 + 8))(v184, v186);
  MLHostTask.name.getter();
  id v188 = objc_allocWithZone((Class)type metadata accessor for MLHostExtensionContext());
  uint64_t v543 = MLHostExtensionContext.init(taskId:taskName:taskFolder:)();
  v1[223] = v543;
  uint64_t v189 = swift_allocObject();
  v1[224] = v189;
  os_log_t v514 = (os_log_t)v189;
  *(void *)(v189 + 16) = 0;
  uint64_t v190 = swift_allocObject();
  v1[225] = v190;
  uint64_t v506 = v190;
  *(unsigned char *)(v190 + 16) = 2;
  v553(v181, v587, v182);
  v565(*(void *)type, v187, v183);
  v565(v492, v187, v183);
  os_log_type_t v191 = Logger.logObject.getter();
  os_log_type_t v192 = static os_log_type_t.info.getter();
  BOOL v193 = os_log_type_enabled(v191, v192);
  uint64_t v194 = v1[204];
  uint64_t v195 = v1[200];
  uint64_t v196 = v1[199];
  uint64_t v197 = v1[192];
  uint64_t v198 = v1[191];
  uint64_t v199 = v1[181];
  uint64_t v200 = v1[180];
  if (v193)
  {
    uint64_t v590 = v1[204];
    uint64_t v201 = swift_slowAlloc();
    v596[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v201 = 136315394;
    uint64_t v202 = MLHostTask.name.getter();
    os_log_type_t typea = v192;
    v1[138] = sub_10000E564(v202, v203, v596);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    id v204 = *(void (**)(uint64_t, uint64_t))(v199 + 8);
    v204(v197, v200);
    *(_WORD *)(v201 + 12) = 2080;
    uint64_t v205 = MLHostTask.bundleIdentifier.getter();
    v1[139] = sub_10000E564(v205, v206, v596);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v204(v198, v200);
    _os_log_impl((void *)&_mh_execute_header, v191, typea, "Task %s starting with extension: %s", (uint8_t *)v201, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    unint64_t v207 = *(void (**)(uint64_t, uint64_t))(v195 + 8);
    v207(v590, v196);
  }
  else
  {
    id v204 = *(void (**)(uint64_t, uint64_t))(v199 + 8);
    v204(v1[192], v1[180]);
    v204(v198, v200);

    unint64_t v207 = *(void (**)(uint64_t, uint64_t))(v195 + 8);
    v207(v194, v196);
  }
  v1[227] = v204;
  v1[226] = v207;
  uint64_t v591 = v1[194];
  uint64_t v208 = v1[180];
  uint64_t v209 = v1[179];
  uint64_t v210 = v1[178];
  uint64_t v211 = v1[177];
  v554 = v1 + 98;
  uint64_t v212 = v1[145];
  uint64_t v213 = v1[144];
  v1[228] = *(void *)(v212 + OBJC_IVAR____TtC7mlhostd12MLHostDaemon_taskRegistry);
  uint64_t v214 = MLHostTask.name.getter();
  uint64_t v216 = v215;
  v480(v209, v482, v211);
  sub_100018D90(v214, v216, v209);
  swift_bridgeObjectRelease();
  uint64_t v217 = *(void (**)(uint64_t, uint64_t))(v210 + 8);
  v1[229] = v217;
  v1[230] = (v210 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v217(v209, v211);
  static ContinuousClock.now.getter();
  v565(v591, v213, v208);
  unint64_t v218 = (unint64_t)(aBlock + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v219 = swift_allocObject();
  v484(v219 + v533, v591, v208);
  *(void *)&aBlock[v219] = v514;
  *(void *)(v219 + v218) = v506;
  *(void *)(v219 + ((v218 + 15) & 0xFFFFFFFFFFFFFFF8)) = v212;
  v1[12] = sub_10004A104;
  v1[13] = v219;
  v1[8] = _NSConcreteStackBlock;
  v1[9] = 1107296256;
  v1[10] = sub_1000287F8;
  v1[11] = &unk_1000622A0;
  os_log_t v220 = _Block_copy(v1 + 8);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  [v490 shouldRunWithContext:v543 reply:v220];
  _Block_release(v220);
  uint64_t v221 = swift_allocObject();
  v1[231] = v221;
  *(void *)(v221 + 16) = 0;
  *(void *)(v221 + 24) = 0;
  swift_beginAccess();
  if ((*v524 & 1) != 0
    || (swift_beginAccess(), swift_beginAccess(), *(unsigned char *)(v1[225] + 16) != 2)
    || (static Duration.< infix(_:_:)() & 1) != 0)
  {
    uint64_t v222 = v1[146];
    swift_beginAccess();
    if ((*(unsigned char *)(v222 + 16) & 1) == 0)
    {
      uint64_t v223 = v1[225];
      swift_beginAccess();
      if (*(unsigned char *)(v223 + 16) == 2)
      {
        v567 = v1 + 128;
        v551 = (void (*)(uint64_t, uint64_t))v1[229];
        uint64_t v224 = (void (*)(uint64_t, void, uint64_t))v1[220];
        v560 = (void (*)(uint64_t, uint64_t, uint64_t))v1[213];
        v534 = (void (*)(uint64_t, os_log_t, uint64_t))v1[211];
        uint64_t v225 = v1[201];
        uint64_t v226 = v1[199];
        os_log_t v515 = (os_log_t)v1[210];
        uint64_t v521 = v1[183];
        uint64_t v525 = v1[180];
        uint64_t v227 = v1[179];
        uint64_t v228 = v1[177];
        uint64_t v229 = v1[144];
        uint64_t v230 = MLHostTask.name.getter();
        uint64_t v232 = v231;
        v224(v227, enum case for TaskStatus.taskFailed(_:), v228);
        sub_100018D90(v230, v232, v227);
        swift_bridgeObjectRelease();
        v551(v227, v228);
        v534(v225, v515, v226);
        uint64_t v233 = v229;
        uint64_t v234 = v478;
        v560(v521, v233, v525);
        v235 = Logger.logObject.getter();
        os_log_type_t v236 = static os_log_type_t.error.getter();
        BOOL v237 = os_log_type_enabled(v235, v236);
        BOOL v238 = (void (*)(uint64_t, uint64_t))v478[226];
        uint64_t v239 = v478[201];
        uint64_t v240 = v478[199];
        uint64_t v241 = v478[183];
        uint64_t v242 = v478[180];
        if (v237)
        {
          v592 = (void (*)(uint64_t, uint64_t))v478[226];
          v544 = (void (*)(uint64_t, uint64_t))v478[227];
          uint64_t v561 = v478[201];
          unint64_t v243 = (uint8_t *)swift_slowAlloc();
          v596[0] = swift_slowAlloc();
          *(_DWORD *)unint64_t v243 = 136315138;
          uint64_t v244 = MLHostTask.name.getter();
          uint64_t *v567 = sub_10000E564(v244, v245, v596);
          uint64_t v234 = v478;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          v544(v241, v242);
          _os_log_impl((void *)&_mh_execute_header, v235, v236, "Task %s has been in shouldRun for too long. Marking task as failed and terminating process.", v243, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          v592(v561, v240);
        }
        else
        {
          ((void (*)(void, void))v478[227])(v478[183], v478[180]);

          v238(v239, v240);
        }
        v297 = (void *)v234[223];
        v298 = (void *)v234[215];
        uint64_t v299 = v234[176];
        uint64_t v300 = v234[175];
        uint64_t v569 = v234[174];
        uint64_t v301 = v234[159];
        uint64_t v302 = v478[153];
        uint64_t v303 = v478[152];
        id v304 = [v298 processIdentifier:v477];
        v596[0] = 0;
        v596[1] = 0xE000000000000000;
        _StringGuts.grow(_:)(43);
        v305._uint64_t countAndFlagsBits = 0x206B736154;
        v305._object = (void *)0xE500000000000000;
        String.append(_:)(v305);
        v306._uint64_t countAndFlagsBits = MLHostTask.name.getter();
        String.append(_:)(v306);
        swift_bridgeObjectRelease();
        v307._uint64_t countAndFlagsBits = 0xD000000000000024;
        v307._object = (void *)0x80000001000561C0;
        String.append(_:)(v307);
        sub_100039C94((uint64_t)v304);
        swift_bridgeObjectRelease();

        swift_unknownObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v302 + 8))(v301, v303);
        NSString v1 = v478;
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        [v298 invalidate];

        _AppExtensionProcess.invalidate()();
        (*(void (**)(uint64_t, uint64_t))(v300 + 8))(v299, v569);
LABEL_76:
        swift_unknownObjectRelease();
LABEL_35:
        swift_release_n();
        id v586 = 0;
        goto LABEL_36;
      }
    }
    uint64_t v246 = v1[225];
    swift_beginAccess();
    int v247 = *(unsigned __int8 *)(v246 + 16);
    uint64_t v248 = v1[180];
    uint64_t v249 = v1[144];
    if (v247 == 2)
    {
      ((void (*)(void, uint64_t, uint64_t))v1[213])(v1[190], v249, v248);
      uint64_t v250 = Logger.logObject.getter();
      os_log_type_t v251 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v250, v251))
      {
        v535 = (void (*)(uint64_t, uint64_t))v1[227];
        uint64_t v252 = v1[190];
        uint64_t v522 = v1[180];
        v526 = (unsigned __int8 *)(v1[146] + 16);
        uint64_t v253 = swift_slowAlloc();
        v596[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v253 = 136315650;
        uint64_t v254 = MLHostTask.name.getter();
        v1[125] = sub_10000E564(v254, v255, v596);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_retain();
        swift_bridgeObjectRelease();
        v535(v252, v522);
        *(_WORD *)(v253 + 12) = 1024;
        swift_beginAccess();
        *((_DWORD *)v1 + 491) = *v526;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v253 + 18) = 2080;
        swift_beginAccess();
        uint64_t v256 = Duration.description.getter();
        v1[123] = sub_10000E564(v256, v257, v596);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        swift_release();
        _os_log_impl((void *)&_mh_execute_header, v250, v251, "Task %s skipping execution, isDeferred = %{BOOL}d, after %s.", (uint8_t *)v253, 0x1Cu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        ((void (*)(void, void))v1[227])(v1[190], v1[180]);
      }

      v496 = (void (*)(uint64_t, uint64_t))v1[229];
      v510 = (void *)v1[223];
      v267 = (void (*)(uint64_t, void, uint64_t))v1[220];
      v268 = (void *)v1[215];
      uint64_t v269 = v1[179];
      uint64_t v270 = v1[177];
      uint64_t v555 = v1[176];
      uint64_t v562 = v1[175];
      uint64_t v568 = v1[174];
      os_log_t v516 = (os_log_t)v1[159];
      os_log_t log = (os_log_t)v1[153];
      uint64_t v507 = v1[152];
      uint64_t v271 = MLHostTask.name.getter();
      uint64_t v273 = v272;
      v267(v269, enum case for TaskStatus.taskDeferred(_:), v270);
      sub_100018D90(v271, v273, v269);
      swift_bridgeObjectRelease();
      v496(v269, v270);
      id v274 = [v268 processIdentifier];
      v596[0] = 0;
      v596[1] = 0xE000000000000000;
      _StringGuts.grow(_:)(37);
      v275._uint64_t countAndFlagsBits = 0x206B736154;
      v275._object = (void *)0xE500000000000000;
      String.append(_:)(v275);
      v276._uint64_t countAndFlagsBits = MLHostTask.name.getter();
      String.append(_:)(v276);
      swift_bridgeObjectRelease();
      v277._uint64_t countAndFlagsBits = 0xD00000000000001ELL;
      v277._object = (void *)0x80000001000561F0;
      String.append(_:)(v277);
      sub_100039C94((uint64_t)v274);

      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      ((void (*)(os_log_t, uint64_t))log[1].isa)(v516, v507);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      [v268 invalidate];

      _AppExtensionProcess.invalidate()();
      (*(void (**)(uint64_t, uint64_t))(v562 + 8))(v555, v568);
      goto LABEL_76;
    }
    uint64_t v258 = (void (*)(void, uint64_t, uint64_t))v1[213];
    if ((v247 & 1) == 0)
    {
      v258(v1[188], v249, v248);
      v259 = Logger.logObject.getter();
      os_log_type_t v260 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v259, v260))
      {
        v536 = (void (*)(uint64_t, uint64_t))v1[227];
        uint64_t v261 = v1[188];
        uint64_t v527 = v1[180];
        uint64_t v262 = swift_slowAlloc();
        v596[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v262 = 136315650;
        uint64_t v263 = MLHostTask.name.getter();
        v1[118] = sub_10000E564(v263, v264, v596);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_retain();
        swift_bridgeObjectRelease();
        v536(v261, v527);
        *(_WORD *)(v262 + 12) = 1024;
        *((_DWORD *)v1 + 490) = 0;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v262 + 18) = 2080;
        swift_beginAccess();
        uint64_t v265 = Duration.description.getter();
        v1[115] = sub_10000E564(v265, v266, v596);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        swift_release();
        _os_log_impl((void *)&_mh_execute_header, v259, v260, "Task %s skipping execution, shouldRun = %{BOOL}d, after %s.", (uint8_t *)v262, 0x1Cu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        ((void (*)(void, void))v1[227])(v1[188], v1[180]);
      }

      uint64_t v308 = (void (*)(uint64_t, uint64_t))v1[229];
      os_log_t loga = (os_log_t)v1[223];
      uint64_t v309 = (void (*)(uint64_t, void, uint64_t))v1[220];
      id v495 = (id)v1[215];
      uint64_t v310 = v1[179];
      uint64_t v311 = v1[177];
      uint64_t v546 = v1[176];
      uint64_t v552 = v1[175];
      uint64_t v556 = v1[174];
      uint64_t v511 = v1[159];
      uint64_t v498 = v1[153];
      uint64_t v500 = v1[152];
      v508 = (id *)(v1[224] + 16);
      uint64_t v312 = MLHostTask.name.getter();
      uint64_t v314 = v313;
      v309(v310, enum case for TaskStatus.taskFailed(_:), v311);
      sub_100018D90(v312, v314, v310);
      swift_bridgeObjectRelease();
      v308(v310, v311);
      uint64_t v315 = MLHostTask.name.getter();
      sub_100018964(v315, v316);
      swift_bridgeObjectRelease();
      id v317 = [v495 processIdentifier];
      v596[0] = 0;
      v596[1] = 0xE000000000000000;
      _StringGuts.grow(_:)(27);
      v318._uint64_t countAndFlagsBits = 0x206B736154;
      v318._object = (void *)0xE500000000000000;
      String.append(_:)(v318);
      v319._uint64_t countAndFlagsBits = MLHostTask.name.getter();
      String.append(_:)(v319);
      swift_bridgeObjectRelease();
      v320._uint64_t countAndFlagsBits = 0xD000000000000014;
      v320._object = (void *)0x8000000100056210;
      String.append(_:)(v320);
      sub_100039C94((uint64_t)v317);

      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v498 + 8))(v511, v500);
      swift_beginAccess();
      id v586 = *v508;
      id v321 = *v508;
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      [v495 invalidate];

      _AppExtensionProcess.invalidate()();
      (*(void (**)(uint64_t, uint64_t))(v552 + 8))(v546, v556);
      swift_unknownObjectRelease();
      goto LABEL_25;
    }
    v579 = v1 + 129;
    v545 = v1 + 2;
    v258(v1[189], v249, v248);
    v278 = Logger.logObject.getter();
    os_log_type_t v279 = static os_log_type_t.info.getter();
    v479 = v1 + 126;
    if (os_log_type_enabled(v278, v279))
    {
      v499 = (void (*)(uint64_t, uint64_t))v1[227];
      uint64_t v280 = v1[189];
      uint64_t v497 = v1[180];
      uint64_t v281 = swift_slowAlloc();
      v596[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v281 = 136315650;
      uint64_t v282 = MLHostTask.name.getter();
      v1[134] = sub_10000E564(v282, v283, v596);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_retain();
      swift_bridgeObjectRelease();
      v499(v280, v497);
      *(_WORD *)(v281 + 12) = 1024;
      *((_DWORD *)v1 + 209) = 1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v281 + 18) = 2080;
      swift_beginAccess();
      uint64_t v284 = Duration.description.getter();
      v1[137] = sub_10000E564(v284, v285, v596);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v278, v279, "Task %s continuing execution, shouldRun = %{BOOL}d, after %s.", (uint8_t *)v281, 0x1Cu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      ((void (*)(void, void))v1[227])(v1[189], v1[180]);
    }

    uint64_t v322 = v1[224];
    v512 = (void *)v1[222];
    os_log_t v517 = (os_log_t)v1[223];
    uint64_t v323 = (void (*)(void, uint64_t, uint64_t))v1[220];
    uint64_t v324 = *((unsigned int *)v1 + 493);
    uint64_t v325 = v1[219];
    uint64_t v501 = v1[218];
    v494 = (void (*)(uint64_t, uint64_t, void *))v1[216];
    uint64_t v326 = *((unsigned __int8 *)v1 + 1968);
    typeb = (void (*)(uint64_t, uint64_t, void *))v1[213];
    uint64_t v486 = v1[194];
    uint64_t v327 = v1[182];
    v485 = (void *)v1[180];
    uint64_t v328 = v1[179];
    uint64_t v329 = v478[178];
    uint64_t v330 = v478[177];
    uint64_t v493 = v478[145];
    uint64_t v331 = (v326 + 16) & ~v326;
    unint64_t v332 = (v327 + v331 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v333 = (v332 + 15) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v481 = v478[144];
    os_log_t logb = (os_log_t)(v478[146] + 16);
    v323(v478[179], v324, v330);
    swift_beginAccess();
    uint64_t v334 = v328;
    NSString v1 = v478;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v329 + 40))(v325, v334, v330);
    swift_beginAccess();
    v335 = *(void **)(v322 + 16);
    *(void *)(v322 + 16) = 0;

    typeb(v486, v481, v485);
    uint64_t v336 = swift_allocObject();
    v494(v336 + v331, v486, v485);
    *(void *)(v336 + v332) = v322;
    *(void *)(v336 + v333) = v501;
    *(void *)(v336 + ((v333 + 15) & 0xFFFFFFFFFFFFFFF8)) = v493;
    v478[6] = sub_10004A1FC;
    v478[7] = v336;
    v478[2] = _NSConcreteStackBlock;
    v478[3] = 1107296256;
    v478[4] = sub_1000287F8;
    v478[5] = &unk_100062318;
    v337 = _Block_copy(v545);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    [v512 doWorkWithContext:v517 reply:v337];
    _Block_release(v337);
    swift_beginAccess();
    if (LOBYTE(logb->isa) == 1)
    {
      uint64_t v338 = v478[224];
    }
    else
    {
      swift_beginAccess();
      uint64_t v338 = v478[224];
      if (!*(void *)(v338 + 16))
      {
        uint64_t v397 = v478[158];
        uint64_t v398 = v478[153];
        uint64_t v399 = v478[152];
        ContinuousClock.init()();
        v478[111] = 500000000000000000;
        v478[112] = 0;
        *(_OWORD *)(v478 + 99) = 0u;
        v554[24] = 1;
        uint64_t v400 = sub_100049750(&qword_100065848, (void (*)(uint64_t))&type metadata accessor for ContinuousClock);
        dispatch thunk of Clock.now.getter();
        sub_100049750(&qword_100065850, (void (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant);
        dispatch thunk of InstantProtocol.advanced(by:)();
        v401 = *(void (**)(uint64_t, uint64_t))(v398 + 8);
        v478[237] = v401;
        v478[238] = (v398 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
        v401(v397, v399);
        v402 = (void *)swift_task_alloc();
        v478[239] = v402;
        void *v402 = v478;
        v402[1] = sub_100040EA8;
        uint64_t v293 = v478[147];
        uint64_t v295 = v478[155];
        v294 = v478 + 99;
        uint64_t v296 = v400;
        goto LABEL_71;
      }
    }
    uint64_t v339 = v478[158];
    uint64_t v340 = v478[153];
    uint64_t v341 = v478[152];
    static ContinuousClock.now.getter();
    ContinuousClock.Instant.duration(to:)();
    v342 = *(void (**)(uint64_t, uint64_t))(v340 + 8);
    v478[232] = v342;
    v478[233] = (v340 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v342(v339, v341);
    v343 = *(void **)(v338 + 16);
    unsigned int v344 = (void (*)(uint64_t, uint64_t, uint64_t))v478[213];
    if (v343)
    {
      v557 = v342;
      v344(v478[187], v478[144], v478[180]);
      id v570 = v343;
      v345 = Logger.logObject.getter();
      os_log_type_t v346 = static os_log_type_t.info.getter();
      BOOL v347 = os_log_type_enabled(v345, v346);
      uint64_t v348 = (void (*)(uint64_t, uint64_t))v478[227];
      uint64_t v349 = v478[187];
      uint64_t v350 = v478[180];
      id v586 = v343;
      if (v347)
      {
        os_log_type_t v528 = v346;
        uint64_t v351 = swift_slowAlloc();
        v523 = (void *)swift_slowAlloc();
        v596[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v351 = 136315650;
        uint64_t v352 = MLHostTask.name.getter();
        uint64_t *v579 = sub_10000E564(v352, v353, v596);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        v348(v349, v350);
        *(_WORD *)(v351 + 12) = 2080;
        uint64_t v354 = Duration.description.getter();
        v478[130] = sub_10000E564(v354, v355, v596);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        *(_WORD *)(v351 + 22) = 2112;
        v478[131] = v570;
        id v356 = v570;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        void *v523 = v343;

        _os_log_impl((void *)&_mh_execute_header, v345, v528, "Task %s completed after %s. TaskResult: %@", (uint8_t *)v351, 0x20u);
        sub_10000E508(&qword_100065290);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        v348(v349, v350);
      }
      v372 = (void (*)(uint64_t, uint64_t))v478[229];
      uint64_t v373 = v478[219];
      uint64_t v374 = v478[179];
      uint64_t v375 = v478[178];
      uint64_t v376 = v478[177];
      uint64_t v377 = MLHostTask.name.getter();
      uint64_t v379 = v378;
      v547 = *(void (**)(uint64_t, uint64_t, uint64_t))(v375 + 16);
      v547(v374, v373, v376);
      sub_100018D90(v377, v379, v374);
      swift_bridgeObjectRelease();
      v372(v374, v376);
      uint64_t v380 = MLHostTask.name.getter();
      sub_100018964(v380, v381);
      swift_bridgeObjectRelease();
      MLHostResult.status.getter();
      uint64_t v382 = MLHostResultStatus.rawValue.getter();
      if (v382 == MLHostResultStatus.rawValue.getter())
      {
        v383 = (void *)v478[223];
        v557(v478[159], v478[152]);

        swift_unknownObjectRelease();
      }
      else
      {
        os_log_t v519 = (os_log_t)v478[229];
        uint64_t v384 = v478[219];
        uint64_t v385 = v478[179];
        uint64_t v386 = v478[177];
        uint64_t v571 = v478[159];
        v530 = (void *)v478[223];
        uint64_t v537 = v478[152];
        id v387 = [(id)v478[215] processIdentifier];
        v596[0] = 0;
        v596[1] = 0xE000000000000000;
        _StringGuts.grow(_:)(38);
        uint64_t v388 = v596[1];
        v478[105] = v596[0];
        v478[106] = v388;
        v389._uint64_t countAndFlagsBits = 0x206B736154;
        v389._object = (void *)0xE500000000000000;
        String.append(_:)(v389);
        v390._uint64_t countAndFlagsBits = MLHostTask.name.getter();
        String.append(_:)(v390);
        swift_bridgeObjectRelease();
        v391._object = (void *)0x8000000100056250;
        v391._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
        String.append(_:)(v391);
        v547(v385, v384, v386);
        _print_unlocked<A, B>(_:_:)();
        ((void (*)(uint64_t, uint64_t))v519)(v385, v386);
        v392._uint64_t countAndFlagsBits = 46;
        v392._object = (void *)0xE100000000000000;
        String.append(_:)(v392);
        sub_100039C94((uint64_t)v387);

        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        v557(v571, v537);
      }
      swift_release();
      swift_release();
      v393 = (void *)v478[215];
      uint64_t v394 = v478[176];
      uint64_t v395 = v478[175];
      uint64_t v396 = v478[174];
      swift_release();
      swift_release();
      [v393 invalidate];

      _AppExtensionProcess.invalidate()();
      (*(void (**)(uint64_t, uint64_t))(v395 + 8))(v394, v396);
      swift_unknownObjectRelease();
      goto LABEL_25;
    }
    uint64_t v357 = v478[186];
    uint64_t v358 = v478[180];
    uint64_t v359 = v478[144];
    ((void (*)(void, void, void))v478[211])(v478[203], v478[210], v478[199]);
    v344(v357, v359, v358);
    v360 = Logger.logObject.getter();
    os_log_type_t v529 = static os_log_type_t.info.getter();
    BOOL v361 = os_log_type_enabled(v360, v529);
    v362 = (void (*)(uint64_t, uint64_t))v478[227];
    v363 = (void (*)(uint64_t, uint64_t))v478[226];
    uint64_t v364 = v478[203];
    uint64_t v593 = v478[199];
    uint64_t v365 = v478[186];
    uint64_t v366 = v478[180];
    if (v361)
    {
      os_log_t v518 = (os_log_t)v478[226];
      uint64_t v367 = swift_slowAlloc();
      v596[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v367 = 136315394;
      uint64_t v368 = MLHostTask.name.getter();
      uint64_t *v479 = sub_10000E564(v368, v369, v596);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v362(v365, v366);
      *(_WORD *)(v367 + 12) = 2080;
      uint64_t v370 = Duration.description.getter();
      v478[127] = sub_10000E564(v370, v371, v596);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v360, v529, "Task %s asked to terminate because of deferral after %s.", (uint8_t *)v367, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      ((void (*)(uint64_t, uint64_t))v518)(v364, v593);
    }
    else
    {
      v362(v478[186], v478[180]);

      v363(v364, v593);
    }
    uint64_t v403 = v478[224];
    v404 = (void *)v478[222];
    static ContinuousClock.now.getter();
    uint64_t v405 = swift_allocObject();
    v478[234] = v405;
    *(void *)(v405 + 16) = 0;
    *(void *)(v405 + 24) = 0;
    [v404 doStop];
    v406 = *(void **)(v403 + 16);
    if (v406) {
      goto LABEL_96;
    }
    if (static Duration.< infix(_:_:)())
    {
      v406 = *(void **)(v478[224] + 16);
      if (!v406)
      {
        v418 = (void (*)(uint64_t, void, uint64_t))v478[220];
        v581 = (void (*)(uint64_t, uint64_t, os_log_t))v478[213];
        v548 = (void (*)(uint64_t, uint64_t))v478[229];
        v531 = (void (*)(uint64_t, uint64_t, os_log_t))v478[211];
        uint64_t v419 = v478[202];
        os_log_t logc = (os_log_t)v478[199];
        uint64_t v509 = v478[210];
        uint64_t v513 = v478[185];
        os_log_t v520 = (os_log_t)v478[180];
        uint64_t v420 = v478[179];
        uint64_t v421 = v478[177];
        uint64_t v422 = v478[144];
        uint64_t v423 = MLHostTask.name.getter();
        uint64_t v425 = v424;
        v418(v420, enum case for TaskStatus.taskDeferred(_:), v421);
        sub_100018D90(v423, v425, v420);
        swift_bridgeObjectRelease();
        v548(v420, v421);
        v531(v419, v509, logc);
        v581(v513, v422, v520);
        v426 = Logger.logObject.getter();
        os_log_type_t v427 = static os_log_type_t.error.getter();
        BOOL v428 = os_log_type_enabled(v426, v427);
        uint64_t v582 = v478[202];
        v594 = (void (*)(uint64_t, uint64_t))v478[226];
        v538 = (void (*)(uint64_t, uint64_t))v478[227];
        uint64_t v573 = v478[199];
        uint64_t v429 = v478[185];
        uint64_t v430 = v478[180];
        if (v428)
        {
          v431 = (uint8_t *)swift_slowAlloc();
          v596[0] = swift_slowAlloc();
          *(_DWORD *)v431 = 136315138;
          uint64_t v432 = MLHostTask.name.getter();
          v478[122] = sub_10000E564(v432, v433, v596);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          v538(v429, v430);
          _os_log_impl((void *)&_mh_execute_header, v426, v427, "Task %s has not responded to deferral. Marking task as deferred and terminating process.", v431, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          v538(v478[185], v478[180]);
        }

        v594(v582, v573);
        NSString v1 = v478;
        id v473 = [(id)v478[215] processIdentifier];
        v596[0] = 0;
        v596[1] = 0xE000000000000000;
        _StringGuts.grow(_:)(38);
        v474._uint64_t countAndFlagsBits = 0x206B736154;
        v474._object = (void *)0xE500000000000000;
        String.append(_:)(v474);
        v475._uint64_t countAndFlagsBits = MLHostTask.name.getter();
        String.append(_:)(v475);
        swift_bridgeObjectRelease();
        v476._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
        v476._object = (void *)0x8000000100056230;
        String.append(_:)(v476);
        sub_100039C94((uint64_t)v473);
        goto LABEL_103;
      }
LABEL_96:
      v580 = (void (*)(uint64_t, uint64_t))v478[229];
      uint64_t v407 = v478[219];
      uint64_t v408 = v478[179];
      uint64_t v409 = v478[178];
      uint64_t v410 = v478[177];
      id v572 = v406;
      uint64_t v411 = MLHostTask.name.getter();
      uint64_t v413 = v412;
      v414 = *(void (**)(uint64_t, uint64_t, uint64_t))(v409 + 16);
      v414(v408, v407, v410);
      sub_100018D90(v411, v413, v408);
      swift_bridgeObjectRelease();
      v580(v408, v410);
      uint64_t v415 = MLHostTask.name.getter();
      sub_100018964(v415, v416);
      swift_bridgeObjectRelease();
      MLHostResult.status.getter();
      uint64_t v417 = MLHostResultStatus.rawValue.getter();
      if (v417 == MLHostResultStatus.rawValue.getter())
      {

LABEL_104:
        ((void (*)(void, void, void))v1[213])(v1[184], v1[144], v1[180]);
        swift_retain_n();
        v443 = Logger.logObject.getter();
        os_log_type_t v444 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v443, v444))
        {
          v445 = v1 + 120;
          v532 = (void (*)(uint64_t, uint64_t))v1[227];
          uint64_t v563 = v1[224];
          v574 = v1 + 121;
          uint64_t v446 = v1[184];
          uint64_t v447 = v478[180];
          uint64_t v448 = swift_slowAlloc();
          v584 = (void *)swift_slowAlloc();
          v596[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v448 = 136315650;
          uint64_t v449 = MLHostTask.name.getter();
          v478[117] = sub_10000E564(v449, v450, v596);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_retain();
          v451 = v445;
          swift_bridgeObjectRelease();
          uint64_t v452 = v447;
          NSString v1 = v478;
          v532(v446, v452);
          *(_WORD *)(v448 + 12) = 2080;
          swift_beginAccess();
          uint64_t v453 = Duration.description.getter();
          v478[119] = sub_10000E564(v453, v454, v596);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          swift_release();
          *(_WORD *)(v448 + 22) = 2112;
          v455 = *(void **)(v563 + 16);
          if (v455)
          {
            void *v574 = v455;
            id v456 = v455;
          }
          else
          {
            void *v451 = 0;
          }
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          v465 = (void (*)(uint64_t, uint64_t))v478[232];
          v466 = (void *)v478[223];
          uint64_t v576 = v478[159];
          uint64_t v564 = v478[157];
          uint64_t v467 = v478[152];
          void *v584 = v455;
          swift_release_n();
          _os_log_impl((void *)&_mh_execute_header, v443, v444, "Task %s deferred after awaiting %s for its cooperative termination. TaskResult: %@", (uint8_t *)v448, 0x20u);
          sub_10000E508(&qword_100065290);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          swift_unknownObjectRelease();
          v465(v564, v467);
          v465(v576, v467);
        }
        else
        {
          v457 = (void (*)(uint64_t, uint64_t))v1[232];
          uint64_t v458 = v1[184];
          uint64_t v459 = v1[180];
          v585 = (void (*)(uint64_t, uint64_t))v1[227];
          uint64_t v595 = v1[159];
          uint64_t v575 = v1[157];
          uint64_t v460 = v1[152];

          swift_unknownObjectRelease();
          swift_release_n();
          v585(v458, v459);
          v457(v575, v460);
          v457(v595, v460);
        }
        v468 = (void *)v1[215];
        uint64_t v469 = v1[176];
        uint64_t v470 = v1[175];
        uint64_t v471 = v1[174];
        id v586 = *(id *)(v1[224] + 16);
        id v472 = v586;
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        [v468 invalidate];

        _AppExtensionProcess.invalidate()();
        (*(void (**)(uint64_t, uint64_t))(v470 + 8))(v469, v471);
LABEL_24:
        swift_unknownObjectRelease();
LABEL_25:
        swift_release_n();
LABEL_36:
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        uint64_t v134 = (uint64_t (*)(id))v1[1];
        return v134(v586);
      }
      v583 = (void (*)(uint64_t, uint64_t))v478[229];
      uint64_t v434 = v478[219];
      uint64_t v435 = v478[179];
      uint64_t v436 = v478[177];
      id v437 = [(id)v478[215] processIdentifier];
      v596[0] = 0;
      v596[1] = 0xE000000000000000;
      _StringGuts.grow(_:)(38);
      uint64_t v438 = v596[1];
      v478[113] = v596[0];
      v478[114] = v438;
      v439._uint64_t countAndFlagsBits = 0x206B736154;
      v439._object = (void *)0xE500000000000000;
      String.append(_:)(v439);
      v440._uint64_t countAndFlagsBits = MLHostTask.name.getter();
      String.append(_:)(v440);
      swift_bridgeObjectRelease();
      v441._object = (void *)0x8000000100056250;
      v441._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
      String.append(_:)(v441);
      v414(v435, v434, v436);
      _print_unlocked<A, B>(_:_:)();
      v583(v435, v436);
      v442._uint64_t countAndFlagsBits = 46;
      v442._object = (void *)0xE100000000000000;
      String.append(_:)(v442);
      sub_100039C94((uint64_t)v437);

LABEL_103:
      swift_bridgeObjectRelease();
      goto LABEL_104;
    }
    v461 = (void (*)(uint64_t, uint64_t))v478[232];
    uint64_t v462 = v478[158];
    uint64_t v463 = v478[152];
    ContinuousClock.init()();
    v478[107] = 500000000000000000;
    v478[108] = 0;
    *((_OWORD *)v478 + 51) = 0u;
    v554[48] = 1;
    uint64_t v289 = sub_100049750(&qword_100065848, (void (*)(uint64_t))&type metadata accessor for ContinuousClock);
    dispatch thunk of Clock.now.getter();
    sub_100049750(&qword_100065850, (void (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant);
    dispatch thunk of InstantProtocol.advanced(by:)();
    v461(v462, v463);
    v464 = (void *)swift_task_alloc();
    v478[235] = v464;
    void *v464 = v478;
    v464[1] = sub_10003F2DC;
    uint64_t v292 = v478[156];
    uint64_t v293 = v478[147];
    v294 = v478 + 102;
  }
  else
  {
    uint64_t v286 = v1[158];
    uint64_t v287 = v1[153];
    uint64_t v288 = v1[152];
    ContinuousClock.init()();
    v1[109] = 500000000000000000;
    v1[110] = 0;
    *((_OWORD *)v1 + 48) = 0u;
    unsigned char *v554 = 1;
    uint64_t v289 = sub_100049750(&qword_100065848, (void (*)(uint64_t))&type metadata accessor for ContinuousClock);
    dispatch thunk of Clock.now.getter();
    sub_100049750(&qword_100065850, (void (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant);
    dispatch thunk of InstantProtocol.advanced(by:)();
    v290 = *(void (**)(uint64_t, uint64_t))(v287 + 8);
    v1[241] = v290;
    v1[242] = (v287 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v290(v286, v288);
    long long v291 = (void *)swift_task_alloc();
    v1[243] = v291;
    *long long v291 = v1;
    v291[1] = sub_100043D34;
    uint64_t v292 = v1[154];
    uint64_t v293 = v1[147];
    v294 = v1 + 96;
  }
  uint64_t v295 = v292;
  uint64_t v296 = v289;
LABEL_71:
  return dispatch thunk of Clock.sleep(until:tolerance:)(v295, v294, v293, v296);
}

uint64_t sub_10003F2DC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 1888) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2 + 1856))(*(void *)(v2 + 1248), *(void *)(v2 + 1216));
    Swift::String v3 = sub_100040244;
  }
  else
  {
    uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v2 + 1856);
    uint64_t v5 = *(void *)(v2 + 1248);
    uint64_t v6 = *(void *)(v2 + 1216);
    uint64_t v7 = *(void *)(v2 + 1208);
    uint64_t v8 = *(void *)(v2 + 1184);
    uint64_t v9 = *(void *)(v2 + 1176);
    v4(v5, v6);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    Swift::String v3 = sub_10003F470;
  }
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(v3, 0, 0);
}

uint64_t sub_10003F470()
{
  uint64_t v108 = v0;
  uint64_t v1 = *(void *)(v0 + 1872);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v0 + 1856);
  uint64_t v3 = *(void *)(v0 + 1792);
  uint64_t v4 = *(void *)(v0 + 1264);
  uint64_t v5 = *(void *)(v0 + 1216);
  static ContinuousClock.now.getter();
  uint64_t v6 = ContinuousClock.Instant.duration(to:)();
  uint64_t v8 = v7;
  v2(v4, v5);
  *(void *)(v1 + 16) = v6;
  *(void *)(v1 + 24) = v8;
  uint64_t v9 = *(void **)(v3 + 16);
  if (v9) {
    goto LABEL_2;
  }
  if (static Duration.< infix(_:_:)())
  {
    uint64_t v9 = *(void **)(*(void *)(v0 + 1792) + 16);
    if (!v9)
    {
      uint64_t v92 = *(void (**)(uint64_t, uint64_t))(v0 + 1832);
      uint64_t v21 = *(void (**)(uint64_t, void, uint64_t))(v0 + 1760);
      uint64_t v99 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1704);
      uint64_t v90 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1688);
      uint64_t v22 = *(void *)(v0 + 1616);
      uint64_t v84 = *(void *)(v0 + 1592);
      uint64_t v85 = *(void *)(v0 + 1680);
      uint64_t v87 = *(void *)(v0 + 1480);
      uint64_t v88 = *(void *)(v0 + 1440);
      uint64_t v23 = *(void *)(v0 + 1432);
      uint64_t v24 = *(void *)(v0 + 1416);
      uint64_t v25 = *(void *)(v0 + 1152);
      uint64_t v26 = MLHostTask.name.getter();
      uint64_t v28 = v27;
      v21(v23, enum case for TaskStatus.taskDeferred(_:), v24);
      sub_100018D90(v26, v28, v23);
      swift_bridgeObjectRelease();
      v92(v23, v24);
      v90(v22, v85, v84);
      v99(v87, v25, v88);
      uint64_t v29 = Logger.logObject.getter();
      os_log_type_t v30 = static os_log_type_t.error.getter();
      BOOL v31 = os_log_type_enabled(v29, v30);
      uint64_t v32 = *(void (**)(uint64_t, uint64_t))(v0 + 1808);
      uint64_t v33 = *(void *)(v0 + 1616);
      uint64_t v34 = *(void *)(v0 + 1592);
      uint64_t v35 = *(void *)(v0 + 1480);
      uint64_t v36 = *(void *)(v0 + 1440);
      if (v31)
      {
        uint64_t v104 = *(void (**)(uint64_t, uint64_t))(v0 + 1808);
        uint64_t v91 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
        uint64_t v100 = *(void *)(v0 + 1616);
        uint64_t v37 = (uint8_t *)swift_slowAlloc();
        uint64_t v106 = swift_slowAlloc();
        *(_DWORD *)uint64_t v37 = 136315138;
        uint64_t v38 = MLHostTask.name.getter();
        *(void *)(v0 + 976) = sub_10000E564(v38, v39, &v106);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        v91(v35, v36);
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "Task %s has not responded to deferral. Marking task as deferred and terminating process.", v37, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v104(v100, v34);
      }
      else
      {
        (*(void (**)(void, void))(v0 + 1816))(*(void *)(v0 + 1480), *(void *)(v0 + 1440));

        v32(v33, v34);
      }
      id v78 = [*(id *)(v0 + 1720) processIdentifier];
      uint64_t v106 = 0;
      unint64_t v107 = 0xE000000000000000;
      _StringGuts.grow(_:)(38);
      v79._uint64_t countAndFlagsBits = 0x206B736154;
      v79._object = (void *)0xE500000000000000;
      String.append(_:)(v79);
      v80._uint64_t countAndFlagsBits = MLHostTask.name.getter();
      String.append(_:)(v80);
      swift_bridgeObjectRelease();
      v81._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
      v81._object = (void *)0x8000000100056230;
      String.append(_:)(v81);
      sub_100039C94((uint64_t)v78);
      goto LABEL_9;
    }
LABEL_2:
    uint64_t v98 = *(void (**)(uint64_t, uint64_t))(v0 + 1832);
    uint64_t v10 = *(void *)(v0 + 1752);
    uint64_t v11 = *(void *)(v0 + 1432);
    uint64_t v12 = *(void *)(v0 + 1424);
    uint64_t v13 = *(void *)(v0 + 1416);
    id v94 = v9;
    uint64_t v14 = MLHostTask.name.getter();
    uint64_t v16 = v15;
    uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
    v17(v11, v10, v13);
    sub_100018D90(v14, v16, v11);
    swift_bridgeObjectRelease();
    v98(v11, v13);
    uint64_t v18 = MLHostTask.name.getter();
    sub_100018964(v18, v19);
    swift_bridgeObjectRelease();
    MLHostResult.status.getter();
    uint64_t v20 = MLHostResultStatus.rawValue.getter();
    if (v20 == MLHostResultStatus.rawValue.getter())
    {

LABEL_10:
      (*(void (**)(void, void, void))(v0 + 1704))(*(void *)(v0 + 1472), *(void *)(v0 + 1152), *(void *)(v0 + 1440));
      swift_retain_n();
      uint64_t v48 = Logger.logObject.getter();
      os_log_type_t v49 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v48, v49))
      {
        uint64_t v89 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
        uint64_t v95 = *(void *)(v0 + 1792);
        uint64_t v50 = *(void *)(v0 + 1472);
        uint64_t v86 = *(void *)(v0 + 1440);
        uint64_t v51 = swift_slowAlloc();
        os_log_type_t v102 = (void *)swift_slowAlloc();
        uint64_t v106 = swift_slowAlloc();
        *(_DWORD *)uint64_t v51 = 136315650;
        uint64_t v52 = MLHostTask.name.getter();
        *(void *)(v0 + 936) = sub_10000E564(v52, v53, &v106);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_retain();
        swift_bridgeObjectRelease();
        v89(v50, v86);
        *(_WORD *)(v51 + 12) = 2080;
        swift_beginAccess();
        uint64_t v54 = Duration.description.getter();
        *(void *)(v0 + 952) = sub_10000E564(v54, v55, &v106);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        swift_release();
        *(_WORD *)(v51 + 22) = 2112;
        uint64_t v56 = *(void **)(v95 + 16);
        if (v56)
        {
          *(void *)(v0 + 968) = v56;
          id v57 = v56;
        }
        else
        {
          *(void *)(v0 + 960) = 0;
        }
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        uint64_t v69 = *(void (**)(uint64_t, uint64_t))(v0 + 1856);
        uint64_t v70 = *(void **)(v0 + 1784);
        uint64_t v97 = *(void *)(v0 + 1272);
        uint64_t v93 = *(void *)(v0 + 1256);
        uint64_t v71 = *(void *)(v0 + 1216);
        *os_log_type_t v102 = v56;
        swift_release_n();
        _os_log_impl((void *)&_mh_execute_header, v48, v49, "Task %s deferred after awaiting %s for its cooperative termination. TaskResult: %@", (uint8_t *)v51, 0x20u);
        sub_10000E508(&qword_100065290);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        swift_unknownObjectRelease();
        v69(v93, v71);
        v69(v97, v71);
      }
      else
      {
        uint64_t v58 = *(void (**)(uint64_t, uint64_t))(v0 + 1856);
        uint64_t v59 = *(void *)(v0 + 1472);
        uint64_t v60 = *(void *)(v0 + 1440);
        BOOL v103 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
        uint64_t v105 = *(void *)(v0 + 1272);
        uint64_t v96 = *(void *)(v0 + 1256);
        uint64_t v61 = *(void *)(v0 + 1216);

        swift_unknownObjectRelease();
        swift_release_n();
        v103(v59, v60);
        v58(v96, v61);
        v58(v105, v61);
      }
      unint64_t v72 = *(void **)(v0 + 1720);
      uint64_t v73 = *(void *)(v0 + 1408);
      uint64_t v74 = *(void *)(v0 + 1400);
      uint64_t v75 = *(void *)(v0 + 1392);
      uint64_t v83 = *(void **)(*(void *)(v0 + 1792) + 16);
      id v76 = v83;
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      [v72 invalidate];

      _AppExtensionProcess.invalidate()();
      (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v73, v75);
      swift_unknownObjectRelease();
      swift_release_n();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v77 = *(uint64_t (**)(void *))(v0 + 8);
      return v77(v83);
    }
    id v101 = *(void (**)(uint64_t, uint64_t))(v0 + 1832);
    uint64_t v40 = *(void *)(v0 + 1752);
    uint64_t v41 = *(void *)(v0 + 1432);
    uint64_t v42 = *(void *)(v0 + 1416);
    id v43 = [*(id *)(v0 + 1720) processIdentifier];
    uint64_t v106 = 0;
    unint64_t v107 = 0xE000000000000000;
    _StringGuts.grow(_:)(38);
    *(void *)(v0 + 904) = 0;
    *(void *)(v0 + 912) = 0xE000000000000000;
    v44._uint64_t countAndFlagsBits = 0x206B736154;
    v44._object = (void *)0xE500000000000000;
    String.append(_:)(v44);
    v45._uint64_t countAndFlagsBits = MLHostTask.name.getter();
    String.append(_:)(v45);
    swift_bridgeObjectRelease();
    v46._object = (void *)0x8000000100056250;
    v46._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
    String.append(_:)(v46);
    v17(v41, v40, v42);
    _print_unlocked<A, B>(_:_:)();
    v101(v41, v42);
    v47._uint64_t countAndFlagsBits = 46;
    v47._object = (void *)0xE100000000000000;
    String.append(_:)(v47);
    sub_100039C94((uint64_t)v43);

LABEL_9:
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  uint64_t v62 = *(void (**)(uint64_t, uint64_t))(v0 + 1856);
  uint64_t v63 = *(void *)(v0 + 1264);
  uint64_t v64 = *(void *)(v0 + 1216);
  ContinuousClock.init()();
  *(void *)(v0 + 856) = 500000000000000000;
  *(void *)(v0 + 864) = 0;
  *(_OWORD *)(v0 + 816) = 0u;
  *(unsigned char *)(v0 + 832) = 1;
  uint64_t v65 = sub_100049750(&qword_100065848, (void (*)(uint64_t))&type metadata accessor for ContinuousClock);
  dispatch thunk of Clock.now.getter();
  sub_100049750(&qword_100065850, (void (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant);
  dispatch thunk of InstantProtocol.advanced(by:)();
  v62(v63, v64);
  uint64_t v66 = (void *)swift_task_alloc();
  *(void *)(v0 + 1880) = v66;
  *uint64_t v66 = v0;
  v66[1] = sub_10003F2DC;
  uint64_t v67 = *(void *)(v0 + 1248);
  uint64_t v68 = *(void *)(v0 + 1176);
  return dispatch thunk of Clock.sleep(until:tolerance:)(v67, v0 + 816, v68, v65);
}

uint64_t sub_100040244()
{
  uint64_t v95 = v0;
  (*(void (**)(void, void))(*(void *)(v0 + 1184) + 8))(*(void *)(v0 + 1208), *(void *)(v0 + 1176));
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Task.sleep interrupted, skipping waiting for extension termination.", v3, 2u);
    swift_slowDealloc();
  }
  swift_errorRelease();

  uint64_t v4 = *(void **)(*(void *)(v0 + 1792) + 16);
  uint64_t v91 = *(void (**)(uint64_t, uint64_t))(v0 + 1832);
  if (v4)
  {
    uint64_t v5 = *(void *)(v0 + 1752);
    uint64_t v6 = *(void *)(v0 + 1432);
    uint64_t v7 = *(void *)(v0 + 1424);
    uint64_t v8 = *(void *)(v0 + 1416);
    id v9 = v4;
    uint64_t v10 = MLHostTask.name.getter();
    uint64_t v12 = v11;
    os_log_type_t v82 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
    v82(v6, v5, v8);
    sub_100018D90(v10, v12, v6);
    swift_bridgeObjectRelease();
    v91(v6, v8);
    uint64_t v13 = MLHostTask.name.getter();
    sub_100018964(v13, v14);
    swift_bridgeObjectRelease();
    uint64_t v15 = v9;
    MLHostResult.status.getter();
    uint64_t v16 = MLHostResultStatus.rawValue.getter();
    if (v16 == MLHostResultStatus.rawValue.getter())
    {

      goto LABEL_12;
    }
    uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v0 + 1832);
    uint64_t v37 = *(void *)(v0 + 1752);
    uint64_t v38 = *(void *)(v0 + 1432);
    uint64_t v39 = *(void *)(v0 + 1416);
    id v40 = [*(id *)(v0 + 1720) processIdentifier];
    uint64_t v93 = 0;
    unint64_t v94 = 0xE000000000000000;
    _StringGuts.grow(_:)(38);
    *(void *)(v0 + 904) = 0;
    *(void *)(v0 + 912) = 0xE000000000000000;
    v41._uint64_t countAndFlagsBits = 0x206B736154;
    v41._object = (void *)0xE500000000000000;
    String.append(_:)(v41);
    v42._uint64_t countAndFlagsBits = MLHostTask.name.getter();
    String.append(_:)(v42);
    swift_bridgeObjectRelease();
    v43._object = (void *)0x8000000100056250;
    v43._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
    String.append(_:)(v43);
    v82(v38, v37, v39);
    _print_unlocked<A, B>(_:_:)();
    v36(v38, v39);
    v44._uint64_t countAndFlagsBits = 46;
    v44._object = (void *)0xE100000000000000;
    String.append(_:)(v44);
    sub_100039C94((uint64_t)v40);
  }
  else
  {
    uint64_t v17 = *(void (**)(uint64_t, void, uint64_t))(v0 + 1760);
    uint64_t v84 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1704);
    Swift::String v80 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1688);
    uint64_t v76 = *(void *)(v0 + 1680);
    uint64_t v18 = *(void *)(v0 + 1616);
    uint64_t v75 = *(void *)(v0 + 1592);
    uint64_t v78 = *(void *)(v0 + 1480);
    uint64_t v79 = *(void *)(v0 + 1440);
    uint64_t v19 = *(void *)(v0 + 1432);
    uint64_t v20 = *(void *)(v0 + 1416);
    uint64_t v21 = *(void *)(v0 + 1152);
    uint64_t v22 = MLHostTask.name.getter();
    uint64_t v24 = v23;
    v17(v19, enum case for TaskStatus.taskDeferred(_:), v20);
    sub_100018D90(v22, v24, v19);
    swift_bridgeObjectRelease();
    v91(v19, v20);
    v80(v18, v76, v75);
    v84(v78, v21, v79);
    uint64_t v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.error.getter();
    BOOL v27 = os_log_type_enabled(v25, v26);
    uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v0 + 1808);
    uint64_t v29 = *(void *)(v0 + 1616);
    uint64_t v30 = *(void *)(v0 + 1592);
    uint64_t v31 = *(void *)(v0 + 1480);
    uint64_t v32 = *(void *)(v0 + 1440);
    if (v27)
    {
      Swift::String v81 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
      uint64_t v86 = *(void *)(v0 + 1616);
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v93 = swift_slowAlloc();
      *(_DWORD *)uint64_t v33 = 136315138;
      uint64_t v34 = MLHostTask.name.getter();
      *(void *)(v0 + 976) = sub_10000E564(v34, v35, &v93);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v81(v31, v32);
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Task %s has not responded to deferral. Marking task as deferred and terminating process.", v33, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v28(v86, v30);
    }
    else
    {
      (*(void (**)(void, void))(v0 + 1816))(*(void *)(v0 + 1480), *(void *)(v0 + 1440));

      v28(v29, v30);
    }
    id v45 = [*(id *)(v0 + 1720) processIdentifier];
    uint64_t v93 = 0;
    unint64_t v94 = 0xE000000000000000;
    _StringGuts.grow(_:)(38);
    v46._uint64_t countAndFlagsBits = 0x206B736154;
    v46._object = (void *)0xE500000000000000;
    String.append(_:)(v46);
    v47._uint64_t countAndFlagsBits = MLHostTask.name.getter();
    String.append(_:)(v47);
    swift_bridgeObjectRelease();
    v48._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
    v48._object = (void *)0x8000000100056230;
    String.append(_:)(v48);
    sub_100039C94((uint64_t)v45);
  }
  swift_bridgeObjectRelease();
LABEL_12:
  (*(void (**)(void, void, void))(v0 + 1704))(*(void *)(v0 + 1472), *(void *)(v0 + 1152), *(void *)(v0 + 1440));
  swift_retain_n();
  os_log_type_t v49 = Logger.logObject.getter();
  os_log_type_t v50 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v49, v50))
  {
    uint64_t v77 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
    uint64_t v83 = *(void *)(v0 + 1792);
    uint64_t v51 = *(void *)(v0 + 1472);
    uint64_t v74 = *(void *)(v0 + 1440);
    uint64_t v52 = swift_slowAlloc();
    uint64_t v87 = (void *)swift_slowAlloc();
    uint64_t v93 = swift_slowAlloc();
    *(_DWORD *)uint64_t v52 = 136315650;
    uint64_t v53 = MLHostTask.name.getter();
    *(void *)(v0 + 936) = sub_10000E564(v53, v54, &v93);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_retain();
    swift_bridgeObjectRelease();
    v77(v51, v74);
    *(_WORD *)(v52 + 12) = 2080;
    swift_beginAccess();
    uint64_t v55 = Duration.description.getter();
    *(void *)(v0 + 952) = sub_10000E564(v55, v56, &v93);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_release();
    *(_WORD *)(v52 + 22) = 2112;
    id v57 = *(void **)(v83 + 16);
    if (v57)
    {
      *(void *)(v0 + 968) = v57;
      id v58 = v57;
    }
    else
    {
      *(void *)(v0 + 960) = 0;
    }
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    uint64_t v63 = *(void (**)(uint64_t, uint64_t))(v0 + 1856);
    uint64_t v64 = *(void **)(v0 + 1784);
    uint64_t v90 = *(void *)(v0 + 1272);
    uint64_t v85 = *(void *)(v0 + 1256);
    uint64_t v65 = *(void *)(v0 + 1216);
    *uint64_t v87 = v57;
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v49, v50, "Task %s deferred after awaiting %s for its cooperative termination. TaskResult: %@", (uint8_t *)v52, 0x20u);
    sub_10000E508(&qword_100065290);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_unknownObjectRelease();
    v63(v85, v65);
    v63(v90, v65);
  }
  else
  {
    uint64_t v59 = *(void (**)(uint64_t, uint64_t))(v0 + 1856);
    uint64_t v60 = *(void *)(v0 + 1472);
    uint64_t v61 = *(void *)(v0 + 1440);
    uint64_t v89 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
    uint64_t v92 = *(void *)(v0 + 1272);
    uint64_t v88 = *(void *)(v0 + 1256);
    uint64_t v62 = *(void *)(v0 + 1216);

    swift_unknownObjectRelease();
    swift_release_n();
    v89(v60, v61);
    v59(v88, v62);
    v59(v92, v62);
  }
  uint64_t v66 = *(void **)(v0 + 1720);
  uint64_t v67 = *(void *)(v0 + 1408);
  uint64_t v68 = *(void *)(v0 + 1400);
  uint64_t v69 = *(void *)(v0 + 1392);
  uint64_t v73 = *(void **)(*(void *)(v0 + 1792) + 16);
  id v70 = v73;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  [v66 invalidate];

  _AppExtensionProcess.invalidate()();
  (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v67, v69);
  swift_unknownObjectRelease();
  swift_release_n();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v71 = *(uint64_t (**)(void *))(v0 + 8);
  return v71(v73);
}

uint64_t sub_100040EA8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 1920) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2 + 1896))(*(void *)(v2 + 1240), *(void *)(v2 + 1216));
    uint64_t v3 = sub_100042740;
  }
  else
  {
    uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v2 + 1896);
    uint64_t v5 = *(void *)(v2 + 1240);
    uint64_t v6 = *(void *)(v2 + 1216);
    uint64_t v7 = *(void *)(v2 + 1200);
    uint64_t v8 = *(void *)(v2 + 1184);
    uint64_t v9 = *(void *)(v2 + 1176);
    v4(v5, v6);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    uint64_t v3 = sub_10004103C;
  }
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(v3, 0, 0);
}

uint64_t sub_10004103C()
{
  uint64_t v183 = v0;
  uint64_t v1 = *(void *)(v0 + 1792);
  if ((*(unsigned char *)(*(void *)(v0 + 1168) + 16) & 1) != 0 || *(void *)(v1 + 16))
  {
    uint64_t v2 = *(void *)(v0 + 1264);
    uint64_t v3 = *(void *)(v0 + 1224);
    uint64_t v4 = *(void *)(v0 + 1216);
    static ContinuousClock.now.getter();
    ContinuousClock.Instant.duration(to:)();
    uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
    *(void *)(v0 + 1856) = v5;
    *(void *)(v0 + 1864) = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v5(v2, v4);
    uint64_t v6 = *(void **)(v1 + 16);
    uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1704);
    if (v6)
    {
      v7(*(void *)(v0 + 1496), *(void *)(v0 + 1152), *(void *)(v0 + 1440));
      id v8 = v6;
      uint64_t v9 = Logger.logObject.getter();
      os_log_type_t v156 = static os_log_type_t.info.getter();
      BOOL v10 = os_log_type_enabled(v9, v156);
      uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
      uint64_t v12 = *(void *)(v0 + 1496);
      uint64_t v13 = *(void *)(v0 + 1440);
      uint64_t v178 = v6;
      uint64_t v159 = v5;
      if (v10)
      {
        uint64_t v14 = swift_slowAlloc();
        uint64_t v152 = (void *)swift_slowAlloc();
        uint64_t v181 = swift_slowAlloc();
        *(_DWORD *)uint64_t v14 = 136315650;
        uint64_t v15 = MLHostTask.name.getter();
        *(void *)(v0 + 1032) = sub_10000E564(v15, v16, &v181);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        v11(v12, v13);
        *(_WORD *)(v14 + 12) = 2080;
        uint64_t v17 = Duration.description.getter();
        *(void *)(v0 + 1040) = sub_10000E564(v17, v18, &v181);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        *(_WORD *)(v14 + 22) = 2112;
        *(void *)(v0 + 1048) = v8;
        id v19 = v8;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *uint64_t v152 = v6;

        _os_log_impl((void *)&_mh_execute_header, v9, v156, "Task %s completed after %s. TaskResult: %@", (uint8_t *)v14, 0x20u);
        sub_10000E508(&qword_100065290);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        v11(v12, v13);
      }
      uint64_t v37 = *(void (**)(uint64_t, uint64_t))(v0 + 1832);
      uint64_t v38 = *(void *)(v0 + 1752);
      uint64_t v39 = *(void *)(v0 + 1432);
      uint64_t v40 = *(void *)(v0 + 1424);
      uint64_t v41 = *(void *)(v0 + 1416);
      uint64_t v42 = MLHostTask.name.getter();
      uint64_t v44 = v43;
      unint64_t v157 = *(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 16);
      v157(v39, v38, v41);
      sub_100018D90(v42, v44, v39);
      swift_bridgeObjectRelease();
      v37(v39, v41);
      uint64_t v45 = MLHostTask.name.getter();
      sub_100018964(v45, v46);
      swift_bridgeObjectRelease();
      MLHostResult.status.getter();
      uint64_t v47 = MLHostResultStatus.rawValue.getter();
      if (v47 == MLHostResultStatus.rawValue.getter())
      {
        Swift::String v48 = *(void **)(v0 + 1784);
        v159(*(void *)(v0 + 1272), *(void *)(v0 + 1216));
        swift_unknownObjectRelease();
      }
      else
      {
        os_log_t log = *(os_log_t *)(v0 + 1832);
        os_log_type_t v49 = *(void **)(v0 + 1784);
        uint64_t v50 = *(void *)(v0 + 1752);
        uint64_t v51 = *(void *)(v0 + 1432);
        uint64_t v52 = *(void *)(v0 + 1416);
        uint64_t v170 = *(void *)(v0 + 1272);
        uint64_t v164 = *(void *)(v0 + 1216);
        unsigned int v147 = [*(id *)(v0 + 1720) processIdentifier];
        uint64_t v181 = 0;
        unint64_t v182 = 0xE000000000000000;
        _StringGuts.grow(_:)(38);
        unint64_t v53 = v182;
        *(void *)(v0 + 840) = v181;
        *(void *)(v0 + 848) = v53;
        v54._uint64_t countAndFlagsBits = 0x206B736154;
        v54._object = (void *)0xE500000000000000;
        String.append(_:)(v54);
        v55._uint64_t countAndFlagsBits = MLHostTask.name.getter();
        String.append(_:)(v55);
        swift_bridgeObjectRelease();
        v56._object = (void *)0x8000000100056250;
        v56._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
        String.append(_:)(v56);
        v157(v51, v50, v52);
        _print_unlocked<A, B>(_:_:)();
        ((void (*)(uint64_t, uint64_t))log)(v51, v52);
        v57._uint64_t countAndFlagsBits = 46;
        v57._object = (void *)0xE100000000000000;
        String.append(_:)(v57);
        sub_100039C94(v147);
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();

        v159(v170, v164);
      }
      swift_release();
      swift_release();
      id v58 = *(void **)(v0 + 1720);
      uint64_t v59 = *(void *)(v0 + 1408);
      uint64_t v60 = *(void *)(v0 + 1400);
      uint64_t v61 = *(void *)(v0 + 1392);
      swift_release();
      swift_release();
      [v58 invalidate];

      _AppExtensionProcess.invalidate()();
      (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v59, v61);
LABEL_34:
      swift_release_n();
      swift_unknownObjectRelease();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      id v141 = *(uint64_t (**)(void *))(v0 + 8);
      return v141(v178);
    }
    uint64_t v20 = *(void *)(v0 + 1488);
    uint64_t v21 = *(void *)(v0 + 1440);
    uint64_t v22 = *(void *)(v0 + 1152);
    (*(void (**)(void, void, void))(v0 + 1688))(*(void *)(v0 + 1624), *(void *)(v0 + 1680), *(void *)(v0 + 1592));
    v7(v20, v22, v21);
    uint64_t v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.info.getter();
    BOOL v25 = os_log_type_enabled(v23, v24);
    os_log_type_t v26 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
    BOOL v27 = *(void (**)(uint64_t, uint64_t))(v0 + 1808);
    uint64_t v28 = *(void *)(v0 + 1624);
    uint64_t v29 = *(void *)(v0 + 1592);
    uint64_t v30 = *(void *)(v0 + 1488);
    uint64_t v31 = *(void *)(v0 + 1440);
    if (v25)
    {
      uint64_t v160 = *(void (**)(uint64_t, uint64_t))(v0 + 1808);
      uint64_t v32 = swift_slowAlloc();
      uint64_t v181 = swift_slowAlloc();
      *(_DWORD *)uint64_t v32 = 136315394;
      uint64_t v33 = MLHostTask.name.getter();
      *(void *)(v0 + 1008) = sub_10000E564(v33, v34, &v181);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v26(v30, v31);
      *(_WORD *)(v32 + 12) = 2080;
      uint64_t v35 = Duration.description.getter();
      *(void *)(v0 + 1016) = sub_10000E564(v35, v36, &v181);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Task %s asked to terminate because of deferral after %s.", (uint8_t *)v32, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v160(v28, v29);
    }
    else
    {
      v26(*(void *)(v0 + 1488), *(void *)(v0 + 1440));

      v27(v28, v29);
    }
    uint64_t v72 = *(void *)(v0 + 1792);
    uint64_t v73 = *(void **)(v0 + 1776);
    static ContinuousClock.now.getter();
    uint64_t v74 = swift_allocObject();
    *(void *)(v0 + 1872) = v74;
    *(void *)(v74 + 16) = 0;
    *(void *)(v74 + 24) = 0;
    [v73 doStop];
    uint64_t v75 = *(void **)(v72 + 16);
    if (v75) {
      goto LABEL_16;
    }
    if (static Duration.< infix(_:_:)())
    {
      uint64_t v75 = *(void **)(*(void *)(v0 + 1792) + 16);
      if (!v75)
      {
        uint64_t v111 = *(void (**)(uint64_t, void, uint64_t))(v0 + 1760);
        uint64_t v175 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1704);
        char v162 = *(void (**)(uint64_t, uint64_t))(v0 + 1832);
        unint64_t v158 = *(void (**)(uint64_t, os_log_t, uint64_t))(v0 + 1688);
        uint64_t v112 = *(void *)(v0 + 1616);
        uint64_t v148 = *(void *)(v0 + 1592);
        os_log_t logb = *(os_log_t *)(v0 + 1680);
        uint64_t v153 = *(void *)(v0 + 1480);
        uint64_t v155 = *(void *)(v0 + 1440);
        uint64_t v113 = *(void *)(v0 + 1432);
        uint64_t v114 = *(void *)(v0 + 1416);
        uint64_t v115 = *(void *)(v0 + 1152);
        uint64_t v116 = MLHostTask.name.getter();
        uint64_t v118 = v117;
        v111(v113, enum case for TaskStatus.taskDeferred(_:), v114);
        sub_100018D90(v116, v118, v113);
        swift_bridgeObjectRelease();
        v162(v113, v114);
        v158(v112, logb, v148);
        v175(v153, v115, v155);
        uint64_t v119 = Logger.logObject.getter();
        os_log_type_t v120 = static os_log_type_t.error.getter();
        BOOL v121 = os_log_type_enabled(v119, v120);
        uint64_t v122 = *(void (**)(uint64_t, uint64_t))(v0 + 1808);
        uint64_t v123 = *(void *)(v0 + 1616);
        uint64_t v124 = *(void *)(v0 + 1592);
        uint64_t v125 = *(void *)(v0 + 1480);
        uint64_t v126 = *(void *)(v0 + 1440);
        if (v121)
        {
          NSString v180 = *(void (**)(uint64_t, uint64_t))(v0 + 1808);
          uint64_t v161 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
          uint64_t v176 = *(void *)(v0 + 1616);
          uint64_t v127 = (uint8_t *)swift_slowAlloc();
          uint64_t v181 = swift_slowAlloc();
          *(_DWORD *)uint64_t v127 = 136315138;
          uint64_t v128 = MLHostTask.name.getter();
          *(void *)(v0 + 976) = sub_10000E564(v128, v129, &v181);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          v161(v125, v126);
          _os_log_impl((void *)&_mh_execute_header, v119, v120, "Task %s has not responded to deferral. Marking task as deferred and terminating process.", v127, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          v180(v176, v124);
        }
        else
        {
          (*(void (**)(void, void))(v0 + 1816))(*(void *)(v0 + 1480), *(void *)(v0 + 1440));

          v122(v123, v124);
        }
        id v142 = [*(id *)(v0 + 1720) processIdentifier];
        uint64_t v181 = 0;
        unint64_t v182 = 0xE000000000000000;
        _StringGuts.grow(_:)(38);
        v143._uint64_t countAndFlagsBits = 0x206B736154;
        v143._object = (void *)0xE500000000000000;
        String.append(_:)(v143);
        v144._uint64_t countAndFlagsBits = MLHostTask.name.getter();
        String.append(_:)(v144);
        swift_bridgeObjectRelease();
        v145._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
        v145._object = (void *)0x8000000100056230;
        String.append(_:)(v145);
        sub_100039C94((uint64_t)v142);
        swift_bridgeObjectRelease();
LABEL_19:
        (*(void (**)(void, void, void))(v0 + 1704))(*(void *)(v0 + 1472), *(void *)(v0 + 1152), *(void *)(v0 + 1440));
        swift_retain_n();
        uint64_t v96 = Logger.logObject.getter();
        os_log_type_t v97 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v96, v97))
        {
          unint64_t v154 = *(void (**)(uint64_t, os_log_t))(v0 + 1816);
          uint64_t v167 = *(void *)(v0 + 1792);
          uint64_t v98 = *(void *)(v0 + 1472);
          os_log_t loga = *(os_log_t *)(v0 + 1440);
          uint64_t v99 = swift_slowAlloc();
          unint64_t v173 = (void *)swift_slowAlloc();
          uint64_t v181 = swift_slowAlloc();
          *(_DWORD *)uint64_t v99 = 136315650;
          uint64_t v100 = MLHostTask.name.getter();
          *(void *)(v0 + 936) = sub_10000E564(v100, v101, &v181);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_retain();
          swift_bridgeObjectRelease();
          v154(v98, loga);
          *(_WORD *)(v99 + 12) = 2080;
          swift_beginAccess();
          uint64_t v102 = Duration.description.getter();
          *(void *)(v0 + 952) = sub_10000E564(v102, v103, &v181);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_release();
          swift_bridgeObjectRelease();
          *(_WORD *)(v99 + 22) = 2112;
          uint64_t v104 = *(void **)(v167 + 16);
          if (v104)
          {
            *(void *)(v0 + 968) = v104;
            id v105 = v104;
          }
          else
          {
            *(void *)(v0 + 960) = 0;
          }
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          uint64_t v135 = *(void (**)(uint64_t, uint64_t))(v0 + 1856);
          uint64_t v165 = *(void **)(v0 + 1784);
          uint64_t v169 = *(void *)(v0 + 1272);
          uint64_t v163 = *(void *)(v0 + 1256);
          uint64_t v136 = *(void *)(v0 + 1216);
          void *v173 = v104;
          swift_release_n();
          _os_log_impl((void *)&_mh_execute_header, v96, v97, "Task %s deferred after awaiting %s for its cooperative termination. TaskResult: %@", (uint8_t *)v99, 0x20u);
          sub_10000E508(&qword_100065290);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
          swift_unknownObjectRelease();

          v135(v163, v136);
          v135(v169, v136);
        }
        else
        {
          uint64_t v106 = *(void (**)(uint64_t, uint64_t))(v0 + 1856);
          unint64_t v107 = *(void **)(v0 + 1784);
          uint64_t v108 = *(void *)(v0 + 1472);
          uint64_t v109 = *(void *)(v0 + 1440);
          uint64_t v174 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
          uint64_t v179 = *(void *)(v0 + 1272);
          uint64_t v168 = *(void *)(v0 + 1256);
          uint64_t v110 = *(void *)(v0 + 1216);
          swift_release_n();
          swift_unknownObjectRelease();

          v174(v108, v109);
          v106(v168, v110);
          v106(v179, v110);
        }
        uint64_t v137 = *(void **)(v0 + 1720);
        uint64_t v138 = *(void *)(v0 + 1408);
        uint64_t v139 = *(void *)(v0 + 1400);
        uint64_t v177 = *(void *)(v0 + 1392);
        uint64_t v178 = *(void **)(*(void *)(v0 + 1792) + 16);
        id v140 = v178;
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        [v137 invalidate];

        _AppExtensionProcess.invalidate()();
        (*(void (**)(uint64_t, uint64_t))(v139 + 8))(v138, v177);
        goto LABEL_34;
      }
LABEL_16:
      uint64_t v171 = *(void (**)(uint64_t, uint64_t))(v0 + 1832);
      uint64_t v76 = *(void *)(v0 + 1752);
      uint64_t v77 = *(void *)(v0 + 1432);
      uint64_t v78 = *(void *)(v0 + 1424);
      uint64_t v79 = *(void *)(v0 + 1416);
      id v166 = v75;
      uint64_t v80 = MLHostTask.name.getter();
      uint64_t v82 = v81;
      uint64_t v83 = *(void (**)(uint64_t, uint64_t, uint64_t))(v78 + 16);
      v83(v77, v76, v79);
      sub_100018D90(v80, v82, v77);
      swift_bridgeObjectRelease();
      v171(v77, v79);
      uint64_t v84 = MLHostTask.name.getter();
      sub_100018964(v84, v85);
      swift_bridgeObjectRelease();
      MLHostResult.status.getter();
      uint64_t v86 = MLHostResultStatus.rawValue.getter();
      if (v86 != MLHostResultStatus.rawValue.getter())
      {
        uint64_t v172 = *(void (**)(uint64_t, uint64_t))(v0 + 1832);
        uint64_t v87 = *(void *)(v0 + 1752);
        uint64_t v88 = *(void *)(v0 + 1432);
        uint64_t v89 = *(void *)(v0 + 1416);
        id v90 = [*(id *)(v0 + 1720) processIdentifier];
        uint64_t v181 = 0;
        unint64_t v182 = 0xE000000000000000;
        _StringGuts.grow(_:)(38);
        unint64_t v91 = v182;
        *(void *)(v0 + 904) = v181;
        *(void *)(v0 + 912) = v91;
        v92._uint64_t countAndFlagsBits = 0x206B736154;
        v92._object = (void *)0xE500000000000000;
        String.append(_:)(v92);
        v93._uint64_t countAndFlagsBits = MLHostTask.name.getter();
        String.append(_:)(v93);
        swift_bridgeObjectRelease();
        v94._object = (void *)0x8000000100056250;
        v94._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
        String.append(_:)(v94);
        v83(v88, v87, v89);
        _print_unlocked<A, B>(_:_:)();
        v172(v88, v89);
        v95._uint64_t countAndFlagsBits = 46;
        v95._object = (void *)0xE100000000000000;
        String.append(_:)(v95);
        sub_100039C94((uint64_t)v90);
        swift_bridgeObjectRelease();
      }

      goto LABEL_19;
    }
    uint64_t v130 = *(void (**)(uint64_t, uint64_t))(v0 + 1856);
    uint64_t v131 = *(void *)(v0 + 1264);
    uint64_t v132 = *(void *)(v0 + 1216);
    ContinuousClock.init()();
    *(void *)(v0 + 856) = 500000000000000000;
    *(void *)(v0 + 864) = 0;
    *(_OWORD *)(v0 + 816) = 0u;
    *(unsigned char *)(v0 + 832) = 1;
    uint64_t v133 = sub_100049750(&qword_100065848, (void (*)(uint64_t))&type metadata accessor for ContinuousClock);
    dispatch thunk of Clock.now.getter();
    sub_100049750(&qword_100065850, (void (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant);
    dispatch thunk of InstantProtocol.advanced(by:)();
    v130(v131, v132);
    uint64_t v134 = (void *)swift_task_alloc();
    *(void *)(v0 + 1880) = v134;
    *uint64_t v134 = v0;
    v134[1] = sub_10003F2DC;
    uint64_t v68 = *(void *)(v0 + 1176);
    uint64_t v70 = v0 + 816;
    uint64_t v69 = *(void *)(v0 + 1248);
    uint64_t v71 = v133;
  }
  else
  {
    uint64_t v62 = *(void *)(v0 + 1264);
    uint64_t v63 = *(void *)(v0 + 1224);
    uint64_t v64 = *(void *)(v0 + 1216);
    ContinuousClock.init()();
    *(void *)(v0 + 888) = 500000000000000000;
    *(void *)(v0 + 896) = 0;
    *(_OWORD *)(v0 + 792) = 0u;
    *(unsigned char *)(v0 + 808) = 1;
    uint64_t v65 = sub_100049750(&qword_100065848, (void (*)(uint64_t))&type metadata accessor for ContinuousClock);
    dispatch thunk of Clock.now.getter();
    sub_100049750(&qword_100065850, (void (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant);
    dispatch thunk of InstantProtocol.advanced(by:)();
    uint64_t v66 = *(void (**)(uint64_t, uint64_t))(v63 + 8);
    *(void *)(v0 + 1896) = v66;
    *(void *)(v0 + 1904) = (v63 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v66(v62, v64);
    uint64_t v67 = (void *)swift_task_alloc();
    *(void *)(v0 + 1912) = v67;
    *uint64_t v67 = v0;
    v67[1] = sub_100040EA8;
    uint64_t v68 = *(void *)(v0 + 1176);
    uint64_t v69 = *(void *)(v0 + 1240);
    uint64_t v70 = v0 + 792;
    uint64_t v71 = v65;
  }
  return dispatch thunk of Clock.sleep(until:tolerance:)(v69, v70, v68, v71);
}

uint64_t sub_100042740()
{
  uint64_t v179 = v0;
  (*(void (**)(void, void))(*(void *)(v0 + 1184) + 8))(*(void *)(v0 + 1200), *(void *)(v0 + 1176));
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Task.sleep interrupted, skipping waiting for extension completion.", v3, 2u);
    swift_slowDealloc();
  }
  swift_errorRelease();

  uint64_t v4 = *(void *)(v0 + 1792);
  uint64_t v5 = *(void *)(v0 + 1264);
  uint64_t v6 = *(void *)(v0 + 1224);
  uint64_t v7 = *(void *)(v0 + 1216);
  static ContinuousClock.now.getter();
  ContinuousClock.Instant.duration(to:)();
  id v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  *(void *)(v0 + 1856) = v8;
  *(void *)(v0 + 1864) = (v6 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v8(v5, v7);
  uint64_t v9 = *(void **)(v4 + 16);
  BOOL v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1704);
  if (v9)
  {
    uint64_t v159 = v8;
    v10(*(void *)(v0 + 1496), *(void *)(v0 + 1152), *(void *)(v0 + 1440));
    uint64_t v172 = v9;
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.info.getter();
    BOOL v13 = os_log_type_enabled(v11, v12);
    uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
    uint64_t v15 = *(void *)(v0 + 1496);
    uint64_t v16 = *(void *)(v0 + 1440);
    Swift::String v143 = v9;
    if (v13)
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v152 = (void *)swift_slowAlloc();
      uint64_t v177 = swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 136315650;
      uint64_t v18 = MLHostTask.name.getter();
      *(void *)(v0 + 1032) = sub_10000E564(v18, v19, &v177);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v14(v15, v16);
      *(_WORD *)(v17 + 12) = 2080;
      uint64_t v20 = Duration.description.getter();
      *(void *)(v0 + 1040) = sub_10000E564(v20, v21, &v177);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 22) = 2112;
      *(void *)(v0 + 1048) = v172;
      uint64_t v22 = v172;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v152 = v9;

      uint64_t v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Task %s completed after %s. TaskResult: %@", (uint8_t *)v17, 0x20u);
      sub_10000E508(&qword_100065290);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      v14(v15, v16);

      uint64_t v23 = v172;
    }

    uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v0 + 1832);
    uint64_t v42 = *(void *)(v0 + 1752);
    uint64_t v43 = *(void *)(v0 + 1432);
    uint64_t v44 = *(void *)(v0 + 1424);
    uint64_t v45 = *(void *)(v0 + 1416);
    uint64_t v46 = MLHostTask.name.getter();
    uint64_t v48 = v47;
    unint64_t v154 = *(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 16);
    v154(v43, v42, v45);
    sub_100018D90(v46, v48, v43);
    swift_bridgeObjectRelease();
    v41(v43, v45);
    uint64_t v49 = MLHostTask.name.getter();
    sub_100018964(v49, v50);
    swift_bridgeObjectRelease();
    MLHostResult.status.getter();
    uint64_t v51 = MLHostResultStatus.rawValue.getter();
    if (v51 == MLHostResultStatus.rawValue.getter())
    {
      uint64_t v52 = *(void **)(v0 + 1784);
      v159(*(void *)(v0 + 1272), *(void *)(v0 + 1216));
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v148 = *(void (**)(uint64_t, uint64_t))(v0 + 1832);
      unint64_t v53 = *(void **)(v0 + 1784);
      uint64_t v54 = *(void *)(v0 + 1752);
      uint64_t v55 = *(void *)(v0 + 1432);
      uint64_t v56 = *(void *)(v0 + 1416);
      uint64_t v165 = *(void *)(v0 + 1216);
      uint64_t v173 = *(void *)(v0 + 1272);
      unsigned int log = [*(id *)(v0 + 1720) processIdentifier];
      uint64_t v177 = 0;
      unint64_t v178 = 0xE000000000000000;
      _StringGuts.grow(_:)(38);
      unint64_t v57 = v178;
      *(void *)(v0 + 840) = v177;
      *(void *)(v0 + 848) = v57;
      v58._uint64_t countAndFlagsBits = 0x206B736154;
      v58._object = (void *)0xE500000000000000;
      String.append(_:)(v58);
      v59._uint64_t countAndFlagsBits = MLHostTask.name.getter();
      String.append(_:)(v59);
      swift_bridgeObjectRelease();
      v60._object = (void *)0x8000000100056250;
      v60._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
      String.append(_:)(v60);
      v154(v55, v54, v56);
      _print_unlocked<A, B>(_:_:)();
      v148(v55, v56);
      v61._uint64_t countAndFlagsBits = 46;
      v61._object = (void *)0xE100000000000000;
      String.append(_:)(v61);
      sub_100039C94(log);
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();

      v159(v173, v165);
    }
    swift_release();
    swift_release();
    uint64_t v62 = *(void **)(v0 + 1720);
    uint64_t v63 = *(void *)(v0 + 1408);
    uint64_t v64 = *(void *)(v0 + 1400);
    uint64_t v65 = *(void *)(v0 + 1392);
    swift_release();
    swift_release();
    [v62 invalidate];

    _AppExtensionProcess.invalidate()();
    (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v63, v65);
LABEL_32:
    swift_release_n();
    swift_unknownObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v137 = *(uint64_t (**)(void *))(v0 + 8);
    return v137(v143);
  }
  uint64_t v24 = *(void *)(v0 + 1488);
  uint64_t v25 = *(void *)(v0 + 1440);
  uint64_t v26 = *(void *)(v0 + 1152);
  (*(void (**)(void, void, void))(v0 + 1688))(*(void *)(v0 + 1624), *(void *)(v0 + 1680), *(void *)(v0 + 1592));
  v10(v24, v26, v25);
  BOOL v27 = Logger.logObject.getter();
  os_log_type_t v28 = static os_log_type_t.info.getter();
  BOOL v29 = os_log_type_enabled(v27, v28);
  uint64_t v30 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
  uint64_t v31 = *(void (**)(uint64_t, uint64_t))(v0 + 1808);
  uint64_t v32 = *(void *)(v0 + 1624);
  uint64_t v33 = *(void *)(v0 + 1592);
  uint64_t v34 = *(void *)(v0 + 1488);
  uint64_t v35 = *(void *)(v0 + 1440);
  if (v29)
  {
    uint64_t v161 = *(void (**)(uint64_t, uint64_t))(v0 + 1808);
    uint64_t v36 = swift_slowAlloc();
    uint64_t v177 = swift_slowAlloc();
    *(_DWORD *)uint64_t v36 = 136315394;
    uint64_t v37 = MLHostTask.name.getter();
    *(void *)(v0 + 1008) = sub_10000E564(v37, v38, &v177);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v30(v34, v35);
    *(_WORD *)(v36 + 12) = 2080;
    uint64_t v39 = Duration.description.getter();
    *(void *)(v0 + 1016) = sub_10000E564(v39, v40, &v177);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Task %s asked to terminate because of deferral after %s.", (uint8_t *)v36, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v161(v32, v33);
  }
  else
  {
    v30(*(void *)(v0 + 1488), *(void *)(v0 + 1440));

    v31(v32, v33);
  }
  uint64_t v66 = *(void *)(v0 + 1792);
  uint64_t v67 = *(void **)(v0 + 1776);
  static ContinuousClock.now.getter();
  uint64_t v68 = swift_allocObject();
  *(void *)(v0 + 1872) = v68;
  *(void *)(v68 + 16) = 0;
  *(void *)(v68 + 24) = 0;
  [v67 doStop];
  uint64_t v69 = *(void **)(v66 + 16);
  if (v69) {
    goto LABEL_15;
  }
  if (static Duration.< infix(_:_:)())
  {
    uint64_t v69 = *(void **)(*(void *)(v0 + 1792) + 16);
    if (!v69)
    {
      id v105 = *(void (**)(uint64_t, void, uint64_t))(v0 + 1760);
      uint64_t v170 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1704);
      unint64_t v157 = *(void (**)(uint64_t, uint64_t))(v0 + 1832);
      uint64_t v153 = *(void (**)(uint64_t, os_log_t, uint64_t))(v0 + 1688);
      uint64_t v106 = *(void *)(v0 + 1616);
      uint64_t v145 = *(void *)(v0 + 1592);
      os_log_t loga = *(os_log_t *)(v0 + 1680);
      uint64_t v150 = *(void *)(v0 + 1480);
      uint64_t v151 = *(void *)(v0 + 1440);
      uint64_t v107 = *(void *)(v0 + 1432);
      uint64_t v108 = *(void *)(v0 + 1416);
      uint64_t v109 = *(void *)(v0 + 1152);
      uint64_t v110 = MLHostTask.name.getter();
      uint64_t v112 = v111;
      v105(v107, enum case for TaskStatus.taskDeferred(_:), v108);
      sub_100018D90(v110, v112, v107);
      swift_bridgeObjectRelease();
      v157(v107, v108);
      v153(v106, loga, v145);
      v170(v150, v109, v151);
      uint64_t v113 = Logger.logObject.getter();
      os_log_type_t v114 = static os_log_type_t.error.getter();
      BOOL v115 = os_log_type_enabled(v113, v114);
      uint64_t v116 = *(void (**)(uint64_t, uint64_t))(v0 + 1808);
      uint64_t v117 = *(void *)(v0 + 1616);
      uint64_t v118 = *(void *)(v0 + 1592);
      uint64_t v119 = *(void *)(v0 + 1480);
      uint64_t v120 = *(void *)(v0 + 1440);
      if (v115)
      {
        uint64_t v175 = *(void (**)(uint64_t, uint64_t))(v0 + 1808);
        uint64_t v155 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
        uint64_t v171 = *(void *)(v0 + 1616);
        BOOL v121 = (uint8_t *)swift_slowAlloc();
        uint64_t v177 = swift_slowAlloc();
        *(_DWORD *)BOOL v121 = 136315138;
        uint64_t v122 = MLHostTask.name.getter();
        *(void *)(v0 + 976) = sub_10000E564(v122, v123, &v177);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        v155(v119, v120);
        _os_log_impl((void *)&_mh_execute_header, v113, v114, "Task %s has not responded to deferral. Marking task as deferred and terminating process.", v121, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v175(v171, v118);
      }
      else
      {
        (*(void (**)(void, void))(v0 + 1816))(*(void *)(v0 + 1480), *(void *)(v0 + 1440));

        v116(v117, v118);
      }
      id v138 = [*(id *)(v0 + 1720) processIdentifier];
      uint64_t v177 = 0;
      unint64_t v178 = 0xE000000000000000;
      _StringGuts.grow(_:)(38);
      v139._uint64_t countAndFlagsBits = 0x206B736154;
      v139._object = (void *)0xE500000000000000;
      String.append(_:)(v139);
      v140._uint64_t countAndFlagsBits = MLHostTask.name.getter();
      String.append(_:)(v140);
      swift_bridgeObjectRelease();
      v141._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
      v141._object = (void *)0x8000000100056230;
      String.append(_:)(v141);
      sub_100039C94((uint64_t)v138);
      swift_bridgeObjectRelease();
LABEL_18:
      (*(void (**)(void, void, void))(v0 + 1704))(*(void *)(v0 + 1472), *(void *)(v0 + 1152), *(void *)(v0 + 1440));
      swift_retain_n();
      id v90 = Logger.logObject.getter();
      os_log_type_t v91 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v90, v91))
      {
        uint64_t v149 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
        uint64_t v156 = *(void *)(v0 + 1792);
        uint64_t v92 = *(void *)(v0 + 1472);
        uint64_t v144 = *(void *)(v0 + 1440);
        uint64_t v93 = swift_slowAlloc();
        uint64_t v168 = (void *)swift_slowAlloc();
        uint64_t v177 = swift_slowAlloc();
        *(_DWORD *)uint64_t v93 = 136315650;
        uint64_t v94 = MLHostTask.name.getter();
        *(void *)(v0 + 936) = sub_10000E564(v94, v95, &v177);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_retain();
        swift_bridgeObjectRelease();
        v149(v92, v144);
        *(_WORD *)(v93 + 12) = 2080;
        swift_beginAccess();
        uint64_t v96 = Duration.description.getter();
        *(void *)(v0 + 952) = sub_10000E564(v96, v97, &v177);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release();
        swift_bridgeObjectRelease();
        *(_WORD *)(v93 + 22) = 2112;
        uint64_t v98 = *(void **)(v156 + 16);
        if (v98)
        {
          *(void *)(v0 + 968) = v98;
          id v99 = v98;
        }
        else
        {
          *(void *)(v0 + 960) = 0;
        }
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        uint64_t v131 = *(void (**)(uint64_t, uint64_t))(v0 + 1856);
        uint64_t v160 = *(void **)(v0 + 1784);
        uint64_t v164 = *(void *)(v0 + 1272);
        uint64_t v158 = *(void *)(v0 + 1256);
        uint64_t v132 = *(void *)(v0 + 1216);
        void *v168 = v98;
        swift_release_n();
        _os_log_impl((void *)&_mh_execute_header, v90, v91, "Task %s deferred after awaiting %s for its cooperative termination. TaskResult: %@", (uint8_t *)v93, 0x20u);
        sub_10000E508(&qword_100065290);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
        swift_unknownObjectRelease();

        v131(v158, v132);
        v131(v164, v132);
      }
      else
      {
        uint64_t v100 = *(void (**)(uint64_t, uint64_t))(v0 + 1856);
        unint64_t v101 = *(void **)(v0 + 1784);
        uint64_t v102 = *(void *)(v0 + 1472);
        uint64_t v103 = *(void *)(v0 + 1440);
        uint64_t v169 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
        uint64_t v174 = *(void *)(v0 + 1272);
        uint64_t v163 = *(void *)(v0 + 1256);
        uint64_t v104 = *(void *)(v0 + 1216);
        swift_release_n();
        swift_unknownObjectRelease();

        v169(v102, v103);
        v100(v163, v104);
        v100(v174, v104);
      }
      uint64_t v133 = *(void **)(v0 + 1720);
      uint64_t v134 = *(void *)(v0 + 1408);
      uint64_t v135 = *(void *)(v0 + 1400);
      uint64_t v176 = *(void *)(v0 + 1392);
      Swift::String v143 = *(void **)(*(void *)(v0 + 1792) + 16);
      id v136 = v143;
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      [v133 invalidate];

      _AppExtensionProcess.invalidate()();
      (*(void (**)(uint64_t, uint64_t))(v135 + 8))(v134, v176);
      goto LABEL_32;
    }
LABEL_15:
    id v166 = *(void (**)(uint64_t, uint64_t))(v0 + 1832);
    uint64_t v70 = *(void *)(v0 + 1752);
    uint64_t v71 = *(void *)(v0 + 1432);
    uint64_t v72 = *(void *)(v0 + 1424);
    uint64_t v73 = *(void *)(v0 + 1416);
    id v162 = v69;
    uint64_t v74 = MLHostTask.name.getter();
    uint64_t v76 = v75;
    uint64_t v77 = *(void (**)(uint64_t, uint64_t, uint64_t))(v72 + 16);
    v77(v71, v70, v73);
    sub_100018D90(v74, v76, v71);
    swift_bridgeObjectRelease();
    v166(v71, v73);
    uint64_t v78 = MLHostTask.name.getter();
    sub_100018964(v78, v79);
    swift_bridgeObjectRelease();
    MLHostResult.status.getter();
    uint64_t v80 = MLHostResultStatus.rawValue.getter();
    if (v80 != MLHostResultStatus.rawValue.getter())
    {
      uint64_t v167 = *(void (**)(uint64_t, uint64_t))(v0 + 1832);
      uint64_t v81 = *(void *)(v0 + 1752);
      uint64_t v82 = *(void *)(v0 + 1432);
      uint64_t v83 = *(void *)(v0 + 1416);
      id v84 = [*(id *)(v0 + 1720) processIdentifier];
      uint64_t v177 = 0;
      unint64_t v178 = 0xE000000000000000;
      _StringGuts.grow(_:)(38);
      unint64_t v85 = v178;
      *(void *)(v0 + 904) = v177;
      *(void *)(v0 + 912) = v85;
      v86._uint64_t countAndFlagsBits = 0x206B736154;
      v86._object = (void *)0xE500000000000000;
      String.append(_:)(v86);
      v87._uint64_t countAndFlagsBits = MLHostTask.name.getter();
      String.append(_:)(v87);
      swift_bridgeObjectRelease();
      v88._object = (void *)0x8000000100056250;
      v88._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
      String.append(_:)(v88);
      v77(v82, v81, v83);
      _print_unlocked<A, B>(_:_:)();
      v167(v82, v83);
      v89._uint64_t countAndFlagsBits = 46;
      v89._object = (void *)0xE100000000000000;
      String.append(_:)(v89);
      sub_100039C94((uint64_t)v84);
      swift_bridgeObjectRelease();
    }

    goto LABEL_18;
  }
  uint64_t v124 = *(void (**)(uint64_t, uint64_t))(v0 + 1856);
  uint64_t v125 = *(void *)(v0 + 1264);
  uint64_t v126 = *(void *)(v0 + 1216);
  ContinuousClock.init()();
  *(void *)(v0 + 856) = 500000000000000000;
  *(void *)(v0 + 864) = 0;
  *(_OWORD *)(v0 + 816) = 0u;
  *(unsigned char *)(v0 + 832) = 1;
  uint64_t v127 = sub_100049750(&qword_100065848, (void (*)(uint64_t))&type metadata accessor for ContinuousClock);
  dispatch thunk of Clock.now.getter();
  sub_100049750(&qword_100065850, (void (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant);
  dispatch thunk of InstantProtocol.advanced(by:)();
  v124(v125, v126);
  uint64_t v128 = (void *)swift_task_alloc();
  *(void *)(v0 + 1880) = v128;
  void *v128 = v0;
  v128[1] = sub_10003F2DC;
  uint64_t v129 = *(void *)(v0 + 1248);
  uint64_t v130 = *(void *)(v0 + 1176);
  return dispatch thunk of Clock.sleep(until:tolerance:)(v129, v0 + 816, v130, v127);
}

uint64_t sub_100043D34()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 1952) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2 + 1928))(*(void *)(v2 + 1232), *(void *)(v2 + 1216));
    uint64_t v3 = sub_100046904;
  }
  else
  {
    uint64_t v4 = *(void (**)(uint64_t, uint64_t))(v2 + 1928);
    uint64_t v5 = *(void *)(v2 + 1232);
    uint64_t v6 = *(void *)(v2 + 1216);
    uint64_t v7 = *(void *)(v2 + 1192);
    uint64_t v8 = *(void *)(v2 + 1184);
    uint64_t v9 = *(void *)(v2 + 1176);
    v4(v5, v6);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    uint64_t v3 = sub_100043EC8;
  }
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(v3, 0, 0);
}

uint64_t sub_100043EC8()
{
  uint64_t v338 = v0;
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 1928);
  uint64_t v2 = *(void *)(v0 + 1848);
  uint64_t v3 = *(void *)(v0 + 1264);
  uint64_t v4 = *(void *)(v0 + 1216);
  uint64_t v5 = *(void *)(v0 + 1168);
  static ContinuousClock.now.getter();
  uint64_t v6 = ContinuousClock.Instant.duration(to:)();
  uint64_t v8 = v7;
  v1(v3, v4);
  *(void *)(v2 + 16) = v6;
  *(void *)(v2 + 24) = v8;
  if ((*(unsigned char *)(v5 + 16) & 1) != 0
    || *(unsigned char *)(*(void *)(v0 + 1800) + 16) != 2
    || (static Duration.< infix(_:_:)() & 1) != 0)
  {
    uint64_t v9 = *(void *)(v0 + 1168);
    swift_beginAccess();
    if ((*(unsigned char *)(v9 + 16) & 1) == 0)
    {
      uint64_t v10 = *(void *)(v0 + 1800);
      swift_beginAccess();
      if (*(unsigned char *)(v10 + 16) == 2)
      {
        uint64_t v301 = *(void (**)(uint64_t, uint64_t))(v0 + 1832);
        uint64_t v11 = *(void (**)(uint64_t, void, uint64_t))(v0 + 1760);
        Swift::String v318 = *(void (**)(id, uint64_t, uint64_t))(v0 + 1704);
        uint64_t v288 = *(void (**)(uint64_t, os_log_t, uint64_t))(v0 + 1688);
        uint64_t v12 = *(void *)(v0 + 1608);
        uint64_t v266 = *(void *)(v0 + 1592);
        os_log_t log = *(os_log_t *)(v0 + 1680);
        id v275 = *(id *)(v0 + 1464);
        uint64_t v281 = *(void *)(v0 + 1440);
        uint64_t v13 = *(void *)(v0 + 1432);
        uint64_t v14 = *(void *)(v0 + 1416);
        uint64_t v15 = *(void *)(v0 + 1152);
        uint64_t v16 = MLHostTask.name.getter();
        uint64_t v18 = v17;
        v11(v13, enum case for TaskStatus.taskFailed(_:), v14);
        sub_100018D90(v16, v18, v13);
        swift_bridgeObjectRelease();
        v301(v13, v14);
        v288(v12, log, v266);
        v318(v275, v15, v281);
        unint64_t v19 = Logger.logObject.getter();
        os_log_type_t v20 = static os_log_type_t.error.getter();
        BOOL v21 = os_log_type_enabled(v19, v20);
        uint64_t v22 = *(void (**)(uint64_t, uint64_t))(v0 + 1808);
        uint64_t v23 = *(void *)(v0 + 1608);
        uint64_t v24 = *(void *)(v0 + 1592);
        uint64_t v25 = *(void *)(v0 + 1464);
        uint64_t v26 = *(void *)(v0 + 1440);
        if (v21)
        {
          uint64_t v289 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
          uint64_t v329 = *(void *)(v0 + 1608);
          BOOL v27 = (uint8_t *)swift_slowAlloc();
          uint64_t v336 = swift_slowAlloc();
          *(_DWORD *)BOOL v27 = 136315138;
          uint64_t v28 = MLHostTask.name.getter();
          *(void *)(v0 + 1024) = sub_10000E564(v28, v29, &v336);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          v289(v25, v26);
          _os_log_impl((void *)&_mh_execute_header, v19, v20, "Task %s has been in shouldRun for too long. Marking task as failed and terminating process.", v27, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          v22(v329, v24);
        }
        else
        {
          (*(void (**)(void, void))(v0 + 1816))(*(void *)(v0 + 1464), *(void *)(v0 + 1440));

          v22(v23, v24);
        }
        uint64_t v80 = *(void **)(v0 + 1720);
        uint64_t v81 = *(void *)(v0 + 1408);
        uint64_t v82 = *(void *)(v0 + 1400);
        uint64_t v332 = *(void *)(v0 + 1392);
        uint64_t v299 = *(void *)(v0 + 1272);
        uint64_t v303 = *(void **)(v0 + 1784);
        uint64_t v83 = *(void *)(v0 + 1224);
        uint64_t v293 = *(void *)(v0 + 1216);
        id v84 = [v80 processIdentifier];
        uint64_t v336 = 0;
        unint64_t v337 = 0xE000000000000000;
        _StringGuts.grow(_:)(43);
        v85._uint64_t countAndFlagsBits = 0x206B736154;
        v85._object = (void *)0xE500000000000000;
        String.append(_:)(v85);
        v86._uint64_t countAndFlagsBits = MLHostTask.name.getter();
        String.append(_:)(v86);
        swift_bridgeObjectRelease();
        v87._uint64_t countAndFlagsBits = 0xD000000000000024;
        v87._object = (void *)0x80000001000561C0;
        String.append(_:)(v87);
        sub_100039C94((uint64_t)v84);
        swift_unknownObjectRelease();

        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v83 + 8))(v299, v293);
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        [v80 invalidate];

        _AppExtensionProcess.invalidate()();
        (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v81, v332);
        id v331 = 0;
LABEL_59:
        swift_release_n();
        swift_unknownObjectRelease();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        unint64_t v245 = *(uint64_t (**)(id))(v0 + 8);
        return v245(v331);
      }
    }
    uint64_t v30 = *(void *)(v0 + 1800);
    swift_beginAccess();
    int v31 = *(unsigned __int8 *)(v30 + 16);
    uint64_t v32 = *(void *)(v0 + 1440);
    uint64_t v33 = *(void *)(v0 + 1152);
    if (v31 == 2)
    {
      (*(void (**)(void, uint64_t, uint64_t))(v0 + 1704))(*(void *)(v0 + 1520), v33, v32);
      uint64_t v34 = Logger.logObject.getter();
      os_log_type_t v35 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v34, v35))
      {
        uint64_t v36 = *(void *)(v0 + 1520);
        uint64_t v290 = *(void *)(v0 + 1440);
        v298 = (unsigned __int8 *)(*(void *)(v0 + 1168) + 16);
        uint64_t v302 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
        uint64_t v37 = swift_slowAlloc();
        uint64_t v336 = swift_slowAlloc();
        *(_DWORD *)uint64_t v37 = 136315650;
        uint64_t v38 = MLHostTask.name.getter();
        *(void *)(v0 + 1000) = sub_10000E564(v38, v39, &v336);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_retain();
        swift_bridgeObjectRelease();
        v302(v36, v290);
        *(_WORD *)(v37 + 12) = 1024;
        swift_beginAccess();
        *(_DWORD *)(v0 + 1964) = *v298;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v37 + 18) = 2080;
        swift_beginAccess();
        uint64_t v40 = Duration.description.getter();
        *(void *)(v0 + 984) = sub_10000E564(v40, v41, &v336);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v34, v35, "Task %s skipping execution, isDeferred = %{BOOL}d, after %s.", (uint8_t *)v37, 0x1Cu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        (*(void (**)(void, void))(v0 + 1816))(*(void *)(v0 + 1520), *(void *)(v0 + 1440));
      }

      uint64_t v261 = *(void (**)(uint64_t, uint64_t))(v0 + 1832);
      uint64_t v292 = *(void **)(v0 + 1784);
      uint64_t v51 = *(void (**)(uint64_t, void, uint64_t))(v0 + 1760);
      id v258 = *(id *)(v0 + 1720);
      uint64_t v52 = *(void *)(v0 + 1432);
      uint64_t v53 = *(void *)(v0 + 1416);
      uint64_t v308 = *(void *)(v0 + 1408);
      uint64_t v320 = *(void *)(v0 + 1400);
      uint64_t v330 = *(void *)(v0 + 1392);
      uint64_t v283 = *(void *)(v0 + 1272);
      uint64_t v267 = *(void *)(v0 + 1224);
      id v276 = *(id *)(v0 + 1216);
      uint64_t v54 = MLHostTask.name.getter();
      uint64_t v56 = v55;
      v51(v52, enum case for TaskStatus.taskDeferred(_:), v53);
      sub_100018D90(v54, v56, v52);
      swift_bridgeObjectRelease();
      v261(v52, v53);
      id v57 = [v258 processIdentifier];
      uint64_t v336 = 0;
      unint64_t v337 = 0xE000000000000000;
      _StringGuts.grow(_:)(37);
      v58._uint64_t countAndFlagsBits = 0x206B736154;
      v58._object = (void *)0xE500000000000000;
      String.append(_:)(v58);
      v59._uint64_t countAndFlagsBits = MLHostTask.name.getter();
      String.append(_:)(v59);
      swift_bridgeObjectRelease();
      v60._uint64_t countAndFlagsBits = 0xD00000000000001ELL;
      v60._object = (void *)0x80000001000561F0;
      String.append(_:)(v60);
      sub_100039C94((uint64_t)v57);
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();

      (*(void (**)(uint64_t, id))(v267 + 8))(v283, v276);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      [v258 invalidate];

      _AppExtensionProcess.invalidate()();
      (*(void (**)(uint64_t, uint64_t))(v320 + 8))(v308, v330);
      id v331 = 0;
      goto LABEL_59;
    }
    uint64_t v42 = *(void (**)(void, uint64_t, uint64_t))(v0 + 1704);
    if ((v31 & 1) == 0)
    {
      v42(*(void *)(v0 + 1504), v33, v32);
      uint64_t v43 = Logger.logObject.getter();
      os_log_type_t v44 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v43, v44))
      {
        long long v291 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
        os_log_type_t v319 = v44;
        uint64_t v45 = *(void *)(v0 + 1504);
        uint64_t v282 = *(void *)(v0 + 1440);
        uint64_t v46 = swift_slowAlloc();
        uint64_t v336 = swift_slowAlloc();
        *(_DWORD *)uint64_t v46 = 136315650;
        uint64_t v47 = MLHostTask.name.getter();
        *(void *)(v0 + 944) = sub_10000E564(v47, v48, &v336);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_retain();
        swift_bridgeObjectRelease();
        v291(v45, v282);
        *(_WORD *)(v46 + 12) = 1024;
        *(_DWORD *)(v0 + 1960) = 0;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v46 + 18) = 2080;
        swift_beginAccess();
        uint64_t v49 = Duration.description.getter();
        *(void *)(v0 + 920) = sub_10000E564(v49, v50, &v336);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v43, v319, "Task %s skipping execution, shouldRun = %{BOOL}d, after %s.", (uint8_t *)v46, 0x1Cu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        (*(void (**)(void, void))(v0 + 1816))(*(void *)(v0 + 1504), *(void *)(v0 + 1440));
      }

      unint64_t v255 = *(void (**)(uint64_t, uint64_t))(v0 + 1832);
      v294 = *(void **)(v0 + 1784);
      Swift::String v88 = *(void (**)(uint64_t, void, uint64_t))(v0 + 1760);
      id v259 = *(id *)(v0 + 1720);
      uint64_t v89 = *(void *)(v0 + 1432);
      uint64_t v90 = *(void *)(v0 + 1416);
      uint64_t v305 = *(void *)(v0 + 1408);
      uint64_t v312 = *(void *)(v0 + 1400);
      uint64_t v321 = *(void *)(v0 + 1392);
      uint64_t v263 = *(void *)(v0 + 1224);
      os_log_t loga = *(os_log_t *)(v0 + 1216);
      id v277 = *(id *)(v0 + 1272);
      v268 = (id *)(*(void *)(v0 + 1792) + 16);
      uint64_t v91 = MLHostTask.name.getter();
      uint64_t v93 = v92;
      v88(v89, enum case for TaskStatus.taskFailed(_:), v90);
      sub_100018D90(v91, v93, v89);
      swift_bridgeObjectRelease();
      v255(v89, v90);
      uint64_t v94 = MLHostTask.name.getter();
      sub_100018964(v94, v95);
      swift_bridgeObjectRelease();
      id v96 = [v259 processIdentifier];
      uint64_t v336 = 0;
      unint64_t v337 = 0xE000000000000000;
      _StringGuts.grow(_:)(27);
      v97._uint64_t countAndFlagsBits = 0x206B736154;
      v97._object = (void *)0xE500000000000000;
      String.append(_:)(v97);
      v98._uint64_t countAndFlagsBits = MLHostTask.name.getter();
      String.append(_:)(v98);
      swift_bridgeObjectRelease();
      v99._uint64_t countAndFlagsBits = 0xD000000000000014;
      v99._object = (void *)0x8000000100056210;
      String.append(_:)(v99);
      sub_100039C94((uint64_t)v96);
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();

      (*(void (**)(id, os_log_t))(v263 + 8))(v277, loga);
      swift_beginAccess();
      id v331 = *v268;
      id v100 = *v268;
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      [v259 invalidate];

      _AppExtensionProcess.invalidate()();
      (*(void (**)(uint64_t, uint64_t))(v312 + 8))(v305, v321);
      goto LABEL_59;
    }
    v42(*(void *)(v0 + 1512), v33, v32);
    Swift::String v61 = Logger.logObject.getter();
    os_log_type_t v62 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v61, v62))
    {
      unint64_t v264 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
      uint64_t v63 = *(void *)(v0 + 1512);
      uint64_t v262 = *(void *)(v0 + 1440);
      uint64_t v64 = swift_slowAlloc();
      uint64_t v336 = swift_slowAlloc();
      *(_DWORD *)uint64_t v64 = 136315650;
      uint64_t v65 = MLHostTask.name.getter();
      *(void *)(v0 + 1072) = sub_10000E564(v65, v66, &v336);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_retain();
      swift_bridgeObjectRelease();
      v264(v63, v262);
      *(_WORD *)(v64 + 12) = 1024;
      *(_DWORD *)(v0 + 836) = 1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v64 + 18) = 2080;
      swift_beginAccess();
      uint64_t v67 = Duration.description.getter();
      *(void *)(v0 + 1096) = sub_10000E564(v67, v68, &v336);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v61, v62, "Task %s continuing execution, shouldRun = %{BOOL}d, after %s.", (uint8_t *)v64, 0x1Cu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(void, void))(v0 + 1816))(*(void *)(v0 + 1512), *(void *)(v0 + 1440));
    }

    uint64_t v101 = *(void *)(v0 + 1792);
    uint64_t v284 = *(void *)(v0 + 1784);
    id v278 = *(id *)(v0 + 1776);
    uint64_t v102 = *(void *)(v0 + 1752);
    uint64_t v265 = *(void *)(v0 + 1744);
    os_log_type_t v260 = *(void (**)(unint64_t, uint64_t, uint64_t))(v0 + 1728);
    uint64_t v254 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1704);
    uint64_t v253 = *(void *)(v0 + 1552);
    uint64_t v252 = *(void *)(v0 + 1440);
    uint64_t v103 = *(void *)(v0 + 1432);
    uint64_t v104 = *(void *)(v0 + 1424);
    uint64_t v105 = *(void *)(v0 + 1416);
    unint64_t v106 = (*(unsigned __int8 *)(v0 + 1968) + 16) & ~(unint64_t)*(unsigned __int8 *)(v0 + 1968);
    unint64_t v256 = (*(void *)(v0 + 1456) + v106 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v257 = *(void *)(v0 + 1160);
    unint64_t v107 = (v256 + 15) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v251 = *(void *)(v0 + 1152);
    uint64_t v269 = (unsigned char *)(*(void *)(v0 + 1168) + 16);
    (*(void (**)(uint64_t, void, uint64_t))(v0 + 1760))(v103, *(unsigned int *)(v0 + 1972), v105);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v104 + 40))(v102, v103, v105);
    swift_beginAccess();
    uint64_t v108 = *(void **)(v101 + 16);
    *(void *)(v101 + 16) = 0;

    v254(v253, v251, v252);
    uint64_t v109 = swift_allocObject();
    v260(v109 + v106, v253, v252);
    *(void *)(v109 + v256) = v101;
    *(void *)(v109 + v107) = v265;
    *(void *)(v109 + ((v107 + 15) & 0xFFFFFFFFFFFFFFF8)) = v257;
    *(void *)(v0 + 48) = sub_10004A1FC;
    *(void *)(v0 + 56) = v109;
    *(void *)(v0 + 16) = _NSConcreteStackBlock;
    *(void *)(v0 + 24) = 1107296256;
    *(void *)(v0 + 32) = sub_1000287F8;
    *(void *)(v0 + 40) = &unk_100062318;
    uint64_t v110 = _Block_copy((const void *)(v0 + 16));
    swift_retain();
    swift_retain();
    swift_retain();
    swift_release();
    [v278 doWorkWithContext:v284 reply:v110];
    _Block_release(v110);
    swift_beginAccess();
    if (*v269 == 1)
    {
      uint64_t v111 = *(void *)(v0 + 1792);
    }
    else
    {
      swift_beginAccess();
      uint64_t v111 = *(void *)(v0 + 1792);
      if (!*(void *)(v111 + 16))
      {
        uint64_t v171 = *(void *)(v0 + 1264);
        uint64_t v172 = *(void *)(v0 + 1224);
        uint64_t v173 = *(void *)(v0 + 1216);
        ContinuousClock.init()();
        *(void *)(v0 + 888) = 500000000000000000;
        *(void *)(v0 + 896) = 0;
        *(_OWORD *)(v0 + 792) = 0u;
        *(unsigned char *)(v0 + 808) = 1;
        uint64_t v174 = sub_100049750(&qword_100065848, (void (*)(uint64_t))&type metadata accessor for ContinuousClock);
        dispatch thunk of Clock.now.getter();
        sub_100049750(&qword_100065850, (void (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant);
        dispatch thunk of InstantProtocol.advanced(by:)();
        uint64_t v175 = *(void (**)(uint64_t, uint64_t))(v172 + 8);
        *(void *)(v0 + 1896) = v175;
        *(void *)(v0 + 1904) = (v172 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
        v175(v171, v173);
        uint64_t v176 = (void *)swift_task_alloc();
        *(void *)(v0 + 1912) = v176;
        *uint64_t v176 = v0;
        v176[1] = sub_100040EA8;
        uint64_t v76 = *(void *)(v0 + 1176);
        uint64_t v78 = *(void *)(v0 + 1240);
        uint64_t v77 = v0 + 792;
        uint64_t v79 = v174;
        goto LABEL_20;
      }
    }
    uint64_t v112 = *(void *)(v0 + 1264);
    uint64_t v113 = *(void *)(v0 + 1224);
    uint64_t v114 = *(void *)(v0 + 1216);
    static ContinuousClock.now.getter();
    ContinuousClock.Instant.duration(to:)();
    BOOL v115 = *(void (**)(uint64_t, uint64_t))(v113 + 8);
    *(void *)(v0 + 1856) = v115;
    *(void *)(v0 + 1864) = (v113 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v115(v112, v114);
    uint64_t v116 = *(void **)(v111 + 16);
    uint64_t v117 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1704);
    if (v116)
    {
      v117(*(void *)(v0 + 1496), *(void *)(v0 + 1152), *(void *)(v0 + 1440));
      id v118 = v116;
      uint64_t v119 = Logger.logObject.getter();
      os_log_type_t v309 = static os_log_type_t.info.getter();
      BOOL v120 = os_log_type_enabled(v119, v309);
      BOOL v121 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
      uint64_t v122 = *(void *)(v0 + 1496);
      uint64_t v123 = *(void *)(v0 + 1440);
      id v331 = v116;
      unint64_t v285 = v115;
      if (v120)
      {
        uint64_t v124 = swift_slowAlloc();
        os_log_type_t v279 = (void *)swift_slowAlloc();
        uint64_t v336 = swift_slowAlloc();
        *(_DWORD *)uint64_t v124 = 136315650;
        uint64_t v125 = MLHostTask.name.getter();
        *(void *)(v0 + 1032) = sub_10000E564(v125, v126, &v336);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        v121(v122, v123);
        *(_WORD *)(v124 + 12) = 2080;
        uint64_t v127 = Duration.description.getter();
        *(void *)(v0 + 1040) = sub_10000E564(v127, v128, &v336);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        *(_WORD *)(v124 + 22) = 2112;
        *(void *)(v0 + 1048) = v118;
        id v129 = v118;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        void *v279 = v116;

        _os_log_impl((void *)&_mh_execute_header, v119, v309, "Task %s completed after %s. TaskResult: %@", (uint8_t *)v124, 0x20u);
        sub_10000E508(&qword_100065290);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        v121(v122, v123);
      }
      uint64_t v146 = *(void (**)(uint64_t, uint64_t))(v0 + 1832);
      uint64_t v147 = *(void *)(v0 + 1752);
      uint64_t v148 = *(void *)(v0 + 1432);
      uint64_t v149 = *(void *)(v0 + 1424);
      uint64_t v150 = *(void *)(v0 + 1416);
      uint64_t v151 = MLHostTask.name.getter();
      uint64_t v153 = v152;
      Swift::String v306 = *(void (**)(uint64_t, uint64_t, uint64_t))(v149 + 16);
      v306(v148, v147, v150);
      sub_100018D90(v151, v153, v148);
      swift_bridgeObjectRelease();
      v146(v148, v150);
      uint64_t v154 = MLHostTask.name.getter();
      sub_100018964(v154, v155);
      swift_bridgeObjectRelease();
      MLHostResult.status.getter();
      uint64_t v156 = MLHostResultStatus.rawValue.getter();
      if (v156 == MLHostResultStatus.rawValue.getter())
      {
        unint64_t v157 = *(void **)(v0 + 1784);
        v285(*(void *)(v0 + 1272), *(void *)(v0 + 1216));
        swift_unknownObjectRelease();
      }
      else
      {
        os_log_t logb = *(os_log_t *)(v0 + 1832);
        uint64_t v158 = *(void *)(v0 + 1752);
        uint64_t v159 = *(void *)(v0 + 1432);
        uint64_t v160 = *(void *)(v0 + 1416);
        uint64_t v313 = *(void *)(v0 + 1272);
        uint64_t v322 = *(void **)(v0 + 1784);
        uint64_t v304 = *(void *)(v0 + 1216);
        id v161 = [*(id *)(v0 + 1720) processIdentifier];
        uint64_t v336 = 0;
        unint64_t v337 = 0xE000000000000000;
        _StringGuts.grow(_:)(38);
        unint64_t v162 = v337;
        *(void *)(v0 + 840) = v336;
        *(void *)(v0 + 848) = v162;
        v163._uint64_t countAndFlagsBits = 0x206B736154;
        v163._object = (void *)0xE500000000000000;
        String.append(_:)(v163);
        v164._uint64_t countAndFlagsBits = MLHostTask.name.getter();
        String.append(_:)(v164);
        swift_bridgeObjectRelease();
        v165._object = (void *)0x8000000100056250;
        v165._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
        String.append(_:)(v165);
        v306(v159, v158, v160);
        _print_unlocked<A, B>(_:_:)();
        ((void (*)(uint64_t, uint64_t))logb)(v159, v160);
        v166._uint64_t countAndFlagsBits = 46;
        v166._object = (void *)0xE100000000000000;
        String.append(_:)(v166);
        sub_100039C94((uint64_t)v161);
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();

        v285(v313, v304);
      }
      swift_release();
      swift_release();
      uint64_t v167 = *(void **)(v0 + 1720);
      uint64_t v168 = *(void *)(v0 + 1408);
      uint64_t v169 = *(void *)(v0 + 1400);
      uint64_t v170 = *(void *)(v0 + 1392);
      swift_release();
      swift_release();
      [v167 invalidate];

      _AppExtensionProcess.invalidate()();
      (*(void (**)(uint64_t, uint64_t))(v169 + 8))(v168, v170);
      goto LABEL_59;
    }
    uint64_t v130 = *(void *)(v0 + 1488);
    uint64_t v131 = *(void *)(v0 + 1440);
    uint64_t v132 = *(void *)(v0 + 1152);
    (*(void (**)(void, void, void))(v0 + 1688))(*(void *)(v0 + 1624), *(void *)(v0 + 1680), *(void *)(v0 + 1592));
    v117(v130, v132, v131);
    uint64_t v133 = Logger.logObject.getter();
    os_log_type_t v333 = static os_log_type_t.info.getter();
    BOOL v134 = os_log_type_enabled(v133, v333);
    uint64_t v135 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
    id v136 = *(void (**)(uint64_t, uint64_t))(v0 + 1808);
    uint64_t v137 = *(void *)(v0 + 1624);
    uint64_t v138 = *(void *)(v0 + 1592);
    uint64_t v139 = *(void *)(v0 + 1488);
    uint64_t v140 = *(void *)(v0 + 1440);
    if (v134)
    {
      uint64_t v295 = *(void *)(v0 + 1624);
      uint64_t v141 = swift_slowAlloc();
      uint64_t v336 = swift_slowAlloc();
      *(_DWORD *)uint64_t v141 = 136315394;
      uint64_t v142 = MLHostTask.name.getter();
      *(void *)(v0 + 1008) = sub_10000E564(v142, v143, &v336);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v135(v139, v140);
      *(_WORD *)(v141 + 12) = 2080;
      uint64_t v144 = Duration.description.getter();
      *(void *)(v0 + 1016) = sub_10000E564(v144, v145, &v336);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v133, v333, "Task %s asked to terminate because of deferral after %s.", (uint8_t *)v141, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v136(v295, v138);
    }
    else
    {
      v135(*(void *)(v0 + 1488), *(void *)(v0 + 1440));

      v136(v137, v138);
    }
    uint64_t v177 = *(void *)(v0 + 1792);
    unint64_t v178 = *(void **)(v0 + 1776);
    static ContinuousClock.now.getter();
    uint64_t v179 = swift_allocObject();
    *(void *)(v0 + 1872) = v179;
    *(void *)(v179 + 16) = 0;
    *(void *)(v179 + 24) = 0;
    [v178 doStop];
    uint64_t v180 = *(void **)(v177 + 16);
    if (v180) {
      goto LABEL_44;
    }
    if (static Duration.< infix(_:_:)())
    {
      uint64_t v180 = *(void **)(*(void *)(v0 + 1792) + 16);
      if (!v180)
      {
        uint64_t v310 = *(void (**)(uint64_t, uint64_t))(v0 + 1832);
        uint64_t v216 = *(void (**)(uint64_t, void, uint64_t))(v0 + 1760);
        uint64_t v327 = *(void (**)(id, uint64_t, uint64_t))(v0 + 1704);
        uint64_t v296 = *(void (**)(uint64_t, os_log_t, uint64_t))(v0 + 1688);
        uint64_t v217 = *(void *)(v0 + 1616);
        uint64_t v270 = *(void *)(v0 + 1592);
        os_log_t logc = *(os_log_t *)(v0 + 1680);
        id v280 = *(id *)(v0 + 1480);
        uint64_t v287 = *(void *)(v0 + 1440);
        uint64_t v218 = *(void *)(v0 + 1432);
        uint64_t v219 = *(void *)(v0 + 1416);
        uint64_t v220 = *(void *)(v0 + 1152);
        uint64_t v221 = MLHostTask.name.getter();
        uint64_t v223 = v222;
        v216(v218, enum case for TaskStatus.taskDeferred(_:), v219);
        sub_100018D90(v221, v223, v218);
        swift_bridgeObjectRelease();
        v310(v218, v219);
        v296(v217, logc, v270);
        v327(v280, v220, v287);
        uint64_t v224 = Logger.logObject.getter();
        os_log_type_t v225 = static os_log_type_t.error.getter();
        BOOL v226 = os_log_type_enabled(v224, v225);
        uint64_t v227 = *(void (**)(uint64_t, uint64_t))(v0 + 1808);
        uint64_t v228 = *(void *)(v0 + 1616);
        uint64_t v229 = *(void *)(v0 + 1592);
        uint64_t v230 = *(void *)(v0 + 1480);
        uint64_t v231 = *(void *)(v0 + 1440);
        if (v226)
        {
          v297 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
          uint64_t v335 = *(void *)(v0 + 1616);
          uint64_t v232 = (uint8_t *)swift_slowAlloc();
          uint64_t v336 = swift_slowAlloc();
          *(_DWORD *)uint64_t v232 = 136315138;
          uint64_t v233 = MLHostTask.name.getter();
          *(void *)(v0 + 976) = sub_10000E564(v233, v234, &v336);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          v297(v230, v231);
          _os_log_impl((void *)&_mh_execute_header, v224, v225, "Task %s has not responded to deferral. Marking task as deferred and terminating process.", v232, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          v227(v335, v229);
        }
        else
        {
          (*(void (**)(void, void))(v0 + 1816))(*(void *)(v0 + 1480), *(void *)(v0 + 1440));

          v227(v228, v229);
        }
        id v246 = [*(id *)(v0 + 1720) processIdentifier];
        uint64_t v336 = 0;
        unint64_t v337 = 0xE000000000000000;
        _StringGuts.grow(_:)(38);
        v247._uint64_t countAndFlagsBits = 0x206B736154;
        v247._object = (void *)0xE500000000000000;
        String.append(_:)(v247);
        v248._uint64_t countAndFlagsBits = MLHostTask.name.getter();
        String.append(_:)(v248);
        swift_bridgeObjectRelease();
        v249._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
        v249._object = (void *)0x8000000100056230;
        String.append(_:)(v249);
        sub_100039C94((uint64_t)v246);
        swift_bridgeObjectRelease();
LABEL_47:
        (*(void (**)(void, void, void))(v0 + 1704))(*(void *)(v0 + 1472), *(void *)(v0 + 1152), *(void *)(v0 + 1440));
        swift_retain_n();
        uint64_t v201 = Logger.logObject.getter();
        os_log_type_t v202 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v201, v202))
        {
          uint64_t v300 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
          uint64_t v315 = *(void *)(v0 + 1792);
          uint64_t v203 = *(void *)(v0 + 1472);
          uint64_t v286 = *(void *)(v0 + 1440);
          uint64_t v204 = swift_slowAlloc();
          uint64_t v325 = (void *)swift_slowAlloc();
          uint64_t v336 = swift_slowAlloc();
          *(_DWORD *)uint64_t v204 = 136315650;
          uint64_t v205 = MLHostTask.name.getter();
          *(void *)(v0 + 936) = sub_10000E564(v205, v206, &v336);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_retain();
          swift_bridgeObjectRelease();
          v300(v203, v286);
          *(_WORD *)(v204 + 12) = 2080;
          swift_beginAccess();
          uint64_t v207 = Duration.description.getter();
          *(void *)(v0 + 952) = sub_10000E564(v207, v208, &v336);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_release();
          swift_bridgeObjectRelease();
          *(_WORD *)(v204 + 22) = 2112;
          uint64_t v209 = *(void **)(v315 + 16);
          if (v209)
          {
            *(void *)(v0 + 968) = v209;
            id v210 = v209;
          }
          else
          {
            *(void *)(v0 + 960) = 0;
          }
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          uint64_t v239 = *(void (**)(uint64_t, uint64_t))(v0 + 1856);
          uint64_t v311 = *(void **)(v0 + 1784);
          uint64_t v317 = *(void *)(v0 + 1272);
          uint64_t v307 = *(void *)(v0 + 1256);
          uint64_t v240 = *(void *)(v0 + 1216);
          *uint64_t v325 = v209;
          swift_release_n();
          _os_log_impl((void *)&_mh_execute_header, v201, v202, "Task %s deferred after awaiting %s for its cooperative termination. TaskResult: %@", (uint8_t *)v204, 0x20u);
          sub_10000E508(&qword_100065290);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
          swift_unknownObjectRelease();

          v239(v307, v240);
          v239(v317, v240);
        }
        else
        {
          uint64_t v211 = *(void (**)(uint64_t, uint64_t))(v0 + 1856);
          uint64_t v212 = *(void **)(v0 + 1784);
          uint64_t v213 = *(void *)(v0 + 1472);
          uint64_t v214 = *(void *)(v0 + 1440);
          uint64_t v326 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
          uint64_t v334 = *(void *)(v0 + 1272);
          uint64_t v316 = *(void *)(v0 + 1256);
          uint64_t v215 = *(void *)(v0 + 1216);
          swift_release_n();
          swift_unknownObjectRelease();

          v326(v213, v214);
          v211(v316, v215);
          v211(v334, v215);
        }
        uint64_t v241 = *(void **)(v0 + 1720);
        uint64_t v242 = *(void *)(v0 + 1408);
        uint64_t v243 = *(void *)(v0 + 1400);
        uint64_t v328 = *(void *)(v0 + 1392);
        id v331 = *(id *)(*(void *)(v0 + 1792) + 16);
        id v244 = v331;
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        [v241 invalidate];

        _AppExtensionProcess.invalidate()();
        (*(void (**)(uint64_t, uint64_t))(v243 + 8))(v242, v328);
        goto LABEL_59;
      }
LABEL_44:
      uint64_t v323 = *(void (**)(uint64_t, uint64_t))(v0 + 1832);
      uint64_t v181 = *(void *)(v0 + 1752);
      uint64_t v182 = *(void *)(v0 + 1432);
      uint64_t v183 = *(void *)(v0 + 1424);
      uint64_t v184 = *(void *)(v0 + 1416);
      id v314 = v180;
      uint64_t v185 = MLHostTask.name.getter();
      uint64_t v187 = v186;
      id v188 = *(void (**)(uint64_t, uint64_t, uint64_t))(v183 + 16);
      v188(v182, v181, v184);
      sub_100018D90(v185, v187, v182);
      swift_bridgeObjectRelease();
      v323(v182, v184);
      uint64_t v189 = MLHostTask.name.getter();
      sub_100018964(v189, v190);
      swift_bridgeObjectRelease();
      MLHostResult.status.getter();
      uint64_t v191 = MLHostResultStatus.rawValue.getter();
      if (v191 != MLHostResultStatus.rawValue.getter())
      {
        uint64_t v324 = *(void (**)(uint64_t, uint64_t))(v0 + 1832);
        uint64_t v192 = *(void *)(v0 + 1752);
        uint64_t v193 = *(void *)(v0 + 1432);
        uint64_t v194 = *(void *)(v0 + 1416);
        id v195 = [*(id *)(v0 + 1720) processIdentifier];
        uint64_t v336 = 0;
        unint64_t v337 = 0xE000000000000000;
        _StringGuts.grow(_:)(38);
        unint64_t v196 = v337;
        *(void *)(v0 + 904) = v336;
        *(void *)(v0 + 912) = v196;
        v197._uint64_t countAndFlagsBits = 0x206B736154;
        v197._object = (void *)0xE500000000000000;
        String.append(_:)(v197);
        v198._uint64_t countAndFlagsBits = MLHostTask.name.getter();
        String.append(_:)(v198);
        swift_bridgeObjectRelease();
        v199._object = (void *)0x8000000100056250;
        v199._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
        String.append(_:)(v199);
        v188(v193, v192, v194);
        _print_unlocked<A, B>(_:_:)();
        v324(v193, v194);
        v200._uint64_t countAndFlagsBits = 46;
        v200._object = (void *)0xE100000000000000;
        String.append(_:)(v200);
        sub_100039C94((uint64_t)v195);
        swift_bridgeObjectRelease();
      }

      goto LABEL_47;
    }
    v235 = *(void (**)(uint64_t, uint64_t))(v0 + 1856);
    uint64_t v236 = *(void *)(v0 + 1264);
    uint64_t v237 = *(void *)(v0 + 1216);
    ContinuousClock.init()();
    *(void *)(v0 + 856) = 500000000000000000;
    *(void *)(v0 + 864) = 0;
    *(_OWORD *)(v0 + 816) = 0u;
    *(unsigned char *)(v0 + 832) = 1;
    uint64_t v72 = sub_100049750(&qword_100065848, (void (*)(uint64_t))&type metadata accessor for ContinuousClock);
    dispatch thunk of Clock.now.getter();
    sub_100049750(&qword_100065850, (void (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant);
    dispatch thunk of InstantProtocol.advanced(by:)();
    v235(v236, v237);
    BOOL v238 = (void *)swift_task_alloc();
    *(void *)(v0 + 1880) = v238;
    *BOOL v238 = v0;
    v238[1] = sub_10003F2DC;
    uint64_t v75 = *(void *)(v0 + 1248);
    uint64_t v76 = *(void *)(v0 + 1176);
    uint64_t v77 = v0 + 816;
  }
  else
  {
    uint64_t v69 = *(void *)(v0 + 1264);
    uint64_t v70 = *(void *)(v0 + 1224);
    uint64_t v71 = *(void *)(v0 + 1216);
    ContinuousClock.init()();
    *(void *)(v0 + 872) = 500000000000000000;
    *(void *)(v0 + 880) = 0;
    *(_OWORD *)(v0 + 768) = 0u;
    *(unsigned char *)(v0 + 784) = 1;
    uint64_t v72 = sub_100049750(&qword_100065848, (void (*)(uint64_t))&type metadata accessor for ContinuousClock);
    dispatch thunk of Clock.now.getter();
    sub_100049750(&qword_100065850, (void (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant);
    dispatch thunk of InstantProtocol.advanced(by:)();
    uint64_t v73 = *(void (**)(uint64_t, uint64_t))(v70 + 8);
    *(void *)(v0 + 1928) = v73;
    *(void *)(v0 + 1936) = (v70 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v73(v69, v71);
    uint64_t v74 = (void *)swift_task_alloc();
    *(void *)(v0 + 1944) = v74;
    *uint64_t v74 = v0;
    v74[1] = sub_100043D34;
    uint64_t v75 = *(void *)(v0 + 1232);
    uint64_t v76 = *(void *)(v0 + 1176);
    uint64_t v77 = v0 + 768;
  }
  uint64_t v78 = v75;
  uint64_t v79 = v72;
LABEL_20:
  return dispatch thunk of Clock.sleep(until:tolerance:)(v78, v77, v76, v79);
}

uint64_t sub_100046904()
{
  uint64_t v327 = v0;
  (*(void (**)(void, void))(*(void *)(v0 + 1184) + 8))(*(void *)(v0 + 1192), *(void *)(v0 + 1176));
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Task.sleep interrupted, skipping waiting for extension completion.", v3, 2u);
    swift_slowDealloc();
  }
  swift_errorRelease();

  uint64_t v4 = *(void *)(v0 + 1168);
  swift_beginAccess();
  if ((*(unsigned char *)(v4 + 16) & 1) == 0)
  {
    uint64_t v5 = *(void *)(v0 + 1800);
    swift_beginAccess();
    if (*(unsigned char *)(v5 + 16) == 2)
    {
      uint64_t v293 = *(void (**)(uint64_t, uint64_t))(v0 + 1832);
      uint64_t v6 = *(void (**)(uint64_t, void, uint64_t))(v0 + 1760);
      v298 = *(void (**)(void, uint64_t, uint64_t))(v0 + 1704);
      id v280 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1688);
      uint64_t v7 = *(void *)(v0 + 1608);
      uint64_t v258 = *(void *)(v0 + 1592);
      uint64_t v262 = *(void *)(v0 + 1680);
      *(void *)type = *(void *)(v0 + 1464);
      uint64_t v273 = *(void *)(v0 + 1440);
      uint64_t v8 = *(void *)(v0 + 1432);
      uint64_t v9 = *(void *)(v0 + 1416);
      uint64_t v10 = *(void *)(v0 + 1152);
      uint64_t v11 = MLHostTask.name.getter();
      uint64_t v13 = v12;
      v6(v8, enum case for TaskStatus.taskFailed(_:), v9);
      sub_100018D90(v11, v13, v8);
      swift_bridgeObjectRelease();
      v293(v8, v9);
      v280(v7, v262, v258);
      v298(*(void *)type, v10, v273);
      uint64_t v14 = Logger.logObject.getter();
      os_log_type_t v15 = static os_log_type_t.error.getter();
      BOOL v16 = os_log_type_enabled(v14, v15);
      uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v0 + 1808);
      uint64_t v18 = *(void *)(v0 + 1608);
      uint64_t v19 = *(void *)(v0 + 1592);
      uint64_t v20 = *(void *)(v0 + 1464);
      uint64_t v21 = *(void *)(v0 + 1440);
      if (v16)
      {
        uint64_t v281 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
        uint64_t v319 = *(void *)(v0 + 1608);
        uint64_t v22 = (uint8_t *)swift_slowAlloc();
        uint64_t v325 = swift_slowAlloc();
        *(_DWORD *)uint64_t v22 = 136315138;
        uint64_t v23 = MLHostTask.name.getter();
        *(void *)(v0 + 1024) = sub_10000E564(v23, v24, &v325);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        v281(v20, v21);
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "Task %s has been in shouldRun for too long. Marking task as failed and terminating process.", v22, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v17(v319, v19);
      }
      else
      {
        (*(void (**)(void, void))(v0 + 1816))(*(void *)(v0 + 1464), *(void *)(v0 + 1440));

        v17(v18, v19);
      }
      uint64_t v64 = *(void **)(v0 + 1720);
      uint64_t v65 = *(void *)(v0 + 1408);
      uint64_t v66 = *(void *)(v0 + 1400);
      uint64_t v322 = *(void *)(v0 + 1392);
      uint64_t v291 = *(void *)(v0 + 1272);
      v294 = *(void **)(v0 + 1784);
      uint64_t v67 = *(void *)(v0 + 1224);
      uint64_t v285 = *(void *)(v0 + 1216);
      id v68 = [v64 processIdentifier];
      uint64_t v325 = 0;
      unint64_t v326 = 0xE000000000000000;
      _StringGuts.grow(_:)(43);
      v69._uint64_t countAndFlagsBits = 0x206B736154;
      v69._object = (void *)0xE500000000000000;
      String.append(_:)(v69);
      v70._uint64_t countAndFlagsBits = MLHostTask.name.getter();
      String.append(_:)(v70);
      swift_bridgeObjectRelease();
      v71._uint64_t countAndFlagsBits = 0xD000000000000024;
      v71._object = (void *)0x80000001000561C0;
      String.append(_:)(v71);
      sub_100039C94((uint64_t)v68);
      swift_unknownObjectRelease();

      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v291, v285);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      [v64 invalidate];

      _AppExtensionProcess.invalidate()();
      (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v65, v322);
      id v321 = 0;
LABEL_56:
      swift_release_n();
      swift_unknownObjectRelease();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      v235 = *(uint64_t (**)(id))(v0 + 8);
      return v235(v321);
    }
  }
  uint64_t v25 = *(void *)(v0 + 1800);
  swift_beginAccess();
  int v26 = *(unsigned __int8 *)(v25 + 16);
  uint64_t v27 = *(void *)(v0 + 1440);
  uint64_t v28 = *(void *)(v0 + 1152);
  if (v26 == 2)
  {
    (*(void (**)(void, uint64_t, uint64_t))(v0 + 1704))(*(void *)(v0 + 1520), v28, v27);
    unint64_t v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v290 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
      uint64_t v31 = *(void *)(v0 + 1520);
      uint64_t v274 = *(void *)(v0 + 1440);
      uint64_t v282 = (unsigned __int8 *)(*(void *)(v0 + 1168) + 16);
      uint64_t v32 = swift_slowAlloc();
      uint64_t v325 = swift_slowAlloc();
      *(_DWORD *)uint64_t v32 = 136315650;
      uint64_t v33 = MLHostTask.name.getter();
      *(void *)(v0 + 1000) = sub_10000E564(v33, v34, &v325);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_retain();
      swift_bridgeObjectRelease();
      v290(v31, v274);
      *(_WORD *)(v32 + 12) = 1024;
      swift_beginAccess();
      *(_DWORD *)(v0 + 1964) = *v282;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v32 + 18) = 2080;
      swift_beginAccess();
      uint64_t v35 = Duration.description.getter();
      *(void *)(v0 + 984) = sub_10000E564(v35, v36, &v325);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Task %s skipping execution, isDeferred = %{BOOL}d, after %s.", (uint8_t *)v32, 0x1Cu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(void, void))(v0 + 1816))(*(void *)(v0 + 1520), *(void *)(v0 + 1440));
    }

    uint64_t v252 = *(void (**)(uint64_t, uint64_t))(v0 + 1832);
    uint64_t v284 = *(void **)(v0 + 1784);
    uint64_t v46 = *(void (**)(uint64_t, void, uint64_t))(v0 + 1760);
    id v249 = *(id *)(v0 + 1720);
    uint64_t v47 = *(void *)(v0 + 1432);
    uint64_t v48 = *(void *)(v0 + 1416);
    uint64_t v299 = *(void *)(v0 + 1408);
    uint64_t v309 = *(void *)(v0 + 1400);
    uint64_t v320 = *(void *)(v0 + 1392);
    uint64_t v276 = *(void *)(v0 + 1272);
    uint64_t v259 = *(void *)(v0 + 1224);
    *(void *)os_log_type_t typea = *(void *)(v0 + 1216);
    uint64_t v49 = MLHostTask.name.getter();
    uint64_t v51 = v50;
    v46(v47, enum case for TaskStatus.taskDeferred(_:), v48);
    sub_100018D90(v49, v51, v47);
    swift_bridgeObjectRelease();
    v252(v47, v48);
    id v52 = [v249 processIdentifier];
    uint64_t v325 = 0;
    unint64_t v326 = 0xE000000000000000;
    _StringGuts.grow(_:)(37);
    v53._uint64_t countAndFlagsBits = 0x206B736154;
    v53._object = (void *)0xE500000000000000;
    String.append(_:)(v53);
    v54._uint64_t countAndFlagsBits = MLHostTask.name.getter();
    String.append(_:)(v54);
    swift_bridgeObjectRelease();
    v55._uint64_t countAndFlagsBits = 0xD00000000000001ELL;
    v55._object = (void *)0x80000001000561F0;
    String.append(_:)(v55);
    sub_100039C94((uint64_t)v52);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();

    (*(void (**)(uint64_t, os_log_type_t *))(v259 + 8))(v276, *(os_log_type_t **)typea);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    [v249 invalidate];

    _AppExtensionProcess.invalidate()();
    (*(void (**)(uint64_t, uint64_t))(v309 + 8))(v299, v320);
    id v321 = 0;
    goto LABEL_56;
  }
  uint64_t v37 = *(void (**)(void, uint64_t, uint64_t))(v0 + 1704);
  if ((v26 & 1) == 0)
  {
    v37(*(void *)(v0 + 1504), v28, v27);
    uint64_t v38 = Logger.logObject.getter();
    os_log_type_t v39 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v283 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
      uint64_t v40 = *(void *)(v0 + 1504);
      uint64_t v275 = *(void *)(v0 + 1440);
      uint64_t v41 = swift_slowAlloc();
      uint64_t v325 = swift_slowAlloc();
      *(_DWORD *)uint64_t v41 = 136315650;
      uint64_t v42 = MLHostTask.name.getter();
      *(void *)(v0 + 944) = sub_10000E564(v42, v43, &v325);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_retain();
      swift_bridgeObjectRelease();
      v283(v40, v275);
      *(_WORD *)(v41 + 12) = 1024;
      *(_DWORD *)(v0 + 1960) = 0;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v41 + 18) = 2080;
      swift_beginAccess();
      uint64_t v44 = Duration.description.getter();
      *(void *)(v0 + 920) = sub_10000E564(v44, v45, &v325);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "Task %s skipping execution, shouldRun = %{BOOL}d, after %s.", (uint8_t *)v41, 0x1Cu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(void, void))(v0 + 1816))(*(void *)(v0 + 1504), *(void *)(v0 + 1440));
    }

    id v246 = *(void (**)(uint64_t, uint64_t))(v0 + 1832);
    uint64_t v286 = *(void **)(v0 + 1784);
    uint64_t v72 = *(void (**)(uint64_t, void, uint64_t))(v0 + 1760);
    id v251 = *(id *)(v0 + 1720);
    uint64_t v73 = *(void *)(v0 + 1432);
    uint64_t v74 = *(void *)(v0 + 1416);
    uint64_t v295 = *(void *)(v0 + 1408);
    uint64_t v303 = *(void *)(v0 + 1400);
    uint64_t v310 = *(void *)(v0 + 1392);
    uint64_t v254 = *(void *)(v0 + 1224);
    uint64_t v263 = *(void *)(v0 + 1216);
    *(void *)typeb = *(void *)(v0 + 1272);
    os_log_type_t v260 = (id *)(*(void *)(v0 + 1792) + 16);
    uint64_t v75 = MLHostTask.name.getter();
    uint64_t v77 = v76;
    v72(v73, enum case for TaskStatus.taskFailed(_:), v74);
    sub_100018D90(v75, v77, v73);
    swift_bridgeObjectRelease();
    v246(v73, v74);
    uint64_t v78 = MLHostTask.name.getter();
    sub_100018964(v78, v79);
    swift_bridgeObjectRelease();
    id v80 = [v251 processIdentifier];
    uint64_t v325 = 0;
    unint64_t v326 = 0xE000000000000000;
    _StringGuts.grow(_:)(27);
    v81._uint64_t countAndFlagsBits = 0x206B736154;
    v81._object = (void *)0xE500000000000000;
    String.append(_:)(v81);
    v82._uint64_t countAndFlagsBits = MLHostTask.name.getter();
    String.append(_:)(v82);
    swift_bridgeObjectRelease();
    v83._uint64_t countAndFlagsBits = 0xD000000000000014;
    v83._object = (void *)0x8000000100056210;
    String.append(_:)(v83);
    sub_100039C94((uint64_t)v80);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();

    (*(void (**)(os_log_type_t *, uint64_t))(v254 + 8))(*(os_log_type_t **)typeb, v263);
    swift_beginAccess();
    id v321 = *v260;
    id v84 = *v260;
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    [v251 invalidate];

    _AppExtensionProcess.invalidate()();
    (*(void (**)(uint64_t, uint64_t))(v303 + 8))(v295, v310);
    goto LABEL_56;
  }
  v37(*(void *)(v0 + 1512), v28, v27);
  uint64_t v56 = Logger.logObject.getter();
  os_log_type_t v57 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v56, v57))
  {
    uint64_t v253 = *(void (**)(uint64_t, id))(v0 + 1816);
    uint64_t v58 = *(void *)(v0 + 1512);
    id v250 = *(id *)(v0 + 1440);
    uint64_t v59 = swift_slowAlloc();
    uint64_t v325 = swift_slowAlloc();
    *(_DWORD *)uint64_t v59 = 136315650;
    uint64_t v60 = MLHostTask.name.getter();
    *(void *)(v0 + 1072) = sub_10000E564(v60, v61, &v325);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_retain();
    swift_bridgeObjectRelease();
    v253(v58, v250);
    *(_WORD *)(v59 + 12) = 1024;
    *(_DWORD *)(v0 + 836) = 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v59 + 18) = 2080;
    swift_beginAccess();
    uint64_t v62 = Duration.description.getter();
    *(void *)(v0 + 1096) = sub_10000E564(v62, v63, &v325);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v56, v57, "Task %s continuing execution, shouldRun = %{BOOL}d, after %s.", (uint8_t *)v59, 0x1Cu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(void, void))(v0 + 1816))(*(void *)(v0 + 1512), *(void *)(v0 + 1440));
  }

  uint64_t v85 = *(void *)(v0 + 1792);
  unint64_t v264 = *(void **)(v0 + 1776);
  *(void *)typec = *(void *)(v0 + 1784);
  uint64_t v86 = *(void *)(v0 + 1752);
  uint64_t v255 = *(void *)(v0 + 1744);
  Swift::String v248 = *(void (**)(unint64_t, uint64_t, uint64_t))(v0 + 1728);
  id v244 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1704);
  uint64_t v243 = *(void *)(v0 + 1552);
  uint64_t v242 = *(void *)(v0 + 1440);
  uint64_t v87 = *(void *)(v0 + 1432);
  uint64_t v88 = *(void *)(v0 + 1424);
  uint64_t v89 = *(void *)(v0 + 1416);
  unint64_t v90 = (*(unsigned __int8 *)(v0 + 1968) + 16) & ~(unint64_t)*(unsigned __int8 *)(v0 + 1968);
  unint64_t v245 = (*(void *)(v0 + 1456) + v90 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v247 = *(void *)(v0 + 1160);
  unint64_t v91 = (v245 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v241 = *(void *)(v0 + 1152);
  unint64_t v256 = (unsigned char *)(*(void *)(v0 + 1168) + 16);
  (*(void (**)(uint64_t, void, uint64_t))(v0 + 1760))(v87, *(unsigned int *)(v0 + 1972), v89);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v88 + 40))(v86, v87, v89);
  swift_beginAccess();
  uint64_t v92 = *(void **)(v85 + 16);
  *(void *)(v85 + 16) = 0;

  v244(v243, v241, v242);
  uint64_t v93 = swift_allocObject();
  v248(v93 + v90, v243, v242);
  *(void *)(v93 + v245) = v85;
  *(void *)(v93 + v91) = v255;
  *(void *)(v93 + ((v91 + 15) & 0xFFFFFFFFFFFFFFF8)) = v247;
  *(void *)(v0 + 48) = sub_10004A1FC;
  *(void *)(v0 + 56) = v93;
  *(void *)(v0 + 16) = _NSConcreteStackBlock;
  *(void *)(v0 + 24) = 1107296256;
  *(void *)(v0 + 32) = sub_1000287F8;
  *(void *)(v0 + 40) = &unk_100062318;
  uint64_t v94 = _Block_copy((const void *)(v0 + 16));
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  [v264 doWorkWithContext:*(void *)typec reply:v94];
  _Block_release(v94);
  swift_beginAccess();
  if (*v256 == 1)
  {
    uint64_t v95 = *(void *)(v0 + 1792);
  }
  else
  {
    swift_beginAccess();
    uint64_t v95 = *(void *)(v0 + 1792);
    if (!*(void *)(v95 + 16))
    {
      uint64_t v156 = *(void *)(v0 + 1264);
      uint64_t v157 = *(void *)(v0 + 1224);
      uint64_t v158 = *(void *)(v0 + 1216);
      ContinuousClock.init()();
      *(void *)(v0 + 888) = 500000000000000000;
      *(void *)(v0 + 896) = 0;
      *(_OWORD *)(v0 + 792) = 0u;
      *(unsigned char *)(v0 + 808) = 1;
      uint64_t v159 = sub_100049750(&qword_100065848, (void (*)(uint64_t))&type metadata accessor for ContinuousClock);
      dispatch thunk of Clock.now.getter();
      sub_100049750(&qword_100065850, (void (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant);
      dispatch thunk of InstantProtocol.advanced(by:)();
      uint64_t v160 = *(void (**)(uint64_t, uint64_t))(v157 + 8);
      *(void *)(v0 + 1896) = v160;
      *(void *)(v0 + 1904) = (v157 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
      v160(v156, v158);
      id v161 = (void *)swift_task_alloc();
      *(void *)(v0 + 1912) = v161;
      *id v161 = v0;
      v161[1] = sub_100040EA8;
      uint64_t v162 = *(void *)(v0 + 1176);
      uint64_t v163 = *(void *)(v0 + 1240);
      uint64_t v164 = v0 + 792;
      uint64_t v165 = v159;
      goto LABEL_50;
    }
  }
  uint64_t v96 = *(void *)(v0 + 1264);
  uint64_t v97 = *(void *)(v0 + 1224);
  uint64_t v98 = *(void *)(v0 + 1216);
  static ContinuousClock.now.getter();
  ContinuousClock.Instant.duration(to:)();
  Swift::String v99 = *(void (**)(uint64_t, uint64_t))(v97 + 8);
  *(void *)(v0 + 1856) = v99;
  *(void *)(v0 + 1864) = (v97 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v99(v96, v98);
  id v100 = *(void **)(v95 + 16);
  uint64_t v101 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1704);
  if (v100)
  {
    uint64_t v296 = v99;
    v101(*(void *)(v0 + 1496), *(void *)(v0 + 1152), *(void *)(v0 + 1440));
    uint64_t v304 = v100;
    uint64_t v102 = Logger.logObject.getter();
    os_log_type_t v103 = static os_log_type_t.info.getter();
    BOOL v104 = os_log_type_enabled(v102, v103);
    uint64_t v105 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
    uint64_t v106 = *(void *)(v0 + 1496);
    uint64_t v107 = *(void *)(v0 + 1440);
    id v321 = v100;
    if (v104)
    {
      uint64_t v108 = swift_slowAlloc();
      uint64_t v287 = (void *)swift_slowAlloc();
      uint64_t v325 = swift_slowAlloc();
      *(_DWORD *)uint64_t v108 = 136315650;
      uint64_t v109 = MLHostTask.name.getter();
      *(void *)(v0 + 1032) = sub_10000E564(v109, v110, &v325);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v105(v106, v107);
      *(_WORD *)(v108 + 12) = 2080;
      uint64_t v111 = Duration.description.getter();
      *(void *)(v0 + 1040) = sub_10000E564(v111, v112, &v325);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v108 + 22) = 2112;
      *(void *)(v0 + 1048) = v304;
      uint64_t v113 = v304;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v287 = v100;

      uint64_t v114 = v102;
      _os_log_impl((void *)&_mh_execute_header, v102, v103, "Task %s completed after %s. TaskResult: %@", (uint8_t *)v108, 0x20u);
      sub_10000E508(&qword_100065290);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      v105(v106, v107);

      uint64_t v114 = v304;
    }

    uint64_t v131 = *(void (**)(uint64_t, uint64_t))(v0 + 1832);
    uint64_t v132 = *(void *)(v0 + 1752);
    uint64_t v133 = *(void *)(v0 + 1432);
    uint64_t v134 = *(void *)(v0 + 1424);
    uint64_t v135 = *(void *)(v0 + 1416);
    uint64_t v136 = MLHostTask.name.getter();
    uint64_t v138 = v137;
    uint64_t v292 = *(void (**)(uint64_t, uint64_t, uint64_t))(v134 + 16);
    v292(v133, v132, v135);
    sub_100018D90(v136, v138, v133);
    swift_bridgeObjectRelease();
    v131(v133, v135);
    uint64_t v139 = MLHostTask.name.getter();
    sub_100018964(v139, v140);
    swift_bridgeObjectRelease();
    MLHostResult.status.getter();
    uint64_t v141 = MLHostResultStatus.rawValue.getter();
    if (v141 == MLHostResultStatus.rawValue.getter())
    {
      uint64_t v142 = *(void **)(v0 + 1784);
      v296(*(void *)(v0 + 1272), *(void *)(v0 + 1216));
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v265 = *(void (**)(uint64_t, uint64_t))(v0 + 1832);
      uint64_t v143 = *(void *)(v0 + 1752);
      uint64_t v144 = *(void *)(v0 + 1432);
      uint64_t v145 = *(void *)(v0 + 1416);
      uint64_t v305 = *(void *)(v0 + 1272);
      uint64_t v312 = *(void **)(v0 + 1784);
      uint64_t v289 = *(void *)(v0 + 1216);
      id v146 = [*(id *)(v0 + 1720) processIdentifier];
      uint64_t v325 = 0;
      unint64_t v326 = 0xE000000000000000;
      _StringGuts.grow(_:)(38);
      unint64_t v147 = v326;
      *(void *)(v0 + 840) = v325;
      *(void *)(v0 + 848) = v147;
      v148._uint64_t countAndFlagsBits = 0x206B736154;
      v148._object = (void *)0xE500000000000000;
      String.append(_:)(v148);
      v149._uint64_t countAndFlagsBits = MLHostTask.name.getter();
      String.append(_:)(v149);
      swift_bridgeObjectRelease();
      v150._object = (void *)0x8000000100056250;
      v150._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
      String.append(_:)(v150);
      v292(v144, v143, v145);
      _print_unlocked<A, B>(_:_:)();
      v265(v144, v145);
      v151._uint64_t countAndFlagsBits = 46;
      v151._object = (void *)0xE100000000000000;
      String.append(_:)(v151);
      sub_100039C94((uint64_t)v146);
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();

      v296(v305, v289);
    }
    swift_release();
    swift_release();
    uint64_t v152 = *(void **)(v0 + 1720);
    uint64_t v153 = *(void *)(v0 + 1408);
    uint64_t v154 = *(void *)(v0 + 1400);
    uint64_t v155 = *(void *)(v0 + 1392);
    swift_release();
    swift_release();
    [v152 invalidate];

    _AppExtensionProcess.invalidate()();
    (*(void (**)(uint64_t, uint64_t))(v154 + 8))(v153, v155);
    goto LABEL_56;
  }
  uint64_t v115 = *(void *)(v0 + 1488);
  uint64_t v116 = *(void *)(v0 + 1440);
  uint64_t v117 = *(void *)(v0 + 1152);
  (*(void (**)(void, void, void))(v0 + 1688))(*(void *)(v0 + 1624), *(void *)(v0 + 1680), *(void *)(v0 + 1592));
  v101(v115, v117, v116);
  id v118 = Logger.logObject.getter();
  os_log_type_t v311 = static os_log_type_t.info.getter();
  BOOL v119 = os_log_type_enabled(v118, v311);
  BOOL v120 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
  BOOL v121 = *(void (**)(uint64_t, uint64_t))(v0 + 1808);
  uint64_t v122 = *(void *)(v0 + 1624);
  uint64_t v123 = *(void *)(v0 + 1592);
  uint64_t v124 = *(void *)(v0 + 1488);
  uint64_t v125 = *(void *)(v0 + 1440);
  if (v119)
  {
    uint64_t v288 = *(void *)(v0 + 1592);
    uint64_t v126 = swift_slowAlloc();
    uint64_t v325 = swift_slowAlloc();
    *(_DWORD *)uint64_t v126 = 136315394;
    uint64_t v127 = MLHostTask.name.getter();
    *(void *)(v0 + 1008) = sub_10000E564(v127, v128, &v325);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v120(v124, v125);
    *(_WORD *)(v126 + 12) = 2080;
    uint64_t v129 = Duration.description.getter();
    *(void *)(v0 + 1016) = sub_10000E564(v129, v130, &v325);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v118, v311, "Task %s asked to terminate because of deferral after %s.", (uint8_t *)v126, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v121(v122, v288);
  }
  else
  {
    v120(*(void *)(v0 + 1488), *(void *)(v0 + 1440));

    v121(v122, v123);
  }
  uint64_t v166 = *(void *)(v0 + 1792);
  uint64_t v167 = *(void **)(v0 + 1776);
  static ContinuousClock.now.getter();
  uint64_t v168 = swift_allocObject();
  *(void *)(v0 + 1872) = v168;
  *(void *)(v168 + 16) = 0;
  *(void *)(v168 + 24) = 0;
  [v167 doStop];
  uint64_t v169 = *(void **)(v166 + 16);
  if (v169) {
    goto LABEL_38;
  }
  if (static Duration.< infix(_:_:)())
  {
    uint64_t v169 = *(void **)(*(void *)(v0 + 1792) + 16);
    if (!v169)
    {
      uint64_t v301 = *(void (**)(uint64_t, uint64_t))(v0 + 1832);
      uint64_t v205 = *(void (**)(uint64_t, void, uint64_t))(v0 + 1760);
      uint64_t v317 = *(void (**)(uint64_t, uint64_t, void))(v0 + 1704);
      id v278 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1688);
      uint64_t v206 = *(void *)(v0 + 1616);
      uint64_t v257 = *(void *)(v0 + 1592);
      uint64_t v261 = *(void *)(v0 + 1680);
      uint64_t v267 = *(void *)(v0 + 1480);
      *(void *)typed = *(void *)(v0 + 1440);
      uint64_t v207 = *(void *)(v0 + 1432);
      uint64_t v208 = *(void *)(v0 + 1416);
      uint64_t v209 = *(void *)(v0 + 1152);
      uint64_t v210 = MLHostTask.name.getter();
      uint64_t v212 = v211;
      v205(v207, enum case for TaskStatus.taskDeferred(_:), v208);
      sub_100018D90(v210, v212, v207);
      swift_bridgeObjectRelease();
      v301(v207, v208);
      v278(v206, v261, v257);
      v317(v267, v209, *(void *)typed);
      uint64_t v213 = Logger.logObject.getter();
      os_log_type_t v214 = static os_log_type_t.error.getter();
      BOOL v215 = os_log_type_enabled(v213, v214);
      uint64_t v216 = *(void (**)(uint64_t, uint64_t))(v0 + 1808);
      uint64_t v217 = *(void *)(v0 + 1616);
      uint64_t v218 = *(void *)(v0 + 1592);
      uint64_t v219 = *(void *)(v0 + 1480);
      uint64_t v220 = *(void *)(v0 + 1440);
      if (v215)
      {
        os_log_type_t v279 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
        uint64_t v324 = *(void *)(v0 + 1616);
        uint64_t v221 = (uint8_t *)swift_slowAlloc();
        uint64_t v325 = swift_slowAlloc();
        *(_DWORD *)uint64_t v221 = 136315138;
        uint64_t v222 = MLHostTask.name.getter();
        *(void *)(v0 + 976) = sub_10000E564(v222, v223, &v325);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        v279(v219, v220);
        _os_log_impl((void *)&_mh_execute_header, v213, v214, "Task %s has not responded to deferral. Marking task as deferred and terminating process.", v221, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v216(v324, v218);
      }
      else
      {
        (*(void (**)(void, void))(v0 + 1816))(*(void *)(v0 + 1480), *(void *)(v0 + 1440));

        v216(v217, v218);
      }
      id v236 = [*(id *)(v0 + 1720) processIdentifier];
      uint64_t v325 = 0;
      unint64_t v326 = 0xE000000000000000;
      _StringGuts.grow(_:)(38);
      v237._uint64_t countAndFlagsBits = 0x206B736154;
      v237._object = (void *)0xE500000000000000;
      String.append(_:)(v237);
      v238._uint64_t countAndFlagsBits = MLHostTask.name.getter();
      String.append(_:)(v238);
      swift_bridgeObjectRelease();
      v239._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
      v239._object = (void *)0x8000000100056230;
      String.append(_:)(v239);
      sub_100039C94((uint64_t)v236);
      swift_bridgeObjectRelease();
LABEL_41:
      (*(void (**)(void, void, void))(v0 + 1704))(*(void *)(v0 + 1472), *(void *)(v0 + 1152), *(void *)(v0 + 1440));
      swift_retain_n();
      uint64_t v190 = Logger.logObject.getter();
      os_log_type_t v191 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v190, v191))
      {
        id v277 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
        uint64_t v300 = *(void *)(v0 + 1792);
        uint64_t v192 = *(void *)(v0 + 1472);
        uint64_t v266 = *(void *)(v0 + 1440);
        uint64_t v193 = swift_slowAlloc();
        uint64_t v315 = (void *)swift_slowAlloc();
        uint64_t v325 = swift_slowAlloc();
        *(_DWORD *)uint64_t v193 = 136315650;
        uint64_t v194 = MLHostTask.name.getter();
        *(void *)(v0 + 936) = sub_10000E564(v194, v195, &v325);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_retain();
        swift_bridgeObjectRelease();
        v277(v192, v266);
        *(_WORD *)(v193 + 12) = 2080;
        swift_beginAccess();
        uint64_t v196 = Duration.description.getter();
        *(void *)(v0 + 952) = sub_10000E564(v196, v197, &v325);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release();
        swift_bridgeObjectRelease();
        *(_WORD *)(v193 + 22) = 2112;
        Swift::String v198 = *(void **)(v300 + 16);
        if (v198)
        {
          *(void *)(v0 + 968) = v198;
          id v199 = v198;
        }
        else
        {
          *(void *)(v0 + 960) = 0;
        }
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        uint64_t v229 = *(void (**)(uint64_t, uint64_t))(v0 + 1856);
        uint64_t v302 = *(void **)(v0 + 1784);
        uint64_t v308 = *(void *)(v0 + 1272);
        uint64_t v297 = *(void *)(v0 + 1256);
        uint64_t v230 = *(void *)(v0 + 1216);
        void *v315 = v198;
        swift_release_n();
        _os_log_impl((void *)&_mh_execute_header, v190, v191, "Task %s deferred after awaiting %s for its cooperative termination. TaskResult: %@", (uint8_t *)v193, 0x20u);
        sub_10000E508(&qword_100065290);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
        swift_unknownObjectRelease();

        v229(v297, v230);
        v229(v308, v230);
      }
      else
      {
        Swift::String v200 = *(void (**)(uint64_t, uint64_t))(v0 + 1856);
        uint64_t v201 = *(void **)(v0 + 1784);
        uint64_t v202 = *(void *)(v0 + 1472);
        uint64_t v203 = *(void *)(v0 + 1440);
        uint64_t v316 = *(void (**)(uint64_t, uint64_t))(v0 + 1816);
        uint64_t v323 = *(void *)(v0 + 1272);
        uint64_t v307 = *(void *)(v0 + 1256);
        uint64_t v204 = *(void *)(v0 + 1216);
        swift_release_n();
        swift_unknownObjectRelease();

        v316(v202, v203);
        v200(v307, v204);
        v200(v323, v204);
      }
      uint64_t v231 = *(void **)(v0 + 1720);
      uint64_t v232 = *(void *)(v0 + 1408);
      uint64_t v233 = *(void *)(v0 + 1400);
      uint64_t v318 = *(void *)(v0 + 1392);
      id v321 = *(id *)(*(void *)(v0 + 1792) + 16);
      id v234 = v321;
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      [v231 invalidate];

      _AppExtensionProcess.invalidate()();
      (*(void (**)(uint64_t, uint64_t))(v233 + 8))(v232, v318);
      goto LABEL_56;
    }
LABEL_38:
    uint64_t v313 = *(void (**)(uint64_t, uint64_t))(v0 + 1832);
    uint64_t v170 = *(void *)(v0 + 1752);
    uint64_t v171 = *(void *)(v0 + 1432);
    uint64_t v172 = *(void *)(v0 + 1424);
    uint64_t v173 = *(void *)(v0 + 1416);
    id v306 = v169;
    uint64_t v174 = MLHostTask.name.getter();
    uint64_t v176 = v175;
    uint64_t v177 = *(void (**)(uint64_t, uint64_t, uint64_t))(v172 + 16);
    v177(v171, v170, v173);
    sub_100018D90(v174, v176, v171);
    swift_bridgeObjectRelease();
    v313(v171, v173);
    uint64_t v178 = MLHostTask.name.getter();
    sub_100018964(v178, v179);
    swift_bridgeObjectRelease();
    MLHostResult.status.getter();
    uint64_t v180 = MLHostResultStatus.rawValue.getter();
    if (v180 != MLHostResultStatus.rawValue.getter())
    {
      id v314 = *(void (**)(uint64_t, uint64_t))(v0 + 1832);
      uint64_t v181 = *(void *)(v0 + 1752);
      uint64_t v182 = *(void *)(v0 + 1432);
      uint64_t v183 = *(void *)(v0 + 1416);
      id v184 = [*(id *)(v0 + 1720) processIdentifier];
      uint64_t v325 = 0;
      unint64_t v326 = 0xE000000000000000;
      _StringGuts.grow(_:)(38);
      unint64_t v185 = v326;
      *(void *)(v0 + 904) = v325;
      *(void *)(v0 + 912) = v185;
      v186._uint64_t countAndFlagsBits = 0x206B736154;
      v186._object = (void *)0xE500000000000000;
      String.append(_:)(v186);
      v187._uint64_t countAndFlagsBits = MLHostTask.name.getter();
      String.append(_:)(v187);
      swift_bridgeObjectRelease();
      v188._object = (void *)0x8000000100056250;
      v188._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
      String.append(_:)(v188);
      v177(v182, v181, v183);
      _print_unlocked<A, B>(_:_:)();
      v314(v182, v183);
      v189._uint64_t countAndFlagsBits = 46;
      v189._object = (void *)0xE100000000000000;
      String.append(_:)(v189);
      sub_100039C94((uint64_t)v184);
      swift_bridgeObjectRelease();
    }

    goto LABEL_41;
  }
  uint64_t v224 = *(void (**)(uint64_t, uint64_t))(v0 + 1856);
  uint64_t v225 = *(void *)(v0 + 1264);
  uint64_t v226 = *(void *)(v0 + 1216);
  ContinuousClock.init()();
  *(void *)(v0 + 856) = 500000000000000000;
  *(void *)(v0 + 864) = 0;
  *(_OWORD *)(v0 + 816) = 0u;
  *(unsigned char *)(v0 + 832) = 1;
  uint64_t v227 = sub_100049750(&qword_100065848, (void (*)(uint64_t))&type metadata accessor for ContinuousClock);
  dispatch thunk of Clock.now.getter();
  sub_100049750(&qword_100065850, (void (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant);
  dispatch thunk of InstantProtocol.advanced(by:)();
  v224(v225, v226);
  uint64_t v228 = (void *)swift_task_alloc();
  *(void *)(v0 + 1880) = v228;
  *uint64_t v228 = v0;
  v228[1] = sub_10003F2DC;
  uint64_t v162 = *(void *)(v0 + 1176);
  uint64_t v164 = v0 + 816;
  uint64_t v163 = *(void *)(v0 + 1248);
  uint64_t v165 = v227;
LABEL_50:
  return dispatch thunk of Clock.sleep(until:tolerance:)(v163, v164, v162, v165);
}

void sub_1000491FC(uint64_t a1, unint64_t a2)
{
  if (qword_100064F68 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100010174(v4, (uint64_t)qword_1000667D0);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    id v25 = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    sub_10000E564(a1, a2, (uint64_t *)&v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Deregistering task: %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v8 = self;
  uint64_t v9 = &OBJC_PROTOCOL____TtP20LighthouseBackground26MLHostExtensionXPCProtocol_;
  id v10 = [v8 sharedScheduler];
  NSString v11 = String._bridgeToObjectiveC()();
  id v25 = 0;
  unsigned int v12 = [v10 cancelTaskRequestWithIdentifier:v11 error:&v25];

  if (v12)
  {
    id v13 = v25;
  }
  else
  {
    id v14 = v25;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRetain();
    swift_errorRetain();
    os_log_type_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      unint64_t v24 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 138412290;
      swift_errorRetain();
      uint64_t v18 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v25 = v18;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v24 = v18;
      uint64_t v9 = &OBJC_PROTOCOL____TtP20LighthouseBackground26MLHostExtensionXPCProtocol_;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Task cancellation failed: %@", v17, 0xCu);
      sub_10000E508(&qword_100065290);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
  }
  id v19 = [v8 v9[44].opt_inst_meths:v24];
  NSString v20 = String._bridgeToObjectiveC()();
  [v19 deregisterTaskWithIdentifier:v20];

  swift_bridgeObjectRetain_n();
  uint64_t v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    id v25 = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v23 = 136315138;
    swift_bridgeObjectRetain();
    sub_10000E564(a1, a2, (uint64_t *)&v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Task deregistered successfully: %s", v23, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_100049710()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100049748()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_100049750(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100049798@<X0>(unsigned char *a1@<X8>)
{
  return sub_1000188C0(*(void *)(v1 + 24), *(void *)(v1 + 32), a1);
}

void *sub_1000497B8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

uint64_t sub_1000497FC()
{
  uint64_t v1 = type metadata accessor for MLHostTask();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v6, v5);
}

id sub_1000498E8(void *a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for MLHostTask() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = v1 + v4;
  uint64_t v7 = (uint64_t *)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v8 = *v7;
  uint64_t v9 = v7[1];

  return sub_1000294A4(a1, v5, v6, v8, v9);
}

uint64_t sub_10004998C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10004999C()
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v0 + 16) = 1;
  return result;
}

uint64_t sub_1000499DC()
{
  uint64_t v1 = type metadata accessor for MLHostTask();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, ((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 16, v5);
}

uint64_t sub_100049AF8(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for MLHostTask() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = v1[2];
  uint64_t v9 = v1[3];
  uint64_t v10 = v1[4];
  uint64_t v11 = *(void *)((char *)v1 + v6);
  uint64_t v12 = *(void *)((char *)v1 + v7);
  uint64_t v13 = (uint64_t)v1 + v5;
  uint64_t v14 = *(void *)((char *)v1 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8));
  os_log_type_t v15 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v15;
  *os_log_type_t v15 = v2;
  v15[1] = sub_100049C60;
  return sub_100029AEC(a1, v8, v9, v10, v13, v11, v12, v14);
}

uint64_t sub_100049C60()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100049D54(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_100049C60;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100065810 + dword_100065810);
  return v6(a1, v4);
}

unint64_t sub_100049E0C()
{
  unint64_t result = qword_100065830;
  if (!qword_100065830)
  {
    sub_100010330(255, &qword_100065828);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065830);
  }
  return result;
}

void sub_100049E78()
{
}

uint64_t sub_100049E88()
{
  uint64_t v1 = type metadata accessor for MLHostTask();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_100049F18()
{
}

void sub_100049F24(const char *a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for MLHostTask() - 8);
  sub_100027BA0(v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), a1);
}

uint64_t sub_100049F88()
{
  uint64_t v1 = type metadata accessor for MLHostTask();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_10004A02C(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for MLHostTask() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_100027DF8(a1, v4);
}

uint64_t sub_10004A0C8()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10004A104(uint64_t a1)
{
  return sub_10004A214(a1, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))sub_1000281FC);
}

uint64_t sub_10004A11C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10004A130()
{
  uint64_t v1 = type metadata accessor for MLHostTask();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_10004A1FC(uint64_t a1)
{
  return sub_10004A214(a1, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))sub_100028800);
}

uint64_t sub_10004A214(uint64_t a1, uint64_t (*a2)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for MLHostTask() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(v2 + v6);
  uint64_t v9 = *(void *)(v2 + v7);
  uint64_t v10 = *(void *)(v2 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8));

  return a2(a1, v2 + v5, v8, v9, v10);
}

uint64_t sub_10004A2DC()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10004A31C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10002FA10(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t sub_10004A338()
{
  return sub_10002F998();
}

uint64_t sub_10004A354()
{
  return sub_10002F938();
}

uint64_t sub_10004A370@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10002F524(a1, v2, a2);
}

uint64_t sub_10004A38C(uint64_t a1)
{
  return sub_10002F420(a1, v1);
}

void sub_10004A3A8()
{
}

uint64_t sub_10004A3C4@<X0>(uint64_t a1@<X8>)
{
  return sub_10002EB1C(v1, a1);
}

uint64_t sub_10004A3E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10002DFD4(a1, v2, a2);
}

uint64_t sub_10004A3FC@<X0>(uint64_t a1@<X8>)
{
  return sub_10002D2E0(v1, a1);
}

uint64_t sub_10004A418@<X0>(uint64_t a1@<X8>)
{
  return sub_10002D718(v1, a1);
}

uint64_t sub_10004A434()
{
  return ListExtensionsResponse.init(extensions:)();
}

uint64_t sub_10004A47C@<X0>(uint64_t a1@<X8>)
{
  return sub_10002DAC4(v1, a1);
}

unint64_t sub_10004A498()
{
  unint64_t result = qword_1000658C8;
  if (!qword_1000658C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000658C8);
  }
  return result;
}

uint64_t sub_10004A4EC()
{
  return sub_100014DF4(v0);
}

uint64_t sub_10004A508(uint64_t a1)
{
  return sub_100020280(a1, *(uint64_t (**)(void))(v1 + 16));
}

unint64_t sub_10004A524()
{
  unint64_t result = qword_1000652D0;
  if (!qword_1000652D0)
  {
    sub_1000102E8(&qword_1000652C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000652D0);
  }
  return result;
}

uint64_t sub_10004A580(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000E508(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10004A5E4(uint64_t a1, uint64_t a2)
{
  return a2;
}

ValueMetadata *type metadata accessor for ClientPermissions()
{
  return &type metadata for ClientPermissions;
}

unint64_t sub_10004A654()
{
  unint64_t result = qword_100065930;
  if (!qword_100065930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065930);
  }
  return result;
}

unint64_t sub_10004A6AC()
{
  unint64_t result = qword_100065938;
  if (!qword_100065938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065938);
  }
  return result;
}

unint64_t sub_10004A704()
{
  unint64_t result = qword_100065940;
  if (!qword_100065940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065940);
  }
  return result;
}

unint64_t sub_10004A75C()
{
  unint64_t result = qword_100065948;
  if (!qword_100065948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100065948);
  }
  return result;
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t JSONDecoder.init()()
{
  return JSONDecoder.init()();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return __DataStorage.init(bytes:length:copy:deallocator:offset:)();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return __DataStorage.init(bytes:length:)();
}

uint64_t __DataStorage._bytes.getter()
{
  return __DataStorage._bytes.getter();
}

uint64_t __DataStorage.init(length:)()
{
  return __DataStorage.init(length:)();
}

uint64_t __DataStorage._length.getter()
{
  return __DataStorage._length.getter();
}

uint64_t __DataStorage._offset.getter()
{
  return __DataStorage._offset.getter();
}

uint64_t type metadata accessor for __DataStorage()
{
  return type metadata accessor for __DataStorage();
}

uint64_t dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
}

uint64_t dispatch thunk of PropertyListDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
}

uint64_t PropertyListDecoder.init()()
{
  return PropertyListDecoder.init()();
}

uint64_t type metadata accessor for PropertyListDecoder()
{
  return type metadata accessor for PropertyListDecoder();
}

uint64_t dispatch thunk of PropertyListEncoder.outputFormat.setter()
{
  return dispatch thunk of PropertyListEncoder.outputFormat.setter();
}

uint64_t dispatch thunk of PropertyListEncoder.encode<A>(_:)()
{
  return dispatch thunk of PropertyListEncoder.encode<A>(_:)();
}

uint64_t PropertyListEncoder.init()()
{
  return PropertyListEncoder.init()();
}

uint64_t type metadata accessor for PropertyListEncoder()
{
  return type metadata accessor for PropertyListEncoder();
}

uint64_t _BridgedStoredNSError.code.getter()
{
  return _BridgedStoredNSError.code.getter();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::String __swiftcall URL.path(percentEncoded:)(Swift::Bool percentEncoded)
{
  uint64_t v1 = URL.path(percentEncoded:)(percentEncoded);
  result._object = v2;
  result._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t URL.init(filePath:directoryHint:relativeTo:)()
{
  return URL.init(filePath:directoryHint:relativeTo:)();
}

uint64_t URL.appending<A>(path:directoryHint:)()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return type metadata accessor for Data.RangeReference();
}

uint64_t Data._Representation.replaceSubrange(_:with:count:)()
{
  return Data._Representation.replaceSubrange(_:with:count:)();
}

uint64_t Data._Representation.append(contentsOf:)()
{
  return Data._Representation.append(contentsOf:)();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Data.write(to:options:)()
{
  return Data.write(to:options:)();
}

uint64_t Date.init(timeInterval:since:)()
{
  return Date.init(timeInterval:since:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date.> infix(_:_:)()
{
  return static Date.> infix(_:_:)();
}

uint64_t static Date.< infix(_:_:)()
{
  return static Date.< infix(_:_:)();
}

uint64_t Date.timeIntervalSince1970.getter()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t static Date.now.getter()
{
  return static Date.now.getter();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)UUID._bridgeToObjectiveC()();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t Calendar.startOfDay(for:)()
{
  return Calendar.startOfDay(for:)();
}

uint64_t static Calendar.current.getter()
{
  return static Calendar.current.getter();
}

uint64_t type metadata accessor for Calendar()
{
  return type metadata accessor for Calendar();
}

uint64_t _AppExtensionProcess.auditToken.getter()
{
  return _AppExtensionProcess.auditToken.getter();
}

Swift::Void __swiftcall _AppExtensionProcess.invalidate()()
{
}

uint64_t _AppExtensionProcess.Configuration.init(appExtension:onInterruption:)()
{
  return _AppExtensionProcess.Configuration.init(appExtension:onInterruption:)();
}

uint64_t _AppExtensionProcess.Configuration.instanceIdentifier.setter()
{
  return _AppExtensionProcess.Configuration.instanceIdentifier.setter();
}

uint64_t type metadata accessor for _AppExtensionProcess.Configuration()
{
  return type metadata accessor for _AppExtensionProcess.Configuration();
}

uint64_t _AppExtensionProcess.init(configuration:)()
{
  return _AppExtensionProcess.init(configuration:)();
}

NSXPCConnection __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> _AppExtensionProcess.makeXPCConnection()()
{
  return (NSXPCConnection)_AppExtensionProcess.makeXPCConnection()();
}

uint64_t type metadata accessor for _AppExtensionProcess()
{
  return type metadata accessor for _AppExtensionProcess();
}

uint64_t type metadata accessor for _AppExtensionIdentity()
{
  return type metadata accessor for _AppExtensionIdentity();
}

uint64_t _AppExtensionIdentity.init(_:)()
{
  return _AppExtensionIdentity.init(_:)();
}

uint64_t MLHostTask.taskFolder.getter()
{
  return MLHostTask.taskFolder.getter();
}

uint64_t MLHostTask.description.getter()
{
  return MLHostTask.description.getter();
}

uint64_t MLHostTask.init(taskDefinition:taskType:taskFolder:)()
{
  return MLHostTask.init(taskDefinition:taskType:taskFolder:)();
}

uint64_t MLHostTask.taskDefinition.getter()
{
  return MLHostTask.taskDefinition.getter();
}

uint64_t MLHostTask.bundleIdentifier.getter()
{
  return MLHostTask.bundleIdentifier.getter();
}

uint64_t MLHostTask.lastExecutionDate.setter()
{
  return MLHostTask.lastExecutionDate.setter();
}

uint64_t MLHostTask.name.getter()
{
  return MLHostTask.name.getter();
}

uint64_t MLHostTask.status.getter()
{
  return MLHostTask.status.getter();
}

uint64_t MLHostTask.status.setter()
{
  return MLHostTask.status.setter();
}

uint64_t MLHostTask.taskType.getter()
{
  return MLHostTask.taskType.getter();
}

uint64_t type metadata accessor for MLHostTask()
{
  return type metadata accessor for MLHostTask();
}

uint64_t TaskStatus.rawValue.getter()
{
  return TaskStatus.rawValue.getter();
}

uint64_t type metadata accessor for TaskStatus()
{
  return type metadata accessor for TaskStatus();
}

uint64_t TaskRequest.asSystemRequest<A>(request:)()
{
  return TaskRequest.asSystemRequest<A>(request:)();
}

uint64_t TaskRequest.getSystemTaskRequest(identifier:)()
{
  return TaskRequest.getSystemTaskRequest(identifier:)();
}

uint64_t TaskRequest.dependencies.getter()
{
  return TaskRequest.dependencies.getter();
}

uint64_t TaskRequest.relatedApplications.getter()
{
  return TaskRequest.relatedApplications.getter();
}

uint64_t TaskRequest.relatedApplications.setter()
{
  return TaskRequest.relatedApplications.setter();
}

uint64_t TaskRequest.producedResultIdentifiers.getter()
{
  return TaskRequest.producedResultIdentifiers.getter();
}

uint64_t type metadata accessor for TaskRequest()
{
  return type metadata accessor for TaskRequest();
}

uint64_t XPCListener.description.getter()
{
  return XPCListener.description.getter();
}

uint64_t XPCListener.__allocating_init(serviceName:queue:handler:)()
{
  return XPCListener.__allocating_init(serviceName:queue:handler:)();
}

uint64_t type metadata accessor for XPCListener()
{
  return type metadata accessor for XPCListener();
}

uint64_t MLHostConfig.apsEnvironment.getter()
{
  return MLHostConfig.apsEnvironment.getter();
}

uint64_t MLHostConfig.cloudContainer.getter()
{
  return MLHostConfig.cloudContainer.getter();
}

uint64_t MLHostConfig.cloudContainer.setter()
{
  return MLHostConfig.cloudContainer.setter();
}

uint64_t MLHostConfig.init(cloudEnvironment:cloudContainer:apsEnvironment:)()
{
  return MLHostConfig.init(cloudEnvironment:cloudContainer:apsEnvironment:)();
}

uint64_t MLHostConfig.cloudEnvironment.getter()
{
  return MLHostConfig.cloudEnvironment.getter();
}

uint64_t MLHostConfig.cloudEnvironment.setter()
{
  return MLHostConfig.cloudEnvironment.setter();
}

uint64_t type metadata accessor for MLHostConfig()
{
  return type metadata accessor for MLHostConfig();
}

uint64_t MLHostResult.errorString.getter()
{
  return MLHostResult.errorString.getter();
}

uint64_t MLHostResult.policy.getter()
{
  return MLHostResult.policy.getter();
}

uint64_t MLHostResult.init(status:policy:)()
{
  return MLHostResult.init(status:policy:)();
}

uint64_t MLHostResult.status.getter()
{
  return MLHostResult.status.getter();
}

uint64_t type metadata accessor for MLHostResult()
{
  return type metadata accessor for MLHostResult();
}

uint64_t type metadata accessor for PullMetadata()
{
  return type metadata accessor for PullMetadata();
}

uint64_t PushMetadata.creationDate.getter()
{
  return PushMetadata.creationDate.getter();
}

uint64_t PushMetadata.pushPriority.getter()
{
  return PushMetadata.pushPriority.getter();
}

uint64_t PushMetadata.init(topic:channelID:pushType:pushPriority:creationDate:)()
{
  return PushMetadata.init(topic:channelID:pushType:pushPriority:creationDate:)();
}

uint64_t PushMetadata.topic.getter()
{
  return PushMetadata.topic.getter();
}

uint64_t PushMetadata.pushType.getter()
{
  return PushMetadata.pushType.getter();
}

uint64_t PushMetadata.channelID.getter()
{
  return PushMetadata.channelID.getter();
}

uint64_t type metadata accessor for PushMetadata()
{
  return type metadata accessor for PushMetadata();
}

uint64_t type metadata accessor for SandboxError()
{
  return type metadata accessor for SandboxError();
}

uint64_t TaskMetadata.init(pushMetadata:pullMetadata:)()
{
  return TaskMetadata.init(pushMetadata:pullMetadata:)();
}

uint64_t TaskMetadata.pushMetadata.getter()
{
  return TaskMetadata.pushMetadata.getter();
}

uint64_t type metadata accessor for TaskMetadata()
{
  return type metadata accessor for TaskMetadata();
}

uint64_t type metadata accessor for OnDemandError()
{
  return type metadata accessor for OnDemandError();
}

uint64_t XPCConnection.__allocating_init(incomingConnection:)()
{
  return XPCConnection.__allocating_init(incomingConnection:)();
}

uint64_t dispatch thunk of XPCConnection.handle<A>(_:handler:)()
{
  return dispatch thunk of XPCConnection.handle<A>(_:handler:)();
}

uint64_t type metadata accessor for XPCConnection()
{
  return type metadata accessor for XPCConnection();
}

uint64_t AddTaskRequest.taskDefinition.getter()
{
  return AddTaskRequest.taskDefinition.getter();
}

uint64_t type metadata accessor for AddTaskRequest()
{
  return type metadata accessor for AddTaskRequest();
}

uint64_t GetTaskRequest.name.getter()
{
  return GetTaskRequest.name.getter();
}

uint64_t type metadata accessor for GetTaskRequest()
{
  return type metadata accessor for GetTaskRequest();
}

uint64_t type metadata accessor for OnDemandResult()
{
  return type metadata accessor for OnDemandResult();
}

uint64_t TaskDefinition.taskRequest.modify()
{
  return TaskDefinition.taskRequest.modify();
}

uint64_t TaskDefinition.taskRequest.getter()
{
  return TaskDefinition.taskRequest.getter();
}

uint64_t TaskDefinition.bundleIdentifier.getter()
{
  return TaskDefinition.bundleIdentifier.getter();
}

uint64_t TaskDefinition.name.getter()
{
  return TaskDefinition.name.getter();
}

uint64_t TaskDefinition.endDate.getter()
{
  return TaskDefinition.endDate.getter();
}

uint64_t TaskDefinition.startDate.getter()
{
  return TaskDefinition.startDate.getter();
}

uint64_t type metadata accessor for TaskDefinition()
{
  return type metadata accessor for TaskDefinition();
}

uint64_t type metadata accessor for XPCRemoteError()
{
  return type metadata accessor for XPCRemoteError();
}

uint64_t AddTaskResponse.init(result:error:)()
{
  return AddTaskResponse.init(result:error:)();
}

uint64_t ExtensionRecord.bundleIdentifier.getter()
{
  return ExtensionRecord.bundleIdentifier.getter();
}

uint64_t ExtensionRecord.init(name:bundleIdentifier:url:extensionPointIdentifier:)()
{
  return ExtensionRecord.init(name:bundleIdentifier:url:extensionPointIdentifier:)();
}

uint64_t type metadata accessor for ExtensionRecord()
{
  return type metadata accessor for ExtensionRecord();
}

uint64_t GetTaskResponse.init(task:)()
{
  return GetTaskResponse.init(task:)();
}

uint64_t type metadata accessor for ListTasksRequest()
{
  return type metadata accessor for ListTasksRequest();
}

uint64_t static SandboxExtension.issue(auditToken:url:readonly:)()
{
  return static SandboxExtension.issue(auditToken:url:readonly:)();
}

uint64_t SandboxExtension.token.getter()
{
  return SandboxExtension.token.getter();
}

uint64_t type metadata accessor for SandboxExtension()
{
  return type metadata accessor for SandboxExtension();
}

uint64_t type metadata accessor for CleanTasksRequest()
{
  return type metadata accessor for CleanTasksRequest();
}

uint64_t DynamicTaskSource.rawValue.getter()
{
  return DynamicTaskSource.rawValue.getter();
}

uint64_t type metadata accessor for DynamicTaskSource()
{
  return type metadata accessor for DynamicTaskSource();
}

uint64_t ListTasksResponse.init(tasks:)()
{
  return ListTasksResponse.init(tasks:)();
}

uint64_t ResetTasksRequest.reload.getter()
{
  return ResetTasksRequest.reload.getter();
}

uint64_t type metadata accessor for ResetTasksRequest()
{
  return type metadata accessor for ResetTasksRequest();
}

uint64_t CleanTasksResponse.init(tasks:)()
{
  return CleanTasksResponse.init(tasks:)();
}

uint64_t MLHostResultPolicy.rawValue.getter()
{
  return MLHostResultPolicy.rawValue.getter();
}

uint64_t MLHostResultStatus.rawValue.getter()
{
  return MLHostResultStatus.rawValue.getter();
}

uint64_t ResetTasksResponse.init(reloaded:)()
{
  return ResetTasksResponse.init(reloaded:)();
}

uint64_t ResetTasksResponse.reloaded.setter()
{
  return ResetTasksResponse.reloaded.setter();
}

uint64_t CoreAnalyticsEvents.rawValue.getter()
{
  return CoreAnalyticsEvents.rawValue.getter();
}

uint64_t type metadata accessor for CoreAnalyticsEvents()
{
  return type metadata accessor for CoreAnalyticsEvents();
}

uint64_t GetExtensionRequest.bundleIdentifier.getter()
{
  return GetExtensionRequest.bundleIdentifier.getter();
}

uint64_t type metadata accessor for GetExtensionRequest()
{
  return type metadata accessor for GetExtensionRequest();
}

uint64_t type metadata accessor for TaskValidationError()
{
  return type metadata accessor for TaskValidationError();
}

uint64_t GetExtensionResponse.init(extensionRecord:)()
{
  return GetExtensionResponse.init(extensionRecord:)();
}

uint64_t type metadata accessor for ListExtensionsRequest()
{
  return type metadata accessor for ListExtensionsRequest();
}

uint64_t dispatch thunk of XPCIncomingConnection.valueStringArray(forEntitlement:)()
{
  return dispatch thunk of XPCIncomingConnection.valueStringArray(forEntitlement:)();
}

uint64_t dispatch thunk of XPCIncomingConnection.pid.getter()
{
  return dispatch thunk of XPCIncomingConnection.pid.getter();
}

uint64_t dispatch thunk of XPCIncomingConnection.valueBool(forEntitlement:)()
{
  return dispatch thunk of XPCIncomingConnection.valueBool(forEntitlement:)();
}

uint64_t GetOnDemandTaskRequest.taskName.getter()
{
  return GetOnDemandTaskRequest.taskName.getter();
}

uint64_t type metadata accessor for GetOnDemandTaskRequest()
{
  return type metadata accessor for GetOnDemandTaskRequest();
}

uint64_t ListExtensionsResponse.init(extensions:)()
{
  return ListExtensionsResponse.init(extensions:)();
}

uint64_t MLHostExtensionContext.init(taskId:taskName:taskFolder:)()
{
  return MLHostExtensionContext.init(taskId:taskName:taskFolder:)();
}

uint64_t type metadata accessor for MLHostExtensionContext()
{
  return type metadata accessor for MLHostExtensionContext();
}

uint64_t type metadata accessor for MLHostSystemParameters()
{
  return type metadata accessor for MLHostSystemParameters();
}

uint64_t validateTaskDefinition(_:)()
{
  return validateTaskDefinition(_:)();
}

uint64_t ResetNotificationsRequest.reload.getter()
{
  return ResetNotificationsRequest.reload.getter();
}

uint64_t type metadata accessor for ResetNotificationsRequest()
{
  return type metadata accessor for ResetNotificationsRequest();
}

uint64_t type metadata accessor for GetHostConfigurationRequest()
{
  return type metadata accessor for GetHostConfigurationRequest();
}

uint64_t SetHostConfigurationRequest.config.getter()
{
  return SetHostConfigurationRequest.config.getter();
}

uint64_t type metadata accessor for SetHostConfigurationRequest()
{
  return type metadata accessor for SetHostConfigurationRequest();
}

uint64_t GetHostConfigurationResponse.init(config:)()
{
  return GetHostConfigurationResponse.init(config:)();
}

uint64_t SetHostConfigurationResponse.init(success:error:)()
{
  return SetHostConfigurationResponse.init(success:error:)();
}

uint64_t GetNotificationsConfigRequest.registeredOnly.getter()
{
  return GetNotificationsConfigRequest.registeredOnly.getter();
}

uint64_t type metadata accessor for GetNotificationsConfigRequest()
{
  return type metadata accessor for GetNotificationsConfigRequest();
}

uint64_t GetNotificationsConfigResponse.init(channelsByTopic:)()
{
  return GetNotificationsConfigResponse.init(channelsByTopic:)();
}

uint64_t GetOnDemandTaskRequestResponse.init(error:)()
{
  return GetOnDemandTaskRequestResponse.init(error:)();
}

uint64_t GetOnDemandTaskRequestResponse.init(result:)()
{
  return GetOnDemandTaskRequestResponse.init(result:)();
}

uint64_t type metadata accessor for TaskType()
{
  return type metadata accessor for TaskType();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t static DispatchQoS.background.getter()
{
  return static DispatchQoS.background.getter();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t dispatch thunk of HashFunction.update(bufferPointer:)()
{
  return dispatch thunk of HashFunction.update(bufferPointer:)();
}

uint64_t dispatch thunk of HashFunction.finalize()()
{
  return dispatch thunk of HashFunction.finalize()();
}

uint64_t dispatch thunk of HashFunction.init()()
{
  return dispatch thunk of HashFunction.init()();
}

uint64_t type metadata accessor for SHA256Digest()
{
  return type metadata accessor for SHA256Digest();
}

uint64_t type metadata accessor for SHA256()
{
  return type metadata accessor for SHA256();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.append<A>(contentsOf:)()
{
  return String.append<A>(contentsOf:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

Swift::Bool __swiftcall String.hasSuffix(_:)(Swift::String a1)
{
  return String.hasSuffix(_:)(a1._countAndFlagsBits, a1._object);
}

uint64_t String.init<A>(_:radix:uppercase:)()
{
  return String.init<A>(_:radix:uppercase:)();
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return dispatch thunk of Sequence.makeIterator()();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t Set.description.getter()
{
  return Set.description.getter();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)Int._bridgeToObjectiveC()();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

NSNumber __swiftcall NSNumber.init(integerLiteral:)(Swift::Int integerLiteral)
{
  return (NSNumber)NSNumber.init(integerLiteral:)(integerLiteral);
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t NSObject.hashValue.getter()
{
  return NSObject.hashValue.getter();
}

uint64_t NSString.init(stringLiteral:)()
{
  return NSString.init(stringLiteral:)();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.member(for:)()
{
  return __CocoaSet.member(for:)();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t static ContinuousClock.now.getter()
{
  return static ContinuousClock.now.getter();
}

uint64_t ContinuousClock.Instant.duration(to:)()
{
  return ContinuousClock.Instant.duration(to:)();
}

uint64_t type metadata accessor for ContinuousClock.Instant()
{
  return type metadata accessor for ContinuousClock.Instant();
}

uint64_t ContinuousClock.init()()
{
  return ContinuousClock.init()();
}

uint64_t type metadata accessor for ContinuousClock()
{
  return type metadata accessor for ContinuousClock();
}

uint64_t dispatch thunk of InstantProtocol.advanced(by:)()
{
  return dispatch thunk of InstantProtocol.advanced(by:)();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

Swift::Void __swiftcall _NativeDictionary.removeAll(isUnique:)(Swift::Bool isUnique)
{
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t type metadata accessor for KeyedDecodingContainer()
{
  return type metadata accessor for KeyedDecodingContainer();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t type metadata accessor for KeyedEncodingContainer()
{
  return type metadata accessor for KeyedEncodingContainer();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t dispatch thunk of Clock.now.getter()
{
  return dispatch thunk of Clock.now.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
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

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t Duration.description.getter()
{
  return Duration.description.getter();
}

uint64_t static Duration.< infix(_:_:)()
{
  return static Duration.< infix(_:_:)();
}

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_main(void)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_projectBox()
{
  return _swift_projectBox();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}