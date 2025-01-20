uint64_t type metadata instantiation function for _XPCKeyedDecodingContainer()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t _XPCUnkeyedDecodingContainer.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
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

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t XPC_TYPE_DICTIONARY.getter()
{
  return MEMORY[0x263EF8708];
}

ValueMetadata *type metadata accessor for XPCDictionary()
{
  return &type metadata for XPCDictionary;
}

uint64_t type metadata accessor for KeyedEncodingStorage()
{
  return self;
}

uint64_t KeyedEncodingStorage.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.nestedContainer<A>(keyedBy:forKey:) in conformance _XPCKeyedDecodingContainer<A>(uint64_t a1, uint64_t a2)
{
  return _XPCKeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)(a1, a2);
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.decode<A>(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return _XPCKeyedDecodingContainer.decode<A>(_:forKey:)(a1, a2, a3);
}

uint64_t _XPCKeyedEncodingContainer.__deallocating_deinit()
{
  _XPCKeyedEncodingContainer.deinit();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t _XPCKeyedEncodingContainer.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t dispatch thunk of XPCSession.send<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t XPCSession.send<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = static XPCReceivedMessage.encodeMessage<A>(_:isSync:)(a1, 0, a2, a3, &v5);
  if (!v3)
  {
    XPCSession.send(message:)(&v5);
    return swift_unknownObjectRelease();
  }
  return result;
}

_xpc_rich_error_s *XPCSession.send(message:)(void **a1)
{
  uint64_t result = _swift_xpc_session_send_message(*(void **)(v1 + 16), *a1);
  if (result)
  {
    uint64_t v3 = result;
    lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError();
    swift_allocError();
    uint64_t v5 = v4;
    uint64_t v6 = swift_unknownObjectRetain();
    uint64_t result = (_xpc_rich_error_s *)MEMORY[0x2105634B0](v6);
    if (result == (_xpc_rich_error_s *)MEMORY[0x263EF8770])
    {
      uint64_t result = (_xpc_rich_error_s *)xpc_rich_error_copy_description(v3);
      if (result)
      {
        v7 = result;
        uint64_t v8 = String.init(cString:)();
        uint64_t v10 = v9;
        BOOL can_retry = xpc_rich_error_can_retry(v3);
        free(v7);
        *(unsigned char *)uint64_t v5 = can_retry;
        *(void *)(v5 + 8) = v8;
        *(void *)(v5 + 16) = v10;
        swift_willThrow();
        return (_xpc_rich_error_s *)swift_unknownObjectRelease_n();
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  return result;
}

xpc_rich_error_t _swift_xpc_session_send_message(void *a1, void *a2)
{
  uint64_t v3 = a1;
  id v4 = a2;
  xpc_rich_error_t v5 = xpc_session_send_message(v3, v4);

  return v5;
}

uint64_t @objc closure #1 in XPCCodableObjectRepresentableCache.().init()()
{
  if (one-time initialization token for global != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = (os_unfair_lock_s *)static XPCCodableObjectRepresentableCache._Cache.global;
  swift_retain();
  os_unfair_lock_lock(v0 + 6);
  swift_bridgeObjectRelease();
  if (one-time initialization token for resetValue != -1) {
    swift_once();
  }
  *(void *)&v0[4]._os_unfair_lock_opaque = static XPCCodableObjectRepresentableCache._Cache.resetValue;
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v0 + 6);
  return swift_release();
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned UnsafePointer<Int8>, @guaranteed OS_xpc_object) -> (@unowned Bool)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  xpc_rich_error_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  char v6 = v5(a2, a3);
  swift_unknownObjectRelease();
  return v6 & 1;
}

uint64_t partial apply for thunk for @callee_guaranteed (@unowned UnsafePointer<Int8>, @guaranteed OS_xpc_object) -> (@unowned Bool)()
{
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t partial apply for closure #1 in closure #1 in XPCDictionary.forEach(_:)(uint64_t a1, uint64_t a2)
{
  return closure #1 in closure #1 in XPCDictionary.forEach(_:)(a1, a2, *(void (**)(uint64_t))(v2 + 16));
}

uint64_t closure #1 in closure #1 in XPCDictionary.forEach(_:)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4 = String.init(cString:)();
  a3(v4);
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t partial apply for closure #1 in XPCDictionary.forEach(_:)()
{
  return partial apply for thunk for @callee_guaranteed (@guaranteed String, @guaranteed OS_xpc_object) -> (@error @owned Error)();
}

uint64_t partial apply for thunk for @callee_guaranteed (@guaranteed String, @guaranteed OS_xpc_object) -> (@error @owned Error)()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t partial apply for specialized closure #1 in XPCDictionary.map<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return specialized closure #1 in XPCDictionary.map<A>(_:)(a1, a2, a3, *(uint64_t **)(v3 + 16), *(void *(**)(void *__return_ptr))(v3 + 24));
}

uint64_t specialized closure #1 in XPCDictionary.map<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, void *(*a5)(void *__return_ptr))
{
  uint64_t result = (uint64_t)a5(v14);
  if (!v5)
  {
    uint64_t v8 = v14[0];
    uint64_t v9 = v14[1];
    uint64_t v10 = *a4;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *a4 = v10;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v10 + 16) + 1, 1, (char *)v10);
      uint64_t v10 = result;
      *a4 = result;
    }
    unint64_t v12 = *(void *)(v10 + 16);
    unint64_t v11 = *(void *)(v10 + 24);
    if (v12 >= v11 >> 1)
    {
      uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1, (char *)v10);
      uint64_t v10 = result;
      *a4 = result;
    }
    *(void *)(v10 + 16) = v12 + 1;
    unint64_t v13 = v10 + 16 * v12;
    *(void *)(v13 + 32) = v8;
    *(void *)(v13 + 40) = v9;
  }
  return result;
}

uint64_t specialized implicit closure #1 in XPCDictionary.keys.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = a1;
  a3[1] = a2;
  return swift_bridgeObjectRetain();
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
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
  swift_bridgeObjectRelease();
  return v10;
}

{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    unint64_t v12 = v11 - 32;
    if (v11 < 32) {
      unint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  v14 = a4 + 32;
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

uint64_t XPCDictionary.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  v12[2] = *v4;
  swift_unknownObjectRetain();
  int64_t v9 = specialized String.withCString<A>(_:)((void *(*)(uint64_t *__return_ptr, void *))partial apply for closure #1 in XPCDictionary.subscript.getter, (uint64_t)v12, a1, a2);
  swift_unknownObjectRelease();
  if (!v9) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56))(a4, 1, 1, a3);
  }
  uint64_t v10 = MEMORY[0x2105634B0](v9);
  if (v10 == MEMORY[0x263EF8738])
  {
    double value = COERCE_DOUBLE(xpc_int64_get_value(v9));
    lazy protocol witness table accessor for type Int64 and conformance Int64();
  }
  else
  {
    if (v10 != MEMORY[0x263EF87A0])
    {
      if (v10 == MEMORY[0x263EF8710])
      {
        double value = xpc_double_get_value(v9);
        lazy protocol witness table accessor for type Double and conformance Double();
        dispatch thunk of BinaryInteger.init<A>(exactly:)();
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56))(a4, 1, 1, a3);
      }
      return swift_unknownObjectRelease();
    }
    double value = COERCE_DOUBLE(xpc_uint64_get_value(v9));
    lazy protocol witness table accessor for type UInt64 and conformance UInt64();
  }
  dispatch thunk of Numeric.init<A>(exactly:)();
  return swift_unknownObjectRelease();
}

{
  void *v4;
  void *v9;
  uint64_t v10;
  void v12[4];
  double value;

  v12[2] = *v4;
  swift_unknownObjectRetain();
  int64_t v9 = specialized String.withCString<A>(_:)((void *(*)(uint64_t *__return_ptr, void *))closure #1 in XPCDictionary.subscript.getterpartial apply, (uint64_t)v12, a1, a2);
  swift_unknownObjectRelease();
  if (!v9) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56))(a4, 1, 1, a3);
  }
  uint64_t v10 = MEMORY[0x2105634B0](v9);
  if (v10 == MEMORY[0x263EF8738])
  {
    double value = COERCE_DOUBLE(xpc_int64_get_value(v9));
    lazy protocol witness table accessor for type Int64 and conformance Int64();
  }
  else
  {
    if (v10 != MEMORY[0x263EF87A0])
    {
      if (v10 == MEMORY[0x263EF8710])
      {
        double value = xpc_double_get_value(v9);
        lazy protocol witness table accessor for type Double and conformance Double();
        dispatch thunk of BinaryFloatingPoint.init<A>(exactly:)();
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56))(a4, 1, 1, a3);
      }
      return swift_unknownObjectRelease();
    }
    double value = COERCE_DOUBLE(xpc_uint64_get_value(v9));
    lazy protocol witness table accessor for type UInt64 and conformance UInt64();
  }
  dispatch thunk of FloatingPoint.init<A>(exactly:)();
  return swift_unknownObjectRelease();
}

void *specialized String.withCString<A>(_:)(void *(*a1)(uint64_t *__return_ptr, void *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return specialized String.withCString<A>(_:)(a1, a2, a3, a4, (uint64_t *)&demangling cache variable for type metadata for OS_xpc_object?, (uint64_t (*)(void))partial apply for specialized closure #1 in _StringGuts.withCString<A>(_:));
}

{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  void *result;
  uint64_t v11;
  void v12[3];

  if ((a4 & 0x1000000000000000) != 0 || !(a4 & 0x2000000000000000 | a3 & 0x1000000000000000))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for String?);
    uint64_t result = (void *)_StringGuts._slowWithCString<A>(_:)();
    if (!v4) {
      return (void *)v12[2];
    }
  }
  else
  {
    MEMORY[0x270FA5388](a1);
    if ((a4 & 0x2000000000000000) != 0)
    {
      v12[0] = a3;
      v12[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      uint64_t result = a1(&v11, v12);
      if (!v4) {
        return (void *)v11;
      }
    }
    else
    {
      if ((a3 & 0x1000000000000000) != 0)
      {
        int64_t v8 = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
        int64_t v9 = a3 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        int64_t v8 = _StringObject.sharedUTF8.getter();
      }
      return (void *)_sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq5SSSg_Tg507_sSRys4f5VGxs5E36_pIgyrzo_ACxsAD_pIegyrzr_lTRSSSg_TG5SRyAGGAKsAD_pIgyrzo_Tf1cn_n(v8, v9, (uint64_t (*)(void))partial apply for specialized closure #1 in _StringGuts.withCString<A>(_:));
    }
  }
  return result;
}

{
  return specialized String.withCString<A>(_:)(a1, a2, a3, a4, (uint64_t *)&demangling cache variable for type metadata for UnsafeRawPointer?, (uint64_t (*)(void))partial apply for specialized closure #1 in _StringGuts.withCString<A>(_:));
}

void *specialized String.withCString<A>(_:)(void *(*a1)(uint64_t *__return_ptr, void *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if ((a4 & 0x1000000000000000) != 0 || !(a4 & 0x2000000000000000 | a3 & 0x1000000000000000))
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t result = (void *)_StringGuts._slowWithCString<A>(_:)();
    if (!v6) {
      return (void *)v15[2];
    }
  }
  else
  {
    MEMORY[0x270FA5388](a1);
    if ((a4 & 0x2000000000000000) != 0)
    {
      v15[0] = a3;
      v15[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      uint64_t result = a1(&v14, v15);
      if (!v6) {
        return (void *)v14;
      }
    }
    else
    {
      if ((a3 & 0x1000000000000000) != 0)
      {
        uint64_t v11 = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v12 = a3 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v11 = _StringObject.sharedUTF8.getter();
      }
      return (void *)_sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq5So13OS_xpc_object_pSg_Tg507_sSRys4f5VGxs5e32_pIgyrzo_ACxsAD_pIegyrzr_lTRSo13h1_i1_J8_pSg_TG5SRyAGGALsAD_pIgyrzo_Tf1cn_nTm(v11, v12, a6);
    }
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Int64 and conformance Int64()
{
  unint64_t result = lazy protocol witness table cache variable for type Int64 and conformance Int64;
  if (!lazy protocol witness table cache variable for type Int64 and conformance Int64)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int64 and conformance Int64);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Int64 and conformance Int64;
  if (!lazy protocol witness table cache variable for type Int64 and conformance Int64)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int64 and conformance Int64);
  }
  return result;
}

uint64_t _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq5So13OS_xpc_object_pSg_Tg507_sSRys4f5VGxs5e32_pIgyrzo_ACxsAD_pIegyrzr_lTRSo13h1_i1_J8_pSg_TG5SRyAGGALsAD_pIgyrzo_Tf1cn_nTm(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t result = a3();
  if (!v3) {
    return v5;
  }
  return result;
}

void *partial apply for specialized closure #1 in _StringGuts.withCString<A>(_:)@<X0>(void *a1@<X8>)
{
  return partial apply for specialized closure #1 in _StringGuts.withCString<A>(_:)(a1);
}

{
  uint64_t v1;
  uint64_t v2;
  void *result;
  uint64_t v5;

  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
  return result;
}

xpc_object_t partial apply for closure #1 in XPCDictionary.subscript.getter@<X0>(char *key@<X0>, void *a2@<X8>)
{
  xpc_object_t result = xpc_dictionary_get_value(*(xpc_object_t *)(v2 + 16), key);
  *a2 = result;
  return result;
}

const void *partial apply for closure #1 in XPCDictionary.subscript.getter@<X0>(char *a1@<X0>, void *a2@<X8>)
{
  return partial apply for closure #1 in XPCDictionary.subscript.getter(a1, a2);
}

const void *_s3XPC13XPCDictionaryV_2asSays5UInt8VGSgSS_AGmtcigSVSgSPys4Int8VGXEfU_TA_0@<X0>(char *a1@<X0>, void *a2@<X8>)
{
  return closure #1 in XPCDictionary.subscript.getter(a1, *(xpc_object_t *)(v2 + 16), *(size_t **)(v2 + 24), a2);
}

const void *closure #1 in XPCDictionary.subscript.getter@<X0>(char *key@<X0>, xpc_object_t xdict@<X1>, size_t *a3@<X2>, void *a4@<X8>)
{
  xpc_object_t result = xpc_dictionary_get_data(xdict, key, a3);
  *a4 = result;
  return result;
}

xpc_object_t closure #1 in XPCDictionary.subscript.getterpartial apply@<X0>(char *a1@<X0>, void *a2@<X8>)
{
  return partial apply for closure #1 in XPCDictionary.subscript.getter(a1, a2);
}

uint64_t _XPCKeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  *((void *)&v38 + 1) = *(void *)(*v2 + 80);
  uint64_t v6 = *((void *)&v38 + 1);
  uint64_t v7 = *(void *)(v5 + 88);
  v39 = (_UNKNOWN **)v7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v37);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(boxed_opaque_existential_1, a2, v6);
  uint64_t v9 = _XPCKeyedDecodingContainer.valueBuffer(forKey:)(&v37);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v37);
  if (!v3)
  {
    uint64_t v11 = v9;
    uint64_t v12 = CodingMetadata.appending<A>(codingKey:)(a2, v2[2], v2[3], v6, v7);
    uint64_t v32 = v13;
    uint64_t v33 = v12;
    uint64_t v14 = v2[4];
    uint64_t v15 = dispatch thunk of CodingKey.stringValue.getter();
    uint64_t v17 = v16;
    swift_beginAccess();
    uint64_t v18 = *(void *)(v14 + 24);
    if (*(void *)(v18 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v19 = specialized __RawDictionaryStorage.find<A>(_:)(v15, v17);
      if (v20)
      {
        outlined init with copy of XPCCodableObjectRepresentable(*(void *)(v18 + 56) + 40 * v19, (uint64_t)&v34);
      }
      else
      {
        uint64_t v36 = 0;
        long long v34 = 0u;
        long long v35 = 0u;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v36 = 0;
      long long v34 = 0u;
      long long v35 = 0u;
    }
    swift_bridgeObjectRelease();
    uint64_t v21 = v11;
    uint64_t v22 = *((void *)&v35 + 1);
    if (*((void *)&v35 + 1))
    {
      uint64_t v23 = v36;
      v24 = __swift_project_boxed_opaque_existential_1(&v34, *((uint64_t *)&v35 + 1));
      *((void *)&v38 + 1) = v22;
      v39 = *(_UNKNOWN ***)(v23 + 8);
      v25 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v37);
      (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v22 - 8) + 16))(v25, v24, v22);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v34);
    }
    else
    {
      outlined destroy of DecodingContainer?((uint64_t)&v34, &demangling cache variable for type metadata for DecodingContainer?);
      long long v37 = 0u;
      long long v38 = 0u;
      v39 = 0;
    }
    uint64_t v26 = type metadata accessor for _XPCKeyedDecodingContainer();
    *(void *)&long long v34 = v21;
    char v27 = static SharableStorageContainer.getExisting<A>(container:codingMetadata:initialStorage:)((uint64_t)&v40, (uint64_t)&v37, v33, v32, (uint64_t)&v34, v26, v26, (uint64_t)&protocol witness table for _XPCKeyedDecodingContainer<A>, (uint64_t)&protocol witness table for _XPCKeyedDecodingContainer<A>);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    outlined destroy of DecodingContainer?((uint64_t)&v37, &demangling cache variable for type metadata for CodingContainer?);
    uint64_t v28 = v40;
    if (v27)
    {
      uint64_t v29 = dispatch thunk of CodingKey.stringValue.getter();
      uint64_t v31 = v30;
      *((void *)&v38 + 1) = v26;
      v39 = &protocol witness table for _XPCKeyedDecodingContainer<A>;
      *(void *)&long long v37 = v28;
      swift_beginAccess();
      swift_retain();
      specialized Dictionary.subscript.setter((uint64_t)&v37, v29, v31);
      swift_endAccess();
    }
    *(void *)&long long v37 = v28;
    swift_getWitnessTable();
    KeyedDecodingContainer.init<A>(_:)();
    return swift_release();
  }
  return result;
}

uint64_t _XPCKeyedDecodingContainer.decode<A>(_:forKey:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  long long v13 = *(_OWORD *)(*v3 + 80);
  uint64_t v11 = v13;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  (*(void (**)(uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16))(boxed_opaque_existential_1, a1);
  uint64_t v9 = _XPCKeyedDecodingContainer.valueBuffer(forKey:)(v12);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  if (!v4)
  {
    type metadata accessor for XPCDecoder();
    static XPCDecoder.decode<A>(from:withCodingMetadata:)(v9, v3[2], v3[3], a2, a3);
    return swift_release();
  }
  return result;
}

uint64_t CodingMetadata.appending<A>(codingKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20DA2D050;
  *(void *)(inited + 56) = a4;
  *(void *)(inited + 64) = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 32));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 16))(boxed_opaque_existential_1, a1, a4);
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)((void *)inited);
  swift_bridgeObjectRetain();
  return a2;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void *specialized Array.append<A>(contentsOf:)(void *result)
{
  uint64_t v2 = result[2];
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  uint64_t result = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= v3[3] >> 1)
  {
    if (v6[2]) {
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
  uint64_t result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(result, v10, 1, v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>, (uint64_t *)&demangling cache variable for type metadata for CodingKey);
  uint64_t v3 = result;
  if (!v6[2])
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  if ((v3[3] >> 1) - v3[2] < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CodingKey);
  uint64_t result = (void *)swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    uint64_t result = (void *)swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v7 = v3[2];
  BOOL v8 = __OFADD__(v7, v2);
  uint64_t v9 = v7 + v2;
  if (!v8)
  {
    v3[2] = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

void *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    long long v13 = (void *)swift_allocObject();
    size_t v14 = _swift_stdlib_malloc_size(v13);
    v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 40);
  }
  else
  {
    long long v13 = (void *)MEMORY[0x263F8EE78];
  }
  if (v8)
  {
    if (v13 != a4 || v13 + 4 >= &a4[5 * v11 + 4]) {
      memmove(v13 + 4, a4 + 4, 40 * v11);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t type metadata accessor for XPCDecoder()
{
  return self;
}

uint64_t _XPCKeyedDecodingContainer.valueBuffer(forKey:)(void *a1)
{
  uint64_t v3 = *(void *)(*(void *)(v1 + 32) + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  swift_bridgeObjectRetain();
  uint64_t v4 = dispatch thunk of CodingKey.stringValue.getter();
  if (*(void *)(v3 + 16) && (unint64_t v6 = specialized __RawDictionaryStorage.find<A>(_:)(v4, v5), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(*(void *)(v3 + 56) + 8 * v6);
    swift_retain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v8 = a1[3];
    uint64_t v9 = a1[4];
    int64_t v10 = __swift_project_boxed_opaque_existential_1(a1, v8);
    type metadata accessor for DecodingError();
    swift_allocError();
    keyNotFoundError<A>(codingMetadata:key:)((uint64_t)v10, v8, v9, v11);
    swift_willThrow();
  }
  return v8;
}

uint64_t XPCEncoder.encode<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for XPCEncoder();
  uint64_t v8 = *(void *)(v3 + 16);
  swift_bridgeObjectRetain();
  uint64_t v9 = MEMORY[0x263F8EE78];
  static XPCEncoder.encode<A>(_:withCodingMetadata:)(a1, MEMORY[0x263F8EE78], v8, a2, a3, (uint64_t)v14);
  swift_bridgeObjectRelease();
  if (!v4)
  {
    type metadata accessor for EncodingBuffer();
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v9;
    uint64_t v11 = v15;
    uint64_t v12 = v16;
    __swift_project_boxed_opaque_existential_1(v14, v15);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v10, v11, v12);
    swift_beginAccess();
    uint64_t v9 = *(void *)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  }
  return v9;
}

uint64_t static XPCDecoder.decode<A>(from:withCodingMetadata:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  type metadata accessor for _XPCDecoder();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 40) = 0u;
  *(_OWORD *)(v10 + 56) = 0u;
  *(void *)(v10 + 72) = 0;
  *(void *)(v10 + 24) = a3;
  *(void *)(v10 + 32) = a1;
  *(void *)(v10 + 16) = a2;
  type metadata accessor for XPCCodableObjectRepresentableCache();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  if (static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)(a4, a4))
  {
    _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>()(a4, a5);
    return swift_release();
  }
  else
  {
    _s3XPC11_XPCDecoderCACs7DecoderAAWlTm_1((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, v11, (void (*)(uint64_t))type metadata accessor for _XPCDecoder);
    return dispatch thunk of Decodable.init(from:)();
  }
}

uint64_t lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t _s3XPC11_XPCDecoderCACs7DecoderAAWlTm_0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t _s3XPC11_XPCDecoderCACs7DecoderAAWlTm_1(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t static XPCEncoder.encode<A>(_:withCodingMetadata:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v28 = a5;
  uint64_t v34 = a1;
  uint64_t v24 = a6;
  uint64_t v9 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for _XPCEncoder();
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 32) = 0u;
  *(_OWORD *)(v13 + 48) = 0u;
  *(void *)(v13 + 64) = 0;
  *(void *)(v13 + 16) = a2;
  *(void *)(v13 + 24) = a3;
  type metadata accessor for XPCCodableObjectRepresentableCache();
  uint64_t v25 = a2;
  swift_bridgeObjectRetain();
  uint64_t v26 = a3;
  swift_bridgeObjectRetain();
  if ((static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)(a4, a4) & 1) == 0)
  {
    uint64_t v32 = v12;
    uint64_t v33 = _s3XPC11_XPCEncoderCACs7EncoderAAWlTm_1(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, v14, (void (*)(uint64_t))type metadata accessor for _XPCEncoder);
    *(void *)&long long v31 = v13;
    swift_retain();
    uint64_t v17 = v34;
    uint64_t v18 = v27;
    dispatch thunk of Encodable.encode(to:)();
    if (v18)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v31);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v31);
    goto LABEL_9;
  }
  uint64_t v16 = v27;
  uint64_t v15 = v28;
  uint64_t v17 = v34;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v34, a4);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  if (!swift_dynamicCast())
  {
    uint64_t v30 = 0;
    memset(v29, 0, sizeof(v29));
    uint64_t v20 = outlined destroy of DecodingContainer?((uint64_t)v29, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    MEMORY[0x270FA5388](v20);
    *(&v23 - 2) = a4;
    *(&v23 - 1) = v15;
    type metadata accessor for EncodingError();
    swift_allocError();
    encodingError<A>(codingMetadata:value:message:)(v17, (void (*)(uint64_t))partial apply for implicit closure #1 in static XPCEncoder.encode<A>(_:withCodingMetadata:), a4, v21);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v29, (uint64_t)&v31);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v31);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v31);
  if (!v16)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v13 + 32, (uint64_t)&v31);
    if (v32)
    {
      swift_release();
      return outlined init with take of Encodable(&v31, v24);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v31, &demangling cache variable for type metadata for EncodingContainer?);
    type metadata accessor for EncodingError();
    swift_allocError();
    encodingError<A>(codingMetadata:value:message:)(v17, (void (*)(uint64_t))implicit closure #1 in default argument 2 of encodingError<A>(codingMetadata:value:message:), a4, v22);
    goto LABEL_12;
  }
  return swift_release();
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

uint64_t type metadata accessor for XPCCodableObjectRepresentableCache()
{
  return self;
}

uint64_t static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)(uint64_t a1, uint64_t a2)
{
  if (one-time initialization token for global != -1) {
    swift_once();
  }

  return specialized XPCCodableObjectRepresentableCache._checkConformance<A>(forType:)(a2);
}

uint64_t specialized XPCCodableObjectRepresentableCache._checkConformance<A>(forType:)(uint64_t a1)
{
  if (one-time initialization token for global != -1) {
    swift_once();
  }
  swift_beginAccess();
  char v2 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(a1, (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v2 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2()) {
      uint64_t v3 = a1;
    }
    else {
      uint64_t v3 = 0;
    }
    uint64_t v4 = v3 != 0;
    swift_beginAccess();
    uint64_t v5 = static XPCCodableObjectRepresentableCache._Cache.global;
    unint64_t v6 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = v5[2];
    v5[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v4, a1, isUniquelyReferenced_nonNull_native);
    v5[2] = v9;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v6);
  }
  else
  {
    uint64_t v4 = v2 & 1;
  }
  swift_endAccess();
  return v4;
}

uint64_t XPCCodableObjectRepresentableCache._Cache.subscript.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (os_unfair_lock_s *)(a2 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a2 + 24));
  uint64_t v5 = *(void *)(a2 + 16);
  if (*(void *)(v5 + 16) && (unint64_t v6 = specialized __RawDictionaryStorage.find<A>(_:)(a1), (v7 & 1) != 0)) {
    uint64_t v8 = *(unsigned __int8 *)(*(void *)(v5 + 56) + v6);
  }
  else {
    uint64_t v8 = 2;
  }
  os_unfair_lock_unlock(v4);
  return v8;
}

uint64_t lazy protocol witness table accessor for type _XPCEncoder and conformance _XPCEncoder(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t _s3XPC11_XPCEncoderCACs7EncoderAAWlTm_0(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t _s3XPC11_XPCEncoderCACs7EncoderAAWlTm_1(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t type metadata accessor for _XPCEncoder()
{
  return self;
}

uint64_t type metadata accessor for _XPCDecoder()
{
  return self;
}

uint64_t type metadata accessor for EncodingBuffer()
{
  return self;
}

uint64_t static XPCReceivedMessage.encodeMessage<A>(_:isSync:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, xpc_object_t *a5@<X8>)
{
  xpc_object_t empty = xpc_array_create_empty();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CodingUserInfoKey, Any)>);
  uint64_t v10 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (CodingUserInfoKey, Any))
              - 8);
  unint64_t v11 = (*(unsigned __int8 *)(*(void *)v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v10 + 80);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_20DA2D050;
  unint64_t v13 = v12 + v11;
  uint64_t v14 = (void *)(v12 + v11 + v10[14]);
  if (one-time initialization token for xpcCodable != -1) {
    swift_once();
  }
  uint64_t v15 = type metadata accessor for CodingUserInfoKey();
  uint64_t v16 = __swift_project_value_buffer(v15, (uint64_t)static CodingUserInfoKey.xpcCodable);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v16, v15);
  void v14[3] = &type metadata for XPCArray;
  *uint64_t v14 = empty;
  swift_unknownObjectRetain();
  unint64_t v17 = specialized Dictionary.init(dictionaryLiteral:)(v12);
  type metadata accessor for XPCEncoder();
  *(void *)(swift_initStackObject() + 16) = v17;
  uint64_t v18 = XPCEncoder.encode<A>(_:)(a1, a3, a4);
  swift_bridgeObjectRelease();
  if (!v5)
  {
    *a5 = xpc_dictionary_create_empty();
    swift_bridgeObjectRetain();
    specialized String.withCString<A>(_:)(0x656C6261646F435FLL, 0xEC00000079646F42, a5, v18);
    swift_bridgeObjectRelease();
    unint64_t v19 = (_xpc_connection_s *)xpc_BOOL_create(a2 & 1);
    swift_unknownObjectRetain();
    specialized String.withCString<A>(_:)(0x656C6261646F435FLL, 0xEE00636E79537349, v19, a5);
    swift_unknownObjectRelease();
    swift_unknownObjectRetain();
    specialized String.withCString<A>(_:)(0xD000000000000011, 0x800000020DA32620, a5, empty);
  }
  return swift_unknownObjectRelease();
}

uint64_t type metadata accessor for XPCEncoder()
{
  return self;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (CodingUserInfoKey, Any));
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    char v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CodingUserInfoKey, Any>);
  uint64_t v6 = static _DictionaryStorage.allocate(capacity:)();
  char v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    outlined init with copy of (String, DecodingContainer)(v12, (uint64_t)v5, &demangling cache variable for type metadata for (CodingUserInfoKey, Any));
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = type metadata accessor for CodingUserInfoKey();
    (*(void (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    unint64_t result = (unint64_t)outlined init with take of Any(v9, (_OWORD *)(v7[7] + 32 * v16));
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
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

{
  return specialized Dictionary.init(dictionaryLiteral:)(a1, (uint64_t *)&demangling cache variable for type metadata for _DictionaryStorage<String, EncodingContainer>, &demangling cache variable for type metadata for (String, EncodingContainer), (uint64_t (*)(uint64_t *, unint64_t))outlined init with take of Encodable);
}

{
  return specialized Dictionary.init(dictionaryLiteral:)(a1, &demangling cache variable for type metadata for _DictionaryStorage<String, DecodingContainer>, (uint64_t *)&demangling cache variable for type metadata for (String, DecodingContainer), (uint64_t (*)(uint64_t *, unint64_t))outlined init with take of Encodable);
}

{
  void *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, DecodingBuffer>);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    char v7 = *v4;
    swift_bridgeObjectRetain();
    swift_retain();
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    unint64_t v11 = v2[2];
    uint64_t v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
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

{
  uint64_t v1;
  void *v3;
  unsigned char *i;
  uint64_t v5;
  char v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<ObjectIdentifier, Bool>);
    uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
    for (i = (unsigned char *)(a1 + 40); ; i += 16)
    {
      uint64_t v5 = *((void *)i - 1);
      uint64_t v6 = *i;
      unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v5);
      if (v8) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(void *)(v3[6] + 8 * result) = v5;
      *(unsigned char *)(v3[7] + result) = v6;
      uint64_t v9 = v3[2];
      uint64_t v10 = __OFADD__(v9, 1);
      unint64_t v11 = v9 + 1;
      if (v10) {
        goto LABEL_10;
      }
      v3[2] = v11;
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

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  type metadata accessor for CodingUserInfoKey();
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

{
  uint64_t v2;
  uint64_t vars8;

  uint64_t v2 = static Hasher._hash(seed:_:)();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = a1;
  uint64_t v4 = type metadata accessor for CodingUserInfoKey();
  MEMORY[0x270FA5388](v4);
  char v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v20 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v11 = v5 + 16;
    uint64_t v12 = v13;
    uint64_t v14 = *(void *)(v11 + 56);
    char v15 = (void (**)(char *, uint64_t))(v11 - 8);
    do
    {
      uint64_t v16 = v11;
      v12(v7, *(void *)(v22 + 48) + v14 * v9, v4);
      char v17 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*v15)(v7, v4);
      if (v17) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
      uint64_t v11 = v16;
    }
    while (((*(void *)(v20 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    char v7 = *(void *)(v2 + 48);
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

uint64_t outlined init with copy of (String, DecodingContainer)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t specialized String.withCString<A>(_:)(uint64_t a1, uint64_t a2, _xpc_connection_s *a3, void **a4)
{
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
    return swift_unknownObjectRelease();
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0) {
      uint64_t v6 = (const char *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v6 = (const char *)_StringObject.sharedUTF8.getter();
    }
    partial apply for closure #1 in XPCDictionary.subscript.setter(v6);
    return swift_unknownObjectRelease();
  }
  *(void *)key = a1;
  uint64_t v11 = a2 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v8 = MEMORY[0x2105634B0](a3);
  unint64_t v9 = *a4;
  if (v8 == MEMORY[0x263EF86F0]) {
    xpc_dictionary_set_connection(v9, key, a3);
  }
  else {
    xpc_dictionary_set_value(v9, key, a3);
  }
  return swift_unknownObjectRelease();
}

uint64_t specialized String.withCString<A>(_:)(uint64_t a1, uint64_t a2, xpc_object_t *a3, uint64_t a4)
{
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
    return swift_bridgeObjectRelease();
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0) {
      uint64_t v4 = (char *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v4 = (char *)_StringObject.sharedUTF8.getter();
    }
    partial apply for closure #1 in XPCDictionary.subscript.setter(v4);
    return swift_bridgeObjectRelease();
  }
  *(void *)key = a1;
  uint64_t v7 = a2 & 0xFFFFFFFFFFFFFFLL;
  xpc_dictionary_set_data(*a3, key, (const void *)(a4 + 32), *(void *)(a4 + 16));
  return swift_bridgeObjectRelease();
}

uint64_t specialized String.withCString<A>(_:)(uint64_t a1, uint64_t a2, xpc_object_t *a3, xpc_object_t value)
{
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
    return swift_unknownObjectRelease();
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0)
    {
      uint64_t v5 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      uint64_t v6 = a1 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v5 = _StringObject.sharedUTF8.getter();
    }
    specialized closure #1 in _StringGuts.withCString<A>(_:)(v5, v6, (uint64_t (*)(void))partial apply for closure #1 in XPCDictionary.subscript.setter);
    return swift_unknownObjectRelease();
  }
  *(void *)key = a1;
  uint64_t v9 = a2 & 0xFFFFFFFFFFFFFFLL;
  xpc_dictionary_set_value(*a3, key, value);
  return swift_unknownObjectRelease();
}

{
  char *v4;
  char key[8];
  uint64_t v7;

  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
    return swift_unknownObjectRelease();
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0) {
      uint64_t v4 = (char *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v4 = (char *)_StringObject.sharedUTF8.getter();
    }
    partial apply for closure #1 in XPCDictionary.subscript.setter(v4);
    return swift_unknownObjectRelease();
  }
  *(void *)key = a1;
  uint64_t v7 = a2 & 0xFFFFFFFFFFFFFFLL;
  xpc_dictionary_set_value(*a3, key, value);
  return swift_unknownObjectRelease();
}

uint64_t specialized closure #1 in _StringGuts.withCString<A>(_:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

void partial apply for closure #1 in XPCDictionary.subscript.setter(char *a1)
{
  closure #1 in XPCDictionary.subscript.setter(a1, *(xpc_object_t **)(v1 + 16), *(void **)(v1 + 24));
}

{
  uint64_t v1;

  closure #1 in XPCDictionary.subscript.setter(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(xpc_object_t **)(v1 + 32));
}

void closure #1 in XPCDictionary.subscript.setter(char *key, xpc_object_t *a2, void *a3)
{
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(char a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = specialized __RawDictionaryStorage.find<A>(_:)(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 >= result && (a3 & 1) != 0)
  {
LABEL_7:
    uint64_t v16 = *v4;
    if (v14)
    {
LABEL_8:
      *(unsigned char *)(v16[7] + v10) = a1 & 1;
      return result;
    }
    goto LABEL_11;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)specialized _NativeDictionary.copy()();
    goto LABEL_7;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(result, a3 & 1);
  uint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(a2);
  if ((v14 & 1) != (v17 & 1))
  {
LABEL_15:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v10 = result;
  uint64_t v16 = *v4;
  if (v14) {
    goto LABEL_8;
  }
LABEL_11:

  return specialized _NativeDictionary._insert(at:key:value:)(v10, a2, a1 & 1, v16);
}

unint64_t specialized _NativeDictionary._insert(at:key:value:)(unint64_t result, uint64_t a2, char a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  *(void *)(a4[6] + 8 * result) = a2;
  *(unsigned char *)(a4[7] + result) = a3;
  uint64_t v4 = a4[2];
  BOOL v5 = __OFADD__(v4, 1);
  uint64_t v6 = v4 + 1;
  if (v5) {
    __break(1u);
  }
  else {
    a4[2] = v6;
  }
  return result;
}

void specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(uint64_t a1, char a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  char v40 = *(unsigned char *)(a1 + 40);
  swift_bridgeObjectRetain();
  uint64_t v8 = (void *)*a3;
  unint64_t v10 = specialized __RawDictionaryStorage.find<A>(_:)(v7);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12)) {
    goto LABEL_23;
  }
  char v14 = v9;
  if (v8[3] >= v13)
  {
    if (a2)
    {
      if (v9) {
        goto LABEL_10;
      }
    }
    else
    {
      specialized _NativeDictionary.copy()();
      if (v14) {
        goto LABEL_10;
      }
    }
LABEL_13:
    uint64_t v19 = (void *)*a3;
    *(void *)(*a3 + 8 * (v10 >> 6) + 64) |= 1 << v10;
    *(void *)(v19[6] + 8 * v10) = v7;
    *(unsigned char *)(v19[7] + v10) = v40;
    uint64_t v20 = v19[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v19[2] = v22;
    uint64_t v23 = v4 - 1;
    if (v4 == 1)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return;
    }
    uint64_t v24 = (unsigned char *)(a1 + 56);
    while (1)
    {
      uint64_t v25 = *((void *)v24 - 1);
      char v26 = *v24;
      uint64_t v27 = (void *)*a3;
      unint64_t v28 = specialized __RawDictionaryStorage.find<A>(_:)(v25);
      uint64_t v30 = v27[2];
      BOOL v31 = (v29 & 1) == 0;
      BOOL v21 = __OFADD__(v30, v31);
      uint64_t v32 = v30 + v31;
      if (v21) {
        break;
      }
      char v33 = v29;
      if (v27[3] < v32)
      {
        specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v32, 1);
        unint64_t v28 = specialized __RawDictionaryStorage.find<A>(_:)(v25);
        if ((v33 & 1) != (v34 & 1)) {
          goto LABEL_25;
        }
      }
      if (v33) {
        goto LABEL_10;
      }
      long long v35 = (void *)*a3;
      *(void *)(*a3 + 8 * (v28 >> 6) + 64) |= 1 << v28;
      *(void *)(v35[6] + 8 * v28) = v25;
      *(unsigned char *)(v35[7] + v28) = v26;
      uint64_t v36 = v35[2];
      BOOL v21 = __OFADD__(v36, 1);
      uint64_t v37 = v36 + 1;
      if (v21) {
        goto LABEL_24;
      }
      v35[2] = v37;
      v24 += 16;
      if (!--v23) {
        goto LABEL_22;
      }
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v13, a2 & 1);
  unint64_t v15 = specialized __RawDictionaryStorage.find<A>(_:)(v7);
  if ((v14 & 1) == (v16 & 1))
  {
    unint64_t v10 = v15;
    if ((v14 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    char v17 = (void *)swift_allocError();
    swift_willThrow();
    id v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease_n();

      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
LABEL_26:
  _StringGuts.grow(_:)(30);
  v38._object = (void *)0x800000020DA317D0;
  v38._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v38);
  _print_unlocked<A, B>(_:_:)();
  v39._countAndFlagsBits = 39;
  v39._object = (void *)0xE100000000000000;
  String.append(_:)(v39);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void *specialized _NativeDictionary.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<ObjectIdentifier, Bool>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    if (__OFADD__(v9++, 1)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    if (!v18) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    char v16 = *(unsigned char *)(*(void *)(v2 + 56) + v15);
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    *(unsigned char *)(*(void *)(v4 + 56) + v15) = v16;
  }
  int64_t v19 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, DecodingBuffer>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    uint64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    uint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      uint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    char v16 = 16 * v15;
    char v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    unint64_t v18 = v17[1];
    int64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    BOOL v21 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
  }
  uint64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  uint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    uint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

{
  return specialized _NativeDictionary.copy()(&demangling cache variable for type metadata for _DictionaryStorage<String, DecodingContainer>, (void (*)(unsigned char *, uint64_t))outlined init with take of Encodable);
}

{
  return specialized _NativeDictionary.copy()((uint64_t *)&demangling cache variable for type metadata for _DictionaryStorage<String, EncodingContainer>, (void (*)(unsigned char *, uint64_t))outlined init with take of Encodable);
}

uint64_t one-time initialization function for resetValue()
{
  v11[0] = MEMORY[0x263F8D4F8];
  v11[1] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Bool?);
  v11[2] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [Bool]);
  v11[3] = MEMORY[0x263F8D310];
  v11[4] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for String?);
  v11[5] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [String]);
  v11[6] = MEMORY[0x263F8D5C8];
  v11[7] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Float?);
  v11[8] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [Float]);
  v11[9] = MEMORY[0x263F8D538];
  v11[10] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Double?);
  v11[11] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [Double]);
  v11[12] = MEMORY[0x263F8E498];
  v11[13] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Int8?);
  v11[14] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [Int8]);
  v11[15] = MEMORY[0x263F8E4F0];
  v11[16] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Int16?);
  v11[17] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [Int16]);
  v11[18] = MEMORY[0x263F8E548];
  v11[19] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Int32?);
  v11[20] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [Int32]);
  v11[21] = MEMORY[0x263F8E5C0];
  v11[22] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Int64?);
  v11[23] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [Int64]);
  v11[24] = MEMORY[0x263F8D6C8];
  v11[25] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Int?);
  v11[26] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [Int]);
  v11[27] = MEMORY[0x263F8E778];
  v11[28] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UInt8?);
  v11[29] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [UInt8]);
  v11[30] = MEMORY[0x263F8E888];
  v11[31] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UInt16?);
  v11[32] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [UInt16]);
  v11[33] = MEMORY[0x263F8E8F8];
  v11[34] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UInt32?);
  v11[35] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [UInt32]);
  v11[36] = MEMORY[0x263F8E970];
  v11[37] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UInt64?);
  v11[38] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt64]);
  v11[39] = MEMORY[0x263F8D9D0];
  v11[40] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UInt?);
  v11[41] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [UInt]);
  uint64_t v10 = MEMORY[0x263F8EE78];
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, 42, 0);
  uint64_t v0 = 0;
  uint64_t v1 = v10;
  uint64_t v2 = *(void *)(v10 + 16);
  uint64_t v3 = 16 * v2;
  do
  {
    uint64_t v4 = v11[v0];
    uint64_t v10 = v1;
    unint64_t v5 = *(void *)(v1 + 24);
    uint64_t v6 = v2 + v0 + 1;
    if (v2 + v0 >= v5 >> 1)
    {
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v5 > 1), v2 + v0 + 1, 1);
      uint64_t v1 = v10;
    }
    ++v0;
    *(void *)(v1 + 16) = v6;
    uint64_t v7 = v1 + v3;
    *(void *)(v7 + 32) = v4;
    *(unsigned char *)(v7 + 40) = 0;
    v3 += 16;
  }
  while (v0 != 42);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<ObjectIdentifier, Bool>);
  uint64_t v10 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v8 = swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v8, 1, &v10);
  uint64_t result = swift_release();
  static XPCCodableObjectRepresentableCache._Cache.resetValue = v10;
  return result;
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

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

{
  char **v3;
  char *result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(ObjectIdentifier, Bool)>);
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
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  size_t v15 = 16 * v8;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[v15]) {
      memmove(v13, v14, v15);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v15);
  }
  swift_release();
  return v10;
}

{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
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
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
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

uint64_t specialized Dictionary.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    outlined init with take of Encodable((long long *)a1, (uint64_t)v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)((uint64_t)v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    outlined destroy of DecodingContainer?(a1, &demangling cache variable for type metadata for DecodingContainer?);
    specialized Dictionary._Variant.removeValue(forKey:)(a2, a3, (void (*)(unint64_t, uint64_t))outlined init with take of Encodable, &demangling cache variable for type metadata for _DictionaryStorage<String, DecodingContainer>, (void (*)(unsigned char *, uint64_t))outlined init with take of Encodable, (uint64_t)v9);
    swift_bridgeObjectRelease();
    return outlined destroy of DecodingContainer?((uint64_t)v9, &demangling cache variable for type metadata for DecodingContainer?);
  }
}

{
  uint64_t *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unsigned char v9[40];

  if (*(void *)(a1 + 24))
  {
    outlined init with take of Encodable((long long *)a1, (uint64_t)v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)((uint64_t)v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    outlined destroy of DecodingContainer?(a1, &demangling cache variable for type metadata for EncodingContainer?);
    specialized Dictionary._Variant.removeValue(forKey:)(a2, a3, (void (*)(unint64_t, uint64_t))outlined init with take of Encodable, (uint64_t *)&demangling cache variable for type metadata for _DictionaryStorage<String, EncodingContainer>, (void (*)(unsigned char *, uint64_t))outlined init with take of Encodable, (uint64_t)v9);
    swift_bridgeObjectRelease();
    return outlined destroy of DecodingContainer?((uint64_t)v9, &demangling cache variable for type metadata for EncodingContainer?);
  }
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a1, a2, a3, a4, (void (*)(void))specialized _NativeDictionary.copy(), (void (*)(void))specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:), (uint64_t (*)(uint64_t, uint64_t))outlined init with take of Encodable, (void (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))specialized _NativeDictionary._insert(at:key:value:));
}

{
  return specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a1, a2, a3, a4, (void (*)(void))specialized _NativeDictionary.copy(), (void (*)(void))specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:), (uint64_t (*)(uint64_t, uint64_t))outlined init with take of Encodable, (void (*)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))specialized _NativeDictionary._insert(at:key:value:));
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance _XPCUnkeyedEncodingContainer(uint64_t a1)
{
  return _XPCUnkeyedEncodingContainer.encode(to:)(a1);
}

uint64_t _XPCUnkeyedEncodingContainer.encode(to:)(uint64_t a1)
{
  uint64_t v3 = (char **)(a1 + 16);
  swift_beginAccess();
  uint64_t v4 = *(char **)(a1 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a1 + 16) = v4;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v4 + 2) + 1, 1, v4);
    *uint64_t v3 = v4;
  }
  unint64_t v7 = *((void *)v4 + 2);
  unint64_t v6 = *((void *)v4 + 3);
  if (v7 >= v6 >> 1)
  {
    uint64_t v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v6 > 1), v7 + 1, 1, v4);
    *uint64_t v3 = v4;
  }
  *((void *)v4 + 2) = v7 + 1;
  v4[v7 + 32] = 16;
  uint64_t v8 = *(void *)(*(void *)(*(void *)(v1 + 32) + 16) + 16);
  swift_retain();
  specialized CodingIntegerPrimitive.forEachByte(do:)(v8, a1);
  swift_release();
  swift_retain();
  swift_retain();
  specialized EncodingBuffer.appendSized(_:)(a1, v1, a1);
  swift_release();
  return swift_release();
}

uint64_t specialized EncodingBuffer.appendSized(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(void *)(v6 + 16) = 8;
  uint64_t v7 = a1 + 16;
  *(void *)(v6 + 32) = 0xCCCCCCCCCCCCCCCCLL;
  swift_beginAccess();
  int64_t v8 = *(void *)(*(void *)(a1 + 16) + 16);
  specialized Array.append<A>(contentsOf:)(v6);
  uint64_t result = closure #1 in _XPCUnkeyedEncodingContainer.encode(to:)(a2, a3);
  int64_t v10 = v8 + 8;
  if (__OFADD__(v8, 8))
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v11 = *(void *)(*(void *)v7 + 16);
  uint64_t result = v11 - v10;
  if (__OFSUB__(v11, v10))
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v12 = MEMORY[0x263F8EE78];
  uint64_t result = specialized CodingIntegerPrimitive.forEachByte(do:)(result, &v12);
  if (v10 >= v8)
  {
    specialized Array.replaceSubrange<A>(_:with:)(v8, v8 + 8, v12);
    return swift_bridgeObjectRelease();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t closure #1 in _XPCUnkeyedEncodingContainer.encode(to:)(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 16);
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    uint64_t v5 = v2 + 32;
    swift_bridgeObjectRetain();
    do
    {
      outlined init with copy of XPCCodableObjectRepresentable(v5, (uint64_t)v8);
      uint64_t v6 = v9;
      uint64_t v7 = v10;
      __swift_project_boxed_opaque_existential_1(v8, v9);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a2, v6, v7);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
      v5 += 40;
      --v3;
    }
    while (v3);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance _XPCSingleValueEncodingContainer(uint64_t a1)
{
  return _XPCSingleValueEncodingContainer.encode(to:)(a1);
}

uint64_t _XPCSingleValueEncodingContainer.encode(to:)(uint64_t a1)
{
  swift_beginAccess();
  outlined init with copy of EncodingContainer?(v1 + 32, (uint64_t)&v6);
  if (!v7)
  {
    outlined destroy of DecodingContainer?((uint64_t)&v6, &demangling cache variable for type metadata for EncodingContainer?);
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD00000000000001DLL, 0x800000020DA31DE0);
  }
  outlined init with take of Encodable(&v6, (uint64_t)v8);
  uint64_t v3 = v9;
  uint64_t v4 = v10;
  __swift_project_boxed_opaque_existential_1(v8, v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(a1, v3, v4);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance String(uint64_t a1)
{
  return specialized CodingPrimitive.encode(to:)(a1, *v1, v1[1]);
}

uint64_t specialized CodingPrimitive.encode(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v6 = (char **)(a1 + 16);
  swift_beginAccess();
  uint64_t v7 = *(char **)(a1 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a1 + 16) = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v7 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v7 + 2) + 1, 1, v7);
    *long long v6 = v7;
  }
  unint64_t v10 = *((void *)v7 + 2);
  unint64_t v9 = *((void *)v7 + 3);
  if (v10 >= v9 >> 1)
  {
    uint64_t v7 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v9 > 1), v10 + 1, 1, v7);
    *long long v6 = v7;
  }
  *((void *)v7 + 2) = v10 + 1;
  v7[v10 + 32] = 15;
  v12[0] = a2;
  v12[1] = a3;
  swift_retain();
  swift_bridgeObjectRetain();
  specialized String.withUTF8<A>(_:)(v12, a1);
  return swift_bridgeObjectRelease();
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance Double(uint64_t a1)
{
  return specialized CodingPrimitive.encode(to:)(a1, *v1);
}

uint64_t specialized CodingPrimitive.encode(to:)(uint64_t a1, double a2)
{
  uint64_t v4 = (char **)(a1 + 16);
  swift_beginAccess();
  uint64_t v5 = *(char **)(a1 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a1 + 16) = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v5 + 2) + 1, 1, v5);
    *uint64_t v4 = v5;
  }
  unint64_t v8 = *((void *)v5 + 2);
  unint64_t v7 = *((void *)v5 + 3);
  if (v8 >= v7 >> 1)
  {
    uint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, v5);
    *uint64_t v4 = v5;
  }
  *((void *)v5 + 2) = v8 + 1;
  v5[v8 + 32] = 14;
  swift_retain();
  specialized CodingIntegerPrimitive.forEachByte(do:)(*(void *)&a2, a1);
  return swift_release();
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance UInt64(uint64_t a1)
{
  return specialized CodingPrimitive.encode(to:)(a1, *v1);
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance Int32(uint64_t a1)
{
  return specialized CodingPrimitive.encode(to:)(a1, *v1);
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance Bool(uint64_t a1)
{
  return specialized CodingPrimitive.encode(to:)(a1, *v1);
}

uint64_t specialized CodingPrimitive.encode(to:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (char **)(a1 + 16);
  swift_beginAccess();
  uint64_t v5 = *(char **)(a1 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a1 + 16) = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v5 + 2) + 1, 1, v5);
    *uint64_t v4 = v5;
  }
  unint64_t v8 = *((void *)v5 + 2);
  unint64_t v7 = *((void *)v5 + 3);
  if (v8 >= v7 >> 1)
  {
    uint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, v5);
    *uint64_t v4 = v5;
  }
  *((void *)v5 + 2) = v8 + 1;
  v5[v8 + 32] = 11;
  swift_retain();
  specialized CodingIntegerPrimitive.forEachByte(do:)(a2, a1);
  return swift_release();
}

{
  char **v4;
  char *v5;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  unint64_t v8;

  uint64_t v4 = (char **)(a1 + 16);
  swift_beginAccess();
  uint64_t v5 = *(char **)(a1 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a1 + 16) = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v5 + 2) + 1, 1, v5);
    *uint64_t v4 = v5;
  }
  unint64_t v8 = *((void *)v5 + 2);
  unint64_t v7 = *((void *)v5 + 3);
  if (v8 >= v7 >> 1)
  {
    uint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, v5);
    *uint64_t v4 = v5;
  }
  *((void *)v5 + 2) = v8 + 1;
  v5[v8 + 32] = 5;
  swift_retain();
  specialized CodingIntegerPrimitive.forEachByte(do:)(a2, a1);
  return swift_release();
}

{
  char **v4;
  char *v5;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  unint64_t v8;

  uint64_t v4 = (char **)(a1 + 16);
  swift_beginAccess();
  uint64_t v5 = *(char **)(a1 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a1 + 16) = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v5 + 2) + 1, 1, v5);
    *uint64_t v4 = v5;
  }
  unint64_t v8 = *((void *)v5 + 2);
  unint64_t v7 = *((void *)v5 + 3);
  if (v8 >= v7 >> 1)
  {
    uint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, v5);
    *uint64_t v4 = v5;
  }
  *((void *)v5 + 2) = v8 + 1;
  v5[v8 + 32] = 2;
  swift_retain();
  specialized CodingIntegerPrimitive.forEachByte(do:)(a2, a1);
  return swift_release();
}

{
  char **v4;
  char *v5;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  unint64_t v8;

  uint64_t v4 = (char **)(a1 + 16);
  swift_beginAccess();
  uint64_t v5 = *(char **)(a1 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a1 + 16) = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v5 + 2) + 1, 1, v5);
    *uint64_t v4 = v5;
  }
  unint64_t v8 = *((void *)v5 + 2);
  unint64_t v7 = *((void *)v5 + 3);
  if (v8 >= v7 >> 1)
  {
    uint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, v5);
    *uint64_t v4 = v5;
  }
  *((void *)v5 + 2) = v8 + 1;
  v5[v8 + 32] = 6;
  swift_retain();
  specialized CodingIntegerPrimitive.forEachByte(do:)(a2, a1);
  return swift_release();
}

{
  char **v4;
  char *v5;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  unint64_t v8;

  uint64_t v4 = (char **)(a1 + 16);
  swift_beginAccess();
  uint64_t v5 = *(char **)(a1 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a1 + 16) = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v5 + 2) + 1, 1, v5);
    *uint64_t v4 = v5;
  }
  unint64_t v8 = *((void *)v5 + 2);
  unint64_t v7 = *((void *)v5 + 3);
  if (v8 >= v7 >> 1)
  {
    uint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, v5);
    *uint64_t v4 = v5;
  }
  *((void *)v5 + 2) = v8 + 1;
  v5[v8 + 32] = 7;
  swift_retain();
  specialized CodingIntegerPrimitive.forEachByte(do:)(a2, a1);
  return swift_release();
}

{
  char **v4;
  char *v5;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  unint64_t v8;

  uint64_t v4 = (char **)(a1 + 16);
  swift_beginAccess();
  uint64_t v5 = *(char **)(a1 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a1 + 16) = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v5 + 2) + 1, 1, v5);
    *uint64_t v4 = v5;
  }
  unint64_t v8 = *((void *)v5 + 2);
  unint64_t v7 = *((void *)v5 + 3);
  if (v8 >= v7 >> 1)
  {
    uint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, v5);
    *uint64_t v4 = v5;
  }
  *((void *)v5 + 2) = v8 + 1;
  v5[v8 + 32] = 10;
  swift_retain();
  specialized CodingIntegerPrimitive.forEachByte(do:)(a2, a1);
  return swift_release();
}

uint64_t specialized CodingIntegerPrimitive.forEachByte(do:)(int a1, uint64_t a2)
{
  closure #1 in CodingIntegerPrimitive.encodeValue(to:)(a1, a2);
  closure #1 in CodingIntegerPrimitive.encodeValue(to:)(SBYTE1(a1), a2);
  closure #1 in CodingIntegerPrimitive.encodeValue(to:)(SBYTE2(a1), a2);

  return closure #1 in CodingIntegerPrimitive.encodeValue(to:)(SHIBYTE(a1), a2);
}

uint64_t specialized CodingPrimitive.encode(to:)(uint64_t a1, char a2)
{
  uint64_t v4 = (uint64_t *)(a1 + 16);
  swift_beginAccess();
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a1 + 16) = v5;
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v5 + 16) + 1, 1, (char *)v5);
    uint64_t v5 = result;
    *uint64_t v4 = result;
  }
  unint64_t v8 = *(void *)(v5 + 16);
  unint64_t v7 = *(void *)(v5 + 24);
  if (v8 >= v7 >> 1)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, (char *)v5);
    uint64_t v5 = result;
    *uint64_t v4 = result;
  }
  *(void *)(v5 + 16) = v8 + 1;
  *(unsigned char *)(v5 + v8 + 32) = 12;
  uint64_t v9 = *v4;
  unint64_t v11 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v11 >= v10 >> 1)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1, (char *)v9);
    uint64_t v9 = result;
    *uint64_t v4 = result;
  }
  *(void *)(v9 + 16) = v11 + 1;
  *(unsigned char *)(v9 + v11 + 32) = a2 & 1;
  return result;
}

{
  uint64_t *v4;
  uint64_t v5;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  uint64_t v4 = (uint64_t *)(a1 + 16);
  swift_beginAccess();
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a1 + 16) = v5;
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v5 + 16) + 1, 1, (char *)v5);
    uint64_t v5 = result;
    *uint64_t v4 = result;
  }
  unint64_t v8 = *(void *)(v5 + 16);
  unint64_t v7 = *(void *)(v5 + 24);
  if (v8 >= v7 >> 1)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, (char *)v5);
    uint64_t v5 = result;
    *uint64_t v4 = result;
  }
  *(void *)(v5 + 16) = v8 + 1;
  *(unsigned char *)(v5 + v8 + 32) = 3;
  uint64_t v9 = *v4;
  unint64_t v11 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v11 >= v10 >> 1)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1, (char *)v9);
    uint64_t v9 = result;
    *uint64_t v4 = result;
  }
  *(void *)(v9 + 16) = v11 + 1;
  *(unsigned char *)(v9 + v11 + 32) = a2;
  return result;
}

{
  uint64_t *v4;
  uint64_t v5;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  uint64_t v4 = (uint64_t *)(a1 + 16);
  swift_beginAccess();
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a1 + 16) = v5;
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v5 + 16) + 1, 1, (char *)v5);
    uint64_t v5 = result;
    *uint64_t v4 = result;
  }
  unint64_t v8 = *(void *)(v5 + 16);
  unint64_t v7 = *(void *)(v5 + 24);
  if (v8 >= v7 >> 1)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, (char *)v5);
    uint64_t v5 = result;
    *uint64_t v4 = result;
  }
  *(void *)(v5 + 16) = v8 + 1;
  *(unsigned char *)(v5 + v8 + 32) = 8;
  uint64_t v9 = *v4;
  unint64_t v11 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v11 >= v10 >> 1)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1, (char *)v9);
    uint64_t v9 = result;
    *uint64_t v4 = result;
  }
  *(void *)(v9 + 16) = v11 + 1;
  *(unsigned char *)(v9 + v11 + 32) = a2;
  return result;
}

uint64_t DecodingBuffer.__deallocating_deinit()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t XPCDictionary.init(_:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = MEMORY[0x2105634B0]();
  if (result == MEMORY[0x263EF8708]) {
    *a2 = a1;
  }
  else {
    __break(1u);
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCSession.InitializationOptions()
{
  return &type metadata for XPCSession.InitializationOptions;
}

uint64_t type metadata completion function for _XPCKeyedEncodingContainer()
{
  return swift_initClassMetadata2();
}

uint64_t protocol witness for Encoder.container<A>(keyedBy:) in conformance _XPCEncoder()
{
  return _XPCEncoder.container<A>(keyedBy:)();
}

ValueMetadata *type metadata accessor for XPCReceivedMessage()
{
  return &type metadata for XPCReceivedMessage;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.nestedContainer<A>(keyedBy:forKey:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1, uint64_t a2)
{
  return _XPCKeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)(a1, a2);
}

uint64_t _XPCEncoder.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of DecodingContainer?(v0 + 32, &demangling cache variable for type metadata for EncodingContainer?);

  return MEMORY[0x270FA0228](v0, 72, 7);
}

uint64_t _XPCKeyedEncodingContainer.encode<A>(_:forKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v32 = a4;
  uint64_t v5 = v4;
  uint64_t v30 = a1;
  uint64_t v31 = a3;
  uint64_t v6 = *v4;
  uint64_t v7 = *(void *)(v6 + 80);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](a1);
  unint64_t v10 = (char *)&v30 - v9;
  unint64_t v11 = *(void (**)(char *))(v8 + 16);
  uint64_t v38 = v12;
  v11((char *)&v30 - v9);
  uint64_t v13 = v5[4];
  uint64_t v14 = *(void *)(v6 + 88);
  swift_retain();
  uint64_t v15 = dispatch thunk of CodingKey.stringValue.getter();
  uint64_t v17 = v16;
  swift_beginAccess();
  uint64_t v18 = *(void *)(v13 + 16);
  if (*(void *)(v18 + 16) && (unint64_t v19 = specialized __RawDictionaryStorage.find<A>(_:)(v15, v17), (v20 & 1) != 0))
  {
    outlined init with copy of XPCCodableObjectRepresentable(*(void *)(v18 + 56) + 40 * v19, (uint64_t)&v35);
  }
  else
  {
    uint64_t v37 = 0;
    long long v35 = 0u;
    long long v36 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v21 = *((void *)&v36 + 1);
  uint64_t result = outlined destroy of DecodingContainer?((uint64_t)&v35, &demangling cache variable for type metadata for EncodingContainer?);
  if (v21)
  {
    __break(1u);
  }
  else
  {
    uint64_t v23 = CodingMetadata.appending<A>(codingKey:)(v38, v5[2], v5[3], v7, v14);
    uint64_t v25 = v24;
    type metadata accessor for XPCEncoder();
    uint64_t v26 = v33;
    static XPCEncoder.encode<A>(_:withCodingMetadata:)(v30, v23, v25, v31, v32, (uint64_t)&v35);
    if (v26)
    {
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_retain();
      uint64_t v27 = dispatch thunk of CodingKey.stringValue.getter();
      uint64_t v29 = v28;
      outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v35, (uint64_t)v34);
      swift_beginAccess();
      specialized Dictionary.subscript.setter((uint64_t)v34, v27, v29);
      swift_endAccess();
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v35);
    }
  }
  return result;
}

uint64_t _XPCKeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  uint64_t v4 = CodingMetadata.appending<A>(codingKey:)(a2, v2[2], v2[3], *(void *)(*v2 + 80), *(void *)(*v2 + 88));
  uint64_t v6 = v5;
  uint64_t v7 = v2[4];
  swift_retain();
  uint64_t v8 = dispatch thunk of CodingKey.stringValue.getter();
  uint64_t v10 = v9;
  swift_beginAccess();
  uint64_t v11 = *(void *)(v7 + 16);
  if (*(void *)(v11 + 16) && (unint64_t v12 = specialized __RawDictionaryStorage.find<A>(_:)(v8, v10), (v13 & 1) != 0))
  {
    outlined init with copy of XPCCodableObjectRepresentable(*(void *)(v11 + 56) + 40 * v12, (uint64_t)&v25);
  }
  else
  {
    uint64_t v27 = 0;
    long long v25 = 0u;
    long long v26 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_release();
  uint64_t v14 = *((void *)&v26 + 1);
  if (*((void *)&v26 + 1))
  {
    uint64_t v15 = v27;
    uint64_t v16 = __swift_project_boxed_opaque_existential_1(&v25, *((uint64_t *)&v26 + 1));
    *((void *)&v29 + 1) = v14;
    uint64_t v30 = *(_UNKNOWN ***)(v15 + 8);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v28);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(boxed_opaque_existential_1, v16, v14);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
  }
  else
  {
    outlined destroy of DecodingContainer?((uint64_t)&v25, &demangling cache variable for type metadata for EncodingContainer?);
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v30 = 0;
  }
  uint64_t v18 = type metadata accessor for _XPCKeyedEncodingContainer();
  char v19 = static SharableStorageContainer.getExisting<A>(container:codingMetadata:)((uint64_t)&v25, (uint64_t)&v28, v4, v6, v3, v18, (uint64_t)&protocol witness table for _XPCKeyedEncodingContainer<A>, (uint64_t)&protocol witness table for _XPCKeyedEncodingContainer<A>, (uint64_t)&protocol witness table for KeyedEncodingStorage);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of DecodingContainer?((uint64_t)&v28, &demangling cache variable for type metadata for CodingContainer?);
  uint64_t v20 = v25;
  if (v19)
  {
    swift_retain();
    uint64_t v21 = dispatch thunk of CodingKey.stringValue.getter();
    uint64_t v23 = v22;
    *((void *)&v29 + 1) = v18;
    uint64_t v30 = &protocol witness table for _XPCKeyedEncodingContainer<A>;
    *(void *)&long long v28 = v20;
    swift_beginAccess();
    swift_retain();
    specialized Dictionary.subscript.setter((uint64_t)&v28, v21, v23);
    swift_endAccess();
    swift_release();
  }
  *(void *)&long long v28 = v20;
  swift_getWitnessTable();
  return KeyedEncodingContainer.init<A>(_:)();
}

uint64_t _XPCEncoder.container<A>(keyedBy:)()
{
  uint64_t v1 = v0 + 32;
  swift_beginAccess();
  outlined init with copy of EncodingContainer?(v0 + 32, (uint64_t)v13);
  uint64_t v2 = v14;
  if (v14)
  {
    uint64_t v3 = v15;
    uint64_t v4 = __swift_project_boxed_opaque_existential_1(v13, v14);
    *((void *)&v17 + 1) = v2;
    uint64_t v18 = *(_UNKNOWN ***)(v3 + 8);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v16);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v2 - 8) + 16))(boxed_opaque_existential_1, v4, v2);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  }
  else
  {
    outlined destroy of DecodingContainer?((uint64_t)v13, &demangling cache variable for type metadata for EncodingContainer?);
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v18 = 0;
  }
  uint64_t v6 = type metadata accessor for _XPCKeyedEncodingContainer();
  uint64_t v7 = *(void *)(v0 + 16);
  uint64_t v8 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v9 = static SharableStorageContainer.getExisting<A>(container:codingMetadata:)((uint64_t)v13, (uint64_t)&v16, v7, v8, v6, v6, (uint64_t)&protocol witness table for _XPCKeyedEncodingContainer<A>, (uint64_t)&protocol witness table for _XPCKeyedEncodingContainer<A>, (uint64_t)&protocol witness table for KeyedEncodingStorage);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of DecodingContainer?((uint64_t)&v16, &demangling cache variable for type metadata for CodingContainer?);
  uint64_t v10 = v13[0];
  if ((v9 & 1) == 0) {
    goto LABEL_7;
  }
  *((void *)&v17 + 1) = v6;
  uint64_t v18 = &protocol witness table for _XPCKeyedEncodingContainer<A>;
  *(void *)&long long v16 = v13[0];
  outlined init with copy of EncodingContainer?(v1, (uint64_t)v13);
  uint64_t v11 = v14;
  swift_retain();
  uint64_t result = outlined destroy of DecodingContainer?((uint64_t)v13, &demangling cache variable for type metadata for EncodingContainer?);
  if (!v11)
  {
    swift_beginAccess();
    outlined assign with take of EncodingContainer?((uint64_t)&v16, v1);
    swift_endAccess();
LABEL_7:
    *(void *)&long long v16 = v10;
    swift_getWitnessTable();
    return KeyedEncodingContainer.init<A>(_:)();
  }
  __break(1u);
  return result;
}

uint64_t outlined init with copy of EncodingContainer?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EncodingContainer?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t static SharableStorageContainer.getExisting<A>(container:codingMetadata:initialStorage:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v45 = a5;
  uint64_t v57 = a4;
  uint64_t v47 = a1;
  uint64_t v48 = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v43 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  char v13 = (char *)&v36 - v12;
  uint64_t v14 = swift_getAssociatedTypeWitness();
  uint64_t v15 = type metadata accessor for Optional();
  uint64_t v41 = *(void *)(v15 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v36 - v17;
  uint64_t v42 = *(void *)(v14 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  char v40 = (char *)&v36 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v36 - v21;
  uint64_t v46 = a2;
  outlined init with copy of CodingContainer?(a2, (uint64_t)v49);
  if (!v50)
  {
    outlined destroy of DecodingContainer?((uint64_t)v49, &demangling cache variable for type metadata for CodingContainer?);
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v53 = 0;
LABEL_8:
    uint64_t v23 = v9;
    goto LABEL_9;
  }
  uint64_t v39 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingContainer);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SharableStorageContainer);
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v53 = 0;
    long long v51 = 0u;
    long long v52 = 0u;
    goto LABEL_8;
  }
  uint64_t v23 = v9;
  if (!*((void *)&v52 + 1))
  {
LABEL_9:
    uint64_t result = outlined destroy of DecodingContainer?((uint64_t)&v51, &demangling cache variable for type metadata for SharableStorageContainer?);
    goto LABEL_10;
  }
  uint64_t v38 = v9;
  outlined init with take of Encodable(&v51, (uint64_t)v54);
  uint64_t v24 = v55;
  uint64_t v25 = v56;
  __swift_project_boxed_opaque_existential_1(v54, v55);
  uint64_t v36 = v25;
  uint64_t v37 = *(void (**)(uint64_t, uint64_t))(v25 + 24);
  *((void *)&v52 + 1) = swift_getAssociatedTypeWitness();
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v51);
  v37(v24, v36);
  int v26 = swift_dynamicCast();
  uint64_t v27 = v42;
  long long v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v42 + 56);
  if (v26)
  {
    v28(v18, 0, 1, v14);
    long long v29 = *(void (**)(char *, char *, uint64_t))(v27 + 32);
    v29(v22, v18, v14);
    uint64_t v30 = v40;
    v29(v40, v22, v14);
    (*(void (**)(uint64_t, uint64_t, char *, uint64_t, uint64_t))(a9 + 32))(v48, v57, v30, a7, a9);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v54);
    char v31 = 0;
    return v31 & 1;
  }
  v28(v18, 1, 1, v14);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v18, v39);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v54);
  uint64_t v23 = v38;
LABEL_10:
  if (!*(void *)(v46 + 24))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v13, v45, AssociatedTypeWitness);
    uint64_t v33 = *(void (**)(uint64_t, uint64_t, char *, uint64_t, uint64_t))(a9 + 40);
    uint64_t v34 = v48;
    swift_bridgeObjectRetain();
    uint64_t v35 = v57;
    swift_bridgeObjectRetain();
    v33(v34, v35, v13, a7, a9);
    if (!v23) {
      char v31 = 1;
    }
    return v31 & 1;
  }
  __break(1u);
  return result;
}

uint64_t outlined destroy of DecodingContainer?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t outlined init with copy of CodingContainer?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingContainer?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void *protocol witness for SharableStorageContainer.init(codingMetadata:initialStorage:) in conformance _XPCKeyedEncodingContainer<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  uint64_t result = _XPCKeyedEncodingContainer.__allocating_init(codingMetadata:storage:)(a1, a2, *a3);
  *a4 = result;
  return result;
}

void *_XPCKeyedEncodingContainer.__allocating_init(codingMetadata:storage:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  return result;
}

uint64_t outlined assign with take of EncodingContainer?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EncodingContainer?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t static SharableStorageContainer.getExisting<A>(container:codingMetadata:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v16 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v17 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v19 = (char *)&v23 - v18;
  (*(void (**)(uint64_t, uint64_t))(a9 + 8))(v17, a9);
  LOBYTE(a4) = static SharableStorageContainer.getExisting<A>(container:codingMetadata:initialStorage:)(a1, a2, a3, a4, (uint64_t)v19, v20, a6, v21, a8);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v19, AssociatedTypeWitness);
  return a4 & 1;
}

unint64_t protocol witness for SharableStorage.init() in conformance KeyedEncodingStorage@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = swift_allocObject();
  unint64_t result = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  *(void *)(v2 + 16) = result;
  *a1 = v2;
  return result;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t *, unint64_t))
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v8 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  uint64_t v10 = v7 + 64;
  uint64_t v11 = a1 + 32;
  swift_retain();
  while (1)
  {
    outlined init with copy of (String, DecodingContainer)(v11, (uint64_t)&v20, a3);
    uint64_t v12 = v20;
    uint64_t v13 = v21;
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v20, v21);
    if (v15) {
      break;
    }
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v16 = (uint64_t *)(v8[6] + 16 * result);
    *uint64_t v16 = v12;
    v16[1] = v13;
    unint64_t result = a4(&v22, v8[7] + 40 * result);
    uint64_t v17 = v8[2];
    BOOL v18 = __OFADD__(v17, 1);
    uint64_t v19 = v17 + 1;
    if (v18) {
      goto LABEL_11;
    }
    v8[2] = v19;
    v11 += 56;
    if (!--v9)
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

uint64_t *specialized String.withUTF8<A>(_:)(uint64_t *result, uint64_t a2)
{
  uint64_t v3 = *result;
  unint64_t v4 = result[1];
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    v21[0] = v3;
    v21[1] = v4 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v15 = HIBYTE(v4) & 0xF;
    swift_retain();
    specialized CodingIntegerPrimitive.forEachByte(do:)(v15 + 1, a2);
    swift_release();
    uint64_t v8 = (char **)(a2 + 16);
    swift_beginAccess();
    uint64_t v10 = v21;
    uint64_t v11 = v15;
    goto LABEL_8;
  }
  uint64_t v12 = result;
  uint64_t v3 = static String._copying(_:)();
  uint64_t v14 = v13;
  unint64_t result = (uint64_t *)swift_bridgeObjectRelease();
  *uint64_t v12 = v3;
  v12[1] = v14;
  unint64_t v4 = v14;
  if ((v14 & 0x2000000000000000) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((v3 & 0x1000000000000000) == 0)
  {
    unint64_t result = (uint64_t *)_StringObject.sharedUTF8.getter();
    uint64_t v5 = (uint64_t)result;
    uint64_t v6 = v20;
    uint64_t v7 = v20 + 1;
    if (!__OFADD__(v20, 1)) {
      goto LABEL_5;
    }
LABEL_15:
    __break(1u);
    return result;
  }
  uint64_t v5 = (v4 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v6 = v3 & 0xFFFFFFFFFFFFLL;
  uint64_t v7 = (v3 & 0xFFFFFFFFFFFFLL) + 1;
  if (__OFADD__(v3 & 0xFFFFFFFFFFFFLL, 1)) {
    goto LABEL_15;
  }
LABEL_5:
  swift_retain();
  specialized CodingIntegerPrimitive.forEachByte(do:)(v7, a2);
  swift_release();
  uint64_t v8 = (char **)(a2 + 16);
  swift_beginAccess();
  uint64_t v10 = (void *)v5;
  uint64_t v11 = v6;
LABEL_8:
  specialized Array.append<A>(contentsOf:)((uint64_t)v10, v11, v9);
  uint64_t v16 = *(char **)(a2 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a2 + 16) = v16;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v16 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v16 + 2) + 1, 1, v16);
    *uint64_t v8 = v16;
  }
  unint64_t v19 = *((void *)v16 + 2);
  unint64_t v18 = *((void *)v16 + 3);
  if (v19 >= v18 >> 1)
  {
    uint64_t v16 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v18 > 1), v19 + 1, 1, v16);
    *uint64_t v8 = v16;
  }
  *((void *)v16 + 2) = v19 + 1;
  v16[v19 + 32] = 0;
  return (uint64_t *)swift_release();
}

uint64_t _XPCKeyedEncodingContainer.encode(to:)(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for _XPCKeyedEncodingContainer();
  specialized EncodingContainer.encodeType(to:)(a1, v3, (uint64_t)&protocol witness table for _XPCKeyedEncodingContainer<A>);
  uint64_t v4 = *(void *)(v1 + 32);
  swift_beginAccess();
  uint64_t v5 = *(void *)(*(void *)(v4 + 16) + 16);
  swift_retain();
  specialized CodingIntegerPrimitive.forEachByte(do:)(v5, a1);
  swift_release();
  return EncodingBuffer.appendSized(_:)((uint64_t (*)(uint64_t))partial apply for closure #1 in _XPCKeyedEncodingContainer.encode(to:));
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t specialized CodingIntegerPrimitive.forEachByte(do:)(uint64_t a1, uint64_t a2)
{
  closure #1 in CodingIntegerPrimitive.encodeValue(to:)(a1, a2);
  closure #1 in CodingIntegerPrimitive.encodeValue(to:)(SBYTE1(a1), a2);
  closure #1 in CodingIntegerPrimitive.encodeValue(to:)(SBYTE2(a1), a2);
  closure #1 in CodingIntegerPrimitive.encodeValue(to:)(SBYTE3(a1), a2);
  closure #1 in CodingIntegerPrimitive.encodeValue(to:)(SBYTE4(a1), a2);
  closure #1 in CodingIntegerPrimitive.encodeValue(to:)(SBYTE5(a1), a2);
  closure #1 in CodingIntegerPrimitive.encodeValue(to:)(SBYTE6(a1), a2);

  return closure #1 in CodingIntegerPrimitive.encodeValue(to:)(SHIBYTE(a1), a2);
}

uint64_t closure #1 in CodingIntegerPrimitive.encodeValue(to:)(char a1, uint64_t a2)
{
  uint64_t v4 = (uint64_t *)(a2 + 16);
  swift_beginAccess();
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a2 + 16) = v5;
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v5 + 16) + 1, 1, (char *)v5);
    uint64_t v5 = result;
    *uint64_t v4 = result;
  }
  unint64_t v8 = *(void *)(v5 + 16);
  unint64_t v7 = *(void *)(v5 + 24);
  if (v8 >= v7 >> 1)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, (char *)v5);
    uint64_t v5 = result;
    *uint64_t v4 = result;
  }
  *(void *)(v5 + 16) = v8 + 1;
  *(unsigned char *)(v5 + v8 + 32) = a1;
  return result;
}

uint64_t type metadata accessor for _XPCKeyedEncodingContainer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t specialized EncodingContainer.encodeType(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v4 = (*(uint64_t (**)(uint64_t))(*(void *)(a3 + 8) + 8))(a2);
  uint64_t v5 = (uint64_t *)(a1 + 16);
  swift_beginAccess();
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a1 + 16) = v6;
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v6 + 16) + 1, 1, (char *)v6);
    uint64_t v6 = result;
    uint64_t *v5 = result;
  }
  unint64_t v9 = *(void *)(v6 + 16);
  unint64_t v8 = *(void *)(v6 + 24);
  if (v9 >= v8 >> 1)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v8 > 1), v9 + 1, 1, (char *)v6);
    uint64_t v6 = result;
    uint64_t *v5 = result;
  }
  *(void *)(v6 + 16) = v9 + 1;
  *(unsigned char *)(v6 + v9 + 32) = v4 + 1;
  return result;
}

uint64_t static _XPCKeyedDecodingContainer.wireType.getter()
{
  return 16;
}

uint64_t EncodingBuffer.appendSized(_:)(uint64_t (*a1)(uint64_t))
{
  uint64_t v3 = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(void *)(v3 + 16) = 8;
  uint64_t v4 = v1 + 16;
  *(void *)(v3 + 32) = 0xCCCCCCCCCCCCCCCCLL;
  swift_beginAccess();
  int64_t v5 = *(void *)(*(void *)(v1 + 16) + 16);
  uint64_t v6 = specialized Array.append<A>(contentsOf:)(v3);
  uint64_t result = a1(v6);
  int64_t v8 = v5 + 8;
  if (__OFADD__(v5, 8))
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v9 = *(void *)(*(void *)v4 + 16);
  uint64_t result = v9 - v8;
  if (__OFSUB__(v9, v8))
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v10 = MEMORY[0x263F8EE78];
  uint64_t result = specialized CodingIntegerPrimitive.forEachByte(do:)(result, &v10);
  if (v8 >= v5)
  {
    specialized Array.replaceSubrange<A>(_:with:)(v5, v5 + 8, v10);
    return swift_bridgeObjectRelease();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t specialized Array.append<A>(contentsOf:)(uint64_t result)
{
  int64_t v2 = *(void *)(result + 16);
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
    int64_t v11 = v4 + v2;
  }
  else {
    int64_t v11 = v4;
  }
  uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)result, v11, 1, (char *)v3);
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
  uint64_t v7 = *(void *)(v3 + 16);
  if ((*(void *)(v3 + 24) >> 1) - v7 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t result = (uint64_t)memcpy((void *)(v3 + v7 + 32), (const void *)(v6 + 32), v2);
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v8 = *(void *)(v3 + 16);
  BOOL v9 = __OFADD__(v8, v2);
  uint64_t v10 = v8 + v2;
  if (!v9)
  {
    *(void *)(v3 + 16) = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

unint64_t specialized Array.replaceSubrange<A>(_:with:)(unint64_t result, int64_t a2, uint64_t a3)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v5 = *v3;
  int64_t v6 = *(void *)(*v3 + 16);
  if (v6 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  unint64_t v7 = result;
  unint64_t v8 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  size_t v10 = *(void *)(a3 + 16);
  size_t v11 = v10 - v8;
  if (__OFSUB__(v10, v8))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  int64_t v12 = v6 + v11;
  if (__OFADD__(v6, v11))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    return result;
  }
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (!result || v12 > *(void *)(v5 + 24) >> 1)
  {
    if (v6 <= v12) {
      int64_t v13 = v6 + v11;
    }
    else {
      int64_t v13 = v6;
    }
    uint64_t result = (unint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)result, v13, 1, (char *)v5);
    unint64_t v5 = result;
  }
  unint64_t v14 = v5 + 32;
  uint64_t v15 = (char *)(v5 + 32 + v7);
  if (!v11) {
    goto LABEL_19;
  }
  uint64_t v16 = *(void *)(v5 + 16);
  size_t v17 = v16 - a2;
  if (__OFSUB__(v16, a2)) {
    goto LABEL_27;
  }
  uint64_t result = (unint64_t)&v15[v10];
  unint64_t v18 = (const void *)(v14 + a2);
  if (&v15[v10] != (char *)(v14 + a2) || result >= (unint64_t)v18 + v17) {
    uint64_t result = (unint64_t)memmove((void *)result, v18, v17);
  }
  uint64_t v19 = *(void *)(v5 + 16);
  BOOL v20 = __OFADD__(v19, v11);
  size_t v21 = v19 + v11;
  if (v20) {
    goto LABEL_28;
  }
  *(void *)(v5 + 16) = v21;
LABEL_19:
  if (v10) {
    uint64_t result = (unint64_t)memcpy(v15, (const void *)(a3 + 32), v10);
  }
  *uint64_t v3 = v5;
  return result;
}

uint64_t specialized CodingIntegerPrimitive.forEachByte(do:)(uint64_t a1, uint64_t *a2)
{
  closure #1 in CodingIntegerPrimitive.asBytes()(a1, a2);
  closure #1 in CodingIntegerPrimitive.asBytes()(SBYTE1(a1), a2);
  closure #1 in CodingIntegerPrimitive.asBytes()(SBYTE2(a1), a2);
  closure #1 in CodingIntegerPrimitive.asBytes()(SBYTE3(a1), a2);
  closure #1 in CodingIntegerPrimitive.asBytes()(SBYTE4(a1), a2);
  closure #1 in CodingIntegerPrimitive.asBytes()(SBYTE5(a1), a2);
  closure #1 in CodingIntegerPrimitive.asBytes()(SBYTE6(a1), a2);

  return closure #1 in CodingIntegerPrimitive.asBytes()(SHIBYTE(a1), a2);
}

uint64_t closure #1 in CodingIntegerPrimitive.asBytes()(char a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *a2 = v4;
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v4 + 16) + 1, 1, (char *)v4);
    uint64_t v4 = result;
    *a2 = result;
  }
  unint64_t v7 = *(void *)(v4 + 16);
  unint64_t v6 = *(void *)(v4 + 24);
  if (v7 >= v6 >> 1)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v6 > 1), v7 + 1, 1, (char *)v4);
    uint64_t v4 = result;
  }
  *(void *)(v4 + 16) = v7 + 1;
  *(unsigned char *)(v4 + v7 + 32) = a1;
  *a2 = v4;
  return result;
}

uint64_t closure #1 in _XPCKeyedEncodingContainer.encode(to:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 16);
  uint64_t v31 = v4 + 64;
  uint64_t v5 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(v4 + 64);
  unint64_t v8 = (char **)(a2 + 16);
  uint64_t v33 = v4;
  swift_bridgeObjectRetain();
  uint64_t result = swift_beginAccess();
  int64_t v10 = 0;
  int64_t v32 = (unint64_t)(v5 + 63) >> 6;
  if (!v7) {
    goto LABEL_6;
  }
LABEL_4:
  unint64_t v11 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  unint64_t v12 = v11 | (v10 << 6);
LABEL_5:
  uint64_t v13 = *(void *)(v33 + 56);
  unint64_t v14 = (void *)(*(void *)(v33 + 48) + 16 * v12);
  uint64_t v15 = v14[1];
  *(void *)&long long v35 = *v14;
  *((void *)&v35 + 1) = v15;
  outlined init with copy of XPCCodableObjectRepresentable(v13 + 40 * v12, (uint64_t)&v36);
  swift_bridgeObjectRetain();
  while (1)
  {
    outlined init with take of (key: String, value: EncodingContainer)?((uint64_t)&v35, (uint64_t)&v39);
    uint64_t v18 = v40;
    if (!v40) {
      return swift_release();
    }
    uint64_t v19 = v39;
    outlined init with take of Encodable(&v41, (uint64_t)&v35);
    BOOL v20 = *v8;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *unint64_t v8 = v20;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      BOOL v20 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v20 + 2) + 1, 1, v20);
      *unint64_t v8 = v20;
    }
    unint64_t v23 = *((void *)v20 + 2);
    unint64_t v22 = *((void *)v20 + 3);
    if (v23 >= v22 >> 1)
    {
      BOOL v20 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v22 > 1), v23 + 1, 1, v20);
      *unint64_t v8 = v20;
    }
    *((void *)v20 + 2) = v23 + 1;
    v20[v23 + 32] = 15;
    v34[0] = v19;
    v34[1] = v18;
    swift_retain();
    swift_bridgeObjectRetain();
    specialized String.withUTF8<A>(_:)(v34, a2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v24 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(v24 + 16) = 8;
    *(void *)(v24 + 32) = 0xCCCCCCCCCCCCCCCCLL;
    int64_t v25 = *(void *)(*(void *)(a2 + 16) + 16);
    specialized Array.append<A>(contentsOf:)(v24);
    uint64_t v27 = *((void *)&v36 + 1);
    uint64_t v26 = v37;
    __swift_project_boxed_opaque_existential_1(&v35, *((uint64_t *)&v36 + 1));
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(a2, v27, v26);
    int64_t v28 = v25 + 8;
    if (__OFADD__(v25, 8)) {
      break;
    }
    uint64_t v29 = *((void *)*v8 + 2);
    uint64_t result = v29 - v28;
    if (__OFSUB__(v29, v28)) {
      goto LABEL_39;
    }
    v34[0] = MEMORY[0x263F8EE78];
    uint64_t result = specialized CodingIntegerPrimitive.forEachByte(do:)(result, v34);
    if (v28 < v25) {
      goto LABEL_40;
    }
    specialized Array.replaceSubrange<A>(_:with:)(v25, v25 + 8, v34[0]);
    swift_bridgeObjectRelease();
    uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v35);
    if (v7) {
      goto LABEL_4;
    }
LABEL_6:
    int64_t v16 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_41;
    }
    if (v16 < v32)
    {
      unint64_t v17 = *(void *)(v31 + 8 * v16);
      if (v17) {
        goto LABEL_9;
      }
      v10 += 2;
      if (v16 + 1 >= v32)
      {
        int64_t v10 = v16;
      }
      else
      {
        unint64_t v17 = *(void *)(v31 + 8 * v10);
        if (v17)
        {
          ++v16;
          goto LABEL_9;
        }
        if (v16 + 2 < v32)
        {
          unint64_t v17 = *(void *)(v31 + 8 * (v16 + 2));
          if (v17)
          {
            v16 += 2;
            goto LABEL_9;
          }
          int64_t v30 = v16 + 3;
          if (v16 + 3 < v32)
          {
            unint64_t v17 = *(void *)(v31 + 8 * v30);
            if (!v17)
            {
              while (1)
              {
                int64_t v16 = v30 + 1;
                if (__OFADD__(v30, 1)) {
                  goto LABEL_42;
                }
                if (v16 >= v32)
                {
                  int64_t v10 = v32 - 1;
                  goto LABEL_14;
                }
                unint64_t v17 = *(void *)(v31 + 8 * v16);
                ++v30;
                if (v17) {
                  goto LABEL_9;
                }
              }
            }
            v16 += 3;
LABEL_9:
            unint64_t v7 = (v17 - 1) & v17;
            unint64_t v12 = __clz(__rbit64(v17)) + (v16 << 6);
            int64_t v10 = v16;
            goto LABEL_5;
          }
          int64_t v10 = v16 + 2;
        }
      }
    }
LABEL_14:
    unint64_t v7 = 0;
    uint64_t v38 = 0;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v35 = 0u;
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
  return result;
}

uint64_t outlined init with take of (key: String, value: EncodingContainer)?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: String, value: EncodingContainer)?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
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

uint64_t partial apply for closure #1 in _XPCKeyedEncodingContainer.encode(to:)()
{
  return closure #1 in _XPCKeyedEncodingContainer.encode(to:)(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t outlined init with copy of XPCCodableObjectRepresentable(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1)
{
  return _XPCKeyedEncodingContainer.encode(to:)(a1);
}

uint64_t specialized Array.append<A>(contentsOf:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, unsigned __int8 *a3@<X8>)
{
  uint64_t v5 = *v3;
  int64_t v6 = *(void *)(*v3 + 16);
  int64_t v7 = v6 + a2;
  if (__OFADD__(v6, a2))
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = (unsigned __int8 *)result;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if (!result || (int64_t v9 = *(void *)(v5 + 24) >> 1, v9 < v7))
    {
      if (v6 <= v7) {
        int64_t v10 = v7;
      }
      else {
        int64_t v10 = v6;
      }
      uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)result, v10, 1, (char *)v5);
      uint64_t v5 = result;
      int64_t v9 = *(void *)(result + 24) >> 1;
    }
    uint64_t v11 = *(void *)(v5 + 16);
    uint64_t v12 = v9 - v11;
    if (!a2 || v9 == v11)
    {
      a3 = &v4[a2];
      if (!v4) {
        a3 = 0;
      }
      if (a2 <= 0)
      {
        int64_t v13 = 0;
LABEL_22:
        if (v13 != v12) {
          goto LABEL_23;
        }
        goto LABEL_26;
      }
    }
    else
    {
      if (a2 >= v12) {
        int64_t v13 = v9 - v11;
      }
      else {
        int64_t v13 = a2;
      }
      uint64_t result = (uint64_t)memcpy((void *)(v5 + v11 + 32), v4, v13);
      if (v12 >= a2)
      {
        a3 = &v4[a2];
        if (v13 >= 1)
        {
          uint64_t v14 = *(void *)(v5 + 16);
          BOOL v15 = __OFADD__(v14, v13);
          uint64_t v16 = v14 + v13;
          if (v15)
          {
            __break(1u);
            return result;
          }
          *(void *)(v5 + 16) = v16;
        }
        v4 += v13;
        goto LABEL_22;
      }
    }
  }
  __break(1u);
LABEL_26:
  if (v4 && v4 != a3)
  {
    int64_t v17 = *(void *)(v5 + 16);
    int v20 = *v4;
    uint64_t v19 = v4 + 1;
    int v18 = v20;
    while (1)
    {
      unint64_t v21 = *(void *)(v5 + 24);
      int64_t v22 = v21 >> 1;
      int64_t v23 = v17 + 1;
      if ((uint64_t)(v21 >> 1) < v17 + 1)
      {
        uint64_t v33 = (char *)v5;
        uint64_t v34 = a3;
        int64_t v35 = v17;
        int v36 = v18;
        uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v21 > 1), v17 + 1, 1, v33);
        int v18 = v36;
        int64_t v17 = v35;
        a3 = v34;
        uint64_t v5 = result;
        int64_t v22 = *(void *)(result + 24) >> 1;
        if (v17 >= v22) {
          goto LABEL_30;
        }
      }
      else if (v17 >= v22)
      {
        goto LABEL_30;
      }
      *(unsigned char *)(v5 + 32 + v17) = v18;
      if (v19 == a3)
      {
LABEL_48:
        *(void *)(v5 + 16) = v23;
        break;
      }
      uint64_t v24 = (unsigned __int8 *)(v22 + ~v17);
      if (v24 >= &a3[~(unint64_t)v19]) {
        uint64_t v24 = &a3[~(unint64_t)v19];
      }
      int64_t v25 = v24 + 1;
      if ((unint64_t)(v24 + 1) > 0x10 && (unint64_t)(v17 + v5 - (void)v19 + 33) >= 0x10)
      {
        uint64_t v26 = (long long *)v19;
        uint64_t v27 = v25 & 0xF;
        if ((v25 & 0xF) == 0) {
          uint64_t v27 = 16;
        }
        int64_t v28 = &v25[-v27];
        v23 += (int64_t)v28;
        uint64_t v19 = &v28[(void)v19];
        uint64_t v29 = (_OWORD *)(v5 + v17 + 33);
        do
        {
          long long v30 = *v26++;
          *v29++ = v30;
          v28 -= 16;
        }
        while (v28);
      }
      uint64_t v31 = v19++;
      while (1)
      {
        int v32 = *v31++;
        int v18 = v32;
        if (v22 == v23) {
          break;
        }
        *(unsigned char *)(v5 + 32 + v23++) = v18;
        ++v19;
        if (v31 == a3) {
          goto LABEL_48;
        }
      }
      int64_t v17 = v22;
LABEL_30:
      *(void *)(v5 + 16) = v17;
    }
  }
LABEL_23:
  *uint64_t v3 = v5;
  return result;
}

void *protocol witness for SharableStorageContainer.init(codingMetadata:initialStorage:) in conformance _XPCKeyedDecodingContainer<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void **a3@<X2>, void *a4@<X8>)
{
  uint64_t result = _XPCKeyedDecodingContainer.__allocating_init(codingMetadata:initialStorage:)(a1, a2, *a3);
  if (!v4) {
    *a4 = result;
  }
  return result;
}

void *_XPCKeyedDecodingContainer.__allocating_init(codingMetadata:buffer:)(uint64_t a1, uint64_t a2, void *a3)
{
  static DecodingContainer.decodeType(from:withCodingMetadata:)(a3, a1, a2, v3, (uint64_t)&protocol witness table for _XPCKeyedDecodingContainer<A>);
  if (v4)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (void *)swift_release();
  }
  unint64_t v68 = (unint64_t)specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
  unint64_t v8 = specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
  uint64_t v65 = a2;
  uint64_t v9 = DecodingBuffer.consume(_:)((uint64_t)v8);
  if (!v9)
  {
    _StringGuts.grow(_:)(51);
    v54._countAndFlagsBits = 0xD00000000000002BLL;
    v54._object = (void *)0x800000020DA31880;
    String.append(_:)(v54);
    v55._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v55);
    swift_bridgeObjectRelease();
    v56._countAndFlagsBits = 0x736574796220;
    v56._object = (void *)0xE600000000000000;
    String.append(_:)(v56);
    uint64_t v57 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v59 = v58;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(31);
    swift_bridgeObjectRelease();
    v60._countAndFlagsBits = 0;
    v60._object = (void *)0xE000000000000000;
    String.append(_:)(v60);
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v57 - 8) + 104))(v59, *MEMORY[0x263F8DCB8], v57);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_willThrow();
    return (void *)swift_release();
  }
  uint64_t v13 = v9;
  uint64_t v14 = v10;
  uint64_t v15 = v12;
  uint64_t v16 = v11;
  type metadata accessor for DecodingBuffer();
  uint64_t inited = (void *)swift_initStackObject();
  inited[2] = v13;
  inited[3] = v14;
  int v18 = inited;
  inited[4] = v16;
  inited[5] = v15;
  inited[6] = 0;
  unint64_t v19 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  unint64_t v20 = v68;
  if ((v68 & 0x8000000000000000) != 0) {
    goto LABEL_53;
  }
  unint64_t v21 = (void *)v19;
  uint64_t v22 = v65;
  if (!v68)
  {
LABEL_39:
    type metadata accessor for KeyedDecodingStorage();
    uint64_t v61 = swift_allocObject();
    unint64_t v62 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
    *(void *)(v61 + 16) = v21;
    *(void *)(v61 + 24) = v62;
    swift_release();
    swift_release();
    uint64_t result = (void *)swift_allocObject();
    result[2] = a1;
    result[3] = v22;
    result[4] = v61;
    result[5] = 0;
    return result;
  }
  v63 = v18;
  while (v20)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    int64_t v23 = (void *)swift_retain();
    specialized static DecodingContainer.decodeType(from:withCodingMetadata:)(v23);
    v66 = specialized static String.decodeValue(from:withCodingMetadata:)();
    uint64_t v25 = v24;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    unint64_t v26 = (unint64_t)specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
    if ((v26 & 0x8000000000000000) != 0) {
      goto LABEL_41;
    }
    uint64_t v67 = v25;
    uint64_t v27 = v18[6];
    int64_t v28 = (char *)(v27 + v26);
    if (__OFADD__(v27, v26)) {
      goto LABEL_42;
    }
    uint64_t v29 = v18[4];
    unint64_t v30 = v18[5];
    uint64_t v31 = v30 >> 1;
    if (__OFSUB__(v30 >> 1, v29)) {
      goto LABEL_43;
    }
    unint64_t v69 = v20;
    if ((uint64_t)((v30 >> 1) - v29) >= (uint64_t)v28)
    {
      uint64_t v35 = v29 + v27;
      if (__OFADD__(v29, v27)) {
        goto LABEL_44;
      }
      uint64_t v36 = v35 + v26;
      if (__OFADD__(v35, v26)) {
        goto LABEL_45;
      }
      if (v36 < v35) {
        goto LABEL_46;
      }
      if (v31 < v35) {
        goto LABEL_47;
      }
      if (v35 < v29) {
        goto LABEL_48;
      }
      if (v31 < v36) {
        goto LABEL_49;
      }
      if (v36 < 0) {
        goto LABEL_50;
      }
      long long v64 = *((_OWORD *)v18 + 1);
      uint64_t v37 = v18[5] & 1 | (2 * v36);
      v18[6] = v28;
      uint64_t v38 = swift_allocObject();
      *(_OWORD *)(v38 + 16) = v64;
      *(void *)(v38 + 32) = v35;
      *(void *)(v38 + 40) = v37;
      *(void *)(v38 + 48) = 0;
      swift_unknownObjectRetain();
      swift_retain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v41 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v66, v67);
      uint64_t v42 = v21[2];
      BOOL v43 = (v40 & 1) == 0;
      uint64_t v44 = v42 + v43;
      if (__OFADD__(v42, v43)) {
        goto LABEL_51;
      }
      char v45 = v40;
      if (v21[3] >= v44)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          specialized _NativeDictionary.copy()();
        }
        uint64_t v46 = v67;
        if (v45) {
          goto LABEL_35;
        }
      }
      else
      {
        specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v44, isUniquelyReferenced_nonNull_native);
        uint64_t v46 = v67;
        unint64_t v47 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v66, v67);
        if ((v45 & 1) != (v48 & 1)) {
          goto LABEL_54;
        }
        unint64_t v41 = v47;
        if (v45)
        {
LABEL_35:
          uint64_t v53 = v21[7];
          swift_release();
          *(void *)(v53 + 8 * v41) = v38;
          goto LABEL_36;
        }
      }
      v21[(v41 >> 6) + 8] |= 1 << v41;
      v49 = (void *)(v21[6] + 16 * v41);
      void *v49 = v66;
      v49[1] = v46;
      *(void *)(v21[7] + 8 * v41) = v38;
      uint64_t v50 = v21[2];
      BOOL v51 = __OFADD__(v50, 1);
      uint64_t v52 = v50 + 1;
      if (v51) {
        goto LABEL_52;
      }
      void v21[2] = v52;
      swift_bridgeObjectRetain();
LABEL_36:
      uint64_t v22 = v65;
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int v18 = v63;
      unint64_t v20 = v69 - 1;
      if (v69 == 1) {
        goto LABEL_39;
      }
    }
    else
    {
      swift_bridgeObjectRetain();
      unint64_t v32 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v66, v67);
      char v34 = v33;
      swift_bridgeObjectRelease();
      if (v34)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          specialized _NativeDictionary.copy()();
        }
        swift_bridgeObjectRelease();
        specialized _NativeDictionary._delete(at:)(v32, (uint64_t)v21);
        swift_release();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      uint64_t v22 = v65;
      unint64_t v20 = v69 - 1;
      if (v69 == 1) {
        goto LABEL_39;
      }
    }
  }
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
  uint64_t result = (void *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

void *specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)()
{
  if (DecodingBuffer.consume(_:)(8))
  {
    if (v2 >> 1 != v1)
    {
      uint64_t v3 = 0;
      int64_t v4 = v2 >> 1;
      while (!__OFSUB__(v4--, 1))
      {
        if (v4 < v1 || v4 >= (uint64_t)(v2 >> 1)) {
          goto LABEL_12;
        }
        uint64_t v3 = (void *)(*(unsigned __int8 *)(v0 + v4) | ((void)v3 << 8));
        if (v4 == v1)
        {
          swift_unknownObjectRelease();
          return v3;
        }
      }
      __break(1u);
LABEL_12:
      __break(1u);
    }
    swift_unknownObjectRelease();
    return 0;
  }
  else
  {
    uint64_t v6 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v8 = v7;
    v10[0] = 0;
    v10[1] = 0xE000000000000000;
    swift_bridgeObjectRetain();
    uint64_t v3 = v10;
    _StringGuts.grow(_:)(31);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 8) + 104))(v8, *MEMORY[0x263F8DCB8], v6);
    swift_willThrow();
  }
  return v3;
}

{
  return specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
}

{
  return specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
}

{
  return specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
}

{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  void *v3;
  int64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void v10[2];

  if (DecodingBuffer.consume(_:)(4))
  {
    if (v2 >> 1 != v1)
    {
      LODWORD(v3) = 0;
      int64_t v4 = v2 >> 1;
      while (!__OFSUB__(v4--, 1))
      {
        if (v4 < v1 || v4 >= (uint64_t)(v2 >> 1)) {
          goto LABEL_12;
        }
        uint64_t v3 = (void *)(*(unsigned __int8 *)(v0 + v4) | (v3 << 8));
        if (v4 == v1)
        {
          swift_unknownObjectRelease();
          return v3;
        }
      }
      __break(1u);
LABEL_12:
      __break(1u);
    }
    swift_unknownObjectRelease();
    return 0;
  }
  else
  {
    uint64_t v6 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v8 = v7;
    v10[0] = 0;
    v10[1] = 0xE000000000000000;
    swift_bridgeObjectRetain();
    uint64_t v3 = v10;
    _StringGuts.grow(_:)(31);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 8) + 104))(v8, *MEMORY[0x263F8DCB8], v6);
    swift_willThrow();
  }
  return v3;
}

{
  return specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
}

{
  return specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
}

{
  return specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
}

{
  return specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
}

{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  int64_t v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void v10[2];

  if (DecodingBuffer.consume(_:)(1))
  {
    if (v2 >> 1 != v1)
    {
      uint64_t v3 = v2 >> 1;
      while (!__OFSUB__(v3--, 1))
      {
        if (v3 < v1 || v3 >= (uint64_t)(v2 >> 1)) {
          goto LABEL_12;
        }
        if (v3 == v1)
        {
          uint64_t v5 = (void *)*(unsigned __int8 *)(v0 + v1);
          swift_unknownObjectRelease();
          return v5;
        }
      }
      __break(1u);
LABEL_12:
      __break(1u);
    }
    swift_unknownObjectRelease();
    return 0;
  }
  else
  {
    uint64_t v6 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v8 = v7;
    v10[0] = 0;
    v10[1] = 0xE000000000000000;
    swift_bridgeObjectRetain();
    uint64_t v5 = v10;
    _StringGuts.grow(_:)(31);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 8) + 104))(v8, *MEMORY[0x263F8DCB8], v6);
    swift_willThrow();
  }
  return v5;
}

{
  return specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
}

{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  void *v3;
  int64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void v10[2];

  if (DecodingBuffer.consume(_:)(2))
  {
    if (v2 >> 1 != v1)
    {
      LODWORD(v3) = 0;
      int64_t v4 = v2 >> 1;
      while (!__OFSUB__(v4--, 1))
      {
        if (v4 < v1 || v4 >= (uint64_t)(v2 >> 1)) {
          goto LABEL_12;
        }
        uint64_t v3 = (void *)(*(unsigned __int8 *)(v0 + v4) | (v3 << 8));
        if (v4 == v1)
        {
          swift_unknownObjectRelease();
          return v3;
        }
      }
      __break(1u);
LABEL_12:
      __break(1u);
    }
    swift_unknownObjectRelease();
    return 0;
  }
  else
  {
    uint64_t v6 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v8 = v7;
    v10[0] = 0;
    v10[1] = 0xE000000000000000;
    swift_bridgeObjectRetain();
    uint64_t v3 = v10;
    _StringGuts.grow(_:)(31);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 8) + 104))(v8, *MEMORY[0x263F8DCB8], v6);
    swift_willThrow();
  }
  return v3;
}

uint64_t DecodingBuffer.consume(_:)(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v2 = v1[6];
  uint64_t v3 = v2 + result;
  if (__OFADD__(v2, result))
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v4 = v1[4];
  unint64_t v5 = v1[5];
  int64_t v6 = v5 >> 1;
  if (__OFSUB__(v5 >> 1, v4))
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if ((uint64_t)((v5 >> 1) - v4) < v3) {
    return 0;
  }
  uint64_t v7 = v4 + v2;
  if (__OFADD__(v4, v2)) {
    goto LABEL_17;
  }
  uint64_t v8 = v7 + result;
  if (__OFADD__(v7, result))
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (v8 < v7)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v6 < v7)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (v7 < v4)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (v6 < v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if ((v8 & 0x8000000000000000) == 0)
  {
    v1[6] = v3;
    return swift_unknownObjectRetain();
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void (*a5)(void), void (*a6)(void), uint64_t (*a7)(uint64_t, uint64_t), void (*a8)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v11 = v8;
  uint64_t v16 = *v8;
  unint64_t v18 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  uint64_t v19 = *(void *)(v16 + 16);
  BOOL v20 = (v17 & 1) == 0;
  uint64_t v21 = v19 + v20;
  if (__OFADD__(v19, v20))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v22 = v17;
  uint64_t v23 = *(void *)(v16 + 24);
  if (v23 < v21 || (a4 & 1) == 0)
  {
    if (v23 >= v21 && (a4 & 1) == 0)
    {
      a5();
      goto LABEL_7;
    }
    a6();
    unint64_t v27 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
    if ((v22 & 1) == (v28 & 1))
    {
      unint64_t v18 = v27;
      uint64_t v24 = *v11;
      if (v22) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v24 = *v11;
  if (v22)
  {
LABEL_8:
    uint64_t v25 = *(void *)(v24 + 56) + 40 * v18;
    __swift_destroy_boxed_opaque_existential_1(v25);
    return a7(a1, v25);
  }
LABEL_13:
  a8(v18, a2, a3, a1, v24);

  return swift_bridgeObjectRetain();
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
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

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

uint64_t specialized _NativeDictionary._insert(at:key:value:)(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t (*a6)(uint64_t, uint64_t))
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v7 = (void *)(a5[6] + 16 * a1);
  void *v7 = a2;
  v7[1] = a3;
  uint64_t result = a6(a4, a5[7] + 40 * a1);
  uint64_t v9 = a5[2];
  BOOL v10 = __OFADD__(v9, 1);
  uint64_t v11 = v9 + 1;
  if (v10) {
    __break(1u);
  }
  else {
    a5[2] = v11;
  }
  return result;
}

uint64_t outlined init with take of Encodable(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t specialized _NativeDictionary._insert(at:key:value:)(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  return specialized _NativeDictionary._insert(at:key:value:)(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t))outlined init with take of Encodable);
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2, uint64_t *a3, void (*a4)(uint64_t, unsigned char *))
{
  unint64_t v6 = v4;
  uint64_t v8 = *v4;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  char v38 = a2;
  uint64_t v9 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v10 = v9;
  if (*(void *)(v8 + 16))
  {
    uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
    uint64_t v37 = (void *)(v8 + 64);
    if (v11 < 64) {
      uint64_t v12 = ~(-1 << v11);
    }
    else {
      uint64_t v12 = -1;
    }
    unint64_t v13 = v12 & *(void *)(v8 + 64);
    int64_t v36 = (unint64_t)(v11 + 63) >> 6;
    uint64_t v14 = v9 + 64;
    uint64_t result = swift_retain();
    int64_t v16 = 0;
    while (1)
    {
      if (v13)
      {
        unint64_t v19 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        unint64_t v20 = v19 | (v16 << 6);
      }
      else
      {
        int64_t v21 = v16 + 1;
        if (__OFADD__(v16, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v36) {
          goto LABEL_34;
        }
        unint64_t v22 = v37[v21];
        ++v16;
        if (!v22)
        {
          int64_t v16 = v21 + 1;
          if (v21 + 1 >= v36) {
            goto LABEL_34;
          }
          unint64_t v22 = v37[v16];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v36)
            {
LABEL_34:
              swift_release();
              unint64_t v6 = v4;
              if (v38)
              {
                uint64_t v35 = 1 << *(unsigned char *)(v8 + 32);
                if (v35 >= 64) {
                  bzero(v37, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v37 = -1 << v35;
                }
                *(void *)(v8 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v37[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v16 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_41;
                }
                if (v16 >= v36) {
                  goto LABEL_34;
                }
                unint64_t v22 = v37[v16];
                ++v23;
                if (v22) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v16 = v23;
          }
        }
LABEL_21:
        unint64_t v13 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v16 << 6);
      }
      uint64_t v24 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v20);
      uint64_t v26 = *v24;
      uint64_t v25 = v24[1];
      uint64_t v27 = *(void *)(v8 + 56) + 40 * v20;
      if (v38)
      {
        a4(v27, v39);
      }
      else
      {
        outlined init with copy of XPCCodableObjectRepresentable(v27, (uint64_t)v39);
        swift_bridgeObjectRetain();
      }
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v28 = -1 << *(unsigned char *)(v10 + 32);
      unint64_t v29 = result & ~v28;
      unint64_t v30 = v29 >> 6;
      if (((-1 << v29) & ~*(void *)(v14 + 8 * (v29 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v29) & ~*(void *)(v14 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v31 = 0;
        unint64_t v32 = (unint64_t)(63 - v28) >> 6;
        do
        {
          if (++v30 == v32 && (v31 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v33 = v30 == v32;
          if (v30 == v32) {
            unint64_t v30 = 0;
          }
          v31 |= v33;
          uint64_t v34 = *(void *)(v14 + 8 * v30);
        }
        while (v34 == -1);
        unint64_t v17 = __clz(__rbit64(~v34)) + (v30 << 6);
      }
      *(void *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      unint64_t v18 = (void *)(*(void *)(v10 + 48) + 16 * v17);
      *unint64_t v18 = v26;
      v18[1] = v25;
      uint64_t result = ((uint64_t (*)(unsigned char *, unint64_t))a4)(v39, *(void *)(v10 + 56) + 40 * v17);
      ++*(void *)(v10 + 16);
    }
  }
  uint64_t result = swift_release();
  *unint64_t v6 = v10;
  return result;
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
{
  return specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(a1, a2, (uint64_t *)&demangling cache variable for type metadata for _DictionaryStorage<String, EncodingContainer>, (void (*)(uint64_t, unsigned char *))outlined init with take of Encodable);
}

{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  void *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  long long v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, DecodingBuffer>);
  int64_t v36 = a2;
  unint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  uint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  unint64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    int64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      unint64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      int64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        uint64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        int64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            unint64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            int64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        unint64_t v13 = v24;
      }
    }
LABEL_30:
    uint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    char v31 = *v29;
    unint64_t v30 = v29[1];
    unint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    uint64_t v15 = result & ~v14;
    int64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      uint64_t v25 = 0;
      uint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        uint64_t v27 = v16 == v26;
        if (v16 == v26) {
          int64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  BOOL v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *long long v3 = v7;
  return result;
}

{
  return specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(a1, a2, &demangling cache variable for type metadata for _DictionaryStorage<String, DecodingContainer>, (void (*)(uint64_t, unsigned char *))outlined init with take of Encodable);
}

{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  char v32;

  long long v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<ObjectIdentifier, Bool>);
  uint64_t result = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    unint64_t v32 = a2;
    char v31 = v3;
    uint64_t v8 = 0;
    uint64_t v9 = (void *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    uint64_t v12 = v11 & *(void *)(v5 + 64);
    unint64_t v13 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        int64_t v16 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v17 = v16 | (v8 << 6);
      }
      else
      {
        if (__OFADD__(v8++, 1)) {
          goto LABEL_38;
        }
        if (v8 >= v13)
        {
LABEL_29:
          if ((v32 & 1) == 0)
          {
            uint64_t result = swift_release();
            long long v3 = v31;
            goto LABEL_36;
          }
          unint64_t v30 = 1 << *(unsigned char *)(v5 + 32);
          if (v30 >= 64) {
            bzero((void *)(v5 + 64), ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
          }
          else {
            *uint64_t v9 = -1 << v30;
          }
          long long v3 = v31;
          *(void *)(v5 + 16) = 0;
          break;
        }
        unint64_t v19 = v9[v8];
        if (!v19)
        {
          unint64_t v20 = v8 + 1;
          if (v8 + 1 >= v13) {
            goto LABEL_29;
          }
          unint64_t v19 = v9[v20];
          if (!v19)
          {
            while (1)
            {
              uint64_t v8 = v20 + 1;
              if (__OFADD__(v20, 1)) {
                break;
              }
              if (v8 >= v13) {
                goto LABEL_29;
              }
              unint64_t v19 = v9[v8];
              ++v20;
              if (v19) {
                goto LABEL_19;
              }
            }
LABEL_37:
            __break(1u);
LABEL_38:
            __break(1u);
            return result;
          }
          ++v8;
        }
LABEL_19:
        uint64_t v12 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v8 << 6);
      }
      int64_t v21 = *(void *)(*(void *)(v5 + 48) + 8 * v17);
      unint64_t v22 = *(unsigned char *)(*(void *)(v5 + 56) + v17);
      uint64_t result = static Hasher._hash(seed:_:)();
      int64_t v23 = -1 << *(unsigned char *)(v7 + 32);
      uint64_t v24 = result & ~v23;
      uint64_t v25 = v24 >> 6;
      if (((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6))) != 0)
      {
        uint64_t v15 = __clz(__rbit64((-1 << v24) & ~*(void *)(v14 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        uint64_t v26 = 0;
        uint64_t v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_37;
          }
          uint64_t v28 = v25 == v27;
          if (v25 == v27) {
            uint64_t v25 = 0;
          }
          v26 |= v28;
          unint64_t v29 = *(void *)(v14 + 8 * v25);
        }
        while (v29 == -1);
        uint64_t v15 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(void *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(void *)(*(void *)(v7 + 48) + 8 * v15) = v21;
      *(unsigned char *)(*(void *)(v7 + 56) + v15) = v22;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_36:
  *long long v3 = v7;
  return result;
}

void *specialized static String.decodeValue(from:withCodingMetadata:)()
{
  uint64_t result = specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
  if (!v0)
  {
    if (DecodingBuffer.consume(_:)((uint64_t)result))
    {
      uint64_t v2 = String.init(cString:)();
      swift_unknownObjectRelease();
      return (void *)v2;
    }
    else
    {
      _StringGuts.grow(_:)(21);
      swift_bridgeObjectRelease();
      v3._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v3);
      swift_bridgeObjectRelease();
      v4._countAndFlagsBits = 0x736574796220;
      v4._object = (void *)0xE600000000000000;
      String.append(_:)(v4);
      uint64_t v5 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v7 = v6;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      v8._countAndFlagsBits = 0xD000000000000011;
      v8._object = (void *)0x800000020DA31190;
      String.append(_:)(v8);
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v5 - 8) + 104))(v7, *MEMORY[0x263F8DCB8], v5);
      swift_bridgeObjectRelease();
      return (void *)swift_willThrow();
    }
  }
  return result;
}

void *specialized static DecodingContainer.decodeType(from:withCodingMetadata:)(void *result)
{
  uint64_t v1 = result[4];
  uint64_t v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = result[6];
    if (v3 >= v2 - v1)
    {
      uint64_t v6 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 8) + 104))(v8, *MEMORY[0x263F8DCB8], v6);
      return (void *)swift_willThrow();
    }
    uint64_t v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2) {
        goto LABEL_16;
      }
      if (*(unsigned char *)(result[3] + v4) == 15)
      {
        result[6] = v3 + 1;
        return result;
      }
      uint64_t v13 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8D310], v13, v14, v12);
      swift_bridgeObjectRelease();
      return (void *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  void *v12;
  uint64_t v13;
  void *v14;

  uint64_t v1 = result[4];
  uint64_t v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = result[6];
    if (v3 >= v2 - v1)
    {
      uint64_t v6 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 8) + 104))(v8, *MEMORY[0x263F8DCB8], v6);
      return (void *)swift_willThrow();
    }
    uint64_t v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2) {
        goto LABEL_16;
      }
      if (*(unsigned char *)(result[3] + v4) == 14)
      {
        result[6] = v3 + 1;
        return result;
      }
      uint64_t v13 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8D538], v13, v14, v12);
      swift_bridgeObjectRelease();
      return (void *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  void *v12;
  uint64_t v13;
  void *v14;

  uint64_t v1 = result[4];
  uint64_t v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = result[6];
    if (v3 >= v2 - v1)
    {
      uint64_t v6 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 8) + 104))(v8, *MEMORY[0x263F8DCB8], v6);
      return (void *)swift_willThrow();
    }
    uint64_t v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2) {
        goto LABEL_16;
      }
      if (*(unsigned char *)(result[3] + v4) == 11)
      {
        result[6] = v3 + 1;
        return result;
      }
      uint64_t v13 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8E970], v13, v14, v12);
      swift_bridgeObjectRelease();
      return (void *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  void *v12;
  uint64_t v13;
  void *v14;

  uint64_t v1 = result[4];
  uint64_t v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = result[6];
    if (v3 >= v2 - v1)
    {
      uint64_t v6 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 8) + 104))(v8, *MEMORY[0x263F8DCB8], v6);
      return (void *)swift_willThrow();
    }
    uint64_t v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2) {
        goto LABEL_16;
      }
      if (*(unsigned char *)(result[3] + v4) == 5)
      {
        result[6] = v3 + 1;
        return result;
      }
      uint64_t v13 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8E548], v13, v14, v12);
      swift_bridgeObjectRelease();
      return (void *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  void *v12;
  uint64_t v13;
  void *v14;

  uint64_t v1 = result[4];
  uint64_t v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = result[6];
    if (v3 >= v2 - v1)
    {
      uint64_t v6 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 8) + 104))(v8, *MEMORY[0x263F8DCB8], v6);
      return (void *)swift_willThrow();
    }
    uint64_t v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2) {
        goto LABEL_16;
      }
      if (*(unsigned char *)(result[3] + v4) == 12)
      {
        result[6] = v3 + 1;
        return result;
      }
      uint64_t v13 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8D4F8], v13, v14, v12);
      swift_bridgeObjectRelease();
      return (void *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  void *v12;
  uint64_t v13;
  void *v14;

  uint64_t v1 = result[4];
  uint64_t v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = result[6];
    if (v3 >= v2 - v1)
    {
      uint64_t v6 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 8) + 104))(v8, *MEMORY[0x263F8DCB8], v6);
      return (void *)swift_willThrow();
    }
    uint64_t v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2) {
        goto LABEL_16;
      }
      if (*(unsigned char *)(result[3] + v4) == 2)
      {
        result[6] = v3 + 1;
        return result;
      }
      uint64_t v13 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8D6C8], v13, v14, v12);
      swift_bridgeObjectRelease();
      return (void *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  void *v12;
  uint64_t v13;
  void *v14;

  uint64_t v1 = result[4];
  uint64_t v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = result[6];
    if (v3 >= v2 - v1)
    {
      uint64_t v6 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 8) + 104))(v8, *MEMORY[0x263F8DCB8], v6);
      return (void *)swift_willThrow();
    }
    uint64_t v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2) {
        goto LABEL_16;
      }
      if (*(unsigned char *)(result[3] + v4) == 3)
      {
        result[6] = v3 + 1;
        return result;
      }
      uint64_t v13 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8E498], v13, v14, v12);
      swift_bridgeObjectRelease();
      return (void *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  void *v12;
  uint64_t v13;
  void *v14;

  uint64_t v1 = result[4];
  uint64_t v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = result[6];
    if (v3 >= v2 - v1)
    {
      uint64_t v6 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 8) + 104))(v8, *MEMORY[0x263F8DCB8], v6);
      return (void *)swift_willThrow();
    }
    uint64_t v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2) {
        goto LABEL_16;
      }
      if (*(unsigned char *)(result[3] + v4) == 4)
      {
        result[6] = v3 + 1;
        return result;
      }
      uint64_t v13 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8E4F0], v13, v14, v12);
      swift_bridgeObjectRelease();
      return (void *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  void *v12;
  uint64_t v13;
  void *v14;

  uint64_t v1 = result[4];
  uint64_t v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = result[6];
    if (v3 >= v2 - v1)
    {
      uint64_t v6 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 8) + 104))(v8, *MEMORY[0x263F8DCB8], v6);
      return (void *)swift_willThrow();
    }
    uint64_t v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2) {
        goto LABEL_16;
      }
      if (*(unsigned char *)(result[3] + v4) == 6)
      {
        result[6] = v3 + 1;
        return result;
      }
      uint64_t v13 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8E5C0], v13, v14, v12);
      swift_bridgeObjectRelease();
      return (void *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  void *v12;
  uint64_t v13;
  void *v14;

  uint64_t v1 = result[4];
  uint64_t v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = result[6];
    if (v3 >= v2 - v1)
    {
      uint64_t v6 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 8) + 104))(v8, *MEMORY[0x263F8DCB8], v6);
      return (void *)swift_willThrow();
    }
    uint64_t v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2) {
        goto LABEL_16;
      }
      if (*(unsigned char *)(result[3] + v4) == 7)
      {
        result[6] = v3 + 1;
        return result;
      }
      uint64_t v13 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8D9D0], v13, v14, v12);
      swift_bridgeObjectRelease();
      return (void *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  Swift::String v11;
  Swift::String v12;
  void *v13;
  uint64_t v14;
  void *v15;

  uint64_t v1 = result[4];
  uint64_t v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = result[6];
    if (v3 >= v2 - v1)
    {
      uint64_t v6 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 8) + 104))(v8, *MEMORY[0x263F8DCB8], v6);
      return (void *)swift_willThrow();
    }
    uint64_t v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2) {
        goto LABEL_16;
      }
      if (*(unsigned char *)(result[3] + v4) == 8)
      {
        result[6] = v3 + 1;
        return result;
      }
      uint64_t v9 = MEMORY[0x263F8E778];
      uint64_t v14 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v15 = v10;
      v11._countAndFlagsBits = 540877088;
      v11._object = (void *)0xE400000000000000;
      String.append(_:)(v11);
      v12._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v12);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(v9, v14, v15, v13);
      swift_bridgeObjectRelease();
      return (void *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  void *v12;
  uint64_t v13;
  void *v14;

  uint64_t v1 = result[4];
  uint64_t v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = result[6];
    if (v3 >= v2 - v1)
    {
      uint64_t v6 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 8) + 104))(v8, *MEMORY[0x263F8DCB8], v6);
      return (void *)swift_willThrow();
    }
    uint64_t v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2) {
        goto LABEL_16;
      }
      if (*(unsigned char *)(result[3] + v4) == 9)
      {
        result[6] = v3 + 1;
        return result;
      }
      uint64_t v13 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8E888], v13, v14, v12);
      swift_bridgeObjectRelease();
      return (void *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  void *v12;
  uint64_t v13;
  void *v14;

  uint64_t v1 = result[4];
  uint64_t v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = result[6];
    if (v3 >= v2 - v1)
    {
      uint64_t v6 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 8) + 104))(v8, *MEMORY[0x263F8DCB8], v6);
      return (void *)swift_willThrow();
    }
    uint64_t v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2) {
        goto LABEL_16;
      }
      if (*(unsigned char *)(result[3] + v4) == 10)
      {
        result[6] = v3 + 1;
        return result;
      }
      uint64_t v13 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8E8F8], v13, v14, v12);
      swift_bridgeObjectRelease();
      return (void *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  void *v12;
  uint64_t v13;
  void *v14;

  uint64_t v1 = result[4];
  uint64_t v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = result[6];
    if (v3 >= v2 - v1)
    {
      uint64_t v6 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 8) + 104))(v8, *MEMORY[0x263F8DCB8], v6);
      return (void *)swift_willThrow();
    }
    uint64_t v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2) {
        goto LABEL_16;
      }
      if (*(unsigned char *)(result[3] + v4) == 1)
      {
        result[6] = v3 + 1;
        return result;
      }
      uint64_t v13 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)((uint64_t)&type metadata for NilPrimitive, v13, v14, v12);
      swift_bridgeObjectRelease();
      return (void *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  void *v12;
  uint64_t v13;
  void *v14;

  uint64_t v1 = result[4];
  uint64_t v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = result[6];
    if (v3 >= v2 - v1)
    {
      uint64_t v6 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 8) + 104))(v8, *MEMORY[0x263F8DCB8], v6);
      return (void *)swift_willThrow();
    }
    uint64_t v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2) {
        goto LABEL_16;
      }
      if (*(unsigned char *)(result[3] + v4) == 19)
      {
        result[6] = v3 + 1;
        return result;
      }
      uint64_t v13 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)((uint64_t)&type metadata for OptionalPrimitive, v13, v14, v12);
      swift_bridgeObjectRelease();
      return (void *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  void *v12;
  uint64_t v13;
  void *v14;

  uint64_t v1 = result[4];
  uint64_t v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = result[6];
    if (v3 >= v2 - v1)
    {
      uint64_t v6 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v8 = v7;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v6 - 8) + 104))(v8, *MEMORY[0x263F8DCB8], v6);
      return (void *)swift_willThrow();
    }
    uint64_t v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2) {
        goto LABEL_16;
      }
      if (*(unsigned char *)(result[3] + v4) == 13)
      {
        result[6] = v3 + 1;
        return result;
      }
      uint64_t v13 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v14 = v9;
      v10._countAndFlagsBits = 540877088;
      v10._object = (void *)0xE400000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8D5C8], v13, v14, v12);
      swift_bridgeObjectRelease();
      return (void *)swift_willThrow();
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for DecodingBuffer()
{
  return self;
}

void *static DecodingContainer.decodeType(from:withCodingMetadata:)(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = result[4];
  uint64_t v6 = result[5] >> 1;
  uint64_t v7 = v6 - v5;
  if (__OFSUB__(v6, v5))
  {
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = result;
  uint64_t v10 = result[6];
  if (v10 >= v7)
  {
    uint64_t v18 = _typeName(_:qualified:)();
    unint64_t v20 = v19;
    uint64_t v21 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v23 = v22;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(31);
    swift_bridgeObjectRelease();
    v24._countAndFlagsBits = v18;
    v24._object = v20;
    String.append(_:)(v24);
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v21 - 8) + 104))(v23, *MEMORY[0x263F8DCB8], v21);
LABEL_18:
    swift_bridgeObjectRelease();
    return (void *)swift_willThrow();
  }
  BOOL v11 = __OFADD__(v5, v10);
  uint64_t v12 = v5 + v10;
  if (v11)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (v12 < v5 || v12 >= v6) {
    goto LABEL_21;
  }
  int v14 = *(unsigned __int8 *)(result[3] + v12);
  uint64_t v15 = *(void *)(a5 + 8);
  unint64_t v29 = *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8);
  uint64_t result = (void *)v29(a4, v15);
  if (v14 != ((_BYTE)result + 1))
  {
    uint64_t v30 = dispatch thunk of CustomStringConvertible.description.getter();
    char v31 = v25;
    v26._countAndFlagsBits = 540877088;
    v26._object = (void *)0xE400000000000000;
    String.append(_:)(v26);
    v29(a4, v15);
    v27._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v27);
    swift_bridgeObjectRelease();
    type metadata accessor for DecodingError();
    swift_allocError();
    typeMismatchError(codingMetadata:type:message:)(a4, v30, v31, v28);
    goto LABEL_18;
  }
  uint64_t v16 = v9[6];
  if (v16 < v7)
  {
    uint64_t v17 = v5 + v16;
    if (__OFADD__(v5, v16))
    {
LABEL_22:
      __break(1u);
LABEL_23:
      __break(1u);
      return result;
    }
    if (v17 < v5 || v17 >= v6) {
      goto LABEL_23;
    }
    v9[6] = v16 + 1;
  }
  return result;
}

void *_XPCKeyedDecodingContainer.__allocating_init(codingMetadata:initialStorage:)(uint64_t a1, uint64_t a2, void *a3)
{
  return _XPCKeyedDecodingContainer.__allocating_init(codingMetadata:buffer:)(a1, a2, a3);
}

uint64_t type metadata accessor for KeyedDecodingStorage()
{
  return self;
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance _XPCUnkeyedDecodingContainer()
{
  return 15;
}

uint64_t XPCReceivedMessage.XPCReceivedMessageMetadata.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 18, 7);
}

ValueMetadata *type metadata accessor for XPCRichError()
{
  return &type metadata for XPCRichError;
}

uint64_t _XPCDecoder.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  outlined destroy of DecodingContainer?(v0 + 40, &demangling cache variable for type metadata for DecodingContainer?);

  return MEMORY[0x270FA0228](v0, 80, 7);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encode<A>(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)(a1, a2, a3, a4);
}

uint64_t EncodingBuffer.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t _XPCKeyedDecodingContainer.__deallocating_deinit()
{
  _XPCKeyedDecodingContainer.deinit();

  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t _XPCKeyedDecodingContainer.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t KeyedDecodingStorage.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 32, 7);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

char *XPCDictionary.keys.getter()
{
  return specialized XPCDictionary.map<A>(_:)((uint64_t)specialized implicit closure #1 in XPCDictionary.keys.getter, 0, *v0);
}

char *specialized XPCDictionary.map<A>(_:)(uint64_t a1, uint64_t a2, xpc_object_t xdict)
{
  int64_t count = xpc_dictionary_get_count(xdict);
  uint64_t v8 = (char *)MEMORY[0x263F8EE78];
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || count > *((void *)v8 + 3) >> 1)
  {
    if (*((void *)v8 + 2) <= count) {
      int64_t v10 = count;
    }
    else {
      int64_t v10 = *((void *)v8 + 2);
    }
    char isUniquelyReferenced_nonNull_native = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v10, 0, v8);
    uint64_t v8 = isUniquelyReferenced_nonNull_native;
  }
  uint64_t v17 = v8;
  uint64_t v11 = MEMORY[0x270FA5388](isUniquelyReferenced_nonNull_native);
  v16[6] = &v17;
  v16[7] = a1;
  v16[8] = a2;
  MEMORY[0x270FA5388](v11);
  v16[2] = partial apply for specialized closure #1 in XPCDictionary.map<A>(_:);
  v16[3] = v12;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = partial apply for closure #1 in XPCDictionary.forEach(_:);
  *(void *)(v13 + 24) = v16;
  closure #1 in XPCDictionary.forEach(_:)((uint64_t)partial apply for closure #1 in XPCDictionary.forEach(_:), v13, xdict);
  if (v3)
  {
    swift_release();
    return (char *)swift_bridgeObjectRelease();
  }
  else
  {
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    __n128 result = (char *)swift_release();
    if (isEscapingClosureAtFileLocation) {
      __break(1u);
    }
    else {
      return v17;
    }
  }
  return result;
}

uint64_t closure #1 in XPCDictionary.forEach(_:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v12 = 0;
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = &v12;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = partial apply for closure #1 in closure #1 in XPCDictionary.forEach(_:);
  *(void *)(v7 + 24) = v6;
  aBlock[4] = thunk for @callee_guaranteed (@unowned UnsafePointer<Int8>, @guaranteed OS_xpc_object) -> (@unowned Bool)partial apply;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@unowned UnsafePointer<Int8>, @guaranteed OS_xpc_object) -> (@unowned Bool);
  aBlock[3] = &block_descriptor_84;
  uint64_t v8 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  xpc_dictionary_apply(a3, v8);
  _Block_release(v8);
  LOBYTE(a3) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (a3)
  {
    __break(1u);
  }
  else
  {
    if (v12)
    {
      id v10 = v12;
      swift_willThrow();
    }
    return swift_release();
  }
  return result;
}

uint64_t _XPCSingleValueDecodingContainer.__deallocating_deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

void type metadata accessor for xpc_session_create_flags_t(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t protocol witness for Decoder.singleValueContainer() in conformance _XPCDecoder@<X0>(void *a1@<X8>)
{
  return _XPCDecoder.singleValueContainer()(a1);
}

uint64_t _XPCDecoder.singleValueContainer()@<X0>(void *a1@<X8>)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[4];
  uint64_t v6 = type metadata accessor for _XPCSingleValueDecodingContainer();
  uint64_t v7 = (void *)swift_allocObject();
  v7[3] = v3;
  v7[4] = v4;
  v7[2] = v5;
  a1[3] = v6;
  a1[4] = _s3XPC11_XPCDecoderCACs7DecoderAAWlTm_1(&lazy protocol witness table cache variable for type _XPCSingleValueDecodingContainer and conformance _XPCSingleValueDecodingContainer, 255, (void (*)(uint64_t))type metadata accessor for _XPCSingleValueDecodingContainer);
  *a1 = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_retain();
}

uint64_t type metadata accessor for _XPCSingleValueDecodingContainer()
{
  return self;
}

uint64_t static XPCSession.InitializationOptions.none.getter@<X0>(void *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = static XPCSession.InitializationOptions.none;
  return result;
}

uint64_t _XPCSingleValueEncodingContainer.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of DecodingContainer?(v0 + 32, &demangling cache variable for type metadata for EncodingContainer?);

  return MEMORY[0x270FA0228](v0, 72, 7);
}

ValueMetadata *type metadata accessor for XPCEndpoint()
{
  return &type metadata for XPCEndpoint;
}

BOOL protocol witness for UnkeyedDecodingContainer.isAtEnd.getter in conformance _XPCUnkeyedDecodingContainer()
{
  return *(void *)(*(void *)(*(void *)v0 + 32) + 32) == *(void *)(*(void *)(*(void *)v0 + 32) + 24);
}

uint64_t one-time initialization function for global()
{
  type metadata accessor for XPCCodableObjectRepresentableCache();
  uint64_t inited = swift_initStaticObject();
  if (one-time initialization token for global != -1) {
    swift_once();
  }
  uint64_t result = _dyld_register_for_bulk_image_loads();
  static XPCCodableObjectRepresentableCache.global = inited;
  return result;
}

{
  unint64_t v0;
  uint64_t result;

  uint64_t v0 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<[ObjectIdentifier : Bool], os_unfair_lock_s>);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + 24) = 0;
  *(void *)(result + 16) = v0;
  static XPCCodableObjectRepresentableCache._Cache.global = (_UNKNOWN *)result;
  return result;
}

uint64_t protocol witness for Encoder.singleValueContainer() in conformance _XPCEncoder@<X0>(uint64_t *a1@<X8>)
{
  return _XPCEncoder.singleValueContainer()(a1);
}

uint64_t _XPCEncoder.singleValueContainer()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v5 = type metadata accessor for _XPCSingleValueEncodingContainer();
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 32) = 0u;
  *(_OWORD *)(v6 + 48) = 0u;
  *(void *)(v6 + 64) = 0;
  *(void *)(v6 + 16) = v3;
  *(void *)(v6 + 24) = v4;
  uint64_t v12[3] = v5;
  void v12[4] = &protocol witness table for _XPCSingleValueEncodingContainer;
  v12[0] = v6;
  uint64_t v7 = v1 + 32;
  swift_beginAccess();
  outlined init with copy of EncodingContainer?(v1 + 32, (uint64_t)v10);
  uint64_t v8 = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t result = outlined destroy of DecodingContainer?((uint64_t)v10, &demangling cache variable for type metadata for EncodingContainer?);
  if (v8)
  {
    __break(1u);
  }
  else
  {
    swift_beginAccess();
    outlined assign with take of EncodingContainer?((uint64_t)v12, v7);
    swift_endAccess();
    a1[3] = v5;
    uint64_t result = _s3XPC11_XPCEncoderCACs7EncoderAAWlTm_1(&lazy protocol witness table cache variable for type _XPCSingleValueEncodingContainer and conformance _XPCSingleValueEncodingContainer, 255, (void (*)(uint64_t))type metadata accessor for _XPCSingleValueEncodingContainer);
    a1[4] = result;
    *a1 = v6;
  }
  return result;
}

uint64_t type metadata accessor for _XPCSingleValueEncodingContainer()
{
  return self;
}

uint64_t _XPCUnkeyedDecodingContainer.UnkeyedDecodingStorage.__deallocating_deinit()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t destroy for XPCReceivedMessage()
{
  swift_unknownObjectRelease();

  return swift_release();
}

uint64_t partial apply for closure #1 in closure #1 in _XPCKeyedDecodingContainer.allKeys.getter()
{
  return dispatch thunk of CodingKey.init(stringValue:)();
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.allKeys.getter in conformance _XPCKeyedDecodingContainer<A>()
{
  return _XPCKeyedDecodingContainer.allKeys.getter();
}

uint64_t _XPCKeyedDecodingContainer.allKeys.getter()
{
  if (*(void *)(v0 + 40))
  {
    uint64_t v1 = *(void *)(v0 + 40);
  }
  else
  {
    uint64_t v1 = closure #1 in _XPCKeyedDecodingContainer.allKeys.getter();
    *(void *)(v0 + 40) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t closure #1 in _XPCKeyedDecodingContainer.allKeys.getter()
{
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [String : DecodingBuffer].Keys);
  lazy protocol witness table accessor for type [String : DecodingBuffer].Keys and conformance [A : B].Keys();
  uint64_t v0 = Sequence.compactMap<A>(_:)();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t one-time initialization function for xpcCodable()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CodingUserInfoKey?);
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for CodingUserInfoKey();
  __swift_allocate_value_buffer(v3, static CodingUserInfoKey.xpcCodable);
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)static CodingUserInfoKey.xpcCodable);
  CodingUserInfoKey.init(rawValue:)();
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v2, 1, v3);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(v4, v2, v3);
  }
  __break(1u);
  return result;
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

uint64_t protocol witness for Decoder.unkeyedContainer() in conformance _XPCDecoder@<X0>(void *a1@<X8>)
{
  return _XPCDecoder.unkeyedContainer()(a1);
}

uint64_t protocol witness for Decoder.container<A>(keyedBy:) in conformance _XPCDecoder@<X0>(uint64_t a1@<X8>)
{
  return _XPCDecoder.container<A>(keyedBy:)(a1);
}

uint64_t _XPCDecoder.unkeyedContainer()@<X0>(void *a1@<X8>)
{
  uint64_t v4 = (uint64_t)(v1 + 5);
  swift_beginAccess();
  outlined init with copy of DecodingContainer?((uint64_t)(v1 + 5), (uint64_t)v16);
  uint64_t v5 = v17;
  if (v17)
  {
    uint64_t v6 = v18;
    uint64_t v7 = __swift_project_boxed_opaque_existential_1(v16, v17);
    *((void *)&v20 + 1) = v5;
    uint64_t v21 = *(_UNKNOWN ***)(v6 + 8);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v19);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v5 - 8) + 16))(boxed_opaque_existential_1, v7, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }
  else
  {
    outlined destroy of DecodingContainer?((uint64_t)v16, &demangling cache variable for type metadata for DecodingContainer?);
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v21 = 0;
  }
  uint64_t v9 = v1[2];
  uint64_t v10 = v1[3];
  uint64_t v11 = (void *)v1[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  char v12 = specialized static SharableStorageContainer.getExisting<A>(container:codingMetadata:initialStorage:)(v15, (uint64_t)&v19, v9, v10, v11);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = outlined destroy of DecodingContainer?((uint64_t)&v19, &demangling cache variable for type metadata for CodingContainer?);
  if (!v2)
  {
    uint64_t v14 = v15[0];
    if (v12)
    {
      *((void *)&v20 + 1) = type metadata accessor for _XPCUnkeyedDecodingContainer();
      uint64_t v21 = &protocol witness table for _XPCUnkeyedDecodingContainer;
      *(void *)&long long v19 = v14;
      outlined init with take of DecodingContainer?((uint64_t)&v19, (uint64_t)v16);
      swift_beginAccess();
      swift_retain();
      outlined assign with take of DecodingContainer?((uint64_t)v16, v4);
      swift_endAccess();
    }
    a1[3] = type metadata accessor for _XPCUnkeyedDecodingContainer();
    uint64_t result = _s3XPC11_XPCDecoderCACs7DecoderAAWlTm_1(&lazy protocol witness table cache variable for type _XPCUnkeyedDecodingContainer and conformance _XPCUnkeyedDecodingContainer, 255, (void (*)(uint64_t))type metadata accessor for _XPCUnkeyedDecodingContainer);
    a1[4] = result;
    *a1 = v14;
  }
  return result;
}

uint64_t type metadata accessor for _XPCUnkeyedDecodingContainer()
{
  return self;
}

uint64_t _XPCDecoder.container<A>(keyedBy:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = (uint64_t)(v1 + 5);
  swift_beginAccess();
  outlined init with copy of DecodingContainer?((uint64_t)(v1 + 5), (uint64_t)v16);
  uint64_t v5 = v17;
  uint64_t v22 = a1;
  if (v17)
  {
    uint64_t v6 = v18;
    uint64_t v7 = __swift_project_boxed_opaque_existential_1(v16, v17);
    *((void *)&v20 + 1) = v5;
    uint64_t v21 = *(_UNKNOWN ***)(v6 + 8);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v19);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v5 - 8) + 16))(boxed_opaque_existential_1, v7, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }
  else
  {
    outlined destroy of DecodingContainer?((uint64_t)v16, &demangling cache variable for type metadata for DecodingContainer?);
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v21 = 0;
  }
  uint64_t v9 = type metadata accessor for _XPCKeyedDecodingContainer();
  uint64_t v10 = v1[2];
  uint64_t v11 = v1[3];
  v16[0] = v1[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  char v12 = static SharableStorageContainer.getExisting<A>(container:codingMetadata:initialStorage:)((uint64_t)v15, (uint64_t)&v19, v10, v11, (uint64_t)v16, v9, v9, (uint64_t)&protocol witness table for _XPCKeyedDecodingContainer<A>, (uint64_t)&protocol witness table for _XPCKeyedDecodingContainer<A>);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t result = outlined destroy of DecodingContainer?((uint64_t)&v19, &demangling cache variable for type metadata for CodingContainer?);
  if (!v2)
  {
    uint64_t v14 = v15[0];
    if (v12)
    {
      *((void *)&v20 + 1) = v9;
      uint64_t v21 = &protocol witness table for _XPCKeyedDecodingContainer<A>;
      *(void *)&long long v19 = v15[0];
      outlined init with take of DecodingContainer?((uint64_t)&v19, (uint64_t)v16);
      swift_beginAccess();
      swift_retain();
      outlined assign with take of DecodingContainer?((uint64_t)v16, v4);
      swift_endAccess();
    }
    *(void *)&long long v19 = v14;
    swift_getWitnessTable();
    return KeyedDecodingContainer.init<A>(_:)();
  }
  return result;
}

uint64_t type metadata accessor for _XPCKeyedDecodingContainer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t outlined assign with take of DecodingContainer?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DecodingContainer?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of DecodingContainer?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DecodingContainer?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with take of DecodingContainer?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DecodingContainer?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t specialized static SharableStorageContainer.getExisting<A>(container:codingMetadata:initialStorage:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  outlined init with copy of CodingContainer?(a2, (uint64_t)v19);
  if (!v19[3])
  {
    outlined destroy of DecodingContainer?((uint64_t)v19, &demangling cache variable for type metadata for CodingContainer?);
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v22 = 0;
    goto LABEL_8;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingContainer);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SharableStorageContainer);
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v22 = 0;
    long long v20 = 0u;
    long long v21 = 0u;
LABEL_8:
    uint64_t result = outlined destroy of DecodingContainer?((uint64_t)&v20, &demangling cache variable for type metadata for SharableStorageContainer?);
    if (*(void *)(a2 + 24)) {
      goto LABEL_13;
    }
LABEL_9:
    type metadata accessor for _XPCUnkeyedDecodingContainer();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v17 = _XPCUnkeyedDecodingContainer.__allocating_init(codingMetadata:buffer:)(a3, a4, a5);
    if (!v5)
    {
      *a1 = v17;
      char v15 = 1;
    }
    return v15 & 1;
  }
  if (!*((void *)&v21 + 1)) {
    goto LABEL_8;
  }
  Swift::String v26 = a1;
  outlined init with take of Encodable(&v20, (uint64_t)v23);
  uint64_t v12 = v24;
  uint64_t v11 = v25;
  __swift_project_boxed_opaque_existential_1(v23, v24);
  uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v11 + 24);
  *((void *)&v21 + 1) = swift_getAssociatedTypeWitness();
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v20);
  v18(v12, v11);
  type metadata accessor for _XPCUnkeyedDecodingContainer.UnkeyedDecodingStorage();
  if (swift_dynamicCast())
  {
    uint64_t v13 = v19[0];
    type metadata accessor for _XPCUnkeyedDecodingContainer();
    uint64_t v14 = (void *)swift_allocObject();
    void v14[2] = a3;
    void v14[3] = a4;
    v14[4] = v13;
    *Swift::String v26 = v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    char v15 = 0;
    return v15 & 1;
  }
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  a1 = v26;
  if (!*(void *)(a2 + 24)) {
    goto LABEL_9;
  }
LABEL_13:
  __break(1u);
  return result;
}

void *_XPCUnkeyedDecodingContainer.__allocating_init(codingMetadata:buffer:)(uint64_t a1, uint64_t a2, void *a3)
{
  static DecodingContainer.decodeType(from:withCodingMetadata:)(a3, a1, a2, v3, (uint64_t)&protocol witness table for _XPCUnkeyedDecodingContainer);
  if (v4)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (void *)swift_release();
  }
  uint64_t v7 = specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
  uint64_t v8 = specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
  uint64_t v10 = DecodingBuffer.consume(_:)((uint64_t)v8);
  if (!v10)
  {
    uint64_t v19 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v21 = v20;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(31);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v19 - 8) + 104))(v21, *MEMORY[0x263F8DCB8], v19);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_willThrow();
    return (void *)swift_release();
  }
  uint64_t v14 = v10;
  uint64_t v15 = v12;
  uint64_t v16 = v13;
  uint64_t v22 = v11;
  swift_release();
  type metadata accessor for DecodingBuffer();
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = v14;
  v17[3] = v22;
  v17[4] = v15;
  v17[5] = v16;
  v17[6] = 0;
  type metadata accessor for _XPCUnkeyedDecodingContainer.UnkeyedDecodingStorage();
  uint64_t v18 = (void *)swift_allocObject();
  v18[3] = v7;
  v18[4] = 0;
  v18[2] = v17;
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = v18;
  return result;
}

uint64_t type metadata accessor for _XPCUnkeyedDecodingContainer.UnkeyedDecodingStorage()
{
  return self;
}

uint64_t XPCReceivedMessage.auditToken.getter()
{
  return 0;
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object?, @guaranteed OS_xpc_object?) -> ()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v5(a2, a3);
  swift_release();
  swift_unknownObjectRelease();

  return swift_unknownObjectRelease();
}

uint64_t partial apply for closure #1 in XPCSession._send(message:replyHandler:)(BOOL a1, _xpc_rich_error_s *a2)
{
  return closure #1 in XPCSession._send(message:replyHandler:)(a1, a2, *(void (**)(BOOL *))(v2 + 16));
}

uint64_t closure #1 in XPCSession._send(message:replyHandler:)(BOOL a1, _xpc_rich_error_s *a2, void (*a3)(BOOL *))
{
  if (!a1)
  {
    if (!a2) {
      goto LABEL_12;
    }
    uint64_t v7 = swift_unknownObjectRetain();
    if (MEMORY[0x2105634B0](v7) == MEMORY[0x263EF8770])
    {
      uint64_t v8 = xpc_rich_error_copy_description(a2);
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = String.init(cString:)();
        uint64_t v12 = v11;
        BOOL can_retry = xpc_rich_error_can_retry(a2);
        free(v9);
        BOOL v15 = can_retry;
        uint64_t v16 = v10;
        uint64_t v17 = v12;
        char v18 = 1;
        a3(&v15);
        swift_bridgeObjectRelease();
        return swift_unknownObjectRelease();
      }
      goto LABEL_11;
    }
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
LABEL_12:
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD00000000000003FLL, 0x800000020DA31050);
  }
  uint64_t v5 = swift_unknownObjectRetain();
  if (MEMORY[0x2105634B0](v5) != MEMORY[0x263EF8708])
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  BOOL v15 = a1;
  char v18 = 0;
  a3(&v15);
  return swift_unknownObjectRelease();
}

uint64_t partial apply for closure #1 in XPCSession._send<A>(_:replyHandler:)(uint64_t a1)
{
  return closure #1 in XPCSession._send<A>(_:replyHandler:)(a1, *(void (**)(uint64_t *))(v1 + 16));
}

uint64_t closure #1 in XPCSession._send<A>(_:replyHandler:)(uint64_t a1, void (*a2)(uint64_t *))
{
  uint64_t v3 = *(void *)a1;
  if (*(unsigned char *)(a1 + 24))
  {
    uint64_t v5 = *(void *)(a1 + 8);
    uint64_t v4 = *(void *)(a1 + 16);
    uint64_t v9 = *(void *)a1 & 1;
    uint64_t v10 = v5;
    uint64_t v11 = v4;
    char v12 = 1;
    swift_bridgeObjectRetain();
    a2(&v9);
    return outlined consume of Result<XPCDictionary, XPCRichError>(v3, v5, v4, 1);
  }
  else
  {
    swift_unknownObjectRetain();
    char v7 = XPCDictionary.subscript.getter(0x656C6261646F435FLL, 0xEE00636E79537349) & 1;
    type metadata accessor for XPCReceivedMessage.XPCReceivedMessageMetadata();
    uint64_t v8 = swift_allocObject();
    *(unsigned char *)(v8 + 16) = v7;
    *(unsigned char *)(v8 + 17) = v7;
    uint64_t v9 = v3;
    uint64_t v10 = v8;
    uint64_t v11 = 0;
    char v12 = 0;
    swift_unknownObjectRetain();
    swift_retain();
    a2(&v9);
    swift_release_n();
    return swift_unknownObjectRelease_n();
  }
}

uint64_t partial apply for closure #1 in XPCSession.send<A, B>(_:replyHandler:)(uint64_t *a1)
{
  return closure #1 in XPCSession.send<A, B>(_:replyHandler:)(a1, *(void (**)(uint64_t))(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t dispatch thunk of XPCSession.send<A, B>(_:replyHandler:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t XPCSession.send<A, B>(_:replyHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = (void *)swift_allocObject();
  void v14[2] = a4;
  void v14[3] = a5;
  v14[4] = a6;
  v14[5] = a7;
  v14[6] = a2;
  v14[7] = a3;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  type metadata accessor for Result();
  uint64_t v15 = ClientSpecifiedHandler.init(_:)((uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Result<B, Error>) -> ());
  uint64_t v17 = v16;
  char v18 = (void *)swift_allocObject();
  v18[2] = a4;
  v18[3] = a5;
  v18[4] = a6;
  v18[5] = a7;
  v18[6] = v15;
  v18[7] = v17;
  swift_retain();
  XPCSession._send<A>(_:replyHandler:)(a1, (uint64_t)partial apply for closure #1 in XPCSession.send<A, B>(_:replyHandler:), (uint64_t)v18, a4, a6);
  swift_release();
  return swift_release();
}

uint64_t XPCSession._send<A>(_:replyHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = static XPCReceivedMessage.encodeMessage<A>(_:isSync:)(a1, 0, a4, a5, v15);
  if (!v6)
  {
    xpc_object_t v10 = v15[0];
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = a2;
    *(void *)(v11 + 24) = a3;
    char v12 = *(void **)(v5 + 16);
    uint64_t v13 = (void *)swift_allocObject();
    v13[2] = partial apply for closure #1 in XPCSession._send<A>(_:replyHandler:);
    void v13[3] = v11;
    v15[4] = closure #1 in XPCSession._send(message:replyHandler:)partial apply;
    v15[5] = v13;
    v15[0] = (xpc_object_t)MEMORY[0x263EF8330];
    v15[1] = (xpc_object_t)1107296256;
    v15[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object?, @guaranteed OS_xpc_object?) -> ();
    void v15[3] = &block_descriptor_103;
    uint64_t v14 = _Block_copy(v15);
    swift_retain();
    swift_retain();
    swift_release();
    _swift_xpc_session_send_message_with_reply_async(v12, v10, v14);
    _Block_release(v14);
    swift_unknownObjectRelease();
    return swift_release();
  }
  return result;
}

void _swift_xpc_session_send_message_with_reply_async(void *a1, void *a2, void *a3)
{
  uint64_t v5 = a1;
  id v6 = a2;
  id v7 = a3;
  xpc_session_send_message_with_reply_async(v5, v6, v7);
}

uint64_t closure #1 in XPCSession.send<A, B>(_:replyHandler:)(uint64_t *a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
  uint64_t v8 = type metadata accessor for Result();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v13 - v10;
  closure #1 in closure #1 in XPCSession.send<A, B>(_:replyHandler:)(*a1, a1[1], a1[2], a5, (uint64_t *)((char *)&v13 - v10));
  ClientSpecifiedHandler.callEventHandler(_:)((uint64_t)v11, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
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

uint64_t closure #1 in closure #1 in XPCSession.send<A, B>(_:replyHandler:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X5>, uint64_t *a5@<X8>)
{
  uint64_t v10 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1);
  unint64_t v12 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v13 = (char *)v18 - v12;
  if (v14)
  {
    lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError();
    uint64_t v15 = swift_allocError();
    *(unsigned char *)uint64_t v16 = a1 & 1;
    *(void *)(v16 + 8) = a2;
    *(void *)(v16 + 16) = a3;
    *a5 = v15;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
    type metadata accessor for Result();
    swift_storeEnumTagMultiPayload();
    return swift_bridgeObjectRetain();
  }
  else
  {
    v18[2] = a1;
    v18[3] = a2;
    XPCReceivedMessage.decode<A>(as:)(a4, a4, (uint64_t)v18 - v12);
    (*(void (**)(uint64_t *, char *, uint64_t))(v10 + 32))(a5, v13, a4);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Error);
    type metadata accessor for Result();
    return swift_storeEnumTagMultiPayload();
  }
}

uint64_t XPCReceivedMessage.decode<A>(as:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v32[1] = *MEMORY[0x263EF8340];
  char v31 = *v3;
  uint64_t v8 = v31;
  swift_unknownObjectRetain();
  uint64_t v9 = specialized String.withCString<A>(_:)((void *(*)(uint64_t *__return_ptr, void *))_s3XPC13XPCDictionaryV_2asSSSgSS_SSmtcigAESPys4Int8VGXEfU_TA_0, (uint64_t)v30, 0x656C6261646F435FLL, 0xED0000726F727245);
  uint64_t v11 = v10;
  uint64_t v12 = swift_unknownObjectRelease();
  if (v11)
  {
    lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError();
    swift_allocError();
    *(unsigned char *)uint64_t v13 = 0;
    *(void *)(v13 + 8) = v9;
    *(void *)(v13 + 16) = v11;
    return swift_willThrow();
  }
  v32[0] = 0;
  MEMORY[0x270FA5388](v12);
  long long v29[2] = v8;
  v29[3] = v32;
  swift_unknownObjectRetain();
  char v14 = specialized String.withCString<A>(_:)((void *(*)(uint64_t *__return_ptr, void *))_s3XPC13XPCDictionaryV_2asSays5UInt8VGSgSS_AGmtcigSVSgSPys4Int8VGXEfU_TA_0, (uint64_t)v29, 0x656C6261646F435FLL, 0xEC00000079646F42, (uint64_t *)&demangling cache variable for type metadata for UnsafeRawPointer?, (uint64_t (*)(void))partial apply for specialized closure #1 in _StringGuts.withCString<A>(_:));
  if (v32[0] < 1 || !v14)
  {
    swift_unknownObjectRelease();
    uint64_t v24 = type metadata accessor for DecodingError();
    swift_allocError();
    Swift::String v26 = v25;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *Swift::String v26 = a1;
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v24 - 8) + 104))(v26, *MEMORY[0x263F8DCC0], v24);
    return swift_willThrow();
  }
  uint64_t v15 = specialized _copyCollectionToContiguousArray<A>(_:)(v14, v32[0]);
  swift_unknownObjectRelease();
  swift_unknownObjectRetain_n();
  specialized String.withCString<A>(_:)(v8, 0xD000000000000011, 0x800000020DA32620, v32);
  swift_unknownObjectRelease();
  int64_t v16 = v32[0];
  if (v32[0])
  {
    v29[4] = v4;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CodingUserInfoKey, Any)>);
    uint64_t v17 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (CodingUserInfoKey, Any))
                - 8);
    unint64_t v18 = (*(unsigned __int8 *)(*(void *)v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v17 + 80);
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_20DA2D050;
    unint64_t v20 = v19 + v18;
    uint64_t v21 = (int64_t *)(v20 + v17[14]);
    if (one-time initialization token for xpcCodable != -1) {
      swift_once();
    }
    uint64_t v22 = type metadata accessor for CodingUserInfoKey();
    uint64_t v23 = __swift_project_value_buffer(v22, (uint64_t)static CodingUserInfoKey.xpcCodable);
    (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v23, v22);
    v21[3] = (int64_t)&type metadata for XPCArray;
    *uint64_t v21 = v16;
  }
  else
  {
    uint64_t v19 = MEMORY[0x263F8EE78];
  }
  unint64_t v28 = specialized Dictionary.init(dictionaryLiteral:)(v19);
  type metadata accessor for XPCDecoder();
  *(void *)(swift_initStackObject() + 16) = v28;
  XPCDecoder.decode<A>(_:from:)((uint64_t)v15, a2, a3);
  swift_bridgeObjectRelease();
  return swift_release();
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(const void *a1, int64_t a2)
{
  if (!a2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  if (a2 <= 0)
  {
    uint64_t v4 = (void *)MEMORY[0x263F8EE78];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v4 = (void *)swift_allocObject();
    size_t v5 = _swift_stdlib_malloc_size(v4);
    v4[2] = a2;
    v4[3] = 2 * v5 - 64;
  }
  memcpy(v4 + 4, a1, a2);
  return v4;
}

uint64_t specialized String.withCString<A>(_:)@<X0>(xpc_object_t xdict@<X2>, uint64_t a2@<X0>, uint64_t a3@<X1>, void *a4@<X8>)
{
  if ((a3 & 0x1000000000000000) != 0 || !(a3 & 0x2000000000000000 | a2 & 0x1000000000000000))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for XPCArray?);
    _StringGuts._slowWithCString<A>(_:)();
    return swift_unknownObjectRelease();
  }
  if ((a3 & 0x2000000000000000) == 0)
  {
    if ((a2 & 0x1000000000000000) != 0) {
      size_t v5 = (char *)((a3 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      size_t v5 = (char *)_StringObject.sharedUTF8.getter();
    }
    partial apply for closure #1 in XPCDictionary.subscript.getter(v5, a4);
    return swift_unknownObjectRelease();
  }
  *(void *)key = a2;
  uint64_t v10 = a3 & 0xFFFFFFFFFFFFFFLL;
  xpc_object_t v7 = xpc_dictionary_get_array(xdict, key);
  xpc_object_t v8 = v7;
  if (v7 && (uint64_t result = MEMORY[0x2105634B0](v7), result != MEMORY[0x263EF86D8]))
  {
    __break(1u);
  }
  else
  {
    *a4 = v8;
    return swift_unknownObjectRelease();
  }
  return result;
}

{
  char *v5;
  uint64_t result;
  xpc_object_t v7;
  xpc_object_t v8;
  char key[8];
  uint64_t v10;

  if ((a3 & 0x1000000000000000) != 0 || !(a3 & 0x2000000000000000 | a2 & 0x1000000000000000))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCDictionary?);
    _StringGuts._slowWithCString<A>(_:)();
    return swift_unknownObjectRelease();
  }
  if ((a3 & 0x2000000000000000) == 0)
  {
    if ((a2 & 0x1000000000000000) != 0) {
      size_t v5 = (char *)((a3 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      size_t v5 = (char *)_StringObject.sharedUTF8.getter();
    }
    partial apply for closure #1 in XPCDictionary.subscript.getter(v5, a4);
    return swift_unknownObjectRelease();
  }
  *(void *)key = a2;
  uint64_t v10 = a3 & 0xFFFFFFFFFFFFFFLL;
  xpc_object_t v7 = xpc_dictionary_get_dictionary(xdict, key);
  xpc_object_t v8 = v7;
  if (v7 && (uint64_t result = MEMORY[0x2105634B0](v7), result != MEMORY[0x263EF8708]))
  {
    __break(1u);
  }
  else
  {
    *a4 = v8;
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t partial apply for closure #1 in XPCDictionary.subscript.getter@<X0>(char *a1@<X0>, void *a2@<X8>)
{
  return partial apply for closure #1 in XPCDictionary.subscript.getter(a1, a2);
}

uint64_t _s3XPC13XPCDictionaryV_2asSSSgSS_SSmtcigAESPys4Int8VGXEfU_TA_0@<X0>(char *a1@<X0>, void *a2@<X8>)
{
  return closure #1 in XPCDictionary.subscript.getter(a1, *(xpc_object_t *)(v2 + 16), a2);
}

uint64_t closure #1 in XPCDictionary.subscript.getter@<X0>(char *key@<X0>, xpc_object_t xdict@<X1>, void *a3@<X8>)
{
  uint64_t result = (uint64_t)xpc_dictionary_get_string(xdict, key);
  if (result) {
    uint64_t result = String.init(cString:)();
  }
  else {
    uint64_t v5 = 0;
  }
  *a3 = result;
  a3[1] = v5;
  return result;
}

xpc_object_t partial apply for closure #1 in XPCDictionary.subscript.getter@<X0>(char *a1@<X0>, void *a2@<X8>)
{
  return closure #1 in XPCDictionary.subscript.getter(a1, *(xpc_object_t *)(v2 + 16), a2);
}

{
  uint64_t v2;

  return closure #1 in XPCDictionary.subscript.getter(a1, *(xpc_object_t *)(v2 + 16), a2);
}

xpc_object_t closure #1 in XPCDictionary.subscript.getter@<X0>(char *key@<X0>, xpc_object_t xdict@<X1>, void *a3@<X8>)
{
  xpc_object_t result = xpc_dictionary_get_array(xdict, key);
  xpc_object_t v5 = result;
  if (result && (xpc_object_t result = (xpc_object_t)MEMORY[0x2105634B0](result), result != (xpc_object_t)MEMORY[0x263EF86D8])) {
    __break(1u);
  }
  else {
    *a3 = v5;
  }
  return result;
}

{
  xpc_object_t result;
  xpc_object_t v5;

  xpc_object_t result = xpc_dictionary_get_dictionary(xdict, key);
  xpc_object_t v5 = result;
  if (result && (xpc_object_t result = (xpc_object_t)MEMORY[0x2105634B0](result), result != (xpc_object_t)MEMORY[0x263EF8708])) {
    __break(1u);
  }
  else {
    *a3 = v5;
  }
  return result;
}

uint64_t XPCDecoder.decode<A>(_:from:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  type metadata accessor for XPCDecoder();
  uint64_t v7 = (2 * *(void *)(a1 + 16)) | 1;
  type metadata accessor for DecodingBuffer();
  xpc_object_t v8 = (void *)swift_allocObject();
  v8[2] = a1;
  void v8[3] = a1 + 32;
  v8[4] = 0;
  v8[5] = v7;
  v8[6] = 0;
  uint64_t v9 = *(void *)(v3 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  static XPCDecoder.decode<A>(from:withCodingMetadata:)((uint64_t)v8, MEMORY[0x263F8EE78], v9, a2, a3);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t XPCSession.__allocating_init(fromConnection:targetQueue:options:incomingMessageHandler:cancellationHandler:)(void *a1, void *a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return XPCSession.__allocating_init(fromConnection:targetQueue:options:incomingMessageHandler:cancellationHandler:)(a1, a2, a3, a4, a5, a6, a7, (uint64_t (*)(id, void, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t))specialized XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:));
}

{
  return XPCSession.__allocating_init(fromConnection:targetQueue:options:incomingMessageHandler:cancellationHandler:)(a1, a2, a3, a4, a5, a6, a7, (uint64_t (*)(id, void, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t))specialized XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:));
}

uint64_t XPCSession.__allocating_init(fromConnection:targetQueue:options:incomingMessageHandler:cancellationHandler:)(void *a1, void *a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(id, void, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t))
{
  v20[4] = *MEMORY[0x263EF8340];
  uint64_t v14 = *a3;
  swift_beginAccess();
  id v15 = _swift__xpc_session_create_from_connection_4SWIFT(a1, a2);
  v20[0] = v14;
  type metadata accessor for XPCSession();
  uint64_t v16 = swift_allocObject();
  swift_unknownObjectRetain_n();
  uint64_t v17 = a8(v15, 0, a6, a7, v20, v16, a4, a5);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v17;
}

uint64_t type metadata accessor for XPCSession()
{
  return self;
}

id _swift__xpc_session_create_from_connection_4SWIFT(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  xpc_object_t v5 = (void *)_xpc_session_create_from_connection_4SWIFT();

  return v5;
}

uint64_t specialized XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:)(void *a1, _xpc_rich_error_s *a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a7;
  if (!a1)
  {
    if (a2)
    {
      lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError();
      uint64_t v25 = swift_allocError();
      uint64_t v27 = v26;
      if (MEMORY[0x2105634B0](a2) == MEMORY[0x263EF8770])
      {
        uint64_t v36 = v9;
        uint64_t v9 = v25;
        uint64_t v38 = a8;
        unint64_t v28 = xpc_rich_error_copy_description(a2);
        if (v28)
        {
          unint64_t v29 = v28;
          uint64_t v30 = String.init(cString:)();
          uint64_t v32 = v31;
          BOOL can_retry = xpc_rich_error_can_retry(a2);
          free(v29);
          *(unsigned char *)uint64_t v27 = can_retry;
          *(void *)(v27 + 8) = v30;
          *(void *)(v27 + 16) = v32;
          swift_willThrow();
          outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
          swift_unknownObjectRelease();
          type metadata accessor for XPCSession();
          swift_deallocPartialClassInstance();
          uint64_t v24 = v36;
          goto LABEL_13;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
    }
    outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(v9);
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD00000000000001BLL, 0x800000020DA31030);
  }
  uint64_t v38 = *a5;
  *(void *)(a6 + 16) = a1;
  if (a7)
  {
    id v15 = a1;
    XPCSession.setIncomingMessageHandler(_:)(v9);
    if (!a3) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  id v35 = a1;
  if (a3)
  {
LABEL_4:
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = a3;
    *(void *)(v16 + 24) = a4;
    swift_retain_n();
    uint64_t v17 = ClientSpecifiedHandler.init(_:)((uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Result<XPCReceivedMessage, XPCRichError>) -> ());
    uint64_t v19 = v18;
    unint64_t v20 = *(void **)(a6 + 16);
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v17;
    *(void *)(v21 + 24) = v19;
    aBlock[4] = closure #1 in XPCSession.setCancellationHandler(_:)partial apply;
    aBlock[5] = v21;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object) -> ();
    aBlock[3] = &block_descriptor_126;
    uint64_t v22 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    _swift_xpc_session_set_cancel_handler(v20, v22);
    _Block_release(v22);
    swift_release();
    outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
  }
LABEL_5:
  swift_beginAccess();
  if ((static XPCSession.InitializationOptions.inactive & ~v38) != 0)
  {
    XPCSession.activate()();
    if (v23) {
      swift_release();
    }
  }
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);

  swift_unknownObjectRelease();
  uint64_t v24 = v9;
LABEL_13:
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(v24);
  return a6;
}

{
  uint64_t v9;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL can_retry;
  id v35;
  uint64_t v36;
  void aBlock[6];
  uint64_t v38;

  uint64_t v9 = a7;
  if (!a1)
  {
    if (a2)
    {
      lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError();
      uint64_t v25 = swift_allocError();
      uint64_t v27 = v26;
      if (MEMORY[0x2105634B0](a2) == MEMORY[0x263EF8770])
      {
        uint64_t v36 = v9;
        uint64_t v9 = v25;
        uint64_t v38 = a8;
        unint64_t v28 = xpc_rich_error_copy_description(a2);
        if (v28)
        {
          unint64_t v29 = v28;
          uint64_t v30 = String.init(cString:)();
          uint64_t v32 = v31;
          BOOL can_retry = xpc_rich_error_can_retry(a2);
          free(v29);
          *(unsigned char *)uint64_t v27 = can_retry;
          *(void *)(v27 + 8) = v30;
          *(void *)(v27 + 16) = v32;
          swift_willThrow();
          outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
          swift_unknownObjectRelease();
          type metadata accessor for XPCSession();
          swift_deallocPartialClassInstance();
          uint64_t v24 = v36;
          goto LABEL_13;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
    }
    outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(v9);
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD00000000000001BLL, 0x800000020DA31030);
  }
  uint64_t v38 = *a5;
  *(void *)(a6 + 16) = a1;
  if (a7)
  {
    id v15 = a1;
    XPCSession.setIncomingMessageHandler(_:)(v9);
    if (!a3) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  id v35 = a1;
  if (a3)
  {
LABEL_4:
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = a3;
    *(void *)(v16 + 24) = a4;
    swift_retain_n();
    uint64_t v17 = ClientSpecifiedHandler.init(_:)((uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Result<XPCReceivedMessage, XPCRichError>) -> ());
    uint64_t v19 = v18;
    unint64_t v20 = *(void **)(a6 + 16);
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = v17;
    *(void *)(v21 + 24) = v19;
    aBlock[4] = closure #1 in XPCSession.setCancellationHandler(_:)partial apply;
    aBlock[5] = v21;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object) -> ();
    aBlock[3] = &block_descriptor_148;
    uint64_t v22 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    _swift_xpc_session_set_cancel_handler(v20, v22);
    _Block_release(v22);
    swift_release();
    outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
  }
LABEL_5:
  swift_beginAccess();
  if ((static XPCSession.InitializationOptions.inactive & ~v38) != 0)
  {
    XPCSession.activate()();
    if (v23) {
      swift_release();
    }
  }
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);

  swift_unknownObjectRelease();
  uint64_t v24 = v9;
LABEL_13:
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(v24);
  return a6;
}

uint64_t outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void _swift_xpc_session_set_cancel_handler(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  xpc_session_set_cancel_handler(v3, v4);
}

void _swift_xpc_session_set_cancel_handler_0(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  xpc_session_set_cancel_handler(v3, v4);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> XPCSession.activate()()
{
  v12[1] = *(xpc_rich_error_t *)MEMORY[0x263EF8340];
  v12[0] = 0;
  BOOL v1 = _swift_xpc_session_activate(*(void **)(v0 + 16), v12);
  uint64_t v2 = v12[0];
  if (!v1)
  {
    if (v12[0])
    {
      lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError();
      swift_allocError();
      uint64_t v4 = v3;
      uint64_t v5 = swift_unknownObjectRetain();
      if (MEMORY[0x2105634B0](v5) != MEMORY[0x263EF8770]) {
        __break(1u);
      }
      id v6 = xpc_rich_error_copy_description(v2);
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = String.init(cString:)();
        uint64_t v10 = v9;
        BOOL can_retry = xpc_rich_error_can_retry(v2);
        free(v7);
        *(unsigned char *)uint64_t v4 = can_retry;
        *(void *)(v4 + 8) = v8;
        *(void *)(v4 + 16) = v10;
        swift_willThrow();
        swift_unknownObjectRelease();
        goto LABEL_6;
      }
      __break(1u);
    }
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD00000000000001FLL, 0x800000020DA30F00);
  }
LABEL_6:
  swift_unknownObjectRelease();
}

BOOL _swift_xpc_session_activate(void *a1, xpc_rich_error_t *a2)
{
  uint64_t v3 = a1;
  BOOL v4 = xpc_session_activate(v3, a2);

  return v4;
}

uint64_t XPCSession.setIncomingMessageHandler(_:)(uint64_t a1)
{
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Encodable?);
  uint64_t v3 = ClientSpecifiedHandler.init(_:)(a1);
  uint64_t v5 = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v3;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = partial apply for implicit closure #2 in implicit closure #1 in XPCSession.setIncomingMessageHandler(_:);
  *(void *)(v7 + 24) = v6;
  uint64_t v8 = *(void **)(v1 + 16);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = closure #1 in XPCSession._setIncomingMessageHandler(_:)partial apply;
  *(void *)(v9 + 24) = v7;
  void v12[4] = closure #1 in XPCSession._setIncomingMessageHandler(_:)partial apply;
  void v12[5] = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  xpc_rich_error_t v12[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object) -> ();
  uint64_t v12[3] = &block_descriptor_32;
  uint64_t v10 = _Block_copy(v12);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  _swift_xpc_session_set_incoming_message_handler(v8, v10);
  _Block_release(v10);
  swift_release();
  swift_release();
  return swift_release();
}

{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void v11[6];

  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCDictionary?);
  uint64_t v3 = ClientSpecifiedHandler.init(_:)(a1);
  uint64_t v5 = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v3;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = *(void **)(v1 + 16);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = partial apply for implicit closure #2 in implicit closure #1 in XPCSession.setIncomingMessageHandler(_:);
  *(void *)(v8 + 24) = v6;
  v11[4] = partial apply for closure #1 in XPCSession._setIncomingMessageHandler(_:);
  v11[5] = v8;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1107296256;
  v11[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object) -> ();
  v11[3] = &block_descriptor;
  uint64_t v9 = _Block_copy(v11);
  swift_retain();
  swift_retain();
  swift_release();
  _swift_xpc_session_set_incoming_message_handler(v7, v9);
  _Block_release(v9);
  swift_release();
  return swift_release();
}

uint64_t ClientSpecifiedHandler.init(_:)(uint64_t a1)
{
  return a1;
}

void _swift_xpc_session_set_incoming_message_handler(void *a1, void *a2)
{
  uint64_t v3 = a1;
  id v4 = a2;
  xpc_session_set_incoming_message_handler(v3, v4);
}

void _swift_xpc_session_set_incoming_message_handler_0(void *a1, void *a2)
{
  uint64_t v3 = a1;
  id v4 = a2;
  xpc_session_set_incoming_message_handler(v3, v4);
}

uint64_t dispatch thunk of XPCSession.sendSync<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object) -> ()(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t partial apply for closure #1 in XPCSession._setIncomingMessageHandler(_:)(uint64_t a1)
{
  return closure #1 in XPCSession._setIncomingMessageHandler(_:)(a1, *(void (**)(uint64_t *__return_ptr, uint64_t *))(v1 + 16));
}

uint64_t closure #1 in XPCSession._setIncomingMessageHandler(_:)(uint64_t a1, void (*a2)(uint64_t *__return_ptr, uint64_t *))
{
  uint64_t v4 = swift_unknownObjectRetain();
  uint64_t result = MEMORY[0x2105634B0](v4);
  if (result == MEMORY[0x263EF8708])
  {
    char v6 = xpc_dictionary_expects_reply();
    uint64_t v7 = a1;
    a2(&v8, &v7);
    if (v8)
    {
      if ((v6 & 1) != 0 && xpc_dictionary_expects_reply()) {
        xpc_dictionary_send_reply_4SWIFT();
      }
      swift_unknownObjectRelease();
    }
    return swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t partial apply for closure #1 in XPCSession._setIncomingMessageHandler(_:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return closure #1 in XPCSession._setIncomingMessageHandler(_:)(a1, *(void (**)(long long *__return_ptr, void *))(v2 + 16), a2);
}

uint64_t XPCSession.sendSync<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t result = static XPCReceivedMessage.encodeMessage<A>(_:isSync:)(a1, 1, a2, a3, &v11);
  if (!v4)
  {
    uint64_t v10 = v11;
    XPCSession.sendSync(message:)(&v10, &v11);
    xpc_object_t v7 = v11;
    swift_unknownObjectRetain();
    char v8 = XPCDictionary.subscript.getter(0x656C6261646F435FLL, 0xEE00636E79537349) & 1;
    type metadata accessor for XPCReceivedMessage.XPCReceivedMessageMetadata();
    uint64_t v9 = swift_allocObject();
    *(unsigned char *)(v9 + 16) = v8;
    *(unsigned char *)(v9 + 17) = v8;
    swift_unknownObjectRelease();
    uint64_t result = swift_unknownObjectRelease();
    *a4 = v7;
    a4[1] = v9;
  }
  return result;
}

uint64_t closure #1 in XPCSession._setIncomingMessageHandler(_:)@<X0>(void *a1@<X0>, void (*a2)(long long *__return_ptr, void *)@<X1>, void *a3@<X8>)
{
  v17[0] = *a1;
  uint64_t v5 = v17[0];
  swift_unknownObjectRetain();
  char v6 = XPCDictionary.subscript.getter(0x656C6261646F435FLL, 0xEE00636E79537349) & 1;
  type metadata accessor for XPCReceivedMessage.XPCReceivedMessageMetadata();
  uint64_t v7 = swift_allocObject();
  *(unsigned char *)(v7 + 16) = v6;
  *(unsigned char *)(v7 + 17) = v6;
  v14[0] = v5;
  v14[1] = v7;
  a2(&v15, v14);
  if (v16)
  {
    outlined init with take of Encodable(&v15, (uint64_t)v17);
    uint64_t v8 = v18;
    uint64_t v9 = v19;
    uint64_t v10 = __swift_project_boxed_opaque_existential_1(v17, v18);
    *(void *)&long long v15 = v5;
    *((void *)&v15 + 1) = v7;
    XPCReceivedMessage.reply<A>(_:)((uint64_t)v10, v8, v9);
    swift_release();
    swift_unknownObjectRelease();
    *a3 = 0;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  }
  outlined destroy of Encodable?((uint64_t)&v15);
  swift_unknownObjectRetain();
  swift_retain();
  if xpc_dictionary_expects_reply() && (*(unsigned char *)(v7 + 17))
  {
    char v12 = *(unsigned char *)(v7 + 16);
    swift_release();
    swift_unknownObjectRelease();
    if ((v12 & 1) == 0)
    {
      swift_release();
      uint64_t result = swift_unknownObjectRelease();
      goto LABEL_11;
    }
    v17[0] = xpc_dictionary_create_empty();
    MEMORY[0x270FA5388](v17[0]);
    v13[2] = 0xD000000000000074;
    void v13[3] = 0x800000020DA310F0;
    v13[4] = v17;
    specialized String.withCString<A>(_:)((uint64_t (*)(void *))partial apply for closure #1 in XPCDictionary.subscript.setter, (uint64_t)v13, 0x656C6261646F435FLL, 0xED0000726F727245);
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    if (xpc_dictionary_expects_reply()) {
      xpc_dictionary_send_reply_4SWIFT();
    }
    swift_release();
    swift_unknownObjectRelease_n();
  }
  else
  {
    swift_release_n();
  }
  uint64_t result = swift_unknownObjectRelease_n();
LABEL_11:
  *a3 = 0;
  return result;
}

uint64_t type metadata accessor for XPCReceivedMessage.XPCReceivedMessageMetadata()
{
  return self;
}

uint64_t XPCDictionary.subscript.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  swift_unknownObjectRetain();
  xpc_rich_error_t v12[2] = v5;
  swift_unknownObjectRetain();
  char v6 = specialized String.withCString<A>(_:)((void *(*)(uint64_t *__return_ptr, void *))closure #1 in XPCDictionary.subscript.getterpartial apply, (uint64_t)v12, a1, a2);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = MEMORY[0x2105634B0]();
    uint64_t v9 = MEMORY[0x263EF86E0];
    swift_unknownObjectRelease();
    if (v8 == v9)
    {
      uint64_t value = xpc_BOOL_get_value(v7);
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      return 2;
    }
  }
  else
  {
    uint64_t value = 2;
    swift_unknownObjectRelease_n();
  }
  return value;
}

{
  void *v2;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL value;
  void v11[4];

  v11[2] = *v2;
  swift_unknownObjectRetain();
  uint64_t v5 = specialized String.withCString<A>(_:)((void *(*)(uint64_t *__return_ptr, void *))closure #1 in XPCDictionary.subscript.getterpartial apply, (uint64_t)v11, a1, a2);
  if (v5 && (char v6 = v5, v7 = MEMORY[0x2105634B0](), v8 = MEMORY[0x263EF86E0], swift_unknownObjectRelease(), v7 == v8))
  {
    uint64_t value = xpc_BOOL_get_value(v6);
    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    return 2;
  }
  return value;
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in XPCSession.setIncomingMessageHandler(_:)(long long *a1)
{
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  long long v4 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Encodable?);
  return ClientSpecifiedHandler.callEventHandler(_:)((uint64_t)&v4, v2);
}

uint64_t ClientSpecifiedHandler.callEventHandler(_:)(uint64_t a1, void (*a2)(uint64_t))
{
  return swift_release();
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in XPCListener.IncomingSessionRequest.accept<A>(_:)(long long *a1)
{
  uint64_t v2 = *(void *)(v1 + 24);
  long long v4 = *a1;
  return (*(uint64_t (**)(long long *))(v2 + 24))(&v4);
}

uint64_t XPCReceivedMessage.reply<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  static XPCReceivedMessage.encodeMessage<A>(_:isSync:)(a1, 0, a2, a3, (xpc_object_t *)&v4);
  swift_unknownObjectRetain();
  if (xpc_dictionary_expects_reply()) {
    xpc_dictionary_send_reply_4SWIFT();
  }
  swift_unknownObjectRelease();

  return swift_unknownObjectRelease();
}

uint64_t XPCSession.sendSync(message:)@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  v20[1] = *(xpc_rich_error_t *)MEMORY[0x263EF8340];
  long long v4 = *a1;
  v20[0] = 0;
  id v5 = _swift_xpc_session_send_message_with_reply_sync(*(void **)(v2 + 16), v4, v20);
  char v6 = v20[0];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = swift_unknownObjectRetain();
    uint64_t v9 = MEMORY[0x2105634B0](v8);
    swift_unknownObjectRelease();
    uint64_t result = swift_unknownObjectRelease();
    if (v9 == MEMORY[0x263EF8708])
    {
      *a2 = v7;
      return result;
    }
    __break(1u);
LABEL_9:
    __break(1u);
  }
  if (!v20[0]) {
LABEL_11:
  }
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD000000000000018, 0x800000020DA30F80);
  lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError();
  swift_allocError();
  uint64_t v12 = v11;
  uint64_t v13 = swift_unknownObjectRetain();
  if (MEMORY[0x2105634B0](v13) != MEMORY[0x263EF8770]) {
    goto LABEL_9;
  }
  uint64_t v14 = xpc_rich_error_copy_description(v6);
  if (!v14)
  {
    __break(1u);
    goto LABEL_11;
  }
  long long v15 = v14;
  uint64_t v16 = String.init(cString:)();
  uint64_t v18 = v17;
  BOOL can_retry = xpc_rich_error_can_retry(v6);
  free(v15);
  *(unsigned char *)uint64_t v12 = can_retry;
  *(void *)(v12 + 8) = v16;
  *(void *)(v12 + 16) = v18;
  swift_willThrow();
  swift_unknownObjectRelease();
  return swift_unknownObjectRelease();
}

id _swift_xpc_session_send_message_with_reply_sync(void *a1, void *a2, xpc_rich_error_t *a3)
{
  id v5 = a1;
  id v6 = a2;
  xpc_object_t v7 = xpc_session_send_message_with_reply_sync(v5, v6, a3);

  return v7;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Result<B, Error>) -> ()()
{
  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t outlined destroy of Encodable?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Encodable?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *initializeBufferWithCopyOfBuffer for XPCReceivedMessage(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_unknownObjectRetain();
  swift_retain();
  return a1;
}

uint64_t protocol witness for SingleValueDecodingContainer.decode(_:) in conformance _XPCSingleValueDecodingContainer()
{
  return specialized _XPCSingleValueDecodingContainer.decode<A>(_:)();
}

{
  return specialized _XPCSingleValueDecodingContainer.decode<A>(_:)();
}

{
  return specialized _XPCSingleValueDecodingContainer.decode<A>(_:)();
}

{
  return specialized _XPCSingleValueDecodingContainer.decode<A>(_:)() & 1;
}

{
  return specialized _XPCSingleValueDecodingContainer.decode<A>(_:)();
}

{
  return specialized _XPCSingleValueDecodingContainer.decode<A>(_:)();
}

{
  return specialized _XPCSingleValueDecodingContainer.decode<A>(_:)();
}

{
  return specialized _XPCSingleValueDecodingContainer.decode<A>(_:)();
}

{
  return SingleValueDecodingContainer.decode(_:)();
}

{
  return specialized _XPCSingleValueDecodingContainer.decode<A>(_:)();
}

{
  return specialized _XPCSingleValueDecodingContainer.decode<A>(_:)();
}

{
  return specialized _XPCSingleValueDecodingContainer.decode<A>(_:)();
}

{
  return specialized _XPCSingleValueDecodingContainer.decode<A>(_:)();
}

{
  return SingleValueDecodingContainer.decode(_:)();
}

uint64_t specialized _XPCSingleValueDecodingContainer.decode<A>(_:)()
{
  uint64_t v2 = MEMORY[0x263F8D310];
  uint64_t v3 = swift_conformsToProtocol2();
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v6 = v0[2];
  uint64_t v7 = *(void *)(v3 + 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  uint64_t v14 = v2;
  uint64_t v15 = v3;
  __swift_allocate_boxed_opaque_existential_1(&v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v8(v5, v4, v6, v2, v7);
  if (v1) {
    return __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v12);
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    uint64_t v12 = 0;
    uint64_t v13 = 0xE000000000000000;
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    uint64_t v12 = 0xD000000000000016;
    uint64_t v13 = 0x800000020DA326D0;
    v10._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    __XPC_INTERNAL_CRASH__(_:file:line:)(v12, v13);
  }
  return v11;
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  uint64_t v2 = MEMORY[0x263F8E970];
  uint64_t v3 = swift_conformsToProtocol2();
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v6 = v0[2];
  uint64_t v7 = *(void *)(v3 + 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  uint64_t v14 = v2;
  uint64_t v15 = v3;
  __swift_allocate_boxed_opaque_existential_1(&v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v8(v5, v4, v6, v2, v7);
  if (v1) {
    return __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v12);
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    uint64_t v12 = 0;
    uint64_t v13 = 0xE000000000000000;
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    uint64_t v12 = 0xD000000000000016;
    uint64_t v13 = 0x800000020DA326D0;
    v10._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    __XPC_INTERNAL_CRASH__(_:file:line:)(v12, v13);
  }
  return v11;
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  Swift::String v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  uint64_t v2 = MEMORY[0x263F8E548];
  uint64_t v3 = swift_conformsToProtocol2();
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v6 = v0[2];
  uint64_t v7 = *(void *)(v3 + 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  uint64_t v14 = v2;
  uint64_t v15 = v3;
  __swift_allocate_boxed_opaque_existential_1(&v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v8(v5, v4, v6, v2, v7);
  if (v1) {
    return __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v12);
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    uint64_t v12 = 0;
    uint64_t v13 = 0xE000000000000000;
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    uint64_t v12 = 0xD000000000000016;
    uint64_t v13 = 0x800000020DA326D0;
    v10._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    __XPC_INTERNAL_CRASH__(_:file:line:)(v12, v13);
  }
  return v11;
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  char v9;
  Swift::String v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  uint64_t v2 = MEMORY[0x263F8D4F8];
  uint64_t v3 = swift_conformsToProtocol2();
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v6 = v0[2];
  uint64_t v7 = *(void *)(v3 + 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  uint64_t v15 = v2;
  uint64_t v16 = v3;
  __swift_allocate_boxed_opaque_existential_1(&v13);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v8(v5, v4, v6, v2, v7);
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
    if (swift_dynamicCast())
    {
      uint64_t v9 = v12 & 1;
      return v9 & 1;
    }
LABEL_8:
    uint64_t v13 = 0;
    uint64_t v14 = 0xE000000000000000;
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    uint64_t v13 = 0xD000000000000016;
    uint64_t v14 = 0x800000020DA326D0;
    v11._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v11);
    swift_bridgeObjectRelease();
    __XPC_INTERNAL_CRASH__(_:file:line:)(v13, v14);
  }
  __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v13);
  return v9 & 1;
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  uint64_t v2 = MEMORY[0x263F8D6C8];
  uint64_t v3 = swift_conformsToProtocol2();
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v6 = v0[2];
  uint64_t v7 = *(void *)(v3 + 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  uint64_t v14 = v2;
  uint64_t v15 = v3;
  __swift_allocate_boxed_opaque_existential_1(&v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v8(v5, v4, v6, v2, v7);
  if (v1) {
    return __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v12);
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    uint64_t v12 = 0;
    uint64_t v13 = 0xE000000000000000;
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    uint64_t v12 = 0xD000000000000016;
    uint64_t v13 = 0x800000020DA326D0;
    v10._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    __XPC_INTERNAL_CRASH__(_:file:line:)(v12, v13);
  }
  return v11;
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  Swift::String v10;
  unsigned __int8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  uint64_t v2 = MEMORY[0x263F8E498];
  uint64_t v3 = swift_conformsToProtocol2();
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v6 = v0[2];
  uint64_t v7 = *(void *)(v3 + 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  uint64_t v14 = v2;
  uint64_t v15 = v3;
  __swift_allocate_boxed_opaque_existential_1(&v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v8(v5, v4, v6, v2, v7);
  if (v1) {
    return __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v12);
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    uint64_t v12 = 0;
    uint64_t v13 = 0xE000000000000000;
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    uint64_t v12 = 0xD000000000000016;
    uint64_t v13 = 0x800000020DA326D0;
    v10._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    __XPC_INTERNAL_CRASH__(_:file:line:)(v12, v13);
  }
  return v11;
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  Swift::String v10;
  unsigned __int16 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  uint64_t v2 = MEMORY[0x263F8E4F0];
  uint64_t v3 = swift_conformsToProtocol2();
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v6 = v0[2];
  uint64_t v7 = *(void *)(v3 + 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  uint64_t v14 = v2;
  uint64_t v15 = v3;
  __swift_allocate_boxed_opaque_existential_1(&v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v8(v5, v4, v6, v2, v7);
  if (v1) {
    return __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v12);
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    uint64_t v12 = 0;
    uint64_t v13 = 0xE000000000000000;
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    uint64_t v12 = 0xD000000000000016;
    uint64_t v13 = 0x800000020DA326D0;
    v10._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    __XPC_INTERNAL_CRASH__(_:file:line:)(v12, v13);
  }
  return v11;
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  uint64_t v2 = MEMORY[0x263F8E5C0];
  uint64_t v3 = swift_conformsToProtocol2();
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v6 = v0[2];
  uint64_t v7 = *(void *)(v3 + 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  uint64_t v14 = v2;
  uint64_t v15 = v3;
  __swift_allocate_boxed_opaque_existential_1(&v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v8(v5, v4, v6, v2, v7);
  if (v1) {
    return __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v12);
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    uint64_t v12 = 0;
    uint64_t v13 = 0xE000000000000000;
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    uint64_t v12 = 0xD000000000000016;
    uint64_t v13 = 0x800000020DA326D0;
    v10._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    __XPC_INTERNAL_CRASH__(_:file:line:)(v12, v13);
  }
  return v11;
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  uint64_t v2 = MEMORY[0x263F8D9D0];
  uint64_t v3 = swift_conformsToProtocol2();
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v6 = v0[2];
  uint64_t v7 = *(void *)(v3 + 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  uint64_t v14 = v2;
  uint64_t v15 = v3;
  __swift_allocate_boxed_opaque_existential_1(&v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v8(v5, v4, v6, v2, v7);
  if (v1) {
    return __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v12);
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    uint64_t v12 = 0;
    uint64_t v13 = 0xE000000000000000;
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    uint64_t v12 = 0xD000000000000016;
    uint64_t v13 = 0x800000020DA326D0;
    v10._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    __XPC_INTERNAL_CRASH__(_:file:line:)(v12, v13);
  }
  return v11;
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  Swift::String v10;
  unsigned __int8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  uint64_t v2 = MEMORY[0x263F8E778];
  uint64_t v3 = swift_conformsToProtocol2();
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v6 = v0[2];
  uint64_t v7 = *(void *)(v3 + 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  uint64_t v14 = v2;
  uint64_t v15 = v3;
  __swift_allocate_boxed_opaque_existential_1(&v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v8(v5, v4, v6, v2, v7);
  if (v1) {
    return __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v12);
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    uint64_t v12 = 0;
    uint64_t v13 = 0xE000000000000000;
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    uint64_t v12 = 0xD000000000000016;
    uint64_t v13 = 0x800000020DA326D0;
    v10._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    __XPC_INTERNAL_CRASH__(_:file:line:)(v12, v13);
  }
  return v11;
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  Swift::String v10;
  unsigned __int16 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  uint64_t v2 = MEMORY[0x263F8E888];
  uint64_t v3 = swift_conformsToProtocol2();
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v6 = v0[2];
  uint64_t v7 = *(void *)(v3 + 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  uint64_t v14 = v2;
  uint64_t v15 = v3;
  __swift_allocate_boxed_opaque_existential_1(&v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v8(v5, v4, v6, v2, v7);
  if (v1) {
    return __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v12);
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    uint64_t v12 = 0;
    uint64_t v13 = 0xE000000000000000;
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    uint64_t v12 = 0xD000000000000016;
    uint64_t v13 = 0x800000020DA326D0;
    v10._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    __XPC_INTERNAL_CRASH__(_:file:line:)(v12, v13);
  }
  return v11;
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  Swift::String v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  uint64_t v2 = MEMORY[0x263F8E8F8];
  uint64_t v3 = swift_conformsToProtocol2();
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v6 = v0[2];
  uint64_t v7 = *(void *)(v3 + 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  uint64_t v14 = v2;
  uint64_t v15 = v3;
  __swift_allocate_boxed_opaque_existential_1(&v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v8(v5, v4, v6, v2, v7);
  if (v1) {
    return __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v12);
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    uint64_t v12 = 0;
    uint64_t v13 = 0xE000000000000000;
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    uint64_t v12 = 0xD000000000000016;
    uint64_t v13 = 0x800000020DA326D0;
    v10._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    __XPC_INTERNAL_CRASH__(_:file:line:)(v12, v13);
  }
  return v11;
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance String@<X0>(void *a1@<X2>, void *a2@<X8>)
{
  specialized static DecodingContainer.decodeType(from:withCodingMetadata:)(a1);
  if (v2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  else
  {
    uint64_t v5 = specialized static String.decodeValue(from:withCodingMetadata:)();
    uint64_t v7 = v6;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_release();
    *a2 = v5;
    a2[1] = v7;
  }
  return result;
}

uint64_t protocol witness for Encoder.unkeyedContainer() in conformance _XPCEncoder@<X0>(void *a1@<X8>)
{
  return _XPCEncoder.unkeyedContainer()(a1);
}

uint64_t _XPCEncoder.unkeyedContainer()@<X0>(void *a1@<X8>)
{
  uint64_t v3 = v1 + 32;
  swift_beginAccess();
  outlined init with copy of EncodingContainer?(v1 + 32, (uint64_t)v14);
  uint64_t v4 = v15;
  if (v15)
  {
    uint64_t v5 = v16;
    uint64_t v6 = __swift_project_boxed_opaque_existential_1(v14, v15);
    *((void *)&v18 + 1) = v4;
    uint64_t v19 = *(_UNKNOWN ***)(v5 + 8);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v17);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(boxed_opaque_existential_1, v6, v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  }
  else
  {
    outlined destroy of DecodingContainer?((uint64_t)v14, &demangling cache variable for type metadata for EncodingContainer?);
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v19 = 0;
  }
  uint64_t v9 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v10 = specialized static SharableStorageContainer.getExisting<A>(container:codingMetadata:)(v14, (uint64_t)&v17, v9, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of DecodingContainer?((uint64_t)&v17, &demangling cache variable for type metadata for CodingContainer?);
  uint64_t v11 = v14[0];
  if ((v10 & 1) == 0) {
    goto LABEL_7;
  }
  *((void *)&v18 + 1) = type metadata accessor for _XPCUnkeyedEncodingContainer();
  uint64_t v19 = &protocol witness table for _XPCUnkeyedEncodingContainer;
  *(void *)&long long v17 = v11;
  outlined init with copy of EncodingContainer?(v3, (uint64_t)v14);
  uint64_t v12 = v15;
  swift_retain();
  uint64_t result = outlined destroy of DecodingContainer?((uint64_t)v14, &demangling cache variable for type metadata for EncodingContainer?);
  if (!v12)
  {
    swift_beginAccess();
    outlined assign with take of EncodingContainer?((uint64_t)&v17, v3);
    swift_endAccess();
LABEL_7:
    a1[3] = type metadata accessor for _XPCUnkeyedEncodingContainer();
    uint64_t result = _s3XPC11_XPCEncoderCACs7EncoderAAWlTm_1(&lazy protocol witness table cache variable for type _XPCUnkeyedEncodingContainer and conformance _XPCUnkeyedEncodingContainer, 255, (void (*)(uint64_t))type metadata accessor for _XPCUnkeyedEncodingContainer);
    a1[4] = result;
    *a1 = v11;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for _XPCUnkeyedEncodingContainer()
{
  return self;
}

uint64_t specialized static SharableStorageContainer.getExisting<A>(container:codingMetadata:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for _XPCUnkeyedEncodingContainer.UnkeyedEncodingStorage();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = MEMORY[0x263F8EE78];
  LOBYTE(a4) = specialized static SharableStorageContainer.getExisting<A>(container:codingMetadata:initialStorage:)(a1, a2, a3, a4, v8);
  swift_release();
  return a4 & 1;
}

uint64_t type metadata accessor for _XPCUnkeyedEncodingContainer.UnkeyedEncodingStorage()
{
  return self;
}

uint64_t specialized static SharableStorageContainer.getExisting<A>(container:codingMetadata:initialStorage:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  outlined init with copy of CodingContainer?(a2, (uint64_t)v19);
  if (v19[3])
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingContainer);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SharableStorageContainer);
    if (swift_dynamicCast())
    {
      if (*((void *)&v21 + 1))
      {
        long long v18 = a1;
        uint64_t v26 = v5;
        outlined init with take of Encodable(&v20, (uint64_t)v23);
        uint64_t v12 = v24;
        uint64_t v11 = v25;
        __swift_project_boxed_opaque_existential_1(v23, v24);
        long long v17 = *(void (**)(uint64_t, uint64_t))(v11 + 24);
        *((void *)&v21 + 1) = swift_getAssociatedTypeWitness();
        __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v20);
        v17(v12, v11);
        if (swift_dynamicCast())
        {
          uint64_t v13 = v19[0];
          type metadata accessor for _XPCUnkeyedEncodingContainer();
          uint64_t v14 = (void *)swift_allocObject();
          void v14[2] = a3;
          void v14[3] = a4;
          v14[4] = v13;
          *long long v18 = v14;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
          return 0;
        }
        uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
        a1 = v18;
        if (*(void *)(a2 + 24)) {
          goto LABEL_11;
        }
LABEL_9:
        type metadata accessor for _XPCUnkeyedEncodingContainer();
        uint64_t v16 = (void *)swift_allocObject();
        v16[2] = a3;
        void v16[3] = a4;
        v16[4] = a5;
        *a1 = v16;
        swift_retain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        return 1;
      }
    }
    else
    {
      uint64_t v22 = 0;
      long long v20 = 0u;
      long long v21 = 0u;
    }
  }
  else
  {
    outlined destroy of DecodingContainer?((uint64_t)v19, &demangling cache variable for type metadata for CodingContainer?);
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v22 = 0;
  }
  uint64_t result = outlined destroy of DecodingContainer?((uint64_t)&v20, &demangling cache variable for type metadata for SharableStorageContainer?);
  if (!*(void *)(a2 + 24)) {
    goto LABEL_9;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encode(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[1] = a2;
  v4[0] = a1;
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)((uint64_t)v4, a3, MEMORY[0x263F8D310], MEMORY[0x263F8D318]);
}

uint64_t XPCReceivedMessage.isSync.getter()
{
  return *(unsigned __int8 *)(*(void *)(v0 + 8) + 17);
}

Swift::Void __swiftcall XPCReceivedMessage.detachHandoff()()
{
  *(unsigned char *)(*(void *)(v0 + 8) + 16) = 0;
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(uint64_t a1)
{
  uint64_t result = _XPCKeyedDecodingContainer.decode<A>(_:forKey:)(a1, MEMORY[0x263F8D310], (uint64_t)&v3);
  if (!v1) {
    return v3;
  }
  return result;
}

{
  uint64_t v1;
  char v2;
  char v4;

  _XPCKeyedDecodingContainer.decode<A>(_:forKey:)(a1, MEMORY[0x263F8D4F8], (uint64_t)&v4);
  if (!v1) {
    uint64_t v2 = v4;
  }
  return v2 & 1;
}

uint64_t protocol witness for UnkeyedDecodingContainer.count.getter in conformance _XPCUnkeyedDecodingContainer()
{
  return *(void *)(*(void *)(*(void *)v0 + 32) + 24);
}

uint64_t protocol witness for UnkeyedDecodingContainer.decode<A>(_:) in conformance _XPCUnkeyedDecodingContainer@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return _XPCUnkeyedDecodingContainer.decode<A>(_:)(a1, a2);
}

uint64_t _XPCUnkeyedDecodingContainer.decode<A>(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  type metadata accessor for XPCDecoder();
  uint64_t v6 = v2[4];
  uint64_t v8 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v9 = swift_retain();
  static XPCDecoder.decode<A>(from:withCodingMetadata:)(v9, v8, v7, a1, a2);
  uint64_t result = swift_release();
  uint64_t v11 = *(void *)(v6 + 32);
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  int v14 = v12;
  if (v3)
  {
    if (!v14)
    {
LABEL_8:
      *(void *)(v6 + 32) = v13;
      return result;
    }
    __break(1u);
  }
  if ((v14 & 1) == 0) {
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

uint64_t XPCReceivedMessage.expectsReply.getter()
{
  return xpc_dictionary_expects_reply();
}

uint64_t protocol witness for SingleValueEncodingContainer.encode<A>(_:) in conformance _XPCSingleValueEncodingContainer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _XPCSingleValueEncodingContainer.encode<A>(_:)(a1, a2, a3);
}

uint64_t _XPCSingleValueEncodingContainer.encode<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  MEMORY[0x270FA5388](a1);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v10 + 16))(v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0) + 22, a1, a2);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
  if (swift_dynamicCast())
  {
    outlined init with take of Encodable(&v18, (uint64_t)&v21);
    uint64_t v11 = v22;
    BOOL v12 = v23;
    uint64_t v13 = __swift_project_boxed_opaque_existential_1(&v21, (uint64_t)v22);
    *((void *)&v19 + 1) = v11;
    long long v20 = v12[2];
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v18);
    (*((void (**)(uint64_t *, void *, ValueMetadata *))v11[-1].Description + 2))(boxed_opaque_existential_1, v13, v11);
    outlined init with take of EncodingContainer?((uint64_t)&v18, (uint64_t)v17);
    swift_beginAccess();
    outlined assign with take of EncodingContainer?((uint64_t)v17, v5 + 32);
    swift_endAccess();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v21);
  }
  long long v20 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  outlined destroy of DecodingContainer?((uint64_t)&v18, &demangling cache variable for type metadata for CodingPrimitive?);
  if (static OptionalPrimitive.isOptionalPrimitive<A>(_:)(a1))
  {
    type metadata accessor for XPCEncoder();
    uint64_t result = static XPCEncoder.encode<A>(_:withCodingMetadata:)(a1, *(void *)(v5 + 16), *(void *)(v5 + 24), a2, a3, (uint64_t)&v21);
    if (v4) {
      return result;
    }
    outlined init with take of Encodable(&v21, (uint64_t)&v18);
    outlined init with take of EncodingContainer?((uint64_t)&v18, (uint64_t)v17);
    swift_beginAccess();
    outlined assign with take of EncodingContainer?((uint64_t)v17, v5 + 32);
  }
  else
  {
    uint64_t v22 = &type metadata for OptionalPrimitive;
    uint64_t v23 = &protocol witness table for OptionalPrimitive;
    outlined init with take of EncodingContainer?((uint64_t)&v21, (uint64_t)&v18);
    swift_beginAccess();
    outlined assign with take of EncodingContainer?((uint64_t)&v18, v5 + 32);
  }
  return swift_endAccess();
}

uint64_t static OptionalPrimitive.isOptionalPrimitive<A>(_:)(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v2 + 16))((char *)v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingOptional);
  if (swift_dynamicCast())
  {
    outlined init with take of Encodable(v7, (uint64_t)v9);
    uint64_t v3 = v10;
    uint64_t v4 = v11;
    __swift_project_boxed_opaque_existential_1(v9, v10);
    LOBYTE(v3) = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v3, v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
    char v5 = v3 ^ 1;
  }
  else
  {
    uint64_t v8 = 0;
    memset(v7, 0, sizeof(v7));
    outlined destroy of CodingOptional?((uint64_t)v7);
    char v5 = 1;
  }
  return v5 & 1;
}

uint64_t outlined destroy of CodingOptional?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingOptional?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t protocol witness for SingleValueEncodingContainer.encode(_:) in conformance _XPCSingleValueEncodingContainer(uint64_t a1)
{
  return specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(a1);
}

{
  return specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(a1);
}

{
  return specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(a1);
}

{
  return specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(a1);
}

uint64_t specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8E970];
  void v8[3] = MEMORY[0x263F8E970];
  v8[4] = &protocol witness table for UInt64;
  v8[0] = a1;
  uint64_t v3 = __swift_project_boxed_opaque_existential_1(v8, MEMORY[0x263F8E970]);
  v7[3] = v2;
  v7[4] = (uint64_t)off_26C23F258;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v2 - 8) + 16))(boxed_opaque_existential_1, v3, v2);
  outlined init with take of EncodingContainer?((uint64_t)v7, (uint64_t)v6);
  swift_beginAccess();
  outlined assign with take of EncodingContainer?((uint64_t)v6, v1 + 32);
  swift_endAccess();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t *boxed_opaque_existential_1;
  unsigned char v6[40];
  uint64_t v7[5];
  void v8[5];

  uint64_t v2 = MEMORY[0x263F8D6C8];
  void v8[3] = MEMORY[0x263F8D6C8];
  v8[4] = &protocol witness table for Int;
  v8[0] = a1;
  uint64_t v3 = __swift_project_boxed_opaque_existential_1(v8, MEMORY[0x263F8D6C8]);
  v7[3] = v2;
  v7[4] = (uint64_t)off_26C23ED90;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v2 - 8) + 16))(boxed_opaque_existential_1, v3, v2);
  outlined init with take of EncodingContainer?((uint64_t)v7, (uint64_t)v6);
  swift_beginAccess();
  outlined assign with take of EncodingContainer?((uint64_t)v6, v1 + 32);
  swift_endAccess();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t *boxed_opaque_existential_1;
  unsigned char v6[40];
  uint64_t v7[5];
  void v8[5];

  uint64_t v2 = MEMORY[0x263F8E5C0];
  void v8[3] = MEMORY[0x263F8E5C0];
  v8[4] = &protocol witness table for Int64;
  v8[0] = a1;
  uint64_t v3 = __swift_project_boxed_opaque_existential_1(v8, MEMORY[0x263F8E5C0]);
  v7[3] = v2;
  v7[4] = (uint64_t)off_26C23F038;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v2 - 8) + 16))(boxed_opaque_existential_1, v3, v2);
  outlined init with take of EncodingContainer?((uint64_t)v7, (uint64_t)v6);
  swift_beginAccess();
  outlined assign with take of EncodingContainer?((uint64_t)v6, v1 + 32);
  swift_endAccess();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t *boxed_opaque_existential_1;
  unsigned char v6[40];
  uint64_t v7[5];
  void v8[5];

  uint64_t v2 = MEMORY[0x263F8D9D0];
  void v8[3] = MEMORY[0x263F8D9D0];
  v8[4] = &protocol witness table for UInt;
  v8[0] = a1;
  uint64_t v3 = __swift_project_boxed_opaque_existential_1(v8, MEMORY[0x263F8D9D0]);
  v7[3] = v2;
  v7[4] = (uint64_t)off_26C23EE18;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v2 - 8) + 16))(boxed_opaque_existential_1, v3, v2);
  outlined init with take of EncodingContainer?((uint64_t)v7, (uint64_t)v6);
  swift_beginAccess();
  outlined assign with take of EncodingContainer?((uint64_t)v6, v1 + 32);
  swift_endAccess();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t protocol witness for SingleValueEncodingContainer.encode(_:) in conformance _XPCSingleValueEncodingContainer(int a1)
{
  return specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(a1);
}

{
  return specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(a1);
}

uint64_t specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(int a1)
{
  uint64_t v2 = MEMORY[0x263F8E548];
  void v8[3] = MEMORY[0x263F8E548];
  v8[4] = &protocol witness table for Int32;
  LODWORD(v8[0]) = a1;
  uint64_t v3 = __swift_project_boxed_opaque_existential_1(v8, MEMORY[0x263F8E548]);
  v7[3] = v2;
  v7[4] = (uint64_t)off_26C23EFB0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v2 - 8) + 16))(boxed_opaque_existential_1, v3, v2);
  outlined init with take of EncodingContainer?((uint64_t)v7, (uint64_t)v6);
  swift_beginAccess();
  outlined assign with take of EncodingContainer?((uint64_t)v6, v1 + 32);
  swift_endAccess();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t *boxed_opaque_existential_1;
  unsigned char v6[40];
  uint64_t v7[5];
  void v8[5];

  uint64_t v2 = MEMORY[0x263F8E8F8];
  void v8[3] = MEMORY[0x263F8E8F8];
  v8[4] = &protocol witness table for UInt32;
  LODWORD(v8[0]) = a1;
  uint64_t v3 = __swift_project_boxed_opaque_existential_1(v8, MEMORY[0x263F8E8F8]);
  v7[3] = v2;
  v7[4] = (uint64_t)off_26C23F1D0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v2 - 8) + 16))(boxed_opaque_existential_1, v3, v2);
  outlined init with take of EncodingContainer?((uint64_t)v7, (uint64_t)v6);
  swift_beginAccess();
  outlined assign with take of EncodingContainer?((uint64_t)v6, v1 + 32);
  swift_endAccess();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t protocol witness for SingleValueEncodingContainer.encode(_:) in conformance _XPCSingleValueEncodingContainer(char a1)
{
  return specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(a1);
}

{
  return specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(a1);
}

{
  return specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(a1);
}

uint64_t specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(char a1)
{
  uint64_t v2 = MEMORY[0x263F8D4F8];
  void v8[3] = MEMORY[0x263F8D4F8];
  v8[4] = &protocol witness table for Bool;
  LOBYTE(v8[0]) = a1;
  uint64_t v3 = __swift_project_boxed_opaque_existential_1(v8, MEMORY[0x263F8D4F8]);
  v7[3] = v2;
  v7[4] = (uint64_t)off_26C23EC58;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v2 - 8) + 16))(boxed_opaque_existential_1, v3, v2);
  outlined init with take of EncodingContainer?((uint64_t)v7, (uint64_t)v6);
  swift_beginAccess();
  outlined assign with take of EncodingContainer?((uint64_t)v6, v1 + 32);
  swift_endAccess();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t *boxed_opaque_existential_1;
  unsigned char v6[40];
  uint64_t v7[5];
  void v8[5];

  uint64_t v2 = MEMORY[0x263F8E498];
  void v8[3] = MEMORY[0x263F8E498];
  v8[4] = &protocol witness table for Int8;
  LOBYTE(v8[0]) = a1;
  uint64_t v3 = __swift_project_boxed_opaque_existential_1(v8, MEMORY[0x263F8E498]);
  v7[3] = v2;
  v7[4] = (uint64_t)off_26C23EEA0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v2 - 8) + 16))(boxed_opaque_existential_1, v3, v2);
  outlined init with take of EncodingContainer?((uint64_t)v7, (uint64_t)v6);
  swift_beginAccess();
  outlined assign with take of EncodingContainer?((uint64_t)v6, v1 + 32);
  swift_endAccess();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t *boxed_opaque_existential_1;
  unsigned char v6[40];
  uint64_t v7[5];
  void v8[5];

  uint64_t v2 = MEMORY[0x263F8E778];
  void v8[3] = MEMORY[0x263F8E778];
  v8[4] = &protocol witness table for UInt8;
  LOBYTE(v8[0]) = a1;
  uint64_t v3 = __swift_project_boxed_opaque_existential_1(v8, MEMORY[0x263F8E778]);
  v7[3] = v2;
  v7[4] = (uint64_t)off_26C23F0C0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v2 - 8) + 16))(boxed_opaque_existential_1, v3, v2);
  outlined init with take of EncodingContainer?((uint64_t)v7, (uint64_t)v6);
  swift_beginAccess();
  outlined assign with take of EncodingContainer?((uint64_t)v6, v1 + 32);
  swift_endAccess();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t protocol witness for SingleValueEncodingContainer.encode(_:) in conformance _XPCSingleValueEncodingContainer(double a1)
{
  return specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(a1);
}

uint64_t specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(double a1)
{
  uint64_t v2 = MEMORY[0x263F8D538];
  void v8[3] = MEMORY[0x263F8D538];
  v8[4] = &protocol witness table for Double;
  *(double *)uint64_t v8 = a1;
  uint64_t v3 = __swift_project_boxed_opaque_existential_1(v8, MEMORY[0x263F8D538]);
  v7[3] = v2;
  v7[4] = (uint64_t)off_26C23ECC0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v2 - 8) + 16))(boxed_opaque_existential_1, v3, v2);
  outlined init with take of EncodingContainer?((uint64_t)v7, (uint64_t)v6);
  swift_beginAccess();
  outlined assign with take of EncodingContainer?((uint64_t)v6, v1 + 32);
  swift_endAccess();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t protocol witness for SingleValueEncodingContainer.encode(_:) in conformance _XPCSingleValueEncodingContainer(uint64_t a1, uint64_t a2)
{
  return specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(a1, a2);
}

uint64_t specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x263F8D310];
  void v9[3] = MEMORY[0x263F8D310];
  v9[4] = &protocol witness table for String;
  v9[0] = a1;
  v9[1] = a2;
  uint64_t v4 = __swift_project_boxed_opaque_existential_1(v9, MEMORY[0x263F8D310]);
  void v8[3] = v3;
  v8[4] = (uint64_t)off_26C23EBF0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v8);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v3 - 8) + 16))(boxed_opaque_existential_1, v4, v3);
  outlined init with take of EncodingContainer?((uint64_t)v8, (uint64_t)v7);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  outlined assign with take of EncodingContainer?((uint64_t)v7, v2 + 32);
  swift_endAccess();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
}

uint64_t outlined init with take of EncodingContainer?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for EncodingContainer?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance UInt64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))specialized static DecodingContainer.decodeType(from:withCodingMetadata:), (uint64_t (*)(uint64_t, uint64_t))specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:), a4);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t, uint64_t, uint64_t)@<X5>, uint64_t (*a5)(uint64_t, uint64_t)@<X6>, uint64_t *a6@<X8>)
{
  a4(a3, a1, a2);
  if (v6)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  else
  {
    uint64_t v12 = a5(a3, a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_release();
    *a6 = v12;
  }
  return result;
}

double protocol witness for SingleValueDecodingContainer.decode(_:) in conformance _XPCSingleValueDecodingContainer()
{
  return specialized _XPCSingleValueDecodingContainer.decode<A>(_:)();
}

double specialized _XPCSingleValueDecodingContainer.decode<A>(_:)()
{
  uint64_t v2 = MEMORY[0x263F8D538];
  uint64_t v3 = swift_conformsToProtocol2();
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v6 = v0[2];
  uint64_t v7 = *(void *)(v3 + 8);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  uint64_t v14 = v2;
  uint64_t v15 = v3;
  __swift_allocate_boxed_opaque_existential_1(&v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v8(v5, v4, v6, v2, v7);
  if (v1)
  {
    __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v12);
    return result;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    uint64_t v12 = 0;
    uint64_t v13 = 0xE000000000000000;
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    uint64_t v12 = 0xD000000000000016;
    uint64_t v13 = 0x800000020DA326D0;
    v10._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    __XPC_INTERNAL_CRASH__(_:file:line:)(v12, v13);
  }
  return v11;
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Double@<X0>(void *a1@<X2>, void *a2@<X8>)
{
  specialized static DecodingContainer.decodeType(from:withCodingMetadata:)(a1);
  if (v2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  else
  {
    uint64_t v5 = specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_release();
    *a2 = v5;
  }
  return result;
}

uint64_t XPC_EVENT_KEY_NAME.getter()
{
  return XPC_ERROR_KEY_DESCRIPTION.getter(&one-time initialization token for XPC_EVENT_KEY_NAME, (uint64_t)&XPC_EVENT_KEY_NAME);
}

uint64_t protocol witness for UnkeyedDecodingContainer.decodeIfPresent<A>(_:) in conformance _XPCUnkeyedDecodingContainer()
{
  return UnkeyedDecodingContainer.decodeIfPresent<A>(_:)();
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x263F8E548]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x263F8D6C8]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x263F8E498]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x263F8E4F0]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x263F8E5C0]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x263F8D9D0]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x263F8E778]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x263F8E888]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x263F8E8F8]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x263F8E970]);
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = _XPCKeyedDecodingContainer.decode<A>(_:forKey:)(a1, a4, (uint64_t)&v6);
  if (!v4) {
    return v6;
  }
  return result;
}

{
  uint64_t v4;
  uint64_t result;
  unsigned __int8 v6;

  uint64_t result = _XPCKeyedDecodingContainer.decode<A>(_:forKey:)(a1, a4, (uint64_t)&v6);
  if (!v4) {
    return v6;
  }
  return result;
}

{
  uint64_t v4;
  uint64_t result;
  unsigned __int16 v6;

  uint64_t result = _XPCKeyedDecodingContainer.decode<A>(_:forKey:)(a1, a4, (uint64_t)&v6);
  if (!v4) {
    return v6;
  }
  return result;
}

{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  uint64_t result = _XPCKeyedDecodingContainer.decode<A>(_:forKey:)(a1, a4, (uint64_t)&v6);
  if (!v4) {
    return v6;
  }
  return result;
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encode(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(int a1, uint64_t a2)
{
  int v3 = a1;
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)((uint64_t)&v3, a2, MEMORY[0x263F8E548], MEMORY[0x263F8E550]);
}

{
  int v3;

  int v3 = a1;
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)((uint64_t)&v3, a2, MEMORY[0x263F8E8F8], MEMORY[0x263F8E900]);
}

uint64_t XPC_ERROR_KEY_DESCRIPTION.getter(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  return *(void *)a2;
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encode(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1, double a2)
{
  double v3 = a2;
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)((uint64_t)&v3, a1, MEMORY[0x263F8D538], MEMORY[0x263F8D548]);
}

double protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(uint64_t a1)
{
  _XPCKeyedDecodingContainer.decode<A>(_:forKey:)(a1, MEMORY[0x263F8D538], (uint64_t)&v3);
  if (!v1) {
    return v3;
  }
  return result;
}

BOOL protocol witness for UnkeyedDecodingContainer.decodeNil() in conformance _XPCUnkeyedDecodingContainer()
{
  return _XPCUnkeyedDecodingContainer.decodeNil()();
}

Swift::Bool __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> _XPCUnkeyedDecodingContainer.decodeNil()()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void **)(v1 + 16);
  uint64_t v3 = v2[4];
  uint64_t v4 = v2[5] >> 1;
  if (__OFSUB__(v4, v3))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v5 = v2[6];
  if (v5 >= v4 - v3) {
    goto LABEL_11;
  }
  uint64_t v6 = v3 + v5;
  if (!__OFADD__(v3, v5))
  {
    if (v6 < v3 || v6 >= v4) {
      goto LABEL_17;
    }
    if (*(unsigned char *)(v2[3] + v6) == 1)
    {
      v2[6] = v5 + 1;
      Swift::Bool result = 1;
      goto LABEL_12;
    }
LABEL_11:
    Swift::Bool result = 0;
LABEL_12:
    uint64_t v9 = *(void *)(v1 + 32);
    BOOL v10 = __OFADD__(v9, 1);
    uint64_t v11 = v9 + 1;
    if (!v10)
    {
      *(void *)(v1 + 32) = v11;
      return result;
    }
    goto LABEL_15;
  }
LABEL_16:
  __break(1u);
LABEL_17:
  __break(1u);
  return result;
}

uint64_t protocol witness for UnkeyedEncodingContainer.encode(_:) in conformance _XPCUnkeyedEncodingContainer(uint64_t a1)
{
  return specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1, (void (*)(void *__return_ptr, uint64_t, uint64_t, uint64_t))specialized static XPCEncoder.encode<A>(_:withCodingMetadata:));
}

{
  return specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1, (void (*)(void *__return_ptr, uint64_t, uint64_t, uint64_t))specialized static XPCEncoder.encode<A>(_:withCodingMetadata:));
}

{
  return specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1, (void (*)(void *__return_ptr, uint64_t, uint64_t, uint64_t))specialized static XPCEncoder.encode<A>(_:withCodingMetadata:));
}

{
  return specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1, (void (*)(void *__return_ptr, uint64_t, uint64_t, uint64_t))specialized static XPCEncoder.encode<A>(_:withCodingMetadata:));
}

{
  return specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1, (void (*)(void *__return_ptr, uint64_t, uint64_t, uint64_t))specialized static XPCEncoder.encode<A>(_:withCodingMetadata:));
}

{
  return specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1, (void (*)(void *__return_ptr, uint64_t, uint64_t, uint64_t))specialized static XPCEncoder.encode<A>(_:withCodingMetadata:));
}

{
  return specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1, (void (*)(void *__return_ptr, uint64_t, uint64_t, uint64_t))specialized static XPCEncoder.encode<A>(_:withCodingMetadata:));
}

{
  return specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1, (void (*)(void *__return_ptr, uint64_t, uint64_t, uint64_t))specialized static XPCEncoder.encode<A>(_:withCodingMetadata:));
}

{
  return specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1, (void (*)(void *__return_ptr, uint64_t, uint64_t, uint64_t))specialized static XPCEncoder.encode<A>(_:withCodingMetadata:));
}

{
  return specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1, (void (*)(void *__return_ptr, uint64_t, uint64_t, uint64_t))specialized static XPCEncoder.encode<A>(_:withCodingMetadata:));
}

uint64_t specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(uint64_t a1, void (*a2)(void *__return_ptr, uint64_t, uint64_t, uint64_t))
{
  void (*v30)(void *__return_ptr, uint64_t, uint64_t, uint64_t);

  uint64_t v30 = a2;
  uint64_t v4 = v2;
  uint64_t v6 = *(void *)(*(void *)(*(void *)(v2 + 32) + 16) + 16);
  v29[0] = 0x207865646E49;
  v29[1] = 0xE600000000000000;
  v26[0] = v6;
  v7._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(v2 + 16);
  uint64_t v9 = *(void *)(v4 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20DA2D050;
  *(void *)(inited + 56) = &type metadata for CodableIndexKey;
  *(void *)(inited + 64) = lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();
  uint64_t v11 = swift_allocObject();
  *(void *)(inited + 32) = v11;
  *(void *)(v11 + 16) = 0x207865646E49;
  *(void *)(v11 + 24) = 0xE600000000000000;
  *(void *)(v11 + 32) = v6;
  *(unsigned char *)(v11 + 40) = 0;
  v29[0] = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)((void *)inited);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v30(v29, a1, v8, v9);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v3)
  {
    uint64_t v13 = *(void *)(v4 + 32);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)v29, (uint64_t)v26);
    uint64_t v14 = (void *)(v13 + 16);
    uint64_t v15 = *(void **)(v13 + 16);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v13 + 16) = v15;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v15 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v15[2] + 1, 1, v15);
      *uint64_t v14 = v15;
    }
    unint64_t v18 = v15[2];
    unint64_t v17 = v15[3];
    if (v18 >= v17 >> 1) {
      *uint64_t v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v17 > 1), v18 + 1, 1, v15);
    }
    uint64_t v19 = v27;
    uint64_t v20 = v28;
    uint64_t v21 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    MEMORY[0x270FA5388](v21);
    uint64_t v23 = (char *)&v26[-1] - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v24 + 16))(v23);
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v18, (uint64_t)v23, (uint64_t *)(v13 + 16), v19, v20);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  }
  return result;
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  Swift::String v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t inited;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  void *v14;
  void *v15;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void v26[3];
  uint64_t v27;
  uint64_t v28;
  void v29[5];
  void (*v30)(void *__return_ptr, uint64_t, uint64_t, uint64_t);

  uint64_t v30 = a2;
  uint64_t v4 = v2;
  uint64_t v6 = *(void *)(*(void *)(*(void *)(v2 + 32) + 16) + 16);
  v29[0] = 0x207865646E49;
  v29[1] = 0xE600000000000000;
  v26[0] = v6;
  v7._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(v2 + 16);
  uint64_t v9 = *(void *)(v4 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20DA2D050;
  *(void *)(inited + 56) = &type metadata for CodableIndexKey;
  *(void *)(inited + 64) = lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();
  uint64_t v11 = swift_allocObject();
  *(void *)(inited + 32) = v11;
  *(void *)(v11 + 16) = 0x207865646E49;
  *(void *)(v11 + 24) = 0xE600000000000000;
  *(void *)(v11 + 32) = v6;
  *(unsigned char *)(v11 + 40) = 0;
  v29[0] = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)((void *)inited);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v30(v29, a1, v8, v9);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v3)
  {
    uint64_t v13 = *(void *)(v4 + 32);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)v29, (uint64_t)v26);
    uint64_t v14 = (void *)(v13 + 16);
    uint64_t v15 = *(void **)(v13 + 16);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v13 + 16) = v15;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v15 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v15[2] + 1, 1, v15);
      *uint64_t v14 = v15;
    }
    unint64_t v18 = v15[2];
    unint64_t v17 = v15[3];
    if (v18 >= v17 >> 1) {
      *uint64_t v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v17 > 1), v18 + 1, 1, v15);
    }
    uint64_t v19 = v27;
    uint64_t v20 = v28;
    uint64_t v21 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    MEMORY[0x270FA5388](v21);
    uint64_t v23 = (char *)&v26[-1] - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v24 + 16))(v23);
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v18, (uint64_t)v23, (uint64_t *)(v13 + 16), v19, v20);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  }
  return result;
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  Swift::String v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t inited;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  void *v14;
  void *v15;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void v26[3];
  uint64_t v27;
  uint64_t v28;
  void v29[5];
  void (*v30)(void *__return_ptr, uint64_t, uint64_t, uint64_t);

  uint64_t v30 = a2;
  uint64_t v4 = v2;
  uint64_t v6 = *(void *)(*(void *)(*(void *)(v2 + 32) + 16) + 16);
  v29[0] = 0x207865646E49;
  v29[1] = 0xE600000000000000;
  v26[0] = v6;
  v7._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(v2 + 16);
  uint64_t v9 = *(void *)(v4 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20DA2D050;
  *(void *)(inited + 56) = &type metadata for CodableIndexKey;
  *(void *)(inited + 64) = lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();
  uint64_t v11 = swift_allocObject();
  *(void *)(inited + 32) = v11;
  *(void *)(v11 + 16) = 0x207865646E49;
  *(void *)(v11 + 24) = 0xE600000000000000;
  *(void *)(v11 + 32) = v6;
  *(unsigned char *)(v11 + 40) = 0;
  v29[0] = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)((void *)inited);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v30(v29, a1, v8, v9);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v3)
  {
    uint64_t v13 = *(void *)(v4 + 32);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)v29, (uint64_t)v26);
    uint64_t v14 = (void *)(v13 + 16);
    uint64_t v15 = *(void **)(v13 + 16);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v13 + 16) = v15;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v15 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v15[2] + 1, 1, v15);
      *uint64_t v14 = v15;
    }
    unint64_t v18 = v15[2];
    unint64_t v17 = v15[3];
    if (v18 >= v17 >> 1) {
      *uint64_t v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v17 > 1), v18 + 1, 1, v15);
    }
    uint64_t v19 = v27;
    uint64_t v20 = v28;
    uint64_t v21 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    MEMORY[0x270FA5388](v21);
    uint64_t v23 = (char *)&v26[-1] - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v24 + 16))(v23);
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v18, (uint64_t)v23, (uint64_t *)(v13 + 16), v19, v20);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  }
  return result;
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  Swift::String v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t inited;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  void *v14;
  void *v15;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void v26[3];
  uint64_t v27;
  uint64_t v28;
  void v29[5];
  void (*v30)(void *__return_ptr, uint64_t, uint64_t, uint64_t);

  uint64_t v30 = a2;
  uint64_t v4 = v2;
  uint64_t v6 = *(void *)(*(void *)(*(void *)(v2 + 32) + 16) + 16);
  v29[0] = 0x207865646E49;
  v29[1] = 0xE600000000000000;
  v26[0] = v6;
  v7._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(v2 + 16);
  uint64_t v9 = *(void *)(v4 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20DA2D050;
  *(void *)(inited + 56) = &type metadata for CodableIndexKey;
  *(void *)(inited + 64) = lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();
  uint64_t v11 = swift_allocObject();
  *(void *)(inited + 32) = v11;
  *(void *)(v11 + 16) = 0x207865646E49;
  *(void *)(v11 + 24) = 0xE600000000000000;
  *(void *)(v11 + 32) = v6;
  *(unsigned char *)(v11 + 40) = 0;
  v29[0] = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)((void *)inited);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v30(v29, a1, v8, v9);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v3)
  {
    uint64_t v13 = *(void *)(v4 + 32);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)v29, (uint64_t)v26);
    uint64_t v14 = (void *)(v13 + 16);
    uint64_t v15 = *(void **)(v13 + 16);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v13 + 16) = v15;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v15 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v15[2] + 1, 1, v15);
      *uint64_t v14 = v15;
    }
    unint64_t v18 = v15[2];
    unint64_t v17 = v15[3];
    if (v18 >= v17 >> 1) {
      *uint64_t v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v17 > 1), v18 + 1, 1, v15);
    }
    uint64_t v19 = v27;
    uint64_t v20 = v28;
    uint64_t v21 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v26, v27);
    MEMORY[0x270FA5388](v21);
    uint64_t v23 = (char *)&v26[-1] - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v24 + 16))(v23);
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v18, (uint64_t)v23, (uint64_t *)(v13 + 16), v19, v20);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  }
  return result;
}

uint64_t specialized static XPCEncoder.encode<A>(_:withCodingMetadata:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v9 = type metadata accessor for _XPCEncoder();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 32) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(void *)(v10 + 64) = 0;
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) == 0)
  {
    uint64_t v23 = v9;
    uint64_t v24 = _s3XPC11_XPCEncoderCACs7EncoderAAWlTm_0(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCEncoder);
    *(void *)&long long v22 = v10;
    swift_retain();
    UInt64.encode(to:)();
    if (v4)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    goto LABEL_9;
  }
  uint64_t v21 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  uint64_t v11 = MEMORY[0x263F8E970];
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v20 = 0;
    memset(v19, 0, sizeof(v19));
    outlined destroy of DecodingContainer?((uint64_t)v19, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    uint64_t v13 = type metadata accessor for EncodingError();
    swift_allocError();
    uint64_t v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    void v15[3] = v11;
    *uint64_t v15 = a1;
    *(void *)&long long v22 = 0;
    *((void *)&v22 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, *MEMORY[0x263F8DCE0], v13);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v19, (uint64_t)&v22);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
  if (!v4)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v10 + 32, (uint64_t)&v22);
    if (v23)
    {
      swift_release();
      return outlined init with take of Encodable(&v22, a4);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v22, &demangling cache variable for type metadata for EncodingContainer?);
    uint64_t v16 = type metadata accessor for EncodingError();
    swift_allocError();
    unint64_t v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    v18[3] = MEMORY[0x263F8E970];
    *unint64_t v18 = a1;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x263F8DCE0], v16);
    goto LABEL_12;
  }
  return swift_release();
}

{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  long long v19[2];
  uint64_t v20;
  uint64_t v21;
  long long v22;
  uint64_t v23;
  uint64_t v24;

  uint64_t v9 = type metadata accessor for _XPCEncoder();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 32) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(void *)(v10 + 64) = 0;
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) == 0)
  {
    uint64_t v23 = v9;
    uint64_t v24 = _s3XPC11_XPCEncoderCACs7EncoderAAWlTm_0(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCEncoder);
    *(void *)&long long v22 = v10;
    swift_retain();
    Int.encode(to:)();
    if (v4)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    goto LABEL_9;
  }
  uint64_t v21 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  uint64_t v11 = MEMORY[0x263F8D6C8];
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v20 = 0;
    memset(v19, 0, sizeof(v19));
    outlined destroy of DecodingContainer?((uint64_t)v19, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    uint64_t v13 = type metadata accessor for EncodingError();
    swift_allocError();
    uint64_t v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    void v15[3] = v11;
    *uint64_t v15 = a1;
    *(void *)&long long v22 = 0;
    *((void *)&v22 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, *MEMORY[0x263F8DCE0], v13);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v19, (uint64_t)&v22);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
  if (!v4)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v10 + 32, (uint64_t)&v22);
    if (v23)
    {
      swift_release();
      return outlined init with take of Encodable(&v22, a4);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v22, &demangling cache variable for type metadata for EncodingContainer?);
    uint64_t v16 = type metadata accessor for EncodingError();
    swift_allocError();
    unint64_t v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    v18[3] = MEMORY[0x263F8D6C8];
    *unint64_t v18 = a1;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x263F8DCE0], v16);
    goto LABEL_12;
  }
  return swift_release();
}

{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  long long v19[2];
  uint64_t v20;
  uint64_t v21;
  long long v22;
  uint64_t v23;
  uint64_t v24;

  uint64_t v9 = type metadata accessor for _XPCEncoder();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 32) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(void *)(v10 + 64) = 0;
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) == 0)
  {
    uint64_t v23 = v9;
    uint64_t v24 = _s3XPC11_XPCEncoderCACs7EncoderAAWlTm_0(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCEncoder);
    *(void *)&long long v22 = v10;
    swift_retain();
    Int64.encode(to:)();
    if (v4)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    goto LABEL_9;
  }
  uint64_t v21 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  uint64_t v11 = MEMORY[0x263F8E5C0];
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v20 = 0;
    memset(v19, 0, sizeof(v19));
    outlined destroy of DecodingContainer?((uint64_t)v19, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    uint64_t v13 = type metadata accessor for EncodingError();
    swift_allocError();
    uint64_t v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    void v15[3] = v11;
    *uint64_t v15 = a1;
    *(void *)&long long v22 = 0;
    *((void *)&v22 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, *MEMORY[0x263F8DCE0], v13);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v19, (uint64_t)&v22);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
  if (!v4)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v10 + 32, (uint64_t)&v22);
    if (v23)
    {
      swift_release();
      return outlined init with take of Encodable(&v22, a4);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v22, &demangling cache variable for type metadata for EncodingContainer?);
    uint64_t v16 = type metadata accessor for EncodingError();
    swift_allocError();
    unint64_t v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    v18[3] = MEMORY[0x263F8E5C0];
    *unint64_t v18 = a1;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x263F8DCE0], v16);
    goto LABEL_12;
  }
  return swift_release();
}

{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  long long v19[2];
  uint64_t v20;
  uint64_t v21;
  long long v22;
  uint64_t v23;
  uint64_t v24;

  uint64_t v9 = type metadata accessor for _XPCEncoder();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 32) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(void *)(v10 + 64) = 0;
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) == 0)
  {
    uint64_t v23 = v9;
    uint64_t v24 = _s3XPC11_XPCEncoderCACs7EncoderAAWlTm_0(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCEncoder);
    *(void *)&long long v22 = v10;
    swift_retain();
    UInt.encode(to:)();
    if (v4)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    goto LABEL_9;
  }
  uint64_t v21 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  uint64_t v11 = MEMORY[0x263F8D9D0];
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v20 = 0;
    memset(v19, 0, sizeof(v19));
    outlined destroy of DecodingContainer?((uint64_t)v19, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    uint64_t v13 = type metadata accessor for EncodingError();
    swift_allocError();
    uint64_t v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    void v15[3] = v11;
    *uint64_t v15 = a1;
    *(void *)&long long v22 = 0;
    *((void *)&v22 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, *MEMORY[0x263F8DCE0], v13);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v19, (uint64_t)&v22);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
  if (!v4)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v10 + 32, (uint64_t)&v22);
    if (v23)
    {
      swift_release();
      return outlined init with take of Encodable(&v22, a4);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v22, &demangling cache variable for type metadata for EncodingContainer?);
    uint64_t v16 = type metadata accessor for EncodingError();
    swift_allocError();
    unint64_t v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    v18[3] = MEMORY[0x263F8D9D0];
    *unint64_t v18 = a1;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x263F8DCE0], v16);
    goto LABEL_12;
  }
  return swift_release();
}

uint64_t protocol witness for UnkeyedEncodingContainer.encode(_:) in conformance _XPCUnkeyedEncodingContainer(char a1)
{
  return specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1);
}

uint64_t specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(char a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *(void *)(*(void *)(*(void *)(v1 + 32) + 16) + 16);
  v28[0] = 0x207865646E49;
  v28[1] = 0xE600000000000000;
  v25[0] = v5;
  v6._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v3 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20DA2D050;
  *(void *)(inited + 56) = &type metadata for CodableIndexKey;
  *(void *)(inited + 64) = lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();
  uint64_t v10 = swift_allocObject();
  *(void *)(inited + 32) = v10;
  *(void *)(v10 + 16) = 0x207865646E49;
  *(void *)(v10 + 24) = 0xE600000000000000;
  *(void *)(v10 + 32) = v5;
  *(unsigned char *)(v10 + 40) = 0;
  v28[0] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)((void *)inited);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  specialized static XPCEncoder.encode<A>(_:withCodingMetadata:)(a1, v7, v8, (uint64_t)v28);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v2)
  {
    uint64_t v12 = *(void *)(v3 + 32);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)v28, (uint64_t)v25);
    uint64_t v13 = (void *)(v12 + 16);
    uint64_t v14 = *(void **)(v12 + 16);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v12 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v14[2] + 1, 1, v14);
      *uint64_t v13 = v14;
    }
    unint64_t v17 = v14[2];
    unint64_t v16 = v14[3];
    if (v17 >= v16 >> 1) {
      *uint64_t v13 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v16 > 1), v17 + 1, 1, v14);
    }
    uint64_t v18 = v26;
    uint64_t v19 = v27;
    uint64_t v20 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v25, v26);
    MEMORY[0x270FA5388](v20);
    long long v22 = (char *)&v25[-1] - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v23 + 16))(v22);
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v17, (uint64_t)v22, (uint64_t *)(v12 + 16), v18, v19);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  }
  return result;
}

uint64_t specialized static XPCEncoder.encode<A>(_:withCodingMetadata:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v9 = type metadata accessor for _XPCEncoder();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 32) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(void *)(v10 + 64) = 0;
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) == 0)
  {
    uint64_t v24 = v9;
    uint64_t v25 = _s3XPC11_XPCEncoderCACs7EncoderAAWlTm_0(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCEncoder);
    *(void *)&long long v23 = v10;
    swift_retain();
    Bool.encode(to:)();
    if (v4)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v23);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v23);
    goto LABEL_9;
  }
  char v11 = a1 & 1;
  char v22 = a1 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  uint64_t v12 = MEMORY[0x263F8D4F8];
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v21 = 0;
    memset(v20, 0, sizeof(v20));
    outlined destroy of DecodingContainer?((uint64_t)v20, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    uint64_t v14 = type metadata accessor for EncodingError();
    swift_allocError();
    uint64_t v16 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(void *)(v16 + 24) = v12;
    *(unsigned char *)uint64_t v16 = v11;
    *(void *)&long long v23 = 0;
    *((void *)&v23 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v14 - 8) + 104))(v16, *MEMORY[0x263F8DCE0], v14);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v20, (uint64_t)&v23);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v23);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v23);
  if (!v4)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v10 + 32, (uint64_t)&v23);
    if (v24)
    {
      swift_release();
      return outlined init with take of Encodable(&v23, a4);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v23, &demangling cache variable for type metadata for EncodingContainer?);
    uint64_t v17 = type metadata accessor for EncodingError();
    swift_allocError();
    uint64_t v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(void *)(v19 + 24) = MEMORY[0x263F8D4F8];
    *(unsigned char *)uint64_t v19 = a1 & 1;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v17 - 8) + 104))(v19, *MEMORY[0x263F8DCE0], v17);
    goto LABEL_12;
  }
  return swift_release();
}

{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  long long v19[2];
  uint64_t v20;
  char v21;
  long long v22;
  uint64_t v23;
  uint64_t v24;

  uint64_t v9 = type metadata accessor for _XPCEncoder();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 32) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(void *)(v10 + 64) = 0;
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) == 0)
  {
    long long v23 = v9;
    uint64_t v24 = _s3XPC11_XPCEncoderCACs7EncoderAAWlTm_0(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCEncoder);
    *(void *)&char v22 = v10;
    swift_retain();
    Int8.encode(to:)();
    if (v4)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    goto LABEL_9;
  }
  uint64_t v21 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  char v11 = MEMORY[0x263F8E498];
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v20 = 0;
    memset(v19, 0, sizeof(v19));
    outlined destroy of DecodingContainer?((uint64_t)v19, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    uint64_t v13 = type metadata accessor for EncodingError();
    swift_allocError();
    uint64_t v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(void *)(v15 + 24) = v11;
    *(unsigned char *)uint64_t v15 = a1;
    *(void *)&char v22 = 0;
    *((void *)&v22 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, *MEMORY[0x263F8DCE0], v13);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v19, (uint64_t)&v22);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
  if (!v4)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v10 + 32, (uint64_t)&v22);
    if (v23)
    {
      swift_release();
      return outlined init with take of Encodable(&v22, a4);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v22, &demangling cache variable for type metadata for EncodingContainer?);
    uint64_t v16 = type metadata accessor for EncodingError();
    swift_allocError();
    uint64_t v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(void *)(v18 + 24) = MEMORY[0x263F8E498];
    *(unsigned char *)uint64_t v18 = a1;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x263F8DCE0], v16);
    goto LABEL_12;
  }
  return swift_release();
}

{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  long long v19[2];
  uint64_t v20;
  char v21;
  long long v22;
  uint64_t v23;
  uint64_t v24;

  uint64_t v9 = type metadata accessor for _XPCEncoder();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 32) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(void *)(v10 + 64) = 0;
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) == 0)
  {
    long long v23 = v9;
    uint64_t v24 = _s3XPC11_XPCEncoderCACs7EncoderAAWlTm_0(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCEncoder);
    *(void *)&char v22 = v10;
    swift_retain();
    UInt8.encode(to:)();
    if (v4)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    goto LABEL_9;
  }
  uint64_t v21 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  char v11 = MEMORY[0x263F8E778];
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v20 = 0;
    memset(v19, 0, sizeof(v19));
    outlined destroy of DecodingContainer?((uint64_t)v19, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    uint64_t v13 = type metadata accessor for EncodingError();
    swift_allocError();
    uint64_t v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(void *)(v15 + 24) = v11;
    *(unsigned char *)uint64_t v15 = a1;
    *(void *)&char v22 = 0;
    *((void *)&v22 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, *MEMORY[0x263F8DCE0], v13);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v19, (uint64_t)&v22);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
  if (!v4)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v10 + 32, (uint64_t)&v22);
    if (v23)
    {
      swift_release();
      return outlined init with take of Encodable(&v22, a4);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v22, &demangling cache variable for type metadata for EncodingContainer?);
    uint64_t v16 = type metadata accessor for EncodingError();
    swift_allocError();
    uint64_t v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(void *)(v18 + 24) = MEMORY[0x263F8E778];
    *(unsigned char *)uint64_t v18 = a1;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x263F8DCE0], v16);
    goto LABEL_12;
  }
  return swift_release();
}

uint64_t protocol witness for UnkeyedEncodingContainer.encode<A>(_:) in conformance _XPCUnkeyedEncodingContainer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1, a2, a3);
}

uint64_t _XPCUnkeyedEncodingContainer.encode<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *(void *)(*(void *)(*(void *)(v3 + 32) + 16) + 16);
  v32[0] = 0x207865646E49;
  v32[1] = 0xE600000000000000;
  uint64_t v28 = a3;
  v29[0] = v7;
  v8._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = *(void *)(v4 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20DA2D050;
  *(void *)(inited + 56) = &type metadata for CodableIndexKey;
  *(void *)(inited + 64) = lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();
  uint64_t v12 = swift_allocObject();
  *(void *)(inited + 32) = v12;
  *(void *)(v12 + 16) = 0x207865646E49;
  *(void *)(v12 + 24) = 0xE600000000000000;
  *(void *)(v12 + 32) = v7;
  *(unsigned char *)(v12 + 40) = 0;
  v32[0] = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)((void *)inited);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  type metadata accessor for XPCEncoder();
  uint64_t v13 = v32[16];
  static XPCEncoder.encode<A>(_:withCodingMetadata:)(a1, v9, v10, a2, v28, (uint64_t)v32);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v13)
  {
    uint64_t v15 = *(void *)(v4 + 32);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)v32, (uint64_t)v29);
    uint64_t v16 = (void *)(v15 + 16);
    uint64_t v17 = *(void **)(v15 + 16);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v15 + 16) = v17;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v17 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v17[2] + 1, 1, v17);
      *uint64_t v16 = v17;
    }
    unint64_t v20 = v17[2];
    unint64_t v19 = v17[3];
    if (v20 >= v19 >> 1) {
      *uint64_t v16 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v19 > 1), v20 + 1, 1, v17);
    }
    uint64_t v21 = v30;
    uint64_t v22 = v31;
    uint64_t v23 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v29, v30);
    MEMORY[0x270FA5388](v23);
    uint64_t v25 = (char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v26 + 16))(v25);
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v20, (uint64_t)v25, (uint64_t *)(v15 + 16), v21, v22);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  }
  return result;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

void *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(void *a1, int64_t a2, char a3, void *a4)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, a4, &demangling cache variable for type metadata for _ContiguousArrayStorage<EncodingContainer>, &demangling cache variable for type metadata for EncodingContainer);
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = a4;
  uint64_t v14 = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(boxed_opaque_existential_1, a2, a4);
  uint64_t v10 = *a3;
  *(void *)(v10 + 16) = a1 + 1;
  return outlined init with take of Encodable(&v12, v10 + 40 * a1 + 32);
}

unint64_t lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey()
{
  unint64_t result = lazy protocol witness table cache variable for type CodableIndexKey and conformance CodableIndexKey;
  if (!lazy protocol witness table cache variable for type CodableIndexKey and conformance CodableIndexKey)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CodableIndexKey and conformance CodableIndexKey);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CodableIndexKey and conformance CodableIndexKey;
  if (!lazy protocol witness table cache variable for type CodableIndexKey and conformance CodableIndexKey)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CodableIndexKey and conformance CodableIndexKey);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CodableIndexKey and conformance CodableIndexKey;
  if (!lazy protocol witness table cache variable for type CodableIndexKey and conformance CodableIndexKey)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CodableIndexKey and conformance CodableIndexKey);
  }
  return result;
}

uint64_t protocol witness for UnkeyedDecodingContainer.decode(_:) in conformance _XPCUnkeyedDecodingContainer()
{
  return specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)((uint64_t (*)(uint64_t))specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:), specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>(), MEMORY[0x263F8E968]);
}

{
  return specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)() & 1;
}

{
  return specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)();
}

{
  return specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)();
}

{
  return specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)();
}

{
  return specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)((uint64_t (*)(uint64_t))specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:), specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>(), MEMORY[0x263F8D6C0]);
}

{
  return specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)((uint64_t (*)(uint64_t))specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:), specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>(), MEMORY[0x263F8E490]);
}

{
  return specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)((uint64_t (*)(uint64_t))specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:), specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>(), MEMORY[0x263F8E4E8]);
}

{
  return specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)((uint64_t (*)(uint64_t))specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:), specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>(), MEMORY[0x263F8E540]);
}

{
  return specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)((uint64_t (*)(uint64_t))specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:), specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>(), MEMORY[0x263F8E5B8]);
}

{
  return UnkeyedDecodingContainer.decode(_:)();
}

{
  return specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)((uint64_t (*)(uint64_t))specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:), specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>(), MEMORY[0x263F8D9C8]);
}

{
  return specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)((uint64_t (*)(uint64_t))specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:), specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>(), MEMORY[0x263F8E770]);
}

{
  return specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)((uint64_t (*)(uint64_t))specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:), specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>(), MEMORY[0x263F8E880]);
}

{
  return specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)((uint64_t (*)(uint64_t))specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:), specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>(), MEMORY[0x263F8E8F0]);
}

{
  return UnkeyedDecodingContainer.decode(_:)();
}

uint64_t specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)(uint64_t (*a1)(uint64_t), uint64_t (*a2)(void), uint64_t (*a3)(void *))
{
  uint64_t v8 = v3[4];
  uint64_t v10 = v3[2];
  uint64_t v9 = v3[3];
  uint64_t v11 = swift_retain();
  long long v12 = specialized static XPCDecoder.decode<A>(from:withCodingMetadata:)(v11, v10, v9, a1, a2, a3);
  uint64_t result = swift_release();
  uint64_t v14 = *(void *)(v8 + 32);
  BOOL v15 = __OFADD__(v14, 1);
  uint64_t v16 = v14 + 1;
  int v17 = v15;
  if (v4)
  {
    if (!v17)
    {
LABEL_8:
      *(void *)(v8 + 32) = v16;
      return (uint64_t)v12;
    }
    __break(1u);
  }
  if ((v17 & 1) == 0) {
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

{
  void *v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *);
  uint64_t result;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  int v17;

  uint64_t v8 = v3[4];
  uint64_t v10 = v3[2];
  uint64_t v9 = v3[3];
  uint64_t v11 = swift_retain();
  long long v12 = specialized static XPCDecoder.decode<A>(from:withCodingMetadata:)(v11, v10, v9, a1, a2, a3);
  uint64_t result = swift_release();
  uint64_t v14 = *(void *)(v8 + 32);
  BOOL v15 = __OFADD__(v14, 1);
  uint64_t v16 = v14 + 1;
  int v17 = v15;
  if (v4)
  {
    if (!v17)
    {
LABEL_8:
      *(void *)(v8 + 32) = v16;
      return (uint64_t)v12;
    }
    __break(1u);
  }
  if ((v17 & 1) == 0) {
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

{
  void *v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *);
  uint64_t result;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  int v17;

  uint64_t v8 = v3[4];
  uint64_t v10 = v3[2];
  uint64_t v9 = v3[3];
  uint64_t v11 = swift_retain();
  long long v12 = specialized static XPCDecoder.decode<A>(from:withCodingMetadata:)(v11, v10, v9, a1, a2, a3);
  uint64_t result = swift_release();
  uint64_t v14 = *(void *)(v8 + 32);
  BOOL v15 = __OFADD__(v14, 1);
  uint64_t v16 = v14 + 1;
  int v17 = v15;
  if (v4)
  {
    if (!v17)
    {
LABEL_8:
      *(void *)(v8 + 32) = v16;
      return (uint64_t)v12;
    }
    __break(1u);
  }
  if ((v17 & 1) == 0) {
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

{
  void *v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *);
  uint64_t result;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  int v17;

  uint64_t v8 = v3[4];
  uint64_t v10 = v3[2];
  uint64_t v9 = v3[3];
  uint64_t v11 = swift_retain();
  long long v12 = specialized static XPCDecoder.decode<A>(from:withCodingMetadata:)(v11, v10, v9, a1, a2, a3);
  uint64_t result = swift_release();
  uint64_t v14 = *(void *)(v8 + 32);
  BOOL v15 = __OFADD__(v14, 1);
  uint64_t v16 = v14 + 1;
  int v17 = v15;
  if (v4)
  {
    if (!v17)
    {
LABEL_8:
      *(void *)(v8 + 32) = v16;
      return (uint64_t)v12;
    }
    __break(1u);
  }
  if ((v17 & 1) == 0) {
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

uint64_t (*specialized static XPCDecoder.decode<A>(from:withCodingMetadata:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t), uint64_t (*a5)(void), uint64_t (*a6)(void *)))(void *)
{
  uint64_t v13 = type metadata accessor for _XPCDecoder();
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 40) = 0u;
  *(_OWORD *)(v14 + 56) = 0u;
  *(void *)(v14 + 72) = 0;
  *(void *)(v14 + 24) = a3;
  *(void *)(v14 + 32) = a1;
  *(void *)(v14 + 16) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v15 = swift_retain();
  if (a4(v15))
  {
    a6 = (uint64_t (*)(void *))a5();
    swift_release();
  }
  else
  {
    v18[3] = v13;
    void v18[4] = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCDecoder);
    v18[0] = v14;
    uint64_t v16 = a6(v18);
    if (!v6) {
      return (uint64_t (*)(void *))v16;
    }
  }
  return a6;
}

{
  uint64_t v6;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void v18[5];

  uint64_t v13 = type metadata accessor for _XPCDecoder();
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 40) = 0u;
  *(_OWORD *)(v14 + 56) = 0u;
  *(void *)(v14 + 72) = 0;
  *(void *)(v14 + 24) = a3;
  *(void *)(v14 + 32) = a1;
  *(void *)(v14 + 16) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v15 = swift_retain();
  if (a4(v15))
  {
    a6 = (uint64_t (*)(void *))a5();
    swift_release();
  }
  else
  {
    v18[3] = v13;
    void v18[4] = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCDecoder);
    v18[0] = v14;
    uint64_t v16 = a6(v18);
    if (!v6) {
      return (uint64_t (*)(void *))v16;
    }
  }
  return a6;
}

{
  uint64_t v6;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void v18[5];

  uint64_t v13 = type metadata accessor for _XPCDecoder();
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 40) = 0u;
  *(_OWORD *)(v14 + 56) = 0u;
  *(void *)(v14 + 72) = 0;
  *(void *)(v14 + 24) = a3;
  *(void *)(v14 + 32) = a1;
  *(void *)(v14 + 16) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v15 = swift_retain();
  if (a4(v15))
  {
    a6 = (uint64_t (*)(void *))a5();
    swift_release();
  }
  else
  {
    v18[3] = v13;
    void v18[4] = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCDecoder);
    v18[0] = v14;
    uint64_t v16 = a6(v18);
    if (!v6) {
      return (uint64_t (*)(void *))v16;
    }
  }
  return a6;
}

{
  uint64_t v6;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void v18[5];

  uint64_t v13 = type metadata accessor for _XPCDecoder();
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 40) = 0u;
  *(_OWORD *)(v14 + 56) = 0u;
  *(void *)(v14 + 72) = 0;
  *(void *)(v14 + 24) = a3;
  *(void *)(v14 + 32) = a1;
  *(void *)(v14 + 16) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v15 = swift_retain();
  if (a4(v15))
  {
    a6 = (uint64_t (*)(void *))a5();
    swift_release();
  }
  else
  {
    v18[3] = v13;
    void v18[4] = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCDecoder);
    v18[0] = v14;
    uint64_t v16 = a6(v18);
    if (!v6) {
      return (uint64_t (*)(void *))v16;
    }
  }
  return a6;
}

uint64_t specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)()
{
  if (one-time initialization token for global != -1) {
    swift_once();
  }
  if (one-time initialization token for global != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = MEMORY[0x263F8E970];
  char v1 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(MEMORY[0x263F8E970], (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v1 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2()) {
      uint64_t v2 = v0;
    }
    else {
      uint64_t v2 = 0;
    }
    uint64_t v3 = v2 != 0;
    swift_beginAccess();
    uint64_t v4 = static XPCCodableObjectRepresentableCache._Cache.global;
    uint64_t v5 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = v4[2];
    void v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v3, v0, isUniquelyReferenced_nonNull_native);
    void v4[2] = v8;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
  }
  else
  {
    uint64_t v3 = v1 & 1;
  }
  swift_endAccess();
  return v3;
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  os_unfair_lock_s *v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  if (one-time initialization token for global != -1) {
    swift_once();
  }
  if (one-time initialization token for global != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = MEMORY[0x263F8D4F8];
  char v1 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(MEMORY[0x263F8D4F8], (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v1 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2()) {
      uint64_t v2 = v0;
    }
    else {
      uint64_t v2 = 0;
    }
    uint64_t v3 = v2 != 0;
    swift_beginAccess();
    uint64_t v4 = static XPCCodableObjectRepresentableCache._Cache.global;
    uint64_t v5 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = v4[2];
    void v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v3, v0, isUniquelyReferenced_nonNull_native);
    void v4[2] = v8;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
  }
  else
  {
    uint64_t v3 = v1 & 1;
  }
  swift_endAccess();
  return v3;
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  os_unfair_lock_s *v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  if (one-time initialization token for global != -1) {
    swift_once();
  }
  if (one-time initialization token for global != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = MEMORY[0x263F8D310];
  char v1 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(MEMORY[0x263F8D310], (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v1 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2()) {
      uint64_t v2 = v0;
    }
    else {
      uint64_t v2 = 0;
    }
    uint64_t v3 = v2 != 0;
    swift_beginAccess();
    uint64_t v4 = static XPCCodableObjectRepresentableCache._Cache.global;
    uint64_t v5 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = v4[2];
    void v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v3, v0, isUniquelyReferenced_nonNull_native);
    void v4[2] = v8;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
  }
  else
  {
    uint64_t v3 = v1 & 1;
  }
  swift_endAccess();
  return v3;
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  os_unfair_lock_s *v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  if (one-time initialization token for global != -1) {
    swift_once();
  }
  if (one-time initialization token for global != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = MEMORY[0x263F8D538];
  char v1 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(MEMORY[0x263F8D538], (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v1 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2()) {
      uint64_t v2 = v0;
    }
    else {
      uint64_t v2 = 0;
    }
    uint64_t v3 = v2 != 0;
    swift_beginAccess();
    uint64_t v4 = static XPCCodableObjectRepresentableCache._Cache.global;
    uint64_t v5 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = v4[2];
    void v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v3, v0, isUniquelyReferenced_nonNull_native);
    void v4[2] = v8;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
  }
  else
  {
    uint64_t v3 = v1 & 1;
  }
  swift_endAccess();
  return v3;
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  os_unfair_lock_s *v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  if (one-time initialization token for global != -1) {
    swift_once();
  }
  if (one-time initialization token for global != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = MEMORY[0x263F8D5C8];
  char v1 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(MEMORY[0x263F8D5C8], (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v1 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2()) {
      uint64_t v2 = v0;
    }
    else {
      uint64_t v2 = 0;
    }
    uint64_t v3 = v2 != 0;
    swift_beginAccess();
    uint64_t v4 = static XPCCodableObjectRepresentableCache._Cache.global;
    uint64_t v5 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = v4[2];
    void v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v3, v0, isUniquelyReferenced_nonNull_native);
    void v4[2] = v8;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
  }
  else
  {
    uint64_t v3 = v1 & 1;
  }
  swift_endAccess();
  return v3;
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  os_unfair_lock_s *v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  if (one-time initialization token for global != -1) {
    swift_once();
  }
  if (one-time initialization token for global != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = MEMORY[0x263F8D6C8];
  char v1 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(MEMORY[0x263F8D6C8], (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v1 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2()) {
      uint64_t v2 = v0;
    }
    else {
      uint64_t v2 = 0;
    }
    uint64_t v3 = v2 != 0;
    swift_beginAccess();
    uint64_t v4 = static XPCCodableObjectRepresentableCache._Cache.global;
    uint64_t v5 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = v4[2];
    void v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v3, v0, isUniquelyReferenced_nonNull_native);
    void v4[2] = v8;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
  }
  else
  {
    uint64_t v3 = v1 & 1;
  }
  swift_endAccess();
  return v3;
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  os_unfair_lock_s *v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  if (one-time initialization token for global != -1) {
    swift_once();
  }
  if (one-time initialization token for global != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = MEMORY[0x263F8E498];
  char v1 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(MEMORY[0x263F8E498], (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v1 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2()) {
      uint64_t v2 = v0;
    }
    else {
      uint64_t v2 = 0;
    }
    uint64_t v3 = v2 != 0;
    swift_beginAccess();
    uint64_t v4 = static XPCCodableObjectRepresentableCache._Cache.global;
    uint64_t v5 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = v4[2];
    void v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v3, v0, isUniquelyReferenced_nonNull_native);
    void v4[2] = v8;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
  }
  else
  {
    uint64_t v3 = v1 & 1;
  }
  swift_endAccess();
  return v3;
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  os_unfair_lock_s *v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  if (one-time initialization token for global != -1) {
    swift_once();
  }
  if (one-time initialization token for global != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = MEMORY[0x263F8E4F0];
  char v1 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(MEMORY[0x263F8E4F0], (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v1 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2()) {
      uint64_t v2 = v0;
    }
    else {
      uint64_t v2 = 0;
    }
    uint64_t v3 = v2 != 0;
    swift_beginAccess();
    uint64_t v4 = static XPCCodableObjectRepresentableCache._Cache.global;
    uint64_t v5 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = v4[2];
    void v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v3, v0, isUniquelyReferenced_nonNull_native);
    void v4[2] = v8;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
  }
  else
  {
    uint64_t v3 = v1 & 1;
  }
  swift_endAccess();
  return v3;
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  os_unfair_lock_s *v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  if (one-time initialization token for global != -1) {
    swift_once();
  }
  if (one-time initialization token for global != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = MEMORY[0x263F8E548];
  char v1 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(MEMORY[0x263F8E548], (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v1 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2()) {
      uint64_t v2 = v0;
    }
    else {
      uint64_t v2 = 0;
    }
    uint64_t v3 = v2 != 0;
    swift_beginAccess();
    uint64_t v4 = static XPCCodableObjectRepresentableCache._Cache.global;
    uint64_t v5 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = v4[2];
    void v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v3, v0, isUniquelyReferenced_nonNull_native);
    void v4[2] = v8;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
  }
  else
  {
    uint64_t v3 = v1 & 1;
  }
  swift_endAccess();
  return v3;
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  os_unfair_lock_s *v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  if (one-time initialization token for global != -1) {
    swift_once();
  }
  if (one-time initialization token for global != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = MEMORY[0x263F8E5C0];
  char v1 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(MEMORY[0x263F8E5C0], (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v1 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2()) {
      uint64_t v2 = v0;
    }
    else {
      uint64_t v2 = 0;
    }
    uint64_t v3 = v2 != 0;
    swift_beginAccess();
    uint64_t v4 = static XPCCodableObjectRepresentableCache._Cache.global;
    uint64_t v5 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = v4[2];
    void v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v3, v0, isUniquelyReferenced_nonNull_native);
    void v4[2] = v8;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
  }
  else
  {
    uint64_t v3 = v1 & 1;
  }
  swift_endAccess();
  return v3;
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  os_unfair_lock_s *v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  if (one-time initialization token for global != -1) {
    swift_once();
  }
  if (one-time initialization token for global != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = MEMORY[0x263F8D9D0];
  char v1 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(MEMORY[0x263F8D9D0], (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v1 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2()) {
      uint64_t v2 = v0;
    }
    else {
      uint64_t v2 = 0;
    }
    uint64_t v3 = v2 != 0;
    swift_beginAccess();
    uint64_t v4 = static XPCCodableObjectRepresentableCache._Cache.global;
    uint64_t v5 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = v4[2];
    void v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v3, v0, isUniquelyReferenced_nonNull_native);
    void v4[2] = v8;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
  }
  else
  {
    uint64_t v3 = v1 & 1;
  }
  swift_endAccess();
  return v3;
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  os_unfair_lock_s *v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  if (one-time initialization token for global != -1) {
    swift_once();
  }
  if (one-time initialization token for global != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = MEMORY[0x263F8E778];
  char v1 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(MEMORY[0x263F8E778], (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v1 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2()) {
      uint64_t v2 = v0;
    }
    else {
      uint64_t v2 = 0;
    }
    uint64_t v3 = v2 != 0;
    swift_beginAccess();
    uint64_t v4 = static XPCCodableObjectRepresentableCache._Cache.global;
    uint64_t v5 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = v4[2];
    void v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v3, v0, isUniquelyReferenced_nonNull_native);
    void v4[2] = v8;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
  }
  else
  {
    uint64_t v3 = v1 & 1;
  }
  swift_endAccess();
  return v3;
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  os_unfair_lock_s *v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  if (one-time initialization token for global != -1) {
    swift_once();
  }
  if (one-time initialization token for global != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = MEMORY[0x263F8E888];
  char v1 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(MEMORY[0x263F8E888], (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v1 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2()) {
      uint64_t v2 = v0;
    }
    else {
      uint64_t v2 = 0;
    }
    uint64_t v3 = v2 != 0;
    swift_beginAccess();
    uint64_t v4 = static XPCCodableObjectRepresentableCache._Cache.global;
    uint64_t v5 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = v4[2];
    void v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v3, v0, isUniquelyReferenced_nonNull_native);
    void v4[2] = v8;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
  }
  else
  {
    uint64_t v3 = v1 & 1;
  }
  swift_endAccess();
  return v3;
}

{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  os_unfair_lock_s *v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  if (one-time initialization token for global != -1) {
    swift_once();
  }
  if (one-time initialization token for global != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = MEMORY[0x263F8E8F8];
  char v1 = XPCCodableObjectRepresentableCache._Cache.subscript.getter(MEMORY[0x263F8E8F8], (uint64_t)static XPCCodableObjectRepresentableCache._Cache.global);
  if (v1 == 2)
  {
    swift_endAccess();
    if (swift_conformsToProtocol2()) {
      uint64_t v2 = v0;
    }
    else {
      uint64_t v2 = 0;
    }
    uint64_t v3 = v2 != 0;
    swift_beginAccess();
    uint64_t v4 = static XPCCodableObjectRepresentableCache._Cache.global;
    uint64_t v5 = (os_unfair_lock_s *)((char *)static XPCCodableObjectRepresentableCache._Cache.global + 24);
    os_unfair_lock_lock((os_unfair_lock_t)static XPCCodableObjectRepresentableCache._Cache.global + 6);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = v4[2];
    void v4[2] = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v3, v0, isUniquelyReferenced_nonNull_native);
    void v4[2] = v8;
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
  }
  else
  {
    uint64_t v3 = v1 & 1;
  }
  swift_endAccess();
  return v3;
}

uint64_t specialized _XPCUnkeyedDecodingContainer.decode<A>(_:)()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = swift_retain();
  char v6 = specialized static XPCDecoder.decode<A>(from:withCodingMetadata:)(v5, v3, v4);
  uint64_t result = swift_release();
  uint64_t v8 = *(void *)(v2 + 32);
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  int v11 = v9;
  if (v1)
  {
    if (!v11)
    {
LABEL_8:
      *(void *)(v2 + 32) = v10;
      return v6 & 1;
    }
    __break(1u);
  }
  if ((v11 & 1) == 0) {
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  int v11;

  uint64_t v2 = v0[4];
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = swift_retain();
  char v6 = specialized static XPCDecoder.decode<A>(from:withCodingMetadata:)(v5, v3, v4);
  uint64_t result = swift_release();
  uint64_t v8 = *(void *)(v2 + 32);
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  int v11 = v9;
  if (v1)
  {
    if (!v11)
    {
LABEL_8:
      *(void *)(v2 + 32) = v10;
      return v6;
    }
    __break(1u);
  }
  if ((v11 & 1) == 0) {
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  int v10;

  uint64_t v2 = v0[4];
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = swift_retain();
  specialized static XPCDecoder.decode<A>(from:withCodingMetadata:)(v5, v3, v4);
  uint64_t result = swift_release();
  uint64_t v7 = *(void *)(v2 + 32);
  uint64_t v8 = __OFADD__(v7, 1);
  BOOL v9 = v7 + 1;
  uint64_t v10 = v8;
  if (v1)
  {
    if (!v10)
    {
LABEL_8:
      *(void *)(v2 + 32) = v9;
      return result;
    }
    __break(1u);
  }
  if ((v10 & 1) == 0) {
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  int v10;

  uint64_t v2 = v0[4];
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = swift_retain();
  specialized static XPCDecoder.decode<A>(from:withCodingMetadata:)(v5, v3, v4);
  uint64_t result = swift_release();
  uint64_t v7 = *(void *)(v2 + 32);
  uint64_t v8 = __OFADD__(v7, 1);
  BOOL v9 = v7 + 1;
  uint64_t v10 = v8;
  if (v1)
  {
    if (!v10)
    {
LABEL_8:
      *(void *)(v2 + 32) = v9;
      return result;
    }
    __break(1u);
  }
  if ((v10 & 1) == 0) {
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

uint64_t specialized static XPCDecoder.decode<A>(from:withCodingMetadata:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v7 = type metadata accessor for _XPCDecoder();
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 40) = 0u;
  *(_OWORD *)(v8 + 56) = 0u;
  *(void *)(v8 + 72) = 0;
  *(void *)(v8 + 24) = a3;
  *(void *)(v8 + 32) = a1;
  *(void *)(v8 + 16) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  if (specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)())
  {
    char v7 = specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>()();
    swift_release();
  }
  else
  {
    lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCDecoder);
    char v9 = Bool.init(from:)();
    if (!v3) {
      char v7 = v9;
    }
  }
  return v7 & 1;
}

{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  char v7 = type metadata accessor for _XPCDecoder();
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 40) = 0u;
  *(_OWORD *)(v8 + 56) = 0u;
  *(void *)(v8 + 72) = 0;
  *(void *)(v8 + 24) = a3;
  *(void *)(v8 + 32) = a1;
  *(void *)(v8 + 16) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  if (specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)())
  {
    char v7 = specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>()();
    swift_release();
  }
  else
  {
    lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCDecoder);
    char v9 = String.init(from:)();
    if (!v3) {
      return v9;
    }
  }
  return v7;
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int32@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _DWORD *a4@<X8>)
{
  return protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int32(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))specialized static DecodingContainer.decodeType(from:withCodingMetadata:), (uint64_t (*)(uint64_t, uint64_t))specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:), a4);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int32@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t, uint64_t, uint64_t)@<X5>, uint64_t (*a5)(uint64_t, uint64_t)@<X6>, _DWORD *a6@<X8>)
{
  a4(a3, a1, a2);
  if (v6)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  else
  {
    int v12 = a5(a3, a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_release();
    *a6 = v12;
  }
  return result;
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Bool@<X0>(void *a1@<X2>, unsigned char *a2@<X8>)
{
  specialized static DecodingContainer.decodeType(from:withCodingMetadata:)(a1);
  if (v2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  else
  {
    unsigned __int8 v6 = specialized static Bool.decodeValue(from:withCodingMetadata:)(a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_release();
    *a2 = v6 & 1;
  }
  return result;
}

void *specialized static Bool.decodeValue(from:withCodingMetadata:)(void *result)
{
  uint64_t v1 = result[4];
  uint64_t v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = result[6];
    if (v3 >= v2 - v1) {
      goto LABEL_10;
    }
    uint64_t v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2) {
        goto LABEL_14;
      }
      uint64_t v6 = v3 + 1;
      unsigned int v7 = *(unsigned __int8 *)(result[3] + v4);
      result[6] = v6;
      if (v7 < 2) {
        return (void *)(v7 & 1);
      }
LABEL_10:
      uint64_t v8 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v10 = v9;
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v8 - 8) + 104))(v10, *MEMORY[0x263F8DCB8], v8);
      swift_willThrow();
      return (void *)(v7 & 1);
    }
  }
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

uint64_t protocol witness for SingleValueDecodingContainer.decode<A>(_:) in conformance _XPCSingleValueDecodingContainer@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return _XPCSingleValueDecodingContainer.decode<A>(_:)(a1, a2, a3);
}

uint64_t _XPCSingleValueDecodingContainer.decode<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v44 = a3;
  uint64_t v6 = type metadata accessor for Optional();
  uint64_t v41 = *(void *)(v6 - 8);
  uint64_t v42 = v6;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  int v12 = (char *)&v40 - v11;
  uint64_t v43 = *(void *)(a2 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  int v17 = (char *)&v40 - v16;
  uint64_t v18 = swift_conformsToProtocol2();
  if (v18) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = 0;
  }
  if (v18) {
    uint64_t v20 = a1;
  }
  else {
    uint64_t v20 = 0;
  }
  if (v20)
  {
    char v40 = v12;
    uint64_t v22 = v3[3];
    uint64_t v21 = v3[4];
    uint64_t v23 = v3[2];
    uint64_t v24 = *(void *)(v19 + 8);
    uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 16);
    uint64_t v47 = v20;
    uint64_t v48 = v19;
    __swift_allocate_boxed_opaque_existential_1(&v45);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v26 = v49;
    v25(v22, v21, v23, v20, v24);
    if (v26)
    {
      return __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v45);
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
      BOOL v33 = v40;
      int v34 = swift_dynamicCast();
      uint64_t v35 = v43;
      uint64_t v36 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v43 + 56);
      if (!v34)
      {
        v36(v33, 1, 1, a2);
        (*(void (**)(char *, uint64_t))(v41 + 8))(v33, v42);
        uint64_t v45 = 0;
        uint64_t v46 = 0xE000000000000000;
        _StringGuts.grow(_:)(24);
        swift_bridgeObjectRelease();
        uint64_t v45 = 0xD000000000000016;
        uint64_t v46 = 0x800000020DA326D0;
        v39._countAndFlagsBits = _typeName(_:qualified:)();
        String.append(_:)(v39);
        swift_bridgeObjectRelease();
        __XPC_INTERNAL_CRASH__(_:file:line:)(v45, v46);
      }
      v36(v33, 0, 1, a2);
      uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
      v37(v17, v33, a2);
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v37)(v44, v17, a2);
    }
  }
  else
  {
    uint64_t v29 = v3[3];
    uint64_t v28 = v3[4];
    uint64_t v30 = v3[2];
    uint64_t v31 = v49;
    uint64_t result = static OptionalPrimitive.unwrapNestedOptional<A>(_:codingMetadata:buffer:)(a1, v29, v28, v30, a2, (uint64_t)v9);
    if (!v31)
    {
      uint64_t v32 = v43;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48))(v9, 1, a2) == 1)
      {
        (*(void (**)(char *, uint64_t))(v41 + 8))(v9, v42);
        type metadata accessor for XPCDecoder();
        return static XPCDecoder.decode<A>(from:withCodingMetadata:)(v30, v29, v28, a2, v44);
      }
      else
      {
        uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v32 + 32);
        v38(v15, v9, a2);
        return ((uint64_t (*)(uint64_t, char *, uint64_t))v38)(v44, v15, a2);
      }
    }
  }
  return result;
}

uint64_t static OptionalPrimitive.unwrapNestedOptional<A>(_:codingMetadata:buffer:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  if (swift_conformsToProtocol2()) {
    uint64_t v13 = a1;
  }
  else {
    uint64_t v13 = 0;
  }
  if (v13)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v14 = (void *)swift_retain();
    specialized static DecodingContainer.decodeType(from:withCodingMetadata:)(v14);
    if (!v6)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      type metadata accessor for _XPCDecoder();
      uint64_t v17 = swift_allocObject();
      *(_OWORD *)(v17 + 40) = 0u;
      *(_OWORD *)(v17 + 56) = 0u;
      *(void *)(v17 + 72) = 0;
      *(void *)(v17 + 24) = a3;
      *(void *)(v17 + 32) = a4;
      *(void *)(v17 + 16) = a2;
      lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      dispatch thunk of Decodable.init(from:)();
      uint64_t v15 = 0;
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 - 8) + 56))(a6, v15, 1, a5);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
  }
  uint64_t v15 = 1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a5 - 8) + 56))(a6, v15, 1, a5);
}

unint64_t instantiation function for generic protocol witness table for Int(uint64_t a1)
{
  unint64_t result = lazy protocol witness table accessor for type Int and conformance Int();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  unint64_t result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }
  return result;
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance Int()
{
  return 1;
}

unint64_t instantiation function for generic protocol witness table for Int8(uint64_t a1)
{
  unint64_t result = lazy protocol witness table accessor for type Int8 and conformance Int8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type Int8 and conformance Int8()
{
  unint64_t result = lazy protocol witness table cache variable for type Int8 and conformance Int8;
  if (!lazy protocol witness table cache variable for type Int8 and conformance Int8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int8 and conformance Int8);
  }
  return result;
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance Int8()
{
  return 2;
}

unint64_t instantiation function for generic protocol witness table for Int16(uint64_t a1)
{
  unint64_t result = lazy protocol witness table accessor for type Int16 and conformance Int16();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type Int16 and conformance Int16()
{
  unint64_t result = lazy protocol witness table cache variable for type Int16 and conformance Int16;
  if (!lazy protocol witness table cache variable for type Int16 and conformance Int16)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int16 and conformance Int16);
  }
  return result;
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance Int16()
{
  return 3;
}

unint64_t instantiation function for generic protocol witness table for Int32(uint64_t a1)
{
  unint64_t result = lazy protocol witness table accessor for type Int32 and conformance Int32();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type Int32 and conformance Int32()
{
  unint64_t result = lazy protocol witness table cache variable for type Int32 and conformance Int32;
  if (!lazy protocol witness table cache variable for type Int32 and conformance Int32)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int32 and conformance Int32);
  }
  return result;
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance Int32()
{
  return 4;
}

unint64_t instantiation function for generic protocol witness table for Int64(uint64_t a1)
{
  unint64_t result = lazy protocol witness table accessor for type Int64 and conformance Int64();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance Int64()
{
  return 5;
}

unint64_t instantiation function for generic protocol witness table for UInt(uint64_t a1)
{
  unint64_t result = lazy protocol witness table accessor for type UInt and conformance UInt();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type UInt and conformance UInt()
{
  unint64_t result = lazy protocol witness table cache variable for type UInt and conformance UInt;
  if (!lazy protocol witness table cache variable for type UInt and conformance UInt)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt and conformance UInt);
  }
  return result;
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance UInt()
{
  return 6;
}

unint64_t instantiation function for generic protocol witness table for UInt8(uint64_t a1)
{
  unint64_t result = lazy protocol witness table accessor for type UInt8 and conformance UInt8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type UInt8 and conformance UInt8()
{
  unint64_t result = lazy protocol witness table cache variable for type UInt8 and conformance UInt8;
  if (!lazy protocol witness table cache variable for type UInt8 and conformance UInt8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt8 and conformance UInt8);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UInt8 and conformance UInt8;
  if (!lazy protocol witness table cache variable for type UInt8 and conformance UInt8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt8 and conformance UInt8);
  }
  return result;
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance UInt8()
{
  return 7;
}

unint64_t instantiation function for generic protocol witness table for UInt16(uint64_t a1)
{
  unint64_t result = lazy protocol witness table accessor for type UInt16 and conformance UInt16();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type UInt16 and conformance UInt16()
{
  unint64_t result = lazy protocol witness table cache variable for type UInt16 and conformance UInt16;
  if (!lazy protocol witness table cache variable for type UInt16 and conformance UInt16)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt16 and conformance UInt16);
  }
  return result;
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance UInt16()
{
  return 8;
}

unint64_t instantiation function for generic protocol witness table for UInt32(uint64_t a1)
{
  unint64_t result = lazy protocol witness table accessor for type UInt32 and conformance UInt32();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type UInt32 and conformance UInt32()
{
  unint64_t result = lazy protocol witness table cache variable for type UInt32 and conformance UInt32;
  if (!lazy protocol witness table cache variable for type UInt32 and conformance UInt32)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt32 and conformance UInt32);
  }
  return result;
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance UInt32()
{
  return 9;
}

unint64_t instantiation function for generic protocol witness table for UInt64(uint64_t a1)
{
  unint64_t result = lazy protocol witness table accessor for type UInt64 and conformance UInt64();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type UInt64 and conformance UInt64()
{
  unint64_t result = lazy protocol witness table cache variable for type UInt64 and conformance UInt64;
  if (!lazy protocol witness table cache variable for type UInt64 and conformance UInt64)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt64 and conformance UInt64);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UInt64 and conformance UInt64;
  if (!lazy protocol witness table cache variable for type UInt64 and conformance UInt64)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt64 and conformance UInt64);
  }
  return result;
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance UInt64()
{
  return 10;
}

void type metadata accessor for xpc_session_create_flags_t(uint64_t a1)
{
}

void *specialized static Int8.decodeValue(from:withCodingMetadata:)(void *result)
{
  uint64_t v1 = result[4];
  uint64_t v2 = result[5] >> 1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = result[6];
    if (v3 >= v2 - v1)
    {
      uint64_t v8 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v10 = v9;
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      swift_bridgeObjectRelease();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v8 - 8) + 104))(v10, *MEMORY[0x263F8DCB8], v8);
      swift_willThrow();
      return (void *)v7;
    }
    uint64_t v4 = v1 + v3;
    if (!__OFADD__(v1, v3))
    {
      if (v4 < v1 || v4 >= v2) {
        goto LABEL_14;
      }
      uint64_t v6 = v3 + 1;
      uint64_t v7 = *(unsigned __int8 *)(result[3] + v4);
      result[6] = v6;
      return (void *)v7;
    }
  }
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

uint64_t XPCSession.InitializationOptions.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t XPCSession.InitializationOptions.init(rawValue:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t static XPCSession.InitializationOptions.none.setter(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t result = swift_beginAccess();
  static XPCSession.InitializationOptions.none = v1;
  return result;
}

uint64_t (*static XPCSession.InitializationOptions.none.modify())()
{
  return static XPCSession.InitializationOptions.inactive.modify;
}

uint64_t static XPCSession.InitializationOptions.inactive.getter@<X0>(void *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = static XPCSession.InitializationOptions.inactive;
  return result;
}

uint64_t static XPCSession.InitializationOptions.inactive.setter(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t result = swift_beginAccess();
  static XPCSession.InitializationOptions.inactive = v1;
  return result;
}

uint64_t (*static XPCSession.InitializationOptions.inactive.modify())()
{
  return static XPCSession.InitializationOptions.inactive.modify;
}

uint64_t static XPCSession.InitializationOptions.privileged.getter@<X0>(void *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = static XPCSession.InitializationOptions.privileged;
  return result;
}

uint64_t static XPCSession.InitializationOptions.privileged.setter(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t result = swift_beginAccess();
  static XPCSession.InitializationOptions.privileged = v1;
  return result;
}

uint64_t (*static XPCSession.InitializationOptions.privileged.modify())()
{
  return static XPCSession.InitializationOptions.privileged.modify;
}

void *protocol witness for OptionSet.init(rawValue:) in conformance XPCSession.InitializationOptions@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void protocol witness for SetAlgebra.init() in conformance XPCSession.InitializationOptions(void *a1@<X8>)
{
  *a1 = 0;
}

void *protocol witness for SetAlgebra.union(_:) in conformance XPCSession.InitializationOptions@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *protocol witness for SetAlgebra.intersection(_:) in conformance XPCSession.InitializationOptions@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *protocol witness for SetAlgebra.symmetricDifference(_:) in conformance XPCSession.InitializationOptions@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL protocol witness for SetAlgebra.insert(_:) in conformance XPCSession.InitializationOptions(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *protocol witness for SetAlgebra.remove(_:) in conformance XPCSession.InitializationOptions@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *protocol witness for SetAlgebra.update(with:) in conformance XPCSession.InitializationOptions@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *protocol witness for SetAlgebra.formUnion(_:) in conformance XPCSession.InitializationOptions(void *result)
{
  *v1 |= *result;
  return result;
}

void *protocol witness for SetAlgebra.formIntersection(_:) in conformance XPCSession.InitializationOptions(void *result)
{
  *v1 &= *result;
  return result;
}

void *protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance XPCSession.InitializationOptions(void *result)
{
  *v1 ^= *result;
  return result;
}

void *protocol witness for SetAlgebra.subtracting(_:) in conformance XPCSession.InitializationOptions@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL protocol witness for SetAlgebra.isSubset(of:) in conformance XPCSession.InitializationOptions(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL protocol witness for SetAlgebra.isDisjoint(with:) in conformance XPCSession.InitializationOptions(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL protocol witness for SetAlgebra.isSuperset(of:) in conformance XPCSession.InitializationOptions(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL protocol witness for SetAlgebra.isEmpty.getter in conformance XPCSession.InitializationOptions()
{
  return *v0 == 0;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance XPCSession.InitializationOptions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

void *protocol witness for SetAlgebra.subtract(_:) in conformance XPCSession.InitializationOptions(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *protocol witness for RawRepresentable.init(rawValue:) in conformance XPCSession.InitializationOptions@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance XPCSession.InitializationOptions(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance XPCSession.InitializationOptions(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t specialized XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:)(void *a1, _xpc_rich_error_s *a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6)
{
  if (!a1)
  {
    if (a2)
    {
      lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError();
      swift_allocError();
      uint64_t v23 = v22;
      if (MEMORY[0x2105634B0](a2) == MEMORY[0x263EF8770])
      {
        uint64_t v34 = a6;
        uint64_t v24 = xpc_rich_error_copy_description(a2);
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = String.init(cString:)();
          uint64_t v28 = v27;
          BOOL can_retry = xpc_rich_error_can_retry(a2);
          free(v25);
          *(unsigned char *)uint64_t v23 = can_retry;
          *(void *)(v23 + 8) = v26;
          *(void *)(v23 + 16) = v28;
          swift_willThrow();
          outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
          swift_unknownObjectRelease();
          type metadata accessor for XPCSession();
          uint64_t v18 = v34;
          swift_deallocPartialClassInstance();
          return v18;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
    }
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD00000000000001BLL, 0x800000020DA31030);
  }
  uint64_t v11 = *a5;
  *(void *)(a6 + 16) = a1;
  if (a3)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = a3;
    *(void *)(v12 + 24) = a4;
    uint64_t v34 = v11;
    id v13 = a1;
    outlined copy of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
    id v14 = v13;
    outlined copy of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
    uint64_t v15 = ClientSpecifiedHandler.init(_:)((uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Result<XPCReceivedMessage, XPCRichError>) -> ());
    uint64_t v17 = v16;
    uint64_t v18 = a6;
    uint64_t v19 = *(void **)(a6 + 16);
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v15;
    *(void *)(v20 + 24) = v17;
    v33[4] = closure #1 in XPCSession.setCancellationHandler(_:)partial apply;
    v33[5] = v20;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 1107296256;
    v33[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object) -> ();
    v33[3] = &block_descriptor_159;
    uint64_t v21 = _Block_copy(v33);
    swift_retain();
    swift_release();
    _swift_xpc_session_set_cancel_handler(v19, v21);
    _Block_release(v21);
    uint64_t v11 = v34;
    swift_release();
    outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
  }
  else
  {
    uint64_t v18 = a6;
    id v30 = a1;
  }
  swift_beginAccess();
  if ((static XPCSession.InitializationOptions.inactive & ~v11) != 0)
  {
    XPCSession.activate()();
    if (v31) {
      swift_release();
    }
  }
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);

  swift_unknownObjectRelease();
  return v18;
}

{
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL can_retry;
  id v30;
  uint64_t v31;
  void v33[6];
  uint64_t v34;

  if (!a1)
  {
    if (a2)
    {
      lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError();
      swift_allocError();
      uint64_t v23 = v22;
      if (MEMORY[0x2105634B0](a2) == MEMORY[0x263EF8770])
      {
        uint64_t v34 = a6;
        uint64_t v24 = xpc_rich_error_copy_description(a2);
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = String.init(cString:)();
          uint64_t v28 = v27;
          BOOL can_retry = xpc_rich_error_can_retry(a2);
          free(v25);
          *(unsigned char *)uint64_t v23 = can_retry;
          *(void *)(v23 + 8) = v26;
          *(void *)(v23 + 16) = v28;
          swift_willThrow();
          outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
          swift_unknownObjectRelease();
          type metadata accessor for XPCSession();
          uint64_t v18 = v34;
          swift_deallocPartialClassInstance();
          return v18;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
    }
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD00000000000001BLL, 0x800000020DA31030);
  }
  uint64_t v11 = *a5;
  *(void *)(a6 + 16) = a1;
  if (a3)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = a3;
    *(void *)(v12 + 24) = a4;
    uint64_t v34 = v11;
    id v13 = a1;
    outlined copy of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
    id v14 = v13;
    outlined copy of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
    uint64_t v15 = ClientSpecifiedHandler.init(_:)((uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Result<XPCReceivedMessage, XPCRichError>) -> ());
    uint64_t v17 = v16;
    uint64_t v18 = a6;
    uint64_t v19 = *(void **)(a6 + 16);
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v15;
    *(void *)(v20 + 24) = v17;
    v33[4] = closure #1 in XPCSession.setCancellationHandler(_:)partial apply;
    v33[5] = v20;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 1107296256;
    v33[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object) -> ();
    v33[3] = &block_descriptor_115;
    uint64_t v21 = _Block_copy(v33);
    swift_retain();
    swift_release();
    _swift_xpc_session_set_cancel_handler(v19, v21);
    _Block_release(v21);
    uint64_t v11 = v34;
    swift_release();
    outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
  }
  else
  {
    uint64_t v18 = a6;
    id v30 = a1;
  }
  swift_beginAccess();
  if ((static XPCSession.InitializationOptions.inactive & ~v11) != 0)
  {
    XPCSession.activate()();
    if (v31) {
      swift_release();
    }
  }
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);

  swift_unknownObjectRelease();
  return v18;
}

{
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL can_retry;
  id v30;
  uint64_t v31;
  void v33[6];
  uint64_t v34;

  if (!a1)
  {
    if (a2)
    {
      lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError();
      swift_allocError();
      uint64_t v23 = v22;
      if (MEMORY[0x2105634B0](a2) == MEMORY[0x263EF8770])
      {
        uint64_t v34 = a6;
        uint64_t v24 = xpc_rich_error_copy_description(a2);
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = String.init(cString:)();
          uint64_t v28 = v27;
          BOOL can_retry = xpc_rich_error_can_retry(a2);
          free(v25);
          *(unsigned char *)uint64_t v23 = can_retry;
          *(void *)(v23 + 8) = v26;
          *(void *)(v23 + 16) = v28;
          swift_willThrow();
          outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
          swift_unknownObjectRelease();
          type metadata accessor for XPCSession();
          uint64_t v18 = v34;
          swift_deallocPartialClassInstance();
          return v18;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
    }
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD00000000000001BLL, 0x800000020DA31030);
  }
  uint64_t v11 = *a5;
  *(void *)(a6 + 16) = a1;
  if (a3)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = a3;
    *(void *)(v12 + 24) = a4;
    uint64_t v34 = v11;
    id v13 = a1;
    outlined copy of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
    id v14 = v13;
    outlined copy of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
    uint64_t v15 = ClientSpecifiedHandler.init(_:)((uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Result<XPCReceivedMessage, XPCRichError>) -> ());
    uint64_t v17 = v16;
    uint64_t v18 = a6;
    uint64_t v19 = *(void **)(a6 + 16);
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v15;
    *(void *)(v20 + 24) = v17;
    v33[4] = closure #1 in XPCSession.setCancellationHandler(_:)partial apply;
    v33[5] = v20;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 1107296256;
    v33[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object) -> ();
    v33[3] = &block_descriptor_93;
    uint64_t v21 = _Block_copy(v33);
    swift_retain();
    swift_release();
    _swift_xpc_session_set_cancel_handler(v19, v21);
    _Block_release(v21);
    uint64_t v11 = v34;
    swift_release();
    outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
  }
  else
  {
    uint64_t v18 = a6;
    id v30 = a1;
  }
  swift_beginAccess();
  if ((static XPCSession.InitializationOptions.inactive & ~v11) != 0)
  {
    XPCSession.activate()();
    if (v31) {
      swift_release();
    }
  }
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);

  swift_unknownObjectRelease();
  return v18;
}

{
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL can_retry;
  id v30;
  uint64_t v31;
  void v33[6];
  uint64_t v34;

  if (!a1)
  {
    if (a2)
    {
      lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError();
      swift_allocError();
      uint64_t v23 = v22;
      if (MEMORY[0x2105634B0](a2) == MEMORY[0x263EF8770])
      {
        uint64_t v34 = a6;
        uint64_t v24 = xpc_rich_error_copy_description(a2);
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = String.init(cString:)();
          uint64_t v28 = v27;
          BOOL can_retry = xpc_rich_error_can_retry(a2);
          free(v25);
          *(unsigned char *)uint64_t v23 = can_retry;
          *(void *)(v23 + 8) = v26;
          *(void *)(v23 + 16) = v28;
          swift_willThrow();
          outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
          swift_unknownObjectRelease();
          type metadata accessor for XPCSession();
          uint64_t v18 = v34;
          swift_deallocPartialClassInstance();
          return v18;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
    }
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD00000000000001BLL, 0x800000020DA31030);
  }
  uint64_t v11 = *a5;
  *(void *)(a6 + 16) = a1;
  if (a3)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = a3;
    *(void *)(v12 + 24) = a4;
    uint64_t v34 = v11;
    id v13 = a1;
    outlined copy of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
    id v14 = v13;
    outlined copy of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
    uint64_t v15 = ClientSpecifiedHandler.init(_:)((uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Result<XPCReceivedMessage, XPCRichError>) -> ());
    uint64_t v17 = v16;
    uint64_t v18 = a6;
    uint64_t v19 = *(void **)(a6 + 16);
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v15;
    *(void *)(v20 + 24) = v17;
    v33[4] = closure #1 in XPCSession.setCancellationHandler(_:)partial apply;
    v33[5] = v20;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 1107296256;
    v33[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object) -> ();
    v33[3] = &block_descriptor_82;
    uint64_t v21 = _Block_copy(v33);
    swift_retain();
    swift_release();
    _swift_xpc_session_set_cancel_handler(v19, v21);
    _Block_release(v21);
    uint64_t v11 = v34;
    swift_release();
    outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
  }
  else
  {
    uint64_t v18 = a6;
    id v30 = a1;
  }
  swift_beginAccess();
  if ((static XPCSession.InitializationOptions.inactive & ~v11) != 0)
  {
    XPCSession.activate()();
    if (v31) {
      swift_release();
    }
  }
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);

  swift_unknownObjectRelease();
  return v18;
}

uint64_t XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:)(void *a1, _xpc_rich_error_s *a2, uint64_t a3, void *a4, uint64_t *a5, void (*a6)(uint64_t))
{
  uint64_t v7 = v6;
  if (!a1)
  {
    if (a2)
    {
      lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError();
      swift_allocError();
      uint64_t v23 = v22;
      if (MEMORY[0x2105634B0](a2) == MEMORY[0x263EF8770])
      {
        id v32 = a4;
        uint64_t v24 = xpc_rich_error_copy_description(a2);
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = String.init(cString:)();
          uint64_t v28 = v27;
          BOOL can_retry = xpc_rich_error_can_retry(a2);
          free(v25);
          *(unsigned char *)uint64_t v23 = can_retry;
          *(void *)(v23 + 8) = v26;
          *(void *)(v23 + 16) = v28;
          swift_willThrow();
          outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
          swift_unknownObjectRelease();
          type metadata accessor for XPCSession();
          swift_deallocPartialClassInstance();
          return v7;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
    }
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD00000000000001BLL, 0x800000020DA31030);
  }
  uint64_t v12 = *a5;
  *(void *)(v6 + 16) = a1;
  id v13 = a1;
  a6(v6);
  if (a3)
  {
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = a3;
    *(void *)(v14 + 24) = a4;
    swift_retain_n();
    uint64_t v15 = ClientSpecifiedHandler.init(_:)((uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Result<XPCReceivedMessage, XPCRichError>) -> ());
    id v32 = v13;
    uint64_t v17 = v16;
    uint64_t v18 = *(void **)(v7 + 16);
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v15;
    *(void *)(v19 + 24) = v17;
    v31[4] = closure #1 in XPCSession.setCancellationHandler(_:)partial apply;
    v31[5] = v19;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 1107296256;
    v31[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object) -> ();
    v31[3] = &block_descriptor_137;
    uint64_t v20 = _Block_copy(v31);
    swift_retain();
    swift_release();
    _swift_xpc_session_set_cancel_handler(v18, v20);
    _Block_release(v20);
    id v13 = v32;
    swift_release();
    outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);
  }
  swift_beginAccess();
  if ((static XPCSession.InitializationOptions.inactive & ~v12) != 0)
  {
    XPCSession.activate()();
    if (v21) {
      swift_release();
    }
  }
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a3);

  swift_unknownObjectRelease();
  return v7;
}

uint64_t closure #1 in XPCSession.init<A>(session:createError:incomingMessageHandler:cancellationHandler:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2)
  {
    swift_retain();
    XPCSession.setIncomingMessageHandler<A>(_:)(a2, a3, a4, a5);
    return outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a2);
  }
  return result;
}

uint64_t XPCSession.__allocating_init(xpcService:targetQueue:options:cancellationHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  return XPCSession.__allocating_init(xpcService:targetQueue:options:cancellationHandler:)(a1, a2, a3, a4, a5, a6, (uint64_t (*)(uint64_t, void *, uint64_t, void *))_swift_xpc_session_create_xpc_service, (uint64_t (*)(id, uint64_t, uint64_t, uint64_t, void *, uint64_t))specialized XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:));
}

xpc_session_t _swift_xpc_session_create_xpc_service(const char *a1, void *a2, xpc_session_create_flags_t a3, xpc_rich_error_t *a4)
{
  uint64_t v7 = a2;
  xpc_session_t xpc_service = xpc_session_create_xpc_service(a1, v7, a3, a4);

  return xpc_service;
}

uint64_t XPCSession.__allocating_init(xpcService:targetQueue:options:incomingMessageHandler:cancellationHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return XPCSession.__allocating_init(xpcService:targetQueue:options:incomingMessageHandler:cancellationHandler:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t (*)(uint64_t, void *, uint64_t, void *))_swift_xpc_session_create_xpc_service, (uint64_t (*)(id, uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t))specialized XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:));
}

{
  return XPCSession.__allocating_init(xpcService:targetQueue:options:incomingMessageHandler:cancellationHandler:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t (*)(uint64_t, void *, uint64_t, void *))_swift_xpc_session_create_xpc_service, (uint64_t (*)(id, uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t))specialized XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:));
}

uint64_t XPCSession.__allocating_init<A>(xpcService:targetQueue:options:incomingMessageHandler:cancellationHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10)
{
  return XPCSession.__allocating_init<A>(xpcService:targetQueue:options:incomingMessageHandler:cancellationHandler:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, (uint64_t (*)(uint64_t, void *, uint64_t, uint64_t *))_swift_xpc_session_create_xpc_service);
}

uint64_t XPCSession.__allocating_init(machService:targetQueue:options:cancellationHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  return XPCSession.__allocating_init(xpcService:targetQueue:options:cancellationHandler:)(a1, a2, a3, a4, a5, a6, (uint64_t (*)(uint64_t, void *, uint64_t, void *))_swift_xpc_session_create_mach_service, (uint64_t (*)(id, uint64_t, uint64_t, uint64_t, void *, uint64_t))specialized XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:));
}

uint64_t XPCSession.__allocating_init(xpcService:targetQueue:options:cancellationHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, void *, uint64_t, void *), uint64_t (*a8)(id, uint64_t, uint64_t, uint64_t, void *, uint64_t))
{
  v21[4] = *MEMORY[0x263EF8340];
  uint64_t v12 = *a4;
  swift_beginAccess();
  uint64_t v13 = static XPCSession.InitializationOptions.inactive | v12;
  uint64_t v14 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  v21[0] = 0;
  id v15 = (id)a7(v14 + 32, a3, v13, v21);
  uint64_t v16 = v21[0];
  swift_unknownObjectRetain();
  swift_release();
  v21[0] = v12;
  type metadata accessor for XPCSession();
  uint64_t v17 = swift_allocObject();
  swift_unknownObjectRetain();
  uint64_t v18 = a8(v15, v16, a5, a6, v21, v17);
  swift_unknownObjectRelease();

  return v18;
}

uint64_t XPCSession.__allocating_init(machService:targetQueue:options:incomingMessageHandler:cancellationHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return XPCSession.__allocating_init(xpcService:targetQueue:options:incomingMessageHandler:cancellationHandler:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t (*)(uint64_t, void *, uint64_t, void *))_swift_xpc_session_create_mach_service, (uint64_t (*)(id, uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t))specialized XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:));
}

{
  return XPCSession.__allocating_init(xpcService:targetQueue:options:incomingMessageHandler:cancellationHandler:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t (*)(uint64_t, void *, uint64_t, void *))_swift_xpc_session_create_mach_service, (uint64_t (*)(id, uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t))specialized XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:));
}

uint64_t XPCSession.__allocating_init<A>(machService:targetQueue:options:incomingMessageHandler:cancellationHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10)
{
  return XPCSession.__allocating_init<A>(xpcService:targetQueue:options:incomingMessageHandler:cancellationHandler:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, (uint64_t (*)(uint64_t, void *, uint64_t, uint64_t *))_swift_xpc_session_create_mach_service);
}

uint64_t XPCSession.__allocating_init<A>(xpcService:targetQueue:options:incomingMessageHandler:cancellationHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t (*a11)(uint64_t, void *, uint64_t, uint64_t *))
{
  v23[4] = *MEMORY[0x263EF8340];
  uint64_t v14 = *a4;
  swift_beginAccess();
  uint64_t v15 = static XPCSession.InitializationOptions.inactive | v14;
  uint64_t v16 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  v23[0] = 0;
  id v17 = (id)a11(v16 + 32, a3, v15, v23);
  uint64_t v18 = (_xpc_rich_error_s *)v23[0];
  swift_unknownObjectRetain();
  swift_release();
  v23[0] = v14;
  swift_unknownObjectRetain();
  uint64_t v19 = specialized XPCSession.__allocating_init<A>(session:createError:incomingMessageHandler:cancellationHandler:options:)(v17, v18, a5, a6, a7, a8, v23);
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a5);
  swift_unknownObjectRelease();

  return v19;
}

uint64_t XPCSession.__allocating_init(xpcService:targetQueue:options:incomingMessageHandler:cancellationHandler:)(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t (*a9)(uint64_t, void *, uint64_t, void *), uint64_t (*a10)(id, uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t))
{
  v23[4] = *MEMORY[0x263EF8340];
  uint64_t v13 = *a4;
  swift_beginAccess();
  uint64_t v14 = static XPCSession.InitializationOptions.inactive | v13;
  uint64_t v15 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  v23[0] = 0;
  id v16 = (id)a9(v15 + 32, a3, v14, v23);
  uint64_t v17 = v23[0];
  swift_unknownObjectRetain();
  swift_release();
  v23[0] = v13;
  type metadata accessor for XPCSession();
  uint64_t v18 = swift_allocObject();
  swift_unknownObjectRetain();
  uint64_t v19 = a10(v16, v17, a7, a8, v23, v18, a5, a6);
  swift_unknownObjectRelease();

  return v19;
}

uint64_t XPCSession.setIncomingMessageHandler<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Encodable?);
  uint64_t v8 = ClientSpecifiedHandler.init(_:)(a1);
  uint64_t v10 = v9;
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = v8;
  v11[5] = v10;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = partial apply for closure #1 in XPCSession.setIncomingMessageHandler<A>(_:);
  *(void *)(v12 + 24) = v11;
  uint64_t v13 = *(void **)(v4 + 16);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = partial apply for closure #1 in XPCSession._setIncomingMessageHandler(_:);
  *(void *)(v14 + 24) = v12;
  v17[4] = closure #1 in XPCSession._setIncomingMessageHandler(_:)partial apply;
  v17[5] = v14;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 1107296256;
  v17[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object) -> ();
  void v17[3] = &block_descriptor_18;
  uint64_t v15 = _Block_copy(v17);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  _swift_xpc_session_set_incoming_message_handler(v13, v15);
  _Block_release(v15);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t closure #1 in XPCSession.setIncomingMessageHandler<A>(_:)(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (_OWORD *)MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)v15 - v11;
  v15[0] = *v10;
  v15[2] = v15[0];
  XPCReceivedMessage.decode<A>(as:)(v13, v13, (uint64_t)v9);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v12, v9, a4);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Encodable?);
  ClientSpecifiedHandler.callEventHandler(_:)((uint64_t)v12, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v12, a4);
}

uint64_t XPCSession.setCancellationHandler(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  swift_retain();
  uint64_t v6 = ClientSpecifiedHandler.init(_:)((uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ());
  uint64_t v8 = v7;
  uint64_t v9 = *(void **)(v2 + 16);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v6;
  *(void *)(v10 + 24) = v8;
  v13[4] = partial apply for closure #1 in XPCSession.setCancellationHandler(_:);
  v13[5] = v10;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 1107296256;
  v13[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object) -> ();
  void v13[3] = &block_descriptor_41;
  uint64_t v11 = _Block_copy(v13);
  swift_retain();
  swift_release();
  _swift_xpc_session_set_cancel_handler(v9, v11);
  _Block_release(v11);
  return swift_release();
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ()(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

char *closure #1 in XPCSession.setCancellationHandler(_:)(_xpc_rich_error_s *a1, void (*a2)(uint64_t))
{
  uint64_t v4 = swift_unknownObjectRetain();
  uint64_t result = (char *)MEMORY[0x2105634B0](v4);
  if (result == (char *)MEMORY[0x263EF8770])
  {
    uint64_t result = xpc_rich_error_copy_description(a1);
    if (result)
    {
      uint64_t v6 = result;
      uint64_t v7 = String.init(cString:)();
      uint64_t v9 = v8;
      BOOL can_retry = xpc_rich_error_can_retry(a1);
      free(v6);
      swift_unknownObjectRelease();
      v11[0] = can_retry;
      uint64_t v12 = v7;
      uint64_t v13 = v9;
      ClientSpecifiedHandler.callEventHandler(_:)((uint64_t)v11, a2);
      return (char *)swift_bridgeObjectRelease();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void XPCSession.setTargetQueue(_:)(void *a1)
{
  _swift_xpc_session_set_target_queue(*(void **)(v1 + 16), a1);
}

Swift::Void __swiftcall XPCSession.cancel(reason:)(Swift::String reason)
{
  _swift_xpc_session_cancel(*(void **)(v1 + 16));
}

uint64_t XPCSession.sendSync<A, B>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t result = XPCSession.sendSync<A>(_:)(a1, a2, a4, &v9);
  if (!v5)
  {
    XPCReceivedMessage.decode<A>(as:)(a3, a3, a5);
    swift_release();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t XPCSession.send(message:replyHandler:)(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCDictionary, XPCRichError>);
  uint64_t v8 = ClientSpecifiedHandler.init(_:)((uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ());
  uint64_t v10 = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v8;
  *(void *)(v11 + 24) = v10;
  uint64_t v12 = *(void **)(v3 + 16);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = partial apply for implicit closure #2 in implicit closure #1 in XPCSession.send(message:replyHandler:);
  *(void *)(v13 + 24) = v11;
  v16[4] = partial apply for closure #1 in XPCSession._send(message:replyHandler:);
  v16[5] = v13;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 1107296256;
  v16[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object?, @guaranteed OS_xpc_object?) -> ();
  void v16[3] = &block_descriptor_53;
  uint64_t v14 = _Block_copy(v16);
  swift_retain();
  swift_retain();
  swift_release();
  _swift_xpc_session_send_message_with_reply_async(v12, v6, v14);
  _Block_release(v14);
  swift_release();
  return swift_release();
}

uint64_t XPCSession.send<A>(_:replyHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<XPCReceivedMessage, XPCRichError>);
  uint64_t v11 = ClientSpecifiedHandler.init(_:)((uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Result<XPCReceivedMessage, XPCRichError>) -> ());
  uint64_t v13 = v12;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v11;
  *(void *)(v14 + 24) = v13;
  swift_retain();
  XPCSession._send<A>(_:replyHandler:)(a1, (uint64_t)partial apply for implicit closure #2 in implicit closure #1 in XPCSession.send<A>(_:replyHandler:), v14, a4, a5);
  swift_release();
  return swift_release();
}

uint64_t implicit closure #2 in implicit closure #1 in XPCSession.send(message:replyHandler:)(long long *a1, void (*a2)(uint64_t), uint64_t a3, uint64_t *a4)
{
  uint64_t v5 = *((void *)a1 + 2);
  char v6 = *((unsigned char *)a1 + 24);
  long long v8 = *a1;
  uint64_t v9 = v5;
  char v10 = v6;
  __swift_instantiateConcreteTypeFromMangledName(a4);
  return ClientSpecifiedHandler.callEventHandler(_:)((uint64_t)&v8, a2);
}

uint64_t XPCSession.deinit()
{
  return v0;
}

uint64_t XPCSession.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t XPCSession.__allocating_init(endpoint:targetQueue:options:cancellationHandler:)(uint64_t a1, void *a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  v14[4] = *MEMORY[0x263EF8340];
  uint64_t v8 = *a3;
  uint64_t v9 = (void *)swift_unknownObjectRetain();
  if (!xpc_copy(v9)) {
    __break(1u);
  }
  swift_unknownObjectRelease_n();
  swift_beginAccess();
  xpc_endpoint = (void *)xpc_session_create_xpc_endpoint();
  swift_unknownObjectRelease();
  v14[0] = v8;
  type metadata accessor for XPCSession();
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectRetain_n();
  uint64_t v12 = specialized XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:)(xpc_endpoint, 0, a4, a5, v14, v11);
  swift_unknownObjectRelease();

  return v12;
}

uint64_t XPCSession.__allocating_init(endpoint:targetQueue:options:incomingMessageHandler:cancellationHandler:)(uint64_t a1, void *a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return XPCSession.__allocating_init(endpoint:targetQueue:options:incomingMessageHandler:cancellationHandler:)(a1, a2, a3, a4, a5, a6, a7, (uint64_t (*)(uint64_t, void, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t))specialized XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:));
}

{
  return XPCSession.__allocating_init(endpoint:targetQueue:options:incomingMessageHandler:cancellationHandler:)(a1, a2, a3, a4, a5, a6, a7, (uint64_t (*)(uint64_t, void, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t))specialized XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:));
}

uint64_t XPCSession.__allocating_init<A>(endpoint:targetQueue:options:incomingMessageHandler:cancellationHandler:)(uint64_t a1, void *a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  v17[4] = *MEMORY[0x263EF8340];
  uint64_t v12 = *a3;
  uint64_t v13 = (void *)swift_unknownObjectRetain();
  if (!xpc_copy(v13)) {
    __break(1u);
  }
  swift_unknownObjectRelease_n();
  swift_beginAccess();
  xpc_endpoint = (void *)xpc_session_create_xpc_endpoint();
  swift_unknownObjectRelease();
  v17[0] = v12;
  swift_unknownObjectRetain_n();
  uint64_t v15 = specialized XPCSession.__allocating_init<A>(session:createError:incomingMessageHandler:cancellationHandler:options:)(xpc_endpoint, 0, a4, a5, a6, a7, v17);
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a4);
  swift_unknownObjectRelease();

  return v15;
}

uint64_t XPCSession.__allocating_init(endpoint:targetQueue:options:incomingMessageHandler:cancellationHandler:)(uint64_t a1, void *a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(uint64_t, void, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t))
{
  v20[4] = *MEMORY[0x263EF8340];
  uint64_t v13 = *a3;
  uint64_t v14 = (void *)swift_unknownObjectRetain();
  if (!xpc_copy(v14)) {
    __break(1u);
  }
  swift_unknownObjectRelease_n();
  swift_beginAccess();
  uint64_t xpc_endpoint = xpc_session_create_xpc_endpoint();
  swift_unknownObjectRelease();
  v20[0] = v13;
  type metadata accessor for XPCSession();
  uint64_t v16 = swift_allocObject();
  swift_unknownObjectRetain_n();
  uint64_t v17 = a8(xpc_endpoint, 0, a6, a7, v20, v16, a4, a5);
  swift_unknownObjectRelease();

  return v17;
}

unint64_t XPCSession.debugDescription.getter()
{
  uint64_t v1 = _swift_xpc_session_copy_description(*(void **)(v0 + 16));
  if (!v1) {
    return 0xD000000000000035;
  }
  uint64_t v2 = v1;
  uint64_t v3 = String.init(cString:)();
  free(v2);
  return v3;
}

unint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance XPCSession()
{
  uint64_t v1 = _swift_xpc_session_copy_description(*(void **)(*(void *)v0 + 16));
  if (!v1) {
    return 0xD000000000000035;
  }
  uint64_t v2 = v1;
  uint64_t v3 = String.init(cString:)();
  free(v2);
  return v3;
}

uint64_t XPCSession.__allocating_init(fromConnection:targetQueue:options:cancellationHandler:)(void *a1, void *a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  v14[4] = *MEMORY[0x263EF8340];
  uint64_t v9 = *a3;
  swift_beginAccess();
  id v10 = _swift__xpc_session_create_from_connection_4SWIFT(a1, a2);
  v14[0] = v9;
  type metadata accessor for XPCSession();
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectRetain_n();
  uint64_t v12 = specialized XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:)(v10, 0, a4, a5, v14, v11);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v12;
}

uint64_t XPCSession.__allocating_init<A>(fromConnection:targetQueue:options:incomingMessageHandler:cancellationHandler:)(void *a1, void *a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  v17[4] = *MEMORY[0x263EF8340];
  uint64_t v12 = *a3;
  swift_beginAccess();
  id v13 = _swift__xpc_session_create_from_connection_4SWIFT(a1, a2);
  v17[0] = v12;
  swift_unknownObjectRetain_n();
  uint64_t v14 = specialized XPCSession.__allocating_init<A>(session:createError:incomingMessageHandler:cancellationHandler:options:)(v13, 0, a4, a5, a6, a7, v17);
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v14;
}

id XPCSession.extractConnection()()
{
  id result = _swift__xpc_session_extract_connection_4SWIFT(*(void **)(v0 + 16));
  if (!result) {
    __break(1u);
  }
  return result;
}

Swift::Void __swiftcall XPCSession.setTargetUserSession(userIdentifier:)(Swift::UInt32 userIdentifier)
{
  MEMORY[0x270EDC390](*(void *)(v1 + 16), *(void *)&userIdentifier);
}

uint64_t specialized XPCSession.__allocating_init<A>(session:createError:incomingMessageHandler:cancellationHandler:options:)(void *a1, _xpc_rich_error_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t *a7)
{
  uint64_t v12 = *a7;
  type metadata accessor for XPCSession();
  swift_allocObject();
  return XPCSession.init(session:createError:cancellationHandler:options:incomingMessageHandlerSetup:)(a1, a2, a5, a6, &v12, (void (*)(uint64_t))partial apply for closure #1 in XPCSession.init<A>(session:createError:incomingMessageHandler:cancellationHandler:options:));
}

xpc_session_t _swift_xpc_session_create_mach_service(const char *a1, void *a2, xpc_session_create_flags_t a3, xpc_rich_error_t *a4)
{
  uint64_t v7 = a2;
  xpc_session_t mach_service = xpc_session_create_mach_service(a1, v7, a3, a4);

  return mach_service;
}

uint64_t sub_20DA046A0()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in XPCSession.setIncomingMessageHandler(_:)(uint64_t *a1)
{
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  uint64_t v4 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCDictionary?);
  return ClientSpecifiedHandler.callEventHandler(_:)((uint64_t)&v4, v2);
}

uint64_t sub_20DA04740()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t partial apply for closure #1 in XPCSession.setIncomingMessageHandler<A>(_:)(uint64_t a1)
{
  return closure #1 in XPCSession.setIncomingMessageHandler<A>(_:)(a1, *(void (**)(uint64_t))(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 16));
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ()()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

char *partial apply for closure #1 in XPCSession.setCancellationHandler(_:)(_xpc_rich_error_s *a1)
{
  return closure #1 in XPCSession.setCancellationHandler(_:)(a1, *(void (**)(uint64_t))(v1 + 16));
}

void _swift_xpc_session_set_target_queue(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = a2;
  xpc_session_set_target_queue(v3, v4);
}

unint64_t lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError()
{
  unint64_t result = lazy protocol witness table cache variable for type XPCRichError and conformance XPCRichError;
  if (!lazy protocol witness table cache variable for type XPCRichError and conformance XPCRichError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type XPCRichError and conformance XPCRichError);
  }
  return result;
}

void _swift_xpc_session_cancel(void *a1)
{
  uint64_t v1 = a1;
  xpc_session_cancel(v1);
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in XPCSession.send(message:replyHandler:)(long long *a1)
{
  return implicit closure #2 in implicit closure #1 in XPCSession.send(message:replyHandler:)(a1, *(void (**)(uint64_t))(v1 + 16), *(void *)(v1 + 24), &demangling cache variable for type metadata for Result<XPCDictionary, XPCRichError>);
}

uint64_t sub_20DA048C4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in XPCSession.send<A>(_:replyHandler:)(long long *a1)
{
  return implicit closure #2 in implicit closure #1 in XPCSession.send(message:replyHandler:)(a1, *(void (**)(uint64_t))(v1 + 16), *(void *)(v1 + 24), &demangling cache variable for type metadata for Result<XPCReceivedMessage, XPCRichError>);
}

char *_swift_xpc_session_copy_description(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = xpc_session_copy_description(v1);

  return v2;
}

id _swift__xpc_session_extract_connection_4SWIFT(void *a1)
{
  id v1 = a1;
  connection_4SWIFT = (void *)_xpc_session_extract_connection_4SWIFT();

  return connection_4SWIFT;
}

unint64_t lazy protocol witness table accessor for type XPCSession.InitializationOptions and conformance XPCSession.InitializationOptions()
{
  unint64_t result = lazy protocol witness table cache variable for type XPCSession.InitializationOptions and conformance XPCSession.InitializationOptions;
  if (!lazy protocol witness table cache variable for type XPCSession.InitializationOptions and conformance XPCSession.InitializationOptions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type XPCSession.InitializationOptions and conformance XPCSession.InitializationOptions);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type XPCSession.InitializationOptions and conformance XPCSession.InitializationOptions;
  if (!lazy protocol witness table cache variable for type XPCSession.InitializationOptions and conformance XPCSession.InitializationOptions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type XPCSession.InitializationOptions and conformance XPCSession.InitializationOptions);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type XPCSession.InitializationOptions and conformance XPCSession.InitializationOptions;
  if (!lazy protocol witness table cache variable for type XPCSession.InitializationOptions and conformance XPCSession.InitializationOptions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type XPCSession.InitializationOptions and conformance XPCSession.InitializationOptions);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type XPCSession.InitializationOptions and conformance XPCSession.InitializationOptions;
  if (!lazy protocol witness table cache variable for type XPCSession.InitializationOptions and conformance XPCSession.InitializationOptions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type XPCSession.InitializationOptions and conformance XPCSession.InitializationOptions);
  }
  return result;
}

uint64_t method lookup function for XPCSession(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCSession);
}

uint64_t dispatch thunk of XPCSession.setIncomingMessageHandler(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of XPCSession.setIncomingMessageHandler<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of XPCSession.setCancellationHandler(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of XPCSession.setTargetQueue(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of XPCSession.activate()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of XPCSession.cancel(reason:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of XPCSession.send(message:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of XPCSession.sendSync(message:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of XPCSession.sendSync<A, B>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of XPCSession.send(message:replyHandler:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of XPCSession.send<A>(_:replyHandler:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t outlined copy of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t outlined consume of Result<XPCDictionary, XPCRichError>(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4) {
    return swift_bridgeObjectRelease();
  }
  else {
    return swift_unknownObjectRelease();
  }
}

uint64_t partial apply for closure #1 in XPCSession.init<A>(session:createError:incomingMessageHandler:cancellationHandler:options:)(uint64_t a1)
{
  return closure #1 in XPCSession.init<A>(session:createError:incomingMessageHandler:cancellationHandler:options:)(a1, v1[4], v1[5], v1[2], v1[3]);
}

void closure #1 in XPCDictionary.subscript.setterpartial apply(char *a1)
{
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance String()
{
  return 14;
}

uint64_t _XPCUnkeyedDecodingContainer.nestedContainer<A>(keyedBy:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v2 + 32);
  v4._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(v0 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20DA2D050;
  *(void *)(inited + 56) = &type metadata for CodableIndexKey;
  *(void *)(inited + 64) = lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();
  uint64_t v8 = swift_allocObject();
  *(void *)(inited + 32) = v8;
  *(void *)(v8 + 16) = 0x207865646E49;
  *(void *)(v8 + 24) = 0xE600000000000000;
  *(void *)(v8 + 32) = v3;
  *(unsigned char *)(v8 + 40) = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)((void *)inited);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  type metadata accessor for _XPCKeyedDecodingContainer();
  uint64_t v9 = *(void **)(v2 + 16);
  swift_retain();
  uint64_t result = (uint64_t)_XPCKeyedDecodingContainer.__allocating_init(codingMetadata:initialStorage:)(v5, v6, v9);
  if (v15)
  {
    uint64_t v11 = *(void *)(v2 + 32);
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (!v12) {
      goto LABEL_6;
    }
    __break(1u);
  }
  swift_getWitnessTable();
  uint64_t result = KeyedDecodingContainer.init<A>(_:)();
  uint64_t v14 = *(void *)(v2 + 32);
  BOOL v12 = __OFADD__(v14, 1);
  uint64_t v13 = v14 + 1;
  if (!v12)
  {
LABEL_6:
    *(void *)(v2 + 32) = v13;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t _XPCUnkeyedDecodingContainer.nestedUnkeyedContainer()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = v2;
  Swift::String v4 = v1;
  uint64_t v5 = *v1;
  uint64_t v6 = v1[4];
  uint64_t v7 = *(void *)(v6 + 32);
  v8._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  uint64_t v9 = v1[2];
  uint64_t v10 = v4[3];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20DA2D050;
  *(void *)(inited + 56) = &type metadata for CodableIndexKey;
  *(void *)(inited + 64) = lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();
  uint64_t v12 = swift_allocObject();
  *(void *)(inited + 32) = v12;
  *(void *)(v12 + 16) = 0x207865646E49;
  *(void *)(v12 + 24) = 0xE600000000000000;
  *(void *)(v12 + 32) = v7;
  *(unsigned char *)(v12 + 40) = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)((void *)inited);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void **)(v6 + 16);
  swift_retain();
  uint64_t result = (uint64_t)_XPCUnkeyedDecodingContainer.__allocating_init(codingMetadata:buffer:)(v9, v10, v13);
  if (v3)
  {
    uint64_t v16 = *(void *)(v6 + 32);
    BOOL v17 = __OFADD__(v16, 1);
    uint64_t v18 = v16 + 1;
    if (!v17) {
      goto LABEL_6;
    }
    __break(1u);
  }
  uint64_t v19 = result;
  a1[3] = v5;
  uint64_t result = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder(&lazy protocol witness table cache variable for type _XPCUnkeyedDecodingContainer and conformance _XPCUnkeyedDecodingContainer, v15, (void (*)(uint64_t))type metadata accessor for _XPCUnkeyedDecodingContainer);
  a1[4] = result;
  *a1 = v19;
  uint64_t v20 = *(void *)(v6 + 32);
  BOOL v17 = __OFADD__(v20, 1);
  uint64_t v18 = v20 + 1;
  if (!v17)
  {
LABEL_6:
    *(void *)(v6 + 32) = v18;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t _XPCUnkeyedDecodingContainer.superDecoder()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = *(void *)(v4 + 32);
  v6._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20DA2D050;
  *(void *)(inited + 56) = &type metadata for CodableIndexKey;
  *(void *)(inited + 64) = lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();
  uint64_t v10 = swift_allocObject();
  *(void *)(inited + 32) = v10;
  *(void *)(v10 + 16) = 0x207865646E49;
  *(void *)(v10 + 24) = v16;
  *(void *)(v10 + 32) = v5;
  *(unsigned char *)(v10 + 40) = 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)((void *)inited);
  uint64_t v11 = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(v4 + 16);
  uint64_t v13 = type metadata accessor for _XPCDecoder();
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 40) = 0u;
  *(_OWORD *)(v14 + 56) = 0u;
  *(void *)(v14 + 72) = 0;
  *(void *)(v14 + 24) = v8;
  *(void *)(v14 + 32) = v12;
  *(void *)(v14 + 16) = v11;
  a1[3] = v13;
  a1[4] = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCDecoder);
  *a1 = v14;
  return swift_retain();
}

uint64_t protocol witness for UnkeyedDecodingContainer.codingPath.getter in conformance _XPCUnkeyedDecodingContainer()
{
  return swift_bridgeObjectRetain();
}

uint64_t protocol witness for UnkeyedDecodingContainer.currentIndex.getter in conformance _XPCUnkeyedDecodingContainer()
{
  return *(void *)(*(void *)(*(void *)v0 + 32) + 32);
}

uint64_t protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance _XPCUnkeyedDecodingContainer()
{
  return UnkeyedDecodingContainer.decodeIfPresent(_:)();
}

{
  return UnkeyedDecodingContainer.decodeIfPresent(_:)();
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  uint64_t result = UnkeyedDecodingContainer.decodeIfPresent(_:)();
  if (v0) {
    return v2;
  }
  return result;
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  uint64_t result = UnkeyedDecodingContainer.decodeIfPresent(_:)();
  if (v0) {
    return v2;
  }
  return result;
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  uint64_t result = UnkeyedDecodingContainer.decodeIfPresent(_:)();
  if (v0) {
    return v2;
  }
  return result;
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  uint64_t result = UnkeyedDecodingContainer.decodeIfPresent(_:)();
  if (v0) {
    return v2;
  }
  return result;
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  uint64_t result = UnkeyedDecodingContainer.decodeIfPresent(_:)();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance _XPCUnkeyedDecodingContainer(uint64_t a1, uint64_t a2)
{
  return protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance _XPCUnkeyedDecodingContainer(a1, a2, MEMORY[0x263F8E110]);
}

{
  return protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance _XPCUnkeyedDecodingContainer(a1, a2, MEMORY[0x263F8E118]);
}

{
  return protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance _XPCUnkeyedDecodingContainer(a1, a2, MEMORY[0x263F8E120]);
}

{
  return protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance _XPCUnkeyedDecodingContainer(a1, a2, MEMORY[0x263F8E128]);
}

{
  return protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance _XPCUnkeyedDecodingContainer(a1, a2, MEMORY[0x263F8E138]);
}

{
  return protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance _XPCUnkeyedDecodingContainer(a1, a2, MEMORY[0x263F8E130]);
}

{
  return protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance _XPCUnkeyedDecodingContainer(a1, a2, MEMORY[0x263F8E140]);
}

{
  return protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance _XPCUnkeyedDecodingContainer(a1, a2, MEMORY[0x263F8E148]);
}

{
  return protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance _XPCUnkeyedDecodingContainer(a1, a2, MEMORY[0x263F8E150]);
}

uint64_t protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance _XPCUnkeyedDecodingContainer(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3() & 0x1FF;
}

{
  return a3() & 0x1FFFF;
}

{
  unint64_t v3;

  uint64_t v3 = a3();
  return v3 | ((HIDWORD(v3) & 1) << 32);
}

{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  uint64_t result = a3();
  if (v3) {
    return v5;
  }
  return result;
}

uint64_t protocol witness for UnkeyedDecodingContainer.nestedContainer<A>(keyedBy:) in conformance _XPCUnkeyedDecodingContainer()
{
  return _XPCUnkeyedDecodingContainer.nestedContainer<A>(keyedBy:)();
}

uint64_t protocol witness for UnkeyedDecodingContainer.nestedUnkeyedContainer() in conformance _XPCUnkeyedDecodingContainer@<X0>(uint64_t *a1@<X8>)
{
  return _XPCUnkeyedDecodingContainer.nestedUnkeyedContainer()(a1);
}

uint64_t protocol witness for UnkeyedDecodingContainer.superDecoder() in conformance _XPCUnkeyedDecodingContainer@<X0>(uint64_t *a1@<X8>)
{
  return _XPCUnkeyedDecodingContainer.superDecoder()(a1);
}

void *protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance _XPCUnkeyedDecodingContainer@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X8>)
{
  uint64_t result = _XPCUnkeyedDecodingContainer.__allocating_init(codingMetadata:buffer:)(a1, a2, a3);
  if (!v4) {
    *a4 = result;
  }
  return result;
}

uint64_t protocol witness for SharableStorageContainer.storage.getter in conformance _XPCUnkeyedDecodingContainer@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(*(void *)v1 + 32);
  return swift_retain();
}

void *protocol witness for SharableStorageContainer.init(codingMetadata:storage:) in conformance _XPCUnkeyedDecodingContainer@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  uint64_t v7 = *a3;
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = v7;
  *a4 = result;
  return result;
}

void *protocol witness for SharableStorageContainer.init(codingMetadata:initialStorage:) in conformance _XPCUnkeyedDecodingContainer@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void **a3@<X2>, void *a4@<X8>)
{
  uint64_t result = _XPCUnkeyedDecodingContainer.__allocating_init(codingMetadata:buffer:)(a1, a2, *a3);
  if (!v4) {
    *a4 = result;
  }
  return result;
}

uint64_t protocol witness for CodingContainerWithMetadata.codingMetadata.getter in conformance _XPCUnkeyedDecodingContainer()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_20DA06044()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 41, 7);
}

BOOL specialized Set.contains(_:)(Swift::UInt a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  Swift::Int v4 = Hasher._finalize()();
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = v4 & ~v5;
  uint64_t v7 = a2 + 56;
  if (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    return 0;
  }
  uint64_t v8 = *(void *)(a2 + 48);
  if (*(void *)(v8 + 8 * v6) == a1) {
    return 1;
  }
  uint64_t v9 = ~v5;
  unint64_t v10 = (v6 + 1) & v9;
  if (((*(void *)(v7 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
    return 0;
  }
  do
  {
    uint64_t v11 = *(void *)(v8 + 8 * v10);
    BOOL result = v11 == a1;
    if (v11 == a1) {
      break;
    }
    unint64_t v10 = (v10 + 1) & v9;
  }
  while (((*(void *)(v7 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  return result;
}

double specialized static XPCDecoder.decode<A>(from:withCodingMetadata:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for _XPCDecoder();
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 40) = 0u;
  *(_OWORD *)(v8 + 56) = 0u;
  *(void *)(v8 + 72) = 0;
  *(void *)(v8 + 24) = a3;
  *(void *)(v8 + 32) = a1;
  *(void *)(v8 + 16) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  if (specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)())
  {
    specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>()();
    double v4 = v9;
    swift_release();
  }
  else
  {
    lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCDecoder);
    Double.init(from:)();
    if (!v3) {
      return v10;
    }
  }
  return v4;
}

float specialized static XPCDecoder.decode<A>(from:withCodingMetadata:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for _XPCDecoder();
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 40) = 0u;
  *(_OWORD *)(v8 + 56) = 0u;
  *(void *)(v8 + 72) = 0;
  *(void *)(v8 + 24) = a3;
  *(void *)(v8 + 32) = a1;
  *(void *)(v8 + 16) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  if (specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)())
  {
    specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>()();
    float v4 = v9;
    swift_release();
  }
  else
  {
    lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCDecoder);
    Float.init(from:)();
    if (!v3) {
      return v10;
    }
  }
  return v4;
}

uint64_t specialized _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>()()
{
  uint64_t v2 = v0;
  uint64_t v3 = MEMORY[0x263F8D4F8];
  uint64_t v4 = swift_conformsToProtocol2();
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (v4) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 0;
  }
  if (v6)
  {
    uint64_t v50 = type metadata accessor for _XPCDecoder();
    uint64_t v51 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCDecoder);
    uint64_t v48 = v2;
    swift_retain();
    XPCCodableObject.init(from:)(&v48, (uint64_t)&v45);
    if (!v1)
    {
      uint64_t v8 = v45;
      float v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
      uint64_t v10 = v9(v6, v5);
      Swift::UInt v11 = MEMORY[0x2105634B0](v8);
      BOOL v12 = specialized Set.contains(_:)(v11, v10);
      swift_bridgeObjectRelease();
      if (!v12)
      {
        uint64_t v48 = 0;
        unint64_t v49 = 0xE000000000000000;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        _StringGuts.grow(_:)(81);
        v29._countAndFlagsBits = 0x2065707954;
        v29._object = (void *)0xE500000000000000;
        String.append(_:)(v29);
        v30._countAndFlagsBits = 1819242306;
        v30._object = (void *)0xE400000000000000;
        String.append(_:)(v30);
        v31._countAndFlagsBits = 0xD000000000000028;
        v31._object = (void *)0x800000020DA312A0;
        String.append(_:)(v31);
        v9(v6, v5);
        v32._countAndFlagsBits = Set.description.getter();
        String.append(_:)(v32);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v33._countAndFlagsBits = 0xD00000000000001ELL;
        v33._object = (void *)0x800000020DA312D0;
        String.append(_:)(v33);
        *(void *)&long long v45 = MEMORY[0x2105634B0](v8);
        _print_unlocked<A, B>(_:_:)();
        uint64_t v34 = v48;
        uint64_t v35 = (void *)v49;
        type metadata accessor for DecodingError();
        swift_allocError();
        typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8D4F8], v34, v35, v36);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_14;
      }
      uint64_t v52 = v8;
      uint64_t v13 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 8);
      uint64_t v42 = type metadata accessor for Optional();
      uint64_t v43 = &v41;
      uint64_t v14 = v8;
      uint64_t v15 = *(void *)(v42 - 8);
      uint64_t v16 = MEMORY[0x270FA5388](v14);
      uint64_t v18 = (char *)&v41 - v17;
      uint64_t v44 = v16;
      swift_unknownObjectRetain();
      v13(&v52, v6, v5);
      uint64_t v19 = *(void *)(v6 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v6) == 1)
      {
        (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v42);
        uint64_t v48 = 0;
        unint64_t v49 = 0xE000000000000000;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        _StringGuts.grow(_:)(31);
        v20._object = (void *)0x800000020DA312F0;
        v20._countAndFlagsBits = 0xD000000000000015;
        String.append(_:)(v20);
        v21._countAndFlagsBits = 1819242306;
        v21._object = (void *)0xE400000000000000;
        String.append(_:)(v21);
        v22._countAndFlagsBits = 0x206D6F726620;
        v22._object = (void *)0xE600000000000000;
        String.append(_:)(v22);
        *(void *)&long long v45 = v44;
        _print_unlocked<A, B>(_:_:)();
        uint64_t v23 = type metadata accessor for DecodingError();
        swift_allocError();
        uint64_t v25 = v24;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
        (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v23 - 8) + 104))(v25, *MEMORY[0x263F8DCB8], v23);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_14:
        swift_bridgeObjectRelease();
        swift_willThrow();
        swift_unknownObjectRelease();
        return v7 & 1;
      }
      uint64_t v46 = v6;
      uint64_t v47 = v5;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v45);
      (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 32))(boxed_opaque_existential_1, v18, v6);
      outlined init with take of Encodable(&v45, (uint64_t)&v48);
      outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v48, (uint64_t)&v45);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
      if (swift_dynamicCast())
      {
        swift_unknownObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v48);
        char v7 = v52 & 1;
      }
      else
      {
        type metadata accessor for DecodingError();
        swift_allocError();
        char v40 = v39;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8D4F8], 0, (void *)0xE000000000000000, v40);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_willThrow();
        swift_unknownObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v48);
      }
    }
  }
  else
  {
    uint64_t v48 = 0;
    unint64_t v49 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    uint64_t v26 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v28 = v27;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v26 - 8) + 104))(v28, *MEMORY[0x263F8DCB8], v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_willThrow();
  }
  return v7 & 1;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  Swift::UInt v11;
  BOOL v12;
  void (*v13)(uint64_t *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t *boxed_opaque_existential_1;
  void *v38;
  void *v39;
  void v40[2];
  uint64_t v41;
  long long v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  uint64_t v2 = v0;
  uint64_t v3 = MEMORY[0x263F8D310];
  uint64_t v4 = swift_conformsToProtocol2();
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (v4) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 0;
  }
  if (!v6)
  {
    long long v45 = 0;
    uint64_t v46 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    uint64_t v26 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v28 = v27;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v26 - 8) + 104))(v28, *MEMORY[0x263F8DCB8], v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  uint64_t v47 = type metadata accessor for _XPCDecoder();
  uint64_t v48 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCDecoder);
  long long v45 = v2;
  swift_retain();
  BOOL result = XPCCodableObject.init(from:)(&v45, (uint64_t)&v42);
  if (!v1)
  {
    uint64_t v8 = v42;
    float v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
    uint64_t v10 = v9(v6, v5);
    Swift::UInt v11 = MEMORY[0x2105634B0](v8);
    BOOL v12 = specialized Set.contains(_:)(v11, v10);
    swift_bridgeObjectRelease();
    if (!v12)
    {
      long long v45 = 0;
      uint64_t v46 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(81);
      v29._countAndFlagsBits = 0x2065707954;
      v29._object = (void *)0xE500000000000000;
      String.append(_:)(v29);
      v30._countAndFlagsBits = 0x676E69727453;
      v30._object = (void *)0xE600000000000000;
      String.append(_:)(v30);
      v31._countAndFlagsBits = 0xD000000000000028;
      v31._object = (void *)0x800000020DA312A0;
      String.append(_:)(v31);
      v9(v6, v5);
      v32._countAndFlagsBits = Set.description.getter();
      String.append(_:)(v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v33._countAndFlagsBits = 0xD00000000000001ELL;
      v33._object = (void *)0x800000020DA312D0;
      String.append(_:)(v33);
      *(void *)&uint64_t v42 = MEMORY[0x2105634B0](v8);
      _print_unlocked<A, B>(_:_:)();
      uint64_t v34 = v45;
      uint64_t v35 = (void *)v46;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8D310], v34, v35, v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
    uint64_t v41 = v8;
    uint64_t v13 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 8);
    v40[0] = type metadata accessor for Optional();
    v40[1] = v40;
    uint64_t v14 = v8;
    uint64_t v15 = *(void *)(v40[0] - 8);
    uint64_t v16 = MEMORY[0x270FA5388](v14);
    uint64_t v18 = (char *)v40 - v17;
    unint64_t v49 = v16;
    swift_unknownObjectRetain();
    v13(&v41, v6, v5);
    uint64_t v19 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v6) == 1)
    {
      (*(void (**)(char *, void))(v15 + 8))(v18, v40[0]);
      long long v45 = 0;
      uint64_t v46 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      v20._object = (void *)0x800000020DA312F0;
      v20._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v20);
      v21._countAndFlagsBits = 0x676E69727453;
      v21._object = (void *)0xE600000000000000;
      String.append(_:)(v21);
      v22._countAndFlagsBits = 0x206D6F726620;
      v22._object = (void *)0xE600000000000000;
      String.append(_:)(v22);
      *(void *)&uint64_t v42 = v49;
      _print_unlocked<A, B>(_:_:)();
      uint64_t v23 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v25 = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v23 - 8) + 104))(v25, *MEMORY[0x263F8DCB8], v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_14:
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    uint64_t v43 = v6;
    uint64_t v44 = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v42);
    (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 32))(boxed_opaque_existential_1, v18, v6);
    outlined init with take of Encodable(&v42, (uint64_t)&v45);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v45, (uint64_t)&v42);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    if (swift_dynamicCast())
    {
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v45);
      return v41;
    }
    else
    {
      type metadata accessor for DecodingError();
      swift_allocError();
      Swift::String v39 = v38;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8D310], 0, (void *)0xE000000000000000, v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v45);
    }
  }
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  Swift::UInt v11;
  BOOL v12;
  void (*v13)(uint64_t *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t *boxed_opaque_existential_1;
  void *v38;
  void *v39;
  void v40[2];
  uint64_t v41;
  char v42;
  long long v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  uint64_t v2 = v0;
  uint64_t v3 = MEMORY[0x263F8D538];
  uint64_t v4 = swift_conformsToProtocol2();
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (v4) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 0;
  }
  if (!v6)
  {
    uint64_t v46 = 0;
    uint64_t v47 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    uint64_t v26 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v28 = v27;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v26 - 8) + 104))(v28, *MEMORY[0x263F8DCB8], v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  uint64_t v48 = type metadata accessor for _XPCDecoder();
  unint64_t v49 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCDecoder);
  uint64_t v46 = v2;
  swift_retain();
  BOOL result = XPCCodableObject.init(from:)(&v46, (uint64_t)&v43);
  if (!v1)
  {
    uint64_t v8 = v43;
    float v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
    uint64_t v10 = v9(v6, v5);
    Swift::UInt v11 = MEMORY[0x2105634B0](v8);
    BOOL v12 = specialized Set.contains(_:)(v11, v10);
    swift_bridgeObjectRelease();
    if (!v12)
    {
      uint64_t v46 = 0;
      uint64_t v47 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(81);
      v29._countAndFlagsBits = 0x2065707954;
      v29._object = (void *)0xE500000000000000;
      String.append(_:)(v29);
      v30._countAndFlagsBits = 0x656C62756F44;
      v30._object = (void *)0xE600000000000000;
      String.append(_:)(v30);
      v31._countAndFlagsBits = 0xD000000000000028;
      v31._object = (void *)0x800000020DA312A0;
      String.append(_:)(v31);
      v9(v6, v5);
      v32._countAndFlagsBits = Set.description.getter();
      String.append(_:)(v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v33._countAndFlagsBits = 0xD00000000000001ELL;
      v33._object = (void *)0x800000020DA312D0;
      String.append(_:)(v33);
      *(void *)&uint64_t v43 = MEMORY[0x2105634B0](v8);
      _print_unlocked<A, B>(_:_:)();
      uint64_t v34 = v46;
      uint64_t v35 = (void *)v47;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8D538], v34, v35, v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
    uint64_t v41 = v8;
    uint64_t v13 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 8);
    v40[0] = type metadata accessor for Optional();
    v40[1] = v40;
    uint64_t v14 = v8;
    uint64_t v15 = *(void *)(v40[0] - 8);
    uint64_t v16 = MEMORY[0x270FA5388](v14);
    uint64_t v18 = (char *)v40 - v17;
    uint64_t v50 = v16;
    swift_unknownObjectRetain();
    v13(&v41, v6, v5);
    uint64_t v19 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v6) == 1)
    {
      (*(void (**)(char *, void))(v15 + 8))(v18, v40[0]);
      uint64_t v46 = 0;
      uint64_t v47 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      v20._object = (void *)0x800000020DA312F0;
      v20._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v20);
      v21._countAndFlagsBits = 0x656C62756F44;
      v21._object = (void *)0xE600000000000000;
      String.append(_:)(v21);
      v22._countAndFlagsBits = 0x206D6F726620;
      v22._object = (void *)0xE600000000000000;
      String.append(_:)(v22);
      *(void *)&uint64_t v43 = v50;
      _print_unlocked<A, B>(_:_:)();
      uint64_t v23 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v25 = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v23 - 8) + 104))(v25, *MEMORY[0x263F8DCB8], v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_14:
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    uint64_t v44 = v6;
    long long v45 = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v43);
    (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 32))(boxed_opaque_existential_1, v18, v6);
    outlined init with take of Encodable(&v43, (uint64_t)&v46);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v46, (uint64_t)&v43);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    if (swift_dynamicCast())
    {
      uint64_t v42 = 0;
    }
    else
    {
      type metadata accessor for DecodingError();
      swift_allocError();
      Swift::String v39 = v38;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8D538], 0, (void *)0xE000000000000000, v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
    }
    swift_unknownObjectRelease();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v46);
  }
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  Swift::UInt v11;
  BOOL v12;
  void (*v13)(uint64_t *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t *boxed_opaque_existential_1;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  long long v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  uint64_t v2 = v0;
  uint64_t v3 = MEMORY[0x263F8D5C8];
  uint64_t v4 = swift_conformsToProtocol2();
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (v4) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 0;
  }
  if (!v6)
  {
    uint64_t v47 = 0;
    uint64_t v48 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    uint64_t v26 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v28 = v27;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v26 - 8) + 104))(v28, *MEMORY[0x263F8DCB8], v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  unint64_t v49 = type metadata accessor for _XPCDecoder();
  uint64_t v50 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCDecoder);
  uint64_t v47 = v2;
  swift_retain();
  BOOL result = XPCCodableObject.init(from:)(&v47, (uint64_t)&v44);
  if (!v1)
  {
    uint64_t v8 = v44;
    float v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
    uint64_t v10 = v9(v6, v5);
    Swift::UInt v11 = MEMORY[0x2105634B0](v8);
    BOOL v12 = specialized Set.contains(_:)(v11, v10);
    swift_bridgeObjectRelease();
    if (!v12)
    {
      uint64_t v47 = 0;
      uint64_t v48 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(81);
      v29._countAndFlagsBits = 0x2065707954;
      v29._object = (void *)0xE500000000000000;
      String.append(_:)(v29);
      v30._countAndFlagsBits = 0x74616F6C46;
      v30._object = (void *)0xE500000000000000;
      String.append(_:)(v30);
      v31._countAndFlagsBits = 0xD000000000000028;
      v31._object = (void *)0x800000020DA312A0;
      String.append(_:)(v31);
      v9(v6, v5);
      v32._countAndFlagsBits = Set.description.getter();
      String.append(_:)(v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v33._countAndFlagsBits = 0xD00000000000001ELL;
      v33._object = (void *)0x800000020DA312D0;
      String.append(_:)(v33);
      *(void *)&uint64_t v44 = MEMORY[0x2105634B0](v8);
      _print_unlocked<A, B>(_:_:)();
      uint64_t v34 = v47;
      uint64_t v35 = (void *)v48;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8D5C8], v34, v35, v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
    uint64_t v51 = v8;
    uint64_t v13 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 8);
    uint64_t v41 = type metadata accessor for Optional();
    uint64_t v42 = &v40;
    uint64_t v14 = v8;
    uint64_t v15 = *(void *)(v41 - 8);
    uint64_t v16 = MEMORY[0x270FA5388](v14);
    uint64_t v18 = (char *)&v40 - v17;
    uint64_t v43 = v16;
    swift_unknownObjectRetain();
    v13(&v51, v6, v5);
    uint64_t v19 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v6) == 1)
    {
      (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v41);
      uint64_t v47 = 0;
      uint64_t v48 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      v20._object = (void *)0x800000020DA312F0;
      v20._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v20);
      v21._countAndFlagsBits = 0x74616F6C46;
      v21._object = (void *)0xE500000000000000;
      String.append(_:)(v21);
      v22._countAndFlagsBits = 0x206D6F726620;
      v22._object = (void *)0xE600000000000000;
      String.append(_:)(v22);
      *(void *)&uint64_t v44 = v43;
      _print_unlocked<A, B>(_:_:)();
      uint64_t v23 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v25 = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v23 - 8) + 104))(v25, *MEMORY[0x263F8DCB8], v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_14:
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    long long v45 = v6;
    uint64_t v46 = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v44);
    (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 32))(boxed_opaque_existential_1, v18, v6);
    outlined init with take of Encodable(&v44, (uint64_t)&v47);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v47, (uint64_t)&v44);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    if (swift_dynamicCast())
    {
      BYTE4(v51) = 0;
    }
    else
    {
      type metadata accessor for DecodingError();
      swift_allocError();
      Swift::String v39 = v38;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8D5C8], 0, (void *)0xE000000000000000, v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
    }
    swift_unknownObjectRelease();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v47);
  }
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  Swift::UInt v11;
  BOOL v12;
  void (*v13)(uint64_t *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t *boxed_opaque_existential_1;
  void *v38;
  void *v39;
  void v40[2];
  uint64_t v41;
  char v42;
  long long v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  uint64_t v2 = v0;
  uint64_t v3 = MEMORY[0x263F8D6C8];
  uint64_t v4 = swift_conformsToProtocol2();
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (v4) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 0;
  }
  if (!v6)
  {
    uint64_t v46 = 0;
    uint64_t v47 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    uint64_t v26 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v28 = v27;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v26 - 8) + 104))(v28, *MEMORY[0x263F8DCB8], v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  uint64_t v48 = type metadata accessor for _XPCDecoder();
  unint64_t v49 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCDecoder);
  uint64_t v46 = v2;
  swift_retain();
  BOOL result = XPCCodableObject.init(from:)(&v46, (uint64_t)&v43);
  if (!v1)
  {
    uint64_t v8 = v43;
    float v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
    uint64_t v10 = v9(v6, v5);
    Swift::UInt v11 = MEMORY[0x2105634B0](v8);
    BOOL v12 = specialized Set.contains(_:)(v11, v10);
    swift_bridgeObjectRelease();
    if (!v12)
    {
      uint64_t v46 = 0;
      uint64_t v47 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(81);
      v29._countAndFlagsBits = 0x2065707954;
      v29._object = (void *)0xE500000000000000;
      String.append(_:)(v29);
      v30._countAndFlagsBits = 7630409;
      v30._object = (void *)0xE300000000000000;
      String.append(_:)(v30);
      v31._countAndFlagsBits = 0xD000000000000028;
      v31._object = (void *)0x800000020DA312A0;
      String.append(_:)(v31);
      v9(v6, v5);
      v32._countAndFlagsBits = Set.description.getter();
      String.append(_:)(v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v33._countAndFlagsBits = 0xD00000000000001ELL;
      v33._object = (void *)0x800000020DA312D0;
      String.append(_:)(v33);
      *(void *)&uint64_t v43 = MEMORY[0x2105634B0](v8);
      _print_unlocked<A, B>(_:_:)();
      uint64_t v34 = v46;
      uint64_t v35 = (void *)v47;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8D6C8], v34, v35, v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
    uint64_t v41 = v8;
    uint64_t v13 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 8);
    v40[0] = type metadata accessor for Optional();
    v40[1] = v40;
    uint64_t v14 = v8;
    uint64_t v15 = *(void *)(v40[0] - 8);
    uint64_t v16 = MEMORY[0x270FA5388](v14);
    uint64_t v18 = (char *)v40 - v17;
    uint64_t v50 = v16;
    swift_unknownObjectRetain();
    v13(&v41, v6, v5);
    uint64_t v19 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v6) == 1)
    {
      (*(void (**)(char *, void))(v15 + 8))(v18, v40[0]);
      uint64_t v46 = 0;
      uint64_t v47 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      v20._object = (void *)0x800000020DA312F0;
      v20._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v20);
      v21._countAndFlagsBits = 7630409;
      v21._object = (void *)0xE300000000000000;
      String.append(_:)(v21);
      v22._countAndFlagsBits = 0x206D6F726620;
      v22._object = (void *)0xE600000000000000;
      String.append(_:)(v22);
      *(void *)&uint64_t v43 = v50;
      _print_unlocked<A, B>(_:_:)();
      uint64_t v23 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v25 = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v23 - 8) + 104))(v25, *MEMORY[0x263F8DCB8], v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_14:
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    uint64_t v44 = v6;
    long long v45 = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v43);
    (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 32))(boxed_opaque_existential_1, v18, v6);
    outlined init with take of Encodable(&v43, (uint64_t)&v46);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v46, (uint64_t)&v43);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    if (swift_dynamicCast())
    {
      uint64_t v42 = 0;
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v46);
      return v41;
    }
    else
    {
      type metadata accessor for DecodingError();
      swift_allocError();
      Swift::String v39 = v38;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8D6C8], 0, (void *)0xE000000000000000, v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v46);
    }
  }
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  Swift::UInt v11;
  BOOL v12;
  void (*v13)(uint64_t *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t *boxed_opaque_existential_1;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  long long v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  uint64_t v2 = v0;
  uint64_t v3 = MEMORY[0x263F8E498];
  uint64_t v4 = swift_conformsToProtocol2();
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (v4) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 0;
  }
  if (!v6)
  {
    uint64_t v47 = 0;
    uint64_t v48 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    uint64_t v26 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v28 = v27;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v26 - 8) + 104))(v28, *MEMORY[0x263F8DCB8], v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  unint64_t v49 = type metadata accessor for _XPCDecoder();
  uint64_t v50 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCDecoder);
  uint64_t v47 = v2;
  swift_retain();
  BOOL result = XPCCodableObject.init(from:)(&v47, (uint64_t)&v44);
  if (!v1)
  {
    uint64_t v8 = v44;
    float v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
    uint64_t v10 = v9(v6, v5);
    Swift::UInt v11 = MEMORY[0x2105634B0](v8);
    BOOL v12 = specialized Set.contains(_:)(v11, v10);
    swift_bridgeObjectRelease();
    if (!v12)
    {
      uint64_t v47 = 0;
      uint64_t v48 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(81);
      v29._countAndFlagsBits = 0x2065707954;
      v29._object = (void *)0xE500000000000000;
      String.append(_:)(v29);
      v30._countAndFlagsBits = 947154505;
      v30._object = (void *)0xE400000000000000;
      String.append(_:)(v30);
      v31._countAndFlagsBits = 0xD000000000000028;
      v31._object = (void *)0x800000020DA312A0;
      String.append(_:)(v31);
      v9(v6, v5);
      v32._countAndFlagsBits = Set.description.getter();
      String.append(_:)(v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v33._countAndFlagsBits = 0xD00000000000001ELL;
      v33._object = (void *)0x800000020DA312D0;
      String.append(_:)(v33);
      *(void *)&uint64_t v44 = MEMORY[0x2105634B0](v8);
      _print_unlocked<A, B>(_:_:)();
      uint64_t v34 = v47;
      uint64_t v35 = (void *)v48;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8E498], v34, v35, v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
    uint64_t v51 = v8;
    uint64_t v13 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 8);
    uint64_t v41 = type metadata accessor for Optional();
    uint64_t v42 = &v40;
    uint64_t v14 = v8;
    uint64_t v15 = *(void *)(v41 - 8);
    uint64_t v16 = MEMORY[0x270FA5388](v14);
    uint64_t v18 = (char *)&v40 - v17;
    uint64_t v43 = v16;
    swift_unknownObjectRetain();
    v13(&v51, v6, v5);
    uint64_t v19 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v6) == 1)
    {
      (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v41);
      uint64_t v47 = 0;
      uint64_t v48 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      v20._object = (void *)0x800000020DA312F0;
      v20._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v20);
      v21._countAndFlagsBits = 947154505;
      v21._object = (void *)0xE400000000000000;
      String.append(_:)(v21);
      v22._countAndFlagsBits = 0x206D6F726620;
      v22._object = (void *)0xE600000000000000;
      String.append(_:)(v22);
      *(void *)&uint64_t v44 = v43;
      _print_unlocked<A, B>(_:_:)();
      uint64_t v23 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v25 = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v23 - 8) + 104))(v25, *MEMORY[0x263F8DCB8], v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_14:
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    long long v45 = v6;
    uint64_t v46 = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v44);
    (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 32))(boxed_opaque_existential_1, v18, v6);
    outlined init with take of Encodable(&v44, (uint64_t)&v47);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v47, (uint64_t)&v44);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    if (swift_dynamicCast())
    {
      BYTE1(v51) = 0;
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v47);
      return v51;
    }
    else
    {
      type metadata accessor for DecodingError();
      swift_allocError();
      Swift::String v39 = v38;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8E498], 0, (void *)0xE000000000000000, v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v47);
    }
  }
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  Swift::UInt v11;
  BOOL v12;
  void (*v13)(uint64_t *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t *boxed_opaque_existential_1;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  long long v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  uint64_t v2 = v0;
  uint64_t v3 = MEMORY[0x263F8E4F0];
  uint64_t v4 = swift_conformsToProtocol2();
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (v4) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 0;
  }
  if (!v6)
  {
    uint64_t v47 = 0;
    uint64_t v48 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    uint64_t v26 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v28 = v27;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v26 - 8) + 104))(v28, *MEMORY[0x263F8DCB8], v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  unint64_t v49 = type metadata accessor for _XPCDecoder();
  uint64_t v50 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCDecoder);
  uint64_t v47 = v2;
  swift_retain();
  BOOL result = XPCCodableObject.init(from:)(&v47, (uint64_t)&v44);
  if (!v1)
  {
    uint64_t v8 = v44;
    float v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
    uint64_t v10 = v9(v6, v5);
    Swift::UInt v11 = MEMORY[0x2105634B0](v8);
    BOOL v12 = specialized Set.contains(_:)(v11, v10);
    swift_bridgeObjectRelease();
    if (!v12)
    {
      uint64_t v47 = 0;
      uint64_t v48 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(81);
      v29._countAndFlagsBits = 0x2065707954;
      v29._object = (void *)0xE500000000000000;
      String.append(_:)(v29);
      v30._countAndFlagsBits = 0x3631746E49;
      v30._object = (void *)0xE500000000000000;
      String.append(_:)(v30);
      v31._countAndFlagsBits = 0xD000000000000028;
      v31._object = (void *)0x800000020DA312A0;
      String.append(_:)(v31);
      v9(v6, v5);
      v32._countAndFlagsBits = Set.description.getter();
      String.append(_:)(v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v33._countAndFlagsBits = 0xD00000000000001ELL;
      v33._object = (void *)0x800000020DA312D0;
      String.append(_:)(v33);
      *(void *)&uint64_t v44 = MEMORY[0x2105634B0](v8);
      _print_unlocked<A, B>(_:_:)();
      uint64_t v34 = v47;
      uint64_t v35 = (void *)v48;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8E4F0], v34, v35, v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
    uint64_t v51 = v8;
    uint64_t v13 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 8);
    uint64_t v41 = type metadata accessor for Optional();
    uint64_t v42 = &v40;
    uint64_t v14 = v8;
    uint64_t v15 = *(void *)(v41 - 8);
    uint64_t v16 = MEMORY[0x270FA5388](v14);
    uint64_t v18 = (char *)&v40 - v17;
    uint64_t v43 = v16;
    swift_unknownObjectRetain();
    v13(&v51, v6, v5);
    uint64_t v19 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v6) == 1)
    {
      (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v41);
      uint64_t v47 = 0;
      uint64_t v48 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      v20._object = (void *)0x800000020DA312F0;
      v20._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v20);
      v21._countAndFlagsBits = 0x3631746E49;
      v21._object = (void *)0xE500000000000000;
      String.append(_:)(v21);
      v22._countAndFlagsBits = 0x206D6F726620;
      v22._object = (void *)0xE600000000000000;
      String.append(_:)(v22);
      *(void *)&uint64_t v44 = v43;
      _print_unlocked<A, B>(_:_:)();
      uint64_t v23 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v25 = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v23 - 8) + 104))(v25, *MEMORY[0x263F8DCB8], v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_14:
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    long long v45 = v6;
    uint64_t v46 = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v44);
    (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 32))(boxed_opaque_existential_1, v18, v6);
    outlined init with take of Encodable(&v44, (uint64_t)&v47);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v47, (uint64_t)&v44);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    if (swift_dynamicCast())
    {
      BYTE2(v51) = 0;
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v47);
      return (unsigned __int16)v51;
    }
    else
    {
      type metadata accessor for DecodingError();
      swift_allocError();
      Swift::String v39 = v38;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8E4F0], 0, (void *)0xE000000000000000, v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v47);
    }
  }
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  Swift::UInt v11;
  BOOL v12;
  void (*v13)(uint64_t *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t *boxed_opaque_existential_1;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  long long v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  uint64_t v2 = v0;
  uint64_t v3 = MEMORY[0x263F8E548];
  uint64_t v4 = swift_conformsToProtocol2();
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (v4) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 0;
  }
  if (!v6)
  {
    uint64_t v47 = 0;
    uint64_t v48 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    uint64_t v26 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v28 = v27;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v26 - 8) + 104))(v28, *MEMORY[0x263F8DCB8], v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  unint64_t v49 = type metadata accessor for _XPCDecoder();
  uint64_t v50 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCDecoder);
  uint64_t v47 = v2;
  swift_retain();
  BOOL result = XPCCodableObject.init(from:)(&v47, (uint64_t)&v44);
  if (!v1)
  {
    uint64_t v8 = v44;
    float v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
    uint64_t v10 = v9(v6, v5);
    Swift::UInt v11 = MEMORY[0x2105634B0](v8);
    BOOL v12 = specialized Set.contains(_:)(v11, v10);
    swift_bridgeObjectRelease();
    if (!v12)
    {
      uint64_t v47 = 0;
      uint64_t v48 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(81);
      v29._countAndFlagsBits = 0x2065707954;
      v29._object = (void *)0xE500000000000000;
      String.append(_:)(v29);
      v30._countAndFlagsBits = 0x3233746E49;
      v30._object = (void *)0xE500000000000000;
      String.append(_:)(v30);
      v31._countAndFlagsBits = 0xD000000000000028;
      v31._object = (void *)0x800000020DA312A0;
      String.append(_:)(v31);
      v9(v6, v5);
      v32._countAndFlagsBits = Set.description.getter();
      String.append(_:)(v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v33._countAndFlagsBits = 0xD00000000000001ELL;
      v33._object = (void *)0x800000020DA312D0;
      String.append(_:)(v33);
      *(void *)&uint64_t v44 = MEMORY[0x2105634B0](v8);
      _print_unlocked<A, B>(_:_:)();
      uint64_t v34 = v47;
      uint64_t v35 = (void *)v48;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8E548], v34, v35, v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
    uint64_t v51 = v8;
    uint64_t v13 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 8);
    uint64_t v41 = type metadata accessor for Optional();
    uint64_t v42 = &v40;
    uint64_t v14 = v8;
    uint64_t v15 = *(void *)(v41 - 8);
    uint64_t v16 = MEMORY[0x270FA5388](v14);
    uint64_t v18 = (char *)&v40 - v17;
    uint64_t v43 = v16;
    swift_unknownObjectRetain();
    v13(&v51, v6, v5);
    uint64_t v19 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v6) == 1)
    {
      (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v41);
      uint64_t v47 = 0;
      uint64_t v48 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      v20._object = (void *)0x800000020DA312F0;
      v20._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v20);
      v21._countAndFlagsBits = 0x3233746E49;
      v21._object = (void *)0xE500000000000000;
      String.append(_:)(v21);
      v22._countAndFlagsBits = 0x206D6F726620;
      v22._object = (void *)0xE600000000000000;
      String.append(_:)(v22);
      *(void *)&uint64_t v44 = v43;
      _print_unlocked<A, B>(_:_:)();
      uint64_t v23 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v25 = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v23 - 8) + 104))(v25, *MEMORY[0x263F8DCB8], v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_14:
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    long long v45 = v6;
    uint64_t v46 = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v44);
    (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 32))(boxed_opaque_existential_1, v18, v6);
    outlined init with take of Encodable(&v44, (uint64_t)&v47);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v47, (uint64_t)&v44);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    if (swift_dynamicCast())
    {
      BYTE4(v51) = 0;
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v47);
      return v51;
    }
    else
    {
      type metadata accessor for DecodingError();
      swift_allocError();
      Swift::String v39 = v38;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8E548], 0, (void *)0xE000000000000000, v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v47);
    }
  }
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  Swift::UInt v11;
  BOOL v12;
  void (*v13)(uint64_t *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t *boxed_opaque_existential_1;
  void *v38;
  void *v39;
  void v40[2];
  uint64_t v41;
  char v42;
  long long v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  uint64_t v2 = v0;
  uint64_t v3 = MEMORY[0x263F8E5C0];
  uint64_t v4 = swift_conformsToProtocol2();
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (v4) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 0;
  }
  if (!v6)
  {
    uint64_t v46 = 0;
    uint64_t v47 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    uint64_t v26 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v28 = v27;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v26 - 8) + 104))(v28, *MEMORY[0x263F8DCB8], v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  uint64_t v48 = type metadata accessor for _XPCDecoder();
  unint64_t v49 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCDecoder);
  uint64_t v46 = v2;
  swift_retain();
  BOOL result = XPCCodableObject.init(from:)(&v46, (uint64_t)&v43);
  if (!v1)
  {
    uint64_t v8 = v43;
    float v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
    uint64_t v10 = v9(v6, v5);
    Swift::UInt v11 = MEMORY[0x2105634B0](v8);
    BOOL v12 = specialized Set.contains(_:)(v11, v10);
    swift_bridgeObjectRelease();
    if (!v12)
    {
      uint64_t v46 = 0;
      uint64_t v47 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(81);
      v29._countAndFlagsBits = 0x2065707954;
      v29._object = (void *)0xE500000000000000;
      String.append(_:)(v29);
      v30._countAndFlagsBits = 0x3436746E49;
      v30._object = (void *)0xE500000000000000;
      String.append(_:)(v30);
      v31._countAndFlagsBits = 0xD000000000000028;
      v31._object = (void *)0x800000020DA312A0;
      String.append(_:)(v31);
      v9(v6, v5);
      v32._countAndFlagsBits = Set.description.getter();
      String.append(_:)(v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v33._countAndFlagsBits = 0xD00000000000001ELL;
      v33._object = (void *)0x800000020DA312D0;
      String.append(_:)(v33);
      *(void *)&uint64_t v43 = MEMORY[0x2105634B0](v8);
      _print_unlocked<A, B>(_:_:)();
      uint64_t v34 = v46;
      uint64_t v35 = (void *)v47;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8E5C0], v34, v35, v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
    uint64_t v41 = v8;
    uint64_t v13 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 8);
    v40[0] = type metadata accessor for Optional();
    v40[1] = v40;
    uint64_t v14 = v8;
    uint64_t v15 = *(void *)(v40[0] - 8);
    uint64_t v16 = MEMORY[0x270FA5388](v14);
    uint64_t v18 = (char *)v40 - v17;
    uint64_t v50 = v16;
    swift_unknownObjectRetain();
    v13(&v41, v6, v5);
    uint64_t v19 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v6) == 1)
    {
      (*(void (**)(char *, void))(v15 + 8))(v18, v40[0]);
      uint64_t v46 = 0;
      uint64_t v47 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      v20._object = (void *)0x800000020DA312F0;
      v20._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v20);
      v21._countAndFlagsBits = 0x3436746E49;
      v21._object = (void *)0xE500000000000000;
      String.append(_:)(v21);
      v22._countAndFlagsBits = 0x206D6F726620;
      v22._object = (void *)0xE600000000000000;
      String.append(_:)(v22);
      *(void *)&uint64_t v43 = v50;
      _print_unlocked<A, B>(_:_:)();
      uint64_t v23 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v25 = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v23 - 8) + 104))(v25, *MEMORY[0x263F8DCB8], v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_14:
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    uint64_t v44 = v6;
    long long v45 = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v43);
    (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 32))(boxed_opaque_existential_1, v18, v6);
    outlined init with take of Encodable(&v43, (uint64_t)&v46);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v46, (uint64_t)&v43);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    if (swift_dynamicCast())
    {
      uint64_t v42 = 0;
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v46);
      return v41;
    }
    else
    {
      type metadata accessor for DecodingError();
      swift_allocError();
      Swift::String v39 = v38;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8E5C0], 0, (void *)0xE000000000000000, v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v46);
    }
  }
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  Swift::UInt v11;
  BOOL v12;
  void (*v13)(uint64_t *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t *boxed_opaque_existential_1;
  void *v38;
  void *v39;
  void v40[2];
  uint64_t v41;
  char v42;
  long long v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  uint64_t v2 = v0;
  uint64_t v3 = MEMORY[0x263F8D9D0];
  uint64_t v4 = swift_conformsToProtocol2();
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (v4) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 0;
  }
  if (!v6)
  {
    uint64_t v46 = 0;
    uint64_t v47 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    uint64_t v26 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v28 = v27;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v26 - 8) + 104))(v28, *MEMORY[0x263F8DCB8], v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  uint64_t v48 = type metadata accessor for _XPCDecoder();
  unint64_t v49 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCDecoder);
  uint64_t v46 = v2;
  swift_retain();
  BOOL result = XPCCodableObject.init(from:)(&v46, (uint64_t)&v43);
  if (!v1)
  {
    uint64_t v8 = v43;
    float v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
    uint64_t v10 = v9(v6, v5);
    Swift::UInt v11 = MEMORY[0x2105634B0](v8);
    BOOL v12 = specialized Set.contains(_:)(v11, v10);
    swift_bridgeObjectRelease();
    if (!v12)
    {
      uint64_t v46 = 0;
      uint64_t v47 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(81);
      v29._countAndFlagsBits = 0x2065707954;
      v29._object = (void *)0xE500000000000000;
      String.append(_:)(v29);
      v30._countAndFlagsBits = 1953384789;
      v30._object = (void *)0xE400000000000000;
      String.append(_:)(v30);
      v31._countAndFlagsBits = 0xD000000000000028;
      v31._object = (void *)0x800000020DA312A0;
      String.append(_:)(v31);
      v9(v6, v5);
      v32._countAndFlagsBits = Set.description.getter();
      String.append(_:)(v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v33._countAndFlagsBits = 0xD00000000000001ELL;
      v33._object = (void *)0x800000020DA312D0;
      String.append(_:)(v33);
      *(void *)&uint64_t v43 = MEMORY[0x2105634B0](v8);
      _print_unlocked<A, B>(_:_:)();
      uint64_t v34 = v46;
      uint64_t v35 = (void *)v47;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8D9D0], v34, v35, v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
    uint64_t v41 = v8;
    uint64_t v13 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 8);
    v40[0] = type metadata accessor for Optional();
    v40[1] = v40;
    uint64_t v14 = v8;
    uint64_t v15 = *(void *)(v40[0] - 8);
    uint64_t v16 = MEMORY[0x270FA5388](v14);
    uint64_t v18 = (char *)v40 - v17;
    uint64_t v50 = v16;
    swift_unknownObjectRetain();
    v13(&v41, v6, v5);
    uint64_t v19 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v6) == 1)
    {
      (*(void (**)(char *, void))(v15 + 8))(v18, v40[0]);
      uint64_t v46 = 0;
      uint64_t v47 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      v20._object = (void *)0x800000020DA312F0;
      v20._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v20);
      v21._countAndFlagsBits = 1953384789;
      v21._object = (void *)0xE400000000000000;
      String.append(_:)(v21);
      v22._countAndFlagsBits = 0x206D6F726620;
      v22._object = (void *)0xE600000000000000;
      String.append(_:)(v22);
      *(void *)&uint64_t v43 = v50;
      _print_unlocked<A, B>(_:_:)();
      uint64_t v23 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v25 = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v23 - 8) + 104))(v25, *MEMORY[0x263F8DCB8], v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_14:
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    uint64_t v44 = v6;
    long long v45 = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v43);
    (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 32))(boxed_opaque_existential_1, v18, v6);
    outlined init with take of Encodable(&v43, (uint64_t)&v46);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v46, (uint64_t)&v43);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    if (swift_dynamicCast())
    {
      uint64_t v42 = 0;
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v46);
      return v41;
    }
    else
    {
      type metadata accessor for DecodingError();
      swift_allocError();
      Swift::String v39 = v38;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8D9D0], 0, (void *)0xE000000000000000, v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v46);
    }
  }
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  Swift::UInt v11;
  BOOL v12;
  void (*v13)(uint64_t *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t *boxed_opaque_existential_1;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  long long v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  uint64_t v2 = v0;
  uint64_t v3 = MEMORY[0x263F8E778];
  uint64_t v4 = swift_conformsToProtocol2();
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (v4) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 0;
  }
  if (!v6)
  {
    uint64_t v47 = 0;
    uint64_t v48 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    uint64_t v26 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v28 = v27;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v26 - 8) + 104))(v28, *MEMORY[0x263F8DCB8], v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  unint64_t v49 = type metadata accessor for _XPCDecoder();
  uint64_t v50 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCDecoder);
  uint64_t v47 = v2;
  swift_retain();
  BOOL result = XPCCodableObject.init(from:)(&v47, (uint64_t)&v44);
  if (!v1)
  {
    uint64_t v8 = v44;
    float v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
    uint64_t v10 = v9(v6, v5);
    Swift::UInt v11 = MEMORY[0x2105634B0](v8);
    BOOL v12 = specialized Set.contains(_:)(v11, v10);
    swift_bridgeObjectRelease();
    if (!v12)
    {
      uint64_t v47 = 0;
      uint64_t v48 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(81);
      v29._countAndFlagsBits = 0x2065707954;
      v29._object = (void *)0xE500000000000000;
      String.append(_:)(v29);
      v30._countAndFlagsBits = 0x38746E4955;
      v30._object = (void *)0xE500000000000000;
      String.append(_:)(v30);
      v31._countAndFlagsBits = 0xD000000000000028;
      v31._object = (void *)0x800000020DA312A0;
      String.append(_:)(v31);
      v9(v6, v5);
      v32._countAndFlagsBits = Set.description.getter();
      String.append(_:)(v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v33._countAndFlagsBits = 0xD00000000000001ELL;
      v33._object = (void *)0x800000020DA312D0;
      String.append(_:)(v33);
      *(void *)&uint64_t v44 = MEMORY[0x2105634B0](v8);
      _print_unlocked<A, B>(_:_:)();
      uint64_t v34 = v47;
      uint64_t v35 = (void *)v48;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8E778], v34, v35, v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
    uint64_t v51 = v8;
    uint64_t v13 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 8);
    uint64_t v41 = type metadata accessor for Optional();
    uint64_t v42 = &v40;
    uint64_t v14 = v8;
    uint64_t v15 = *(void *)(v41 - 8);
    uint64_t v16 = MEMORY[0x270FA5388](v14);
    uint64_t v18 = (char *)&v40 - v17;
    uint64_t v43 = v16;
    swift_unknownObjectRetain();
    v13(&v51, v6, v5);
    uint64_t v19 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v6) == 1)
    {
      (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v41);
      uint64_t v47 = 0;
      uint64_t v48 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      v20._object = (void *)0x800000020DA312F0;
      v20._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v20);
      v21._countAndFlagsBits = 0x38746E4955;
      v21._object = (void *)0xE500000000000000;
      String.append(_:)(v21);
      v22._countAndFlagsBits = 0x206D6F726620;
      v22._object = (void *)0xE600000000000000;
      String.append(_:)(v22);
      *(void *)&uint64_t v44 = v43;
      _print_unlocked<A, B>(_:_:)();
      uint64_t v23 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v25 = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v23 - 8) + 104))(v25, *MEMORY[0x263F8DCB8], v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_14:
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    long long v45 = v6;
    uint64_t v46 = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v44);
    (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 32))(boxed_opaque_existential_1, v18, v6);
    outlined init with take of Encodable(&v44, (uint64_t)&v47);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v47, (uint64_t)&v44);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    if (swift_dynamicCast())
    {
      BYTE1(v51) = 0;
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v47);
      return v51;
    }
    else
    {
      type metadata accessor for DecodingError();
      swift_allocError();
      Swift::String v39 = v38;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8E778], 0, (void *)0xE000000000000000, v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v47);
    }
  }
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  Swift::UInt v11;
  BOOL v12;
  void (*v13)(uint64_t *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t *boxed_opaque_existential_1;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  long long v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  uint64_t v2 = v0;
  uint64_t v3 = MEMORY[0x263F8E888];
  uint64_t v4 = swift_conformsToProtocol2();
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (v4) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 0;
  }
  if (!v6)
  {
    uint64_t v47 = 0;
    uint64_t v48 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    uint64_t v26 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v28 = v27;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v26 - 8) + 104))(v28, *MEMORY[0x263F8DCB8], v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  unint64_t v49 = type metadata accessor for _XPCDecoder();
  uint64_t v50 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCDecoder);
  uint64_t v47 = v2;
  swift_retain();
  BOOL result = XPCCodableObject.init(from:)(&v47, (uint64_t)&v44);
  if (!v1)
  {
    uint64_t v8 = v44;
    float v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
    uint64_t v10 = v9(v6, v5);
    Swift::UInt v11 = MEMORY[0x2105634B0](v8);
    BOOL v12 = specialized Set.contains(_:)(v11, v10);
    swift_bridgeObjectRelease();
    if (!v12)
    {
      uint64_t v47 = 0;
      uint64_t v48 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(81);
      v29._countAndFlagsBits = 0x2065707954;
      v29._object = (void *)0xE500000000000000;
      String.append(_:)(v29);
      v30._countAndFlagsBits = 0x3631746E4955;
      v30._object = (void *)0xE600000000000000;
      String.append(_:)(v30);
      v31._countAndFlagsBits = 0xD000000000000028;
      v31._object = (void *)0x800000020DA312A0;
      String.append(_:)(v31);
      v9(v6, v5);
      v32._countAndFlagsBits = Set.description.getter();
      String.append(_:)(v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v33._countAndFlagsBits = 0xD00000000000001ELL;
      v33._object = (void *)0x800000020DA312D0;
      String.append(_:)(v33);
      *(void *)&uint64_t v44 = MEMORY[0x2105634B0](v8);
      _print_unlocked<A, B>(_:_:)();
      uint64_t v34 = v47;
      uint64_t v35 = (void *)v48;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8E888], v34, v35, v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
    uint64_t v51 = v8;
    uint64_t v13 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 8);
    uint64_t v41 = type metadata accessor for Optional();
    uint64_t v42 = &v40;
    uint64_t v14 = v8;
    uint64_t v15 = *(void *)(v41 - 8);
    uint64_t v16 = MEMORY[0x270FA5388](v14);
    uint64_t v18 = (char *)&v40 - v17;
    uint64_t v43 = v16;
    swift_unknownObjectRetain();
    v13(&v51, v6, v5);
    uint64_t v19 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v6) == 1)
    {
      (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v41);
      uint64_t v47 = 0;
      uint64_t v48 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      v20._object = (void *)0x800000020DA312F0;
      v20._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v20);
      v21._countAndFlagsBits = 0x3631746E4955;
      v21._object = (void *)0xE600000000000000;
      String.append(_:)(v21);
      v22._countAndFlagsBits = 0x206D6F726620;
      v22._object = (void *)0xE600000000000000;
      String.append(_:)(v22);
      *(void *)&uint64_t v44 = v43;
      _print_unlocked<A, B>(_:_:)();
      uint64_t v23 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v25 = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v23 - 8) + 104))(v25, *MEMORY[0x263F8DCB8], v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_14:
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    long long v45 = v6;
    uint64_t v46 = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v44);
    (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 32))(boxed_opaque_existential_1, v18, v6);
    outlined init with take of Encodable(&v44, (uint64_t)&v47);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v47, (uint64_t)&v44);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    if (swift_dynamicCast())
    {
      BYTE2(v51) = 0;
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v47);
      return (unsigned __int16)v51;
    }
    else
    {
      type metadata accessor for DecodingError();
      swift_allocError();
      Swift::String v39 = v38;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8E888], 0, (void *)0xE000000000000000, v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v47);
    }
  }
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  Swift::UInt v11;
  BOOL v12;
  void (*v13)(uint64_t *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t *boxed_opaque_existential_1;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  long long v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  uint64_t v2 = v0;
  uint64_t v3 = MEMORY[0x263F8E8F8];
  uint64_t v4 = swift_conformsToProtocol2();
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (v4) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 0;
  }
  if (!v6)
  {
    uint64_t v47 = 0;
    uint64_t v48 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    uint64_t v26 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v28 = v27;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v26 - 8) + 104))(v28, *MEMORY[0x263F8DCB8], v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  unint64_t v49 = type metadata accessor for _XPCDecoder();
  uint64_t v50 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCDecoder);
  uint64_t v47 = v2;
  swift_retain();
  BOOL result = XPCCodableObject.init(from:)(&v47, (uint64_t)&v44);
  if (!v1)
  {
    uint64_t v8 = v44;
    float v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
    uint64_t v10 = v9(v6, v5);
    Swift::UInt v11 = MEMORY[0x2105634B0](v8);
    BOOL v12 = specialized Set.contains(_:)(v11, v10);
    swift_bridgeObjectRelease();
    if (!v12)
    {
      uint64_t v47 = 0;
      uint64_t v48 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(81);
      v29._countAndFlagsBits = 0x2065707954;
      v29._object = (void *)0xE500000000000000;
      String.append(_:)(v29);
      v30._countAndFlagsBits = 0x3233746E4955;
      v30._object = (void *)0xE600000000000000;
      String.append(_:)(v30);
      v31._countAndFlagsBits = 0xD000000000000028;
      v31._object = (void *)0x800000020DA312A0;
      String.append(_:)(v31);
      v9(v6, v5);
      v32._countAndFlagsBits = Set.description.getter();
      String.append(_:)(v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v33._countAndFlagsBits = 0xD00000000000001ELL;
      v33._object = (void *)0x800000020DA312D0;
      String.append(_:)(v33);
      *(void *)&uint64_t v44 = MEMORY[0x2105634B0](v8);
      _print_unlocked<A, B>(_:_:)();
      uint64_t v34 = v47;
      uint64_t v35 = (void *)v48;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8E8F8], v34, v35, v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
    uint64_t v51 = v8;
    uint64_t v13 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 8);
    uint64_t v41 = type metadata accessor for Optional();
    uint64_t v42 = &v40;
    uint64_t v14 = v8;
    uint64_t v15 = *(void *)(v41 - 8);
    uint64_t v16 = MEMORY[0x270FA5388](v14);
    uint64_t v18 = (char *)&v40 - v17;
    uint64_t v43 = v16;
    swift_unknownObjectRetain();
    v13(&v51, v6, v5);
    uint64_t v19 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v6) == 1)
    {
      (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v41);
      uint64_t v47 = 0;
      uint64_t v48 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      v20._object = (void *)0x800000020DA312F0;
      v20._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v20);
      v21._countAndFlagsBits = 0x3233746E4955;
      v21._object = (void *)0xE600000000000000;
      String.append(_:)(v21);
      v22._countAndFlagsBits = 0x206D6F726620;
      v22._object = (void *)0xE600000000000000;
      String.append(_:)(v22);
      *(void *)&uint64_t v44 = v43;
      _print_unlocked<A, B>(_:_:)();
      uint64_t v23 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v25 = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v23 - 8) + 104))(v25, *MEMORY[0x263F8DCB8], v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_14:
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    long long v45 = v6;
    uint64_t v46 = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v44);
    (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 32))(boxed_opaque_existential_1, v18, v6);
    outlined init with take of Encodable(&v44, (uint64_t)&v47);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v47, (uint64_t)&v44);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    if (swift_dynamicCast())
    {
      BYTE4(v51) = 0;
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v47);
      return v51;
    }
    else
    {
      type metadata accessor for DecodingError();
      swift_allocError();
      Swift::String v39 = v38;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8E8F8], 0, (void *)0xE000000000000000, v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v47);
    }
  }
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  Swift::UInt v11;
  BOOL v12;
  void (*v13)(uint64_t *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::String v29;
  Swift::String v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t *boxed_opaque_existential_1;
  void *v38;
  void *v39;
  void v40[2];
  uint64_t v41;
  char v42;
  long long v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  uint64_t v2 = v0;
  uint64_t v3 = MEMORY[0x263F8E970];
  uint64_t v4 = swift_conformsToProtocol2();
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (v4) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 0;
  }
  if (!v6)
  {
    uint64_t v46 = 0;
    uint64_t v47 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    uint64_t v26 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v28 = v27;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v26 - 8) + 104))(v28, *MEMORY[0x263F8DCB8], v26);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  uint64_t v48 = type metadata accessor for _XPCDecoder();
  unint64_t v49 = lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCDecoder);
  uint64_t v46 = v2;
  swift_retain();
  BOOL result = XPCCodableObject.init(from:)(&v46, (uint64_t)&v43);
  if (!v1)
  {
    uint64_t v8 = v43;
    float v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
    uint64_t v10 = v9(v6, v5);
    Swift::UInt v11 = MEMORY[0x2105634B0](v8);
    BOOL v12 = specialized Set.contains(_:)(v11, v10);
    swift_bridgeObjectRelease();
    if (!v12)
    {
      uint64_t v46 = 0;
      uint64_t v47 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(81);
      v29._countAndFlagsBits = 0x2065707954;
      v29._object = (void *)0xE500000000000000;
      String.append(_:)(v29);
      v30._countAndFlagsBits = 0x3436746E4955;
      v30._object = (void *)0xE600000000000000;
      String.append(_:)(v30);
      v31._countAndFlagsBits = 0xD000000000000028;
      v31._object = (void *)0x800000020DA312A0;
      String.append(_:)(v31);
      v9(v6, v5);
      v32._countAndFlagsBits = Set.description.getter();
      String.append(_:)(v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v33._countAndFlagsBits = 0xD00000000000001ELL;
      v33._object = (void *)0x800000020DA312D0;
      String.append(_:)(v33);
      *(void *)&uint64_t v43 = MEMORY[0x2105634B0](v8);
      _print_unlocked<A, B>(_:_:)();
      uint64_t v34 = v46;
      uint64_t v35 = (void *)v47;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8E970], v34, v35, v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
    uint64_t v41 = v8;
    uint64_t v13 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 8);
    v40[0] = type metadata accessor for Optional();
    v40[1] = v40;
    uint64_t v14 = v8;
    uint64_t v15 = *(void *)(v40[0] - 8);
    uint64_t v16 = MEMORY[0x270FA5388](v14);
    uint64_t v18 = (char *)v40 - v17;
    uint64_t v50 = v16;
    swift_unknownObjectRetain();
    v13(&v41, v6, v5);
    uint64_t v19 = *(void *)(v6 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v6) == 1)
    {
      (*(void (**)(char *, void))(v15 + 8))(v18, v40[0]);
      uint64_t v46 = 0;
      uint64_t v47 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      v20._object = (void *)0x800000020DA312F0;
      v20._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v20);
      v21._countAndFlagsBits = 0x3436746E4955;
      v21._object = (void *)0xE600000000000000;
      String.append(_:)(v21);
      v22._countAndFlagsBits = 0x206D6F726620;
      v22._object = (void *)0xE600000000000000;
      String.append(_:)(v22);
      *(void *)&uint64_t v43 = v50;
      _print_unlocked<A, B>(_:_:)();
      uint64_t v23 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v25 = v24;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v23 - 8) + 104))(v25, *MEMORY[0x263F8DCB8], v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_14:
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    uint64_t v44 = v6;
    long long v45 = v5;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v43);
    (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 32))(boxed_opaque_existential_1, v18, v6);
    outlined init with take of Encodable(&v43, (uint64_t)&v46);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v46, (uint64_t)&v43);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    if (swift_dynamicCast())
    {
      uint64_t v42 = 0;
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v46);
      return v41;
    }
    else
    {
      type metadata accessor for DecodingError();
      swift_allocError();
      Swift::String v39 = v38;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      typeMismatchError(codingMetadata:type:message:)(MEMORY[0x263F8E970], 0, (void *)0xE000000000000000, v39);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v46);
    }
  }
  return result;
}

uint64_t XPCArray.init(_:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = MEMORY[0x2105634B0]();
  if (result == MEMORY[0x263EF86D8]) {
    *a2 = a1;
  }
  else {
    __break(1u);
  }
  return result;
}

xpc_object_t XPCArray.init()@<X0>(void *a1@<X8>)
{
  xpc_object_t result = xpc_array_create_empty();
  *a1 = result;
  return result;
}

uint64_t XPCArray.withUnsafeUnderlyingArray<A>(_:)(uint64_t (*a1)(void))
{
  return a1(*v1);
}

uint64_t XPCArray.subscript.getter@<X0>(size_t index@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  xpc_object_t v6 = xpc_array_get_value(*v3, index);
  if (v6)
  {
    char v7 = v6;
    uint64_t v8 = MEMORY[0x2105634B0]();
    if (v8 == MEMORY[0x263EF8738])
    {
      xpc_int64_get_value(v7);
      lazy protocol witness table accessor for type Int64 and conformance Int64();
    }
    else
    {
      if (v8 != MEMORY[0x263EF87A0])
      {
        if (v8 == MEMORY[0x263EF8710])
        {
          xpc_double_get_value(v7);
          lazy protocol witness table accessor for type Double and conformance Double();
          dispatch thunk of BinaryInteger.init<A>(exactly:)();
        }
        else
        {
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56))(a3, 1, 1, a2);
        }
        return swift_unknownObjectRelease();
      }
      xpc_uint64_get_value(v7);
      lazy protocol witness table accessor for type UInt64 and conformance UInt64();
    }
    dispatch thunk of Numeric.init<A>(exactly:)();
    return swift_unknownObjectRelease();
  }
  float v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56);

  return v9(a3, 1, 1, a2);
}

{
  xpc_object_t *v3;
  xpc_object_t v6;
  void *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t vars8;

  xpc_object_t v6 = xpc_array_get_value(*v3, index);
  if (v6)
  {
    char v7 = v6;
    uint64_t v8 = MEMORY[0x2105634B0]();
    if (v8 == MEMORY[0x263EF8738])
    {
      xpc_int64_get_value(v7);
      lazy protocol witness table accessor for type Int64 and conformance Int64();
    }
    else
    {
      if (v8 != MEMORY[0x263EF87A0])
      {
        if (v8 == MEMORY[0x263EF8710])
        {
          xpc_double_get_value(v7);
          lazy protocol witness table accessor for type Double and conformance Double();
          dispatch thunk of BinaryFloatingPoint.init<A>(exactly:)();
        }
        else
        {
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56))(a3, 1, 1, a2);
        }
        return swift_unknownObjectRelease();
      }
      xpc_uint64_get_value(v7);
      lazy protocol witness table accessor for type UInt64 and conformance UInt64();
    }
    dispatch thunk of FloatingPoint.init<A>(exactly:)();
    return swift_unknownObjectRelease();
  }
  float v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56);

  return v9(a3, 1, 1, a2);
}

id XPCArray.subscript.getter(size_t index)
{
  xpc_object_t value = xpc_array_get_value(*v1, index);

  return value;
}

{
  xpc_object_t *v1;
  xpc_object_t value;
  uint64_t vars8;

  xpc_object_t value = xpc_array_get_value(*v1, index);

  return value;
}

unint64_t lazy protocol witness table accessor for type Double and conformance Double()
{
  unint64_t result = lazy protocol witness table cache variable for type Double and conformance Double;
  if (!lazy protocol witness table cache variable for type Double and conformance Double)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Double and conformance Double);
  }
  return result;
}

uint64_t XPCArray.subscript.setter(uint64_t a1, size_t a2, uint64_t a3, uint64_t a4)
{
  return XPCArray.subscript.setter(a1, a2, a3, a4, (void (*)(char *, char *))partial apply for implicit closure #1 in XPCArray.subscript.setter, MEMORY[0x263F8E5C0], MEMORY[0x263EF8B18]);
}

{
  return XPCArray.subscript.setter(a1, a2, a3, a4, (void (*)(char *, char *))partial apply for implicit closure #1 in XPCArray.subscript.setter, MEMORY[0x263F8E970], MEMORY[0x263EF8B20]);
}

{
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t vars8;

  specialized XPCArray.subscript.setter(a1, a2, a3, a4);
  uint64_t v5 = type metadata accessor for Optional();
  xpc_object_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(a1, v5);
}

uint64_t implicit closure #1 in XPCArray.subscript.setter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v69 = a4;
  int64_t v66 = *(void *)(*(void *)(*(void *)(a3 + 8) + 24) + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v65 = (char *)&v60 - v7;
  uint64_t v8 = *(void *)(a2 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  v63 = (char *)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  long long v64 = (char *)&v60 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v60 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v67 = (char *)&v60 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  unint64_t v68 = (char *)&v60 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  Swift::String v22 = (char *)&v60 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v25 = (char *)&v60 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v60 - v26;
  uint64_t v70 = v8;
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v28((char *)&v60 - v26, a1, a2);
  LOBYTE(a1) = dispatch thunk of static BinaryInteger.isSigned.getter();
  v28(v25, (uint64_t)v27, a2);
  v71 = v15;
  BOOL v29 = (a1 & 1) != 0 && dispatch thunk of BinaryInteger.bitWidth.getter() > 64;
  Swift::String v30 = v25;
  Swift::String v31 = *(void (**)(char *, uint64_t))(v70 + 8);
  v31(v30, a2);
  v28(v22, (uint64_t)v27, a2);
  if (!v29)
  {
    v31(v22, a2);
    goto LABEL_9;
  }
  int64_t v73 = 0x8000000000000000;
  if (dispatch thunk of static BinaryInteger.isSigned.getter())
  {
    if (dispatch thunk of BinaryInteger.bitWidth.getter() < 64)
    {
      uint64_t v32 = dispatch thunk of BinaryInteger._lowWord.getter();
      Swift::String v33 = v22;
      uint64_t v34 = a2;
LABEL_31:
      v31(v33, v34);
      if (v32 < v73) {
        goto LABEL_32;
      }
      goto LABEL_9;
    }
    lazy protocol witness table accessor for type Int64 and conformance Int64();
    dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
    char v48 = dispatch thunk of static Comparable.< infix(_:_:)();
    v31(v68, a2);
LABEL_26:
    v31(v22, a2);
    if (v48) {
      goto LABEL_32;
    }
    goto LABEL_9;
  }
  uint64_t v61 = v31;
  char v45 = dispatch thunk of static BinaryInteger.isSigned.getter();
  uint64_t v46 = dispatch thunk of BinaryInteger.bitWidth.getter();
  if ((v45 & 1) == 0)
  {
    if (v46 >= 64)
    {
      Swift::String v31 = v61;
      v61(v22, a2);
      goto LABEL_9;
    }
    uint64_t v32 = dispatch thunk of BinaryInteger._lowWord.getter();
    Swift::String v33 = v22;
    uint64_t v34 = a2;
    Swift::String v31 = v61;
    goto LABEL_31;
  }
  if (v46 > 64)
  {
    lazy protocol witness table accessor for type Int64 and conformance Int64();
    uint64_t v47 = v68;
    dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
    char v48 = dispatch thunk of static Comparable.< infix(_:_:)();
    unint64_t v49 = v47;
    Swift::String v31 = v61;
    v61(v49, a2);
    goto LABEL_26;
  }
  swift_getAssociatedConformanceWitness();
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
  Swift::String v56 = v68;
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
  LODWORD(v66) = dispatch thunk of static Comparable.< infix(_:_:)();
  uint64_t v57 = v56;
  Swift::String v31 = v61;
  v61(v57, a2);
  uint64_t v58 = v63;
  (*(void (**)(char *, char *, uint64_t))(v70 + 32))(v63, v22, a2);
  if (v66)
  {
    v31(v58, a2);
    uint64_t v52 = 0;
    char v53 = 1;
    goto LABEL_33;
  }
  int64_t v66 = v73;
  uint64_t v59 = dispatch thunk of BinaryInteger._lowWord.getter();
  v31(v58, a2);
  if (v59 < v66)
  {
LABEL_32:
    uint64_t v52 = 0;
    char v53 = 1;
LABEL_33:
    uint64_t v37 = v69;
    goto LABEL_37;
  }
LABEL_9:
  uint64_t v35 = dispatch thunk of BinaryInteger.bitWidth.getter();
  uint64_t v36 = v67;
  v28(v67, (uint64_t)v27, a2);
  if (v35 < 65)
  {
    uint64_t v38 = dispatch thunk of BinaryInteger.bitWidth.getter();
    v31(v36, a2);
    if (v38 == 64)
    {
      char v39 = dispatch thunk of static BinaryInteger.isSigned.getter();
      char v40 = v71;
      v28(v71, (uint64_t)v27, a2);
      uint64_t v37 = v69;
      if ((v39 & 1) == 0) {
        goto LABEL_13;
      }
    }
    else
    {
      char v40 = v71;
      v28(v71, (uint64_t)v27, a2);
      uint64_t v37 = v69;
    }
    uint64_t v51 = v40;
    goto LABEL_23;
  }
  v31(v36, a2);
  v28(v71, (uint64_t)v27, a2);
  uint64_t v37 = v69;
LABEL_13:
  int64_t v73 = 0x7FFFFFFFFFFFFFFFLL;
  char v41 = dispatch thunk of static BinaryInteger.isSigned.getter();
  uint64_t v42 = dispatch thunk of BinaryInteger.bitWidth.getter();
  if (v41)
  {
    uint64_t v43 = v68;
    if (v42 > 64)
    {
      lazy protocol witness table accessor for type Int64 and conformance Int64();
      dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
      uint64_t v44 = v71;
      goto LABEL_35;
    }
  }
  else
  {
    uint64_t v44 = v68;
    if (v42 > 63)
    {
      uint64_t v72 = 0x7FFFFFFFFFFFFFFFLL;
      (*(void (**)(char *, char *, uint64_t))(v70 + 32))(v68, v71, a2);
      lazy protocol witness table accessor for type Int64 and conformance Int64();
      uint64_t v43 = v64;
      dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
LABEL_35:
      char v54 = dispatch thunk of static Comparable.< infix(_:_:)();
      v31(v43, a2);
      v31(v44, a2);
      if (v54)
      {
        uint64_t v52 = 0;
        char v53 = 1;
        goto LABEL_37;
      }
      goto LABEL_24;
    }
  }
  uint64_t v50 = v71;
  dispatch thunk of BinaryInteger._lowWord.getter();
  uint64_t v51 = v50;
LABEL_23:
  v31(v51, a2);
LABEL_24:
  uint64_t v52 = dispatch thunk of BinaryInteger._lowWord.getter();
  char v53 = 0;
LABEL_37:
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v31)(v27, a2);
  *(void *)uint64_t v37 = v52;
  *(unsigned char *)(v37 + 8) = v53;
  return result;
}

{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  void (*v22)(char *, uint64_t, uint64_t);
  char v23;
  void (*v24)(char *, uint64_t);
  uint64_t result;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  void (*v31)(char *, uint64_t);
  void (*v32)(char *, uint64_t);
  char v33;
  uint64_t v34;
  char *v35;
  char *v36;
  char v37;
  uint64_t v38;
  char *v39;
  char *v40;
  unint64_t v41;
  char *v42;
  char *v43;
  char v44;
  char *v45;
  char *v46;
  unint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  char *v51;
  void (*v52)(char *, uint64_t);
  char *v53;
  uint64_t AssociatedTypeWitness;
  uint64_t v55;
  char *v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;

  Swift::String v55 = a4;
  uint64_t v6 = *(void *)(a3 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  char v53 = (char *)&v48 - v8;
  uint64_t v9 = *(void *)(a2 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v50 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  Swift::String v56 = (char *)&v48 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v48 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v48 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v48 - v20;
  uint64_t v58 = v9;
  Swift::String v22 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v22((char *)&v48 - v20, a1, a2);
  uint64_t v57 = v6;
  LOBYTE(a1) = dispatch thunk of static BinaryInteger.isSigned.getter();
  v22(v19, (uint64_t)v21, a2);
  if ((a1 & 1) == 0)
  {
    unint64_t v49 = v16;
    uint64_t v52 = *(void (**)(char *, uint64_t))(v58 + 8);
    v52(v19, a2);
    goto LABEL_6;
  }
  uint64_t v51 = v21;
  swift_getAssociatedConformanceWitness();
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
  uint64_t v23 = dispatch thunk of static Comparable.< infix(_:_:)();
  uint64_t v24 = *(void (**)(char *, uint64_t))(v58 + 8);
  v24(v16, a2);
  v24(v19, a2);
  if ((v23 & 1) == 0)
  {
    unint64_t v49 = v16;
    uint64_t v52 = v24;
    uint64_t v21 = v51;
LABEL_6:
    BOOL v29 = dispatch thunk of BinaryInteger.bitWidth.getter();
    Swift::String v30 = v56;
    v22(v56, (uint64_t)v21, a2);
    if (v29 <= 63)
    {
      Swift::String v31 = v52;
      v52(v30, a2);
      uint64_t v28 = v55;
      uint64_t v32 = v31;
      goto LABEL_8;
    }
    uint64_t v59 = -1;
    Swift::String v33 = dispatch thunk of static BinaryInteger.isSigned.getter();
    uint64_t v34 = dispatch thunk of BinaryInteger.bitWidth.getter();
    if (v33)
    {
      if (v34 <= 64)
      {
        uint64_t v51 = v21;
        swift_getAssociatedConformanceWitness();
        dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
        uint64_t v35 = v49;
        dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
        uint64_t v36 = v56;
        uint64_t v37 = dispatch thunk of static Comparable.> infix(_:_:)();
        uint64_t v38 = v58;
        char v39 = v35;
        uint64_t v32 = v52;
        v52(v39, a2);
        uint64_t v57 = v59;
        char v40 = v50;
        (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v50, v36, a2);
        if ((v37 & 1) == 0)
        {
          v32(v40, a2);
          uint64_t v28 = v55;
          uint64_t v21 = v51;
          goto LABEL_8;
        }
        char v41 = dispatch thunk of BinaryInteger._lowWord.getter();
        v32(v40, a2);
        uint64_t v28 = v55;
        uint64_t v21 = v51;
        if (v57 >= v41)
        {
LABEL_8:
          uint64_t v26 = dispatch thunk of BinaryInteger._lowWord.getter();
          uint64_t result = ((uint64_t (*)(char *, uint64_t))v32)(v21, a2);
          uint64_t v27 = 0;
          goto LABEL_19;
        }
LABEL_18:
        uint64_t result = ((uint64_t (*)(char *, uint64_t))v32)(v21, a2);
        uint64_t v26 = 0;
        uint64_t v27 = 1;
        goto LABEL_19;
      }
    }
    else if (v34 < 65)
    {
      uint64_t v46 = v56;
      uint64_t v47 = dispatch thunk of BinaryInteger._lowWord.getter();
      uint64_t v32 = v52;
      v52(v46, a2);
      uint64_t v28 = v55;
      if (v59 >= v47) {
        goto LABEL_8;
      }
      goto LABEL_18;
    }
    lazy protocol witness table accessor for type UInt64 and conformance UInt64();
    uint64_t v42 = v49;
    dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
    uint64_t v43 = v56;
    uint64_t v44 = dispatch thunk of static Comparable.< infix(_:_:)();
    char v45 = v42;
    uint64_t v32 = v52;
    v52(v45, a2);
    v32(v43, a2);
    uint64_t v28 = v55;
    if ((v44 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v24)(v51, a2);
  uint64_t v26 = 0;
  uint64_t v27 = 1;
  uint64_t v28 = v55;
LABEL_19:
  *(void *)uint64_t v28 = v26;
  *(unsigned char *)(v28 + 8) = v27;
  return result;
}

uint64_t XPCArray.subscript.setter(uint64_t result, size_t a2)
{
  if (result)
  {
    uint64_t v4 = (_xpc_connection_s *)result;
    uint64_t v5 = MEMORY[0x2105634B0]();
    uint64_t v6 = *v2;
    if (v5 == MEMORY[0x263EF86F0]) {
      xpc_array_set_connection(v6, a2, v4);
    }
    else {
      xpc_array_set_value(v6, a2, v4);
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

{
  void **v2;
  _xpc_connection_s *v4;
  uint64_t v5;
  void *v6;
  uint64_t vars8;

  if (result != 2)
  {
    uint64_t v4 = (_xpc_connection_s *)xpc_BOOL_create(result & 1);
    uint64_t v5 = MEMORY[0x2105634B0]();
    uint64_t v6 = *v2;
    if (v5 == MEMORY[0x263EF86F0]) {
      xpc_array_set_connection(v6, a2, v4);
    }
    else {
      xpc_array_set_value(v6, a2, v4);
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

void (*XPCArray.subscript.modify(void *a1, size_t a2, uint64_t a3, uint64_t a4))(size_t **a1, char a2)
{
  uint64_t v9 = malloc(0x40uLL);
  *a1 = v9;
  v9[2] = a4;
  void v9[3] = v4;
  *uint64_t v9 = a2;
  v9[1] = a3;
  uint64_t v10 = type metadata accessor for Optional();
  v9[4] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  void v9[5] = v11;
  size_t v12 = *(void *)(v11 + 64);
  v9[6] = malloc(v12);
  uint64_t v13 = malloc(v12);
  v9[7] = v13;
  XPCArray.subscript.getter(a2, a3, (uint64_t)v13);
  return XPCArray.subscript.modify;
}

{
  uint64_t v4;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  void *v13;

  uint64_t v9 = malloc(0x40uLL);
  *a1 = v9;
  v9[2] = a4;
  void v9[3] = v4;
  *uint64_t v9 = a2;
  v9[1] = a3;
  uint64_t v10 = type metadata accessor for Optional();
  v9[4] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  void v9[5] = v11;
  size_t v12 = *(void *)(v11 + 64);
  v9[6] = malloc(v12);
  uint64_t v13 = malloc(v12);
  v9[7] = v13;
  XPCArray.subscript.getter(a2, a3, (uint64_t)v13);
  return XPCArray.subscript.modify;
}

{
  uint64_t v4;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  void *v13;

  uint64_t v9 = malloc(0x40uLL);
  *a1 = v9;
  v9[2] = a4;
  void v9[3] = v4;
  *uint64_t v9 = a2;
  v9[1] = a3;
  uint64_t v10 = type metadata accessor for Optional();
  v9[4] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  void v9[5] = v11;
  size_t v12 = *(void *)(v11 + 64);
  v9[6] = malloc(v12);
  uint64_t v13 = malloc(v12);
  v9[7] = v13;
  XPCArray.subscript.getter(a2, a3, (uint64_t)v13);
  return XPCArray.subscript.modify;
}

void XPCArray.subscript.modify(size_t **a1, char a2)
{
}

{
  XPCArray.subscript.modify(a1, a2, (void (*)(char *, char *))partial apply for implicit closure #1 in XPCArray.subscript.setter, MEMORY[0x263F8E970], MEMORY[0x263EF8B20]);
}

{
  size_t *v2;
  void *v3;
  void *v4;
  size_t v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  void (*v10)(void *, size_t);
  uint64_t vars8;

  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a1)[6];
  uint64_t v4 = (void *)(*a1)[7];
  uint64_t v5 = (*a1)[4];
  uint64_t v6 = (*a1)[5];
  uint64_t v7 = (*a1)[2];
  uint64_t v9 = **a1;
  uint64_t v8 = (*a1)[1];
  if (a2)
  {
    (*(void (**)(size_t, void *, size_t))(v6 + 16))((*a1)[6], v4, v5);
    specialized XPCArray.subscript.setter((uint64_t)v3, v9, v8, v7);
    uint64_t v10 = *(void (**)(void *, size_t))(v6 + 8);
    v10(v3, v5);
    v10(v4, v5);
  }
  else
  {
    specialized XPCArray.subscript.setter((*a1)[7], v9, v8, v7);
    (*(void (**)(void *, size_t))(v6 + 8))(v4, v5);
  }
  free(v4);
  free(v3);

  free(v2);
}

uint64_t XPCArray.subscript.getter@<X0>(size_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return XPCArray.subscript.getter(a1, a2, a3);
}

{
  return XPCArray.subscript.getter(a1, a2, a3);
}

uint64_t XPCArray.subscript.setter(uint64_t a1, size_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, char *), uint64_t a6, uint64_t (*a7)(uint64_t))
{
  specialized XPCArray.subscript.setter(a1, a2, a3, a4, a5, a6, a7);
  uint64_t v8 = type metadata accessor for Optional();
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);

  return v9(a1, v8);
}

void XPCArray.subscript.modify(size_t **a1, char a2, void (*a3)(char *, char *), uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v6 = *a1;
  uint64_t v7 = (void *)(*a1)[6];
  uint64_t v8 = (void *)(*a1)[7];
  size_t v9 = (*a1)[4];
  size_t v10 = (*a1)[5];
  uint64_t v11 = (*a1)[2];
  size_t v12 = **a1;
  uint64_t v13 = (*a1)[1];
  if (a2)
  {
    (*(void (**)(size_t, void *, size_t))(v10 + 16))((*a1)[6], v8, v9);
    specialized XPCArray.subscript.setter((uint64_t)v7, v12, v13, v11, a3, a4, a5);
    uint64_t v14 = *(void (**)(void *, size_t))(v10 + 8);
    v14(v7, v9);
    v14(v8, v9);
  }
  else
  {
    specialized XPCArray.subscript.setter((*a1)[7], v12, v13, v11, a3, a4, a5);
    (*(void (**)(void *, size_t))(v10 + 8))(v8, v9);
  }
  free(v8);
  free(v7);

  free(v6);
}

xpc_object_t closure #1 in XPCArray.subscript.setter@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v4 + 16))((char *)v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  lazy protocol witness table accessor for type Double and conformance Double();
  BinaryFloatingPoint.init<A>(_:)();
  xpc_object_t result = xpc_double_create(*(double *)&v6[1]);
  *a2 = result;
  return result;
}

uint64_t XPCArray.subscript.getter@<X0>(size_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  v15[0] = a2;
  uint64_t v8 = type metadata accessor for Optional();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v15 - v10;
  v15[1] = *v4;
  XPCArray.subscript.getter(a1, a3, (uint64_t)v15 - v10);
  uint64_t v12 = *(void *)(a3 - 8);
  uint64_t v13 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48))(v11, 1, a3);
  if (v13 != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v12 + 32))(a4, v11, a3);
  }
  ((void (*)(uint64_t))v15[0])(v13);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t XPCArray.subscript.getter(size_t a1)
{
  uint64_t v2 = (void *)swift_unknownObjectRetain();
  xpc_object_t v3 = xpc_array_get_value(v2, a1);
  if (v3 && (uint64_t v4 = v3, v5 = MEMORY[0x2105634B0](), v6 = MEMORY[0x263EF86E0], swift_unknownObjectRelease(), v5 == v6))
  {
    BOOL value = xpc_BOOL_get_value(v4);
    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    return 2;
  }
  return value;
}

{
  void *v2;
  xpc_object_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t value;

  uint64_t v2 = (void *)swift_unknownObjectRetain_n();
  xpc_object_t v3 = xpc_array_get_value(v2, a1);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = MEMORY[0x2105634B0]();
    uint64_t v6 = MEMORY[0x263EF86E0];
    swift_unknownObjectRelease();
    if (v5 == v6)
    {
      BOOL value = xpc_BOOL_get_value(v4);
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      return 2;
    }
  }
  else
  {
    BOOL value = 2;
    swift_unknownObjectRelease_n();
  }
  return value;
}

{
  void *v2;
  uint64_t v3;

  uint64_t v2 = (void *)swift_unknownObjectRetain();
  if (xpc_array_get_string(v2, a1))
  {
    xpc_object_t v3 = String.init(cString:)();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    return 0;
  }
  return v3;
}

xpc_object_t XPCArray.subscript.getter(size_t index, uint64_t a2)
{
  xpc_object_t v4 = xpc_array_get_value(*v2, index);
  xpc_object_t v5 = v4;
  if (v4 && MEMORY[0x2105634B0](v4) != a2)
  {
    swift_unknownObjectRelease();
    return 0;
  }
  return v5;
}

unsigned __int8 *key path setter for XPCArray.subscript(_:) : XPCArray(unsigned __int8 *result, void **a2, size_t *a3)
{
  int v3 = *result;
  if (v3 != 2)
  {
    size_t v5 = *a3;
    uint64_t v6 = (_xpc_connection_s *)xpc_BOOL_create(v3 & 1);
    uint64_t v7 = MEMORY[0x2105634B0]();
    uint64_t v8 = *a2;
    if (v7 == MEMORY[0x263EF86F0]) {
      xpc_array_set_connection(v8, v5, v6);
    }
    else {
      xpc_array_set_value(v8, v5, v6);
    }
    return (unsigned __int8 *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t (*XPCArray.subscript.modify(uint64_t a1, size_t a2))(uint64_t result)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = v2;
  size_t v5 = (void *)swift_unknownObjectRetain_n();
  xpc_object_t v6 = xpc_array_get_value(v5, a2);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = MEMORY[0x2105634B0]();
    swift_unknownObjectRelease();
    if (v8 == MEMORY[0x263EF86E0])
    {
      char value = xpc_BOOL_get_value(v7);
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      char value = 2;
    }
  }
  else
  {
    char value = 2;
    swift_unknownObjectRelease_n();
  }
  *(unsigned char *)(a1 + 16) = value;
  return XPCArray.subscript.modify;
}

uint64_t XPCArray.subscript.modify(uint64_t result)
{
  uint64_t v1 = (size_t *)result;
  int v2 = *(unsigned __int8 *)(result + 16);
  if (v2 != 2)
  {
    int v3 = *(void ***)(result + 8);
    xpc_object_t v4 = (_xpc_connection_s *)xpc_BOOL_create(v2 & 1);
    uint64_t v5 = MEMORY[0x2105634B0]();
    xpc_object_t v6 = *v3;
    size_t v7 = *v1;
    if (v5 == MEMORY[0x263EF86F0]) {
      xpc_array_set_connection(v6, v7, v4);
    }
    else {
      xpc_array_set_value(v6, v7, v4);
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t XPCArray.subscript.getter(size_t a1, uint64_t (*a2)(uint64_t))
{
  xpc_object_t v4 = (void *)swift_unknownObjectRetain_n();
  xpc_object_t v5 = xpc_array_get_value(v4, a1);
  if (!v5)
  {
    uint64_t v9 = swift_unknownObjectRelease_n();
    return a2(v9) & 1;
  }
  xpc_object_t v6 = v5;
  uint64_t v7 = MEMORY[0x2105634B0]();
  uint64_t v8 = MEMORY[0x263EF86E0];
  swift_unknownObjectRelease();
  if (v7 != v8)
  {
    swift_unknownObjectRelease();
    uint64_t v9 = swift_unknownObjectRelease();
    return a2(v9) & 1;
  }
  BOOL value = xpc_BOOL_get_value(v6);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return value;
}

xpc_object_t XPCArray.subscript.getter@<X0>(size_t index@<X0>, void *a2@<X8>)
{
  xpc_object_t result = xpc_array_get_dictionary(*v2, index);
  xpc_object_t v5 = result;
  if (result && (xpc_object_t result = (xpc_object_t)MEMORY[0x2105634B0](result), result != (xpc_object_t)MEMORY[0x263EF8708])) {
    __break(1u);
  }
  else {
    *a2 = v5;
  }
  return result;
}

uint64_t XPCArray.subscript.getter@<X0>(size_t a1@<X0>, void *a2@<X8>)
{
  xpc_object_t v4 = (void *)swift_unknownObjectRetain();
  xpc_object_t v5 = xpc_array_get_dictionary(v4, a1);
  xpc_object_t v6 = v5;
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v7 = MEMORY[0x2105634B0](v5);
  uint64_t result = swift_unknownObjectRelease();
  if (v7 != MEMORY[0x263EF8708])
  {
    __break(1u);
LABEL_4:
    uint64_t result = swift_unknownObjectRelease();
  }
  *a2 = v6;
  return result;
}

xpc_object_t *XPCArray.subscript.setter(xpc_object_t *result, size_t a2)
{
  if (*result)
  {
    xpc_array_set_value(*v2, a2, *result);
    return (xpc_object_t *)swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t (*XPCArray.subscript.modify(void *a1, size_t a2))(uint64_t result, char a2)
{
  a1[1] = a2;
  a1[2] = v2;
  xpc_object_t v5 = (void *)swift_unknownObjectRetain();
  xpc_object_t v6 = xpc_array_get_dictionary(v5, a2);
  xpc_object_t v7 = v6;
  if (!v6) {
    goto LABEL_4;
  }
  uint64_t v8 = MEMORY[0x2105634B0](v6);
  swift_unknownObjectRelease();
  if (v8 != MEMORY[0x263EF8708])
  {
    __break(1u);
LABEL_4:
    swift_unknownObjectRelease();
  }
  *a1 = v7;
  return XPCArray.subscript.modify;
}

uint64_t XPCArray.subscript.modify(uint64_t result, char a2)
{
  uint64_t v2 = *(void **)result;
  if (a2)
  {
    if (v2) {
      goto LABEL_5;
    }
    __break(1u);
  }
  if (!v2)
  {
    __break(1u);
    return result;
  }
LABEL_5:
  xpc_array_set_value(**(xpc_object_t **)(result + 16), *(void *)(result + 8), v2);

  return swift_unknownObjectRelease();
}

{
  uint64_t v2;
  xpc_object_t *v3;
  size_t v4;
  uint64_t v5;
  uint64_t vars8;

  uint64_t v2 = *(void *)(result + 8);
  if (a2)
  {
    if (v2)
    {
      xpc_object_t v4 = *(void *)(result + 16);
      int v3 = *(xpc_object_t **)(result + 24);
      xpc_object_t v5 = *(void *)result;
      swift_bridgeObjectRetain();
      specialized String.withCString<A>(_:)(v5, v2, v3, v4);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    if (!v2) {
      return result;
    }
    specialized String.withCString<A>(_:)(*(void *)result, v2, *(xpc_object_t **)(result + 24), *(void *)(result + 16));
  }

  return swift_bridgeObjectRelease();
}

_xpc_connection_s **key path setter for XPCArray.subscript(_:) : XPCArray(_xpc_connection_s **result, void **a2, size_t *a3)
{
  int v3 = *result;
  if (*result)
  {
    size_t v5 = *a3;
    uint64_t v6 = swift_unknownObjectRetain();
    uint64_t v7 = MEMORY[0x2105634B0](v6);
    uint64_t v8 = *a2;
    if (v7 == MEMORY[0x263EF86F0]) {
      xpc_array_set_connection(v8, v5, v3);
    }
    else {
      xpc_array_set_value(v8, v5, v3);
    }
    return (_xpc_connection_s **)swift_unknownObjectRelease();
  }
  return result;
}

_xpc_connection_s **(*XPCArray.subscript.modify(void *a1, size_t a2))(_xpc_connection_s **result, char a2)
{
  a1[1] = a2;
  a1[2] = v2;
  *a1 = xpc_array_get_value(*v2, a2);
  return XPCArray.subscript.modify;
}

_xpc_connection_s **XPCArray.subscript.modify(_xpc_connection_s **result, char a2)
{
  uint64_t v2 = result;
  int v3 = *result;
  if (a2)
  {
    if (v3)
    {
      xpc_object_t v4 = (void **)result[2];
      uint64_t v5 = swift_unknownObjectRetain();
      uint64_t v6 = MEMORY[0x2105634B0](v5);
      uint64_t v7 = *v4;
      size_t v8 = (size_t)v2[1];
      if (v6 == MEMORY[0x263EF86F0]) {
        xpc_array_set_connection(v7, v8, v3);
      }
      else {
        xpc_array_set_value(v7, v8, v3);
      }
      swift_unknownObjectRelease();
    }
  }
  else
  {
    if (!v3) {
      return result;
    }
    uint64_t v9 = (void **)result[2];
    uint64_t v10 = MEMORY[0x2105634B0](*result);
    uint64_t v11 = *v9;
    size_t v12 = (size_t)v2[1];
    if (v10 == MEMORY[0x263EF86F0]) {
      xpc_array_set_connection(v11, v12, v3);
    }
    else {
      xpc_array_set_value(v11, v12, v3);
    }
  }

  return (_xpc_connection_s **)swift_unknownObjectRelease();
}

const char *XPCArray.subscript.getter(size_t index)
{
  uint64_t result = xpc_array_get_string(*v1, index);
  if (result) {
    return (const char *)String.init(cString:)();
  }
  return result;
}

uint64_t key path getter for XPCArray.subscript(_:) : XPCArray@<X0>(size_t *a1@<X1>, uint64_t *a2@<X8>)
{
  size_t v3 = *a1;
  xpc_object_t v4 = (void *)swift_unknownObjectRetain();
  if (xpc_array_get_string(v4, v3))
  {
    uint64_t v5 = String.init(cString:)();
    uint64_t v7 = v6;
    uint64_t result = swift_unknownObjectRelease();
  }
  else
  {
    uint64_t result = swift_unknownObjectRelease();
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
  return result;
}

uint64_t *key path setter for XPCArray.subscript(_:) : XPCArray(uint64_t *result, xpc_object_t *a2, size_t *a3)
{
  uint64_t v3 = result[1];
  if (v3)
  {
    uint64_t v5 = *result;
    size_t v6 = *a3;
    swift_bridgeObjectRetain();
    specialized String.withCString<A>(_:)(v5, v3, a2, v6);
    return (uint64_t *)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t XPCArray.subscript.setter(uint64_t result, uint64_t a2, size_t index)
{
  if (a2)
  {
    specialized String.withCString<A>(_:)(result, a2, v3, index);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void specialized String.withCString<A>(_:)(uint64_t a1, uint64_t a2, xpc_object_t *a3, size_t index)
{
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
  }
  else if ((a2 & 0x2000000000000000) != 0)
  {
    *(void *)string = a1;
    uint64_t v8 = a2 & 0xFFFFFFFFFFFFFFLL;
    xpc_array_set_string(*a3, index, string);
  }
  else
  {
    if ((a1 & 0x1000000000000000) != 0)
    {
      uint64_t v5 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      uint64_t v6 = a1 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v5 = _StringObject.sharedUTF8.getter();
    }
    specialized closure #1 in _StringGuts.withCString<A>(_:)(v5, v6, (uint64_t (*)(void))partial apply for closure #1 in XPCArray.subscript.setter);
  }
}

uint64_t (*XPCArray.subscript.modify(uint64_t *a1, size_t a2))(uint64_t result, char a2)
{
  a1[2] = a2;
  a1[3] = v2;
  uint64_t v5 = (void *)swift_unknownObjectRetain();
  if (xpc_array_get_string(v5, a2))
  {
    uint64_t v6 = String.init(cString:)();
    uint64_t v8 = v7;
    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  *a1 = v6;
  a1[1] = v8;
  return XPCArray.subscript.modify;
}

uint64_t XPCArray.copy(into:)(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *v1;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v2;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = partial apply for closure #1 in XPCArray.copy(into:);
  *(void *)(v5 + 24) = v4;
  v8[4] = partial apply for thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@unowned Bool);
  uint64_t v8[5] = v5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = thunk for @escaping @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@unowned Bool);
  void v8[3] = &block_descriptor_0;
  uint64_t v6 = _Block_copy(v8);
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  xpc_array_apply(v3, v6);
  _Block_release(v6);
  LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v3) {
    __break(1u);
  }
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@unowned Bool)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  char v6 = v5(a2, a3);
  swift_unknownObjectRelease();
  return v6 & 1;
}

BOOL XPCArray.isEmpty.getter()
{
  return xpc_array_get_count(*v0) == 0;
}

size_t XPCArray.count.getter()
{
  return xpc_array_get_count(*v0);
}

uint64_t XPCArray.forEach(_:)(uint64_t a1, uint64_t a2)
{
  char v6 = *v2;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  closure #1 in XPCArray.forEach(_:)((uint64_t)partial apply for thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@error @owned Error), v7, v6);
  if (v3) {
    return swift_release();
  }
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

{
  void **v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t result;
  char isEscapingClosureAtFileLocation;
  void v8[4];

  void v8[3] = a2;
  uint64_t v4 = *v2;
  v8[2] = a1;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = partial apply for thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@error @owned Error);
  *(void *)(v5 + 24) = v8;
  closure #1 in XPCArray.forEach(_:)((uint64_t)thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@error @owned Error)partial apply, v5, v4);
  if (v3) {
    return swift_release();
  }
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t closure #1 in XPCArray.forEach(_:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v12 = 0;
  char v6 = (void *)swift_allocObject();
  void v6[2] = a1;
  v6[3] = a2;
  v6[4] = &v12;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = partial apply for closure #1 in closure #1 in XPCArray.forEach(_:);
  *(void *)(v7 + 24) = v6;
  aBlock[4] = thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@unowned Bool)partial apply;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@unowned Bool);
  aBlock[3] = &block_descriptor_49;
  uint64_t v8 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  xpc_array_apply(a3, v8);
  _Block_release(v8);
  LOBYTE(a3) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (a3)
  {
    __break(1u);
  }
  else
  {
    if (v12)
    {
      id v10 = v12;
      swift_willThrow();
    }
    return swift_release();
  }
  return result;
}

uint64_t XPCArray.map<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *v3;
  uint64_t v19 = Array.init()();
  size_t count = xpc_array_get_count(v8);
  type metadata accessor for Array();
  Array.reserveCapacity(_:)(count);
  uint64_t v15 = a3;
  uint64_t v16 = &v19;
  uint64_t v17 = a1;
  uint64_t v18 = a2;
  v13[2] = partial apply for closure #1 in XPCArray.map<A>(_:);
  void v13[3] = &v14;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@error @owned Error)partial apply;
  *(void *)(v10 + 24) = v13;
  closure #1 in XPCArray.forEach(_:)((uint64_t)thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@error @owned Error)partial apply, v10, v8);
  if (v4)
  {
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    uint64_t result = swift_release();
    if (isEscapingClosureAtFileLocation) {
      __break(1u);
    }
    else {
      return v19;
    }
  }
  return result;
}

uint64_t closure #1 in XPCArray.map<A>(_:)(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x270FA5388](a1);
  uint64_t result = v3(v2);
  if (!v1)
  {
    type metadata accessor for Array();
    return Array.append(_:)();
  }
  return result;
}

BOOL static XPCArray.== infix(_:_:)(xpc_object_t *a1, xpc_object_t *a2)
{
  return xpc_equal(*a1, *a2);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance XPCArray(xpc_object_t *a1, xpc_object_t *a2)
{
  return xpc_equal(*a1, *a2);
}

void XPCArray.hash(into:)()
{
  size_t v1 = xpc_hash(*v0);
  Hasher._combine(_:)(v1);
}

Swift::Int XPCArray.hashValue.getter()
{
  size_t v1 = *v0;
  Hasher.init(_seed:)();
  size_t v2 = xpc_hash(v1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance XPCArray()
{
  size_t v1 = *v0;
  Hasher.init(_seed:)();
  size_t v2 = xpc_hash(v1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance XPCArray()
{
  size_t v1 = xpc_hash(*v0);
  Hasher._combine(_:)(v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance XPCArray()
{
  size_t v1 = *v0;
  Hasher.init(_seed:)();
  size_t v2 = xpc_hash(v1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t XPCArray.debugDescription.getter()
{
  size_t v1 = (void *)MEMORY[0x210563350](*v0);
  uint64_t v2 = String.init(cString:)();
  free(v1);
  return v2;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance XPCArray()
{
  size_t v1 = (void *)MEMORY[0x210563350](*v0);
  uint64_t v2 = String.init(cString:)();
  free(v1);
  return v2;
}

uint64_t specialized XPCArray.subscript.setter(uint64_t a1, size_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, char *), uint64_t a6, uint64_t (*a7)(uint64_t))
{
  uint64_t v11 = v7;
  v18[2] = a3;
  v18[3] = a4;
  type metadata accessor for Optional();
  uint64_t result = _sSq7flatMapyqd_0_SgABxqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF(a5, (uint64_t)v18, MEMORY[0x263F8E628], a6, v13, (uint64_t)&v19);
  if (v20 != 1)
  {
    uint64_t v15 = (_xpc_connection_s *)a7(v19);
    uint64_t v16 = MEMORY[0x2105634B0]();
    uint64_t v17 = *v11;
    if (v16 == MEMORY[0x263EF86F0]) {
      xpc_array_set_connection(v17, a2, v15);
    }
    else {
      xpc_array_set_value(v17, a2, v15);
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t specialized XPCArray.subscript.setter(uint64_t a1, size_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  v13[2] = a3;
  void v13[3] = a4;
  type metadata accessor for Optional();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for OS_xpc_object);
  uint64_t result = _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in XPCArray.subscript.setter, (uint64_t)v13, MEMORY[0x263F8E628], v7, v8, (uint64_t)&v14);
  uint64_t v10 = v14;
  if (v14)
  {
    uint64_t v11 = MEMORY[0x2105634B0](v14);
    id v12 = *v5;
    if (v11 == MEMORY[0x263EF86F0]) {
      xpc_array_set_connection(v12, a2, v10);
    }
    else {
      xpc_array_set_value(v12, a2, v10);
    }
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_20DA1154C()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t partial apply for closure #1 in XPCArray.copy(into:)(size_t index, xpc_object_t value)
{
  xpc_array_set_value(*(xpc_object_t *)(v2 + 16), index, value);
  return 1;
}

uint64_t sub_20DA115AC()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@unowned Bool)()
{
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_20DA115E8()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@error @owned Error)()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_20DA11620()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for closure #1 in XPCArray.map<A>(_:)(uint64_t a1)
{
  return closure #1 in XPCArray.map<A>(_:)(a1);
}

uint64_t sub_20DA11650()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

unint64_t lazy protocol witness table accessor for type XPCArray and conformance XPCArray()
{
  unint64_t result = lazy protocol witness table cache variable for type XPCArray and conformance XPCArray;
  if (!lazy protocol witness table cache variable for type XPCArray and conformance XPCArray)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type XPCArray and conformance XPCArray);
  }
  return result;
}

uint64_t sub_20DA116B8(uint64_t a1, void *a2, uint64_t a3)
{
  return keypath_getTm(a1, a2, a3, (uint64_t (*)(void, void, void))XPCArray.subscript.getter);
}

uint64_t sub_20DA116D0(uint64_t a1, uint64_t a2, size_t *a3, uint64_t a4)
{
  return specialized XPCArray.subscript.setter(a1, *a3, *(size_t *)((char *)a3 + a4 - 16), *(size_t *)((char *)a3 + a4 - 8), (void (*)(char *, char *))partial apply for implicit closure #1 in XPCArray.subscript.setter, MEMORY[0x263F8E5C0], MEMORY[0x263EF8B18]);
}

uint64_t sub_20DA11734()
{
  return 16;
}

__n128 sub_20DA11740(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_20DA1174C(uint64_t a1, void *a2, uint64_t a3)
{
  return keypath_getTm(a1, a2, a3, (uint64_t (*)(void, void, void))XPCArray.subscript.getter);
}

uint64_t keypath_getTm(uint64_t a1, void *a2, uint64_t a3, uint64_t (*a4)(void, void, void))
{
  return a4(*a2, *(void *)((char *)a2 + a3 - 16), *(void *)((char *)a2 + a3 - 8));
}

uint64_t sub_20DA117AC(uint64_t a1, uint64_t a2, size_t *a3, uint64_t a4)
{
  return specialized XPCArray.subscript.setter(a1, *a3, *(size_t *)((char *)a3 + a4 - 16), *(size_t *)((char *)a3 + a4 - 8), (void (*)(char *, char *))partial apply for implicit closure #1 in XPCArray.subscript.setter, MEMORY[0x263F8E970], MEMORY[0x263EF8B20]);
}

uint64_t sub_20DA11810()
{
  return 16;
}

__n128 sub_20DA1181C(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_20DA11828(uint64_t a1, void *a2, uint64_t a3)
{
  return keypath_getTm(a1, a2, a3, (uint64_t (*)(void, void, void))XPCArray.subscript.getter);
}

uint64_t sub_20DA11840(uint64_t a1, uint64_t a2, size_t *a3, uint64_t a4)
{
  return specialized XPCArray.subscript.setter(a1, *a3, *(size_t *)((char *)a3 + a4 - 16), *(size_t *)((char *)a3 + a4 - 8));
}

uint64_t sub_20DA11874()
{
  return 16;
}

__n128 sub_20DA11880(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_20DA1188C@<X0>(size_t *a1@<X1>, unsigned char *a2@<X8>)
{
  uint64_t result = XPCArray.subscript.getter(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_20DA118D0()
{
  return 0;
}

uint64_t sub_20DA118E0@<X0>(size_t *a1@<X1>, void *a2@<X8>)
{
  uint64_t result = XPCArray.subscript.getter(*a1, &v4);
  *a2 = v4;
  return result;
}

void sub_20DA11928(xpc_object_t *a1, xpc_object_t *a2, size_t *a3)
{
  if (*a1) {
    xpc_array_set_value(*a2, *a3, *a1);
  }
  else {
    __break(1u);
  }
}

uint64_t sub_20DA11944()
{
  return 0;
}

xpc_object_t sub_20DA11954@<X0>(xpc_object_t *a1@<X0>, size_t *a2@<X1>, void *a3@<X8>)
{
  xpc_object_t result = xpc_array_get_value(*a1, *a2);
  *a3 = result;
  return result;
}

uint64_t sub_20DA11990()
{
  return 0;
}

uint64_t sub_20DA119A8()
{
  return 0;
}

ValueMetadata *type metadata accessor for XPCArray()
{
  return &type metadata for XPCArray;
}

uint64_t sub_20DA119C8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t partial apply for closure #1 in closure #1 in XPCArray.forEach(_:)()
{
  (*(void (**)(void))(v0 + 16))();
  return 1;
}

uint64_t sub_20DA11A5C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void partial apply for closure #1 in XPCArray.subscript.setter(char *string)
{
  xpc_array_set_string(**(xpc_object_t **)(v1 + 16), *(void *)(v1 + 24), string);
}

xpc_object_t partial apply for closure #1 in XPCArray.subscript.setter@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return closure #1 in XPCArray.subscript.setter(a1, a2);
}

uint64_t partial apply for implicit closure #1 in XPCArray.subscript.setter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return implicit closure #1 in XPCArray.subscript.setter(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

{
  uint64_t v2;

  return implicit closure #1 in XPCArray.subscript.setter(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@error @owned Error)partial apply()
{
  return partial apply for thunk for @callee_guaranteed (@unowned Int, @guaranteed OS_xpc_object) -> (@error @owned Error)();
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance Float()
{
  return 12;
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance Double()
{
  return 13;
}

uint64_t dispatch thunk of CodingPrimitive.encodeValue(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of static CodingPrimitive.decodeValue(from:withCodingMetadata:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance Int(uint64_t a1)
{
  return specialized CodingPrimitive.encode(to:)(a1, *v1);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))specialized static DecodingContainer.decodeType(from:withCodingMetadata:), (uint64_t (*)(uint64_t, uint64_t))specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:), a4);
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance Int8(uint64_t a1)
{
  return specialized CodingPrimitive.encode(to:)(a1, *v1);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned char *a4@<X8>)
{
  return protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int8(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))specialized static DecodingContainer.decodeType(from:withCodingMetadata:), (uint64_t (*)(uint64_t, uint64_t))specialized static Int8.decodeValue(from:withCodingMetadata:), a4);
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance Int16(uint64_t a1)
{
  return specialized CodingPrimitive.encode(to:)(a1, *v1);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int16@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _WORD *a4@<X8>)
{
  return protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int16(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))specialized static DecodingContainer.decodeType(from:withCodingMetadata:), (uint64_t (*)(uint64_t, uint64_t))specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:), a4);
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance Int64(uint64_t a1)
{
  return specialized CodingPrimitive.encode(to:)(a1, *v1);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))specialized static DecodingContainer.decodeType(from:withCodingMetadata:), (uint64_t (*)(uint64_t, uint64_t))specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:), a4);
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance UInt(uint64_t a1)
{
  return specialized CodingPrimitive.encode(to:)(a1, *v1);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance UInt@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))specialized static DecodingContainer.decodeType(from:withCodingMetadata:), (uint64_t (*)(uint64_t, uint64_t))specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:), a4);
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance UInt8(uint64_t a1)
{
  return specialized CodingPrimitive.encode(to:)(a1, *v1);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance UInt8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned char *a4@<X8>)
{
  return protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int8(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))specialized static DecodingContainer.decodeType(from:withCodingMetadata:), (uint64_t (*)(uint64_t, uint64_t))specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:), a4);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t, uint64_t, uint64_t)@<X5>, uint64_t (*a5)(uint64_t, uint64_t)@<X6>, unsigned char *a6@<X8>)
{
  a4(a3, a1, a2);
  if (v6)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  else
  {
    char v12 = a5(a3, a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_release();
    *a6 = v12;
  }
  return result;
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance UInt16(uint64_t a1)
{
  return specialized CodingPrimitive.encode(to:)(a1, *v1);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance UInt16@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _WORD *a4@<X8>)
{
  return protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int16(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))specialized static DecodingContainer.decodeType(from:withCodingMetadata:), (uint64_t (*)(uint64_t, uint64_t))specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:), a4);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int16@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t, uint64_t, uint64_t)@<X5>, uint64_t (*a5)(uint64_t, uint64_t)@<X6>, _WORD *a6@<X8>)
{
  a4(a3, a1, a2);
  if (v6)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  else
  {
    __int16 v12 = a5(a3, a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_release();
    *a6 = v12;
  }
  return result;
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance UInt32(uint64_t a1)
{
  return specialized CodingPrimitive.encode(to:)(a1, *v1);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance UInt32@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _DWORD *a4@<X8>)
{
  return protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Int32(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))specialized static DecodingContainer.decodeType(from:withCodingMetadata:), (uint64_t (*)(uint64_t, uint64_t))specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:), a4);
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance Float(uint64_t a1)
{
  return specialized CodingPrimitive.encode(to:)(a1, *v1);
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance Float@<X0>(void *a1@<X2>, unsigned int *a2@<X8>)
{
  specialized static DecodingContainer.decodeType(from:withCodingMetadata:)(a1);
  if (v2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  else
  {
    unsigned int v5 = specialized static CodingIntegerPrimitive.decodeValue(from:withCodingMetadata:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_release();
    *a2 = v5;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for CodingUserInfoKeyNotFound(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CodingUserInfoKey();
  unsigned int v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t destroy for CodingUserInfoKeyNotFound(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CodingUserInfoKey();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for CodingUserInfoKeyNotFound(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CodingUserInfoKey();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for CodingUserInfoKeyNotFound(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CodingUserInfoKey();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for CodingUserInfoKeyNotFound(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CodingUserInfoKey();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for CodingUserInfoKeyNotFound(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CodingUserInfoKey();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for CodingUserInfoKeyNotFound(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_20DA12248);
}

uint64_t sub_20DA12248(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CodingUserInfoKey();
  unsigned int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for CodingUserInfoKeyNotFound(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_20DA122C8);
}

uint64_t sub_20DA122C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CodingUserInfoKey();
  unsigned int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for CodingUserInfoKeyNotFound()
{
  uint64_t result = type metadata singleton initialization cache for CodingUserInfoKeyNotFound;
  if (!type metadata singleton initialization cache for CodingUserInfoKeyNotFound) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata completion function for CodingUserInfoKeyNotFound()
{
  uint64_t result = type metadata accessor for CodingUserInfoKey();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t typeMismatchError(codingMetadata:type:message:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, void *a3@<X4>, void *a4@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
  *a4 = a1;
  swift_bridgeObjectRetain();
  _StringGuts.grow(_:)(39);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = _typeName(_:qualified:)();
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._object = (void *)0x800000020DA316F0;
  v9._countAndFlagsBits = 0xD00000000000001ALL;
  String.append(_:)(v9);
  v10._countAndFlagsBits = a2;
  v10._object = a3;
  String.append(_:)(v10);
  DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
  uint64_t v11 = *MEMORY[0x263F8DCB0];
  uint64_t v12 = type metadata accessor for DecodingError();
  uint64_t v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 104);

  return v13(a4, v11, v12);
}

uint64_t keyNotFoundError<A>(codingMetadata:key:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t *a4@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (CodingKey, DecodingError.Context));
  a4[3] = a2;
  a4[4] = a3;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a4);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(boxed_opaque_existential_1, a1, a2);
  swift_bridgeObjectRetain();
  _StringGuts.grow(_:)(31);
  v9._object = (void *)0x800000020DA31690;
  v9._countAndFlagsBits = 0xD00000000000001DLL;
  String.append(_:)(v9);
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
  uint64_t v10 = *MEMORY[0x263F8DCA8];
  uint64_t v11 = type metadata accessor for DecodingError();
  uint64_t v12 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 104);

  return v12(a4, v10, v11);
}

unint64_t implicit closure #1 in default argument 2 of encodingError<A>(codingMetadata:value:message:)()
{
  return 0xD000000000000017;
}

uint64_t encodingError<A>(codingMetadata:value:message:)@<X0>(uint64_t a1@<X2>, void (*a2)(uint64_t)@<X3>, uint64_t a3@<X5>, uint64_t *a4@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
  a4[3] = a3;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a4);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))(boxed_opaque_existential_1, a1, a3);
  uint64_t v9 = swift_bridgeObjectRetain();
  a2(v9);
  DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
  uint64_t v10 = *MEMORY[0x263F8DCE0];
  uint64_t v11 = type metadata accessor for EncodingError();
  uint64_t v12 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 104);

  return v12(a4, v10, v11);
}

uint64_t protocol witness for Error._domain.getter in conformance CodingUserInfoKeyNotFound()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t protocol witness for Error._code.getter in conformance CodingUserInfoKeyNotFound()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t protocol witness for Error._userInfo.getter in conformance CodingUserInfoKeyNotFound()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance CodingUserInfoKeyNotFound()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance CodingUserInfoKeyNotFound()
{
  _StringGuts.grow(_:)(28);
  v0._object = (void *)0x800000020DA316D0;
  v0._countAndFlagsBits = 0xD00000000000001ALL;
  String.append(_:)(v0);
  type metadata accessor for CodingUserInfoKey();
  _print_unlocked<A, B>(_:_:)();
  return 0;
}

uint64_t XPCCodableObject.init(copying:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = OS_xpc_object.isCodable()();
  if (result)
  {
    uint64_t result = (uint64_t)xpc_copy(a1);
    if (result)
    {
      uint64_t v5 = result;
      uint64_t result = swift_unknownObjectRelease();
      *a2 = v5;
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

Swift::Bool __swiftcall OS_xpc_object.isCodable()()
{
  if (one-time initialization token for allTypes != -1) {
    swift_once();
  }
  uint64_t v0 = static Set<>.allTypes;
  Swift::UInt v1 = MEMORY[0x2105634B0]();

  return specialized Set.contains(_:)(v1, v0);
}

void XPCCodableObject.type.getter()
{
}

xpc_object_t XPCCodableObject.copyUnderlyingXPCObject()()
{
  xpc_object_t result = xpc_copy(*v0);
  if (!result) {
    __break(1u);
  }
  return result;
}

BOOL static XPCCodableObject.== infix(_:_:)(xpc_object_t *a1, xpc_object_t *a2)
{
  return xpc_equal(*a1, *a2);
}

void XPCCodableObject.hash(into:)()
{
  size_t v1 = xpc_hash(*v0);
  Hasher._combine(_:)(v1);
}

Swift::Int XPCCodableObject.hashValue.getter()
{
  size_t v1 = *v0;
  Hasher.init(_seed:)();
  size_t v2 = xpc_hash(v1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

unint64_t XPCCodableObject.debugDescription.getter()
{
  uint64_t v1 = *v0;
  _StringGuts.grow(_:)(19);
  swift_bridgeObjectRelease();
  MEMORY[0x210563350](v1);
  v2._countAndFlagsBits = String.init(cString:)();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 41;
  v3._object = (void *)0xE100000000000000;
  String.append(_:)(v3);
  return 0xD00000000000001ELL;
}

uint64_t XPCCodableObject.encode(to:)(void *a1)
{
  uint64_t v3 = type metadata accessor for CodingUserInfoKey();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v20 - v8;
  uint64_t v21 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v10 = dispatch thunk of Encoder.userInfo.getter();
  if (one-time initialization token for xpcCodable != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v3, (uint64_t)static CodingUserInfoKey.xpcCodable);
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v12(v9, v11, v3);
  if (*(void *)(v10 + 16) && (unint64_t v13 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v9), (v14 & 1) != 0))
  {
    outlined init with copy of Any(*(void *)(v10 + 56) + 32 * v13, (uint64_t)&v22);
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  if (!*((void *)&v23 + 1))
  {
    outlined destroy of Any?((uint64_t)&v22);
    goto LABEL_12;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    v12(v7, v11, v3);
    type metadata accessor for CodingUserInfoKeyNotFound();
    lazy protocol witness table accessor for type CodingUserInfoKeyNotFound and conformance CodingUserInfoKeyNotFound();
    swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v18, v7, v3);
    return swift_willThrow();
  }
  xpc_object_t v15 = v24;
  xpc_array_get_count(v24);
  uint64_t v16 = v21;
  uint64_t v17 = swift_unknownObjectRetain();
  if (MEMORY[0x2105634B0](v17) == MEMORY[0x263EF86F0]) {
    xpc_array_set_connection(v15, 0xFFFFFFFFFFFFFFFFLL, v16);
  }
  else {
    xpc_array_set_value(v15, 0xFFFFFFFFFFFFFFFFLL, v16);
  }
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  dispatch thunk of Encoder.singleValueContainer()();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v22, *((uint64_t *)&v23 + 1));
  dispatch thunk of SingleValueEncodingContainer.encode(_:)();
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
}

uint64_t XPCCodableObject.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  v26[0] = a2;
  uint64_t v3 = type metadata accessor for CodingUserInfoKey();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v26 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v10 = dispatch thunk of Decoder.userInfo.getter();
  if (one-time initialization token for xpcCodable != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v3, (uint64_t)static CodingUserInfoKey.xpcCodable);
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v12(v9, v11, v3);
  if (*(void *)(v10 + 16) && (unint64_t v13 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v9), (v14 & 1) != 0))
  {
    outlined init with copy of Any(*(void *)(v10 + 56) + 32 * v13, (uint64_t)&v27);
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  if (!*((void *)&v28 + 1))
  {
    outlined destroy of Any?((uint64_t)&v27);
    goto LABEL_12;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    v12(v7, v11, v3);
    type metadata accessor for CodingUserInfoKeyNotFound();
    lazy protocol witness table accessor for type CodingUserInfoKeyNotFound and conformance CodingUserInfoKeyNotFound();
    swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v17, v7, v3);
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  xpc_object_t v15 = v29;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v16 = v26[1];
  dispatch thunk of Decoder.singleValueContainer()();
  if (v16)
  {
LABEL_10:
    swift_unknownObjectRelease();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  __swift_project_boxed_opaque_existential_1(&v27, *((uint64_t *)&v28 + 1));
  size_t v19 = dispatch thunk of SingleValueDecodingContainer.decode(_:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v27);
  xpc_object_t v20 = xpc_array_get_value(v15, v19);
  if (!v20)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    Decoder.codingMetadata.getter();
    uint64_t v23 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v25 = v24;
    *(void *)&long long v27 = 0;
    *((void *)&v27 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(31);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v23 - 8) + 104))(v25, *MEMORY[0x263F8DCB8], v23);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_willThrow();
    goto LABEL_10;
  }
  uint64_t v21 = v20;
  uint64_t result = OS_xpc_object.isCodable()();
  if (result)
  {
    uint64_t result = (uint64_t)xpc_copy(v21);
    if (result)
    {
      uint64_t v22 = result;
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      *(void *)v26[0] = v22;
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance XPCCodableObject@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return XPCCodableObject.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance XPCCodableObject(void *a1)
{
  return XPCCodableObject.encode(to:)(a1);
}

uint64_t static XPCCodableObjectRepresentable.validXPCObjectTypes.getter()
{
  specialized static XPCCodableObjectRepresentable.validXPCObjectTypes.getter();

  return swift_bridgeObjectRetain();
}

{
  uint64_t vars8;

  specialized static XPCCodableObjectRepresentable.validXPCObjectTypes.getter();

  return swift_bridgeObjectRetain();
}

uint64_t XPCCodableObjectRepresentableCache.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t one-time initialization function for allTypes()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<OpaquePointer>);
  uint64_t inited = swift_initStackObject();
  uint64_t v1 = MEMORY[0x263EF86E0];
  *(void *)(inited + 32) = MEMORY[0x263EF8758];
  *(void *)(inited + 40) = v1;
  uint64_t v2 = MEMORY[0x263EF87A0];
  *(void *)(inited + 48) = MEMORY[0x263EF8738];
  *(void *)(inited + 56) = v2;
  uint64_t v3 = MEMORY[0x263EF8700];
  *(void *)(inited + 64) = MEMORY[0x263EF8710];
  *(void *)(inited + 72) = v3;
  uint64_t v4 = MEMORY[0x263EF8798];
  *(void *)(inited + 80) = MEMORY[0x263EF86F8];
  *(void *)(inited + 88) = v4;
  uint64_t v5 = MEMORY[0x263EF8728];
  *(void *)(inited + 96) = MEMORY[0x263EF87A8];
  *(void *)(inited + 104) = v5;
  uint64_t v6 = MEMORY[0x263EF8748];
  *(void *)(inited + 112) = MEMORY[0x263EF8790];
  *(void *)(inited + 120) = v6;
  uint64_t v7 = MEMORY[0x263EF8708];
  *(void *)(inited + 128) = MEMORY[0x263EF86D8];
  *(void *)(inited + 136) = v7;
  uint64_t v8 = MEMORY[0x263EF8718];
  *(void *)(inited + 144) = MEMORY[0x263EF8720];
  *(void *)(inited + 152) = v8;
  uint64_t v9 = MEMORY[0x263EF8740];
  uint64_t v10 = MEMORY[0x263EF8750];
  *(_OWORD *)(inited + 16) = xmmword_20DA2D480;
  *(void *)(inited + 160) = v9;
  *(void *)(inited + 168) = v10;
  *(void *)(inited + 176) = MEMORY[0x263EF8770];
  Swift::Int v11 = specialized Set.init(_nonEmptyArrayLiteral:)(inited);
  uint64_t result = swift_setDeallocating();
  static Set<>.allTypes = v11;
  return result;
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t lazy protocol witness table accessor for type CodingUserInfoKeyNotFound and conformance CodingUserInfoKeyNotFound()
{
  unint64_t result = lazy protocol witness table cache variable for type CodingUserInfoKeyNotFound and conformance CodingUserInfoKeyNotFound;
  if (!lazy protocol witness table cache variable for type CodingUserInfoKeyNotFound and conformance CodingUserInfoKeyNotFound)
  {
    type metadata accessor for CodingUserInfoKeyNotFound();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CodingUserInfoKeyNotFound and conformance CodingUserInfoKeyNotFound);
  }
  return result;
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

Swift::Int specialized Set.init(_nonEmptyArrayLiteral:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(demangling cache variable for type metadata for _SetStorage<OpaquePointer>);
    uint64_t v3 = static _SetStorage.allocate(capacity:)();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v6 = a1 + 32;
    while (1)
    {
      Swift::UInt v7 = *(void *)(v6 + 8 * v4);
      Hasher.init(_seed:)();
      Hasher._combine(_:)(v7);
      Swift::Int result = Hasher._finalize()();
      uint64_t v9 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v10 = result & ~v9;
      unint64_t v11 = v10 >> 6;
      uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
      uint64_t v13 = 1 << v10;
      uint64_t v14 = *(void *)(v3 + 48);
      if (((1 << v10) & v12) != 0)
      {
        if (*(void *)(v14 + 8 * v10) == v7) {
          goto LABEL_3;
        }
        uint64_t v15 = ~v9;
        while (1)
        {
          unint64_t v10 = (v10 + 1) & v15;
          unint64_t v11 = v10 >> 6;
          uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
          uint64_t v13 = 1 << v10;
          if ((v12 & (1 << v10)) == 0) {
            break;
          }
          if (*(void *)(v14 + 8 * v10) == v7) {
            goto LABEL_3;
          }
        }
      }
      *(void *)(v5 + 8 * v11) = v13 | v12;
      *(void *)(v14 + 8 * v10) = v7;
      uint64_t v16 = *(void *)(v3 + 16);
      BOOL v17 = __OFADD__(v16, 1);
      uint64_t v18 = v16 + 1;
      if (v17)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v18;
LABEL_3:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t specialized static XPCCodableObjectRepresentable.validXPCObjectTypes.getter()
{
  if (one-time initialization token for allTypes != -1) {
    swift_once();
  }
  return static Set<>.allTypes;
}

unint64_t lazy protocol witness table accessor for type XPCCodableObject and conformance XPCCodableObject()
{
  unint64_t result = lazy protocol witness table cache variable for type XPCCodableObject and conformance XPCCodableObject;
  if (!lazy protocol witness table cache variable for type XPCCodableObject and conformance XPCCodableObject)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type XPCCodableObject and conformance XPCCodableObject);
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCCodableObject()
{
  return &type metadata for XPCCodableObject;
}

uint64_t dispatch thunk of XPCCodableObjectRepresentable.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of XPCCodableObjectRepresentable.xpcCodableObject.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static XPCCodableObjectRepresentable.validXPCObjectTypes.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

BOOL static XPCEndpoint.== infix(_:_:)(xpc_object_t *a1, xpc_object_t *a2)
{
  return xpc_equal(*a1, *a2);
}

uint64_t XPCEndpoint.hash(into:)()
{
  uint64_t v0 = (void *)swift_unknownObjectRetain();
  size_t v1 = xpc_hash(v0);
  Hasher._combine(_:)(v1);

  return swift_unknownObjectRelease();
}

Swift::Int XPCEndpoint.hashValue.getter()
{
  Hasher.init(_seed:)();
  uint64_t v0 = (void *)swift_unknownObjectRetain();
  size_t v1 = xpc_hash(v0);
  Hasher._combine(_:)(v1);
  swift_unknownObjectRelease();
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance XPCEndpoint()
{
  Hasher.init(_seed:)();
  uint64_t v0 = (void *)swift_unknownObjectRetain();
  size_t v1 = xpc_hash(v0);
  Hasher._combine(_:)(v1);
  swift_unknownObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance XPCEndpoint()
{
  uint64_t v0 = (void *)swift_unknownObjectRetain();
  size_t v1 = xpc_hash(v0);
  Hasher._combine(_:)(v1);

  return swift_unknownObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance XPCEndpoint()
{
  Hasher.init(_seed:)();
  uint64_t v0 = (void *)swift_unknownObjectRetain();
  size_t v1 = xpc_hash(v0);
  Hasher._combine(_:)(v1);
  swift_unknownObjectRelease();
  return Hasher._finalize()();
}

unint64_t XPCEndpoint.debugDescription.getter()
{
  uint64_t v1 = *v0;
  _StringGuts.grow(_:)(19);
  swift_bridgeObjectRelease();
  MEMORY[0x210563350](v1);
  v2._countAndFlagsBits = String.init(cString:)();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 41;
  v3._object = (void *)0xE100000000000000;
  String.append(_:)(v3);
  return 0xD00000000000001ELL;
}

unint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance XPCEndpoint()
{
  return XPCCodableObject.debugDescription.getter();
}

uint64_t XPCEndpoint.encode(to:)(void *a1)
{
  return XPCCodableObject.encode(to:)(a1);
}

uint64_t XPCEndpoint.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  outlined init with copy of XPCCodableObjectRepresentable((uint64_t)a1, (uint64_t)&v11);
  XPCCodableObject.init(from:)(&v11, (uint64_t)&v13);
  if (!v2)
  {
    uint64_t v5 = v13;
    if (MEMORY[0x2105634B0](v13) == MEMORY[0x263EF8718])
    {
      *a2 = v5;
    }
    else
    {
      __swift_project_boxed_opaque_existential_1(a1, a1[3]);
      Decoder.codingMetadata.getter();
      uint64_t v11 = 0;
      unint64_t v12 = 0xE000000000000000;
      v6._countAndFlagsBits = 0x626F20637078203ALL;
      v6._object = (void *)0xED0000207463656ALL;
      String.append(_:)(v6);
      uint64_t v13 = MEMORY[0x2105634B0](v5);
      _print_unlocked<A, B>(_:_:)();
      uint64_t v7 = v11;
      uint64_t v8 = (void *)v12;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)((uint64_t)&type metadata for XPCEndpoint, v7, v8, v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t lazy protocol witness table accessor for type XPCEndpoint and conformance XPCEndpoint()
{
  unint64_t result = lazy protocol witness table cache variable for type XPCEndpoint and conformance XPCEndpoint;
  if (!lazy protocol witness table cache variable for type XPCEndpoint and conformance XPCEndpoint)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type XPCEndpoint and conformance XPCEndpoint);
  }
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance XPCEndpoint@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return XPCEndpoint.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance XPCEndpoint(void *a1)
{
  return XPCCodableObject.encode(to:)(a1);
}

uint64_t dispatch thunk of UnkeyedContainer.currentIndex.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t initializeBufferWithCopyOfBuffer for CodableIndexKey(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for CodableIndexKey()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CodableIndexKey(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CodableIndexKey(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for CodableIndexKey(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for CodableIndexKey(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 25)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CodableIndexKey(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 25) = 1;
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
    *(unsigned char *)(result + 25) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CodableIndexKey()
{
  return &type metadata for CodableIndexKey;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance CodableIndexKey()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance CodableIndexKey@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 24) = 0;
  *(void *)(a1 + 16) = 0;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance CodableIndexKey()
{
  return *(void *)(v0 + 16);
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance CodableIndexKey@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v4._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v4);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = 0x207865646E49;
  *(void *)(a2 + 8) = 0xE600000000000000;
  *(void *)(a2 + 16) = a1;
  *(unsigned char *)(a2 + 24) = 0;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CodableIndexKey(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance CodableIndexKey(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();

  return MEMORY[0x270FA00B8](a1, v2);
}

ValueMetadata *type metadata accessor for NilPrimitive()
{
  return &type metadata for NilPrimitive;
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance NilPrimitive(uint64_t a1, uint64_t a2, void *a3)
{
  return swift_release();
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance NilPrimitive()
{
  return 0;
}

uint64_t specialized NilPrimitive.encode(to:)(uint64_t a1)
{
  unint64_t v2 = (uint64_t *)(a1 + 16);
  swift_beginAccess();
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a1 + 16) = v3;
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v3 + 16) + 1, 1, (char *)v3);
    uint64_t v3 = result;
    *unint64_t v2 = result;
  }
  unint64_t v6 = *(void *)(v3 + 16);
  unint64_t v5 = *(void *)(v3 + 24);
  if (v6 >= v5 >> 1)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v5 > 1), v6 + 1, 1, (char *)v3);
    uint64_t v3 = result;
    *unint64_t v2 = result;
  }
  *(void *)(v3 + 16) = v6 + 1;
  *(unsigned char *)(v3 + v6 + 32) = 1;
  return result;
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance Bool()
{
  return 11;
}

uint64_t dispatch thunk of static CodingIntegerPrimitive.encodingLength.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t type metadata completion function for _XPCKeyedDecodingContainer()
{
  return swift_initClassMetadata2();
}

void *_XPCKeyedDecodingContainer.__allocating_init(codingMetadata:storage:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  result[5] = 0;
  return result;
}

void *_XPCKeyedDecodingContainer.init(codingMetadata:storage:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[2] = a1;
  v3[3] = a2;
  v3[4] = a3;
  v3[5] = 0;
  return v3;
}

uint64_t _XPCKeyedDecodingContainer.contains(_:)()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 32) + 16);
  swift_bridgeObjectRetain();
  uint64_t v2 = dispatch thunk of CodingKey.stringValue.getter();
  if (*(void *)(v1 + 16) && (specialized __RawDictionaryStorage.find<A>(_:)(v2, v3), (v4 & 1) != 0))
  {
    swift_retain();
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v5;
}

uint64_t _XPCKeyedDecodingContainer.decodeNil(forKey:)(uint64_t a1)
{
  long long v14 = *(_OWORD *)(*(void *)v1 + 80);
  uint64_t v12 = v14;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v13);
  (*(void (**)(uint64_t *, uint64_t))(*(void *)(v12 - 8) + 16))(boxed_opaque_existential_1, a1);
  uint64_t v5 = (void *)_XPCKeyedDecodingContainer.valueBuffer(forKey:)(v13);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  if (v2) {
    return a1 & 1;
  }
  uint64_t v7 = v5[4];
  uint64_t v8 = v5[5] >> 1;
  if (__OFSUB__(v8, v7))
  {
    __break(1u);
  }
  else
  {
    uint64_t v9 = v5[6];
    if (v9 >= v8 - v7) {
      goto LABEL_12;
    }
    uint64_t v10 = v7 + v9;
    if (!__OFADD__(v7, v9))
    {
      if (v10 < v7 || v10 >= v8) {
        goto LABEL_17;
      }
      if (*(unsigned char *)(v5[3] + v10) == 1)
      {
        v5[6] = v9 + 1;
        LOBYTE(a1) = 1;
LABEL_13:
        swift_release();
        return a1 & 1;
      }
LABEL_12:
      LOBYTE(a1) = 0;
      goto LABEL_13;
    }
  }
  __break(1u);
LABEL_17:
  __break(1u);
  return result;
}

uint64_t _XPCKeyedDecodingContainer.nestedUnkeyedContainer(forKey:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v6 = *v2;
  *((void *)&v37 + 1) = *(void *)(*v2 + 80);
  uint64_t v7 = *((void *)&v37 + 1);
  uint64_t v8 = *(void *)(v6 + 88);
  uint64_t v38 = (_UNKNOWN **)v8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v36);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))(boxed_opaque_existential_1, a1, v7);
  uint64_t v10 = (void *)_XPCKeyedDecodingContainer.valueBuffer(forKey:)(&v36);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v36);
  if (!v3)
  {
    Swift::String v30 = a2;
    uint64_t v12 = CodingMetadata.appending<A>(codingKey:)(a1, v2[2], v2[3], v7, v8);
    uint64_t v31 = v13;
    uint64_t v32 = v12;
    uint64_t v14 = v2[4];
    uint64_t v15 = dispatch thunk of CodingKey.stringValue.getter();
    uint64_t v17 = v16;
    swift_beginAccess();
    uint64_t v18 = *(void *)(v14 + 24);
    if (*(void *)(v18 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v19 = specialized __RawDictionaryStorage.find<A>(_:)(v15, v17);
      if (v20)
      {
        outlined init with copy of XPCCodableObjectRepresentable(*(void *)(v18 + 56) + 40 * v19, (uint64_t)&v33);
      }
      else
      {
        uint64_t v35 = 0;
        long long v33 = 0u;
        long long v34 = 0u;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v35 = 0;
      long long v33 = 0u;
      long long v34 = 0u;
    }
    swift_bridgeObjectRelease();
    uint64_t v21 = *((void *)&v34 + 1);
    if (*((void *)&v34 + 1))
    {
      uint64_t v22 = v35;
      uint64_t v23 = __swift_project_boxed_opaque_existential_1(&v33, *((uint64_t *)&v34 + 1));
      *((void *)&v37 + 1) = v21;
      uint64_t v38 = *(_UNKNOWN ***)(v22 + 8);
      uint64_t v24 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v36);
      (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v21 - 8) + 16))(v24, v23, v21);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v33);
    }
    else
    {
      outlined destroy of DecodingContainer?((uint64_t)&v33, &demangling cache variable for type metadata for DecodingContainer?);
      long long v36 = 0u;
      long long v37 = 0u;
      uint64_t v38 = 0;
    }
    char v25 = specialized static SharableStorageContainer.getExisting<A>(container:codingMetadata:initialStorage:)(&v39, (uint64_t)&v36, v32, v31, v10);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    outlined destroy of DecodingContainer?((uint64_t)&v36, &demangling cache variable for type metadata for CodingContainer?);
    uint64_t v26 = v39;
    if (v25)
    {
      uint64_t v27 = dispatch thunk of CodingKey.stringValue.getter();
      uint64_t v29 = v28;
      *((void *)&v37 + 1) = type metadata accessor for _XPCUnkeyedDecodingContainer();
      uint64_t v38 = &protocol witness table for _XPCUnkeyedDecodingContainer;
      *(void *)&long long v36 = v26;
      swift_beginAccess();
      swift_retain();
      specialized Dictionary.subscript.setter((uint64_t)&v36, v27, v29);
      swift_endAccess();
    }
    v30[3] = type metadata accessor for _XPCUnkeyedDecodingContainer();
    v30[4] = _s3XPC11_XPCDecoderCACs7DecoderAAWlTm_0(&lazy protocol witness table cache variable for type _XPCUnkeyedDecodingContainer and conformance _XPCUnkeyedDecodingContainer, (void (*)(uint64_t))type metadata accessor for _XPCUnkeyedDecodingContainer);
    uint64_t result = swift_release();
    *Swift::String v30 = v26;
  }
  return result;
}

uint64_t _XPCKeyedDecodingContainer.superDecoder()@<X0>(uint64_t *a1@<X8>)
{
  static SuperCoderKey.defaultKey<A>(_:)(*(void *)(*(void *)v1 + 80), *(void *)(*(void *)v1 + 88), v4);
  _XPCKeyedDecodingContainer._superDecoder(forKey:)(v4, a1);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
}

uint64_t _XPCKeyedDecodingContainer._superDecoder(forKey:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = _XPCKeyedDecodingContainer.valueBuffer(forKey:)(a1);
  if (!v3)
  {
    uint64_t v7 = result;
    uint64_t v8 = a1[3];
    uint64_t v9 = a1[4];
    uint64_t v10 = __swift_project_boxed_opaque_existential_1(a1, v8);
    uint64_t v11 = CodingMetadata.appending<A>(codingKey:)((uint64_t)v10, *(void *)(v2 + 16), *(void *)(v2 + 24), v8, v9);
    uint64_t v13 = v12;
    uint64_t v14 = type metadata accessor for _XPCDecoder();
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 40) = 0u;
    *(_OWORD *)(v15 + 56) = 0u;
    *(void *)(v15 + 72) = 0;
    *(void *)(v15 + 24) = v13;
    *(void *)(v15 + 32) = v7;
    *(void *)(v15 + 16) = v11;
    a2[3] = v14;
    uint64_t result = _s3XPC11_XPCDecoderCACs7DecoderAAWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, (void (*)(uint64_t))type metadata accessor for _XPCDecoder);
    a2[4] = result;
    *a2 = v15;
  }
  return result;
}

uint64_t _XPCKeyedDecodingContainer.superDecoder(forKey:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  long long v9 = *(_OWORD *)(*(void *)v2 + 80);
  uint64_t v7 = v9;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v8);
  (*(void (**)(uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(boxed_opaque_existential_1, a1);
  _XPCKeyedDecodingContainer._superDecoder(forKey:)(v8, a2);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.codingPath.getter in conformance _XPCKeyedDecodingContainer<A>(uint64_t a1)
{
  return CodingContainerWithMetadata.codingPath.getter(a1, (uint64_t)&protocol witness table for _XPCKeyedDecodingContainer<A>);
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.contains(_:) in conformance _XPCKeyedDecodingContainer<A>()
{
  return _XPCKeyedDecodingContainer.contains(_:)() & 1;
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.decodeNil(forKey:) in conformance _XPCKeyedDecodingContainer<A>(uint64_t a1)
{
  return _XPCKeyedDecodingContainer.decodeNil(forKey:)(a1) & 1;
}

float protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(uint64_t a1)
{
  _XPCKeyedDecodingContainer.decode<A>(_:forKey:)(a1, MEMORY[0x263F8D5C8], (uint64_t)&v3);
  if (!v1) {
    return v3;
  }
  return result;
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>()
{
  return KeyedDecodingContainerProtocol.decode(_:forKey:)();
}

{
  return KeyedDecodingContainerProtocol.decode(_:forKey:)();
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>()
{
  return KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)();
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  float result = KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)();
  if (v0) {
    return v2;
  }
  return result;
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  float result = KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)();
  if (v0) {
    return v2;
  }
  return result;
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  float result = KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)();
  if (v0) {
    return v2;
  }
  return result;
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  float result = KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)();
  if (v0) {
    return v2;
  }
  return result;
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  float result = KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x263F8E340]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x263F8E358]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x263F8E360]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x263F8E368]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x263F8E380]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x263F8E378]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x263F8E388]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x263F8E390]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(a1, a2, a3, MEMORY[0x263F8E3A0]);
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4() & 0x1FF;
}

{
  return a4() & 0x1FFFF;
}

{
  unint64_t v4;

  char v4 = a4();
  return v4 | ((HIDWORD(v4) & 1) << 32);
}

{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  float result = a4();
  if (v4) {
    return v6;
  }
  return result;
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent<A>(_:forKey:) in conformance _XPCKeyedDecodingContainer<A>()
{
  return KeyedDecodingContainerProtocol.decodeIfPresent<A>(_:forKey:)();
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.nestedUnkeyedContainer(forKey:) in conformance _XPCKeyedDecodingContainer<A>@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return _XPCKeyedDecodingContainer.nestedUnkeyedContainer(forKey:)(a1, a2);
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.superDecoder() in conformance _XPCKeyedDecodingContainer<A>@<X0>(uint64_t *a1@<X8>)
{
  return _XPCKeyedDecodingContainer.superDecoder()(a1);
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.superDecoder(forKey:) in conformance _XPCKeyedDecodingContainer<A>@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return _XPCKeyedDecodingContainer.superDecoder(forKey:)(a1, a2);
}

void *protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance _XPCKeyedDecodingContainer<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X8>)
{
  float result = _XPCKeyedDecodingContainer.__allocating_init(codingMetadata:buffer:)(a1, a2, a3);
  if (!v4) {
    *a4 = result;
  }
  return result;
}

void *protocol witness for SharableStorageContainer.init(codingMetadata:storage:) in conformance _XPCKeyedDecodingContainer<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  float result = _XPCKeyedDecodingContainer.__allocating_init(codingMetadata:storage:)(a1, a2, *a3);
  *a4 = result;
  return result;
}

uint64_t associated type witness table accessor for KeyedDecodingContainerProtocol.Key : CodingKey in _XPCKeyedDecodingContainer<A>(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 88);
}

double specialized Dictionary._Variant.removeValue(forKey:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(unint64_t, uint64_t)@<X2>, uint64_t *a4@<X3>, void (*a5)(unsigned char *, uint64_t)@<X4>, uint64_t a6@<X8>)
{
  uint64_t v10 = v6;
  swift_bridgeObjectRetain();
  unint64_t v14 = specialized __RawDictionaryStorage.find<A>(_:)(a1, a2);
  LOBYTE(a2) = v15;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v17 = *v10;
    uint64_t v19 = *v10;
    *uint64_t v10 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      specialized _NativeDictionary.copy()(a4, a5);
      uint64_t v17 = v19;
    }
    swift_bridgeObjectRelease();
    a3(*(void *)(v17 + 56) + 40 * v14, a6);
    specialized _NativeDictionary._delete(at:)(v14, v17);
    *uint64_t v10 = v17;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(a6 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a6 = 0u;
    *(_OWORD *)(a6 + 16) = 0u;
  }
  return result;
}

unint64_t specialized _NativeDictionary._delete(at:)(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v9 = Hasher._finalize()();
        double result = swift_bridgeObjectRelease();
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
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          uint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          char v15 = (void *)(v14 + 8 * v3);
          uint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *char v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *uint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  long long v9;
  long long v10;
  Swift::Int v11;
  unint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t v16;
  unint64_t v17;
  long long *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        uint64_t v11 = Hasher._finalize()();
        double result = swift_bridgeObjectRelease();
        uint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8) {
            goto LABEL_5;
          }
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          uint64_t v13 = *(void *)(a2 + 48);
          uint64_t v14 = (_OWORD *)(v13 + 16 * v3);
          char v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1) {
            *uint64_t v14 = *v15;
          }
          uint64_t v16 = *(void *)(a2 + 56);
          uint64_t v17 = v16 + 40 * v3;
          uint64_t v18 = (long long *)(v16 + 40 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            Swift::Int v9 = *v18;
            unint64_t v10 = v18[1];
            *(void *)(v17 + 32) = *((void *)v18 + 4);
            *(_OWORD *)uint64_t v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    BOOL v21 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    BOOL v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  *uint64_t v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  uint64_t v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void *specialized _NativeDictionary.copy()(uint64_t *a1, void (*a2)(unsigned char *, uint64_t))
{
  uint64_t v4 = v2;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v5 = *v2;
  uint64_t v6 = static _DictionaryStorage.copy(original:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    double result = (void *)swift_release();
LABEL_28:
    *uint64_t v4 = v7;
    return result;
  }
  uint64_t v27 = v4;
  double result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    double result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v28 = v5 + 64;
  int64_t v11 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v5 + 64);
  int64_t v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    int64_t v24 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v24 >= v15) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v28 + 8 * v24);
    ++v11;
    if (!v25)
    {
      int64_t v11 = v24 + 1;
      if (v24 + 1 >= v15) {
        goto LABEL_26;
      }
      unint64_t v25 = *(void *)(v28 + 8 * v11);
      if (!v25) {
        break;
      }
    }
LABEL_25:
    unint64_t v14 = (v25 - 1) & v25;
    unint64_t v17 = __clz(__rbit64(v25)) + (v11 << 6);
LABEL_12:
    uint64_t v18 = 16 * v17;
    uint64_t v19 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    uint64_t v22 = 40 * v17;
    outlined init with copy of XPCCodableObjectRepresentable(*(void *)(v5 + 56) + 40 * v17, (uint64_t)v29);
    uint64_t v23 = (void *)(*(void *)(v7 + 48) + v18);
    *uint64_t v23 = v20;
    v23[1] = v21;
    a2(v29, *(void *)(v7 + 56) + v22);
    double result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v15)
  {
LABEL_26:
    double result = (void *)swift_release();
    uint64_t v4 = v27;
    goto LABEL_28;
  }
  unint64_t v25 = *(void *)(v28 + 8 * v26);
  if (v25)
  {
    int64_t v11 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v11 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v11 >= v15) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v28 + 8 * v11);
    ++v26;
    if (v25) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t dispatch thunk of CodingContainerWithMetadata.codingMetadata.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t CodingContainerWithMetadata.codingPath.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (*(uint64_t (**)(void))(a2 + 8))();
  swift_bridgeObjectRelease();
  return v2;
}

void *DecodingBuffer.__allocating_init(bytes:index:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 32;
  uint64_t v5 = (2 * *(void *)(a1 + 16)) | 1;
  type metadata accessor for DecodingBuffer();
  double result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = v4;
  result[4] = 0;
  result[5] = v5;
  result[6] = a2;
  return result;
}

uint64_t DecodingBuffer.nextByte.getter()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[5] >> 1;
  uint64_t v3 = v2 - v1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v4 = v0[6];
  if (v4 >= v3)
  {
    int v5 = 0;
    return v5 | ((v4 >= v3) << 8);
  }
  uint64_t v6 = v1 + v4;
  if (__OFADD__(v1, v4)) {
    goto LABEL_13;
  }
  if (v6 >= v1 && v6 < v2)
  {
    int v5 = *(unsigned __int8 *)(v0[3] + v6);
    return v5 | ((v4 >= v3) << 8);
  }
LABEL_14:
  __break(1u);
  return result;
}

Swift::UInt8_optional __swiftcall DecodingBuffer.consume()()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[5] >> 1;
  uint64_t v3 = v2 - v1;
  if (__OFSUB__(v2, v1))
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v4 = v0[6];
  if (v4 < v3)
  {
    uint64_t v6 = v1 + v4;
    if (!__OFADD__(v1, v4))
    {
      if (v6 >= v1 && v6 < v2)
      {
        __int16 v5 = *(unsigned __int8 *)(v0[3] + v6);
        v0[6] = v4 + 1;
        return (Swift::UInt8_optional)(v5 | ((v4 >= v3) << 8));
      }
LABEL_14:
      __break(1u);
      return v8;
    }
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  __int16 v5 = 0;
  return (Swift::UInt8_optional)(v5 | ((v4 >= v3) << 8));
}

void *DecodingBuffer.createSubBuffer(_:)(uint64_t a1)
{
  uint64_t result = (void *)DecodingBuffer.consume(_:)(a1);
  if (result)
  {
    __int16 v5 = result;
    uint64_t v6 = v2;
    uint64_t v7 = v3;
    uint64_t v8 = v4;
    type metadata accessor for DecodingBuffer();
    uint64_t result = (void *)swift_allocObject();
    result[2] = v5;
    result[3] = v6;
    result[4] = v7;
    result[5] = v8;
    result[6] = 0;
  }
  return result;
}

uint64_t DecodingBuffer.deinit()
{
  swift_unknownObjectRelease();
  return v0;
}

uint64_t method lookup function for DecodingBuffer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DecodingBuffer);
}

uint64_t dispatch thunk of DecodingBuffer.nextByte.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))() & 0x1FF;
}

uint64_t dispatch thunk of DecodingBuffer.consume()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))() & 0x1FF;
}

uint64_t dispatch thunk of DecodingBuffer.consume(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of DecodingBuffer.createSubBuffer(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t XPCRichError.canRetry.getter()
{
  return *v0;
}

uint64_t XPCRichError.debugDescription.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance XPCRichError()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t destroy for XPCRichError()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeBufferWithCopyOfBuffer for XPCRichError(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for XPCRichError(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for XPCRichError(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCRichError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCRichError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void __XPC_INTERNAL_CRASH__(_:file:line:)(uint64_t a1, uint64_t a2)
{
}

{
  String.append(_:)(*(Swift::String *)&a1);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t xpc_uuid_get_uuid(_:)(void *a1)
{
  bytes = xpc_uuid_get_bytes(a1);
  if (bytes) {
    return *(void *)bytes;
  }
  else {
    return 0;
  }
}

xpc_object_t xpc_uuid_create_with_uuid(_:)(unsigned __int8 a1, unsigned __int8 a2, unsigned __int8 a3, unsigned __int8 a4, unsigned __int8 a5, unsigned __int8 a6, unsigned __int8 a7, unsigned __int8 a8, int a9, int a10)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uuid[0] = a1;
  uuid[1] = a2;
  uuid[2] = a3;
  uuid[3] = a4;
  uuid[4] = a5;
  uuid[5] = a6;
  uuid[6] = a7;
  uuid[7] = a8;
  int v12 = a9;
  int v13 = a10;
  return xpc_uuid_create(uuid);
}

void __XPC_API_MISUSE__(_:file:line:)(uint64_t a1, uint64_t a2)
{
}

uint64_t Array<A>.byteDescription.getter(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v16 = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v1, 0);
    uint64_t v3 = a1 + 32;
    lazy protocol witness table accessor for type UInt8 and conformance UInt8();
    do
    {
      ++v3;
      uint64_t v4 = String.init<A>(_:radix:uppercase:)();
      uint64_t v6 = v5;
      unint64_t v8 = *(void *)(v16 + 16);
      unint64_t v7 = *(void *)(v16 + 24);
      if (v8 >= v7 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1);
      }
      *(void *)(v16 + 16) = v8 + 1;
      uint64_t v9 = v16 + 16 * v8;
      *(void *)(v9 + 32) = v4;
      *(void *)(v9 + 40) = v6;
      --v1;
    }
    while (v1);
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [String]);
  lazy protocol witness table accessor for type [String] and conformance [A]();
  uint64_t v10 = BidirectionalCollection<>.joined(separator:)();
  int v12 = v11;
  swift_bridgeObjectRelease();
  v13._countAndFlagsBits = v10;
  v13._object = v12;
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 93;
  v14._object = (void *)0xE100000000000000;
  String.append(_:)(v14);
  return 91;
}

unint64_t lazy protocol witness table accessor for type [String] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [String] and conformance [A];
  if (!lazy protocol witness table cache variable for type [String] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&demangling cache variable for type metadata for [String]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String] and conformance [A]);
  }
  return result;
}

uint64_t static SuperCoderKey.defaultKey<A>(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v6 = type metadata accessor for Optional();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v17 - v9;
  uint64_t v11 = *(void *)(a1 - 8);
  MEMORY[0x270FA5388](v8);
  Swift::String v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch thunk of CodingKey.init(stringValue:)();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v10, 1, a1) == 1)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    a3[3] = (uint64_t)&type metadata for SuperCoderKey;
    a3[4] = lazy protocol witness table accessor for type SuperCoderKey and conformance SuperCoderKey();
    uint64_t result = swift_allocObject();
    *a3 = result;
    *(void *)(result + 16) = 0x7265707573;
    *(void *)(result + 24) = 0xE500000000000000;
    *(void *)(result + 32) = 0;
    *(unsigned char *)(result + 40) = 0;
  }
  else
  {
    int64_t v15 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
    v15(v13, v10, a1);
    a3[3] = a1;
    a3[4] = a2;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a3);
    return ((uint64_t (*)(uint64_t *, char *, uint64_t))v15)(boxed_opaque_existential_1, v13, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SuperCoderKey and conformance SuperCoderKey()
{
  unint64_t result = lazy protocol witness table cache variable for type SuperCoderKey and conformance SuperCoderKey;
  if (!lazy protocol witness table cache variable for type SuperCoderKey and conformance SuperCoderKey)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SuperCoderKey and conformance SuperCoderKey);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SuperCoderKey and conformance SuperCoderKey;
  if (!lazy protocol witness table cache variable for type SuperCoderKey and conformance SuperCoderKey)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SuperCoderKey and conformance SuperCoderKey);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SuperCoderKey and conformance SuperCoderKey;
  if (!lazy protocol witness table cache variable for type SuperCoderKey and conformance SuperCoderKey)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SuperCoderKey and conformance SuperCoderKey);
  }
  return result;
}

uint64_t sub_20DA182C8()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 41, 7);
}

ValueMetadata *type metadata accessor for SuperCoderKey()
{
  return &type metadata for SuperCoderKey;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SuperCoderKey@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = result;
  *(void *)(a3 + 8) = a2;
  *(void *)(a3 + 16) = 0;
  *(unsigned char *)(a3 + 24) = 0;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SuperCoderKey(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SuperCoderKey and conformance SuperCoderKey();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SuperCoderKey(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SuperCoderKey and conformance SuperCoderKey();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t dispatch thunk of static CodingContainer.wireType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t specialized CodingIntegerPrimitive.encodeValue(to:)(uint64_t a1, __int16 a2)
{
  uint64_t v4 = (uint64_t *)(a1 + 16);
  swift_beginAccess();
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a1 + 16) = v5;
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v5 + 16) + 1, 1, (char *)v5);
    uint64_t v5 = result;
    *uint64_t v4 = result;
  }
  unint64_t v8 = *(void *)(v5 + 16);
  unint64_t v7 = *(void *)(v5 + 24);
  if (v8 >= v7 >> 1)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, (char *)v5);
    uint64_t v5 = result;
    *uint64_t v4 = result;
  }
  *(void *)(v5 + 16) = v8 + 1;
  *(unsigned char *)(v5 + v8 + 32) = a2;
  uint64_t v9 = *v4;
  unint64_t v11 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v11 >= v10 >> 1)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1, (char *)v9);
    uint64_t v9 = result;
    *uint64_t v4 = result;
  }
  *(void *)(v9 + 16) = v11 + 1;
  *(unsigned char *)(v9 + v11 + 32) = HIBYTE(a2);
  return result;
}

uint64_t specialized CodingPrimitive.encode(to:)(uint64_t a1, __int16 a2)
{
  uint64_t v4 = (char **)(a1 + 16);
  swift_beginAccess();
  uint64_t v5 = *(char **)(a1 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a1 + 16) = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v5 + 2) + 1, 1, v5);
    *uint64_t v4 = v5;
  }
  unint64_t v8 = *((void *)v5 + 2);
  unint64_t v7 = *((void *)v5 + 3);
  if (v8 >= v7 >> 1)
  {
    uint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, v5);
    *uint64_t v4 = v5;
  }
  *((void *)v5 + 2) = v8 + 1;
  v5[v8 + 32] = 4;
  return specialized CodingIntegerPrimitive.encodeValue(to:)(a1, a2);
}

{
  uint64_t *v4;
  uint64_t v5;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;

  uint64_t v4 = (uint64_t *)(a1 + 16);
  swift_beginAccess();
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a1 + 16) = v5;
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v5 + 16) + 1, 1, (char *)v5);
    uint64_t v5 = result;
    *uint64_t v4 = result;
  }
  unint64_t v8 = *(void *)(v5 + 16);
  unint64_t v7 = *(void *)(v5 + 24);
  if (v8 >= v7 >> 1)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, (char *)v5);
    uint64_t v5 = result;
    *uint64_t v4 = result;
  }
  *(void *)(v5 + 16) = v8 + 1;
  *(unsigned char *)(v5 + v8 + 32) = 9;
  uint64_t v9 = *v4;
  unint64_t v11 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v11 >= v10 >> 1)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1, (char *)v9);
    uint64_t v9 = result;
    *uint64_t v4 = result;
  }
  *(void *)(v9 + 16) = v11 + 1;
  *(unsigned char *)(v9 + v11 + 32) = a2;
  uint64_t v12 = *v4;
  Swift::String v14 = *(void *)(*v4 + 16);
  Swift::String v13 = *(void *)(*v4 + 24);
  if (v14 >= v13 >> 1)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v13 > 1), v14 + 1, 1, (char *)v12);
    uint64_t v12 = result;
    *uint64_t v4 = result;
  }
  *(void *)(v12 + 16) = v14 + 1;
  *(unsigned char *)(v12 + v14 + 32) = HIBYTE(a2);
  return result;
}

uint64_t specialized CodingPrimitive.encode(to:)(uint64_t a1, float a2)
{
  uint64_t v4 = (char **)(a1 + 16);
  swift_beginAccess();
  uint64_t v5 = *(char **)(a1 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a1 + 16) = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v5 + 2) + 1, 1, v5);
    *uint64_t v4 = v5;
  }
  unint64_t v8 = *((void *)v5 + 2);
  unint64_t v7 = *((void *)v5 + 3);
  if (v8 >= v7 >> 1)
  {
    uint64_t v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v7 > 1), v8 + 1, 1, v5);
    *uint64_t v4 = v5;
  }
  *((void *)v5 + 2) = v8 + 1;
  v5[v8 + 32] = 13;
  swift_retain();
  specialized CodingIntegerPrimitive.forEachByte(do:)(LODWORD(a2), a1);
  return swift_release();
}

void *_XPCKeyedEncodingContainer.init(codingMetadata:storage:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[2] = a1;
  v3[3] = a2;
  v3[4] = a3;
  return v3;
}

uint64_t _XPCKeyedEncodingContainer.encodeNil(forKey:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(*v1 + 80);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v5 = (char *)v20 - v4;
  uint64_t v6 = *(void (**)(char *))(v3 + 16);
  v20[1] = v7;
  v6((char *)v20 - v4);
  uint64_t v8 = v1[4];
  swift_retain();
  uint64_t v9 = dispatch thunk of CodingKey.stringValue.getter();
  uint64_t v11 = v10;
  swift_beginAccess();
  uint64_t v12 = *(void *)(v8 + 16);
  if (*(void *)(v12 + 16) && (unint64_t v13 = specialized __RawDictionaryStorage.find<A>(_:)(v9, v11), (v14 & 1) != 0))
  {
    outlined init with copy of XPCCodableObjectRepresentable(*(void *)(v12 + 56) + 40 * v13, (uint64_t)&v21);
  }
  else
  {
    uint64_t v23 = 0;
    long long v21 = 0u;
    long long v22 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v15 = *((void *)&v22 + 1);
  uint64_t result = outlined destroy of DecodingContainer?((uint64_t)&v21, &demangling cache variable for type metadata for EncodingContainer?);
  if (v15)
  {
    __break(1u);
  }
  else
  {
    swift_retain();
    uint64_t v17 = dispatch thunk of CodingKey.stringValue.getter();
    uint64_t v19 = v18;
    *((void *)&v22 + 1) = &type metadata for NilPrimitive;
    uint64_t v23 = &protocol witness table for NilPrimitive;
    swift_beginAccess();
    specialized Dictionary.subscript.setter((uint64_t)&v21, v17, v19);
    swift_endAccess();
    return swift_release();
  }
  return result;
}

uint64_t _XPCKeyedEncodingContainer.nestedUnkeyedContainer(forKey:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *v2;
  uint64_t v4 = CodingMetadata.appending<A>(codingKey:)(a1, v2[2], v2[3], *(void *)(*v2 + 80), *(void *)(*v2 + 88));
  uint64_t v6 = v5;
  uint64_t v7 = v2[4];
  swift_retain();
  uint64_t v8 = dispatch thunk of CodingKey.stringValue.getter();
  uint64_t v10 = v9;
  swift_beginAccess();
  uint64_t v11 = *(void *)(v7 + 16);
  if (*(void *)(v11 + 16) && (unint64_t v12 = specialized __RawDictionaryStorage.find<A>(_:)(v8, v10), (v13 & 1) != 0))
  {
    outlined init with copy of XPCCodableObjectRepresentable(*(void *)(v11 + 56) + 40 * v12, (uint64_t)&v26);
  }
  else
  {
    uint64_t v28 = 0;
    long long v26 = 0u;
    long long v27 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_release();
  uint64_t v14 = *((void *)&v27 + 1);
  if (*((void *)&v27 + 1))
  {
    uint64_t v15 = v28;
    uint64_t v16 = __swift_project_boxed_opaque_existential_1(&v26, *((uint64_t *)&v27 + 1));
    *((void *)&v30 + 1) = v14;
    uint64_t v31 = *(_UNKNOWN ***)(v15 + 8);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v29);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(boxed_opaque_existential_1, v16, v14);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v26);
  }
  else
  {
    outlined destroy of DecodingContainer?((uint64_t)&v26, &demangling cache variable for type metadata for EncodingContainer?);
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v31 = 0;
  }
  uint64_t v18 = type metadata accessor for _XPCUnkeyedEncodingContainer();
  char v19 = static SharableStorageContainer.getExisting<A>(container:codingMetadata:)((uint64_t)&v26, (uint64_t)&v29, v4, v6, v3, v18, (uint64_t)&protocol witness table for _XPCKeyedEncodingContainer<A>, (uint64_t)&protocol witness table for _XPCUnkeyedEncodingContainer, (uint64_t)&protocol witness table for _XPCUnkeyedEncodingContainer.UnkeyedEncodingStorage);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of DecodingContainer?((uint64_t)&v29, &demangling cache variable for type metadata for CodingContainer?);
  uint64_t v20 = v26;
  if (v19)
  {
    swift_retain();
    uint64_t v21 = dispatch thunk of CodingKey.stringValue.getter();
    uint64_t v23 = v22;
    *((void *)&v30 + 1) = v18;
    uint64_t v31 = &protocol witness table for _XPCUnkeyedEncodingContainer;
    *(void *)&long long v29 = v20;
    swift_beginAccess();
    swift_retain();
    specialized Dictionary.subscript.setter((uint64_t)&v29, v21, v23);
    swift_endAccess();
    swift_release();
  }
  a2[3] = v18;
  uint64_t result = lazy protocol witness table accessor for type _XPCEncoder and conformance _XPCEncoder(&lazy protocol witness table cache variable for type _XPCUnkeyedEncodingContainer and conformance _XPCUnkeyedEncodingContainer, (void (*)(uint64_t))type metadata accessor for _XPCUnkeyedEncodingContainer);
  a2[4] = result;
  *a2 = v20;
  return result;
}

uint64_t _XPCKeyedEncodingContainer.superEncoder()@<X0>(uint64_t *a1@<X8>)
{
  static SuperCoderKey.defaultKey<A>(_:)(*(void *)(*(void *)v1 + 80), *(void *)(*(void *)v1 + 88), v4);
  _XPCKeyedEncodingContainer._superEncoder(forKey:)(v4, a1);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
}

uint64_t _XPCKeyedEncodingContainer._superEncoder(forKey:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  uint64_t v7 = __swift_project_boxed_opaque_existential_1(a1, v5);
  uint64_t v8 = CodingMetadata.appending<A>(codingKey:)((uint64_t)v7, *(void *)(v2 + 16), *(void *)(v2 + 24), v5, v6);
  uint64_t v10 = v9;
  uint64_t v11 = type metadata accessor for _XPCEncoder();
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 32) = 0u;
  *(_OWORD *)(v12 + 48) = 0u;
  *(void *)(v12 + 64) = 0;
  *(void *)(v12 + 16) = v8;
  *(void *)(v12 + 24) = v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  swift_retain();
  uint64_t v13 = dispatch thunk of CodingKey.stringValue.getter();
  uint64_t v15 = v14;
  void v17[3] = v11;
  v17[4] = &protocol witness table for _XPCEncoder;
  v17[0] = v12;
  swift_beginAccess();
  swift_retain();
  specialized Dictionary.subscript.setter((uint64_t)v17, v13, v15);
  swift_endAccess();
  swift_release();
  a2[3] = v11;
  uint64_t result = lazy protocol witness table accessor for type _XPCEncoder and conformance _XPCEncoder(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, (void (*)(uint64_t))type metadata accessor for _XPCEncoder);
  a2[4] = result;
  *a2 = v12;
  return result;
}

uint64_t _XPCKeyedEncodingContainer.superEncoder(forKey:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  long long v9 = *(_OWORD *)(*(void *)v2 + 80);
  uint64_t v7 = v9;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v8);
  (*(void (**)(uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(boxed_opaque_existential_1, a1);
  _XPCKeyedEncodingContainer._superEncoder(forKey:)(v8, a2);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.codingPath.getter in conformance _XPCKeyedEncodingContainer<A1>(uint64_t a1)
{
  return CodingContainerWithMetadata.codingPath.getter(a1, (uint64_t)&protocol witness table for _XPCKeyedEncodingContainer<A>);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encodeNil(forKey:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1)
{
  return _XPCKeyedEncodingContainer.encodeNil(forKey:)(a1);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encode(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(char a1, uint64_t a2)
{
  char v3 = a1;
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)((uint64_t)&v3, a2, MEMORY[0x263F8D4F8], MEMORY[0x263F8D500]);
}

{
  char v3;

  char v3 = a1;
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)((uint64_t)&v3, a2, MEMORY[0x263F8E498], MEMORY[0x263F8E4A0]);
}

{
  char v3;

  char v3 = a1;
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)((uint64_t)&v3, a2, MEMORY[0x263F8E778], MEMORY[0x263F8E780]);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encode(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1, float a2)
{
  float v3 = a2;
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)((uint64_t)&v3, a1, MEMORY[0x263F8D5C8], MEMORY[0x263F8D5D8]);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encode(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)((uint64_t)&v3, a2, MEMORY[0x263F8D6C8], MEMORY[0x263F8D6D0]);
}

{
  uint64_t v3;

  uint64_t v3 = a1;
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)((uint64_t)&v3, a2, MEMORY[0x263F8E5C0], MEMORY[0x263F8E5C8]);
}

{
  uint64_t v3;

  uint64_t v3 = a1;
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)((uint64_t)&v3, a2, MEMORY[0x263F8D9D0], MEMORY[0x263F8D9D8]);
}

{
  uint64_t v3;

  uint64_t v3 = a1;
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)((uint64_t)&v3, a2, MEMORY[0x263F8E970], MEMORY[0x263F8E978]);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encode(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(__int16 a1, uint64_t a2)
{
  __int16 v3 = a1;
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)((uint64_t)&v3, a2, MEMORY[0x263F8E4F0], MEMORY[0x263F8E4F8]);
}

{
  __int16 v3;

  __int16 v3 = a1;
  return _XPCKeyedEncodingContainer.encode<A>(_:forKey:)((uint64_t)&v3, a2, MEMORY[0x263F8E888], MEMORY[0x263F8E890]);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encode(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return protocol witness for KeyedEncodingContainerProtocol.encode(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, a5, MEMORY[0x263F8E428]);
}

{
  return protocol witness for KeyedEncodingContainerProtocol.encode(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, a5, MEMORY[0x263F8E430]);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encode(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v11 = type metadata accessor for _XPCKeyedEncodingContainer();
  return a6(a1, a2, a3, v11, a5);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encodeConditional<A>(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>()
{
  return KeyedEncodingContainerProtocol.encodeConditional<A>(_:forKey:)();
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>()
{
  return KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:)();
}

{
  type metadata accessor for _XPCKeyedEncodingContainer();
  return KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:)();
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, a5, MEMORY[0x263F8E3B8]);
}

{
  return protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, a5, MEMORY[0x263F8E3C8]);
}

{
  return protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, a5, MEMORY[0x263F8E3F0]);
}

{
  return protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, a5, MEMORY[0x263F8E3D0]);
}

{
  return protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, a5, MEMORY[0x263F8E418]);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, MEMORY[0x263F8E3C0]);
}

{
  return protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, MEMORY[0x263F8E3E8]);
}

{
  return protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, MEMORY[0x263F8E410]);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, MEMORY[0x263F8E3D8]);
}

{
  return protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, MEMORY[0x263F8E3F8]);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, MEMORY[0x263F8E3E0]);
}

{
  return protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, MEMORY[0x263F8E408]);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, a5, a6, MEMORY[0x263F8E400]);
}

{
  return protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(a1, a2, a3, a4, a5, a6, MEMORY[0x263F8E420]);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, uint64_t, uint64_t, uint64_t))
{
  uint64_t v9 = type metadata accessor for _XPCKeyedEncodingContainer();
  return a5(a1 & 0x1FF, a2, v9, a4);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, uint64_t, uint64_t, uint64_t))
{
  uint64_t v9 = type metadata accessor for _XPCKeyedEncodingContainer();
  return a5(a1 & 0x1FFFF, a2, v9, a4);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v9 = type metadata accessor for _XPCKeyedEncodingContainer();
  return a5(a1 | ((HIDWORD(a1) & 1) << 32), a2, v9, a4);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v10 = a2 & 1;
  uint64_t v11 = type metadata accessor for _XPCKeyedEncodingContainer();
  return a6(a1, v10, a3, v11, a5);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v12 = a3 & 1;
  uint64_t v13 = type metadata accessor for _XPCKeyedEncodingContainer();
  return a7(a1, a2, v12, a4, v13, a6);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.encodeIfPresent<A>(_:forKey:) in conformance _XPCKeyedEncodingContainer<A>()
{
  return KeyedEncodingContainerProtocol.encodeIfPresent<A>(_:forKey:)();
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.nestedUnkeyedContainer(forKey:) in conformance _XPCKeyedEncodingContainer<A>@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return _XPCKeyedEncodingContainer.nestedUnkeyedContainer(forKey:)(a1, a2);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.superEncoder() in conformance _XPCKeyedEncodingContainer<A>@<X0>(uint64_t *a1@<X8>)
{
  return _XPCKeyedEncodingContainer.superEncoder()(a1);
}

uint64_t protocol witness for KeyedEncodingContainerProtocol.superEncoder(forKey:) in conformance _XPCKeyedEncodingContainer<A>@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return _XPCKeyedEncodingContainer.superEncoder(forKey:)(a1, a2);
}

void *protocol witness for SharableStorageContainer.init(codingMetadata:storage:) in conformance _XPCKeyedEncodingContainer<A>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  uint64_t result = _XPCKeyedEncodingContainer.__allocating_init(codingMetadata:storage:)(a1, a2, *a3);
  *a4 = result;
  return result;
}

uint64_t static String._copying(_:)()
{
  unint64_t v0 = String.subscript.getter();
  uint64_t v4 = static String._copying(_:)(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t static String._copying(_:)(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = specialized Collection.count.getter(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v9, 0);
      unint64_t v12 = specialized Sequence._copySequenceContents(initializing:)((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        _StringObject.sharedUTF8.getter();
LABEL_4:
        JUMPOUT(0x2105623C0);
      }
    }
    else
    {
      uint64_t v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x2105623C0](v11 + 4, v11[2]);
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
    return MEMORY[0x2105623C0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t specialized Collection.count.getter(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = _StringGuts._slowEnsureMatchingEncoding(_:)(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = _StringGuts._slowEnsureMatchingEncoding(_:)(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

void *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  void v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t specialized Sequence._copySequenceContents(initializing:)(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
    void v9[3] = a7;
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
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = _StringGuts._slowEnsureMatchingEncoding(_:)(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = String.UTF8View._foreignSubscript(position:)();
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
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = _StringObject.sharedUTF8.getter();
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
    uint64_t result = _StringGuts._slowEnsureMatchingEncoding(_:)(v12, a6, a7);
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
    unint64_t v12 = String.UTF8View._foreignIndex(after:)();
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
    uint64_t v5 = MEMORY[0x210562430](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t XPC_TYPE_ARRAY.getter()
{
  return MEMORY[0x263EF86D8];
}

uint64_t XPC_TYPE_INT64.getter()
{
  return MEMORY[0x263EF8738];
}

uint64_t XPC_TYPE_UINT64.getter()
{
  return MEMORY[0x263EF87A0];
}

uint64_t XPC_TYPE_DOUBLE.getter()
{
  return MEMORY[0x263EF8710];
}

uint64_t XPC_TYPE_BOOL.getter()
{
  return MEMORY[0x263EF86E0];
}

uint64_t XPC_TYPE_CONNECTION.getter()
{
  return MEMORY[0x263EF86F0];
}

uint64_t XPC_ARRAY_APPEND.getter()
{
  return -1;
}

uint64_t XPC_TYPE_NULL.getter()
{
  return MEMORY[0x263EF8758];
}

uint64_t XPC_TYPE_DATE.getter()
{
  return MEMORY[0x263EF8700];
}

uint64_t XPC_TYPE_DATA.getter()
{
  return MEMORY[0x263EF86F8];
}

uint64_t XPC_TYPE_STRING.getter()
{
  return MEMORY[0x263EF8798];
}

uint64_t XPC_TYPE_UUID.getter()
{
  return MEMORY[0x263EF87A8];
}

uint64_t XPC_TYPE_FD.getter()
{
  return MEMORY[0x263EF8728];
}

uint64_t XPC_TYPE_SHMEM.getter()
{
  return MEMORY[0x263EF8790];
}

uint64_t XPC_TYPE_MACH_SEND.getter()
{
  return MEMORY[0x263EF8748];
}

uint64_t XPC_TYPE_ERROR.getter()
{
  return MEMORY[0x263EF8720];
}

uint64_t XPC_TYPE_ENDPOINT.getter()
{
  return MEMORY[0x263EF8718];
}

uint64_t XPC_TYPE_MACH_RECV.getter()
{
  return MEMORY[0x263EF8740];
}

uint64_t XPC_TYPE_MACH_SEND_ONCE.getter()
{
  return MEMORY[0x263EF8750];
}

uint64_t XPC_TYPE_RICH_ERROR.getter()
{
  return MEMORY[0x263EF8770];
}

uint64_t XPC_TYPE_ACTIVITY.getter()
{
  return MEMORY[0x263EF86D0];
}

uint64_t XPC_TYPE_POINTER.getter()
{
  return MEMORY[0x263EF8768];
}

uint64_t XPC_TYPE_SERIALIZER.getter()
{
  return MEMORY[0x263EF8778];
}

uint64_t XPC_TYPE_PIPE.getter()
{
  return MEMORY[0x263EF8760];
}

uint64_t XPC_TYPE_BUNDLE.getter()
{
  return MEMORY[0x263EF86E8];
}

uint64_t XPC_TYPE_SERVICE.getter()
{
  return MEMORY[0x263EF8780];
}

uint64_t XPC_TYPE_SERVICE_INSTANCE.getter()
{
  return MEMORY[0x263EF8788];
}

uint64_t XPC_TYPE_FILE_TRANSFER.getter()
{
  return MEMORY[0x263EF8730];
}

void one-time initialization function for XPC_ERROR_KEY_DESCRIPTION()
{
  XPC_ERROR_KEY_DESCRIPTION = *MEMORY[0x263EF86B0];
}

uint64_t XPC_ERROR_KEY_DESCRIPTION.getter()
{
  return XPC_ERROR_KEY_DESCRIPTION.getter(one-time initialization token for XPC_ERROR_KEY_DESCRIPTION, (uint64_t)&XPC_ERROR_KEY_DESCRIPTION);
}

void one-time initialization function for XPC_EVENT_KEY_NAME()
{
  XPC_EVENT_KEY_NAME = *MEMORY[0x263EF86C8];
}

id XPC_BOOL_TRUE.getter()
{
  return XPC_BOOL_TRUE.getter(_swift_xpc_BOOL_true);
}

uint64_t _swift_xpc_BOOL_true()
{
  uint64_t v0 = MEMORY[0x263EF8698];
  id v1 = MEMORY[0x263EF8698];
  return v0;
}

id XPC_BOOL_FALSE.getter()
{
  return XPC_BOOL_TRUE.getter(_swift_xpc_BOOL_false);
}

uint64_t _swift_xpc_BOOL_false()
{
  uint64_t v0 = MEMORY[0x263EF8690];
  id v1 = MEMORY[0x263EF8690];
  return v0;
}

id XPC_ERROR_CONNECTION_INTERRUPTED.getter()
{
  return XPC_BOOL_TRUE.getter(_swift_xpc_connection_interrupted);
}

uint64_t _swift_xpc_connection_interrupted()
{
  uint64_t v0 = MEMORY[0x263EF86A0];
  id v1 = MEMORY[0x263EF86A0];
  return v0;
}

id XPC_ERROR_CONNECTION_INVALID.getter()
{
  return XPC_BOOL_TRUE.getter(_swift_xpc_connection_invalid);
}

uint64_t _swift_xpc_connection_invalid()
{
  uint64_t v0 = MEMORY[0x263EF86A8];
  id v1 = MEMORY[0x263EF86A8];
  return v0;
}

id XPC_ERROR_TERMINATION_IMMINENT.getter()
{
  return XPC_BOOL_TRUE.getter(_swift_xpc_connection_termination_imminent);
}

uint64_t _swift_xpc_connection_termination_imminent()
{
  uint64_t v0 = MEMORY[0x263EF86C0];
  id v1 = MEMORY[0x263EF86C0];
  return v0;
}

id XPC_ERROR_PEER_CODE_SIGNING_REQUIREMENT.getter()
{
  return XPC_BOOL_TRUE.getter(_swift_xpc_connection_error_peer_code_signing_requirement);
}

id XPC_BOOL_TRUE.getter(uint64_t (*a1)(void))
{
  id result = (id)a1();
  if (!result) {
    __break(1u);
  }
  return result;
}

uint64_t _swift_xpc_connection_error_peer_code_signing_requirement()
{
  uint64_t v0 = MEMORY[0x263EF86B8];
  id v1 = MEMORY[0x263EF86B8];
  return v0;
}

uint64_t xpc_session_create_flags_t.rawValue.getter()
{
  return *(void *)v0;
}

XPC::xpc_session_create_flags_t __swiftcall xpc_session_create_flags_t.init(rawValue:)(XPC::xpc_session_create_flags_t rawValue)
{
  v1->_swift_shim = rawValue._swift_shim;
  return rawValue;
}

void static xpc_session_create_flags_t.none.getter(void *a1@<X8>)
{
  *a1 = 0;
}

void static xpc_session_create_flags_t.privileged.getter(void *a1@<X8>)
{
  *a1 = 2;
}

void static xpc_session_create_flags_t.inactive.getter(void *a1@<X8>)
{
  *a1 = 1;
}

id xpc_session_create_xpc_service(_:_:_:_:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  return xpc_session_create_xpc_service(_:_:_:_:)(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, void))_swift_xpc_session_create_xpc_service_0);
}

xpc_session_t _swift_xpc_session_create_xpc_service_0(const char *a1, void *a2, xpc_session_create_flags_t a3, xpc_rich_error_t *a4)
{
  unint64_t v7 = a2;
  xpc_session_t xpc_service = xpc_session_create_xpc_service(a1, v7, a3, a4);

  return xpc_service;
}

id xpc_session_create_mach_service(_:_:_:_:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  return xpc_session_create_xpc_service(_:_:_:_:)(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, void))_swift_xpc_session_create_mach_service_0);
}

id xpc_session_create_xpc_service(_:_:_:_:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, void))
{
  uint64_t v5 = (void *)a5(a1, a2, *a3);

  return v5;
}

xpc_session_t _swift_xpc_session_create_mach_service_0(const char *a1, void *a2, xpc_session_create_flags_t a3, xpc_rich_error_t *a4)
{
  unint64_t v7 = a2;
  xpc_session_t mach_service = xpc_session_create_mach_service(a1, v7, a3, a4);

  return mach_service;
}

uint64_t xpc_session_set_incoming_message_handler(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return xpc_session_set_incoming_message_handler(_:_:)(a1, a2, a3, (uint64_t)&block_descriptor_1, (void (*)(uint64_t, void *))_swift_xpc_session_set_incoming_message_handler_0);
}

uint64_t xpc_session_set_cancel_handler(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return xpc_session_set_incoming_message_handler(_:_:)(a1, a2, a3, (uint64_t)&block_descriptor_3, (void (*)(uint64_t, void *))_swift_xpc_session_set_cancel_handler_0);
}

uint64_t xpc_session_set_incoming_message_handler(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, void *))
{
  v9[4] = a2;
  void v9[5] = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object) -> ();
  void v9[3] = a4;
  unint64_t v7 = _Block_copy(v9);
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  a5(a1, v7);
  _Block_release(v7);
  return swift_unknownObjectRelease();
}

BOOL xpc_session_activate(_:_:)(void *a1, xpc_rich_error_t *a2)
{
  return _swift_xpc_session_activate(a1, a2);
}

xpc_rich_error_t xpc_session_send_message(_:_:)(void *a1, void *a2)
{
  xpc_rich_error_t v2 = _swift_xpc_session_send_message(a1, a2);

  return v2;
}

id xpc_session_send_message_with_reply_sync(_:_:_:)(void *a1, void *a2, xpc_rich_error_t *a3)
{
  id v3 = _swift_xpc_session_send_message_with_reply_sync(a1, a2, a3);

  return v3;
}

uint64_t xpc_session_send_message_with_reply_async(_:_:_:)(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  v8[4] = a3;
  uint64_t v8[5] = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object?, @guaranteed OS_xpc_object?) -> ();
  uint64_t v8[3] = &block_descriptor_6;
  uint64_t v6 = _Block_copy(v8);
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  _swift_xpc_session_send_message_with_reply_async(a1, a2, v6);
  _Block_release(v6);
  return swift_unknownObjectRelease();
}

void xpc_listener_copy_description(_:)()
{
  _StringGuts.grow(_:)(77);
  v0._countAndFlagsBits = 0x5041204320435058;
  v0._object = (void *)0xEA00000000002049;
  String.append(_:)(v0);
  v1._countAndFlagsBits = StaticString.description.getter();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  v2._object = (void *)0x800000020DA31C20;
  v2._countAndFlagsBits = 0xD000000000000041;
  String.append(_:)(v2);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void xpc_listener_create(_:_:_:_:_:)()
{
  _StringGuts.grow(_:)(77);
  v0._countAndFlagsBits = 0x5041204320435058;
  v0._object = (void *)0xEA00000000002049;
  String.append(_:)(v0);
  v1._countAndFlagsBits = StaticString.description.getter();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  v2._object = (void *)0x800000020DA31C20;
  v2._countAndFlagsBits = 0xD000000000000041;
  String.append(_:)(v2);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void xpc_listener_activate(_:_:)()
{
  _StringGuts.grow(_:)(77);
  v0._countAndFlagsBits = 0x5041204320435058;
  v0._object = (void *)0xEA00000000002049;
  String.append(_:)(v0);
  v1._countAndFlagsBits = StaticString.description.getter();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  v2._object = (void *)0x800000020DA31C20;
  v2._countAndFlagsBits = 0xD000000000000041;
  String.append(_:)(v2);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void xpc_listener_cancel(_:)()
{
  _StringGuts.grow(_:)(77);
  v0._countAndFlagsBits = 0x5041204320435058;
  v0._object = (void *)0xEA00000000002049;
  String.append(_:)(v0);
  v1._countAndFlagsBits = StaticString.description.getter();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  v2._object = (void *)0x800000020DA31C20;
  v2._countAndFlagsBits = 0xD000000000000041;
  String.append(_:)(v2);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void xpc_listener_reject_peer(_:_:)()
{
  _StringGuts.grow(_:)(77);
  v0._countAndFlagsBits = 0x5041204320435058;
  v0._object = (void *)0xEA00000000002049;
  String.append(_:)(v0);
  v1._countAndFlagsBits = StaticString.description.getter();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  v2._object = (void *)0x800000020DA31C20;
  v2._countAndFlagsBits = 0xD000000000000041;
  String.append(_:)(v2);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

id xpc_retain(_:)(void *a1)
{
  id result = _swift_xpc_retain(a1);
  if (!result) {
    __break(1u);
  }
  return result;
}

id _swift_xpc_retain(void *a1)
{
  id v1 = a1;
  Swift::String v2 = xpc_retain(v1);

  return v2;
}

void _swift_xpc_release(void *a1)
{
  id v1 = a1;
  xpc_release(v1);
}

unint64_t lazy protocol witness table accessor for type xpc_session_create_flags_t and conformance xpc_session_create_flags_t()
{
  unint64_t result = lazy protocol witness table cache variable for type xpc_session_create_flags_t and conformance xpc_session_create_flags_t;
  if (!lazy protocol witness table cache variable for type xpc_session_create_flags_t and conformance xpc_session_create_flags_t)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type xpc_session_create_flags_t and conformance xpc_session_create_flags_t);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type xpc_session_create_flags_t and conformance xpc_session_create_flags_t;
  if (!lazy protocol witness table cache variable for type xpc_session_create_flags_t and conformance xpc_session_create_flags_t)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type xpc_session_create_flags_t and conformance xpc_session_create_flags_t);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type xpc_session_create_flags_t and conformance xpc_session_create_flags_t;
  if (!lazy protocol witness table cache variable for type xpc_session_create_flags_t and conformance xpc_session_create_flags_t)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type xpc_session_create_flags_t and conformance xpc_session_create_flags_t);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type xpc_session_create_flags_t and conformance xpc_session_create_flags_t;
  if (!lazy protocol witness table cache variable for type xpc_session_create_flags_t and conformance xpc_session_create_flags_t)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type xpc_session_create_flags_t and conformance xpc_session_create_flags_t);
  }
  return result;
}

ValueMetadata *type metadata accessor for xpc_session_create_flags_t()
{
  return &type metadata for xpc_session_create_flags_t;
}

ValueMetadata *type metadata accessor for xpc_listener_create_flags_t()
{
  return &type metadata for xpc_listener_create_flags_t;
}

uint64_t Decoder.codingMetadata.getter()
{
  uint64_t v0 = dispatch thunk of Decoder.codingPath.getter();
  dispatch thunk of Decoder.userInfo.getter();
  return v0;
}

uint64_t static CodingUserInfoKey.xpcCodable.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for xpcCodable != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for CodingUserInfoKey();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static CodingUserInfoKey.xpcCodable);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t destroy for CodingMetadata()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeBufferWithCopyOfBuffer for CodingMetadata(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for CodingMetadata(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for CodingMetadata(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CodingMetadata(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CodingMetadata(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CodingMetadata()
{
  return &type metadata for CodingMetadata;
}

uint64_t XPCDecoder.__allocating_init(userInfo:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t XPCDecoder.init(userInfo:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t XPCDecoder.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t XPCDecoder.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t method lookup function for XPCDecoder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCDecoder);
}

uint64_t dispatch thunk of XPCDecoder.__allocating_init(userInfo:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of XPCDecoder.decode<A>(_:from:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t _XPCDecoder.decodeAsXPCCodableObjectRepresentable<A>()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2;
  uint64_t v7 = type metadata accessor for Optional();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v47 - v9;
  uint64_t v11 = swift_conformsToProtocol2();
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  if (v11) {
    uint64_t v13 = a1;
  }
  else {
    uint64_t v13 = 0;
  }
  if (!v13)
  {
    uint64_t v58 = 0;
    unint64_t v59 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    uint64_t v58 = 0x6465746365707845;
    unint64_t v59 = 0xE900000000000020;
    v28._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v28);
    swift_bridgeObjectRelease();
    v29._countAndFlagsBits = 0xD000000000000023;
    v29._object = (void *)0x800000020DA31D50;
    String.append(_:)(v29);
    uint64_t v30 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v32 = v31;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v30 - 8) + 104))(v32, *MEMORY[0x263F8DCB8], v30);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  uint64_t v60 = type metadata accessor for _XPCDecoder();
  uint64_t v61 = _s3XPC11_XPCDecoderCACs7DecoderAAWlTm_1((unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder, v14, (void (*)(uint64_t))type metadata accessor for _XPCDecoder);
  uint64_t v58 = v4;
  swift_retain();
  uint64_t result = XPCCodableObject.init(from:)(&v58, (uint64_t)&v55);
  if (!v3)
  {
    uint64_t v50 = v8;
    uint64_t v51 = v7;
    uint64_t v52 = a2;
    uint64_t v16 = v55;
    char v53 = *(uint64_t (**)(uint64_t, uint64_t))(v12 + 24);
    uint64_t v17 = v53(v13, v12);
    uint64_t v54 = v16;
    Swift::UInt v18 = MEMORY[0x2105634B0](v16);
    LOBYTE(v16) = specialized Set.contains(_:)(v18, v17);
    swift_bridgeObjectRelease();
    if ((v16 & 1) == 0)
    {
      uint64_t v58 = 0;
      unint64_t v59 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(81);
      v33._countAndFlagsBits = 0x2065707954;
      v33._object = (void *)0xE500000000000000;
      String.append(_:)(v33);
      v34._countAndFlagsBits = _typeName(_:qualified:)();
      String.append(_:)(v34);
      swift_bridgeObjectRelease();
      v35._countAndFlagsBits = 0xD000000000000028;
      v35._object = (void *)0x800000020DA312A0;
      String.append(_:)(v35);
      v53(v13, v12);
      v36._countAndFlagsBits = Set.description.getter();
      String.append(_:)(v36);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v37._countAndFlagsBits = 0xD00000000000001ELL;
      v37._object = (void *)0x800000020DA312D0;
      String.append(_:)(v37);
      *(void *)&long long v55 = MEMORY[0x2105634B0](v54);
      _print_unlocked<A, B>(_:_:)();
      uint64_t v38 = v58;
      uint64_t v39 = (void *)v59;
      type metadata accessor for DecodingError();
      swift_allocError();
      typeMismatchError(codingMetadata:type:message:)(a1, v38, v39, v40);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    uint64_t v62 = v54;
    char v53 = *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8);
    uint64_t v48 = type metadata accessor for Optional();
    unint64_t v49 = &v47;
    uint64_t v47 = *(void *)(v48 - 8);
    MEMORY[0x270FA5388](v48);
    uint64_t v20 = (char *)&v47 - v19;
    swift_unknownObjectRetain();
    ((void (*)(uint64_t *, uint64_t, uint64_t))v53)(&v62, v13, v12);
    uint64_t v21 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v20, 1, v13) == 1)
    {
      (*(void (**)(char *, uint64_t))(v47 + 8))(v20, v48);
      uint64_t v58 = 0;
      unint64_t v59 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      _StringGuts.grow(_:)(31);
      v22._object = (void *)0x800000020DA312F0;
      v22._countAndFlagsBits = 0xD000000000000015;
      String.append(_:)(v22);
      v23._countAndFlagsBits = _typeName(_:qualified:)();
      String.append(_:)(v23);
      swift_bridgeObjectRelease();
      v24._countAndFlagsBits = 0x206D6F726620;
      v24._object = (void *)0xE600000000000000;
      String.append(_:)(v24);
      *(void *)&long long v55 = v54;
      _print_unlocked<A, B>(_:_:)();
      uint64_t v25 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v27 = v26;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v25 - 8) + 104))(v27, *MEMORY[0x263F8DCB8], v25);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    uint64_t v56 = v13;
    uint64_t v57 = v12;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v55);
    (*(void (**)(uint64_t *, char *, uint64_t))(v21 + 32))(boxed_opaque_existential_1, v20, v13);
    outlined init with take of Encodable(&v55, (uint64_t)&v58);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)&v58, (uint64_t)&v55);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    char v42 = swift_dynamicCast();
    uint64_t v43 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56);
    if (v42)
    {
      uint64_t v44 = *(void *)(a1 - 8);
      v43(v10, 0, 1, a1);
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v58);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v44 + 32))(v52, v10, a1);
    }
    else
    {
      v43(v10, 1, 1, a1);
      (*(void (**)(char *, uint64_t))(v50 + 8))(v10, v51);
      type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v46 = v45;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      typeMismatchError(codingMetadata:type:message:)(a1, 0, (void *)0xE000000000000000, v46);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v58);
    }
  }
  return result;
}

uint64_t protocol witness for Decoder.userInfo.getter in conformance _XPCDecoder()
{
  return swift_bridgeObjectRetain();
}

uint64_t XPCDictionary.reply(_:)()
{
  uint64_t result = xpc_dictionary_expects_reply();
  if (result)
  {
    return xpc_dictionary_send_reply_4SWIFT();
  }
  return result;
}

uint64_t _sSq7flatMapyqd_0_SgABxqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v29 = a2;
  uint64_t v30 = a1;
  uint64_t v10 = *(void *)(a3 - 8);
  uint64_t v27 = a5;
  uint64_t v28 = v10;
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(v14 + 16);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v11);
  uint64_t v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v26 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v22 + 16))(v21, v23);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v21, 1, v15) == 1) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 56))(a6, 1, 1, a4);
  }
  uint64_t v25 = v28;
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v19, v21, v15);
  v30(v19, v13);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v19, v15);
  if (v6) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v25 + 32))(v27, v13, a3);
  }
  return result;
}

uint64_t _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v25 = a5;
  uint64_t v26 = a2;
  uint64_t v28 = a4;
  uint64_t v27 = a1;
  uint64_t v24 = *(void *)(a3 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](a1);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v13 + 16);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v10);
  uint64_t v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v21 + 16))(v20, v6);
  uint64_t v22 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v20, 1, v14) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v20, v14);
    v27(v18, v12);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    if (v7) {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v24 + 32))(v25, v12, a3);
    }
    uint64_t v22 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(a6, v22, 1);
}

uint64_t specialized String.withCString<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, xpc_object_t *a5)
{
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
    return swift_bridgeObjectRelease();
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0) {
      uint64_t v5 = (char *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v5 = (char *)_StringObject.sharedUTF8.getter();
    }
    partial apply for closure #1 in XPCDictionary.subscript.setter(v5);
    return swift_bridgeObjectRelease();
  }
  *(void *)key = a1;
  uint64_t v8 = a2 & 0xFFFFFFFFFFFFFFLL;
  if (a4) {
    specialized String.withCString<A>(_:)(a3, a4, a5, key);
  }
  else {
    xpc_dictionary_set_value(*a5, key, 0);
  }
  return swift_bridgeObjectRelease();
}

void specialized String.withCString<A>(_:)(uint64_t a1, uint64_t a2, xpc_object_t *a3, char *key)
{
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
  }
  else if ((a2 & 0x2000000000000000) != 0)
  {
    *(void *)string = a1;
    uint64_t v6 = a2 & 0xFFFFFFFFFFFFFFLL;
    xpc_dictionary_set_string(*a3, key, string);
  }
  else
  {
    if ((a1 & 0x1000000000000000) != 0) {
      uint64_t v4 = (char *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v4 = (char *)_StringObject.sharedUTF8.getter();
    }
    partial apply for closure #1 in closure #1 in XPCDictionary.subscript.setter(v4);
  }
}

xpc_object_t XPCDictionary.init()@<X0>(void *a1@<X8>)
{
  xpc_object_t result = xpc_dictionary_create_empty();
  *a1 = result;
  return result;
}

uint64_t XPCDictionary.withUnsafeUnderlyingDictionary<A>(_:)(uint64_t (*a1)(void))
{
  return a1(*v1);
}

void *XPCDictionary.subscript.getter(uint64_t a1, uint64_t a2)
{
  void v4[2] = *v2;
  return specialized String.withCString<A>(_:)((void *(*)(uint64_t *__return_ptr, void *))closure #1 in XPCDictionary.subscript.getterpartial apply, (uint64_t)v4, a1, a2);
}

{
  void *v2;
  void *v5;
  void v7[4];

  long long v7[2] = *v2;
  swift_unknownObjectRetain();
  uint64_t v5 = specialized String.withCString<A>(_:)((void *(*)(uint64_t *__return_ptr, void *))closure #1 in XPCDictionary.subscript.getterpartial apply, (uint64_t)v7, a1, a2);
  swift_unknownObjectRelease();
  return v5;
}

{
  void *v2;
  void v4[4];

  void v4[2] = *v2;
  return specialized String.withCString<A>(_:)((void *(*)(uint64_t *__return_ptr, void *))partial apply for closure #1 in XPCDictionary.subscript.getter, (uint64_t)v4, a1, a2);
}

{
  void *v2;
  void *v5;
  void v7[4];

  long long v7[2] = *v2;
  swift_unknownObjectRetain();
  uint64_t v5 = specialized String.withCString<A>(_:)((void *(*)(uint64_t *__return_ptr, void *))partial apply for closure #1 in XPCDictionary.subscript.getter, (uint64_t)v7, a1, a2);
  swift_unknownObjectRelease();
  return v5;
}

{
  uint64_t *v2;
  uint64_t v3;
  void *v4;
  void *result;
  int64_t v7;
  unsigned char v8[16];
  uint64_t v9;
  int64_t *v10;
  uint64_t v11;

  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *v2;
  uint64_t v7 = 0;
  uint64_t v9 = v3;
  uint64_t v10 = &v7;
  uint64_t v4 = specialized String.withCString<A>(_:)((void *(*)(uint64_t *__return_ptr, void *))partial apply for closure #1 in XPCDictionary.subscript.getter, (uint64_t)v8, a1, a2);
  xpc_object_t result = 0;
  if (v7 >= 1 && v4 != 0) {
    return specialized _copyCollectionToContiguousArray<A>(_:)(v4, v7);
  }
  return result;
}

{
  uint64_t *v2;
  uint64_t v5;
  void *v6;
  void *v7;
  int64_t v9;
  unsigned char v10[16];
  uint64_t v11;
  int64_t *v12;
  uint64_t v13;

  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = *v2;
  uint64_t v9 = 0;
  uint64_t v11 = v5;
  uint64_t v12 = &v9;
  swift_unknownObjectRetain();
  uint64_t v6 = specialized String.withCString<A>(_:)((void *(*)(uint64_t *__return_ptr, void *))partial apply for closure #1 in XPCDictionary.subscript.getter, (uint64_t)v10, a1, a2);
  if (v9 >= 1 && v6)
  {
    uint64_t v7 = specialized _copyCollectionToContiguousArray<A>(_:)(v6, v9);
    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    return 0;
  }
  return v7;
}

uint64_t XPCDictionary.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return XPCDictionary.subscript.setter(a1, a2, a3, a4, a5, (void (*)(char *, char *))partial apply for implicit closure #1 in XPCDictionary.subscript.setter, MEMORY[0x263F8E5C0], MEMORY[0x263EF8B18]);
}

{
  return XPCDictionary.subscript.setter(a1, a2, a3, a4, a5, (void (*)(char *, char *))partial apply for implicit closure #1 in XPCDictionary.subscript.setter, MEMORY[0x263F8E970], MEMORY[0x263EF8B20]);
}

{
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t vars8;

  specialized XPCDictionary.subscript.setter(a1, a2, a3, a4, a5);
  uint64_t v6 = type metadata accessor for Optional();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(a1, v6);
}

uint64_t implicit closure #1 in XPCDictionary.subscript.setter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v69 = a4;
  int64_t v66 = *(void *)(*(void *)(*(void *)(a3 + 8) + 24) + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v65 = (char *)&v60 - v7;
  uint64_t v8 = *(void *)(a2 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  v63 = (char *)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  long long v64 = (char *)&v60 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v60 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v67 = (char *)&v60 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  unint64_t v68 = (char *)&v60 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v60 - v21;
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  uint64_t v25 = (char *)&v60 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v60 - v26;
  uint64_t v70 = v8;
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v28((char *)&v60 - v26, a1, a2);
  LOBYTE(a1) = dispatch thunk of static BinaryInteger.isSigned.getter();
  v28(v25, (uint64_t)v27, a2);
  v71 = v15;
  BOOL v29 = (a1 & 1) != 0 && dispatch thunk of BinaryInteger.bitWidth.getter() > 64;
  uint64_t v30 = v25;
  uint64_t v31 = *(void (**)(char *, uint64_t))(v70 + 8);
  v31(v30, a2);
  v28(v22, (uint64_t)v27, a2);
  if (!v29)
  {
    v31(v22, a2);
    goto LABEL_9;
  }
  int64_t v73 = 0x8000000000000000;
  if (dispatch thunk of static BinaryInteger.isSigned.getter())
  {
    if (dispatch thunk of BinaryInteger.bitWidth.getter() < 64)
    {
      uint64_t v32 = dispatch thunk of BinaryInteger._lowWord.getter();
      Swift::String v33 = v22;
      uint64_t v34 = a2;
LABEL_31:
      v31(v33, v34);
      if (v32 < v73) {
        goto LABEL_32;
      }
      goto LABEL_9;
    }
    lazy protocol witness table accessor for type Int64 and conformance Int64();
    dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
    char v48 = dispatch thunk of static Comparable.< infix(_:_:)();
    v31(v68, a2);
LABEL_26:
    v31(v22, a2);
    if (v48) {
      goto LABEL_32;
    }
    goto LABEL_9;
  }
  uint64_t v61 = v31;
  char v45 = dispatch thunk of static BinaryInteger.isSigned.getter();
  uint64_t v46 = dispatch thunk of BinaryInteger.bitWidth.getter();
  if ((v45 & 1) == 0)
  {
    if (v46 >= 64)
    {
      uint64_t v31 = v61;
      v61(v22, a2);
      goto LABEL_9;
    }
    uint64_t v32 = dispatch thunk of BinaryInteger._lowWord.getter();
    Swift::String v33 = v22;
    uint64_t v34 = a2;
    uint64_t v31 = v61;
    goto LABEL_31;
  }
  if (v46 > 64)
  {
    lazy protocol witness table accessor for type Int64 and conformance Int64();
    uint64_t v47 = v68;
    dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
    char v48 = dispatch thunk of static Comparable.< infix(_:_:)();
    unint64_t v49 = v47;
    uint64_t v31 = v61;
    v61(v49, a2);
    goto LABEL_26;
  }
  swift_getAssociatedConformanceWitness();
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
  uint64_t v56 = v68;
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
  LODWORD(v66) = dispatch thunk of static Comparable.< infix(_:_:)();
  uint64_t v57 = v56;
  uint64_t v31 = v61;
  v61(v57, a2);
  uint64_t v58 = v63;
  (*(void (**)(char *, char *, uint64_t))(v70 + 32))(v63, v22, a2);
  if (v66)
  {
    v31(v58, a2);
    uint64_t v52 = 0;
    char v53 = 1;
    goto LABEL_33;
  }
  int64_t v66 = v73;
  uint64_t v59 = dispatch thunk of BinaryInteger._lowWord.getter();
  v31(v58, a2);
  if (v59 < v66)
  {
LABEL_32:
    uint64_t v52 = 0;
    char v53 = 1;
LABEL_33:
    uint64_t v37 = v69;
    goto LABEL_37;
  }
LABEL_9:
  uint64_t v35 = dispatch thunk of BinaryInteger.bitWidth.getter();
  Swift::String v36 = v67;
  v28(v67, (uint64_t)v27, a2);
  if (v35 < 65)
  {
    uint64_t v38 = dispatch thunk of BinaryInteger.bitWidth.getter();
    v31(v36, a2);
    if (v38 == 64)
    {
      char v39 = dispatch thunk of static BinaryInteger.isSigned.getter();
      char v40 = v71;
      v28(v71, (uint64_t)v27, a2);
      uint64_t v37 = v69;
      if ((v39 & 1) == 0) {
        goto LABEL_13;
      }
    }
    else
    {
      char v40 = v71;
      v28(v71, (uint64_t)v27, a2);
      uint64_t v37 = v69;
    }
    uint64_t v51 = v40;
    goto LABEL_23;
  }
  v31(v36, a2);
  v28(v71, (uint64_t)v27, a2);
  uint64_t v37 = v69;
LABEL_13:
  int64_t v73 = 0x7FFFFFFFFFFFFFFFLL;
  char v41 = dispatch thunk of static BinaryInteger.isSigned.getter();
  uint64_t v42 = dispatch thunk of BinaryInteger.bitWidth.getter();
  if (v41)
  {
    uint64_t v43 = v68;
    if (v42 > 64)
    {
      lazy protocol witness table accessor for type Int64 and conformance Int64();
      dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
      uint64_t v44 = v71;
      goto LABEL_35;
    }
  }
  else
  {
    uint64_t v44 = v68;
    if (v42 > 63)
    {
      uint64_t v72 = 0x7FFFFFFFFFFFFFFFLL;
      (*(void (**)(char *, char *, uint64_t))(v70 + 32))(v68, v71, a2);
      lazy protocol witness table accessor for type Int64 and conformance Int64();
      uint64_t v43 = v64;
      dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
LABEL_35:
      char v54 = dispatch thunk of static Comparable.< infix(_:_:)();
      v31(v43, a2);
      v31(v44, a2);
      if (v54)
      {
        uint64_t v52 = 0;
        char v53 = 1;
        goto LABEL_37;
      }
      goto LABEL_24;
    }
  }
  uint64_t v50 = v71;
  dispatch thunk of BinaryInteger._lowWord.getter();
  uint64_t v51 = v50;
LABEL_23:
  v31(v51, a2);
LABEL_24:
  uint64_t v52 = dispatch thunk of BinaryInteger._lowWord.getter();
  char v53 = 0;
LABEL_37:
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v31)(v27, a2);
  *(void *)uint64_t v37 = v52;
  *(unsigned char *)(v37 + 8) = v53;
  return result;
}

{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  void (*v22)(char *, uint64_t, uint64_t);
  char v23;
  void (*v24)(char *, uint64_t);
  uint64_t result;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  void (*v31)(char *, uint64_t);
  void (*v32)(char *, uint64_t);
  char v33;
  uint64_t v34;
  char *v35;
  char *v36;
  char v37;
  uint64_t v38;
  char *v39;
  char *v40;
  unint64_t v41;
  char *v42;
  char *v43;
  char v44;
  char *v45;
  char *v46;
  unint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  char *v51;
  void (*v52)(char *, uint64_t);
  char *v53;
  uint64_t AssociatedTypeWitness;
  uint64_t v55;
  char *v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;

  long long v55 = a4;
  uint64_t v6 = *(void *)(a3 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  char v53 = (char *)&v48 - v8;
  uint64_t v9 = *(void *)(a2 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v50 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v56 = (char *)&v48 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v48 - v15;
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v48 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v48 - v20;
  uint64_t v58 = v9;
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v22((char *)&v48 - v20, a1, a2);
  uint64_t v57 = v6;
  LOBYTE(a1) = dispatch thunk of static BinaryInteger.isSigned.getter();
  v22(v19, (uint64_t)v21, a2);
  if ((a1 & 1) == 0)
  {
    unint64_t v49 = v16;
    uint64_t v52 = *(void (**)(char *, uint64_t))(v58 + 8);
    v52(v19, a2);
    goto LABEL_6;
  }
  uint64_t v51 = v21;
  swift_getAssociatedConformanceWitness();
  dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
  dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
  uint64_t v23 = dispatch thunk of static Comparable.< infix(_:_:)();
  uint64_t v24 = *(void (**)(char *, uint64_t))(v58 + 8);
  v24(v16, a2);
  v24(v19, a2);
  if ((v23 & 1) == 0)
  {
    unint64_t v49 = v16;
    uint64_t v52 = v24;
    uint64_t v21 = v51;
LABEL_6:
    BOOL v29 = dispatch thunk of BinaryInteger.bitWidth.getter();
    uint64_t v30 = v56;
    v22(v56, (uint64_t)v21, a2);
    if (v29 <= 63)
    {
      uint64_t v31 = v52;
      v52(v30, a2);
      uint64_t v28 = v55;
      uint64_t v32 = v31;
      goto LABEL_8;
    }
    uint64_t v59 = -1;
    Swift::String v33 = dispatch thunk of static BinaryInteger.isSigned.getter();
    uint64_t v34 = dispatch thunk of BinaryInteger.bitWidth.getter();
    if (v33)
    {
      if (v34 <= 64)
      {
        uint64_t v51 = v21;
        swift_getAssociatedConformanceWitness();
        dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)();
        uint64_t v35 = v49;
        dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)();
        Swift::String v36 = v56;
        uint64_t v37 = dispatch thunk of static Comparable.> infix(_:_:)();
        uint64_t v38 = v58;
        char v39 = v35;
        uint64_t v32 = v52;
        v52(v39, a2);
        uint64_t v57 = v59;
        char v40 = v50;
        (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v50, v36, a2);
        if ((v37 & 1) == 0)
        {
          v32(v40, a2);
          uint64_t v28 = v55;
          uint64_t v21 = v51;
          goto LABEL_8;
        }
        char v41 = dispatch thunk of BinaryInteger._lowWord.getter();
        v32(v40, a2);
        uint64_t v28 = v55;
        uint64_t v21 = v51;
        if (v57 >= v41)
        {
LABEL_8:
          uint64_t v26 = dispatch thunk of BinaryInteger._lowWord.getter();
          uint64_t result = ((uint64_t (*)(char *, uint64_t))v32)(v21, a2);
          uint64_t v27 = 0;
          goto LABEL_19;
        }
LABEL_18:
        uint64_t result = ((uint64_t (*)(char *, uint64_t))v32)(v21, a2);
        uint64_t v26 = 0;
        uint64_t v27 = 1;
        goto LABEL_19;
      }
    }
    else if (v34 < 65)
    {
      uint64_t v46 = v56;
      uint64_t v47 = dispatch thunk of BinaryInteger._lowWord.getter();
      uint64_t v32 = v52;
      v52(v46, a2);
      uint64_t v28 = v55;
      if (v59 >= v47) {
        goto LABEL_8;
      }
      goto LABEL_18;
    }
    lazy protocol witness table accessor for type UInt64 and conformance UInt64();
    uint64_t v42 = v49;
    dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
    uint64_t v43 = v56;
    uint64_t v44 = dispatch thunk of static Comparable.< infix(_:_:)();
    char v45 = v42;
    uint64_t v32 = v52;
    v52(v45, a2);
    v32(v43, a2);
    uint64_t v28 = v55;
    if ((v44 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v24)(v51, a2);
  uint64_t v26 = 0;
  uint64_t v27 = 1;
  uint64_t v28 = v55;
LABEL_19:
  *(void *)uint64_t v28 = v26;
  *(unsigned char *)(v28 + 8) = v27;
  return result;
}

uint64_t XPCDictionary.subscript.setter(_xpc_connection_s *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    swift_unknownObjectRetain();
    specialized String.withCString<A>(_:)(a2, a3, a1, v3);
    swift_unknownObjectRelease();
  }

  return swift_bridgeObjectRelease();
}

void (*XPCDictionary.subscript.modify(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t **a1, char a2)
{
  uint64_t v11 = malloc(0x48uLL);
  *a1 = v11;
  v11[3] = a5;
  v11[4] = v5;
  v11[1] = a3;
  v11[2] = a4;
  *uint64_t v11 = a2;
  uint64_t v12 = type metadata accessor for Optional();
  v11[5] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v11[6] = v13;
  size_t v14 = *(void *)(v13 + 64);
  v11[7] = malloc(v14);
  BOOL v11[8] = malloc(v14);
  XPCDictionary.subscript.getter(a2, a3, a4, a5);
  return XPCDictionary.subscript.modify;
}

{
  uint64_t v5;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;

  uint64_t v11 = malloc(0x48uLL);
  *a1 = v11;
  v11[3] = a5;
  v11[4] = v5;
  v11[1] = a3;
  v11[2] = a4;
  *uint64_t v11 = a2;
  uint64_t v12 = type metadata accessor for Optional();
  v11[5] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v11[6] = v13;
  size_t v14 = *(void *)(v13 + 64);
  v11[7] = malloc(v14);
  BOOL v11[8] = malloc(v14);
  XPCDictionary.subscript.getter(a2, a3, a4, a5);
  return XPCDictionary.subscript.modify;
}

{
  uint64_t v5;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  void *v15;

  uint64_t v11 = malloc(0x48uLL);
  *a1 = v11;
  v11[3] = a5;
  v11[4] = v5;
  v11[1] = a3;
  v11[2] = a4;
  *uint64_t v11 = a2;
  uint64_t v12 = type metadata accessor for Optional();
  v11[5] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v11[6] = v13;
  size_t v14 = *(void *)(v13 + 64);
  v11[7] = malloc(v14);
  uint64_t v15 = malloc(v14);
  BOOL v11[8] = v15;
  XPCDictionary.subscript.getter(a2, a3, a4, (uint64_t)v15);
  return XPCDictionary.subscript.modify;
}

void XPCDictionary.subscript.modify(uint64_t **a1, char a2)
{
}

{
  XPCDictionary.subscript.modify(a1, a2, (void (*)(char *, char *))partial apply for implicit closure #1 in XPCDictionary.subscript.setter, MEMORY[0x263F8E970], MEMORY[0x263EF8B20]);
}

{
  uint64_t *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(void *, uint64_t);
  uint64_t vars8;

  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a1)[7];
  uint64_t v4 = (void *)(*a1)[8];
  uint64_t v5 = (*a1)[5];
  uint64_t v6 = (*a1)[6];
  uint64_t v7 = (*a1)[3];
  uint64_t v9 = (*a1)[1];
  uint64_t v8 = (*a1)[2];
  uint64_t v10 = **a1;
  if (a2)
  {
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))((*a1)[7], v4, v5);
    swift_bridgeObjectRetain();
    specialized XPCDictionary.subscript.setter((uint64_t)v3, v10, v9, v8, v7);
    uint64_t v11 = *(void (**)(void *, uint64_t))(v6 + 8);
    v11(v3, v5);
    v11(v4, v5);
  }
  else
  {
    swift_bridgeObjectRetain();
    specialized XPCDictionary.subscript.setter((uint64_t)v4, v10, v9, v8, v7);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  free(v4);
  free(v3);

  free(v2);
}

{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  xpc_object_t *v7;
  uint64_t v8;
  uint64_t vars8;

  uint64_t v3 = *a1;
  uint64_t v4 = (*a1)[3];
  uint64_t v6 = **a1;
  uint64_t v5 = (*a1)[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v7 = (xpc_object_t *)v3[4];
  uint64_t v8 = v3[2];
  if (a2)
  {
    swift_bridgeObjectRetain();
    specialized String.withCString<A>(_:)(v8, v4, v6, v5, v7);
    swift_bridgeObjectRelease();
  }
  else
  {
    specialized String.withCString<A>(_:)(v3[2], v4, v6, v5, (xpc_object_t *)v3[4]);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  free(v3);
}

{
  uint64_t *v2;
  uint64_t v3;
  xpc_object_t *v4;
  uint64_t v5;
  uint64_t v6;
  xpc_object_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t vars8;

  uint64_t v2 = *a1;
  uint64_t v3 = **a1;
  if (a2)
  {
    if (v3)
    {
      uint64_t v4 = (xpc_object_t *)v2[4];
      uint64_t v6 = v2[2];
      uint64_t v5 = v2[3];
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      specialized String.withCString<A>(_:)(v6, v5, v4, v3);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    if (!v3) {
      goto LABEL_7;
    }
    uint64_t v7 = (xpc_object_t *)v2[4];
    uint64_t v9 = v2[2];
    uint64_t v8 = v2[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    specialized String.withCString<A>(_:)(v9, v8, v7, v3);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
LABEL_7:

  free(v2);
}

{
  uint64_t *v2;
  uint64_t v3;
  void *v4;
  _xpc_connection_s *v5;
  _xpc_connection_s *v6;
  void **v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _xpc_connection_s *v11;
  _xpc_connection_s *v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t vars8;

  uint64_t v2 = *a1;
  uint64_t v3 = **a1;
  if (a2)
  {
    if (!v3)
    {
LABEL_8:
      swift_unknownObjectRelease();
      goto LABEL_9;
    }
    swift_bridgeObjectRetain();
    uint64_t v4 = (void *)swift_unknownObjectRetain();
    uint64_t v5 = (_xpc_connection_s *)xpc_copy(v4);
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = (void **)v2[3];
      uint64_t v9 = v2[1];
      uint64_t v8 = v2[2];
      swift_unknownObjectRelease();
      swift_unknownObjectRetain();
      specialized String.withCString<A>(_:)(v9, v8, v6, v7);
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      goto LABEL_8;
    }
    __break(1u);
LABEL_13:
    __break(1u);
    return;
  }
  if (v3)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = (void *)swift_unknownObjectRetain();
    uint64_t v11 = (_xpc_connection_s *)xpc_copy(v10);
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = (void **)v2[3];
      uint64_t v15 = v2[1];
      size_t v14 = v2[2];
      swift_unknownObjectRelease_n();
      swift_unknownObjectRetain();
      specialized String.withCString<A>(_:)(v15, v14, v12, v13);
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    goto LABEL_13;
  }
LABEL_9:

  free(v2);
}

uint64_t XPCDictionary.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  swift_unknownObjectRetain();
  XPCDictionary.subscript.getter(a1, a2, a3, a4);

  return swift_unknownObjectRelease();
}

{
  uint64_t vars8;

  swift_unknownObjectRetain();
  XPCDictionary.subscript.getter(a1, a2, a3, a4);

  return swift_unknownObjectRelease();
}

uint64_t key path getter for XPCDictionary.subscript<A>(_:) : <A>XPCDictionaryA(uint64_t a1, uint64_t *a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = *(uint64_t *)((char *)a2 + a3 - 16);
  uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 8);
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  swift_unknownObjectRetain();
  a4(v7, v8, v5, v6);

  return swift_unknownObjectRelease();
}

uint64_t XPCDictionary.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(char *, char *), uint64_t a7, uint64_t (*a8)(uint64_t))
{
  specialized XPCDictionary.subscript.setter(a1, a2, a3, a4, a5, a6, a7, a8);
  uint64_t v9 = type metadata accessor for Optional();
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);

  return v10(a1, v9);
}

void XPCDictionary.subscript.modify(uint64_t **a1, char a2, void (*a3)(char *, char *), uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v5 = *a1;
  uint64_t v6 = (void *)(*a1)[7];
  uint64_t v7 = (void *)(*a1)[8];
  uint64_t v8 = (*a1)[5];
  uint64_t v9 = (*a1)[6];
  uint64_t v10 = (*a1)[3];
  uint64_t v11 = (*a1)[1];
  uint64_t v12 = (*a1)[2];
  uint64_t v13 = **a1;
  if (a2)
  {
    (*(void (**)(uint64_t, void *, uint64_t))(v9 + 16))((*a1)[7], v7, v8);
    swift_bridgeObjectRetain();
    specialized XPCDictionary.subscript.setter((uint64_t)v6, v13, v11, v12, v10, a3, a4, a5);
    size_t v14 = *(void (**)(void *, uint64_t))(v9 + 8);
    v14(v6, v8);
    v14(v7, v8);
  }
  else
  {
    swift_bridgeObjectRetain();
    specialized XPCDictionary.subscript.setter((uint64_t)v7, v13, v11, v12, v10, a3, a4, a5);
    (*(void (**)(void *, uint64_t))(v9 + 8))(v7, v8);
  }
  free(v7);
  free(v6);

  free(v5);
}

xpc_object_t closure #1 in XPCDictionary.subscript.setter@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *))(v4 + 16))((char *)v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  lazy protocol witness table accessor for type Double and conformance Double();
  BinaryFloatingPoint.init<A>(_:)();
  xpc_object_t result = xpc_double_create(*(double *)&v6[1]);
  *a2 = result;
  return result;
}

uint64_t XPCDictionary.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(uint64_t, uint64_t)@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v18 = a4;
  uint64_t v19 = a3;
  uint64_t v20 = a6;
  uint64_t v10 = type metadata accessor for Optional();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v18 - v12;
  uint64_t v21 = *v6;
  swift_unknownObjectRetain();
  XPCDictionary.subscript.getter(a1, a2, a5, (uint64_t)v13);
  swift_unknownObjectRelease();
  uint64_t v14 = *(void *)(a5 - 8);
  uint64_t v15 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v13, 1, a5);
  if (v15 != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(v20, v13, a5);
  }
  v19(v15, v16);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

void *XPCDictionary.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v9[2] = *v3;
  swift_unknownObjectRetain();
  uint64_t v7 = specialized String.withCString<A>(_:)((void *(*)(uint64_t *__return_ptr, void *))closure #1 in XPCDictionary.subscript.getterpartial apply, (uint64_t)v9, a1, a2);
  swift_unknownObjectRelease();
  if (v7 && MEMORY[0x2105634B0](v7) != a3)
  {
    swift_unknownObjectRelease();
    return 0;
  }
  return v7;
}

uint64_t key path getter for XPCDictionary.subscript(_:) : XPCDictionary@<X0>(uint64_t *a1@<X1>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  swift_unknownObjectRetain();
  char v5 = XPCDictionary.subscript.getter(v3, v4);
  uint64_t result = swift_unknownObjectRelease();
  *a2 = v5;
  return result;
}

unsigned __int8 *key path setter for XPCDictionary.subscript(_:) : XPCDictionary(unsigned __int8 *result, void **a2, uint64_t *a3)
{
  int v3 = *result;
  if (v3 != 2)
  {
    uint64_t v6 = *a3;
    uint64_t v5 = a3[1];
    BOOL v7 = v3 & 1;
    swift_bridgeObjectRetain();
    uint64_t v8 = (_xpc_connection_s *)xpc_BOOL_create(v7);
    swift_unknownObjectRetain();
    specialized String.withCString<A>(_:)(v6, v5, v8, a2);
    swift_unknownObjectRelease();
    return (unsigned __int8 *)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t XPCDictionary.subscript.setter(char a1, uint64_t a2, uint64_t a3)
{
  if (a1 != 2)
  {
    uint64_t v6 = (_xpc_connection_s *)xpc_BOOL_create(a1 & 1);
    swift_unknownObjectRetain();
    specialized String.withCString<A>(_:)(a2, a3, v6, v3);
    swift_unknownObjectRelease();
  }

  return swift_bridgeObjectRelease();
}

uint64_t (*XPCDictionary.subscript.modify(uint64_t a1, uint64_t a2, uint64_t a3))(uint64_t result)
{
  *(void *)(a1 + 8) = a3;
  *(void *)(a1 + 16) = v3;
  *(void *)a1 = a2;
  *(unsigned char *)(a1 + 24) = XPCDictionary.subscript.getter(a2, a3);
  return XPCDictionary.subscript.modify;
}

uint64_t XPCDictionary.subscript.modify(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 24);
  if (v1 != 2)
  {
    uint64_t v2 = *(void *)(result + 8);
    uint64_t v3 = *(void ***)(result + 16);
    BOOL v4 = v1 & 1;
    uint64_t v5 = *(void *)result;
    swift_bridgeObjectRetain();
    uint64_t v6 = (_xpc_connection_s *)xpc_BOOL_create(v4);
    swift_unknownObjectRetain();
    specialized String.withCString<A>(_:)(v5, v2, v6, v3);
    swift_bridgeObjectRelease();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t XPCDictionary.subscript.getter(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v7 = *v3;
  swift_unknownObjectRetain();
  void v15[2] = v7;
  swift_unknownObjectRetain();
  uint64_t v8 = specialized String.withCString<A>(_:)((void *(*)(uint64_t *__return_ptr, void *))closure #1 in XPCDictionary.subscript.getterpartial apply, (uint64_t)v15, a1, a2);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = MEMORY[0x2105634B0]();
    uint64_t v11 = MEMORY[0x263EF86E0];
    swift_unknownObjectRelease();
    if (v10 == v11)
    {
      char value = xpc_BOOL_get_value(v9);
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      return value & 1;
    }
    swift_unknownObjectRelease();
    uint64_t v12 = swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v12 = swift_unknownObjectRelease_n();
  }
  char value = a3(v12);
  return value & 1;
}

uint64_t XPCDictionary.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v7 = *v3;
  swift_unknownObjectRetain();
  return specialized String.withCString<A>(_:)(v7, a1, a2, a3);
}

{
  void **v3;
  void *v7;

  uint64_t v7 = *v3;
  swift_unknownObjectRetain();
  return specialized String.withCString<A>(_:)(v7, a1, a2, a3);
}

uint64_t key path getter for XPCDictionary.subscript(_:) : XPCDictionary@<X0>(void **a1@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  BOOL v4 = *a1;
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  swift_unknownObjectRetain();
  uint64_t result = specialized String.withCString<A>(_:)(v4, v5, v6, &v8);
  *a3 = v8;
  return result;
}

uint64_t key path setter for XPCDictionary.subscript(_:) : XPCDictionary(void **a1, xpc_object_t *a2, uint64_t *a3)
{
  uint64_t v4 = *a3;
  uint64_t v5 = a3[1];
  uint64_t v6 = *a1;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  specialized String.withCString<A>(_:)(v4, v5, a2, v6);

  return swift_bridgeObjectRelease();
}

uint64_t XPCDictionary.subscript.setter(void **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  swift_unknownObjectRetain();
  specialized String.withCString<A>(_:)(a2, a3, v3, v6);
  swift_unknownObjectRelease();

  return swift_bridgeObjectRelease();
}

void (*XPCDictionary.subscript.modify(void *a1, uint64_t a2, uint64_t a3))(void ***a1, char a2)
{
  uint64_t v7 = malloc(0x28uLL);
  *a1 = v7;
  long long v7[2] = a3;
  v7[3] = v3;
  v7[1] = a2;
  uint64_t v8 = *v3;
  swift_unknownObjectRetain_n();
  specialized String.withCString<A>(_:)(v8, a2, a3, v7);
  v7[4] = 0;
  swift_unknownObjectRelease();
  return XPCDictionary.subscript.modify;
}

void XPCDictionary.subscript.modify(void ***a1, char a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (uint64_t)(*a1)[2];
  uint64_t v5 = **a1;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v6 = (xpc_object_t *)v3[3];
  uint64_t v7 = (uint64_t)v3[1];
  if (a2)
  {
    swift_unknownObjectRetain();
    specialized String.withCString<A>(_:)(v7, v4, v6, v5);
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    specialized String.withCString<A>(_:)((uint64_t)v3[1], v4, (xpc_object_t *)v3[3], v5);
    swift_bridgeObjectRelease();
  }
  swift_unknownObjectRelease();

  free(v3);
}

uint64_t key path getter for XPCDictionary.subscript(_:) : XPCDictionary@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  v8[2] = *a1;
  swift_unknownObjectRetain();
  uint64_t v6 = specialized String.withCString<A>(_:)((void *(*)(uint64_t *__return_ptr, void *))closure #1 in XPCDictionary.subscript.getterpartial apply, (uint64_t)v8, v4, v5);
  uint64_t result = swift_unknownObjectRelease();
  *a3 = v6;
  return result;
}

{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  void v10[4];

  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  void v10[2] = *a1;
  swift_unknownObjectRetain();
  uint64_t v6 = specialized String.withCString<A>(_:)((void *(*)(uint64_t *__return_ptr, void *))partial apply for closure #1 in XPCDictionary.subscript.getter, (uint64_t)v10, v4, v5);
  uint64_t v8 = v7;
  uint64_t result = swift_unknownObjectRelease();
  *a3 = v6;
  a3[1] = v8;
  return result;
}

_xpc_connection_s **key path setter for XPCDictionary.subscript(_:) : XPCDictionary(_xpc_connection_s **result, void **a2, uint64_t *a3)
{
  uint64_t v3 = *result;
  if (*result)
  {
    uint64_t v5 = *a3;
    uint64_t v6 = a3[1];
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    specialized String.withCString<A>(_:)(v5, v6, v3, a2);
    return (_xpc_connection_s **)swift_bridgeObjectRelease();
  }
  return result;
}

void closure #1 in XPCDictionary.subscript.setter(const char *a1, _xpc_connection_s *a2, void **a3)
{
  uint64_t v6 = MEMORY[0x2105634B0](a2);
  uint64_t v7 = *a3;
  if (v6 == MEMORY[0x263EF86F0]) {
    xpc_dictionary_set_connection(v7, a1, a2);
  }
  else {
    xpc_dictionary_set_value(v7, a1, a2);
  }
}

void (*XPCDictionary.subscript.modify(void *a1, uint64_t a2, uint64_t a3))(_xpc_connection_s ***a1, char a2)
{
  uint64_t v7 = malloc(0x28uLL);
  *a1 = v7;
  long long v7[2] = a3;
  v7[3] = v3;
  v7[1] = a2;
  void v10[2] = *v3;
  swift_unknownObjectRetain();
  uint64_t v8 = specialized String.withCString<A>(_:)((void *(*)(uint64_t *__return_ptr, void *))closure #1 in XPCDictionary.subscript.getterpartial apply, (uint64_t)v10, a2, a3);
  v7[4] = 0;
  swift_unknownObjectRelease();
  void *v7 = v8;
  return XPCDictionary.subscript.modify;
}

void XPCDictionary.subscript.modify(_xpc_connection_s ***a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = **a1;
  if (a2)
  {
    if (v3)
    {
      uint64_t v4 = (void **)v2[3];
      uint64_t v6 = (uint64_t)v2[1];
      uint64_t v5 = (uint64_t)v2[2];
      swift_unknownObjectRetain_n();
      swift_bridgeObjectRetain();
      specialized String.withCString<A>(_:)(v6, v5, v3, v4);
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
    }
  }
  else
  {
    if (!v3) {
      goto LABEL_7;
    }
    uint64_t v7 = (void **)v2[3];
    uint64_t v9 = (uint64_t)v2[1];
    uint64_t v8 = (uint64_t)v2[2];
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    specialized String.withCString<A>(_:)(v9, v8, v3, v7);
    swift_bridgeObjectRelease();
  }
  swift_unknownObjectRelease();
LABEL_7:

  free(v2);
}

uint64_t key path setter for XPCDictionary.subscript(_:) : XPCDictionary(uint64_t *a1, xpc_object_t *a2, uint64_t *a3)
{
  uint64_t v4 = *a3;
  uint64_t v5 = a3[1];
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized String.withCString<A>(_:)(v4, v5, v6, v7, a2);

  return swift_bridgeObjectRelease();
}

uint64_t XPCDictionary.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_bridgeObjectRetain();
  specialized String.withCString<A>(_:)(a3, a4, a1, a2, v4);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void closure #1 in XPCDictionary.subscript.setter(char *key, uint64_t a2, uint64_t a3, xpc_object_t *a4)
{
  if (a3) {
    specialized String.withCString<A>(_:)(a2, a3, a4, key);
  }
  else {
    xpc_dictionary_set_value(*a4, key, 0);
  }
}

void (*XPCDictionary.subscript.modify(void *a1, uint64_t a2, uint64_t a3))(uint64_t **a1, char a2)
{
  uint64_t v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[3] = a3;
  v7[4] = v3;
  long long v7[2] = a2;
  xpc_rich_error_t v12[2] = *v3;
  swift_unknownObjectRetain();
  uint64_t v8 = specialized String.withCString<A>(_:)((void *(*)(uint64_t *__return_ptr, void *))partial apply for closure #1 in XPCDictionary.subscript.getter, (uint64_t)v12, a2, a3);
  uint64_t v10 = v9;
  uint64_t v7[5] = 0;
  swift_unknownObjectRelease();
  void *v7 = v8;
  v7[1] = v10;
  return XPCDictionary.subscript.modify;
}

{
  uint64_t *v3;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  unsigned char v12[16];
  uint64_t v13;
  void *v14;
  uint64_t v15;

  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[1] = 0;
  v7[3] = a3;
  v7[4] = v3;
  long long v7[2] = a2;
  uint64_t v13 = *v3;
  uint64_t v14 = v7 + 1;
  swift_unknownObjectRetain();
  uint64_t v8 = specialized String.withCString<A>(_:)((void *(*)(uint64_t *__return_ptr, void *))partial apply for closure #1 in XPCDictionary.subscript.getter, (uint64_t)v12, a2, a3);
  uint64_t v7[5] = 0;
  uint64_t v9 = v7[1];
  if (v9 >= 1 && v8)
  {
    uint64_t v10 = specialized _copyCollectionToContiguousArray<A>(_:)(v8, v9);
    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    uint64_t v10 = 0;
  }
  void *v7 = v10;
  return XPCDictionary.subscript.modify;
}

{
  void *v3;
  void *v7;
  void *v8;
  void *v9;
  void (*result)(uint64_t **, char);
  void (*v11)(uint64_t **, char);
  void v12[4];

  uint64_t v7 = malloc(0x28uLL);
  *a1 = v7;
  long long v7[2] = a3;
  v7[3] = v3;
  v7[1] = a2;
  xpc_rich_error_t v12[2] = *v3;
  swift_unknownObjectRetain();
  uint64_t v8 = specialized String.withCString<A>(_:)((void *(*)(uint64_t *__return_ptr, void *))closure #1 in XPCDictionary.subscript.getterpartial apply, (uint64_t)v12, a2, a3);
  v7[4] = 0;
  if (!v8)
  {
    swift_unknownObjectRelease();
    uint64_t v11 = 0;
    goto LABEL_6;
  }
  uint64_t v9 = v8;
  swift_getObjectType();
  uint64_t result = (void (*)(uint64_t **, char))OS_xpc_object.isCodable()();
  if (result)
  {
    uint64_t result = (void (*)(uint64_t **, char))xpc_copy(v9);
    if (result)
    {
      uint64_t v11 = result;
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
LABEL_6:
      void *v7 = v11;
      return XPCDictionary.subscript.modify;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t key path getter for XPCDictionary.subscript(_:) : XPCDictionary@<X0>(uint64_t *a1@<X1>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  swift_unknownObjectRetain();
  uint64_t v5 = XPCDictionary.subscript.getter(v3, v4);
  uint64_t result = swift_unknownObjectRelease();
  *a2 = v5;
  return result;
}

{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  swift_unknownObjectRetain();
  XPCDictionary.subscript.getter(v3, v4, &v6);
  uint64_t result = swift_unknownObjectRelease();
  *a2 = v6;
  return result;
}

uint64_t *key path setter for XPCDictionary.subscript(_:) : XPCDictionary(uint64_t *result, xpc_object_t *a2, uint64_t *a3)
{
  uint64_t v3 = *result;
  if (*result)
  {
    uint64_t v5 = *a3;
    uint64_t v6 = a3[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    specialized String.withCString<A>(_:)(v5, v6, a2, v3);
    return (uint64_t *)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t XPCDictionary.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    swift_bridgeObjectRetain();
    specialized String.withCString<A>(_:)(a2, a3, v3, a1);
    swift_bridgeObjectRelease();
  }

  return swift_bridgeObjectRelease();
}

uint64_t XPCDictionary.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  void v10[2] = *v3;
  swift_unknownObjectRetain();
  uint64_t v7 = specialized String.withCString<A>(_:)((void *(*)(uint64_t *__return_ptr, void *))closure #1 in XPCDictionary.subscript.getterpartial apply, (uint64_t)v10, a1, a2);
  uint64_t result = swift_unknownObjectRelease();
  if (!v7)
  {
    uint64_t v9 = 0;
    goto LABEL_6;
  }
  swift_getObjectType();
  uint64_t result = OS_xpc_object.isCodable()();
  if (result)
  {
    uint64_t result = (uint64_t)xpc_copy(v7);
    if (result)
    {
      uint64_t v9 = result;
      uint64_t result = swift_unknownObjectRelease();
LABEL_6:
      *a3 = v9;
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

{
  void *v3;
  void *v7;
  void *v8;
  uint64_t result;
  uint64_t v10;
  void v11[4];

  v11[2] = *v3;
  swift_unknownObjectRetain();
  uint64_t v7 = specialized String.withCString<A>(_:)((void *(*)(uint64_t *__return_ptr, void *))closure #1 in XPCDictionary.subscript.getterpartial apply, (uint64_t)v11, a1, a2);
  if (!v7)
  {
    uint64_t result = swift_unknownObjectRelease();
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  uint64_t v8 = v7;
  swift_getObjectType();
  uint64_t result = OS_xpc_object.isCodable()();
  if (result)
  {
    uint64_t result = (uint64_t)xpc_copy(v8);
    if (result)
    {
      uint64_t v10 = result;
      swift_unknownObjectRelease();
      uint64_t result = swift_unknownObjectRelease();
LABEL_6:
      *a3 = v10;
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

_xpc_connection_s *key path setter for XPCDictionary.subscript(_:) : XPCDictionary(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  uint64_t v4 = a3[1];
  uint64_t v6 = *a1;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  return XPCDictionary.subscript.setter(&v6, v3, v4);
}

_xpc_connection_s *XPCDictionary.subscript.setter(void *a1, uint64_t a2, uint64_t a3)
{
  if (*a1)
  {
    uint64_t v6 = (void *)swift_unknownObjectRetain();
    uint64_t result = (_xpc_connection_s *)xpc_copy(v6);
    if (!result)
    {
      __break(1u);
      return result;
    }
    uint64_t v8 = result;
    swift_unknownObjectRelease_n();
    swift_unknownObjectRetain();
    specialized String.withCString<A>(_:)(a2, a3, v8, v3);
    swift_unknownObjectRelease();
  }

  return (_xpc_connection_s *)swift_bridgeObjectRelease();
}

uint64_t XPCDictionary.copy(into:)(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *v1;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v2;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = partial apply for closure #1 in XPCDictionary.copy(into:);
  *(void *)(v5 + 24) = v4;
  void v8[4] = partial apply for thunk for @callee_guaranteed (@unowned UnsafePointer<Int8>, @guaranteed OS_xpc_object) -> (@unowned Bool);
  uint64_t v8[5] = v5;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = thunk for @escaping @callee_guaranteed (@unowned UnsafePointer<Int8>, @guaranteed OS_xpc_object) -> (@unowned Bool);
  uint64_t v8[3] = &block_descriptor_2;
  uint64_t v6 = _Block_copy(v8);
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  xpc_dictionary_apply(v3, v6);
  _Block_release(v6);
  LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v3) {
    __break(1u);
  }
  return result;
}

void *XPCDictionary.removeValue(forKey:)(uint64_t a1, uint64_t a2)
{
  void v4[2] = *v2;
  return specialized String.withCString<A>(_:)((void *(*)(uint64_t *__return_ptr, void *))partial apply for closure #1 in XPCDictionary.removeValue(forKey:), (uint64_t)v4, a1, a2);
}

BOOL XPCDictionary.isEmpty.getter()
{
  return xpc_dictionary_get_count(*v0) == 0;
}

size_t XPCDictionary.count.getter()
{
  return xpc_dictionary_get_count(*v0);
}

uint64_t XPCDictionary.forEach(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v2;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  closure #1 in XPCDictionary.forEach(_:)((uint64_t)partial apply for thunk for @callee_guaranteed (@guaranteed String, @guaranteed OS_xpc_object) -> (@error @owned Error), v7, v6);
  if (v3) {
    return swift_release();
  }
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

{
  void **v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t result;
  char isEscapingClosureAtFileLocation;
  void v8[4];

  uint64_t v8[3] = a2;
  uint64_t v4 = *v2;
  v8[2] = a1;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = partial apply for closure #1 in XPCDictionary.forEach(_:);
  *(void *)(v5 + 24) = v8;
  closure #1 in XPCDictionary.forEach(_:)((uint64_t)partial apply for closure #1 in XPCDictionary.forEach(_:), v5, v4);
  if (v3) {
    return swift_release();
  }
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t specialized XPCDictionary.map<A>(_:)(uint64_t a1, uint64_t a2, xpc_object_t xdict)
{
  uint64_t v16 = MEMORY[0x263F8EE78];
  size_t count = xpc_dictionary_get_count(xdict);
  specialized Array._reserveCapacityImpl(minimumCapacity:growForAppend:)(count, 0);
  specialized Array._endMutation()();
  uint64_t v13 = &v16;
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  v11[2] = partial apply for specialized closure #1 in XPCDictionary.map<A>(_:);
  v11[3] = &v12;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = partial apply for closure #1 in XPCDictionary.forEach(_:);
  *(void *)(v8 + 24) = v11;
  closure #1 in XPCDictionary.forEach(_:)((uint64_t)partial apply for closure #1 in XPCDictionary.forEach(_:), v8, xdict);
  if (v3)
  {
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    uint64_t result = swift_release();
    if (isEscapingClosureAtFileLocation) {
      __break(1u);
    }
    else {
      return v16;
    }
  }
  return result;
}

uint64_t XPCDictionary.map<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *v3;
  uint64_t v19 = Array.init()();
  size_t count = xpc_dictionary_get_count(v8);
  type metadata accessor for Array();
  Array.reserveCapacity(_:)(count);
  uint64_t v15 = a3;
  uint64_t v16 = &v19;
  uint64_t v17 = a1;
  uint64_t v18 = a2;
  v13[2] = partial apply for closure #1 in XPCDictionary.map<A>(_:);
  uint64_t v13[3] = &v14;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = partial apply for closure #1 in XPCDictionary.forEach(_:);
  *(void *)(v10 + 24) = v13;
  closure #1 in XPCDictionary.forEach(_:)((uint64_t)partial apply for closure #1 in XPCDictionary.forEach(_:), v10, v8);
  if (v4)
  {
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    uint64_t result = swift_release();
    if (isEscapingClosureAtFileLocation) {
      __break(1u);
    }
    else {
      return v19;
    }
  }
  return result;
}

void *specialized closure #1 in XPCDictionary.map<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *(*a5)(uint64_t *__return_ptr))
{
  uint64_t result = a5(&v8);
  if (!v5)
  {
    MEMORY[0x2105624A0](result);
    if (*(void *)((*a4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*a4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    return (void *)specialized Array._endMutation()();
  }
  return result;
}

uint64_t closure #1 in XPCDictionary.map<A>(_:)(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x270FA5388](a1);
  uint64_t result = v3(v2);
  if (!v1)
  {
    type metadata accessor for Array();
    return Array.append(_:)();
  }
  return result;
}

uint64_t XPCDictionary.values.getter()
{
  return specialized XPCDictionary.map<A>(_:)((uint64_t)specialized implicit closure #1 in XPCDictionary.values.getter, 0, *v0);
}

uint64_t specialized implicit closure #1 in XPCDictionary.values.getter@<X0>(uint64_t a1@<X2>, void *a2@<X8>)
{
  *a2 = a1;
  return swift_unknownObjectRetain();
}

xpc_object_t XPCDictionary.createReply()@<X0>(void *a1@<X8>)
{
  xpc_object_t result = xpc_dictionary_create_reply(*v1);
  xpc_object_t v4 = result;
  if (result && (xpc_object_t result = (xpc_object_t)MEMORY[0x2105634B0](result), result != (xpc_object_t)MEMORY[0x263EF8708])) {
    __break(1u);
  }
  else {
    *a1 = v4;
  }
  return result;
}

Swift::Void __swiftcall XPCDictionary.sendReply()()
{
  MEMORY[0x270EDC0D8](*v0);
}

BOOL static XPCDictionary.== infix(_:_:)(xpc_object_t *a1, xpc_object_t *a2)
{
  return xpc_equal(*a1, *a2);
}

void XPCDictionary.hash(into:)()
{
  size_t v1 = xpc_hash(*v0);
  Hasher._combine(_:)(v1);
}

Swift::Int XPCDictionary.hashValue.getter()
{
  size_t v1 = *v0;
  Hasher.init(_seed:)();
  size_t v2 = xpc_hash(v1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t XPCDictionary.debugDescription.getter()
{
  size_t v1 = (void *)MEMORY[0x210563350](*v0);
  uint64_t v2 = String.init(cString:)();
  free(v1);
  return v2;
}

uint64_t XPCDictionary.auditToken.getter()
{
  return 0;
}

uint64_t specialized Array._reserveCapacityImpl(minimumCapacity:growForAppend:)(uint64_t a1, char a2)
{
  unint64_t v5 = *v2;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v2 = v5;
  uint64_t v7 = 0;
  if ((result & 1) != 0 && (v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
  {
    if (a1 <= *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      return result;
    }
    uint64_t v7 = 1;
  }
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 <= a1) {
    uint64_t v9 = a1;
  }
  else {
    uint64_t v9 = v8;
  }
  uint64_t result = MEMORY[0x210562690](v7, v9, a2 & 1, v5);
  *uint64_t v2 = result;
  return result;
}

uint64_t specialized XPCDictionary.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(char *, char *), uint64_t a7, uint64_t (*a8)(uint64_t))
{
  char v12 = v8;
  v18[2] = a4;
  v18[3] = a5;
  type metadata accessor for Optional();
  _sSq7flatMapyqd_0_SgABxqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF(a6, (uint64_t)v18, MEMORY[0x263F8E628], a7, v15, (uint64_t)&v19);
  if ((v20 & 1) == 0)
  {
    uint64_t v16 = (_xpc_connection_s *)a8(v19);
    swift_unknownObjectRetain();
    specialized String.withCString<A>(_:)(a2, a3, v16, v12);
    swift_unknownObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t specialized XPCDictionary.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  v13[2] = a4;
  uint64_t v13[3] = a5;
  type metadata accessor for Optional();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for OS_xpc_object);
  _sSq3mapyqd_0_Sgqd_0_xqd__YKXEqd__YKs5ErrorRd__Ri_d_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in XPCDictionary.subscript.setter, (uint64_t)v13, MEMORY[0x263F8E628], v9, v10, (uint64_t)&v14);
  uint64_t v11 = v14;
  if (v14)
  {
    swift_unknownObjectRetain();
    specialized String.withCString<A>(_:)(a2, a3, v11, v6);
    swift_unknownObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

const void *partial apply for closure #1 in XPCDictionary.subscript.getter@<X0>(char *key@<X0>, void *a2@<X8>)
{
  uint64_t result = xpc_dictionary_get_data(*(xpc_object_t *)(v2 + 16), key, *(size_t **)(v2 + 24));
  *a2 = result;
  return result;
}

uint64_t sub_20DA20EE4()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t partial apply for closure #1 in XPCDictionary.copy(into:)(char *key, xpc_object_t value)
{
  xpc_dictionary_set_value(*(xpc_object_t *)(v2 + 16), key, value);
  return 1;
}

uint64_t sub_20DA20F44()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void partial apply for closure #1 in XPCDictionary.removeValue(forKey:)(char *key@<X0>, void *a2@<X8>)
{
  unint64_t v5 = *(void **)(v2 + 16);
  xpc_object_t v6 = xpc_dictionary_get_value(v5, key);
  xpc_dictionary_set_value(v5, key, 0);
  *a2 = v6;
}

uint64_t sub_20DA20FC0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_20DA20FD0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for closure #1 in XPCDictionary.map<A>(_:)(uint64_t a1)
{
  return closure #1 in XPCDictionary.map<A>(_:)(a1);
}

uint64_t sub_20DA21000()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

unint64_t lazy protocol witness table accessor for type XPCDictionary and conformance XPCDictionary()
{
  unint64_t result = lazy protocol witness table cache variable for type XPCDictionary and conformance XPCDictionary;
  if (!lazy protocol witness table cache variable for type XPCDictionary and conformance XPCDictionary)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type XPCDictionary and conformance XPCDictionary);
  }
  return result;
}

uint64_t sub_20DA21068(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return key path getter for XPCDictionary.subscript<A>(_:) : <A>XPCDictionaryA(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))XPCDictionary.subscript.getter);
}

uint64_t sub_20DA21094(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (void (*)(char *, char *))partial apply for implicit closure #1 in XPCDictionary.subscript.setter, MEMORY[0x263F8E5C0], MEMORY[0x263EF8B18]);
}

uint64_t sub_20DA210C8()
{
  return 16;
}

__n128 sub_20DA210D4(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_20DA210E0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return key path getter for XPCDictionary.subscript<A>(_:) : <A>XPCDictionaryA(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))XPCDictionary.subscript.getter);
}

uint64_t sub_20DA2110C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (void (*)(char *, char *))partial apply for implicit closure #1 in XPCDictionary.subscript.setter, MEMORY[0x263F8E970], MEMORY[0x263EF8B20]);
}

uint64_t keypath_setTm(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, void (*a5)(char *, char *), uint64_t a6, uint64_t (*a7)(uint64_t))
{
  uint64_t v11 = *(uint64_t *)((char *)a3 + a4 - 16);
  uint64_t v12 = *(uint64_t *)((char *)a3 + a4 - 8);
  uint64_t v13 = *a3;
  uint64_t v14 = a3[1];
  swift_bridgeObjectRetain();
  return specialized XPCDictionary.subscript.setter(a1, v13, v14, v11, v12, a5, a6, a7);
}

uint64_t sub_20DA211C8()
{
  return 16;
}

__n128 sub_20DA211D4(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_20DA211E0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return key path getter for XPCDictionary.subscript<A>(_:) : <A>XPCDictionaryA(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))XPCDictionary.subscript.getter);
}

uint64_t sub_20DA2120C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v5 = *(uint64_t *)((char *)a3 + a4 - 16);
  uint64_t v6 = *(uint64_t *)((char *)a3 + a4 - 8);
  uint64_t v7 = *a3;
  uint64_t v8 = a3[1];
  swift_bridgeObjectRetain();
  return specialized XPCDictionary.subscript.setter(a1, v7, v8, v5, v6);
}

uint64_t sub_20DA2126C()
{
  return 16;
}

__n128 sub_20DA21278(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_20DA2128C()
{
  return 0;
}

uint64_t sub_20DA212A4()
{
  return 0;
}

uint64_t sub_20DA212BC()
{
  return 0;
}

uint64_t sub_20DA212D4()
{
  return 0;
}

uint64_t sub_20DA212EC()
{
  return 0;
}

uint64_t sub_20DA21304()
{
  return 0;
}

uint64_t partial apply for closure #1 in XPCDictionary.subscript.getter@<X0>(char *key@<X0>, void *a2@<X8>)
{
  uint64_t result = (uint64_t)xpc_dictionary_get_string(*(xpc_object_t *)(v2 + 16), key);
  if (result) {
    uint64_t result = String.init(cString:)();
  }
  else {
    uint64_t v5 = 0;
  }
  *a2 = result;
  a2[1] = v5;
  return result;
}

void *partial apply for specialized closure #1 in XPCDictionary.map<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return specialized closure #1 in XPCDictionary.map<A>(_:)(a1, a2, a3, *(void **)(v3 + 16), *(void *(**)(uint64_t *__return_ptr))(v3 + 24));
}

uint64_t sub_20DA2137C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_20DA2138C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_20DA2139C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_20DA213D4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void partial apply for closure #1 in XPCDictionary.subscript.setter(char *key)
{
  xpc_dictionary_set_data(**(xpc_object_t **)(v1 + 16), key, (const void *)(*(void *)(v1 + 24) + 32), *(void *)(*(void *)(v1 + 24) + 16));
}

{
  uint64_t v1;

  xpc_dictionary_set_value(**(xpc_object_t **)(v1 + 16), key, *(xpc_object_t *)(v1 + 24));
}

void partial apply for closure #1 in closure #1 in XPCDictionary.subscript.setter(char *string)
{
  xpc_dictionary_set_string(**(xpc_object_t **)(v1 + 16), *(const char **)(v1 + 24), string);
}

xpc_object_t partial apply for closure #1 in XPCDictionary.subscript.setter@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return closure #1 in XPCDictionary.subscript.setter(a1, a2);
}

uint64_t partial apply for implicit closure #1 in XPCDictionary.subscript.setter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return implicit closure #1 in XPCDictionary.subscript.setter(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

{
  uint64_t v2;

  return implicit closure #1 in XPCDictionary.subscript.setter(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

void partial apply for closure #1 in XPCDictionary.subscript.setter(const char *a1)
{
  closure #1 in XPCDictionary.subscript.setter(a1, *(_xpc_connection_s **)(v1 + 16), *(void ***)(v1 + 24));
}

uint64_t dispatch thunk of DecodingContainer.init(codingMetadata:buffer:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(float a1)
{
  uint64_t v2 = MEMORY[0x263F8D5C8];
  uint64_t v8[3] = MEMORY[0x263F8D5C8];
  void v8[4] = &protocol witness table for Float;
  *(float *)uint64_t v8 = a1;
  uint64_t v3 = __swift_project_boxed_opaque_existential_1(v8, MEMORY[0x263F8D5C8]);
  v7[3] = v2;
  v7[4] = (uint64_t)off_26C23ED28;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v2 - 8) + 16))(boxed_opaque_existential_1, v3, v2);
  outlined init with take of EncodingContainer?((uint64_t)v7, (uint64_t)v6);
  swift_beginAccess();
  outlined assign with take of EncodingContainer?((uint64_t)v6, v1 + 32);
  swift_endAccess();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(__int16 a1)
{
  uint64_t v2 = MEMORY[0x263F8E4F0];
  uint64_t v8[3] = MEMORY[0x263F8E4F0];
  void v8[4] = &protocol witness table for Int16;
  LOWORD(v8[0]) = a1;
  uint64_t v3 = __swift_project_boxed_opaque_existential_1(v8, MEMORY[0x263F8E4F0]);
  v7[3] = v2;
  v7[4] = (uint64_t)off_26C23EF28;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v2 - 8) + 16))(boxed_opaque_existential_1, v3, v2);
  outlined init with take of EncodingContainer?((uint64_t)v7, (uint64_t)v6);
  swift_beginAccess();
  outlined assign with take of EncodingContainer?((uint64_t)v6, v1 + 32);
  swift_endAccess();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t *boxed_opaque_existential_1;
  unsigned char v6[40];
  uint64_t v7[5];
  void v8[5];

  uint64_t v2 = MEMORY[0x263F8E888];
  uint64_t v8[3] = MEMORY[0x263F8E888];
  void v8[4] = &protocol witness table for UInt16;
  LOWORD(v8[0]) = a1;
  uint64_t v3 = __swift_project_boxed_opaque_existential_1(v8, MEMORY[0x263F8E888]);
  v7[3] = v2;
  v7[4] = (uint64_t)off_26C23F148;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v2 - 8) + 16))(boxed_opaque_existential_1, v3, v2);
  outlined init with take of EncodingContainer?((uint64_t)v7, (uint64_t)v6);
  swift_beginAccess();
  outlined assign with take of EncodingContainer?((uint64_t)v6, v1 + 32);
  swift_endAccess();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t protocol witness for SingleValueEncodingContainer.codingPath.getter in conformance _XPCSingleValueEncodingContainer(uint64_t a1)
{
  return CodingContainerWithMetadata.codingPath.getter(a1, (uint64_t)&protocol witness table for _XPCSingleValueEncodingContainer);
}

uint64_t protocol witness for SingleValueEncodingContainer.encodeNil() in conformance _XPCSingleValueEncodingContainer()
{
  uint64_t v1 = *v0;
  uint64_t v5 = &type metadata for NilPrimitive;
  uint64_t v6 = &protocol witness table for NilPrimitive;
  outlined init with take of EncodingContainer?((uint64_t)v4, (uint64_t)v3);
  swift_beginAccess();
  outlined assign with take of EncodingContainer?((uint64_t)v3, v1 + 32);
  return swift_endAccess();
}

uint64_t protocol witness for SingleValueEncodingContainer.encode(_:) in conformance _XPCSingleValueEncodingContainer(float a1)
{
  return specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(a1);
}

uint64_t protocol witness for SingleValueEncodingContainer.encode(_:) in conformance _XPCSingleValueEncodingContainer(__int16 a1)
{
  return specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(a1);
}

{
  return specialized _XPCSingleValueEncodingContainer.encode<A>(_:)(a1);
}

uint64_t protocol witness for SingleValueEncodingContainer.encode(_:) in conformance _XPCSingleValueEncodingContainer()
{
  return SingleValueEncodingContainer.encode(_:)();
}

{
  return SingleValueEncodingContainer.encode(_:)();
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance _XPCSingleValueEncodingContainer()
{
  return 17;
}

BOOL Optional.isNil.getter(uint64_t a1)
{
  return (*(unsigned int (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 48))(v1, 1) == 1;
}

uint64_t dispatch thunk of CodingOptional.isNil.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

unint64_t lazy protocol witness table accessor for type _XPCDecoder and conformance _XPCDecoder()
{
  unint64_t result = lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder;
  if (!lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder)
  {
    type metadata accessor for _XPCDecoder();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type _XPCDecoder and conformance _XPCDecoder);
  }
  return result;
}

ValueMetadata *type metadata accessor for OptionalPrimitive()
{
  return &type metadata for OptionalPrimitive;
}

uint64_t protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance OptionalPrimitive(uint64_t a1, uint64_t a2, void *a3)
{
  return swift_release();
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance OptionalPrimitive()
{
  return 18;
}

uint64_t specialized OptionalPrimitive.encode(to:)(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 16);
  swift_beginAccess();
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a1 + 16) = v3;
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v3 + 16) + 1, 1, (char *)v3);
    uint64_t v3 = result;
    *uint64_t v2 = result;
  }
  unint64_t v6 = *(void *)(v3 + 16);
  unint64_t v5 = *(void *)(v3 + 24);
  if (v6 >= v5 >> 1)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v5 > 1), v6 + 1, 1, (char *)v3);
    uint64_t v3 = result;
    *uint64_t v2 = result;
  }
  *(void *)(v3 + 16) = v6 + 1;
  *(unsigned char *)(v3 + v6 + 32) = 19;
  uint64_t v7 = *v2;
  unint64_t v9 = *(void *)(*v2 + 16);
  unint64_t v8 = *(void *)(*v2 + 24);
  if (v9 >= v8 >> 1)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v8 > 1), v9 + 1, 1, (char *)v7);
    uint64_t v7 = result;
    *uint64_t v2 = result;
  }
  *(void *)(v7 + 16) = v9 + 1;
  *(unsigned char *)(v7 + v9 + 32) = 1;
  return result;
}

uint64_t dispatch thunk of EncodingContainer.encode(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t specialized SetAlgebra<>.init(arrayLiteral:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    unint64_t v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t XPCListener.InitializationOptions.rawValue.getter()
{
  return *(void *)v0;
}

uint64_t XPCListener.InitializationOptions.init(rawValue:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t static XPCListener.InitializationOptions.none.getter@<X0>(void *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = static XPCListener.InitializationOptions.none;
  return result;
}

uint64_t static XPCListener.InitializationOptions.none.setter(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t result = swift_beginAccess();
  static XPCListener.InitializationOptions.none = v1;
  return result;
}

uint64_t (*static XPCListener.InitializationOptions.none.modify())()
{
  return static XPCSession.InitializationOptions.privileged.modify;
}

uint64_t static XPCListener.InitializationOptions.inactive.getter@<X0>(void *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = static XPCListener.InitializationOptions.inactive;
  return result;
}

uint64_t static XPCListener.InitializationOptions.inactive.setter(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t result = swift_beginAccess();
  static XPCListener.InitializationOptions.inactive = v1;
  return result;
}

uint64_t (*static XPCListener.InitializationOptions.inactive.modify())()
{
  return static XPCSession.InitializationOptions.inactive.modify;
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance XPCListener.InitializationOptions@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return specialized SetAlgebra<>.init(arrayLiteral:)(a1, a2);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance XPCListener.IncomingSessionRequest.Decision._Decision(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance XPCListener.IncomingSessionRequest.Decision._Decision()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance XPCListener.IncomingSessionRequest.Decision._Decision()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance XPCListener.IncomingSessionRequest.Decision._Decision()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

unsigned char *XPCListener.IncomingSessionRequest.decision.setter(unsigned char *result)
{
  if (*(unsigned char *)(v1 + 24) != 2)
  {
    _StringGuts.grow(_:)(55);
    v2._object = (void *)0x800000020DA32010;
    v2._countAndFlagsBits = 0xD000000000000035;
    String.append(_:)(v2);
    if (*(unsigned char *)(v1 + 24) == 2) {
      __break(1u);
    }
    _print_unlocked<A, B>(_:_:)();
    __XPC_API_MISUSE__(_:file:line:)(0, 0xE000000000000000);
  }
  *(unsigned char *)(v1 + 24) = *result;
  return result;
}

uint64_t XPCListener.IncomingSessionRequest.accept(incomingMessageHandler:cancellationHandler:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unsigned char *a5@<X8>)
{
  return XPCListener.IncomingSessionRequest.accept(incomingMessageHandler:cancellationHandler:)(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))XPCSession.setIncomingMessageHandler(_:), a5);
}

{
  return XPCListener.IncomingSessionRequest.accept(incomingMessageHandler:cancellationHandler:)(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))XPCSession.setIncomingMessageHandler(_:), a5);
}

uint64_t XPCListener.IncomingSessionRequest.accept<A>(incomingMessageHandler:cancellationHandler:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unsigned char *a7@<X8>)
{
  XPCListener.IncomingSessionRequest.accept<A>(incomingMessageHandler:cancellationHandler:)(&v9, a1, a2, a3, a4, a5, a6);
  uint64_t result = swift_release();
  *a7 = v9;
  return result;
}

uint64_t XPCListener.IncomingSessionRequest.accept(incomingMessageHandler:cancellationHandler:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void (*a5)(uint64_t, uint64_t)@<X4>, unsigned char *a6@<X8>)
{
  swift_retain();
  a5(a1, a2);
  swift_release();
  XPCListener.IncomingSessionRequest._accept(cancellationHandler:)(&v13, a3, a4);
  uint64_t result = swift_release();
  *a6 = v13;
  return result;
}

uint64_t XPCListener.IncomingSessionRequest._accept(cancellationHandler:)(unsigned char *a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v7 = *(void *)(v3 + 16);
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = a2;
    *(void *)(v8 + 24) = a3;
    outlined copy of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a2);
    outlined copy of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a2);
    swift_retain();
    uint64_t v9 = ClientSpecifiedHandler.init(_:)((uint64_t)_s3XPC12XPCRichErrorVIegn_ACytIegnr_TRTA_0);
    uint64_t v11 = v10;
    uint64_t v12 = *(void **)(v7 + 16);
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v9;
    *(void *)(v13 + 24) = v11;
    v17[4] = partial apply for closure #1 in XPCSession.setCancellationHandler(_:);
    void v17[5] = v13;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 1107296256;
    v17[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_object) -> ();
    void v17[3] = &block_descriptor_80;
    uint64_t v14 = _Block_copy(v17);
    swift_retain();
    swift_release();
    _swift_xpc_session_set_cancel_handler(v12, v14);
    _Block_release(v14);
    swift_release();
    swift_release();
    outlined consume of (@escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ())?(a2);
  }
  LOBYTE(v17[0]) = 0;
  XPCListener.IncomingSessionRequest.decision.setter(v17);
  int v15 = *(unsigned __int8 *)(v3 + 24);
  if (v15 == 2) {
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD00000000000002ALL, 0x800000020DA31E80);
  }
  *a1 = v15 & 1;
  return swift_retain();
}

uint64_t XPCListener.IncomingSessionRequest.accept(incomingMessageHandler:cancellationHandler:)(unsigned char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return XPCListener.IncomingSessionRequest.accept(incomingMessageHandler:cancellationHandler:)(a1, a2, a3, a4, a5, (void (*)(uint64_t, uint64_t))XPCSession.setIncomingMessageHandler(_:));
}

{
  return XPCListener.IncomingSessionRequest.accept(incomingMessageHandler:cancellationHandler:)(a1, a2, a3, a4, a5, (void (*)(uint64_t, uint64_t))XPCSession.setIncomingMessageHandler(_:));
}

uint64_t XPCListener.IncomingSessionRequest.accept<A>(incomingMessageHandler:cancellationHandler:)(unsigned char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  swift_retain();
  XPCSession.setIncomingMessageHandler<A>(_:)(a2, a3, a6, a7);
  swift_release();

  return XPCListener.IncomingSessionRequest._accept(cancellationHandler:)(a1, a4, a5);
}

uint64_t XPCListener.IncomingSessionRequest.accept(incomingMessageHandler:cancellationHandler:)(unsigned char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t))
{
  swift_retain();
  a6(a2, a3);
  swift_release();

  return XPCListener.IncomingSessionRequest._accept(cancellationHandler:)(a1, a4, a5);
}

uint64_t XPCListener.IncomingSessionRequest.accept<A>(_:)@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, unsigned char *a4@<X8>)
{
  return XPCListener.IncomingSessionRequest.accept<A>(_:)(a1, a2, a3, (uint64_t (*)(char *, uint64_t, uint64_t))implicit closure #1 in XPCListener.IncomingSessionRequest.accept<A>(_:), (uint64_t (*)(char *, uint64_t, uint64_t))implicit closure #3 in XPCListener.IncomingSessionRequest.accept<A>(_:), (void (*)(uint64_t, uint64_t))XPCSession.setIncomingMessageHandler(_:), a4);
}

{
  return XPCListener.IncomingSessionRequest.accept<A>(_:)(a1, a2, a3, (uint64_t (*)(char *, uint64_t, uint64_t))implicit closure #1 in XPCListener.IncomingSessionRequest.accept<A>(_:), (uint64_t (*)(char *, uint64_t, uint64_t))implicit closure #3 in XPCListener.IncomingSessionRequest.accept<A>(_:), (void (*)(uint64_t, uint64_t))XPCSession.setIncomingMessageHandler(_:), a4);
}

uint64_t (*implicit closure #1 in XPCListener.IncomingSessionRequest.accept<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3))(uint64_t *a1)
{
  uint64_t v5 = *(void *)(a2 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a2;
  *(void *)(v9 + 24) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, v7, a2);
  return partial apply for implicit closure #2 in implicit closure #1 in XPCListener.IncomingSessionRequest.accept<A>(_:);
}

uint64_t (*implicit closure #3 in XPCListener.IncomingSessionRequest.accept<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v5 = *(void *)(a2 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a2;
  *(void *)(v9 + 24) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, v7, a2);
  return partial apply for implicit closure #4 in implicit closure #3 in XPCListener.IncomingSessionRequest.accept<A>(_:);
}

{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;

  uint64_t v5 = *(void *)(a2 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a2;
  *(void *)(v9 + 24) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, v7, a2);
  return partial apply for implicit closure #4 in implicit closure #3 in XPCListener.IncomingSessionRequest.accept<A>(_:);
}

uint64_t XPCListener.IncomingSessionRequest.accept<A>(_:)@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, unsigned char *a5@<X8>)
{
  uint64_t v21 = a5;
  uint64_t v9 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = swift_retain();
  a1(v12);
  swift_release();
  uint64_t v13 = implicit closure #1 in XPCListener.IncomingSessionRequest.accept<A>(_:)((uint64_t)v11, a2, a3, a4);
  uint64_t v15 = v14;
  uint64_t v16 = implicit closure #3 in XPCListener.IncomingSessionRequest.accept<A>(_:)((uint64_t)v11, a2, a3, a4);
  uint64_t v18 = v17;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  XPCListener.IncomingSessionRequest.accept<A>(incomingMessageHandler:cancellationHandler:)(&v22, (uint64_t)v13, v15, (uint64_t)v16, v18, AssociatedTypeWitness, a4);
  swift_release();
  *uint64_t v21 = v22;
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, a2);
}

uint64_t (*implicit closure #1 in XPCListener.IncomingSessionRequest.accept<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4))()
{
  uint64_t v7 = *(void *)(a2 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = (char *)swift_allocObject();
  *((void *)v11 + 2) = a2;
  *((void *)v11 + 3) = a3;
  *((void *)v11 + 4) = a4;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v11[v10], v9, a2);
  return partial apply for implicit closure #2 in implicit closure #1 in XPCListener.IncomingSessionRequest.accept<A>(_:);
}

uint64_t (*implicit closure #3 in XPCListener.IncomingSessionRequest.accept<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t a1)
{
  uint64_t v7 = *(void *)(a2 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = (char *)swift_allocObject();
  *((void *)v11 + 2) = a2;
  *((void *)v11 + 3) = a3;
  *((void *)v11 + 4) = a4;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v11[v10], v9, a2);
  return partial apply for implicit closure #4 in implicit closure #3 in XPCListener.IncomingSessionRequest.accept<A>(_:);
}

uint64_t XPCListener.IncomingSessionRequest.accept<A>(_:)@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t (*a4)(char *, uint64_t, uint64_t)@<X4>, uint64_t (*a5)(char *, uint64_t, uint64_t)@<X5>, void (*a6)(uint64_t, uint64_t)@<X6>, unsigned char *a7@<X8>)
{
  uint64_t v24 = a6;
  uint64_t v25 = a7;
  uint64_t v12 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = swift_retain();
  a1(v15);
  swift_release();
  uint64_t v16 = a4(v14, a2, a3);
  uint64_t v18 = v17;
  uint64_t v19 = a5(v14, a2, a3);
  uint64_t v21 = v20;
  swift_retain();
  v24(v16, v18);
  swift_release();
  XPCListener.IncomingSessionRequest._accept(cancellationHandler:)(&v26, v19, v21);
  swift_release();
  swift_release();
  swift_release();
  unsigned char *v25 = v26;
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, a2);
}

uint64_t (*implicit closure #1 in XPCListener.IncomingSessionRequest.accept<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3))(long long *a1)
{
  uint64_t v5 = *(void *)(a2 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a2;
  *(void *)(v9 + 24) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9 + v8, v7, a2);
  return partial apply for implicit closure #2 in implicit closure #1 in XPCListener.IncomingSessionRequest.accept<A>(_:);
}

XPC::XPCListener::IncomingSessionRequest::Decision __swiftcall XPCListener.IncomingSessionRequest.reject(reason:)(Swift::String reason)
{
  uint64_t v3 = v1;
  uint64_t v4 = *(void **)(*(void *)(v2 + 16) + 16);
  String.utf8CString.getter();
  id v5 = v4;
  _swift_xpc_listener_reject_peer(v5);

  swift_release();
  char v8 = 1;
  result.decision = XPCListener.IncomingSessionRequest.decision.setter(&v8);
  int v7 = *(unsigned __int8 *)(v2 + 24);
  if (v7 == 2) {
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD00000000000002ALL, 0x800000020DA31E80);
  }
  *uint64_t v3 = v7 & 1;
  return result;
}

void _swift_xpc_listener_reject_peer(void *a1)
{
  id v1 = a1;
  MEMORY[0x210563540]();
}

uint64_t XPCListener.IncomingSessionRequest.deinit()
{
  swift_release();
  return v0;
}

uint64_t XPCListener.IncomingSessionRequest.__deallocating_deinit()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 25, 7);
}

uint64_t XPCListener.__allocating_init(service:targetQueue:options:incomingSessionHandler:)(uint64_t a1, uint64_t a2, void *a3, xpc_listener_create_flags_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = swift_allocObject();
  XPCListener.init(service:targetQueue:options:incomingSessionHandler:)(a1, a2, a3, a4, a5, a6);
  return v12;
}

uint64_t XPCListener.init(service:targetQueue:options:incomingSessionHandler:)(uint64_t a1, uint64_t a2, void *a3, xpc_listener_create_flags_t *a4, uint64_t a5, uint64_t a6)
{
  v32[1] = *(xpc_rich_error_t *)MEMORY[0x263EF8340];
  xpc_listener_create_flags_t v10 = *a4;
  v32[0] = 0;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a5;
  *(void *)(v11 + 24) = a6;
  type metadata accessor for XPCListener.IncomingSessionRequest();
  swift_retain();
  uint64_t v12 = ClientSpecifiedHandler.init(_:)((uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@guaranteed XPCListener.IncomingSessionRequest) -> (@out XPCListener.IncomingSessionRequest.Decision));
  uint64_t v14 = v13;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v12;
  *(void *)(v15 + 24) = v14;
  aBlock[4] = partial apply for closure #1 in XPCListener.init(service:targetQueue:options:incomingSessionHandler:);
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_session) -> ();
  aBlock[3] = &block_descriptor_3;
  uint64_t v16 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  uint64_t v17 = String.utf8CString.getter();
  swift_bridgeObjectRelease();
  uint64_t v18 = _swift_xpc_listener_create((const char *)(v17 + 32), a3, v10, v16, v32);
  _Block_release(v16);
  uint64_t v19 = v32[0];
  swift_release();
  if (!v18)
  {
    if (v19)
    {
      lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError();
      swift_allocError();
      uint64_t v21 = v20;
      uint64_t v22 = swift_unknownObjectRetain();
      if (MEMORY[0x2105634B0](v22) != MEMORY[0x263EF8770]) {
        __break(1u);
      }
      uint64_t v30 = v6;
      uint64_t v23 = xpc_rich_error_copy_description(v19);
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = String.init(cString:)();
        uint64_t v27 = v26;
        BOOL can_retry = xpc_rich_error_can_retry(v19);
        free(v24);
        *(unsigned char *)uint64_t v21 = can_retry;
        *(void *)(v21 + 8) = v25;
        *(void *)(v21 + 16) = v27;
        swift_willThrow();
        swift_release();
        swift_unknownObjectRelease();

        swift_release();
        swift_unknownObjectRelease();
        type metadata accessor for XPCListener();
        uint64_t v6 = v30;
        swift_deallocPartialClassInstance();
        return v6;
      }
      __break(1u);
    }
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD00000000000001CLL, 0x800000020DA31F30);
  }
  swift_release();

  swift_release();
  *(void *)(v6 + 16) = v18;
  swift_unknownObjectRelease();
  return v6;
}

uint64_t sub_20DA239BC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed XPCListener.IncomingSessionRequest) -> (@out XPCListener.IncomingSessionRequest.Decision)(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t type metadata accessor for XPCListener.IncomingSessionRequest()
{
  return self;
}

void thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_session) -> ()(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

xpc_listener_t _swift_xpc_listener_create(const char *a1, void *a2, xpc_listener_create_flags_t a3, void *a4, xpc_rich_error_t *a5)
{
  uint64_t v9 = a2;
  id v10 = a4;
  xpc_listener_t v11 = xpc_listener_create(a1, v9, a3, v10, a5);

  return v11;
}

uint64_t type metadata accessor for XPCListener()
{
  return self;
}

uint64_t XPCListener.__allocating_init(targetQueue:options:incomingSessionHandler:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = swift_allocObject();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a3;
  *(void *)(v8 + 24) = a4;
  type metadata accessor for XPCListener.IncomingSessionRequest();
  swift_retain();
  uint64_t v9 = ClientSpecifiedHandler.init(_:)((uint64_t)thunk for @escaping @callee_guaranteed (@guaranteed XPCListener.IncomingSessionRequest) -> (@out XPCListener.IncomingSessionRequest.Decision)partial apply);
  uint64_t v11 = v10;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v9;
  *(void *)(v12 + 24) = v11;
  v16[4] = partial apply for closure #1 in XPCListener.init(targetQueue:options:incomingSessionHandler:);
  v16[5] = v12;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 1107296256;
  v16[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_session) -> ();
  void v16[3] = &block_descriptor_14;
  uint64_t v13 = _Block_copy(v16);
  swift_retain();
  swift_release();
  uint64_t anonymous = xpc_listener_create_anonymous();
  swift_release();

  swift_release();
  _Block_release(v13);
  *(void *)(v7 + 16) = anonymous;
  return v7;
}

uint64_t XPCListener.init(targetQueue:options:incomingSessionHandler:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a3;
  *(void *)(v8 + 24) = a4;
  type metadata accessor for XPCListener.IncomingSessionRequest();
  swift_retain();
  uint64_t v9 = ClientSpecifiedHandler.init(_:)((uint64_t)thunk for @escaping @callee_guaranteed (@guaranteed XPCListener.IncomingSessionRequest) -> (@out XPCListener.IncomingSessionRequest.Decision)partial apply);
  uint64_t v11 = v10;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v9;
  *(void *)(v12 + 24) = v11;
  v16[4] = partial apply for closure #1 in XPCListener.init(service:targetQueue:options:incomingSessionHandler:);
  v16[5] = v12;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 1107296256;
  v16[2] = thunk for @escaping @callee_guaranteed (@guaranteed OS_xpc_session) -> ();
  void v16[3] = &block_descriptor_25;
  uint64_t v13 = _Block_copy(v16);
  swift_retain();
  swift_release();
  uint64_t anonymous = xpc_listener_create_anonymous();
  swift_release();

  swift_release();
  _Block_release(v13);
  *(void *)(v4 + 16) = anonymous;
  return v4;
}

uint64_t closure #1 in XPCListener.init(service:targetQueue:options:incomingSessionHandler:)(void *a1, void (*a2)(uint64_t))
{
  type metadata accessor for XPCListener.IncomingSessionRequest();
  uint64_t v4 = swift_allocObject();
  *(unsigned char *)(v4 + 24) = 2;
  type metadata accessor for XPCSession();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v4 + 16) = v5;
  uint64_t v8 = v4;
  id v6 = a1;
  ClientSpecifiedHandler.callEventHandler(_:)((uint64_t)&v8, a2);
  return swift_release();
}

uint64_t partial apply for closure #1 in XPCListener.init(targetQueue:options:incomingSessionHandler:)(void *a1)
{
  return closure #1 in XPCListener.init(service:targetQueue:options:incomingSessionHandler:)(a1, *(void (**)(uint64_t))(v1 + 16));
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> XPCListener.activate()()
{
  v12[1] = *(xpc_rich_error_t *)MEMORY[0x263EF8340];
  v12[0] = 0;
  BOOL v1 = _swift_xpc_listener_activate(*(void **)(v0 + 16), v12);
  uint64_t v2 = v12[0];
  if (!v1)
  {
    if (v12[0])
    {
      lazy protocol witness table accessor for type XPCRichError and conformance XPCRichError();
      swift_allocError();
      uint64_t v4 = v3;
      uint64_t v5 = swift_unknownObjectRetain();
      if (MEMORY[0x2105634B0](v5) != MEMORY[0x263EF8770]) {
        __break(1u);
      }
      id v6 = xpc_rich_error_copy_description(v2);
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = String.init(cString:)();
        uint64_t v10 = v9;
        BOOL can_retry = xpc_rich_error_can_retry(v2);
        free(v7);
        *(unsigned char *)uint64_t v4 = can_retry;
        *(void *)(v4 + 8) = v8;
        *(void *)(v4 + 16) = v10;
        swift_willThrow();
        swift_unknownObjectRelease();
        goto LABEL_6;
      }
      __break(1u);
    }
    __XPC_INTERNAL_CRASH__(_:file:line:)(0xD00000000000001FLL, 0x800000020DA30F00);
  }
LABEL_6:
  swift_unknownObjectRelease();
}

BOOL _swift_xpc_listener_activate(void *a1, xpc_rich_error_t *a2)
{
  uint64_t v3 = a1;
  BOOL v4 = xpc_listener_activate(v3, a2);

  return v4;
}

Swift::Void __swiftcall XPCListener.cancel()()
{
  _swift_xpc_listener_cancel(*(void **)(v0 + 16));
}

void _swift_xpc_listener_cancel(void *a1)
{
  BOOL v1 = a1;
  xpc_listener_cancel(v1);
}

uint64_t XPCListener.deinit()
{
  return v0;
}

uint64_t XPCListener.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t XPCListener.endpoint.getter@<X0>(uint64_t *a1@<X8>)
{
  endpoint = (void *)xpc_listener_create_endpoint();
  swift_getObjectType();
  uint64_t result = OS_xpc_object.isCodable()();
  if (result)
  {
    uint64_t result = (uint64_t)xpc_copy(endpoint);
    if (result)
    {
      uint64_t v4 = result;
      uint64_t result = swift_unknownObjectRelease();
      *a1 = v4;
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

unint64_t XPCListener.debugDescription.getter()
{
  BOOL v1 = _swift_xpc_listener_copy_description(*(void **)(v0 + 16));
  if (!v1) {
    return 0xD000000000000036;
  }
  uint64_t v2 = v1;
  uint64_t v3 = String.init(cString:)();
  free(v2);
  return v3;
}

char *_swift_xpc_listener_copy_description(void *a1)
{
  BOOL v1 = a1;
  uint64_t v2 = xpc_listener_copy_description(v1);

  return v2;
}

unint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance XPCListener()
{
  return XPCListener.debugDescription.getter();
}

uint64_t XPCListener.IncomingSessionRequest.withUnsafeAuditToken<A>(_:)(uint64_t (*a1)())
{
  return a1();
}

unint64_t lazy protocol witness table accessor for type XPCListener.InitializationOptions and conformance XPCListener.InitializationOptions()
{
  unint64_t result = lazy protocol witness table cache variable for type XPCListener.InitializationOptions and conformance XPCListener.InitializationOptions;
  if (!lazy protocol witness table cache variable for type XPCListener.InitializationOptions and conformance XPCListener.InitializationOptions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type XPCListener.InitializationOptions and conformance XPCListener.InitializationOptions);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type XPCListener.InitializationOptions and conformance XPCListener.InitializationOptions;
  if (!lazy protocol witness table cache variable for type XPCListener.InitializationOptions and conformance XPCListener.InitializationOptions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type XPCListener.InitializationOptions and conformance XPCListener.InitializationOptions);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type XPCListener.InitializationOptions and conformance XPCListener.InitializationOptions;
  if (!lazy protocol witness table cache variable for type XPCListener.InitializationOptions and conformance XPCListener.InitializationOptions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type XPCListener.InitializationOptions and conformance XPCListener.InitializationOptions);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type XPCListener.InitializationOptions and conformance XPCListener.InitializationOptions;
  if (!lazy protocol witness table cache variable for type XPCListener.InitializationOptions and conformance XPCListener.InitializationOptions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type XPCListener.InitializationOptions and conformance XPCListener.InitializationOptions);
  }
  return result;
}

uint64_t method lookup function for XPCListener(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCListener);
}

uint64_t dispatch thunk of XPCListener.__allocating_init(service:targetQueue:options:incomingSessionHandler:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of XPCListener.__allocating_init(targetQueue:options:incomingSessionHandler:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of XPCListener.activate()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of XPCListener.cancel()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

ValueMetadata *type metadata accessor for XPCListener.InitializationOptions()
{
  return &type metadata for XPCListener.InitializationOptions;
}

uint64_t method lookup function for XPCListener.IncomingSessionRequest(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCListener.IncomingSessionRequest);
}

uint64_t dispatch thunk of XPCListener.IncomingSessionRequest.accept(incomingMessageHandler:cancellationHandler:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of XPCListener.IncomingSessionRequest.accept<A>(incomingMessageHandler:cancellationHandler:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of XPCListener.IncomingSessionRequest.accept<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of XPCListener.IncomingSessionRequest.reject(reason:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for XPCListener.IncomingSessionRequest.Decision()
{
  return &type metadata for XPCListener.IncomingSessionRequest.Decision;
}

uint64_t dispatch thunk of XPCPeerHandler.handleIncomingRequest(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of XPCPeerHandler.handleCancellation(error:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t getEnumTagSinglePayload for XPCListener.IncomingSessionRequest.Decision(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for XPCListener.IncomingSessionRequest.Decision(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x20DA24844);
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

uint64_t getEnumTag for XPCListener.IncomingSessionRequest.Decision._Decision(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for XPCListener.IncomingSessionRequest.Decision._Decision(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for XPCListener.IncomingSessionRequest.Decision._Decision()
{
  return &type metadata for XPCListener.IncomingSessionRequest.Decision._Decision;
}

unint64_t lazy protocol witness table accessor for type XPCListener.IncomingSessionRequest.Decision._Decision and conformance XPCListener.IncomingSessionRequest.Decision._Decision()
{
  unint64_t result = lazy protocol witness table cache variable for type XPCListener.IncomingSessionRequest.Decision._Decision and conformance XPCListener.IncomingSessionRequest.Decision._Decision;
  if (!lazy protocol witness table cache variable for type XPCListener.IncomingSessionRequest.Decision._Decision and conformance XPCListener.IncomingSessionRequest.Decision._Decision)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type XPCListener.IncomingSessionRequest.Decision._Decision and conformance XPCListener.IncomingSessionRequest.Decision._Decision);
  }
  return result;
}

uint64_t partial apply for implicit closure #4 in implicit closure #3 in XPCListener.IncomingSessionRequest.accept<A>(_:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 24);
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  v6[0] = *(unsigned char *)a1;
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  return (*(uint64_t (**)(unsigned char *))(v2 + 32))(v6);
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned char v6[8];
  uint64_t v7;
  uint64_t v8;

  uint64_t v2 = *(void *)(v1 + 24);
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  v6[0] = *(unsigned char *)a1;
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  return (*(uint64_t (**)(unsigned char *))(v2 + 32))(v6);
}

uint64_t objectdestroy_61Tm()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in XPCListener.IncomingSessionRequest.accept<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 24) + 24))();
}

uint64_t objectdestroy_55Tm()
{
  uint64_t v1 = *(void *)(*(void *)(v0 + 16) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);

  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in XPCListener.IncomingSessionRequest.accept<A>(_:)(uint64_t *a1)
{
  uint64_t v2 = *(void *)(v1 + 24);
  uint64_t v4 = *a1;
  return (*(uint64_t (**)(uint64_t *))(v2 + 24))(&v4);
}

uint64_t _s3XPC12XPCRichErrorVIegn_ACytIegnr_TRTA_0(uint64_t a1)
{
  return thunk for @escaping @callee_guaranteed (@in_guaranteed XPCRichError) -> ()(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t protocol witness for SharableStorage.init() in conformance _XPCUnkeyedEncodingContainer.UnkeyedEncodingStorage@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = MEMORY[0x263F8EE78];
  *a1 = result;
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> _XPCUnkeyedEncodingContainer.encodeNil()()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void **)(v1 + 16);
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v1 + 16) = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2[2] + 1, 1, v2);
    *(void *)(v1 + 16) = v2;
  }
  unint64_t v5 = v2[2];
  unint64_t v4 = v2[3];
  if (v5 >= v4 >> 1)
  {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v4 > 1), v5 + 1, 1, v2);
    *(void *)(v1 + 16) = v2;
  }
  uint64_t v7 = &type metadata for NilPrimitive;
  uint64_t v8 = &protocol witness table for NilPrimitive;
  v2[2] = v5 + 1;
  outlined init with take of Encodable(&v6, (uint64_t)&v2[5 * v5 + 4]);
  swift_release();
}

uint64_t specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void *)(*(void *)(*(void *)(v2 + 32) + 16) + 16);
  v30[0] = 0x207865646E49;
  v30[1] = 0xE600000000000000;
  v27[0] = v6;
  v7._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(v2 + 16);
  uint64_t v9 = *(void *)(v3 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20DA2D050;
  *(void *)(inited + 56) = &type metadata for CodableIndexKey;
  *(void *)(inited + 64) = lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();
  uint64_t v11 = swift_allocObject();
  *(void *)(inited + 32) = v11;
  *(void *)(v11 + 16) = 0x207865646E49;
  *(void *)(v11 + 24) = 0xE600000000000000;
  *(void *)(v11 + 32) = v6;
  *(unsigned char *)(v11 + 40) = 0;
  v30[0] = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)((void *)inited);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v12 = v30[15];
  specialized static XPCEncoder.encode<A>(_:withCodingMetadata:)(a1, a2, v8, v9, (uint64_t)v30);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v12)
  {
    uint64_t v14 = *(void *)(v3 + 32);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)v30, (uint64_t)v27);
    uint64_t v15 = (void *)(v14 + 16);
    uint64_t v16 = *(void **)(v14 + 16);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v14 + 16) = v16;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v16 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v16[2] + 1, 1, v16);
      *uint64_t v15 = v16;
    }
    unint64_t v19 = v16[2];
    unint64_t v18 = v16[3];
    if (v19 >= v18 >> 1) {
      *uint64_t v15 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v18 > 1), v19 + 1, 1, v16);
    }
    uint64_t v20 = v28;
    uint64_t v21 = v29;
    uint64_t v22 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v27, v28);
    MEMORY[0x270FA5388](v22);
    uint64_t v24 = (char *)&v27[-1] - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v25 + 16))(v24);
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v19, (uint64_t)v24, (uint64_t *)(v14 + 16), v20, v21);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  }
  return result;
}

uint64_t specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(double a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *(void *)(*(void *)(*(void *)(v1 + 32) + 16) + 16);
  v28[0] = 0x207865646E49;
  v28[1] = 0xE600000000000000;
  v25[0] = v5;
  v6._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v3 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20DA2D050;
  *(void *)(inited + 56) = &type metadata for CodableIndexKey;
  *(void *)(inited + 64) = lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();
  uint64_t v10 = swift_allocObject();
  *(void *)(inited + 32) = v10;
  *(void *)(v10 + 16) = 0x207865646E49;
  *(void *)(v10 + 24) = 0xE600000000000000;
  *(void *)(v10 + 32) = v5;
  *(unsigned char *)(v10 + 40) = 0;
  v28[0] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)((void *)inited);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  specialized static XPCEncoder.encode<A>(_:withCodingMetadata:)(v7, v8, (uint64_t)v28, a1);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v2)
  {
    uint64_t v12 = *(void *)(v3 + 32);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)v28, (uint64_t)v25);
    uint64_t v13 = (void *)(v12 + 16);
    uint64_t v14 = *(void **)(v12 + 16);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v12 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v14[2] + 1, 1, v14);
      *uint64_t v13 = v14;
    }
    unint64_t v17 = v14[2];
    unint64_t v16 = v14[3];
    if (v17 >= v16 >> 1) {
      *uint64_t v13 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v16 > 1), v17 + 1, 1, v14);
    }
    uint64_t v18 = v26;
    uint64_t v19 = v27;
    uint64_t v20 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v25, v26);
    MEMORY[0x270FA5388](v20);
    uint64_t v22 = (char *)&v25[-1] - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v23 + 16))(v22);
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v17, (uint64_t)v22, (uint64_t *)(v12 + 16), v18, v19);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  }
  return result;
}

uint64_t specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(float a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *(void *)(*(void *)(*(void *)(v1 + 32) + 16) + 16);
  v28[0] = 0x207865646E49;
  v28[1] = 0xE600000000000000;
  v25[0] = v5;
  v6._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v3 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20DA2D050;
  *(void *)(inited + 56) = &type metadata for CodableIndexKey;
  *(void *)(inited + 64) = lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();
  uint64_t v10 = swift_allocObject();
  *(void *)(inited + 32) = v10;
  *(void *)(v10 + 16) = 0x207865646E49;
  *(void *)(v10 + 24) = 0xE600000000000000;
  *(void *)(v10 + 32) = v5;
  *(unsigned char *)(v10 + 40) = 0;
  v28[0] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)((void *)inited);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  specialized static XPCEncoder.encode<A>(_:withCodingMetadata:)(v7, v8, (uint64_t)v28, a1);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v2)
  {
    uint64_t v12 = *(void *)(v3 + 32);
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)v28, (uint64_t)v25);
    uint64_t v13 = (void *)(v12 + 16);
    uint64_t v14 = *(void **)(v12 + 16);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v12 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v14[2] + 1, 1, v14);
      *uint64_t v13 = v14;
    }
    unint64_t v17 = v14[2];
    unint64_t v16 = v14[3];
    if (v17 >= v16 >> 1) {
      *uint64_t v13 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v16 > 1), v17 + 1, 1, v14);
    }
    uint64_t v18 = v26;
    uint64_t v19 = v27;
    uint64_t v20 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v25, v26);
    MEMORY[0x270FA5388](v20);
    uint64_t v22 = (char *)&v25[-1] - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v23 + 16))(v22);
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v17, (uint64_t)v22, (uint64_t *)(v12 + 16), v18, v19);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  }
  return result;
}

uint64_t _XPCUnkeyedEncodingContainer.nestedContainer<A>(keyedBy:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(*(void *)(*(void *)(v0 + 32) + 16) + 16);
  v19[0] = 0x207865646E49;
  v19[1] = 0xE600000000000000;
  v3._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20DA2D050;
  *(void *)(inited + 56) = &type metadata for CodableIndexKey;
  *(void *)(inited + 64) = lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();
  uint64_t v7 = swift_allocObject();
  *(void *)(inited + 32) = v7;
  *(void *)(v7 + 16) = 0x207865646E49;
  *(void *)(v7 + 24) = 0xE600000000000000;
  *(void *)(v7 + 32) = v2;
  *(unsigned char *)(v7 + 40) = 0;
  v19[0] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)((void *)inited);
  uint64_t v8 = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = type metadata accessor for _XPCKeyedEncodingContainer();
  type metadata accessor for KeyedEncodingStorage();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  uint64_t v11 = _XPCKeyedEncodingContainer.__allocating_init(codingMetadata:storage:)(v8, v5, v10);
  uint64_t v12 = *(void *)(v1 + 32);
  uint64_t v13 = (void *)(v12 + 16);
  uint64_t v14 = *(void **)(v12 + 16);
  swift_retain();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v12 + 16) = v14;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v14[2] + 1, 1, v14);
    *uint64_t v13 = v14;
  }
  unint64_t v17 = v14[2];
  unint64_t v16 = v14[3];
  if (v17 >= v16 >> 1) {
    *uint64_t v13 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v16 > 1), v17 + 1, 1, v14);
  }
  v19[0] = v11;
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v17, (uint64_t)v19, (uint64_t *)(v12 + 16), v9, (uint64_t)&protocol witness table for _XPCKeyedEncodingContainer<A>);
  swift_release();
  v19[0] = v11;
  swift_getWitnessTable();
  return KeyedEncodingContainer.init<A>(_:)();
}

uint64_t _XPCUnkeyedEncodingContainer.nestedUnkeyedContainer()@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(*(void *)(*(void *)(v1 + 32) + 16) + 16);
  *(void *)&long long v21 = 0x207865646E49;
  *((void *)&v21 + 1) = 0xE600000000000000;
  uint64_t v24 = v4;
  v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20DA2D050;
  *(void *)(inited + 56) = &type metadata for CodableIndexKey;
  *(void *)(inited + 64) = lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();
  uint64_t v9 = swift_allocObject();
  *(void *)(inited + 32) = v9;
  *(void *)(v9 + 16) = 0x207865646E49;
  *(void *)(v9 + 24) = 0xE600000000000000;
  *(void *)(v9 + 32) = v4;
  *(unsigned char *)(v9 + 40) = 0;
  *(void *)&long long v21 = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)((void *)inited);
  uint64_t v10 = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  type metadata accessor for _XPCUnkeyedEncodingContainer.UnkeyedEncodingStorage();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = MEMORY[0x263F8EE78];
  uint64_t v12 = type metadata accessor for _XPCUnkeyedEncodingContainer();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v10;
  uint64_t v13[3] = v7;
  void v13[4] = v11;
  uint64_t v14 = *(void *)(v2 + 32);
  uint64_t v15 = *(void **)(v14 + 16);
  swift_retain();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v14 + 16) = v15;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v15 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v15[2] + 1, 1, v15);
    *(void *)(v14 + 16) = v15;
  }
  unint64_t v18 = v15[2];
  unint64_t v17 = v15[3];
  if (v18 >= v17 >> 1)
  {
    uint64_t v15 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v17 > 1), v18 + 1, 1, v15);
    *(void *)(v14 + 16) = v15;
  }
  uint64_t v22 = v12;
  uint64_t v23 = &protocol witness table for _XPCUnkeyedEncodingContainer;
  *(void *)&long long v21 = v13;
  void v15[2] = v18 + 1;
  outlined init with take of Encodable(&v21, (uint64_t)&v15[5 * v18 + 4]);
  swift_release();
  a1[3] = v12;
  uint64_t result = _s3XPC11_XPCEncoderCACs7EncoderAAWlTm_0(&lazy protocol witness table cache variable for type _XPCUnkeyedEncodingContainer and conformance _XPCUnkeyedEncodingContainer, v19, (void (*)(uint64_t))type metadata accessor for _XPCUnkeyedEncodingContainer);
  a1[4] = result;
  *a1 = v13;
  return result;
}

uint64_t _XPCUnkeyedEncodingContainer.superEncoder()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(*(void *)(*(void *)(v1 + 32) + 16) + 16);
  *(void *)&long long v19 = 0x207865646E49;
  *((void *)&v19 + 1) = 0xE600000000000000;
  uint64_t v22 = v4;
  v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CodingKey>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20DA2D050;
  *(void *)(inited + 56) = &type metadata for CodableIndexKey;
  *(void *)(inited + 64) = lazy protocol witness table accessor for type CodableIndexKey and conformance CodableIndexKey();
  uint64_t v9 = swift_allocObject();
  *(void *)(inited + 32) = v9;
  *(void *)(v9 + 16) = 0x207865646E49;
  *(void *)(v9 + 24) = 0xE600000000000000;
  *(void *)(v9 + 32) = v4;
  *(unsigned char *)(v9 + 40) = 0;
  *(void *)&long long v19 = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)((void *)inited);
  uint64_t v10 = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v11 = type metadata accessor for _XPCEncoder();
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 32) = 0u;
  *(_OWORD *)(v12 + 48) = 0u;
  *(void *)(v12 + 64) = 0;
  *(void *)(v12 + 16) = v10;
  *(void *)(v12 + 24) = v7;
  uint64_t v13 = *(void *)(v2 + 32);
  uint64_t v14 = *(void **)(v13 + 16);
  swift_retain();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v13 + 16) = v14;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v14[2] + 1, 1, v14);
    *(void *)(v13 + 16) = v14;
  }
  unint64_t v17 = v14[2];
  unint64_t v16 = v14[3];
  if (v17 >= v16 >> 1)
  {
    uint64_t v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v16 > 1), v17 + 1, 1, v14);
    *(void *)(v13 + 16) = v14;
  }
  uint64_t v20 = v11;
  long long v21 = &protocol witness table for _XPCEncoder;
  *(void *)&long long v19 = v12;
  void v14[2] = v17 + 1;
  outlined init with take of Encodable(&v19, (uint64_t)&v14[5 * v17 + 4]);
  swift_release();
  a1[3] = v11;
  uint64_t result = _s3XPC11_XPCEncoderCACs7EncoderAAWlTm_0(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCEncoder);
  a1[4] = result;
  *a1 = v12;
  return result;
}

uint64_t protocol witness for UnkeyedEncodingContainer.codingPath.getter in conformance _XPCUnkeyedEncodingContainer(uint64_t a1)
{
  return CodingContainerWithMetadata.codingPath.getter(a1, (uint64_t)&protocol witness table for _XPCUnkeyedEncodingContainer);
}

uint64_t protocol witness for UnkeyedEncodingContainer.count.getter in conformance _XPCUnkeyedEncodingContainer()
{
  return *(void *)(*(void *)(*(void *)(*(void *)v0 + 32) + 16) + 16);
}

void protocol witness for UnkeyedEncodingContainer.encodeNil() in conformance _XPCUnkeyedEncodingContainer()
{
}

uint64_t protocol witness for UnkeyedEncodingContainer.encode(_:) in conformance _XPCUnkeyedEncodingContainer(uint64_t a1, uint64_t a2)
{
  return specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1, a2);
}

uint64_t protocol witness for UnkeyedEncodingContainer.encode(_:) in conformance _XPCUnkeyedEncodingContainer(double a1)
{
  return specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1);
}

uint64_t protocol witness for UnkeyedEncodingContainer.encode(_:) in conformance _XPCUnkeyedEncodingContainer(float a1)
{
  return specialized _XPCUnkeyedEncodingContainer.encode<A>(_:)(a1);
}

uint64_t protocol witness for UnkeyedEncodingContainer.encode(_:) in conformance _XPCUnkeyedEncodingContainer()
{
  return UnkeyedEncodingContainer.encode(_:)();
}

{
  return UnkeyedEncodingContainer.encode(_:)();
}

uint64_t protocol witness for UnkeyedEncodingContainer.encodeConditional<A>(_:) in conformance _XPCUnkeyedEncodingContainer()
{
  return UnkeyedEncodingContainer.encodeConditional<A>(_:)();
}

uint64_t protocol witness for UnkeyedEncodingContainer.encode<A>(contentsOf:) in conformance _XPCUnkeyedEncodingContainer()
{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

{
  return UnkeyedEncodingContainer.encode<A>(contentsOf:)();
}

uint64_t protocol witness for UnkeyedEncodingContainer.nestedContainer<A>(keyedBy:) in conformance _XPCUnkeyedEncodingContainer()
{
  return _XPCUnkeyedEncodingContainer.nestedContainer<A>(keyedBy:)();
}

uint64_t protocol witness for UnkeyedEncodingContainer.nestedUnkeyedContainer() in conformance _XPCUnkeyedEncodingContainer@<X0>(void *a1@<X8>)
{
  return _XPCUnkeyedEncodingContainer.nestedUnkeyedContainer()(a1);
}

uint64_t protocol witness for UnkeyedEncodingContainer.superEncoder() in conformance _XPCUnkeyedEncodingContainer@<X0>(uint64_t *a1@<X8>)
{
  return _XPCUnkeyedEncodingContainer.superEncoder()(a1);
}

void *protocol witness for SharableStorageContainer.init(codingMetadata:storage:) in conformance _XPCUnkeyedEncodingContainer@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  uint64_t v7 = *a3;
  type metadata accessor for _XPCUnkeyedEncodingContainer();
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = v7;
  *a4 = result;
  return result;
}

void *protocol witness for SharableStorageContainer.init(codingMetadata:initialStorage:) in conformance _XPCUnkeyedEncodingContainer@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  uint64_t v7 = *a3;
  type metadata accessor for _XPCUnkeyedEncodingContainer();
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = v7;
  *a4 = result;
  return result;
}

uint64_t sub_20DA26C34()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 41, 7);
}

uint64_t specialized static XPCEncoder.encode<A>(_:withCodingMetadata:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v11 = type metadata accessor for _XPCEncoder();
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 32) = 0u;
  *(_OWORD *)(v12 + 48) = 0u;
  *(void *)(v12 + 64) = 0;
  *(void *)(v12 + 16) = a3;
  *(void *)(v12 + 24) = a4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) == 0)
  {
    uint64_t v26 = v11;
    uint64_t v27 = _s3XPC11_XPCEncoderCACs7EncoderAAWlTm_0(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCEncoder);
    *(void *)&long long v25 = v12;
    swift_retain();
    String.encode(to:)();
    if (v5)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
    goto LABEL_9;
  }
  uint64_t v23 = a1;
  uint64_t v24 = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  uint64_t v13 = MEMORY[0x263F8D310];
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v22 = 0;
    memset(v21, 0, sizeof(v21));
    outlined destroy of DecodingContainer?((uint64_t)v21, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    uint64_t v15 = type metadata accessor for EncodingError();
    swift_allocError();
    unint64_t v17 = v16;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    void v17[3] = v13;
    *unint64_t v17 = a1;
    v17[1] = a2;
    *(void *)&long long v25 = 0;
    *((void *)&v25 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v15 - 8) + 104))(v17, *MEMORY[0x263F8DCE0], v15);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v21, (uint64_t)&v25);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v25);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
  if (!v5)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v12 + 32, (uint64_t)&v25);
    if (v26)
    {
      swift_release();
      return outlined init with take of Encodable(&v25, a5);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v25, &demangling cache variable for type metadata for EncodingContainer?);
    uint64_t v18 = type metadata accessor for EncodingError();
    swift_allocError();
    uint64_t v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    v20[3] = MEMORY[0x263F8D310];
    *uint64_t v20 = a1;
    v20[1] = a2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v18 - 8) + 104))(v20, *MEMORY[0x263F8DCE0], v18);
    goto LABEL_12;
  }
  return swift_release();
}

uint64_t specialized static XPCEncoder.encode<A>(_:withCodingMetadata:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t v9 = type metadata accessor for _XPCEncoder();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 32) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(void *)(v10 + 64) = 0;
  *(void *)(v10 + 16) = a1;
  *(void *)(v10 + 24) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) == 0)
  {
    uint64_t v23 = v9;
    uint64_t v24 = _s3XPC11_XPCEncoderCACs7EncoderAAWlTm_0(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCEncoder);
    *(void *)&long long v22 = v10;
    swift_retain();
    Double.encode(to:)();
    if (v4)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    goto LABEL_9;
  }
  double v21 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  uint64_t v11 = MEMORY[0x263F8D538];
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v20 = 0;
    memset(v19, 0, sizeof(v19));
    outlined destroy of DecodingContainer?((uint64_t)v19, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    uint64_t v13 = type metadata accessor for EncodingError();
    swift_allocError();
    uint64_t v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(void *)(v15 + 24) = v11;
    *(double *)uint64_t v15 = a4;
    *(void *)&long long v22 = 0;
    *((void *)&v22 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, *MEMORY[0x263F8DCE0], v13);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v19, (uint64_t)&v22);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
  if (!v4)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v10 + 32, (uint64_t)&v22);
    if (v23)
    {
      swift_release();
      return outlined init with take of Encodable(&v22, a3);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v22, &demangling cache variable for type metadata for EncodingContainer?);
    uint64_t v16 = type metadata accessor for EncodingError();
    swift_allocError();
    uint64_t v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(void *)(v18 + 24) = MEMORY[0x263F8D538];
    *(double *)uint64_t v18 = a4;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x263F8DCE0], v16);
    goto LABEL_12;
  }
  return swift_release();
}

uint64_t specialized static XPCEncoder.encode<A>(_:withCodingMetadata:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, float a4@<S0>)
{
  uint64_t v9 = type metadata accessor for _XPCEncoder();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 32) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(void *)(v10 + 64) = 0;
  *(void *)(v10 + 16) = a1;
  *(void *)(v10 + 24) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) == 0)
  {
    uint64_t v23 = v9;
    uint64_t v24 = _s3XPC11_XPCEncoderCACs7EncoderAAWlTm_0(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCEncoder);
    *(void *)&long long v22 = v10;
    swift_retain();
    Float.encode(to:)();
    if (v4)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    goto LABEL_9;
  }
  float v21 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  uint64_t v11 = MEMORY[0x263F8D5C8];
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v20 = 0;
    memset(v19, 0, sizeof(v19));
    outlined destroy of DecodingContainer?((uint64_t)v19, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    uint64_t v13 = type metadata accessor for EncodingError();
    swift_allocError();
    uint64_t v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(void *)(v15 + 24) = v11;
    *(float *)uint64_t v15 = a4;
    *(void *)&long long v22 = 0;
    *((void *)&v22 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, *MEMORY[0x263F8DCE0], v13);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v19, (uint64_t)&v22);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
  if (!v4)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v10 + 32, (uint64_t)&v22);
    if (v23)
    {
      swift_release();
      return outlined init with take of Encodable(&v22, a3);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v22, &demangling cache variable for type metadata for EncodingContainer?);
    uint64_t v16 = type metadata accessor for EncodingError();
    swift_allocError();
    uint64_t v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(void *)(v18 + 24) = MEMORY[0x263F8D5C8];
    *(float *)uint64_t v18 = a4;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x263F8DCE0], v16);
    goto LABEL_12;
  }
  return swift_release();
}

uint64_t specialized static XPCEncoder.encode<A>(_:withCodingMetadata:)@<X0>(__int16 a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v9 = type metadata accessor for _XPCEncoder();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 32) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(void *)(v10 + 64) = 0;
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) == 0)
  {
    uint64_t v23 = v9;
    uint64_t v24 = _s3XPC11_XPCEncoderCACs7EncoderAAWlTm_0(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCEncoder);
    *(void *)&long long v22 = v10;
    swift_retain();
    Int16.encode(to:)();
    if (v4)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    goto LABEL_9;
  }
  __int16 v21 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  uint64_t v11 = MEMORY[0x263F8E4F0];
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v20 = 0;
    memset(v19, 0, sizeof(v19));
    outlined destroy of DecodingContainer?((uint64_t)v19, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    uint64_t v13 = type metadata accessor for EncodingError();
    swift_allocError();
    uint64_t v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(void *)(v15 + 24) = v11;
    *(_WORD *)uint64_t v15 = a1;
    *(void *)&long long v22 = 0;
    *((void *)&v22 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, *MEMORY[0x263F8DCE0], v13);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v19, (uint64_t)&v22);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
  if (!v4)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v10 + 32, (uint64_t)&v22);
    if (v23)
    {
      swift_release();
      return outlined init with take of Encodable(&v22, a4);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v22, &demangling cache variable for type metadata for EncodingContainer?);
    uint64_t v16 = type metadata accessor for EncodingError();
    swift_allocError();
    uint64_t v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(void *)(v18 + 24) = MEMORY[0x263F8E4F0];
    *(_WORD *)uint64_t v18 = a1;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x263F8DCE0], v16);
    goto LABEL_12;
  }
  return swift_release();
}

{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  long long v19[2];
  uint64_t v20;
  __int16 v21;
  long long v22;
  uint64_t v23;
  uint64_t v24;

  uint64_t v9 = type metadata accessor for _XPCEncoder();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 32) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(void *)(v10 + 64) = 0;
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) == 0)
  {
    uint64_t v23 = v9;
    uint64_t v24 = _s3XPC11_XPCEncoderCACs7EncoderAAWlTm_0(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCEncoder);
    *(void *)&long long v22 = v10;
    swift_retain();
    UInt16.encode(to:)();
    if (v4)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    goto LABEL_9;
  }
  __int16 v21 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  uint64_t v11 = MEMORY[0x263F8E888];
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v20 = 0;
    memset(v19, 0, sizeof(v19));
    outlined destroy of DecodingContainer?((uint64_t)v19, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    uint64_t v13 = type metadata accessor for EncodingError();
    swift_allocError();
    uint64_t v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(void *)(v15 + 24) = v11;
    *(_WORD *)uint64_t v15 = a1;
    *(void *)&long long v22 = 0;
    *((void *)&v22 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, *MEMORY[0x263F8DCE0], v13);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v19, (uint64_t)&v22);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
  if (!v4)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v10 + 32, (uint64_t)&v22);
    if (v23)
    {
      swift_release();
      return outlined init with take of Encodable(&v22, a4);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v22, &demangling cache variable for type metadata for EncodingContainer?);
    uint64_t v16 = type metadata accessor for EncodingError();
    swift_allocError();
    uint64_t v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(void *)(v18 + 24) = MEMORY[0x263F8E888];
    *(_WORD *)uint64_t v18 = a1;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x263F8DCE0], v16);
    goto LABEL_12;
  }
  return swift_release();
}

uint64_t specialized static XPCEncoder.encode<A>(_:withCodingMetadata:)@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v9 = type metadata accessor for _XPCEncoder();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 32) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(void *)(v10 + 64) = 0;
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) == 0)
  {
    uint64_t v23 = v9;
    uint64_t v24 = _s3XPC11_XPCEncoderCACs7EncoderAAWlTm_0(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCEncoder);
    *(void *)&long long v22 = v10;
    swift_retain();
    Int32.encode(to:)();
    if (v4)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    goto LABEL_9;
  }
  int v21 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  uint64_t v11 = MEMORY[0x263F8E548];
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v20 = 0;
    memset(v19, 0, sizeof(v19));
    outlined destroy of DecodingContainer?((uint64_t)v19, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    uint64_t v13 = type metadata accessor for EncodingError();
    swift_allocError();
    uint64_t v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(void *)(v15 + 24) = v11;
    *(_DWORD *)uint64_t v15 = a1;
    *(void *)&long long v22 = 0;
    *((void *)&v22 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, *MEMORY[0x263F8DCE0], v13);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v19, (uint64_t)&v22);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
  if (!v4)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v10 + 32, (uint64_t)&v22);
    if (v23)
    {
      swift_release();
      return outlined init with take of Encodable(&v22, a4);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v22, &demangling cache variable for type metadata for EncodingContainer?);
    uint64_t v16 = type metadata accessor for EncodingError();
    swift_allocError();
    uint64_t v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(void *)(v18 + 24) = MEMORY[0x263F8E548];
    *(_DWORD *)uint64_t v18 = a1;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x263F8DCE0], v16);
    goto LABEL_12;
  }
  return swift_release();
}

{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  long long v19[2];
  uint64_t v20;
  int v21;
  long long v22;
  uint64_t v23;
  uint64_t v24;

  uint64_t v9 = type metadata accessor for _XPCEncoder();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 32) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(void *)(v10 + 64) = 0;
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((specialized static XPCCodableObjectRepresentableCache.checkConformance<A>(forType:)() & 1) == 0)
  {
    uint64_t v23 = v9;
    uint64_t v24 = _s3XPC11_XPCEncoderCACs7EncoderAAWlTm_0(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, 255, (void (*)(uint64_t))type metadata accessor for _XPCEncoder);
    *(void *)&long long v22 = v10;
    swift_retain();
    UInt32.encode(to:)();
    if (v4)
    {
      swift_release();
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
    goto LABEL_9;
  }
  int v21 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
  uint64_t v11 = MEMORY[0x263F8E8F8];
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v20 = 0;
    memset(v19, 0, sizeof(v19));
    outlined destroy of DecodingContainer?((uint64_t)v19, (uint64_t *)&demangling cache variable for type metadata for XPCCodableObjectRepresentable?);
    uint64_t v13 = type metadata accessor for EncodingError();
    swift_allocError();
    uint64_t v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(void *)(v15 + 24) = v11;
    *(_DWORD *)uint64_t v15 = a1;
    *(void *)&long long v22 = 0;
    *((void *)&v22 + 1) = 0xE000000000000000;
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(49);
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, *MEMORY[0x263F8DCE0], v13);
LABEL_12:
    swift_willThrow();
    return swift_release();
  }
  outlined init with take of Encodable(v19, (uint64_t)&v22);
  _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(&v22);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
  if (!v4)
  {
LABEL_9:
    swift_beginAccess();
    outlined init with copy of EncodingContainer?(v10 + 32, (uint64_t)&v22);
    if (v23)
    {
      swift_release();
      return outlined init with take of Encodable(&v22, a4);
    }
    outlined destroy of DecodingContainer?((uint64_t)&v22, &demangling cache variable for type metadata for EncodingContainer?);
    uint64_t v16 = type metadata accessor for EncodingError();
    swift_allocError();
    uint64_t v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    *(void *)(v18 + 24) = MEMORY[0x263F8E8F8];
    *(_DWORD *)uint64_t v18 = a1;
    swift_bridgeObjectRetain();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x263F8DCE0], v16);
    goto LABEL_12;
  }
  return swift_release();
}

uint64_t dispatch thunk of SharableStorageContainer.storage.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of SharableStorageContainer.init(codingMetadata:storage:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t dispatch thunk of SharableStorageContainer.init(codingMetadata:initialStorage:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

uint64_t dispatch thunk of SharableStorage.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t XPCEncoder.__allocating_init(userInfo:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t XPCEncoder.init(userInfo:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t implicit closure #1 in static XPCEncoder.encode<A>(_:withCodingMetadata:)()
{
  _StringGuts.grow(_:)(49);
  v0._countAndFlagsBits = 0x6465746365707845;
  v0._object = (void *)0xEE00206570797420;
  String.append(_:)(v0);
  v1._countAndFlagsBits = _typeName(_:qualified:)();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  v2._object = (void *)0x800000020DA32590;
  v2._countAndFlagsBits = 0xD000000000000021;
  String.append(_:)(v2);
  return 0;
}

uint64_t XPCEncoder.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t XPCEncoder.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t _XPCEncoder.encode(to:)(uint64_t a1)
{
  swift_beginAccess();
  outlined init with copy of EncodingContainer?(v1 + 32, (uint64_t)&v6);
  if (!v7) {
    return outlined destroy of DecodingContainer?((uint64_t)&v6, &demangling cache variable for type metadata for EncodingContainer?);
  }
  outlined init with take of Encodable(&v6, (uint64_t)v8);
  uint64_t v3 = v9;
  uint64_t v4 = v10;
  __swift_project_boxed_opaque_existential_1(v8, v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(a1, v3, v4);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t _XPCEncoder.encodeAsXPCCodableObjectRepresentable(_:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = a1[3];
  uint64_t v5 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v5 + 16))(v18, v4, v5);
  uint64_t v6 = v18[0];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  swift_getDynamicType();
  uint64_t v7 = (*(uint64_t (**)(void))(a1[4] + 24))();
  Swift::UInt v8 = MEMORY[0x2105634B0](v6);
  LOBYTE(v5) = specialized Set.contains(_:)(v8, v7);
  swift_bridgeObjectRelease();
  if (v5)
  {
    void v18[6] = v6;
    v18[3] = type metadata accessor for _XPCEncoder();
    void v18[4] = _s3XPC11_XPCEncoderCACs7EncoderAAWlTm_1(&lazy protocol witness table cache variable for type _XPCEncoder and conformance _XPCEncoder, v9, (void (*)(uint64_t))type metadata accessor for _XPCEncoder);
    v18[0] = v2;
    swift_retain();
    XPCCodableObject.encode(to:)(v18);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  }
  else
  {
    uint64_t v10 = type metadata accessor for EncodingError();
    swift_allocError();
    uint64_t v12 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Any, EncodingError.Context));
    uint64_t v12[3] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for XPCCodableObjectRepresentable);
    uint64_t v13 = swift_allocObject();
    *uint64_t v12 = v13;
    outlined init with copy of XPCCodableObjectRepresentable((uint64_t)a1, v13 + 16);
    v18[0] = 0;
    v18[1] = 0xE000000000000000;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    _StringGuts.grow(_:)(62);
    v14._object = (void *)0x800000020DA32540;
    v14._countAndFlagsBits = 0xD00000000000002CLL;
    String.append(_:)(v14);
    _print_unlocked<A, B>(_:_:)();
    v15._countAndFlagsBits = 0x6F206562206F7420;
    v15._object = (void *)0xEE0020666F20656ELL;
    String.append(_:)(v15);
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    swift_getDynamicType();
    (*(void (**)(void))(a1[4] + 24))();
    v16._countAndFlagsBits = Set.description.getter();
    String.append(_:)(v16);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v10 - 8) + 104))(v12, *MEMORY[0x263F8DCE0], v10);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_willThrow();
  }
  return swift_unknownObjectRelease();
}

uint64_t protocol witness for EncodingContainer.encode(to:) in conformance _XPCEncoder(uint64_t a1)
{
  return _XPCEncoder.encode(to:)(a1);
}

uint64_t protocol witness for static CodingContainer.wireType.getter in conformance _XPCEncoder()
{
  return 19;
}

uint64_t method lookup function for XPCEncoder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for XPCEncoder);
}

uint64_t dispatch thunk of XPCEncoder.__allocating_init(userInfo:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of XPCEncoder.encode<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t sub_20DA29CB0()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t partial apply for implicit closure #1 in static XPCEncoder.encode<A>(_:withCodingMetadata:)()
{
  return implicit closure #1 in static XPCEncoder.encode<A>(_:withCodingMetadata:)();
}

uint64_t specialized String.withCString<A>(_:)(uint64_t (*a1)(void *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0 || !(a4 & 0x2000000000000000 | a3 & 0x1000000000000000)) {
    return _StringGuts._slowWithCString<A>(_:)();
  }
  if ((a4 & 0x2000000000000000) != 0)
  {
    v7[0] = a3;
    v7[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v5 = v7;
  }
  else if ((a3 & 0x1000000000000000) != 0)
  {
    uint64_t v5 = (void *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    uint64_t v5 = (void *)_StringObject.sharedUTF8.getter();
  }
  return a1(v5);
}

uint64_t thunk for @escaping @callee_guaranteed () -> ()(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

double XPCReceivedMessage.handoffReply(to:_:)@<D0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(v3 + 8);
  void v8[4] = a1;
  void v8[5] = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = thunk for @escaping @callee_guaranteed () -> ();
  void v8[3] = &block_descriptor_4;
  uint64_t v6 = _Block_copy(v8);
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  xpc_dictionary_handoff_reply();
  _Block_release(v6);
  swift_unknownObjectRelease();
  *(unsigned char *)(v5 + 16) = 0;
  double result = 0.0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(void *)(a3 + 32) = 0;
  return result;
}

uint64_t _sSRsRi_zrlE17withMemoryRebound2to_qd_1_qd__m_qd_1_SRyqd__Gqd_0_YKXEtqd_0_YKs5ErrorRd_0_Ri_d__Ri_d_1_r1_lFSRyxGq0_q_Ri_zRi0_zRi__Ri0__Ri_0_Ri0_0_r1_lys4Int8VsAD_pqd_1_Isgyrzr_SRys5UInt8VGqd_1_sAD_pAIRszAGRsd__sAD_pRsd_0_Ri_d_1_r_1_lIetMgyrzo_Tpq5SSSg_Tg507_sSRys4f5VGxs5E36_pIgyrzo_ACxsAD_pIegyrzr_lTRSSSg_TG5SRyAGGAKsAD_pIgyrzo_Tf1cn_n(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t result = a3();
  if (!v3) {
    return v5;
  }
  return result;
}

void *assignWithCopy for XPCReceivedMessage(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for XPCReceivedMessage(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

double partial apply for specialized closure #1 in _StringGuts.withCString<A>(_:)@<D0>(_OWORD *a1@<X8>)
{
  (*(void (**)(long long *__return_ptr))(v1 + 16))(&v5);
  if (!v2)
  {
    double result = *(double *)&v5;
    *a1 = v5;
  }
  return result;
}

Swift::Bool __swiftcall _XPCSingleValueDecodingContainer.decodeNil()()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = v1[4];
  uint64_t v3 = v1[5] >> 1;
  if (__OFSUB__(v3, v2))
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = v1[6];
    if (v4 >= v3 - v2) {
      return 0;
    }
    uint64_t v5 = v2 + v4;
    if (!__OFADD__(v2, v4))
    {
      if (v5 < v2 || v5 >= v3) {
        goto LABEL_14;
      }
      if (*(unsigned char *)(v1[3] + v5) == 1)
      {
        v1[6] = v4 + 1;
        return 1;
      }
      return 0;
    }
  }
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

float specialized _XPCSingleValueDecodingContainer.decode<A>(_:)()
{
  uint64_t v2 = MEMORY[0x263F8D5C8];
  uint64_t v3 = swift_conformsToProtocol2();
  if (!v3)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v6 = v0[2];
  uint64_t v7 = *(void *)(v3 + 8);
  Swift::UInt v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16);
  uint64_t v14 = v2;
  uint64_t v15 = v3;
  __swift_allocate_boxed_opaque_existential_1(&v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v8(v5, v4, v6, v2, v7);
  if (v1)
  {
    __swift_deallocate_boxed_opaque_existential_1((uint64_t)&v12);
    return result;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingPrimitive);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    uint64_t v12 = 0;
    uint64_t v13 = 0xE000000000000000;
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRelease();
    uint64_t v12 = 0xD000000000000016;
    uint64_t v13 = 0x800000020DA326D0;
    v10._countAndFlagsBits = _typeName(_:qualified:)();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    __XPC_INTERNAL_CRASH__(_:file:line:)(v12, v13);
  }
  return v11;
}

uint64_t protocol witness for SingleValueDecodingContainer.codingPath.getter in conformance _XPCSingleValueDecodingContainer(uint64_t a1)
{
  return CodingContainerWithMetadata.codingPath.getter(a1, (uint64_t)&protocol witness table for _XPCSingleValueDecodingContainer);
}

BOOL protocol witness for SingleValueDecodingContainer.decodeNil() in conformance _XPCSingleValueDecodingContainer()
{
  return _XPCSingleValueDecodingContainer.decodeNil()();
}

float protocol witness for SingleValueDecodingContainer.decode(_:) in conformance _XPCSingleValueDecodingContainer()
{
  return specialized _XPCSingleValueDecodingContainer.decode<A>(_:)();
}

void *protocol witness for DecodingContainer.init(codingMetadata:buffer:) in conformance _XPCSingleValueDecodingContainer@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  type metadata accessor for _XPCSingleValueDecodingContainer();
  float result = (void *)swift_allocObject();
  result[3] = a1;
  result[4] = a2;
  result[2] = a3;
  *a4 = result;
  return result;
}

uint64_t protocol witness for CodingContainerWithMetadata.codingMetadata.getter in conformance _XPCSingleValueDecodingContainer()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    JUMPOUT(0x210563200);
  }
  return result;
}

uint64_t EncodingBuffer.__allocating_init(bytes:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t key path setter for EncodingBuffer.bytes : EncodingBuffer(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 16) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t EncodingBuffer.bytes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t EncodingBuffer.bytes.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*EncodingBuffer.bytes.modify())()
{
  return static XPCSession.InitializationOptions.privileged.modify;
}

uint64_t EncodingBuffer.init(bytes:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return v1;
}

Swift::Void __swiftcall EncodingBuffer.append(_:)(Swift::UInt8 a1)
{
  uint64_t v3 = (char **)(v1 + 16);
  swift_beginAccess();
  uint64_t v4 = *(char **)(v1 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v1 + 16) = v4;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v4 + 2) + 1, 1, v4);
    *uint64_t v3 = v4;
  }
  unint64_t v7 = *((void *)v4 + 2);
  unint64_t v6 = *((void *)v4 + 3);
  if (v7 >= v6 >> 1)
  {
    uint64_t v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v6 > 1), v7 + 1, 1, v4);
    *uint64_t v3 = v4;
  }
  *((void *)v4 + 2) = v7 + 1;
  v4[v7 + 32] = a1;
}

uint64_t EncodingBuffer.append(_:)(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  return specialized Array.append<A>(contentsOf:)(a1, a2, v4);
}

Swift::Void __swiftcall EncodingBuffer.append(_:)(Swift::OpaquePointer a1)
{
  swift_beginAccess();
  uint64_t v1 = swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)(v1);
}

uint64_t EncodingBuffer.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

char *specialized UnsafeBufferPointer._copyContents(initializing:)(void *a1, int64_t a2, char *__src, int64_t a4)
{
  uint64_t v4 = __src;
  if (a4 && a2)
  {
    if (a4 >= a2) {
      size_t v5 = a2;
    }
    else {
      size_t v5 = a4;
    }
    memcpy(a1, __src, v5);
    v4 += v5;
  }
  return v4;
}

uint64_t sub_20DA2B508@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  *a2 = *(void *)(v3 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t method lookup function for EncodingBuffer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for EncodingBuffer);
}

uint64_t dispatch thunk of EncodingBuffer.bytes.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t dispatch thunk of EncodingBuffer.bytes.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of EncodingBuffer.bytes.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of EncodingBuffer.__allocating_init(bytes:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of EncodingBuffer.append(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of EncodingBuffer.appendSized(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t Array.init()()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t dispatch thunk of BinaryFloatingPoint.init<A>(exactly:)()
{
  return MEMORY[0x270F9CFF8]();
}

uint64_t BinaryFloatingPoint.init<A>(_:)()
{
  return MEMORY[0x270F9D010]();
}

uint64_t dispatch thunk of Encodable.encode(to:)()
{
  return MEMORY[0x270F9D220]();
}

uint64_t dispatch thunk of FloatingPoint.init<A>(exactly:)()
{
  return MEMORY[0x270F9D2C0]();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x270F9D318]();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x270F9D478]();
}

uint64_t dispatch thunk of static Comparable.> infix(_:_:)()
{
  return MEMORY[0x270F9D480]();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return MEMORY[0x270F9D488]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x270F9D598]();
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x270F9D620]();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t String.init(from:)()
{
  return MEMORY[0x270F9D700]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.encode(to:)()
{
  return MEMORY[0x270F9D7A0]();
}

uint64_t String.init(cString:)()
{
  return MEMORY[0x270F9D7C0]();
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

uint64_t String.init<A>(_:radix:uppercase:)()
{
  return MEMORY[0x270F9D8A8]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t Sequence.compactMap<A>(_:)()
{
  return MEMORY[0x270F9D938]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x270F9DBB8]();
}

Swift::Void __swiftcall Array.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t Array.append(_:)()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t Bool.init(from:)()
{
  return MEMORY[0x270F9DD38]();
}

uint64_t Bool.encode(to:)()
{
  return MEMORY[0x270F9DD40]();
}

uint64_t Double.init(from:)()
{
  return MEMORY[0x270F9DD88]();
}

uint64_t Double.encode(to:)()
{
  return MEMORY[0x270F9DDA8]();
}

uint64_t dispatch thunk of Decodable.init(from:)()
{
  return MEMORY[0x270F9DDF0]();
}

uint64_t Float.init(from:)()
{
  return MEMORY[0x270F9DE30]();
}

uint64_t Float.encode(to:)()
{
  return MEMORY[0x270F9DE50]();
}

uint64_t Set.description.getter()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t Int.encode(to:)()
{
  return MEMORY[0x270F9E000]();
}

uint64_t dispatch thunk of Numeric.init<A>(exactly:)()
{
  return MEMORY[0x270F9E028]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t UInt.encode(to:)()
{
  return MEMORY[0x270F9E520]();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)()
{
  return MEMORY[0x270F9E5B8]();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(exactly:)()
{
  return MEMORY[0x270F9E638]();
}

uint64_t dispatch thunk of BinaryInteger._lowWord.getter()
{
  return MEMORY[0x270F9E640]();
}

uint64_t dispatch thunk of BinaryInteger.bitWidth.getter()
{
  return MEMORY[0x270F9E648]();
}

uint64_t dispatch thunk of static BinaryInteger.isSigned.getter()
{
  return MEMORY[0x270F9E650]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9E970]();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return MEMORY[0x270F9E988]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t StaticString.description.getter()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t EncodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return MEMORY[0x270F9EAA0]();
}

uint64_t type metadata accessor for EncodingError()
{
  return MEMORY[0x270F9EAB8]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t CodingUserInfoKey.init(rawValue:)()
{
  return MEMORY[0x270F9EDE8]();
}

uint64_t type metadata accessor for CodingUserInfoKey()
{
  return MEMORY[0x270F9EDF8]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x270F9F080]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x270F9F098]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t KeyedDecodingContainer.init<A>(_:)()
{
  return MEMORY[0x270F9F380]();
}

uint64_t KeyedEncodingContainer.init<A>(_:)()
{
  return MEMORY[0x270F9F4B0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t UnkeyedDecodingContainer.decodeIfPresent(_:)()
{
  return MEMORY[0x270F9F5B0]();
}

{
  return MEMORY[0x270F9F5B8]();
}

{
  return MEMORY[0x270F9F5C0]();
}

{
  return MEMORY[0x270F9F5C8]();
}

{
  return MEMORY[0x270F9F5D0]();
}

{
  return MEMORY[0x270F9F5E0]();
}

{
  return MEMORY[0x270F9F5E8]();
}

uint64_t UnkeyedDecodingContainer.decodeIfPresent<A>(_:)()
{
  return MEMORY[0x270F9F5D8]();
}

uint64_t UnkeyedDecodingContainer.decode(_:)()
{
  return MEMORY[0x270F9F5F0]();
}

{
  return MEMORY[0x270F9F5F8]();
}

uint64_t UnkeyedEncodingContainer.encodeConditional<A>(_:)()
{
  return MEMORY[0x270F9F688]();
}

uint64_t UnkeyedEncodingContainer.encode<A>(contentsOf:)()
{
  return MEMORY[0x270F9F690]();
}

{
  return MEMORY[0x270F9F698]();
}

{
  return MEMORY[0x270F9F6A0]();
}

{
  return MEMORY[0x270F9F6A8]();
}

{
  return MEMORY[0x270F9F6B0]();
}

{
  return MEMORY[0x270F9F6B8]();
}

{
  return MEMORY[0x270F9F6C0]();
}

{
  return MEMORY[0x270F9F6C8]();
}

{
  return MEMORY[0x270F9F6D0]();
}

{
  return MEMORY[0x270F9F6D8]();
}

{
  return MEMORY[0x270F9F6E0]();
}

{
  return MEMORY[0x270F9F6E8]();
}

{
  return MEMORY[0x270F9F6F0]();
}

{
  return MEMORY[0x270F9F6F8]();
}

{
  return MEMORY[0x270F9F700]();
}

{
  return MEMORY[0x270F9F708]();
}

{
  return MEMORY[0x270F9F710]();
}

uint64_t UnkeyedEncodingContainer.encode(_:)()
{
  return MEMORY[0x270F9F718]();
}

{
  return MEMORY[0x270F9F720]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x270F9F770]();
}

{
  return MEMORY[0x270F9F778]();
}

uint64_t dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)()
{
  return MEMORY[0x270F9F7B0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode(_:)()
{
  return MEMORY[0x270F9F808]();
}

uint64_t SingleValueDecodingContainer.decode(_:)()
{
  return MEMORY[0x270F9F860]();
}

{
  return MEMORY[0x270F9F868]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode(_:)()
{
  return MEMORY[0x270F9F898]();
}

uint64_t SingleValueEncodingContainer.encode(_:)()
{
  return MEMORY[0x270F9F8F8]();
}

{
  return MEMORY[0x270F9F900]();
}

uint64_t KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F960]();
}

{
  return MEMORY[0x270F9F968]();
}

{
  return MEMORY[0x270F9F970]();
}

{
  return MEMORY[0x270F9F978]();
}

{
  return MEMORY[0x270F9F980]();
}

{
  return MEMORY[0x270F9F990]();
}

{
  return MEMORY[0x270F9F998]();
}

uint64_t KeyedDecodingContainerProtocol.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x270F9F988]();
}

uint64_t KeyedDecodingContainerProtocol.decode(_:forKey:)()
{
  return MEMORY[0x270F9F9A0]();
}

{
  return MEMORY[0x270F9F9A8]();
}

uint64_t KeyedEncodingContainerProtocol.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F9B0]();
}

{
  return MEMORY[0x270F9F9B8]();
}

uint64_t KeyedEncodingContainerProtocol.encodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x270F9F9D8]();
}

uint64_t KeyedEncodingContainerProtocol.encodeConditional<A>(_:forKey:)()
{
  return MEMORY[0x270F9FA00]();
}

uint64_t dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)()
{
  return MEMORY[0x270F9FA80]();
}

uint64_t Int8.encode(to:)()
{
  return MEMORY[0x270F9FAC8]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t Int16.encode(to:)()
{
  return MEMORY[0x270F9FB58]();
}

uint64_t Int32.encode(to:)()
{
  return MEMORY[0x270F9FB60]();
}

uint64_t Int64.encode(to:)()
{
  return MEMORY[0x270F9FB68]();
}

uint64_t UInt8.encode(to:)()
{
  return MEMORY[0x270F9FC18]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x270F9FC40]();
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

uint64_t type metadata accessor for Result()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t UInt16.encode(to:)()
{
  return MEMORY[0x270F9FD10]();
}

uint64_t UInt32.encode(to:)()
{
  return MEMORY[0x270F9FD18]();
}

uint64_t UInt64.encode(to:)()
{
  return MEMORY[0x270F9FD28]();
}

uint64_t dispatch thunk of Decoder.codingPath.getter()
{
  return MEMORY[0x270F9FD50]();
}

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t dispatch thunk of Decoder.userInfo.getter()
{
  return MEMORY[0x270F9FD68]();
}

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t dispatch thunk of Encoder.userInfo.getter()
{
  return MEMORY[0x270F9FD90]();
}

uint64_t dispatch thunk of CodingKey.stringValue.getter()
{
  return MEMORY[0x270FA0090]();
}

uint64_t dispatch thunk of CodingKey.init(stringValue:)()
{
  return MEMORY[0x270FA0098]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x270FA0128]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _dyld_register_for_bulk_image_loads()
{
  return MEMORY[0x270ED7FD8]();
}

uint64_t _xpc_session_create_from_connection_4SWIFT()
{
  return MEMORY[0x270ED8430]();
}

uint64_t _xpc_session_extract_connection_4SWIFT()
{
  return MEMORY[0x270ED8438]();
}

uint64_t _xpc_session_get_peer_audit_token_4SWIFT()
{
  return MEMORY[0x270ED8440]();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
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

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x270FA0480]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x270EDBD10](xarray, applier);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDBD20]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

xpc_object_t xpc_array_get_dictionary(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x270EDBD58](xarray, index);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x270EDBD70](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x270EDBD88](xarray, index);
}

void xpc_array_set_connection(xpc_object_t xarray, size_t index, xpc_connection_t connection)
{
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x270EDBDD8](value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x270EDBDE0](xBOOL);
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDBF20](object);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x270EDBFE8](xdict, applier);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

uint64_t xpc_dictionary_expects_reply()
{
  return MEMORY[0x270EDC030]();
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC040](xdict, key);
}

uint64_t xpc_dictionary_get_audit_token()
{
  return MEMORY[0x270EDC048]();
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x270EDC058](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC078](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

uint64_t xpc_dictionary_handoff_reply()
{
  return MEMORY[0x270EDC0D0]();
}

uint64_t xpc_dictionary_send_reply_4SWIFT()
{
  return MEMORY[0x270EDC0E0]();
}

void xpc_dictionary_set_connection(xpc_object_t xdict, const char *key, xpc_connection_t connection)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x270EDC168](value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  MEMORY[0x270EDC170](xdouble);
  return result;
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x270EDC190](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

size_t xpc_hash(xpc_object_t object)
{
  return MEMORY[0x270EDC208](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x270EDC218](xint);
}

BOOL xpc_listener_activate(xpc_listener_t listener, xpc_rich_error_t *error_out)
{
  return MEMORY[0x270EDC228](listener, error_out);
}

void xpc_listener_cancel(xpc_listener_t listener)
{
}

char *__cdecl xpc_listener_copy_description(xpc_listener_t listener)
{
  return (char *)MEMORY[0x270EDC238](listener);
}

xpc_listener_t xpc_listener_create(const char *service, dispatch_queue_t target_queue, xpc_listener_create_flags_t flags, xpc_listener_incoming_session_handler_t incoming_session_handler, xpc_rich_error_t *error_out)
{
  return (xpc_listener_t)MEMORY[0x270EDC240](service, target_queue, flags, incoming_session_handler, error_out);
}

uint64_t xpc_listener_create_anonymous()
{
  return MEMORY[0x270EDC248]();
}

uint64_t xpc_listener_create_endpoint()
{
  return MEMORY[0x270EDC250]();
}

void xpc_listener_reject_peer(xpc_session_t peer, const char *reason)
{
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDC2B8](object);
}

BOOL xpc_rich_error_can_retry(xpc_rich_error_t error)
{
  return MEMORY[0x270EDC2C0](error);
}

char *__cdecl xpc_rich_error_copy_description(xpc_rich_error_t error)
{
  return (char *)MEMORY[0x270EDC2C8](error);
}

BOOL xpc_session_activate(xpc_session_t session, xpc_rich_error_t *error_out)
{
  return MEMORY[0x270EDC330](session, error_out);
}

void xpc_session_cancel(xpc_session_t session)
{
}

char *__cdecl xpc_session_copy_description(xpc_session_t session)
{
  return (char *)MEMORY[0x270EDC340](session);
}

xpc_session_t xpc_session_create_mach_service(const char *mach_service, dispatch_queue_t target_queue, xpc_session_create_flags_t flags, xpc_rich_error_t *error_out)
{
  return (xpc_session_t)MEMORY[0x270EDC348](mach_service, target_queue, flags, error_out);
}

uint64_t xpc_session_create_xpc_endpoint()
{
  return MEMORY[0x270EDC350]();
}

xpc_session_t xpc_session_create_xpc_service(const char *name, dispatch_queue_t target_queue, xpc_session_create_flags_t flags, xpc_rich_error_t *error_out)
{
  return (xpc_session_t)MEMORY[0x270EDC358](name, target_queue, flags, error_out);
}

xpc_rich_error_t xpc_session_send_message(xpc_session_t session, xpc_object_t message)
{
  return (xpc_rich_error_t)MEMORY[0x270EDC360](session, message);
}

void xpc_session_send_message_with_reply_async(xpc_session_t session, xpc_object_t message, xpc_session_reply_handler_t reply_handler)
{
}

xpc_object_t xpc_session_send_message_with_reply_sync(xpc_session_t session, xpc_object_t message, xpc_rich_error_t *error_out)
{
  return (xpc_object_t)MEMORY[0x270EDC370](session, message, error_out);
}

void xpc_session_set_cancel_handler(xpc_session_t session, xpc_session_cancel_handler_t cancel_handler)
{
}

void xpc_session_set_incoming_message_handler(xpc_session_t session, xpc_session_incoming_message_handler_t handler)
{
}

void xpc_session_set_target_queue(xpc_session_t session, dispatch_queue_t target_queue)
{
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x270EDC440](xuint);
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  return (xpc_object_t)MEMORY[0x270EDC458](uuid);
}