Compression::Algorithm_optional __swiftcall Algorithm.init(rawValue:)(compression_algorithm rawValue)
{
  unsigned char *v1;

  if ((int)rawValue > 1793)
  {
    switch(rawValue)
    {
      case COMPRESSION_LZBITMAP:
        *v1 = 4;
        return (Compression::Algorithm_optional)rawValue;
      case COMPRESSION_LZFSE:
        *v1 = 0;
        return (Compression::Algorithm_optional)rawValue;
      case COMPRESSION_BROTLI:
        *v1 = 5;
        return (Compression::Algorithm_optional)rawValue;
    }
LABEL_14:
    *v1 = 6;
    return (Compression::Algorithm_optional)rawValue;
  }
  if (rawValue == COMPRESSION_LZ4)
  {
    *v1 = 2;
    return (Compression::Algorithm_optional)rawValue;
  }
  if (rawValue == COMPRESSION_ZLIB)
  {
    *v1 = 1;
    return (Compression::Algorithm_optional)rawValue;
  }
  if (rawValue != COMPRESSION_LZMA) {
    goto LABEL_14;
  }
  *v1 = 3;
  return (Compression::Algorithm_optional)rawValue;
}

uint64_t Algorithm.rawValue.getter()
{
  return dword_2137021A0[*v0];
}

void Algorithm.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

void *static Algorithm.allCases.getter()
{
  return &outlined read-only object #0 of static Algorithm.allCases.getter;
}

Swift::Int Algorithm.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance Algorithm(char *a1, char *a2)
{
  return dword_2137021A0[*a1] == dword_2137021A0[*a2];
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Algorithm()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance Algorithm()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Algorithm()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for static CaseIterable.allCases.getter in conformance Algorithm(void *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of static Algorithm.allCases.getter;
}

Compression::Algorithm_optional protocol witness for RawRepresentable.init(rawValue:) in conformance Algorithm(compression_algorithm *a1)
{
  return Algorithm.init(rawValue:)(*a1);
}

void protocol witness for RawRepresentable.rawValue.getter in conformance Algorithm(_DWORD *a1@<X8>)
{
  *a1 = dword_2137021A0[*v1];
}

Compression::FilterOperation_optional __swiftcall FilterOperation.init(rawValue:)(compression_stream_operation rawValue)
{
  if (rawValue == COMPRESSION_STREAM_DECODE) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (rawValue == COMPRESSION_STREAM_ENCODE) {
    char v2 = 0;
  }
  *Swift::UInt v1 = v2;
  return (Compression::FilterOperation_optional)rawValue;
}

uint64_t FilterOperation.rawValue.getter()
{
  return *v0;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance FilterOperation(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

_DWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance FilterOperation@<X0>(_DWORD *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance FilterOperation(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

BOOL static FilterError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void FilterError.hash(into:)()
{
  Hasher._combine(_:)(*v0);
}

uint64_t protocol witness for Error._domain.getter in conformance FilterError()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t protocol witness for Error._code.getter in conformance FilterError()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t protocol witness for Error._userInfo.getter in conformance FilterError()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance FilterError()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t OutputFilter.__allocating_init(_:using:bufferCapacity:writingTo:)(unsigned __int8 *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = swift_allocObject();
  OutputFilter.init(_:using:bufferCapacity:writingTo:)(a1, a2, a3, a4, a5);
  return v10;
}

uint64_t OutputFilter.init(_:using:bufferCapacity:writingTo:)(unsigned __int8 *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned __int8 v10 = *a1;
  char v11 = *a2;
  *(unsigned char *)(v5 + 88) = 0;
  unsigned __int8 v15 = v10;
  char v14 = v11;
  specialized compression_stream.init(operation:algorithm:)(&v15, &v14, (uint64_t)v16);
  if (v6)
  {
    swift_release();
    type metadata accessor for OutputFilter();
    swift_deallocPartialClassInstance();
  }
  else
  {
    long long v12 = v16[1];
    *(_OWORD *)(v5 + 16) = v16[0];
    *(_OWORD *)(v5 + 32) = v12;
    *(void *)(v5 + 48) = v17;
    *(void *)(v5 + 56) = swift_slowAlloc();
    *(void *)(v5 + 64) = a3;
    *(void *)(v5 + 72) = a4;
    *(void *)(v5 + 80) = a5;
  }
  return v5;
}

void OutputFilter.write<A>(_:)(uint64_t (*a1)(char *, uint64_t, uint64_t), unsigned int (*a2)(void, void, void), unsigned int (*a3)(char *, uint64_t, void))
{
  swift_getAssociatedTypeWitness();
  v60 = a3;
  uint64_t v6 = *(void *)(*(void *)(swift_getAssociatedConformanceWitness() + 8) + 8);
  uint64_t v52 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v46 = (char *)&v44 - v7;
  uint64_t v53 = v8;
  type metadata accessor for Optional();
  ((void (*)(void))MEMORY[0x270FA5388])();
  v51 = (char *)&v44 - v9;
  swift_checkMetadataState();
  ((void (*)(void))MEMORY[0x270FA5388])();
  v47 = (char *)&v44 - v10;
  uint64_t v48 = v11;
  uint64_t v49 = v6;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v50 = *(void *)(AssociatedTypeWitness - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v58 = (char *)&v44 - v12;
  uint64_t v13 = type metadata accessor for Optional();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v54 = (char *)&v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v19 = (char *)&v44 - v18;
  MEMORY[0x270FA5388](v17);
  v21 = (char *)&v44 - v20;
  v22 = a2;
  uint64_t v56 = *((void *)a2 - 1);
  v23 = *(uint64_t (**)(void, void))(v56 + 48);
  v61 = v22;
  LODWORD(v6) = v23(a1, 1);
  v24 = a1;
  uint64_t v25 = v13;
  v26 = *(void (**)(char *))(v14 + 16);
  v55 = v24;
  v26(v21);
  if (v6 == 1)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v21, v25);
LABEL_5:
    OutputFilter.finalize()();
    return;
  }
  v45 = v26;
  ((void (*)(char *, char *, uint64_t))v26)(v19, v21, v25);
  v27 = v61;
  int v28 = ((uint64_t (*)(char *, uint64_t, void))v23)(v19, 1, v61);
  v44 = (unsigned int (*)(char *, uint64_t, void))v23;
  if (v28 == 1)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    return;
  }
  char v29 = dispatch thunk of Collection.isEmpty.getter();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v21, v25);
  v30 = *(void (**)(void, void))(v56 + 8);
  v30(v19, v27);
  if (v29) {
    goto LABEL_5;
  }
  if (*(unsigned char *)(v62 + 88) == 1)
  {
    lazy protocol witness table accessor for type FilterError and conformance FilterError();
    swift_allocError();
    unsigned char *v31 = 1;
    swift_willThrow();
    return;
  }
  v32 = v54;
  ((void (*)(char *, uint64_t (*)(char *, uint64_t, uint64_t), uint64_t))v45)(v54, v55, v25);
  v33 = v61;
  if (v44(v32, 1, v61) == 1) {
    goto LABEL_16;
  }
  dispatch thunk of DataProtocol.regions.getter();
  v30(v32, v33);
  dispatch thunk of Sequence.makeIterator()();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v35 = v51;
  uint64_t v56 = AssociatedConformanceWitness;
  dispatch thunk of IteratorProtocol.next()();
  uint64_t v36 = v52;
  uint64_t v37 = v53;
  v55 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v52 + 48);
  int v38 = v55(v35, 1, v53);
  uint64_t v39 = v57;
  if (v38 == 1)
  {
LABEL_13:
    (*(void (**)(char *, uint64_t))(v50 + 8))(v58, AssociatedTypeWitness);
  }
  else
  {
    v54 = *(char **)(v36 + 32);
    v40 = (void (**)(char *, uint64_t))(v36 + 8);
    uint64_t v52 = MEMORY[0x263F8EE60] + 8;
    v41 = v46;
    while (1)
    {
      uint64_t v42 = ((uint64_t (*)(char *, char *, uint64_t))v54)(v41, v35, v37);
      MEMORY[0x270FA5388](v42);
      v43 = v60;
      *(&v44 - 4) = (unsigned int (*)(char *, uint64_t, void))v61;
      *(&v44 - 3) = v43;
      *(&v44 - 2) = (unsigned int (*)(char *, uint64_t, void))v62;
      *(&v44 - 1) = (unsigned int (*)(char *, uint64_t, void))v41;
      swift_getAssociatedConformanceWitness();
      dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
      if (v39) {
        break;
      }
      (*v40)(v41, v37);
      dispatch thunk of IteratorProtocol.next()();
      if (v55(v35, 1, v37) == 1) {
        goto LABEL_13;
      }
    }
    (*(void (**)(char *, uint64_t))(v50 + 8))(v58, AssociatedTypeWitness);
    (*v40)(v41, v37);
  }
}

uint64_t closure #1 in OutputFilter.write<A>(_:)(uint64_t a1, uint64_t a2, void (**a3)(char *, void, uint64_t))
{
  v24 = a3;
  uint64_t v25 = a1;
  uint64_t v26 = type metadata accessor for Data.Deallocator();
  uint64_t v5 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t v8 = dispatch thunk of Collection.count.getter();
  uint64_t result = swift_beginAccess();
  uint64_t v10 = v25;
  *(void *)(a2 + 40) = v8;
  if (!v10)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  *(void *)(a2 + 32) = v10;
  if (v8 >= 1)
  {
    LODWORD(v25) = *MEMORY[0x263F06F00];
    v23 = (void (**)(char *, uint64_t))(v5 + 8);
    v24 = (void (**)(char *, void, uint64_t))(v5 + 104);
    uint64_t v11 = v26;
    while (1)
    {
      uint64_t v12 = *(void *)(a2 + 56);
      swift_beginAccess();
      uint64_t v13 = *(void *)(a2 + 64);
      *(void *)(a2 + 16) = v12;
      *(void *)(a2 + 24) = v13;
      LODWORD(v12) = compression_stream_process((compression_stream *)(a2 + 16), 0);
      uint64_t result = swift_endAccess();
      if (v12 == -1)
      {
        lazy protocol witness table accessor for type FilterError and conformance FilterError();
        swift_allocError();
        unsigned char *v21 = 1;
        return swift_willThrow();
      }
      uint64_t v14 = *(void *)(a2 + 24);
      uint64_t v15 = v13 - v14;
      if (__OFSUB__(v13, v14)) {
        break;
      }
      if (v15 > 0)
      {
        (*v24)(v7, v25, v11);
        Data.Deallocator._deallocator.getter();
        type metadata accessor for __DataStorage();
        swift_allocObject();
        swift_retain();
        uint64_t v16 = __DataStorage.init(bytes:length:copy:deallocator:offset:)();
        uint64_t v17 = specialized Data._Representation.init(_:count:)(v16, v15);
        unint64_t v19 = v18;
        swift_release();
        (*v23)(v7, v11);
        uint64_t v20 = *(void (**)(uint64_t, unint64_t))(a2 + 72);
        outlined copy of Data._Representation(v17, v19);
        v20(v17, v19);
        outlined consume of Data._Representation(v17, v19);
        uint64_t result = outlined consume of Data._Representation(v17, v19);
        if (v3) {
          return result;
        }
      }
      if (*(uint64_t *)(a2 + 40) <= 0) {
        return result;
      }
    }
    __break(1u);
    goto LABEL_13;
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> OutputFilter.finalize()()
{
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  uint64_t v26 = type metadata accessor for Data.Deallocator();
  uint64_t v4 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v25 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned char *)(v3 + 88) & 1) == 0)
  {
    v27 = (compression_stream *)(v3 + 16);
    swift_beginAccess();
    *(void *)(v3 + 40) = 0;
    uint64_t v6 = *(void *)(v3 + 64);
    unsigned int v24 = *MEMORY[0x263F06F00];
    uint64_t v22 = (void (**)(char *, uint64_t))(v4 + 8);
    v23 = (void (**)(char *, void, uint64_t))(v4 + 104);
    uint64_t v7 = v26;
    while (1)
    {
      uint64_t v8 = *(void *)(v3 + 56);
      uint64_t v9 = v27;
      swift_beginAccess();
      *(void *)(v3 + 16) = v8;
      *(void *)(v3 + 24) = v6;
      compression_status v10 = compression_stream_process(v9, 1);
      swift_endAccess();
      if (v10 == COMPRESSION_STATUS_ERROR)
      {
        lazy protocol witness table accessor for type FilterError and conformance FilterError();
        swift_allocError();
        unsigned char *v21 = 1;
        swift_willThrow();
        return;
      }
      uint64_t v11 = *(void *)(v3 + 24);
      uint64_t v12 = v6 - v11;
      if (__OFSUB__(v6, v11)) {
        break;
      }
      if (v12 >= 1)
      {
        uint64_t v13 = *v23;
        uint64_t v28 = v2;
        uint64_t v14 = v25;
        v13(v25, v24, v7);
        Data.Deallocator._deallocator.getter();
        type metadata accessor for __DataStorage();
        swift_allocObject();
        swift_retain();
        uint64_t v15 = __DataStorage.init(bytes:length:copy:deallocator:offset:)();
        uint64_t v16 = specialized Data._Representation.init(_:count:)(v15, v12);
        unint64_t v18 = v17;
        swift_release();
        (*v22)(v14, v7);
        unint64_t v19 = *(void (**)(uint64_t, unint64_t))(v3 + 72);
        outlined copy of Data._Representation(v16, v18);
        uint64_t v20 = v28;
        v19(v16, v18);
        uint64_t v2 = v20;
        outlined consume of Data._Representation(v16, v18);
        outlined consume of Data._Representation(v16, v18);
        if (v20) {
          return;
        }
      }
      if (v10 == COMPRESSION_STATUS_END)
      {
        *(unsigned char *)(v3 + 88) = 1;
        (*(void (**)(void, unint64_t))(v3 + 72))(0, 0xF000000000000000);
        return;
      }
    }
    __break(1u);
  }
}

uint64_t OutputFilter.deinit()
{
  OutputFilter.finalize()();
  if (v1) {
    MEMORY[0x21668FED0](v1);
  }
  MEMORY[0x21668FF90](*(void *)(v0 + 56), -1, -1);
  swift_beginAccess();
  compression_stream_destroy((compression_stream *)(v0 + 16));
  swift_endAccess();
  swift_release();
  return v0;
}

uint64_t OutputFilter.__deallocating_deinit()
{
  OutputFilter.finalize()();
  if (v1) {
    MEMORY[0x21668FED0](v1);
  }
  MEMORY[0x21668FF90](*(void *)(v0 + 56), -1, -1);
  swift_beginAccess();
  compression_stream_destroy((compression_stream *)(v0 + 16));
  swift_endAccess();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t InputFilter.InputFilterBuffer.remaining()()
{
  return *(void *)(v0 + *(void *)(*(void *)v0 + 120));
}

uint64_t InputFilter.InputFilterBuffer.withUnsafeBytes<A>(_:)@<X0>(uint64_t (*a1)(void, void)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v41 = a3;
  uint64_t v5 = v4;
  uint64_t v39 = a2;
  v40 = a1;
  uint64_t v43 = a4;
  v34 = *(void **)v4;
  uint64_t v6 = v34;
  uint64_t v7 = v34[13];
  uint64_t v8 = v34[11];
  swift_getAssociatedTypeWitness();
  uint64_t v45 = v7;
  uint64_t v9 = *(void *)(swift_getAssociatedConformanceWitness() + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v37 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v38 = AssociatedTypeWitness;
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v12 = (char *)&v33 - v11;
  uint64_t v13 = swift_checkMetadataState();
  uint64_t v35 = *(void *)(v13 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v33 - v15;
  uint64_t v17 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v14);
  unint64_t v19 = (char *)&v33 - v18;
  uint64_t v36 = v9;
  uint64_t v20 = swift_getAssociatedTypeWitness();
  uint64_t v44 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  v47 = (char *)&v33 - v21;
  if (*(void *)&v5[v6[15]])
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v19, &v5[v34[14]], v8);
    dispatch thunk of DataProtocol.regions.getter();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v8);
    uint64_t v22 = &v5[*(void *)(*(void *)v5 + 128)];
    swift_beginAccess();
    uint64_t v23 = v37;
    uint64_t v24 = v38;
    (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v12, v22, v38);
    uint64_t v25 = (void (*)(char *, void))dispatch thunk of Collection.subscript.read();
    (*(void (**)(char *))(v44 + 16))(v47);
    v25(v46, 0);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v24);
    uint64_t v26 = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v16, v13);
    MEMORY[0x270FA5388](v26);
    v27 = v40;
    *(&v33 - 4) = v41;
    *(&v33 - 3) = (uint64_t)v5;
    uint64_t v28 = v39;
    *(&v33 - 2) = (uint64_t)v27;
    *(&v33 - 1) = v28;
    swift_getAssociatedConformanceWitness();
    type metadata accessor for Optional();
    dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
    return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v47, v20);
  }
  else
  {
    uint64_t v31 = v41;
    uint64_t v30 = v42;
    uint64_t v32 = v43;
    uint64_t result = v40(0, 0);
    if (!v30) {
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v32, 0, 1, v31);
    }
  }
  return result;
}

uint64_t InputFilter.InputFilterBuffer.advance(by:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  uint64_t v5 = *(void *)(*v1 + 104);
  uint64_t v6 = *(void *)(*v1 + 88);
  swift_getAssociatedTypeWitness();
  uint64_t v60 = v5;
  uint64_t v7 = *(void *)(swift_getAssociatedConformanceWitness() + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v50 = *(void (***)(char *, uint64_t))(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  v54 = (char *)&v47 - v8;
  uint64_t v61 = v7;
  uint64_t v9 = swift_getAssociatedTypeWitness();
  uint64_t v62 = *(void (***)(char *, uint64_t))(v9 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  uint64_t v56 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v47 - v13;
  uint64_t v59 = v6;
  uint64_t v15 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)&v47 - v16;
  uint64_t v58 = swift_checkMetadataState();
  uint64_t result = MEMORY[0x270FA5388](v58);
  uint64_t v21 = (char *)&v47 - v20;
  uint64_t v22 = *(void *)(v4 + 136);
  uint64_t v23 = *(uint64_t *)((char *)v2 + v22);
  BOOL v24 = __OFSUB__(v23, a1);
  BOOL v25 = v23 < a1;
  uint64_t v26 = v23 - a1;
  if (v25)
  {
    lazy protocol witness table accessor for type FilterError and conformance FilterError();
    swift_allocError();
    unsigned char *v27 = 0;
    return swift_willThrow();
  }
  if (v24)
  {
    __break(1u);
    goto LABEL_16;
  }
  *(uint64_t *)((char *)v2 + v22) = v26;
  uint64_t v28 = *(void *)(*v2 + 120);
  uint64_t v29 = *(uint64_t *)((char *)v2 + v28);
  if (__OFSUB__(v29, a1))
  {
LABEL_16:
    __break(1u);
    return result;
  }
  uint64_t v48 = v19;
  uint64_t v49 = v28;
  *(uint64_t *)((char *)v2 + v28) = v29 - a1;
  uint64_t v30 = v59;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, (uint64_t)v2 + *(void *)(*v2 + 112), v59);
  dispatch thunk of DataProtocol.regions.getter();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v30);
  uint64_t v31 = *(void *)(*v2 + 128);
  uint64_t v57 = v2;
  uint64_t v53 = v22;
  uint64_t v32 = v58;
  if (!*(uint64_t *)((char *)v2 + v22))
  {
    uint64_t v33 = (uint64_t)v57 + v31;
    v64 = (void (**)(char *, uint64_t, uint64_t))(v62 + 2);
    ++v62;
    v34 = (void (**)(char *))(v50 + 2);
    ++v50;
    v51 = v34;
    uint64_t v52 = (uint64_t)v57 + v31;
    do
    {
      swift_beginAccess();
      dispatch thunk of Collection.formIndex(after:)();
      swift_endAccess();
      uint64_t v35 = *v64;
      (*v64)(v14, v33, v9);
      uint64_t v36 = v14;
      uint64_t v37 = v21;
      uint64_t v38 = v56;
      dispatch thunk of Collection.endIndex.getter();
      swift_getAssociatedConformanceWitness();
      LODWORD(v61) = dispatch thunk of static Equatable.== infix(_:_:)();
      uint64_t v39 = *v62;
      v40 = v38;
      uint64_t v21 = v37;
      uint64_t v14 = v36;
      uint64_t v33 = v52;
      (*v62)(v40, v9);
      v39(v14, v9);
      if (v61) {
        break;
      }
      v35(v14, v33, v9);
      uint64_t v41 = (void (*)(char *, void))dispatch thunk of Collection.subscript.read();
      uint64_t v42 = v54;
      uint64_t v43 = AssociatedTypeWitness;
      (*v51)(v54);
      v41(v63, 0);
      v39(v14, v9);
      swift_getAssociatedConformanceWitness();
      uint64_t v44 = dispatch thunk of Collection.count.getter();
      uint64_t v45 = v42;
      uint64_t v32 = v58;
      (*v50)(v45, v43);
      *(uint64_t *)((char *)v57 + v53) = v44;
    }
    while (!v44);
  }
  if (!*(uint64_t *)((char *)v57 + v49) || *(uint64_t *)((char *)v57 + v53)) {
    return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v21, v32);
  }
  lazy protocol witness table accessor for type FilterError and conformance FilterError();
  swift_allocError();
  unsigned char *v46 = 0;
  swift_willThrow();
  return (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v21, v32);
}

uint64_t InputFilter.InputFilterBuffer.__deallocating_deinit()
{
  (*(void (**)(uint64_t, void))(*(void *)(*(void *)(*(void *)v0 + 88) - 8) + 8))(v0 + *(void *)(*(void *)v0 + 112), *(void *)(*(void *)v0 + 88));
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 128);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(v1, AssociatedTypeWitness);

  return swift_deallocClassInstance();
}

__n128 InputFilter._stream.getter@<Q0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 56);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 40);
  *(void *)(a1 + 16) = v3;
  __n128 result = *(__n128 *)(v1 + 64);
  *(__n128 *)(a1 + 24) = result;
  return result;
}

uint64_t InputFilter._buf.setter(uint64_t a1)
{
  *(void *)(v1 + 80) = a1;
  return swift_release();
}

uint64_t InputFilter._eofReached.getter()
{
  return *(unsigned __int8 *)(v0 + 88);
}

uint64_t InputFilter._eofReached.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 88) = result;
  return result;
}

uint64_t InputFilter._endReached.getter()
{
  return *(unsigned __int8 *)(v0 + 89);
}

uint64_t InputFilter._endReached.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 89) = result;
  return result;
}

uint64_t InputFilter.__allocating_init(_:using:bufferCapacity:readingFrom:)(unsigned __int8 *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = swift_allocObject();
  InputFilter.init(_:using:bufferCapacity:readingFrom:)(a1, a2, a3, a4, a5);
  return v10;
}

uint64_t InputFilter.init(_:using:bufferCapacity:readingFrom:)(unsigned __int8 *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned __int8 v10 = *a1;
  char v11 = *a2;
  *(void *)(v5 + 80) = 0;
  *(_WORD *)(v5 + 88) = 0;
  unsigned __int8 v17 = v10;
  char v16 = v11;
  specialized compression_stream.init(operation:algorithm:)(&v17, &v16, (uint64_t)v14);
  if (v6)
  {
    swift_release();
    swift_release();
    type metadata accessor for InputFilter();
    swift_deallocPartialClassInstance();
  }
  else
  {
    long long v12 = v14[1];
    *(_OWORD *)(v5 + 40) = v14[0];
    *(_OWORD *)(v5 + 56) = v12;
    *(void *)(v5 + 72) = v15;
    *(void *)(v5 + 16) = a3;
    *(void *)(v5 + 24) = a4;
    *(void *)(v5 + 32) = a5;
  }
  return v5;
}

uint64_t InputFilter.readData(ofLength:)(uint64_t result)
{
  if (result < 1)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (*(unsigned char *)(v1 + 89)) {
    return 0;
  }
  uint64_t v3 = result;
  uint64_t v6 = specialized Data.init(count:)(result);
  unint64_t v7 = v4;
  MEMORY[0x270FA5388](v6);
  specialized Data._Representation.withUnsafeMutableBytes<A>(_:)((void (*)(uint64_t, uint64_t))partial apply for closure #1 in InputFilter.readData(ofLength:));
  if (v2) {
    return outlined consume of Data._Representation(v6, v7);
  }
  swift_beginAccess();
  uint64_t v5 = *(void *)(v1 + 48);
  __n128 result = v3 - v5;
  if (__OFSUB__(v3, v5)) {
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) == 0)
  {
    Data._Representation.count.setter();
    return v6;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t closure #1 in InputFilter.readData(ofLength:)(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v44 = *a2;
  uint64_t v7 = *(void *)(v44 + 80);
  uint64_t v8 = type metadata accessor for Optional();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v43 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v47 = (char *)&v33 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v33 - v14;
  if (a1)
  {
    swift_beginAccess();
    a2[5] = a1;
    a2[6] = a3;
    char v16 = (compression_stream *)(a2 + 5);
    uint64_t result = swift_beginAccess();
    if (a2[6] > 0 && (*((unsigned char *)a2 + 89) & 1) == 0)
    {
      uint64_t v37 = v7 - 8;
      uint64_t v41 = (void (**)(char *, char *, uint64_t))(v9 + 16);
      uint64_t v42 = (void (**)(char *, uint64_t))(v9 + 8);
      uint64_t v18 = MEMORY[0x263F8EE60] + 8;
      uint64_t v38 = v7;
      uint64_t v39 = v15;
      uint64_t v40 = v8;
      uint64_t v35 = (compression_stream *)(a2 + 5);
      uint64_t v36 = MEMORY[0x263F8EE60] + 8;
      while (1)
      {
        uint64_t v19 = (void (*)(char *, uint64_t))a2[10];
        if (v19 && *(void *)((char *)v19 + *(void *)(*(void *)v19 + 120))) {
          goto LABEL_17;
        }
        if ((a2[11] & 1) == 0) {
          break;
        }
LABEL_16:
        if (!v19)
        {
          int v30 = *((unsigned __int8 *)a2 + 88);
          swift_beginAccess();
          compression_status v31 = compression_stream_process(v16, v30);
          swift_endAccess();
          if (v31 == COMPRESSION_STATUS_END)
          {
            *((unsigned char *)a2 + 89) = 1;
          }
          else if (v31 == COMPRESSION_STATUS_ERROR)
          {
            goto LABEL_25;
          }
          goto LABEL_18;
        }
LABEL_17:
        MEMORY[0x270FA5388](result);
        *(&v33 - 2) = (void (*)(char *, uint64_t))a2;
        *(&v33 - 1) = v19;
        swift_retain();
        InputFilter.InputFilterBuffer.withUnsafeBytes<A>(_:)(partial apply for closure #1 in closure #1 in InputFilter.readData(ofLength:), (uint64_t)(&v33 - 4), v18, (uint64_t)&v45);
        uint64_t result = swift_release();
        if (v3) {
          return result;
        }
LABEL_18:
        uint64_t result = swift_beginAccess();
        if (a2[6] < 1 || (*((unsigned char *)a2 + 89) & 1) != 0) {
          return result;
        }
      }
      uint64_t result = ((uint64_t (*)(uint64_t))a2[3])(a2[2]);
      if (v3) {
        return result;
      }
      uint64_t v20 = *v41;
      uint64_t v21 = v47;
      (*v41)(v47, v15, v8);
      uint64_t v22 = *(void *)(v7 - 8);
      uint64_t v23 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 48);
      if (v23((uint64_t)v21, 1, v7) == 1)
      {
        (*v42)(v21, v8);
      }
      else
      {
        uint64_t v34 = *(void *)(v44 + 88);
        uint64_t v24 = dispatch thunk of Collection.count.getter();
        uint64_t v33 = *(void (**)(char *, uint64_t))(v22 + 8);
        v33(v21, v7);
        if (v24)
        {
          uint64_t v25 = (uint64_t)v43;
          v20(v43, v39, v40);
          uint64_t v26 = v38;
          uint64_t result = v23(v25, 1, v38);
          if (result == 1)
          {
            __break(1u);
            return result;
          }
          *(void *)&long long v45 = v26;
          *((void *)&v45 + 1) = v26;
          *(void *)&long long v46 = v34;
          *((void *)&v46 + 1) = v34;
          uint64_t v27 = type metadata accessor for InputFilter.InputFilterBuffer();
          long long v28 = *(_OWORD *)(v27 + 96);
          long long v45 = *(_OWORD *)(v27 + 80);
          long long v46 = v28;
          type metadata accessor for InputFilter.InputFilterBuffer();
          uint64_t v29 = swift_allocObject();
          specialized InputFilter.InputFilterBuffer.init(_:)(v25);
          uint64_t v18 = v36;
          v33((char *)v25, v26);
          uint64_t v7 = v26;
          uint64_t v8 = v40;
          goto LABEL_15;
        }
      }
      uint64_t v29 = 0;
      *((unsigned char *)a2 + 88) = 1;
      uint64_t v7 = v38;
      uint64_t v8 = v40;
      uint64_t v18 = v36;
LABEL_15:
      a2[10] = v29;
      swift_release();
      uint64_t v15 = v39;
      uint64_t result = ((uint64_t (*)(char *, uint64_t))*v42)(v39, v8);
      uint64_t v19 = (void (*)(char *, uint64_t))a2[10];
      char v16 = v35;
      goto LABEL_16;
    }
  }
  else
  {
LABEL_25:
    lazy protocol witness table accessor for type FilterError and conformance FilterError();
    swift_allocError();
    unsigned char *v32 = 1;
    return swift_willThrow();
  }
  return result;
}

compression_stream *InputFilter.deinit()
{
  swift_beginAccess();
  compression_stream_destroy(v0 + 1);
  swift_endAccess();
  swift_release();
  swift_release();
  return v0;
}

uint64_t InputFilter.__deallocating_deinit()
{
  InputFilter.deinit();

  return swift_deallocClassInstance();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance compression_algorithm(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

_DWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance compression_algorithm@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance compression_algorithm(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

void specialized Data._Representation.withUnsafeMutableBytes<A>(_:)(void (*a1)(uint64_t, uint64_t))
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v2 = v1[1];
  switch(v2 >> 62)
  {
    case 1uLL:
      *(void *)&long long v17 = *v1;
      *((void *)&v17 + 1) = v2 & 0x3FFFFFFFFFFFFFFFLL;
      specialized Data.InlineSlice.withUnsafeMutableBytes<A>(_:)(a1);
      uint64_t v3 = v17;
      unint64_t v4 = *((void *)&v17 + 1) | 0x4000000000000000;
      goto LABEL_4;
    case 2uLL:
      *(void *)&long long v17 = *v1;
      *((void *)&v17 + 1) = v2 & 0x3FFFFFFFFFFFFFFFLL;
      Data.LargeSlice.ensureUniqueReference()();
      uint64_t v5 = *((void *)&v17 + 1);
      uint64_t v6 = *(void *)(v17 + 16);
      uint64_t v16 = *(void *)(v17 + 24);
      uint64_t v7 = __DataStorage._bytes.getter();
      if (!v7)
      {
        __break(1u);
        JUMPOUT(0x213700028);
      }
      uint64_t v8 = v7;
      uint64_t v9 = __DataStorage._offset.getter();
      uint64_t v10 = v6 - v9;
      if (__OFSUB__(v6, v9))
      {
        __break(1u);
LABEL_15:
        __break(1u);
      }
      BOOL v11 = __OFSUB__(v16, v6);
      uint64_t v12 = v16 - v6;
      if (v11) {
        goto LABEL_15;
      }
      uint64_t v13 = __DataStorage._length.getter();
      if (v13 >= v12) {
        uint64_t v14 = v12;
      }
      else {
        uint64_t v14 = v13;
      }
      a1(v8 + v10, v8 + v10 + v14);
      *uint64_t v1 = v17;
      v1[1] = v5 | 0x8000000000000000;
      return;
    case 3uLL:
      *(void *)((char *)&v17 + 7) = 0;
      *(void *)&long long v17 = 0;
      a1((uint64_t)&v17, (uint64_t)&v17);
      return;
    default:
      *(void *)&long long v17 = *v1;
      WORD4(v17) = v2;
      BYTE10(v17) = BYTE2(v2);
      BYTE11(v17) = BYTE3(v2);
      BYTE12(v17) = BYTE4(v2);
      BYTE13(v17) = BYTE5(v2);
      BYTE14(v17) = BYTE6(v2);
      a1((uint64_t)&v17, (uint64_t)&v17 + BYTE6(v2));
      uint64_t v3 = v17;
      unint64_t v4 = DWORD2(v17) | ((unint64_t)BYTE12(v17) << 32) | ((unint64_t)BYTE13(v17) << 40) | ((unint64_t)BYTE14(v17) << 48);
LABEL_4:
      *uint64_t v1 = v3;
      v1[1] = v4;
      return;
  }
}

void specialized Data.InlineSlice.withUnsafeMutableBytes<A>(_:)(void (*a1)(uint64_t, uint64_t))
{
  Data.InlineSlice.ensureUniqueReference()();
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  if ((int)v4 < (int)v3)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v5 = __DataStorage._bytes.getter();
  if (!v5)
  {
LABEL_10:
    __break(1u);
    return;
  }
  uint64_t v6 = v5;
  uint64_t v7 = __DataStorage._offset.getter();
  uint64_t v8 = v3 - v7;
  if (__OFSUB__(v3, v7))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v9 = v4 - v3;
  uint64_t v10 = __DataStorage._length.getter();
  if (v10 >= v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v10;
  }
  a1(v6 + v8, v6 + v8 + v11);
}

uint64_t specialized compression_stream.init(operation:algorithm:)@<X0>(unsigned __int8 *a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  compression_stream_operation v4 = *a1;
  uint64_t v5 = *a2;
  *(_OWORD *)&v10.dst_ptr = 0xFFFFFFFFFFFFFFFFLL;
  *(_OWORD *)&v10.src_size = 0uLL;
  v10.src_ptr = (const uint8_t *)-1;
  uint64_t result = compression_stream_init(&v10, v4, (compression_algorithm)dword_2137021A0[v5]);
  if (result)
  {
    lazy protocol witness table accessor for type FilterError and conformance FilterError();
    swift_allocError();
    *uint64_t v7 = 0;
    return swift_willThrow();
  }
  else
  {
    src_ptr = v10.src_ptr;
    long long v9 = *(_OWORD *)&v10.src_size;
    *(_OWORD *)a3 = *(_OWORD *)&v10.dst_ptr;
    *(void *)(a3 + 16) = src_ptr;
    *(_OWORD *)(a3 + 24) = v9;
  }
  return result;
}

uint64_t type metadata accessor for OutputFilter()
{
  return self;
}

uint64_t partial apply for closure #1 in OutputFilter.write<A>(_:)(uint64_t a1)
{
  return closure #1 in OutputFilter.write<A>(_:)(a1, *(void *)(v1 + 32), *(void (***)(char *, void, uint64_t))(v1 + 40));
}

unint64_t lazy protocol witness table accessor for type FilterError and conformance FilterError()
{
  unint64_t result = lazy protocol witness table cache variable for type FilterError and conformance FilterError;
  if (!lazy protocol witness table cache variable for type FilterError and conformance FilterError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilterError and conformance FilterError);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FilterError and conformance FilterError;
  if (!lazy protocol witness table cache variable for type FilterError and conformance FilterError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilterError and conformance FilterError);
  }
  return result;
}

uint64_t specialized Data.InlineData.init(_:)(unsigned char *__src, unsigned char *a2)
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

uint64_t specialized Data._Representation.init(_:count:)(uint64_t result, uint64_t a2)
{
  if (!a2)
  {
    swift_release();
    return 0;
  }
  if (a2 > 14)
  {
    if ((unint64_t)a2 < 0x7FFFFFFF) {
      return a2 << 32;
    }
    type metadata accessor for Data.RangeReference();
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = 0;
    *(void *)(v3 + 24) = a2;
    return v3;
  }
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    compression_stream_operation v4 = (unsigned char *)__DataStorage._bytes.getter();
    if (!v4)
    {
LABEL_10:
      uint64_t v5 = __DataStorage._length.getter();
      if (v5 >= a2) {
        uint64_t v6 = a2;
      }
      else {
        uint64_t v6 = v5;
      }
      uint64_t v7 = &v4[v6];
      if (v4) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      uint64_t v3 = specialized Data.InlineData.init(_:)(v4, v8);
      swift_release();
      return v3;
    }
    unint64_t result = __DataStorage._offset.getter();
    if (!__OFSUB__(0, result))
    {
      v4 -= result;
      goto LABEL_10;
    }
  }
  __break(1u);
  return result;
}

uint64_t outlined copy of Data._Representation(uint64_t a1, unint64_t a2)
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

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
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

uint64_t type metadata accessor for InputFilter()
{
  return __swift_instantiateGenericMetadata();
}

char *specialized InputFilter.InputFilterBuffer.init(_:)(uint64_t a1)
{
  uint64_t v60 = a1;
  unint64_t v2 = (char *)v1;
  uint64_t v3 = (void *)*v1;
  uint64_t v4 = v3[13];
  uint64_t v5 = v3[11];
  uint64_t v6 = v2;
  swift_getAssociatedTypeWitness();
  uint64_t v68 = *(void *)(swift_getAssociatedConformanceWitness() + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v54 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v53 = (char *)v47 - v7;
  uint64_t v62 = swift_getAssociatedTypeWitness();
  uint64_t v67 = *(void *)(v62 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v62);
  uint64_t v56 = (char *)v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v66 = (char *)v47 - v10;
  uint64_t v65 = swift_checkMetadataState();
  uint64_t v69 = *(void *)(v65 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v65);
  uint64_t v61 = (char *)v47 - v12;
  uint64_t v13 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v47 - v14;
  v71 = v6;
  uint64_t v16 = &v6[v3[14]];
  uint64_t v18 = v13 + 16;
  long long v17 = *(void (**)(void, void, void))(v13 + 16);
  v64 = v17;
  v17(v16, v60, v5);
  uint64_t v59 = v16;
  v17(v15, v16, v5);
  uint64_t v63 = v4;
  uint64_t v19 = dispatch thunk of Collection.count.getter();
  uint64_t v20 = *(void (**)(void, void))(v13 + 8);
  v20(v15, v5);
  uint64_t v58 = v20;
  uint64_t v21 = v71;
  *(void *)&v71[*(void *)(*(void *)v71 + 120)] = v19;
  uint64_t v52 = *(void *)(*(void *)v21 + 136);
  *(void *)&v21[v52] = 0;
  v64(v15, v16, v5);
  uint64_t v22 = v61;
  uint64_t v60 = v13 + 8;
  dispatch thunk of DataProtocol.regions.getter();
  v20(v15, v5);
  uint64_t v24 = v65;
  uint64_t v23 = v66;
  dispatch thunk of Collection.startIndex.getter();
  uint64_t v25 = *(void (**)(void, void))(v69 + 8);
  v69 += 8;
  v25(v22, v24);
  uint64_t v26 = &v71[*(void *)(*(void *)v71 + 128)];
  uint64_t v27 = v67;
  uint64_t v28 = v62;
  (*(void (**)(char *, char *, uint64_t))(v67 + 32))(v26, v23, v62);
  swift_beginAccess();
  uint64_t v29 = *(void (**)(void, void, void))(v27 + 16);
  uint64_t v48 = v26;
  v47[1] = v27 + 16;
  v47[0] = v29;
  v29(v23, v26, v28);
  uint64_t v50 = v18;
  v64(v15, v59, v5);
  dispatch thunk of DataProtocol.regions.getter();
  uint64_t v51 = v5;
  v58(v15, v5);
  int v30 = v56;
  uint64_t v31 = v65;
  dispatch thunk of Collection.endIndex.getter();
  uint64_t v49 = v25;
  v25(v22, v31);
  swift_getAssociatedConformanceWitness();
  uint64_t v32 = v66;
  uint64_t v33 = v28;
  LOBYTE(v28) = dispatch thunk of static Equatable.== infix(_:_:)();
  uint64_t v34 = *(void (**)(void, void))(v27 + 8);
  v34(v30, v33);
  uint64_t v67 = v27 + 8;
  v34(v32, v33);
  if ((v28 & 1) == 0)
  {
    uint64_t v35 = v51;
    v64(v15, v59, v51);
    uint64_t v36 = v61;
    dispatch thunk of DataProtocol.regions.getter();
    v58(v15, v35);
    uint64_t v37 = v66;
    ((void (*)(char *, char *, uint64_t))v47[0])(v66, v48, v62);
    uint64_t v38 = v65;
    uint64_t v39 = (void (*)(void, void))dispatch thunk of Collection.subscript.read();
    uint64_t v40 = v54;
    uint64_t v41 = v34;
    uint64_t v42 = v53;
    uint64_t v43 = AssociatedTypeWitness;
    (*(void (**)(char *))(v54 + 16))(v53);
    v39(v70, 0);
    v41(v37, v62);
    v49(v36, v38);
    swift_getAssociatedConformanceWitness();
    uint64_t v44 = dispatch thunk of Collection.count.getter();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v42, v43);
    *(void *)&v71[v52] = v44;
  }
  uint64_t v45 = v57;
  InputFilter.InputFilterBuffer.advance(by:)(0);
  if (v45) {
    swift_release();
  }
  return v71;
}

uint64_t specialized Data.init(count:)(uint64_t result)
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

uint64_t partial apply for closure #1 in InputFilter.readData(ofLength:)(uint64_t a1)
{
  return closure #1 in InputFilter.readData(ofLength:)(a1, *(uint64_t **)(v1 + 16), *(void *)(v1 + 24));
}

unint64_t lazy protocol witness table accessor for type Algorithm and conformance Algorithm()
{
  unint64_t result = lazy protocol witness table cache variable for type Algorithm and conformance Algorithm;
  if (!lazy protocol witness table cache variable for type Algorithm and conformance Algorithm)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Algorithm and conformance Algorithm);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [Algorithm] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [Algorithm] and conformance [A];
  if (!lazy protocol witness table cache variable for type [Algorithm] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Algorithm]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [Algorithm] and conformance [A]);
  }
  return result;
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

unint64_t lazy protocol witness table accessor for type FilterOperation and conformance FilterOperation()
{
  unint64_t result = lazy protocol witness table cache variable for type FilterOperation and conformance FilterOperation;
  if (!lazy protocol witness table cache variable for type FilterOperation and conformance FilterOperation)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FilterOperation and conformance FilterOperation);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Algorithm(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for Algorithm(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21370106CLL);
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

uint64_t getEnumTag for Algorithm(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for Algorithm(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Algorithm()
{
  return &type metadata for Algorithm;
}

ValueMetadata *type metadata accessor for FilterOperation()
{
  return &type metadata for FilterOperation;
}

uint64_t getEnumTagSinglePayload for FilterOperation(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for FilterOperation(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x21370122CLL);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *destructiveInjectEnumTag for FilterError(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FilterError()
{
  return &type metadata for FilterError;
}

uint64_t method lookup function for OutputFilter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for OutputFilter);
}

uint64_t dispatch thunk of OutputFilter.__allocating_init(_:using:bufferCapacity:writingTo:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of OutputFilter.write<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of OutputFilter.finalize()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t type metadata instantiation function for InputFilter()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t type metadata completion function for InputFilter()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for InputFilter(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for InputFilter);
}

uint64_t dispatch thunk of InputFilter.__allocating_init(_:using:bufferCapacity:readingFrom:)()
{
  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of InputFilter.readData(ofLength:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t type metadata completion function for InputFilter.InputFilterBuffer()
{
  uint64_t AssociatedTypeWitness = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F) {
      return swift_initClassMetadata2();
    }
  }
  return AssociatedTypeWitness;
}

uint64_t type metadata accessor for InputFilter.InputFilterBuffer()
{
  return swift_getGenericMetadata();
}

uint64_t initializeBufferWithCopyOfBuffer for compression_stream(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for compression_stream(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)a1) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for compression_stream(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 - 2;
    if (a3 >= 2) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 40) = 0;
    }
    if (a2) {
      *(void *)__n128 result = 0;
    }
  }
  return result;
}

void type metadata accessor for compression_stream(uint64_t a1)
{
}

void type metadata accessor for compression_stream_operation(uint64_t a1)
{
}

void type metadata accessor for compression_algorithm(uint64_t a1)
{
}

void type metadata accessor for compression_stream(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t partial apply for closure #1 in InputFilter.InputFilterBuffer.withUnsafeBytes<A>(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (!result) {
    goto LABEL_7;
  }
  uint64_t v6 = *(void *)(*(void *)(v3 + 24) + *(void *)(**(void **)(v3 + 24) + 136));
  if (__OFSUB__(0, v6))
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }
  uint64_t v7 = *(void *)(v3 + 16);
  __n128 result = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 32))(a2 - v6, a2);
  if (!v4) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(a3, 0, 1, v7);
  }
  return result;
}

uint64_t partial apply for closure #1 in closure #1 in InputFilter.readData(ofLength:)(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)(v2 + 16);
    swift_beginAccess();
    uint64_t v6 = a2 - v4;
    *(void *)(v5 + 56) = v4;
    *(void *)(v5 + 64) = a2 - v4;
    compression_status v7 = compression_stream_process((compression_stream *)(v5 + 40), *(unsigned __int8 *)(v5 + 88));
    swift_endAccess();
    if (v7 == COMPRESSION_STATUS_ERROR)
    {
      lazy protocol witness table accessor for type FilterError and conformance FilterError();
      swift_allocError();
      *uint64_t v9 = 1;
      return swift_willThrow();
    }
    if (v7 == COMPRESSION_STATUS_END) {
      *(unsigned char *)(v5 + 89) = 1;
    }
    swift_beginAccess();
    uint64_t v8 = *(void *)(v5 + 64);
    __n128 result = v6 - v8;
    if (!__OFSUB__(v6, v8)) {
      return InputFilter.InputFilterBuffer.advance(by:)(result);
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t dispatch thunk of DataProtocol.regions.getter()
{
  return MEMORY[0x270EEE260]();
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return MEMORY[0x270EEE618]();
}

uint64_t __DataStorage._bytes.getter()
{
  return MEMORY[0x270EEE638]();
}

uint64_t __DataStorage.init(length:)()
{
  return MEMORY[0x270EEE648]();
}

uint64_t __DataStorage._length.getter()
{
  return MEMORY[0x270EEE658]();
}

uint64_t __DataStorage._offset.getter()
{
  return MEMORY[0x270EEE670]();
}

uint64_t type metadata accessor for __DataStorage()
{
  return MEMORY[0x270EEE688]();
}

uint64_t dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x270EEEA60]();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
}

uint64_t Data.Deallocator._deallocator.getter()
{
  return MEMORY[0x270EEFFE0]();
}

uint64_t type metadata accessor for Data.Deallocator()
{
  return MEMORY[0x270EEFFE8]();
}

Swift::Void __swiftcall Data.InlineSlice.ensureUniqueReference()()
{
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return MEMORY[0x270EF0070]();
}

uint64_t Data._Representation.count.setter()
{
  return MEMORY[0x270EF00A8]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x270F9D598]();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return MEMORY[0x270F9E080]();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t dispatch thunk of Collection.isEmpty.getter()
{
  return MEMORY[0x270F9E0C8]();
}

uint64_t dispatch thunk of Collection.endIndex.getter()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return MEMORY[0x270F9E518]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x270F98F68](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F78](stream, *(void *)&operation, *(void *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x270F98F80](stream, *(void *)&flags);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}