unint64_t mxSignpost(_:dso:log:name:signpostID:_:_:)(int a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unsigned int a6, uint64_t a7, unint64_t a8, uint64_t a9, unsigned __int8 a10, uint64_t a11)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char v21;
  void (*v22)(char *, uint64_t);
  void (*v23)(char *, uint64_t, uint64_t);
  unint64_t result;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unsigned int v39;
  uint64_t v40;
  int v41;
  unint64_t v42;
  char *v43;
  uint64_t v44;

  v42 = a8;
  v39 = a6;
  v38 = a4;
  v44 = a3;
  v40 = a2;
  v41 = a1;
  v12 = type metadata accessor for OSSignpostID();
  v13 = *(void *)(v12 - 8);
  v14 = MEMORY[0x270FA5388](v12);
  v43 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x270FA5388](v14);
  v18 = (char *)&v36 - v17;
  MEMORY[0x270FA5388](v16);
  v20 = (char *)&v36 - v19;
  static OSSignpostID.invalid.getter();
  lazy protocol witness table accessor for type OSSignpostID and conformance OSSignpostID();
  v21 = dispatch thunk of static Equatable.== infix(_:_:)();
  v22 = *(void (**)(char *, uint64_t))(v13 + 8);
  v22(v20, v12);
  v23 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v23(v18, a7, v12);
  if (v21)
  {
    v22(v18, v12);
    return OS_os_log.signpostsEnabled.getter();
  }
  static OSSignpostID.null.getter();
  v25 = dispatch thunk of static Equatable.== infix(_:_:)();
  v22(v20, v12);
  v22(v18, v12);
  result = OS_os_log.signpostsEnabled.getter();
  if ((result & 1) != 0 && (v25 & 1) == 0)
  {
    v37 = a9;
    v26 = _swift_os_log_return_address();
    v27 = (uint64_t)v43;
    v28 = ((uint64_t (*)(char *, uint64_t, uint64_t))v23)(v43, a7, v12);
    MEMORY[0x270FA5388](v28);
    v29 = v42;
    v30 = v37;
    *(&v36 - 10) = v42;
    *(&v36 - 9) = v30;
    *((unsigned char *)&v36 - 64) = a10;
    v31 = v44;
    v32 = v40;
    *(&v36 - 7) = a11;
    *(&v36 - 6) = v32;
    *(&v36 - 5) = v26;
    v33 = v31;
    LOBYTE(v34) = v41;
    v35 = v27;
    if (v39)
    {
      result = v38;
      if (!HIDWORD(v38))
      {
        if (v38 >> 11 == 27)
        {
LABEL_17:
          __break(1u);
          return result;
        }
        if (WORD1(v38) <= 0x10u)
        {
          _ss7UnicodeO6ScalarV17withUTF8CodeUnitsyxxSRys5UInt8VGKXEKlFyt_Tg5024_ss12StaticStringV14withd14BufferyxxSRys5G20VGXElFxAFXEfU_yt_Tg5AHxRi_zRi0_zlyytIsgyr_Tf1ncn_n(v38, (uint64_t (*)(uint64_t *))partial apply for closure #1 in mxSignpost(_:dso:log:name:signpostID:_:_:));
          return ((uint64_t (*)(uint64_t, uint64_t))v22)(v27, v12);
        }
LABEL_16:
        __break(1u);
        goto LABEL_17;
      }
    }
    else
    {
      result = v38;
      if (v38)
      {
        closure #1 in closure #1 in mxSignpost(_:dso:log:name:signpostID:_:_:)(v38, v29, a10, a11, v32, v26, v31, v41, v39, v27, (uint64_t)partial apply for closure #1 in closure #1 in closure #1 in closure #1 in closure #1 in mxSignpostAnimationIntervalBegin(dso:log:name:signpostID:_:_:), (uint64_t (*)(uint64_t *))partial apply for closure #1 in closure #1 in closure #1 in mxSignpostAnimationIntervalBegin(dso:log:name:signpostID:_:_:));
        return ((uint64_t (*)(uint64_t, uint64_t))v22)(v27, v12);
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_16;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OSSignpostID and conformance OSSignpostID()
{
  unint64_t result = lazy protocol witness table cache variable for type OSSignpostID and conformance OSSignpostID;
  if (!lazy protocol witness table cache variable for type OSSignpostID and conformance OSSignpostID)
  {
    type metadata accessor for OSSignpostID();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OSSignpostID and conformance OSSignpostID);
  }
  return result;
}

uint64_t partial apply for closure #1 in mxSignpost(_:dso:log:name:signpostID:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return partial apply for closure #1 in mxSignpost(_:dso:log:name:signpostID:_:_:)(a1, (uint64_t)partial apply for closure #1 in closure #1 in closure #1 in closure #1 in closure #1 in mxSignpostAnimationIntervalBegin(dso:log:name:signpostID:_:_:), (uint64_t (*)(uint64_t *))partial apply for closure #1 in closure #1 in closure #1 in mxSignpostAnimationIntervalBegin(dso:log:name:signpostID:_:_:), a2);
}

char *specialized withVaList<A>(_:_:)(uint64_t a1, void (*a2)(uint64_t))
{
  type metadata accessor for __VaListBuilder();
  v3 = (void *)swift_allocObject();
  v3[2] = 8;
  v3[3] = 0;
  v4 = v3 + 3;
  v3[4] = 0;
  v3[5] = 0;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_25:
    uint64_t v19 = __VaListBuilder.va_list()();
    a2(v19);
    return (char *)swift_release();
  }
  uint64_t v6 = 0;
  uint64_t v7 = a1 + 32;
  while (1)
  {
    outlined init with copy of CVarArg(v7 + 40 * v6, (uint64_t)v21);
    __swift_project_boxed_opaque_existential_1(v21, v21[3]);
    unint64_t result = (char *)dispatch thunk of CVarArg._cVarArgEncoding.getter();
    uint64_t v9 = *v4;
    uint64_t v10 = *((void *)result + 2);
    uint64_t v11 = *v4 + v10;
    if (__OFADD__(*v4, v10)) {
      break;
    }
    v12 = result;
    uint64_t v13 = v3[4];
    if (v13 >= v11) {
      goto LABEL_18;
    }
    if (v13 + 0x4000000000000000 < 0) {
      goto LABEL_28;
    }
    v14 = (char *)v3[5];
    if (2 * v13 > v11) {
      uint64_t v11 = 2 * v13;
    }
    v3[4] = v11;
    if ((unint64_t)(v11 - 0x1000000000000000) >> 61 != 7) {
      goto LABEL_29;
    }
    unint64_t result = (char *)swift_slowAlloc();
    v3[5] = result;
    if (v14)
    {
      if (result != v14 || result >= &v14[8 * v9]) {
        memmove(result, v14, 8 * v9);
      }
      __VaListBuilder.deallocStorage(wordCount:storage:)();
LABEL_18:
      unint64_t result = (char *)v3[5];
    }
    if (!result) {
      goto LABEL_30;
    }
    if (v10)
    {
      v16 = (uint64_t *)(v12 + 32);
      uint64_t v17 = *v4;
      while (1)
      {
        uint64_t v18 = *v16++;
        *(void *)&result[8 * v17] = v18;
        uint64_t v17 = *v4 + 1;
        if (__OFADD__(*v4, 1)) {
          break;
        }
        uint64_t *v4 = v17;
        if (!--v10) {
          goto LABEL_3;
        }
      }
      __break(1u);
      break;
    }
LABEL_3:
    swift_bridgeObjectRelease();
    ++v6;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    if (v6 == v5) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

unint64_t mxSignpostAnimationIntervalBegin(dso:log:name:signpostID:_:_:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, unint64_t a7, uint64_t a8, unsigned __int8 a9, uint64_t a10)
{
  uint64_t v40 = a8;
  uint64_t v42 = a1;
  unint64_t v43 = a7;
  unsigned int v41 = a5;
  unint64_t v38 = a3;
  uint64_t v45 = a2;
  uint64_t v11 = type metadata accessor for OSSignpostID();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  v44 = &v36[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = &v36[-v16];
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = &v36[-v18];
  int v39 = static os_signpost_type_t.begin.getter();
  static OSSignpostID.invalid.getter();
  lazy protocol witness table accessor for type OSSignpostID and conformance OSSignpostID();
  char v20 = dispatch thunk of static Equatable.== infix(_:_:)();
  v21 = *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8);
  v21((uint64_t)v19, v11);
  v22 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v12 + 16);
  v22(v17, a6, v11);
  if (v20)
  {
    v21((uint64_t)v17, v11);
    return OS_os_log.signpostsEnabled.getter();
  }
  static OSSignpostID.null.getter();
  char v24 = dispatch thunk of static Equatable.== infix(_:_:)();
  v21((uint64_t)v19, v11);
  v21((uint64_t)v17, v11);
  uint64_t v25 = v45;
  unint64_t result = OS_os_log.signpostsEnabled.getter();
  if ((result & 1) != 0 && (v24 & 1) == 0)
  {
    int v37 = a9;
    uint64_t v26 = _swift_os_log_return_address();
    uint64_t v27 = (uint64_t)v44;
    uint64_t v28 = ((uint64_t (*)(unsigned char *, uint64_t, uint64_t))v22)(v44, a6, v11);
    MEMORY[0x270FA5388](v28);
    uint64_t v30 = v42;
    unint64_t v29 = v43;
    uint64_t v31 = v40;
    *(void *)&v36[-80] = v43;
    *(void *)&v36[-72] = v31;
    int v32 = v37;
    v36[-64] = v37;
    *(void *)&v36[-56] = a10;
    *(void *)&v36[-48] = v30;
    *(void *)&v36[-40] = v26;
    uint64_t v33 = v25;
    LOBYTE(v34) = v39;
    uint64_t v35 = v27;
    if (v41)
    {
      unint64_t result = v38;
      if (!HIDWORD(v38))
      {
        if (v38 >> 11 == 27)
        {
LABEL_17:
          __break(1u);
          return result;
        }
        if (WORD1(v38) <= 0x10u)
        {
          _ss7UnicodeO6ScalarV17withUTF8CodeUnitsyxxSRys5UInt8VGKXEKlFyt_Tg5024_ss12StaticStringV14withd14BufferyxxSRys5G20VGXElFxAFXEfU_yt_Tg5AHxRi_zRi0_zlyytIsgyr_Tf1ncn_n(v38, (uint64_t (*)(uint64_t *))partial apply for closure #1 in mxSignpost(_:dso:log:name:signpostID:_:_:));
          return v21(v27, v11);
        }
LABEL_16:
        __break(1u);
        goto LABEL_17;
      }
    }
    else
    {
      unint64_t result = v38;
      if (v38)
      {
        closure #1 in closure #1 in mxSignpost(_:dso:log:name:signpostID:_:_:)(v38, v29, v32, a10, v30, v26, v25, v39, v41, v27, (uint64_t)partial apply for closure #1 in closure #1 in closure #1 in closure #1 in closure #1 in mxSignpostAnimationIntervalBegin(dso:log:name:signpostID:_:_:), (uint64_t (*)(uint64_t *))partial apply for closure #1 in closure #1 in closure #1 in mxSignpostAnimationIntervalBegin(dso:log:name:signpostID:_:_:));
        return v21(v27, v11);
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_16;
  }
  return result;
}

uint64_t closure #1 in closure #1 in mxSignpost(_:dso:log:name:signpostID:_:_:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t (*a12)(uint64_t *))
{
  v30[0] = a9;
  int v34 = a8;
  int v35 = a3;
  uint64_t v18 = type metadata accessor for OSSignpostID();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  v21 = (char *)v30 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = v22;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, a10, v22);
  uint64_t v25 = a5;
  char v26 = v34;
  v30[4] = a4;
  v30[5] = v25;
  v30[6] = a6;
  v30[7] = a7;
  char v31 = v34;
  uint64_t v32 = a1;
  uint64_t v33 = v21;
  if ((v35 & 1) == 0)
  {
    if (a2)
    {
      MEMORY[0x270FA5388](result);
      v30[-8] = v28;
      v30[-7] = v27;
      v30[-6] = a7;
      LOBYTE(v30[-5]) = v26;
      v30[-4] = a1;
      v30[-3] = v21;
      v30[-2] = a2;
      specialized withVaList<A>(_:_:)(a4, v29);
      return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v21, v23);
    }
    __break(1u);
    goto LABEL_10;
  }
  if (HIDWORD(a2))
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (a2 >> 11 != 27)
  {
    if (WORD1(a2) <= 0x10u)
    {
      _ss7UnicodeO6ScalarV17withUTF8CodeUnitsyxxSRys5UInt8VGKXEKlFyt_Tg5024_ss12StaticStringV14withd14BufferyxxSRys5G20VGXElFxAFXEfU_yt_Tg5AHxRi_zRi0_zlyytIsgyr_Tf1ncn_n(a2, a12);
      return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v21, v23);
    }
    goto LABEL_11;
  }
LABEL_12:
  __break(1u);
  return result;
}

char *closure #1 in closure #1 in closure #1 in mxSignpost(_:dso:log:name:signpostID:_:_:)(char *result)
{
  if (result)
  {
    MEMORY[0x270FA5388](result);
    return specialized withVaList<A>(_:_:)(v1, v2);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t _ss7UnicodeO6ScalarV17withUTF8CodeUnitsyxxSRys5UInt8VGKXEKlFyt_Tg5024_ss12StaticStringV14withd14BufferyxxSRys5G20VGXElFxAFXEfU_yt_Tg5AHxRi_zRi0_zlyytIsgyr_Tf1ncn_n(unsigned int a1, uint64_t (*a2)(uint64_t *))
{
  if (a1 > 0x7F)
  {
    int v4 = (a1 & 0x3F) << 8;
    if (a1 >= 0x800)
    {
      int v5 = (v4 | (a1 >> 6) & 0x3F) << 8;
      int v6 = (((v5 | (a1 >> 12) & 0x3F) << 8) | (a1 >> 18)) - 2122219023;
      unsigned int v2 = (v5 | (a1 >> 12)) + 8487393;
      if (HIWORD(a1)) {
        unsigned int v2 = v6;
      }
    }
    else
    {
      unsigned int v2 = (v4 | (a1 >> 6)) + 33217;
    }
  }
  else
  {
    unsigned int v2 = a1 + 1;
  }
  uint64_t v7 = (v2 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * (4 - (__clz(v2) >> 3))));
  return a2(&v7);
}

uint64_t partial apply for closure #1 in mxSignpost(_:dso:log:name:signpostID:_:_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X2>, uint64_t (*a3)(uint64_t *)@<X3>, uint64_t a4@<X8>)
{
  if (result) {
    return closure #1 in closure #1 in mxSignpost(_:dso:log:name:signpostID:_:_:)(result, *(void *)(v4 + 16), *(unsigned __int8 *)(v4 + 32), *(void *)(v4 + 40), *(void *)(v4 + 48), *(void *)(v4 + 56), *(void *)(v4 + 64), *(unsigned __int8 *)(v4 + 72), a4, *(void *)(v4 + 80), a2, a3);
  }
  __break(1u);
  return result;
}

char *partial apply for closure #1 in closure #1 in closure #1 in mxSignpostAnimationIntervalBegin(dso:log:name:signpostID:_:_:)(char *a1)
{
  return partial apply for closure #1 in closure #1 in closure #1 in mxSignpostAnimationIntervalBegin(dso:log:name:signpostID:_:_:)(a1);
}

{
  return closure #1 in closure #1 in closure #1 in mxSignpost(_:dso:log:name:signpostID:_:_:)(a1);
}

uint64_t outlined init with copy of CVarArg(uint64_t a1, uint64_t a2)
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

uint64_t partial apply for closure #1 in closure #1 in closure #1 in closure #1 in closure #1 in mxSignpostAnimationIntervalBegin(dso:log:name:signpostID:_:_:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v5 = *(void *)(v1 + 32);
  uint64_t v6 = *(unsigned __int8 *)(v1 + 40);
  uint64_t v7 = *(void *)(v1 + 48);
  uint64_t v8 = *(void *)(v1 + 64);
  uint64_t v9 = OSSignpostID.rawValue.getter();

  return MEMORY[0x270FA2F10](v3, v4, v5, v6, v7, v9, v8, a1);
}

uint64_t static OSSignpostID.null.getter()
{
  return MEMORY[0x270FA2CD0]();
}

uint64_t static OSSignpostID.invalid.getter()
{
  return MEMORY[0x270FA2CD8]();
}

uint64_t OSSignpostID.rawValue.getter()
{
  return MEMORY[0x270FA2CE8]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x270FA2D00]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x270F9D598]();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return MEMORY[0x270FA2EA8]();
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return MEMORY[0x270FA2EC8]();
}

uint64_t __VaListBuilder.deallocStorage(wordCount:storage:)()
{
  return MEMORY[0x270F9ED50]();
}

uint64_t __VaListBuilder.va_list()()
{
  return MEMORY[0x270F9ED58]();
}

uint64_t type metadata accessor for __VaListBuilder()
{
  return MEMORY[0x270F9ED60]();
}

uint64_t dispatch thunk of CVarArg._cVarArgEncoding.getter()
{
  return MEMORY[0x270F9FD48]();
}

uint64_t _swift_os_log_return_address()
{
  return MEMORY[0x270FA2F08]();
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}