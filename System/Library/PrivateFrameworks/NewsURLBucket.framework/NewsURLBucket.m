uint64_t HashBucketer.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t HashBucketer.init()()
{
  return v0;
}

uint64_t HashBucketer.deinit()
{
  return v0;
}

uint64_t HashBucketer.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t variable initialization expression of URLHasher.stringHasher()
{
  type metadata accessor for StringHasher();

  return swift_allocObject();
}

uint64_t variable initialization expression of ObjCHashBucketer.hashBucketer()
{
  type metadata accessor for HashBucketer();

  return swift_allocObject();
}

uint64_t variable initialization expression of ObjCURLCanonicalizer.urlCanonicalizer()
{
  type metadata accessor for URLCanonicalizer();

  return swift_allocObject();
}

uint64_t variable initialization expression of ObjCURLHasher.urlHasher()
{
  type metadata accessor for URLHasher();
  uint64_t v0 = swift_allocObject();
  type metadata accessor for StringHasher();
  *(void *)(v0 + 16) = swift_allocObject();
  return v0;
}

void sub_1B0055004(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_1B005500C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t _s13NewsURLBucket12HashBucketerC6bucket3for0E5CountSi10Foundation4DataV_SitF_0(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = a2 >> 62;
  uint64_t v7 = 0;
  uint64_t v22 = a1 >> 32;
  uint64_t v23 = BYTE6(a2);
  switch(a2 >> 62)
  {
    case 1uLL:
      sub_1B00553B4(a1, a2);
      sub_1B00553B4(a1, a2);
      uint64_t v7 = v22;
      break;
    case 2uLL:
      uint64_t v7 = *(void *)(a1 + 24);
      sub_1B00553B4(a1, a2);
      sub_1B00553B4(a1, a2);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v7 = BYTE6(a2);
      break;
  }
  uint64_t v8 = 0;
  uint64_t v21 = v7;
  uint64_t v9 = v3;
  int v10 = v3;
  while (2)
  {
    uint64_t v11 = (int)a1;
    switch(v9)
    {
      case 0:
        if (!v7) {
          goto LABEL_35;
        }
        BOOL v12 = __OFSUB__(v7--, 1);
        if (v12) {
          goto LABEL_39;
        }
        if (v7 >= v23) {
          goto LABEL_40;
        }
        uint64_t v24 = a1;
        __int16 v25 = a2;
        char v26 = BYTE2(a2);
        char v27 = BYTE3(a2);
        char v28 = BYTE4(a2);
        char v29 = BYTE5(a2);
        uint64_t v13 = *((unsigned __int8 *)&v24 + v7);
        goto LABEL_27;
      case 1:
        goto LABEL_13;
      case 2:
        uint64_t v11 = *(void *)(a1 + 16);
LABEL_13:
        if (v7 == v11)
        {
LABEL_35:
          sub_1B005540C(a1, a2);
          sub_1B005540C(a1, a2);
          return v8;
        }
        BOOL v12 = __OFSUB__(v7--, 1);
        if (v12) {
          goto LABEL_38;
        }
        if (v3 == 2)
        {
          if (v7 < *(void *)(a1 + 16)) {
            goto LABEL_41;
          }
          if (v7 >= *(void *)(a1 + 24)) {
            goto LABEL_43;
          }
          uint64_t v14 = sub_1B0059368();
          if (!v14) {
            goto LABEL_47;
          }
          unint64_t v3 = v14;
          uint64_t v15 = sub_1B0059398();
          uint64_t v16 = v7 - v15;
          if (__OFSUB__(v7, v15)) {
            goto LABEL_45;
          }
        }
        else
        {
          if (v7 < (int)a1 || v7 >= v22) {
            goto LABEL_42;
          }
          uint64_t v17 = sub_1B0059368();
          if (!v17) {
            goto LABEL_48;
          }
          unint64_t v3 = v17;
          uint64_t v18 = sub_1B0059398();
          uint64_t v16 = v7 - v18;
          if (__OFSUB__(v7, v18)) {
            goto LABEL_44;
          }
        }
        uint64_t v13 = *(unsigned __int8 *)(v3 + v16);
        LODWORD(v3) = v10;
LABEL_27:
        if ((unint64_t)(v8 - 0x80000000000000) >> 56 != 255)
        {
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
          __break(1u);
LABEL_45:
          __break(1u);
LABEL_46:
          __break(1u);
LABEL_47:
          __break(1u);
LABEL_48:
          __break(1u);
        }
        if (!a3) {
          goto LABEL_37;
        }
        uint64_t v19 = v13 | (v8 << 8);
        if (v19 != 0x8000000000000000 || a3 != -1)
        {
          uint64_t v8 = v19 % a3;
          continue;
        }
        __break(1u);
LABEL_32:
        sub_1B005540C(a1, a2);
        sub_1B005540C(a1, a2);
        if (v21) {
          goto LABEL_46;
        }
        return 0;
      case 3:
        goto LABEL_32;
      default:
        JUMPOUT(0);
    }
  }
}

uint64_t type metadata accessor for HashBucketer()
{
  return self;
}

uint64_t sub_1B00553B4(uint64_t a1, unint64_t a2)
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

uint64_t sub_1B005540C(uint64_t a1, unint64_t a2)
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

BOOL static BloomFilterReaderWriter.QueryResult.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t BloomFilterReaderWriter.QueryResult.hash(into:)()
{
  return sub_1B0059688();
}

uint64_t BloomFilterReaderWriter.QueryResult.hashValue.getter()
{
  return sub_1B0059698();
}

BOOL sub_1B00554E4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1B00554FC()
{
  return sub_1B0059698();
}

uint64_t sub_1B0055544()
{
  return sub_1B0059688();
}

uint64_t sub_1B0055570()
{
  return sub_1B0059698();
}

uint64_t BloomFilterReaderWriter.data.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 72);
  sub_1B00553B4(v1, *(void *)(v0 + 80));
  return v1;
}

Swift::Void __swiftcall BloomFilterReaderWriter.add(_:)(Swift::String a1)
{
  uint64_t v2 = v1[2];
  if (v2 < 0)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
  }
  if (!v2) {
    return;
  }
  object = a1._object;
  unint64_t countAndFlagsBits = a1._countAndFlagsBits;
  uint64_t v5 = 0;
  while (2)
  {
    if (v2 == v5)
    {
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    ++v5;
    uint64_t v6 = sub_1B0055860(countAndFlagsBits, (unint64_t)object);
    swift_beginAccess();
    uint64_t v8 = v1[9];
    unint64_t v7 = v1[10];
    switch(v7 >> 62)
    {
      case 1uLL:
        if (v6 >= v8 >> 32 || v6 < (int)v8) {
          goto LABEL_26;
        }
        if (!sub_1B0059368()) {
          goto LABEL_32;
        }
        if (!__OFSUB__(v6, sub_1B0059398())) {
          goto LABEL_4;
        }
        goto LABEL_28;
      case 2uLL:
        if (v6 < *(void *)(v8 + 16)) {
          goto LABEL_27;
        }
        if (v6 >= *(void *)(v8 + 24)) {
          goto LABEL_29;
        }
        if (!sub_1B0059368()) {
          goto LABEL_33;
        }
        if (!__OFSUB__(v6, sub_1B0059398()))
        {
LABEL_4:
          swift_endAccess();
          swift_beginAccess();
          sub_1B00594B8();
          swift_endAccess();
          if (v2 == v5) {
            return;
          }
          continue;
        }
        __break(1u);
        return;
      case 3uLL:
        goto LABEL_31;
      default:
        if (v6 < BYTE6(v7)) {
          goto LABEL_4;
        }
        goto LABEL_25;
    }
  }
}

uint64_t sub_1B0055860(unint64_t a1, unint64_t a2)
{
  sub_1B0059658();
  swift_bridgeObjectRetain();
  sub_1B0059598();
  swift_bridgeObjectRelease();
  uint64_t v5 = _s13NewsURLBucket12StringHasherC4hash3for9maxLength10Foundation4DataVSS_SitF_0(a1, a2, 0x7FFFFFFFFFFFFFFFLL);
  unint64_t v7 = v6;
  swift_bridgeObjectRelease();
  uint64_t v8 = v2[7];
  uint64_t v9 = v2[8];
  __swift_project_boxed_opaque_existential_1(v2 + 4, v8);
  swift_beginAccess();
  uint64_t v10 = v2[9];
  unint64_t v11 = v2[10];
  uint64_t v12 = 0;
  switch(v11 >> 62)
  {
    case 1uLL:
      BOOL v13 = __OFSUB__(HIDWORD(v10), v10);
      int v14 = HIDWORD(v10) - v10;
      if (v13)
      {
        __break(1u);
LABEL_8:
        __break(1u);
        JUMPOUT(0x1B00559E8);
      }
      uint64_t v12 = v14;
LABEL_6:
      uint64_t v18 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))(v9 + 8))(v5, v7, v12, v8, v9);
      sub_1B005540C(v5, v7);
      return v18 / 8;
    case 2uLL:
      uint64_t v17 = v10 + 16;
      uint64_t v15 = *(void *)(v10 + 16);
      uint64_t v16 = *(void *)(v17 + 8);
      uint64_t v12 = v16 - v15;
      if (!__OFSUB__(v16, v15)) {
        goto LABEL_6;
      }
      goto LABEL_8;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v12 = BYTE6(v11);
      goto LABEL_6;
  }
}

NewsURLBucket::BloomFilterReaderWriter::QueryResult __swiftcall BloomFilterReaderWriter.contains(_:)(Swift::String a1)
{
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = v1[2];
  NewsURLBucket::BloomFilterReaderWriter::QueryResult v3 = NewsURLBucket_BloomFilterReaderWriter_QueryResult_no;
  if (v2 < 1) {
    return v3;
  }
  v4 = v1;
  object = a1._object;
  v37 = v1 + 4;
  swift_beginAccess();
  unint64_t v6 = 0;
  while (2)
  {
    if (v2 == v6)
    {
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
      __break(1u);
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
    }
    unint64_t v51 = v6;
    sub_1B0059658();
    unint64_t v51 = countAndFlagsBits;
    unint64_t v52 = (unint64_t)object;
    swift_bridgeObjectRetain();
    sub_1B0059598();
    swift_bridgeObjectRelease();
    uint64_t v10 = _s13NewsURLBucket12StringHasherC4hash3for9maxLength10Foundation4DataVSS_SitF_0(v51, v52, 0x7FFFFFFFFFFFFFFFLL);
    unint64_t v12 = v11;
    swift_bridgeObjectRelease();
    uint64_t v14 = v4[7];
    uint64_t v13 = v4[8];
    __swift_project_boxed_opaque_existential_1(v37, v14);
    uint64_t v15 = v4[9];
    unint64_t v16 = v4[10];
    uint64_t v17 = 0;
    switch(v16 >> 62)
    {
      case 1uLL:
        BOOL v18 = __OFSUB__(HIDWORD(v15), v15);
        int v19 = HIDWORD(v15) - v15;
        if (v18) {
          goto LABEL_42;
        }
        uint64_t v17 = v19;
LABEL_14:
        uint64_t v23 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))(v13 + 8))(v10, v12, v17, v14, v13);
        sub_1B005540C(v10, v12);
        uint64_t v24 = v23 / 8;
        uint64_t v26 = v23 - (v25 & 0xFFFFFFFFFFFFFFF8);
        if (v26 >= 0) {
          int v27 = 1 << v26;
        }
        else {
          int v27 = 0;
        }
        break;
      case 2uLL:
        uint64_t v22 = v15 + 16;
        uint64_t v20 = *(void *)(v15 + 16);
        uint64_t v21 = *(void *)(v22 + 8);
        uint64_t v17 = v21 - v20;
        if (!__OFSUB__(v21, v20)) {
          goto LABEL_14;
        }
        goto LABEL_43;
      case 3uLL:
        goto LABEL_14;
      default:
        uint64_t v17 = BYTE6(v16);
        goto LABEL_14;
    }
    swift_beginAccess();
    uint64_t v29 = v4[9];
    unint64_t v28 = v4[10];
    switch(v28 >> 62)
    {
      case 1uLL:
        if (v24 >= v29 >> 32 || v24 < (int)v29) {
          goto LABEL_38;
        }
        uint64_t v31 = sub_1B0059368();
        if (!v31) {
          goto LABEL_45;
        }
        uint64_t v32 = v31;
        uint64_t v33 = sub_1B0059398();
        uint64_t v8 = v24 - v33;
        if (!__OFSUB__(v24, v33)) {
          goto LABEL_3;
        }
        goto LABEL_40;
      case 2uLL:
        if (v24 < *(void *)(v29 + 16)) {
          goto LABEL_39;
        }
        if (v24 >= *(void *)(v29 + 24)) {
          goto LABEL_41;
        }
        uint64_t v34 = sub_1B0059368();
        if (!v34) {
          goto LABEL_46;
        }
        uint64_t v32 = v34;
        uint64_t v35 = sub_1B0059398();
        uint64_t v8 = v24 - v35;
        if (!__OFSUB__(v24, v35))
        {
LABEL_3:
          int v7 = *(unsigned __int8 *)(v32 + v8);
LABEL_4:
          swift_endAccess();
          LOBYTE(v8) = (v7 & v27) == 0;
          if ((v7 & v27) == 0 || v2 - 1 == v6++) {
            return (char)v8;
          }
          continue;
        }
        __break(1u);
        return (char)v8;
      case 3uLL:
        goto LABEL_44;
      default:
        if (v24 >= BYTE6(v28)) {
          goto LABEL_37;
        }
        __int16 v39 = v4[9];
        char v40 = BYTE2(v29);
        char v41 = BYTE3(v29);
        char v42 = BYTE4(v29);
        char v43 = BYTE5(v29);
        char v44 = BYTE6(v29);
        char v45 = HIBYTE(v29);
        __int16 v46 = v28;
        char v47 = BYTE2(v28);
        char v48 = BYTE3(v28);
        char v49 = BYTE4(v28);
        char v50 = BYTE5(v28);
        int v7 = *((unsigned __int8 *)&v39 + v24);
        goto LABEL_4;
    }
  }
}

uint64_t BloomFilterReaderWriter.deinit()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  sub_1B005540C(*(void *)(v0 + 72), *(void *)(v0 + 80));
  return v0;
}

uint64_t BloomFilterReaderWriter.__deallocating_deinit()
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  sub_1B005540C(*(void *)(v0 + 72), *(void *)(v0 + 80));

  return MEMORY[0x1F4186488](v0, 88, 7);
}

uint64_t sub_1B0055DF8(uint64_t a1, uint64_t a2)
{
  return BloomFilterReaderWriter.contains(_:)(*(Swift::String *)&a1);
}

void sub_1B0055E1C(uint64_t a1, uint64_t a2)
{
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

unint64_t sub_1B0055ED8()
{
  unint64_t result = qword_1E9B17728;
  if (!qword_1E9B17728)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B17728);
  }
  return result;
}

uint64_t type metadata accessor for BloomFilterReaderWriter()
{
  return self;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for BloomFilterReaderWriter.QueryResult(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for BloomFilterReaderWriter.QueryResult(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B00560BCLL);
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

uint64_t sub_1B00560E4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1B00560F0(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for BloomFilterReaderWriter.QueryResult()
{
  return &type metadata for BloomFilterReaderWriter.QueryResult;
}

uint64_t URLHasher.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  type metadata accessor for StringHasher();
  *(void *)(v0 + 16) = swift_allocObject();
  return v0;
}

uint64_t URLHasher.init()()
{
  type metadata accessor for StringHasher();
  *(void *)(v0 + 16) = swift_allocObject();
  return v0;
}

uint64_t URLHasher.hash(for:maxLength:)(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = sub_1B00593D8();
  uint64_t v5 = _s13NewsURLBucket12StringHasherC4hash3for9maxLength10Foundation4DataVSS_SitF_0(v3, v4, a2);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t URLHasher.deinit()
{
  swift_release();
  return v0;
}

uint64_t URLHasher.__deallocating_deinit()
{
  swift_release();

  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t sub_1B0056234(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = sub_1B00593D8();
  uint64_t v5 = _s13NewsURLBucket12StringHasherC4hash3for9maxLength10Foundation4DataVSS_SitF_0(v3, v4, a2);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t type metadata accessor for URLHasher()
{
  return self;
}

uint64_t URLCanonicalizer.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t URLCanonicalizer.init()()
{
  return v0;
}

uint64_t URLCanonicalizer.canonicalizedURL(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v34 = a2;
  uint64_t v33 = sub_1B0059468();
  uint64_t v3 = *(void *)(v33 - 8);
  MEMORY[0x1F4188790](v33);
  uint64_t v32 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B17730);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v31 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B17738);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1B0059338();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B0059328();
  sub_1B00593D8();
  sub_1B0059318();
  swift_bridgeObjectRelease();
  uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v15 = v14(v9, 1, v10);
  uint64_t v35 = v10;
  if (!v15)
  {
    uint64_t v16 = sub_1B00592E8();
    if (v17)
    {
      uint64_t v40 = v16;
      uint64_t v41 = v17;
      uint64_t v38 = 0x292B3F5C7C2B2F28;
      unint64_t v39 = 0xE900000000000024;
      uint64_t v36 = 0;
      unint64_t v37 = 0xE000000000000000;
      sub_1B0056854();
      sub_1B0059628();
      swift_bridgeObjectRelease();
    }
    uint64_t v10 = v35;
  }
  if (v14(v9, 1, v10)) {
    swift_bridgeObjectRelease();
  }
  else {
    sub_1B00592F8();
  }
  uint64_t v18 = (uint64_t)v31;
  sub_1B0059448();
  if (v19)
  {
    sub_1B0059568();
    swift_bridgeObjectRelease();
  }
  sub_1B0059308();
  sub_1B0059438();
  sub_1B00592D8();
  uint64_t v20 = sub_1B0059408();
  if (v21)
  {
    uint64_t v20 = sub_1B0059568();
    uint64_t v23 = v22;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v23 = 0;
  }
  uint64_t v24 = v35;
  MEMORY[0x1B3E8F300](v20, v23);
  if (sub_1B0059418() == 47 && v25 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v26 = sub_1B0059668();
    swift_bridgeObjectRelease();
    if ((v26 & 1) == 0)
    {
      sub_1B0059418();
      sub_1B00592B8();
    }
  }
  sub_1B0059428();
  sub_1B00592C8();
  sub_1B0059298();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v24);
  unint64_t v28 = v32;
  uint64_t v27 = v33;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v32, a1, v33);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v18, 1, v27) == 1)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v34, v28, v27);
    sub_1B00567F8(v18, &qword_1E9B17730);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v28, v27);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v34, v18, v27);
  }
  return sub_1B00567F8((uint64_t)v9, &qword_1E9B17738);
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

uint64_t sub_1B00567F8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_1B0056854()
{
  unint64_t result = qword_1E9B17740;
  if (!qword_1E9B17740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B17740);
  }
  return result;
}

uint64_t URLCanonicalizer.deinit()
{
  return v0;
}

uint64_t URLCanonicalizer.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t sub_1B00568C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return URLCanonicalizer.canonicalizedURL(for:)(a1, a2);
}

uint64_t type metadata accessor for URLCanonicalizer()
{
  return self;
}

id sub_1B00568FC()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28FD8]);
  id result = sub_1B0056F48(0xD00000000000002DLL, 0x80000001B005A4F0, 1);
  qword_1E9B17748 = (uint64_t)result;
  return result;
}

unint64_t sub_1B0056974()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B17730);
  MEMORY[0x1F4188790](v0 - 8);
  int v2 = (char *)v29 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1B0059468();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B00593D8();
  uint64_t v7 = sub_1B0059568();
  unint64_t v9 = v8;
  swift_bridgeObjectRelease();
  if (qword_1E9B17720 != -1) {
    swift_once();
  }
  uint64_t v10 = (void *)qword_1E9B17748;
  if (qword_1E9B17748)
  {
    swift_bridgeObjectRetain();
    id v11 = v10;
    uint64_t v12 = sub_1B00595F8();
    swift_bridgeObjectRelease();
    uint64_t v13 = (void *)sub_1B0059548();
    id v14 = objc_msgSend(v11, sel_firstMatchInString_options_range_, v13, 0, 0, v12);

    if (v14)
    {
    }
    else
    {
      uint64_t v30 = v7;
      unint64_t v31 = v9;
      v29[2] = 0x292F2F2A2E285ELL;
      v29[3] = 0xE700000000000000;
      v29[0] = 0;
      v29[1] = 0xE000000000000000;
      sub_1B0056854();
      sub_1B0059628();
      swift_bridgeObjectRelease();
      uint64_t v30 = 0x2F2F3A70747468;
      unint64_t v31 = 0xE700000000000000;
      sub_1B0059598();
      swift_bridgeObjectRelease();
    }
  }
  sub_1B0059458();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_1B0056D80((uint64_t)v2);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
  uint64_t v16 = sub_1B0059408();
  unint64_t v18 = v17;
  if (!v17)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return 0;
  }
  uint64_t v15 = v16;
  swift_bridgeObjectRetain();
  char v19 = sub_1B0056DE0();
  swift_bridgeObjectRelease();
  if ((v19 & 1) == 0)
  {
LABEL_15:
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return v15;
  }
  unint64_t result = sub_1B0059588();
  uint64_t v21 = HIBYTE(v18) & 0xF;
  if ((v18 & 0x2000000000000000) == 0) {
    uint64_t v21 = v15 & 0xFFFFFFFFFFFFLL;
  }
  if (4 * v21 >= result >> 14)
  {
    uint64_t v22 = sub_1B0059618();
    uint64_t v24 = v23;
    uint64_t v26 = v25;
    uint64_t v28 = v27;
    swift_bridgeObjectRelease();
    uint64_t v15 = MEMORY[0x1B3E8F5D0](v22, v24, v26, v28);
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

uint64_t sub_1B0056D80(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B17730);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B0056DE0()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v0 = sub_1B00595A8();
  if (v1)
  {
    uint64_t v2 = v0;
    uint64_t v3 = v1;
    do
    {
      uint64_t v6 = sub_1B00595A8();
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
        char v4 = sub_1B0059668();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v4 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      uint64_t v2 = sub_1B00595A8();
      uint64_t v3 = v5;
    }
    while (v5);
  }
  swift_bridgeObjectRelease();
  sub_1B00595A8();
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  BOOL v10 = v9 == 0;
  swift_bridgeObjectRelease();
  return v10;
}

id sub_1B0056F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v10[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)sub_1B0059548();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithPattern_options_error_, v5, a3, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_1B00593C8();

    swift_willThrow();
  }
  return v6;
}

id ObjCHashBucketer.init()()
{
  return sub_1B0057298(&OBJC_IVAR___NBObjCHashBucketer_hashBucketer, (void (*)(void))type metadata accessor for HashBucketer);
}

uint64_t ObjCURLCanonicalizer.canonicalizedURL(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return URLCanonicalizer.canonicalizedURL(for:)(a1, a2);
}

id ObjCURLCanonicalizer.init()()
{
  return sub_1B0057298(&OBJC_IVAR___NBObjCURLCanonicalizer_urlCanonicalizer, (void (*)(void))type metadata accessor for URLCanonicalizer);
}

id sub_1B0057298(uint64_t *a1, void (*a2)(void))
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = *a1;
  a2(0);
  *(void *)&v2[v6] = swift_allocObject();
  v8.receiver = v2;
  v8.super_class = ObjectType;
  return objc_msgSendSuper2(&v8, sel_init);
}

id sub_1B005732C(char *a1, uint64_t a2, uint64_t *a3, void (*a4)(void))
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = *a3;
  a4(0);
  *(void *)&a1[v8] = swift_allocObject();
  v10.receiver = a1;
  v10.super_class = ObjectType;
  return objc_msgSendSuper2(&v10, sel_init);
}

uint64_t sub_1B00573B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return URLCanonicalizer.canonicalizedURL(for:)(a1, a2);
}

uint64_t ObjCURLHasher.hash(for:maxLength:)(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = sub_1B00593D8();
  uint64_t v5 = _s13NewsURLBucket12StringHasherC4hash3for9maxLength10Foundation4DataVSS_SitF_0(v3, v4, a2);
  swift_bridgeObjectRelease();
  return v5;
}

id ObjCURLHasher.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

id ObjCURLHasher.init()()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = OBJC_IVAR___NBObjCURLHasher_urlHasher;
  type metadata accessor for URLHasher();
  uint64_t v3 = swift_allocObject();
  type metadata accessor for StringHasher();
  *(void *)(v3 + 16) = swift_allocObject();
  *(void *)&v0[v2] = v3;
  v5.receiver = v0;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, sel_init);
}

id ObjCBloomFilterReader.__allocating_init(data:hashFunctionCount:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = (char *)objc_allocWithZone(v3);
  type metadata accessor for StringHasher();
  uint64_t v8 = swift_allocObject();
  uint64_t v15 = type metadata accessor for HashBucketer();
  uint64_t v16 = &protocol witness table for HashBucketer;
  *(void *)&long long v14 = swift_allocObject();
  uint64_t v9 = type metadata accessor for BloomFilterReaderWriter();
  objc_super v10 = (void *)swift_allocObject();
  v10[9] = a1;
  v10[10] = a2;
  id v10[2] = a3;
  v10[3] = v8;
  sub_1B0057D20(&v14, (uint64_t)(v10 + 4));
  id v11 = &v7[OBJC_IVAR___NBObjCBloomFilterReader_bloomFilterReader];
  *((void *)v11 + 3) = v9;
  *((void *)v11 + 4) = &protocol witness table for BloomFilterReaderWriter;
  *(void *)id v11 = v10;
  v13.receiver = v7;
  v13.super_class = v3;
  return objc_msgSendSuper2(&v13, sel_init);
}

id ObjCBloomFilterReader.init(data:hashFunctionCount:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  ObjectType = (objc_class *)swift_getObjectType();
  type metadata accessor for StringHasher();
  uint64_t v8 = swift_allocObject();
  uint64_t v15 = type metadata accessor for HashBucketer();
  uint64_t v16 = &protocol witness table for HashBucketer;
  *(void *)&long long v14 = swift_allocObject();
  uint64_t v9 = type metadata accessor for BloomFilterReaderWriter();
  objc_super v10 = (void *)swift_allocObject();
  v10[9] = a1;
  v10[10] = a2;
  id v10[2] = a3;
  v10[3] = v8;
  sub_1B0057D20(&v14, (uint64_t)(v10 + 4));
  id v11 = &v3[OBJC_IVAR___NBObjCBloomFilterReader_bloomFilterReader];
  *((void *)v11 + 3) = v9;
  *((void *)v11 + 4) = &protocol witness table for BloomFilterReaderWriter;
  *(void *)id v11 = v10;
  v13.receiver = v3;
  v13.super_class = ObjectType;
  return objc_msgSendSuper2(&v13, sel_init);
}

Swift::Bool __swiftcall ObjCBloomFilterReader.maybeContains(_:)(Swift::String a1)
{
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR___NBObjCBloomFilterReader_bloomFilterReader + 24);
  uint64_t v5 = *(void *)(v1 + OBJC_IVAR___NBObjCBloomFilterReader_bloomFilterReader + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v1 + OBJC_IVAR___NBObjCBloomFilterReader_bloomFilterReader), v4);
  return ((*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t))(v5 + 8))(countAndFlagsBits, object, v4, v5) & 1) == 0;
}

void ObjCBloomFilterReader.init()()
{
}

id _s13NewsURLBucket16ObjCHashBucketerCfD_0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

NSString_optional __swiftcall NSURL.nb_domain()()
{
  uint64_t v0 = sub_1B0059468();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B00593F8();
  sub_1B0056974();
  uint64_t v5 = v4;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = sub_1B0059548();
  swift_bridgeObjectRelease();
  return (NSString_optional)v6;
}

id sub_1B0057BF8(void *a1)
{
  uint64_t v2 = sub_1B0059468();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B00593F8();
  id v6 = a1;
  sub_1B0056974();
  uint64_t v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (v8)
  {
    uint64_t v9 = (void *)sub_1B0059548();

    swift_bridgeObjectRelease();
  }
  else
  {

    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t sub_1B0057D20(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t type metadata accessor for ObjCHashBucketer()
{
  return self;
}

uint64_t type metadata accessor for ObjCURLCanonicalizer()
{
  return self;
}

uint64_t type metadata accessor for ObjCURLHasher()
{
  return self;
}

uint64_t type metadata accessor for ObjCBloomFilterReader()
{
  return self;
}

uint64_t StringHasher.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t StringHasher.init()()
{
  return v0;
}

uint64_t sub_1B0057DF0(unint64_t a1, unint64_t a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v40 = a1;
  *((void *)&v40 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9B17778);
  if (swift_dynamicCast())
  {
    sub_1B0057D20(v38, (uint64_t)&v41);
    __swift_project_boxed_opaque_existential_1(&v41, v43);
    sub_1B00593B8();
    swift_bridgeObjectRelease();
    v38[0] = v40;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v41);
    return *(void *)&v38[0];
  }
  uint64_t v39 = 0;
  memset(v38, 0, sizeof(v38));
  sub_1B0059198((uint64_t)v38);
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
        uint64_t v4 = sub_1B0059648();
      }
      if (v4) {
        id v6 = (unsigned char *)(v4 + v5);
      }
      else {
        id v6 = 0;
      }
      uint64_t v7 = (uint64_t *)v4;
    }
    uint64_t v8 = sub_1B0058C38(v7, v6);
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
    uint64_t v11 = sub_1B00595B8();
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
    uint64_t v11 = HIBYTE(v3) & 0xF;
  }
  else {
    uint64_t v11 = v2 & 0xFFFFFFFFFFFFLL;
  }
LABEL_17:
  *(void *)&v38[0] = sub_1B0058C9C(v11);
  *((void *)&v38[0] + 1) = v12;
  MEMORY[0x1F4188790]();
  unint64_t v13 = (unint64_t)sub_1B005841C((void *(*)(uint64_t *__return_ptr, char *, char *))sub_1B00591F8);
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
        sub_1B0059498();
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
      unint64_t v2 = sub_1B005896C(v19, v17, v18);
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
      unint64_t v2 = sub_1B00595E8();
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
        unint64_t v2 = sub_1B0059648();
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
    unint64_t v2 = sub_1B005896C(v19, v17, v18);
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
    unint64_t v2 = sub_1B00595C8();
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
      sub_1B00594A8();
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
    sub_1B00594A8();
    sub_1B0059264(v33, v10);
    goto LABEL_63;
  }
LABEL_58:
  swift_bridgeObjectRelease();
  sub_1B0059264((uint64_t)v8, v10);
LABEL_64:
  swift_bridgeObjectRelease();
  return *(void *)&v38[0];
}

uint64_t sub_1B0058318@<X0>(uint64_t __src@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  if (__src)
  {
    if (a2 - __src >= a3) {
      uint64_t v5 = a3;
    }
    else {
      uint64_t v5 = a2 - __src;
    }
    if (v5)
    {
      if (v5 < 15)
      {
        __src = sub_1B0058A74((unsigned char *)__src, (unsigned char *)(__src + v5));
        unint64_t v7 = v8 & 0xFFFFFFFFFFFFFFLL;
      }
      else
      {
        sub_1B00593A8();
        swift_allocObject();
        uint64_t v6 = sub_1B0059358();
        if ((unint64_t)v5 >= 0x7FFFFFFF)
        {
          sub_1B0059488();
          __src = swift_allocObject();
          *(void *)(__src + 16) = 0;
          *(void *)(__src + 24) = v5;
          unint64_t v7 = v6 | 0x8000000000000000;
        }
        else
        {
          __src = v5 << 32;
          unint64_t v7 = v6 | 0x4000000000000000;
        }
      }
    }
    else
    {
      __src = 0;
      unint64_t v7 = 0xC000000000000000;
    }
  }
  else
  {
    unint64_t v7 = 0xC000000000000000;
  }
  *a4 = __src;
  a4[1] = v7;
  return __src;
}

uint64_t StringHasher.deinit()
{
  return v0;
}

uint64_t StringHasher.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 16, 7);
}

uint64_t sub_1B005840C(unint64_t *a1, uint64_t a2)
{
  return _s13NewsURLBucket12StringHasherC4hash3for9maxLength10Foundation4DataVSS_SitF_0(*a1, a1[1], a2);
}

char *sub_1B005841C(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)uint64_t v1 = xmmword_1B0059E40;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_16;
      }
      if (v11 < (int)v4) {
        goto LABEL_23;
      }
      if (sub_1B0059368() && __OFSUB__((int)v4, sub_1B0059398())) {
        goto LABEL_24;
      }
      sub_1B00593A8();
      swift_allocObject();
      uint64_t v13 = sub_1B0059348();
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
      unint64_t result = sub_1B0058808((int)v4, v11, a1);
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
      sub_1B0059478();
      unint64_t result = sub_1B0058808(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
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
      unint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16);
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
      unint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16 + BYTE6(v3));
      if (!v2) {
        unint64_t result = (char *)v14;
      }
      unint64_t v8 = LODWORD(v16[1]) | ((unint64_t)BYTE4(v16[1]) << 32) | ((unint64_t)BYTE5(v16[1]) << 40) | ((unint64_t)BYTE6(v16[1]) << 48);
      *uint64_t v1 = v16[0];
      v1[1] = v8;
      return result;
  }
  return result;
}

unsigned char *sub_1B0058720@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
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
    unint64_t result = (unsigned char *)sub_1B0058A74(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    unint64_t result = (unsigned char *)sub_1B0058B38((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    unint64_t result = (unsigned char *)sub_1B0058BB4((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

void *sub_1B0058798(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    unint64_t result = a1(&v6, a3, a4 - a3);
    if (v4) {
      return result;
    }
    return (void *)v6;
  }
  unint64_t result = a1(&v6, 0, 0);
  if (!v4) {
    return (void *)v6;
  }
  return result;
}

char *sub_1B0058808(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  unint64_t result = (char *)sub_1B0059368();
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v8 = result;
  unint64_t result = (char *)sub_1B0059398();
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
  uint64_t v12 = sub_1B0059388();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  unint64_t result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

uint64_t sub_1B00588BC(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1B0059368();
  if (!result || (uint64_t result = sub_1B0059398(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_1B0059388();
      sub_1B0059538();
      sub_1B0059124();
      return sub_1B00594E8();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1B005896C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_1B0059608();
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
    uint64_t v5 = MEMORY[0x1B3E8F630](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_1B00589E8@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_1B0059638();
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

uint64_t sub_1B0058A74(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
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

uint64_t sub_1B0058B38(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_1B00593A8();
  swift_allocObject();
  uint64_t result = sub_1B0059358();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_1B0059488();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_1B0058BB4(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_1B00593A8();
  swift_allocObject();
  uint64_t result = sub_1B0059358();
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

unsigned char *sub_1B0058C38(unsigned char *result, unsigned char *a2)
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
      return (unsigned char *)sub_1B0058A74(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (unsigned char *)sub_1B0058B38((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (unsigned char *)sub_1B0058BB4((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_1B0058C9C(uint64_t result)
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
      sub_1B00593A8();
      swift_allocObject();
      sub_1B0059378();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_1B0059488();
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

uint64_t _s13NewsURLBucket12StringHasherC4hash3for9maxLength10Foundation4DataVSS_SitF_0(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v22 = a3;
  v23[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = sub_1B0059538();
  uint64_t v6 = *(void *)(v5 - 8);
  ((void (*)(void))MEMORY[0x1F4188790])();
  unint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1B0059528();
  uint64_t v20 = *(void *)(v9 - 8);
  uint64_t v21 = v9;
  ((void (*)(void))MEMORY[0x1F4188790])();
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_1B0057DF0(a1, a2);
  unint64_t v14 = v13;
  sub_1B0059124();
  sub_1B0059508();
  switch(v14 >> 62)
  {
    case 1uLL:
      if (v12 >> 32 < (int)v12) {
        __break(1u);
      }
      uint64_t v19 = 0;
      sub_1B00553B4(v12, v14);
      sub_1B00588BC((int)v12, v12 >> 32);
      break;
    case 2uLL:
      uint64_t v19 = 0;
      uint64_t v15 = *(void *)(v12 + 16);
      uint64_t v16 = *(void *)(v12 + 24);
      sub_1B00553B4(v12, v14);
      swift_retain();
      swift_retain();
      sub_1B00588BC(v15, v16);
      swift_release();
      swift_release();
      break;
    case 3uLL:
      memset(v23, 0, 14);
      goto LABEL_7;
    default:
      v23[0] = v12;
      LOWORD(v23[1]) = v14;
      BYTE2(v23[1]) = BYTE2(v14);
      BYTE3(v23[1]) = BYTE3(v14);
      BYTE4(v23[1]) = BYTE4(v14);
      BYTE5(v23[1]) = BYTE5(v14);
LABEL_7:
      sub_1B00594E8();
      break;
  }
  sub_1B005540C(v12, v14);
  sub_1B00594F8();
  uint64_t v17 = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  MEMORY[0x1F4188790](v17);
  *(&v19 - 2) = v22;
  sub_1B0059518();
  sub_1B005540C(v12, v14);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v11, v21);
  return v23[0];
}

uint64_t type metadata accessor for StringHasher()
{
  return self;
}

unint64_t sub_1B0059124()
{
  unint64_t result = qword_1E9B17770;
  if (!qword_1E9B17770)
  {
    sub_1B0059538();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9B17770);
  }
  return result;
}

uint64_t sub_1B005917C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_1B0058318(a1, a2, *(void *)(v3 + 16), a3);
}

uint64_t sub_1B0059198(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9B17780);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_1B00591F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *(uint64_t **)(v3 + 16);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  unint64_t result = sub_1B0058798((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_1B0059278, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_1B0059264(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1B005540C(a1, a2);
  }
  return a1;
}

uint64_t sub_1B0059278@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_1B00589E8(a1, a2);
}

uint64_t sub_1B0059298()
{
  return MEMORY[0x1F40E36D8]();
}

uint64_t sub_1B00592A8()
{
  return MEMORY[0x1F40E36F8]();
}

uint64_t sub_1B00592B8()
{
  return MEMORY[0x1F40E3718]();
}

uint64_t sub_1B00592C8()
{
  return MEMORY[0x1F40E3728]();
}

uint64_t sub_1B00592D8()
{
  return MEMORY[0x1F40E3738]();
}

uint64_t sub_1B00592E8()
{
  return MEMORY[0x1F40E3740]();
}

uint64_t sub_1B00592F8()
{
  return MEMORY[0x1F40E3748]();
}

uint64_t sub_1B0059308()
{
  return MEMORY[0x1F40E3760]();
}

uint64_t sub_1B0059318()
{
  return MEMORY[0x1F40E3770]();
}

uint64_t sub_1B0059328()
{
  return MEMORY[0x1F40E37A8]();
}

uint64_t sub_1B0059338()
{
  return MEMORY[0x1F40E37B8]();
}

uint64_t sub_1B0059348()
{
  return MEMORY[0x1F40E37C0]();
}

uint64_t sub_1B0059358()
{
  return MEMORY[0x1F40E37D0]();
}

uint64_t sub_1B0059368()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1B0059378()
{
  return MEMORY[0x1F40E37F0]();
}

uint64_t sub_1B0059388()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1B0059398()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1B00593A8()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t sub_1B00593B8()
{
  return MEMORY[0x1F40E3B70]();
}

uint64_t sub_1B00593C8()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1B00593D8()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1B00593E8()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1B00593F8()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1B0059408()
{
  return MEMORY[0x1F40E4AA0]();
}

uint64_t sub_1B0059418()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1B0059428()
{
  return MEMORY[0x1F40E4AC8]();
}

uint64_t sub_1B0059438()
{
  return MEMORY[0x1F40E4AD0]();
}

uint64_t sub_1B0059448()
{
  return MEMORY[0x1F40E4B00]();
}

uint64_t sub_1B0059458()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_1B0059468()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1B0059478()
{
  return MEMORY[0x1F40E4BC8]();
}

uint64_t sub_1B0059488()
{
  return MEMORY[0x1F40E4C80]();
}

uint64_t sub_1B0059498()
{
  return MEMORY[0x1F40E4CA8]();
}

uint64_t sub_1B00594A8()
{
  return MEMORY[0x1F40E4CD8]();
}

uint64_t sub_1B00594B8()
{
  return MEMORY[0x1F40E4D10]();
}

uint64_t sub_1B00594C8()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1B00594D8()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1B00594E8()
{
  return MEMORY[0x1F40DFF38]();
}

uint64_t sub_1B00594F8()
{
  return MEMORY[0x1F40DFF40]();
}

uint64_t sub_1B0059508()
{
  return MEMORY[0x1F40DFF58]();
}

uint64_t sub_1B0059518()
{
  return MEMORY[0x1F40DFF60]();
}

uint64_t sub_1B0059528()
{
  return MEMORY[0x1F40DFF70]();
}

uint64_t sub_1B0059538()
{
  return MEMORY[0x1F40E04A8]();
}

uint64_t sub_1B0059548()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1B0059558()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1B0059568()
{
  return MEMORY[0x1F4183898]();
}

uint64_t sub_1B0059578()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1B0059588()
{
  return MEMORY[0x1F4183A10]();
}

uint64_t sub_1B0059598()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1B00595A8()
{
  return MEMORY[0x1F4183A78]();
}

uint64_t sub_1B00595B8()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1B00595C8()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1B00595D8()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1B00595E8()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1B00595F8()
{
  return MEMORY[0x1F4183B00]();
}

uint64_t sub_1B0059608()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1B0059618()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1B0059628()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1B0059638()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1B0059648()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1B0059658()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1B0059668()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1B0059678()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1B0059688()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1B0059698()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}