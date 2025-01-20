void sub_10000243C(void *a1)
{
  id v2;
  void *v3;
  unsigned int v4;
  id v5;
  uint64_t v6;
  Swift::String v7;
  Swift::Bool v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  unsigned int v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  NSString v23;
  NSString v24;

  if (![a1 hasFactor]) {
    goto LABEL_16;
  }
  v2 = [a1 factor];
  if (!v2)
  {
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v3 = v2;
  v4 = [v2 hasName];

  if (!v4)
  {
LABEL_16:

    return;
  }
  v5 = [a1 factor];
  if (!v5) {
    goto LABEL_26;
  }
  sub_100005310(v5, (SEL *)&selRef_name);
  if (!v6)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v7._object = (void *)0x8000000100012890;
  v7._countAndFlagsBits = 0xD00000000000001BLL;
  v8 = String.hasPrefix(_:)(v7);
  swift_bridgeObjectRelease();
  if (!v8) {
    goto LABEL_16;
  }
  v9 = [a1 factor];
  if (!v9)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  sub_100005310(v9, (SEL *)&selRef_name);
  if (!v10)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (![a1 hasLevel]) {
    goto LABEL_17;
  }
  v11 = [a1 level];
  if (!v11)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v12 = v11;
  v13 = [v11 directoryValue];

  if (!v13)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v14 = [v13 hasPath];

  if (v14)
  {
    v15 = [a1 level];
    if (!v15)
    {
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    v16 = v15;
    v17 = [v15 directoryValue];

    if (!v17)
    {
LABEL_34:
      __break(1u);
      return;
    }
    sub_100005310(v17, (SEL *)&selRef_path);
    v19 = v18;
  }
  else
  {
LABEL_17:
    v19 = 0;
  }
  v20 = [a1 level];
  if (!v20)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v21 = v20;
  v22 = [v20 metadata];

  if (v22)
  {
    static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
  }
  v23 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (v19)
  {
    v24 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v24 = 0;
  }
  [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithFactor:v23 path:v24 metadata:0];
}

void sub_100002770(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (a2)
  {
    sub_1000052C4();
    uint64_t v10 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
    uint64_t v12 = v11;
    unint64_t v13 = swift_bridgeObjectRetain();
    a6 = (unint64_t)sub_100002A00(v13, v10, v12);
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  swift_bridgeObjectRetain();
  if (a4)
  {
LABEL_3:
    swift_bridgeObjectRetain();
    a6 = (unint64_t)sub_100002BA0(a6, a3, a4);
  }
LABEL_4:
  if (a6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v14) {
      goto LABEL_6;
    }
LABEL_19:
    swift_bridgeObjectRelease();
    sub_1000053C4();
    return;
  }
  uint64_t v14 = *(void *)((a6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v14) {
    goto LABEL_19;
  }
LABEL_6:
  if (v14 >= 1)
  {
    uint64_t v15 = 0;
    while (1)
    {
      if ((a6 & 0xC000000000000001) != 0) {
        id v16 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v16 = *(id *)(a6 + 8 * v15 + 32);
      }
      v17 = v16;
      if (a5 == 1)
      {
        id v21 = [v16 factor];
        static String._unconditionallyBridgeFromObjectiveC(_:)();

        unint64_t v19 = 0xD000000000000022;
        unint64_t v20 = 0x8000000100012770;
      }
      else
      {
        if (a5) {
          goto LABEL_17;
        }
        id v18 = [v16 factor];
        static String._unconditionallyBridgeFromObjectiveC(_:)();

        unint64_t v19 = 0xD00000000000001CLL;
        unint64_t v20 = 0x80000001000126E0;
      }
      Swift::Bool v22 = String.hasPrefix(_:)(*(Swift::String *)&v19);
      swift_bridgeObjectRelease();
      if (!v22)
      {
LABEL_17:

        goto LABEL_18;
      }
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
LABEL_18:
      if (v14 == ++v15) {
        goto LABEL_19;
      }
    }
  }
  __break(1u);
}

void *sub_100002A00(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >> 62) {
    goto LABEL_21;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v6)
  {
    while (1)
    {
      unint64_t v7 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_7:
        v9 = v8;
        unint64_t v10 = v7 + 1;
        if (__OFADD__(v7, 1)) {
          goto LABEL_20;
        }
        if (SiriTTSTrainingAsset.languageComponent.getter() == a2 && v11 == a3)
        {
          swift_bridgeObjectRelease();
LABEL_15:
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
          goto LABEL_16;
        }
        char v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v13) {
          goto LABEL_15;
        }

LABEL_16:
        ++v7;
        if (v10 == v6) {
          goto LABEL_22;
        }
      }
      if (v7 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
      if (!v6) {
        goto LABEL_22;
      }
    }
    id v8 = *(id *)(a1 + 8 * v7 + 32);
    goto LABEL_7;
  }
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return &_swiftEmptyArrayStorage;
}

void *sub_100002BA0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 >> 62) {
    goto LABEL_21;
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
LABEL_7:
        id v8 = v7;
        unint64_t v9 = v6 + 1;
        if (__OFADD__(v6, 1)) {
          goto LABEL_20;
        }
        id v10 = [v7 name];
        uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v13 = v12;

        if (v11 == a2 && v13 == a3)
        {
          swift_bridgeObjectRelease();
LABEL_15:
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
          goto LABEL_16;
        }
        char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v15) {
          goto LABEL_15;
        }

LABEL_16:
        ++v6;
        if (v9 == v5) {
          goto LABEL_22;
        }
      }
      if (v6 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
      if (!v5) {
        goto LABEL_22;
      }
    }
    id v7 = *(id *)(a1 + 8 * v6 + 32);
    goto LABEL_7;
  }
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return &_swiftEmptyArrayStorage;
}

void SiriTTSTrainingAgent.installableTrainingAssets(language:name:type:reply:)(uint64_t a1, uint64_t a2, uint64_t a3, char **a4, char **a5, void (*a6)(void), uint64_t a7)
{
  uint64_t ObjectType = swift_getObjectType();
  id v13 = (id)SiriTTSTrainerGetLog();
  static os_log_type_t.default.getter();
  sub_100003430(&qword_10001D570);
  uint64_t v14 = sub_10000543C();
  *(_OWORD *)(v14 + 16) = xmmword_1000125B0;
  *(void *)(v14 + 56) = &type metadata for String;
  unint64_t v15 = sub_100003474();
  uint64_t v16 = 7104878;
  if (a2) {
    uint64_t v17 = a1;
  }
  else {
    uint64_t v17 = 7104878;
  }
  if (a2) {
    unint64_t v18 = a2;
  }
  else {
    unint64_t v18 = 0xE300000000000000;
  }
  *(void *)(v14 + 32) = v17;
  *(void *)(v14 + 40) = v18;
  *(void *)(v14 + 96) = &type metadata for String;
  *(void *)(v14 + 104) = v15;
  if (a4)
  {
    uint64_t v16 = a3;
    unint64_t v19 = (unint64_t)a4;
  }
  else
  {
    unint64_t v19 = 0xE300000000000000;
  }
  *(void *)(v14 + 64) = v15;
  *(void *)(v14 + 72) = v16;
  *(void *)(v14 + 80) = v19;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  os_log(_:dso:log:type:_:)();

  swift_bridgeObjectRelease();
  id v20 = [self clientWithIdentifier:118];
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v20;
  *(void *)(v21 + 24) = a1;
  *(void *)(v21 + 32) = a2;
  *(void *)(v21 + 40) = a3;
  *(void *)(v21 + 48) = a4;
  *(void *)(v21 + 56) = a5;
  *(void *)(v21 + 64) = ObjectType;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v57 = v20;
  NSString v22 = String._bridgeToObjectiveC()();
  id v23 = [v57 rolloutIdentifiersWithNamespaceName:v22];

  if (!v23)
  {
    id v26 = (id)SiriTTSTrainerGetLog();
    static os_log_type_t.default.getter();
    uint64_t v27 = (uint64_t)&_swiftEmptyArrayStorage;
    os_log(_:dso:log:type:_:)();

    NSString v28 = String._bridgeToObjectiveC()();
    id v29 = [v57 factorLevelsWithNamespaceName:v28];

    sub_100004EA0(0, &qword_10001D580);
    unint64_t v30 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    aBlock[0] = &_swiftEmptyArrayStorage;
    if (v30 >> 62) {
      goto LABEL_49;
    }
    uint64_t v31 = *(void *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10);
    while (1)
    {
      uint64_t v53 = v21;
      uint64_t v54 = ObjectType;
      if (v31)
      {
        uint64_t v21 = 4;
        do
        {
          uint64_t v27 = v21 - 4;
          if ((v30 & 0xC000000000000001) != 0) {
            id v32 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else {
            id v32 = *(id *)(v30 + 8 * v21);
          }
          v33 = v32;
          uint64_t ObjectType = v21 - 3;
          if (__OFADD__(v27, 1))
          {
            __break(1u);
            goto LABEL_48;
          }
          id v34 = [v32 factor];
          if (!v34)
          {
            __break(1u);
LABEL_53:
            __break(1u);
LABEL_54:
            __break(1u);
            return;
          }
          sub_100005310(v34, (SEL *)&selRef_name);
          if (!v35) {
            goto LABEL_53;
          }
          v36._countAndFlagsBits = 0xD00000000000001CLL;
          v36._object = (void *)0x80000001000126E0;
          Swift::Bool v37 = String.hasPrefix(_:)(v36);
          swift_bridgeObjectRelease();
          if (v37)
          {
            specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
            specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
            specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
            specialized ContiguousArray._endMutation()();
          }
          else
          {
          }
          ++v21;
        }
        while (ObjectType != v31);
        swift_bridgeObjectRelease();
        uint64_t v27 = aBlock[0];
        if ((aBlock[0] & 0x8000000000000000) == 0) {
          goto LABEL_31;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        if ((v27 & 0x8000000000000000) == 0)
        {
LABEL_31:
          if ((v27 & 0x4000000000000000) == 0)
          {
            unint64_t v30 = *(void *)(v27 + 16);
            swift_retain();
            if (!v30) {
              goto LABEL_51;
            }
            goto LABEL_33;
          }
        }
      }
      swift_retain();
      unint64_t v30 = _CocoaArrayWrapper.endIndex.getter();
      if (!v30)
      {
LABEL_51:
        swift_release_n();
        Class isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        NSString v49 = String._bridgeToObjectiveC()();
        v50 = (void *)swift_allocObject();
        v50[2] = v57;
        v50[3] = sub_100003804;
        v50[4] = v53;
        v50[5] = a6;
        v50[6] = a7;
        v50[7] = v54;
        aBlock[4] = sub_100004D8C;
        aBlock[5] = v50;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_100003814;
        aBlock[3] = &unk_1000187E0;
        v51 = _Block_copy(aBlock);
        id v52 = v57;
        swift_retain();
        swift_retain();
        swift_release();
        [v52 removeLevelsForFactors:isa withNamespace:v49 queue:0 completion:v51];
        swift_release();

        _Block_release(v51);
        sub_1000053C4();
        return;
      }
LABEL_33:
      v38 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v21 = 4;
      while (1)
      {
        id v39 = (v27 & 0xC000000000000001) != 0
            ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
            : *(id *)(v27 + 8 * v21);
        v40 = v39;
        uint64_t ObjectType = v21 - 3;
        if (__OFADD__(v21 - 4, 1)) {
          break;
        }
        id v41 = [v39 factor];
        if (!v41) {
          goto LABEL_54;
        }
        uint64_t v42 = sub_100005310(v41, (SEL *)&selRef_name);
        uint64_t v44 = v43;

        if (v44)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v38 = sub_100004A38(0, *((void *)v38 + 2) + 1, 1, v38);
          }
          unint64_t v46 = *((void *)v38 + 2);
          unint64_t v45 = *((void *)v38 + 3);
          if (v46 >= v45 >> 1) {
            v38 = sub_100004A38((char *)(v45 > 1), v46 + 1, 1, v38);
          }
          *((void *)v38 + 2) = v46 + 1;
          v47 = &v38[16 * v46];
          *((void *)v47 + 4) = v42;
          *((void *)v47 + 5) = v44;
        }
        ++v21;
        if (ObjectType == v30) {
          goto LABEL_51;
        }
      }
LABEL_48:
      __break(1u);
LABEL_49:
      swift_bridgeObjectRetain();
      uint64_t v31 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
  }
  sub_1000034C0(v57, a1, a2, a3, a4, a5);
  a6();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1000053C4();
}

uint64_t sub_100003430(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100003474()
{
  unint64_t result = qword_10001D578;
  if (!qword_10001D578)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001D578);
  }
  return result;
}

void sub_1000034C0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char **a5, char **a6)
{
  NSString v9 = sub_1000053A4();
  id v10 = [a1 factorLevelsWithNamespaceName:v9];

  sub_100004EA0(0, &qword_10001D580);
  unint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v12 = (void **)&_swiftEmptyArrayStorage;
  unint64_t v41 = (unint64_t)&_swiftEmptyArrayStorage;
  if (v11 >> 62) {
    goto LABEL_17;
  }
  uint64_t v13 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v13)
  {
    uint64_t v36 = (uint64_t)a5;
    uint64_t v37 = (uint64_t)a6;
    uint64_t v14 = 4;
    a6 = &selRef_setCpuIntensive_;
    a5 = &selRef_setCpuIntensive_;
    while (1)
    {
      id v15 = (v11 & 0xC000000000000001) != 0
          ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
          : *(id *)(v11 + 8 * v14);
      uint64_t v16 = v15;
      uint64_t v17 = v14 - 3;
      if (__OFADD__(v14 - 4, 1)) {
        break;
      }
      if (![v15 hasLevel]) {
        goto LABEL_13;
      }
      id v18 = [v16 level];
      if (!v18) {
        goto LABEL_36;
      }
      unint64_t v19 = v18;
      uint64_t v12 = (void **)[v18 directoryValue];

      if (!v12) {
        goto LABEL_37;
      }
      unsigned __int8 v20 = [v12 hasAsset];

      if (v20)
      {
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        sub_100005474();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        uint64_t v12 = (void **)&v41;
        specialized ContiguousArray._endMutation()();
      }
      else
      {
LABEL_13:
      }
      ++v14;
      if (v17 == v13)
      {
        swift_bridgeObjectRelease();
        unint64_t v21 = v41;
        uint64_t v12 = (void **)&_swiftEmptyArrayStorage;
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_17:
    sub_10000541C();
    uint64_t v13 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  unint64_t v21 = (unint64_t)&_swiftEmptyArrayStorage;
LABEL_19:
  unint64_t v41 = (unint64_t)v12;
  if ((v21 & 0x8000000000000000) == 0 && (v21 & 0x4000000000000000) == 0)
  {
    uint64_t v22 = *(void *)(v21 + 16);
    swift_retain();
    if (v22) {
      goto LABEL_22;
    }
LABEL_34:
    swift_release();
    uint64_t v28 = swift_release();
    sub_1000053E0(v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, a2, a3, a4);
    swift_bridgeObjectRelease();
    return;
  }
  swift_retain();
  uint64_t v22 = _CocoaArrayWrapper.endIndex.getter();
  if (!v22) {
    goto LABEL_34;
  }
LABEL_22:
  sub_100004EA0(0, &qword_10001D588);
  if (v22 >= 1)
  {
    for (uint64_t i = 0; i != v22; ++i)
    {
      if ((v21 & 0xC000000000000001) != 0) {
        id v24 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v24 = *(id *)(v21 + 8 * i + 32);
      }
      sub_10000243C(v24);
      if (v25)
      {
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        unint64_t v27 = *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10);
        unint64_t v26 = *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v27 >= v26 >> 1) {
          sub_100005454(v27 + 1, v26);
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
    }
    goto LABEL_34;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
}

uint64_t sub_1000037E8()
{
  return sub_100004D24((void (*)(void))&_swift_bridgeObjectRelease, 72);
}

void sub_100003804()
{
  sub_1000034C0(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(char ***)(v0 + 48), *(char ***)(v0 + 56));
}

void sub_100003814(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_100003980(uint64_t a1, uint64_t a2)
{
  sub_100004EA0(0, &qword_10001D588);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, objc_class *))(a2 + 16))(a2, isa);
}

void sub_1000039FC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void *a6, void (**a7)(void, void))
{
  NSString v10 = a4;
  if (a2)
  {
    NSString v11 = String._bridgeToObjectiveC()();
    if (!v10) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  NSString v11 = 0;
  if (a4) {
LABEL_3:
  }
    NSString v10 = String._bridgeToObjectiveC()();
LABEL_4:
  id v12 = [a6 installedTrainingAssetsSyncWithLanguage:v11 name:v10 type:a5];

  sub_100004EA0(0, &qword_10001D588);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();

  Class isa = Array._bridgeToObjectiveC()().super.isa;
  ((void (**)(void, Class))a7)[2](a7, isa);
  swift_bridgeObjectRelease();

  _Block_release(a7);
}

uint64_t SiriTTSTrainingAgent.installedTrainingAssets(language:name:type:reply:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void (*a6)(uint64_t))
{
  NSString v9 = a4;
  if (a2)
  {
    NSString v10 = String._bridgeToObjectiveC()();
    if (!v9) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  NSString v10 = 0;
  if (a4) {
LABEL_3:
  }
    NSString v9 = String._bridgeToObjectiveC()();
LABEL_4:
  id v11 = [v6 installedTrainingAssetsSyncWithLanguage:v10 name:v9 type:a5];

  sub_100004EA0(0, &qword_10001D588);
  uint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  a6(v12);

  return swift_bridgeObjectRelease();
}

void SiriTTSTrainingAgent.installedTrainingAssetsSync(language:name:type:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v10 = (id)SiriTTSTrainerGetLog();
  static os_log_type_t.default.getter();
  sub_100003430(&qword_10001D570);
  uint64_t v11 = sub_10000543C();
  *(_OWORD *)(v11 + 16) = xmmword_1000125B0;
  *(void *)(v11 + 56) = &type metadata for String;
  unint64_t v12 = sub_100003474();
  uint64_t v13 = 7104878;
  uint64_t v45 = a1;
  uint64_t v46 = a2;
  if (a2) {
    uint64_t v14 = a1;
  }
  else {
    uint64_t v14 = 7104878;
  }
  if (a2) {
    unint64_t v15 = a2;
  }
  else {
    unint64_t v15 = 0xE300000000000000;
  }
  *(void *)(v11 + 32) = v14;
  *(void *)(v11 + 40) = v15;
  *(void *)(v11 + 96) = &type metadata for String;
  *(void *)(v11 + 104) = v12;
  uint64_t v47 = a3;
  if (a4)
  {
    uint64_t v13 = a3;
    unint64_t v16 = a4;
  }
  else
  {
    unint64_t v16 = 0xE300000000000000;
  }
  *(void *)(v11 + 64) = v12;
  *(void *)(v11 + 72) = v13;
  *(void *)(v11 + 80) = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  os_log(_:dso:log:type:_:)();

  swift_bridgeObjectRelease();
  id v17 = [self clientWithIdentifier:118];
  NSString v18 = sub_1000053A4();
  id v19 = [v17 factorLevelsWithNamespaceName:v18];

  sub_100004EA0(0, &qword_10001D580);
  unint64_t v20 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  unint64_t v21 = (void **)&_swiftEmptyArrayStorage;
  unint64_t v48 = (unint64_t)&_swiftEmptyArrayStorage;
  if (v20 >> 62) {
    goto LABEL_26;
  }
  uint64_t v22 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v22)
  {
    uint64_t v43 = a4;
    uint64_t v44 = a5;
    a4 = 4;
    while (1)
    {
      id v23 = (v20 & 0xC000000000000001) != 0
          ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
          : *(id *)(v20 + 8 * a4);
      id v24 = v23;
      a5 = a4 - 3;
      if (__OFADD__(a4 - 4, 1)) {
        break;
      }
      if (![v23 hasLevel]) {
        goto LABEL_22;
      }
      id v25 = [v24 level];
      if (!v25) {
        goto LABEL_45;
      }
      unint64_t v26 = v25;
      unint64_t v21 = (void **)[v25 directoryValue];

      if (!v21) {
        goto LABEL_46;
      }
      unsigned __int8 v27 = [v21 hasPath];

      if (v27)
      {
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        sub_100005474();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        unint64_t v21 = (void **)&v48;
        specialized ContiguousArray._endMutation()();
      }
      else
      {
LABEL_22:
      }
      ++a4;
      if (a5 == v22)
      {
        swift_bridgeObjectRelease();
        unint64_t v28 = v48;
        unint64_t v21 = (void **)&_swiftEmptyArrayStorage;
        goto LABEL_28;
      }
    }
    __break(1u);
LABEL_26:
    sub_10000541C();
    uint64_t v22 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  unint64_t v28 = (unint64_t)&_swiftEmptyArrayStorage;
LABEL_28:
  unint64_t v48 = (unint64_t)v21;
  if ((v28 & 0x8000000000000000) == 0 && (v28 & 0x4000000000000000) == 0)
  {
    uint64_t v29 = *(void *)(v28 + 16);
    swift_retain();
    if (v29) {
      goto LABEL_31;
    }
LABEL_43:
    swift_release();
    uint64_t v35 = swift_release();
    sub_1000053E0(v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47);
    swift_bridgeObjectRelease();
    return;
  }
  swift_retain();
  uint64_t v29 = _CocoaArrayWrapper.endIndex.getter();
  if (!v29) {
    goto LABEL_43;
  }
LABEL_31:
  sub_100004EA0(0, &qword_10001D588);
  if (v29 >= 1)
  {
    for (uint64_t i = 0; i != v29; ++i)
    {
      if ((v28 & 0xC000000000000001) != 0) {
        id v31 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v31 = *(id *)(v28 + 8 * i + 32);
      }
      sub_10000243C(v31);
      if (v32)
      {
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        unint64_t v34 = *(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10);
        unint64_t v33 = *(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v34 >= v33 >> 1) {
          sub_100005454(v34 + 1, v33);
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
    }
    goto LABEL_43;
  }
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
}

void SiriTTSTrainingAgent.install(trainingAsset:reply:)(void *a1, uint64_t a2, uint64_t a3)
{
  v4 = v3;
  id v6 = (id)SiriTTSTrainerGetLog();
  static os_log_type_t.default.getter();
  sub_100003430(&qword_10001D570);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1000125C0;
  id v8 = [a1 factor];
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;

  *(void *)(v7 + 56) = &type metadata for String;
  *(void *)(v7 + 64) = sub_100003474();
  *(void *)(v7 + 32) = v9;
  *(void *)(v7 + 40) = v11;
  os_log(_:dso:log:type:_:)();

  swift_bridgeObjectRelease();
  id v12 = [a1 factor];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  v13._countAndFlagsBits = 0xD000000000000022;
  v13._object = (void *)0x8000000100012770;
  LOBYTE(v12) = String.hasPrefix(_:)(v13);
  swift_bridgeObjectRelease();
  if (v12)
  {
    char v14 = 1;
  }
  else
  {
    type metadata accessor for InternalSettings();
    static InternalSettings.shared.getter();
    char v14 = dispatch thunk of InternalSettings.defaultToNonDiscretionaryDownloads.getter();
    swift_release();
  }
  id v15 = [objc_allocWithZone((Class)TRIDownloadOptions) initWithAllowsCellular:v14 & 1 discretionaryBehavior:0];
  id v16 = [self clientWithIdentifier:118];
  sub_100003430(&qword_10001D590);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_1000125C0;
  id v18 = [a1 factor];
  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v21 = v20;

  *(void *)(v17 + 32) = v19;
  *(void *)(v17 + 40) = v21;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  NSString v23 = sub_1000053A4();
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = a1;
  *(void *)(v24 + 24) = v4;
  uint64_t v38 = sub_100004F1C;
  uint64_t v39 = (void *)v24;
  aBlock = _NSConcreteStackBlock;
  uint64_t v35 = 1107296256;
  uint64_t v36 = sub_1000045BC;
  uint64_t v37 = &unk_100018830;
  id v25 = _Block_copy(&aBlock);
  id v26 = v15;
  id v27 = a1;
  id v28 = v4;
  swift_release();
  uint64_t v29 = (void *)swift_allocObject();
  v29[2] = v27;
  v29[3] = a2;
  v29[4] = a3;
  uint64_t v38 = sub_10000508C;
  uint64_t v39 = v29;
  aBlock = _NSConcreteStackBlock;
  uint64_t v35 = 1107296256;
  uint64_t v36 = sub_100003814;
  uint64_t v37 = &unk_100018880;
  uint64_t v30 = _Block_copy(&aBlock);
  id v31 = v27;
  swift_retain();
  swift_release();
  [v16 downloadLevelsForFactors:isa withNamespace:v23 queue:0 options:v26 progress:v25 completion:v30];
  _Block_release(v30);
  _Block_release(v25);
}

uint64_t sub_1000045BC(uint64_t a1, uint64_t a2)
{
  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

void sub_1000046B0(char a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, void))(a3 + 16))(a3, a1 & 1);
}

void SiriTTSTrainingAgent.uninstall(trainingAsset:reply:)(void *a1, uint64_t a2, uint64_t a3)
{
  id v6 = (id)SiriTTSTrainerGetLog();
  static os_log_type_t.default.getter();
  sub_100003430(&qword_10001D570);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1000125C0;
  id v8 = [a1 factor];
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;

  *(void *)(v7 + 56) = &type metadata for String;
  *(void *)(v7 + 64) = sub_100003474();
  *(void *)(v7 + 32) = v9;
  *(void *)(v7 + 40) = v11;
  os_log(_:dso:log:type:_:)();

  swift_bridgeObjectRelease();
  id v12 = [self clientWithIdentifier:118];
  sub_100003430(&qword_10001D590);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1000125C0;
  id v14 = [a1 factor];
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = v16;

  *(void *)(v13 + 32) = v15;
  *(void *)(v13 + 40) = v17;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  NSString v19 = sub_1000053A4();
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = a1;
  v20[3] = a2;
  v20[4] = a3;
  aBlock[4] = sub_1000050E0;
  aBlock[5] = v20;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100003814;
  aBlock[3] = &unk_1000188D0;
  uint64_t v21 = _Block_copy(aBlock);
  id v22 = a1;
  swift_retain();
  swift_release();
  [v12 removeLevelsForFactors:isa withNamespace:v19 queue:0 completion:v21];
  _Block_release(v21);
}

char *sub_100004A38(char *result, int64_t a2, char a3, char *a4)
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
    sub_100003430(&qword_10001D590);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  id v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
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

uint64_t sub_100004B38(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v3 = &_swiftEmptySetSingleton;
    goto LABEL_25;
  }
  sub_100003430(&qword_10001D5A0);
  uint64_t result = static _SetStorage.allocate(capacity:)();
  v3 = (unsigned char *)result;
  uint64_t v24 = *(void *)(a1 + 16);
  if (!v24)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    return (uint64_t)v3;
  }
  unint64_t v4 = 0;
  uint64_t v5 = result + 56;
  while (v4 < *(void *)(a1 + 16))
  {
    unint64_t v6 = (uint64_t *)(a1 + 32 + 16 * v4);
    uint64_t v8 = *v6;
    uint64_t v7 = v6[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v9 = -1 << v3[32];
    unint64_t v10 = result & ~v9;
    unint64_t v11 = v10 >> 6;
    uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
    uint64_t v13 = 1 << v10;
    if (((1 << v10) & v12) != 0)
    {
      uint64_t v14 = *((void *)v3 + 6);
      uint64_t v15 = (void *)(v14 + 16 * v10);
      BOOL v16 = *v15 == v8 && v15[1] == v7;
      if (v16 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
      {
LABEL_11:
        uint64_t result = swift_bridgeObjectRelease();
        goto LABEL_22;
      }
      uint64_t v17 = ~v9;
      while (1)
      {
        unint64_t v10 = (v10 + 1) & v17;
        unint64_t v11 = v10 >> 6;
        uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
        uint64_t v13 = 1 << v10;
        if ((v12 & (1 << v10)) == 0) {
          break;
        }
        id v18 = (void *)(v14 + 16 * v10);
        if (*v18 != v8 || v18[1] != v7)
        {
          uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_11;
      }
    }
    *(void *)(v5 + 8 * v11) = v13 | v12;
    uint64_t v20 = (void *)(*((void *)v3 + 6) + 16 * v10);
    *uint64_t v20 = v8;
    v20[1] = v7;
    uint64_t v21 = *((void *)v3 + 2);
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_27;
    }
    *((void *)v3 + 2) = v23;
LABEL_22:
    if (++v4 == v24) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_100004D08()
{
  return sub_100004D24((void (*)(void))&_swift_release, 64);
}

uint64_t sub_100004D24(void (*a1)(void), uint64_t a2)
{
  a1(*(void *)(v2 + 32));
  a1(*(void *)(v2 + 48));

  return _swift_deallocObject(v2, a2, 7);
}

uint64_t sub_100004D8C()
{
  v1 = (void *)v0[2];
  uint64_t v2 = (void (*)(id))v0[3];
  v3 = (void (*)(void))v0[5];
  sub_100004B38((uint64_t)&off_100018760);
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v9 = 0;
  unsigned int v5 = [v1 immediateDownloadForNamespaceNames:isa allowExpensiveNetworking:1 error:&v9];

  if (v5)
  {
    id v6 = v9;
  }
  else
  {
    id v7 = v9;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    id v6 = (id)swift_errorRelease();
  }
  v2(v6);
  v3();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100004E88(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100004E98()
{
  return swift_release();
}

uint64_t sub_100004EA0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100004EDC()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_100004F1C(unint64_t a1)
{
  v3 = *(void **)(v1 + 16);
  unint64_t v4 = *(void **)(v1 + 24);
  id v5 = (id)SiriTTSTrainerGetLog();
  static os_log_type_t.info.getter();
  sub_100003430(&qword_10001D570);
  uint64_t v6 = sub_10000543C();
  *(_OWORD *)(v6 + 16) = xmmword_1000125B0;
  id v7 = [v3 factor];
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;

  *(void *)(v6 + 56) = &type metadata for String;
  unint64_t v11 = sub_100003474();
  *(void *)(v6 + 32) = v8;
  *(void *)(v6 + 40) = v10;
  *(void *)(v6 + 96) = &type metadata for UInt;
  *(void *)(v6 + 104) = &protocol witness table for UInt;
  *(void *)(v6 + 64) = v11;
  *(void *)(v6 + 72) = a1;
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  id result = [v4 delegate];
  if (result)
  {
    id v14 = result;
    *(float *)&double v13 = (float)a1;
    [result installingTrainingAsset:v3 progress:v13];
    return (id)_swift_unknownObjectRelease(v14);
  }
  return result;
}

uint64_t sub_10000508C(char a1, uint64_t a2)
{
  return sub_1000050F0(a1, a2);
}

uint64_t sub_1000050A0()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000050E0(char a1, uint64_t a2)
{
  return sub_1000050F0(a1, a2);
}

uint64_t sub_1000050F0(char a1, uint64_t a2)
{
  id v5 = *(void **)(v2 + 16);
  unint64_t v4 = *(uint64_t (**)(void, uint64_t))(v2 + 24);
  id v6 = (id)SiriTTSTrainerGetLog();
  static os_log_type_t.default.getter();
  sub_100003430(&qword_10001D570);
  uint64_t v7 = sub_10000543C();
  *(_OWORD *)(v7 + 16) = xmmword_1000125B0;
  id v8 = [v5 factor];
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;

  *(void *)(v7 + 56) = &type metadata for String;
  unint64_t v12 = sub_100003474();
  unint64_t v13 = v12;
  *(void *)(v7 + 64) = v12;
  *(void *)(v7 + 32) = v9;
  *(void *)(v7 + 40) = v11;
  if (!a2)
  {
    BOOL v16 = (uint64_t *)(v7 + 72);
    *(void *)(v7 + 96) = &type metadata for String;
    *(void *)(v7 + 104) = v12;
    goto LABEL_5;
  }
  swift_getErrorValue();
  uint64_t v14 = Error.localizedDescription.getter();
  BOOL v16 = (uint64_t *)(v7 + 72);
  *(void *)(v7 + 96) = &type metadata for String;
  *(void *)(v7 + 104) = v13;
  if (!v15)
  {
LABEL_5:
    char v17 = a1;
    *BOOL v16 = 0x73736563637573;
    unint64_t v15 = 0xE700000000000000;
    goto LABEL_6;
  }
  *BOOL v16 = v14;
  char v17 = a1;
LABEL_6:
  *(void *)(v7 + 80) = v15;
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  return v4(v17 & 1, a2);
}

uint64_t sub_10000527C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000052B4(char a1, uint64_t a2)
{
  sub_1000046B0(a1, a2, *(void *)(v2 + 16));
}

void sub_1000052BC(uint64_t a1)
{
  sub_100003980(a1, *(void *)(v1 + 16));
}

unint64_t sub_1000052C4()
{
  unint64_t result = qword_10001D598;
  if (!qword_10001D598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001D598);
  }
  return result;
}

uint64_t sub_100005310(void *a1, SEL *a2)
{
  id v3 = [a1 *a2];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v4;
}

NSString sub_1000053A4()
{
  return String._bridgeToObjectiveC()();
}

void sub_1000053E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  sub_100002770(a11, a12, a13, v15, v14, v13);
}

uint64_t sub_100005404()
{
  return v0;
}

uint64_t sub_10000541C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_10000543C()
{
  return swift_allocObject();
}

uint64_t sub_100005454@<X0>(uint64_t a1@<X1>, unint64_t a2@<X8>)
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(a2 > 1, a1, 1);
}

uint64_t sub_100005474()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

void sub_100005908(id a1)
{
  qword_10001D7F0 = objc_alloc_init(STTCoreAnalyticsService);

  _objc_release_x1();
}

void sub_100005944(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (a1)
  {
    id v8 = v6;
    char v9 = AnalyticsSendEventLazy();
    uint64_t v10 = SiriTTSTrainerGetLog();
    uint64_t v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v13 = v5;
        __int16 v14 = 2112;
        id v15 = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Reported event '%@' with payload '%@'", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unable to report event '%@' with payload '%@'", buf, 0x16u);
    }
  }
}

id sub_100005AE4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_100006004()
{
  uint64_t v0 = os_log_create("com.apple.siri.tts.trainer", "default");
  bzero(v3, 0x400uLL);
  if ((!_set_user_dir_suffix() || !confstr(65537, v3, 0x400uLL))
    && os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    int v1 = *__error();
    v2[0] = 67109120;
    v2[1] = v1;
    _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "failed to initialize temporary directory: %{darwin.errno}d", (uint8_t *)v2, 8u);
  }
}

void sub_1000062E8(id a1)
{
  int v1 = +[NSFileManager defaultManager];
  uint64_t v2 = [v1 URLsForDirectory:5 inDomains:1];

  id v3 = [v2 firstObject];
  uint64_t v4 = [v3 URLByAppendingPathComponent:@"Logs"];
  id v5 = [v4 URLByAppendingPathComponent:@"SiriTTSTrainer"];

  char v16 = 1;
  id v6 = +[NSFileManager defaultManager];
  uint64_t v7 = [v5 relativePath];
  unsigned __int8 v8 = [v6 fileExistsAtPath:v7 isDirectory:&v16];

  if ((v8 & 1) == 0)
  {
    char v9 = +[NSFileManager defaultManager];
    id v15 = 0;
    unsigned __int8 v10 = [v9 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v15];
    id v11 = v15;

    if ((v10 & 1) == 0)
    {
      unint64_t v12 = SiriTTSTrainerGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v11;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unable to create log directory, %@", buf, 0xCu);
      }
    }
  }
  id v13 = [v5 relativePath];
  __int16 v14 = off_10001D5A8;
  off_10001D5A8 = v13;
}

void sub_1000064C0(id a1)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v2) = info.denom;
  LODWORD(v1) = info.numer;
  *(double *)&qword_10001D808 = (double)v1 / (double)v2 / 1000000000.0;
}

void sub_10000676C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = SiriTTSTrainerGetLog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Unable to collect tailspin, %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = *(void **)(a1 + 32);
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dumped tailspin to %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

void sub_100006A08(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = 0;
  }
  else
  {
    NSErrorUserInfoKey v5 = NSLocalizedDescriptionKey;
    CFStringRef v6 = @"Unable to dump tailspin";
    uint64_t v4 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
    id v3 = +[NSError errorWithDomain:&stru_100018F40 code:-1 userInfo:v4];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100006DC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007070(id a1)
{
  unint64_t v1 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Invalidated connection", v2, 2u);
  }
}

void sub_100007124(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007420(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000074C4(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    if (![v7 length])
    {
      id v9 = SiriTTSTrainerGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "missing locale to download asset", buf, 2u);
      }
    }
    *(void *)buf = 0;
    NSString v19 = buf;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = sub_100009C04;
    BOOL v22 = sub_100009C14;
    id v23 = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100009C1C;
    v12[3] = &unk_100018B60;
    char v16 = buf;
    id v13 = v7;
    uint64_t v17 = a4;
    id v14 = v8;
    id v15 = a1;
    [a1 installedTrainingAssetsForLanguage:v13 name:v14 type:a4 reply:v12];
    id v10 = *((id *)v19 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void sub_100007678(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000776C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100007784(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![v3 count])
  {
    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    CFStringRef v27 = @"No asset available";
    id v14 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    id v15 = +[NSError errorWithDomain:@"com.apple.SiriTTSTrainingAgent" code:1 userInfo:v14];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v4 = [v3 firstObject];
  NSErrorUserInfoKey v5 = [v4 qualityVersion];
  signed int v6 = [v5 intValue];

  if (!v6)
  {
    uint64_t v16 = *(void *)(a1 + 32);
    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    CFStringRef v25 = @"Asset has no version information";
    id v15 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    uint64_t v17 = +[NSError errorWithDomain:@"com.apple.SiriTTSTrainingAgent" code:1 userInfo:v15];
    (*(void (**)(uint64_t, void *, void))(v16 + 16))(v16, v17, 0);

    goto LABEL_8;
  }
  id v7 = [v3 firstObject];
  id v8 = [v7 contentVersion];
  signed int v9 = [v8 intValue];

  id v10 = [v3 firstObject];
  id v11 = [v10 compatibilityVersion];
  signed int v12 = [v11 intValue];

  id v13 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 134218496;
    uint64_t v19 = v9;
    __int16 v20 = 2048;
    uint64_t v21 = v12;
    __int16 v22 = 2048;
    uint64_t v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "contentVersion=%ld, compatibilityVersion=%ld, assetQualityVersion=%ld", (uint8_t *)&v18, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_9:
}

void sub_100007A1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000081C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100008398(uint64_t a1)
{
  id v2 = (id)os_transaction_create();
  sub_100008400(*(void *)(a1 + 32), *(void **)(a1 + 40));
}

void sub_1000083EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100008400(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    if ([*(id *)(a1 + 64) tryLock])
    {
      getpid();
      if (proc_set_cpumon_params())
      {
        uint64_t v4 = SiriTTSTrainerGetLog();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v55 = 100;
          *(_WORD *)&v55[4] = 1024;
          *(_DWORD *)&v55[6] = 36000;
          _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Unable to set cpumon limit, percentage: %d, interval: %d", buf, 0xEu);
        }
      }
      NSErrorUserInfoKey v5 = SiriTTSTrainerGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "trainingSession", buf, 2u);
      }

      if (v3)
      {
        id v7 = +[TrainingTaskDatabase sharedInstance];
        id v8 = [v3 taskId];
        signed int v9 = [v7 isTaskInSubmittedQueue:v8];
        BOOL v10 = v9 == 0;

        if (v10)
        {
          id v11 = SiriTTSTrainerGetLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            uint64_t v37 = [v3 taskId];
            *(_DWORD *)buf = 138412290;
            *(void *)v55 = v37;
            _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Can't find task in Submitted queue, skip. taskId=%@", buf, 0xCu);
          }
        }
        else
        {
          id v11 = sub_10000CC74((void *)a1, v3);
          if (v11)
          {
            signed int v12 = SiriTTSTrainerGetLog();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Get asset path error.", buf, 2u);
            }

            id v13 = +[TrainingTaskDatabase sharedInstance];
            id v14 = [v11 code];
            id v15 = [v11 localizedDescription];
            [v13 addFailedTaskToFinishQueue:v3 errorCode:v14 description:v15];
          }
          else
          {
            uint64_t v38 = SiriTTSTrainerGetLog();
            os_signpost_id_t v39 = os_signpost_id_generate(v38);
            mach_absolute_time();

            uint64_t v40 = SiriTTSTrainerGetLog();
            uint64_t v41 = v40;
            if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
            {
              uint64_t v42 = [v3 taskId];
              *(_DWORD *)buf = 138412290;
              *(void *)v55 = v42;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v41, OS_SIGNPOST_INTERVAL_BEGIN, v39, "STT-Training-Interval", "%@", buf, 0xCu);
            }
            uint64_t v43 = SiriTTSTrainerGetLog();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              uint64_t v44 = [v3 taskId];
              *(_DWORD *)buf = 134218242;
              *(void *)v55 = v39;
              *(_WORD *)&v55[8] = 2112;
              v56 = v44;
              _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "#STTSP BEGIN [%lld]: STT-Training-Interval %@", buf, 0x16u);
            }
            sub_10000ABE0(a1, v3);
            uint64_t v45 = SiriTTSTrainerGetLog();
            os_signpost_id_t v46 = os_signpost_id_generate(v45);
            mach_absolute_time();

            uint64_t v47 = SiriTTSTrainerGetLog();
            unint64_t v48 = v47;
            if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
            {
              NSString v49 = [v3 taskId];
              *(_DWORD *)buf = 138412290;
              *(void *)v55 = v49;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v48, OS_SIGNPOST_INTERVAL_END, v46, "STT-Training-Interval", "%@", buf, 0xCu);
            }
            id v13 = SiriTTSTrainerGetLog();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              v50 = [v3 taskId];
              *(_DWORD *)buf = 134218242;
              *(void *)v55 = v46;
              *(_WORD *)&v55[8] = 2112;
              v56 = v50;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "#STTSP END [%lld]: STT-Training-Interval %@", buf, 0x16u);
            }
          }
LABEL_51:
        }
      }
      else
      {
        *(void *)&long long v6 = 138412290;
        long long v53 = v6;
        while (1)
        {
          uint64_t v17 = +[TrainingTaskDatabase sharedInstance];
          id v11 = [v17 getNextSubmittedTask];

          if (!v11) {
            break;
          }
          int v18 = sub_10000CC74((void *)a1, v11);
          if (v18)
          {
            uint64_t v19 = SiriTTSTrainerGetLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Get asset path error.", buf, 2u);
            }

            __int16 v20 = +[TrainingTaskDatabase sharedInstance];
            id v21 = [v18 code];
            __int16 v22 = [v18 localizedDescription];
            [v20 addFailedTaskToFinishQueue:v11 errorCode:v21 description:v22];
          }
          else
          {
            uint64_t v23 = SiriTTSTrainerGetLog();
            os_signpost_id_t v24 = os_signpost_id_generate(v23);
            mach_absolute_time();

            CFStringRef v25 = SiriTTSTrainerGetLog();
            NSErrorUserInfoKey v26 = v25;
            if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
            {
              CFStringRef v27 = [v11 taskId];
              *(_DWORD *)buf = v53;
              *(void *)v55 = v27;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "STT-Training-Interval", "%@", buf, 0xCu);
            }
            id v28 = SiriTTSTrainerGetLog();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              uint64_t v29 = [v11 taskId];
              *(_DWORD *)buf = 134218242;
              *(void *)v55 = v24;
              *(_WORD *)&v55[8] = 2112;
              v56 = v29;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "#STTSP BEGIN [%lld]: STT-Training-Interval %@", buf, 0x16u);
            }
            sub_10000ABE0(a1, v11);
            uint64_t v30 = SiriTTSTrainerGetLog();
            os_signpost_id_t v31 = os_signpost_id_generate(v30);
            mach_absolute_time();

            uint64_t v32 = SiriTTSTrainerGetLog();
            unint64_t v33 = v32;
            if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
            {
              unint64_t v34 = [v11 taskId];
              *(_DWORD *)buf = v53;
              *(void *)v55 = v34;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_END, v31, "STT-Training-Interval", "%@", buf, 0xCu);
            }
            uint64_t v35 = SiriTTSTrainerGetLog();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              uint64_t v36 = [v11 taskId];
              *(_DWORD *)buf = 134218242;
              *(void *)v55 = v31;
              *(_WORD *)&v55[8] = 2112;
              v56 = v36;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "#STTSP END [%lld]: STT-Training-Interval %@", buf, 0x16u);
            }
            if (*(unsigned char *)(a1 + 24))
            {
              id v13 = SiriTTSTrainerGetLog();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "trainingSession break due to AgentDeferred.", buf, 2u);
              }
              goto LABEL_51;
            }
          }
        }
      }
      v51 = SiriTTSTrainerGetLog();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "trainingSession end", buf, 2u);
      }

      getpid();
      if (proc_set_cpumon_defaults())
      {
        id v52 = SiriTTSTrainerGetLog();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "Unable to restore cpumon default", buf, 2u);
        }
      }
      [*(id *)(a1 + 64) unlock];
    }
    else
    {
      uint64_t v16 = SiriTTSTrainerGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "trainingSession is unable to lock, skip.", buf, 2u);
      }
    }
  }
}

void sub_100008CF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008E84(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  if (a1)
  {
    if (qword_10001D828 != -1) {
      dispatch_once(&qword_10001D828, &stru_100018B80);
    }
    long long v6 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v5 taskId];
      *(_DWORD *)buf = 138412290;
      __int16 v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Scheduling %@", buf, 0xCu);
    }
    id v8 = [v5 taskId];
    signed int v9 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.SiriTTSTrainingAgent.voice-training", v8];
    uint64_t v10 = _DASSchedulingPriorityUserInitiated;
    id v11 = +[NSDate dateWithTimeIntervalSinceNow:a3];
    signed int v12 = +[NSDate dateWithTimeIntervalSinceNow:a3 + 900.0];
    id v13 = +[_DASActivity activityWithName:v9 priority:v10 duration:14400 startingAfter:v11 startingBefore:v12];

    [v13 setHandlerQueue:*(void *)(a1 + 16)];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000D754;
    v19[3] = &unk_100018BD0;
    v19[4] = a1;
    id v14 = v5;
    id v20 = v14;
    [v13 setStartHandler:v19];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000DAC0;
    v17[3] = &unk_100018BD0;
    v17[4] = a1;
    id v15 = v14;
    id v18 = v15;
    [v13 setSuspendHandler:v17];
    [v13 setCpuIntensive:1];
    [v13 setMemoryIntensive:1];
    [v13 setRequiresPlugin:1];
    [v13 setAfterUserIsInactive:1];
    [(id)qword_10001D820 submitActivity:v13 inGroup:qword_10001D818];
    uint64_t v16 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v22 = v13;
      __int16 v23 = 2112;
      id v24 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Submitted DASActivity %@ for task %@", buf, 0x16u);
    }
  }
}

void sub_1000091C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000094A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000967C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000977C(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_100009B04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100009C04(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100009C14(uint64_t a1)
{
}

void sub_100009C1C(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = [v4 firstObject];
    uint64_t v6 = [v5 path];
    uint64_t v7 = *(void *)(a1[7] + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    signed int v9 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = a1[4];
      uint64_t v10 = a1[5];
      signed int v12 = +[NSNumber numberWithInteger:a1[8]];
      uint64_t v13 = *(void *)(*(void *)(a1[7] + 8) + 40);
      *(_DWORD *)buf = 138413058;
      uint64_t v24 = v11;
      __int16 v25 = 2112;
      uint64_t v26 = v10;
      __int16 v27 = 2112;
      id v28 = v12;
      __int16 v29 = 2112;
      uint64_t v30 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "found installed asset for locale:%@, name:%@, type:%@, path:%@", buf, 0x2Au);
    }
  }
  else
  {
    uint64_t v15 = a1[5];
    id v14 = (void *)a1[6];
    uint64_t v16 = (void *)a1[4];
    uint64_t v17 = a1[8];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100009E48;
    v18[3] = &unk_100018B60;
    uint64_t v19 = v16;
    id v20 = (id)a1[5];
    uint64_t v22 = a1[8];
    long long v21 = *((_OWORD *)a1 + 3);
    [v14 installableTrainingAssetsForLanguage:v19 name:v15 type:v17 reply:v18];

    signed int v9 = v19;
  }
}

void sub_100009E04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009E48(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      id v8 = +[NSNumber numberWithInteger:*(void *)(a1 + 64)];
      *(_DWORD *)buf = 138412802;
      uint64_t v35 = v7;
      __int16 v36 = 2112;
      uint64_t v37 = v6;
      __int16 v38 = 2112;
      os_signpost_id_t v39 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "found installable asset for locale:%@, name:%@, type:%@", buf, 0x20u);
    }
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    uint64_t v10 = *(void **)(a1 + 48);
    uint64_t v11 = [v4 firstObject];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10000A1E8;
    v29[3] = &unk_100018B10;
    id v30 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 64);
    id v31 = v12;
    uint64_t v33 = v13;
    id v14 = v9;
    uint64_t v32 = v14;
    [v10 installTrainingAsset:v11 reply:v29];

    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v15 = *(void **)(a1 + 48);
    uint64_t v17 = *(void **)(a1 + 32);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10000A3A8;
    v24[3] = &unk_100018B38;
    uint64_t v18 = *(void *)(a1 + 64);
    uint64_t v27 = *(void *)(a1 + 56);
    id v25 = v17;
    id v19 = *(id *)(a1 + 40);
    uint64_t v20 = *(void *)(a1 + 64);
    id v26 = v19;
    uint64_t v28 = v20;
    [v15 installedTrainingAssetsForLanguage:v25 name:v16 type:v18 reply:v24];
  }
  else
  {
    id v14 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = *(void *)(a1 + 32);
      uint64_t v21 = *(void *)(a1 + 40);
      __int16 v23 = +[NSNumber numberWithInteger:*(void *)(a1 + 64)];
      *(_DWORD *)buf = 138412802;
      uint64_t v35 = v22;
      __int16 v36 = 2112;
      uint64_t v37 = v21;
      __int16 v38 = 2112;
      os_signpost_id_t v39 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "asset not found for locale:%@, name:%@, type:%@", buf, 0x20u);
    }
  }
}

void sub_10000A150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A1E8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      dispatch_semaphore_t v9 = +[NSNumber numberWithInteger:*(void *)(a1 + 56)];
      int v13 = 138412802;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "install asset for locale:%@, name:%@, type:%@", (uint8_t *)&v13, 0x20u);
    }
  }
  else
  {
    uint64_t v6 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      id v12 = +[NSNumber numberWithInteger:*(void *)(a1 + 56)];
      int v13 = 138413058;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "install asset failed for locale:%@, name:%@, type:%@, error:%@", (uint8_t *)&v13, 0x2Au);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_10000A37C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A3A8(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = [v4 firstObject];
    uint64_t v6 = [v5 path];
    uint64_t v7 = *(void *)(a1[6] + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    dispatch_semaphore_t v9 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = a1[4];
      uint64_t v10 = a1[5];
      id v12 = +[NSNumber numberWithInteger:a1[7]];
      uint64_t v13 = *(void *)(*(void *)(a1[6] + 8) + 40);
      int v14 = 138413058;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      __int16 v19 = v12;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "install asset for locale:%@, name:%@, type:%@, path:%@", (uint8_t *)&v14, 0x2Au);
    }
  }
}

void sub_10000A4F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A760(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000A7D0(void *a1)
{
  id v1 = a1;
  id v2 = +[NSFileManager defaultManager];
  id v12 = 0;
  id v3 = [v2 attributesOfItemAtPath:v1 error:&v12];
  id v4 = v12;

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    uint64_t v6 = +[NSMutableDictionary dictionaryWithDictionary:v3];
    uint64_t v7 = +[NSNumber numberWithShort:493];
    [v6 setValue:v7 forKey:NSFilePosixPermissions];

    uint64_t v8 = +[NSFileManager defaultManager];
    id v11 = 0;
    [v8 setAttributes:v6 ofItemAtPath:v1 error:&v11];
    id v9 = v11;

    id v5 = v9;
  }

  return v5;
}

void sub_10000A904(_Unwind_Exception *a1)
{
  id v5 = v4;

  _Unwind_Resume(a1);
}

id sub_10000A94C(void *a1)
{
  id v1 = a1;
  id v2 = sub_10000A7D0(v1);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    char v24 = 0;
    id v4 = +[NSFileManager defaultManager];
    unsigned int v5 = [v4 fileExistsAtPath:v1 isDirectory:&v24];
    if (v24) {
      unsigned int v6 = v5;
    }
    else {
      unsigned int v6 = 0;
    }

    if (v6)
    {
      uint64_t v7 = +[NSFileManager defaultManager];
      id v23 = 0;
      uint64_t v8 = [v7 contentsOfDirectoryAtPath:v1 error:&v23];
      id v9 = v23;

      if (v9)
      {
        id v3 = v9;
      }
      else
      {
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v10 = v8;
        id v11 = [v10 countByEnumeratingWithState:&v19 objects:v26 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v20;
          while (2)
          {
            for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v20 != v12) {
                objc_enumerationMutation(v10);
              }
              uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
              v25[0] = v1;
              v25[1] = v14;
              uint64_t v15 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 2, (void)v19);
              __int16 v16 = +[NSString pathWithComponents:v15];

              uint64_t v17 = sub_10000A94C(v16);
              if (v17)
              {
                id v3 = v17;

                goto LABEL_20;
              }
            }
            id v11 = [v10 countByEnumeratingWithState:&v19 objects:v26 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        id v3 = 0;
      }
LABEL_20:
    }
    else
    {
      id v3 = 0;
    }
  }

  return v3;
}

void sub_10000AB74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000ABE0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v160 = a1;
  location = (id *)(a1 + 48);
  objc_storeWeak((id *)(a1 + 48), v3);
  if ([v3 taskStatus] != (id)6) {
    objc_msgSend(v3, "setRetryTimes:", (char *)objc_msgSend(v3, "retryTimes") + 1);
  }
  [v3 setTrainingStartTime:mach_absolute_time()];
  id v4 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [v3 taskId];
    unsigned int v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 taskStatus]);
    uint64_t v7 = [v3 agentTrainingAssetPath];
    uint64_t v8 = [v3 dataAssetPath];
    id v9 = [v3 agentInferenceAssetPath];
    id v10 = [v3 inferenceAssetPath];
    *(_DWORD *)buf = 138413826;
    os_signpost_id_t v181 = (os_signpost_id_t)v5;
    __int16 v182 = 2112;
    v183 = v6;
    __int16 v184 = 2112;
    v185 = v7;
    __int16 v186 = 2112;
    v187 = v8;
    __int16 v188 = 2112;
    v189 = v9;
    __int16 v190 = 2112;
    v191 = v10;
    __int16 v192 = 2048;
    id v193 = [v3 retryTimes];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Task begin: taskId=%@ taskStatus=%@ agentTrainingAssetPath=%@ dataAssetPath=%@ agentInferenceAssetPath=%@ inferenceAssetPath=%@, retryTimes=%ld", buf, 0x48u);
  }
  if ([v3 taskStatus] != (id)1
    && [v3 taskStatus] != (id)6
    && [v3 taskStatus] != (id)2
    || [v3 taskStatus] == (id)2 && (uint64_t)objc_msgSend(v3, "retryTimes") >= 11)
  {
    id v11 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v114 = [v3 taskId];
      v115 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 taskStatus]);
      *(_DWORD *)buf = 138412546;
      os_signpost_id_t v181 = (os_signpost_id_t)v114;
      __int16 v182 = 2112;
      v183 = v115;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unexpected task status, exit training. taskId=%@, taskStatus=%@", buf, 0x16u);
    }
    uint64_t v12 = +[TrainingTaskDatabase sharedInstance];
    [v12 addFailedTaskToFinishQueue:v3 errorCode:1001 description:@"Unexpected task status"];

    uint64_t v13 = +[STTCoreAnalyticsService sharedInstance];
    [v13 reportTask:v3];

    uint64_t v14 = SiriTTSTrainerGetLog();
    os_signpost_id_t v15 = os_signpost_id_generate(v14);
    mach_absolute_time();

    __int16 v16 = SiriTTSTrainerGetLog();
    uint64_t v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      __int16 v18 = [v3 taskId];
      *(_DWORD *)buf = 138412290;
      os_signpost_id_t v181 = (os_signpost_id_t)v18;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, v15, "STT-Training-Interval", "taskId=%@", buf, 0xCu);
    }
    long long v19 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      long long v20 = [v3 taskId];
      *(_DWORD *)buf = 134218242;
      os_signpost_id_t v181 = v15;
      __int16 v182 = 2112;
      v183 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "#STTSP END [%lld]: STT-Training-Interval taskId=%@", buf, 0x16u);
    }
    goto LABEL_73;
  }
  if ([v3 taskStatus] == (id)1)
  {
    long long v21 = +[TrainingTaskDatabase sharedInstance];
    [v21 updateTaskWithStatusToSubmittedQueue:v3 taskStatus:2];

    id v159 = v3;
    long long v22 = +[NSFileManager defaultManager];
    id v23 = [v159 inferenceAssetPath];
    id v168 = 0;
    id obj = [v22 contentsOfDirectoryAtPath:v23 error:&v168];
    long long v19 = v168;

    if (v19)
    {
      char v24 = SiriTTSTrainerGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v149 = [v159 taskId];
        v150 = [v159 inferenceAssetPath];
        *(_DWORD *)v169 = 138412802;
        v170 = v149;
        __int16 v171 = 2112;
        v172 = v150;
        __int16 v173 = 2112;
        v174 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "CopyAsset: taskId=%@ inferenceAssetPath: %@, error: %@", v169, 0x20u);
      }
LABEL_21:

      goto LABEL_22;
    }
    if ([obj count])
    {
      id v58 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v194 = NSLocalizedDescriptionKey;
      CFStringRef v195 = &stru_100018F40;
      v59 = +[NSDictionary dictionaryWithObjects:&v195 forKeys:&v194 count:1];
      long long v19 = [v58 initWithDomain:@"com.apple.SiriTTSTrainingAgent" code:300 userInfo:v59];

      v60 = SiriTTSTrainerGetLog();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = [v159 taskId];
        v62 = [v159 inferenceAssetPath];
        *(_DWORD *)v169 = 138412802;
        v170 = v61;
        __int16 v171 = 2112;
        v172 = v62;
        __int16 v173 = 2112;
        v174 = v19;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "CopyAsset: taskId=%@ folder is not empty: %@, error: %@", v169, 0x20u);
      }
    }
    else
    {
      v90 = +[NSFileManager defaultManager];
      v91 = [v159 agentInferenceAssetPath];
      id v167 = 0;
      v92 = [v90 contentsOfDirectoryAtPath:v91 error:&v167];
      long long v19 = v167;

      if (v19)
      {

        goto LABEL_23;
      }
      long long v165 = 0u;
      long long v166 = 0u;
      long long v163 = 0u;
      long long v164 = 0u;
      id obj = v92;
      id v120 = [obj countByEnumeratingWithState:&v163 objects:buf count:16];
      if (v120)
      {
        uint64_t v156 = *(void *)v164;
        while (2)
        {
          v121 = 0;
          id v155 = v120;
          do
          {
            if (*(void *)v164 != v156) {
              objc_enumerationMutation(obj);
            }
            uint64_t v122 = *(void *)(*((void *)&v163 + 1) + 8 * (void)v121);
            v157 = +[NSFileManager defaultManager];
            v123 = [v159 agentInferenceAssetPath];
            v179[0] = v123;
            v179[1] = v122;
            v124 = +[NSArray arrayWithObjects:v179 count:2];
            v125 = +[NSString pathWithComponents:v124];
            v126 = [v159 inferenceAssetPath];
            v178[0] = v126;
            v178[1] = v122;
            v127 = +[NSArray arrayWithObjects:v178 count:2];
            v128 = +[NSString pathWithComponents:v127];
            id v162 = 0;
            [v157 copyItemAtPath:v125 toPath:v128 error:&v162];
            id v129 = v162;

            if (v129) {
              goto LABEL_128;
            }
            v130 = [v159 inferenceAssetPath];
            v177[0] = v130;
            v177[1] = v122;
            v131 = +[NSArray arrayWithObjects:v177 count:2];
            v132 = +[NSString pathWithComponents:v131];
            sub_10000A7D0(v132);
            id v129 = (id)objc_claimAutoreleasedReturnValue();

            if (v129)
            {
LABEL_128:
              char v24 = v129;

              long long v19 = v24;
              goto LABEL_21;
            }
            v121 = (char *)v121 + 1;
          }
          while (v155 != v121);
          id v120 = [obj countByEnumeratingWithState:&v163 objects:buf count:16];
          if (v120) {
            continue;
          }
          break;
        }
      }

      v133 = SiriTTSTrainerGetLog();
      if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
      {
        v134 = [v159 taskId];
        v135 = [v159 agentInferenceAssetPath];
        v136 = [v159 inferenceAssetPath];
        *(_DWORD *)v169 = 138413058;
        v170 = v134;
        __int16 v171 = 2112;
        v172 = v135;
        __int16 v173 = 2112;
        v174 = v136;
        __int16 v175 = 2112;
        uint64_t v176 = 0;
        _os_log_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_DEFAULT, "CopyAsset: taskId=%@ copied existing output asset from %@ to %@ error: %@", v169, 0x2Au);
      }
      v137 = SiriTTSTrainerGetLog();
      if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
      {
        v138 = [v159 taskId];
        *(_DWORD *)v169 = 138412546;
        v170 = v138;
        __int16 v171 = 2112;
        v172 = 0;
        _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_DEFAULT, "CopyAsset: taskId=%@ update directory permission, error: %@", v169, 0x16u);
      }
      v139 = [v159 inferenceAssetPath];
      v140 = [v139 stringByAppendingString:@"/AssetData/fastspeech2"];
      long long v19 = sub_10000A94C(v140);

      v141 = SiriTTSTrainerGetLog();
      if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
      {
        v142 = [v159 taskId];
        *(_DWORD *)v169 = 138412546;
        v170 = v142;
        __int16 v171 = 2112;
        v172 = v19;
        _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_DEFAULT, "CopyAsset: taskId=%@ update fastspeech2 directory permission, error: %@", v169, 0x16u);
      }
      if (v19)
      {
LABEL_22:

LABEL_23:
LABEL_24:
        id v25 = SiriTTSTrainerGetLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v119 = [v159 taskId];
          *(_DWORD *)buf = 138412546;
          os_signpost_id_t v181 = (os_signpost_id_t)v119;
          __int16 v182 = 2112;
          v183 = v19;
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Copy asset error. taskId=%@, error=%@", buf, 0x16u);
        }
        id v26 = +[TrainingTaskDatabase sharedInstance];
        uint64_t v27 = [v19 localizedDescription];
        uint64_t v28 = +[NSString stringWithFormat:@"Copy asset error, %@", v27];
        [v26 addFailedTaskToFinishQueue:v159 errorCode:1002 description:v28];

        __int16 v29 = +[STTCoreAnalyticsService sharedInstance];
        [v29 reportTask:v159];

        goto LABEL_73;
      }
      v143 = [v159 inferenceAssetPath];
      v144 = [v143 stringByAppendingString:@"/AssetData/wavernn"];
      long long v19 = sub_10000A94C(v144);

      v60 = SiriTTSTrainerGetLog();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v145 = [v159 taskId];
        *(_DWORD *)v169 = 138412546;
        v170 = v145;
        __int16 v171 = 2112;
        v172 = v19;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "CopyAsset: taskId=%@ update wavernn directory permission, error: %@", v169, 0x16u);
      }
    }

    if (v19) {
      goto LABEL_24;
    }
  }
  else
  {
    id v30 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = [v3 taskId];
      uint64_t v32 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 taskStatus]);
      uint64_t v33 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 trainingStatus]);
      *(_DWORD *)buf = 138412802;
      os_signpost_id_t v181 = (os_signpost_id_t)v31;
      __int16 v182 = 2112;
      v183 = v32;
      __int16 v184 = 2112;
      v185 = v33;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Resume from pause state. taskId=%@, taskStatus=%@, trainingStatus=%@", buf, 0x20u);
    }
    unint64_t v34 = +[TrainingTaskDatabase sharedInstance];
    [v34 updateTaskWithStatusToSubmittedQueue:v3 taskStatus:2];

    uint64_t v35 = +[STTCoreAnalyticsService sharedInstance];
    [v35 reportTask:v3];
  }
  id v36 = objc_alloc((Class)SiriTTSTrainer);
  uint64_t v37 = [v3 agentTrainingAssetPath];
  __int16 v38 = [v3 dataAssetPath];
  os_signpost_id_t v39 = [v3 inferenceAssetPath];
  uint64_t v40 = [v3 taskId];
  long long v19 = [v36 initWithPaths:v37 dataAssetPath:v38 inferenceAssetPath:v39 taskId:v40];

  id WeakRetained = objc_loadWeakRetained(location);
  [WeakRetained setCurrentTrainer:v19];

  uint64_t v42 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v43 = [v3 taskId];
    *(_DWORD *)buf = 138412290;
    os_signpost_id_t v181 = (os_signpost_id_t)v43;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Task: taskId=%@ start_preprocess", buf, 0xCu);
  }
  if (*(unsigned char *)(v160 + 24)) {
    goto LABEL_33;
  }
  id v54 = objc_loadWeakRetained(location);
  if ((uint64_t)[v54 trainingStatus] <= 0)
  {

    goto LABEL_75;
  }
  id v55 = objc_loadWeakRetained(location);
  if ([v55 trainingStatus] != (id)1)
  {

    goto LABEL_33;
  }
  id v56 = objc_loadWeakRetained(location);
  unsigned __int8 v57 = [v56 isCurrentTrainingStageDone];

  if (v57)
  {
LABEL_33:
    uint64_t v44 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v45 = [v3 taskId];
      *(_DWORD *)buf = 138412290;
      os_signpost_id_t v181 = (os_signpost_id_t)v45;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Task: taskId=%@ skip start_preprocess", buf, 0xCu);
    }
    goto LABEL_36;
  }
LABEL_75:
  id v85 = objc_loadWeakRetained(location);
  [v85 setTrainingStatus:1];

  v86 = [v19 start_preprocess:v160];
  if (v86)
  {
    v87 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
    {
      v151 = [v3 taskId];
      *(_DWORD *)buf = 138412546;
      os_signpost_id_t v181 = (os_signpost_id_t)v151;
      __int16 v182 = 2048;
      v183 = v86;
      _os_log_error_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, "TaskError: taskId=%@ start_preprocess error, errorCode=%ld", buf, 0x16u);
    }
    v88 = +[TrainingTaskDatabase sharedInstance];
    [v88 addFailedTaskToFinishQueue:v3 errorCode:1003 description:@"Error in starting preprocess"];

    v89 = +[STTCoreAnalyticsService sharedInstance];
    [v89 reportTask:v3];

    goto LABEL_73;
  }
LABEL_36:
  os_signpost_id_t v46 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v47 = [v3 taskId];
    *(_DWORD *)buf = 138412290;
    os_signpost_id_t v181 = (os_signpost_id_t)v47;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Task: taskId=%@ start_train", buf, 0xCu);
  }
  if (![v3 taskMode])
  {
    v63 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      v64 = [v3 taskId];
      *(_DWORD *)buf = 138412290;
      os_signpost_id_t v181 = (os_signpost_id_t)v64;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Task: taskId=%@ running partial task mode", buf, 0xCu);
    }
    if (*(unsigned char *)(v160 + 24)) {
      goto LABEL_61;
    }
    id v93 = objc_loadWeakRetained(location);
    if ((uint64_t)[v93 trainingStatus] <= 1)
    {

LABEL_83:
      id v94 = objc_loadWeakRetained(location);
      [v94 setTrainingStatus:2];

      v95 = +[STTCoreAnalyticsService sharedInstance];
      [v95 reportTask:v3];

      v96 = [v19 start_train:1 delegate:v160];
      if (!v96) {
        goto LABEL_64;
      }
      v97 = SiriTTSTrainerGetLog();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
      {
        v152 = [v3 taskId];
        *(_DWORD *)buf = 138412546;
        os_signpost_id_t v181 = (os_signpost_id_t)v152;
        __int16 v182 = 2048;
        v183 = v96;
        _os_log_error_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, "TaskError: taskId=%@ AcousticModel training error, errorCode=%ld", buf, 0x16u);
      }
      goto LABEL_86;
    }
    id v111 = objc_loadWeakRetained(location);
    if ([v111 trainingStatus] == (id)2)
    {
      id v112 = objc_loadWeakRetained(location);
      unsigned __int8 v113 = [v112 isCurrentTrainingStageDone];

      if ((v113 & 1) == 0) {
        goto LABEL_83;
      }
    }
    else
    {
    }
LABEL_61:
    id v52 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v65 = [v3 taskId];
      *(_DWORD *)buf = 138412290;
      os_signpost_id_t v181 = (os_signpost_id_t)v65;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Task: taskId=%@ skip AcousticModel training", buf, 0xCu);
    }
    goto LABEL_63;
  }
  if ([v3 taskMode] != (id)1)
  {
LABEL_64:
    v66 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      v67 = [v3 taskId];
      v68 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 taskStatus]);
      v69 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 trainingStatus]);
      *(_DWORD *)buf = 138412802;
      os_signpost_id_t v181 = (os_signpost_id_t)v67;
      __int16 v182 = 2112;
      v183 = v68;
      __int16 v184 = 2112;
      v185 = v69;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Task: taskId=%@ end_train, taskStatus=%@, trainingStatus=%@", buf, 0x20u);
    }
    [v3 timeIntervalSinceTrainingStart];
    double v71 = v70;
    [v3 totalTrainingTime];
    [v3 setTotalTrainingTime:v71 + v72];
    if (*(unsigned char *)(v160 + 24))
    {
      v73 = +[TrainingTaskDatabase sharedInstance];
      [v73 updateTaskWithStatusToSubmittedQueue:v3 taskStatus:6];

      v74 = +[STTCoreAnalyticsService sharedInstance];
      [v74 reportTask:v3];

      v75 = SiriTTSTrainerGetLog();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        v76 = [v3 taskId];
        *(_DWORD *)buf = 138412290;
        os_signpost_id_t v181 = (os_signpost_id_t)v76;
        _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Task: taskId=%@ is in pause status, wait for next cycle to continue.", buf, 0xCu);
      }
    }
    else
    {
      v77 = +[TrainingTaskDatabase sharedInstance];
      [v77 addTaskToFinishedQueueWithStatus:v3 status:5];

      v75 = +[STTCoreAnalyticsService sharedInstance];
      [v75 reportTask:v3];
    }

    [v3 timeIntervalSinceTrainingStart];
    v79 = v78;
    v80 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      v81 = [v3 taskId];
      v82 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 taskStatus]);
      v83 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 trainingStatus]);
      [v3 totalTrainingTime];
      *(_DWORD *)buf = 138413314;
      os_signpost_id_t v181 = (os_signpost_id_t)v81;
      __int16 v182 = 2112;
      v183 = v82;
      __int16 v184 = 2112;
      v185 = v83;
      __int16 v186 = 2048;
      v187 = v79;
      __int16 v188 = 2048;
      v189 = v84;
      _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "Task done: taskId=%@, taskStatus=%@, trainingStatus=%@, currentTrainingTime=%f, totalTrainingTime=%f", buf, 0x34u);
    }
    objc_storeWeak(location, 0);
    goto LABEL_73;
  }
  unint64_t v48 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    NSString v49 = [v3 taskId];
    *(_DWORD *)buf = 138412290;
    os_signpost_id_t v181 = (os_signpost_id_t)v49;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Task: taskId=%@ running full task mode", buf, 0xCu);
  }
  if (*(unsigned char *)(v160 + 24)) {
    goto LABEL_43;
  }
  id v100 = objc_loadWeakRetained(location);
  if ((uint64_t)[v100 trainingStatus] <= 1)
  {

LABEL_90:
    id v101 = objc_loadWeakRetained(location);
    [v101 setTrainingStatus:2];

    v102 = +[STTCoreAnalyticsService sharedInstance];
    [v102 reportTask:v3];

    v103 = [v19 start_train:1 delegate:v160];
    if (!v103) {
      goto LABEL_46;
    }
    v97 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
    {
      v153 = [v3 taskId];
      *(_DWORD *)buf = 138412546;
      os_signpost_id_t v181 = (os_signpost_id_t)v153;
      __int16 v182 = 2048;
      v183 = v103;
      _os_log_error_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, "TaskError: taskId=%@ AcousticModel training error, errorCode=%ld", buf, 0x16u);
    }
LABEL_86:

    v98 = +[TrainingTaskDatabase sharedInstance];
    [v98 addFailedTaskToFinishQueue:v3 errorCode:1006 description:@"Error in AcousticModel training"];

    v99 = +[STTCoreAnalyticsService sharedInstance];
    [v99 reportTask:v3];

    goto LABEL_73;
  }
  id v116 = objc_loadWeakRetained(location);
  if ([v116 trainingStatus] == (id)2)
  {
    id v117 = objc_loadWeakRetained(location);
    unsigned __int8 v118 = [v117 isCurrentTrainingStageDone];

    if ((v118 & 1) == 0) {
      goto LABEL_90;
    }
  }
  else
  {
  }
LABEL_43:
  v50 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    v51 = [v3 taskId];
    *(_DWORD *)buf = 138412290;
    os_signpost_id_t v181 = (os_signpost_id_t)v51;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Task: taskId=%@ skip AcousticModel training", buf, 0xCu);
  }
LABEL_46:
  if (*(unsigned char *)(v160 + 24)) {
    goto LABEL_47;
  }
  id v104 = objc_loadWeakRetained(location);
  if ((uint64_t)[v104 trainingStatus] > 2)
  {
    id v146 = objc_loadWeakRetained(location);
    if ([v146 trainingStatus] == (id)3)
    {
      id v147 = objc_loadWeakRetained(location);
      unsigned __int8 v148 = [v147 isCurrentTrainingStageDone];

      if ((v148 & 1) == 0) {
        goto LABEL_96;
      }
    }
    else
    {
    }
LABEL_47:
    id v52 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      long long v53 = [v3 taskId];
      *(_DWORD *)buf = 138412290;
      os_signpost_id_t v181 = (os_signpost_id_t)v53;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Task: taskId=%@ skip WaveModel training", buf, 0xCu);
    }
LABEL_63:

    goto LABEL_64;
  }

LABEL_96:
  id v105 = objc_loadWeakRetained(location);
  [v105 setTrainingStatus:3];

  v106 = +[STTCoreAnalyticsService sharedInstance];
  [v106 reportTask:v3];

  v107 = [v19 start_train:2 delegate:v160];
  if (!v107) {
    goto LABEL_64;
  }
  v108 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
  {
    v154 = [v3 taskId];
    *(_DWORD *)buf = 138412546;
    os_signpost_id_t v181 = (os_signpost_id_t)v154;
    __int16 v182 = 2048;
    v183 = v107;
    _os_log_error_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_ERROR, "TaskError: taskId=%@ WaveModel training error, errorCode=%ld", buf, 0x16u);
  }
  v109 = +[TrainingTaskDatabase sharedInstance];
  [v109 addFailedTaskToFinishQueue:v3 errorCode:1006 description:@"Error in WaveModel training"];

  v110 = +[STTCoreAnalyticsService sharedInstance];
  [v110 reportTask:v3];

LABEL_73:
}

void sub_10000C628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

id sub_10000CC74(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [v3 trainingAssetPath];
    unsigned int v6 = [v3 inferenceAssetPath];
    uint64_t v7 = [v3 agentTrainingAssetPath];
    uint64_t v8 = [v3 agentInferenceAssetPath];
    *(_DWORD *)buf = 138413058;
    id v57 = v5;
    __int16 v58 = 2112;
    v59 = v6;
    __int16 v60 = 2112;
    v61 = v7;
    __int16 v62 = 2112;
    v63 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "trainingAssetPath=%@, inferenceAssetPath=%@, agentTrainingAssetPath=%@, agentInferenceAssetPath=%@", buf, 0x2Au);
  }
  id v9 = [v3 agentTrainingAssetPath];
  if (v9)
  {
    id v10 = [v3 agentTrainingAssetPath];
    if ([v10 length]
      && ([v3 agentInferenceAssetPath], (id v11 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v12 = [v3 agentInferenceAssetPath];
      BOOL v13 = [v12 length] == 0;

      if (!v13)
      {
        char v47 = 0;
        uint64_t v14 = +[NSFileManager defaultManager];
        os_signpost_id_t v15 = [v3 agentTrainingAssetPath];
        if ([v14 fileExistsAtPath:v15 isDirectory:&v47])
        {
          __int16 v16 = +[NSFileManager defaultManager];
          uint64_t v17 = [v3 agentTrainingAssetPath];
          unsigned int v18 = [v16 fileExistsAtPath:v17 isDirectory:&v47];

          if (v18)
          {
            long long v19 = SiriTTSTrainerGetLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Previous training asset exists, keep using the previous asset", buf, 2u);
            }
            id v20 = 0;
LABEL_38:

            goto LABEL_31;
          }
        }
        else
        {
        }
        uint64_t v45 = SiriTTSTrainerGetLog();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "agentTrainingAssetPath/agentInferenceAssetPath is set, but path doesn't exist, asset could be purged.", buf, 2u);
        }

        id v46 = objc_alloc((Class)NSError);
        NSErrorUserInfoKey v54 = NSLocalizedDescriptionKey;
        CFStringRef v55 = @"Previous Training asset is not available.";
        long long v19 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
        id v20 = [v46 initWithDomain:@"com.apple.SiriTTSTrainingAgent" code:1004 userInfo:v19];
        goto LABEL_38;
      }
    }
    else
    {
    }
  }
  long long v21 = [v3 trainingAssetPath];
  BOOL v22 = [v21 length] == 0;

  if (v22)
  {
    char v24 = +[NSBundle mainBundle];
    id v25 = [v24 resourcePath];
    id v52 = v25;
    id v26 = +[NSArray arrayWithObjects:&v52 count:1];
    uint64_t v27 = +[NSString pathWithComponents:v26];
    v53[0] = v27;
    v53[1] = @"Asset";
    uint64_t v28 = +[NSArray arrayWithObjects:v53 count:2];
    __int16 v29 = +[NSString pathWithComponents:v28];

    char v47 = 0;
    id v30 = +[NSFileManager defaultManager];
    unsigned int v31 = [v30 fileExistsAtPath:v29 isDirectory:&v47];
    if (v47) {
      unsigned int v32 = v31;
    }
    else {
      unsigned int v32 = 0;
    }

    if (v32)
    {
      id v23 = v29;
      uint64_t v33 = SiriTTSTrainerGetLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v57 = v23;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Internal asset bundle is used here. path=%@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v33 = [v3 assetLanguage];
      unint64_t v34 = [v3 assetName];
      sub_1000074C4(a1, v33, v34, 0);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v23 = [v3 trainingAssetPath];
  }
  if (v23)
  {
    v51[0] = v23;
    v51[1] = @"training_asset";
    uint64_t v35 = +[NSArray arrayWithObjects:v51 count:2];
    id v36 = +[NSString pathWithComponents:v35];
    [v3 setAgentTrainingAssetPath:v36];

    v50[0] = v23;
    v50[1] = @"inference_asset";
    uint64_t v37 = +[NSArray arrayWithObjects:v50 count:2];
    __int16 v38 = +[NSString pathWithComponents:v37];
    [v3 setAgentInferenceAssetPath:v38];

    objc_msgSend(v3, "setAssetVersion:", +[SiriTTSTrainingAgentUtils getAssetQualityVersionFromAsset:](SiriTTSTrainingAgentUtils, "getAssetQualityVersionFromAsset:", v23));
    os_signpost_id_t v39 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v40 = [v3 agentTrainingAssetPath];
      uint64_t v41 = [v3 agentInferenceAssetPath];
      *(_DWORD *)buf = 138412546;
      id v57 = v40;
      __int16 v58 = 2112;
      v59 = v41;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "agentTrainingAssetPath=%@, agentInferenceAssetPath=%@", buf, 0x16u);
    }
    id v20 = 0;
  }
  else
  {
    uint64_t v42 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "assetBundlePath is invalid", buf, 2u);
    }

    id v43 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
    CFStringRef v49 = @"Training asset is not available.";
    os_signpost_id_t v39 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    id v20 = [v43 initWithDomain:@"com.apple.SiriTTSTrainingAgent" code:1004 userInfo:v39];
  }

LABEL_31:

  return v20;
}

void sub_10000D3A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000D56C(uint64_t a1)
{
  if (a1)
  {
    id v1 = +[NSProcessInfo processInfo];
    id v2 = [v1 thermalState];

    switch((unint64_t)v2)
    {
      case 0uLL:
        id v3 = SiriTTSTrainerGetLog();
        if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        __int16 v9 = 0;
        id v4 = "NSProcessInfoThermalStateNominal";
        unsigned int v5 = (uint8_t *)&v9;
        break;
      case 1uLL:
        id v3 = SiriTTSTrainerGetLog();
        if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        __int16 v8 = 0;
        id v4 = "NSProcessInfoThermalStateFair";
        unsigned int v5 = (uint8_t *)&v8;
        break;
      case 2uLL:
        id v3 = SiriTTSTrainerGetLog();
        if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        __int16 v7 = 0;
        id v4 = "NSProcessInfoThermalStateSerious";
        unsigned int v5 = (uint8_t *)&v7;
        break;
      case 3uLL:
        id v3 = SiriTTSTrainerGetLog();
        if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_12;
        }
        __int16 v6 = 0;
        id v4 = "NSProcessInfoThermalStateCritical";
        unsigned int v5 = (uint8_t *)&v6;
        break;
      default:
        return;
    }
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
LABEL_12:
  }
}

void sub_10000D6C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000D6E0(id a1)
{
  uint64_t v1 = +[_DASScheduler sharedScheduler];
  id v2 = (void *)qword_10001D820;
  qword_10001D820 = v1;

  qword_10001D818 = +[_DASActivityGroup groupWithName:@"com.apple.SiriTTSTrainingAgent.voice-training" maxConcurrent:1];

  _objc_release_x1();
}

void sub_10000D754(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [v3 name];
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting DASActivity %@", buf, 0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  __int16 v7 = *(NSObject **)(v6 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D8C8;
  block[3] = &unk_100018BA8;
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = *(id *)(a1 + 40);
  id v8 = v3;
  dispatch_async(v7, block);
}

void sub_10000D8A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000D8C8(uint64_t a1)
{
  id v2 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) name];
    int v11 = 138412290;
    id v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Running DASActivity %@", (uint8_t *)&v11, 0xCu);
  }
  id v4 = (void *)os_transaction_create();
  sub_10000D56C(*(void *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    *(unsigned char *)(v5 + 24) = 0;
    uint64_t v6 = *(void *)(a1 + 40);
  }
  else
  {
    uint64_t v6 = 0;
  }
  sub_100008400(v6, *(void **)(a1 + 48));
  [(id)qword_10001D820 activityCompleted:*(void *)(a1 + 32)];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7 && *(unsigned char *)(v7 + 24))
  {
    id v8 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = [*(id *)(a1 + 32) name];
      id v10 = [*(id *)(a1 + 48) taskId];
      int v11 = 138412546;
      id v12 = v9;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Continue DASActivity %@, taskId=%@", (uint8_t *)&v11, 0x16u);
    }
    sub_100008E84(*(void *)(a1 + 40), *(void *)(a1 + 48), 600.0);
  }
}

void sub_10000DA80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000DAC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 name];
    int v20 = 138412290;
    long long v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Suspending DASActivity %@", (uint8_t *)&v20, 0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    *(unsigned char *)(v6 + 24) = 1;
    uint64_t v7 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v7 = 0;
  }
  sub_10000D56C(v7);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v9;
  if (v8)
  {
    if (v9)
    {
      int v11 = IOPSDrawingUnlimitedPower();
      if ([v10 taskStatus] == (id)2)
      {
        id v12 = SiriTTSTrainerGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v13 = [v10 taskId];
          int v20 = 138412546;
          long long v21 = v13;
          __int16 v22 = 1024;
          int v23 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "pauseTask: taskId=%@ powerSourceIsUnlimited=%d", (uint8_t *)&v20, 0x12u);
        }
        uint64_t v14 = [v10 currentTrainer];
        BOOL v15 = v14 == 0;

        if (!v15)
        {
          if (v11 && [v10 trainingStatus] == (id)2)
          {
            __int16 v16 = SiriTTSTrainerGetLog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v20) = 0;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "pauseTask: Not going to pause Acoustic model training stage, as power is still available.", (uint8_t *)&v20, 2u);
            }
          }
          else
          {
            __int16 v16 = [v10 currentTrainer];
            [v16 pause];
          }
        }
        uint64_t v17 = SiriTTSTrainerGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          long long v19 = [v10 taskId];
          int v20 = 138412290;
          long long v21 = v19;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "pauseTask: taskId=%@ pausing", (uint8_t *)&v20, 0xCu);
        }
      }
      else
      {
        uint64_t v17 = SiriTTSTrainerGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v18 = [v10 taskId];
          int v20 = 138412290;
          long long v21 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "pauseTask: taskId=%@, no need to pause the task as it is not in running state.", (uint8_t *)&v20, 0xCu);
        }
      }
    }
    else
    {
      uint64_t v17 = SiriTTSTrainerGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "pauseTask: task is nil", (uint8_t *)&v20, 2u);
      }
    }
  }
}

void sub_10000DDEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000DE68(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  xpc_activity_state_t v4 = state;
  if (!state)
  {
    id v10 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "com.apple.SiriTTSTrainingAgent.xpc_checkin check-in", (uint8_t *)&v14, 2u);
    }

    uint64_t v6 = xpc_activity_copy_criteria(v2);
    if (v6)
    {
      int v11 = SiriTTSTrainerGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        id v12 = "com.apple.SiriTTSTrainingAgent.xpc_checkin check-in resume";
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v14, 2u);
      }
    }
    else
    {
      uint64_t v6 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v6, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_5_MIN);
      xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REPEATING, 1);
      xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_ALLOW_BATTERY, 0);
      xpc_dictionary_set_string(v6, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
      xpc_activity_set_criteria(v2, v6);
      int v11 = SiriTTSTrainerGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        id v12 = "com.apple.SiriTTSTrainingAgent.xpc_checkin check-in done";
        goto LABEL_19;
      }
    }

    goto LABEL_21;
  }
  if (state != 2)
  {
    uint64_t v6 = SiriTTSTrainerGetLog();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    int v14 = 134217984;
    xpc_activity_state_t v15 = v4;
    uint64_t v7 = "Unexpected xpc_activity state, got: %ld";
    uint64_t v8 = v6;
    uint32_t v9 = 12;
    goto LABEL_16;
  }
  if (!xpc_activity_set_state(v2, 5))
  {
    uint64_t v5 = SiriTTSTrainerGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "xpc activity com.apple.SiriTTSTrainingAgent.xpc_checkin, failed to set XPC_ACTIVITY_STATE_DONE.", (uint8_t *)&v14, 2u);
    }
  }
  uint64_t v6 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    uint64_t v7 = "xpc activity com.apple.SiriTTSTrainingAgent.xpc_checkin run";
    uint64_t v8 = v6;
    uint32_t v9 = 2;
LABEL_16:
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v14, v9);
  }
LABEL_21:

  __int16 v13 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "xpc_checkin activity exit", (uint8_t *)&v14, 2u);
  }
}

void sub_10000E178(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t start()
{
  uint64_t v1 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "SiriTTSTrainingAgent entering sandbox...", buf, 2u);
  }

  sub_100006004();
  id v2 = +[NSFileManager defaultManager];
  id v3 = [v2 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.accessibility.voicebanking"];

  xpc_activity_state_t v4 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SiriTTSTrainingAgent started...", v11, 2u);
  }

  uint64_t v5 = objc_alloc_init(SiriTTSTrainingAgent);
  uint64_t v6 = v5;
  if (v5) {
    uint64_t v5 = (SiriTTSTrainingAgent *)v5->_xpcListener;
  }
  [(SiriTTSTrainingAgent *)v5 resume];
  uint64_t v7 = +[NSRunLoop currentRunLoop];
  [v7 run];

  uint64_t v8 = SiriTTSTrainerGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SiriTTSTrainingAgent exit...", v10, 2u);
  }

  return 0;
}

void sub_10000E3B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000E3D8()
{
  self;
  if (qword_10001D838 != -1) {
    dispatch_once(&qword_10001D838, &stru_100018C30);
  }
  uint64_t v0 = (void *)qword_10001D830;

  return v0;
}

void sub_10000E430(id a1)
{
  uint64_t v1 = +[NSFileManager defaultManager];
  id v10 = [v1 URLsForDirectory:5 inDomains:1];

  id v2 = [v10 firstObject];
  id v3 = [v2 URLByAppendingPathComponent:@"com.apple.SiriTTSTrainingAgent"];
  xpc_activity_state_t v4 = +[NSFileManager defaultManager];
  uint64_t v5 = [v3 relativePath];
  unsigned __int8 v6 = [v4 fileExistsAtPath:v5];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = +[NSFileManager defaultManager];
    [v7 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:0];
  }
  uint64_t v8 = [v3 URLByAppendingPathComponent:@"task_database.plist"];
  uint32_t v9 = (void *)qword_10001D830;
  qword_10001D830 = v8;
}

void sub_10000E640(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = *(NSObject **)(a1 + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000E708;
    block[3] = &unk_100018C58;
    void block[4] = a1;
    id v9 = v5;
    id v10 = v6;
    dispatch_sync(v7, block);
  }
}

void sub_10000E708(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2) {
    id v3 = *(void **)(v2 + 8);
  }
  else {
    id v3 = 0;
  }
  [v3 setObject:a1[5] forKey:a1[6]];
  xpc_activity_state_t v4 = (void *)a1[4];
  if (v4) {
    xpc_activity_state_t v4 = (void *)v4[1];
  }
  id v5 = v4;
  sub_10000E3D8();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 writeToURL:v6 atomically:1];
}

void *sub_10000E7A0(void *a1, void *a2)
{
  id v3 = a2;
  xpc_activity_state_t v4 = v3;
  if (a1)
  {
    uint64_t v10 = 0;
    int v11 = &v10;
    uint64_t v12 = 0x3032000000;
    __int16 v13 = sub_10000E8C0;
    int v14 = sub_10000E8D0;
    id v15 = 0;
    id v5 = a1[2];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000E8D8;
    block[3] = &unk_100018C80;
    id v9 = &v10;
    void block[4] = a1;
    id v8 = v3;
    dispatch_sync(v5, block);
    a1 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
  }

  return a1;
}

uint64_t sub_10000E8C0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000E8D0(uint64_t a1)
{
}

void sub_10000E8D8(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2) {
    uint64_t v2 = (void *)v2[1];
  }
  uint64_t v3 = a1[5];
  uint64_t v7 = v2;
  uint64_t v4 = [v7 objectForKey:v3];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_10000E9E4(id a1)
{
  qword_10001D840 = objc_alloc_init(TrainingTaskDatabase);

  _objc_release_x1();
}

uint64_t sub_10000EB90(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v25 = a3;
  if (a1)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v6 = v5;
    uint64_t v7 = (char *)[v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v7)
    {
      id v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v28;
      while (2)
      {
        int v11 = 0;
        int v23 = v9;
        char v24 = &v9[(void)v8];
        do
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8 * (void)v11);
          uint64_t v13 = objc_opt_class();
          id v26 = 0;
          int v14 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v13 fromData:v12 error:&v26];
          id v15 = v26;
          if (v15) {
            BOOL v16 = 1;
          }
          else {
            BOOL v16 = v14 == 0;
          }
          if (v16)
          {
            uint64_t v17 = v15;
          }
          else
          {
            unsigned int v18 = [v14 taskId];
            long long v19 = [v25 taskId];
            unsigned __int8 v20 = [v18 isEqualToString:v19];

            if (v20)
            {
              uint64_t v21 = (uint64_t)&v11[(void)v23];
              goto LABEL_19;
            }
          }
          ++v11;
        }
        while (v8 != v11);
        id v8 = (char *)[v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
        id v9 = v24;
        if (v8) {
          continue;
        }
        break;
      }
      uint64_t v21 = -1;
    }
    else
    {
      uint64_t v21 = -1;
    }
LABEL_19:
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v21;
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t dispatch thunk of InternalSettings.defaultToNonDiscretionaryDownloads.getter()
{
  return dispatch thunk of InternalSettings.defaultToNonDiscretionaryDownloads.getter();
}

uint64_t static InternalSettings.shared.getter()
{
  return static InternalSettings.shared.getter();
}

uint64_t type metadata accessor for InternalSettings()
{
  return type metadata accessor for InternalSettings();
}

uint64_t os_log(_:dso:log:type:_:)()
{
  return os_log(_:dso:log:type:_:)();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return String.hasPrefix(_:)(a1._countAndFlagsBits, a1._object);
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

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t SiriTTSTrainingAsset.languageComponent.getter()
{
  return SiriTTSTrainingAsset.languageComponent.getter();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
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

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t IOPSDrawingUnlimitedPower()
{
  return _IOPSDrawingUnlimitedPower();
}

uint64_t SiriTTSTrainerGetLog()
{
  return _SiriTTSTrainerGetLog();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
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

int *__error(void)
{
  return ___error();
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

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

pid_t getpid(void)
{
  return _getpid();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainAutorelease(id a1)
{
  return _a1;
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

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t proc_set_cpumon_defaults()
{
  return _proc_set_cpumon_defaults();
}

uint64_t proc_set_cpumon_params()
{
  return _proc_set_cpumon_params();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
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

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

uint64_t tailspin_dump_output_with_options()
{
  return _tailspin_dump_output_with_options();
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

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
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

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLsForDirectory_inDomains_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLsForDirectory:inDomains:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend_activityCompleted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityCompleted:");
}

id objc_msgSend_activityWithName_priority_duration_startingAfter_startingBefore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityWithName:priority:duration:startingAfter:startingBefore:");
}

id objc_msgSend_addFailedTaskToFinishQueue_errorCode_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFailedTaskToFinishQueue:errorCode:description:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addTaskToFinishedQueueWithStatus_status_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTaskToFinishedQueueWithStatus:status:");
}

id objc_msgSend_addTaskToSubmittedQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTaskToSubmittedQueue:");
}

id objc_msgSend_agentInferenceAssetPath(void *a1, const char *a2, ...)
{
  return _[a1 agentInferenceAssetPath];
}

id objc_msgSend_agentTrainingAssetPath(void *a1, const char *a2, ...)
{
  return _[a1 agentTrainingAssetPath];
}

id objc_msgSend_appId(void *a1, const char *a2, ...)
{
  return _[a1 appId];
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assetLanguage(void *a1, const char *a2, ...)
{
  return _[a1 assetLanguage];
}

id objc_msgSend_assetName(void *a1, const char *a2, ...)
{
  return _[a1 assetName];
}

id objc_msgSend_assetVersion(void *a1, const char *a2, ...)
{
  return _[a1 assetVersion];
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_cleanUpQueue(void *a1, const char *a2, ...)
{
  return _[a1 cleanUpQueue];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_collectTailspin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectTailspin:");
}

id objc_msgSend_collectTailspinToFile_minTimestamp_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectTailspinToFile:minTimestamp:completion:");
}

id objc_msgSend_compatibilityVersion(void *a1, const char *a2, ...)
{
  return _[a1 compatibilityVersion];
}

id objc_msgSend_containerURLForSecurityApplicationGroupIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerURLForSecurityApplicationGroupIdentifier:");
}

id objc_msgSend_contentVersion(void *a1, const char *a2, ...)
{
  return _[a1 contentVersion];
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_copyItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyItemAtPath:toPath:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createFileAtPath:contents:attributes:");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_currentTaskStatusProgressValue(void *a1, const char *a2, ...)
{
  return _[a1 currentTaskStatusProgressValue];
}

id objc_msgSend_currentTrainer(void *a1, const char *a2, ...)
{
  return _[a1 currentTrainer];
}

id objc_msgSend_dataAssetPath(void *a1, const char *a2, ...)
{
  return _[a1 dataAssetPath];
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfURL:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 fileDescriptor];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileHandleForUpdatingAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileHandleForUpdatingAtPath:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_forceToStart(void *a1, const char *a2, ...)
{
  return _[a1 forceToStart];
}

id objc_msgSend_getAllTasks(void *a1, const char *a2, ...)
{
  return _[a1 getAllTasks];
}

id objc_msgSend_getAssetQualityVersionFromAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAssetQualityVersionFromAsset:");
}

id objc_msgSend_getNextSubmittedTask(void *a1, const char *a2, ...)
{
  return _[a1 getNextSubmittedTask];
}

id objc_msgSend_getSubmittedTaskQueueSize(void *a1, const char *a2, ...)
{
  return _[a1 getSubmittedTaskQueueSize];
}

id objc_msgSend_getSubmittedTasks(void *a1, const char *a2, ...)
{
  return _[a1 getSubmittedTasks];
}

id objc_msgSend_getSuperTask(void *a1, const char *a2, ...)
{
  return _[a1 getSuperTask];
}

id objc_msgSend_getTaskById_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTaskById:");
}

id objc_msgSend_groupWithName_maxConcurrent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupWithName:maxConcurrent:");
}

id objc_msgSend_inferenceAssetPath(void *a1, const char *a2, ...)
{
  return _[a1 inferenceAssetPath];
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithPaths_dataAssetPath_inferenceAssetPath_taskId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPaths:dataAssetPath:inferenceAssetPath:taskId:");
}

id objc_msgSend_initWithTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTask:");
}

id objc_msgSend_installTrainingAsset_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installTrainingAsset:reply:");
}

id objc_msgSend_installableTrainingAssetsForLanguage_name_type_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installableTrainingAssetsForLanguage:name:type:reply:");
}

id objc_msgSend_installedTrainingAssetsForLanguage_name_type_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installedTrainingAssetsForLanguage:name:type:reply:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_isCurrentTrainingStageDone(void *a1, const char *a2, ...)
{
  return _[a1 isCurrentTrainingStageDone];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isTaskInSubmittedQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTaskInSubmittedQueue:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mapTaskStatusToTaskEventString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapTaskStatusToTaskEventString:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_normalizedProgressValue(void *a1, const char *a2, ...)
{
  return _[a1 normalizedProgressValue];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithShort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithShort:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return _[a1 pause];
}

id objc_msgSend_postTaskStatusNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postTaskStatusNotification:");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_qualityVersion(void *a1, const char *a2, ...)
{
  return _[a1 qualityVersion];
}

id objc_msgSend_relativePath(void *a1, const char *a2, ...)
{
  return _[a1 relativePath];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 remoteObjectProxy];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_reportRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportRequest:");
}

id objc_msgSend_reportTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportTask:");
}

id objc_msgSend_resourcePath(void *a1, const char *a2, ...)
{
  return _[a1 resourcePath];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_retryTimes(void *a1, const char *a2, ...)
{
  return _[a1 retryTimes];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_setAfterUserIsInactive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAfterUserIsInactive:");
}

id objc_msgSend_setAgentInferenceAssetPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAgentInferenceAssetPath:");
}

id objc_msgSend_setAgentTrainingAssetPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAgentTrainingAssetPath:");
}

id objc_msgSend_setAssetVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssetVersion:");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setCpuIntensive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCpuIntensive:");
}

id objc_msgSend_setCurrentTaskStatusProgressValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentTaskStatusProgressValue:");
}

id objc_msgSend_setCurrentTrainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentTrainer:");
}

id objc_msgSend_setDataAssetPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataAssetPath:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setError:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setForceToStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForceToStart:");
}

id objc_msgSend_setHandlerQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandlerQueue:");
}

id objc_msgSend_setInferenceAssetPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInferenceAssetPath:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setMemoryIntensive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMemoryIntensive:");
}

id objc_msgSend_setNormalizedProgressValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNormalizedProgressValue:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRequiresPlugin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresPlugin:");
}

id objc_msgSend_setRetryTimes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRetryTimes:");
}

id objc_msgSend_setStartHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartHandler:");
}

id objc_msgSend_setSuspendHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuspendHandler:");
}

id objc_msgSend_setTaskId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskId:");
}

id objc_msgSend_setTaskMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskMode:");
}

id objc_msgSend_setTaskStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskStatus:");
}

id objc_msgSend_setTaskSubmissionDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskSubmissionDate:");
}

id objc_msgSend_setTotalTaskStatusProgressValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTotalTaskStatusProgressValue:");
}

id objc_msgSend_setTotalTrainingTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTotalTrainingTime:");
}

id objc_msgSend_setTrainingAssetPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrainingAssetPath:");
}

id objc_msgSend_setTrainingStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrainingStartTime:");
}

id objc_msgSend_setTrainingStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrainingStatus:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return _[a1 sharedScheduler];
}

id objc_msgSend_start_preprocess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "start_preprocess:");
}

id objc_msgSend_start_train_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "start_train:delegate:");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _[a1 stop];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_submitActivity_inGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitActivity:inGroup:");
}

id objc_msgSend_submitTaskToSubmittedQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitTaskToSubmittedQueue:");
}

id objc_msgSend_taskId(void *a1, const char *a2, ...)
{
  return _[a1 taskId];
}

id objc_msgSend_taskMode(void *a1, const char *a2, ...)
{
  return _[a1 taskMode];
}

id objc_msgSend_taskStatus(void *a1, const char *a2, ...)
{
  return _[a1 taskStatus];
}

id objc_msgSend_thermalState(void *a1, const char *a2, ...)
{
  return _[a1 thermalState];
}

id objc_msgSend_timeIntervalSinceSubmission(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceSubmission];
}

id objc_msgSend_timeIntervalSinceTrainingStart(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceTrainingStart];
}

id objc_msgSend_totalTaskStatusProgressValue(void *a1, const char *a2, ...)
{
  return _[a1 totalTaskStatusProgressValue];
}

id objc_msgSend_totalTrainingTime(void *a1, const char *a2, ...)
{
  return _[a1 totalTrainingTime];
}

id objc_msgSend_trainingAssetPath(void *a1, const char *a2, ...)
{
  return _[a1 trainingAssetPath];
}

id objc_msgSend_trainingStatus(void *a1, const char *a2, ...)
{
  return _[a1 trainingStatus];
}

id objc_msgSend_tryLock(void *a1, const char *a2, ...)
{
  return _[a1 tryLock];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_updateTaskToSubmittedQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTaskToSubmittedQueue:");
}

id objc_msgSend_updateTaskWithStatusToSubmittedQueue_taskStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTaskWithStatusToSubmittedQueue:taskStatus:");
}

id objc_msgSend_updateTaskWithTrainingStatusToSubmittedQueue_trainingStatus_currentProgressValue_totalProgressValue_normalizedProgressValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTaskWithTrainingStatusToSubmittedQueue:trainingStatus:currentProgressValue:totalProgressValue:normalizedProgressValue:");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:atomically:");
}