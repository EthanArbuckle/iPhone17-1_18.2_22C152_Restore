BOOL static Selector.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t Selector.init(_:)(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
    swift_bridgeObjectRelease();
    return *(void *)str;
  }
  else
  {
    MEMORY[0x1F4188790]();
    if ((a2 & 0x2000000000000000) != 0)
    {
      *(void *)str = v3;
      uint64_t v9 = a2 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v6 = (uint64_t)sel_registerName(str);
      swift_bridgeObjectRelease();
    }
    else
    {
      if ((v3 & 0x1000000000000000) != 0)
      {
        uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v5 = v3 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v4 = _StringObject.sharedUTF8.getter();
      }
      uint64_t v6 = _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq5s13OpaquePointerV_Tg507_sSRys4f5VGxs5e31_pIgyrzo_ACxsAD_pIegyrzr_lTRs13hI5V_TG5SRyAGGALsAD_pIgyrzo_Tf1cn_n(v4, v5, (uint64_t (*)(void))partial apply for specialized closure #1 in _StringGuts.withCString<A>(_:));
      swift_bridgeObjectRelease();
    }
  }
  return v6;
}

uint64_t _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq5s13OpaquePointerV_Tg507_sSRys4f5VGxs5e31_pIgyrzo_ACxsAD_pIegyrzr_lTRs13hI5V_TG5SRyAGGALsAD_pIgyrzo_Tf1cn_n(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t result = a3();
  if (!v3) {
    return v5;
  }
  return result;
}

void *partial apply for specialized closure #1 in _StringGuts.withCString<A>(_:)@<X0>(void *a1@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

SEL closure #1 in Selector.init(_:)@<X0>(const char *a1@<X0>, SEL *a2@<X8>)
{
  SEL result = sel_registerName(a1);
  *a2 = result;
  return result;
}

uint64_t base witness table accessor for Equatable in NSObject()
{
  return lazy protocol witness table accessor for type NSObject and conformance NSObject(&lazy protocol witness table cache variable for type NSObject and conformance NSObject, 255, (void (*)(uint64_t))type metadata accessor for NSObject);
}

uint64_t lazy protocol witness table accessor for type NSObject and conformance NSObject(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t type metadata accessor for NSObject()
{
  unint64_t result = lazy cache variable for type metadata for NSObject;
  if (!lazy cache variable for type metadata for NSObject)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSObject);
  }
  return result;
}

uint64_t protocol witness for CVarArg._cVarArgEncoding.getter in conformance NSObject()
{
  id v1 = *v0;
  uint64_t result = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(void *)(result + 16) = 1;
  *(void *)(result + 32) = v1;
  return result;
}

void Selector.hash(into:)(int a1, Swift::UInt a2)
{
}

void protocol witness for Hashable.hash(into:) in conformance NSObject()
{
  Hasher._combine(_:)(Swift::UInt([v0 sel_hash]));
}

id protocol witness for static Equatable.== infix(_:_:) in conformance NSObject(id *a1, void *a2)
{
  return [*a1 isEqual:*a2];
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance NSObject(uint64_t a1)
{
  id v3 = [*v1 sel_hash];

  return MEMORY[0x1F4185EA8](a1, v3);
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  id v3 = [v1 sel_hash];

  return MEMORY[0x1F4185EA8](seed, v3);
}

void NSObject.hash(into:)()
{
  Hasher._combine(_:)((Swift::UInt)[v0 sel_hash]);
}

id static NSObject.== infix(_:_:)(void *a1, uint64_t a2)
{
  return [a1 isEqual:a2];
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Selector()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance Selector(void *a1, void *a2)
{
  return *a1 == *a2;
}

ObjectiveC::ObjCBool __swiftcall _convertBoolToObjCBool(_:)(Swift::Bool a1)
{
  return (ObjectiveC::ObjCBool)a1;
}

Swift::Bool __swiftcall _convertObjCBoolToBool(_:)(ObjectiveC::ObjCBool a1)
{
  return a1._value;
}

id protocol witness for Hashable.hashValue.getter in conformance NSObject()
{
  return [*v0 sel_hash];
}

id NSObject.hashValue.getter()
{
  return [v0 sel_hash];
}

uint64_t Selector.description.getter(const char *a1)
{
  sel_getName(a1);

  return String.init(cString:)();
}

unint64_t lazy protocol witness table accessor for type Selector and conformance Selector()
{
  unint64_t result = lazy protocol witness table cache variable for type Selector and conformance Selector;
  if (!lazy protocol witness table cache variable for type Selector and conformance Selector)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Selector and conformance Selector);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Selector and conformance Selector;
  if (!lazy protocol witness table cache variable for type Selector and conformance Selector)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Selector and conformance Selector);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Selector and conformance Selector;
  if (!lazy protocol witness table cache variable for type Selector and conformance Selector)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Selector and conformance Selector);
  }
  return result;
}

SEL Selector.init(stringLiteral:)()
{
  uint64_t v0 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  SEL v1 = sel_registerName((const char *)(v0 + 32));
  swift_release();
  return v1;
}

uint64_t ObjCBool._value.getter(char a1)
{
  return a1 & 1;
}

uint64_t ObjCBool._value.setter(uint64_t result)
{
  *SEL v1 = result;
  return result;
}

uint64_t (*ObjCBool._value.modify())()
{
  return ObjCBool._value.modify;
}

ObjectiveC::ObjCBool __swiftcall ObjCBool.init(_:)(Swift::Bool a1)
{
  return (ObjectiveC::ObjCBool)a1;
}

uint64_t ObjCBool.BOOLValue.getter(char a1)
{
  return a1 & 1;
}

ObjectiveC::ObjCBool __swiftcall ObjCBool.init(BOOLeanLiteral:)(Swift::Bool BOOLeanLiteral)
{
  return (ObjectiveC::ObjCBool)BOOLeanLiteral;
}

unsigned char *protocol witness for ExpressibleByBooleanLiteral.init(BOOLeanLiteral:) in conformance ObjCBool@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t ObjCBool.customMirror.getter()
{
  return Mirror.init(reflecting:)();
}

uint64_t protocol witness for CustomReflectable.customMirror.getter in conformance ObjCBool()
{
  return Mirror.init(reflecting:)();
}

uint64_t ObjCBool.description.getter(char a1)
{
  if (a1) {
    return 1702195828;
  }
  else {
    return 0x65736C6166;
  }
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ObjCBool()
{
  if (*v0) {
    return 1702195828;
  }
  else {
    return 0x65736C6166;
  }
}

uint64_t protocol witness for ExpressibleByStringLiteral.init(stringLiteral:) in conformance Selector@<X0>(SEL *a1@<X8>)
{
  uint64_t v2 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  SEL v3 = sel_registerName((const char *)(v2 + 32));
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

Swift::Int Selector.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Selector()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance Selector()
{
  Hasher._combine(_:)(*v0);
}

uint64_t String.init(_sel:)(const char *a1)
{
  sel_getName(a1);

  return String.init(cString:)();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Selector()
{
  sel_getName(*v0);

  return String.init(cString:)();
}

uint64_t Selector.customMirror.getter(const char *a1)
{
  return Mirror.init(reflecting:)();
}

uint64_t protocol witness for CustomReflectable.customMirror.getter in conformance Selector()
{
  sel_getName(*v0);
  String.init(cString:)();
  return Mirror.init(reflecting:)();
}

void autoreleasepool<A>(invoking:)(void (*a1)(void))
{
  uint64_t v2 = (void *)MEMORY[0x1BA9A8240]();
  a1();
}

void YES.getter()
{
}

void NO.getter()
{
}

uint64_t NSObject._cVarArgEncoding.getter()
{
  id v1 = v0;
  uint64_t result = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(void *)(result + 16) = 1;
  *(void *)(result + 32) = v1;
  return result;
}

uint64_t ObjCClassList.Iterator.deinit()
{
  swift_beginAccess();
  _objc_endClassEnumeration();
  swift_endAccess();
  free(*(void **)(v0 + 80));
  return v0;
}

uint64_t ObjCClassList.Iterator.__deallocating_deinit()
{
  swift_beginAccess();
  _objc_endClassEnumeration();
  swift_endAccess();
  free(*(void **)(v0 + 80));
  return swift_deallocClassInstance();
}

uint64_t ObjCClassList.Iterator.next()()
{
  swift_beginAccess();
  uint64_t Class = _objc_enumerateNextClass();
  swift_endAccess();
  if (Class) {
    return swift_getObjCClassMetadata();
  }
  else {
    return 0;
  }
}

uint64_t protocol witness for IteratorProtocol.next() in conformance ObjCClassList.Iterator@<X0>(uint64_t *a1@<X8>)
{
  swift_beginAccess();
  uint64_t Class = _objc_enumerateNextClass();
  swift_endAccess();
  if (Class) {
    uint64_t result = swift_getObjCClassMetadata();
  }
  else {
    uint64_t result = 0;
  }
  *a1 = result;
  return result;
}

uint64_t ObjCClassList.makeIterator()()
{
  uint64_t v1 = *v0;
  char v2 = *((unsigned char *)v0 + 8);
  uint64_t v3 = v0[2];
  uint64_t v4 = (char *)v0[3];
  uint64_t v6 = (void *)v0[4];
  uint64_t v5 = v0[5];
  uint64_t v10 = v1;
  char v11 = v2;
  type metadata accessor for ObjCClassList.Iterator();
  swift_allocObject();
  id v7 = v6;
  swift_bridgeObjectRetain();
  uint64_t v8 = specialized ObjCClassList.Iterator.init(fromImage:matchingNamePrefix:conformingTo:subclassing:)((uint64_t)&v10, v3, v4, (uint64_t)v6, v5);

  return v8;
}

uint64_t protocol witness for Sequence.makeIterator() in conformance ObjCClassList@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *v1;
  char v4 = *((unsigned char *)v1 + 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = (char *)v1[3];
  uint64_t v8 = (void *)v1[4];
  uint64_t v7 = v1[5];
  uint64_t v12 = v3;
  char v13 = v4;
  type metadata accessor for ObjCClassList.Iterator();
  swift_allocObject();
  id v9 = v8;
  swift_bridgeObjectRetain();
  uint64_t v10 = specialized ObjCClassList.Iterator.init(fromImage:matchingNamePrefix:conformingTo:subclassing:)((uint64_t)&v12, v5, v6, (uint64_t)v8, v7);

  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v10;
  return result;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance ObjCClassList()
{
  return 0;
}

uint64_t protocol witness for Sequence._customContainsEquatableElement(_:) in conformance ObjCClassList()
{
  return 2;
}

void *protocol witness for Sequence._copyToContiguousArray() in conformance ObjCClassList()
{
  long long v1 = v0[1];
  v4[0] = *v0;
  v4[1] = v1;
  v4[2] = v0[2];
  char v2 = specialized _copySequenceToContiguousArray<A>(_:)((uint64_t *)v4);
  outlined release of ObjCClassList((uint64_t)v4);
  return v2;
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance ObjCClassList(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return specialized Sequence._copyContents(initializing:)(a1, a2, a3);
}

uint64_t specialized Sequence._copyContents(initializing:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  char v4 = v3;
  outlined init with take of ObjCEnumerationImage(v3, (uint64_t)v17);
  uint64_t v8 = v3[2];
  id v9 = (char *)v4[3];
  uint64_t v10 = (void *)v4[4];
  uint64_t v11 = v4[5];
  outlined init with take of ObjCEnumerationImage(v17, (uint64_t)v16);
  type metadata accessor for ObjCClassList.Iterator();
  swift_allocObject();
  id v12 = v10;
  swift_bridgeObjectRetain();
  uint64_t v13 = specialized ObjCClassList.Iterator.init(fromImage:matchingNamePrefix:conformingTo:subclassing:)((uint64_t)v16, v8, v9, (uint64_t)v10, v11);

  uint64_t result = outlined release of ObjCClassList((uint64_t)v4);
  if (!a2)
  {
    a3 = 0;
    goto LABEL_10;
  }
  if (!a3)
  {
LABEL_10:
    *a1 = v13;
    return a3;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    swift_beginAccess();
    uint64_t v15 = 0;
    if (_objc_enumerateNextClass())
    {
      while (1)
      {
        *(void *)(a2 + 8 * v15) = swift_getObjCClassMetadata();
        if (a3 - 1 == v15) {
          break;
        }
        ++v15;
        if (!_objc_enumerateNextClass()) {
          goto LABEL_7;
        }
      }
      swift_endAccess();
    }
    else
    {
LABEL_7:
      swift_endAccess();
      a3 = v15;
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance ObjCClassList()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t objc_enumerateClasses(fromImage:matchingNamePrefix:conformingTo:subclassing:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a6 = *(void *)a1;
  *(unsigned char *)(a6 + 8) = v6;
  *(void *)(a6 + 16) = a2;
  *(void *)(a6 + 24) = a3;
  *(void *)(a6 + 32) = a4;
  *(void *)(a6 + 40) = a5;
  id v7 = a4;

  return swift_bridgeObjectRetain();
}

void *specialized _copySequenceToContiguousArray<A>(_:)(uint64_t *a1)
{
  v28[2] = *MEMORY[0x1E4F143B8];
  outlined init with take of ObjCEnumerationImage(a1, (uint64_t)v28);
  uint64_t v2 = a1[2];
  uint64_t v3 = (char *)a1[3];
  uint64_t v5 = (void *)a1[4];
  uint64_t v4 = a1[5];
  outlined init with take of ObjCEnumerationImage(v28, (uint64_t)v27);
  type metadata accessor for ObjCClassList.Iterator();
  swift_initStackObject();
  id v6 = v5;
  swift_bridgeObjectRetain();
  specialized ObjCClassList.Iterator.init(fromImage:matchingNamePrefix:conformingTo:subclassing:)((uint64_t)v27, v2, v3, (uint64_t)v5, v4);

  swift_beginAccess();
  uint64_t Class = _objc_enumerateNextClass();
  swift_endAccess();
  uint64_t v8 = (void *)MEMORY[0x1E4FBC860];
  uint64_t v9 = 0;
  if (Class)
  {
    uint64_t v10 = (uint64_t *)(MEMORY[0x1E4FBC860] + 32);
    while (1)
    {
      if (!v9)
      {
        unint64_t v11 = v8[3];
        if ((uint64_t)((v11 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_26;
        }
        int64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
        if (v12 <= 1) {
          uint64_t v13 = 1;
        }
        else {
          uint64_t v13 = v12;
        }
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject.Type>);
        v14 = (void *)swift_allocObject();
        int64_t v15 = _swift_stdlib_malloc_size(v14);
        uint64_t v16 = v15 - 32;
        if (v15 < 32) {
          uint64_t v16 = v15 - 25;
        }
        uint64_t v17 = v16 >> 3;
        v14[2] = v13;
        v14[3] = 2 * (v16 >> 3);
        unint64_t v18 = (unint64_t)(v14 + 4);
        uint64_t v19 = v8[3] >> 1;
        if (v8[2])
        {
          if (v14 != v8 || v18 >= (unint64_t)&v8[v19 + 4]) {
            memmove(v14 + 4, v8 + 4, 8 * v19);
          }
          v8[2] = 0;
        }
        uint64_t v10 = (uint64_t *)(v18 + 8 * v19);
        uint64_t v9 = (v17 & 0x7FFFFFFFFFFFFFFFLL) - v19;
        swift_release();
        uint64_t v8 = v14;
      }
      BOOL v21 = __OFSUB__(v9--, 1);
      if (v21) {
        break;
      }
      *v10++ = swift_getObjCClassMetadata();
      swift_beginAccess();
      uint64_t v22 = _objc_enumerateNextClass();
      swift_endAccess();
      if (!v22) {
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
  }
LABEL_21:
  swift_release();
  unint64_t v23 = v8[3];
  if (v23 >= 2)
  {
    unint64_t v24 = v23 >> 1;
    BOOL v21 = __OFSUB__(v24, v9);
    uint64_t v25 = v24 - v9;
    if (v21) {
      goto LABEL_27;
    }
    v8[2] = v25;
  }
  return v8;
}

uint64_t type metadata accessor for ObjCClassList.Iterator()
{
  return self;
}

uint64_t specialized ObjCClassList.Iterator.init(fromImage:matchingNamePrefix:conformingTo:subclassing:)(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5)
{
  int v8 = *(unsigned __int8 *)(a1 + 8);
  *(_OWORD *)(v5 + 16) = 0u;
  *(_OWORD *)(v5 + 32) = 0u;
  *(_OWORD *)(v5 + 48) = 0u;
  *(_OWORD *)(v5 + 64) = 0u;
  if (v8 || (uint64_t result = _dyld_get_dlopen_image_header()) != 0)
  {
    if (a3)
    {
      uint64_t v10 = String.utf8CString.getter();
      swift_bridgeObjectRelease();
      a3 = strdup((const char *)(v10 + 32));
      swift_release();
    }
    *(void *)(v5 + 80) = a3;
    if (a5) {
      swift_getObjCClassFromMetadata();
    }
    swift_beginAccess();
    _objc_beginClassEnumeration();
    swift_endAccess();
    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t associated type witness table accessor for ExpressibleByBooleanLiteral.BooleanLiteralType : _ExpressibleByBuiltinBooleanLiteral in ObjCBool()
{
  return MEMORY[0x1E4FBB3C0];
}

uint64_t associated type witness table accessor for ExpressibleByStringLiteral.StringLiteralType : _ExpressibleByBuiltinStringLiteral in Selector()
{
  return MEMORY[0x1E4FBB220];
}

uint64_t associated type witness table accessor for ExpressibleByExtendedGraphemeClusterLiteral.ExtendedGraphemeClusterLiteralType : _ExpressibleByBuiltinExtendedGraphemeClusterLiteral in Selector()
{
  return MEMORY[0x1E4FBB230];
}

uint64_t associated type witness table accessor for ExpressibleByUnicodeScalarLiteral.UnicodeScalarLiteralType : _ExpressibleByBuiltinUnicodeScalarLiteral in Selector()
{
  return MEMORY[0x1E4FBB228];
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in ObjCClassList(uint64_t a1, uint64_t a2)
{
  return lazy protocol witness table accessor for type NSObject and conformance NSObject(&lazy protocol witness table cache variable for type ObjCClassList.Iterator and conformance ObjCClassList.Iterator, a2, (void (*)(uint64_t))type metadata accessor for ObjCClassList.Iterator);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ObjCBool(unsigned __int8 *a1, unsigned int a2)
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
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ObjCBool(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1B5BEA91CLL);
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

ValueMetadata *type metadata accessor for ObjCBool()
{
  return &type metadata for ObjCBool;
}

ValueMetadata *type metadata accessor for Selector()
{
  return &type metadata for Selector;
}

uint64_t getEnumTagSinglePayload for Selector(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 8)) {
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

uint64_t storeEnumTagSinglePayload for Selector(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)uint64_t result = a2 - 2;
    if (a3 >= 2) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NSZone()
{
  return &type metadata for NSZone;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for ObjCEnumerationImage(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ObjCEnumerationImage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for ObjCEnumerationImage(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 1u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t destructiveInjectEnumTag for ObjCEnumerationImage(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)uint64_t result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ObjCEnumerationImage()
{
  return &type metadata for ObjCEnumerationImage;
}

uint64_t initializeBufferWithCopyOfBuffer for ObjCClassList(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for ObjCClassList(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 32);
}

uint64_t initializeWithCopy for ObjCClassList(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v5 = *(void **)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  id v6 = v5;
  return a1;
}

uint64_t assignWithCopy for ObjCClassList(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = (void *)a2[4];
  *(void *)(a1 + 32) = v6;
  id v7 = v6;

  *(void *)(a1 + 40) = a2[5];
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ObjCClassList(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for ObjCClassList(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ObjCClassList(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 48) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ObjCClassList()
{
  return &type metadata for ObjCClassList;
}

uint64_t method lookup function for ObjCClassList.Iterator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ObjCClassList.Iterator);
}

uint64_t dispatch thunk of ObjCClassList.Iterator.next()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for objc_class_enumerator(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 64)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for objc_class_enumerator(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 64) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 64) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

void type metadata accessor for objc_class_enumerator()
{
  if (!lazy cache variable for type metadata for objc_class_enumerator)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for objc_class_enumerator);
    }
  }
}

uint64_t outlined init with take of ObjCEnumerationImage(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  *(unsigned char *)(a2 + 8) = *((unsigned char *)a1 + 8);
  *(void *)a2 = v2;
  return a2;
}

uint64_t outlined release of ObjCClassList(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  swift_bridgeObjectRelease();

  return a1;
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

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t String.init(cString:)()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x1F4183C18]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return MEMORY[0x1F4184CC0]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x1F4185EB0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t Mirror.init(reflecting:)()
{
  return MEMORY[0x1F4185F10]();
}

uint64_t _dyld_get_dlopen_image_header()
{
  return MEMORY[0x1F40C9E00]();
}

{
  return MEMORY[0x1F41813D0]();
}

{
  return MEMORY[0x1F41813F0]();
}

uint64_t _objc_beginClassEnumeration()
{
  return MEMORY[0x1F41813F8]();
}

uint64_t _objc_endClassEnumeration()
{
  return MEMORY[0x1F4181408]();
}

uint64_t _objc_enumerateNextClass()
{
  return MEMORY[0x1F4181410]();
}

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
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

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

SEL sel_registerName(const char *str)
{
  return (SEL)MEMORY[0x1F4181B48](str);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}