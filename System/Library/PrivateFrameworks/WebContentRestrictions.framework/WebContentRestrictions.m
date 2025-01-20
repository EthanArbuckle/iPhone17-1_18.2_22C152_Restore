void sub_2617A5080(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

double variable initialization expression of BloomFilterShim.filter@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

id BloomFilterShim.__allocating_init(path:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return BloomFilterShim.init(path:)(a1, a2);
}

id BloomFilterShim.init(path:)(uint64_t a1, uint64_t a2)
{
  v26[1] = a1;
  v26[2] = a2;
  uint64_t v3 = type metadata accessor for URL.DirectoryHint();
  uint64_t v4 = *(void *)(v3 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v15 = (char *)v26 - v14;
  uint64_t v16 = (uint64_t)v2 + OBJC_IVAR____TtC22WebContentRestrictions15BloomFilterShim_filter;
  *(_OWORD *)uint64_t v16 = 0u;
  *(_OWORD *)(v16 + 16) = 0u;
  *(void *)(v16 + 32) = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F06E50], v3);
  id v17 = v2;
  URL.init(filePath:directoryHint:relativeTo:)();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  id v18 = objc_allocWithZone(MEMORY[0x263EFF8F8]);
  id v19 = @nonobjc NSData.init(contentsOf:options:)((uint64_t)v13, 0);
  uint64_t v20 = v9;
  uint64_t v21 = specialized Data.init<A>(_:)(v19);
  unint64_t v23 = v22;
  type metadata accessor for PropertyListDecoder();
  swift_allocObject();
  PropertyListDecoder.init()();
  v28[3] = type metadata accessor for BloomFilter();
  v28[4] = lazy protocol witness table accessor for type BloomFilter and conformance BloomFilter(&lazy protocol witness table cache variable for type BloomFilter and conformance BloomFilter);
  lazy protocol witness table accessor for type BloomFilter and conformance BloomFilter(&lazy protocol witness table cache variable for type BloomFilter and conformance BloomFilter);
  dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v20);
  swift_release();
  outlined consume of Data._Representation(v21, v23);
  swift_beginAccess();
  outlined assign with take of MembershipFilter?((uint64_t)v28, v16);
  swift_endAccess();

  v24 = (objc_class *)type metadata accessor for BloomFilterShim();
  v27.receiver = v17;
  v27.super_class = v24;
  return objc_msgSendSuper2(&v27, sel_init);
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

uint64_t specialized Data.init<A>(_:)(void *a1)
{
  v36[5] = *MEMORY[0x263EF8340];
  *(void *)&long long v33 = a1;
  type metadata accessor for NSData();
  id v2 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousBytes);
  if (swift_dynamicCast())
  {
    outlined init with take of ContiguousBytes(v34, (uint64_t)v36);
    __swift_project_boxed_opaque_existential_1(v36, v36[3]);
    dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();

    v34[0] = v33;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
    return *(void *)&v34[0];
  }
  uint64_t v35 = 0;
  memset(v34, 0, sizeof(v34));
  outlined destroy of MembershipFilter?((uint64_t)v34, &demangling cache variable for type metadata for ContiguousBytes?);
  uint64_t v3 = NSData.startIndex.getter();
  uint64_t v4 = NSData.endIndex.getter();
  uint64_t v5 = NSData.startIndex.getter();
  uint64_t v6 = NSData.endIndex.getter();
  if (v3 < v5 || v6 < v3) {
    goto LABEL_39;
  }
  uint64_t v7 = NSData.startIndex.getter();
  uint64_t v8 = NSData.endIndex.getter();
  if (v4 < v7 || v8 < v4) {
    goto LABEL_40;
  }
  if (__OFSUB__(v4, v3))
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  *(void *)&v34[0] = specialized Data._Representation.init(count:)(v4 - v3);
  *((void *)&v34[0] + 1) = v9;
  MEMORY[0x270FA5388]();
  uint64_t v10 = specialized Data._Representation.withUnsafeMutableBytes<A>(_:)((void *(*)(uint64_t *__return_ptr, char *, char *))partial apply for specialized closure #3 in Data.init<A>(_:));
  unsigned __int8 v13 = BYTE14(v34[0]);
  uint64_t v14 = *((void *)&v34[0] + 1) >> 62;
  v15 = v10;
  uint64_t v16 = v11;
  switch(*((void *)&v34[0] + 1) >> 62)
  {
    case 1:
      LODWORD(v17) = DWORD1(v34[0]) - LODWORD(v34[0]);
      if (__OFSUB__(DWORD1(v34[0]), v34[0])) {
        goto LABEL_43;
      }
      uint64_t v17 = (int)v17;
LABEL_13:
      if (v12 != v17)
      {
        if (v14)
        {
          if (v14 == 1) {
            uint64_t v21 = *(uint64_t *)&v34[0] >> 32;
          }
          else {
            uint64_t v21 = *(void *)(*(void *)&v34[0] + 24);
          }
LABEL_33:
          if (v21 >= v12)
          {
            Data._Representation.replaceSubrange(_:with:count:)();
            goto LABEL_35;
          }
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
        }
LABEL_31:
        uint64_t v21 = v13;
        goto LABEL_33;
      }
LABEL_19:
      memset(v36, 0, 15);
      if (v11 == NSData.endIndex.getter()) {
        goto LABEL_35;
      }
      char v22 = NSData.subscript.getter();
      v15 = v15;
      uint64_t v23 = NSData.startIndex.getter();
      uint64_t v24 = NSData.endIndex.getter();

      if (v16 < v23 || v16 >= v24)
      {
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
      LOBYTE(v25) = 0;
      uint64_t v26 = v16 + 1;
      break;
    case 2:
      uint64_t v19 = *(void *)(*(void *)&v34[0] + 16);
      uint64_t v18 = *(void *)(*(void *)&v34[0] + 24);
      BOOL v20 = __OFSUB__(v18, v19);
      uint64_t v17 = v18 - v19;
      if (!v20) {
        goto LABEL_13;
      }
      goto LABEL_44;
    case 3:
      if (!v12) {
        goto LABEL_19;
      }
      uint64_t v21 = 0;
      goto LABEL_33;
    default:
      uint64_t v17 = BYTE14(v34[0]);
      goto LABEL_13;
  }
  while (1)
  {
    *((unsigned char *)v36 + v25) = v22;
    unsigned int v25 = v25 + 1;
    if ((v25 >> 8))
    {
      __break(1u);
LABEL_39:
      __break(1u);
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
    if (v25 == 14)
    {
      Data._Representation.append(contentsOf:)();
      if (v26 == NSData.endIndex.getter()) {
        goto LABEL_35;
      }
      LOBYTE(v25) = 0;
      goto LABEL_28;
    }
    if (v26 == NSData.endIndex.getter()) {
      break;
    }
LABEL_28:
    char v22 = NSData.subscript.getter();
    objc_super v27 = v15;
    uint64_t v28 = NSData.startIndex.getter();
    uint64_t v29 = NSData.endIndex.getter();

    if (v26 >= v28 && v26++ < v29) {
      continue;
    }
    goto LABEL_30;
  }
  Data._Representation.append(contentsOf:)();
LABEL_35:

  return *(void *)&v34[0];
}

uint64_t specialized Data.init<A>(_:)(unint64_t a1, unint64_t a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  *(void *)&long long v40 = a1;
  *((void *)&v40 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousBytes);
  if (swift_dynamicCast())
  {
    outlined init with take of ContiguousBytes(v38, (uint64_t)&v41);
    __swift_project_boxed_opaque_existential_1(&v41, v43);
    dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
    swift_bridgeObjectRelease();
    v38[0] = v40;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v41);
    return *(void *)&v38[0];
  }
  uint64_t v39 = 0;
  memset(v38, 0, sizeof(v38));
  outlined destroy of MembershipFilter?((uint64_t)v38, &demangling cache variable for type metadata for ContiguousBytes?);
  unint64_t v2 = a1;
  unint64_t v3 = a2;
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = a1;
      uint64_t v42 = a2 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v6 = (char *)&v41 + (HIBYTE(a2) & 0xF);
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
        uint64_t v6 = (unsigned char *)(v4 + v5);
      }
      else {
        uint64_t v6 = 0;
      }
      uint64_t v7 = (uint64_t *)v4;
    }
    uint64_t v8 = specialized Data._Representation.init(_:)(v7, v6);
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
  *(void *)&v38[0] = specialized Data._Representation.init(count:)(v11);
  *((void *)&v38[0] + 1) = v12;
  MEMORY[0x270FA5388](*(void *)&v38[0]);
  unint64_t v13 = (unint64_t)specialized Data._Representation.withUnsafeMutableBytes<A>(_:)((void *(*)(uint64_t *__return_ptr, char *, char *))partial apply for specialized closure #3 in Data.init<A>(_:));
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
      unint64_t v2 = _StringGuts._slowEnsureMatchingEncoding(_:)(v19, v17, v18);
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
    unint64_t v2 = _StringGuts._slowEnsureMatchingEncoding(_:)(v19, v17, v18);
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
    outlined consume of Data._Representation?(v33, v10);
    goto LABEL_63;
  }
LABEL_58:
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation?((uint64_t)v8, v10);
LABEL_64:
  swift_bridgeObjectRelease();
  return *(void *)&v38[0];
}

Swift::Bool __swiftcall BloomFilterShim.contains(_:)(Swift::String a1)
{
  object = a1._object;
  unint64_t countAndFlagsBits = a1._countAndFlagsBits;
  uint64_t v4 = v1 + OBJC_IVAR____TtC22WebContentRestrictions15BloomFilterShim_filter;
  swift_beginAccess();
  Swift::Bool result = outlined init with copy of MembershipFilter?(v4, (uint64_t)v11);
  if (v12)
  {
    uint64_t v6 = v13;
    __swift_project_boxed_opaque_existential_1(v11, v12);
    swift_bridgeObjectRetain();
    uint64_t v7 = specialized Data.init<A>(_:)(countAndFlagsBits, (unint64_t)object);
    unint64_t v9 = v8;
    char v10 = (*(uint64_t (**)(void))(v6 + 56))();
    outlined consume of Data._Representation(v7, v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
    return v10 & 1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id BloomFilterShim.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void BloomFilterShim.init()()
{
}

id BloomFilterShim.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BloomFilterShim();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id @nonobjc NSData.init(contentsOf:options:)(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  uint64_t v17 = (NSURL *)*MEMORY[0x263EF8340];
  URL._bridgeToObjectiveC()(v17);
  uint64_t v7 = v6;
  id v16 = 0;
  id v8 = objc_msgSend(v3, sel_initWithContentsOfURL_options_error_, v6, a2, &v16);

  id v9 = v16;
  if (v8)
  {
    uint64_t v10 = type metadata accessor for URL();
    Swift::Int v11 = *(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
    id v12 = v9;
    v11(a1, v10);
  }
  else
  {
    id v13 = v16;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v14 = type metadata accessor for URL();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(a1, v14);
  }
  return v8;
}

uint64_t type metadata accessor for BloomFilterShim()
{
  return self;
}

uint64_t lazy protocol witness table accessor for type BloomFilter and conformance BloomFilter(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for BloomFilter();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

{
  uint64_t result;

  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for BloomFilter();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
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

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    JUMPOUT(0x263E40A00);
  }
  return result;
}

uint64_t outlined assign with take of MembershipFilter?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MembershipFilter?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of MembershipFilter?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MembershipFilter?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
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

uint64_t outlined destroy of MembershipFilter?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

char *specialized Data._Representation.withUnsafeMutableBytes<A>(_:)(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)uint64_t v1 = xmmword_2617AE4B0;
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
      uint64_t result = specialized __DataStorage.withUnsafeMutableBytes<A>(in:apply:)((int)v4, v11, a1);
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
      uint64_t result = specialized __DataStorage.withUnsafeMutableBytes<A>(in:apply:)(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
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

{
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  char *result;
  unint64_t v8;
  uint64_t v9;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void v16[3];

  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)uint64_t v1 = xmmword_2617AE4B0;
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
      uint64_t result = specialized __DataStorage.withUnsafeMutableBytes<A>(in:apply:)((int)v4, v11, a1);
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
      uint64_t result = specialized __DataStorage.withUnsafeMutableBytes<A>(in:apply:)(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
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

unsigned char *closure #1 in Data.init<A>(_:)@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
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
    uint64_t result = (unsigned char *)specialized Data.InlineData.init(_:)(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)specialized Data.LargeSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)specialized Data.InlineSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

void *_sSw17withMemoryRebound2to_q0_xm_q0_SryxGq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lFs5UInt8V_s5NeverOs16IndexingIteratorVySo6NSDataCG_SitTgm5(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
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

void *_sSw17withMemoryRebound2to_q0_xm_q0_SryxGq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lFs5UInt8V_s5NeverOs16IndexingIteratorVySS8UTF8ViewVG_SitTgm5(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
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

char *specialized __DataStorage.withUnsafeMutableBytes<A>(in:apply:)(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
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

{
  uint64_t v3;
  char *result;
  char *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

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

void specialized Sequence._copySequenceContents(initializing:)(void *a1, unsigned char *a2, uint64_t a3)
{
  id v7 = v3;
  uint64_t v8 = NSData.startIndex.getter();

  uint64_t v21 = a2;
  if (!a2 || !a3) {
    goto LABEL_5;
  }
  if (a3 < 0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (v8 == NSData.endIndex.getter())
  {
LABEL_5:
    *a1 = v7;
    a1[1] = v8;
    return;
  }
  char v9 = NSData.subscript.getter();
  id v10 = v7;
  uint64_t v11 = NSData.startIndex.getter();
  uint64_t v12 = NSData.endIndex.getter();

  if (v8 >= v11 && v8 < v12)
  {
    *a2 = v9;
    if (a3 == 1)
    {
      ++v8;
      goto LABEL_5;
    }
    uint64_t v20 = a1;
    uint64_t v13 = 1;
    while (a3 != v13)
    {
      uint64_t v14 = v8 + v13;
      if (v8 + v13 == NSData.endIndex.getter())
      {
        v8 += v13;
        goto LABEL_18;
      }
      char v15 = NSData.subscript.getter();
      id v16 = v10;
      uint64_t v17 = NSData.startIndex.getter();
      uint64_t v18 = NSData.endIndex.getter();

      if (v14 < v17 || v14 >= v18) {
        goto LABEL_20;
      }
      uint64_t v19 = v13 + 1;
      v21[v13] = v15;
      uint64_t v13 = v19;
      if (a3 == v19)
      {
        v8 += v19;
LABEL_18:
        a1 = v20;
        goto LABEL_5;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
LABEL_22:
  __break(1u);
}

uint64_t _StringGuts._slowEnsureMatchingEncoding(_:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
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
    uint64_t v5 = MEMORY[0x263E401B0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t specialized closure #1 in closure #3 in Data.init<A>(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
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

uint64_t specialized Data._Representation.init(count:)(uint64_t result)
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

void *partial apply for specialized closure #3 in Data.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = *(uint64_t **)(v3 + 16);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  uint64_t result = _sSw17withMemoryRebound2to_q0_xm_q0_SryxGq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lFs5UInt8V_s5NeverOs16IndexingIteratorVySS8UTF8ViewVG_SitTgm5((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))partial apply for specialized closure #1 in closure #3 in Data.init<A>(_:), (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

{
  uint64_t v3;
  void *result;
  uint64_t v6;
  uint64_t v7;
  void v8[3];
  uint64_t v9;

  uint64_t v9 = **(void **)(v3 + 16);
  v8[2] = &v9;
  uint64_t result = _sSw17withMemoryRebound2to_q0_xm_q0_SryxGq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lFs5UInt8V_s5NeverOs16IndexingIteratorVySo6NSDataCG_SitTgm5((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))partial apply for specialized closure #1 in closure #3 in Data.init<A>(_:), (uint64_t)v8, a1, a2);
  *a3 = result;
  a3[1] = v6;
  a3[2] = v7;
  return result;
}

uint64_t outlined consume of Data._Representation?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined consume of Data._Representation(a1, a2);
  }
  return a1;
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

uint64_t specialized Data.LargeSlice.init(_:)(uint64_t a1, uint64_t a2)
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

uint64_t specialized Data.InlineSlice.init(_:)(uint64_t a1, uint64_t a2)
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

unsigned char *specialized Data._Representation.init(_:)(unsigned char *result, unsigned char *a2)
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
      return (unsigned char *)specialized Data.InlineData.init(_:)(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (unsigned char *)specialized Data.LargeSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (unsigned char *)specialized Data.InlineSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t outlined init with take of ContiguousBytes(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t partial apply for specialized closure #1 in closure #3 in Data.init<A>(_:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return specialized closure #1 in closure #3 in Data.init<A>(_:)(a1, a2);
}

unint64_t type metadata accessor for NSData()
{
  unint64_t result = lazy cache variable for type metadata for NSData;
  if (!lazy cache variable for type metadata for NSData)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSData);
  }
  return result;
}

void partial apply for specialized closure #1 in closure #3 in Data.init<A>(_:)(unsigned char *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  id v7 = **(id **)(v3 + 16);
  specialized Sequence._copySequenceContents(initializing:)(v10, a1, a2);
  uint64_t v8 = v10[1];
  *a3 = v10[0];
  a3[1] = v8;
  a3[2] = v9;
}

void type metadata accessor for CFMutableBitVectorRef(uint64_t a1)
{
}

uint64_t type metadata completion function for CFMutableBitVectorRef(uint64_t a1)
{
  type metadata accessor for CFBitVectorRef(255);
  *(void *)(a1 + 16) = v2;
  return 0;
}

void type metadata accessor for CFBitVectorRef(uint64_t a1)
{
}

void type metadata accessor for CFMutableBitVectorRef(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance BloomFilterError(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance BloomFilterError()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance BloomFilterError()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance BloomFilterError()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for Error._domain.getter in conformance BloomFilterError()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t protocol witness for Error._code.getter in conformance BloomFilterError()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t protocol witness for Error._userInfo.getter in conformance BloomFilterError()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance BloomFilterError()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t static BloomFilter.predictedNumberOfBits(expectedNumberOfItems:falsePositiveTolerance:)(uint64_t a1, long double a2)
{
  type metadata accessor for BloomFilter();
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = a1;
  uint64_t v7 = v5;
  BloomFilter.init(expectedNumberOfItems:falsePositiveTolerance:allocate:)(v6, 0, a2);
  if (!v2)
  {
    uint64_t v7 = *(void *)(v8 + 32);
    swift_release();
  }
  return v7;
}

uint64_t type metadata accessor for BloomFilter()
{
  return self;
}

void BloomFilter.__allocating_init(expectedNumberOfItems:falsePositiveTolerance:)(uint64_t a1, long double a2)
{
}

void BloomFilter.init(expectedNumberOfItems:falsePositiveTolerance:allocate:)(uint64_t a1, char a2, long double a3)
{
  if (a1 < 1)
  {
    char v5 = 0;
    goto LABEL_20;
  }
  if (a3 <= 0.0 || a3 >= 1.0)
  {
    char v5 = 1;
LABEL_20:
    lazy protocol witness table accessor for type BloomFilterError and conformance BloomFilterError();
    swift_allocError();
    *uint64_t v14 = v5;
    swift_willThrow();
    type metadata accessor for BloomFilter();
    swift_deallocPartialClassInstance();
    return;
  }
  *(void *)(v3 + 16) = a1;
  *(long double *)(v3 + 24) = a3;
  double v7 = (double)a1;
  double v8 = ceil(log(a3) * (double)a1 / -0.480453014);
  if ((~*(void *)&v8 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (v8 <= -9.22337204e18)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v8 >= 9.22337204e18)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v9 = (uint64_t)v8;
  *(void *)(v3 + 32) = (uint64_t)v8;
  double v10 = ceil((double)(uint64_t)v8 / v7 * 0.693147181);
  if ((~*(void *)&v10 & 0x7FF0000000000000) == 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v10 <= -9.22337204e18)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (v10 < 9.22337204e18)
  {
    *(void *)(v3 + 40) = (uint64_t)v10;
    *(_DWORD *)(v3 + 48) = arc4random();
    if (a2) {
      CFIndex v11 = v9;
    }
    else {
      CFIndex v11 = 1;
    }
    Mutable = CFBitVectorCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], v11);
    if (Mutable)
    {
      unint64_t v13 = Mutable;
      CFBitVectorSetCount(Mutable, v11);
      *(void *)(v3 + 56) = v13;
      *(unsigned char *)(v3 + 64) = 1;
      return;
    }
    char v5 = 2;
    goto LABEL_20;
  }
LABEL_26:
  __break(1u);
}

double BloomFilter.falsePositiveProbability.getter()
{
  double v1 = (double)v0[5];
  long double v2 = 1.0 - pow(2.71828183, -(v1 * (double)v0[2]) / (double)v0[4]);
  return pow(v2, v1);
}

void BloomFilter.estimatedCount.getter()
{
  CFIndex v1 = *(void *)(v0 + 32);
  double v2 = (double)v1;
  double v3 = (double)*(uint64_t *)(v0 + 40);
  CFBitVectorRef v4 = (const __CFBitVector *)*(id *)(v0 + 56);
  v7.location = 0;
  v7.length = v1;
  CFIndex CountOfBit = CFBitVectorGetCountOfBit(v4, v7, 1u);

  double v6 = ceil(-v2 / v3 * log(1.0 - (double)CountOfBit / v2));
  if ((~*(void *)&v6 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v6 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v6 >= 9.22337204e18) {
LABEL_7:
  }
    __break(1u);
}

void BloomFilter.description.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_2617AE4A0;
  uint64_t v3 = v0[4];
  uint64_t v2 = v0[5];
  long double v4 = pow(2.71828183, -((double)v2 * (double)v0[2]) / (double)v3);
  long double v5 = pow(1.0 - v4, (double)v2);
  uint64_t v6 = MEMORY[0x263F8D538];
  uint64_t v7 = MEMORY[0x263F8D5B8];
  *(void *)(v1 + 56) = MEMORY[0x263F8D538];
  *(void *)(v1 + 64) = v7;
  *(long double *)(v1 + 32) = v5;
  uint64_t v29 = String.init(format:_:)();
  uint64_t v9 = v8;
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_2617AE4A0;
  uint64_t v11 = v0[3];
  *(void *)(v10 + 56) = v6;
  *(void *)(v10 + 64) = v7;
  *(void *)(v10 + 32) = v11;
  uint64_t v12 = String.init(format:_:)();
  uint64_t v14 = v13;
  _StringGuts.grow(_:)(70);
  v15._unint64_t countAndFlagsBits = 0x3D736D657469;
  v15._object = (void *)0xE600000000000000;
  String.append(_:)(v15);
  BloomFilter.estimatedCount.getter();
  v16._unint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v16);
  swift_bridgeObjectRelease();
  v17._unint64_t countAndFlagsBits = 47;
  v17._object = (void *)0xE100000000000000;
  String.append(_:)(v17);
  v18._unint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v18);
  swift_bridgeObjectRelease();
  v19._unint64_t countAndFlagsBits = 0x3D657A6973202CLL;
  v19._object = (void *)0xE700000000000000;
  String.append(_:)(v19);
  v20._unint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v20);
  swift_bridgeObjectRelease();
  v21._unint64_t countAndFlagsBits = 0x28207374696220;
  v21._object = (void *)0xE700000000000000;
  String.append(_:)(v21);
  if (__OFADD__(v3, 7))
  {
    __break(1u);
  }
  else
  {
    v22._unint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v22);
    swift_bridgeObjectRelease();
    v23._object = (void *)0x80000002617AF280;
    v23._unint64_t countAndFlagsBits = 0xD000000000000010;
    String.append(_:)(v23);
    v24._unint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v24);
    swift_bridgeObjectRelease();
    v25._unint64_t countAndFlagsBits = 0xD000000000000012;
    v25._object = (void *)0x80000002617AF2A0;
    String.append(_:)(v25);
    v26._unint64_t countAndFlagsBits = v29;
    v26._object = v9;
    String.append(_:)(v26);
    swift_bridgeObjectRelease();
    v27._unint64_t countAndFlagsBits = 47;
    v27._object = (void *)0xE100000000000000;
    String.append(_:)(v27);
    v28._unint64_t countAndFlagsBits = v12;
    v28._object = v14;
    String.append(_:)(v28);
    swift_bridgeObjectRelease();
  }
}

uint64_t BloomFilter.insert(_:)(uint64_t result, unint64_t a2)
{
  if (*(unsigned char *)(v2 + 64) == 1)
  {
    uint64_t v4 = result;
    long double v5 = (__CFBitVector *)*(id *)(v2 + 56);
    uint64_t v6 = BloomFilter.indexes(for:)(v4, a2);
    uint64_t v7 = *(void *)(v6 + 16);
    if (v7)
    {
      double v8 = (CFIndex *)(v6 + 32);
      do
      {
        CFIndex v9 = *v8++;
        CFBitVectorSetBitAtIndex(v5, v9, 1u);
        --v7;
      }
      while (v7);
    }

    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t BloomFilter.contains(_:)(uint64_t a1, unint64_t a2)
{
  CFBitVectorRef v5 = (const __CFBitVector *)*(id *)(v2 + 56);
  uint64_t v6 = BloomFilter.indexes(for:)(a1, a2);
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 + 16);
  if (v8)
  {
    uint64_t result = CFBitVectorGetBitAtIndex(v5, *(void *)(v6 + 32));
    if (result)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8 - 1;
      do
      {
        BOOL v12 = v11 == v10;
        if (v11 == v10) {
          break;
        }
        if ((unint64_t)(v10 + 1) >= *(void *)(v7 + 16))
        {
          __break(1u);
          return result;
        }
        uint64_t result = CFBitVectorGetBitAtIndex(v5, *(void *)(v7 + 40 + 8 * v10++));
      }
      while (result);
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 1;
  }

  swift_bridgeObjectRelease();
  return v12;
}

uint64_t BloomFilter.indexes(for:)(uint64_t a1, unint64_t a2)
{
  unsigned int v5 = specialized static FNVHash.hash(_:)(a1, a2);
  int v6 = specialized static MurmurHash3.hash(_:seed:)(a1, a2, *(_DWORD *)(v2 + 48));
  unint64_t v7 = *(void *)(v2 + 32);
  if ((v7 & 0x8000000000000000) == 0 && !HIDWORD(v7))
  {
    unint64_t v8 = *(void *)(v2 + 40);
    if ((v8 & 0x8000000000000000) == 0 && !HIDWORD(v8))
    {
      if (!v8) {
        return MEMORY[0x263F8EE78];
      }
      if (v7)
      {
        int v9 = v6;
        uint64_t v10 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, 1, 1, MEMORY[0x263F8EE78]);
        do
        {
          unint64_t v12 = v10[2];
          unint64_t v11 = v10[3];
          if (v12 >= v11 >> 1) {
            uint64_t v10 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v11 > 1), v12 + 1, 1, v10);
          }
          void v10[2] = v12 + 1;
          v10[v12 + 4] = v5 % v7;
          v5 += v9;
          LODWORD(v8) = v8 - 1;
        }
        while (v8);
        return (uint64_t)v10;
      }
      __break(1u);
    }
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t BloomFilter.CodingKeys.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000016;
      break;
    case 2:
    case 3:
      unint64_t result = 0x664F7265626D756ELL;
      break;
    case 4:
      unint64_t result = 0x655372756D72756DLL;
      break;
    case 5:
      unint64_t result = 0x6F74636556746962;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t BloomFilter.CodingKeys.stringValue.getter(char a1)
{
  unint64_t result = 0xD000000000000015;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000016;
      break;
    case 2:
    case 3:
      unint64_t result = 0x664F7265626D756ELL;
      break;
    case 4:
      unint64_t result = 0x655372756D72756DLL;
      break;
    case 5:
      unint64_t result = 0x6F74636556746962;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance BloomFilter.CodingKeys(unsigned __int8 *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

uint64_t specialized == infix<A>(_:_:)(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000015;
  unint64_t v3 = 0x80000002617AF150;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000015;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0xD000000000000016;
      unint64_t v3 = 0x80000002617AF170;
      break;
    case 2:
      unint64_t v5 = 0x664F7265626D756ELL;
      unint64_t v3 = 0xEC00000073746942;
      break;
    case 3:
      unint64_t v5 = 0x664F7265626D756ELL;
      unint64_t v3 = 0xEE00736568736148;
      break;
    case 4:
      unint64_t v5 = 0x655372756D72756DLL;
      unint64_t v3 = 0xEA00000000006465;
      break;
    case 5:
      unint64_t v5 = 0x6F74636556746962;
      unint64_t v3 = 0xED00006174614472;
      break;
    default:
      break;
  }
  unint64_t v6 = 0x80000002617AF150;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0x80000002617AF170;
      if (v5 == 0xD000000000000016) {
        goto LABEL_16;
      }
      goto LABEL_19;
    case 2:
      unint64_t v6 = 0xEC00000073746942;
      if (v5 != 0x664F7265626D756ELL) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 3:
      unint64_t v6 = 0xEE00736568736148;
      if (v5 != 0x664F7265626D756ELL) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 4:
      unint64_t v2 = 0x655372756D72756DLL;
      unint64_t v6 = 0xEA00000000006465;
      goto LABEL_15;
    case 5:
      unint64_t v6 = 0xED00006174614472;
      if (v5 != 0x6F74636556746962) {
        goto LABEL_19;
      }
      goto LABEL_16;
    default:
LABEL_15:
      if (v5 != v2) {
        goto LABEL_19;
      }
LABEL_16:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_19:
      }
        char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance BloomFilter.CodingKeys()
{
  return specialized RawRepresentable<>.hashValue.getter();
}

Swift::Int specialized RawRepresentable<>.hashValue.getter()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance BloomFilter.CodingKeys()
{
  return specialized RawRepresentable<>.hash(into:)();
}

uint64_t specialized RawRepresentable<>.hash(into:)()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance BloomFilter.CodingKeys()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)()
{
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance BloomFilter.CodingKeys@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized BloomFilter.CodingKeys.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

unint64_t protocol witness for RawRepresentable.rawValue.getter in conformance BloomFilter.CodingKeys@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = BloomFilter.CodingKeys.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance BloomFilter.CodingKeys()
{
  return BloomFilter.CodingKeys.stringValue.getter(*v0);
}

unint64_t protocol witness for CodingKey.init(stringValue:) in conformance BloomFilter.CodingKeys@<X0>(Swift::String a1@<X1:X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized BloomFilter.CodingKeys.init(rawValue:)(a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance BloomFilter.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance BloomFilter.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance BloomFilter.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance BloomFilter.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t BloomFilter.__allocating_init(from:)(void *a1)
{
  uint64_t v2 = swift_allocObject();
  BloomFilter.init(from:)(a1);
  return v2;
}

uint64_t BloomFilter.init(from:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v53 = *MEMORY[0x263EF8340];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<BloomFilter.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    goto LABEL_9;
  }
  LOBYTE(bytes) = 0;
  uint64_t v9 = KeyedDecodingContainer.decode(_:forKey:)();
  if (v9 < 1) {
    goto LABEL_7;
  }
  *(void *)(v1 + 16) = v9;
  LOBYTE(bytes) = 1;
  KeyedDecodingContainer.decode(_:forKey:)();
  BOOL v11 = v10 > 0.0 && v10 < 1.0;
  if (!v11
    || (*(double *)(v1 + 24) = v10,
        LOBYTE(bytes) = 2,
        uint64_t v14 = KeyedDecodingContainer.decode(_:forKey:)(),
        CFIndex v15 = v14,
        v14 < 1)
    || (*(void *)(v1 + 32) = v14, LOBYTE(bytes) = 3, uint64_t v16 = KeyedDecodingContainer.decode(_:forKey:)(), v16 < 1))
  {
LABEL_7:
    lazy protocol witness table accessor for type BloomFilterError and conformance BloomFilterError();
    swift_allocError();
    *unint64_t v12 = 3;
    swift_willThrow();
LABEL_8:
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
LABEL_9:
    type metadata accessor for BloomFilter();
    swift_deallocPartialClassInstance();
    goto LABEL_10;
  }
  *(void *)(v1 + 40) = v16;
  LOBYTE(bytes) = 4;
  *(_DWORD *)(v1 + 48) = KeyedDecodingContainer.decode(_:forKey:)();
  LOBYTE(v50) = 5;
  lazy protocol witness table accessor for type Data and conformance Data();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v17 = 0;
  unint64_t v48 = *((void *)&bytes + 1);
  uint64_t v49 = bytes;
  switch(*((void *)&bytes + 1) >> 62)
  {
    case 1:
      LODWORD(v17) = DWORD1(bytes) - bytes;
      if (__OFSUB__(DWORD1(bytes), bytes)) {
        goto LABEL_47;
      }
      uint64_t v17 = (int)v17;
LABEL_18:
      unint64_t v21 = v15 + 7;
      if (__OFADD__(v15, 7))
      {
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
        JUMPOUT(0x2617AB980);
      }
      unint64_t v22 = v21 >> 3;
      if (v17 != v21 >> 3)
      {
        uint64_t v47 = *((void *)&bytes + 1) >> 62;
        int v23 = static os_log_type_t.error.getter();
        type metadata accessor for OS_os_log();
        outlined copy of Data._Representation(v49, v48);
        Swift::String v24 = static OS_os_log.default.getter();
        LODWORD(v46) = v23;
        if (os_log_type_enabled(v24, (os_log_type_t)v23))
        {
          uint64_t v25 = swift_slowAlloc();
          *(_DWORD *)uint64_t v25 = 134218240;
          *(void *)&long long bytes = v22;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *(_WORD *)(v25 + 12) = 2048;
          uint64_t v26 = 0;
          switch((int)v47)
          {
            case 1:
              LODWORD(v26) = HIDWORD(v49) - v49;
              if (__OFSUB__(HIDWORD(v49), v49)) {
                goto LABEL_53;
              }
              uint64_t v26 = (int)v26;
LABEL_39:
              *(void *)&long long bytes = v26;
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              unint64_t v28 = v48;
              uint64_t v27 = v49;
              outlined consume of Data._Representation(v49, v48);
              _os_log_impl(&dword_2617A2000, v24, (os_log_type_t)v46, "Invalid serialized bit vector:  expected %ld bytes, found %ld", (uint8_t *)v25, 0x16u);
              MEMORY[0x263E40A00](v25, -1, -1);

              break;
            case 2:
              uint64_t v38 = *(void *)(v49 + 16);
              uint64_t v37 = *(void *)(v49 + 24);
              BOOL v20 = __OFSUB__(v37, v38);
              uint64_t v26 = v37 - v38;
              if (!v20) {
                goto LABEL_39;
              }
              goto LABEL_54;
            case 3:
              goto LABEL_39;
            default:
              uint64_t v26 = BYTE6(v48);
              goto LABEL_39;
          }
        }
        else
        {

          unint64_t v28 = v48;
          uint64_t v27 = v49;
          outlined consume of Data._Representation(v49, v48);
        }
        lazy protocol witness table accessor for type BloomFilterError and conformance BloomFilterError();
        swift_allocError();
        *uint64_t v39 = 3;
        swift_willThrow();
        outlined consume of Data._Representation(v27, v28);
        goto LABEL_8;
      }
      switch(*((void *)&bytes + 1) >> 62)
      {
        case 1:
          uint64_t v46 = (int)v49;
          uint64_t v47 = (v49 >> 32) - (int)v49;
          if (v49 >> 32 < (int)v49) {
            goto LABEL_49;
          }
          outlined copy of Data._Representation(v49, v48);
          uint64_t v29 = (UInt8 *)__DataStorage._bytes.getter();
          if (!v29) {
            goto LABEL_30;
          }
          uint64_t v30 = __DataStorage._offset.getter();
          if (__OFSUB__(v46, v30)) {
            goto LABEL_52;
          }
          v29 += v46 - v30;
LABEL_30:
          __DataStorage._length.getter();
          closure #1 in BloomFilter.init(from:)(v29, v15, (uint64_t)&bytes);
          unint64_t v40 = v48;
          uint64_t v41 = v49;
          outlined consume of Data._Representation(v49, v48);
          uint64_t v42 = v41;
          unint64_t v43 = v40;
          goto LABEL_44;
        case 2:
          uint64_t v31 = *(void *)(v49 + 16);
          uint64_t v46 = *(void *)(v49 + 24);
          uint64_t v47 = v31;
          swift_retain();
          swift_retain();
          uint64_t v32 = __DataStorage._bytes.getter();
          if (v32)
          {
            uint64_t v33 = v32;
            uint64_t v34 = __DataStorage._offset.getter();
            if (__OFSUB__(v47, v34)) {
              goto LABEL_51;
            }
            v45 = (UInt8 *)(v33 + v47 - v34);
          }
          else
          {
            v45 = 0;
          }
          if (__OFSUB__(v46, v47)) {
            goto LABEL_50;
          }
          __DataStorage._length.getter();
          closure #1 in BloomFilter.init(from:)(v45, v15, (uint64_t)&bytes);
          swift_release();
          uint64_t v44 = v49;
          swift_release();
          uint64_t v42 = v44;
          unint64_t v43 = v48;
LABEL_44:
          outlined consume of Data._Representation(v42, v43);
          uint64_t v35 = bytes;
          char v36 = BYTE8(bytes);
LABEL_45:
          (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
          *(void *)(v3 + 56) = v35;
          *(unsigned char *)(v3 + 64) = v36;
LABEL_10:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
          return v3;
        case 3:
          *(void *)((char *)&bytes + 6) = 0;
          *(void *)&long long bytes = 0;
          goto LABEL_35;
        default:
          *(void *)&long long bytes = v49;
          DWORD2(bytes) = v48;
          WORD6(bytes) = WORD2(v48);
LABEL_35:
          closure #1 in BloomFilter.init(from:)((UInt8 *)&bytes, v15, (uint64_t)&v50);
          outlined consume of Data._Representation(v49, v48);
          uint64_t v35 = v50;
          char v36 = v51;
          goto LABEL_45;
      }
    case 2:
      uint64_t v19 = *(void *)(bytes + 16);
      uint64_t v18 = *(void *)(bytes + 24);
      BOOL v20 = __OFSUB__(v18, v19);
      uint64_t v17 = v18 - v19;
      if (!v20) {
        goto LABEL_18;
      }
      goto LABEL_48;
    case 3:
      goto LABEL_18;
    default:
      uint64_t v17 = BYTE14(bytes);
      goto LABEL_18;
  }
}

CFBitVectorRef closure #1 in BloomFilter.init(from:)@<X0>(UInt8 *bytes@<X0>, CFIndex a2@<X2>, uint64_t a3@<X8>)
{
  CFBitVectorRef result = CFBitVectorCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, a2);
  if (result)
  {
    *(void *)a3 = result;
    *(unsigned char *)(a3 + 8) = 0;
  }
  else
  {
    os_log_type_t v5 = static os_log_type_t.error.getter();
    type metadata accessor for OS_os_log();
    uint64_t v6 = static OS_os_log.default.getter();
    os_log_type_t v7 = v5;
    if (os_log_type_enabled(v6, v5))
    {
      unint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)unint64_t v8 = 134217984;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_2617A2000, v6, v7, "Invalid serialized bit vector:  too many bits? %ld", v8, 0xCu);
      MEMORY[0x263E40A00](v8, -1, -1);
    }

    lazy protocol witness table accessor for type BloomFilterError and conformance BloomFilterError();
    swift_allocError();
    *uint64_t v9 = 3;
    return (CFBitVectorRef)swift_willThrow();
  }
  return result;
}

uint64_t BloomFilter.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<BloomFilter.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = &v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v21) = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (v2) {
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
  }
  LOBYTE(v21) = 1;
  KeyedEncodingContainer.encode(_:forKey:)();
  uint64_t v9 = *(void *)(v3 + 32);
  LOBYTE(v21) = 2;
  KeyedEncodingContainer.encode(_:forKey:)();
  LOBYTE(v21) = 3;
  KeyedEncodingContainer.encode(_:forKey:)();
  LOBYTE(v21) = 4;
  uint64_t result = KeyedEncodingContainer.encode(_:forKey:)();
  uint64_t v11 = v9 + 7;
  if (!__OFADD__(v9, 7))
  {
    if (v11 < 0) {
      uint64_t v11 = v9 + 14;
    }
    uint64_t v12 = v11 >> 3;
    id v13 = *(id *)(v3 + 56);
    uint64_t v21 = specialized Data._Representation.init(count:)(v12);
    unint64_t v22 = v14;
    CFBitVectorRef v15 = (const __CFBitVector *)v13;
    swift_retain();
    specialized Data._Representation.withUnsafeMutableBytes<A>(_:)(&v21, v15, v3);
    uint64_t v16 = v21;
    unint64_t v17 = v22;
    uint64_t v19 = v21;
    unint64_t v20 = v22;
    v18[15] = 5;
    outlined copy of Data._Representation(v21, v22);
    lazy protocol witness table accessor for type Data and conformance Data();
    KeyedEncodingContainer.encode<A>(_:forKey:)();

    outlined consume of Data._Representation(v16, v17);
    outlined consume of Data._Representation(v16, v17);
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
  }
  __break(1u);
  return result;
}

uint64_t BloomFilter.deinit()
{
  return v0;
}

uint64_t BloomFilter.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 65, 7);
}

uint64_t protocol witness for static MembershipFilter.predictedNumberOfBits(expectedNumberOfItems:falsePositiveTolerance:) in conformance BloomFilter(uint64_t a1, long double a2)
{
  type metadata accessor for BloomFilter();
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = a1;
  uint64_t v7 = v5;
  BloomFilter.init(expectedNumberOfItems:falsePositiveTolerance:allocate:)(v6, 0, a2);
  if (!v2)
  {
    uint64_t v7 = *(void *)(v8 + 32);
    swift_release();
  }
  return v7;
}

void protocol witness for MembershipFilter.init(expectedNumberOfItems:falsePositiveTolerance:) in conformance BloomFilter(uint64_t a1@<X0>, void *a2@<X8>, long double a3@<D0>)
{
  type metadata accessor for BloomFilter();
  swift_allocObject();
  BloomFilter.init(expectedNumberOfItems:falsePositiveTolerance:allocate:)(a1, 1, a3);
  if (!v3) {
    *a2 = v7;
  }
}

uint64_t protocol witness for MembershipFilter.insert(_:) in conformance BloomFilter(uint64_t a1, unint64_t a2)
{
  return BloomFilter.insert(_:)(a1, a2);
}

uint64_t protocol witness for MembershipFilter.contains(_:) in conformance BloomFilter(uint64_t a1, unint64_t a2)
{
  return BloomFilter.contains(_:)(a1, a2) & 1;
}

uint64_t protocol witness for Decodable.init(from:) in conformance BloomFilter@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  type metadata accessor for BloomFilter();
  uint64_t v5 = swift_allocObject();
  uint64_t result = BloomFilter.init(from:)(a1);
  if (!v2) {
    *a2 = v5;
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance BloomFilter(void *a1)
{
  return BloomFilter.encode(to:)(a1);
}

void protocol witness for CustomStringConvertible.description.getter in conformance BloomFilter()
{
}

void *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<Int>);
      double v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      id v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      double v10 = (void *)MEMORY[0x263F8EE78];
      id v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys;
  if (!lazy protocol witness table cache variable for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys;
  if (!lazy protocol witness table cache variable for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys;
  if (!lazy protocol witness table cache variable for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys;
  if (!lazy protocol witness table cache variable for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BloomFilter.CodingKeys and conformance BloomFilter.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type BloomFilterError and conformance BloomFilterError()
{
  unint64_t result = lazy protocol witness table cache variable for type BloomFilterError and conformance BloomFilterError;
  if (!lazy protocol witness table cache variable for type BloomFilterError and conformance BloomFilterError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BloomFilterError and conformance BloomFilterError);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type BloomFilterError and conformance BloomFilterError;
  if (!lazy protocol witness table cache variable for type BloomFilterError and conformance BloomFilterError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BloomFilterError and conformance BloomFilterError);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Data and conformance Data()
{
  unint64_t result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }
  return result;
}

unint64_t type metadata accessor for OS_os_log()
{
  unint64_t result = lazy cache variable for type metadata for OS_os_log;
  if (!lazy cache variable for type metadata for OS_os_log)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_os_log);
  }
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

uint64_t specialized Data._Representation.withUnsafeMutableBytes<A>(_:)(void *a1, CFBitVectorRef bv, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  unint64_t v3 = a1[1];
  switch(v3 >> 62)
  {
    case 1uLL:
      *(void *)&long long bytes = *a1;
      *((void *)&bytes + 1) = v3 & 0x3FFFFFFFFFFFFFFFLL;
      swift_retain();
      CFBitVectorRef v13 = bv;
      specialized Data.InlineSlice.withUnsafeMutableBytes<A>(_:)((int *)&bytes, v13, a3);

      uint64_t v14 = *((void *)&bytes + 1) | 0x4000000000000000;
      *a1 = bytes;
      a1[1] = v14;
      return swift_release();
    case 2uLL:
      *(void *)&long long bytes = *a1;
      *((void *)&bytes + 1) = v3 & 0x3FFFFFFFFFFFFFFFLL;
      CFBitVectorRef v15 = bv;
      Data.LargeSlice.ensureUniqueReference()();
      uint64_t v16 = *((void *)&bytes + 1);
      uint64_t v17 = *(void *)(bytes + 16);
      uint64_t v18 = *(void *)(bytes + 24);
      uint64_t v19 = __DataStorage._bytes.getter();
      if (!v19)
      {

        __break(1u);
        JUMPOUT(0x2617AC4A8);
      }
      uint64_t v20 = v19;
      uint64_t v21 = __DataStorage._offset.getter();
      uint64_t v22 = v17 - v21;
      if (__OFSUB__(v17, v21))
      {
        __break(1u);
LABEL_11:
        __break(1u);
      }
      if (__OFSUB__(v18, v17)) {
        goto LABEL_11;
      }
      __DataStorage._length.getter();
      v28.length = *(void *)(a3 + 32);
      v28.location = 0;
      CFBitVectorGetBits(v15, v28, (UInt8 *)(v20 + v22));

      *a1 = bytes;
      a1[1] = v16 | 0x8000000000000000;
      return swift_release();
    case 3uLL:
      *(void *)((char *)&bytes + 7) = 0;
      *(void *)&long long bytes = 0;
      v29.length = *(void *)(a3 + 32);
      v29.location = 0;
      CFBitVectorGetBits(bv, v29, (UInt8 *)&bytes);

      return swift_release();
    default:
      *(void *)&long long bytes = *a1;
      WORD4(bytes) = v3;
      BYTE10(bytes) = BYTE2(v3);
      BYTE11(bytes) = BYTE3(v3);
      BYTE12(bytes) = BYTE4(v3);
      BYTE13(bytes) = BYTE5(v3);
      BYTE14(bytes) = BYTE6(v3);
      v27.length = *(void *)(a3 + 32);
      v27.location = 0;
      CFBitVectorGetBits(bv, v27, (UInt8 *)&bytes);
      uint64_t v8 = bytes;
      uint64_t v9 = DWORD2(bytes);
      uint64_t v10 = BYTE12(bytes);
      uint64_t v11 = BYTE13(bytes);
      uint64_t v12 = BYTE14(bytes);

      *a1 = v8;
      a1[1] = v9 | (v10 << 32) | (v11 << 40) | (v12 << 48);
      return swift_release();
  }
}

void specialized Data.InlineSlice.withUnsafeMutableBytes<A>(_:)(int *a1, const __CFBitVector *a2, uint64_t a3)
{
  Data.InlineSlice.ensureUniqueReference()();
  uint64_t v6 = *a1;
  if (a1[1] < (int)v6)
  {
    __break(1u);
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v7 = __DataStorage._bytes.getter();
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = __DataStorage._offset.getter();
    BOOL v10 = __OFSUB__(v6, v9);
    uint64_t v11 = v6 - v9;
    if (!v10)
    {
      __DataStorage._length.getter();
      v12.length = *(void *)(a3 + 32);
      v12.location = 0;
      CFBitVectorGetBits(a2, v12, (UInt8 *)(v8 + v11));
      swift_release();

      return;
    }
    goto LABEL_6;
  }
LABEL_7:
  __break(1u);
}

char *specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t specialized BloomFilter.CodingKeys.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._unint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of BloomFilter.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 6) {
    return 6;
  }
  else {
    return v3;
  }
}

uint64_t instantiation function for generic protocol witness table for BloomFilter(void *a1)
{
  a1[1] = lazy protocol witness table accessor for type BloomFilter and conformance BloomFilter(&lazy protocol witness table cache variable for type BloomFilter and conformance BloomFilter);
  a1[2] = lazy protocol witness table accessor for type BloomFilter and conformance BloomFilter(&lazy protocol witness table cache variable for type BloomFilter and conformance BloomFilter);
  uint64_t result = lazy protocol witness table accessor for type BloomFilter and conformance BloomFilter(&lazy protocol witness table cache variable for type BloomFilter and conformance BloomFilter);
  a1[3] = result;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for BloomFilter.BitVector(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void **)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  id v5 = v3;
  return a1;
}

void destroy for BloomFilter.BitVector(id *a1)
{
}

uint64_t assignWithCopy for BloomFilter.BitVector(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void **)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  id v6 = v3;

  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t assignWithTake for BloomFilter.BitVector(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  char v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for BloomFilter.BitVector(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for BloomFilter.BitVector(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for BloomFilter.BitVector(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t destructiveInjectEnumTag for BloomFilter.BitVector(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for BloomFilter.BitVector()
{
  return &type metadata for BloomFilter.BitVector;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for BloomFilterError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for BloomFilterError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x2617ACAA0);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BloomFilterError()
{
  return &type metadata for BloomFilterError;
}

uint64_t getEnumTagSinglePayload for BloomFilter.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for BloomFilter.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x2617ACC34);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for BloomFilter.CodingKeys(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for BloomFilter.CodingKeys(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for BloomFilter.CodingKeys()
{
  return &type metadata for BloomFilter.CodingKeys;
}

uint64_t specialized static FNVHash.hash(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = type metadata accessor for Data.Iterator();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  BOOL v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(a2 >> 62)
  {
    case 1uLL:
    case 2uLL:
      outlined copy of Data._Representation(a1, a2);
      break;
    default:
      break;
  }
  uint64_t v8 = 2166136261;
  Data.Iterator.init(_:at:)();
  for (Swift::UInt8_optional i = Data.Iterator.next()(); (*(_WORD *)&i & 0x100) == 0; Swift::UInt8_optional i = Data.Iterator.next()())
    uint64_t v8 = 16777619 * (v8 ^ i.value);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v8;
}

uint64_t specialized static MurmurHash3.digest32BitX86(_:_:)(int *a1, uint64_t a2, int a3)
{
  if (a1)
  {
    uint64_t v3 = a2 - (void)a1;
    if (a2 - (uint64_t)a1 >= 0) {
      uint64_t v4 = a2 - (void)a1;
    }
    else {
      uint64_t v4 = a2 - (void)a1 + 3;
    }
    if (v3 >= -3)
    {
      unint64_t v5 = v4 >> 2;
      if ((unint64_t)(a2 - (void)a1 + 3) < 7)
      {
        uint64_t v6 = 0;
LABEL_17:
        switch(v3 - 4 * v5)
        {
          case 0uLL:
            goto LABEL_23;
          case 1uLL:
            int v12 = 0;
            goto LABEL_22;
          case 2uLL:
            int v13 = 0;
            goto LABEL_21;
          case 3uLL:
            int v13 = *((unsigned __int8 *)a1 + ((v6 * 4) | 2)) << 16;
LABEL_21:
            int v12 = v13 | (*((unsigned __int8 *)a1 + ((v6 * 4) | 1)) << 8);
LABEL_22:
            a3 ^= 461845907
                * ((380141568 * (v12 ^ LOBYTE(a1[v6]))) | ((-862048943 * (v12 ^ LOBYTE(a1[v6]))) >> 17));
LABEL_23:
            if (v3 < 0x100000000) {
              goto LABEL_24;
            }
            goto LABEL_28;
          default:
            goto LABEL_27;
        }
      }
      unint64_t v7 = v5 - 1;
      if (v5 < v5 - 1) {
        unint64_t v7 = v4 >> 2;
      }
      if (v7 >= 0x2000000000000000) {
        unint64_t v7 = 0x2000000000000000;
      }
      uint64_t v8 = a1;
      uint64_t v9 = v4 >> 2;
      while (v5 != v7)
      {
        int v10 = *v8++;
        HIDWORD(v11) = (461845907 * ((380141568 * v10) | ((-862048943 * v10) >> 17))) ^ a3;
        LODWORD(v11) = HIDWORD(v11);
        a3 = 5 * (v11 >> 19) - 430675100;
        if (!--v9)
        {
          uint64_t v6 = v5;
          goto LABEL_17;
        }
      }
      __break(1u);
    }
    __break(1u);
LABEL_27:
    _StringGuts.grow(_:)(43);
    swift_bridgeObjectRelease();
    v16._unint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v16);
    swift_bridgeObjectRelease();
    v17._unint64_t countAndFlagsBits = 0xD000000000000015;
    v17._object = (void *)0x80000002617AF4B0;
    String.append(_:)(v17);
    v18._unint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v18);
    swift_bridgeObjectRelease();
    v19._unint64_t countAndFlagsBits = 46;
    v19._object = (void *)0xE100000000000000;
    String.append(_:)(v19);
    v20._unint64_t countAndFlagsBits = 0xD000000000000011;
    v20._object = (void *)0x80000002617AF490;
    String.append(_:)(v20);
    swift_bridgeObjectRelease();
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_28:
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    JUMPOUT(0x2617AD25CLL);
  }
  LODWORD(v3) = 0;
LABEL_24:
  unsigned int v14 = -2048144789 * (a3 ^ v3 ^ ((a3 ^ v3) >> 16));
  return (-1028477387 * (v14 ^ (v14 >> 13))) ^ ((-1028477387 * (v14 ^ (v14 >> 13))) >> 16);
}

uint64_t specialized static MurmurHash3.hash(_:seed:)(uint64_t a1, unint64_t a2, int a3)
{
  v26[2] = *MEMORY[0x263EF8340];
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v7 = (a1 >> 32) - (int)a1;
      if (a1 >> 32 < (int)a1)
      {
        __break(1u);
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
      outlined copy of Data._Representation(a1, a2);
      uint64_t v8 = (int *)__DataStorage._bytes.getter();
      if (v8)
      {
        uint64_t v9 = __DataStorage._offset.getter();
        if (!__OFSUB__((int)a1, v9))
        {
          uint64_t v8 = (int *)((char *)v8 + (int)a1 - v9);
          goto LABEL_7;
        }
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
      }
LABEL_7:
      uint64_t v10 = __DataStorage._length.getter();
      if (v10 >= v7) {
        uint64_t v11 = (a1 >> 32) - (int)a1;
      }
      else {
        uint64_t v11 = v10;
      }
      int v12 = (char *)v8 + v11;
      if (v8) {
        uint64_t v13 = (uint64_t)v12;
      }
      else {
        uint64_t v13 = 0;
      }
      uint64_t v14 = specialized static MurmurHash3.digest32BitX86(_:_:)(v8, v13, a3);
      outlined consume of Data._Representation(a1, a2);
      return v14;
    case 2uLL:
      uint64_t v15 = *(void *)(a1 + 16);
      uint64_t v16 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      Swift::String v17 = (int *)__DataStorage._bytes.getter();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = __DataStorage._offset.getter();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      Swift::String v17 = (int *)((char *)v17 + v15 - v18);
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      uint64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_30;
      }
      uint64_t v21 = __DataStorage._length.getter();
      if (v21 >= v20) {
        uint64_t v22 = v20;
      }
      else {
        uint64_t v22 = v21;
      }
      int v23 = (char *)v17 + v22;
      if (v17) {
        uint64_t v24 = (uint64_t)v23;
      }
      else {
        uint64_t v24 = 0;
      }
      uint64_t v14 = specialized static MurmurHash3.digest32BitX86(_:_:)(v17, v24, a3);
      swift_release();
      swift_release();
      return v14;
    case 3uLL:
      memset(v26, 0, 14);
      uint64_t v6 = (char *)v26;
      return specialized static MurmurHash3.digest32BitX86(_:_:)((int *)v26, (uint64_t)v6, a3);
    default:
      v26[0] = a1;
      LOWORD(v26[1]) = a2;
      BYTE2(v26[1]) = BYTE2(a2);
      BYTE3(v26[1]) = BYTE3(a2);
      BYTE4(v26[1]) = BYTE4(a2);
      BYTE5(v26[1]) = BYTE5(a2);
      uint64_t v6 = (char *)v26 + BYTE6(a2);
      return specialized static MurmurHash3.digest32BitX86(_:_:)((int *)v26, (uint64_t)v6, a3);
  }
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return MEMORY[0x270EEE618]();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return MEMORY[0x270EEE628]();
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

uint64_t dispatch thunk of PropertyListDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x270EEF238]();
}

uint64_t PropertyListDecoder.init()()
{
  return MEMORY[0x270EEF250]();
}

uint64_t type metadata accessor for PropertyListDecoder()
{
  return MEMORY[0x270EEF268]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return MEMORY[0x270EEFC10]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.init(filePath:directoryHint:relativeTo:)()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x270EEFF68]();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
}

Swift::Void __swiftcall Data.InlineSlice.ensureUniqueReference()()
{
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return MEMORY[0x270EF0070]();
}

uint64_t Data._Representation.replaceSubrange(_:with:count:)()
{
  return MEMORY[0x270EF0090]();
}

uint64_t Data._Representation.append(contentsOf:)()
{
  return MEMORY[0x270EF00B0]();
}

Swift::UInt8_optional __swiftcall Data.Iterator.next()()
{
  return (Swift::UInt8_optional)MEMORY[0x270EF0220]();
}

uint64_t type metadata accessor for Data.Iterator()
{
  return MEMORY[0x270EF0238]();
}

uint64_t Data.Iterator.init(_:at:)()
{
  return MEMORY[0x270EF0248]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t String.init(format:_:)()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x270F9D800]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x270F9D810]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x270F9D860]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t NSData.startIndex.getter()
{
  return MEMORY[0x270EF2090]();
}

uint64_t NSData.endIndex.getter()
{
  return MEMORY[0x270EF20A0]();
}

uint64_t NSData.subscript.getter()
{
  return MEMORY[0x270EF20A8]();
}

uint64_t static OS_os_log.default.getter()
{
  return MEMORY[0x270FA2ED0]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x270F9E530]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFE8]();
}

{
  return MEMORY[0x270F9EFF0]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x270F9F230](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x270F9F2F8]();
}

{
  return MEMORY[0x270F9F308]();
}

{
  return MEMORY[0x270F9F350]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F318]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x270F9F438]();
}

{
  return MEMORY[0x270F9F448]();
}

{
  return MEMORY[0x270F9F490]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F458]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t print(_:separator:terminator:)()
{
  return MEMORY[0x270F9FC28]();
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

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CFBitVectorRef CFBitVectorCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex numBits)
{
  return (CFBitVectorRef)MEMORY[0x270EE44E8](allocator, bytes, numBits);
}

CFMutableBitVectorRef CFBitVectorCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableBitVectorRef)MEMORY[0x270EE44F0](allocator, capacity);
}

CFBit CFBitVectorGetBitAtIndex(CFBitVectorRef bv, CFIndex idx)
{
  return MEMORY[0x270EE44F8](bv, idx);
}

void CFBitVectorGetBits(CFBitVectorRef bv, CFRange range, UInt8 *bytes)
{
}

CFIndex CFBitVectorGetCountOfBit(CFBitVectorRef bv, CFRange range, CFBit value)
{
  return MEMORY[0x270EE4508](bv, range.location, range.length, *(void *)&value);
}

void CFBitVectorSetBitAtIndex(CFMutableBitVectorRef bv, CFIndex idx, CFBit value)
{
}

void CFBitVectorSetCount(CFMutableBitVectorRef bv, CFIndex count)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
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

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}