void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id IntentHandlerDefaultLog()
{
  if (IntentHandlerDefaultLog_onceToken != -1) {
    dispatch_once(&IntentHandlerDefaultLog_onceToken, &__block_literal_global);
  }
  v0 = (void *)IntentHandlerDefaultLog_log;
  return v0;
}

uint64_t __IntentHandlerDefaultLog_block_invoke()
{
  IntentHandlerDefaultLog_log = (uint64_t)os_log_create("com.apple.calls.intenthandler", "Default");
  return MEMORY[0x270F9A758]();
}

uint64_t key path getter for AnswerCallIntentHandlerDataSource.contactsDataSource : AnswerCallIntentHandlerDataSource@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 104))();
  *a2 = result;
  return result;
}

uint64_t key path setter for AnswerCallIntentHandlerDataSource.contactsDataSource : AnswerCallIntentHandlerDataSource(uint64_t a1, uint64_t a2)
{
  v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 112);
  uint64_t v3 = swift_unknownObjectRetain();
  return v2(v3);
}

uint64_t AnswerCallIntentHandlerDataSource.contactsDataSource.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t AnswerCallIntentHandlerDataSource.contactsDataSource.setter(uint64_t a1)
{
  OUTLINED_FUNCTION_1();
  *(void *)(v1 + 16) = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*AnswerCallIntentHandlerDataSource.contactsDataSource.modify())()
{
  return AnswerCallIntentHandlerDataSource.contactsDataSource.modify;
}

uint64_t key path getter for AnswerCallIntentHandlerDataSource.callHistoryDataSource : AnswerCallIntentHandlerDataSource@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 128))();
  *a2 = result;
  return result;
}

uint64_t key path setter for AnswerCallIntentHandlerDataSource.callHistoryDataSource : AnswerCallIntentHandlerDataSource(uint64_t a1, uint64_t a2)
{
  v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 136);
  uint64_t v3 = swift_unknownObjectRetain();
  return v2(v3);
}

uint64_t AnswerCallIntentHandlerDataSource.callHistoryDataSource.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t AnswerCallIntentHandlerDataSource.callHistoryDataSource.setter(uint64_t a1)
{
  OUTLINED_FUNCTION_1();
  *(void *)(v1 + 24) = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*AnswerCallIntentHandlerDataSource.callHistoryDataSource.modify())()
{
  return AnswerCallIntentHandlerDataSource.callHistoryDataSource.modify;
}

uint64_t AnswerCallIntentHandlerDataSource.callHistoryDataSource.modify()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t key path getter for AnswerCallIntentHandlerDataSource.providerManager : AnswerCallIntentHandlerDataSource@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 152))();
  *a2 = result;
  return result;
}

uint64_t key path setter for AnswerCallIntentHandlerDataSource.providerManager : AnswerCallIntentHandlerDataSource(id *a1, uint64_t a2)
{
  return (*(uint64_t (**)(id))(**(void **)a2 + 160))(*a1);
}

id AnswerCallIntentHandlerDataSource.providerManager.getter()
{
  OUTLINED_FUNCTION_2();
  uint64_t v1 = *(void **)(v0 + 32);
  return v1;
}

void AnswerCallIntentHandlerDataSource.providerManager.setter(uint64_t a1)
{
  OUTLINED_FUNCTION_1();
  uint64_t v3 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = a1;
}

uint64_t (*AnswerCallIntentHandlerDataSource.providerManager.modify())()
{
  return AnswerCallIntentHandlerDataSource.contactsDataSource.modify;
}

void *AnswerCallIntentHandlerDataSource.__allocating_init(contactsDataSource:callHistoryDataSource:providerManager:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  return result;
}

void *AnswerCallIntentHandlerDataSource.init(contactsDataSource:callHistoryDataSource:providerManager:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[2] = a1;
  v3[3] = a2;
  v3[4] = a3;
  return v3;
}

uint64_t AnswerCallIntentHandlerDataSource.__allocating_init(deviceState:)(void *a1)
{
  id v3 = objc_msgSend(self, sel_sharedInstance);
  id v4 = objc_msgSend(v3, sel_contactStore);

  type metadata accessor for CHManager();
  id v5 = static CHManager.siriManager(deviceState:)(a1);
  uint64_t v6 = (*(uint64_t (**)(id, id, id))(v1 + 176))(v4, v5, objc_msgSend(objc_allocWithZone(MEMORY[0x263F7E1B0]), sel_init));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v6;
}

unint64_t type metadata accessor for CHManager()
{
  unint64_t result = lazy cache variable for type metadata for CHManager;
  if (!lazy cache variable for type metadata for CHManager)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for CHManager);
  }
  return result;
}

id static CHManager.siriManager(deviceState:)(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F30588]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_25DA61BC0;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v4;
  uint64_t v5 = specialized Set.init(_nonEmptyArrayLiteral:)(inited);
  uint64_t v10 = v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  if (dispatch thunk of DeviceState.isPad.getter())
  {
    Swift::Int v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    specialized Set._Variant.insert(_:)(&v9, v6, v7);
    swift_bridgeObjectRelease();
    uint64_t v5 = v10;
  }
  outlined bridged method (mbnn) of @objc CHManager.allowedProtectedAppBundleIDs.setter(v5, v2);
  return v2;
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

uint64_t AnswerCallIntentHandlerDataSource.deinit()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v0;
}

uint64_t AnswerCallIntentHandlerDataSource.__deallocating_deinit()
{
  AnswerCallIntentHandlerDataSource.deinit();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t protocol witness for AnswerCallIntentHandlerDataSourceProtocol.contactsDataSource.getter in conformance AnswerCallIntentHandlerDataSource()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 104))();
}

uint64_t protocol witness for AnswerCallIntentHandlerDataSourceProtocol.callHistoryDataSource.getter in conformance AnswerCallIntentHandlerDataSource()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 128))();
}

uint64_t protocol witness for AnswerCallIntentHandlerDataSourceProtocol.providerManager.getter in conformance AnswerCallIntentHandlerDataSource()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 152))();
}

uint64_t default argument 1 of prefix(type:tags:)()
{
  return MEMORY[0x263F8EE78];
}

uint64_t default argument 1 of prefix<A>(typeof:tags:)()
{
  return MEMORY[0x263F8EE78];
}

uint64_t specialized Set.init(_nonEmptyArrayLiteral:)(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = MEMORY[0x263F8EE88];
    goto LABEL_25;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _SetStorage<String>);
  uint64_t result = static _SetStorage.allocate(capacity:)();
  uint64_t v3 = result;
  uint64_t v24 = *(void *)(a1 + 16);
  if (!v24)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    return v3;
  }
  unint64_t v4 = 0;
  uint64_t v5 = result + 56;
  while (v4 < *(void *)(a1 + 16))
  {
    Swift::Int v6 = (uint64_t *)(a1 + 32 + 16 * v4);
    uint64_t v8 = *v6;
    uint64_t v7 = v6[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v9 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v10 = result & ~v9;
    unint64_t v11 = v10 >> 6;
    uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
    uint64_t v13 = 1 << v10;
    if (((1 << v10) & v12) != 0)
    {
      uint64_t v14 = *(void *)(v3 + 48);
      v15 = (void *)(v14 + 16 * v10);
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
        v18 = (void *)(v14 + 16 * v10);
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
    v20 = (void *)(*(void *)(v3 + 48) + 16 * v10);
    void *v20 = v8;
    v20[1] = v7;
    uint64_t v21 = *(void *)(v3 + 16);
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_27;
    }
    *(void *)(v3 + 16) = v23;
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

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t specialized Set._Variant.insert(_:)(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
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
      v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  specialized _NativeSet.insertNew(_:at:isUnique:)(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t specialized _NativeSet.resize(capacity:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _SetStorage<String>);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    v30 = (void *)(v2 + 56);
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
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          BOOL v26 = v22 == v25;
          if (v22 == v25) {
            unint64_t v22 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
      void *v28 = v18;
      v28[1] = v19;
      ++*(void *)(v4 + 16);
      if (v7) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v14 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_38;
      }
      if (v14 >= v8) {
        goto LABEL_32;
      }
      unint64_t v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        int64_t v11 = v14 + 1;
        if (v14 + 1 >= v8) {
          goto LABEL_32;
        }
        unint64_t v15 = v30[v11];
        if (!v15)
        {
          int64_t v11 = v14 + 2;
          if (v14 + 2 >= v8) {
            goto LABEL_32;
          }
          unint64_t v15 = v30[v11];
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v0;
              uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
              if (v29 > 63) {
                specialized UnsafeMutablePointer.assign(repeating:count:)(0, (unint64_t)(v29 + 63) >> 6, v30);
              }
              else {
                void *v30 = -1 << v29;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                int64_t v11 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_39;
                }
                if (v11 >= v8) {
                  goto LABEL_32;
                }
                unint64_t v15 = v30[v11];
                ++v16;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v11 = v16;
          }
        }
      }
LABEL_20:
      unint64_t v7 = (v15 - 1) & v15;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

Swift::Int specialized _NativeSet.insertNew(_:at:isUnique:)(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    specialized _NativeSet.resize(capacity:)();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)specialized _NativeSet.copy()();
      goto LABEL_22;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  uint64_t v11 = *v4;
  Hasher.init(_seed:)();
  String.hash(into:)();
  uint64_t result = Hasher._finalize()();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
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
          uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
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
  unint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *unint64_t v21 = v8;
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

uint64_t specialized UnsafeMutablePointer.assign(repeating:count:)(uint64_t result, uint64_t a2, void *a3)
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

void *specialized _NativeSet.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _SetStorage<String>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = (void *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v21 = v20[1];
    uint64_t v22 = (void *)(*(void *)(v4 + 48) + 16 * i);
    *uint64_t v22 = *v20;
    v22[1] = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t specialized _NativeSet.copyAndResize(capacity:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _SetStorage<String>);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    *uint64_t v1 = v4;
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
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
    void *v28 = v18;
    v28[1] = v19;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v14 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_36;
    }
    if (v14 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      int64_t v11 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v11);
      if (!v15)
      {
        int64_t v11 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v11);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_34;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void outlined bridged method (mbnn) of @objc CHManager.allowedProtectedAppBundleIDs.setter(uint64_t a1, void *a2)
{
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setAllowedProtectedAppBundleIDs_, isa);
}

uint64_t dispatch thunk of AnswerCallIntentHandlerDataSourceProtocol.contactsDataSource.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AnswerCallIntentHandlerDataSourceProtocol.callHistoryDataSource.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AnswerCallIntentHandlerDataSourceProtocol.providerManager.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t type metadata accessor for AnswerCallIntentHandlerDataSource()
{
  return self;
}

uint64_t method lookup function for AnswerCallIntentHandlerDataSource(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AnswerCallIntentHandlerDataSource);
}

uint64_t dispatch thunk of AnswerCallIntentHandlerDataSource.contactsDataSource.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of AnswerCallIntentHandlerDataSource.contactsDataSource.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of AnswerCallIntentHandlerDataSource.contactsDataSource.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of AnswerCallIntentHandlerDataSource.callHistoryDataSource.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of AnswerCallIntentHandlerDataSource.callHistoryDataSource.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of AnswerCallIntentHandlerDataSource.callHistoryDataSource.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of AnswerCallIntentHandlerDataSource.providerManager.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of AnswerCallIntentHandlerDataSource.providerManager.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of AnswerCallIntentHandlerDataSource.providerManager.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of AnswerCallIntentHandlerDataSource.__allocating_init(contactsDataSource:callHistoryDataSource:providerManager:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_beginAccess();
}

void SPHCallCenter.onQueue<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a5 + 8))(a3, a5);
  OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t partial apply for closure #1 in SPHCallCenter.onQueue<A>(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 40))(*(void *)(v0 + 56));
}

uint64_t SPHCallCenter.onQueueAsync(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v26 = a1;
  uint64_t v27 = a2;
  uint64_t v7 = type metadata accessor for DispatchWorkItemFlags();
  OUTLINED_FUNCTION_0_1();
  uint64_t v31 = v8;
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DispatchQoS();
  OUTLINED_FUNCTION_0_1();
  uint64_t v29 = v12;
  uint64_t v30 = v11;
  MEMORY[0x270FA5388]();
  int64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_0_1();
  uint64_t v16 = v15;
  uint64_t v18 = *(void *)(v17 + 64);
  MEMORY[0x270FA5388]();
  uint64_t v28 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a3, a4);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))((char *)&v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), v4, a3);
  unint64_t v19 = (*(unsigned __int8 *)(v16 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v20 = (char *)swift_allocObject();
  *((void *)v20 + 2) = a3;
  *((void *)v20 + 3) = a4;
  uint64_t v21 = v27;
  *((void *)v20 + 4) = v26;
  *((void *)v20 + 5) = v21;
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(&v20[v19], (char *)&v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), a3);
  aBlock[4] = partial apply for closure #1 in SPHCallCenter.onQueueAsync(_:);
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = &block_descriptor;
  unint64_t v22 = _Block_copy(aBlock);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  uint64_t v32 = MEMORY[0x263F8EE78];
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  unint64_t v23 = (void *)v28;
  MEMORY[0x2611BA270](0, v14, v10, v22);
  _Block_release(v22);

  (*(void (**)(char *, uint64_t))(v31 + 8))(v10, v7);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v14, v30);
  return swift_release();
}

uint64_t sub_25DA5C46C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  OUTLINED_FUNCTION_0_1();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = (v6 + 48) & ~v6;
  uint64_t v8 = v7 + *(void *)(v5 + 64);
  uint64_t v9 = v6 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + v7, v1);
  return MEMORY[0x270FA0238](v0, v8, v9);
}

uint64_t partial apply for closure #1 in SPHCallCenter.onQueueAsync(_:)()
{
  return (*(uint64_t (**)(unint64_t))(v0 + 32))(v0+ ((*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v0 + 16) - 8) + 80)));
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable () -> ()(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
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

unint64_t lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags()
{
  unint64_t result = lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags;
  if (!lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A];
  if (!lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A]);
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

id protocol witness for SPHCallCenter.queue.getter in conformance TUCallCenter()
{
  return @nonobjc TUCallCenter.queue.getter();
}

id @nonobjc TUCallCenter.queue.getter()
{
  id v1 = objc_msgSend(v0, sel_queue);
  return v1;
}

id protocol witness for SPHCallCenter.answer(with:) in conformance TUCallCenter(uint64_t a1)
{
  return @nonobjc TUCallCenter.answer(with:)(a1);
}

id @nonobjc TUCallCenter.answer(with:)(uint64_t a1)
{
  return objc_msgSend(v1, sel_answerWithRequest_, a1);
}

id protocol witness for SPHCallCenter.incomingCall.getter in conformance TUCallCenter()
{
  return @nonobjc TUCallCenter.incomingCall.getter();
}

id @nonobjc TUCallCenter.incomingCall.getter()
{
  id v1 = objc_msgSend(v0, sel_incomingCall);
  return v1;
}

id protocol witness for SPHCallCenter.incomingVideoCall.getter in conformance TUCallCenter()
{
  return @nonobjc TUCallCenter.incomingVideoCall.getter();
}

uint64_t dispatch thunk of SPHCallCenter.queue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of SPHCallCenter.answer(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of SPHCallCenter.incomingCall.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of SPHCallCenter.incomingVideoCall.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

id @nonobjc TUCallCenter.incomingVideoCall.getter()
{
  id v1 = objc_msgSend(v0, sel_incomingVideoCall);
  return v1;
}

uint64_t AnswerCallIntentHandler.callCenter.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of SPHCallCenter(v1 + OBJC_IVAR____TtC16SiriPhoneIntents23AnswerCallIntentHandler_callCenter, a1);
}

uint64_t AnswerCallIntentHandler.answerCallIntentHandlerDataSource.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of SPHCallCenter(v1 + OBJC_IVAR____TtC16SiriPhoneIntents23AnswerCallIntentHandler_answerCallIntentHandlerDataSource, a1);
}

uint64_t AnswerCallIntentHandler.deviceState.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of SPHCallCenter(v1 + OBJC_IVAR____TtC16SiriPhoneIntents23AnswerCallIntentHandler_deviceState, a1);
}

uint64_t outlined init with copy of SPHCallCenter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t AnswerCallIntentHandler.__allocating_init(deviceState:callCenter:)(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  outlined init with copy of SPHCallCenter(a1, (uint64_t)v13);
  v12[3] = type metadata accessor for TUCallCenter(0, &lazy cache variable for type metadata for TUCallCenter);
  v12[4] = &protocol witness table for TUCallCenter;
  v12[0] = a2;
  uint64_t v6 = type metadata accessor for AnswerCallIntentHandlerDataSource();
  outlined init with copy of SPHCallCenter(a1, (uint64_t)v11);
  id v7 = a2;
  uint64_t v8 = AnswerCallIntentHandlerDataSource.__allocating_init(deviceState:)(v11);
  v11[3] = v6;
  v11[4] = &protocol witness table for AnswerCallIntentHandlerDataSource;
  v11[0] = v8;
  uint64_t v9 = (*(uint64_t (**)(unsigned char *, void *, void *))(v3 + 104))(v13, v12, v11);

  __swift_destroy_boxed_opaque_existential_1(a1);
  return v9;
}

id AnswerCallIntentHandler.__allocating_init(deviceState:callCenter:dataSource:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  return AnswerCallIntentHandler.init(deviceState:callCenter:dataSource:)(a1, a2, a3);
}

id AnswerCallIntentHandler.init(deviceState:callCenter:dataSource:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  outlined init with copy of SPHCallCenter(a1, (uint64_t)v3 + OBJC_IVAR____TtC16SiriPhoneIntents23AnswerCallIntentHandler_deviceState);
  outlined init with copy of SPHCallCenter(a2, (uint64_t)v3 + OBJC_IVAR____TtC16SiriPhoneIntents23AnswerCallIntentHandler_callCenter);
  outlined init with copy of SPHCallCenter(a3, (uint64_t)v3 + OBJC_IVAR____TtC16SiriPhoneIntents23AnswerCallIntentHandler_answerCallIntentHandlerDataSource);
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for AnswerCallIntentHandler();
  id v7 = objc_msgSendSuper2(&v9, sel_init);
  __swift_destroy_boxed_opaque_existential_1(a3);
  __swift_destroy_boxed_opaque_existential_1(a2);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v7;
}

uint64_t type metadata accessor for AnswerCallIntentHandler()
{
  return self;
}

uint64_t AnswerCallIntentHandler.handle(intent:)(uint64_t a1)
{
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = v1;
  return MEMORY[0x270FA2498](AnswerCallIntentHandler.handle(intent:), 0, 0);
}

uint64_t AnswerCallIntentHandler.handle(intent:)()
{
  if (one-time initialization token for intentHandlers != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[5];
  uint64_t v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Logger.intentHandlers);
  id v3 = v1;
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  BOOL v6 = os_log_type_enabled(v4, v5);
  id v7 = (void *)v0[5];
  if (v6)
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    objc_super v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    v0[2] = v7;
    id v10 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *objc_super v9 = v7;

    _os_log_impl(&dword_25DA54000, v4, v5, "#AnswerCallIntentHandler Received Siri request to answer incoming call: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x2611BA8F0](v9, -1, -1);
    MEMORY[0x2611BA8F0](v8, -1, -1);
  }
  else
  {
  }
  uint64_t v11 = (void *)v0[5];
  uint64_t v12 = (char *)v0[6];
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0F980]), sel_initWithCode_userActivity_, 0, 0);
  uint64_t v14 = *(void *)&v12[OBJC_IVAR____TtC16SiriPhoneIntents23AnswerCallIntentHandler_callCenter + 24];
  uint64_t v15 = *(void *)&v12[OBJC_IVAR____TtC16SiriPhoneIntents23AnswerCallIntentHandler_callCenter + 32];
  __swift_project_boxed_opaque_existential_1(&v12[OBJC_IVAR____TtC16SiriPhoneIntents23AnswerCallIntentHandler_callCenter], v14);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = v12;
  v16[3] = v11;
  v16[4] = v13;
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = v14;
  v17[3] = v15;
  v17[4] = partial apply for closure #1 in AnswerCallIntentHandler.handle(intent:);
  v17[5] = v16;
  id v18 = v11;
  unint64_t v19 = v12;
  SPHCallCenter.onQueue<A>(_:)((uint64_t)partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed SPHCallCenter) -> (), (uint64_t)v17, v14, MEMORY[0x263F8EE60] + 8, v15);
  swift_retain();
  swift_release();
  swift_beginAccess();
  id v20 = *(id *)(v13 + 16);
  swift_release();
  uint64_t v21 = (uint64_t (*)(id))v0[1];
  return v21(v20);
}

void closure #1 in AnswerCallIntentHandler.handle(intent:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  v147 = a3;
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  id v10 = (char *)&v143 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v143 - v11;
  v146 = (id *)(a4 + 16);
  uint64_t v13 = (void *)(a2 + OBJC_IVAR____TtC16SiriPhoneIntents23AnswerCallIntentHandler_callCenter);
  uint64_t v14 = *(void *)(a2 + OBJC_IVAR____TtC16SiriPhoneIntents23AnswerCallIntentHandler_callCenter + 24);
  uint64_t v15 = *(void *)(a2 + OBJC_IVAR____TtC16SiriPhoneIntents23AnswerCallIntentHandler_callCenter + 32);
  __swift_project_boxed_opaque_existential_1((void *)(a2 + OBJC_IVAR____TtC16SiriPhoneIntents23AnswerCallIntentHandler_callCenter), v14);
  uint64_t v16 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v15 + 24))(v14, v15);
  if (!v16)
  {
    uint64_t v19 = v13[3];
    uint64_t v20 = v13[4];
    __swift_project_boxed_opaque_existential_1(v13, v19);
    uint64_t v21 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v20 + 32))(v19, v20);
    if (v21)
    {
      id v18 = v21;
      id v17 = v21;
      uint64_t v16 = 0;
      goto LABEL_5;
    }
    uint64_t v150 = 0;
    v66 = self;
    static Date.now.getter();
    static Date.- infix(_:_:)();
    v67 = *(void (**)(char *, uint64_t))(v7 + 8);
    v67(v10, v6);
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    v67(v12, v6);
    id v69 = objc_msgSend(v66, sel_predicateForMissedCallsSinceDate_, isa);

    v70 = (void *)(a2 + OBJC_IVAR____TtC16SiriPhoneIntents23AnswerCallIntentHandler_answerCallIntentHandlerDataSource);
    uint64_t v71 = v70[3];
    uint64_t v72 = v70[4];
    __swift_project_boxed_opaque_existential_1(v70, v71);
    v73 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v72 + 16))(v71, v72);
    id v74 = v69;
    id v75 = objc_msgSend(v73, sel_callsWithPredicate_limit_offset_batchSize_, v74, 1, 0, 1);

    swift_unknownObjectRelease();
    type metadata accessor for TUCallCenter(0, &lazy cache variable for type metadata for CHRecentCall);
    unint64_t v76 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v76 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v127 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v127) {
        goto LABEL_44;
      }
    }
    else if (*(void *)((v76 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_44:
      if ((v76 & 0xC000000000000001) != 0)
      {
        id v77 = (id)MEMORY[0x2611BA2F0](0, v76);
      }
      else
      {
        if (!*(void *)((v76 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        id v77 = *(id *)(v76 + 32);
      }
      v78 = v77;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v79 = objc_msgSend(self, sel_sharedInstance);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
      uint64_t v80 = swift_allocObject();
      *(_OWORD *)(v80 + 16) = xmmword_25DA61CF0;
      *(void *)(v80 + 32) = v78;
      v149[0] = v80;
      specialized Array._endMutation()();
      id v81 = v78;
      Class v82 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      uint64_t v83 = v70[3];
      uint64_t v84 = v70[4];
      __swift_project_boxed_opaque_existential_1(v70, v83);
      uint64_t v85 = (*(uint64_t (**)(uint64_t, uint64_t))(v84 + 8))(v83, v84);
      uint64_t v86 = v70[3];
      uint64_t v87 = v70[4];
      __swift_project_boxed_opaque_existential_1(v70, v86);
      v88 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v87 + 24))(v86, v87);
      id v89 = objc_msgSend(v79, sel_callRecordsForRecentCalls_withContactsDataSource_withCallProviderManager_, v82, v85, v88);

      swift_unknownObjectRelease();
      type metadata accessor for TUCallCenter(0, &lazy cache variable for type metadata for INCallRecord);
      uint64_t v90 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v150 = v90;
      goto LABEL_71;
    }
    swift_bridgeObjectRelease();
LABEL_71:
    if (one-time initialization token for intentHandlers != -1) {
      swift_once();
    }
    uint64_t v128 = type metadata accessor for Logger();
    __swift_project_value_buffer(v128, (uint64_t)static Logger.intentHandlers);
    uint64_t v129 = v150;
    swift_bridgeObjectRetain_n();
    v130 = Logger.logObject.getter();
    os_log_type_t v131 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v130, v131))
    {
      v132 = (uint8_t *)swift_slowAlloc();
      uint64_t v133 = swift_slowAlloc();
      v149[0] = v133;
      *(_DWORD *)v132 = 136315138;
      uint64_t v148 = v129;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [INCallRecord]?);
      uint64_t v134 = String.init<A>(describing:)();
      uint64_t v148 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v134, v135, v149);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_25DA54000, v130, v131, "#AnswerCallIntentHandler No incoming call exists. Returning no incoming call. Recent Missed Calls: %s", v132, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2611BA8F0](v133, -1, -1);
      MEMORY[0x2611BA8F0](v132, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v136 = v146;
    id v137 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0F980]), sel_initWithCode_userActivity_, 4, 0);
    swift_beginAccess();
    id v138 = *v136;
    id *v136 = v137;

    swift_beginAccess();
    objc_msgSend(*v136, sel_setStatusCode_, 1);
    swift_beginAccess();
    id v139 = *v136;
    swift_beginAccess();
    if (v150)
    {
      type metadata accessor for TUCallCenter(0, &lazy cache variable for type metadata for INCallRecord);
      id v140 = v139;
      v141.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
    }
    else
    {
      id v142 = v139;
      v141.super.Class isa = 0;
    }
    objc_msgSend(v139, sel_setCallRecords_, v141.super.isa);

    return;
  }
  id v17 = v16;
  id v18 = v16;
LABEL_5:
  uint64_t v22 = one-time initialization token for intentHandlers;
  id v23 = v16;
  if (v22 != -1) {
    swift_once();
  }
  uint64_t v24 = type metadata accessor for Logger();
  __swift_project_value_buffer(v24, (uint64_t)static Logger.intentHandlers);
  uint64_t v25 = Logger.logObject.getter();
  os_log_type_t v26 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v27 = 0;
    _os_log_impl(&dword_25DA54000, v25, v26, "#AnswerCallIntentHandler found incoming call", v27, 2u);
    MEMORY[0x2611BA8F0](v27, -1, -1);
  }

  uint64_t v28 = v147;
  uint64_t v29 = outlined bridged method (pb) of @objc INAnswerCallIntent.callIdentifier.getter(v147, (SEL *)&selRef_callIdentifier);
  if (!v30)
  {
LABEL_22:
    id v40 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F7E178]), sel_initWithCall_, v17);
    id v41 = objc_msgSend(v28, sel__idiom);
    id v145 = v17;
    if (v41 != (id)4)
    {
      if (objc_msgSend(v28, sel_audioRoute) == (id)1
        || (id v63 = objc_msgSend(v28, sel_audioRoute), v63 == (id)*MEMORY[0x263F101D0]))
      {
        uint64_t v64 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        outlined bridged method (mbnn) of @objc TUAnswerRequest.sourceIdentifier.setter(v64, v65, v40);
      }
      goto LABEL_66;
    }
    v144 = v18;
    objc_msgSend(v40, sel_setBehavior_, 4);
    uint64_t v42 = outlined bridged method (pb) of @objc INAnswerCallIntent.callIdentifier.getter(v28, (SEL *)&selRef__originatingDeviceIDSIdentifier);
    if (v43)
    {
      uint64_t v44 = v42;
      unint64_t v45 = v43;
      uint64_t v46 = HIBYTE(v43) & 0xF;
      if ((v43 & 0x2000000000000000) == 0) {
        uint64_t v46 = v42 & 0xFFFFFFFFFFFFLL;
      }
      if (v46)
      {
        id v47 = objc_msgSend(v147, sel__isOwnedByCurrentUser);
        if (v47)
        {
          v48 = v47;
          unsigned int v49 = objc_msgSend(v47, sel_BOOLValue);

          if (v49)
          {
            swift_bridgeObjectRetain_n();
            v50 = Logger.logObject.getter();
            os_log_type_t v51 = static os_log_type_t.info.getter();
            if (os_log_type_enabled(v50, v51))
            {
              v52 = (uint8_t *)swift_slowAlloc();
              uint64_t v53 = swift_slowAlloc();
              v149[0] = v53;
              *(_DWORD *)v52 = 136315138;
              v147 = v52 + 4;
              swift_bridgeObjectRetain();
              uint64_t v148 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v44, v45, v149);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_25DA54000, v50, v51, "#AnswerCallIntentHandler setting endpointIDSDestination=%s", v52, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x2611BA8F0](v53, -1, -1);
              MEMORY[0x2611BA8F0](v52, -1, -1);
            }
            else
            {

              swift_bridgeObjectRelease_n();
            }
            type metadata accessor for TUCallCenter(0, &lazy cache variable for type metadata for IDSDestination);
            id v117 = @nonobjc IDSDestination.__allocating_init(uri:)();
            objc_msgSend(v40, sel_setEndpointIDSDestination_, v117);

            id v18 = v144;
LABEL_66:
            v118 = Logger.logObject.getter();
            os_log_type_t v119 = static os_log_type_t.info.getter();
            if (os_log_type_enabled(v118, v119))
            {
              v120 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v120 = 0;
              _os_log_impl(&dword_25DA54000, v118, v119, "#AnswerCallIntentHandler An incoming call exists. Answering it and returning success", v120, 2u);
              MEMORY[0x2611BA8F0](v120, -1, -1);
            }

            uint64_t v121 = v13[3];
            uint64_t v122 = v13[4];
            __swift_project_boxed_opaque_existential_1(v13, v121);
            (*(void (**)(id, uint64_t, uint64_t))(v122 + 16))(v40, v121, v122);
            id v123 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0F980]), sel_initWithCode_userActivity_, 4, 0);
            v124 = v146;
            swift_beginAccess();
            id v125 = *v124;
            id *v124 = v123;

            swift_beginAccess();
            id v126 = *v124;
            objc_msgSend(v126, sel_setStatusCode_, 2);

            return;
          }
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v28 = v147;
    }
    uint64_t v54 = outlined bridged method (pb) of @objc INAnswerCallIntent.callIdentifier.getter(v28, (SEL *)&selRef__originatingDeviceRapportMediaSystemIdentifier);
    if (v55)
    {
      uint64_t v56 = v54;
      unint64_t v57 = v55;
      uint64_t v58 = HIBYTE(v55) & 0xF;
      if ((v55 & 0x2000000000000000) == 0) {
        uint64_t v58 = v54 & 0xFFFFFFFFFFFFLL;
      }
      if (v58)
      {
        outlined bridged method (mbgnn) of @objc TUAnswerRequest.endpointRapportMediaSystemIdentifier.setter(v54, v55, v40);
        swift_bridgeObjectRetain();
        v59 = Logger.logObject.getter();
        os_log_type_t v60 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v59, v60))
        {
          v61 = (uint8_t *)swift_slowAlloc();
          uint64_t v62 = swift_slowAlloc();
          v149[0] = v62;
          *(_DWORD *)v61 = 136315138;
          v143 = v61 + 4;
          swift_bridgeObjectRetain();
          uint64_t v148 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v56, v57, v149);
          uint64_t v28 = v147;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_25DA54000, v59, v60, "#AnswerCallIntentHandler intent contains an originatingDeviceRapportMediaSystemIdentifier=%s", v61, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2611BA8F0](v62, -1, -1);
          MEMORY[0x2611BA8F0](v61, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    uint64_t v105 = outlined bridged method (pb) of @objc INAnswerCallIntent.callIdentifier.getter(v28, (SEL *)&selRef__originatingDeviceRapportEffectiveIdentifier);
    id v18 = v144;
    if (v106)
    {
      uint64_t v107 = v105;
      unint64_t v108 = v106;
      uint64_t v109 = HIBYTE(v106) & 0xF;
      if ((v106 & 0x2000000000000000) == 0) {
        uint64_t v109 = v105 & 0xFFFFFFFFFFFFLL;
      }
      if (v109)
      {
        outlined bridged method (mbgnn) of @objc TUAnswerRequest.endpointRapportEffectiveIdentifier.setter(v105, v106, v40);
        swift_bridgeObjectRetain();
        v110 = Logger.logObject.getter();
        os_log_type_t v111 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v110, v111))
        {
          v112 = (uint8_t *)swift_slowAlloc();
          uint64_t v113 = swift_slowAlloc();
          v149[0] = v113;
          *(_DWORD *)v112 = 136315138;
          v147 = v112 + 4;
          swift_bridgeObjectRetain();
          uint64_t v148 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v107, v108, v149);
          id v18 = v144;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_25DA54000, v110, v111, "#AnswerCallIntentHandler intent contains an originatingDeviceRapportEffectiveIdentifier=%s", v112, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2611BA8F0](v113, -1, -1);
          MEMORY[0x2611BA8F0](v112, -1, -1);
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    goto LABEL_66;
  }
  uint64_t v31 = v29;
  unint64_t v32 = v30;
  uint64_t v33 = HIBYTE(v30) & 0xF;
  if ((v30 & 0x2000000000000000) == 0) {
    uint64_t v33 = v29 & 0xFFFFFFFFFFFFLL;
  }
  if (!v33)
  {
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  id v34 = objc_msgSend(v17, sel_callUUID);
  uint64_t v35 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v37 = v36;

  if (v31 == v35 && v32 == v37)
  {
    swift_bridgeObjectRelease();
LABEL_21:
    swift_bridgeObjectRelease();
    uint64_t v28 = v147;
    goto LABEL_22;
  }
  char v39 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v39) {
    goto LABEL_21;
  }
  v91 = Logger.logObject.getter();
  os_log_type_t v92 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v91, v92))
  {
    v93 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v93 = 0;
    _os_log_impl(&dword_25DA54000, v91, v92, "#AnswerCallIntentHandler Requested to answer specific call but UUID did not match identifier of requested call", v93, 2u);
    MEMORY[0x2611BA8F0](v93, -1, -1);
  }

  id v94 = v17;
  swift_bridgeObjectRetain();
  v95 = Logger.logObject.getter();
  os_log_type_t v96 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v95, v96))
  {
    uint64_t v97 = swift_slowAlloc();
    v147 = (void *)swift_slowAlloc();
    v149[0] = (uint64_t)v147;
    *(_DWORD *)uint64_t v97 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v148 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v31, v32, v149);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v97 + 12) = 2080;
    id v98 = objc_msgSend(v94, sel_callUUID);
    v99 = v18;
    uint64_t v100 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v102 = v101;

    uint64_t v103 = v100;
    id v18 = v99;
    uint64_t v148 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v103, v102, v149);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25DA54000, v95, v96, "#AnswerCallIntentHandler call identifiers: requested=%s -- actual=%s", (uint8_t *)v97, 0x16u);
    v104 = v147;
    swift_arrayDestroy();
    MEMORY[0x2611BA8F0](v104, -1, -1);
    MEMORY[0x2611BA8F0](v97, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v114 = v146;
  id v115 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0F980]), sel_initWithCode_userActivity_, 5, 0);

  swift_beginAccess();
  v116 = *v114;
  *v114 = v115;
}

id @nonobjc IDSDestination.__allocating_init(uri:)()
{
  uint64_t v0 = (void *)MEMORY[0x2611BA160]();
  swift_bridgeObjectRelease();
  id v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_destinationWithURI_, v0);

  return v1;
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed SPHCallCenter) -> ()(uint64_t a1, void (*a2)(uint64_t *), uint64_t a3, uint64_t a4, uint64_t a5)
{
  v10[3] = a4;
  v10[4] = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v10);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 16))(boxed_opaque_existential_1, a1, a4);
  a2(v10);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
}

uint64_t @objc closure #1 in AnswerCallIntentHandler.handle(intent:)(void *a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  id v6 = a1;
  a3;
  uint64_t v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  *uint64_t v7 = v3;
  v7[1] = @objc closure #1 in AnswerCallIntentHandler.handle(intent:);
  return AnswerCallIntentHandler.handle(intent:)((uint64_t)v6);
}

uint64_t @objc closure #1 in AnswerCallIntentHandler.handle(intent:)()
{
  OUTLINED_FUNCTION_4();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_0_2();
  uint64_t v4 = (void (**)(void, void))v3[4];
  os_log_type_t v5 = (void *)v3[3];
  id v6 = (void *)v3[2];
  uint64_t v7 = *v0;
  OUTLINED_FUNCTION_1_0();
  *uint64_t v8 = v7;
  swift_task_dealloc();

  ((void (**)(void, void *))v4)[2](v4, v2);
  _Block_release(v4);

  OUTLINED_FUNCTION_3();
  return v9();
}

uint64_t _runTaskForBridgedAsyncMethod(_:)(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388]();
  os_log_type_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TaskPriority();
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 1, 1, v6);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = a1;
  v7[5] = a2;
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = &_sIeghH_IeAgH_TRTATu;
  v8[5] = v7;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v5, (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu, (uint64_t)v8);
  return swift_release();
}

id AnswerCallIntentHandler.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void AnswerCallIntentHandler.init()()
{
}

id AnswerCallIntentHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AnswerCallIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_25DA5E5CC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25DA5E604()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void partial apply for closure #1 in AnswerCallIntentHandler.handle(intent:)(uint64_t a1)
{
  closure #1 in AnswerCallIntentHandler.handle(intent:)(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_25DA5E658()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed SPHCallCenter) -> ()(uint64_t a1)
{
  return thunk for @escaping @callee_guaranteed (@in_guaranteed SPHCallCenter) -> ()(a1, *(void (**)(uint64_t *))(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t _sIeghH_IeAgH_TR(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = _sIeghH_IeAgH_TRTQ0_;
  return v6();
}

uint64_t _sIeAgH_ytIeAgHr_TR(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  os_log_type_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *os_log_type_t v5 = v4;
  v5[1] = _sIeghH_IeAgH_TRTQ0_;
  return v7();
}

uint64_t _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    outlined destroy of TaskPriority?(a1);
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TQ0_;
  return v6(a1);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TQ0_()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_3();
  return v3();
}

uint64_t method lookup function for AnswerCallIntentHandler(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AnswerCallIntentHandler);
}

uint64_t dispatch thunk of AnswerCallIntentHandler.__allocating_init(deviceState:callCenter:dataSource:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of AnswerCallIntentHandler.handle(intent:)()
{
  OUTLINED_FUNCTION_4();
  uint64_t v2 = v1;
  uint64_t v3 = *(int **)((*MEMORY[0x263F8EED0] & *v0) + 0x70);
  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)v3 + *v3);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_2_0(v4);
  *uint64_t v5 = v6;
  v5[1] = dispatch thunk of AnswerCallIntentHandler.handle(intent:);
  return v8(v2);
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v7;

  OUTLINED_FUNCTION_5();
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_0_2();
  uint64_t v3 = *v0;
  OUTLINED_FUNCTION_1_0();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

uint64_t sub_25DA5ED40()
{
  _Block_release(*(const void **)(v0 + 24));
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t partial apply for @objc closure #1 in AnswerCallIntentHandler.handle(intent:)()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = (void *)v0[2];
  uint64_t v2 = (void *)v0[3];
  uint64_t v3 = (void *)v0[4];
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_2_0(v4);
  *uint64_t v5 = v6;
  v5[1] = partial apply for @objc closure #1 in AnswerCallIntentHandler.handle(intent:);
  uint64_t v7 = (uint64_t (*)(void *, void *, void *))((char *)&async function pointer to @objc closure #1 in AnswerCallIntentHandler.handle(intent:)
                                                      + async function pointer to @objc closure #1 in AnswerCallIntentHandler.handle(intent:));
  return v7(v1, v2, v3);
}

{
  uint64_t *v0;
  uint64_t v1;
  void *v2;
  uint64_t (*v3)(void);
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2();
  uint64_t v1 = *v0;
  OUTLINED_FUNCTION_1_0();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  OUTLINED_FUNCTION_3();
  return v3();
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t _sIeghH_IeAgH_TRTA()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = (int *)v0[4];
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_2_0(v4);
  *uint64_t v5 = v6;
  v5[1] = _sIeghH_IeAgH_TRTQ0_;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&_sIeghH_IeAgH_TRTu + _sIeghH_IeAgH_TRTu);
  return v7(v1, v2, v3);
}

uint64_t objectdestroy_15Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t _sIeAgH_ytIeAgHr_TRTA(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = (int *)v1[4];
  uint64_t v6 = swift_task_alloc();
  uint64_t v7 = (void *)OUTLINED_FUNCTION_2_0(v6);
  *uint64_t v7 = v8;
  v7[1] = _sIeghH_IeAgH_TRTQ0_;
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&_sIeAgH_ytIeAgHr_TRTu + _sIeAgH_ytIeAgHr_TRTu);
  return v9(a1, v3, v4, v5);
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t outlined destroy of TaskPriority?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25DA5F170()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TA()
{
  OUTLINED_FUNCTION_4();
  uint64_t v2 = v1;
  uint64_t v3 = *(int **)(v0 + 16);
  uint64_t v4 = swift_task_alloc();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_2_0(v4);
  *uint64_t v5 = v6;
  v5[1] = partial apply for @objc closure #1 in AnswerCallIntentHandler.handle(intent:);
  uint64_t v7 = (uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5Tu
                                              + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5Tu);
  return v7(v2, v3);
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

void outlined bridged method (mbnn) of @objc TUAnswerRequest.sourceIdentifier.setter(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)MEMORY[0x2611BA160]();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setSourceIdentifier_, v4);
}

uint64_t outlined bridged method (pb) of @objc INAnswerCallIntent.callIdentifier.getter(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v4;
}

void outlined bridged method (mbgnn) of @objc TUAnswerRequest.endpointRapportEffectiveIdentifier.setter(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)MEMORY[0x2611BA160]();
  objc_msgSend(a3, sel_setEndpointRapportEffectiveIdentifier_, v4);
}

void outlined bridged method (mbgnn) of @objc TUAnswerRequest.endpointRapportMediaSystemIdentifier.setter(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)MEMORY[0x2611BA160]();
  objc_msgSend(a3, sel_setEndpointRapportMediaSystemIdentifier_, v4);
}

uint64_t type metadata accessor for TUCallCenter(uint64_t a1, unint64_t *a2)
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

uint64_t OUTLINED_FUNCTION_2_0(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return v0 + 8;
}

uint64_t Logger.intentHandlers.unsafeMutableAddressor()
{
  return Logger.intentHandlers.unsafeMutableAddressor(&one-time initialization token for intentHandlers, (uint64_t)static Logger.intentHandlers);
}

uint64_t specialized == infix<A>(_:_:)(char a1, char a2)
{
  uint64_t v3 = LogTag.rawValue.getter(a1);
  uint64_t v5 = v4;
  if (v3 == LogTag.rawValue.getter(a2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t one-time initialization function for siriPhone()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.siriPhone);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.siriPhone);
  if (one-time initialization token for siriPhone != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return Logger.init(subsystem:category:)();
}

void *LogConst.subsystem.unsafeMutableAddressor()
{
  return &static LogConst.subsystem;
}

uint64_t *LogConst.Category.siriPhone.unsafeMutableAddressor()
{
  if (one-time initialization token for siriPhone != -1) {
    swift_once();
  }
  return &static LogConst.Category.siriPhone;
}

uint64_t Logger.siriPhone.unsafeMutableAddressor()
{
  return Logger.intentHandlers.unsafeMutableAddressor(&one-time initialization token for siriPhone, (uint64_t)static Logger.siriPhone);
}

uint64_t static Logger.siriPhone.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.siriPhone.getter(&one-time initialization token for siriPhone, (uint64_t)static Logger.siriPhone, a1);
}

uint64_t one-time initialization function for announceTelephony()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.announceTelephony);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.announceTelephony);
  return Logger.init(subsystem:category:)();
}

void *LogConst.Category.announceTelephony.unsafeMutableAddressor()
{
  return &static LogConst.Category.announceTelephony;
}

uint64_t Logger.announceTelephony.unsafeMutableAddressor()
{
  return Logger.intentHandlers.unsafeMutableAddressor(&one-time initialization token for announceTelephony, (uint64_t)static Logger.announceTelephony);
}

uint64_t Logger.intentHandlers.unsafeMutableAddressor(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static Logger.announceTelephony.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.siriPhone.getter(&one-time initialization token for announceTelephony, (uint64_t)static Logger.announceTelephony, a1);
}

uint64_t one-time initialization function for intentHandlers()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.intentHandlers);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.intentHandlers);
  if (one-time initialization token for intentHandlers != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return Logger.init(subsystem:category:)();
}

uint64_t *LogConst.Category.intentHandlers.unsafeMutableAddressor()
{
  if (one-time initialization token for intentHandlers != -1) {
    swift_once();
  }
  return &static LogConst.Category.intentHandlers;
}

uint64_t static Logger.intentHandlers.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.siriPhone.getter(&one-time initialization token for intentHandlers, (uint64_t)static Logger.intentHandlers, a1);
}

uint64_t static Logger.siriPhone.getter@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

void Logger.logAndCrash(_:)(uint64_t a1, unint64_t a2)
{
  swift_bridgeObjectRetain_n();
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = v7;
    *(_DWORD *)uint64_t v6 = 136315138;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, &v8);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25DA54000, v4, v5, "%s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611BA8F0](v7, -1, -1);
    MEMORY[0x2611BA8F0](v6, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  static SiriKitLifecycle._logCrashToEventBus(_:)();
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

unint64_t static LogConst.subsystem.getter()
{
  return 0xD000000000000014;
}

void one-time initialization function for siriPhone()
{
  static LogConst.Category.siriPhone = 0x6E6F685069726953;
  unk_26A6A62A0 = 0xE900000000000065;
}

uint64_t static LogConst.Category.siriPhone.getter()
{
  return static LogConst.Category.siriPhone.getter(&one-time initialization token for siriPhone);
}

unint64_t static LogConst.Category.announceTelephony.getter()
{
  return 0xD000000000000011;
}

void one-time initialization function for intentHandlers()
{
  unk_26A6A62B7 = -18;
}

uint64_t static LogConst.Category.intentHandlers.getter()
{
  return static LogConst.Category.siriPhone.getter(&one-time initialization token for intentHandlers);
}

uint64_t static LogConst.Category.siriPhone.getter(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_1_1();
}

SiriPhoneIntents::LogTag_optional __swiftcall LogTag.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v2._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of LogTag.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 9) {
    return (SiriPhoneIntents::LogTag_optional)9;
  }
  else {
    return (SiriPhoneIntents::LogTag_optional)v3;
  }
}

uint64_t LogTag.rawValue.getter(char a1)
{
  return *(void *)&aNl_1[8 * a1];
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance LogTag(char *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance LogTag()
{
  return specialized RawRepresentable<>.hashValue.getter(*v0);
}

Swift::Int specialized RawRepresentable<>.hashValue.getter(char a1)
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance LogTag(uint64_t a1)
{
  return specialized RawRepresentable<>.hash(into:)(a1, *v1);
}

uint64_t specialized RawRepresentable<>.hash(into:)(uint64_t a1, char a2)
{
  LogTag.rawValue.getter(a2);
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance LogTag(uint64_t a1)
{
  return specialized RawRepresentable<>._rawHashValue(seed:)(a1, *v1);
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)(uint64_t a1, char a2)
{
  return Hasher._finalize()();
}

SiriPhoneIntents::LogTag_optional protocol witness for RawRepresentable.init(rawValue:) in conformance LogTag@<W0>(Swift::String *a1@<X0>, SiriPhoneIntents::LogTag_optional *a2@<X8>)
{
  result.value = LogTag.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance LogTag@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = LogTag.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t LogPrefix.tags.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t LogPrefix.function.getter()
{
  return OUTLINED_FUNCTION_1_1();
}

uint64_t LogPrefix.withFunction(_:)()
{
  return OUTLINED_FUNCTION_1_1();
}

uint64_t LogPrefix.description.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return 0;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance LogPrefix()
{
  return LogPrefix.description.getter(*v0, v0[1], v0[2], v0[3]);
}

uint64_t prefix(type:tags:)()
{
  return OUTLINED_FUNCTION_1_1();
}

uint64_t prefix<A>(typeof:tags:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

void DefaultStringInterpolation.appendInterpolation(type:tags:function:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a2 + 16);
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = *(char *)(a2 + v8++ + 32);
      v10._countAndFlagsBits = 91;
      v10._object = (void *)0xE100000000000000;
      String.append(_:)(v10);
      v11._countAndFlagsBits = *(void *)&aNl_1[8 * v9];
      v11._object = (void *)qword_25DA61E80[v9];
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      v12._countAndFlagsBits = 93;
      v12._object = (void *)0xE100000000000000;
      String.append(_:)(v12);
    }
    while (v6 != v8);
    swift_bridgeObjectRelease();
    v13._countAndFlagsBits = 32;
    v13._object = (void *)0xE100000000000000;
    String.append(_:)(v13);
  }
  v14._countAndFlagsBits = 35;
  v14._object = (void *)0xE100000000000000;
  String.append(_:)(v14);
  v15._countAndFlagsBits = _typeName(_:qualified:)();
  String.append(_:)(v15);
  swift_bridgeObjectRelease();
  if (a4)
  {
    v16._countAndFlagsBits = 32;
    v16._object = (void *)0xE100000000000000;
    String.append(_:)(v16);
    uint64_t v17 = a3;
    uint64_t v18 = a4;
    String.append(_:)(*(Swift::String *)&v17);
  }
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
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
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

unint64_t lazy protocol witness table accessor for type LogTag and conformance LogTag()
{
  unint64_t result = lazy protocol witness table cache variable for type LogTag and conformance LogTag;
  if (!lazy protocol witness table cache variable for type LogTag and conformance LogTag)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LogTag and conformance LogTag);
  }
  return result;
}

void type metadata accessor for LogConst()
{
}

void type metadata accessor for LogConst.Category()
{
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LogTag(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF8)
  {
    if (a2 + 8 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 8) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 9;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v5 = v6 - 9;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for LogTag(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *unint64_t result = a2 + 8;
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
        JUMPOUT(0x25DA6039CLL);
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
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for LogTag(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for LogTag(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

void type metadata accessor for LogTag()
{
}

uint64_t initializeBufferWithCopyOfBuffer for LogPrefix(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for LogPrefix()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for LogPrefix(void *a1, void *a2)
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

void *assignWithCopy for LogPrefix(void *a1, void *a2)
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

uint64_t assignWithTake for LogPrefix(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LogPrefix(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 32))
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

uint64_t storeEnumTagSinglePayload for LogPrefix(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for LogPrefix()
{
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = _StringGuts._allocateForDeconstruct()(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = _StringObject.sharedUTF8.getter();
    if (!v8)
    {
      uint64_t result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = String.UTF8View._foreignCount()();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_6:
  unint64_t v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = _StringGuts.copyUTF8(into:)();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
LABEL_14:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
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
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
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
  Swift::String v12 = v10 + 32;
  Swift::String v13 = (char *)(a4 + 32);
  if (v5)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    specialized UnsafeMutablePointer.initialize(from:count:)(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *specialized UnsafeMutablePointer.initialize(from:count:)(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
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

uint64_t OUTLINED_FUNCTION_1_1()
{
  return v0;
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x270EF0998]();
}

uint64_t static Date.- infix(_:_:)()
{
  return MEMORY[0x270EF09C8]();
}

uint64_t static Date.now.getter()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t static SiriKitLifecycle._logCrashToEventBus(_:)()
{
  return MEMORY[0x270F67078]();
}

uint64_t dispatch thunk of DeviceState.isPad.getter()
{
  return MEMORY[0x270F67210]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x270FA0A48]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x270F9D5E0]();
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

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B88]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x270FA1F10]();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)MEMORY[0x270EF1C98]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t OS_dispatch_queue.sync<A>(execute:)()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x270F9E530]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x270F9E560]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x270F9E958]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9E960]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9E970]();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFE8]();
}

{
  return MEMORY[0x270F9EFF0]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x270F9F080]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x270F9F230](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x270FA0128]();
}

uint64_t INPersonHandleLabelForCNLabeledValue()
{
  return MEMORY[0x270EF5278]();
}

uint64_t TUFormattedPhoneNumber()
{
  return MEMORY[0x270F7CB40]();
}

uint64_t TUHandlesAreCanonicallyEqual()
{
  return MEMORY[0x270F7CB50]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

void objc_enumerationMutation(id obj)
{
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
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