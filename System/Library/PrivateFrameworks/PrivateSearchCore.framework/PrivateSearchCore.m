void *AESCounterRandomNumberGenerator.kSeedSizeBytes.unsafeMutableAddressor()
{
  return &static AESCounterRandomNumberGenerator.kSeedSizeBytes;
}

uint64_t static AESCounterRandomNumberGenerator.kSeedSizeBytes.getter()
{
  return 32;
}

void *AESCounterRandomNumberGenerator.kCipherOutputBytes.unsafeMutableAddressor()
{
  return &static AESCounterRandomNumberGenerator.kCipherOutputBytes;
}

uint64_t static AESCounterRandomNumberGenerator.kCipherOutputBytes.getter()
{
  return 16;
}

void *AESCounterRandomNumberGenerator.kCipherOutputBits.unsafeMutableAddressor()
{
  return &static AESCounterRandomNumberGenerator.kCipherOutputBits;
}

uint64_t static AESCounterRandomNumberGenerator.kCipherOutputBits.getter()
{
  return 128;
}

void *AESCounterRandomNumberGenerator.__allocating_init(_:)(uint64_t a1)
{
  v2 = (void *)swift_allocObject();
  v2[2] = a1;
  v2[3] = 0;
  v3 = (void *)sub_25A82D000();
  v3[2] = 16;
  v3[4] = 0;
  v3[5] = 0;
  uint64_t v4 = MEMORY[0x263F8EE78];
  v2[4] = v3;
  v2[5] = v4;
  return v2;
}

void *AESCounterRandomNumberGenerator.init(_:)(uint64_t a1)
{
  v1[2] = a1;
  v1[3] = 0;
  v2 = (void *)sub_25A82D000();
  v2[2] = 16;
  v2[4] = 0;
  v2[5] = 0;
  uint64_t v3 = MEMORY[0x263F8EE78];
  v1[4] = v2;
  v1[5] = v3;
  return v1;
}

uint64_t sub_25A7FDEB0(int a1, size_t a2)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    uint64_t result = sub_25A82D2F0();
    __break(1u);
  }
  else
  {
    if (!a2) {
      return MEMORY[0x263F8EE78];
    }
    uint64_t v4 = sub_25A82D000();
    *(void *)(v4 + 16) = a2;
    memset((void *)(v4 + 32), a1, a2);
    return v4;
  }
  return result;
}

void *sub_25A7FDF6C(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)sub_25A82D000();
  v3[2] = 16;
  v3[5] = 0;
  v3[4] = 0;
  v8[0] = 16;
  uint64_t v4 = *(void *)(v1 + 16);
  size_t dataOutAvailable = *(void *)(v4 + 16);
  size_t v6 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  CCCrypt(0, 0, 2u, (const void *)(v4 + 32), dataOutAvailable, 0, (const void *)(a1 + 32), v6, v3 + 4, dataOutAvailable, v8);
  swift_bridgeObjectRelease();
  return v3;
}

unint64_t AESCounterRandomNumberGenerator.blockForOffset(_:)(uint64_t a1)
{
  BOOL v1 = __OFADD__(a1, 1);
  unint64_t result = a1 + 1;
  if (v1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = sub_25A7FED30(result);
    uint64_t v4 = sub_25A7FDF6C(v3);
    swift_bridgeObjectRelease();
    return (unint64_t)v4;
  }
  return result;
}

Swift::Void __swiftcall AESCounterRandomNumberGenerator.incrementCounter()()
{
  BOOL v1 = (char **)(v0 + 32);
  swift_beginAccess();
  v2 = *(char **)(v0 + 32);
  uint64_t v3 = *((void *)v2 + 2);
  if (v3)
  {
    uint64_t v4 = -v3;
    uint64_t v5 = 32;
    while (1)
    {
      unint64_t v6 = v5 - 32;
      if ((unint64_t)(v5 - 32) >= *((void *)v2 + 2))
      {
        __break(1u);
LABEL_16:
        __break(1u);
        goto LABEL_17;
      }
      if (v2[v5] != 255) {
        break;
      }
      swift_beginAccess();
      v2 = *v1;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      void *v1 = v2;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v2 = sub_25A7FE8D8((uint64_t)v2);
        void *v1 = v2;
      }
      if (v6 >= *((void *)v2 + 2)) {
        goto LABEL_16;
      }
      v2[v5] = 0;
      v2 = *v1;
      swift_endAccess();
      ++v5;
      if (v4 + v5 == 32) {
        return;
      }
    }
    swift_beginAccess();
    v2 = *v1;
    char v8 = swift_isUniquelyReferenced_nonNull_native();
    void *v1 = v2;
    if (v8) {
      goto LABEL_11;
    }
LABEL_17:
    v2 = sub_25A7FE8D8((uint64_t)v2);
    void *v1 = v2;
LABEL_11:
    if (v6 >= *((void *)v2 + 2))
    {
      __break(1u);
    }
    else if ((((v2[v5] + 1) >> 8) & 1) == 0)
    {
      ++v2[v5];
      swift_endAccess();
      return;
    }
    __break(1u);
  }
}

void *AESCounterRandomNumberGenerator.nextBlock()()
{
  AESCounterRandomNumberGenerator.incrementCounter()();
  swift_beginAccess();
  uint64_t v0 = swift_bridgeObjectRetain();
  BOOL v1 = sub_25A7FDF6C(v0);
  swift_bridgeObjectRelease();
  return v1;
}

Swift::UInt32 __swiftcall AESCounterRandomNumberGenerator.nextUInt32()()
{
  if (!*(void *)(v2[5] + 16)) {
    goto LABEL_4;
  }
  uint64_t v3 = v2[3];
  if (__OFSUB__(16, v3)) {
    goto LABEL_25;
  }
  if (16 - v3 <= 3)
  {
LABEL_4:
    AESCounterRandomNumberGenerator.incrementCounter()();
    swift_beginAccess();
    uint64_t v1 = v2[4];
    uint64_t v4 = swift_bridgeObjectRetain();
    uint64_t v5 = sub_25A7FDF6C(v4);
    swift_bridgeObjectRelease();
    v2[5] = v5;
    swift_bridgeObjectRelease();
    uint64_t v3 = 0;
    v2[3] = 0;
  }
  uint64_t v6 = v3 + 4;
  if (__OFADD__(v3, 4))
  {
    __break(1u);
    goto LABEL_20;
  }
  if (v6 <= v3)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (v3 < 0)
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v1 = v2[5];
  unint64_t v7 = *(void *)(v1 + 16);
  if (v7 < v3 || (uint64_t)v7 < v6) {
    goto LABEL_22;
  }
  sub_25A82D380();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain_n();
  uint64_t v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_bridgeObjectRelease();
    uint64_t v9 = MEMORY[0x263F8EE78];
  }
  uint64_t v10 = *(void *)(v9 + 16);
  swift_release();
  if (v10 == 4)
  {
    if (!swift_dynamicCastClass()) {
      swift_bridgeObjectRelease();
    }
    goto LABEL_17;
  }
LABEL_23:
  swift_bridgeObjectRelease();
  sub_25A7FE8EC(v1, v1 + 32, v3, (2 * v6) | 1);
LABEL_17:
  swift_bridgeObjectRelease();
  Swift::UInt32 v11 = Array<A>.parseUInt32BigEndian()();
  Swift::UInt32 result = swift_release();
  uint64_t v12 = v2[3];
  BOOL v13 = __OFADD__(v12, 4);
  uint64_t v14 = v12 + 4;
  if (!v13)
  {
    v2[3] = v14;
    return v11;
  }
  __break(1u);
LABEL_25:
  __break(1u);
  return result;
}

uint64_t AESCounterRandomNumberGenerator.getCounter()()
{
  return swift_bridgeObjectRetain();
}

uint64_t AESCounterRandomNumberGenerator.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AESCounterRandomNumberGenerator.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t variable initialization expression of BenchmarkConfig._indexer()
{
  return 0;
}

uint64_t variable initialization expression of BenchmarkConfig._dataSet()
{
  return 0;
}

uint64_t variable initialization expression of IndexReport.indexedTopLevelDirs()
{
  return MEMORY[0x263F8EE78];
}

uint64_t variable initialization expression of IndexReport._totalDocuments()
{
  return 0;
}

uint64_t variable initialization expression of IndexReport._totalDocumentBytes()
{
  return 0;
}

uint64_t variable initialization expression of IndexReport._totalDocumentTokens()
{
  return 0;
}

uint64_t variable initialization expression of IndexReport._totalIndexSizeBytes()
{
  return 0;
}

uint64_t variable initialization expression of IndexReport._totalIndexingMillis()
{
  return 0;
}

uint64_t variable initialization expression of IndexReport._totalUniqueTokens()
{
  return 0;
}

uint64_t variable initialization expression of IndexReport._documentsPerSecond()
{
  return 0;
}

uint64_t variable initialization expression of IndexReport._tokensPerSecond()
{
  return 0;
}

uint64_t variable initialization expression of IndexReport._indexBytesToDocsBytesRatio()
{
  return 0;
}

uint64_t variable initialization expression of IndexReport._averageDocumentBytes()
{
  return 0;
}

uint64_t variable initialization expression of IndexReport._averageIndexBytes()
{
  return 0;
}

uint64_t variable initialization expression of SearchReport.falsePositiveQueryTokens()
{
  return MEMORY[0x263F8EE78];
}

uint64_t variable initialization expression of SearchReport._uniqueTokenCount()
{
  return 0;
}

uint64_t variable initialization expression of SearchReport._durationMillis()
{
  return 0;
}

uint64_t variable initialization expression of SearchReport._falsePositiveQueryCount()
{
  return 0;
}

uint64_t variable initialization expression of SearchReport._falsePositiveQueryPercentage()
{
  return 0;
}

uint64_t variable initialization expression of SearchReport._averageFalsePositiveResultPercentage()
{
  return 0;
}

uint64_t variable initialization expression of SearchReport._searchesPerSecond()
{
  return 0;
}

uint64_t variable initialization expression of BenchmarkReport._storage()
{
  if (qword_26A465AE0 != -1) {
    swift_once();
  }
  return swift_retain();
}

double variable initialization expression of CallContextImpl.clientContext@<D0>(_OWORD *a1@<X8>)
{
  double result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t variable initialization expression of LevelCapacityUsageState.concurrentQueue()
{
  uint64_t v0 = sub_25A82D1A0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A82CE00();
  MEMORY[0x270FA5388]();
  sub_25A82D190();
  MEMORY[0x270FA5388]();
  sub_25A7FEDDC();
  sub_25A82D180();
  sub_25A82CDF0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v0);
  return sub_25A82D1D0();
}

uint64_t variable initialization expression of TestDataBundle.IndexingData.documents()
{
  return MEMORY[0x263F8EE78];
}

uint64_t variable initialization expression of TestDataBundle.IndexingData.Document._name()
{
  return 0;
}

uint64_t variable initialization expression of TestDataBundle.IndexingData.Document._body()
{
  return 0;
}

uint64_t variable initialization expression of TestDataBundle.IndexingData.Document._path()
{
  return 0;
}

uint64_t variable initialization expression of TestDataBundle.SearchingData.tokens()
{
  return MEMORY[0x263F8EE78];
}

uint64_t variable initialization expression of TestDataBundle.SearchingData.Token._token()
{
  return 0;
}

uint64_t variable initialization expression of TestDataBundle.SearchingData.Token._frequency()
{
  return 0x100000000;
}

uint64_t variable initialization expression of TestDataBundle._indexingData@<X0>(uint64_t a1@<X8>)
{
  return sub_25A7FE864(type metadata accessor for TestDataBundle.IndexingData, a1);
}

uint64_t variable initialization expression of TestDataBundle._searchingData@<X0>(uint64_t a1@<X8>)
{
  return sub_25A7FE864(type metadata accessor for TestDataBundle.SearchingData, a1);
}

uint64_t sub_25A7FE864@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = a1(0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);
  return v4(a2, 1, 1, v3);
}

char *sub_25A7FE8D8(uint64_t a1)
{
  return sub_25A813E54(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_25A7FE8EC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  int64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return MEMORY[0x263F8EE78];
    }
    if (v5 <= 0)
    {
      char v8 = (void *)MEMORY[0x263F8EE78];
      if (v4 != a3)
      {
LABEL_5:
        if (v5 < 0) {
          goto LABEL_17;
        }
        uint64_t v10 = v8 + 4;
        if (a2 + a3 < (unint64_t)v8 + v5 + 32 && (unint64_t)v10 < a2 + a3 + v5) {
          goto LABEL_17;
        }
        memcpy(v10, (const void *)(a2 + a3), v5);
        return (uint64_t)v8;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A465B70);
      char v8 = (void *)swift_allocObject();
      size_t v9 = _swift_stdlib_malloc_size(v8);
      size_t v8[2] = v5;
      v8[3] = 2 * v9 - 64;
      if (v4 != a3) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_17:
  uint64_t result = sub_25A82D330();
  __break(1u);
  return result;
}

void *sub_25A7FEA48(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465B68);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_25A7FEB30((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_25A7FEE40();
  if (v6 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_25A7FEB30(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
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
  Swift::UInt32 v11 = a2;
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
    v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *Swift::UInt32 v11 = *v20;
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

uint64_t sub_25A7FED30(unint64_t a1)
{
  uint64_t result = sub_25A82D000();
  *(void *)(result + 16) = 16;
  *(void *)(result + 32) = 0;
  *(void *)(result + 40) = 0;
  if ((uint64_t)a1 >= 1)
  {
    *(unsigned char *)(result + 32) = a1;
    if (a1 >= 0x100)
    {
      *(unsigned char *)(result + 33) = BYTE1(a1);
      if (a1 >= 0x10000)
      {
        *(unsigned char *)(result + 34) = BYTE2(a1);
        if (a1 >> 24)
        {
          *(unsigned char *)(result + 35) = BYTE3(a1);
          if (HIDWORD(a1))
          {
            *(unsigned char *)(result + 36) = BYTE4(a1);
            if (a1 >> 40)
            {
              *(unsigned char *)(result + 37) = BYTE5(a1);
              if (HIWORD(a1))
              {
                *(unsigned char *)(result + 38) = BYTE6(a1);
                if (HIBYTE(a1)) {
                  *(unsigned char *)(result + 39) = HIBYTE(a1);
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

unint64_t sub_25A7FEDDC()
{
  unint64_t result = qword_26A465B60;
  if (!qword_26A465B60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A465B60);
  }
  return result;
}

uint64_t type metadata accessor for AESCounterRandomNumberGenerator()
{
  return self;
}

uint64_t sub_25A7FEE40()
{
  return swift_release();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t AsyncThrowingStream.toArray()(void *a1)
{
  v2[3] = a1;
  v2[4] = v1;
  uint64_t v4 = a1[2];
  v2[5] = v4;
  v2[6] = *(void *)(v4 - 8);
  v2[7] = swift_task_alloc();
  uint64_t v5 = a1[3];
  v2[8] = v5;
  v2[9] = *(void *)(v5 - 8);
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  sub_25A82D1E0();
  v2[12] = swift_task_alloc();
  v2[13] = a1[4];
  uint64_t v6 = sub_25A82D0F0();
  v2[14] = v6;
  v2[15] = *(void *)(v6 - 8);
  v2[16] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25A7FF064, 0, 0);
}

uint64_t sub_25A7FF064()
{
  v0[2] = sub_25A82CFF0();
  sub_25A82D0D0();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[17] = v1;
  void *v1 = v0;
  v1[1] = sub_25A7FF138;
  uint64_t v2 = v0[14];
  uint64_t v4 = v0[11];
  uint64_t v3 = v0[12];
  return MEMORY[0x270FA20F8](v3, 0, 0, v2, v4);
}

uint64_t sub_25A7FF138()
{
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v1 = sub_25A7FF404;
  }
  else
  {
    uint64_t v1 = sub_25A7FF250;
  }
  return MEMORY[0x270FA2498](v1, 0, 0);
}

uint64_t sub_25A7FF250()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[6];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(v0[15] + 8))(v0[16], v0[14]);
    uint64_t v4 = v0[2];
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
    return v5(v4);
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t))(v3 + 32))(v0[7], v1, v2);
    sub_25A82D020();
    sub_25A82D010();
    uint64_t v7 = (void *)swift_task_alloc();
    v0[17] = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_25A7FF138;
    uint64_t v8 = v0[14];
    uint64_t v10 = v0[11];
    uint64_t v9 = v0[12];
    return MEMORY[0x270FA20F8](v9, 0, 0, v8, v10);
  }
}

uint64_t sub_25A7FF404()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0[9] + 32);
  v1(v0[10], v0[11], v0[8]);
  uint64_t v2 = sub_25A82D360();
  uint64_t v3 = v0[8];
  if (v2)
  {
    (*(void (**)(void, void))(v0[9] + 8))(v0[10], v0[8]);
  }
  else
  {
    uint64_t v4 = v0[10];
    swift_allocError();
    v1(v5, v4, v3);
  }
  (*(void (**)(void, void))(v0[15] + 8))(v0[16], v0[14]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t AsyncThrowingStream.transform<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A465B80);
  sub_25A82D090();
  MEMORY[0x270FA5388]();
  uint64_t v10 = &v13[-v9];
  long long v14 = *(_OWORD *)(a3 + 16);
  uint64_t v11 = *(void *)(a3 + 32);
  uint64_t v15 = a4;
  uint64_t v16 = v11;
  uint64_t v17 = v4;
  uint64_t v18 = a1;
  uint64_t v19 = a2;
  sub_25A800734((uint64_t)v10);
  return sub_25A82D110();
}

uint64_t sub_25A7FF648(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v36 = a8;
  uint64_t v37 = a7;
  uint64_t v34 = a5;
  uint64_t v35 = a6;
  uint64_t v38 = a3;
  uint64_t v39 = a4;
  uint64_t v33 = a2;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A465B80);
  uint64_t v9 = sub_25A82D0C0();
  uint64_t v31 = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  int64_t v12 = (char *)&v30 - v11;
  v32 = (char *)&v30 - v11;
  uint64_t v13 = sub_25A82D100();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x270FA5388]();
  uint64_t v17 = (char *)&v30 - v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465B88);
  MEMORY[0x270FA5388]();
  uint64_t v19 = (char *)&v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_25A82D060();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 1, 1, v20);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v17, v33, v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  unint64_t v21 = (*(unsigned __int8 *)(v14 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  unint64_t v22 = (v15 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v23 = (*(unsigned __int8 *)(v10 + 80) + v22 + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v24 = (char *)swift_allocObject();
  *((void *)v24 + 2) = 0;
  *((void *)v24 + 3) = 0;
  uint64_t v25 = v35;
  *((void *)v24 + 4) = v34;
  *((void *)v24 + 5) = v25;
  uint64_t v26 = v36;
  *((void *)v24 + 6) = v37;
  *((void *)v24 + 7) = v26;
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v24[v21], v17, v13);
  v27 = &v24[v22];
  uint64_t v28 = v39;
  *(void *)v27 = v38;
  *((void *)v27 + 1) = v28;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v24[v23], v32, v31);
  swift_retain();
  sub_25A820418((uint64_t)v19, (uint64_t)&unk_26A465B98, (uint64_t)v24);
  return swift_release();
}

uint64_t sub_25A7FF964(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[10] = v16;
  v8[11] = v17;
  v8[8] = a8;
  v8[9] = v15;
  v8[6] = a6;
  v8[7] = a7;
  v8[4] = a4;
  v8[5] = a5;
  v8[12] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A465B80);
  uint64_t v10 = sub_25A82D080();
  v8[13] = v10;
  v8[14] = *(void *)(v10 - 8);
  v8[15] = swift_task_alloc();
  v8[16] = *(void *)(v16 - 8);
  v8[17] = swift_task_alloc();
  v8[18] = swift_task_alloc();
  uint64_t v11 = sub_25A82D1E0();
  v8[19] = v11;
  v8[20] = *(void *)(v11 - 8);
  v8[21] = swift_task_alloc();
  v8[22] = swift_task_alloc();
  v8[23] = *(void *)(a8 - 8);
  v8[24] = swift_task_alloc();
  v8[25] = *(void *)(v15 - 8);
  v8[26] = swift_task_alloc();
  v8[27] = swift_task_alloc();
  sub_25A82D1E0();
  v8[28] = swift_task_alloc();
  uint64_t v12 = sub_25A82D0F0();
  v8[29] = v12;
  v8[30] = *(void *)(v12 - 8);
  v8[31] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25A7FFC94, 0, 0);
}

uint64_t sub_25A7FFC94()
{
  sub_25A82D100();
  sub_25A82D0D0();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[32] = v1;
  void *v1 = v0;
  v1[1] = sub_25A7FFD5C;
  uint64_t v2 = v0[28];
  uint64_t v3 = v0[29];
  uint64_t v4 = v0[27];
  return MEMORY[0x270FA20F8](v2, 0, 0, v3, v4);
}

uint64_t sub_25A7FFD5C()
{
  swift_task_dealloc();
  if (v0) {
    uint64_t v1 = sub_25A800420;
  }
  else {
    uint64_t v1 = sub_25A7FFE6C;
  }
  return MEMORY[0x270FA2498](v1, 0, 0);
}

uint64_t sub_25A7FFE6C()
{
  uint64_t v1 = v0[28];
  uint64_t v2 = v0[23];
  uint64_t v3 = v0[8];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 1, v3) == 1)
  {
    (*(void (**)(void, void))(v0[30] + 8))(v0[31], v0[29]);
    v0[3] = 0;
    sub_25A82D0C0();
    sub_25A82D0B0();
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
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  else
  {
    uint64_t v6 = (int *)v0[5];
    (*(void (**)(void, uint64_t, uint64_t))(v2 + 32))(v0[24], v1, v3);
    uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
    uint64_t v7 = (void *)swift_task_alloc();
    v0[33] = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_25A8000B0;
    uint64_t v8 = v0[24];
    uint64_t v9 = v0[22];
    return v10(v9, v8);
  }
}

uint64_t sub_25A8000B0()
{
  *(void *)(*(void *)v1 + 272) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25A8005E8;
  }
  else {
    uint64_t v2 = sub_25A8001C4;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25A8001C4()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[16];
  uint64_t v3 = v0[10];
  (*(void (**)(uint64_t, void, void))(v0[20] + 16))(v1, v0[22], v0[19]);
  int v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 1, v3);
  uint64_t v5 = v0[23];
  uint64_t v6 = v0[24];
  uint64_t v7 = v0[21];
  uint64_t v8 = v0[19];
  uint64_t v9 = v0[20];
  if (v4 == 1)
  {
    uint64_t v10 = v0[8];
    uint64_t v11 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v11(v0[22], v0[19]);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v10);
    v11(v7, v8);
  }
  else
  {
    uint64_t v27 = v0[24];
    uint64_t v13 = v0[17];
    uint64_t v12 = v0[18];
    uint64_t v24 = v0[19];
    uint64_t v25 = v0[22];
    uint64_t v14 = v0[15];
    uint64_t v15 = v0[16];
    uint64_t v16 = v0[14];
    uint64_t v17 = v0[10];
    uint64_t v26 = v0[8];
    uint64_t v23 = v0[13];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v12, v7, v17);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v13, v12, v17);
    sub_25A82D0C0();
    sub_25A82D0A0();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v23);
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v12, v17);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v25, v24);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v27, v26);
  }
  uint64_t v18 = (void *)swift_task_alloc();
  v0[32] = v18;
  *uint64_t v18 = v0;
  v18[1] = sub_25A7FFD5C;
  uint64_t v19 = v0[28];
  uint64_t v20 = v0[29];
  uint64_t v21 = v0[27];
  return MEMORY[0x270FA20F8](v19, 0, 0, v20, v21);
}

uint64_t sub_25A800420()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0[25] + 32);
  v1(v0[26], v0[27], v0[9]);
  uint64_t v2 = sub_25A82D360();
  uint64_t v3 = v0[26];
  uint64_t v4 = v0[9];
  if (v2)
  {
    uint64_t v5 = v2;
    (*(void (**)(void, void))(v0[25] + 8))(v0[26], v0[9]);
  }
  else
  {
    uint64_t v5 = swift_allocError();
    v1(v6, v3, v4);
  }
  (*(void (**)(void, void))(v0[30] + 8))(v0[31], v0[29]);
  v0[2] = v5;
  sub_25A82D0C0();
  sub_25A82D0B0();
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
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_25A8005E8()
{
  (*(void (**)(void, void))(v0[23] + 8))(v0[24], v0[8]);
  uint64_t v1 = v0[34];
  (*(void (**)(void, void))(v0[30] + 8))(v0[31], v0[29]);
  v0[2] = v1;
  sub_25A82D0C0();
  sub_25A82D0B0();
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
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_25A800734@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F8F680];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A465B80);
  uint64_t v3 = sub_25A82D090();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_25A800818(uint64_t a1)
{
  return sub_25A7FF648(a1, v1[6], v1[7], v1[8], v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_25A80082C()
{
  uint64_t v1 = sub_25A82D100();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 64) & ~v3;
  unint64_t v5 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A465B80);
  uint64_t v6 = sub_25A82D0C0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8 + 16) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  return MEMORY[0x270FA0238](v0, v10, v11);
}

uint64_t sub_25A8009C0(uint64_t a1)
{
  uint64_t v17 = v1[4];
  uint64_t v3 = *(void *)(sub_25A82D100() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A465B80);
  uint64_t v6 = *(void *)(sub_25A82D0C0() - 8);
  unint64_t v7 = (v5 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = v1[2];
  uint64_t v9 = v1[3];
  uint64_t v10 = (uint64_t)v1 + v4;
  uint64_t v11 = (char *)v1 + v5;
  uint64_t v13 = *(void *)((char *)v1 + v5);
  uint64_t v12 = *((void *)v11 + 1);
  uint64_t v14 = (uint64_t)v1 + v7;
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v15;
  *uint64_t v15 = v2;
  v15[1] = sub_25A800B84;
  return sub_25A7FF964(a1, v8, v9, v10, v13, v12, v14, v17);
}

uint64_t sub_25A800B84()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t IndexableFileType.init()()
{
  return 0;
}

void sub_25A800C9C(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

unint64_t sub_25A800CAC@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = result < 3;
  *(unsigned char *)(a2 + 9) = 0;
  return result;
}

uint64_t sub_25A800CC4()
{
  return *(void *)v0;
}

void *sub_25A800CCC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result >= 3uLL;
  *(void *)a2 = *result;
  char v3 = !v2;
  *(unsigned char *)(a2 + 8) = v3;
  *(unsigned char *)(a2 + 9) = 0;
  return result;
}

void sub_25A800CE8(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_25A800CF4()
{
  return sub_25A82D430();
}

uint64_t sub_25A800D60(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_25A80CC74();
  return MEMORY[0x270F44AF0](a1, a2, v4);
}

uint64_t sub_25A800DAC()
{
  return sub_25A82D430();
}

BOOL sub_25A800E14(void *a1, void *a2)
{
  return *a1 == *a2;
}

void sub_25A800E28()
{
  static IndexableFileType.allCases = (uint64_t)&unk_27085D540;
}

uint64_t *IndexableFileType.allCases.unsafeMutableAddressor()
{
  if (qword_26A465AB0 != -1) {
    swift_once();
  }
  return &static IndexableFileType.allCases;
}

uint64_t static IndexableFileType.allCases.getter()
{
  if (qword_26A465AB0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static IndexableFileType.allCases.setter(uint64_t a1)
{
  if (qword_26A465AB0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  static IndexableFileType.allCases = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static IndexableFileType.allCases.modify())()
{
  if (qword_26A465AB0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_25A80100C@<X0>(void *a1@<X8>)
{
  if (qword_26A465AB0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  *a1 = static IndexableFileType.allCases;
  return swift_bridgeObjectRetain();
}

uint64_t BenchmarkConfig.indexer.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for BenchmarkConfig(0) + 20));
  if (v1[1]) {
    uint64_t v2 = *v1;
  }
  else {
    uint64_t v2 = 0;
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t type metadata accessor for BenchmarkConfig(uint64_t a1)
{
  return sub_25A802F48(a1, (uint64_t *)&unk_26A465C80);
}

uint64_t BenchmarkConfig.indexer.setter(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for BenchmarkConfig(0) + 20));
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*BenchmarkConfig.indexer.modify(uint64_t a1))()
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for BenchmarkConfig(0) + 20);
  *(_DWORD *)(a1 + 24) = v3;
  unint64_t v4 = (uint64_t *)(v1 + v3);
  unint64_t v5 = v4[1];
  if (v5)
  {
    uint64_t v6 = *v4;
    unint64_t v7 = v5;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_25A8011C4;
}

BOOL BenchmarkConfig.hasIndexer.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for BenchmarkConfig(0) + 20) + 8) != 0;
}

Swift::Void __swiftcall BenchmarkConfig.clearIndexer()()
{
  uint64_t v1 = (void *)(v0 + *(int *)(type metadata accessor for BenchmarkConfig(0) + 20));
  swift_bridgeObjectRelease();
  void *v1 = 0;
  v1[1] = 0;
}

uint64_t BenchmarkConfig.dataSet.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for BenchmarkConfig(0) + 24));
  if (v1[1]) {
    uint64_t v2 = *v1;
  }
  else {
    uint64_t v2 = 0;
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t BenchmarkConfig.dataSet.setter(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for BenchmarkConfig(0) + 24));
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*BenchmarkConfig.dataSet.modify(uint64_t a1))()
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for BenchmarkConfig(0) + 24);
  *(_DWORD *)(a1 + 24) = v3;
  unint64_t v4 = (uint64_t *)(v1 + v3);
  unint64_t v5 = v4[1];
  if (v5)
  {
    uint64_t v6 = *v4;
    unint64_t v7 = v5;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_25A8011C4;
}

uint64_t sub_25A801348(uint64_t *a1, char a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = (void *)(a1[2] + *((int *)a1 + 6));
  uint64_t v4 = *a1;
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    void *v3 = v4;
    v3[1] = v2;
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    void *v3 = v4;
    v3[1] = v2;
  }
  return result;
}

BOOL BenchmarkConfig.hasDataSet.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for BenchmarkConfig(0) + 24) + 8) != 0;
}

Swift::Void __swiftcall BenchmarkConfig.clearDataSet()()
{
  uint64_t v1 = (void *)(v0 + *(int *)(type metadata accessor for BenchmarkConfig(0) + 24));
  swift_bridgeObjectRelease();
  void *v1 = 0;
  v1[1] = 0;
}

uint64_t (*BenchmarkConfig.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t BenchmarkConfig.init()@<X0>(uint64_t a1@<X8>)
{
  _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t result = type metadata accessor for BenchmarkConfig(0);
  uint64_t v3 = (void *)(a1 + *(int *)(result + 20));
  void *v3 = 0;
  v3[1] = 0;
  uint64_t v4 = (void *)(a1 + *(int *)(result + 24));
  *uint64_t v4 = 0;
  v4[1] = 0;
  return result;
}

uint64_t IndexReport.totalDocuments.getter()
{
  return sub_25A8021EC(type metadata accessor for IndexReport);
}

uint64_t type metadata accessor for IndexReport(uint64_t a1)
{
  return sub_25A802F48(a1, (uint64_t *)&unk_26A465C90);
}

uint64_t IndexReport.totalDocuments.setter(uint64_t a1)
{
  return sub_25A802260(a1, type metadata accessor for IndexReport);
}

uint64_t (*IndexReport.totalDocuments.modify(uint64_t a1))(uint64_t result)
{
  *(void *)(a1 + 8) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for IndexReport(0) + 24);
  *(_DWORD *)(a1 + 16) = v3;
  uint64_t v4 = (uint64_t *)(v1 + v3);
  if (*((unsigned char *)v4 + 8)) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *v4;
  }
  *(void *)a1 = v5;
  return sub_25A801558;
}

BOOL IndexReport.hasTotalDocuments.getter()
{
  return sub_25A80231C(type metadata accessor for IndexReport);
}

Swift::Void __swiftcall IndexReport.clearTotalDocuments()()
{
}

uint64_t IndexReport.totalDocumentBytes.getter()
{
  return sub_25A8023BC(type metadata accessor for IndexReport);
}

uint64_t IndexReport.totalDocumentBytes.setter(uint64_t a1)
{
  return sub_25A802410(a1, type metadata accessor for IndexReport);
}

uint64_t (*IndexReport.totalDocumentBytes.modify(uint64_t a1))(uint64_t result)
{
  *(void *)(a1 + 8) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for IndexReport(0) + 28);
  *(_DWORD *)(a1 + 16) = v3;
  uint64_t v4 = (uint64_t *)(v1 + v3);
  if (*((unsigned char *)v4 + 8)) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *v4;
  }
  *(void *)a1 = v5;
  return sub_25A801558;
}

BOOL IndexReport.hasTotalDocumentBytes.getter()
{
  return sub_25A8024CC(type metadata accessor for IndexReport);
}

Swift::Void __swiftcall IndexReport.clearTotalDocumentBytes()()
{
}

uint64_t IndexReport.totalDocumentTokens.getter()
{
  return sub_25A80256C(type metadata accessor for IndexReport);
}

uint64_t IndexReport.totalDocumentTokens.setter(uint64_t a1)
{
  return sub_25A8025C0(a1, type metadata accessor for IndexReport);
}

uint64_t (*IndexReport.totalDocumentTokens.modify(uint64_t a1))(uint64_t result)
{
  *(void *)(a1 + 8) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for IndexReport(0) + 32);
  *(_DWORD *)(a1 + 16) = v3;
  uint64_t v4 = (uint64_t *)(v1 + v3);
  if (*((unsigned char *)v4 + 8)) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *v4;
  }
  *(void *)a1 = v5;
  return sub_25A801558;
}

BOOL IndexReport.hasTotalDocumentTokens.getter()
{
  return sub_25A802694(type metadata accessor for IndexReport);
}

Swift::Void __swiftcall IndexReport.clearTotalDocumentTokens()()
{
}

uint64_t IndexReport.totalIndexSizeBytes.getter()
{
  uint64_t v1 = (unsigned char *)(v0 + *(int *)(type metadata accessor for IndexReport(0) + 36));
  if (v1[8]) {
    return 0;
  }
  else {
    return *(void *)v1;
  }
}

uint64_t IndexReport.totalIndexSizeBytes.setter(uint64_t a1)
{
  uint64_t result = type metadata accessor for IndexReport(0);
  uint64_t v4 = v1 + *(int *)(result + 36);
  *(void *)uint64_t v4 = a1;
  *(unsigned char *)(v4 + 8) = 0;
  return result;
}

uint64_t (*IndexReport.totalIndexSizeBytes.modify(uint64_t a1))(uint64_t result)
{
  *(void *)(a1 + 8) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for IndexReport(0) + 36);
  *(_DWORD *)(a1 + 16) = v3;
  uint64_t v4 = (uint64_t *)(v1 + v3);
  if (*((unsigned char *)v4 + 8)) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *v4;
  }
  *(void *)a1 = v5;
  return sub_25A801558;
}

BOOL IndexReport.hasTotalIndexSizeBytes.getter()
{
  return sub_25A802864(type metadata accessor for IndexReport);
}

Swift::Void __swiftcall IndexReport.clearTotalIndexSizeBytes()()
{
}

uint64_t IndexReport.totalIndexingMillis.getter()
{
  uint64_t v1 = (unsigned char *)(v0 + *(int *)(type metadata accessor for IndexReport(0) + 40));
  if (v1[8]) {
    return 0;
  }
  else {
    return *(void *)v1;
  }
}

uint64_t IndexReport.totalIndexingMillis.setter(uint64_t a1)
{
  uint64_t result = type metadata accessor for IndexReport(0);
  uint64_t v4 = v1 + *(int *)(result + 40);
  *(void *)uint64_t v4 = a1;
  *(unsigned char *)(v4 + 8) = 0;
  return result;
}

uint64_t (*IndexReport.totalIndexingMillis.modify(uint64_t a1))(uint64_t result)
{
  *(void *)(a1 + 8) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for IndexReport(0) + 40);
  *(_DWORD *)(a1 + 16) = v3;
  uint64_t v4 = (uint64_t *)(v1 + v3);
  if (*((unsigned char *)v4 + 8)) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *v4;
  }
  *(void *)a1 = v5;
  return sub_25A801558;
}

BOOL IndexReport.hasTotalIndexingMillis.getter()
{
  return sub_25A8029E0(type metadata accessor for IndexReport);
}

Swift::Void __swiftcall IndexReport.clearTotalIndexingMillis()()
{
}

uint64_t IndexReport.totalUniqueTokens.getter()
{
  uint64_t v1 = (unsigned char *)(v0 + *(int *)(type metadata accessor for IndexReport(0) + 44));
  if (v1[8]) {
    return 0;
  }
  else {
    return *(void *)v1;
  }
}

uint64_t IndexReport.totalUniqueTokens.setter(uint64_t a1)
{
  uint64_t result = type metadata accessor for IndexReport(0);
  uint64_t v4 = v1 + *(int *)(result + 44);
  *(void *)uint64_t v4 = a1;
  *(unsigned char *)(v4 + 8) = 0;
  return result;
}

uint64_t (*IndexReport.totalUniqueTokens.modify(uint64_t a1))(uint64_t result)
{
  *(void *)(a1 + 8) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for IndexReport(0) + 44);
  *(_DWORD *)(a1 + 16) = v3;
  uint64_t v4 = (uint64_t *)(v1 + v3);
  if (*((unsigned char *)v4 + 8)) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *v4;
  }
  *(void *)a1 = v5;
  return sub_25A801558;
}

BOOL IndexReport.hasTotalUniqueTokens.getter()
{
  return sub_25A802B5C(type metadata accessor for IndexReport);
}

Swift::Void __swiftcall IndexReport.clearTotalUniqueTokens()()
{
}

uint64_t (*IndexReport.indexedTopLevelDirs.modify())()
{
  return nullsub_1;
}

double IndexReport.documentsPerSecond.getter()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for IndexReport(0) + 48);
  double result = *(double *)v1;
  if (*(unsigned char *)(v1 + 8)) {
    return 0.0;
  }
  return result;
}

uint64_t IndexReport.documentsPerSecond.setter(double a1)
{
  uint64_t result = type metadata accessor for IndexReport(0);
  uint64_t v4 = v1 + *(int *)(result + 48);
  *(double *)uint64_t v4 = a1;
  *(unsigned char *)(v4 + 8) = 0;
  return result;
}

uint64_t (*IndexReport.documentsPerSecond.modify(uint64_t a1))(uint64_t result)
{
  *(void *)(a1 + 8) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for IndexReport(0) + 48);
  *(_DWORD *)(a1 + 16) = v3;
  uint64_t v4 = v1 + v3;
  double v5 = *(double *)v4;
  if (*(unsigned char *)(v4 + 8)) {
    double v5 = 0.0;
  }
  *(double *)a1 = v5;
  return sub_25A801558;
}

BOOL IndexReport.hasDocumentsPerSecond.getter()
{
  return (*(unsigned char *)(v0 + *(int *)(type metadata accessor for IndexReport(0) + 48) + 8) & 1) == 0;
}

Swift::Void __swiftcall IndexReport.clearDocumentsPerSecond()()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for IndexReport(0) + 48);
  *(void *)uint64_t v1 = 0;
  *(unsigned char *)(v1 + 8) = 1;
}

double IndexReport.tokensPerSecond.getter()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for IndexReport(0) + 52);
  double result = *(double *)v1;
  if (*(unsigned char *)(v1 + 8)) {
    return 0.0;
  }
  return result;
}

uint64_t IndexReport.tokensPerSecond.setter(double a1)
{
  uint64_t result = type metadata accessor for IndexReport(0);
  uint64_t v4 = v1 + *(int *)(result + 52);
  *(double *)uint64_t v4 = a1;
  *(unsigned char *)(v4 + 8) = 0;
  return result;
}

uint64_t (*IndexReport.tokensPerSecond.modify(uint64_t a1))(uint64_t result)
{
  *(void *)(a1 + 8) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for IndexReport(0) + 52);
  *(_DWORD *)(a1 + 16) = v3;
  uint64_t v4 = v1 + v3;
  double v5 = *(double *)v4;
  if (*(unsigned char *)(v4 + 8)) {
    double v5 = 0.0;
  }
  *(double *)a1 = v5;
  return sub_25A801558;
}

BOOL IndexReport.hasTokensPerSecond.getter()
{
  return (*(unsigned char *)(v0 + *(int *)(type metadata accessor for IndexReport(0) + 52) + 8) & 1) == 0;
}

Swift::Void __swiftcall IndexReport.clearTokensPerSecond()()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for IndexReport(0) + 52);
  *(void *)uint64_t v1 = 0;
  *(unsigned char *)(v1 + 8) = 1;
}

double IndexReport.indexBytesToDocsBytesRatio.getter()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for IndexReport(0) + 56);
  double result = *(double *)v1;
  if (*(unsigned char *)(v1 + 8)) {
    return 0.0;
  }
  return result;
}

uint64_t IndexReport.indexBytesToDocsBytesRatio.setter(double a1)
{
  uint64_t result = type metadata accessor for IndexReport(0);
  uint64_t v4 = v1 + *(int *)(result + 56);
  *(double *)uint64_t v4 = a1;
  *(unsigned char *)(v4 + 8) = 0;
  return result;
}

uint64_t (*IndexReport.indexBytesToDocsBytesRatio.modify(uint64_t a1))(uint64_t result)
{
  *(void *)(a1 + 8) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for IndexReport(0) + 56);
  *(_DWORD *)(a1 + 16) = v3;
  uint64_t v4 = v1 + v3;
  double v5 = *(double *)v4;
  if (*(unsigned char *)(v4 + 8)) {
    double v5 = 0.0;
  }
  *(double *)a1 = v5;
  return sub_25A801558;
}

BOOL IndexReport.hasIndexBytesToDocsBytesRatio.getter()
{
  return (*(unsigned char *)(v0 + *(int *)(type metadata accessor for IndexReport(0) + 56) + 8) & 1) == 0;
}

Swift::Void __swiftcall IndexReport.clearIndexBytesToDocsBytesRatio()()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for IndexReport(0) + 56);
  *(void *)uint64_t v1 = 0;
  *(unsigned char *)(v1 + 8) = 1;
}

uint64_t IndexReport.averageDocumentBytes.getter()
{
  uint64_t v1 = (unsigned char *)(v0 + *(int *)(type metadata accessor for IndexReport(0) + 60));
  if (v1[8]) {
    return 0;
  }
  else {
    return *(void *)v1;
  }
}

uint64_t IndexReport.averageDocumentBytes.setter(uint64_t a1)
{
  uint64_t result = type metadata accessor for IndexReport(0);
  uint64_t v4 = v1 + *(int *)(result + 60);
  *(void *)uint64_t v4 = a1;
  *(unsigned char *)(v4 + 8) = 0;
  return result;
}

uint64_t (*IndexReport.averageDocumentBytes.modify(uint64_t a1))(uint64_t result)
{
  *(void *)(a1 + 8) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for IndexReport(0) + 60);
  *(_DWORD *)(a1 + 16) = v3;
  uint64_t v4 = (uint64_t *)(v1 + v3);
  if (*((unsigned char *)v4 + 8)) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *v4;
  }
  *(void *)a1 = v5;
  return sub_25A801558;
}

BOOL IndexReport.hasAverageDocumentBytes.getter()
{
  return (*(unsigned char *)(v0 + *(int *)(type metadata accessor for IndexReport(0) + 60) + 8) & 1) == 0;
}

Swift::Void __swiftcall IndexReport.clearAverageDocumentBytes()()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for IndexReport(0) + 60);
  *(void *)uint64_t v1 = 0;
  *(unsigned char *)(v1 + 8) = 1;
}

uint64_t IndexReport.averageIndexBytes.getter()
{
  uint64_t v1 = (unsigned char *)(v0 + *(int *)(type metadata accessor for IndexReport(0) + 64));
  if (v1[8]) {
    return 0;
  }
  else {
    return *(void *)v1;
  }
}

uint64_t IndexReport.averageIndexBytes.setter(uint64_t a1)
{
  uint64_t result = type metadata accessor for IndexReport(0);
  uint64_t v4 = v1 + *(int *)(result + 64);
  *(void *)uint64_t v4 = a1;
  *(unsigned char *)(v4 + 8) = 0;
  return result;
}

uint64_t (*IndexReport.averageIndexBytes.modify(uint64_t a1))(uint64_t result)
{
  *(void *)(a1 + 8) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for IndexReport(0) + 64);
  *(_DWORD *)(a1 + 16) = v3;
  uint64_t v4 = (uint64_t *)(v1 + v3);
  if (*((unsigned char *)v4 + 8)) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *v4;
  }
  *(void *)a1 = v5;
  return sub_25A801558;
}

BOOL IndexReport.hasAverageIndexBytes.getter()
{
  return (*(unsigned char *)(v0 + *(int *)(type metadata accessor for IndexReport(0) + 64) + 8) & 1) == 0;
}

Swift::Void __swiftcall IndexReport.clearAverageIndexBytes()()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for IndexReport(0) + 64);
  *(void *)uint64_t v1 = 0;
  *(unsigned char *)(v1 + 8) = 1;
}

uint64_t IndexReport.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25A802BFC(type metadata accessor for IndexReport, a1);
}

uint64_t IndexReport.unknownFields.setter(uint64_t a1)
{
  return sub_25A802C94(a1, type metadata accessor for IndexReport);
}

uint64_t (*IndexReport.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t IndexReport.init()@<X0>(void *a1@<X8>)
{
  *a1 = MEMORY[0x263F8EE78];
  uint64_t v2 = (int *)type metadata accessor for IndexReport(0);
  uint64_t result = _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t v4 = (char *)a1 + v2[6];
  *(void *)uint64_t v4 = 0;
  v4[8] = 1;
  uint64_t v5 = (char *)a1 + v2[7];
  *(void *)uint64_t v5 = 0;
  v5[8] = 1;
  uint64_t v6 = (char *)a1 + v2[8];
  *(void *)uint64_t v6 = 0;
  v6[8] = 1;
  unint64_t v7 = (char *)a1 + v2[9];
  *(void *)unint64_t v7 = 0;
  v7[8] = 1;
  uint64_t v8 = (char *)a1 + v2[10];
  *(void *)uint64_t v8 = 0;
  v8[8] = 1;
  uint64_t v9 = (char *)a1 + v2[11];
  *(void *)uint64_t v9 = 0;
  v9[8] = 1;
  uint64_t v10 = (char *)a1 + v2[12];
  *(void *)uint64_t v10 = 0;
  v10[8] = 1;
  uint64_t v11 = (char *)a1 + v2[13];
  *(void *)uint64_t v11 = 0;
  v11[8] = 1;
  uint64_t v12 = (char *)a1 + v2[14];
  *(void *)uint64_t v12 = 0;
  v12[8] = 1;
  uint64_t v13 = (char *)a1 + v2[15];
  *(void *)uint64_t v13 = 0;
  v13[8] = 1;
  uint64_t v14 = (char *)a1 + v2[16];
  *(void *)uint64_t v14 = 0;
  v14[8] = 1;
  return result;
}

uint64_t SearchReport.uniqueTokenCount.getter()
{
  return sub_25A8021EC(type metadata accessor for SearchReport);
}

uint64_t sub_25A8021EC(uint64_t (*a1)(void))
{
  uint64_t v2 = (unsigned char *)(v1 + *(int *)(a1(0) + 24));
  if (v2[8]) {
    return 0;
  }
  else {
    return *(void *)v2;
  }
}

uint64_t type metadata accessor for SearchReport(uint64_t a1)
{
  return sub_25A802F48(a1, (uint64_t *)&unk_26A465CA0);
}

uint64_t SearchReport.uniqueTokenCount.setter(uint64_t a1)
{
  return sub_25A802260(a1, type metadata accessor for SearchReport);
}

uint64_t sub_25A802260(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t result = a2(0);
  uint64_t v5 = v2 + *(int *)(result + 24);
  *(void *)uint64_t v5 = a1;
  *(unsigned char *)(v5 + 8) = 0;
  return result;
}

uint64_t (*SearchReport.uniqueTokenCount.modify(uint64_t a1))(uint64_t result)
{
  *(void *)(a1 + 8) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for SearchReport(0) + 24);
  *(_DWORD *)(a1 + 16) = v3;
  uint64_t v4 = (uint64_t *)(v1 + v3);
  if (*((unsigned char *)v4 + 8)) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *v4;
  }
  *(void *)a1 = v5;
  return sub_25A801558;
}

BOOL SearchReport.hasUniqueTokenCount.getter()
{
  return sub_25A80231C(type metadata accessor for SearchReport);
}

BOOL sub_25A80231C(uint64_t (*a1)(void))
{
  return (*(unsigned char *)(v1 + *(int *)(a1(0) + 24) + 8) & 1) == 0;
}

Swift::Void __swiftcall SearchReport.clearUniqueTokenCount()()
{
}

uint64_t sub_25A80236C(uint64_t (*a1)(void))
{
  uint64_t result = a1(0);
  uint64_t v3 = v1 + *(int *)(result + 24);
  *(void *)uint64_t v3 = 0;
  *(unsigned char *)(v3 + 8) = 1;
  return result;
}

uint64_t SearchReport.durationMillis.getter()
{
  return sub_25A8023BC(type metadata accessor for SearchReport);
}

uint64_t sub_25A8023BC(uint64_t (*a1)(void))
{
  uint64_t v2 = (unsigned char *)(v1 + *(int *)(a1(0) + 28));
  if (v2[8]) {
    return 0;
  }
  else {
    return *(void *)v2;
  }
}

uint64_t SearchReport.durationMillis.setter(uint64_t a1)
{
  return sub_25A802410(a1, type metadata accessor for SearchReport);
}

uint64_t sub_25A802410(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t result = a2(0);
  uint64_t v5 = v2 + *(int *)(result + 28);
  *(void *)uint64_t v5 = a1;
  *(unsigned char *)(v5 + 8) = 0;
  return result;
}

uint64_t (*SearchReport.durationMillis.modify(uint64_t a1))(uint64_t result)
{
  *(void *)(a1 + 8) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for SearchReport(0) + 28);
  *(_DWORD *)(a1 + 16) = v3;
  uint64_t v4 = (uint64_t *)(v1 + v3);
  if (*((unsigned char *)v4 + 8)) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *v4;
  }
  *(void *)a1 = v5;
  return sub_25A801558;
}

BOOL SearchReport.hasDurationMillis.getter()
{
  return sub_25A8024CC(type metadata accessor for SearchReport);
}

BOOL sub_25A8024CC(uint64_t (*a1)(void))
{
  return (*(unsigned char *)(v1 + *(int *)(a1(0) + 28) + 8) & 1) == 0;
}

Swift::Void __swiftcall SearchReport.clearDurationMillis()()
{
}

uint64_t sub_25A80251C(uint64_t (*a1)(void))
{
  uint64_t result = a1(0);
  uint64_t v3 = v1 + *(int *)(result + 28);
  *(void *)uint64_t v3 = 0;
  *(unsigned char *)(v3 + 8) = 1;
  return result;
}

uint64_t SearchReport.falsePositiveQueryCount.getter()
{
  return sub_25A80256C(type metadata accessor for SearchReport);
}

uint64_t sub_25A80256C(uint64_t (*a1)(void))
{
  uint64_t v2 = (unsigned char *)(v1 + *(int *)(a1(0) + 32));
  if (v2[8]) {
    return 0;
  }
  else {
    return *(void *)v2;
  }
}

uint64_t SearchReport.falsePositiveQueryCount.setter(uint64_t a1)
{
  return sub_25A8025C0(a1, type metadata accessor for SearchReport);
}

uint64_t sub_25A8025C0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t result = a2(0);
  uint64_t v5 = v2 + *(int *)(result + 32);
  *(void *)uint64_t v5 = a1;
  *(unsigned char *)(v5 + 8) = 0;
  return result;
}

uint64_t (*SearchReport.falsePositiveQueryCount.modify(uint64_t a1))(uint64_t result)
{
  *(void *)(a1 + 8) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for SearchReport(0) + 32);
  *(_DWORD *)(a1 + 16) = v3;
  uint64_t v4 = (uint64_t *)(v1 + v3);
  if (*((unsigned char *)v4 + 8)) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *v4;
  }
  *(void *)a1 = v5;
  return sub_25A801558;
}

uint64_t sub_25A802664(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 8) + *(int *)(result + 16);
  *(void *)uint64_t v1 = *(void *)result;
  *(unsigned char *)(v1 + 8) = 0;
  return result;
}

BOOL SearchReport.hasFalsePositiveQueryCount.getter()
{
  return sub_25A802694(type metadata accessor for SearchReport);
}

BOOL sub_25A802694(uint64_t (*a1)(void))
{
  return (*(unsigned char *)(v1 + *(int *)(a1(0) + 32) + 8) & 1) == 0;
}

Swift::Void __swiftcall SearchReport.clearFalsePositiveQueryCount()()
{
}

uint64_t sub_25A8026E4(uint64_t (*a1)(void))
{
  uint64_t result = a1(0);
  uint64_t v3 = v1 + *(int *)(result + 32);
  *(void *)uint64_t v3 = 0;
  *(unsigned char *)(v3 + 8) = 1;
  return result;
}

uint64_t SearchReport.falsePositiveQueryTokens.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SearchReport.falsePositiveQueryTokens.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*SearchReport.falsePositiveQueryTokens.modify())()
{
  return nullsub_1;
}

double SearchReport.falsePositiveQueryPercentage.getter()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for SearchReport(0) + 36);
  double result = *(double *)v1;
  if (*(unsigned char *)(v1 + 8)) {
    return 0.0;
  }
  return result;
}

uint64_t SearchReport.falsePositiveQueryPercentage.setter(double a1)
{
  uint64_t result = type metadata accessor for SearchReport(0);
  uint64_t v4 = v1 + *(int *)(result + 36);
  *(double *)uint64_t v4 = a1;
  *(unsigned char *)(v4 + 8) = 0;
  return result;
}

uint64_t (*SearchReport.falsePositiveQueryPercentage.modify(uint64_t a1))(uint64_t result)
{
  *(void *)(a1 + 8) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for SearchReport(0) + 36);
  *(_DWORD *)(a1 + 16) = v3;
  uint64_t v4 = v1 + v3;
  double v5 = *(double *)v4;
  if (*(unsigned char *)(v4 + 8)) {
    double v5 = 0.0;
  }
  *(double *)a1 = v5;
  return sub_25A801558;
}

BOOL SearchReport.hasFalsePositiveQueryPercentage.getter()
{
  return sub_25A802864(type metadata accessor for SearchReport);
}

BOOL sub_25A802864(uint64_t (*a1)(void))
{
  return (*(unsigned char *)(v1 + *(int *)(a1(0) + 36) + 8) & 1) == 0;
}

Swift::Void __swiftcall SearchReport.clearFalsePositiveQueryPercentage()()
{
}

uint64_t sub_25A8028B4(uint64_t (*a1)(void))
{
  uint64_t result = a1(0);
  uint64_t v3 = v1 + *(int *)(result + 36);
  *(void *)uint64_t v3 = 0;
  *(unsigned char *)(v3 + 8) = 1;
  return result;
}

double SearchReport.averageFalsePositiveResultPercentage.getter()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for SearchReport(0) + 40);
  double result = *(double *)v1;
  if (*(unsigned char *)(v1 + 8)) {
    return 0.0;
  }
  return result;
}

uint64_t SearchReport.averageFalsePositiveResultPercentage.setter(double a1)
{
  uint64_t result = type metadata accessor for SearchReport(0);
  uint64_t v4 = v1 + *(int *)(result + 40);
  *(double *)uint64_t v4 = a1;
  *(unsigned char *)(v4 + 8) = 0;
  return result;
}

uint64_t (*SearchReport.averageFalsePositiveResultPercentage.modify(uint64_t a1))(uint64_t result)
{
  *(void *)(a1 + 8) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for SearchReport(0) + 40);
  *(_DWORD *)(a1 + 16) = v3;
  uint64_t v4 = v1 + v3;
  double v5 = *(double *)v4;
  if (*(unsigned char *)(v4 + 8)) {
    double v5 = 0.0;
  }
  *(double *)a1 = v5;
  return sub_25A801558;
}

BOOL SearchReport.hasAverageFalsePositiveResultPercentage.getter()
{
  return sub_25A8029E0(type metadata accessor for SearchReport);
}

BOOL sub_25A8029E0(uint64_t (*a1)(void))
{
  return (*(unsigned char *)(v1 + *(int *)(a1(0) + 40) + 8) & 1) == 0;
}

Swift::Void __swiftcall SearchReport.clearAverageFalsePositiveResultPercentage()()
{
}

uint64_t sub_25A802A30(uint64_t (*a1)(void))
{
  uint64_t result = a1(0);
  uint64_t v3 = v1 + *(int *)(result + 40);
  *(void *)uint64_t v3 = 0;
  *(unsigned char *)(v3 + 8) = 1;
  return result;
}

double SearchReport.searchesPerSecond.getter()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for SearchReport(0) + 44);
  double result = *(double *)v1;
  if (*(unsigned char *)(v1 + 8)) {
    return 0.0;
  }
  return result;
}

uint64_t SearchReport.searchesPerSecond.setter(double a1)
{
  uint64_t result = type metadata accessor for SearchReport(0);
  uint64_t v4 = v1 + *(int *)(result + 44);
  *(double *)uint64_t v4 = a1;
  *(unsigned char *)(v4 + 8) = 0;
  return result;
}

uint64_t (*SearchReport.searchesPerSecond.modify(uint64_t a1))(uint64_t result)
{
  *(void *)(a1 + 8) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for SearchReport(0) + 44);
  *(_DWORD *)(a1 + 16) = v3;
  uint64_t v4 = v1 + v3;
  double v5 = *(double *)v4;
  if (*(unsigned char *)(v4 + 8)) {
    double v5 = 0.0;
  }
  *(double *)a1 = v5;
  return sub_25A801558;
}

BOOL SearchReport.hasSearchesPerSecond.getter()
{
  return sub_25A802B5C(type metadata accessor for SearchReport);
}

BOOL sub_25A802B5C(uint64_t (*a1)(void))
{
  return (*(unsigned char *)(v1 + *(int *)(a1(0) + 44) + 8) & 1) == 0;
}

Swift::Void __swiftcall SearchReport.clearSearchesPerSecond()()
{
}

uint64_t sub_25A802BAC(uint64_t (*a1)(void))
{
  uint64_t result = a1(0);
  uint64_t v3 = v1 + *(int *)(result + 44);
  *(void *)uint64_t v3 = 0;
  *(unsigned char *)(v3 + 8) = 1;
  return result;
}

uint64_t SearchReport.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25A802BFC(type metadata accessor for SearchReport, a1);
}

uint64_t sub_25A802BFC@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1(0) + 20);
  uint64_t v5 = sub_25A82CC10();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t SearchReport.unknownFields.setter(uint64_t a1)
{
  return sub_25A802C94(a1, type metadata accessor for SearchReport);
}

uint64_t sub_25A802C94(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = v2 + *(int *)(a2(0) + 20);
  uint64_t v5 = sub_25A82CC10();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*SearchReport.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t SearchReport.init()@<X0>(void *a1@<X8>)
{
  *a1 = MEMORY[0x263F8EE78];
  uint64_t v2 = (int *)type metadata accessor for SearchReport(0);
  uint64_t result = _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t v4 = (char *)a1 + v2[6];
  *(void *)uint64_t v4 = 0;
  v4[8] = 1;
  uint64_t v5 = (char *)a1 + v2[7];
  *(void *)uint64_t v5 = 0;
  v5[8] = 1;
  uint64_t v6 = (char *)a1 + v2[8];
  *(void *)uint64_t v6 = 0;
  v6[8] = 1;
  unint64_t v7 = (char *)a1 + v2[9];
  *(void *)unint64_t v7 = 0;
  v7[8] = 1;
  uint64_t v8 = (char *)a1 + v2[10];
  *(void *)uint64_t v8 = 0;
  v8[8] = 1;
  uint64_t v9 = (char *)a1 + v2[11];
  *(void *)uint64_t v9 = 0;
  v9[8] = 1;
  return result;
}

uint64_t BenchmarkReport.startMillis.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for BenchmarkReport(0) + 20));
  swift_beginAccess();
  if (*(unsigned char *)(v1 + 24)) {
    return 0;
  }
  else {
    return *(void *)(v1 + 16);
  }
}

uint64_t type metadata accessor for BenchmarkReport(uint64_t a1)
{
  return sub_25A802F48(a1, (uint64_t *)&unk_26A465CB0);
}

uint64_t BenchmarkReport.startMillis.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for BenchmarkReport(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for BenchmarkReport._StorageClass(0);
    swift_allocObject();
    uint64_t v4 = swift_retain();
    *(void *)(v1 + v3) = sub_25A80748C(v4);
    swift_release();
  }
  uint64_t v5 = *(void *)(v1 + v3);
  uint64_t result = swift_beginAccess();
  *(void *)(v5 + 16) = a1;
  *(unsigned char *)(v5 + 24) = 0;
  return result;
}

uint64_t type metadata accessor for BenchmarkReport._StorageClass(uint64_t a1)
{
  return sub_25A802F48(a1, (uint64_t *)&unk_26A465CC0);
}

uint64_t sub_25A802F48(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void (*BenchmarkReport.startMillis.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x60uLL);
  *a1 = v3;
  v3[10] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for BenchmarkReport(0) + 20);
  *((_DWORD *)v3 + 22) = v4;
  uint64_t v5 = *(void *)(v1 + v4);
  swift_beginAccess();
  uint64_t v6 = *(void *)(v5 + 16);
  if (*(unsigned char *)(v5 + 24)) {
    uint64_t v6 = 0;
  }
  v3[9] = v6;
  return sub_25A803014;
}

void sub_25A803014(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(*a1 + 72);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (a2)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_3:
    uint64_t v6 = *(int *)(v3 + 88);
    uint64_t v7 = *(void *)(v3 + 80);
    type metadata accessor for BenchmarkReport._StorageClass(0);
    swift_allocObject();
    uint64_t v8 = swift_retain();
    *(void *)(v7 + v6) = sub_25A80748C(v8);
    swift_release();
  }
LABEL_4:
  uint64_t v9 = *(void *)(*(void *)(v3 + 80) + *(int *)(v3 + 88));
  swift_beginAccess();
  *(void *)(v9 + 16) = v4;
  *(unsigned char *)(v9 + 24) = 0;
  free((void *)v3);
}

BOOL BenchmarkReport.hasStartMillis.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for BenchmarkReport(0) + 20));
  swift_beginAccess();
  return (*(unsigned char *)(v1 + 24) & 1) == 0;
}

Swift::Void __swiftcall BenchmarkReport.clearStartMillis()()
{
  uint64_t v1 = *(int *)(type metadata accessor for BenchmarkReport(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for BenchmarkReport._StorageClass(0);
    swift_allocObject();
    uint64_t v2 = swift_retain();
    *(void *)(v0 + v1) = sub_25A80748C(v2);
    swift_release();
  }
  uint64_t v3 = *(void *)(v0 + v1);
  swift_beginAccess();
  *(void *)(v3 + 16) = 0;
  *(unsigned char *)(v3 + 24) = 1;
}

uint64_t BenchmarkReport.startDate.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for BenchmarkReport(0) + 20));
  swift_beginAccess();
  if (*(void *)(v1 + 40)) {
    uint64_t v2 = *(void *)(v1 + 32);
  }
  else {
    uint64_t v2 = 0;
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t BenchmarkReport.startDate.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(int *)(type metadata accessor for BenchmarkReport(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for BenchmarkReport._StorageClass(0);
    swift_allocObject();
    uint64_t v6 = swift_retain();
    *(void *)(v2 + v5) = sub_25A80748C(v6);
    swift_release();
  }
  uint64_t v7 = *(void *)(v2 + v5);
  swift_beginAccess();
  *(void *)(v7 + 32) = a1;
  *(void *)(v7 + 40) = a2;
  return swift_bridgeObjectRelease();
}

void (*BenchmarkReport.startDate.modify(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x68uLL);
  *a1 = v3;
  v3[11] = v1;
  uint64_t v4 = *(int *)(type metadata accessor for BenchmarkReport(0) + 20);
  *((_DWORD *)v3 + 24) = v4;
  uint64_t v5 = *(void *)(v1 + v4);
  swift_beginAccess();
  if (*(void *)(v5 + 40))
  {
    uint64_t v6 = *(void *)(v5 + 32);
    unint64_t v7 = *(void *)(v5 + 40);
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  v3[9] = v6;
  v3[10] = v7;
  swift_bridgeObjectRetain();
  return sub_25A8033E0;
}

void sub_25A8033E0(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*a1 + 72);
  uint64_t v4 = *(void *)(*a1 + 80);
  if (a2)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v5 = *(int *)(v2 + 96);
      uint64_t v6 = *(void *)(v2 + 88);
      type metadata accessor for BenchmarkReport._StorageClass(0);
      swift_allocObject();
      uint64_t v7 = swift_retain();
      *(void *)(v6 + v5) = sub_25A80748C(v7);
      swift_release();
    }
    uint64_t v8 = *(void *)(*(void *)(v2 + 88) + *(int *)(v2 + 96));
    swift_beginAccess();
    *(void *)(v8 + 32) = v3;
    *(void *)(v8 + 40) = v4;
    swift_bridgeObjectRelease();
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      uint64_t v9 = *(int *)(v2 + 96);
      uint64_t v10 = *(void *)(v2 + 88);
      type metadata accessor for BenchmarkReport._StorageClass(0);
      swift_allocObject();
      uint64_t v11 = swift_retain();
      *(void *)(v10 + v9) = sub_25A80748C(v11);
      swift_release();
    }
    uint64_t v12 = *(void *)(*(void *)(v2 + 88) + *(int *)(v2 + 96));
    swift_beginAccess();
    *(void *)(v12 + 32) = v3;
    *(void *)(v12 + 40) = v4;
  }
  swift_bridgeObjectRelease();
  free((void *)v2);
}

BOOL BenchmarkReport.hasStartDate.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for BenchmarkReport(0) + 20));
  swift_beginAccess();
  return *(void *)(v1 + 40) != 0;
}

Swift::Void __swiftcall BenchmarkReport.clearStartDate()()
{
  uint64_t v1 = *(int *)(type metadata accessor for BenchmarkReport(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for BenchmarkReport._StorageClass(0);
    swift_allocObject();
    uint64_t v2 = swift_retain();
    *(void *)(v0 + v1) = sub_25A80748C(v2);
    swift_release();
  }
  uint64_t v3 = *(void *)(v0 + v1);
  swift_beginAccess();
  *(void *)(v3 + 32) = 0;
  *(void *)(v3 + 40) = 0;
  swift_bridgeObjectRelease();
}

uint64_t BenchmarkReport.config.getter@<X0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465BA8);
  MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void *)(v1 + *(int *)(type metadata accessor for BenchmarkReport(0) + 20))
     + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__config;
  swift_beginAccess();
  sub_25A8079B4(v5, (uint64_t)v4, &qword_26A465BA8);
  uint64_t v6 = type metadata accessor for BenchmarkConfig(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v4, 1, v6) != 1) {
    return sub_25A807884((uint64_t)v4, a1, type metadata accessor for BenchmarkConfig);
  }
  _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t v7 = (void *)(a1 + *(int *)(v6 + 20));
  *uint64_t v7 = 0;
  v7[1] = 0;
  uint64_t v8 = (void *)(a1 + *(int *)(v6 + 24));
  *uint64_t v8 = 0;
  v8[1] = 0;
  return sub_25A80CCC8((uint64_t)v4, &qword_26A465BA8);
}

uint64_t BenchmarkReport.config.setter(uint64_t a1)
{
  return sub_25A80445C(a1, &qword_26A465BA8, type metadata accessor for BenchmarkConfig, type metadata accessor for BenchmarkConfig, &OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__config);
}

void (*BenchmarkReport.config.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[3] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465BA8);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[4] = v5;
  uint64_t v6 = type metadata accessor for BenchmarkConfig(0);
  uint64_t v7 = *(void *)(v6 - 8);
  size_t v8 = *(void *)(v7 + 64);
  v3[5] = malloc(v8);
  uint64_t v9 = (char *)malloc(v8);
  v3[6] = v9;
  uint64_t v10 = *(void *)(v1 + *(int *)(type metadata accessor for BenchmarkReport(0) + 20))
      + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__config;
  swift_beginAccess();
  sub_25A8079B4(v10, (uint64_t)v5, &qword_26A465BA8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    uint64_t v11 = &v9[*(int *)(v6 + 20)];
    *(void *)uint64_t v11 = 0;
    *((void *)v11 + 1) = 0;
    uint64_t v12 = &v9[*(int *)(v6 + 24)];
    *(void *)uint64_t v12 = 0;
    *((void *)v12 + 1) = 0;
    sub_25A80CCC8((uint64_t)v5, &qword_26A465BA8);
  }
  else
  {
    sub_25A807884((uint64_t)v5, (uint64_t)v9, type metadata accessor for BenchmarkConfig);
  }
  return sub_25A80399C;
}

void sub_25A80399C(uint64_t a1, char a2)
{
}

BOOL BenchmarkReport.hasConfig.getter()
{
  return sub_25A803FC4(&qword_26A465BA8, &OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__config, type metadata accessor for BenchmarkConfig);
}

Swift::Void __swiftcall BenchmarkReport.clearConfig()()
{
}

uint64_t BenchmarkReport.indexReport.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465BB8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(v1 + *(int *)(type metadata accessor for BenchmarkReport(0) + 20))
     + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__indexReport;
  swift_beginAccess();
  sub_25A8079B4(v6, (uint64_t)v5, &qword_26A465BB8);
  uint64_t v7 = (int *)type metadata accessor for IndexReport(0);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(*((void *)v7 - 1) + 48))(v5, 1, v7) != 1) {
    return sub_25A807884((uint64_t)v5, (uint64_t)a1, type metadata accessor for IndexReport);
  }
  *a1 = MEMORY[0x263F8EE78];
  _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  size_t v8 = (char *)a1 + v7[6];
  *(void *)size_t v8 = 0;
  v8[8] = 1;
  uint64_t v9 = (char *)a1 + v7[7];
  *(void *)uint64_t v9 = 0;
  v9[8] = 1;
  uint64_t v10 = (char *)a1 + v7[8];
  *(void *)uint64_t v10 = 0;
  v10[8] = 1;
  uint64_t v11 = (char *)a1 + v7[9];
  *(void *)uint64_t v11 = 0;
  v11[8] = 1;
  uint64_t v12 = (char *)a1 + v7[10];
  *(void *)uint64_t v12 = 0;
  v12[8] = 1;
  uint64_t v13 = (char *)a1 + v7[11];
  *(void *)uint64_t v13 = 0;
  v13[8] = 1;
  uint64_t v14 = (char *)a1 + v7[12];
  *(void *)uint64_t v14 = 0;
  v14[8] = 1;
  uint64_t v15 = (char *)a1 + v7[13];
  *(void *)uint64_t v15 = 0;
  v15[8] = 1;
  uint64_t v16 = (char *)a1 + v7[14];
  *(void *)uint64_t v16 = 0;
  v16[8] = 1;
  uint64_t v17 = (char *)a1 + v7[15];
  *(void *)uint64_t v17 = 0;
  v17[8] = 1;
  uint64_t v18 = (char *)a1 + v7[16];
  *(void *)uint64_t v18 = 0;
  v18[8] = 1;
  return sub_25A80CCC8((uint64_t)v5, &qword_26A465BB8);
}

uint64_t BenchmarkReport.indexReport.setter(uint64_t a1)
{
  return sub_25A80445C(a1, &qword_26A465BB8, type metadata accessor for IndexReport, type metadata accessor for IndexReport, &OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__indexReport);
}

void (*BenchmarkReport.indexReport.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[3] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465BB8);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[4] = v5;
  uint64_t v6 = (int *)type metadata accessor for IndexReport(0);
  uint64_t v7 = *((void *)v6 - 1);
  size_t v8 = *(void *)(v7 + 64);
  v3[5] = malloc(v8);
  uint64_t v9 = malloc(v8);
  v3[6] = v9;
  uint64_t v10 = *(void *)(v1 + *(int *)(type metadata accessor for BenchmarkReport(0) + 20))
      + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__indexReport;
  swift_beginAccess();
  sub_25A8079B4(v10, (uint64_t)v5, &qword_26A465BB8);
  if ((*(unsigned int (**)(void *, uint64_t, int *))(v7 + 48))(v5, 1, v6) == 1)
  {
    *uint64_t v9 = MEMORY[0x263F8EE78];
    _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    uint64_t v11 = (char *)v9 + v6[6];
    *(void *)uint64_t v11 = 0;
    v11[8] = 1;
    uint64_t v12 = (char *)v9 + v6[7];
    *(void *)uint64_t v12 = 0;
    v12[8] = 1;
    uint64_t v13 = (char *)v9 + v6[8];
    *(void *)uint64_t v13 = 0;
    v13[8] = 1;
    uint64_t v14 = (char *)v9 + v6[9];
    *(void *)uint64_t v14 = 0;
    v14[8] = 1;
    uint64_t v15 = (char *)v9 + v6[10];
    *(void *)uint64_t v15 = 0;
    v15[8] = 1;
    uint64_t v16 = (char *)v9 + v6[11];
    *(void *)uint64_t v16 = 0;
    v16[8] = 1;
    uint64_t v17 = (char *)v9 + v6[12];
    *(void *)uint64_t v17 = 0;
    v17[8] = 1;
    uint64_t v18 = (char *)v9 + v6[13];
    *(void *)uint64_t v18 = 0;
    v18[8] = 1;
    uint64_t v19 = (char *)v9 + v6[14];
    *(void *)uint64_t v19 = 0;
    v19[8] = 1;
    uint64_t v20 = (char *)v9 + v6[15];
    *(void *)uint64_t v20 = 0;
    v20[8] = 1;
    uint64_t v21 = (char *)v9 + v6[16];
    *(void *)uint64_t v21 = 0;
    v21[8] = 1;
    sub_25A80CCC8((uint64_t)v5, &qword_26A465BB8);
  }
  else
  {
    sub_25A807884((uint64_t)v5, (uint64_t)v9, type metadata accessor for IndexReport);
  }
  return sub_25A803EC0;
}

void sub_25A803EC0(uint64_t a1, char a2)
{
}

void sub_25A803EEC(uint64_t a1, char a2, void (*a3)(void *), uint64_t (*a4)(void))
{
  uint64_t v5 = *(void **)a1;
  uint64_t v6 = *(void **)(*(void *)a1 + 40);
  uint64_t v7 = *(void **)(*(void *)a1 + 48);
  size_t v8 = *(void **)(*(void *)a1 + 32);
  if (a2)
  {
    sub_25A8078EC(*(void *)(*(void *)a1 + 48), (uint64_t)v6, a4);
    a3(v6);
    sub_25A807954((uint64_t)v7, a4);
  }
  else
  {
    a3(*(void **)(*(void *)a1 + 48));
  }
  free(v7);
  free(v6);
  free(v8);
  free(v5);
}

BOOL BenchmarkReport.hasIndexReport.getter()
{
  return sub_25A803FC4(&qword_26A465BB8, &OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__indexReport, type metadata accessor for IndexReport);
}

BOOL sub_25A803FC4(uint64_t *a1, void *a2, uint64_t (*a3)(void))
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(v3 + *(int *)(type metadata accessor for BenchmarkReport(0) + 20)) + *a2;
  swift_beginAccess();
  sub_25A8079B4(v10, (uint64_t)v9, a1);
  uint64_t v11 = a3(0);
  BOOL v12 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v9, 1, v11) != 1;
  sub_25A80CCC8((uint64_t)v9, a1);
  return v12;
}

Swift::Void __swiftcall BenchmarkReport.clearIndexReport()()
{
}

uint64_t sub_25A804100(uint64_t *a1, uint64_t (*a2)(void), void *a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(int *)(type metadata accessor for BenchmarkReport(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for BenchmarkReport._StorageClass(0);
    swift_allocObject();
    uint64_t v11 = swift_retain();
    *(void *)(v3 + v10) = sub_25A80748C(v11);
    swift_release();
  }
  uint64_t v12 = *(void *)(v3 + v10);
  uint64_t v13 = a2(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v9, 1, 1, v13);
  uint64_t v14 = v12 + *a3;
  swift_beginAccess();
  swift_retain();
  sub_25A807A7C((uint64_t)v9, v14, a1);
  swift_endAccess();
  return swift_release();
}

uint64_t BenchmarkReport.searchReport.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465BC8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void *)(v1 + *(int *)(type metadata accessor for BenchmarkReport(0) + 20))
     + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__searchReport;
  swift_beginAccess();
  sub_25A8079B4(v6, (uint64_t)v5, &qword_26A465BC8);
  uint64_t v7 = (int *)type metadata accessor for SearchReport(0);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(*((void *)v7 - 1) + 48))(v5, 1, v7) != 1) {
    return sub_25A807884((uint64_t)v5, (uint64_t)a1, type metadata accessor for SearchReport);
  }
  *a1 = MEMORY[0x263F8EE78];
  _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t v8 = (char *)a1 + v7[6];
  *(void *)uint64_t v8 = 0;
  v8[8] = 1;
  uint64_t v9 = (char *)a1 + v7[7];
  *(void *)uint64_t v9 = 0;
  v9[8] = 1;
  uint64_t v10 = (char *)a1 + v7[8];
  *(void *)uint64_t v10 = 0;
  v10[8] = 1;
  uint64_t v11 = (char *)a1 + v7[9];
  *(void *)uint64_t v11 = 0;
  v11[8] = 1;
  uint64_t v12 = (char *)a1 + v7[10];
  *(void *)uint64_t v12 = 0;
  v12[8] = 1;
  uint64_t v13 = (char *)a1 + v7[11];
  *(void *)uint64_t v13 = 0;
  v13[8] = 1;
  return sub_25A80CCC8((uint64_t)v5, &qword_26A465BC8);
}

uint64_t BenchmarkReport.searchReport.setter(uint64_t a1)
{
  return sub_25A80445C(a1, &qword_26A465BC8, type metadata accessor for SearchReport, type metadata accessor for SearchReport, &OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__searchReport);
}

uint64_t sub_25A80445C(uint64_t a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t (*a4)(void), void *a5)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v22 - v14;
  uint64_t v16 = *(int *)(type metadata accessor for BenchmarkReport(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for BenchmarkReport._StorageClass(0);
    swift_allocObject();
    unint64_t v22 = v13;
    uint64_t v17 = swift_retain();
    uint64_t v13 = v22;
    *(void *)(v5 + v16) = sub_25A80748C(v17);
    swift_release();
  }
  uint64_t v18 = *(void *)(v5 + v16);
  sub_25A807884(a1, (uint64_t)v15, a3);
  uint64_t v19 = a4(0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v15, 0, 1, v19);
  sub_25A807A18((uint64_t)v15, (uint64_t)v13, a2);
  uint64_t v20 = v18 + *a5;
  swift_beginAccess();
  swift_retain();
  sub_25A807A7C((uint64_t)v13, v20, a2);
  swift_endAccess();
  return swift_release();
}

void (*BenchmarkReport.searchReport.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  v3[3] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465BC8);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[4] = v5;
  uint64_t v6 = (int *)type metadata accessor for SearchReport(0);
  uint64_t v7 = *((void *)v6 - 1);
  size_t v8 = *(void *)(v7 + 64);
  v3[5] = malloc(v8);
  uint64_t v9 = malloc(v8);
  v3[6] = v9;
  uint64_t v10 = *(void *)(v1 + *(int *)(type metadata accessor for BenchmarkReport(0) + 20))
      + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__searchReport;
  swift_beginAccess();
  sub_25A8079B4(v10, (uint64_t)v5, &qword_26A465BC8);
  if ((*(unsigned int (**)(void *, uint64_t, int *))(v7 + 48))(v5, 1, v6) == 1)
  {
    *uint64_t v9 = MEMORY[0x263F8EE78];
    _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    uint64_t v11 = (char *)v9 + v6[6];
    *(void *)uint64_t v11 = 0;
    v11[8] = 1;
    uint64_t v12 = (char *)v9 + v6[7];
    *(void *)uint64_t v12 = 0;
    v12[8] = 1;
    uint64_t v13 = (char *)v9 + v6[8];
    *(void *)uint64_t v13 = 0;
    v13[8] = 1;
    uint64_t v14 = (char *)v9 + v6[9];
    *(void *)uint64_t v14 = 0;
    v14[8] = 1;
    uint64_t v15 = (char *)v9 + v6[10];
    *(void *)uint64_t v15 = 0;
    v15[8] = 1;
    uint64_t v16 = (char *)v9 + v6[11];
    *(void *)uint64_t v16 = 0;
    v16[8] = 1;
    sub_25A80CCC8((uint64_t)v5, &qword_26A465BC8);
  }
  else
  {
    sub_25A807884((uint64_t)v5, (uint64_t)v9, type metadata accessor for SearchReport);
  }
  return sub_25A804864;
}

void sub_25A804864(uint64_t a1, char a2)
{
}

BOOL BenchmarkReport.hasSearchReport.getter()
{
  return sub_25A803FC4(&qword_26A465BC8, &OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__searchReport, type metadata accessor for SearchReport);
}

Swift::Void __swiftcall BenchmarkReport.clearSearchReport()()
{
}

uint64_t _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvg_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_25A82CC10();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvs_0(uint64_t a1)
{
  uint64_t v3 = sub_25A82CC10();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);
  return v4(v1, a1, v3);
}

uint64_t (*BenchmarkReport.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t BenchmarkReport.init()@<X0>(uint64_t a1@<X8>)
{
  _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t v2 = *(int *)(type metadata accessor for BenchmarkReport(0) + 20);
  if (qword_26A465AE0 != -1) {
    swift_once();
  }
  *(void *)(a1 + v2) = qword_26A465BA0;
  return swift_retain();
}

uint64_t sub_25A804A54()
{
  uint64_t v0 = sub_25A82CD90();
  __swift_allocate_value_buffer(v0, static IndexableFileType._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static IndexableFileType._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465D30);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A465D38) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_25A82D9E0;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 0;
  *(void *)unint64_t v6 = "UNKNOWN";
  *(void *)(v6 + 8) = 7;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_25A82CD70();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 1;
  *(void *)uint64_t v10 = "TXT";
  *((void *)v10 + 1) = 3;
  v10[16] = 2;
  v9();
  uint64_t v11 = (uint64_t)v5 + 2 * v2 + v1[14];
  *(void *)((char *)v5 + 2 * v2) = 2;
  *(void *)uint64_t v11 = "PDF";
  *(void *)(v11 + 8) = 3;
  *(unsigned char *)(v11 + 16) = 2;
  v9();
  return sub_25A82CD80();
}

uint64_t IndexableFileType._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_25A80724C(&qword_26A465AB8, (uint64_t)static IndexableFileType._protobuf_nameMap);
}

uint64_t static IndexableFileType._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25A8072C4(&qword_26A465AB8, (uint64_t)static IndexableFileType._protobuf_nameMap, a1);
}

uint64_t sub_25A804C98@<X0>(uint64_t a1@<X8>)
{
  return sub_25A8097A0(&qword_26A465AB8, (uint64_t)static IndexableFileType._protobuf_nameMap, a1);
}

void *BenchmarkConfig.protoMessageName.unsafeMutableAddressor()
{
  return &static BenchmarkConfig.protoMessageName;
}

uint64_t static BenchmarkConfig.protoMessageName.getter()
{
  return 0x72616D68636E6542;
}

uint64_t sub_25A804CEC()
{
  uint64_t v0 = sub_25A82CD90();
  __swift_allocate_value_buffer(v0, static BenchmarkConfig._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static BenchmarkConfig._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465D30);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A465D38) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_25A82D9F0;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "indexer";
  *(void *)(v6 + 8) = 7;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_25A82CD70();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "dataSet";
  *((void *)v10 + 1) = 7;
  v10[16] = 2;
  v9();
  return sub_25A82CD80();
}

uint64_t BenchmarkConfig._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_25A80724C(&qword_26A465AC0, (uint64_t)static BenchmarkConfig._protobuf_nameMap);
}

uint64_t static BenchmarkConfig._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25A8072C4(&qword_26A465AC0, (uint64_t)static BenchmarkConfig._protobuf_nameMap, a1);
}

uint64_t BenchmarkConfig.decodeMessage<A>(decoder:)()
{
  while (1)
  {
    uint64_t result = sub_25A82CC50();
    if (v0 || (v2 & 1) != 0) {
      break;
    }
    if (result == 2 || result == 1)
    {
      type metadata accessor for BenchmarkConfig(0);
      sub_25A82CCA0();
    }
    uint64_t v0 = 0;
  }
  return result;
}

uint64_t BenchmarkConfig.traverse<A>(visitor:)()
{
  uint64_t result = sub_25A80500C(v0);
  if (!v1)
  {
    sub_25A805084(v0);
    return sub_25A82CBF0();
  }
  return result;
}

uint64_t sub_25A80500C(uint64_t a1)
{
  uint64_t result = type metadata accessor for BenchmarkConfig(0);
  if (*(void *)(a1 + *(int *)(result + 20) + 8)) {
    return sub_25A82CD40();
  }
  return result;
}

uint64_t sub_25A805084(uint64_t a1)
{
  uint64_t result = type metadata accessor for BenchmarkConfig(0);
  if (*(void *)(a1 + *(int *)(result + 24) + 8)) {
    return sub_25A82CD40();
  }
  return result;
}

uint64_t BenchmarkConfig.hashValue.getter()
{
  return sub_25A8095AC((void (*)(void))type metadata accessor for BenchmarkConfig, &qword_26A465BD8, (void (*)(uint64_t))type metadata accessor for BenchmarkConfig);
}

uint64_t sub_25A805148@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t v5 = *(int *)(a1 + 24);
  unint64_t v6 = (void *)(a2 + *(int *)(a1 + 20));
  *unint64_t v6 = 0;
  v6[1] = 0;
  uint64_t v7 = (void *)(a2 + v5);
  *uint64_t v7 = 0;
  v7[1] = 0;
  return result;
}

uint64_t sub_25A805184()
{
  return 0x72616D68636E6542;
}

uint64_t (*sub_25A8051B4())()
{
  return nullsub_1;
}

uint64_t sub_25A8051D4()
{
  return BenchmarkConfig.decodeMessage<A>(decoder:)();
}

uint64_t sub_25A8051EC()
{
  return BenchmarkConfig.traverse<A>(visitor:)();
}

uint64_t sub_25A805208(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A80A1E0(&qword_26A465D00, (void (*)(uint64_t))type metadata accessor for BenchmarkConfig);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_25A805288@<X0>(uint64_t a1@<X8>)
{
  return sub_25A8097A0(&qword_26A465AC0, (uint64_t)static BenchmarkConfig._protobuf_nameMap, a1);
}

uint64_t sub_25A8052AC(uint64_t a1)
{
  uint64_t v2 = sub_25A80A1E0(&qword_26A465C28, (void (*)(uint64_t))type metadata accessor for BenchmarkConfig);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_25A80531C()
{
  sub_25A80A1E0(&qword_26A465C28, (void (*)(uint64_t))type metadata accessor for BenchmarkConfig);
  return sub_25A82CCF0();
}

const char *IndexReport.protoMessageName.unsafeMutableAddressor()
{
  return "IndexReport";
}

uint64_t static IndexReport.protoMessageName.getter()
{
  return 0x7065527865646E49;
}

uint64_t sub_25A8053CC()
{
  uint64_t v0 = sub_25A82CD90();
  __swift_allocate_value_buffer(v0, static IndexReport._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static IndexReport._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465D30);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A465D38) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_25A82DA00;
  unint64_t v4 = v30 + v3;
  unint64_t v5 = v30 + v3 + v1[14];
  *(void *)(v30 + v3) = 1;
  *(void *)unint64_t v5 = "totalDocuments";
  *(void *)(v5 + 8) = 14;
  *(unsigned char *)(v5 + 16) = 2;
  uint64_t v6 = *MEMORY[0x263F50718];
  uint64_t v7 = sub_25A82CD70();
  uint64_t v8 = *(void (**)(void))(*(void *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v5, v6, v7);
  unint64_t v9 = v30 + v3 + v2 + v1[14];
  *(void *)(v4 + v2) = 2;
  *(void *)unint64_t v9 = "totalDocumentBytes";
  *(void *)(v9 + 8) = 18;
  *(unsigned char *)(v9 + 16) = 2;
  v8();
  uint64_t v10 = (void *)(v30 + v3 + 2 * v2);
  uint64_t v11 = (char *)v10 + v1[14];
  *uint64_t v10 = 3;
  *(void *)uint64_t v11 = "totalDocumentTokens";
  *((void *)v11 + 1) = 19;
  v11[16] = 2;
  v8();
  uint64_t v12 = (void *)(v30 + v3 + 3 * v2);
  uint64_t v13 = (char *)v12 + v1[14];
  *uint64_t v12 = 4;
  *(void *)uint64_t v13 = "totalIndexSizeBytes";
  *((void *)v13 + 1) = 19;
  unsigned char v13[16] = 2;
  v8();
  uint64_t v14 = (void *)(v30 + v3 + 4 * v2);
  uint64_t v15 = (char *)v14 + v1[14];
  *uint64_t v14 = 5;
  *(void *)uint64_t v15 = "totalIndexingMillis";
  *((void *)v15 + 1) = 19;
  v15[16] = 2;
  v8();
  uint64_t v16 = (void *)(v30 + v3 + 5 * v2);
  uint64_t v17 = (char *)v16 + v1[14];
  *uint64_t v16 = 6;
  *(void *)uint64_t v17 = "totalUniqueTokens";
  *((void *)v17 + 1) = 17;
  v17[16] = 2;
  v8();
  uint64_t v18 = (void *)(v30 + v3 + 6 * v2);
  uint64_t v19 = (char *)v18 + v1[14];
  *uint64_t v18 = 7;
  *(void *)uint64_t v19 = "indexedTopLevelDirs";
  *((void *)v19 + 1) = 19;
  v19[16] = 2;
  v8();
  uint64_t v20 = (void *)(v30 + v3 + 7 * v2);
  uint64_t v21 = (char *)v20 + v1[14];
  void *v20 = 8;
  *(void *)uint64_t v21 = "documentsPerSecond";
  *((void *)v21 + 1) = 18;
  v21[16] = 2;
  v8();
  uint64_t v22 = v30 + v3 + 8 * v2 + v1[14];
  *(void *)(v4 + 8 * v2) = 9;
  *(void *)uint64_t v22 = "tokensPerSecond";
  *(void *)(v22 + 8) = 15;
  *(unsigned char *)(v22 + 16) = 2;
  v8();
  uint64_t v23 = (void *)(v30 + v3 + 9 * v2);
  uint64_t v24 = (char *)v23 + v1[14];
  *uint64_t v23 = 10;
  *(void *)uint64_t v24 = "indexBytesToDocsBytesRatio";
  *((void *)v24 + 1) = 26;
  v24[16] = 2;
  v8();
  uint64_t v25 = (void *)(v30 + v3 + 10 * v2);
  uint64_t v26 = (char *)v25 + v1[14];
  *uint64_t v25 = 11;
  *(void *)uint64_t v26 = "averageDocumentBytes";
  *((void *)v26 + 1) = 20;
  v26[16] = 2;
  v8();
  uint64_t v27 = (void *)(v30 + v3 + 11 * v2);
  uint64_t v28 = (char *)v27 + v1[14];
  void *v27 = 12;
  *(void *)uint64_t v28 = "averageIndexBytes";
  *((void *)v28 + 1) = 17;
  v28[16] = 2;
  v8();
  return sub_25A82CD80();
}

uint64_t IndexReport._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_25A80724C(&qword_26A465AC8, (uint64_t)static IndexReport._protobuf_nameMap);
}

uint64_t static IndexReport._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25A8072C4(&qword_26A465AC8, (uint64_t)static IndexReport._protobuf_nameMap, a1);
}

uint64_t IndexReport.decodeMessage<A>(decoder:)()
{
  while (1)
  {
    uint64_t result = sub_25A82CC50();
    uint64_t v3 = v0;
    if (v0 || (v2 & 1) != 0) {
      return result;
    }
    switch(result)
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 11:
      case 12:
        type metadata accessor for IndexReport(0);
        sub_25A82CC70();
        goto LABEL_7;
      case 7:
        sub_25A82CC80();
        goto LABEL_7;
      case 8:
      case 9:
      case 10:
        type metadata accessor for IndexReport(0);
        sub_25A82CC90();
LABEL_7:
        uint64_t v3 = 0;
        break;
      default:
        break;
    }
    uint64_t v0 = v3;
  }
}

uint64_t IndexReport.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  uint64_t result = sub_25A8068FC(v5, a1, a2, a3, type metadata accessor for IndexReport);
  if (!v4)
  {
    sub_25A806978(v5, a1, a2, a3, type metadata accessor for IndexReport);
    sub_25A8069F4(v5, a1, a2, a3, type metadata accessor for IndexReport);
    sub_25A805BBC(v5);
    sub_25A805C34(v5);
    sub_25A805CAC(v5);
    if (*(void *)(*(void *)v5 + 16)) {
      sub_25A82CD20();
    }
    sub_25A805D24(v5);
    sub_25A805D9C(v5);
    sub_25A805E14(v5);
    sub_25A805E8C(v5);
    sub_25A805F04(v5);
    type metadata accessor for IndexReport(0);
    return sub_25A82CBF0();
  }
  return result;
}

uint64_t sub_25A805BBC(uint64_t a1)
{
  uint64_t result = type metadata accessor for IndexReport(0);
  if ((*(unsigned char *)(a1 + *(int *)(result + 36) + 8) & 1) == 0) {
    return sub_25A82CD10();
  }
  return result;
}

uint64_t sub_25A805C34(uint64_t a1)
{
  uint64_t result = type metadata accessor for IndexReport(0);
  if ((*(unsigned char *)(a1 + *(int *)(result + 40) + 8) & 1) == 0) {
    return sub_25A82CD10();
  }
  return result;
}

uint64_t sub_25A805CAC(uint64_t a1)
{
  uint64_t result = type metadata accessor for IndexReport(0);
  if ((*(unsigned char *)(a1 + *(int *)(result + 44) + 8) & 1) == 0) {
    return sub_25A82CD10();
  }
  return result;
}

uint64_t sub_25A805D24(uint64_t a1)
{
  uint64_t result = type metadata accessor for IndexReport(0);
  if ((*(unsigned char *)(a1 + *(int *)(result + 48) + 8) & 1) == 0) {
    return sub_25A82CD30();
  }
  return result;
}

uint64_t sub_25A805D9C(uint64_t a1)
{
  uint64_t result = type metadata accessor for IndexReport(0);
  if ((*(unsigned char *)(a1 + *(int *)(result + 52) + 8) & 1) == 0) {
    return sub_25A82CD30();
  }
  return result;
}

uint64_t sub_25A805E14(uint64_t a1)
{
  uint64_t result = type metadata accessor for IndexReport(0);
  if ((*(unsigned char *)(a1 + *(int *)(result + 56) + 8) & 1) == 0) {
    return sub_25A82CD30();
  }
  return result;
}

uint64_t sub_25A805E8C(uint64_t a1)
{
  uint64_t result = type metadata accessor for IndexReport(0);
  if ((*(unsigned char *)(a1 + *(int *)(result + 60) + 8) & 1) == 0) {
    return sub_25A82CD10();
  }
  return result;
}

uint64_t sub_25A805F04(uint64_t a1)
{
  uint64_t result = type metadata accessor for IndexReport(0);
  if ((*(unsigned char *)(a1 + *(int *)(result + 64) + 8) & 1) == 0) {
    return sub_25A82CD10();
  }
  return result;
}

uint64_t IndexReport.hashValue.getter()
{
  return sub_25A8095AC((void (*)(void))type metadata accessor for IndexReport, &qword_26A465BE0, (void (*)(uint64_t))type metadata accessor for IndexReport);
}

uint64_t sub_25A805FC8@<X0>(int *a1@<X0>, void *a2@<X8>)
{
  *a2 = MEMORY[0x263F8EE78];
  uint64_t result = _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t v5 = a1[7];
  uint64_t v6 = (char *)a2 + a1[6];
  *(void *)uint64_t v6 = 0;
  v6[8] = 1;
  uint64_t v7 = (char *)a2 + v5;
  *(void *)uint64_t v7 = 0;
  v7[8] = 1;
  uint64_t v8 = a1[9];
  unint64_t v9 = (char *)a2 + a1[8];
  *(void *)unint64_t v9 = 0;
  v9[8] = 1;
  uint64_t v10 = (char *)a2 + v8;
  *(void *)uint64_t v10 = 0;
  v10[8] = 1;
  uint64_t v11 = a1[11];
  uint64_t v12 = (char *)a2 + a1[10];
  *(void *)uint64_t v12 = 0;
  v12[8] = 1;
  uint64_t v13 = (char *)a2 + v11;
  *(void *)uint64_t v13 = 0;
  v13[8] = 1;
  uint64_t v14 = a1[13];
  uint64_t v15 = (char *)a2 + a1[12];
  *(void *)uint64_t v15 = 0;
  v15[8] = 1;
  uint64_t v16 = (char *)a2 + v14;
  *(void *)uint64_t v16 = 0;
  v16[8] = 1;
  uint64_t v17 = a1[15];
  uint64_t v18 = (char *)a2 + a1[14];
  *(void *)uint64_t v18 = 0;
  v18[8] = 1;
  uint64_t v19 = (char *)a2 + v17;
  *(void *)uint64_t v19 = 0;
  v19[8] = 1;
  uint64_t v20 = (char *)a2 + a1[16];
  *(void *)uint64_t v20 = 0;
  v20[8] = 1;
  return result;
}

uint64_t sub_25A8060A4()
{
  return 0x7065527865646E49;
}

uint64_t (*sub_25A8060CC())()
{
  return nullsub_1;
}

uint64_t sub_25A8060F0()
{
  return IndexReport.decodeMessage<A>(decoder:)();
}

uint64_t sub_25A806108(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return IndexReport.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_25A806120(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A80A1E0(&qword_26A465CF8, (void (*)(uint64_t))type metadata accessor for IndexReport);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_25A80619C@<X0>(uint64_t a1@<X8>)
{
  return sub_25A8097A0(&qword_26A465AC8, (uint64_t)static IndexReport._protobuf_nameMap, a1);
}

uint64_t sub_25A8061C0(uint64_t a1)
{
  uint64_t v2 = sub_25A80A1E0(&qword_26A465C40, (void (*)(uint64_t))type metadata accessor for IndexReport);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_25A80622C()
{
  sub_25A80A1E0(&qword_26A465C40, (void (*)(uint64_t))type metadata accessor for IndexReport);
  return sub_25A82CCF0();
}

const char *SearchReport.protoMessageName.unsafeMutableAddressor()
{
  return "SearchReport";
}

uint64_t static SearchReport.protoMessageName.getter()
{
  return 0x6552686372616553;
}

uint64_t sub_25A8062D8()
{
  uint64_t v0 = sub_25A82CD90();
  __swift_allocate_value_buffer(v0, static SearchReport._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static SearchReport._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465D30);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A465D38) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_25A82DA10;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "uniqueTokenCount";
  *(void *)(v6 + 8) = 16;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_25A82CD70();
  unint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "durationMillis";
  *(void *)(v10 + 8) = 14;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)uint64_t v12 = "falsePositiveQueryCount";
  *((void *)v12 + 1) = 23;
  v12[16] = 2;
  v9();
  uint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  *uint64_t v13 = 4;
  *(void *)uint64_t v14 = "falsePositiveQueryTokens";
  *((void *)v14 + 1) = 24;
  v14[16] = 2;
  v9();
  uint64_t v15 = (void *)(v5 + 4 * v2);
  uint64_t v16 = (char *)v15 + v1[14];
  *uint64_t v15 = 5;
  *(void *)uint64_t v16 = "falsePositiveQueryPercentage";
  *((void *)v16 + 1) = 28;
  v16[16] = 2;
  v9();
  uint64_t v17 = (void *)(v5 + 5 * v2);
  uint64_t v18 = (char *)v17 + v1[14];
  *uint64_t v17 = 6;
  *(void *)uint64_t v18 = "averageFalsePositiveResultPercentage";
  *((void *)v18 + 1) = 36;
  v18[16] = 2;
  v9();
  uint64_t v19 = (void *)(v5 + 6 * v2);
  uint64_t v20 = (char *)v19 + v1[14];
  *uint64_t v19 = 7;
  *(void *)uint64_t v20 = "searchesPerSecond";
  *((void *)v20 + 1) = 17;
  v20[16] = 2;
  v9();
  return sub_25A82CD80();
}

uint64_t SearchReport._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_25A80724C(&qword_26A465AD0, (uint64_t)static SearchReport._protobuf_nameMap);
}

uint64_t static SearchReport._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25A8072C4(&qword_26A465AD0, (uint64_t)static SearchReport._protobuf_nameMap, a1);
}

uint64_t SearchReport.decodeMessage<A>(decoder:)()
{
  while (1)
  {
    uint64_t result = sub_25A82CC50();
    uint64_t v3 = v0;
    if (v0 || (v2 & 1) != 0) {
      return result;
    }
    switch(result)
    {
      case 1:
      case 2:
      case 3:
        type metadata accessor for SearchReport(0);
        sub_25A82CC70();
        goto LABEL_7;
      case 4:
        sub_25A82CC80();
        goto LABEL_7;
      case 5:
      case 6:
      case 7:
        type metadata accessor for SearchReport(0);
        sub_25A82CC90();
LABEL_7:
        uint64_t v3 = 0;
        break;
      default:
        break;
    }
    uint64_t v0 = v3;
  }
}

uint64_t SearchReport.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_25A8068FC(v3, a1, a2, a3, type metadata accessor for SearchReport);
  if (!v4)
  {
    sub_25A806978(v3, a1, a2, a3, type metadata accessor for SearchReport);
    sub_25A8069F4(v3, a1, a2, a3, type metadata accessor for SearchReport);
    if (*(void *)(*(void *)v3 + 16)) {
      sub_25A82CD20();
    }
    sub_25A806A70(v3);
    sub_25A806AE8(v3);
    sub_25A806B60(v3);
    type metadata accessor for SearchReport(0);
    return sub_25A82CBF0();
  }
  return result;
}

uint64_t sub_25A8068FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t result = a5(0);
  if ((*(unsigned char *)(a1 + *(int *)(result + 24) + 8) & 1) == 0) {
    return sub_25A82CD10();
  }
  return result;
}

uint64_t sub_25A806978(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t result = a5(0);
  if ((*(unsigned char *)(a1 + *(int *)(result + 28) + 8) & 1) == 0) {
    return sub_25A82CD10();
  }
  return result;
}

uint64_t sub_25A8069F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t result = a5(0);
  if ((*(unsigned char *)(a1 + *(int *)(result + 32) + 8) & 1) == 0) {
    return sub_25A82CD10();
  }
  return result;
}

uint64_t sub_25A806A70(uint64_t a1)
{
  uint64_t result = type metadata accessor for SearchReport(0);
  if ((*(unsigned char *)(a1 + *(int *)(result + 36) + 8) & 1) == 0) {
    return sub_25A82CD30();
  }
  return result;
}

uint64_t sub_25A806AE8(uint64_t a1)
{
  uint64_t result = type metadata accessor for SearchReport(0);
  if ((*(unsigned char *)(a1 + *(int *)(result + 40) + 8) & 1) == 0) {
    return sub_25A82CD30();
  }
  return result;
}

uint64_t sub_25A806B60(uint64_t a1)
{
  uint64_t result = type metadata accessor for SearchReport(0);
  if ((*(unsigned char *)(a1 + *(int *)(result + 44) + 8) & 1) == 0) {
    return sub_25A82CD30();
  }
  return result;
}

uint64_t SearchReport.hashValue.getter()
{
  return sub_25A8095AC((void (*)(void))type metadata accessor for SearchReport, &qword_26A465BE8, (void (*)(uint64_t))type metadata accessor for SearchReport);
}

uint64_t sub_25A806C24@<X0>(int *a1@<X0>, void *a2@<X8>)
{
  *a2 = MEMORY[0x263F8EE78];
  uint64_t result = _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t v5 = a1[7];
  unint64_t v6 = (char *)a2 + a1[6];
  *(void *)unint64_t v6 = 0;
  v6[8] = 1;
  uint64_t v7 = (char *)a2 + v5;
  *(void *)uint64_t v7 = 0;
  v7[8] = 1;
  uint64_t v8 = a1[9];
  unint64_t v9 = (char *)a2 + a1[8];
  *(void *)unint64_t v9 = 0;
  v9[8] = 1;
  unint64_t v10 = (char *)a2 + v8;
  *(void *)unint64_t v10 = 0;
  v10[8] = 1;
  uint64_t v11 = a1[11];
  uint64_t v12 = (char *)a2 + a1[10];
  *(void *)uint64_t v12 = 0;
  v12[8] = 1;
  uint64_t v13 = (char *)a2 + v11;
  *(void *)uint64_t v13 = 0;
  v13[8] = 1;
  return result;
}

uint64_t sub_25A806CB8()
{
  return 0x6552686372616553;
}

uint64_t sub_25A806CD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 20);
  uint64_t v5 = sub_25A82CC10();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t sub_25A806D48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 20);
  uint64_t v5 = sub_25A82CC10();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t sub_25A806DB8()
{
  return SearchReport.decodeMessage<A>(decoder:)();
}

uint64_t sub_25A806DD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return SearchReport.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_25A806DE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A80A1E0(&qword_26A465CF0, (void (*)(uint64_t))type metadata accessor for SearchReport);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_25A806E64@<X0>(uint64_t a1@<X8>)
{
  return sub_25A8097A0(&qword_26A465AD0, (uint64_t)static SearchReport._protobuf_nameMap, a1);
}

uint64_t sub_25A806E88(uint64_t a1)
{
  uint64_t v2 = sub_25A80A1E0(&qword_26A465C58, (void (*)(uint64_t))type metadata accessor for SearchReport);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_25A806EF4()
{
  sub_25A80A1E0(&qword_26A465C58, (void (*)(uint64_t))type metadata accessor for SearchReport);
  return sub_25A82CCF0();
}

void *BenchmarkReport.protoMessageName.unsafeMutableAddressor()
{
  return &static BenchmarkReport.protoMessageName;
}

uint64_t static BenchmarkReport.protoMessageName.getter()
{
  return 0x72616D68636E6542;
}

uint64_t sub_25A806FA4()
{
  uint64_t v0 = sub_25A82CD90();
  __swift_allocate_value_buffer(v0, static BenchmarkReport._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static BenchmarkReport._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465D30);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A465D38) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_25A82DA20;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "startMillis";
  *(void *)(v6 + 8) = 11;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_25A82CD70();
  unint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "startDate";
  *(void *)(v10 + 8) = 9;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)uint64_t v12 = "config";
  *((void *)v12 + 1) = 6;
  v12[16] = 2;
  v9();
  uint64_t v13 = (void *)(v5 + 3 * v2);
  uint64_t v14 = (char *)v13 + v1[14];
  *uint64_t v13 = 4;
  *(void *)uint64_t v14 = "IndexReport";
  *((void *)v14 + 1) = 11;
  v14[16] = 2;
  v9();
  uint64_t v15 = v5 + 4 * v2 + v1[14];
  *(void *)(v5 + 4 * v2) = 5;
  *(void *)uint64_t v15 = "searchReport";
  *(void *)(v15 + 8) = 12;
  *(unsigned char *)(v15 + 16) = 2;
  v9();
  return sub_25A82CD80();
}

uint64_t BenchmarkReport._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_25A80724C(&qword_26A465AD8, (uint64_t)static BenchmarkReport._protobuf_nameMap);
}

uint64_t sub_25A80724C(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_25A82CD90();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static BenchmarkReport._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25A8072C4(&qword_26A465AD8, (uint64_t)static BenchmarkReport._protobuf_nameMap, a1);
}

uint64_t sub_25A8072C4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_25A82CD90();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t sub_25A80735C()
{
  type metadata accessor for BenchmarkReport._StorageClass(0);
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = 0;
  *(unsigned char *)(v0 + 24) = 1;
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = 0;
  uint64_t v1 = v0
     + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__config;
  uint64_t v2 = type metadata accessor for BenchmarkConfig(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  uint64_t v3 = v0
     + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__indexReport;
  uint64_t v4 = type metadata accessor for IndexReport(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  uint64_t v5 = v0
     + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__searchReport;
  uint64_t v6 = type metadata accessor for SearchReport(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  qword_26A465BA0 = v0;
  return result;
}

uint64_t sub_25A80748C(uint64_t a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465BC8);
  MEMORY[0x270FA5388]();
  uint64_t v26 = (uint64_t)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465BB8);
  MEMORY[0x270FA5388]();
  uint64_t v25 = (uint64_t)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465BA8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v1 + 16) = 0;
  *(unsigned char *)(v1 + 24) = 1;
  *(void *)(v1 + 40) = 0;
  *(void *)(v1 + 32) = 0;
  uint64_t v8 = v1
     + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__config;
  uint64_t v9 = type metadata accessor for BenchmarkConfig(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  uint64_t v10 = v1
      + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__indexReport;
  uint64_t v11 = type metadata accessor for IndexReport(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  uint64_t v12 = v1
      + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__searchReport;
  uint64_t v13 = type metadata accessor for SearchReport(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  swift_beginAccess();
  uint64_t v14 = *(void *)(a1 + 16);
  char v15 = *(unsigned char *)(a1 + 24);
  swift_beginAccess();
  *(void *)(v1 + 16) = v14;
  *(unsigned char *)(v1 + 24) = v15;
  swift_beginAccess();
  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 40);
  swift_beginAccess();
  *(void *)(v1 + 32) = v17;
  *(void *)(v1 + 40) = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = a1
      + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__config;
  swift_beginAccess();
  sub_25A8079B4(v18, (uint64_t)v7, &qword_26A465BA8);
  swift_beginAccess();
  sub_25A807A7C((uint64_t)v7, v8, &qword_26A465BA8);
  swift_endAccess();
  uint64_t v19 = a1
      + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__indexReport;
  swift_beginAccess();
  uint64_t v20 = v25;
  sub_25A8079B4(v19, v25, &qword_26A465BB8);
  swift_beginAccess();
  sub_25A807A7C(v20, v10, &qword_26A465BB8);
  swift_endAccess();
  uint64_t v21 = a1
      + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__searchReport;
  swift_beginAccess();
  uint64_t v22 = v26;
  sub_25A8079B4(v21, v26, &qword_26A465BC8);
  swift_release();
  swift_beginAccess();
  sub_25A807A7C(v22, v12, &qword_26A465BC8);
  swift_endAccess();
  return v2;
}

uint64_t sub_25A807884(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25A8078EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25A807954(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_25A8079B4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25A807A18(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_25A807A7C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_25A807B18()
{
  swift_bridgeObjectRelease();
  sub_25A80CCC8(v0+ OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__config, &qword_26A465BA8);
  sub_25A80CCC8(v0+ OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__indexReport, &qword_26A465BB8);
  sub_25A80CCC8(v0+ OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__searchReport, &qword_26A465BC8);
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t BenchmarkReport.decodeMessage<A>(decoder:)()
{
  uint64_t v1 = *(int *)(type metadata accessor for BenchmarkReport(0) + 20);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    type metadata accessor for BenchmarkReport._StorageClass(0);
    swift_allocObject();
    uint64_t v2 = swift_retain();
    *(void *)(v0 + v1) = sub_25A80748C(v2);
    swift_release();
  }
  swift_retain();
  sub_25A807C88();
  return swift_release();
}

uint64_t sub_25A807C88()
{
  while (1)
  {
    uint64_t result = sub_25A82CC50();
    if (v0 || (v2 & 1) != 0) {
      return result;
    }
    switch(result)
    {
      case 1:
        sub_25A807DA0();
        break;
      case 2:
        sub_25A807E20();
        break;
      case 3:
        sub_25A807EA0();
        break;
      case 4:
        sub_25A807F70();
        break;
      case 5:
        sub_25A808040();
        break;
      default:
        continue;
    }
  }
}

uint64_t sub_25A807DA0()
{
  return swift_endAccess();
}

uint64_t sub_25A807E20()
{
  return swift_endAccess();
}

uint64_t sub_25A807EA0()
{
  return swift_endAccess();
}

uint64_t sub_25A807F70()
{
  return swift_endAccess();
}

uint64_t sub_25A808040()
{
  return swift_endAccess();
}

uint64_t BenchmarkReport.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for BenchmarkReport(0);
  uint64_t v7 = swift_retain();
  sub_25A8081A4(v7, a1, a2, a3);
  uint64_t result = swift_release();
  if (!v3) {
    return sub_25A82CBF0();
  }
  return result;
}

uint64_t sub_25A8081A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = sub_25A80823C(a1);
  if (!v4)
  {
    sub_25A8082C4(a1);
    sub_25A808364(a1, a2, a3, a4);
    sub_25A808574(a1, a2, a3, a4);
    return sub_25A808784(a1, a2, a3, a4);
  }
  return result;
}

uint64_t sub_25A80823C(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  if ((*(unsigned char *)(a1 + 24) & 1) == 0) {
    return sub_25A82CD10();
  }
  return result;
}

uint64_t sub_25A8082C4(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  if (*(void *)(a1 + 40))
  {
    swift_bridgeObjectRetain();
    sub_25A82CD40();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25A808364(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[5] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465BA8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for BenchmarkConfig(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1
      + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__config;
  swift_beginAccess();
  sub_25A8079B4(v12, (uint64_t)v7, &qword_26A465BA8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return sub_25A80CCC8((uint64_t)v7, &qword_26A465BA8);
  }
  sub_25A807884((uint64_t)v7, (uint64_t)v11, type metadata accessor for BenchmarkConfig);
  sub_25A80A1E0(&qword_26A465C28, (void (*)(uint64_t))type metadata accessor for BenchmarkConfig);
  sub_25A82CD60();
  return sub_25A807954((uint64_t)v11, type metadata accessor for BenchmarkConfig);
}

uint64_t sub_25A808574(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[5] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465BB8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for IndexReport(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1
      + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__indexReport;
  swift_beginAccess();
  sub_25A8079B4(v12, (uint64_t)v7, &qword_26A465BB8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return sub_25A80CCC8((uint64_t)v7, &qword_26A465BB8);
  }
  sub_25A807884((uint64_t)v7, (uint64_t)v11, type metadata accessor for IndexReport);
  sub_25A80A1E0(&qword_26A465C40, (void (*)(uint64_t))type metadata accessor for IndexReport);
  sub_25A82CD60();
  return sub_25A807954((uint64_t)v11, type metadata accessor for IndexReport);
}

uint64_t sub_25A808784(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[5] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465BC8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SearchReport(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1
      + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__searchReport;
  swift_beginAccess();
  sub_25A8079B4(v12, (uint64_t)v7, &qword_26A465BC8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return sub_25A80CCC8((uint64_t)v7, &qword_26A465BC8);
  }
  sub_25A807884((uint64_t)v7, (uint64_t)v11, type metadata accessor for SearchReport);
  sub_25A80A1E0(&qword_26A465C58, (void (*)(uint64_t))type metadata accessor for SearchReport);
  sub_25A82CD60();
  return sub_25A807954((uint64_t)v11, type metadata accessor for SearchReport);
}

BOOL sub_25A808998(uint64_t a1, uint64_t a2)
{
  uint64_t v73 = type metadata accessor for SearchReport(0);
  uint64_t v82 = *(void *)(v73 - 8);
  MEMORY[0x270FA5388](v73);
  v69 = (char *)&v69 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465D18);
  MEMORY[0x270FA5388](v72);
  uint64_t v74 = (uint64_t)&v69 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465BC8);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  v70 = (void **)((char *)&v69 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v7);
  v81 = (char *)&v69 - v9;
  uint64_t v79 = type metadata accessor for IndexReport(0);
  uint64_t v78 = *(void *)(v79 - 8);
  MEMORY[0x270FA5388](v79);
  v71 = (char *)&v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465D20);
  MEMORY[0x270FA5388](v76);
  uint64_t v80 = (uint64_t)&v69 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465BB8);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  v75 = (void **)((char *)&v69 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v13);
  uint64_t v77 = (uint64_t)&v69 - v15;
  uint64_t v16 = type metadata accessor for BenchmarkConfig(0);
  uint64_t v83 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v69 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465D28);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v69 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465BA8);
  uint64_t v23 = MEMORY[0x270FA5388](v22 - 8);
  uint64_t v25 = (char *)&v69 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v69 - v26;
  swift_beginAccess();
  uint64_t v28 = *(void *)(a1 + 16);
  uint64_t v84 = a1;
  LOBYTE(a1) = *(unsigned char *)(a1 + 24);
  swift_beginAccess();
  uint64_t v85 = a2;
  char v29 = *(unsigned char *)(a2 + 24);
  if (a1)
  {
    if (!*(unsigned char *)(a2 + 24)) {
      return 0;
    }
  }
  else
  {
    if (v28 != *(void *)(a2 + 16)) {
      char v29 = 1;
    }
    if (v29) {
      return 0;
    }
  }
  uint64_t v30 = v84;
  swift_beginAccess();
  uint64_t v31 = *(void *)(v30 + 32);
  uint64_t v32 = *(void *)(v30 + 40);
  uint64_t v33 = v85;
  swift_beginAccess();
  uint64_t v34 = *(void *)(v33 + 40);
  if (!v32)
  {
    if (v34) {
      return 0;
    }
    goto LABEL_14;
  }
  if (!v34) {
    return 0;
  }
  if (v31 == *(void *)(v33 + 32) && v32 == v34 || (v35 = sub_25A82D370(), BOOL result = 0, (v35 & 1) != 0))
  {
LABEL_14:
    uint64_t v37 = v30
        + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__config;
    swift_beginAccess();
    sub_25A8079B4(v37, (uint64_t)v27, &qword_26A465BA8);
    uint64_t v38 = v85;
    uint64_t v39 = v85
        + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__config;
    swift_beginAccess();
    uint64_t v40 = (uint64_t)&v21[*(int *)(v19 + 48)];
    sub_25A8079B4((uint64_t)v27, (uint64_t)v21, &qword_26A465BA8);
    sub_25A8079B4(v39, v40, &qword_26A465BA8);
    v41 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v83 + 48);
    if (v41((uint64_t)v21, 1, v16) == 1)
    {
      swift_retain();
      swift_retain();
      sub_25A80CCC8((uint64_t)v27, &qword_26A465BA8);
      if (v41(v40, 1, v16) == 1)
      {
        sub_25A80CCC8((uint64_t)v21, &qword_26A465BA8);
        goto LABEL_22;
      }
    }
    else
    {
      sub_25A8079B4((uint64_t)v21, (uint64_t)v25, &qword_26A465BA8);
      if (v41(v40, 1, v16) != 1)
      {
        sub_25A807884(v40, (uint64_t)v18, type metadata accessor for BenchmarkConfig);
        swift_retain();
        swift_retain();
        char v42 = _s17PrivateSearchCore15BenchmarkConfigV2eeoiySbAC_ACtFZ_0((uint64_t)v25, (uint64_t)v18);
        sub_25A807954((uint64_t)v18, type metadata accessor for BenchmarkConfig);
        sub_25A80CCC8((uint64_t)v27, &qword_26A465BA8);
        sub_25A807954((uint64_t)v25, type metadata accessor for BenchmarkConfig);
        sub_25A80CCC8((uint64_t)v21, &qword_26A465BA8);
        if ((v42 & 1) == 0) {
          goto LABEL_28;
        }
LABEL_22:
        uint64_t v43 = v30
            + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__indexReport;
        swift_beginAccess();
        uint64_t v44 = v77;
        sub_25A8079B4(v43, v77, &qword_26A465BB8);
        uint64_t v45 = v38
            + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__indexReport;
        swift_beginAccess();
        uint64_t v46 = v80;
        uint64_t v47 = v80 + *(int *)(v76 + 48);
        sub_25A8079B4(v44, v80, &qword_26A465BB8);
        sub_25A8079B4(v45, v47, &qword_26A465BB8);
        v48 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v78 + 48);
        uint64_t v49 = v79;
        if (v48(v46, 1, v79) == 1)
        {
          sub_25A80CCC8(v44, &qword_26A465BB8);
          int v50 = v48(v47, 1, v49);
          uint64_t v51 = v82;
          uint64_t v52 = (uint64_t)v81;
          if (v50 == 1)
          {
            sub_25A80CCC8(v46, &qword_26A465BB8);
            uint64_t v53 = v84;
LABEL_31:
            uint64_t v58 = v53
                + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__searchReport;
            swift_beginAccess();
            sub_25A8079B4(v58, v52, &qword_26A465BC8);
            uint64_t v59 = v85
                + OBJC_IVAR____TtCV17PrivateSearchCore15BenchmarkReportP33_2A336E79A46A37691DD5F92414E6F50C13_StorageClass__searchReport;
            swift_beginAccess();
            uint64_t v60 = v74;
            uint64_t v61 = v74 + *(int *)(v72 + 48);
            sub_25A8079B4(v52, v74, &qword_26A465BC8);
            uint64_t v62 = v59;
            uint64_t v63 = v60;
            sub_25A8079B4(v62, v61, &qword_26A465BC8);
            v64 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v51 + 48);
            uint64_t v65 = v73;
            if (v64(v63, 1, v73) == 1)
            {
              swift_release();
              swift_release();
              sub_25A80CCC8(v52, &qword_26A465BC8);
              if (v64(v61, 1, v65) == 1)
              {
                sub_25A80CCC8(v63, &qword_26A465BC8);
                return 1;
              }
              goto LABEL_36;
            }
            v66 = v70;
            sub_25A8079B4(v63, (uint64_t)v70, &qword_26A465BC8);
            if (v64(v61, 1, v65) == 1)
            {
              swift_release();
              swift_release();
              sub_25A80CCC8(v52, &qword_26A465BC8);
              sub_25A807954((uint64_t)v66, type metadata accessor for SearchReport);
LABEL_36:
              sub_25A80CCC8(v63, &qword_26A465D18);
              return 0;
            }
            v67 = v69;
            sub_25A807884(v61, (uint64_t)v69, type metadata accessor for SearchReport);
            char v68 = _s17PrivateSearchCore0B6ReportV2eeoiySbAC_ACtFZ_0(v66, v67);
            swift_release();
            swift_release();
            sub_25A807954((uint64_t)v67, type metadata accessor for SearchReport);
            sub_25A80CCC8(v52, &qword_26A465BC8);
            sub_25A807954((uint64_t)v66, type metadata accessor for SearchReport);
            sub_25A80CCC8(v63, &qword_26A465BC8);
            return (v68 & 1) != 0;
          }
        }
        else
        {
          v54 = v75;
          sub_25A8079B4(v46, (uint64_t)v75, &qword_26A465BB8);
          int v55 = v48(v47, 1, v49);
          uint64_t v51 = v82;
          uint64_t v52 = (uint64_t)v81;
          if (v55 != 1)
          {
            v56 = v71;
            sub_25A807884(v47, (uint64_t)v71, type metadata accessor for IndexReport);
            char v57 = _s17PrivateSearchCore11IndexReportV2eeoiySbAC_ACtFZ_0(v54, v56);
            sub_25A807954((uint64_t)v56, type metadata accessor for IndexReport);
            sub_25A80CCC8(v44, &qword_26A465BB8);
            sub_25A807954((uint64_t)v54, type metadata accessor for IndexReport);
            sub_25A80CCC8(v46, &qword_26A465BB8);
            uint64_t v53 = v84;
            if (v57) {
              goto LABEL_31;
            }
LABEL_28:
            swift_release();
            swift_release();
            return 0;
          }
          sub_25A80CCC8(v44, &qword_26A465BB8);
          sub_25A807954((uint64_t)v54, type metadata accessor for IndexReport);
        }
        sub_25A80CCC8(v46, &qword_26A465D20);
        goto LABEL_28;
      }
      swift_retain();
      swift_retain();
      sub_25A80CCC8((uint64_t)v27, &qword_26A465BA8);
      sub_25A807954((uint64_t)v25, type metadata accessor for BenchmarkConfig);
    }
    sub_25A80CCC8((uint64_t)v21, &qword_26A465D28);
    goto LABEL_28;
  }
  return result;
}

uint64_t BenchmarkReport.hashValue.getter()
{
  return sub_25A8095AC((void (*)(void))type metadata accessor for BenchmarkReport, &qword_26A465BF0, (void (*)(uint64_t))type metadata accessor for BenchmarkReport);
}

uint64_t sub_25A8095AC(void (*a1)(void), unint64_t *a2, void (*a3)(uint64_t))
{
  return sub_25A82D430();
}

uint64_t sub_25A809634@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t v4 = *(int *)(a1 + 20);
  if (qword_26A465AE0 != -1) {
    swift_once();
  }
  *(void *)(a2 + v4) = qword_26A465BA0;
  return swift_retain();
}

uint64_t sub_25A8096AC()
{
  return 0x72616D68636E6542;
}

uint64_t sub_25A8096D0()
{
  return BenchmarkReport.decodeMessage<A>(decoder:)();
}

uint64_t sub_25A8096E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return BenchmarkReport.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_25A809700(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A80A1E0(&qword_26A465CE8, (void (*)(uint64_t))type metadata accessor for BenchmarkReport);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_25A80977C@<X0>(uint64_t a1@<X8>)
{
  return sub_25A8097A0(&qword_26A465AD8, (uint64_t)static BenchmarkReport._protobuf_nameMap, a1);
}

uint64_t sub_25A8097A0@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_25A82CD90();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t sub_25A80983C(uint64_t a1)
{
  uint64_t v2 = sub_25A80A1E0(&qword_26A465C70, (void (*)(uint64_t))type metadata accessor for BenchmarkReport);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_25A8098A8()
{
  return sub_25A82D430();
}

uint64_t sub_25A809900()
{
  sub_25A80A1E0(&qword_26A465C70, (void (*)(uint64_t))type metadata accessor for BenchmarkReport);
  return sub_25A82CCF0();
}

uint64_t sub_25A80997C()
{
  return sub_25A82D430();
}

uint64_t _s17PrivateSearchCore15BenchmarkReportV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A82CC10();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v19 - v9;
  uint64_t v11 = *(int *)(type metadata accessor for BenchmarkReport(0) + 20);
  uint64_t v12 = *(void *)(a1 + v11);
  uint64_t v13 = *(void *)(a2 + v11);
  if (v12 == v13
    || (swift_retain(), swift_retain(), BOOL v14 = sub_25A808998(v12, v13), swift_release(), swift_release(), v14))
  {
    uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v15(v10, a1, v4);
    v15(v8, a2, v4);
    sub_25A80A1E0((unint64_t *)&qword_26A465D10, MEMORY[0x263F50560]);
    char v16 = sub_25A82CE40();
    uint64_t v17 = *(void (**)(char *, uint64_t))(v5 + 8);
    v17(v8, v4);
    v17(v10, v4);
  }
  else
  {
    char v16 = 0;
  }
  return v16 & 1;
}

uint64_t _s17PrivateSearchCore15BenchmarkConfigV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A82CC10();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v28 - v9;
  uint64_t v11 = type metadata accessor for BenchmarkConfig(0);
  uint64_t v12 = *(int *)(v11 + 20);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = *(void *)(a1 + v12 + 8);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  if (!v14)
  {
    if (v16) {
      goto LABEL_19;
    }
    goto LABEL_10;
  }
  if (!v16) {
    goto LABEL_19;
  }
  BOOL v17 = *v13 == *v15 && v14 == v16;
  if (v17 || (char v18 = 0, (sub_25A82D370() & 1) != 0))
  {
LABEL_10:
    uint64_t v19 = *(int *)(v11 + 24);
    uint64_t v20 = (void *)(a1 + v19);
    uint64_t v21 = *(void *)(a1 + v19 + 8);
    uint64_t v22 = (void *)(a2 + v19);
    uint64_t v23 = v22[1];
    if (v21)
    {
      if (v23)
      {
        if (*v20 != *v22 || v21 != v23)
        {
          char v18 = 0;
          if ((sub_25A82D370() & 1) == 0) {
            return v18 & 1;
          }
        }
LABEL_20:
        uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
        v25(v10, a1, v4);
        v25(v8, a2, v4);
        sub_25A80A1E0((unint64_t *)&qword_26A465D10, MEMORY[0x263F50560]);
        char v18 = sub_25A82CE40();
        uint64_t v26 = *(void (**)(char *, uint64_t))(v5 + 8);
        v26(v8, v4);
        v26(v10, v4);
        return v18 & 1;
      }
    }
    else if (!v23)
    {
      goto LABEL_20;
    }
LABEL_19:
    char v18 = 0;
  }
  return v18 & 1;
}

uint64_t _s17PrivateSearchCore11IndexReportV2eeoiySbAC_ACtFZ_0(void **a1, char *a2)
{
  uint64_t v4 = sub_25A82CC10();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v72 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v72 - v9;
  uint64_t v11 = (int *)type metadata accessor for IndexReport(0);
  uint64_t v12 = v11;
  uint64_t v13 = v11[6];
  uint64_t v14 = (void **)((char *)a1 + v13);
  char v15 = *((unsigned char *)a1 + v13 + 8);
  uint64_t v16 = &a2[v13];
  int v17 = a2[v13 + 8];
  if (v15)
  {
    if (!v17) {
      goto LABEL_64;
    }
  }
  else
  {
    if (*v14 != *(void *)v16) {
      LOBYTE(v17) = 1;
    }
    if (v17) {
      goto LABEL_64;
    }
  }
  uint64_t v18 = v11[7];
  uint64_t v19 = (void **)((char *)a1 + v18);
  char v20 = *((unsigned char *)a1 + v18 + 8);
  uint64_t v21 = &a2[v18];
  int v22 = a2[v18 + 8];
  if (v20)
  {
    if (!v22) {
      goto LABEL_64;
    }
  }
  else
  {
    if (*v19 != *(void *)v21) {
      LOBYTE(v22) = 1;
    }
    if (v22) {
      goto LABEL_64;
    }
  }
  uint64_t v23 = v11[8];
  uint64_t v24 = (void **)((char *)a1 + v23);
  char v25 = *((unsigned char *)a1 + v23 + 8);
  uint64_t v26 = &a2[v23];
  int v27 = a2[v23 + 8];
  if (v25)
  {
    if (!v27) {
      goto LABEL_64;
    }
  }
  else
  {
    if (*v24 != *(void *)v26) {
      LOBYTE(v27) = 1;
    }
    if (v27) {
      goto LABEL_64;
    }
  }
  uint64_t v28 = v11[9];
  char v29 = (void **)((char *)a1 + v28);
  char v30 = *((unsigned char *)a1 + v28 + 8);
  uint64_t v31 = &a2[v28];
  int v32 = a2[v28 + 8];
  if (v30)
  {
    if (!v32) {
      goto LABEL_64;
    }
  }
  else
  {
    if (*v29 != *(void *)v31) {
      LOBYTE(v32) = 1;
    }
    if (v32) {
      goto LABEL_64;
    }
  }
  uint64_t v33 = v11[10];
  uint64_t v34 = (void **)((char *)a1 + v33);
  char v35 = *((unsigned char *)a1 + v33 + 8);
  uint64_t v36 = &a2[v33];
  int v37 = a2[v33 + 8];
  if (v35)
  {
    if (!v37) {
      goto LABEL_64;
    }
  }
  else
  {
    if (*v34 != *(void *)v36) {
      LOBYTE(v37) = 1;
    }
    if (v37) {
      goto LABEL_64;
    }
  }
  uint64_t v38 = v11[11];
  uint64_t v39 = (void **)((char *)a1 + v38);
  char v40 = *((unsigned char *)a1 + v38 + 8);
  v41 = &a2[v38];
  int v42 = a2[v38 + 8];
  if (v40)
  {
    if (!v42) {
      goto LABEL_64;
    }
  }
  else
  {
    if (*v39 != *(void *)v41) {
      LOBYTE(v42) = 1;
    }
    if (v42) {
      goto LABEL_64;
    }
  }
  if (sub_25A80DE80(*a1, *(void **)a2))
  {
    uint64_t v43 = v12[12];
    uint64_t v44 = (double *)((char *)a1 + v43);
    char v45 = *((unsigned char *)a1 + v43 + 8);
    uint64_t v46 = (double *)&a2[v43];
    int v47 = a2[v43 + 8];
    if (v45)
    {
      if (!v47) {
        goto LABEL_64;
      }
    }
    else
    {
      if (*v44 != *v46) {
        LOBYTE(v47) = 1;
      }
      if (v47) {
        goto LABEL_64;
      }
    }
    uint64_t v48 = v12[13];
    uint64_t v49 = (double *)((char *)a1 + v48);
    char v50 = *((unsigned char *)a1 + v48 + 8);
    uint64_t v51 = (double *)&a2[v48];
    int v52 = a2[v48 + 8];
    if (v50)
    {
      if (!v52) {
        goto LABEL_64;
      }
    }
    else
    {
      if (*v49 != *v51) {
        LOBYTE(v52) = 1;
      }
      if (v52) {
        goto LABEL_64;
      }
    }
    uint64_t v53 = v12[14];
    v54 = (double *)((char *)a1 + v53);
    char v55 = *((unsigned char *)a1 + v53 + 8);
    v56 = (double *)&a2[v53];
    int v57 = a2[v53 + 8];
    if (v55)
    {
      if (!v57) {
        goto LABEL_64;
      }
    }
    else
    {
      if (*v54 != *v56) {
        LOBYTE(v57) = 1;
      }
      if (v57) {
        goto LABEL_64;
      }
    }
    uint64_t v58 = v12[15];
    uint64_t v59 = (void **)((char *)a1 + v58);
    char v60 = *((unsigned char *)a1 + v58 + 8);
    uint64_t v61 = &a2[v58];
    int v62 = a2[v58 + 8];
    if ((v60 & 1) == 0)
    {
      if (*v59 != *(void *)v61) {
        LOBYTE(v62) = 1;
      }
      if (v62) {
        goto LABEL_64;
      }
LABEL_62:
      uint64_t v63 = v12[16];
      v64 = (void **)((char *)a1 + v63);
      char v65 = *((unsigned char *)a1 + v63 + 8);
      v66 = &a2[v63];
      int v67 = a2[v63 + 8];
      if (v65)
      {
        if (!v67) {
          goto LABEL_64;
        }
      }
      else
      {
        if (*v64 != *(void *)v66) {
          LOBYTE(v67) = 1;
        }
        if (v67) {
          goto LABEL_64;
        }
      }
      v70 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
      v70(v10, (char *)a1 + v12[5], v4);
      v70(v8, &a2[v12[5]], v4);
      sub_25A80A1E0((unint64_t *)&qword_26A465D10, MEMORY[0x263F50560]);
      char v68 = sub_25A82CE40();
      v71 = *(void (**)(char *, uint64_t))(v5 + 8);
      v71(v8, v4);
      v71(v10, v4);
      return v68 & 1;
    }
    if (v62) {
      goto LABEL_62;
    }
  }
LABEL_64:
  char v68 = 0;
  return v68 & 1;
}

uint64_t sub_25A80A1E0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t _s17PrivateSearchCore0B6ReportV2eeoiySbAC_ACtFZ_0(void **a1, char *a2)
{
  uint64_t v4 = sub_25A82CC10();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v47 - v9;
  uint64_t v11 = (int *)type metadata accessor for SearchReport(0);
  uint64_t v12 = v11;
  uint64_t v13 = v11[6];
  uint64_t v14 = (void **)((char *)a1 + v13);
  char v15 = *((unsigned char *)a1 + v13 + 8);
  uint64_t v16 = &a2[v13];
  int v17 = a2[v13 + 8];
  if (v15)
  {
    if (!v17) {
      goto LABEL_34;
    }
  }
  else
  {
    if (*v14 != *(void *)v16) {
      LOBYTE(v17) = 1;
    }
    if (v17) {
      goto LABEL_34;
    }
  }
  uint64_t v18 = v11[7];
  uint64_t v19 = (void **)((char *)a1 + v18);
  char v20 = *((unsigned char *)a1 + v18 + 8);
  uint64_t v21 = &a2[v18];
  int v22 = a2[v18 + 8];
  if (v20)
  {
    if (!v22) {
      goto LABEL_34;
    }
  }
  else
  {
    if (*v19 != *(void *)v21) {
      LOBYTE(v22) = 1;
    }
    if (v22) {
      goto LABEL_34;
    }
  }
  uint64_t v23 = v11[8];
  uint64_t v24 = (void **)((char *)a1 + v23);
  char v25 = *((unsigned char *)a1 + v23 + 8);
  uint64_t v26 = &a2[v23];
  int v27 = a2[v23 + 8];
  if (v25)
  {
    if (!v27) {
      goto LABEL_34;
    }
  }
  else
  {
    if (*v24 != *(void *)v26) {
      LOBYTE(v27) = 1;
    }
    if (v27) {
      goto LABEL_34;
    }
  }
  if (sub_25A80DE80(*a1, *(void **)a2))
  {
    uint64_t v28 = v12[9];
    char v29 = (double *)((char *)a1 + v28);
    char v30 = *((unsigned char *)a1 + v28 + 8);
    uint64_t v31 = (double *)&a2[v28];
    int v32 = a2[v28 + 8];
    if (v30)
    {
      if (!v32) {
        goto LABEL_34;
      }
    }
    else
    {
      if (*v29 != *v31) {
        LOBYTE(v32) = 1;
      }
      if (v32) {
        goto LABEL_34;
      }
    }
    uint64_t v33 = v12[10];
    uint64_t v34 = (double *)((char *)a1 + v33);
    char v35 = *((unsigned char *)a1 + v33 + 8);
    uint64_t v36 = (double *)&a2[v33];
    int v37 = a2[v33 + 8];
    if ((v35 & 1) == 0)
    {
      if (*v34 != *v36) {
        LOBYTE(v37) = 1;
      }
      if (v37) {
        goto LABEL_34;
      }
LABEL_32:
      uint64_t v38 = v12[11];
      uint64_t v39 = (double *)((char *)a1 + v38);
      char v40 = *((unsigned char *)a1 + v38 + 8);
      v41 = (double *)&a2[v38];
      int v42 = a2[v38 + 8];
      if (v40)
      {
        if (!v42) {
          goto LABEL_34;
        }
      }
      else
      {
        if (*v39 != *v41) {
          LOBYTE(v42) = 1;
        }
        if (v42) {
          goto LABEL_34;
        }
      }
      char v45 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
      v45(v10, (char *)a1 + v12[5], v4);
      v45(v8, &a2[v12[5]], v4);
      sub_25A80A1E0((unint64_t *)&qword_26A465D10, MEMORY[0x263F50560]);
      char v43 = sub_25A82CE40();
      uint64_t v46 = *(void (**)(char *, uint64_t))(v5 + 8);
      v46(v8, v4);
      v46(v10, v4);
      return v43 & 1;
    }
    if (v37) {
      goto LABEL_32;
    }
  }
LABEL_34:
  char v43 = 0;
  return v43 & 1;
}

unint64_t sub_25A80A518()
{
  unint64_t result = qword_26A465BF8;
  if (!qword_26A465BF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A465BF8);
  }
  return result;
}

unint64_t sub_25A80A570()
{
  unint64_t result = qword_26A465C00;
  if (!qword_26A465C00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A465C00);
  }
  return result;
}

unint64_t sub_25A80A5C8()
{
  unint64_t result = qword_26A465C08;
  if (!qword_26A465C08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A465C08);
  }
  return result;
}

unint64_t sub_25A80A620()
{
  unint64_t result = qword_26A465C10;
  if (!qword_26A465C10)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A465C18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A465C10);
  }
  return result;
}

uint64_t sub_25A80A67C()
{
  return sub_25A80A1E0(&qword_26A465C20, (void (*)(uint64_t))type metadata accessor for BenchmarkConfig);
}

uint64_t sub_25A80A6C4()
{
  return sub_25A80A1E0(&qword_26A465C28, (void (*)(uint64_t))type metadata accessor for BenchmarkConfig);
}

uint64_t sub_25A80A70C()
{
  return sub_25A80A1E0(&qword_26A465BD8, (void (*)(uint64_t))type metadata accessor for BenchmarkConfig);
}

uint64_t sub_25A80A754()
{
  return sub_25A80A1E0(&qword_26A465C30, (void (*)(uint64_t))type metadata accessor for BenchmarkConfig);
}

uint64_t sub_25A80A79C()
{
  return sub_25A80A1E0(&qword_26A465C38, (void (*)(uint64_t))type metadata accessor for IndexReport);
}

uint64_t sub_25A80A7E4()
{
  return sub_25A80A1E0(&qword_26A465C40, (void (*)(uint64_t))type metadata accessor for IndexReport);
}

uint64_t sub_25A80A82C()
{
  return sub_25A80A1E0(&qword_26A465BE0, (void (*)(uint64_t))type metadata accessor for IndexReport);
}

uint64_t sub_25A80A874()
{
  return sub_25A80A1E0(&qword_26A465C48, (void (*)(uint64_t))type metadata accessor for IndexReport);
}

uint64_t sub_25A80A8BC()
{
  return sub_25A80A1E0(&qword_26A465C50, (void (*)(uint64_t))type metadata accessor for SearchReport);
}

uint64_t sub_25A80A904()
{
  return sub_25A80A1E0(&qword_26A465C58, (void (*)(uint64_t))type metadata accessor for SearchReport);
}

uint64_t sub_25A80A94C()
{
  return sub_25A80A1E0(&qword_26A465BE8, (void (*)(uint64_t))type metadata accessor for SearchReport);
}

uint64_t sub_25A80A994()
{
  return sub_25A80A1E0(&qword_26A465C60, (void (*)(uint64_t))type metadata accessor for SearchReport);
}

uint64_t sub_25A80A9DC()
{
  return sub_25A80A1E0(&qword_26A465C68, (void (*)(uint64_t))type metadata accessor for BenchmarkReport);
}

uint64_t sub_25A80AA24()
{
  return sub_25A80A1E0(&qword_26A465C70, (void (*)(uint64_t))type metadata accessor for BenchmarkReport);
}

uint64_t sub_25A80AA6C()
{
  return sub_25A80A1E0(&qword_26A465BF0, (void (*)(uint64_t))type metadata accessor for BenchmarkReport);
}

uint64_t sub_25A80AAB4()
{
  return sub_25A80A1E0(&qword_26A465C78, (void (*)(uint64_t))type metadata accessor for BenchmarkReport);
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for IndexableFileType(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for IndexableFileType(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = 0;
    *(unsigned char *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 1;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 9) = v3;
  return result;
}

uint64_t sub_25A80AB64(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25A80AB80(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for IndexableFileType()
{
  return &type metadata for IndexableFileType;
}

uint64_t *initializeBufferWithCopyOfBuffer for BenchmarkConfig(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25A82CC10();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (uint64_t *)((char *)a1 + v9);
    uint64_t v14 = (uint64_t *)((char *)a2 + v9);
    uint64_t v15 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for BenchmarkConfig(uint64_t a1)
{
  uint64_t v2 = sub_25A82CC10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for BenchmarkConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A82CC10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)(a1 + v8);
  uint64_t v13 = (void *)(a2 + v8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for BenchmarkConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A82CC10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for BenchmarkConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A82CC10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for BenchmarkConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A82CC10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for BenchmarkConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A80AFD0);
}

uint64_t sub_25A80AFD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A82CC10();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for BenchmarkConfig(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A80B0B4);
}

uint64_t sub_25A80B0B4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_25A82CC10();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  }
  return result;
}

uint64_t sub_25A80B174()
{
  uint64_t result = sub_25A82CC10();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for IndexReport(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    unint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25A82CC10();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    uint64_t v15 = (char *)v7 + v13;
    uint64_t v16 = (char *)a2 + v13;
    *(void *)uint64_t v15 = *(void *)v16;
    v15[8] = v16[8];
    int v17 = (char *)v7 + v14;
    uint64_t v18 = (char *)a2 + v14;
    *(void *)int v17 = *(void *)v18;
    v17[8] = v18[8];
    uint64_t v19 = a3[8];
    uint64_t v20 = a3[9];
    uint64_t v21 = (char *)v7 + v19;
    int v22 = (char *)a2 + v19;
    *(void *)uint64_t v21 = *(void *)v22;
    v21[8] = v22[8];
    uint64_t v23 = (char *)v7 + v20;
    uint64_t v24 = (char *)a2 + v20;
    *(void *)uint64_t v23 = *(void *)v24;
    v23[8] = v24[8];
    uint64_t v25 = a3[10];
    uint64_t v26 = a3[11];
    int v27 = (char *)v7 + v25;
    uint64_t v28 = (char *)a2 + v25;
    uint64_t v29 = *(void *)v28;
    v27[8] = v28[8];
    *(void *)int v27 = v29;
    char v30 = (char *)v7 + v26;
    uint64_t v31 = (char *)a2 + v26;
    v30[8] = v31[8];
    *(void *)char v30 = *(void *)v31;
    uint64_t v32 = a3[12];
    uint64_t v33 = a3[13];
    uint64_t v34 = (char *)v7 + v32;
    char v35 = (char *)a2 + v32;
    v34[8] = v35[8];
    *(void *)uint64_t v34 = *(void *)v35;
    uint64_t v36 = (char *)v7 + v33;
    int v37 = (char *)a2 + v33;
    v36[8] = v37[8];
    *(void *)uint64_t v36 = *(void *)v37;
    uint64_t v38 = a3[14];
    uint64_t v39 = a3[15];
    char v40 = (char *)v7 + v38;
    v41 = (char *)a2 + v38;
    v40[8] = v41[8];
    *(void *)char v40 = *(void *)v41;
    int v42 = (char *)v7 + v39;
    char v43 = (char *)a2 + v39;
    v42[8] = v43[8];
    *(void *)int v42 = *(void *)v43;
    uint64_t v44 = a3[16];
    char v45 = (char *)v7 + v44;
    uint64_t v46 = (char *)a2 + v44;
    v45[8] = v46[8];
    *(void *)char v45 = *(void *)v46;
  }
  return v7;
}

void *initializeWithCopy for IndexReport(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25A82CC10();
  unint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = (char *)a1 + v11;
  uint64_t v14 = (char *)a2 + v11;
  *(void *)uint64_t v13 = *(void *)v14;
  v13[8] = v14[8];
  uint64_t v15 = (char *)a1 + v12;
  uint64_t v16 = (char *)a2 + v12;
  *(void *)uint64_t v15 = *(void *)v16;
  v15[8] = v16[8];
  uint64_t v17 = a3[8];
  uint64_t v18 = a3[9];
  uint64_t v19 = (char *)a1 + v17;
  uint64_t v20 = (char *)a2 + v17;
  *(void *)uint64_t v19 = *(void *)v20;
  v19[8] = v20[8];
  uint64_t v21 = (char *)a1 + v18;
  int v22 = (char *)a2 + v18;
  *(void *)uint64_t v21 = *(void *)v22;
  v21[8] = v22[8];
  uint64_t v23 = a3[10];
  uint64_t v24 = a3[11];
  uint64_t v25 = (char *)a1 + v23;
  uint64_t v26 = (char *)a2 + v23;
  uint64_t v27 = *(void *)v26;
  v25[8] = v26[8];
  *(void *)uint64_t v25 = v27;
  uint64_t v28 = (char *)a1 + v24;
  uint64_t v29 = (char *)a2 + v24;
  v28[8] = v29[8];
  *(void *)uint64_t v28 = *(void *)v29;
  uint64_t v30 = a3[12];
  uint64_t v31 = a3[13];
  uint64_t v32 = (char *)a1 + v30;
  uint64_t v33 = (char *)a2 + v30;
  v32[8] = v33[8];
  *(void *)uint64_t v32 = *(void *)v33;
  uint64_t v34 = (char *)a1 + v31;
  char v35 = (char *)a2 + v31;
  v34[8] = v35[8];
  *(void *)uint64_t v34 = *(void *)v35;
  uint64_t v36 = a3[14];
  uint64_t v37 = a3[15];
  uint64_t v38 = (char *)a1 + v36;
  uint64_t v39 = (char *)a2 + v36;
  v38[8] = v39[8];
  *(void *)uint64_t v38 = *(void *)v39;
  char v40 = (char *)a1 + v37;
  v41 = (char *)a2 + v37;
  v40[8] = v41[8];
  *(void *)char v40 = *(void *)v41;
  uint64_t v42 = a3[16];
  char v43 = (char *)a1 + v42;
  uint64_t v44 = (char *)a2 + v42;
  v43[8] = v44[8];
  *(void *)char v43 = *(void *)v44;
  return a1;
}

void *assignWithCopy for IndexReport(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25A82CC10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  char v13 = v12[8];
  *(void *)uint64_t v11 = *(void *)v12;
  v11[8] = v13;
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  char v17 = v16[8];
  *(void *)uint64_t v15 = *(void *)v16;
  v15[8] = v17;
  uint64_t v18 = a3[8];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  char v21 = v20[8];
  *(void *)uint64_t v19 = *(void *)v20;
  v19[8] = v21;
  uint64_t v22 = a3[9];
  uint64_t v23 = (char *)a1 + v22;
  uint64_t v24 = (char *)a2 + v22;
  char v25 = v24[8];
  *(void *)uint64_t v23 = *(void *)v24;
  v23[8] = v25;
  uint64_t v26 = a3[10];
  uint64_t v27 = (char *)a1 + v26;
  uint64_t v28 = (char *)a2 + v26;
  char v29 = v28[8];
  *(void *)uint64_t v27 = *(void *)v28;
  v27[8] = v29;
  uint64_t v30 = a3[11];
  uint64_t v31 = (char *)a1 + v30;
  uint64_t v32 = (char *)a2 + v30;
  char v33 = v32[8];
  *(void *)uint64_t v31 = *(void *)v32;
  v31[8] = v33;
  uint64_t v34 = a3[12];
  char v35 = (char *)a1 + v34;
  uint64_t v36 = (char *)a2 + v34;
  char v37 = v36[8];
  *(void *)char v35 = *(void *)v36;
  v35[8] = v37;
  uint64_t v38 = a3[13];
  uint64_t v39 = (char *)a1 + v38;
  char v40 = (char *)a2 + v38;
  char v41 = v40[8];
  *(void *)uint64_t v39 = *(void *)v40;
  v39[8] = v41;
  uint64_t v42 = a3[14];
  char v43 = (char *)a1 + v42;
  uint64_t v44 = (char *)a2 + v42;
  char v45 = v44[8];
  *(void *)char v43 = *(void *)v44;
  v43[8] = v45;
  uint64_t v46 = a3[15];
  uint64_t v47 = (char *)a1 + v46;
  uint64_t v48 = (char *)a2 + v46;
  char v49 = v48[8];
  *(void *)uint64_t v47 = *(void *)v48;
  v47[8] = v49;
  uint64_t v50 = a3[16];
  uint64_t v51 = (char *)a1 + v50;
  int v52 = (char *)a2 + v50;
  char v53 = v52[8];
  *(void *)uint64_t v51 = *(void *)v52;
  v51[8] = v53;
  return a1;
}

void *initializeWithTake for IndexReport(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25A82CC10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = (char *)a1 + v10;
  char v13 = (char *)a2 + v10;
  *(void *)uint64_t v12 = *(void *)v13;
  v12[8] = v13[8];
  uint64_t v14 = (char *)a1 + v11;
  uint64_t v15 = (char *)a2 + v11;
  *(void *)uint64_t v14 = *(void *)v15;
  v14[8] = v15[8];
  uint64_t v16 = a3[8];
  uint64_t v17 = a3[9];
  uint64_t v18 = (char *)a1 + v16;
  uint64_t v19 = (char *)a2 + v16;
  *(void *)uint64_t v18 = *(void *)v19;
  v18[8] = v19[8];
  uint64_t v20 = (char *)a1 + v17;
  char v21 = (char *)a2 + v17;
  *(void *)uint64_t v20 = *(void *)v21;
  v20[8] = v21[8];
  uint64_t v22 = a3[10];
  uint64_t v23 = a3[11];
  uint64_t v24 = (char *)a1 + v22;
  char v25 = (char *)a2 + v22;
  uint64_t v26 = *(void *)v25;
  v24[8] = v25[8];
  *(void *)uint64_t v24 = v26;
  uint64_t v27 = (char *)a1 + v23;
  uint64_t v28 = (char *)a2 + v23;
  v27[8] = v28[8];
  *(void *)uint64_t v27 = *(void *)v28;
  uint64_t v29 = a3[12];
  uint64_t v30 = a3[13];
  uint64_t v31 = (char *)a1 + v29;
  uint64_t v32 = (char *)a2 + v29;
  v31[8] = v32[8];
  *(void *)uint64_t v31 = *(void *)v32;
  char v33 = (char *)a1 + v30;
  uint64_t v34 = (char *)a2 + v30;
  v33[8] = v34[8];
  *(void *)char v33 = *(void *)v34;
  uint64_t v35 = a3[14];
  uint64_t v36 = a3[15];
  char v37 = (char *)a1 + v35;
  uint64_t v38 = (char *)a2 + v35;
  v37[8] = v38[8];
  *(void *)char v37 = *(void *)v38;
  uint64_t v39 = (char *)a1 + v36;
  char v40 = (char *)a2 + v36;
  v39[8] = v40[8];
  *(void *)uint64_t v39 = *(void *)v40;
  uint64_t v41 = a3[16];
  uint64_t v42 = (char *)a1 + v41;
  char v43 = (char *)a2 + v41;
  v42[8] = v43[8];
  *(void *)uint64_t v42 = *(void *)v43;
  return a1;
}

void *assignWithTake for IndexReport(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25A82CC10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = (char *)a1 + v10;
  char v13 = (char *)a2 + v10;
  *(void *)uint64_t v12 = *(void *)v13;
  v12[8] = v13[8];
  uint64_t v14 = (char *)a1 + v11;
  uint64_t v15 = (char *)a2 + v11;
  *(void *)uint64_t v14 = *(void *)v15;
  v14[8] = v15[8];
  uint64_t v16 = a3[8];
  uint64_t v17 = a3[9];
  uint64_t v18 = (char *)a1 + v16;
  uint64_t v19 = (char *)a2 + v16;
  *(void *)uint64_t v18 = *(void *)v19;
  v18[8] = v19[8];
  uint64_t v20 = (char *)a1 + v17;
  char v21 = (char *)a2 + v17;
  *(void *)uint64_t v20 = *(void *)v21;
  v20[8] = v21[8];
  uint64_t v22 = a3[10];
  uint64_t v23 = a3[11];
  uint64_t v24 = (char *)a1 + v22;
  char v25 = (char *)a2 + v22;
  uint64_t v26 = *(void *)v25;
  v24[8] = v25[8];
  *(void *)uint64_t v24 = v26;
  uint64_t v27 = (char *)a1 + v23;
  uint64_t v28 = (char *)a2 + v23;
  v27[8] = v28[8];
  *(void *)uint64_t v27 = *(void *)v28;
  uint64_t v29 = a3[12];
  uint64_t v30 = a3[13];
  uint64_t v31 = (char *)a1 + v29;
  uint64_t v32 = (char *)a2 + v29;
  v31[8] = v32[8];
  *(void *)uint64_t v31 = *(void *)v32;
  char v33 = (char *)a1 + v30;
  uint64_t v34 = (char *)a2 + v30;
  v33[8] = v34[8];
  *(void *)char v33 = *(void *)v34;
  uint64_t v35 = a3[14];
  uint64_t v36 = a3[15];
  char v37 = (char *)a1 + v35;
  uint64_t v38 = (char *)a2 + v35;
  v37[8] = v38[8];
  *(void *)char v37 = *(void *)v38;
  uint64_t v39 = (char *)a1 + v36;
  char v40 = (char *)a2 + v36;
  v39[8] = v40[8];
  *(void *)uint64_t v39 = *(void *)v40;
  uint64_t v41 = a3[16];
  uint64_t v42 = (char *)a1 + v41;
  char v43 = (char *)a2 + v41;
  v42[8] = v43[8];
  *(void *)uint64_t v42 = *(void *)v43;
  return a1;
}

uint64_t getEnumTagSinglePayload for IndexReport(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_20Tm);
}

uint64_t storeEnumTagSinglePayload for IndexReport(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_21Tm);
}

uint64_t sub_25A80BB4C()
{
  uint64_t result = sub_25A82CC10();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for SearchReport(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_25A82CC10();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    uint64_t v15 = (char *)v7 + v13;
    uint64_t v16 = (char *)a2 + v13;
    *(void *)uint64_t v15 = *(void *)v16;
    v15[8] = v16[8];
    uint64_t v17 = (char *)v7 + v14;
    uint64_t v18 = (char *)a2 + v14;
    *(void *)uint64_t v17 = *(void *)v18;
    v17[8] = v18[8];
    uint64_t v19 = a3[8];
    uint64_t v20 = a3[9];
    char v21 = (char *)v7 + v19;
    uint64_t v22 = (char *)a2 + v19;
    *(void *)char v21 = *(void *)v22;
    v21[8] = v22[8];
    uint64_t v23 = (char *)v7 + v20;
    uint64_t v24 = (char *)a2 + v20;
    *(void *)uint64_t v23 = *(void *)v24;
    v23[8] = v24[8];
    uint64_t v25 = a3[10];
    uint64_t v26 = a3[11];
    uint64_t v27 = (char *)v7 + v25;
    uint64_t v28 = (char *)a2 + v25;
    uint64_t v29 = *(void *)v28;
    v27[8] = v28[8];
    *(void *)uint64_t v27 = v29;
    uint64_t v30 = (char *)v7 + v26;
    uint64_t v31 = (char *)a2 + v26;
    v30[8] = v31[8];
    *(void *)uint64_t v30 = *(void *)v31;
  }
  return v7;
}

uint64_t _s17PrivateSearchCore11IndexReportVwxx_0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_25A82CC10();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *initializeWithCopy for SearchReport(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25A82CC10();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = (char *)a1 + v11;
  uint64_t v14 = (char *)a2 + v11;
  *(void *)uint64_t v13 = *(void *)v14;
  v13[8] = v14[8];
  uint64_t v15 = (char *)a1 + v12;
  uint64_t v16 = (char *)a2 + v12;
  *(void *)uint64_t v15 = *(void *)v16;
  v15[8] = v16[8];
  uint64_t v17 = a3[8];
  uint64_t v18 = a3[9];
  uint64_t v19 = (char *)a1 + v17;
  uint64_t v20 = (char *)a2 + v17;
  *(void *)uint64_t v19 = *(void *)v20;
  v19[8] = v20[8];
  char v21 = (char *)a1 + v18;
  uint64_t v22 = (char *)a2 + v18;
  *(void *)char v21 = *(void *)v22;
  v21[8] = v22[8];
  uint64_t v23 = a3[10];
  uint64_t v24 = a3[11];
  uint64_t v25 = (char *)a1 + v23;
  uint64_t v26 = (char *)a2 + v23;
  uint64_t v27 = *(void *)v26;
  v25[8] = v26[8];
  *(void *)uint64_t v25 = v27;
  uint64_t v28 = (char *)a1 + v24;
  uint64_t v29 = (char *)a2 + v24;
  v28[8] = v29[8];
  *(void *)uint64_t v28 = *(void *)v29;
  return a1;
}

void *assignWithCopy for SearchReport(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25A82CC10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  char v13 = v12[8];
  *(void *)uint64_t v11 = *(void *)v12;
  v11[8] = v13;
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  char v17 = v16[8];
  *(void *)uint64_t v15 = *(void *)v16;
  v15[8] = v17;
  uint64_t v18 = a3[8];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  char v21 = v20[8];
  *(void *)uint64_t v19 = *(void *)v20;
  v19[8] = v21;
  uint64_t v22 = a3[9];
  uint64_t v23 = (char *)a1 + v22;
  uint64_t v24 = (char *)a2 + v22;
  char v25 = v24[8];
  *(void *)uint64_t v23 = *(void *)v24;
  v23[8] = v25;
  uint64_t v26 = a3[10];
  uint64_t v27 = (char *)a1 + v26;
  uint64_t v28 = (char *)a2 + v26;
  char v29 = v28[8];
  *(void *)uint64_t v27 = *(void *)v28;
  v27[8] = v29;
  uint64_t v30 = a3[11];
  uint64_t v31 = (char *)a1 + v30;
  uint64_t v32 = (char *)a2 + v30;
  char v33 = v32[8];
  *(void *)uint64_t v31 = *(void *)v32;
  v31[8] = v33;
  return a1;
}

void *initializeWithTake for SearchReport(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25A82CC10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = (char *)a1 + v10;
  char v13 = (char *)a2 + v10;
  *(void *)uint64_t v12 = *(void *)v13;
  v12[8] = v13[8];
  uint64_t v14 = (char *)a1 + v11;
  uint64_t v15 = (char *)a2 + v11;
  *(void *)uint64_t v14 = *(void *)v15;
  v14[8] = v15[8];
  uint64_t v16 = a3[8];
  uint64_t v17 = a3[9];
  uint64_t v18 = (char *)a1 + v16;
  uint64_t v19 = (char *)a2 + v16;
  *(void *)uint64_t v18 = *(void *)v19;
  v18[8] = v19[8];
  uint64_t v20 = (char *)a1 + v17;
  char v21 = (char *)a2 + v17;
  *(void *)uint64_t v20 = *(void *)v21;
  v20[8] = v21[8];
  uint64_t v22 = a3[10];
  uint64_t v23 = a3[11];
  uint64_t v24 = (char *)a1 + v22;
  char v25 = (char *)a2 + v22;
  uint64_t v26 = *(void *)v25;
  v24[8] = v25[8];
  *(void *)uint64_t v24 = v26;
  uint64_t v27 = (char *)a1 + v23;
  uint64_t v28 = (char *)a2 + v23;
  v27[8] = v28[8];
  *(void *)uint64_t v27 = *(void *)v28;
  return a1;
}

void *assignWithTake for SearchReport(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25A82CC10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = (char *)a1 + v10;
  char v13 = (char *)a2 + v10;
  *(void *)uint64_t v12 = *(void *)v13;
  v12[8] = v13[8];
  uint64_t v14 = (char *)a1 + v11;
  uint64_t v15 = (char *)a2 + v11;
  *(void *)uint64_t v14 = *(void *)v15;
  v14[8] = v15[8];
  uint64_t v16 = a3[8];
  uint64_t v17 = a3[9];
  uint64_t v18 = (char *)a1 + v16;
  uint64_t v19 = (char *)a2 + v16;
  *(void *)uint64_t v18 = *(void *)v19;
  v18[8] = v19[8];
  uint64_t v20 = (char *)a1 + v17;
  char v21 = (char *)a2 + v17;
  *(void *)uint64_t v20 = *(void *)v21;
  v20[8] = v21[8];
  uint64_t v22 = a3[10];
  uint64_t v23 = a3[11];
  uint64_t v24 = (char *)a1 + v22;
  char v25 = (char *)a2 + v22;
  uint64_t v26 = *(void *)v25;
  v24[8] = v25[8];
  *(void *)uint64_t v24 = v26;
  uint64_t v27 = (char *)a1 + v23;
  uint64_t v28 = (char *)a2 + v23;
  v27[8] = v28[8];
  *(void *)uint64_t v27 = *(void *)v28;
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchReport(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A80C300);
}

uint64_t __swift_get_extra_inhabitant_index_20Tm(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_25A82CC10();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for SearchReport(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A80C3C8);
}

void *__swift_store_extra_inhabitant_index_21Tm(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_25A82CC10();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_25A80C474()
{
  uint64_t result = sub_25A82CC10();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for BenchmarkReport(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_25A82CC10();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t destroy for BenchmarkReport(uint64_t a1)
{
  uint64_t v2 = sub_25A82CC10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_release();
}

uint64_t initializeWithCopy for BenchmarkReport(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A82CC10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for BenchmarkReport(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A82CC10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for BenchmarkReport(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A82CC10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for BenchmarkReport(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A82CC10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for BenchmarkReport(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A80C884);
}

uint64_t sub_25A80C884(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A82CC10();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for BenchmarkReport(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A80C958);
}

uint64_t sub_25A80C958(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_25A82CC10();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_25A80CA14()
{
  uint64_t result = sub_25A82CC10();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25A80CAAC()
{
  return type metadata accessor for BenchmarkReport._StorageClass(0);
}

void sub_25A80CAB4()
{
  sub_25A80CC20(319, &qword_26A465CD0, (void (*)(uint64_t))type metadata accessor for BenchmarkConfig);
  if (v0 <= 0x3F)
  {
    sub_25A80CC20(319, &qword_26A465CD8, (void (*)(uint64_t))type metadata accessor for IndexReport);
    if (v1 <= 0x3F)
    {
      sub_25A80CC20(319, &qword_26A465CE0, (void (*)(uint64_t))type metadata accessor for SearchReport);
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_25A80CC20(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_25A82D1E0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_25A80CC74()
{
  unint64_t result = qword_26A465D08;
  if (!qword_26A465D08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A465D08);
  }
  return result;
}

uint64_t sub_25A80CCC8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

const char *BitArray.kBitsInByte.unsafeMutableAddressor()
{
  return "\b";
}

uint64_t static BitArray.kBitsInByte.getter()
{
  return 8;
}

void *BitArray.kDefaultNumberOfBytes.unsafeMutableAddressor()
{
  return &static BitArray.kDefaultNumberOfBytes;
}

uint64_t static BitArray.kDefaultNumberOfBytes.getter()
{
  return 0x2000;
}

unint64_t BitArray.init(hex:)()
{
  unint64_t v0 = _s17PrivateSearchCore8HexCodecV04fromD0ySays5UInt8VGSSFZ_0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t BitArray.init(numBytes:defaultBitValue:)(size_t a1, int a2)
{
  if ((a1 & 0x8000000000000000) != 0)
  {
    uint64_t result = sub_25A82D2F0();
    __break(1u);
  }
  else
  {
    if (!a1) {
      return MEMORY[0x263F8EE78];
    }
    int v3 = a2 << 31 >> 31;
    uint64_t v4 = sub_25A82D000();
    *(void *)(v4 + 16) = a1;
    memset((void *)(v4 + 32), v3, a1);
    return v4;
  }
  return result;
}

uint64_t BitArray.init(numBits:defaultBitValue:)(uint64_t a1, int a2)
{
  uint64_t v2 = a1 + 8;
  if (__OFADD__(a1, 8))
  {
    __break(1u);
LABEL_10:
    uint64_t result = sub_25A82D2F0();
    __break(1u);
    return result;
  }
  uint64_t v3 = a1 + 7;
  if (v2 < 1) {
    uint64_t v3 = a1 + 14;
  }
  if (v2 <= -7) {
    goto LABEL_10;
  }
  if (v2 < 9) {
    return MEMORY[0x263F8EE78];
  }
  size_t v4 = v3 >> 3;
  int v5 = a2 << 31 >> 31;
  uint64_t v6 = sub_25A82D000();
  *(void *)(v6 + 16) = v4;
  memset((void *)(v6 + 32), v5, v4);
  return v6;
}

uint64_t static BitArray.bitsToBytes(_:)(uint64_t result)
{
  if (__OFADD__(result, 8))
  {
    __break(1u);
  }
  else
  {
    uint64_t v1 = result + 14;
    if (result + 8 >= 1) {
      uint64_t v1 = result + 7;
    }
    return v1 >> 3;
  }
  return result;
}

uint64_t static BitArray.bytesToBits(_:)(uint64_t result)
{
  if ((unint64_t)(result - 0x1000000000000000) >> 61 == 7) {
    result *= 8;
  }
  else {
    __break(1u);
  }
  return result;
}

uint64_t BitArray.numBytes.getter(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t BitArray.numBits.getter(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 16);
  if (!(v1 >> 60)) {
    return 8 * v1;
  }
  __break(1u);
  return result;
}

uint64_t static BitArray.random(_:)(size_t a1)
{
  if ((a1 & 0x8000000000000000) != 0)
  {
LABEL_10:
    uint64_t result = sub_25A82D2F0();
    __break(1u);
    return result;
  }
  if (a1)
  {
    uint64_t v2 = sub_25A82D000();
    *(void *)(v2 + 16) = a1;
    bzero((void *)(v2 + 32), a1);
    unint64_t v3 = 0;
    while (1)
    {
      uint64_t v5 = 0;
      MEMORY[0x2611464A0](&v5, 8);
      if (v3 >= *(void *)(v2 + 16)) {
        break;
      }
      *(unsigned char *)(v2 + v3++ + 32) = v5;
      if (a1 == v3) {
        return v2;
      }
    }
    __break(1u);
    goto LABEL_10;
  }
  return MEMORY[0x263F8EE78];
}

BOOL BitArray.innerProduct(_:)(int8x16_t *a1, int8x16_t *a2)
{
  unint64_t v2 = a2[1].u64[0];
  if (a1[1].i64[0] < v2) {
    unint64_t v2 = a1[1].u64[0];
  }
  if (!v2)
  {
    unsigned int v3 = 0;
    return ((((v3 >> 2) ^ (v3 >> 1) ^ (v3 >> 3) ^ (v3 >> 4) ^ (v3 >> 5) ^ (v3 >> 6)) ^ v3) & 1) != v3 >> 7;
  }
  if (v2 < 8)
  {
    unsigned int v3 = 0;
    uint64_t v4 = 0;
    goto LABEL_16;
  }
  if (v2 >= 0x20)
  {
    uint64_t v4 = v2 & 0x7FFFFFFFFFFFFFE0;
    uint64_t v5 = a2 + 3;
    uint64_t v6 = a1 + 3;
    int8x16_t v7 = 0uLL;
    uint64_t v8 = v2 & 0x7FFFFFFFFFFFFFE0;
    int8x16_t v9 = 0uLL;
    do
    {
      int8x16_t v7 = veorq_s8(vandq_s8(v6[-1], v5[-1]), v7);
      int8x16_t v9 = veorq_s8(vandq_s8(*v6, *v5), v9);
      v5 += 2;
      v6 += 2;
      v8 -= 32;
    }
    while (v8);
    int8x16_t v10 = veorq_s8(v9, v7);
    *(int8x8_t *)v10.i8 = veor_s8(*(int8x8_t *)v10.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL));
    unint64_t v11 = v10.i64[0] ^ HIDWORD(v10.i64[0]) ^ ((unint64_t)(v10.i64[0] ^ HIDWORD(v10.i64[0])) >> 16);
    unsigned int v3 = v11 ^ (v11 >> 8);
    if (v2 == v4) {
      return ((((v3 >> 2) ^ (v3 >> 1) ^ (v3 >> 3) ^ (v3 >> 4) ^ (v3 >> 5) ^ (v3 >> 6)) ^ v3) & 1) != v3 >> 7;
    }
    if ((v2 & 0x18) == 0)
    {
LABEL_16:
      unint64_t v21 = v2 - v4;
      uint64_t v22 = v4 + 32;
      uint64_t v23 = &a1[2].u8[v4];
      uint64_t v24 = &a2->u8[v22];
      do
      {
        int v26 = *v24++;
        int v25 = v26;
        int v27 = *v23++;
        v3 ^= v27 & v25;
        --v21;
      }
      while (v21);
      return ((((v3 >> 2) ^ (v3 >> 1) ^ (v3 >> 3) ^ (v3 >> 4) ^ (v3 >> 5) ^ (v3 >> 6)) ^ v3) & 1) != v3 >> 7;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
    uint64_t v4 = 0;
  }
  uint64_t v12 = v4;
  uint64_t v4 = v2 & 0x7FFFFFFFFFFFFFF8;
  int8x8_t v13 = (int8x8_t)v3;
  uint64_t v14 = (int8x8_t *)&a2[2].i8[v12];
  uint64_t v15 = (int8x8_t *)&a1[2].i8[v12];
  unint64_t v16 = v12 - (v2 & 0x7FFFFFFFFFFFFFF8);
  do
  {
    int8x8_t v17 = *v14++;
    int8x8_t v18 = v17;
    int8x8_t v19 = *v15++;
    int8x8_t v13 = veor_s8(vand_s8(v19, v18), v13);
    v16 += 8;
  }
  while (v16);
  unint64_t v20 = *(void *)&v13 ^ HIDWORD(*(void *)&v13) ^ ((*(void *)&v13 ^ HIDWORD(*(void *)&v13)) >> 16);
  unsigned int v3 = v20 ^ (v20 >> 8);
  if (v2 != v4) {
    goto LABEL_16;
  }
  return ((((v3 >> 2) ^ (v3 >> 1) ^ (v3 >> 3) ^ (v3 >> 4) ^ (v3 >> 5) ^ (v3 >> 6)) ^ v3) & 1) != v3 >> 7;
}

char *BitArray.setRange(startBit:endBit:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = a1 + 8;
  if (__OFADD__(a1, 8))
  {
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  uint64_t v11 = a1 + 7;
  if (v10 < 1) {
    uint64_t v11 = a1 + 14;
  }
  uint64_t v6 = a2 + 8;
  if (__OFADD__(a2, 8)) {
    goto LABEL_35;
  }
  uint64_t v9 = v11 >> 3;
  uint64_t v12 = a2 + 7;
  if (v6 < 1) {
    uint64_t v12 = a2 + 14;
  }
  uint64_t v7 = v12 >> 3;
  if (a2 <= 0) {
    uint64_t v4 = -(-a2 & 7);
  }
  else {
    uint64_t v4 = a2 & 7;
  }
  if (v7 <= v9) {
    goto LABEL_36;
  }
  unsigned int v3 = (char *)a3;
  uint64_t v8 = v7 - 1;
  size_t v5 = v7 - 1 - v9;
  if (v7 - 1 != v9)
  {
    if (v7 - 1 <= v9) {
      goto LABEL_40;
    }
    if (v10 < -6) {
      goto LABEL_41;
    }
    uint64_t v13 = *(void *)(a3 + 16);
    if (v7 - 2 >= v13 || v6 < 17 || v9 >= v13) {
      goto LABEL_42;
    }
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      goto LABEL_43;
    }
    goto LABEL_19;
  }
  swift_bridgeObjectRetain();
  while (v4 < 0)
  {
LABEL_37:
    __break(1u);
LABEL_38:
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
    unsigned int v3 = sub_25A7FE8D8((uint64_t)v3);
LABEL_19:
    memset(&v3[v9 + 32], 255, v5);
  }
  size_t v5 = 1;
  switch(v4)
  {
    case 0:
      size_t v5 = 0;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        goto LABEL_23;
      }
      goto LABEL_31;
    case 1:
      goto LABEL_30;
    case 2:
      size_t v5 = 3;
      goto LABEL_30;
    case 3:
      size_t v5 = 7;
      goto LABEL_30;
    case 4:
      size_t v5 = 15;
      goto LABEL_30;
    case 5:
      size_t v5 = 31;
      goto LABEL_30;
    case 6:
      size_t v5 = 63;
      goto LABEL_30;
    default:
      size_t v5 = 127;
LABEL_30:
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_23:
      }
        unsigned int v3 = sub_25A7FE8D8((uint64_t)v3);
LABEL_31:
      if (v6 < 9) {
        goto LABEL_38;
      }
      if (v7 > *((void *)v3 + 2)) {
        goto LABEL_39;
      }
      v3[v8 + 32] |= v5;
      return v3;
  }
}

uint64_t BitArray.and(_:)(int8x16_t *a1, int8x16_t *a2)
{
  unint64_t v4 = a2[1].u64[0];
  unint64_t v5 = a1[1].u64[0];
  if (v5 >= v4) {
    uint64_t v6 = a2[1].i64[0];
  }
  else {
    uint64_t v6 = a1[1].i64[0];
  }
  if (v5 <= v4) {
    size_t v7 = a2[1].u64[0];
  }
  else {
    size_t v7 = a1[1].u64[0];
  }
  uint64_t v8 = sub_25A7FDEB0(0, v7);
  if (v6)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      goto LABEL_26;
    }
    while (1)
    {
      unint64_t v9 = *(void *)(v8 + 16);
      unint64_t v10 = v6 - 1;
      if (v6 - 1 >= v9) {
        unint64_t v10 = *(void *)(v8 + 16);
      }
      if (v10 >= 0x10)
      {
        uint64_t v12 = (int8x16_t *)(v8 + 32);
        if ((unint64_t)(v8 - (void)a2) >= 0x10 && (unint64_t)(v8 - (void)a1) >= 0x10)
        {
          unint64_t v14 = v10 + 1;
          uint64_t v15 = v14 & 0xF;
          if ((v14 & 0xF) == 0) {
            uint64_t v15 = 16;
          }
          unint64_t v11 = v14 - v15;
          unint64_t v16 = v11;
          int8x8_t v17 = a1 + 2;
          int8x8_t v18 = a2 + 2;
          do
          {
            int8x16_t v19 = *v18++;
            int8x16_t v20 = v19;
            int8x16_t v21 = *v17++;
            *v12++ = vandq_s8(v21, v20);
            v16 -= 16;
          }
          while (v16);
        }
        else
        {
          unint64_t v11 = 0;
        }
      }
      else
      {
        unint64_t v11 = 0;
      }
      while (v11 < v9)
      {
        *(unsigned char *)(v8 + v11 + 32) = a1[2].i8[v11] & a2[2].i8[v11];
        if (v6 == ++v11) {
          return v8;
        }
      }
      __break(1u);
LABEL_26:
      uint64_t v8 = (uint64_t)sub_25A7FE8D8(v8);
    }
  }
  return v8;
}

Swift::Void __swiftcall BitArray.setBit(_:_:)(Swift::Int a1, Swift::Bool a2)
{
  if (a1 < 0) {
    return;
  }
  unint64_t v5 = *v2;
  unint64_t v6 = *((void *)*v2 + 2);
  if (v6 >> 60)
  {
    __break(1u);
    goto LABEL_17;
  }
  LOBYTE(v3) = a1;
  if (a1 >= 8 * v6) {
    return;
  }
  unint64_t v4 = (unint64_t)a1 >> 3;
  BOOL v7 = (unint64_t)a1 >> 3 >= v6;
  if (!a2) {
    goto LABEL_9;
  }
  if ((unint64_t)a1 >> 3 >= v6)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  int v3 = v5[v4 + 32] | (1 << (a1 & 7));
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_19;
  }
  while (1)
  {
    unint64_t v8 = *((void *)v5 + 2);
    BOOL v7 = v4 >= v8;
    if (v4 < v8) {
      goto LABEL_14;
    }
    __break(1u);
LABEL_9:
    if (!v7) {
      break;
    }
LABEL_18:
    __break(1u);
LABEL_19:
    unint64_t v5 = sub_25A7FE8D8((uint64_t)v5);
  }
  int v9 = v5[v4 + 32];
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v5 = sub_25A7FE8D8((uint64_t)v5);
  }
  if (v4 < *((void *)v5 + 2))
  {
    int v3 = v9 & ~(1 << (v3 & 7));
LABEL_14:
    v5[v4 + 32] = v3;
    int *v2 = v5;
    return;
  }
  __break(1u);
}

Swift::Bool __swiftcall BitArray.isBitSet(_:)(Swift::Int a1)
{
  if (a1 < 0) {
    goto LABEL_6;
  }
  unint64_t v2 = *(void *)(v1 + 16);
  if (v2 >> 60)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (a1 >= 8 * v2)
  {
LABEL_6:
    LOBYTE(a1) = 0;
    return a1;
  }
  if ((unint64_t)a1 >> 3 >= v2)
  {
LABEL_8:
    __break(1u);
    return a1;
  }
  LODWORD(a1) = (*(unsigned __int8 *)(v1 + ((unint64_t)a1 >> 3) + 32) >> (a1 & 7)) & 1;
  return a1;
}

Swift::Void __swiftcall BitArray.xorBit(_:_:)(Swift::Int a1, Swift::Bool a2)
{
  if ((a1 & 0x8000000000000000) == 0)
  {
    unint64_t v6 = *v3;
    unint64_t v7 = *((void *)*v3 + 2);
    if (v7 >> 60)
    {
      __break(1u);
      goto LABEL_11;
    }
    char v2 = a1;
    if (a1 < 8 * v7 && a2)
    {
      unint64_t v4 = (unint64_t)a1 >> 3;
      if ((unint64_t)a1 >> 3 < v7)
      {
        char v5 = v6[v4 + 32];
        if (swift_isUniquelyReferenced_nonNull_native()) {
          goto LABEL_7;
        }
        goto LABEL_12;
      }
LABEL_11:
      __break(1u);
LABEL_12:
      unint64_t v6 = sub_25A7FE8D8((uint64_t)v6);
LABEL_7:
      if (v4 >= *((void *)v6 + 2))
      {
        __break(1u);
      }
      else
      {
        v6[v4 + 32] = v5 ^ (1 << (v2 & 7));
        char *v3 = v6;
      }
    }
  }
}

char *BitArray.xor(_:)(int8x16_t *a1, int8x16_t *a2)
{
  unint64_t v2 = a2[1].u64[0];
  unint64_t v3 = a1[1].u64[0];
  if (v3 >= v2) {
    unint64_t v4 = a2;
  }
  else {
    unint64_t v4 = a1;
  }
  if (v3 >= v2) {
    char v5 = (char *)a1;
  }
  else {
    char v5 = (char *)a2;
  }
  unint64_t v6 = v4[1].u64[0];
  if (v6)
  {
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_36:
    }
      char v5 = sub_25A7FE8D8((uint64_t)v5);
    unint64_t v7 = v4 + 2;
    unint64_t v8 = *((void *)v5 + 2);
    unint64_t v9 = v6 - 1;
    if (v8 >= v6 - 1) {
      unint64_t v10 = v6 - 1;
    }
    else {
      unint64_t v10 = *((void *)v5 + 2);
    }
    if (v10 <= 0xF) {
      goto LABEL_25;
    }
    unint64_t v11 = (int8x16_t *)(v5 + 32);
    if (v8 < v9) {
      unint64_t v9 = *((void *)v5 + 2);
    }
    unint64_t v12 = v9 + 33;
    if (v11 >= (int8x16_t *)&v4->i8[v12] || v7 >= (int8x16_t *)&v5[v12])
    {
      unint64_t v14 = v10 + 1;
      uint64_t v15 = v14 & 0xF;
      if ((v14 & 0xF) == 0) {
        uint64_t v15 = 16;
      }
      unint64_t v16 = v14 - v15;
      unint64_t v17 = v16;
      int8x8_t v18 = v4 + 2;
      do
      {
        int8x16_t v19 = *v18++;
        *unint64_t v11 = veorq_s8(*v11, v19);
        ++v11;
        v17 -= 16;
      }
      while (v17);
    }
    else
    {
LABEL_25:
      unint64_t v16 = 0;
    }
    do
    {
      if (v16 >= v8) {
        goto LABEL_35;
      }
      v5[v16 + 32] ^= v7->u8[v16];
      ++v16;
    }
    while (v6 != v16);
    if (v8 < v6)
    {
      __break(1u);
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
  }
  else
  {
    unint64_t v8 = *((void *)v5 + 2);
    swift_bridgeObjectRetain();
  }
  if (v6 == v8) {
    return v5;
  }
  if (v6 >= v8)
  {
    __break(1u);
  }
  else if (swift_isUniquelyReferenced_nonNull_native())
  {
    return v5;
  }
  return sub_25A7FE8D8((uint64_t)v5);
}

uint64_t static BitArray.== infix(_:_:)(uint64_t result, uint64_t a2)
{
  unint64_t v2 = *(void *)(result + 16);
  if (v2 >> 60)
  {
    __break(1u);
    goto LABEL_7;
  }
  unint64_t v3 = *(void *)(a2 + 16);
  if (v3 >> 60)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  return v2 == v3 && sub_25A80D8F8(result, a2);
}

BOOL sub_25A80D8F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (*(unsigned __int8 *)(a1 + 32) != *(unsigned __int8 *)(a2 + 32)) {
    return 0;
  }
  unint64_t v3 = (unsigned __int8 *)(a1 + 33);
  unint64_t v4 = (unsigned __int8 *)(a2 + 33);
  uint64_t v5 = v2 - 1;
  do
  {
    BOOL result = v5 == 0;
    if (!v5) {
      break;
    }
    int v8 = *v3++;
    int v7 = v8;
    int v9 = *v4++;
    --v5;
  }
  while (v7 == v9);
  return result;
}

uint64_t sub_25A80D964(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TestDataBundle.SearchingData.Token(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  int v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  unint64_t v10 = (char *)&v30 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 == *(void *)(a2 + 16))
  {
    if (v11 && a1 != a2)
    {
      unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      uint64_t v13 = *(void *)(v8 + 72);
      uint64_t v14 = v11 - 1;
      while (1)
      {
        sub_25A80E080(a1 + v12, (uint64_t)v10, type metadata accessor for TestDataBundle.SearchingData.Token);
        sub_25A80E080(a2 + v12, (uint64_t)v7, type metadata accessor for TestDataBundle.SearchingData.Token);
        uint64_t v15 = *(int *)(v4 + 20);
        unint64_t v16 = &v10[v15];
        uint64_t v17 = *(void *)&v10[v15 + 8];
        int8x8_t v18 = &v7[v15];
        uint64_t v19 = *((void *)v18 + 1);
        if (v17)
        {
          if (!v19) {
            goto LABEL_27;
          }
          BOOL v20 = *(void *)v16 == *(void *)v18 && v17 == v19;
          if (!v20 && (sub_25A82D370() & 1) == 0) {
            goto LABEL_27;
          }
        }
        else if (v19)
        {
          goto LABEL_27;
        }
        uint64_t v21 = *(int *)(v4 + 24);
        uint64_t v22 = &v10[v21];
        char v23 = v10[v21 + 4];
        uint64_t v24 = &v7[v21];
        int v25 = v7[v21 + 4];
        if (v23)
        {
          if (!v25) {
            goto LABEL_27;
          }
        }
        else
        {
          if (*(_DWORD *)v22 != *(_DWORD *)v24) {
            LOBYTE(v25) = 1;
          }
          if (v25)
          {
LABEL_27:
            sub_25A80E0E8((uint64_t)v7, type metadata accessor for TestDataBundle.SearchingData.Token);
            sub_25A80E0E8((uint64_t)v10, type metadata accessor for TestDataBundle.SearchingData.Token);
            goto LABEL_28;
          }
        }
        sub_25A82CC10();
        sub_25A80E028();
        char v26 = sub_25A82CE40();
        sub_25A80E0E8((uint64_t)v7, type metadata accessor for TestDataBundle.SearchingData.Token);
        sub_25A80E0E8((uint64_t)v10, type metadata accessor for TestDataBundle.SearchingData.Token);
        BOOL v28 = v14-- != 0;
        if (v26)
        {
          v12 += v13;
          if (v28) {
            continue;
          }
        }
        return v26 & 1;
      }
    }
    char v26 = 1;
  }
  else
  {
LABEL_28:
    char v26 = 0;
  }
  return v26 & 1;
}

uint64_t sub_25A80DBC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (int *)type metadata accessor for TestDataBundle.IndexingData.Document(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  int v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  unint64_t v10 = (char *)&v37 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 == *(void *)(a2 + 16))
  {
    if (v11 && a1 != a2)
    {
      unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      uint64_t v13 = *(void *)(v8 + 72);
      uint64_t v14 = v11 - 1;
      while (1)
      {
        sub_25A80E080(a1 + v12, (uint64_t)v10, type metadata accessor for TestDataBundle.IndexingData.Document);
        sub_25A80E080(a2 + v12, (uint64_t)v7, type metadata accessor for TestDataBundle.IndexingData.Document);
        uint64_t v15 = v4[5];
        unint64_t v16 = &v10[v15];
        uint64_t v17 = *(void *)&v10[v15 + 8];
        int8x8_t v18 = &v7[v15];
        uint64_t v19 = *((void *)v18 + 1);
        if (v17)
        {
          if (!v19
            || (*(void *)v16 == *(void *)v18 ? (BOOL v20 = v17 == v19) : (BOOL v20 = 0), !v20 && (sub_25A82D370() & 1) == 0))
          {
LABEL_39:
            sub_25A80E0E8((uint64_t)v7, type metadata accessor for TestDataBundle.IndexingData.Document);
            sub_25A80E0E8((uint64_t)v10, type metadata accessor for TestDataBundle.IndexingData.Document);
            goto LABEL_40;
          }
        }
        else if (v19)
        {
          goto LABEL_39;
        }
        uint64_t v21 = v4[6];
        uint64_t v22 = &v10[v21];
        uint64_t v23 = *(void *)&v10[v21 + 8];
        uint64_t v24 = &v7[v21];
        uint64_t v25 = *((void *)v24 + 1);
        if (v23)
        {
          if (!v25) {
            goto LABEL_39;
          }
          BOOL v26 = *(void *)v22 == *(void *)v24 && v23 == v25;
          if (!v26 && (sub_25A82D370() & 1) == 0) {
            goto LABEL_39;
          }
        }
        else if (v25)
        {
          goto LABEL_39;
        }
        uint64_t v27 = v4[7];
        BOOL v28 = &v10[v27];
        uint64_t v29 = *(void *)&v10[v27 + 8];
        uint64_t v30 = &v7[v27];
        uint64_t v31 = *((void *)v30 + 1);
        if (v29)
        {
          if (!v31) {
            goto LABEL_39;
          }
          BOOL v32 = *(void *)v28 == *(void *)v30 && v29 == v31;
          if (!v32 && (sub_25A82D370() & 1) == 0) {
            goto LABEL_39;
          }
        }
        else if (v31)
        {
          goto LABEL_39;
        }
        sub_25A82CC10();
        sub_25A80E028();
        char v33 = sub_25A82CE40();
        sub_25A80E0E8((uint64_t)v7, type metadata accessor for TestDataBundle.IndexingData.Document);
        sub_25A80E0E8((uint64_t)v10, type metadata accessor for TestDataBundle.IndexingData.Document);
        BOOL v35 = v14-- != 0;
        if (v33)
        {
          v12 += v13;
          if (v35) {
            continue;
          }
        }
        return v33 & 1;
      }
    }
    char v33 = 1;
  }
  else
  {
LABEL_40:
    char v33 = 0;
  }
  return v33 & 1;
}

uint64_t sub_25A80DE80(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = sub_25A82D370(), uint64_t result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    uint64_t v9 = a2 + 7;
    for (i = a1 + 7; ; i += 2)
    {
      BOOL v11 = *(i - 1) == *(v9 - 1) && *i == *v9;
      if (!v11 && (sub_25A82D370() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t BitArray.debugDescription.getter()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = _s17PrivateSearchCore8HexCodecV02toD0ySSSays5UInt8VGFZ_0(v0);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_25A80DF90(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  unint64_t v3 = *(void *)(result + 16);
  if (v3 >> 60)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v4 = *a2;
  unint64_t v5 = *(void *)(v4 + 16);
  if (v5 >> 60)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  return v3 == v5 && sub_25A80D8F8(result, v4);
}

uint64_t sub_25A80DFCC()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = _s17PrivateSearchCore8HexCodecV02toD0ySSSays5UInt8VGFZ_0(v0);
  swift_bridgeObjectRelease();
  return v1;
}

ValueMetadata *type metadata accessor for BitArray()
{
  return &type metadata for BitArray;
}

unint64_t sub_25A80E028()
{
  unint64_t result = qword_26A465D10;
  if (!qword_26A465D10)
  {
    sub_25A82CC10();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A465D10);
  }
  return result;
}

uint64_t sub_25A80E080(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25A80E0E8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *BloomFilter.kDefaultLevel0MaxTerms.unsafeMutableAddressor()
{
  return &static BloomFilter.kDefaultLevel0MaxTerms;
}

uint64_t static BloomFilter.kDefaultLevel0MaxTerms.getter()
{
  return 22;
}

uint64_t BloomFilter.init(bitArray:secret:numHashes:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_25A80E644(a3, a2);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t static BloomFilter.hash(token:seed:)()
{
  sub_25A82D350();
  sub_25A82CF40();
  sub_25A82D350();
  sub_25A82CF40();
  swift_bridgeObjectRelease();
  uint64_t v0 = sub_25A810684();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v0 & 0x8000000000000000) == 0) {
    return v0;
  }
  __break(1u);
  return result;
}

uint64_t static BloomFilter.hash(token:numHashes:secret:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = sub_25A80E644(a3, a4);
  uint64_t v7 = _s17PrivateSearchCore11BloomFilterV4hash5tokenSays6UInt64VGSS_tF_0(a1, a2, v6);
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t BloomFilter.bitArray.getter()
{
  return swift_bridgeObjectRetain();
}

Swift::Void __swiftcall BloomFilter.addAll(_:)(Swift::OpaquePointer a1)
{
  uint64_t v1 = *((void *)a1._rawValue + 2);
  if (v1)
  {
    uint64_t v2 = swift_bridgeObjectRetain() + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_25A80E364();
      swift_bridgeObjectRelease();
      v2 += 16;
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
  }
}

void sub_25A80E364()
{
  uint64_t v1 = *(void *)(*v0 + 16);
  if (!v1) {
    return;
  }
  uint64_t v2 = (char *)v0[1];
  swift_bridgeObjectRetain();
  uint64_t v9 = v0;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_17:
  }
    uint64_t v2 = sub_25A7FE8D8((uint64_t)v2);
  uint64_t v3 = 0;
  while (1)
  {
    sub_25A82D350();
    sub_25A82CF40();
    sub_25A82D350();
    sub_25A82CF40();
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_25A810684();
    swift_bridgeObjectRelease();
    if (v4 < 0)
    {
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }
    unint64_t v5 = *((void *)v2 + 2);
    if (v5 >> 60) {
      goto LABEL_15;
    }
    uint64_t v6 = 8 * v5;
    if (!(8 * v5)) {
      goto LABEL_16;
    }
    if ((v6 & 0x8000000000000000) == 0) {
      break;
    }
LABEL_5:
    if (v1 == ++v3) {
      goto LABEL_12;
    }
  }
  uint64_t v7 = v4 % v6;
  unint64_t v8 = (unint64_t)(v4 % v6) >> 3;
  if (v8 < v5)
  {
    v2[v8 + 32] |= 1 << (v7 & 7);
    goto LABEL_5;
  }
  __break(1u);
LABEL_12:
  swift_bridgeObjectRelease();
  v9[1] = v2;
}

Swift::Bool __swiftcall BloomFilter.contains(_:)(Swift::String a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    unint64_t v4 = *(void *)(v2 + 16);
    if (!(v4 >> 60))
    {
      uint64_t v5 = 8 * v4;
      if (!(8 * v4))
      {
LABEL_18:
        __break(1u);
        return a1._countAndFlagsBits;
      }
      uint64_t v6 = v2 + 32;
      swift_bridgeObjectRetain();
      uint64_t v7 = 0;
      while (1)
      {
        sub_25A82D350();
        sub_25A82CF40();
        sub_25A82D350();
        sub_25A82CF40();
        swift_bridgeObjectRelease();
        uint64_t v8 = sub_25A810684();
        LOBYTE(a1._countAndFlagsBits) = swift_bridgeObjectRelease();
        if (v8 < 0) {
          break;
        }
        if (v5 < 0) {
          goto LABEL_11;
        }
        unint64_t v9 = (unint64_t)(v8 % v5) >> 3;
        if (v9 >= v4) {
          goto LABEL_16;
        }
        if (((*(unsigned __int8 *)(v6 + v9) >> ((v8 % v5) & 7)) & 1) == 0)
        {
LABEL_11:
          char v10 = 0;
          goto LABEL_12;
        }
        if (v3 == ++v7)
        {
          char v10 = 1;
LABEL_12:
          swift_bridgeObjectRelease();
          goto LABEL_14;
        }
      }
      __break(1u);
LABEL_16:
      __break(1u);
    }
    __break(1u);
    goto LABEL_18;
  }
  char v10 = 1;
LABEL_14:
  LOBYTE(a1._countAndFlagsBits) = v10;
  return a1._countAndFlagsBits;
}

uint64_t sub_25A80E644(uint64_t a1, uint64_t a2)
{
  type metadata accessor for AESCounterRandomNumberGenerator();
  inited = (void *)swift_initStackObject();
  inited[2] = a2;
  inited[3] = 0;
  swift_bridgeObjectRetain();
  uint64_t v8 = 16;
  unint64_t v9 = (void *)sub_25A82D000();
  v9[2] = 16;
  v9[4] = 0;
  v9[5] = 0;
  unint64_t v10 = MEMORY[0x263F8EE78];
  inited[4] = v9;
  inited[5] = v10;
  if (a1 < 1)
  {
    __break(1u);
  }
  else
  {
    Swift::UInt32 v2 = AESCounterRandomNumberGenerator.nextUInt32()();
    uint64_t v8 = (uint64_t)sub_25A813F50(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v4 = *(void *)(v8 + 16);
    unint64_t v10 = *(void *)(v8 + 24);
    int64_t v3 = v4 + 1;
    if (v4 < v10 >> 1) {
      goto LABEL_3;
    }
  }
  uint64_t v8 = (uint64_t)sub_25A813F50((char *)(v10 > 1), v3, 1, (char *)v8);
LABEL_3:
  *(void *)(v8 + 16) = v3;
  *(_DWORD *)(v8 + 4 * v4 + 32) = v2;
  uint64_t v11 = a1 - 1;
  if (a1 != 1)
  {
    do
    {
      Swift::UInt32 v13 = AESCounterRandomNumberGenerator.nextUInt32()();
      unint64_t v15 = *(void *)(v8 + 16);
      unint64_t v14 = *(void *)(v8 + 24);
      if (v15 >= v14 >> 1) {
        uint64_t v8 = (uint64_t)sub_25A813F50((char *)(v14 > 1), v15 + 1, 1, (char *)v8);
      }
      *(void *)(v8 + 16) = v15 + 1;
      *(_DWORD *)(v8 + 4 * v15 + 32) = v13;
      --v11;
    }
    while (v11);
  }
  swift_release();
  return v8;
}

uint64_t _s17PrivateSearchCore11BloomFilterV4hash5tokenSays6UInt64VGSS_tF_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = 0;
    uint64_t v5 = (void *)MEMORY[0x263F8EE78];
    while (1)
    {
      sub_25A82D350();
      sub_25A82CF40();
      sub_25A82D350();
      sub_25A82CF40();
      swift_bridgeObjectRelease();
      uint64_t v6 = sub_25A810684();
      uint64_t result = swift_bridgeObjectRelease();
      if (v6 < 0) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v5 = sub_25A814060(0, v5[2] + 1, 1, v5);
      }
      unint64_t v9 = v5[2];
      unint64_t v8 = v5[3];
      if (v9 >= v8 >> 1) {
        uint64_t v5 = sub_25A814060((void *)(v8 > 1), v9 + 1, 1, v5);
      }
      ++v4;
      v5[2] = v9 + 1;
      v5[v9 + 4] = v6;
      if (v3 == v4)
      {
        swift_bridgeObjectRelease();
        return (uint64_t)v5;
      }
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t destroy for BloomFilter()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s17PrivateSearchCore11BloomFilterVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for BloomFilter(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for BloomFilter(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for BloomFilter(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BloomFilter(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BloomFilter()
{
  return &type metadata for BloomFilter;
}

uint64_t CallContextImpl.clientContext.getter@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  return sub_25A80EB20(v1 + 16, a1);
}

uint64_t sub_25A80EB20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465D40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t CallContextImpl.clientContext.setter(uint64_t a1)
{
  swift_beginAccess();
  sub_25A80EBDC(a1, v1 + 16);
  return swift_endAccess();
}

uint64_t sub_25A80EBDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465D40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*CallContextImpl.clientContext.modify())()
{
  return j__swift_endAccess;
}

uint64_t CallContextImpl.__allocating_init(withClientContext:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 16) = 0u;
  swift_beginAccess();
  sub_25A80EBDC(a1, v2 + 16);
  swift_endAccess();
  return v2;
}

uint64_t CallContextImpl.init(withClientContext:)(uint64_t a1)
{
  *(_OWORD *)(v1 + 32) = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  swift_beginAccess();
  sub_25A80EBDC(a1, v1 + 16);
  swift_endAccess();
  return v1;
}

uint64_t CallContextImpl.deinit()
{
  sub_25A80EDA4(v0 + 16);
  return v0;
}

uint64_t sub_25A80EDA4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465D40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t CallContextImpl.__deallocating_deinit()
{
  sub_25A80EDA4(v0 + 16);
  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t sub_25A80EE3C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + 16;
  swift_beginAccess();
  return sub_25A80EB20(v3, a1);
}

uint64_t type metadata accessor for CallContextImpl()
{
  return self;
}

void *CapacityAwareLevelStrategy.kDefaultLevel0BloomFilterSizeBits.unsafeMutableAddressor()
{
  return &static CapacityAwareLevelStrategy.kDefaultLevel0BloomFilterSizeBits;
}

uint64_t static CapacityAwareLevelStrategy.kDefaultLevel0BloomFilterSizeBits.getter()
{
  return 640;
}

void *CapacityAwareLevelStrategy.kDefaultLevel0MaxTerms.unsafeMutableAddressor()
{
  return &static CapacityAwareLevelStrategy.kDefaultLevel0MaxTerms;
}

uint64_t static CapacityAwareLevelStrategy.kDefaultLevel0MaxTerms.getter()
{
  return 22;
}

void *CapacityAwareLevelStrategy.kDefaultLevelCapacity.unsafeMutableAddressor()
{
  return &static CapacityAwareLevelStrategy.kDefaultLevelCapacity;
}

uint64_t static CapacityAwareLevelStrategy.kDefaultLevelCapacity.getter()
{
  return 4096;
}

__n128 sub_25A80EEEC()
{
  type metadata accessor for CapacityAwareLevelStrategy();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 56) = xmmword_25A82E2F0;
  *(void *)(v0 + 72) = 4096;
  type metadata accessor for LevelCapacityUsageState();
  swift_allocObject();
  *(void *)(v0 + 80) = LevelCapacityUsageState.init(levelCapacity:)(4096);
  uint64_t v1 = type metadata accessor for LogLevelStrategy();
  uint64_t v2 = swift_allocObject();
  __n128 result = (__n128)xmmword_25A82E2F0;
  *(_OWORD *)(v2 + 16) = xmmword_25A82E2F0;
  *(void *)(v0 + 40) = v1;
  *(void *)(v0 + 48) = &protocol witness table for LogLevelStrategy;
  *(void *)(v0 + 16) = v2;
  qword_26A465D48 = v0;
  return result;
}

uint64_t static CapacityAwareLevelStrategy.getInstance()()
{
  if (qword_26A465AE8 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t CapacityAwareLevelStrategy.refreshState(searchIndexReader:)(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](sub_25A80F014, 0, 0);
}

uint64_t sub_25A80F014()
{
  uint64_t v1 = (void *)v0[3];
  v0[4] = v1[10];
  uint64_t v2 = v1[8];
  uint64_t v3 = v1[9];
  swift_retain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[5] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_25A80F0D8;
  uint64_t v5 = v0[2];
  return LevelCapacityUsageState.refresh(searchIndexReader:level0BloomFilterSizeBits:levelCapacity:)(v5, v2, v3);
}

uint64_t sub_25A80F0D8()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25A80F214, 0, 0);
  }
  else
  {
    swift_release();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_25A80F214()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

Swift::UInt64 __swiftcall CapacityAwareLevelStrategy.levelForTerms(_:)(Swift::UInt64 a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25A82CDE0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  sub_25A80F940(v2 + 16, (uint64_t)v15);
  uint64_t v8 = v16;
  uint64_t v9 = v17;
  __swift_project_boxed_opaque_existential_1(v15, v16);
  uint64_t v10 = (*(uint64_t (**)(Swift::UInt64, uint64_t, uint64_t))(v9 + 8))(a1, v8, v9);
  Swift::UInt64 result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  if (v10 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v12 = *(void *)(v2 + 80);
    v15[0] = 2 * v10;
    swift_retain();
    uint64_t v13 = sub_25A82CDD0();
    MEMORY[0x270FA5388](v13);
    *(void *)&v14[-32] = v12;
    *(void *)&v14[-24] = 2 * v10;
    *(void *)&v14[-16] = v15;
    sub_25A82D1B0();
    (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
    swift_release();
    return v15[0];
  }
  return result;
}

Swift::UInt64 __swiftcall CapacityAwareLevelStrategy.bloomFilterSizeForLevel(_:)(Swift::UInt64 a1)
{
  swift_beginAccess();
  sub_25A80F940(v1 + 16, (uint64_t)v7);
  uint64_t v3 = v8;
  uint64_t v4 = v9;
  Swift::UInt64 result = (Swift::UInt64)__swift_project_boxed_opaque_existential_1(v7, v8);
  if (a1 == -1)
  {
    __break(1u);
  }
  else
  {
    Swift::UInt64 v6 = (*(uint64_t (**)(Swift::UInt64, uint64_t, uint64_t))(v4 + 16))((a1 + 1) >> 1, v3, v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
    return v6;
  }
  return result;
}

Swift::UInt64 __swiftcall CapacityAwareLevelStrategy.bloomFilterSizeForNumTerms(_:)(Swift::UInt64 a1)
{
  Swift::UInt64 v2 = CapacityAwareLevelStrategy.levelForTerms(_:)(a1);
  swift_beginAccess();
  sub_25A80F940(v1 + 16, (uint64_t)v7);
  uint64_t v3 = v8;
  uint64_t v4 = v9;
  Swift::UInt64 result = (Swift::UInt64)__swift_project_boxed_opaque_existential_1(v7, v8);
  if (v2 == -1)
  {
    __break(1u);
  }
  else
  {
    Swift::UInt64 v6 = (*(uint64_t (**)(Swift::UInt64, uint64_t, uint64_t))(v4 + 16))((v2 + 1) >> 1, v3, v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
    return v6;
  }
  return result;
}

Swift::String __swiftcall CapacityAwareLevelStrategy.idForLevelStrategy()()
{
  uint64_t v0 = (void *)0x800000025A82F980;
  uint64_t v1 = 0xD000000000000011;
  result._object = v0;
  result._countAndFlagsBits = v1;
  return result;
}

Swift::UInt64 __swiftcall CapacityAwareLevelStrategy.getLevel0BloomFilterSizeBits()()
{
  return *(void *)(v0 + 64);
}

Swift::Void __swiftcall CapacityAwareLevelStrategy.setLevel0BloomFilterSizeBits(level0BloomFilterSizeBits:)(Swift::UInt64 level0BloomFilterSizeBits)
{
  *(void *)(v1 + 64) = level0BloomFilterSizeBits;
  uint64_t v3 = *(void *)(v1 + 56);
  uint64_t v4 = type metadata accessor for LogLevelStrategy();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v3;
  *(void *)(v5 + 24) = level0BloomFilterSizeBits;
  uint64_t v8 = v4;
  uint64_t v9 = &protocol witness table for LogLevelStrategy;
  *(void *)&long long v7 = v5;
  sub_25A80FA58(&v7, (uint64_t)v6);
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_1(v1 + 16);
  sub_25A80FA58(v6, v1 + 16);
  swift_endAccess();
}

Swift::UInt64 __swiftcall CapacityAwareLevelStrategy.getLevel0MaxTerms()()
{
  return *(void *)(v0 + 56);
}

Swift::Void __swiftcall CapacityAwareLevelStrategy.setLevel0MaxTerms(level0MaxTerms:)(Swift::UInt64 level0MaxTerms)
{
  *(void *)(v1 + 56) = level0MaxTerms;
  uint64_t v3 = *(void *)(v1 + 64);
  uint64_t v4 = type metadata accessor for LogLevelStrategy();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = level0MaxTerms;
  *(void *)(v5 + 24) = v3;
  uint64_t v8 = v4;
  uint64_t v9 = &protocol witness table for LogLevelStrategy;
  *(void *)&long long v7 = v5;
  sub_25A80FA58(&v7, (uint64_t)v6);
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_1(v1 + 16);
  sub_25A80FA58(v6, v1 + 16);
  swift_endAccess();
}

Swift::UInt64 __swiftcall CapacityAwareLevelStrategy.getLevelCapacity()()
{
  return *(void *)(v0 + 72);
}

Swift::Void __swiftcall CapacityAwareLevelStrategy.setLevelCapacity(levelCapacity:)(Swift::UInt64 levelCapacity)
{
  *(void *)(v1 + 72) = levelCapacity;
}

uint64_t CapacityAwareLevelStrategy.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return v0;
}

uint64_t CapacityAwareLevelStrategy.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return MEMORY[0x270FA0228](v0, 88, 7);
}

Swift::UInt64 sub_25A80F788(Swift::UInt64 a1)
{
  return CapacityAwareLevelStrategy.levelForTerms(_:)(a1);
}

void *sub_25A80F7AC(uint64_t a1)
{
  uint64_t v3 = *v1 + 16;
  swift_beginAccess();
  sub_25A80F940(v3, (uint64_t)v8);
  uint64_t v4 = v9;
  uint64_t v5 = v10;
  Swift::String result = __swift_project_boxed_opaque_existential_1(v8, v9);
  if (a1 == -1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v7 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v5 + 16))((unint64_t)(a1 + 1) >> 1, v4, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
    return (void *)v7;
  }
  return result;
}

void *sub_25A80F854(Swift::UInt64 a1)
{
  uint64_t v2 = *v1;
  Swift::UInt64 v3 = CapacityAwareLevelStrategy.levelForTerms(_:)(a1);
  swift_beginAccess();
  sub_25A80F940(v2 + 16, (uint64_t)v8);
  uint64_t v4 = v9;
  uint64_t v5 = v10;
  Swift::String result = __swift_project_boxed_opaque_existential_1(v8, v9);
  if (v3 == -1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v7 = (*(uint64_t (**)(Swift::UInt64, uint64_t, uint64_t))(v5 + 16))((v3 + 1) >> 1, v4, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
    return (void *)v7;
  }
  return result;
}

unint64_t sub_25A80F900()
{
  return 0xD000000000000011;
}

uint64_t sub_25A80F91C()
{
  return *(void *)(*(void *)v0 + 64);
}

uint64_t sub_25A80F928()
{
  return *(void *)(*(void *)v0 + 56);
}

uint64_t sub_25A80F934()
{
  return *(void *)(*(void *)v0 + 72);
}

uint64_t sub_25A80F940(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_25A80FA38()
{
  return sub_25A81B41C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(uint64_t **)(v0 + 32));
}

uint64_t sub_25A80FA58(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t type metadata accessor for CapacityAwareLevelStrategy()
{
  return self;
}

uint64_t CaseInsensitiveIndexer.__allocating_init(_:)(long long *a1)
{
  uint64_t v2 = swift_allocObject();
  sub_25A80FA58(a1, v2 + 16);
  return v2;
}

uint64_t CaseInsensitiveIndexer.init(_:)(long long *a1)
{
  sub_25A80FA58(a1, v1 + 16);
  return v1;
}

uint64_t CaseInsensitiveIndexer.index(key:tokens:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[12] = a6;
  v7[13] = v6;
  v7[10] = a4;
  v7[11] = a5;
  v7[8] = a2;
  v7[9] = a3;
  v7[7] = a1;
  return MEMORY[0x270FA2498](sub_25A80FB24, 0, 0);
}

uint64_t sub_25A80FB24()
{
  uint64_t v1 = v0[11];
  sub_25A80F940(v0[13] + 16, (uint64_t)(v0 + 2));
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v2);
  int64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = MEMORY[0x263F8EE78];
  if (v4)
  {
    uint64_t v23 = MEMORY[0x263F8EE78];
    uint64_t v6 = v0[11];
    sub_25A810188(0, v4, 0);
    uint64_t v5 = v23;
    uint64_t v7 = v6 + 40;
    do
    {
      uint64_t v8 = sub_25A82CEC0();
      uint64_t v10 = v9;
      unint64_t v12 = *(void *)(v23 + 16);
      unint64_t v11 = *(void *)(v23 + 24);
      if (v12 >= v11 >> 1) {
        sub_25A810188(v11 > 1, v12 + 1, 1);
      }
      *(void *)(v23 + 16) = v12 + 1;
      uint64_t v13 = v23 + 16 * v12;
      *(void *)(v13 + 32) = v8;
      *(void *)(v13 + 40) = v10;
      v7 += 16;
      --v4;
    }
    while (v4);
  }
  v0[14] = v5;
  uint64_t v14 = *(void *)(v3 + 16);
  uint64_t v22 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 + 8) + **(int **)(v14 + 8));
  unint64_t v15 = (void *)swift_task_alloc();
  v0[15] = v15;
  *unint64_t v15 = v0;
  v15[1] = sub_25A80FD0C;
  uint64_t v16 = v0[12];
  uint64_t v17 = v0[9];
  uint64_t v18 = v0[10];
  uint64_t v19 = v0[8];
  uint64_t v20 = v0[7];
  return v22(v20, v19, v17, v18, v5, v16, v2, v14);
}

uint64_t sub_25A80FD0C()
{
  *(void *)(*(void *)v1 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_25A80FE8C;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_25A80FE28;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25A80FE28()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25A80FE8C()
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t CaseInsensitiveIndexer.search(token:context:)()
{
  uint64_t v1 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  uint64_t v2 = sub_25A82CEC0();
  (*(void (**)(uint64_t))(*(void *)(v1 + 8) + 8))(v2);
  return swift_bridgeObjectRelease();
}

uint64_t CaseInsensitiveIndexer.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t CaseInsensitiveIndexer.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t sub_25A80FFF8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  __swift_project_boxed_opaque_existential_1((void *)(*(void *)v0 + 16), *(void *)(*(void *)v0 + 40));
  uint64_t v2 = sub_25A82CEC0();
  (*(void (**)(uint64_t))(*(void *)(v1 + 8) + 8))(v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_25A8100A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v14 = *v6;
  unint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *unint64_t v15 = v7;
  v15[1] = sub_25A800B84;
  v15[12] = a6;
  v15[13] = v14;
  v15[10] = a4;
  v15[11] = a5;
  v15[8] = a2;
  v15[9] = a3;
  v15[7] = a1;
  return MEMORY[0x270FA2498](sub_25A80FB24, 0, 0);
}

uint64_t sub_25A810188(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25A81020C(a1, a2, a3, *v3);
  unsigned __int8 *v3 = (char *)result;
  return result;
}

uint64_t type metadata accessor for CaseInsensitiveIndexer()
{
  return self;
}

uint64_t sub_25A8101CC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25A810378(a1, a2, a3, *v3);
  unsigned __int8 *v3 = (char *)result;
  return result;
}

uint64_t sub_25A8101EC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25A8104C8(a1, a2, a3, *v3);
  unsigned __int8 *v3 = (char *)result;
  return result;
}

uint64_t sub_25A81020C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A465B68);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  uint64_t result = sub_25A82D330();
  __break(1u);
  return result;
}

uint64_t sub_25A810378(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A465D68);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25A82D330();
  __break(1u);
  return result;
}

uint64_t sub_25A8104C8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A465D70);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25A82D330();
  __break(1u);
  return result;
}

Swift::Int64 __swiftcall Double.toMillis()()
{
  double v1 = v0 * 1000.0;
  if ((~*(void *)&v1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v1 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v1 < 9.22337204e18) {
    return (uint64_t)v1;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_25A810684()
{
  uint64_t v0 = sub_25A821DDC();
  uint64_t v1 = sub_25A82D000();
  uint64_t v2 = v1;
  *(void *)(v1 + 16) = 8;
  *(void *)(v1 + 32) = 0;
  uint64_t v3 = (int8x8_t *)(v1 + 32);
  uint64_t v4 = *(void *)(v0 + 16);
  if (v4)
  {
    unint64_t v5 = v0 + 32;
    if (v4 == 8 && (v5 >= v1 + 40 || (unint64_t)v3 >= v0 + 40))
    {
      uint64_t v7 = 8;
      int8x8_t v8 = *v3;
      uint64_t v9 = (int8x8_t *)(v0 + 32);
      uint64_t v10 = -8;
      do
      {
        int8x8_t v11 = *v9++;
        int8x8_t v8 = veor_s8(v8, v11);
        v10 += 8;
      }
      while (v10);
      int8x8_t *v3 = v8;
      goto LABEL_13;
    }
    uint64_t v7 = 0;
    do
    {
      uint64_t v12 = v7 & 7;
      char v13 = *(unsigned char *)(v5 + v7++);
      v3->i8[v12] ^= v13;
LABEL_13:
      ;
    }
    while (v4 != v7);
  }
  uint64_t result = swift_bridgeObjectRelease();
  if (*(void *)(v2 + 16))
  {
    *(unsigned char *)(v2 + 32) &= 0x3Fu;
    swift_bridgeObjectRetain();
    unint64_t v15 = Array<A>.parseUInt64BigEndian()();
    swift_bridgeObjectRelease_n();
    return v15;
  }
  else
  {
    __break(1u);
  }
  return result;
}

ValueMetadata *type metadata accessor for CustomHasher()
{
  return &type metadata for CustomHasher;
}

void *Data.toUInt8Array()(uint64_t a1, unint64_t a2)
{
  sub_25A8109EC(a1, a2);
  uint64_t v4 = sub_25A810830(a1, a2);
  sub_25A810A44(a1, a2);
  return v4;
}

void *sub_25A810830(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_25A82CB10();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int8x8_t v8 = (void *)MEMORY[0x263F8EE78];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_12;
      }
      uint64_t v9 = HIDWORD(a1) - (int)a1;
LABEL_6:
      if (v9)
      {
        if (v9 >= 1)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_26A465B70);
          int8x8_t v8 = (void *)swift_allocObject();
          size_t v12 = _swift_stdlib_malloc_size(v8);
          size_t v8[2] = v9;
          void v8[3] = 2 * v12 - 64;
        }
        sub_25A8109EC(a1, a2);
        uint64_t v13 = sub_25A82CAF0();
        sub_25A810A44(a1, a2);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        if (v13 != v9)
        {
          __break(1u);
LABEL_12:
          __break(1u);
LABEL_13:
          __break(1u);
          JUMPOUT(0x25A8109DCLL);
        }
      }
      return v8;
    case 2uLL:
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v10 = *(void *)(a1 + 24);
      uint64_t v9 = v10 - v11;
      if (!__OFSUB__(v10, v11)) {
        goto LABEL_6;
      }
      goto LABEL_13;
    case 3uLL:
      return v8;
    default:
      uint64_t v9 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_25A8109EC(uint64_t a1, unint64_t a2)
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

uint64_t sub_25A810A44(uint64_t a1, unint64_t a2)
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

void *DocumentConstants.kDocSizeSplitThreshold.unsafeMutableAddressor()
{
  return &static DocumentConstants.kDocSizeSplitThreshold;
}

uint64_t static DocumentConstants.kDocSizeSplitThreshold.getter()
{
  return 5632;
}

ValueMetadata *type metadata accessor for DocumentConstants()
{
  return &type metadata for DocumentConstants;
}

uint64_t sub_25A810AC0()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = MEMORY[0x270FA5388](v0);
  uint64_t v3 = (uint64_t *)((char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_allocate_value_buffer(v1, qword_26A465D78);
  uint64_t v4 = __swift_project_value_buffer(v0, (uint64_t)qword_26A465D78);
  void *v3 = 0xD000000000000016;
  v3[1] = 0x800000025A82FAC0;
  sub_25A82CDB0();
  return sub_25A811520((uint64_t)v3, v4);
}

Swift::String __swiftcall DocumentKey.toString()()
{
  uint64_t v5 = v0;
  uint64_t v6 = v1;
  swift_bridgeObjectRetain();
  sub_25A82CF40();
  swift_bridgeObjectRetain();
  sub_25A82CF40();
  swift_bridgeObjectRelease();
  uint64_t v2 = v5;
  uint64_t v3 = v6;
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> _s22PrivateSearchProtocols11DocumentKeyV0aB4CoreE16debugDescriptionSSvg_0()
{
}

uint64_t static DocumentKey.from(str:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = a1;
  unint64_t v19 = a2;
  v17[0] = 2960685;
  v17[1] = 0xE300000000000000;
  sub_25A810ED0();
  uint64_t v7 = (void *)sub_25A82D210();
  int8x8_t v8 = v7;
  if (v7[2] != 2)
  {
    swift_bridgeObjectRelease();
    if (qword_26A465AF0 == -1)
    {
LABEL_5:
      uint64_t v15 = __swift_project_value_buffer(v4, (uint64_t)qword_26A465D78);
      sub_25A810F24(v15, (uint64_t)v6);
      uint64_t v18 = 0;
      unint64_t v19 = 0xE000000000000000;
      sub_25A82D250();
      swift_bridgeObjectRelease();
      uint64_t v18 = 0xD000000000000025;
      unint64_t v19 = 0x800000025A82FA90;
      sub_25A82CF40();
      sub_25A82CF40();
      sub_25A81D3E8(3, v18, v19);
      swift_bridgeObjectRelease();
      sub_25A811348((uint64_t)v6);
      return 0;
    }
LABEL_8:
    swift_once();
    goto LABEL_5;
  }
  uint64_t v10 = v7[4];
  unint64_t v9 = v7[5];
  uint64_t v18 = v10;
  unint64_t v19 = v9;
  swift_bridgeObjectRetain();
  uint64_t v11 = sub_25A82CFC0();
  if (v8[2] < 2uLL)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v12 = v11;
  uint64_t v14 = v8[6];
  unint64_t v13 = v8[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = v14;
  unint64_t v19 = v13;
  sub_25A82CFC0();
  return v12;
}

unint64_t sub_25A810ED0()
{
  unint64_t result = qword_26A465D90;
  if (!qword_26A465D90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A465D90);
  }
  return result;
}

uint64_t sub_25A810F24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t DocumentKey.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_25A82CF40();
  swift_bridgeObjectRetain();
  sub_25A82CF40();
  swift_bridgeObjectRelease();
  sub_25A82CF00();
  return swift_bridgeObjectRelease();
}

uint64_t DocumentKey.hashValue.getter()
{
  return sub_25A82D430();
}

uint64_t sub_25A8110D4()
{
  uint64_t v2 = *v0;
  swift_bridgeObjectRetain();
  sub_25A82CF40();
  swift_bridgeObjectRetain();
  sub_25A82CF40();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_25A811148()
{
  return sub_25A82D430();
}

uint64_t sub_25A8111F0()
{
  swift_bridgeObjectRetain();
  sub_25A82CF40();
  swift_bridgeObjectRetain();
  sub_25A82CF40();
  swift_bridgeObjectRelease();
  sub_25A82CF00();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25A811288()
{
  return sub_25A82D430();
}

uint64_t sub_25A81132C(uint64_t *a1, uint64_t *a2)
{
  return _s22PrivateSearchProtocols11DocumentKeyV0aB4CoreE2eeoiySbAC_ACtFZ_0(*a1, a1[1], a1[2], a1[3], *a2, a2[1]);
}

uint64_t sub_25A811348(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t _s22PrivateSearchProtocols11DocumentKeyV0aB4CoreE2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  swift_bridgeObjectRetain();
  sub_25A82CF40();
  swift_bridgeObjectRetain();
  sub_25A82CF40();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_25A82CF40();
  swift_bridgeObjectRetain();
  sub_25A82CF40();
  swift_bridgeObjectRelease();
  if (a1 == a5 && a2 == a6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_25A82D370();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

unint64_t sub_25A8114CC()
{
  unint64_t result = qword_26A465D98;
  if (!qword_26A465D98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A465D98);
  }
  return result;
}

uint64_t sub_25A811520(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_25A811584()
{
  static DocumentProcessor.kDummyTokenHash = (uint64_t)&unk_27085D590;
}

uint64_t *DocumentProcessor.kDummyTokenHash.unsafeMutableAddressor()
{
  if (qword_26A465AF8 != -1) {
    swift_once();
  }
  return &static DocumentProcessor.kDummyTokenHash;
}

uint64_t static DocumentProcessor.kDummyTokenHash.getter()
{
  if (qword_26A465AF8 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

void *static DocumentProcessor.deduplicateTokens(tokens:)()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = sub_25A81168C(v0);
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_25A7FEA48(v1);
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_25A81168C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_25A82D140();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain();
      sub_25A8142A0(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DocumentProcessor()
{
  return &type metadata for DocumentProcessor;
}

uint64_t EncryptedDocumentIndexer.__allocating_init(documentIndexWriter:levelStrategy:secret:)(long long *a1, long long *a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  sub_25A80FA58(a1, v6 + 16);
  sub_25A80FA58(a2, v6 + 56);
  *(void *)(v6 + 96) = a3;
  return v6;
}

uint64_t EncryptedDocumentIndexer.init(documentIndexWriter:levelStrategy:secret:)(long long *a1, long long *a2, uint64_t a3)
{
  sub_25A80FA58(a1, v3 + 16);
  sub_25A80FA58(a2, v3 + 56);
  *(void *)(v3 + 96) = a3;
  return v3;
}

uint64_t EncryptedDocumentIndexer.index(key:tokens:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[12] = a6;
  v7[13] = v6;
  v7[10] = a4;
  v7[11] = a5;
  v7[8] = a2;
  v7[9] = a3;
  v7[7] = a1;
  return MEMORY[0x270FA2498](sub_25A81180C, 0, 0);
}

uint64_t sub_25A81180C()
{
  uint64_t v1 = (void *)v0[13];
  uint64_t v2 = swift_bridgeObjectRetain();
  uint64_t v3 = sub_25A81168C(v2);
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_25A7FEA48(v3);
  swift_bridgeObjectRelease();
  uint64_t v5 = v1 + 7;
  uint64_t v6 = v1[10];
  uint64_t v7 = v1[11];
  __swift_project_boxed_opaque_existential_1(v5, v6);
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t))(v7 + 24))(v4[2], v6, v7);
  if (result < 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (__OFADD__(result, 8))
  {
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v9 = v0[13];
  uint64_t v10 = (int8x16_t *)sub_25A7FDEB0(0, (unint64_t)(result + 7) >> 3);
  uint64_t v11 = *(void *)(v9 + 96);
  swift_bridgeObjectRetain();
  sub_25A80E644(16, v11);
  swift_bridgeObjectRelease();
  uint64_t v12 = v4[2];
  if (v12)
  {
    swift_bridgeObjectRetain();
    unint64_t v13 = v4 + 5;
    do
    {
      swift_bridgeObjectRetain();
      sub_25A80E364();
      swift_bridgeObjectRelease();
      v13 += 2;
      --v12;
    }
    while (v12);
    swift_release_n();
  }
  else
  {
    swift_release();
  }
  uint64_t result = sub_25A80F940((uint64_t)v5, (uint64_t)(v0 + 2));
  unint64_t v14 = v10[1].u64[0];
  if (v14 >> 60) {
    goto LABEL_15;
  }
  uint64_t v15 = (void *)v0[13];
  uint64_t v17 = v0[9];
  uint64_t v16 = v0[10];
  uint64_t v18 = 8 * v14;
  uint64_t v20 = v0[7];
  uint64_t v19 = v0[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v21 = _s17PrivateSearchCore26MaskedBloomFilterAlgorithmV6secret11documentKey13levelStrategy05bloomF7NumBitsAcA16HashedUserSecretV_0aB9Protocols08DocumentJ0VAA05LevelL0_pSitcfC_0(v11, v20, v19, v17, v16, v0 + 2);
  swift_bridgeObjectRetain();
  uint64_t v22 = (int8x16_t *)sub_25A81EB54(v18, v21);
  uint64_t v23 = BitArray.xor(_:)(v10, v22);
  v0[14] = v23;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v24 = v15 + 2;
  uint64_t v26 = v15[5];
  uint64_t v25 = v15[6];
  uint64_t result = (uint64_t)__swift_project_boxed_opaque_existential_1(v24, v26);
  if (!(*((void *)v23 + 2) >> 60))
  {
    uint64_t v28 = *(void *)(v25 + 8) + **(int **)(v25 + 8);
    uint64_t v27 = (void *)swift_task_alloc();
    v0[15] = v27;
    void *v27 = v0;
    v27[1] = sub_25A811B3C;
    __asm { BRAA            X9, X16 }
  }
LABEL_16:
  __break(1u);
  return result;
}

uint64_t sub_25A811B3C()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_25A811C78, 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_25A811C78()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t EncryptedDocumentIndexer.createBloomFilter(tokens:size:)(uint64_t result, uint64_t a2)
{
  if (a2 < 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (__OFADD__(a2, 8))
  {
LABEL_9:
    __break(1u);
    return result;
  }
  uint64_t v3 = result;
  sub_25A7FDEB0(0, (unint64_t)(a2 + 7) >> 3);
  uint64_t v4 = *(void *)(v2 + 96);
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_25A80E644(16, v4);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(v3 + 16);
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = v3 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_25A80E364();
      swift_bridgeObjectRelease();
      v7 += 16;
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease();
  }
  return v5;
}

uint64_t EncryptedDocumentIndexer.mask(bloomFilter:documentKey:)(uint64_t a1, int8x16_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = *(void *)(v6 + 96);
  uint64_t result = sub_25A80F940(v6 + 56, (uint64_t)v19);
  unint64_t v14 = a2[1].u64[0];
  if (v14 >> 60)
  {
    __break(1u);
  }
  else
  {
    uint64_t v15 = 8 * v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v16 = _s17PrivateSearchCore26MaskedBloomFilterAlgorithmV6secret11documentKey13levelStrategy05bloomF7NumBitsAcA16HashedUserSecretV_0aB9Protocols08DocumentJ0VAA05LevelL0_pSitcfC_0(v12, a3, a4, a5, a6, v19);
    swift_bridgeObjectRetain();
    uint64_t v17 = (int8x16_t *)sub_25A81EB54(v15, v16);
    uint64_t v18 = BitArray.xor(_:)(a2, v17);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (uint64_t)v18;
  }
  return result;
}

uint64_t EncryptedDocumentIndexer.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t EncryptedDocumentIndexer.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 104, 7);
}

uint64_t sub_25A811F28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v14 = *v6;
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_25A800B84;
  v15[12] = a6;
  v15[13] = v14;
  v15[10] = a4;
  v15[11] = a5;
  v15[8] = a2;
  v15[9] = a3;
  v15[7] = a1;
  return MEMORY[0x270FA2498](sub_25A81180C, 0, 0);
}

uint64_t type metadata accessor for EncryptedDocumentIndexer()
{
  return self;
}

uint64_t EncryptedDocumentIndexerSearcher.__allocating_init(reader:writer:levelStrategy:secret:)(long long *a1, long long *a2, long long *a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  EncryptedDocumentIndexerSearcher.init(reader:writer:levelStrategy:secret:)(a1, a2, a3, a4);
  return v8;
}

uint64_t EncryptedDocumentIndexerSearcher.init(reader:writer:levelStrategy:secret:)(long long *a1, long long *a2, long long *a3, uint64_t a4)
{
  sub_25A80F940((uint64_t)a3, (uint64_t)v12);
  type metadata accessor for EncryptedDocumentSearcher();
  uint64_t v9 = swift_allocObject();
  sub_25A80FA58(v12, v9 + 16);
  *(void *)(v9 + 96) = a4;
  sub_25A80FA58(a1, v9 + 56);
  *(void *)(v4 + 24) = v9;
  type metadata accessor for EncryptedDocumentIndexer();
  uint64_t v10 = swift_allocObject();
  sub_25A80FA58(a2, v10 + 16);
  sub_25A80FA58(a3, v10 + 56);
  *(void *)(v10 + 96) = a4;
  *(void *)(v4 + 16) = v10;
  swift_bridgeObjectRetain();
  return v4;
}

uint64_t EncryptedDocumentIndexerSearcher.index(key:tokens:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[7] = a6;
  v7[8] = v6;
  v7[5] = a4;
  v7[6] = a5;
  void v7[3] = a2;
  v7[4] = a3;
  v7[2] = a1;
  return MEMORY[0x270FA2498](sub_25A812194, 0, 0);
}

uint64_t sub_25A812194()
{
  uint64_t v1 = (void *)swift_task_alloc();
  v0[9] = v1;
  void *v1 = v0;
  v1[1] = sub_25A81223C;
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[7];
  uint64_t v4 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v7 = v0[2];
  uint64_t v6 = v0[3];
  return EncryptedDocumentIndexer.index(key:tokens:context:)(v7, v6, v4, v5, v2, v3);
}

uint64_t sub_25A81223C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t EncryptedDocumentIndexerSearcher.search(token:context:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return EncryptedDocumentSearcher.search(token:context:)(a1, a2, a3, a4);
}

uint64_t EncryptedDocumentIndexerSearcher.deinit()
{
  swift_release();
  swift_release();
  return v0;
}

uint64_t EncryptedDocumentIndexerSearcher.__deallocating_deinit()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_25A8123BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return EncryptedDocumentSearcher.search(token:context:)(a1, a2, a3, a4);
}

uint64_t sub_25A8123E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[6] = a5;
  v7[7] = a6;
  v7[4] = a3;
  v7[5] = a4;
  v7[2] = a1;
  void v7[3] = a2;
  v7[8] = *v6;
  return MEMORY[0x270FA2498](sub_25A812194, 0, 0);
}

uint64_t type metadata accessor for EncryptedDocumentIndexerSearcher()
{
  return self;
}

uint64_t EncryptedDocumentSearcher.__allocating_init(searchIndexReader:levelStrategy:secret:)(long long *a1, long long *a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  sub_25A80FA58(a2, v6 + 16);
  *(void *)(v6 + 96) = a3;
  sub_25A80FA58(a1, v6 + 56);
  return v6;
}

uint64_t EncryptedDocumentSearcher.init(searchIndexReader:levelStrategy:secret:)(long long *a1, long long *a2, uint64_t a3)
{
  sub_25A80FA58(a2, v3 + 16);
  *(void *)(v3 + 96) = a3;
  sub_25A80FA58(a1, v3 + 56);
  return v3;
}

uint64_t EncryptedDocumentSearcher.search(token:context:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6 = v4;
  uint64_t v26 = a4;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465DC0);
  uint64_t v23 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465DC8);
  uint64_t v24 = *(void *)(v13 - 8);
  uint64_t v25 = v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_25A80E644(16, v6[12]);
  uint64_t v17 = _s17PrivateSearchCore11BloomFilterV4hash5tokenSays6UInt64VGSS_tF_0(a1, a2, v16);
  swift_bridgeObjectRelease();
  uint64_t v18 = v6[10];
  uint64_t v19 = v6[11];
  __swift_project_boxed_opaque_existential_1(v6 + 7, v18);
  uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 8))(v17, a3, v18, v19);
  if (v5) {
    return swift_bridgeObjectRelease();
  }
  MEMORY[0x270FA5388](v20);
  *(&v22 - 4) = (uint64_t)v15;
  *(&v22 - 3) = (uint64_t)v6;
  *(&v22 - 2) = v17;
  (*(void (**)(char *, void, uint64_t))(v23 + 104))(v12, *MEMORY[0x263F8F680], v10);
  sub_25A82D110();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v15, v25);
}

uint64_t EncryptedDocumentSearcher.processResults(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465DC0);
  MEMORY[0x270FA5388](v5);
  uint64_t v10 = a1;
  uint64_t v11 = v2;
  uint64_t v12 = a2;
  (*(void (**)(unsigned char *, void))(v7 + 104))(&v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)], *MEMORY[0x263F8F680]);
  return sub_25A82D110();
}

uint64_t sub_25A812880(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v27 = a3;
  uint64_t v28 = a4;
  uint64_t v26 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465DE0);
  uint64_t v24 = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5);
  uint64_t v25 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465DC8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465B88);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_25A82D060();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v26, v5);
  unint64_t v16 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v17 = (v10 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v18 = (v17 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v19 = (*(unsigned __int8 *)(v6 + 80) + v18 + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = 0;
  *(void *)(v20 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v20 + v16, v11, v8);
  uint64_t v21 = v28;
  *(void *)(v20 + v17) = v27;
  *(void *)(v20 + v18) = v21;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v20 + v19, v25, v24);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_25A813A88((uint64_t)v14, (uint64_t)&unk_26A465DF0, v20);
  return swift_release();
}

uint64_t sub_25A812B5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[38] = a6;
  v7[39] = a7;
  v7[36] = a4;
  v7[37] = a5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465DF8);
  v7[40] = v8;
  v7[41] = *(void *)(v8 - 8);
  v7[42] = swift_task_alloc();
  v7[43] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465E00);
  v7[44] = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465DC8);
  v7[45] = v9;
  v7[46] = *(void *)(v9 - 8);
  v7[47] = swift_task_alloc();
  v7[48] = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465E08);
  v7[49] = swift_task_alloc();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465E10);
  v7[50] = v10;
  v7[51] = *(void *)(v10 - 8);
  v7[52] = swift_task_alloc();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465E18);
  v7[53] = v11;
  v7[54] = *(void *)(v11 - 8);
  v7[55] = swift_task_alloc();
  v7[56] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25A812DBC, 0, 0);
}

uint64_t sub_25A812DBC()
{
  uint64_t v1 = v0;
  uint64_t v12 = v0 + 8;
  uint64_t v2 = v0[52];
  uint64_t v11 = v0[51];
  uint64_t v3 = v0[50];
  uint64_t v5 = v0[37];
  uint64_t v4 = v0[38];
  (*(void (**)(void, void, void))(v0[46] + 16))(v0[47], v0[36], v0[45]);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  *(void *)(v6 + 24) = v4;
  sub_25A816490(&qword_26A465E30, &qword_26A465DC8);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_25A82D340();
  sub_25A816490(&qword_26A465E40, &qword_26A465E08);
  sub_25A82D2E0();
  MEMORY[0x261145EE0](v3);
  sub_25A82D070();
  sub_25A82D2B0();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v2, v3);
  sub_25A82D2C0();
  v0[35] = MEMORY[0x263F8EE88];
  v0[57] = sub_25A82D2A0();
  uint64_t v7 = sub_25A816490(&qword_26A465E48, &qword_26A465E00);
  uint64_t v8 = (void *)swift_task_alloc();
  v1[58] = v8;
  *uint64_t v8 = v1;
  v8[1] = sub_25A81307C;
  uint64_t v9 = v1[43];
  return MEMORY[0x270FA1E80](v12, v9, v7);
}

uint64_t sub_25A81307C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 472) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_25A813400;
  }
  else
  {
    (*(void (**)(void))(v2 + 456))();
    uint64_t v3 = sub_25A8131A8;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_25A8131A8()
{
  uint64_t v1 = *(void *)(v0 + 72);
  if (v1)
  {
    uint64_t v3 = *(void *)(v0 + 440);
    uint64_t v2 = *(void *)(v0 + 448);
    uint64_t v4 = *(void *)(v0 + 424);
    uint64_t v5 = *(void *)(v0 + 432);
    uint64_t v6 = *(void *)(v0 + 104);
    uint64_t v7 = *(void *)(v0 + 80);
    *(void *)(v0 + 16) = *(void *)(v0 + 64);
    *(void *)(v0 + 24) = v1;
    *(void *)(v0 + 32) = v7;
    *(_OWORD *)(v0 + 40) = *(_OWORD *)(v0 + 88);
    *(void *)(v0 + 56) = v6;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v2, v4);
    uint64_t v8 = (int *)sub_25A82D2B0();
    *(void *)(v0 + 480) = v9;
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
    unint64_t v16 = (uint64_t (*)(uint64_t, uint64_t))((char *)v8 + *v8);
    uint64_t v10 = (void *)swift_task_alloc();
    *(void *)(v0 + 488) = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_25A8135F4;
    return v16(v0 + 208, v0 + 16);
  }
  else
  {
    uint64_t v12 = *(void *)(v0 + 448);
    uint64_t v13 = *(void *)(v0 + 424);
    uint64_t v14 = *(void *)(v0 + 432);
    swift_bridgeObjectRelease();
    *(void *)(v0 + 256) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A465DE0);
    sub_25A82D0B0();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
    return v15();
  }
}

uint64_t sub_25A813400()
{
  uint64_t v1 = *(void *)(v0 + 472);
  uint64_t v2 = *(void *)(v0 + 448);
  uint64_t v3 = *(void *)(v0 + 432);
  uint64_t v4 = *(void *)(v0 + 424);
  (*(void (**)(void))(v0 + 456))();
  swift_bridgeObjectRelease();
  *(void *)(v0 + 272) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465DE0);
  sub_25A82D0B0();
  sub_25A82D250();
  *(void *)(v0 + 240) = 0;
  *(void *)(v0 + 248) = 0xE000000000000000;
  sub_25A82CF40();
  *(void *)(v0 + 264) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465B80);
  sub_25A82D280();
  sub_25A82CF40();
  uint64_t v5 = *(void *)(v0 + 240);
  uint64_t v6 = *(void *)(v0 + 248);
  sub_25A8164D4();
  swift_allocError();
  *(void *)uint64_t v7 = v5;
  *(void *)(v7 + 8) = v6;
  *(unsigned char *)(v7 + 16) = 3;
  swift_willThrow();
  MEMORY[0x261146370](v1);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_25A8135F4()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  *(void *)(v1 + 496) = *(void *)(v1 + 208);
  *(_OWORD *)(v1 + 504) = *(_OWORD *)(v1 + 216);
  *(void *)(v1 + 520) = *(void *)(v1 + 232);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA2498](sub_25A813798, 0, 0);
}

uint64_t sub_25A813798()
{
  uint64_t v1 = v0;
  uint64_t v15 = v0 + 8;
  uint64_t v2 = v0 + 22;
  uint64_t v3 = v0[65];
  uint64_t v5 = v0[63];
  uint64_t v4 = v0[64];
  uint64_t v6 = v0[62];
  uint64_t v9 = v0 + 41;
  uint64_t v7 = v0[41];
  uint64_t v8 = v9[1];
  uint64_t v14 = v1[40];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25A814450(v2, v6, v5, v4, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1[14] = v6;
  v1[15] = v5;
  v1[16] = v4;
  v1[17] = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465DE0);
  sub_25A82D0A0();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v14);
  v1[57] = sub_25A82D2A0();
  uint64_t v10 = sub_25A816490(&qword_26A465E48, &qword_26A465E00);
  uint64_t v11 = (void *)swift_task_alloc();
  v1[58] = v11;
  *uint64_t v11 = v1;
  v11[1] = sub_25A81307C;
  uint64_t v12 = v1[43];
  return MEMORY[0x270FA1E80](v15, v12, v10);
}

uint64_t sub_25A813948(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return MEMORY[0x270FA2498](sub_25A81396C, 0, 0);
}

uint64_t sub_25A81396C()
{
  char v1 = sub_25A813C08(*(uint64_t **)(v0 + 16), *(void *)(v0 + 32));
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v3 = v1 & 1;
  return v2(v3);
}

uint64_t sub_25A8139D4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  *(_OWORD *)(v2 + 32) = *(_OWORD *)(a2 + 1);
  *(void *)(v2 + 48) = a2[3];
  return MEMORY[0x270FA2498](sub_25A813A08, 0, 0);
}

uint64_t sub_25A813A08()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[4];
  uint64_t v4 = (void *)v0[2];
  *uint64_t v4 = v0[3];
  v4[1] = v3;
  v4[2] = v1;
  v4[3] = v2;
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v6();
}

uint64_t sub_25A813A88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_25A82D060();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_25A82D050();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_25A816240(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25A82D030();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_25A813C08(uint64_t *a1, uint64_t a2)
{
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  uint64_t v7 = a1[2];
  uint64_t v8 = a1[3];
  sub_25A80F940(v2 + 16, (uint64_t)v21);
  uint64_t v9 = a1[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v10 = swift_bridgeObjectRetain();
  uint64_t result = _s17PrivateSearchCore26MaskedBloomFilterAlgorithmV6secret11documentKey13levelStrategy05bloomF7NumBitsAcA16HashedUserSecretV_0aB9Protocols08DocumentJ0VAA05LevelL0_pSitcfC_0(v10, v5, v6, v7, v8, v21);
  uint64_t v12 = result;
  uint64_t v13 = *(void *)(a2 + 16);
  if (v13)
  {
    if (v9)
    {
      uint64_t result = swift_bridgeObjectRetain();
      uint64_t v14 = 0;
      uint64_t v15 = (void *)MEMORY[0x263F8EE78];
      while (1)
      {
        uint64_t v16 = *(void *)(a2 + 8 * v14 + 32);
        if (v16 < 0) {
          break;
        }
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_25A814194(0, v15[2] + 1, 1, v15, &qword_26A465DD0);
          uint64_t v15 = (void *)result;
        }
        unint64_t v18 = v15[2];
        unint64_t v17 = v15[3];
        if (v18 >= v17 >> 1)
        {
          uint64_t result = (uint64_t)sub_25A814194((void *)(v17 > 1), v18 + 1, 1, v15, &qword_26A465DD0);
          uint64_t v15 = (void *)result;
        }
        ++v14;
        v15[2] = v18 + 1;
        v15[v18 + 4] = v16 % v9;
        if (v13 == v14)
        {
          swift_bridgeObjectRelease();
          goto LABEL_12;
        }
      }
      __break(1u);
    }
    __break(1u);
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x263F8EE78];
LABEL_12:
    uint64_t v19 = swift_bridgeObjectRetain();
    char v20 = MaskedBloomFilterAlgorithm.match(maskedBitArray:selectedIndexes:)(v19, (uint64_t)v15, v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v20 & 1;
  }
  return result;
}

uint64_t EncryptedDocumentSearcher.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t EncryptedDocumentSearcher.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 104, 7);
}

uint64_t sub_25A813E30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return EncryptedDocumentSearcher.search(token:context:)(a1, a2, a3, a4);
}

char *sub_25A813E54(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A465B70);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v12 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_25A815B3C(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_25A813F50(char *result, int64_t a2, char a3, char *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A465E70);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 29;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 2);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v13 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32]) {
          memmove(v13, a4 + 32, 4 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_25A815D1C(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25A814060(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_25A814194(a1, a2, a3, a4, &qword_26A465E68);
}

void *sub_25A81406C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
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
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A465DD8);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4]) {
          memmove(v12, a4 + 4, 48 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_25A815C24(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_25A814194(void *result, int64_t a2, char a3, void *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v8 = a2;
    goto LABEL_8;
  }
  unint64_t v7 = a4[3];
  uint64_t v8 = v7 >> 1;
  if ((uint64_t)(v7 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v8 + 0x4000000000000000 >= 0)
  {
    uint64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v8 = a2;
    }
LABEL_8:
    uint64_t v9 = a4[2];
    if (v8 <= v9) {
      uint64_t v10 = a4[2];
    }
    else {
      uint64_t v10 = v8;
    }
    if (v10)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      size_t v11 = (void *)swift_allocObject();
      int64_t v12 = _swift_stdlib_malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 25;
      }
      v11[2] = v9;
      v11[3] = 2 * (v13 >> 3);
      uint64_t v14 = v11 + 4;
      if (v6) {
        goto LABEL_15;
      }
    }
    else
    {
      size_t v11 = (void *)MEMORY[0x263F8EE78];
      uint64_t v14 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[v9 + 4]) {
          memmove(v14, a4 + 4, 8 * v9);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_25A815E38(0, v9, (char *)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_25A8142A0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_25A82D410();
  swift_bridgeObjectRetain();
  sub_25A82CF00();
  uint64_t v8 = sub_25A82D430();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    int64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_25A82D370() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
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
      unint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_25A82D370() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_25A814D94(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_25A814450(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v6 = v5;
  uint64_t v12 = *v6;
  sub_25A82D410();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_25A82CF40();
  swift_bridgeObjectRetain();
  uint64_t v26 = a4;
  sub_25A82CF40();
  swift_bridgeObjectRelease();
  sub_25A82CF00();
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_25A82D430();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  unint64_t v15 = v13 & ~v14;
  uint64_t v24 = v6;
  if ((*(void *)(v12 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
  {
    uint64_t v25 = ~v14;
    while (1)
    {
      uint64_t v16 = (uint64_t *)(*(void *)(v12 + 48) + 32 * v15);
      uint64_t v27 = *v16;
      uint64_t v29 = v16[1];
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_25A82CF40();
      swift_bridgeObjectRetain();
      sub_25A82CF40();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_25A82CF40();
      swift_bridgeObjectRetain();
      sub_25A82CF40();
      swift_bridgeObjectRelease();
      if (v27 == a2 && v29 == a3) {
        break;
      }
      char v17 = sub_25A82D370();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v17) {
        goto LABEL_9;
      }
      unint64_t v15 = (v15 + 1) & v25;
      if (((*(void *)(v12 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
LABEL_9:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v20 = (uint64_t *)(*(void *)(*v24 + 48) + 32 * v15);
    uint64_t v21 = v20[1];
    uint64_t v22 = v20[2];
    uint64_t v23 = v20[3];
    *a1 = *v20;
    a1[1] = v21;
    a1[2] = v22;
    a1[3] = v23;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return 0;
  }
  else
  {
LABEL_7:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v24;
    void *v24 = 0x8000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_25A814F30(a2, a3, v26, a5, v15, isUniquelyReferenced_nonNull_native);
    void *v24 = v28;
    swift_bridgeObjectRelease();
    *a1 = a2;
    a1[1] = a3;
    uint64_t result = 1;
    a1[2] = v26;
    a1[3] = a5;
  }
  return result;
}

uint64_t sub_25A81475C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465E60);
  uint64_t v3 = sub_25A82D240();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
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
                  *uint64_t v30 = -1 << v29;
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
      sub_25A82D410();
      sub_25A82CF00();
      uint64_t result = sub_25A82D430();
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
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_25A814A3C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465E58);
  uint64_t v3 = sub_25A82D240();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    char v33 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v32 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v8 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v10 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v13 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v14 = v13 | (v10 << 6);
      }
      else
      {
        int64_t v15 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v32) {
          goto LABEL_33;
        }
        unint64_t v16 = v33[v15];
        ++v10;
        if (!v16)
        {
          int64_t v10 = v15 + 1;
          if (v15 + 1 >= v32) {
            goto LABEL_33;
          }
          unint64_t v16 = v33[v10];
          if (!v16)
          {
            int64_t v10 = v15 + 2;
            if (v15 + 2 >= v32) {
              goto LABEL_33;
            }
            unint64_t v16 = v33[v10];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v32)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v31 = 1 << *(unsigned char *)(v2 + 32);
                if (v31 > 63) {
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *char v33 = -1 << v31;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v33[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v10 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v10 >= v32) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v33[v10];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v10 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v10 << 6);
      }
      uint64_t v18 = v2;
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 32 * v14);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      uint64_t v22 = v19[2];
      uint64_t v23 = v19[3];
      sub_25A82D410();
      swift_bridgeObjectRetain();
      sub_25A82CF40();
      swift_bridgeObjectRetain();
      sub_25A82CF40();
      swift_bridgeObjectRelease();
      sub_25A82CF00();
      swift_bridgeObjectRelease();
      uint64_t result = sub_25A82D430();
      uint64_t v24 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v25 = result & ~v24;
      unint64_t v26 = v25 >> 6;
      if (((-1 << v25) & ~*(void *)(v8 + 8 * (v25 >> 6))) != 0)
      {
        unint64_t v11 = __clz(__rbit64((-1 << v25) & ~*(void *)(v8 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v29 = v26 == v28;
          if (v26 == v28) {
            unint64_t v26 = 0;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v8 + 8 * v26);
        }
        while (v30 == -1);
        unint64_t v11 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      unint64_t v12 = (void *)(*(void *)(v4 + 48) + 32 * v11);
      *unint64_t v12 = v20;
      v12[1] = v21;
      long long v12[2] = v22;
      v12[3] = v23;
      ++*(void *)(v4 + 16);
      uint64_t v2 = v18;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_25A814D94(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_25A81475C();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_25A8151F4();
      goto LABEL_22;
    }
    sub_25A81556C();
  }
  uint64_t v11 = *v4;
  sub_25A82D410();
  sub_25A82CF00();
  uint64_t result = sub_25A82D430();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    int64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_25A82D370(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_25A82D390();
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
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_25A82D370();
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
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
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

uint64_t sub_25A814F30(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, char a6)
{
  uint64_t v25 = result;
  unint64_t v10 = *(void *)(*v6 + 16);
  unint64_t v11 = *(void *)(*v6 + 24);
  if (v11 > v10 && (a6 & 1) != 0) {
    goto LABEL_14;
  }
  if (a6)
  {
    sub_25A814A3C();
  }
  else
  {
    if (v11 > v10)
    {
      uint64_t result = (uint64_t)sub_25A8153A8();
      goto LABEL_14;
    }
    sub_25A81581C();
  }
  uint64_t v12 = *v6;
  sub_25A82D410();
  swift_bridgeObjectRetain();
  sub_25A82CF40();
  swift_bridgeObjectRetain();
  sub_25A82CF40();
  swift_bridgeObjectRelease();
  sub_25A82CF00();
  swift_bridgeObjectRelease();
  uint64_t result = sub_25A82D430();
  uint64_t v13 = -1 << *(unsigned char *)(v12 + 32);
  a5 = result & ~v13;
  uint64_t v24 = v12;
  uint64_t v14 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a5))
  {
    uint64_t v15 = ~v13;
    do
    {
      BOOL v16 = (uint64_t *)(*(void *)(v24 + 48) + 32 * a5);
      uint64_t v27 = *v16;
      uint64_t v28 = v16[1];
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_25A82CF40();
      swift_bridgeObjectRetain();
      sub_25A82CF40();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_25A82CF40();
      swift_bridgeObjectRetain();
      sub_25A82CF40();
      swift_bridgeObjectRelease();
      if (v27 == v25 && v28 == a2) {
        goto LABEL_17;
      }
      char v17 = sub_25A82D370();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      if (v17) {
        goto LABEL_18;
      }
      a5 = (a5 + 1) & v15;
    }
    while (((*(void *)(v14 + ((a5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a5) & 1) != 0);
  }
LABEL_14:
  uint64_t v18 = *v23;
  *(void *)(*v23 + 8 * (a5 >> 6) + 56) |= 1 << a5;
  BOOL v19 = (uint64_t *)(*(void *)(v18 + 48) + 32 * a5);
  *BOOL v19 = v25;
  v19[1] = a2;
  v19[2] = a3;
  v19[3] = a4;
  uint64_t v20 = *(void *)(v18 + 16);
  BOOL v21 = __OFADD__(v20, 1);
  uint64_t v22 = v20 + 1;
  if (!v21)
  {
    *(void *)(v18 + 16) = v22;
    return result;
  }
  __break(1u);
LABEL_17:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
LABEL_18:
  uint64_t result = sub_25A82D390();
  __break(1u);
  return result;
}

void *sub_25A8151F4()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465E60);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25A82D230();
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
    char v17 = (void *)(*(void *)(v2 + 48) + v16);
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

void *sub_25A8153A8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465E58);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25A82D230();
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_28;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23)
      {
        int64_t v9 = v22 + 2;
        if (v22 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v23 = *(void *)(v6 + 8 * v9);
        if (!v23) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 32 * v15;
    char v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = v17[2];
    uint64_t v20 = v17[3];
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    v21[2] = v19;
    v21[3] = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 3;
  if (v24 >= v13) {
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_25A81556C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465E60);
  uint64_t v3 = sub_25A82D240();
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
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_25A82D410();
    swift_bridgeObjectRetain();
    sub_25A82CF00();
    uint64_t result = sub_25A82D430();
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

uint64_t sub_25A81581C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465E58);
  uint64_t v3 = sub_25A82D240();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v30 = v2 + 56;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v31 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v8 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v13 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v14 = v13 | (v10 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v31) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v30 + 8 * v15);
    ++v10;
    if (!v16)
    {
      int64_t v10 = v15 + 1;
      if (v15 + 1 >= v31) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v30 + 8 * v10);
      if (!v16)
      {
        int64_t v10 = v15 + 2;
        if (v15 + 2 >= v31) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v30 + 8 * v10);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v10 << 6);
LABEL_24:
    int64_t v18 = (uint64_t *)(*(void *)(v2 + 48) + 32 * v14);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    uint64_t v21 = v18[2];
    uint64_t v22 = v18[3];
    sub_25A82D410();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_25A82CF40();
    swift_bridgeObjectRetain();
    sub_25A82CF40();
    swift_bridgeObjectRelease();
    sub_25A82CF00();
    swift_bridgeObjectRelease();
    uint64_t result = sub_25A82D430();
    uint64_t v23 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v24 = result & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1 << v24) & ~*(void *)(v8 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v24) & ~*(void *)(v8 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v28 = v25 == v27;
        if (v25 == v27) {
          unint64_t v25 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v8 + 8 * v25);
      }
      while (v29 == -1);
      unint64_t v11 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    unint64_t v12 = (void *)(*(void *)(v4 + 48) + 32 * v11);
    *unint64_t v12 = v20;
    v12[1] = v19;
    long long v12[2] = v21;
    v12[3] = v22;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v31)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v30 + 8 * v17);
  if (v16)
  {
    int64_t v10 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v10 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v10 >= v31) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v30 + 8 * v10);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

char *sub_25A815B3C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
  uint64_t result = (char *)sub_25A82D330();
  __break(1u);
  return result;
}

uint64_t sub_25A815C24(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 48 * a1 + 32;
    unint64_t v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_25A82D330();
  __break(1u);
  return result;
}

char *sub_25A815D1C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 4 * a1 + 32);
    size_t v6 = 4 * v4;
    unint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_25A82D330();
  __break(1u);
  return result;
}

uint64_t sub_25A815E08(uint64_t a1)
{
  return sub_25A812880(a1, v1[2], v1[3], v1[4]);
}

uint64_t type metadata accessor for EncryptedDocumentSearcher()
{
  return self;
}

char *sub_25A815E38(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    unint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_25A82D330();
  __break(1u);
  return result;
}

uint64_t sub_25A815F24()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465DC8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  unint64_t v5 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465DE0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8 + 8) & ~v8;
  uint64_t v12 = v9 + *(void *)(v7 + 64);
  uint64_t v10 = v3 | v8 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  return MEMORY[0x270FA0238](v0, v12, v10);
}

uint64_t sub_25A8160B4(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A465DC8) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v9 = *(unsigned __int8 *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A465DE0) - 8) + 80);
  uint64_t v10 = v8 + v9 + 8;
  uint64_t v11 = *(void *)(v1 + 16);
  uint64_t v12 = *(void *)(v1 + 24);
  uint64_t v13 = *(void *)(v1 + v7);
  uint64_t v14 = v1 + v6;
  uint64_t v15 = *(void *)(v1 + v8);
  uint64_t v16 = v1 + (v10 & ~v9);
  int64_t v17 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v17;
  *int64_t v17 = v3;
  v17[1] = sub_25A800B84;
  return sub_25A812B5C(a1, v11, v12, v14, v13, v15, v16);
}

uint64_t sub_25A816240(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465B88);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25A8162A0()
{
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25A8162E0(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v1 + 16);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_25A816394;
  *(_OWORD *)(v4 + 24) = v5;
  *(void *)(v4 + 16) = a1;
  return MEMORY[0x270FA2498](sub_25A81396C, 0, 0);
}

uint64_t sub_25A816394(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_25A816490(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_25A8164D4()
{
  unint64_t result = qword_26A465E50;
  if (!qword_26A465E50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A465E50);
  }
  return result;
}

uint64_t HashedUserSecret.init(secret:)()
{
  uint64_t v0 = String.toUtf8Bytes()();
  swift_bridgeObjectRelease();
  uint64_t v1 = _s17PrivateSearchCore6Sha256V4hashySays5UInt8VGAGFZ_0((uint64_t)v0);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t HashedUserSecret.init(secret:)(uint64_t a1)
{
  uint64_t v1 = _s17PrivateSearchCore6Sha256V4hashySays5UInt8VGAGFZ_0(a1);
  swift_bridgeObjectRelease();
  return v1;
}

ValueMetadata *type metadata accessor for HashedUserSecret()
{
  return &type metadata for HashedUserSecret;
}

uint64_t sub_25A8165C4()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v0 = sub_25A82CF50();
  if (v1)
  {
    uint64_t v2 = v0;
    uint64_t v3 = v1;
    do
    {
      uint64_t v6 = sub_25A82CF50();
      if (!v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v2 == v6 && v3 == v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v4 = sub_25A82D370();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v4 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      uint64_t v2 = sub_25A82CF50();
      uint64_t v3 = v5;
    }
    while (v5);
  }
  swift_bridgeObjectRelease();
  sub_25A82CF50();
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  BOOL v10 = v9 == 0;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_25A81672C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  sub_25A8179E4();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_25A82CFC0();
  unint64_t v8 = v6;
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v10 = HIBYTE(v8) & 0xF;
    uint64_t v15 = v7;
    uint64_t v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v9 = (unsigned __int8 *)&v15;
    goto LABEL_7;
  }
  uint64_t v7 = sub_25A816AC4();
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();
  unint64_t v8 = v12;
  if ((v12 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v9 = (unsigned __int8 *)sub_25A82D270();
  }
LABEL_7:
  unsigned __int16 v13 = (unsigned __int16)sub_25A81681C(v9, v10, a5);
  swift_bridgeObjectRelease();
  return v13 & 0x1FF;
}

unsigned __int8 *sub_25A81681C(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      uint64_t v14 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v15 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v16 = a3 + 55;
        }
        else
        {
          unsigned __int8 v15 = 97;
          unsigned __int8 v16 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v17 = a3 + 48;
        }
        else {
          unsigned __int8 v17 = 58;
        }
        if (result)
        {
          LOBYTE(v8) = 0;
          uint64_t v18 = result + 1;
          do
          {
            unsigned int v19 = *v18;
            if (v19 < 0x30 || v19 >= v17)
            {
              if (v19 < 0x41 || v19 >= v16)
              {
                unsigned __int8 v12 = 0;
                int v13 = 1;
                if (v19 < 0x61 || v19 >= v15) {
                  return (unsigned __int8 *)(v12 | (v13 << 8));
                }
                char v20 = -87;
              }
              else
              {
                char v20 = -55;
              }
            }
            else
            {
              char v20 = -48;
            }
            if (((v8 * (unsigned __int16)a3) & 0xFF00) != 0) {
              goto LABEL_72;
            }
            unsigned int v8 = (v8 * a3) + (v19 + v20);
            if ((v8 >> 8)) {
              goto LABEL_72;
            }
            ++v18;
            --v14;
          }
          while (v14);
LABEL_48:
          int v13 = 0;
          unsigned __int8 v12 = v8;
          return (unsigned __int8 *)(v12 | (v13 << 8));
        }
        goto LABEL_71;
      }
LABEL_72:
      unsigned __int8 v12 = 0;
      int v13 = 1;
      return (unsigned __int8 *)(v12 | (v13 << 8));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        unsigned __int8 v21 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v22 = a3 + 55;
        }
        else
        {
          unsigned __int8 v21 = 97;
          unsigned __int8 v22 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v23 = a3 + 48;
        }
        else {
          unsigned __int8 v23 = 58;
        }
        if (result)
        {
          LOBYTE(v24) = 0;
          do
          {
            unsigned int v25 = *result;
            if (v25 < 0x30 || v25 >= v23)
            {
              if (v25 < 0x41 || v25 >= v22)
              {
                unsigned __int8 v12 = 0;
                int v13 = 1;
                if (v25 < 0x61 || v25 >= v21) {
                  return (unsigned __int8 *)(v12 | (v13 << 8));
                }
                char v26 = -87;
              }
              else
              {
                char v26 = -55;
              }
            }
            else
            {
              char v26 = -48;
            }
            if (((v24 * (unsigned __int16)a3) & 0xFF00) != 0) {
              goto LABEL_72;
            }
            unsigned int v24 = (v24 * a3) + (v25 + v26);
            if ((v24 >> 8)) {
              goto LABEL_72;
            }
            ++result;
            --a2;
          }
          while (a2);
          int v13 = 0;
          unsigned __int8 v12 = v24;
          return (unsigned __int8 *)(v12 | (v13 << 8));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      uint64_t v4 = a2 - 1;
      if (a2 != 1)
      {
        unsigned __int8 v5 = a3 + 87;
        if (a3 > 10)
        {
          unsigned __int8 v6 = a3 + 55;
        }
        else
        {
          unsigned __int8 v5 = 97;
          unsigned __int8 v6 = 65;
        }
        if (a3 <= 10) {
          unsigned __int8 v7 = a3 + 48;
        }
        else {
          unsigned __int8 v7 = 58;
        }
        if (result)
        {
          LOBYTE(v8) = 0;
          uint64_t v9 = result + 1;
          while (1)
          {
            unsigned int v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                unsigned __int8 v12 = 0;
                int v13 = 1;
                if (v10 < 0x61 || v10 >= v5) {
                  return (unsigned __int8 *)(v12 | (v13 << 8));
                }
                char v11 = -87;
              }
              else
              {
                char v11 = -55;
              }
            }
            else
            {
              char v11 = -48;
            }
            if (((v8 * (unsigned __int16)a3) & 0xFF00) != 0) {
              goto LABEL_72;
            }
            unsigned int v8 = (v8 * a3) - (v10 + v11);
            if ((v8 & 0xFFFFFF00) != 0) {
              goto LABEL_72;
            }
            ++v9;
            if (!--v4) {
              goto LABEL_48;
            }
          }
        }
LABEL_71:
        unsigned __int8 v12 = 0;
        int v13 = 0;
        return (unsigned __int8 *)(v12 | (v13 << 8));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_25A816AC4()
{
  unint64_t v0 = sub_25A82CFD0();
  uint64_t v4 = sub_25A816B44(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_25A816B44(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    unint64_t v9 = sub_25A816C9C(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      char v11 = sub_25A81E4D8(v9, 0);
      unint64_t v12 = sub_25A816D9C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_25A82D270();
LABEL_4:
        JUMPOUT(0x261145B40);
      }
    }
    else
    {
      char v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x261145B40](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x261145B40]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_25A816C9C(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = result;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    unint64_t result = sub_25A81E540(result, a3, a4);
    unint64_t v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    unint64_t result = sub_25A81E540(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0) {
      return (a2 >> 16) - (v7 >> 16);
    }
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  unint64_t v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    unint64_t v10 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (v10 < v7 >> 16)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v10 < a2 >> 16)
  {
LABEL_17:
    __break(1u);
    return result;
  }
  return sub_25A82CF90();
}

unint64_t sub_25A816D9C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    unint64_t result = v12;
    if (v17 == v15) {
      unint64_t result = sub_25A81E540(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      unint64_t result = sub_25A82CFA0();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        unint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          unint64_t result = sub_25A82D270();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    unint64_t result = sub_25A81E540(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_25A82CF70();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

unint64_t sub_25A816FB0(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if ((a3 & 0x2000000000000000) != 0) {
    uint64_t v3 = HIBYTE(a3) & 0xF;
  }
  else {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v4 = 7;
  if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
    uint64_t v4 = 11;
  }
  unint64_t v5 = v4 | (v3 << 16);
  unint64_t result = sub_25A82CF20();
  if (v6) {
    unint64_t result = v5;
  }
  if (4 * v3 < result >> 14) {
    goto LABEL_14;
  }
  return sub_25A82CFD0();
}

uint64_t sub_25A817060(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6)
{
  unint64_t v10 = a2;
  uint64_t v11 = result;
  uint64_t v12 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0) {
    LOBYTE(v12) = 1;
  }
  uint64_t v13 = 4 << v12;
  unint64_t v14 = a2 & 0xC;
  if (v14 == 4 << v12)
  {
    unint64_t result = sub_25A81E540(a2, a4, a5);
    a2 = result;
    if ((a5 & 0x1000000000000000) == 0)
    {
LABEL_5:
      int64_t v15 = a2 >> 16;
      if (v14 != v13) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
    goto LABEL_5;
  }
  unint64_t v16 = a4 & 0xFFFFFFFFFFFFLL;
  if ((a5 & 0x2000000000000000) != 0) {
    unint64_t v16 = HIBYTE(a5) & 0xF;
  }
  if (v16 < a2 >> 16) {
    goto LABEL_104;
  }
  unint64_t result = sub_25A82CF90();
  int64_t v15 = result;
  if (v14 == v13)
  {
LABEL_14:
    unint64_t result = sub_25A81E540(v10, a4, a5);
    unint64_t v10 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    unint64_t result = sub_25A81E540(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0) {
      goto LABEL_8;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    unint64_t result = (a3 >> 16) - (v10 >> 16);
    goto LABEL_21;
  }
  unint64_t v17 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0) {
    unint64_t v17 = a4 & 0xFFFFFFFFFFFFLL;
  }
  if (v17 < v10 >> 16) {
    goto LABEL_100;
  }
  if (v17 < a3 >> 16)
  {
LABEL_101:
    __break(1u);
    goto LABEL_102;
  }
  unint64_t result = sub_25A82CF90();
LABEL_21:
  int64_t v18 = v15 + result;
  if (__OFADD__(v15, result))
  {
    __break(1u);
    goto LABEL_99;
  }
  if (v18 < v15)
  {
LABEL_99:
    __break(1u);
LABEL_100:
    __break(1u);
    goto LABEL_101;
  }
  char v19 = (unsigned __int8 *)(v11 + v15);
  if (!v11) {
    char v19 = 0;
  }
  int v20 = *v19;
  if (v20 == 43)
  {
    if (result >= 1)
    {
      if (result != 1)
      {
        unsigned __int8 v31 = a6 + 87;
        if (a6 > 10)
        {
          unsigned __int8 v32 = a6 + 55;
        }
        else
        {
          unsigned __int8 v31 = 97;
          unsigned __int8 v32 = 65;
        }
        if (a6 <= 10) {
          unsigned __int8 v33 = a6 + 48;
        }
        else {
          unsigned __int8 v33 = 58;
        }
        if (v19)
        {
          LOBYTE(v24) = 0;
          uint64_t v34 = v19 + 1;
          uint64_t v35 = result - 1;
          do
          {
            unsigned int v36 = *v34;
            if (v36 < 0x30 || v36 >= v33)
            {
              if (v36 < 0x41 || v36 >= v32)
              {
                unsigned __int8 v29 = 0;
                int v30 = 1;
                if (v36 < 0x61 || v36 >= v31) {
                  return v29 | (v30 << 8);
                }
                char v37 = -87;
              }
              else
              {
                char v37 = -55;
              }
            }
            else
            {
              char v37 = -48;
            }
            if (((v24 * (unsigned __int16)a6) & 0xFF00) != 0) {
              goto LABEL_96;
            }
            unsigned int v24 = (v24 * a6) + (v36 + v37);
            if ((v24 >> 8)) {
              goto LABEL_96;
            }
            ++v34;
            --v35;
          }
          while (v35);
LABEL_72:
          int v30 = 0;
          unsigned __int8 v29 = v24;
          return v29 | (v30 << 8);
        }
        goto LABEL_95;
      }
LABEL_96:
      unsigned __int8 v29 = 0;
      int v30 = 1;
      return v29 | (v30 << 8);
    }
    goto LABEL_103;
  }
  if (v20 != 45)
  {
    if (v18 != v15)
    {
      unsigned __int8 v38 = a6 + 87;
      if (a6 > 10)
      {
        unsigned __int8 v39 = a6 + 55;
      }
      else
      {
        unsigned __int8 v38 = 97;
        unsigned __int8 v39 = 65;
      }
      if (a6 <= 10) {
        unsigned __int8 v40 = a6 + 48;
      }
      else {
        unsigned __int8 v40 = 58;
      }
      if (v19)
      {
        LOBYTE(v41) = 0;
        do
        {
          unsigned int v42 = *v19;
          if (v42 < 0x30 || v42 >= v40)
          {
            if (v42 < 0x41 || v42 >= v39)
            {
              unsigned __int8 v29 = 0;
              int v30 = 1;
              if (v42 < 0x61 || v42 >= v38) {
                return v29 | (v30 << 8);
              }
              char v43 = -87;
            }
            else
            {
              char v43 = -55;
            }
          }
          else
          {
            char v43 = -48;
          }
          if (((v41 * (unsigned __int16)a6) & 0xFF00) != 0) {
            goto LABEL_96;
          }
          unsigned int v41 = (v41 * a6) + (v42 + v43);
          if ((v41 >> 8)) {
            goto LABEL_96;
          }
          ++v19;
          --result;
        }
        while (result);
        int v30 = 0;
        unsigned __int8 v29 = v41;
        return v29 | (v30 << 8);
      }
      goto LABEL_95;
    }
    goto LABEL_96;
  }
  if (result >= 1)
  {
    if (result != 1)
    {
      unsigned __int8 v21 = a6 + 87;
      if (a6 > 10)
      {
        unsigned __int8 v22 = a6 + 55;
      }
      else
      {
        unsigned __int8 v21 = 97;
        unsigned __int8 v22 = 65;
      }
      if (a6 <= 10) {
        unsigned __int8 v23 = a6 + 48;
      }
      else {
        unsigned __int8 v23 = 58;
      }
      if (v19)
      {
        LOBYTE(v24) = 0;
        unsigned int v25 = v19 + 1;
        uint64_t v26 = result - 1;
        while (1)
        {
          unsigned int v27 = *v25;
          if (v27 < 0x30 || v27 >= v23)
          {
            if (v27 < 0x41 || v27 >= v22)
            {
              unsigned __int8 v29 = 0;
              int v30 = 1;
              if (v27 < 0x61 || v27 >= v21) {
                return v29 | (v30 << 8);
              }
              char v28 = -87;
            }
            else
            {
              char v28 = -55;
            }
          }
          else
          {
            char v28 = -48;
          }
          if (((v24 * (unsigned __int16)a6) & 0xFF00) != 0) {
            goto LABEL_96;
          }
          unsigned int v24 = (v24 * a6) - (v27 + v28);
          if ((v24 & 0xFFFFFF00) != 0) {
            goto LABEL_96;
          }
          ++v25;
          if (!--v26) {
            goto LABEL_72;
          }
        }
      }
LABEL_95:
      unsigned __int8 v29 = 0;
      int v30 = 0;
      return v29 | (v30 << 8);
    }
    goto LABEL_96;
  }
LABEL_102:
  __break(1u);
LABEL_103:
  __break(1u);
LABEL_104:
  __break(1u);
  return result;
}

unint64_t _s17PrivateSearchCore8HexCodecV04fromD0ySays5UInt8VGSSFZ_0()
{
  if ((sub_25A82CF10() & 0x8000000000000001) == 1) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t v0 = sub_25A82CEC0();
  unint64_t v2 = v1;
  swift_bridgeObjectRetain();
  char v3 = sub_25A8165C4();
  swift_bridgeObjectRelease();
  if (v3)
  {
    unint64_t v4 = sub_25A82CF10();
    unint64_t v5 = sub_25A816FB0(v4, v0, v2);
    uint64_t v7 = v6;
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    swift_bridgeObjectRelease();
    MEMORY[0x261145B30](v5, v7, v9, v11);
    swift_bridgeObjectRelease();
  }
  uint64_t v12 = sub_25A82CF10();
  uint64_t v13 = v12;
  if (v12 >= 0) {
    uint64_t v14 = v12;
  }
  else {
    uint64_t v14 = v12 + 1;
  }
  uint64_t v15 = v14 >> 1;
  if (v12 >= 2) {
    int64_t v16 = v14 >> 1;
  }
  else {
    int64_t v16 = 0;
  }
  unint64_t result = (unint64_t)sub_25A813E54(0, v16, 0, MEMORY[0x263F8EE78]);
  if (v13 >= -1)
  {
    unint64_t v18 = result;
    if ((unint64_t)(v13 + 1) < 3)
    {
LABEL_34:
      swift_bridgeObjectRelease();
      return v18;
    }
    unint64_t v19 = sub_25A82CF30();
    uint64_t v20 = sub_25A82CFD0();
    unint64_t v24 = v23;
    if ((v20 ^ v21) >= 0x4000)
    {
      uint64_t v25 = v20;
      unint64_t v26 = v21;
      unint64_t v27 = v22;
      uint64_t v28 = v15 - 1;
      if (v15 <= 1) {
        uint64_t v15 = 1;
      }
      while (1)
      {
        if ((v24 & 0x1000000000000000) != 0)
        {
          LOWORD(v27) = sub_25A81672C(v25, v26, v27, v24, 16);
          unint64_t result = swift_bridgeObjectRelease();
          if ((v27 & 0x100) != 0) {
            goto LABEL_31;
          }
        }
        else
        {
          if ((v24 & 0x2000000000000000) != 0)
          {
            v38[0] = v27;
            v38[1] = v24 & 0xFFFFFFFFFFFFFFLL;
            unsigned __int8 v29 = v38;
          }
          else if ((v27 & 0x1000000000000000) != 0)
          {
            unsigned __int8 v29 = (void *)((v24 & 0xFFFFFFFFFFFFFFFLL) + 32);
          }
          else
          {
            unsigned __int8 v29 = (void *)sub_25A82D270();
          }
          unsigned int v30 = sub_25A817060((uint64_t)v29, v25, v26, v27, v24, 16);
          LOBYTE(v27) = v30;
          char v39 = BYTE1(v30) & 1;
          int v31 = (v30 >> 8) & 1;
          unint64_t result = swift_bridgeObjectRelease();
          if (v31)
          {
LABEL_31:
            swift_bridgeObjectRelease();
            goto LABEL_32;
          }
        }
        unint64_t v33 = *(void *)(v18 + 16);
        unint64_t v32 = *(void *)(v18 + 24);
        if (v33 >= v32 >> 1)
        {
          unint64_t result = (unint64_t)sub_25A813E54((char *)(v32 > 1), v33 + 1, 1, (char *)v18);
          unint64_t v18 = result;
        }
        *(void *)(v18 + 16) = v33 + 1;
        *(unsigned char *)(v18 + v33 + 32) = v27;
        if (!v28) {
          goto LABEL_34;
        }
        if (!--v15) {
          break;
        }
        unint64_t result = sub_25A82CF30();
        if (result >> 14 < v19 >> 14) {
          goto LABEL_38;
        }
        unint64_t v34 = result;
        --v28;
        uint64_t v25 = sub_25A82CFD0();
        unint64_t v26 = v35;
        unint64_t v27 = v36;
        unint64_t v24 = v37;
        unint64_t v19 = v34;
        if (!((v25 ^ v35) >> 14)) {
          goto LABEL_36;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
LABEL_36:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_32:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t _s17PrivateSearchCore8HexCodecV02toD0ySSSays5UInt8VGFZ_0(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v16 = MEMORY[0x263F8EE78];
    sub_25A810188(0, v1, 0);
    char v3 = (char *)(a1 + 32);
    uint64_t v4 = MEMORY[0x263F8E778];
    uint64_t v5 = MEMORY[0x263F8E7C0];
    do
    {
      char v6 = *v3++;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A465E78);
      uint64_t v7 = swift_allocObject();
      *(_OWORD *)(v7 + 16) = xmmword_25A82E640;
      *(void *)(v7 + 56) = v4;
      *(void *)(v7 + 64) = v5;
      *(unsigned char *)(v7 + 32) = v6;
      uint64_t v8 = sub_25A82CE80();
      uint64_t v10 = v9;
      unint64_t v12 = *(void *)(v16 + 16);
      unint64_t v11 = *(void *)(v16 + 24);
      if (v12 >= v11 >> 1) {
        sub_25A810188(v11 > 1, v12 + 1, 1);
      }
      *(void *)(v16 + 16) = v12 + 1;
      uint64_t v13 = v16 + 16 * v12;
      *(void *)(v13 + 32) = v8;
      *(void *)(v13 + 40) = v10;
      --v1;
    }
    while (v1);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465E80);
  sub_25A817988();
  sub_25A82CE30();
  swift_bridgeObjectRelease();
  uint64_t v14 = sub_25A82CEC0();
  swift_bridgeObjectRelease();
  return v14;
}

ValueMetadata *type metadata accessor for HexCodec()
{
  return &type metadata for HexCodec;
}

unint64_t sub_25A817988()
{
  unint64_t result = qword_26A465E88;
  if (!qword_26A465E88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A465E80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A465E88);
  }
  return result;
}

unint64_t sub_25A8179E4()
{
  unint64_t result = qword_26A465E90;
  if (!qword_26A465E90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A465E90);
  }
  return result;
}

uint64_t InMemoryStore.__allocating_init()()
{
  uint64_t v0 = sub_25A82D1A0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  char v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25A82CE00();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = sub_25A82D190();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = swift_allocObject();
  sub_25A7FEDDC();
  sub_25A82D180();
  sub_25A82CDF0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v0);
  *(void *)(v6 + 16) = sub_25A82D1D0();
  sub_25A817E0C();
  *(void *)(v6 + 24) = sub_25A82CE10();
  return v6;
}

uint64_t InMemoryStore.init()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25A82D1A0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25A82CE00();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = sub_25A82D190();
  MEMORY[0x270FA5388](v7 - 8);
  sub_25A7FEDDC();
  sub_25A82D180();
  sub_25A82CDF0();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8F130], v2);
  *(void *)(v1 + 16) = sub_25A82D1D0();
  sub_25A817E0C();
  *(void *)(v1 + 24) = sub_25A82CE10();
  return v1;
}

unint64_t sub_25A817E0C()
{
  unint64_t result = qword_26A465E98;
  if (!qword_26A465E98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A465E98);
  }
  return result;
}

uint64_t InMemoryStore.reset()()
{
  *(void *)(v1 + 64) = v0;
  return MEMORY[0x270FA2498](sub_25A817E80, 0, 0);
}

uint64_t sub_25A817E80()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = *(NSObject **)(v1 + 16);
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_25A817FF0;
  *(void *)(v3 + 24) = v1;
  v0[6] = sub_25A818044;
  v0[7] = v3;
  v0[2] = MEMORY[0x263EF8330];
  v0[3] = 1107296256;
  v0[4] = sub_25A81806C;
  v0[5] = &block_descriptor;
  uint64_t v4 = _Block_copy(v0 + 2);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v2, v4);
  _Block_release(v4);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v4)
  {
    __break(1u);
  }
  else
  {
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
  return result;
}

uint64_t sub_25A817FF0()
{
  swift_beginAccess();
  *(void *)(v0 + 24) = MEMORY[0x263F8EE80];
  return swift_bridgeObjectRelease();
}

uint64_t sub_25A818034()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25A818044()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_25A81806C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t InMemoryStore.documentCount()()
{
  *(void *)(v1 + 24) = v0;
  return MEMORY[0x270FA2498](sub_25A8180CC, 0, 0);
}

uint64_t sub_25A8180CC()
{
  sub_25A82D1C0();
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_25A818164@<X0>(void *a1@<X8>)
{
  return sub_25A81A680(a1);
}

uint64_t InMemoryStore.isIndexed(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return MEMORY[0x270FA2498](sub_25A8181A4, 0, 0);
}

uint64_t sub_25A8181A4()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 32);
  long long v8 = *(_OWORD *)(v0 + 16);
  uint64_t v4 = swift_task_alloc();
  *(void *)(v4 + 16) = v1;
  *(_OWORD *)(v4 + 24) = v8;
  *(void *)(v4 + 40) = v3;
  *(void *)(v4 + 48) = v2;
  sub_25A82D1C0();
  swift_task_dealloc();
  uint64_t v5 = *(unsigned __int8 *)(v0 + 56);
  uint64_t v6 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v6(v5);
}

uint64_t sub_25A818284@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unsigned char *a6@<X8>)
{
  uint64_t result = swift_beginAccess();
  if (*(void *)(*(void *)(a1 + 24) + 16))
  {
    swift_bridgeObjectRetain();
    sub_25A819AD4(a2, a3, a4, a5);
    char v14 = v13;
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    char v14 = 0;
  }
  *a6 = v14 & 1;
  return result;
}

uint64_t sub_25A81833C@<X0>(unsigned char *a1@<X8>)
{
  return sub_25A81A65C(a1);
}

uint64_t InMemoryStore.write(key:index:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[7] = a6;
  v7[8] = v6;
  v7[5] = a4;
  v7[6] = a5;
  void v7[3] = a2;
  v7[4] = a3;
  v7[2] = a1;
  return MEMORY[0x270FA2498](sub_25A818380, 0, 0);
}

uint64_t sub_25A818380()
{
  InMemoryStore.setIndex(_:_:)(v0[2], v0[3], v0[4], v0[5], v0[6], v0[7]);
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t InMemoryStore.read(tokenHashes:context:)()
{
  return sub_25A82D1C0();
}

uint64_t sub_25A818464(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465F00);
  MEMORY[0x270FA5388](v4);
  uint64_t v9 = a1;
  uint64_t v10 = a2;
  (*(void (**)(unsigned char *, void))(v6 + 104))(&v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)], *MEMORY[0x263F8F680]);
  return sub_25A82D110();
}

uint64_t sub_25A81857C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465F08);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v45 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v42 = v8 + 64;
  uint64_t v10 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & v9;
  int64_t v43 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v44 = (void (**)(char *, uint64_t))(v6 + 8);
  swift_bridgeObjectRetain();
  int64_t v13 = 0;
  if (!v12) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v14 = __clz(__rbit64(v12));
  uint64_t v15 = (v12 - 1) & v12;
  for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v13 << 6))
  {
    uint64_t v20 = *(void *)(a3 + 16);
    if (__OFADD__(v20, 8)) {
      goto LABEL_49;
    }
    unint64_t v49 = v15;
    int64_t v50 = v13;
    uint64_t v21 = *(void *)(v8 + 56);
    unint64_t v22 = (uint64_t *)(*(void *)(v8 + 48) + 32 * i);
    uint64_t v23 = v22[1];
    uint64_t v24 = v22[2];
    uint64_t v25 = v22[3];
    uint64_t v46 = *v22;
    uint64_t v47 = v24;
    uint64_t v26 = *(void *)(v21 + 8 * i);
    uint64_t v48 = v25;
    if ((unint64_t)(v20 + 7) <= 7) {
      break;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_25A82D000();
    *(void *)(v27 + 16) = (unint64_t)(v20 + 7) >> 3;
    bzero((void *)(v27 + 32), (unint64_t)(v20 + 7) >> 3);
    if (v20) {
      goto LABEL_24;
    }
LABEL_41:
    unint64_t v39 = *(void *)(v26 + 16);
    swift_bridgeObjectRelease();
    if (v39 >> 60) {
      goto LABEL_50;
    }
    uint64_t v51 = v46;
    uint64_t v52 = v23;
    uint64_t v53 = v47;
    uint64_t v54 = v48;
    uint64_t v55 = v27;
    uint64_t v56 = 8 * v39;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A465F10);
    unsigned __int8 v40 = v45;
    sub_25A82D0A0();
    (*v44)(v40, v5);
    unint64_t v12 = v49;
    int64_t v13 = v50;
    if (v49) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v17 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      goto LABEL_53;
    }
    if (v17 >= v43)
    {
LABEL_44:
      swift_release();
      uint64_t v51 = 0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A465F10);
      return sub_25A82D0B0();
    }
    unint64_t v18 = *(void *)(v42 + 8 * v17);
    ++v13;
    if (!v18)
    {
      int64_t v13 = v17 + 1;
      if (v17 + 1 >= v43) {
        goto LABEL_44;
      }
      unint64_t v18 = *(void *)(v42 + 8 * v13);
      if (!v18)
      {
        int64_t v13 = v17 + 2;
        if (v17 + 2 >= v43) {
          goto LABEL_44;
        }
        unint64_t v18 = *(void *)(v42 + 8 * v13);
        if (!v18)
        {
          int64_t v19 = v17 + 3;
          if (v19 >= v43) {
            goto LABEL_44;
          }
          unint64_t v18 = *(void *)(v42 + 8 * v19);
          if (!v18)
          {
            while (1)
            {
              int64_t v13 = v19 + 1;
              if (__OFADD__(v19, 1)) {
                goto LABEL_54;
              }
              if (v13 >= v43) {
                goto LABEL_44;
              }
              unint64_t v18 = *(void *)(v42 + 8 * v13);
              ++v19;
              if (v18) {
                goto LABEL_18;
              }
            }
          }
          int64_t v13 = v19;
        }
      }
    }
LABEL_18:
    uint64_t v15 = (v18 - 1) & v18;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v27 = MEMORY[0x263F8EE78];
  if (!v20) {
    goto LABEL_41;
  }
LABEL_24:
  unint64_t v28 = *(void *)(v26 + 16);
  if (v28 >> 60) {
    goto LABEL_51;
  }
  uint64_t v29 = 8 * v28;
  if (((8 * v28) & 0x8000000000000000) != 0) {
    goto LABEL_55;
  }
  if (!v29) {
    goto LABEL_52;
  }
  unint64_t v30 = 0;
  unint64_t v31 = *(void *)(a3 + 32);
  uint64_t v32 = v27 + 32;
  uint64_t v33 = v20 - 1;
  while (2)
  {
    unint64_t v34 = v31 % v29;
    if ((uint64_t)v34 >= v29)
    {
      int v35 = 0;
    }
    else
    {
      if (v34 >> 3 >= v28) {
        goto LABEL_46;
      }
      int v35 = (*(unsigned __int8 *)(v26 + 32 + (v34 >> 3)) >> (v34 & 7)) & 1;
    }
    unint64_t v36 = *(void *)(v27 + 16);
    if (!(v36 >> 60))
    {
      if (v30 >= 8 * v36) {
        goto LABEL_37;
      }
      unint64_t v37 = v30 >> 3;
      char v38 = v30 & 7;
      if (v35)
      {
        if (v30 >> 3 >= v36) {
          goto LABEL_47;
        }
        *(unsigned char *)(v32 + v37) |= 1 << v38;
LABEL_37:
        if (v33 == v30) {
          goto LABEL_41;
        }
      }
      else
      {
        if (v30 >> 3 >= v36) {
          goto LABEL_48;
        }
        *(unsigned char *)(v32 + v37) &= ~(1 << v38);
        if (v33 == v30) {
          goto LABEL_41;
        }
      }
      unint64_t v31 = *(void *)(a3 + 40 + 8 * v30++);
      continue;
    }
    break;
  }
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  uint64_t result = sub_25A82D2F0();
  __break(1u);
  return result;
}

uint64_t InMemoryStore.removeIndex(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (uint64_t *)(v4 + 24);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  unint64_t v10 = sub_25A819AD4(a1, a2, a3, a4);
  LOBYTE(a2) = v11;
  swift_bridgeObjectRelease();
  if (a2)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v9;
    uint64_t v15 = *v9;
    *uint64_t v9 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_25A81A1F8();
      uint64_t v13 = v15;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25A819BAC(v10, v13);
    *uint64_t v9 = v13;
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t InMemoryStore.setIndex(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  unint64_t v14 = *(NSObject **)(v6 + 16);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = v7;
  void v15[3] = a1;
  v15[4] = a2;
  v15[5] = a3;
  v15[6] = a4;
  v15[7] = a5;
  v15[8] = a6;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = sub_25A81A418;
  *(void *)(v16 + 24) = v15;
  v19[4] = sub_25A81A700;
  void v19[5] = v16;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 1107296256;
  v19[2] = sub_25A81806C;
  v19[3] = &block_descriptor_10;
  int64_t v17 = _Block_copy(v19);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v14, v17);
  _Block_release(v17);
  LOBYTE(v14) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v14) {
    __break(1u);
  }
  return result;
}

uint64_t sub_25A818CCC()
{
  return sub_25A818464(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_25A818CE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v14 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = 0x8000000000000000;
  sub_25A81C80C(a6, a2, a3, a4, a5, isUniquelyReferenced_nonNull_native);
  *(void *)(a1 + 24) = v14;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t InMemoryStore.getIndex(_:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465EC0);
  sub_25A82D1C0();
  return v1;
}

uint64_t sub_25A818E44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t result = swift_beginAccess();
  uint64_t v13 = *(void *)(a1 + 24);
  if (!*(void *)(v13 + 16)) {
    goto LABEL_6;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v14 = sub_25A819AD4(a2, a3, a4, a5);
  if ((v15 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
LABEL_6:
    *a6 = 0;
    a6[1] = 0;
    return result;
  }
  uint64_t v16 = *(void *)(*(void *)(v13 + 56) + 8 * v14);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v17 = *(void *)(v16 + 16);
  if (v17 >> 60)
  {
    __break(1u);
  }
  else
  {
    *a6 = v16;
    a6[1] = 8 * v17;
  }
  return result;
}

uint64_t InMemoryStore.allIndices.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t InMemoryStore.totalIndices.getter()
{
  return sub_25A819154();
}

Swift::Void __swiftcall InMemoryStore.reset()()
{
  uint64_t v1 = *(NSObject **)(v0 + 16);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = sub_25A81A460;
  *(void *)(v2 + 24) = v0;
  v4[4] = sub_25A81A700;
  v4[5] = v2;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 1107296256;
  v4[2] = sub_25A81806C;
  v4[3] = &block_descriptor_17;
  uint64_t v3 = _Block_copy(v4);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v1, v3);
  _Block_release(v3);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if (v1) {
    __break(1u);
  }
}

uint64_t sub_25A8190DC(uint64_t a1)
{
  unint64_t v2 = sub_25A81ACF4(MEMORY[0x263F8EE78]);
  swift_beginAccess();
  *(void *)(a1 + 24) = v2;
  return swift_bridgeObjectRelease();
}

Swift::Int64 __swiftcall InMemoryStore.sizeBytes()()
{
  return sub_25A819154();
}

uint64_t sub_25A819154()
{
  sub_25A82D1C0();
  return v1;
}

uint64_t sub_25A81919C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v46 = a2;
  uint64_t v3 = type metadata accessor for Logger();
  MEMORY[0x270FA5388](v3);
  uint64_t v53 = (uint64_t)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_25A82CB10();
  uint64_t v5 = *(void *)(v51 - 8);
  MEMORY[0x270FA5388](v51);
  int64_t v50 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25A82CEA0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  int v57 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v10 = *(void *)(a1 + 24);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v54 = v10 + 64;
  uint64_t v12 = 1 << *(unsigned char *)(v10 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & v11;
  int64_t v55 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v56 = (void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v15 = v7;
  unint64_t v49 = (void (**)(char *, uint64_t))(v5 + 8);
  uint64_t v58 = v10;
  swift_bridgeObjectRetain();
  uint64_t v16 = 0;
  int64_t v17 = 0;
  unint64_t v52 = 0x800000025A82FCC0;
  uint64_t v47 = v7;
  uint64_t v48 = v3;
  while (1)
  {
    uint64_t v64 = v16;
    if (v14)
    {
      uint64_t v60 = (v14 - 1) & v14;
      int64_t v61 = v17;
      unint64_t v18 = __clz(__rbit64(v14)) | (v17 << 6);
      goto LABEL_20;
    }
    int64_t v19 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      goto LABEL_44;
    }
    if (v19 >= v55) {
      break;
    }
    unint64_t v20 = *(void *)(v54 + 8 * v19);
    int64_t v21 = v17 + 1;
    if (!v20)
    {
      int64_t v21 = v17 + 2;
      if (v17 + 2 >= v55) {
        break;
      }
      unint64_t v20 = *(void *)(v54 + 8 * v21);
      if (!v20)
      {
        int64_t v21 = v17 + 3;
        if (v17 + 3 >= v55) {
          break;
        }
        unint64_t v20 = *(void *)(v54 + 8 * v21);
        if (!v20)
        {
          uint64_t v22 = v17 + 4;
          if (v17 + 4 >= v55) {
            break;
          }
          unint64_t v20 = *(void *)(v54 + 8 * v22);
          if (!v20)
          {
            while (1)
            {
              int64_t v21 = v22 + 1;
              if (__OFADD__(v22, 1)) {
                goto LABEL_48;
              }
              if (v21 >= v55) {
                goto LABEL_41;
              }
              unint64_t v20 = *(void *)(v54 + 8 * v21);
              ++v22;
              if (v20) {
                goto LABEL_19;
              }
            }
          }
          int64_t v21 = v17 + 4;
        }
      }
    }
LABEL_19:
    uint64_t v60 = (v20 - 1) & v20;
    int64_t v61 = v21;
    unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
LABEL_20:
    uint64_t v23 = (uint64_t *)(*(void *)(v58 + 48) + 32 * v18);
    unint64_t v24 = v23[1];
    uint64_t v25 = *(void *)(*(void *)(v58 + 56) + 8 * v18);
    uint64_t v62 = *v23;
    unint64_t v63 = v24;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    uint64_t v59 = v25;
    swift_bridgeObjectRetain();
    sub_25A82CF40();
    swift_bridgeObjectRetain();
    sub_25A82CF40();
    swift_bridgeObjectRelease();
    uint64_t v26 = v57;
    sub_25A82CE90();
    uint64_t v27 = sub_25A82CE70();
    unint64_t v29 = v28;
    (*v56)(v26, v15);
    if (v29 >> 60 == 15)
    {
      if (qword_26A465B08 != -1) {
        swift_once();
      }
      uint64_t v30 = __swift_project_value_buffer(v3, (uint64_t)qword_26A465FA8);
      uint64_t v31 = v53;
      sub_25A810F24(v30, v53);
      uint64_t v62 = 0;
      unint64_t v63 = 0xE000000000000000;
      sub_25A82D250();
      swift_bridgeObjectRelease();
      uint64_t v62 = 0x5B20676E69727453;
      unint64_t v63 = 0xE800000000000000;
      sub_25A82CF40();
      sub_25A82CF40();
      sub_25A81D3E8(2, v62, v63);
      swift_bridgeObjectRelease();
      sub_25A811348(v31);
LABEL_27:
      uint64_t v33 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      switch(v29 >> 62)
      {
        case 1uLL:
          if (__OFSUB__(HIDWORD(v27), v27)) {
            goto LABEL_46;
          }
          uint64_t v32 = HIDWORD(v27) - (int)v27;
LABEL_31:
          sub_25A81A6D0(v27, v29);
          if (!v32)
          {
LABEL_26:
            sub_25A81A6E4(v27, v29);
            sub_25A81A6E4(v27, v29);
            goto LABEL_27;
          }
LABEL_32:
          if (v32 < 1)
          {
            uint64_t v33 = (void *)MEMORY[0x263F8EE78];
          }
          else
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_26A465B70);
            uint64_t v33 = (void *)swift_allocObject();
            size_t v36 = _swift_stdlib_malloc_size(v33);
            v33[2] = v32;
            v33[3] = 2 * v36 - 64;
          }
          unint64_t v37 = v50;
          uint64_t v38 = sub_25A82CAF0();
          (*v49)(v37, v51);
          if (v38 != v32) {
            goto LABEL_45;
          }
          sub_25A81A6E4(v27, v29);
          sub_25A81A6E4(v27, v29);
          uint64_t v15 = v47;
          uint64_t v3 = v48;
          break;
        case 2uLL:
          uint64_t v35 = *(void *)(v27 + 16);
          uint64_t v34 = *(void *)(v27 + 24);
          uint64_t v32 = v34 - v35;
          if (!__OFSUB__(v34, v35)) {
            goto LABEL_31;
          }
          goto LABEL_47;
        case 3uLL:
          goto LABEL_26;
        default:
          uint64_t v32 = BYTE6(v29);
          if (!BYTE6(v29)) {
            goto LABEL_26;
          }
          goto LABEL_32;
      }
    }
    uint64_t v39 = v64;
    swift_bridgeObjectRelease();
    uint64_t v40 = v33[2];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v41 = v39 + v40;
    if (__OFADD__(v39, v40))
    {
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
LABEL_47:
      __break(1u);
LABEL_48:
      __break(1u);
      JUMPOUT(0x25A8197C8);
    }
    uint64_t v42 = *(void *)(v59 + 16);
    swift_bridgeObjectRelease();
    BOOL v43 = __OFADD__(v41, v42);
    uint64_t v16 = v41 + v42;
    unint64_t v14 = v60;
    int64_t v17 = v61;
    if (v43) {
      goto LABEL_43;
    }
  }
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v46 = v16;
  return result;
}

uint64_t InMemoryStore.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t InMemoryStore.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_25A819840()
{
  uint64_t v2 = *v0;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_25A800B84;
  v3[8] = v2;
  return MEMORY[0x270FA2498](sub_25A817E80, 0, 0);
}

uint64_t sub_25A8198EC()
{
  *(void *)(v1 + 24) = *v0;
  return MEMORY[0x270FA2498](sub_25A8180CC, 0, 0);
}

uint64_t sub_25A819910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[4] = a3;
  v5[5] = a4;
  v5[2] = a1;
  v5[3] = a2;
  v5[6] = *v4;
  return MEMORY[0x270FA2498](sub_25A8181A4, 0, 0);
}

uint64_t sub_25A81993C()
{
  sub_25A82D1C0();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return sub_25A81A648(v1, v0, v3);
}

uint64_t sub_25A8199F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v7[6] = a5;
  v7[7] = a6;
  v7[4] = a3;
  v7[5] = a4;
  v7[2] = a1;
  void v7[3] = a2;
  v7[8] = *v6;
  return MEMORY[0x270FA2498](sub_25A818380, 0, 0);
}

uint64_t sub_25A819A24()
{
  return sub_25A82D1C0();
}

unint64_t sub_25A819A98(uint64_t a1)
{
  uint64_t v2 = sub_25A82D400();
  return sub_25A819DE4(a1, v2);
}

unint64_t sub_25A819AD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_25A82D410();
  swift_bridgeObjectRetain();
  sub_25A82CF40();
  swift_bridgeObjectRetain();
  sub_25A82CF40();
  swift_bridgeObjectRelease();
  sub_25A82CF00();
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_25A82D430();
  return sub_25A819E80(a1, a2, a3, a4, v8);
}

unint64_t sub_25A819BAC(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_25A82D220();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_25A82D410();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        sub_25A82CF40();
        swift_bridgeObjectRetain();
        sub_25A82CF40();
        swift_bridgeObjectRelease();
        sub_25A82CF00();
        swift_bridgeObjectRelease();
        uint64_t v9 = sub_25A82D430();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 32 * v3);
          uint64_t v13 = (_OWORD *)(v11 + 32 * v6);
          if (v3 != v6 || v12 >= v13 + 2)
          {
            long long v14 = v13[1];
            *uint64_t v12 = *v13;
            v12[1] = v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          uint64_t v16 = (void *)(v15 + 8 * v3);
          int64_t v17 = (void *)(v15 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 1))
          {
            *uint64_t v16 = *v17;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *unint64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_25A819DE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_25A819E80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v7 = a5 & ~v6;
  uint64_t v14 = v5 + 64;
  if ((*(void *)(v5 + 64 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7))
  {
    uint64_t v8 = v5;
    uint64_t v13 = ~v6;
    while (1)
    {
      unint64_t v10 = (uint64_t *)(*(void *)(v8 + 48) + 32 * v7);
      uint64_t v16 = *v10;
      uint64_t v17 = v10[1];
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_25A82CF40();
      swift_bridgeObjectRetain();
      sub_25A82CF40();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_25A82CF40();
      swift_bridgeObjectRetain();
      sub_25A82CF40();
      swift_bridgeObjectRelease();
      if (v16 == a1 && v17 == a2) {
        break;
      }
      char v11 = sub_25A82D370();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
        unint64_t v7 = (v7 + 1) & v13;
        if ((*(void *)(v14 + ((v7 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v7)) {
          continue;
        }
      }
      return v7;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
  }
  return v7;
}

void *sub_25A81A054()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465F18);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25A82D300();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25A81A1F8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465EF8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25A82D300();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v24 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v24 >= v13) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v24);
    ++v9;
    if (!v25)
    {
      int64_t v9 = v24 + 1;
      if (v24 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v25 = *(void *)(v6 + 8 * v9);
      if (!v25) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v25 - 1) & v25;
    unint64_t v15 = __clz(__rbit64(v25)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 32 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 32 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = v17[2];
    uint64_t v20 = v17[3];
    uint64_t v21 = 8 * v15;
    uint64_t v22 = *(void *)(*(void *)(v2 + 56) + v21);
    uint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v23 = *v17;
    v23[1] = v18;
    v23[2] = v19;
    v23[3] = v20;
    *(void *)(*(void *)(v4 + 56) + v21) = v22;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v13) {
    goto LABEL_26;
  }
  unint64_t v25 = *(void *)(v6 + 8 * v26);
  if (v25)
  {
    int64_t v9 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v9);
    ++v26;
    if (v25) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_25A81A3C8()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_25A81A418()
{
  return sub_25A818CE8(v0[2], v0[3], v0[4], v0[5], v0[6], v0[7]);
}

uint64_t sub_25A81A42C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25A81A43C@<X0>(void *a1@<X8>)
{
  return sub_25A818E44(v1[2], v1[3], v1[4], v1[5], v1[6], a1);
}

uint64_t sub_25A81A460()
{
  return sub_25A8190DC(v0);
}

uint64_t sub_25A81A468()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25A81A478@<X0>(void *a1@<X8>)
{
  return sub_25A81919C(v1, a1);
}

uint64_t type metadata accessor for InMemoryStore()
{
  return self;
}

void *sub_25A81A4B8()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465EF0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25A82D300();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v21 = __clz(__rbit64(v19));
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = v21 + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_25A81A648(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_25A81A65C@<X0>(unsigned char *a1@<X8>)
{
  return sub_25A818284(v1[2], v1[3], v1[4], v1[5], v1[6], a1);
}

uint64_t sub_25A81A680@<X0>(void *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = *(void *)(*(void *)(v1 + 24) + 16);
  return result;
}

uint64_t sub_25A81A6D0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_25A8109EC(a1, a2);
  }
  return a1;
}

uint64_t sub_25A81A6E4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_25A810A44(a1, a2);
  }
  return a1;
}

uint64_t sub_25A81A6F8(uint64_t a1)
{
  return sub_25A81857C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_25A81A718()
{
  return sub_25A818CCC();
}

uint64_t sub_25A81A730()
{
  v1[10] = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465F30);
  v1[11] = v2;
  v1[12] = *(void *)(v2 - 8);
  v1[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25A81A7F4, 0, 0);
}

uint64_t sub_25A81A7F4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465DC8);
  sub_25A82D0D0();
  v0[14] = MEMORY[0x263F8EE78];
  uint64_t v1 = (void *)swift_task_alloc();
  v0[15] = v1;
  void *v1 = v0;
  v1[1] = sub_25A81A8D8;
  uint64_t v2 = v0[11];
  return MEMORY[0x270FA20F8](v0 + 2, 0, 0, v2, v0 + 8);
}

uint64_t sub_25A81A8D8()
{
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v1 = sub_25A81ABC4;
  }
  else
  {
    uint64_t v1 = sub_25A81A9F0;
  }
  return MEMORY[0x270FA2498](v1, 0, 0);
}

uint64_t sub_25A81A9F0()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 24);
  if (v1)
  {
    uint64_t v3 = *(void *)(v0 + 32);
    long long v15 = *(_OWORD *)(v0 + 40);
    uint64_t v4 = *(void *)(v0 + 56);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v6 = *(void **)(v0 + 112);
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v6 = sub_25A81406C(0, v6[2] + 1, 1, v6);
    }
    unint64_t v8 = v6[2];
    unint64_t v7 = v6[3];
    if (v8 >= v7 >> 1) {
      uint64_t v6 = sub_25A81406C((void *)(v7 > 1), v8 + 1, 1, v6);
    }
    long long v6[2] = v8 + 1;
    int64_t v9 = &v6[6 * v8];
    v9[4] = v2;
    v9[5] = v1;
    v9[6] = v3;
    *(_OWORD *)(v9 + 7) = v15;
    v9[9] = v4;
    *(void *)(v0 + 112) = v6;
    uint64_t v10 = (void *)swift_task_alloc();
    *(void *)(v0 + 120) = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_25A81A8D8;
    uint64_t v11 = *(void *)(v0 + 88);
    return MEMORY[0x270FA20F8](v0 + 16, 0, 0, v11, v0 + 64);
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 96) + 8))(*(void *)(v0 + 104), *(void *)(v0 + 88));
    swift_task_dealloc();
    unint64_t v12 = *(uint64_t (**)(uint64_t))(v0 + 8);
    uint64_t v13 = *(void *)(v0 + 112);
    return v12(v13);
  }
}

uint64_t sub_25A81ABC4()
{
  uint64_t v1 = v0[8];
  v0[9] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465B80);
  if (sub_25A82D360())
  {
    MEMORY[0x261146370](v1);
  }
  else
  {
    swift_allocError();
    void *v2 = v0[9];
  }
  (*(void (**)(void, void))(v0[12] + 8))(v0[13], v0[11]);
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t LevelCapacityUsageState.__allocating_init(levelCapacity:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  LevelCapacityUsageState.init(levelCapacity:)(a1);
  return v2;
}

unint64_t sub_25A81ACF4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465EF8);
  uint64_t v2 = (void *)sub_25A82D320();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 64);
  while (1)
  {
    uint64_t v5 = *(v4 - 4);
    uint64_t v6 = *(v4 - 3);
    uint64_t v7 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v9 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_25A819AD4(v5, v6, v7, v8);
    if (v11) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v12 = (uint64_t *)(v2[6] + 32 * result);
    *unint64_t v12 = v5;
    v12[1] = v6;
    long long v12[2] = v7;
    v12[3] = v8;
    *(void *)(v2[7] + 8 * result) = v9;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v2[2] = v15;
    v4 += 5;
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

void *LevelCapacityUsageState.init(levelCapacity:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_25A82D1A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25A82CE00();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v9 = sub_25A82D190();
  MEMORY[0x270FA5388](v9 - 8);
  sub_25A7FEDDC();
  sub_25A82D180();
  sub_25A82CDF0();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F8F130], v4);
  v2[2] = sub_25A82D1D0();
  v2[3] = 0;
  v2[4] = a1;
  v2[5] = sub_25A81CADC(MEMORY[0x263F8EE78]);
  return v2;
}

Swift::Void __swiftcall LevelCapacityUsageState.setLevelCapacity(to:)(Swift::UInt64 to)
{
  uint64_t v3 = sub_25A82CDE0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v7[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_25A82CDD0();
  uint64_t v8 = v1;
  Swift::UInt64 v9 = to;
  sub_25A82D1B0();
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

Swift::UInt64 __swiftcall LevelCapacityUsageState.fetch(_:)(Swift::UInt64 a1)
{
  sub_25A82D1C0();
  return v2;
}

uint64_t sub_25A81B178@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t result = swift_beginAccess();
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(v7 + 16);
  if (v8)
  {
    uint64_t result = sub_25A81A704(a2);
    if (v9) {
      uint64_t v8 = *(void *)(*(void *)(v7 + 56) + 8 * result);
    }
    else {
      uint64_t v8 = 0;
    }
  }
  *a3 = v8;
  return result;
}

uint64_t sub_25A81B1F8(uint64_t a1)
{
  uint64_t v3 = (uint64_t *)(v1 + 40);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v1 + 40);
  if (!*(void *)(v4 + 16) || (uint64_t result = sub_25A81A704(a1), (v6 & 1) == 0))
  {
    swift_beginAccess();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    uint64_t v10 = 1;
    goto LABEL_6;
  }
  uint64_t v7 = *(void *)(*(void *)(v4 + 56) + 8 * result);
  uint64_t v8 = v7 + 1;
  if (v7 != -1)
  {
    swift_beginAccess();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    uint64_t v10 = v8;
LABEL_6:
    sub_25A81C9AC(v10, a1, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v11;
    swift_bridgeObjectRelease();
    return swift_endAccess();
  }
  __break(1u);
  return result;
}

Swift::UInt64 __swiftcall LevelCapacityUsageState.requestAndUpdate(_:)(Swift::UInt64 a1)
{
  uint64_t v3 = sub_25A82CDE0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  Swift::UInt64 v12 = a1;
  sub_25A82CDD0();
  uint64_t v9 = v1;
  Swift::UInt64 v10 = a1;
  uint64_t v11 = &v12;
  sub_25A82D1B0();
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  return v12;
}

uint64_t sub_25A81B41C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  swift_beginAccess();
  uint64_t v6 = *(void *)(a1 + 40);
  if (!*(void *)(v6 + 16) || (uint64_t result = sub_25A81A704(a2), (v8 & 1) == 0))
  {
    uint64_t v9 = *a3;
    return sub_25A81B1F8(v9);
  }
  if (*(void *)(*(void *)(v6 + 56) + 8 * result) < *(void *)(a1 + 32))
  {
    *a3 = a2;
    uint64_t v9 = a2;
    return sub_25A81B1F8(v9);
  }
  if (a2 == -1) {
    __break(1u);
  }
  else {
    *a3 = a2 + 1;
  }
  return result;
}

uint64_t LevelCapacityUsageState.refresh(searchIndexReader:level0BloomFilterSizeBits:levelCapacity:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[16] = a3;
  v4[17] = v3;
  v4[14] = a1;
  v4[15] = a2;
  uint64_t v5 = sub_25A82CDE0();
  v4[18] = v5;
  v4[19] = *(void *)(v5 - 8);
  v4[20] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465DC8);
  v4[21] = v6;
  v4[22] = *(void *)(v6 - 8);
  v4[23] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25A81B5F4, 0, 0);
}

uint64_t sub_25A81B5F4()
{
  uint64_t v9 = v0 + 16;
  uint64_t v1 = *(void **)(v0 + 112);
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  if (qword_26A465AF8 != -1) {
    swift_once();
  }
  uint64_t v4 = static DocumentProcessor.kDummyTokenHash;
  uint64_t v5 = type metadata accessor for CallContextImpl();
  *(_OWORD *)(v0 + 56) = 0u;
  *(_OWORD *)(v0 + 72) = 0u;
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 32) = 0u;
  *(_OWORD *)(v6 + 16) = 0u;
  swift_beginAccess();
  sub_25A80EBDC(v0 + 56, v6 + 16);
  swift_endAccess();
  *(void *)(v0 + 40) = v5;
  *(void *)(v0 + 48) = &protocol witness table for CallContextImpl;
  *(void *)(v0 + 16) = v6;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 8))(v4, v9, v2, v3);
  __swift_destroy_boxed_opaque_existential_1(v9);
  Swift::UInt64 v10 = (uint64_t (__cdecl *)())((char *)&dword_26A465F28 + dword_26A465F28);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 192) = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_25A81B81C;
  return v10();
}

uint64_t sub_25A81B81C(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  uint64_t v5 = *(void *)(*(void *)v2 + 176);
  v4[25] = v1;
  swift_task_dealloc();
  uint64_t v6 = (void (**)(uint64_t, uint64_t))(v5 + 8);
  uint64_t v7 = v4[23];
  uint64_t v8 = v4[21];
  if (v1)
  {
    (*v6)(v7, v8);
    uint64_t v9 = sub_25A81BAC0;
  }
  else
  {
    v4[26] = a1;
    (*v6)(v7, v8);
    uint64_t v9 = sub_25A81B9A8;
  }
  return MEMORY[0x270FA2498](v9, 0, 0);
}

uint64_t sub_25A81B9A8()
{
  uint64_t v1 = v0[26];
  uint64_t v3 = v0[19];
  uint64_t v2 = v0[20];
  uint64_t v4 = v0[17];
  uint64_t v10 = v0[18];
  uint64_t v6 = v0[15];
  uint64_t v5 = v0[16];
  sub_25A82CDD0();
  uint64_t v7 = (void *)swift_task_alloc();
  v7[2] = v4;
  void v7[3] = v5;
  v7[4] = v1;
  v7[5] = v6;
  sub_25A82D1B0();
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v10);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_25A81BAC0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_25A81BB30(void *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v9 = sub_25A82CB60();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  Swift::UInt64 v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  a1[5] = MEMORY[0x263F8EE80];
  swift_bridgeObjectRelease();
  a1[4] = a2;
  int64_t v13 = *(void *)(a3 + 16);
  uint64_t v14 = MEMORY[0x263F8EE78];
  if (v13)
  {
    v25[1] = v4;
    uint64_t v26 = MEMORY[0x263F8EE78];
    sub_25A8101EC(0, v13, 0);
    uint64_t v14 = v26;
    double v15 = log2((double)a4);
    unint64_t v16 = *(void *)(v14 + 16);
    uint64_t v17 = (uint64_t *)(a3 + 72);
    do
    {
      uint64_t v18 = *v17;
      v17 += 6;
      double v19 = log2((double)v18);
      uint64_t v26 = v14;
      unint64_t v20 = *(void *)(v14 + 24);
      if (v16 >= v20 >> 1)
      {
        sub_25A8101EC(v20 > 1, v16 + 1, 1);
        uint64_t v14 = v26;
      }
      *(void *)(v14 + 16) = v16 + 1;
      *(double *)(v14 + 8 * v16++ + 32) = v19 - v15;
      --v13;
    }
    while (v13);
  }
  swift_retain();
  sub_25A81CC20(v14, (uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_25A82CB50();
  sub_25A82CB40();
  double v22 = v21;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  double v24 = v22 * 1000.0;
  if ((~COERCE__INT64(v22 * 1000.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v24 <= -9.22337204e18)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v24 < 9.22337204e18)
  {
    a1[3] = (uint64_t)v24;
    return result;
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t LevelCapacityUsageState.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t LevelCapacityUsageState.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t sub_25A81BE0C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465F18);
  uint64_t result = sub_25A82D310();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v31 = -1 << v10;
    uint64_t v32 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v33) {
          goto LABEL_33;
        }
        unint64_t v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v22 = v9[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              if (a2)
              {
                if (v32 >= 64) {
                  bzero((void *)(v5 + 64), 8 * v33);
                }
                else {
                  *uint64_t v9 = v31;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_41;
                }
                if (v8 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v22 = v9[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v12 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v28 = 8 * v20;
      uint64_t v29 = *(void *)(*(void *)(v5 + 48) + v28);
      uint64_t v30 = *(void *)(*(void *)(v5 + 56) + v28);
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      uint64_t result = sub_25A82D400();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = 8 * v17;
      *(void *)(*(void *)(v7 + 48) + v18) = v29;
      *(void *)(*(void *)(v7 + 56) + v18) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_25A81C0C4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465EF8);
  char v39 = a2;
  uint64_t v6 = sub_25A82D310();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    unint64_t v37 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v36 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    for (i = v5; ; uint64_t v5 = i)
    {
      if (v10)
      {
        unint64_t v19 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v20 = v19 | (v13 << 6);
      }
      else
      {
        int64_t v21 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v21 >= v36) {
          goto LABEL_33;
        }
        unint64_t v22 = v37[v21];
        ++v13;
        if (!v22)
        {
          int64_t v13 = v21 + 1;
          if (v21 + 1 >= v36) {
            goto LABEL_33;
          }
          unint64_t v22 = v37[v13];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v36)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if (v39)
              {
                uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
                if (v35 >= 64) {
                  bzero(v37, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v37 = -1 << v35;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v37[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v13 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v36) {
                  goto LABEL_33;
                }
                unint64_t v22 = v37[v13];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v13 = v23;
          }
        }
LABEL_30:
        unint64_t v10 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v13 << 6);
      }
      uint64_t v28 = *(void *)(v5 + 56);
      uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 32 * v20);
      uint64_t v30 = *v29;
      uint64_t v31 = v29[1];
      uint64_t v33 = v29[2];
      uint64_t v32 = v29[3];
      uint64_t v34 = *(void *)(v28 + 8 * v20);
      if ((v39 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_25A82D410();
      swift_bridgeObjectRetain();
      sub_25A82CF40();
      swift_bridgeObjectRetain();
      sub_25A82CF40();
      swift_bridgeObjectRelease();
      sub_25A82CF00();
      swift_bridgeObjectRelease();
      uint64_t result = sub_25A82D430();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v11 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = (void *)(*(void *)(v7 + 48) + 32 * v17);
      *uint64_t v18 = v30;
      v18[1] = v31;
      v18[2] = v33;
      v18[3] = v32;
      *(void *)(*(void *)(v7 + 56) + 8 * v17) = v34;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_25A81C428(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465EF0);
  uint64_t result = sub_25A82D310();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v35 = a2;
    uint64_t v34 = v3;
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v32 = -1 << v10;
    uint64_t v33 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v13 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v17 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v18 = v17 | (v8 << 6);
      }
      else
      {
        int64_t v19 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v19 >= v13) {
          goto LABEL_31;
        }
        unint64_t v20 = v9[v19];
        ++v8;
        if (!v20)
        {
          int64_t v8 = v19 + 1;
          if (v19 + 1 >= v13) {
            goto LABEL_31;
          }
          unint64_t v20 = v9[v8];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v13)
            {
LABEL_31:
              if ((v35 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v34;
                goto LABEL_38;
              }
              if (v33 >= 64) {
                bzero((void *)(v5 + 64), 8 * v13);
              }
              else {
                *uint64_t v9 = v32;
              }
              uint64_t v3 = v34;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v20 = v9[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v8 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_40;
                }
                if (v8 >= v13) {
                  goto LABEL_31;
                }
                unint64_t v20 = v9[v8];
                ++v21;
                if (v20) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v21;
          }
        }
LABEL_21:
        unint64_t v12 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      uint64_t v22 = 8 * v18;
      uint64_t v23 = *(void *)(*(void *)(v5 + 48) + v22);
      uint64_t v24 = *(void *)(*(void *)(v5 + 56) + v22);
      uint64_t result = sub_25A82D400();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v14 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v26) & ~*(void *)(v14 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_39;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v14 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      uint64_t v16 = 8 * v15;
      *(void *)(*(void *)(v7 + 48) + v16) = v23;
      *(void *)(*(void *)(v7 + 56) + v16) = v24;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_25A81C6D0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_25A819A98(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_25A81A054();
LABEL_7:
    uint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    uint64_t v19 = 8 * v10;
    *(void *)(v16[6] + v19) = a2;
    *(void *)(v16[7] + v19) = a1;
    uint64_t v20 = v16[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }
    goto LABEL_14;
  }
  sub_25A81BE0C(result, a3 & 1);
  uint64_t result = sub_25A819A98(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    unint64_t v10 = result;
    uint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_25A82D3A0();
  __break(1u);
  return result;
}

uint64_t sub_25A81C80C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v7 = v6;
  uint64_t v14 = *v6;
  unint64_t v16 = sub_25A819AD4(a2, a3, a4, a5);
  uint64_t v17 = *(void *)(v14 + 16);
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v20 = v15;
  uint64_t v21 = *(void *)(v14 + 24);
  if (v21 >= v19 && (a6 & 1) != 0) {
    goto LABEL_7;
  }
  if (v21 >= v19 && (a6 & 1) == 0)
  {
    sub_25A81A1F8();
LABEL_7:
    uint64_t v22 = (void *)*v7;
    if (v20)
    {
LABEL_8:
      uint64_t v23 = v22[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v23 + 8 * v16) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_25A81C0C4(v19, a6 & 1);
  unint64_t v25 = sub_25A819AD4(a2, a3, a4, a5);
  if ((v20 & 1) != (v26 & 1))
  {
LABEL_17:
    uint64_t result = sub_25A82D3A0();
    __break(1u);
    return result;
  }
  unint64_t v16 = v25;
  uint64_t v22 = (void *)*v7;
  if (v20) {
    goto LABEL_8;
  }
LABEL_11:
  v22[(v16 >> 6) + 8] |= 1 << v16;
  unint64_t v27 = (uint64_t *)(v22[6] + 32 * v16);
  uint64_t *v27 = a2;
  v27[1] = a3;
  v27[2] = a4;
  v27[3] = a5;
  *(void *)(v22[7] + 8 * v16) = a1;
  uint64_t v28 = v22[2];
  BOOL v29 = __OFADD__(v28, 1);
  uint64_t v30 = v28 + 1;
  if (v29)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v22[2] = v30;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_25A81C9AC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_25A81A704(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_25A81A4B8();
LABEL_7:
    unint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      *(void *)(v16[7] + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    uint64_t v18 = 8 * v10;
    *(void *)(v16[6] + v18) = a2;
    *(void *)(v16[7] + v18) = a1;
    uint64_t v19 = v16[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (!v20)
    {
      v16[2] = v21;
      return result;
    }
    goto LABEL_14;
  }
  sub_25A81C428(result, a3 & 1);
  uint64_t result = sub_25A81A704(a2);
  if ((v14 & 1) == (v17 & 1))
  {
    unint64_t v10 = result;
    unint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_25A82D3A0();
  __break(1u);
  return result;
}

unint64_t sub_25A81CADC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A465EF0);
    uint64_t v3 = (void *)sub_25A82D320();
    for (uint64_t i = (uint64_t *)(a1 + 40); ; i += 2)
    {
      uint64_t v5 = *(i - 1);
      uint64_t v6 = *i;
      unint64_t result = sub_25A81A704(v5);
      if (v8) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      uint64_t v9 = 8 * result;
      *(void *)(v3[6] + v9) = v5;
      *(void *)(v3[7] + v9) = v6;
      uint64_t v10 = v3[2];
      BOOL v11 = __OFADD__(v10, 1);
      uint64_t v12 = v10 + 1;
      if (v11) {
        goto LABEL_10;
      }
      v3[2] = v12;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

void sub_25A81CBB4()
{
  *(void *)(*(void *)(v0 + 16) + 32) = *(void *)(v0 + 24);
}

uint64_t sub_25A81CBC0@<X0>(void *a1@<X8>)
{
  return sub_25A81B178(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_25A81CBDC()
{
  return sub_25A81BB30(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t type metadata accessor for LevelCapacityUsageState()
{
  return self;
}

uint64_t sub_25A81CC20(uint64_t a1, uint64_t a2)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = MEMORY[0x263F8EE78];
  if (!v2) {
    return v3;
  }
  uint64_t v50 = MEMORY[0x263F8EE78];
  sub_25A8101CC(0, v2, 0);
  uint64_t v3 = v50;
  uint64_t v6 = (double *)(a1 + 32);
  uint64_t v7 = (uint64_t *)(a2 + 40);
  swift_beginAccess();
  while (1)
  {
    double v8 = *v6 + *v6;
    if ((~*(void *)&v8 & 0x7FF0000000000000) == 0) {
      break;
    }
    if (v8 <= -1.0) {
      goto LABEL_37;
    }
    if (v8 >= 1.84467441e19) {
      goto LABEL_38;
    }
    unint64_t v9 = (unint64_t)v8;
    uint64_t v10 = (void *)*v7;
    if (*(void *)(*v7 + 16) && (uint64_t v11 = sub_25A81A704((unint64_t)v8), (v12 & 1) != 0))
    {
      uint64_t v13 = *(void *)(v10[7] + 8 * v11);
      BOOL v14 = __CFADD__(v13, 1);
      uint64_t v15 = v13 + 1;
      if (v14) {
        goto LABEL_41;
      }
      uint64_t v47 = v15;
      swift_beginAccess();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      char v17 = (void *)*v7;
      uint64_t v48 = (void *)*v7;
      *uint64_t v7 = 0x8000000000000000;
      unint64_t v19 = sub_25A81A704(v9);
      uint64_t v20 = v17[2];
      BOOL v21 = (v18 & 1) == 0;
      uint64_t v22 = v20 + v21;
      if (__OFADD__(v20, v21)) {
        goto LABEL_42;
      }
      char v23 = v18;
      if (v17[3] >= v22)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          char v26 = v48;
          if ((v18 & 1) == 0) {
            goto LABEL_30;
          }
        }
        else
        {
          sub_25A81A4B8();
          char v26 = v48;
          if ((v23 & 1) == 0) {
            goto LABEL_30;
          }
        }
      }
      else
      {
        sub_25A81C428(v22, isUniquelyReferenced_nonNull_native);
        uint64_t v24 = sub_25A81A704(v9);
        if ((v23 & 1) != (v25 & 1)) {
          goto LABEL_44;
        }
        unint64_t v19 = v24;
        char v26 = v48;
        if ((v23 & 1) == 0)
        {
LABEL_30:
          v26[(v19 >> 6) + 8] |= 1 << v19;
          uint64_t v41 = 8 * v19;
          *(void *)(v26[6] + v41) = v9;
          *(void *)(v26[7] + v41) = v47;
          uint64_t v42 = v26[2];
          BOOL v39 = __OFADD__(v42, 1);
          uint64_t v40 = v42 + 1;
          if (v39) {
            goto LABEL_43;
          }
LABEL_31:
          v26[2] = v40;
          goto LABEL_32;
        }
      }
      *(void *)(v26[7] + 8 * v19) = v47;
    }
    else
    {
      swift_beginAccess();
      char v27 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v28 = (void *)*v7;
      unint64_t v49 = (void *)*v7;
      *uint64_t v7 = 0x8000000000000000;
      unint64_t v30 = sub_25A81A704(v9);
      uint64_t v31 = v28[2];
      BOOL v32 = (v29 & 1) == 0;
      uint64_t v33 = v31 + v32;
      if (__OFADD__(v31, v32)) {
        goto LABEL_39;
      }
      char v34 = v29;
      if (v28[3] >= v33)
      {
        if (v27)
        {
          char v26 = v49;
          if ((v29 & 1) == 0) {
            goto LABEL_26;
          }
        }
        else
        {
          sub_25A81A4B8();
          char v26 = v49;
          if ((v34 & 1) == 0) {
            goto LABEL_26;
          }
        }
      }
      else
      {
        sub_25A81C428(v33, v27);
        uint64_t v35 = sub_25A81A704(v9);
        if ((v34 & 1) != (v36 & 1)) {
          goto LABEL_44;
        }
        unint64_t v30 = v35;
        char v26 = v49;
        if ((v34 & 1) == 0)
        {
LABEL_26:
          v26[(v30 >> 6) + 8] |= 1 << v30;
          uint64_t v37 = 8 * v30;
          *(void *)(v26[6] + v37) = v9;
          *(void *)(v26[7] + v37) = 1;
          uint64_t v38 = v26[2];
          BOOL v39 = __OFADD__(v38, 1);
          uint64_t v40 = v38 + 1;
          if (v39) {
            goto LABEL_40;
          }
          goto LABEL_31;
        }
      }
      *(void *)(v26[7] + 8 * v30) = 1;
    }
LABEL_32:
    *uint64_t v7 = (uint64_t)v26;
    swift_bridgeObjectRelease();
    swift_endAccess();
    unint64_t v44 = *(void *)(v50 + 16);
    unint64_t v43 = *(void *)(v50 + 24);
    unint64_t v45 = v44 + 1;
    if (v44 >= v43 >> 1) {
      sub_25A8101CC(v43 > 1, v44 + 1, 1);
    }
    *(void *)(v50 + 16) = v45;
    ++v6;
    if (!--v2) {
      return v3;
    }
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
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
LABEL_44:
  uint64_t result = sub_25A82D3A0();
  __break(1u);
  return result;
}

unint64_t sub_25A81CFC4(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465F18);
  uint64_t v3 = (void *)sub_25A82D320();
  uint64_t v5 = a1[4];
  uint64_t v4 = a1[5];
  unint64_t result = sub_25A819A98(v5);
  if (v7)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  double v8 = a1 + 7;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v3[6] + v9) = v5;
    *(void *)(v3[7] + v9) = v4;
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      break;
    }
    v3[2] = v12;
    if (!--v1) {
      goto LABEL_8;
    }
    uint64_t v13 = v8 + 2;
    uint64_t v5 = *(v8 - 1);
    uint64_t v14 = *v8;
    swift_bridgeObjectRetain();
    unint64_t result = sub_25A819A98(v5);
    double v8 = v13;
    uint64_t v4 = v14;
    if (v15) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t Logger.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v22 = sub_25A82CDC0();
  uint64_t v6 = *(void *)(v22 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v22);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a2 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v7);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v14((char *)&v21 - v15, a1, a2);
  if (swift_dynamicCast())
  {
    uint64_t v16 = v23;
    uint64_t v17 = v24;
  }
  else
  {
    v14(v13, a1, a2);
    uint64_t v16 = sub_25A82CEB0();
    uint64_t v17 = v18;
  }
  *a3 = v16;
  a3[1] = v17;
  swift_bridgeObjectRetain();
  sub_25A82CDB0();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, a2);
  uint64_t v19 = type metadata accessor for Logger();
  return (*(uint64_t (**)(char *, char *, uint64_t))(v6 + 32))((char *)a3 + *(int *)(v19 + 20), v9, v22);
}

uint64_t type metadata accessor for Logger()
{
  uint64_t result = qword_26A465F48;
  if (!qword_26A465F48) {
    return swift_getSingletonMetadata();
  }
  return result;
}

Swift::Void __swiftcall Logger.error(_:)(Swift::String a1)
{
}

void sub_25A81D35C()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  uint64_t v1 = (void *)sub_25A82CE50();
  objc_msgSend(v0, sel_setDateFormat_, v1);

  qword_26A465F38 = (uint64_t)v0;
}

Swift::Void __swiftcall Logger.debug(_:)(Swift::String a1)
{
}

uint64_t sub_25A81D3E8(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v38 = a2;
  uint64_t v6 = sub_25A82CB60();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v35 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25A82CDC0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(int *)(type metadata accessor for Logger() + 20);
  uint64_t v36 = v3;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v3 + v13, v9);
  uint64_t v37 = a1;
  switch((char)a1)
  {
    case 1:
      os_log_type_t v14 = sub_25A82D150();
      break;
    case 2:
    case 3:
      os_log_type_t v14 = sub_25A82D170();
      break;
    default:
      os_log_type_t v14 = sub_25A82D160();
      break;
  }
  os_log_type_t v15 = v14;
  swift_bridgeObjectRetain_n();
  uint64_t v16 = sub_25A82CDA0();
  if (os_log_type_enabled(v16, v15))
  {
    uint64_t v17 = v9;
    uint64_t v32 = v6;
    uint64_t v33 = v7;
    unint64_t v34 = a3;
    uint64_t v18 = 0x4755424544;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    uint64_t v40 = v20;
    *(_DWORD *)uint64_t v19 = 136315394;
    unint64_t v21 = 0xE500000000000000;
    uint64_t v22 = v20;
    switch((char)v37)
    {
      case 0:
        break;
      case 1:
        unint64_t v21 = 0xE400000000000000;
        uint64_t v18 = 1330007625;
        break;
      case 2:
        unint64_t v21 = 0xE400000000000000;
        uint64_t v18 = 1314013527;
        break;
      case 3:
        uint64_t v18 = 0x524F525245;
        break;
      default:
        JUMPOUT(0);
    }
    uint64_t v39 = sub_25A81E038(v18, v21, &v40);
    sub_25A82D1F0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2080;
    unint64_t v24 = v34;
    swift_bridgeObjectRetain();
    uint64_t v39 = sub_25A81E038(v38, v24, &v40);
    sub_25A82D1F0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25A7FC000, v16, v15, "[%s] %s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261146490](v22, -1, -1);
    MEMORY[0x261146490](v19, -1, -1);

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v17);
    uint64_t v6 = v32;
    uint64_t v7 = v33;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  if (byte_26A465F40 == 1)
  {
    uint64_t v40 = 91;
    unint64_t v41 = 0xE100000000000000;
    if (qword_26A465B00 != -1) {
      swift_once();
    }
    char v25 = (void *)qword_26A465F38;
    char v26 = v35;
    sub_25A82CB50();
    char v27 = (void *)sub_25A82CB30();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v26, v6);
    id v28 = objc_msgSend(v25, sel_stringFromDate_, v27);

    sub_25A82CE60();
    sub_25A82CF40();
    swift_bridgeObjectRelease();
    sub_25A82CF40();
    sub_25A82CF40();
    swift_bridgeObjectRelease();
    sub_25A82CF40();
    swift_bridgeObjectRetain();
    sub_25A82CF40();
    swift_bridgeObjectRelease();
    sub_25A82CF40();
    sub_25A82CF40();
    uint64_t v29 = v40;
    unint64_t v30 = v41;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A465F58);
    uint64_t v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_25A82E640;
    *(void *)(v31 + 56) = MEMORY[0x263F8D310];
    *(void *)(v31 + 32) = v29;
    *(void *)(v31 + 40) = v30;
    sub_25A82D3F0();
    return swift_bridgeObjectRelease();
  }
  return result;
}

Swift::Void __swiftcall Logger.info(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall Logger.info(_:)(Swift::OpaquePointer a1)
{
  uint64_t v1 = *((void *)a1._rawValue + 2);
  if (v1)
  {
    int64_t v2 = (unint64_t *)(swift_bridgeObjectRetain() + 40);
    do
    {
      uint64_t v3 = *(v2 - 1);
      unint64_t v4 = *v2;
      swift_bridgeObjectRetain();
      sub_25A81D3E8(1, v3, v4);
      swift_bridgeObjectRelease();
      v2 += 2;
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
  }
}

Swift::Void __swiftcall Logger.warn(_:)(Swift::String a1)
{
}

uint64_t static Logger.setWriteToStdout(enabled:)(uint64_t result)
{
  byte_26A465F40 = result;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Logger(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    uint64_t *v3 = *a2;
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
    uint64_t v9 = sub_25A82CDC0();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t destroy for Logger(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_25A82CDC0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void *initializeWithCopy for Logger(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_25A82CDC0();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

void *assignWithCopy for Logger(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25A82CDC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for Logger(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_25A82CDC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *assignWithTake for Logger(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_25A82CDC0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for Logger(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A81DE34);
}

uint64_t sub_25A81DE34(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_25A82CDC0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for Logger(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A81DEF8);
}

uint64_t sub_25A81DEF8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_25A82CDC0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_25A81DFA0()
{
  uint64_t result = sub_25A82CDC0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_25A81E038(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25A81E10C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25A81E70C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_25A81E70C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_25A81E10C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_25A82D200();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25A81E2C8(a5, a6);
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
  uint64_t v8 = sub_25A82D270();
  if (!v8)
  {
    sub_25A82D2F0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25A82D330();
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

uint64_t sub_25A81E2C8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25A81E360(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25A81E5BC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25A81E5BC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25A81E360(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_25A81E4D8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25A82D260();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25A82D2F0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25A82CF60();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25A82D330();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25A82D2F0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_25A81E4D8(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465B70);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25A81E540(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_25A82CFB0();
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
    uint64_t v5 = MEMORY[0x261145BD0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_25A81E5BC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A465B70);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
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
  uint64_t result = sub_25A82D330();
  __break(1u);
  return result;
}

uint64_t sub_25A81E70C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t LogLevelStrategy.__allocating_init(level0MaxTerms:level0BloomFilterSizeBits:)(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = a2;
  return result;
}

void *LogLevelStrategy.kDefaultLevel0BloomFilterSizeBits.unsafeMutableAddressor()
{
  return &static LogLevelStrategy.kDefaultLevel0BloomFilterSizeBits;
}

uint64_t static LogLevelStrategy.kDefaultLevel0BloomFilterSizeBits.getter()
{
  return 1024;
}

double LogLevelStrategy.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  *(void *)&double result = 22;
  *(_OWORD *)(v0 + 16) = xmmword_25A82E770;
  return result;
}

double LogLevelStrategy.init()()
{
  *(void *)&double result = 22;
  *(_OWORD *)(v0 + 16) = xmmword_25A82E770;
  return result;
}

uint64_t LogLevelStrategy.init(level0MaxTerms:level0BloomFilterSizeBits:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return v2;
}

Swift::UInt64 __swiftcall LogLevelStrategy.levelForTerms(_:)(Swift::UInt64 result)
{
  Swift::UInt64 v2 = *(void *)(v1 + 16);
  if (v2 >= result) {
    return 0;
  }
  for (uint64_t i = 0; ; ++i)
  {
    Swift::UInt64 v4 = i + 1;
    if (i == -1) {
      break;
    }
    v2 *= 2;
    if (v2 >= result) {
      return v4;
    }
  }
  __break(1u);
  return result;
}

Swift::UInt64 __swiftcall LogLevelStrategy.bloomFilterSizeForLevel(_:)(Swift::UInt64 a1)
{
  if (a1 >= 0x40) {
    return 0;
  }
  else {
    return *(void *)(v1 + 24) << a1;
  }
}

Swift::UInt64 __swiftcall LogLevelStrategy.bloomFilterSizeForNumTerms(_:)(Swift::UInt64 result)
{
  Swift::UInt64 v2 = *(void *)(v1 + 16);
  if (v2 >= result) {
    return *(void *)(v1 + 24);
  }
  uint64_t v3 = 0;
  do
  {
    unint64_t v4 = v3 + 1;
    if (v3 == -1)
    {
      __break(1u);
      return result;
    }
    v2 *= 2;
    ++v3;
  }
  while (v2 < result);
  if (v4 > 0x3F) {
    return 0;
  }
  else {
    return *(void *)(v1 + 24) << v4;
  }
}

Swift::String __swiftcall LogLevelStrategy.idForLevelStrategy()()
{
  uint64_t v0 = 0x6874697261676F6CLL;
  uint64_t v1 = (void *)0xEE0030765F63696DLL;
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

Swift::UInt64 __swiftcall LogLevelStrategy.getLevel0BloomFilterSizeBits()()
{
  return *(void *)(v0 + 24);
}

Swift::UInt64 __swiftcall LogLevelStrategy.getLevel0MaxTerms()()
{
  return *(void *)(v0 + 16);
}

Swift::UInt64 __swiftcall LogLevelStrategy.getLevelCapacity()()
{
  return -1;
}

uint64_t LogLevelStrategy.deinit()
{
  return v0;
}

uint64_t LogLevelStrategy.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 32, 7);
}

unint64_t sub_25A81E900(unint64_t result)
{
  unint64_t v2 = *(void *)(*(void *)v1 + 16);
  if (v2 >= result) {
    return 0;
  }
  for (uint64_t i = 0; ; ++i)
  {
    uint64_t v4 = i + 1;
    if (i == -1) {
      break;
    }
    v2 *= 2;
    if (v2 >= result) {
      return v4;
    }
  }
  __break(1u);
  return result;
}

Swift::UInt64 sub_25A81E940(Swift::UInt64 a1)
{
  return LogLevelStrategy.bloomFilterSizeForLevel(_:)(a1);
}

Swift::UInt64 sub_25A81E964(Swift::UInt64 a1)
{
  return LogLevelStrategy.bloomFilterSizeForNumTerms(_:)(a1);
}

uint64_t sub_25A81E988()
{
  return 0x6874697261676F6CLL;
}

uint64_t sub_25A81E9AC()
{
  return *(void *)(*(void *)v0 + 24);
}

uint64_t sub_25A81E9B8()
{
  return *(void *)(*(void *)v0 + 16);
}

uint64_t sub_25A81E9C4()
{
  return -1;
}

uint64_t type metadata accessor for LogLevelStrategy()
{
  return self;
}

void *MaskedBloomFilterAlgorithm.kDefaultNumHashes.unsafeMutableAddressor()
{
  return &static MaskedBloomFilterAlgorithm.kDefaultNumHashes;
}

int8x16_t *MaskedBloomFilterAlgorithm.mask(bitArray:)(int8x16_t *result, uint64_t a2)
{
  unint64_t v2 = result[1].u64[0];
  if (v2 >> 60)
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = result;
    uint64_t v4 = (int8x16_t *)sub_25A81EB54(8 * v2, a2);
    uint64_t v5 = BitArray.xor(_:)(v3, v4);
    swift_bridgeObjectRelease();
    return (int8x16_t *)v5;
  }
  return result;
}

uint64_t MaskedBloomFilterAlgorithm.match(maskedBitArray:selectedIndexes:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_25A81EDD4(a2, a3);
  uint64_t v6 = *(void *)(a2 + 16);
  if (v6)
  {
    unint64_t v7 = 0;
    unint64_t v8 = *(void *)(a1 + 16);
    while (!(v8 >> 60))
    {
      if (v7 >= 8 * v8)
      {
        int v9 = 0;
      }
      else
      {
        if (v7 >> 3 >= v8) {
          goto LABEL_18;
        }
        int v9 = (*(unsigned __int8 *)(a1 + 32 + (v7 >> 3)) >> (v7 & 7)) & 1;
      }
      unint64_t v10 = *(void *)(result + 16);
      if (v10 >> 60) {
        goto LABEL_17;
      }
      if (v7 >= 8 * v10)
      {
        if ((v9 & 1) == 0) {
          goto LABEL_14;
        }
      }
      else
      {
        if (v7 >> 3 >= v10) {
          goto LABEL_19;
        }
        if ((v9 ^ (((*(unsigned __int8 *)(result + 32 + (v7 >> 3)) >> (v7 & 7)) & 1) == 0)))
        {
LABEL_14:
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      if (v6 == ++v7) {
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return 1;
  }
  return result;
}

uint64_t static MaskedBloomFilterAlgorithm.kDefaultNumHashes.getter()
{
  return 16;
}

uint64_t sub_25A81EB54(uint64_t a1, uint64_t a2)
{
  v22[10] = *MEMORY[0x263EF8340];
  type metadata accessor for AESCounterRandomNumberGenerator();
  inited = (void *)swift_initStackObject();
  inited[2] = a2;
  inited[3] = 0;
  uint64_t v20 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)sub_25A82D000();
  v5[2] = 16;
  v5[4] = 0;
  v5[5] = 0;
  inited[4] = v5;
  unint64_t v21 = inited;
  inited[5] = MEMORY[0x263F8EE78];
  uint64_t v6 = a1 + 8;
  if (__OFADD__(a1, 8))
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v7 = a1 + 7;
  if (v6 < 1) {
    uint64_t v7 = a1 + 14;
  }
  uint64_t v8 = v7 >> 3;
  uint64_t v9 = sub_25A7FDEB0(0, v7 >> 3);
  unint64_t v10 = (void *)sub_25A82D000();
  v10[2] = 16;
  v10[4] = 0;
  v10[5] = 0;
  if (v6 < -6) {
LABEL_19:
  }
    __break(1u);
  size_t v11 = v10;
  if ((unint64_t)(v6 + 6) >= 0xF)
  {
    swift_beginAccess();
    unint64_t v13 = 0;
    uint64_t v19 = v8;
    while (1)
    {
      unint64_t v14 = v13 & 0xF;
      if ((v13 & 0xF) == 0)
      {
        swift_bridgeObjectRelease();
        AESCounterRandomNumberGenerator.incrementCounter()();
        uint64_t v15 = v21[4];
        swift_bridgeObjectRetain();
        size_t v11 = (void *)sub_25A82D000();
        v11[2] = 16;
        v11[5] = 0;
        v11[4] = 0;
        v22[0] = 16;
        size_t dataOutAvailable = *(void *)(v20 + 16);
        size_t v17 = *(void *)(v15 + 16);
        swift_bridgeObjectRetain();
        CCCrypt(0, 0, 2u, (const void *)(v20 + 32), dataOutAvailable, 0, (const void *)(v15 + 32), v17, v11 + 4, dataOutAvailable, v22);
        swift_bridgeObjectRelease();
        uint64_t v8 = v19;
        swift_bridgeObjectRelease();
      }
      if (v14 >= v11[2]) {
        break;
      }
      char v18 = *((unsigned char *)v11 + v14 + 32);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v9 = (uint64_t)sub_25A7FE8D8(v9);
      }
      if (v13 >= *(void *)(v9 + 16)) {
        goto LABEL_17;
      }
      *(unsigned char *)(v9 + v13++ + 32) = v18;
      if (v8 == v13) {
        goto LABEL_6;
      }
    }
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
LABEL_6:
  swift_release();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_25A81EDD4(uint64_t a1, uint64_t a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  type metadata accessor for AESCounterRandomNumberGenerator();
  inited = (void *)swift_initStackObject();
  inited[2] = a2;
  inited[3] = 0;
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)sub_25A82D000();
  v5[2] = 16;
  v5[4] = 0;
  v5[5] = 0;
  uint64_t v6 = (void *)MEMORY[0x263F8EE78];
  inited[4] = v5;
  inited[5] = v6;
  unint64_t v7 = sub_25A81CFC4(v6);
  uint64_t v8 = *(void *)(a1 + 16);
  unint64_t v9 = v8 + 8;
  if (__OFADD__(v8, 8)) {
    goto LABEL_26;
  }
  size_t v10 = v7;
  size_t v36 = (unint64_t)(v8 + 7) >> 3;
  uint64_t v11 = sub_25A7FDEB0(0, v36);
  uint64_t v43 = v11;
  if (v8)
  {
    Swift::Int v12 = 0;
    uint64_t v37 = v8;
    uint64_t v38 = a1 + 32;
    do
    {
      Swift::Int v40 = v12;
      uint64_t v14 = *(void *)(v38 + 8 * v12);
      uint64_t v15 = v14 + 127;
      uint64_t v41 = v14;
      if (v14 >= 0) {
        uint64_t v15 = v14;
      }
      uint64_t v16 = v15 >> 7;
      if (!*(void *)(v10 + 16) || (sub_25A819A98(v16), (v17 & 1) == 0))
      {
        uint64_t v18 = sub_25A7FED30(v16 + 1);
        uint64_t v39 = v16;
        uint64_t v19 = (void *)sub_25A82D000();
        v19[2] = 16;
        void v19[5] = 0;
        v19[4] = 0;
        size_t v42 = 16;
        uint64_t v20 = inited[2];
        size_t dataOutAvailable = *(void *)(v20 + 16);
        unint64_t v22 = v9;
        size_t v23 = *(void *)(v18 + 16);
        swift_bridgeObjectRetain();
        size_t v24 = v23;
        unint64_t v9 = v22;
        CCCrypt(0, 0, 2u, (const void *)(v20 + 32), dataOutAvailable, 0, (const void *)(v18 + 32), v24, v19 + 4, dataOutAvailable, &v42);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        size_t v42 = v10;
        uint64_t v26 = (uint64_t)v19;
        uint64_t v16 = v39;
        sub_25A81C6D0(v26, v39, isUniquelyReferenced_nonNull_native);
        size_t v10 = v42;
        swift_bridgeObjectRelease();
      }
      if (*(void *)(v10 + 16) && (unint64_t v27 = sub_25A819A98(v16), (v28 & 1) != 0))
      {
        uint64_t v29 = *(void *)(*(void *)(v10 + 56) + 8 * v27);
        swift_bridgeObjectRetain();
        uint64_t v30 = v41;
      }
      else
      {
        uint64_t v29 = MEMORY[0x263F8EE78];
        uint64_t v30 = v41;
        if (v9 >= 9)
        {
          uint64_t v29 = sub_25A82D000();
          *(void *)(v29 + 16) = v36;
          bzero((void *)(v29 + 32), v36);
        }
      }
      unint64_t v31 = v30 - (v16 << 7);
      if ((v31 & 0x8000000000000000) != 0) {
        goto LABEL_4;
      }
      unint64_t v32 = *(void *)(v29 + 16);
      if (v32 >> 60)
      {
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
      }
      if (v31 >= 8 * v32)
      {
LABEL_4:
        swift_bridgeObjectRelease();
        LOBYTE(v13) = 0;
      }
      else
      {
        if (v31 >> 3 >= v32) {
          goto LABEL_25;
        }
        unsigned int v33 = *(unsigned __int8 *)(v29 + (v31 >> 3) + 32);
        swift_bridgeObjectRelease();
        BOOL v13 = (v33 >> (v31 & 7)) & 1;
      }
      BitArray.setBit(_:_:)(v40, v13);
      Swift::Int v12 = v40 + 1;
    }
    while (v37 != v40 + 1);
    swift_release();
    uint64_t v34 = v43;
  }
  else
  {
    uint64_t v34 = v11;
    swift_release();
  }
  swift_bridgeObjectRelease();
  return v34;
}

uint64_t sub_25A81F0FC(uint64_t a1, uint64_t a2)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v4 = type metadata accessor for Logger();
  MEMORY[0x270FA5388](v4);
  uint64_t v37 = (uint64_t)v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_25A82CB10();
  uint64_t v6 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v34 = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25A82CEA0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  memset(&c, 0, sizeof(c));
  swift_bridgeObjectRetain();
  CC_SHA256_Init(&c);
  unint64_t v12 = *(void *)(a1 + 16);
  if (HIDWORD(v12))
  {
LABEL_28:
    sub_25A82D2F0();
    __break(1u);
    JUMPOUT(0x25A81F67CLL);
  }
  CC_SHA256_Update(&c, (const void *)(a1 + 32), v12);
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void *)(a2 + 16);
  if (v13)
  {
    uint64_t v38 = (void (**)(char *, uint64_t))(v9 + 8);
    unsigned int v33 = (void (**)(char *, uint64_t))(v6 + 8);
    swift_bridgeObjectRetain();
    v30[1] = a2;
    uint64_t v14 = a2 + 40;
    unint64_t v36 = 0x800000025A82FCC0;
    uint64_t v32 = v4;
    uint64_t v31 = v8;
    do
    {
      swift_bridgeObjectRetain();
      sub_25A82CE90();
      uint64_t v15 = sub_25A82CE70();
      unint64_t v17 = v16;
      (*v38)(v11, v8);
      if (v17 >> 60 == 15)
      {
        if (qword_26A465B08 != -1) {
          swift_once();
        }
        uint64_t v18 = __swift_project_value_buffer(v4, (uint64_t)qword_26A465FA8);
        uint64_t v19 = v37;
        sub_25A810F24(v18, v37);
        uint64_t v39 = 0;
        unint64_t v40 = 0xE000000000000000;
        sub_25A82D250();
        swift_bridgeObjectRelease();
        uint64_t v39 = 0x5B20676E69727453;
        unint64_t v40 = 0xE800000000000000;
        sub_25A82CF40();
        sub_25A82CF40();
        sub_25A81D3E8(2, v39, v40);
        swift_bridgeObjectRelease();
        sub_25A811348(v19);
LABEL_11:
        unint64_t v21 = (void *)MEMORY[0x263F8EE78];
      }
      else
      {
        switch(v17 >> 62)
        {
          case 1uLL:
            if (__OFSUB__(HIDWORD(v15), v15)) {
              goto LABEL_26;
            }
            uint64_t v20 = HIDWORD(v15) - (int)v15;
LABEL_15:
            sub_25A8109EC(v15, v17);
            if (!v20)
            {
LABEL_10:
              sub_25A81A6E4(v15, v17);
              sub_25A81A6E4(v15, v17);
              goto LABEL_11;
            }
LABEL_16:
            if (v20 < 1)
            {
              unint64_t v21 = (void *)MEMORY[0x263F8EE78];
            }
            else
            {
              __swift_instantiateConcreteTypeFromMangledName(&qword_26A465B70);
              unint64_t v21 = (void *)swift_allocObject();
              size_t v24 = _swift_stdlib_malloc_size(v21);
              v21[2] = v20;
              v21[3] = 2 * v24 - 64;
            }
            char v25 = v34;
            uint64_t v26 = sub_25A82CAF0();
            (*v33)(v25, v35);
            if (v26 != v20)
            {
              __break(1u);
LABEL_26:
              __break(1u);
LABEL_27:
              __break(1u);
            }
            sub_25A81A6E4(v15, v17);
            sub_25A81A6E4(v15, v17);
            uint64_t v4 = v32;
            uint64_t v8 = v31;
            break;
          case 2uLL:
            uint64_t v23 = *(void *)(v15 + 16);
            uint64_t v22 = *(void *)(v15 + 24);
            uint64_t v20 = v22 - v23;
            if (!__OFSUB__(v22, v23)) {
              goto LABEL_15;
            }
            goto LABEL_27;
          case 3uLL:
            goto LABEL_10;
          default:
            uint64_t v20 = BYTE6(v17);
            if (!BYTE6(v17)) {
              goto LABEL_10;
            }
            goto LABEL_16;
        }
      }
      swift_bridgeObjectRelease();
      unint64_t v27 = v21[2];
      if (HIDWORD(v27)) {
        goto LABEL_28;
      }
      v14 += 16;
      CC_SHA256_Update(&c, v21 + 4, v27);
      swift_bridgeObjectRelease();
      --v13;
    }
    while (v13);
    swift_bridgeObjectRelease();
  }
  uint64_t v28 = sub_25A82D000();
  *(void *)(v28 + 16) = 32;
  *(_OWORD *)(v28 + 48) = 0u;
  *(_OWORD *)(v28 + 32) = 0u;
  CC_SHA256_Final((unsigned __int8 *)(v28 + 32), &c);
  return v28;
}

uint64_t _s17PrivateSearchCore26MaskedBloomFilterAlgorithmV6secret11documentKey13levelStrategy05bloomF7NumBitsAcA16HashedUserSecretV_0aB9Protocols08DocumentJ0VAA05LevelL0_pSitcfC_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465B68);
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 32) = a2;
  *(_OWORD *)(inited + 16) = xmmword_25A82D9E0;
  *(void *)(inited + 40) = a3;
  *(void *)(inited + 48) = a4;
  *(void *)(inited + 56) = a5;
  uint64_t v13 = a6[3];
  uint64_t v12 = a6[4];
  __swift_project_boxed_opaque_existential_1(a6, v13);
  uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t))(v12 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v19 = v14(v13, v12);
  uint64_t v20 = v15;
  sub_25A82CF40();
  sub_25A82D350();
  sub_25A82CF40();
  swift_bridgeObjectRelease();
  *(void *)(inited + 64) = v19;
  *(void *)(inited + 72) = v20;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v16 = sub_25A81F0FC(a1, inited);
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  swift_arrayDestroy();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a6);
  return v16;
}

ValueMetadata *type metadata accessor for MaskedBloomFilterAlgorithm()
{
  return &type metadata for MaskedBloomFilterAlgorithm;
}

uint64_t sub_25A81F810(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v27 = a3;
  uint64_t v28 = a4;
  uint64_t v26 = a1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465DE0);
  uint64_t v24 = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5);
  char v25 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465DC8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465B88);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_25A82D060();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v26, v5);
  unint64_t v16 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v17 = (v10 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v18 = (*(unsigned __int8 *)(v6 + 80) + v17 + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = 0;
  *(void *)(v19 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v19 + v16, v11, v8);
  uint64_t v20 = (void *)(v19 + v17);
  uint64_t v21 = v28;
  void *v20 = v27;
  v20[1] = v21;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v19 + v18, v25, v24);
  swift_retain();
  sub_25A820418((uint64_t)v14, (uint64_t)&unk_26A465F88, v19);
  return swift_release();
}

uint64_t sub_25A81FADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[28] = a6;
  v7[29] = a7;
  v7[26] = a4;
  v7[27] = a5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465DF8);
  v7[30] = v8;
  v7[31] = *(void *)(v8 - 8);
  v7[32] = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465F30);
  v7[33] = v9;
  v7[34] = *(void *)(v9 - 8);
  v7[35] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_25A81FC04, 0, 0);
}

uint64_t sub_25A81FC04()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465DC8);
  sub_25A82D0D0();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 288) = v1;
  void *v1 = v0;
  v1[1] = sub_25A81FCDC;
  uint64_t v2 = *(void *)(v0 + 264);
  return MEMORY[0x270FA20F8](v0 + 16, 0, 0, v2, v0 + 192);
}

uint64_t sub_25A81FCDC()
{
  swift_task_dealloc();
  if (v0) {
    uint64_t v1 = sub_25A81FF80;
  }
  else {
    uint64_t v1 = sub_25A81FDEC;
  }
  return MEMORY[0x270FA2498](v1, 0, 0);
}

uint64_t sub_25A81FDEC()
{
  uint64_t v1 = *(void *)(v0 + 24);
  if (v1)
  {
    uint64_t v2 = *(int **)(v0 + 216);
    uint64_t v3 = *(void *)(v0 + 56);
    uint64_t v4 = *(void *)(v0 + 32);
    *(void *)(v0 + 64) = *(void *)(v0 + 16);
    *(void *)(v0 + 72) = v1;
    *(void *)(v0 + 80) = v4;
    *(_OWORD *)(v0 + 88) = *(_OWORD *)(v0 + 40);
    *(void *)(v0 + 104) = v3;
    uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)v2 + *v2);
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 296) = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_25A82009C;
    return v8(v0 + 144, v0 + 64);
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 272) + 8))(*(void *)(v0 + 280), *(void *)(v0 + 264));
    *(void *)(v0 + 200) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A465DE0);
    sub_25A82D0B0();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
}

uint64_t sub_25A81FF80()
{
  uint64_t v1 = v0[24];
  v0[23] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465B80);
  uint64_t v2 = sub_25A82D360();
  if (v2)
  {
    uint64_t v3 = v2;
    MEMORY[0x261146370](v1);
  }
  else
  {
    uint64_t v3 = swift_allocError();
    *uint64_t v4 = v0[23];
  }
  (*(void (**)(void, void))(v0[34] + 8))(v0[35], v0[33]);
  v0[22] = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465DE0);
  sub_25A82D0B0();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_25A82009C()
{
  *(void *)(*(void *)v1 + 304) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_25A820344;
  }
  else {
    uint64_t v2 = sub_25A8201B0;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_25A8201B0()
{
  uint64_t v1 = v0[19];
  if (v1)
  {
    uint64_t v2 = v0[18];
    v0[14] = v2;
    uint64_t v4 = v0[31];
    uint64_t v3 = v0[32];
    uint64_t v5 = v0[30];
    uint64_t v6 = v0[20];
    uint64_t v7 = v0[21];
    v0[15] = v1;
    v0[16] = v6;
    v0[17] = v7;
    sub_25A821A8C(v2, v1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A465DE0);
    sub_25A82D0A0();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_25A821AD0(v0[18], v0[19]);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = (void *)swift_task_alloc();
  v0[36] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_25A81FCDC;
  uint64_t v9 = v0[33];
  return MEMORY[0x270FA20F8](v0 + 2, 0, 0, v9, v0 + 24);
}

uint64_t sub_25A820344()
{
  uint64_t v2 = v0[34];
  uint64_t v1 = v0[35];
  uint64_t v3 = v0[33];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v0[22] = v0[38];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465DE0);
  sub_25A82D0B0();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_25A820418(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A82D060();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_25A82D050();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_25A816240(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_25A82D030();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t PlainBloomFilterIndexer.__allocating_init(reader:writer:secret:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  sub_25A80F940(a1, v6 + 16);
  sub_25A80F940(a2, v6 + 56);
  uint64_t v7 = sub_25A82D000();
  *(void *)(v7 + 16) = 0x2000;
  bzero((void *)(v7 + 32), 0x2000uLL);
  uint64_t v8 = sub_25A80E644(16, a3);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a2);
  __swift_destroy_boxed_opaque_existential_1(a1);
  *(void *)(v6 + 96) = v8;
  *(void *)(v6 + 104) = v7;
  return v6;
}

uint64_t PlainBloomFilterIndexer.init(reader:writer:secret:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_25A80F940(a1, v3 + 16);
  sub_25A80F940(a2, v3 + 56);
  uint64_t v7 = sub_25A82D000();
  *(void *)(v7 + 16) = 0x2000;
  bzero((void *)(v7 + 32), 0x2000uLL);
  uint64_t v8 = sub_25A80E644(16, a3);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a2);
  __swift_destroy_boxed_opaque_existential_1(a1);
  *(void *)(v3 + 96) = v8;
  *(void *)(v3 + 104) = v7;
  return v3;
}

uint64_t PlainBloomFilterIndexer.search(token:context:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465DC0);
  uint64_t v31 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v30 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465DC8);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = _s17PrivateSearchCore11BloomFilterV4hash5tokenSays6UInt64VGSS_tF_0(a1, a2, v3[12]);
  uint64_t v14 = *(void *)(result + 16);
  if (__OFADD__(v14, 8))
  {
    __break(1u);
  }
  else
  {
    uint64_t v15 = result;
    uint64_t v26 = v10;
    uint64_t v27 = v7;
    uint64_t v28 = v9;
    uint64_t v29 = a3;
    uint64_t v16 = sub_25A7FDEB0(0, (unint64_t)(v14 + 7) >> 3);
    unint64_t v17 = BitArray.setRange(startBit:endBit:)(0, v14, v16);
    swift_bridgeObjectRelease();
    uint64_t v18 = v3[5];
    uint64_t v19 = v3[6];
    __swift_project_boxed_opaque_existential_1(v3 + 2, v18);
    uint64_t v20 = type metadata accessor for CallContextImpl();
    memset(v32, 0, sizeof(v32));
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 32) = 0u;
    *(_OWORD *)(v21 + 16) = 0u;
    swift_beginAccess();
    sub_25A80EBDC((uint64_t)v32, v21 + 16);
    swift_endAccess();
    v33[3] = v20;
    v33[4] = &protocol witness table for CallContextImpl;
    v33[0] = v21;
    uint64_t v22 = v33[6];
    (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v19 + 8))(v15, v33, v18, v19);
    if (v22)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
    }
    else
    {
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
      uint64_t v23 = swift_allocObject();
      *(void *)(v23 + 16) = v17;
      uint64_t v24 = MEMORY[0x270FA5388](v23);
      *(&v25 - 4) = (uint64_t)v12;
      *(&v25 - 3) = (uint64_t)&unk_26A465F68;
      *(&v25 - 2) = v24;
      (*(void (**)(char *, void, uint64_t))(v31 + 104))(v30, *MEMORY[0x263F8F680], v27);
      sub_25A82D110();
      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v12, v28);
    }
  }
  return result;
}

uint64_t sub_25A820A94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a3;
  *(_OWORD *)(v3 + 32) = *(_OWORD *)a2;
  *(void *)(v3 + 48) = *(void *)(a2 + 16);
  *(_OWORD *)(v3 + 56) = *(_OWORD *)(a2 + 24);
  return MEMORY[0x270FA2498](sub_25A820ACC, 0, 0);
}

uint64_t sub_25A820ACC()
{
  uint64_t result = v0[8];
  unint64_t v2 = *(void *)(result + 16);
  if (v2 >> 60)
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v3 = v0[3];
  unint64_t v4 = *(void *)(v3 + 16);
  if (v4 >> 60)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  if (v2 == v4 && sub_25A80D8F8(result, v3))
  {
    uint64_t v5 = v0[6];
    uint64_t v6 = v0[7];
    uint64_t v7 = v0[5];
    uint64_t v8 = (void *)v0[2];
    *uint64_t v8 = v0[4];
    v8[1] = v7;
    size_t v8[2] = v5;
    void v8[3] = v6;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v9 = (_OWORD *)v0[2];
    *uint64_t v9 = 0u;
    v9[1] = 0u;
  }
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t PlainBloomFilterIndexer.index(key:tokens:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[20] = a5;
  v6[21] = v5;
  v6[18] = a3;
  v6[19] = a4;
  v6[16] = a1;
  v6[17] = a2;
  return MEMORY[0x270FA2498](sub_25A820BB8, 0, 0);
}

uint64_t sub_25A820BB8()
{
  uint64_t v1 = *(void *)(v0 + 168);
  uint64_t v2 = *(void *)(v1 + 104);
  *(void *)(v0 + 112) = *(void *)(v1 + 96);
  uint64_t v3 = *(void *)(v0 + 160);
  *(void *)(v0 + 120) = v2;
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v5 = v3 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_25A80E364();
      swift_bridgeObjectRelease();
      v5 += 16;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
    uint64_t v2 = *(void *)(v0 + 120);
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  *(void *)(v0 + 176) = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v6 = *(void *)(v2 + 16);
  uint64_t result = swift_bridgeObjectRelease();
  if (!(v6 >> 60))
  {
    uint64_t v8 = *(void **)(v0 + 168);
    uint64_t v9 = v8[11];
    __swift_project_boxed_opaque_existential_1(v8 + 7, v8[10]);
    uint64_t v10 = type metadata accessor for CallContextImpl();
    *(_OWORD *)(v0 + 72) = 0u;
    *(_OWORD *)(v0 + 56) = 0u;
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 32) = 0u;
    *(_OWORD *)(v11 + 16) = 0u;
    swift_beginAccess();
    sub_25A80EBDC(v0 + 56, v11 + 16);
    swift_endAccess();
    *(void *)(v0 + 40) = v10;
    *(void *)(v0 + 48) = &protocol witness table for CallContextImpl;
    *(void *)(v0 + 16) = v11;
    uint64_t v13 = *(void *)(v9 + 8) + **(int **)(v9 + 8);
    uint64_t v12 = (void *)swift_task_alloc();
    *(void *)(v0 + 184) = v12;
    *uint64_t v12 = v0;
    v12[1] = sub_25A820E2C;
    __asm { BRAA            X9, X16 }
  }
  __break(1u);
  return result;
}

uint64_t sub_25A820E2C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 192) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0)
  {
    uint64_t v3 = sub_25A820F84;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1(v2 + 16);
    uint64_t v3 = sub_25A820F6C;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_25A820F6C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_25A820F84()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t PlainBloomFilterIndexer.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PlainBloomFilterIndexer.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 112, 7);
}

uint64_t sub_25A821080@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return PlainBloomFilterIndexer.search(token:context:)(a1, a2, a3);
}

uint64_t sub_25A8210A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v12 = *v5;
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_25A800B84;
  v13[20] = a5;
  v13[21] = v12;
  v13[18] = a3;
  v13[19] = a4;
  unsigned char v13[16] = a1;
  v13[17] = a2;
  return MEMORY[0x270FA2498](sub_25A820BB8, 0, 0);
}

uint64_t sub_25A82117C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25A821258;
  return v6(a1);
}

uint64_t sub_25A821258()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25A821350()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25A821388(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *(void *)uint64_t v7 = v3;
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = v6;
  *(void *)(v7 + 8) = sub_25A800B84;
  *(_OWORD *)(v7 + 32) = *(_OWORD *)a2;
  *(void *)(v7 + 48) = *(void *)(a2 + 16);
  *(_OWORD *)(v7 + 56) = *(_OWORD *)(a2 + 24);
  return MEMORY[0x270FA2498](sub_25A820ACC, 0, 0);
}

uint64_t sub_25A82145C(uint64_t a1)
{
  return sub_25A81F810(a1, v1[2], v1[3], v1[4]);
}

uint64_t type metadata accessor for PlainBloomFilterIndexer()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for PlainBloomFilterIndexer.PlainBloomFilterError(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for PlainBloomFilterIndexer.PlainBloomFilterError()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for PlainBloomFilterIndexer.PlainBloomFilterError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for PlainBloomFilterIndexer.PlainBloomFilterError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for PlainBloomFilterIndexer.PlainBloomFilterError(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PlainBloomFilterIndexer.PlainBloomFilterError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PlainBloomFilterIndexer.PlainBloomFilterError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_25A821688()
{
  return 0;
}

ValueMetadata *type metadata accessor for PlainBloomFilterIndexer.PlainBloomFilterError()
{
  return &type metadata for PlainBloomFilterIndexer.PlainBloomFilterError;
}

uint64_t sub_25A8216A0()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465DC8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  unint64_t v5 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465DE0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8 + 16) & ~v8;
  uint64_t v10 = v9 + *(void *)(v7 + 64);
  uint64_t v11 = v3 | v8 | 7;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  return MEMORY[0x270FA0238](v0, v10, v11);
}

uint64_t sub_25A821818(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A465DC8) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A465DE0) - 8);
  unint64_t v9 = (v7 + *(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v1 + 16);
  uint64_t v11 = *(void *)(v1 + 24);
  uint64_t v12 = v1 + v6;
  uint64_t v13 = v1 + v7;
  uint64_t v14 = *(void *)(v1 + v7);
  uint64_t v15 = *(void *)(v13 + 8);
  uint64_t v16 = v1 + v9;
  unint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v17;
  *unint64_t v17 = v3;
  v17[1] = sub_25A800B84;
  return sub_25A81FADC(a1, v10, v11, v12, v14, v15, v16);
}

uint64_t sub_25A82199C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25A8219D4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25A821B14;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_26A465F90 + dword_26A465F90);
  return v6(a1, v4);
}

uint64_t sub_25A821A8C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_25A821AD0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

ValueMetadata *type metadata accessor for RandomNumberGeneratorSeed()
{
  return &type metadata for RandomNumberGeneratorSeed;
}

uint64_t static SearchIndexStoreError.__derived_enum_equals(_:_:)()
{
  return 1;
}

uint64_t SearchIndexStoreError.hash(into:)()
{
  return sub_25A82D420();
}

uint64_t SearchIndexStoreError.hashValue.getter()
{
  return sub_25A82D430();
}

uint64_t sub_25A821BA4()
{
  return 1;
}

uint64_t sub_25A821BAC()
{
  return sub_25A82D430();
}

uint64_t sub_25A821BF0()
{
  return sub_25A82D420();
}

uint64_t sub_25A821C18()
{
  return sub_25A82D430();
}

unint64_t sub_25A821C5C()
{
  unint64_t result = qword_26A465FA0;
  if (!qword_26A465FA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A465FA0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SearchIndexStoreError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for SearchIndexStoreError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25A821DA0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SearchIndexStoreError()
{
  return &type metadata for SearchIndexStoreError;
}

uint64_t sub_25A821DDC()
{
  uint64_t v0 = sub_25A82D000();
  *(void *)(v0 + 16) = 20;
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = 0;
  *(_DWORD *)(v0 + 48) = 0;
  uint64_t v1 = String.toUtf8Bytes()();
  unint64_t v2 = sub_25A82CF10();
  if ((v2 & 0x8000000000000000) != 0 || HIDWORD(v2))
  {
    uint64_t result = sub_25A82D2F0();
    __break(1u);
  }
  else
  {
    CC_SHA1(v1 + 4, v2, (unsigned __int8 *)(v0 + 32));
    swift_bridgeObjectRelease();
    return v0;
  }
  return result;
}

ValueMetadata *type metadata accessor for Sha1()
{
  return &type metadata for Sha1;
}

const char *Sha256.kDigestsizeBytes.unsafeMutableAddressor()
{
  return " ";
}

uint64_t static Sha256.kDigestsizeBytes.getter()
{
  return 32;
}

uint64_t _s17PrivateSearchCore6Sha256V4hashySays5UInt8VGAGFZ_0(uint64_t a1)
{
  uint64_t v2 = sub_25A82D000();
  *(void *)(v2 + 16) = 32;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 48) = 0u;
  unint64_t v3 = *(void *)(a1 + 16);
  if (HIDWORD(v3))
  {
    uint64_t result = sub_25A82D2F0();
    __break(1u);
  }
  else
  {
    uint64_t v4 = v2;
    CC_SHA256((const void *)(a1 + 32), v3, (unsigned __int8 *)(v2 + 32));
    return v4;
  }
  return result;
}

ValueMetadata *type metadata accessor for Sha256()
{
  return &type metadata for Sha256;
}

void *SizeOf.kUInt8.unsafeMutableAddressor()
{
  return &static SizeOf.kUInt8;
}

void *SizeOf.kUInt32.unsafeMutableAddressor()
{
  return &static SizeOf.kUInt32;
}

void *SizeOf.kUInt64.unsafeMutableAddressor()
{
  return &static SizeOf.kUInt64;
}

uint64_t static SizeOf.kUInt8.getter()
{
  return 1;
}

uint64_t static SizeOf.kUInt32.getter()
{
  return 4;
}

uint64_t static SizeOf.kUInt64.getter()
{
  return 8;
}

ValueMetadata *type metadata accessor for SizeOf()
{
  return &type metadata for SizeOf;
}

uint64_t static Stopwatch.start()()
{
  type metadata accessor for Stopwatch();
  uint64_t v0 = swift_allocObject();
  _s17PrivateSearchCore9TimestampV3nowACyFZ_0();
  *(void *)(v0 + 16) = v1;
  return v0;
}

uint64_t type metadata accessor for Stopwatch()
{
  return self;
}

Swift::Int64 Stopwatch.elapsed()()
{
  _s17PrivateSearchCore9TimestampV3nowACyFZ_0();
  uint64_t v1 = *(void *)(v0 + 16);
  BOOL v3 = __OFSUB__(v2, v1);
  Swift::Int64 result = v2 - v1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    return TimeUnit.from(millis:secs:mins:hours:days:weeks:)(result, 0, 0, 0, 0, 0);
  }
  return result;
}

uint64_t Stopwatch.deinit()
{
  return v0;
}

uint64_t Stopwatch.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

void *String.toUtf8Bytes()()
{
  uint64_t v0 = type metadata accessor for Logger();
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_25A82CEA0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A82CE90();
  uint64_t v7 = sub_25A82CE70();
  unint64_t v9 = v8;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  if (v9 >> 60 == 15)
  {
    if (qword_26A465B08 != -1) {
      swift_once();
    }
    uint64_t v10 = __swift_project_value_buffer(v0, (uint64_t)qword_26A465FA8);
    sub_25A810F24(v10, (uint64_t)v2);
    uint64_t v13 = 0;
    unint64_t v14 = 0xE000000000000000;
    sub_25A82D250();
    swift_bridgeObjectRelease();
    uint64_t v13 = 0x5B20676E69727453;
    unint64_t v14 = 0xE800000000000000;
    sub_25A82CF40();
    sub_25A82CF40();
    sub_25A81D3E8(2, v13, v14);
    swift_bridgeObjectRelease();
    sub_25A811348((uint64_t)v2);
    return (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    sub_25A8109EC(v7, v9);
    uint64_t v11 = sub_25A810830(v7, v9);
    sub_25A81A6E4(v7, v9);
    sub_25A81A6E4(v7, v9);
  }
  return v11;
}

uint64_t sub_25A822378()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = MEMORY[0x270FA5388](v0);
  uint64_t v3 = (void *)((char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_allocate_value_buffer(v1, qword_26A465FA8);
  uint64_t v4 = __swift_project_value_buffer(v0, (uint64_t)qword_26A465FA8);
  v7[1] = MEMORY[0x263F8D310];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465FC0);
  uint64_t *v3 = sub_25A82CEB0();
  v3[1] = v5;
  swift_bridgeObjectRetain();
  sub_25A82CDB0();
  return sub_25A811520((uint64_t)v3, v4);
}

uint64_t sub_25A82248C()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t _s18ExtensionConstantsCMa()
{
  return self;
}

uint64_t TestDataBundle.indexingData.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465FC8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TestDataBundle(0);
  sub_25A8079B4(v1 + *(int *)(v6 + 20), (uint64_t)v5, &qword_26A465FC8);
  uint64_t v7 = type metadata accessor for TestDataBundle.IndexingData(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7) != 1) {
    return sub_25A822BBC((uint64_t)v5, (uint64_t)a1, type metadata accessor for TestDataBundle.IndexingData);
  }
  *a1 = MEMORY[0x263F8EE78];
  _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  return sub_25A80CCC8((uint64_t)v5, &qword_26A465FC8);
}

uint64_t TestDataBundle.IndexingData.init()@<X0>(void *a1@<X8>)
{
  return sub_25A822B54((void (*)(void))type metadata accessor for TestDataBundle.IndexingData, a1);
}

uint64_t type metadata accessor for TestDataBundle(uint64_t a1)
{
  return sub_25A802F48(a1, (uint64_t *)&unk_26A466078);
}

uint64_t type metadata accessor for TestDataBundle.IndexingData(uint64_t a1)
{
  return sub_25A802F48(a1, (uint64_t *)&unk_26A466098);
}

uint64_t TestDataBundle.indexingData.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TestDataBundle(0) + 20);
  sub_25A80CCC8(v3, &qword_26A465FC8);
  sub_25A822BBC(a1, v3, type metadata accessor for TestDataBundle.IndexingData);
  uint64_t v4 = type metadata accessor for TestDataBundle.IndexingData(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(v3, 0, 1, v4);
}

void (*TestDataBundle.indexingData.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  void *v3 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465FC8);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[1] = v5;
  uint64_t v6 = type metadata accessor for TestDataBundle.IndexingData(0);
  v3[2] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7;
  v3[3] = v7;
  size_t v9 = *(void *)(v7 + 64);
  v3[4] = malloc(v9);
  uint64_t v10 = malloc(v9);
  v3[5] = v10;
  uint64_t v11 = *(int *)(type metadata accessor for TestDataBundle(0) + 20);
  *((_DWORD *)v3 + 12) = v11;
  sub_25A8079B4(v1 + v11, (uint64_t)v5, &qword_26A465FC8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v6) == 1)
  {
    *uint64_t v10 = MEMORY[0x263F8EE78];
    _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    sub_25A80CCC8((uint64_t)v5, &qword_26A465FC8);
  }
  else
  {
    sub_25A822BBC((uint64_t)v5, (uint64_t)v10, type metadata accessor for TestDataBundle.IndexingData);
  }
  return sub_25A822888;
}

void sub_25A822888(uint64_t a1, char a2)
{
}

BOOL TestDataBundle.hasIndexingData.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465FC8);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for TestDataBundle(0);
  sub_25A8079B4(v0 + *(int *)(v4 + 20), (uint64_t)v3, &qword_26A465FC8);
  uint64_t v5 = type metadata accessor for TestDataBundle.IndexingData(0);
  BOOL v6 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v3, 1, v5) != 1;
  sub_25A80CCC8((uint64_t)v3, &qword_26A465FC8);
  return v6;
}

Swift::Void __swiftcall TestDataBundle.clearIndexingData()()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for TestDataBundle(0) + 20);
  sub_25A80CCC8(v1, &qword_26A465FC8);
  uint64_t v2 = type metadata accessor for TestDataBundle.IndexingData(0);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);
  v3(v1, 1, 1, v2);
}

uint64_t TestDataBundle.searchingData.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465FD0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TestDataBundle(0);
  sub_25A8079B4(v1 + *(int *)(v6 + 24), (uint64_t)v5, &qword_26A465FD0);
  uint64_t v7 = type metadata accessor for TestDataBundle.SearchingData(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7) != 1) {
    return sub_25A822BBC((uint64_t)v5, (uint64_t)a1, type metadata accessor for TestDataBundle.SearchingData);
  }
  *a1 = MEMORY[0x263F8EE78];
  _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  return sub_25A80CCC8((uint64_t)v5, &qword_26A465FD0);
}

uint64_t TestDataBundle.SearchingData.init()@<X0>(void *a1@<X8>)
{
  return sub_25A822B54((void (*)(void))type metadata accessor for TestDataBundle.SearchingData, a1);
}

uint64_t sub_25A822B54@<X0>(void (*a1)(void)@<X0>, void *a2@<X8>)
{
  *a2 = MEMORY[0x263F8EE78];
  a1(0);
  return _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
}

uint64_t type metadata accessor for TestDataBundle.SearchingData(uint64_t a1)
{
  return sub_25A802F48(a1, (uint64_t *)&unk_26A4660B8);
}

uint64_t sub_25A822BBC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t TestDataBundle.searchingData.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for TestDataBundle(0) + 24);
  sub_25A80CCC8(v3, &qword_26A465FD0);
  sub_25A822BBC(a1, v3, type metadata accessor for TestDataBundle.SearchingData);
  uint64_t v4 = type metadata accessor for TestDataBundle.SearchingData(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(v3, 0, 1, v4);
}

void (*TestDataBundle.searchingData.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  void *v3 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465FD0);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[1] = v5;
  uint64_t v6 = type metadata accessor for TestDataBundle.SearchingData(0);
  v3[2] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7;
  v3[3] = v7;
  size_t v9 = *(void *)(v7 + 64);
  v3[4] = malloc(v9);
  uint64_t v10 = malloc(v9);
  v3[5] = v10;
  uint64_t v11 = *(int *)(type metadata accessor for TestDataBundle(0) + 24);
  *((_DWORD *)v3 + 12) = v11;
  sub_25A8079B4(v1 + v11, (uint64_t)v5, &qword_26A465FD0);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v6) == 1)
  {
    *uint64_t v10 = MEMORY[0x263F8EE78];
    _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    sub_25A80CCC8((uint64_t)v5, &qword_26A465FD0);
  }
  else
  {
    sub_25A822BBC((uint64_t)v5, (uint64_t)v10, type metadata accessor for TestDataBundle.SearchingData);
  }
  return sub_25A822E6C;
}

void sub_25A822E6C(uint64_t a1, char a2)
{
}

void sub_25A822E8C(uint64_t a1, char a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(int *)(*(void *)a1 + 48);
  uint64_t v8 = *(void **)(*(void *)a1 + 32);
  size_t v9 = *(void **)(*(void *)a1 + 40);
  uint64_t v10 = *(void *)(*(void *)a1 + 16);
  uint64_t v11 = *(void *)(*(void *)a1 + 24);
  uint64_t v12 = *(void **)(*(void *)a1 + 8);
  uint64_t v13 = **(void **)a1 + v7;
  if (a2)
  {
    sub_25A822FB0(*(void *)(*(void *)a1 + 40), (uint64_t)v8, a4);
    sub_25A80CCC8(v13, a3);
    sub_25A822BBC((uint64_t)v8, v13, a4);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v11 + 56))(v13, 0, 1, v10);
    sub_25A823018((uint64_t)v9, a4);
  }
  else
  {
    sub_25A80CCC8(**(void **)a1 + v7, a3);
    sub_25A822BBC((uint64_t)v9, v13, a4);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v11 + 56))(v13, 0, 1, v10);
  }
  free(v9);
  free(v8);
  free(v12);
  free(v6);
}

uint64_t sub_25A822FB0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25A823018(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

BOOL TestDataBundle.hasSearchingData.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465FD0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for TestDataBundle(0);
  sub_25A8079B4(v0 + *(int *)(v4 + 24), (uint64_t)v3, &qword_26A465FD0);
  uint64_t v5 = type metadata accessor for TestDataBundle.SearchingData(0);
  BOOL v6 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v3, 1, v5) != 1;
  sub_25A80CCC8((uint64_t)v3, &qword_26A465FD0);
  return v6;
}

Swift::Void __swiftcall TestDataBundle.clearSearchingData()()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for TestDataBundle(0) + 24);
  sub_25A80CCC8(v1, &qword_26A465FD0);
  uint64_t v2 = type metadata accessor for TestDataBundle.SearchingData(0);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);
  v3(v1, 1, 1, v2);
}

uint64_t (*TestDataBundle.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t TestDataBundle.IndexingData.documents.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TestDataBundle.IndexingData.documents.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*TestDataBundle.IndexingData.documents.modify())()
{
  return nullsub_1;
}

uint64_t TestDataBundle.IndexingData.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25A823784(type metadata accessor for TestDataBundle.IndexingData, a1);
}

uint64_t TestDataBundle.IndexingData.unknownFields.setter(uint64_t a1)
{
  return sub_25A82381C(a1, type metadata accessor for TestDataBundle.IndexingData);
}

uint64_t (*TestDataBundle.IndexingData.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t TestDataBundle.IndexingData.Document.name.getter()
{
  return sub_25A8238F8(type metadata accessor for TestDataBundle.IndexingData.Document);
}

uint64_t type metadata accessor for TestDataBundle.IndexingData.Document(uint64_t a1)
{
  return sub_25A802F48(a1, (uint64_t *)&unk_26A4660A8);
}

uint64_t TestDataBundle.IndexingData.Document.name.setter(uint64_t a1, uint64_t a2)
{
  return sub_25A82398C(a1, a2, type metadata accessor for TestDataBundle.IndexingData.Document);
}

uint64_t (*TestDataBundle.IndexingData.Document.name.modify(uint64_t a1))()
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for TestDataBundle.IndexingData.Document(0) + 20);
  *(_DWORD *)(a1 + 24) = v3;
  uint64_t v4 = (uint64_t *)(v1 + v3);
  unint64_t v5 = v4[1];
  if (v5)
  {
    uint64_t v6 = *v4;
    unint64_t v7 = v5;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_25A8011C4;
}

BOOL TestDataBundle.IndexingData.Document.hasName.getter()
{
  return sub_25A823A6C(type metadata accessor for TestDataBundle.IndexingData.Document);
}

Swift::Void __swiftcall TestDataBundle.IndexingData.Document.clearName()()
{
}

uint64_t TestDataBundle.IndexingData.Document.body.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for TestDataBundle.IndexingData.Document(0) + 24));
  if (v1[1]) {
    uint64_t v2 = *v1;
  }
  else {
    uint64_t v2 = 0;
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t TestDataBundle.IndexingData.Document.body.setter(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for TestDataBundle.IndexingData.Document(0) + 24));
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TestDataBundle.IndexingData.Document.body.modify(uint64_t a1))()
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for TestDataBundle.IndexingData.Document(0) + 24);
  *(_DWORD *)(a1 + 24) = v3;
  uint64_t v4 = (uint64_t *)(v1 + v3);
  unint64_t v5 = v4[1];
  if (v5)
  {
    uint64_t v6 = *v4;
    unint64_t v7 = v5;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_25A8011C4;
}

BOOL TestDataBundle.IndexingData.Document.hasBody.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for TestDataBundle.IndexingData.Document(0) + 24) + 8) != 0;
}

Swift::Void __swiftcall TestDataBundle.IndexingData.Document.clearBody()()
{
  uint64_t v1 = (void *)(v0 + *(int *)(type metadata accessor for TestDataBundle.IndexingData.Document(0) + 24));
  swift_bridgeObjectRelease();
  void *v1 = 0;
  v1[1] = 0;
}

uint64_t TestDataBundle.IndexingData.Document.path.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for TestDataBundle.IndexingData.Document(0) + 28));
  if (v1[1]) {
    uint64_t v2 = *v1;
  }
  else {
    uint64_t v2 = 0;
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t TestDataBundle.IndexingData.Document.path.setter(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for TestDataBundle.IndexingData.Document(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*TestDataBundle.IndexingData.Document.path.modify(uint64_t a1))()
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for TestDataBundle.IndexingData.Document(0) + 28);
  *(_DWORD *)(a1 + 24) = v3;
  uint64_t v4 = (uint64_t *)(v1 + v3);
  unint64_t v5 = v4[1];
  if (v5)
  {
    uint64_t v6 = *v4;
    unint64_t v7 = v5;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_25A8011C4;
}

BOOL TestDataBundle.IndexingData.Document.hasPath.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for TestDataBundle.IndexingData.Document(0) + 28) + 8) != 0;
}

Swift::Void __swiftcall TestDataBundle.IndexingData.Document.clearPath()()
{
  uint64_t v1 = (void *)(v0 + *(int *)(type metadata accessor for TestDataBundle.IndexingData.Document(0) + 28));
  swift_bridgeObjectRelease();
  void *v1 = 0;
  v1[1] = 0;
}

uint64_t (*TestDataBundle.IndexingData.Document.unknownFields.modify())()
{
  return nullsub_1;
}

int *TestDataBundle.IndexingData.Document.init()@<X0>(uint64_t a1@<X8>)
{
  _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t result = (int *)type metadata accessor for TestDataBundle.IndexingData.Document(0);
  uint64_t v3 = (void *)(a1 + result[5]);
  void *v3 = 0;
  v3[1] = 0;
  uint64_t v4 = (void *)(a1 + result[6]);
  *uint64_t v4 = 0;
  v4[1] = 0;
  unint64_t v5 = (void *)(a1 + result[7]);
  *unint64_t v5 = 0;
  v5[1] = 0;
  return result;
}

uint64_t (*TestDataBundle.SearchingData.tokens.modify())()
{
  return nullsub_1;
}

uint64_t TestDataBundle.SearchingData.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25A823784(type metadata accessor for TestDataBundle.SearchingData, a1);
}

uint64_t sub_25A823784@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1(0) + 20);
  uint64_t v5 = sub_25A82CC10();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t TestDataBundle.SearchingData.unknownFields.setter(uint64_t a1)
{
  return sub_25A82381C(a1, type metadata accessor for TestDataBundle.SearchingData);
}

uint64_t sub_25A82381C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = v2 + *(int *)(a2(0) + 20);
  uint64_t v5 = sub_25A82CC10();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*TestDataBundle.SearchingData.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t TestDataBundle.SearchingData.Token.token.getter()
{
  return sub_25A8238F8(type metadata accessor for TestDataBundle.SearchingData.Token);
}

uint64_t sub_25A8238F8(uint64_t (*a1)(void))
{
  uint64_t v2 = (uint64_t *)(v1 + *(int *)(a1(0) + 20));
  if (v2[1]) {
    uint64_t v3 = *v2;
  }
  else {
    uint64_t v3 = 0;
  }
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t type metadata accessor for TestDataBundle.SearchingData.Token(uint64_t a1)
{
  return sub_25A802F48(a1, (uint64_t *)&unk_26A4660C8);
}

uint64_t TestDataBundle.SearchingData.Token.token.setter(uint64_t a1, uint64_t a2)
{
  return sub_25A82398C(a1, a2, type metadata accessor for TestDataBundle.SearchingData.Token);
}

uint64_t sub_25A82398C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v6 = (void *)(v3 + *(int *)(a3(0) + 20));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*TestDataBundle.SearchingData.Token.token.modify(uint64_t a1))()
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for TestDataBundle.SearchingData.Token(0) + 20);
  *(_DWORD *)(a1 + 24) = v3;
  uint64_t v4 = (uint64_t *)(v1 + v3);
  unint64_t v5 = v4[1];
  if (v5)
  {
    uint64_t v6 = *v4;
    unint64_t v7 = v5;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_25A8011C4;
}

BOOL TestDataBundle.SearchingData.Token.hasToken.getter()
{
  return sub_25A823A6C(type metadata accessor for TestDataBundle.SearchingData.Token);
}

BOOL sub_25A823A6C(uint64_t (*a1)(void))
{
  return *(void *)(v1 + *(int *)(a1(0) + 20) + 8) != 0;
}

Swift::Void __swiftcall TestDataBundle.SearchingData.Token.clearToken()()
{
}

uint64_t sub_25A823ABC(uint64_t (*a1)(void))
{
  uint64_t v2 = (void *)(v1 + *(int *)(a1(0) + 20));
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = 0;
  v2[1] = 0;
  return result;
}

uint64_t TestDataBundle.SearchingData.Token.frequency.getter()
{
  uint64_t v1 = (unsigned char *)(v0 + *(int *)(type metadata accessor for TestDataBundle.SearchingData.Token(0) + 24));
  if (v1[4]) {
    return 0;
  }
  else {
    return *(unsigned int *)v1;
  }
}

uint64_t TestDataBundle.SearchingData.Token.frequency.setter(int a1)
{
  uint64_t result = type metadata accessor for TestDataBundle.SearchingData.Token(0);
  uint64_t v4 = v1 + *(int *)(result + 24);
  *(_DWORD *)uint64_t v4 = a1;
  *(unsigned char *)(v4 + 4) = 0;
  return result;
}

uint64_t (*TestDataBundle.SearchingData.Token.frequency.modify(uint64_t a1))(uint64_t result)
{
  *(void *)a1 = v1;
  uint64_t v3 = *(int *)(type metadata accessor for TestDataBundle.SearchingData.Token(0) + 24);
  *(_DWORD *)(a1 + 12) = v3;
  uint64_t v4 = (int *)(v1 + v3);
  if (*((unsigned char *)v4 + 4)) {
    int v5 = 0;
  }
  else {
    int v5 = *v4;
  }
  *(_DWORD *)(a1 + 8) = v5;
  return sub_25A823BD0;
}

uint64_t sub_25A823BD0(uint64_t result)
{
  uint64_t v1 = *(void *)result + *(int *)(result + 12);
  *(_DWORD *)uint64_t v1 = *(_DWORD *)(result + 8);
  *(unsigned char *)(v1 + 4) = 0;
  return result;
}

BOOL TestDataBundle.SearchingData.Token.hasFrequency.getter()
{
  return (*(unsigned char *)(v0 + *(int *)(type metadata accessor for TestDataBundle.SearchingData.Token(0) + 24) + 4) & 1) == 0;
}

Swift::Void __swiftcall TestDataBundle.SearchingData.Token.clearFrequency()()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for TestDataBundle.SearchingData.Token(0) + 24);
  *(_DWORD *)uint64_t v1 = 0;
  *(unsigned char *)(v1 + 4) = 1;
}

uint64_t (*TestDataBundle.SearchingData.Token.unknownFields.modify())()
{
  return nullsub_1;
}

uint64_t TestDataBundle.SearchingData.Token.init()@<X0>(uint64_t a1@<X8>)
{
  _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t result = type metadata accessor for TestDataBundle.SearchingData.Token(0);
  uint64_t v3 = (void *)(a1 + *(int *)(result + 20));
  void *v3 = 0;
  v3[1] = 0;
  uint64_t v4 = a1 + *(int *)(result + 24);
  *(_DWORD *)uint64_t v4 = 0;
  *(unsigned char *)(v4 + 4) = 1;
  return result;
}

uint64_t TestDataBundle.init()@<X0>(uint64_t a1@<X8>)
{
  _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t v2 = type metadata accessor for TestDataBundle(0);
  uint64_t v3 = a1 + *(int *)(v2 + 20);
  uint64_t v4 = type metadata accessor for TestDataBundle.IndexingData(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  uint64_t v5 = a1 + *(int *)(v2 + 24);
  uint64_t v6 = type metadata accessor for TestDataBundle.SearchingData(0);
  unint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(v5, 1, 1, v6);
}

const char *TestDataBundle.protoMessageName.unsafeMutableAddressor()
{
  return "TestDataBundle";
}

uint64_t static TestDataBundle.protoMessageName.getter()
{
  return 0x6174614474736554;
}

uint64_t sub_25A823DC4()
{
  uint64_t v0 = sub_25A82CD90();
  __swift_allocate_value_buffer(v0, static TestDataBundle._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static TestDataBundle._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465D30);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A465D38) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_25A82D9F0;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "indexingData";
  *(void *)(v6 + 8) = 12;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_25A82CD70();
  size_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "searchingData";
  *((void *)v10 + 1) = 13;
  v10[16] = 2;
  v9();
  return sub_25A82CD80();
}

uint64_t TestDataBundle._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_25A80724C(&qword_26A465B10, (uint64_t)static TestDataBundle._protobuf_nameMap);
}

uint64_t static TestDataBundle._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25A8072C4(&qword_26A465B10, (uint64_t)static TestDataBundle._protobuf_nameMap, a1);
}

uint64_t TestDataBundle.decodeMessage<A>(decoder:)()
{
  while (1)
  {
    uint64_t result = sub_25A82CC50();
    if (v0 || (v2 & 1) != 0) {
      break;
    }
    if (result == 2)
    {
      sub_25A824108();
    }
    else if (result == 1)
    {
      sub_25A824058();
    }
  }
  return result;
}

uint64_t sub_25A824058()
{
  return sub_25A82CCC0();
}

uint64_t sub_25A824108()
{
  return sub_25A82CCC0();
}

uint64_t TestDataBundle.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_25A824228(v3, a1, a2, a3);
  if (!v4)
  {
    sub_25A824420(v3, a1, a2, a3);
    return sub_25A82CBF0();
  }
  return result;
}

uint64_t sub_25A824228(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[1] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465FC8);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TestDataBundle.IndexingData(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for TestDataBundle(0);
  sub_25A8079B4(a1 + *(int *)(v12 + 20), (uint64_t)v7, &qword_26A465FC8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return sub_25A80CCC8((uint64_t)v7, &qword_26A465FC8);
  }
  sub_25A822BBC((uint64_t)v7, (uint64_t)v11, type metadata accessor for TestDataBundle.IndexingData);
  sub_25A826F1C(&qword_26A466030, (void (*)(uint64_t))type metadata accessor for TestDataBundle.IndexingData);
  sub_25A82CD60();
  return sub_25A823018((uint64_t)v11, type metadata accessor for TestDataBundle.IndexingData);
}

uint64_t sub_25A824420(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[1] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465FD0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TestDataBundle.SearchingData(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for TestDataBundle(0);
  sub_25A8079B4(a1 + *(int *)(v12 + 24), (uint64_t)v7, &qword_26A465FD0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return sub_25A80CCC8((uint64_t)v7, &qword_26A465FD0);
  }
  sub_25A822BBC((uint64_t)v7, (uint64_t)v11, type metadata accessor for TestDataBundle.SearchingData);
  sub_25A826F1C(&qword_26A466058, (void (*)(uint64_t))type metadata accessor for TestDataBundle.SearchingData);
  sub_25A82CD60();
  return sub_25A823018((uint64_t)v11, type metadata accessor for TestDataBundle.SearchingData);
}

uint64_t TestDataBundle.hashValue.getter()
{
  return sub_25A826248((void (*)(void))type metadata accessor for TestDataBundle, &qword_26A465FD8, (void (*)(uint64_t))type metadata accessor for TestDataBundle);
}

uint64_t sub_25A824664@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t v4 = a2 + *(int *)(a1 + 20);
  uint64_t v5 = type metadata accessor for TestDataBundle.IndexingData(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  uint64_t v6 = a2 + *(int *)(a1 + 24);
  uint64_t v7 = type metadata accessor for TestDataBundle.SearchingData(0);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
  return v8(v6, 1, 1, v7);
}

uint64_t sub_25A824730()
{
  return 0x6174614474736554;
}

uint64_t sub_25A824754()
{
  return TestDataBundle.decodeMessage<A>(decoder:)();
}

uint64_t sub_25A82476C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return TestDataBundle.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_25A824784(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A826F1C(&qword_26A4660F8, (void (*)(uint64_t))type metadata accessor for TestDataBundle);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_25A824800@<X0>(uint64_t a1@<X8>)
{
  return sub_25A8097A0(&qword_26A465B10, (uint64_t)static TestDataBundle._protobuf_nameMap, a1);
}

uint64_t sub_25A824824(uint64_t a1)
{
  uint64_t v2 = sub_25A826F1C(&qword_26A466018, (void (*)(uint64_t))type metadata accessor for TestDataBundle);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_25A824890()
{
  sub_25A826F1C(&qword_26A466018, (void (*)(uint64_t))type metadata accessor for TestDataBundle);
  return sub_25A82CCF0();
}

void *TestDataBundle.IndexingData.protoMessageName.unsafeMutableAddressor()
{
  return &static TestDataBundle.IndexingData.protoMessageName;
}

unint64_t static TestDataBundle.IndexingData.protoMessageName.getter()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_25A824938(uint64_t a1)
{
  return sub_25A8255E8(a1, static TestDataBundle.IndexingData._protobuf_nameMap, (uint64_t)"documents", 9);
}

uint64_t TestDataBundle.IndexingData._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_25A80724C(&qword_26A465B18, (uint64_t)static TestDataBundle.IndexingData._protobuf_nameMap);
}

uint64_t static TestDataBundle.IndexingData._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25A8072C4(&qword_26A465B18, (uint64_t)static TestDataBundle.IndexingData._protobuf_nameMap, a1);
}

uint64_t TestDataBundle.IndexingData.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25A8257E8(a1, a2, a3, (void (*)(void))type metadata accessor for TestDataBundle.IndexingData.Document, &qword_26A465FE0, (void (*)(uint64_t))type metadata accessor for TestDataBundle.IndexingData.Document);
}

uint64_t TestDataBundle.IndexingData.traverse<A>(visitor:)()
{
  if (!*(void *)(*(void *)v0 + 16)
    || (type metadata accessor for TestDataBundle.IndexingData.Document(0),
        sub_25A826F1C(&qword_26A465FE0, (void (*)(uint64_t))type metadata accessor for TestDataBundle.IndexingData.Document), uint64_t result = sub_25A82CD50(), !v1))
  {
    type metadata accessor for TestDataBundle.IndexingData(0);
    return sub_25A82CBF0();
  }
  return result;
}

uint64_t static TestDataBundle.IndexingData.== infix(_:_:)(char *a1, char *a2)
{
  return sub_25A82717C(a1, a2, sub_25A80DBC8, type metadata accessor for TestDataBundle.IndexingData) & 1;
}

uint64_t TestDataBundle.IndexingData.hashValue.getter()
{
  return sub_25A826248((void (*)(void))type metadata accessor for TestDataBundle.IndexingData, &qword_26A465FE8, (void (*)(uint64_t))type metadata accessor for TestDataBundle.IndexingData);
}

uint64_t sub_25A824B6C@<X0>(void *a1@<X8>)
{
  *a1 = MEMORY[0x263F8EE78];
  return _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
}

unint64_t sub_25A824B98()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_25A824BB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return TestDataBundle.IndexingData.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t sub_25A824BCC()
{
  return TestDataBundle.IndexingData.traverse<A>(visitor:)();
}

uint64_t sub_25A824BE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A826F1C(&qword_26A4660F0, (void (*)(uint64_t))type metadata accessor for TestDataBundle.IndexingData);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_25A824C60@<X0>(uint64_t a1@<X8>)
{
  return sub_25A8097A0(&qword_26A465B18, (uint64_t)static TestDataBundle.IndexingData._protobuf_nameMap, a1);
}

uint64_t sub_25A824C84(uint64_t a1)
{
  uint64_t v2 = sub_25A826F1C(&qword_26A466030, (void (*)(uint64_t))type metadata accessor for TestDataBundle.IndexingData);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_25A824CF0()
{
  sub_25A826F1C(&qword_26A466030, (void (*)(uint64_t))type metadata accessor for TestDataBundle.IndexingData);
  return sub_25A82CCF0();
}

uint64_t sub_25A824D6C(char *a1, char *a2)
{
  return sub_25A82717C(a1, a2, sub_25A80DBC8, type metadata accessor for TestDataBundle.IndexingData) & 1;
}

uint64_t sub_25A824DB0()
{
  uint64_t result = sub_25A82CF40();
  static TestDataBundle.IndexingData.Document.protoMessageName = 0xD00000000000001BLL;
  *(void *)algn_26A466228 = 0x800000025A830110;
  return result;
}

uint64_t *TestDataBundle.IndexingData.Document.protoMessageName.unsafeMutableAddressor()
{
  if (qword_26A465B20 != -1) {
    swift_once();
  }
  return &static TestDataBundle.IndexingData.Document.protoMessageName;
}

uint64_t static TestDataBundle.IndexingData.Document.protoMessageName.getter()
{
  return sub_25A825D60(&qword_26A465B20, &static TestDataBundle.IndexingData.Document.protoMessageName);
}

uint64_t sub_25A824E94()
{
  uint64_t v0 = sub_25A82CD90();
  __swift_allocate_value_buffer(v0, static TestDataBundle.IndexingData.Document._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static TestDataBundle.IndexingData.Document._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465D30);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A465D38) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_25A82D9E0;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "name";
  *(void *)(v6 + 8) = 4;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_25A82CD70();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "body";
  *((void *)v10 + 1) = 4;
  v10[16] = 2;
  v9();
  uint64_t v11 = (uint64_t)v5 + 2 * v2 + v1[14];
  *(void *)((char *)v5 + 2 * v2) = 3;
  *(void *)uint64_t v11 = "path";
  *(void *)(v11 + 8) = 4;
  *(unsigned char *)(v11 + 16) = 2;
  v9();
  return sub_25A82CD80();
}

uint64_t TestDataBundle.IndexingData.Document._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_25A80724C(&qword_26A465B28, (uint64_t)static TestDataBundle.IndexingData.Document._protobuf_nameMap);
}

uint64_t static TestDataBundle.IndexingData.Document._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25A8072C4(&qword_26A465B28, (uint64_t)static TestDataBundle.IndexingData.Document._protobuf_nameMap, a1);
}

uint64_t TestDataBundle.IndexingData.Document.decodeMessage<A>(decoder:)()
{
  while (1)
  {
    uint64_t result = sub_25A82CC50();
    if (v0 || (v2 & 1) != 0) {
      break;
    }
    if (result == 3 || result == 2 || result == 1)
    {
      type metadata accessor for TestDataBundle.IndexingData.Document(0);
      sub_25A82CCA0();
    }
    uint64_t v0 = 0;
  }
  return result;
}

uint64_t TestDataBundle.IndexingData.Document.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_25A826108(v3, a1, a2, a3, type metadata accessor for TestDataBundle.IndexingData.Document);
  if (!v4)
  {
    sub_25A825240(v3);
    sub_25A8252B8(v3);
    return sub_25A82CBF0();
  }
  return result;
}

uint64_t sub_25A825240(uint64_t a1)
{
  uint64_t result = type metadata accessor for TestDataBundle.IndexingData.Document(0);
  if (*(void *)(a1 + *(int *)(result + 24) + 8)) {
    return sub_25A82CD40();
  }
  return result;
}

uint64_t sub_25A8252B8(uint64_t a1)
{
  uint64_t result = type metadata accessor for TestDataBundle.IndexingData.Document(0);
  if (*(void *)(a1 + *(int *)(result + 28) + 8)) {
    return sub_25A82CD40();
  }
  return result;
}

uint64_t TestDataBundle.IndexingData.Document.hashValue.getter()
{
  return sub_25A826248((void (*)(void))type metadata accessor for TestDataBundle.IndexingData.Document, &qword_26A465FF0, (void (*)(uint64_t))type metadata accessor for TestDataBundle.IndexingData.Document);
}

uint64_t sub_25A82537C@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t v5 = a1[6];
  unint64_t v6 = (void *)(a2 + a1[5]);
  *unint64_t v6 = 0;
  v6[1] = 0;
  uint64_t v7 = (void *)(a2 + v5);
  *uint64_t v7 = 0;
  v7[1] = 0;
  uint64_t v8 = (void *)(a2 + a1[7]);
  *uint64_t v8 = 0;
  v8[1] = 0;
  return result;
}

uint64_t sub_25A8253C4(uint64_t a1, uint64_t a2)
{
  return sub_25A82633C(a1, a2, &qword_26A465B20, &static TestDataBundle.IndexingData.Document.protoMessageName);
}

uint64_t sub_25A8253EC()
{
  return TestDataBundle.IndexingData.Document.decodeMessage<A>(decoder:)();
}

uint64_t sub_25A825404(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return TestDataBundle.IndexingData.Document.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_25A82541C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A826F1C(&qword_26A4660E8, (void (*)(uint64_t))type metadata accessor for TestDataBundle.IndexingData.Document);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_25A825498@<X0>(uint64_t a1@<X8>)
{
  return sub_25A8097A0(&qword_26A465B28, (uint64_t)static TestDataBundle.IndexingData.Document._protobuf_nameMap, a1);
}

uint64_t sub_25A8254BC(uint64_t a1)
{
  uint64_t v2 = sub_25A826F1C(&qword_26A465FE0, (void (*)(uint64_t))type metadata accessor for TestDataBundle.IndexingData.Document);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_25A825528()
{
  sub_25A826F1C(&qword_26A465FE0, (void (*)(uint64_t))type metadata accessor for TestDataBundle.IndexingData.Document);
  return sub_25A82CCF0();
}

void *TestDataBundle.SearchingData.protoMessageName.unsafeMutableAddressor()
{
  return &static TestDataBundle.SearchingData.protoMessageName;
}

unint64_t static TestDataBundle.SearchingData.protoMessageName.getter()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_25A8255D0(uint64_t a1)
{
  return sub_25A8255E8(a1, static TestDataBundle.SearchingData._protobuf_nameMap, (uint64_t)"tokens", 6);
}

uint64_t sub_25A8255E8(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_25A82CD90();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465D30);
  uint64_t v8 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A465D38) - 8);
  unint64_t v9 = (*(unsigned __int8 *)(*(void *)v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v8 + 80);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_25A82E640;
  unint64_t v11 = v10 + v9 + v8[14];
  *(void *)(v10 + v9) = 1;
  *(void *)unint64_t v11 = a3;
  *(void *)(v11 + 8) = a4;
  *(unsigned char *)(v11 + 16) = 2;
  uint64_t v12 = *MEMORY[0x263F50718];
  uint64_t v13 = sub_25A82CD70();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 104))(v11, v12, v13);
  return sub_25A82CD80();
}

uint64_t TestDataBundle.SearchingData._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_25A80724C(&qword_26A465B30, (uint64_t)static TestDataBundle.SearchingData._protobuf_nameMap);
}

uint64_t static TestDataBundle.SearchingData._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25A8072C4(&qword_26A465B30, (uint64_t)static TestDataBundle.SearchingData._protobuf_nameMap, a1);
}

uint64_t TestDataBundle.SearchingData.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25A8257E8(a1, a2, a3, (void (*)(void))type metadata accessor for TestDataBundle.SearchingData.Token, &qword_26A465FF8, (void (*)(uint64_t))type metadata accessor for TestDataBundle.SearchingData.Token);
}

uint64_t sub_25A8257E8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), unint64_t *a5, void (*a6)(uint64_t))
{
  uint64_t result = sub_25A82CC50();
  if (!v6)
  {
    while ((v10 & 1) == 0)
    {
      if (result == 1)
      {
        a4(0);
        sub_25A826F1C(a5, a6);
        sub_25A82CCB0();
      }
      uint64_t result = sub_25A82CC50();
    }
  }
  return result;
}

uint64_t TestDataBundle.SearchingData.traverse<A>(visitor:)()
{
  if (!*(void *)(*(void *)v0 + 16)
    || (type metadata accessor for TestDataBundle.SearchingData.Token(0),
        sub_25A826F1C(&qword_26A465FF8, (void (*)(uint64_t))type metadata accessor for TestDataBundle.SearchingData.Token), uint64_t result = sub_25A82CD50(), !v1))
  {
    type metadata accessor for TestDataBundle.SearchingData(0);
    return sub_25A82CBF0();
  }
  return result;
}

uint64_t static TestDataBundle.SearchingData.== infix(_:_:)(char *a1, char *a2)
{
  return sub_25A82717C(a1, a2, sub_25A80D964, type metadata accessor for TestDataBundle.SearchingData) & 1;
}

uint64_t TestDataBundle.SearchingData.hashValue.getter()
{
  return sub_25A826248((void (*)(void))type metadata accessor for TestDataBundle.SearchingData, &qword_26A466000, (void (*)(uint64_t))type metadata accessor for TestDataBundle.SearchingData);
}

unint64_t sub_25A825A6C()
{
  return 0xD00000000000001CLL;
}

uint64_t sub_25A825A88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return TestDataBundle.SearchingData.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t sub_25A825AA0()
{
  return TestDataBundle.SearchingData.traverse<A>(visitor:)();
}

uint64_t sub_25A825AB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A826F1C(&qword_26A4660E0, (void (*)(uint64_t))type metadata accessor for TestDataBundle.SearchingData);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_25A825B34@<X0>(uint64_t a1@<X8>)
{
  return sub_25A8097A0(&qword_26A465B30, (uint64_t)static TestDataBundle.SearchingData._protobuf_nameMap, a1);
}

uint64_t sub_25A825B58(uint64_t a1)
{
  uint64_t v2 = sub_25A826F1C(&qword_26A466058, (void (*)(uint64_t))type metadata accessor for TestDataBundle.SearchingData);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_25A825BC4()
{
  sub_25A826F1C(&qword_26A466058, (void (*)(uint64_t))type metadata accessor for TestDataBundle.SearchingData);
  return sub_25A82CCF0();
}

uint64_t sub_25A825C40(char *a1, char *a2)
{
  return sub_25A82717C(a1, a2, sub_25A80D964, type metadata accessor for TestDataBundle.SearchingData) & 1;
}

uint64_t sub_25A825C84()
{
  uint64_t result = sub_25A82CF40();
  static TestDataBundle.SearchingData.Token.protoMessageName = 0xD00000000000001CLL;
  *(void *)algn_26A466268 = 0x800000025A830130;
  return result;
}

uint64_t *TestDataBundle.SearchingData.Token.protoMessageName.unsafeMutableAddressor()
{
  if (qword_26A465B38 != -1) {
    swift_once();
  }
  return &static TestDataBundle.SearchingData.Token.protoMessageName;
}

uint64_t static TestDataBundle.SearchingData.Token.protoMessageName.getter()
{
  return sub_25A825D60(&qword_26A465B38, &static TestDataBundle.SearchingData.Token.protoMessageName);
}

uint64_t sub_25A825D60(void *a1, uint64_t *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_25A825DB4()
{
  uint64_t v0 = sub_25A82CD90();
  __swift_allocate_value_buffer(v0, static TestDataBundle.SearchingData.Token._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static TestDataBundle.SearchingData.Token._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A465D30);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A465D38) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_25A82D9F0;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  *uint64_t v5 = 1;
  *(void *)unint64_t v6 = "token";
  *(void *)(v6 + 8) = 5;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_25A82CD70();
  unint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  char v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)char v10 = "frequency";
  *((void *)v10 + 1) = 9;
  v10[16] = 2;
  v9();
  return sub_25A82CD80();
}

uint64_t TestDataBundle.SearchingData.Token._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_25A80724C(&qword_26A465B40, (uint64_t)static TestDataBundle.SearchingData.Token._protobuf_nameMap);
}

uint64_t static TestDataBundle.SearchingData.Token._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_25A8072C4(&qword_26A465B40, (uint64_t)static TestDataBundle.SearchingData.Token._protobuf_nameMap, a1);
}

uint64_t TestDataBundle.SearchingData.Token.decodeMessage<A>(decoder:)()
{
  while (1)
  {
    uint64_t result = sub_25A82CC50();
    if (v0 || (v2 & 1) != 0) {
      break;
    }
    if (result == 2)
    {
      type metadata accessor for TestDataBundle.SearchingData.Token(0);
      sub_25A82CC60();
    }
    else if (result == 1)
    {
      type metadata accessor for TestDataBundle.SearchingData.Token(0);
      sub_25A82CCA0();
    }
    uint64_t v0 = 0;
  }
  return result;
}

uint64_t TestDataBundle.SearchingData.Token.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_25A826108(v3, a1, a2, a3, type metadata accessor for TestDataBundle.SearchingData.Token);
  if (!v4)
  {
    sub_25A826184(v3);
    return sub_25A82CBF0();
  }
  return result;
}

uint64_t sub_25A826108(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t result = a5(0);
  if (*(void *)(a1 + *(int *)(result + 20) + 8)) {
    return sub_25A82CD40();
  }
  return result;
}

uint64_t sub_25A826184(uint64_t a1)
{
  uint64_t result = type metadata accessor for TestDataBundle.SearchingData.Token(0);
  if ((*(unsigned char *)(a1 + *(int *)(result + 24) + 4) & 1) == 0) {
    return sub_25A82CD00();
  }
  return result;
}

uint64_t TestDataBundle.SearchingData.Token.hashValue.getter()
{
  return sub_25A826248((void (*)(void))type metadata accessor for TestDataBundle.SearchingData.Token, &qword_26A466008, (void (*)(uint64_t))type metadata accessor for TestDataBundle.SearchingData.Token);
}

uint64_t sub_25A826248(void (*a1)(void), unint64_t *a2, void (*a3)(uint64_t))
{
  return sub_25A82D430();
}

uint64_t sub_25A8262D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t v5 = *(int *)(a1 + 24);
  unint64_t v6 = (void *)(a2 + *(int *)(a1 + 20));
  *unint64_t v6 = 0;
  v6[1] = 0;
  uint64_t v7 = a2 + v5;
  *(_DWORD *)uint64_t v7 = 0;
  *(unsigned char *)(v7 + 4) = 1;
  return result;
}

uint64_t sub_25A826314(uint64_t a1, uint64_t a2)
{
  return sub_25A82633C(a1, a2, &qword_26A465B38, &static TestDataBundle.SearchingData.Token.protoMessageName);
}

uint64_t sub_25A82633C(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4)
{
  if (*a3 != -1) {
    swift_once();
  }
  uint64_t v5 = *a4;
  swift_bridgeObjectRetain();
  return v5;
}

uint64_t sub_25A826394()
{
  return TestDataBundle.SearchingData.Token.decodeMessage<A>(decoder:)();
}

uint64_t sub_25A8263AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return TestDataBundle.SearchingData.Token.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_25A8263C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A826F1C(&qword_26A4660D8, (void (*)(uint64_t))type metadata accessor for TestDataBundle.SearchingData.Token);
  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_25A826440@<X0>(uint64_t a1@<X8>)
{
  return sub_25A8097A0(&qword_26A465B40, (uint64_t)static TestDataBundle.SearchingData.Token._protobuf_nameMap, a1);
}

uint64_t sub_25A826464(uint64_t a1)
{
  uint64_t v2 = sub_25A826F1C(&qword_26A465FF8, (void (*)(uint64_t))type metadata accessor for TestDataBundle.SearchingData.Token);
  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_25A8264D0()
{
  sub_25A826F1C(&qword_26A465FF8, (void (*)(uint64_t))type metadata accessor for TestDataBundle.SearchingData.Token);
  return sub_25A82CCF0();
}

uint64_t _s17PrivateSearchCore14TestDataBundleV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v72 = a2;
  uint64_t v63 = sub_25A82CC10();
  uint64_t v61 = *(void *)(v63 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v63);
  uint64_t v60 = (char *)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v59 = (char *)&v57 - v5;
  uint64_t v68 = type metadata accessor for TestDataBundle.SearchingData(0);
  uint64_t v65 = *(void *)(v68 - 8);
  MEMORY[0x270FA5388](v68);
  uint64_t v58 = (uint64_t *)((char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A466100);
  MEMORY[0x270FA5388](v64);
  uint64_t v69 = (uint64_t)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465FD0);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v62 = (uint64_t *)((char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v66 = (uint64_t)&v57 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v67 = (uint64_t)&v57 - v13;
  uint64_t v14 = type metadata accessor for TestDataBundle.IndexingData(0);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  unint64_t v17 = (uint64_t *)((char *)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A466108);
  uint64_t v19 = v18 - 8;
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v57 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465FC8);
  uint64_t v23 = MEMORY[0x270FA5388](v22 - 8);
  v71 = (uint64_t *)((char *)&v57 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v57 - v26;
  MEMORY[0x270FA5388](v25);
  uint64_t v29 = (char *)&v57 - v28;
  uint64_t v30 = type metadata accessor for TestDataBundle(0);
  uint64_t v31 = *(int *)(v30 + 20);
  uint64_t v70 = a1;
  sub_25A8079B4(a1 + v31, (uint64_t)v29, &qword_26A465FC8);
  sub_25A8079B4(v72 + *(int *)(v30 + 20), (uint64_t)v27, &qword_26A465FC8);
  uint64_t v32 = (uint64_t)&v21[*(int *)(v19 + 56)];
  sub_25A8079B4((uint64_t)v29, (uint64_t)v21, &qword_26A465FC8);
  sub_25A8079B4((uint64_t)v27, v32, &qword_26A465FC8);
  unsigned int v33 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48);
  if (v33((uint64_t)v21, 1, v14) == 1)
  {
    sub_25A80CCC8((uint64_t)v27, &qword_26A465FC8);
    sub_25A80CCC8((uint64_t)v29, &qword_26A465FC8);
    if (v33(v32, 1, v14) == 1)
    {
      sub_25A80CCC8((uint64_t)v21, &qword_26A465FC8);
      goto LABEL_4;
    }
LABEL_9:
    uint64_t v43 = &qword_26A466108;
    uint64_t v44 = (uint64_t)v21;
    goto LABEL_21;
  }
  uint64_t v42 = v71;
  sub_25A8079B4((uint64_t)v21, (uint64_t)v71, &qword_26A465FC8);
  if (v33(v32, 1, v14) == 1)
  {
    sub_25A80CCC8((uint64_t)v27, &qword_26A465FC8);
    sub_25A80CCC8((uint64_t)v29, &qword_26A465FC8);
    sub_25A823018((uint64_t)v42, type metadata accessor for TestDataBundle.IndexingData);
    goto LABEL_9;
  }
  sub_25A822BBC(v32, (uint64_t)v17, type metadata accessor for TestDataBundle.IndexingData);
  if ((sub_25A80DBC8(*v42, *v17) & 1) == 0)
  {
    sub_25A823018((uint64_t)v17, type metadata accessor for TestDataBundle.IndexingData);
    sub_25A80CCC8((uint64_t)v27, &qword_26A465FC8);
    sub_25A80CCC8((uint64_t)v29, &qword_26A465FC8);
    sub_25A823018((uint64_t)v42, type metadata accessor for TestDataBundle.IndexingData);
    uint64_t v44 = (uint64_t)v21;
    uint64_t v43 = &qword_26A465FC8;
    goto LABEL_21;
  }
  sub_25A826F1C((unint64_t *)&qword_26A465D10, MEMORY[0x263F50560]);
  char v45 = sub_25A82CE40();
  sub_25A823018((uint64_t)v17, type metadata accessor for TestDataBundle.IndexingData);
  sub_25A80CCC8((uint64_t)v27, &qword_26A465FC8);
  sub_25A80CCC8((uint64_t)v29, &qword_26A465FC8);
  sub_25A823018((uint64_t)v42, type metadata accessor for TestDataBundle.IndexingData);
  sub_25A80CCC8((uint64_t)v21, &qword_26A465FC8);
  if ((v45 & 1) == 0) {
    goto LABEL_22;
  }
LABEL_4:
  uint64_t v34 = v70;
  uint64_t v35 = v67;
  sub_25A8079B4(v70 + *(int *)(v30 + 24), v67, &qword_26A465FD0);
  uint64_t v36 = v72;
  uint64_t v37 = v66;
  sub_25A8079B4(v72 + *(int *)(v30 + 24), v66, &qword_26A465FD0);
  uint64_t v38 = v69;
  uint64_t v39 = v69 + *(int *)(v64 + 48);
  sub_25A8079B4(v35, v69, &qword_26A465FD0);
  sub_25A8079B4(v37, v39, &qword_26A465FD0);
  unint64_t v40 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v65 + 48);
  uint64_t v41 = v68;
  if (v40(v38, 1, v68) != 1)
  {
    uint64_t v46 = v62;
    sub_25A8079B4(v38, (uint64_t)v62, &qword_26A465FD0);
    if (v40(v39, 1, v41) == 1)
    {
      sub_25A80CCC8(v37, &qword_26A465FD0);
      sub_25A80CCC8(v35, &qword_26A465FD0);
      sub_25A823018((uint64_t)v46, type metadata accessor for TestDataBundle.SearchingData);
      goto LABEL_15;
    }
    uint64_t v47 = v58;
    sub_25A822BBC(v39, (uint64_t)v58, type metadata accessor for TestDataBundle.SearchingData);
    if (sub_25A80D964(*v46, *v47))
    {
      sub_25A826F1C((unint64_t *)&qword_26A465D10, MEMORY[0x263F50560]);
      char v48 = sub_25A82CE40();
      sub_25A823018((uint64_t)v47, type metadata accessor for TestDataBundle.SearchingData);
      sub_25A80CCC8(v37, &qword_26A465FD0);
      sub_25A80CCC8(v35, &qword_26A465FD0);
      sub_25A823018((uint64_t)v46, type metadata accessor for TestDataBundle.SearchingData);
      sub_25A80CCC8(v38, &qword_26A465FD0);
      if (v48) {
        goto LABEL_19;
      }
LABEL_22:
      char v54 = 0;
      return v54 & 1;
    }
    sub_25A823018((uint64_t)v47, type metadata accessor for TestDataBundle.SearchingData);
    sub_25A80CCC8(v37, &qword_26A465FD0);
    sub_25A80CCC8(v35, &qword_26A465FD0);
    sub_25A823018((uint64_t)v46, type metadata accessor for TestDataBundle.SearchingData);
    uint64_t v44 = v38;
    uint64_t v43 = &qword_26A465FD0;
LABEL_21:
    sub_25A80CCC8(v44, v43);
    goto LABEL_22;
  }
  sub_25A80CCC8(v37, &qword_26A465FD0);
  sub_25A80CCC8(v35, &qword_26A465FD0);
  if (v40(v39, 1, v41) != 1)
  {
LABEL_15:
    uint64_t v43 = &qword_26A466100;
    uint64_t v44 = v38;
    goto LABEL_21;
  }
  sub_25A80CCC8(v38, &qword_26A465FD0);
LABEL_19:
  uint64_t v49 = v61;
  uint64_t v50 = *(void (**)(char *, uint64_t, uint64_t))(v61 + 16);
  uint64_t v51 = v59;
  uint64_t v52 = v63;
  v50(v59, v34, v63);
  uint64_t v53 = v60;
  v50(v60, v36, v52);
  sub_25A826F1C((unint64_t *)&qword_26A465D10, MEMORY[0x263F50560]);
  char v54 = sub_25A82CE40();
  int64_t v55 = *(void (**)(char *, uint64_t))(v49 + 8);
  v55(v53, v52);
  v55(v51, v52);
  return v54 & 1;
}

uint64_t sub_25A826F1C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t _s17PrivateSearchCore14TestDataBundleV09SearchingE0V5TokenV2eeoiySbAG_AGtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A82CC10();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v27 - v9;
  uint64_t v11 = type metadata accessor for TestDataBundle.SearchingData.Token(0);
  uint64_t v12 = *(int *)(v11 + 20);
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = *(void *)(a1 + v12 + 8);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  if (!v14)
  {
    if (!v16) {
      goto LABEL_10;
    }
LABEL_12:
    char v18 = 0;
    return v18 & 1;
  }
  if (!v16) {
    goto LABEL_12;
  }
  BOOL v17 = *v13 == *v15 && v14 == v16;
  if (v17 || (char v18 = 0, (sub_25A82D370() & 1) != 0))
  {
LABEL_10:
    uint64_t v19 = *(int *)(v11 + 24);
    uint64_t v20 = (_DWORD *)(a1 + v19);
    char v21 = *(unsigned char *)(a1 + v19 + 4);
    uint64_t v22 = (_DWORD *)(a2 + v19);
    int v23 = *(unsigned __int8 *)(a2 + v19 + 4);
    if (v21)
    {
      if (!v23) {
        goto LABEL_12;
      }
    }
    else
    {
      if (*v20 != *v22) {
        LOBYTE(v23) = 1;
      }
      if (v23) {
        goto LABEL_12;
      }
    }
    uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v24(v10, a1, v4);
    v24(v8, a2, v4);
    sub_25A826F1C((unint64_t *)&qword_26A465D10, MEMORY[0x263F50560]);
    char v18 = sub_25A82CE40();
    uint64_t v25 = *(void (**)(char *, uint64_t))(v5 + 8);
    v25(v8, v4);
    v25(v10, v4);
  }
  return v18 & 1;
}

uint64_t sub_25A82717C(char *a1, char *a2, uint64_t (*a3)(void, void), uint64_t (*a4)(void))
{
  uint64_t v8 = sub_25A82CC10();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v20 - v13;
  if (a3(*(void *)a1, *(void *)a2))
  {
    uint64_t v15 = a4(0);
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
    v16(v14, &a1[*(int *)(v15 + 20)], v8);
    v16(v12, &a2[*(int *)(v15 + 20)], v8);
    sub_25A826F1C((unint64_t *)&qword_26A465D10, MEMORY[0x263F50560]);
    char v17 = sub_25A82CE40();
    char v18 = *(void (**)(char *, uint64_t))(v9 + 8);
    v18(v12, v8);
    v18(v14, v8);
  }
  else
  {
    char v17 = 0;
  }
  return v17 & 1;
}

uint64_t _s17PrivateSearchCore14TestDataBundleV08IndexingE0V8DocumentV2eeoiySbAG_AGtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A82CC10();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v34 - v9;
  uint64_t v11 = (int *)type metadata accessor for TestDataBundle.IndexingData.Document(0);
  uint64_t v12 = v11[5];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = *(void *)(a1 + v12 + 8);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  if (!v14)
  {
    if (v16) {
      goto LABEL_28;
    }
    goto LABEL_10;
  }
  if (!v16) {
    goto LABEL_28;
  }
  BOOL v17 = *v13 == *v15 && v14 == v16;
  if (v17 || (char v18 = 0, (sub_25A82D370() & 1) != 0))
  {
LABEL_10:
    uint64_t v19 = v11[6];
    uint64_t v20 = (void *)(a1 + v19);
    uint64_t v21 = *(void *)(a1 + v19 + 8);
    uint64_t v22 = (void *)(a2 + v19);
    uint64_t v23 = v22[1];
    if (v21)
    {
      if (!v23) {
        goto LABEL_28;
      }
      if (*v20 != *v22 || v21 != v23)
      {
        char v18 = 0;
        if ((sub_25A82D370() & 1) == 0) {
          return v18 & 1;
        }
      }
    }
    else if (v23)
    {
      goto LABEL_28;
    }
    uint64_t v25 = v11[7];
    uint64_t v26 = (void *)(a1 + v25);
    uint64_t v27 = *(void *)(a1 + v25 + 8);
    uint64_t v28 = (void *)(a2 + v25);
    uint64_t v29 = v28[1];
    if (v27)
    {
      if (v29)
      {
        if (*v26 != *v28 || v27 != v29)
        {
          char v18 = 0;
          if ((sub_25A82D370() & 1) == 0) {
            return v18 & 1;
          }
        }
LABEL_30:
        uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
        v32(v10, a1, v4);
        v32(v8, a2, v4);
        sub_25A826F1C((unint64_t *)&qword_26A465D10, MEMORY[0x263F50560]);
        char v18 = sub_25A82CE40();
        unsigned int v33 = *(void (**)(char *, uint64_t))(v5 + 8);
        v33(v8, v4);
        v33(v10, v4);
        return v18 & 1;
      }
    }
    else if (!v29)
    {
      goto LABEL_30;
    }
LABEL_28:
    char v18 = 0;
  }
  return v18 & 1;
}

uint64_t sub_25A8275BC()
{
  return sub_25A826F1C(&qword_26A466010, (void (*)(uint64_t))type metadata accessor for TestDataBundle);
}

uint64_t sub_25A827604()
{
  return sub_25A826F1C(&qword_26A466018, (void (*)(uint64_t))type metadata accessor for TestDataBundle);
}

uint64_t sub_25A82764C()
{
  return sub_25A826F1C(&qword_26A465FD8, (void (*)(uint64_t))type metadata accessor for TestDataBundle);
}

uint64_t sub_25A827694()
{
  return sub_25A826F1C(&qword_26A466020, (void (*)(uint64_t))type metadata accessor for TestDataBundle);
}

uint64_t sub_25A8276DC()
{
  return sub_25A826F1C(&qword_26A466028, (void (*)(uint64_t))type metadata accessor for TestDataBundle.IndexingData);
}

uint64_t sub_25A827724()
{
  return sub_25A826F1C(&qword_26A466030, (void (*)(uint64_t))type metadata accessor for TestDataBundle.IndexingData);
}

uint64_t sub_25A82776C()
{
  return sub_25A826F1C(&qword_26A465FE8, (void (*)(uint64_t))type metadata accessor for TestDataBundle.IndexingData);
}

uint64_t sub_25A8277B4()
{
  return sub_25A826F1C(&qword_26A466038, (void (*)(uint64_t))type metadata accessor for TestDataBundle.IndexingData);
}

uint64_t sub_25A8277FC()
{
  return sub_25A826F1C(&qword_26A466040, (void (*)(uint64_t))type metadata accessor for TestDataBundle.IndexingData.Document);
}

uint64_t sub_25A827844()
{
  return sub_25A826F1C(&qword_26A465FE0, (void (*)(uint64_t))type metadata accessor for TestDataBundle.IndexingData.Document);
}

uint64_t sub_25A82788C()
{
  return sub_25A826F1C(&qword_26A465FF0, (void (*)(uint64_t))type metadata accessor for TestDataBundle.IndexingData.Document);
}

uint64_t sub_25A8278D4()
{
  return sub_25A826F1C(&qword_26A466048, (void (*)(uint64_t))type metadata accessor for TestDataBundle.IndexingData.Document);
}

uint64_t sub_25A82791C()
{
  return sub_25A826F1C(&qword_26A466050, (void (*)(uint64_t))type metadata accessor for TestDataBundle.SearchingData);
}

uint64_t sub_25A827964()
{
  return sub_25A826F1C(&qword_26A466058, (void (*)(uint64_t))type metadata accessor for TestDataBundle.SearchingData);
}

uint64_t sub_25A8279AC()
{
  return sub_25A826F1C(&qword_26A466000, (void (*)(uint64_t))type metadata accessor for TestDataBundle.SearchingData);
}

uint64_t sub_25A8279F4()
{
  return sub_25A826F1C(&qword_26A466060, (void (*)(uint64_t))type metadata accessor for TestDataBundle.SearchingData);
}

uint64_t sub_25A827A3C()
{
  return sub_25A826F1C(&qword_26A466068, (void (*)(uint64_t))type metadata accessor for TestDataBundle.SearchingData.Token);
}

uint64_t sub_25A827A84()
{
  return sub_25A826F1C(&qword_26A465FF8, (void (*)(uint64_t))type metadata accessor for TestDataBundle.SearchingData.Token);
}

uint64_t sub_25A827ACC()
{
  return sub_25A826F1C(&qword_26A466008, (void (*)(uint64_t))type metadata accessor for TestDataBundle.SearchingData.Token);
}

uint64_t sub_25A827B14()
{
  return sub_25A826F1C(&qword_26A466070, (void (*)(uint64_t))type metadata accessor for TestDataBundle.SearchingData.Token);
}

uint64_t *initializeBufferWithCopyOfBuffer for TestDataBundle(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25A82CC10();
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (uint64_t *)((char *)a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    uint64_t v12 = type metadata accessor for TestDataBundle.IndexingData(0);
    uint64_t v13 = *(void *)(v12 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465FC8);
      memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      *uint64_t v10 = *v11;
      uint64_t v16 = *(int *)(v12 + 20);
      BOOL v17 = v8;
      char v18 = (char *)v10 + v16;
      uint64_t v19 = (char *)v11 + v16;
      swift_bridgeObjectRetain();
      uint64_t v20 = v18;
      uint64_t v8 = v17;
      v17((uint64_t *)v20, (uint64_t *)v19, v7);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    uint64_t v21 = *(int *)(a3 + 24);
    uint64_t v22 = (uint64_t *)((char *)a1 + v21);
    uint64_t v23 = (uint64_t *)((char *)a2 + v21);
    uint64_t v24 = type metadata accessor for TestDataBundle.SearchingData(0);
    uint64_t v25 = *(void *)(v24 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
    {
      uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465FD0);
      memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
    }
    else
    {
      *uint64_t v22 = *v23;
      uint64_t v27 = *(int *)(v24 + 20);
      uint64_t v28 = (char *)v22 + v27;
      uint64_t v29 = (char *)v23 + v27;
      swift_bridgeObjectRetain();
      v8((uint64_t *)v28, (uint64_t *)v29, v7);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
    }
  }
  return a1;
}

uint64_t destroy for TestDataBundle(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25A82CC10();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v11(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = type metadata accessor for TestDataBundle.IndexingData(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6))
  {
    swift_bridgeObjectRelease();
    v11(v5 + *(int *)(v6 + 20), v4);
  }
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t v8 = type metadata accessor for TestDataBundle.SearchingData(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v7, 1, v8);
  if (!result)
  {
    swift_bridgeObjectRelease();
    uint64_t v10 = v7 + *(int *)(v8 + 20);
    return ((uint64_t (*)(uint64_t, uint64_t))v11)(v10, v4);
  }
  return result;
}

uint64_t initializeWithCopy for TestDataBundle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A82CC10();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = type metadata accessor for TestDataBundle.IndexingData(0);
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465FC8);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    *uint64_t v9 = *v10;
    uint64_t v14 = *(int *)(v11 + 20);
    uint64_t v15 = v7;
    uint64_t v16 = (char *)v9 + v14;
    BOOL v17 = (char *)v10 + v14;
    swift_bridgeObjectRetain();
    char v18 = v16;
    uint64_t v7 = v15;
    v15((uint64_t)v18, (uint64_t)v17, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  uint64_t v19 = *(int *)(a3 + 24);
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (void *)(a2 + v19);
  uint64_t v22 = type metadata accessor for TestDataBundle.SearchingData(0);
  uint64_t v23 = *(void *)(v22 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
  {
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465FD0);
    memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    void *v20 = *v21;
    uint64_t v25 = *(int *)(v22 + 20);
    uint64_t v26 = (char *)v20 + v25;
    uint64_t v27 = (char *)v21 + v25;
    swift_bridgeObjectRetain();
    v7((uint64_t)v26, (uint64_t)v27, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  }
  return a1;
}

uint64_t assignWithCopy for TestDataBundle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A82CC10();
  uint64_t v35 = *(void *)(v6 - 8);
  uint64_t v36 = v6;
  uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v35 + 24);
  ((void (*)(uint64_t, uint64_t))v34)(a1, a2);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for TestDataBundle.IndexingData(0);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      *uint64_t v8 = *v9;
      uint64_t v15 = *(int *)(v10 + 20);
      uint64_t v16 = (char *)v8 + v15;
      BOOL v17 = (char *)v9 + v15;
      char v18 = *(void (**)(char *, char *, uint64_t))(v35 + 16);
      swift_bridgeObjectRetain();
      v18(v16, v17, v36);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    sub_25A823018((uint64_t)v8, type metadata accessor for TestDataBundle.IndexingData);
LABEL_6:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465FC8);
    memcpy(v8, v9, *(void *)(*(void *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  *uint64_t v8 = *v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v34((char *)v8 + *(int *)(v10 + 20), (char *)v9 + *(int *)(v10 + 20), v36);
LABEL_7:
  uint64_t v20 = *(int *)(a3 + 24);
  uint64_t v21 = (char *)(a1 + v20);
  uint64_t v22 = (char *)(a2 + v20);
  uint64_t v23 = type metadata accessor for TestDataBundle.SearchingData(0);
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48);
  int v26 = v25(v21, 1, v23);
  int v27 = v25(v22, 1, v23);
  if (!v26)
  {
    if (!v27)
    {
      *(void *)uint64_t v21 = *(void *)v22;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v34(&v21[*(int *)(v23 + 20)], &v22[*(int *)(v23 + 20)], v36);
      return a1;
    }
    sub_25A823018((uint64_t)v21, type metadata accessor for TestDataBundle.SearchingData);
    goto LABEL_12;
  }
  if (v27)
  {
LABEL_12:
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465FD0);
    memcpy(v21, v22, *(void *)(*(void *)(v32 - 8) + 64));
    return a1;
  }
  *(void *)uint64_t v21 = *(void *)v22;
  uint64_t v28 = *(int *)(v23 + 20);
  uint64_t v29 = &v21[v28];
  uint64_t v30 = &v22[v28];
  uint64_t v31 = *(void (**)(char *, char *, uint64_t))(v35 + 16);
  swift_bridgeObjectRetain();
  v31(v29, v30, v36);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  return a1;
}

char *initializeWithTake for TestDataBundle(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_25A82CC10();
  uint64_t v7 = *(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = type metadata accessor for TestDataBundle.IndexingData(0);
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465FC8);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    *(void *)uint64_t v9 = *(void *)v10;
    v7(&v9[*(int *)(v11 + 20)], &v10[*(int *)(v11 + 20)], v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  uint64_t v14 = *(int *)(a3 + 24);
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v17 = type metadata accessor for TestDataBundle.SearchingData(0);
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465FD0);
    memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    *(void *)uint64_t v15 = *(void *)v16;
    v7(&v15[*(int *)(v17 + 20)], &v16[*(int *)(v17 + 20)], v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  return a1;
}

uint64_t assignWithTake for TestDataBundle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A82CC10();
  uint64_t v27 = *(void *)(v6 - 8);
  uint64_t v28 = v6;
  int v26 = *(void (**)(uint64_t, uint64_t))(v27 + 40);
  v26(a1, a2);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  uint64_t v10 = type metadata accessor for TestDataBundle.IndexingData(0);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      *(void *)uint64_t v8 = *(void *)v9;
      (*(void (**)(char *, char *, uint64_t))(v27 + 32))(&v8[*(int *)(v10 + 20)], &v9[*(int *)(v10 + 20)], v28);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    sub_25A823018((uint64_t)v8, type metadata accessor for TestDataBundle.IndexingData);
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465FC8);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  *(void *)uint64_t v8 = *(void *)v9;
  swift_bridgeObjectRelease();
  ((void (*)(char *, char *, uint64_t))v26)(&v8[*(int *)(v10 + 20)], &v9[*(int *)(v10 + 20)], v28);
LABEL_7:
  uint64_t v16 = *(int *)(a3 + 24);
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  uint64_t v19 = type metadata accessor for TestDataBundle.SearchingData(0);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v20 + 48);
  int v22 = v21(v17, 1, v19);
  int v23 = v21(v18, 1, v19);
  if (!v22)
  {
    if (!v23)
    {
      *uint64_t v17 = *v18;
      swift_bridgeObjectRelease();
      ((void (*)(char *, char *, uint64_t))v26)((char *)v17 + *(int *)(v19 + 20), (char *)v18 + *(int *)(v19 + 20), v28);
      return a1;
    }
    sub_25A823018((uint64_t)v17, type metadata accessor for TestDataBundle.SearchingData);
    goto LABEL_12;
  }
  if (v23)
  {
LABEL_12:
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465FD0);
    memcpy(v17, v18, *(void *)(*(void *)(v24 - 8) + 64));
    return a1;
  }
  *uint64_t v17 = *v18;
  (*(void (**)(char *, char *, uint64_t))(v27 + 32))((char *)v17 + *(int *)(v19 + 20), (char *)v18 + *(int *)(v19 + 20), v28);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  return a1;
}

uint64_t getEnumTagSinglePayload for TestDataBundle(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A828BD8);
}

uint64_t sub_25A828BD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A82CC10();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465FC8);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465FD0);
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + *(int *)(a3 + 24);
  return v15(v17, a2, v16);
}

uint64_t storeEnumTagSinglePayload for TestDataBundle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A828D40);
}

uint64_t sub_25A828D40(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_25A82CC10();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465FC8);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A465FD0);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a4 + 24);
  return v17(v19, a2, a2, v18);
}

void sub_25A828EA0()
{
  sub_25A82CC10();
  if (v0 <= 0x3F)
  {
    sub_25A828FDC(319, &qword_26A466088, (void (*)(uint64_t))type metadata accessor for TestDataBundle.IndexingData);
    if (v1 <= 0x3F)
    {
      sub_25A828FDC(319, &qword_26A466090, (void (*)(uint64_t))type metadata accessor for TestDataBundle.SearchingData);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_25A828FDC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_25A82D1E0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t getEnumTagSinglePayload for TestDataBundle.IndexingData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_20Tm_0);
}

uint64_t storeEnumTagSinglePayload for TestDataBundle.IndexingData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_21Tm_0);
}

uint64_t *initializeBufferWithCopyOfBuffer for TestDataBundle.IndexingData.Document(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25A82CC10();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (uint64_t *)((char *)a1 + v9);
    uint64_t v14 = (uint64_t *)((char *)a2 + v9);
    uint64_t v15 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v15;
    uint64_t v16 = a3[7];
    uint64_t v17 = (uint64_t *)((char *)a1 + v16);
    uint64_t v18 = (uint64_t *)((char *)a2 + v16);
    uint64_t v19 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v19;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for TestDataBundle.IndexingData.Document(uint64_t a1)
{
  uint64_t v2 = sub_25A82CC10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TestDataBundle.IndexingData.Document(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25A82CC10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)(a1 + v8);
  uint64_t v13 = (void *)(a2 + v8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = a3[7];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TestDataBundle.IndexingData.Document(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25A82CC10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for TestDataBundle.IndexingData.Document(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25A82CC10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for TestDataBundle.IndexingData.Document(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_25A82CC10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[7];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (uint64_t *)(a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  *uint64_t v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TestDataBundle.IndexingData.Document(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_7Tm);
}

uint64_t storeEnumTagSinglePayload for TestDataBundle.IndexingData.Document(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_8Tm);
}

uint64_t sub_25A829550()
{
  uint64_t result = sub_25A82CC10();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *_s17PrivateSearchCore14TestDataBundleV12IndexingDataVwCP_0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    int v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    int v5 = a1;
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_25A82CC10();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v5;
}

void *_s17PrivateSearchCore14TestDataBundleV12IndexingDataVwcp_0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  int v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_25A82CC10();
  uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
  swift_bridgeObjectRetain();
  v8(v5, v6, v7);
  return a1;
}

void *_s17PrivateSearchCore14TestDataBundleV12IndexingDataVwca_0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25A82CC10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

void *_s17PrivateSearchCore14TestDataBundleV12IndexingDataVwtk_0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  int v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_25A82CC10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *_s17PrivateSearchCore14TestDataBundleV12IndexingDataVwta_0(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_25A82CC10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for TestDataBundle.SearchingData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_20Tm_1);
}

uint64_t storeEnumTagSinglePayload for TestDataBundle.SearchingData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_21Tm_1);
}

uint64_t sub_25A829930()
{
  uint64_t result = sub_25A82CC10();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for TestDataBundle.SearchingData.Token(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_25A82CC10();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (char *)a1 + v9;
    uint64_t v14 = (char *)a2 + v9;
    v13[4] = v14[4];
    *(_DWORD *)uint64_t v13 = *(_DWORD *)v14;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for TestDataBundle.SearchingData.Token(uint64_t a1)
{
  uint64_t v2 = sub_25A82CC10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TestDataBundle.SearchingData.Token(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A82CC10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = a1 + v8;
  uint64_t v13 = a2 + v8;
  *(unsigned char *)(v12 + 4) = *(unsigned char *)(v13 + 4);
  *(_DWORD *)uint64_t v12 = *(_DWORD *)v13;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TestDataBundle.SearchingData.Token(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A82CC10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = (int *)(a2 + v10);
  int v13 = *v12;
  *(unsigned char *)(v11 + 4) = *((unsigned char *)v12 + 4);
  *(_DWORD *)uint64_t v11 = v13;
  return a1;
}

uint64_t initializeWithTake for TestDataBundle.SearchingData.Token(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A82CC10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(unsigned char *)(v8 + 4) = *(unsigned char *)(v9 + 4);
  *(_DWORD *)uint64_t v8 = *(_DWORD *)v9;
  return a1;
}

uint64_t assignWithTake for TestDataBundle.SearchingData.Token(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A82CC10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  *(_DWORD *)uint64_t v13 = *(_DWORD *)v14;
  *(unsigned char *)(v13 + 4) = *(unsigned char *)(v14 + 4);
  return a1;
}

uint64_t getEnumTagSinglePayload for TestDataBundle.SearchingData.Token(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25A829DDC);
}

uint64_t __swift_get_extra_inhabitant_index_7Tm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_25A82CC10();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for TestDataBundle.SearchingData.Token(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25A829EC4);
}

uint64_t __swift_store_extra_inhabitant_index_8Tm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_25A82CC10();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  }
  return result;
}

uint64_t sub_25A829F88()
{
  uint64_t result = sub_25A82CC10();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

id sub_25A82A034()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08780]), sel_init);
  objc_msgSend(v0, sel_setUnitsStyle_, 1);
  id result = objc_msgSend(v0, sel_setZeroFormattingBehavior_, 14);
  qword_26A466110 = (uint64_t)v0;
  return result;
}

Swift::Int64 TimeDelta.init(millis:secs:mins:hours:days:weeks:)(Swift::Int64 millis, Swift::Int64 secs, Swift::Int64 mins, Swift::Int64 hours, Swift::Int64 days, Swift::Int64 weeks)
{
  return TimeUnit.from(millis:secs:mins:hours:days:weeks:)(millis, secs, mins, hours, days, weeks);
}

Swift::Int64 __swiftcall TimeDelta.total(_:)(PrivateSearchCore::TimeUnit a1)
{
  return v1 / qword_25A82F2A0[a1];
}

Swift::Double __swiftcall TimeDelta.toTimeInterval()()
{
  return (float)((float)v0 / 1000.0);
}

BOOL static TimeDelta.< infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 < a2;
}

BOOL static TimeDelta.<= infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a2 >= a1;
}

BOOL static TimeDelta.> infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a2 < a1;
}

BOOL static TimeDelta.>= infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 >= a2;
}

BOOL static TimeDelta.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t TimeDelta.prettyDescription.getter(uint64_t a1)
{
  if ((unint64_t)(a1 + 59999) < 0x1D4BF) {
    goto LABEL_6;
  }
  if (qword_26A465B48 != -1) {
    swift_once();
  }
  id v2 = objc_msgSend((id)qword_26A466110, sel_stringFromTimeInterval_, (double)(a1 / 1000));
  if (v2)
  {
    int v3 = v2;
    uint64_t v4 = sub_25A82CE60();
  }
  else
  {
LABEL_6:
    sub_25A82D130();
    sub_25A82CF40();
    return 0;
  }
  return v4;
}

uint64_t TimeDelta.debugDescription.getter(uint64_t a1)
{
  return 0x28748688E2;
}

Swift::Void __swiftcall TimeDelta.sleep()()
{
  uint64_t v1 = v0;
  uint64_t v2 = 1000 * v0;
  if ((unsigned __int128)(v1 * (__int128)1000) >> 64 != v2 >> 63)
  {
    __break(1u);
LABEL_8:
    sub_25A82D2F0();
    __break(1u);
    return;
  }
  if (v2 < 0 || HIDWORD(v2)) {
    goto LABEL_8;
  }
  usleep(v2);
}

uint64_t TimeDelta.toDuration()(uint64_t a1)
{
  double v2 = __exp10(12.0);
  if ((~*(void *)&v2 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 <= -9.22337204e18)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v2 >= 9.22337204e18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((unsigned __int128)(a1 % 1000 * (__int128)(uint64_t)v2) >> 64 != (a1 % 1000 * (uint64_t)v2) >> 63)
  {
LABEL_11:
    __break(1u);
    return MEMORY[0x270F9FF90]();
  }
  return MEMORY[0x270F9FF90]();
}

unint64_t sub_25A82A420()
{
  unint64_t result = qword_26A466118;
  if (!qword_26A466118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A466118);
  }
  return result;
}

BOOL sub_25A82A474(void *a1, void *a2)
{
  return *a1 < *a2;
}

BOOL sub_25A82A488(void *a1, void *a2)
{
  return *a2 >= *a1;
}

BOOL sub_25A82A49C(void *a1, void *a2)
{
  return *a1 >= *a2;
}

BOOL sub_25A82A4B0(void *a1, void *a2)
{
  return *a2 < *a1;
}

uint64_t sub_25A82A4C4()
{
  TimeDelta.prettyDescription.getter(*v0);
  sub_25A82CF40();
  swift_bridgeObjectRelease();
  sub_25A82CF40();
  return 0x28748688E2;
}

ValueMetadata *type metadata accessor for TimeDelta()
{
  return &type metadata for TimeDelta;
}

Swift::Int64 static Timestamp.- infix(_:_:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = __OFSUB__(a1, a2);
  Swift::Int64 result = a1 - a2;
  if (!v2) {
    return TimeUnit.from(millis:secs:mins:hours:days:weeks:)(result, 0, 0, 0, 0, 0);
  }
  __break(1u);
  return result;
}

uint64_t sub_25A82A568()
{
  uint64_t v0 = sub_25A82CB60();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  int v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25A82CB20();
  sub_25A82CB40();
  double v5 = v4;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  double v7 = v5 * 1000.0;
  if ((~COERCE__INT64(v5 * 1000.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v7 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v7 < 9.22337204e18)
  {
    qword_26A466120 = (uint64_t)v7;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_25A82A698()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
  uint64_t v1 = (void *)sub_25A82CE50();
  objc_msgSend(v0, sel_setDateFormat_, v1);

  qword_26A466128 = (uint64_t)v0;
}

uint64_t static Timestamp.fromCFAbsoluteTime(_:)(double a1)
{
  double v2 = a1 * 1000.0;
  if ((~*(void *)&v2 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v2 <= -9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v2 < 9.22337204e18)
  {
    uint64_t v1 = (uint64_t)v2;
    if (qword_26A465B50 == -1) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  __break(1u);
LABEL_10:
  swift_once();
LABEL_5:
  uint64_t result = v1 + qword_26A466120;
  if (__OFADD__(v1, qword_26A466120)) {
    __break(1u);
  }
  return result;
}

BOOL static Timestamp.< infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 < a2;
}

BOOL static Timestamp.<= infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a2 >= a1;
}

BOOL static Timestamp.> infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a2 < a1;
}

BOOL static Timestamp.>= infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 >= a2;
}

BOOL static Timestamp.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t static Timestamp.+ infix(_:_:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = __OFADD__(a1, a2);
  uint64_t result = a1 + a2;
  if (v2) {
    __break(1u);
  }
  return result;
}

uint64_t static Timestamp.- infix(_:_:)(uint64_t a1, uint64_t a2)
{
  BOOL v2 = __OFSUB__(a1, a2);
  uint64_t result = a1 - a2;
  if (v2) {
    __break(1u);
  }
  return result;
}

Swift::Double __swiftcall Timestamp.toCFAbsoluteTime()()
{
  uint64_t v1 = v0;
  if (qword_26A465B50 != -1) {
    swift_once();
  }
  if (!__OFSUB__(v1, qword_26A466120)) {
    return (double)(v1 - qword_26A466120) / 1000.0;
  }
  __break(1u);
  return result;
}

NSNumber __swiftcall Timestamp.toNSNumber()()
{
  uint64_t v2 = v0;
  if (qword_26A465B50 != -1) {
    uint64_t v0 = swift_once();
  }
  if (__OFSUB__(v2, qword_26A466120))
  {
    __break(1u);
  }
  else
  {
    v1.n128_f64[0] = (double)(v2 - qword_26A466120) / 1000.0;
  }
  return (NSNumber)MEMORY[0x270EF1C18](v0, v1);
}

Swift::Int64 __swiftcall Timestamp.toUnixSecs()()
{
  return v0 / 1000;
}

uint64_t Timestamp.toDate()(uint64_t result)
{
  uint64_t v1 = result;
  if (qword_26A465B50 != -1) {
    Swift::Double result = swift_once();
  }
  if (__OFSUB__(v1, qword_26A466120))
  {
    __break(1u);
  }
  else
  {
    return sub_25A82CB20();
  }
  return result;
}

uint64_t Timestamp.hourOfDay(withTimezone:)(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = a2;
  uint64_t v25 = a1;
  uint64_t v27 = sub_25A82CB90();
  uint64_t v2 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  double v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A466130);
  MEMORY[0x270FA5388](v5 - 8);
  double v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25A82CBE0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  int v23 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v23 - v12;
  uint64_t v26 = sub_25A82CBB0();
  uint64_t v14 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_25A82CB60();
  uint64_t v17 = *(void *)(v24 - 8);
  uint64_t result = MEMORY[0x270FA5388](v24);
  uint64_t v20 = (char *)&v23 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A465B50 != -1) {
    uint64_t result = swift_once();
  }
  if (__OFSUB__(v28, qword_26A466120))
  {
    __break(1u);
  }
  else
  {
    sub_25A82CB20();
    sub_25A82CB70();
    sub_25A82B8C8(v25, (uint64_t)v7);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    {
      sub_25A82B930((uint64_t)v7);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v13, v7, v8);
      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v23, v13, v8);
      sub_25A82CB80();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
    }
    uint64_t v21 = v27;
    (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F07890], v27);
    uint64_t v22 = sub_25A82CBA0();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v21);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v26);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v24);
    return v22;
  }
  return result;
}

uint64_t Timestamp.dayOfWeek(withTimezone:)(uint64_t a1, uint64_t a2)
{
  uint64_t v30 = a2;
  uint64_t v26 = a1;
  uint64_t v29 = sub_25A82CB90();
  uint64_t v2 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  double v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A466130);
  MEMORY[0x270FA5388](v5 - 8);
  double v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_25A82CBE0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v25 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v25 - v12;
  uint64_t v28 = sub_25A82CBB0();
  uint64_t v14 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_25A82CB60();
  uint64_t v17 = *(void *)(v27 - 8);
  uint64_t result = MEMORY[0x270FA5388](v27);
  uint64_t v20 = (char *)&v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A465B50 != -1) {
    uint64_t result = swift_once();
  }
  if (__OFSUB__(v30, qword_26A466120))
  {
    __break(1u);
  }
  else
  {
    sub_25A82CB20();
    sub_25A82CB70();
    sub_25A82B8C8(v26, (uint64_t)v7);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    {
      sub_25A82B930((uint64_t)v7);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v13, v7, v8);
      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v25, v13, v8);
      sub_25A82CB80();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
    }
    uint64_t v21 = v29;
    (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F078E8], v29);
    uint64_t v22 = sub_25A82CBA0();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v21);
    _s17PrivateSearchCore9TimestampV18dayOfWeekFormatterySSSiFZ_0(v22);
    uint64_t v24 = v23;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v28);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v27);
    return v24;
  }
  return result;
}

Swift::Int64 Timestamp.subtract(millis:secs:mins:hours:days:weeks:)(Swift::Int64 a1, Swift::Int64 a2, Swift::Int64 a3, Swift::Int64 a4, Swift::Int64 a5, Swift::Int64 a6, uint64_t a7)
{
  Swift::Int64 v8 = TimeUnit.from(millis:secs:mins:hours:days:weeks:)(a1, a2, a3, a4, a5, a6);
  BOOL v9 = __OFSUB__(a7, v8);
  Swift::Int64 result = a7 - v8;
  if (v9) {
    __break(1u);
  }
  return result;
}

Swift::Int64 Timestamp.add(millis:secs:mins:hours:days:weeks:)(Swift::Int64 a1, Swift::Int64 a2, Swift::Int64 a3, Swift::Int64 a4, Swift::Int64 a5, Swift::Int64 a6, uint64_t a7)
{
  Swift::Int64 v8 = TimeUnit.from(millis:secs:mins:hours:days:weeks:)(a1, a2, a3, a4, a5, a6);
  BOOL v9 = __OFADD__(a7, v8);
  Swift::Int64 result = a7 + v8;
  if (v9) {
    __break(1u);
  }
  return result;
}

unint64_t Timestamp.debugDescription.getter()
{
  return 0xD00000000000001ALL;
}

Swift::String __swiftcall Timestamp.toHumanReadable()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_25A82CB60();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A466130);
  MEMORY[0x270FA5388](v6 - 8);
  Swift::Int64 v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A465B58 != -1) {
    swift_once();
  }
  BOOL v9 = (void *)qword_26A466128;
  sub_25A82CBC0();
  uint64_t v10 = sub_25A82CBE0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
  {
    uint64_t v12 = (void *)sub_25A82CBD0();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
  }
  objc_msgSend(v9, sel_setTimeZone_, v12);

  uint64_t v15 = (void *)qword_26A466128;
  if (qword_26A465B50 != -1) {
    uint64_t v13 = swift_once();
  }
  if (__OFSUB__(v1, qword_26A466120))
  {
    __break(1u);
  }
  else
  {
    sub_25A82CB20();
    uint64_t v16 = (void *)sub_25A82CB30();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    id v17 = objc_msgSend(v15, sel_stringFromDate_, v16);

    uint64_t v18 = sub_25A82CE60();
    uint64_t v20 = v19;

    uint64_t v13 = v18;
    uint64_t v14 = v20;
  }
  result._object = v14;
  result._countAndFlagsBits = v13;
  return result;
}

Swift::Int64 Timestamp.toDateIntervalSince(days:weeks:)(Swift::Int64 a1, Swift::Int64 a2, uint64_t a3)
{
  uint64_t v6 = sub_25A82CB60();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v17 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v17 - v12;
  Swift::Int64 result = TimeUnit.from(millis:secs:mins:hours:days:weeks:)(0, 0, 0, 0, a1, a2);
  Swift::Int64 v15 = a3 - result;
  if (__OFSUB__(a3, result))
  {
    __break(1u);
  }
  else if (qword_26A465B50 == -1)
  {
    goto LABEL_3;
  }
  Swift::Int64 result = swift_once();
LABEL_3:
  uint64_t v16 = qword_26A466120;
  if (__OFSUB__(v15, qword_26A466120))
  {
    __break(1u);
  }
  else
  {
    sub_25A82CB20();
    Swift::Int64 result = (*(uint64_t (**)(char *, char *, uint64_t))(v7 + 16))(v11, v13, v6);
    if (!__OFSUB__(a3, v16))
    {
      sub_25A82CB20();
      sub_25A82CA90();
      return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v13, v6);
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_25A82B818()
{
  return Timestamp.debugDescription.getter();
}

void _s17PrivateSearchCore9TimestampV3nowACyFZ_0()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF910]), sel_init);
  objc_msgSend(v0, sel_timeIntervalSince1970);
  double v2 = v1;

  double v3 = v2 * 1000.0;
  if ((~COERCE__INT64(v2 * 1000.0) & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v3 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v3 >= 9.22337204e18) {
LABEL_7:
  }
    __break(1u);
}

uint64_t sub_25A82B8C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A466130);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25A82B930(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A466130);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void _s17PrivateSearchCore9TimestampV18dayOfWeekFormatterySSSiFZ_0(uint64_t a1)
{
  if ((unint64_t)(a1 - 8) >= 0xFFFFFFFFFFFFFFF9)
  {
    id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08790]), sel_init);
    double v3 = (void *)sub_25A82CE50();
    objc_msgSend(v2, sel_setDateFormat_, v3);

    id v4 = objc_msgSend(v2, sel_weekdaySymbols);
    if (v4)
    {
      uint64_t v5 = v4;
      unint64_t v6 = a1 - 1;
      uint64_t v7 = sub_25A82CFE0();

      if (v6 < *(void *)(v7 + 16))
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        sub_25A82CED0();
        swift_bridgeObjectRelease();

        return;
      }
      __break(1u);
    }
    __break(1u);
  }
}

unint64_t sub_25A82BABC()
{
  unint64_t result = qword_26A466138;
  if (!qword_26A466138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A466138);
  }
  return result;
}

ValueMetadata *type metadata accessor for Timestamp()
{
  return &type metadata for Timestamp;
}

Swift::Int64 __swiftcall TimeUnit.toMillis(_:)(Swift::Int64 a1)
{
  uint64_t v3 = qword_25A82F440[v1];
  Swift::Int64 result = a1 * v3;
  if ((unsigned __int128)(a1 * (__int128)v3) >> 64 != result >> 63) {
    __break(1u);
  }
  return result;
}

Swift::Int64 __swiftcall TimeUnit.from(millis:secs:mins:hours:days:weeks:)(Swift::Int64 millis, Swift::Int64 secs, Swift::Int64 mins, Swift::Int64 hours, Swift::Int64 days, Swift::Int64 weeks)
{
  if ((unsigned __int128)(secs * (__int128)1000) >> 64 != (1000 * secs) >> 63)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v7 = qword_25A82F440[v6];
  Swift::Int64 v8 = 1000 * secs / v7;
  BOOL v9 = __OFADD__(millis / v7, v8);
  Swift::Int64 v10 = millis / v7 + v8;
  if (v9)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if ((unsigned __int128)(mins * (__int128)60000) >> 64 != (60000 * mins) >> 63)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  Swift::Int64 v11 = 60000 * mins / v7;
  BOOL v9 = __OFADD__(v10, v11);
  Swift::Int64 v12 = v10 + v11;
  if (v9)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if ((unsigned __int128)(hours * (__int128)3600000) >> 64 != (3600000 * hours) >> 63)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  Swift::Int64 v13 = 3600000 * hours / v7;
  BOOL v9 = __OFADD__(v12, v13);
  Swift::Int64 v14 = v12 + v13;
  if (v9)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if ((unsigned __int128)(days * (__int128)86400000) >> 64 != (86400000 * days) >> 63)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  Swift::Int64 v15 = 86400000 * days / v7;
  BOOL v9 = __OFADD__(v14, v15);
  Swift::Int64 v16 = v14 + v15;
  if (v9)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if ((unsigned __int128)(weeks * (__int128)604800000) >> 64 != (604800000 * weeks) >> 63)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  Swift::Int64 v17 = 604800000 * weeks / v7;
  millis = v16 + v17;
  if (__OFADD__(v16, v17)) {
LABEL_21:
  }
    __break(1u);
  return millis;
}

uint64_t static TimeUnit.convert(from:in:to:)(uint64_t result, char a2, char a3)
{
  uint64_t v3 = qword_25A82F440[a2];
  if ((unsigned __int128)(result * (__int128)v3) >> 64 == (result * v3) >> 63) {
    return result * v3 / qword_25A82F440[a3];
  }
  __break(1u);
  return result;
}

Swift::Int64 __swiftcall TimeUnit.toSecs(_:)(Swift::Int64 result)
{
  uint64_t v2 = qword_25A82F440[v1];
  if ((unsigned __int128)(result * (__int128)v2) >> 64 == (result * v2) >> 63) {
    return result * v2 / 1000;
  }
  __break(1u);
  return result;
}

BOOL static TimeUnit.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t TimeUnit.hash(into:)()
{
  return sub_25A82D420();
}

void *static TimeUnit.allCases.getter()
{
  return &unk_27085D5B8;
}

uint64_t TimeUnit.hashValue.getter()
{
  return sub_25A82D430();
}

BOOL sub_25A82BD3C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25A82BD50()
{
  return sub_25A82D430();
}

uint64_t sub_25A82BD98()
{
  return sub_25A82D420();
}

uint64_t sub_25A82BDC4()
{
  return sub_25A82D430();
}

void sub_25A82BE08(void *a1@<X8>)
{
  *a1 = &unk_27085D5B8;
}

Swift::Int64 __swiftcall TimeUnit.toMinutes(_:)(Swift::Int64 result)
{
  uint64_t v2 = qword_25A82F440[v1];
  if ((unsigned __int128)(result * (__int128)v2) >> 64 == (result * v2) >> 63) {
    return result * v2 / 60000;
  }
  __break(1u);
  return result;
}

Swift::Int64 __swiftcall TimeUnit.toHours(_:)(Swift::Int64 result)
{
  uint64_t v2 = qword_25A82F440[v1];
  if ((unsigned __int128)(result * (__int128)v2) >> 64 == (result * v2) >> 63) {
    return result * v2 / 3600000;
  }
  __break(1u);
  return result;
}

Swift::Int64 __swiftcall TimeUnit.toDays(_:)(Swift::Int64 result)
{
  uint64_t v2 = qword_25A82F440[v1];
  if ((unsigned __int128)(result * (__int128)v2) >> 64 == (result * v2) >> 63) {
    return result * v2 / 86400000;
  }
  __break(1u);
  return result;
}

Swift::Int64 __swiftcall TimeUnit.toWeeks(_:)(Swift::Int64 result)
{
  uint64_t v2 = qword_25A82F440[v1];
  if ((unsigned __int128)(result * (__int128)v2) >> 64 == (result * v2) >> 63) {
    return result * v2 / 604800000;
  }
  __break(1u);
  return result;
}

unint64_t sub_25A82BF2C()
{
  unint64_t result = qword_26A466140;
  if (!qword_26A466140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A466140);
  }
  return result;
}

unint64_t sub_25A82BF84()
{
  unint64_t result = qword_26A466148;
  if (!qword_26A466148)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A466150);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A466148);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TimeUnit(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for TimeUnit(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x25A82C148);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

uint64_t sub_25A82C170(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25A82C178(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TimeUnit()
{
  return &type metadata for TimeUnit;
}

uint64_t Array<A>.parseUInt32BigEndian()()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = sub_25A82C7A8(v0);
  unint64_t v3 = v2;
  swift_bridgeObjectRelease();
  unsigned int v4 = 0;
  switch(v3 >> 62)
  {
    case 1uLL:
      if ((int)v1 > v1 >> 32)
      {
        __break(1u);
LABEL_12:
        __break(1u);
        goto LABEL_13;
      }
      uint64_t v5 = sub_25A82CAB0();
      if (!v5)
      {
LABEL_14:
        sub_25A82CAC0();
        __break(1u);
LABEL_15:
        sub_25A82CAC0();
        __break(1u);
        JUMPOUT(0x25A82C2B0);
      }
      uint64_t v6 = v5;
      uint64_t v7 = sub_25A82CAD0();
      uint64_t v8 = (int)v1 - v7;
      if (__OFSUB__((int)v1, v7))
      {
LABEL_13:
        __break(1u);
        goto LABEL_14;
      }
      sub_25A82CAC0();
      unsigned int v4 = *(_DWORD *)(v6 + v8);
LABEL_10:
      sub_25A810A44(v1, v3);
      return bswap32(v4);
    case 2uLL:
      uint64_t v9 = *(void *)(v1 + 16);
      swift_retain();
      swift_retain();
      uint64_t v10 = sub_25A82CAB0();
      if (!v10) {
        goto LABEL_15;
      }
      uint64_t v11 = v10;
      uint64_t v12 = sub_25A82CAD0();
      BOOL v13 = __OFSUB__(v9, v12);
      uint64_t v14 = v9 - v12;
      if (v13) {
        goto LABEL_12;
      }
      sub_25A82CAC0();
      unsigned int v4 = *(_DWORD *)(v11 + v14);
      swift_release();
      swift_release();
      goto LABEL_10;
    case 3uLL:
      goto LABEL_10;
    default:
      unsigned int v4 = v1;
      goto LABEL_10;
  }
}

unint64_t Array<A>.parseUInt64BigEndian()()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = sub_25A82C7A8(v0);
  unint64_t v3 = v2;
  swift_bridgeObjectRelease();
  unint64_t v4 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      if ((int)v1 > v1 >> 32)
      {
        __break(1u);
LABEL_12:
        __break(1u);
        goto LABEL_13;
      }
      uint64_t v5 = sub_25A82CAB0();
      if (!v5)
      {
LABEL_14:
        sub_25A82CAC0();
        __break(1u);
LABEL_15:
        sub_25A82CAC0();
        __break(1u);
        JUMPOUT(0x25A82C3E4);
      }
      uint64_t v6 = v5;
      uint64_t v7 = sub_25A82CAD0();
      uint64_t v8 = (int)v1 - v7;
      if (__OFSUB__((int)v1, v7))
      {
LABEL_13:
        __break(1u);
        goto LABEL_14;
      }
      sub_25A82CAC0();
      unint64_t v4 = *(void *)(v6 + v8);
LABEL_10:
      sub_25A810A44(v1, v3);
      return bswap64(v4);
    case 2uLL:
      uint64_t v9 = *(void *)(v1 + 16);
      swift_retain();
      swift_retain();
      uint64_t v10 = sub_25A82CAB0();
      if (!v10) {
        goto LABEL_15;
      }
      uint64_t v11 = v10;
      uint64_t v12 = sub_25A82CAD0();
      BOOL v13 = __OFSUB__(v9, v12);
      uint64_t v14 = v9 - v12;
      if (v13) {
        goto LABEL_12;
      }
      sub_25A82CAC0();
      unint64_t v4 = *(void *)(v11 + v14);
      swift_release();
      swift_release();
      goto LABEL_10;
    case 3uLL:
      unint64_t v4 = 0;
      goto LABEL_10;
    default:
      goto LABEL_10;
  }
}

uint64_t Array<A>.parseUInt32LittleEndian()()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = sub_25A82C7A8(v0);
  unint64_t v3 = v2;
  swift_bridgeObjectRelease();
  uint64_t v4 = 0;
  switch(v3 >> 62)
  {
    case 1uLL:
      if ((int)v1 > v1 >> 32)
      {
        __break(1u);
LABEL_12:
        __break(1u);
        goto LABEL_13;
      }
      uint64_t v5 = sub_25A82CAB0();
      if (!v5)
      {
LABEL_14:
        sub_25A82CAC0();
        __break(1u);
LABEL_15:
        sub_25A82CAC0();
        __break(1u);
        JUMPOUT(0x25A82C514);
      }
      uint64_t v6 = v5;
      uint64_t v7 = sub_25A82CAD0();
      uint64_t v8 = (int)v1 - v7;
      if (__OFSUB__((int)v1, v7))
      {
LABEL_13:
        __break(1u);
        goto LABEL_14;
      }
      sub_25A82CAC0();
      uint64_t v4 = *(unsigned int *)(v6 + v8);
LABEL_10:
      sub_25A810A44(v1, v3);
      return v4;
    case 2uLL:
      uint64_t v9 = *(void *)(v1 + 16);
      swift_retain();
      swift_retain();
      uint64_t v10 = sub_25A82CAB0();
      if (!v10) {
        goto LABEL_15;
      }
      uint64_t v11 = v10;
      uint64_t v12 = sub_25A82CAD0();
      BOOL v13 = __OFSUB__(v9, v12);
      uint64_t v14 = v9 - v12;
      if (v13) {
        goto LABEL_12;
      }
      sub_25A82CAC0();
      uint64_t v4 = *(unsigned int *)(v11 + v14);
      swift_release();
      swift_release();
      goto LABEL_10;
    case 3uLL:
      goto LABEL_10;
    default:
      uint64_t v4 = v1;
      goto LABEL_10;
  }
}

uint64_t Array<A>.toData()()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = sub_25A82C7A8(v0);
  swift_bridgeObjectRelease();
  return v1;
}

unsigned char *sub_25A82C56C@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    unint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    unint64_t result = (unsigned char *)sub_25A82C5E4(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    unint64_t result = (unsigned char *)sub_25A82C6A8((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    unint64_t result = (unsigned char *)sub_25A82C724((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_25A82C5E4(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
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

uint64_t sub_25A82C6A8(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_25A82CAE0();
  swift_allocObject();
  uint64_t result = sub_25A82CAA0();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_25A82CB00();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_25A82C724(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_25A82CAE0();
  swift_allocObject();
  uint64_t result = sub_25A82CAA0();
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

uint64_t sub_25A82C7A8(uint64_t a1)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A466158);
  unint64_t v10 = sub_25A82C844();
  v8[0] = a1;
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v8, v9);
  unint64_t v3 = (unsigned char *)(*v2 + 32);
  uint64_t v4 = &v3[*(void *)(*v2 + 16)];
  swift_bridgeObjectRetain();
  sub_25A82C56C(v3, v4, &v7);
  uint64_t v5 = v7;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v5;
}

unint64_t sub_25A82C844()
{
  unint64_t result = qword_26A466160;
  if (!qword_26A466160)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A466158);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A466160);
  }
  return result;
}

uint64_t sub_25A82C8A4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 3u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for ValidationError(uint64_t a1)
{
  return sub_25A82C8CC(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_25A82C8CC(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 3u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s17PrivateSearchCore15ValidationErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_25A82C8A4(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ValidationError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_25A82C8A4(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_25A82C8CC(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ValidationError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_25A82C8CC(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ValidationError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ValidationError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25A82CA70(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_25A82CA78(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ValidationError()
{
  return &type metadata for ValidationError;
}

uint64_t sub_25A82CA90()
{
  return MEMORY[0x270EEE2F8]();
}

uint64_t sub_25A82CAA0()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_25A82CAB0()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_25A82CAC0()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_25A82CAD0()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_25A82CAE0()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_25A82CAF0()
{
  return MEMORY[0x270EF0048]();
}

uint64_t sub_25A82CB00()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_25A82CB10()
{
  return MEMORY[0x270EF0238]();
}

uint64_t sub_25A82CB20()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_25A82CB30()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_25A82CB40()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_25A82CB50()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_25A82CB60()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_25A82CB70()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_25A82CB80()
{
  return MEMORY[0x270EF1410]();
}

uint64_t sub_25A82CB90()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_25A82CBA0()
{
  return MEMORY[0x270EF1430]();
}

uint64_t sub_25A82CBB0()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_25A82CBC0()
{
  return MEMORY[0x270EF1590]();
}

uint64_t sub_25A82CBD0()
{
  return MEMORY[0x270EF15C8]();
}

uint64_t sub_25A82CBE0()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_25A82CBF0()
{
  return MEMORY[0x270F44A18]();
}

uint64_t _s17PrivateSearchCore15BenchmarkConfigV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0()
{
  return MEMORY[0x270F44A20]();
}

uint64_t sub_25A82CC10()
{
  return MEMORY[0x270F44A28]();
}

uint64_t sub_25A82CC20()
{
  return MEMORY[0x270F44AD8]();
}

uint64_t sub_25A82CC50()
{
  return MEMORY[0x270F44B10]();
}

uint64_t sub_25A82CC60()
{
  return MEMORY[0x270F44B98]();
}

uint64_t sub_25A82CC70()
{
  return MEMORY[0x270F44BA8]();
}

uint64_t sub_25A82CC80()
{
  return MEMORY[0x270F44BC0]();
}

uint64_t sub_25A82CC90()
{
  return MEMORY[0x270F44BD8]();
}

uint64_t sub_25A82CCA0()
{
  return MEMORY[0x270F44BF0]();
}

uint64_t sub_25A82CCB0()
{
  return MEMORY[0x270F44C20]();
}

uint64_t sub_25A82CCC0()
{
  return MEMORY[0x270F44C38]();
}

uint64_t sub_25A82CCD0()
{
  return MEMORY[0x270F44C98]();
}

uint64_t sub_25A82CCF0()
{
  return MEMORY[0x270F44CD8]();
}

uint64_t sub_25A82CD00()
{
  return MEMORY[0x270F44D98]();
}

uint64_t sub_25A82CD10()
{
  return MEMORY[0x270F44DA0]();
}

uint64_t sub_25A82CD20()
{
  return MEMORY[0x270F44DB0]();
}

uint64_t sub_25A82CD30()
{
  return MEMORY[0x270F44DC8]();
}

uint64_t sub_25A82CD40()
{
  return MEMORY[0x270F44DD8]();
}

uint64_t sub_25A82CD50()
{
  return MEMORY[0x270F44DF0]();
}

uint64_t sub_25A82CD60()
{
  return MEMORY[0x270F44E00]();
}

uint64_t sub_25A82CD70()
{
  return MEMORY[0x270F44E10]();
}

uint64_t sub_25A82CD80()
{
  return MEMORY[0x270F44E18]();
}

uint64_t sub_25A82CD90()
{
  return MEMORY[0x270F44E28]();
}

uint64_t sub_25A82CDA0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25A82CDB0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25A82CDC0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25A82CDD0()
{
  return MEMORY[0x270FA0998]();
}

uint64_t sub_25A82CDE0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25A82CDF0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25A82CE00()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25A82CE10()
{
  return MEMORY[0x270F9D088]();
}

uint64_t sub_25A82CE20()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_25A82CE30()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_25A82CE40()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25A82CE50()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25A82CE60()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25A82CE70()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_25A82CE80()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_25A82CE90()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_25A82CEA0()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_25A82CEB0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25A82CEC0()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_25A82CED0()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_25A82CEE0()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_25A82CEF0()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_25A82CF00()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25A82CF10()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_25A82CF20()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_25A82CF30()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_25A82CF40()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25A82CF50()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_25A82CF60()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25A82CF70()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_25A82CF80()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_25A82CF90()
{
  return MEMORY[0x270F9D808]();
}

uint64_t sub_25A82CFA0()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_25A82CFB0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_25A82CFC0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_25A82CFD0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_25A82CFE0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_25A82CFF0()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_25A82D000()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25A82D010()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_25A82D020()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_25A82D030()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_25A82D050()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_25A82D060()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_25A82D070()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_25A82D080()
{
  return MEMORY[0x270FA20B8]();
}

uint64_t sub_25A82D090()
{
  return MEMORY[0x270FA20C8]();
}

uint64_t sub_25A82D0A0()
{
  return MEMORY[0x270FA20D8]();
}

uint64_t sub_25A82D0B0()
{
  return MEMORY[0x270FA20E0]();
}

uint64_t sub_25A82D0C0()
{
  return MEMORY[0x270FA20E8]();
}

uint64_t sub_25A82D0D0()
{
  return MEMORY[0x270FA20F0]();
}

uint64_t sub_25A82D0F0()
{
  return MEMORY[0x270FA2108]();
}

uint64_t sub_25A82D100()
{
  return MEMORY[0x270FA2118]();
}

uint64_t sub_25A82D110()
{
  return MEMORY[0x270FA2120]();
}

uint64_t sub_25A82D130()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_25A82D140()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_25A82D150()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_25A82D160()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_25A82D170()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25A82D180()
{
  return MEMORY[0x270FA0C38]();
}

uint64_t sub_25A82D190()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_25A82D1A0()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_25A82D1B0()
{
  return MEMORY[0x270FA0D78]();
}

uint64_t sub_25A82D1C0()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_25A82D1D0()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_25A82D1E0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25A82D1F0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25A82D200()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25A82D210()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_25A82D220()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_25A82D230()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_25A82D240()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_25A82D250()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25A82D260()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25A82D270()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25A82D280()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25A82D290()
{
  return MEMORY[0x270FA2210]();
}

uint64_t sub_25A82D2A0()
{
  return MEMORY[0x270FA2218]();
}

uint64_t sub_25A82D2B0()
{
  return MEMORY[0x270FA2220]();
}

uint64_t sub_25A82D2C0()
{
  return MEMORY[0x270FA2228]();
}

uint64_t sub_25A82D2D0()
{
  return MEMORY[0x270FA2230]();
}

uint64_t sub_25A82D2E0()
{
  return MEMORY[0x270FA2240]();
}

uint64_t sub_25A82D2F0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25A82D300()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25A82D310()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25A82D320()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25A82D330()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25A82D340()
{
  return MEMORY[0x270FA2270]();
}

uint64_t sub_25A82D350()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25A82D360()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_25A82D370()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25A82D380()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_25A82D390()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_25A82D3A0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25A82D3B0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25A82D3C0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25A82D3D0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25A82D3E0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25A82D3F0()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_25A82D400()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_25A82D410()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25A82D420()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25A82D430()
{
  return MEMORY[0x270F9FC90]();
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x270ED78A0](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, dataIn, dataInLength);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AF0](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B30](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B38](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B40](c, data, *(void *)&len);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

double __exp10(double a1)
{
  MEMORY[0x270ED7DC8](a1);
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

long double log2(long double __x)
{
  MEMORY[0x270EDA0D8](__x);
  return result;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}