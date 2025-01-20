void sub_100002EE8(id a1)
{
  void *v1;

  v1 = (void *)qword_100026050;
  qword_100026050 = (uint64_t)&off_100021A58;
}

uint64_t sub_10000300C(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    uint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        LODWORD(v6) = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v6) = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 & 0x7FFF8) == 8)
    {
      uint64_t v12 = PBReaderReadString();
      v13 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v12;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

int main(int argc, const char **argv, const char **envp)
{
  if (qword_100025830 != -1) {
    swift_once();
  }
  sub_100013010();
  return 0;
}

void type metadata accessor for MAAssetState(uint64_t a1)
{
}

void type metadata accessor for MAPurgeResult(uint64_t a1)
{
}

void type metadata accessor for MAQueryResult(uint64_t a1)
{
}

void type metadata accessor for MADownloadResult(uint64_t a1)
{
}

BOOL sub_100003404(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100003418(uint64_t a1, uint64_t a2)
{
  return sub_100003994(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100003438(uint64_t a1, uint64_t a2)
{
  return sub_100003994(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_10000345C(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_1000034D4(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100003554@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void *sub_100003598@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_1000035A8(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_1000035B4(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_1000035C0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1000035D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void type metadata accessor for FileProtectionType(uint64_t a1)
{
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
}

void sub_100003624(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_10000366C(uint64_t a1)
{
  uint64_t v2 = sub_1000037B8(&qword_100025958, type metadata accessor for FileAttributeKey);
  uint64_t v3 = sub_1000037B8((unint64_t *)&unk_100025960, type metadata accessor for FileAttributeKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100003728()
{
  return sub_1000037B8(&qword_100025918, type metadata accessor for FileAttributeKey);
}

uint64_t sub_100003770()
{
  return sub_1000037B8(&qword_100025920, type metadata accessor for FileAttributeKey);
}

uint64_t sub_1000037B8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100003800@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100003848(uint64_t a1)
{
  uint64_t v2 = sub_1000037B8(&qword_100025948, type metadata accessor for FileProtectionType);
  uint64_t v3 = sub_1000037B8(&qword_100025950, type metadata accessor for FileProtectionType);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100003904()
{
  return sub_1000037B8(&qword_100025928, type metadata accessor for FileProtectionType);
}

uint64_t sub_10000394C()
{
  return sub_1000037B8(&qword_100025930, type metadata accessor for FileProtectionType);
}

uint64_t sub_100003994(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1000039D8()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100003A2C()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100003AA0()
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

uint64_t sub_100003B2C()
{
  return sub_1000037B8(&qword_100025938, type metadata accessor for FileProtectionType);
}

uint64_t sub_100003B74()
{
  return sub_1000037B8(&qword_100025940, type metadata accessor for FileAttributeKey);
}

uint64_t initializeBufferWithCopyOfBuffer for TZInfo(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for TZInfo()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TZInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_WORD *)(a1 + 56) = *(_WORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TZInfo(uint64_t a1, uint64_t a2)
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
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(unsigned char *)(a1 + 57) = *(unsigned char *)(a2 + 57);
  return a1;
}

__n128 initializeWithTake for TZInfo(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 42) = *(_OWORD *)(a2 + 42);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for TZInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(unsigned char *)(a1 + 57) = *(unsigned char *)(a2 + 57);
  return a1;
}

uint64_t getEnumTagSinglePayload for TZInfo(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 58)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TZInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 56) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 58) = 1;
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
    *(unsigned char *)(result + 58) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TZInfo()
{
  return &type metadata for TZInfo;
}

uint64_t sub_100003EB0()
{
  uint64_t v1 = *v0;
  uint64_t v3 = v0[2];
  unint64_t v2 = (void *)v0[3];
  if (*v0) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = v0[1] == 0xE000000000000000;
  }
  if (v4 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    BOOL v5 = !v3 && v2 == (void *)0xE000000000000000;
    if (v5 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
      return 0;
    }
  }
  if (!v3 && v2 == (void *)0xE000000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    swift_bridgeObjectRetain();
    v6._countAndFlagsBits = 46;
    v6._object = (void *)0xE100000000000000;
    String.append(_:)(v6);
    swift_bridgeObjectRetain();
    v7._countAndFlagsBits = v3;
    v7._object = v2;
    String.append(_:)(v7);
    swift_bridgeObjectRelease();
  }
  return v1;
}

id sub_100003FD0(uint64_t a1)
{
  unint64_t v2 = v1;
  URL._bridgeToObjectiveC()(__stack_chk_guard);
  BOOL v5 = v4;
  id v14 = 0;
  id v6 = [v2 initWithContentsOfURL:v4 error:&v14];

  id v7 = v14;
  if (v6)
  {
    uint64_t v8 = type metadata accessor for URL();
    v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
    id v10 = v7;
    v9(a1, v8);
  }
  else
  {
    id v11 = v14;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v12 = type metadata accessor for URL();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
  }
  return v6;
}

uint64_t sub_10000411C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_100004FFC((uint64_t *)&unk_100025AF0);
  ((void (*)(void))__chkstk_darwin)();
  BOOL v5 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v39 - v11;
  sub_100005040(a1, (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
  {
    uint64_t v44 = a1;
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v5, v6);
    URL.appendingPathComponent(_:)();
    id v24 = objc_allocWithZone((Class)NSDictionary);
    id v25 = sub_100003FD0((uint64_t)v10);
    *(void *)&long long v47 = 0x7372655661746144;
    *((void *)&v47 + 1) = 0xEB000000006E6F69;
    id v26 = [v25 __swift_objectForKeyedSubscript:_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()];
    swift_unknownObjectRelease();
    if (v26)
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v47 = 0u;
      long long v48 = 0u;
    }
    sub_1000050F8((uint64_t)&v47, (uint64_t)v49, (uint64_t *)&unk_100025CD0);
    uint64_t v43 = v7;
    if (v50)
    {
      if ((swift_dynamicCast() & 1) == 0) {
        goto LABEL_22;
      }
      uint64_t v14 = (uint64_t)v45;
      unint64_t v16 = v46;
      strcpy((char *)&v47, "BundleVersion");
      HIWORD(v47) = -4864;
      id v27 = [v25 __swift_objectForKeyedSubscript:_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()];
      swift_unknownObjectRelease();
      if (v27)
      {
        _bridgeAnyObjectToAny(_:)();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v47 = 0u;
        long long v48 = 0u;
      }
      sub_1000050F8((uint64_t)&v47, (uint64_t)v49, (uint64_t *)&unk_100025CD0);
      if (v50)
      {
        if (swift_dynamicCast())
        {
          v28 = v25;
          uint64_t v23 = (uint64_t)v45;
          unint64_t v22 = v46;
          *(void *)&long long v47 = 0xD000000000000012;
          *((void *)&v47 + 1) = 0x800000010001B630;
          uint64_t v29 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
          id v42 = v28;
          id v30 = [v28 __swift_objectForKeyedSubscript:v29];
          swift_unknownObjectRelease();
          if (v30)
          {
            _bridgeAnyObjectToAny(_:)();
            swift_unknownObjectRelease();
          }
          else
          {
            long long v47 = 0u;
            long long v48 = 0u;
          }
          sub_1000050F8((uint64_t)&v47, (uint64_t)v49, (uint64_t *)&unk_100025CD0);
          if (v50)
          {
            if (swift_dynamicCast())
            {
              uint64_t v41 = v6;
              uint64_t v17 = (uint64_t)v45;
              uint64_t v18 = v46;
              *(void *)&long long v47 = 0x6E6F5A7472656C41;
              *((void *)&v47 + 1) = 0xEA00000000007365;
              id v37 = [v42 __swift_objectForKeyedSubscript:_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()];
              swift_unknownObjectRelease();
              if (v37)
              {
                _bridgeAnyObjectToAny(_:)();
                swift_unknownObjectRelease();
              }
              else
              {
                long long v47 = 0u;
                long long v48 = 0u;
              }
              sub_1000050F8((uint64_t)&v47, (uint64_t)v49, (uint64_t *)&unk_100025CD0);
              if (v50)
              {
                sub_100004FFC(&qword_100025A00);
                if ((swift_dynamicCast() & 1) == 0)
                {
LABEL_45:
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  goto LABEL_46;
                }
                id v20 = v45;
                strcpy((char *)&v47, "ShouldAlertAll");
                HIBYTE(v47) = -18;
                id v40 = (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
                id v38 = [v42 __swift_objectForKeyedSubscript:v40];
                swift_unknownObjectRelease();
                if (v38)
                {
                  _bridgeAnyObjectToAny(_:)();
                  swift_unknownObjectRelease();
                }
                else
                {
                  long long v47 = 0u;
                  long long v48 = 0u;
                }
                sub_1000050F8((uint64_t)&v47, (uint64_t)v49, (uint64_t *)&unk_100025CD0);
                if (v50)
                {
                  sub_10000515C(0, &qword_100025A08);
                  if (swift_dynamicCast())
                  {
                    id v40 = v45;
                    unsigned __int16 v21 = (unsigned __int16)[v45 BOOLValue];

                    sub_1000055F8(v44, (uint64_t *)&unk_100025AF0);
                    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v12, v41);
                    goto LABEL_24;
                  }
                  swift_bridgeObjectRelease();
                  goto LABEL_45;
                }
                swift_bridgeObjectRelease();
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              sub_1000055F8((uint64_t)v49, (uint64_t *)&unk_100025CD0);
LABEL_46:
              uint64_t v6 = v41;
              id v25 = v42;
              goto LABEL_22;
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            id v25 = v42;
          }
          else
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_1000055F8((uint64_t)v49, (uint64_t *)&unk_100025CD0);
            id v25 = v42;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
        }
LABEL_22:
        static os_log_type_t.error.getter();
        sub_100004FFC(&qword_1000259D8);
        uint64_t v31 = swift_allocObject();
        *(_OWORD *)(v31 + 16) = xmmword_10001B160;
        *(void *)(v31 + 56) = sub_10000515C(0, &qword_1000259F0);
        *(void *)(v31 + 64) = sub_1000050A8(&qword_1000259F8, &qword_1000259F0);
        *(void *)(v31 + 32) = v25;
        id v32 = v25;
        URL._bridgeToObjectiveC()(v33);
        uint64_t v35 = v34;
        *(void *)(v31 + 96) = sub_10000515C(0, (unint64_t *)&unk_100025D50);
        *(void *)(v31 + 104) = sub_1000050A8(&qword_1000259E0, (unint64_t *)&unk_100025D50);
        *(void *)(v31 + 72) = v35;
        sub_10000515C(0, &qword_1000259D0);
        v36 = (void *)static OS_os_log.default.getter();
        os_log(_:dso:log:type:_:)();

        swift_bridgeObjectRelease();
        sub_1000055F8(v44, (uint64_t *)&unk_100025AF0);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v12, v6);
        uint64_t v14 = 0;
        unint64_t v16 = 0;
        uint64_t v23 = 0;
        unint64_t v22 = 0;
        uint64_t v17 = 0;
        uint64_t v18 = 0;
        goto LABEL_23;
      }
      swift_bridgeObjectRelease();
    }
    sub_1000055F8((uint64_t)v49, (uint64_t *)&unk_100025CD0);
    goto LABEL_22;
  }
  sub_1000055F8((uint64_t)v5, (uint64_t *)&unk_100025AF0);
  id v13 = [self timeZoneDataVersion];
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v16 = v15;

  if (qword_100025880 != -1) {
    swift_once();
  }
  uint64_t v17 = qword_100026B98;
  uint64_t v18 = qword_100026BA0;
  swift_bridgeObjectRetain();
  uint64_t result = sub_1000055F8(a1, (uint64_t *)&unk_100025AF0);
  if (!v18)
  {
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v14 = 0;
    unint64_t v16 = 0;
    uint64_t v23 = 0;
    unint64_t v22 = 0;
    uint64_t v17 = 0;
LABEL_23:
    id v20 = 0;
    unsigned __int16 v21 = 0;
    goto LABEL_24;
  }
  id v20 = 0;
  unsigned __int16 v21 = 256;
  unint64_t v22 = 0xE300000000000000;
  uint64_t v23 = 3157553;
LABEL_24:
  *(void *)a2 = v14;
  *(void *)(a2 + 8) = v16;
  *(void *)(a2 + 16) = v23;
  *(void *)(a2 + 24) = v22;
  *(void *)(a2 + 32) = v17;
  *(void *)(a2 + 40) = v18;
  *(void *)(a2 + 48) = v20;
  *(_WORD *)(a2 + 56) = v21;
  return result;
}

void sub_100004BE4(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  BOOL v5 = &v29[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v6 = sub_100004FFC((uint64_t *)&unk_100025AF0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = &v29[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  id v9 = [self defaultManager];
  if (qword_100025870 != -1) {
    swift_once();
  }
  NSString v10 = String._bridgeToObjectiveC()();
  id v30 = 0;
  id v11 = [v9 destinationOfSymbolicLinkAtPath:v10 error:&v30];

  id v12 = v30;
  if (!v11)
  {
    id v17 = v30;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease();
    static os_log_type_t.fault.getter();
    sub_10000515C(0, &qword_1000259D0);
    uint64_t v18 = (void *)static OS_os_log.default.getter();
LABEL_15:
    os_log(_:dso:log:type:_:)();

    id v20 = 0;
    uint64_t v21 = 0;
    uint64_t v23 = 0;
    uint64_t v25 = 0;
    char v27 = 0;
    char v26 = 0;
    unint64_t v19 = 0xE000000000000000;
    unint64_t v22 = 0xE000000000000000;
    unint64_t v24 = 0xE000000000000000;
    goto LABEL_16;
  }
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;
  id v16 = v12;

  if (qword_100025840 != -1) {
    swift_once();
  }
  if (v13 == qword_100026B18 && v15 == qword_100026B20 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v8, 1, 1, v2);
  }
  else
  {
    URL.init(fileURLWithPath:)();
    swift_bridgeObjectRelease();
    URL.deletingLastPathComponent()();
    (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v3 + 56))(v8, 0, 1, v2);
  }
  sub_10000411C((uint64_t)v8, (uint64_t)v29);
  sub_1000050F8((uint64_t)v29, (uint64_t)&v30, (uint64_t *)&unk_100025FF0);
  unint64_t v19 = v31;
  if (!v31)
  {
    static os_log_type_t.error.getter();
    sub_10000515C(0, &qword_1000259D0);
    uint64_t v18 = (void *)static OS_os_log.default.getter();
    goto LABEL_15;
  }
  id v20 = v30;
  uint64_t v21 = v32;
  unint64_t v22 = v33;
  uint64_t v23 = v34;
  unint64_t v24 = v35;
  uint64_t v25 = v36;
  char v26 = v38 & 1;
  char v27 = v37 & 1;
LABEL_16:
  *(void *)a1 = v20;
  *(void *)(a1 + 8) = v19;
  *(void *)(a1 + 16) = v21;
  *(void *)(a1 + 24) = v22;
  *(void *)(a1 + 32) = v23;
  *(void *)(a1 + 40) = v24;
  *(void *)(a1 + 48) = v25;
  *(unsigned char *)(a1 + 56) = v27;
  *(unsigned char *)(a1 + 57) = v26;
}

uint64_t sub_100004FFC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100005040(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004FFC((uint64_t *)&unk_100025AF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000050A8(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000515C(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000050F8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004FFC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000515C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100005198@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100004FFC((uint64_t *)&unk_100025AF0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = [self defaultManager];
  if (qword_100025858 != -1) {
    swift_once();
  }
  NSString v6 = String._bridgeToObjectiveC()();
  *(void *)&v19[0] = 0;
  id v7 = [v5 destinationOfSymbolicLinkAtPath:v6 error:v19];

  uint64_t v8 = *(void **)&v19[0];
  if (v7)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v9 = v8;

    URL.init(fileURLWithPath:)();
    swift_bridgeObjectRelease();
    uint64_t v10 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v4, 0, 1, v10);
    uint64_t result = sub_10000411C((uint64_t)v4, (uint64_t)v19);
    long long v12 = v19[0];
    long long v13 = v19[1];
    long long v14 = v19[2];
    uint64_t v15 = v20;
    __int16 v16 = v21;
  }
  else
  {
    id v17 = *(id *)&v19[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t result = swift_errorRelease();
    uint64_t v15 = 0;
    __int16 v16 = 0;
    long long v12 = 0uLL;
    long long v13 = 0uLL;
    long long v14 = 0uLL;
  }
  *(_OWORD *)a1 = v12;
  *(_OWORD *)(a1 + 16) = v13;
  *(_OWORD *)(a1 + 32) = v14;
  *(void *)(a1 + 48) = v15;
  *(_WORD *)(a1 + 56) = v16;
  return result;
}

__n128 sub_1000053C0@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v2 = sub_100004FFC(&qword_100025A10);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = (__n128 *)v19;
  sub_100004BE4((uint64_t)v19);
  sub_100005198((uint64_t)v20);
  sub_1000050F8((uint64_t)v20, (uint64_t)v21, (uint64_t *)&unk_100025FF0);
  if (*((void *)&v21[0] + 1))
  {
    v23[0] = v21[0];
    v23[1] = v21[1];
    v24[0] = v22[0];
    *(_OWORD *)((char *)v24 + 10) = *(_OWORD *)((char *)v22 + 10);
    uint64_t v6 = sub_100003EB0();
    uint64_t v8 = v7;
    uint64_t v9 = sub_100003EB0();
    v18[2] = v6;
    v18[3] = v8;
    v18[0] = v9;
    v18[1] = v10;
    uint64_t v11 = type metadata accessor for Locale();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v4, 1, 1, v11);
    sub_1000055A4();
    uint64_t v12 = StringProtocol.compare<A>(_:options:range:locale:)();
    sub_1000055F8((uint64_t)v4, &qword_100025A10);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v12 == -1)
    {
      sub_1000056F4((uint64_t)v19);
      id v5 = (__n128 *)v23;
    }
    else
    {
      sub_100005654(v20);
      id v5 = (__n128 *)v19;
    }
  }
  unsigned __int8 v13 = v5[3].n128_u8[9];
  unsigned __int8 v14 = v5[3].n128_u8[8];
  unint64_t v15 = v5[3].n128_u64[0];
  __n128 v17 = v5[1];
  __n128 result = v5[2];
  *a1 = *v5;
  a1[1] = v17;
  a1[2] = result;
  a1[3].n128_u64[0] = v15;
  a1[3].n128_u8[8] = v14;
  a1[3].n128_u8[9] = v13;
  return result;
}

unint64_t sub_1000055A4()
{
  unint64_t result = qword_100025CC0;
  if (!qword_100025CC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025CC0);
  }
  return result;
}

uint64_t sub_1000055F8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004FFC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *sub_100005654(uint64_t *a1)
{
  return a1;
}

uint64_t sub_100005690(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000056F4(uint64_t a1)
{
  return a1;
}

void *sub_10000574C(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v10 = &_swiftEmptyArrayStorage;
  sub_10000713C(0, v2, 0);
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32)
    {
      sub_1000091CC(i, (uint64_t)v9);
      sub_100004FFC((uint64_t *)&unk_100025CD0);
      sub_100004FFC(&qword_100025A38);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10000713C(0, v3[2] + 1, 1);
        uint64_t v3 = v10;
      }
      unint64_t v6 = v3[2];
      unint64_t v5 = v3[3];
      if (v6 >= v5 >> 1)
      {
        sub_10000713C((void *)(v5 > 1), v6 + 1, 1);
        uint64_t v3 = v10;
      }
      v3[2] = v6 + 1;
      v3[v6 + 4] = v8;
      if (!--v2) {
        return v3;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

uint64_t sub_10000589C(void *a1, void *a2, uint64_t a3, void (*a4)(uint64_t, void *), uint64_t a5)
{
  id v42 = a4;
  uint64_t v9 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v40 = &v35[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v41 = type metadata accessor for DispatchQoS();
  uint64_t v39 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  char v38 = &v35[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a1)
  {
    swift_errorRetain();
    int v36 = static os_log_type_t.error.getter();
    sub_100004FFC(&qword_1000259D8);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_10001B180;
    uint64_t v14 = _convertErrorToNSError(_:)();
    char v37 = a2;
    uint64_t v15 = v14;
    *(void *)(v13 + 56) = sub_10000515C(0, (unint64_t *)&unk_100025CF0);
    *(void *)(v13 + 64) = sub_1000050A8((unint64_t *)&qword_1000259E8, (unint64_t *)&unk_100025CF0);
    *(void *)(v13 + 32) = v15;
    sub_10000515C(0, &qword_1000259D0);
    __int16 v16 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    a2 = v37;
    swift_errorRelease();
  }
  if (a2)
  {
    char v37 = a1;
    aBlock[0] = 0;
    static Array._conditionallyBridgeFromObjectiveC(_:result:)();
    if (aBlock[0])
    {
      swift_beginAccess();
      uint64_t v17 = swift_bridgeObjectRetain();
      sub_100006F4C(v17);
      swift_bridgeObjectRelease();
    }
    else
    {
      id v21 = a2;
      int v36 = static os_log_type_t.fault.getter();
      sub_100004FFC(&qword_1000259D8);
      uint64_t v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = xmmword_10001B180;
      *(void *)(v22 + 56) = sub_10000515C(0, &qword_100025A50);
      *(void *)(v22 + 64) = sub_1000050A8(&qword_100025A58, &qword_100025A50);
      *(void *)(v22 + 32) = v21;
      sub_10000515C(0, &qword_1000259D0);
      id v23 = v21;
      unint64_t v24 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:type:_:)();

      swift_bridgeObjectRelease();
    }
    static os_log_type_t.debug.getter();
    sub_100004FFC(&qword_1000259D8);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_10001B180;
    swift_beginAccess();
    uint64_t v26 = *(void *)(a3 + 16);
    uint64_t v27 = a3;
    *(void *)(v25 + 56) = sub_100004FFC(&qword_100025A60);
    *(void *)(v25 + 64) = sub_1000092E0((unint64_t *)&qword_100025A68, &qword_100025A60);
    *(void *)(v25 + 32) = v26;
    sub_10000515C(0, &qword_1000259D0);
    swift_bridgeObjectRetain();
    v28 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    sub_10000515C(0, (unint64_t *)&unk_100025C00);
    uint64_t v29 = (void *)static OS_dispatch_queue.main.getter();
    id v30 = (void *)swift_allocObject();
    v30[2] = v42;
    v30[3] = a5;
    unint64_t v31 = v37;
    v30[4] = v27;
    v30[5] = v31;
    aBlock[4] = sub_10000927C;
    aBlock[5] = v30;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000127B0;
    aBlock[3] = &unk_100020F20;
    uint64_t v32 = _Block_copy(aBlock);
    swift_errorRetain();
    swift_retain();
    swift_retain();
    swift_release();
    unint64_t v33 = v38;
    static DispatchQoS.unspecified.getter();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_100009288();
    sub_100004FFC((uint64_t *)&unk_100025C10);
    sub_1000092E0((unint64_t *)&qword_100025FE0, (uint64_t *)&unk_100025C10);
    uint64_t v34 = v40;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v32);

    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v34, v9);
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v39 + 8))(v33, v41);
  }
  else
  {
    static os_log_type_t.error.getter();
    sub_10000515C(0, &qword_1000259D0);
    uint64_t v18 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();

    swift_beginAccess();
    uint64_t v19 = swift_bridgeObjectRetain();
    v42(v19, a1);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100005F5C(void (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_beginAccess();
  uint64_t v6 = swift_bridgeObjectRetain();
  a1(v6, a4);
  return swift_bridgeObjectRelease();
}

void sub_100005FD8(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_100006064(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), uint64_t a5)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a4;
  *(void *)(v10 + 24) = a5;
  if (*(unsigned char *)(a1 + 56))
  {
    swift_retain_n();
    sub_100006328(1, a4, a5);
    swift_release();
    return swift_release();
  }
  else
  {
    sub_1000050F8(a1 + 48, (uint64_t)v21, &qword_100025A18);
    uint64_t v11 = sub_1000050F8((uint64_t)v21, (uint64_t)&v22, &qword_100025A18);
    uint64_t v12 = v22;
    if (v22)
    {
      __chkstk_darwin(v11);
      v20[2] = a2;
      v20[3] = a3;
      swift_retain_n();
      sub_100008F10((uint64_t)v21);
      uint64_t v13 = sub_100008D98(v12, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100006B34, (uint64_t)v20);
      sub_100008F3C((uint64_t)v21);
      uint64_t v14 = sub_100006B3C(v13);
      swift_release();
      uint64_t v15 = sub_100008F68((uint64_t)v14);
      swift_bridgeObjectRelease();
      static os_log_type_t.debug.getter();
      sub_100004FFC(&qword_1000259D8);
      uint64_t v16 = swift_allocObject();
      *(_OWORD *)(v16 + 16) = xmmword_10001B180;
      *(void *)(v16 + 56) = sub_100004FFC(&qword_100025A20);
      *(void *)(v16 + 64) = sub_1000092E0(&qword_100025A28, &qword_100025A20);
      *(void *)(v16 + 32) = v15;
      sub_10000515C(0, &qword_1000259D0);
      swift_bridgeObjectRetain();
      uint64_t v17 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:type:_:)();
      swift_bridgeObjectRelease();

      sub_1000084D0((uint64_t (*)(BOOL))sub_100006AC0, v10, v15);
      swift_release();
      swift_release();
      return swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v19 = swift_retain_n();
      ((void (*)(uint64_t))a4)(v19);
      swift_release();
      return swift_release();
    }
  }
}

void sub_100006328(char a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Locale();
  __chkstk_darwin(v10 - 8);
  uint64_t v11 = type metadata accessor for String.LocalizationValue();
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  if (a1)
  {
    uint64_t v44 = v6;
    uint64_t v45 = a3;
    unint64_t v46 = a2;
    id v42 = [objc_allocWithZone((Class)UNMutableNotificationContent) init];
    aBlock = 0;
    unint64_t v48 = 0xE000000000000000;
    _StringGuts.grow(_:)(51);
    v13._countAndFlagsBits = 0xD00000000000002ALL;
    v13._object = (void *)0x800000010001B810;
    String.append(_:)(v13);
    v14._object = (void *)0x800000010001B840;
    v14._countAndFlagsBits = 0xD00000000000001DLL;
    String.append(_:)(v14);
    v15._countAndFlagsBits = 0x656C646E75622ELL;
    v15._object = (void *)0xE700000000000000;
    String.append(_:)(v15);
    id v16 = objc_allocWithZone((Class)NSBundle);
    NSString v17 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v18 = [v16 initWithPath:v17];

    if (!v18)
    {
      static os_log_type_t.fault.getter();
      sub_10000515C(0, &qword_1000259D0);
      uint64_t v19 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:type:_:)();
    }
    uint64_t v20 = (__CFString *)String._bridgeToObjectiveC()();
    id v21 = (__CFString *)String._bridgeToObjectiveC()();
    uint64_t v22 = (void **)CFPreferencesCopyValue(v20, kCFPreferencesAnyApplication, v21, kCFPreferencesAnyHost);

    if (v22)
    {
      aBlock = v22;
      sub_100004FFC(&qword_100025A60);
      swift_dynamicCast();
    }
    uint64_t v43 = v7;
    uint64_t v41 = v9;
    if (v18)
    {
      id v23 = v18;
      Class isa = (Class)[v23 localizations];
      if (!isa)
      {
        static Array._unconditionallyBridgeFromObjectiveC(_:)();
        Class isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
      }
      uint64_t v25 = self;
      Class v26 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      id v27 = [v25 preferredLocalizationsFromArray:isa forPreferences:v26];

      uint64_t v28 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
      if (*(void *)(v28 + 16)) {
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    String.LocalizationValue.init(stringLiteral:)();
    id v29 = v18;
    swift_bridgeObjectRetain();
    static Locale.current.getter();
    String.init(localized:table:bundle:localization:locale:comment:)();
    NSString v30 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v31 = v42;
    [v42 setTitle:v30];

    String.LocalizationValue.init(stringLiteral:)();
    id v32 = v29;
    static Locale.current.getter();
    String.init(localized:table:bundle:localization:locale:comment:)();
    NSString v33 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v31 setBody:v33];

    NSString v34 = String._bridgeToObjectiveC()();
    [v31 setCategoryIdentifier:v34];

    [v31 setShouldSuppressDefaultAction:1];
    unint64_t v35 = v41;
    UUID.init()();
    UUID.uuidString.getter();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v35, v44);
    id v36 = v31;
    NSString v37 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v38 = [self requestWithIdentifier:v37 content:v36 trigger:0];

    if (qword_100025830 != -1) {
      swift_once();
    }
    uint64_t v39 = *(void **)(qword_100026B00 + OBJC_IVAR____TtC3tzd6Daemon_notificationCenter);
    v51 = sub_100016634;
    uint64_t v52 = 0;
    aBlock = _NSConcreteStackBlock;
    unint64_t v48 = 1107296256;
    v49 = sub_100006AC8;
    uint64_t v50 = &unk_100020F48;
    id v40 = _Block_copy(&aBlock);
    [v39 addNotificationRequest:v38 withCompletionHandler:v40];
    _Block_release(v40);
    v46();
  }
  else
  {
    ((void (*)(uint64_t))a2)(v12);
  }
}

uint64_t sub_100006A88()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100006AC0(char a1)
{
  sub_100006328(a1, *(void (**)(void))(v1 + 16), *(void *)(v1 + 24));
}

void sub_100006AC8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

BOOL sub_100006B34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000189D4(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24));
}

char *sub_100006B3C(uint64_t a1)
{
  uint64_t v22 = a1 + 64;
  uint64_t v2 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  unint64_t v4 = v3 & *(void *)(a1 + 64);
  int64_t v5 = (unint64_t)(v2 + 63) >> 6;
  uint64_t result = (char *)swift_bridgeObjectRetain();
  int64_t v7 = 0;
  uint64_t v8 = (char *)&_swiftEmptyArrayStorage;
  while (1)
  {
    if (v4)
    {
      unint64_t v9 = __clz(__rbit64(v4));
      v4 &= v4 - 1;
      unint64_t v10 = v9 | (v7 << 6);
    }
    else
    {
      int64_t v11 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        goto LABEL_42;
      }
      if (v11 >= v5)
      {
LABEL_37:
        swift_release();
        return v8;
      }
      unint64_t v12 = *(void *)(v22 + 8 * v11);
      ++v7;
      if (!v12)
      {
        int64_t v7 = v11 + 1;
        if (v11 + 1 >= v5) {
          goto LABEL_37;
        }
        unint64_t v12 = *(void *)(v22 + 8 * v7);
        if (!v12)
        {
          int64_t v7 = v11 + 2;
          if (v11 + 2 >= v5) {
            goto LABEL_37;
          }
          unint64_t v12 = *(void *)(v22 + 8 * v7);
          if (!v12)
          {
            int64_t v7 = v11 + 3;
            if (v11 + 3 >= v5) {
              goto LABEL_37;
            }
            unint64_t v12 = *(void *)(v22 + 8 * v7);
            if (!v12)
            {
              int64_t v13 = v11 + 4;
              if (v13 >= v5) {
                goto LABEL_37;
              }
              unint64_t v12 = *(void *)(v22 + 8 * v13);
              if (!v12)
              {
                while (1)
                {
                  int64_t v7 = v13 + 1;
                  if (__OFADD__(v13, 1)) {
                    goto LABEL_43;
                  }
                  if (v7 >= v5) {
                    goto LABEL_37;
                  }
                  unint64_t v12 = *(void *)(v22 + 8 * v7);
                  ++v13;
                  if (v12) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v7 = v13;
            }
          }
        }
      }
LABEL_23:
      unint64_t v4 = (v12 - 1) & v12;
      unint64_t v10 = __clz(__rbit64(v12)) + (v7 << 6);
    }
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8 * v10);
    uint64_t v15 = *(void *)(v14 + 16);
    int64_t v16 = *((void *)v8 + 2);
    int64_t v17 = v16 + v15;
    if (__OFADD__(v16, v15)) {
      break;
    }
    swift_bridgeObjectRetain();
    uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
    if (result && v17 <= *((void *)v8 + 3) >> 1)
    {
      if (!*(void *)(v14 + 16)) {
        goto LABEL_4;
      }
    }
    else
    {
      if (v16 <= v17) {
        int64_t v18 = v16 + v15;
      }
      else {
        int64_t v18 = v16;
      }
      uint64_t result = sub_100007038(result, v18, 1, v8);
      uint64_t v8 = result;
      if (!*(void *)(v14 + 16))
      {
LABEL_4:
        if (v15) {
          goto LABEL_39;
        }
        goto LABEL_5;
      }
    }
    if ((*((void *)v8 + 3) >> 1) - *((void *)v8 + 2) < v15) {
      goto LABEL_40;
    }
    uint64_t result = (char *)swift_arrayInitWithCopy();
    if (v15)
    {
      uint64_t v19 = *((void *)v8 + 2);
      BOOL v20 = __OFADD__(v19, v15);
      uint64_t v21 = v19 + v15;
      if (v20) {
        goto LABEL_41;
      }
      *((void *)v8 + 2) = v21;
    }
LABEL_5:
    uint64_t result = (char *)swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
  return result;
}

uint64_t sub_100006D80(unint64_t a1)
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
  uint64_t *v1 = v6;
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
    uint64_t *v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_100008300(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
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

uint64_t sub_100006F4C(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= *(void *)(v3 + 24) >> 1)
  {
    if (*(void *)(v6 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v10 = v4 + v2;
  }
  else {
    int64_t v10 = v4;
  }
  uint64_t result = (uint64_t)sub_100007038((char *)result, v10, 1, (char *)v3);
  uint64_t v3 = result;
  if (!*(void *)(v6 + 16))
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  if ((*(void *)(v3 + 24) >> 1) - *(void *)(v3 + 16) < v2)
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
    uint64_t *v1 = v3;
    return result;
  }
  uint64_t v7 = *(void *)(v3 + 16);
  BOOL v8 = __OFADD__(v7, v2);
  uint64_t v9 = v7 + v2;
  if (!v8)
  {
    *(void *)(v3 + 16) = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

char *sub_100007038(char *result, int64_t a2, char a3, char *a4)
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
    sub_100004FFC(&qword_100025F60);
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
  BOOL v13 = v10 + 32;
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

void *sub_10000713C(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000719C(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_10000715C(void *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000072C0(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_10000717C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000074D0(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

void *sub_10000719C(void *result, int64_t a2, char a3, void *a4)
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
    sub_100004FFC(&qword_100025A40);
    int64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    int64_t v10 = &_swiftEmptyArrayStorage;
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    sub_100004FFC(&qword_100025A38);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

void *sub_1000072C0(void *result, int64_t a2, char a3, void *a4)
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
    sub_100004FFC(&qword_100025A48);
    int64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 5);
  }
  else
  {
    int64_t v10 = &_swiftEmptyArrayStorage;
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[4 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 32 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    sub_100004FFC((uint64_t *)&unk_100025CD0);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_1000073E4(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100004FFC((uint64_t *)&unk_100025A90);
    int64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    int64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  BOOL v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_release();
  return v10;
}

char *sub_1000074D0(char *result, int64_t a2, char a3, char *a4)
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
    sub_100004FFC(&qword_100025F60);
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
    int64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  BOOL v13 = v10 + 32;
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
  swift_release();
  return v10;
}

uint64_t sub_1000075D4(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
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
      int64_t v18 = (void *)(v11 + 16 * v10);
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
  sub_100007A64(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_100007784()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100004FFC(&qword_100025A70);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    NSString v30 = (void *)(v2 + 56);
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
                  *NSString v30 = -1 << v29;
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
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
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
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

Swift::Int sub_100007A64(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
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
    sub_100007784();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_100007C00();
      goto LABEL_22;
    }
    sub_100007DB4();
  }
  uint64_t v11 = *v4;
  Hasher.init(_seed:)();
  String.hash(into:)();
  uint64_t result = Hasher._finalize()();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
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
          uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
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
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
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

void *sub_100007C00()
{
  uint64_t v1 = v0;
  sub_100004FFC(&qword_100025A70);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

uint64_t sub_100007DB4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100004FFC(&qword_100025A70);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
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
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
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
    void *v13 = v20;
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

uint64_t sub_100008064(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return (uint64_t)&_swiftEmptyDictionarySingleton;
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  sub_100004FFC(&qword_100025A78);
  uint64_t result = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v9 = result;
  id v32 = a1;
  uint64_t v33 = a2;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 64;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
    }
    else
    {
      uint64_t v15 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_40;
      }
      if (v15 >= v33) {
        return v9;
      }
      unint64_t v16 = v32[v15];
      ++v11;
      if (!v16)
      {
        uint64_t v11 = v15 + 1;
        if (v15 + 1 >= v33) {
          return v9;
        }
        unint64_t v16 = v32[v11];
        if (!v16)
        {
          uint64_t v11 = v15 + 2;
          if (v15 + 2 >= v33) {
            return v9;
          }
          unint64_t v16 = v32[v11];
          if (!v16)
          {
            uint64_t v17 = v15 + 3;
            if (v17 >= v33) {
              return v9;
            }
            unint64_t v16 = v32[v17];
            if (!v16)
            {
              while (1)
              {
                uint64_t v11 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_41;
                }
                if (v11 >= v33) {
                  return v9;
                }
                unint64_t v16 = v32[v11];
                ++v17;
                if (v16) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v11 = v17;
          }
        }
      }
LABEL_24:
      unint64_t v10 = (v16 - 1) & v16;
      unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
    }
    int64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v14);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    uint64_t v21 = *(void *)(*(void *)(v4 + 56) + 8 * v14);
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v22 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v25 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v28 = v24 == v27;
        if (v24 == v27) {
          unint64_t v24 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v24);
      }
      while (v29 == -1);
      unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
    }
    *(void *)(v12 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    NSString v30 = (void *)(*(void *)(v9 + 48) + 16 * v25);
    *NSString v30 = v20;
    v30[1] = v19;
    *(void *)(*(void *)(v9 + 56) + 8 * v25) = v21;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    if (!v5) {
      return v9;
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

uint64_t sub_100008300(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
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
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1000092E0(&qword_100025A88, &qword_100025A80);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            sub_100004FFC(&qword_100025A80);
            unint64_t v10 = sub_1000121A4(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void (**)(id *), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_10000515C(0, (unint64_t *)&unk_100025CF0);
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_1000084D0(uint64_t (*a1)(BOOL), uint64_t a2, uint64_t a3)
{
  unint64_t v6 = (void *)swift_allocObject();
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = a3;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = _swiftEmptyArrayStorage;
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v8 = (__CFString *)String._bridgeToObjectiveC()();
  uint64_t v9 = (__CFString *)String._bridgeToObjectiveC()();
  unint64_t v10 = (__CFString *)String._bridgeToObjectiveC()();
  CFPropertyListRef v11 = CFPreferencesCopyValue(v8, v9, v10, kCFPreferencesAnyHost);

  if (v11)
  {
    v49 = a1;
    *(void *)&long long aBlock = v11;
    swift_unknownObjectRetain();
    sub_100004FFC(&qword_100025A30);
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_31;
    }
    uint64_t v45 = a3;
    uint64_t v46 = a2;
    id v12 = v50;
    int64_t v13 = v50[2];
    uint64_t v47 = v7;
    unint64_t v48 = v6;
    if (v13)
    {
      sub_10000715C(0, v13, 0);
      for (uint64_t i = 0; i != v13; ++i)
      {
        uint64_t v15 = v12[i + 4];
        if (*(void *)(v15 + 16))
        {
          swift_bridgeObjectRetain();
          unint64_t v16 = sub_1000168EC(2037672291, 0xE400000000000000);
          if (v17)
          {
            sub_10000916C(*(void *)(v15 + 56) + 32 * v16, (uint64_t)&aBlock);
          }
          else
          {
            long long aBlock = 0u;
            long long v53 = 0u;
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          long long aBlock = 0u;
          long long v53 = 0u;
        }
        uint64_t v50 = _swiftEmptyArrayStorage;
        unint64_t v19 = _swiftEmptyArrayStorage[2];
        unint64_t v18 = _swiftEmptyArrayStorage[3];
        if (v19 >= v18 >> 1) {
          sub_10000715C((void *)(v18 > 1), v19 + 1, 1);
        }
        _swiftEmptyArrayStorage[2] = v19 + 1;
        sub_1000050F8((uint64_t)&aBlock, (uint64_t)&_swiftEmptyArrayStorage[4 * v19 + 4], (uint64_t *)&unk_100025CD0);
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    a3 = v45;
    uint64_t v21 = sub_10000574C((uint64_t)_swiftEmptyArrayStorage);
    swift_bridgeObjectRelease();
    uint64_t v7 = v47;
    if (v21)
    {
      uint64_t v22 = v21[2];
      if (v22)
      {
        swift_bridgeObjectRetain();
        uint64_t v23 = 0;
        unint64_t v24 = (char *)_swiftEmptyArrayStorage;
        do
        {
          uint64_t v26 = v21[v23 + 4];
          uint64_t v27 = *(void *)(v26 + 16);
          swift_bridgeObjectRetain();
          if (!v27
            || (unint64_t v28 = sub_1000168EC(0x656E6F5A656D6974, 0xE800000000000000), (v29 & 1) == 0)
            || (sub_10000916C(*(void *)(v26 + 56) + 32 * v28, (uint64_t)&aBlock), (swift_dynamicCast() & 1) == 0))
          {
            uint64_t v50 = 0;
            uint64_t v51 = 0;
          }
          swift_bridgeObjectRelease();
          if (v51)
          {
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              unint64_t v24 = sub_100007038(0, *((void *)v24 + 2) + 1, 1, v24);
            }
            unint64_t v31 = *((void *)v24 + 2);
            unint64_t v30 = *((void *)v24 + 3);
            if (v31 >= v30 >> 1) {
              unint64_t v24 = sub_100007038((char *)(v30 > 1), v31 + 1, 1, v24);
            }
            *((void *)v24 + 2) = v31 + 1;
            unint64_t v25 = &v24[16 * v31];
            *((void *)v25 + 4) = v50;
            *((void *)v25 + 5) = v51;
          }
          ++v23;
        }
        while (v22 != v23);
        swift_bridgeObjectRelease();
        a3 = v45;
      }
      swift_bridgeObjectRelease();
      uint64_t v33 = swift_bridgeObjectRetain();
      sub_100006F4C(v33);
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      uint64_t v7 = v47;
      unint64_t v6 = v48;
      a2 = v46;
    }
    else
    {
LABEL_31:
      static os_log_type_t.error.getter();
      sub_10000515C(0, &qword_1000259D0);
      id v32 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:type:_:)();

      swift_unknownObjectRelease();
    }
    a1 = v49;
  }
  else
  {
    static os_log_type_t.info.getter();
    sub_10000515C(0, &qword_1000259D0);
    uint64_t v20 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
  }
  id v34 = objc_allocWithZone((Class)NSBundle);
  NSString v35 = String._bridgeToObjectiveC()();
  id v36 = [v34 initWithPath:v35];

  if (v36)
  {
    NSString v37 = String._bridgeToObjectiveC()();
    id v38 = [v36 classNamed:v37];

    if (v38)
    {
      swift_getObjCClassMetadata();
      id v39 = [(id)swift_getObjCClassFromMetadata() timeZonesForCurrentClockWidgets];
      id v40 = (void *)swift_allocObject();
      v40[2] = v39;
      v40[3] = v7;
      v40[4] = sub_100009088;
      v40[5] = v6;
      v54 = sub_100009114;
      v55 = v40;
      *(void *)&long long aBlock = _NSConcreteStackBlock;
      *((void *)&aBlock + 1) = 1107296256;
      *(void *)&long long v53 = sub_100005FD8;
      *((void *)&v53 + 1) = &unk_100020ED0;
      uint64_t v41 = _Block_copy(&aBlock);
      id v42 = v39;
      swift_retain();
      swift_retain();
      swift_release();
      id v43 = [v42 addCompletionBlock:v41];
      _Block_release(v41);
      swift_release();
      swift_release();

      return;
    }
  }
  uint64_t v44 = (char *)swift_bridgeObjectRetain();
  sub_100018AF4(v44, 0, a1, a2, a3);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

uint64_t sub_100008B94(uint64_t result, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v22 = (unint64_t *)result;
  uint64_t v23 = 0;
  int64_t v6 = 0;
  uint64_t v7 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a3 + 64);
  int64_t v25 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      unint64_t v10 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v11 = v10 | (v6 << 6);
      goto LABEL_5;
    }
    int64_t v17 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v17 >= v25) {
      return sub_100008064(v22, a2, v23, a3);
    }
    unint64_t v18 = *(void *)(v24 + 8 * v17);
    ++v6;
    if (!v18)
    {
      int64_t v6 = v17 + 1;
      if (v17 + 1 >= v25) {
        return sub_100008064(v22, a2, v23, a3);
      }
      unint64_t v18 = *(void *)(v24 + 8 * v6);
      if (!v18)
      {
        int64_t v6 = v17 + 2;
        if (v17 + 2 >= v25) {
          return sub_100008064(v22, a2, v23, a3);
        }
        unint64_t v18 = *(void *)(v24 + 8 * v6);
        if (!v18) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v11 = __clz(__rbit64(v18)) + (v6 << 6);
LABEL_5:
    id v12 = (uint64_t *)(*(void *)(a3 + 48) + 16 * v11);
    uint64_t v13 = *v12;
    uint64_t v14 = v12[1];
    uint64_t v15 = *(void *)(*(void *)(a3 + 56) + 8 * v11);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char v16 = a4(v13, v14, v15);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v16)
    {
      *(unint64_t *)((char *)v22 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      if (__OFADD__(v23++, 1))
      {
        __break(1u);
        return sub_100008064(v22, a2, v23, a3);
      }
    }
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v25) {
    return sub_100008064(v22, a2, v23, a3);
  }
  unint64_t v18 = *(void *)(v24 + 8 * v19);
  if (v18)
  {
    int64_t v6 = v19;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v6 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v6 >= v25) {
      return sub_100008064(v22, a2, v23, a3);
    }
    unint64_t v18 = *(void *)(v24 + 8 * v6);
    ++v19;
    if (v18) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_100008D98(uint64_t isStackAllocationSafe, uint64_t (*a2)(uint64_t, uint64_t, uint64_t), uint64_t a3)
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
    uint64_t v10 = sub_100008B94((uint64_t)&v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v8, v6, a2);
    if (v3) {
      swift_willThrow();
    }
    else {
      return v10;
    }
  }
  else
  {
    unint64_t v11 = (void *)swift_slowAlloc();
    bzero(v11, v9);
    a3 = sub_100008B94((uint64_t)v11, v8, v6, a2);
    swift_slowDealloc();
  }
  return a3;
}

uint64_t sub_100008F10(uint64_t a1)
{
  return a1;
}

uint64_t sub_100008F3C(uint64_t a1)
{
  return a1;
}

uint64_t sub_100008F68(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_1000075D4(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_100009000(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100009048()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100009088(char *a1, uint64_t a2)
{
  return sub_100018AF4(a1, a2, *(uint64_t (**)(BOOL))(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_100009094()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000090CC()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100009114(void *a1, void *a2)
{
  return sub_10000589C(a2, a1, *(void *)(v2 + 24), *(void (**)(uint64_t, void *))(v2 + 32), *(void *)(v2 + 40));
}

uint64_t sub_100009154(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100009164()
{
  return swift_release();
}

uint64_t sub_10000916C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000091CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004FFC((uint64_t *)&unk_100025CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009234()
{
  swift_release();
  swift_release();
  swift_errorRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000927C()
{
  return sub_100005F5C(*(void (**)(uint64_t, uint64_t))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

unint64_t sub_100009288()
{
  unint64_t result = qword_100025FD0;
  if (!qword_100025FD0)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025FD0);
  }
  return result;
}

uint64_t sub_1000092E0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100009000(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_100009334()
{
  id result = (id)MobileGestalt_get_current_device();
  qword_100026AE0 = (uint64_t)result;
  return result;
}

id sub_10000935C()
{
  id result = [v0 attributes];
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    strcpy((char *)&v8, "BundleVersion");
    HIWORD(v8) = -4864;
    AnyHashable.init<A>(_:)();
    if (*(void *)(v3 + 16) && (unint64_t v4 = sub_1000168A8((uint64_t)v7), (v5 & 1) != 0))
    {
      sub_10000916C(*(void *)(v3 + 56) + 32 * v4, (uint64_t)&v8);
    }
    else
    {
      long long v8 = 0u;
      long long v9 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_10000FA9C((uint64_t)v7);
    if (*((void *)&v9 + 1))
    {
      if (swift_dynamicCast()) {
        return (id)v6;
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_1000055F8((uint64_t)&v8, (uint64_t *)&unk_100025CD0);
      return 0;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1000094A4()
{
  id v0 = [objc_allocWithZone((Class)MADownloadOptions) init];
  [v0 setDiscretionary:0];
  id result = [v0 setAllowsCellularAccess:1];
  qword_100026AE8 = (uint64_t)v0;
  return result;
}

uint64_t sub_100009508(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = v3;
  uint64_t v39 = type metadata accessor for NSFastEnumerationIterator();
  uint64_t v38 = *(void *)(v39 - 8);
  __chkstk_darwin(v39);
  uint64_t v44 = (char *)v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = type metadata accessor for URL();
  uint64_t v40 = *(void *)(v43 - 8);
  uint64_t v9 = __chkstk_darwin(v43);
  unint64_t v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v45 = (char *)v37 - v12;
  type metadata accessor for FileAttributeKey(0);
  sub_100010470(&qword_100025958, type metadata accessor for FileAttributeKey);
  uint64_t v42 = a1;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  NSString v14 = String._bridgeToObjectiveC()();
  *(void *)&v46[0] = 0;
  unsigned int v15 = [v4 setAttributes:isa ofItemAtPath:v14 error:v46];

  if (!v15)
  {
    NSString v25 = *(id *)&v46[0];
    _convertNSErrorToError(_:)();
LABEL_11:

    return swift_willThrow();
  }
  id v16 = *(id *)&v46[0];
  NSString v17 = String._bridgeToObjectiveC()();
  id v18 = [v4 enumeratorAtPath:v17];

  if (!v18)
  {
    static os_log_type_t.fault.getter();
    sub_100004FFC(&qword_1000259D8);
    uint64_t v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_10001B180;
    *(void *)(v26 + 56) = &type metadata for String;
    *(void *)(v26 + 64) = sub_10000EDF8();
    *(void *)(v26 + 32) = a2;
    *(void *)(v26 + 40) = a3;
    sub_10000515C(0, &qword_1000259D0);
    swift_bridgeObjectRetain();
    uint64_t v27 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v28 = objc_allocWithZone((Class)NSError);
    NSString v25 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v28 initWithDomain:v25 code:256 userInfo:0];
    goto LABEL_11;
  }
  URL.init(fileURLWithPath:)();
  v37[0] = v18;
  NSEnumerator.makeIterator()();
  NSFastEnumerationIterator.next()();
  if (v51)
  {
    uint64_t v41 = (uint64_t (**)(char *, uint64_t))(v40 + 8);
    while (1)
    {
      sub_100010460(&v50, v49);
      sub_10000916C((uint64_t)v49, (uint64_t)v46);
      if (!swift_dynamicCast()) {
        break;
      }
      Class v19 = Dictionary._bridgeToObjectiveC()().super.isa;
      URL.appendingPathComponent(_:)();
      swift_bridgeObjectRelease();
      URL.path.getter();
      uint64_t v20 = *v41;
      (*v41)(v11, v43);
      NSString v21 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      *(void *)&v46[0] = 0;
      unsigned __int8 v22 = [v4 setAttributes:v19 ofItemAtPath:v21 error:v46];

      id v23 = *(id *)&v46[0];
      if ((v22 & 1) == 0)
      {
        unint64_t v30 = v23;
        _convertNSErrorToError(_:)();

        swift_willThrow();
        sub_100010510((uint64_t)v49);
        (*(void (**)(char *, uint64_t))(v38 + 8))(v44, v39);
        return v20(v45, v43);
      }
      sub_100010510((uint64_t)v49);
      NSFastEnumerationIterator.next()();
      if (!v51) {
        goto LABEL_8;
      }
    }
    static os_log_type_t.fault.getter();
    sub_100004FFC(&qword_1000259D8);
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_10001B180;
    sub_10000916C((uint64_t)v49, (uint64_t)&v48);
    sub_100004FFC(&qword_100026040);
    if (swift_dynamicCast())
    {
      sub_100010404(v46, v29 + 32);
    }
    else
    {
      uint64_t v47 = 0;
      memset(v46, 0, sizeof(v46));
      *(void *)(v29 + 56) = &type metadata for String;
      *(void *)(v29 + 64) = sub_10000EDF8();
      *(void *)(v29 + 32) = 0x6E776F6E6B6E7528;
      *(void *)(v29 + 40) = 0xE900000000000029;
      sub_1000055F8((uint64_t)v46, (uint64_t *)&unk_100025D20);
    }
    uint64_t v31 = v39;
    uint64_t v32 = v38;
    id v33 = v37[0];
    sub_10000515C(0, &qword_1000259D0);
    id v34 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v35 = objc_allocWithZone((Class)NSError);
    NSString v36 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v35 initWithDomain:v36 code:256 userInfo:0];

    swift_willThrow();
    sub_100010510((uint64_t)v49);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v44, v31);
    return (*v41)(v45, v43);
  }
  else
  {
LABEL_8:

    (*(void (**)(char *, uint64_t))(v38 + 8))(v44, v39);
    return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v45, v43);
  }
}

uint64_t MADownloadResult.debugDescription.getter(uint64_t a1)
{
  return sub_100009DCC(a1, 20, 0xD000000000000011, 0x800000010001B9D0, (uint64_t (*)(uint64_t))&MAStringForMADownloadResult);
}

uint64_t sub_100009D44()
{
  return MADownloadResult.debugDescription.getter(*v0);
}

uint64_t MAQueryResult.debugDescription.getter(uint64_t a1)
{
  return sub_100009DCC(a1, 17, 0x527972657551414DLL, 0xEE0028746C757365, (uint64_t (*)(uint64_t))&MAStringForMAQueryResult);
}

uint64_t sub_100009D88()
{
  return MAQueryResult.debugDescription.getter(*v0);
}

uint64_t MAPurgeResult.debugDescription.getter(uint64_t a1)
{
  return sub_100009DCC(a1, 17, 0x526567727550414DLL, 0xEE0028746C757365, (uint64_t (*)(uint64_t))&MAStringForMAPurgeResult);
}

uint64_t sub_100009DCC(uint64_t a1, Swift::Int a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  _StringGuts.grow(_:)(a2);
  swift_bridgeObjectRelease();
  id v8 = (id)a5(a1);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v10 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v12 = v13;
  }
  v14._countAndFlagsBits = v10;
  v14._object = v12;
  String.append(_:)(v14);
  swift_bridgeObjectRelease();
  v15._countAndFlagsBits = 41;
  v15._object = (void *)0xE100000000000000;
  String.append(_:)(v15);
  return a3;
}

uint64_t sub_100009EB0()
{
  return MAPurgeResult.debugDescription.getter(*v0);
}

uint64_t sub_100009EB8()
{
  if (qword_100025810 != -1) {
    swift_once();
  }
  uint64_t result = qword_100026AE0;
  if (qword_100026AE0) {
    uint64_t result = MobileGestalt_get_internalBuild();
  }
  byte_100026AF0 = result;
  return result;
}

void *sub_100009F14()
{
  if (qword_100025820 != -1) {
    swift_once();
  }
  if (byte_100026AF0 == 1)
  {
    id v0 = dlopen("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport", 256);
    uint64_t result = dlsym(v0, "SimulateCrash");
  }
  else
  {
    uint64_t result = 0;
  }
  off_100026AF8 = result;
  return result;
}

void sub_100009F94(id a1)
{
  if (qword_100025820 != -1) {
    swift_once();
  }
  if (byte_100026AF0 == 1)
  {
    if (qword_100025828 != -1) {
      swift_once();
    }
    uint64_t v2 = (void (*)(uint64_t, void, NSString))off_100026AF8;
    if (off_100026AF8)
    {
      id v3 = [a1 userInfo];
      uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

      if (*(void *)(v4 + 16) && (unint64_t v5 = sub_1000168EC(0x6150656C6946534ELL, 0xEA00000000006874), (v6 & 1) != 0))
      {
        sub_10000916C(*(void *)(v4 + 56) + 32 * v5, (uint64_t)&v42);
        swift_bridgeObjectRelease();
        if (*((void *)&v43 + 1))
        {
          sub_10000515C(0, &qword_100025F90);
          if (swift_dynamicCast())
          {
            id v7 = [v41 stringByDeletingLastPathComponent];
            NSString v8 = v7;
            NSString v9 = v7;
            if (!v7)
            {
              static String._unconditionallyBridgeFromObjectiveC(_:)();
              NSString v9 = String._bridgeToObjectiveC()();
              swift_bridgeObjectRelease();
              static String._unconditionallyBridgeFromObjectiveC(_:)();
              NSString v8 = String._bridgeToObjectiveC()();
              swift_bridgeObjectRelease();
            }
            uint64_t v10 = self;
            id v11 = v7;
            id v12 = [v10 defaultManager];
            *(void *)&long long v42 = 0;
            id v13 = [v12 contentsOfDirectoryAtPath:v9 error:&v42];

            Swift::String v14 = (void *)v42;
            if (v13)
            {
              uint64_t v40 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
              id v15 = v14;
            }
            else
            {
              id v16 = (id)v42;
              _convertNSErrorToError(_:)();

              swift_willThrow();
              swift_errorRelease();
              uint64_t v40 = 0;
            }
            id v17 = [v10 defaultManager:v40];
            *(void *)&long long v42 = 0;
            id v18 = [v17 attributesOfItemAtPath:v41 error:&v42];

            Class v19 = (void *)v42;
            if (v18)
            {
              type metadata accessor for FileAttributeKey(0);
              sub_100010470(&qword_100025958, type metadata accessor for FileAttributeKey);
              static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
              id v20 = v19;
            }
            else
            {
              id v21 = (id)v42;
              _convertNSErrorToError(_:)();

              swift_willThrow();
              swift_errorRelease();
            }
            id v22 = [v10 defaultManager];
            *(void *)&long long v42 = 0;
            id v23 = [v22 attributesOfItemAtPath:v8 error:&v42];

            uint64_t v24 = (void *)v42;
            if (v23)
            {
              type metadata accessor for FileAttributeKey(0);
              sub_100010470(&qword_100025958, type metadata accessor for FileAttributeKey);
              static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
              id v25 = v24;
            }
            else
            {
              id v26 = (id)v42;
              _convertNSErrorToError(_:)();

              swift_willThrow();
              swift_errorRelease();
            }
            uint64_t v27 = getpid();
            *(void *)&long long v42 = 0;
            *((void *)&v42 + 1) = 0xE000000000000000;
            _StringGuts.grow(_:)(82);
            id v28 = [a1 description];
            uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            uint64_t v31 = v30;

            v32._countAndFlagsBits = v29;
            v32._object = v31;
            String.append(_:)(v32);
            swift_bridgeObjectRelease();
            v33._countAndFlagsBits = 0xD00000000000001BLL;
            v33._object = (void *)0x800000010001C0B0;
            String.append(_:)(v33);
            sub_100004FFC(&qword_100025D30);
            v34._countAndFlagsBits = String.init<A>(describing:)();
            String.append(_:)(v34);
            swift_bridgeObjectRelease();
            v35._countAndFlagsBits = 0xD00000000000001ALL;
            v35._object = (void *)0x800000010001C0D0;
            String.append(_:)(v35);
            v36._countAndFlagsBits = String.init<A>(describing:)();
            String.append(_:)(v36);
            swift_bridgeObjectRelease();
            v37._object = (void *)0x800000010001C0F0;
            v37._countAndFlagsBits = 0xD000000000000015;
            String.append(_:)(v37);
            sub_100004FFC(&qword_100025D38);
            v38._countAndFlagsBits = String.init<A>(describing:)();
            String.append(_:)(v38);
            swift_bridgeObjectRelease();
            NSString v39 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease();
            v2(v27, 0, v39);
          }
          return;
        }
      }
      else
      {
        long long v42 = 0u;
        long long v43 = 0u;
        swift_bridgeObjectRelease();
      }
      sub_1000055F8((uint64_t)&v42, (uint64_t *)&unk_100025CD0);
    }
  }
}

uint64_t sub_10000A5B4()
{
  return 1;
}

Swift::Int sub_10000A5BC()
{
  return Hasher._finalize()();
}

void sub_10000A600()
{
}

Swift::Int sub_10000A628()
{
  return Hasher._finalize()();
}

uint64_t sub_10000A688()
{
  uint64_t v0 = String.utf8CString.getter();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v0 = (uint64_t)sub_10000F1AC(v0);
  }
  if (!mkdtemp((char *)(v0 + 32)))
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = (int)errno.getter();
    id v13 = objc_allocWithZone((Class)NSError);
    NSString v14 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v13 initWithDomain:v14 code:v12 userInfo:0];

LABEL_9:
    swift_willThrow();
    return swift_release();
  }
  String.init(validatingUTF8:)();
  if (!v1)
  {
    sub_100010560();
    swift_allocError();
    goto LABEL_9;
  }
  swift_release();
  id v2 = [self defaultManager];
  sub_100004FFC(&qword_100025CE0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10001B180;
  *(void *)(inited + 32) = NSFileProtectionKey;
  type metadata accessor for FileProtectionType(0);
  *(void *)(inited + 64) = v4;
  *(void *)(inited + 40) = NSFileProtectionNone;
  unint64_t v5 = NSFileProtectionKey;
  char v6 = NSFileProtectionNone;
  sub_100012A20(inited);
  type metadata accessor for FileAttributeKey(0);
  sub_100010470(&qword_100025958, type metadata accessor for FileAttributeKey);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  NSString v8 = String._bridgeToObjectiveC()();
  id v19 = 0;
  unsigned __int8 v9 = [v2 setAttributes:isa ofItemAtPath:v8 error:&v19];

  if (v9)
  {
    id v10 = v19;
    URL.init(fileURLWithPath:)();
    return swift_bridgeObjectRelease();
  }
  else
  {
    id v15 = v19;
    swift_bridgeObjectRelease();
    _convertNSErrorToError(_:)();

    swift_willThrow();
    static os_log_type_t.fault.getter();
    sub_100004FFC(&qword_1000259D8);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_10001B180;
    uint64_t v17 = _convertErrorToNSError(_:)();
    *(void *)(v16 + 56) = sub_10000515C(0, (unint64_t *)&unk_100025F80);
    *(void *)(v16 + 64) = sub_1000050A8((unint64_t *)&qword_100025D00, (unint64_t *)&unk_100025F80);
    *(void *)(v16 + 32) = v17;
    sub_10000515C(0, &qword_1000259D0);
    id v18 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    return swift_willThrow();
  }
}

id sub_10000AA40()
{
  if (*(unsigned char *)(v0 + 48) != 1) {
    return *(id *)(v0 + 40);
  }
  id result = [*(id *)(v0 + 16) state];
  *(void *)(v0 + 40) = result;
  *(unsigned char *)(v0 + 48) = 0;
  return result;
}

uint64_t sub_10000AA84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100004FFC((uint64_t *)&unk_100025AF0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = &v19[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_100004FFC(&qword_100025CC8);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  id v10 = &v19[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v8);
  uint64_t v12 = &v19[-v11];
  uint64_t v13 = v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___localURL;
  swift_beginAccess();
  sub_10001066C(v13, (uint64_t)v12, &qword_100025CC8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v4 + 48))(v12, 1, v3) != 1) {
    return sub_1000050F8((uint64_t)v12, a1, (uint64_t *)&unk_100025AF0);
  }
  sub_1000055F8((uint64_t)v12, &qword_100025CC8);
  id v14 = [*(id *)(v1 + 16) getLocalFileUrl];
  if (v14)
  {
    id v15 = v14;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v16 = type metadata accessor for URL();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v6, 0, 1, v16);
  }
  else
  {
    uint64_t v18 = type metadata accessor for URL();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v6, 1, 1, v18);
  }
  sub_1000050F8((uint64_t)v6, a1, (uint64_t *)&unk_100025AF0);
  sub_10001066C(a1, (uint64_t)v10, (uint64_t *)&unk_100025AF0);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v4 + 56))(v10, 0, 1, v3);
  swift_beginAccess();
  sub_1000106D0((uint64_t)v10, v13);
  return swift_endAccess();
}

uint64_t sub_10000AD40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info;
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info);
  uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 8);
  uint64_t v18 = v5;
  uint64_t v19 = v4;
  uint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 16);
  uint64_t v7 = *(void *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 24);
  uint64_t v8 = *(void *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 32);
  uint64_t v9 = *(void *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 40);
  uint64_t v10 = *(void *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 48);
  __int16 v11 = *(_WORD *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 56);
  if (v5 == 1)
  {
    uint64_t v17 = *(void *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info);
    sub_10000AEC8(v1, (uint64_t)&v20);
    uint64_t v12 = v21;
    uint64_t v13 = v22;
    uint64_t v7 = v23;
    uint64_t v8 = v24;
    uint64_t v9 = v25;
    uint64_t v10 = v26;
    __int16 v11 = v27;
    uint64_t v16 = *(void *)v3;
    uint64_t v15 = *(void *)(v3 + 8);
    uint64_t v18 = v21;
    uint64_t v19 = v20;
    *(void *)uint64_t v3 = v20;
    *(void *)(v3 + 8) = v12;
    uint64_t v6 = v13;
    *(void *)(v3 + 16) = v13;
    *(void *)(v3 + 24) = v7;
    *(void *)(v3 + 32) = v8;
    *(void *)(v3 + 40) = v9;
    *(void *)(v3 + 48) = v10;
    *(_WORD *)(v3 + 56) = v11;
    sub_1000105B4((uint64_t)&v20, (void (*)(void, void, void, void, void, void, void, void))sub_1000105F8);
    sub_10000FA8C(v16, v15);
    uint64_t v4 = v17;
  }
  uint64_t result = sub_10001065C(v4, v5);
  *(void *)a1 = v19;
  *(void *)(a1 + 8) = v18;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  *(_WORD *)(a1 + 56) = v11;
  return result;
}

void sub_10000AEC8(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100004FFC((uint64_t *)&unk_100025AF0);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v41 - v8;
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_10000AA40() != (id)2) {
    goto LABEL_4;
  }
  sub_10000AA84((uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v9, v10);
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v7, v13, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    sub_10000411C((uint64_t)v7, (uint64_t)v49);
    uint64_t v23 = v49[0];
    uint64_t v44 = v49[1];
    uint64_t v48 = v49[2];
    uint64_t v18 = v49[3];
    uint64_t v47 = v11;
    uint64_t v19 = v49[4];
    uint64_t v20 = v49[5];
    uint64_t v21 = v49[6];
    __int16 v22 = v50;
    sub_1000050F8((uint64_t)v49, (uint64_t)&v51, (uint64_t *)&unk_100025FF0);
    uint64_t v24 = v13;
    uint64_t v16 = *((void *)&v51 + 1);
    uint64_t v46 = v24;
    if (*((void *)&v51 + 1))
    {
      long long v54 = v51;
      long long v55 = v52;
      v56[0] = *(_OWORD *)v53;
      *(_OWORD *)((char *)v56 + 10) = *(_OWORD *)&v53[10];
      uint64_t v45 = v51;
      uint64_t v18 = *((void *)&v52 + 1);
      uint64_t v48 = v52;
      uint64_t v20 = *(void *)&v53[8];
      uint64_t v19 = *(void *)v53;
      uint64_t v21 = *(void *)&v53[16];
      LODWORD(v44) = v53[24];
      int v43 = v53[25];
      uint64_t v25 = sub_100003EB0();
      uint64_t v27 = *(void *)(a1 + 24);
      if (v25 == v27 && v26 == *(void *)(a1 + 32))
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v42 = *(void *)(a1 + 32);
        char v32 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if ((v32 & 1) == 0)
        {
          static os_log_type_t.error.getter();
          sub_100004FFC(&qword_1000259D8);
          uint64_t v34 = swift_allocObject();
          *(_OWORD *)(v34 + 16) = xmmword_10001B160;
          *(void *)(v34 + 56) = &type metadata for String;
          unint64_t v35 = sub_10000EDF8();
          *(void *)(v34 + 64) = v35;
          uint64_t v36 = v42;
          *(void *)(v34 + 32) = v27;
          *(void *)(v34 + 40) = v36;
          swift_bridgeObjectRetain();
          uint64_t v37 = sub_100003EB0();
          uint64_t v39 = v38;
          sub_1000105B4((uint64_t)v49, (void (*)(void, void, void, void, void, void, void, void))sub_100005690);
          *(void *)(v34 + 96) = &type metadata for String;
          *(void *)(v34 + 104) = v35;
          *(void *)(v34 + 72) = v37;
          *(void *)(v34 + 80) = v39;
          sub_10000515C(0, &qword_1000259D0);
          uint64_t v40 = (void *)static OS_os_log.default.getter();
          os_log(_:dso:log:type:_:)();
          swift_bridgeObjectRelease();

          (*(void (**)(char *, uint64_t))(v47 + 8))(v46, v10);
          goto LABEL_4;
        }
      }
      (*(void (**)(char *, uint64_t))(v47 + 8))(v46, v10);
      if (v43) {
        __int16 v33 = 256;
      }
      else {
        __int16 v33 = 0;
      }
      __int16 v22 = v33 | v44;
      uint64_t v15 = v45;
    }
    else
    {
      int v43 = static os_log_type_t.error.getter();
      sub_100004FFC(&qword_1000259D8);
      uint64_t v28 = swift_allocObject();
      *(_OWORD *)(v28 + 16) = xmmword_10001B180;
      uint64_t v45 = v23;
      URL._bridgeToObjectiveC()(&v57);
      uint64_t v30 = v29;
      *(void *)(v28 + 56) = sub_10000515C(0, (unint64_t *)&unk_100025D50);
      *(void *)(v28 + 64) = sub_1000050A8(&qword_1000259E0, (unint64_t *)&unk_100025D50);
      *(void *)(v28 + 32) = v30;
      sub_10000515C(0, &qword_1000259D0);
      uint64_t v31 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:type:_:)();
      swift_bridgeObjectRelease();

      uint64_t v15 = v45;
      (*(void (**)(char *, uint64_t))(v47 + 8))(v46, v10);
      uint64_t v16 = v44;
    }
    uint64_t v17 = v48;
    goto LABEL_16;
  }
  sub_1000055F8((uint64_t)v9, (uint64_t *)&unk_100025AF0);
  static os_log_type_t.error.getter();
  sub_10000515C(0, &qword_1000259D0);
  id v14 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();

LABEL_4:
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  __int16 v22 = 0;
LABEL_16:
  *(void *)a2 = v15;
  *(void *)(a2 + 8) = v16;
  *(void *)(a2 + 16) = v17;
  *(void *)(a2 + 24) = v18;
  *(void *)(a2 + 32) = v19;
  *(void *)(a2 + 40) = v20;
  *(void *)(a2 + 48) = v21;
  *(_WORD *)(a2 + 56) = v22;
}

uint64_t sub_10000B4DC(void *a1)
{
  uint64_t v2 = v1;
  *(void *)(v2 + 40) = 0;
  *(unsigned char *)(v2 + 48) = 1;
  uint64_t v4 = v2 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___localURL;
  uint64_t v5 = sub_100004FFC((uint64_t *)&unk_100025AF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  uint64_t v6 = (_OWORD *)(v2 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info);
  *uint64_t v6 = xmmword_10001B1A0;
  v6[1] = 0u;
  v6[2] = 0u;
  *(_OWORD *)((char *)v6 + 42) = 0u;
  *(void *)(v2 + 16) = a1;
  id v7 = a1;
  id v8 = sub_10000935C();
  uint64_t v10 = v9;

  if (v10)
  {
    *(void *)(v2 + 24) = v8;
    *(void *)(v2 + 32) = v10;
  }
  else
  {

    sub_1000055F8(v2 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___localURL, &qword_100025CC8);
    sub_10000FA8C(*(void *)(v2 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info), *(void *)(v2 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 8));
    type metadata accessor for TZSAsset();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v2;
}

uint64_t sub_10000B640(void **a1, void *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v69 = a3;
  uint64_t v7 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for DispatchQoS();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  id v14 = (char *)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100004FFC(&qword_100025A10);
  __chkstk_darwin(v15 - 8);
  uint64_t v17 = (char *)&v64 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = v12;
  uint64_t v71 = v11;
  if (a1)
  {
    static os_log_type_t.error.getter();
    sub_100004FFC(&qword_1000259D8);
    uint64_t v18 = v10;
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_10001B180;
    unint64_t aBlock = (unint64_t)a1;
    type metadata accessor for MAQueryResult(0);
    uint64_t v20 = v8;
    uint64_t v21 = String.init<A>(describing:)();
    uint64_t v22 = v7;
    uint64_t v24 = v23;
    *(void *)(v19 + 56) = &type metadata for String;
    *(void *)(v19 + 64) = sub_10000EDF8();
    *(void *)(v19 + 32) = v21;
    *(void *)(v19 + 40) = v24;
    sub_10000515C(0, &qword_1000259D0);
    uint64_t v25 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    sub_10000515C(0, (unint64_t *)&unk_100025C00);
    uint64_t v26 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v27 = (void *)swift_allocObject();
    v27[2] = v69;
    v27[3] = a4;
    v27[4] = 0;
    v27[5] = a1;
    v82 = sub_10000F9F8;
    v83 = v27;
    unint64_t aBlock = (unint64_t)_NSConcreteStackBlock;
    uint64_t v79 = 1107296256;
    v80 = sub_1000127B0;
    v81 = &unk_100021060;
    uint64_t v28 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    static DispatchQoS.unspecified.getter();
    unint64_t aBlock = (unint64_t)_swiftEmptyArrayStorage;
    sub_100010470((unint64_t *)&qword_100025FD0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100004FFC((uint64_t *)&unk_100025C10);
    sub_1000092E0((unint64_t *)&qword_100025FE0, (uint64_t *)&unk_100025C10);
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v28);

    (*(void (**)(char *, uint64_t))(v20 + 8))(v18, v22);
    return (*(uint64_t (**)(char *, uint64_t))(v70 + 8))(v14, v71);
  }
  v75 = (void *)a4;
  v73 = v14;
  v66 = v10;
  uint64_t v67 = v8;
  id v30 = [a2 results];
  if (v30)
  {
    uint64_t v74 = sub_10000515C(0, &qword_100025CA0);
    unint64_t v31 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    static os_log_type_t.info.getter();
    unint64_t v72 = sub_100004FFC(&qword_1000259D8);
    uint64_t v32 = swift_allocObject();
    long long v68 = xmmword_10001B180;
    *(_OWORD *)(v32 + 16) = xmmword_10001B180;
    *(void *)(v32 + 56) = sub_100004FFC(&qword_100025CA8);
    *(void *)(v32 + 64) = sub_1000092E0(&qword_100025CB0, &qword_100025CA8);
    *(void *)(v32 + 32) = v31;
    sub_10000515C(0, &qword_1000259D0);
    swift_bridgeObjectRetain();
    __int16 v33 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    unint64_t aBlock = (unint64_t)_swiftEmptyArrayStorage;
    uint64_t v34 = v73;
    if (v31 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v35 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      uint64_t v65 = v7;
      if (v35)
      {
LABEL_6:
        if (v35 < 1)
        {
          __break(1u);
          goto LABEL_48;
        }
        for (uint64_t i = 0; i != v35; ++i)
        {
          if ((v31 & 0xC000000000000001) != 0) {
            id v40 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else {
            id v40 = *(id *)(v31 + 8 * i + 32);
          }
          uint64_t v41 = v40;
          sub_10000935C();
          uint64_t v43 = v42;
          swift_bridgeObjectRelease();
          if (v43)
          {
            specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
            specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
            specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
            specialized ContiguousArray._endMutation()();
          }
          else
          {
            static os_log_type_t.error.getter();
            uint64_t v37 = swift_allocObject();
            *(_OWORD *)(v37 + 16) = v68;
            *(void *)(v37 + 56) = v74;
            *(void *)(v37 + 64) = sub_1000050A8(&qword_100025CB8, &qword_100025CA0);
            *(void *)(v37 + 32) = v41;
            id v38 = v41;
            uint64_t v39 = (void *)static OS_os_log.default.getter();
            os_log(_:dso:log:type:_:)();

            uint64_t v34 = v73;
            swift_bridgeObjectRelease();
          }
        }
        swift_bridgeObjectRelease();
        a4 = aBlock;
        uint64_t v7 = (uint64_t)v75;
        if ((aBlock & 0x8000000000000000) != 0)
        {
LABEL_43:
          while (1)
          {
            swift_retain();
            uint64_t result = _CocoaArrayWrapper.endIndex.getter();
            uint64_t v74 = result;
            if (!result) {
              goto LABEL_44;
            }
LABEL_22:
            unint64_t v72 = a4 & 0xC000000000000001;
            if ((a4 & 0xC000000000000001) != 0)
            {
LABEL_48:
              uint64_t v46 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)();
            }
            else
            {
              if (!*(void *)(a4 + 16))
              {
                __break(1u);
LABEL_50:
                __break(1u);
LABEL_51:
                __break(1u);
                return result;
              }
              uint64_t v46 = (char *)*(id *)(a4 + 32);
            }
            uint64_t v34 = v46;
            if (v74 == 1)
            {
LABEL_40:
              swift_release_n();
              type metadata accessor for TZSAsset();
              swift_allocObject();
              id v30 = (id)sub_10000B4DC(v34);
              uint64_t v44 = v65;
              uint64_t v34 = v73;
              goto LABEL_45;
            }
            uint64_t v47 = 5;
            while (1)
            {
              unint64_t v48 = v47 - 4;
              if (v72)
              {
                v49 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)();
              }
              else
              {
                if (v48 >= *(void *)(a4 + 16)) {
                  goto LABEL_42;
                }
                v49 = (char *)*(id *)(a4 + 8 * v47);
              }
              __int16 v50 = v49;
              uint64_t v51 = v47 - 3;
              if (__OFADD__(v48, 1)) {
                break;
              }
              uint64_t result = (uint64_t)sub_10000935C();
              if (!v52) {
                goto LABEL_50;
              }
              long long v53 = (void **)result;
              uint64_t v54 = v52;
              uint64_t result = (uint64_t)sub_10000935C();
              if (!v55) {
                goto LABEL_51;
              }
              unint64_t aBlock = (unint64_t)v53;
              uint64_t v79 = v54;
              uint64_t v76 = result;
              uint64_t v77 = v55;
              uint64_t v56 = type metadata accessor for Locale();
              (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v56 - 8) + 56))(v17, 1, 1, v56);
              sub_1000055A4();
              uint64_t v57 = StringProtocol.compare<A>(_:options:range:locale:)();
              sub_1000055F8((uint64_t)v17, &qword_100025A10);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if (v57 == -1) {
                v58 = v34;
              }
              else {
                v58 = v50;
              }
              if (v57 == -1) {
                uint64_t v34 = v50;
              }

              ++v47;
              uint64_t v7 = (uint64_t)v75;
              if (v51 == v74) {
                goto LABEL_40;
              }
            }
            __break(1u);
LABEL_42:
            __break(1u);
          }
        }
LABEL_20:
        if ((a4 & 0x4000000000000000) != 0) {
          goto LABEL_43;
        }
        uint64_t v45 = *(void *)(a4 + 16);
        uint64_t result = swift_retain();
        uint64_t v74 = v45;
        if (v45) {
          goto LABEL_22;
        }
LABEL_44:
        swift_release_n();
        id v30 = 0;
        uint64_t v44 = v65;
        goto LABEL_45;
      }
    }
    else
    {
      uint64_t v35 = *(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v65 = v7;
      if (v35) {
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
    a4 = (unint64_t)_swiftEmptyArrayStorage;
    uint64_t v7 = (uint64_t)v75;
    if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
      goto LABEL_43;
    }
    goto LABEL_20;
  }
  uint64_t v34 = v73;
  uint64_t v44 = v7;
  uint64_t v7 = (uint64_t)v75;
LABEL_45:
  uint64_t v59 = v69;
  sub_10000515C(0, (unint64_t *)&unk_100025C00);
  v60 = (void *)static OS_dispatch_queue.main.getter();
  v61 = (void *)swift_allocObject();
  v61[2] = v59;
  v61[3] = v7;
  v61[4] = v30;
  v82 = sub_10000FA58;
  v83 = v61;
  unint64_t aBlock = (unint64_t)_NSConcreteStackBlock;
  uint64_t v79 = 1107296256;
  v80 = sub_1000127B0;
  v81 = &unk_1000210B0;
  v62 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  static DispatchQoS.unspecified.getter();
  unint64_t aBlock = (unint64_t)_swiftEmptyArrayStorage;
  sub_100010470((unint64_t *)&qword_100025FD0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100004FFC((uint64_t *)&unk_100025C10);
  sub_1000092E0((unint64_t *)&qword_100025FE0, (uint64_t *)&unk_100025C10);
  v63 = v66;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v62);
  swift_release();

  (*(void (**)(char *, uint64_t))(v67 + 8))(v63, v44);
  return (*(uint64_t (**)(char *, uint64_t))(v70 + 8))(v34, v71);
}

uint64_t sub_10000C10C(void (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_10000F98C();
  uint64_t v7 = swift_allocError();
  *(void *)uint64_t v8 = a4;
  *(unsigned char *)(v8 + 8) = 1;
  a1(a3, v7);

  return swift_errorRelease();
}

uint64_t sub_10000C19C(uint64_t a1, uint64_t a2)
{
  return sub_10000DF64(a1, a2);
}

void sub_10000C1A4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    static os_log_type_t.error.getter();
    sub_100004FFC(&qword_1000259D8);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_10001B180;
    aBlock[0] = a1;
    type metadata accessor for MADownloadResult(0);
    uint64_t v11 = String.init<A>(describing:)();
    uint64_t v13 = v12;
    *(void *)(v10 + 56) = &type metadata for String;
    *(void *)(v10 + 64) = sub_10000EDF8();
    *(void *)(v10 + 32) = v11;
    *(void *)(v10 + 40) = v13;
    sub_10000515C(0, &qword_1000259D0);
    id v14 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    static os_log_type_t.info.getter();
    uint64_t v19 = v3;
    sub_10000515C(0, &qword_1000259D0);
    uint64_t v15 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();

    sub_10000515C(0, (unint64_t *)&unk_100025C00);
    uint64_t v16 = (void *)static OS_dispatch_queue.main.getter();
    aBlock[4] = sub_10000C584;
    aBlock[5] = 0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000127B0;
    aBlock[3] = &unk_100020F70;
    uint64_t v17 = _Block_copy(aBlock);
    static DispatchQoS.unspecified.getter();
    aBlock[0] = _swiftEmptyArrayStorage;
    sub_100010470((unint64_t *)&qword_100025FD0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100004FFC((uint64_t *)&unk_100025C10);
    sub_1000092E0((unint64_t *)&qword_100025FE0, (uint64_t *)&unk_100025C10);
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v17);

    (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

uint64_t sub_10000C584()
{
  if (qword_100025830 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_100026B00;
  static os_log_type_t.debug.getter();
  sub_10000515C(0, &qword_1000259D0);
  uint64_t v1 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();

  uint64_t v2 = os_transaction_create();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v0;
  swift_unknownObjectRetain_n();
  id v4 = v0;
  static os_log_type_t.debug.getter();
  sub_100004FFC(&qword_1000259D8);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10001B180;
  *(void *)(v5 + 56) = &type metadata for String;
  *(void *)(v5 + 64) = sub_10000EDF8();
  *(void *)(v5 + 32) = 0x65736C6166;
  *(void *)(v5 + 40) = 0xE500000000000000;
  uint64_t v6 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  sub_10000F538(sub_10000EE68, v3);
  swift_unknownObjectRelease_n();

  return swift_release();
}

uint64_t sub_10000C764(void *a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = sub_100004FFC(&qword_100025A10);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2)
  {
    if (!a1)
    {
      static os_log_type_t.info.getter();
      sub_10000515C(0, &qword_1000259D0);
      uint64_t v18 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:type:_:)();

      return a3(0, 0, 0);
    }
    swift_retain();
    sub_1000053C0(v31);
    uint64_t v10 = sub_100003EB0();
    uint64_t v12 = v11;
    sub_1000056F4((uint64_t)v31);
    uint64_t v14 = a1[3];
    uint64_t v13 = a1[4];
    v30[4] = v10;
    v30[5] = v12;
    v30[2] = v14;
    v30[3] = v13;
    uint64_t v15 = type metadata accessor for Locale();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v8, 1, 1, v15);
    sub_1000055A4();
    swift_bridgeObjectRetain();
    uint64_t v16 = StringProtocol.compare<A>(_:options:range:locale:)();
    sub_1000055F8((uint64_t)v8, &qword_100025A10);
    swift_bridgeObjectRelease();
    if (v16 == -1)
    {
      uint64_t v19 = (char *)sub_10000AA40();
      if ((unint64_t)(v19 - 2) < 2)
      {
        sub_10000CD88();
        goto LABEL_9;
      }
      if (v19 == (char *)1)
      {
        sub_10000E03C();
        goto LABEL_9;
      }
      if (v19 != (char *)4)
      {
        static os_log_type_t.error.getter();
        sub_100004FFC(&qword_1000259D8);
        uint64_t v23 = swift_allocObject();
        *(_OWORD *)(v23 + 16) = xmmword_10001B180;
        uint64_t v24 = (void *)a1[2];
        *(void *)(v23 + 56) = sub_10000515C(0, &qword_100025CA0);
        *(void *)(v23 + 64) = sub_1000050A8(&qword_100025CB8, &qword_100025CA0);
        *(void *)(v23 + 32) = v24;
        sub_10000515C(0, &qword_1000259D0);
        id v25 = v24;
        uint64_t v26 = (void *)static OS_os_log.default.getter();
        os_log(_:dso:log:type:_:)();
        swift_bridgeObjectRelease();

        uint64_t v27 = a1[5];
        sub_10000F98C();
        uint64_t v28 = swift_allocError();
        *(void *)uint64_t v29 = v27;
        *(unsigned char *)(v29 + 8) = 0;
        swift_bridgeObjectRetain();
        a3(v14, v13, v28);
        swift_errorRelease();
        swift_bridgeObjectRelease();
        goto LABEL_9;
      }
      static os_log_type_t.info.getter();
      sub_100004FFC(&qword_1000259D8);
      uint64_t v20 = swift_allocObject();
      *(_OWORD *)(v20 + 16) = xmmword_10001B180;
      uint64_t v21 = (void *)a1[2];
      *(void *)(v20 + 56) = sub_10000515C(0, &qword_100025CA0);
      *(void *)(v20 + 64) = sub_1000050A8(&qword_100025CB8, &qword_100025CA0);
      *(void *)(v20 + 32) = v21;
      sub_10000515C(0, &qword_1000259D0);
      id v22 = v21;
      uint64_t v17 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:type:_:)();
      swift_bridgeObjectRelease();
    }
    else
    {
      static os_log_type_t.info.getter();
      sub_10000515C(0, &qword_1000259D0);
      uint64_t v17 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:type:_:)();
    }

LABEL_9:
    a3(v14, v13, 0);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  swift_errorRetain();
  a3(0, 0, a2);

  return swift_errorRelease();
}

uint64_t sub_10000CCC0(uint64_t a1, uint64_t a2, void *a3)
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

uint64_t sub_10000CD88()
{
  uint64_t v2 = sub_100004FFC((uint64_t *)&unk_100025AF0);
  __chkstk_darwin(v2 - 8);
  id v4 = (char *)v112 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  v126 = (char *)v112 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  v127 = (char *)v112 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  v128 = (char *)v112 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)v112 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)v112 - v17;
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)v112 - v19;
  sub_10000AD40((uint64_t)v136);
  sub_1000050F8((uint64_t)v136, (uint64_t)v138, (uint64_t *)&unk_100025FF0);
  if (!*((void *)&v138[0] + 1)) {
    goto LABEL_4;
  }
  long long v140 = v138[0];
  long long v141 = v138[1];
  v142[0] = v139[0];
  *(_OWORD *)((char *)v142 + 10) = *(_OWORD *)((char *)v139 + 10);
  sub_10000AA84((uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_1000105B4((uint64_t)v136, (void (*)(void, void, void, void, void, void, void, void))sub_100005690);
    sub_1000055F8((uint64_t)v4, (uint64_t *)&unk_100025AF0);
LABEL_4:
    sub_10000F98C();
    swift_allocError();
    *(void *)uint64_t v21 = 1;
    *(unsigned char *)(v21 + 8) = 3;
    return swift_willThrow();
  }
  uint64_t v118 = v0;
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v20, v4, v5);
  sub_1000053C0(v137);
  uint64_t v117 = sub_100003EB0();
  uint64_t v125 = v23;
  sub_1000056F4((uint64_t)v137);
  id v124 = [self defaultManager];
  id v24 = [v124 temporaryDirectory];
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  URL.appendingPathComponent(_:)();
  uint64_t v27 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v25 = v6 + 8;
  uint64_t v26 = v27;
  v27(v15, v5);
  URL.path.getter();
  sub_10000A688();
  uint64_t v123 = v1;
  if (v1)
  {
    sub_1000105B4((uint64_t)v136, (void (*)(void, void, void, void, void, void, void, void))sub_100005690);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v26(v18, v5);
    return ((uint64_t (*)(char *, uint64_t))v26)(v20, v5);
  }
  uint64_t v120 = v25;
  v121 = v26;
  v116 = v18;
  v119 = v20;
  uint64_t v122 = v5;
  swift_bridgeObjectRelease();
  sub_100004FFC(&qword_100025CE0);
  uint64_t inited = swift_initStackObject();
  long long v113 = xmmword_10001B150;
  *(_OWORD *)(inited + 16) = xmmword_10001B150;
  *(void *)(inited + 32) = NSFileProtectionKey;
  type metadata accessor for FileProtectionType(0);
  *(void *)(inited + 40) = NSFileProtectionNone;
  *(void *)(inited + 64) = v29;
  *(void *)(inited + 72) = NSFileOwnerAccountID;
  *(void *)(inited + 80) = 0;
  *(void *)(inited + 104) = &type metadata for Int;
  *(void *)(inited + 112) = NSFileGroupOwnerAccountID;
  *(void *)(inited + 144) = &type metadata for Int;
  *(void *)(inited + 120) = 0;
  id v30 = NSFileProtectionKey;
  unint64_t v31 = NSFileProtectionNone;
  uint64_t v32 = NSFileOwnerAccountID;
  __int16 v33 = NSFileGroupOwnerAccountID;
  unint64_t v34 = sub_100012A20(inited);
  v132 = &type metadata for Int;
  *(void *)&long long v130 = 493;
  sub_100010460(&v130, v135);
  swift_bridgeObjectRetain();
  uint64_t v35 = NSFilePosixPermissions;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v115 = v34;
  unint64_t v129 = v34;
  sub_10000F1C0(v135, v35, isUniquelyReferenced_nonNull_native);
  unint64_t v114 = v129;

  swift_bridgeObjectRelease();
  sub_100003EB0();
  URL.appendingPathComponent(_:)();
  swift_bridgeObjectRelease();
  if (qword_100025878 != -1) {
    swift_once();
  }
  URL.init(fileURLWithPath:)();
  sub_100003EB0();
  uint64_t v37 = v126;
  URL.appendingPathComponent(_:)();
  swift_bridgeObjectRelease();
  v121(v15, v122);
  LOBYTE(v129) = 0;
  URL.path.getter();
  NSString v38 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v39 = v124;
  unsigned int v40 = [v124 fileExistsAtPath:v38 isDirectory:&v129];

  if (v40)
  {
    if (v129 == 1)
    {
      swift_bridgeObjectRelease();
      sub_1000105B4((uint64_t)v136, (void (*)(void, void, void, void, void, void, void, void))sub_100005690);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      static os_log_type_t.info.getter();
      sub_100004FFC(&qword_1000259D8);
      uint64_t v41 = swift_allocObject();
      *(_OWORD *)(v41 + 16) = xmmword_10001B180;
      uint64_t v42 = URL.path.getter();
      uint64_t v44 = v43;
      *(void *)(v41 + 56) = &type metadata for String;
      *(void *)(v41 + 64) = sub_10000EDF8();
      *(void *)(v41 + 32) = v42;
      *(void *)(v41 + 40) = v44;
      sub_10000515C(0, &qword_1000259D0);
      uint64_t v45 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:type:_:)();

      uint64_t v46 = v121;
      uint64_t v47 = v127;
      swift_bridgeObjectRelease();
      unint64_t v48 = v37;
      v49 = v116;
      __int16 v50 = v128;
LABEL_12:

      uint64_t v51 = v122;
      v46(v48, v122);
      v46(v47, v51);
      v46(v50, v51);
      v46(v49, v51);
      return ((uint64_t (*)(char *, uint64_t))v46)(v119, v51);
    }
    static os_log_type_t.fault.getter();
    sub_100004FFC(&qword_1000259D8);
    uint64_t v52 = swift_allocObject();
    *(_OWORD *)(v52 + 16) = xmmword_10001B180;
    uint64_t v53 = URL.path.getter();
    uint64_t v55 = v54;
    *(void *)(v52 + 56) = &type metadata for String;
    *(void *)(v52 + 64) = sub_10000EDF8();
    *(void *)(v52 + 32) = v53;
    *(void *)(v52 + 40) = v55;
    sub_10000515C(0, &qword_1000259D0);
    uint64_t v56 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();
  }
  LODWORD(v124) = static os_log_type_t.info.getter();
  v112[1] = sub_100004FFC(&qword_1000259D8);
  uint64_t v57 = swift_allocObject();
  *(_OWORD *)(v57 + 16) = v113;
  uint64_t v58 = URL.path.getter();
  uint64_t v60 = v59;
  *(void *)(v57 + 56) = &type metadata for String;
  unint64_t v61 = sub_10000EDF8();
  *(void *)(v57 + 64) = v61;
  *(void *)(v57 + 32) = v58;
  *(void *)(v57 + 40) = v60;
  uint64_t v62 = URL.path.getter();
  *(void *)(v57 + 96) = &type metadata for String;
  *(void *)(v57 + 104) = v61;
  *(void *)(v57 + 72) = v62;
  *(void *)(v57 + 80) = v63;
  uint64_t v64 = URL.path.getter();
  *(void *)(v57 + 136) = &type metadata for String;
  *(void *)(v57 + 144) = v61;
  *(void *)(v57 + 112) = v64;
  *(void *)(v57 + 120) = v65;
  *(void *)&long long v113 = sub_10000515C(0, &qword_1000259D0);
  v66 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  URL._bridgeToObjectiveC()(v67);
  uint64_t v69 = v68;
  URL._bridgeToObjectiveC()(v70);
  unint64_t v72 = v71;
  *(void *)&long long v130 = 0;
  LODWORD(v60) = [v39 copyItemAtURL:v69 toURL:v71 error:&v130];

  if (!v60)
  {
    id v81 = (id)v130;
    swift_bridgeObjectRelease();
    sub_1000105B4((uint64_t)v136, (void (*)(void, void, void, void, void, void, void, void))sub_100005690);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v82 = _convertNSErrorToError(_:)();

    swift_willThrow();
    *(void *)&long long v130 = v82;
    swift_errorRetain();
    sub_100004FFC(&qword_100025CE8);
    sub_10000515C(0, (unint64_t *)&unk_100025CF0);
    if (swift_dynamicCast())
    {
      swift_errorRelease();
      sub_100009F94(*(id *)&v135[0]);
      swift_willThrow();
    }
    swift_errorRelease();
    uint64_t v45 = v39;
    goto LABEL_23;
  }
  id v73 = (id)v130;
  NSString v74 = String._bridgeToObjectiveC()();
  type metadata accessor for FileAttributeKey(0);
  sub_100010470(&qword_100025958, type metadata accessor for FileAttributeKey);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  *(void *)&long long v130 = 0;
  unsigned int v76 = [v39 createDirectoryAtPath:v74 withIntermediateDirectories:1 attributes:isa error:&v130];

  uint64_t v45 = v39;
  if (!v76)
  {
    id v83 = (id)v130;
    sub_1000105B4((uint64_t)v136, (void (*)(void, void, void, void, void, void, void, void))sub_100005690);
    swift_bridgeObjectRelease();
LABEL_22:
    swift_bridgeObjectRelease();
    _convertNSErrorToError(_:)();

    swift_willThrow();
    goto LABEL_23;
  }
  id v77 = (id)v130;
  uint64_t v78 = URL.path.getter();
  uint64_t v79 = v123;
  sub_100009508(v115, v78, v80);
  if (!v79)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    URL._bridgeToObjectiveC()(v90);
    v92 = v91;
    URL._bridgeToObjectiveC()(v93);
    v95 = v94;
    *(void *)&long long v130 = 0;
    unsigned int v96 = [v39 moveItemAtURL:v92 toURL:v94 error:&v130];

    if (v96)
    {
      uint64_t v97 = qword_100025858;
      id v98 = (id)v130;
      if (v97 != -1) {
        swift_once();
      }
      NSString v99 = String._bridgeToObjectiveC()();
      *(void *)&long long v130 = 0;
      unsigned int v100 = [v39 removeItemAtPath:v99 error:&v130];

      if (v100)
      {
        id v101 = (id)v130;
      }
      else
      {
        id v102 = (id)v130;
        _convertNSErrorToError(_:)();

        swift_willThrow();
        swift_errorRelease();
      }
      NSString v103 = String._bridgeToObjectiveC()();
      URL.path.getter();
      NSString v104 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      *(void *)&long long v130 = 0;
      unsigned int v105 = [v39 createSymbolicLinkAtPath:v103 withDestinationPath:v104 error:&v130];

      if (v105)
      {
        uint64_t v123 = 0;
        id v106 = (id)v130;
        sub_100003EB0();
        sub_100004FFC((uint64_t *)&unk_100025D10);
        uint64_t v107 = swift_initStackObject();
        *(_OWORD *)(v107 + 16) = xmmword_10001B160;
        *(void *)(v107 + 32) = 0x6973726556646C6FLL;
        *(void *)(v107 + 40) = 0xEA00000000006E6FLL;
        *(void *)(v107 + 48) = String._bridgeToObjectiveC()();
        *(void *)(v107 + 56) = 0x697372655677656ELL;
        *(void *)(v107 + 64) = 0xEA00000000006E6FLL;
        *(void *)(v107 + 72) = String._bridgeToObjectiveC()();
        sub_100012904(v107);
        sub_1000120B0(0x736E497465737361, (void *)0xEE0064656C6C6174);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v108 = *(void **)(v118 + 16);
        v133 = sub_10000DE64;
        uint64_t v134 = 0;
        *(void *)&long long v130 = _NSConcreteStackBlock;
        *((void *)&v130 + 1) = 1107296256;
        v131 = sub_10000DF5C;
        v132 = &unk_100021268;
        v109 = _Block_copy(&v130);
        [v108 purge:v109];
        _Block_release(v109);
        v49 = v116;
        uint64_t v46 = v121;
        if (qword_100025830 != -1) {
          swift_once();
        }
        v110 = (_OWORD *)swift_allocObject();
        long long v111 = v141;
        v110[1] = v140;
        v110[2] = v111;
        v110[3] = v142[0];
        *(_OWORD *)((char *)v110 + 58) = *(_OWORD *)((char *)v142 + 10);
        sub_100017694(0xD000000000000026, 0x800000010001BF50, (uint64_t)sub_100010508, (uint64_t)v110);
        swift_release();
        uint64_t v47 = v127;
        __int16 v50 = v128;
        unint64_t v48 = v126;
        goto LABEL_12;
      }
    }
    id v83 = (id)v130;
    sub_1000105B4((uint64_t)v136, (void (*)(void, void, void, void, void, void, void, void))sub_100005690);
    goto LABEL_22;
  }
  sub_1000105B4((uint64_t)v136, (void (*)(void, void, void, void, void, void, void, void))sub_100005690);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_23:
  static os_log_type_t.error.getter();
  uint64_t v84 = swift_allocObject();
  *(_OWORD *)(v84 + 16) = xmmword_10001B180;
  uint64_t v85 = _convertErrorToNSError(_:)();
  *(void *)(v84 + 56) = sub_10000515C(0, (unint64_t *)&unk_100025F80);
  *(void *)(v84 + 64) = sub_1000050A8((unint64_t *)&qword_100025D00, (unint64_t *)&unk_100025F80);
  *(void *)(v84 + 32) = v85;
  v86 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  v87 = (void *)_convertErrorToNSError(_:)();
  long long v143 = (unint64_t)v87;
  uint64_t v144 = 0;
  uint64_t v145 = 0;
  char v146 = 3;
  sub_1000118C0(&v143);

  swift_willThrow();
  v88 = v121;
  uint64_t v89 = v122;
  v121(v126, v122);
  v88(v127, v89);
  v88(v128, v89);
  v88(v116, v89);
  return ((uint64_t (*)(char *, uint64_t))v88)(v119, v89);
}

void sub_10000DE64(uint64_t a1)
{
  if (a1)
  {
    static os_log_type_t.error.getter();
    sub_100004FFC(&qword_1000259D8);
    uint64_t v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_10001B180;
    type metadata accessor for MAPurgeResult(0);
    uint64_t v2 = String.init<A>(describing:)();
    uint64_t v4 = v3;
    *(void *)(v1 + 56) = &type metadata for String;
    *(void *)(v1 + 64) = sub_10000EDF8();
    *(void *)(v1 + 32) = v2;
    *(void *)(v1 + 40) = v4;
    sub_10000515C(0, &qword_1000259D0);
    uint64_t v5 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_10000DF5C(uint64_t a1, uint64_t a2)
{
  return sub_10000DF64(a1, a2);
}

uint64_t sub_10000DF64(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t sub_10000DFBC(void (*a1)(void), uint64_t a2, uint64_t a3)
{
  sub_100004BE4((uint64_t)v10);
  uint64_t v6 = sub_100003EB0();
  uint64_t v8 = v7;
  sub_1000056F4((uint64_t)v10);
  sub_100006064(a3, v6, v8, a1, a2);
  return swift_bridgeObjectRelease();
}

void sub_10000E03C()
{
  uint64_t v1 = v0;
  if (sub_10000AA40() == (id)1)
  {
    uint64_t v2 = *(void **)(v0 + 16);
    if (qword_100025818 != -1) {
      swift_once();
    }
    uint64_t v3 = qword_100026AE8;
    uint64_t v4 = swift_allocObject();
    swift_weakInit();
    void v18[4] = sub_1000103FC;
    v18[5] = v4;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 1107296256;
    v18[2] = sub_100012C94;
    v18[3] = &unk_1000211C8;
    uint64_t v5 = _Block_copy(v18);
    swift_release();
    [v2 startDownload:v3 then:v5];
    _Block_release(v5);
    static os_log_type_t.info.getter();
    sub_100004FFC(&qword_1000259D8);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_10001B180;
    *(void *)(v6 + 56) = sub_10000515C(0, &qword_100025CA0);
    *(void *)(v6 + 64) = sub_1000050A8(&qword_100025CB8, &qword_100025CA0);
    *(void *)(v6 + 32) = v2;
    sub_10000515C(0, &qword_1000259D0);
    id v7 = v2;
    uint64_t v8 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
    goto LABEL_7;
  }
  if ((unint64_t)(*(void *)(v0 + 40) - 2) < 3)
  {
    static os_log_type_t.info.getter();
    sub_100004FFC(&qword_1000259D8);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_10001B180;
    uint64_t v10 = *(void **)(v0 + 16);
    *(void *)(v9 + 56) = sub_10000515C(0, &qword_100025CA0);
    *(void *)(v9 + 64) = sub_1000050A8(&qword_100025CB8, &qword_100025CA0);
    *(void *)(v9 + 32) = v10;
    sub_10000515C(0, &qword_1000259D0);
    id v11 = v10;
    uint64_t v8 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
LABEL_7:
    swift_bridgeObjectRelease();

    return;
  }
  static os_log_type_t.error.getter();
  sub_100004FFC(&qword_1000259D8);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_10001B180;
  uint64_t v13 = *(void **)(v0 + 16);
  *(void *)(v12 + 56) = sub_10000515C(0, &qword_100025CA0);
  *(void *)(v12 + 64) = sub_1000050A8(&qword_100025CB8, &qword_100025CA0);
  *(void *)(v12 + 32) = v13;
  sub_10000515C(0, &qword_1000259D0);
  id v14 = v13;
  uint64_t v15 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  uint64_t v16 = *(void *)(v1 + 40);
  sub_10000F98C();
  swift_allocError();
  *(void *)uint64_t v17 = v16;
  *(unsigned char *)(v17 + 8) = 0;
  swift_willThrow();
}

uint64_t sub_10000E428(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = v8;
  if (a1)
  {
    uint64_t v25 = v3;
    v24[1] = static os_log_type_t.error.getter();
    sub_100004FFC(&qword_1000259D8);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_10001B160;
    *(void *)&long long aBlock = a1;
    type metadata accessor for MADownloadResult(0);
    uint64_t v12 = String.init<A>(describing:)();
    uint64_t v14 = v13;
    *(void *)(v11 + 56) = &type metadata for String;
    unint64_t v15 = sub_10000EDF8();
    *(void *)(v11 + 64) = v15;
    *(void *)(v11 + 32) = v12;
    *(void *)(v11 + 40) = v14;
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    if (Strong)
    {
      id v17 = *(id *)(Strong + 16);
      swift_release();
      uint64_t v29 = (void *)sub_10000515C(0, &qword_100025CA0);
      id v30 = (uint64_t (*)())sub_1000050A8(&qword_100025CB8, &qword_100025CA0);
      *(void *)&long long aBlock = v17;
      sub_100010404(&aBlock, v11 + 72);
    }
    else
    {
      *(void *)(v11 + 96) = &type metadata for String;
      *(void *)(v11 + 104) = v15;
      *(void *)(v11 + 72) = 0x296C696E28;
      *(void *)(v11 + 80) = 0xE500000000000000;
    }
    sub_10000515C(0, &qword_1000259D0);
    id v22 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    sub_10000515C(0, (unint64_t *)&unk_100025C00);
    uint64_t v19 = (void *)static OS_dispatch_queue.main.getter();
    id v30 = nullsub_1;
    uint64_t v31 = 0;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    uint64_t v28 = sub_1000127B0;
    uint64_t v29 = &unk_1000211F0;
    uint64_t v20 = _Block_copy(&aBlock);
    swift_release();
    static DispatchQoS.unspecified.getter();
    *(void *)&long long aBlock = _swiftEmptyArrayStorage;
    sub_100010470((unint64_t *)&qword_100025FD0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100004FFC((uint64_t *)&unk_100025C10);
    sub_1000092E0((unint64_t *)&qword_100025FE0, (uint64_t *)&unk_100025C10);
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    uint64_t v3 = v25;
    uint64_t v21 = v26;
  }
  else
  {
    static os_log_type_t.info.getter();
    sub_10000515C(0, &qword_1000259D0);
    uint64_t v18 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();

    sub_10000515C(0, (unint64_t *)&unk_100025C00);
    uint64_t v19 = (void *)static OS_dispatch_queue.main.getter();
    id v30 = sub_10000EA0C;
    uint64_t v31 = 0;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    uint64_t v28 = sub_1000127B0;
    uint64_t v29 = &unk_100021218;
    uint64_t v20 = _Block_copy(&aBlock);
    static DispatchQoS.unspecified.getter();
    *(void *)&long long aBlock = _swiftEmptyArrayStorage;
    sub_100010470((unint64_t *)&qword_100025FD0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100004FFC((uint64_t *)&unk_100025C10);
    sub_1000092E0((unint64_t *)&qword_100025FE0, (uint64_t *)&unk_100025C10);
    uint64_t v21 = v26;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
  }
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v21);
}

uint64_t sub_10000EA0C()
{
  if (qword_100025830 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_100026B00;
  static os_log_type_t.debug.getter();
  sub_10000515C(0, &qword_1000259D0);
  uint64_t v1 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();

  uint64_t v2 = os_transaction_create();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v0;
  swift_unknownObjectRetain_n();
  id v4 = v0;
  static os_log_type_t.debug.getter();
  sub_100004FFC(&qword_1000259D8);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10001B180;
  *(void *)(v5 + 56) = &type metadata for String;
  *(void *)(v5 + 64) = sub_10000EDF8();
  *(void *)(v5 + 32) = 0x65736C6166;
  *(void *)(v5 + 40) = 0xE500000000000000;
  uint64_t v6 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  sub_10000F538(sub_100011898, v3);
  swift_unknownObjectRelease_n();

  return swift_release();
}

uint64_t sub_10000EBEC()
{
  swift_bridgeObjectRelease();
  sub_1000055F8((uint64_t)v0 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___localURL, &qword_100025CC8);
  sub_10000FA8C(*(uint64_t *)((char *)v0 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info), *(uint64_t *)((char *)v0 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 8));
  uint64_t v1 = *((unsigned int *)*v0 + 12);
  uint64_t v2 = *((unsigned __int16 *)*v0 + 26);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_10000EC8C()
{
  return type metadata accessor for TZSAsset();
}

uint64_t type metadata accessor for TZSAsset()
{
  uint64_t result = qword_100025AD8;
  if (!qword_100025AD8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000ECE0()
{
  sub_10000ED9C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10000ED9C()
{
  if (!qword_100025AE8)
  {
    sub_100009000((uint64_t *)&unk_100025AF0);
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100025AE8);
    }
  }
}

unint64_t sub_10000EDF8()
{
  unint64_t result = qword_100025BF0;
  if (!qword_100025BF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025BF0);
  }
  return result;
}

uint64_t sub_10000EE4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000EE5C()
{
  return swift_release();
}

void sub_10000EE68(uint64_t a1, unint64_t a2, uint64_t a3)
{
}

uint64_t sub_10000EE70(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100004FFC(&qword_100025D40);
  char v35 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v34 = v5 + 64;
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
      unint64_t v15 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v16 = v15 | (v13 << 6);
      goto LABEL_22;
    }
    int64_t v17 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v17 >= v33) {
      break;
    }
    uint64_t v18 = (void *)(v5 + 64);
    unint64_t v19 = *(void *)(v34 + 8 * v17);
    ++v13;
    if (!v19)
    {
      int64_t v13 = v17 + 1;
      if (v17 + 1 >= v33) {
        goto LABEL_34;
      }
      unint64_t v19 = *(void *)(v34 + 8 * v13);
      if (!v19)
      {
        int64_t v20 = v17 + 2;
        if (v20 >= v33)
        {
LABEL_34:
          swift_release();
          if ((v35 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v19 = *(void *)(v34 + 8 * v20);
        if (!v19)
        {
          while (1)
          {
            int64_t v13 = v20 + 1;
            if (__OFADD__(v20, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v33) {
              goto LABEL_34;
            }
            unint64_t v19 = *(void *)(v34 + 8 * v13);
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
    unint64_t v16 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_22:
    uint64_t v21 = *(void **)(*(void *)(v5 + 48) + 8 * v16);
    id v22 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v16);
    if (v35)
    {
      sub_100010460(v22, v36);
    }
    else
    {
      sub_10000916C((uint64_t)v22, (uint64_t)v36);
      id v23 = v21;
    }
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    Hasher.init(_seed:)();
    String.hash(into:)();
    Swift::Int v24 = Hasher._finalize()();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v26 = v24 & ~v25;
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
          goto LABEL_42;
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
    *(void *)(*(void *)(v7 + 48) + 8 * v14) = v21;
    uint64_t result = (uint64_t)sub_100010460(v36, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v18 = (void *)(v5 + 64);
  if ((v35 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
  if (v32 >= 64) {
    bzero(v18, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v18 = -1 << v32;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

char *sub_10000F1AC(uint64_t a1)
{
  return sub_1000073E4(0, *(void *)(a1 + 16), 0, (char *)a1);
}

_OWORD *sub_10000F1C0(_OWORD *a1, void *a2, char a3)
{
  id v4 = (void **)v3;
  uint64_t v7 = (void *)*v3;
  unint64_t v9 = sub_100016964((uint64_t)a2);
  uint64_t v10 = v7[2];
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v13 = v8;
  uint64_t v14 = v7[3];
  if (v14 < v12 || (a3 & 1) == 0)
  {
    if (v14 >= v12 && (a3 & 1) == 0)
    {
      sub_10000F36C();
      goto LABEL_7;
    }
    sub_10000EE70(v12, a3 & 1);
    unint64_t v18 = sub_100016964((uint64_t)a2);
    if ((v13 & 1) == (v19 & 1))
    {
      unint64_t v9 = v18;
      unint64_t v15 = *v4;
      if (v13) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    type metadata accessor for FileAttributeKey(0);
    uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v15 = *v4;
  if (v13)
  {
LABEL_8:
    unint64_t v16 = (_OWORD *)(v15[7] + 32 * v9);
    sub_100010510((uint64_t)v16);
    return sub_100010460(a1, v16);
  }
LABEL_13:
  sub_10000F304(v9, (uint64_t)a2, a1, v15);

  return a2;
}

_OWORD *sub_10000F304(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t result = sub_100010460(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

id sub_10000F36C()
{
  uint64_t v1 = v0;
  sub_100004FFC(&qword_100025D40);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    int64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 32 * v15;
    sub_10000916C(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    sub_100010460(v22, (_OWORD *)(*(void *)(v4 + 56) + v18));
    id result = v17;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_10000F538(void (*a1)(void, void, uint64_t), uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_retain();
  static os_log_type_t.debug.getter();
  sub_10000515C(0, &qword_1000259D0);
  uint64_t v5 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();

  id v6 = objc_allocWithZone((Class)MAAssetQuery);
  NSString v7 = String._bridgeToObjectiveC()();
  id v8 = [v6 initWithType:v7];

  if (v8)
  {
    if (qword_100025880 != -1) {
      swift_once();
    }
    if (qword_100026BA0)
    {
      NSString v9 = String._bridgeToObjectiveC()();
      NSString v10 = String._bridgeToObjectiveC()();
      [v8 addKeyValuePair:v9 with:v10];

      [v8 returnTypes:2];
      static os_log_type_t.info.getter();
      sub_100004FFC(&qword_1000259D8);
      uint64_t v11 = swift_allocObject();
      *(_OWORD *)(v11 + 16) = xmmword_10001B180;
      *(void *)(v11 + 56) = sub_10000515C(0, &qword_100025C88);
      *(void *)(v11 + 64) = sub_1000050A8((unint64_t *)&unk_100025C90, &qword_100025C88);
      *(void *)(v11 + 32) = v8;
      id v12 = v8;
      int64_t v13 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:type:_:)();
      swift_bridgeObjectRelease();

      unint64_t v14 = (void *)swift_allocObject();
      v14[2] = v12;
      v14[3] = sub_10000F984;
      v14[4] = v4;
      v20[4] = sub_10000F9E4;
      v20[5] = v14;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 1107296256;
      v20[2] = sub_10000C19C;
      v20[3] = &unk_100021010;
      unint64_t v15 = _Block_copy(v20);
      id v16 = v12;
      swift_retain();
      swift_release();
      [v16 queryMetaData:v15];
      _Block_release(v15);
      swift_release();

      return;
    }
  }
  static os_log_type_t.fault.getter();
  int64_t v17 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();

  sub_10000F98C();
  uint64_t v18 = swift_allocError();
  *(void *)uint64_t v19 = 0;
  *(unsigned char *)(v19 + 8) = 3;
  swift_errorRetain();
  a1(0, 0, v18);
  swift_errorRelease();
  swift_errorRelease();

  swift_release();
}

uint64_t sub_10000F94C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000F984(void *a1, uint64_t a2)
{
  return sub_10000C764(a1, a2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
}

unint64_t sub_10000F98C()
{
  unint64_t result = qword_100025C80;
  if (!qword_100025C80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025C80);
  }
  return result;
}

uint64_t sub_10000F9E4(void **a1)
{
  return sub_10000B640(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_10000F9F0()
{
  return sub_10000FA0C(48);
}

uint64_t sub_10000F9F8()
{
  return sub_10000C10C(*(void (**)(uint64_t, uint64_t))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_10000FA04()
{
  return sub_10000FA0C(40);
}

uint64_t sub_10000FA0C(uint64_t a1)
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v1, a1, 7);
}

uint64_t sub_10000FA58()
{
  return (*(uint64_t (**)(void, void))(v0 + 16))(*(void *)(v0 + 32), 0);
}

uint64_t sub_10000FA8C(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return sub_100005690(a1, a2);
  }
  return a1;
}

uint64_t sub_10000FA9C(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000FAF0(uint64_t a1, void **a2, uint64_t a3, void (*a4)(void), uint64_t a5)
{
  uint64_t v10 = sub_100004FFC(&qword_100025A10);
  __chkstk_darwin(v10 - 8);
  id v12 = (char *)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v13 = *(void *)(a1 + 24);
    uint64_t v14 = *(void *)(a1 + 32);
    long long aBlock = a2;
    uint64_t v29 = a3;
    v27[0] = v13;
    v27[1] = v14;
    uint64_t v15 = type metadata accessor for Locale();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
    sub_1000055A4();
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v16 = StringProtocol.compare<A>(_:options:range:locale:)();
    sub_1000055F8((uint64_t)v12, &qword_100025A10);
    swift_bridgeObjectRelease();
    if (v16 != 1)
    {
      uint64_t v23 = swift_allocObject();
      *(void *)(v23 + 16) = a4;
      *(void *)(v23 + 24) = a5;
      swift_retain();
      static os_log_type_t.debug.getter();
      sub_100004FFC(&qword_1000259D8);
      uint64_t v24 = swift_allocObject();
      *(_OWORD *)(v24 + 16) = xmmword_10001B180;
      *(void *)(v24 + 56) = &type metadata for String;
      *(void *)(v24 + 64) = sub_10000EDF8();
      *(void *)(v24 + 32) = 0x65736C6166;
      *(void *)(v24 + 40) = 0xE500000000000000;
      sub_10000515C(0, &qword_1000259D0);
      uint64_t v25 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:type:_:)();
      swift_bridgeObjectRelease();

      sub_10000F538((void (*)(void, void, uint64_t))sub_100010398, v23);
      swift_release();
      return swift_release();
    }
    swift_release();
  }
  swift_retain();
  static os_log_type_t.debug.getter();
  sub_100004FFC(&qword_1000259D8);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_10001B180;
  *(void *)(v17 + 56) = &type metadata for String;
  *(void *)(v17 + 64) = sub_10000EDF8();
  *(void *)(v17 + 32) = 1702195828;
  *(void *)(v17 + 40) = 0xE400000000000000;
  sub_10000515C(0, &qword_1000259D0);
  uint64_t v18 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  uint64_t v19 = self;
  NSString v20 = String._bridgeToObjectiveC()();
  if (qword_100025818 != -1) {
    swift_once();
  }
  uint64_t v21 = qword_100026AE8;
  uint64_t v32 = sub_10000C1A4;
  uint64_t v33 = 0;
  long long aBlock = _NSConcreteStackBlock;
  uint64_t v29 = 1107296256;
  BOOL v30 = sub_100012C94;
  uint64_t v31 = &unk_100021150;
  id v22 = _Block_copy(&aBlock);
  [v19 startCatalogDownload:v20 options:v21 then:v22];
  _Block_release(v22);

  a4(0);
  return swift_release();
}

void sub_10000FF0C(void **a1, uint64_t a2, uint64_t a3, void (*a4)(void), uint64_t a5)
{
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a1;
  v10[3] = a2;
  v10[4] = a3;
  v10[5] = a4;
  v10[6] = a5;
  swift_bridgeObjectRetain();
  swift_retain();
  static os_log_type_t.debug.getter();
  sub_10000515C(0, &qword_1000259D0);
  uint64_t v11 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();

  id v12 = objc_allocWithZone((Class)MAAssetQuery);
  NSString v13 = String._bridgeToObjectiveC()();
  id v14 = [v12 initWithType:v13];

  if (v14)
  {
    if (qword_100025880 != -1) {
      swift_once();
    }
    if (qword_100026BA0)
    {
      NSString v15 = String._bridgeToObjectiveC()();
      NSString v16 = String._bridgeToObjectiveC()();
      [v14 addKeyValuePair:v15 with:v16];

      [v14 returnTypes:2];
      static os_log_type_t.info.getter();
      sub_100004FFC(&qword_1000259D8);
      uint64_t v17 = swift_allocObject();
      *(_OWORD *)(v17 + 16) = xmmword_10001B180;
      *(void *)(v17 + 56) = sub_10000515C(0, &qword_100025C88);
      *(void *)(v17 + 64) = sub_1000050A8((unint64_t *)&unk_100025C90, &qword_100025C88);
      *(void *)(v17 + 32) = v14;
      id v18 = v14;
      uint64_t v19 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:type:_:)();
      swift_bridgeObjectRelease();

      NSString v20 = (void *)swift_allocObject();
      v20[2] = v18;
      v20[3] = sub_100010348;
      v20[4] = v10;
      v24[4] = sub_10001186C;
      v24[5] = v20;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 1107296256;
      _DWORD v24[2] = sub_10000C19C;
      v24[3] = &unk_100021128;
      uint64_t v21 = _Block_copy(v24);
      id v22 = v18;
      swift_retain();
      swift_release();
      [v22 queryMetaData:v21];
      _Block_release(v21);
      swift_release();

      return;
    }
  }
  static os_log_type_t.fault.getter();
  uint64_t v23 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();

  sub_10000FAF0(0, a1, a2, a4, a5);

  swift_release();
}

uint64_t sub_100010308()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100010348(uint64_t a1)
{
  return sub_10000FAF0(a1, *(void ***)(v1 + 16), *(void *)(v1 + 24), *(void (**)(void))(v1 + 40), *(void *)(v1 + 48));
}

uint64_t sub_100010358()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100010398(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t))(v3 + 16))(a3);
}

uint64_t sub_1000103C4()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000103FC(uint64_t a1)
{
  return sub_10000E428(a1);
}

uint64_t sub_100010404(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100010420()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

_OWORD *sub_100010460(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100010470(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000104B8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 74, 7);
}

uint64_t sub_100010508(void (*a1)(void), uint64_t a2)
{
  return sub_10000DFBC(a1, a2, v2 + 16);
}

uint64_t sub_100010510(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_100010560()
{
  unint64_t result = qword_100025D48;
  if (!qword_100025D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025D48);
  }
  return result;
}

uint64_t sub_1000105B4(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void))
{
  return a1;
}

uint64_t sub_1000105F8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_10001065C(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return sub_1000105F8(a1, a2);
  }
  return a1;
}

uint64_t sub_10001066C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004FFC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000106D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004FFC(&qword_100025CC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100010738(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = sub_100004FFC(&qword_100025A10);
  uint64_t result = __chkstk_darwin(v4 - 8);
  unsigned int v40 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v7 = *(void *)(a1 + 16);
  if (v7)
  {
    unint64_t v8 = 0;
    uint64_t v9 = a1 + 40;
    uint64_t v10 = _swiftEmptyArrayStorage;
    uint64_t v39 = -(uint64_t)v7;
    uint64_t v36 = a1 + 40;
    unint64_t v37 = v7;
    while (1)
    {
      NSString v38 = v10;
      if (v8 <= v7) {
        unint64_t v11 = v7;
      }
      else {
        unint64_t v11 = v8;
      }
      uint64_t v41 = -(uint64_t)v11;
      for (uint64_t i = (unint64_t *)(v9 + 16 * v8++); ; i += 2)
      {
        if (v41 + v8 == 1)
        {
          __break(1u);
          return result;
        }
        uint64_t v18 = *(i - 1);
        unint64_t v19 = *i;
        uint64_t v13 = *a2;
        unint64_t v14 = a2[1];
        uint64_t v21 = a2[2];
        NSString v20 = (void *)a2[3];
        BOOL v22 = !*a2 && v14 == 0xE000000000000000;
        BOOL v23 = v22;
        if (*((unsigned char *)a2 + 57)) {
          break;
        }
        if (v23 || (_stringCompareWithSmolCheck(_:_:expecting:)())
          && (!v21 && v20 == (void *)0xE000000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
        {
          swift_bridgeObjectRetain();
          uint64_t v13 = 0;
          unint64_t v14 = 0xE000000000000000;
        }
        else if (!v21 && v20 == (void *)0xE000000000000000 {
               || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        }
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        else
        {
          uint64_t v44 = v13;
          unint64_t v45 = v14;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v24._countAndFlagsBits = 46;
          v24._object = (void *)0xE100000000000000;
          String.append(_:)(v24);
          swift_bridgeObjectRetain();
          v25._countAndFlagsBits = v21;
          v25._object = v20;
          String.append(_:)(v25);
          swift_bridgeObjectRelease();
          uint64_t v13 = v44;
          unint64_t v14 = v45;
        }
        uint64_t v44 = v18;
        unint64_t v45 = v19;
        uint64_t v42 = v13;
        unint64_t v43 = v14;
        uint64_t v15 = type metadata accessor for Locale();
        uint64_t v16 = (uint64_t)v40;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v40, 1, 1, v15);
        sub_1000055A4();
        uint64_t v17 = StringProtocol.compare<A>(_:options:range:locale:)();
        sub_1000055F8(v16, &qword_100025A10);
        swift_bridgeObjectRelease();
        if (v17 == -1) {
          goto LABEL_40;
        }
LABEL_9:
        uint64_t result = swift_bridgeObjectRelease();
        ++v8;
        if (v39 + v8 == 1) {
          return (uint64_t)v38;
        }
      }
      if (v23 || (_stringCompareWithSmolCheck(_:_:expecting:)())
        && (!v21 && v20 == (void *)0xE000000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
      {
        swift_bridgeObjectRetain();
        uint64_t v13 = 0;
        unint64_t v14 = 0xE000000000000000;
      }
      else if (!v21 && v20 == (void *)0xE000000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      else
      {
        uint64_t v44 = v13;
        unint64_t v45 = v14;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v26._countAndFlagsBits = 46;
        v26._object = (void *)0xE100000000000000;
        String.append(_:)(v26);
        swift_bridgeObjectRetain();
        v27._countAndFlagsBits = v21;
        v27._object = v20;
        String.append(_:)(v27);
        swift_bridgeObjectRelease();
        uint64_t v13 = v44;
        unint64_t v14 = v45;
      }
      uint64_t v44 = v18;
      unint64_t v45 = v19;
      uint64_t v42 = v13;
      unint64_t v43 = v14;
      uint64_t v28 = type metadata accessor for Locale();
      uint64_t v29 = (uint64_t)v40;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v40, 1, 1, v28);
      sub_1000055A4();
      uint64_t v30 = StringProtocol.compare<A>(_:options:range:locale:)();
      sub_1000055F8(v29, &qword_100025A10);
      swift_bridgeObjectRelease();
      if (v30 == 1) {
        goto LABEL_9;
      }
LABEL_40:
      uint64_t v31 = v38;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v10 = v31;
      uint64_t v46 = v31;
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_10000717C(0, v31[2] + 1, 1);
        uint64_t v10 = v46;
      }
      unint64_t v33 = v10[2];
      unint64_t v32 = v10[3];
      if (v33 >= v32 >> 1)
      {
        uint64_t result = (uint64_t)sub_10000717C((char *)(v32 > 1), v33 + 1, 1);
        uint64_t v10 = v46;
      }
      v10[2] = v33 + 1;
      uint64_t v34 = &v10[2 * v33];
      v34[4] = v18;
      v34[5] = v19;
      uint64_t v9 = v36;
      unint64_t v7 = v37;
      if (!(v39 + v8)) {
        return (uint64_t)v10;
      }
    }
  }
  return (uint64_t)_swiftEmptyArrayStorage;
}

void sub_100010C24()
{
  uint64_t v0 = type metadata accessor for CocoaError.Code();
  uint64_t v1 = *(void **)(v0 - 8);
  __chkstk_darwin(v0);
  long long v3 = (char *)v75 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = type metadata accessor for URL();
  uint64_t v78 = *(void *)(v80 - 8);
  uint64_t v4 = __chkstk_darwin(v80);
  uint64_t v6 = (char *)v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)v75 - v8;
  __chkstk_darwin(v7);
  unint64_t v11 = (char *)v75 - v10;
  static os_log_type_t.info.getter();
  uint64_t v12 = sub_10000515C(0, &qword_1000259D0);
  uint64_t v13 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();

  sub_100004BE4((uint64_t)&v81);
  if ((v82 & 0x2000000000000000) != 0) {
    uint64_t v14 = HIBYTE(v82) & 0xF;
  }
  else {
    uint64_t v14 = v81 & 0xFFFFFFFFFFFFLL;
  }
  if (!v14)
  {
    sub_1000056F4((uint64_t)&v81);
    static os_log_type_t.fault.getter();
    Swift::String v27 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();

    return;
  }
  uint64_t v79 = v1;
  v75[0] = v6;
  static os_log_type_t.debug.getter();
  uint64_t v77 = sub_100004FFC(&qword_1000259D8);
  uint64_t v15 = swift_allocObject();
  long long v76 = xmmword_10001B180;
  *(_OWORD *)(v15 + 16) = xmmword_10001B180;
  uint64_t v16 = sub_100003EB0();
  uint64_t v18 = v17;
  *(void *)(v15 + 56) = &type metadata for String;
  *(void *)(v15 + 64) = sub_10000EDF8();
  *(void *)(v15 + 32) = v16;
  *(void *)(v15 + 40) = v18;
  unint64_t v19 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  NSString v20 = self;
  id v21 = [v20 defaultManager];
  if (qword_100025878 != -1) {
    swift_once();
  }
  NSString v22 = String._bridgeToObjectiveC()();
  *(void *)&long long v83 = 0;
  id v23 = [v21 contentsOfDirectoryAtPath:v22 error:&v83];

  Swift::String v24 = (void *)v83;
  v75[1] = v12;
  if (v23)
  {
    uint64_t v25 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    id v26 = v24;

    uint64_t v79 = (void *)sub_100010738(v25, &v81);
    sub_1000056F4((uint64_t)&v81);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v28 = (id)v83;
    sub_1000056F4((uint64_t)&v81);
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRetain();
    static CocoaError.fileReadNoSuchFile.getter();
    sub_100010470((unint64_t *)&unk_100025D60, (void (*)(uint64_t))&type metadata accessor for CocoaError.Code);
    LOBYTE(v28) = static _ErrorCodeProtocol.~= infix(_:_:)();
    swift_errorRelease();
    ((void (*)(char *, uint64_t))v79[1])(v3, v0);
    if ((v28 & 1) == 0) {
      goto LABEL_33;
    }
    swift_errorRelease();
    uint64_t v79 = _swiftEmptyArrayStorage;
  }
  static os_log_type_t.debug.getter();
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = v76;
  uint64_t v30 = v79;
  uint64_t v31 = v79[2];
  *(void *)(v29 + 56) = &type metadata for Int;
  *(void *)(v29 + 64) = &protocol witness table for Int;
  *(void *)(v29 + 32) = v31;
  unint64_t v32 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  URL.init(fileURLWithPath:)();
  uint64_t v33 = v30[2];
  if (v33)
  {
    uint64_t v34 = (void (**)(char *, uint64_t))(v78 + 8);
    uint64_t v35 = swift_bridgeObjectRetain() + 40;
    while (1)
    {
      swift_bridgeObjectRetain();
      URL.appendingPathComponent(_:)();
      swift_bridgeObjectRelease();
      id v36 = [v20 defaultManager];
      URL._bridgeToObjectiveC()(v37);
      uint64_t v39 = v38;
      *(void *)&long long v83 = 0;
      unsigned int v40 = [v36 removeItemAtURL:v38 error:&v83];

      if (!v40) {
        break;
      }
      v35 += 16;
      uint64_t v41 = *v34;
      id v42 = (id)v83;
      v41(v9, v80);
      if (!--v33)
      {
        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
    }
    id v57 = (id)v83;
    swift_bridgeObjectRelease_n();
    _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v58 = *v34;
    uint64_t v59 = v80;
    (*v34)(v9, v80);
    v58(v11, v59);
    goto LABEL_33;
  }
LABEL_17:
  id v43 = [v20 defaultManager];
  if (qword_100025858 != -1) {
    swift_once();
  }
  NSString v44 = String._bridgeToObjectiveC()();
  *(void *)&long long v83 = 0;
  id v45 = [v43 destinationOfSymbolicLinkAtPath:v44 error:&v83];

  uint64_t v46 = (void *)v83;
  if (v45)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v47 = v46;

    uint64_t v48 = v75[0];
    URL.init(fileURLWithPath:)();
    swift_bridgeObjectRelease();
    uint64_t v49 = URL.lastPathComponent.getter();
    uint64_t v51 = v50;
    uint64_t v52 = *(void (**)(uint64_t, uint64_t))(v78 + 8);
    v52(v48, v80);
    LOBYTE(v49) = sub_10000CCC0(v49, v51, v79);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v49)
    {
      id v53 = [v20 defaultManager];
      NSString v54 = String._bridgeToObjectiveC()();
      *(void *)&long long v83 = 0;
      unsigned int v55 = [v53 removeItemAtPath:v54 error:&v83];

      if (!v55)
      {
        id v70 = (id)v83;
        _convertNSErrorToError(_:)();

        swift_willThrow();
        v52((uint64_t)v11, v80);
        goto LABEL_33;
      }
      id v56 = (id)v83;
    }
  }
  else
  {
    id v60 = (id)v83;
    swift_bridgeObjectRelease();
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease();
  }
  id v61 = [v20 defaultManager];
  if (qword_100025860 != -1) {
    swift_once();
  }
  NSString v62 = String._bridgeToObjectiveC()();
  unsigned int v63 = [v61 fileExistsAtPath:v62];

  if (!v63)
  {
    (*(void (**)(char *, uint64_t))(v78 + 8))(v11, v80);
    return;
  }
  id v64 = [v20 defaultManager];
  NSString v65 = String._bridgeToObjectiveC()();
  *(void *)&long long v83 = 0;
  unsigned int v66 = [v64 removeItemAtPath:v65 error:&v83];

  if (v66)
  {
    uint64_t v67 = *(void (**)(char *, uint64_t))(v78 + 8);
    id v68 = (id)v83;
    v67(v11, v80);
    return;
  }
  id v69 = (id)v83;
  _convertNSErrorToError(_:)();

  swift_willThrow();
  (*(void (**)(char *, uint64_t))(v78 + 8))(v11, v80);
LABEL_33:
  static os_log_type_t.error.getter();
  uint64_t v71 = swift_allocObject();
  *(_OWORD *)(v71 + 16) = v76;
  uint64_t v72 = _convertErrorToNSError(_:)();
  *(void *)(v71 + 56) = sub_10000515C(0, (unint64_t *)&unk_100025CF0);
  *(void *)(v71 + 64) = sub_1000050A8((unint64_t *)&qword_1000259E8, (unint64_t *)&unk_100025CF0);
  *(void *)(v71 + 32) = v72;
  id v73 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  NSString v74 = (void *)_convertErrorToNSError(_:)();
  long long v83 = (unint64_t)v74;
  uint64_t v84 = 0;
  uint64_t v85 = 0;
  char v86 = 2;
  sub_1000118C0(&v83);

  swift_errorRelease();
}

uint64_t getEnumTagSinglePayload for TemporaryDirectoryError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for TemporaryDirectoryError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1000117D0);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000117F8()
{
  return 0;
}

ValueMetadata *type metadata accessor for TemporaryDirectoryError()
{
  return &type metadata for TemporaryDirectoryError;
}

unint64_t sub_100011818()
{
  unint64_t result = qword_100025D70;
  if (!qword_100025D70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025D70);
  }
  return result;
}

uint64_t sub_1000118C0(long long *a1)
{
  sub_1000122DC(a1, (uint64_t)&v38);
  int v2 = v38;
  uint64_t result = sub_1000122DC(a1, (uint64_t)&v39);
  switch(v40)
  {
    case 0:
      sub_100004FFC((uint64_t *)&unk_100025D10);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_10001B160;
      *(void *)(inited + 32) = 0x6973726556646C6FLL;
      *(void *)(inited + 40) = 0xEA00000000006E6FLL;
      *(void *)(inited + 48) = String._bridgeToObjectiveC()();
      *(void *)(inited + 56) = 0x697372655677656ELL;
      *(void *)(inited + 64) = 0xEA00000000006E6FLL;
      *(void *)(inited + 72) = String._bridgeToObjectiveC()();
      sub_100012904(inited);
      uint64_t v5 = 0x7463417465737361;
      unsigned int v6 = 1952544361;
      goto LABEL_4;
    case 1:
      sub_100004FFC((uint64_t *)&unk_100025D10);
      uint64_t v7 = swift_initStackObject();
      *(_OWORD *)(v7 + 16) = xmmword_10001B160;
      *(void *)(v7 + 32) = 0x6973726556646C6FLL;
      *(void *)(v7 + 40) = 0xEA00000000006E6FLL;
      *(void *)(v7 + 48) = String._bridgeToObjectiveC()();
      *(void *)(v7 + 56) = 0x697372655677656ELL;
      *(void *)(v7 + 64) = 0xEA00000000006E6FLL;
      *(void *)(v7 + 72) = String._bridgeToObjectiveC()();
      sub_100012904(v7);
      uint64_t v5 = 0x736E497465737361;
      unsigned int v6 = 1819042164;
LABEL_4:
      sub_1000120B0(v5, (void *)(v6 | 0xEE00646500000000));
      return swift_bridgeObjectRelease();
    case 2:
      id v8 = v2;
      unint64_t v9 = sub_100011EF8();
      unint64_t v10 = v9;
      if (!(v9 >> 62))
      {
        uint64_t v11 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v11) {
          goto LABEL_7;
        }
LABEL_25:
        swift_bridgeObjectRelease();
        uint64_t v36 = (uint64_t)a1;
        return sub_1000122F4(v36);
      }
      uint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
      if (!v11) {
        goto LABEL_25;
      }
LABEL_7:
      unint64_t v37 = a1;
      if (v11 < 1)
      {
        __break(1u);
        goto LABEL_28;
      }
      uint64_t v12 = 0;
      do
      {
        if ((v10 & 0xC000000000000001) != 0) {
          id v13 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id v13 = *(id *)(v10 + 8 * v12 + 32);
        }
        uint64_t v14 = v13;
        ++v12;
        sub_100004FFC((uint64_t *)&unk_100025D10);
        uint64_t v15 = swift_initStackObject();
        *(_OWORD *)(v15 + 16) = xmmword_10001B180;
        *(void *)(v15 + 32) = 0x726F727265;
        *(void *)(v15 + 40) = 0xE500000000000000;
        id v16 = [v14 domain];
        static String._unconditionallyBridgeFromObjectiveC(_:)();

        v17._countAndFlagsBits = 58;
        v17._object = (void *)0xE100000000000000;
        String.append(_:)(v17);
        [v14 code];
        v18._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
        String.append(_:)(v18);
        swift_bridgeObjectRelease();
        NSString v19 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        *(void *)(v15 + 48) = v19;
        sub_100012904(v15);
        _StringGuts.grow(_:)(27);
        swift_bridgeObjectRelease();
        NSString v20 = String._bridgeToObjectiveC()();
        sub_10000515C(0, (unint64_t *)&unk_100025F80);
        Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
        AnalyticsSendEvent();

        swift_bridgeObjectRelease();
      }
      while (v11 != v12);
LABEL_21:
      swift_bridgeObjectRelease();
      uint64_t v36 = (uint64_t)v37;
      return sub_1000122F4(v36);
    case 3:
      id v22 = v2;
      unint64_t v23 = sub_100011EF8();
      unint64_t v24 = v23;
      if (v23 >> 62)
      {
        uint64_t v25 = _CocoaArrayWrapper.endIndex.getter();
        if (!v25) {
          goto LABEL_25;
        }
      }
      else
      {
        uint64_t v25 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (!v25) {
          goto LABEL_25;
        }
      }
      unint64_t v37 = a1;
      if (v25 >= 1)
      {
        uint64_t v26 = 0;
        do
        {
          if ((v24 & 0xC000000000000001) != 0) {
            id v27 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else {
            id v27 = *(id *)(v24 + 8 * v26 + 32);
          }
          id v28 = v27;
          ++v26;
          sub_100004FFC((uint64_t *)&unk_100025D10);
          uint64_t v29 = swift_initStackObject();
          *(_OWORD *)(v29 + 16) = xmmword_10001B180;
          *(void *)(v29 + 32) = 0x726F727265;
          *(void *)(v29 + 40) = 0xE500000000000000;
          id v30 = [v28 domain];
          static String._unconditionallyBridgeFromObjectiveC(_:)();

          v31._countAndFlagsBits = 58;
          v31._object = (void *)0xE100000000000000;
          String.append(_:)(v31);
          [v28 code];
          v32._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
          String.append(_:)(v32);
          swift_bridgeObjectRelease();
          NSString v33 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease();
          *(void *)(v29 + 48) = v33;
          sub_100012904(v29);
          _StringGuts.grow(_:)(27);
          swift_bridgeObjectRelease();
          NSString v34 = String._bridgeToObjectiveC()();
          sub_10000515C(0, (unint64_t *)&unk_100025F80);
          Class v35 = Dictionary._bridgeToObjectiveC()().super.isa;
          AnalyticsSendEvent();

          swift_bridgeObjectRelease();
        }
        while (v25 != v26);
        goto LABEL_21;
      }
LABEL_28:
      __break(1u);
      JUMPOUT(0x100011EE8);
    default:
      return result;
  }
}

uint64_t sub_100011EF8()
{
  uint64_t v1 = v0;
  id v2 = [v0 userInfo];
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (!*(void *)(v3 + 16) || (unint64_t v6 = sub_1000168EC(v4, v5), (v7 & 1) == 0))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_10000916C(*(void *)(v3 + 56) + 32 * v6, (uint64_t)&v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v17 + 1))
  {
LABEL_7:
    sub_1000123D0((uint64_t)&v16);
    goto LABEL_8;
  }
  sub_10000515C(0, (unint64_t *)&unk_100025CF0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    sub_100004FFC((uint64_t *)&unk_100025D80);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_10001B3D0;
    *(void *)(v12 + 32) = v1;
    *(void *)&long long v16 = v12;
    specialized Array._endMutation()();
    uint64_t v11 = v16;
    id v13 = v1;
    return v11;
  }
  sub_100004FFC((uint64_t *)&unk_100025D80);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_10001B3D0;
  *(void *)(v8 + 32) = v1;
  *(void *)&long long v16 = v8;
  specialized Array._endMutation()();
  uint64_t v9 = v16;
  unint64_t v10 = sub_100011EF8(v1);
  *(void *)&long long v16 = v9;
  sub_100006D80(v10);

  return v16;
}

void sub_1000120B0(uint64_t a1, void *a2)
{
  _StringGuts.grow(_:)(27);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = a1;
  v4._object = a2;
  String.append(_:)(v4);
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  sub_10000515C(0, (unint64_t *)&unk_100025F80);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  AnalyticsSendEvent();
}

void (*sub_1000121A4(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100012254(v6, a2, a3);
  return sub_10001220C;
}

void sub_10001220C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_100012254(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
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
    return sub_1000122D4;
  }
  __break(1u);
  return result;
}

void sub_1000122D4(id *a1)
{
}

uint64_t sub_1000122DC(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(unsigned char *)(a2 + 32) = *((unsigned char *)a1 + 32);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1000122F4(uint64_t a1)
{
  return a1;
}

void sub_10001232C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 0:
    case 1:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      break;
    case 2:
    case 3:

      break;
    default:
      return;
  }
}

uint64_t sub_1000123D0(uint64_t a1)
{
  uint64_t v2 = sub_100004FFC((uint64_t *)&unk_100025CD0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_100012430(id result, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 0:
    case 1:
      swift_bridgeObjectRetain();
      uint64_t result = (id)swift_bridgeObjectRetain();
      break;
    case 2:
    case 3:
      uint64_t result = result;
      break;
    default:
      return result;
  }
  return result;
}

void destroy for TZLogEvent(uint64_t a1)
{
}

uint64_t initializeWithCopy for TZLogEvent(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_100012430(*(id *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for TZLogEvent(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  sub_100012430(*(id *)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void **)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  char v12 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v7;
  sub_10001232C(v8, v9, v10, v11, v12);
  return a1;
}

__n128 initializeWithTake for TZLogEvent(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for TZLogEvent(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void **)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  char v9 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v3;
  sub_10001232C(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for TZLogEvent(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFB && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 251);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 5) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TZLogEvent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 251;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFB) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1000126B0(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_1000126B8(uint64_t result, char a2)
{
  *(unsigned char *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for TZLogEvent()
{
  return &type metadata for TZLogEvent;
}

uint64_t initializeBufferWithCopyOfBuffer for TZError(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)__n128 result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for TZError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TZError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)__n128 result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_100012770(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 2u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_100012788(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)__n128 result = a2 - 3;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for TZError()
{
  return &type metadata for TZError;
}

uint64_t sub_1000127B0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_1000127F4(uint64_t a1)
{
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = __CocoaSet.startIndex.getter();
    uint64_t v5 = v4;
    __CocoaSet.endIndex.getter();
    char v6 = static __CocoaSet.Index.== infix(_:_:)();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_100017C0C(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_100016D1C(v3, v5, v2 != 0, a1);
    uint64_t v7 = v11;
    sub_100017C0C(v3, v5, v2 != 0);
    return v7;
  }
  uint64_t result = sub_100016F94(a1);
  if ((v10 & 1) == 0)
  {
    uint64_t v5 = v9;
    if (*(_DWORD *)(a1 + 36) == v9)
    {
      uint64_t v3 = result;
      if (result == 1 << *(unsigned char *)(a1 + 32)) {
        goto LABEL_3;
      }
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_100012904(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004FFC((uint64_t *)&unk_100026020);
  unint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
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
    unint64_t result = sub_1000168EC(v5, v6);
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

unint64_t sub_100012A20(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004FFC(&qword_100025D40);
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
    sub_10001066C(v6, (uint64_t)&v13, &qword_100026030);
    uint64_t v7 = v13;
    unint64_t result = sub_100016964(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_100010460(&v14, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_100012B50(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004FFC(&qword_100025FA0);
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
    sub_10001066C(v6, (uint64_t)v15, &qword_100025FA8);
    unint64_t result = sub_1000168A8((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_100010460(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_100012C94(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

id sub_100012CE8()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for Daemon()) init];
  qword_100026B00 = (uint64_t)result;
  return result;
}

void sub_100012D18()
{
  id v1 = objc_allocWithZone((Class)IDSService);
  uint64_t v2 = v0;
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v1 initWithService:v3];

  if (v4)
  {
    *(void *)&v2[OBJC_IVAR____TtC3tzd6Daemon_companionService] = v4;
    id v5 = objc_allocWithZone((Class)UNUserNotificationCenter);
    NSString v6 = String._bridgeToObjectiveC()();
    id v7 = [v5 initWithBundleIdentifier:v6];

    *(void *)&v2[OBJC_IVAR____TtC3tzd6Daemon_notificationCenter] = v7;
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v8 = objc_allocWithZone((Class)NSXPCListener);
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v10 = [v8 initWithMachServiceName:v9];

    *(void *)&v2[OBJC_IVAR____TtC3tzd6Daemon_listener] = v10;
    *(_WORD *)&v2[OBJC_IVAR____TtC3tzd6Daemon_assetDetectedType] = 0;

    v21.receiver = v2;
    v21.super_class = (Class)type metadata accessor for Daemon();
    long long v11 = (char *)[super init];
    uint64_t v12 = *(void **)&v11[OBJC_IVAR____TtC3tzd6Daemon_listener];
    BOOL v13 = v11;
    [v12 setDelegate:v13];
    uint64_t v14 = *(void **)&v13[OBJC_IVAR____TtC3tzd6Daemon_notificationCenter];
    [v14 setDelegate:v13];
    [v14 setWantsNotificationResponsesDelivered];
    static os_log_type_t.debug.getter();
    sub_100004FFC(&qword_1000259D8);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_10001B180;
    if (qword_100025820 != -1) {
      swift_once();
    }
    int v16 = byte_100026AF0;
    unint64_t v17 = sub_10000EDF8();
    uint64_t v18 = 29545;
    if (!v16) {
      uint64_t v18 = 0x746F6E207369;
    }
    unint64_t v19 = 0xE600000000000000;
    *(void *)(v15 + 56) = &type metadata for String;
    *(void *)(v15 + 64) = v17;
    if (v16) {
      unint64_t v19 = 0xE200000000000000;
    }
    *(void *)(v15 + 32) = v18;
    *(void *)(v15 + 40) = v19;
    sub_10000515C(0, &qword_1000259D0);
    NSString v20 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

void sub_100013010()
{
  sub_100014E04();
  sub_10001701C();
  sub_10000515C(0, (unint64_t *)&unk_100025C00);
  id v1 = static OS_dispatch_queue.main.getter();
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  uint64_t v15 = sub_1000188CC;
  uint64_t v16 = v2;
  long long v11 = _NSConcreteStackBlock;
  uint64_t v12 = 1107296256;
  BOOL v13 = sub_100013D54;
  uint64_t v14 = &unk_100021670;
  NSString v3 = _Block_copy(&v11);
  id v4 = v0;
  swift_release();
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v1, v3);
  _Block_release(v3);

  [*(id *)&v4[OBJC_IVAR____TtC3tzd6Daemon_listener] resume];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v15 = sub_1000188D4;
  uint64_t v16 = v5;
  long long v11 = _NSConcreteStackBlock;
  uint64_t v12 = 1107296256;
  BOOL v13 = sub_100013D54;
  uint64_t v14 = &unk_1000216C0;
  NSString v6 = _Block_copy(&v11);
  id v7 = v4;
  swift_release();
  xpc_activity_register("com.apple.timezoneupdates.local-asset-check", XPC_ACTIVITY_CHECK_IN, v6);
  _Block_release(v6);
  uint64_t v15 = sub_100014AEC;
  uint64_t v16 = 0;
  long long v11 = _NSConcreteStackBlock;
  uint64_t v12 = 1107296256;
  BOOL v13 = sub_100013D54;
  uint64_t v14 = &unk_1000216E8;
  id v8 = _Block_copy(&v11);
  xpc_activity_register("com.apple.timezoneupdates.stale-data-cleanup", XPC_ACTIVITY_CHECK_IN, v8);
  _Block_release(v8);
  static os_log_type_t.debug.getter();
  sub_10000515C(0, &qword_1000259D0);
  NSString v9 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();

  id v10 = [self mainRunLoop];
  [v10 run];
}

void sub_1000132F0(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DispatchQoS();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  long long v11 = (char *)v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (xpc_dictionary_get_string(a1, _xpc_event_key_name))
  {
    uint64_t v38 = v5;
    uint64_t v39 = a2;
    uint64_t v36 = v9;
    uint64_t v37 = v8;
    uint64_t v12 = String.init(cString:)();
    uint64_t v14 = v13;
    static os_log_type_t.debug.getter();
    v35[1] = sub_100004FFC(&qword_1000259D8);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_10001B160;
    xpc_type_t type = xpc_get_type(a1);
    *(void *)(v15 + 56) = &type metadata for OpaquePointer;
    *(void *)(v15 + 64) = &protocol witness table for OpaquePointer;
    *(void *)(v15 + 32) = type;
    *(void *)(v15 + 96) = &type metadata for String;
    unint64_t v17 = sub_10000EDF8();
    *(void *)(v15 + 104) = v17;
    *(void *)(v15 + 72) = v12;
    *(void *)(v15 + 80) = v14;
    sub_10000515C(0, &qword_1000259D0);
    swift_bridgeObjectRetain();
    uint64_t v18 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    if (v12 == 0xD00000000000003FLL && v14 == 0x800000010001CB40
      || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      uint64_t v20 = v37;
      uint64_t v19 = v38;
      uint64_t v21 = v36;
      sub_10000515C(0, (unint64_t *)&unk_100025C00);
      id v22 = (void *)static OS_dispatch_queue.main.getter();
      uint64_t v23 = swift_allocObject();
      unint64_t v24 = (void *)v39;
      *(void *)(v23 + 16) = v39;
      NSString v44 = sub_100018954;
      uint64_t v45 = v23;
      long long aBlock = _NSConcreteStackBlock;
      uint64_t v41 = 1107296256;
      id v42 = sub_1000127B0;
      id v43 = &unk_100021828;
      uint64_t v25 = _Block_copy(&aBlock);
      id v26 = v24;
      swift_release();
      static DispatchQoS.unspecified.getter();
      long long aBlock = (void **)_swiftEmptyArrayStorage;
      sub_100009288();
      sub_100004FFC((uint64_t *)&unk_100025C10);
      sub_100017C9C();
      dispatch thunk of SetAlgebra.init<A>(_:)();
      OS_dispatch_queue.async(group:qos:flags:execute:)();
      _Block_release(v25);

      (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v4);
      (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v20);
    }
    else if (v12 == 0xD00000000000003BLL && v14 == 0x800000010001CB80 {
           || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    }
    {
      swift_bridgeObjectRelease();
      sub_10000515C(0, (unint64_t *)&unk_100025C00);
      id v28 = (void *)static OS_dispatch_queue.main.getter();
      uint64_t v29 = swift_allocObject();
      id v30 = (void *)v39;
      *(void *)(v29 + 16) = v39;
      NSString v44 = sub_10001894C;
      uint64_t v45 = v29;
      long long aBlock = _NSConcreteStackBlock;
      uint64_t v41 = 1107296256;
      id v42 = sub_1000127B0;
      id v43 = &unk_1000217D8;
      Swift::String v31 = _Block_copy(&aBlock);
      id v32 = v30;
      swift_release();
      static DispatchQoS.unspecified.getter();
      long long aBlock = (void **)_swiftEmptyArrayStorage;
      sub_100009288();
      sub_100004FFC((uint64_t *)&unk_100025C10);
      sub_100017C9C();
      dispatch thunk of SetAlgebra.init<A>(_:)();
      OS_dispatch_queue.async(group:qos:flags:execute:)();
      _Block_release(v31);

      (*(void (**)(char *, uint64_t))(v38 + 8))(v7, v4);
      (*(void (**)(char *, uint64_t))(v36 + 8))(v11, v37);
    }
    else
    {
      static os_log_type_t.fault.getter();
      uint64_t v33 = swift_allocObject();
      *(_OWORD *)(v33 + 16) = xmmword_10001B180;
      *(void *)(v33 + 56) = &type metadata for String;
      *(void *)(v33 + 64) = v17;
      *(void *)(v33 + 32) = v12;
      *(void *)(v33 + 40) = v14;
      uint64_t v39 = static OS_os_log.default.getter();
      os_log(_:dso:log:type:_:)();
      swift_bridgeObjectRelease();
      NSString v34 = (void *)v39;
    }
  }
  else
  {
    static os_log_type_t.fault.getter();
    sub_100004FFC(&qword_1000259D8);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_10001B180;
    long long aBlock = (void **)a1;
    swift_unknownObjectRetain();
    sub_100004FFC(&qword_100026038);
    sub_100004FFC(&qword_100026040);
    swift_dynamicCast();
    sub_10000515C(0, &qword_1000259D0);
    id v27 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1000139FC(void *a1)
{
  static os_log_type_t.debug.getter();
  sub_10000515C(0, &qword_1000259D0);
  uint64_t v2 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();

  uint64_t v3 = os_transaction_create();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = a1;
  swift_unknownObjectRetain_n();
  id v5 = a1;
  static os_log_type_t.debug.getter();
  sub_100004FFC(&qword_1000259D8);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10001B180;
  *(void *)(v6 + 56) = &type metadata for String;
  *(void *)(v6 + 64) = sub_10000EDF8();
  *(void *)(v6 + 32) = 0x65736C6166;
  *(void *)(v6 + 40) = 0xE500000000000000;
  id v7 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  sub_10000F538((void (*)(void, void, uint64_t))sub_100011898, v4);
  swift_unknownObjectRelease_n();

  return swift_release();
}

uint64_t sub_100013BA8(void *a1)
{
  static os_log_type_t.debug.getter();
  sub_10000515C(0, &qword_1000259D0);
  uint64_t v2 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();

  uint64_t v3 = os_transaction_create();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = a1;
  swift_unknownObjectRetain_n();
  id v5 = a1;
  static os_log_type_t.debug.getter();
  sub_100004FFC(&qword_1000259D8);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10001B180;
  *(void *)(v6 + 56) = &type metadata for String;
  *(void *)(v6 + 64) = sub_10000EDF8();
  *(void *)(v6 + 32) = 0x65736C6166;
  *(void *)(v6 + 40) = 0xE500000000000000;
  id v7 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  sub_10000F538((void (*)(void, void, uint64_t))sub_100011898, v4);
  swift_unknownObjectRelease_n();

  return swift_release();
}

uint64_t sub_100013D54(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_100013DB4(char a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a2;
  *(void *)(v5 + 24) = v2;
  swift_unknownObjectRetain_n();
  id v6 = v2;
  static os_log_type_t.debug.getter();
  sub_100004FFC(&qword_1000259D8);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10001B180;
  unint64_t v8 = sub_10000EDF8();
  uint64_t v9 = 1702195828;
  if ((a1 & 1) == 0) {
    uint64_t v9 = 0x65736C6166;
  }
  unint64_t v10 = 0xE500000000000000;
  *(void *)(v7 + 56) = &type metadata for String;
  *(void *)(v7 + 64) = v8;
  if (a1) {
    unint64_t v10 = 0xE400000000000000;
  }
  *(void *)(v7 + 32) = v9;
  *(void *)(v7 + 40) = v10;
  sub_10000515C(0, &qword_1000259D0);
  long long v11 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  if (a1)
  {
    uint64_t v12 = self;
    NSString v13 = String._bridgeToObjectiveC()();
    if (qword_100025818 != -1) {
      swift_once();
    }
    uint64_t v14 = qword_100026AE8;
    v17[4] = sub_10000C1A4;
    v17[5] = 0;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 1107296256;
    v17[2] = sub_100012C94;
    v17[3] = &unk_1000214E0;
    uint64_t v15 = _Block_copy(v17);
    [v12 startCatalogDownload:v13 options:v14 then:v15];
    _Block_release(v15);

    static os_log_type_t.debug.getter();
    uint64_t v16 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
    sub_10000F538(sub_10000EE68, v5);
    swift_unknownObjectRelease();
    swift_release();
  }
}

void sub_10001406C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a3)
  {
    swift_errorRetain();
    static os_log_type_t.error.getter();
    sub_100004FFC(&qword_1000259D8);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_10001B180;
    uint64_t v6 = _convertErrorToNSError(_:)();
    *(void *)(v5 + 56) = sub_10000515C(0, (unint64_t *)&unk_100025CF0);
    *(void *)(v5 + 64) = sub_100017B64((unint64_t *)&qword_1000259E8, (unint64_t *)&unk_100025CF0);
    *(void *)(v5 + 32) = v6;
    sub_10000515C(0, &qword_1000259D0);
    uint64_t v7 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    swift_errorRelease();
    if (!a2) {
      return;
    }
  }
  else
  {
    static os_log_type_t.debug.getter();
    sub_10000515C(0, &qword_1000259D0);
    unint64_t v8 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();

    if (!a2) {
      return;
    }
  }
  sub_1000160FC(a1, a2);
}

uint64_t sub_10001422C(void (*a1)(uint64_t (*)(), uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a3;
  swift_unknownObjectRetain();
  a1(nullsub_1, v5);

  return swift_release();
}

uint64_t sub_100014314(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v22 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DispatchQoS();
  uint64_t v20 = *(void *)(v9 - 8);
  uint64_t v21 = v9;
  __chkstk_darwin(v9);
  long long v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static os_log_type_t.debug.getter();
  sub_10000515C(0, &qword_1000259D0);
  uint64_t v12 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();

  uint64_t v13 = os_transaction_create();
  sub_10000515C(0, (unint64_t *)&unk_100025C00);
  uint64_t v14 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v15 = (void *)swift_allocObject();
  _OWORD v15[2] = v3;
  v15[3] = a1;
  v15[4] = a2;
  v15[5] = v13;
  aBlock[4] = sub_100017C68;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000127B0;
  aBlock[3] = &unk_100021490;
  uint64_t v16 = _Block_copy(aBlock);
  id v17 = v3;
  sub_100017C8C(a1);
  swift_unknownObjectRetain();
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_100009288();
  sub_100004FFC((uint64_t *)&unk_100025C10);
  sub_100017C9C();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v16);
  swift_unknownObjectRelease();

  (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v11, v21);
}

void sub_100014634(uint64_t a1, void (*a2)(BOOL), uint64_t a3, uint64_t a4)
{
  BOOL v6 = sub_100017E50();
  if (a2)
  {
    a2(v6);
    sub_100013DB4(1, a4);
  }
  else
  {
    __break(1u);
  }
}

xpc_activity_state_t sub_1000147C8(_xpc_activity_s *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DispatchQoS();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  long long v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  xpc_activity_state_t result = xpc_activity_get_state(a1);
  if (result == 2)
  {
    static os_log_type_t.info.getter();
    uint64_t v20 = v5;
    sub_10000515C(0, &qword_1000259D0);
    uint64_t v13 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();

    uint64_t v14 = os_transaction_create();
    sub_10000515C(0, (unint64_t *)&unk_100025C00);
    uint64_t v15 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = a2;
    *(void *)(v16 + 24) = v14;
    aBlock[4] = sub_100018920;
    aBlock[5] = v16;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000127B0;
    aBlock[3] = &unk_100021788;
    id v17 = _Block_copy(aBlock);
    id v18 = a2;
    swift_unknownObjectRetain();
    swift_release();
    static DispatchQoS.unspecified.getter();
    aBlock[0] = _swiftEmptyArrayStorage;
    sub_100009288();
    sub_100004FFC((uint64_t *)&unk_100025C10);
    sub_100017C9C();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v17);
    swift_unknownObjectRelease();

    (*(void (**)(char *, uint64_t))(v20 + 8))(v7, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return result;
}

xpc_activity_state_t sub_100014AEC(_xpc_activity_s *a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  xpc_activity_state_t result = xpc_activity_get_state(a1);
  if (result == 2)
  {
    static os_log_type_t.info.getter();
    uint64_t v17 = v3;
    sub_10000515C(0, &qword_1000259D0);
    long long v11 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();

    uint64_t v12 = os_transaction_create();
    sub_10000515C(0, (unint64_t *)&unk_100025C00);
    uint64_t v13 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v12;
    aBlock[4] = sub_1000188DC;
    aBlock[5] = v14;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000127B0;
    aBlock[3] = &unk_100021738;
    uint64_t v15 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_release();
    static DispatchQoS.unspecified.getter();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_100009288();
    sub_100004FFC((uint64_t *)&unk_100025C10);
    sub_100017C9C();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v15);
    swift_unknownObjectRelease();

    (*(void (**)(char *, uint64_t))(v17 + 8))(v5, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return result;
}

void sub_100014E04()
{
  uint64_t v1 = v0;
  sub_10000515C(0, (unint64_t *)&unk_100025FC0);
  id v2 = [(id)swift_getObjCClassFromMetadata() options];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    *(void *)&long long v15 = 0x496567617373654DLL;
    *((void *)&v15 + 1) = 0xE900000000000044;
    AnyHashable.init<A>(_:)();
    if (*(void *)(v4 + 16) && (unint64_t v5 = sub_1000168A8((uint64_t)v14), (v6 & 1) != 0))
    {
      sub_10000916C(*(void *)(v4 + 56) + 32 * v5, (uint64_t)&v12);
    }
    else
    {
      long long v12 = 0u;
      long long v13 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((void *)&v13 + 1))
    {
      sub_10000FA9C((uint64_t)v14);
      sub_100010460(&v12, &v15);
      swift_dynamicCast();
      *(_WORD *)(v1 + OBJC_IVAR____TtC3tzd6Daemon_assetDetectedType) = v11;
      uint64_t v7 = OBJC_IVAR____TtC3tzd6Daemon_companionService;
      [*(id *)(v1 + OBJC_IVAR____TtC3tzd6Daemon_companionService) setProtobufAction:@"handleAssetDetectedMsg:" forIncomingRequestsOfType:@"handleAssetDetectedMsg:"];
      uint64_t v8 = *(void **)(v1 + v7);
      sub_10000515C(0, (unint64_t *)&unk_100025C00);
      id v9 = v8;
      uint64_t v10 = (void *)static OS_dispatch_queue.main.getter();
      [v9 addDelegate:v1 queue:v10];

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_100014FC4(uint64_t a1, unint64_t a2, unsigned __int16 a3, uint64_t a4)
{
  sub_100004FFC(&qword_100025F60);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10001B180;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v9;
  Swift::Int v10 = sub_100017968(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  uint64_t v11 = OBJC_IVAR____TtC3tzd6Daemon_companionService;
  id v12 = [*(id *)(v4 + OBJC_IVAR____TtC3tzd6Daemon_companionService) accounts];
  if (!v12) {
    __break(1u);
  }
  long long v13 = v12;
  sub_10000515C(0, &qword_100025F68);
  sub_100017B64(&qword_100025F70, &qword_100025F68);
  uint64_t v14 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  long long v15 = (void *)sub_1000127F4(v14);
  swift_bridgeObjectRelease();
  if (!v15) {
    goto LABEL_8;
  }
  id v16 = objc_allocWithZone((Class)IDSProtobuf);
  sub_100017B0C(a1, a2);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_1000165DC(a1, a2);
  id v18 = [v16 initWithProtobufData:isa type:a3 isResponse:0];

  if (!v18)
  {

LABEL_8:
    swift_bridgeObjectRelease();
    return;
  }
  id v19 = *(id *)(v4 + v11);
  id v20 = v18;
  id v21 = v15;
  sub_100015668(v10);
  swift_bridgeObjectRelease();
  Class v22 = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  sub_100004FFC(&qword_100025F78);
  uint64_t v23 = swift_initStackObject();
  *(_OWORD *)(v23 + 16) = xmmword_10001B180;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v43[1] = v24;
  AnyHashable.init<A>(_:)();
  *(void *)(v23 + 96) = &type metadata for Double;
  *(void *)(v23 + 72) = 0x410FA40000000000;
  sub_100012B50(v23);
  Class v25 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v42 = 0;
  v43[0] = 0;
  unsigned __int8 v26 = [v19 sendProtobuf:v20 fromAccount:v21 toDestinations:v22 priority:a4 options:v25 identifier:v43 error:&v42];

  id v27 = (void *)v43[0];
  if (v26)
  {
    id v28 = v42;
    id v29 = v27;
    static os_log_type_t.debug.getter();
    sub_100004FFC(&qword_1000259D8);
    uint64_t v30 = swift_allocObject();
    *(_OWORD *)(v30 + 16) = xmmword_10001B160;
    Class v31 = Data._bridgeToObjectiveC()().super.isa;
    *(void *)(v30 + 56) = sub_10000515C(0, (unint64_t *)&unk_100025F80);
    *(void *)(v30 + 64) = sub_100017B64((unint64_t *)&qword_100025D00, (unint64_t *)&unk_100025F80);
    *(void *)(v30 + 32) = v31;
    if (v29)
    {
      *(void *)(v30 + 96) = sub_10000515C(0, &qword_100025F90);
      *(void *)(v30 + 104) = sub_100017B64(&qword_100025F98, &qword_100025F90);
      *(void *)(v30 + 72) = v29;
      sub_10000515C(0, &qword_1000259D0);
      id v32 = v29;
      uint64_t v33 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:type:_:)();

      swift_bridgeObjectRelease();
      return;
    }
    __break(1u);
    goto LABEL_14;
  }
  id v34 = v42;
  id v35 = v27;
  _convertNSErrorToError(_:)();

  swift_willThrow();
  static os_log_type_t.info.getter();
  sub_100004FFC(&qword_1000259D8);
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_10001B150;
  Class v37 = Data._bridgeToObjectiveC()().super.isa;
  *(void *)(v36 + 56) = sub_10000515C(0, (unint64_t *)&unk_100025F80);
  *(void *)(v36 + 64) = sub_100017B64((unint64_t *)&qword_100025D00, (unint64_t *)&unk_100025F80);
  *(void *)(v36 + 32) = v37;
  if (!v35)
  {
LABEL_14:
    __break(1u);
    return;
  }
  *(void *)(v36 + 96) = sub_10000515C(0, &qword_100025F90);
  *(void *)(v36 + 104) = sub_100017B64(&qword_100025F98, &qword_100025F90);
  *(void *)(v36 + 72) = v35;
  id v38 = v35;
  uint64_t v39 = _convertErrorToNSError(_:)();
  *(void *)(v36 + 136) = sub_10000515C(0, (unint64_t *)&unk_100025CF0);
  *(void *)(v36 + 144) = sub_100017B64((unint64_t *)&qword_1000259E8, (unint64_t *)&unk_100025CF0);
  *(void *)(v36 + 112) = v39;
  sub_10000515C(0, &qword_1000259D0);
  char v40 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  swift_errorRelease();
}

uint64_t sub_100015668(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100004FFC((uint64_t *)&unk_100025FB0);
    id v2 = (void *)static _SetStorage.allocate(capacity:)();
  }
  else
  {
    id v2 = &_swiftEmptySetSingleton;
  }
  uint64_t v3 = a1 + 56;
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v5 = -1;
  }
  uint64_t v6 = v5 & *(void *)(a1 + 56);
  int64_t v7 = (unint64_t)(63 - v4) >> 6;
  uint64_t v8 = (char *)(v2 + 7);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v6)
    {
      v6 &= v6 - 1;
      goto LABEL_28;
    }
    int64_t v13 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v7) {
      goto LABEL_37;
    }
    uint64_t v14 = *(void *)(v3 + 8 * v13);
    int64_t v15 = v10 + 1;
    if (!v14)
    {
      int64_t v15 = v10 + 2;
      if (v10 + 2 >= v7) {
        goto LABEL_37;
      }
      uint64_t v14 = *(void *)(v3 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v10 + 3;
        if (v10 + 3 >= v7) {
          goto LABEL_37;
        }
        uint64_t v14 = *(void *)(v3 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v10 + 4;
          if (v10 + 4 >= v7) {
            goto LABEL_37;
          }
          uint64_t v14 = *(void *)(v3 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    uint64_t v6 = (v14 - 1) & v14;
    int64_t v10 = v15;
LABEL_28:
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    uint64_t result = AnyHashable._rawHashValue(seed:)(v2[5]);
    uint64_t v17 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v18 = result & ~v17;
    unint64_t v19 = v18 >> 6;
    if (((-1 << v18) & ~*(void *)&v8[8 * (v18 >> 6)]) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v18) & ~*(void *)&v8[8 * (v18 >> 6)])) | v18 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v20 = 0;
      unint64_t v21 = (unint64_t)(63 - v17) >> 6;
      do
      {
        if (++v19 == v21 && (v20 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v22 = v19 == v21;
        if (v19 == v21) {
          unint64_t v19 = 0;
        }
        v20 |= v22;
        uint64_t v23 = *(void *)&v8[8 * v19];
      }
      while (v23 == -1);
      unint64_t v11 = __clz(__rbit64(~v23)) + (v19 << 6);
    }
    *(void *)&v8[(v11 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v11;
    uint64_t v12 = v2[6] + 40 * v11;
    *(_OWORD *)uint64_t v12 = v24;
    *(_OWORD *)(v12 + 16) = v25;
    *(void *)(v12 + 32) = v26;
    ++v2[2];
  }
  int64_t v16 = v10 + 5;
  if (v10 + 5 >= v7)
  {
LABEL_37:
    swift_release();
    sub_100017C04();
    return (uint64_t)v2;
  }
  uint64_t v14 = *(void *)(v3 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v10 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v7) {
      goto LABEL_37;
    }
    uint64_t v14 = *(void *)(v3 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_100015B08(void *a1)
{
  uint64_t v2 = os_transaction_create();
  if (a1 && (id v3 = [a1 assetVersion]) != 0)
  {
    uint64_t v4 = v3;
    uint64_t v5 = (void **)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  uint64_t v8 = type metadata accessor for TZSAsset();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v2;
  swift_unknownObjectRetain_n();
  static os_log_type_t.debug.getter();
  sub_100004FFC(&qword_1000259D8);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10001B180;
  *(void *)(v10 + 56) = &type metadata for String;
  unint64_t v22 = sub_10000EDF8();
  *(void *)(v10 + 64) = v22;
  uint64_t v11 = 0x29656E6F6E28;
  if (v7) {
    uint64_t v11 = (uint64_t)v5;
  }
  unint64_t v12 = 0xE600000000000000;
  if (v7) {
    unint64_t v12 = v7;
  }
  *(void *)(v10 + 32) = v11;
  *(void *)(v10 + 40) = v12;
  sub_10000515C(0, &qword_1000259D0);
  swift_bridgeObjectRetain();
  int64_t v13 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  if (v7)
  {
    swift_bridgeObjectRetain();
    sub_10000FF0C(v5, v7, v8, sub_1000187F4, v9);
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_release();
  }
  else
  {
    swift_retain();
    static os_log_type_t.debug.getter();
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_10001B180;
    *(void *)(v14 + 56) = &type metadata for String;
    *(void *)(v14 + 64) = v22;
    *(void *)(v14 + 32) = 1702195828;
    *(void *)(v14 + 40) = 0xE400000000000000;
    int64_t v15 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    int64_t v16 = self;
    NSString v17 = String._bridgeToObjectiveC()();
    if (qword_100025818 != -1) {
      swift_once();
    }
    uint64_t v18 = qword_100026AE8;
    aBlock[4] = sub_10000C1A4;
    aBlock[5] = 0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100012C94;
    aBlock[3] = &unk_100021580;
    unint64_t v19 = _Block_copy(aBlock);
    [v16 startCatalogDownload:v17 options:v18 then:v19];
    _Block_release(v19);

    static os_log_type_t.info.getter();
    uint64_t v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_10001B180;
    *(void *)(v20 + 56) = &type metadata for String;
    *(void *)(v20 + 64) = v22;
    *(void *)(v20 + 32) = 1701736302;
    *(void *)(v20 + 40) = 0xE400000000000000;
    unint64_t v21 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_unknownObjectRelease_n();
    swift_release_n();
    swift_bridgeObjectRelease();
  }
}

void sub_100015F38(uint64_t a1)
{
  static os_log_type_t.info.getter();
  sub_100004FFC(&qword_1000259D8);
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = v2;
  *(_OWORD *)(v2 + 16) = xmmword_10001B180;
  if (a1)
  {
    uint64_t v4 = _convertErrorToNSError(_:)();
    uint64_t v7 = sub_10000515C(0, (unint64_t *)&unk_100025CF0);
    uint64_t v8 = sub_100017B64((unint64_t *)&qword_1000259E8, (unint64_t *)&unk_100025CF0);
    *(void *)&long long v6 = v4;
    sub_100010404(&v6, v3 + 32);
  }
  else
  {
    *(void *)(v2 + 56) = &type metadata for String;
    *(void *)(v2 + 64) = sub_10000EDF8();
    *(void *)(v3 + 32) = 1701736302;
    *(void *)(v3 + 40) = 0xE400000000000000;
  }
  sub_10000515C(0, &qword_1000259D0);
  uint64_t v5 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();
}

void sub_1000160FC(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v3 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v3)
  {
    id v10 = [objc_allocWithZone((Class)TZDAssetDetectedMsg) init];
    if (v10)
    {
      NSString v4 = String._bridgeToObjectiveC()();
      [v10 setAssetVersion:v4];

      id v5 = [v10 data];
      if (v5)
      {
        long long v6 = v5;
        uint64_t v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v9 = v8;

        sub_100014FC4(v7, v9, *(_WORD *)(v2 + OBJC_IVAR____TtC3tzd6Daemon_assetDetectedType), 300);
        sub_1000165DC(v7, v9);

        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

id sub_100016214()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Daemon();
  return [super dealloc];
}

uint64_t type metadata accessor for Daemon()
{
  return self;
}

void sub_1000162C8(void *a1, void (**a2)(void))
{
  static os_log_type_t.debug.getter();
  sub_100004FFC(&qword_1000259D8);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10001B180;
  id v5 = [a1 actionIdentifier];
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;

  *(void *)(v4 + 56) = &type metadata for String;
  *(void *)(v4 + 64) = sub_10000EDF8();
  *(void *)(v4 + 32) = v6;
  *(void *)(v4 + 40) = v8;
  sub_10000515C(0, &qword_1000259D0);
  unint64_t v9 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  id v10 = [a1 actionIdentifier];
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;

  if (v11 == 0xD00000000000004ALL && v13 == 0x800000010001C560)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    id v15 = objc_allocWithZone((Class)FBSShutdownOptions);
    NSString v16 = String._bridgeToObjectiveC()();
    id v17 = [v15 initWithReason:v16];

    [v17 setRebootType:1];
    id v18 = [self sharedService];
    [v18 shutdownWithOptions:v17];

    goto LABEL_6;
  }
  char v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v14) {
    goto LABEL_5;
  }
LABEL_6:
  a2[2](a2);
  _Block_release(a2);
}

uint64_t sub_1000165DC(uint64_t a1, unint64_t a2)
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

void sub_100016634(uint64_t a1)
{
  static os_log_type_t.debug.getter();
  sub_10000515C(0, &qword_1000259D0);
  objc_super v2 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();

  if (a1)
  {
    swift_errorRetain();
    static os_log_type_t.error.getter();
    sub_100004FFC(&qword_1000259D8);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_10001B180;
    uint64_t v4 = _convertErrorToNSError(_:)();
    *(void *)(v3 + 56) = sub_10000515C(0, (unint64_t *)&unk_100025CF0);
    *(void *)(v3 + 64) = sub_100017B64((unint64_t *)&qword_1000259E8, (unint64_t *)&unk_100025CF0);
    *(void *)(v3 + 32) = v4;
    id v5 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    swift_errorRelease();
  }
}

id sub_1000167CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v10 = 0;
  id v6 = [v3 initWithPattern:v5 options:a3 error:&v10];

  if (v6)
  {
    id v7 = v10;
  }
  else
  {
    id v8 = v10;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v6;
}

unint64_t sub_1000168A8(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_1000169F8(a1, v4);
}

unint64_t sub_1000168EC(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_100016AC0(a1, a2, v4);
}

unint64_t sub_100016964(uint64_t a1)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();

  return sub_100016BA4(a1, v2);
}

unint64_t sub_1000169F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100017BA8(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_10000FA9C((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_100016AC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
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

unint64_t sub_100016BA4(uint64_t a1, uint64_t a2)
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

void sub_100016D1C(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      __CocoaSet.element(at:)();
      sub_10000515C(0, &qword_100025F68);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_24;
  }
  if (a3) {
    goto LABEL_10;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_21;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_17;
  }
  __break(1u);
LABEL_10:
  if (__CocoaSet.Index.age.getter() != *(_DWORD *)(a4 + 36))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  __CocoaSet.Index.element.getter();
  sub_10000515C(0, &qword_100025F68);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v4 = v16;
  swift_unknownObjectRelease();
  Swift::Int v7 = NSObject._rawHashValue(seed:)(*(void *)(a4 + 40));
  uint64_t v8 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v6 = v7 & ~v8;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_23:

    __break(1u);
LABEL_24:
    __break(1u);
    return;
  }
  id v9 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
  char v10 = static NSObject.== infix(_:_:)();

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = ~v8;
    do
    {
      unint64_t v6 = (v6 + 1) & v11;
      if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_23;
      }
      id v12 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
      char v13 = static NSObject.== infix(_:_:)();
    }
    while ((v13 & 1) == 0);
  }

LABEL_17:
  uint64_t v14 = *(void **)(*(void *)(a4 + 48) + 8 * v6);

  id v15 = v14;
}

uint64_t sub_100016F94(uint64_t a1)
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
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  id v9 = (unint64_t *)(a1 + 72);
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

void sub_10001701C()
{
  uint64_t v0 = self;
  id v1 = [v0 defaultManager];
  if (qword_100025868 != -1) {
    swift_once();
  }
  NSString v2 = String._bridgeToObjectiveC()();
  unsigned int v3 = [v1 fileExistsAtPath:v2];

  if (v3)
  {
    uint64_t v4 = String.init(contentsOfFile:)();
    uint64_t v6 = v5;
    id v7 = objc_allocWithZone((Class)NSRegularExpression);
    id v8 = sub_1000167CC(0xD000000000000041, 0x800000010001CC30, 0);
    swift_bridgeObjectRetain();
    uint64_t v9 = String.UTF16View.count.getter();
    swift_bridgeObjectRelease();
    NSString v10 = String._bridgeToObjectiveC()();
    id v11 = [v8 matchesInString:v10 options:0 range:v9];

    sub_10000515C(0, &qword_100026048);
    unint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v12 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v13 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    id v32 = v8;
    if (v13 != 1) {
      goto LABEL_13;
    }
    if ((v12 & 0xC000000000000001) != 0)
    {
      id v14 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else
    {
      if (!*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        __break(1u);
      }
      id v14 = *(id *)(v12 + 32);
    }
    id v15 = v14;
    [v14 rangeAtIndex:1];

    uint64_t v31 = Range<>.init(_:in:)();
    if (v16)
    {
LABEL_13:
      swift_bridgeObjectRelease();
    }
    else
    {
      if ((v12 & 0xC000000000000001) != 0) {
        id v17 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v17 = *(id *)(v12 + 32);
      }
      id v28 = v17;
      swift_bridgeObjectRelease();
      [v28 rangeAtIndex:2];

      Range<>.init(_:in:)();
      if ((v29 & 1) == 0)
      {
        String.subscript.getter();
        static String._fromSubstring(_:)();
        swift_bridgeObjectRelease();
        String.subscript.getter();
        swift_bridgeObjectRelease();
        static String._fromSubstring(_:)();
        swift_bridgeObjectRelease();
        sub_100004FFC((uint64_t *)&unk_100025D10);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_10001B160;
        *(void *)(inited + 32) = 0x6973726556646C6FLL;
        *(void *)(inited + 40) = 0xEA00000000006E6FLL;
        *(void *)(inited + 48) = String._bridgeToObjectiveC()();
        *(void *)(inited + 56) = 0x697372655677656ELL;
        *(void *)(inited + 64) = 0xEA00000000006E6FLL;
        *(void *)(inited + 72) = String._bridgeToObjectiveC()();
        sub_100012904(inited);
        sub_1000120B0(0x7463417465737361, (void *)0xEE00646574617669);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_15:
        id v20 = [v0 defaultManager:v31];
        NSString v21 = String._bridgeToObjectiveC()();
        v33[0] = 0;
        unsigned int v22 = [v20 removeItemAtPath:v21 error:v33];

        if (v22)
        {
          id v23 = v33[0];
        }
        else
        {
          id v24 = v33[0];
          _convertNSErrorToError(_:)();

          swift_willThrow();
          static os_log_type_t.error.getter();
          sub_100004FFC(&qword_1000259D8);
          uint64_t v25 = swift_allocObject();
          *(_OWORD *)(v25 + 16) = xmmword_10001B180;
          uint64_t v26 = _convertErrorToNSError(_:)();
          *(void *)(v25 + 56) = sub_10000515C(0, (unint64_t *)&unk_100025CF0);
          *(void *)(v25 + 64) = sub_100017B64((unint64_t *)&qword_1000259E8, (unint64_t *)&unk_100025CF0);
          *(void *)(v25 + 32) = v26;
          sub_10000515C(0, &qword_1000259D0);
          id v27 = (void *)static OS_os_log.default.getter();
          os_log(_:dso:log:type:_:)();
          swift_bridgeObjectRelease();

          swift_errorRelease();
        }
        return;
      }
    }
    static os_log_type_t.fault.getter();
    sub_100004FFC(&qword_1000259D8);
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_10001B180;
    *(void *)(v18 + 56) = &type metadata for String;
    *(void *)(v18 + 64) = sub_10000EDF8();
    *(void *)(v18 + 32) = v4;
    *(void *)(v18 + 40) = v6;
    sub_10000515C(0, &qword_1000259D0);
    unint64_t v19 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    goto LABEL_15;
  }
}

uint64_t sub_100017694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for DispatchQoS();
  uint64_t v10 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  unint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  String.utf8CString.getter();
  uint64_t v13 = os_transaction_create();
  swift_release();
  sub_10000515C(0, (unint64_t *)&unk_100025C00);
  id v14 = (void *)static OS_dispatch_queue.main.getter();
  id v15 = (void *)swift_allocObject();
  _OWORD v15[2] = a3;
  v15[3] = a4;
  v15[4] = v13;
  aBlock[4] = sub_1000188C0;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000127B0;
  aBlock[3] = &unk_1000215F8;
  char v16 = _Block_copy(aBlock);
  swift_retain();
  swift_unknownObjectRetain();
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_100009288();
  sub_100004FFC((uint64_t *)&unk_100025C10);
  sub_100017C9C();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v16);
  swift_unknownObjectRelease();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v19);
}

Swift::Int sub_100017968(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100004FFC(&qword_100025A70);
    uint64_t v3 = static _SetStorage.allocate(capacity:)();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      Hasher.init(_seed:)();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      Swift::Int result = Hasher._finalize()();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        char v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      NSString v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *NSString v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

uint64_t sub_100017B0C(uint64_t a1, unint64_t a2)
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

uint64_t sub_100017B64(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000515C(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100017BA8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100017C04()
{
  return swift_release();
}

uint64_t sub_100017C0C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100017C18()
{
  if (*(void *)(v0 + 24)) {
    swift_release();
  }
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_100017C68()
{
  sub_100014634(*(void *)(v0 + 16), *(void (**)(BOOL))(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_100017C74(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100017C84()
{
  return swift_release();
}

uint64_t sub_100017C8C(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

unint64_t sub_100017C9C()
{
  unint64_t result = qword_100025FE0;
  if (!qword_100025FE0)
  {
    sub_100009000((uint64_t *)&unk_100025C10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025FE0);
  }
  return result;
}

BOOL sub_100017CF8(void *a1)
{
  id v3 = [a1 valueForEntitlement:@"com.apple.private.timezoneupdates.tzd.access"];
  if (v3)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_1000055F8((uint64_t)v8, (uint64_t *)&unk_100025CD0);
    [a1 setExportedObject:v1];
    id v4 = [self interfaceWithProtocol:&OBJC_PROTOCOL___TZUpdateProtocol];
    [a1 setExportedInterface:v4];

    sub_10000515C(0, (unint64_t *)&unk_100025C00);
    uint64_t v5 = (void *)static OS_dispatch_queue.main.getter();
    [a1 _setQueue:v5];

    uint64_t v6 = &selRef_resume;
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    sub_1000055F8((uint64_t)v8, (uint64_t *)&unk_100025CD0);
    uint64_t v6 = &selRef_invalidate;
  }
  [a1 *v6];
  return v3 != 0;
}

BOOL sub_100017E50()
{
  uint64_t v0 = sub_100004FFC(&qword_100025A10);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005198((uint64_t)v13);
  sub_100017FFC((uint64_t)v13, (uint64_t)v15);
  if (!*((void *)&v15[0] + 1)) {
    return 0;
  }
  v16[2] = v15[0];
  v16[3] = v15[1];
  v17[0] = v16[0];
  *(_OWORD *)((char *)v17 + 10) = *(_OWORD *)((char *)v16 + 10);
  uint64_t v3 = sub_100003EB0();
  uint64_t v5 = v4;
  sub_100005654(v13);
  sub_100004BE4((uint64_t)v14);
  uint64_t v6 = sub_100003EB0();
  uint64_t v8 = v7;
  sub_1000056F4((uint64_t)v14);
  v12[2] = v6;
  v12[3] = v8;
  v12[0] = v3;
  v12[1] = v5;
  uint64_t v9 = type metadata accessor for Locale();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v2, 1, 1, v9);
  sub_1000055A4();
  uint64_t v10 = StringProtocol.compare<A>(_:options:range:locale:)();
  sub_1000055F8((uint64_t)v2, &qword_100025A10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 == -1;
}

uint64_t sub_100017FFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004FFC((uint64_t *)&unk_100025FF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_100018068(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  if ((a3 & 1) == 0)
  {
    static os_log_type_t.info.getter();
    sub_100004FFC(&qword_1000259D8);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_10001B160;
    if (a2)
    {
      unint64_t v11 = (void *)v10;
      *(void *)(v10 + 56) = &type metadata for String;
      *(void *)(v10 + 64) = sub_10000EDF8();
      v11[4] = a1;
      v11[5] = a2;
      if (a4)
      {
        swift_bridgeObjectRetain();
        uint64_t v12 = _convertErrorToNSError(_:)();
        v11[12] = sub_10000515C(0, (unint64_t *)&unk_100025CF0);
        v11[13] = sub_100017B64((unint64_t *)&qword_1000259E8, (unint64_t *)&unk_100025CF0);
        v11[9] = v12;
        sub_10000515C(0, &qword_1000259D0);
        uint64_t v8 = static OS_os_log.default.getter();
        goto LABEL_7;
      }
LABEL_12:
      __break(1u);
      return;
    }
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  static os_log_type_t.debug.getter();
  sub_100004FFC(&qword_1000259D8);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10001B180;
  if (!a2)
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v7 = v6;
  *(void *)(v6 + 56) = &type metadata for String;
  *(void *)(v6 + 64) = sub_10000EDF8();
  *(void *)(v7 + 32) = a1;
  *(void *)(v7 + 40) = a2;
  sub_10000515C(0, &qword_1000259D0);
  swift_bridgeObjectRetain();
  uint64_t v8 = static OS_os_log.default.getter();
LABEL_7:
  id v13 = (id)v8;
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();
}

void sub_10001826C(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  static os_log_type_t.info.getter();
  sub_100004FFC(&qword_1000259D8);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_10001B150;
  if (!a2)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v9 = (void *)v8;
  *(void *)(v8 + 56) = sub_10000515C(0, &qword_100026000);
  v9[8] = sub_100017B64(&qword_100026008, &qword_100026000);
  v9[4] = a2;
  if (!a4)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v9[12] = &type metadata for String;
  v9[13] = sub_10000EDF8();
  v9[9] = a3;
  v9[10] = a4;
  if (!a1)
  {
LABEL_9:
    __break(1u);
    return;
  }
  v9[17] = sub_10000515C(0, &qword_100025F68);
  v9[18] = sub_100017B64((unint64_t *)&unk_100026010, &qword_100025F68);
  v9[14] = a1;
  sub_10000515C(0, &qword_1000259D0);
  id v10 = a2;
  swift_bridgeObjectRetain();
  id v11 = a1;
  id v12 = (id)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();
}

uint64_t sub_10001843C(void *a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v21 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  uint64_t v19 = *(void *)(v5 - 8);
  uint64_t v20 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  Class isa = (Class)[a1 data];
  if (isa)
  {
    uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v11 = v10;

    sub_100017B0C(v9, v11);
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_1000165DC(v9, v11);
  }
  else
  {
    uint64_t v9 = 0;
    unint64_t v11 = 0xF000000000000000;
  }
  id v12 = [objc_allocWithZone((Class)TZDAssetDetectedMsg) initWithData:isa];

  sub_10000515C(0, (unint64_t *)&unk_100025C00);
  id v13 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  aBlock[4] = sub_1000187A0;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000127B0;
  aBlock[3] = &unk_100021530;
  uint64_t v15 = _Block_copy(aBlock);
  id v16 = v12;
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_100009288();
  sub_100004FFC((uint64_t *)&unk_100025C10);
  sub_100017C9C();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v15);

  sub_1000187A8(v9, v11);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v4, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v7, v20);
}

uint64_t sub_100018768()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000187A0()
{
  sub_100015B08(*(void **)(v0 + 16));
}

uint64_t sub_1000187A8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1000165DC(a1, a2);
  }
  return a1;
}

uint64_t sub_1000187BC()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000187F4(uint64_t a1)
{
}

uint64_t sub_100018820(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100018830()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100018868(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

uint64_t sub_100018880()
{
  swift_release();
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000188C0()
{
  return sub_10001422C(*(void (**)(uint64_t (*)(), uint64_t))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

void sub_1000188CC(void *a1)
{
  sub_1000132F0(a1, *(void *)(v1 + 16));
}

xpc_activity_state_t sub_1000188D4(_xpc_activity_s *a1)
{
  return sub_1000147C8(a1, *(void **)(v1 + 16));
}

uint64_t sub_1000188E0()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100018920()
{
  sub_100013DB4(1, *(void *)(v0 + 24));
}

uint64_t sub_10001894C()
{
  return sub_100013BA8(*(void **)(v0 + 16));
}

uint64_t sub_100018954()
{
  return sub_1000139FC(*(void **)(v0 + 16));
}

BOOL sub_1000189D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = sub_100004FFC(&qword_100025A10);
  __chkstk_darwin(v9 - 8);
  unint64_t v11 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  _OWORD v15[2] = a4;
  v15[3] = a5;
  v15[0] = a1;
  v15[1] = a2;
  uint64_t v12 = type metadata accessor for Locale();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  sub_1000055A4();
  uint64_t v13 = StringProtocol.compare<A>(_:options:range:locale:)();
  sub_100019560((uint64_t)v11);
  return v13 == -1;
}

uint64_t sub_100018AF4(char *a1, uint64_t a2, uint64_t (*a3)(BOOL), uint64_t a4, uint64_t a5)
{
  uint64_t v9 = type metadata accessor for TimeZone();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    swift_errorRetain();
    static os_log_type_t.fault.getter();
    sub_100004FFC(&qword_1000259D8);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_10001B180;
    uint64_t v14 = _convertErrorToNSError(_:)();
    *(void *)(v13 + 56) = sub_10000515C(0, (unint64_t *)&unk_100025CF0);
    *(void *)(v13 + 64) = sub_10001904C();
    *(void *)(v13 + 32) = v14;
    sub_10000515C(0, &qword_1000259D0);
    uint64_t v15 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    a3(0);
    return swift_errorRelease();
  }
  else
  {
    static TimeZone.current.getter();
    uint64_t v17 = TimeZone.identifier.getter();
    uint64_t v19 = v18;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      a1 = sub_100007038(0, *((void *)a1 + 2) + 1, 1, a1);
    }
    unint64_t v21 = *((void *)a1 + 2);
    unint64_t v20 = *((void *)a1 + 3);
    if (v21 >= v20 >> 1) {
      a1 = sub_100007038((char *)(v20 > 1), v21 + 1, 1, a1);
    }
    *((void *)a1 + 2) = v21 + 1;
    uint64_t v22 = &a1[16 * v21];
    *((void *)v22 + 4) = v17;
    *((void *)v22 + 5) = v19;
    swift_bridgeObjectRelease();
    static os_log_type_t.debug.getter();
    sub_100004FFC(&qword_1000259D8);
    uint64_t v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_10001B180;
    *(void *)(v23 + 56) = sub_100004FFC(&qword_100025A60);
    *(void *)(v23 + 64) = sub_100018E68();
    *(void *)(v23 + 32) = a1;
    sub_10000515C(0, &qword_1000259D0);
    swift_bridgeObjectRetain();
    uint64_t v24 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRetain();
    uint64_t v25 = sub_100018EC4((uint64_t)a1, a5);
    swift_bridgeObjectRelease();
    uint64_t v26 = *(void *)(v25 + 16);
    swift_release();
    return a3(v26 != 0);
  }
}

unint64_t sub_100018E68()
{
  unint64_t result = qword_100025A68;
  if (!qword_100025A68)
  {
    sub_100009000(&qword_100025A60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025A68);
  }
  return result;
}

uint64_t sub_100018EC4(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  size_t v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    uint64_t v7 = sub_1000190B4((unint64_t *)((char *)&v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0)), v5, v3, a2);
    swift_release();
  }
  else
  {
    uint64_t v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    uint64_t v7 = sub_1000190B4((unint64_t *)v8, v5, v3, a2);
    swift_release();
    swift_slowDealloc();
  }
  return v7;
}

unint64_t sub_10001904C()
{
  unint64_t result = qword_1000259E8;
  if (!qword_1000259E8)
  {
    sub_10000515C(255, (unint64_t *)&unk_100025CF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000259E8);
  }
  return result;
}

uint64_t sub_1000190B4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a2;
  uint64_t v31 = *(void *)(a3 + 16);
  if (!v31)
  {
    uint64_t v26 = 0;
    goto LABEL_27;
  }
  uint64_t v32 = a4 + 56;
  uint64_t v30 = a3 + 32;
  swift_bridgeObjectRetain();
  uint64_t v28 = 0;
  for (uint64_t i = 0; i != v31; ++i)
  {
    uint64_t v7 = (uint64_t *)(v30 + 16 * i);
    uint64_t v9 = *v7;
    uint64_t v8 = v7[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    Swift::Int v10 = Hasher._finalize()();
    uint64_t v11 = -1 << *(unsigned char *)(a4 + 32);
    unint64_t v12 = v10 & ~v11;
    unint64_t v13 = v12 >> 6;
    uint64_t v14 = 1 << v12;
    if (((1 << v12) & *(void *)(v32 + 8 * (v12 >> 6))) == 0) {
      goto LABEL_3;
    }
    uint64_t v15 = *(void *)(a4 + 48);
    id v16 = (void *)(v15 + 16 * v12);
    BOOL v17 = *v16 == v9 && v16[1] == v8;
    if (!v17 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v21 = ~v11;
      for (unint64_t j = v12 + 1; ; unint64_t j = v23 + 1)
      {
        unint64_t v23 = j & v21;
        if (((*(void *)(v32 + (((j & v21) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (j & v21)) & 1) == 0) {
          break;
        }
        uint64_t v24 = (void *)(v15 + 16 * v23);
        BOOL v25 = *v24 == v9 && v24[1] == v8;
        if (v25 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          uint64_t result = swift_bridgeObjectRelease();
          unint64_t v13 = v23 >> 6;
          uint64_t v14 = 1 << v23;
          goto LABEL_12;
        }
      }
LABEL_3:
      swift_bridgeObjectRelease();
      continue;
    }
    uint64_t result = swift_bridgeObjectRelease();
LABEL_12:
    unint64_t v19 = a1[v13];
    a1[v13] = v14 | v19;
    if ((v14 & v19) == 0 && __OFADD__(v28++, 1))
    {
      __break(1u);
      return result;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v5 = a2;
  uint64_t v26 = v28;
LABEL_27:
  swift_retain();
  return sub_1000192C8(a1, v5, v26, a4);
}

uint64_t sub_1000192C8(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  sub_100004FFC(&qword_100025A70);
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
    BOOL v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
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

uint64_t sub_100019560(uint64_t a1)
{
  uint64_t v2 = sub_100004FFC(&qword_100025A10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1000195C0()
{
  v0._countAndFlagsBits = 0x656E6F7A656D6974;
  v0._object = (void *)0xE90000000000002FLL;
  String.append(_:)(v0);
  qword_100026B08 = 0x2F62642F7261762FLL;
  unk_100026B10 = 0xE800000000000000;
}

void sub_10001962C(int a1)
{
  v1._object = (void *)0x800000010001CD60;
  v1._countAndFlagsBits = 0xD000000000000010;
  sub_100019654(a1, v1, &qword_100026B18, &qword_100026B20);
}

void sub_100019654(int a1, Swift::String a2, void *a3, void *a4)
{
  *a3 = 0x6168732F7273752FLL;
  *a4 = 0xEB000000002F6572;
}

void sub_1000196C4(int a1)
{
  v1._countAndFlagsBits = 7693161;
  v1._object = (void *)0xE300000000000000;
  sub_100019654(a1, v1, &qword_100026B28, &qword_100026B30);
}

void sub_1000196E0()
{
  if (qword_100025848 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_100026B28;
  uint64_t v2 = qword_100026B30;
  swift_bridgeObjectRetain();
  v0._object = (void *)0x800000010001CD40;
  v0._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v0);
  qword_100026B38 = v1;
  unk_100026B40 = v2;
}

void sub_100019778()
{
  if (qword_100025838 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_100026B08;
  uint64_t v2 = unk_100026B10;
  swift_bridgeObjectRetain();
  v0._countAndFlagsBits = 0x736574616C5F7A74;
  v0._object = (void *)0xE900000000000074;
  String.append(_:)(v0);
  qword_100026B48 = v1;
  unk_100026B50 = v2;
}

void sub_100019810()
{
  if (qword_100025838 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_100026B08;
  uint64_t v2 = unk_100026B10;
  swift_bridgeObjectRetain();
  v0._countAndFlagsBits = 0x6C635F736465656ELL;
  v0._object = (void *)0xED000070756E6165;
  String.append(_:)(v0);
  qword_100026B58 = v1;
  unk_100026B60 = v2;
}

void sub_1000198B0()
{
  if (qword_100025838 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_100026B08;
  uint64_t v2 = unk_100026B10;
  swift_bridgeObjectRetain();
  v0._object = (void *)0x800000010001CD80;
  v0._countAndFlagsBits = 0xD000000000000013;
  String.append(_:)(v0);
  qword_100026B68 = v1;
  unk_100026B70 = v2;
}

void sub_100019948()
{
  if (qword_100025838 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_100026B08;
  uint64_t v2 = unk_100026B10;
  swift_bridgeObjectRetain();
  v0._countAndFlagsBits = 0x6F666E69656E6F7ALL;
  v0._object = (void *)0xE800000000000000;
  String.append(_:)(v0);
  qword_100026B78 = v1;
  unk_100026B80 = v2;
}

void sub_1000199DC()
{
  if (qword_100025838 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_100026B08;
  uint64_t v2 = unk_100026B10;
  swift_bridgeObjectRetain();
  v0._countAndFlagsBits = 3111540;
  v0._object = (void *)0xE300000000000000;
  String.append(_:)(v0);
  qword_100026B88 = v1;
  unk_100026B90 = v2;
}

uint64_t sub_100019A68()
{
  uint64_t result = sub_100019A8C();
  qword_100026B98 = result;
  qword_100026BA0 = v1;
  return result;
}

uint64_t sub_100019A8C()
{
  uint64_t v0 = type metadata accessor for URL();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100025850 != -1) {
    swift_once();
  }
  URL.init(fileURLWithPath:)();
  uint64_t v4 = String.init(contentsOf:)();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

unint64_t sub_100019C9C()
{
  unint64_t result = qword_100025D00;
  if (!qword_100025D00)
  {
    sub_10000515C(255, (unint64_t *)&unk_100025F80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100025D00);
  }
  return result;
}

void sub_100019D04()
{
  __assert_rtn("-[TZDAssetDetectedMsg writeTo:]", "TZDAssetDetectedMsg.m", 81, "nil != self->_assetVersion");
}

uint64_t static CocoaError.fileReadNoSuchFile.getter()
{
  return static CocoaError.fileReadNoSuchFile.getter();
}

uint64_t type metadata accessor for CocoaError.Code()
{
  return type metadata accessor for CocoaError.Code();
}

uint64_t LocalizedError.helpAnchor.getter()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t LocalizedError.failureReason.getter()
{
  return LocalizedError.failureReason.getter();
}

uint64_t LocalizedError.errorDescription.getter()
{
  return LocalizedError.errorDescription.getter();
}

uint64_t LocalizedError.recoverySuggestion.getter()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t static _ErrorCodeProtocol.~= infix(_:_:)()
{
  return static _ErrorCodeProtocol.~= infix(_:_:)();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t NSFastEnumerationIterator.next()()
{
  return NSFastEnumerationIterator.next()();
}

uint64_t type metadata accessor for NSFastEnumerationIterator()
{
  return type metadata accessor for NSFastEnumerationIterator();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return URL.init(fileURLWithPath:)();
}

uint64_t URL.lastPathComponent.getter()
{
  return URL.lastPathComponent.getter();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.appendingPathComponent(_:)()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t URL.deletingLastPathComponent()()
{
  return URL.deletingLastPathComponent()();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.path.getter()
{
  return URL.path.getter();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t TimeZone.identifier.getter()
{
  return TimeZone.identifier.getter();
}

uint64_t static TimeZone.current.getter()
{
  return static TimeZone.current.getter();
}

uint64_t type metadata accessor for TimeZone()
{
  return type metadata accessor for TimeZone();
}

uint64_t os_log(_:dso:log:type:_:)()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t errno.getter()
{
  return errno.getter();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init(contentsOf:)()
{
  return String.init(contentsOf:)();
}

uint64_t String.init(contentsOfFile:)()
{
  return String.init(contentsOfFile:)();
}

uint64_t String.LocalizationValue.init(stringLiteral:)()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t type metadata accessor for String.LocalizationValue()
{
  return type metadata accessor for String.LocalizationValue();
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

uint64_t String.init(localized:table:bundle:localization:locale:comment:)()
{
  return String.init(localized:table:bundle:localization:locale:comment:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t static String._fromSubstring(_:)()
{
  return static String._fromSubstring(_:)();
}

uint64_t String.init(validatingUTF8:)()
{
  return String.init(validatingUTF8:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
}

uint64_t String.UTF16View.count.getter()
{
  return String.UTF16View.count.getter();
}

uint64_t String.subscript.getter()
{
  return String.subscript.getter();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Array._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t Range<>.init(_:in:)()
{
  return Range<>.init(_:in:)();
}

uint64_t NSEnumerator.makeIterator()()
{
  return NSEnumerator.makeIterator()();
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

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t static OS_os_log.default.getter()
{
  return static OS_os_log.default.getter();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t StringProtocol.compare<A>(_:options:range:locale:)()
{
  return StringProtocol.compare<A>(_:options:range:locale:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t __CocoaSet.startIndex.getter()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t static __CocoaSet.Index.== infix(_:_:)()
{
  return static __CocoaSet.Index.== infix(_:_:)();
}

uint64_t __CocoaSet.Index.age.getter()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t __CocoaSet.Index.element.getter()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t __CocoaSet.element(at:)()
{
  return __CocoaSet.element(at:)();
}

uint64_t __CocoaSet.endIndex.getter()
{
  return __CocoaSet.endIndex.getter();
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

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
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

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
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

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

uint64_t MobileGestalt_get_current_device()
{
  return _MobileGestalt_get_current_device();
}

uint64_t MobileGestalt_get_internalBuild()
{
  return _MobileGestalt_get_internalBuild();
}

uint64_t PBDataWriterWriteStringField()
{
  return _PBDataWriterWriteStringField();
}

uint64_t PBReaderReadString()
{
  return _PBReaderReadString();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
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

char *__cdecl mkdtemp(char *a1)
{
  return _mkdtemp(a1);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
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

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
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

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return [a1 allocWithZone:];
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return [a1 copyWithZone:];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentation];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return [a1 isMemberOfClass:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}