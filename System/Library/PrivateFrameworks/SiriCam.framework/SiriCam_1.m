uint64_t specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  BOOL v17;
  char v18;
  unint64_t v19;
  char v20;
  void *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  long long v30;

  specialized LazyMapSequence.makeIterator()(a1, a2, a3, &v30);
  swift_bridgeObjectRetain();
  swift_retain();
  v7 = specialized LazyMapSequence.Iterator.next()();
  if (v8)
  {
    v10 = v7;
    v11 = v8;
    v12 = v9;
    while (1)
    {
      v13 = (void *)*a5;
      v15 = specialized __RawDictionaryStorage.find<A>(_:)(v10, v11);
      v16 = v13[2];
      v17 = (v14 & 1) == 0;
      if (__OFADD__(v16, v17)) {
        break;
      }
      v18 = v14;
      if (v13[3] >= v16 + v17)
      {
        if ((a4 & 1) == 0)
        {
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, Int>);
          _NativeDictionary.copy()();
        }
      }
      else
      {
        specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)();
        v19 = specialized __RawDictionaryStorage.find<A>(_:)(v10, v11);
        if ((v18 & 1) != (v20 & 1)) {
          goto LABEL_17;
        }
        v15 = v19;
      }
      v21 = (void *)*a5;
      if (v18)
      {
        v22 = *(void *)(v21[7] + 8 * v15);
        swift_bridgeObjectRelease();
        *(void *)(v21[7] + 8 * v15) = v22;
      }
      else
      {
        v21[(v15 >> 6) + 8] |= 1 << v15;
        v23 = (uint64_t *)(v21[6] + 16 * v15);
        *v23 = v10;
        v23[1] = v11;
        *(void *)(v21[7] + 8 * v15) = v12;
        v24 = v21[2];
        v25 = __OFADD__(v24, 1);
        v26 = v24 + 1;
        if (v25) {
          goto LABEL_16;
        }
        v21[2] = v26;
      }
      v10 = specialized LazyMapSequence.Iterator.next()();
      v11 = v27;
      v12 = v28;
      a4 = 1;
      if (!v27) {
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
  }
  else
  {
LABEL_14:
    swift_bridgeObjectRelease();
    swift_release();
    outlined consume of [String : MLFeatureValue].Iterator._Variant();
    return swift_release();
  }
  return result;
}

uint64_t specialized closure #1 in Dictionary.merge(_:uniquingKeysWith:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *a1 = a4;
  swift_bridgeObjectRetain();
  return a2;
}

uint64_t specialized thunk for @escaping @callee_guaranteed (@in_guaranteed A, @in_guaranteed B) -> (@out A, @out B)@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = specialized closure #1 in Dictionary.merge(_:uniquingKeysWith:)(&v6, *a1, a1[1], a1[2]);
  uint64_t v4 = v6;
  *a2 = result;
  a2[1] = v5;
  a2[2] = v4;
  return result;
}

uint64_t specialized LazyMapSequence.makeIterator()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
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

uint64_t specialized LazyMapSequence.Iterator.next()()
{
  void (*v11)(uint64_t *__return_ptr, void *);
  uint64_t result;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  void v20[3];

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
    uint64_t v10 = *(void *)(*(void *)(v1 + 56) + 8 * v6);
    v0[3] = v4;
    v0[4] = v5;
    v11 = (void (*)(uint64_t *__return_ptr, void *))v0[5];
    v20[0] = v8;
    v20[1] = v9;
    v20[2] = v10;
    swift_bridgeObjectRetain();
    v11(&v19, v20);
    swift_bridgeObjectRelease();
    return v19;
  }
  v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    v14 = (unint64_t)(v0[2] + 64) >> 6;
    if (v13 < v14)
    {
      v15 = v0[1];
      v16 = *(void *)(v15 + 8 * v13);
      if (v16)
      {
LABEL_7:
        uint64_t v5 = (v16 - 1) & v16;
        unint64_t v6 = __clz(__rbit64(v16)) + (v13 << 6);
        int64_t v4 = v13;
        goto LABEL_3;
      }
      v17 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v14)
      {
        v16 = *(void *)(v15 + 8 * v17);
        if (v16)
        {
LABEL_10:
          v13 = v17;
          goto LABEL_7;
        }
        int64_t v4 = v3 + 2;
        if (v3 + 3 < v14)
        {
          v16 = *(void *)(v15 + 8 * (v3 + 3));
          if (v16)
          {
            v13 = v3 + 3;
            goto LABEL_7;
          }
          v17 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v14)
          {
            v16 = *(void *)(v15 + 8 * v17);
            if (v16) {
              goto LABEL_10;
            }
            v13 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v14)
            {
              v16 = *(void *)(v15 + 8 * v13);
              if (v16) {
                goto LABEL_7;
              }
              int64_t v4 = v14 - 1;
              v18 = v3 + 6;
              while (v18 < v14)
              {
                v16 = *(void *)(v15 + 8 * v18++);
                if (v16)
                {
                  v13 = v18 - 1;
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

uint64_t sub_1C9D8A894()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t partial apply for closure #1 in PersonalContextFeatureExtractor.gatherCommonSignals()(uint64_t a1)
{
  return closure #1 in PersonalContextFeatureExtractor.gatherCommonSignals()(a1, v1);
}

void partial apply for closure #1 in closure #1 in PersonalContextFeatureExtractor.gatherCommonSignals()(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t OUTLINED_FUNCTION_1_25()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2_26()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_5_16()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_6_18()
{
  return v0;
}

void OUTLINED_FUNCTION_7_21(unint64_t a1@<X8>)
{
  *(void *)(v5 + ((a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << a1;
  unint64_t v6 = (void *)(v2[6] + 16 * a1);
  *unint64_t v6 = v4;
  v6[1] = v3;
  *(void *)(v2[7] + 8 * a1) = v1;
  ++v2[2];
}

uint64_t OUTLINED_FUNCTION_8_15()
{
  *(void *)(v2 - 88) = v0;
  return v1;
}

uint64_t OUTLINED_FUNCTION_10_13()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t OUTLINED_FUNCTION_13_13()
{
  return 0x746E65696C63;
}

uint64_t OUTLINED_FUNCTION_14_14()
{
  *(void *)(v0 - 72) = *(void *)(v0 - 88);
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_16_10()
{
  return MEMORY[0x1F4185370](v1, v0, v2);
}

uint64_t OUTLINED_FUNCTION_18_13()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_21_9@<X0>(uint64_t a1@<X8>)
{
  return specialized Dictionary.subscript.getter(0xD000000000000013, (a1 - 32) | 0x8000000000000000, v1);
}

uint64_t OUTLINED_FUNCTION_22_9(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 16) = 1;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_23_10()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_30_6()
{
  *(void *)(v2 - 88) = v0;
  return v1;
}

uint64_t OUTLINED_FUNCTION_33_4@<X0>(uint64_t a1@<X8>)
{
  return specialized UnsafeMutablePointer.assign(repeating:count:)(0, (unint64_t)(a1 + 63) >> 6, v1);
}

uint64_t AffinityRankEnum.rawValue.getter(unsigned __int8 a1)
{
  return 2 - a1;
}

void *static AffinityRankFeatureExtractor.extractedFeatures.getter()
{
  return &outlined read-only object #0 of static AffinityRankFeatureExtractor.extractedFeatures.getter;
}

uint64_t AffinityRankKey.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t static AffinityRankKey.== infix(_:_:)(void *a1, void *a2)
{
  BOOL v2 = *a1 == *a2 && a1[1] == a2[1];
  if (!v2 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
    return 0;
  }
  type metadata accessor for AffinityRankKey();
  return static UUID.== infix(_:_:)();
}

Swift::Int AffinityRankKey.hashValue.getter()
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance AffinityRankKey()
{
  return Hasher._finalize()();
}

uint64_t AffinityRankFeatureExtractor.init(actions:)(uint64_t a1)
{
  uint64_t v160 = type metadata accessor for AffinityRankKey();
  OUTLINED_FUNCTION_1_2();
  uint64_t v150 = v2;
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_7_6();
  v169 = v4;
  OUTLINED_FUNCTION_7_14();
  uint64_t v148 = type metadata accessor for Siri_Nlu_External_UUID();
  OUTLINED_FUNCTION_1_2();
  uint64_t v164 = v5;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_7_6();
  uint64_t v147 = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  uint64_t v9 = OUTLINED_FUNCTION_11_1(v8);
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_7_6();
  v153 = v10;
  OUTLINED_FUNCTION_7_14();
  uint64_t v11 = type metadata accessor for UUID();
  OUTLINED_FUNCTION_1_2();
  uint64_t v13 = v12;
  uint64_t v15 = MEMORY[0x1F4188790](v14);
  v17 = (char *)&v140 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_10_0();
  v166 = v18;
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_10_0();
  uint64_t v155 = v20;
  OUTLINED_FUNCTION_2_5();
  uint64_t v22 = MEMORY[0x1F4188790](v21);
  v24 = (char *)&v140 - v23;
  MEMORY[0x1F4188790](v22);
  v143 = (char *)&v140 - v25;
  uint64_t v26 = OUTLINED_FUNCTION_7_14();
  uint64_t v27 = type metadata accessor for CamUSOParse(v26);
  uint64_t v28 = OUTLINED_FUNCTION_11_1(v27);
  MEMORY[0x1F4188790](v28);
  OUTLINED_FUNCTION_7_6();
  uint64_t v146 = v29;
  uint64_t v30 = OUTLINED_FUNCTION_7_14();
  uint64_t v31 = type metadata accessor for CamParse(v30);
  OUTLINED_FUNCTION_1_3();
  MEMORY[0x1F4188790](v32);
  OUTLINED_FUNCTION_7_6();
  uint64_t v151 = v33;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (flowHandlerId: String, parseId: UUID, affinityScore: Int)?);
  uint64_t v35 = OUTLINED_FUNCTION_11_1(v34);
  MEMORY[0x1F4188790](v35);
  OUTLINED_FUNCTION_5_2();
  uint64_t v159 = v36;
  OUTLINED_FUNCTION_2_5();
  uint64_t v38 = MEMORY[0x1F4188790](v37);
  v40 = (uint64_t *)((char *)&v140 - v39);
  MEMORY[0x1F4188790](v38);
  v42 = (uint64_t *)((char *)&v140 - v41);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (flowHandlerId: String, parseId: UUID, affinityScore: Int));
  OUTLINED_FUNCTION_1_2();
  uint64_t v157 = v44;
  MEMORY[0x1F4188790](v45);
  OUTLINED_FUNCTION_5_2();
  uint64_t v154 = v46;
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x1F4188790](v47);
  OUTLINED_FUNCTION_10_0();
  uint64_t v156 = v48;
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x1F4188790](v49);
  OUTLINED_FUNCTION_10_0();
  uint64_t v162 = v50;
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x1F4188790](v51);
  v152 = (void (**)(char *, uint64_t, uint64_t))((char *)&v140 - v52);
  OUTLINED_FUNCTION_7_14();
  uint64_t v165 = type metadata accessor for ActionCandidate();
  uint64_t v53 = MEMORY[0x1F4188790](a1);
  v56 = (uint64_t *)((char *)&v140 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v57 = *(void *)(v53 + 16);
  uint64_t v167 = v11;
  uint64_t v168 = v43;
  v161 = v40;
  v163 = v24;
  uint64_t v149 = v13;
  if (v57)
  {
    uint64_t v58 = v53 + ((*(unsigned __int8 *)(v54 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80));
    uint64_t v158 = *(void *)(v54 + 72);
    uint64_t v144 = v164 + 8;
    v142 = (void (**)(char *, uint64_t, uint64_t))(v13 + 32);
    uint64_t v140 = v53;
    swift_bridgeObjectRetain();
    uint64_t v164 = MEMORY[0x1E4FBC860];
    uint64_t v59 = v151;
    uint64_t v145 = v31;
    do
    {
      _s7SiriCam0B5ParseOWOcTm_2(v58, (uint64_t)v56, (void (*)(void))type metadata accessor for ActionCandidate);
      _s7SiriCam0B5ParseOWOcTm_2((uint64_t)v56 + *(int *)(v165 + 20), v59, (void (*)(void))type metadata accessor for CamParse);
      if (swift_getEnumCaseMultiPayload())
      {
        OUTLINED_FUNCTION_12_13((uint64_t)v42, 1);
        _s7SiriCam0B8USOParseVWOhTm_0(v59, (void (*)(void))type metadata accessor for CamParse);
      }
      else
      {
        uint64_t v60 = v146;
        outlined init with take of CamUSOParse(v59, v146);
        Siri_Nlu_External_UserParse.id.getter();
        static ConversionUtils.convertProtoToUuid(protoUuid:)();
        uint64_t v61 = (uint64_t)v153;
        OUTLINED_FUNCTION_18_1();
        v62();
        _s7SiriCam0B8USOParseVWOhTm_0(v60, (void (*)(void))type metadata accessor for CamUSOParse);
        if (__swift_getEnumTagSinglePayload(v61, 1, v11) == 1)
        {
          outlined destroy of RRDataSourceMetadataValue?(v61, &demangling cache variable for type metadata for UUID?);
          OUTLINED_FUNCTION_12_13((uint64_t)v42, 1);
        }
        else
        {
          v63 = *v142;
          v64 = v143;
          (*v142)(v143, v61, v11);
          uint64_t v65 = v167;
          v66 = (char *)v42 + *(int *)(v168 + 48);
          uint64_t v67 = *(int *)(v168 + 64);
          uint64_t v68 = v56[1];
          void *v42 = *v56;
          v42[1] = v68;
          v63(v66, (uint64_t)v64, v65);
          uint64_t v43 = v168;
          *(void *)((char *)v42 + v67) = *(void *)((char *)v56 + *(int *)(v165 + 24));
          v40 = v161;
          OUTLINED_FUNCTION_12_13((uint64_t)v42, 0);
          uint64_t v11 = v167;
          swift_bridgeObjectRetain();
        }
        uint64_t v59 = v151;
      }
      _s7SiriCam0B8USOParseVWOhTm_0((uint64_t)v56, (void (*)(void))type metadata accessor for ActionCandidate);
      if (__swift_getEnumTagSinglePayload((uint64_t)v42, 1, v43) == 1)
      {
        outlined destroy of RRDataSourceMetadataValue?((uint64_t)v42, &demangling cache variable for type metadata for (flowHandlerId: String, parseId: UUID, affinityScore: Int)?);
      }
      else
      {
        v69 = v152;
        outlined init with take of (flowHandlerId: String, parseId: UUID, affinityScore: Int)?((uint64_t)v42, (uint64_t)v152, &demangling cache variable for type metadata for (flowHandlerId: String, parseId: UUID, affinityScore: Int));
        outlined init with take of (flowHandlerId: String, parseId: UUID, affinityScore: Int)?((uint64_t)v69, v162, &demangling cache variable for type metadata for (flowHandlerId: String, parseId: UUID, affinityScore: Int));
        if (swift_isUniquelyReferenced_nonNull_native()) {
          uint64_t v70 = v164;
        }
        else {
          uint64_t v70 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        unint64_t v71 = *(void *)(v70 + 16);
        if (v71 >= *(void *)(v70 + 24) >> 1) {
          uint64_t v70 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        *(void *)(v70 + 16) = v71 + 1;
        OUTLINED_FUNCTION_3_24();
        uint64_t v164 = v72;
        outlined init with take of (flowHandlerId: String, parseId: UUID, affinityScore: Int)?(v162, v72 + v73 + *(void *)(v74 + 72) * v71, &demangling cache variable for type metadata for (flowHandlerId: String, parseId: UUID, affinityScore: Int));
        uint64_t v11 = v167;
        uint64_t v43 = v168;
      }
      v58 += v158;
      --v57;
    }
    while (v57);
    swift_bridgeObjectRelease_n();
    v24 = v163;
    uint64_t v75 = v164;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v75 = MEMORY[0x1E4FBC860];
  }
  lazy protocol witness table accessor for type AffinityRankKey and conformance AffinityRankKey((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x1E4F27990]);
  v76 = (void *)Dictionary.init(dictionaryLiteral:)();
  uint64_t v77 = *(void *)(v75 + 16);
  uint64_t v164 = v75;
  uint64_t v78 = v149;
  uint64_t v158 = v77;
  if (v77)
  {
    uint64_t v148 = (uint64_t)v17;
    OUTLINED_FUNCTION_3_24();
    uint64_t v80 = v75 + v79;
    uint64_t v165 = v78 + 16;
    uint64_t v151 = *(void *)(v81 + 72);
    v152 = (void (**)(char *, uint64_t, uint64_t))(v78 + 32);
    swift_bridgeObjectRetain();
    uint64_t v82 = v156;
    v153 = (void (**)(uint64_t, uint64_t))(v78 + 8);
    while (1)
    {
      uint64_t v162 = v77;
      outlined init with copy of (flowHandlerId: String, parseId: UUID, affinityScore: Int)(v80, v82);
      uint64_t v83 = *(int *)(v43 + 48);
      uint64_t v84 = v154 + v83;
      uint64_t v85 = *(int *)(v43 + 64);
      v86 = *(void (**)(uint64_t, char *, uint64_t))v165;
      (*(void (**)(uint64_t, uint64_t, uint64_t))v165)(v154 + v83, v82 + v83, v11);
      int64_t v87 = *(void *)(v82 + v85);
      (*v152)(v24, v84, v11);
      uint64_t v88 = v155;
      v86(v155, v24, v11);
      if (!v76[2]) {
        goto LABEL_25;
      }
      specialized __RawDictionaryStorage.find<A>(_:)();
      if (v90) {
        int64_t v91 = *(void *)(v76[7] + 8 * v89);
      }
      else {
LABEL_25:
      }
        int64_t v91 = 0x8000000000000000;
      v92 = *v153;
      (*v153)(v88, v11);
      v86((uint64_t)v166, v163, v11);
      int64_t v93 = v87 <= v91 ? v91 : v87;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v170 = v76;
      specialized __RawDictionaryStorage.find<A>(_:)();
      uint64_t v97 = v76[2];
      BOOL v98 = (v96 & 1) == 0;
      Swift::Int v99 = v97 + v98;
      if (__OFADD__(v97, v98)) {
        break;
      }
      unint64_t v100 = v95;
      char v101 = v96;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<UUID, Int>);
      Swift::Bool v102 = _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v99);
      uint64_t v11 = v167;
      if (v102)
      {
        specialized __RawDictionaryStorage.find<A>(_:)();
        if ((v101 & 1) != (v104 & 1)) {
          goto LABEL_67;
        }
        unint64_t v100 = v103;
      }
      v76 = v170;
      if (v101)
      {
        *(void *)(v170[7] + 8 * v100) = v93;
      }
      else
      {
        v170[(v100 >> 6) + 8] |= 1 << v100;
        v86(v76[6] + *(void *)(v149 + 72) * v100, (char *)v166, v11);
        *(void *)(v76[7] + 8 * v100) = v93;
        uint64_t v105 = v76[2];
        BOOL v106 = __OFADD__(v105, 1);
        uint64_t v107 = v105 + 1;
        if (v106) {
          goto LABEL_66;
        }
        v76[2] = v107;
      }
      swift_bridgeObjectRelease();
      v92((uint64_t)v166, v11);
      v24 = v163;
      v92((uint64_t)v163, v11);
      uint64_t v82 = v156;
      outlined destroy of RRDataSourceMetadataValue?(v156, &demangling cache variable for type metadata for (flowHandlerId: String, parseId: UUID, affinityScore: Int));
      v80 += v151;
      uint64_t v77 = v162 - 1;
      uint64_t v43 = v168;
      if (v162 == 1)
      {
        swift_bridgeObjectRelease();
        v17 = (char *)v148;
        v40 = v161;
        uint64_t v78 = v149;
        uint64_t v77 = v158;
        goto LABEL_39;
      }
    }
  }
  else
  {
LABEL_39:
    lazy protocol witness table accessor for type AffinityRankKey and conformance AffinityRankKey(&lazy protocol witness table cache variable for type AffinityRankKey and conformance AffinityRankKey, (void (*)(uint64_t))type metadata accessor for AffinityRankKey);
    v108 = (void *)Dictionary.init(dictionaryLiteral:)();
    unint64_t v109 = 0;
    uint64_t v165 = v78 + 16;
    v166 = (void (**)(char *, char *, uint64_t))(v78 + 32);
    v163 = (char *)(v78 + 8);
    uint64_t v110 = v159;
    while (1)
    {
      if (v109 == v77)
      {
        uint64_t v111 = 1;
        unint64_t v109 = v77;
      }
      else
      {
        if (v109 >= *(void *)(v164 + 16)) {
          goto LABEL_64;
        }
        OUTLINED_FUNCTION_3_24();
        outlined init with copy of (flowHandlerId: String, parseId: UUID, affinityScore: Int)(v113 + v112 + *(void *)(v114 + 72) * v109, v110);
        uint64_t v111 = 0;
        ++v109;
      }
      OUTLINED_FUNCTION_12_13(v110, v111);
      outlined init with take of (flowHandlerId: String, parseId: UUID, affinityScore: Int)?(v110, (uint64_t)v40, &demangling cache variable for type metadata for (flowHandlerId: String, parseId: UUID, affinityScore: Int)?);
      if (__swift_getEnumTagSinglePayload((uint64_t)v40, 1, v43) == 1)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t result = v141;
        *(void *)(v141 + 16) = v108;
        return result;
      }
      uint64_t v115 = *v40;
      uint64_t v116 = v40[1];
      v117 = (char *)v40 + *(int *)(v43 + 48);
      uint64_t v118 = *(void *)((char *)v40 + *(int *)(v43 + 64));
      (*v166)(v17, v117, v11);
      if (!v76[2]) {
        break;
      }
      specialized __RawDictionaryStorage.find<A>(_:)();
      if ((v120 & 1) == 0) {
        goto LABEL_61;
      }
      v121 = v17;
      uint64_t v122 = *(void *)(v76[7] + 8 * v119);
      v123 = v169;
      v124 = v121;
      (*(void (**)(char *))v165)((char *)v169 + *(int *)(v160 + 20));
      void *v123 = v115;
      v123[1] = v116;
      char v125 = swift_isUniquelyReferenced_nonNull_native();
      v170 = v108;
      unint64_t v126 = specialized __RawDictionaryStorage.find<A>(_:)(v123);
      uint64_t v128 = v108[2];
      BOOL v129 = (v127 & 1) == 0;
      Swift::Int v130 = v128 + v129;
      if (__OFADD__(v128, v129)) {
        goto LABEL_62;
      }
      unint64_t v131 = v126;
      char v132 = v127;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<AffinityRankKey, UInt32>);
      if (_NativeDictionary.ensureUnique(isUnique:capacity:)(v125, v130))
      {
        unint64_t v133 = specialized __RawDictionaryStorage.find<A>(_:)(v169);
        if ((v132 & 1) != (v134 & 1)) {
          goto LABEL_67;
        }
        unint64_t v131 = v133;
      }
      if (v118 == v122) {
        int v135 = 2;
      }
      else {
        int v135 = 1;
      }
      v108 = v170;
      if (v132)
      {
        *(_DWORD *)(v170[7] + 4 * v131) = v135;
        v17 = v124;
        v40 = v161;
      }
      else
      {
        v170[(v131 >> 6) + 8] |= 1 << v131;
        _s7SiriCam0B5ParseOWOcTm_2((uint64_t)v169, v108[6] + *(void *)(v150 + 72) * v131, (void (*)(void))type metadata accessor for AffinityRankKey);
        *(_DWORD *)(v108[7] + 4 * v131) = v135;
        uint64_t v136 = v108[2];
        BOOL v106 = __OFADD__(v136, 1);
        uint64_t v137 = v136 + 1;
        v40 = v161;
        if (v106) {
          goto LABEL_65;
        }
        v17 = v124;
        v108[2] = v137;
      }
      swift_bridgeObjectRelease();
      _s7SiriCam0B8USOParseVWOhTm_0((uint64_t)v169, (void (*)(void))type metadata accessor for AffinityRankKey);
      uint64_t v11 = v167;
      OUTLINED_FUNCTION_18_1();
      v138();
      uint64_t v77 = v158;
      uint64_t v110 = v159;
      uint64_t v43 = v168;
    }
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
  }
  __break(1u);
LABEL_64:
  __break(1u);
LABEL_65:
  __break(1u);
LABEL_66:
  __break(1u);
LABEL_67:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t AffinityRankFeatureExtractor.extract(usoParse:flowHandlerId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v26 = a2;
  uint64_t v27 = a3;
  uint64_t v5 = type metadata accessor for AffinityRankKey();
  OUTLINED_FUNCTION_1_3();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_5_17();
  uint64_t v7 = type metadata accessor for Siri_Nlu_External_UUID();
  OUTLINED_FUNCTION_1_2();
  uint64_t v9 = v8;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_3_12();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  uint64_t v12 = OUTLINED_FUNCTION_11_1(v11);
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for UUID();
  OUTLINED_FUNCTION_1_2();
  uint64_t v17 = v16;
  MEMORY[0x1F4188790](v18);
  uint64_t v20 = (char *)v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  Siri_Nlu_External_UserParse.id.getter();
  static ConversionUtils.convertProtoToUuid(protoUuid:)();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v3, v7);
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15) == 1)
  {
    outlined destroy of RRDataSourceMetadataValue?((uint64_t)v14, &demangling cache variable for type metadata for UUID?);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v20, v14, v15);
    uint64_t v22 = *(void *)(v25[1] + 16);
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(&v4[*(int *)(v5 + 20)], v20, v15);
    uint64_t v23 = v27;
    *(void *)uint64_t v4 = v26;
    *((void *)v4 + 1) = v23;
    swift_bridgeObjectRetain();
    unint64_t v24 = specialized Dictionary.subscript.getter(v4, v22);
    _s7SiriCam0B8USOParseVWOhTm_0((uint64_t)v4, (void (*)(void))type metadata accessor for AffinityRankKey);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v15);
    if ((v24 & 0x100000000) != 0) {
      return 0;
    }
    else {
      return v24;
    }
  }
}

uint64_t AffinityRankFeatureExtractor.extractImpl(from:)(uint64_t *a1)
{
  uint64_t v1 = AffinityRankFeatureExtractor.extractFromAction(from:)(a1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, MLFeatureValue)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C9D9D280;
  *(void *)(inited + 32) = 0xD000000000000014;
  *(void *)(inited + 40) = 0x80000001C9DA1BC0;
  *(void *)(inited + 48) = objc_msgSend(self, sel_featureValueWithInt64_, v1);
  type metadata accessor for MLFeatureValue();
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t AffinityRankFeatureExtractor.extractFromAction(from:)(uint64_t *a1)
{
  uint64_t v4 = type metadata accessor for CamUSOParse(0);
  uint64_t v5 = OUTLINED_FUNCTION_11_1(v4);
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_3_12();
  type metadata accessor for CamParse(0);
  OUTLINED_FUNCTION_1_3();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_5_17();
  uint64_t v7 = type metadata accessor for ActionCandidate();
  _s7SiriCam0B5ParseOWOcTm_2((uint64_t)a1 + *(int *)(v7 + 20), (uint64_t)v2, (void (*)(void))type metadata accessor for CamParse);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    uint64_t v9 = 0;
    if (EnumCaseMultiPayload == 1)
    {

      return 0;
    }
  }
  else
  {
    outlined init with take of CamUSOParse((uint64_t)v2, v1);
    uint64_t v9 = AffinityRankFeatureExtractor.extract(usoParse:flowHandlerId:)(v1, *a1, a1[1]);
    _s7SiriCam0B8USOParseVWOhTm_0(v1, (void (*)(void))type metadata accessor for CamUSOParse);
  }
  return v9;
}

uint64_t type metadata accessor for AffinityRankFeatureExtractor()
{
  return self;
}

uint64_t *initializeBufferWithCopyOfBuffer for AffinityRankKey(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = type metadata accessor for UUID();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t destroy for AffinityRankKey(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *initializeWithCopy for AffinityRankKey(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

void *assignWithCopy for AffinityRankKey(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for AffinityRankKey(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *assignWithTake for AffinityRankKey(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for AffinityRankKey(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C9D8C494);
}

uint64_t sub_1C9D8C494(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = type metadata accessor for UUID();
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for AffinityRankKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C9D8C530);
}

uint64_t sub_1C9D8C530(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for UUID();
    uint64_t v8 = v5 + *(int *)(a4 + 20);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for AffinityRankKey()
{
  uint64_t result = type metadata singleton initialization cache for AffinityRankKey;
  if (!type metadata singleton initialization cache for AffinityRankKey) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata completion function for AffinityRankKey()
{
  uint64_t result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t base witness table accessor for Equatable in AffinityRankKey()
{
  return lazy protocol witness table accessor for type AffinityRankKey and conformance AffinityRankKey(&lazy protocol witness table cache variable for type AffinityRankKey and conformance AffinityRankKey, (void (*)(uint64_t))type metadata accessor for AffinityRankKey);
}

uint64_t protocol witness for FeatureExtracting.extractImpl(from:) in conformance AffinityRankFeatureExtractor(uint64_t *a1)
{
  return AffinityRankFeatureExtractor.extractImpl(from:)(a1);
}

uint64_t _s7SiriCam0B8USOParseVWOhTm_0(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_18_1();
  v3();
  return a1;
}

uint64_t outlined init with copy of (flowHandlerId: String, parseId: UUID, affinityScore: Int)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (flowHandlerId: String, parseId: UUID, affinityScore: Int));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t lazy protocol witness table accessor for type AffinityRankKey and conformance AffinityRankKey(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t _s7SiriCam0B5ParseOWOcTm_2(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1_3();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t outlined init with take of (flowHandlerId: String, parseId: UUID, affinityScore: Int)?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_1_3();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_5_17()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_12_13(uint64_t a1, uint64_t a2)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay7SiriCam12CAARFeaturesO13WindowLengthsOG_SSs5NeverOTg503_s7d5Cam12f37O16bucketedFeatures_7bucketsSaySSGSS_o4AC13gH14OGtFZSSAHXEfU_SSTf1cn_n(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    uint64_t v17 = MEMORY[0x1E4FBC860];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    uint64_t v6 = v17;
    uint64_t v7 = (unsigned __int8 *)(a1 + 32);
    do
    {
      int v8 = *v7++;
      swift_bridgeObjectRetain();
      v9._countAndFlagsBits = 46;
      v9._object = (void *)0xE100000000000000;
      String.append(_:)(v9);
      unint64_t v10 = 0xE300000000000000;
      uint64_t v11 = 7156326;
      switch(v8)
      {
        case 1:
          unint64_t v10 = 0xE400000000000000;
          uint64_t v11 = 1831874918;
          break;
        case 2:
          uint64_t v11 = 6828390;
          break;
        case 3:
          uint64_t v11 = 6829670;
          break;
        case 4:
          uint64_t v11 = 6566246;
          break;
        case 5:
          uint64_t v11 = 6567782;
          break;
        case 6:
          unint64_t v10 = 0xE400000000000000;
          uint64_t v11 = 1681404518;
          break;
        case 7:
          uint64_t v11 = 6712937;
          break;
        default:
          break;
      }
      unint64_t v12 = v10;
      String.append(_:)(*(Swift::String *)&v11);
      swift_bridgeObjectRelease();
      unint64_t v13 = *(void *)(v17 + 16);
      if (v13 >= *(void *)(v17 + 24) >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      *(void *)(v17 + 16) = v13 + 1;
      uint64_t v14 = v17 + 16 * v13;
      *(void *)(v14 + 32) = a2;
      *(void *)(v14 + 40) = a3;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x1E4FBC860];
  }
  return v6;
}

void *static CAARFeatures.WindowLengths.allCases.getter()
{
  return &outlined read-only object #0 of static CAARFeatures.WindowLengths.allCases.getter;
}

uint64_t CAARFeatures.WindowLengths.rawValue.getter(char a1)
{
  uint64_t result = 7156326;
  switch(a1)
  {
    case 1:
      uint64_t result = 1831874918;
      break;
    case 2:
      uint64_t result = 6828390;
      break;
    case 3:
      uint64_t result = 6829670;
      break;
    case 4:
      uint64_t result = 6566246;
      break;
    case 5:
      uint64_t result = 6567782;
      break;
    case 6:
      uint64_t result = 1681404518;
      break;
    case 7:
      uint64_t result = 6712937;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t one-time initialization function for ACTION_DISAMBIGUATION_FREQ()
{
  OUTLINED_FUNCTION_1_26((uint64_t)&outlined read-only object #0 of static CAARFeatures.WindowLengths.allCases.getter, 43, 0x80000001C9DA4B40);
  uint64_t result = OUTLINED_FUNCTION_2_27();
  static CAARFeatures.ACTION_DISAMBIGUATION_FREQ = v0;
  return result;
}

uint64_t one-time initialization function for APP_DISAMBIGUATION_FREQ()
{
  uint64_t v1 = OUTLINED_FUNCTION_0_24();
  OUTLINED_FUNCTION_1_26(v1, 40, v2);
  uint64_t result = OUTLINED_FUNCTION_2_27();
  static CAARFeatures.APP_DISAMBIGUATION_FREQ = v0;
  return result;
}

uint64_t one-time initialization function for FRAC_SELECTED_ACTION_DISAMBIGUATION_FREQ()
{
  uint64_t v1 = OUTLINED_FUNCTION_0_24();
  OUTLINED_FUNCTION_1_26(v1, 46, v2);
  uint64_t result = OUTLINED_FUNCTION_2_27();
  static CAARFeatures.FRAC_SELECTED_ACTION_DISAMBIGUATION_FREQ = v0;
  return result;
}

uint64_t one-time initialization function for FRAC_SELECTED_APP_DISAMBIGUATION_FREQ()
{
  OUTLINED_FUNCTION_1_26((uint64_t)&outlined read-only object #0 of static CAARFeatures.WindowLengths.allCases.getter, 43, 0x80000001C9DA44D0);
  uint64_t result = OUTLINED_FUNCTION_2_27();
  static CAARFeatures.FRAC_SELECTED_APP_DISAMBIGUATION_FREQ = v0;
  return result;
}

uint64_t one-time initialization function for SELECTED_ACTION_DISAMBIGUATION_FREQ()
{
  uint64_t v1 = OUTLINED_FUNCTION_0_24();
  OUTLINED_FUNCTION_1_26(v1, 51, v2);
  uint64_t result = OUTLINED_FUNCTION_2_27();
  static CAARFeatures.SELECTED_ACTION_DISAMBIGUATION_FREQ = v0;
  return result;
}

uint64_t one-time initialization function for SELECTED_APP_DISAMBIGUATION_FREQ()
{
  uint64_t v1 = OUTLINED_FUNCTION_0_24();
  OUTLINED_FUNCTION_1_26(v1, 48, v2);
  uint64_t result = OUTLINED_FUNCTION_2_27();
  static CAARFeatures.SELECTED_APP_DISAMBIGUATION_FREQ = v0;
  return result;
}

uint64_t one-time initialization function for APP_LAUNCH_COUNT()
{
  uint64_t result = OUTLINED_FUNCTION_1_26((uint64_t)&outlined read-only object #0 of one-time initialization function for APP_LAUNCH_COUNT, 18, 0x80000001C9DA4BE0);
  static CAARFeatures.APP_LAUNCH_COUNT = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_0_24()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_1_26(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = a2 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
  return _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay7SiriCam12CAARFeaturesO13WindowLengthsOG_SSs5NeverOTg503_s7d5Cam12f37O16bucketedFeatures_7bucketsSaySSGSS_o4AC13gH14OGtFZSSAHXEfU_SSTf1cn_n(a1, v4, a3);
}

uint64_t OUTLINED_FUNCTION_2_27()
{
  return swift_bridgeObjectRelease();
}

uint64_t destroy for CamOutputProvider()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for CamOutputProvider(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for CamOutputProvider(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for CamOutputProvider(uint64_t a1, uint64_t a2)
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
  return a1;
}

uint64_t getEnumTagSinglePayload for CamOutputProvider(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 56))
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

uint64_t storeEnumTagSinglePayload for CamOutputProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CamOutputProvider()
{
  return &type metadata for CamOutputProvider;
}

void CamOutputProvider.toCamOutput(from:)(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v5 = *v1;
  uint64_t v4 = (void *)v1[1];
  uint64_t v6 = (void *)MEMORY[0x1CB78D210](*v1, v4);
  id v7 = objc_msgSend(a1, sel_featureValueForName_, v6);

  if (!v7 || (id v8 = objc_msgSend(v7, sel_multiArrayValue), v7, !v8))
  {
    OUTLINED_FUNCTION_0_5();
    _StringGuts.grow(_:)(60);
    OUTLINED_FUNCTION_0_25();
    v28._countAndFlagsBits = v27 + 21;
    v28._object = (void *)0x80000001C9DA2B80;
    String.append(_:)(v28);
    swift_bridgeObjectRetain();
    v29._countAndFlagsBits = v5;
    v29._object = v4;
    String.append(_:)(v29);
    goto LABEL_14;
  }
  double v9 = MLMultiArray.toDoubleScalar()();

  if (v10) {
    return;
  }
  uint64_t v12 = v2[2];
  uint64_t v11 = (void *)v2[3];
  unint64_t v13 = (void *)MEMORY[0x1CB78D210](v12, v11);
  id v14 = objc_msgSend(a1, sel_objectForKeyedSubscript_, v13);

  if (!v14
    || (id v15 = objc_msgSend(v14, sel_multiArrayValue), v14, !v15))
  {
    OUTLINED_FUNCTION_0_5();
    _StringGuts.grow(_:)(58);
    OUTLINED_FUNCTION_0_25();
    uint64_t v39 = v38 + 19;
    v40 = "Unable to retrieve model threshold from output feature: ";
LABEL_22:
    unint64_t v41 = (unint64_t)(v40 - 32) | 0x8000000000000000;
    String.append(_:)(*(Swift::String *)&v39);
    swift_bridgeObjectRetain();
    v42._countAndFlagsBits = v12;
    v42._object = v11;
    String.append(_:)(v42);
    goto LABEL_14;
  }
  double v16 = MLMultiArray.toDoubleScalar()();

  if (v17) {
    return;
  }
  uint64_t v12 = v2[4];
  uint64_t v11 = (void *)v2[5];
  uint64_t v18 = (void *)MEMORY[0x1CB78D210](v12, v11);
  id v19 = objc_msgSend(a1, sel_featureValueForName_, v18);

  if (!v19
    || (id v20 = objc_msgSend(v19, sel_multiArrayValue), v19, !v20))
  {
    OUTLINED_FUNCTION_0_5();
    _StringGuts.grow(_:)(63);
    OUTLINED_FUNCTION_0_25();
    uint64_t v39 = v43 | 0x18;
    v40 = "Unable to retrieve model decision from output feature name : ";
    goto LABEL_22;
  }
  Swift::Int v21 = MLMultiArray.toIntScalar()();

  if (v22) {
    return;
  }
  uint64_t v23 = v2[6];
  if (*(void *)(v23 + 16))
  {
    unint64_t v24 = specialized __RawDictionaryStorage.find<A>(_:)(v21);
    if (v25)
    {
      char v26 = *(unsigned char *)(*(void *)(v23 + 56) + v24);
      type metadata accessor for CamOutput();
      *(unsigned char *)(swift_allocObject() + 56) = v26;
      CamLogOutput.init(prediction:score:threshold:)(v21, v9, v16);
      return;
    }
  }
  OUTLINED_FUNCTION_0_5();
  _StringGuts.grow(_:)(51);
  v44._object = (void *)0x80000001C9DA4C00;
  v44._countAndFlagsBits = 0xD000000000000025;
  String.append(_:)(v44);
  uint64_t v49 = v21;
  v45._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v45);
  swift_bridgeObjectRelease();
  v46._countAndFlagsBits = 0x6F72662079656B20;
  v46._object = (void *)0xEA0000000000206DLL;
  String.append(_:)(v46);
  swift_bridgeObjectRetain();
  v47._countAndFlagsBits = Dictionary.description.getter();
  String.append(_:)(v47);
  swift_bridgeObjectRelease();
LABEL_14:
  swift_bridgeObjectRelease();
  uint64_t v30 = v48[0];
  unint64_t v31 = v48[1];
  if (one-time initialization token for ambiguityHandling != -1) {
    swift_once();
  }
  uint64_t v32 = type metadata accessor for Logger();
  __swift_project_value_buffer(v32, (uint64_t)static Logger.ambiguityHandling);
  swift_bridgeObjectRetain_n();
  uint64_t v33 = Logger.logObject.getter();
  os_log_type_t v34 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    v48[0] = v36;
    *(_DWORD *)uint64_t v35 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v49 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v31, v48);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C9CFE000, v33, v34, "%s", v35, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1CB78E290](v36, -1, -1);
    MEMORY[0x1CB78E290](v35, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  lazy protocol witness table accessor for type CamError and conformance CamError();
  swift_allocError();
  *(void *)uint64_t v37 = v30;
  *(void *)(v37 + 8) = v31;
  *(unsigned char *)(v37 + 16) = 3;
  swift_willThrow();
}

uint64_t dispatch thunk of ModelHandler.init(forModelWithName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of ModelHandler.update()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ModelHandler.getMetadata()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ModelHandler.predict(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t outlined copy of ModelError(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for ModelError(uint64_t a1)
{
  return outlined consume of ModelError(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t initializeBufferWithCopyOfBuffer for ModelError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  outlined copy of ModelError(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ModelError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  outlined copy of ModelError(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  outlined consume of ModelError(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for ModelError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  outlined consume of ModelError(v4, v5, v6);
  return a1;
}

uint64_t getEnumTag for ModelError(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t destructiveInjectEnumTag for ModelError(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)uint64_t result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ModelError()
{
  return &type metadata for ModelError;
}

uint64_t dispatch thunk of ActionAmbiguityActionEnforcer.enforce(inputFeatures:camOutput:camInput:modelMetadata:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t ForcedDisambiguationForRankingEvaluationActionEnforcer.enforce(inputFeatures:camOutput:camInput:modelMetadata:)@<X0>(void *a1@<X8>)
{
  if (one-time initialization token for ambiguityHandling != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Logger.ambiguityHandling);
  char v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1C9CFE000, v3, v4, "[ForcedDisambiguationForRankingEvaluationActionEnforcer] called to see if enforce is needed", v5, 2u);
    MEMORY[0x1CB78E290](v5, -1, -1);
  }

  uint64_t result = ForcedDisambiguation.decision()();
  if (result)
  {
    uint64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v7, v8))
    {
      double v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)double v9 = 0;
      _os_log_impl(&dword_1C9CFE000, v7, v8, "[ForcedDisambiguationForRankingEvaluationActionEnforcer] Forcing a disambiguation", v9, 2u);
      MEMORY[0x1CB78E290](v9, -1, -1);
    }

    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ForcedDisambiguationForRankingEvaluationActionEnforcer.Type);
    uint64_t result = String.init<A>(describing:)();
    *a1 = 4;
    a1[1] = result;
    a1[2] = v10;
  }
  else
  {
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ForcedDisambiguationForRankingEvaluationActionEnforcer()
{
  return &type metadata for ForcedDisambiguationForRankingEvaluationActionEnforcer;
}

uint64_t CamFeature.rawValue.getter()
{
  unint64_t v1 = 0x4F5455415F534D53;
  if (*v0 != 1) {
    unint64_t v1 = 0xD000000000000010;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x455045525F4B5341;
  }
}

SiriCam::CamFeature_optional __swiftcall CamFeature.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v3._countAndFlagsBits = rawValue._countAndFlagsBits;
  os_log_type_t v4 = v1;
  v3._object = object;
  unint64_t v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of CamFeature.init(rawValue:), v3);
  result.value = swift_bridgeObjectRelease();
  char v7 = 3;
  if (v5 < 3) {
    char v7 = v5;
  }
  *os_log_type_t v4 = v7;
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance CamFeature(char *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CamFeature()
{
  return specialized RawRepresentable<>.hashValue.getter(*v0);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance CamFeature(uint64_t a1)
{
  return specialized RawRepresentable<>.hash(into:)(a1, *v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CamFeature(uint64_t a1)
{
  return specialized RawRepresentable<>._rawHashValue(seed:)(a1, *v1);
}

SiriCam::CamFeature_optional protocol witness for RawRepresentable.init(rawValue:) in conformance CamFeature(Swift::String *a1)
{
  return CamFeature.init(rawValue:)(*a1);
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance CamFeature@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CamFeature.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unsigned char *storeEnumTagSinglePayload for CamFeature(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x1C9D8DC00);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CamFeature()
{
  return &type metadata for CamFeature;
}

uint64_t *SnrFeatureExtractor.extractedFeatures.unsafeMutableAddressor()
{
  if (one-time initialization token for extractedFeatures != -1) {
    swift_once();
  }
  return &static SnrFeatureExtractor.extractedFeatures;
}

uint64_t SnrFeatureExtractor.extractImpl(from:)(void *a1)
{
  type metadata accessor for MLMultiArray();
  objc_msgSend(a1, sel_snr);
  uint64_t result = static MLMultiArray.makeScalar(from:)(v3);
  uint64_t v5 = result;
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, MLMultiArray)>);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1C9D9D280;
    *(void *)(inited + 32) = 0xD000000000000021;
    *(void *)(inited + 40) = 0x80000001C9DA1650;
    *(void *)(inited + 48) = v5;
    return Dictionary.init(dictionaryLiteral:)();
  }
  return result;
}

uint64_t protocol witness for static FeatureExtracting.extractedFeatures.getter in conformance SnrFeatureExtractor()
{
  SnrFeatureExtractor.extractedFeatures.unsafeMutableAddressor();
  return swift_bridgeObjectRetain();
}

uint64_t protocol witness for FeatureExtracting.extractImpl(from:) in conformance SnrFeatureExtractor(void **a1)
{
  return SnrFeatureExtractor.extractImpl(from:)(*a1);
}

ValueMetadata *type metadata accessor for SnrFeatureExtractor()
{
  return &type metadata for SnrFeatureExtractor;
}

uint64_t *DeviceContextFeatureExtractor.extractedFeatures.unsafeMutableAddressor()
{
  if (one-time initialization token for extractedFeatures != -1) {
    swift_once();
  }
  return &static DeviceContextFeatureExtractor.extractedFeatures;
}

void *one-time initialization function for kDeviceIdiomMap()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(DeviceIdiom, Int)>);
  uint64_t v0 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (DeviceIdiom, Int))
             - 8);
  uint64_t v1 = *(void *)(*(void *)v0 + 72);
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v0 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1C9DA11B0;
  unint64_t v4 = v3 + v2;
  uint64_t v5 = v0[14];
  uint64_t v6 = *MEMORY[0x1E4FA5120];
  uint64_t v7 = type metadata accessor for DeviceIdiom();
  os_log_type_t v8 = *(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104);
  v8(v4, v6, v7);
  *(void *)(v4 + v5) = 0;
  uint64_t v9 = v0[14];
  v8(v4 + v1, *MEMORY[0x1E4FA50E0], v7);
  *(void *)(v4 + v1 + v9) = 1;
  uint64_t v10 = v0[14];
  v8(v4 + 2 * v1, *MEMORY[0x1E4FA5110], v7);
  *(void *)(v4 + 2 * v1 + v10) = 2;
  uint64_t v11 = v0[14];
  v8(v4 + 3 * v1, *MEMORY[0x1E4FA50E8], v7);
  *(void *)(v4 + 3 * v1 + v11) = 3;
  uint64_t v12 = v0[14];
  v8(v4 + 4 * v1, *MEMORY[0x1E4FA50F0], v7);
  *(void *)(v4 + 4 * v1 + v12) = 4;
  uint64_t v13 = v0[14];
  v8(v4 + 5 * v1, *MEMORY[0x1E4FA50F8], v7);
  *(void *)(v4 + 5 * v1 + v13) = 5;
  uint64_t v14 = v0[14];
  v8(v4 + 6 * v1, *MEMORY[0x1E4FA5100], v7);
  *(void *)(v4 + 6 * v1 + v14) = 6;
  uint64_t v15 = v0[14];
  v8(v4 + 7 * v1, *MEMORY[0x1E4FA5108], v7);
  *(void *)(v4 + 7 * v1 + v15) = 7;
  unint64_t v16 = v4 + 8 * v1;
  uint64_t v17 = v0[14];
  v8(v16, *MEMORY[0x1E4FA50D8], v7);
  *(void *)(v16 + v17) = 8;
  lazy protocol witness table accessor for type DeviceIdiom and conformance DeviceIdiom();
  uint64_t result = (void *)Dictionary.init(dictionaryLiteral:)();
  kDeviceIdiomMap._rawValue = result;
  return result;
}

uint64_t DeviceContextFeatureExtractor.extractImpl(from:)(uint64_t a1, uint64_t a2)
{
  type metadata accessor for DeviceIdiom();
  MEMORY[0x1F4188790]();
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SiriEnvironment();
  static SiriEnvironment.default.getter();
  SiriEnvironment.currentDevice.getter();
  swift_release();
  dispatch thunk of CurrentDevice.deviceIdiom.getter();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, MLMultiArray)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C9D9D280;
  strcpy((char *)(inited + 32), "device_idiom");
  *(unsigned char *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  if (one-time initialization token for kDeviceIdiomMap != -1) {
    swift_once();
  }
  uint64_t v7 = specialized Dictionary.subscript.getter((uint64_t)v5, (uint64_t)kDeviceIdiomMap._rawValue);
  if ((v8 & 1) == 0) {
    a2 = v7;
  }
  type metadata accessor for MLMultiArray();
  id v9 = static MLMultiArray.makeScalar(from:)(a2);
  if (v2)
  {
    swift_bridgeObjectRelease();
    *(void *)(inited + 16) = 0;
    swift_setDeallocating();
    uint64_t v10 = inited;
    specialized _ContiguousArrayStorage.__deallocating_deinit(&demangling cache variable for type metadata for (String, MLMultiArray));
  }
  else
  {
    *(void *)(inited + 48) = v9;
    uint64_t v10 = Dictionary.init(dictionaryLiteral:)();
  }
  uint64_t v11 = OUTLINED_FUNCTION_0_26();
  v12(v11);
  return v10;
}

uint64_t protocol witness for static FeatureExtracting.extractedFeatures.getter in conformance DeviceContextFeatureExtractor()
{
  DeviceContextFeatureExtractor.extractedFeatures.unsafeMutableAddressor();
  return swift_bridgeObjectRetain();
}

uint64_t protocol witness for FeatureExtracting.extractImpl(from:) in conformance DeviceContextFeatureExtractor(uint64_t a1)
{
  return DeviceContextFeatureExtractor.extractImpl(from:)(a1, *v1);
}

uint64_t specialized _ContiguousArrayStorage.__deallocating_deinit()
{
  return specialized _ContiguousArrayStorage.__deallocating_deinit(&demangling cache variable for type metadata for (String, MLMultiArray));
}

{
  return specialized _ContiguousArrayStorage.__deallocating_deinit(&demangling cache variable for type metadata for SignalProviding);
}

{
  uint64_t v0;
  uint64_t vars8;

  type metadata accessor for RankedAction();
  swift_arrayDestroy();
  return MEMORY[0x1F4186488](v0, 32, 7);
}

{
  return specialized _ContiguousArrayStorage.__deallocating_deinit(&demangling cache variable for type metadata for (String, Any));
}

uint64_t specialized _ContiguousArrayStorage.__deallocating_deinit(uint64_t *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(a1);
  swift_arrayDestroy();
  return MEMORY[0x1F4186488](v1, 32, 7);
}

ValueMetadata *type metadata accessor for DeviceContextFeatureExtractor()
{
  return &type metadata for DeviceContextFeatureExtractor;
}

uint64_t OUTLINED_FUNCTION_0_26()
{
  return v0;
}

uint64_t CamInput.topUserParse.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (CamUserParse, Float));
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(v1 + *(int *)(type metadata accessor for CamInput() + 40));
  if (*(void *)(v7 + 16))
  {
    outlined init with copy of (CamUserParse, Float)(v7 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)), (uint64_t)v6);
    outlined init with take of CamUserParse((uint64_t)v6, a1);
    uint64_t v8 = type metadata accessor for CamUserParse(0);
    return __swift_storeEnumTagSinglePayload(a1, 0, 1, v8);
  }
  else
  {
    uint64_t v10 = type metadata accessor for CamUserParse(0);
    return __swift_storeEnumTagSinglePayload(a1, 1, 1, v10);
  }
}

Swift::Void __swiftcall CamOutput.overrideAction(action:enforcer:)(SiriCam::CamAction action, Swift::String enforcer)
{
  *(unsigned char *)(v2 + 56) = *(unsigned char *)action;
  *(Swift::String *)(v2 + 40) = enforcer;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
}

uint64_t CamOutput.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186488](v0, 57, 7);
}

uint64_t type metadata accessor for CamOutput()
{
  return self;
}

char *initializeBufferWithCopyOfBuffer for CamInput(char *a1, char *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for UUID();
    uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8(&a1[a3[5]], &a2[a3[5]], v7);
    uint64_t v9 = a3[6];
    uint64_t v10 = a3[7];
    uint64_t v11 = &a1[v9];
    uint64_t v12 = &a2[v9];
    uint64_t v13 = *((void *)v12 + 1);
    *(void *)uint64_t v11 = *(void *)v12;
    *((void *)v11 + 1) = v13;
    uint64_t v14 = &a1[v10];
    uint64_t v15 = &a2[v10];
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v7))
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
      memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      v8(v14, v15, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v7);
    }
    uint64_t v18 = a3[8];
    uint64_t v19 = a3[9];
    id v20 = *(void **)&a2[v18];
    *(void *)&a1[v18] = v20;
    a1[v19] = a2[v19];
    uint64_t v21 = a3[11];
    *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
    *(void *)&a1[v21] = *(void *)&a2[v21];
    *(void *)&a1[a3[12]] = *(void *)&a2[a3[12]];
    id v22 = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for CamInput(uint64_t a1, int *a2)
{
  uint64_t v4 = type metadata accessor for UUID();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  v5(a1 + a2[5], v4);
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + a2[7];
  if (!__swift_getEnumTagSinglePayload(v6, 1, v4)) {
    v5(v6, v4);
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

char *initializeWithCopy for CamInput(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(&a1[a3[5]], &a2[a3[5]], v6);
  uint64_t v8 = a3[6];
  uint64_t v9 = a3[7];
  uint64_t v10 = &a1[v8];
  uint64_t v11 = &a2[v8];
  uint64_t v12 = *((void *)v11 + 1);
  *(void *)uint64_t v10 = *(void *)v11;
  *((void *)v10 + 1) = v12;
  uint64_t v13 = &a1[v9];
  uint64_t v14 = &a2[v9];
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v6))
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
    memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    v7(v13, v14, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v6);
  }
  uint64_t v16 = a3[8];
  uint64_t v17 = a3[9];
  uint64_t v18 = *(void **)&a2[v16];
  *(void *)&a1[v16] = v18;
  a1[v17] = a2[v17];
  uint64_t v19 = a3[11];
  *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
  *(void *)&a1[v19] = *(void *)&a2[v19];
  *(void *)&a1[a3[12]] = *(void *)&a2[a3[12]];
  id v20 = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

char *assignWithCopy for CamInput(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  v8(&a1[a3[5]], &a2[a3[5]], v6);
  uint64_t v9 = a3[6];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  *(void *)uint64_t v10 = *(void *)v11;
  *((void *)v10 + 1) = *((void *)v11 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[7];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)&a1[v12], 1, v6);
  int v16 = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v6);
  if (!EnumTagSinglePayload)
  {
    if (!v16)
    {
      v8(v13, v14, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v13, v14, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v6);
LABEL_7:
  uint64_t v18 = a3[8];
  uint64_t v19 = *(void **)&a1[v18];
  id v20 = *(void **)&a2[v18];
  *(void *)&a1[v18] = v20;
  id v21 = v20;

  a1[a3[9]] = a2[a3[9]];
  *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[11]] = *(void *)&a2[a3[11]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[12]] = *(void *)&a2[a3[12]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *initializeWithTake for CamInput(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(&a1[a3[5]], &a2[a3[5]], v6);
  uint64_t v8 = a3[7];
  *(_OWORD *)&a1[a3[6]] = *(_OWORD *)&a2[a3[6]];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  if (__swift_getEnumTagSinglePayload((uint64_t)&a2[v8], 1, v6))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    v7(v9, v10, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v6);
  }
  uint64_t v12 = a3[9];
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  a1[v12] = a2[v12];
  uint64_t v13 = a3[11];
  *(void *)&a1[a3[10]] = *(void *)&a2[a3[10]];
  *(void *)&a1[v13] = *(void *)&a2[v13];
  *(void *)&a1[a3[12]] = *(void *)&a2[a3[12]];
  return a1;
}

char *assignWithTake for CamInput(char *a1, char *a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  v8(&a1[a3[5]], &a2[a3[5]], v6);
  uint64_t v9 = a3[6];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = (uint64_t *)&a2[v9];
  uint64_t v13 = *v11;
  uint64_t v12 = v11[1];
  *(void *)uint64_t v10 = v13;
  *((void *)v10 + 1) = v12;
  swift_bridgeObjectRelease();
  uint64_t v14 = a3[7];
  uint64_t v15 = &a1[v14];
  int v16 = &a2[v14];
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)&a1[v14], 1, v6);
  int v18 = __swift_getEnumTagSinglePayload((uint64_t)v16, 1, v6);
  if (!EnumTagSinglePayload)
  {
    if (!v18)
    {
      v8(v15, v16, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v15, v6);
    goto LABEL_6;
  }
  if (v18)
  {
LABEL_6:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
    memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v15, v16, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v6);
LABEL_7:
  uint64_t v20 = a3[8];
  id v21 = *(void **)&a1[v20];
  *(void *)&a1[v20] = *(void *)&a2[v20];

  uint64_t v22 = a3[10];
  a1[a3[9]] = a2[a3[9]];
  *(void *)&a1[v22] = *(void *)&a2[v22];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[11]] = *(void *)&a2[a3[11]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[12]] = *(void *)&a2[a3[12]];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CamInput(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C9D8F0AC);
}

uint64_t sub_1C9D8F0AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for UUID();
  OUTLINED_FUNCTION_0_3();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_8:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  if (a2 != 0x7FFFFFFF)
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
    uint64_t v9 = a1 + *(int *)(a3 + 28);
    goto LABEL_8;
  }
  unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
  if (v10 >= 0xFFFFFFFF) {
    LODWORD(v10) = -1;
  }
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for CamInput(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C9D8F178);
}

void sub_1C9D8F178(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  type metadata accessor for UUID();
  OUTLINED_FUNCTION_0_3();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
      return;
    }
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
    uint64_t v11 = a1 + *(int *)(a4 + 28);
  }
  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

uint64_t type metadata accessor for CamInput()
{
  uint64_t result = type metadata singleton initialization cache for CamInput;
  if (!type metadata singleton initialization cache for CamInput) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void type metadata completion function for CamInput()
{
  type metadata accessor for UUID();
  if (v0 <= 0x3F)
  {
    type metadata accessor for UUID?();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t outlined init with copy of (CamUserParse, Float)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (CamUserParse, Float));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with take of CamUserParse(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CamUserParse(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t specialized Collection.first.getter()
{
  return specialized Collection.first.getter();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  void (*v5)(void);
  uint64_t v6;
  uint64_t vars8;

  uint64_t v2 = OUTLINED_FUNCTION_47_1();
  uint64_t v4 = v3(v2);
  if (v1)
  {
    OUTLINED_FUNCTION_24_12();
    v5();
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 1;
  }
  return __swift_storeEnumTagSinglePayload(v0, v6, 1, v4);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars8;

  OUTLINED_FUNCTION_47_1();
  uint64_t v3 = type metadata accessor for RankedAction();
  if (v2)
  {
    OUTLINED_FUNCTION_9_18();
    _s7SiriCam0B13ModelMetadataVWOcTm_1(v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)), v0, (void (*)(void))type metadata accessor for RankedAction);
    int v5 = 0;
  }
  else
  {
    int v5 = 1;
  }
  return __swift_storeEnumTagSinglePayload(v0, v5, 1, v3);
}

void *specialized Collection.first.getter(uint64_t a1)
{
  uint64_t result = (void *)specialized Dictionary.startIndex.getter(a1);
  if (v4) {
    goto LABEL_7;
  }
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }
  OUTLINED_FUNCTION_31_5();
  if (v13) {
    return 0;
  }
  uint64_t v14 = OUTLINED_FUNCTION_29_6(v5, v6, v7, v8, v9, v10, v11, v12, v19, v20);
  return specialized Dictionary.subscript.getter(v14, v15, v16, v17, v18);
}

{
  void *result;
  int v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;

  uint64_t result = (void *)specialized Dictionary.startIndex.getter(a1);
  if (v4) {
    goto LABEL_7;
  }
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }
  OUTLINED_FUNCTION_31_5();
  if (v13) {
    return 0;
  }
  uint64_t v14 = OUTLINED_FUNCTION_29_6(v5, v6, v7, v8, v9, v10, v11, v12, v19, v20);
  return specialized Dictionary.subscript.getter(v14, v15, v16, v17, v18);
}

double specialized Collection.first.getter@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(void *)(a1 + 16))
  {
    outlined init with copy of SignalProviding(a1 + 32, a2);
  }
  else
  {
    *(void *)(a2 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

void specialized _dictionaryUpCast<A, B, C, D>(_:)(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, MLFeatureValue>);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
  }
  uint64_t v31 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v30 = (unint64_t)(63 - v3) >> 6;
  swift_bridgeObjectRetain();
  int64_t v6 = 0;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        unint64_t v7 = __clz(__rbit64(v5));
        v5 &= v5 - 1;
        unint64_t v8 = v7 | (v6 << 6);
      }
      else
      {
        int64_t v9 = v6 + 1;
        if (__OFADD__(v6, 1)) {
          goto LABEL_38;
        }
        if (v9 >= v30)
        {
LABEL_35:
          outlined consume of [String : MLFeatureValue].Iterator._Variant();
          return;
        }
        unint64_t v10 = *(void *)(v31 + 8 * v9);
        int64_t v11 = v6 + 1;
        if (!v10)
        {
          OUTLINED_FUNCTION_51_2();
          if (v12 == v13) {
            goto LABEL_35;
          }
          OUTLINED_FUNCTION_50_1();
          if (!v10)
          {
            OUTLINED_FUNCTION_51_2();
            if (v12 == v13) {
              goto LABEL_35;
            }
            OUTLINED_FUNCTION_50_1();
            if (!v10)
            {
              OUTLINED_FUNCTION_51_2();
              if (v12 == v13) {
                goto LABEL_35;
              }
              OUTLINED_FUNCTION_50_1();
              if (!v10)
              {
                int64_t v15 = v14 + 4;
                if (v15 >= v30) {
                  goto LABEL_35;
                }
                unint64_t v10 = *(void *)(v31 + 8 * v15);
                if (!v10)
                {
                  while (!__OFADD__(v15, 1))
                  {
                    OUTLINED_FUNCTION_51_2();
                    if (v12 == v13) {
                      goto LABEL_35;
                    }
                    OUTLINED_FUNCTION_50_1();
                    int64_t v15 = v16 + 1;
                    if (v10) {
                      goto LABEL_29;
                    }
                  }
                  goto LABEL_39;
                }
                int64_t v11 = v15;
              }
            }
          }
        }
LABEL_29:
        unint64_t v5 = (v10 - 1) & v10;
        unint64_t v8 = __clz(__rbit64(v10)) + (v11 << 6);
        int64_t v6 = v11;
      }
      uint64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v8);
      uint64_t v19 = *v17;
      uint64_t v18 = v17[1];
      char v20 = *(void **)(*(void *)(a1 + 56) + 8 * v8);
      swift_bridgeObjectRetain();
      id v21 = v20;
      unint64_t v22 = specialized __RawDictionaryStorage.find<A>(_:)(v19, v18);
      unint64_t v23 = v22;
      if ((v24 & 1) == 0) {
        break;
      }
      char v25 = (uint64_t *)(v2[6] + 16 * v22);
      swift_bridgeObjectRelease();
      *char v25 = v19;
      v25[1] = v18;
      uint64_t v26 = v2[7];

      *(void *)(v26 + 8 * v23) = v21;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v22;
    uint64_t v27 = (uint64_t *)(v2[6] + 16 * v22);
    *uint64_t v27 = v19;
    v27[1] = v18;
    *(void *)(v2[7] + 8 * v22) = v21;
    uint64_t v28 = v2[2];
    BOOL v13 = __OFADD__(v28, 1);
    uint64_t v29 = v28 + 1;
    if (v13) {
      goto LABEL_37;
    }
    v2[2] = v29;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

unint64_t specialized _dictionaryUpCast<A, B, C, D>(_:)(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Any>);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
  }
  uint64_t v33 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v32 = (unint64_t)(63 - v3) >> 6;
  int64_t v6 = &v38;
  unint64_t v7 = &v40;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v34 = 0;
  int64_t v9 = (unint64_t *)&lazy cache variable for type metadata for MLMultiArray;
  unint64_t v10 = 0x1E4F1E9A8uLL;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        uint64_t v35 = (v5 - 1) & v5;
        unint64_t v11 = __clz(__rbit64(v5)) | (v34 << 6);
      }
      else
      {
        int64_t v12 = v34 + 1;
        if (__OFADD__(v34, 1)) {
          goto LABEL_34;
        }
        if (v12 >= v32)
        {
LABEL_31:
          outlined consume of [String : MLFeatureValue].Iterator._Variant();
          return (unint64_t)v2;
        }
        unint64_t v13 = *(void *)(v33 + 8 * v12);
        int64_t v14 = v34 + 1;
        if (!v13)
        {
          int64_t v14 = v34 + 2;
          if (v34 + 2 >= v32) {
            goto LABEL_31;
          }
          unint64_t v13 = *(void *)(v33 + 8 * v14);
          if (!v13)
          {
            int64_t v14 = v34 + 3;
            if (v34 + 3 >= v32) {
              goto LABEL_31;
            }
            unint64_t v13 = *(void *)(v33 + 8 * v14);
            if (!v13)
            {
              int64_t v14 = v34 + 4;
              if (v34 + 4 >= v32) {
                goto LABEL_31;
              }
              unint64_t v13 = *(void *)(v33 + 8 * v14);
              if (!v13)
              {
                int64_t v15 = v34 + 5;
                if (v34 + 5 >= v32) {
                  goto LABEL_31;
                }
                unint64_t v13 = *(void *)(v33 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    int64_t v14 = v15 + 1;
                    if (__OFADD__(v15, 1)) {
                      goto LABEL_35;
                    }
                    if (v14 >= v32) {
                      goto LABEL_31;
                    }
                    unint64_t v13 = *(void *)(v33 + 8 * v14);
                    ++v15;
                    if (v13) {
                      goto LABEL_25;
                    }
                  }
                }
                int64_t v14 = v34 + 5;
              }
            }
          }
        }
LABEL_25:
        int64_t v34 = v14;
        uint64_t v35 = (v13 - 1) & v13;
        unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
      }
      uint64_t v16 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v11);
      uint64_t v17 = *(void **)(*(void *)(v1 + 56) + 8 * v11);
      uint64_t v36 = *v16;
      uint64_t v37 = v16[1];
      type metadata accessor for MLMultiArray(0, v9);
      swift_bridgeObjectRetain();
      id v18 = v17;
      swift_dynamicCast();
      outlined init with take of Any(v6, v7);
      outlined init with take of Any(v7, v41);
      outlined init with take of Any(v41, &v39);
      unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v36, v37);
      unint64_t v19 = result;
      if ((v20 & 1) == 0) {
        break;
      }
      id v21 = v7;
      unint64_t v22 = v6;
      uint64_t v23 = v1;
      unint64_t v24 = v10;
      char v25 = v9;
      uint64_t v26 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *uint64_t v26 = v36;
      v26[1] = v37;
      int64_t v9 = v25;
      unint64_t v10 = v24;
      uint64_t v1 = v23;
      int64_t v6 = v22;
      unint64_t v7 = v21;
      uint64_t v27 = (_OWORD *)(v2[7] + 32 * v19);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
      unint64_t result = (unint64_t)outlined init with take of Any(&v39, v27);
      unint64_t v5 = v35;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v28 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v28 = v36;
    v28[1] = v37;
    unint64_t result = (unint64_t)outlined init with take of Any(&v39, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v29 = v2[2];
    BOOL v30 = __OFADD__(v29, 1);
    uint64_t v31 = v29 + 1;
    if (v30) {
      goto LABEL_33;
    }
    v2[2] = v31;
    unint64_t v5 = v35;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay10Foundation3URLVG_SSs5NeverOTg5166_s7SiriCam13CoreMLHandlerC15findModelFolder11assetOutput10Foundation3URLVAH8modelUrl_AA0bF8MetadataV0lN0t_tKFSSAHcfu_33_43697e1f61f7e10b647d882195ad8775AHSSTf3nnnpk_nTf1cn_n(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x1E4FBC860];
  if (v1)
  {
    uint64_t v13 = MEMORY[0x1E4FBC860];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    uint64_t v2 = v13;
    uint64_t v4 = *(void *)(type metadata accessor for URL() - 8);
    uint64_t v5 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v6 = *(void *)(v4 + 72);
    do
    {
      uint64_t v7 = URL.path.getter();
      uint64_t v9 = v8;
      unint64_t v10 = *(void *)(v13 + 16);
      if (v10 >= *(void *)(v13 + 24) >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      *(void *)(v13 + 16) = v10 + 1;
      uint64_t v11 = v13 + 16 * v10;
      *(void *)(v11 + 32) = v7;
      *(void *)(v11 + 40) = v9;
      v5 += v6;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t CoreMLHandler.init(forModelWithName:)(uint64_t a1, unint64_t a2)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
  OUTLINED_FUNCTION_1_3();
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_40();
  uint64_t v13 = MEMORY[0x1F4188790](v12);
  int64_t v15 = (char *)&v28 - v14;
  *(void *)(v2 + 24) = a2;
  *(void *)(v2 + 32) = 0;
  *(void *)(v2 + 16) = a1;
  uint64_t v16 = (char *)&v28 + *(int *)(v13 + 48) - v14;
  swift_bridgeObjectRetain();
  static AssetProvider.fetchModel(_:)(v15, (uint64_t)v16, a1, a2);
  if (v3)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    type metadata accessor for CoreMLHandler();
    OUTLINED_FUNCTION_0_14();
    swift_deallocPartialClassInstance();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v29 = v4 + *(int *)(v7 + 48);
    uint64_t v17 = type metadata accessor for URL();
    OUTLINED_FUNCTION_9_18();
    uint64_t v19 = v18;
    uint64_t v32 = 0;
    uint64_t v33 = v11;
    uint64_t v31 = *(void (**)(uint64_t, char *, uint64_t))(v18 + 16);
    v31(v4, v15, v17);
    BOOL v30 = type metadata accessor for CamModelMetadata;
    uint64_t v20 = v29;
    _s7SiriCam0B13ModelMetadataVWOcTm_1((uint64_t)v16, v29, (void (*)(void))type metadata accessor for CamModelMetadata);
    outlined init with take of CamModelMetadata(v20, v2 + OBJC_IVAR____TtC7SiriCam13CoreMLHandler_modelMetadata);
    uint64_t v21 = v17;
    unint64_t v22 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    OUTLINED_FUNCTION_13_9();
    v23();
    uint64_t v24 = (uint64_t)&v33[*(int *)(v7 + 48)];
    v31((uint64_t)v33, v15, v21);
    uint64_t v25 = (uint64_t)v33;
    _s7SiriCam0B13ModelMetadataVWOcTm_1((uint64_t)v16, v24, (void (*)(void))v30);
    uint64_t v26 = v32;
    CoreMLHandler.loadModel(from:)(v25, v24);
    if (v26) {
      swift_release();
    }
    outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?((uint64_t)v15, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    outlined destroy of CamModelMetadata(v24);
    v22(v25, v21);
  }
  return v2;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CoreMLHandler.update()()
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
  OUTLINED_FUNCTION_1_3();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_5_2();
  uint64_t v113 = v5;
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x1F4188790](v6);
  uint64_t v112 = (char *)v98 - v7;
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_10_0();
  uint64_t v111 = v9;
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_41_2();
  uint64_t v12 = MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)v98 - v13;
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_105();
  uint64_t v16 = MEMORY[0x1F4188790](v15);
  uint64_t v18 = (char *)v98 - v17;
  uint64_t v19 = MEMORY[0x1F4188790](v16);
  uint64_t v21 = (char *)v98 - v20;
  unint64_t v22 = (void *)((char *)v98 + *(int *)(v19 + 48) - v20);
  uint64_t v23 = *(void *)(v0 + 16);
  unint64_t v24 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  uint64_t v25 = v23;
  uint64_t v26 = v114;
  static AssetProvider.fetchModel(_:)(v21, (uint64_t)v22, v25, v24);
  swift_bridgeObjectRelease();
  if (!v26)
  {
    uint64_t v101 = v2;
    Swift::Bool v102 = v14;
    uint64_t v110 = 0;
    uint64_t v103 = v1;
    uint64_t v114 = v0;
    uint64_t v108 = v3;
    uint64_t v27 = &v18[*(int *)(v3 + 48)];
    uint64_t v28 = type metadata accessor for URL();
    OUTLINED_FUNCTION_1_2();
    uint64_t v30 = v29;
    uint64_t v105 = *(void (**)(void))(v31 + 16);
    uint64_t v107 = v31 + 16;
    OUTLINED_FUNCTION_24_12();
    v32();
    unint64_t v109 = v22;
    _s7SiriCam0B13ModelMetadataVWOcTm_1((uint64_t)v22, (uint64_t)v27, (void (*)(void))type metadata accessor for CamModelMetadata);
    uint64_t v33 = *((void *)v27 + 2);
    uint64_t v35 = *((void *)v27 + 4);
    uint64_t v34 = *((void *)v27 + 5);
    char v104 = (uint8_t *)*((void *)v27 + 3);
    outlined copy of CamModelVersion?(v33, (uint64_t)v104, v35, v34);
    outlined destroy of CamModelMetadata((uint64_t)v27);
    uint64_t v99 = v30;
    uint64_t v38 = *(void (**)(void, void))(v30 + 8);
    uint64_t v37 = v30 + 8;
    uint64_t v36 = v38;
    uint64_t v106 = v28;
    v38(v18, v28);
    if (v34 == 1)
    {
      if (one-time initialization token for common != -1) {
        swift_once();
      }
      uint64_t v39 = type metadata accessor for Logger();
      __swift_project_value_buffer(v39, (uint64_t)static Logger.common);
      uint64_t v40 = v114;
      swift_retain_n();
      unint64_t v41 = Logger.logObject.getter();
      os_log_type_t v42 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v41, v42))
      {
        uint64_t v43 = (uint64_t)v21;
        Swift::String v44 = (uint8_t *)OUTLINED_FUNCTION_29();
        v116[0] = OUTLINED_FUNCTION_7_1();
        *(_DWORD *)Swift::String v44 = 136315138;
        uint64_t v45 = *(void *)(v40 + 16);
        unint64_t v46 = *(void *)(v40 + 24);
        swift_bridgeObjectRetain();
        uint64_t v47 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v45, v46, v116);
        OUTLINED_FUNCTION_32_7(v47);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        OUTLINED_FUNCTION_5_14();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C9CFE000, v41, v42, "%s: UAF didn't provide model version to check if it's a newer model. Skipping update", v44, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_2_2();
        OUTLINED_FUNCTION_2_2();

        outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v43, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
        return;
      }
      OUTLINED_FUNCTION_5_14();

      uint64_t v54 = (uint64_t)v21;
      goto LABEL_22;
    }
    uint64_t v48 = v35;
    v98[1] = v36;
    v98[2] = v37;
    unint64_t v100 = v21;
    uint64_t v49 = (void *)(v114 + OBJC_IVAR____TtC7SiriCam13CoreMLHandler_modelMetadata);
    swift_beginAccess();
    uint64_t v51 = v49[2];
    uint64_t v50 = v49[3];
    uint64_t v53 = v49[4];
    uint64_t v52 = v49[5];
    if (v52 == 1)
    {
      outlined consume of CamModelVersion?(v33, (uint64_t)v104, v48, v34);
      outlined consume of CamModelVersion?(v51, v50, v53, 1);
    }
    else
    {
      uint64_t v55 = (uint64_t)v104;
      char v56 = static CamModelVersion.== infix(_:_:)(v33, (int)v104, v48, v34, v51, v50, v53, v52);
      outlined consume of CamModelVersion?(v33, v55, v48, v34);
      if (v56)
      {
        uint64_t v57 = (uint64_t)v100;
        uint64_t v58 = v114;
        uint64_t v59 = v106;
        if (one-time initialization token for common != -1) {
          swift_once();
        }
        uint64_t v60 = type metadata accessor for Logger();
        __swift_project_value_buffer(v60, (uint64_t)static Logger.common);
        uint64_t v61 = v101;
        v62 = v105;
        OUTLINED_FUNCTION_13_6();
        v62();
        uint64_t v63 = OUTLINED_FUNCTION_37_3();
        _s7SiriCam0B13ModelMetadataVWOcTm_1(v63, v64, v65);
        uint64_t v66 = (uint64_t)v102;
        outlined init with copy of (modelUrl: URL, modelMetadata: CamModelMetadata)(v61, (uint64_t)v102, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
        uint64_t v67 = v103;
        outlined init with take of (modelUrl: URL, modelMetadata: CamModelMetadata)(v61, v103);
        swift_retain_n();
        uint64_t v68 = Logger.logObject.getter();
        os_log_type_t v69 = static os_log_type_t.default.getter();
        int v70 = v69;
        if (os_log_type_enabled(v68, v69))
        {
          unint64_t v71 = (uint8_t *)OUTLINED_FUNCTION_8_8();
          uint64_t v113 = OUTLINED_FUNCTION_7_9();
          uint64_t v117 = v113;
          *(_DWORD *)unint64_t v71 = 136315394;
          uint64_t v72 = v62;
          uint64_t v73 = *(void *)(v58 + 16);
          unint64_t v74 = *(void *)(v58 + 24);
          swift_bridgeObjectRetain();
          uint64_t v115 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v73, v74, &v117);
          unint64_t v109 = v116;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          OUTLINED_FUNCTION_49_2();
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_38_2();
          char v104 = v71 + 14;
          LODWORD(v114) = v70;
          uint64_t v75 = v108;
          uint64_t v76 = *(int *)(v108 + 48);
          uint64_t v77 = v111;
          uint64_t v78 = v111 + v76;
          uint64_t v79 = v66 + v76;
          OUTLINED_FUNCTION_13_6();
          v72();
          _s7SiriCam0B13ModelMetadataVWOcTm_1(v79, v78, (void (*)(void))type metadata accessor for CamModelMetadata);
          uint64_t v80 = (uint64_t)&v112[*(int *)(v75 + 48)];
          (*(void (**)(char *, uint64_t, uint64_t))(v99 + 32))(v112, v77, v59);
          outlined init with take of CamModelMetadata(v78, v80);
          uint64_t v81 = String.init<A>(describing:)();
          uint64_t v115 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v81, v82, &v117);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v103, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
          outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v66, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
          _os_log_impl(&dword_1C9CFE000, v68, (os_log_type_t)v114, "%s: Not updating the model %s as it has not changed", v71, 0x16u);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_2_2();
          OUTLINED_FUNCTION_2_2();

          uint64_t v54 = (uint64_t)v100;
        }
        else
        {

          outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v67, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
          outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v66, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
          OUTLINED_FUNCTION_49_2();
          uint64_t v54 = v57;
        }
LABEL_22:
        outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v54, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
        return;
      }
    }
    uint64_t v83 = v114;
    uint64_t v84 = v108;
    if (one-time initialization token for common != -1) {
      swift_once();
    }
    uint64_t v85 = type metadata accessor for Logger();
    __swift_project_value_buffer(v85, (uint64_t)static Logger.common);
    swift_retain();
    v86 = Logger.logObject.getter();
    os_log_type_t v87 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v86, v87))
    {
      uint64_t v88 = (uint8_t *)OUTLINED_FUNCTION_29();
      uint64_t v117 = OUTLINED_FUNCTION_7_1();
      *(_DWORD *)uint64_t v88 = 136315138;
      uint64_t v89 = *(void *)(v83 + 16);
      unint64_t v90 = *(void *)(v83 + 24);
      swift_bridgeObjectRetain();
      uint64_t v91 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v89, v90, &v117);
      OUTLINED_FUNCTION_43_2(v91);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C9CFE000, v86, v87, "%s: Found a different model than current. Trying provisional model", v88, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_2_2();
    }
    else
    {

      swift_release();
    }
    uint64_t v92 = (uint64_t)v109;
    uint64_t v93 = (uint64_t)v100;
    uint64_t v94 = v113;
    uint64_t v95 = v113 + *(int *)(v84 + 48);
    OUTLINED_FUNCTION_24_12();
    v96();
    _s7SiriCam0B13ModelMetadataVWOcTm_1(v92, v95, (void (*)(void))type metadata accessor for CamModelMetadata);
    CoreMLHandler.loadModel(from:)(v94, v95);
    outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v93, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    outlined destroy of CamModelMetadata(v95);
    OUTLINED_FUNCTION_13_1();
    v97();
  }
}

MLDictionaryFeatureProvider __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CoreMLHandler.predict(from:)(Swift::OpaquePointer from)
{
  uint64_t v4 = v1;
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void **)(v1 + 32);
  if (v5)
  {
    id v7 = v5;
    specialized _dictionaryUpCast<A, B, C, D>(_:)((uint64_t)from._rawValue);
    id v8 = objc_allocWithZone(MEMORY[0x1E4F1E930]);
    id v9 = @nonobjc MLDictionaryFeatureProvider.init(dictionary:)();
    p_flags = &value witness table for UserHistoryTieBreaker.flags;
    if (v2)
    {
      uint64_t v11 = v2;
    }
    else
    {
      uint64_t v33 = v9;
      v123 = &type metadata for CamFeatureFlag;
      unint64_t v124 = lazy protocol witness table accessor for type CamFeatureFlag and conformance CamFeatureFlag();
      v121[0] = 0;
      char v34 = isFeatureEnabled(_:)();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v121);
      if (v34)
      {
        id v35 = objc_msgSend(v33, sel_dictionary);
        type metadata accessor for MLMultiArray(0, (unint64_t *)&lazy cache variable for type metadata for MLFeatureValue);
        uint64_t v36 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

        CoreMLHandler.logModelFeatures(modelFeatures:)(v36);
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v114 = (uint64_t)v7;
        if (one-time initialization token for common != -1) {
          swift_once();
        }
        uint64_t v38 = type metadata accessor for Logger();
        __swift_project_value_buffer(v38, (uint64_t)static Logger.common);
        swift_retain();
        uint64_t v39 = Logger.logObject.getter();
        os_log_type_t v40 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v39, v40))
        {
          unint64_t v41 = (uint8_t *)OUTLINED_FUNCTION_29();
          uint64_t v103 = (uint64_t)v33;
          *(void *)v121 = OUTLINED_FUNCTION_7_1();
          *(_DWORD *)unint64_t v41 = 136315138;
          uint64_t v42 = *(void *)(v4 + 16);
          unint64_t v43 = *(void *)(v4 + 24);
          swift_bridgeObjectRetain();
          getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v42, v43, (uint64_t *)v121);
          OUTLINED_FUNCTION_11_17();
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_release();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1C9CFE000, v39, v40, "%s: Feature flag for verbose logging is disabled. Not logging model features", v41, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_2_2();
          OUTLINED_FUNCTION_2_2();
        }
        else
        {

          swift_release();
        }
        id v7 = (id)v114;
      }
      id v115 = objc_msgSend(v7, sel_modelDescription);
      id v44 = objc_msgSend(v115, sel_inputDescriptionsByName);
      type metadata accessor for MLMultiArray(0, &lazy cache variable for type metadata for MLFeatureDescription);
      OUTLINED_FUNCTION_28_2();
      uint64_t v45 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v46 = swift_bridgeObjectRetain();
      uint64_t v108 = v45;
      uint64_t v47 = specialized Set.init<A>(_:)(v46);
      id v48 = objc_msgSend(v33, sel_dictionary);
      type metadata accessor for MLMultiArray(0, (unint64_t *)&lazy cache variable for type metadata for MLFeatureValue);
      uint64_t v49 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v50 = specialized Set.init<A>(_:)(v49);
      uint64_t v51 = specialized Set.subtracting(_:)(v50, v47);
      uint64_t v52 = v33;
      uint64_t v53 = v51;
      swift_bridgeObjectRelease();
      if (*(void *)(v53 + 16))
      {
        *(void *)v121 = 0;
        unint64_t v122 = 0xE000000000000000;
        _StringGuts.grow(_:)(71);
        int v54 = OUTLINED_FUNCTION_46_2();
        OUTLINED_FUNCTION_12_14(v54, v55, v56, v57, v58, v59, v60, v61, v101, (uint64_t)v52, v108, v4, (uint64_t)v115, v119, v121[0]);
        swift_bridgeObjectRelease();
        v62._object = (void *)0x80000001C9DA4D00;
        v62._countAndFlagsBits = 0xD00000000000001FLL;
        String.append(_:)(v62);
        v63._countAndFlagsBits = Set.description.getter();
        String.append(_:)(v63);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_25_8(0xD000000000000024, (uint64_t)" in the MLDictionaryFeatureProvider.");
        id v64 = *(id *)v121;
        unint64_t v65 = v122;
        p_flags = &value witness table for UserHistoryTieBreaker.flags;
        if (one-time initialization token for common != -1) {
          swift_once();
        }
        uint64_t v66 = type metadata accessor for Logger();
        __swift_project_value_buffer(v66, (uint64_t)static Logger.common);
        swift_bridgeObjectRetain_n();
        uint64_t v67 = Logger.logObject.getter();
        os_log_type_t v68 = static os_log_type_t.error.getter();
        if (OUTLINED_FUNCTION_2_13(v68))
        {
          os_log_type_t v69 = (uint8_t *)OUTLINED_FUNCTION_29();
          *(void *)v121 = OUTLINED_FUNCTION_7_1();
          *(_DWORD *)os_log_type_t v69 = 136315138;
          swift_bridgeObjectRetain();
          getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)((uint64_t)v64, v65, (uint64_t *)v121);
          OUTLINED_FUNCTION_11_17();
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_1C9CFE000, v67, (os_log_type_t)v48, "%s", v69, 0xCu);
          swift_arrayDestroy();
          p_flags = (_DWORD *)(&value witness table for UserHistoryTieBreaker + 80);
          OUTLINED_FUNCTION_2_2();
          OUTLINED_FUNCTION_2_2();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        lazy protocol witness table accessor for type ModelError and conformance ModelError();
        uint64_t v11 = (void *)OUTLINED_FUNCTION_3();
        *uint64_t v75 = v64;
        v75[1] = v65;
        OUTLINED_FUNCTION_22_9((uint64_t)v11, (uint64_t)v75);

        swift_bridgeObjectRelease();
        uint64_t v4 = v111;
      }
      else
      {
        swift_bridgeObjectRelease();
        *(void *)v121 = 0;
        id v70 = objc_msgSend(v7, sel_predictionFromFeatures_error_, v52, v121);
        id v71 = *(id *)v121;
        uint64_t v72 = v52;
        if (v70)
        {
          self;
          uint64_t v73 = swift_dynamicCastObjCClass();
          if (v73)
          {
            uint64_t v30 = v73;
            id v74 = v71;

            swift_bridgeObjectRelease();
            return (MLDictionaryFeatureProvider)v30;
          }
          *(void *)v121 = 0;
          unint64_t v122 = 0xE000000000000000;
          id v77 = v71;
          _StringGuts.grow(_:)(65);
          int v78 = swift_bridgeObjectRetain();
          OUTLINED_FUNCTION_12_14(v78, v79, v80, v81, v82, v83, v84, v85, v101, v103, v108, v4, (uint64_t)v115, v119, v121[0]);
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_25_8(0xD00000000000003FLL, (uint64_t)": Model output was not castable to MLDictionaryFeatureProvider.");
          id v86 = *(id *)v121;
          unint64_t v87 = v122;
          lazy protocol witness table accessor for type ModelError and conformance ModelError();
          uint64_t v11 = (void *)OUTLINED_FUNCTION_3();
          *uint64_t v88 = v86;
          v88[1] = v87;
          OUTLINED_FUNCTION_22_9((uint64_t)v11, (uint64_t)v88);

          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
        }
        else
        {
          id v76 = *(id *)v121;
          uint64_t v11 = (void *)_convertNSErrorToError(_:)();

          swift_willThrow();
          swift_bridgeObjectRelease();
        }
        p_flags = &value witness table for UserHistoryTieBreaker.flags;
      }
    }
    *(void *)v121 = v11;
    id v89 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    uint64_t v90 = String.init<A>(reflecting:)();
    unint64_t v92 = v91;
    if (*((void *)p_flags + 275) != -1) {
      swift_once();
    }
    uint64_t v93 = type metadata accessor for Logger();
    __swift_project_value_buffer(v93, (uint64_t)static Logger.common);
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v30 = Logger.logObject.getter();
    os_log_type_t v94 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v30, v94))
    {
      uint64_t v118 = (uint64_t)v7;
      uint64_t v95 = (uint8_t *)OUTLINED_FUNCTION_8_8();
      *(void *)v121 = OUTLINED_FUNCTION_7_9();
      *(_DWORD *)uint64_t v95 = 136315394;
      uint64_t v96 = *(void *)(v4 + 16);
      unint64_t v97 = *(void *)(v4 + 24);
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v96, v97, (uint64_t *)v121);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      OUTLINED_FUNCTION_5_14();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_38_2();
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v90, v92, (uint64_t *)v121);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C9CFE000, v30, v94, "%s: Model prediction failed with error : %s", v95, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_2();
      id v7 = (id)v118;
      OUTLINED_FUNCTION_2_2();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_5_14();
    }
    lazy protocol witness table accessor for type ModelError and conformance ModelError();
    uint64_t v98 = OUTLINED_FUNCTION_3();
    *uint64_t v99 = v90;
    v99[1] = v92;
    OUTLINED_FUNCTION_22_9(v98, (uint64_t)v99);
  }
  else
  {
    unint64_t v122 = 0xE000000000000000;
    _StringGuts.grow(_:)(53);
    int v12 = OUTLINED_FUNCTION_46_2();
    OUTLINED_FUNCTION_12_14(v12, v13, v14, v15, v16, v17, v18, v19, v101, v103, v106, v109, v112, v119, 0);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_25_8(0xD000000000000031, (uint64_t)": Prediction called without a model instance for ");
    int v20 = swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_12_14(v20, v21, v22, v23, v24, v25, v26, v27, v102, v104, v107, v110, v113, v120, v121[0]);
    swift_bridgeObjectRelease();
    id v28 = *(id *)v121;
    if (one-time initialization token for common != -1) {
      swift_once();
    }
    uint64_t v29 = type metadata accessor for Logger();
    __swift_project_value_buffer(v29, (uint64_t)static Logger.common);
    swift_bridgeObjectRetain_n();
    uint64_t v30 = Logger.logObject.getter();
    os_log_type_t v31 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_2_13(v31))
    {
      uint64_t v32 = (uint8_t *)OUTLINED_FUNCTION_29();
      *(void *)v121 = OUTLINED_FUNCTION_7_1();
      *(_DWORD *)uint64_t v32 = 136315138;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)((uint64_t)v28, 0xE000000000000000, (uint64_t *)v121);
      OUTLINED_FUNCTION_11_17();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C9CFE000, v30, v3, "%s", v32, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_2_2();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    lazy protocol witness table accessor for type CamError and conformance CamError();
    OUTLINED_FUNCTION_3();
    *(void *)uint64_t v37 = v28;
    *(void *)(v37 + 8) = 0xE000000000000000;
    *(unsigned char *)(v37 + 16) = 2;
    swift_willThrow();
  }
  return (MLDictionaryFeatureProvider)v30;
}

uint64_t CoreMLHandler.getMetadata()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC7SiriCam13CoreMLHandler_modelMetadata;
  swift_beginAccess();
  return _s7SiriCam0B13ModelMetadataVWOcTm_1(v3, a1, (void (*)(void))type metadata accessor for CamModelMetadata);
}

void CoreMLHandler.loadModel(from:)(uint64_t a1, uint64_t a2)
{
  uint64_t v196 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata)?);
  OUTLINED_FUNCTION_1_3();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_4_11();
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_4_11();
  MEMORY[0x1F4188790](v7);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_4_11();
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_20_1();
  uint64_t v204 = v9;
  uint64_t v10 = type metadata accessor for CamModelMetadata();
  MEMORY[0x1F4188790](v10 - 8);
  OUTLINED_FUNCTION_2_1();
  uint64_t v203 = v12 - v11;
  uint64_t v13 = type metadata accessor for URL();
  OUTLINED_FUNCTION_1_2();
  uint64_t v15 = v14;
  MEMORY[0x1F4188790](v16);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_4_11();
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_4_11();
  MEMORY[0x1F4188790](v18);
  v207 = (char *)v191 - v19;
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_20_1();
  v215 = (char *)v21;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
  OUTLINED_FUNCTION_1_3();
  MEMORY[0x1F4188790](v23);
  OUTLINED_FUNCTION_5_2();
  uint64_t v220 = v24;
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x1F4188790](v25);
  OUTLINED_FUNCTION_10_0();
  uint64_t v210 = v26;
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x1F4188790](v27);
  OUTLINED_FUNCTION_10_0();
  uint64_t v209 = v28;
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x1F4188790](v29);
  OUTLINED_FUNCTION_4_11();
  MEMORY[0x1F4188790](v30);
  OUTLINED_FUNCTION_4_11();
  MEMORY[0x1F4188790](v31);
  OUTLINED_FUNCTION_10_0();
  uint64_t v208 = v32;
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x1F4188790](v33);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_4_11();
  MEMORY[0x1F4188790](v34);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_4_11();
  MEMORY[0x1F4188790](v35);
  OUTLINED_FUNCTION_4_11();
  MEMORY[0x1F4188790](v36);
  OUTLINED_FUNCTION_10_0();
  v211 = v37;
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x1F4188790](v38);
  OUTLINED_FUNCTION_10_0();
  uint64_t v214 = v39;
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x1F4188790](v40);
  OUTLINED_FUNCTION_40();
  MEMORY[0x1F4188790](v41);
  OUTLINED_FUNCTION_41_2();
  uint64_t v43 = MEMORY[0x1F4188790](v42);
  uint64_t v45 = (char *)v191 - v44;
  MEMORY[0x1F4188790](v43);
  uint64_t v47 = (char *)v191 + *(int *)(v22 + 48) - v46;
  uint64_t v219 = v15;
  uint64_t v49 = *(uint64_t (**)(void))(v15 + 16);
  uint64_t v48 = v15 + 16;
  v222 = v49;
  uint64_t v223 = (uint64_t)v191 - v46;
  uint64_t v50 = (uint64_t)v47;
  OUTLINED_FUNCTION_10_14();
  v51();
  _s7SiriCam0B13ModelMetadataVWOcTm_1(a2, v50, (void (*)(void))type metadata accessor for CamModelMetadata);
  static AssetProvider.setAssetsProvisional()();
  if (one-time initialization token for common != -1) {
    swift_once();
  }
  uint64_t v52 = type metadata accessor for Logger();
  uint64_t v53 = __swift_project_value_buffer(v52, (uint64_t)static Logger.common);
  uint64_t v54 = (uint64_t)&v45[*(int *)(v22 + 48)];
  OUTLINED_FUNCTION_10_14();
  v55();
  uint64_t v221 = v50;
  _s7SiriCam0B13ModelMetadataVWOcTm_1(v50, v54, (void (*)(void))type metadata accessor for CamModelMetadata);
  outlined init with copy of (modelUrl: URL, modelMetadata: CamModelMetadata)((uint64_t)v45, v2, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
  uint64_t v56 = OUTLINED_FUNCTION_35_3();
  outlined init with take of (modelUrl: URL, modelMetadata: CamModelMetadata)(v56, v57);
  uint64_t v58 = v218;
  swift_retain();
  uint64_t v213 = v53;
  int v59 = Logger.logObject.getter();
  os_log_type_t v60 = static os_log_type_t.debug.getter();
  uint64_t v61 = v22;
  Swift::String v62 = (void (*)(void))v13;
  LODWORD(v217) = v60;
  uint64_t v63 = v3;
  if (os_log_type_enabled(v59, v60))
  {
    uint64_t v64 = OUTLINED_FUNCTION_8_8();
    uint64_t v216 = OUTLINED_FUNCTION_7_9();
    v224 = (char *)v216;
    *(_DWORD *)uint64_t v64 = 136315394;
    os_log_t v193 = v59;
    uint64_t v192 = v63;
    uint64_t v65 = *(void *)(v58 + 16);
    unint64_t v66 = *(void *)(v58 + 24);
    swift_bridgeObjectRetain();
    uint64_t v67 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v65, v66, (uint64_t *)&v224);
    OUTLINED_FUNCTION_32_7(v67);
    v191[2] = v68;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    swift_bridgeObjectRelease();
    *(_WORD *)(v64 + 12) = 2080;
    v191[1] = v64 + 14;
    uint64_t v69 = *(int *)(v61 + 48);
    uint64_t v70 = v214 + v69;
    uint64_t v71 = v2 + v69;
    OUTLINED_FUNCTION_48_2();
    OUTLINED_FUNCTION_10_14();
    v72();
    _s7SiriCam0B13ModelMetadataVWOcTm_1(v71, v70, (void (*)(void))type metadata accessor for CamModelMetadata);
    uint64_t v73 = v61;
    uint64_t v74 = URL.absoluteString.getter();
    unint64_t v76 = v75;
    OUTLINED_FUNCTION_13_1();
    v77();
    outlined destroy of CamModelMetadata(v70);
    uint64_t v78 = v74;
    uint64_t v61 = v73;
    uint64_t v225 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v78, v76, (uint64_t *)&v224);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v192, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v2, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    os_log_t v79 = v193;
    _os_log_impl(&dword_1C9CFE000, v193, (os_log_type_t)v217, "%s: Loading model from url : %s", (uint8_t *)v64, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_2_2();
  }
  else
  {
    swift_release();
    outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v3, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v2, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
  }
  int v80 = v215;
  v217 = (void (*)(void))objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1E990]), sel_init);
  objc_msgSend(v217, sel_setComputeUnits_, 0);
  uint64_t v216 = v61;
  uint64_t v81 = *(int *)(v61 + 48);
  uint64_t v82 = (uint64_t)v211;
  int v83 = (char *)v211 + v81;
  int v84 = v222;
  OUTLINED_FUNCTION_10_14();
  uint64_t v85 = v84();
  OUTLINED_FUNCTION_44_2(v85, v86, (void (*)(void))type metadata accessor for CamModelMetadata);
  unint64_t v87 = v212;
  CoreMLHandler.findModelFolder(assetOutput:)(v82, (uint64_t)v83, v80);
  uint64_t v88 = v62;
  if (v87)
  {
    outlined destroy of CamModelMetadata((uint64_t)v83);
    OUTLINED_FUNCTION_13_1();
    v89();
    uint64_t v90 = v216;
    uint64_t v97 = v209;
    OUTLINED_FUNCTION_10_14();
    uint64_t v98 = v84();
    OUTLINED_FUNCTION_44_2(v98, v99, (void (*)(void))type metadata accessor for CamModelMetadata);
    uint64_t v100 = v210;
    outlined init with copy of (modelUrl: URL, modelMetadata: CamModelMetadata)(v97, v210, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    uint64_t v101 = OUTLINED_FUNCTION_37_3();
    outlined init with take of (modelUrl: URL, modelMetadata: CamModelMetadata)(v101, v102);
    uint64_t v103 = v218;
    swift_retain();
    id v104 = v87;
    swift_retain();
    id v105 = v87;
    uint64_t v106 = Logger.logObject.getter();
    os_log_type_t v107 = static os_log_type_t.error.getter();
    int v108 = v107;
    if (os_log_type_enabled(v106, v107))
    {
      uint64_t v109 = OUTLINED_FUNCTION_7_1();
      LODWORD(v221) = v108;
      uint64_t v110 = v109;
      uint64_t v216 = swift_slowAlloc();
      v224 = (char *)v216;
      *(_DWORD *)uint64_t v110 = 136315650;
      v215 = (char *)v106;
      v212 = v87;
      uint64_t v111 = *(void *)(v103 + 16);
      unint64_t v112 = *(void *)(v103 + 24);
      swift_bridgeObjectRetain();
      uint64_t v225 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v111, v112, (uint64_t *)&v224);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      OUTLINED_FUNCTION_49_2();
      swift_bridgeObjectRelease();
      *(_WORD *)(v110 + 12) = 2080;
      uint64_t v218 = v110 + 14;
      uint64_t v113 = *(int *)(v90 + 48);
      uint64_t v114 = v214;
      uint64_t v115 = v214 + v113;
      uint64_t v116 = v100 + v113;
      ((void (*)(uint64_t, uint64_t, void (*)(void)))v222)(v214, v100, v62);
      _s7SiriCam0B13ModelMetadataVWOcTm_1(v116, v115, (void (*)(void))type metadata accessor for CamModelMetadata);
      uint64_t v117 = v208 + *(int *)(v90 + 48);
      uint64_t v118 = v212;
      (*(void (**)(uint64_t, uint64_t, void (*)(void)))(v219 + 32))(v208, v114, v88);
      outlined init with take of CamModelMetadata(v115, v117);
      uint64_t v119 = String.init<A>(describing:)();
      uint64_t v225 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v119, v120, (uint64_t *)&v224);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v220, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
      outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v100, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
      *(_WORD *)(v110 + 22) = 2080;
      uint64_t v225 = (uint64_t)v118;
      id v121 = v118;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
      uint64_t v122 = String.init<A>(reflecting:)();
      uint64_t v225 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v122, v123, (uint64_t *)&v224);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      os_log_t v124 = (os_log_t)v215;
      _os_log_impl(&dword_1C9CFE000, (os_log_t)v215, (os_log_type_t)v221, "%s: Model load failed for model: %s with error: %s", (uint8_t *)v110, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_2_2();
    }
    else
    {
      OUTLINED_FUNCTION_49_2();
      outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v220, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
      uint64_t v125 = OUTLINED_FUNCTION_28_2();
      outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v125, v126);
    }
    swift_willThrow();

    char v127 = &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata);
    uint64_t v128 = v223;
    goto LABEL_13;
  }
  outlined destroy of CamModelMetadata((uint64_t)v83);
  uint64_t v91 = v219 + 8;
  unint64_t v92 = *(void (**)(void))(v219 + 8);
  OUTLINED_FUNCTION_13_9();
  v92();
  uint64_t v93 = type metadata accessor for MLMultiArray(0, &lazy cache variable for type metadata for MLModel);
  uint64_t v94 = (uint64_t)v207;
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_10_14();
  v84();
  uint64_t v95 = v217;
  id v96 = @nonobjc MLModel.__allocating_init(contentsOf:configuration:)(v94, v95);
  uint64_t v210 = v93;
  v211 = v95;
  v217 = v92;
  uint64_t v220 = v91;
  v212 = 0;
  uint64_t v129 = v48;
  uint64_t v130 = v218;
  unint64_t v131 = *(void **)(v218 + 32);
  *(void *)(v218 + 32) = v96;

  uint64_t v132 = v216;
  uint64_t v133 = v202;
  OUTLINED_FUNCTION_16_9();
  uint64_t v135 = v134();
  OUTLINED_FUNCTION_44_2(v135, v136, (void (*)(void))type metadata accessor for CamModelMetadata);
  uint64_t v137 = v206;
  outlined init with copy of (modelUrl: URL, modelMetadata: CamModelMetadata)(v133, v206, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
  v138 = v205;
  outlined init with take of (modelUrl: URL, modelMetadata: CamModelMetadata)(v133, (uint64_t)v205);
  swift_retain_n();
  v139 = Logger.logObject.getter();
  os_log_type_t v140 = static os_log_type_t.default.getter();
  int v141 = v140;
  if (os_log_type_enabled(v139, v140))
  {
    uint64_t v142 = OUTLINED_FUNCTION_8_8();
    LODWORD(v209) = v141;
    uint64_t v143 = v142;
    v207 = (char *)OUTLINED_FUNCTION_7_9();
    v224 = v207;
    *(_DWORD *)uint64_t v143 = 136315394;
    uint64_t v144 = *(void *)(v130 + 16);
    unint64_t v145 = *(void *)(v130 + 24);
    swift_bridgeObjectRetain();
    uint64_t v146 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v144, v145, (uint64_t *)&v224);
    OUTLINED_FUNCTION_32_7(v146);
    uint64_t v202 = v147;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v143 + 12) = 2080;
    os_log_t v193 = (os_log_t)(v143 + 14);
    uint64_t v148 = *(int *)(v216 + 48);
    uint64_t v149 = v137;
    uint64_t v150 = v214;
    uint64_t v151 = v214 + v148;
    v138 = v88;
    uint64_t v152 = v149 + v148;
    OUTLINED_FUNCTION_16_9();
    v153();
    _s7SiriCam0B13ModelMetadataVWOcTm_1(v152, v151, (void (*)(void))type metadata accessor for CamModelMetadata);
    uint64_t v154 = v208 + *(int *)(v216 + 48);
    OUTLINED_FUNCTION_48_2();
    v155();
    uint64_t v156 = v154;
    uint64_t v132 = v216;
    outlined init with take of CamModelMetadata(v151, v156);
    uint64_t v157 = String.init<A>(describing:)();
    uint64_t v225 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v157, v158, (uint64_t *)&v224);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?((uint64_t)v205, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v206, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    unint64_t v92 = (void (*)(void))v139;
    _os_log_impl(&dword_1C9CFE000, v139, (os_log_type_t)v209, "%s: Model load succeeded for model: %s", (uint8_t *)v143, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_2_2();

    OUTLINED_FUNCTION_45_2();
    v88();
    OUTLINED_FUNCTION_26_9();
  }
  else
  {

    outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?((uint64_t)v138, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v137, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    swift_release_n();
    OUTLINED_FUNCTION_45_2();
    v138();
    OUTLINED_FUNCTION_26_9();
    uint64_t v150 = v214;
  }
  uint64_t v159 = v150 + *(int *)(v132 + 48);
  uint64_t v216 = v129;
  OUTLINED_FUNCTION_16_9();
  uint64_t v161 = v160();
  OUTLINED_FUNCTION_44_2(v161, v162, (void (*)(void))type metadata accessor for CamModelMetadata);
  uint64_t v163 = v203;
  outlined init with take of CamModelMetadata(v159, v203);
  uint64_t v164 = v130 + OBJC_IVAR____TtC7SiriCam13CoreMLHandler_modelMetadata;
  swift_beginAccess();
  outlined assign with take of CamModelMetadata(v163, v164);
  swift_endAccess();
  uint64_t v165 = v150;
  v166 = v88;
  ((void (*)(uint64_t, void (*)(void)))v138)(v165, v88);
  if (*(void *)(v130 + 16) == 0xD000000000000025 && *(void *)(v130 + 24) == 0x80000001C9DA2580
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v92, 1, 1, v132);
    uint64_t v167 = v201;
    uint64_t v168 = v212;
    static AssetProvider.fetchModel(_:)(v201, (uint64_t)&v201[*(int *)(v132 + 48)], 0xD000000000000029, 0x80000001C9DA2510);
    if (v168)
    {

      v212 = 0;
      uint64_t v169 = 1;
    }
    else
    {
      v212 = 0;
      uint64_t v169 = 0;
    }
    v170 = (void (*)(void))v222;
    uint64_t v171 = v200;
    __swift_storeEnumTagSinglePayload((uint64_t)v167, v169, 1, v132);
    outlined assign with take of (modelUrl: URL, modelMetadata: CamModelMetadata)?((uint64_t)v167, (uint64_t)v92);
    outlined init with copy of (modelUrl: URL, modelMetadata: CamModelMetadata)((uint64_t)v92, v171, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata)?);
    if (__swift_getEnumTagSinglePayload(v171, 1, v132) == 1)
    {
      outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v171, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata)?);
      v172 = v211;
    }
    else
    {
      uint64_t v173 = *(int *)(v132 + 48);
      uint64_t v174 = v199;
      uint64_t v175 = v199 + v173;
      uint64_t v176 = v171 + v173;
      (*(void (**)(uint64_t, uint64_t, void (*)(void)))(v219 + 32))(v199, v171, v166);
      outlined init with take of CamModelMetadata(v176, v175);
      uint64_t v177 = v197;
      uint64_t v178 = v197 + *(int *)(v132 + 48);
      OUTLINED_FUNCTION_16_9();
      v170();
      uint64_t v179 = OUTLINED_FUNCTION_28_2();
      _s7SiriCam0B13ModelMetadataVWOcTm_1(v179, v180, v181);
      v182 = v212;
      CoreMLHandler.findModelFolder(assetOutput:)(v177, v178, v198);
      if (v182)
      {
        outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v174, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
        outlined destroy of CamModelMetadata(v178);
        OUTLINED_FUNCTION_13_1();
        v183();
        v185 = Logger.logObject.getter();
        os_log_type_t v186 = static os_log_type_t.error.getter();
        if (OUTLINED_FUNCTION_2_13(v186))
        {
          v187 = (uint8_t *)OUTLINED_FUNCTION_29();
          uint64_t v225 = OUTLINED_FUNCTION_7_1();
          *(_DWORD *)v187 = 136315138;
          swift_beginAccess();
          outlined init with copy of (modelUrl: URL, modelMetadata: CamModelMetadata)((uint64_t)v92, v195, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata)?);
          uint64_t v188 = String.init<A>(describing:)();
          uint64_t v190 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v188, v189, &v225);
          OUTLINED_FUNCTION_43_2(v190);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1C9CFE000, v185, (os_log_type_t)v166, "Load model failed for %s. Skipping promotion of all assets", v187, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_2_2();
          OUTLINED_FUNCTION_2_2();

          outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v223, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
          uint64_t v128 = v204;
          char v127 = &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata)?;
LABEL_13:
          outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v128, v127);
          return;
        }

LABEL_33:
        outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v223, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
        char v127 = &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata)?;
        uint64_t v128 = (uint64_t)v92;
        goto LABEL_13;
      }
      outlined destroy of CamModelMetadata(v178);
      unint64_t v92 = v217;
      OUTLINED_FUNCTION_13_9();
      v92();
      uint64_t v184 = v194;
      OUTLINED_FUNCTION_37_3();
      OUTLINED_FUNCTION_10_14();
      v170();

      OUTLINED_FUNCTION_13_9();
      v92();
      outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v199, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
      v172 = v211;
      OUTLINED_FUNCTION_26_9();
    }
    static AssetProvider.promoteAssets()();

    goto LABEL_33;
  }
  outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v223, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
}

id @nonobjc MLModel.__allocating_init(contentsOf:configuration:)(uint64_t a1, void *a2)
{
  uint64_t v12 = (NSURL *)*MEMORY[0x1E4F143B8];
  URL._bridgeToObjectiveC()(v12);
  uint64_t v5 = v4;
  id v11 = 0;
  id v6 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_modelWithContentsOfURL_configuration_error_, v4, a2, &v11);

  if (v6)
  {
    id v7 = v11;
  }
  else
  {
    id v8 = v11;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }

  uint64_t v9 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
  return v6;
}

uint64_t CoreMLHandler.findModelFolder(assetOutput:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v147 = (uint8_t *)a2;
  unint64_t v131 = a3;
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x1F4188790](v4 - 8);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_4_11();
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_20_1();
  unint64_t v145 = v6;
  uint64_t v7 = type metadata accessor for URL();
  OUTLINED_FUNCTION_1_2();
  uint64_t v9 = v8;
  uint64_t v148 = v8;
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_5_2();
  uint64_t v137 = v11;
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_4_11();
  MEMORY[0x1F4188790](v13);
  uint64_t v149 = (char *)v129 - v14;
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_20_1();
  uint64_t v150 = v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
  OUTLINED_FUNCTION_1_3();
  MEMORY[0x1F4188790](v18);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_4_11();
  MEMORY[0x1F4188790](v19);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_4_11();
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_4_11();
  MEMORY[0x1F4188790](v21);
  OUTLINED_FUNCTION_4_11();
  MEMORY[0x1F4188790](v22);
  uint64_t v136 = ((char *)v129 - v23);
  OUTLINED_FUNCTION_2_5();
  MEMORY[0x1F4188790](v24);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_4_11();
  MEMORY[0x1F4188790](v25);
  OUTLINED_FUNCTION_4_11();
  uint64_t v27 = MEMORY[0x1F4188790](v26);
  uint64_t v29 = (char *)v129 - v28;
  uint64_t v30 = MEMORY[0x1F4188790](v27);
  uint64_t v32 = (char *)v129 - v31;
  uint64_t v33 = (char *)v129 + *(int *)(v30 + 48) - v31;
  uint64_t v34 = (void (*)(void))*((void *)v9 + 2);
  ((void (*)(char *, uint64_t, uint64_t))v34)((char *)v129 - v31, a1, v7);
  _s7SiriCam0B13ModelMetadataVWOcTm_1((uint64_t)v147, (uint64_t)v33, (void (*)(void))type metadata accessor for CamModelMetadata);
  id v35 = objc_msgSend(self, sel_defaultManager);
  uint64_t v138 = v17;
  uint64_t v36 = (uint64_t)&v29[*(int *)(v17 + 48)];
  OUTLINED_FUNCTION_48_2();
  uint64_t v146 = v34;
  uint64_t v147 = v9 + 16;
  v34();
  v139 = v33;
  uint64_t v37 = OUTLINED_FUNCTION_35_3();
  _s7SiriCam0B13ModelMetadataVWOcTm_1(v37, v38, (void (*)(void))type metadata accessor for CamModelMetadata);
  URL._bridgeToObjectiveC()(v39);
  uint64_t v41 = v40;
  outlined destroy of CamModelMetadata(v36);
  uint64_t v42 = (void (*)(char *, uint64_t))*((void *)v148 + 1);
  char v134 = v29;
  int v141 = v148 + 8;
  uint64_t v142 = v42;
  OUTLINED_FUNCTION_13_1();
  v43();
  id v152 = 0;
  id v44 = objc_msgSend(v35, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v41, 0, 0, &v152);

  id v45 = v152;
  if (!v44)
  {
    uint64_t v69 = v45;
    _convertNSErrorToError(_:)();

LABEL_23:
    swift_willThrow();
    return outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?((uint64_t)v32, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
  }
  os_log_type_t v140 = v32;
  uint64_t v46 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  id v152 = (id)MEMORY[0x1E4FBC860];
  uint64_t v47 = *(NSObject **)(v46 + 16);
  uint64_t v143 = v7;
  os_log_t v144 = v47;
  uint64_t v48 = (uint64_t)v145;
  if (!v47)
  {
LABEL_19:
    __swift_storeEnumTagSinglePayload(v48, 1, 1, v7);
LABEL_20:
    swift_bridgeObjectRelease();
    outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v48, &demangling cache variable for type metadata for URL?);
    uint64_t v60 = (uint64_t)v152;
    if (*((void *)v152 + 2) <= 1uLL)
    {
      if (one-time initialization token for common != -1) {
        goto LABEL_36;
      }
      goto LABEL_25;
    }
    id v152 = 0;
    unint64_t v153 = 0xE000000000000000;
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    id v152 = (id)0xD00000000000002CLL;
    unint64_t v153 = 0x80000001C9DA4C90;
    uint64_t v61 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay10Foundation3URLVG_SSs5NeverOTg5166_s7SiriCam13CoreMLHandlerC15findModelFolder11assetOutput10Foundation3URLVAH8modelUrl_AA0bF8MetadataV0lN0t_tKFSSAHcfu_33_43697e1f61f7e10b647d882195ad8775AHSSTf3nnnpk_nTf1cn_n(v60);
    swift_release();
    uint64_t v151 = v61;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    lazy protocol witness table accessor for type [String] and conformance [A]();
    uint64_t v62 = BidirectionalCollection<>.joined(separator:)();
    uint64_t v64 = v63;
    swift_bridgeObjectRelease();
    v65._countAndFlagsBits = v62;
    v65._object = v64;
    String.append(_:)(v65);
    swift_bridgeObjectRelease();
    id v66 = v152;
    unint64_t v67 = v153;
    lazy protocol witness table accessor for type CamError and conformance CamError();
    OUTLINED_FUNCTION_3();
    *(void *)uint64_t v68 = v66;
    *(void *)(v68 + 8) = v67;
    *(unsigned char *)(v68 + 16) = 2;
    uint64_t v32 = v140;
    goto LABEL_23;
  }
  uint64_t v49 = 0;
  uint64_t v50 = (void (**)(void))(v148 + 32);
  while ((unint64_t)v49 < *(void *)(v46 + 16))
  {
    OUTLINED_FUNCTION_13_6();
    v51();
    __swift_storeEnumTagSinglePayload(v48, 0, 1, v7);
    if (__swift_getEnumTagSinglePayload(v48, 1, v7) == 1) {
      goto LABEL_20;
    }
    uint64_t v52 = *v50;
    OUTLINED_FUNCTION_22_10();
    v52();
    if (URL.pathExtension.getter() == 0x636C65646F6D6C6DLL && v53 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease();
LABEL_13:
      OUTLINED_FUNCTION_22_10();
      v52();
      uint64_t v57 = v152;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v57[2] + 1, 1);
        uint64_t v57 = v152;
      }
      unint64_t v59 = v57[2];
      unint64_t v58 = v57[3];
      if (v59 >= v58 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v58 > 1, v59 + 1, 1);
        uint64_t v57 = v152;
      }
      v57[2] = v59 + 1;
      uint64_t v7 = v143;
      OUTLINED_FUNCTION_22_10();
      v52();
      id v152 = v57;
      goto LABEL_18;
    }
    char v55 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v55) {
      goto LABEL_13;
    }
    OUTLINED_FUNCTION_13_1();
    v56();
LABEL_18:
    uint64_t v49 = ((char *)v49 + 1);
    uint64_t v48 = (uint64_t)v145;
    if (v144 == v49) {
      goto LABEL_19;
    }
  }
  __break(1u);
LABEL_36:
  swift_once();
LABEL_25:
  uint64_t v71 = type metadata accessor for Logger();
  uint64_t v72 = __swift_project_value_buffer(v71, (uint64_t)static Logger.common);
  uint64_t v73 = v138;
  uint64_t v74 = v132;
  uint64_t v75 = v132 + *(int *)(v138 + 48);
  unint64_t v76 = v146;
  OUTLINED_FUNCTION_13_6();
  v76();
  _s7SiriCam0B13ModelMetadataVWOcTm_1((uint64_t)v139, v75, (void (*)(void))type metadata accessor for CamModelMetadata);
  uint64_t v77 = v133;
  outlined init with copy of (modelUrl: URL, modelMetadata: CamModelMetadata)(v74, v133, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
  uint64_t v78 = v74;
  os_log_t v79 = v136;
  outlined init with take of (modelUrl: URL, modelMetadata: CamModelMetadata)(v78, (uint64_t)v136);
  swift_retain_n();
  uint64_t v80 = Logger.logObject.getter();
  os_log_type_t v81 = static os_log_type_t.info.getter();
  LODWORD(v149) = v81;
  BOOL v82 = os_log_type_enabled((os_log_t)v80, v81);
  uint64_t v150 = (void *)v72;
  if (v82)
  {
    uint64_t v83 = OUTLINED_FUNCTION_8_8();
    os_log_t v144 = (os_log_t)v80;
    uint64_t v80 = v83;
    unint64_t v145 = (void *)OUTLINED_FUNCTION_7_9();
    id v152 = v145;
    *(_DWORD *)uint64_t v80 = 136315394;
    uint64_t v132 = v80 + 4;
    uint64_t v84 = *(int *)(v73 + 48);
    uint64_t v85 = v134;
    uint64_t v86 = (uint64_t)&v134[v84];
    uint64_t v87 = v77 + v84;
    OUTLINED_FUNCTION_13_6();
    v76();
    _s7SiriCam0B13ModelMetadataVWOcTm_1(v87, v86, (void (*)(void))type metadata accessor for CamModelMetadata);
    (*((void (**)(void, char *, uint64_t))v148 + 4))(v129[0], v85, v7);
    outlined destroy of CamModelMetadata(v86);
    lazy protocol witness table accessor for type URL and conformance URL((unint64_t *)&lazy protocol witness table cache variable for type URL and conformance URL, MEMORY[0x1E4F276F0]);
    dispatch thunk of CustomStringConvertible.description.getter();
    OUTLINED_FUNCTION_13_1();
    v88();
    uint64_t v89 = OUTLINED_FUNCTION_37_3();
    uint64_t v151 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v89, v90, v91);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?((uint64_t)v136, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v77, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    *(_WORD *)(v80 + 12) = 2080;
    uint64_t v92 = swift_retain();
    uint64_t v93 = MEMORY[0x1CB78D400](v92, v7);
    unint64_t v95 = v94;
    swift_release();
    uint64_t v96 = v93;
    uint64_t v7 = v143;
    uint64_t v151 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v96, v95, (uint64_t *)&v152);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    unint64_t v76 = v146;
    uint64_t v97 = v138;
    swift_bridgeObjectRelease();
    os_log_t v79 = v144;
    _os_log_impl(&dword_1C9CFE000, v144, (os_log_type_t)v149, "Searching %s found folders %s", (uint8_t *)v80, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_2_2();

    OUTLINED_FUNCTION_42_2();
  }
  else
  {
    outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?((uint64_t)v79, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v77, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));

    swift_release_n();
    OUTLINED_FUNCTION_42_2();
    uint64_t v97 = v73;
  }
  specialized Collection.first.getter();
  swift_release();
  uint64_t v98 = (uint64_t)v79 + *(int *)(v97 + 48);
  OUTLINED_FUNCTION_48_2();
  OUTLINED_FUNCTION_16_9();
  v76();
  _s7SiriCam0B13ModelMetadataVWOcTm_1((uint64_t)v139, v98, (void (*)(void))type metadata accessor for CamModelMetadata);
  if (__swift_getEnumTagSinglePayload(v80, 1, v7) == 1)
  {
    uint64_t v99 = v134;
    uint64_t v100 = (uint64_t)&v134[*(int *)(v97 + 48)];
    os_log_t v101 = v79;
    uint64_t v102 = (void (*)(char *, os_log_t, uint64_t))*((void *)v148 + 4);
    v102(v134, v101, v7);
    uint64_t v103 = OUTLINED_FUNCTION_28_2();
    outlined init with take of CamModelMetadata(v103, v104);
    id v105 = v99;
    unint64_t v76 = v146;
    v102(v131, v105, v7);
    outlined destroy of CamModelMetadata(v100);
    outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v80, &demangling cache variable for type metadata for URL?);
  }
  else
  {
    outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?((uint64_t)v79, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    uint64_t v106 = OUTLINED_FUNCTION_35_3();
    v107(v106);
  }
  uint64_t v108 = v135;
  uint64_t v109 = v130;
  uint64_t v110 = v130 + *(int *)(v138 + 48);
  OUTLINED_FUNCTION_16_9();
  v76();
  _s7SiriCam0B13ModelMetadataVWOcTm_1((uint64_t)v139, v110, (void (*)(void))type metadata accessor for CamModelMetadata);
  OUTLINED_FUNCTION_26_9();
  outlined init with copy of (modelUrl: URL, modelMetadata: CamModelMetadata)(v111, v80, v112);
  outlined init with take of (modelUrl: URL, modelMetadata: CamModelMetadata)(v109, v108);
  OUTLINED_FUNCTION_16_9();
  v76();
  uint64_t v113 = Logger.logObject.getter();
  os_log_type_t v114 = static os_log_type_t.info.getter();
  int v115 = v114;
  if (os_log_type_enabled(v113, v114))
  {
    uint64_t v116 = (uint8_t *)OUTLINED_FUNCTION_8_8();
    uint64_t v150 = (void *)OUTLINED_FUNCTION_7_9();
    id v152 = v150;
    *(_DWORD *)uint64_t v116 = 136315394;
    uint64_t v148 = v116 + 4;
    uint64_t v117 = *(int *)(v138 + 48);
    LODWORD(v149) = v115;
    uint64_t v118 = v134;
    uint64_t v119 = (uint64_t *)&v134[v117];
    unint64_t v120 = v76;
    uint64_t v121 = v80 + v117;
    ((void (*)(char *, uint64_t, uint64_t))v120)(v134, v80, v7);
    _s7SiriCam0B13ModelMetadataVWOcTm_1(v121, (uint64_t)v119, (void (*)(void))type metadata accessor for CamModelMetadata);
    uint64_t v122 = v7;
    uint64_t v124 = *v119;
    unint64_t v123 = v119[1];
    swift_bridgeObjectRetain();
    outlined destroy of CamModelMetadata((uint64_t)v119);
    v142(v118, v122);
    uint64_t v151 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v124, v123, (uint64_t *)&v152);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v135, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v80, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    OUTLINED_FUNCTION_38_2();
    lazy protocol witness table accessor for type URL and conformance URL((unint64_t *)&lazy protocol witness table cache variable for type URL and conformance URL, MEMORY[0x1E4F276F0]);
    uint64_t v125 = v137;
    uint64_t v126 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v151 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v126, v127, (uint64_t *)&v152);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v142(v125, v122);
    _os_log_impl(&dword_1C9CFE000, v113, (os_log_type_t)v149, "%s: Resolved model url %s", v116, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_2_2();
  }
  else
  {

    OUTLINED_FUNCTION_13_1();
    v128();
    outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v108, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
    outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?(v80, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
  }
  return outlined destroy of Apple_Parsec_Siri_V2alpha_Sash?((uint64_t)v140, &demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
}

uint64_t CoreMLHandler.logModelFeatures(modelFeatures:)(uint64_t a1)
{
  type metadata accessor for UUID();
  OUTLINED_FUNCTION_1_2();
  uint64_t v64 = v2;
  uint64_t v65 = v3;
  MEMORY[0x1F4188790](v2);
  OUTLINED_FUNCTION_2_1();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = type metadata accessor for URL();
  OUTLINED_FUNCTION_1_2();
  uint64_t v66 = v8;
  uint64_t v10 = MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_105();
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)&v56 - v14;
  uint64_t v16 = type metadata accessor for String.Encoding();
  MEMORY[0x1F4188790](v16 - 8);
  OUTLINED_FUNCTION_2_1();
  type metadata accessor for JSONEncoder();
  swift_allocObject();
  uint64_t v17 = JSONEncoder.init()();
  v69[0] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : MLFeatureValue]);
  lazy protocol witness table accessor for type [String : MLFeatureValue] and conformance <> [A : B]();
  uint64_t v18 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  unint64_t v20 = v19;
  unint64_t v59 = v12;
  uint64_t v61 = v17;
  uint64_t v62 = v15;
  uint64_t v63 = v7;
  static String.Encoding.utf8.getter();
  uint64_t v21 = String.init(data:encoding:)();
  if (v22)
  {
    unint64_t v57 = v22;
    uint64_t v58 = v18;
    uint64_t v56 = v21;
    unint64_t v60 = v20;
    id v23 = objc_msgSend(self, sel_defaultManager);
    id v24 = objc_msgSend(v23, sel_temporaryDirectory);

    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    v69[0] = 1601003875;
    v69[1] = 0xE400000000000000;
    UUID.init()();
    lazy protocol witness table accessor for type URL and conformance URL((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, MEMORY[0x1E4F27990]);
    uint64_t v25 = v64;
    v26._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v26);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t (*)(void, void)))(v65 + 8))(v6, v25);
    v27._countAndFlagsBits = 0x6E6F736A2ELL;
    v27._object = (void *)0xE500000000000000;
    String.append(_:)(v27);
    uint64_t v28 = v62;
    URL.appendingPathComponent(_:)();
    swift_bridgeObjectRelease();
    uint64_t v29 = v66;
    uint64_t v30 = v63;
    uint64_t v64 = *(uint64_t (**)(void, void))(v66 + 8);
    uint64_t v65 = v66 + 8;
    OUTLINED_FUNCTION_13_1();
    v31();
    if (one-time initialization token for common != -1) {
      swift_once();
    }
    uint64_t v32 = type metadata accessor for Logger();
    uint64_t v33 = __swift_project_value_buffer(v32, (uint64_t)static Logger.common);
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v59, v28, v30);
    uint64_t v34 = v67;
    swift_retain();
    id v35 = Logger.logObject.getter();
    os_log_type_t v36 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      uint64_t v66 = v33;
      v69[0] = v38;
      *(_DWORD *)uint64_t v37 = 136315394;
      uint64_t v39 = *(void *)(v67 + 16);
      unint64_t v40 = *(void *)(v67 + 24);
      swift_bridgeObjectRetain();
      uint64_t v68 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v39, v40, v69);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_38_2();
      lazy protocol witness table accessor for type URL and conformance URL((unint64_t *)&lazy protocol witness table cache variable for type URL and conformance URL, MEMORY[0x1E4F276F0]);
      uint64_t v41 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v68 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v41, v42, v69);
      uint64_t v43 = v58;
      uint64_t v34 = v67;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_13_1();
      v44();
      _os_log_impl(&dword_1C9CFE000, v35, v36, "%s: Writing CAM features to file: %s", v37, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_2_2();
    }
    else
    {
      swift_release();
      OUTLINED_FUNCTION_13_1();
      v46();

      uint64_t v43 = v58;
    }
    uint64_t v47 = (uint64_t)v62;
    Data.write(to:options:)();
    swift_retain_n();
    unint64_t v48 = v57;
    swift_bridgeObjectRetain();
    uint64_t v49 = Logger.logObject.getter();
    os_log_type_t v50 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v49, v50))
    {
      uint64_t v51 = swift_slowAlloc();
      v69[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v51 = 136315394;
      uint64_t v52 = *(void *)(v34 + 16);
      unint64_t v53 = *(void *)(v34 + 24);
      swift_bridgeObjectRetain();
      uint64_t v68 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v52, v53, v69);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      OUTLINED_FUNCTION_5_14();
      swift_bridgeObjectRelease();
      *(_WORD *)(v51 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v68 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v56, v48, v69);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C9CFE000, v49, v50, "%s: Making predictions from features : %s", (uint8_t *)v51, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_2_2();
      swift_release();
      outlined consume of Data._Representation(v58, v60);

      uint64_t v54 = v47;
      uint64_t v55 = v63;
    }
    else
    {
      swift_release();
      outlined consume of Data._Representation(v43, v60);
      OUTLINED_FUNCTION_5_14();
      swift_bridgeObjectRelease_n();

      uint64_t v54 = OUTLINED_FUNCTION_35_3();
    }
    return v64(v54, v55);
  }
  else
  {
    swift_release();
    return outlined consume of Data._Representation(v18, v20);
  }
}

uint64_t CoreMLHandler.deinit()
{
  swift_bridgeObjectRelease();

  outlined destroy of CamModelMetadata(v0 + OBJC_IVAR____TtC7SiriCam13CoreMLHandler_modelMetadata);
  return v0;
}

uint64_t CoreMLHandler.__deallocating_deinit()
{
  CoreMLHandler.deinit();
  OUTLINED_FUNCTION_0_14();
  uint64_t v2 = *(unsigned int *)(v1 + 48);
  uint64_t v3 = *(unsigned __int16 *)(v1 + 52);
  return MEMORY[0x1F4186488](v0, v2, v3);
}

uint64_t ObjC metadata update function for CoreMLHandler()
{
  return type metadata accessor for CoreMLHandler();
}

uint64_t type metadata accessor for CoreMLHandler()
{
  uint64_t result = type metadata singleton initialization cache for CoreMLHandler;
  if (!type metadata singleton initialization cache for CoreMLHandler) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata completion function for CoreMLHandler()
{
  uint64_t result = type metadata accessor for CamModelMetadata();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void protocol witness for ModelHandler.update() in conformance CoreMLHandler()
{
}

uint64_t protocol witness for ModelHandler.getMetadata() in conformance CoreMLHandler@<X0>(uint64_t a1@<X8>)
{
  return CoreMLHandler.getMetadata()(a1);
}

MLDictionaryFeatureProvider protocol witness for ModelHandler.predict(from:) in conformance CoreMLHandler(Swift::OpaquePointer a1)
{
  return CoreMLHandler.predict(from:)(a1);
}

unint64_t lazy protocol witness table accessor for type MLFeatureValue and conformance MLFeatureValue()
{
  unint64_t result = lazy protocol witness table cache variable for type MLFeatureValue and conformance MLFeatureValue;
  if (!lazy protocol witness table cache variable for type MLFeatureValue and conformance MLFeatureValue)
  {
    type metadata accessor for MLMultiArray(255, (unint64_t *)&lazy cache variable for type metadata for MLFeatureValue);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MLFeatureValue and conformance MLFeatureValue);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type URL and conformance URL(unint64_t *a1, void (*a2)(uint64_t))
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

id @nonobjc MLDictionaryFeatureProvider.init(dictionary:)()
{
  v6[1] = *(id *)MEMORY[0x1E4F143B8];
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v6[0] = 0;
  id v2 = objc_msgSend(v0, sel_initWithDictionary_error_, isa, v6);

  if (v2)
  {
    id v3 = v6[0];
  }
  else
  {
    id v4 = v6[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v2;
}

uint64_t outlined init with take of (modelUrl: URL, modelMetadata: CamModelMetadata)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined assign with take of CamModelMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CamModelMetadata();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t outlined assign with take of (modelUrl: URL, modelMetadata: CamModelMetadata)?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (modelUrl: URL, modelMetadata: CamModelMetadata)?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of (modelUrl: URL, modelMetadata: CamModelMetadata)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_24_12();
  v4();
  return a2;
}

uint64_t outlined copy of CamModelVersion?(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t specialized Dictionary.startIndex.getter(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
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
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  uint64_t v2 = 64;
  for (uint64_t i = 10; i - 8 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    unint64_t v1 = *(void *)(a1 + 8 * i);
    v2 += 64;
    if (v1) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

void *specialized Dictionary.subscript.getter(void *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  if (a2 < 0 || 1 << *(unsigned char *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a5 + 8 * ((unint64_t)a2 >> 6) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    char v5 = *(void **)(*(void *)(a5 + 56) + 8 * a2);
    *uint64_t result = v5;
    swift_bridgeObjectRetain();
    id v6 = v5;
    return (void *)OUTLINED_FUNCTION_28_2();
  }
LABEL_8:
  __break(1u);
  return result;
}

{
  uint64_t v5;

  if (a2 < 0 || 1 << *(unsigned char *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a5 + 8 * ((unint64_t)a2 >> 6) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    char v5 = *(void *)(*(void *)(a5 + 48) + 16 * a2);
    *uint64_t result = *(void *)(*(void *)(a5 + 56) + 8 * a2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return (void *)v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t _s7SiriCam0B13ModelMetadataVWOcTm_1(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_24_12();
  v4();
  return a2;
}

void OUTLINED_FUNCTION_12_14(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  uint64_t v18 = v16;
  uint64_t v19 = v15;
  String.append(_:)(*(Swift::String *)&v18);
}

void OUTLINED_FUNCTION_25_8(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v3 = (a2 - 32) | 0x8000000000000000;
  String.append(_:)(*(Swift::String *)&a1);
}

char *OUTLINED_FUNCTION_29_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  return &a10;
}

uint64_t OUTLINED_FUNCTION_32_7(uint64_t result)
{
  *(void *)(v1 - 72) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_35_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_37_3()
{
  return v0;
}

void OUTLINED_FUNCTION_38_2()
{
  *(_WORD *)(v0 + 12) = 2080;
}

uint64_t OUTLINED_FUNCTION_43_2(uint64_t a1)
{
  *(void *)(v1 - 120) = a1;
  return v1 - 120;
}

uint64_t OUTLINED_FUNCTION_44_2(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v6 = *(void *)(v4 - 144);
  return _s7SiriCam0B13ModelMetadataVWOcTm_1(v6, v3, a3);
}

uint64_t OUTLINED_FUNCTION_46_2()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_47_1()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_49_2()
{
  return swift_release_n();
}

uint64_t ActionCandidate.flowHandlerId.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ActionCandidate.parse.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ActionCandidate() + 20);
  return outlined init with copy of CamParse(v3, a1);
}

uint64_t type metadata accessor for ActionCandidate()
{
  uint64_t result = type metadata singleton initialization cache for ActionCandidate;
  if (!type metadata singleton initialization cache for ActionCandidate) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t ActionCandidate.affinityScore.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for ActionCandidate() + 24));
}

uint64_t ActionCandidate.userData.getter()
{
  type metadata accessor for ActionCandidate();
  return swift_bridgeObjectRetain();
}

uint64_t ActionCandidate.loggingId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ActionCandidate() + 32);
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t ActionCandidate.inferredBundleId.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for ActionCandidate() + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ActionCandidate.inferredBundleId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for ActionCandidate() + 36));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*ActionCandidate.inferredBundleId.modify())(void)
{
  return destructiveProjectEnumData for FeatureDictionaryError;
}

uint64_t ActionCandidate.init(flowHandlerId:parse:affinityScore:loggingId:userData:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  uint64_t v14 = (int *)type metadata accessor for ActionCandidate();
  uint64_t v15 = (void *)((char *)a7 + v14[9]);
  *a7 = a1;
  a7[1] = a2;
  outlined init with copy of CamParse(a3, (uint64_t)a7 + v14[5]);
  *(void *)((char *)a7 + v14[6]) = a4;
  *(void *)((char *)a7 + v14[7]) = a6;
  uint64_t v16 = (char *)a7 + v14[8];
  uint64_t v17 = type metadata accessor for UUID();
  OUTLINED_FUNCTION_0_3();
  uint64_t v19 = v18;
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v16, a5, v17);
  *uint64_t v15 = 0;
  v15[1] = 0;
  uint64_t v20 = specialized ActionProtocol.inferBundleId()();
  uint64_t v22 = v21;
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(a5, v17);
  outlined destroy of CamParse(a3);
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v15 = v20;
  v15[1] = v22;
  return result;
}

uint64_t ActionCandidate.description.getter()
{
  _StringGuts.grow(_:)(93);
  v1._countAndFlagsBits = 0xD00000000000001FLL;
  v1._object = (void *)0x80000001C9DA4D90;
  String.append(_:)(v1);
  uint64_t v2 = *v0;
  uint64_t v3 = (void *)v0[1];
  swift_bridgeObjectRetain();
  v4._countAndFlagsBits = v2;
  v4._object = v3;
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 0x3A6573726170202CLL;
  v5._object = (void *)0xE900000000000020;
  String.append(_:)(v5);
  type metadata accessor for ActionCandidate();
  type metadata accessor for CamParse(0);
  _print_unlocked<A, B>(_:_:)();
  v6._object = (void *)0x80000001C9DA4DB0;
  v6._countAndFlagsBits = 0xD000000000000011;
  String.append(_:)(v6);
  v7._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 0x614472657375202CLL;
  v8._object = (void *)0xEC000000203A6174;
  String.append(_:)(v8);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]?);
  v9._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v9);
  swift_bridgeObjectRelease();
  v10._countAndFlagsBits = 0x6E6967676F6C202CLL;
  v10._object = (void *)0xED0000203A644967;
  String.append(_:)(v10);
  type metadata accessor for UUID();
  lazy protocol witness table accessor for type UUID and conformance UUID();
  v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 41;
  v12._object = (void *)0xE100000000000000;
  String.append(_:)(v12);
  return 0;
}

void *initializeBufferWithCopyOfBuffer for ActionCandidate(void *a1, void *a2, int *a3)
{
  Swift::String v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) == 0)
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a3[5];
    Swift::String v9 = (void **)((char *)a1 + v8);
    Swift::String v10 = (void **)((char *)a2 + v8);
    uint64_t v11 = type metadata accessor for CamParse(0);
    swift_bridgeObjectRetain();
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v21 = *v10;
      *Swift::String v9 = *v10;
      id v22 = v21;
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
LABEL_12:
        uint64_t v30 = a3[7];
        *(void *)((char *)v4 + a3[6]) = *(void *)((char *)a2 + a3[6]);
        *(void *)((char *)v4 + v30) = *(void *)((char *)a2 + v30);
        uint64_t v31 = a3[8];
        uint64_t v32 = (char *)v4 + v31;
        uint64_t v33 = (char *)a2 + v31;
        uint64_t v34 = type metadata accessor for UUID();
        id v35 = *(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16);
        swift_bridgeObjectRetain();
        v35(v32, v33, v34);
        uint64_t v36 = a3[9];
        uint64_t v37 = (void *)((char *)v4 + v36);
        uint64_t v38 = (void *)((char *)a2 + v36);
        uint64_t v39 = v38[1];
        *uint64_t v37 = *v38;
        v37[1] = v39;
        swift_bridgeObjectRetain();
        return v4;
      }
      uint64_t v13 = type metadata accessor for Siri_Nlu_External_UserParse();
      (*(void (**)(void **, void **, uint64_t))(*(void *)(v13 - 8) + 16))(v9, v10, v13);
      uint64_t v14 = (int *)type metadata accessor for CamUSOParse(0);
      uint64_t v15 = v14[5];
      uint64_t v16 = (char *)v9 + v15;
      uint64_t v17 = (char *)v10 + v15;
      uint64_t v18 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
      if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v18))
      {
        uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
        memcpy(v16, v17, *(void *)(*(void *)(v19 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
        __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v18);
      }
      uint64_t v23 = v14[6];
      id v24 = (void **)((char *)v9 + v23);
      uint64_t v25 = (void **)((char *)v10 + v23);
      uint64_t v26 = v25[1];
      void *v24 = *v25;
      v24[1] = v26;
      uint64_t v27 = v14[7];
      uint64_t v28 = (char *)v9 + v27;
      uint64_t v29 = (char *)v10 + v27;
      v28[4] = v29[4];
      *(_DWORD *)uint64_t v28 = *(_DWORD *)v29;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
    goto LABEL_12;
  }
  uint64_t v20 = *a2;
  *Swift::String v4 = *a2;
  Swift::String v4 = (void *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
  swift_retain();
  return v4;
}

uint64_t destroy for ActionCandidate(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  Swift::String v4 = (id *)(a1 + *(int *)(a2 + 20));
  type metadata accessor for CamParse(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
  }
  else if (!EnumCaseMultiPayload)
  {
    uint64_t v6 = type metadata accessor for Siri_Nlu_External_UserParse();
    (*(void (**)(id *, uint64_t))(*(void *)(v6 - 8) + 8))(v4, v6);
    uint64_t v7 = (uint64_t)v4 + *(int *)(type metadata accessor for CamUSOParse(0) + 20);
    uint64_t v8 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
    if (!__swift_getEnumTagSinglePayload(v7, 1, v8)) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v9 = a1 + *(int *)(a2 + 32);
  uint64_t v10 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ActionCandidate(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (void **)((char *)a1 + v7);
  uint64_t v9 = (void **)((char *)a2 + v7);
  uint64_t v10 = type metadata accessor for CamParse(0);
  swift_bridgeObjectRetain();
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v19 = *v9;
    *uint64_t v8 = *v9;
    id v20 = v19;
LABEL_9:
    swift_storeEnumTagMultiPayload();
    goto LABEL_10;
  }
  if (!EnumCaseMultiPayload)
  {
    uint64_t v12 = type metadata accessor for Siri_Nlu_External_UserParse();
    (*(void (**)(void **, void **, uint64_t))(*(void *)(v12 - 8) + 16))(v8, v9, v12);
    uint64_t v13 = (int *)type metadata accessor for CamUSOParse(0);
    uint64_t v14 = v13[5];
    uint64_t v15 = (char *)v8 + v14;
    uint64_t v16 = (char *)v9 + v14;
    uint64_t v17 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
    if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17))
    {
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
      memcpy(v15, v16, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
      __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v17);
    }
    uint64_t v21 = v13[6];
    id v22 = (void **)((char *)v8 + v21);
    uint64_t v23 = (void **)((char *)v9 + v21);
    uint64_t v24 = v23[1];
    *id v22 = *v23;
    v22[1] = v24;
    uint64_t v25 = v13[7];
    uint64_t v26 = (char *)v8 + v25;
    uint64_t v27 = (char *)v9 + v25;
    v26[4] = v27[4];
    *(_DWORD *)uint64_t v26 = *(_DWORD *)v27;
    swift_bridgeObjectRetain();
    goto LABEL_9;
  }
  memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
LABEL_10:
  uint64_t v28 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v28) = *(void *)((char *)a2 + v28);
  uint64_t v29 = a3[8];
  uint64_t v30 = (char *)a1 + v29;
  uint64_t v31 = (char *)a2 + v29;
  uint64_t v32 = type metadata accessor for UUID();
  uint64_t v33 = *(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 16);
  swift_bridgeObjectRetain();
  v33(v30, v31, v32);
  uint64_t v34 = a3[9];
  id v35 = (void *)((char *)a1 + v34);
  uint64_t v36 = (void *)((char *)a2 + v34);
  uint64_t v37 = v36[1];
  *id v35 = *v36;
  v35[1] = v37;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ActionCandidate(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v6 = a3[5];
    uint64_t v7 = (void **)((char *)a1 + v6);
    uint64_t v8 = (void **)((char *)a2 + v6);
    outlined destroy of CamParse((uint64_t)a1 + v6);
    uint64_t v9 = type metadata accessor for CamParse(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v18 = *v8;
      *uint64_t v7 = *v8;
      id v19 = v18;
LABEL_10:
      swift_storeEnumTagMultiPayload();
      goto LABEL_11;
    }
    if (!EnumCaseMultiPayload)
    {
      uint64_t v11 = type metadata accessor for Siri_Nlu_External_UserParse();
      (*(void (**)(void **, void **, uint64_t))(*(void *)(v11 - 8) + 16))(v7, v8, v11);
      uint64_t v12 = (int *)type metadata accessor for CamUSOParse(0);
      uint64_t v13 = v12[5];
      uint64_t v14 = (char *)v7 + v13;
      uint64_t v15 = (char *)v8 + v13;
      uint64_t v16 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
      if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
      {
        uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
        memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
        __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
      }
      uint64_t v20 = v12[6];
      uint64_t v21 = (void **)((char *)v7 + v20);
      id v22 = (void **)((char *)v8 + v20);
      *uint64_t v21 = *v22;
      v21[1] = v22[1];
      uint64_t v23 = v12[7];
      uint64_t v24 = (char *)v7 + v23;
      uint64_t v25 = (char *)v8 + v23;
      int v26 = *(_DWORD *)v25;
      v24[4] = v25[4];
      *(_DWORD *)uint64_t v24 = v26;
      swift_bridgeObjectRetain();
      goto LABEL_10;
    }
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
LABEL_11:
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v27 = a3[8];
  uint64_t v28 = (char *)a1 + v27;
  uint64_t v29 = (char *)a2 + v27;
  uint64_t v30 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 24))(v28, v29, v30);
  uint64_t v31 = a3[9];
  uint64_t v32 = (void *)((char *)a1 + v31);
  uint64_t v33 = (void *)((char *)a2 + v31);
  *uint64_t v32 = *v33;
  v32[1] = v33[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for ActionCandidate(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for CamParse(0);
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    uint64_t v10 = type metadata accessor for Siri_Nlu_External_UserParse();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    uint64_t v11 = (int *)type metadata accessor for CamUSOParse(0);
    uint64_t v12 = v11[5];
    uint64_t v13 = &v7[v12];
    uint64_t v14 = &v8[v12];
    uint64_t v15 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
    if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15))
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
      memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
      __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
    }
    *(_OWORD *)&v7[v11[6]] = *(_OWORD *)&v8[v11[6]];
    uint64_t v17 = v11[7];
    uint64_t v18 = &v7[v17];
    id v19 = &v8[v17];
    v18[4] = v19[4];
    *(_DWORD *)uint64_t v18 = *(_DWORD *)v19;
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v20 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v20) = *(void *)((char *)a2 + v20);
  uint64_t v21 = a3[8];
  id v22 = (char *)a1 + v21;
  uint64_t v23 = (char *)a2 + v21;
  uint64_t v24 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v22, v23, v24);
  *(_OWORD *)((char *)a1 + a3[9]) = *(_OWORD *)((char *)a2 + a3[9]);
  return a1;
}

void *assignWithTake for ActionCandidate(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    uint64_t v7 = a3[5];
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    outlined destroy of CamParse((uint64_t)a1 + v7);
    uint64_t v10 = type metadata accessor for CamParse(0);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      uint64_t v11 = type metadata accessor for Siri_Nlu_External_UserParse();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
      uint64_t v12 = (int *)type metadata accessor for CamUSOParse(0);
      uint64_t v13 = v12[5];
      uint64_t v14 = &v8[v13];
      uint64_t v15 = &v9[v13];
      uint64_t v16 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
      if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
      {
        uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
        memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
        __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
      }
      *(_OWORD *)&v8[v12[6]] = *(_OWORD *)&v9[v12[6]];
      uint64_t v18 = v12[7];
      id v19 = &v8[v18];
      uint64_t v20 = &v9[v18];
      v19[4] = v20[4];
      *(_DWORD *)id v19 = *(_DWORD *)v20;
      swift_storeEnumTagMultiPayload();
    }
  }
  uint64_t v21 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v21) = *(void *)((char *)a2 + v21);
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[8];
  uint64_t v23 = (char *)a1 + v22;
  uint64_t v24 = (char *)a2 + v22;
  uint64_t v25 = type metadata accessor for UUID();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 40))(v23, v24, v25);
  uint64_t v26 = a3[9];
  uint64_t v27 = (void *)((char *)a1 + v26);
  uint64_t v28 = (void *)((char *)a2 + v26);
  uint64_t v30 = *v28;
  uint64_t v29 = v28[1];
  *uint64_t v27 = v30;
  v27[1] = v29;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ActionCandidate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1C9D95DC4);
}

uint64_t sub_1C9D95DC4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    type metadata accessor for CamParse(0);
    OUTLINED_FUNCTION_0_3();
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a3 + 20);
    }
    else
    {
      uint64_t v10 = type metadata accessor for UUID();
      uint64_t v11 = *(int *)(a3 + 32);
    }
    return __swift_getEnumTagSinglePayload(a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ActionCandidate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1C9D95E84);
}

uint64_t sub_1C9D95E84(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    type metadata accessor for CamParse(0);
    OUTLINED_FUNCTION_0_3();
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 20);
    }
    else
    {
      uint64_t v10 = type metadata accessor for UUID();
      uint64_t v11 = *(int *)(a4 + 32);
    }
    return __swift_storeEnumTagSinglePayload(v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t type metadata completion function for ActionCandidate()
{
  uint64_t result = type metadata accessor for CamParse(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for UUID();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t dispatch thunk of static FeatureExtracting.extractedFeatures.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of FeatureExtracting.extractImpl(from:)()
{
  OUTLINED_FUNCTION_1_27();
  return v0();
}

uint64_t FeatureExtracting.extract(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_1_27();
  uint64_t v7 = v6();
  if (!v3)
  {
    uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
    uint64_t v9 = specialized Set.init<A>(_:)(v8);
    swift_getAssociatedTypeWitness();
    OUTLINED_FUNCTION_0_27();
    v21[0] = swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_0_27();
    type metadata accessor for Dictionary.Keys();
    swift_getWitnessTable();
    OUTLINED_FUNCTION_0_27();
    uint64_t v10 = Set.init<A>(_:)();
    uint64_t v11 = specialized Set.subtracting(_:)(v10, v9);
    swift_bridgeObjectRelease();
    if (Set.isEmpty.getter())
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      v21[0] = 0;
      v21[1] = 0xE000000000000000;
      _StringGuts.grow(_:)(53);
      v12._countAndFlagsBits = 0x7365727574616546;
      v12._object = (void *)0xE900000000000020;
      String.append(_:)(v12);
      uint64_t v22 = v11;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Set<String>);
      swift_getWitnessTable();
      DefaultStringInterpolation.appendInterpolation<A>(_:)();
      swift_bridgeObjectRelease();
      v13._object = (void *)0x80000001C9DA2FB0;
      v13._countAndFlagsBits = 0xD00000000000002ALL;
      String.append(_:)(v13);
      if (one-time initialization token for common != -1) {
        swift_once();
      }
      uint64_t v14 = type metadata accessor for Logger();
      __swift_project_value_buffer(v14, (uint64_t)static Logger.common);
      swift_bridgeObjectRetain_n();
      uint64_t v15 = Logger.logObject.getter();
      os_log_type_t v16 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        uint64_t v18 = swift_slowAlloc();
        v21[0] = v18;
        *(_DWORD *)uint64_t v17 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v22 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0, 0xE000000000000000, v21);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1C9CFE000, v15, v16, "%s", v17, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1CB78E290](v18, -1, -1);
        MEMORY[0x1CB78E290](v17, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      lazy protocol witness table accessor for type CamError and conformance CamError();
      swift_allocError();
      *(void *)uint64_t v19 = 0;
      *(void *)(v19 + 8) = 0xE000000000000000;
      *(unsigned char *)(v19 + 16) = 1;
      swift_willThrow();
    }
  }
  return v7;
}

id static CaarResponseLogger.wrapIntoLogEvent(message:)(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA01A0]), sel_init);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FA0178]), sel_init);
  if (v4)
  {
    objc_msgSend(v3, sel_setEnded_, a1);
    objc_msgSend(v4, sel_setCaarRequestContext_, v3);
  }

  return v4;
}

void *static AppShortcutFeatureExtractor.extractedFeatures.getter()
{
  return &outlined read-only object #0 of static AppShortcutFeatureExtractor.extractedFeatures.getter;
}

uint64_t AppShortcutFeatureExtractor.extractImpl(from:)(uint64_t a1)
{
  BOOL v1 = AppShortcutFeatureExtractor.extractIsAppShortcut(from:)(a1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, MLFeatureValue)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C9D9D280;
  *(void *)(inited + 32) = 0x535F5050415F5349;
  *(void *)(inited + 40) = 0xEF54554354524F48;
  *(void *)(inited + 48) = objc_msgSend(self, sel_featureValueWithInt64_, v1);
  type metadata accessor for MLFeatureValue();
  return Dictionary.init(dictionaryLiteral:)();
}

BOOL AppShortcutFeatureExtractor.extractIsAppShortcut(from:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CamParse(0);
  MEMORY[0x1F4188790](v2);
  id v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for CamUSOParse(0);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for ActionCandidate();
  outlined init with copy of CamParse(a1 + *(int *)(v8 + 20), (uint64_t)v4);
  if (swift_getEnumCaseMultiPayload())
  {
    _s7SiriCam0B5ParseOWOhTm_6((uint64_t)v4, type metadata accessor for CamParse);
    return 0;
  }
  else
  {
    outlined init with take of CamUSOParse((uint64_t)v4, (uint64_t)v7);
    uint64_t v10 = CamUSOParse.appShortcutInvocation.getter();
    BOOL v9 = v11 != 0;
    if (v11) {
      outlined consume of AppShortcutInvocation?(v10, v11);
    }
    _s7SiriCam0B5ParseOWOhTm_6((uint64_t)v7, type metadata accessor for CamUSOParse);
  }
  return v9;
}

uint64_t _s7SiriCam0B5ParseOWOhTm_6(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t protocol witness for FeatureExtracting.extractImpl(from:) in conformance AppShortcutFeatureExtractor(uint64_t a1)
{
  return AppShortcutFeatureExtractor.extractImpl(from:)(a1);
}

ValueMetadata *type metadata accessor for AppShortcutFeatureExtractor()
{
  return &type metadata for AppShortcutFeatureExtractor;
}

void specialized static FeatureStoreLoggingProtocol.write(streamId:object:requestId:rcId:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5, uint64_t a6, void *a7)
{
}

{
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  Swift::String v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint8_t *v45;
  uint8_t *v46;
  unint64_t v47;
  uint64_t v48;
  Swift::String v51;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;

  v51._countAndFlagsBits = a6;
  v51._object = a7;
  uint64_t v10 = type metadata accessor for String.Encoding();
  uint64_t v11 = OUTLINED_FUNCTION_11_1(v10);
  MEMORY[0x1F4188790](v11);
  OUTLINED_FUNCTION_13_3();
  Swift::String v12 = type metadata accessor for JSONEncoder.NonConformingFloatEncodingStrategy();
  OUTLINED_FUNCTION_1_2();
  uint64_t v14 = v13;
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_2_1();
  uint64_t v18 = (void *)(v17 - v16);
  OUTLINED_FUNCTION_5_18();
  uint64_t v20 = v19;
  uint64_t v21 = MGGetBoolAnswer();

  if (v21)
  {
    type metadata accessor for JSONEncoder();
    swift_allocObject();
    JSONEncoder.init()();
    *uint64_t v18 = 6712937;
    v18[1] = 0xE300000000000000;
    v18[2] = 1718511917;
    v18[3] = 0xE400000000000000;
    v18[4] = 7233902;
    v18[5] = 0xE300000000000000;
    (*(void (**)(void *, void, uint64_t))(v14 + 104))(v18, *MEMORY[0x1E4F26D30], v12);
    dispatch thunk of JSONEncoder.nonConformingFloatEncodingStrategy.setter();
    __swift_project_boxed_opaque_existential_1(a3, a3[3]);
    uint64_t v22 = dispatch thunk of JSONEncoder.encode<A>(_:)();
    if (v7)
    {
LABEL_20:
      swift_release();
      return;
    }
    uint64_t v24 = v22;
    uint64_t v25 = v23;
    static String.Encoding.utf8.getter();
    uint64_t v26 = String.init(data:encoding:)();
    if (v27)
    {
      uint64_t v28 = v27;
      unint64_t v48 = v26;
      if (one-time initialization token for common != -1) {
        swift_once();
      }
      uint64_t v29 = type metadata accessor for Logger();
      __swift_project_value_buffer(v29, (uint64_t)static Logger.common);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      uint64_t v30 = Logger.logObject.getter();
      uint64_t v31 = static os_log_type_t.debug.getter();
      uint64_t v32 = a4;
      if (os_log_type_enabled(v30, v31))
      {
        uint64_t v47 = v25;
        uint64_t v33 = swift_slowAlloc();
        unint64_t v53 = swift_slowAlloc();
        *(_DWORD *)uint64_t v33 = 136315394;
        swift_bridgeObjectRetain();
        uint64_t v55 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a4, a5, &v53);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v33 + 12) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v55 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v48, v28, &v53);
        uint64_t v32 = a4;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1C9CFE000, v30, v31, "Writing object to Feature Store for %s: %s", (uint8_t *)v33, 0x16u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_2_2();
        uint64_t v25 = v47;
        OUTLINED_FUNCTION_2_2();
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      unint64_t v53 = v32;
      uint64_t v54 = a5;
      swift_bridgeObjectRetain();
      v41._countAndFlagsBits = 58;
      v41._object = (void *)0xE100000000000000;
      String.append(_:)(v41);
      String.append(_:)(v51);
      unint64_t v42 = v53;
      uint64_t v43 = v54;
      id v44 = objc_allocWithZone(MEMORY[0x1E4F618B0]);
      id v45 = (uint8_t *)@nonobjc FSFCurareInteractionAsJsonStr.init(jsonStr:interactionId:dataVersion:)(v48, v28, v42, v43, 1);
      if (v45)
      {
        uint64_t v46 = v45;
        specialized static FeatureStoreLoggingProtocol.write(streamId:interaction:)(a1, a2, v45);

LABEL_19:
        outlined consume of Data._Representation(v24, v25);
        goto LABEL_20;
      }
      lazy protocol witness table accessor for type CamError and conformance CamError();
      swift_allocError();
      *(void *)uint64_t v39 = 0xD00000000000001ELL;
      unint64_t v40 = "InteractionInitializationError";
    }
    else
    {
      lazy protocol witness table accessor for type CamError and conformance CamError();
      swift_allocError();
      *(void *)uint64_t v39 = 0xD00000000000001DLL;
      unint64_t v40 = "JSONStringInitializationError";
    }
    *(void *)(v39 + 8) = (unint64_t)(v40 - 32) | 0x8000000000000000;
    *(unsigned char *)(v39 + 16) = 4;
    swift_willThrow();
    goto LABEL_19;
  }
  if (one-time initialization token for common != -1) {
    swift_once();
  }
  uint64_t v34 = type metadata accessor for Logger();
  __swift_project_value_buffer(v34, (uint64_t)static Logger.common);
  id v35 = Logger.logObject.getter();
  uint64_t v36 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v35, v36))
  {
    *(_WORD *)swift_slowAlloc() = 0;
    OUTLINED_FUNCTION_15_15(&dword_1C9CFE000, v37, v38, "Skipping FS logging on prod build.");
    OUTLINED_FUNCTION_2_2();
  }
}

void specialized static FeatureStoreLoggingProtocol.write(streamId:interaction:)(uint64_t a1, uint64_t a2, uint8_t *a3)
{
  v22[1] = *(id *)MEMORY[0x1E4F143B8];
  if (!objc_msgSend(self, sel_isSupportedUser))
  {
    if (one-time initialization token for common != -1) {
      swift_once();
    }
    uint64_t v12 = type metadata accessor for Logger();
    __swift_project_value_buffer(v12, (uint64_t)static Logger.common);
    uint64_t v7 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v7, v13)) {
      goto LABEL_13;
    }
    *(_WORD *)swift_slowAlloc() = 0;
    OUTLINED_FUNCTION_15_15(&dword_1C9CFE000, v14, v15, "Cannot write to Feature Store because the user is not supported.");
    goto LABEL_11;
  }
  id v4 = self;
  uint64_t v5 = OUTLINED_FUNCTION_17_12();
  uint64_t v6 = (void *)MEMORY[0x1CB78D210](v5);
  uint64_t v7 = objc_msgSend(v4, sel_getWithStreamId_, v6);

  if (v7) {
    goto LABEL_5;
  }
  uint64_t v8 = OUTLINED_FUNCTION_17_12();
  uint64_t v10 = specialized static FeatureStoreLoggingProtocol.createStream(streamId:)(v8, v9);
  if (v10)
  {
    uint64_t v7 = v10;
LABEL_5:
    v22[0] = 0;
    if ([v7 insert:a3 error:v22])
    {
      id v11 = v22[0];
    }
    else
    {
      id v16 = v22[0];
      _convertNSErrorToError(_:)();

      swift_willThrow();
    }
    goto LABEL_13;
  }
  if (one-time initialization token for common != -1) {
    swift_once();
  }
  uint64_t v17 = type metadata accessor for Logger();
  __swift_project_value_buffer(v17, (uint64_t)static Logger.common);
  swift_bridgeObjectRetain_n();
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v18))
  {
    swift_slowAlloc();
    v22[0] = (id)OUTLINED_FUNCTION_11_0();
    *(_DWORD *)a3 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v19 = OUTLINED_FUNCTION_17_12();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v20, v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C9CFE000, v7, v18, "Failed to write to Feature Store because the stream %s cannot be found or created", a3, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_2();
LABEL_11:
    OUTLINED_FUNCTION_2_2();
LABEL_13:

    return;
  }

  swift_bridgeObjectRelease_n();
}

id specialized static FeatureStoreLoggingProtocol.createStream(streamId:)(uint64_t a1, unint64_t a2)
{
  id v4 = objc_allocWithZone(MEMORY[0x1E4F618B8]);
  swift_bridgeObjectRetain();
  id v5 = @nonobjc FSFCurareInteractionStream.init(streamId:)(a1, a2);
  if (v5)
  {
    if (one-time initialization token for common != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    __swift_project_value_buffer(v6, (uint64_t)static Logger.common);
    swift_bridgeObjectRetain_n();
    uint64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v7, v8))
    {
      unint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      *(_DWORD *)unint64_t v9 = 136315138;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, &v11);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C9CFE000, v7, v8, "Successfully created Feature Store stream: %s", v9, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_2_2();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  return v5;
}

uint64_t specialized implicit closure #2 in implicit closure #1 in AnyEncodable.init<A>(_:)(void *a1)
{
  return CamModelMetadata.encode(to:)(a1);
}

{
  return CamLogOutput.encode(to:)(a1);
}

uint64_t specialized ReflectedStringConvertible.description.getter()
{
  return specialized ReflectedStringConvertible.description.getter((uint64_t (*)(void))type metadata accessor for CamOutput);
}

uint64_t specialized ReflectedStringConvertible.description.getter(uint64_t (*a1)(void))
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Mirror?);
  uint64_t v5 = OUTLINED_FUNCTION_11_1(v4);
  MEMORY[0x1F4188790](v5);
  OUTLINED_FUNCTION_13_3();
  uint64_t v6 = type metadata accessor for Mirror();
  OUTLINED_FUNCTION_1_2();
  uint64_t v8 = v7;
  uint64_t v10 = MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)&v29 - v13;
  uint64_t v32 = a1(0);
  uint64_t v30 = v1;
  swift_retain();
  Mirror.init(reflecting:)();
  Mirror.subjectType.getter();
  uint64_t v30 = _typeName(_:qualified:)();
  uint64_t v31 = v15;
  v16._countAndFlagsBits = 40;
  v16._object = (void *)0xE100000000000000;
  String.append(_:)(v16);
  Mirror.superclassMirror.getter();
  if (__swift_getEnumTagSinglePayload(v2, 1, v6) == 1)
  {
    outlined destroy of RRDataSourceMetadataValue?(v2, &demangling cache variable for type metadata for Mirror?);
  }
  else
  {
    uint64_t v17 = OUTLINED_FUNCTION_16_11();
    v18(v17);
    Mirror.children.getter();
    uint64_t v19 = ReflectedStringConvertible.printElements(_:)();
    uint64_t v21 = v20;
    swift_release();
    v29._countAndFlagsBits = v19;
    v29._object = v21;
    swift_bridgeObjectRetain();
    v22._countAndFlagsBits = 8236;
    v22._object = (void *)0xE200000000000000;
    String.append(_:)(v22);
    swift_bridgeObjectRelease();
    String.append(_:)(v29);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v6);
  }
  Mirror.children.getter();
  uint64_t v23 = ReflectedStringConvertible.printElements(_:)();
  uint64_t v25 = v24;
  swift_release();
  v26._countAndFlagsBits = v23;
  v26._object = v25;
  String.append(_:)(v26);
  swift_bridgeObjectRelease();
  v27._countAndFlagsBits = 41;
  v27._object = (void *)0xE100000000000000;
  String.append(_:)(v27);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v14, v6);
  return v30;
}

uint64_t specialized static CamFeatureStoreLoggingProtocol.writeData(modelFeatures:modelOutput:modelMetadata:requestId:rcId:fsStream:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, void *a7, int a8)
{
  int v33 = a8;
  uint64_t v34 = a7;
  uint64_t v32 = a6;
  unint64_t v31 = a5;
  uint64_t v30 = a4;
  uint64_t v11 = type metadata accessor for CamModelMetadata();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v14 = MEMORY[0x1F4188790](v11 - 8);
  MEMORY[0x1F4188790](v14);
  Swift::String v16 = (char *)&v29 - v15;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, AnyEncodable)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1C9D9CFB0;
  uint64_t v18 = 0xE800000000000000;
  *(void *)(inited + 32) = 0x7365727574616566;
  *(void *)(inited + 40) = 0xE800000000000000;
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = a1;
  *(void *)(inited + 48) = partial apply for specialized implicit closure #2 in implicit closure #1 in AnyEncodable.init<A>(_:);
  *(void *)(inited + 56) = v19;
  *(void *)(inited + 64) = 0x74757074756FLL;
  *(void *)(inited + 72) = 0xE600000000000000;
  *(void *)(inited + 80) = partial apply for specialized implicit closure #2 in implicit closure #1 in AnyEncodable.init<A>(_:);
  *(void *)(inited + 88) = a2;
  *(void *)(inited + 96) = 0x617461646174656DLL;
  *(void *)(inited + 104) = 0xE800000000000000;
  outlined init with copy of AutoSendInput(a3, (uint64_t)v16, (void (*)(void))type metadata accessor for CamModelMetadata);
  outlined init with copy of AutoSendInput((uint64_t)v16, (uint64_t)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), (void (*)(void))type metadata accessor for CamModelMetadata);
  unint64_t v20 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v21 = swift_allocObject();
  char v22 = v33;
  outlined init with take of AutoSendInput((uint64_t)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v21 + v20, (void (*)(void))type metadata accessor for CamModelMetadata);
  swift_bridgeObjectRetain();
  swift_retain();
  outlined destroy of AutoSendInput((uint64_t)v16, (void (*)(void))type metadata accessor for CamModelMetadata);
  *(void *)(inited + 112) = _s7SiriCam12AnyEncodableVyACxcSERzlufcys7Encoder_pKcxcfu_ysAD_pKcfu0_AA0B13ModelMetadataV_Tg5TA_0;
  *(void *)(inited + 120) = v21;
  uint64_t v23 = Dictionary.init(dictionaryLiteral:)();
  if (v22)
  {
    if (v22 == 1)
    {
      uint64_t v24 = 0x65646F4D72616143;
      uint64_t v18 = 0xE90000000000006CLL;
    }
    else
    {
      uint64_t v24 = 0x646E65536F747541;
      uint64_t v18 = 0xED00006C65646F4DLL;
    }
  }
  else
  {
    uint64_t v24 = 0x6C65646F4D6D6143;
  }
  uint64_t v25 = v32;
  unint64_t v26 = v31;
  uint64_t v27 = v30;
  v35[3] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : AnyEncodable]);
  v35[4] = lazy protocol witness table accessor for type [String : AnyEncodable] and conformance <> [A : B]();
  v35[0] = v23;
  specialized static FeatureStoreLoggingProtocol.write(streamId:object:requestId:rcId:)(v24, v18, v35, v27, v26, v25, v34);
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
}

uint64_t AutoSendCoreHandler.init()()
{
  uint64_t v2 = v0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WordEmbeddingFeatureExtractor?);
  uint64_t v4 = OUTLINED_FUNCTION_11_1(v3);
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_2_1();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = type metadata accessor for AutoSendInputFeatureExtractor();
  uint64_t v9 = OUTLINED_FUNCTION_11_1(v8);
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_2_1();
  uint64_t v12 = (void *)(v11 - v10);
  uint64_t v14 = v11 - v10 + *(int *)(v13 + 44);
  uint64_t v15 = type metadata accessor for WordEmbeddingFeatureExtractor();
  OUTLINED_FUNCTION_13_14();
  *uint64_t v12 = 0x3FF0000000000000;
  v12[1] = 0;
  type metadata accessor for LatticePathFeatureExtractor();
  v12[2] = swift_allocObject();
  uint64_t v36 = &type metadata for CamFeatureFlag;
  uint64_t v37 = (_UNKNOWN **)lazy protocol witness table accessor for type CamFeatureFlag and conformance CamFeatureFlag();
  LOBYTE(v35) = 1;
  char v16 = isFeatureEnabled(_:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v35);
  if (v16 & 1) != 0 && (static WordEmbeddingFeatureExtractor.currentLocaleIsSupported()())
  {
    WordEmbeddingFeatureExtractor.init()(v7);
    if (v1)
    {
LABEL_8:
      outlined destroy of AutoSendInput((uint64_t)v12, (void (*)(void))type metadata accessor for AutoSendInputFeatureExtractor);
      type metadata accessor for AutoSendCoreHandler();
      swift_deallocPartialClassInstance();
      return v2;
    }
    __swift_storeEnumTagSinglePayload(v7, 0, 1, v15);
    uint64_t v17 = OUTLINED_FUNCTION_16_11();
    outlined assign with take of WordEmbeddingFeatureExtractor?(v17, v18);
  }
  else
  {
    outlined destroy of RRDataSourceMetadataValue?(v14, &demangling cache variable for type metadata for WordEmbeddingFeatureExtractor?);
    OUTLINED_FUNCTION_13_14();
  }
  uint64_t v19 = (void *)(v2 + OBJC_IVAR____TtC7SiriCam19AutoSendCoreHandler_autoSendInputFeatureExtractor);
  outlined init with take of AutoSendInput((uint64_t)v12, v2 + OBJC_IVAR____TtC7SiriCam19AutoSendCoreHandler_autoSendInputFeatureExtractor, (void (*)(void))type metadata accessor for AutoSendInputFeatureExtractor);
  uint64_t v20 = type metadata accessor for CoreMLHandler();
  swift_allocObject();
  uint64_t v21 = CoreMLHandler.init(forModelWithName:)(0xD000000000000029, 0x80000001C9DA2510);
  if (v1)
  {
    uint64_t v12 = v19;
    goto LABEL_8;
  }
  uint64_t v36 = (ValueMetadata *)v20;
  uint64_t v37 = &protocol witness table for CoreMLHandler;
  *(void *)&long long v35 = v21;
  outlined init with take of AppSelectionSignalComponent(&v35, v2 + 16);
  OUTLINED_FUNCTION_5_18();
  uint64_t v23 = v22;
  char v24 = MGGetBoolAnswer();

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AutoConfirmActionEnforcer>);
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_1C9D9D130;
  *(void *)(v25 + 56) = &type metadata for ForcedConfirmationActionEnforcer;
  *(void *)(v25 + 64) = &protocol witness table for ForcedConfirmationActionEnforcer;
  *(void *)(v25 + 96) = &type metadata for UserDefaultsActionEnforcer;
  *(void *)(v25 + 104) = &protocol witness table for UserDefaultsActionEnforcer;
  if (v24)
  {
    if (one-time initialization token for autoSend != -1) {
      swift_once();
    }
    uint64_t v26 = type metadata accessor for Logger();
    __swift_project_value_buffer(v26, (uint64_t)static Logger.autoSend);
    uint64_t v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl(&dword_1C9CFE000, v27, v28, "Detected internal build", v29, 2u);
      OUTLINED_FUNCTION_2_2();
    }

    unint64_t v31 = *(void *)(v25 + 16);
    unint64_t v30 = *(void *)(v25 + 24);
    if (v31 >= v30 >> 1)
    {
      specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v30 > 1, v31 + 1, 1, v25);
      uint64_t v25 = v34;
    }
    uint64_t v36 = &type metadata for AutoConfirmMagicWordsActionEnforcer;
    uint64_t v37 = &protocol witness table for AutoConfirmMagicWordsActionEnforcer;
    *(void *)(v25 + 16) = v31 + 1;
    outlined init with take of AppSelectionSignalComponent(&v35, v25 + 40 * v31 + 32);
  }
  uint64_t v32 = (uint64_t *)(v2 + OBJC_IVAR____TtC7SiriCam19AutoSendCoreHandler_autoSendEnforcer);
  v32[3] = (uint64_t)&type metadata for AutoConfirmSequentialEnforcer;
  v32[4] = (uint64_t)&protocol witness table for AutoConfirmSequentialEnforcer;
  *uint64_t v32 = v25;
  return v2;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> AutoSendCoreHandler.update()()
{
  swift_beginAccess();
  AutoSendInputFeatureExtractor.update()();
  swift_endAccess();
  if (!v1)
  {
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
    uint64_t v2 = OUTLINED_FUNCTION_17_12();
    v3(v2);
  }
}

unsigned char *AutoSendCoreHandler.handle(_:)(uint64_t a1)
{
  uint64_t v145 = type metadata accessor for DispatchWorkItemFlags();
  OUTLINED_FUNCTION_1_2();
  uint64_t v144 = v2;
  MEMORY[0x1F4188790](v3);
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_15_3(v4);
  uint64_t v143 = type metadata accessor for DispatchQoS();
  OUTLINED_FUNCTION_1_2();
  uint64_t v141 = v5;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_15_3(v7);
  uint64_t v139 = type metadata accessor for DispatchQoS.QoSClass();
  OUTLINED_FUNCTION_1_2();
  uint64_t v138 = v8;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_7_6();
  uint64_t v137 = v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  uint64_t v12 = OUTLINED_FUNCTION_11_1(v11);
  MEMORY[0x1F4188790](v12);
  OUTLINED_FUNCTION_7_6();
  uint64_t v130 = v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (CamLogOutput, CamModelMetadata));
  OUTLINED_FUNCTION_1_3();
  MEMORY[0x1F4188790](v15);
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_15_3(v16);
  uint64_t v131 = type metadata accessor for CamModelMetadata();
  OUTLINED_FUNCTION_1_3();
  MEMORY[0x1F4188790](v17);
  OUTLINED_FUNCTION_7_6();
  OUTLINED_FUNCTION_15_3(v18);
  uint64_t v19 = type metadata accessor for AutoSendInputFeatureExtractor();
  uint64_t v20 = OUTLINED_FUNCTION_11_1(v19);
  MEMORY[0x1F4188790](v20);
  OUTLINED_FUNCTION_7_6();
  uint64_t v153 = v21;
  type metadata accessor for OSSignpostID();
  OUTLINED_FUNCTION_1_2();
  uint64_t v151 = v23;
  uint64_t v152 = v22;
  uint64_t v24 = MEMORY[0x1F4188790](v22);
  uint64_t v26 = &v124[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v24);
  uint64_t v155 = &v124[-v27];
  uint64_t v28 = type metadata accessor for AutoSendInput();
  OUTLINED_FUNCTION_1_2();
  uint64_t v135 = v29;
  uint64_t v31 = MEMORY[0x1F4188790](v30);
  uint64_t v133 = &v124[-((v32 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v33 = MEMORY[0x1F4188790](v31);
  uint64_t v132 = &v124[-v34];
  uint64_t v35 = MEMORY[0x1F4188790](v33);
  uint64_t v149 = &v124[-v36];
  uint64_t v136 = v37;
  MEMORY[0x1F4188790](v35);
  uint64_t v39 = &v124[-v38];
  if (one-time initialization token for autoSend != -1) {
    swift_once();
  }
  uint64_t v40 = type metadata accessor for Logger();
  uint64_t v41 = __swift_project_value_buffer(v40, (uint64_t)static Logger.autoSend);
  outlined init with copy of AutoSendInput(a1, (uint64_t)v39, (void (*)(void))type metadata accessor for AutoSendInput);
  uint64_t v148 = v41;
  unint64_t v42 = Logger.logObject.getter();
  os_log_type_t v43 = static os_log_type_t.debug.getter();
  BOOL v44 = os_log_type_enabled(v42, v43);
  uint64_t v129 = v14;
  uint64_t v147 = v28;
  if (v44)
  {
    swift_slowAlloc();
    uint64_t v146 = v26;
    uint64_t v128 = (unsigned char *)OUTLINED_FUNCTION_11_0();
    aBlock = v128;
    *(_DWORD *)uint64_t v26 = 136315138;
    id v127 = v26 + 4;
    outlined init with copy of AutoSendInput((uint64_t)v39, (uint64_t)v149, (void (*)(void))type metadata accessor for AutoSendInput);
    uint64_t v45 = String.init<A>(describing:)();
    uint64_t v150 = (void *)a1;
    uint64_t v163 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v45, v46, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    uint64_t v47 = (uint64_t)v150;
    swift_bridgeObjectRelease();
    outlined destroy of AutoSendInput((uint64_t)v39, (void (*)(void))type metadata accessor for AutoSendInput);
    _os_log_impl(&dword_1C9CFE000, v42, v43, "Handling AutoSend input: %s", v26, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_2();
    uint64_t v26 = v146;
    OUTLINED_FUNCTION_2_2();
  }
  else
  {
    outlined destroy of AutoSendInput((uint64_t)v39, (void (*)(void))type metadata accessor for AutoSendInput);

    uint64_t v47 = a1;
  }
  uint64_t v48 = v156;
  if (one-time initialization token for autoSend != -1) {
    swift_once();
  }
  id v49 = (id)static Log.autoSend;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  OUTLINED_FUNCTION_18_14();
  uint64_t v50 = v48 + OBJC_IVAR____TtC7SiriCam19AutoSendCoreHandler_autoSendInputFeatureExtractor;
  swift_beginAccess();
  uint64_t v51 = v153;
  outlined init with copy of AutoSendInput(v50, v153, (void (*)(void))type metadata accessor for AutoSendInputFeatureExtractor);
  uint64_t v52 = v154;
  uint64_t v53 = specialized FeatureExtracting.extract(from:)(v47);
  if (v52)
  {
    outlined destroy of AutoSendInput(v51, (void (*)(void))type metadata accessor for AutoSendInputFeatureExtractor);
    OUTLINED_FUNCTION_18_1();
    v54();
  }
  else
  {
    uint64_t v55 = (unsigned char *)v53;
    uint64_t v150 = (void *)v47;
    outlined destroy of AutoSendInput(v51, (void (*)(void))type metadata accessor for AutoSendInputFeatureExtractor);
    uint64_t v56 = (void *)static Log.autoSend;
    static os_signpost_type_t.end.getter();
    OUTLINED_FUNCTION_18_14();
    id v57 = v56;
    OSSignpostID.init(log:)();
    static os_signpost_type_t.begin.getter();
    os_signpost(_:dso:log:name:signpostID:)();
    uint64_t v58 = v48;
    unint64_t v59 = (void *)(v48 + 16);
    unint64_t v60 = v26;
    uint64_t v61 = *(void *)(v58 + 40);
    uint64_t v62 = *(void *)(v58 + 48);
    __swift_project_boxed_opaque_existential_1(v59, v61);
    uint64_t v63 = (void *)(*(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v62 + 32))(v55, v61, v62);
    static os_signpost_type_t.end.getter();
    os_signpost(_:dso:log:name:signpostID:)();
    AutoSendOutputProvider.toAutoSendOutput(from:)(v63);
    id v127 = v63;
    uint64_t v154 = v64;
    uint64_t v146 = v60;
    uint64_t v153 = swift_allocBox();
    uint64_t v67 = v66;
    __swift_project_boxed_opaque_existential_1(v59, *(void *)(v156 + 40));
    uint64_t v131 = v67;
    uint64_t v68 = OUTLINED_FUNCTION_16_11();
    v69(v68);
    uint64_t v70 = (uint64_t)v150;
    uint64_t v71 = v132;
    outlined init with copy of AutoSendInput((uint64_t)v150, (uint64_t)v132, (void (*)(void))type metadata accessor for AutoSendInput);
    uint64_t v72 = v133;
    outlined init with copy of AutoSendInput(v70, (uint64_t)v133, (void (*)(void))type metadata accessor for AutoSendInput);
    uint64_t v73 = Logger.logObject.getter();
    os_log_type_t v74 = static os_log_type_t.debug.getter();
    int v75 = v74;
    BOOL v76 = os_log_type_enabled(v73, v74);
    uint64_t v128 = v55;
    if (v76)
    {
      uint64_t v77 = swift_slowAlloc();
      *(_DWORD *)uint64_t v77 = 67109376;
      uint64_t v126 = v73;
      uint64_t v78 = v147;
      int v79 = v71[*(int *)(v147 + 28)];
      int v125 = v75;
      outlined destroy of AutoSendInput((uint64_t)v71, (void (*)(void))type metadata accessor for AutoSendInput);
      LODWORD(aBlock) = v79;
      OUTLINED_FUNCTION_14_15();
      *(_WORD *)(v77 + 8) = 1024;
      uint64_t v80 = v78;
      uint64_t v81 = *(int *)(v78 + 28);
      uint64_t v73 = v126;
      BOOL v82 = (v72[v81] & 1) == 0;
      outlined destroy of AutoSendInput((uint64_t)v72, (void (*)(void))type metadata accessor for AutoSendInput);
      LODWORD(aBlock) = v82;
      OUTLINED_FUNCTION_14_15();
      _os_log_impl(&dword_1C9CFE000, v73, (os_log_type_t)v125, "Feature opt in status is %{BOOL}d, overriding shadow log field to %{BOOL}d.", (uint8_t *)v77, 0xEu);
      uint64_t v55 = v128;
      OUTLINED_FUNCTION_2_2();
    }
    else
    {
      outlined destroy of AutoSendInput((uint64_t)v72, (void (*)(void))type metadata accessor for AutoSendInput);
      outlined destroy of AutoSendInput((uint64_t)v71, (void (*)(void))type metadata accessor for AutoSendInput);
      uint64_t v80 = v147;
    }
    uint64_t v39 = v154;

    uint64_t v83 = *(int *)(v80 + 28);
    uint64_t v84 = v150;
    uint64_t v85 = v131;
    *(unsigned char *)(v131 + 48) = (*((unsigned char *)v150 + v83) & 1) == 0;
    uint64_t v86 = *(unsigned char **)(v156 + OBJC_IVAR____TtC7SiriCam19AutoSendCoreHandler_autoSendEnforcer + 24);
    uint64_t v87 = *(void *)(v156 + OBJC_IVAR____TtC7SiriCam19AutoSendCoreHandler_autoSendEnforcer + 32);
    __swift_project_boxed_opaque_existential_1((void *)(v156 + OBJC_IVAR____TtC7SiriCam19AutoSendCoreHandler_autoSendEnforcer), (uint64_t)v86);
    uint64_t v88 = type metadata accessor for CamModelMetadata;
    uint64_t v89 = v85;
    uint64_t v90 = v134;
    outlined init with copy of AutoSendInput(v89, v134, (void (*)(void))type metadata accessor for CamModelMetadata);
    (*(void (**)(unsigned char **__return_ptr, unsigned char *, unsigned char *, void *, uint64_t, unsigned char *, uint64_t))(v87 + 8))(&aBlock, v55, v39, v84, v90, v86, v87);
    outlined destroy of AutoSendInput(v90, (void (*)(void))type metadata accessor for CamModelMetadata);
    uint64_t v91 = v159;
    if (v159)
    {
      uint64_t v156 = v158;
      LODWORD(v134) = aBlock;
      swift_retain_n();
      swift_bridgeObjectRetain_n();
      uint64_t v92 = Logger.logObject.getter();
      uint64_t v93 = v39;
      os_log_type_t v94 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v92, v94))
      {
        uint64_t v95 = swift_slowAlloc();
        uint64_t v133 = (unsigned char *)swift_slowAlloc();
        aBlock = v133;
        *(_DWORD *)uint64_t v95 = 136315650;
        LOBYTE(v164) = v93[57];
        uint64_t v96 = String.init<A>(describing:)();
        uint64_t v164 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v96, v97, (uint64_t *)&aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v95 + 12) = 2080;
        LOBYTE(v164) = v134;
        uint64_t v98 = String.init<A>(describing:)();
        uint64_t v84 = (void *)v99;
        uint64_t v164 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v98, v99, (uint64_t *)&aBlock);
        uint64_t v88 = (uint64_t (*)())&v165;
        OUTLINED_FUNCTION_14_15();
        swift_bridgeObjectRelease();
        *(_WORD *)(v95 + 22) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v164 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v156, (unint64_t)v91, (uint64_t *)&aBlock);
        OUTLINED_FUNCTION_14_15();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1C9CFE000, v92, v94, "Overriding %s with %s due to %s", (uint8_t *)v95, 0x20u);
        uint64_t v86 = v133;
        swift_arrayDestroy();
        OUTLINED_FUNCTION_2_2();
        OUTLINED_FUNCTION_2_2();
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_release_n();
      }
      OUTLINED_FUNCTION_7_22();
      uint64_t v39 = v93;
      LOBYTE(aBlock) = v134;
      v100._countAndFlagsBits = v156;
      v100._object = v91;
      AutoSendOutput.overrideAction(action:enforcer:)((SiriCam::AutoConfirmAction)&aBlock, v100);
      swift_bridgeObjectRelease();
    }
    else
    {
      OUTLINED_FUNCTION_7_22();
    }
    uint64_t v101 = (uint64_t)v84 + *((int *)v86 + 12);
    *uint64_t v84 = v39;
    outlined init with copy of AutoSendInput(v131, v101, (void (*)(void))type metadata accessor for CamModelMetadata);
    uint64_t v102 = (uint8_t *)v150;
    uint64_t v103 = type metadata accessor for UUID();
    __swift_storeEnumTagSinglePayload((uint64_t)v88, 1, 1, v103);
    swift_retain();
    specialized static CamLoggingProtocol.log(from:forRequestId:forCamId:forRcId:forTrpId:forFeature:)();
    outlined destroy of RRDataSourceMetadataValue?((uint64_t)v88, &demangling cache variable for type metadata for UUID?);
    outlined destroy of RRDataSourceMetadataValue?((uint64_t)v84, &demangling cache variable for type metadata for (CamLogOutput, CamModelMetadata));
    swift_retain_n();
    uint64_t v104 = Logger.logObject.getter();
    os_log_type_t v105 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v104, v105))
    {
      swift_slowAlloc();
      aBlock = (unsigned char *)OUTLINED_FUNCTION_11_0();
      *(_DWORD *)uint64_t v102 = 136315138;
      swift_retain();
      uint64_t v106 = specialized ReflectedStringConvertible.description.getter((uint64_t (*)(void))type metadata accessor for AutoSendOutput);
      unint64_t v108 = v107;
      swift_release();
      uint64_t v164 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v106, v108, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      uint64_t v39 = v154;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C9CFE000, v104, v105, "Returning AutoSend output: %s", v102, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_2_2();
    }
    else
    {

      swift_release_n();
    }
    uint64_t v109 = v128;
    type metadata accessor for MLMultiArray(0, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue);
    uint64_t v110 = v138;
    uint64_t v111 = v137;
    uint64_t v112 = v139;
    (*(void (**)(uint64_t, void, uint64_t))(v138 + 104))(v137, *MEMORY[0x1E4FBCB10], v139);
    uint64_t v113 = (void *)static OS_dispatch_queue.global(qos:)();
    (*(void (**)(uint64_t, uint64_t))(v110 + 8))(v111, v112);
    os_log_type_t v114 = v149;
    outlined init with copy of AutoSendInput((uint64_t)v150, (uint64_t)v149, (void (*)(void))type metadata accessor for AutoSendInput);
    unint64_t v115 = (*(unsigned __int8 *)(v135 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v135 + 80);
    uint64_t v116 = (void *)swift_allocObject();
    v116[2] = v109;
    v116[3] = v39;
    uint64_t v116[4] = v153;
    outlined init with take of AutoSendInput((uint64_t)v114, (uint64_t)v116 + v115, (void (*)(void))type metadata accessor for AutoSendInput);
    uint64_t v161 = partial apply for closure #1 in AutoSendCoreHandler.handle(_:);
    uint64_t v162 = v116;
    aBlock = (unsigned char *)MEMORY[0x1E4F143A8];
    uint64_t v158 = 1107296256;
    uint64_t v159 = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    uint64_t v160 = &block_descriptor_3;
    uint64_t v117 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    uint64_t v118 = v140;
    static DispatchQoS.unspecified.getter();
    uint64_t v164 = MEMORY[0x1E4FBC860];
    _s8Dispatch0A13WorkItemFlagsVACs10SetAlgebraAAWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x1E4FBCB00]);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
    uint64_t v119 = v142;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    MEMORY[0x1CB78D610](0, v118, v119, v117);
    _Block_release(v117);

    OUTLINED_FUNCTION_18_1();
    v120();
    OUTLINED_FUNCTION_18_1();
    v121();
    uint64_t v122 = v152;
    unint64_t v123 = *(void (**)(uint8_t *, uint64_t))(v151 + 8);
    v123(v146, v152);
    v123(v155, v122);
    swift_release();
    swift_release();
  }
  return v39;
}

uint64_t closure #1 in AutoSendCoreHandler.handle(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for CamModelMetadata();
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = swift_projectBox();
  swift_beginAccess();
  outlined init with copy of AutoSendInput(v10, (uint64_t)v9, (void (*)(void))type metadata accessor for CamModelMetadata);
  uint64_t v11 = type metadata accessor for AutoSendInput();
  uint64_t v12 = UUID.uuidString.getter();
  specialized static CamFeatureStoreLoggingProtocol.writeData(modelFeatures:modelOutput:modelMetadata:requestId:rcId:fsStream:)(a1, a2, (uint64_t)v9, v12, v13, *(void *)(a4 + *(int *)(v11 + 24)), *(void **)(a4 + *(int *)(v11 + 24) + 8), 2);
  swift_bridgeObjectRelease();
  return outlined destroy of AutoSendInput((uint64_t)v9, (void (*)(void))type metadata accessor for CamModelMetadata);
}

uint64_t AutoSendCoreHandler.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  outlined destroy of AutoSendInput(v0 + OBJC_IVAR____TtC7SiriCam19AutoSendCoreHandler_autoSendInputFeatureExtractor, (void (*)(void))type metadata accessor for AutoSendInputFeatureExtractor);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC7SiriCam19AutoSendCoreHandler_autoSendEnforcer);
  return v0;
}

uint64_t AutoSendCoreHandler.__deallocating_deinit()
{
  AutoSendCoreHandler.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x1F4186488](v0, v1, v2);
}

uint64_t ObjC metadata update function for AutoSendCoreHandler()
{
  return type metadata accessor for AutoSendCoreHandler();
}

uint64_t type metadata accessor for AutoSendCoreHandler()
{
  uint64_t result = type metadata singleton initialization cache for AutoSendCoreHandler;
  if (!type metadata singleton initialization cache for AutoSendCoreHandler) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata completion function for AutoSendCoreHandler()
{
  uint64_t result = type metadata accessor for AutoSendInputFeatureExtractor();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

id @nonobjc FSFCurareInteractionAsJsonStr.init(jsonStr:interactionId:dataVersion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    uint64_t v9 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  uint64_t v9 = (void *)MEMORY[0x1CB78D210]();
  swift_bridgeObjectRelease();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v10 = (void *)MEMORY[0x1CB78D210](a3, a4);
  swift_bridgeObjectRelease();
LABEL_6:
  id v11 = objc_msgSend(v5, sel_initWithJsonStr_interactionId_dataVersion_, v9, v10, a5);

  return v11;
}

id @nonobjc FSFCurareInteractionStream.init(streamId:)(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = (void *)MEMORY[0x1CB78D210]();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = objc_msgSend(v2, sel_initWithStreamId_, v3);

  return v4;
}

uint64_t outlined init with copy of AutoSendInput(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1_3();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t outlined destroy of AutoSendInput(uint64_t a1, void (*a2)(void))
{
  a2(0);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_18_1();
  v3();
  return a1;
}

uint64_t sub_1C9D99614()
{
  unint64_t v1 = (int *)(type metadata accessor for AutoSendInput() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v6 = v0 + v3;
  uint64_t v7 = type metadata accessor for UUID();
  OUTLINED_FUNCTION_1_3();
  uint64_t v9 = *(void (**)(uint64_t))(v8 + 8);
  uint64_t v10 = OUTLINED_FUNCTION_16_11();
  v9(v10);

  swift_bridgeObjectRelease();
  ((void (*)(uint64_t, uint64_t))v9)(v6 + v1[10], v7);
  return MEMORY[0x1F4186498](v0, v4, v5);
}

uint64_t partial apply for closure #1 in AutoSendCoreHandler.handle(_:)()
{
  uint64_t v1 = type metadata accessor for AutoSendInput();
  OUTLINED_FUNCTION_9_6(v1);
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = v0[4];
  uint64_t v6 = (uint64_t)v0 + ((*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return closure #1 in AutoSendCoreHandler.handle(_:)(v3, v4, v5, v6);
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_1C9D997C0()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1C9D99830()
{
  uint64_t v1 = type metadata accessor for CamModelMetadata();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + v3 + 40) != 1) {
    swift_bridgeObjectRelease();
  }
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 28);
  uint64_t v6 = type metadata accessor for Locale();
  if (!__swift_getEnumTagSinglePayload(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  return MEMORY[0x1F4186498](v0, v3 + v4, v2 | 7);
}

uint64_t _s7SiriCam12AnyEncodableVyACxcSERzlufcys7Encoder_pKcxcfu_ysAD_pKcfu0_AA0B13ModelMetadataV_Tg5TA_0(void *a1)
{
  uint64_t v2 = type metadata accessor for CamModelMetadata();
  OUTLINED_FUNCTION_9_6(v2);
  return CamModelMetadata.encode(to:)(a1);
}

uint64_t lazy protocol witness table accessor for type MLFeatureValue and conformance MLFeatureValue(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for MLMultiArray(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t outlined init with take of AutoSendInput(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  OUTLINED_FUNCTION_1_3();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t outlined assign with take of WordEmbeddingFeatureExtractor?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WordEmbeddingFeatureExtractor?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t _s8Dispatch0A13WorkItemFlagsVACs10SetAlgebraAAWlTm_0(unint64_t *a1, void (*a2)(uint64_t))
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

void OUTLINED_FUNCTION_5_18()
{
  JUMPOUT(0x1CB78D210);
}

uint64_t OUTLINED_FUNCTION_13_14()
{
  return __swift_storeEnumTagSinglePayload(v0, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_14_15()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

void OUTLINED_FUNCTION_15_15(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_16_11()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_17_12()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_18_14()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t static TrialProvider.fetchBoolFactorFromTrial(_:)(uint64_t a1, unint64_t a2)
{
  if (one-time initialization token for cachedFactors != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_28();
  swift_bridgeObjectRetain();
  uint64_t v7 = (void *)OUTLINED_FUNCTION_7_23();
  swift_endAccess();
  swift_bridgeObjectRelease();
  if (one-time initialization token for common != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  __swift_project_value_buffer(v8, (uint64_t)static Logger.common);
  id v9 = v7;
  OUTLINED_FUNCTION_9_19();
  id v10 = v2;
  id v11 = (void *)Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.debug.getter();
  if (OUTLINED_FUNCTION_4_20(v12))
  {
    swift_slowAlloc();
    v20[0] = OUTLINED_FUNCTION_8_16();
    OUTLINED_FUNCTION_6_19(4.8151e-34);
    uint64_t v19 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v3 + 12) = 2080;
    if (v7) {
      objc_msgSend(v10, sel_BOOLeanValue, v19, v20[0]);
    }
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Bool?);
    uint64_t v14 = String.init<A>(describing:)();
    uint64_t v18 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v14, v15, v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_3_25(&dword_1C9CFE000, v16, v4, "[TrialProvider] Fetched %s = %s");
    OUTLINED_FUNCTION_10_15();
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_2_2();

    if (!v7) {
      return 2;
    }
  }
  else
  {

    swift_bridgeObjectRelease_n();
    if (!v7) {
      return 2;
    }
  }
  id v13 = objc_msgSend(v10, sel_BOOLeanValue, v18);

  return (uint64_t)v13;
}

uint64_t static TrialProvider.fetchDoubleFactorFromTrial(_:)(uint64_t a1, unint64_t a2)
{
  if (one-time initialization token for cachedFactors != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_28();
  swift_bridgeObjectRetain();
  uint64_t v7 = (void *)OUTLINED_FUNCTION_7_23();
  swift_endAccess();
  swift_bridgeObjectRelease();
  if (one-time initialization token for common != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  __swift_project_value_buffer(v8, (uint64_t)static Logger.common);
  id v9 = v7;
  OUTLINED_FUNCTION_9_19();
  id v10 = v2;
  id v11 = (void *)Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.debug.getter();
  if (OUTLINED_FUNCTION_4_20(v12))
  {
    swift_slowAlloc();
    v20[0] = OUTLINED_FUNCTION_8_16();
    OUTLINED_FUNCTION_6_19(4.8151e-34);
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, v20);
    OUTLINED_FUNCTION_2_28();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v3 + 12) = 2080;
    if (v7) {
      objc_msgSend(v10, sel_doubleValue, v20[0]);
    }
    else {
      uint64_t v13 = 0;
    }
    v20[1] = v13;
    BOOL v21 = v7 == 0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Double?);
    uint64_t v17 = String.init<A>(describing:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v18, v20);
    OUTLINED_FUNCTION_5_19();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_3_25(&dword_1C9CFE000, v19, v4, "[TrialProvider] Fetched %s = %s");
    OUTLINED_FUNCTION_10_15();
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_2_2();

    if (!v7) {
      return 0;
    }
LABEL_9:
    objc_msgSend(v10, sel_doubleValue, v20[0]);
    uint64_t v15 = v14;

    return v15;
  }

  swift_bridgeObjectRelease_n();
  if (v7) {
    goto LABEL_9;
  }
  return 0;
}

void *static TrialProvider.fetchStringFactorFromTrial(_:)(uint64_t a1, unint64_t a2)
{
  if (one-time initialization token for cachedFactors != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_28();
  swift_bridgeObjectRetain();
  uint64_t v7 = (void *)OUTLINED_FUNCTION_7_23();
  swift_endAccess();
  swift_bridgeObjectRelease();
  if (one-time initialization token for common != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  __swift_project_value_buffer(v8, (uint64_t)static Logger.common);
  id v9 = v7;
  OUTLINED_FUNCTION_9_19();
  id v10 = v2;
  id v11 = (void *)Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.debug.getter();
  if (!OUTLINED_FUNCTION_4_20(v12))
  {

    swift_bridgeObjectRelease_n();
    if (!v7) {
      return v7;
    }
    goto LABEL_12;
  }
  swift_slowAlloc();
  v21[0] = OUTLINED_FUNCTION_8_16();
  OUTLINED_FUNCTION_6_19(4.8151e-34);
  getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, v21);
  OUTLINED_FUNCTION_2_28();
  swift_bridgeObjectRelease_n();
  *(_WORD *)(v3 + 12) = 2080;
  if (v7)
  {
    uint64_t v13 = outlined bridged method (pb) of @objc TRILevel.stringValue.getter(v10);
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
  }
  v21[1] = v13;
  uint64_t v21[2] = v14;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
  uint64_t v15 = String.init<A>(describing:)();
  getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, v21);
  OUTLINED_FUNCTION_5_19();

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_25(&dword_1C9CFE000, v17, v4, "[TrialProvider] Fetched %s = %s");
  OUTLINED_FUNCTION_10_15();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_2();

  if (v7)
  {
LABEL_12:
    id v18 = objc_msgSend(v10, sel_stringValue, v21[0]);
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v7 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

double one-time initialization function for enrollment()
{
  static TrialProvider.fetchTrialEnrollment()((uint64_t *)v1);
  static TrialProvider.enrollment = v1[0];
  *(_OWORD *)&qword_1EBC6BCB0 = v1[1];
  double result = *(double *)&v2;
  xmmword_1EBC6BCC0 = v2;
  *(_OWORD *)&qword_1EBC6BCD0 = v3;
  return result;
}

void static TrialProvider.fetchTrialEnrollment()(uint64_t *a1@<X8>)
{
  if (one-time initialization token for ranker != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Logger.ranker);
  long long v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v5 = 0;
    _os_log_impl(&dword_1C9CFE000, v3, v4, "[TrialProvider] Fetching enrollment metadata.", v5, 2u);
    MEMORY[0x1CB78E290](v5, -1, -1);
  }

  if (one-time initialization token for triClient != -1) {
    swift_once();
  }
  id v6 = (id)static TrialProvider.triClient;
  uint64_t v7 = (void *)MEMORY[0x1CB78D210](0xD000000000000021, 0x80000001C9DA4EA0);
  id v8 = objc_msgSend(v6, sel_experimentIdentifiersWithNamespaceName_, v7);

  if (v8)
  {
    id v9 = objc_msgSend(v8, sel_experimentId);
    uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = v10;

    id v12 = objc_msgSend(v8, sel_treatmentId);
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v15 = v14;

    objc_msgSend(v8, sel_deploymentId);
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v15 = 0;
    uint64_t v25 = 0;
    uint64_t v11 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Int32?);
  uint64_t v16 = String.init<A>(describing:)();
  uint64_t v18 = v17;
  id v19 = (id)static TrialProvider.triClient;
  uint64_t v20 = (void *)MEMORY[0x1CB78D210](0xD000000000000021, 0x80000001C9DA4EA0);
  id v21 = objc_msgSend(v19, sel_rolloutIdentifiersWithNamespaceName_, v20);

  if (v21)
  {
    id v22 = objc_msgSend(v21, sel_rolloutId);

    id v21 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v24 = v23;
  }
  else
  {

    uint64_t v24 = 0;
  }
  *a1 = v25;
  a1[1] = v11;
  a1[2] = v13;
  a1[3] = v15;
  a1[4] = v16;
  a1[5] = v18;
  a1[6] = (uint64_t)v21;
  a1[7] = v24;
}

uint64_t one-time initialization function for cachedFactors()
{
  uint64_t result = static TrialProvider.fetchFactorValues()();
  static TrialProvider.cachedFactors = result;
  return result;
}

uint64_t static TrialProvider.fetchFactorValues()()
{
  if (one-time initialization token for ranker != -1) {
LABEL_32:
  }
    swift_once();
  uint64_t v0 = type metadata accessor for Logger();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.ranker);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v1, v2))
  {
    long long v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v3 = 0;
    _os_log_impl(&dword_1C9CFE000, v1, v2, "[TrialProvider] Fetching factor values.", v3, 2u);
    MEMORY[0x1CB78E290](v3, -1, -1);
  }

  if (one-time initialization token for triClient != -1) {
    swift_once();
  }
  id v4 = (id)static TrialProvider.triClient;
  os_log_type_t v5 = (void *)MEMORY[0x1CB78D210](0xD000000000000021, 0x80000001C9DA4EA0);
  id v6 = objc_msgSend(v4, sel_factorLevelsWithNamespaceName_, v5);

  type metadata accessor for MLMultiArray(0, &lazy cache variable for type metadata for TRIFactorLevel);
  unint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  type metadata accessor for MLMultiArray(0, &lazy cache variable for type metadata for TRILevel);
  id v8 = (void *)Dictionary.init(dictionaryLiteral:)();
  if (!(v7 >> 62))
  {
    uint64_t v9 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_28:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v8;
  }
  swift_bridgeObjectRetain_n();
  uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v9) {
    goto LABEL_28;
  }
LABEL_8:
  unint64_t v10 = v7 & 0xC000000000000001;
  uint64_t v11 = 4;
  uint64_t v38 = v9;
  unint64_t v39 = v7;
  unint64_t v37 = v7 & 0xC000000000000001;
  while (1)
  {
    if (v10) {
      id v12 = (id)MEMORY[0x1CB78D7C0](v11 - 4, v7);
    }
    else {
      id v12 = *(id *)(v7 + 8 * v11);
    }
    uint64_t v13 = v12;
    uint64_t v14 = v11 - 3;
    if (__OFADD__(v11 - 4, 1))
    {
      __break(1u);
LABEL_30:
      __break(1u);
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
    id v15 = objc_msgSend(v12, sel_factor);
    if (!v15) {
      break;
    }
    uint64_t v16 = outlined bridged method (ob) of @objc TRIFactor.name.getter(v15);
    if (v17)
    {
      uint64_t v18 = v16;
      uint64_t v19 = v17;
      id v20 = objc_msgSend(v13, sel_level);
      if (v20)
      {
        id v40 = v20;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v22 = specialized __RawDictionaryStorage.find<A>(_:)(v18, v19);
        uint64_t v24 = v8[2];
        BOOL v25 = (v23 & 1) == 0;
        Swift::Int v26 = v24 + v25;
        if (__OFADD__(v24, v25)) {
          goto LABEL_30;
        }
        unint64_t v27 = v22;
        char v28 = v23;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, TRILevel>);
        if (_NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v26))
        {
          unint64_t v29 = specialized __RawDictionaryStorage.find<A>(_:)(v18, v19);
          if ((v28 & 1) != (v30 & 1)) {
            goto LABEL_36;
          }
          unint64_t v27 = v29;
        }
        if (v28)
        {
          uint64_t v31 = v8[7];

          *(void *)(v31 + 8 * v27) = v40;
        }
        else
        {
          v8[(v27 >> 6) + 8] |= 1 << v27;
          uint64_t v32 = (uint64_t *)(v8[6] + 16 * v27);
          *uint64_t v32 = v18;
          v32[1] = v19;
          *(void *)(v8[7] + 8 * v27) = v40;
          uint64_t v33 = v8[2];
          BOOL v34 = __OFADD__(v33, 1);
          uint64_t v35 = v33 + 1;
          if (v34) {
            goto LABEL_31;
          }
          v8[2] = v35;
          swift_bridgeObjectRetain();
        }

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v9 = v38;
        unint64_t v7 = v39;
        unint64_t v10 = v37;
      }
      else
      {

        swift_bridgeObjectRelease();
      }
    }
    else
    {
    }
    ++v11;
    if (v14 == v9) {
      goto LABEL_28;
    }
  }
  __break(1u);
LABEL_36:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

id one-time initialization function for triClient()
{
  id result = closure #1 in variable initialization expression of static TrialProvider.triClient();
  static TrialProvider.triClient = (uint64_t)result;
  return result;
}

id closure #1 in variable initialization expression of static TrialProvider.triClient()
{
  if (one-time initialization token for ranker != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.ranker);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v1, v2))
  {
    long long v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v3 = 0;
    _os_log_impl(&dword_1C9CFE000, v1, v2, "[TrialProvider] New TRIClient instance.", v3, 2u);
    MEMORY[0x1CB78E290](v3, -1, -1);
  }

  id v4 = objc_msgSend(self, sel_clientWithIdentifier_, 115);
  os_log_type_t v5 = (void *)MEMORY[0x1CB78D210](0xD000000000000021, 0x80000001C9DA4EA0);
  v9[4] = closure #1 in closure #1 in variable initialization expression of static TrialProvider.triClient;
  v9[5] = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@guaranteed TRINamespaceUpdateProtocol) -> ();
  v9[3] = &block_descriptor_4;
  id v6 = _Block_copy(v9);
  id v7 = objc_msgSend(v4, sel_addUpdateHandlerForNamespaceName_usingBlock_, v5, v6);
  _Block_release(v6);
  swift_unknownObjectRelease();

  return v4;
}

uint64_t closure #1 in closure #1 in variable initialization expression of static TrialProvider.triClient()
{
  if (one-time initialization token for ranker != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.ranker);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v1, v2))
  {
    long long v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v3 = 0;
    _os_log_impl(&dword_1C9CFE000, v1, v2, "[TrialProvider] Update handler called.", v3, 2u);
    MEMORY[0x1CB78E290](v3, -1, -1);
  }

  return static TrialProvider.refreshClient()();
}

uint64_t static TrialProvider.refreshClient()()
{
  if (one-time initialization token for ranker != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.ranker);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v1, v2))
  {
    long long v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v3 = 0;
    _os_log_impl(&dword_1C9CFE000, v1, v2, "[TrialProvider] Refreshing TRIClient instance.", v3, 2u);
    OUTLINED_FUNCTION_2_2();
  }

  if (one-time initialization token for triClient != -1) {
    swift_once();
  }
  objc_msgSend((id)static TrialProvider.triClient, sel_refresh);
  if (one-time initialization token for cachedFactors != -1) {
    swift_once();
  }
  uint64_t v4 = static TrialProvider.fetchFactorValues()();
  swift_beginAccess();
  static TrialProvider.cachedFactors = v4;
  swift_bridgeObjectRelease();
  if (one-time initialization token for enrollment != -1) {
    swift_once();
  }
  static TrialProvider.fetchTrialEnrollment()((uint64_t *)v6);
  static TrialProvider.enrollment = v6[0];
  *(_OWORD *)&qword_1EBC6BCB0 = v6[1];
  xmmword_1EBC6BCC0 = v6[2];
  *(_OWORD *)&qword_1EBC6BCD0 = v6[3];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed TRINamespaceUpdateProtocol) -> ()(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t outlined bridged method (ob) of @objc TRIFactor.name.getter(void *a1)
{
  id v2 = objc_msgSend(a1, sel_name);

  if (!v2) {
    return 0;
  }
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t outlined bridged method (pb) of @objc TRILevel.stringValue.getter(void *a1)
{
  id v1 = objc_msgSend(a1, sel_stringValue);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t OUTLINED_FUNCTION_0_28()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2_28()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

void OUTLINED_FUNCTION_3_25(void *a1, uint64_t a2, os_log_type_t a3, const char *a4)
{
  _os_log_impl(a1, v4, a3, a4, v5, 0x16u);
}

BOOL OUTLINED_FUNCTION_4_20(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_5_19()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_6_19(float a1)
{
  *id v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_7_23()
{
  return specialized Dictionary.subscript.getter(v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_8_16()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_9_19()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_10_15()
{
  return swift_arrayDestroy();
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t JSONDecoder.init()()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t type metadata accessor for JSONEncoder.NonConformingFloatEncodingStrategy()
{
  return MEMORY[0x1F40E3110]();
}

uint64_t dispatch thunk of JSONEncoder.nonConformingFloatEncodingStrategy.setter()
{
  return MEMORY[0x1F40E3118]();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t JSONEncoder.init()()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t URL.pathExtension.getter()
{
  return MEMORY[0x1F40E48E8]();
}

uint64_t URL.absoluteString.getter()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t URL.init(fileURLWithPath:isDirectory:)()
{
  return MEMORY[0x1F40E4930]();
}

uint64_t URL.hasDirectoryPath.getter()
{
  return MEMORY[0x1F40E4958]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.appendingPathComponent(_:isDirectory:)()
{
  return MEMORY[0x1F40E49E0]();
}

uint64_t URL.appendingPathComponent(_:)()
{
  return MEMORY[0x1F40E49E8]();
}

uint64_t static URL.== infix(_:_:)()
{
  return MEMORY[0x1F40E4A50]();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t URL.path.getter()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t Data.write(to:options:)()
{
  return MEMORY[0x1F40E4E10]();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t Date.init(timeIntervalSince1970:)()
{
  return MEMORY[0x1F40E52A0]();
}

uint64_t Date.timeIntervalSince1970.getter()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t Date.init()()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t UUID.init(uuidString:)()
{
  return MEMORY[0x1F40E53A0]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x1F40E53B0]();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)MEMORY[0x1F40E53C8]();
}

uint64_t static UUID.== infix(_:_:)()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t UUID.uuid.getter()
{
  return MEMORY[0x1F40E5428]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t Locale.init(identifier:)()
{
  return MEMORY[0x1F40E5500]();
}

uint64_t Locale.identifier.getter()
{
  return MEMORY[0x1F40E5510]();
}

uint64_t Locale.regionCode.getter()
{
  return MEMORY[0x1F40E5520]();
}

uint64_t Locale.languageCode.getter()
{
  return MEMORY[0x1F40E55A0]();
}

NSLocale __swiftcall Locale._bridgeToObjectiveC()()
{
  return (NSLocale)MEMORY[0x1F40E5648]();
}

uint64_t static Locale.current.getter()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t type metadata accessor for Locale()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse()
{
  return MEMORY[0x1F413CC78]();
}

uint64_t Apple_Parsec_Siri_V2alpha_Sash.appID.getter()
{
  return MEMORY[0x1F413D530]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_Sash()
{
  return MEMORY[0x1F413D538]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ExperienceComponent.layoutExperience.getter()
{
  return MEMORY[0x1F413E720]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ExperienceComponent()
{
  return MEMORY[0x1F413E740]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LayoutSnippetComponent.sash.getter()
{
  return MEMORY[0x1F413E9F8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LayoutSnippetComponent.hasSash.getter()
{
  return MEMORY[0x1F413EA00]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_LayoutSnippetComponent()
{
  return MEMORY[0x1F413EA08]();
}

uint64_t type metadata accessor for SignalValue()
{
  return MEMORY[0x1F4158A38]();
}

uint64_t SignalGatherer.ValuesWithTimings.values.getter()
{
  return MEMORY[0x1F4158A60]();
}

uint64_t type metadata accessor for SignalGatherer.ValuesWithTimings()
{
  return MEMORY[0x1F4158A68]();
}

uint64_t dispatch thunk of SignalGatherer.gatherValuesAndTimings(completion:)()
{
  return MEMORY[0x1F4158A70]();
}

uint64_t SignalGatherer.init(signals:candidateAppBundleIds:)()
{
  return MEMORY[0x1F4158A78]();
}

uint64_t type metadata accessor for SignalGatherer()
{
  return MEMORY[0x1F4158A80]();
}

uint64_t dispatch thunk of SignalProviding.id.getter()
{
  return MEMORY[0x1F4158A88]();
}

uint64_t DeviceClassSignal.init()()
{
  return MEMORY[0x1F4158B20]();
}

uint64_t type metadata accessor for DeviceClassSignal()
{
  return MEMORY[0x1F4158B28]();
}

uint64_t ClientCarplaySignal.init()()
{
  return MEMORY[0x1F4158B80]();
}

uint64_t type metadata accessor for ClientCarplaySignal()
{
  return MEMORY[0x1F4158B88]();
}

uint64_t type metadata accessor for SignalGathererError()
{
  return MEMORY[0x1F4158B90]();
}

uint64_t static AppLaunchCountSignal.instances()()
{
  return MEMORY[0x1F4158B98]();
}

uint64_t type metadata accessor for AppLaunchCountSignal()
{
  return MEMORY[0x1F4158BA0]();
}

uint64_t ClientDaylightSignal.init()()
{
  return MEMORY[0x1F4158BA8]();
}

uint64_t type metadata accessor for ClientDaylightSignal()
{
  return MEMORY[0x1F4158BB0]();
}

uint64_t ClientHourOfDaySignal.init()()
{
  return MEMORY[0x1F4158C00]();
}

uint64_t type metadata accessor for ClientHourOfDaySignal()
{
  return MEMORY[0x1F4158C08]();
}

uint64_t ClientTimeRangeSignal.init()()
{
  return MEMORY[0x1F4158C10]();
}

uint64_t type metadata accessor for ClientTimeRangeSignal()
{
  return MEMORY[0x1F4158C18]();
}

uint64_t dispatch thunk of AppSelectionSignalComponent.name.getter()
{
  return MEMORY[0x1F4158C90]();
}

uint64_t static TimeSinceAppLastLaunchedSignal.instances()()
{
  return MEMORY[0x1F4158CC8]();
}

uint64_t static TimeSinceAppLastInstalledSignal.instances()()
{
  return MEMORY[0x1F4158CD0]();
}

uint64_t static AppDisambiguationFrequencySignal.instances()()
{
  return MEMORY[0x1F4158CD8]();
}

uint64_t static LastAppDisambiguationResultSignal.instances()()
{
  return MEMORY[0x1F4158CE0]();
}

uint64_t static LastAppDisambiguationRecencySignal.instances()()
{
  return MEMORY[0x1F4158CE8]();
}

uint64_t static ActionDisambiguationFrequencySignal.instances()()
{
  return MEMORY[0x1F4158CF0]();
}

uint64_t static LastActionDisambiguationResultSignal.instances()()
{
  return MEMORY[0x1F4158CF8]();
}

uint64_t static LastActionDisambiguationRecencySignal.instances()()
{
  return MEMORY[0x1F4158D00]();
}

uint64_t static SelectedAppDisambiguationFrequencySignal.instances()()
{
  return MEMORY[0x1F4158D08]();
}

uint64_t static SelectedActionDisambiguationFrequencySignal.instances()()
{
  return MEMORY[0x1F4158D10]();
}

uint64_t isFeatureEnabled(_:)()
{
  return MEMORY[0x1F4119150]();
}

uint64_t type metadata accessor for TokenChain()
{
  return MEMORY[0x1F4130438]();
}

uint64_t dispatch thunk of ConfigurableAnalyzer.analyzeString(string:)()
{
  return MEMORY[0x1F4130440]();
}

uint64_t type metadata accessor for ConfigurationFeature()
{
  return MEMORY[0x1F4130448]();
}

uint64_t dispatch thunk of DefaultAnalyzerFactory.getAnalyzer(locale:)()
{
  return MEMORY[0x1F4130450]();
}

uint64_t DefaultAnalyzerFactory.init(configOptions:)()
{
  return MEMORY[0x1F4130458]();
}

uint64_t type metadata accessor for DefaultAnalyzerFactory()
{
  return MEMORY[0x1F4130460]();
}

uint64_t registerDataPathForLocaleWithError(locale:path:)()
{
  return MEMORY[0x1F4130468]();
}

uint64_t Token.cleanValue.getter()
{
  return MEMORY[0x1F4130470]();
}

Swift::Bool __swiftcall Token.isSignificant()()
{
  return MEMORY[0x1F4130478]();
}

uint64_t type metadata accessor for Token()
{
  return MEMORY[0x1F4130480]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UUID()
{
  return MEMORY[0x1F4154E50]();
}

uint64_t Siri_Nlu_External_Parser.ParserIdentifier.rawValue.getter()
{
  return MEMORY[0x1F4154E68]();
}

uint64_t type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier()
{
  return MEMORY[0x1F4154E70]();
}

uint64_t Siri_Nlu_External_UsoGraph.identifiers.getter()
{
  return MEMORY[0x1F4154F20]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UsoGraph()
{
  return MEMORY[0x1F4154F60]();
}

uint64_t Siri_Nlu_External_UserParse.userDialogActs.getter()
{
  return MEMORY[0x1F4154FA0]();
}

uint64_t Siri_Nlu_External_UserParse.repetitionResult.getter()
{
  return MEMORY[0x1F4154FB0]();
}

uint64_t Siri_Nlu_External_UserParse.comparableProbability.getter()
{
  return MEMORY[0x1F4154FC0]();
}

uint64_t static Siri_Nlu_External_UserParse.== infix(_:_:)()
{
  return MEMORY[0x1F4154FD0]();
}

uint64_t Siri_Nlu_External_UserParse.id.getter()
{
  return MEMORY[0x1F4154FE0]();
}

uint64_t Siri_Nlu_External_UserParse.interpretableAsUniversalCommand.getter()
{
  return MEMORY[0x1F4154FE8]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserParse()
{
  return MEMORY[0x1F4155020]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasAccepted.getter()
{
  return MEMORY[0x1F41550B0]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasRejected.getter()
{
  return MEMORY[0x1F41550C0]();
}

uint64_t Siri_Nlu_External_UserDialogAct.userStatedTask.getter()
{
  return MEMORY[0x1F41550F8]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserDialogAct()
{
  return MEMORY[0x1F4155158]();
}

uint64_t Siri_Nlu_External_UserStatedTask.task.getter()
{
  return MEMORY[0x1F41551F0]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserStatedTask()
{
  return MEMORY[0x1F4155218]();
}

uint64_t type metadata accessor for Siri_Nlu_External_RepetitionResult.RepetitionType()
{
  return MEMORY[0x1F41552B8]();
}

uint64_t Siri_Nlu_External_RepetitionResult.repetitionType.getter()
{
  return MEMORY[0x1F41552C0]();
}

uint64_t type metadata accessor for Siri_Nlu_External_RepetitionResult()
{
  return MEMORY[0x1F41552C8]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UsoEntityIdentifier.NluComponent()
{
  return MEMORY[0x1F41553E0]();
}

uint64_t Siri_Nlu_External_UsoEntityIdentifier.sourceComponent.getter()
{
  return MEMORY[0x1F41553F0]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UsoEntityIdentifier()
{
  return MEMORY[0x1F4155418]();
}

uint64_t static SiriNLUTypesPrintUtils.printableProtoObject(object:)()
{
  return MEMORY[0x1F4155488]();
}

uint64_t type metadata accessor for SiriNLUTypesPrintUtils()
{
  return MEMORY[0x1F4155490]();
}

uint64_t static ConversionUtils.convertProtoToUuid(protoUuid:)()
{
  return MEMORY[0x1F41554A8]();
}

uint64_t static ConversionUtils.convertUserDialogActToTasks(userDialogAct:)()
{
  return MEMORY[0x1F41554B8]();
}

uint64_t Siri_Nl_Core_Protocol_UsoEntityIdentifier.NluComponent.init(rawValue:)()
{
  return MEMORY[0x1F4155C98]();
}

uint64_t type metadata accessor for Siri_Nl_Core_Protocol_UsoEntityIdentifier.NluComponent()
{
  return MEMORY[0x1F4155CA0]();
}

uint64_t UsoIdentifier.appBundleId.getter()
{
  return MEMORY[0x1F4155E18]();
}

uint64_t type metadata accessor for UsoIdentifier.NluComponent()
{
  return MEMORY[0x1F4155E38]();
}

uint64_t UsoIdentifier.sourceComponent.getter()
{
  return MEMORY[0x1F4155E40]();
}

uint64_t UsoIdentifier.value.getter()
{
  return MEMORY[0x1F4155E80]();
}

uint64_t UsoIdentifier.namespace.getter()
{
  return MEMORY[0x1F4155E88]();
}

uint64_t type metadata accessor for UsoIdentifier()
{
  return MEMORY[0x1F4155E90]();
}

uint64_t dispatch thunk of CodeGenGlobalArgs.getUsoIdentifiersFor(attributeName:)()
{
  return MEMORY[0x1F4156220]();
}

uint64_t static UsoConversionUtils.convertUserDialogActToTasks(userDialogAct:)()
{
  return MEMORY[0x1F41562E8]();
}

uint64_t static UsoTask_CodegenConverter.convert(task:)()
{
  return MEMORY[0x1F41565D8]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_Reference.reference.getter()
{
  return MEMORY[0x1F41567F8]();
}

uint64_t type metadata accessor for UsoTask_run_common_VoiceCommand()
{
  return MEMORY[0x1F4156CE0]();
}

uint64_t type metadata accessor for UsoTask_execute_common_VoiceCommand()
{
  return MEMORY[0x1F4157078]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_ReferenceVoiceCommandPayload.reference.getter()
{
  return MEMORY[0x1F4157318]();
}

uint64_t UsoTask.verbString.getter()
{
  return MEMORY[0x1F4157550]();
}

uint64_t UsoTask.baseEntityAsString.getter()
{
  return MEMORY[0x1F4157558]();
}

uint64_t UsoTask.arguments.getter()
{
  return MEMORY[0x1F4157560]();
}

uint64_t dispatch thunk of UsoValue.getUsoIdentifiers()()
{
  return MEMORY[0x1F41575A0]();
}

uint64_t dispatch thunk of UsoValue.getAsEntity()()
{
  return MEMORY[0x1F41575A8]();
}

uint64_t UsoEntity.attributes.getter()
{
  return MEMORY[0x1F4157680]();
}

uint64_t UsoEntity.valueTypeString.getter()
{
  return MEMORY[0x1F4157698]();
}

uint64_t SiriEnvironment.currentDevice.getter()
{
  return MEMORY[0x1F415AAB0]();
}

uint64_t static SiriEnvironment.default.getter()
{
  return MEMORY[0x1F415AAE8]();
}

uint64_t type metadata accessor for SiriEnvironment()
{
  return MEMORY[0x1F415AAF8]();
}

uint64_t type metadata accessor for DeviceIdiom()
{
  return MEMORY[0x1F415ABB8]();
}

uint64_t ResponseMode.aceValue.getter()
{
  return MEMORY[0x1F415AC40]();
}

uint64_t type metadata accessor for ResponseMode()
{
  return MEMORY[0x1F415AC50]();
}

uint64_t dispatch thunk of CurrentDevice.deviceIdiom.getter()
{
  return MEMORY[0x1F415ACA0]();
}

uint64_t dispatch thunk of CurrentDevice.preferencesLanguageCode.getter()
{
  return MEMORY[0x1F415ACF8]();
}

uint64_t Regex.init(_regexString:version:)()
{
  return MEMORY[0x1F4188358]();
}

uint64_t Regex.firstMatch(in:)()
{
  return MEMORY[0x1F4188360]();
}

uint64_t Regex.Match.subscript.getter()
{
  return MEMORY[0x1F41883B8]();
}

uint64_t JSONEncodingOptions.init()()
{
  return MEMORY[0x1F41270F8]();
}

uint64_t type metadata accessor for JSONEncodingOptions()
{
  return MEMORY[0x1F4127100]();
}

uint64_t Message.jsonString(options:)()
{
  return MEMORY[0x1F4127310]();
}

uint64_t dispatch thunk of PommesResponse.experiences.getter()
{
  return MEMORY[0x1F4150F30]();
}

uint64_t dispatch thunk of PommesResponse.primaryCatIds()()
{
  return MEMORY[0x1F4150F60]();
}

uint64_t PommesResponse.metadataDomainName.getter()
{
  return MEMORY[0x1F4150F78]();
}

uint64_t dispatch thunk of PommesResponse.primaryQueryConfidence()()
{
  return MEMORY[0x1F4150FA0]();
}

uint64_t dispatch thunk of PommesResponse.primaryPluginIdentifier()()
{
  return MEMORY[0x1F4150FB8]();
}

uint64_t dispatch thunk of PommesResponse.isPersonalDomainFallback.getter()
{
  return MEMORY[0x1F4150FC0]();
}

uint64_t type metadata accessor for PommesResponse()
{
  return MEMORY[0x1F41510E0]();
}

uint64_t GenericExperience.components.getter()
{
  return MEMORY[0x1F4151280]();
}

uint64_t type metadata accessor for GenericExperience()
{
  return MEMORY[0x1F4151298]();
}

uint64_t os_signpost(_:dso:log:name:signpostID:_:_:)()
{
  return MEMORY[0x1F4188508]();
}

uint64_t os_signpost(_:dso:log:name:signpostID:)()
{
  return MEMORY[0x1F4188510]();
}

uint64_t OSSignpostID.init(log:)()
{
  return MEMORY[0x1F4188568]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x1F4188580]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x1F4188670]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t Logger.init(_:)()
{
  return MEMORY[0x1F41886B0]();
}

uint64_t type metadata accessor for RRMetadata()
{
  return MEMORY[0x1F41582C8]();
}

uint64_t RRCandidate.entity.getter()
{
  return MEMORY[0x1F41582D8]();
}

uint64_t type metadata accessor for RRCandidate()
{
  return MEMORY[0x1F41582E0]();
}

uint64_t type metadata accessor for RRDataSourceMetadataValue()
{
  return MEMORY[0x1F4158308]();
}

uint64_t RREntity.id.getter()
{
  return MEMORY[0x1F4158340]();
}

uint64_t RREntity.metadata.getter()
{
  return MEMORY[0x1F4158360]();
}

uint64_t RREntity.usoEntity.getter()
{
  return MEMORY[0x1F4158368]();
}

uint64_t type metadata accessor for RREntity()
{
  return MEMORY[0x1F4158370]();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t static DispatchQoS.background.getter()
{
  return MEMORY[0x1F4186CE8]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t static DispatchQoS.userInitiated.getter()
{
  return MEMORY[0x1F4186D08]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x1F4186D60]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x1F40E6000]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t Dictionary.description.getter()
{
  return MEMORY[0x1F4183318]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x1F4183358]();
}

uint64_t Dictionary.Keys.description.getter()
{
  return MEMORY[0x1F4183370]();
}

uint64_t type metadata accessor for Dictionary.Keys()
{
  return MEMORY[0x1F4183398]();
}

uint64_t Dictionary.keys.getter()
{
  return MEMORY[0x1F41833A0]();
}

uint64_t Dictionary<>.encode(to:)()
{
  return MEMORY[0x1F41834C8]();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t BidirectionalCollection<>.starts<A>(with:)()
{
  return MEMORY[0x1F4188420]();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x1F4183730]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x1F4183838]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x1F40E6190]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return MEMORY[0x1F40E61E8]();
}

uint64_t String.init(data:encoding:)()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x1F4183880]();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = MEMORY[0x1F4183898]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.init<A>(reflecting:)()
{
  return MEMORY[0x1F41838A0]();
}

uint64_t static String._fromSubstring(_:)()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t String.removeSubrange(_:)()
{
  return MEMORY[0x1F41838E8]();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return MEMORY[0x1F4183958]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t String.index(before:)()
{
  return MEMORY[0x1F4183A00]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x1F4183B10]();
}

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return MEMORY[0x1F4183B30](a1._countAndFlagsBits, a1._object);
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x1F4183B58]();
}

{
  return MEMORY[0x1F4183BA0]();
}

uint64_t String.init<A>(_:)()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t Sequence<>.joined(separator:)()
{
  return MEMORY[0x1F4183CF0]();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1F4183E80]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x1F40E6338]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t Array<A>.encode(to:)()
{
  return MEMORY[0x1F4183FB0]();
}

uint64_t Bool.init(truncating:)()
{
  return MEMORY[0x1F40E6380]();
}

Swift::Bool_optional __swiftcall Bool.init(_:)(Swift::String a1)
{
  return (Swift::Bool_optional)MEMORY[0x1F4184000](a1._countAndFlagsBits, a1._object);
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t static TaskPriority.background.getter()
{
  return MEMORY[0x1F4187CA8]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t Double.init(truncating:)()
{
  return MEMORY[0x1F40E63B8]();
}

NSNumber __swiftcall Double._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x1F40E63C8]();
}

uint64_t Double.init(exactly:)()
{
  return MEMORY[0x1F40E63E0]();
}

uint64_t Double.write<A>(to:)()
{
  return MEMORY[0x1F4184048]();
}

uint64_t Set.description.getter()
{
  return MEMORY[0x1F4184100]();
}

uint64_t Set.init(minimumCapacity:)()
{
  return MEMORY[0x1F4184138]();
}

uint64_t Set.isEmpty.getter()
{
  return MEMORY[0x1F41841C0]();
}

uint64_t Set.init<A>(_:)()
{
  return MEMORY[0x1F4184250]();
}

uint64_t Int.init(truncating:)()
{
  return MEMORY[0x1F40E6468]();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x1F40E6478]();
}

uint64_t static Int._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1F40E64A0]();
}

uint64_t Int.init(exactly:)()
{
  return MEMORY[0x1F40E64B8]();
}

Swift::OpaquePointer_optional __swiftcall NLEmbedding.vector(for:)(Swift::String a1)
{
  uint64_t v1 = (void *)MEMORY[0x1F41873F8](a1._countAndFlagsBits, a1._object);
  result.value._rawValue = v1;
  result.is_nil = v2;
  return result;
}

uint64_t MLMultiArray.init<A>(_:)()
{
  return MEMORY[0x1F40DB788]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x1F4188700]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x1F4187100]();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return MEMORY[0x1F4187110]();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return MEMORY[0x1F4188708]();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return MEMORY[0x1F4188710]();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return MEMORY[0x1F4188758]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x1F4184640]();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x1F4184820]();
}

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return MEMORY[0x1F40E6D88]();
}

uint64_t StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)()
{
  return MEMORY[0x1F41876A8]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t _HashTable.occupiedBucket(after:)()
{
  return MEMORY[0x1F4184B28]();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x1F4184C18](seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return MEMORY[0x1F4184CC0]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t StaticString.description.getter()
{
  return MEMORY[0x1F4184D20]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t dispatch thunk of _AnySequenceBox._makeIterator()()
{
  return MEMORY[0x1F4184FF8]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x1F4185050]();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return MEMORY[0x1F41851A0](isUnique, capacity);
}

Swift::Void __swiftcall _NativeDictionary.copy()()
{
}

uint64_t _NativeDictionary._delete(at:)()
{
  return MEMORY[0x1F41851C0]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1F4185298]();
}

{
  return MEMORY[0x1F41852A0]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x1F4185350]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x1F4185368]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x1F4185380]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x1F4185398]();
}

uint64_t dispatch thunk of _AnyIteratorBoxBase.next()()
{
  return MEMORY[0x1F41853A8]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x1F41854C8](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x1F41854F8]();
}

{
  return MEMORY[0x1F4185500]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x1F4185568]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x1F4185628]();
}

{
  return MEMORY[0x1F4185630]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x1F4185658]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x1F4185690]();
}

{
  return MEMORY[0x1F41856A0]();
}

{
  return MEMORY[0x1F41856B0]();
}

{
  return MEMORY[0x1F41856E0]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x1F41856C0]();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return MEMORY[0x1F4185740](a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x1F4185758]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x1F41859F0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t _findStringSwitchCaseWithCache(cases:string:cache:)()
{
  return MEMORY[0x1F4185D10]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x1F4185EB0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t Mirror.superclassMirror.getter()
{
  return MEMORY[0x1F4185F08]();
}

uint64_t Mirror.init(reflecting:)()
{
  return MEMORY[0x1F4185F10]();
}

uint64_t Mirror.subjectType.getter()
{
  return MEMORY[0x1F4185F20]();
}

uint64_t Mirror.children.getter()
{
  return MEMORY[0x1F4185F40]();
}

uint64_t type metadata accessor for Mirror()
{
  return MEMORY[0x1F4185F48]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AFDeviceSupportsFullSiriUOD()
{
  return MEMORY[0x1F410AC80]();
}

uint64_t AFDeviceSupportsSAE()
{
  return MEMORY[0x1F410ACB8]();
}

uint64_t AFShouldRunAsrOnServerForUOD()
{
  return MEMORY[0x1F410AE50]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x1F4186398]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x1F41864A8]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x1F41866B0]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1F4186730]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1F41867B0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}