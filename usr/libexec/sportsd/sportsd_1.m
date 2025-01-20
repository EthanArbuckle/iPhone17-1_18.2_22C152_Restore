uint64_t sub_100098DBC(uint64_t a1)
{
  uint64_t v1;

  return *(void *)(v1 + 56) + 32 * a1;
}

uint64_t sub_100098DCC()
{
  return v0;
}

uint64_t sub_100098DD8()
{
  return 0;
}

uint64_t sub_100098E2C()
{
  return v0;
}

uint64_t sub_100098E40()
{
  uint64_t v0 = (unsigned __int8 *)swift_slowAlloc();
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  id v2 = [(objc_class *)isa bytes];
  v3 = isa;
  unint64_t v4 = Data.count.getter();
  if ((v4 & 0x8000000000000000) != 0 || HIDWORD(v4))
  {
    sub_10001C220();
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    CC_SHA1(v2, v4, v0);
    uint64_t v5 = Data.init(bytes:count:)();
    unint64_t v7 = v6;
    id v8 = [self createBagForSubProfile];
    if (!v8)
    {
      sub_100099038();
      id v8 = sub_10002B548();
    }
    v9 = self;
    Class v10 = Data._bridgeToObjectiveC()().super.isa;
    id v11 = [v9 signaturePromiseFromData:v10 type:1 bag:v8];

    sub_10000835C(v5, v7);
    return (uint64_t)v11;
  }
  return result;
}

uint64_t type metadata accessor for MescalSignature()
{
  return self;
}

unint64_t sub_100099038()
{
  unint64_t result = qword_1000FCD50;
  if (!qword_1000FCD50)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000FCD50);
  }
  return result;
}

uint64_t sub_100099078()
{
  unint64_t v0 = _findStringSwitchCaseWithCache(cases:string:cache:)();
  swift_bridgeObjectRelease();
  if (v0 >= 0x2D) {
    return 45;
  }
  else {
    return v0;
  }
}

unint64_t sub_1000990CC(char a1)
{
  unint64_t result = 7368801;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7041746E65696C63;
      break;
    case 2:
      unint64_t result = 0x6163696E6F6E6163;
      break;
    case 3:
      unint64_t result = 0x707954746E657665;
      break;
    case 4:
      unint64_t result = 0x5574736575716572;
      break;
    case 5:
      unint64_t result = 0xD000000000000016;
      break;
    case 6:
      unint64_t result = 0xD000000000000015;
      break;
    case 7:
      unint64_t result = 0xD000000000000012;
      break;
    case 8:
      unint64_t result = 0xD000000000000018;
      break;
    case 9:
    case 14:
    case 21:
    case 26:
    case 33:
      unint64_t result = 0xD000000000000010;
      break;
    case 10:
      unint64_t result = 0x74726F7073;
      break;
    case 11:
      unint64_t result = 0x6163696669746F6ELL;
      break;
    case 12:
      unint64_t result = 0xD000000000000017;
      break;
    case 13:
      unint64_t result = 0xD000000000000019;
      break;
    case 15:
      unint64_t result = 0x6556726576726573;
      break;
    case 16:
      unint64_t result = 0xD000000000000013;
      break;
    case 17:
      unint64_t result = 0xD000000000000017;
      break;
    case 18:
      unint64_t result = 0xD000000000000019;
      break;
    case 19:
      unint64_t result = 0xD000000000000011;
      break;
    case 20:
      unint64_t result = 0x6172747369676572;
      break;
    case 22:
      unint64_t result = 0x646F43726F727265;
      break;
    case 23:
      unint64_t result = 0x6D6F44726F727265;
      break;
    case 24:
      unint64_t result = 0x616552726F727265;
      break;
    case 25:
      unint64_t result = 0xD000000000000011;
      break;
    case 27:
      unint64_t result = 0xD000000000000013;
      break;
    case 28:
      unint64_t result = 0xD000000000000013;
      break;
    case 29:
      unint64_t result = 0xD000000000000015;
      break;
    case 30:
      unint64_t result = 0x6174536863746566;
      break;
    case 31:
      unint64_t result = 0x506B726F7774656ELL;
      break;
    case 32:
      unint64_t result = 0xD000000000000012;
      break;
    case 34:
      unint64_t result = 0x65736E6F70736572;
      break;
    case 35:
      unint64_t result = 0xD000000000000013;
      break;
    case 36:
      unint64_t result = 0xD000000000000011;
      break;
    case 37:
      unint64_t result = 0xD000000000000019;
      break;
    case 38:
      unint64_t result = 0x6F43737574617473;
      break;
    case 39:
      unint64_t result = 0x4D74736575716572;
      break;
    case 40:
      unint64_t result = 0xD000000000000011;
      break;
    case 41:
      unint64_t result = 0x6E65674172657375;
      break;
    case 42:
      unint64_t result = 0xD000000000000015;
      break;
    case 43:
      unint64_t result = 0xD000000000000017;
      break;
    case 44:
      unint64_t result = 0x6D614E746E657665;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100099640(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_10006A57C(*a1, *a2);
}

Swift::Int sub_10009964C()
{
  return sub_10006ACAC(*v0);
}

uint64_t sub_100099654(uint64_t a1)
{
  return sub_10006B0A0(a1, *v1);
}

Swift::Int sub_10009965C(uint64_t a1)
{
  return sub_10006B4E4(a1, *v1);
}

uint64_t sub_100099664@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100099078();
  *a1 = result;
  return result;
}

unint64_t sub_100099694@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_1000990CC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t getEnumTagSinglePayload for SportsMetricsKey(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xD4)
  {
    if (a2 + 44 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 44) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 45;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x2D;
  int v5 = v6 - 45;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for SportsMetricsKey(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 44 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 44) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xD4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xD3)
  {
    unsigned int v6 = ((a2 - 212) >> 8) + 1;
    *unint64_t result = a2 + 44;
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
        JUMPOUT(0x100099814);
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
          *unint64_t result = a2 + 44;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SportsMetricsKey()
{
  return &type metadata for SportsMetricsKey;
}

unint64_t sub_100099850()
{
  unint64_t result = qword_1000FF320;
  if (!qword_1000FF320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000FF320);
  }
  return result;
}

uint64_t sub_10009989C()
{
  sub_100005E5C(&qword_1000FCC08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000CB3B0;
  *(unsigned char *)(inited + 32) = 22;
  uint64_t v1 = sub_10007C06C();
  *(void *)(inited + 64) = &type metadata for Int;
  *(void *)(inited + 40) = v1;
  *(unsigned char *)(inited + 72) = 23;
  unint64_t v2 = sub_10007BED0();
  *(void *)(inited + 104) = &type metadata for String;
  *(void *)(inited + 80) = v2;
  *(void *)(inited + 88) = v3;
  *(unsigned char *)(inited + 112) = 24;
  type metadata accessor for ApiAgentError();
  sub_100099980();
  uint64_t v4 = Error.localizedDescription.getter();
  *(void *)(inited + 144) = &type metadata for String;
  *(void *)(inited + 120) = v4;
  *(void *)(inited + 128) = v5;
  sub_100005E5C((uint64_t *)&unk_1000FC300);
  sub_100027288();
  return Dictionary.init(dictionaryLiteral:)();
}

unint64_t sub_100099980()
{
  unint64_t result = qword_1000FDA10;
  if (!qword_1000FDA10)
  {
    type metadata accessor for ApiAgentError();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000FDA10);
  }
  return result;
}

id sub_100099A04()
{
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 BOOLForKey:v1];

  return v2;
}

uint64_t sub_100099A68()
{
  uint64_t v0 = sub_100005E5C(&qword_1000FD248);
  sub_100009830();
  uint64_t v2 = v1;
  __chkstk_darwin(v3);
  uint64_t v5 = &v20[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_100005E5C(&qword_1000FF3C8);
  sub_100009830();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  id v11 = &v20[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for ContainerConstants();
  uint64_t v12 = static ContainerConstants.defaultSuiteName.getter();
  uint64_t v14 = v13;
  id v15 = objc_allocWithZone((Class)NSUserDefaults);
  id v16 = sub_10005F5B8(v12, v14);
  if (v16)
  {
    v17 = v16;
    swift_getKeyPath();
    _KeyValueCodingAndObservingPublishing<>.publisher<A>(for:options:)();
    swift_release();
    sub_10000953C(&qword_1000FF3D8, &qword_1000FF3C8);
    uint64_t v18 = Publisher.eraseToAnyPublisher()();

    (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v11, v6);
  }
  else
  {
    v20[15] = 0;
    Just.init(_:)();
    sub_10000953C(&qword_1000FF3D0, &qword_1000FD248);
    uint64_t v18 = Publisher.eraseToAnyPublisher()();
    (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v5, v0);
  }
  return v18;
}

uint64_t type metadata accessor for InternalSettings()
{
  return self;
}

const char *sub_100099CA4()
{
  return "filteringEnabled";
}

id sub_100099CB0@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = [*a1 filteringEnabled];
  *a2 = (_BYTE)result;
  return result;
}

unsigned char *storeEnumTagSinglePayload for TVAppFeatureFlags(unsigned char *result, int a2, int a3)
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
        *id result = a2;
        return result;
      case 2:
        *(_WORD *)id result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)id result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *id result = 0;
      break;
    case 2:
      *(_WORD *)id result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x100099D80);
    case 4:
      *(_DWORD *)id result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for TVAppFeatureFlags()
{
  return &type metadata for TVAppFeatureFlags;
}

unint64_t sub_100099DBC()
{
  unint64_t result = qword_1000FF3E0;
  if (!qword_1000FF3E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000FF3E0);
  }
  return result;
}

const char *sub_100099E08()
{
  return "TVApp";
}

const char *sub_100099E1C()
{
  return "sports_app_live_activities";
}

void *sub_100099E30(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5 = a1;
  if (a1 >> 62) {
    goto LABEL_19;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = _CocoaArrayWrapper.endIndex.getter())
  {
    unint64_t v20 = v5;
    unint64_t v21 = v5 & 0xC000000000000001;
    uint64_t v7 = 4;
    while (1)
    {
      id v8 = v21 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)() : *(id *)(v5 + 8 * v7);
      uint64_t v9 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      uint64_t v10 = v6;
      id v11 = v8;
      uint64_t v12 = a3;
      uint64_t v13 = (void *)SportingEventCompetitorContainer.competitor.getter();
      uint64_t v14 = SportingEventCompetitor.canonicalId.getter();
      uint64_t v16 = v15;

      a3 = v12;
      BOOL v17 = v14 == a2 && v16 == v12;
      if (v17)
      {
        swift_bridgeObjectRelease();
LABEL_17:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v11;
      }
      char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v18) {
        goto LABEL_17;
      }

      ++v7;
      uint64_t v6 = v10;
      BOOL v17 = v9 == v10;
      unint64_t v5 = v20;
      if (v17) {
        goto LABEL_20;
      }
    }
    __break(1u);
LABEL_19:
    swift_bridgeObjectRetain();
  }
LABEL_20:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0;
}

void *sub_100099FE0(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = _CocoaArrayWrapper.endIndex.getter())
  {
    uint64_t v7 = 4;
    while (1)
    {
      id v8 = (a3 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
         : *(id *)(a3 + 8 * v7);
      uint64_t v9 = v8;
      uint64_t v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      id v13 = v8;
      char v11 = a1(&v13);
      if (v3)
      {
        swift_bridgeObjectRelease();

        return v9;
      }
      if (v11)
      {
        swift_bridgeObjectRelease();
        return v9;
      }

      ++v7;
      if (v10 == v6) {
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_10009A108(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = type metadata accessor for SportingEventCompetitorScoreStatisticType.StatisticName();
  sub_100009830();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  sub_10004D594();
  uint64_t v69 = v10;
  sub_100051124();
  __chkstk_darwin(v11);
  sub_100098D3C();
  uint64_t v62 = v12;
  uint64_t v58 = *(void *)(a3 + 16);
  if (v58)
  {
    uint64_t v59 = a3 + 32;
    unsigned int v57 = enum case for SportingEventCompetitorScoreStatisticType.StatisticName.shootout(_:);
    v63 = (void (**)(uint64_t, unint64_t, uint64_t))(v8 + 16);
    v64 = (void (**)(uint64_t, uint64_t))(v8 + 8);
    swift_bridgeObjectRetain();
    uint64_t v13 = 0;
    uint64_t v14 = _swiftEmptyArrayStorage;
    uint64_t v56 = v8;
    while (1)
    {
      uint64_t v15 = (uint64_t *)(v59 + 16 * v13);
      uint64_t v16 = *v15;
      a3 = v15[1];
      swift_bridgeObjectRetain();
      unint64_t v17 = dispatch thunk of SportingEventPlay.competitors.getter();
      swift_bridgeObjectRetain();
      uint64_t v18 = v4;
      v19 = sub_100099E30(v17, v16, a3);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v67 = v19;
      if (!v19) {
        break;
      }
      v61 = v14;
      uint64_t v60 = v13 + 1;
      sub_100005E5C(&qword_1000FF3F0);
      uint64_t v20 = *(void *)(v8 + 72);
      unint64_t v21 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      uint64_t v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = xmmword_1000CB470;
      uint64_t v66 = v22;
      unint64_t v23 = v22 + v21;
      Sport.scoreStatisticName.getter();
      uint64_t v68 = v20;
      unint64_t v65 = v23;
      (*(void (**)(unint64_t, void, uint64_t))(v8 + 104))(v23 + v20, v57, v6);
      char v24 = 0;
      unint64_t v25 = 0;
      v26 = &_swiftEmptyDictionarySingleton;
      uint64_t v27 = v62;
      v28 = v63;
      do
      {
        char v29 = v24;
        if (v25 >= *(void *)(v66 + 16))
        {
          __break(1u);
LABEL_31:
          __break(1u);
LABEL_32:
          __break(1u);
LABEL_33:
          uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
          __break(1u);
          return result;
        }
        v30 = *v28;
        (*v28)(v27, v65 + v25 * v68, v6);
        uint64_t v31 = dispatch thunk of SportingEventCompetitorContainer.getScoreEntry(name:)();
        if (v31)
        {
          v32 = (void *)v31;
          uint64_t v33 = SportingEventCompetitorScoreEntry.value.getter();

          unint64_t v34 = v27;
          uint64_t v35 = v6;
          v30(v69, v34, v6);
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v70 = v26;
          sub_1000177FC();
          uint64_t v39 = v26[2];
          BOOL v40 = (v38 & 1) == 0;
          Swift::Int v41 = v39 + v40;
          if (__OFADD__(v39, v40)) {
            goto LABEL_31;
          }
          unint64_t v42 = v37;
          char v43 = v38;
          sub_100005E5C(&qword_1000FF3F8);
          Swift::Bool v44 = _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v41);
          uint64_t v6 = v35;
          if (v44)
          {
            sub_1000177FC();
            if ((v43 & 1) != (v46 & 1)) {
              goto LABEL_33;
            }
            unint64_t v42 = v45;
          }
          v26 = v70;
          if (v43)
          {
            *(void *)(v70[7] + 8 * v42) = v33;
          }
          else
          {
            v70[(v42 >> 6) + 8] |= 1 << v42;
            v30(v70[6] + v42 * v68, v69, v35);
            *(void *)(v70[7] + 8 * v42) = v33;
            uint64_t v47 = v70[2];
            BOOL v48 = __OFADD__(v47, 1);
            uint64_t v49 = v47 + 1;
            if (v48) {
              goto LABEL_32;
            }
            v70[2] = v49;
          }
          swift_bridgeObjectRelease();
          v50 = *v64;
          (*v64)(v69, v35);
          uint64_t v27 = v62;
          v50(v62, v6);
          v28 = v63;
        }
        else
        {
          (*v64)(v27, v6);
        }
        char v24 = 1;
        unint64_t v25 = 1;
      }
      while ((v29 & 1) == 0);
      swift_setDeallocating();
      sub_10009C254();
      uint64_t v14 = v61;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100015CBC();
        uint64_t v14 = v52;
      }
      unint64_t v51 = v14[2];
      a3 = v51 + 1;
      uint64_t v4 = v18;
      uint64_t v13 = v60;
      if (v51 >= v14[3] >> 1)
      {
        sub_100015CBC();
        uint64_t v14 = v53;
      }
      uint64_t v8 = v56;
      v14[2] = a3;
      v14[v51 + 4] = v26;

      if (v60 == v58)
      {
        swift_bridgeObjectRelease();
        goto LABEL_26;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_28;
  }
  uint64_t v14 = _swiftEmptyArrayStorage;
LABEL_26:
  if (v14[2] != 2)
  {
LABEL_28:
    sub_10009458C();
    swift_allocError();
    unsigned char *v54 = 2;
    swift_willThrow();
    swift_bridgeObjectRelease();
    return a3;
  }
  a3 = v14[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a3;
}

uint64_t sub_10009A624(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v110 = a2;
  uint64_t v111 = a1;
  uint64_t v7 = sub_100005E5C(&qword_1000FF250);
  uint64_t v8 = sub_10001C9AC(v7);
  __chkstk_darwin(v8);
  sub_10004D594();
  uint64_t v104 = v9;
  sub_100051124();
  __chkstk_darwin(v10);
  sub_100098D3C();
  uint64_t v107 = v11;
  uint64_t v109 = type metadata accessor for SportingEventProgressStatus();
  sub_100009830();
  uint64_t v115 = v12;
  __chkstk_darwin(v13);
  sub_10004D594();
  uint64_t v114 = v14;
  sub_100051124();
  __chkstk_darwin(v15);
  sub_100098D3C();
  uint64_t v113 = v16;
  uint64_t v17 = sub_100005E5C(&qword_1000FF3E8);
  uint64_t v18 = sub_10001C9AC(v17);
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v96 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  sub_10009C3B0();
  uint64_t v112 = type metadata accessor for SportingEventCompetitorWinOutcome();
  sub_100009830();
  uint64_t v105 = v22;
  __chkstk_darwin(v23);
  sub_10004D594();
  uint64_t v102 = v24;
  sub_100051124();
  __chkstk_darwin(v25);
  uint64_t v103 = (uint64_t)&v96 - v26;
  sub_100051124();
  __chkstk_darwin(v27);
  sub_100098D3C();
  uint64_t v108 = v28;
  uint64_t v118 = type metadata accessor for SportingEventCompetitorScoreStatisticType.StatisticName();
  sub_100009830();
  uint64_t v116 = v29;
  __chkstk_darwin(v30);
  sub_10004D594();
  uint64_t v106 = v31;
  sub_100051124();
  __chkstk_darwin(v32);
  unint64_t v34 = (char *)&v96 - v33;
  uint64_t v119 = type metadata accessor for Sport();
  sub_100009830();
  uint64_t v127 = v35;
  __chkstk_darwin(v36);
  sub_1000098F8();
  uint64_t v39 = v38 - v37;
  uint64_t v40 = sub_10009C2EC();
  uint64_t v42 = *(void *)(v41(v40) + 16);
  swift_bridgeObjectRelease();
  if (v42 != 2)
  {
    sub_10009458C();
    swift_allocError();
    unsigned char *v52 = 1;
    return swift_willThrow();
  }
  SportingEventSubscription.sport.getter();
  uint64_t v117 = v39;
  Sport.init(rawValue:)();
  char v43 = (void *)SportingEventSubscription.sportingEventDetails.getter();
  uint64_t v44 = sub_10009C2EC();
  uint64_t result = v45(v44);
  if (*(void *)(result + 16))
  {
    sub_100008B98(result + 32, (uint64_t)v124);
    swift_bridgeObjectRelease();
    uint64_t v47 = sub_10009C2EC();
    uint64_t result = v48(v47);
    if (*(void *)(result + 16) >= 2uLL)
    {
      sub_100008B98(result + 72, (uint64_t)v121);
      swift_bridgeObjectRelease();
      id v49 = v120;
      uint64_t v50 = sub_10009B790(a3, a4);
      if (v49)
      {
        (*(void (**)(uint64_t, uint64_t))(v127 + 8))(v117, v119);

LABEL_27:
        sub_100006178((uint64_t)v121);
        return sub_100006178((uint64_t)v124);
      }
      uint64_t v53 = v50;
      v97 = v20;
      uint64_t v54 = v51;
      swift_bridgeObjectRetain();
      Sport.scoreStatisticName.getter();
      sub_100090A50((uint64_t)v34, v53);
      uint64_t v101 = v53;
      swift_bridgeObjectRelease();
      uint64_t v56 = v116 + 8;
      v55 = *(void (**)(char *, uint64_t))(v116 + 8);
      uint64_t v57 = v118;
      v55(v34, v118);
      swift_bridgeObjectRetain();
      Sport.scoreStatisticName.getter();
      sub_100090A50((uint64_t)v34, v54);
      uint64_t v100 = v54;
      swift_bridgeObjectRelease();
      uint64_t v99 = v56;
      v98 = (void (*)(uint64_t, uint64_t))v55;
      v55(v34, v57);
      id v120 = v43;
      unint64_t v58 = dispatch thunk of SportingEvent.competitors.getter();
      __chkstk_darwin(v58);
      *(&v96 - 2) = (void (*)(uint64_t, uint64_t, uint64_t))v124;
      uint64_t v59 = sub_100099FE0((uint64_t (*)(id *))sub_10009C2D0, (uint64_t)(&v96 - 4), v58);
      swift_bridgeObjectRelease();
      if (v59)
      {
        dispatch thunk of SportingEventCompetitorContainer.winOutcome.getter();

        uint64_t v60 = v112;
        int v61 = sub_1000082E8(v4, 1, v112);
        uint64_t v62 = v114;
        uint64_t v63 = v115;
        uint64_t v64 = v113;
        if (v61 == 1)
        {
          uint64_t v103 = 0;
        }
        else
        {
          v96 = *(void (**)(uint64_t, uint64_t, uint64_t))(v105 + 32);
          v96(v108, v4, v60);
          unint64_t v65 = dispatch thunk of SportingEvent.competitors.getter();
          __chkstk_darwin(v65);
          *(&v96 - 2) = (void (*)(uint64_t, uint64_t, uint64_t))v121;
          uint64_t v66 = sub_100099FE0((uint64_t (*)(id *))sub_10009C18C, (uint64_t)(&v96 - 4), v65);
          swift_bridgeObjectRelease();
          if (v66)
          {
            uint64_t v4 = (uint64_t)v97;
            dispatch thunk of SportingEventCompetitorContainer.winOutcome.getter();

            uint64_t v67 = v60;
            if (sub_1000082E8(v4, 1, v60) != 1)
            {
              v96(v103, v4, v60);
              uint64_t v68 = v105;
              uint64_t v69 = *(void (**)(uint64_t))(v105 + 104);
              uint64_t v70 = v102;
              uint64_t v71 = sub_10009C378();
              v69(v71);
              sub_10006AAA4(v108, v70);
              v72 = *(void (**)(void))(v68 + 8);
              sub_10009C350();
              v72();
              uint64_t v73 = sub_10009C378();
              v69(v73);
              sub_10006AAA4(v103, v70);
              sub_10009C350();
              v72();
              sub_10009C350();
              v72();
              sub_10009C350();
              v72();
LABEL_25:
              uint64_t v89 = v119;
              goto LABEL_26;
            }
          }
          else
          {
            uint64_t v4 = (uint64_t)v97;
            sub_1000082C0((uint64_t)v97, 1, 1, v60);
            uint64_t v67 = v60;
          }
          uint64_t v103 = 0;
          (*(void (**)(uint64_t, uint64_t))(v105 + 8))(v108, v67);
        }
      }
      else
      {
        uint64_t v103 = 0;
        sub_1000082C0(v4, 1, 1, v112);
        uint64_t v62 = v114;
        uint64_t v63 = v115;
        uint64_t v64 = v113;
      }
      sub_10008DFA8(v4, &qword_1000FF3E8);
      SportingEvent.progressStatus.getter();
      v74 = *(void (**)(uint64_t, void, uint64_t))(v63 + 104);
      uint64_t v75 = v109;
      v74(v62, enum case for SportingEventProgressStatus.final(_:), v109);
      char v76 = sub_10006A990(v64, v62);
      v77 = *(void (**)(uint64_t, uint64_t))(v63 + 8);
      v77(v62, v75);
      v77(v64, v75);
      if ((v76 & 1) == 0)
      {
        uint64_t v78 = v75;
        SportingEvent.progressStatus.getter();
        v74(v62, enum case for SportingEventProgressStatus.forfeit(_:), v75);
        char v79 = sub_10006A990(v64, v62);
        v77(v62, v78);
        v77(v64, v78);
        if ((v79 & 1) == 0)
        {
          uint64_t v89 = v119;
LABEL_26:
          uint64_t v92 = v125;
          uint64_t v93 = v126;
          sub_100005EA0(v124, v125);
          (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v92, v93);
          swift_bridgeObjectRetain();
          SportsActivityContender.init(canonicalId:scoreEntries:isWinnerIndicatorVisible:)();
          uint64_t v94 = v122;
          uint64_t v95 = v123;
          sub_100005EA0(v121, v122);
          (*(void (**)(uint64_t, uint64_t))(v95 + 8))(v94, v95);
          swift_bridgeObjectRetain();
          SportsActivityContender.init(canonicalId:scoreEntries:isWinnerIndicatorVisible:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          (*(void (**)(uint64_t, uint64_t))(v127 + 8))(v117, v89);
          goto LABEL_27;
        }
      }
      v80 = (void *)SportingEvent.clock.getter();
      v81 = (void *)SportingEventCurrentClock.current.getter();

      v82 = (void *)SportingEventClock.period.getter();
      uint64_t v83 = v107;
      dispatch thunk of SportingEventClockPeriod.type.getter();

      uint64_t v84 = type metadata accessor for SportingEventClockPeriodType();
      int v85 = sub_1000082E8(v83, 1, v84);
      uint64_t v86 = v106;
      if (v85 != 1)
      {
        uint64_t v87 = v104;
        sub_10008DF48(v83, v104, &qword_1000FF250);
        uint64_t v88 = *(void *)(v84 - 8);
        if ((*(unsigned int (**)(uint64_t, uint64_t))(v88 + 88))(v87, v84) == enum case for SportingEventClockPeriodType.shootouts(_:))
        {
          (*(void (**)(uint64_t, void, uint64_t))(v116 + 104))(v86, enum case for SportingEventCompetitorScoreStatisticType.StatisticName.shootout(_:), v118);
LABEL_24:
          sub_10008DFA8(v83, &qword_1000FF250);
          uint64_t v90 = v101;
          swift_bridgeObjectRetain();
          sub_100090A50(v86, v90);
          swift_bridgeObjectRelease();
          uint64_t v91 = v100;
          swift_bridgeObjectRetain();
          sub_100090A50(v86, v91);
          swift_bridgeObjectRelease();
          v98(v86, v118);
          goto LABEL_25;
        }
        (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v87, v84);
      }
      Sport.scoreStatisticName.getter();
      goto LABEL_24;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10009B160(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v59[1] = a3;
  v59[2] = a4;
  uint64_t v64 = a1;
  uint64_t v8 = sub_100005E5C((uint64_t *)&unk_1000FDA80);
  uint64_t v9 = sub_10001C9AC(v8);
  __chkstk_darwin(v9);
  sub_10004D594();
  v59[0] = v10;
  sub_100051124();
  __chkstk_darwin(v11);
  sub_10009C3B0();
  type metadata accessor for URLQueryItem();
  sub_100009830();
  uint64_t v65 = v13;
  uint64_t v66 = v12;
  __chkstk_darwin(v12);
  sub_10004D594();
  uint64_t v61 = v14;
  sub_100051124();
  __chkstk_darwin(v15);
  sub_100098D3C();
  uint64_t v60 = v16;
  type metadata accessor for URLComponents();
  sub_100009830();
  uint64_t v62 = v18;
  uint64_t v63 = v17;
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)v59 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)v59 - v22;
  uint64_t v24 = sub_100005E5C(&qword_1000FD498);
  uint64_t v25 = sub_10001C9AC(v24);
  __chkstk_darwin(v25);
  sub_1000098F8();
  uint64_t v28 = v27 - v26;
  uint64_t v29 = type metadata accessor for SportingEventSubscription.Metadata();
  sub_100009830();
  uint64_t v31 = v30;
  __chkstk_darwin(v32);
  sub_1000098F8();
  uint64_t v35 = v34 - v33;
  sub_10008DF48(a5, v28, &qword_1000FD498);
  if (sub_1000082E8(v28, 1, v29) == 1)
  {
    sub_10008DFA8(v28, &qword_1000FD498);
    if (qword_1000FBDE0 != -1) {
      swift_once();
    }
    uint64_t v36 = type metadata accessor for Logger();
    sub_10000929C(v36, (uint64_t)qword_10010A568);
    uint64_t v37 = Logger.logObject.getter();
    os_log_type_t v38 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v39 = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "Cannot create event deeplink URL, metadata is missing", v39, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 32))(v35, v28, v29);
    swift_bridgeObjectRetain();
    v67._countAndFlagsBits = v64;
    v67._object = a2;
    int v41 = sub_100052DB4(v67);
    uint64_t v42 = v35;
    if (v41 == 2)
    {
      URLComponents.init()();
      sub_10009C360();
      URLComponents.scheme.setter();
      sub_10009C390();
      swift_bridgeObjectRetain();
      uint64_t v49 = v61;
      sub_10009C328();
      URLQueryItem.init(name:value:)();
      swift_bridgeObjectRelease();
      sub_100005E5C(&qword_1000FC8D0);
      uint64_t v50 = v65;
      unint64_t v51 = (*(unsigned __int8 *)(v65 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v65 + 80);
      uint64_t v52 = swift_allocObject();
      *(_OWORD *)(v52 + 16) = xmmword_1000CABA0;
      uint64_t v53 = v66;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v50 + 16))(v52 + v51, v49, v66);
      URLComponents.queryItems.setter();
      uint64_t v54 = v59[0];
      URLComponents.url.getter();
      uint64_t v55 = type metadata accessor for URL();
      if (sub_1000082E8(v54, 1, v55) == 1)
      {
        sub_10008DFA8(v54, (uint64_t *)&unk_1000FDA80);
        uint64_t v40 = 0;
      }
      else
      {
        uint64_t v40 = URL.absoluteString.getter();
        sub_1000438A0();
        (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v54, v55);
      }
      (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v61, v53);
      (*(void (**)(char *, uint64_t))(v62 + 8))(v20, v63);
    }
    else
    {
      uint64_t v44 = v65;
      uint64_t v43 = v66;
      if (v41 == 1)
      {
        URLComponents.init()();
        sub_10009C360();
        URLComponents.scheme.setter();
        sub_10009C390();
        swift_bridgeObjectRetain();
        uint64_t v45 = v60;
        sub_10009C328();
        URLQueryItem.init(name:value:)();
        swift_bridgeObjectRelease();
        sub_100005E5C(&qword_1000FC8D0);
        unint64_t v46 = (*(unsigned __int8 *)(v44 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
        uint64_t v47 = swift_allocObject();
        *(_OWORD *)(v47 + 16) = xmmword_1000CABA0;
        (*(void (**)(unint64_t, uint64_t, uint64_t))(v44 + 16))(v47 + v46, v45, v43);
        URLComponents.queryItems.setter();
        URLComponents.url.getter();
        uint64_t v48 = type metadata accessor for URL();
        if (sub_1000082E8(v5, 1, v48) == 1)
        {
          sub_10008DFA8(v5, (uint64_t *)&unk_1000FDA80);
          uint64_t v40 = 0;
        }
        else
        {
          uint64_t v40 = URL.absoluteString.getter();
          sub_1000438A0();
          (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v5, v48);
        }
        (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v60, v43);
        (*(void (**)(char *, uint64_t))(v62 + 8))(v23, v63);
      }
      else
      {
        uint64_t v40 = SportingEventSubscription.Metadata.eventURL.getter();
      }
    }
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v42, v29);
  }
  return v40;
}

uint64_t sub_10009B790(uint64_t a1, void *a2)
{
  uint64_t v104 = type metadata accessor for SportingEventCompetitorScoreStatisticType.StatisticName();
  uint64_t v94 = *(void *)(v104 - 8);
  __chkstk_darwin(v104);
  v97 = (char *)&v84 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v108 = (char *)&v84 - v7;
  uint64_t v86 = type metadata accessor for Sport();
  uint64_t v85 = *(void *)(v86 - 8);
  __chkstk_darwin(v86);
  uint64_t v9 = (char *)&v84 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = a2[3];
  uint64_t v11 = a2[4];
  sub_100005EA0(a2, v10);
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 32);
  uint64_t v13 = *(void *)(v12(v10, v11) + 16);
  swift_bridgeObjectRelease();
  if (v13 != 2)
  {
    sub_10009458C();
    swift_allocError();
    *uint64_t v78 = 1;
    swift_willThrow();
    return v10;
  }
  SportingEventSubscription.sport.getter();
  uint64_t v93 = v9;
  Sport.init(rawValue:)();
  uint64_t v14 = v12(v10, v11);
  uint64_t v15 = v14;
  uint64_t v92 = *(void *)(v14 + 16);
  if (v92)
  {
    unint64_t v16 = 0;
    uint64_t v91 = v14 + 32;
    unsigned int v90 = enum case for SportingEventCompetitorScoreStatisticType.StatisticName.shootout(_:);
    uint64_t v89 = v94 + 104;
    uint64_t v109 = (void (**)(char *, unint64_t, uint64_t))(v94 + 16);
    v98 = (void (**)(char *, uint64_t))(v94 + 8);
    v96 = _swiftEmptyArrayStorage;
    long long v88 = xmmword_1000CB470;
    uint64_t v17 = v104;
    uint64_t v18 = v108;
    uint64_t v99 = a1;
    uint64_t v100 = v2;
    uint64_t v87 = v14;
    while (1)
    {
      if (v16 >= *(void *)(v15 + 16))
      {
LABEL_67:
        __break(1u);
        goto LABEL_68;
      }
      unint64_t v95 = v16 + 1;
      sub_100008B98(v91 + 40 * v16, (uint64_t)v113);
      sub_100005E5C(&qword_1000FF3F0);
      uint64_t v19 = v94;
      uint64_t v20 = *(void *)(v94 + 72);
      unint64_t v21 = (*(unsigned __int8 *)(v94 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v94 + 80);
      uint64_t v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = v88;
      uint64_t v103 = v22;
      unint64_t v23 = v22 + v21;
      Sport.scoreStatisticName.getter();
      uint64_t v105 = v20;
      unint64_t v101 = v23;
      (*(void (**)(unint64_t, void, uint64_t))(v19 + 104))(v23 + v20, v90, v17);
      int v24 = 0;
      unint64_t v25 = 0;
      uint64_t v102 = &_swiftEmptyDictionarySingleton;
      do
      {
        if (v25 >= *(void *)(v103 + 16))
        {
          __break(1u);
          goto LABEL_64;
        }
        int v111 = v24;
        uint64_t v107 = *v109;
        v107(v18, v101 + v25 * v105, v17);
        uint64_t v26 = v114;
        uint64_t v27 = v115;
        sub_100005EA0(v113, v114);
        uint64_t v28 = (*(uint64_t (**)(uint64_t, uint64_t))(v27 + 8))(v26, v27);
        uint64_t v30 = v29;
        uint64_t v31 = SportingEventSubscription.sportingEventDetails.getter();
        unint64_t v32 = dispatch thunk of SportingEvent.competitors.getter();
        unint64_t v33 = v32;
        uint64_t v112 = (void *)v31;
        if (v32 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v34 = _CocoaArrayWrapper.endIndex.getter();
          if (!v34) {
            goto LABEL_30;
          }
        }
        else
        {
          uint64_t v34 = *(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (!v34) {
            goto LABEL_30;
          }
        }
        unint64_t v106 = v33 & 0xC000000000000001;
        uint64_t v110 = v34;
        if ((v33 & 0xC000000000000001) != 0) {
          id v35 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id v35 = *(id *)(v33 + 32);
        }
        uint64_t v36 = v35;
        uint64_t v37 = (void *)SportingEventCompetitorContainer.competitor.getter();
        uint64_t v38 = SportingEventCompetitor.canonicalId.getter();
        uint64_t v40 = v39;

        BOOL v41 = v38 == v28 && v40 == v30;
        if (v41)
        {
LABEL_32:
          uint64_t v18 = v108;
          uint64_t v43 = v112;
          swift_bridgeObjectRelease();
        }
        else
        {
          char v42 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if ((v42 & 1) == 0)
          {

            uint64_t v18 = v108;
            if (v110 != 1)
            {
              uint64_t v44 = 5;
              while (1)
              {
                id v45 = v106
                    ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
                    : *(id *)(v33 + 8 * v44);
                uint64_t v36 = v45;
                uint64_t v46 = v44 - 3;
                if (__OFADD__(v44 - 4, 1)) {
                  break;
                }
                uint64_t v47 = (void *)SportingEventCompetitorContainer.competitor.getter();
                uint64_t v48 = SportingEventCompetitor.canonicalId.getter();
                uint64_t v50 = v49;

                if (v48 == v28 && v50 == v30)
                {
                  uint64_t v17 = v104;
                  goto LABEL_32;
                }
                char v52 = _stringCompareWithSmolCheck(_:_:expecting:)();
                swift_bridgeObjectRelease();
                if (v52)
                {
                  uint64_t v17 = v104;
                  goto LABEL_16;
                }

                ++v44;
                BOOL v41 = v46 == v110;
                uint64_t v17 = v104;
                uint64_t v18 = v108;
                if (v41) {
                  goto LABEL_30;
                }
              }
LABEL_64:
              __break(1u);
LABEL_65:
              __break(1u);
LABEL_66:
              __break(1u);
              goto LABEL_67;
            }
LABEL_30:
            swift_bridgeObjectRelease_n();
            uint64_t v43 = v112;
LABEL_40:
            swift_bridgeObjectRelease();

            (*v98)(v18, v17);
            goto LABEL_44;
          }
LABEL_16:
          uint64_t v18 = v108;
          uint64_t v43 = v112;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v53 = (void *)dispatch thunk of SportingEventCompetitorContainer.getScoreEntry(name:)();

        if (!v53) {
          goto LABEL_40;
        }
        uint64_t v54 = SportingEventCompetitorScoreEntry.value.getter();
        swift_bridgeObjectRelease();

        v107(v97, (unint64_t)v18, v17);
        uint64_t v55 = v102;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v116 = v55;
        sub_1000177FC();
        uint64_t v59 = v55[2];
        BOOL v60 = (v58 & 1) == 0;
        Swift::Int v61 = v59 + v60;
        if (__OFADD__(v59, v60)) {
          goto LABEL_65;
        }
        unint64_t v62 = v57;
        char v63 = v58;
        sub_100005E5C(&qword_1000FF3F8);
        Swift::Bool v64 = _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v61);
        uint64_t v17 = v104;
        if (v64)
        {
          sub_1000177FC();
          if ((v63 & 1) != (v66 & 1)) {
            goto LABEL_70;
          }
          unint64_t v62 = v65;
        }
        uint64_t v102 = v116;
        if (v63)
        {
          *(void *)(v116[7] + 8 * v62) = v54;
        }
        else
        {
          v116[(v62 >> 6) + 8] |= 1 << v62;
          v107((char *)(v102[6] + v62 * v105), (unint64_t)v97, v17);
          Swift::String v67 = v102;
          *(void *)(v102[7] + 8 * v62) = v54;
          uint64_t v68 = v67[2];
          BOOL v69 = __OFADD__(v68, 1);
          uint64_t v70 = v68 + 1;
          if (v69) {
            goto LABEL_66;
          }
          v67[2] = v70;
        }
        swift_bridgeObjectRelease();
        uint64_t v71 = *v98;
        (*v98)(v97, v17);
        v71(v18, v17);
LABEL_44:
        int v24 = 1;
        unint64_t v25 = 1;
      }
      while ((v111 & 1) == 0);
      swift_setDeallocating();
      sub_10009C254();
      char v72 = swift_isUniquelyReferenced_nonNull_native();
      if (v72)
      {
        uint64_t v73 = v96;
      }
      else
      {
        sub_100015CBC();
        uint64_t v73 = v76;
      }
      uint64_t v15 = v87;
      unint64_t v74 = v73[2];
      uint64_t v75 = v102;
      if (v74 >= v73[3] >> 1)
      {
        sub_100015CBC();
        uint64_t v75 = v102;
        uint64_t v73 = v77;
      }
      v73[2] = v74 + 1;
      v96 = v73;
      v73[v74 + 4] = v75;
      sub_100006178((uint64_t)v113);
      unint64_t v16 = v95;
      if (v95 == v92)
      {
        swift_bridgeObjectRelease();
        char v79 = v96;
        goto LABEL_59;
      }
    }
  }
  swift_bridgeObjectRelease();
  char v79 = _swiftEmptyArrayStorage;
LABEL_59:
  uint64_t v80 = v79[2];
  v81 = v93;
  if (v80)
  {
    if (v80 != 1)
    {
      uint64_t v10 = v79[4];
      v82 = *(void (**)(char *, uint64_t))(v85 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v82(v81, v86);
      swift_bridgeObjectRelease();
      return v10;
    }
  }
  else
  {
LABEL_68:
    __break(1u);
  }
  __break(1u);
LABEL_70:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_10009C0B4(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)SportingEventCompetitorContainer.competitor.getter();
  uint64_t v4 = SportingEventCompetitor.canonicalId.getter();
  uint64_t v6 = v5;

  uint64_t v7 = a2[3];
  uint64_t v8 = a2[4];
  sub_100005EA0(a2, v7);
  if (v4 == (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v7, v8) && v6 == v9) {
    char v11 = 1;
  }
  else {
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

uint64_t sub_10009C18C(uint64_t a1)
{
  return sub_10009C0B4(a1, *(void **)(v1 + 16)) & 1;
}

uint64_t sub_10009C1AC()
{
  swift_arrayDestroy();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t sub_10009C1F0()
{
  sub_100005E5C(&qword_1000FF400);
  swift_arrayDestroy();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t sub_10009C254()
{
  type metadata accessor for SportingEventCompetitorScoreStatisticType.StatisticName();
  swift_arrayDestroy();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t sub_10009C2D0(uint64_t a1)
{
  return sub_10009C18C(a1) & 1;
}

uint64_t sub_10009C2EC()
{
  uint64_t v1 = v0[3];
  sub_100005EA0(v0, v1);
  return v1;
}

uint64_t sub_10009C328()
{
  return 0x6163696E6F6E6163;
}

uint64_t sub_10009C360()
{
  return 0x68737374726F7073;
}

uint64_t sub_10009C378()
{
  return v0;
}

uint64_t sub_10009C390()
{
  return URLComponents.host.setter(0x746E657665, 0xE500000000000000);
}

uint64_t sub_10009C3B0()
{
  return 0;
}

void *sub_10009C3C4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100017DA8();
    uint64_t v3 = *(void *)(type metadata accessor for SportsActivityManagedContext() - 8);
    uint64_t v4 = *(void *)(v3 + 72);
    uint64_t v5 = (uint64_t *)(((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)) + a1 + 8);
    do
    {
      uint64_t v7 = *(v5 - 1);
      uint64_t v6 = *v5;
      unint64_t v9 = _swiftEmptyArrayStorage[2];
      unint64_t v8 = _swiftEmptyArrayStorage[3];
      swift_bridgeObjectRetain();
      if (v9 >= v8 >> 1) {
        sub_100017DA8();
      }
      uint64_t v5 = (uint64_t *)((char *)v5 + v4);
      _swiftEmptyArrayStorage[2] = v9 + 1;
      uint64_t v10 = &_swiftEmptyArrayStorage[2 * v9];
      v10[4] = v7;
      v10[5] = v6;
      --v1;
    }
    while (v1);
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_10009C4F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, long long *a4@<X3>, uint64_t a5@<X4>, long long *a6@<X5>, uint64_t a7@<X8>, double a8@<D0>)
{
  uint64_t v33 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  sub_10000C568();
  uint64_t v17 = v16;
  __chkstk_darwin(v18);
  sub_100009908();
  uint64_t v19 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v19);
  sub_1000098F8();
  uint64_t v20 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v20 - 8);
  sub_100009864();
  *(void *)a7 = a1;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 16) = a3;
  sub_10009C814(a4, (_OWORD *)(a7 + 24));
  *(void *)(a7 + 72) = a5;
  sub_100008CAC(a6, a7 + 80);
  sub_100075988();
  static DispatchQoS.unspecified.getter();
  v34[0] = &_swiftEmptyArrayStorage;
  sub_10009EDAC(&qword_1000FF408, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100005E5C(&qword_1000FF410);
  sub_10000953C(&qword_1000FF418, &qword_1000FF410);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(uint64_t, void, uint64_t))(v17 + 104))(v8, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v33);
  *(void *)(a7 + 120) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  *(double *)(a7 + 128) = a8;
  unint64_t v21 = (objc_class *)type metadata accessor for ActivityAuthorization();
  id v22 = [objc_allocWithZone(v21) init];
  unint64_t v23 = sub_1000522C4();
  uint64_t v25 = v24;
  v34[3] = v21;
  v34[4] = &off_1000F15C8;
  v34[0] = v22;
  type metadata accessor for ActivityCapUtility();
  uint64_t v26 = (void *)swift_allocObject();
  sub_10000A014((uint64_t)v34, (uint64_t)v21);
  sub_10000C568();
  __chkstk_darwin(v27);
  sub_100009864();
  (*(void (**)(uint64_t *))(v28 + 16))(v9);
  uint64_t v29 = *v9;
  v26[5] = v21;
  v26[6] = &off_1000F15C8;
  v26[2] = v29;
  v26[7] = v23;
  v26[8] = v25;
  uint64_t result = sub_100006178((uint64_t)v34);
  *(void *)(a7 + 136) = v26;
  return result;
}

_OWORD *sub_10009C814(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

uint64_t destroy for SubscriptionRefreshStaleActivitiesOperation(uint64_t a1)
{
  swift_release();
  swift_release();
  sub_100006178(a1 + 24);
  swift_release();
  sub_100006178(a1 + 80);

  return swift_release();
}

uint64_t initializeWithCopy for SubscriptionRefreshStaleActivitiesOperation(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v5 = a2 + 24;
  uint64_t v6 = *(void *)(a2 + 64);
  long long v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 48) = v7;
  *(void *)(a1 + 64) = v6;
  uint64_t v8 = v7;
  unint64_t v9 = **(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8);
  swift_retain();
  swift_retain();
  v9(a1 + 24, v5, v8);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  long long v10 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v10;
  uint64_t v11 = v10;
  uint64_t v12 = **(void (***)(uint64_t, uint64_t, uint64_t))(v10 - 8);
  swift_retain();
  v12(a1 + 80, a2 + 80, v11);
  uint64_t v13 = *(void **)(a2 + 120);
  uint64_t v14 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = v13;
  *(void *)(a1 + 128) = v14;
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  id v15 = v13;
  swift_retain();
  return a1;
}

void *assignWithCopy for SubscriptionRefreshStaleActivitiesOperation(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  sub_10009CA84(a1 + 3, a2 + 3);
  a1[9] = a2[9];
  swift_retain();
  swift_release();
  sub_100008E94(a1 + 10, a2 + 10);
  uint64_t v5 = (void *)a2[15];
  uint64_t v6 = (void *)a1[15];
  a1[15] = v5;
  id v7 = v5;

  a1[16] = a2[16];
  a1[17] = a2[17];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t *sub_10009CA84(uint64_t *result, uint64_t *a2)
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
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        uint64_t *v3 = v12;
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
      result[5] = a2[5];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
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
          uint64_t *v3 = *a2;
          swift_retain();
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

void *initializeWithTake for SubscriptionRefreshStaleActivitiesOperation(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x90uLL);
}

uint64_t assignWithTake for SubscriptionRefreshStaleActivitiesOperation(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  sub_100006178(a1 + 24);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  sub_100006178(a1 + 80);
  long long v4 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v4;
  uint64_t v5 = *(void *)(a2 + 120);
  uint64_t v6 = *(void **)(a1 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v5;

  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SubscriptionRefreshStaleActivitiesOperation(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 144))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SubscriptionRefreshStaleActivitiesOperation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 144) = 1;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 144) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SubscriptionRefreshStaleActivitiesOperation()
{
  return &type metadata for SubscriptionRefreshStaleActivitiesOperation;
}

uint64_t sub_10009CE28()
{
  uint64_t v3 = sub_100005E5C(&qword_1000FE4D0);
  __chkstk_darwin(v3 - 8);
  sub_1000098F8();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = sub_100005E5C(&qword_1000FF420);
  sub_10000C568();
  uint64_t v9 = v8;
  __chkstk_darwin(v10);
  sub_100009864();
  sub_100005E5C(&qword_1000FF428);
  sub_10000C568();
  __chkstk_darwin(v11);
  sub_100069F80();
  uint64_t v35 = sub_100005E5C(&qword_1000FF430);
  sub_10000C568();
  __chkstk_darwin(v12);
  sub_100009908();
  uint64_t v36 = sub_100005E5C(&qword_1000FF438);
  sub_10000C568();
  __chkstk_darwin(v13);
  sub_10000C58C();
  sub_10009F6F0(v14);
  sub_100005E5C(&qword_1000FF440);
  sub_10000C568();
  __chkstk_darwin(v15);
  sub_10000C58C();
  sub_10009F6F0(v16);
  sub_100005E5C(&qword_1000FF448);
  sub_10000C568();
  __chkstk_darwin(v17);
  sub_10000C58C();
  sub_10009F6F0(v18);
  sub_10009E5B8(v0, (uint64_t)v37);
  uint64_t v19 = swift_allocObject();
  sub_10009F6C8(v19);
  sub_100005E5C(&qword_1000FF450);
  sub_10000953C(&qword_1000FF458, &qword_1000FF450);
  Deferred.init(createPublisher:)();
  v37[0] = *(id *)(v0 + 120);
  id v20 = v37[0];
  uint64_t v33 = type metadata accessor for OS_dispatch_queue.SchedulerOptions();
  sub_1000082C0(v6, 1, 1, v33);
  sub_100075988();
  sub_10000953C(&qword_1000FF460, &qword_1000FF420);
  sub_10009EDAC(&qword_1000FE548, (void (*)(uint64_t))sub_100075988);
  id v21 = v20;
  Publisher.receive<A>(on:options:)();
  sub_10009E5FC(v6);

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v2, v7);
  static Subscribers.Demand.unlimited.getter();
  sub_100005E5C(&qword_1000FF468);
  sub_10000953C(&qword_1000FF470, &qword_1000FF428);
  sub_10000953C(&qword_1000FF478, &qword_1000FF468);
  Publisher<>.flatMap<A>(maxPublishers:_:)();
  sub_10009F6E4();
  sub_10009F6B8();
  v22();
  sub_10009E5B8(v0, (uint64_t)v37);
  uint64_t v23 = swift_allocObject();
  sub_10009F6C8(v23);
  sub_10000953C(&qword_1000FF480, &qword_1000FF430);
  Publisher.filter(_:)();
  swift_release();
  sub_10009F6E4();
  v24(v1, v35);
  sub_10009E5B8(v0, (uint64_t)v37);
  uint64_t v25 = swift_allocObject();
  sub_10009F6C8(v25);
  sub_100005E5C(&qword_1000FD998);
  sub_10000953C(&qword_1000FF488, &qword_1000FF438);
  sub_10000953C(&qword_1000FD9A0, &qword_1000FD998);
  Publisher.flatMap<A>(maxPublishers:_:)();
  swift_release();
  sub_10009F6E4();
  v26(v34, v36);
  v37[0] = *(id *)(v0 + 120);
  id v27 = v37[0];
  sub_1000082C0(v6, 1, 1, v33);
  sub_10000953C(&qword_1000FF490, &qword_1000FF440);
  id v28 = v27;
  Publisher.subscribe<A>(on:options:)();
  sub_10009E5FC(v6);

  sub_10009F6B8();
  v29();
  sub_10000953C(&qword_1000FF498, &qword_1000FF448);
  uint64_t v30 = Publisher.eraseToAnyPublisher()();
  sub_10009F6B8();
  v31();
  return v30;
}

uint64_t sub_10009D58C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_10009E5B8(a1, (uint64_t)v5);
  uint64_t v3 = swift_allocObject();
  memcpy((void *)(v3 + 16), v5, 0x90uLL);
  sub_100005E5C(&qword_1000FF450);
  swift_allocObject();
  uint64_t result = Future.init(_:)();
  *a2 = result;
  return result;
}

uint64_t sub_10009D624(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100005E5C(&qword_1000FC940);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = &__src[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  *(void *)(v9 + 24) = a2;
  uint64_t v10 = type metadata accessor for TaskPriority();
  sub_1000082C0((uint64_t)v8, 1, 1, v10);
  sub_10009E5B8(a3, (uint64_t)__src);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  memcpy(v11 + 4, __src, 0x90uLL);
  v11[22] = sub_10001D24C;
  v11[23] = v9;
  swift_retain();
  sub_100051F94((uint64_t)v8, (uint64_t)&unk_1000FF4D8, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_10009D75C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  return _swift_task_switch(sub_10009D780, 0, 0);
}

uint64_t sub_10009D780()
{
  sub_10001C234();
  *(void *)(v0 + 56) = sub_100005EA0((void *)(*(void *)(v0 + 32) + 24), *(void *)(*(void *)(v0 + 32) + 48));
  if (qword_1000FBD90 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_10010A4D0;
  return _swift_task_switch(sub_10009D824, v1, 0);
}

uint64_t sub_10009D824()
{
  sub_10001C234();
  *(void *)(v0 + 64) = sub_10005F554();
  return _swift_task_switch(sub_10009D890, 0, 0);
}

uint64_t sub_10009D890()
{
  uint64_t v12 = v0;
  uint64_t v1 = sub_10009C3C4(*(void *)(v0 + 64));
  swift_bridgeObjectRelease();
  if (qword_1000FBDE0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_10000929C(v2, (uint64_t)qword_10010A568);
  swift_bridgeObjectRetain_n();
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v6 = Array.description.getter();
    unint64_t v8 = v7;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 24) = sub_100017098(v6, v8, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Checking for stale activities: '%s'", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  (*(void (**)(void *, void))(v0 + 40))(v1, 0);
  swift_bridgeObjectRelease();
  sub_10001C2E0();
  return v9();
}

uint64_t sub_10009DAC8()
{
  return Publishers.Sequence.init(sequence:)();
}

uint64_t sub_10009DB6C(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v24 - v9;
  unint64_t v11 = a1[1];
  uint64_t v24 = *a1;
  uint64_t v12 = *(void *)(a2 + 16);
  if ((sub_10007AD1C() & 1) == 0) {
    _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  sub_100005EA0((void *)(v12 + 16), *(void *)(v12 + 40));
  uint64_t v13 = dispatch thunk of PersistentStorable.retrieveEventSubscription(canonicalId:isConventionalOrUnified:)();
  if (!v13) {
    return 0;
  }
  uint64_t v14 = (void *)v13;
  (*(void (**)(void))a2)();
  SportingEventSubscription.updatedAt.getter();
  Date.timeIntervalSince(_:)();
  double v16 = v15;
  uint64_t v17 = *(void (**)(char *, uint64_t))(v5 + 8);
  v17(v7, v4);
  v17(v10, v4);
  if (*(double *)(a2 + 128) >= v16)
  {

    return 0;
  }
  if (qword_1000FBDE0 != -1) {
    swift_once();
  }
  uint64_t v18 = type metadata accessor for Logger();
  sub_10000929C(v18, (uint64_t)qword_10010A568);
  sub_10009E5B8(a2, (uint64_t)v27);
  swift_bridgeObjectRetain_n();
  uint64_t v19 = Logger.logObject.getter();
  os_log_type_t v20 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    *(_DWORD *)uint64_t v21 = 136315650;
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_100017098(v24, v11, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v21 + 12) = 2048;
    uint64_t v25 = *(void *)&v16;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v21 + 22) = 2048;
    uint64_t v25 = v28;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    sub_10009F2A0((uint64_t)v27);
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Detected stale activity %s: (%f > %f).", (uint8_t *)v21, 0x20u);
    uint64_t v22 = 1;
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_10009F2A0((uint64_t)v27);

    return 1;
  }
  return v22;
}

uint64_t sub_10009DF38(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  long long v24 = *(_OWORD *)(a2 + 48);
  uint64_t v5 = sub_100005EA0((void *)(a2 + 24), v24);
  long long v27 = v24;
  uint64_t v6 = sub_100029BE0(v26);
  (*(void (**)(uint64_t *, void *, void))(*(void *)(v24 - 8) + 16))(v6, v5, v24);
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 72);
  sub_100008B98(a2 + 80, (uint64_t)v30);
  uint64_t v28 = v7;
  uint64_t v29 = v8;
  v30[5] = v4;
  v30[6] = v3;
  uint64_t v9 = (objc_class *)type metadata accessor for ActivityAuthorization();
  id v10 = objc_allocWithZone(v9);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  id v11 = [v10 init];
  unint64_t v12 = sub_1000522C4();
  uint64_t v14 = v13;
  v25[3] = v9;
  v25[4] = &off_1000F15C8;
  v25[0] = v11;
  type metadata accessor for ActivityCapUtility();
  double v15 = (void *)swift_allocObject();
  uint64_t v16 = sub_10000A014((uint64_t)v25, (uint64_t)v9);
  __n128 v17 = __chkstk_darwin(v16);
  uint64_t v19 = (void *)((char *)&v25[-2] - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *, __n128))(v20 + 16))(v19, v17);
  uint64_t v21 = *v19;
  v15[5] = v9;
  v15[6] = &off_1000F15C8;
  v15[2] = v21;
  v15[7] = v12;
  v15[8] = v14;
  sub_100006178((uint64_t)v25);
  v30[7] = v15;
  uint64_t v22 = sub_10009E194();
  sub_10009E6DC((uint64_t)v26);
  v26[0] = v22;
  LOBYTE(v25[0]) = 0;
  sub_100005E5C(&qword_1000FCEE8);
  sub_10000953C((unint64_t *)&qword_1000FCEF0, &qword_1000FCEE8);
  Publisher.replaceError(with:)();
  return swift_release();
}

uint64_t sub_10009E194()
{
  uint64_t v2 = (uint64_t)v0;
  uint64_t v25 = type metadata accessor for Date();
  sub_10000C568();
  __chkstk_darwin(v3);
  sub_1000098F8();
  uint64_t v6 = v5 - v4;
  uint64_t refreshed = type metadata accessor for SubscriptionRefreshOperation();
  __chkstk_darwin(refreshed);
  sub_100069F80();
  sub_100005E5C(&qword_1000FD998);
  sub_10000C568();
  __chkstk_darwin(v8);
  sub_10000C58C();
  sub_100005E5C(&qword_1000FF4A0);
  sub_10000C568();
  __chkstk_darwin(v9);
  sub_10000C58C();
  sub_10009F6F0(v10);
  uint64_t v11 = v0[5];
  uint64_t v12 = v0[6];
  sub_100008B98((uint64_t)(v0 + 7), (uint64_t)__src);
  uint64_t v13 = v0[12];
  uint64_t v14 = v0[13];
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  if (sub_10007AD1C()) {
    char v15 = 1;
  }
  else {
    char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  static SportsManager.RefreshOptions.all.getter();
  *(void *)uint64_t v1 = v11;
  *(void *)(v1 + 8) = v12;
  sub_100008CAC(__src, v1 + 16);
  *(void *)(v1 + 56) = v13;
  *(void *)(v1 + 64) = v14;
  *(unsigned char *)(v1 + 72) = v15 & 1;
  uint64_t v16 = *(int *)(refreshed + 40);
  Date.init()();
  uint64_t v17 = sub_1000A268C();
  sub_10009F6E4();
  v18(v6, v25);
  *(void *)(v1 + v16) = v17;
  uint64_t v19 = sub_1000C2A0C();
  sub_10009E70C(v1);
  *(void *)&__src[0] = v19;
  char v27 = 0;
  sub_100005E5C(&qword_1000FCEE8);
  sub_10000953C((unint64_t *)&qword_1000FCEF0, &qword_1000FCEE8);
  Publisher.replaceError(with:)();
  swift_release();
  sub_10009E804(v2, (uint64_t)__src);
  uint64_t v20 = swift_allocObject();
  memcpy((void *)(v20 + 16), __src, 0x78uLL);
  static Subscribers.Demand.unlimited.getter();
  sub_100005E5C(&qword_1000FD310);
  sub_10000953C(&qword_1000FD9A0, &qword_1000FD998);
  sub_10000953C(&qword_1000FD318, &qword_1000FD310);
  Publisher<>.flatMap<A>(maxPublishers:_:)();
  swift_release();
  sub_10009F6B8();
  v21();
  sub_10000953C(&qword_1000FF4A8, &qword_1000FF4A0);
  uint64_t v22 = Publisher.eraseToAnyPublisher()();
  sub_10009F6B8();
  v23();
  return v22;
}

uint64_t sub_10009E5B8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10009E5F4@<X0>(uint64_t *a1@<X8>)
{
  return sub_10009D58C(v1 + 16, a1);
}

uint64_t sub_10009E5FC(uint64_t a1)
{
  uint64_t v2 = sub_100005E5C(&qword_1000FE4D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10009E660()
{
  swift_release();
  swift_release();
  sub_100006178(v0 + 40);
  swift_release();
  sub_100006178(v0 + 96);

  swift_release();

  return _swift_deallocObject(v0, 160, 7);
}

uint64_t sub_10009E6C8(uint64_t *a1)
{
  return sub_10009DB6C(a1, v1 + 16);
}

uint64_t sub_10009E6D4(uint64_t *a1)
{
  return sub_10009DF38(a1, v1 + 16);
}

uint64_t sub_10009E6DC(uint64_t a1)
{
  return a1;
}

uint64_t sub_10009E70C(uint64_t a1)
{
  uint64_t refreshed = type metadata accessor for SubscriptionRefreshOperation();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(refreshed - 8) + 8))(a1, refreshed);
  return a1;
}

uint64_t sub_10009E768@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  sub_10009E804(a1, (uint64_t)__src);
  uint64_t v3 = swift_allocObject();
  memcpy((void *)(v3 + 16), __src, 0x78uLL);
  sub_100005E5C(&qword_1000FD310);
  swift_allocObject();
  uint64_t result = Future.init(_:)();
  *a2 = result;
  return result;
}

uint64_t sub_10009E804(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10009E840@<X0>(uint64_t *a1@<X8>)
{
  return sub_10009E768(v1 + 16, a1);
}

uint64_t sub_10009E848(void (*a1)(void *), uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100005E5C(&qword_1000FC940);
  __chkstk_darwin(v6 - 8);
  uint64_t v33 = (uint64_t)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SportingEventProgressStatus();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  unint64_t v32 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v31 - v12;
  uint64_t v14 = swift_allocObject();
  uint64_t v31 = a1;
  *(void *)(v14 + 16) = a1;
  *(void *)(v14 + 24) = a2;
  uint64_t v34 = v14;
  uint64_t v15 = *(void *)(a3 + 40);
  swift_retain();
  if ((sub_10007AD1C() & 1) == 0) {
    _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  sub_100005EA0((void *)(v15 + 16), *(void *)(v15 + 40));
  uint64_t v16 = dispatch thunk of PersistentStorable.retrieveEventSubscription(canonicalId:isConventionalOrUnified:)();
  if (!v16)
  {
    swift_release();
    uint64_t v24 = type metadata accessor for PersistentStoreError();
    sub_10009EDAC(&qword_1000FF4B0, (void (*)(uint64_t))&type metadata accessor for PersistentStoreError);
    uint64_t v25 = swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v24 - 8) + 104))(v26, enum case for PersistentStoreError.fileNotFound(_:), v24);
    __src[0] = v25;
    LOBYTE(__src[1]) = 1;
    v31(__src);
    return swift_errorRelease();
  }
  uint64_t v17 = v16;
  uint64_t v18 = (void *)SportingEventSubscription.sportingEventDetails.getter();
  SportingEvent.progressStatus.getter();

  uint64_t v19 = v32;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v32, v13, v8);
  int v20 = (*(uint64_t (**)(char *, uint64_t))(v9 + 88))(v19, v8);
  if (v20 == enum case for SportingEventProgressStatus.preGame(_:)
    || v20 == enum case for SportingEventProgressStatus.inProgress(_:)
    || v20 == enum case for SportingEventProgressStatus.statusBreak(_:))
  {
    goto LABEL_23;
  }
  if (v20 != enum case for SportingEventProgressStatus.final(_:))
  {
    if (v20 != enum case for SportingEventProgressStatus.postponed(_:))
    {
      if (v20 == enum case for SportingEventProgressStatus.suspended(_:)
        || v20 == enum case for SportingEventProgressStatus.cancelled(_:))
      {
        goto LABEL_19;
      }
      if (v20 != enum case for SportingEventProgressStatus.delayed(_:))
      {
        if (v20 == enum case for SportingEventProgressStatus.forfeit(_:)) {
          goto LABEL_19;
        }
        if (v20 != enum case for SportingEventProgressStatus.unknown(_:)) {
          (*(void (**)(char *, uint64_t))(v9 + 8))(v19, v8);
        }
      }
    }
LABEL_23:
    (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
    goto LABEL_24;
  }
LABEL_19:
  (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
  SportingEventSubscription.liveActivityTTLSeconds.setter();
LABEL_24:
  uint64_t v28 = type metadata accessor for TaskPriority();
  uint64_t v29 = v33;
  sub_1000082C0(v33, 1, 1, v28);
  sub_10009E804(a3, (uint64_t)__src);
  uint64_t v30 = (void *)swift_allocObject();
  v30[2] = 0;
  v30[3] = 0;
  memcpy(v30 + 4, __src, 0x78uLL);
  v30[19] = v17;
  v30[20] = sub_100037FE4;
  v30[21] = v34;
  sub_100051F94(v29, (uint64_t)&unk_1000FF4C0, (uint64_t)v30);
  return swift_release();
}

uint64_t sub_10009ED0C()
{
  sub_100006178(v0 + 16);
  swift_release();
  swift_release();
  sub_100006178(v0 + 72);
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 136, 7);
}

uint64_t sub_10009ED6C(void (*a1)(void *), uint64_t a2)
{
  return sub_10009E848(a1, a2, v2 + 16);
}

uint64_t sub_10009ED74()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10009EDAC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10009EDF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[4] = a6;
  v7[5] = a7;
  v7[2] = a4;
  v7[3] = a5;
  return _swift_task_switch(sub_10009EE18, 0, 0);
}

uint64_t sub_10009EE18()
{
  sub_10001C234();
  sub_100005EA0(*(void **)(v0 + 16), *(void *)(*(void *)(v0 + 16) + 24));
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v1;
  void *v1 = v0;
  v1[1] = sub_10009EEC0;
  return sub_10005EFDC();
}

uint64_t sub_10009EEC0()
{
  sub_10001C234();
  sub_10001C208();
  *(void *)(v1 + 56) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_10009F010;
  }
  else {
    uint64_t v2 = sub_10009EFAC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10009EFAC()
{
  sub_10001C234();
  (*(void (**)(uint64_t, void))(v0 + 32))(1, 0);
  sub_10001C2E0();
  return v1();
}

uint64_t sub_10009F010()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v0 + 32);
  swift_errorRetain();
  v2(v1, 1);
  swift_errorRelease();
  swift_errorRelease();
  sub_10001C2E0();
  return v3();
}

uint64_t sub_10009F09C()
{
  swift_unknownObjectRelease();
  sub_100006178(v0 + 32);
  swift_release();
  swift_release();
  sub_100006178(v0 + 88);
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();

  return _swift_deallocObject(v0, 176, 7);
}

uint64_t sub_10009F114()
{
  uint64_t v2 = *(void *)(v0 + 160);
  uint64_t v3 = *(void *)(v0 + 168);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_10009F1D8;
  uint64_t v5 = sub_10004D468();
  return sub_10009EDF4(v5, v6, v7, v8, v9, v2, v3);
}

uint64_t sub_10009F1D8()
{
  sub_10001C234();
  sub_10001C208();
  swift_task_dealloc();
  sub_10001C2E0();
  return v0();
}

uint64_t sub_10009F2A0(uint64_t a1)
{
  return a1;
}

uint64_t sub_10009F2D8(uint64_t a1, uint64_t a2)
{
  return sub_10009D624(a1, a2, v2 + 16);
}

uint64_t sub_10009F2E0()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  sub_100006178(v0 + 56);
  swift_release();
  sub_100006178(v0 + 112);

  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 192, 7);
}

uint64_t sub_10009F358()
{
  uint64_t v2 = *(void *)(v0 + 184);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_10009F6B4;
  uint64_t v4 = sub_10004D468();
  return sub_10009D75C(v4, v5, v6, v7, v8, v2);
}

uint64_t destroy for SubscriptionRefreshActivityOperation(uint64_t a1)
{
  sub_100006178(a1);
  swift_release();
  swift_release();
  sub_100006178(a1 + 56);
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for SubscriptionRefreshActivityOperation(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  long long v6 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v6;
  uint64_t v7 = v6;
  uint64_t v8 = **(void (***)(uint64_t, uint64_t, uint64_t))(v6 - 8);
  swift_retain();
  swift_retain();
  v8(a1 + 56, a2 + 56, v7);
  uint64_t v9 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v9;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t *assignWithCopy for SubscriptionRefreshActivityOperation(uint64_t *a1, uint64_t *a2)
{
  a1[5] = a2[5];
  swift_retain();
  swift_release();
  a1[6] = a2[6];
  swift_retain();
  swift_release();
  sub_100008E94(a1 + 7, a2 + 7);
  a1[12] = a2[12];
  a1[13] = a2[13];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[14] = a2[14];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for SubscriptionRefreshActivityOperation(uint64_t a1, uint64_t a2)
{
  sub_100006178(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  sub_100006178(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for SubscriptionRefreshActivityOperation()
{
  return &type metadata for SubscriptionRefreshActivityOperation;
}

void *sub_10009F6C8(uint64_t a1)
{
  uint64_t v3 = (void *)(a1 + 16);
  return memcpy(v3, (const void *)(v1 - 232), 0x90uLL);
}

void sub_10009F6F0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

BOOL SportsSessionType.init(rawValue:)(uint64_t a1)
{
  return a1 != 0;
}

uint64_t SportsActivityType.rawValue.getter()
{
  return 0;
}

BOOL sub_10009F718@<W0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  BOOL result = SportsSessionType.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

void sub_10009F74C(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t static SportsActivityCreationPolicy.__derived_enum_equals(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  sub_1000098F8();
  uint64_t v8 = v7 - v6;
  uint64_t v9 = type metadata accessor for SportsActivityCreationPolicy();
  __chkstk_darwin(v9 - 8);
  sub_1000098F8();
  uint64_t v12 = v11 - v10;
  uint64_t v13 = sub_100005E5C(&qword_1000FF4E0);
  __chkstk_darwin(v13 - 8);
  sub_1000098F8();
  uint64_t v16 = v15 - v14;
  uint64_t v18 = v15 - v14 + *(int *)(v17 + 56);
  sub_10009F9B8(a1, v15 - v14);
  sub_10009F9B8(a2, v18);
  sub_1000619DC(v16);
  if (!v20)
  {
    sub_10009F9B8(v16, v12);
    sub_1000619DC(v18);
    if (!v20)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v8, v18, v4);
      char v19 = static Date.== infix(_:_:)();
      uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
      v21(v8, v4);
      v21(v12, v4);
      sub_10009FA7C(v16);
      return v19 & 1;
    }
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v12, v4);
LABEL_9:
    sub_10009FA1C(v16);
    char v19 = 0;
    return v19 & 1;
  }
  sub_1000619DC(v18);
  if (!v20) {
    goto LABEL_9;
  }
  sub_10009FA7C(v16);
  char v19 = 1;
  return v19 & 1;
}

uint64_t type metadata accessor for SportsActivityCreationPolicy()
{
  uint64_t result = qword_1000FF568;
  if (!qword_1000FF568) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10009F9B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SportsActivityCreationPolicy();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10009FA1C(uint64_t a1)
{
  uint64_t v2 = sub_100005E5C(&qword_1000FF4E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10009FA7C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SportsActivityCreationPolicy();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10009FADC()
{
  unint64_t result = qword_1000FF4E8;
  if (!qword_1000FF4E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000FF4E8);
  }
  return result;
}

unint64_t sub_10009FB2C()
{
  unint64_t result = qword_1000FF4F0;
  if (!qword_1000FF4F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000FF4F0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SportsSessionType()
{
  return &type metadata for SportsSessionType;
}

unsigned char *_s7sportsd17SportsSessionTypeOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x10009FC2CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SportsActivityType()
{
  return &type metadata for SportsActivityType;
}

uint64_t *initializeBufferWithCopyOfBuffer for SportsActivityCreationPolicy(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = type metadata accessor for Date();
    if (sub_1000082E8((uint64_t)a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      sub_1000082C0((uint64_t)a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for SportsActivityCreationPolicy(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Date();
  uint64_t result = sub_1000082E8(a1, 1, v2);
  if (!result)
  {
    unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
    return v4(a1, v2);
  }
  return result;
}

void *initializeWithCopy for SportsActivityCreationPolicy(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Date();
  if (sub_1000082E8((uint64_t)a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    sub_1000082C0((uint64_t)a1, 0, 1, v6);
  }
  return a1;
}

void *assignWithCopy for SportsActivityCreationPolicy(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Date();
  int v7 = sub_1000082E8((uint64_t)a1, 1, v6);
  int v8 = sub_1000082E8((uint64_t)a2, 1, v6);
  if (!v7)
  {
    uint64_t v9 = *(void *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 24))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  sub_1000082C0((uint64_t)a1, 0, 1, v6);
  return a1;
}

void *initializeWithTake for SportsActivityCreationPolicy(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Date();
  if (sub_1000082E8((uint64_t)a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    sub_1000082C0((uint64_t)a1, 0, 1, v6);
  }
  return a1;
}

void *assignWithTake for SportsActivityCreationPolicy(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Date();
  int v7 = sub_1000082E8((uint64_t)a1, 1, v6);
  int v8 = sub_1000082E8((uint64_t)a2, 1, v6);
  if (!v7)
  {
    uint64_t v9 = *(void *)(v6 - 8);
    if (!v8)
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 40))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v9 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  sub_1000082C0((uint64_t)a1, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SportsActivityCreationPolicy(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000A020C);
}

uint64_t sub_1000A020C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date();
  unsigned int v5 = sub_1000082E8(a1, a2, v4);
  if (v5 >= 2) {
    return v5 - 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for SportsActivityCreationPolicy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000A0268);
}

uint64_t sub_1000A0268(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 1);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = type metadata accessor for Date();

  return sub_1000082C0(a1, v5, a3, v6);
}

uint64_t sub_1000A02C4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Date();

  return sub_1000082E8(a1, 1, v2);
}

uint64_t sub_1000A0308(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date();

  return sub_1000082C0(a1, a2, 1, v4);
}

uint64_t sub_1000A0354()
{
  uint64_t result = type metadata accessor for Date();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t sub_1000A03D4()
{
  type metadata accessor for LiveActivityRequestMeasurement();
  swift_allocObject();
  uint64_t result = sub_1000A04CC();
  qword_10010A5C8 = result;
  return result;
}

unint64_t sub_1000A0414()
{
  unint64_t result = sub_1000522C4();
  qword_1000FF578 = result;
  unk_1000FF580 = v1;
  return result;
}

void sub_1000A0438()
{
  NSString v0 = String._bridgeToObjectiveC()();
  int v1 = MGGetBoolAnswer();

  uint64_t v2 = 0x6C616E7265746E69;
  if (!v1) {
    uint64_t v2 = 0x72656D6F74737563;
  }
  qword_1000FF588 = v2;
  unk_1000FF590 = 0xE800000000000000;
}

uint64_t sub_1000A04CC()
{
  uint64_t v0 = type metadata accessor for MetricsPipeline();
  uint64_t v67 = *(void *)(v0 - 8);
  uint64_t v68 = v0;
  __chkstk_darwin(v0);
  char v66 = (char *)&v49 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = type metadata accessor for MetricsFieldExclusionRequest();
  uint64_t v63 = *(void *)(v65 - 8);
  __chkstk_darwin(v65);
  Swift::Int v61 = (char *)&v49 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = type metadata accessor for MetricsFieldsAggregator();
  uint64_t v62 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  uint64_t v59 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  BOOL v60 = (char *)&v49 - v5;
  uint64_t v71 = type metadata accessor for MetricsPipeline.Configuration();
  uint64_t v57 = *(void *)(v71 - 8);
  __chkstk_darwin(v71);
  uint64_t v53 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v56 = (char *)&v49 - v8;
  __chkstk_darwin(v9);
  char v58 = (char *)&v49 - v10;
  uint64_t v11 = sub_100005E5C(&qword_1000FF738);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = type metadata accessor for AMSMetricsIdentifierFieldsProvider();
  uint64_t v55 = *(void *)(v70 - 8);
  __chkstk_darwin(v70);
  uint64_t v73 = (char *)&v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for Bag();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v49 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)&v49 - v20;
  if (qword_1000FBD58 != -1) {
    swift_once();
  }
  id v22 = *(id *)(qword_10010A490 + 16);
  Bag.init(from:)();
  char v52 = (void (*)(char *, uint64_t))sub_100005E5C(&qword_1000FF740);
  uint64_t v54 = v16;
  uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
  v23(v18, v21, v15);
  uint64_t v69 = LowMemoryMetricsEventLinter.__allocating_init(defaultTopic:bag:rules:)();
  id v24 = [objc_allocWithZone((Class)ACAccountStore) init];
  uint64_t v76 = sub_10001C1C0(0, &qword_1000FF748);
  v77 = &protocol witness table for ACAccountStore;
  v75[0] = (uint64_t)v24;
  uint64_t v25 = v15;
  v23(v13, v21, v15);
  sub_1000082C0((uint64_t)v13, 0, 1, v15);
  sub_100005E5C(&qword_1000FF228);
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_1000CF450;
  sub_10001C1C0(0, &qword_1000FF750);
  *(void *)(v26 + 32) = sub_1000BCEC8(0x6449746E65696C63, 0xE800000000000000, 0);
  uint64_t v74 = v26;
  specialized Array._endMutation()();
  id v27 = [self currentProcess];
  static AMSMetricsIdentifierFieldsProvider.metricsResetInterval.getter();
  AMSMetricsIdentifierFieldsProvider.init(accountProvider:process:bag:shouldMigrate:resetInterval:keys:activeITunesAccountRequired:)();
  uint64_t v28 = v21;
  unint64_t v51 = v21;
  uint64_t v50 = v25;
  v23(v18, v21, v25);
  uint64_t v29 = type metadata accessor for LiveActivityRequestEventRecorder();
  swift_allocObject();
  uint64_t v30 = sub_1000A1660((uint64_t)v18, 0xD000000000000013, 0x80000001000D0B40);
  uint64_t v31 = (void *)(v72 + OBJC_IVAR____TtC7sportsd30LiveActivityRequestMeasurement_eventRecorder);
  *(void *)(v72 + OBJC_IVAR____TtC7sportsd30LiveActivityRequestMeasurement_eventRecorder + 24) = v29;
  v31[4] = sub_1000A25E8();
  *uint64_t v31 = v30;
  v23(v18, v28, v25);
  uint64_t v76 = (uint64_t)v52;
  v77 = (void *)sub_1000A2638();
  v75[0] = v69;
  swift_retain();
  sub_10005FAC4((uint64_t)&off_1000EF9E0);
  unint64_t v32 = v53;
  MetricsPipeline.Configuration.init(bag:linter:anonymousTopics:)();
  uint64_t v33 = v56;
  MetricsPipeline.Configuration.withRecorder(_:)();
  uint64_t v34 = v57;
  char v52 = *(void (**)(char *, uint64_t))(v57 + 8);
  v52(v32, v71);
  uint64_t v35 = v59;
  MetricsFieldsAggregator.init()();
  uint64_t v36 = v70;
  uint64_t v76 = v70;
  v77 = &protocol witness table for AMSMetricsIdentifierFieldsProvider;
  uint64_t v37 = sub_100029BE0(v75);
  uint64_t v38 = v55;
  (*(void (**)(uint64_t *, char *, uint64_t))(v55 + 16))(v37, v73, v36);
  uint64_t v39 = v61;
  static MetricsFieldExclusionRequest.amsMetricsID.getter();
  uint64_t v40 = v60;
  MetricsFieldsAggregator.addingOptOutProvider(_:forRequest:)();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v39, v65);
  BOOL v41 = *(void (**)(char *, uint64_t))(v62 + 8);
  uint64_t v42 = v64;
  v41(v35, v64);
  sub_100006178((uint64_t)v75);
  uint64_t v43 = v58;
  MetricsPipeline.Configuration.withAggregator(_:)();
  v41(v40, v42);
  uint64_t v44 = v71;
  id v45 = v52;
  v52(v33, v71);
  (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v33, v43, v44);
  uint64_t v46 = v66;
  MetricsPipeline.init(from:)();
  swift_release();
  v45(v43, v44);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v73, v70);
  (*(void (**)(char *, uint64_t))(v54 + 8))(v51, v50);
  uint64_t v47 = v72;
  (*(void (**)(uint64_t, char *, uint64_t))(v67 + 32))(v72 + OBJC_IVAR____TtC7sportsd30LiveActivityRequestMeasurement_metricsPipeline, v46, v68);
  return v47;
}

uint64_t sub_1000A0D90(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = a1;
  uint64_t v27 = sub_100005E5C(&qword_1000FF728);
  sub_100009830();
  uint64_t v25 = v3;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = type metadata accessor for MetricsFieldsContext();
  sub_100009830();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v24 - v13;
  type metadata accessor for MetricsData();
  sub_100009830();
  uint64_t v29 = v16;
  uint64_t v30 = v15;
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = &_swiftEmptyDictionarySingleton;
  if (qword_1000FBE18 != -1) {
    swift_once();
  }
  unint64_t v32 = &type metadata for String;
  v31[0] = qword_1000FF578;
  v31[1] = unk_1000FF580;
  swift_bridgeObjectRetain();
  sub_1000BA918((uint64_t)v31, 7368801, 0xE300000000000000);
  unint64_t v32 = &type metadata for String;
  v31[0] = 0xD000000000000013;
  v31[1] = 0x80000001000D2DD0;
  sub_1000BA918((uint64_t)v31, 0x707954746E657665, 0xE900000000000065);
  unint64_t v32 = &type metadata for String;
  strcpy((char *)v31, "Content");
  v31[1] = 0xE700000000000000;
  sub_1000BA918((uint64_t)v31, 0xD000000000000010, 0x80000001000D2DF0);
  unint64_t v32 = &type metadata for String;
  strcpy((char *)v31, "SportingEvent");
  HIWORD(v31[1]) = -4864;
  sub_1000BA918((uint64_t)v31, 0xD000000000000013, 0x80000001000D2E10);
  if (qword_1000FBE20 != -1) {
    swift_once();
  }
  unint64_t v32 = &type metadata for String;
  v31[0] = qword_1000FF588;
  v31[1] = unk_1000FF590;
  swift_bridgeObjectRetain();
  sub_1000BA918((uint64_t)v31, 0x7542746E65696C63, 0xEF65707954646C69);
  unint64_t v32 = &type metadata for String;
  v31[0] = v26;
  v31[1] = a2;
  swift_bridgeObjectRetain();
  sub_1000BA918((uint64_t)v31, 0x497463656A627573, 0xE900000000000064);
  sub_100005E5C(&qword_1000FF730);
  type metadata accessor for MetricsFieldExclusionRequest();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000CABA0;
  static MetricsFieldExclusionRequest.clientBuildType.getter();
  sub_10005FC94();
  MetricsData.init(topic:shouldFlush:fields:includingFields:excludingFields:)();
  MetricsFieldsContext.init()();
  v31[0] = 0xD000000000000013;
  v31[1] = 0x80000001000D0B40;
  static MetricsFieldsContext.Property<A>.topic.getter();
  MetricsFieldsContext.addingValue<A>(_:forProperty:)();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v6, v27);
  swift_bridgeObjectRelease();
  uint64_t v19 = *(void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v20 = v28;
  v19(v11, v28);
  MetricsPipeline.process(_:using:)();
  v19(v14, v20);
  uint64_t v21 = sub_10001C1C0(0, (unint64_t *)&qword_1000FC998);
  uint64_t v22 = static OS_dispatch_queue.main.getter();
  unint64_t v32 = (void *)v21;
  uint64_t v33 = &protocol witness table for OS_dispatch_queue;
  v31[0] = v22;
  Promise.then(perform:orCatchError:on:)();
  swift_release();
  sub_100006178((uint64_t)v31);
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v18, v30);
}

void sub_1000A12D8()
{
  if (qword_1000FBDC0 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000929C(v0, (uint64_t)qword_10010A508);
  swift_errorRetain();
  swift_errorRetain();
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v3 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v2 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v3 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "LiveActivityActionMeasurement: error: %@", v2, 0xCu);
    sub_100005E5C((uint64_t *)&unk_1000FDA60);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
}

uint64_t sub_1000A14B4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC7sportsd30LiveActivityRequestMeasurement_metricsPipeline;
  uint64_t v2 = type metadata accessor for MetricsPipeline();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_100006178(v0 + OBJC_IVAR____TtC7sportsd30LiveActivityRequestMeasurement_eventRecorder);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_1000A1564()
{
  return type metadata accessor for LiveActivityRequestMeasurement();
}

uint64_t type metadata accessor for LiveActivityRequestMeasurement()
{
  uint64_t result = qword_1000FF5D8;
  if (!qword_1000FF5D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000A15B4()
{
  uint64_t result = type metadata accessor for MetricsPipeline();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_1000A164C()
{
  off_1000FF598 = &off_1000EFA10;
}

void *sub_1000A1660(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for Bag.Profile();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  Bag.profile.getter();
  uint64_t v12 = Bag.Profile.name.getter();
  uint64_t v14 = v13;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v15 = Bag.amsBag.getter();
  id v16 = objc_allocWithZone((Class)AMSMetrics);
  id v17 = sub_1000A1B6C(v12, v14, v15);
  uint64_t v18 = AMSMetrics.withRemoteInspection.getter();

  uint64_t v19 = type metadata accessor for Bag();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v19 - 8) + 8))(a1, v19);
  v4[2] = v18;
  v4[3] = a2;
  v4[4] = a3;
  return v4;
}

void sub_1000A17E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v5 = *v3;
  if (!a3) {
    swift_bridgeObjectRetain();
  }
  sub_10001C1C0(0, &qword_1000FF718);
  swift_bridgeObjectRetain();
  id v8 = sub_1000A1938();
  uint64_t v6 = LintedMetricsEvent.fields.getter();
  sub_1000A1BF0(v6, v5);
  swift_bridgeObjectRelease();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_release();
  [v8 addPropertiesWithDictionary:isa];

  [(id)v4[2] enqueueEvent:v8];
}

id sub_1000A1938()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v1 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithTopic:v1];

  return v2;
}

uint64_t sub_1000A19AC()
{
  sub_100005E5C(&qword_1000FF710);
  id v1 = [*(id *)(v0 + 16) flush];
  Promise<A>.init(_:)();
  v4[3] = type metadata accessor for SyncTaskScheduler();
  v4[4] = (uint64_t)&protocol witness table for SyncTaskScheduler;
  sub_100029BE0(v4);
  SyncTaskScheduler.init()();
  uint64_t v2 = Promise.map<A>(on:_:)();
  swift_release();
  sub_100006178((uint64_t)v4);
  return v2;
}

id sub_1000A1A68@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 integerValue];
  *a2 = result;
  return result;
}

uint64_t sub_1000A1AA4()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1000A1ACC()
{
  uint64_t v0 = sub_1000A1AA4();

  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for LiveActivityRequestEventRecorder()
{
  return self;
}

void sub_1000A1B20(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_1000A1B48()
{
  return sub_1000A19AC();
}

id sub_1000A1B6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v6 = [v3 initWithContainerID:v5 bag:a3];

  swift_unknownObjectRelease();
  return v6;
}

uint64_t sub_1000A1BD4(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_1000A1BF0(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v4 = isStackAllocationSafe;
  char v5 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v6 = (unint64_t)((1 << v5) + 63) >> 6;
  if ((v5 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    uint64_t v7 = (uint64_t *)((char *)&v11 - ((8 * v6 + 15) & 0x3FFFFFFFFFFFFFF0));
    sub_1000A1BD4(0, v6, v7);
    uint64_t v8 = sub_1000A1D60((uint64_t)v7, v6, v4);
    if (v2) {
      swift_willThrow();
    }
    else {
      return v8;
    }
  }
  else
  {
    uint64_t v9 = (void *)swift_slowAlloc();
    sub_1000A1BD4(0, v6, v9);
    a2 = sub_1000A1D60((uint64_t)v9, v6, v4);
    swift_slowDealloc();
  }
  return a2;
}

uint64_t sub_1000A1D60(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v28 = (unint64_t *)result;
  uint64_t v29 = 0;
  int64_t v3 = 0;
  uint64_t v35 = a3;
  uint64_t v6 = *(void *)(a3 + 64);
  uint64_t v4 = a3 + 64;
  uint64_t v5 = v6;
  uint64_t v7 = 1 << *(unsigned char *)(v4 - 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & v5;
  uint64_t v30 = v4;
  int64_t v31 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    while (1)
    {
      if (v9)
      {
        unint64_t v10 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v11 = v10 | (v3 << 6);
      }
      else
      {
        int64_t v12 = v3 + 1;
        if (__OFADD__(v3, 1)) {
          goto LABEL_43;
        }
        if (v12 >= v31) {
          return sub_1000A232C(v28, a2, v29, v35);
        }
        unint64_t v13 = *(void *)(v30 + 8 * v12);
        ++v3;
        if (!v13)
        {
          int64_t v3 = v12 + 1;
          if (v12 + 1 >= v31) {
            return sub_1000A232C(v28, a2, v29, v35);
          }
          unint64_t v13 = *(void *)(v30 + 8 * v3);
          if (!v13)
          {
            int64_t v3 = v12 + 2;
            if (v12 + 2 >= v31) {
              return sub_1000A232C(v28, a2, v29, v35);
            }
            unint64_t v13 = *(void *)(v30 + 8 * v3);
            if (!v13)
            {
              int64_t v14 = v12 + 3;
              if (v14 >= v31) {
                return sub_1000A232C(v28, a2, v29, v35);
              }
              unint64_t v13 = *(void *)(v30 + 8 * v14);
              if (!v13)
              {
                while (1)
                {
                  int64_t v3 = v14 + 1;
                  if (__OFADD__(v14, 1)) {
                    goto LABEL_44;
                  }
                  if (v3 >= v31) {
                    return sub_1000A232C(v28, a2, v29, v35);
                  }
                  unint64_t v13 = *(void *)(v30 + 8 * v3);
                  ++v14;
                  if (v13) {
                    goto LABEL_19;
                  }
                }
              }
              int64_t v3 = v14;
            }
          }
        }
LABEL_19:
        unint64_t v9 = (v13 - 1) & v13;
        unint64_t v11 = __clz(__rbit64(v13)) + (v3 << 6);
      }
      uint64_t v15 = (uint64_t *)(*(void *)(v35 + 48) + 16 * v11);
      uint64_t v17 = *v15;
      uint64_t v16 = v15[1];
      sub_10001BB1C(*(void *)(v35 + 56) + 32 * v11, (uint64_t)v34);
      v32[0] = v17;
      v32[1] = v16;
      sub_10001BB1C((uint64_t)v34, (uint64_t)&v33);
      uint64_t v18 = qword_1000FBE28;
      swift_bridgeObjectRetain_n();
      if (v18 != -1) {
        swift_once();
      }
      uint64_t v19 = (char *)off_1000FF598;
      uint64_t v20 = *((void *)off_1000FF598 + 2);
      if (v20) {
        break;
      }
LABEL_38:
      sub_1000A2038((uint64_t)v32);
      sub_100006178((uint64_t)v34);
      id result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v28 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      if (__OFADD__(v29++, 1)) {
        goto LABEL_45;
      }
    }
    if (*((void *)off_1000FF598 + 4) != v17 || *((void *)off_1000FF598 + 5) != v16)
    {
      id result = _stringCompareWithSmolCheck(_:_:expecting:)();
      if ((result & 1) == 0) {
        break;
      }
    }
LABEL_28:
    sub_1000A2038((uint64_t)v32);
    sub_100006178((uint64_t)v34);
    id result = swift_bridgeObjectRelease();
  }
  if (v20 == 1) {
    goto LABEL_38;
  }
  uint64_t v22 = v19 + 56;
  uint64_t v23 = 1;
  while (1)
  {
    uint64_t v24 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (*(v22 - 1) == v17 && *v22 == v16) {
      goto LABEL_28;
    }
    id result = _stringCompareWithSmolCheck(_:_:expecting:)();
    if (result) {
      goto LABEL_28;
    }
    v22 += 2;
    ++v23;
    if (v24 == v20) {
      goto LABEL_38;
    }
  }
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_1000A2038(uint64_t a1)
{
  uint64_t v2 = sub_100005E5C(&qword_1000FF720);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000A2098(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  sub_100005E5C(&qword_1000FF768);
  uint64_t result = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v9 = result;
  unint64_t v32 = a1;
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
    uint64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v14);
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
    if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) == 0) {
      break;
    }
    unint64_t v25 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(void *)(v12 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    uint64_t v30 = (void *)(*(void *)(v9 + 48) + 16 * v25);
    *uint64_t v30 = v20;
    v30[1] = v19;
    *(void *)(*(void *)(v9 + 56) + 8 * v25) = v21;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1)) {
      goto LABEL_39;
    }
    if (!v5) {
      return v9;
    }
  }
  char v26 = 0;
  unint64_t v27 = (unint64_t)(63 - v22) >> 6;
  while (++v24 != v27 || (v26 & 1) == 0)
  {
    BOOL v28 = v24 == v27;
    if (v24 == v27) {
      unint64_t v24 = 0;
    }
    v26 |= v28;
    uint64_t v29 = *(void *)(v12 + 8 * v24);
    if (v29 != -1)
    {
      unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
      goto LABEL_34;
    }
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1000A232C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  sub_100005E5C(&qword_1000FCC20);
  uint64_t result = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v8 = result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 64;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
    }
    else
    {
      uint64_t v14 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        goto LABEL_40;
      }
      if (v14 >= v30) {
        return v8;
      }
      unint64_t v15 = a1[v14];
      ++v10;
      if (!v15)
      {
        uint64_t v10 = v14 + 1;
        if (v14 + 1 >= v30) {
          return v8;
        }
        unint64_t v15 = a1[v10];
        if (!v15)
        {
          uint64_t v10 = v14 + 2;
          if (v14 + 2 >= v30) {
            return v8;
          }
          unint64_t v15 = a1[v10];
          if (!v15)
          {
            uint64_t v16 = v14 + 3;
            if (v16 >= v30) {
              return v8;
            }
            unint64_t v15 = a1[v16];
            if (!v15)
            {
              while (1)
              {
                uint64_t v10 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_41;
                }
                if (v10 >= v30) {
                  return v8;
                }
                unint64_t v15 = a1[v10];
                ++v16;
                if (v15) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v10 = v16;
          }
        }
      }
LABEL_24:
      unint64_t v9 = (v15 - 1) & v15;
      unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
    }
    uint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_10001BB1C(*(void *)(v4 + 56) + 32 * v13, (uint64_t)v33);
    sub_100028F5C(v33, v32);
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v20 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) == 0) {
      break;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    BOOL v28 = (void *)(*(void *)(v8 + 48) + 16 * v23);
    *BOOL v28 = v19;
    v28[1] = v18;
    uint64_t result = (uint64_t)sub_100028F5C(v32, (_OWORD *)(*(void *)(v8 + 56) + 32 * v23));
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1)) {
      goto LABEL_39;
    }
    if (!v5) {
      return v8;
    }
  }
  char v24 = 0;
  unint64_t v25 = (unint64_t)(63 - v20) >> 6;
  while (++v22 != v25 || (v24 & 1) == 0)
  {
    BOOL v26 = v22 == v25;
    if (v22 == v25) {
      unint64_t v22 = 0;
    }
    v24 |= v26;
    uint64_t v27 = *(void *)(v11 + 8 * v22);
    if (v27 != -1)
    {
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
      goto LABEL_34;
    }
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

unint64_t sub_1000A25E8()
{
  unint64_t result = qword_1000FF758;
  if (!qword_1000FF758)
  {
    type metadata accessor for LiveActivityRequestEventRecorder();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000FF758);
  }
  return result;
}

unint64_t sub_1000A2638()
{
  unint64_t result = qword_1000FF760;
  if (!qword_1000FF760)
  {
    sub_1000061D8(&qword_1000FF740);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000FF760);
  }
  return result;
}

uint64_t sub_1000A268C()
{
  uint64_t result = Date.timeIntervalSince1970.getter();
  double v2 = v1 * 1000.0;
  if ((~*(void *)&v2 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v2 <= -1.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v2 < 1.84467441e19) {
    return (unint64_t)v2;
  }
LABEL_7:
  __break(1u);
  return result;
}

unint64_t sub_1000A26EC(double a1)
{
  double v1 = a1 * 1000.0;
  if ((~*(void *)&v1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v1 <= -1.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v1 < 1.84467441e19) {
    return (unint64_t)v1;
  }
LABEL_7:
  __break(1u);
  return result;
}

void *sub_1000A2738(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v3 = *(void *)(a1 + 16);
  unint64_t result = _swiftEmptyArrayStorage;
  if (v3)
  {
    specialized ContiguousArray.reserveCapacity(_:)();
    uint64_t v6 = (uint64_t *)(a1 + 56);
    do
    {
      uint64_t v7 = *(v6 - 3);
      uint64_t v8 = *(v6 - 2);
      uint64_t v9 = *(v6 - 1);
      uint64_t v10 = *v6;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      a2(v7, v8, v9, v10);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      v6 += 4;
      --v3;
    }
    while (v3);
    return _swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1000A2838(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = type metadata accessor for SportingEventSubscription.Competitor();
  uint64_t v5 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    uint64_t v29 = v2;
    uint64_t v26 = a2;
    uint64_t v34 = _swiftEmptyArrayStorage;
    sub_100017E5C();
    uint64_t v9 = v34;
    v23[1] = v5 + 32;
    uint64_t v24 = v5;
    uint64_t v10 = a1 + 48;
    while (1)
    {
      uint64_t v27 = v8;
      uint64_t v11 = *(void *)(v10 - 8);
      uint64_t v12 = (uint64_t)v7;
      uint64_t v13 = *(void *)v10;
      uint64_t v14 = *(void *)(v10 + 8);
      uint64_t v15 = *(void *)(v10 + 16);
      uint64_t v16 = *(void *)(v10 + 40);
      char v17 = *(unsigned char *)(v10 + 48);
      v30[0] = *(void *)(v10 - 16);
      v30[1] = v11;
      v30[2] = v13;
      v30[3] = v14;
      v30[4] = v15;
      long long v28 = *(_OWORD *)(v10 + 24);
      long long v31 = v28;
      uint64_t v32 = v16;
      char v33 = v17;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v18 = v28;
      sub_10002A5A8(v15, v28);
      swift_bridgeObjectRetain();
      uint64_t v19 = v29;
      sub_1000AAA14(v30, v26, v12);
      uint64_t v29 = v19;
      if (v19) {
        break;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1000479B8(v15, v18);
      swift_bridgeObjectRelease();
      uint64_t v34 = v9;
      unint64_t v20 = v9[2];
      if (v20 >= v9[3] >> 1)
      {
        sub_100017E5C();
        uint64_t v9 = v34;
      }
      v10 += 72;
      v9[2] = v20 + 1;
      unint64_t v21 = (unint64_t)v9
          + ((*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80))
          + *(void *)(v24 + 72) * v20;
      uint64_t v7 = (char *)v12;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v24 + 32))(v21, v12, v25);
      uint64_t v8 = v27 - 1;
      if (v27 == 1)
      {
        swift_bridgeObjectRelease();
        return v9;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000479B8(v15, v18);
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return _swiftEmptyArrayStorage;
  }
  return v9;
}

void sub_1000A2AD0(void *__src@<X0>, const void *a2@<X1>, uint64_t a3@<X2>, long long *a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  memcpy((void *)a9, __src, 0xB8uLL);
  memcpy((void *)(a9 + 184), a2, 0x78uLL);
  *(void *)(a9 + 304) = a3;
  sub_100008CAC(a4, a9 + 312);
  *(unsigned char *)(a9 + 352) = a5;
  sub_1000437F8(a6, a9 + 360, &qword_1000FE120);
  *(void *)(a9 + 464) = a7;
  *(void *)(a9 + 472) = a8;
  *(void *)(a9 + 480) = a10;
  *(void *)(a9 + 488) = a11;
  *(unsigned char *)(a9 + 496) = a12;
  ActivityOperation = (int *)type metadata accessor for SubscriptionCreateActivityOperation(0);
  sub_1000437F8(a13, a9 + ActivityOperation[12], &qword_1000FC938);
  long long v28 = (void *)(a9 + ActivityOperation[13]);
  *long long v28 = a14;
  v28[1] = a15;
  uint64_t v29 = (void *)(a9 + ActivityOperation[14]);
  *uint64_t v29 = a16;
  v29[1] = a17;
  uint64_t v30 = (void *)(a9 + ActivityOperation[15]);
  *uint64_t v30 = a18;
  v30[1] = a19;
  *(unsigned char *)(a9 + ActivityOperation[16]) = a20 & 1;
  uint64_t v31 = ActivityOperation[17];
  uint64_t v32 = (objc_class *)type metadata accessor for ActivityAuthorization();
  id v33 = [objc_allocWithZone(v32) init];
  unint64_t v34 = sub_1000522C4();
  uint64_t v36 = v35;
  v45[3] = v32;
  v45[4] = &off_1000F15C8;
  v45[0] = v33;
  type metadata accessor for ActivityCapUtility();
  uint64_t v37 = (void *)swift_allocObject();
  sub_10000A014((uint64_t)v45, (uint64_t)v32);
  sub_10000C568();
  __chkstk_darwin(v38);
  sub_1000098F8();
  BOOL v41 = (uint64_t *)(v40 - v39);
  (*(void (**)(uint64_t))(v42 + 16))(v40 - v39);
  uint64_t v43 = *v41;
  v37[5] = v32;
  v37[6] = &off_1000F15C8;
  v37[2] = v43;
  v37[7] = v34;
  v37[8] = v36;
  sub_100006178((uint64_t)v45);
  *(void *)(a9 + v31) = v37;
  sub_1000098A0();
}

uint64_t sub_1000A2D0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5();
}

void sub_1000A2D34()
{
}

void sub_1000A2D3C(int a1)
{
  int v29 = a1;
  sub_100005E5C(&qword_1000FD2F8);
  sub_10000C568();
  uint64_t v30 = v3;
  uint64_t v31 = v2;
  __chkstk_darwin(v2);
  sub_100009908();
  uint64_t v4 = sub_100005E5C(&qword_1000FC938);
  __chkstk_darwin(v4 - 8);
  sub_1000098F8();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = type metadata accessor for Date();
  sub_10000C568();
  uint64_t v28 = v9;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v27 - v14;
  if (qword_1000FBDA0 != -1) {
    swift_once();
  }
  uint64_t ActivityOperation = type metadata accessor for SubscriptionCreateActivityOperation(0);
  char v17 = (uint64_t *)(v1 + *(int *)(ActivityOperation + 56));
  uint64_t v18 = *v17;
  uint64_t v19 = v17[1];
  if ((sub_100056CB8(*v17, v19) & 1) == 0)
  {
    sub_10004D2D4();
    uint64_t v21 = sub_100090708();
    *unint64_t v22 = v18;
    v22[1] = v19;
    uint64_t v32 = v21;
    swift_bridgeObjectRetain();
    sub_100005E5C((uint64_t *)&unk_1000FDA30);
    Fail.init(error:)();
    sub_10000953C(&qword_1000FD300, &qword_1000FD2F8);
    Publisher.eraseToAnyPublisher()();
    sub_100009894();
    v23();
    goto LABEL_15;
  }
  if ((v29 & 1) == 0)
  {
    sub_100043750(v1 + *(int *)(ActivityOperation + 48), v7, &qword_1000FC938);
    if (sub_1000082E8(v7, 1, v8) == 1)
    {
      sub_1000437A4(v7, &qword_1000FC938);
LABEL_14:
      sub_1000A4A74();
      goto LABEL_15;
    }
    uint64_t v24 = v28;
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 32))(v15, v7, v8);
    static Date.now.getter();
    char v25 = static Date.> infix(_:_:)();
    uint64_t v26 = *(void (**)(char *, uint64_t))(v24 + 8);
    v26(v12, v8);
    if ((v25 & 1) == 0)
    {
      v26(v15, v8);
      goto LABEL_14;
    }
    sub_1000A4370((uint64_t)v15);
    v26(v15, v8);
LABEL_15:
    sub_1000098A0();
    return;
  }
  sub_1000098A0();
  sub_1000A3E24();
}

uint64_t type metadata accessor for SubscriptionCreateActivityOperation(uint64_t a1)
{
  return sub_10003B620(a1, qword_1000FF9F8);
}

void sub_1000A30BC(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100005E5C(&qword_1000FF848);
    uint64_t v2 = (unsigned char *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v30 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v29 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  swift_retain();
  int64_t v7 = 0;
  if (!v5) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v8 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v9 = v8 | (v7 << 6);
  while (1)
  {
    char v18 = *(unsigned char *)(*(void *)(a1 + 48) + v9);
    sub_10001BB1C(*(void *)(a1 + 56) + 32 * v9, (uint64_t)v37 + 8);
    LOBYTE(v37[0]) = v18;
    v35[0] = v37[0];
    v35[1] = v37[1];
    uint64_t v36 = v38;
    v33[0] = v18;
    sub_100028F5C((_OWORD *)((char *)v35 + 8), v32);
    sub_100005E5C((uint64_t *)&unk_1000FC300);
    swift_dynamicCast();
    char v19 = v33[0];
    sub_1000437F8((uint64_t)&v34, (uint64_t)v31, (uint64_t *)&unk_1000FC300);
    sub_1000437F8((uint64_t)v31, (uint64_t)v33, (uint64_t *)&unk_1000FC300);
    sub_1000437F8((uint64_t)v33, (uint64_t)v32, (uint64_t *)&unk_1000FC300);
    Hasher.init(_seed:)();
    sub_1000990CC(v19);
    String.hash(into:)();
    swift_bridgeObjectRelease();
    Swift::Int v20 = Hasher._finalize()();
    uint64_t v21 = -1 << v2[32];
    unint64_t v22 = v20 & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)&v6[8 * (v22 >> 6)]) == 0)
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v21) >> 6;
      while (++v23 != v26 || (v25 & 1) == 0)
      {
        BOOL v27 = v23 == v26;
        if (v23 == v26) {
          unint64_t v23 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)&v6[8 * v23];
        if (v28 != -1)
        {
          unint64_t v24 = __clz(__rbit64(~v28)) + (v23 << 6);
          goto LABEL_38;
        }
      }
      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    unint64_t v24 = __clz(__rbit64((-1 << v22) & ~*(void *)&v6[8 * (v22 >> 6)])) | v22 & 0x7FFFFFFFFFFFFFC0;
LABEL_38:
    *(void *)&v6[(v24 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v24;
    *(unsigned char *)(*((void *)v2 + 6) + v24) = v19;
    sub_1000437F8((uint64_t)v32, *((void *)v2 + 7) + 32 * v24, (uint64_t *)&unk_1000FC300);
    ++*((void *)v2 + 2);
    if (v5) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v10 = v7 + 1;
    if (__OFADD__(v7, 1)) {
      goto LABEL_42;
    }
    if (v10 >= v29) {
      goto LABEL_40;
    }
    unint64_t v11 = *(void *)(v30 + 8 * v10);
    int64_t v12 = v7 + 1;
    if (!v11)
    {
      sub_1000AE7C0();
      if (v13 == v14) {
        goto LABEL_40;
      }
      sub_1000AE7B4();
      if (!v11)
      {
        sub_1000AE7C0();
        if (v13 == v14) {
          goto LABEL_40;
        }
        sub_1000AE7B4();
        if (!v11)
        {
          sub_1000AE7C0();
          if (v13 == v14) {
            goto LABEL_40;
          }
          sub_1000AE7B4();
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_28:
    unint64_t v5 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
    int64_t v7 = v12;
  }
  int64_t v16 = v15 + 4;
  if (v16 >= v29)
  {
LABEL_40:
    swift_release();
    sub_10001BB94();
    return;
  }
  unint64_t v11 = *(void *)(v30 + 8 * v16);
  if (v11)
  {
    int64_t v12 = v16;
    goto LABEL_28;
  }
  while (!__OFADD__(v16, 1))
  {
    sub_1000AE7C0();
    if (v13 == v14) {
      goto LABEL_40;
    }
    sub_1000AE7B4();
    int64_t v16 = v17 + 1;
    if (v11) {
      goto LABEL_28;
    }
  }
LABEL_43:
  __break(1u);
}

void sub_1000A3474(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_100005E5C(&qword_1000FCC20);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v35 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v34 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = &v40;
  int64_t v7 = &v42;
  swift_bridgeObjectRetain();
  int64_t v8 = 0;
  unint64_t v9 = (char *)&type metadata for Any + 8;
  int64_t v10 = &type metadata for String;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        uint64_t v37 = (v5 - 1) & v5;
        unint64_t v11 = __clz(__rbit64(v5)) | (v8 << 6);
      }
      else
      {
        int64_t v12 = v8 + 1;
        if (__OFADD__(v8, 1)) {
          goto LABEL_38;
        }
        if (v12 >= v34)
        {
LABEL_35:
          sub_10001BB94();
          return;
        }
        unint64_t v13 = *(void *)(v35 + 8 * v12);
        int64_t v14 = v8 + 1;
        if (!v13)
        {
          sub_1000AE774();
          if (v15 == v16) {
            goto LABEL_35;
          }
          sub_1000AE768();
          if (!v13)
          {
            sub_1000AE774();
            if (v15 == v16) {
              goto LABEL_35;
            }
            sub_1000AE768();
            if (!v13)
            {
              sub_1000AE774();
              if (v15 == v16) {
                goto LABEL_35;
              }
              sub_1000AE768();
              if (!v13)
              {
                int64_t v18 = v17 + 4;
                if (v18 >= v34) {
                  goto LABEL_35;
                }
                unint64_t v13 = *(void *)(v35 + 8 * v18);
                if (!v13)
                {
                  while (!__OFADD__(v18, 1))
                  {
                    sub_1000AE774();
                    if (v15 == v16) {
                      goto LABEL_35;
                    }
                    sub_1000AE768();
                    int64_t v18 = v19 + 1;
                    if (v13) {
                      goto LABEL_29;
                    }
                  }
                  goto LABEL_39;
                }
                int64_t v14 = v18;
              }
            }
          }
        }
LABEL_29:
        uint64_t v37 = (v13 - 1) & v13;
        unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
        int64_t v8 = v14;
      }
      Swift::Int v20 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v11);
      uint64_t v38 = *v20;
      uint64_t v39 = v20[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      sub_100028F5C(v6, v7);
      sub_100028F5C(v7, v43);
      sub_100028F5C(v43, &v41);
      unint64_t v21 = sub_1000175F0();
      unint64_t v22 = v21;
      if ((v23 & 1) == 0) {
        break;
      }
      uint64_t v36 = v8;
      unint64_t v24 = v7;
      char v25 = v6;
      uint64_t v26 = v1;
      BOOL v27 = v10;
      uint64_t v28 = v9;
      int64_t v29 = (void *)(v2[6] + 16 * v21);
      swift_bridgeObjectRelease();
      *int64_t v29 = v38;
      v29[1] = v39;
      unint64_t v9 = v28;
      int64_t v10 = v27;
      uint64_t v1 = v26;
      uint64_t v6 = v25;
      int64_t v7 = v24;
      int64_t v8 = v36;
      uint64_t v30 = (_OWORD *)(v2[7] + 32 * v22);
      sub_100006178((uint64_t)v30);
      sub_100028F5C(&v41, v30);
      unint64_t v5 = v37;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v21;
    uint64_t v31 = (void *)(v2[6] + 16 * v21);
    *uint64_t v31 = v38;
    v31[1] = v39;
    sub_100028F5C(&v41, (_OWORD *)(v2[7] + 32 * v21));
    uint64_t v32 = v2[2];
    BOOL v16 = __OFADD__(v32, 1);
    uint64_t v33 = v32 + 1;
    if (v16) {
      goto LABEL_37;
    }
    v2[2] = v33;
    unint64_t v5 = v37;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

uint64_t sub_1000A37B4(uint64_t a1)
{
  uint64_t v50 = type metadata accessor for Date();
  uint64_t v2 = *(void *)(v50 - 8);
  __chkstk_darwin(v50);
  uint64_t v49 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_100005E5C(&qword_1000FF7E0);
  __chkstk_darwin(v48);
  unint64_t v5 = (uint64_t *)((char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v6);
  int64_t v8 = (char *)&v40 - v7;
  uint64_t v51 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_100005E5C(&qword_1000FF7E8);
    unint64_t v9 = (unsigned char *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    unint64_t v9 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v10 = *(void *)(v51 + 64);
  uint64_t v42 = v51 + 64;
  uint64_t v11 = -1 << *(unsigned char *)(v51 + 32);
  if (-v11 < 64) {
    uint64_t v12 = ~(-1 << -(char)v11);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v10;
  uint64_t v40 = -1 << *(unsigned char *)(v51 + 32);
  int64_t v41 = (unint64_t)(63 - v11) >> 6;
  uint64_t v47 = v2 + 16;
  uint64_t v46 = (char *)v55 + 8;
  uint64_t v45 = v2 + 32;
  uint64_t v44 = &v53;
  int64_t v14 = v9 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v52 = 0;
  uint64_t v43 = (char *)&type metadata for Any + 8;
  if (!v13) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v16 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  unint64_t v17 = v16 | (v52 << 6);
  while (1)
  {
    uint64_t v22 = v50;
    char v23 = *(void **)(*(void *)(v51 + 48) + 8 * v17);
    uint64_t v24 = v48;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(&v8[*(int *)(v48 + 48)], *(void *)(v51 + 56) + *(void *)(v2 + 72) * v17, v50);
    *(void *)int64_t v8 = v23;
    sub_1000437F8((uint64_t)v8, (uint64_t)v5, &qword_1000FF7E0);
    char v25 = (char *)v5 + *(int *)(v24 + 48);
    *(void *)&v55[0] = *v5;
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v49, v25, v22);
    id v26 = v23;
    BOOL v27 = v46;
    swift_dynamicCast();
    uint64_t v28 = *(void *)&v55[0];
    int64_t v29 = v27;
    uint64_t v30 = v44;
    sub_100028F5C(v29, v44);
    sub_100028F5C(v30, v55);
    sub_100028F5C(v55, v54);
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    Hasher.init(_seed:)();
    String.hash(into:)();
    Swift::Int v31 = Hasher._finalize()();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v32 = -1 << v9[32];
    unint64_t v33 = v31 & ~v32;
    unint64_t v34 = v33 >> 6;
    if (((-1 << v33) & ~*(void *)&v14[8 * (v33 >> 6)]) == 0)
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v32) >> 6;
      while (++v34 != v37 || (v36 & 1) == 0)
      {
        BOOL v38 = v34 == v37;
        if (v34 == v37) {
          unint64_t v34 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)&v14[8 * v34];
        if (v39 != -1)
        {
          unint64_t v35 = __clz(__rbit64(~v39)) + (v34 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    unint64_t v35 = __clz(__rbit64((-1 << v33) & ~*(void *)&v14[8 * (v33 >> 6)])) | v33 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(void *)&v14[(v35 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v35;
    *(void *)(*((void *)v9 + 6) + 8 * v35) = v28;
    uint64_t result = (uint64_t)sub_100028F5C(v54, (_OWORD *)(*((void *)v9 + 7) + 32 * v35));
    ++*((void *)v9 + 2);
    if (v13) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v18 = v52 + 1;
    if (__OFADD__(v52, 1)) {
      goto LABEL_38;
    }
    if (v18 >= v41) {
      goto LABEL_36;
    }
    unint64_t v19 = *(void *)(v42 + 8 * v18);
    int64_t v20 = v52 + 1;
    if (!v19)
    {
      int64_t v20 = v52 + 2;
      if (v52 + 2 >= v41) {
        goto LABEL_36;
      }
      unint64_t v19 = *(void *)(v42 + 8 * v20);
      if (!v19)
      {
        int64_t v20 = v52 + 3;
        if (v52 + 3 >= v41) {
          goto LABEL_36;
        }
        unint64_t v19 = *(void *)(v42 + 8 * v20);
        if (!v19)
        {
          int64_t v20 = v52 + 4;
          if (v52 + 4 >= v41) {
            goto LABEL_36;
          }
          unint64_t v19 = *(void *)(v42 + 8 * v20);
          if (!v19) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v13 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v20 << 6);
    int64_t v52 = v20;
  }
  int64_t v21 = v52 + 5;
  if (v52 + 5 >= v41)
  {
LABEL_36:
    swift_release();
    sub_10001BB94();
    return (uint64_t)v9;
  }
  unint64_t v19 = *(void *)(v42 + 8 * v21);
  if (v19)
  {
    int64_t v20 = v52 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v20 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v20 >= v41) {
      goto LABEL_36;
    }
    unint64_t v19 = *(void *)(v42 + 8 * v20);
    ++v21;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_1000A3D34()
{
  uint64_t v0 = type metadata accessor for SportsLogoSize();
  uint64_t v1 = *(void *)(v0 - 8);
  __n128 v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v1 + 104))(v4, enum case for SportsLogoSize.default(_:), v0, v2);
  uint64_t v5 = SportsLogoSize.rawValue.getter();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  qword_1000FF770 = v5;
  return result;
}

void sub_1000A3E24()
{
  uint64_t v1 = v0;
  uint64_t ActivityOperation = (int *)type metadata accessor for SubscriptionCreateActivityOperation(0);
  sub_10000C568();
  uint64_t v4 = v3;
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v7);
  sub_100005E5C(&qword_1000FF778);
  sub_10000C568();
  uint64_t v9 = v8;
  __chkstk_darwin(v10);
  sub_100009908();
  uint64_t v11 = sub_100005E5C(&qword_1000FCC50);
  __chkstk_darwin(v11 - 8);
  sub_1000098F8();
  uint64_t v14 = v13 - v12;
  uint64_t v44 = &type metadata for TVAppFeatureFlags;
  unint64_t v45 = sub_1000092D4();
  char v15 = isFeatureEnabled(_:)();
  sub_100006178((uint64_t)&v41);
  if (v15)
  {
    sub_10002A3E0(v1, (uint64_t)&v41);
    unint64_t v16 = (uint64_t *)(v1 + ActivityOperation[13]);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    uint64_t v40 = v18;
    uint64_t v39 = v17;
    uint64_t v19 = v1 + ActivityOperation[15];
    uint64_t v20 = *(void *)(v19 + 8);
    BOOL v38 = *(void **)v19;
    if (*(void *)(v1 + 384) == 1)
    {
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      uint64_t v24 = 0;
    }
    else
    {
      uint64_t v23 = *(void *)(v1 + 432);
      uint64_t v24 = *(void *)(v1 + 440);
      uint64_t v21 = *(void *)(v1 + 416);
      uint64_t v22 = *(void *)(v1 + 424);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    char v26 = *(unsigned char *)(v1 + 496);
    if (*(unsigned char *)(v1 + ActivityOperation[16]))
    {
      char v27 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v27) {
        char v28 = 4;
      }
      else {
        char v28 = 1;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      char v28 = 4;
    }
    uint64_t v32 = type metadata accessor for SubscriptionRegisterOperation.PreferredData(0);
    sub_1000082C0(v14, 1, 1, v32);
    LOBYTE(v36) = v28;
    LOBYTE(v35) = v26;
    sub_10002966C(v40, v39, (uint64_t)v38, v20, v23, v24, v21, v22, 0x6B5F7374726F7073, 0xEA00000000007469, v35, 0, 0, v36, v14, *(void *)(v1 + ActivityOperation[14]), *(void *)(v1 + ActivityOperation[14] + 8), v37, (uint64_t)v38,
      v39,
      v40,
      v41,
      v42,
      v43,
      (uint64_t)v44,
      v45,
      v46,
      v47,
      v48);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000437A4(v14, &qword_1000FCC50);
    sub_10002A60C((uint64_t)&v41);
    uint64_t v33 = v50;
    uint64_t v34 = v51;
    sub_100005EA0(v49, v50);
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v34);
    sub_100006178((uint64_t)v49);
  }
  else
  {
    uint64_t v39 = v4;
    uint64_t v40 = v9;
    uint64_t v25 = *(void *)(v1 + 304);
    if ((sub_10007AD1C() & 1) == 0) {
      sub_1000AE6A4();
    }
    swift_bridgeObjectRelease();
    sub_100005EA0((void *)(v25 + 16), *(void *)(v25 + 40));
    BOOL v38 = (void *)dispatch thunk of PersistentStorable.retrieveEventSubscription(canonicalId:isConventionalOrUnified:)();
    uint64_t v41 = sub_1000A5A10(v38);
    sub_1000A9A98(v1, (uint64_t)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for SubscriptionCreateActivityOperation);
    unint64_t v29 = (*(unsigned __int8 *)(v39 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
    uint64_t v30 = swift_allocObject();
    sub_1000AB520((uint64_t)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v30 + v29, (void (*)(void))type metadata accessor for SubscriptionCreateActivityOperation);
    static Subscribers.Demand.unlimited.getter();
    sub_100005E5C(&qword_1000FF780);
    sub_100005E5C(&qword_1000FCEE8);
    sub_10000953C(&qword_1000FF788, &qword_1000FF780);
    sub_10000953C((unint64_t *)&qword_1000FCEF0, &qword_1000FCEE8);
    Publisher.flatMap<A, B>(maxPublishers:_:)();
    swift_release();
    swift_release();
    sub_10000953C(&qword_1000FF790, &qword_1000FF778);
    Publisher.eraseToAnyPublisher()();

    sub_100009894();
    v31();
  }
  sub_1000098A0();
}

uint64_t sub_1000A4370(uint64_t a1)
{
  uint64_t v51 = a1;
  uint64_t v50 = type metadata accessor for Date();
  uint64_t v48 = *(void *)(v50 - 8);
  uint64_t v49 = *(void *)(v48 + 64);
  __chkstk_darwin(v50);
  uint64_t v46 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ActivityOperation = type metadata accessor for SubscriptionCreateActivityOperation(0);
  uint64_t v4 = *(void *)(ActivityOperation - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(ActivityOperation - 8);
  uint64_t v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005E5C(&qword_1000FF850);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v52 = v7;
  uint64_t v53 = v8;
  __chkstk_darwin(v7);
  uint64_t v59 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_100005E5C(&qword_1000FF858);
  uint64_t v58 = *(void *)(v55 - 8);
  __chkstk_darwin(v55);
  uint64_t v47 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100005E5C(&qword_1000FF860);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v56 = v11;
  uint64_t v57 = v12;
  __chkstk_darwin(v11);
  uint64_t v54 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v1 + 336);
  uint64_t v60 = v1;
  uint64_t v61 = *(void *)(*sub_100005EA0((void *)(v1 + 312), v14) + 64);
  uint64_t v44 = type metadata accessor for SubscriptionCreateActivityOperation;
  sub_1000A9A98(v1, (uint64_t)v6, (void (*)(void))type metadata accessor for SubscriptionCreateActivityOperation);
  uint64_t v15 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v38 = ((v15 + 16) & ~v15) + v5;
  uint64_t v16 = (v15 + 16) & ~v15;
  uint64_t v43 = v16;
  uint64_t v39 = v15 | 7;
  uint64_t v17 = swift_allocObject();
  char v42 = type metadata accessor for SubscriptionCreateActivityOperation;
  sub_1000AB520((uint64_t)v6, v17 + v16, (void (*)(void))type metadata accessor for SubscriptionCreateActivityOperation);
  swift_retain();
  static Subscribers.Demand.unlimited.getter();
  sub_100005E5C(&qword_1000FCD78);
  uint64_t v40 = sub_100005E5C(&qword_1000FF868);
  unint64_t v45 = &protocol conformance descriptor for AnyPublisher<A, B>;
  sub_10000953C((unint64_t *)&qword_1000FCD80, &qword_1000FCD78);
  uint64_t v41 = sub_10000953C(&qword_1000FF870, &qword_1000FF868);
  Publisher<>.flatMap<A>(maxPublishers:_:)();
  swift_release();
  swift_release();
  sub_1000A9A98(v60, (uint64_t)v6, (void (*)(void))type metadata accessor for SubscriptionCreateActivityOperation);
  uint64_t v18 = v48;
  uint64_t v19 = v46;
  uint64_t v20 = v50;
  (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v46, v51, v50);
  uint64_t v21 = v18;
  unint64_t v22 = (v38 + *(unsigned __int8 *)(v18 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  uint64_t v23 = swift_allocObject();
  uint64_t v24 = v42;
  uint64_t v25 = v43;
  sub_1000AB520((uint64_t)v6, v23 + v43, (void (*)(void))v42);
  (*(void (**)(unint64_t, char *, uint64_t))(v21 + 32))(v23 + v22, v19, v20);
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = sub_1000ABA34;
  *(void *)(v26 + 24) = v23;
  static Subscribers.Demand.unlimited.getter();
  sub_10000953C(&qword_1000FF878, &qword_1000FF850);
  char v27 = v47;
  uint64_t v28 = v52;
  unint64_t v29 = v59;
  Publisher.flatMap<A, B>(maxPublishers:_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v29, v28);
  sub_1000A9A98(v60, (uint64_t)v6, (void (*)(void))v44);
  uint64_t v30 = swift_allocObject();
  sub_1000AB520((uint64_t)v6, v30 + v25, (void (*)(void))v24);
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_1000ABB08;
  *(void *)(v31 + 24) = v30;
  static Subscribers.Demand.unlimited.getter();
  sub_100005E5C(&qword_1000FCEE8);
  sub_10000953C(&qword_1000FF880, &qword_1000FF858);
  sub_10000953C((unint64_t *)&qword_1000FCEF0, &qword_1000FCEE8);
  uint64_t v33 = v54;
  uint64_t v32 = v55;
  Publisher.flatMap<A, B>(maxPublishers:_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v58 + 8))(v27, v32);
  sub_10000953C(&qword_1000FF888, &qword_1000FF860);
  uint64_t v34 = v56;
  uint64_t v35 = Publisher.eraseToAnyPublisher()();
  (*(void (**)(char *, uint64_t))(v57 + 8))(v33, v34);
  return v35;
}

uint64_t sub_1000A4A74()
{
  uint64_t ActivityOperation = type metadata accessor for SubscriptionCreateActivityOperation(0);
  uint64_t v2 = *(void *)(ActivityOperation - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(ActivityOperation - 8);
  uint64_t v4 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005E5C(&qword_1000FF850);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v41 = v5;
  uint64_t v42 = v6;
  __chkstk_darwin(v5);
  uint64_t v56 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005E5C(&qword_1000FF8A8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v43 = v8;
  uint64_t v44 = v9;
  __chkstk_darwin(v8);
  uint64_t v55 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_100005E5C(&qword_1000FF8B0);
  uint64_t v49 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  uint64_t v57 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005E5C(&qword_1000FF8B8);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v47 = v12;
  uint64_t v48 = v13;
  __chkstk_darwin(v12);
  unint64_t v45 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = v0;
  uint64_t v58 = sub_1000A6614();
  uint64_t v51 = type metadata accessor for SubscriptionCreateActivityOperation;
  uint64_t v38 = v4;
  sub_1000A9A98(v0, (uint64_t)v4, (void (*)(void))type metadata accessor for SubscriptionCreateActivityOperation);
  uint64_t v15 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v16 = (v15 + 16) & ~v15;
  uint64_t v40 = v15 | 7;
  uint64_t v17 = swift_allocObject();
  uint64_t v39 = v16;
  uint64_t v50 = type metadata accessor for SubscriptionCreateActivityOperation;
  sub_1000AB520((uint64_t)v4, v17 + v16, (void (*)(void))type metadata accessor for SubscriptionCreateActivityOperation);
  static Subscribers.Demand.unlimited.getter();
  sub_100005E5C(&qword_1000FCD78);
  sub_100005E5C(&qword_1000FF868);
  uint64_t v54 = &protocol conformance descriptor for AnyPublisher<A, B>;
  sub_10000953C((unint64_t *)&qword_1000FCD80, &qword_1000FCD78);
  sub_10000953C(&qword_1000FF870, &qword_1000FF868);
  Publisher<>.flatMap<A>(maxPublishers:_:)();
  swift_release();
  swift_release();
  uint64_t v18 = v51;
  uint64_t v19 = v52;
  uint64_t v20 = (uint64_t)v38;
  sub_1000A9A98(v52, (uint64_t)v38, (void (*)(void))v51);
  uint64_t v21 = swift_allocObject();
  uint64_t v22 = v21 + v16;
  uint64_t v23 = v50;
  sub_1000AB520(v20, v22, (void (*)(void))v50);
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = sub_1000ABB08;
  *(void *)(v24 + 24) = v21;
  static Subscribers.Demand.unlimited.getter();
  sub_100005E5C(&qword_1000FCEE8);
  uint64_t v53 = &protocol conformance descriptor for Publishers.FlatMap<A, B>;
  sub_10000953C(&qword_1000FF878, &qword_1000FF850);
  sub_10000953C((unint64_t *)&qword_1000FCEF0, &qword_1000FCEE8);
  uint64_t v25 = v41;
  uint64_t v26 = v56;
  Publisher.flatMap<A, B>(maxPublishers:_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v26, v25);
  sub_1000A9A98(v19, v20, (void (*)(void))v18);
  uint64_t v27 = swift_allocObject();
  uint64_t v28 = v39;
  sub_1000AB520(v20, v27 + v39, (void (*)(void))v23);
  static Subscribers.Demand.unlimited.getter();
  sub_100005E5C(&qword_1000FC180);
  sub_10000953C(&qword_1000FF8C0, &qword_1000FF8A8);
  sub_10000953C(&qword_1000FC188, &qword_1000FC180);
  uint64_t v29 = v43;
  uint64_t v30 = v55;
  Publisher.flatMap<A>(maxPublishers:_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v30, v29);
  sub_1000A9A98(v52, v20, (void (*)(void))v51);
  uint64_t v31 = swift_allocObject();
  sub_1000AB520(v20, v31 + v28, (void (*)(void))v50);
  static Subscribers.Demand.unlimited.getter();
  sub_100005E5C(&qword_1000FD310);
  sub_10000953C(&qword_1000FF8C8, &qword_1000FF8B0);
  sub_10000953C(&qword_1000FD318, &qword_1000FD310);
  uint64_t v33 = v45;
  uint64_t v32 = v46;
  uint64_t v34 = v57;
  Publisher.flatMap<A, B>(maxPublishers:_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v34, v32);
  sub_10000953C(&qword_1000FF8D0, &qword_1000FF8B8);
  uint64_t v35 = v47;
  uint64_t v36 = Publisher.eraseToAnyPublisher()();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v33, v35);
  return v36;
}

uint64_t sub_1000A51DC@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1000A520C(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1000A520C(uint64_t a1)
{
  uint64_t v29 = a1;
  uint64_t v2 = sub_100005E5C(&qword_1000FF898);
  uint64_t v25 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005E5C(&qword_1000FD258);
  uint64_t v27 = *(void *)(v5 - 8);
  uint64_t v28 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005E5C(&qword_1000FF890);
  uint64_t v24 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for SportsScheduledActivities();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005EA0((void *)(*(void *)(v1 + 304) + 16), *(void *)(*(void *)(v1 + 304) + 40));
  dispatch thunk of PersistentStorable.scheduledLiveActivities.getter();
  uint64_t v15 = SportsScheduledActivities.scheduledActivities.getter();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v16 = *(void *)(v15 + 16);
  swift_bridgeObjectRelease();
  if (v16 >= v29)
  {
    sub_10004D2D4();
    uint64_t v20 = swift_allocError();
    *uint64_t v21 = xmmword_1000CF510;
    uint64_t v30 = v20;
    sub_100005E5C((uint64_t *)&unk_1000FDA30);
    Fail.init(error:)();
    sub_10000953C(&qword_1000FF8A0, &qword_1000FF890);
    uint64_t v19 = Publisher.eraseToAnyPublisher()();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v8);
  }
  else
  {
    Just.init(_:)();
    sub_100005E5C((uint64_t *)&unk_1000FDA30);
    uint64_t v17 = v26;
    Just.setFailureType<A>(to:)();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v4, v17);
    sub_10000953C(&qword_1000FD2B0, &qword_1000FD258);
    uint64_t v18 = v28;
    uint64_t v19 = Publisher.eraseToAnyPublisher()();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v7, v18);
  }
  return v19;
}

uint64_t sub_1000A5604(uint64_t a1)
{
  uint64_t v21 = a1;
  uint64_t v2 = sub_100005E5C(&qword_1000FF890);
  uint64_t v19 = *(void *)(v2 - 8);
  uint64_t v20 = v2;
  __chkstk_darwin(v2);
  uint64_t v3 = sub_100005E5C(&qword_1000FF898);
  uint64_t v16 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005E5C(&qword_1000FD258);
  uint64_t v17 = *(void *)(v6 - 8);
  uint64_t v18 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100005E5C(&qword_1000FC938);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005EA0((void *)(*(void *)(v1 + 304) + 16), *(void *)(*(void *)(v1 + 304) + 40));
  uint64_t v12 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v11, v21, v12);
  sub_1000082C0((uint64_t)v11, 0, 1, v12);
  type metadata accessor for SubscriptionCreateActivityOperation(0);
  dispatch thunk of PersistentStorable.scheduleLiveActivity(_:forId:)();
  sub_1000437A4((uint64_t)v11, &qword_1000FC938);
  Just.init(_:)();
  sub_100005E5C((uint64_t *)&unk_1000FDA30);
  Just.setFailureType<A>(to:)();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v3);
  sub_10000953C(&qword_1000FD2B0, &qword_1000FD258);
  uint64_t v13 = v18;
  uint64_t v14 = Publisher.eraseToAnyPublisher()();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v8, v13);
  return v14;
}

uint64_t sub_1000A5A10(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = v1 + 392;
  uint64_t v5 = sub_100005E5C(&qword_1000FF798);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100005E5C(&qword_1000FF7A0);
  uint64_t v66 = *(void *)(v9 - 8);
  uint64_t v67 = v9;
  __chkstk_darwin(v9);
  uint64_t v64 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100005E5C(&qword_1000FF7A8);
  uint64_t v68 = *(void *)(v11 - 8);
  uint64_t v69 = v11;
  __chkstk_darwin(v11);
  uint64_t v65 = (char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t Activity = type metadata accessor for SubscriptionCreateActivityOperation.ActivityData(0);
  __chkstk_darwin(Activity);
  uint64_t v62 = (uint64_t)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v63 = (char *)&v59 - v15;
  uint64_t ActivityOperation = type metadata accessor for SubscriptionCreateActivityOperation(0);
  __chkstk_darwin(ActivityOperation);
  uint64_t v18 = (char *)&v59 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100005E5C(&qword_1000FD498);
  __chkstk_darwin(v19 - 8);
  uint64_t v21 = (char *)&v59 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = type metadata accessor for SportingEventSubscription.Metadata();
  __chkstk_darwin(v22);
  uint64_t v26 = (char *)&v59 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(v4 + 104))
  {
    uint64_t v27 = *(void *)(v2 + 384);
    if (v27 == 1)
    {
      sub_10004D2D4();
      uint64_t v28 = swift_allocError();
      *uint64_t v29 = xmmword_1000CF520;
      uint64_t v72 = v28;
      sub_100005E5C((uint64_t *)&unk_1000FDA30);
      Fail.init(error:)();
      sub_10000953C(&qword_1000FF7B8, &qword_1000FF798);
      uint64_t v30 = Publisher.eraseToAnyPublisher()();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    }
    else
    {
      uint64_t v34 = *(void *)(v2 + 456);
      uint64_t v35 = *(void *)(v2 + 376);
      char v36 = *(_DWORD *)(v2 + 368);
      uint64_t v72 = *(void *)(v2 + 360);
      char v73 = v36 & 1;
      uint64_t v74 = v35;
      uint64_t v75 = v27;
      long long v37 = *(_OWORD *)(v4 + 16);
      long long v76 = *(_OWORD *)v4;
      long long v77 = v37;
      long long v38 = *(_OWORD *)(v4 + 48);
      long long v78 = *(_OWORD *)(v4 + 32);
      long long v79 = v38;
      uint64_t v80 = v34;
      return sub_1000A8458(&v72);
    }
    return v30;
  }
  if (a1)
  {
    uint64_t v61 = v24;
    uint64_t v31 = v23;
    id v32 = a1;
    uint64_t v33 = *(void *)(SportingEventSubscription.consumers.getter() + 16);
    swift_bridgeObjectRelease();
    if (v33)
    {
      SportingEventSubscription.metadata.getter();
      if (sub_1000082E8((uint64_t)v21, 1, v31) == 1)
      {
        sub_1000437A4((uint64_t)v21, &qword_1000FD498);
        uint64_t v30 = sub_1000A8E24();
      }
      else
      {
        id v60 = v32;
        uint64_t v40 = v61;
        (*(void (**)(char *, char *, uint64_t))(v61 + 32))(v26, v21, v31);
        if (sub_1000A9208())
        {
          sub_1000A98CC();
          if (qword_1000FBDE0 != -1) {
            swift_once();
          }
          uint64_t v41 = type metadata accessor for Logger();
          sub_10000929C(v41, (uint64_t)qword_10010A568);
          sub_1000A9A98(v2, (uint64_t)v18, (void (*)(void))type metadata accessor for SubscriptionCreateActivityOperation);
          uint64_t v42 = Logger.logObject.getter();
          os_log_type_t v43 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v42, v43))
          {
            uint64_t v44 = (uint8_t *)swift_slowAlloc();
            uint64_t v45 = swift_slowAlloc();
            *(_DWORD *)uint64_t v44 = 136315138;
            uint64_t v72 = v45;
            uint64_t v59 = v44 + 4;
            uint64_t v46 = (uint64_t *)&v18[*(int *)(ActivityOperation + 60)];
            uint64_t v47 = *v46;
            unint64_t v48 = v46[1];
            swift_bridgeObjectRetain();
            uint64_t v71 = sub_100017098(v47, v48, &v72);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            sub_1000A9AF0((uint64_t)v18, (void (*)(void))type metadata accessor for SubscriptionCreateActivityOperation);
            _os_log_impl((void *)&_mh_execute_header, v42, v43, "Metadata and logos already exist, skip UTS call for %s", v44, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
            sub_1000A9AF0((uint64_t)v18, (void (*)(void))type metadata accessor for SubscriptionCreateActivityOperation);
          }

          id v49 = v60;
          uint64_t v50 = SportingEventSubscription.sport.getter();
          uint64_t v52 = v51;
          uint64_t v53 = v63;
          uint64_t v54 = v61;
          (*(void (**)(char *, char *, uint64_t))(v61 + 16))(&v63[*(int *)(Activity + 24)], v26, v31);
          void *v53 = 0;
          v53[1] = 0;
          v53[2] = v50;
          v53[3] = v52;
          sub_1000A9A98((uint64_t)v53, v62, (void (*)(void))type metadata accessor for SubscriptionCreateActivityOperation.ActivityData);
          uint64_t v55 = v64;
          Just.init(_:)();
          sub_100005E5C((uint64_t *)&unk_1000FDA30);
          uint64_t v56 = v65;
          uint64_t v57 = v67;
          Just.setFailureType<A>(to:)();
          (*(void (**)(char *, uint64_t))(v66 + 8))(v55, v57);
          sub_10000953C(&qword_1000FF7B0, &qword_1000FF7A8);
          uint64_t v58 = v69;
          uint64_t v30 = Publisher.eraseToAnyPublisher()();

          (*(void (**)(char *, uint64_t))(v68 + 8))(v56, v58);
          sub_1000A9AF0((uint64_t)v53, (void (*)(void))type metadata accessor for SubscriptionCreateActivityOperation.ActivityData);
          (*(void (**)(char *, uint64_t))(v54 + 8))(v26, v31);
        }
        else
        {
          uint64_t v30 = sub_1000A8E24();

          (*(void (**)(char *, uint64_t))(v40 + 8))(v26, v31);
        }
      }
      return v30;
    }
  }

  return sub_1000A8E24();
}

uint64_t sub_1000A62F0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  long long v38 = a3;
  uint64_t v5 = sub_100005E5C(&qword_1000FCC50);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002A3E0(a2, (uint64_t)v39);
  uint64_t ActivityOperation = (int *)type metadata accessor for SubscriptionCreateActivityOperation(0);
  uint64_t v9 = (uint64_t *)(a2 + ActivityOperation[13]);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  uint64_t v37 = v11;
  uint64_t v36 = v10;
  uint64_t v12 = ActivityOperation[16];
  uint64_t v13 = (uint64_t *)(a2 + ActivityOperation[15]);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  uint64_t v35 = v15;
  uint64_t v34 = v14;
  uint64_t v16 = *a1;
  uint64_t v17 = a1[1];
  uint64_t v18 = a1[2];
  uint64_t v33 = a1[3];
  uint64_t v19 = *(void *)(a2 + 384);
  if (*(unsigned char *)(a2 + v12))
  {
    char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v20) {
      char v21 = 4;
    }
    else {
      char v21 = 1;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    char v21 = 4;
  }
  uint64_t v22 = (char *)a1 + *(int *)(type metadata accessor for SubscriptionCreateActivityOperation.ActivityData(0) + 24);
  uint64_t v23 = type metadata accessor for SportingEventSubscription.Metadata();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(v7, v22, v23);
  sub_1000082C0((uint64_t)v7, 0, 1, v23);
  uint64_t v24 = type metadata accessor for SubscriptionRegisterOperation.PreferredData(0);
  sub_1000082C0((uint64_t)v7, 0, 1, v24);
  LOBYTE(v30) = v21;
  LOBYTE(v29) = v19 != 1;
  sub_10002966C(v37, v36, v35, v34, v16, v17, v18, v33, 0x6B5F7374726F7073, 0xEA00000000007469, v29, 0, 0, v30, (uint64_t)v7, *(void *)(a2 + ActivityOperation[14]), *(void *)(a2 + ActivityOperation[14] + 8), v31, v32,
    v33,
    v34,
    v35,
    v36,
    v37,
    (uint64_t)v38,
    v39[0],
    v40,
    v41,
    v42);
  sub_1000437A4((uint64_t)v7, &qword_1000FCC50);
  sub_10002A60C((uint64_t)v39);
  uint64_t v25 = v44;
  uint64_t v26 = v45;
  sub_100005EA0(v43, v44);
  uint64_t v27 = (*(uint64_t (**)(uint64_t, uint64_t))(v26 + 8))(v25, v26);
  *long long v38 = v27;
  return sub_100006178((uint64_t)v43);
}

uint64_t sub_1000A65AC()
{
  sub_1000AE4E8();
  uint64_t v0 = (uint64_t *)sub_1000438D4();

  return sub_1000A62F0(v0, v1, v2);
}

uint64_t type metadata accessor for SubscriptionCreateActivityOperation.ActivityData(uint64_t a1)
{
  return sub_10003B620(a1, qword_1000FF960);
}

uint64_t sub_1000A6614()
{
  uint64_t v1 = sub_100005E5C(&qword_1000FCD88);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v9[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[3] = &type metadata for TVAppFeatureFlags;
  v9[4] = sub_1000092D4();
  char v5 = isFeatureEnabled(_:)();
  sub_100006178((uint64_t)v9);
  if (v5)
  {
    uint64_t v6 = *(void *)(*sub_100005EA0((void *)(v0 + 312), *(void *)(v0 + 336)) + 56);
    swift_retain();
  }
  else
  {
    v9[0] = 0x7FFFFFFFFFFFFFFFLL;
    Just.init(_:)();
    sub_10000953C(&qword_1000FCDA0, &qword_1000FCD88);
    uint64_t v6 = Publisher.eraseToAnyPublisher()();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return v6;
}

uint64_t sub_1000A6784@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1000A67B4(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1000A67B4(uint64_t a1)
{
  uint64_t ActivityOperation = type metadata accessor for SubscriptionCreateActivityOperation(0);
  uint64_t v4 = *(void *)(ActivityOperation - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(ActivityOperation - 8);
  sub_1000A9A98(v1, (uint64_t)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for SubscriptionCreateActivityOperation);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  sub_1000AB520((uint64_t)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, (void (*)(void))type metadata accessor for SubscriptionCreateActivityOperation);
  *(void *)(v7 + ((v5 + v6 + 7) & 0xFFFFFFFFFFFFFFF8)) = a1;
  sub_100005E5C(&qword_1000FF8E8);
  swift_allocObject();
  v10[1] = Future.init(_:)();
  sub_10000953C(&qword_1000FF8F0, &qword_1000FF8E8);
  uint64_t v8 = Publisher.eraseToAnyPublisher()();
  swift_release();
  return v8;
}

uint64_t sub_1000A6960()
{
  uint64_t v1 = sub_100005E5C(&qword_1000FC8E0);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v9[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[3] = &type metadata for TVAppFeatureFlags;
  v9[4] = sub_1000092D4();
  char v5 = isFeatureEnabled(_:)();
  sub_100006178((uint64_t)v9);
  if (v5)
  {
    uint64_t v6 = *(void *)(*sub_100005EA0((void *)(v0 + 312), *(void *)(v0 + 336)) + 48);
    swift_retain();
  }
  else
  {
    v9[0] = 0x53552D6E65;
    v9[1] = 0xE500000000000000;
    Just.init(_:)();
    sub_10000953C(&qword_1000FC900, &qword_1000FC8E0);
    uint64_t v6 = Publisher.eraseToAnyPublisher()();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return v6;
}

uint64_t sub_1000A6ADC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t ActivityOperation = type metadata accessor for SubscriptionCreateActivityOperation(0);
  uint64_t v7 = *(void *)(ActivityOperation - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(ActivityOperation - 8);
  uint64_t v10 = *a1;
  uint64_t v9 = a1[1];
  sub_1000A9A98(a2, (uint64_t)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for SubscriptionCreateActivityOperation);
  unint64_t v11 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v12 = swift_allocObject();
  sub_1000AB520((uint64_t)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v12 + v11, (void (*)(void))type metadata accessor for SubscriptionCreateActivityOperation);
  uint64_t v13 = (void *)(v12 + ((v8 + v11 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v13 = v10;
  v13[1] = v9;
  sub_100005E5C(&qword_1000FD310);
  swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t result = Future.init(_:)();
  *a3 = result;
  return result;
}

uint64_t sub_1000A6C54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t ActivityOperation = type metadata accessor for SubscriptionCreateActivityOperation(0);
  uint64_t v11 = *(void *)(ActivityOperation - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(ActivityOperation - 8);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100005E5C(&qword_1000FC940);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a1;
  *(void *)(v17 + 24) = a2;
  uint64_t v18 = type metadata accessor for TaskPriority();
  sub_1000082C0((uint64_t)v16, 1, 1, v18);
  sub_1000A9A98(a3, (uint64_t)v13, (void (*)(void))type metadata accessor for SubscriptionCreateActivityOperation);
  unint64_t v19 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v20 = (v12 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = 0;
  *(void *)(v21 + 24) = 0;
  sub_1000AB520((uint64_t)v13, v21 + v19, (void (*)(void))type metadata accessor for SubscriptionCreateActivityOperation);
  uint64_t v22 = (void *)(v21 + v20);
  *uint64_t v22 = a4;
  v22[1] = a5;
  uint64_t v23 = (uint64_t (**)(uint64_t, char))(v21 + ((v20 + 23) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v23 = sub_100037FE4;
  v23[1] = (uint64_t (*)(uint64_t, char))v17;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_100051F94((uint64_t)v16, (uint64_t)&unk_1000FF8E0, v21);
  return swift_release();
}

uint64_t sub_1000A6E68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[10] = a7;
  v8[11] = a8;
  v8[8] = a5;
  v8[9] = a6;
  v8[7] = a4;
  uint64_t v9 = type metadata accessor for SportingEventProgressStatus();
  v8[12] = v9;
  v8[13] = *(void *)(v9 - 8);
  v8[14] = swift_task_alloc();
  v8[15] = type metadata accessor for SubscriptionCreateActivityOperation(0);
  v8[16] = swift_task_alloc();
  return _swift_task_switch(sub_1000A6F60, 0, 0);
}

uint64_t sub_1000A6F60()
{
  sub_10001C234();
  if (qword_1000FBDA0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 56);
  *(void *)(v0 + 136) = qword_10010A4E0;
  uint64_t v3 = *(int *)(v1 + 60);
  *(_DWORD *)(v0 + 208) = v3;
  uint64_t v4 = (void *)(v2 + v3);
  *(void *)(v0 + 144) = *v4;
  *(void *)(v0 + 152) = v4[1];
  *(unsigned char *)(v0 + 212) = *(unsigned char *)(v2 + 352);
  *(unsigned char *)(v0 + 213) = *(unsigned char *)(v2 + 496);
  char v5 = (void *)(v2 + *(int *)(v1 + 56));
  *(void *)(v0 + 160) = *v5;
  *(void *)(v0 + 168) = v5[1];
  if (qword_1000FBD90 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_10010A4D0;
  return _swift_task_switch(sub_1000A707C, v6, 0);
}

uint64_t sub_1000A707C()
{
  sub_10001C28C();
  sub_10005A11C(*(void *)(v0 + 144), *(void *)(v0 + 152), *(unsigned __int8 *)(v0 + 212), *(unsigned char *)(v0 + 213), *(void *)(v0 + 160), *(void *)(v0 + 168), *(void *)(v0 + 64), *(void *)(v0 + 72));
  *(void *)(v0 + 176) = 0;
  return _swift_task_switch(sub_1000A7118, 0, 0);
}

uint64_t sub_1000A7118()
{
  uint64_t v31 = v0;
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v1 + 304);
  uint64_t v3 = *(void (**)(uint64_t))(v1 + *(int *)(v0 + 208));
  if ((sub_10007AD1C() & 1) == 0) {
    sub_1000AE6A4();
  }
  swift_bridgeObjectRelease();
  sub_100005EA0((void *)(v2 + 16), *(void *)(v2 + 40));
  uint64_t v4 = dispatch thunk of PersistentStorable.retrieveEventSubscription(canonicalId:isConventionalOrUnified:)();
  *(void *)(v0 + 184) = v4;
  if (v4)
  {
    char v5 = (void *)v4;
    if (qword_1000FBDE0 != -1) {
      swift_once();
    }
    uint64_t v6 = *(void *)(v0 + 128);
    uint64_t v7 = *(void *)(v0 + 56);
    uint64_t v8 = type metadata accessor for Logger();
    sub_10000929C(v8, (uint64_t)qword_10010A568);
    sub_1000A9A98(v7, v6, (void (*)(void))type metadata accessor for SubscriptionCreateActivityOperation);
    id v9 = v5;
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.debug.getter();
    BOOL v12 = os_log_type_enabled(v10, v11);
    uint64_t v13 = *(void *)(v0 + 128);
    if (v12)
    {
      os_log_type_t type = v11;
      uint64_t v14 = *(void *)(v0 + 120);
      uint64_t v15 = swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315394;
      uint64_t v16 = (uint64_t *)(v13 + *(int *)(v14 + 60));
      uint64_t v18 = *v16;
      unint64_t v17 = v16[1];
      swift_bridgeObjectRetain();
      *(void *)(v0 + 40) = sub_100017098(v18, v17, &v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_1000A9AF0(v13, (void (*)(void))type metadata accessor for SubscriptionCreateActivityOperation);
      *(_WORD *)(v15 + 12) = 2080;
      unint64_t v19 = (void *)SportingEventSubscription.sportingEventDetails.getter();
      SportingEvent.progressStatus.getter();

      uint64_t v20 = SportingEventProgressStatus.rawValue.getter();
      unint64_t v22 = v21;
      sub_100009894();
      v23();
      *(void *)(v0 + 48) = sub_100017098(v20, v22, &v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v10, type, "Update activity for '%s' with latest state %s", (uint8_t *)v15, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_1000A9AF0(*(void *)(v0 + 128), (void (*)(void))type metadata accessor for SubscriptionCreateActivityOperation);
    }
    uint64_t v28 = (void *)swift_task_alloc();
    *(void *)(v0 + 192) = v28;
    *uint64_t v28 = v0;
    v28[1] = sub_1000A757C;
    return sub_10005EFDC();
  }
  else
  {
    sub_1000A7B90();
    if (qword_1000FBE10 != -1) {
      swift_once();
    }
    sub_1000AE754();
    sub_1000A0D90(*v24, v24[1]);
    uint64_t v25 = sub_1000AE740();
    v3(v25);
    sub_1000AE728();
    swift_task_dealloc();
    sub_10001C2E0();
    return v26();
  }
}

uint64_t sub_1000A757C()
{
  sub_10001C234();
  sub_10001C208();
  *(void *)(v1 + 200) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1000A7958;
  }
  else {
    uint64_t v2 = sub_1000A7668;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000A7668()
{
  sub_10001C28C();

  sub_1000A7B90();
  if (qword_1000FBE10 != -1) {
    swift_once();
  }
  sub_1000AE754();
  sub_1000A0D90(*v2, v2[1]);
  uint64_t v3 = sub_1000AE740();
  v0(v3);
  sub_1000AE728();
  swift_task_dealloc();
  sub_10001C2E0();
  return v4();
}

uint64_t sub_1000A7728()
{
  uint64_t v2 = v1[22];
  sub_1000AE828();
  sub_100005E5C((uint64_t *)&unk_1000FDA30);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_4;
  }
  uint64_t v3 = v1[2];
  unint64_t v4 = v1[3];
  if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 0xA)
  {
    sub_1000AC0C0(v1[2], v1[3]);
LABEL_4:
    swift_errorRelease();
    char v5 = (void *)swift_allocObject();
    sub_1000AE794(v5);
    uint64_t v6 = qword_1000FBD60;
    swift_retain();
    if (v6 != -1) {
      swift_once();
    }
    sub_1000AE630();
    uint64_t v7 = sub_1000AE644();
    sub_100030914(v7, v8, v9, v10, (uint64_t)sub_1000AC08C, v0);
    swift_release();
    goto LABEL_12;
  }
  swift_errorRelease();
  os_log_type_t v11 = (void (*)(void))v1[10];
  if (v4 == 2)
  {
    sub_10006087C();
    uint64_t v12 = sub_100090708();
    sub_1000AE710(v12, v13);
    v11();
    swift_errorRelease();
  }
  else
  {
    uint64_t v14 = (void *)swift_allocObject();
    sub_1000AE7F4(v14);
    sub_1000AC128(v3, v4);
    if (qword_1000FBD60 != -1) {
      swift_once();
    }
    sub_1000AE630();
    uint64_t v15 = sub_1000AE644();
    sub_100030914(v15, v16, v17, v18, (uint64_t)sub_1000AC11C, v2);
    sub_1000AC0C0(v3, v4);
    swift_release();
  }
LABEL_12:
  swift_errorRelease();
  sub_1000AE728();
  swift_task_dealloc();
  sub_10001C2E0();
  return v19();
}

uint64_t sub_1000A7958()
{
  uint64_t v2 = *(void *)(v1 + 200);
  sub_1000AE828();
  sub_100005E5C((uint64_t *)&unk_1000FDA30);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_4;
  }
  uint64_t v3 = *(void *)(v1 + 16);
  unint64_t v4 = *(void *)(v1 + 24);
  if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 0xA)
  {
    sub_1000AC0C0(*(void *)(v1 + 16), *(void *)(v1 + 24));
LABEL_4:
    swift_errorRelease();
    char v5 = (void *)swift_allocObject();
    sub_1000AE794(v5);
    uint64_t v6 = qword_1000FBD60;
    swift_retain();
    if (v6 != -1) {
      swift_once();
    }
    sub_1000AE630();
    uint64_t v7 = sub_1000AE644();
    sub_100030914(v7, v8, v9, v10, (uint64_t)sub_1000AC08C, v0);
    swift_release();
    goto LABEL_12;
  }
  swift_errorRelease();
  os_log_type_t v11 = *(void (**)(void))(v1 + 80);
  if (v4 == 2)
  {
    sub_10006087C();
    uint64_t v12 = sub_100090708();
    sub_1000AE710(v12, v13);
    v11();
    swift_errorRelease();
  }
  else
  {
    uint64_t v14 = (void *)swift_allocObject();
    sub_1000AE7F4(v14);
    sub_1000AC128(v3, v4);
    if (qword_1000FBD60 != -1) {
      swift_once();
    }
    sub_1000AE630();
    uint64_t v15 = sub_1000AE644();
    sub_100030914(v15, v16, v17, v18, (uint64_t)sub_1000AC11C, v2);
    sub_1000AC0C0(v3, v4);
    swift_release();
  }
LABEL_12:
  swift_errorRelease();
  sub_1000AE728();
  swift_task_dealloc();
  sub_10001C2E0();
  return v19();
}

uint64_t sub_1000A7B90()
{
  uint64_t ActivityOperation = type metadata accessor for SubscriptionCreateActivityOperation(0);
  __chkstk_darwin(ActivityOperation);
  uint64_t v2 = sub_100005E5C(&qword_1000FC938);
  __chkstk_darwin(v2 - 8);
  unint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005EA0((void *)(*(void *)(v0 + 304) + 16), *(void *)(*(void *)(v0 + 304) + 40));
  uint64_t v5 = type metadata accessor for Date();
  sub_1000082C0((uint64_t)v4, 1, 1, v5);
  dispatch thunk of PersistentStorable.scheduleLiveActivity(_:forId:)();
  return sub_1000437A4((uint64_t)v4, &qword_1000FC938);
}

uint64_t sub_1000A7E8C(uint64_t a1, void (*a2)(uint64_t, uint64_t), uint64_t a3, uint64_t a4, unint64_t a5)
{
  sub_10006087C();
  uint64_t v8 = swift_allocError();
  uint64_t *v9 = a4;
  v9[1] = a5;
  sub_1000AC13C(a4, a5);
  a2(v8, 1);

  return swift_errorRelease();
}

uint64_t sub_1000A7F20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ActivityOperation = type metadata accessor for SubscriptionCreateActivityOperation(0);
  uint64_t v9 = *(void *)(ActivityOperation - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(ActivityOperation - 8);
  os_log_type_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005E5C(&qword_1000FC940);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a1;
  *(void *)(v15 + 24) = a2;
  uint64_t v16 = type metadata accessor for TaskPriority();
  sub_1000082C0((uint64_t)v14, 1, 1, v16);
  sub_1000A9A98(a3, (uint64_t)v11, (void (*)(void))type metadata accessor for SubscriptionCreateActivityOperation);
  unint64_t v17 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v18 = (v10 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = 0;
  *(void *)(v19 + 24) = 0;
  sub_1000AB520((uint64_t)v11, v19 + v17, (void (*)(void))type metadata accessor for SubscriptionCreateActivityOperation);
  uint64_t v20 = (uint64_t (**)(uint64_t, char))(v19 + v18);
  *uint64_t v20 = sub_10001D24C;
  v20[1] = (uint64_t (*)(uint64_t, char))v15;
  *(void *)(v19 + ((v18 + 23) & 0xFFFFFFFFFFFFFFF8)) = a4;
  swift_retain();
  sub_100051F94((uint64_t)v14, (uint64_t)&unk_1000FF900, v19);
  return swift_release();
}

uint64_t sub_1000A8124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[9] = a6;
  v7[10] = a7;
  v7[7] = a4;
  v7[8] = a5;
  return _swift_task_switch(sub_1000A8148, 0, 0);
}

uint64_t sub_1000A8148()
{
  sub_10001C28C();
  v0[5] = &type metadata for TVAppFeatureFlags;
  v0[6] = sub_1000092D4();
  char v1 = isFeatureEnabled(_:)();
  sub_100006178((uint64_t)(v0 + 2));
  if (v1)
  {
    if (qword_1000FBDA0 != -1) {
      swift_once();
    }
    v0[11] = qword_10010A4E0;
    if (qword_1000FBD90 != -1) {
      swift_once();
    }
    uint64_t v2 = qword_10010A4D0;
    return _swift_task_switch(sub_1000A8338, v2, 0);
  }
  else
  {
    if (*(unsigned char *)(v0[7] + 496) != 1) {
      goto LABEL_13;
    }
    if (qword_1000FBDA0 != -1) {
      swift_once();
    }
    type metadata accessor for SubscriptionCreateActivityOperation(0);
    if ((sub_100056D04() & 1) == 0)
    {
      uint64_t v3 = (void (*)(void))v0[8];
      sub_10004D2D4();
      sub_100090708();
      *unint64_t v4 = xmmword_1000CF530;
      v3();
      swift_errorRelease();
    }
    else
    {
LABEL_13:
      ((void (*)(void, void))v0[8])(0, 0);
    }
    sub_10001C2E0();
    return v5();
  }
}

uint64_t sub_1000A8338()
{
  sub_10001C234();
  *(void *)(v0 + 96) = sub_100056EE4();
  return _swift_task_switch(sub_1000A83A0, 0, 0);
}

uint64_t sub_1000A83A0()
{
  sub_10001C28C();
  char v1 = (void (*)(void))v0[8];
  if (v0[12] >= v0[10])
  {
    sub_10004D2D4();
    sub_100090708();
    *uint64_t v2 = xmmword_1000CBBE0;
    v1();
    swift_errorRelease();
  }
  else
  {
    ((void (*)(void, void))v1)(0, 0);
  }
  sub_10001C2E0();
  return v3();
}

uint64_t sub_1000A8458(void *a1)
{
  uint64_t ActivityOperation = type metadata accessor for SubscriptionCreateActivityOperation(0);
  uint64_t v66 = *(void *)(ActivityOperation - 8);
  __chkstk_darwin(ActivityOperation - 8);
  uint64_t v67 = v3;
  uint64_t v62 = (char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_100005E5C(&qword_1000FD6E8);
  uint64_t v64 = *(void *)(v65 - 8);
  __chkstk_darwin(v65);
  uint64_t v63 = (char *)&v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005E5C(&qword_1000FD6F0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v70 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005E5C(&qword_1000FF7C0);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v69 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = type metadata accessor for TemplateImageUrl.ImageFormat();
  uint64_t v11 = *(void *)(v81 - 8);
  __chkstk_darwin(v81);
  uint64_t v80 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100005E5C((uint64_t *)&unk_1000FDA80);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for URL();
  __chkstk_darwin(v16);
  uint64_t v75 = (char *)&v58 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = a1[6];
  uint64_t v71 = v8;
  uint64_t v72 = v5;
  if (!v20)
  {
    uint64_t v23 = _swiftEmptyArrayStorage;
LABEL_18:
    uint64_t v44 = (uint64_t)v62;
    os_log_type_t v43 = a1;
    goto LABEL_19;
  }
  uint64_t v61 = v9;
  uint64_t v21 = *(void *)(v20 + 16);
  if (!v21)
  {
    uint64_t v23 = _swiftEmptyArrayStorage;
    uint64_t v9 = v61;
    goto LABEL_18;
  }
  uint64_t v59 = v6;
  id v60 = a1;
  unsigned int v79 = enum case for TemplateImageUrl.ImageFormat.png(_:);
  long long v77 = (void (**)(char *, uint64_t))(v11 + 8);
  long long v78 = (void (**)(char *, void, uint64_t))(v11 + 104);
  char v73 = (void (**)(char *, uint64_t))(v18 + 8);
  uint64_t v74 = (void (**)(char *, char *, uint64_t))(v18 + 32);
  swift_bridgeObjectRetain_n();
  uint64_t v58 = v20;
  uint64_t v22 = (void *)(v20 + 56);
  uint64_t v23 = _swiftEmptyArrayStorage;
  do
  {
    unint64_t v24 = v22[2];
    if (v24 >= 2)
    {
      uint64_t v84 = v23;
      uint64_t v25 = v16;
      uint64_t v26 = v15;
      uint64_t v27 = *(v22 - 2);
      uint64_t v82 = *(v22 - 3);
      uint64_t v28 = v22[4];
      uint64_t v29 = v22[1];
      swift_bridgeObjectRetain();
      uint64_t v85 = v27;
      swift_bridgeObjectRetain();
      sub_10002A5A8(v29, v24);
      uint64_t v83 = v28;
      swift_bridgeObjectRetain();
      sub_10002A5A8(v29, v24);
      if (qword_1000FBE30 != -1) {
        swift_once();
      }
      uint64_t v31 = v80;
      uint64_t v30 = v81;
      (*v78)(v80, v79, v81);
      static TemplateImageUrl.imageUrl(templateUrl:width:height:format:)();
      sub_1000479B8(v29, v24);
      uint64_t v32 = v31;
      uint64_t v15 = v26;
      (*v77)(v32, v30);
      uint64_t v33 = (uint64_t)v26;
      uint64_t v16 = v25;
      if (sub_1000082E8(v33, 1, v25) == 1)
      {
        sub_1000437A4((uint64_t)v15, (uint64_t *)&unk_1000FDA80);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1000479B8(v29, v24);
        swift_bridgeObjectRelease();
        uint64_t v23 = v84;
      }
      else
      {
        uint64_t v34 = v75;
        (*v74)(v75, v15, v25);
        swift_bridgeObjectRetain();
        uint64_t v35 = URL.absoluteString.getter();
        uint64_t v76 = v36;
        (*v73)(v34, v25);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1000479B8(v29, v24);
        swift_bridgeObjectRelease();
        uint64_t v23 = v84;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1000158A8();
          uint64_t v23 = v41;
        }
        unint64_t v37 = v23[2];
        if (v37 >= v23[3] >> 1)
        {
          sub_1000158A8();
          uint64_t v23 = v42;
        }
        void v23[2] = v37 + 1;
        long long v38 = &v23[4 * v37];
        uint64_t v39 = v85;
        v38[4] = v82;
        v38[5] = v39;
        uint64_t v40 = v76;
        v38[6] = v35;
        v38[7] = v40;
      }
    }
    v22 += 9;
    --v21;
  }
  while (v21);
  uint64_t v17 = swift_bridgeObjectRelease_n();
  os_log_type_t v43 = v60;
  uint64_t v6 = v59;
  uint64_t v9 = v61;
  uint64_t v44 = (uint64_t)v62;
LABEL_19:
  uint64_t v45 = v68;
  uint64_t v46 = *(void *)(v68 + 304);
  __chkstk_darwin(v17);
  *(&v58 - 2) = (uint64_t)sub_1000432B0;
  *(&v58 - 1) = v46;
  swift_retain();
  uint64_t v47 = sub_1000A2738((uint64_t)v23, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1000AB2D4);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v86 = v47;
  sub_100005E5C(&qword_1000FD708);
  sub_100005E5C(&qword_1000FD710);
  sub_10000953C(&qword_1000FD718, &qword_1000FD708);
  sub_10000953C(&qword_1000FD720, &qword_1000FD710);
  unint64_t v48 = v63;
  Publishers.MergeMany.init<A>(_:)();
  sub_10000953C(&qword_1000FD728, &qword_1000FD6E8);
  id v49 = v70;
  uint64_t v50 = v65;
  Publisher.collect()();
  (*(void (**)(char *, uint64_t))(v64 + 8))(v48, v50);
  sub_1000A9A98(v45, v44, (void (*)(void))type metadata accessor for SubscriptionCreateActivityOperation);
  unint64_t v51 = (*(unsigned __int8 *)(v66 + 80) + 120) & ~(unint64_t)*(unsigned __int8 *)(v66 + 80);
  uint64_t v52 = swift_allocObject();
  memcpy((void *)(v52 + 16), v43, 0x68uLL);
  sub_1000AB520(v44, v52 + v51, (void (*)(void))type metadata accessor for SubscriptionCreateActivityOperation);
  sub_1000AB4AC((uint64_t)v43);
  type metadata accessor for SubscriptionCreateActivityOperation.ActivityData(0);
  sub_10000953C(&qword_1000FD730, &qword_1000FD6F0);
  uint64_t v53 = v69;
  uint64_t v54 = v72;
  Publisher.map<A>(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v49, v54);
  sub_10000953C(&qword_1000FF7C8, &qword_1000FF7C0);
  uint64_t v55 = v71;
  uint64_t v56 = Publisher.eraseToAnyPublisher()();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v53, v55);
  return v56;
}

uint64_t sub_1000A8E24()
{
  uint64_t ActivityOperation = type metadata accessor for SubscriptionCreateActivityOperation(0);
  uint64_t v2 = *(void *)(ActivityOperation - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(ActivityOperation);
  uint64_t v16 = sub_100005E5C(&qword_1000FF7F0);
  uint64_t v18 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100005E5C(&qword_1000FF7F8);
  uint64_t v19 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v15 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10006EC30();
  uint64_t v20 = v7;
  sub_1000A9A98(v0, (uint64_t)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for SubscriptionCreateActivityOperation);
  unint64_t v8 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v9 = swift_allocObject();
  sub_1000AB520((uint64_t)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v9 + v8, (void (*)(void))type metadata accessor for SubscriptionCreateActivityOperation);
  static Subscribers.Demand.unlimited.getter();
  sub_100005E5C(&qword_1000FF800);
  sub_100005E5C(&qword_1000FF808);
  sub_100005E5C(&qword_1000FF810);
  sub_10000953C(&qword_1000FF818, &qword_1000FF800);
  sub_10000953C(&qword_1000FF820, &qword_1000FF810);
  Publisher.flatMap<A, B>(maxPublishers:_:)();
  swift_release();
  swift_release();
  type metadata accessor for SubscriptionCreateActivityOperation.ActivityData(0);
  sub_10000953C(&qword_1000FF828, &qword_1000FF7F0);
  uint64_t v11 = v15;
  uint64_t v10 = v16;
  Publisher.map<A>(_:)();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v5, v10);
  sub_10000953C(&qword_1000FF830, &qword_1000FF7F8);
  uint64_t v12 = v17;
  uint64_t v13 = Publisher.eraseToAnyPublisher()();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v12);
  return v13;
}

uint64_t sub_1000A9208()
{
  uint64_t v0 = type metadata accessor for SportingEventSubscription.Competitor();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v51 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v63 = (char *)v51 - v5;
  __chkstk_darwin(v6);
  unint64_t v8 = (char *)v51 - v7;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)v51 - v10;
  uint64_t v12 = sub_100005E5C(&qword_1000FD6B8);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v62 = (char *)v51 - v16;
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)v51 - v18;
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)v51 - v21;
  uint64_t v23 = *(void *)(SportingEventSubscription.Metadata.competitors.getter() + 16);
  swift_bridgeObjectRelease();
  if (v23 != 2) {
    return 0;
  }
  uint64_t result = SportingEventSubscription.Metadata.competitors.getter();
  if (!*(void *)(result + 16))
  {
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  uint64_t v57 = v14;
  uint64_t v58 = v3;
  unint64_t v60 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v61 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
  v61(v11, result + v60, v0);
  swift_bridgeObjectRelease();
  SportingEventSubscription.Competitor.logoFilePaths.getter();
  uint64_t v25 = *(void (**)(char *, uint64_t))(v1 + 8);
  v25(v11, v0);
  uint64_t v26 = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths();
  if (sub_1000082E8((uint64_t)v22, 1, v26) == 1)
  {
    uint64_t v27 = (uint64_t)v22;
LABEL_17:
    sub_1000437A4(v27, &qword_1000FD6B8);
    return 0;
  }
  uint64_t v59 = v25;
  uint64_t v54 = SportingEventSubscription.Competitor.LogoFilePaths.defaultSize.getter();
  uint64_t v56 = v28;
  uint64_t v29 = *(void *)(v26 - 8);
  uint64_t v30 = *(void (**)(char *, uint64_t))(v29 + 8);
  uint64_t v31 = v22;
  uint64_t v32 = v30;
  uint64_t v55 = v29 + 8;
  v30(v31, v26);
  uint64_t result = SportingEventSubscription.Metadata.competitors.getter();
  if (!*(void *)(result + 16)) {
    goto LABEL_30;
  }
  v61(v8, result + v60, v0);
  swift_bridgeObjectRelease();
  SportingEventSubscription.Competitor.logoFilePaths.getter();
  v59(v8, v0);
  if (sub_1000082E8((uint64_t)v19, 1, v26) == 1)
  {
    swift_bridgeObjectRelease();
    uint64_t v27 = (uint64_t)v19;
    goto LABEL_17;
  }
  uint64_t v33 = SportingEventSubscription.Competitor.LogoFilePaths.smallSize.getter();
  uint64_t v35 = v34;
  v32(v19, v26);
  if (!v35) {
    goto LABEL_12;
  }
  v51[1] = v33;
  uint64_t v52 = (void (*)(uint64_t, uint64_t))v32;
  uint64_t v53 = v35;
  uint64_t result = SportingEventSubscription.Metadata.competitors.getter();
  if (*(void *)(result + 16) < 2uLL) {
    goto LABEL_31;
  }
  uint64_t v36 = *(void *)(v1 + 72);
  unint64_t v37 = v63;
  v61(v63, result + v60 + v36, v0);
  swift_bridgeObjectRelease();
  uint64_t v38 = (uint64_t)v62;
  SportingEventSubscription.Competitor.logoFilePaths.getter();
  v59(v37, v0);
  if (sub_1000082E8(v38, 1, v26) == 1) {
    goto LABEL_16;
  }
  SportingEventSubscription.Competitor.LogoFilePaths.defaultSize.getter();
  v52(v38, v26);
  uint64_t result = SportingEventSubscription.Metadata.competitors.getter();
  if (*(void *)(result + 16) >= 2uLL)
  {
    unint64_t v39 = result + v60 + v36;
    uint64_t v40 = v58;
    v61(v58, v39, v0);
    swift_bridgeObjectRelease();
    uint64_t v38 = (uint64_t)v57;
    SportingEventSubscription.Competitor.logoFilePaths.getter();
    v59(v40, v0);
    if (sub_1000082E8(v38, 1, v26) == 1)
    {
      swift_bridgeObjectRelease();
LABEL_16:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v27 = v38;
      goto LABEL_17;
    }
    SportingEventSubscription.Competitor.LogoFilePaths.smallSize.getter();
    id v41 = v42;
    v52(v38, v26);
    if (!v41)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v41;
    }
    id v43 = [self defaultManager];
    NSString v44 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    unsigned __int8 v45 = [v43 fileExistsAtPath:v44];

    if (v45)
    {
      NSString v46 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      unsigned __int8 v47 = [v43 fileExistsAtPath:v46];

      if (v47)
      {
        NSString v48 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        unsigned __int8 v49 = [v43 fileExistsAtPath:v48];

        if (v49)
        {
          NSString v50 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease();
          id v41 = [v43 fileExistsAtPath:v50];

          return (uint64_t)v41;
        }
      }
      else
      {

        swift_bridgeObjectRelease();
      }
    }
    else
    {

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
LABEL_12:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_1000A98CC()
{
  uint64_t v1 = *(void *)(SportingEventSubscription.Metadata.competitors.getter() + 16);
  uint64_t result = swift_bridgeObjectRelease();
  if (v1 != 2) {
    return result;
  }
  id v3 = [self defaultManager];
  sub_100005E5C(&qword_1000FC8C8);
  uint64_t v13 = type metadata accessor for SportingEventSubscription.Competitor();
  uint64_t v4 = *(void *)(v13 - 8);
  uint64_t v5 = *(void *)(v4 + 72);
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1000CB470;
  uint64_t result = SportingEventSubscription.Metadata.competitors.getter();
  if (!*(void *)(result + 16))
  {
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v8 = v7 + v6;
  uint64_t v9 = *(void (**)(unint64_t, unint64_t, uint64_t))(v4 + 16);
  v9(v8, result + v6, v13);
  swift_bridgeObjectRelease();
  uint64_t result = SportingEventSubscription.Metadata.competitors.getter();
  if (*(void *)(result + 16) < 2uLL)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  v9(v8 + v5, result + v6 + v5, v13);
  swift_bridgeObjectRelease();
  char v10 = 0;
  uint64_t v11 = 0;
  do
  {
    char v12 = v10;
    sub_1000AAEA0(v8 + v11 * v5, v3);
    if (v0) {
      break;
    }
    char v10 = 1;
    uint64_t v11 = 1;
  }
  while ((v12 & 1) == 0);

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000A9A98(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_1000438A0();
  uint64_t v4 = sub_100043928();
  v5(v4);
  return a2;
}

uint64_t sub_1000A9AF0(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_1000438A0();
  sub_100009894();
  v3();
  return a1;
}

uint64_t sub_1000A9B48@<X0>(const void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v53 = a2;
  uint64_t v63 = a3;
  uint64_t v4 = type metadata accessor for TemplateImageUrl.ImageFormat();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v74 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005E5C((uint64_t *)&unk_1000FDA80);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v67 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100005E5C(&qword_1000FD6E8);
  uint64_t v55 = *(void *)(v13 - 8);
  uint64_t v56 = v13;
  __chkstk_darwin(v13);
  uint64_t v54 = (char *)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_100005E5C(&qword_1000FD6F0);
  uint64_t v60 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  uint64_t v58 = (char *)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_100005E5C(&qword_1000FF838);
  uint64_t v59 = *(void *)(v61 - 8);
  __chkstk_darwin(v61);
  uint64_t v57 = (char *)&v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = (uint64_t)memcpy(v80, a1, sizeof(v80));
  uint64_t v18 = v80[18];
  v81[0] = v80[18];
  uint64_t v19 = *(void *)(v80[18] + 16);
  if (v19)
  {
    unsigned int v71 = enum case for TemplateImageUrl.ImageFormat.png(_:);
    uint64_t v69 = (void (**)(char *, uint64_t))(v5 + 8);
    uint64_t v70 = (void (**)(char *, void, uint64_t))(v5 + 104);
    uint64_t v64 = (void (**)(char *, uint64_t))(v11 + 8);
    uint64_t v65 = (void (**)(char *, uint64_t, uint64_t))(v11 + 32);
    swift_bridgeObjectRetain_n();
    uint64_t v20 = (uint64_t *)(v18 + 88);
    uint64_t v75 = _swiftEmptyArrayStorage;
    uint64_t v21 = v4;
    uint64_t v66 = v4;
    uint64_t v72 = v10;
    char v73 = v9;
    do
    {
      uint64_t v22 = *v20;
      if ((unint64_t)*v20 >= 3)
      {
        uint64_t v23 = *(v20 - 6);
        uint64_t v76 = *(v20 - 7);
        uint64_t v24 = *(v20 - 1);
        uint64_t v25 = *(v20 - 4);
        swift_bridgeObjectRetain();
        uint64_t v78 = v23;
        swift_bridgeObjectRetain();
        uint64_t v77 = v25;
        swift_bridgeObjectRetain();
        sub_100047998(v24, v22);
        sub_100047998(v24, v22);
        if (qword_1000FBE30 != -1) {
          swift_once();
        }
        uint64_t v26 = v74;
        (*v70)(v74, v71, v21);
        uint64_t v27 = (uint64_t)v73;
        static TemplateImageUrl.imageUrl(templateUrl:width:height:format:)();
        sub_1000479A8(v24, v22);
        uint64_t v28 = v26;
        uint64_t v29 = v27;
        (*v69)(v28, v21);
        uint64_t v30 = v27;
        uint64_t v31 = v72;
        if (sub_1000082E8(v30, 1, v72) == 1)
        {
          sub_1000437A4(v29, (uint64_t *)&unk_1000FDA80);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_1000479A8(v24, v22);
        }
        else
        {
          uint64_t v32 = v67;
          (*v65)(v67, v29, v31);
          swift_bridgeObjectRetain();
          uint64_t v68 = URL.absoluteString.getter();
          uint64_t v34 = v33;
          (*v64)(v32, v31);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_1000479A8(v24, v22);
          uint64_t v35 = v75;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1000158A8();
            uint64_t v35 = v39;
          }
          unint64_t v36 = v35[2];
          if (v36 >= v35[3] >> 1)
          {
            sub_1000158A8();
            uint64_t v35 = v40;
          }
          _OWORD v35[2] = v36 + 1;
          uint64_t v75 = v35;
          unint64_t v37 = &v35[4 * v36];
          uint64_t v38 = v78;
          v37[4] = v76;
          v37[5] = v38;
          v37[6] = v68;
          v37[7] = v34;
          uint64_t v21 = v66;
        }
      }
      v20 += 9;
      --v19;
    }
    while (v19);
    sub_100068774((uint64_t)v81);
    uint64_t v17 = sub_100068774((uint64_t)v81);
    id v41 = v75;
  }
  else
  {
    id v41 = _swiftEmptyArrayStorage;
  }
  uint64_t v42 = *(void *)(v53 + 304);
  __chkstk_darwin(v17);
  *(&v53 - 2) = (uint64_t)sub_1000AE4AC;
  *(&v53 - 1) = v42;
  swift_retain();
  id v43 = sub_1000A2738((uint64_t)v41, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1000AE498);
  swift_bridgeObjectRelease();
  swift_release();
  unsigned int v79 = v43;
  sub_100005E5C(&qword_1000FD708);
  sub_100005E5C(&qword_1000FD710);
  sub_10000953C(&qword_1000FD718, &qword_1000FD708);
  sub_10000953C(&qword_1000FD720, &qword_1000FD710);
  NSString v44 = v54;
  Publishers.MergeMany.init<A>(_:)();
  sub_10000953C(&qword_1000FD728, &qword_1000FD6E8);
  unsigned __int8 v45 = v58;
  uint64_t v46 = v56;
  Publisher.collect()();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v44, v46);
  uint64_t v47 = swift_allocObject();
  memcpy((void *)(v47 + 16), v80, 0x108uLL);
  sub_1000782EC(v80);
  sub_100005E5C(&qword_1000FF808);
  sub_10000953C(&qword_1000FD730, &qword_1000FD6F0);
  NSString v48 = v57;
  uint64_t v49 = v62;
  Publisher.map<A>(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v60 + 8))(v45, v49);
  sub_10000953C(&qword_1000FF840, &qword_1000FF838);
  uint64_t v50 = v61;
  uint64_t v51 = Publisher.eraseToAnyPublisher()();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v59 + 8))(v48, v50);
  *uint64_t v63 = v51;
  return result;
}

uint64_t sub_1000AA3F0@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *a1;
  memcpy(a3, a2, 0x108uLL);
  a3[33] = v5;
  sub_1000782EC(a2);

  return swift_bridgeObjectRetain();
}

uint64_t sub_1000AA44C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for Sport();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)__dst - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  memcpy(__dst, a1, sizeof(__dst));
  sub_1000437F8((uint64_t)&__dst[14], (uint64_t)v16, &qword_1000FE128);
  sub_10002F674((uint64_t)v16);
  swift_bridgeObjectRetain();
  Sport.init(rawValue:)();
  uint64_t v10 = Sport.rawValue.getter();
  uint64_t v12 = v11;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t Activity = type metadata accessor for SubscriptionCreateActivityOperation.ActivityData(0);
  sub_100047228(a1, a2, a3 + *(int *)(Activity + 24));
  uint64_t result = sub_1000437F8((uint64_t)v16, a3, &qword_1000FE128);
  *(void *)(a3 + 16) = v10;
  *(void *)(a3 + 24) = v12;
  return result;
}

uint64_t sub_1000AA5C8@<X0>(uint64_t *__src@<X0>, uint64_t a2@<X8>)
{
  memcpy(__dst, __src, sizeof(__dst));
  return sub_1000AA44C(__dst, __src[33], a2);
}

uint64_t sub_1000AA61C@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v8 = type metadata accessor for SportingEventSubscription.Metadata();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for Date();
  uint64_t v43 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  id v41 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v36 - v15;
  __chkstk_darwin(v17);
  uint64_t v42 = (char *)&v36 - v18;
  uint64_t v19 = *a1;
  sub_1000437F8((uint64_t)(a2 + 6), (uint64_t)v45, &qword_1000FE130);
  sub_1000437F8((uint64_t)v45, (uint64_t)&v46, &qword_1000FE130);
  uint64_t v20 = v46;
  if (v46)
  {
    swift_bridgeObjectRetain();
    sub_1000686EC((uint64_t)v45);
    unint64_t v36 = sub_1000A2838(v20, v19);
    sub_100068774((uint64_t)v45);
  }
  else
  {
    unint64_t v36 = _swiftEmptyArrayStorage;
  }
  uint64_t v21 = v42;
  Date.init()();
  sub_1000437F8((uint64_t)a2, (uint64_t)v44, &qword_1000FD888);
  sub_1000437F8((uint64_t)v44, (uint64_t)&v47, &qword_1000FD888);
  if ((v48 & 1) == 0)
  {
    Date.init(timeIntervalSince1970:)();
    uint64_t v22 = v43;
    (*(void (**)(char *, uint64_t))(v43 + 8))(v21, v12);
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v21, v16, v12);
  }
  BOOL v23 = *(void *)(a3 + 472) == 1 || *(void *)(a3 + 488) == 1;
  unint64_t v39 = a4;
  uint64_t v40 = v8;
  uint64_t v38 = v9;
  if (!v23) {
    swift_bridgeObjectRetain();
  }
  (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v41, v21, v12);
  uint64_t v37 = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  SportingEventSubscription.Metadata.init(eventStartDate:competitors:preGameTitle:shortTitle:eventURL:localizedLeagueName:)();
  uint64_t v25 = a2[9];
  unint64_t v24 = a2[10];
  uint64_t v27 = a2[7];
  unint64_t v26 = a2[8];
  uint64_t v28 = *(void (**)(char *, uint64_t))(v43 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v28(v42, v37);
  if (v26) {
    uint64_t v29 = v27;
  }
  else {
    uint64_t v29 = 0;
  }
  if (v26) {
    unint64_t v30 = v26;
  }
  else {
    unint64_t v30 = 0xE000000000000000;
  }
  if (v24) {
    uint64_t v31 = v25;
  }
  else {
    uint64_t v31 = 0;
  }
  if (v24) {
    unint64_t v32 = v24;
  }
  else {
    unint64_t v32 = 0xE000000000000000;
  }
  uint64_t v33 = v39;
  *(void *)unint64_t v39 = v31;
  *((void *)v33 + 1) = v32;
  *((void *)v33 + 2) = v29;
  *((void *)v33 + 3) = v30;
  uint64_t Activity = type metadata accessor for SubscriptionCreateActivityOperation.ActivityData(0);
  return (*(uint64_t (**)(char *, char *, uint64_t))(v38 + 32))(&v33[*(int *)(Activity + 24)], v11, v40);
}

uint64_t sub_1000AAA14@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v44 = a3;
  uint64_t v37 = type metadata accessor for LogoDownloadResult();
  uint64_t v5 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v7 = (uint64_t *)((char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v8);
  uint64_t v38 = (uint64_t)&v36 - v9;
  uint64_t v10 = sub_100005E5C(&qword_1000FD6B8);
  __chkstk_darwin(v10 - 8);
  uint64_t v43 = (uint64_t)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v36 - v13;
  __chkstk_darwin(v15);
  uint64_t v45 = (uint64_t)&v36 - v16;
  uint64_t v17 = *a1;
  uint64_t v18 = a1[1];
  uint64_t v19 = a1[2];
  uint64_t v46 = a1[4];
  unint64_t v47 = a1[5];
  uint64_t v20 = a1[6];
  uint64_t v39 = v19;
  uint64_t v40 = v20;
  uint64_t v41 = a1[7];
  int v42 = *((unsigned __int8 *)a1 + 64);
  uint64_t v21 = *(void *)(a2 + 16);
  if (v21)
  {
    uint64_t v22 = a2 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    uint64_t v23 = *(void *)(v5 + 72);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_1000A9A98(v22, (uint64_t)v7, (void (*)(void))type metadata accessor for LogoDownloadResult);
      BOOL v24 = *v7 == v17 && v7[1] == v18;
      if (v24 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        break;
      }
      sub_1000A9AF0((uint64_t)v7, (void (*)(void))type metadata accessor for LogoDownloadResult);
      v22 += v23;
      if (!--v21)
      {
        swift_bridgeObjectRelease();
        goto LABEL_10;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v29 = v38;
    sub_1000AB520((uint64_t)v7, v38, (void (*)(void))type metadata accessor for LogoDownloadResult);
    uint64_t v30 = v29 + *(int *)(v37 + 24);
    uint64_t v31 = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths();
    uint64_t v26 = v45;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 16))(v45, v30, v31);
    sub_1000A9AF0(v29, (void (*)(void))type metadata accessor for LogoDownloadResult);
    uint64_t v27 = v26;
    uint64_t v28 = 0;
    uint64_t v25 = v31;
  }
  else
  {
LABEL_10:
    uint64_t v25 = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths();
    uint64_t v26 = v45;
    uint64_t v27 = v45;
    uint64_t v28 = 1;
  }
  sub_1000082C0(v27, v28, 1, v25);
  unint64_t v32 = v47;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v32 >= 2)
  {
    sub_10002A5A8(v46, v32);
  }
  else
  {
    sub_1000479B8(v46, v32);
    uint64_t v46 = 0;
    unint64_t v47 = 0xE000000000000000;
  }
  sub_100043750(v26, (uint64_t)v14, &qword_1000FD6B8);
  uint64_t v33 = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths();
  if (sub_1000082E8((uint64_t)v14, 1, v33) == 1)
  {
    sub_1000437A4((uint64_t)v14, &qword_1000FD6B8);
  }
  else
  {
    SportingEventSubscription.Competitor.LogoFilePaths.defaultSize.getter();
    (*(void (**)(char *, uint64_t))(*(void *)(v33 - 8) + 8))(v14, v33);
  }
  uint64_t v34 = v45;
  sub_100043750(v45, v43, &qword_1000FD6B8);
  swift_bridgeObjectRetain();
  SportingEventSubscription.Competitor.init(canonicalId:abbreviation:name:teamLogoUrl:localLogoUrl:logoFilePaths:teamColorHex:isHome:ordinal:)();
  return sub_1000437A4(v34, &qword_1000FD6B8);
}

id sub_1000AAEA0(uint64_t a1, void *a2)
{
  id v36 = a2;
  uint64_t v3 = sub_100005E5C(&qword_1000FD6B8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v32 - v7;
  sub_100005E5C(&qword_1000FF7D0);
  uint64_t v9 = *(void *)(sub_100005E5C(&qword_1000FF7D8) - 8);
  unint64_t v10 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1000CABA0;
  *(void *)(v11 + v10) = NSFileModificationDate;
  uint64_t v12 = NSFileModificationDate;
  Date.init()();
  type metadata accessor for FileAttributeKey(0);
  uint64_t v14 = v13;
  type metadata accessor for Date();
  unint64_t v15 = sub_1000AB578();
  uint64_t v16 = Dictionary.init(dictionaryLiteral:)();
  uint64_t v34 = a1;
  SportingEventSubscription.Competitor.logoFilePaths.getter();
  uint64_t v17 = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths();
  int v18 = sub_1000082E8((uint64_t)v8, 1, v17);
  unint64_t v32 = v15;
  uint64_t v33 = v14;
  uint64_t v35 = v16;
  if (v18 == 1)
  {
    sub_1000437A4((uint64_t)v8, &qword_1000FD6B8);
    id v19 = v36;
  }
  else
  {
    SportingEventSubscription.Competitor.LogoFilePaths.defaultSize.getter();
    (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8))(v8, v17);
    sub_1000A37B4(v16);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    NSString v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v38 = 0;
    id v19 = v36;
    unsigned int v22 = [v36 setAttributes:isa ofItemAtPath:v21 error:&v38];

    id v23 = v38;
    if (!v22)
    {
      uint64_t v30 = v23;
      swift_bridgeObjectRelease();
LABEL_10:
      uint64_t v31 = _convertNSErrorToError(_:)();

      uint64_t v37 = v31;
      return (id)swift_willThrow();
    }
  }
  SportingEventSubscription.Competitor.logoFilePaths.getter();
  if (sub_1000082E8((uint64_t)v5, 1, v17) == 1)
  {
    swift_bridgeObjectRelease();
    return (id)sub_1000437A4((uint64_t)v5, &qword_1000FD6B8);
  }
  SportingEventSubscription.Competitor.LogoFilePaths.smallSize.getter();
  uint64_t v26 = v25;
  (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8))(v5, v17);
  if (v26)
  {
    sub_1000A37B4(v35);
    swift_bridgeObjectRelease();
    Class v27 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    NSString v28 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v38 = 0;
    unsigned __int8 v29 = [v19 setAttributes:v27 ofItemAtPath:v28 error:&v38];

    id result = v38;
    if (v29) {
      return result;
    }
    uint64_t v30 = result;
    goto LABEL_10;
  }
  return (id)swift_bridgeObjectRelease();
}

uint64_t sub_1000AB2D4()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1000AB2FC()
{
  sub_1000AE780();
  sub_1000AE4B4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000AE5B4();
  swift_release();
  sub_1000AE578();
  sub_1000AE53C();
  sub_1000AE5E4();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_1000AE704();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    sub_1000AE6F8();
    if (!v0) {
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v1 = sub_1000AE604();
  if (!sub_100043950(v1))
  {
    sub_1000438A0();
    uint64_t v2 = sub_1000AE620();
    v3(v2);
  }
  sub_1000438BC();
  sub_1000438BC();
  sub_1000438BC();
  sub_1000AE6E0();
  sub_1000AE7E0();
  return _swift_deallocObject(v4, v5, v6);
}

uint64_t sub_1000AB450@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  sub_1000AE4E8();
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 120) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_1000AA61C(a1, (void *)(v2 + 16), v6, a2);
}

uint64_t sub_1000AB4AC(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000AB520(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_1000438A0();
  uint64_t v4 = sub_10004393C();
  v5(v4);
  return a2;
}

unint64_t sub_1000AB578()
{
  unint64_t result = qword_1000FBF68;
  if (!qword_1000FBF68)
  {
    type metadata accessor for FileAttributeKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000FBF68);
  }
  return result;
}

uint64_t sub_1000AB5CC()
{
  sub_1000AE780();
  sub_1000AE4B4();
  sub_1000AE5B4();
  swift_release();
  sub_1000AE578();
  sub_1000AE53C();
  sub_1000AE5E4();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_1000AE704();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    sub_1000AE6F8();
    if (!v0) {
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v1 = sub_1000AE604();
  if (!sub_100043950(v1))
  {
    sub_1000438A0();
    uint64_t v2 = sub_1000AE620();
    v3(v2);
  }
  sub_1000438BC();
  sub_1000438BC();
  sub_1000438BC();
  sub_1000AE6E0();
  sub_1000AE7E0();
  return _swift_deallocObject(v4, v5, v6);
}

uint64_t sub_1000AB6F0()
{
  sub_1000AE4E8();
  char v0 = (const void *)sub_1000438D4();

  return sub_1000A9B48(v0, v1, v2);
}

uint64_t sub_1000AB738()
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
  if (*(void *)(v0 + 200) != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (*(void *)(v0 + 272) != 1) {
    swift_bridgeObjectRelease();
  }

  return _swift_deallocObject(v0, 280, 7);
}

uint64_t sub_1000AB7F0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_1000AA3F0(a1, (void *)(v2 + 16), a2);
}

uint64_t sub_1000AB7FC(uint64_t a1)
{
  return sub_1000ABB58(a1, (uint64_t (*)(uint64_t))sub_1000A51DC);
}

uint64_t sub_1000AB814()
{
  sub_1000AE4B4();
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v16 = *(void *)(v5 + 64);
  uint64_t v6 = type metadata accessor for Date();
  sub_10000C568();
  uint64_t v8 = v7;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = v1 + v4;
  sub_100006178(v1 + v4);
  swift_release();
  swift_release();
  sub_100006178(v1 + v4 + 56);
  sub_100006178(v1 + v4 + 96);
  sub_100006178(v1 + v4 + 136);
  swift_release();
  sub_100006178(v1 + v4 + 184);
  sub_100006178(v1 + v4 + 224);
  sub_100006178(v1 + v4 + 264);
  swift_release();
  sub_100006178(v1 + v4 + 312);
  if (*(void *)(v1 + v4 + 384) != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (*(void *)(v12 + 472) != 1)
  {
    swift_bridgeObjectRelease();
    if (*(void *)(v12 + 488) != 1) {
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v13 = v12 + *(int *)(v0 + 48);
  if (!sub_1000082E8(v13, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v13, v6);
  }
  uint64_t v14 = (v4 + v16 + v9) & ~v9;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1 + v14, v6);

  return _swift_deallocObject(v1, v14 + v11, v3 | v9 | 7);
}

uint64_t sub_1000ABA34()
{
  sub_1000AE510();
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = *(void *)(v3 + 64);
  uint64_t v5 = *(void *)(type metadata accessor for Date() - 8);
  return sub_1000A5604(v0 + ((v2 + v4 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80)));
}

uint64_t sub_1000ABACC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000ABB0C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

uint64_t sub_1000ABB40(uint64_t a1)
{
  return sub_1000ABB58(a1, (uint64_t (*)(uint64_t))sub_1000A6784);
}

uint64_t sub_1000ABB58(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  sub_1000AE4E8();
  uint64_t v2 = sub_1000438D4();

  return a2(v2);
}

void sub_1000ABBB8()
{
}

uint64_t sub_1000ABBF0@<X0>(uint64_t *a1@<X8>)
{
  sub_1000AE4E8();
  uint64_t result = sub_1000A6960();
  *a1 = result;
  return result;
}

uint64_t sub_1000ABC30()
{
  sub_1000AE4E8();
  uint64_t v0 = (uint64_t *)sub_1000438D4();

  return sub_1000A6ADC(v0, v1, v2);
}

uint64_t sub_1000ABC78()
{
  sub_1000AE780();
  sub_1000AE4B4();
  sub_1000AE5B4();
  swift_release();
  sub_1000AE578();
  sub_1000AE53C();
  sub_1000AE5E4();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_1000AE704();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    sub_1000AE6F8();
    if (!v0) {
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v1 = sub_1000AE604();
  if (!sub_100043950(v1))
  {
    sub_1000438A0();
    uint64_t v2 = sub_1000AE620();
    v3(v2);
  }
  sub_1000438BC();
  sub_1000438BC();
  sub_1000438BC();
  sub_1000AE6E0();
  swift_bridgeObjectRelease();
  sub_1000AE6D0();
  sub_1000AE7E0();
  return _swift_deallocObject(v4, v5, v6);
}

uint64_t sub_1000ABDAC(uint64_t a1, uint64_t a2)
{
  sub_1000AE510();
  sub_1000AE7CC();
  uint64_t v7 = *(void *)(v2 + v6);
  uint64_t v8 = *(void *)(v2 + v6 + 8);

  return sub_1000A6C54(a1, a2, v5, v7, v8);
}

uint64_t sub_1000ABE24()
{
  sub_1000AE780();
  sub_1000AE4B4();
  swift_unknownObjectRelease();
  sub_1000AE5B4();
  swift_release();
  sub_1000AE578();
  sub_1000AE53C();
  sub_1000AE5E4();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_1000AE704();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    sub_1000AE6F8();
    if (!v0) {
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v1 = sub_1000AE604();
  if (!sub_100043950(v1))
  {
    sub_1000438A0();
    uint64_t v2 = sub_1000AE620();
    v3(v2);
  }
  sub_1000AE814();
  sub_1000438BC();
  sub_1000438BC();
  sub_1000438BC();
  sub_1000AE6E0();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1000AE6D0();
  sub_1000AE7E0();
  return _swift_deallocObject(v4, v5, v6);
}

uint64_t sub_1000ABF68()
{
  sub_1000AE510();
  sub_1000AE658();
  uint64_t v3 = *(void *)(v0 + v2 + 8);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_10009F1D8;
  uint64_t v5 = sub_1000AE680();
  return sub_1000A6E68(v5, v6, v7, v8, v9, v10, v11, v3);
}

uint64_t sub_1000AC04C()
{
  swift_release();
  swift_errorRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000AC08C()
{
  return (*(uint64_t (**)(void, uint64_t))(v0 + 16))(*(void *)(v0 + 32), 1);
}

uint64_t sub_1000AC0C0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0xFFFFFFFFFFFFFFFELL) != 0xA) {
    return sub_100068640(a1, a2);
  }
  return a1;
}

uint64_t sub_1000AC0D4()
{
  swift_release();
  if (*(void *)(v0 + 40) >= 0xAuLL) {
    swift_bridgeObjectRelease();
  }

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000AC11C(uint64_t a1)
{
  return sub_1000A7E8C(a1, *(void (**)(uint64_t, uint64_t))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_1000AC128(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0xFFFFFFFFFFFFFFFELL) != 0xA) {
    return sub_1000AC13C(a1, a2);
  }
  return a1;
}

uint64_t sub_1000AC13C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xA) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1000AC150()
{
  sub_1000AE780();
  sub_1000AE4B4();
  sub_1000AE5B4();
  swift_release();
  sub_1000AE578();
  sub_1000AE53C();
  sub_1000AE5E4();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_1000AE704();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    sub_1000AE6F8();
    if (!v0) {
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v1 = sub_1000AE604();
  if (!sub_100043950(v1))
  {
    sub_1000438A0();
    uint64_t v2 = sub_1000AE620();
    v3(v2);
  }
  sub_1000438BC();
  sub_1000438BC();
  sub_1000438BC();
  sub_1000AE6E0();
  sub_1000AE6D0();
  sub_1000AE7E0();
  return _swift_deallocObject(v4, v5, v6);
}

uint64_t sub_1000AC278(uint64_t a1, uint64_t a2)
{
  sub_1000AE510();
  sub_1000AE7CC();
  uint64_t v7 = *(void *)(v2 + v6);

  return sub_1000A7F20(a1, a2, v5, v7);
}

uint64_t sub_1000AC2EC()
{
  sub_1000AE780();
  sub_1000AE4B4();
  swift_unknownObjectRelease();
  sub_1000AE5B4();
  swift_release();
  sub_1000AE578();
  sub_1000AE53C();
  sub_1000AE5E4();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_1000AE704();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    sub_1000AE6F8();
    if (!v0) {
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v1 = sub_1000AE604();
  if (!sub_100043950(v1))
  {
    sub_1000438A0();
    uint64_t v2 = sub_1000AE620();
    v3(v2);
  }
  sub_1000AE814();
  sub_1000438BC();
  sub_1000438BC();
  sub_1000438BC();
  sub_1000AE6E0();
  swift_release();
  sub_1000AE6D0();
  sub_1000AE7E0();
  return _swift_deallocObject(v4, v5, v6);
}

uint64_t sub_1000AC424()
{
  sub_1000AE510();
  sub_1000AE658();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_10009F6B4;
  uint64_t v2 = sub_1000AE680();
  return sub_1000A8124(v2, v3, v4, v5, v6, v7, v8);
}

uint64_t *sub_1000AC500(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    uint64_t *v3 = *a2;
    uint64_t v3 = (uint64_t *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = *(int *)(a3 + 24);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = type metadata accessor for SportingEventSubscription.Metadata();
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t sub_1000AC5F8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for SportingEventSubscription.Metadata();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_1000AC678(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for SportingEventSubscription.Metadata();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  return a1;
}

void *sub_1000AC720(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for SportingEventSubscription.Metadata();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_1000AC7DC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for SportingEventSubscription.Metadata();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

void *sub_1000AC858(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for SportingEventSubscription.Metadata();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_1000AC8F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000AC908);
}

uint64_t sub_1000AC908(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = type metadata accessor for SportingEventSubscription.Metadata();
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return sub_1000082E8(v10, a2, v9);
  }
}

uint64_t sub_1000AC99C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000AC9B0);
}

uint64_t sub_1000AC9B0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 8) = a2;
  }
  else
  {
    uint64_t v7 = type metadata accessor for SportingEventSubscription.Metadata();
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return sub_1000082C0(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_1000ACA30()
{
  uint64_t result = type metadata accessor for SportingEventSubscription.Metadata();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1000ACAC8(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v24 = *a2;
    *(void *)a1 = *a2;
    uint64_t v4 = v24 + ((v5 + 16) & ~(unint64_t)v5);
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    uint64_t v8 = a2[6];
    *(void *)(v4 + 40) = a2[5];
    *(void *)(v4 + 48) = v8;
    long long v9 = *((_OWORD *)a2 + 5);
    *(_OWORD *)(v4 + 80) = v9;
    uint64_t v10 = v9;
    uint64_t v11 = **(void (***)(uint64_t, uint64_t, uint64_t))(v9 - 8);
    swift_retain();
    swift_retain();
    v11(v4 + 56, (uint64_t)(a2 + 7), v10);
    long long v12 = *(_OWORD *)(a2 + 15);
    *(_OWORD *)(v4 + 120) = v12;
    (**(void (***)(uint64_t, uint64_t))(v12 - 8))(v4 + 96, (uint64_t)(a2 + 12));
    long long v13 = *((_OWORD *)a2 + 10);
    *(_OWORD *)(v4 + 160) = v13;
    (**(void (***)(uint64_t, uint64_t))(v13 - 8))(v4 + 136, (uint64_t)(a2 + 17));
    *(void *)(v4 + 176) = a2[22];
    long long v14 = *((_OWORD *)a2 + 13);
    *(_OWORD *)(v4 + 208) = v14;
    uint64_t v15 = v14;
    uint64_t v16 = **(void (***)(uint64_t, uint64_t, uint64_t))(v14 - 8);
    swift_retain();
    v16(v4 + 184, (uint64_t)(a2 + 23), v15);
    long long v17 = *(_OWORD *)(a2 + 31);
    *(_OWORD *)(v4 + 248) = v17;
    (**(void (***)(uint64_t, uint64_t))(v17 - 8))(v4 + 224, (uint64_t)(a2 + 28));
    long long v18 = *((_OWORD *)a2 + 18);
    *(_OWORD *)(v4 + 288) = v18;
    (**(void (***)(uint64_t, uint64_t))(v18 - 8))(v4 + 264, (uint64_t)(a2 + 33));
    *(void *)(v4 + 304) = a2[38];
    long long v19 = *((_OWORD *)a2 + 21);
    *(_OWORD *)(v4 + 336) = v19;
    uint64_t v20 = v19;
    NSString v21 = **(void (***)(uint64_t, uint64_t, uint64_t))(v19 - 8);
    swift_retain();
    v21(v4 + 312, (uint64_t)(a2 + 39), v20);
    *(unsigned char *)(v4 + 352) = *((unsigned char *)a2 + 352);
    unsigned int v22 = a2 + 45;
    uint64_t v23 = a2[48];
    if (v23 == 1)
    {
      memcpy((void *)(v4 + 360), v22, 0x68uLL);
    }
    else
    {
      *(void *)(v4 + 360) = *v22;
      *(unsigned char *)(v4 + 368) = *((unsigned char *)a2 + 368);
      *(void *)(v4 + 376) = a2[47];
      *(void *)(v4 + 384) = v23;
      uint64_t v25 = a2[50];
      *(void *)(v4 + 392) = a2[49];
      *(void *)(v4 + 400) = v25;
      uint64_t v26 = a2[52];
      *(void *)(v4 + 408) = a2[51];
      *(void *)(v4 + 416) = v26;
      uint64_t v27 = a2[54];
      *(void *)(v4 + 424) = a2[53];
      *(void *)(v4 + 432) = v27;
      uint64_t v28 = a2[56];
      *(void *)(v4 + 440) = a2[55];
      *(void *)(v4 + 448) = v28;
      *(void *)(v4 + 456) = a2[57];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    uint64_t v29 = a2[59];
    if (v29 == 1)
    {
      long long v30 = *((_OWORD *)a2 + 30);
      *(_OWORD *)(v4 + 464) = *((_OWORD *)a2 + 29);
      *(_OWORD *)(v4 + 480) = v30;
    }
    else
    {
      *(void *)(v4 + 464) = a2[58];
      *(void *)(v4 + 472) = v29;
      uint64_t v31 = a2 + 60;
      uint64_t v32 = a2[61];
      swift_bridgeObjectRetain();
      if (v32 == 1)
      {
        *(_OWORD *)(v4 + 480) = *v31;
      }
      else
      {
        *(void *)(v4 + 480) = *(void *)v31;
        *(void *)(v4 + 488) = v32;
        swift_bridgeObjectRetain();
      }
    }
    *(unsigned char *)(v4 + 496) = *((unsigned char *)a2 + 496);
    uint64_t v33 = a3[12];
    uint64_t v34 = (void *)(v4 + v33);
    uint64_t v35 = (char *)a2 + v33;
    uint64_t v36 = type metadata accessor for Date();
    if (sub_1000082E8((uint64_t)v35, 1, v36))
    {
      uint64_t v37 = sub_100005E5C(&qword_1000FC938);
      memcpy(v34, v35, *(void *)(*(void *)(v37 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v36 - 8) + 16))(v34, v35, v36);
      sub_1000082C0((uint64_t)v34, 0, 1, v36);
    }
    uint64_t v38 = a3[13];
    uint64_t v39 = a3[14];
    uint64_t v40 = (void *)(v4 + v38);
    uint64_t v41 = (uint64_t *)((char *)a2 + v38);
    uint64_t v42 = v41[1];
    *uint64_t v40 = *v41;
    v40[1] = v42;
    uint64_t v43 = (void *)(v4 + v39);
    uint64_t v44 = (uint64_t *)((char *)a2 + v39);
    uint64_t v45 = v44[1];
    *uint64_t v43 = *v44;
    v43[1] = v45;
    uint64_t v46 = a3[15];
    uint64_t v47 = a3[16];
    char v48 = (void *)(v4 + v46);
    uint64_t v49 = (uint64_t *)((char *)a2 + v46);
    uint64_t v50 = v49[1];
    *char v48 = *v49;
    v48[1] = v50;
    *(unsigned char *)(v4 + v47) = *((unsigned char *)a2 + v47);
    *(void *)(v4 + a3[17]) = *(uint64_t *)((char *)a2 + a3[17]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_1000AD024(void *a1, uint64_t a2)
{
  sub_100006178((uint64_t)a1);
  swift_release();
  swift_release();
  sub_100006178((uint64_t)(a1 + 7));
  sub_100006178((uint64_t)(a1 + 12));
  sub_100006178((uint64_t)(a1 + 17));
  swift_release();
  sub_100006178((uint64_t)(a1 + 23));
  sub_100006178((uint64_t)(a1 + 28));
  sub_100006178((uint64_t)(a1 + 33));
  swift_release();
  sub_100006178((uint64_t)(a1 + 39));
  if (a1[48] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (a1[59] != 1)
  {
    swift_bridgeObjectRelease();
    if (a1[61] != 1) {
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v4 = (uint64_t)a1 + *(int *)(a2 + 48);
  uint64_t v5 = type metadata accessor for Date();
  if (!sub_1000082E8(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_1000AD1A4(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  long long v8 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v8;
  uint64_t v9 = v8;
  uint64_t v10 = **(void (***)(uint64_t, uint64_t, uint64_t))(v8 - 8);
  swift_retain();
  swift_retain();
  v10(a1 + 56, a2 + 56, v9);
  long long v11 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 120) = v11;
  (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 96, a2 + 96);
  long long v12 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 160) = v12;
  (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 136, a2 + 136);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  long long v13 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 208) = v13;
  uint64_t v14 = v13;
  uint64_t v15 = **(void (***)(uint64_t, uint64_t, uint64_t))(v13 - 8);
  swift_retain();
  v15(a1 + 184, a2 + 184, v14);
  long long v16 = *(_OWORD *)(a2 + 248);
  *(_OWORD *)(a1 + 248) = v16;
  (**(void (***)(uint64_t, uint64_t))(v16 - 8))(a1 + 224, a2 + 224);
  long long v17 = *(_OWORD *)(a2 + 288);
  *(_OWORD *)(a1 + 288) = v17;
  (**(void (***)(uint64_t, uint64_t))(v17 - 8))(a1 + 264, a2 + 264);
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  long long v18 = *(_OWORD *)(a2 + 336);
  *(_OWORD *)(a1 + 336) = v18;
  uint64_t v19 = v18;
  uint64_t v20 = **(void (***)(uint64_t, uint64_t, uint64_t))(v18 - 8);
  swift_retain();
  v20(a1 + 312, a2 + 312, v19);
  *(unsigned char *)(a1 + 352) = *(unsigned char *)(a2 + 352);
  NSString v21 = (void *)(a2 + 360);
  uint64_t v22 = *(void *)(a2 + 384);
  if (v22 == 1)
  {
    memcpy((void *)(a1 + 360), v21, 0x68uLL);
  }
  else
  {
    *(void *)(a1 + 360) = *v21;
    *(unsigned char *)(a1 + 368) = *(unsigned char *)(a2 + 368);
    *(void *)(a1 + 376) = *(void *)(a2 + 376);
    *(void *)(a1 + 384) = v22;
    uint64_t v23 = *(void *)(a2 + 400);
    *(void *)(a1 + 392) = *(void *)(a2 + 392);
    *(void *)(a1 + 400) = v23;
    uint64_t v24 = *(void *)(a2 + 416);
    *(void *)(a1 + 408) = *(void *)(a2 + 408);
    *(void *)(a1 + 416) = v24;
    uint64_t v25 = *(void *)(a2 + 432);
    *(void *)(a1 + 424) = *(void *)(a2 + 424);
    *(void *)(a1 + 432) = v25;
    uint64_t v26 = *(void *)(a2 + 448);
    *(void *)(a1 + 440) = *(void *)(a2 + 440);
    *(void *)(a1 + 448) = v26;
    *(void *)(a1 + 456) = *(void *)(a2 + 456);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  uint64_t v27 = *(void *)(a2 + 472);
  if (v27 == 1)
  {
    long long v28 = *(_OWORD *)(a2 + 480);
    *(_OWORD *)(a1 + 464) = *(_OWORD *)(a2 + 464);
    *(_OWORD *)(a1 + 480) = v28;
  }
  else
  {
    *(void *)(a1 + 464) = *(void *)(a2 + 464);
    *(void *)(a1 + 472) = v27;
    uint64_t v29 = (_OWORD *)(a2 + 480);
    uint64_t v30 = *(void *)(a2 + 488);
    swift_bridgeObjectRetain();
    if (v30 == 1)
    {
      *(_OWORD *)(a1 + 480) = *v29;
    }
    else
    {
      *(void *)(a1 + 480) = *(void *)v29;
      *(void *)(a1 + 488) = v30;
      swift_bridgeObjectRetain();
    }
  }
  *(unsigned char *)(a1 + 496) = *(unsigned char *)(a2 + 496);
  uint64_t v31 = a3[12];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = (const void *)(a2 + v31);
  uint64_t v34 = type metadata accessor for Date();
  if (sub_1000082E8((uint64_t)v33, 1, v34))
  {
    uint64_t v35 = sub_100005E5C(&qword_1000FC938);
    memcpy(v32, v33, *(void *)(*(void *)(v35 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v34 - 8) + 16))(v32, v33, v34);
    sub_1000082C0((uint64_t)v32, 0, 1, v34);
  }
  uint64_t v36 = a3[13];
  uint64_t v37 = a3[14];
  uint64_t v38 = (void *)(a1 + v36);
  uint64_t v39 = (void *)(a2 + v36);
  uint64_t v40 = v39[1];
  *uint64_t v38 = *v39;
  v38[1] = v40;
  uint64_t v41 = (void *)(a1 + v37);
  uint64_t v42 = (void *)(a2 + v37);
  uint64_t v43 = v42[1];
  *uint64_t v41 = *v42;
  v41[1] = v43;
  uint64_t v44 = a3[15];
  uint64_t v45 = a3[16];
  uint64_t v46 = (void *)(a1 + v44);
  uint64_t v47 = (void *)(a2 + v44);
  uint64_t v48 = v47[1];
  *uint64_t v46 = *v47;
  v46[1] = v48;
  *(unsigned char *)(a1 + v45) = *(unsigned char *)(a2 + v45);
  *(void *)(a1 + a3[17]) = *(void *)(a2 + a3[17]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_1000AD6AC(uint64_t a1, uint64_t a2, int *a3)
{
  sub_100008E94((uint64_t *)a1, (uint64_t *)a2);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  sub_100008E94((uint64_t *)(a1 + 56), (uint64_t *)(a2 + 56));
  sub_100008E94((uint64_t *)(a1 + 96), (uint64_t *)(a2 + 96));
  sub_100008E94((uint64_t *)(a1 + 136), (uint64_t *)(a2 + 136));
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_retain();
  swift_release();
  sub_100008E94((uint64_t *)(a1 + 184), (uint64_t *)(a2 + 184));
  sub_100008E94((uint64_t *)(a1 + 224), (uint64_t *)(a2 + 224));
  sub_100008E94((uint64_t *)(a1 + 264), (uint64_t *)(a2 + 264));
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  swift_retain();
  swift_release();
  sub_100008E94((uint64_t *)(a1 + 312), (uint64_t *)(a2 + 312));
  *(unsigned char *)(a1 + 352) = *(unsigned char *)(a2 + 352);
  long long v6 = (void *)(a1 + 360);
  uint64_t v7 = (uint64_t *)(a2 + 360);
  uint64_t v8 = *(void *)(a2 + 384);
  if (*(void *)(a1 + 384) == 1)
  {
    if (v8 != 1)
    {
      uint64_t v9 = *v7;
      *(unsigned char *)(a1 + 368) = *(unsigned char *)(a2 + 368);
      *long long v6 = v9;
      *(void *)(a1 + 376) = *(void *)(a2 + 376);
      *(void *)(a1 + 384) = *(void *)(a2 + 384);
      *(void *)(a1 + 392) = *(void *)(a2 + 392);
      *(void *)(a1 + 400) = *(void *)(a2 + 400);
      *(void *)(a1 + 408) = *(void *)(a2 + 408);
      *(void *)(a1 + 416) = *(void *)(a2 + 416);
      *(void *)(a1 + 424) = *(void *)(a2 + 424);
      *(void *)(a1 + 432) = *(void *)(a2 + 432);
      *(void *)(a1 + 440) = *(void *)(a2 + 440);
      *(void *)(a1 + 448) = *(void *)(a2 + 448);
      *(void *)(a1 + 456) = *(void *)(a2 + 456);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v8 == 1)
  {
    sub_1000ADC34(a1 + 360);
LABEL_6:
    memcpy((void *)(a1 + 360), (const void *)(a2 + 360), 0x68uLL);
    goto LABEL_8;
  }
  uint64_t v10 = *v7;
  *(unsigned char *)(a1 + 368) = *(unsigned char *)(a2 + 368);
  *long long v6 = v10;
  *(void *)(a1 + 376) = *(void *)(a2 + 376);
  *(void *)(a1 + 384) = *(void *)(a2 + 384);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 392) = *(void *)(a2 + 392);
  *(void *)(a1 + 400) = *(void *)(a2 + 400);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 408) = *(void *)(a2 + 408);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 416) = *(void *)(a2 + 416);
  *(void *)(a1 + 424) = *(void *)(a2 + 424);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 432) = *(void *)(a2 + 432);
  *(void *)(a1 + 440) = *(void *)(a2 + 440);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 448) = *(void *)(a2 + 448);
  *(void *)(a1 + 456) = *(void *)(a2 + 456);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_8:
  long long v11 = (long long *)(a1 + 464);
  long long v12 = (long long *)(a2 + 464);
  uint64_t v13 = *(void *)(a2 + 472);
  if (*(void *)(a1 + 472) == 1)
  {
    if (v13 == 1)
    {
      long long v14 = *v12;
      *(_OWORD *)(a1 + 480) = *(_OWORD *)(a2 + 480);
LABEL_21:
      *long long v11 = v14;
      goto LABEL_22;
    }
    *(void *)(a1 + 464) = *(void *)(a2 + 464);
    *(void *)(a1 + 472) = *(void *)(a2 + 472);
    uint64_t v16 = *(void *)(a2 + 488);
    swift_bridgeObjectRetain();
    if (v16 == 1)
    {
      *(_OWORD *)(a1 + 480) = *(_OWORD *)(a2 + 480);
      goto LABEL_22;
    }
LABEL_17:
    *(void *)(a1 + 480) = *(void *)(a2 + 480);
    *(void *)(a1 + 488) = *(void *)(a2 + 488);
    swift_bridgeObjectRetain();
    goto LABEL_22;
  }
  if (v13 == 1)
  {
    sub_1000ADC88(a1 + 464);
    long long v15 = *(_OWORD *)(a2 + 480);
    *long long v11 = *v12;
    *(_OWORD *)(a1 + 480) = v15;
    goto LABEL_22;
  }
  *(void *)(a1 + 464) = *(void *)(a2 + 464);
  *(void *)(a1 + 472) = *(void *)(a2 + 472);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v11 = (long long *)(a1 + 480);
  uint64_t v17 = *(void *)(a2 + 488);
  if (*(void *)(a1 + 488) == 1)
  {
    if (v17 != 1) {
      goto LABEL_17;
    }
LABEL_20:
    long long v14 = *(_OWORD *)(a2 + 480);
    goto LABEL_21;
  }
  if (v17 == 1)
  {
    sub_10002F5FC(a1 + 480);
    goto LABEL_20;
  }
  *(void *)(a1 + 480) = *(void *)(a2 + 480);
  *(void *)(a1 + 488) = *(void *)(a2 + 488);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_22:
  *(unsigned char *)(a1 + 496) = *(unsigned char *)(a2 + 496);
  uint64_t v18 = a3[12];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (const void *)(a2 + v18);
  uint64_t v21 = type metadata accessor for Date();
  int v22 = sub_1000082E8((uint64_t)v19, 1, v21);
  int v23 = sub_1000082E8((uint64_t)v20, 1, v21);
  if (!v22)
  {
    uint64_t v24 = *(void *)(v21 - 8);
    if (!v23)
    {
      (*(void (**)(void *, const void *, uint64_t))(v24 + 24))(v19, v20, v21);
      goto LABEL_28;
    }
    (*(void (**)(void *, uint64_t))(v24 + 8))(v19, v21);
    goto LABEL_27;
  }
  if (v23)
  {
LABEL_27:
    uint64_t v25 = sub_100005E5C(&qword_1000FC938);
    memcpy(v19, v20, *(void *)(*(void *)(v25 - 8) + 64));
    goto LABEL_28;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
  sub_1000082C0((uint64_t)v19, 0, 1, v21);
LABEL_28:
  uint64_t v26 = a3[13];
  uint64_t v27 = (void *)(a1 + v26);
  long long v28 = (void *)(a2 + v26);
  *uint64_t v27 = *v28;
  v27[1] = v28[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v29 = a3[14];
  uint64_t v30 = (void *)(a1 + v29);
  uint64_t v31 = (void *)(a2 + v29);
  *uint64_t v30 = *v31;
  v30[1] = v31[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v32 = a3[15];
  uint64_t v33 = (void *)(a1 + v32);
  uint64_t v34 = (void *)(a2 + v32);
  *uint64_t v33 = *v34;
  v33[1] = v34[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[16]) = *(unsigned char *)(a2 + a3[16]);
  *(void *)(a1 + a3[17]) = *(void *)(a2 + a3[17]);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1000ADC34(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000ADC88(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000ADCDC(uint64_t a1, uint64_t a2, int *a3)
{
  memcpy((void *)a1, (const void *)a2, 0xB8uLL);
  memcpy((void *)(a1 + 184), (const void *)(a2 + 184), 0x80uLL);
  long long v6 = *(_OWORD *)(a2 + 328);
  *(_OWORD *)(a1 + 312) = *(_OWORD *)(a2 + 312);
  *(_OWORD *)(a1 + 328) = v6;
  *(void *)(a1 + 344) = *(void *)(a2 + 344);
  *(unsigned char *)(a1 + 352) = *(unsigned char *)(a2 + 352);
  memcpy((void *)(a1 + 360), (const void *)(a2 + 360), 0x68uLL);
  long long v7 = *(_OWORD *)(a2 + 480);
  *(_OWORD *)(a1 + 464) = *(_OWORD *)(a2 + 464);
  *(_OWORD *)(a1 + 480) = v7;
  *(unsigned char *)(a1 + 496) = *(unsigned char *)(a2 + 496);
  uint64_t v8 = a3[12];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  uint64_t v11 = type metadata accessor for Date();
  if (sub_1000082E8((uint64_t)v10, 1, v11))
  {
    uint64_t v12 = sub_100005E5C(&qword_1000FC938);
    memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
    sub_1000082C0((uint64_t)v9, 0, 1, v11);
  }
  uint64_t v13 = a3[14];
  *(_OWORD *)(a1 + a3[13]) = *(_OWORD *)(a2 + a3[13]);
  *(_OWORD *)(a1 + v13) = *(_OWORD *)(a2 + v13);
  uint64_t v14 = a3[16];
  *(_OWORD *)(a1 + a3[15]) = *(_OWORD *)(a2 + a3[15]);
  *(unsigned char *)(a1 + v14) = *(unsigned char *)(a2 + v14);
  *(void *)(a1 + a3[17]) = *(void *)(a2 + a3[17]);
  return a1;
}

uint64_t sub_1000ADE50(uint64_t a1, uint64_t a2, int *a3)
{
  sub_100006178(a1);
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  sub_100006178(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  sub_100006178(a1 + 96);
  long long v8 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v8;
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  sub_100006178(a1 + 136);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  uint64_t v9 = *(void *)(a2 + 176);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = v9;
  swift_release();
  sub_100006178(a1 + 184);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  sub_100006178(a1 + 224);
  long long v10 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 224) = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 240) = v10;
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  sub_100006178(a1 + 264);
  long long v11 = *(_OWORD *)(a2 + 280);
  *(_OWORD *)(a1 + 264) = *(_OWORD *)(a2 + 264);
  *(_OWORD *)(a1 + 280) = v11;
  uint64_t v12 = *(void *)(a2 + 304);
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  *(void *)(a1 + 304) = v12;
  swift_release();
  sub_100006178(a1 + 312);
  long long v13 = *(_OWORD *)(a2 + 328);
  *(_OWORD *)(a1 + 312) = *(_OWORD *)(a2 + 312);
  *(_OWORD *)(a1 + 328) = v13;
  *(void *)(a1 + 344) = *(void *)(a2 + 344);
  *(unsigned char *)(a1 + 352) = *(unsigned char *)(a2 + 352);
  if (*(void *)(a1 + 384) == 1) {
    goto LABEL_4;
  }
  uint64_t v14 = *(void *)(a2 + 384);
  if (v14 == 1)
  {
    sub_1000ADC34(a1 + 360);
LABEL_4:
    memcpy((void *)(a1 + 360), (const void *)(a2 + 360), 0x68uLL);
    goto LABEL_6;
  }
  *(void *)(a1 + 360) = *(void *)(a2 + 360);
  *(unsigned char *)(a1 + 368) = *(unsigned char *)(a2 + 368);
  *(void *)(a1 + 376) = *(void *)(a2 + 376);
  *(void *)(a1 + 384) = v14;
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(a2 + 400);
  *(void *)(a1 + 392) = *(void *)(a2 + 392);
  *(void *)(a1 + 400) = v15;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 408) = *(void *)(a2 + 408);
  swift_bridgeObjectRelease();
  uint64_t v16 = *(void *)(a2 + 424);
  *(void *)(a1 + 416) = *(void *)(a2 + 416);
  *(void *)(a1 + 424) = v16;
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(a2 + 440);
  *(void *)(a1 + 432) = *(void *)(a2 + 432);
  *(void *)(a1 + 440) = v17;
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void *)(a2 + 456);
  *(void *)(a1 + 448) = *(void *)(a2 + 448);
  *(void *)(a1 + 456) = v18;
  swift_bridgeObjectRelease();
LABEL_6:
  if (*(void *)(a1 + 472) == 1)
  {
LABEL_9:
    long long v20 = *(_OWORD *)(a2 + 480);
    *(_OWORD *)(a1 + 464) = *(_OWORD *)(a2 + 464);
    *(_OWORD *)(a1 + 480) = v20;
    goto LABEL_15;
  }
  uint64_t v19 = *(void *)(a2 + 472);
  if (v19 == 1)
  {
    sub_1000ADC88(a1 + 464);
    goto LABEL_9;
  }
  *(void *)(a1 + 464) = *(void *)(a2 + 464);
  *(void *)(a1 + 472) = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = (_OWORD *)(a2 + 480);
  if (*(void *)(a1 + 488) == 1) {
    goto LABEL_13;
  }
  uint64_t v22 = *(void *)(a2 + 488);
  if (v22 == 1)
  {
    sub_10002F5FC(a1 + 480);
LABEL_13:
    *(_OWORD *)(a1 + 480) = *v21;
    goto LABEL_15;
  }
  *(void *)(a1 + 480) = *(void *)v21;
  *(void *)(a1 + 488) = v22;
  swift_bridgeObjectRelease();
LABEL_15:
  *(unsigned char *)(a1 + 496) = *(unsigned char *)(a2 + 496);
  uint64_t v23 = a3[12];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (const void *)(a2 + v23);
  uint64_t v26 = type metadata accessor for Date();
  int v27 = sub_1000082E8((uint64_t)v24, 1, v26);
  int v28 = sub_1000082E8((uint64_t)v25, 1, v26);
  if (!v27)
  {
    uint64_t v29 = *(void *)(v26 - 8);
    if (!v28)
    {
      (*(void (**)(void *, const void *, uint64_t))(v29 + 40))(v24, v25, v26);
      goto LABEL_21;
    }
    (*(void (**)(void *, uint64_t))(v29 + 8))(v24, v26);
    goto LABEL_20;
  }
  if (v28)
  {
LABEL_20:
    uint64_t v30 = sub_100005E5C(&qword_1000FC938);
    memcpy(v24, v25, *(void *)(*(void *)(v30 - 8) + 64));
    goto LABEL_21;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v26 - 8) + 32))(v24, v25, v26);
  sub_1000082C0((uint64_t)v24, 0, 1, v26);
LABEL_21:
  uint64_t v31 = a3[13];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = (uint64_t *)(a2 + v31);
  uint64_t v35 = *v33;
  uint64_t v34 = v33[1];
  void *v32 = v35;
  v32[1] = v34;
  swift_bridgeObjectRelease();
  uint64_t v36 = a3[14];
  uint64_t v37 = (void *)(a1 + v36);
  uint64_t v38 = (uint64_t *)(a2 + v36);
  uint64_t v40 = *v38;
  uint64_t v39 = v38[1];
  *uint64_t v37 = v40;
  v37[1] = v39;
  swift_bridgeObjectRelease();
  uint64_t v41 = a3[15];
  uint64_t v42 = (void *)(a1 + v41);
  uint64_t v43 = (uint64_t *)(a2 + v41);
  uint64_t v45 = *v43;
  uint64_t v44 = v43[1];
  *uint64_t v42 = v45;
  v42[1] = v44;
  swift_bridgeObjectRelease();
  uint64_t v46 = a3[17];
  *(unsigned char *)(a1 + a3[16]) = *(unsigned char *)(a2 + a3[16]);
  *(void *)(a1 + v46) = *(void *)(a2 + v46);
  swift_release();
  return a1;
}

uint64_t sub_1000AE270(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000AE284);
}

uint64_t sub_1000AE284(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100005E5C(&qword_1000FC938);
    uint64_t v9 = a1 + *(int *)(a3 + 48);
    return sub_1000082E8(v9, a2, v8);
  }
}

uint64_t sub_1000AE310(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000AE324);
}

uint64_t sub_1000AE324(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100005E5C(&qword_1000FC938);
    uint64_t v8 = v5 + *(int *)(a4 + 48);
    return sub_1000082C0(v8, a2, a2, v7);
  }
  return result;
}

void sub_1000AE3A8()
{
  sub_10004C3A8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_1000AE4B4()
{
  return type metadata accessor for SubscriptionCreateActivityOperation(0);
}

uint64_t sub_1000AE4E8()
{
  return type metadata accessor for SubscriptionCreateActivityOperation(0) - 8;
}

uint64_t sub_1000AE510()
{
  return type metadata accessor for SubscriptionCreateActivityOperation(0) - 8;
}

uint64_t sub_1000AE53C()
{
  sub_100006178(v0 + 184);
  sub_100006178(v0 + 224);
  sub_100006178(v0 + 264);
  return swift_release();
}

uint64_t sub_1000AE578()
{
  sub_100006178(v0 + 56);
  sub_100006178(v0 + 96);
  sub_100006178(v0 + 136);
  return swift_release();
}

uint64_t sub_1000AE5B4()
{
  sub_100006178(v0 + v1);
  return swift_release();
}

uint64_t sub_1000AE5E4()
{
  sub_100006178(v0 + 312);
  return *(void *)(v0 + 384);
}

uint64_t sub_1000AE604()
{
  return type metadata accessor for Date();
}

uint64_t sub_1000AE620()
{
  return v0;
}

uint64_t sub_1000AE644()
{
  return *(void *)(v1 + *(int *)(v0 + 52));
}

uint64_t sub_1000AE680()
{
  return v0;
}

uint64_t sub_1000AE6A4()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000AE6D0()
{
  return v0;
}

uint64_t sub_1000AE6E0()
{
  return swift_release();
}

uint64_t sub_1000AE6F8()
{
  return *(void *)(v0 + 488);
}

uint64_t sub_1000AE704()
{
  return *(void *)(v0 + 472);
}

void sub_1000AE710(uint64_t a1, void *a2)
{
  *a2 = v2;
  a2[1] = 2;
}

uint64_t sub_1000AE728()
{
  return swift_task_dealloc();
}

uint64_t sub_1000AE740()
{
  return 1;
}

uint64_t sub_1000AE794(void *a1)
{
  a1[2] = v3;
  a1[3] = v1;
  a1[4] = v2;
  return swift_errorRetain();
}

uint64_t sub_1000AE7F4(void *a1)
{
  a1[2] = v4;
  a1[3] = v1;
  a1[4] = v2;
  a1[5] = v3;
  return swift_retain();
}

uint64_t sub_1000AE828()
{
  *(void *)(v1 + 32) = v0;
  return swift_errorRetain();
}

id sub_1000AE848(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = &v3[OBJC_IVAR____TtC7sportsd16SportsXPCSession_entitlement];
  *(void *)uint64_t v4 = a1;
  *((void *)v4 + 1) = a2;
  *(void *)&v3[OBJC_IVAR____TtC7sportsd16SportsXPCSession_connection] = a3;
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for SportsXPCSession();
  return [super init];
}

uint64_t sub_1000AE898()
{
  uint64_t v1 = v0;
  if (qword_1000FBDB8 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_10000929C(v2, (uint64_t)qword_10010A4F0);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "New daemon connection.", v5, 2u);
    swift_slowDealloc();
  }

  objc_super v6 = *(void **)(v1 + OBJC_IVAR____TtC7sportsd16SportsXPCSession_connection);
  NSString v7 = String._bridgeToObjectiveC()();
  id v8 = [v6 valueForEntitlement:v7];

  if (v8)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
  }
  sub_100009F4C((uint64_t)&v12, (uint64_t)v14);
  sub_100037E68((uint64_t)v14, (uint64_t)&v12);
  if (!*((void *)&v13 + 1))
  {
    sub_100009FB4((uint64_t)&v12);
LABEL_13:
    uint64_t v9 = &selRef_invalidate;
    goto LABEL_14;
  }
  if ((swift_dynamicCast() & 1) == 0 || (v11 & 1) == 0) {
    goto LABEL_13;
  }
  uint64_t v9 = &selRef_resume;
LABEL_14:
  [v6 *v9];
  return sub_100009FB4((uint64_t)v14);
}

void sub_1000AEA68()
{
}

id sub_1000AEAA8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SportsXPCSession();
  return [super dealloc];
}

uint64_t type metadata accessor for SportsXPCSession()
{
  return self;
}

double sub_1000AEB50(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  double v4 = -1.0;
  switch(a4)
  {
    case 1:
      return 0.0;
    case 2:
      uint64_t v11 = *(void *)(a3 + 16);
      if (!v11) {
        goto LABEL_19;
      }
      long long v12 = (double *)(a3 + 48);
      while (1)
      {
        double v4 = *v12;
        BOOL v13 = *((void *)v12 - 2) == a1 && *((void *)v12 - 1) == a2;
        if (v13 || (sub_1000AF60C() & 1) != 0) {
          break;
        }
        v12 += 3;
        if (!--v11)
        {
LABEL_19:
          double v4 = 0.0;
          break;
        }
      }
      uint64_t v23 = a3;
      swift_bridgeObjectRetain();
      sub_1000AED44(&v23);
      uint64_t v14 = v23;
      uint64_t v15 = *(void *)(v23 + 16);
      if (v15)
      {
        double v16 = *(double *)(v23 + 48);
        if (v4 >= v16)
        {
          uint64_t v17 = (double *)(v23 + 40);
          for (unint64_t i = 1; ; ++i)
          {
            uint64_t v20 = *((void *)v17 - 1);
            double v19 = *v17;
            swift_bridgeObjectRetain();
            if (v16 == v4)
            {
              BOOL v21 = v20 == a1 && *(void *)&v19 == a2;
              if (!v21 && (sub_1000AF60C() & 1) == 0) {
                break;
              }
            }
            swift_bridgeObjectRelease();
            if (v16 < v4 || v15 == i) {
              goto LABEL_35;
            }
            if (i >= *(void *)(v14 + 16))
            {
              __break(1u);
              swift_release();
              __break(1u);
              JUMPOUT(0x1000AED34);
            }
            double v16 = v17[4];
            if (v4 < v16) {
              goto LABEL_22;
            }
            v17 += 3;
          }
          swift_bridgeObjectRelease();
          swift_release();
          return v4 + 1.0;
        }
        else
        {
LABEL_22:
          swift_release();
          return v16 + 1.0;
        }
      }
      else
      {
LABEL_35:
        swift_release();
      }
      return v4;
    case 3:
      return v4;
    default:
      uint64_t v8 = *(void *)(a3 + 16);
      if (!v8) {
        return 0.0;
      }
      uint64_t v9 = (double *)(a3 + 48);
      break;
  }
  while (1)
  {
    double v4 = *v9;
    BOOL v10 = *((void *)v9 - 2) == a1 && *((void *)v9 - 1) == a2;
    if (v10 || (sub_1000AF60C() & 1) != 0) {
      break;
    }
    v9 += 3;
    if (!--v8) {
      return 0.0;
    }
  }
  return v4;
}

uint64_t sub_1000AED44(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_100098970();
    uint64_t v2 = v3;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  uint64_t result = sub_1000AEDB0(v6);
  *a1 = v2;
  return result;
}

uint64_t sub_1000AEDB0(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  uint64_t result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3) {
        return sub_1000AF3F4(0, v3, 1, a1);
      }
      return result;
    }
    goto LABEL_125;
  }
  uint64_t v5 = result;
  uint64_t result = (uint64_t)sub_100097488(v3 / 2);
  unsigned int v90 = a1;
  uint64_t v91 = result;
  uint64_t v93 = v3;
  uint64_t v94 = v6;
  if (v3 <= 0)
  {
    unint64_t v95 = (char *)_swiftEmptyArrayStorage;
    unint64_t v29 = _swiftEmptyArrayStorage[2];
LABEL_91:
    if (v29 < 2)
    {
LABEL_102:
      uint64_t result = swift_bridgeObjectRelease();
      if (v93 >= -1)
      {
        *(void *)(v91 + 16) = 0;
        return swift_bridgeObjectRelease();
      }
      goto LABEL_130;
    }
    uint64_t v83 = *v90;
    while (1)
    {
      unint64_t v84 = v29 - 2;
      if (v29 < 2) {
        break;
      }
      if (!v83) {
        goto LABEL_134;
      }
      uint64_t v85 = v95;
      uint64_t v86 = *(void *)&v95[16 * v84 + 32];
      uint64_t v87 = *(void *)&v95[16 * v29 + 24];
      uint64_t result = sub_1000AF470((char *)(v83 + 24 * v86), (char *)(v83 + 24 * *(void *)&v95[16 * v29 + 16]), v83 + 24 * v87, v94);
      if (v1) {
        goto LABEL_87;
      }
      if (v87 < v86) {
        goto LABEL_120;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_100098440((uint64_t)v95);
        uint64_t v85 = (char *)result;
      }
      if (v84 >= *((void *)v85 + 2)) {
        goto LABEL_121;
      }
      long long v88 = &v85[16 * v84 + 32];
      *(void *)long long v88 = v86;
      *((void *)v88 + 1) = v87;
      unint64_t v89 = *((void *)v85 + 2);
      if (v29 > v89) {
        goto LABEL_122;
      }
      uint64_t result = (uint64_t)memmove(&v85[16 * v29 + 16], &v85[16 * v29 + 32], 16 * (v89 - v29));
      unint64_t v95 = v85;
      *((void *)v85 + 2) = v89 - 1;
      unint64_t v29 = v89 - 1;
      if (v89 <= 2) {
        goto LABEL_102;
      }
    }
LABEL_119:
    __break(1u);
LABEL_120:
    __break(1u);
LABEL_121:
    __break(1u);
LABEL_122:
    __break(1u);
LABEL_123:
    __break(1u);
LABEL_124:
    __break(1u);
LABEL_125:
    __break(1u);
LABEL_126:
    __break(1u);
LABEL_127:
    __break(1u);
LABEL_128:
    __break(1u);
LABEL_129:
    __break(1u);
LABEL_130:
    __break(1u);
LABEL_131:
    __break(1u);
LABEL_132:
    __break(1u);
LABEL_133:
    __break(1u);
LABEL_134:
    __break(1u);
    return result;
  }
  Swift::Int v7 = 0;
  uint64_t v8 = *a1;
  unint64_t v95 = (char *)_swiftEmptyArrayStorage;
  uint64_t v92 = v5;
  while (1)
  {
    Swift::Int v9 = v7++;
    if (v7 < v3)
    {
      double v10 = *(double *)(v8 + 24 * v7 + 16);
      double v11 = *(double *)(v8 + 24 * v9 + 16);
      Swift::Int v7 = v9 + 2;
      if (v9 + 2 < v3)
      {
        long long v12 = (double *)(v8 + 64 + 24 * v9);
        double v13 = v10;
        while (1)
        {
          double v14 = v13;
          double v13 = *v12;
          if (v11 < v10 == v14 >= *v12) {
            break;
          }
          ++v7;
          v12 += 3;
          if (v7 >= v3)
          {
            Swift::Int v7 = v3;
            break;
          }
        }
      }
      if (v11 < v10)
      {
        if (v7 < v9) {
          goto LABEL_127;
        }
        if (v9 < v7)
        {
          uint64_t v15 = 24 * v7;
          uint64_t v16 = 24 * v9;
          Swift::Int v17 = v7;
          Swift::Int v18 = v9;
          do
          {
            if (v18 != --v17)
            {
              if (!v8) {
                goto LABEL_133;
              }
              uint64_t v19 = v8 + v16;
              uint64_t v20 = v8 + v15;
              uint64_t v21 = *(void *)(v8 + v16);
              uint64_t v22 = *(void *)(v8 + v16 + 8);
              uint64_t v23 = *(void *)(v8 + v16 + 16);
              uint64_t v24 = *(void *)(v8 + v15 - 8);
              *(_OWORD *)uint64_t v19 = *(_OWORD *)(v8 + v15 - 24);
              *(void *)(v19 + 16) = v24;
              *(void *)(v20 - 24) = v21;
              *(void *)(v20 - 16) = v22;
              *(void *)(v20 - 8) = v23;
            }
            ++v18;
            v15 -= 24;
            v16 += 24;
          }
          while (v18 < v17);
        }
      }
    }
    if (v7 >= v3) {
      goto LABEL_26;
    }
    if (__OFSUB__(v7, v9)) {
      goto LABEL_124;
    }
    if (v7 - v9 >= v5) {
      goto LABEL_26;
    }
    Swift::Int v25 = v9 + v5;
    if (__OFADD__(v9, v5)) {
      goto LABEL_128;
    }
    if (v25 >= v3) {
      Swift::Int v25 = v3;
    }
    if (v25 < v9) {
      goto LABEL_129;
    }
    if (v7 == v25)
    {
LABEL_26:
      uint64_t v26 = v95;
    }
    else
    {
      uint64_t v77 = (double *)(v8 + 24 * v7);
      uint64_t v26 = v95;
      do
      {
        double v78 = *(double *)(v8 + 24 * v7 + 16);
        Swift::Int v79 = v9;
        uint64_t v80 = v77;
        do
        {
          if (*(v80 - 1) >= v78) {
            break;
          }
          if (!v8) {
            goto LABEL_131;
          }
          double v81 = *v80;
          uint64_t v82 = *((void *)v80 + 1);
          *(_OWORD *)uint64_t v80 = *(_OWORD *)(v80 - 3);
          v80[2] = *(v80 - 1);
          *((void *)v80 - 2) = v82;
          *(v80 - 1) = v78;
          *(v80 - 3) = v81;
          v80 -= 3;
          ++v79;
        }
        while (v7 != v79);
        ++v7;
        v77 += 3;
      }
      while (v7 != v25);
      Swift::Int v7 = v25;
    }
    if (v7 < v9) {
      goto LABEL_123;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_100098354(0, *((void *)v26 + 2) + 1, 1, v26);
      uint64_t v26 = (char *)result;
    }
    unint64_t v28 = *((void *)v26 + 2);
    unint64_t v27 = *((void *)v26 + 3);
    unint64_t v29 = v28 + 1;
    if (v28 >= v27 >> 1)
    {
      uint64_t result = (uint64_t)sub_100098354((char *)(v27 > 1), v28 + 1, 1, v26);
      uint64_t v26 = (char *)result;
    }
    *((void *)v26 + 2) = v29;
    uint64_t v30 = v26 + 32;
    uint64_t v31 = (Swift::Int *)&v26[16 * v28 + 32];
    *uint64_t v31 = v9;
    v31[1] = v7;
    unint64_t v95 = v26;
    if (v28) {
      break;
    }
    unint64_t v29 = 1;
LABEL_75:
    uint64_t v5 = v92;
    Swift::Int v3 = v93;
    if (v7 >= v93) {
      goto LABEL_91;
    }
  }
  while (1)
  {
    unint64_t v32 = v29 - 1;
    if (v29 >= 4)
    {
      uint64_t v37 = &v30[2 * v29];
      uint64_t v38 = *(v37 - 8);
      uint64_t v39 = *(v37 - 7);
      BOOL v43 = __OFSUB__(v39, v38);
      uint64_t v40 = v39 - v38;
      if (v43) {
        goto LABEL_108;
      }
      uint64_t v42 = *(v37 - 6);
      uint64_t v41 = *(v37 - 5);
      BOOL v43 = __OFSUB__(v41, v42);
      uint64_t v35 = v41 - v42;
      char v36 = v43;
      if (v43) {
        goto LABEL_109;
      }
      unint64_t v44 = v29 - 2;
      uint64_t v45 = &v30[2 * v29 - 4];
      uint64_t v47 = *v45;
      uint64_t v46 = v45[1];
      BOOL v43 = __OFSUB__(v46, v47);
      uint64_t v48 = v46 - v47;
      if (v43) {
        goto LABEL_110;
      }
      BOOL v43 = __OFADD__(v35, v48);
      uint64_t v49 = v35 + v48;
      if (v43) {
        goto LABEL_112;
      }
      if (v49 >= v40)
      {
        uint64_t v67 = &v30[2 * v32];
        uint64_t v69 = *v67;
        uint64_t v68 = v67[1];
        BOOL v43 = __OFSUB__(v68, v69);
        uint64_t v70 = v68 - v69;
        if (v43) {
          goto LABEL_118;
        }
        BOOL v60 = v35 < v70;
        goto LABEL_64;
      }
    }
    else
    {
      if (v29 != 3)
      {
        uint64_t v61 = *((void *)v26 + 4);
        uint64_t v62 = *((void *)v26 + 5);
        BOOL v43 = __OFSUB__(v62, v61);
        uint64_t v54 = v62 - v61;
        char v55 = v43;
        goto LABEL_58;
      }
      uint64_t v34 = *((void *)v26 + 4);
      uint64_t v33 = *((void *)v26 + 5);
      BOOL v43 = __OFSUB__(v33, v34);
      uint64_t v35 = v33 - v34;
      char v36 = v43;
    }
    if (v36) {
      goto LABEL_111;
    }
    unint64_t v44 = v29 - 2;
    uint64_t v50 = &v30[2 * v29 - 4];
    uint64_t v52 = *v50;
    uint64_t v51 = v50[1];
    BOOL v53 = __OFSUB__(v51, v52);
    uint64_t v54 = v51 - v52;
    char v55 = v53;
    if (v53) {
      goto LABEL_113;
    }
    uint64_t v56 = &v30[2 * v32];
    uint64_t v58 = *v56;
    uint64_t v57 = v56[1];
    BOOL v43 = __OFSUB__(v57, v58);
    uint64_t v59 = v57 - v58;
    if (v43) {
      goto LABEL_115;
    }
    if (__OFADD__(v54, v59)) {
      goto LABEL_117;
    }
    if (v54 + v59 >= v35)
    {
      BOOL v60 = v35 < v59;
LABEL_64:
      if (v60) {
        unint64_t v32 = v44;
      }
      goto LABEL_66;
    }
LABEL_58:
    if (v55) {
      goto LABEL_114;
    }
    uint64_t v63 = &v30[2 * v32];
    uint64_t v65 = *v63;
    uint64_t v64 = v63[1];
    BOOL v43 = __OFSUB__(v64, v65);
    uint64_t v66 = v64 - v65;
    if (v43) {
      goto LABEL_116;
    }
    if (v66 < v54) {
      goto LABEL_75;
    }
LABEL_66:
    unint64_t v71 = v32 - 1;
    if (v32 - 1 >= v29)
    {
      __break(1u);
LABEL_105:
      __break(1u);
LABEL_106:
      __break(1u);
LABEL_107:
      __break(1u);
LABEL_108:
      __break(1u);
LABEL_109:
      __break(1u);
LABEL_110:
      __break(1u);
LABEL_111:
      __break(1u);
LABEL_112:
      __break(1u);
LABEL_113:
      __break(1u);
LABEL_114:
      __break(1u);
LABEL_115:
      __break(1u);
LABEL_116:
      __break(1u);
LABEL_117:
      __break(1u);
LABEL_118:
      __break(1u);
      goto LABEL_119;
    }
    if (!v8) {
      goto LABEL_132;
    }
    uint64_t v72 = &v30[2 * v71];
    uint64_t v73 = *v72;
    uint64_t v74 = &v30[2 * v32];
    uint64_t v75 = v74[1];
    uint64_t result = sub_1000AF470((char *)(v8 + 24 * *v72), (char *)(v8 + 24 * *v74), v8 + 24 * v75, v94);
    if (v1) {
      break;
    }
    if (v75 < v73) {
      goto LABEL_105;
    }
    if (v32 > *((void *)v95 + 2)) {
      goto LABEL_106;
    }
    *uint64_t v72 = v73;
    v30[2 * v71 + 1] = v75;
    unint64_t v76 = *((void *)v95 + 2);
    if (v32 >= v76) {
      goto LABEL_107;
    }
    uint64_t v26 = v95;
    unint64_t v29 = v76 - 1;
    uint64_t result = (uint64_t)memmove(&v30[2 * v32], v74 + 2, 16 * (v76 - 1 - v32));
    *((void *)v95 + 2) = v76 - 1;
    if (v76 <= 2) {
      goto LABEL_75;
    }
  }
LABEL_87:
  uint64_t result = swift_bridgeObjectRelease();
  if (v93 < -1) {
    goto LABEL_126;
  }
  *(void *)(v91 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000AF3F4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = *a4;
    uint64_t v5 = *a4 + 24 * a3;
    while (2)
    {
      double v6 = *(double *)(v4 + 24 * a3 + 16);
      uint64_t v7 = result;
      uint64_t v8 = (double *)v5;
      do
      {
        if (*(v8 - 1) >= v6) {
          break;
        }
        if (!v4)
        {
          __break(1u);
          return result;
        }
        double v9 = *v8;
        uint64_t v10 = *((void *)v8 + 1);
        *(_OWORD *)uint64_t v8 = *(_OWORD *)(v8 - 3);
        v8[2] = *(v8 - 1);
        *((void *)v8 - 2) = v10;
        *(v8 - 1) = v6;
        *(v8 - 3) = v9;
        v8 -= 3;
        ++v7;
      }
      while (a3 != v7);
      ++a3;
      v5 += 24;
      if (a3 != a2) {
        continue;
      }
      break;
    }
  }
  return result;
}

uint64_t sub_1000AF470(char *a1, char *a2, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  double v6 = a2;
  uint64_t v7 = a1;
  uint64_t v8 = a2 - a1;
  uint64_t v9 = (a2 - a1) / 24;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 24;
  if (v9 >= v11)
  {
    sub_1000165DC(a2, (uint64_t)(a3 - (void)a2) / 24, a4);
    long long v12 = &v4[24 * v11];
    if (v7 >= v6 || v10 < 24) {
      goto LABEL_45;
    }
    unint64_t v21 = a3 - 24;
    while (1)
    {
      uint64_t v22 = (char *)(v21 + 24);
      if (*((double *)v6 - 1) >= *((double *)v12 - 1))
      {
        uint64_t v23 = v12 - 24;
        BOOL v25 = v22 != v12 || v21 >= (unint64_t)v12;
        v12 -= 24;
        if (!v25) {
          goto LABEL_41;
        }
      }
      else
      {
        uint64_t v23 = v6 - 24;
        BOOL v24 = v22 != v6 || v21 >= (unint64_t)v6;
        v6 -= 24;
        if (!v24) {
          goto LABEL_41;
        }
      }
      long long v26 = *(_OWORD *)v23;
      *(void *)(v21 + 16) = *((void *)v23 + 2);
      *(_OWORD *)unint64_t v21 = v26;
LABEL_41:
      v21 -= 24;
      if (v6 <= v7 || v12 <= v4) {
        goto LABEL_45;
      }
    }
  }
  sub_1000165DC(a1, (a2 - a1) / 24, a4);
  long long v12 = &v4[24 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 24)
  {
    do
    {
      if (*((double *)v4 + 2) >= *((double *)v6 + 2))
      {
        BOOL v14 = v7 == v4;
        uint64_t v15 = v4;
        v4 += 24;
        if (v14 && v7 < v4) {
          goto LABEL_18;
        }
      }
      else
      {
        BOOL v14 = v7 == v6;
        uint64_t v15 = v6;
        v6 += 24;
        if (v14 && v7 < v6) {
          goto LABEL_18;
        }
      }
      long long v18 = *(_OWORD *)v15;
      *((void *)v7 + 2) = *((void *)v15 + 2);
      *(_OWORD *)uint64_t v7 = v18;
LABEL_18:
      v7 += 24;
    }
    while (v4 < v12 && (unint64_t)v6 < a3);
  }
  double v6 = v7;
LABEL_45:
  sub_1000165DC(v4, (v12 - v4) / 24, v6);
  return 1;
}

uint64_t sub_1000AF60C()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000AF628()
{
  uint64_t v0 = (void *)SportingEvent.clock.getter();
  uint64_t v1 = (void *)SportingEventCurrentClock.current.getter();

  dispatch thunk of SportingEventClock.minutes.getter();
  uint64_t v2 = (void *)SportingEvent.clock.getter();
  Swift::Int v3 = (void *)SportingEventCurrentClock.current.getter();

  uint64_t v4 = dispatch thunk of SportingEventClock.seconds.getter();
  char v6 = v5;

  if (v6) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v4;
  }
  uint64_t v8 = (void *)SportingEvent.clock.getter();
  uint64_t v9 = (void *)SportingEventCurrentClock.current.getter();

  uint64_t v10 = dispatch thunk of SportingEventClock.milliseconds.getter();
  char v12 = v11;

  if (v12) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = v10;
  }
  uint64_t v21 = dispatch thunk of CustomStringConvertible.description.getter();
  v14._countAndFlagsBits = 58;
  v14._object = (void *)0xE100000000000000;
  String.append(_:)(v14);
  sub_100005E5C(&qword_1000FC8A8);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_1000CABA0;
  *(void *)(v15 + 56) = &type metadata for Int;
  *(void *)(v15 + 64) = &protocol witness table for Int;
  *(void *)(v15 + 32) = v7;
  v16._countAndFlagsBits = String.init(format:_:)();
  String.append(_:)(v16);
  swift_bridgeObjectRelease();
  v17._countAndFlagsBits = 46;
  v17._object = (void *)0xE100000000000000;
  String.append(_:)(v17);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_1000CABA0;
  *(void *)(v18 + 56) = &type metadata for Int;
  *(void *)(v18 + 64) = &protocol witness table for Int;
  *(void *)(v18 + 32) = v13;
  v19._countAndFlagsBits = String.init(format:_:)();
  String.append(_:)(v19);
  swift_bridgeObjectRelease();
  return v21;
}

void sub_1000AF7F8(void (*a1)(uint64_t *__return_ptr, id *), uint64_t a2, unint64_t a3)
{
  uint64_t v4 = v3;
  if (a3 >> 62) {
    goto LABEL_19;
  }
  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v6)
  {
    uint64_t v21 = _swiftEmptyArrayStorage;
    sub_100018014();
    if (v6 < 0)
    {
      __break(1u);
      return;
    }
    uint64_t v7 = 0;
    uint64_t v8 = v21;
    while (v6 != v7)
    {
      if ((a3 & 0xC000000000000001) != 0) {
        id v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v9 = *(id *)(a3 + 8 * v7 + 32);
      }
      uint64_t v10 = v9;
      id v18 = v9;
      a1(&v19, &v18);
      if (v4)
      {
        swift_release();

        return;
      }
      uint64_t v11 = v6;

      uint64_t v12 = v19;
      char v13 = v20;
      uint64_t v21 = v8;
      unint64_t v14 = v8[2];
      if (v14 >= v8[3] >> 1)
      {
        sub_100018014();
        uint64_t v8 = v21;
      }
      ++v7;
      v8[2] = v14 + 1;
      uint64_t v15 = &v8[2 * v14];
      v15[4] = v12;
      *((unsigned char *)v15 + 40) = v13;
      uint64_t v6 = v11;
      BOOL v16 = v11 == v7;
      uint64_t v4 = 0;
      if (v16) {
        return;
      }
    }
    __break(1u);
LABEL_19:
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
}

void *sub_1000AF99C(void (*a1)(uint64_t *__return_ptr, id *), uint64_t a2, unint64_t a3)
{
  unint64_t v4 = a3;
  if (a3 >> 62) {
    goto LABEL_19;
  }
  uint64_t v5 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; uint64_t v5 = _CocoaArrayWrapper.endIndex.getter())
  {
    unint64_t v21 = v4 & 0xC000000000000001;
    uint64_t v6 = _swiftEmptyArrayStorage;
    uint64_t v7 = 4;
    uint64_t v19 = v5;
    unint64_t v20 = v4;
    while (1)
    {
      id v8 = v21 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)() : *(id *)(v4 + 8 * v7);
      id v9 = v8;
      uint64_t v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      id v28 = v8;
      a1(&v24, &v28);
      if (v3)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        return v6;
      }

      uint64_t v11 = v25;
      if (v25)
      {
        uint64_t v12 = v26;
        uint64_t v13 = v27;
        uint64_t v23 = v24;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1000158A8();
          uint64_t v6 = v16;
        }
        unint64_t v14 = v6[2];
        if (v14 >= v6[3] >> 1)
        {
          sub_1000158A8();
          uint64_t v6 = v17;
        }
        uint64_t v6[2] = v14 + 1;
        uint64_t v15 = &v6[4 * v14];
        v15[4] = v23;
        v15[5] = v11;
        v15[6] = v12;
        v15[7] = v13;
        uint64_t v5 = v19;
        unint64_t v4 = v20;
      }
      ++v7;
      if (v10 == v5)
      {
        swift_bridgeObjectRelease();
        return v6;
      }
    }
    __break(1u);
LABEL_19:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return _swiftEmptyArrayStorage;
}

uint64_t sub_1000AFB74(void *a1, void *a2)
{
  v369 = a2;
  uint64_t v3 = sub_100005E5C(&qword_1000FFA98);
  __chkstk_darwin(v3 - 8);
  sub_1000098F8();
  uint64_t v6 = v5 - v4;
  uint64_t v382 = type metadata accessor for IngestionError();
  sub_10000C568();
  uint64_t v373 = v7;
  __chkstk_darwin(v8);
  sub_10004D594();
  sub_100098C34();
  __chkstk_darwin(v9);
  sub_100098C34();
  __chkstk_darwin(v10);
  sub_1000B5138((uint64_t)&v364 - v11);
  uint64_t v12 = type metadata accessor for Logger();
  sub_10000C568();
  uint64_t v367 = v13;
  __chkstk_darwin(v14);
  sub_1000098F8();
  uint64_t v17 = v16 - v15;
  uint64_t v18 = type metadata accessor for SportingEventMetadataType();
  sub_10000C568();
  uint64_t v365 = v19;
  __chkstk_darwin(v20);
  sub_10004D594();
  sub_100098C34();
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v364 - v22;
  *(void *)&long long v391 = type metadata accessor for SportingEventCompetitorScoreStatisticType.StatisticName();
  sub_10000C568();
  v383 = v24;
  __chkstk_darwin(v25);
  sub_10000C58C();
  sub_1000B5138(v26);
  v386 = (void (**)(uint64_t, void, uint64_t))type metadata accessor for SportingEventProgressStatus();
  sub_10000C568();
  v385 = v27;
  __chkstk_darwin(v28);
  sub_10000C58C();
  sub_1000B5138(v29);
  uint64_t v377 = type metadata accessor for SportingEventClockBreakType();
  sub_10000C568();
  uint64_t v376 = v30;
  __chkstk_darwin(v31);
  sub_10000C58C();
  unint64_t v375 = v32;
  uint64_t v33 = sub_100005E5C(&qword_1000FFAA0);
  __chkstk_darwin(v33 - 8);
  sub_1000098F8();
  uint64_t v36 = v35 - v34;
  uint64_t v37 = sub_100005E5C(&qword_1000FF250);
  __chkstk_darwin(v37 - 8);
  sub_1000098F8();
  uint64_t v40 = v39 - v38;
  if (qword_1000FBDC0 != -1) {
    swift_once();
  }
  os_log_t v387 = (os_log_t)v36;
  v388 = v23;
  uint64_t v381 = v18;
  uint64_t v379 = v6;
  uint64_t v366 = v17;
  uint64_t v368 = v12;
  uint64_t v384 = sub_10000929C(v12, (uint64_t)qword_10010A508);
  uint64_t v41 = Logger.logObject.getter();
  os_log_type_t v42 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v41, v42))
  {
    v364 = a1;
    uint64_t v374 = v40;
    BOOL v43 = (uint8_t *)sub_10001C638();
    id v370 = (id)sub_100046F5C();
    v397[0] = (uint64_t)v370;
    *(_DWORD *)BOOL v43 = 136315138;
    unint64_t v44 = (objc_class *)type metadata accessor for ActivityAuthorization();
    id v45 = [objc_allocWithZone(v44) init];
    unint64_t v46 = sub_1000522C4();
    uint64_t v48 = v47;
    v394 = v44;
    v395 = &off_1000F15C8;
    id v392 = v45;
    type metadata accessor for ActivityCapUtility();
    uint64_t inited = (void *)swift_initStackObject();
    sub_10000A014((uint64_t)&v392, (uint64_t)v394);
    sub_10000C568();
    __chkstk_darwin(v50);
    sub_1000098F8();
    BOOL v53 = (uint64_t *)(v52 - v51);
    (*(void (**)(uint64_t))(v54 + 16))(v52 - v51);
    uint64_t v55 = *v53;
    inited[5] = v44;
    inited[6] = &off_1000F15C8;
    inited[7] = v46;
    inited[2] = v55;
    inited[8] = v48;
    sub_100006178((uint64_t)&v392);
    LOBYTE(v46) = sub_10007AD1C();
    swift_setDeallocating();
    sub_10007AD58();
    if (v46)
    {
      uint64_t v57 = 1212631368;
      unint64_t v58 = 0xE400000000000000;
      swift_bridgeObjectRelease();
    }
    else
    {
      char v56 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v56) {
        uint64_t v57 = 1212631368;
      }
      else {
        uint64_t v57 = 5721932;
      }
      if (v56) {
        unint64_t v58 = 0xE400000000000000;
      }
      else {
        unint64_t v58 = 0xE300000000000000;
      }
    }
    a1 = v364;
    uint64_t v36 = (uint64_t)(v43 + 4);
    id v392 = (id)sub_100017098(v57, v58, v397);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v41, v42, "Live activity cap: %s", v43, 0xCu);
    swift_arrayDestroy();
    sub_10001C2C8();
    sub_10001C2C8();

    uint64_t v40 = v374;
  }
  else
  {
  }
  id v59 = a1;
  BOOL v60 = sub_1000B4FE4();
  os_log_type_t v61 = static os_log_type_t.debug.getter();
  if (sub_1000B5038(v61))
  {
    sub_10001C638();
    id v392 = (id)sub_100046F5C();
    sub_1000B51D8(4.8149e-34);
    uint64_t v62 = SportingEvent.version.getter();
    uint64_t v64 = sub_100017098(v62, v63, (uint64_t *)&v392);
    sub_1000B5070(v64);

    swift_bridgeObjectRelease();
    sub_1000B5100((void *)&_mh_execute_header, v60, v65, "Version: %s");
    sub_1000B511C();
    sub_10001C2C8();
    sub_10001C2C8();
  }
  else
  {
  }
  id v66 = v59;
  uint64_t v67 = sub_1000B4FE4();
  os_log_type_t v68 = static os_log_type_t.debug.getter();
  if (sub_1000B5038(v68))
  {
    sub_10001C638();
    id v392 = (id)sub_100046F5C();
    sub_1000B51D8(4.8149e-34);
    uint64_t v69 = sub_1000AF628();
    uint64_t v71 = sub_100017098(v69, v70, (uint64_t *)&v392);
    sub_1000B5070(v71);

    swift_bridgeObjectRelease();
    sub_1000B5100((void *)&_mh_execute_header, v67, v72, "Event clock: %s");
    sub_1000B511C();
    sub_10001C2C8();
    sub_10001C2C8();
  }
  else
  {
  }
  id v73 = v66;
  uint64_t v74 = sub_1000B4FE4();
  os_log_type_t v75 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v74, v75))
  {
    uint64_t v76 = sub_100046F5C();
    id v392 = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v76 = 136315650;
    uint64_t v77 = (void *)SportingEvent.clock.getter();
    double v78 = (void *)SportingEventCurrentClock.current.getter();

    Swift::Int v79 = (void *)SportingEventClock.period.getter();
    dispatch thunk of SportingEventClockPeriod.type.getter();

    uint64_t v80 = type metadata accessor for SportingEventClockPeriodType();
    if (sub_1000082E8(v40, 1, v80) == 1)
    {
      sub_100037ED0(v40, &qword_1000FF250);
      unint64_t v81 = 0xE400000000000000;
      uint64_t v36 = 1819047278;
    }
    else
    {
      unint64_t v81 = v40;
      SportingEventClockPeriodType.rawValue.getter();
      sub_1000B50A8();
      (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v40, v80);
    }
    uint64_t v83 = sub_100017098(v36, v81, (uint64_t *)&v392);
    sub_1000B50D8(v83);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v76 + 12) = 2080;
    unint64_t v84 = (void *)SportingEvent.clock.getter();
    uint64_t v85 = SportingEventCurrentClock.current.getter();

    uint64_t v86 = (void *)SportingEventClock.period.getter();
    uint64_t v87 = dispatch thunk of SportingEventClockPeriod.index.getter();
    LOBYTE(v85) = v88;

    if (v85)
    {
      unint64_t v91 = 0xE400000000000000;
      uint64_t v89 = sub_1000B5148();
    }
    else
    {
      v397[0] = v87;
      uint64_t v89 = dispatch thunk of CustomStringConvertible.description.getter();
      unint64_t v91 = v90;
    }
    uint64_t v92 = v76 + 14;
    uint64_t v93 = sub_100017098(v89, v91, (uint64_t *)&v392);
    sub_1000B5174(v93);

    swift_bridgeObjectRelease();
    *(_WORD *)(v76 + 22) = 2080;
    uint64_t v94 = (void *)SportingEvent.clock.getter();
    unint64_t v95 = (void *)SportingEventCurrentClock.current.getter();

    v96 = (void *)SportingEventClock.period.getter();
    os_log_t v97 = v387;
    dispatch thunk of SportingEventClockPeriod.subdivision.getter();

    uint64_t v98 = type metadata accessor for SportingEventClockPeriodSubdivision();
    if (sub_1000082E8((uint64_t)v97, 1, v98) == 1)
    {
      sub_100037ED0((uint64_t)v97, &qword_1000FFAA0);
      unint64_t v99 = 0xE400000000000000;
      uint64_t v92 = 1819047278;
    }
    else
    {
      unint64_t v99 = (unint64_t)v97;
      SportingEventClockPeriodSubdivision.rawValue.getter();
      sub_1000B50A8();
      (*(void (**)(os_log_t, uint64_t))(v100 + 8))(v97, v98);
    }
    uint64_t v101 = sub_100017098(v92, v99, (uint64_t *)&v392);
    sub_1000B4FFC(v101);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v74, v75, "Clock period: type=%s, index=%s, subdivision=%s", (uint8_t *)v76, 0x20u);
    swift_arrayDestroy();
    sub_10001C2C8();
    sub_10001C2C8();
  }
  else
  {
  }
  uint64_t v102 = v73;
  uint64_t v103 = sub_1000B4FE4();
  os_log_type_t v104 = static os_log_type_t.debug.getter();
  BOOL v105 = os_log_type_enabled(v103, v104);
  uint64_t v106 = (uint64_t)&unk_1000CB000;
  os_log_t v387 = v102;
  if (v105)
  {
    uint64_t v107 = sub_1000B5220();
    id v392 = (id)sub_100061A70();
    *(_DWORD *)uint64_t v107 = 136315394;
    uint64_t v108 = (void *)SportingEvent.clock.getter();
    uint64_t v109 = (void *)SportingEventCurrentClock.current.getter();

    uint64_t v110 = dispatch thunk of SportingEventClock.runningState.getter();
    if (v110)
    {
      char v111 = dispatch thunk of SportingEventClockRunningState.isReliable.getter();
      swift_release();
      unint64_t v112 = 0xE400000000000000;
      uint64_t v113 = sub_1000B5148();
      if (v111 != 2)
      {
        uint64_t v113 = (v111 & 1) != 0 ? 1702195828 : 0x65736C6166;
        if ((v111 & 1) == 0) {
          unint64_t v112 = 0xE500000000000000;
        }
      }
    }
    else
    {
      unint64_t v112 = 0xE400000000000000;
      uint64_t v113 = sub_1000B5148();
    }
    uint64_t v114 = sub_100017098(v113, v112, (uint64_t *)&v392);
    sub_1000B50D8(v114);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    os_log_t v115 = v387;

    swift_bridgeObjectRelease();
    *(_WORD *)(v107 + 12) = 2080;
    uint64_t v116 = (void *)SportingEvent.clock.getter();
    uint64_t v117 = (void *)SportingEventCurrentClock.current.getter();

    uint64_t v118 = dispatch thunk of SportingEventClock.runningState.getter();
    if (v118)
    {
      char v119 = dispatch thunk of SportingEventClockRunningState.isActive.getter();
      swift_release();
      unint64_t v120 = 0xE400000000000000;
      uint64_t v106 = 0x1000CB000;
      uint64_t v121 = 1819047278;
      if (v119 != 2)
      {
        uint64_t v121 = (v119 & 1) != 0 ? 1702195828 : 0x65736C6166;
        if ((v119 & 1) == 0) {
          unint64_t v120 = 0xE500000000000000;
        }
      }
    }
    else
    {
      unint64_t v120 = 0xE400000000000000;
      uint64_t v106 = (uint64_t)&unk_1000CB000;
      uint64_t v121 = sub_1000B5148();
    }
    uint64_t v122 = sub_100017098(v121, v120, (uint64_t *)&v392);
    sub_1000B5174(v122);
    uint64_t v102 = v387;

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v103, v104, "Running clock: isReliable=%s, isActive=%s", (uint8_t *)v107, 0x16u);
    swift_arrayDestroy();
    sub_10001C2C8();
    sub_10001C2C8();
  }
  else
  {
  }
  sub_1000B24F4((uint64_t)v369);
  uint64_t v123 = (void *)SportingEvent.clock.getter();
  v124 = (void *)SportingEventCurrentClock.current.getter();

  uint64_t v125 = (void *)dispatch thunk of SportingEventClock.activityStatus.getter();
  if (!v125)
  {
    uint64_t v126 = sub_1000B4FE4();
    os_log_type_t v141 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v126, v141))
    {
      v142 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v142 = 0;
      _os_log_impl((void *)&_mh_execute_header, v126, v141, "Clock activity status: null", v142, 2u);
      sub_10001C2C8();
    }
    goto LABEL_65;
  }
  uint64_t v126 = v125;
  uint64_t v127 = (void *)sub_1000B4FE4();
  os_log_type_t v128 = static os_log_type_t.debug.getter();
  if (!sub_1000B5038(v128))
  {

LABEL_65:
    goto LABEL_66;
  }
  uint64_t v129 = sub_1000B5220();
  uint64_t v374 = sub_100061A70();
  id v392 = (id)v374;
  *(_DWORD *)uint64_t v129 = *(void *)(v106 + 312);
  char v130 = SportingEventClockActivityStatus.isBreak.getter();
  BOOL v131 = (v130 & 1) == 0;
  if (v130) {
    uint64_t v132 = 1702195828;
  }
  else {
    uint64_t v132 = 0x65736C6166;
  }
  if (v131) {
    unint64_t v133 = 0xE500000000000000;
  }
  else {
    unint64_t v133 = 0xE400000000000000;
  }
  v397[0] = sub_100017098(v132, v133, (uint64_t *)&v392);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();

  swift_bridgeObjectRelease();
  *(_WORD *)(v129 + 12) = 2080;
  SportingEventClockActivityStatus.breakType.getter();
  SportingEventClockBreakType.rawValue.getter();
  unint64_t v135 = v134;
  sub_1000B50F0();
  v136();
  uint64_t v137 = sub_1000B51B4();
  v397[0] = sub_100017098(v137, v135, v138);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();

  swift_bridgeObjectRelease();
  sub_1000B5194((void *)&_mh_execute_header, v139, v140, "Clock activity status: isBreak=%s, breakType=%s");
  swift_arrayDestroy();
  sub_10001C2C8();
  uint64_t v102 = v387;
  sub_10001C2C8();

LABEL_66:
  v143 = (void *)SportingEvent.clock.getter();
  v144 = (void *)dispatch thunk of SportingEventCurrentClock.total.getter();

  if (v144)
  {
    v145 = (void *)dispatch thunk of SportingEventClock.additional.getter();

    if (v145)
    {
      id v146 = v145;
      v147 = (void *)sub_1000B4FE4();
      os_log_type_t v148 = static os_log_type_t.debug.getter();
      if (sub_1000B5038(v148))
      {
        uint64_t v149 = sub_1000B5220();
        v397[0] = sub_100061A70();
        *(_DWORD *)uint64_t v149 = *(void *)(v106 + 312);
        id v392 = (id)dispatch thunk of SportingEventClock.minutes.getter();
        LOBYTE(v393) = v150 & 1;
        sub_100005E5C(&qword_1000FFAB0);
        uint64_t v106 = (uint64_t)&v392;
        uint64_t v151 = String.init<A>(describing:)();
        uint64_t v153 = sub_100017098(v151, v152, v397);
        sub_1000B5200(v153);

        swift_bridgeObjectRelease();
        *(_WORD *)(v149 + 12) = 2080;
        id v392 = (id)dispatch thunk of SportingEventClock.seconds.getter();
        LOBYTE(v393) = v154 & 1;
        uint64_t v155 = String.init<A>(describing:)();
        uint64_t v157 = sub_100017098(v155, v156, v397);
        sub_1000B5200(v157);

        swift_bridgeObjectRelease();
        sub_1000B5194((void *)&_mh_execute_header, v158, v159, "Clock injury time: minutes=%s, seconds=%s");
        swift_arrayDestroy();
        sub_10001C2C8();
        uint64_t v102 = v387;
        sub_10001C2C8();
      }
      else
      {
      }
    }
  }
  unint64_t v160 = SportingEvent.clock.getter();
  uint64_t v161 = dispatch thunk of SportingEventCurrentClock.periods.getter();

  if (!v161)
  {
    v164 = _swiftEmptyArrayStorage;
    goto LABEL_94;
  }
  if ((unint64_t)v161 >> 62)
  {
    if (v161 >= 0) {
      unint64_t v160 = v161 & 0xFFFFFFFFFFFFFF8;
    }
    else {
      unint64_t v160 = v161;
    }
    swift_bridgeObjectRetain();
    uint64_t v162 = _CocoaArrayWrapper.endIndex.getter();
    if (v162) {
      goto LABEL_74;
    }
  }
  else
  {
    uint64_t v162 = *(void *)((v161 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v162)
    {
LABEL_74:
      if (v162 < 1)
      {
        __break(1u);
        goto LABEL_226;
      }
      uint64_t v163 = 0;
      uint64_t v106 = v161 & 0xC000000000000001;
      v164 = _swiftEmptyArrayStorage;
      do
      {
        if (v106) {
          id v165 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id v165 = *(id *)(v161 + 8 * v163 + 32);
        }
        v166 = v165;
        v397[0] = (uint64_t)v165;
        sub_1000B46BC(v397, (uint64_t *)&v392);

        uint64_t v167 = v393;
        if (v393)
        {
          uint64_t v168 = (uint64_t)v392;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1000B5010();
            sub_10001574C();
            v164 = v171;
          }
          unint64_t v169 = v164[2];
          if (v169 >= v164[3] >> 1)
          {
            sub_10001574C();
            v164 = v172;
          }
          v164[2] = v169 + 1;
          v170 = &v164[2 * v169];
          v170[4] = v168;
          v170[5] = v167;
        }
        ++v163;
      }
      while (v162 != v163);
      goto LABEL_93;
    }
  }
  v164 = _swiftEmptyArrayStorage;
LABEL_93:
  swift_bridgeObjectRelease_n();
  uint64_t v102 = v387;
LABEL_94:
  if (v164[2])
  {
    swift_bridgeObjectRetain();
    v173 = sub_1000B4FE4();
    os_log_type_t v174 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v173, v174))
    {
      uint64_t v106 = sub_10001C638();
      id v392 = (id)sub_100046F5C();
      *(_DWORD *)uint64_t v106 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v175 = Array.description.getter();
      unint64_t v177 = v176;
      swift_bridgeObjectRelease();
      uint64_t v178 = sub_100017098(v175, v177, (uint64_t *)&v392);
      sub_1000B4FFC(v178);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      sub_1000B51C0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v173, v174, "AnnouncedAdditional: %s", (uint8_t *)v106, 0xCu);
      swift_arrayDestroy();
      sub_10001C2C8();
      sub_10001C2C8();
    }
    else
    {

      sub_1000B51C0();
    }
    uint64_t v102 = v387;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v179 = v102;
  v180 = sub_1000B4FE4();
  os_log_type_t v181 = static os_log_type_t.debug.getter();
  BOOL v182 = os_log_type_enabled(v180, v181);
  v364 = 0;
  if (v182)
  {
    v183 = (_DWORD *)sub_10001C638();
    id v392 = (id)sub_100046F5C();
    _DWORD *v183 = 136315138;
    uint64_t v106 = (uint64_t)v380;
    SportingEvent.progressStatus.getter();
    SportingEventProgressStatus.rawValue.getter();
    unint64_t v185 = v184;
    sub_1000B50F0();
    v187(v186);
    uint64_t v188 = sub_1000B51B4();
    uint64_t v190 = sub_100017098(v188, v185, v189);
    sub_1000B4FFC(v190);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    sub_1000B5100((void *)&_mh_execute_header, v180, v191, "Progress status: %s");
    sub_1000B511C();
    sub_10001C2C8();
    sub_10001C2C8();
  }
  else
  {
  }
  unint64_t v160 = v179;
  v192 = sub_1000B4FE4();
  int v193 = static os_log_type_t.debug.getter();
  BOOL v194 = os_log_type_enabled(v192, (os_log_type_t)v193);
  id v370 = (id)v160;
  if (!v194)
  {

    goto LABEL_131;
  }
  uint64_t v106 = sub_10001C638();
  uint64_t v195 = sub_100046F5C();
  id v392 = (id)v195;
  *(_DWORD *)uint64_t v106 = 136315138;
  unint64_t v196 = dispatch thunk of SportingEvent.competitors.getter();
  unint64_t v197 = v196;
  if (v196 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v198 = _CocoaArrayWrapper.endIndex.getter();
  }
  else
  {
    uint64_t v198 = *(void *)((v196 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  os_log_t v380 = v192;
  uint64_t v377 = v106;
  LODWORD(v376) = v193;
  unint64_t v375 = v195;
  if (v198)
  {
    if (v198 >= 1)
    {
      uint64_t v199 = 0;
      os_log_t v387 = (os_log_t)(v197 & 0xC000000000000001);
      sub_1000B51EC(enum case for SportingEventCompetitorScoreStatisticType.StatisticName.score(_:));
      uint64_t v106 = v200 + 104;
      v201 = (void (**)(uint8_t *, uint64_t))(v200 + 8);
      v202 = _swiftEmptyArrayStorage;
      v385 = (void (**)(uint64_t, uint64_t))v197;
      uint64_t v203 = v198;
      v204 = v390;
      do
      {
        if (v387) {
          id v205 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id v205 = *(id *)(v197 + 8 * v199 + 32);
        }
        v206 = v205;
        uint64_t v207 = v391;
        (*(void (**)(uint8_t *, void, void))v106)(v204, v386, v391);
        v208 = (void *)dispatch thunk of SportingEventCompetitorContainer.getScoreEntry(name:)();
        (*v201)(v204, v207);
        if (v208)
        {
          uint64_t v209 = SportingEventCompetitorScoreEntry.value.getter();

          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1000B50C0();
            sub_100015C08();
            v202 = v212;
          }
          unint64_t v197 = (unint64_t)v385;
          unint64_t v211 = v202[2];
          unint64_t v210 = v202[3];
          if (v211 >= v210 >> 1)
          {
            sub_1000B5154(v210);
            sub_100015C08();
            v202 = v213;
          }
          v202[2] = v211 + 1;
          v202[v211 + 4] = v209;
        }
        else
        {

          unint64_t v197 = (unint64_t)v385;
        }
        ++v199;
      }
      while (v203 != v199);
      goto LABEL_123;
    }
LABEL_226:
    __break(1u);
    goto LABEL_227;
  }
  v202 = _swiftEmptyArrayStorage;
LABEL_123:
  swift_bridgeObjectRelease_n();
  uint64_t v214 = v202[2];
  if (v214)
  {
    v397[0] = (uint64_t)_swiftEmptyArrayStorage;
    sub_1000B5168();
    sub_100017DA8();
    uint64_t v106 = 0;
    v215 = (void *)v397[0];
    do
    {
      uint64_t v396 = v202[v106 + 4];
      uint64_t v216 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v218 = v217;
      v397[0] = (uint64_t)v215;
      unint64_t v220 = v215[2];
      unint64_t v219 = v215[3];
      if (v220 >= v219 >> 1)
      {
        sub_1000B5098(v219);
        sub_100017DA8();
        v215 = (void *)v397[0];
      }
      ++v106;
      v215[2] = v220 + 1;
      v221 = &v215[2 * v220];
      v221[4] = v216;
      v221[5] = v218;
    }
    while (v214 != v106);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v215 = _swiftEmptyArrayStorage;
  }
  v222 = (uint8_t *)v377;
  v397[0] = (uint64_t)v215;
  sub_100005E5C(&qword_1000FC7D0);
  sub_100029B8C();
  sub_1000B5054();
  BidirectionalCollection<>.joined(separator:)();
  unint64_t v224 = v223;
  swift_bridgeObjectRelease();
  uint64_t v225 = sub_1000B51B4();
  v397[0] = sub_100017098(v225, v224, v226);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  id v227 = v370;

  swift_bridgeObjectRelease();
  os_log_t v228 = v380;
  _os_log_impl((void *)&_mh_execute_header, v380, (os_log_type_t)v376, "Scores: %s", v222, 0xCu);
  swift_arrayDestroy();
  sub_10001C2C8();
  sub_10001C2C8();

LABEL_131:
  unint64_t v229 = dispatch thunk of SportingEvent.competitors.getter();
  uint64_t v230 = v229;
  if (v229 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v231 = _CocoaArrayWrapper.endIndex.getter();
    if (v231) {
      goto LABEL_133;
    }
LABEL_148:
    v236 = _swiftEmptyArrayStorage;
    goto LABEL_149;
  }
  uint64_t v231 = *(void *)((v229 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v231) {
    goto LABEL_148;
  }
LABEL_133:
  if (v231 < 1) {
    goto LABEL_195;
  }
  uint64_t v232 = 0;
  os_log_t v387 = (os_log_t)(v230 & 0xC000000000000001);
  sub_1000B51EC(enum case for SportingEventCompetitorScoreStatisticType.StatisticName.shootout(_:));
  v234 = (void (**)(uint8_t *, void, void))(v233 + 104);
  v235 = (void (**)(uint8_t *, uint64_t))(v233 + 8);
  v236 = _swiftEmptyArrayStorage;
  v385 = (void (**)(uint64_t, uint64_t))v230;
  do
  {
    v237 = v236;
    if (v387) {
      id v238 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v238 = *(id *)(v230 + 8 * v232 + 32);
    }
    v239 = v238;
    v240 = v390;
    uint64_t v241 = v391;
    (*v234)(v390, v386, v391);
    v242 = (void *)dispatch thunk of SportingEventCompetitorContainer.getScoreEntry(name:)();
    (*v235)(v240, v241);
    if (v242)
    {
      uint64_t v243 = SportingEventCompetitorScoreEntry.value.getter();

      v236 = v237;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1000B5010();
        sub_100015C08();
        v236 = v246;
      }
      uint64_t v230 = (uint64_t)v385;
      unint64_t v245 = v236[2];
      unint64_t v244 = v236[3];
      if (v245 >= v244 >> 1)
      {
        sub_1000B5154(v244);
        sub_100015C08();
        v236 = v247;
      }
      v236[2] = v245 + 1;
      v236[v245 + 4] = v243;
    }
    else
    {

      v236 = v237;
      uint64_t v230 = (uint64_t)v385;
    }
    ++v232;
  }
  while (v231 != v232);
LABEL_149:
  swift_bridgeObjectRelease_n();
  if (v236[2])
  {
    swift_bridgeObjectRetain();
    v248 = sub_1000B4FE4();
    int v249 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v248, (os_log_type_t)v249))
    {
      v250 = (uint8_t *)sub_10001C638();
      uint64_t v251 = sub_100046F5C();
      id v392 = (id)v251;
      *(_DWORD *)v250 = 136315138;
      uint64_t v252 = v236[2];
      v253 = _swiftEmptyArrayStorage;
      v383 = v236;
      if (v252)
      {
        v386 = (void (**)(uint64_t, void, uint64_t))v251;
        LODWORD(v387) = v249;
        v390 = v250;
        *(void *)&long long v391 = v248;
        v397[0] = (uint64_t)_swiftEmptyArrayStorage;
        sub_1000B5168();
        sub_100017DA8();
        v253 = (void *)v397[0];
        v254 = v236 + 4;
        do
        {
          uint64_t v255 = *v254++;
          uint64_t v396 = v255;
          uint64_t v256 = dispatch thunk of CustomStringConvertible.description.getter();
          uint64_t v258 = v257;
          v397[0] = (uint64_t)v253;
          unint64_t v260 = v253[2];
          unint64_t v259 = v253[3];
          if (v260 >= v259 >> 1)
          {
            sub_1000B5098(v259);
            sub_100017DA8();
            v253 = (void *)v397[0];
          }
          v253[2] = v260 + 1;
          v261 = &v253[2 * v260];
          v261[4] = v256;
          v261[5] = v258;
          --v252;
        }
        while (v252);
        v248 = v391;
        v250 = v390;
        LOBYTE(v249) = (_BYTE)v387;
      }
      v397[0] = (uint64_t)v253;
      sub_100005E5C(&qword_1000FC7D0);
      sub_100029B8C();
      sub_1000B5054();
      BidirectionalCollection<>.joined(separator:)();
      unint64_t v263 = v262;
      swift_bridgeObjectRelease();
      uint64_t v264 = sub_1000B51B4();
      v397[0] = sub_100017098(v264, v263, v265);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v248, (os_log_type_t)v249, "Shootout scores: %s", v250, 0xCu);
      swift_arrayDestroy();
      sub_10001C2C8();
      sub_10001C2C8();
    }
    else
    {

      sub_1000B51C0();
    }
    uint64_t v231 = v381;
    unint64_t v266 = dispatch thunk of SportingEvent.competitors.getter();
    uint64_t v230 = v266;
    uint64_t v106 = v389;
    if (v266 >> 62) {
      goto LABEL_196;
    }
    uint64_t v267 = *(void *)((v266 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v267; uint64_t v267 = _CocoaArrayWrapper.endIndex.getter())
    {
      uint64_t v268 = 0;
      unint64_t v269 = v230 & 0xC000000000000001;
      uint64_t v374 = v230 + 32;
      LODWORD(v387) = enum case for SportingEventMetadataType.shootoutsContext(_:);
      v386 = (void (**)(uint64_t, void, uint64_t))(v365 + 104);
      v385 = (void (**)(uint64_t, uint64_t))(v365 + 8);
      v270 = _swiftEmptyArrayStorage;
      uint64_t v377 = v230;
      uint64_t v376 = v267;
      unint64_t v375 = v230 & 0xC000000000000001;
      while (1)
      {
        v271 = v269
             ? specialized _ArrayBuffer._getElementSlowPath(_:)()
             : *(id *)(v374 + 8 * v268);
        v272 = v271;
        if (__OFADD__(v268++, 1)) {
          break;
        }
        v274 = (void *)SportingEventCompetitorContainer.competitor.getter();
        unint64_t v275 = dispatch thunk of SportingEventCompetitor.metadata.getter();

        if (v275)
        {
          v383 = v270;
          if (v275 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v276 = _CocoaArrayWrapper.endIndex.getter();
            if (v276)
            {
LABEL_169:
              os_log_t v380 = v272;
              uint64_t v381 = v268;
              *(void *)&long long v391 = v275;
              v390 = (uint8_t *)(v275 & 0xC000000000000001);
              uint64_t v277 = 4;
              while (1)
              {
                uint64_t v278 = v276;
                id v279 = v390
                     ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
                     : *(id *)(v391 + 8 * v277);
                v280 = v279;
                uint64_t v281 = v277 - 3;
                if (__OFADD__(v277 - 4, 1)) {
                  break;
                }
                v282 = v388;
                SportingEventMetadata.metadataType.getter();
                (*v386)(v106, v387, v231);
                sub_1000B4F70(&qword_1000FD6C8, (void (*)(uint64_t))&type metadata accessor for SportingEventMetadataType);
                uint64_t v230 = v231;
                dispatch thunk of RawRepresentable.rawValue.getter();
                dispatch thunk of RawRepresentable.rawValue.getter();
                if (v392 == (id)v397[0] && v393 == v397[1])
                {
                  swift_bridgeObjectRelease_n();
                  v286 = *v385;
                  (*v385)(v106, v231);
                  v286((uint64_t)v282, v231);
LABEL_183:
                  swift_bridgeObjectRelease_n();
                  uint64_t v287 = SportingEventMetadata.value.getter();
                  uint64_t v289 = v288;

                  os_log_t v290 = v380;
                  v291 = (void *)SportingEventCompetitorContainer.competitor.getter();
                  uint64_t v292 = SportingEventCompetitor.canonicalId.getter();
                  uint64_t v294 = v293;

                  v295 = v383;
                  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                  {
                    sub_1000B5010();
                    sub_1000158A8();
                    v295 = v300;
                  }
                  uint64_t v106 = v389;
                  v296 = v295;
                  unint64_t v297 = v295[2];
                  v298 = v296;
                  if (v297 >= v296[3] >> 1)
                  {
                    sub_1000158A8();
                    v298 = v301;
                  }
                  v298[2] = v297 + 1;
                  v299 = &v298[4 * v297];
                  v270 = v298;
                  v299[4] = v292;
                  v299[5] = v294;
                  v299[6] = v287;
                  v299[7] = v289;
LABEL_188:
                  uint64_t v230 = v377;
                  uint64_t v267 = v376;
                  uint64_t v268 = v381;
                  unint64_t v269 = v375;
                  goto LABEL_191;
                }
                char v284 = _stringCompareWithSmolCheck(_:_:expecting:)();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                v285 = *v385;
                (*v385)(v106, v231);
                v285((uint64_t)v282, v231);
                if (v284) {
                  goto LABEL_183;
                }

                ++v277;
                uint64_t v276 = v278;
                uint64_t v106 = v389;
                if (v281 == v278)
                {

                  swift_bridgeObjectRelease_n();
                  v270 = v383;
                  goto LABEL_188;
                }
              }
              __break(1u);
              break;
            }
          }
          else
          {
            uint64_t v276 = *(void *)((v275 & 0xFFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain();
            if (v276) {
              goto LABEL_169;
            }
          }

          swift_bridgeObjectRelease_n();
          v270 = v383;
        }
        else
        {
        }
LABEL_191:
        if (v268 == v267) {
          goto LABEL_198;
        }
      }
      __break(1u);
LABEL_195:
      __break(1u);
LABEL_196:
      swift_bridgeObjectRetain();
    }
    v270 = _swiftEmptyArrayStorage;
LABEL_198:
    swift_bridgeObjectRelease_n();
    uint64_t v302 = v270[2];
    if (v302)
    {
      swift_bridgeObjectRetain();
      v383 = v270;
      v303 = v270 + 7;
      *(void *)&long long v304 = 136315394;
      long long v391 = v304;
      v390 = (uint8_t *)&type metadata for Any + 8;
      do
      {
        uint64_t v305 = *(v303 - 3);
        unint64_t v306 = *(v303 - 2);
        uint64_t v308 = *(v303 - 1);
        unint64_t v307 = *v303;
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        v309 = sub_1000B4FE4();
        os_log_type_t v310 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v309, v310))
        {
          uint64_t v311 = sub_1000B5220();
          id v392 = (id)sub_100061A70();
          *(_DWORD *)uint64_t v311 = v391;
          swift_bridgeObjectRetain();
          *(void *)(v311 + 4) = sub_100017098(v305, v306, (uint64_t *)&v392);
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v311 + 12) = 2080;
          swift_bridgeObjectRetain();
          *(void *)(v311 + 14) = sub_100017098(v308, v307, (uint64_t *)&v392);
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v309, v310, "Competitor: %s; Contextual shootout: %s)",
            (uint8_t *)v311,
            0x16u);
          swift_arrayDestroy();
          sub_10001C2C8();
          sub_10001C2C8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
        }
        v303 += 4;
        --v302;
      }
      while (v302);
      swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v312 = dispatch thunk of SportingEvent.coverage.getter();
  if (!v312) {
    return sub_1000B3064(v369);
  }
  v313 = (void *)v312;
  v314 = (void *)dispatch thunk of SportingEventCoverage.ingestion.getter();

  if (!v314) {
    return sub_1000B3064(v369);
  }
  unint64_t v160 = dispatch thunk of SportingEventCoverageIngestion.coverageUpdates.getter();

  if (!v160) {
    return sub_1000B3064(v369);
  }
  if (!(v160 >> 62))
  {
    uint64_t v315 = *(void *)((v160 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v315) {
      goto LABEL_210;
    }
LABEL_228:
    v319 = _swiftEmptyArrayStorage;
LABEL_229:
    sub_1000B51C0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v367 + 16))(v366, v384, v368);
    uint64_t v332 = swift_allocObject();
    *(void *)(v332 + 16) = v319;
    uint64_t v333 = swift_allocObject();
    *(void *)(v333 + 16) = sub_1000B4F08;
    *(void *)(v333 + 24) = v332;
    swift_bridgeObjectRetain();
    swift_retain();
    v334 = Logger.logObject.getter();
    int v335 = static os_log_type_t.debug.getter();
    uint64_t v336 = swift_allocObject();
    *(unsigned char *)(v336 + 16) = 32;
    uint64_t v337 = swift_allocObject();
    *(unsigned char *)(v337 + 16) = 8;
    uint64_t v338 = swift_allocObject();
    *(void *)(v338 + 16) = sub_1000B4F10;
    *(void *)(v338 + 24) = v333;
    uint64_t v339 = swift_allocObject();
    *(void *)(v339 + 16) = sub_1000B4F60;
    *(void *)(v339 + 24) = v338;
    sub_100005E5C(&qword_1000FFAA8);
    uint64_t v340 = swift_initStackObject();
    *(_OWORD *)(v340 + 16) = xmmword_1000CB3B0;
    *(void *)(v340 + 32) = sub_1000B4F1C;
    *(void *)(v340 + 40) = v336;
    *(void *)(v340 + 48) = sub_1000B4FD8;
    *(void *)(v340 + 56) = v337;
    *(void *)(v340 + 64) = sub_1000B4F68;
    *(void *)(v340 + 72) = v339;
    swift_setDeallocating();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_10009C1F0();
    LODWORD(v388) = v335;
    if (os_log_type_enabled(v334, (os_log_type_t)v335))
    {
      uint64_t v384 = v339;
      uint64_t v341 = v367;
      v385 = (void (**)(uint64_t, uint64_t))v338;
      uint64_t v342 = v368;
      v386 = (void (**)(uint64_t, void, uint64_t))v333;
      *(void *)&long long v391 = v332;
      os_log_t v387 = v334;
      uint64_t v343 = sub_10001C638();
      uint64_t v381 = sub_100046F5C();
      id v392 = (id)v381;
      *(_WORD *)uint64_t v343 = 258;
      *(unsigned char *)(v343 + 2) = 32;
      swift_release();
      v383 = (void *)v343;
      *(unsigned char *)(v343 + 3) = 8;
      swift_release();
      uint64_t v344 = v319[2];
      if (v344)
      {
        v397[0] = (uint64_t)_swiftEmptyArrayStorage;
        sub_1000B5168();
        sub_100017DA8();
        v390 = *(uint8_t **)(v373 + 16);
        v345 = (char *)v319
             + ((*(unsigned __int8 *)(v373 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v373 + 80));
        uint64_t v389 = *(void *)(v373 + 72);
        v346 = (void (**)(uint64_t, uint64_t))(v373 + 8);
        do
        {
          uint64_t v347 = v372;
          uint64_t v348 = v382;
          ((void (*)(uint64_t, char *, uint64_t))v390)(v372, v345, v382);
          uint64_t v349 = IngestionError.rawValue.getter();
          uint64_t v351 = v350;
          (*v346)(v347, v348);
          uint64_t v352 = v397[0];
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1000B5168();
            sub_100017DA8();
            uint64_t v352 = v397[0];
          }
          unint64_t v354 = *(void *)(v352 + 16);
          unint64_t v353 = *(void *)(v352 + 24);
          if (v354 >= v353 >> 1)
          {
            sub_1000B5098(v353);
            sub_100017DA8();
            uint64_t v352 = v397[0];
          }
          *(void *)(v352 + 16) = v354 + 1;
          uint64_t v355 = v352 + 16 * v354;
          *(void *)(v355 + 32) = v349;
          *(void *)(v355 + 40) = v351;
          v345 += v389;
          --v344;
        }
        while (v344);
        uint64_t v342 = v368;
        uint64_t v357 = v367;
      }
      else
      {
        uint64_t v357 = v341;
      }
      v358 = (uint8_t *)v383;
      uint64_t v359 = Array.description.getter();
      unint64_t v361 = v360;
      swift_bridgeObjectRelease();
      uint64_t v362 = sub_100017098(v359, v361, (uint64_t *)&v392);
      sub_1000B4FFC(v362);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      os_log_t v363 = v387;
      _os_log_impl((void *)&_mh_execute_header, v387, (os_log_type_t)v388, "Ingestion Errors: %s", v358, 0xCu);
      swift_arrayDestroy();
      sub_10001C2C8();
      sub_10001C2C8();

      (*(void (**)(uint64_t, uint64_t))(v357 + 8))(v366, v342);
    }
    else
    {

      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      sub_1000B50F0();
      v356();
    }
    return sub_1000B3064(v369);
  }
LABEL_227:
  swift_bridgeObjectRetain();
  uint64_t result = _CocoaArrayWrapper.endIndex.getter();
  uint64_t v315 = result;
  if (!result) {
    goto LABEL_228;
  }
LABEL_210:
  if (v315 >= 1)
  {
    uint64_t v317 = 0;
    v318 = (void (**)(uint64_t, uint64_t, uint64_t))(v373 + 32);
    v319 = _swiftEmptyArrayStorage;
    uint64_t v320 = v371;
    do
    {
      if ((v160 & 0xC000000000000001) != 0) {
        id v321 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v321 = *(id *)(v160 + 8 * v317 + 32);
      }
      v322 = v321;
      uint64_t v323 = v379;
      dispatch thunk of SportingEventCoverageIngestionUpdate.statusCode.getter();

      uint64_t v324 = v382;
      if (sub_1000082E8(v323, 1, v382) == 1)
      {
        sub_100037ED0(v323, &qword_1000FFA98);
      }
      else
      {
        v325 = *v318;
        (*v318)(v320, v323, v324);
        v325(v378, v320, v324);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          char v328 = sub_1000B50C0();
          v319 = (void *)sub_100015BC0(v328, v329, v330, v331);
        }
        unint64_t v327 = v319[2];
        unint64_t v326 = v319[3];
        if (v327 >= v326 >> 1) {
          v319 = (void *)sub_100015BC0(v326 > 1, v327 + 1, 1, (uint64_t)v319);
        }
        v319[2] = v327 + 1;
        v325((uint64_t)v319+ ((*(unsigned __int8 *)(v373 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v373 + 80))+ *(void *)(v373 + 72) * v327, v378, v382);
      }
      ++v317;
    }
    while (v315 != v317);
    goto LABEL_229;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000B24F4(uint64_t a1)
{
  uint64_t v2 = sub_100005E5C(&qword_1000FD690);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for SportingEventViewContext();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    sub_1000082C0((uint64_t)v4, 1, 1, v5);
    return sub_100037ED0((uint64_t)v4, &qword_1000FD690);
  }
  SportingEventSubscription.view.getter();
  if (sub_1000082E8((uint64_t)v4, 1, v5) == 1) {
    return sub_100037ED0((uint64_t)v4, &qword_1000FD690);
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  uint64_t v9 = SportingEventViewContext.mode.getter();
  uint64_t v11 = &selRef_setRemoteObjectInterface_;
  uint64_t v12 = &loc_1000CA000;
  if (v10)
  {
    unint64_t v13 = v10;
    uint64_t v33 = v9;
    if (qword_1000FBDC0 != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    sub_10000929C(v14, (uint64_t)qword_10010A508);
    swift_bridgeObjectRetain();
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v34 = v6;
      v36[0] = v18;
      *(_DWORD *)uint64_t v17 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_100017098(v33, v13, v36);
      uint64_t v12 = (void *)&loc_1000CA000;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Mode: %s", v17, 0xCu);
      swift_arrayDestroy();
      uint64_t v6 = v34;
      swift_slowDealloc();
      uint64_t v11 = &selRef_setRemoteObjectInterface_;
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  if (SportingEventViewContext.players.getter())
  {
    if (v11[440] != (char *)-1) {
      swift_once();
    }
    uint64_t v20 = type metadata accessor for Logger();
    sub_10000929C(v20, (uint64_t)qword_10010A508);
    swift_bridgeObjectRetain();
    uint64_t v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      v36[0] = v33;
      uint64_t v24 = v12[371];
      uint64_t v34 = v6;
      *(_DWORD *)uint64_t v23 = v24;
      v32[1] = v23 + 4;
      swift_bridgeObjectRetain();
      uint64_t v25 = Array.description.getter();
      unint64_t v27 = v26;
      swift_bridgeObjectRelease();
      uint64_t v35 = sub_100017098(v25, v27, v36);
      uint64_t v6 = v34;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Players: %s", v23, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  uint64_t v28 = SportingEventViewContext.statistics.getter();
  if (v28)
  {
    uint64_t v29 = *(void *)(v28 + 16);
    if (v29)
    {
      uint64_t v30 = (uint64_t *)(v28 + 40);
      do
      {
        uint64_t v31 = *v30;
        v36[0] = *(v30 - 1);
        v36[1] = v31;
        swift_bridgeObjectRetain();
        sub_1000B29FC(v36);
        swift_bridgeObjectRelease();
        v30 += 2;
        --v29;
      }
      while (v29);
    }
    swift_bridgeObjectRelease();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1000B29FC(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100005E5C(qword_1000FFAE0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *a1;
  unint64_t v8 = a1[1];
  swift_bridgeObjectRetain();
  uint64_t v29 = v7;
  SportingEventCompetitorStatisticType.StatisticName.init(rawValue:)();
  unint64_t v9 = dispatch thunk of SportingEvent.competitors.getter();
  uint64_t v31 = v6;
  uint64_t v33 = v6;
  sub_1000AF7F8((void (*)(uint64_t *__return_ptr, id *))sub_1000B4FB8, (uint64_t)v32, v9);
  uint64_t v11 = v10;
  uint64_t v30 = v2;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(v11 + 16);
  if (v12)
  {
    unint64_t v28 = v8;
    uint64_t v36 = _swiftEmptyArrayStorage;
    sub_100017DA8();
    unint64_t v13 = v36;
    v27[1] = v11;
    uint64_t v14 = (unsigned char *)(v11 + 40);
    do
    {
      if (*v14)
      {
        unint64_t v15 = 0xE300000000000000;
        uint64_t v16 = 4271950;
      }
      else
      {
        uint64_t v34 = 0;
        unint64_t v35 = 0xE000000000000000;
        Double.write<A>(to:)();
        uint64_t v16 = (uint64_t)v34;
        unint64_t v15 = v35;
      }
      uint64_t v36 = v13;
      unint64_t v17 = v13[2];
      if (v17 >= v13[3] >> 1)
      {
        sub_100017DA8();
        unint64_t v13 = v36;
      }
      v13[2] = v17 + 1;
      uint64_t v18 = &v13[2 * v17];
      v18[4] = v16;
      v18[5] = v15;
      v14 += 16;
      --v12;
    }
    while (v12);
    swift_bridgeObjectRelease();
    unint64_t v8 = v28;
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v13 = _swiftEmptyArrayStorage;
  }
  uint64_t v34 = v13;
  sub_100005E5C(&qword_1000FC7D0);
  sub_100029B8C();
  uint64_t v19 = BidirectionalCollection<>.joined(separator:)();
  unint64_t v21 = v20;
  swift_bridgeObjectRelease();
  if (qword_1000FBDC0 != -1) {
    swift_once();
  }
  uint64_t v22 = type metadata accessor for Logger();
  sub_10000929C(v22, (uint64_t)qword_10010A508);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v23 = Logger.logObject.getter();
  os_log_type_t v24 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = swift_slowAlloc();
    uint64_t v34 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v36 = (void *)sub_100017098(v29, v8, (uint64_t *)&v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v25 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v36 = (void *)sub_100017098(v19, v21, (uint64_t *)&v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "Statistic '%s': %s", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  return sub_100037ED0((uint64_t)v31, qword_1000FFAE0);
}

uint64_t sub_1000B2E00@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for SportingEventCompetitorStatisticType.StatisticName();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100005E5C(qword_1000FFAE0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002A418(a1, (uint64_t)v11, qword_1000FFAE0);
  uint64_t result = sub_1000082E8((uint64_t)v11, 1, v5);
  if (result == 1)
  {
    uint64_t v13 = 0;
    char v14 = 1;
LABEL_5:
    *(void *)a2 = v13;
    *(unsigned char *)(a2 + 8) = v14;
    return result;
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v11, v5);
  sub_1000B2FD8((uint64_t)&v15);
  if (!v2)
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v13 = v15;
    char v14 = v16 & 1;
    goto LABEL_5;
  }
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  __break(1u);
  return result;
}

void sub_1000B2FD8(uint64_t a1@<X8>)
{
  uint64_t v2 = (void *)SportingEventCompetitorContainer.competitor.getter();
  uint64_t v3 = (void *)dispatch thunk of SportingEventCompetitor.getStatistic(name:)();

  if (v3)
  {
    SportingEventCompetitorStatistic.value.getter();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  *(void *)a1 = v5;
  *(unsigned char *)(a1 + 8) = v3 == 0;
}

uint64_t sub_1000B3064(void *a1)
{
  id v156 = a1;
  uint64_t v138 = type metadata accessor for SportingEventPlay.BaseballPlay();
  unint64_t v1 = *(void *)(v138 - 8);
  __chkstk_darwin(v138);
  uint64_t v137 = (char *)&v134 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v173 = type metadata accessor for SportingEventCompetitorContainer.BaseballScores();
  uint64_t v3 = *(void *)(v173 - 8);
  __chkstk_darwin(v173);
  v172 = (char *)&v134 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  p_Class isa = (void *)type metadata accessor for Sport();
  unint64_t v6 = *(p_isa - 1);
  __chkstk_darwin(p_isa);
  unint64_t v8 = (unint64_t)&v134 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v134 - v10;
  uint64_t v169 = type metadata accessor for SportingEventPlayAnnotation();
  uint64_t v139 = *(void *)(v169 - 8);
  __chkstk_darwin(v169);
  uint64_t v168 = (char *)&v134 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v155 = type metadata accessor for CharacterSet();
  unint64_t v13 = *(void *)(v155 - 8);
  __chkstk_darwin(v155);
  char v154 = (char *)&v134 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v15 = dispatch thunk of SportingEvent.plays.getter();
  uint64_t v17 = v15;
  if (v15 >> 62) {
    goto LABEL_120;
  }
  for (uint64_t i = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10); i; uint64_t i = _CocoaArrayWrapper.endIndex.getter())
  {
    unint64_t v153 = v17 & 0xC000000000000001;
    uint64_t v141 = v17 & 0xFFFFFFFFFFFFFF8;
    uint64_t v140 = v17 + 32;
    unint64_t v152 = (void (**)(char *, uint64_t))(v13 + 8);
    uint64_t v163 = v175;
    v166 = (void (**)(char *, uint64_t))(v139 + 8);
    uint64_t v167 = v139 + 16;
    unsigned int v147 = enum case for Sport.baseball(_:);
    id v146 = (void (**)(unint64_t, void, void *))(v6 + 104);
    v145 = (void (**)(unint64_t, void *))(v6 + 8);
    v171 = (v3 + 8);
    v136 = (void (**)(char *, uint64_t))(v1 + 8);
    unint64_t v1 = 0;
    *(void *)&long long v16 = 134219778;
    long long v143 = v16;
    *(void *)&long long v16 = 134218754;
    long long v135 = v16;
    long long v134 = xmmword_1000CABA0;
    v142 = (char *)&type metadata for Any + 8;
    uint64_t v162 = p_isa;
    unint64_t v161 = v8;
    v164 = v11;
    uint64_t v150 = i;
    uint64_t v151 = v17;
    while (1)
    {
      if (v153)
      {
        id v19 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        if (v1 >= *(void *)(v141 + 16)) {
          goto LABEL_118;
        }
        id v19 = *(id *)(v140 + 8 * v1);
      }
      unint64_t v6 = (unint64_t)v19;
      if (__OFADD__(v1++, 1)) {
        goto LABEL_116;
      }
      id v165 = v1;
      uint64_t v178 = 0;
      unint64_t v179 = 0xE000000000000000;
      uint64_t v21 = dispatch thunk of SportingEventPlay.clock.getter();
      if (v21)
      {
        uint64_t v22 = (void *)v21;
        uint64_t v3 = dispatch thunk of SportingEventClock.minutes.getter();
        char v24 = v23;

        if ((v24 & 1) == 0)
        {
          uint64_t v25 = dispatch thunk of SportingEventPlay.clock.getter();
          if (v25)
          {
            unint64_t v26 = (void *)v25;
            uint64_t v27 = dispatch thunk of SportingEventClock.seconds.getter();
            char v29 = v28;

            if ((v29 & 1) == 0)
            {
              os_log_type_t v174 = v3;
              uint64_t v3 = (uint64_t)&type metadata for Int;
              unint64_t v176 = dispatch thunk of CustomStringConvertible.description.getter();
              unint64_t v177 = v30;
              v31._countAndFlagsBits = 58;
              v31._object = (void *)0xE100000000000000;
              String.append(_:)(v31);
              sub_100005E5C(&qword_1000FC8A8);
              uint64_t v32 = swift_allocObject();
              *(_OWORD *)(v32 + 16) = v134;
              *(void *)(v32 + 56) = &type metadata for Int;
              *(void *)(v32 + 64) = &protocol witness table for Int;
              *(void *)(v32 + 32) = v27;
              v33._countAndFlagsBits = String.init(format:_:)();
              String.append(_:)(v33);
              swift_bridgeObjectRelease();
              uint64_t v34 = v176;
              unint64_t v35 = v177;
              swift_beginAccess();
              uint64_t v178 = v34;
              unint64_t v179 = v35;
              swift_bridgeObjectRelease();
            }
          }
        }
      }
      unint64_t v36 = dispatch thunk of SportingEventPlay.competitors.getter();
      unint64_t v1 = v36;
      if (v36 >> 62) {
        break;
      }
      unint64_t v13 = *(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v13) {
        goto LABEL_16;
      }
LABEL_38:
      swift_bridgeObjectRelease();
      uint64_t v3 = (uint64_t)_swiftEmptyArrayStorage;
LABEL_39:
      unint64_t v176 = v3;
      uint64_t v46 = sub_100005E5C(&qword_1000FC7D0);
      unint64_t v47 = sub_100029B8C();
      uint64_t v160 = v46;
      unint64_t v159 = v47;
      uint64_t v48 = BidirectionalCollection<>.joined(separator:)();
      unint64_t v50 = v49;
      swift_bridgeObjectRelease();
      unint64_t v176 = SportingEventPlay.playDescription.getter();
      unint64_t v177 = v51;
      uint64_t v52 = v154;
      static CharacterSet.whitespacesAndNewlines.getter();
      sub_10000CC08();
      uint64_t v53 = StringProtocol.trimmingCharacters(in:)();
      unint64_t v55 = v54;
      (*v152)(v52, v155);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v56 = HIBYTE(v55) & 0xF;
      if ((v55 & 0x2000000000000000) == 0) {
        uint64_t v56 = v53 & 0xFFFFFFFFFFFFLL;
      }
      if (!v56)
      {
        if (qword_1000FBDC0 != -1) {
          swift_once();
        }
        uint64_t v57 = type metadata accessor for Logger();
        sub_10000929C(v57, (uint64_t)qword_10010A508);
        unint64_t v58 = Logger.logObject.getter();
        os_log_type_t v59 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v58, v59))
        {
          BOOL v60 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)BOOL v60 = 0;
          _os_log_impl((void *)&_mh_execute_header, v58, v59, "Blank Play:", v60, 2u);
          swift_slowDealloc();
        }
      }
      if (qword_1000FBDC0 != -1) {
        swift_once();
      }
      uint64_t v61 = type metadata accessor for Logger();
      uint64_t v62 = sub_10000929C(v61, (uint64_t)qword_10010A508);
      uint64_t v3 = (uint64_t)(id)v6;
      swift_bridgeObjectRetain();
      uint64_t v158 = v62;
      unint64_t v63 = Logger.logObject.getter();
      int v64 = static os_log_type_t.debug.getter();
      BOOL v65 = os_log_type_enabled(v63, (os_log_type_t)v64);
      v170 = v3;
      if (v65)
      {
        int v149 = v64;
        os_log_t v157 = v63;
        uint64_t v66 = swift_slowAlloc();
        os_log_type_t v148 = swift_slowAlloc();
        unint64_t v176 = v148;
        *(_DWORD *)uint64_t v66 = v143;
        os_log_type_t v174 = v165;
        unint64_t v13 = (unint64_t)v163;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v66 + 12) = 2080;
        uint64_t v67 = dispatch thunk of SportingEventPlay.id.getter();
        if (v68)
        {
          unint64_t v69 = v68;
        }
        else
        {
          uint64_t v67 = 1819047278;
          unint64_t v69 = 0xE400000000000000;
        }
        os_log_type_t v174 = sub_100017098(v67, v69, (uint64_t *)&v176);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        *(_WORD *)(v66 + 22) = 2048;
        uint64_t v70 = dispatch thunk of SportingEventPlay.stamp.getter();
        char v72 = v71;

        if (v72) {
          uint64_t v73 = -1;
        }
        else {
          uint64_t v73 = v70;
        }
        os_log_type_t v174 = v73;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        *(_WORD *)(v66 + 32) = 2080;
        swift_beginAccess();
        uint64_t v74 = v48;
        uint64_t v75 = (uint64_t)v178;
        unint64_t v76 = v179;
        swift_bridgeObjectRetain();
        os_log_type_t v174 = sub_100017098(v75, v76, (uint64_t *)&v176);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        *(_WORD *)(v66 + 42) = 2080;
        swift_bridgeObjectRetain();
        os_log_type_t v174 = sub_100017098(v74, v50, (uint64_t *)&v176);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v66 + 52) = 2080;
        uint64_t v77 = SportingEventPlay.playDescription.getter();
        os_log_type_t v174 = sub_100017098(v77, v78, (uint64_t *)&v176);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        *(_WORD *)(v66 + 62) = 2080;
        dispatch thunk of SportingEventPlay.levels.getter();
        type metadata accessor for SportingEventPlayLevel();
        uint64_t v79 = Array.description.getter();
        unint64_t v81 = v80;
        swift_bridgeObjectRelease();
        os_log_type_t v174 = sub_100017098(v79, v81, (uint64_t *)&v176);
        uint64_t v82 = v170;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        *(_WORD *)(v66 + 72) = 2080;
        uint64_t v83 = dispatch thunk of SportingEventPlay.annotations.getter();
        if (v83)
        {
          uint64_t v84 = *(void *)(v83 + 16);
          uint64_t v144 = v83;
          if (v84)
          {
            unint64_t v85 = v83 + ((*(unsigned __int8 *)(v139 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v139 + 80));
            uint64_t v86 = *(void *)(v139 + 72);
            uint64_t v87 = *(void (**)(char *, unint64_t, uint64_t))(v139 + 16);
            char v88 = _swiftEmptyArrayStorage;
            do
            {
              unint64_t v90 = v168;
              uint64_t v89 = v169;
              v87(v168, v85, v169);
              uint64_t v91 = SportingEventPlayAnnotation.rawValue.getter();
              uint64_t v93 = v92;
              (*v166)(v90, v89);
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                sub_10001574C();
                char v88 = v95;
              }
              unint64_t v13 = v88[2];
              if (v13 >= v88[3] >> 1)
              {
                sub_10001574C();
                char v88 = v96;
              }
              v88[2] = v13 + 1;
              uint64_t v94 = &v88[2 * v13];
              v94[4] = v91;
              v94[5] = v93;
              v85 += v86;
              --v84;
            }
            while (v84);
          }
          swift_bridgeObjectRelease();
          p_Class isa = v162;
          unint64_t v8 = v161;
        }
        uint64_t v11 = v164;
        uint64_t v97 = Array.description.getter();
        unint64_t v6 = v98;
        swift_bridgeObjectRelease();
        os_log_type_t v174 = sub_100017098(v97, v6, (uint64_t *)&v176);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        uint64_t v3 = (uint64_t)v170;

        swift_bridgeObjectRelease();
        os_log_t v99 = v157;
        _os_log_impl((void *)&_mh_execute_header, v157, (os_log_type_t)v149, "Play[%ld], id: %s, play stamp: %ld, play clock: %s, play score: %s - %s, play levels: %s, play annotations: %s", (uint8_t *)v66, 0x52u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      unint64_t v1 = (unint64_t)v165;
      if (v156)
      {
        os_log_t v157 = (os_log_t)v156;
        SportingEventSubscription.sport.getter();
        Sport.init(rawValue:)();
        (*v146)(v8, v147, p_isa);
        sub_1000B4F70(&qword_1000FE2D0, (void (*)(uint64_t))&type metadata accessor for Sport);
        dispatch thunk of RawRepresentable.rawValue.getter();
        dispatch thunk of RawRepresentable.rawValue.getter();
        if (v176 == v174 && v177 == v175[0])
        {
          swift_bridgeObjectRelease_n();
          os_log_type_t v104 = (void (*)(char *, void *))*v145;
          (*v145)(v8, p_isa);
          v104(v11, p_isa);
        }
        else
        {
          uint64_t v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v101 = (void (*)(char *, void *))*v145;
          (*v145)(v8, p_isa);
          v101(v11, p_isa);
          if ((v3 & 1) == 0)
          {

            os_log_t v102 = v170;
            goto LABEL_105;
          }
        }
        unint64_t v105 = dispatch thunk of SportingEventPlay.competitors.getter();
        unint64_t v1 = v105;
        if (v105 >> 62)
        {
          uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
          if (v3)
          {
LABEL_80:
            unint64_t v176 = _swiftEmptyArrayStorage;
            uint64_t v17 = (uint64_t)&v176;
            sub_100017DA8();
            if ((v3 & 0x8000000000000000) == 0)
            {
              uint64_t v11 = (char *)(v1 & 0xC000000000000001);
              p_Class isa = (void *)(v1 & 0xFFFFFFFFFFFFFF8);
              unint64_t v8 = v3 + 3;
              while (v8 != 0x8000000000000003)
              {
                unint64_t v106 = v8 - 4;
                if (v11)
                {
                  id v107 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
                }
                else
                {
                  if ((v106 & 0x8000000000000000) != 0) {
                    goto LABEL_114;
                  }
                  if (v106 >= *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                    goto LABEL_115;
                  }
                  id v107 = *(id *)(v1 + 8 * v8);
                }
                uint64_t v108 = v107;
                uint64_t v109 = v172;
                SportingEventCompetitorContainer.baseballScores.getter();
                sub_1000B4F70(&qword_1000FFAD0, (void (*)(uint64_t))&type metadata accessor for SportingEventCompetitorContainer.BaseballScores);
                uint64_t v17 = (uint64_t)v109;
                uint64_t v110 = v173;
                unint64_t v6 = dispatch thunk of CustomStringConvertible.description.getter();
                unint64_t v112 = v111;
                ((void (*)(char *, uint64_t))v171->isa)(v109, v110);

                uint64_t v3 = (uint64_t)v176;
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                {
                  uint64_t v17 = (uint64_t)&v176;
                  sub_100017DA8();
                  uint64_t v3 = (uint64_t)v176;
                }
                unint64_t v13 = *(void *)(v3 + 16);
                if (v13 >= *(void *)(v3 + 24) >> 1)
                {
                  uint64_t v17 = (uint64_t)&v176;
                  sub_100017DA8();
                  uint64_t v3 = (uint64_t)v176;
                }
                *(void *)(v3 + 16) = v13 + 1;
                uint64_t v113 = (v3 + 16 * v13);
                v113[4].Class isa = (Class)v6;
                v113[5].Class isa = v112;
                if (--v8 == 3)
                {
                  swift_bridgeObjectRelease();
                  p_Class isa = v162;
                  unint64_t v8 = v161;
                  uint64_t v11 = v164;
                  goto LABEL_96;
                }
              }
              goto LABEL_111;
            }
            goto LABEL_119;
          }
        }
        else
        {
          uint64_t v3 = *(void *)((v105 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (v3) {
            goto LABEL_80;
          }
        }
        swift_bridgeObjectRelease();
        uint64_t v3 = (uint64_t)_swiftEmptyArrayStorage;
LABEL_96:
        unint64_t v176 = v3;
        uint64_t v114 = BidirectionalCollection<>.joined(separator:)();
        unint64_t v6 = v115;
        swift_bridgeObjectRelease();
        uint64_t v116 = v170;
        swift_bridgeObjectRetain();
        uint64_t v3 = Logger.logObject.getter();
        int v117 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled((os_log_t)v3, (os_log_type_t)v117))
        {
          LODWORD(v159) = v117;
          unint64_t v13 = swift_slowAlloc();
          v170 = swift_slowAlloc();
          unint64_t v176 = v170;
          *(_DWORD *)unint64_t v13 = v135;
          os_log_type_t v174 = v165;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *(_WORD *)(v13 + 12) = 2080;
          uint64_t v160 = v114;
          uint64_t v118 = v137;
          SportingEventPlay.baseballPlay.getter();
          sub_1000B4F70(&qword_1000FFAD8, (void (*)(uint64_t))&type metadata accessor for SportingEventPlay.BaseballPlay);
          uint64_t v119 = v138;
          uint64_t v120 = dispatch thunk of CustomStringConvertible.description.getter();
          unint64_t v122 = v121;
          (*v136)(v118, v119);
          os_log_type_t v174 = sub_100017098(v120, v122, (uint64_t *)&v176);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();

          swift_bridgeObjectRelease();
          *(_WORD *)(v13 + 22) = 2080;
          swift_bridgeObjectRetain();
          os_log_type_t v174 = sub_100017098(v160, v6, (uint64_t *)&v176);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v13 + 32) = 2080;
          uint64_t v123 = dispatch thunk of SportingEventPlay.clock.getter();
          if (v123)
          {
            v124 = (void *)v123;
            uint64_t v125 = (void *)SportingEventClock.period.getter();

            uint64_t v126 = (void *)dispatch thunk of SportingEventClockPeriod.subPeriod.getter();
            p_Class isa = v162;
            unint64_t v8 = v161;
            uint64_t v11 = v164;
            os_log_type_t v127 = v159;
            if (!v126
              || (uint64_t v128 = dispatch thunk of SportingEventClockPeriod.index.getter(),
                  unint64_t v6 = v129,
                  v126,
                  (v6 & 1) != 0))
            {
              unint64_t v132 = 0xE400000000000000;
              uint64_t v130 = 1819047278;
            }
            else
            {
              os_log_type_t v174 = v128;
              uint64_t v130 = dispatch thunk of CustomStringConvertible.description.getter();
              unint64_t v132 = v131;
            }
          }
          else
          {
            unint64_t v132 = 0xE400000000000000;
            uint64_t v130 = 1819047278;
            p_Class isa = v162;
            unint64_t v8 = v161;
            uint64_t v11 = v164;
            os_log_type_t v127 = v159;
          }
          os_log_type_t v174 = sub_100017098(v130, v132, (uint64_t *)&v176);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();

          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, v127, "Play_baseball[%ld]: %s, Scores: %s SubPeriod: %s", (uint8_t *)v13, 0x2Au);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          os_log_t v102 = v157;
LABEL_105:
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        swift_bridgeObjectRelease();
        uint64_t v17 = v151;
        uint64_t v103 = v150;
        unint64_t v1 = (unint64_t)v165;
        goto LABEL_107;
      }

      swift_bridgeObjectRelease();
      uint64_t v17 = v151;
      uint64_t v103 = v150;
LABEL_107:
      if (v1 == v103) {
        return swift_bridgeObjectRelease();
      }
    }
    unint64_t v13 = _CocoaArrayWrapper.endIndex.getter();
    if (!v13) {
      goto LABEL_38;
    }
LABEL_16:
    os_log_type_t v174 = _swiftEmptyArrayStorage;
    uint64_t v17 = (uint64_t)&v174;
    sub_100017DA8();
    if ((v13 & 0x8000000000000000) != 0) {
      goto LABEL_117;
    }
    v170 = v6;
    uint64_t v3 = (uint64_t)v174;
    uint64_t v11 = (char *)(v1 & 0xFFFFFFFFFFFFFF8);
    unint64_t v6 = v13 + 3;
    while (2)
    {
      if (v6 != 0x8000000000000003)
      {
        unint64_t v37 = v6 - 4;
        if ((v1 & 0xC000000000000001) != 0)
        {
          id v38 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else
        {
          if ((v37 & 0x8000000000000000) != 0) {
            goto LABEL_112;
          }
          if (v37 >= *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_113;
          }
          id v38 = *(id *)(v1 + 8 * v6);
        }
        unint64_t v13 = (unint64_t)v38;
        unint64_t v176 = 0;
        unint64_t v177 = 0xE000000000000000;
        uint64_t v39 = (void *)SportingEventCompetitorContainer.score.getter();
        unint64_t v40 = SportingEventCompetitorScore.scoreEntries.getter();

        if (v40 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v17 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
          if (!v17) {
            goto LABEL_31;
          }
LABEL_26:
          if ((v40 & 0xC000000000000001) != 0)
          {
            id v41 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else
          {
            if (!*(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_110;
            }
            id v41 = *(id *)(v40 + 32);
          }
          os_log_type_t v42 = v41;
          swift_bridgeObjectRelease();
          uint64_t v43 = SportingEventCompetitorScoreEntry.value.getter();
        }
        else
        {
          uint64_t v17 = *(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (v17) {
            goto LABEL_26;
          }
LABEL_31:
          swift_bridgeObjectRelease();
          uint64_t v43 = -1;
        }
        v175[1] = v43;
        v44._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
        uint64_t v17 = (uint64_t)&v176;
        String.append(_:)(v44);

        swift_bridgeObjectRelease();
        p_Class isa = &v176->isa;
        unint64_t v8 = v177;
        os_log_type_t v174 = v3;
        unint64_t v13 = *(void *)(v3 + 16);
        if (v13 >= *(void *)(v3 + 24) >> 1)
        {
          uint64_t v17 = (uint64_t)&v174;
          sub_100017DA8();
          uint64_t v3 = (uint64_t)v174;
        }
        *(void *)(v3 + 16) = v13 + 1;
        id v45 = (v3 + 16 * v13);
        v45[4].Class isa = (Class)p_isa;
        v45[5].Class isa = (Class)v8;
        if (--v6 == 3)
        {
          swift_bridgeObjectRelease();
          p_Class isa = v162;
          unint64_t v8 = v161;
          uint64_t v11 = v164;
          unint64_t v6 = (unint64_t)v170;
          goto LABEL_39;
        }
        continue;
      }
      break;
    }
    __break(1u);
LABEL_110:
    __break(1u);
LABEL_111:
    __break(1u);
LABEL_112:
    __break(1u);
LABEL_113:
    __break(1u);
LABEL_114:
    __break(1u);
LABEL_115:
    __break(1u);
LABEL_116:
    __break(1u);
LABEL_117:
    __break(1u);
LABEL_118:
    __break(1u);
LABEL_119:
    __break(1u);
LABEL_120:
    ;
  }

  return swift_bridgeObjectRelease();
}

void sub_1000B46BC(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = v2;
  unint64_t v55 = a2;
  uint64_t v5 = sub_100005E5C(&qword_1000FF250);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SportingEventClockTimeType();
  uint64_t v9 = *(char **)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v57 = (char *)v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_100005E5C(&qword_1000FFAB8);
  __chkstk_darwin(v69);
  uint64_t v12 = (char *)v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100005E5C(&qword_1000FFAC0);
  __chkstk_darwin(v13 - 8);
  uint64_t v62 = (uint64_t)v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v70 = (uint64_t)v54 - v16;
  __chkstk_darwin(v17);
  id v19 = (char *)v54 - v18;
  _OWORD v54[2] = *a1;
  unint64_t v20 = dispatch thunk of SportingEventClockTimeContainer.clockTimes.getter();
  if (!v20) {
    goto LABEL_29;
  }
  unint64_t v21 = v20;
  unint64_t v68 = v20;
  if (v20 >> 62)
  {
LABEL_27:
    swift_bridgeObjectRetain();
    uint64_t v52 = _CocoaArrayWrapper.endIndex.getter();
    unint64_t v21 = v68;
    uint64_t v22 = v52;
    if (v52) {
      goto LABEL_4;
    }
LABEL_28:
    swift_bridgeObjectRelease_n();
    goto LABEL_29;
  }
  uint64_t v22 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v22) {
    goto LABEL_28;
  }
LABEL_4:
  v54[0] = v7;
  v54[1] = v3;
  uint64_t v66 = (void (**)(uint64_t, void, uint64_t))(v9 + 104);
  unint64_t v67 = v21 & 0xC000000000000001;
  uint64_t v56 = (void (**)(char *, uint64_t, uint64_t))(v9 + 32);
  unsigned int v65 = enum case for SportingEventClockTimeType.announcedAdditional(_:);
  BOOL v60 = (void (**)(uint64_t, uint64_t))(v9 + 8);
  uint64_t v61 = v19;
  uint64_t v23 = 4;
  unint64_t v63 = v12;
  int v64 = (char *)v22;
  while (1)
  {
    if (v67) {
      char v24 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      char v24 = (char *)*(id *)(v21 + 8 * v23);
    }
    uint64_t v9 = v24;
    uint64_t v7 = (char *)(v23 - 3);
    if (__OFADD__(v23 - 4, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    dispatch thunk of SportingEventClockTime.clockType.getter();
    uint64_t v25 = v70;
    (*v66)(v70, v65, v8);
    sub_1000082C0(v25, 0, 1, v8);
    uint64_t v26 = (uint64_t)&v12[*(int *)(v69 + 48)];
    uint64_t v3 = v12;
    sub_10002A418((uint64_t)v19, (uint64_t)v12, &qword_1000FFAC0);
    sub_10002A418(v25, v26, &qword_1000FFAC0);
    if (sub_1000082E8((uint64_t)v12, 1, v8) == 1) {
      break;
    }
    uint64_t v27 = v62;
    sub_10002A418((uint64_t)v12, v62, &qword_1000FFAC0);
    if (sub_1000082E8(v26, 1, v8) == 1)
    {
      (*v60)(v27, v8);
      id v19 = v61;
      goto LABEL_14;
    }
    char v28 = v57;
    (*v56)(v57, v26, v8);
    sub_1000B4F70(&qword_1000FFAC8, (void (*)(uint64_t))&type metadata accessor for SportingEventClockTimeType);
    int v58 = dispatch thunk of static Equatable.== infix(_:_:)();
    os_log_type_t v59 = v9;
    char v29 = *v60;
    (*v60)(v27, v8);
    v29((uint64_t)v28, v8);
    uint64_t v9 = v59;
    sub_100037ED0((uint64_t)v12, &qword_1000FFAC0);
    sub_100037ED0(v70, &qword_1000FFAC0);
    id v19 = v61;
    sub_100037ED0((uint64_t)v61, &qword_1000FFAC0);
    if (v58) {
      goto LABEL_18;
    }
LABEL_16:

    ++v23;
    unint64_t v21 = v68;
    if (v7 == v64) {
      goto LABEL_28;
    }
  }
  if (sub_1000082E8(v26, 1, v8) != 1)
  {
LABEL_14:
    uint64_t v12 = v63;
    sub_100037ED0((uint64_t)v63, &qword_1000FFAB8);
    sub_100037ED0(v70, &qword_1000FFAC0);
    sub_100037ED0((uint64_t)v19, &qword_1000FFAC0);
    goto LABEL_16;
  }
  sub_100037ED0((uint64_t)v63, &qword_1000FFAC0);
  sub_100037ED0(v70, &qword_1000FFAC0);
  sub_100037ED0((uint64_t)v19, &qword_1000FFAC0);
LABEL_18:
  swift_bridgeObjectRelease_n();
  uint64_t v30 = dispatch thunk of SportingEventClockTime.minutes.getter();
  char v32 = v31;

  uint64_t v33 = v54[0];
  if ((v32 & 1) == 0)
  {
    uint64_t v34 = dispatch thunk of SportingEventClockTimeContainer.period.getter();
    if (v34)
    {
      unint64_t v35 = (void *)v34;
      dispatch thunk of SportingEventClockPeriod.type.getter();

      uint64_t v36 = type metadata accessor for SportingEventClockPeriodType();
      if (sub_1000082E8(v33, 1, v36) == 1)
      {
        sub_100037ED0(v33, &qword_1000FF250);
        goto LABEL_29;
      }
      uint64_t v37 = SportingEventClockPeriodType.rawValue.getter();
      uint64_t v38 = v33;
      unint64_t v40 = v39;
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v36 - 8) + 8))(v38, v36);
      uint64_t v41 = dispatch thunk of SportingEventClockTimeContainer.period.getter();
      if (v41)
      {
        os_log_type_t v42 = (void *)v41;
        uint64_t v43 = dispatch thunk of SportingEventClockPeriod.index.getter();
        char v45 = v44;

        if ((v45 & 1) == 0)
        {
          uint64_t v71 = 0;
          unint64_t v72 = 0xE000000000000000;
          _StringGuts.grow(_:)(17);
          swift_bridgeObjectRelease();
          uint64_t v71 = v37;
          unint64_t v72 = v40;
          v46._countAndFlagsBits = 32;
          v46._object = (void *)0xE100000000000000;
          String.append(_:)(v46);
          uint64_t v73 = v43;
          v47._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
          String.append(_:)(v47);
          swift_bridgeObjectRelease();
          v48._countAndFlagsBits = 0x736574756E696D20;
          v48._object = (void *)0xEA0000000000203ALL;
          String.append(_:)(v48);
          uint64_t v73 = v30;
          v49._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
          String.append(_:)(v49);
          swift_bridgeObjectRelease();
          unint64_t v50 = v72;
          unint64_t v51 = v55;
          *unint64_t v55 = v71;
          v51[1] = v50;
          return;
        }
      }
      swift_bridgeObjectRelease();
    }
  }
LABEL_29:
  uint64_t v53 = v55;
  *unint64_t v55 = 0;
  v53[1] = 0;
}

void sub_1000B4D9C(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    sub_100017DA8();
    uint64_t v5 = *(void *)(type metadata accessor for IngestionError() - 8);
    uint64_t v6 = a1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    uint64_t v7 = *(void *)(v5 + 72);
    do
    {
      uint64_t v8 = IngestionError.rawValue.getter();
      uint64_t v10 = v9;
      unint64_t v11 = _swiftEmptyArrayStorage[2];
      if (v11 >= _swiftEmptyArrayStorage[3] >> 1) {
        sub_100017DA8();
      }
      _swiftEmptyArrayStorage[2] = v11 + 1;
      uint64_t v12 = &_swiftEmptyArrayStorage[2 * v11];
      v12[4] = v8;
      v12[5] = v10;
      v6 += v7;
      --v3;
    }
    while (v3);
  }
  *a2 = _swiftEmptyArrayStorage;
}

uint64_t sub_1000B4ED0()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000B4F08(void *a1@<X8>)
{
  sub_1000B4D9C(*(void *)(v1 + 16), a1);
}

uint64_t sub_1000B4F10()
{
  return sub_10005F794(*(void (**)(uint64_t *__return_ptr))(v0 + 16));
}

unsigned char **sub_1000B4F1C(unsigned char **a1, uint64_t a2, uint64_t a3)
{
  return sub_1000175E0(a1, a2, a3, *(unsigned char *)(v3 + 16));
}

uint64_t sub_1000B4F28()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000B4F60()
{
  return sub_100017004(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_1000B4F68(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  return sub_10001702C(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_1000B4F70(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000B4FB8@<X0>(uint64_t a1@<X8>)
{
  return sub_1000B2E00(*(void *)(v1 + 16), a1);
}

uint64_t sub_1000B4FE4()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000B4FFC(uint64_t a1)
{
  *(void *)(v1 - 184) = a1;
  return v1 - 184;
}

uint64_t sub_1000B5010()
{
  return 0;
}

uint64_t sub_1000B5028()
{
  return _swift_deallocObject(v0, 17, 7);
}

BOOL sub_1000B5038(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_1000B5054()
{
  return 2108704;
}

uint64_t sub_1000B5070(uint64_t a1)
{
  *(void *)(v1 - 184) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

BOOL sub_1000B5098@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t sub_1000B50C0()
{
  return 0;
}

uint64_t sub_1000B50D8(uint64_t a1)
{
  *(void *)(v1 - 184) = a1;
  return v1 - 184;
}

void sub_1000B5100(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v5, a4, v4, 0xCu);
}

uint64_t sub_1000B511C()
{
  return swift_arrayDestroy();
}

uint64_t sub_1000B5138@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0;
}

uint64_t sub_1000B5148()
{
  return 1819047278;
}

BOOL sub_1000B5154@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t sub_1000B5168()
{
  return 0;
}

uint64_t sub_1000B5174(uint64_t a1)
{
  *(void *)(v1 - 184) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

void sub_1000B5194(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0x16u);
}

uint64_t sub_1000B51B4()
{
  return v0;
}

uint64_t sub_1000B51C0()
{
  return swift_bridgeObjectRelease_n();
}

void sub_1000B51D8(float a1)
{
  float *v1 = a1;
}

void sub_1000B51EC(int a1@<W8>)
{
  *(_DWORD *)(v1 - 376) = a1;
}

uint64_t sub_1000B5200(uint64_t a1)
{
  *(void *)(v1 - 240) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000B5220()
{
  return swift_slowAlloc();
}

uint64_t sub_1000B5238()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1000B528C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x73746E657665 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1000B530C()
{
  return 0x73746E657665;
}

void *sub_1000B5320(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v17 = a2;
  uint64_t v18 = a3;
  uint64_t v16 = a4;
  uint64_t v19 = a4;
  uint64_t v20 = a5;
  uint64_t v21 = a6;
  uint64_t v22 = a7;
  type metadata accessor for ApsPayload.ContentWrapper.CodingKeys();
  swift_getWitnessTable();
  uint64_t v9 = type metadata accessor for KeyedDecodingContainer();
  uint64_t v15 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  unint64_t v11 = (char *)&v15 - v10;
  uint64_t v12 = sub_100005EA0(a1, a1[3]);
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v7)
  {
    uint64_t v13 = v15;
    type metadata accessor for Array();
    uint64_t v23 = v16;
    swift_getWitnessTable();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v11, v9);
    uint64_t v12 = v17;
  }
  sub_100006178((uint64_t)a1);
  return v12;
}

uint64_t sub_1000B5520()
{
  return sub_100006ED4();
}

Swift::Int sub_1000B5534()
{
  return sub_100066290();
}

void sub_1000B5548()
{
}

Swift::Int sub_1000B555C()
{
  return Hasher._finalize()();
}

uint64_t sub_1000B55A8()
{
  return sub_1000B530C();
}

uint64_t sub_1000B55BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000B528C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1000B55F8()
{
  return sub_100006EDC();
}

uint64_t sub_1000B5624@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100006ED4();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1000B5660(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return CodingKey.description.getter(a1, WitnessTable);
}

uint64_t sub_1000B56B4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return CodingKey.debugDescription.getter(a1, WitnessTable);
}

void *sub_1000B5708@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t result = sub_1000B5320(a1, *(void **)(a2 + 16), *(void *)(a2 + 24), *(void *)(a2 + 32), *(void *)(a2 + 40), *(void *)(a2 + 48), *(void *)(a2 + 56));
  if (!v3) {
    *a3 = result;
  }
  return result;
}

uint64_t sub_1000B5744()
{
  uint64_t v0 = swift_allocObject();
  sub_1000B5794();
  return v0;
}

void sub_1000B5794()
{
  sub_100069FCC();
  uint64_t v2 = v0;
  char v4 = v3;
  os_log_type_t v5 = *(void **)v0;
  uint64_t v52 = v1;
  uint64_t v53 = v5;
  uint64_t v6 = v5[10];
  v43[5] = type metadata accessor for Optional();
  sub_10000C568();
  v43[4] = v7;
  sub_1000B7CAC();
  __chkstk_darwin(v8);
  v43[6] = (char *)v43 - v9;
  sub_10000C568();
  _OWORD v43[2] = v10;
  sub_1000B7CAC();
  __chkstk_darwin(v11);
  v43[1] = (char *)v43 - v12;
  uint64_t v13 = v5[11];
  type metadata accessor for Optional();
  sub_10000C568();
  uint64_t v44 = v15;
  uint64_t v45 = v14;
  sub_1000B7CAC();
  __chkstk_darwin(v16);
  unint64_t v50 = (char *)v43 - v17;
  type metadata accessor for Date();
  sub_10000C568();
  uint64_t v46 = v18;
  uint64_t v47 = v19;
  __chkstk_darwin(v18);
  Swift::String v49 = (char *)v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = v5[12];
  uint64_t v22 = v5[13];
  uint64_t v23 = v5[14];
  uint64_t v24 = v5[15];
  uint64_t v51 = v6;
  uint64_t v55 = v6;
  uint64_t v56 = v13;
  v43[7] = v21;
  v43[8] = v13;
  uint64_t v57 = v21;
  uint64_t v58 = v22;
  void v43[3] = v22;
  v43[9] = v23;
  uint64_t v59 = v23;
  uint64_t v60 = v24;
  type metadata accessor for ApsPayload.PayloadWrapper.CodingKeys();
  swift_getWitnessTable();
  type metadata accessor for KeyedDecodingContainer();
  sub_10000C568();
  uint64_t v48 = v25;
  sub_1000B7CAC();
  __chkstk_darwin(v26);
  char v28 = (char *)v43 - v27;
  sub_100005EA0(v4, v4[3]);
  uint64_t v29 = v52;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v29)
  {
    swift_deallocPartialClassInstance();
  }
  else
  {
    char v31 = v49;
    uint64_t v30 = v50;
    uint64_t v52 = v24;
    LOBYTE(v55) = 0;
    *((void *)v2 + 2) = KeyedDecodingContainer.decode(_:forKey:)();
    *((void *)v2 + 3) = sub_1000B7CF8(1);
    *((void *)v2 + 4) = v32;
    *((void *)v2 + 5) = sub_1000B7CF8(2);
    *((void *)v2 + 6) = v33;
    LOBYTE(v55) = 3;
    sub_1000B7748(qword_1000FC470);
    uint64_t v34 = v46;
    v43[0] = 0;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, char *, uint64_t))(v47 + 32))(&v2[qword_10010A5D0], v31, v34);
    LOBYTE(v55) = 4;
    Swift::String v49 = v28;
    uint64_t v35 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    uint64_t v37 = &v2[qword_10010A5D8];
    *(void *)uint64_t v37 = v35;
    v37[8] = v36 & 1;
    LOBYTE(v55) = 5;
    uint64_t v38 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    unint64_t v39 = (uint64_t *)&v2[qword_10010A5E0];
    *unint64_t v39 = v38;
    v39[1] = v40;
    LOBYTE(v55) = 6;
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    (*(void (**)(char *, char *, uint64_t))(v44 + 32))(&v2[*(void *)(*(void *)v2 + 176)], v30, v45);
    type metadata accessor for Array();
    char v54 = 7;
    swift_getWitnessTable();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v41 = v55;
    sub_1000B7CB8();
    v42();
    *(void *)&v2[*(void *)(*(void *)v2 + 184)] = v41;
  }
  sub_100006178((uint64_t)v4);
  sub_100069FB4();
}

uint64_t sub_1000B60D0(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701869940 && a2 == 0xE400000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    BOOL v6 = a1 == 0x6556616D65686373 && a2 == 0xED00006E6F697372;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      BOOL v7 = a1 == 0x7365536F706D6574 && a2 == 0xEE0064496E6F6973;
      if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        BOOL v8 = a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070;
        if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          BOOL v9 = a1 == 0x697463416576696CLL && a2 == 0xEF6C745479746976;
          if (v9 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            BOOL v10 = a1 == 0x5464616F6C796170 && a2 == 0xEC0000006E656B6FLL;
            if (v10 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              BOOL v11 = a1 == 2003134838 && a2 == 0xE400000000000000;
              if (v11 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else if (a1 == 0x746E65746E6F63 && a2 == 0xE700000000000000)
              {
                swift_bridgeObjectRelease();
                return 7;
              }
              else
              {
                char v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
                swift_bridgeObjectRelease();
                if (v13) {
                  return 7;
                }
                else {
                  return 8;
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_1000B6470(char a1)
{
  uint64_t result = 1701869940;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6556616D65686373;
      break;
    case 2:
      uint64_t result = 0x7365536F706D6574;
      break;
    case 3:
      uint64_t result = 0x6D617473656D6974;
      break;
    case 4:
      uint64_t result = 0x697463416576696CLL;
      break;
    case 5:
      uint64_t result = 0x5464616F6C796170;
      break;
    case 6:
      uint64_t result = 2003134838;
      break;
    case 7:
      uint64_t result = 0x746E65746E6F63;
      break;
    default:
      return result;
  }
  return result;
}

BOOL sub_1000B6590(char *a1, char *a2)
{
  return sub_10000A600(*a1, *a2);
}

Swift::Int sub_1000B65AC()
{
  return sub_10000A954(*v0);
}

void sub_1000B65C0(uint64_t a1)
{
  sub_10000A610(a1, *v1);
}

Swift::Int sub_1000B65D4()
{
  Hasher.init(_seed:)();
  sub_10000A610((uint64_t)v2, *v0);
  return Hasher._finalize()();
}

uint64_t sub_1000B6624()
{
  return sub_1000B6470(*v0);
}

uint64_t sub_1000B6638@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, unsigned char *a4@<X8>)
{
  return sub_1000B6E5C(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void, void))sub_1000B60D0, a4);
}

uint64_t sub_1000B6650()
{
  return sub_100006EDC();
}

uint64_t sub_1000B667C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  return sub_1000B6EE4(a1, a2, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_1000824E8, a3);
}

uint64_t sub_1000B6694(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return CodingKey.description.getter(a1, WitnessTable);
}

uint64_t sub_1000B66E8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return CodingKey.debugDescription.getter(a1, WitnessTable);
}

uint64_t sub_1000B673C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for Date();
  sub_100029250();
  sub_100009894();
  v1();
  swift_bridgeObjectRelease();
  type metadata accessor for Optional();
  sub_100029250();
  sub_100009894();
  v2();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1000B6830()
{
  sub_1000B673C();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

void sub_1000B6888()
{
  sub_100069FCC();
  uint64_t v18 = v1;
  uint64_t v2 = v0;
  char v4 = v3;
  uint64_t v5 = *v2;
  uint64_t v6 = *(void *)(*v2 + 80);
  uint64_t v16 = *(void *)(*v2 + 120);
  uint64_t v17 = v6;
  uint64_t v20 = v6;
  long long v15 = *(_OWORD *)(v5 + 88);
  long long v21 = v15;
  long long v14 = *(_OWORD *)(v5 + 104);
  long long v22 = v14;
  uint64_t v23 = v16;
  type metadata accessor for ApsPayload.PayloadWrapper.CodingKeys();
  swift_getWitnessTable();
  uint64_t v7 = type metadata accessor for KeyedEncodingContainer();
  sub_10000C568();
  uint64_t v9 = v8;
  sub_1000B7CAC();
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v14 - v11;
  sub_100005EA0(v4, v4[3]);
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v20) = 0;
  uint64_t v13 = v18;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v7);
  }
  else
  {
    sub_1000B7CD4(1);
    sub_1000B7CD4(2);
    LOBYTE(v20) = 3;
    type metadata accessor for Date();
    sub_1000B7748(qword_1000FFBE8);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    sub_1000B7D18(4);
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    sub_1000B7D18(5);
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    LOBYTE(v20) = 6;
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    uint64_t v20 = *(uint64_t *)((char *)v2 + *(void *)(*v2 + 184));
    type metadata accessor for Array();
    uint64_t v19 = v14;
    swift_getWitnessTable();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    (*(void (**)(char *, void))(v9 + 8))(v12, 0);
  }
  sub_100069FB4();
}

uint64_t sub_1000B6C08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000B5744();
  if (!v1) {
    *a1 = result;
  }
  return result;
}

void sub_1000B6C34()
{
}

uint64_t sub_1000B6C58(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x64616F6C796170 && a2 == 0xE700000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x756F437365747962 && a2 == 0xEA0000000000746ELL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_1000B6D54(char a1)
{
  if (a1) {
    return 0x756F437365747962;
  }
  else {
    return 0x64616F6C796170;
  }
}

BOOL sub_1000B6D90(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1000677F4(*a1, *a2);
}

Swift::Int sub_1000B6DAC()
{
  return sub_100067924(*v0);
}

void sub_1000B6DC4(uint64_t a1)
{
  sub_100067804(a1, *v1);
}

Swift::Int sub_1000B6DDC()
{
  Hasher.init(_seed:)();
  sub_100067804((uint64_t)v2, *v0);
  return Hasher._finalize()();
}

uint64_t sub_1000B6E2C()
{
  return sub_1000B6D54(*v0);
}

uint64_t sub_1000B6E44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, unsigned char *a4@<X8>)
{
  return sub_1000B6E5C(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void, void))sub_1000B6C58, a4);
}

uint64_t sub_1000B6E5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t (*a4)(uint64_t, uint64_t, void, void, void, void, void, void)@<X4>, unsigned char *a5@<X8>)
{
  uint64_t result = a4(a1, a2, a3[2], a3[3], a3[4], a3[5], a3[6], a3[7]);
  *a5 = result;
  return result;
}

uint64_t sub_1000B6E9C()
{
  return sub_100006EDC();
}

uint64_t sub_1000B6ECC@<X0>(uint64_t a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  return sub_1000B6EE4(a1, a2, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_10006791C, a3);
}

uint64_t sub_1000B6EE4@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t (*a3)(uint64_t, void, void, void, void, void, void)@<X3>, unsigned char *a4@<X8>)
{
  uint64_t result = a3(a1, a2[2], a2[3], a2[4], a2[5], a2[6], a2[7]);
  *a4 = result;
  return result;
}

uint64_t sub_1000B6F24(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return CodingKey.description.getter(a1, WitnessTable);
}

uint64_t sub_1000B6F78(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return CodingKey.debugDescription.getter(a1, WitnessTable);
}

uint64_t sub_1000B6FCC()
{
  swift_release();
  return v0;
}

uint64_t sub_1000B6FEC()
{
  sub_1000B6FCC();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for ApsPayload()
{
  return swift_getGenericMetadata();
}

void sub_1000B7038()
{
  sub_100069FCC();
  uint64_t v29 = v0;
  BOOL v2 = v1;
  sub_1000B7CC8();
  uint64_t v27 = *(void *)(v3 + 80);
  sub_1000B7CC8();
  uint64_t v26 = *(void *)(v4 + 88);
  sub_1000B7CC8();
  uint64_t v25 = *(void *)(v5 + 96);
  sub_1000B7CC8();
  uint64_t v24 = *(void *)(v6 + 104);
  sub_1000B7CC8();
  uint64_t v23 = *(void *)(v7 + 112);
  sub_1000B7CC8();
  uint64_t v9 = *(void *)(v8 + 120);
  uint64_t v31 = v10;
  uint64_t v32 = v11;
  uint64_t v33 = v12;
  uint64_t v34 = v13;
  uint64_t v35 = v14;
  uint64_t v36 = v9;
  type metadata accessor for ApsPayload.CodingKeys();
  swift_getWitnessTable();
  uint64_t v15 = type metadata accessor for KeyedEncodingContainer();
  sub_10000C568();
  uint64_t v28 = v16;
  sub_1000B7CAC();
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v23 - v18;
  sub_100005EA0(v2, v2[3]);
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v30 = 0;
  uint64_t v31 = v27;
  uint64_t v32 = v26;
  uint64_t v33 = v25;
  uint64_t v34 = v24;
  uint64_t v35 = v23;
  uint64_t v36 = v9;
  type metadata accessor for ApsPayload.PayloadWrapper();
  swift_getWitnessTable();
  uint64_t v20 = v29;
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (v20)
  {
    sub_100009894();
    v21();
  }
  else
  {
    uint64_t v22 = v28;
    LOBYTE(v31) = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v19, v15);
  }
  sub_100069FB4();
}

uint64_t sub_1000B7290(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  sub_1000B7400(a1, v3, v4, v5, v6, v7, v8, v9, v11, v12);
  return v2;
}

uint64_t sub_1000B72E0()
{
  uint64_t result = type metadata accessor for Date();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for Optional();
    if (v2 <= 0x3F) {
      return swift_initClassMetadata2();
    }
  }
  return result;
}

uint64_t type metadata accessor for ApsPayload.PayloadWrapper()
{
  return swift_getGenericMetadata();
}

void sub_1000B7400(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_100069FCC();
  uint64_t v12 = v10;
  uint64_t v14 = v13;
  type metadata accessor for ApsPayload.CodingKeys();
  swift_getWitnessTable();
  type metadata accessor for KeyedDecodingContainer();
  sub_10000C568();
  sub_1000B7CAC();
  __chkstk_darwin(v15);
  sub_100005EA0(v14, v14[3]);
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v11)
  {
    swift_deallocPartialClassInstance();
  }
  else
  {
    type metadata accessor for ApsPayload.PayloadWrapper();
    swift_getWitnessTable();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    *(void *)(v10 + 16) = a10;
    uint64_t v16 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v17 = sub_1000B7C94();
    v18(v17);
    *(void *)(v12 + 24) = v16;
  }
  sub_100006178((uint64_t)v14);
  sub_100069FB4();
}

uint64_t sub_1000B76C8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1000B7290(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

void sub_1000B76F4()
{
}

uint64_t type metadata accessor for ApsPayload.CodingKeys()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for ApsPayload.PayloadWrapper.CodingKeys()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1000B7748(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Date();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for ApsPayload.ContentWrapper()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for ApsPayload.PayloadError()
{
  return swift_getGenericMetadata();
}

uint64_t sub_1000B77BC(uint64_t a1, uint64_t a2)
{
  if (sub_1000B7820(a2))
  {
    return sub_100005E5C(&qword_1000FF228);
  }
  else
  {
    return type metadata accessor for _ContiguousArrayStorage();
  }
}

uint64_t sub_1000B7820(uint64_t a1)
{
  if (swift_isClassType()) {
    return a1;
  }
  else {
    return 0;
  }
}

uint64_t sub_1000B7850(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1000B7890(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_1000B78CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 56);
}

unsigned char *sub_1000B78D4(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x1000B79A0);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

unsigned char *sub_1000B79C8(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x1000B7A94);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_1000B7ABC()
{
  return swift_getWitnessTable();
}

uint64_t sub_1000B7AD8()
{
  return swift_getWitnessTable();
}

uint64_t sub_1000B7AF4()
{
  return swift_getWitnessTable();
}

uint64_t sub_1000B7B10()
{
  return swift_getWitnessTable();
}

uint64_t sub_1000B7B2C()
{
  return swift_getWitnessTable();
}

uint64_t sub_1000B7B48()
{
  return swift_getWitnessTable();
}

uint64_t type metadata accessor for ApsPayload.ContentWrapper.CodingKeys()
{
  return swift_getGenericMetadata();
}

unsigned char *sub_1000B7B7C(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1000B7C18);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000B7C40()
{
  return swift_getWitnessTable();
}

uint64_t sub_1000B7C5C()
{
  return swift_getWitnessTable();
}

uint64_t sub_1000B7C78()
{
  return swift_getWitnessTable();
}

uint64_t sub_1000B7C94()
{
  return v0;
}

uint64_t sub_1000B7CD4@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 128) = a1;
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_1000B7CF8@<X0>(char a1@<W8>)
{
  *(unsigned char *)(v1 - 136) = a1;
  return KeyedDecodingContainer.decode(_:forKey:)();
}

void sub_1000B7D18(char a1@<W8>)
{
  *(unsigned char *)(v1 - 128) = a1;
}

uint64_t sub_1000B7D2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = sub_100005E5C(&qword_1000FFF10);
  sub_100009830();
  uint64_t v11 = v10;
  __chkstk_darwin(v12);
  sub_1000098F8();
  uint64_t v15 = v14 - v13;
  sub_100005E5C(&qword_1000FFF18);
  sub_100009830();
  uint64_t v47 = v17;
  uint64_t v48 = v16;
  __chkstk_darwin(v16);
  sub_1000098F8();
  uint64_t v20 = v19 - v18;
  uint64_t v21 = sub_100005E5C(&qword_1000FFF20);
  sub_100009830();
  uint64_t v49 = v22;
  __chkstk_darwin(v23);
  sub_1000098F8();
  uint64_t v44 = v25 - v24;
  uint64_t v26 = sub_100005E5C((uint64_t *)&unk_1000FDA80);
  __chkstk_darwin(v26 - 8);
  sub_1000098F8();
  uint64_t v29 = v28 - v27;
  uint64_t v30 = type metadata accessor for URL();
  sub_100009830();
  uint64_t v32 = v31;
  __chkstk_darwin(v33);
  sub_1000098F8();
  uint64_t v36 = v35 - v34;
  if (a4)
  {
    swift_bridgeObjectRetain();
    URL.init(string:)();
    if (sub_1000082E8(v29, 1, v30) != 1)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 32))(v36, v29, v30);
      unint64_t v39 = (void **)sub_100005EA0((void *)(v43 + 16), *(void *)(v43 + 40));
      sub_10007AEA4(v36, a5, a6, *v39, v39[1]);
      sub_100005E5C(&qword_1000FFF30);
      sub_100005E5C((uint64_t *)&unk_1000FDA30);
      sub_10000953C(&qword_1000FFF38, &qword_1000FFF30);
      Publisher.mapError<A>(_:)();
      swift_release();
      uint64_t v40 = swift_allocObject();
      swift_weakInit();
      uint64_t v41 = (void *)swift_allocObject();
      v41[2] = a5;
      v41[3] = a6;
      v41[4] = a7;
      v41[5] = a8;
      v41[6] = v40;
      v41[7] = a1;
      v41[8] = a2;
      v41[9] = a3;
      v41[10] = a4;
      type metadata accessor for LogoDownloadResult();
      sub_10000953C(&qword_1000FFF40, &qword_1000FFF18);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      Publisher.map<A>(_:)();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v20, v48);
      sub_10000953C(&qword_1000FFF48, &qword_1000FFF20);
      uint64_t v38 = Publisher.eraseToAnyPublisher()();
      (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v44, v21);
      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v36, v30);
      return v38;
    }
    swift_bridgeObjectRelease();
    sub_1000B9048(v29);
  }
  id v37 = objc_allocWithZone((Class)NSError);
  sub_10002EFA4(0xD00000000000001ELL, 0x80000001000D2F30, 1, 0);
  type metadata accessor for LogoDownloadResult();
  sub_100005E5C((uint64_t *)&unk_1000FDA30);
  Fail.init(error:)();
  sub_10000953C(&qword_1000FFF28, &qword_1000FFF10);
  uint64_t v38 = Publisher.eraseToAnyPublisher()();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v15, v9);
  return v38;
}

uint64_t sub_1000B8260(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (!v4 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
    return 0;
  }
  BOOL v5 = a1[2] == a2[2] && a1[3] == a2[3];
  if (!v5 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(int *)(type metadata accessor for LogoDownloadResult() + 24);

  return static SportingEventSubscription.Competitor.LogoFilePaths.== infix(_:_:)((char *)a1 + v6, (char *)a2 + v6);
}

uint64_t sub_1000B8300@<X0>(uint64_t a1@<X0>, uint64_t a2@<X6>, uint64_t a3@<X7>, char *a4@<X8>, uint64_t a5, uint64_t a6)
{
  uint64_t v22 = a6;
  uint64_t v23 = a3;
  uint64_t v19 = a5;
  uint64_t v20 = a2;
  uint64_t v21 = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths();
  uint64_t v8 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for URL();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  URL.init(fileURLWithPath:)();
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    sub_1000B8540(a1);
    swift_release();
  }
  URL.path(percentEncoded:)(1);
  SportingEventSubscription.Competitor.LogoFilePaths.init(smallSize:defaultSize:)();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v16 = v22;
  uint64_t v15 = v23;
  *(void *)a4 = v20;
  *((void *)a4 + 1) = v15;
  *((void *)a4 + 2) = v19;
  *((void *)a4 + 3) = v16;
  uint64_t v17 = type metadata accessor for LogoDownloadResult();
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&a4[*(int *)(v17 + 24)], v10, v21);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000B8540(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v41 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  __chkstk_darwin(v3);
  BOOL v5 = (char *)&v39 - v4;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v39 - v7;
  uint64_t v9 = type metadata accessor for SportsLogoSize();
  uint64_t v10 = *(void *)(v9 - 8);
  __n128 v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v10 + 104))(v13, enum case for SportsLogoSize.small(_:), v9, v11);
  CGImageRef v15 = sub_1000B8CB4(v14);
  uint64_t v16 = v13;
  uint64_t v17 = v15;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
  if (!v17)
  {
    if (qword_1000FBDD0 != -1) {
      swift_once();
    }
    uint64_t v28 = type metadata accessor for Logger();
    sub_10000929C(v28, (uint64_t)qword_10010A538);
    uint64_t v29 = v41;
    (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v5, a1, v2);
    uint64_t v30 = Logger.logObject.getter();
    os_log_type_t v31 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      *(_DWORD *)uint64_t v32 = 136315138;
      uint64_t v33 = URL.absoluteString.getter();
      uint64_t v42 = sub_100017098(v33, v34, &v43);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v5, v2);
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "LogoRepository: can't create CGImage from URL: %s", v32, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v29 + 8))(v5, v2);
    }

    return 0;
  }
  uint64_t v18 = sub_1000B8E14(v17);
  if (v19 >> 60 == 15)
  {
    uint64_t v20 = v2;
    if (qword_1000FBDD0 != -1) {
      swift_once();
    }
    uint64_t v21 = type metadata accessor for Logger();
    sub_10000929C(v21, (uint64_t)qword_10010A538);
    uint64_t v22 = v41;
    (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v8, a1, v20);
    uint64_t v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136315138;
      uint64_t v40 = v17;
      uint64_t v26 = URL.absoluteString.getter();
      uint64_t v42 = sub_100017098(v26, v27, &v43);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v20);
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "LogoRepository: can't create data from image with URL: %s", v25, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v20);
    }
    return 0;
  }
  uint64_t v35 = v18;
  unint64_t v36 = v19;
  Data.write(to:options:)();
  uint64_t countAndFlagsBits = URL.path(percentEncoded:)(1)._countAndFlagsBits;
  sub_100029010(v35, v36);

  return countAndFlagsBits;
}

CGImageRef sub_1000B8CB4@<X0>(NSURL *a1@<X8>)
{
  URL._bridgeToObjectiveC()(a1);
  CFURLRef v2 = v1;
  uint64_t v3 = CGImageSourceCreateWithURL(v1, 0);

  if (!v3) {
    return 0;
  }
  sub_100005E5C(&qword_1000FFF50);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000CB3B0;
  *(void *)(inited + 32) = kCGImageSourceThumbnailMaxPixelSize;
  CFStringRef v5 = (id)kCGImageSourceThumbnailMaxPixelSize;
  *(void *)(inited + 40) = SportsLogoSize.rawValue.getter();
  *(void *)(inited + 64) = &type metadata for Int;
  *(void *)(inited + 72) = kCGImageSourceCreateThumbnailFromImageAlways;
  *(unsigned char *)(inited + 80) = 1;
  *(void *)(inited + 104) = &type metadata for Bool;
  *(void *)(inited + 112) = kCGImageSourceCreateThumbnailWithTransform;
  *(void *)(inited + 144) = &type metadata for Bool;
  *(unsigned char *)(inited + 120) = 1;
  sub_1000B9170();
  sub_1000B91B0();
  CFStringRef v6 = (id)kCGImageSourceCreateThumbnailFromImageAlways;
  CFStringRef v7 = (id)kCGImageSourceCreateThumbnailWithTransform;
  Dictionary.init(dictionaryLiteral:)();
  CFDictionaryRef isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  CGImageRef ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v3, 0, isa);

  return ThumbnailAtIndex;
}

uint64_t sub_1000B8E14(CGImage *a1)
{
  uint64_t v2 = type metadata accessor for UTType();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  CFStringRef v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  CFMutableDataRef Mutable = CFDataCreateMutable(0, 0);
  if (!Mutable) {
    return 0;
  }
  CFStringRef v7 = Mutable;
  static UTType.png.getter();
  UTType.identifier.getter();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v8 = (__CFString *)String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v9 = CGImageDestinationCreateWithData(v7, v8, 1uLL, 0);

  if (!v9)
  {

    return 0;
  }
  CGImageDestinationAddImage(v9, a1, 0);
  if (!CGImageDestinationFinalize(v9))
  {

    return 0;
  }
  uint64_t v10 = v7;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

  return v11;
}

uint64_t sub_1000B8FA4()
{
  sub_100006178(v0 + 16);

  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for LogoRepository()
{
  return self;
}

uint64_t type metadata accessor for LogoDownloadResult()
{
  uint64_t result = qword_1000FFFC0;
  if (!qword_1000FFFC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000B9048(uint64_t a1)
{
  uint64_t v2 = sub_100005E5C((uint64_t *)&unk_1000FDA80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000B90A8()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000B90E0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 88, 7);
}

uint64_t sub_1000B9138@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_1000B8300(a1, v2[7], v2[8], a2, v2[9], v2[10]);
}

unint64_t sub_1000B9170()
{
  unint64_t result = qword_1000FFF58;
  if (!qword_1000FFF58)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000FFF58);
  }
  return result;
}

unint64_t sub_1000B91B0()
{
  unint64_t result = qword_1000FFF60;
  if (!qword_1000FFF60)
  {
    sub_1000B9170();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000FFF60);
  }
  return result;
}

uint64_t *sub_1000B9200(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    uint64_t *v3 = *a2;
    uint64_t v3 = (uint64_t *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = *(int *)(a3 + 24);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths();
    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t sub_1000B92F8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_1000B9378(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  return a1;
}

void *sub_1000B9420(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_1000B94DC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

void *sub_1000B9558(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_1000B95F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000B9608);
}

uint64_t sub_1000B9608(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths();
    uint64_t v9 = a1 + *(int *)(a3 + 24);
    return sub_1000082E8(v9, a2, v8);
  }
}

uint64_t sub_1000B9690(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000B96A4);
}

uint64_t sub_1000B96A4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths();
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return sub_1000082C0(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_1000B9724()
{
  uint64_t result = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1000B97BC(uint64_t a1, char a2, uint64_t (*a3)(uint64_t *))
{
  uint64_t v4 = a1;
  char v5 = a2 & 1;
  return a3(&v4);
}

uint64_t sub_1000B97FC()
{
  uint64_t v1 = sub_100005E5C(&qword_100100000);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000B9BC0(v0, (uint64_t)__src);
  uint64_t v5 = swift_allocObject();
  memcpy((void *)(v5 + 16), __src, 0xD8uLL);
  sub_100005E5C(&qword_1000FD310);
  swift_allocObject();
  v9[1] = Future.init(_:)();
  sub_1000B9BC0(v0, (uint64_t)__src);
  uint64_t v6 = swift_allocObject();
  memcpy((void *)(v6 + 16), __src, 0xD8uLL);
  static Subscribers.Demand.unlimited.getter();
  sub_100005E5C(&qword_1000FCEE8);
  sub_10000953C(&qword_1000FD318, &qword_1000FD310);
  sub_10000953C((unint64_t *)&qword_1000FCEF0, &qword_1000FCEE8);
  Publisher.flatMap<A, B>(maxPublishers:_:)();
  swift_release();
  swift_release();
  sub_10000953C(&qword_100100008, &qword_100100000);
  uint64_t v7 = Publisher.eraseToAnyPublisher()();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v7;
}

uint64_t sub_1000B9A88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100005E5C(&qword_1000FC940);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = &__src[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a1;
  *(void *)(v9 + 24) = a2;
  uint64_t v10 = type metadata accessor for TaskPriority();
  sub_1000082C0((uint64_t)v8, 1, 1, v10);
  sub_1000B9BC0(a3, (uint64_t)__src);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  memcpy(v11 + 4, __src, 0xD8uLL);
  v11[31] = sub_10001D24C;
  v11[32] = v9;
  swift_retain();
  sub_100051F94((uint64_t)v8, (uint64_t)&unk_100100018, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_1000B9BC0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1000B9BFC(uint64_t a1, uint64_t a2)
{
  return sub_1000B9A88(a1, a2, v2 + 16);
}

uint64_t sub_1000B9C04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[31] = a5;
  v6[32] = a6;
  v6[30] = a4;
  return _swift_task_switch(sub_1000B9C28, 0, 0);
}

uint64_t sub_1000B9C28()
{
  uint64_t v11 = v0;
  if (qword_1000FBDE0 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[30];
  uint64_t v2 = type metadata accessor for Logger();
  sub_10000929C(v2, (uint64_t)qword_10010A568);
  sub_1000B9BC0(v1, (uint64_t)(v0 + 2));
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v7 = v0[27];
    unint64_t v6 = v0[28];
    swift_bridgeObjectRetain();
    v0[29] = sub_100017098(v7, v6, &v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_10008DD60((uint64_t)(v0 + 2));
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "SubscriptionStopActivityOperation: destroying activity for '%s'", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_10008DD60((uint64_t)(v0 + 2));
  }

  if (qword_1000FBDA0 != -1) {
    swift_once();
  }
  uint64_t v8 = (void *)swift_task_alloc();
  v0[33] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_1000B9EA8;
  return sub_10005D4CC();
}

uint64_t sub_1000B9EA8()
{
  sub_10001C208();
  *(void *)(v1 + 272) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_1000BA004;
  }
  else {
    uint64_t v2 = sub_1000B9F98;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000B9F98()
{
  (*(void (**)(uint64_t, void))(v0 + 248))(1, 0);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000BA004()
{
  uint64_t v1 = v0[34];
  uint64_t v2 = (void (*)(uint64_t, uint64_t))v0[31];
  swift_errorRetain();
  v2(v1, 1);
  swift_errorRelease();
  swift_errorRelease();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_1000BA094@<X0>(uint64_t *a1@<X1>, void *a2@<X8>)
{
  sub_100029A38(a1[23], a1[24], a1[25], a1[26], v6);
  uint64_t v3 = v7;
  uint64_t v4 = v8;
  sub_100005EA0(v6, v7);
  *a2 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v3, v4);
  return sub_100006178((uint64_t)v6);
}

uint64_t sub_1000BA118()
{
  sub_100006178(v0 + 16);
  swift_release();
  swift_release();
  sub_100006178(v0 + 72);
  sub_100006178(v0 + 112);
  sub_100006178(v0 + 152);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 232, 7);
}

uint64_t sub_1000BA190@<X0>(void *a1@<X8>)
{
  return sub_1000BA094((uint64_t *)(v1 + 16), a1);
}

uint64_t sub_1000BA198()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000BA1D0()
{
  swift_unknownObjectRelease();
  sub_100006178(v0 + 32);
  swift_release();
  swift_release();
  sub_100006178(v0 + 88);
  sub_100006178(v0 + 128);
  sub_100006178(v0 + 168);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 264, 7);
}

uint64_t sub_1000BA258(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (uint64_t)(v1 + 4);
  uint64_t v8 = v1[31];
  uint64_t v7 = v1[32];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_1000BA320;
  return sub_1000B9C04(a1, v4, v5, v6, v8, v7);
}

uint64_t sub_1000BA320()
{
  sub_10001C208();
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t destroy for SubscriptionStopActivityOperation(uint64_t a1)
{
  sub_100006178(a1);
  swift_release();
  swift_release();
  sub_100006178(a1 + 56);
  sub_100006178(a1 + 96);
  sub_100006178(a1 + 136);
  swift_release();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SubscriptionStopActivityOperation(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  long long v6 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v6;
  uint64_t v7 = v6;
  uint64_t v8 = **(void (***)(uint64_t, uint64_t, uint64_t))(v6 - 8);
  swift_retain();
  swift_retain();
  v8(a1 + 56, a2 + 56, v7);
  long long v9 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 120) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 96, a2 + 96);
  long long v10 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 160) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 136, a2 + 136);
  uint64_t v11 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v11;
  uint64_t v12 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v12;
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for SubscriptionStopActivityOperation(uint64_t *a1, uint64_t *a2)
{
  a1[5] = a2[5];
  swift_retain();
  swift_release();
  a1[6] = a2[6];
  swift_retain();
  swift_release();
  sub_100008E94(a1 + 7, a2 + 7);
  sub_100008E94(a1 + 12, a2 + 12);
  sub_100008E94(a1 + 17, a2 + 17);
  a1[22] = a2[22];
  swift_retain();
  swift_release();
  a1[23] = a2[23];
  a1[24] = a2[24];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[25] = a2[25];
  a1[26] = a2[26];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *initializeWithTake for SubscriptionStopActivityOperation(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xD8uLL);
}

uint64_t assignWithTake for SubscriptionStopActivityOperation(uint64_t a1, uint64_t a2)
{
  sub_100006178(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  sub_100006178(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  sub_100006178(a1 + 96);
  long long v6 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v6;
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  sub_100006178(a1 + 136);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  uint64_t v7 = *(void *)(a2 + 176);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = v7;
  swift_release();
  uint64_t v8 = *(void *)(a2 + 192);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(void *)(a1 + 192) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 208);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  *(void *)(a1 + 208) = v9;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SubscriptionStopActivityOperation(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 216))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SubscriptionStopActivityOperation(uint64_t result, int a2, int a3)
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
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 216) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SubscriptionStopActivityOperation()
{
  return &type metadata for SubscriptionStopActivityOperation;
}

uint64_t sub_1000BA894(uint64_t a1, char a2)
{
  if (*(void *)(a1 + 24) == 1)
  {
    sub_1000437A4(a1, &qword_100100140);
    sub_1000BFAB4(a2, v4);
    return sub_1000437A4((uint64_t)v4, &qword_100100140);
  }
  else
  {
    sub_10007A0EC(a1, (uint64_t)v4, (uint64_t *)&unk_1000FC300);
    return sub_1000BFF84((uint64_t)v4, a2);
  }
}

uint64_t sub_1000BA918(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_100028F5C((_OWORD *)a1, v6);
    sub_1000C0004(v6, a2, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1000437A4(a1, (uint64_t *)&unk_1000FC300);
    sub_1000BFBC8(v6);
    swift_bridgeObjectRelease();
    return sub_1000437A4((uint64_t)v6, (uint64_t *)&unk_1000FC300);
  }
}

uint64_t sub_1000BA9AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = sub_100005E5C(&qword_1000FF1D8);
  uint64_t v9 = sub_10001C9AC(v8);
  __chkstk_darwin(v9);
  sub_1000C1C94();
  uint64_t v10 = type metadata accessor for DatedSubscribers();
  sub_10000C568();
  uint64_t v12 = v11;
  __chkstk_darwin(v13);
  sub_100085CC0();
  if (sub_1000082E8(a1, 1, v10) == 1)
  {
    sub_1000437A4(a1, &qword_1000FF1D8);
    sub_1000BFE10(v3);
    swift_bridgeObjectRelease();
    return sub_1000437A4(v3, &qword_1000FF1D8);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v4, a1, v10);
    sub_1000C0124(v4, a2, a3);
    return swift_bridgeObjectRelease();
  }
}

void sub_1000BAAEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,char a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  sub_1000098B8();
  char v37 = v36;
  uint64_t v39 = v38;
  char v41 = v40;
  uint64_t v43 = v42;
  uint64_t v45 = v44;
  uint64_t v47 = v46;
  uint64_t v49 = v48;
  uint64_t v51 = v50;
  sub_100005E5C(&qword_1000FCC08);
  uint64_t inited = swift_initStackObject();
  uint64_t v53 = inited;
  *(_OWORD *)(inited + 16) = xmmword_1000CFCD0;
  *(unsigned char *)(inited + 32) = 2;
  if (v49)
  {
    char v54 = &type metadata for String;
    uint64_t v55 = v49;
  }
  else
  {
    uint64_t v51 = 0;
    uint64_t v55 = 0;
    char v54 = 0;
    *(void *)(inited + 56) = 0;
  }
  *(void *)(inited + 40) = v51;
  *(void *)(inited + 48) = v55;
  *(void *)(inited + 64) = v54;
  *(unsigned char *)(inited + 72) = 11;
  if (v45)
  {
    uint64_t v56 = &type metadata for String;
    uint64_t v57 = v45;
  }
  else
  {
    uint64_t v47 = 0;
    uint64_t v57 = 0;
    uint64_t v56 = 0;
    *(void *)(inited + 96) = 0;
  }
  *(void *)(inited + 80) = v47;
  *(void *)(inited + 88) = v57;
  *(void *)(inited + 104) = v56;
  *(unsigned char *)(inited + 112) = 12;
  if (v41)
  {
    uint64_t v58 = 0;
    uint64_t v43 = 0;
    *(void *)(inited + 128) = 0;
    *(void *)(inited + 136) = 0;
  }
  else
  {
    uint64_t v58 = &type metadata for UInt64;
  }
  *(void *)(inited + 144) = v58;
  *(void *)(inited + 120) = v43;
  *(unsigned char *)(inited + 152) = 17;
  if (a29)
  {
    uint64_t v60 = 0;
    a28 = 0;
    *(void *)(inited + 168) = 0;
    *(void *)(inited + 176) = 0;
  }
  else
  {
    uint64_t v60 = &type metadata for Int;
  }
  *(void *)(inited + 184) = v60;
  *(void *)(inited + 160) = a28;
  *(unsigned char *)(inited + 192) = 9;
  if (v37)
  {
    uint64_t v61 = 0;
    uint64_t v39 = 0;
    *(void *)(inited + 208) = 0;
    *(void *)(inited + 216) = 0;
  }
  else
  {
    uint64_t v61 = &type metadata for UInt64;
  }
  *(void *)(inited + 224) = v61;
  *(void *)(inited + 200) = v39;
  *(unsigned char *)(inited + 232) = 13;
  if (a22)
  {
    unint64_t v63 = 0;
    a21 = 0;
    *(void *)(inited + 248) = 0;
    *(void *)(inited + 256) = 0;
  }
  else
  {
    unint64_t v63 = &type metadata for UInt64;
  }
  *(void *)(inited + 264) = v63;
  *(void *)(inited + 240) = a21;
  *(unsigned char *)(inited + 272) = 15;
  if (a24)
  {
    unsigned int v65 = &type metadata for String;
    uint64_t v66 = a24;
  }
  else
  {
    a23 = 0;
    uint64_t v66 = 0;
    unsigned int v65 = 0;
    *(void *)(inited + 296) = 0;
  }
  *(void *)(inited + 280) = a23;
  *(void *)(inited + 288) = v66;
  *(void *)(inited + 304) = v65;
  *(unsigned char *)(inited + 312) = 14;
  if (a31)
  {
    unint64_t v68 = 0;
    a30 = 0;
    *(void *)(inited + 328) = 0;
    *(void *)(inited + 336) = 0;
  }
  else
  {
    unint64_t v68 = &type metadata for UInt64;
  }
  *(void *)(inited + 344) = v68;
  *(void *)(inited + 320) = a30;
  *(unsigned char *)(inited + 352) = 16;
  sub_100005E5C(&qword_1000FD7F8);
  uint64_t v69 = swift_initStackObject();
  uint64_t v70 = (void *)v69;
  *(_OWORD *)(v69 + 16) = xmmword_1000CB470;
  if (a27)
  {
    *(void *)(v69 + 32) = 0;
    *(void *)(v69 + 40) = 0;
    *(void *)(v69 + 48) = a32;
    *(void *)(v69 + 56) = a33;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v75 = _swiftEmptyArrayStorage;
  }
  else
  {
    v93[0] = a26;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v71 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v73 = v72;
    v70[4] = v71;
    v70[5] = v72;
    v70[6] = a32;
    v70[7] = a33;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_10001574C();
    uint64_t v75 = v74;
    unint64_t v76 = v74[2];
    if (v76 >= v74[3] >> 1)
    {
      sub_10001574C();
      uint64_t v75 = v92;
    }
    v75[2] = v76 + 1;
    uint64_t v77 = &v75[2 * v76];
    v77[4] = v71;
    v77[5] = v73;
  }
  if (a33)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_10001574C();
      uint64_t v75 = v90;
    }
    unint64_t v78 = v75[2];
    if (v78 >= v75[3] >> 1)
    {
      sub_10001574C();
      uint64_t v75 = v91;
    }
    v75[2] = v78 + 1;
    uint64_t v79 = &v75[2 * v78];
    v79[4] = a32;
    v79[5] = a33;
  }
  swift_release();
  v93[0] = v75;
  sub_100005E5C(&qword_1000FC7D0);
  sub_10000953C((unint64_t *)&qword_1000FC7D8, &qword_1000FC7D0);
  uint64_t v80 = BidirectionalCollection<>.joined(separator:)();
  uint64_t v82 = v81;
  swift_bridgeObjectRelease();
  *(void *)(v53 + 384) = &type metadata for String;
  *(void *)(v53 + 360) = v80;
  *(void *)(v53 + 368) = v82;
  *(unsigned char *)(v53 + 392) = 1;
  if (a35)
  {
    uint64_t v83 = a34;
    uint64_t v84 = &type metadata for String;
    uint64_t v85 = a35;
  }
  else
  {
    sub_1000C1BDC();
    *(void *)(v53 + 416) = 0;
  }
  *(void *)(v53 + 400) = v83;
  *(void *)(v53 + 408) = v85;
  *(void *)(v53 + 424) = v84;
  swift_bridgeObjectRetain();
  sub_100005E5C((uint64_t *)&unk_1000FC300);
  sub_100027288();
  uint64_t v86 = Dictionary.init(dictionaryLiteral:)();
  sub_10008DF48(a36, (uint64_t)v93, &qword_1000FD800);
  uint64_t v87 = v94;
  if (v94)
  {
    uint64_t v88 = v95;
    sub_100005EA0(v93, v94);
    uint64_t v89 = (*(uint64_t (**)(uint64_t, uint64_t))(v88 + 8))(v87, v88);
    sub_100006178((uint64_t)v93);
  }
  else
  {
    sub_1000437A4((uint64_t)v93, &qword_1000FD800);
    uint64_t v89 = Dictionary.init(dictionaryLiteral:)();
  }
  sub_1000BC794(v89, v86);
  sub_1000098A0();
}

uint64_t sub_1000BB028(uint64_t a1, __int16 a2)
{
  uint64_t v5 = v2;
  uint64_t v8 = sub_100005E5C(&qword_1000FF728);
  sub_10000C568();
  uint64_t v104 = v9;
  __chkstk_darwin(v10);
  sub_10000C58C();
  uint64_t v103 = v11;
  uint64_t v12 = type metadata accessor for MetricsFieldsContext();
  sub_10000C568();
  uint64_t v14 = v13;
  __chkstk_darwin(v15);
  sub_10004D594();
  uint64_t v101 = v16;
  sub_100051124();
  __chkstk_darwin(v17);
  os_log_t v102 = (char *)&v95 - v18;
  uint64_t v19 = type metadata accessor for MetricsData();
  sub_10000C568();
  uint64_t v106 = v20;
  __chkstk_darwin(v21);
  sub_100085CC0();
  uint64_t v22 = sub_100005E5C(&qword_100100138);
  uint64_t v23 = sub_10001C9AC(v22);
  __chkstk_darwin(v23);
  sub_100009908();
  id v24 = [objc_allocWithZone((Class)ACAccountStore) init];
  ACAccountStore.activeAccount.getter();

  uint64_t v25 = type metadata accessor for Account();
  if (sub_1000082E8(v3, 1, v25) == 1) {
    return sub_1000437A4(v3, &qword_100100138);
  }
  uint64_t v96 = v14;
  sub_1000437A4(v3, &qword_100100138);
  uint64_t v122 = a1;
  __int16 v123 = a2 & 0x101;
  unint64_t v27 = &OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_notificationLottery;
  if ((a2 & 1) == 0) {
    unint64_t v27 = &OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_loadUrlLottery;
  }
  uint64_t v28 = *v27;
  uint64_t v105 = v5;
  uint64_t v29 = (uint64_t *)(v5 + v28);
  uint64_t v30 = *v29;
  uint64_t v31 = v29[1];
  unint64_t v32 = 0x6C725564616F6CLL;
  unint64_t v33 = 0x80000001000D2FC0;
  if (a2) {
    unint64_t v32 = 0xD000000000000011;
  }
  else {
    unint64_t v33 = 0xE700000000000000;
  }
  uint64_t v120 = (uint64_t)&type metadata for String;
  v119[0] = v32;
  v119[1] = v33;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1000BA894((uint64_t)v119, 3);
  uint64_t v120 = (uint64_t)&type metadata for Double;
  v119[0] = v30;
  sub_1000BA894((uint64_t)v119, 18);
  swift_bridgeObjectRelease();
  uint64_t v120 = (uint64_t)&type metadata for Double;
  v119[0] = v31;
  sub_1000BA894((uint64_t)v119, 19);
  uint64_t v120 = (uint64_t)&type metadata for String;
  v119[0] = 0xD000000000000011;
  v119[1] = 0x80000001000D0580;
  sub_1000BA894((uint64_t)v119, 0);
  uint64_t v34 = v122;
  sub_10009077C(1uLL, v122, v119);
  uint64_t v35 = v120;
  sub_1000437A4((uint64_t)v119, &qword_100100140);
  if (v35 == 1)
  {
    uint64_t v120 = (uint64_t)&type metadata for String;
    strcpy((char *)v119, "com.apple.tv");
    BYTE5(v119[1]) = 0;
    HIWORD(v119[1]) = -5120;
    sub_1000BA894((uint64_t)v119, 1);
    uint64_t v34 = v122;
  }
  sub_10009077C(0x2AuLL, v34, &v116);
  uint64_t v100 = v19;
  uint64_t v99 = v4;
  uint64_t v98 = v12;
  uint64_t v97 = v8;
  if (*((void *)&v117 + 1) == 1)
  {
    char v36 = &qword_100100140;
    char v37 = &v116;
LABEL_17:
    sub_1000437A4((uint64_t)v37, v36);
    goto LABEL_18;
  }
  sub_10007A0EC((uint64_t)&v116, (uint64_t)v119, (uint64_t *)&unk_1000FC300);
  if (!v120)
  {
    char v36 = (uint64_t *)&unk_1000FC300;
    char v37 = (long long *)v119;
    goto LABEL_17;
  }
  if (swift_dynamicCast())
  {
    uint64_t v38 = *((void *)&v114 + 1);
    uint64_t v39 = (void *)(v105 + OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_environmentDataCenter);
    *uint64_t v39 = v114;
    v39[1] = v38;
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
LABEL_18:
  uint64_t v40 = *(void *)(v105 + OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_environmentDataCenter + 8);
  if (v40)
  {
    uint64_t v41 = *(void *)(v105 + OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_environmentDataCenter);
    uint64_t v120 = (uint64_t)&type metadata for String;
    v119[0] = v41;
    v119[1] = v40;
  }
  else
  {
    memset(v119, 0, sizeof(v119));
    uint64_t v120 = 1;
  }
  swift_bridgeObjectRetain();
  sub_1000BA894((uint64_t)v119, 42);
LABEL_22:
  sub_1000BDFEC(&v122);
  uint64_t v42 = v122;
  uint64_t v43 = *(void *)(v122 + 64);
  uint64_t v108 = v122 + 64;
  uint64_t v44 = 1 << *(unsigned char *)(v122 + 32);
  uint64_t v45 = -1;
  if (v44 < 64) {
    uint64_t v45 = ~(-1 << v44);
  }
  uint64_t v46 = v45 & v43;
  uint64_t v47 = (char *)&v116 + 8;
  uint64_t v48 = &v119[1];
  int64_t v110 = (unint64_t)(v44 + 63) >> 6;
  int64_t v95 = v110 - 1;
  swift_bridgeObjectRetain();
  int64_t v49 = 0;
  uint64_t v50 = &_swiftEmptyDictionarySingleton;
  id v107 = (char *)&type metadata for Any + 8;
  uint64_t v109 = &v119[1];
  if (!v46) {
    goto LABEL_27;
  }
LABEL_25:
  sub_1000C1D3C();
  unint64_t v52 = v51 | (v49 << 6);
LABEL_26:
  uint64_t v53 = *(void *)(v42 + 56);
  LOBYTE(v116) = *(unsigned char *)(*(void *)(v42 + 48) + v52);
  sub_10008DF48(v53 + 32 * v52, (uint64_t)v47, (uint64_t *)&unk_1000FC300);
  while (1)
  {
    sub_10007A0EC((uint64_t)&v116, (uint64_t)v119, &qword_100100148);
    if (v121 == (void *)1)
    {
      swift_release();
      MetricsData.init(topic:shouldFlush:fields:includingFields:excludingFields:)();
      char v84 = v123;
      uint64_t v85 = swift_bridgeObjectRetain();
      char v86 = sub_1000BE924(v85, v84);
      swift_bridgeObjectRelease();
      if (v86)
      {
        uint64_t v87 = v101;
        MetricsFieldsContext.init()();
        v119[0] = 0xD000000000000012;
        v119[1] = 0x80000001000D0540;
        static MetricsFieldsContext.Property<A>.topic.getter();
        uint64_t v88 = v102;
        MetricsFieldsContext.addingValue<A>(_:forProperty:)();
        sub_100009894();
        v89();
        swift_bridgeObjectRelease();
        unint64_t v90 = *(void (**)(uint64_t, uint64_t))(v96 + 8);
        uint64_t v91 = v98;
        v90(v87, v98);
        MetricsPipeline.process(_:using:)();
        v90((uint64_t)v88, v91);
        uint64_t v92 = sub_10001C1C0(0, (unint64_t *)&qword_1000FC998);
        uint64_t v93 = static OS_dispatch_queue.main.getter();
        uint64_t v120 = v92;
        unint64_t v121 = &protocol witness table for OS_dispatch_queue;
        v119[0] = v93;
        Promise.then(perform:orCatchError:on:)();
        swift_release();
        sub_100006178((uint64_t)v119);
      }
      sub_100009894();
      v94();
      return swift_bridgeObjectRelease();
    }
    char v57 = v119[0];
    sub_10007A0EC((uint64_t)v48, (uint64_t)&v116, (uint64_t *)&unk_1000FC300);
    if ((v57 - 45) <= 0xFDu)
    {
      int64_t v111 = v49;
      unint64_t v58 = sub_1000990CC(v57);
      unint64_t v60 = v59;
      sub_10008DF48((uint64_t)&v116, (uint64_t)&v114, (uint64_t *)&unk_1000FC300);
      if (v115)
      {
        uint64_t v61 = v42;
        uint64_t v62 = v47;
        sub_100028F5C(&v114, v113);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v112 = v50;
        unint64_t v64 = v60;
        sub_1000175F0();
        sub_1000C1CB0();
        Swift::Int v69 = v67 + v68;
        if (__OFADD__(v67, v68)) {
          goto LABEL_67;
        }
        unint64_t v70 = v65;
        char v71 = v66;
        sub_100005E5C(&qword_100100150);
        if (_NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v69))
        {
          unint64_t v72 = sub_1000175F0();
          if ((v71 & 1) != (v73 & 1)) {
            goto LABEL_70;
          }
          unint64_t v70 = v72;
        }
        uint64_t v50 = v112;
        if (v71)
        {
          uint64_t v74 = (_OWORD *)(v112[7] + 32 * v70);
          sub_100006178((uint64_t)v74);
          sub_100028F5C(v113, v74);
        }
        else
        {
          v112[(v70 >> 6) + 8] |= 1 << v70;
          uint64_t v80 = (unint64_t *)(v50[6] + 16 * v70);
          unint64_t *v80 = v58;
          v80[1] = v64;
          sub_100028F5C(v113, (_OWORD *)(v50[7] + 32 * v70));
          uint64_t v81 = v50[2];
          BOOL v82 = __OFADD__(v81, 1);
          uint64_t v83 = v81 + 1;
          if (v82) {
            goto LABEL_68;
          }
          v50[2] = v83;
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v47 = v62;
        uint64_t v42 = v61;
        uint64_t v48 = v109;
        int64_t v49 = v111;
      }
      else
      {
        sub_1000437A4((uint64_t)&v114, (uint64_t *)&unk_1000FC300);
        swift_bridgeObjectRetain();
        unint64_t v75 = sub_1000175F0();
        char v77 = v76;
        swift_bridgeObjectRelease();
        if (v77)
        {
          char v78 = swift_isUniquelyReferenced_nonNull_native();
          unint64_t v112 = v50;
          Swift::Int v79 = v50[3];
          sub_100005E5C(&qword_100100150);
          _NativeDictionary.ensureUnique(isUnique:capacity:)(v78, v79);
          uint64_t v50 = v112;
          swift_bridgeObjectRelease();
          sub_100028F5C((_OWORD *)(v50[7] + 32 * v75), v113);
          _NativeDictionary._delete(at:)();
          swift_bridgeObjectRelease();
        }
        else
        {
          memset(v113, 0, sizeof(v113));
        }
        int64_t v49 = v111;
        swift_bridgeObjectRelease();
        sub_1000437A4((uint64_t)v113, (uint64_t *)&unk_1000FC300);
      }
    }
    sub_1000437A4((uint64_t)&v116, (uint64_t *)&unk_1000FC300);
    if (v46) {
      goto LABEL_25;
    }
LABEL_27:
    int64_t v54 = v49 + 1;
    if (__OFADD__(v49, 1)) {
      break;
    }
    if (v54 < v110)
    {
      unint64_t v55 = *(void *)(v108 + 8 * v54);
      if (v55) {
        goto LABEL_30;
      }
      int64_t v56 = v49 + 2;
      ++v49;
      if (v54 + 1 < v110)
      {
        unint64_t v55 = *(void *)(v108 + 8 * v56);
        if (v55) {
          goto LABEL_33;
        }
        int64_t v49 = v54 + 1;
        if (v54 + 2 < v110)
        {
          unint64_t v55 = *(void *)(v108 + 8 * (v54 + 2));
          if (v55)
          {
            v54 += 2;
            goto LABEL_30;
          }
          int64_t v56 = v54 + 3;
          int64_t v49 = v54 + 2;
          if (v54 + 3 < v110)
          {
            unint64_t v55 = *(void *)(v108 + 8 * v56);
            if (!v55)
            {
              while (1)
              {
                int64_t v54 = v56 + 1;
                if (__OFADD__(v56, 1)) {
                  goto LABEL_69;
                }
                if (v54 >= v110)
                {
                  int64_t v49 = v95;
                  goto LABEL_44;
                }
                unint64_t v55 = *(void *)(v108 + 8 * v54);
                ++v56;
                if (v55) {
                  goto LABEL_30;
                }
              }
            }
LABEL_33:
            int64_t v54 = v56;
LABEL_30:
            uint64_t v46 = (v55 - 1) & v55;
            unint64_t v52 = __clz(__rbit64(v55)) + (v54 << 6);
            int64_t v49 = v54;
            goto LABEL_26;
          }
        }
      }
    }
LABEL_44:
    uint64_t v46 = 0;
    long long v116 = 0u;
    long long v117 = 0u;
    uint64_t v118 = 1;
  }
  __break(1u);
LABEL_67:
  __break(1u);
LABEL_68:
  __break(1u);
LABEL_69:
  __break(1u);
LABEL_70:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

void sub_1000BBB94()
{
  sub_1000098B8();
  uint64_t v1 = sub_100005E5C((uint64_t *)&unk_1000FDA80);
  uint64_t v2 = sub_10001C9AC(v1);
  __chkstk_darwin(v2);
  sub_10000C58C();
  uint64_t v119 = v3;
  uint64_t v4 = sub_100005E5C(&qword_1000FC938);
  uint64_t v5 = sub_10001C9AC(v4);
  __chkstk_darwin(v5);
  sub_10004D594();
  uint64_t v123 = v6;
  sub_100051124();
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v113 - v8;
  __chkstk_darwin(v10);
  sub_100051130();
  uint64_t v121 = v11;
  sub_100051124();
  __chkstk_darwin(v12);
  sub_100051130();
  uint64_t v118 = v13;
  sub_100051124();
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v113 - v15;
  __chkstk_darwin(v17);
  sub_100051130();
  uint64_t v117 = v18;
  sub_100051124();
  __chkstk_darwin(v19);
  sub_100051130();
  uint64_t v115 = v20;
  sub_100051124();
  __chkstk_darwin(v21);
  sub_100051130();
  uint64_t v114 = v22;
  sub_100051124();
  __chkstk_darwin(v23);
  uint64_t v25 = (char *)&v113 - v24;
  __chkstk_darwin(v26);
  uint64_t v28 = (char *)&v113 - v27;
  __chkstk_darwin(v29);
  uint64_t v31 = (char *)&v113 - v30;
  sub_100005E5C(&qword_1000FCC08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000CFCE0;
  *(unsigned char *)(inited + 32) = 5;
  uint64_t v120 = type metadata accessor for ApiRequestMetrics();
  uint64_t v33 = v0;
  uint64_t v34 = v0 + *(int *)(v120 + 40);
  sub_10008DF48(v34, (uint64_t)v31, &qword_1000FC938);
  uint64_t v35 = type metadata accessor for Date();
  int v36 = sub_1000082E8((uint64_t)v31, 1, v35);
  uint64_t v122 = v9;
  uint64_t v116 = v34;
  if (v36 == 1)
  {
    sub_1000437A4((uint64_t)v31, &qword_1000FC938);
    *(_OWORD *)(inited + 40) = 0u;
    *(_OWORD *)(inited + 56) = 0u;
  }
  else
  {
    uint64_t v37 = sub_1000A268C();
    *(void *)(inited + 64) = &type metadata for UInt64;
    *(void *)(inited + 40) = v37;
    sub_1000C1BCC();
    sub_1000C1BEC();
    v38();
  }
  uint64_t v39 = v33;
  uint64_t v40 = (int *)v120;
  *(unsigned char *)(inited + 72) = 6;
  uint64_t v41 = v39 + v40[15];
  sub_10008DF48(v41, (uint64_t)v28, &qword_1000FC938);
  sub_1000C1BAC((uint64_t)v28);
  uint64_t v120 = v41;
  if (v42)
  {
    sub_1000437A4((uint64_t)v28, &qword_1000FC938);
    sub_1000C1BF8();
  }
  else
  {
    uint64_t v43 = sub_1000A268C();
    *(void *)(inited + 104) = &type metadata for UInt64;
    *(void *)(inited + 80) = v43;
    sub_1000C1BCC();
    sub_1000C1BEC();
    v44();
  }
  uint64_t v45 = v119;
  *(unsigned char *)(inited + 112) = 25;
  sub_10008DF48(v39, (uint64_t)v25, &qword_1000FC938);
  sub_1000C1BAC((uint64_t)v25);
  if (v42)
  {
    sub_1000437A4((uint64_t)v25, &qword_1000FC938);
    sub_1000C1BF8();
  }
  else
  {
    uint64_t v46 = sub_1000A268C();
    *(void *)(inited + 144) = &type metadata for UInt64;
    *(void *)(inited + 120) = v46;
    sub_1000C1BCC();
    sub_1000C1BEC();
    v47();
  }
  uint64_t v48 = v117;
  uint64_t v49 = v114;
  *(unsigned char *)(inited + 152) = 26;
  char v50 = *(unsigned char *)(v39 + v40[11]);
  *(void *)(inited + 184) = &type metadata for Bool;
  *(unsigned char *)(inited + 160) = v50;
  *(unsigned char *)(inited + 192) = 27;
  sub_10008DF48(v39 + v40[5], v49, &qword_1000FC938);
  sub_1000C1BAC(v49);
  if (v42)
  {
    sub_1000437A4(v49, &qword_1000FC938);
    sub_1000C1BF8();
  }
  else
  {
    uint64_t v51 = sub_1000A268C();
    *(void *)(inited + 224) = &type metadata for UInt64;
    *(void *)(inited + 200) = v51;
    sub_1000C1BCC();
    sub_1000C1BEC();
    v52();
  }
  uint64_t v53 = v115;
  *(unsigned char *)(inited + 232) = 28;
  sub_10008DF48(v39 + v40[8], v53, &qword_1000FC938);
  sub_1000C1BAC(v53);
  if (v42)
  {
    sub_1000437A4(v53, &qword_1000FC938);
    sub_1000C1BF8();
  }
  else
  {
    uint64_t v54 = sub_1000A268C();
    *(void *)(inited + 264) = &type metadata for UInt64;
    *(void *)(inited + 240) = v54;
    sub_1000C1BCC();
    sub_1000C1BEC();
    v55();
  }
  *(unsigned char *)(inited + 272) = 29;
  sub_10008DF48(v39 + v40[9], v48, &qword_1000FC938);
  sub_1000C1BAC(v48);
  if (v42)
  {
    sub_1000437A4(v48, &qword_1000FC938);
    sub_1000C1BF8();
  }
  else
  {
    uint64_t v56 = sub_1000A268C();
    *(void *)(inited + 304) = &type metadata for UInt64;
    *(void *)(inited + 280) = v56;
    sub_1000C1BCC();
    sub_1000C1BEC();
    v57();
  }
  uint64_t v58 = v116;
  *(unsigned char *)(inited + 312) = 30;
  sub_10008DF48(v58, (uint64_t)v16, &qword_1000FC938);
  sub_1000C1BAC((uint64_t)v16);
  if (v42)
  {
    sub_1000437A4((uint64_t)v16, &qword_1000FC938);
    sub_1000C1BF8();
  }
  else
  {
    uint64_t v59 = sub_1000A268C();
    *(void *)(inited + 344) = &type metadata for UInt64;
    *(void *)(inited + 320) = v59;
    sub_1000C1BCC();
    sub_1000C1BEC();
    v60();
  }
  uint64_t v61 = v118;
  *(unsigned char *)(inited + 352) = 31;
  uint64_t v62 = (uint64_t *)(v39 + v40[12]);
  uint64_t v63 = v62[1];
  if (v63)
  {
    uint64_t v64 = *v62;
    unint64_t v65 = &type metadata for String;
    uint64_t v66 = v63;
  }
  else
  {
    sub_1000C1BDC();
    *(void *)(inited + 376) = 0;
  }
  *(void *)(inited + 360) = v64;
  *(void *)(inited + 368) = v66;
  *(void *)(inited + 384) = v65;
  *(unsigned char *)(inited + 392) = 32;
  uint64_t v67 = *(void *)(v39 + v40[6]);
  *(void *)(inited + 424) = &type metadata for Int64;
  *(void *)(inited + 400) = v67;
  *(unsigned char *)(inited + 432) = 33;
  sub_10008DF48(v39 + v40[13], v61, &qword_1000FC938);
  int v68 = sub_1000082E8(v61, 1, v35);
  swift_bridgeObjectRetain();
  if (v68 == 1)
  {
    sub_1000437A4(v61, &qword_1000FC938);
    *(_OWORD *)(inited + 440) = 0u;
    *(_OWORD *)(inited + 456) = 0u;
  }
  else
  {
    uint64_t v69 = sub_1000A268C();
    *(void *)(inited + 464) = &type metadata for UInt64;
    *(void *)(inited + 440) = v69;
    sub_1000C1BCC();
    sub_1000C1BEC();
    v70();
  }
  *(unsigned char *)(inited + 472) = 4;
  sub_10008DF48(v39 + v40[14], v45, (uint64_t *)&unk_1000FDA80);
  uint64_t v71 = type metadata accessor for URL();
  if (sub_1000082E8(v45, 1, v71) == 1)
  {
    sub_1000437A4(v45, (uint64_t *)&unk_1000FDA80);
    sub_1000C1BF8();
  }
  else
  {
    uint64_t v72 = URL.absoluteString.getter();
    *(void *)(inited + 504) = &type metadata for String;
    *(void *)(inited + 480) = v72;
    *(void *)(inited + 488) = v73;
    sub_1000438A0();
    (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v45, v71);
  }
  uint64_t v76 = v121;
  uint64_t v75 = (uint64_t)v122;
  uint64_t v77 = v120;
  *(unsigned char *)(inited + 512) = 34;
  sub_10008DF48(v77, v76, &qword_1000FC938);
  sub_1000C1BAC(v76);
  if (v42)
  {
    sub_1000437A4(v76, &qword_1000FC938);
    sub_1000C1BF8();
  }
  else
  {
    uint64_t v78 = sub_1000A268C();
    *(void *)(inited + 544) = &type metadata for UInt64;
    *(void *)(inited + 520) = v78;
    sub_1000C1BCC();
    sub_1000C1BEC();
    v79();
  }
  *(unsigned char *)(inited + 552) = 35;
  uint64_t v80 = *(void *)(v39 + v40[7]);
  *(void *)(inited + 584) = &type metadata for Int64;
  *(void *)(inited + 560) = v80;
  *(unsigned char *)(inited + 592) = 36;
  sub_10008DF48(v39 + v40[16], v75, &qword_1000FC938);
  sub_1000C1BAC(v75);
  if (v42)
  {
    sub_1000437A4(v75, &qword_1000FC938);
    sub_1000C1BF8();
  }
  else
  {
    uint64_t v81 = sub_1000A268C();
    *(void *)(inited + 624) = &type metadata for UInt64;
    *(void *)(inited + 600) = v81;
    sub_1000C1BCC();
    sub_1000C1BEC();
    v82();
  }
  *(unsigned char *)(inited + 632) = 37;
  uint64_t v83 = v123;
  sub_10008DF48(v39 + v40[17], v123, &qword_1000FC938);
  sub_1000C1BAC(v83);
  if (v42)
  {
    sub_1000437A4(v123, &qword_1000FC938);
    sub_1000C1BF8();
  }
  else
  {
    uint64_t v84 = sub_1000A268C();
    *(void *)(inited + 664) = &type metadata for UInt64;
    *(void *)(inited + 640) = v84;
    sub_1000C1BCC();
    sub_1000C1BEC();
    v85();
  }
  *(unsigned char *)(inited + 672) = 38;
  uint64_t v86 = v39 + v40[18];
  if (*(unsigned char *)(v86 + 8))
  {
    uint64_t v87 = 0;
    uint64_t v88 = 0;
    *(_OWORD *)(inited + 688) = 0u;
  }
  else
  {
    uint64_t v87 = *(void *)v86;
    uint64_t v88 = &type metadata for Int;
  }
  *(void *)(inited + 680) = v87;
  *(void *)(inited + 704) = v88;
  *(unsigned char *)(inited + 712) = 39;
  uint64_t v89 = (uint64_t *)(v39 + v40[19]);
  uint64_t v90 = v89[1];
  if (v90)
  {
    uint64_t v91 = *v89;
    uint64_t v92 = &type metadata for String;
    uint64_t v93 = v90;
  }
  else
  {
    sub_1000C1BDC();
    *(void *)(inited + 736) = 0;
  }
  *(void *)(inited + 720) = v91;
  *(void *)(inited + 728) = v93;
  *(void *)(inited + 744) = v92;
  *(unsigned char *)(inited + 752) = 40;
  uint64_t v94 = (uint64_t *)(v39 + v40[20]);
  uint64_t v95 = v94[1];
  if (v95)
  {
    uint64_t v96 = *v94;
    uint64_t v97 = &type metadata for String;
    uint64_t v98 = v95;
  }
  else
  {
    sub_1000C1BDC();
    *(void *)(inited + 776) = 0;
  }
  *(void *)(inited + 760) = v96;
  *(void *)(inited + 768) = v98;
  *(void *)(inited + 784) = v97;
  *(unsigned char *)(inited + 792) = 41;
  uint64_t v99 = (uint64_t *)(v39 + v40[21]);
  uint64_t v100 = v99[1];
  if (v100)
  {
    uint64_t v101 = *v99;
    os_log_t v102 = &type metadata for String;
    uint64_t v103 = v100;
  }
  else
  {
    sub_1000C1BDC();
    *(void *)(inited + 816) = 0;
  }
  *(void *)(inited + 800) = v101;
  *(void *)(inited + 808) = v103;
  *(void *)(inited + 824) = v102;
  *(unsigned char *)(inited + 832) = 42;
  uint64_t v104 = (uint64_t *)(v39 + v40[22]);
  uint64_t v105 = v104[1];
  if (v105)
  {
    uint64_t v106 = *v104;
    id v107 = &type metadata for String;
    uint64_t v108 = v105;
  }
  else
  {
    sub_1000C1BDC();
    *(void *)(inited + 856) = 0;
  }
  *(void *)(inited + 840) = v106;
  *(void *)(inited + 848) = v108;
  *(void *)(inited + 864) = v107;
  *(unsigned char *)(inited + 872) = 15;
  uint64_t v109 = (uint64_t *)(v39 + v40[23]);
  uint64_t v110 = v109[1];
  if (v110)
  {
    uint64_t v111 = *v109;
    unint64_t v112 = &type metadata for String;
  }
  else
  {
    uint64_t v111 = 0;
    unint64_t v112 = 0;
    *(void *)(inited + 896) = 0;
  }
  *(void *)(inited + 880) = v111;
  *(void *)(inited + 888) = v110;
  *(void *)(inited + 904) = v112;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_100005E5C((uint64_t *)&unk_1000FC300);
  sub_100027288();
  Dictionary.init(dictionaryLiteral:)();
  sub_1000098A0();
}

uint64_t sub_1000BC67C()
{
  sub_100005E5C(&qword_1000FCC08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000CABA0;
  uint64_t v1 = (_OWORD *)(inited + 40);
  *(unsigned char *)(inited + 32) = 38;
  type metadata accessor for AMSError(0);
  sub_1000C1A10(&qword_1000FBED8, type metadata accessor for AMSError);
  uint64_t v2 = _BridgedStoredNSError.errorUserInfo.getter();
  sub_100090720(v2, v1);
  swift_bridgeObjectRelease();
  sub_100005E5C((uint64_t *)&unk_1000FC300);
  sub_100027288();
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_1000BC794(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = a2;
  sub_1000C02FC(a1, (uint64_t)sub_1000C023C, 0, isUniquelyReferenced_nonNull_native, &v8);
  uint64_t v6 = v8;
  swift_bridgeObjectRelease();
  if (v2) {
    swift_bridgeObjectRelease();
  }
  return v6;
}

void sub_1000BC820()
{
  sub_1000098B8();
  uint64_t v2 = v1;
  uint64_t v34 = v3;
  uint64_t v5 = v4;
  uint64_t v6 = sub_100005E5C((uint64_t *)&unk_1000FDA80);
  uint64_t v7 = sub_10001C9AC(v6);
  __chkstk_darwin(v7);
  sub_100085CC0();
  uint64_t v8 = type metadata accessor for Date();
  sub_10000C568();
  uint64_t v10 = v9;
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100090A98(43, v5, &v35);
  if (v36) {
    swift_dynamicCast();
  }
  else {
    sub_1000437A4((uint64_t)&v35, (uint64_t *)&unk_1000FC300);
  }
  sub_100005E5C(&qword_1000FCC08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000CB3B0;
  *(unsigned char *)(inited + 32) = 9;
  Date.init()();
  uint64_t v15 = sub_1000A268C();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
  *(void *)(inited + 64) = &type metadata for UInt64;
  *(void *)(inited + 40) = v15;
  *(unsigned char *)(inited + 72) = 4;
  URLRequest.url.getter();
  uint64_t v16 = type metadata accessor for URL();
  if (sub_1000082E8(v0, 1, v16) == 1)
  {
    sub_1000437A4(v0, (uint64_t *)&unk_1000FDA80);
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    *(void *)(inited + 96) = 0;
  }
  else
  {
    uint64_t v17 = URL.absoluteString.getter();
    uint64_t v18 = v20;
    sub_1000438A0();
    sub_100009894();
    v22(v21);
    uint64_t v19 = &type metadata for String;
  }
  *(void *)(inited + 80) = v17;
  *(void *)(inited + 88) = v18;
  *(void *)(inited + 104) = v19;
  *(unsigned char *)(inited + 112) = 39;
  uint64_t v23 = URLRequest.httpMethod.getter();
  if (v24)
  {
    uint64_t v25 = &type metadata for String;
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v25 = 0;
    *(void *)(inited + 136) = 0;
  }
  *(void *)(inited + 120) = v23;
  *(void *)(inited + 128) = v24;
  *(void *)(inited + 144) = v25;
  sub_100005E5C((uint64_t *)&unk_1000FC300);
  sub_100027288();
  uint64_t v26 = Dictionary.init(dictionaryLiteral:)();
  sub_1000A30BC(v5);
  uint64_t v28 = sub_1000BC794(v27, v26);
  uint64_t v29 = swift_bridgeObjectRetain();
  uint64_t v30 = sub_1000BC794(v29, v28);
  sub_10008DF48(v2, (uint64_t)&v35, &qword_1000FD800);
  uint64_t v31 = v36;
  if (v36)
  {
    uint64_t v32 = v37;
    sub_100005EA0(&v35, v36);
    uint64_t v33 = (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 8))(v31, v32);
    sub_100006178((uint64_t)&v35);
  }
  else
  {
    sub_1000437A4((uint64_t)&v35, &qword_1000FD800);
    uint64_t v33 = Dictionary.init(dictionaryLiteral:)();
  }
  sub_1000BC794(v33, v30);
  sub_1000098A0();
}

void sub_1000BCBA8()
{
  sub_1000098B8();
  type metadata accessor for DispatchWorkItemFlags();
  sub_10000C568();
  uint64_t v23 = v0;
  __chkstk_darwin(v1);
  sub_100009908();
  type metadata accessor for DispatchQoS();
  sub_10000C568();
  uint64_t v21 = v3;
  uint64_t v22 = v2;
  __chkstk_darwin(v2);
  sub_1000C1C94();
  uint64_t v4 = type metadata accessor for DispatchTime();
  uint64_t v20 = v4;
  sub_10000C568();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v18 - v11;
  sub_10001C1C0(0, (unint64_t *)&qword_1000FC998);
  uint64_t v13 = (void *)static OS_dispatch_queue.main.getter();
  static DispatchTime.now()();
  + infix(_:_:)();
  uint64_t v19 = *(void (**)(char *, uint64_t))(v6 + 8);
  v19(v9, v4);
  uint64_t v14 = swift_allocObject();
  swift_weakInit();
  v24[4] = sub_1000C19F0;
  v24[5] = v14;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 1107296256;
  v24[2] = sub_10008FF30;
  v24[3] = &unk_1000F55A0;
  uint64_t v15 = _Block_copy(v24);
  swift_release();
  static DispatchQoS.unspecified.getter();
  v24[0] = _swiftEmptyArrayStorage;
  sub_1000C1A10(&qword_100100158, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100005E5C(&qword_100100160);
  sub_10000953C(&qword_100100168, &qword_100100160);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
  _Block_release(v15);

  sub_100009894();
  v16();
  sub_100009894();
  v17();
  v19(v12, v20);
  sub_1000098A0();
}

id sub_1000BCEC8(uint64_t a1, uint64_t a2, char a3)
{
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v5 = [(id)swift_getObjCClassFromMetadata() keyWithName:v4 crossDeviceSync:a3 & 1];

  return v5;
}

unint64_t sub_1000BCF34(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000EFAA0, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 5) {
    return 5;
  }
  else {
    return v3;
  }
}

uint64_t sub_1000BCF80(char a1)
{
  uint64_t result = 0x6172747369676572;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x7473696765726E75;
      break;
    case 2:
      uint64_t result = 0x6C6C416863746566;
      break;
    case 3:
      uint64_t result = 0x61684364756F6C63;
      break;
    case 4:
      uint64_t result = 0x4D7370416C6C7566;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000BD058(unsigned __int8 *a1, char *a2)
{
  return sub_10006A088(*a1, *a2);
}

Swift::Int sub_1000BD064()
{
  return sub_10006AD08(*v0);
}

uint64_t sub_1000BD06C()
{
  return sub_10006AD70();
}

Swift::Int sub_1000BD074(uint64_t a1)
{
  return sub_10006B74C(a1, *v1);
}

unint64_t sub_1000BD07C@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_1000BCF34(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1000BD0AC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000BCF80(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

char *sub_1000BD0D8()
{
  type metadata accessor for SportsPerformanceMeasurement();
  swift_allocObject();
  uint64_t result = sub_1000BD118();
  qword_10010A5E8 = (uint64_t)result;
  return result;
}

char *sub_1000BD118()
{
  uint64_t v96 = *(void *)v0;
  uint64_t v95 = type metadata accessor for MetricsPipeline();
  uint64_t v94 = *(void *)(v95 - 8);
  __chkstk_darwin(v95);
  uint64_t v92 = (char *)&v79 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = type metadata accessor for MetricsFieldExclusionRequest();
  uint64_t v88 = *(void *)(v90 - 8);
  __chkstk_darwin(v90);
  uint64_t v87 = (char *)&v79 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = type metadata accessor for MetricsFieldsAggregator();
  uint64_t v89 = *(void *)(v91 - 8);
  uint64_t v3 = __chkstk_darwin(v91);
  uint64_t v84 = (char *)&v79 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v85 = (char *)&v79 - v5;
  uint64_t v102 = type metadata accessor for MetricsPipeline.Configuration();
  uint64_t v86 = *(void *)(v102 - 8);
  uint64_t v6 = __chkstk_darwin(v102);
  BOOL v82 = (char *)&v79 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v83 = (char *)&v79 - v9;
  __chkstk_darwin(v8);
  uint64_t v93 = (char *)&v79 - v10;
  uint64_t v11 = sub_100005E5C(&qword_1000FF738);
  __chkstk_darwin(v11 - 8);
  uint64_t v81 = (char *)&v79 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for AMSMetricsIdentifierFieldsProvider();
  uint64_t v100 = *(void *)(v13 - 8);
  uint64_t v101 = v13;
  __chkstk_darwin(v13);
  uint64_t v103 = (char *)&v79 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for Bag();
  uint64_t v98 = *(void *)(v15 - 8);
  uint64_t v99 = v15;
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v79 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v79 - v19;
  uint64_t v21 = OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_dataRepository;
  if (qword_1000FBD68 != -1) {
    swift_once();
  }
  *(void *)&v0[v21] = qword_10010A4A0;
  uint64_t v97 = OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_activityCapUtility;
  uint64_t v22 = (objc_class *)type metadata accessor for ActivityAuthorization();
  id v23 = objc_allocWithZone(v22);
  swift_retain();
  id v24 = [v23 init];
  unint64_t v25 = sub_1000522C4();
  uint64_t v27 = v26;
  uint64_t v106 = (uint64_t)v22;
  id v107 = &off_1000F15C8;
  v105[0] = (uint64_t)v24;
  type metadata accessor for ActivityCapUtility();
  uint64_t v28 = (void *)swift_allocObject();
  uint64_t v29 = sub_10000A014((uint64_t)v105, (uint64_t)v22);
  __chkstk_darwin(v29);
  uint64_t v31 = (uint64_t *)((char *)&v79 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v32 + 16))(v31);
  uint64_t v33 = *v31;
  v28[5] = v22;
  v28[6] = &off_1000F15C8;
  uint64_t v34 = v0;
  v28[2] = v33;
  v28[7] = v25;
  v28[8] = v27;
  sub_100006178((uint64_t)v105);
  *(void *)&v0[v97] = v28;
  long long v35 = &v0[OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_environmentDataCenter];
  *(void *)long long v35 = 0;
  *((void *)v35 + 1) = 0;
  if (qword_1000FBD58 != -1) {
    swift_once();
  }
  id v36 = *(id *)(qword_10010A490 + 16);
  Bag.init(from:)();
  uint64_t v80 = (void (*)(char *, uint64_t))sub_100005E5C(&qword_1000FF740);
  uint64_t v37 = *(void (**)(char *, char *))(v98 + 16);
  uint64_t v38 = v99;
  v37(v18, v20);
  uint64_t v97 = LowMemoryMetricsEventLinter.__allocating_init(defaultTopic:bag:rules:)();
  id v39 = [objc_allocWithZone((Class)ACAccountStore) init];
  uint64_t v106 = sub_10001C1C0(0, &qword_1000FF748);
  id v107 = (_UNKNOWN **)&protocol witness table for ACAccountStore;
  v105[0] = (uint64_t)v39;
  uint64_t v40 = (uint64_t)v81;
  ((void (*)(char *, char *, uint64_t))v37)(v81, v20, v38);
  sub_1000082C0(v40, 0, 1, v38);
  sub_100005E5C(&qword_1000FF228);
  uint64_t v41 = swift_allocObject();
  *(_OWORD *)(v41 + 16) = xmmword_1000CF450;
  sub_10001C1C0(0, &qword_1000FF750);
  *(void *)(v41 + 32) = sub_1000BCEC8(0x6449746E65696C63, 0xE800000000000000, 0);
  uint64_t v104 = v41;
  specialized Array._endMutation()();
  id v42 = [self currentProcess];
  static AMSMetricsIdentifierFieldsProvider.metricsResetInterval.getter();
  AMSMetricsIdentifierFieldsProvider.init(accountProvider:process:bag:shouldMigrate:resetInterval:keys:activeITunesAccountRequired:)();
  uint64_t v43 = type metadata accessor for AMSMetricsEventRecorder();
  uint64_t v44 = v38;
  ((void (*)(char *, char *, uint64_t))v37)(v18, v20, v38);
  sub_10005FAC4((uint64_t)&off_1000EEF50);
  uint64_t v45 = AMSMetricsEventRecorder.__allocating_init(bag:defaultTopic:anonymousTopics:)();
  uint64_t v46 = OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_eventRecorder;
  *(void *)&v34[OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_eventRecorder] = v45;
  ((void (*)(char *, char *, uint64_t))v37)(v18, v20, v44);
  uint64_t v106 = (uint64_t)v80;
  id v107 = (_UNKNOWN **)sub_10000953C((unint64_t *)&qword_1000FF760, &qword_1000FF740);
  v105[0] = v97;
  swift_retain();
  sub_10005FAC4((uint64_t)&off_1000EEF80);
  uint64_t v47 = v82;
  MetricsPipeline.Configuration.init(bag:linter:anonymousTopics:)();
  uint64_t v48 = *(void *)&v34[v46];
  uint64_t v106 = v43;
  id v107 = (_UNKNOWN **)&protocol witness table for AMSMetricsEventRecorder;
  v105[0] = v48;
  swift_retain();
  uint64_t v49 = v83;
  MetricsPipeline.Configuration.withRecorder(_:)();
  uint64_t v81 = v34;
  uint64_t v50 = v86;
  uint64_t v80 = *(void (**)(char *, uint64_t))(v86 + 8);
  v80(v47, v102);
  sub_100006178((uint64_t)v105);
  uint64_t v51 = v84;
  MetricsFieldsAggregator.init()();
  uint64_t v52 = v101;
  uint64_t v106 = v101;
  id v107 = (_UNKNOWN **)&protocol witness table for AMSMetricsIdentifierFieldsProvider;
  uint64_t v53 = sub_100029BE0(v105);
  (*(void (**)(uint64_t *, char *, uint64_t))(v100 + 16))(v53, v103, v52);
  uint64_t v54 = v87;
  static MetricsFieldExclusionRequest.amsMetricsID.getter();
  unint64_t v55 = v85;
  MetricsFieldsAggregator.addingOptOutProvider(_:forRequest:)();
  (*(void (**)(char *, uint64_t))(v88 + 8))(v54, v90);
  uint64_t v56 = (uint64_t)v20;
  char v57 = *(void (**)(char *, uint64_t))(v89 + 8);
  uint64_t v58 = v91;
  v57(v51, v91);
  sub_100006178((uint64_t)v105);
  uint64_t v59 = v93;
  MetricsPipeline.Configuration.withAggregator(_:)();
  v57(v55, v58);
  uint64_t v60 = v102;
  uint64_t v61 = v80;
  v80(v49, v102);
  (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v49, v59, v60);
  uint64_t v62 = v92;
  MetricsPipeline.init(from:)();
  uint64_t v63 = v81;
  (*(void (**)(char *, char *, uint64_t))(v94 + 32))(&v81[OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_metricsPipeline], v62, v95);
  double v64 = COERCE_DOUBLE(sub_1000BDD28(v56, 0xD000000000000017, (void *)0x80000001000D3010));
  double v66 = 1.0;
  if (v65) {
    double v67 = 1.0;
  }
  else {
    double v67 = v64;
  }
  double v68 = COERCE_DOUBLE(sub_1000BDD28(v56, 0x446E6F6973736573, (void *)0xEF6E6F6974617275));
  if (v69) {
    double v70 = 60.0;
  }
  else {
    double v70 = v68 / 1000.0;
  }
  double v71 = COERCE_DOUBLE(sub_1000BDD28(v56, 0xD000000000000028, (void *)0x80000001000D3030));
  if ((v72 & 1) == 0) {
    double v66 = v71;
  }
  double v73 = COERCE_DOUBLE(sub_1000BDD28(v56, 0xD000000000000020, (void *)0x80000001000D3060));
  if (v74) {
    double v75 = 60.0;
  }
  else {
    double v75 = v73 / 1000.0;
  }
  uint64_t v76 = &v63[OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_loadUrlLottery];
  *(double *)uint64_t v76 = v67;
  *((double *)v76 + 1) = v70;
  *((void *)v76 + 2) = 0x6C725564616F6CLL;
  *((void *)v76 + 3) = 0xE700000000000000;
  swift_release();
  v61(v59, v60);
  (*(void (**)(char *, uint64_t))(v100 + 8))(v103, v101);
  (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v56, v99);
  uint64_t result = v63;
  uint64_t v78 = &v63[OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_notificationLottery];
  *(double *)uint64_t v78 = v66;
  *((double *)v78 + 1) = v75;
  *((void *)v78 + 2) = 0xD000000000000011;
  *((void *)v78 + 3) = 0x80000001000D2FC0;
  return result;
}

id sub_1000BDD28(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (void *)Bag.amsBag.getter();
  _StringGuts.grow(_:)(41);
  swift_bridgeObjectRelease();
  unint64_t v26 = 0x80000001000D3090;
  v6._uint64_t countAndFlagsBits = a2;
  v6._object = a3;
  String.append(_:)(v6);
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v8 = [v5 doubleForKey:v7];

  swift_unknownObjectRelease();
  id v25 = 0;
  id v9 = [v8 valueWithError:&v25];

  id v10 = v25;
  if (v9)
  {
    id v25 = 0;
    LOBYTE(v26) = 1;
    id v11 = v10;
    static Double._conditionallyBridgeFromObjectiveC(_:result:)();

    id v12 = v25;
    int v13 = v26;
  }
  else
  {
    id v14 = v25;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease();
    id v12 = 0;
    int v13 = 1;
  }
  uint64_t v15 = (void *)Bag.amsBag.getter();
  id v25 = 0;
  unint64_t v26 = 0xE000000000000000;
  _StringGuts.grow(_:)(22);
  swift_bridgeObjectRelease();
  id v25 = (id)0xD000000000000014;
  unint64_t v26 = 0x80000001000D30C0;
  v16._uint64_t countAndFlagsBits = a2;
  v16._object = a3;
  String.append(_:)(v16);
  NSString v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v18 = [v15 doubleForKey:v17];

  swift_unknownObjectRelease();
  id v25 = 0;
  id v19 = [v18 valueWithError:&v25];

  id v20 = v25;
  if (v19)
  {
    id v25 = 0;
    LOBYTE(v26) = 1;
    id v21 = v20;
    static Double._conditionallyBridgeFromObjectiveC(_:result:)();

    id v22 = v25;
  }
  else
  {
    id v23 = v25;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease();
    id v22 = 0;
  }
  if (v13) {
    return v22;
  }
  else {
    return v12;
  }
}

void sub_1000BDFEC(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Sport();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  id v8 = (char *)&v73 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  id v10 = (char *)&v73 - v9;
  uint64_t v11 = *a1;
  if (*(void *)(*a1 + 16))
  {
    unint64_t v12 = sub_100017664(2);
    if (v13)
    {
      sub_10008DF48(*(void *)(v11 + 56) + 32 * v12, (uint64_t)v82, (uint64_t *)&unk_1000FC300);
      sub_10007A0EC((uint64_t)v82, (uint64_t)&v84, (uint64_t *)&unk_1000FC300);
      if (!v87)
      {
        sub_1000437A4((uint64_t)&v84, (uint64_t *)&unk_1000FC300);
        return;
      }
      if (swift_dynamicCast())
      {
        sub_100005EA0((void *)(*(void *)(v2 + OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_dataRepository) + 16), *(void *)(*(void *)(v2 + OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_dataRepository) + 40));
        unint64_t v14 = dispatch thunk of PersistentStorable.retrieveEventSubscription(canonicalId:isConventionalOrUnified:)();
        swift_bridgeObjectRelease();
        if (v14)
        {
          uint64_t v15 = SportingEventSubscription.qosRegistrationId.getter();
          if (v16)
          {
            uint64_t v87 = (uint64_t)&type metadata for String;
            uint64_t v84 = (void *)v15;
            uint64_t v85 = v16;
          }
          else
          {
            uint64_t v84 = 0;
            uint64_t v85 = 0;
            uint64_t v86 = 0;
            uint64_t v87 = 1;
          }
          sub_1000BA894((uint64_t)&v84, 20);
          NSString v17 = (void *)SportingEventSubscription.sportingEventDetails.getter();
          id v18 = (void *)dispatch thunk of SportingEvent.coverage.getter();

          if (v18
            && (id v19 = (void *)dispatch thunk of SportingEventCoverage.ingestion.getter(), v18, v19)
            && (uint64_t v20 = dispatch thunk of SportingEventCoverageIngestion.last.getter(),
                char v22 = v21,
                v19,
                (v22 & 1) == 0))
          {
            unint64_t v23 = sub_1000A26EC(*(double *)&v20);
            uint64_t v83 = &type metadata for UInt64;
            v82[0] = v23;
            sub_10007A0EC((uint64_t)v82, (uint64_t)&v84, (uint64_t *)&unk_1000FC300);
          }
          else
          {
            uint64_t v87 = (uint64_t)&type metadata for Int;
            uint64_t v84 = 0;
          }
          sub_1000BA894((uint64_t)&v84, 14);
          uint64_t v24 = SportingEventSubscription.applicationType.getter();
          if (v25)
          {
            uint64_t v87 = (uint64_t)&type metadata for String;
            uint64_t v84 = (void *)v24;
            uint64_t v85 = v25;
          }
          else
          {
            uint64_t v84 = 0;
            uint64_t v85 = 0;
            uint64_t v86 = 0;
            uint64_t v87 = 1;
          }
          sub_1000BA894((uint64_t)&v84, 21);
          uint64_t v26 = SportingEventSubscription.clientApp.getter();
          uint64_t v87 = (uint64_t)&type metadata for String;
          uint64_t v84 = (void *)v26;
          uint64_t v85 = v27;
          sub_1000BA894((uint64_t)&v84, 1);
          SportingEventSubscription.sport.getter();
          Sport.init(rawValue:)();
          (*(void (**)(char *, void, uint64_t))(v5 + 104))(v8, enum case for Sport.baseball(_:), v4);
          char v28 = sub_10006A948((uint64_t)v10, (uint64_t)v8);
          uint64_t v29 = *(void (**)(char *, uint64_t))(v5 + 8);
          v29(v8, v4);
          v29(v10, v4);
          if ((v28 & 1) == 0) {
            goto LABEL_31;
          }
          sub_10009077C(0x2CuLL, *a1, v82);
          if (v83 == (void *)1)
          {
            uint64_t v30 = &qword_100100140;
            uint64_t v31 = (void **)v82;
LABEL_30:
            sub_1000437A4((uint64_t)v31, v30);
            goto LABEL_31;
          }
          sub_10007A0EC((uint64_t)v82, (uint64_t)&v84, (uint64_t *)&unk_1000FC300);
          if (!v87)
          {
            uint64_t v30 = (uint64_t *)&unk_1000FC300;
            uint64_t v31 = &v84;
            goto LABEL_30;
          }
          if (swift_dynamicCast())
          {
            if (sub_1000BCF80(v81) == 0x4D7370416C6C7566 && v32 == 0xEE00656761737365)
            {
              swift_bridgeObjectRelease();
              goto LABEL_34;
            }
            char v34 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            if (v34)
            {
LABEL_34:
              long long v35 = (void *)SportingEventSubscription.sportingEventDetails.getter();
              unint64_t i = dispatch thunk of SportingEvent.competitors.getter();

              if (i >> 62) {
                goto LABEL_93;
              }
              uint64_t v37 = *(void *)((i & 0xFFFFFFFFFFFFFF8) + 0x10);
              swift_bridgeObjectRetain();
LABEL_36:
              uint64_t v38 = _swiftEmptyArrayStorage;
              if (!v37)
              {
LABEL_85:
                swift_bridgeObjectRelease_n();
                uint64_t v84 = v38;
                sub_100005E5C(&qword_1000FC7D0);
                sub_10000953C((unint64_t *)&qword_1000FC7D8, &qword_1000FC7D0);
                uint64_t v68 = BidirectionalCollection<>.joined(separator:)();
                unint64_t v70 = v69;
                swift_bridgeObjectRelease();
                uint64_t v71 = HIBYTE(v70) & 0xF;
                if ((v70 & 0x2000000000000000) == 0) {
                  uint64_t v71 = v68 & 0xFFFFFFFFFFFFLL;
                }
                if (!v71)
                {

                  swift_bridgeObjectRelease();
                  return;
                }
                uint64_t v72 = sub_10002718C(v68, (void *)v70);
                swift_bridgeObjectRelease();
                sub_1000C0270(v72, (uint64_t)sub_1000C023C, 0, a1);
                goto LABEL_31;
              }
              uint64_t v39 = 0;
              unint64_t v76 = v14;
              unint64_t v77 = i & 0xC000000000000001;
              unint64_t v73 = i + 32;
              unint64_t v74 = i;
              uint64_t v75 = v37;
              while (1)
              {
                if (v77) {
                  id v40 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
                }
                else {
                  id v40 = *(id *)(v73 + 8 * v39);
                }
                if (__OFADD__(v39++, 1))
                {
                  __break(1u);
LABEL_91:
                  __break(1u);
LABEL_92:
                  __break(1u);
LABEL_93:
                  swift_bridgeObjectRetain();
                  uint64_t v37 = _CocoaArrayWrapper.endIndex.getter();
                  goto LABEL_36;
                }
                id v42 = v40;
                uint64_t v43 = (void *)SportingEventCompetitorContainer.competitor.getter();
                unint64_t v14 = dispatch thunk of SportingEventCompetitor.members.getter();

                if (v14) {
                  break;
                }

                unint64_t v14 = v76;
LABEL_84:
                if (v39 == v37) {
                  goto LABEL_85;
                }
              }
              uint64_t v79 = v39;
              id v80 = v42;
              uint64_t v44 = _swiftEmptyArrayStorage;
              uint64_t v84 = _swiftEmptyArrayStorage;
              if (v14 >> 62)
              {
                swift_bridgeObjectRetain();
                uint64_t v45 = _CocoaArrayWrapper.endIndex.getter();
                swift_bridgeObjectRelease();
                if (v45) {
                  goto LABEL_45;
                }
              }
              else
              {
                uint64_t v45 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
                if (v45)
                {
LABEL_45:
                  if (v45 < 1) {
                    goto LABEL_91;
                  }
                  for (unint64_t i = 0; i != v45; ++i)
                  {
                    if ((v14 & 0xC000000000000001) != 0) {
                      id v46 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
                    }
                    else {
                      id v46 = *(id *)(v14 + 8 * i + 32);
                    }
                    uint64_t v47 = v46;
                    unint64_t v48 = dispatch thunk of SportingEventParticipant.images.getter();
                    if (v48
                      && (v48 >> 62
                        ? (uint64_t v49 = _CocoaArrayWrapper.endIndex.getter())
                        : (uint64_t v49 = *(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10)),
                          swift_bridgeObjectRelease(),
                          !v49))
                    {
                      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
                      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
                      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
                      specialized ContiguousArray._endMutation()();
                    }
                    else
                    {
                    }
                  }
                  swift_bridgeObjectRelease();
                  unint64_t v14 = (unint64_t)v84;
                  uint64_t v44 = _swiftEmptyArrayStorage;
LABEL_62:
                  uint64_t v78 = v38;
                  if ((v14 & 0x8000000000000000) != 0 || (v14 & 0x4000000000000000) != 0)
                  {
                    swift_retain();
                    uint64_t v50 = _CocoaArrayWrapper.endIndex.getter();
                    if (v50) {
                      goto LABEL_65;
                    }
                  }
                  else
                  {
                    uint64_t v50 = *(void *)(v14 + 16);
                    swift_retain();
                    if (v50)
                    {
LABEL_65:
                      if (v50 < 1) {
                        goto LABEL_92;
                      }
                      for (uint64_t j = 0; j != v50; ++j)
                      {
                        if ((v14 & 0xC000000000000001) != 0) {
                          id v52 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
                        }
                        else {
                          id v52 = *(id *)(v14 + 8 * j + 32);
                        }
                        uint64_t v53 = v52;
                        uint64_t v54 = dispatch thunk of SportingEventParticipant.displayName.getter();
                        uint64_t v56 = v55;

                        if (v56)
                        {
                          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                          {
                            sub_10001574C();
                            uint64_t v44 = v59;
                          }
                          unint64_t v57 = v44[2];
                          if (v57 >= v44[3] >> 1)
                          {
                            sub_10001574C();
                            uint64_t v44 = v60;
                          }
                          v44[2] = v57 + 1;
                          uint64_t v58 = &v44[2 * v57];
                          v58[4] = v54;
                          v58[5] = v56;
                        }
                      }
                    }
                  }
                  swift_release_n();
                  uint64_t v84 = v44;
                  sub_100005E5C(&qword_1000FC7D0);
                  sub_10000953C((unint64_t *)&qword_1000FC7D8, &qword_1000FC7D0);
                  uint64_t v61 = BidirectionalCollection<>.joined(separator:)();
                  uint64_t v63 = v62;

                  swift_bridgeObjectRelease();
                  uint64_t v38 = v78;
                  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                  {
                    sub_10001574C();
                    uint64_t v38 = v66;
                  }
                  unint64_t v14 = v76;
                  unint64_t i = v74;
                  uint64_t v39 = v79;
                  unint64_t v64 = v38[2];
                  if (v64 >= v38[3] >> 1)
                  {
                    sub_10001574C();
                    uint64_t v38 = v67;
                  }
                  v38[2] = v64 + 1;
                  char v65 = &v38[2 * v64];
                  v65[4] = v61;
                  v65[5] = v63;
                  uint64_t v37 = v75;
                  goto LABEL_84;
                }
              }
              swift_bridgeObjectRelease();
              unint64_t v14 = (unint64_t)_swiftEmptyArrayStorage;
              goto LABEL_62;
            }
          }
LABEL_31:
        }
      }
    }
  }
}

uint64_t sub_1000BE924(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  if (a2)
  {
    if (*(void *)(a1 + 16) && (unint64_t v8 = sub_100017664(2), (v9 & 1) != 0))
    {
      sub_10008DF48(*(void *)(a1 + 56) + 32 * v8, (uint64_t)&v13, (uint64_t *)&unk_1000FC300);
      sub_1000437A4((uint64_t)&v13, &qword_100100140);
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      uint64_t v16 = 1;
      sub_1000437A4((uint64_t)&v13, &qword_100100140);
      sub_10009077C(0x16uLL, a1, &v13);
      uint64_t v10 = v16;
      sub_1000437A4((uint64_t)&v13, &qword_100100140);
      if (v10 == 1) {
        goto LABEL_10;
      }
    }
    uint64_t v7 = OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_notificationLottery;
    goto LABEL_12;
  }
  if (*(void *)(a1 + 16))
  {
    unint64_t v5 = sub_100017664(4);
    if (v6)
    {
      sub_10008DF48(*(void *)(a1 + 56) + 32 * v5, (uint64_t)&v13, (uint64_t *)&unk_1000FC300);
      sub_1000437A4((uint64_t)&v13, &qword_100100140);
      uint64_t v7 = OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_loadUrlLottery;
LABEL_12:
      char v11 = sub_1000BECCC(*(double *)(v3 + v7));
      return v11 & 1;
    }
  }
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 1;
  sub_1000437A4((uint64_t)&v13, &qword_100100140);
LABEL_10:
  char v11 = 0;
  return v11 & 1;
}

void sub_1000BEA70()
{
  if (qword_1000FBDC0 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000929C(v0, (uint64_t)qword_10010A508);
  swift_errorRetain();
  swift_errorRetain();
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v3 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v2 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v3 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "SportsPerformanceMeasurement: error: %@", v2, 0xCu);
    sub_100005E5C((uint64_t *)&unk_1000FDA60);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
}

uint64_t sub_1000BEC4C()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_retain();
    swift_release();
    AMSMetricsEventRecorder.flush()();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1000BECCC(double a1)
{
  uint64_t v2 = sub_100005E5C(&qword_1000FC938);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v20 - v6;
  uint64_t v8 = type metadata accessor for Date();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  char v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v20 - v13;
  if (a1 <= 0.0) {
    return 0;
  }
  if (a1 >= 1.0) {
    return 1;
  }
  sub_1000BF8FC((uint64_t)v7);
  if (sub_1000082E8((uint64_t)v7, 1, v8) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v14, v7, v8);
    Date.init()();
    char v16 = static Date.< infix(_:_:)();
    NSString v17 = *(void (**)(char *, uint64_t))(v9 + 8);
    v17(v11, v8);
    v17(v14, v8);
    if ((v16 & 1) == 0) {
      goto LABEL_8;
    }
    return 1;
  }
  sub_1000437A4((uint64_t)v7, &qword_1000FC938);
LABEL_8:
  sub_1000C14E0(0.0, 1.0);
  uint64_t v15 = 0;
  if ((*(void *)&v18 & 0x7FFFFFFFFFFFFFFFLL) != 0 && v18 <= a1)
  {
    Date.init()();
    uint64_t v15 = 1;
    sub_1000082C0((uint64_t)v4, 0, 1, v8);
    sub_1000BF728((uint64_t)v4);
  }
  return v15;
}

uint64_t sub_1000BEF54()
{
  type metadata accessor for MetricsPipeline();
  sub_1000438A0();
  sub_100009894();
  v1();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1000BF01C()
{
  sub_1000BEF54();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_1000BF074()
{
  sub_100005E5C(&qword_1000FCC08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000CB3B0;
  *(unsigned char *)(inited + 32) = 22;
  sub_1000C1D28((uint64_t)[v0 code], (uint64_t)&type metadata for Int);
  id v2 = [v0 domain];
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;

  *(void *)(inited + 104) = &type metadata for String;
  *(void *)(inited + 80) = v3;
  *(void *)(inited + 88) = v5;
  *(unsigned char *)(inited + 112) = 24;
  id v6 = [v0 localizedDescription];
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;

  *(void *)(inited + 144) = &type metadata for String;
  *(void *)(inited + 120) = v7;
  *(void *)(inited + 128) = v9;
  sub_100005E5C((uint64_t *)&unk_1000FC300);
  sub_100027288();
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_1000BF194()
{
  return sub_1000BF074();
}

uint64_t sub_1000BF1B8()
{
  sub_100005E5C(&qword_1000FCC08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000CB3B0;
  *(unsigned char *)(inited + 32) = 22;
  uint64_t v1 = CloudChannelError.errorCode.getter();
  sub_1000C1D28(v1, (uint64_t)&type metadata for Int);
  uint64_t v2 = static CloudChannelError.errorDomain.getter();
  *(void *)(inited + 104) = &type metadata for String;
  *(void *)(inited + 80) = v2;
  *(void *)(inited + 88) = v3;
  *(unsigned char *)(inited + 112) = 24;
  uint64_t v4 = CloudChannelError.errorUserInfo.getter();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_100090720(v4, (_OWORD *)(inited + 120));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100005E5C((uint64_t *)&unk_1000FC300);
  sub_100027288();
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_1000BF2AC()
{
  return sub_1000BC67C();
}

uint64_t sub_1000BF2B4()
{
  return type metadata accessor for SportsPerformanceMeasurement();
}

uint64_t type metadata accessor for SportsPerformanceMeasurement()
{
  uint64_t result = qword_100100080;
  if (!qword_100100080) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000BF304()
{
  uint64_t result = type metadata accessor for MetricsPipeline();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t destroy for MetricsSamplingLottery()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MetricsSamplingLottery(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for MetricsSamplingLottery(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for MetricsSamplingLottery(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MetricsSamplingLottery(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MetricsSamplingLottery(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MetricsSamplingLottery()
{
  return &type metadata for MetricsSamplingLottery;
}

uint64_t sub_1000BF51C()
{
  swift_bridgeObjectRetain();
  uint64_t v1 = String.init<A>(_:)();
  String.append<A>(contentsOf:)();
  return v1;
}

uint64_t sub_1000BF59C@<X0>(uint64_t a1@<X8>)
{
  id v2 = [self standardUserDefaults];
  swift_bridgeObjectRetain();
  sub_1000BF51C();
  swift_bridgeObjectRelease();
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v4 = [v2 objectForKey:v3];

  if (v4)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  sub_10007A0EC((uint64_t)v8, (uint64_t)v9, (uint64_t *)&unk_1000FC300);
  if (!v10)
  {
    sub_1000437A4((uint64_t)v9, (uint64_t *)&unk_1000FC300);
    goto LABEL_8;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    uint64_t v5 = 1;
    goto LABEL_9;
  }
  Date.init(timeIntervalSinceReferenceDate:)();
  uint64_t v5 = 0;
LABEL_9:
  uint64_t v6 = type metadata accessor for Date();
  return sub_1000082C0(a1, v5, 1, v6);
}

uint64_t sub_1000BF728(uint64_t a1)
{
  uint64_t v2 = sub_100005E5C(&qword_1000FC938);
  __chkstk_darwin(v2 - 8);
  id v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = [self standardUserDefaults];
  sub_10008DF48(a1, (uint64_t)v4, &qword_1000FC938);
  uint64_t v6 = type metadata accessor for Date();
  if (sub_1000082E8((uint64_t)v4, 1, v6) == 1)
  {
    sub_1000437A4((uint64_t)v4, &qword_1000FC938);
    uint64_t v7 = 0;
  }
  else
  {
    Date.timeIntervalSinceReferenceDate.getter();
    v11[1] = v8;
    (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v4, v6);
    uint64_t v7 = _bridgeAnythingToObjectiveC<A>(_:)();
  }
  swift_bridgeObjectRetain();
  sub_1000BF51C();
  swift_bridgeObjectRelease();
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v5 setObject:v7 forKey:v9];

  swift_unknownObjectRelease();
  return sub_1000437A4(a1, &qword_1000FC938);
}

uint64_t sub_1000BF8FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100005E5C(&qword_1000FC938);
  __chkstk_darwin(v2 - 8);
  id v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Date();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000BF59C((uint64_t)v4);
  if (sub_1000082E8((uint64_t)v4, 1, v5) == 1)
  {
    sub_1000437A4((uint64_t)v4, &qword_1000FC938);
    uint64_t v9 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    Date.addingTimeInterval(_:)();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v9 = 0;
  }
  return sub_1000082C0(a1, v9, 1, v5);
}

uint64_t sub_1000BFAB4@<X0>(char a1@<W0>, void *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_100017664(a1);
  char v8 = v7;
  uint64_t result = swift_bridgeObjectRelease();
  if (v8)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v3;
    uint64_t v11 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    Swift::Int v12 = *(void *)(v11 + 24);
    sub_100005E5C(&qword_1000FDA90);
    _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v12);
    sub_10007A0EC(*(void *)(v13 + 56) + 32 * v6, (uint64_t)a2, (uint64_t *)&unk_1000FC300);
    sub_100005E5C((uint64_t *)&unk_1000FC300);
    sub_100027288();
    _NativeDictionary._delete(at:)();
    uint64_t *v3 = v13;
    return swift_bridgeObjectRelease();
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    a2[3] = 1;
  }
  return result;
}

double sub_1000BFBC8@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_1000175F0();
  char v6 = v5;
  swift_bridgeObjectRelease();
  if (v6)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v2;
    uint64_t v8 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    Swift::Int v9 = *(void *)(v8 + 24);
    sub_100005E5C(&qword_100100150);
    _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v9);
    swift_bridgeObjectRelease();
    sub_100028F5C((_OWORD *)(*(void *)(v11 + 56) + 32 * v4), a1);
    _NativeDictionary._delete(at:)();
    *uint64_t v2 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a1 = 0u;
    a1[1] = 0u;
  }
  return result;
}

uint64_t sub_1000BFD00()
{
  uint64_t v1 = v0;
  swift_bridgeObjectRetain();
  unint64_t v2 = sub_1000175F0();
  char v4 = v3;
  swift_bridgeObjectRelease();
  if ((v4 & 1) == 0) {
    return 0;
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v1;
  uint64_t v6 = *v1;
  uint64_t *v1 = 0x8000000000000000;
  Swift::Int v7 = *(void *)(v6 + 24);
  sub_100005E5C(&qword_100100188);
  _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v7);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(*(void *)(v10 + 56) + 8 * v2);
  sub_100005E5C(&qword_1000FDDB0);
  _NativeDictionary._delete(at:)();
  uint64_t *v1 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_1000BFE10@<X0>(uint64_t a1@<X8>)
{
  unint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_1000175F0();
  char v6 = v5;
  swift_bridgeObjectRelease();
  if (v6)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v17 = *v2;
    uint64_t v8 = *v2;
    *unint64_t v2 = 0x8000000000000000;
    Swift::Int v9 = *(void *)(v8 + 24);
    sub_100005E5C(&qword_100100180);
    _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v9);
    swift_bridgeObjectRelease();
    uint64_t v10 = *(void *)(v17 + 56);
    uint64_t v11 = type metadata accessor for DatedSubscribers();
    sub_1000438A0();
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v12 + 32))(a1, v10 + *(void *)(v12 + 72) * v4, v11);
    _NativeDictionary._delete(at:)();
    *unint64_t v2 = v17;
    swift_bridgeObjectRelease();
    uint64_t v13 = a1;
    uint64_t v14 = 0;
    uint64_t v15 = v11;
  }
  else
  {
    uint64_t v15 = type metadata accessor for DatedSubscribers();
    uint64_t v13 = a1;
    uint64_t v14 = 1;
  }

  return sub_1000082C0(v13, v14, 1, v15);
}

uint64_t sub_1000BFF84(uint64_t a1, char a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  *unint64_t v2 = 0x8000000000000000;
  sub_1000C0DCC(a1, a2, isUniquelyReferenced_nonNull_native);
  *unint64_t v2 = v7;

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000C0004(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  sub_1000C0EE8(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v9;

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000C0094(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  sub_1000C1028(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v9;

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000C0124(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  sub_1000C1150(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v9;

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000C01B4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *a1 = a4;
  a1[1] = a5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a2;
}

uint64_t sub_1000C0200(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a2;
}

uint64_t sub_1000C023C@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1000C0200((uint64_t)(a2 + 8), *a1, (uint64_t)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_1000C0270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *a4;
  *a4 = 0x8000000000000000;
  sub_1000C02FC(a1, a2, a3, isUniquelyReferenced_nonNull_native, &v10);
  *a4 = v10;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000C02FC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  sub_1000C15F0(a1, a2, a3, &v28);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1000C17CC((uint64_t)v25);
  if (v27 == 1)
  {
LABEL_14:
    swift_release();
    swift_bridgeObjectRelease();
    sub_10001BB94();
    return swift_release();
  }
  while (1)
  {
    char v7 = v25[0];
    sub_10007A0EC((uint64_t)&v26, (uint64_t)v24, (uint64_t *)&unk_1000FC300);
    uint64_t v8 = *a5;
    unint64_t v9 = sub_100017664(v7);
    sub_1000C1CB0();
    uint64_t v13 = v11 + v12;
    if (__OFADD__(v11, v12)) {
      break;
    }
    char v14 = v10;
    if (*(void *)(v8 + 24) >= v13)
    {
      if (a4)
      {
        if (v10) {
          goto LABEL_9;
        }
      }
      else
      {
        sub_100005E5C(&qword_1000FDA90);
        _NativeDictionary.copy()();
        if (v14) {
          goto LABEL_9;
        }
      }
    }
    else
    {
      sub_1000C07CC(v13, a4 & 1);
      unint64_t v15 = sub_100017664(v7);
      if ((v14 & 1) != (v16 & 1)) {
        goto LABEL_17;
      }
      unint64_t v9 = v15;
      if (v14)
      {
LABEL_9:
        sub_10008DF48(*(void *)(*a5 + 56) + 32 * v9, (uint64_t)v22, (uint64_t *)&unk_1000FC300);
        sub_10008DF48((uint64_t)v22, (uint64_t)v23, (uint64_t *)&unk_1000FC300);
        sub_1000437A4((uint64_t)v22, (uint64_t *)&unk_1000FC300);
        sub_1000437A4((uint64_t)v24, (uint64_t *)&unk_1000FC300);
        sub_100050DC0((uint64_t)v23, *(void *)(*a5 + 56) + 32 * v9);
        goto LABEL_13;
      }
    }
    uint64_t v17 = (void *)*a5;
    *(void *)(*a5 + 8 * (v9 >> 6) + 64) |= 1 << v9;
    *(unsigned char *)(v17[6] + v9) = v7;
    sub_10007A0EC((uint64_t)v24, v17[7] + 32 * v9, (uint64_t *)&unk_1000FC300);
    uint64_t v18 = v17[2];
    BOOL v19 = __OFADD__(v18, 1);
    uint64_t v20 = v18 + 1;
    if (v19) {
      goto LABEL_16;
    }
    v17[2] = v20;
LABEL_13:
    sub_1000C17CC((uint64_t)v25);
    a4 = 1;
    if (v27 == 1) {
      goto LABEL_14;
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
LABEL_17:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

void sub_1000C0534(uint64_t a1, char a2)
{
  unint64_t v4 = v2;
  sub_1000C1C80();
  sub_100005E5C(&qword_100100170);
  char v44 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  if (!v3[2]) {
    goto LABEL_39;
  }
  sub_1000C1C04();
  uint64_t v43 = v9;
  if (v7 < 64) {
    uint64_t v10 = ~(-1 << v7);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & v8;
  uint64_t v41 = v2;
  int64_t v42 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  swift_retain();
  int64_t v13 = 0;
  if (!v11) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v14 = __clz(__rbit64(v11));
  v11 &= v11 - 1;
  for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = v21 + (v13 << 6))
  {
    char v22 = (uint64_t *)(v3[6] + 16 * i);
    uint64_t v24 = *v22;
    uint64_t v23 = v22[1];
    uint64_t v25 = (uint64_t *)(v3[7] + 16 * i);
    uint64_t v26 = *v25;
    uint64_t v27 = v25[1];
    if ((v44 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    unint64_t v28 = Hasher._finalize()() & ~(-1 << *(unsigned char *)(v6 + 32));
    if (((-1 << v28) & ~*(void *)(v12 + 8 * (v28 >> 6))) == 0)
    {
      sub_1000C1C44();
      while (++v30 != v31 || (v29 & 1) == 0)
      {
        BOOL v32 = v30 == v31;
        if (v30 == v31) {
          uint64_t v30 = 0;
        }
        v29 |= v32;
        if (*(void *)(v12 + 8 * v30) != -1)
        {
          sub_1000C1C30();
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return;
    }
    sub_1000C1C58();
LABEL_30:
    sub_1000C1C1C();
    *(void *)(v12 + v33) |= v34;
    id v36 = (void *)(*(void *)(v6 + 48) + 16 * v35);
    *id v36 = v24;
    v36[1] = v23;
    uint64_t v37 = (void *)(*(void *)(v6 + 56) + 16 * v35);
    *uint64_t v37 = v26;
    v37[1] = v27;
    sub_1000C1CC0();
    if (v11) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v16 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      goto LABEL_41;
    }
    if (v16 >= v42)
    {
      swift_release();
      unint64_t v4 = v41;
      uint64_t v17 = v43;
      goto LABEL_34;
    }
    uint64_t v17 = v43;
    ++v13;
    if (!v43[v16])
    {
      int64_t v13 = v16 + 1;
      if (v16 + 1 >= v42) {
        goto LABEL_32;
      }
      if (!v43[v13]) {
        break;
      }
    }
LABEL_18:
    sub_1000C1CF4();
    unint64_t v11 = v20 & v19;
  }
  int64_t v18 = v16 + 2;
  if (v18 < v42)
  {
    if (!v43[v18])
    {
      while (1)
      {
        int64_t v13 = v18 + 1;
        if (__OFADD__(v18, 1)) {
          goto LABEL_42;
        }
        if (v13 >= v42) {
          goto LABEL_32;
        }
        ++v18;
        if (v43[v13]) {
          goto LABEL_18;
        }
      }
    }
    int64_t v13 = v18;
    goto LABEL_18;
  }
LABEL_32:
  swift_release();
  unint64_t v4 = v41;
LABEL_34:
  if (v44)
  {
    sub_1000C1C6C();
    if (v39 != v40) {
      void *v17 = -1 << v38;
    }
    else {
      sub_1000C1D50(v38);
    }
    v3[2] = 0;
  }
LABEL_39:
  swift_release();
  *unint64_t v4 = v6;
}

void sub_1000C07CC(uint64_t a1, char a2)
{
  unint64_t v4 = v2;
  sub_1000C1C80();
  sub_100005E5C(&qword_1000FF848);
  uint64_t v6 = sub_1000C1CD0();
  if (v3[2])
  {
    sub_1000C1C04();
    uint64_t v35 = v9;
    if (v7 < 64) {
      uint64_t v10 = ~(-1 << v7);
    }
    else {
      uint64_t v10 = -1;
    }
    uint64_t v11 = v10 & v8;
    int64_t v34 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v12 = v6 + 64;
    swift_retain();
    int64_t v13 = 0;
    if (!v11) {
      goto LABEL_7;
    }
LABEL_6:
    sub_1000C1D3C();
    for (int64_t i = v14 | (v13 << 6); ; int64_t i = v20 + (v13 << 6))
    {
      char v21 = *(unsigned char *)(v3[6] + i);
      uint64_t v22 = v3[7] + 32 * i;
      if (a2) {
        sub_10007A0EC(v22, (uint64_t)v36, (uint64_t *)&unk_1000FC300);
      }
      else {
        sub_10008DF48(v22, (uint64_t)v36, (uint64_t *)&unk_1000FC300);
      }
      Hasher.init(_seed:)();
      sub_1000990CC(v21);
      sub_1000C1D04();
      swift_bridgeObjectRelease();
      unint64_t v23 = Hasher._finalize()() & ~(-1 << *(unsigned char *)(v6 + 32));
      if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) == 0)
      {
        sub_1000C1C44();
        while (++v25 != v26 || (v24 & 1) == 0)
        {
          BOOL v27 = v25 == v26;
          if (v25 == v26) {
            uint64_t v25 = 0;
          }
          v24 |= v27;
          if (*(void *)(v12 + 8 * v25) != -1)
          {
            sub_1000C1C30();
            goto LABEL_31;
          }
        }
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        return;
      }
      sub_1000C1C58();
LABEL_31:
      sub_1000C1C1C();
      *(void *)(v12 + v28) |= v29;
      *(unsigned char *)(*(void *)(v6 + 48) + v30) = v21;
      sub_10007A0EC((uint64_t)v36, *(void *)(v6 + 56) + 32 * v30, (uint64_t *)&unk_1000FC300);
      sub_1000C1CC0();
      if (v11) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v16 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_40;
      }
      if (v16 >= v34) {
        goto LABEL_33;
      }
      ++v13;
      if (!v35[v16])
      {
        int64_t v13 = v16 + 1;
        if (v16 + 1 >= v34) {
          goto LABEL_33;
        }
        if (!v35[v13])
        {
          int64_t v17 = v16 + 2;
          if (v17 >= v34)
          {
LABEL_33:
            swift_release();
            unint64_t v4 = v2;
            if (a2)
            {
              sub_1000C1C6C();
              if (v32 != v33) {
                *uint64_t v35 = -1 << v31;
              }
              else {
                sub_1000A1BD4(0, (unint64_t)(v31 + 63) >> 6, v35);
              }
              v3[2] = 0;
            }
            break;
          }
          if (!v35[v17])
          {
            while (1)
            {
              int64_t v13 = v17 + 1;
              if (__OFADD__(v17, 1)) {
                goto LABEL_41;
              }
              if (v13 >= v34) {
                goto LABEL_33;
              }
              ++v17;
              if (v35[v13]) {
                goto LABEL_18;
              }
            }
          }
          int64_t v13 = v17;
        }
      }
LABEL_18:
      sub_1000C1CF4();
      uint64_t v11 = v19 & v18;
    }
  }
  swift_release();
  *unint64_t v4 = v6;
}

void sub_1000C0A44(uint64_t a1, char a2)
{
  unint64_t v4 = v2;
  sub_1000C1C80();
  sub_100005E5C(&qword_100100178);
  uint64_t v6 = sub_1000C1CD0();
  if (v3[2])
  {
    sub_1000C1C04();
    id v36 = v2;
    uint64_t v37 = v9;
    if (v7 < 64) {
      uint64_t v10 = ~(-1 << v7);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & v8;
    int64_t v12 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v13 = v6 + 64;
    swift_retain();
    int64_t v14 = 0;
    if (!v11) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v15 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    for (unint64_t i = v15 | (v14 << 6); ; unint64_t i = v22 + (v14 << 6))
    {
      char v23 = *(unsigned char *)(v3[6] + i);
      char v24 = (_OWORD *)(v3[7] + 32 * i);
      if (a2) {
        sub_100028F5C(v24, v38);
      }
      else {
        sub_10001BB1C((uint64_t)v24, (uint64_t)v38);
      }
      Hasher.init(_seed:)();
      sub_1000990CC(v23);
      sub_1000C1D04();
      swift_bridgeObjectRelease();
      unint64_t v25 = Hasher._finalize()() & ~(-1 << *(unsigned char *)(v6 + 32));
      if (((-1 << v25) & ~*(void *)(v13 + 8 * (v25 >> 6))) == 0)
      {
        sub_1000C1C44();
        while (++v27 != v28 || (v26 & 1) == 0)
        {
          BOOL v29 = v27 == v28;
          if (v27 == v28) {
            uint64_t v27 = 0;
          }
          v26 |= v29;
          if (*(void *)(v13 + 8 * v27) != -1)
          {
            sub_1000C1C30();
            goto LABEL_31;
          }
        }
        __break(1u);
LABEL_42:
        __break(1u);
LABEL_43:
        __break(1u);
        return;
      }
      sub_1000C1C58();
LABEL_31:
      sub_1000C1C1C();
      *(void *)(v13 + v30) |= v31;
      *(unsigned char *)(*(void *)(v6 + 48) + v32) = v23;
      sub_100028F5C(v38, (_OWORD *)(*(void *)(v6 + 56) + 32 * v32));
      sub_1000C1CC0();
      if (v11) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v17 = v14 + 1;
      if (__OFADD__(v14, 1)) {
        goto LABEL_42;
      }
      if (v17 >= v12) {
        break;
      }
      uint64_t v18 = v37;
      ++v14;
      if (!v37[v17])
      {
        int64_t v14 = v17 + 1;
        if (v17 + 1 >= v12) {
          goto LABEL_33;
        }
        if (!v37[v14])
        {
          int64_t v19 = v17 + 2;
          if (v19 >= v12)
          {
LABEL_33:
            swift_release();
            unint64_t v4 = v36;
            if ((a2 & 1) == 0) {
              goto LABEL_40;
            }
            goto LABEL_36;
          }
          if (!v37[v19])
          {
            while (1)
            {
              int64_t v14 = v19 + 1;
              if (__OFADD__(v19, 1)) {
                goto LABEL_43;
              }
              if (v14 >= v12) {
                goto LABEL_33;
              }
              ++v19;
              if (v37[v14]) {
                goto LABEL_18;
              }
            }
          }
          int64_t v14 = v19;
        }
      }
LABEL_18:
      sub_1000C1CF4();
      unint64_t v11 = v21 & v20;
    }
    swift_release();
    unint64_t v4 = v36;
    uint64_t v18 = v37;
    if ((a2 & 1) == 0) {
      goto LABEL_40;
    }
LABEL_36:
    sub_1000C1C6C();
    if (v34 != v35) {
      *uint64_t v18 = -1 << v33;
    }
    else {
      sub_1000C1D50(v33);
    }
    v3[2] = 0;
  }
LABEL_40:
  swift_release();
  *unint64_t v4 = v6;
}

void sub_1000C0CAC()
{
  sub_1000098B8();
  uint64_t v1 = v0;
  char v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  sub_1000175F0();
  sub_1000C1CB0();
  Swift::Int v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v17 = v12;
  char v18 = v13;
  sub_100005E5C(&qword_1000FEBD8);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(v3 & 1, v16)) {
    goto LABEL_5;
  }
  unint64_t v19 = sub_1000175F0();
  if ((v18 & 1) != (v20 & 1))
  {
LABEL_11:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return;
  }
  unint64_t v17 = v19;
LABEL_5:
  uint64_t v21 = *v1;
  if (v18)
  {
    uint64_t v22 = (uint64_t *)(v21[7] + 16 * v17);
    swift_bridgeObjectRelease();
    *uint64_t v22 = v11;
    v22[1] = v9;
    sub_1000098A0();
  }
  else
  {
    sub_1000C12BC(v17, v7, v5, v11, v9, v21);
    sub_1000098A0();
    swift_bridgeObjectRetain();
  }
}

uint64_t sub_1000C0DCC(uint64_t a1, char a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_100017664(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v10 & 1) == 0;
  Swift::Int v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v14 = v9;
  char v15 = v10;
  sub_100005E5C(&qword_1000FDA90);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v13)) {
    goto LABEL_5;
  }
  unint64_t v16 = sub_100017664(a2);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_13:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v14 = v16;
LABEL_5:
  char v18 = *v4;
  if (v15)
  {
    uint64_t v19 = v18[7] + 32 * v14;
    return sub_100050DC0(a1, v19);
  }
  else
  {
    return sub_1000C1308(v14, a2, a1, v18);
  }
}

_OWORD *sub_1000C0EE8(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  char v10 = (void *)*v4;
  unint64_t v11 = sub_1000175F0();
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v16 = v11;
  char v17 = v12;
  sub_100005E5C(&qword_100100150);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15)) {
    goto LABEL_5;
  }
  unint64_t v18 = sub_1000175F0();
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_13:
    uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v16 = v18;
LABEL_5:
  char v20 = *v5;
  if (v17)
  {
    uint64_t v21 = (_OWORD *)(v20[7] + 32 * v16);
    sub_100006178((uint64_t)v21);
    return sub_100028F5C(a1, v21);
  }
  else
  {
    sub_1000C137C(v16, a2, a3, a1, v20);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

uint64_t sub_1000C1028(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  char v10 = (void *)*v4;
  unint64_t v11 = sub_1000175F0();
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v16 = v11;
  char v17 = v12;
  sub_100005E5C(&qword_100100188);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15)) {
    goto LABEL_5;
  }
  unint64_t v18 = sub_1000175F0();
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_11:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v16 = v18;
LABEL_5:
  char v20 = *v5;
  if (v17)
  {
    uint64_t v21 = v20[7];
    uint64_t result = swift_release();
    *(void *)(v21 + 8 * v16) = a1;
  }
  else
  {
    sub_1000C13E8(v16, a2, a3, a1, v20);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1000C1150(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  char v10 = (void *)*v4;
  unint64_t v11 = sub_1000175F0();
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v16 = v11;
  char v17 = v12;
  sub_100005E5C(&qword_100100180);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15)) {
    goto LABEL_5;
  }
  unint64_t v18 = sub_1000175F0();
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_13:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v16 = v18;
LABEL_5:
  char v20 = *v5;
  if (v17)
  {
    uint64_t v21 = v20[7];
    uint64_t v22 = type metadata accessor for DatedSubscribers();
    uint64_t v23 = *(void *)(v22 - 8);
    char v24 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v23 + 40);
    uint64_t v25 = v22;
    uint64_t v26 = v21 + *(void *)(v23 + 72) * v16;
    return v24(v26, a1, v25);
  }
  else
  {
    sub_1000C1430(v16, a2, a3, a1, v20);
    return swift_bridgeObjectRetain();
  }
}

unint64_t sub_1000C12BC(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1 << result;
  uint64_t v6 = (void *)(a6[6] + 16 * result);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t v7 = (void *)(a6[7] + 16 * result);
  *uint64_t v7 = a4;
  v7[1] = a5;
  uint64_t v8 = a6[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a6[2] = v10;
  }
  return result;
}

uint64_t sub_1000C1308(unint64_t a1, char a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(unsigned char *)(a4[6] + a1) = a2;
  uint64_t result = sub_10007A0EC(a3, a4[7] + 32 * a1, (uint64_t *)&unk_1000FC300);
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

_OWORD *sub_1000C137C(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_100028F5C(a4, (_OWORD *)(a5[7] + 32 * a1));
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

unint64_t sub_1000C13E8(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

uint64_t sub_1000C1430(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = (void *)(a5[6] + 16 * a1);
  *uint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = type metadata accessor for DatedSubscribers();
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

void sub_1000C14E0(double a1, double a2)
{
  if ((~COERCE__INT64(a2 - a1) & 0x7FF0000000000000) != 0) {
    sub_1000C1560(0x20000000000001uLL);
  }
  else {
    __break(1u);
  }
}

unint64_t sub_1000C1560(unint64_t result)
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

uint64_t sub_1000C15F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  *a4 = a1;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v6 = v7;
  a4[1] = result;
  a4[2] = ~v4;
  if (-v4 < 64) {
    uint64_t v8 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v8 = -1;
  }
  a4[3] = 0;
  a4[4] = v8 & v6;
  a4[5] = a2;
  a4[6] = a3;
  return result;
}

uint64_t sub_1000C162C()
{
  void (*v13)(uint64_t *__return_ptr, void *);
  uint64_t result;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  int64_t v20;
  uint64_t v21;
  void v22[4];

  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    uint64_t v7 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v6);
    uint64_t v8 = *v7;
    uint64_t v9 = v7[1];
    uint64_t v10 = (uint64_t *)(*(void *)(v1 + 56) + 16 * v6);
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    v0[3] = v4;
    v0[4] = v5;
    BOOL v13 = (void (*)(uint64_t *__return_ptr, void *))v0[5];
    v22[0] = v8;
    v22[1] = v9;
    v22[2] = v11;
    v22[3] = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(&v21, v22);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v21;
  }
  Swift::Int v15 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    unint64_t v16 = (unint64_t)(v0[2] + 64) >> 6;
    if (v15 < v16)
    {
      char v17 = v0[1];
      unint64_t v18 = *(void *)(v17 + 8 * v15);
      if (v18)
      {
LABEL_7:
        uint64_t v5 = (v18 - 1) & v18;
        unint64_t v6 = __clz(__rbit64(v18)) + (v15 << 6);
        int64_t v4 = v15;
        goto LABEL_3;
      }
      char v19 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v16)
      {
        unint64_t v18 = *(void *)(v17 + 8 * v19);
        if (v18)
        {
LABEL_10:
          Swift::Int v15 = v19;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v16)
        {
          unint64_t v18 = *(void *)(v17 + 8 * (v3 + 3));
          if (v18)
          {
            Swift::Int v15 = v3 + 3;
            goto LABEL_7;
          }
          char v19 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v16)
          {
            unint64_t v18 = *(void *)(v17 + 8 * v19);
            if (v18) {
              goto LABEL_10;
            }
            Swift::Int v15 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v16)
            {
              unint64_t v18 = *(void *)(v17 + 8 * v15);
              if (v18) {
                goto LABEL_7;
              }
              int64_t v4 = v16 - 1;
              char v20 = v3 + 6;
              while (v20 < v16)
              {
                unint64_t v18 = *(void *)(v17 + 8 * v20++);
                if (v18)
                {
                  Swift::Int v15 = v20 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    uint64_t result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

uint64_t sub_1000C17CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  int64_t v5 = v1[3];
  int64_t v7 = v5;
  unint64_t v8 = v1[4];
  if (v8)
  {
    uint64_t v9 = (v8 - 1) & v8;
    unint64_t v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    char v11 = *(unsigned char *)(*(void *)(v3 + 48) + v10);
    sub_10008DF48(*(void *)(v3 + 56) + 32 * v10, (uint64_t)v23 + 8, (uint64_t *)&unk_1000FC300);
    LOBYTE(v23[0]) = v11;
    goto LABEL_23;
  }
  int64_t v12 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return result;
  }
  int64_t v13 = (unint64_t)(v6 + 64) >> 6;
  if (v12 < v13)
  {
    unint64_t v14 = *(void *)(v4 + 8 * v12);
    if (v14)
    {
LABEL_7:
      uint64_t v9 = (v14 - 1) & v14;
      unint64_t v10 = __clz(__rbit64(v14)) + (v12 << 6);
      int64_t v7 = v12;
      goto LABEL_3;
    }
    int64_t v15 = v5 + 2;
    int64_t v7 = v5 + 1;
    if (v5 + 2 < v13)
    {
      unint64_t v14 = *(void *)(v4 + 8 * v15);
      if (v14)
      {
LABEL_10:
        int64_t v12 = v15;
        goto LABEL_7;
      }
      int64_t v7 = v5 + 2;
      if (v5 + 3 < v13)
      {
        unint64_t v14 = *(void *)(v4 + 8 * (v5 + 3));
        if (v14)
        {
          int64_t v12 = v5 + 3;
          goto LABEL_7;
        }
        int64_t v15 = v5 + 4;
        int64_t v7 = v5 + 3;
        if (v5 + 4 < v13)
        {
          unint64_t v14 = *(void *)(v4 + 8 * v15);
          if (v14) {
            goto LABEL_10;
          }
          int64_t v12 = v5 + 5;
          int64_t v7 = v5 + 4;
          if (v5 + 5 < v13)
          {
            unint64_t v14 = *(void *)(v4 + 8 * v12);
            if (v14) {
              goto LABEL_7;
            }
            int64_t v7 = v13 - 1;
            int64_t v16 = v5 + 6;
            while (v16 < v13)
            {
              unint64_t v14 = *(void *)(v4 + 8 * v16++);
              if (v14)
              {
                int64_t v12 = v16 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  uint64_t v9 = 0;
  memset(v23, 0, sizeof(v23));
  uint64_t v24 = 1;
LABEL_23:
  uint64_t *v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  char v17 = (void (*)(_OWORD *))v1[5];
  uint64_t result = sub_10007A0EC((uint64_t)v23, (uint64_t)v21, &qword_100100148);
  if (v22 == 1)
  {
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(void *)(a1 + 32) = 1;
  }
  else
  {
    v19[0] = v21[0];
    v19[1] = v21[1];
    uint64_t v20 = v22;
    v17(v19);
    return sub_1000437A4((uint64_t)v19, &qword_1000FD308);
  }
  return result;
}

uint64_t sub_1000C19B8()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000C19F0()
{
  return sub_1000BEC4C();
}

uint64_t sub_1000C19F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000C1A08()
{
  return swift_release();
}

uint64_t sub_1000C1A10(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *storeEnumTagSinglePayload for EventType.EventName(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1000C1B24);
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

ValueMetadata *type metadata accessor for EventType.EventName()
{
  return &type metadata for EventType.EventName;
}

unint64_t sub_1000C1B60()
{
  unint64_t result = qword_100100190;
  if (!qword_100100190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100100190);
  }
  return result;
}

uint64_t sub_1000C1BAC(uint64_t a1)
{
  return sub_1000082E8(a1, 1, v1);
}

double sub_1000C1BF8()
{
  double result = 0.0;
  *uint64_t v0 = 0u;
  v0[1] = 0u;
  return result;
}

uint64_t sub_1000C1C94()
{
  return 0;
}

void sub_1000C1CC0()
{
  ++*(void *)(v0 + 16);
}

uint64_t sub_1000C1CD0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_1000C1D04()
{
  return String.hash(into:)();
}

uint64_t sub_1000C1D28@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 + 64) = a2;
  *(void *)(v2 + 40) = result;
  *(unsigned char *)(v2 + 72) = 23;
  return result;
}

uint64_t sub_1000C1D50@<X0>(uint64_t a1@<X8>)
{
  return sub_1000A1BD4(0, (unint64_t)(a1 + 63) >> 6, v1);
}

uint64_t sub_1000C1D70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v28 = type metadata accessor for Date();
  sub_100009830();
  uint64_t v17 = v16;
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)a8 = a1;
  *(void *)(a8 + 8) = a2;
  sub_100008CAC(a3, a8 + 16);
  *(void *)(a8 + 56) = a4;
  *(void *)(a8 + 64) = a5;
  *(unsigned char *)(a8 + 72) = a6;
  uint64_t refreshed = type metadata accessor for SubscriptionRefreshOperation();
  uint64_t v22 = a8 + *(int *)(refreshed + 36);
  type metadata accessor for SportsManager.RefreshOptions();
  sub_1000098E8();
  (*(void (**)(uint64_t, uint64_t))(v23 + 32))(v22, a7);
  uint64_t v24 = *(int *)(refreshed + 40);
  Date.init()();
  uint64_t v25 = sub_1000A268C();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v20, v28);
  *(void *)(a8 + v24) = v25;
  return result;
}

uint64_t type metadata accessor for SubscriptionRefreshOperation()
{
  uint64_t result = qword_1001001F0;
  if (!qword_1001001F0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000C1F00(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    *(void *)(a1 + 8) = a2[1];
    unint64_t v8 = a2 + 2;
    long long v9 = *(_OWORD *)(a2 + 5);
    *(_OWORD *)(a1 + 40) = v9;
    uint64_t v10 = v9;
    char v11 = **(void (***)(uint64_t, uint64_t *, uint64_t))(v9 - 8);
    swift_retain();
    swift_retain();
    v11(a1 + 16, v8, v10);
    uint64_t v12 = a2[8];
    *(void *)(a1 + 56) = a2[7];
    *(void *)(a1 + 64) = v12;
    *(unsigned char *)(a1 + 72) = *((unsigned char *)a2 + 72);
    uint64_t v13 = *(int *)(a3 + 36);
    uint64_t v14 = a1 + v13;
    uint64_t v15 = (uint64_t)a2 + v13;
    uint64_t refreshed = type metadata accessor for SportsManager.RefreshOptions();
    uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(refreshed - 8) + 16);
    swift_bridgeObjectRetain();
    v17(v14, v15, refreshed);
    *(void *)(a1 + *(int *)(a3 + 40)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 40));
  }
  return a1;
}

uint64_t sub_1000C2068(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  sub_100006178(a1 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  uint64_t refreshed = type metadata accessor for SportsManager.RefreshOptions();
  unsigned int v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(refreshed - 8) + 8);

  return v6(v4, refreshed);
}

uint64_t sub_1000C20F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v7 = a2 + 16;
  long long v8 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v8;
  uint64_t v9 = v8;
  uint64_t v10 = **(void (***)(uint64_t, uint64_t, uint64_t))(v8 - 8);
  swift_retain();
  swift_retain();
  v10(a1 + 16, v7, v9);
  uint64_t v11 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v11;
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  uint64_t v12 = *(int *)(a3 + 36);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t refreshed = type metadata accessor for SportsManager.RefreshOptions();
  uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(refreshed - 8) + 16);
  swift_bridgeObjectRetain();
  v16(v13, v14, refreshed);
  *(void *)(a1 + *(int *)(a3 + 40)) = *(void *)(a2 + *(int *)(a3 + 40));
  return a1;
}

uint64_t sub_1000C2210(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  sub_100008E94((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  uint64_t v6 = *(int *)(a3 + 36);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t refreshed = type metadata accessor for SportsManager.RefreshOptions();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(refreshed - 8) + 24))(v7, v8, refreshed);
  *(void *)(a1 + *(int *)(a3 + 40)) = *(void *)(a2 + *(int *)(a3 + 40));
  return a1;
}

uint64_t sub_1000C2304(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  long long v7 = *(_OWORD *)(a2 + 56);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  uint64_t v8 = *(int *)(a3 + 36);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(_OWORD *)(a1 + 56) = v7;
  uint64_t refreshed = type metadata accessor for SportsManager.RefreshOptions();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(refreshed - 8) + 32))(v9, v10, refreshed);
  *(void *)(a1 + *(int *)(a3 + 40)) = *(void *)(a2 + *(int *)(a3 + 40));
  return a1;
}

uint64_t sub_1000C23BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  sub_100006178(a1 + 16);
  long long v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v6;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t refreshed = type metadata accessor for SportsManager.RefreshOptions();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(refreshed - 8) + 40))(v8, v9, refreshed);
  *(void *)(a1 + *(int *)(a3 + 40)) = *(void *)(a2 + *(int *)(a3 + 40));
  return a1;
}

uint64_t sub_1000C249C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000C24B0);
}

uint64_t sub_1000C24B0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t refreshed = type metadata accessor for SportsManager.RefreshOptions();
    uint64_t v9 = (uint64_t)a1 + *(int *)(a3 + 36);
    return sub_1000082E8(v9, a2, refreshed);
  }
}

uint64_t sub_1000C2538(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000C254C);
}

void *sub_1000C254C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t refreshed = type metadata accessor for SportsManager.RefreshOptions();
    uint64_t v8 = (uint64_t)v5 + *(int *)(a4 + 36);
    return (void *)sub_1000082C0(v8, a2, a2, refreshed);
  }
  return result;
}

uint64_t sub_1000C25CC()
{
  uint64_t result = type metadata accessor for SportsManager.RefreshOptions();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1000C2694(uint64_t a1)
{
  id v36 = &_swiftEmptyDictionarySingleton;
  sub_10008DAAC(a1, v37);
  uint64_t v1 = v37[0];
  uint64_t v25 = v37[1];
  int64_t v2 = v37[3];
  unint64_t v3 = v37[4];
  int64_t v38 = (unint64_t)(v37[2] + 64) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  if (!v3) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v5 = __clz(__rbit64(v3));
  v3 &= v3 - 1;
  unint64_t v6 = v5 | (v2 << 6);
  while (1)
  {
    char v11 = *(unsigned char *)(*(void *)(v1 + 48) + v6);
    sub_100037E68(*(void *)(v1 + 56) + 32 * v6, (uint64_t)v34 + 8);
    LOBYTE(v34[0]) = v11;
    v32[0] = v34[0];
    v32[1] = v34[1];
    uint64_t v33 = v35;
    sub_100037E68((uint64_t)v32 + 8, (uint64_t)&v26);
    if (!v27)
    {
      sub_1000095CC((uint64_t)v32, &qword_1000FD308);
      uint64_t v20 = &v26;
      goto LABEL_33;
    }
    sub_100028F5C(&v26, v31);
    char v12 = v32[0];
    char v29 = v32[0];
    sub_100009F4C((uint64_t)v32 + 8, (uint64_t)v30);
    sub_100028F5C(v31, v28);
    uint64_t v13 = v36;
    unint64_t v14 = v36[2];
    if (v36[3] <= v14)
    {
      sub_1000C0A44(v14 + 1, 1);
      uint64_t v13 = v36;
    }
    Hasher.init(_seed:)();
    sub_1000990CC(v12);
    String.hash(into:)();
    swift_bridgeObjectRelease();
    uint64_t result = Hasher._finalize()();
    uint64_t v15 = v13 + 8;
    uint64_t v16 = -1 << *((unsigned char *)v13 + 32);
    unint64_t v17 = result & ~v16;
    unint64_t v18 = v17 >> 6;
    if (((-1 << v17) & ~v13[(v17 >> 6) + 8]) == 0) {
      break;
    }
    unint64_t v19 = __clz(__rbit64((-1 << v17) & ~v13[(v17 >> 6) + 8])) | v17 & 0x7FFFFFFFFFFFFFC0;
LABEL_32:
    *(void *)((char *)v15 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    *(unsigned char *)(v13[6] + v19) = v12;
    sub_100028F5C(v28, (_OWORD *)(v13[7] + 32 * v19));
    ++v13[2];
    uint64_t v20 = (long long *)v30;
LABEL_33:
    uint64_t result = sub_1000095CC((uint64_t)v20, (uint64_t *)&unk_1000FC300);
    if (v3) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v7 = v2 + 1;
    if (__OFADD__(v2, 1)) {
      goto LABEL_37;
    }
    if (v7 >= v38) {
      goto LABEL_35;
    }
    unint64_t v8 = *(void *)(v25 + 8 * v7);
    int64_t v9 = v2 + 1;
    if (!v8)
    {
      int64_t v9 = v2 + 2;
      if (v2 + 2 >= v38) {
        goto LABEL_35;
      }
      unint64_t v8 = *(void *)(v25 + 8 * v9);
      if (!v8)
      {
        int64_t v9 = v2 + 3;
        if (v2 + 3 >= v38) {
          goto LABEL_35;
        }
        unint64_t v8 = *(void *)(v25 + 8 * v9);
        if (!v8)
        {
          int64_t v9 = v2 + 4;
          if (v2 + 4 >= v38) {
            goto LABEL_35;
          }
          unint64_t v8 = *(void *)(v25 + 8 * v9);
          if (!v8)
          {
            int64_t v9 = v2 + 5;
            if (v2 + 5 >= v38) {
              goto LABEL_35;
            }
            unint64_t v8 = *(void *)(v25 + 8 * v9);
            if (!v8)
            {
              int64_t v10 = v2 + 6;
              while (v10 < v38)
              {
                unint64_t v8 = *(void *)(v25 + 8 * v10++);
                if (v8)
                {
                  int64_t v9 = v10 - 1;
                  goto LABEL_18;
                }
              }
LABEL_35:
              sub_10001BB94();
              return (uint64_t)v36;
            }
          }
        }
      }
    }
LABEL_18:
    unint64_t v3 = (v8 - 1) & v8;
    unint64_t v6 = __clz(__rbit64(v8)) + (v9 << 6);
    int64_t v2 = v9;
  }
  char v21 = 0;
  unint64_t v22 = (unint64_t)(63 - v16) >> 6;
  while (++v18 != v22 || (v21 & 1) == 0)
  {
    BOOL v23 = v18 == v22;
    if (v18 == v22) {
      unint64_t v18 = 0;
    }
    v21 |= v23;
    uint64_t v24 = v15[v18];
    if (v24 != -1)
    {
      unint64_t v19 = __clz(__rbit64(~v24)) + (v18 << 6);
      goto LABEL_32;
    }
  }
  __break(1u);
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1000C2A0C()
{
  uint64_t v1 = (uint64_t)v0;
  sub_100005E5C(&qword_1000FD2F8);
  sub_100009830();
  uint64_t v83 = v2;
  uint64_t v84 = v3;
  __chkstk_darwin(v2);
  sub_10000C58C();
  uint64_t v85 = v4;
  uint64_t refreshed = type metadata accessor for SubscriptionRefreshOperation();
  uint64_t v6 = sub_10000984C(refreshed);
  uint64_t v70 = v7;
  __chkstk_darwin(v6);
  uint64_t v71 = v8;
  uint64_t v72 = (uint64_t)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005E5C(&qword_100100240);
  sub_100009830();
  uint64_t v74 = v10;
  uint64_t v75 = v9;
  __chkstk_darwin(v9);
  sub_10000C58C();
  uint64_t v73 = v11;
  sub_100005E5C(&qword_100100248);
  sub_100009830();
  uint64_t v78 = v13;
  uint64_t v79 = v12;
  __chkstk_darwin(v12);
  sub_10000C58C();
  uint64_t v76 = v14;
  sub_100005E5C(&qword_100100250);
  sub_100009830();
  uint64_t v80 = v16;
  uint64_t v81 = v15;
  __chkstk_darwin(v15);
  sub_10000C58C();
  uint64_t v77 = v17;
  uint64_t v18 = sub_100005E5C((uint64_t *)&unk_1000FDA80);
  __chkstk_darwin(v18 - 8);
  uint64_t v20 = (char *)&v67 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for URL();
  sub_100009830();
  uint64_t v82 = v22;
  uint64_t v24 = *(void *)(v23 + 64);
  __chkstk_darwin(v25);
  unint64_t v69 = (char *)&v67 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v26);
  uint64_t v28 = (char *)&v67 - v27;
  uint64_t v29 = v0[7];
  uint64_t v30 = (void *)v0[8];
  sub_100005EA0((void *)(*v0 + 16), *(void *)(*v0 + 40));
  uint64_t v31 = dispatch thunk of PersistentStorable.retrieveEventSubscription(canonicalId:isConventionalOrUnified:)();
  if (v31)
  {
    uint64_t v32 = (void *)v31;
    uint64_t v33 = v85;
    SportingEventSubscription.eventStateURL.getter();
    if (sub_1000082E8((uint64_t)v20, 1, v21) == 1)
    {
      sub_1000095CC((uint64_t)v20, (uint64_t *)&unk_1000FDA80);
      uint64_t v86 = 0;
      uint64_t v87 = 0xE000000000000000;
      _StringGuts.grow(_:)(55);
      v34._object = (void *)0x80000001000D3120;
      v34._uint64_t countAndFlagsBits = 0xD000000000000035;
      String.append(_:)(v34);
      swift_bridgeObjectRetain();
      v35._uint64_t countAndFlagsBits = v29;
      v35._object = v30;
      String.append(_:)(v35);
      swift_bridgeObjectRelease();
      id v36 = sub_10002EEB8(4u, v86, v87);
      swift_bridgeObjectRelease();
      uint64_t v86 = (uint64_t)v36;
      sub_100005E5C((uint64_t *)&unk_1000FDA30);
      Fail.init(error:)();
      sub_10000953C(&qword_1000FD300, &qword_1000FD2F8);
      uint64_t v37 = v83;
      uint64_t v38 = Publisher.eraseToAnyPublisher()();

      (*(void (**)(void *, void *))(v84 + 8))(v33, v37);
    }
    else
    {
      uint64_t v44 = v82;
      uint64_t v84 = *(void *)(v82 + 32);
      uint64_t v68 = v28;
      uint64_t v45 = v20;
      uint64_t v46 = v21;
      ((void (*)(char *, char *, uint64_t))v84)(v28, v45, v21);
      uint64_t v47 = sub_100005EA0(v0 + 2, v0[5]);
      uint64_t v48 = sub_1000C32B8();
      uint64_t v83 = sub_100005EA0(v47, v47[3]);
      uint64_t v49 = v44;
      uint64_t v50 = *(void (**)(char *, char *, uint64_t))(v44 + 16);
      uint64_t v85 = v32;
      uint64_t v51 = v69;
      uint64_t v52 = v46;
      v50(v69, v28, v46);
      uint64_t v67 = sub_1000804E0();
      unint64_t v53 = (*(unsigned __int8 *)(v49 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
      unint64_t v54 = (v24 + v53 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v55 = swift_allocObject();
      ((void (*)(unint64_t, char *, uint64_t))v84)(v55 + v53, v51, v52);
      *(void *)(v55 + v54) = v67;
      uint64_t v56 = v47[5];
      swift_bridgeObjectRetain();
      uint64_t v57 = sub_1000C4184((uint64_t)sub_1000C4118, v55, v48, 0, v56, (uint64_t)v83);
      swift_bridgeObjectRelease_n();
      swift_release();
      uint64_t v86 = v57;
      uint64_t v58 = v72;
      sub_1000C4488(v1, v72);
      unint64_t v59 = (*(unsigned __int8 *)(v70 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v70 + 80);
      uint64_t v60 = swift_allocObject();
      uint64_t v61 = v85;
      *(void *)(v60 + 16) = v85;
      sub_1000C45F4(v58, v60 + v59);
      id v62 = v61;
      sub_100005E5C(&qword_100100258);
      sub_10000953C(&qword_100100260, &qword_100100258);
      Publisher.tryFilter(_:)();
      swift_release();
      swift_release();
      sub_10000953C(&qword_100100268, &qword_100100240);
      Publisher.map<A>(_:)();
      sub_100009894();
      v63();
      sub_100005E5C(&qword_1000FCEE8);
      sub_10000953C(&qword_100100270, &qword_100100248);
      sub_10000953C((unint64_t *)&qword_1000FCEF0, &qword_1000FCEE8);
      Publisher.catch<A>(_:)();
      sub_100009894();
      v64();
      sub_10000953C(&qword_100100278, &qword_100100250);
      uint64_t v38 = Publisher.eraseToAnyPublisher()();

      sub_100009894();
      v65();
      (*(void (**)(char *, uint64_t))(v82 + 8))(v68, v52);
    }
  }
  else
  {
    uint64_t v86 = 0;
    uint64_t v87 = 0xE000000000000000;
    _StringGuts.grow(_:)(65);
    v39._uint64_t countAndFlagsBits = 0xD00000000000003FLL;
    v39._object = (void *)0x80000001000D30E0;
    String.append(_:)(v39);
    swift_bridgeObjectRetain();
    v40._uint64_t countAndFlagsBits = v29;
    v40._object = v30;
    String.append(_:)(v40);
    swift_bridgeObjectRelease();
    id v41 = sub_10002EEB8(3u, v86, v87);
    swift_bridgeObjectRelease();
    uint64_t v86 = (uint64_t)v41;
    sub_100005E5C((uint64_t *)&unk_1000FDA30);
    int64_t v42 = v85;
    Fail.init(error:)();
    sub_10000953C(&qword_1000FD300, &qword_1000FD2F8);
    uint64_t v43 = v83;
    uint64_t v38 = Publisher.eraseToAnyPublisher()();
    (*(void (**)(void *, void *))(v84 + 8))(v42, v43);
  }
  return v38;
}

uint64_t sub_1000C32B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005E5C(&qword_1000FCC08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000CB6A0;
  *(unsigned char *)(inited + 32) = 2;
  uint64_t v8 = *(void *)(v1 + 56);
  uint64_t v7 = *(void *)(v1 + 64);
  *(void *)(inited + 64) = &type metadata for String;
  *(void *)(inited + 40) = v8;
  *(void *)(inited + 48) = v7;
  *(unsigned char *)(inited + 72) = 7;
  swift_bridgeObjectRetain();
  Date.init()();
  uint64_t v9 = sub_1000A268C();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(void *)(inited + 104) = &type metadata for UInt64;
  *(void *)(inited + 80) = v9;
  *(unsigned char *)(inited + 112) = 8;
  uint64_t v10 = *(void *)(v1 + *(int *)(type metadata accessor for SubscriptionRefreshOperation() + 40));
  *(void *)(inited + 144) = &type metadata for UInt64;
  *(void *)(inited + 120) = v10;
  *(unsigned char *)(inited + 152) = 43;
  LOBYTE(v10) = *(unsigned char *)(v1 + 72);
  *(void *)(inited + 184) = &type metadata for Bool;
  *(unsigned char *)(inited + 160) = v10;
  *(unsigned char *)(inited + 192) = 44;
  *(void *)(inited + 224) = &type metadata for EventType.EventName;
  *(unsigned char *)(inited + 200) = 2;
  sub_100005E5C((uint64_t *)&unk_1000FC300);
  sub_100027288();
  uint64_t v11 = Dictionary.init(dictionaryLiteral:)();
  uint64_t v12 = sub_1000C2694(v11);
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_1000C3490(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v81 = a2;
  uint64_t v82 = a3;
  uint64_t v6 = sub_100005E5C(&qword_1000FC938);
  __chkstk_darwin(v6 - 8);
  uint64_t v75 = (uint64_t)&v69 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t refreshed = type metadata accessor for SubscriptionRefreshOperation();
  __chkstk_darwin(refreshed);
  uint64_t v76 = (uint64_t)&v69 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v78 = (uint64_t)&v69 - v10;
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v69 - v12;
  uint64_t v14 = type metadata accessor for SportsManager.RefreshOptions();
  uint64_t v83 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v69 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for SportingEventProgressStatus();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v69 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v69 - v22;
  uint64_t v73 = sub_100005E5C(&qword_1000FE660);
  uint64_t v74 = a1;
  unint64_t v24 = *(void *)(a1 + *(int *)(v73 + 40));
  if (!(v24 >> 62))
  {
    uint64_t v25 = *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v25) {
      goto LABEL_3;
    }
LABEL_28:
    swift_bridgeObjectRelease();
    sub_10002EEB8(5u, 0xD000000000000013, 0x80000001000D3160);
    swift_willThrow();
    return 1;
  }
  swift_bridgeObjectRetain();
  if (!_CocoaArrayWrapper.endIndex.getter()) {
    goto LABEL_28;
  }
LABEL_3:
  uint64_t v79 = v4;
  sub_100097604(0, (v24 & 0xC000000000000001) == 0, v24);
  if ((v24 & 0xC000000000000001) != 0) {
    id v26 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
  }
  else {
    id v26 = *(id *)(v24 + 32);
  }
  id v77 = v26;
  swift_bridgeObjectRelease();
  uint64_t v27 = (void *)SportingEventSubscription.sportingEventDetails.getter();
  SportingEvent.progressStatus.getter();

  (*(void (**)(char *, void, uint64_t))(v18 + 104))(v20, enum case for SportingEventProgressStatus.unknown(_:), v17);
  int v72 = sub_10006A990((uint64_t)v23, (uint64_t)v20);
  uint64_t v28 = *(void (**)(char *, uint64_t))(v18 + 8);
  v28(v20, v17);
  v28(v23, v17);
  uint64_t v29 = (uint64_t)v82;
  static SportsManager.RefreshOptions.plays.getter();
  sub_1000C46CC();
  LOBYTE(v28) = dispatch thunk of SetAlgebra.isSuperset(of:)();
  uint64_t v30 = *(void (**)(char *, uint64_t))(v83 + 8);
  v83 += 8;
  v30(v16, v14);
  sub_1000C4488(v29, (uint64_t)v13);
  uint64_t v31 = v79;
  if (v28)
  {
    char v32 = v13[72];
    sub_10009E70C((uint64_t)v13);
    if (v32)
    {
      v84[3] = (uint64_t)&type metadata for TVAppFeatureFlags;
      v84[4] = sub_1000092D4();
      char v33 = isFeatureEnabled(_:)();
      sub_100006178((uint64_t)v84);
      uint64_t v34 = (uint64_t)v82;
      if (v33) {
        goto LABEL_12;
      }
      uint64_t v35 = v82[1];
      uint64_t v36 = v82[7];
      uint64_t v70 = (void *)v82[8];
      uint64_t v71 = v35;
      uint64_t v37 = dispatch thunk of SportingEvent.plays.getter();
      v38._uint64_t countAndFlagsBits = v36;
      v38._object = v70;
      PlaysStore.refreshAllPlays(for:with:)(v38, (Swift::OpaquePointer)v37);
      uint64_t v31 = v39;
      if (v39)
      {

        swift_bridgeObjectRelease();
        return 1;
      }
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_10009E70C((uint64_t)v13);
  }
  uint64_t v34 = (uint64_t)v82;
LABEL_12:
  static SportsManager.RefreshOptions.subscription.getter();
  char v40 = dispatch thunk of SetAlgebra.isSuperset(of:)();
  v30(v16, v14);
  uint64_t v41 = v78;
  sub_1000C4488(v34, v78);
  if (v40)
  {
    sub_10009E70C(v41);
    id v42 = v77;
  }
  else
  {
    static SportsManager.RefreshOptions.subscriptionIfUnknown.getter();
    char v43 = dispatch thunk of SetAlgebra.isSuperset(of:)();
    v30(v16, v14);
    sub_10009E70C(v41);
    if ((v43 & 1) == 0)
    {

      return 1;
    }
    id v42 = v77;
    if ((v72 & 1) == 0) {
      goto LABEL_23;
    }
  }
  uint64_t v44 = (void *)SportingEvent.partialSportingEvent.getter();
  uint64_t v45 = dispatch thunk of SportingEvent.versionNumber.getter();

  uint64_t v46 = v81;
  uint64_t v47 = (void *)SportingEventSubscription.sportingEventDetails.getter();
  uint64_t v48 = dispatch thunk of SportingEvent.versionNumber.getter();

  if (v45 >= v48)
  {
    unint64_t v64 = (void *)SportingEvent.partialSportingEvent.getter();
    uint64_t v65 = type metadata accessor for Date();
    uint64_t v66 = v75;
    sub_1000082C0(v75, 1, 1, v65);
    SportingEventSubscription.update(sportingEventDetails:updatedAt:)();

    sub_1000095CC(v66, &qword_1000FC938);
    char v67 = *(unsigned char *)(v34 + 72);
    sub_100005EA0((void *)(*(void *)v34 + 16), *(void *)(*(void *)v34 + 40));
    dispatch thunk of PersistentStorable.writeEventSubscription(_:isConventionalOrUnified:)();
    if (!v31) {
      sub_1000C3D10(*(void *)(v74 + *(int *)(v73 + 36)), *(void *)(v74 + *(int *)(v73 + 36) + 8), *(void *)(v34 + 56), *(void *)(v34 + 64), v67);
    }
LABEL_23:

    return 1;
  }
  uint64_t v79 = v31;
  if (qword_1000FBDC0 != -1) {
    swift_once();
  }
  uint64_t v49 = type metadata accessor for Logger();
  sub_10000929C(v49, (uint64_t)qword_10010A508);
  uint64_t v50 = v76;
  sub_1000C4488(v34, v76);
  id v51 = v42;
  id v52 = v46;
  id v53 = v51;
  id v54 = v52;
  uint64_t v55 = Logger.logObject.getter();
  os_log_type_t v56 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v55, v56))
  {
    uint64_t v57 = swift_slowAlloc();
    uint64_t v83 = swift_slowAlloc();
    v84[0] = v83;
    *(_DWORD *)uint64_t v57 = 136315650;
    uint64_t v58 = *(void *)(v50 + 56);
    unint64_t v59 = *(void *)(v50 + 64);
    swift_bridgeObjectRetain();
    uint64_t v85 = sub_100017098(v58, v59, v84);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_10009E70C(v50);
    *(_WORD *)(v57 + 12) = 2048;
    uint64_t v60 = (void *)SportingEvent.partialSportingEvent.getter();
    uint64_t v61 = dispatch thunk of SportingEvent.versionNumber.getter();

    uint64_t v85 = v61;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    *(_WORD *)(v57 + 22) = 2048;
    id v62 = (void *)SportingEventSubscription.sportingEventDetails.getter();
    uint64_t v63 = dispatch thunk of SportingEvent.versionNumber.getter();

    uint64_t v85 = v63;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    _os_log_impl((void *)&_mh_execute_header, v55, v56, "Skipped stale subscription refresh update for canonical id: %s. (%ld < %ld)", (uint8_t *)v57, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    sub_10009E70C(v50);
  }
  return 1;
}

void sub_1000C3D10(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, char a5)
{
  v15[3] = (uint64_t)&type metadata for TVAppFeatureFlags;
  v15[4] = sub_1000092D4();
  char v10 = isFeatureEnabled(_:)();
  sub_100006178((uint64_t)v15);
  if (v10)
  {
    if (a2 >> 60 == 15)
    {
      if (qword_1000FBDC8 != -1) {
        swift_once();
      }
      uint64_t v11 = type metadata accessor for Logger();
      sub_10000929C(v11, (uint64_t)qword_10010A520);
      swift_bridgeObjectRetain_n();
      uint64_t v12 = Logger.logObject.getter();
      os_log_type_t v13 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = (uint8_t *)swift_slowAlloc();
        v15[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v14 = 136315138;
        swift_bridgeObjectRetain();
        sub_100017098(a3, a4, v15);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "Unexpected empty response from Tempo current event state for canonicalId: %s", v14, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
    else
    {
      sub_10001DF8C(a1, a2);
      sub_100032480(a1, a2, a3, a4, a5 & 1);
      sub_100029010(a1, a2);
    }
  }
}

uint64_t sub_1000C3F34@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_100005E5C(&qword_1000FD2F8);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[1] = *a1;
  swift_errorRetain();
  sub_100005E5C((uint64_t *)&unk_1000FDA30);
  Fail.init(error:)();
  sub_10000953C(&qword_1000FD300, &qword_1000FD2F8);
  uint64_t v8 = Publisher.eraseToAnyPublisher()();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *a2 = v8;
  return result;
}

uint64_t sub_1000C4080()
{
  type metadata accessor for URL();
  sub_1000098E8();
  v1 += 8;
  uint64_t v2 = *(unsigned __int8 *)(v1 + 72);
  uint64_t v3 = v2 | 7;
  unint64_t v4 = ((*(void *)(v1 + 56) + ((v2 + 16) & ~v2) + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  sub_100009894();
  v5();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v4, v3);
}

id sub_1000C4118()
{
  uint64_t v1 = type metadata accessor for URL();
  sub_10000984C(v1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_100028084(v0 + v6, *(void *)(v0 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_1000C4184(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v24 = sub_100005E5C(&qword_100100288);
  uint64_t v12 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28[3] = &type metadata for AMSApiRequest;
  v28[4] = &off_1000F0670;
  uint64_t v15 = (void *)swift_allocObject();
  v28[0] = v15;
  v15[2] = a1;
  v15[3] = a2;
  v15[4] = a3;
  uint64_t v15[5] = a4;
  id v16 = a4;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_100074D20();
  uint64_t v27 = v17;
  sub_100008218(a6, (uint64_t)__src);
  sub_100008B98((uint64_t)v28, (uint64_t)v25);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = a5;
  memcpy((void *)(v18 + 24), __src, 0x60uLL);
  sub_100008CAC(v25, v18 + 120);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = sub_1000C47C4;
  *(void *)(v19 + 24) = v18;
  swift_retain();
  static Subscribers.Demand.unlimited.getter();
  sub_100005E5C(&qword_1000FC0C0);
  sub_100005E5C(&qword_1000FE660);
  sub_100005E5C(&qword_100100290);
  sub_10000953C(&qword_1000FC0C8, &qword_1000FC0C0);
  sub_10000953C(&qword_100100298, &qword_100100290);
  Publisher.flatMap<A, B>(maxPublishers:_:)();
  swift_release();
  swift_release();
  sub_10000953C(qword_1001002A0, &qword_100100288);
  uint64_t v20 = v24;
  uint64_t v21 = Publisher.eraseToAnyPublisher()();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v20);
  sub_100006178((uint64_t)v28);
  return v21;
}

uint64_t sub_1000C4488(uint64_t a1, uint64_t a2)
{
  uint64_t refreshed = type metadata accessor for SubscriptionRefreshOperation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(refreshed - 8) + 16))(a2, a1, refreshed);
  return a2;
}

uint64_t sub_1000C44EC()
{
  uint64_t v1 = *(void *)(type metadata accessor for SubscriptionRefreshOperation() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;

  swift_release();
  swift_release();
  sub_100006178(v0 + v3 + 16);
  swift_bridgeObjectRelease();
  type metadata accessor for SportsManager.RefreshOptions();
  sub_1000098E8();
  sub_100009894();
  v6();

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_1000C45F4(uint64_t a1, uint64_t a2)
{
  uint64_t refreshed = type metadata accessor for SubscriptionRefreshOperation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(refreshed - 8) + 32))(a2, a1, refreshed);
  return a2;
}

uint64_t sub_1000C4658(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for SubscriptionRefreshOperation() - 8);
  return sub_1000C3490(a1, *(void **)(v1 + 16), (void *)(v1 + ((*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)))) & 1;
}

unint64_t sub_1000C46CC()
{
  unint64_t result = qword_100100280;
  if (!qword_100100280)
  {
    type metadata accessor for SportsManager.RefreshOptions();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100100280);
  }
  return result;
}

uint64_t sub_1000C471C()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000C4764()
{
  swift_release();

  sub_100006178(v0 + 32);
  swift_unknownObjectRelease();
  sub_100006178(v0 + 80);
  sub_100006178(v0 + 120);

  return _swift_deallocObject(v0, 160, 7);
}

void sub_1000C47C4()
{
}

uint64_t sub_1000C47D4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000C480C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_1000C48A0()
{
}

void sub_1000C48D0()
{
}

id sub_1000C48E0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Box();
  return [super dealloc];
}

uint64_t sub_1000C493C(char *a1)
{
  return (*(uint64_t (**)(char *))(*(void *)(*(void *)((swift_isaMask & *(void *)a1) + 0x50) - 8)
                                           + 8))(&a1[*(void *)((swift_isaMask & *(void *)a1) + 0x58)]);
}

uint64_t type metadata accessor for Box()
{
  return sub_10000B38C();
}

uint64_t sub_1000C49C0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  switch(a2)
  {
    case 0:
      return !a4;
    case 1:
      return a4 == 1;
    case 2:
      return a4 == 2;
    case 3:
      return a4 == 3;
    case 4:
      return a4 == 4;
    case 5:
      return a4 == 5;
    case 6:
      return a4 == 6;
    case 7:
      return a4 == 7;
    case 8:
      return a4 == 8;
    case 9:
      return a4 == 9;
    default:
      if (a4 < 0xA) {
        return 0;
      }
      if (a1 == a3 && a2 == a4) {
        return 1;
      }
      else {
        return _stringCompareWithSmolCheck(_:_:expecting:)();
      }
  }
}

uint64_t sub_1000C4AB0(uint64_t a1)
{
  unint64_t v2 = sub_1000C53C0();

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_1000C4AEC(uint64_t a1)
{
  unint64_t v2 = sub_1000C53C0();

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_1000C4B28(uint64_t *a1, uint64_t a2)
{
  return sub_1000C49C0(*a1, a1[1], *(void *)a2, *(void *)(a2 + 8));
}

unint64_t sub_1000C4B3C(uint64_t a1, void *a2)
{
  unint64_t result = 0xD000000000000014;
  switch((unint64_t)a2)
  {
    case 0uLL:
      return result;
    case 1uLL:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 2uLL:
      unint64_t result = 0xD000000000000029;
      break;
    case 3uLL:
    case 4uLL:
      unint64_t result = 0xD00000000000002ALL;
      break;
    case 5uLL:
      unint64_t result = 0xD000000000000010;
      break;
    case 6uLL:
      unint64_t result = 0xD000000000000026;
      break;
    case 7uLL:
      unint64_t result = 0xD00000000000002BLL;
      break;
    case 8uLL:
      unint64_t result = 0xD000000000000027;
      break;
    case 9uLL:
      unint64_t result = 0xD000000000000025;
      break;
    default:
      sub_1000C5B94();
      _StringGuts.grow(_:)(36);
      swift_bridgeObjectRelease();
      v4._uint64_t countAndFlagsBits = 0xD000000000000014;
      v4._object = a2;
      String.append(_:)(v4);
      unint64_t result = 0xD000000000000022;
      break;
  }
  return result;
}

unint64_t sub_1000C4CC0()
{
  return sub_1000C4B3C(*(void *)v0, *(void **)(v0 + 8));
}

unint64_t sub_1000C4CC8()
{
  return sub_1000804B8(27);
}

uint64_t sub_1000C4CE0(uint64_t a1, unint64_t a2)
{
  if (a2 > 9) {
    return 3;
  }
  else {
    return qword_1000D03F8[a2];
  }
}

uint64_t sub_1000C4D00(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xA)
  {
    sub_100005E5C(&qword_1000FCDD8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1000CABA0;
    *(void *)(inited + 32) = 0x6449656C646E7562;
    *(void *)(inited + 40) = 0xE800000000000000;
    *(void *)(inited + 72) = &type metadata for String;
    *(void *)(inited + 48) = a1;
    *(void *)(inited + 56) = a2;
    swift_bridgeObjectRetain();
    return Dictionary.init(dictionaryLiteral:)();
  }
  else
  {
    return Dictionary.init(dictionaryLiteral:)();
  }
}

unint64_t sub_1000C4DE4()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_1000C4E04(uint64_t a1)
{
  return sub_1000C4CE0(a1, *(void *)(v1 + 8));
}

uint64_t sub_1000C4E0C()
{
  return sub_1000C4D00(*(void *)v0, *(void *)(v0 + 8));
}

uint64_t sub_1000C4E14(uint64_t a1)
{
  unint64_t v2 = sub_1000C540C();

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_1000C4E50(uint64_t a1)
{
  unint64_t v2 = sub_1000C540C();

  return Error<>._code.getter(a1, v2);
}

unint64_t sub_1000C4E8C()
{
  return sub_1000804B8(41);
}

unint64_t sub_1000C4EA4()
{
  return 0xD000000000000029;
}

unint64_t sub_1000C4EC4()
{
  return sub_1000804B8(28);
}

unint64_t sub_1000C4EDC()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_1000C4F00(uint64_t a1)
{
  unint64_t v2 = sub_1000C5458();

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_1000C4F3C(uint64_t a1)
{
  unint64_t v2 = sub_1000C5458();

  return Error<>._code.getter(a1, v2);
}

unint64_t sub_1000C4F78()
{
  return sub_1000804B8(23);
}

unint64_t sub_1000C4F90()
{
  return 0xD000000000000017;
}

unint64_t sub_1000C4FB0()
{
  return sub_1000804B8(27);
}

uint64_t sub_1000C4FC8()
{
  return Dictionary.init(dictionaryLiteral:)();
}

unint64_t sub_1000C4FF0()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_1000C5010(uint64_t a1)
{
  unint64_t v2 = sub_1000C54A4();

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_1000C504C(uint64_t a1)
{
  unint64_t v2 = sub_1000C54A4();

  return Error<>._code.getter(a1, v2);
}

unint64_t sub_1000C5088(uint64_t a1, void *a2)
{
  if (a2 == (void *)10)
  {
    sub_1000C5B94();
    _StringGuts.grow(_:)(26);
    swift_bridgeObjectRelease();
    return 0xD000000000000041;
  }
  else if (a2 == (void *)11)
  {
    sub_1000C5B94();
    _StringGuts.grow(_:)(25);
    swift_bridgeObjectRelease();
    return 0xD00000000000002ELL;
  }
  else
  {
    _StringGuts.grow(_:)(25);
    swift_bridgeObjectRelease();
    unint64_t v5 = sub_1000C4B3C(a1, a2);
    if (v6)
    {
      unint64_t v7 = v6;
    }
    else
    {
      unint64_t v5 = 0;
      unint64_t v7 = 0xE000000000000000;
    }
    unint64_t v8 = v7;
    String.append(_:)(*(Swift::String *)&v5);
    swift_bridgeObjectRelease();
    return 0xD000000000000017;
  }
}

unint64_t sub_1000C5194()
{
  return sub_1000C5088(*(void *)v0, *(void **)(v0 + 8));
}

unint64_t sub_1000C519C()
{
  return sub_1000804B8(32);
}

uint64_t sub_1000C51B4(uint64_t a1, uint64_t a2)
{
  if (a2 == 10) {
    return 1;
  }
  else {
    return 2 * (a2 == 11);
  }
}

uint64_t sub_1000C51CC(uint64_t a1, unint64_t a2)
{
  if (a2 == 10 || a2 == 11)
  {
    unint64_t v2 = sub_1000C54F0();
    swift_dynamicCast();
    uint64_t v3 = v7;
  }
  else
  {
    sub_1000AC13C(a1, a2);
    unint64_t v2 = sub_1000C54F0();
    swift_dynamicCast();
    uint64_t v3 = v8;
  }
  sub_100005E5C(&qword_1000FCDD8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000CABA0;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v5;
  sub_1000C54F0();
  *(void *)(inited + 72) = v2;
  *(void *)(inited + 48) = v3;
  return Dictionary.init(dictionaryLiteral:)();
}

unint64_t sub_1000C52EC()
{
  return 0xD000000000000020;
}

uint64_t sub_1000C530C(uint64_t a1)
{
  return sub_1000C51B4(a1, *(void *)(v1 + 8));
}

uint64_t sub_1000C5314()
{
  return sub_1000C51CC(*(void *)v0, *(void *)(v0 + 8));
}

unint64_t sub_1000C5320()
{
  unint64_t result = qword_100100328;
  if (!qword_100100328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100100328);
  }
  return result;
}

unint64_t sub_1000C5370()
{
  unint64_t result = qword_100100330;
  if (!qword_100100330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100100330);
  }
  return result;
}

unint64_t sub_1000C53C0()
{
  unint64_t result = qword_100100338;
  if (!qword_100100338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100100338);
  }
  return result;
}

unint64_t sub_1000C540C()
{
  unint64_t result = qword_100100340;
  if (!qword_100100340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100100340);
  }
  return result;
}

unint64_t sub_1000C5458()
{
  unint64_t result = qword_100100348;
  if (!qword_100100348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100100348);
  }
  return result;
}

unint64_t sub_1000C54A4()
{
  unint64_t result = qword_100100350;
  if (!qword_100100350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100100350);
  }
  return result;
}

unint64_t sub_1000C54F0()
{
  unint64_t result = qword_100100358;
  if (!qword_100100358)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100100358);
  }
  return result;
}

unint64_t sub_1000C5534(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_1000C554C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_1000C5BA4(a1, a2);
  if (v5)
  {
    *unint64_t v2 = *v4;
    v2[1] = v3;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)unint64_t v2 = *(_OWORD *)v4;
  }
  return v2;
}

void *sub_1000C558C(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000C5630(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000C5694(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 > 0x7FFFFFF5 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483638);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 9;
  if (v4 >= 0xB) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t sub_1000C56EC(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFF6)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483638;
    if (a3 >= 0x7FFFFFF6) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFF6) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 9;
    }
  }
  return result;
}

void type metadata accessor for ActivityCreateError()
{
}

void type metadata accessor for ActivityDestroyError()
{
}

unsigned char *sub_1000C5758(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x1000C57F4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void type metadata accessor for ActivityUpdateError()
{
}

void *sub_1000C582C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_1000C5BA4(a1, a2);
  if (!v6) {
    int v5 = v3;
  }
  if ((v5 + 1) <= 0xA && v5 == -1)
  {
    *unint64_t v2 = *v4;
    v2[1] = v3;
    swift_bridgeObjectRetain();
  }
  else
  {
    *(_OWORD *)unint64_t v2 = *(_OWORD *)v4;
  }
  return v2;
}

uint64_t sub_1000C5880(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) >= 0xFFFFFFFFuLL) {
    LODWORD(v4) = -1;
  }
  else {
    uint64_t v4 = *(void *)(a1 + 8);
  }
  unsigned int v5 = v4 + 1;
  unint64_t v6 = *(void *)(a2 + 8);
  if (v6 >= 0xFFFFFFFF) {
    LODWORD(v6) = -1;
  }
  unsigned int v7 = v6 + 1;
  if (v5 > 0xA)
  {
    if (v7 <= 0xA && v6 == -1) {
      goto LABEL_13;
    }
LABEL_18:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v7 > 0xA)
  {
    if (v5) {
      goto LABEL_18;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  if (!v5)
  {
    if (v6 == -1)
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = *(void *)(a2 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    goto LABEL_17;
  }
  if (v6 != -1) {
    goto LABEL_18;
  }
LABEL_13:
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1000C5954(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 8);
  LODWORD(v5) = -1;
  if (v4 >= 0xFFFFFFFF) {
    int v6 = -1;
  }
  else {
    int v6 = v4;
  }
  unsigned int v7 = v6 + 1;
  unint64_t v8 = *(void *)(a2 + 8);
  if (v8 < 0xFFFFFFFF) {
    uint64_t v5 = *(void *)(a2 + 8);
  }
  if (v7 > 0xA) {
    goto LABEL_13;
  }
  unsigned int v9 = v5 + 1;
  if (v9 > 0xA)
  {
    if (!v7) {
      goto LABEL_12;
    }
LABEL_13:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v7) {
    goto LABEL_13;
  }
  if (v9)
  {
LABEL_12:
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000C59D8(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 > 0x7FFFFFF3 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483636);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 9;
  if (v4 < 0xB) {
    unsigned int v5 = 0;
  }
  if (v5 >= 3) {
    return v5 - 2;
  }
  else {
    return 0;
  }
}

uint64_t sub_1000C5A3C(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFF4)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483636;
    if (a3 >= 0x7FFFFFF4) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFF4) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 11;
    }
  }
  return result;
}

uint64_t sub_1000C5A8C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  unsigned int v2 = v1 + 1;
  unsigned int v3 = v1 - 9;
  if (v2 >= 0xB) {
    return v3;
  }
  else {
    return 0;
  }
}

void *sub_1000C5AB0(void *result, unsigned int a2)
{
  if (a2 >= 0x7FFFFFF6)
  {
    *unint64_t result = 0;
    result[1] = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483638;
  }
  else if (a2)
  {
    result[1] = a2 + 9;
  }
  return result;
}

void type metadata accessor for LiveActivityManagerError()
{
}

unint64_t sub_1000C5AF4()
{
  unint64_t result = qword_100100360;
  if (!qword_100100360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100100360);
  }
  return result;
}

unint64_t sub_1000C5B44()
{
  unint64_t result = qword_100100368;
  if (!qword_100100368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100100368);
  }
  return result;
}

uint64_t sub_1000C5BA4(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 8);
}

void *sub_1000C5BB8()
{
  uint64_t v0 = type metadata accessor for URL();
  __chkstk_darwin(v0 - 8);
  uint64_t v25 = 0;
  memset(v24, 0, sizeof(v24));
  if (qword_1000FBDA0 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_10010A4E0;
  v22[3] = type metadata accessor for LiveActivityManager();
  v22[4] = &off_1000F15E8;
  v22[0] = v1;
  swift_retain();
  sub_100037ED0((uint64_t)v24, &qword_1000FD930);
  sub_1000C6D18((uint64_t)v22, (uint64_t)v24);
  sub_10002A418((uint64_t)v24, (uint64_t)v23, &qword_1000FD930);
  bzero(v22, 0xB8uLL);
  if (qword_1000FBD68 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_1000FBE38;
  uint64_t v20 = qword_10010A4A0;
  swift_retain();
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_10010A5E8;
  unsigned int v4 = self;
  swift_retain();
  id v5 = [v4 defaultManager];
  NSFileManager.currentContainerURL.getter();

  type metadata accessor for PlaysStore();
  swift_allocObject();
  uint64_t v6 = PlaysStore.init(storeUrl:)();
  unsigned int v7 = (objc_class *)type metadata accessor for ActivityAuthorization();
  id v8 = [objc_allocWithZone(v7) init];
  unint64_t v9 = sub_1000522C4();
  uint64_t v11 = v10;
  v21[3] = v7;
  v21[4] = &off_1000F15C8;
  v21[0] = v8;
  type metadata accessor for ActivityCapUtility();
  uint64_t v12 = (void *)swift_allocObject();
  uint64_t v13 = sub_10000A014((uint64_t)v21, (uint64_t)v7);
  __chkstk_darwin(v13);
  uint64_t v15 = (void *)((char *)&v21[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v16 + 16))(v15);
  uint64_t v17 = *v15;
  v12[5] = v7;
  v12[6] = &off_1000F15C8;
  v12[2] = v17;
  v12[7] = v9;
  v12[8] = v11;
  sub_100006178((uint64_t)v21);
  uint64_t v18 = sub_1000C66E4(v20, v3, v6, (uint64_t)v23, (uint64_t)v12, (uint64_t)sub_10007ADBC, 0, (uint64_t)v22);
  sub_100037ED0((uint64_t)v24, &qword_1000FD930);
  return v18;
}

uint64_t sub_1000C5F18(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(uint64_t (**)(unint64_t, unint64_t, void (*)(uint64_t, uint64_t), void *))(v5 + 120);
  _OWORD v8[2] = a1;
  char v9 = a2;
  uint64_t v10 = a4;
  uint64_t v11 = a5;
  uint64_t v12 = a3;
  return v6(0xD00000000000001DLL, 0x80000001000D3560, sub_1000C6550, v8);
}

void sub_1000C5F8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v32 = a7;
  int v33 = a5;
  uint64_t v34 = a1;
  uint64_t v35 = a2;
  uint64_t v12 = sub_100005E5C(&qword_1000FC938);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(a4 + 16);
  uint64_t v16 = *(void *)(a4 + 64);
  sub_10002A418(a4 + 72, (uint64_t)v38, &qword_1000FD930);
  uint64_t v17 = *(void *)(a4 + 320);
  swift_beginAccess();
  sub_10002A418(a4 + 136, (uint64_t)v37, &qword_1000FCFF0);
  sub_100008B98(a4 + 24, (uint64_t)v36);
  sub_10002A418(a8, (uint64_t)v14, &qword_1000FC938);
  uint64_t v18 = sub_10000A014((uint64_t)v36, v36[3]);
  __chkstk_darwin(v18);
  uint64_t v20 = (uint64_t *)((char *)&v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v21 + 16))(v20);
  uint64_t v22 = *v20;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v23 = v32;
  sub_1000C6D08(a6);
  *((void *)&v30 + 1) = v23;
  *(void *)&long long v30 = a6;
  id v24 = sub_1000C6B2C(a3, v15, v16, (uint64_t)v38, v17, (uint64_t)v37, v22, v33, v30, (uint64_t)v14);
  sub_100006178((uint64_t)v36);
  uint64_t v25 = (void *)swift_allocObject();
  uint64_t v26 = v34;
  uint64_t v27 = v35;
  long long v25[2] = v24;
  v25[3] = v26;
  v25[4] = v27;
  v37[4] = sub_1000C6CE4;
  v37[5] = v25;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 1107296256;
  _OWORD v37[2] = sub_10008FF30;
  v37[3] = &unk_1000F5A60;
  uint64_t v28 = _Block_copy(v37);
  id v29 = v24;
  swift_retain();
  sub_1000C6D08((uint64_t)sub_1000C6CE4);
  swift_release();
  [v29 setCompletionBlock:v28];
  _Block_release(v28);

  swift_release();
  [*(id *)(a4 + 112) addOperation:v29];
}

uint64_t sub_1000C62A8(void *a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  if (qword_1000FBDB8 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_10000929C(v4, (uint64_t)qword_10010A4F0);
  uint64_t v5 = a1;
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)id v8 = 136315138;
    if (*(void *)&v5[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_messageVersion + 8])
    {
      uint64_t v9 = *(void *)&v5[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_messageVersion];
      unint64_t v10 = *(void *)&v5[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_messageVersion + 8];
    }
    else
    {
      unint64_t v10 = 0xE300000000000000;
      uint64_t v9 = 7104878;
    }
    swift_bridgeObjectRetain();
    sub_100017098(v9, v10, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "releasing os_transaction taken for message version %s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return a2(v11, v12);
}

uint64_t sub_1000C6490()
{
  swift_release();
  sub_100006178(v0 + 24);
  swift_release();
  sub_100037ED0(v0 + 72, &qword_1000FD930);

  swift_release();
  sub_100037ED0(v0 + 136, &qword_1000FCFF0);
  swift_release();
  return v0;
}

uint64_t sub_1000C64F8()
{
  sub_1000C6490();

  return _swift_deallocClassInstance(v0, 328, 7);
}

uint64_t type metadata accessor for ApsMessageProcessor()
{
  return self;
}

void sub_1000C6550(uint64_t a1, uint64_t a2)
{
  sub_1000C5F8C(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(unsigned __int8 *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), *(void *)(v2 + 56));
}

void *sub_1000C6564(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  v19[3] = type metadata accessor for SportsPerformanceMeasurement();
  v19[4] = &off_1000F5568;
  v19[0] = a2;
  bzero(a9 + 17, 0xB8uLL);
  a9[2] = a1;
  sub_100008B98((uint64_t)v19, (uint64_t)(a9 + 3));
  a9[8] = a3;
  sub_10002A418(a4, (uint64_t)(a9 + 9), &qword_1000FD930);
  a9[40] = a5;
  a9[15] = a6;
  a9[16] = a7;
  swift_beginAccess();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1000C6D80(a8, (uint64_t)(a9 + 17));
  swift_endAccess();
  id v17 = [objc_allocWithZone((Class)NSOperationQueue) init];
  a9[14] = v17;
  [v17 setMaxConcurrentOperationCount:1];
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_100037ED0(a8, &qword_1000FCFF0);
  sub_100037ED0(a4, &qword_1000FD930);
  sub_100006178((uint64_t)v19);
  return a9;
}

void *sub_1000C66E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v25 = type metadata accessor for SportsPerformanceMeasurement();
  uint64_t v26 = &off_1000F5568;
  v24[0] = a2;
  type metadata accessor for ApsMessageProcessor();
  uint64_t v16 = (void *)swift_allocObject();
  uint64_t v17 = sub_10000A014((uint64_t)v24, v25);
  __chkstk_darwin(v17);
  uint64_t v19 = (void *)((char *)&v24[-1] - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v20 + 16))(v19);
  uint64_t v21 = sub_1000C6564(a1, *v19, a3, a4, a5, a6, a7, a8, v16);
  sub_100006178((uint64_t)v24);
  return v21;
}

id sub_1000C6848(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char *a12)
{
  int v37 = a8;
  uint64_t v32 = a5;
  uint64_t v33 = a6;
  uint64_t v38 = a4;
  uint64_t v35 = a10;
  uint64_t v36 = a11;
  uint64_t v17 = type metadata accessor for Date();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = type metadata accessor for SportsPerformanceMeasurement();
  *(void *)&a12[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_cancellable] = 0;
  *(void *)&a12[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_cancellables] = _swiftEmptyArrayStorage;
  uint64_t v22 = &a12[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_messageVersion];
  *(void *)uint64_t v22 = 0;
  *((void *)v22 + 1) = 0;
  *(void *)&a12[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_message] = a1;
  v40[3] = v21;
  v40[4] = &off_1000F5568;
  v40[0] = a7;
  uint64_t v34 = a2;
  *(void *)&a12[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_dataRepository] = a2;
  *(void *)&a12[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_playsStore] = a3;
  sub_10002A418(a4, (uint64_t)&a12[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_activityUpdateable], &qword_1000FD930);
  uint64_t v23 = v33;
  *(void *)&a12[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_activityCapUtility] = v32;
  sub_10002A418(v23, (uint64_t)&a12[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_subscriptionOperationFactory], &qword_1000FCFF0);
  id v24 = a12;
  swift_retain();
  swift_retain();
  swift_retain();
  Date.init()();
  uint64_t v25 = sub_1000A268C();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  *(void *)&v24[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_notificationReceiptTime] = v25;
  sub_100008B98((uint64_t)v40, (uint64_t)&v24[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_performance]);
  v24[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_isLowCapLiveActivity] = v37;
  uint64_t v26 = (uint64_t *)&v24[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_activityUpdateCompletion];
  uint64_t v28 = v35;
  uint64_t v27 = v36;
  uint64_t *v26 = a9;
  v26[1] = v28;
  sub_10002A418(v27, (uint64_t)&v24[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_processDate], &qword_1000FC938);
  sub_1000C6D08(a9);

  id v29 = (objc_class *)type metadata accessor for ApsMessageProcessingOperation();
  v39.receiver = v24;
  v39.super_class = v29;
  id v30 = [super init];
  sub_10004C400(a9);
  swift_release();
  swift_release();
  swift_release();
  sub_100037ED0(v27, &qword_1000FC938);
  sub_100006178((uint64_t)v40);
  sub_100037ED0(v23, &qword_1000FCFF0);
  sub_100037ED0(v38, &qword_1000FD930);
  return v30;
}

id sub_1000C6B2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, long long a9, uint64_t a10)
{
  int v25 = a8;
  long long v24 = a9;
  uint64_t v27 = type metadata accessor for SportsPerformanceMeasurement();
  uint64_t v28 = &off_1000F5568;
  v26[0] = a7;
  uint64_t v17 = (char *)objc_allocWithZone((Class)type metadata accessor for ApsMessageProcessingOperation());
  uint64_t v18 = sub_10000A014((uint64_t)v26, v27);
  __chkstk_darwin(v18);
  uint64_t v20 = (uint64_t *)((char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v21 + 16))(v20);
  id v22 = sub_1000C6848(a1, a2, a3, a4, a5, a6, *v20, v25, v24, *((uint64_t *)&v24 + 1), a10, v17);
  sub_100006178((uint64_t)v26);
  return v22;
}

uint64_t sub_1000C6CA4()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000C6CE4()
{
  return sub_1000C62A8(*(void **)(v0 + 16), *(uint64_t (**)(uint64_t, uint64_t))(v0 + 24));
}

uint64_t sub_1000C6CF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000C6D00()
{
  return swift_release();
}

uint64_t sub_1000C6D08(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1000C6D18(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005E5C(&qword_1000FD930);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000C6D80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005E5C(&qword_1000FCFF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t URLRequest.httpMethod.getter()
{
  return URLRequest.httpMethod.getter();
}

NSURLRequest __swiftcall URLRequest._bridgeToObjectiveC()()
{
  uint64_t v0 = (objc_class *)URLRequest._bridgeToObjectiveC()();
  result._internal = v1;
  result.super.CFDictionaryRef isa = v0;
  return result;
}

uint64_t URLRequest.allHTTPHeaderFields.getter()
{
  return URLRequest.allHTTPHeaderFields.getter();
}

uint64_t static URLRequest._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URLRequest._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URLRequest.init(url:cachePolicy:timeoutInterval:)()
{
  return URLRequest.init(url:cachePolicy:timeoutInterval:)();
}

uint64_t URLRequest.url.getter()
{
  return URLRequest.url.getter();
}

uint64_t type metadata accessor for URLRequest()
{
  return type metadata accessor for URLRequest();
}

uint64_t type metadata accessor for JSONDecoder.DateDecodingStrategy()
{
  return type metadata accessor for JSONDecoder.DateDecodingStrategy();
}

uint64_t dispatch thunk of JSONDecoder.dateDecodingStrategy.setter()
{
  return dispatch thunk of JSONDecoder.dateDecodingStrategy.setter();
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t dispatch thunk of JSONDecoder.userInfo.modify()
{
  return dispatch thunk of JSONDecoder.userInfo.modify();
}

uint64_t JSONDecoder.init()()
{
  return JSONDecoder.init()();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t JSONEncoder.init()()
{
  return JSONEncoder.init()();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t static CharacterSet.whitespacesAndNewlines.getter()
{
  return static CharacterSet.whitespacesAndNewlines.getter();
}

uint64_t type metadata accessor for CharacterSet()
{
  return type metadata accessor for CharacterSet();
}

uint64_t URLQueryItem.init(name:value:)()
{
  return URLQueryItem.init(name:value:)();
}

uint64_t type metadata accessor for URLQueryItem()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t static CustomNSError.errorDomain.getter()
{
  return static CustomNSError.errorDomain.getter();
}

uint64_t URLComponents.queryItems.setter()
{
  return URLComponents.queryItems.setter();
}

uint64_t URLComponents.url.getter()
{
  return URLComponents.url.getter();
}

uint64_t URLComponents.path.setter()
{
  return URLComponents.path.setter();
}

uint64_t URLComponents.scheme.setter()
{
  return URLComponents.scheme.setter();
}

uint64_t URLComponents.init(string:)()
{
  return URLComponents.init(string:)();
}

uint64_t URLComponents.init()()
{
  return URLComponents.init()();
}

uint64_t type metadata accessor for URLComponents()
{
  return type metadata accessor for URLComponents();
}

uint64_t __DataStorage._bytes.getter()
{
  return __DataStorage._bytes.getter();
}

uint64_t __DataStorage._length.getter()
{
  return __DataStorage._length.getter();
}

uint64_t __DataStorage._offset.getter()
{
  return __DataStorage._offset.getter();
}

uint64_t LocalizedError.helpAnchor.getter()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t LocalizedError.failureReason.getter()
{
  return LocalizedError.failureReason.getter();
}

uint64_t LocalizedError.recoverySuggestion.getter()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t _BridgedStoredNSError.errorUserInfo.getter()
{
  return _BridgedStoredNSError.errorUserInfo.getter();
}

uint64_t _BridgedStoredNSError.init(_:userInfo:)()
{
  return _BridgedStoredNSError.init(_:userInfo:)();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t LocalizedStringResource.init(stringLiteral:)()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t type metadata accessor for LocalizedStringResource.BundleDescription()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t LocalizedStringResource.key.getter()
{
  return LocalizedStringResource.key.getter();
}

uint64_t type metadata accessor for LocalizedStringResource()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t LocalizedStringResource.init(_:table:locale:bundle:comment:)()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t _KeyValueCodingAndObservingPublishing<>.publisher<A>(for:options:)()
{
  return _KeyValueCodingAndObservingPublishing<>.publisher<A>(for:options:)();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
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

uint64_t URL.path.getter()
{
  return URL.path.getter();
}

uint64_t URL.init(string:relativeTo:)()
{
  return URL.init(string:relativeTo:)();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
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

uint64_t Data.init(bytes:count:)()
{
  return Data.init(bytes:count:)();
}

uint64_t Data.count.getter()
{
  return Data.count.getter();
}

uint64_t Data.write(to:options:)()
{
  return Data.write(to:options:)();
}

uint64_t Date.init(timeIntervalSinceReferenceDate:)()
{
  return Date.init(timeIntervalSinceReferenceDate:)();
}

uint64_t Date.timeIntervalSinceReferenceDate.getter()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return Date.timeIntervalSince(_:)();
}

uint64_t Date.addingTimeInterval(_:)()
{
  return Date.addingTimeInterval(_:)();
}

uint64_t static Date.> infix(_:_:)()
{
  return static Date.> infix(_:_:)();
}

uint64_t static Date.< infix(_:_:)()
{
  return static Date.< infix(_:_:)();
}

uint64_t static Date.+ infix(_:_:)()
{
  return static Date.+ infix(_:_:)();
}

uint64_t Date.init(timeIntervalSince1970:)()
{
  return Date.init(timeIntervalSince1970:)();
}

uint64_t Date.timeIntervalSince1970.getter()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t static Date.== infix(_:_:)()
{
  return static Date.== infix(_:_:)();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
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

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t Locale.identifier.getter()
{
  return Locale.identifier.getter();
}

uint64_t static Locale.autoupdatingCurrent.getter()
{
  return static Locale.autoupdatingCurrent.getter();
}

uint64_t Locale.Region.identifier.getter()
{
  return Locale.Region.identifier.getter();
}

uint64_t type metadata accessor for Locale.Region()
{
  return type metadata accessor for Locale.Region();
}

uint64_t Locale.region.getter()
{
  return Locale.region.getter();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t static URLError.Code.badURL.getter()
{
  return static URLError.Code.badURL.getter();
}

uint64_t type metadata accessor for URLError.Code()
{
  return type metadata accessor for URLError.Code();
}

uint64_t URLError._nsError.getter()
{
  return URLError._nsError.getter();
}

uint64_t type metadata accessor for URLError()
{
  return type metadata accessor for URLError();
}

uint64_t static PushActivityContentSource.externalRequest.getter()
{
  return static PushActivityContentSource.externalRequest.getter();
}

uint64_t Activity.ActivityStateUpdates.makeAsyncIterator()()
{
  return Activity.ActivityStateUpdates.makeAsyncIterator()();
}

uint64_t static Activity.activities.getter()
{
  return static Activity.activities.getter();
}

uint64_t Activity.attributes.getter()
{
  return Activity.attributes.getter();
}

uint64_t dispatch thunk of Activity.activityState.getter()
{
  return dispatch thunk of Activity.activityState.getter();
}

uint64_t Activity.id.getter()
{
  return Activity.id.getter();
}

uint64_t dispatch thunk of Activity.content.getter()
{
  return dispatch thunk of Activity.content.getter();
}

uint64_t static Activity.request(attributes:content:presentationOptions:platterTarget:contentSourceRequests:isEphemeral:isUnbounded:)()
{
  return static Activity.request(attributes:content:presentationOptions:platterTarget:contentSourceRequests:isEphemeral:isUnbounded:)();
}

uint64_t dispatch thunk of ActivityAuthorization.areActivitiesEnabled(forBundleId:)()
{
  return dispatch thunk of ActivityAuthorization.areActivitiesEnabled(forBundleId:)();
}

uint64_t dispatch thunk of ActivityAuthorization.areFrequentPushesEnabled(for:)()
{
  return dispatch thunk of ActivityAuthorization.areFrequentPushesEnabled(for:)();
}

uint64_t type metadata accessor for ActivityAuthorization()
{
  return type metadata accessor for ActivityAuthorization();
}

uint64_t type metadata accessor for ActivityContentSource.Request()
{
  return type metadata accessor for ActivityContentSource.Request();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ActivityAuthorizationInfo.subscribeToActivityAuthorizationStatusUpdates(for:)(Swift::String a1)
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ActivityAuthorizationInfo.unsubscribeToActivityAuthorizationStatusUpdates(for:)(Swift::String a1)
{
}

uint64_t ActivityAuthorizationInfo.activityAuthorizationStatusUpdates.getter()
{
  return ActivityAuthorizationInfo.activityAuthorizationStatusUpdates.getter();
}

uint64_t ActivityAuthorizationInfo.activityAuthorizationStatus(for:)()
{
  return ActivityAuthorizationInfo.activityAuthorizationStatus(for:)();
}

uint64_t ActivityAuthorizationInfo.ActivityAuthorizationStatusUpdates.makeAsyncIterator()()
{
  return ActivityAuthorizationInfo.ActivityAuthorizationStatusUpdates.makeAsyncIterator()();
}

uint64_t type metadata accessor for ActivityAuthorizationInfo.ActivityAuthorizationStatusUpdates.Iterator()
{
  return type metadata accessor for ActivityAuthorizationInfo.ActivityAuthorizationStatusUpdates.Iterator();
}

uint64_t type metadata accessor for ActivityAuthorizationInfo.ActivityAuthorizationStatusUpdates()
{
  return type metadata accessor for ActivityAuthorizationInfo.ActivityAuthorizationStatusUpdates();
}

uint64_t static ActivityAuthorizationInfo.ActivityAuthorizationStatus.== infix(_:_:)()
{
  return static ActivityAuthorizationInfo.ActivityAuthorizationStatus.== infix(_:_:)();
}

uint64_t type metadata accessor for ActivityAuthorizationInfo.ActivityAuthorizationStatus()
{
  return type metadata accessor for ActivityAuthorizationInfo.ActivityAuthorizationStatus();
}

uint64_t ActivityAuthorizationInfo.init()()
{
  return ActivityAuthorizationInfo.init()();
}

uint64_t type metadata accessor for ActivityAuthorizationInfo()
{
  return type metadata accessor for ActivityAuthorizationInfo();
}

uint64_t static ActivityUIDismissalPolicy.after(_:)()
{
  return static ActivityUIDismissalPolicy.after(_:)();
}

uint64_t static ActivityUIDismissalPolicy.immediate.getter()
{
  return static ActivityUIDismissalPolicy.immediate.getter();
}

uint64_t type metadata accessor for ActivityUIDismissalPolicy()
{
  return type metadata accessor for ActivityUIDismissalPolicy();
}

uint64_t type metadata accessor for ActivityAuthorizationError()
{
  return type metadata accessor for ActivityAuthorizationError();
}

uint64_t static ActivityPresentationOptions.ActivityPresentationDestination.allCases.getter()
{
  return static ActivityPresentationOptions.ActivityPresentationDestination.allCases.getter();
}

uint64_t ActivityPresentationOptions.init(destinations:)()
{
  return ActivityPresentationOptions.init(destinations:)();
}

uint64_t type metadata accessor for ActivityPresentationOptions()
{
  return type metadata accessor for ActivityPresentationOptions();
}

uint64_t type metadata accessor for ActivityState()
{
  return type metadata accessor for ActivityState();
}

uint64_t ActivityContent.relevanceScore.getter()
{
  return ActivityContent.relevanceScore.getter();
}

uint64_t ActivityContent.init(state:staleDate:relevanceScore:)()
{
  return ActivityContent.init(state:staleDate:relevanceScore:)();
}

uint64_t ActivityContent.state.getter()
{
  return ActivityContent.state.getter();
}

uint64_t static AlertConfiguration.AlertSound.named(_:)()
{
  return static AlertConfiguration.AlertSound.named(_:)();
}

uint64_t static AlertConfiguration.AlertSound.default.getter()
{
  return static AlertConfiguration.AlertSound.default.getter();
}

uint64_t type metadata accessor for AlertConfiguration.AlertSound()
{
  return type metadata accessor for AlertConfiguration.AlertSound();
}

uint64_t AlertConfiguration.body.getter()
{
  return AlertConfiguration.body.getter();
}

uint64_t AlertConfiguration.title.getter()
{
  return AlertConfiguration.title.getter();
}

uint64_t AlertConfiguration.init(title:body:sound:)()
{
  return AlertConfiguration.init(title:body:sound:)();
}

uint64_t type metadata accessor for AlertConfiguration()
{
  return type metadata accessor for AlertConfiguration();
}

uint64_t isFeatureEnabled(_:)()
{
  return isFeatureEnabled(_:)();
}

uint64_t UTType.identifier.getter()
{
  return UTType.identifier.getter();
}

uint64_t static UTType.png.getter()
{
  return static UTType.png.getter();
}

uint64_t type metadata accessor for UTType()
{
  return type metadata accessor for UTType();
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

uint64_t Publishers.Zip.init(_:_:)()
{
  return Publishers.Zip.init(_:_:)();
}

uint64_t Publishers.Zip3.init(_:_:_:)()
{
  return Publishers.Zip3.init(_:_:_:)();
}

uint64_t Publishers.Filter.filter(_:)()
{
  return Publishers.Filter.filter(_:)();
}

uint64_t Publishers.Sequence.init(sequence:)()
{
  return Publishers.Sequence.init(sequence:)();
}

uint64_t Publishers.MergeMany.init<A>(_:)()
{
  return Publishers.MergeMany.init<A>(_:)();
}

uint64_t static Subscribers.Demand.unlimited.getter()
{
  return static Subscribers.Demand.unlimited.getter();
}

uint64_t AnyCancellable.store(in:)()
{
  return AnyCancellable.store(in:)();
}

uint64_t AnyCancellable.store<A>(in:)()
{
  return AnyCancellable.store<A>(in:)();
}

uint64_t AsyncPublisher.makeAsyncIterator()()
{
  return AsyncPublisher.makeAsyncIterator()();
}

uint64_t PassthroughSubject.send(_:)()
{
  return PassthroughSubject.send(_:)();
}

uint64_t PassthroughSubject.init()()
{
  return PassthroughSubject.init()();
}

uint64_t AsyncThrowingPublisher.makeAsyncIterator()()
{
  return AsyncThrowingPublisher.makeAsyncIterator()();
}

uint64_t Fail.init(error:)()
{
  return Fail.init(error:)();
}

uint64_t Just.setFailureType<A>(to:)()
{
  return Just.setFailureType<A>(to:)();
}

uint64_t Just.init(_:)()
{
  return Just.init(_:)();
}

uint64_t Future.init(_:)()
{
  return Future.init(_:)();
}

uint64_t Deferred.init(createPublisher:)()
{
  return Deferred.init(createPublisher:)();
}

uint64_t Publisher.eraseToAnyPublisher()()
{
  return Publisher.eraseToAnyPublisher()();
}

uint64_t Publisher.handleEvents(receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:)()
{
  return Publisher.handleEvents(receiveSubscription:receiveOutput:receiveCompletion:receiveCancel:receiveRequest:)();
}

uint64_t Publisher.replaceError(with:)()
{
  return Publisher.replaceError(with:)();
}

uint64_t Publisher.map<A>(_:)()
{
  return Publisher.map<A>(_:)();
}

{
  return Publisher.map<A>(_:)();
}

uint64_t Publisher.sink(receiveCompletion:receiveValue:)()
{
  return Publisher.sink(receiveCompletion:receiveValue:)();
}

uint64_t Publisher.catch<A>(_:)()
{
  return Publisher.catch<A>(_:)();
}

uint64_t Publisher.first()()
{
  return Publisher.first()();
}

uint64_t Publisher.share()()
{
  return Publisher.share()();
}

uint64_t Publisher.decode<A, B>(type:decoder:)()
{
  return Publisher.decode<A, B>(type:decoder:)();
}

uint64_t Publisher.filter(_:)()
{
  return Publisher.filter(_:)();
}

uint64_t Publisher.tryMap<A>(_:)()
{
  return Publisher.tryMap<A>(_:)();
}

uint64_t Publisher.values.getter()
{
  return Publisher.values.getter();
}

uint64_t Publisher.collect()()
{
  return Publisher.collect()();
}

uint64_t Publisher.flatMap<A>(maxPublishers:_:)()
{
  return Publisher.flatMap<A>(maxPublishers:_:)();
}

uint64_t Publisher.flatMap<A, B>(maxPublishers:_:)()
{
  return Publisher.flatMap<A, B>(maxPublishers:_:)();
}

uint64_t Publisher.receive<A>(on:options:)()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t Publisher.mapError<A>(_:)()
{
  return Publisher.mapError<A>(_:)();
}

uint64_t Publisher.subscribe<A>(on:options:)()
{
  return Publisher.subscribe<A>(on:options:)();
}

uint64_t Publisher.tryFilter(_:)()
{
  return Publisher.tryFilter(_:)();
}

uint64_t Publisher<>.setFailureType<A>(to:)()
{
  return Publisher<>.setFailureType<A>(to:)();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t Publisher<>.values.getter()
{
  return Publisher<>.values.getter();
}

uint64_t Publisher<>.flatMap<A>(maxPublishers:_:)()
{
  return Publisher<>.flatMap<A>(maxPublishers:_:)();
}

{
  return Publisher<>.flatMap<A>(maxPublishers:_:)();
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

uint64_t MetricsData.init(topic:shouldFlush:fields:includingFields:excludingFields:)()
{
  return MetricsData.init(topic:shouldFlush:fields:includingFields:excludingFields:)();
}

uint64_t type metadata accessor for MetricsData()
{
  return type metadata accessor for MetricsData();
}

uint64_t MetricsPipeline.Configuration.withRecorder(_:)()
{
  return MetricsPipeline.Configuration.withRecorder(_:)();
}

uint64_t MetricsPipeline.Configuration.withAggregator(_:)()
{
  return MetricsPipeline.Configuration.withAggregator(_:)();
}

uint64_t MetricsPipeline.Configuration.init(bag:linter:anonymousTopics:)()
{
  return MetricsPipeline.Configuration.init(bag:linter:anonymousTopics:)();
}

uint64_t type metadata accessor for MetricsPipeline.Configuration()
{
  return type metadata accessor for MetricsPipeline.Configuration();
}

uint64_t MetricsPipeline.init(from:)()
{
  return MetricsPipeline.init(from:)();
}

uint64_t MetricsPipeline.process(_:using:)()
{
  return MetricsPipeline.process(_:using:)();
}

uint64_t type metadata accessor for MetricsPipeline()
{
  return type metadata accessor for MetricsPipeline();
}

uint64_t SyncTaskScheduler.init()()
{
  return SyncTaskScheduler.init()();
}

uint64_t type metadata accessor for SyncTaskScheduler()
{
  return type metadata accessor for SyncTaskScheduler();
}

uint64_t LintedMetricsEvent.fields.getter()
{
  return LintedMetricsEvent.fields.getter();
}

uint64_t MetricsEventRecorder._recordAsync(_:on:)()
{
  return MetricsEventRecorder._recordAsync(_:on:)();
}

uint64_t MetricsFieldsContext.addingValue<A>(_:forProperty:)()
{
  return MetricsFieldsContext.addingValue<A>(_:forProperty:)();
}

uint64_t static MetricsFieldsContext.Property<A>.topic.getter()
{
  return static MetricsFieldsContext.Property<A>.topic.getter();
}

uint64_t MetricsFieldsContext.init()()
{
  return MetricsFieldsContext.init()();
}

uint64_t type metadata accessor for MetricsFieldsContext()
{
  return type metadata accessor for MetricsFieldsContext();
}

uint64_t AMSMetricsEventRecorder.__allocating_init(bag:defaultTopic:anonymousTopics:)()
{
  return AMSMetricsEventRecorder.__allocating_init(bag:defaultTopic:anonymousTopics:)();
}

uint64_t AMSMetricsEventRecorder.flush()()
{
  return AMSMetricsEventRecorder.flush()();
}

uint64_t type metadata accessor for AMSMetricsEventRecorder()
{
  return type metadata accessor for AMSMetricsEventRecorder();
}

uint64_t MetricsFieldsAggregator.addingOptOutProvider(_:forRequest:)()
{
  return MetricsFieldsAggregator.addingOptOutProvider(_:forRequest:)();
}

uint64_t MetricsFieldsAggregator.init()()
{
  return MetricsFieldsAggregator.init()();
}

uint64_t type metadata accessor for MetricsFieldsAggregator()
{
  return type metadata accessor for MetricsFieldsAggregator();
}

uint64_t LowMemoryMetricsEventLinter.__allocating_init(defaultTopic:bag:rules:)()
{
  return LowMemoryMetricsEventLinter.__allocating_init(defaultTopic:bag:rules:)();
}

uint64_t static MetricsFieldExclusionRequest.amsMetricsID.getter()
{
  return static MetricsFieldExclusionRequest.amsMetricsID.getter();
}

uint64_t static MetricsFieldExclusionRequest.clientBuildType.getter()
{
  return static MetricsFieldExclusionRequest.clientBuildType.getter();
}

uint64_t type metadata accessor for MetricsFieldExclusionRequest()
{
  return type metadata accessor for MetricsFieldExclusionRequest();
}

uint64_t AMSMetricsIdentifierFieldsProvider.init(accountProvider:process:bag:shouldMigrate:resetInterval:keys:activeITunesAccountRequired:)()
{
  return AMSMetricsIdentifierFieldsProvider.init(accountProvider:process:bag:shouldMigrate:resetInterval:keys:activeITunesAccountRequired:)();
}

uint64_t static AMSMetricsIdentifierFieldsProvider.metricsResetInterval.getter()
{
  return static AMSMetricsIdentifierFieldsProvider.metricsResetInterval.getter();
}

uint64_t type metadata accessor for AMSMetricsIdentifierFieldsProvider()
{
  return type metadata accessor for AMSMetricsIdentifierFieldsProvider();
}

uint64_t Bag.amsBag.getter()
{
  return Bag.amsBag.getter();
}

uint64_t Bag.init(from:)()
{
  return Bag.init(from:)();
}

uint64_t Bag.Profile.name.getter()
{
  return Bag.Profile.name.getter();
}

uint64_t type metadata accessor for Bag.Profile()
{
  return type metadata accessor for Bag.Profile();
}

uint64_t Bag.profile.getter()
{
  return Bag.profile.getter();
}

uint64_t type metadata accessor for Bag()
{
  return type metadata accessor for Bag();
}

uint64_t type metadata accessor for Account()
{
  return type metadata accessor for Account();
}

uint64_t Promise.map<A>(on:_:)()
{
  return Promise.map<A>(on:_:)();
}

uint64_t Promise.then(perform:orCatchError:on:)()
{
  return Promise.then(perform:orCatchError:on:)();
}

uint64_t Promise<A>.init(_:)()
{
  return Promise<A>.init(_:)();
}

uint64_t DefaultSportsJSONInitFailureObserver.init()()
{
  return DefaultSportsJSONInitFailureObserver.init()();
}

uint64_t type metadata accessor for DefaultSportsJSONInitFailureObserver()
{
  return type metadata accessor for DefaultSportsJSONInitFailureObserver();
}

uint64_t static SportsJSONContext.Property<A>.initFailureObserver.getter()
{
  return static SportsJSONContext.Property<A>.initFailureObserver.getter();
}

uint64_t SportsActivityPlay.init(isLeftBarVisible:isRightBarVisible:isPlay:text:)()
{
  return SportsActivityPlay.init(isLeftBarVisible:isRightBarVisible:isPlay:text:)();
}

uint64_t static SportsActivityPlay.empty.getter()
{
  return static SportsActivityPlay.empty.getter();
}

uint64_t type metadata accessor for SportsActivityPlay()
{
  return type metadata accessor for SportsActivityPlay();
}

uint64_t type metadata accessor for SportsActivityClock()
{
  return type metadata accessor for SportsActivityClock();
}

uint64_t SportsActivityContender.init(canonicalId:scoreEntries:isWinnerIndicatorVisible:)()
{
  return SportsActivityContender.init(canonicalId:scoreEntries:isWinnerIndicatorVisible:)();
}

uint64_t SportsActivityContender.scoreEntries.getter()
{
  return SportsActivityContender.scoreEntries.getter();
}

uint64_t type metadata accessor for SportsActivityContender()
{
  return type metadata accessor for SportsActivityContender();
}

uint64_t static SportsSubscriptionState.activeSubscriptionEventId.getter()
{
  return static SportsSubscriptionState.activeSubscriptionEventId.getter();
}

uint64_t static SportsSubscriptionState.activeSubscriptionEventId.setter()
{
  return static SportsSubscriptionState.activeSubscriptionEventId.setter();
}

uint64_t type metadata accessor for SportsSubscriptionState()
{
  return type metadata accessor for SportsSubscriptionState();
}

uint64_t SportsActivityAttributes.shortTitle.getter()
{
  return SportsActivityAttributes.shortTitle.getter();
}

uint64_t SportsActivityAttributes.init(canonicalId:sport:leagueId:leagueName:contenders:eventInfo:clockIsCountingDown:eventURL:preGameTitle:shortTitle:createdDate:bundleId:languageTag:)()
{
  return SportsActivityAttributes.init(canonicalId:sport:leagueId:leagueName:contenders:eventInfo:clockIsCountingDown:eventURL:preGameTitle:shortTitle:createdDate:bundleId:languageTag:)();
}

uint64_t SportsActivityAttributes.canonicalId.getter()
{
  return SportsActivityAttributes.canonicalId.getter();
}

uint64_t SportsActivityAttributes.createdDate.getter()
{
  return SportsActivityAttributes.createdDate.getter();
}

uint64_t SportsActivityAttributes.preGameTitle.getter()
{
  return SportsActivityAttributes.preGameTitle.getter();
}

uint64_t static SportsActivityAttributes.filteredPlayLevel.getter()
{
  return static SportsActivityAttributes.filteredPlayLevel.getter();
}

uint64_t SportsActivityAttributes.bundleId.getter()
{
  return SportsActivityAttributes.bundleId.getter();
}

uint64_t SportsActivityAttributes.Contender.init(canonicalId:colorHex:abbreviation:name:localLogoURL:logoFilePaths:isHome:ordinal:)()
{
  return SportsActivityAttributes.Contender.init(canonicalId:colorHex:abbreviation:name:localLogoURL:logoFilePaths:isHome:ordinal:)();
}

uint64_t SportsActivityAttributes.Contender.canonicalId.getter()
{
  return SportsActivityAttributes.Contender.canonicalId.getter();
}

uint64_t SportsActivityAttributes.Contender.LogoFilePaths.init(smallSize:defaultSize:)()
{
  return SportsActivityAttributes.Contender.LogoFilePaths.init(smallSize:defaultSize:)();
}

uint64_t type metadata accessor for SportsActivityAttributes.Contender.LogoFilePaths()
{
  return type metadata accessor for SportsActivityAttributes.Contender.LogoFilePaths();
}

uint64_t type metadata accessor for SportsActivityAttributes.Contender()
{
  return type metadata accessor for SportsActivityAttributes.Contender();
}

uint64_t SportsActivityAttributes.EventInfo.startDate.getter()
{
  return SportsActivityAttributes.EventInfo.startDate.getter();
}

uint64_t SportsActivityAttributes.EventInfo.init(startDate:)()
{
  return SportsActivityAttributes.EventInfo.init(startDate:)();
}

uint64_t type metadata accessor for SportsActivityAttributes.EventInfo()
{
  return type metadata accessor for SportsActivityAttributes.EventInfo();
}

uint64_t SportsActivityAttributes.eventInfo.getter()
{
  return SportsActivityAttributes.eventInfo.getter();
}

uint64_t type metadata accessor for SportsActivityAttributes()
{
  return type metadata accessor for SportsActivityAttributes();
}

uint64_t SportsActivitySoccerClock.init(runningClockDataSource:penaltyShootoutsViewModel:)()
{
  return SportsActivitySoccerClock.init(runningClockDataSource:penaltyShootoutsViewModel:)();
}

uint64_t SportsScheduledActivities.scheduledActivities.getter()
{
  return SportsScheduledActivities.scheduledActivities.getter();
}

uint64_t type metadata accessor for SportsScheduledActivities()
{
  return type metadata accessor for SportsScheduledActivities();
}

uint64_t type metadata accessor for SportsActivityContentState.EventInfoState()
{
  return type metadata accessor for SportsActivityContentState.EventInfoState();
}

uint64_t SportsActivityContentState.isWaitingForUserConsent.getter()
{
  return SportsActivityContentState.isWaitingForUserConsent.getter();
}

uint64_t SportsActivityContentState.init(clock:play:eventInfoState:isClockVisible:isEventInfoVisible:isScoreVisible:contenderA:contenderB:shouldDisplayPlayByPlay:shouldShowWatchAlertUI:subscriptionContainerURL:isWaitingForUserConsent:)()
{
  return SportsActivityContentState.init(clock:play:eventInfoState:isClockVisible:isEventInfoVisible:isScoreVisible:contenderA:contenderB:shouldDisplayPlayByPlay:shouldShowWatchAlertUI:subscriptionContainerURL:isWaitingForUserConsent:)();
}

uint64_t type metadata accessor for SportsActivityContentState()
{
  return type metadata accessor for SportsActivityContentState();
}

uint64_t SportsActivityGenericClock.init(runningClockDataSource:)()
{
  return SportsActivityGenericClock.init(runningClockDataSource:)();
}

uint64_t SportsActivityBaseballClock.init(basesActiveStates:outsActiveStates:ballsAndStrikes:isActiveBaseVisible:runningClockDataSource:)()
{
  return SportsActivityBaseballClock.init(basesActiveStates:outsActiveStates:ballsAndStrikes:isActiveBaseVisible:runningClockDataSource:)();
}

uint64_t type metadata accessor for SportsActivityBaseballClock()
{
  return type metadata accessor for SportsActivityBaseballClock();
}

uint64_t static SportsManager.RefreshOptions.subscription.getter()
{
  return static SportsManager.RefreshOptions.subscription.getter();
}

uint64_t static SportsManager.RefreshOptions.subscriptionIfUnknown.getter()
{
  return static SportsManager.RefreshOptions.subscriptionIfUnknown.getter();
}

uint64_t static SportsManager.RefreshOptions.all.getter()
{
  return static SportsManager.RefreshOptions.all.getter();
}

uint64_t static SportsManager.RefreshOptions.plays.getter()
{
  return static SportsManager.RefreshOptions.plays.getter();
}

uint64_t SportsManager.RefreshOptions.init(rawValue:)()
{
  return SportsManager.RefreshOptions.init(rawValue:)();
}

uint64_t type metadata accessor for SportsManager.RefreshOptions()
{
  return type metadata accessor for SportsManager.RefreshOptions();
}

uint64_t dispatch thunk of SportsManager.autostartLiveActivityStatus(forId:)()
{
  return dispatch thunk of SportsManager.autostartLiveActivityStatus(forId:)();
}

uint64_t static SportsManager.shared.getter()
{
  return static SportsManager.shared.getter();
}

uint64_t type metadata accessor for SportsManager()
{
  return type metadata accessor for SportsManager();
}

uint64_t SportsLogoSize.rawValue.getter()
{
  return SportsLogoSize.rawValue.getter();
}

uint64_t type metadata accessor for SportsLogoSize()
{
  return type metadata accessor for SportsLogoSize();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> PlaysStore.refreshAllPlays(for:with:)(Swift::String a1, Swift::OpaquePointer with)
{
}

uint64_t dispatch thunk of PlaysStore.removePlays(forCanonicalId:)()
{
  return dispatch thunk of PlaysStore.removePlays(forCanonicalId:)();
}

uint64_t dispatch thunk of PlaysStore.write(plays:forCanonicalId:)()
{
  return dispatch thunk of PlaysStore.write(plays:forCanonicalId:)();
}

uint64_t dispatch thunk of PlaysStore.append(play:forCanonicalId:)()
{
  return dispatch thunk of PlaysStore.append(play:forCanonicalId:)();
}

uint64_t PlaysStore.init(storeUrl:)()
{
  return PlaysStore.init(storeUrl:)();
}

uint64_t type metadata accessor for PlaysStore()
{
  return type metadata accessor for PlaysStore();
}

uint64_t SportingEvent.partialSportingEvent.getter()
{
  return SportingEvent.partialSportingEvent.getter();
}

uint64_t SportingEvent.canonicalId.getter()
{
  return SportingEvent.canonicalId.getter();
}

uint64_t dispatch thunk of SportingEvent.competitors.getter()
{
  return dispatch thunk of SportingEvent.competitors.getter();
}

uint64_t dispatch thunk of SportingEvent.alertUpdates.getter()
{
  return dispatch thunk of SportingEvent.alertUpdates.getter();
}

uint64_t dispatch thunk of SportingEvent.versionNumber.getter()
{
  return dispatch thunk of SportingEvent.versionNumber.getter();
}

uint64_t SportingEvent.progressStatus.getter()
{
  return SportingEvent.progressStatus.getter();
}

uint64_t dispatch thunk of SportingEvent.localizedShortName.getter()
{
  return dispatch thunk of SportingEvent.localizedShortName.getter();
}

uint64_t SportingEvent.clock.getter()
{
  return SportingEvent.clock.getter();
}

uint64_t dispatch thunk of SportingEvent.plays.getter()
{
  return dispatch thunk of SportingEvent.plays.getter();
}

uint64_t dispatch thunk of SportingEvent.league.getter()
{
  return dispatch thunk of SportingEvent.league.getter();
}

uint64_t SportingEvent.version.getter()
{
  return SportingEvent.version.getter();
}

uint64_t dispatch thunk of SportingEvent.coverage.getter()
{
  return dispatch thunk of SportingEvent.coverage.getter();
}

uint64_t dispatch thunk of SportingEvent.schedule.getter()
{
  return dispatch thunk of SportingEvent.schedule.getter();
}

uint64_t IngestionError.rawValue.getter()
{
  return IngestionError.rawValue.getter();
}

uint64_t type metadata accessor for IngestionError()
{
  return type metadata accessor for IngestionError();
}

uint64_t dispatch thunk of PersistentStore.persistSuppressionTally(_:)()
{
  return dispatch thunk of PersistentStore.persistSuppressionTally(_:)();
}

uint64_t dispatch thunk of PersistentStore.retrieveSuppressionTally()()
{
  return dispatch thunk of PersistentStore.retrieveSuppressionTally()();
}

uint64_t PersistentStore.__allocating_init()()
{
  return PersistentStore.__allocating_init()();
}

uint64_t type metadata accessor for PersistentStore()
{
  return type metadata accessor for PersistentStore();
}

uint64_t DatedSubscribers.init(subscriberCount:lastSubscription:)()
{
  return DatedSubscribers.init(subscriberCount:lastSubscription:)();
}

uint64_t DatedSubscribers.subscriberCount.getter()
{
  return DatedSubscribers.subscriberCount.getter();
}

uint64_t static DatedSubscribers.+ infix(_:_:)()
{
  return static DatedSubscribers.+ infix(_:_:)();
}

uint64_t static DatedSubscribers.- infix(_:_:)()
{
  return static DatedSubscribers.- infix(_:_:)();
}

uint64_t type metadata accessor for DatedSubscribers()
{
  return type metadata accessor for DatedSubscribers();
}

uint64_t static TemplateImageUrl.templateThumbUrl(host:token:)()
{
  return static TemplateImageUrl.templateThumbUrl(host:token:)();
}

uint64_t static TemplateImageUrl.imageUrl(templateUrl:width:height:format:)()
{
  return static TemplateImageUrl.imageUrl(templateUrl:width:height:format:)();
}

uint64_t type metadata accessor for TemplateImageUrl.ImageFormat()
{
  return type metadata accessor for TemplateImageUrl.ImageFormat();
}

uint64_t static CloudChannelError.errorDomain.getter()
{
  return static CloudChannelError.errorDomain.getter();
}

uint64_t CloudChannelError.errorUserInfo.getter()
{
  return CloudChannelError.errorUserInfo.getter();
}

uint64_t CloudChannelError.errorCode.getter()
{
  return CloudChannelError.errorCode.getter();
}

uint64_t type metadata accessor for CloudChannelError()
{
  return type metadata accessor for CloudChannelError();
}

uint64_t type metadata accessor for SportingEventPlay.BaseballPlay()
{
  return type metadata accessor for SportingEventPlay.BaseballPlay();
}

uint64_t SportingEventPlay.baseballPlay.getter()
{
  return SportingEventPlay.baseballPlay.getter();
}

uint64_t dispatch thunk of SportingEventPlay.annotations.getter()
{
  return dispatch thunk of SportingEventPlay.annotations.getter();
}

uint64_t dispatch thunk of SportingEventPlay.competitors.getter()
{
  return dispatch thunk of SportingEventPlay.competitors.getter();
}

uint64_t SportingEventPlay.playDescription.getter()
{
  return SportingEventPlay.playDescription.getter();
}

uint64_t dispatch thunk of SportingEventPlay.id.getter()
{
  return dispatch thunk of SportingEventPlay.id.getter();
}

uint64_t dispatch thunk of SportingEventPlay.clock.getter()
{
  return dispatch thunk of SportingEventPlay.clock.getter();
}

uint64_t dispatch thunk of SportingEventPlay.stamp.getter()
{
  return dispatch thunk of SportingEventPlay.stamp.getter();
}

uint64_t dispatch thunk of SportingEventPlay.levels.getter()
{
  return dispatch thunk of SportingEventPlay.levels.getter();
}

uint64_t static ContainerConstants.defaultSuiteName.getter()
{
  return static ContainerConstants.defaultSuiteName.getter();
}

uint64_t static ContainerConstants.tempoUrlUserDefaultKey.getter()
{
  return static ContainerConstants.tempoUrlUserDefaultKey.getter();
}

uint64_t static ContainerConstants.liveActivitiesTargetAppKey.getter()
{
  return static ContainerConstants.liveActivitiesTargetAppKey.getter();
}

uint64_t type metadata accessor for ContainerConstants()
{
  return type metadata accessor for ContainerConstants();
}

uint64_t dispatch thunk of PersistentStorable.pathForLogo(_:size:fileExtension:)()
{
  return dispatch thunk of PersistentStorable.pathForLogo(_:size:fileExtension:)();
}

uint64_t dispatch thunk of PersistentStorable.writeActivity(activityId:)()
{
  return dispatch thunk of PersistentStorable.writeActivity(activityId:)();
}

uint64_t dispatch thunk of PersistentStorable.removeActivity(activityId:)()
{
  return dispatch thunk of PersistentStorable.removeActivity(activityId:)();
}

uint64_t dispatch thunk of PersistentStorable.writeAPSMessage(_:canonicalId:isConventionalOrUnified:)()
{
  return dispatch thunk of PersistentStorable.writeAPSMessage(_:canonicalId:isConventionalOrUnified:)();
}

uint64_t dispatch thunk of PersistentStorable.cleanUpFileSystem(olderThan:)()
{
  return dispatch thunk of PersistentStorable.cleanUpFileSystem(olderThan:)();
}

uint64_t dispatch thunk of PersistentStorable.replaceActivities(activeIds:dismissedIds:)()
{
  return dispatch thunk of PersistentStorable.replaceActivities(activeIds:dismissedIds:)();
}

uint64_t dispatch thunk of PersistentStorable.scheduleLiveActivity(_:forId:)()
{
  return dispatch thunk of PersistentStorable.scheduleLiveActivity(_:forId:)();
}

uint64_t dispatch thunk of PersistentStorable.subscriptionsStoreURL(isConventionalOrUnified:)()
{
  return dispatch thunk of PersistentStorable.subscriptionsStoreURL(isConventionalOrUnified:)();
}

uint64_t dispatch thunk of PersistentStorable.writeEventSubscription(_:isConventionalOrUnified:)()
{
  return dispatch thunk of PersistentStorable.writeEventSubscription(_:isConventionalOrUnified:)();
}

uint64_t dispatch thunk of PersistentStorable.initializeStoreIfNeeded()()
{
  return dispatch thunk of PersistentStorable.initializeStoreIfNeeded()();
}

uint64_t dispatch thunk of PersistentStorable.scheduledLiveActivities.getter()
{
  return dispatch thunk of PersistentStorable.scheduledLiveActivities.getter();
}

uint64_t dispatch thunk of PersistentStorable.retrieveEventSubscription(canonicalId:isConventionalOrUnified:)()
{
  return dispatch thunk of PersistentStorable.retrieveEventSubscription(canonicalId:isConventionalOrUnified:)();
}

uint64_t dispatch thunk of PersistentStorable.deleteSportingEventSubscription(canonicalId:isConventionalOrUnified:)()
{
  return dispatch thunk of PersistentStorable.deleteSportingEventSubscription(canonicalId:isConventionalOrUnified:)();
}

uint64_t dispatch thunk of PersistentStorable.allEventSubscriptionsToConsumers(isConventionalOrUnified:)()
{
  return dispatch thunk of PersistentStorable.allEventSubscriptionsToConsumers(isConventionalOrUnified:)();
}

uint64_t SportingEventAlert.body.getter()
{
  return SportingEventAlert.body.getter();
}

uint64_t SportingEventAlert.sound.getter()
{
  return SportingEventAlert.sound.getter();
}

uint64_t SportingEventAlert.title.getter()
{
  return SportingEventAlert.title.getter();
}

uint64_t dispatch thunk of SportingEventClock.additional.getter()
{
  return dispatch thunk of SportingEventClock.additional.getter();
}

uint64_t dispatch thunk of SportingEventClock.milliseconds.getter()
{
  return dispatch thunk of SportingEventClock.milliseconds.getter();
}

uint64_t dispatch thunk of SportingEventClock.runningState.getter()
{
  return dispatch thunk of SportingEventClock.runningState.getter();
}

uint64_t dispatch thunk of SportingEventClock.activityStatus.getter()
{
  return dispatch thunk of SportingEventClock.activityStatus.getter();
}

uint64_t dispatch thunk of SportingEventClock.isCountingDown.getter()
{
  return dispatch thunk of SportingEventClock.isCountingDown.getter();
}

uint64_t SportingEventClock.period.getter()
{
  return SportingEventClock.period.getter();
}

uint64_t dispatch thunk of SportingEventClock.minutes.getter()
{
  return dispatch thunk of SportingEventClock.minutes.getter();
}

uint64_t dispatch thunk of SportingEventClock.seconds.getter()
{
  return dispatch thunk of SportingEventClock.seconds.getter();
}

uint64_t SportingEventImage.type.getter()
{
  return SportingEventImage.type.getter();
}

uint64_t SportingEventImage.token.getter()
{
  return SportingEventImage.token.getter();
}

uint64_t SportingEventSport.canonicalId.getter()
{
  return SportingEventSport.canonicalId.getter();
}

uint64_t SportingEventLeague.canonicalId.getter()
{
  return SportingEventLeague.canonicalId.getter();
}

uint64_t SportingEventLeague.localizedDisplayName.getter()
{
  return SportingEventLeague.localizedDisplayName.getter();
}

uint64_t SportingEventLeague.sport.getter()
{
  return SportingEventLeague.sport.getter();
}

uint64_t type metadata accessor for PersistentStoreError()
{
  return type metadata accessor for PersistentStoreError();
}

uint64_t static SportingEventFactory.eventWithProgressStatus(event:progressStatus:)()
{
  return static SportingEventFactory.eventWithProgressStatus(event:progressStatus:)();
}

uint64_t static SportingEventFactory.unknown(canonicalId:)()
{
  return static SportingEventFactory.unknown(canonicalId:)();
}

uint64_t type metadata accessor for SportingEventFactory()
{
  return type metadata accessor for SportingEventFactory();
}

uint64_t dispatch thunk of SportingEventCoverage.ingestion.getter()
{
  return dispatch thunk of SportingEventCoverage.ingestion.getter();
}

uint64_t SportingEventDuration.start.getter()
{
  return SportingEventDuration.start.getter();
}

uint64_t SportingEventMetadata.metadataType.getter()
{
  return SportingEventMetadata.metadataType.getter();
}

uint64_t SportingEventMetadata.value.getter()
{
  return SportingEventMetadata.value.getter();
}

uint64_t SportingEventSchedule.duration.getter()
{
  return SportingEventSchedule.duration.getter();
}

uint64_t BaseballClockFormatter.FormattedComponents.pitchCount.getter()
{
  return BaseballClockFormatter.FormattedComponents.pitchCount.getter();
}

uint64_t BaseballClockFormatter.FormattedComponents.activeBases.getter()
{
  return BaseballClockFormatter.FormattedComponents.activeBases.getter();
}

uint64_t BaseballClockFormatter.FormattedComponents.outs.getter()
{
  return BaseballClockFormatter.FormattedComponents.outs.getter();
}

uint64_t type metadata accessor for BaseballClockFormatter.FormattedComponents()
{
  return type metadata accessor for BaseballClockFormatter.FormattedComponents();
}

uint64_t static BaseballClockFormatter.formattedComponents(subscription:)()
{
  return static BaseballClockFormatter.formattedComponents(subscription:)();
}

uint64_t type metadata accessor for BaseballClockFormatter()
{
  return type metadata accessor for BaseballClockFormatter();
}

uint64_t SportingEventAlertText.key.getter()
{
  return SportingEventAlertText.key.getter();
}

uint64_t SportingEventAlertText.arguments.getter()
{
  return SportingEventAlertText.arguments.getter();
}

uint64_t dispatch thunk of SportingEventClockTime.minutes.getter()
{
  return dispatch thunk of SportingEventClockTime.minutes.getter();
}

uint64_t dispatch thunk of SportingEventClockTime.clockType.getter()
{
  return dispatch thunk of SportingEventClockTime.clockType.getter();
}

uint64_t type metadata accessor for SportingEventPlayLevel()
{
  return type metadata accessor for SportingEventPlayLevel();
}

uint64_t type metadata accessor for CloudChannelPreferences.AuditStrategy()
{
  return type metadata accessor for CloudChannelPreferences.AuditStrategy();
}

uint64_t static CloudChannelPreferences.subscriptionAuditStrategy.getter()
{
  return static CloudChannelPreferences.subscriptionAuditStrategy.getter();
}

uint64_t SportingEventCompetitor.canonicalId.getter()
{
  return SportingEventCompetitor.canonicalId.getter();
}

uint64_t dispatch thunk of SportingEventCompetitor.abbreviation.getter()
{
  return dispatch thunk of SportingEventCompetitor.abbreviation.getter();
}

uint64_t dispatch thunk of SportingEventCompetitor.getStatistic(name:)()
{
  return dispatch thunk of SportingEventCompetitor.getStatistic(name:)();
}

Swift::OpaquePointer_optional __swiftcall SportingEventCompetitor.contextualShootouts()()
{
  uint64_t v0 = (void *)SportingEventCompetitor.contextualShootouts()();
  result.value._rawValue = v0;
  result.is_nil = v1;
  return result;
}

uint64_t dispatch thunk of SportingEventCompetitor.localizedDisplayName.getter()
{
  return dispatch thunk of SportingEventCompetitor.localizedDisplayName.getter();
}

uint64_t dispatch thunk of SportingEventCompetitor.images.getter()
{
  return dispatch thunk of SportingEventCompetitor.images.getter();
}

uint64_t dispatch thunk of SportingEventCompetitor.members.getter()
{
  return dispatch thunk of SportingEventCompetitor.members.getter();
}

uint64_t dispatch thunk of SportingEventCompetitor.metadata.getter()
{
  return dispatch thunk of SportingEventCompetitor.metadata.getter();
}

uint64_t dispatch thunk of SportingEventCompetitor.qualifier.getter()
{
  return dispatch thunk of SportingEventCompetitor.qualifier.getter();
}

uint64_t CloudChannelSubscription.CacheValue.expiration.getter()
{
  return CloudChannelSubscription.CacheValue.expiration.getter();
}

uint64_t type metadata accessor for CloudChannelSubscription.CacheValue()
{
  return type metadata accessor for CloudChannelSubscription.CacheValue();
}

uint64_t CloudChannelSubscription.Demand.init(key:value:)()
{
  return CloudChannelSubscription.Demand.init(key:value:)();
}

uint64_t type metadata accessor for CloudChannelSubscription.Demand()
{
  return type metadata accessor for CloudChannelSubscription.Demand();
}

uint64_t SportingEventAlertUpdate.alert.getter()
{
  return SportingEventAlertUpdate.alert.getter();
}

uint64_t SportingEventAlertUpdate.version.getter()
{
  return SportingEventAlertUpdate.version.getter();
}

uint64_t dispatch thunk of SportingEventClockPeriod.subPeriod.getter()
{
  return dispatch thunk of SportingEventClockPeriod.subPeriod.getter();
}

uint64_t dispatch thunk of SportingEventClockPeriod.subdivision.getter()
{
  return dispatch thunk of SportingEventClockPeriod.subdivision.getter();
}

uint64_t dispatch thunk of SportingEventClockPeriod.type.getter()
{
  return dispatch thunk of SportingEventClockPeriod.type.getter();
}

uint64_t dispatch thunk of SportingEventClockPeriod.index.getter()
{
  return dispatch thunk of SportingEventClockPeriod.index.getter();
}

uint64_t dispatch thunk of SportingEventParticipant.displayName.getter()
{
  return dispatch thunk of SportingEventParticipant.displayName.getter();
}

uint64_t dispatch thunk of SportingEventParticipant.images.getter()
{
  return dispatch thunk of SportingEventParticipant.images.getter();
}

uint64_t SportingEventViewContext.statistics.getter()
{
  return SportingEventViewContext.statistics.getter();
}

uint64_t SportingEventViewContext.LocalizedTitles.preGame.getter()
{
  return SportingEventViewContext.LocalizedTitles.preGame.getter();
}

uint64_t type metadata accessor for SportingEventViewContext.LocalizedTitles()
{
  return type metadata accessor for SportingEventViewContext.LocalizedTitles();
}

uint64_t SportingEventViewContext.mode.getter()
{
  return SportingEventViewContext.mode.getter();
}

uint64_t SportingEventViewContext.titles.getter()
{
  return SportingEventViewContext.titles.getter();
}

uint64_t SportingEventViewContext.players.getter()
{
  return SportingEventViewContext.players.getter();
}

uint64_t type metadata accessor for SportingEventViewContext()
{
  return type metadata accessor for SportingEventViewContext();
}

uint64_t PenaltyShootoutsViewModel.init(contextualShootouts:)()
{
  return PenaltyShootoutsViewModel.init(contextualShootouts:)();
}

uint64_t type metadata accessor for PenaltyShootoutsViewModel()
{
  return type metadata accessor for PenaltyShootoutsViewModel();
}

uint64_t dispatch thunk of SportingEventCurrentClock.total.getter()
{
  return dispatch thunk of SportingEventCurrentClock.total.getter();
}

uint64_t SportingEventCurrentClock.current.getter()
{
  return SportingEventCurrentClock.current.getter();
}

uint64_t dispatch thunk of SportingEventCurrentClock.periods.getter()
{
  return dispatch thunk of SportingEventCurrentClock.periods.getter();
}

uint64_t type metadata accessor for SportingEventMetadataType()
{
  return type metadata accessor for SportingEventMetadataType();
}

uint64_t SportingEventSubscription.shouldDisplayPlayByPlay.getter()
{
  return SportingEventSubscription.shouldDisplayPlayByPlay.getter();
}

uint64_t SportingEventSubscription.sportingEventDetails.getter()
{
  return SportingEventSubscription.sportingEventDetails.getter();
}

uint64_t SportingEventSubscription.Competitor.init(canonicalId:abbreviation:name:teamLogoUrl:localLogoUrl:logoFilePaths:teamColorHex:isHome:ordinal:)()
{
  return SportingEventSubscription.Competitor.init(canonicalId:abbreviation:name:teamLogoUrl:localLogoUrl:logoFilePaths:teamColorHex:isHome:ordinal:)();
}

uint64_t SportingEventSubscription.Competitor.canonicalId.getter()
{
  return SportingEventSubscription.Competitor.canonicalId.getter();
}

uint64_t SportingEventSubscription.Competitor.abbreviation.getter()
{
  return SportingEventSubscription.Competitor.abbreviation.getter();
}

uint64_t SportingEventSubscription.Competitor.localLogoUrl.getter()
{
  return SportingEventSubscription.Competitor.localLogoUrl.getter();
}

uint64_t SportingEventSubscription.Competitor.teamColorHex.getter()
{
  return SportingEventSubscription.Competitor.teamColorHex.getter();
}

uint64_t SportingEventSubscription.Competitor.LogoFilePaths.defaultSize.getter()
{
  return SportingEventSubscription.Competitor.LogoFilePaths.defaultSize.getter();
}

uint64_t SportingEventSubscription.Competitor.LogoFilePaths.init(smallSize:defaultSize:)()
{
  return SportingEventSubscription.Competitor.LogoFilePaths.init(smallSize:defaultSize:)();
}

uint64_t SportingEventSubscription.Competitor.LogoFilePaths.smallSize.getter()
{
  return SportingEventSubscription.Competitor.LogoFilePaths.smallSize.getter();
}

uint64_t type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths()
{
  return type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths();
}

uint64_t SportingEventSubscription.Competitor.logoFilePaths.getter()
{
  return SportingEventSubscription.Competitor.logoFilePaths.getter();
}

uint64_t SportingEventSubscription.Competitor.name.getter()
{
  return SportingEventSubscription.Competitor.name.getter();
}

uint64_t SportingEventSubscription.Competitor.isHome.getter()
{
  return SportingEventSubscription.Competitor.isHome.getter();
}

uint64_t SportingEventSubscription.Competitor.ordinal.getter()
{
  return SportingEventSubscription.Competitor.ordinal.getter();
}

uint64_t type metadata accessor for SportingEventSubscription.Competitor()
{
  return type metadata accessor for SportingEventSubscription.Competitor();
}

uint64_t SportingEventSubscription.byChanging(leagueId:sportId:metadata:consumers:)()
{
  return SportingEventSubscription.byChanging(leagueId:sportId:metadata:consumers:)();
}

uint64_t SportingEventSubscription.canonicalId.getter()
{
  return SportingEventSubscription.canonicalId.getter();
}

uint64_t SportingEventSubscription.eventStateURL.getter()
{
  return SportingEventSubscription.eventStateURL.getter();
}

uint64_t SportingEventSubscription.mostRecentPlay.getter()
{
  return SportingEventSubscription.mostRecentPlay.getter();
}

uint64_t SportingEventSubscription.registrationId.getter()
{
  return SportingEventSubscription.registrationId.getter();
}

uint64_t SportingEventSubscription.applicationType.getter()
{
  return SportingEventSubscription.applicationType.getter();
}

uint64_t SportingEventSubscription.qosRegistrationId.getter()
{
  return SportingEventSubscription.qosRegistrationId.getter();
}

uint64_t SportingEventSubscription.fullPayloadBaseURL.getter()
{
  return SportingEventSubscription.fullPayloadBaseURL.getter();
}

uint64_t SportingEventSubscription.byChangingConsumers(_:)()
{
  return SportingEventSubscription.byChangingConsumers(_:)();
}

uint64_t SportingEventSubscription.liveActivityTTLSeconds.getter()
{
  return SportingEventSubscription.liveActivityTTLSeconds.getter();
}

uint64_t SportingEventSubscription.liveActivityTTLSeconds.setter()
{
  return SportingEventSubscription.liveActivityTTLSeconds.setter();
}

uint64_t SportingEventSubscription.heartbeatSessionsTTLSeconds.getter()
{
  return SportingEventSubscription.heartbeatSessionsTTLSeconds.getter();
}

uint64_t SportingEventSubscription.createRunningClockDataSource(preferStaticClock:)()
{
  return SportingEventSubscription.createRunningClockDataSource(preferStaticClock:)();
}

uint64_t SportingEventSubscription.view.getter()
{
  return SportingEventSubscription.view.getter();
}

uint64_t SportingEventSubscription.view.setter()
{
  return SportingEventSubscription.view.setter();
}

uint64_t SportingEventSubscription.sport.getter()
{
  return SportingEventSubscription.sport.getter();
}

uint64_t SportingEventSubscription.update(sportingEventDetails:updatedAt:)()
{
  return SportingEventSubscription.update(sportingEventDetails:updatedAt:)();
}

uint64_t SportingEventSubscription.Metadata.shortTitle.getter()
{
  return SportingEventSubscription.Metadata.shortTitle.getter();
}

uint64_t SportingEventSubscription.Metadata.competitors.getter()
{
  return SportingEventSubscription.Metadata.competitors.getter();
}

uint64_t SportingEventSubscription.Metadata.preGameTitle.getter()
{
  return SportingEventSubscription.Metadata.preGameTitle.getter();
}

uint64_t SportingEventSubscription.Metadata.eventStartDate.getter()
{
  return SportingEventSubscription.Metadata.eventStartDate.getter();
}

uint64_t SportingEventSubscription.Metadata.init(eventStartDate:competitors:preGameTitle:shortTitle:eventURL:localizedLeagueName:)()
{
  return SportingEventSubscription.Metadata.init(eventStartDate:competitors:preGameTitle:shortTitle:eventURL:localizedLeagueName:)();
}

uint64_t SportingEventSubscription.Metadata.localizedLeagueName.getter()
{
  return SportingEventSubscription.Metadata.localizedLeagueName.getter();
}

uint64_t SportingEventSubscription.Metadata.eventURL.getter()
{
  return SportingEventSubscription.Metadata.eventURL.getter();
}

uint64_t type metadata accessor for SportingEventSubscription.Metadata()
{
  return type metadata accessor for SportingEventSubscription.Metadata();
}

uint64_t SportingEventSubscription.leagueId.getter()
{
  return SportingEventSubscription.leagueId.getter();
}

uint64_t SportingEventSubscription.metadata.getter()
{
  return SportingEventSubscription.metadata.getter();
}

uint64_t SportingEventSubscription.clientApp.getter()
{
  return SportingEventSubscription.clientApp.getter();
}

uint64_t SportingEventSubscription.init(consumers:sportId:sport:leagueId:leagueAbbreviation:eventStateURL:fullPayloadBaseURL:imageServiceBaseURL:sportingEventDetails:heartbeatTTLSeconds:heartbeatSessionsTTLSeconds:liveActivityTTLSeconds:clockFeatures:registrationId:metadata:view:shouldDisplayPlayByPlay:qosRegistrationId:applicationType:clientApp:)()
{
  return SportingEventSubscription.init(consumers:sportId:sport:leagueId:leagueAbbreviation:eventStateURL:fullPayloadBaseURL:imageServiceBaseURL:sportingEventDetails:heartbeatTTLSeconds:heartbeatSessionsTTLSeconds:liveActivityTTLSeconds:clockFeatures:registrationId:metadata:view:shouldDisplayPlayByPlay:qosRegistrationId:applicationType:clientApp:)();
}

uint64_t SportingEventSubscription.consumers.getter()
{
  return SportingEventSubscription.consumers.getter();
}

uint64_t SportingEventSubscription.updatedAt.getter()
{
  return SportingEventSubscription.updatedAt.getter();
}

uint64_t type metadata accessor for SportingEventSubscription()
{
  return type metadata accessor for SportingEventSubscription();
}

uint64_t type metadata accessor for SportingEventClockTimeType()
{
  return type metadata accessor for SportingEventClockTimeType();
}

uint64_t SportingEventClockBreakType.rawValue.getter()
{
  return SportingEventClockBreakType.rawValue.getter();
}

uint64_t type metadata accessor for SportingEventClockBreakType()
{
  return type metadata accessor for SportingEventClockBreakType();
}

uint64_t SportingEventPlayAnnotation.rawValue.getter()
{
  return SportingEventPlayAnnotation.rawValue.getter();
}

uint64_t type metadata accessor for SportingEventPlayAnnotation()
{
  return type metadata accessor for SportingEventPlayAnnotation();
}

uint64_t SportingEventProgressStatus.rawValue.getter()
{
  return SportingEventProgressStatus.rawValue.getter();
}

uint64_t type metadata accessor for SportingEventProgressStatus()
{
  return type metadata accessor for SportingEventProgressStatus();
}

uint64_t SportingEventClockPeriodType.rawValue.getter()
{
  return SportingEventClockPeriodType.rawValue.getter();
}

uint64_t type metadata accessor for SportingEventClockPeriodType()
{
  return type metadata accessor for SportingEventClockPeriodType();
}

uint64_t SportingEventCompetitorScore.scoreEntries.getter()
{
  return SportingEventCompetitorScore.scoreEntries.getter();
}

uint64_t dispatch thunk of ScoreboardSubscriptionManager.insert(_:)()
{
  return dispatch thunk of ScoreboardSubscriptionManager.insert(_:)();
}

uint64_t static ScoreboardSubscriptionManager.shared.getter()
{
  return static ScoreboardSubscriptionManager.shared.getter();
}

uint64_t type metadata accessor for ScoreboardSubscriptionManager()
{
  return type metadata accessor for ScoreboardSubscriptionManager();
}

uint64_t dispatch thunk of SportingEventClockRunningState.isReliable.getter()
{
  return dispatch thunk of SportingEventClockRunningState.isReliable.getter();
}

uint64_t dispatch thunk of SportingEventClockRunningState.isActive.getter()
{
  return dispatch thunk of SportingEventClockRunningState.isActive.getter();
}

uint64_t dispatch thunk of SportingEventCoverageIngestion.lastUpdates.getter()
{
  return dispatch thunk of SportingEventCoverageIngestion.lastUpdates.getter();
}

uint64_t dispatch thunk of SportingEventCoverageIngestion.coverageUpdates.getter()
{
  return dispatch thunk of SportingEventCoverageIngestion.coverageUpdates.getter();
}

uint64_t dispatch thunk of SportingEventCoverageIngestion.last.getter()
{
  return dispatch thunk of SportingEventCoverageIngestion.last.getter();
}

uint64_t dispatch thunk of CloudChannelSubscriptionManager.readChannelMap()()
{
  return dispatch thunk of CloudChannelSubscriptionManager.readChannelMap()();
}

uint64_t dispatch thunk of CloudChannelSubscriptionManager.clearChannelMap()()
{
  return dispatch thunk of CloudChannelSubscriptionManager.clearChannelMap()();
}

uint64_t dispatch thunk of CloudChannelSubscriptionManager.updateChannelMap(_:)()
{
  return dispatch thunk of CloudChannelSubscriptionManager.updateChannelMap(_:)();
}

uint64_t dispatch thunk of CloudChannelSubscriptionManager.audit(clearExpiredEntries:)()
{
  return dispatch thunk of CloudChannelSubscriptionManager.audit(clearExpiredEntries:)();
}

uint64_t static CloudChannelSubscriptionManager.topic.getter()
{
  return static CloudChannelSubscriptionManager.topic.getter();
}

uint64_t static CloudChannelSubscriptionManager.shared.getter()
{
  return static CloudChannelSubscriptionManager.shared.getter();
}

uint64_t dispatch thunk of CloudChannelSubscriptionManager.signal(demand:)()
{
  return dispatch thunk of CloudChannelSubscriptionManager.signal(demand:)();
}

uint64_t type metadata accessor for CloudChannelSubscriptionManager()
{
  return type metadata accessor for CloudChannelSubscriptionManager();
}

uint64_t RunningClockComponentsFormatter.DataSource.periodType.getter()
{
  return RunningClockComponentsFormatter.DataSource.periodType.getter();
}

uint64_t RunningClockComponentsFormatter.DataSource.progressStatus.getter()
{
  return RunningClockComponentsFormatter.DataSource.progressStatus.getter();
}

uint64_t type metadata accessor for RunningClockComponentsFormatter.DataSource()
{
  return type metadata accessor for RunningClockComponentsFormatter.DataSource();
}

uint64_t dispatch thunk of SportingEventClockTimeContainer.clockTimes.getter()
{
  return dispatch thunk of SportingEventClockTimeContainer.clockTimes.getter();
}

uint64_t dispatch thunk of SportingEventClockTimeContainer.period.getter()
{
  return dispatch thunk of SportingEventClockTimeContainer.period.getter();
}

uint64_t dispatch thunk of SportingEventCoverageLastUpdate.timestamp.getter()
{
  return dispatch thunk of SportingEventCoverageLastUpdate.timestamp.getter();
}

uint64_t SportingEventClockActivityStatus.isBreak.getter()
{
  return SportingEventClockActivityStatus.isBreak.getter();
}

uint64_t SportingEventClockActivityStatus.breakType.getter()
{
  return SportingEventClockActivityStatus.breakType.getter();
}

uint64_t SportingEventCompetitorContainer.competitor.getter()
{
  return SportingEventCompetitorContainer.competitor.getter();
}

uint64_t dispatch thunk of SportingEventCompetitorContainer.winOutcome.getter()
{
  return dispatch thunk of SportingEventCompetitorContainer.winOutcome.getter();
}

uint64_t dispatch thunk of SportingEventCompetitorContainer.getScoreEntry(name:)()
{
  return dispatch thunk of SportingEventCompetitorContainer.getScoreEntry(name:)();
}

uint64_t type metadata accessor for SportingEventCompetitorContainer.BaseballScores()
{
  return type metadata accessor for SportingEventCompetitorContainer.BaseballScores();
}

uint64_t SportingEventCompetitorContainer.baseballScores.getter()
{
  return SportingEventCompetitorContainer.baseballScores.getter();
}

uint64_t SportingEventCompetitorContainer.score.getter()
{
  return SportingEventCompetitorContainer.score.getter();
}

uint64_t dispatch thunk of SportingEventCompetitorContainer.ordinal.getter()
{
  return dispatch thunk of SportingEventCompetitorContainer.ordinal.getter();
}

uint64_t dispatch thunk of SportingEventCompetitorContainer.isActive.getter()
{
  return dispatch thunk of SportingEventCompetitorContainer.isActive.getter();
}

uint64_t type metadata accessor for SportingEventCompetitorContainer()
{
  return type metadata accessor for SportingEventCompetitorContainer();
}

uint64_t type metadata accessor for SportingEventCompetitorQualifier()
{
  return type metadata accessor for SportingEventCompetitorQualifier();
}

uint64_t SportingEventCompetitorStatistic.value.getter()
{
  return SportingEventCompetitorStatistic.value.getter();
}

uint64_t SportingEventRunningClockFeature.init(feature:value:)()
{
  return SportingEventRunningClockFeature.init(feature:value:)();
}

uint64_t type metadata accessor for SportingEventRunningClockFeature()
{
  return type metadata accessor for SportingEventRunningClockFeature();
}

uint64_t SportingEventSubscriptionRequest.SubscriptionType.init(rawValue:)()
{
  return SportingEventSubscriptionRequest.SubscriptionType.init(rawValue:)();
}

uint64_t type metadata accessor for SportingEventSubscriptionRequest.SubscriptionType()
{
  return type metadata accessor for SportingEventSubscriptionRequest.SubscriptionType();
}

uint64_t SportingEventSubscriptionRequest.ContextKey.rawValue.getter()
{
  return SportingEventSubscriptionRequest.ContextKey.rawValue.getter();
}

uint64_t type metadata accessor for SportingEventSubscriptionRequest.ContextKey()
{
  return type metadata accessor for SportingEventSubscriptionRequest.ContextKey();
}

uint64_t SportingEventCompetitorScoreEntry.value.getter()
{
  return SportingEventCompetitorScoreEntry.value.getter();
}

uint64_t type metadata accessor for SportingEventCompetitorWinOutcome()
{
  return type metadata accessor for SportingEventCompetitorWinOutcome();
}

uint64_t SportingEventLocalizedDisplayName.text.getter()
{
  return SportingEventLocalizedDisplayName.text.getter();
}

uint64_t SportingEventClockPeriodSubdivision.rawValue.getter()
{
  return SportingEventClockPeriodSubdivision.rawValue.getter();
}

uint64_t type metadata accessor for SportingEventClockPeriodSubdivision()
{
  return type metadata accessor for SportingEventClockPeriodSubdivision();
}

uint64_t SportingEventCompetitorStatisticType.StatisticName.init(rawValue:)()
{
  return SportingEventCompetitorStatisticType.StatisticName.init(rawValue:)();
}

uint64_t type metadata accessor for SportingEventCompetitorStatisticType.StatisticName()
{
  return type metadata accessor for SportingEventCompetitorStatisticType.StatisticName();
}

uint64_t dispatch thunk of SportingEventCoverageIngestionUpdate.statusCode.getter()
{
  return dispatch thunk of SportingEventCoverageIngestionUpdate.statusCode.getter();
}

uint64_t type metadata accessor for SportingEventCompetitorScoreStatisticType.StatisticName()
{
  return type metadata accessor for SportingEventCompetitorScoreStatisticType.StatisticName();
}

uint64_t Sport.scoreStatisticName.getter()
{
  return Sport.scoreStatisticName.getter();
}

uint64_t Sport.isClockCountingDown.getter()
{
  return Sport.isClockCountingDown.getter();
}

uint64_t Sport.init(rawValue:)()
{
  return Sport.init(rawValue:)();
}

uint64_t Sport.rawValue.getter()
{
  return Sport.rawValue.getter();
}

uint64_t type metadata accessor for Sport()
{
  return type metadata accessor for Sport();
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

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t Dictionary<>.subscript.setter()
{
  return Dictionary<>.subscript.setter();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t type metadata accessor for String.LocalizationValue()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t String.LocalizationValue.init(_:)()
{
  return String.LocalizationValue.init(_:)();
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

uint64_t String.data(using:allowLossyConversion:)()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t String.init<A>(bytes:encoding:)()
{
  return String.init<A>(bytes:encoding:)();
}

uint64_t String.init(format:arguments:)()
{
  return String.init(format:arguments:)();
}

uint64_t String.init(format:_:)()
{
  return String.init(format:_:)();
}

uint64_t static String.Encoding.utf8.getter()
{
  return static String.Encoding.utf8.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

uint64_t String.init(localized:)()
{
  return String.init(localized:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t String.init<A>(reflecting:)()
{
  return String.init<A>(reflecting:)();
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t static String._fromUTF8Repairing(_:)()
{
  return static String._fromUTF8Repairing(_:)();
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

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

uint64_t Sequence<>.joined(separator:)()
{
  return Sequence<>.joined(separator:)();
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

uint64_t static Array._adoptStorage(_:count:)()
{
  return static Array._adoptStorage(_:count:)();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t type metadata accessor for Array()
{
  return type metadata accessor for Array();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

Swift::Void __swiftcall Task.cancel()()
{
}

uint64_t static Double._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Double._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t Double.write<A>(to:)()
{
  return Double.write<A>(to:)();
}

uint64_t Set.description.getter()
{
  return Set.description.getter();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t AMSMetrics.withRemoteInspection.getter()
{
  return AMSMetrics.withRemoteInspection.getter();
}

uint64_t NSDictionary.init(dictionaryLiteral:)()
{
  return NSDictionary.init(dictionaryLiteral:)();
}

uint64_t NSFileManager.currentContainerURL.getter()
{
  return NSFileManager.currentContainerURL.getter();
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

uint64_t ACAccountStore.activeAccount.getter()
{
  return ACAccountStore.activeAccount.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.SchedulerOptions()
{
  return type metadata accessor for OS_dispatch_queue.SchedulerOptions();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t NSObject.hashValue.getter()
{
  return NSObject.hashValue.getter();
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

uint64_t StringProtocol.trimmingCharacters(in:)()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t StringProtocol.range<A>(of:options:range:locale:)()
{
  return StringProtocol.range<A>(of:options:range:locale:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.isSuperset(of:)()
{
  return dispatch thunk of SetAlgebra.isSuperset(of:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t _HashTable.occupiedBucket(after:)()
{
  return _HashTable.occupiedBucket(after:)();
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

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
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

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

Swift::Void __swiftcall _NativeDictionary.copy()()
{
}

uint64_t _NativeDictionary._delete(at:)()
{
  return _NativeDictionary._delete(at:)();
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

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

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

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

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

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
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

uint64_t dispatch thunk of SingleValueDecodingContainer.decode(_:)()
{
  return dispatch thunk of SingleValueDecodingContainer.decode(_:)();
}

uint64_t _findStringSwitchCaseWithCache(cases:string:cache:)()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
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

uint64_t Result.Publisher.tryMap<A>(_:)()
{
  return Result.Publisher.tryMap<A>(_:)();
}

uint64_t Result.publisher.getter()
{
  return Result.publisher.getter();
}

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return dispatch thunk of Decoder.singleValueContainer()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA1(data, len, md);
}

unsigned __int8 *__cdecl CC_SHA512(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA512(data, len, md);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFDataCreateMutable(allocator, capacity);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return _CGImageDestinationCreateWithData(data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return _CGImageDestinationFinalize(idst);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCreateThumbnailAtIndex(isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithURL(url, options);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetStringAnswer()
{
  return _MGGetStringAnswer();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

void exit(int a1)
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_resume()
{
  return _swift_continuation_resume();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
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

uint64_t swift_getTupleTypeLayout2()
{
  return _swift_getTupleTypeLayout2();
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

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return _swift_initEnumMetadataSinglePayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStaticObject()
{
  return _swift_initStaticObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isClassType()
{
  return _swift_isClassType();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
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

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
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

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return _xpc_activity_copy_criteria(activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}