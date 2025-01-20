uint64_t static Metadata.Kind.tuple.getter()
{
  return 769;
}

uint64_t type metadata instantiation function for BufferView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t TypeDescriptor.genericSignature.getter(_DWORD *a1)
{
  uint64_t v1 = 11;
  if ((*a1 & 0x1Fu) - 17 < 2) {
    uint64_t v1 = 7;
  }
  uint64_t v2 = (uint64_t)&a1[v1 + 2];
  if ((*a1 & 0x80) != 0) {
    return v2;
  }
  else {
    return 0;
  }
}

unint64_t FieldDescriptor.subscript.getter(unint64_t result, uint64_t a2)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(unsigned int *)(a2 + 12) > result)
  {
    return a2 + 12 * result + 16;
  }
  __break(1u);
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t ClassMetadata.superclass.getter(uint64_t a1)
{
  swift_getKeyPath();
  uint64_t v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  return *(void *)(a1 + v2);
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
{
  v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<TypeCache.Key, Metadata?>);
  uint64_t result = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v35 = a2;
    int64_t v8 = 0;
    v37 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v36 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v14 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v15 = v14 | (v8 << 6);
      }
      else
      {
        int64_t v16 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_58:
          __break(1u);
LABEL_59:
          __break(1u);
          return result;
        }
        uint64_t result = (uint64_t)v37;
        if (v16 >= v36) {
          goto LABEL_50;
        }
        unint64_t v17 = v37[v16];
        ++v8;
        if (!v17)
        {
          int64_t v8 = v16 + 1;
          if (v16 + 1 >= v36) {
            goto LABEL_50;
          }
          unint64_t v17 = v37[v8];
          if (!v17)
          {
            int64_t v18 = v16 + 2;
            if (v18 >= v36)
            {
LABEL_50:
              if ((v35 & 1) == 0)
              {
                uint64_t result = swift_release();
                v3 = v2;
                goto LABEL_57;
              }
              uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
              if (v34 >= 64) {
                bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                void *v37 = -1 << v34;
              }
              v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v17 = v37[v18];
            if (!v17)
            {
              while (1)
              {
                int64_t v8 = v18 + 1;
                if (__OFADD__(v18, 1)) {
                  goto LABEL_59;
                }
                if (v8 >= v36) {
                  goto LABEL_50;
                }
                unint64_t v17 = v37[v8];
                ++v18;
                if (v17) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v18;
          }
        }
LABEL_21:
        unint64_t v11 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v8 << 6);
      }
      long long v39 = *(_OWORD *)(*(void *)(v5 + 48) + 16 * v15);
      uint64_t v19 = *(void *)(*(void *)(v5 + 56) + 8 * v15);
      Hasher.init(_seed:)();
      v20 = (Swift::UInt8 *)v39;
      Swift::UInt8 v21 = *(unsigned char *)v39;
      if (!*(unsigned char *)v39)
      {
        Hasher._combine(_:)(0);
        goto LABEL_41;
      }
      uint64_t v38 = v19;
      uint64_t v22 = v5;
      int v23 = 0;
      do
      {
        v25 = v20 + 1;
        if (v21 > 0x70u)
        {
          if (v21 == 120) {
            int v26 = 1;
          }
          else {
            int v26 = v23;
          }
          if (v21 == 113) {
            int v23 = 1;
          }
          else {
            int v23 = v26;
          }
        }
        else
        {
          if (v21 == 1)
          {
            Swift::UInt v24 = (Swift::UInt)&v25[*(int *)(v20 + 1)];
LABEL_25:
            Hasher._combine(_:)(v24);
            v25 = v20 + 5;
            goto LABEL_26;
          }
          if (v21 == 2)
          {
            Swift::UInt v24 = *(void *)&v25[*(int *)(v20 + 1)];
            goto LABEL_25;
          }
        }
        Hasher._combine(_:)(v21);
LABEL_26:
        Swift::UInt8 v21 = *v25;
        v20 = v25;
      }
      while (*v25);
      Hasher._combine(_:)(0);
      uint64_t v5 = v22;
      uint64_t v19 = v38;
      if (v23) {
        Hasher._combine(_:)(*((Swift::UInt *)&v39 + 1));
      }
LABEL_41:
      uint64_t result = Hasher._finalize()();
      uint64_t v27 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v12 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v28) & ~*(void *)(v12 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_58;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v12 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v13 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v12 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(_OWORD *)(*(void *)(v7 + 48) + 16 * v13) = v39;
      *(void *)(*(void *)(v7 + 56) + 8 * v13) = v19;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_57:
  uint64_t *v3 = v7;
  return result;
}

{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  Swift::UInt v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  void *v32;

  v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<ProtocolDescriptor, [Any.Type]>);
  uint64_t result = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    BOOL v32 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    unint64_t v31 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        int64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        uint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v20 >= v31) {
          goto LABEL_33;
        }
        Swift::UInt8 v21 = v32[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v31) {
            goto LABEL_33;
          }
          Swift::UInt8 v21 = v32[v8];
          if (!v21)
          {
            uint64_t v22 = v20 + 2;
            if (v22 >= v31)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              char v30 = 1 << *(unsigned char *)(v5 + 32);
              if (v30 >= 64) {
                bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *BOOL v32 = -1 << v30;
              }
              v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            Swift::UInt8 v21 = v32[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v31) {
                  goto LABEL_33;
                }
                Swift::UInt8 v21 = v32[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v11 = (v21 - 1) & v21;
        uint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      uint64_t v27 = 8 * v19;
      unint64_t v28 = *(void *)(*(void *)(v5 + 48) + v27);
      unint64_t v29 = *(void *)(*(void *)(v5 + 56) + v27);
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      Hasher.init(_seed:)();
      Hasher._combine(_:)(v28);
      uint64_t result = Hasher._finalize()();
      unint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        int64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        int v23 = 0;
        Swift::UInt v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v25 = v15 == v24;
          if (v15 == v24) {
            unint64_t v15 = 0;
          }
          v23 |= v25;
          int v26 = *(void *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        int64_t v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      unint64_t v17 = 8 * v16;
      *(void *)(*(void *)(v7 + 48) + v17) = v28;
      *(void *)(*(void *)(v7 + 56) + v17) = v29;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  uint64_t *v3 = v7;
  return result;
}

uint64_t TypeMetadata._resolve(_:)()
{
  if (one-time initialization token for typeCache != -1) {
    swift_once();
  }
  MEMORY[0x270FA5388]();
  uint64_t v1 = (uint64_t *)&v0[4];
  uint64_t v2 = v0 + 6;
  os_unfair_lock_lock(v0 + 6);
  closure #1 in TypeCache.getOrInsert(_:from:)partial apply(v1, &v4);
  os_unfair_lock_unlock(v2);
  return v4;
}

unint64_t closure #1 in TypeCache.getOrInsert(_:from:)partial apply@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return partial apply for closure #1 in TypeCache.getOrInsert(_:from:)(a1, a2);
}

unint64_t partial apply for closure #1 in TypeCache.getOrInsert(_:from:)@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return closure #1 in TypeCache.getOrInsert(_:from:)(a1, *(Swift::UInt8 **)(v2 + 16), *(unsigned __int8 **)(v2 + 24), *(unsigned char **)(v2 + 32), *(uint64_t **)(v2 + 40), a2);
}

unint64_t closure #1 in TypeCache.getOrInsert(_:from:)@<X0>(uint64_t *a1@<X0>, Swift::UInt8 *a2@<X1>, unsigned __int8 *a3@<X2>, unsigned char *a4@<X3>, uint64_t *a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v12 = *a1;
  if (*(void *)(*a1 + 16) && (unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3), (v14 & 1) != 0))
  {
    uint64_t TypeByMangledNameInContext = *(void *)(*(void *)(v12 + 56) + 8 * result);
  }
  else
  {
    getSymbolicMangledNameLength(_:)(a4);
    TypeMetadata.descriptor.getter(a5);
    TypeMetadata.genericArguments.getter(a5);
    uint64_t TypeByMangledNameInContext = swift_getTypeByMangledNameInContext();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v17 = *a1;
    *a1 = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(TypeByMangledNameInContext, a2, a3, isUniquelyReferenced_nonNull_native);
    *a1 = v17;
    unint64_t result = swift_bridgeObjectRelease();
  }
  *a6 = TypeByMangledNameInContext;
  return result;
}

uint64_t TypeMetadata.descriptor.getter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 <= 0x7FF)
  {
    if ((unint64_t)(v2 - 513) < 2)
    {
      swift_getKeyPath();
      uint64_t v3 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
      char v5 = v4;
      swift_release();
      if ((v5 & 1) == 0) {
        return *(uint64_t *)((char *)a1 + v3);
      }
      __break(1u);
    }
    if (v2 != 512) {
      goto LABEL_8;
    }
    swift_getKeyPath();
    uint64_t v3 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
    char v7 = v6;
    swift_release();
    if (v7)
    {
      __break(1u);
      goto LABEL_8;
    }
    return *(uint64_t *)((char *)a1 + v3);
  }
LABEL_8:
  swift_getKeyPath();
  uint64_t v3 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  char v9 = v8;
  uint64_t result = swift_release();
  if ((v9 & 1) == 0) {
    return *(uint64_t *)((char *)a1 + v3);
  }
  __break(1u);
  return result;
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, Swift::UInt8 *a2, unsigned __int8 *a3, char a4)
{
  char v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)specialized _NativeDictionary.copy()();
LABEL_7:
    int64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      *(void *)(v18[7] + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v20 = (Swift::UInt8 **)(v18[6] + 16 * v12);
    Swift::UInt8 *v20 = a2;
    v20[1] = a3;
    *(void *)(v18[7] + 8 * v12) = a1;
    uint64_t v21 = v18[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (!v22)
    {
      v18[2] = v23;
      return result;
    }
    goto LABEL_14;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(result, a4 & 1);
  uint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  if ((v16 & 1) == (v19 & 1))
  {
    unint64_t v12 = result;
    int64_t v18 = (void *)*v5;
    if (v16) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(Swift::UInt8 *a1, unsigned __int8 *a2)
{
  Hasher.init(_seed:)();
  TypeCache.Key.hash(into:)((uint64_t)v6, a1, (Swift::UInt)a2);
  Swift::Int v4 = Hasher._finalize()();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

void TypeCache.Key.hash(into:)(uint64_t a1, Swift::UInt8 *a2, Swift::UInt a3)
{
  Swift::UInt8 v3 = *a2;
  if (!*a2)
  {
    Hasher._combine(_:)(0);
    return;
  }
  char v5 = a2;
  int v6 = 0;
  do
  {
    char v8 = v5 + 1;
    if (v3 > 0x70u)
    {
      if (v3 == 120) {
        int v9 = 1;
      }
      else {
        int v9 = v6;
      }
      if (v3 == 113) {
        int v6 = 1;
      }
      else {
        int v6 = v9;
      }
    }
    else
    {
      if (v3 == 1)
      {
        Swift::UInt v7 = (Swift::UInt)&v8[*(int *)(v5 + 1)];
LABEL_4:
        Hasher._combine(_:)(v7);
        char v8 = v5 + 5;
        goto LABEL_5;
      }
      if (v3 == 2)
      {
        Swift::UInt v7 = *(void *)&v8[*(int *)(v5 + 1)];
        goto LABEL_4;
      }
    }
    Hasher._combine(_:)(v3);
LABEL_5:
    Swift::UInt8 v3 = *v8;
    char v5 = v8;
  }
  while (*v8);
  Hasher._combine(_:)(0);
  if (v6) {
    Hasher._combine(_:)(a3);
  }
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t result = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = ~v5;
LABEL_4:
    char v8 = (unsigned __int8 **)(*(void *)(v3 + 48) + 16 * result);
    int v9 = *v8;
    if (**v8 != *a1) {
      goto LABEL_3;
    }
    if (!*a1) {
      return result;
    }
    char v10 = 0;
    char v11 = v8[1];
    int v12 = *a1;
    uint64_t v13 = a1;
    while (1)
    {
      BOOL v14 = (int *)(v13 + 1);
      unint64_t v15 = (int *)(v9 + 1);
      if (v12 > 112)
      {
        if (v12 == 120) {
          char v10 = 1;
        }
        if (v12 == 113) {
          char v10 = 1;
        }
      }
      else
      {
        if (v12 == 1)
        {
          if ((char *)v15 + *v15 != (char *)v14 + *v14) {
            goto LABEL_3;
          }
          goto LABEL_18;
        }
        if (v12 == 2)
        {
          if (*(void *)((char *)v15 + *v15) != *(void *)((char *)v14 + *v14)) {
            goto LABEL_3;
          }
LABEL_18:
          v9 += 5;
          v13 += 5;
          goto LABEL_19;
        }
      }
      ++v13;
      ++v9;
LABEL_19:
      int v12 = *v9;
      if (v12 != *v13) {
        goto LABEL_3;
      }
      if (!*v9)
      {
        if ((v10 & (v11 != a2)) == 0) {
          return result;
        }
LABEL_3:
        unint64_t result = (result + 1) & v7;
        if (((*(void *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) == 0) {
          return result;
        }
        goto LABEL_4;
      }
    }
  }
  return result;
}

uint64_t getSymbolicMangledNameLength(_:)(unsigned char *a1)
{
  int v1 = *a1;
  uint64_t v2 = a1;
  if (*a1)
  {
    uint64_t v2 = a1;
    do
    {
      unsigned int v3 = v1 - 24;
      if ((v1 - 32) < 0xFFFFFFF8) {
        uint64_t v4 = 1;
      }
      else {
        uint64_t v4 = 9;
      }
      if (v3 >= 0xFFFFFFE9) {
        uint64_t v4 = 5;
      }
      v2 += v4;
      int v1 = *v2;
    }
    while (*v2);
  }
  return v2 - a1;
}

void *TypeMetadata.genericArguments.getter(void *a1)
{
  if ((unint64_t)(*a1 - 512) >= 3)
  {
    unsigned int v3 = (_DWORD *)ClassMetadata.descriptor.getter((uint64_t)a1);
    uint64_t v2 = ClassDescriptor.genericArgumentOffset.getter(v3);
  }
  else
  {
    uint64_t v2 = 2;
  }
  return &a1[v2];
}

void closure #1 in closure #1 in variable initialization expression of typeCache()
{
}

void one-time initialization function for typeCache()
{
  unint64_t v0 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<[TypeCache.Key : Metadata?], os_unfair_lock_s>);
  uint64_t v1 = swift_allocObject();
  *(_DWORD *)(v1 + 24) = 0;
  *(void *)(v1 + 16) = v0;
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 24));
  closure #1 in closure #1 in variable initialization expression of typeCache();
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 24));
  typeCache = v1;
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

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<TypeCache.Key, Metadata?>);
    unsigned int v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
    for (i = (void *)(a1 + 48); ; i += 3)
    {
      uint64_t v5 = *i;
      long long v11 = *((_OWORD *)i - 1);
      unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)((Swift::UInt8 *)*(i - 2), (unsigned __int8 *)*(i - 1));
      if (v7) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_OWORD *)(v3[6] + 16 * result) = v11;
      *(void *)(v3[7] + 8 * result) = v5;
      uint64_t v8 = v3[2];
      BOOL v9 = __OFADD__(v8, 1);
      uint64_t v10 = v8 + 1;
      if (v9) {
        goto LABEL_10;
      }
      v3[2] = v10;
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

{
  uint64_t v1;
  void *v3;
  unint64_t result;
  char v5;
  long long *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  long long v11;
  char v12;
  long long v13;

  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<ProtocolDescriptor, [Any.Type]>);
  unsigned int v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v13 = *(_OWORD *)(a1 + 32);
  unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(*(void *)(a1 + 32));
  if (v5)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  int v6 = (long long *)(a1 + 48);
  char v7 = v1 - 1;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v13;
    *(void *)(v3[7] + 8 * result) = *((void *)&v13 + 1);
    uint64_t v8 = v3[2];
    BOOL v9 = __OFADD__(v8, 1);
    uint64_t v10 = v8 + 1;
    if (v9) {
      break;
    }
    v3[2] = v10;
    if (!v7) {
      goto LABEL_8;
    }
    long long v11 = *v6++;
    uint64_t v13 = v11;
    swift_bridgeObjectRetain();
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v11);
    --v7;
    if (v12) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for RelativeDirectPointer()
{
  return __swift_instantiateGenericMetadata();
}

ValueMetadata *type metadata accessor for StructDescriptor()
{
  return &type metadata for StructDescriptor;
}

ValueMetadata *type metadata accessor for Metadata()
{
  return &type metadata for Metadata;
}

uint64_t MangledTypeReference.standardSubstitution.getter(unsigned __int8 *a1)
{
  int v1 = a1[1];
  if (!a1[1] || a1[2]) {
    return 0;
  }
  int v3 = *a1;
  if (v3 == 121)
  {
    if (v1 == 112) {
      return MEMORY[0x263F8EE58] + 8;
    }
    return 0;
  }
  if (v3 != 83) {
    return 0;
  }
  uint64_t result = MEMORY[0x263F8D4F8];
  switch(v1)
  {
    case 'J':
      uint64_t result = MEMORY[0x263F8D120];
      break;
    case 'O':
      uint64_t result = MEMORY[0x263F8D1F0];
      break;
    case 'S':
      uint64_t result = MEMORY[0x263F8D310];
      break;
    case 'V':
      uint64_t result = MEMORY[0x263F8D3D0];
      break;
    case 'W':
      uint64_t result = MEMORY[0x263F8D3E8];
      break;
    case 'b':
      return result;
    case 'd':
      uint64_t result = MEMORY[0x263F8D538];
      break;
    case 'f':
      uint64_t result = MEMORY[0x263F8D5C8];
      break;
    case 'i':
      uint64_t result = MEMORY[0x263F8D6C8];
      break;
    case 's':
      uint64_t result = MEMORY[0x263F8D980];
      break;
    case 'u':
      uint64_t result = MEMORY[0x263F8D9D0];
      break;
    case 'v':
      uint64_t result = MEMORY[0x263F8DA28];
      break;
    case 'w':
      uint64_t result = MEMORY[0x263F8DA40];
      break;
    default:
      return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ClassDescriptor()
{
  return &type metadata for ClassDescriptor;
}

ValueMetadata *type metadata accessor for TypeCache.Key()
{
  return &type metadata for TypeCache.Key;
}

unint64_t GenericSignature.packShapeHeader.getter(unsigned __int16 *a1)
{
  unsigned __int16 v1 = a1[3];
  if (v1) {
    uint64_t v2 = *(unsigned int *)((char *)&a1[6 * a1[1] + 4] + (-*a1 & 3) + *a1);
  }
  else {
    uint64_t v2 = 0;
  }
  return v2 | ((unint64_t)((v1 & 1) == 0) << 32);
}

ValueMetadata *type metadata accessor for EnumDescriptor()
{
  return &type metadata for EnumDescriptor;
}

ValueMetadata *type metadata accessor for Metadata.AccessFunction()
{
  return &type metadata for Metadata.AccessFunction;
}

ValueMetadata *type metadata accessor for ContextDescriptor()
{
  return &type metadata for ContextDescriptor;
}

ValueMetadata *type metadata accessor for ContextDescriptor.Flags()
{
  return &type metadata for ContextDescriptor.Flags;
}

ValueMetadata *type metadata accessor for FieldDescriptor.Element.Flags()
{
  return &type metadata for FieldDescriptor.Element.Flags;
}

ValueMetadata *type metadata accessor for GenericSignature.ParameterDescriptor()
{
  return &type metadata for GenericSignature.ParameterDescriptor;
}

uint64_t type metadata accessor for RelativeIndirectablePointer()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t lazy protocol witness table accessor for type TypeCache.Key and conformance TypeCache.Key()
{
  unint64_t result = lazy protocol witness table cache variable for type TypeCache.Key and conformance TypeCache.Key;
  if (!lazy protocol witness table cache variable for type TypeCache.Key and conformance TypeCache.Key)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TypeCache.Key and conformance TypeCache.Key);
  }
  return result;
}

void type metadata accessor for os_unfair_lock_s()
{
  if (!lazy cache variable for type metadata for os_unfair_lock_s)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for os_unfair_lock_s);
    }
  }
}

uint64_t initializeProtocolConformanceLookup()
{
}

uint64_t anonymous namespace'::addImageCallback<&anonymous namespace'::TextSegment,&anonymous namespace'::ProtocolConformancesSection,(_dyld_section_location_kind)1,&(addImageProtocolConformanceBlockCallbackUnsafe)>(_DWORD *a1)
{
  if (*a1 != -17958193) {
  uint64_t result = _dyld_lookup_section_info();
  }
  if (result)
  {
    return addImageProtocolConformanceBlockCallbackUnsafe((uint64_t)a1);
  }
  return result;
}

uint64_t ValueWitnessTable.discriminator.getter()
{
  return 11839;
}

uint64_t protocol witness for SignedLayout.discriminator.getter in conformance ValueWitnessTable()
{
  return 11839;
}

uint64_t protocol witness for SignedLayout.ptr.getter in conformance ValueWitnessTable()
{
  return *(void *)v0;
}

uint64_t protocol witness for SignedLayout.init(_:) in conformance ValueWitnessTable@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t ValueWitnessTable.initializeBufferWithCopyOfBuffer(_:_:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return ValueWitnessTable.initializeBufferWithCopyOfBuffer(_:_:)(a1, a2, a3, (uint64_t)&unk_25B64BED0, UnsafeRawPointer.signedVWTInitializeBufferWithCopyOfBuffer.getter);
}

uint64_t ValueWitnessTable.destroy(_:)(uint64_t a1, uint64_t *a2)
{
  swift_getKeyPath();
  uint64_t v4 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  uint64_t v5 = *a2;
  swift_release();
  int v6 = (uint64_t (*)(uint64_t, uint64_t *))UnsafeRawPointer.signedVWTDestroy.getter(v5 + v4);

  return v6(a1, a2 + 1);
}

uint64_t ValueWitnessTable.initializeWithCopy(_:_:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return ValueWitnessTable.initializeBufferWithCopyOfBuffer(_:_:)(a1, a2, a3, (uint64_t)&unk_25B64BF10, UnsafeRawPointer.signedVWTInitializeWithCopy.getter);
}

uint64_t ValueWitnessTable.assignWithCopy(_:_:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return ValueWitnessTable.initializeBufferWithCopyOfBuffer(_:_:)(a1, a2, a3, (uint64_t)&unk_25B64BF30, UnsafeRawPointer.signedVWTAssignWithCopy.getter);
}

uint64_t ValueWitnessTable.initializeWithTake(_:_:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return ValueWitnessTable.initializeBufferWithCopyOfBuffer(_:_:)(a1, a2, a3, (uint64_t)&unk_25B64BF50, UnsafeRawPointer.signedVWTInitializeWithTake.getter);
}

uint64_t ValueWitnessTable.assignWithTake(_:_:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return ValueWitnessTable.initializeBufferWithCopyOfBuffer(_:_:)(a1, a2, a3, (uint64_t)&unk_25B64BF70, UnsafeRawPointer.signedVWTAssignWithTake.getter);
}

uint64_t ValueWitnessTable.initializeBufferWithCopyOfBuffer(_:_:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  swift_getKeyPath();
  uint64_t v9 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  uint64_t v10 = *a3;
  swift_release();
  long long v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t *))a5(v10 + v9);

  return v11(a1, a2, a3 + 1);
}

uint64_t ValueWitnessTable.getEnumTagSinglePayload(_:_:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  swift_getKeyPath();
  uint64_t v6 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  uint64_t v7 = *a3;
  swift_release();
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t *))UnsafeRawPointer.signedVWTGetEnumTagSinglePayload.getter(v7 + v6);

  return v8(a1, a2, a3 + 1);
}

uint64_t ValueWitnessTable.storeEnumTagSinglePayload(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  swift_getKeyPath();
  uint64_t v8 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  uint64_t v9 = *a4;
  swift_release();
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t *))UnsafeRawPointer.signedVWTStoreEnumTagSinglePayload.getter(v9 + v8);

  return v10(a1, a2, a3, a4 + 1);
}

uint64_t ValueWitnessTable.size.getter(uint64_t a1)
{
  return *(void *)(*(void *)a1 + 64);
}

uint64_t ValueWitnessTable.stride.getter(uint64_t a1)
{
  return *(void *)(*(void *)a1 + 72);
}

uint64_t ValueWitnessTable.flags.getter(uint64_t a1)
{
  return *(unsigned int *)(*(void *)a1 + 80);
}

uint64_t ValueWitnessTable.extraInhabitantCount.getter(uint64_t a1)
{
  return *(unsigned int *)(*(void *)a1 + 84);
}

BOOL static ValueWitnessTable.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ValueWitnessTable(void *a1, void *a2)
{
  return *a1 == *a2;
}

void ValueWitnessTable.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int ValueWitnessTable.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ValueWitnessTable()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance ValueWitnessTable()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ValueWitnessTable()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type ValueWitnessTable and conformance ValueWitnessTable()
{
  unint64_t result = lazy protocol witness table cache variable for type ValueWitnessTable and conformance ValueWitnessTable;
  if (!lazy protocol witness table cache variable for type ValueWitnessTable and conformance ValueWitnessTable)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ValueWitnessTable and conformance ValueWitnessTable);
  }
  return result;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ValueWitnessTable(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ValueWitnessTable(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)unint64_t result = a2 - 2;
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
      *(void *)unint64_t result = 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ValueWitnessTable()
{
  return &type metadata for ValueWitnessTable;
}

uint64_t BufferView.count.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t BufferView.endAddress.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1 + *(void *)(*(void *)(a3 - 8) + 64) * a2;
}

uint64_t BufferView.startIndex.getter()
{
  return 0;
}

uint64_t BufferView.endIndex.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

Swift::Int __swiftcall BufferView.index(after:)(Swift::Int after)
{
  BOOL v1 = __OFADD__(after, 1);
  Swift::Int result = after + 1;
  if (v1) {
    __break(1u);
  }
  return result;
}

Swift::Int __swiftcall BufferView.index(before:)(Swift::Int before)
{
  BOOL v1 = __OFSUB__(before, 1);
  Swift::Int result = before - 1;
  if (v1) {
    __break(1u);
  }
  return result;
}

uint64_t BufferView.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v5 = *(void *)(*(void *)(a3 - 8) + 64);
  uint64_t result = a1 * v5;
  if ((unsigned __int128)(a1 * (__int128)v5) >> 64 == result >> 63) {
    return UnsafeRawPointer.unprotectedLoad<A>(fromByteOffset:as:)(result, a2, a3, a4);
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:) in conformance BufferView<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9E068](a1, a2, a3, a4, MEMORY[0x263F8D708]);
}

uint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance BufferView<A>()
{
  return MEMORY[0x270F9E050]();
}

uint64_t protocol witness for RandomAccessCollection.distance(from:to:) in conformance BufferView<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9E078](a1, a2, a3, a4, MEMORY[0x263F8D708]);
}

void *protocol witness for BidirectionalCollection.index(before:) in conformance BufferView<A>@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFSUB__(*result, 1)) {
    __break(1u);
  }
  else {
    *a2 = *result - 1;
  }
  return result;
}

void *protocol witness for BidirectionalCollection.formIndex(before:) in conformance BufferView<A>(void *result)
{
  if (__OFSUB__(*result, 1)) {
    __break(1u);
  }
  else {
    --*result;
  }
  return result;
}

uint64_t protocol witness for BidirectionalCollection.index(_:offsetBy:) in conformance BufferView<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D708];

  return MEMORY[0x270F9E068](a1, a2, a3, WitnessTable, v7);
}

uint64_t protocol witness for BidirectionalCollection.index(_:offsetBy:limitedBy:) in conformance BufferView<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F9E050](a1, a2, a3, a4, WitnessTable);
}

uint64_t protocol witness for BidirectionalCollection.distance(from:to:) in conformance BufferView<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D708];

  return MEMORY[0x270F9E078](a1, a2, a3, WitnessTable, v7);
}

void protocol witness for Collection.startIndex.getter in conformance BufferView<A>(void *a1@<X8>)
{
  *a1 = 0;
}

void protocol witness for Collection.endIndex.getter in conformance BufferView<A>(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 8);
}

void (*protocol witness for Collection.subscript.read in conformance BufferView<A>(uint64_t **a1, uint64_t *a2, uint64_t a3))(void *a1)
{
  uint64_t v7 = (uint64_t *)malloc(0x28uLL);
  *a1 = v7;
  v7[4] = BufferView.subscript.read(v7, *a2, *v3, v3[1], *(void *)(a3 + 16));
  return protocol witness for Collection.subscript.read in conformance BufferView<A>;
}

void protocol witness for Collection.subscript.read in conformance BufferView<A>(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t BufferView.subscript.read(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(void *)(a5 - 8);
  *a1 = a5;
  a1[1] = v9;
  int64_t v10 = *(void *)(v9 + 64);
  long long v11 = malloc(v10);
  a1[2] = (uint64_t)v11;
  uint64_t result = a2 * v10;
  if ((unsigned __int128)(a2 * (__int128)v10) >> 64 == (a2 * v10) >> 63)
  {
    UnsafeRawPointer.unprotectedLoad<A>(fromByteOffset:as:)(result, a3, a5, (uint64_t)v11);
    return (uint64_t)BufferView.subscript.read;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t protocol witness for Collection.subscript.getter in conformance BufferView<A>()
{
  return MEMORY[0x270F9E1D0]();
}

uint64_t protocol witness for Collection.indices.getter in conformance BufferView<A>(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v3 = MEMORY[0x263F8D708];

  return MEMORY[0x270F9E070](a1, WitnessTable, v3);
}

uint64_t protocol witness for Collection.isEmpty.getter in conformance BufferView<A>()
{
  return MEMORY[0x270F9E178]();
}

uint64_t protocol witness for Collection.count.getter in conformance BufferView<A>()
{
  return *(void *)(v0 + 8);
}

void protocol witness for Collection._customIndexOfEquatableElement(_:) in conformance BufferView<A>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance BufferView<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return specialized Collection._failEarlyRangeCheck(_:bounds:)(a1, a2, a3, a4, MEMORY[0x263F8D870], MEMORY[0x263F8D170]);
}

{
  return specialized Collection._failEarlyRangeCheck(_:bounds:)(a1, a2, a3, a4, MEMORY[0x263F8D1A0], MEMORY[0x263F8D180]);
}

void *protocol witness for Collection.index(after:) in conformance BufferView<A>@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFADD__(*result, 1)) {
    __break(1u);
  }
  else {
    *a2 = *result + 1;
  }
  return result;
}

void *protocol witness for Collection.formIndex(after:) in conformance BufferView<A>(void *result)
{
  if (__OFADD__(*result, 1)) {
    __break(1u);
  }
  else {
    ++*result;
  }
  return result;
}

void protocol witness for Sequence.makeIterator() in conformance BufferView<A>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = 0;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance BufferView<A>(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F9E108](a1, WitnessTable);
}

uint64_t protocol witness for Sequence._customContainsEquatableElement(_:) in conformance BufferView<A>()
{
  return 2;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance BufferView<A>()
{
  return protocol witness for Sequence._copyToContiguousArray() in conformance BufferView<A>();
}

{
  swift_getWitnessTable();
  return specialized Collection._copyToContiguousArray()();
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance BufferView<A>()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t IndirectBufferView.count.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t IndirectBufferView.startIndex.getter()
{
  return 0;
}

uint64_t IndirectBufferView.endIndex.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

Swift::Int __swiftcall IndirectBufferView.index(after:)(Swift::Int after)
{
  BOOL v1 = __OFADD__(after, 1);
  Swift::Int result = after + 1;
  if (v1) {
    __break(1u);
  }
  return result;
}

Swift::Int __swiftcall IndirectBufferView.index(before:)(Swift::Int before)
{
  BOOL v1 = __OFSUB__(before, 1);
  Swift::Int result = before - 1;
  if (v1) {
    __break(1u);
  }
  return result;
}

uint64_t IndirectBufferView.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a5 + 24))(a2 + *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64) * a1, a4, a5);
}

uint64_t base witness table accessor for BidirectionalCollection in BufferView<A>()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Collection.Indices : RandomAccessCollection in BufferView<A>()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>);
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

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in BufferView<A>()
{
  return swift_getWitnessTable();
}

uint64_t base witness table accessor for Collection in BufferView<A>()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Collection.Indices : BidirectionalCollection in BufferView<A>()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in BufferView<A>()
{
  return swift_getWitnessTable();
}

uint64_t base witness table accessor for Sequence in BufferView<A>()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Collection.Index : Comparable in BufferView<A>()
{
  return MEMORY[0x263F8D6E0];
}

uint64_t associated type witness table accessor for Collection.Indices : Collection in BufferView<A>()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>);
}

uint64_t lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Range<Int>);
    lazy protocol witness table accessor for type Int and conformance Int();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in BufferView<A>()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in BufferView<A>()
{
  return swift_getWitnessTable();
}

uint64_t base witness table accessor for BidirectionalCollection in IndirectBufferView<A>()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in IndirectBufferView<A>()
{
  return swift_getWitnessTable();
}

uint64_t base witness table accessor for Collection in IndirectBufferView<A>()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in IndirectBufferView<A>()
{
  return swift_getWitnessTable();
}

uint64_t protocol witness for BidirectionalCollection.index(_:offsetBy:) in conformance IndirectBufferView<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D708];

  return MEMORY[0x270F9E068](a1, a2, a3, WitnessTable, v7);
}

uint64_t protocol witness for BidirectionalCollection.index(_:offsetBy:limitedBy:) in conformance IndirectBufferView<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F9E050](a1, a2, a3, a4, WitnessTable);
}

uint64_t protocol witness for BidirectionalCollection.distance(from:to:) in conformance IndirectBufferView<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v7 = MEMORY[0x263F8D708];

  return MEMORY[0x270F9E078](a1, a2, a3, WitnessTable, v7);
}

uint64_t base witness table accessor for Sequence in IndirectBufferView<A>()
{
  return swift_getWitnessTable();
}

uint64_t (*protocol witness for Collection.subscript.read in conformance IndirectBufferView<A>(void *a1, uint64_t *a2, uint64_t a3))()
{
  uint64_t v6 = *(void *)(a3 + 16);
  *a1 = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  a1[1] = v7;
  a1[2] = malloc(*(void *)(v7 + 64));
  uint64_t v8 = *a2;
  uint64_t v9 = *v3;
  uint64_t v10 = *(void *)(a3 + 24);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 24))(v9 + *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64) * v8, v6, v10);
  return BufferView.subscript.read;
}

void BufferView.subscript.read(void *a1)
{
  BOOL v1 = (void *)a1[2];
  (*(void (**)(void *, void))(a1[1] + 8))(v1, *a1);

  free(v1);
}

uint64_t protocol witness for Collection.indices.getter in conformance IndirectBufferView<A>(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v3 = MEMORY[0x263F8D708];

  return MEMORY[0x270F9E070](a1, WitnessTable, v3);
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance IndirectBufferView<A>(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270F9E108](a1, WitnessTable);
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance IndirectBufferView<A>()
{
  return protocol witness for Sequence._copyToContiguousArray() in conformance BufferView<A>();
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance BufferView<A>(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x261164C50](a1, a2);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t type metadata accessor for BufferView()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata instantiation function for IndirectBufferView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t getEnumTagSinglePayload for BufferView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 16)) {
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

uint64_t storeEnumTagSinglePayload for BufferView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    if (a3 >= 2) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)__n128 result = 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for IndirectBufferView()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t specialized Collection._failEarlyRangeCheck(_:bounds:)(uint64_t a1, uint64_t a2)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v5 = type metadata accessor for Range();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  long long v11 = (char *)v17 - v10;
  v17[1] = AssociatedConformanceWitness;
  LOBYTE(AssociatedConformanceWitness) = dispatch thunk of static Comparable.<= infix(_:_:)();
  int v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v12(v11, a1, v5);
  v12(v9, a2, v5);
  if ((AssociatedConformanceWitness & 1) == 0)
  {
    char v16 = *(void (**)(char *, uint64_t))(v6 + 8);
    v16(v9, v5);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v16)(v11, v5);
    goto LABEL_5;
  }
  char v13 = dispatch thunk of static Comparable.<= infix(_:_:)();
  BOOL v14 = *(void (**)(char *, uint64_t))(v6 + 8);
  v14(v9, v5);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v14)(v11, v5);
  if ((v13 & 1) == 0) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t specialized Collection._failEarlyRangeCheck(_:bounds:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, uint64_t, uint64_t), uint64_t (*a6)(char *, char *, uint64_t, uint64_t))
{
  uint64_t v23 = a6;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v11 = a5(0, AssociatedTypeWitness, AssociatedConformanceWitness);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  unint64_t v15 = (char *)&v22 - v14;
  uint64_t v16 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](v13);
  int64_t v18 = (char *)&v22 - v17;
  char v19 = dispatch thunk of static Comparable.<= infix(_:_:)();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a1, AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, a2, v11);
  if ((v19 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, AssociatedTypeWitness);
    goto LABEL_5;
  }
  char v20 = v23(v18, &v15[*(int *)(v11 + 36)], AssociatedTypeWitness, AssociatedConformanceWitness);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, AssociatedTypeWitness);
  if ((v20 & 1) == 0) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t specialized Collection._copyToContiguousArray()()
{
  return MEMORY[0x270F9FA60]();
}

uint64_t BoxPair.buffer.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t swift_projectBox(_:)()
{
  uint64_t result = swift_projectBox();
  if (!result) {
    __break(1u);
  }
  return result;
}

uint64_t swift_deallocBox(_:)()
{
  return MEMORY[0x270FA0220]();
}

ValueMetadata *type metadata accessor for BoxPair()
{
  return &type metadata for BoxPair;
}

BOOL ExistentialMetadata.isClassConstrained.getter(uint64_t a1)
{
  return *(_DWORD *)(a1 + 8) >= 0;
}

uint64_t ExistentialMetadata.superclass.getter(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 11) & 0x40) != 0) {
    return *(void *)(a1 + 16);
  }
  else {
    return 0;
  }
}

uint64_t ExistentialMetadata.protocols.getter(uint64_t a1)
{
  uint64_t v1 = 24;
  if ((*(unsigned char *)(a1 + 11) & 0x40) == 0) {
    uint64_t v1 = 16;
  }
  return a1 + v1;
}

BOOL static ExistentialMetadata.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void ExistentialMetadata.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int ExistentialMetadata.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type ExistentialMetadata and conformance ExistentialMetadata()
{
  unint64_t result = lazy protocol witness table cache variable for type ExistentialMetadata and conformance ExistentialMetadata;
  if (!lazy protocol witness table cache variable for type ExistentialMetadata and conformance ExistentialMetadata)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExistentialMetadata and conformance ExistentialMetadata);
  }
  return result;
}

ValueMetadata *type metadata accessor for ExistentialMetadata()
{
  return &type metadata for ExistentialMetadata;
}

uint64_t ExtensionDescriptor.extendedContext.getter(uint64_t a1)
{
  swift_getKeyPath();
  uint64_t v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_getAtKeyPath();
  swift_release();
  return a1 + v2 + v4;
}

unsigned char *ExtensionDescriptor.genericSignature.getter(char *a1)
{
  char v2 = *a1;
  unint64_t result = a1 + 12;
  if ((v2 & 0x80) == 0) {
    return 0;
  }
  return result;
}

BOOL static ExtensionDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void ExtensionDescriptor.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int ExtensionDescriptor.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type ExtensionDescriptor and conformance ExtensionDescriptor()
{
  unint64_t result = lazy protocol witness table cache variable for type ExtensionDescriptor and conformance ExtensionDescriptor;
  if (!lazy protocol witness table cache variable for type ExtensionDescriptor and conformance ExtensionDescriptor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExtensionDescriptor and conformance ExtensionDescriptor);
  }
  return result;
}

ValueMetadata *type metadata accessor for ExtensionDescriptor()
{
  return &type metadata for ExtensionDescriptor;
}

uint64_t MetatypeMetadata.instanceMetadata.getter(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

BOOL static MetatypeMetadata.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void MetatypeMetadata.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int MetatypeMetadata.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type MetatypeMetadata and conformance MetatypeMetadata()
{
  unint64_t result = lazy protocol witness table cache variable for type MetatypeMetadata and conformance MetatypeMetadata;
  if (!lazy protocol witness table cache variable for type MetatypeMetadata and conformance MetatypeMetadata)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MetatypeMetadata and conformance MetatypeMetadata);
  }
  return result;
}

ValueMetadata *type metadata accessor for MetatypeMetadata()
{
  return &type metadata for MetatypeMetadata;
}

uint64_t ExtendedExistentialMetadata.shape.getter(uint64_t a1)
{
  swift_getKeyPath();
  uint64_t result = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  if (v3)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = result;
    swift_release();
    return *(void *)(a1 + v4);
  }
  return result;
}

BOOL static ExtendedExistentialMetadata.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void ExtendedExistentialMetadata.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int ExtendedExistentialMetadata.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type ExtendedExistentialMetadata and conformance ExtendedExistentialMetadata()
{
  unint64_t result = lazy protocol witness table cache variable for type ExtendedExistentialMetadata and conformance ExtendedExistentialMetadata;
  if (!lazy protocol witness table cache variable for type ExtendedExistentialMetadata and conformance ExtendedExistentialMetadata)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExtendedExistentialMetadata and conformance ExtendedExistentialMetadata);
  }
  return result;
}

ValueMetadata *type metadata accessor for ExtendedExistentialMetadata()
{
  return &type metadata for ExtendedExistentialMetadata;
}

uint64_t FieldDescriptor.Element.flags.getter(unsigned int *a1)
{
  return *a1;
}

uint64_t FieldDescriptor.Element.typeRef.getter(uint64_t a1)
{
  swift_getKeyPath();
  uint64_t v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_getAtKeyPath();
  swift_release();
  return a1 + v2 + v4;
}

uint64_t FieldDescriptor.Element.referenceOwnership.getter(uint64_t a1)
{
  swift_getKeyPath();
  uint64_t v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_getAtKeyPath();
  swift_release();
  uint64_t v3 = MangledTypeReference.length.getter((unsigned char *)(a1 + v2 + v9));
  if (v3 >= 3)
  {
    uint64_t v4 = v3;
    swift_getKeyPath();
    uint64_t v5 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
    swift_getAtKeyPath();
    swift_release();
    if (*(unsigned char *)(v4 + a1 + v5 + v9 - 2) == 88)
    {
      swift_getKeyPath();
      uint64_t v6 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
      swift_getAtKeyPath();
      swift_release();
      int v7 = *(unsigned __int8 *)(v4 + a1 + v6 + v9 - 1);
      switch(v7)
      {
        case 'o':
          return 2;
        case 'w':
          return 1;
        case 'u':
          return 4;
      }
    }
  }
  return 0;
}

uint64_t FieldDescriptor.Element.name.getter()
{
  return String.init(cString:)();
}

uint64_t FieldDescriptor.startIndex.getter()
{
  return 0;
}

uint64_t FieldDescriptor.endIndex.getter(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

Swift::Int __swiftcall FieldDescriptor.index(after:)(Swift::Int after)
{
  return after + 1;
}

Swift::Int __swiftcall FieldDescriptor.index(before:)(Swift::Int before)
{
  return before - 1;
}

void *protocol witness for BidirectionalCollection.index(before:) in conformance FieldDescriptor@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result - 1;
  return result;
}

void *protocol witness for BidirectionalCollection.formIndex(before:) in conformance FieldDescriptor(void *result)
{
  return result;
}

void protocol witness for Collection.endIndex.getter in conformance FieldDescriptor(void *a1@<X8>)
{
  *a1 = *(unsigned int *)(*(void *)v1 + 12);
}

uint64_t (*protocol witness for Collection.subscript.read in conformance FieldDescriptor(uint64_t (*result)(), unint64_t *a2))()
{
  unint64_t v3 = *a2;
  if ((*a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(unsigned int *)(*(void *)v2 + 12))
  {
    *(void *)unint64_t result = *(void *)v2 + 12 * v3 + 16;
    return protocol witness for Collection.subscript.read in conformance FieldDescriptor;
  }
  __break(1u);
  return result;
}

void *protocol witness for Collection.subscript.getter in conformance FieldDescriptor@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if ((*result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = result[1];
    uint64_t v4 = *v2;
    if (v3 <= *(unsigned int *)(*v2 + 12))
    {
      *a2 = *result;
      a2[1] = v3;
      a2[2] = v4;
      return result;
    }
  }
  __break(1u);
  return result;
}

void protocol witness for Collection.indices.getter in conformance FieldDescriptor(void *a1@<X8>)
{
  uint64_t v2 = *(unsigned int *)(*(void *)v1 + 12);
  *a1 = 0;
  a1[1] = v2;
}

BOOL protocol witness for Collection.isEmpty.getter in conformance FieldDescriptor()
{
  return *(_DWORD *)(*(void *)v0 + 12) == 0;
}

void *protocol witness for RandomAccessCollection.index(_:offsetBy:) in conformance FieldDescriptor@<X0>(void *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  unint64_t v4 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else if (v4 <= *(unsigned int *)(*(void *)v3 + 12))
  {
    *a3 = v4;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance FieldDescriptor@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t result = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3, *v4);
  *(void *)a4 = result;
  *(unsigned char *)(a4 + 8) = v7 & 1;
  return result;
}

unint64_t *protocol witness for RandomAccessCollection.distance(from:to:) in conformance FieldDescriptor(unint64_t *result, unint64_t *a2)
{
  unint64_t v3 = *a2;
  unint64_t v4 = *(unsigned int *)(*(void *)v2 + 12);
  if (*result <= v4 && v3 <= v4) {
    return (unint64_t *)(v3 - *result);
  }
  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance FieldDescriptor(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = a2[1];
  if (*result >= *a2)
  {
    BOOL v5 = __OFSUB__(v2, v3);
    BOOL v4 = v2 - v3 < 0;
  }
  else
  {
    BOOL v5 = 0;
    BOOL v4 = 0;
  }
  if (v4 == v5) {
    __break(1u);
  }
  return result;
}

void *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance FieldDescriptor(void *result, void *a2)
{
  if (*result < *a2 || a2[1] < *result) {
    __break(1u);
  }
  return result;
}

{
  if (*result < *a2 || a2[1] < result[1]) {
    __break(1u);
  }
  return result;
}

void *protocol witness for Collection.index(after:) in conformance FieldDescriptor@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result + 1;
  return result;
}

void *protocol witness for Collection.formIndex(after:) in conformance FieldDescriptor(void *result)
{
  return result;
}

void protocol witness for Sequence.makeIterator() in conformance FieldDescriptor(void *a1@<X8>)
{
  *a1 = *v1;
  a1[1] = 0;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance FieldDescriptor()
{
  return *(unsigned int *)(*(void *)v0 + 12);
}

void *protocol witness for Sequence._copyToContiguousArray() in conformance FieldDescriptor()
{
  return specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
}

void *protocol witness for Sequence._copyContents(initializing:) in conformance FieldDescriptor(void *a1, void *a2, uint64_t a3)
{
  return specialized Sequence._copyContents(initializing:)(a1, a2, a3, *v3);
}

BOOL static FieldDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void FieldDescriptor.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int FieldDescriptor.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type FieldDescriptor and conformance FieldDescriptor()
{
  unint64_t result = lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor;
  if (!lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor;
  if (!lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor;
  if (!lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor;
  if (!lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor;
  if (!lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FieldDescriptor and conformance FieldDescriptor);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in FieldDescriptor()
{
  return lazy protocol witness table accessor for type Slice<FieldDescriptor> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<FieldDescriptor> and conformance <> Slice<A>, (void (*)(void))lazy protocol witness table accessor for type FieldDescriptor and conformance FieldDescriptor);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in FieldDescriptor()
{
  return lazy protocol witness table accessor for type Slice<FieldDescriptor> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<FieldDescriptor> and conformance <> Slice<A>, (void (*)(void))lazy protocol witness table accessor for type FieldDescriptor and conformance FieldDescriptor);
}

uint64_t lazy protocol witness table accessor for type Slice<FieldDescriptor> and conformance <> Slice<A>(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Slice<FieldDescriptor>);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in FieldDescriptor()
{
  return lazy protocol witness table accessor for type Slice<FieldDescriptor> and conformance Slice<A>(&lazy protocol witness table cache variable for type Slice<FieldDescriptor> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<FieldDescriptor>);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in FieldDescriptor()
{
  return lazy protocol witness table accessor for type Slice<FieldDescriptor> and conformance Slice<A>(&lazy protocol witness table cache variable for type IndexingIterator<FieldDescriptor> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<FieldDescriptor>);
}

uint64_t lazy protocol witness table accessor for type Slice<FieldDescriptor> and conformance Slice<A>(unint64_t *a1, uint64_t *a2)
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

ValueMetadata *type metadata accessor for FieldDescriptor()
{
  return &type metadata for FieldDescriptor;
}

ValueMetadata *type metadata accessor for FieldDescriptor.Element()
{
  return &type metadata for FieldDescriptor.Element;
}

uint64_t RelativeDirectPointerIntPair.intMask.getter()
{
  return 3;
}

BOOL RelativeDirectPointerIntPair.BOOL.getter(char a1)
{
  return (a1 & 3) != 0;
}

uint64_t RelativeDirectPointerIntPair.int.getter()
{
  return dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
}

uint64_t RelativeDirectPointerIntPair.address(from:)(uint64_t a1, int a2)
{
  return a1 + (int)(a2 & 0xFFFFFFFC);
}

uint64_t protocol witness for RelativePointer.offset.getter in conformance RelativeDirectPointerIntPair<A, B>()
{
  return *v0;
}

uint64_t protocol witness for RelativePointer.address(from:) in conformance RelativeDirectPointerIntPair<A, B>(uint64_t a1)
{
  return RelativeDirectPointerIntPair.address(from:)(a1, *v1);
}

uint64_t type metadata instantiation function for RelativeDirectPointerIntPair(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t type metadata accessor for RelativeDirectPointerIntPair()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t TypeMetadata.resolve(_:)(unsigned __int8 *a1)
{
  uint64_t result = MangledTypeReference.standardSubstitution.getter(a1);
  if (!result)
  {
    if (one-time initialization token for typeCache != -1) {
      uint64_t result = swift_once();
    }
    MEMORY[0x270FA5388](result);
    uint64_t v3 = (uint64_t *)&v2[4];
    BOOL v4 = v2 + 6;
    os_unfair_lock_lock(v2 + 6);
    partial apply for closure #1 in TypeCache.getOrInsert(_:from:)(v3, &v5);
    os_unfair_lock_unlock(v4);
    return v5;
  }
  return result;
}

{
  uint64_t result;
  os_unfair_lock_s *v2;
  uint64_t *v3;
  os_unfair_lock_s *v4;
  uint64_t v5;

  uint64_t result = MangledTypeReference.standardSubstitution.getter(a1);
  if (!result)
  {
    if (one-time initialization token for typeCache != -1) {
      uint64_t result = swift_once();
    }
    MEMORY[0x270FA5388](result);
    uint64_t v3 = (uint64_t *)&v2[4];
    BOOL v4 = v2 + 6;
    os_unfair_lock_lock(v2 + 6);
    closure #1 in TypeCache.getOrInsert(_:from:)partial apply(v3, &v5);
    os_unfair_lock_unlock(v4);
    return v5;
  }
  return result;
}

uint64_t TypeMetadata._resolve(_:)(uint64_t a1)
{
  if (one-time initialization token for typeCache != -1) {
    a1 = swift_once();
  }
  MEMORY[0x270FA5388](a1);
  uint64_t v2 = (uint64_t *)&v1[4];
  uint64_t v3 = v1 + 6;
  os_unfair_lock_lock(v1 + 6);
  closure #1 in TypeCache.getOrInsert(_:from:)partial apply(v2, &v5);
  os_unfair_lock_unlock(v3);
  return v5;
}

BOOL static TypeMetadata.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void TypeMetadata.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int TypeMetadata.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type TypeMetadata and conformance TypeMetadata()
{
  unint64_t result = lazy protocol witness table cache variable for type TypeMetadata and conformance TypeMetadata;
  if (!lazy protocol witness table cache variable for type TypeMetadata and conformance TypeMetadata)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TypeMetadata and conformance TypeMetadata);
  }
  return result;
}

ValueMetadata *type metadata accessor for TypeMetadata()
{
  return &type metadata for TypeMetadata;
}

unint64_t ConformanceDescriptor.protocol.getter(uint64_t a1)
{
  swift_getKeyPath();
  uint64_t v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  uint64_t v3 = *(int *)(a1 + v2);
  unint64_t result = a1 + v2 + (v3 & 0xFFFFFFFFFFFFFFFELL);
  if (v3) {
    return *(void *)result;
  }
  return result;
}

char *specialized static PtrAuth.relativeContext<A>(_:)(int *a1)
{
  uint64_t v1 = *a1;
  unint64_t result = (char *)a1 + (v1 & 0xFFFFFFFFFFFFFFFELL);
  if (v1) {
    return *(char **)result;
  }
  return result;
}

uint64_t ConformanceDescriptor.descriptor.getter(uint64_t a1)
{
  swift_getKeyPath();
  uint64_t v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  int v3 = (*(unsigned __int8 *)(a1 + 12) >> 3) & 7;

  return TypeReference.descriptor(_:)(v3, (int *)(a1 + v2));
}

uint64_t ConformanceDescriptor.flags.getter(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

BOOL static ConformanceDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void ConformanceDescriptor.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int ConformanceDescriptor.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type ConformanceDescriptor and conformance ConformanceDescriptor()
{
  unint64_t result = lazy protocol witness table cache variable for type ConformanceDescriptor and conformance ConformanceDescriptor;
  if (!lazy protocol witness table cache variable for type ConformanceDescriptor and conformance ConformanceDescriptor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ConformanceDescriptor and conformance ConformanceDescriptor);
  }
  return result;
}

ValueMetadata *type metadata accessor for ConformanceDescriptor()
{
  return &type metadata for ConformanceDescriptor;
}

uint64_t Metadata.AccessFunction.callAsFunction(_:)(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t Metadata.AccessFunction.callAsFunction(_:_:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

{
  return a3();
}

{
  return a3();
}

uint64_t Metadata.AccessFunction.callAsFunction(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

{
  return a4();
}

{
  return a4();
}

uint64_t Metadata.AccessFunction.callAsFunction(_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5();
}

{
  return a5();
}

{
  return a5();
}

uint64_t Metadata.AccessFunction.callAsFunction(_:_:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  return a3(a1, a2 + 32);
}

{
  return a3(a1, a2 + 32);
}

uint64_t Metadata.AccessFunction.callAsFunction(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t EnumMetadata.valueWitnessTable.getter(uint64_t a1)
{
  return a1 - 8;
}

uint64_t EnumMetadata.descriptor.getter(uint64_t a1)
{
  swift_getKeyPath();
  uint64_t v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  return *(void *)(a1 + v2);
}

BOOL static EnumMetadata.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void EnumMetadata.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int EnumMetadata.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type EnumMetadata and conformance EnumMetadata()
{
  unint64_t result = lazy protocol witness table cache variable for type EnumMetadata and conformance EnumMetadata;
  if (!lazy protocol witness table cache variable for type EnumMetadata and conformance EnumMetadata)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EnumMetadata and conformance EnumMetadata);
  }
  return result;
}

ValueMetadata *type metadata accessor for EnumMetadata()
{
  return &type metadata for EnumMetadata;
}

uint64_t EnumDescriptor.numberOfPayloadCases.getter(uint64_t a1)
{
  return *(_DWORD *)(a1 + 20) & 0xFFFFFFLL;
}

uint64_t EnumDescriptor.numberOfEmptyCases.getter(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

unint64_t EnumDescriptor.numberOfCases.getter(uint64_t a1)
{
  return (*(_DWORD *)(a1 + 20) & 0xFFFFFF) + (unint64_t)*(unsigned int *)(a1 + 24);
}

unsigned char *EnumDescriptor.genericSignature.getter(char *a1)
{
  char v2 = *a1;
  unint64_t result = a1 + 36;
  if ((v2 & 0x80) == 0) {
    return 0;
  }
  return result;
}

BOOL static EnumDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void EnumDescriptor.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int EnumDescriptor.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type EnumDescriptor and conformance EnumDescriptor()
{
  unint64_t result = lazy protocol witness table cache variable for type EnumDescriptor and conformance EnumDescriptor;
  if (!lazy protocol witness table cache variable for type EnumDescriptor and conformance EnumDescriptor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EnumDescriptor and conformance EnumDescriptor);
  }
  return result;
}

uint64_t FunctionMetadata.convention.getter(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 10);
}

uint64_t FunctionMetadata.throws.getter(uint64_t a1)
{
  return *(unsigned char *)(a1 + 11) & 1;
}

uint64_t FunctionMetadata.hasParameterFlags.getter(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 11) >> 1) & 1;
}

uint64_t FunctionMetadata.isEscaping.getter(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 11) >> 2) & 1;
}

uint64_t FunctionMetadata.isDifferential.getter(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 11) >> 3) & 1;
}

uint64_t FunctionMetadata.hasGlobalActor.getter(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 11) >> 4) & 1;
}

uint64_t FunctionMetadata.isAsync.getter(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 11) >> 5) & 1;
}

uint64_t FunctionMetadata.isSendable.getter(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 11) >> 6) & 1;
}

uint64_t FunctionMetadata.differentiableKind.getter(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  if ((v1 & 0x8000000) != 0) {
    return *(void *)(a1
  }
                     + 8 * (unsigned __int16)v1
                     + (((uint64_t)(*(void *)(a1 + 8) << 38) >> 63) & (4 * (unsigned __int16)*(void *)(a1 + 8)))
                     + 24);
  else {
    return 0;
  }
}

uint64_t FunctionMetadata.parameterMetadata.getter(uint64_t a1)
{
  return a1 + 24;
}

uint64_t FunctionMetadata.parameterFlags.getter(uint64_t a1)
{
  return a1 + 8 * *(unsigned __int16 *)(a1 + 8) + 24;
}

uint64_t FunctionMetadata.resultMetadata.getter(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

BOOL static FunctionMetadata.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void FunctionMetadata.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int FunctionMetadata.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type FunctionMetadata and conformance FunctionMetadata()
{
  unint64_t result = lazy protocol witness table cache variable for type FunctionMetadata and conformance FunctionMetadata;
  if (!lazy protocol witness table cache variable for type FunctionMetadata and conformance FunctionMetadata)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FunctionMetadata and conformance FunctionMetadata);
  }
  return result;
}

ValueMetadata *type metadata accessor for FunctionMetadata()
{
  return &type metadata for FunctionMetadata;
}

uint64_t ExtendedExistentialShape.flags.getter(unsigned int *a1)
{
  return *a1;
}

uint64_t ExtendedExistentialShape.requirementSignatureHeader.getter(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

BOOL static ExtendedExistentialShape.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void ExtendedExistentialShape.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int ExtendedExistentialShape.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type ExtendedExistentialShape and conformance ExtendedExistentialShape()
{
  unint64_t result = lazy protocol witness table cache variable for type ExtendedExistentialShape and conformance ExtendedExistentialShape;
  if (!lazy protocol witness table cache variable for type ExtendedExistentialShape and conformance ExtendedExistentialShape)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExtendedExistentialShape and conformance ExtendedExistentialShape);
  }
  return result;
}

ValueMetadata *type metadata accessor for ExtendedExistentialShape()
{
  return &type metadata for ExtendedExistentialShape;
}

uint64_t TypeReference.descriptor(_:)(char a1, int *a2)
{
  uint64_t result = (uint64_t)a2 + *a2;
  if (a1)
  {
    if (a1 == 1)
    {
      return *(void *)result;
    }
    else
    {
      uint64_t result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TypeReference()
{
  return &type metadata for TypeReference;
}

uint64_t StructMetadata.valueWitnessTable.getter(uint64_t a1)
{
  return a1 - 8;
}

uint64_t StructMetadata.descriptor.getter(uint64_t a1)
{
  swift_getKeyPath();
  uint64_t v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  return *(void *)(a1 + v2);
}

uint64_t StructMetadata.fieldOffsets.getter(uint64_t a1)
{
  uint64_t v2 = a1 + 8 * *(unsigned int *)(StructMetadata.descriptor.getter(a1) + 24);
  StructMetadata.descriptor.getter(a1);
  return v2;
}

BOOL static StructMetadata.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void StructMetadata.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int StructMetadata.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type StructMetadata and conformance StructMetadata()
{
  unint64_t result = lazy protocol witness table cache variable for type StructMetadata and conformance StructMetadata;
  if (!lazy protocol witness table cache variable for type StructMetadata and conformance StructMetadata)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type StructMetadata and conformance StructMetadata);
  }
  return result;
}

ValueMetadata *type metadata accessor for StructMetadata()
{
  return &type metadata for StructMetadata;
}

uint64_t ForeignClassMetadata.descriptor.getter(uint64_t a1)
{
  swift_getKeyPath();
  uint64_t v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  return *(void *)(a1 + v2);
}

uint64_t ForeignClassMetadata.superclass.getter(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

BOOL static ForeignClassMetadata.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void ForeignClassMetadata.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int ForeignClassMetadata.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type ForeignClassMetadata and conformance ForeignClassMetadata()
{
  unint64_t result = lazy protocol witness table cache variable for type ForeignClassMetadata and conformance ForeignClassMetadata;
  if (!lazy protocol witness table cache variable for type ForeignClassMetadata and conformance ForeignClassMetadata)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ForeignClassMetadata and conformance ForeignClassMetadata);
  }
  return result;
}

ValueMetadata *type metadata accessor for ForeignClassMetadata()
{
  return &type metadata for ForeignClassMetadata;
}

uint64_t WitnessTable.conformanceDescriptor.getter(uint64_t a1)
{
  return *(void *)a1;
}

BOOL static WitnessTable.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void WitnessTable.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int WitnessTable.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type WitnessTable and conformance WitnessTable()
{
  unint64_t result = lazy protocol witness table cache variable for type WitnessTable and conformance WitnessTable;
  if (!lazy protocol witness table cache variable for type WitnessTable and conformance WitnessTable)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type WitnessTable and conformance WitnessTable);
  }
  return result;
}

ValueMetadata *type metadata accessor for WitnessTable()
{
  return &type metadata for WitnessTable;
}

uint64_t ModuleDescriptor.name.getter()
{
  return String.init(cString:)();
}

BOOL static ModuleDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void ModuleDescriptor.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int ModuleDescriptor.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type ModuleDescriptor and conformance ModuleDescriptor()
{
  unint64_t result = lazy protocol witness table cache variable for type ModuleDescriptor and conformance ModuleDescriptor;
  if (!lazy protocol witness table cache variable for type ModuleDescriptor and conformance ModuleDescriptor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModuleDescriptor and conformance ModuleDescriptor);
  }
  return result;
}

ValueMetadata *type metadata accessor for ModuleDescriptor()
{
  return &type metadata for ModuleDescriptor;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance TypeCache.Key(uint64_t a1, uint64_t a2)
{
  return specialized static TypeCache.Key.== infix(_:_:)(*(unsigned char **)a1, *(void *)(a1 + 8), *(unsigned __int8 **)a2, *(void *)(a2 + 8));
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance TypeCache.Key()
{
  uint64_t v1 = *(Swift::UInt8 **)v0;
  Swift::UInt v2 = *(void *)(v0 + 8);
  Hasher.init(_seed:)();
  TypeCache.Key.hash(into:)((uint64_t)v4, v1, v2);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance TypeCache.Key(uint64_t a1)
{
  TypeCache.Key.hash(into:)(a1, *(Swift::UInt8 **)v1, *(void *)(v1 + 8));
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance TypeCache.Key()
{
  uint64_t v1 = *(Swift::UInt8 **)v0;
  Swift::UInt v2 = *(void *)(v0 + 8);
  Hasher.init(_seed:)();
  TypeCache.Key.hash(into:)((uint64_t)v4, v1, v2);
  return Hasher._finalize()();
}

uint64_t specialized static TypeCache.Key.== infix(_:_:)(unsigned char *a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4)
{
  int v4 = *a1;
  if (v4 != *a3) {
    return 0;
  }
  if (*a1)
  {
    int v5 = 0;
    while (1)
    {
      uint64_t v6 = (int *)(a3 + 1);
      char v7 = (int *)(a1 + 1);
      if (v4 > 112)
      {
        if (v4 == 120) {
          int v5 = 1;
        }
        if (v4 == 113) {
          int v5 = 1;
        }
      }
      else
      {
        if (v4 == 1)
        {
          if ((char *)v7 + *v7 != (char *)v6 + *v6) {
            return 0;
          }
          goto LABEL_15;
        }
        if (v4 == 2)
        {
          if (*(void *)((char *)v7 + *v7) != *(void *)((char *)v6 + *v6)) {
            return 0;
          }
LABEL_15:
          a1 += 5;
          a3 += 5;
          goto LABEL_16;
        }
      }
      ++a3;
      ++a1;
LABEL_16:
      int v4 = *a1;
      if (v4 != *a3) {
        return 0;
      }
      if (!*a1) {
        return (v5 ^ 1) & 1 | (a2 == a4);
      }
    }
  }
  return 1;
}

ValueMetadata *type metadata accessor for TypeCache()
{
  return &type metadata for TypeCache;
}

uint64_t MangledTypeReference.length.getter(unsigned char *a1)
{
  int v1 = *a1;
  Swift::UInt v2 = a1;
  if (*a1)
  {
    Swift::UInt v2 = a1;
    do
    {
      unsigned int v3 = v1 - 24;
      if ((v1 - 32) < 0xFFFFFFF8) {
        uint64_t v4 = 1;
      }
      else {
        uint64_t v4 = 9;
      }
      if (v3 >= 0xFFFFFFE9) {
        uint64_t v4 = 5;
      }
      v2 += v4;
      int v1 = *v2;
    }
    while (*v2);
  }
  return v2 - a1;
}

ValueMetadata *type metadata accessor for MangledTypeReference()
{
  return &type metadata for MangledTypeReference;
}

uint64_t Metadata.kind.getter(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t Metadata.valueWitnessTable.getter(uint64_t a1)
{
  return a1 - 8;
}

BOOL static Metadata.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void Metadata.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int Metadata.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

uint64_t Metadata.description.getter(uint64_t a1)
{
  return MEMORY[0x270FA0128](a1, 1);
}

unint64_t lazy protocol witness table accessor for type Metadata and conformance Metadata()
{
  unint64_t result = lazy protocol witness table cache variable for type Metadata and conformance Metadata;
  if (!lazy protocol witness table cache variable for type Metadata and conformance Metadata)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Metadata and conformance Metadata);
  }
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance Metadata()
{
  return MEMORY[0x270FA0128](*v0, 1);
}

char *UnsafeRawPointer.relativeDirectAddress<A>(as:)(uint64_t a1, int *a2)
{
  return (char *)a2 + *a2;
}

uint64_t RelativeDirectPointer.address(from:)(uint64_t a1, int a2)
{
  return a1 + a2;
}

uint64_t protocol witness for RelativePointer.address(from:) in conformance RelativeDirectPointer<A>(uint64_t a1)
{
  return RelativeDirectPointer.address(from:)(a1, *v1);
}

uint64_t OpaqueDescriptor.numberOfUnderlyingTypes.getter(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 2);
}

BOOL static OpaqueDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void OpaqueDescriptor.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int OpaqueDescriptor.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type OpaqueDescriptor and conformance OpaqueDescriptor()
{
  unint64_t result = lazy protocol witness table cache variable for type OpaqueDescriptor and conformance OpaqueDescriptor;
  if (!lazy protocol witness table cache variable for type OpaqueDescriptor and conformance OpaqueDescriptor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OpaqueDescriptor and conformance OpaqueDescriptor);
  }
  return result;
}

ValueMetadata *type metadata accessor for OpaqueDescriptor()
{
  return &type metadata for OpaqueDescriptor;
}

uint64_t ClassMetadata.descriptor.getter(uint64_t a1)
{
  swift_getKeyPath();
  uint64_t v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  return *(void *)(a1 + v2);
}

uint64_t ClassMetadata.valueWitnessTable.getter(uint64_t a1)
{
  return a1 - 8;
}

uint64_t ClassMetadata.isSwiftClass.getter(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 32) >> 1) & 1;
}

uint64_t ClassMetadata.fieldOffsets.getter(uint64_t a1)
{
  uint64_t v2 = a1 + 8 * *(unsigned int *)(ClassMetadata.descriptor.getter(a1) + 40);
  ClassMetadata.descriptor.getter(a1);
  return v2;
}

BOOL static ClassMetadata.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void ClassMetadata.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int ClassMetadata.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type ClassMetadata and conformance ClassMetadata()
{
  unint64_t result = lazy protocol witness table cache variable for type ClassMetadata and conformance ClassMetadata;
  if (!lazy protocol witness table cache variable for type ClassMetadata and conformance ClassMetadata)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ClassMetadata and conformance ClassMetadata);
  }
  return result;
}

ValueMetadata *type metadata accessor for ClassMetadata()
{
  return &type metadata for ClassMetadata;
}

uint64_t static PtrAuth.SpecialDiscriminator.valueWitnessTable.getter()
{
  return 11839;
}

uint64_t UnsafeRawPointer.signedVWTInitializeBufferWithCopyOfBuffer.getter(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t UnsafeRawPointer.signedVWTDestroy.getter(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t UnsafeRawPointer.signedVWTInitializeWithCopy.getter(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t UnsafeRawPointer.signedVWTAssignWithCopy.getter(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t UnsafeRawPointer.signedVWTInitializeWithTake.getter(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t UnsafeRawPointer.signedVWTAssignWithTake.getter(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t UnsafeRawPointer.signedVWTGetEnumTagSinglePayload.getter(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t UnsafeRawPointer.signedVWTStoreEnumTagSinglePayload.getter(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t static PtrAuth.authNonUniqueExtendedExistentialShape(_:)(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t static PtrAuth.authDescriptor<A>(_:)(void *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))(*a1);
}

uint64_t static PtrAuth.relativeContext<A>(_:)(int *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (void *)((char *)a1 + (v3 & 0xFFFFFFFFFFFFFFFELL));
  if (v3) {
    uint64_t v4 = (void *)*v4;
  }
  return (*(uint64_t (**)(void *))(a3 + 24))(v4);
}

uint64_t static PtrAuth.authConformanceDescriptor(_:)(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t static PtrAuth.authSuperclass(_:)(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t static PtrAuth.Key.processIndependentCode.getter()
{
  return 0;
}

uint64_t static PtrAuth.Key.processDependentCode.getter()
{
  return 1;
}

uint64_t static PtrAuth.Key.processIndependentData.getter()
{
  return 2;
}

uint64_t static PtrAuth.Key.processDependentData.getter()
{
  return 3;
}

uint64_t static PtrAuth.SpecialDiscriminator.nonUniqueExtendedExistentialTypeShape.getter()
{
  return 59288;
}

uint64_t static PtrAuth.SpecialDiscriminator.objcIsa.getter()
{
  return 27361;
}

uint64_t static PtrAuth.SpecialDiscriminator.objcSuperclass.getter()
{
  return 46507;
}

uint64_t static PtrAuth.SpecialDiscriminator.typeDescriptor.getter()
{
  return 44678;
}

uint64_t static PtrAuth.SpecialDiscriminator.protocolConformanceDescriptor.getter()
{
  return 50923;
}

uint64_t static PtrAuth.SpecialDiscriminator.contextDescriptorAsArgument.getter()
{
  return 46563;
}

uint64_t static PtrAuth.SpecialDiscriminator.initializeBufferWithCopyOfBuffer.getter()
{
  return 55882;
}

uint64_t static PtrAuth.SpecialDiscriminator.destroy.getter()
{
  return 1272;
}

uint64_t static PtrAuth.SpecialDiscriminator.initializeWithCopy.getter()
{
  return 58298;
}

uint64_t static PtrAuth.SpecialDiscriminator.assignWithCopy.getter()
{
  return 34641;
}

uint64_t static PtrAuth.SpecialDiscriminator.initializeWithTake.getter()
{
  return 18648;
}

uint64_t static PtrAuth.SpecialDiscriminator.assignWithTake.getter()
{
  return 61402;
}

uint64_t static PtrAuth.SpecialDiscriminator.getEnumTagSinglePayload.getter()
{
  return 24816;
}

uint64_t static PtrAuth.SpecialDiscriminator.storeEnumTagSinglePayload.getter()
{
  return 41169;
}

uint64_t static PtrAuth.SpecialDiscriminator.getEnumTag.getter()
{
  return 41909;
}

uint64_t static PtrAuth.SpecialDiscriminator.destructiveProjectEnumData.getter()
{
  return 1053;
}

uint64_t static PtrAuth.SpecialDiscriminator.destructiveInjectEnumTag.getter()
{
  return 45796;
}

uint64_t static PtrAuth.auth(_:as:)(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t static PtrAuth.authObjcISA(_:)(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t static PtrAuth.relativeContextIntPair<A, B>(_:as:)(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v9 = RelativeIndirectablePointerIntPair.init(offset:)(*a1, a3, a4, a6);
  char v10 = v9;
  uint64_t v11 = (void *)RelativeIndirectablePointerIntPair.directAddress(from:)((uint64_t)a1, v9);
  if (RelativeIndirectablePointerIntPair.isIndirect.getter(v10)) {
    uint64_t v11 = (void *)*v11;
  }
  return (*(uint64_t (**)(void *, uint64_t, uint64_t))(a5 + 24))(v11, a3, a5);
}

char *static PtrAuth.relativeConformance(_:)(int *a1)
{
  uint64_t v1 = *a1;
  unint64_t result = (char *)a1 + (v1 & 0xFFFFFFFFFFFFFFFELL);
  if (v1) {
    return *(char **)result;
  }
  return result;
}

uint64_t UnsafeRawPointer.signedVWTFunc(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(void *)a3;
}

uint64_t UnsafeRawPointer.signedVWTGetEnumTag.getter(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t UnsafeRawPointer.signedVWTDestructiveProjectEnumData.getter(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t UnsafeRawPointer.signedVWTDestructiveInjectEnumTag.getter(uint64_t a1)
{
  return *(void *)a1;
}

ValueMetadata *type metadata accessor for PtrAuth()
{
  return &type metadata for PtrAuth;
}

ValueMetadata *type metadata accessor for PtrAuth.Key()
{
  return &type metadata for PtrAuth.Key;
}

ValueMetadata *type metadata accessor for PtrAuth.SpecialDiscriminator()
{
  return &type metadata for PtrAuth.SpecialDiscriminator;
}

uint64_t UnsafeRawPointer.relativeIndirectAddress<A>(as:)(uint64_t a1, int *a2)
{
  return *(void *)((char *)a2 + *a2);
}

uint64_t RelativeIndirectPointer.address(from:)(uint64_t a1, int a2)
{
  return *(void *)(a1 + a2);
}

uint64_t protocol witness for RelativePointer.address(from:) in conformance RelativeIndirectPointer<A>(uint64_t a1)
{
  return RelativeIndirectPointer.address(from:)(a1, *v1);
}

uint64_t type metadata accessor for RelativeIndirectPointer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t RelativeIndirectablePointer.directAddress(from:)(uint64_t a1, int a2)
{
  return a1 + (int)(a2 & 0xFFFFFFFE);
}

uint64_t RelativeIndirectablePointer.isIndirect.getter(char a1)
{
  return a1 & 1;
}

uint64_t RelativeIndirectablePointer.address(from:)(uint64_t a1, int a2)
{
  uint64_t result = a1 + (int)(a2 & 0xFFFFFFFE);
  if (a2) {
    return *(void *)result;
  }
  return result;
}

uint64_t protocol witness for RelativePointer.address(from:) in conformance RelativeIndirectablePointer<A>(uint64_t a1)
{
  return RelativeIndirectablePointer.address(from:)(a1, *v1);
}

uint64_t EnumValueWitnessTable.discriminator.getter()
{
  return 11839;
}

uint64_t EnumValueWitnessTable.getEnumTag(_:)(uint64_t a1, uint64_t *a2)
{
  swift_getKeyPath();
  uint64_t v4 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  uint64_t v5 = *a2;
  swift_release();
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t *))UnsafeRawPointer.signedVWTGetEnumTag.getter(v5 + v4);

  return v6(a1, a2 + 1);
}

uint64_t EnumValueWitnessTable.destructiveProjectEnumData(_:)(uint64_t a1, uint64_t *a2)
{
  swift_getKeyPath();
  uint64_t v4 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  uint64_t v5 = *a2;
  swift_release();
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t *))UnsafeRawPointer.signedVWTDestructiveProjectEnumData.getter(v5 + v4);

  return v6(a1, a2 + 1);
}

uint64_t EnumValueWitnessTable.destructiveInjectEnumTag(_:into:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  swift_getKeyPath();
  uint64_t v6 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  uint64_t v7 = *a3;
  swift_release();
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t *))UnsafeRawPointer.signedVWTDestructiveInjectEnumTag.getter(v7 + v6);

  return v8(a2, a1, a3 + 1);
}

BOOL static EnumValueWitnessTable.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void EnumValueWitnessTable.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int EnumValueWitnessTable.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type EnumValueWitnessTable and conformance EnumValueWitnessTable()
{
  unint64_t result = lazy protocol witness table cache variable for type EnumValueWitnessTable and conformance EnumValueWitnessTable;
  if (!lazy protocol witness table cache variable for type EnumValueWitnessTable and conformance EnumValueWitnessTable)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EnumValueWitnessTable and conformance EnumValueWitnessTable);
  }
  return result;
}

ValueMetadata *type metadata accessor for EnumValueWitnessTable()
{
  return &type metadata for EnumValueWitnessTable;
}

uint64_t RelativeIndirectablePointerIntPair.directAddress(from:)(uint64_t a1, int a2)
{
  return a1 + (int)(a2 & 0xFFFFFFFC);
}

uint64_t RelativeIndirectablePointerIntPair.isIndirect.getter(char a1)
{
  return a1 & 1;
}

uint64_t RelativeIndirectablePointerIntPair.intMask.getter()
{
  return 2;
}

uint64_t RelativeIndirectablePointerIntPair.BOOL.getter(unsigned int a1)
{
  return (a1 >> 1) & 1;
}

uint64_t RelativeIndirectablePointerIntPair.int.getter()
{
  return dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
}

uint64_t RelativeIndirectablePointerIntPair.unresolved.getter(int a1)
{
  return (int)(a1 & 0xFFFFFFFD);
}

uint64_t RelativeIndirectablePointerIntPair.address(from:)(uint64_t a1, int a2)
{
  uint64_t result = a1 + (int)(a2 & 0xFFFFFFFC);
  if (a2) {
    return *(void *)result;
  }
  return result;
}

uint64_t protocol witness for RelativePointer.address(from:) in conformance RelativeIndirectablePointerIntPair<A, B>(uint64_t a1)
{
  return RelativeIndirectablePointerIntPair.address(from:)(a1, *v1);
}

char *UnsafeRawPointer.relativeIndirectablePointerIntPairAddress<A, B>(as:and:)(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3 = *a3;
  uint64_t result = (char *)a3 + (v3 & 0xFFFFFFFFFFFFFFFCLL);
  if (v3) {
    return *(char **)result;
  }
  return result;
}

uint64_t type metadata accessor for RelativeIndirectablePointerIntPair()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t static ReferenceOwnership.strong.getter()
{
  return 0;
}

uint64_t static ReferenceOwnership.weak.getter()
{
  return 1;
}

uint64_t static ReferenceOwnership.unmanaged.getter()
{
  return 4;
}

uint64_t static ReferenceOwnership.unowned.getter()
{
  return 2;
}

uint64_t ConformanceDescriptor.Flags.typeReferenceKind.getter(unsigned int a1)
{
  return (a1 >> 3) & 7;
}

uint64_t static TypeReference.Kind.directDescriptor.getter()
{
  return 0;
}

uint64_t static TypeReference.Kind.indirectDescriptor.getter()
{
  return 1;
}

uint64_t ContextDescriptor.Flags.kindSpecificFlags.getter(unsigned int a1)
{
  return HIWORD(a1);
}

uint64_t static AnonymousDescriptor.Flags.hasMangledNameMask.getter()
{
  return 1;
}

uint64_t static ConformanceDescriptor.Flags.typeReferenceKindMask.getter()
{
  return 56;
}

uint64_t static ConformanceDescriptor.Flags.typeReferenceKindShift.getter()
{
  return 3;
}

uint64_t static ConformanceDescriptor.Flags.isRetroactiveMask.getter()
{
  return 64;
}

uint64_t static ConformanceDescriptor.Flags.isSynthesizedNonUniqueMask.getter()
{
  return 128;
}

uint64_t static ConformanceDescriptor.Flags.numberOfConditionalRequirementsMask.getter()
{
  return 65280;
}

uint64_t static ConformanceDescriptor.Flags.numberOfConditionalRequirementsShift.getter()
{
  return 8;
}

uint64_t static ConformanceDescriptor.Flags.hasResilientWitnessesMask.getter()
{
  return 0x10000;
}

uint64_t static ConformanceDescriptor.Flags.hasGenericWitnessTableMask.getter()
{
  return 0x20000;
}

uint64_t ConformanceDescriptor.Flags.numberOfConditionalRequirements.getter(__int16 a1)
{
  return HIBYTE(a1);
}

uint64_t ConformanceDescriptor.Flags.hasResilientWitnesses.getter(unsigned int a1)
{
  return HIWORD(a1) & 1;
}

uint64_t ConformanceDescriptor.Flags.hasGenericWitnessTable.getter(unsigned int a1)
{
  return (a1 >> 17) & 1;
}

uint64_t static ContextDescriptor.Kind.module.getter()
{
  return 0;
}

uint64_t static ContextDescriptor.Kind.extension.getter()
{
  return 1;
}

uint64_t static ContextDescriptor.Kind.anonymous.getter()
{
  return 2;
}

uint64_t static ContextDescriptor.Kind.protocol.getter()
{
  return 3;
}

uint64_t static ContextDescriptor.Kind.opaqueType.getter()
{
  return 4;
}

uint64_t static ContextDescriptor.Kind.class.getter()
{
  return 16;
}

uint64_t static ContextDescriptor.Kind.struct.getter()
{
  return 17;
}

uint64_t static ContextDescriptor.Kind.enum.getter()
{
  return 18;
}

uint64_t ContextDescriptor.Kind.description.getter(unsigned __int8 a1)
{
  int v1 = a1;
  uint64_t result = 0x656C75646F6DLL;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 0x6F69736E65747865;
      break;
    case 2:
      uint64_t result = 0x756F6D796E6F6E61;
      break;
    case 3:
      uint64_t result = 0x6C6F636F746F7270;
      break;
    case 4:
      uint64_t result = 0x795465757161706FLL;
      break;
    case 16:
      uint64_t result = 0x7373616C63;
      break;
    case 17:
      uint64_t result = 0x746375727473;
      break;
    case 18:
      uint64_t result = 1836412517;
      break;
    default:
      uint64_t result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContextDescriptor.Kind()
{
  return ContextDescriptor.Kind.description.getter(*v0);
}

uint64_t static ContextDescriptor.Flags.kindMask.getter()
{
  return 31;
}

uint64_t static ContextDescriptor.Flags.isUniqueMask.getter()
{
  return 64;
}

uint64_t static ContextDescriptor.Flags.isGenericMask.getter()
{
  return 128;
}

uint64_t static ContextDescriptor.Flags.versionMask.getter()
{
  return 65280;
}

uint64_t static ContextDescriptor.Flags.versionShift.getter()
{
  return 8;
}

uint64_t static ContextDescriptor.Flags.kindSpecificFlagsMask.getter()
{
  return 4294901760;
}

uint64_t static ContextDescriptor.Flags.kindSpecificFlagsShift.getter()
{
  return 16;
}

uint64_t ContextDescriptor.Flags.isUnique.getter(unsigned int a1)
{
  return (a1 >> 6) & 1;
}

uint64_t ContextDescriptor.Flags.version.getter(unsigned int a1)
{
  return a1 >> 8;
}

uint64_t static ExtendedExistentialShape.SpecialKind.none.getter()
{
  return 0;
}

uint64_t static ExtendedExistentialShape.SpecialKind.class.getter()
{
  return 1;
}

uint64_t static ExtendedExistentialShape.SpecialKind.metatype.getter()
{
  return 2;
}

uint64_t static ExtendedExistentialShape.SpecialKind.explicitLayout.getter()
{
  return 3;
}

uint64_t ExtendedExistentialShape.SpecialKind.description.getter(unsigned __int8 a1)
{
  int v1 = a1;
  uint64_t result = 1701736302;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 0x7373616C63;
      break;
    case 2:
      uint64_t result = 0x657079746174656DLL;
      break;
    case 3:
      uint64_t result = 0x746963696C707865;
      break;
    default:
      uint64_t result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ExtendedExistentialShape.SpecialKind()
{
  uint64_t result = 1701736302;
  switch(*v0)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 0x7373616C63;
      break;
    case 2:
      uint64_t result = 0x657079746174656DLL;
      break;
    case 3:
      uint64_t result = 0x746963696C707865;
      break;
    default:
      uint64_t result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

uint64_t static ExtendedExistentialShape.Flags.specialKindMask.getter()
{
  return 255;
}

uint64_t static ExtendedExistentialShape.Flags.hasGeneralizationSignatureMask.getter()
{
  return 256;
}

uint64_t static ExtendedExistentialShape.Flags.hasTypeExpressionMask.getter()
{
  return 512;
}

uint64_t static ExtendedExistentialShape.Flags.hasSuggestedValueWitnessesMask.getter()
{
  return 1024;
}

uint64_t static ExtendedExistentialShape.Flags.hasImplicitRequirementSignatureParametersMask.getter()
{
  return 2048;
}

uint64_t static ExtendedExistentialShape.Flags.hasImplicitGeneralizationSignatureParametersMask.getter()
{
  return 4096;
}

uint64_t ExtendedExistentialShape.Flags.hasGenerializationSignature.getter(unsigned int a1)
{
  return (a1 >> 8) & 1;
}

uint64_t ExtendedExistentialShape.Flags.hasTypeExpression.getter(unsigned int a1)
{
  return (a1 >> 9) & 1;
}

uint64_t ExtendedExistentialShape.Flags.hasSuggestedValueWitnesses.getter(unsigned int a1)
{
  return (a1 >> 10) & 1;
}

uint64_t ExtendedExistentialShape.Flags.hasImplicitRequirementSignatureParameters.getter(unsigned int a1)
{
  return (a1 >> 11) & 1;
}

uint64_t ExtendedExistentialShape.Flags.hasImplicitGeneralizationSignatureParameters.getter(unsigned int a1)
{
  return (a1 >> 12) & 1;
}

uint64_t static FieldDescriptor.Element.Flags.isIndirectCaseMask.getter()
{
  return 1;
}

uint64_t static FieldDescriptor.Element.Flags.isVarMask.getter()
{
  return 2;
}

uint64_t FieldDescriptor.Element.Flags.isIndirectCase.getter(char a1)
{
  return a1 & 1;
}

uint64_t FieldDescriptor.Element.Flags.isVar.getter(unsigned int a1)
{
  return (a1 >> 1) & 1;
}

uint64_t static GenericSignature.Flags.hasTypePacksMask.getter()
{
  return 1;
}

uint64_t GenericSignature.Flags.hasTypePacks.getter(char a1)
{
  return a1 & 1;
}

uint64_t static GenericSignature.LayoutKind.class.getter()
{
  return 0;
}

BOOL static GenericSignature.LayoutKind.== infix(_:_:)(int a1, int a2)
{
  return a1 == a2;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance GenericSignature.LayoutKind(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

void GenericSignature.LayoutKind.hash(into:)(int a1, Swift::UInt32 a2)
{
}

Swift::Int GenericSignature.LayoutKind.hashValue.getter(Swift::UInt32 a1)
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance GenericSignature.LayoutKind()
{
  Swift::UInt32 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance GenericSignature.LayoutKind()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GenericSignature.LayoutKind()
{
  Swift::UInt32 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t GenericSignature.LayoutKind.description.getter(int a1)
{
  if (a1) {
    return 0x6E776F6E6B6E75;
  }
  else {
    return 0x7373616C63;
  }
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GenericSignature.LayoutKind()
{
  if (*v0) {
    return 0x6E776F6E6B6E75;
  }
  else {
    return 0x7373616C63;
  }
}

uint64_t static GenericSignature.PackShapeDescriptor.Kind.metadata.getter()
{
  return 0;
}

uint64_t static GenericSignature.PackShapeDescriptor.Kind.witnessTable.getter()
{
  return 1;
}

BOOL static GenericSignature.PackShapeDescriptor.Kind.== infix(_:_:)(__int16 a1, __int16 a2)
{
  return a1 == a2;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance GenericSignature.PackShapeDescriptor.Kind(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return *a1 == *a2;
}

void GenericSignature.PackShapeDescriptor.Kind.hash(into:)(int a1, Swift::UInt16 a2)
{
}

Swift::Int GenericSignature.PackShapeDescriptor.Kind.hashValue.getter(Swift::UInt16 a1)
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance GenericSignature.PackShapeDescriptor.Kind()
{
  Swift::UInt16 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance GenericSignature.PackShapeDescriptor.Kind()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GenericSignature.PackShapeDescriptor.Kind()
{
  Swift::UInt16 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t GenericSignature.PackShapeDescriptor.Kind.description.getter(__int16 a1)
{
  if (!a1) {
    return 0x617461646174656DLL;
  }
  if (a1 == 1) {
    return 0x547373656E746977;
  }
  return 0x6E776F6E6B6E75;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GenericSignature.PackShapeDescriptor.Kind()
{
  uint64_t v1 = 0x617461646174656DLL;
  if (*v0) {
    uint64_t v1 = 0x6E776F6E6B6E75;
  }
  if (*v0 == 1) {
    return 0x547373656E746977;
  }
  else {
    return v1;
  }
}

uint64_t static GenericSignature.ParameterDescriptor.kindMask.getter()
{
  return 63;
}

uint64_t static GenericSignature.ParameterDescriptor.hasKeyArgumentMask.getter()
{
  return 128;
}

uint64_t GenericSignature.ParameterDescriptor.kind.getter(char a1)
{
  return a1 & 0x3F;
}

uint64_t GenericSignature.ParameterDescriptor.hasKeyArgument.getter(unsigned int a1)
{
  return (a1 >> 7) & 1;
}

uint64_t static GenericSignature.ParameterDescriptor.Kind.type.getter()
{
  return 0;
}

uint64_t static GenericSignature.ParameterDescriptor.Kind.pack.getter()
{
  return 1;
}

uint64_t GenericSignature.ParameterDescriptor.Kind.description.getter(char a1)
{
  if (!a1) {
    return 1701869940;
  }
  if (a1 == 1) {
    return 1801675120;
  }
  return 0x6E776F6E6B6E75;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GenericSignature.ParameterDescriptor.Kind()
{
  uint64_t v1 = 1701869940;
  if (*v0) {
    uint64_t v1 = 0x6E776F6E6B6E75;
  }
  if (*v0 == 1) {
    return 1801675120;
  }
  else {
    return v1;
  }
}

uint64_t static GenericSignature.RequirementDescriptor.Kind.protocol.getter()
{
  return 0;
}

uint64_t static GenericSignature.RequirementDescriptor.Kind.sameType.getter()
{
  return 1;
}

uint64_t static GenericSignature.RequirementDescriptor.Kind.baseClass.getter()
{
  return 2;
}

uint64_t static GenericSignature.RequirementDescriptor.Kind.sameConformance.getter()
{
  return 3;
}

uint64_t static GenericSignature.RequirementDescriptor.Kind.layout.getter()
{
  return 31;
}

uint64_t GenericSignature.RequirementDescriptor.Kind.description.getter(unsigned __int8 a1)
{
  int v1 = a1;
  uint64_t result = 0x6C6F636F746F7270;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 0x65707954656D6173;
      break;
    case 2:
      uint64_t result = 0x73616C4365736162;
      break;
    case 3:
      uint64_t result = 0x666E6F43656D6173;
      break;
    case 31:
      uint64_t result = 0x74756F79616CLL;
      break;
    default:
      uint64_t result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GenericSignature.RequirementDescriptor.Kind()
{
  return GenericSignature.RequirementDescriptor.Kind.description.getter(*v0);
}

uint64_t static GenericSignature.RequirementDescriptor.Flags.kindMask.getter()
{
  return 31;
}

uint64_t static GenericSignature.RequirementDescriptor.Flags.isPackRequirementMask.getter()
{
  return 32;
}

uint64_t static GenericSignature.RequirementDescriptor.Flags.hasKeyArgumentMask.getter()
{
  return 128;
}

uint64_t GenericSignature.RequirementDescriptor.Flags.kind.getter(char a1)
{
  return a1 & 0x1F;
}

uint64_t GenericSignature.RequirementDescriptor.Flags.isPackRequirement.getter(unsigned int a1)
{
  return (a1 >> 5) & 1;
}

uint64_t GenericSignature.RequirementDescriptor.Flags.hasKeyArgument.getter(unsigned int a1)
{
  return (a1 >> 7) & 1;
}

uint64_t static MetadataInitializationKind.none.getter()
{
  return 0;
}

uint64_t static MetadataInitializationKind.single.getter()
{
  return 1;
}

uint64_t static MetadataInitializationKind.foreign.getter()
{
  return 2;
}

uint64_t MetadataInitializationKind.description.getter(char a1)
{
  if (!a1) {
    return 1701736302;
  }
  uint64_t v1 = 0x6E776F6E6B6E75;
  if (a1 == 1) {
    uint64_t v1 = 0x656C676E6973;
  }
  if (a1 == 2) {
    return 0x6E676965726F66;
  }
  else {
    return v1;
  }
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance MetadataInitializationKind()
{
  int v1 = *v0;
  uint64_t v2 = 1701736302;
  if (*v0) {
    uint64_t v2 = 0x6E776F6E6B6E75;
  }
  if (v1 == 1) {
    uint64_t v2 = 0x656C676E6973;
  }
  if (v1 == 2) {
    return 0x6E676965726F66;
  }
  else {
    return v2;
  }
}

uint64_t static ProtocolDescriptor.Flags.hasClassConstraintMask.getter()
{
  return 1;
}

uint64_t static ProtocolDescriptor.Flags.isResilientMask.getter()
{
  return 2;
}

uint64_t static ProtocolDescriptor.Flags.specialProtocolMask.getter()
{
  return 252;
}

uint64_t static ProtocolDescriptor.Flags.specialProtocolShift.getter()
{
  return 2;
}

BOOL ProtocolDescriptor.Flags.isClassConstrained.getter(char a1)
{
  return (a1 & 1) == 0;
}

uint64_t ProtocolDescriptor.Flags.isResilient.getter(unsigned int a1)
{
  return (a1 >> 1) & 1;
}

uint64_t ProtocolDescriptor.Flags.specialProtocol.getter(unsigned __int8 a1)
{
  return a1 >> 2;
}

uint64_t static ProtocolRequirement.Kind.baseProtocol.getter()
{
  return 0;
}

uint64_t static ProtocolRequirement.Kind.method.getter()
{
  return 1;
}

uint64_t static ProtocolRequirement.Kind.init.getter()
{
  return 2;
}

uint64_t static ProtocolRequirement.Kind.getter.getter()
{
  return 3;
}

uint64_t static ProtocolRequirement.Kind.setter.getter()
{
  return 4;
}

uint64_t static ProtocolRequirement.Kind.readCoroutine.getter()
{
  return 5;
}

uint64_t static ProtocolRequirement.Kind.modifyCoroutine.getter()
{
  return 6;
}

uint64_t static ProtocolRequirement.Kind.associatedTypeAccessFunction.getter()
{
  return 7;
}

uint64_t static ProtocolRequirement.Kind.associatedConformanceAccessFunction.getter()
{
  return 8;
}

unint64_t ProtocolRequirement.Kind.description.getter(unsigned __int8 a1)
{
  int v1 = a1;
  unint64_t result = 0x746F725065736162;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      unint64_t result = 0x646F6874656DLL;
      break;
    case 2:
      unint64_t result = 1953066601;
      break;
    case 3:
      unint64_t result = 0x726574746567;
      break;
    case 4:
      unint64_t result = 0x726574746573;
      break;
    case 5:
      unint64_t result = 0x6F726F4364616572;
      break;
    case 6:
      unint64_t result = 0x6F43796669646F6DLL;
      break;
    case 7:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 8:
      unint64_t result = 0xD000000000000023;
      break;
    default:
      unint64_t result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

unint64_t protocol witness for CustomStringConvertible.description.getter in conformance ProtocolRequirement.Kind()
{
  return ProtocolRequirement.Kind.description.getter(*v0);
}

uint64_t static ProtocolRequirement.Flags.kindMask.getter()
{
  return 15;
}

uint64_t static ProtocolRequirement.Flags.isInstanceMask.getter()
{
  return 16;
}

uint64_t static ProtocolRequirement.Flags.isAsyncMask.getter()
{
  return 32;
}

uint64_t static ProtocolRequirement.Flags.extraDiscriminatorShift.getter()
{
  return 16;
}

uint64_t ProtocolRequirement.Flags.kind.getter(char a1)
{
  return a1 & 0xF;
}

uint64_t ProtocolRequirement.Flags.isInstance.getter(unsigned int a1)
{
  return (a1 >> 4) & 1;
}

uint64_t ProtocolRequirement.Flags.extraDiscriminator.getter(unsigned int a1)
{
  return HIWORD(a1);
}

uint64_t ReferenceOwnership.description.getter(unsigned __int8 a1)
{
  int v1 = a1;
  uint64_t result = 0x676E6F727473;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 1801545079;
      break;
    case 2:
      uint64_t result = 0x64656E776F6E75;
      break;
    case 4:
      uint64_t result = 0x6567616E616D6E75;
      break;
    default:
      uint64_t result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ReferenceOwnership()
{
  uint64_t result = 0x676E6F727473;
  switch(*v0)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 1801545079;
      break;
    case 2:
      uint64_t result = 0x64656E776F6E75;
      break;
    case 4:
      uint64_t result = 0x6567616E616D6E75;
      break;
    default:
      uint64_t result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

uint64_t static SpecialProtocol.none.getter()
{
  return 0;
}

uint64_t static SpecialProtocol.error.getter()
{
  return 1;
}

uint64_t SpecialProtocol.description.getter(char a1)
{
  if (!a1) {
    return 1701736302;
  }
  if (a1 == 1) {
    return 0x726F727265;
  }
  return 0x6E776F6E6B6E75;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SpecialProtocol()
{
  uint64_t v1 = 1701736302;
  if (*v0) {
    uint64_t v1 = 0x6E776F6E6B6E75;
  }
  if (*v0 == 1) {
    return 0x726F727265;
  }
  else {
    return v1;
  }
}

uint64_t static TypeDescriptor.Flags.metadataInitializationKindMask.getter()
{
  return 3;
}

uint64_t static TypeDescriptor.Flags.hasImportInfoMask.getter()
{
  return 4;
}

uint64_t static TypeDescriptor.Flags.hasCanonicalMetadataPrespecializationsMask.getter()
{
  return 8;
}

uint64_t static TypeDescriptor.Flags.classIsActorMask.getter()
{
  return 128;
}

uint64_t static TypeDescriptor.Flags.classIsDefaultActorMask.getter()
{
  return 256;
}

uint64_t static TypeDescriptor.Flags.classResilientSuperclassReferenceKindMask.getter()
{
  return 3584;
}

uint64_t static TypeDescriptor.Flags.classResilientSuperclassReferenceKindShift.getter()
{
  return 9;
}

uint64_t static TypeDescriptor.Flags.classAreImmediateMembersNegativeMask.getter()
{
  return 4096;
}

uint64_t static TypeDescriptor.Flags.classHasResilientSuperclassMask.getter()
{
  return 0x2000;
}

uint64_t static TypeDescriptor.Flags.classHasOverrideTableMask.getter()
{
  return 0x4000;
}

uint64_t static TypeDescriptor.Flags.classHasVtableMask.getter()
{
  return 0x8000;
}

uint64_t TypeDescriptor.Flags.metadataInitializationKind.getter(char a1)
{
  return a1 & 3;
}

uint64_t TypeDescriptor.Flags.hasImportInfo.getter(unsigned int a1)
{
  return (a1 >> 2) & 1;
}

uint64_t TypeDescriptor.Flags.hasCanonicalMetadataPrespecializations.getter(unsigned int a1)
{
  return (a1 >> 3) & 1;
}

uint64_t TypeDescriptor.Flags.classIsActor.getter(unsigned int a1)
{
  return (a1 >> 7) & 1;
}

uint64_t TypeDescriptor.Flags.classIsDefaultActor.getter(unsigned int a1)
{
  return (a1 >> 8) & 1;
}

uint64_t TypeDescriptor.Flags.classResilientSuperclassReferenceKind.getter(unsigned int a1)
{
  return (a1 >> 9) & 7;
}

uint64_t TypeDescriptor.Flags.classAreImmediateMembersNegative.getter(unsigned int a1)
{
  return (a1 >> 12) & 1;
}

uint64_t TypeDescriptor.Flags.classHasResilientSuperclass.getter(unsigned int a1)
{
  return (a1 >> 13) & 1;
}

uint64_t TypeDescriptor.Flags.classHasOverrideTable.getter(unsigned int a1)
{
  return (a1 >> 14) & 1;
}

uint64_t TypeDescriptor.Flags.classHasVtable.getter(unsigned int a1)
{
  return (a1 >> 15) & 1;
}

uint64_t static TypeReference.Kind.directObjCClass.getter()
{
  return 2;
}

uint64_t static TypeReference.Kind.indirectObjCClass.getter()
{
  return 3;
}

BOOL static TypeReference.Kind.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance TypeReference.Kind(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void TypeReference.Kind.hash(into:)(int a1, Swift::UInt8 a2)
{
}

Swift::Int ContextDescriptor.Kind.hashValue.getter(Swift::UInt8 a1)
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ContextDescriptor.Kind()
{
  Swift::UInt8 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance TypeReference.Kind()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ContextDescriptor.Kind()
{
  Swift::UInt8 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

unint64_t TypeReference.Kind.description.getter(unsigned __int8 a1)
{
  int v1 = a1;
  unint64_t result = 0xD000000000000010;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      unint64_t result = 0xD000000000000012;
      break;
    case 2:
      unint64_t result = 0x624F746365726964;
      break;
    case 3:
      unint64_t result = 0xD000000000000011;
      break;
    default:
      unint64_t result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContextDescriptor.Kind and conformance ContextDescriptor.Kind()
{
  unint64_t result = lazy protocol witness table cache variable for type ContextDescriptor.Kind and conformance ContextDescriptor.Kind;
  if (!lazy protocol witness table cache variable for type ContextDescriptor.Kind and conformance ContextDescriptor.Kind)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContextDescriptor.Kind and conformance ContextDescriptor.Kind);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ExtendedExistentialShape.SpecialKind and conformance ExtendedExistentialShape.SpecialKind()
{
  unint64_t result = lazy protocol witness table cache variable for type ExtendedExistentialShape.SpecialKind and conformance ExtendedExistentialShape.SpecialKind;
  if (!lazy protocol witness table cache variable for type ExtendedExistentialShape.SpecialKind and conformance ExtendedExistentialShape.SpecialKind)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ExtendedExistentialShape.SpecialKind and conformance ExtendedExistentialShape.SpecialKind);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GenericSignature.LayoutKind and conformance GenericSignature.LayoutKind()
{
  unint64_t result = lazy protocol witness table cache variable for type GenericSignature.LayoutKind and conformance GenericSignature.LayoutKind;
  if (!lazy protocol witness table cache variable for type GenericSignature.LayoutKind and conformance GenericSignature.LayoutKind)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GenericSignature.LayoutKind and conformance GenericSignature.LayoutKind);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GenericSignature.PackShapeDescriptor.Kind and conformance GenericSignature.PackShapeDescriptor.Kind()
{
  unint64_t result = lazy protocol witness table cache variable for type GenericSignature.PackShapeDescriptor.Kind and conformance GenericSignature.PackShapeDescriptor.Kind;
  if (!lazy protocol witness table cache variable for type GenericSignature.PackShapeDescriptor.Kind and conformance GenericSignature.PackShapeDescriptor.Kind)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GenericSignature.PackShapeDescriptor.Kind and conformance GenericSignature.PackShapeDescriptor.Kind);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GenericSignature.ParameterDescriptor.Kind and conformance GenericSignature.ParameterDescriptor.Kind()
{
  unint64_t result = lazy protocol witness table cache variable for type GenericSignature.ParameterDescriptor.Kind and conformance GenericSignature.ParameterDescriptor.Kind;
  if (!lazy protocol witness table cache variable for type GenericSignature.ParameterDescriptor.Kind and conformance GenericSignature.ParameterDescriptor.Kind)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GenericSignature.ParameterDescriptor.Kind and conformance GenericSignature.ParameterDescriptor.Kind);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GenericSignature.RequirementDescriptor.Kind and conformance GenericSignature.RequirementDescriptor.Kind()
{
  unint64_t result = lazy protocol witness table cache variable for type GenericSignature.RequirementDescriptor.Kind and conformance GenericSignature.RequirementDescriptor.Kind;
  if (!lazy protocol witness table cache variable for type GenericSignature.RequirementDescriptor.Kind and conformance GenericSignature.RequirementDescriptor.Kind)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GenericSignature.RequirementDescriptor.Kind and conformance GenericSignature.RequirementDescriptor.Kind);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type MetadataInitializationKind and conformance MetadataInitializationKind()
{
  unint64_t result = lazy protocol witness table cache variable for type MetadataInitializationKind and conformance MetadataInitializationKind;
  if (!lazy protocol witness table cache variable for type MetadataInitializationKind and conformance MetadataInitializationKind)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MetadataInitializationKind and conformance MetadataInitializationKind);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ProtocolRequirement.Kind and conformance ProtocolRequirement.Kind()
{
  unint64_t result = lazy protocol witness table cache variable for type ProtocolRequirement.Kind and conformance ProtocolRequirement.Kind;
  if (!lazy protocol witness table cache variable for type ProtocolRequirement.Kind and conformance ProtocolRequirement.Kind)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ProtocolRequirement.Kind and conformance ProtocolRequirement.Kind);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ReferenceOwnership and conformance ReferenceOwnership()
{
  unint64_t result = lazy protocol witness table cache variable for type ReferenceOwnership and conformance ReferenceOwnership;
  if (!lazy protocol witness table cache variable for type ReferenceOwnership and conformance ReferenceOwnership)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ReferenceOwnership and conformance ReferenceOwnership);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type SpecialProtocol and conformance SpecialProtocol()
{
  unint64_t result = lazy protocol witness table cache variable for type SpecialProtocol and conformance SpecialProtocol;
  if (!lazy protocol witness table cache variable for type SpecialProtocol and conformance SpecialProtocol)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpecialProtocol and conformance SpecialProtocol);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type TypeReference.Kind and conformance TypeReference.Kind()
{
  unint64_t result = lazy protocol witness table cache variable for type TypeReference.Kind and conformance TypeReference.Kind;
  if (!lazy protocol witness table cache variable for type TypeReference.Kind and conformance TypeReference.Kind)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TypeReference.Kind and conformance TypeReference.Kind);
  }
  return result;
}

unint64_t protocol witness for CustomStringConvertible.description.getter in conformance TypeReference.Kind()
{
  return TypeReference.Kind.description.getter(*v0);
}

ValueMetadata *type metadata accessor for AnonymousDescriptor.Flags()
{
  return &type metadata for AnonymousDescriptor.Flags;
}

ValueMetadata *type metadata accessor for ConformanceDescriptor.Flags()
{
  return &type metadata for ConformanceDescriptor.Flags;
}

ValueMetadata *type metadata accessor for ContextDescriptor.Kind()
{
  return &type metadata for ContextDescriptor.Kind;
}

ValueMetadata *type metadata accessor for ExtendedExistentialShape.SpecialKind()
{
  return &type metadata for ExtendedExistentialShape.SpecialKind;
}

ValueMetadata *type metadata accessor for ExtendedExistentialShape.Flags()
{
  return &type metadata for ExtendedExistentialShape.Flags;
}

ValueMetadata *type metadata accessor for GenericSignature.Flags()
{
  return &type metadata for GenericSignature.Flags;
}

ValueMetadata *type metadata accessor for GenericSignature.LayoutKind()
{
  return &type metadata for GenericSignature.LayoutKind;
}

ValueMetadata *type metadata accessor for GenericSignature.PackShapeDescriptor.Kind()
{
  return &type metadata for GenericSignature.PackShapeDescriptor.Kind;
}

ValueMetadata *type metadata accessor for GenericSignature.ParameterDescriptor.Kind()
{
  return &type metadata for GenericSignature.ParameterDescriptor.Kind;
}

ValueMetadata *type metadata accessor for GenericSignature.RequirementDescriptor.Kind()
{
  return &type metadata for GenericSignature.RequirementDescriptor.Kind;
}

ValueMetadata *type metadata accessor for GenericSignature.RequirementDescriptor.Flags()
{
  return &type metadata for GenericSignature.RequirementDescriptor.Flags;
}

ValueMetadata *type metadata accessor for MetadataInitializationKind()
{
  return &type metadata for MetadataInitializationKind;
}

ValueMetadata *type metadata accessor for ProtocolDescriptor.Flags()
{
  return &type metadata for ProtocolDescriptor.Flags;
}

ValueMetadata *type metadata accessor for ProtocolRequirement.Kind()
{
  return &type metadata for ProtocolRequirement.Kind;
}

ValueMetadata *type metadata accessor for ProtocolRequirement.Flags()
{
  return &type metadata for ProtocolRequirement.Flags;
}

ValueMetadata *type metadata accessor for ReferenceOwnership()
{
  return &type metadata for ReferenceOwnership;
}

ValueMetadata *type metadata accessor for SpecialProtocol()
{
  return &type metadata for SpecialProtocol;
}

ValueMetadata *type metadata accessor for TypeDescriptor.Flags()
{
  return &type metadata for TypeDescriptor.Flags;
}

ValueMetadata *type metadata accessor for TypeReference.Kind()
{
  return &type metadata for TypeReference.Kind;
}

void protocol witness for Collection.endIndex.getter in conformance ConformanceSection(uint64_t *a1@<X8>)
{
  *a1 = *(void *)(v1 + 8) / 4;
}

uint64_t (*protocol witness for Collection.subscript.read in conformance ConformanceSection(uint64_t (*result)(), uint64_t *a2))()
{
  uint64_t v3 = *a2;
  if (*a2 < 0 || v3 >= v2[1] / 4)
  {
    __break(1u);
  }
  else
  {
    *(void *)unint64_t result = *v2 + 4 * v3 + *(int *)(*v2 + 4 * v3);
    return protocol witness for Collection.subscript.read in conformance FieldDescriptor;
  }
  return result;
}

void *protocol witness for Collection.subscript.getter in conformance ConformanceSection@<X0>(void *result@<X0>, void *a2@<X8>)
{
  uint64_t v3 = v2[1];
  if (v3 >= 0) {
    uint64_t v4 = v2[1];
  }
  else {
    uint64_t v4 = v3 + 3;
  }
  if (v3 < -3)
  {
    __break(1u);
    goto LABEL_9;
  }
  if ((*result & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v5 = result[1];
  if (v4 >> 2 >= v5)
  {
    uint64_t v6 = *v2;
    *a2 = *result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v3;
    return result;
  }
LABEL_10:
  __break(1u);
  return result;
}

void protocol witness for Collection.indices.getter in conformance ConformanceSection(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  uint64_t v3 = v2 + 3;
  if (v2 >= 0) {
    uint64_t v3 = v1[1];
  }
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = 0;
  a1[3] = v3 >> 2;
}

BOOL protocol witness for Collection.isEmpty.getter in conformance ConformanceSection()
{
  return (unint64_t)(*(void *)(v0 + 8) + 3) < 7;
}

void *protocol witness for Collection.index(_:offsetBy:) in conformance ConformanceSection@<X0>(void *result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if (a2 < 0) {
    __break(1u);
  }
  else {
    *a3 = *result + a2;
  }
  return result;
}

uint64_t protocol witness for Collection.index(_:offsetBy:limitedBy:) in conformance ConformanceSection@<X0>(uint64_t *a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result = specialized Collection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3);
  *(void *)a4 = result;
  *(unsigned char *)(a4 + 8) = v6 & 1;
  return result;
}

uint64_t *protocol witness for Collection.distance(from:to:) in conformance ConformanceSection(uint64_t *result, void *a2)
{
  uint64_t v2 = *result;
  uint64_t v4 = (uint64_t *)(*a2 - *result);
  BOOL v3 = *a2 == *result;
  if (*a2 < *result)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  uint64_t result = 0;
  if (!v3)
  {
    unint64_t v5 = *a2 + ~v2;
    while (v5 <= 0x7FFFFFFFFFFFFFFELL)
    {
      uint64_t result = (uint64_t *)((char *)result + 1);
      if (v4 == result) {
        return result;
      }
    }
    __break(1u);
    goto LABEL_8;
  }
  return result;
}

unint64_t protocol witness for Collection.count.getter in conformance ConformanceSection()
{
  uint64_t v1 = *(void *)(v0 + 8);
  if (v1 < -3)
  {
    __break(1u);
  }
  else
  {
    unint64_t v2 = v1 + 3;
    unint64_t v3 = v1 / 4 - 1;
    if (v3 >= 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v2 >= 7) {
      return v3 + 1;
    }
    else {
      return 0;
    }
  }
  return result;
}

int *protocol witness for Sequence._copyToContiguousArray() in conformance ConformanceSection()
{
  return specialized _copyCollectionToContiguousArray<A>(_:)(*(int **)v0, *(void *)(v0 + 8));
}

void *protocol witness for Sequence._copyContents(initializing:) in conformance ConformanceSection(void *a1, void *a2, uint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *(int **)v3, *(void *)(v3 + 8));
}

uint64_t one-time initialization function for initializeConformanceLookup()
{
  uint64_t v0 = MEMORY[0x263F8EE78];
  unint64_t v1 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<(conformers: [ProtocolDescriptor : [Any.Type]], lastSectionCount: Int), os_unfair_lock_s>);
  uint64_t v2 = swift_allocObject();
  *(_DWORD *)(v2 + 32) = 0;
  *(void *)(v2 + 16) = v1;
  *(void *)(v2 + 24) = 0;
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, 10, 0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<ContiguousArray<ConformanceSection>, os_unfair_lock_s>);
  uint64_t v3 = swift_allocObject();
  *(_DWORD *)(v3 + 24) = 0;
  *(void *)(v3 + 16) = v0;
  uint64_t v4 = conformances;
  conformances = v3;
  qword_26A5066C8 = v2;
  outlined consume of ConformanceCache?(v4);
  uint64_t result = initializeProtocolConformanceLookup();
  initializeConformanceLookup = (uint64_t)protocol witness for Collection.subscript.read in conformance FieldDescriptor;
  *(void *)algn_26A5066B8 = 0;
  return result;
}

uint64_t addImageProtocolConformanceBlockCallbackUnsafe(uint64_t result)
{
  uint64_t v1 = conformances;
  if (conformances)
  {
    MEMORY[0x270FA5388](result);
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 24));
    partial apply for closure #1 in addImageProtocolConformanceBlockCallbackUnsafe(baseAddress:start:size:)((uint64_t *)(v1 + 16));
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 24));
    return swift_release();
  }
  return result;
}

uint64_t closure #1 in addImageProtocolConformanceBlockCallbackUnsafe(baseAddress:start:size:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v6;
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v6 + 16) + 1, 1);
    uint64_t v6 = *a1;
  }
  unint64_t v9 = *(void *)(v6 + 16);
  unint64_t v8 = *(void *)(v6 + 24);
  if (v9 >= v8 >> 1)
  {
    uint64_t result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v8 > 1), v9 + 1, 1);
    uint64_t v6 = *a1;
  }
  *(void *)(v6 + 16) = v9 + 1;
  uint64_t v10 = v6 + 16 * v9;
  *(void *)(v10 + 32) = a2;
  *(void *)(v10 + 40) = a3;
  *a1 = v6;
  return result;
}

uint64_t partial apply for closure #1 in addImageProtocolConformanceBlockCallbackUnsafe(baseAddress:start:size:)(uint64_t *a1)
{
  return closure #1 in addImageProtocolConformanceBlockCallbackUnsafe(baseAddress:start:size:)(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t ConformanceDescriptor._canonicalTypeMetadata.getter(uint64_t a1)
{
  swift_getKeyPath();
  uint64_t v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  if ((*(_DWORD *)TypeReference.descriptor(_:)((*(unsigned char *)(a1 + 12) >> 3) & 7, (int *)(a1 + v2)) & 0x1Fu) - 16 > 2) {
    return 0;
  }
  swift_getKeyPath();
  uint64_t v3 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  unsigned int v4 = *(_DWORD *)(a1 + 12);
  if (*(_DWORD *)TypeReference.descriptor(_:)((v4 >> 3) & 7, (int *)(a1 + v3)) & 0x80 | v4 & 0xFF00) {
    return 0;
  }
  swift_getKeyPath();
  uint64_t v5 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  uint64_t v6 = TypeReference.descriptor(_:)((*(unsigned char *)(a1 + 12) >> 3) & 7, (int *)(a1 + v5));
  swift_getKeyPath();
  uint64_t v7 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_getAtKeyPath();
  swift_release();
  return ((uint64_t (*)(void))(v6 + v7 + v9))(0);
}

uint64_t _withConformanceCache(for:do:)(uint64_t a1, uint64_t (*a2)(void))
{
  if (one-time initialization token for initializeConformanceLookup != -1) {
    swift_once();
  }
  initializeConformanceLookup();
  uint64_t v3 = conformances;
  if (!conformances) {
    return a2(MEMORY[0x263F8EE78]);
  }
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 24));
  closure #1 in _withConformanceCache(for:do:)((void *)(v3 + 16), &v7);
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 24));
  uint64_t v4 = swift_release();
  if (conformances)
  {
    uint64_t v5 = qword_26A5066C8;
    MEMORY[0x270FA5388](v4);
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v5 + 32));
    partial apply for closure #2 in _withConformanceCache(for:do:)((uint64_t *)(v5 + 16), &v7);
    os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 32));
    swift_release();
    return swift_release();
  }
  else
  {
    return swift_release();
  }
}

uint64_t closure #1 in _withConformanceCache(for:do:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t closure #2 in _withConformanceCache(for:do:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, Swift::UInt a3@<X2>, void (*a4)(uint64_t)@<X3>, unsigned char *a5@<X8>)
{
  uint64_t v5 = a2;
  uint64_t v6 = a1;
  uint64_t v36 = *(void *)(a2 + 16);
  if (a1[1] >= v36)
  {
    if (*(void *)(*a1 + 16))
    {
      specialized __RawDictionaryStorage.find<A>(_:)(a3);
      uint64_t v5 = a2;
      uint64_t v6 = a1;
      if (v9)
      {
        uint64_t v10 = swift_bridgeObjectRetain();
        a4(v10);
        uint64_t result = swift_bridgeObjectRelease();
LABEL_28:
        *a5 = 0;
        return result;
      }
    }
  }
  BOOL v32 = v6;
  if (!v36)
  {
    uint64_t v29 = MEMORY[0x263F8EE78];
LABEL_27:
    uint64_t v30 = swift_bridgeObjectRetain();
    a4(v30);
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v40 = *v32;
    *BOOL v32 = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v29, a3, isUniquelyReferenced_nonNull_native);
    *BOOL v32 = v40;
    uint64_t result = swift_bridgeObjectRelease();
    v32[1] = v36;
    goto LABEL_28;
  }
  uint64_t v35 = v5 + 32;
  uint64_t result = swift_retain();
  uint64_t v12 = 0;
  uint64_t v38 = MEMORY[0x263F8EE78];
  while (1)
  {
    uint64_t v13 = (uint64_t *)(v35 + 16 * v12);
    uint64_t v14 = v13[1];
    unint64_t v15 = v14 + 3;
    uint64_t v16 = v14 + (v14 < 0 ? 3uLL : 0);
    uint64_t v37 = v12;
    if (v15 >= 7) {
      break;
    }
LABEL_7:
    uint64_t v12 = v37 + 1;
    if (v37 + 1 == v36)
    {
      swift_release();
      uint64_t v29 = v38;
      goto LABEL_27;
    }
  }
  uint64_t v17 = 0;
  uint64_t v18 = *v13;
  uint64_t v19 = v16 >> 2;
  uint64_t v20 = 4 * ((v16 >> 2) & ~(v16 >> 63));
  while (v20 != v17)
  {
    uint64_t v21 = *(int *)(v18 + v17);
    if ((*(unsigned char *)(v18 + v17 + v21 + 12) & 0x30) == 0)
    {
      swift_getKeyPath();
      uint64_t v22 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
      uint64_t result = swift_release();
      uint64_t v23 = *(int *)(v18 + v22 + v21 + v17);
      unint64_t v24 = v22 + v21 + (v23 & 0xFFFFFFFFFFFFFFFELL);
      uint64_t v25 = (v23 & 1) != 0 ? *(void *)(v18 + v24 + v17) : v18 + v17 + v24;
      if (v25 == a3)
      {
        uint64_t result = ConformanceDescriptor._canonicalTypeMetadata.getter(v18 + v17 + v21);
        if (result)
        {
          uint64_t v26 = result;
          if (swift_isUniquelyReferenced_nonNull_native()) {
            uint64_t result = v38;
          }
          else {
            uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v38 + 16) + 1, 1, (char *)v38);
          }
          unint64_t v28 = *(void *)(result + 16);
          unint64_t v27 = *(void *)(result + 24);
          if (v28 >= v27 >> 1) {
            uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v27 > 1), v28 + 1, 1, (char *)result);
          }
          *(void *)(result + 16) = v28 + 1;
          uint64_t v38 = result;
          *(void *)(result + 8 * v28 + 32) = v26;
        }
      }
    }
    v17 += 4;
    if (!--v19) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t partial apply for closure #2 in _withConformanceCache(for:do:)@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return closure #2 in _withConformanceCache(for:do:)(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void (**)(uint64_t))(v2 + 32), a2);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in ConformanceSection()
{
  return lazy protocol witness table accessor for type Slice<FieldDescriptor> and conformance Slice<A>(&lazy protocol witness table cache variable for type IndexingIterator<ConformanceSection> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<ConformanceSection>);
}

unint64_t lazy protocol witness table accessor for type ConformanceSection and conformance ConformanceSection()
{
  unint64_t result = lazy protocol witness table cache variable for type ConformanceSection and conformance ConformanceSection;
  if (!lazy protocol witness table cache variable for type ConformanceSection and conformance ConformanceSection)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ConformanceSection and conformance ConformanceSection);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.Indices : Collection in ConformanceSection()
{
  return lazy protocol witness table accessor for type Slice<FieldDescriptor> and conformance Slice<A>(&lazy protocol witness table cache variable for type DefaultIndices<ConformanceSection> and conformance DefaultIndices<A>, &demangling cache variable for type metadata for DefaultIndices<ConformanceSection>);
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in ConformanceSection()
{
  return lazy protocol witness table accessor for type Slice<FieldDescriptor> and conformance Slice<A>(&lazy protocol witness table cache variable for type Slice<ConformanceSection> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<ConformanceSection>);
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 12);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<FieldDescriptor.Element>);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 25;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 3);
  if (specialized Sequence._copyContents(initializing:)(&v7, v3 + 4, v1, a1) != (void *)v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(void *result)
{
  uint64_t v1 = result[1];
  if ((v1 & 0x8000000000000000) == 0)
  {
    if (v1)
    {
      uint64_t v2 = (uint64_t)result;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<TupleMetadata.Elements.Element>);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = _swift_stdlib_malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 17;
      }
      v3[2] = v1;
      v3[3] = 2 * (v5 >> 4);
      if (specialized Sequence._copyContents(initializing:)(&v6, v3 + 4, v1, v2) == (void *)v1) {
        return v3;
      }
      __break(1u);
    }
    return (void *)MEMORY[0x263F8EE78];
  }
  __break(1u);
  return result;
}

int *specialized _copyCollectionToContiguousArray<A>(_:)(int *result, uint64_t a2)
{
  if (a2 >= 0) {
    uint64_t v2 = a2;
  }
  else {
    uint64_t v2 = a2 + 3;
  }
  if (a2 < -3)
  {
    __break(1u);
  }
  else
  {
    if ((unint64_t)(a2 + 3) <= 6) {
      return (int *)MEMORY[0x263F8EE78];
    }
    uint64_t v5 = result;
    unint64_t v6 = (v2 >> 2) - 1;
    if (v6 >= 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    }
    uint64_t v7 = v6 + 1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ConformanceDescriptor>);
    uint64_t v3 = (void *)swift_allocObject();
    int64_t v8 = _swift_stdlib_malloc_size(v3);
    uint64_t v9 = v8 - 32;
    if (v8 < 32) {
      uint64_t v9 = v8 - 25;
    }
    v3[2] = v7;
    v3[3] = 2 * (v9 >> 3);
    unint64_t result = (int *)specialized Sequence._copySequenceContents(initializing:)(v10, v3 + 4, v7, v5, a2);
    if (result == (int *)v7) {
      return (int *)v3;
    }
  }
  __break(1u);
  return result;
}

void *specialized Sequence._copySequenceContents(initializing:)(void *result, void *a2, uint64_t a3, int *a4, uint64_t a5)
{
  if (!a2)
  {
LABEL_8:
    a3 = 0;
    goto LABEL_9;
  }
  if (!a3)
  {
LABEL_9:
    *unint64_t result = a4;
    result[1] = a5;
    result[2] = a3;
    return (void *)a3;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  if (a5 >= 0) {
    uint64_t v5 = a5;
  }
  else {
    uint64_t v5 = a5 + 3;
  }
  if ((unint64_t)(a5 + 3) < 7) {
    goto LABEL_8;
  }
  if (a5 >= 4)
  {
    *a2 = (char *)a4 + *a4;
    unint64_t v6 = a3 - 1;
    if (a3 == 1) {
      goto LABEL_9;
    }
    uint64_t v7 = v5 >> 2;
    unint64_t v8 = a3 - 2;
    if (a3 - 2 >= (unint64_t)(v7 - 1)) {
      unint64_t v9 = v7 - 1;
    }
    else {
      unint64_t v9 = a3 - 2;
    }
    if (v9 >= v6) {
      unint64_t v9 = a3 - 1;
    }
    unint64_t v10 = v9 + 1;
    if (v10 <= 0x10) {
      goto LABEL_24;
    }
    if (v8 >= v7 - 1) {
      unint64_t v8 = v7 - 1;
    }
    if (v8 < v6) {
      unint64_t v6 = v8;
    }
    if (a2 + 1 >= (void *)&a4[v6 + 2] || a4 + 1 >= (int *)&a2[v6 + 2])
    {
      uint64_t v13 = v10 & 7;
      if ((v10 & 7) == 0) {
        uint64_t v13 = 8;
      }
      unint64_t v14 = v10 - v13;
      uint64_t v11 = v10 - v13 + 1;
      uint64_t v12 = &a2[v14];
      uint64_t v15 = (uint64_t)(a4 + 8);
      uint64_t v16 = (int64x2_t *)(a2 + 5);
      do
      {
        v17.i64[0] = v15 - 20;
        v17.i64[1] = v15 - 16;
        int32x4_t v18 = *(int32x4_t *)(v15 - 28);
        v19.i64[0] = v15 - 28;
        v19.i64[1] = v15 - 24;
        v20.i64[0] = v15 - 4;
        v20.i64[1] = v15;
        int32x4_t v21 = *(int32x4_t *)(v15 - 12);
        v22.i64[0] = v15 - 12;
        v22.i64[1] = v15 - 8;
        v16[-2] = vaddw_s32(v19, *(int32x2_t *)v18.i8);
        v16[-1] = vaddw_high_s32(v17, v18);
        *uint64_t v16 = vaddw_s32(v22, *(int32x2_t *)v21.i8);
        v16[1] = vaddw_high_s32(v20, v21);
        v16 += 4;
        v15 += 32;
        v14 -= 8;
      }
      while (v14);
    }
    else
    {
LABEL_24:
      uint64_t v11 = 1;
      uint64_t v12 = a2;
    }
    uint64_t v23 = -v11;
    unint64_t v24 = &a4[v11];
    uint64_t v25 = v12 + 1;
    while (a3 + v23)
    {
      if (!(v7 + v23))
      {
        a3 = v7;
        goto LABEL_9;
      }
      *v25++ = (char *)v24 + *v24;
      --v23;
      ++v24;
      if (!(a3 + v23)) {
        goto LABEL_9;
      }
    }
    __break(1u);
LABEL_36:
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(Swift::UInt a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  Swift::Int v2 = Hasher._finalize()();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
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

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, Swift::UInt a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = specialized __RawDictionaryStorage.find<A>(_:)(a2);
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
    uint64_t result = (uint64_t)specialized _NativeDictionary.copy()();
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
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(result, a3 & 1);
  uint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(a2);
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
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

void *specialized _NativeDictionary.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<TypeCache.Key, Metadata?>);
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
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v22 = __clz(__rbit64(v20));
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = v22 + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = 8 * v15;
    uint64_t v18 = *(void *)(*(void *)(v2 + 56) + v17);
    *(_OWORD *)(*(void *)(v4 + 48) + v16) = *(_OWORD *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v17) = v18;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
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
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<ProtocolDescriptor, [Any.Type]>);
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
    uint64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    int64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      int64_t v19 = *(void *)(v6 + 8 * v9);
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
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  unint64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  int64_t v19 = *(void *)(v6 + 8 * v20);
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
    int64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  void *v3 = result;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ConformanceSection>);
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
    memcpy(v13, v14, 16 * v8);
  }
  swift_release();
  return v10;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any.Type>);
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
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t specialized Collection.index(_:offsetBy:limitedBy:)(uint64_t result, unint64_t a2, uint64_t a3)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (a2)
  {
    if (result == a3)
    {
      return 0;
    }
    else
    {
      uint64_t v3 = result + 1;
      unint64_t v4 = a2 - 2;
      if (a2 < 2)
      {
        ++result;
      }
      else
      {
        if (~result + a3 < v4) {
          unint64_t v4 = ~result + a3;
        }
        unint64_t v5 = v4 + 1;
        if (v5 >= 0x21)
        {
          uint64_t v7 = v5 & 0x1F;
          if ((v5 & 0x1F) == 0) {
            uint64_t v7 = 32;
          }
          unint64_t v8 = v5 - v7;
          uint64_t v6 = v8 + 1;
          v3 += v8;
          do
            v8 -= 32;
          while (v8);
        }
        else
        {
          uint64_t v6 = 1;
        }
        unint64_t v9 = a2 - v6;
        uint64_t result = v3;
        while (a3 != result)
        {
          ++result;
          if (!--v9) {
            return result;
          }
        }
        return 0;
      }
    }
  }
  return result;
}

uint64_t outlined consume of ConformanceCache?(uint64_t result)
{
  if (result)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

ValueMetadata *type metadata accessor for ConformanceSection()
{
  return &type metadata for ConformanceSection;
}

uint64_t HeapObject.type.getter(uint64_t a1)
{
  swift_getKeyPath();
  uint64_t v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  return *(void *)(a1 + v2);
}

BOOL static HeapObject.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void HeapObject.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int HeapObject.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type HeapObject and conformance HeapObject()
{
  unint64_t result = lazy protocol witness table cache variable for type HeapObject and conformance HeapObject;
  if (!lazy protocol witness table cache variable for type HeapObject and conformance HeapObject)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type HeapObject and conformance HeapObject);
  }
  return result;
}

ValueMetadata *type metadata accessor for HeapObject()
{
  return &type metadata for HeapObject;
}

uint64_t type metadata accessor for Lock()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t StructDescriptor.fieldOffsetVectorOffset.getter(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t StructDescriptor.numberOfFields.getter(uint64_t a1)
{
  return *(unsigned int *)(a1 + 20);
}

unsigned char *StructDescriptor.genericSignature.getter(char *a1)
{
  char v2 = *a1;
  unint64_t result = a1 + 36;
  if ((v2 & 0x80) == 0) {
    return 0;
  }
  return result;
}

BOOL static StructDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void StructDescriptor.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int StructDescriptor.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type StructDescriptor and conformance StructDescriptor()
{
  unint64_t result = lazy protocol witness table cache variable for type StructDescriptor and conformance StructDescriptor;
  if (!lazy protocol witness table cache variable for type StructDescriptor and conformance StructDescriptor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type StructDescriptor and conformance StructDescriptor);
  }
  return result;
}

uint64_t SignedLayout.address<A>(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  uint64_t v6 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  return *v6 + v5;
}

uint64_t SignedLayout.trailing.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))() + 8;
}

uint64_t SignedLayout.layout.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = (uint64_t *)(*(uint64_t (**)(void))(a2 + 24))();
  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  uint64_t v7 = *v6;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  unint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16);

  return v9(a3, v7, AssociatedTypeWitness);
}

uint64_t PublicLayout.address<A>(for:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = a4;
  uint64_t v22 = *(void *)(*a1 + *MEMORY[0x263F8EA20] + 8);
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](a1);
  unint64_t v8 = (char *)&v20 - v7;
  uint64_t v10 = *v9;
  uint64_t v11 = *(void *)(*v9 - 8);
  MEMORY[0x270FA5388](v6);
  int64_t v13 = (char *)&v20 - v12;
  uint64_t v21 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  unint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 16);
  uint64_t v15 = v14(a2, a3);
  UnsafeRawPointer.unprotectedLoad<A>(fromByteOffset:as:)(0, v15, v10, (uint64_t)v13);
  swift_getAtKeyPath();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v16 = v14(a2, a3);
  uint64_t v17 = v22;
  uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 24))(v16 + v21, v22);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v17);
  return v18;
}

uint64_t PublicLayout.trailing.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (*(uint64_t (**)(void))(a2 + 16))();
  return v2 + *(void *)(*(void *)(swift_getAssociatedTypeWitness() - 8) + 64);
}

uint64_t PublicLayout.layout.getter@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3 = (*(uint64_t (**)(void))(a1 + 16))();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();

  return UnsafeRawPointer.unprotectedLoad<A>(fromByteOffset:as:)(0, v3, AssociatedTypeWitness, a2);
}

uint64_t PublicLayout.unappliedAddress<A>(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  return (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3) + v5;
}

uint64_t PublicLayout.address<A>(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  return (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3) + v5;
}

uint64_t PublicLayout.address<A, B>(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  uint64_t v7 = type metadata accessor for UnsafePointer();
  UnsafeRawPointer.unprotectedLoad<A>(fromByteOffset:as:)(0, v6, v7, (uint64_t)&v9);
  return v9 + v5;
}

uint64_t SignedLayout.authedPtr.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(void))(a2 + 24))();
  (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  return *(void *)v4;
}

uint64_t dispatch thunk of PublicLayout.ptr.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PublicLayout.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of SignedLayout.discriminator.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of SignedLayout.ptr.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of SignedLayout.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

BOOL static ProtocolDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t ProtocolDescriptor.flags.getter(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 2);
}

uint64_t ProtocolDescriptor.name.getter()
{
  return ProtocolDescriptor.name.getter();
}

{
  swift_getKeyPath();
  dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_getAtKeyPath();
  swift_release();
  return String.init(cString:)();
}

uint64_t ProtocolDescriptor.requirementSignature.getter(uint64_t a1)
{
  return a1 + 24;
}

uint64_t ProtocolDescriptor.requirements.getter(uint64_t a1)
{
  return a1 + 12 * *(unsigned int *)(a1 + 12) + 24;
}

uint64_t ProtocolDescriptor.associatedTypeNames.getter()
{
  return ProtocolDescriptor.name.getter();
}

uint64_t ProtocolRequirement.flags.getter(unsigned int *a1)
{
  return *a1;
}

void ProtocolDescriptor.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int ProtocolDescriptor.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type ProtocolDescriptor and conformance ProtocolDescriptor()
{
  unint64_t result = lazy protocol witness table cache variable for type ProtocolDescriptor and conformance ProtocolDescriptor;
  if (!lazy protocol witness table cache variable for type ProtocolDescriptor and conformance ProtocolDescriptor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ProtocolDescriptor and conformance ProtocolDescriptor);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ProtocolRequirement and conformance ProtocolRequirement()
{
  unint64_t result = lazy protocol witness table cache variable for type ProtocolRequirement and conformance ProtocolRequirement;
  if (!lazy protocol witness table cache variable for type ProtocolRequirement and conformance ProtocolRequirement)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ProtocolRequirement and conformance ProtocolRequirement);
  }
  return result;
}

ValueMetadata *type metadata accessor for ProtocolDescriptor()
{
  return &type metadata for ProtocolDescriptor;
}

ValueMetadata *type metadata accessor for ProtocolRequirement()
{
  return &type metadata for ProtocolRequirement;
}

uint64_t ClassDescriptor.genericArgumentOffset.getter(_DWORD *a1)
{
  int v2 = HIWORD(*a1);
  if ((v2 & 0x2000) != 0)
  {
    swift_getKeyPath();
    uint64_t v4 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
    swift_release();
    return *(void *)((char *)a1 + v4 + *(int *)((char *)a1 + v4)) / 8;
  }
  else if ((v2 & 0x1000) != 0)
  {
    return -(uint64_t)a1[6];
  }
  else
  {
    return (a1[7] - a1[8]);
  }
}

uint64_t ClassDescriptor.fieldOffsetVectorOffset.getter(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t ClassDescriptor.numberOfFields.getter(uint64_t a1)
{
  return *(unsigned int *)(a1 + 36);
}

unsigned char *ClassDescriptor.genericSignature.getter(char *a1)
{
  char v2 = *a1;
  unint64_t result = a1 + 52;
  if ((v2 & 0x80) == 0) {
    return 0;
  }
  return result;
}

uint64_t ClassDescriptor.resilientImmediateMembersOffset.getter(uint64_t a1)
{
  swift_getKeyPath();
  uint64_t v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  return *(void *)(a1 + v2 + *(int *)(a1 + v2));
}

uint64_t ClassDescriptor.nonResilientImmediateMembersOffset.getter(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 3) & 0x10) != 0) {
    return -(uint64_t)*(unsigned int *)(a1 + 24);
  }
  else {
    return (*(_DWORD *)(a1 + 28) - *(_DWORD *)(a1 + 32));
  }
}

BOOL static ClassDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void ClassDescriptor.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int ClassDescriptor.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type ClassDescriptor and conformance ClassDescriptor()
{
  unint64_t result = lazy protocol witness table cache variable for type ClassDescriptor and conformance ClassDescriptor;
  if (!lazy protocol witness table cache variable for type ClassDescriptor and conformance ClassDescriptor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ClassDescriptor and conformance ClassDescriptor);
  }
  return result;
}

uint64_t AnonymousDescriptor.anonymousFlags.getter(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 2);
}

unsigned char *AnonymousDescriptor.genericSignature.getter(char *a1)
{
  char v2 = *a1;
  unint64_t result = a1 + 8;
  if ((v2 & 0x80) == 0) {
    return 0;
  }
  return result;
}

BOOL static AnonymousDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void AnonymousDescriptor.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int AnonymousDescriptor.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type AnonymousDescriptor and conformance AnonymousDescriptor()
{
  unint64_t result = lazy protocol witness table cache variable for type AnonymousDescriptor and conformance AnonymousDescriptor;
  if (!lazy protocol witness table cache variable for type AnonymousDescriptor and conformance AnonymousDescriptor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AnonymousDescriptor and conformance AnonymousDescriptor);
  }
  return result;
}

ValueMetadata *type metadata accessor for AnonymousDescriptor()
{
  return &type metadata for AnonymousDescriptor;
}

uint64_t TypeDescriptor.accessor.getter(uint64_t a1)
{
  return TypeDescriptor.accessor.getter(a1);
}

{
  uint64_t v2;
  int v4;

  swift_getKeyPath();
  char v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_getAtKeyPath();
  swift_release();
  return a1 + v2 + v4;
}

uint64_t TypeDescriptor.flags.getter(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 2);
}

uint64_t TypeDescriptor.name.getter()
{
  return String.init(cString:)();
}

uint64_t TypeDescriptor.fields.getter(uint64_t a1)
{
  return TypeDescriptor.accessor.getter(a1);
}

uint64_t TypeDescriptor.sizeOfSelf.getter(_DWORD *a1)
{
  if ((*a1 & 0x1Fu) - 17 >= 2) {
    return 44;
  }
  else {
    return 28;
  }
}

BOOL static TypeDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void TypeDescriptor.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int TypeDescriptor.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type TypeDescriptor and conformance TypeDescriptor()
{
  unint64_t result = lazy protocol witness table cache variable for type TypeDescriptor and conformance TypeDescriptor;
  if (!lazy protocol witness table cache variable for type TypeDescriptor and conformance TypeDescriptor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TypeDescriptor and conformance TypeDescriptor);
  }
  return result;
}

ValueMetadata *type metadata accessor for TypeDescriptor()
{
  return &type metadata for TypeDescriptor;
}

uint64_t AnyExistentialContainer.storage.setter(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *uint64_t v4 = result;
  v4[1] = a2;
  v4[2] = a3;
  v4[3] = a4;
  return result;
}

uint64_t (*AnyExistentialContainer.storage.modify())()
{
  return protocol witness for Collection.subscript.read in conformance FieldDescriptor;
}

uint64_t AnyExistentialContainer.metadata.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a4;
}

uint64_t AnyExistentialContainer.init(metadata:)()
{
  return 0;
}

uint64_t AnyExistentialContainer.init(type:)()
{
  return 0;
}

uint64_t AnyExistentialContainer.allocateBox(_:)(uint64_t (*a1)(uint64_t *))
{
  if ((*(unsigned char *)(*(void *)(v1[3] - 8) + 82) & 2) != 0)
  {
    *uint64_t v1 = swift_allocBox();
    uint64_t v3 = v4;
  }
  else
  {
    uint64_t v3 = v1;
  }
  return a1(v3);
}

uint64_t _ss24withUnsafeMutablePointer2to_q0_xz_q0_SpyxGq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void *)(a5 - 8);
  uint64_t v12 = MEMORY[0x270FA5388]();
  unint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = v15(v12, v14);
  if (v8) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a8, v14, a5);
  }
  return result;
}

uint64_t AnyExistentialContainer.projectValue<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if ((*(_DWORD *)(*(void *)(*(void *)(v4 + 24) - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v14 = a3;
    uint64_t v15 = MEMORY[0x270FA5388](a1);
    uint64_t v16 = v10;
    uint64_t v17 = v11;
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    uint64_t v8 = MEMORY[0x263F8E4E0];
    uint64_t v9 = partial apply for closure #2 in AnyExistentialContainer.projectValue<A>(_:);
  }
  else
  {
    uint64_t v14 = a3;
    uint64_t v15 = MEMORY[0x270FA5388](a1);
    uint64_t v16 = v6;
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    uint64_t v8 = MEMORY[0x263F8E4E0];
    uint64_t v9 = partial apply for closure #1 in AnyExistentialContainer.projectValue<A>(_:);
  }
  return _ss24withUnsafeMutablePointer2to_q0_xz_q0_SpyxGq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF(v4, (uint64_t)v9, (uint64_t)&v13, (uint64_t)&type metadata for AnyExistentialContainer, v7, a3, v8, (uint64_t)&v18);
}

Swift::Void __swiftcall AnyExistentialContainer.deallocate()()
{
  if ((*(unsigned char *)(*(void *)(v0 - 8) + 82) & 2) != 0) {
    MEMORY[0x270FA0220]();
  }
}

__n128 ExistentialContainer.storage.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(void *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(v1 + 24);
  *(__n128 *)(a1 + 24) = result;
  return result;
}

uint64_t ExistentialContainer.storage.setter(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *uint64_t v5 = result;
  v5[1] = a2;
  v5[2] = a3;
  v5[3] = a4;
  v5[4] = a5;
  return result;
}

uint64_t (*ExistentialContainer.storage.modify())()
{
  return protocol witness for Collection.subscript.read in conformance FieldDescriptor;
}

uint64_t ExistentialContainer.base.getter()
{
  return *(void *)v0;
}

uint64_t ExistentialContainer.witnessTable.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t partial apply for closure #2 in AnyExistentialContainer.projectValue<A>(_:)(void *a1, void *a2)
{
  uint64_t result = (*(uint64_t (**)(void))(v2 + 24))(*a1 + *(void *)(v2 + 40));
  if (v3) {
    *a2 = v3;
  }
  return result;
}

uint64_t partial apply for closure #1 in AnyExistentialContainer.projectValue<A>(_:)(uint64_t a1, void *a2)
{
  uint64_t result = (*(uint64_t (**)(void))(v2 + 24))();
  if (v3) {
    *a2 = v3;
  }
  return result;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for AnyExistentialContainer(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)(a1 + 24)) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for AnyExistentialContainer(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    if (a3 >= 2) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AnyExistentialContainer()
{
  return &type metadata for AnyExistentialContainer;
}

uint64_t initializeBufferWithCopyOfBuffer for ExistentialContainer(uint64_t *a1, uint64_t *a2)
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

uint64_t getEnumTagSinglePayload for ExistentialContainer(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)(a1 + 24)) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for ExistentialContainer(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(void *)(result + 24) = 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExistentialContainer()
{
  return &type metadata for ExistentialContainer;
}

uint64_t ContextDescriptor.flags.getter(unsigned int *a1)
{
  return *a1;
}

BOOL ContextDescriptor.isType.getter(_DWORD *a1)
{
  return (*a1 & 0x1Fu) - 16 < 3;
}

uint64_t ContextDescriptor.parent.getter(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 4)) {
    return 0;
  }
  swift_getKeyPath();
  uint64_t v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  return specialized static PtrAuth.relativeContext<A>(_:)(a1 + v2);
}

uint64_t ContextDescriptor.sizeOfSelf.getter(_DWORD *a1)
{
  int v1 = *a1 & 0x1F;
  uint64_t result = 12;
  switch(v1)
  {
    case 0:
    case 1:
      return result;
    case 2:
    case 4:
      uint64_t result = 8;
      break;
    case 3:
      uint64_t result = 24;
      break;
    case 16:
      uint64_t result = 44;
      break;
    default:
      uint64_t result = 28;
      break;
  }
  return result;
}

_DWORD *ContextDescriptor.genericSignature.getter(_DWORD *a1)
{
  if ((*a1 & 0x80) == 0) {
    return 0;
  }
  switch(*a1 & 0x1F)
  {
    case 0:
    case 1:
      uint64_t result = a1 + 3;
      break;
    case 2:
    case 4:
      uint64_t result = a1 + 2;
      break;
    case 3:
      uint64_t result = a1 + 6;
      break;
    case 0x10:
      uint64_t result = a1 + 11;
      break;
    default:
      uint64_t result = a1 + 7;
      break;
  }
  return result;
}

BOOL static ContextDescriptor.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void ContextDescriptor.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int ContextDescriptor.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type ContextDescriptor and conformance ContextDescriptor()
{
  unint64_t result = lazy protocol witness table cache variable for type ContextDescriptor and conformance ContextDescriptor;
  if (!lazy protocol witness table cache variable for type ContextDescriptor and conformance ContextDescriptor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContextDescriptor and conformance ContextDescriptor);
  }
  return result;
}

unint64_t specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(unint64_t result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = *(unsigned int *)(a4 + 12);
  if (v4 < result || v4 < a3)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = a3 - result;
  if (a2 >= 1)
  {
    if (v6 < 0 || v6 >= (unint64_t)a2) {
      goto LABEL_13;
    }
    return 0;
  }
  if (v6 <= 0 && v6 > a2) {
    return 0;
  }
LABEL_13:
  BOOL v7 = __OFADD__(result, a2);
  result += a2;
  if (v7) {
    goto LABEL_16;
  }
  if (result > v4) {
LABEL_17:
  }
    __break(1u);
  return result;
}

uint64_t specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a4 + 8);
  if (v4 < a3 || (a3 | result) < 0 || v4 < result)
  {
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v5 = a3 - result;
  if (a2 >= 1)
  {
    if (v5 < 0 || v5 >= a2) {
      goto LABEL_11;
    }
    return 0;
  }
  if (v5 <= 0 && v5 > a2) {
    return 0;
  }
LABEL_11:
  BOOL v6 = __OFADD__(result, a2);
  result += a2;
  if (v6)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    return result;
  }
  if (result < 0 || v4 < result) {
    goto LABEL_17;
  }
  return result;
}

void *specialized Sequence._copyContents(initializing:)(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  if (!a2) {
    goto LABEL_9;
  }
  if (!a3)
  {
LABEL_10:
    *unint64_t result = a4;
    result[1] = a3;
    return (void *)a3;
  }
  if (a3 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v4 = *(void *)(a4 + 8);
  if (!v4)
  {
LABEL_9:
    a3 = 0;
    goto LABEL_10;
  }
  if (v4 < 1)
  {
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  *a2 = a4 + 24;
  a2[1] = 0;
  if (a3 == 1) {
    goto LABEL_10;
  }
  uint64_t v5 = *(void *)(a4 + 8);
  if (v5 == 1)
  {
    a3 = 1;
    goto LABEL_10;
  }
  if (v5 >= 2)
  {
    a2[2] = a4 + 40;
    a2[3] = 1;
    if (a3 == 2) {
      goto LABEL_10;
    }
    uint64_t v6 = *(void *)(a4 + 8);
    if (v6 == 2)
    {
      a3 = 2;
      goto LABEL_10;
    }
    BOOL v7 = a2 + 4;
    uint64_t v8 = a4 + 56;
    uint64_t v9 = 3;
    while (v9 - 1 < v6)
    {
      *BOOL v7 = v8;
      v7[1] = v9 - 1;
      if (a3 == v9) {
        goto LABEL_10;
      }
      uint64_t v10 = v9 + 1;
      uint64_t v6 = *(void *)(a4 + 8);
      v8 += 16;
      v7 += 2;
      if (v9++ == v6)
      {
        a3 = v10 - 1;
        goto LABEL_10;
      }
    }
    goto LABEL_23;
  }
LABEL_24:
  __break(1u);
  return result;
}

{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;

  if (!a2)
  {
    a3 = 0;
    goto LABEL_9;
  }
  if (!a3) {
    goto LABEL_9;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v4 = *(unsigned int *)(a4 + 12);
    if (!v4)
    {
LABEL_7:
      a3 = v4;
      goto LABEL_9;
    }
    *a2 = a4 + 16;
    if (a3 != 1)
    {
      if (v4 != 1)
      {
        a2[1] = a4 + 28;
        if (a3 == 2) {
          goto LABEL_9;
        }
        if (v4 != 2)
        {
          uint64_t v5 = a2 + 2;
          uint64_t v6 = a3 - 3;
          if (a3 - 3 >= (unint64_t)(v4 - 3)) {
            uint64_t v6 = v4 - 3;
          }
          BOOL v7 = v6 + 1;
          if (v7 >= 3)
          {
            uint64_t v10 = v7 & 1;
            if ((v7 & 1) == 0) {
              uint64_t v10 = 2;
            }
            uint64_t v11 = v7 - v10;
            uint64_t v9 = v7 - v10 + 3;
            uint64_t v8 = v11 + 2;
            v5 += v11;
            uint64_t v12 = a4 + 52;
            uint64_t v13 = a2 + 3;
            do
            {
              *(v13 - 1) = v12 - 12;
              *uint64_t v13 = v12;
              v12 += 24;
              v13 += 2;
              v11 -= 2;
            }
            while (v11);
          }
          else
          {
            uint64_t v8 = 2;
            uint64_t v9 = 3;
          }
          while (1)
          {
            *uint64_t v5 = a4 + 16 + 12 * v8;
            if (a3 == v9) {
              goto LABEL_9;
            }
            uint64_t v8 = v9;
            ++v5;
            if (v4 + 1 == ++v9) {
              goto LABEL_7;
            }
          }
        }
      }
      goto LABEL_7;
    }
LABEL_9:
    *unint64_t result = a4;
    result[1] = a3;
    return (void *)a3;
  }
  __break(1u);
  return result;
}

unint64_t TupleMetadata.Elements.Element.label.getter(unint64_t result, uint64_t a2)
{
  if (__OFSUB__(0, 16 * a2))
  {
LABEL_65:
    __break(1u);
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  if (!*(void *)(result - 16 * a2 - 8)) {
    return 0;
  }
  unint64_t result = String.init(cString:)();
  uint64_t v4 = a2 + 1;
  if (__OFADD__(a2, 1)) {
    goto LABEL_66;
  }
  if (v4 < 0)
  {
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  uint64_t v5 = result;
  uint64_t v6 = v3;
  if (a2 != -1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = (result >> 59) & 1;
    if ((v3 & 0x1000000000000000) == 0) {
      LODWORD(v8) = 1;
    }
    uint64_t v9 = 4 << v8;
    if ((v3 & 0x2000000000000000) != 0) {
      unint64_t v10 = HIBYTE(v3) & 0xF;
    }
    else {
      unint64_t v10 = result & 0xFFFFFFFFFFFFLL;
    }
    BOOL v11 = v8 == 0;
    uint64_t v12 = 11;
    if (!v11) {
      uint64_t v12 = 7;
    }
    unint64_t v13 = 4 * v10;
    uint64_t v14 = v12 & 0xC;
    uint64_t v40 = v3 & 0xFFFFFFFFFFFFFFLL;
    unint64_t v15 = 15;
    unint64_t v16 = 15;
    unint64_t v17 = v12 | (v10 << 16);
    uint64_t v37 = v14;
    unint64_t v38 = v17;
    uint64_t v39 = (v3 & 0xFFFFFFFFFFFFFFFLL) + 32;
    uint64_t v36 = v4;
    while (1)
    {
      if (v7 == v4) {
        goto LABEL_62;
      }
      if (v7)
      {
        if ((v15 & 0xC) == v9)
        {
          uint64_t v26 = v4;
          unint64_t result = _StringGuts._slowEnsureMatchingEncoding(_:)(v15, v5, v6);
          uint64_t v14 = v37;
          unint64_t v13 = 4 * v10;
          uint64_t v4 = v26;
          unint64_t v15 = result;
          unint64_t v17 = v38;
          if ((v6 & 0x1000000000000000) == 0)
          {
LABEL_20:
            unint64_t v16 = (v15 & 0xFFFFFFFFFFFF0000) + 65540;
            goto LABEL_21;
          }
        }
        else if ((v6 & 0x1000000000000000) == 0)
        {
          goto LABEL_20;
        }
        if (v10 <= v15 >> 16) {
          goto LABEL_69;
        }
        uint64_t v27 = v4;
        unint64_t result = String.UTF8View._foreignIndex(after:)();
        unint64_t v16 = result;
        uint64_t v4 = v27;
        uint64_t v14 = v37;
        unint64_t v13 = 4 * v10;
        unint64_t v17 = v38;
      }
LABEL_21:
      unint64_t v18 = v16 >> 14;
      if (v13 < v16 >> 14) {
        goto LABEL_63;
      }
      unint64_t v19 = v17;
      if (v14 == v9)
      {
        uint64_t v24 = v4;
        unint64_t result = _StringGuts._slowEnsureMatchingEncoding(_:)(v38, v5, v6);
        uint64_t v14 = v37;
        unint64_t v13 = 4 * v10;
        uint64_t v4 = v24;
        unint64_t v19 = result;
        unint64_t v17 = v38;
      }
      unint64_t v15 = v16;
      if ((v16 & 0xC) == v9)
      {
        uint64_t v25 = v4;
        unint64_t result = _StringGuts._slowEnsureMatchingEncoding(_:)(v16, v5, v6);
        uint64_t v14 = v37;
        unint64_t v13 = 4 * v10;
        uint64_t v4 = v25;
        unint64_t v15 = result;
        unint64_t v17 = v38;
        unint64_t v18 = result >> 14;
      }
      unint64_t v20 = v19 >> 14;
      if (v13 < v19 >> 14 || v20 < v18)
      {
LABEL_64:
        __break(1u);
        goto LABEL_65;
      }
      if (v18 != v20)
      {
        swift_bridgeObjectRetain();
        unint64_t result = Substring.UTF8View.subscript.getter();
        while (1)
        {
          if (result == 32) {
            goto LABEL_51;
          }
          if ((v15 & 0xC) == v9)
          {
            unint64_t result = _StringGuts._slowEnsureMatchingEncoding(_:)(v15, v5, v6);
            unint64_t v15 = result;
            if ((v6 & 0x1000000000000000) == 0)
            {
LABEL_34:
              unint64_t v15 = (v15 & 0xFFFFFFFFFFFF0000) + 65540;
              goto LABEL_38;
            }
          }
          else if ((v6 & 0x1000000000000000) == 0)
          {
            goto LABEL_34;
          }
          if (v10 <= v15 >> 16) {
            goto LABEL_61;
          }
          unint64_t result = String.UTF8View._foreignIndex(after:)();
          unint64_t v15 = result;
LABEL_38:
          unint64_t v21 = v15 >> 14;
          if (v15 >> 14 == v20)
          {
            unint64_t v15 = 0;
LABEL_51:
            unint64_t result = swift_bridgeObjectRelease();
            uint64_t v4 = v36;
            uint64_t v14 = v37;
            unint64_t v13 = 4 * v10;
            unint64_t v17 = v38;
            goto LABEL_15;
          }
          unint64_t v22 = v15;
          if ((v15 & 0xC) == v9)
          {
            unint64_t result = _StringGuts._slowEnsureMatchingEncoding(_:)(v15, v5, v6);
            unint64_t v22 = result;
            unint64_t v21 = result >> 14;
            if (result >> 14 < v18)
            {
LABEL_60:
              __break(1u);
LABEL_61:
              __break(1u);
LABEL_62:
              __break(1u);
LABEL_63:
              __break(1u);
              goto LABEL_64;
            }
          }
          else if (v21 < v18)
          {
            goto LABEL_60;
          }
          if (v21 >= v20) {
            goto LABEL_60;
          }
          if ((v6 & 0x1000000000000000) != 0)
          {
            unint64_t result = String.UTF8View._foreignSubscript(position:)();
          }
          else if ((v6 & 0x2000000000000000) != 0)
          {
            v41[0] = v5;
            v41[1] = v40;
            unint64_t result = *((unsigned __int8 *)v41 + (v22 >> 16));
          }
          else
          {
            uint64_t v23 = v39;
            if ((v5 & 0x1000000000000000) == 0) {
              uint64_t v23 = _StringObject.sharedUTF8.getter();
            }
            unint64_t result = *(unsigned __int8 *)(v23 + (v22 >> 16));
          }
        }
      }
      unint64_t v15 = 0;
LABEL_15:
      if (++v7 == v4) {
        goto LABEL_57;
      }
    }
  }
  unint64_t v15 = 15;
  unint64_t v16 = 15;
LABEL_57:
  if (v15 >> 14 >= v16 >> 14)
  {
    uint64_t v29 = String.subscript.getter();
    uint64_t v31 = v30;
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    swift_bridgeObjectRelease();
    uint64_t v28 = MEMORY[0x261164BE0](v29, v31, v33, v35);
    swift_bridgeObjectRelease();
    return v28;
  }
LABEL_68:
  __break(1u);
LABEL_69:
  __break(1u);
  return result;
}

uint64_t TupleMetadata.Elements.Element.metadata.getter(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t TupleMetadata.Elements.Element.offset.getter(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t TupleMetadata.Elements.startIndex.getter()
{
  return 0;
}

uint64_t TupleMetadata.Elements.endIndex.getter(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

Swift::Int __swiftcall TupleMetadata.Elements.index(after:)(Swift::Int after)
{
  return after + 1;
}

Swift::Int __swiftcall TupleMetadata.Elements.index(before:)(Swift::Int before)
{
  return before - 1;
}

uint64_t TupleMetadata.Elements.subscript.getter(uint64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else if (*(void *)(a2 + 8) > result)
  {
    return a2 + 16 * result + 24;
  }
  __break(1u);
  return result;
}

void protocol witness for Collection.endIndex.getter in conformance TupleMetadata.Elements(void *a1@<X8>)
{
  *a1 = *(void *)(*(void *)v1 + 8);
}

uint64_t (*protocol witness for Collection.subscript.read in conformance TupleMetadata.Elements(uint64_t (*result)(), uint64_t *a2))()
{
  uint64_t v3 = *a2;
  if (*a2 < 0)
  {
    __break(1u);
  }
  else if (v3 < *(void *)(*(void *)v2 + 8))
  {
    *(void *)unint64_t result = *(void *)v2 + 16 * v3 + 24;
    *((void *)result + 1) = v3;
    return protocol witness for Collection.subscript.read in conformance FieldDescriptor;
  }
  __break(1u);
  return result;
}

void *protocol witness for Collection.subscript.getter in conformance TupleMetadata.Elements@<X0>(void *result@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 8);
  if (v4 < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if ((*result & 0x8000000000000000) != 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v5 = result[1];
  if (v4 >= v5)
  {
    *a2 = *result;
    a2[1] = v5;
    a2[2] = v3;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

void protocol witness for Collection.indices.getter in conformance TupleMetadata.Elements(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 8);
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    *a1 = 0;
    a1[1] = v2;
  }
}

BOOL protocol witness for Collection.isEmpty.getter in conformance TupleMetadata.Elements()
{
  return *(void *)(*(void *)v0 + 8) == 0;
}

void *protocol witness for RandomAccessCollection.index(_:offsetBy:) in conformance TupleMetadata.Elements@<X0>(void *result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v4 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0 && *(void *)(*(void *)v3 + 8) >= v4)
  {
    *a3 = v4;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance TupleMetadata.Elements@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3, *v4);
  *(void *)a4 = result;
  *(unsigned char *)(a4 + 8) = v7 & 1;
  return result;
}

uint64_t *protocol witness for RandomAccessCollection.distance(from:to:) in conformance TupleMetadata.Elements(uint64_t *result, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *(void *)(*(void *)v2 + 8);
  if (v4 >= *a2)
  {
    uint64_t v5 = *result;
    if (((v3 | *result) & 0x8000000000000000) == 0 && v4 >= v5) {
      return (uint64_t *)(v3 - v5);
    }
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.count.getter in conformance TupleMetadata.Elements()
{
  uint64_t result = *(void *)(*(void *)v0 + 8);
  if (result < 0) {
    __break(1u);
  }
  return result;
}

void *protocol witness for Sequence._copyToContiguousArray() in conformance TupleMetadata.Elements()
{
  return specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
}

void *protocol witness for Sequence._copyContents(initializing:) in conformance TupleMetadata.Elements(void *a1, void *a2, uint64_t a3)
{
  return specialized Sequence._copyContents(initializing:)(a1, a2, a3, *v3);
}

BOOL static TupleMetadata.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void TupleMetadata.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int TupleMetadata.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
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
    uint64_t v5 = MEMORY[0x261164C10](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

unint64_t lazy protocol witness table accessor for type TupleMetadata.Elements and conformance TupleMetadata.Elements()
{
  unint64_t result = lazy protocol witness table cache variable for type TupleMetadata.Elements and conformance TupleMetadata.Elements;
  if (!lazy protocol witness table cache variable for type TupleMetadata.Elements and conformance TupleMetadata.Elements)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TupleMetadata.Elements and conformance TupleMetadata.Elements);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type TupleMetadata.Elements and conformance TupleMetadata.Elements;
  if (!lazy protocol witness table cache variable for type TupleMetadata.Elements and conformance TupleMetadata.Elements)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TupleMetadata.Elements and conformance TupleMetadata.Elements);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type TupleMetadata.Elements and conformance TupleMetadata.Elements;
  if (!lazy protocol witness table cache variable for type TupleMetadata.Elements and conformance TupleMetadata.Elements)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TupleMetadata.Elements and conformance TupleMetadata.Elements);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type TupleMetadata.Elements and conformance TupleMetadata.Elements;
  if (!lazy protocol witness table cache variable for type TupleMetadata.Elements and conformance TupleMetadata.Elements)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TupleMetadata.Elements and conformance TupleMetadata.Elements);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in TupleMetadata.Elements()
{
  return lazy protocol witness table accessor for type Slice<TupleMetadata.Elements> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<TupleMetadata.Elements> and conformance <> Slice<A>, (void (*)(void))lazy protocol witness table accessor for type TupleMetadata.Elements and conformance TupleMetadata.Elements);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in TupleMetadata.Elements()
{
  return lazy protocol witness table accessor for type Slice<TupleMetadata.Elements> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<TupleMetadata.Elements> and conformance <> Slice<A>, (void (*)(void))lazy protocol witness table accessor for type TupleMetadata.Elements and conformance TupleMetadata.Elements);
}

uint64_t lazy protocol witness table accessor for type Slice<TupleMetadata.Elements> and conformance <> Slice<A>(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Slice<TupleMetadata.Elements>);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in TupleMetadata.Elements()
{
  return lazy protocol witness table accessor for type Slice<FieldDescriptor> and conformance Slice<A>(&lazy protocol witness table cache variable for type Slice<TupleMetadata.Elements> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<TupleMetadata.Elements>);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in TupleMetadata.Elements()
{
  return lazy protocol witness table accessor for type Slice<FieldDescriptor> and conformance Slice<A>(&lazy protocol witness table cache variable for type IndexingIterator<TupleMetadata.Elements> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<TupleMetadata.Elements>);
}

unint64_t lazy protocol witness table accessor for type TupleMetadata and conformance TupleMetadata()
{
  unint64_t result = lazy protocol witness table cache variable for type TupleMetadata and conformance TupleMetadata;
  if (!lazy protocol witness table cache variable for type TupleMetadata and conformance TupleMetadata)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TupleMetadata and conformance TupleMetadata);
  }
  return result;
}

ValueMetadata *type metadata accessor for TupleMetadata()
{
  return &type metadata for TupleMetadata;
}

ValueMetadata *type metadata accessor for TupleMetadata.Elements()
{
  return &type metadata for TupleMetadata.Elements;
}

ValueMetadata *type metadata accessor for TupleMetadata.Elements.Element()
{
  return &type metadata for TupleMetadata.Elements.Element;
}

uint64_t GenericSignature.numberOfParameters.getter(unsigned __int16 *a1)
{
  return *a1;
}

uint64_t GenericSignature.numberOfRequirements.getter(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 2);
}

uint64_t GenericSignature.numberOfKeyArguments.getter(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 4);
}

uint64_t GenericSignature.flags.getter(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 6);
}

uint64_t GenericSignature.parameters.getter(uint64_t a1)
{
  return a1 + 8;
}

uint64_t GenericSignature.requirementStart.getter(unsigned __int16 *a1)
{
  return (uint64_t)a1 + (-*a1 & 3) + *a1 + 8;
}

uint64_t GenericSignature.requirements.getter(unsigned __int16 *a1)
{
  return (uint64_t)a1 + (-*a1 & 3) + *a1 + 8;
}

uint64_t GenericSignature.packShapeHeaderStart.getter(unsigned __int16 *a1)
{
  return (uint64_t)&a1[6 * a1[1] + 4] + (-*a1 & 3) + *a1;
}

uint64_t GenericSignature.packShapesStart.getter(unsigned __int16 *a1)
{
  return (uint64_t)&a1[6 * a1[1] + 6] + (-*a1 & 3) + *a1;
}

uint64_t GenericSignature.packShapes.getter(unsigned __int16 *a1)
{
  if (a1[3]) {
    return (uint64_t)&a1[6 * a1[1] + 6] + (-*a1 & 3) + *a1;
  }
  else {
    return 0;
  }
}

uint64_t GenericSignature.PackShapeHeader.numberOfPacks.getter(uint64_t result)
{
  return (unsigned __int16)result;
}

uint64_t GenericSignature.RequirementDescriptor.flags.getter(unsigned int *a1)
{
  return *a1;
}

uint64_t GenericSignature.RequirementDescriptor.parameter.getter(uint64_t a1)
{
  swift_getKeyPath();
  uint64_t v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_getAtKeyPath();
  swift_release();
  return a1 + v2 + v4;
}

unint64_t GenericSignature.RequirementDescriptor.protocol.getter(uint64_t a1)
{
  swift_getKeyPath();
  uint64_t v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  uint64_t v3 = *(int *)(a1 + v2);
  unint64_t result = a1 + v2 + (v3 & 0xFFFFFFFFFFFFFFFCLL);
  if (v3) {
    return *(void *)result;
  }
  return result;
}

uint64_t GenericSignature.RequirementDescriptor.sameType.getter(uint64_t a1)
{
  swift_getKeyPath();
  uint64_t v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  return a1 + v2 + *(int *)(a1 + v2);
}

uint64_t GenericSignature.RequirementDescriptor.layoutKind.getter(uint64_t a1)
{
  swift_getKeyPath();
  uint64_t v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  return *(unsigned int *)(a1 + v2);
}

uint64_t GenericSignature.RequirementDescriptor.baseClass.getter(uint64_t a1)
{
  swift_getKeyPath();
  uint64_t v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  return a1 + v2 + *(int *)(a1 + v2);
}

uint64_t GenericSignature.RequirementDescriptor.parameterType(in:with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_getKeyPath();
  dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_getAtKeyPath();
  swift_release();
  swift_getKeyPath();
  uint64_t v4 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_getAtKeyPath();
  swift_release();
  MangledTypeReference.length.getter((unsigned char *)(a3 + v4 + v6));
  return swift_getTypeByMangledNameInContext();
}

uint64_t GenericSignature.RequirementDescriptor.checkProtocolConformance(in:with:)(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  if ((*a3 & 0x1F) != 0) {
    return 0;
  }
  uint64_t result = GenericSignature.RequirementDescriptor.parameterType(in:with:)(a1, a2, (uint64_t)a3);
  if (result)
  {
    swift_getKeyPath();
    dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
    swift_release();
    return swift_conformsToProtocol();
  }
  return result;
}

uint64_t GenericSignature.RequirementDescriptor.checkSameType(in:with:)(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if ((*a3 & 0x1F) != 1) {
    return 0;
  }
  uint64_t v4 = GenericSignature.RequirementDescriptor.parameterType(in:with:)(a1, a2, (uint64_t)a3);
  if (!v4) {
    return 1;
  }
  uint64_t v5 = v4;
  swift_getKeyPath();
  dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  swift_getKeyPath();
  uint64_t v6 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  uint64_t result = MangledTypeReference.length.getter((unsigned char *)a3 + v6 + *(int *)((char *)a3 + v6));
  if ((result & 0x8000000000000000) == 0)
  {
    uint64_t TypeByMangledNameInContext = swift_getTypeByMangledNameInContext();
    if (TypeByMangledNameInContext) {
      return v5 == TypeByMangledNameInContext;
    }
    return 1;
  }
  __break(1u);
  return result;
}

uint64_t GenericSignature.RequirementDescriptor.checkLayout(in:with:)(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if ((~*a3 & 0x1F) != 0) {
    return 0;
  }
  uint64_t result = GenericSignature.RequirementDescriptor.parameterType(in:with:)(a1, a2, (uint64_t)a3);
  if (result)
  {
    uint64_t v5 = (uint64_t *)result;
    swift_getKeyPath();
    uint64_t v6 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
    swift_release();
    if (*(_DWORD *)((char *)a3 + v6)) {
      return 0;
    }
    uint64_t v7 = *v5;
    uint64_t result = 1;
    if ((unint64_t)*v5 <= 0x7FF && (unint64_t)(v7 - 515) >= 2 && v7 && v7 != 773) {
      return 0;
    }
  }
  return result;
}

uint64_t GenericSignature.RequirementDescriptor.checkBaseClass(in:with:)(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if ((*a3 & 0x1F) != 2) {
    return 0;
  }
  uint64_t v4 = (void *)GenericSignature.RequirementDescriptor.parameterType(in:with:)(a1, a2, (uint64_t)a3);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *v4;
  if (*v4 <= 0x7FFuLL && (unint64_t)(v6 - 515) >= 2 && v6 != 773 && v6) {
    return 0;
  }
  swift_getKeyPath();
  dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  swift_getKeyPath();
  uint64_t v7 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  uint64_t v8 = MangledTypeReference.length.getter((unsigned char *)a3 + v7 + *(int *)((char *)a3 + v7));
  if ((v8 & 0x8000000000000000) == 0)
  {
    uint64_t TypeByMangledNameInContext = swift_getTypeByMangledNameInContext();
    if (TypeByMangledNameInContext)
    {
      uint64_t v9 = TypeByMangledNameInContext;
      uint64_t v8 = (uint64_t)v5;
      return MEMORY[0x270FA0138](v8, v9);
    }
    return 0;
  }
  __break(1u);
  return MEMORY[0x270FA0138](v8, v9);
}

uint64_t GenericSignature.PackShapeHeader.numberOfShapeClasses.getter(unsigned int a1)
{
  return HIWORD(a1);
}

uint64_t GenericSignature.PackShapeDescriptor.index.getter(int a1)
{
  return HIWORD(a1);
}

uint64_t GenericSignature.PackShapeDescriptor.shapeClass.getter(uint64_t a1)
{
  return WORD2(a1);
}

ValueMetadata *type metadata accessor for GenericSignature()
{
  return &type metadata for GenericSignature;
}

ValueMetadata *type metadata accessor for GenericSignature.RequirementDescriptor()
{
  return &type metadata for GenericSignature.RequirementDescriptor;
}

_DWORD *__swift_memcpy4_2(_DWORD *result, _DWORD *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GenericSignature.PackShapeHeader(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for GenericSignature.PackShapeHeader(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_DWORD *)uint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 4) = v3;
  return result;
}

ValueMetadata *type metadata accessor for GenericSignature.PackShapeHeader()
{
  return &type metadata for GenericSignature.PackShapeHeader;
}

void *__swift_memcpy8_2(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GenericSignature.PackShapeDescriptor(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for GenericSignature.PackShapeDescriptor(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
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
  *(unsigned char *)(result + 8) = v3;
  return result;
}

ValueMetadata *type metadata accessor for GenericSignature.PackShapeDescriptor()
{
  return &type metadata for GenericSignature.PackShapeDescriptor;
}

uint64_t static Metadata.Kind.struct.getter()
{
  return 512;
}

uint64_t static Metadata.Kind.enum.getter()
{
  return 513;
}

uint64_t static Metadata.Kind.optional.getter()
{
  return 514;
}

uint64_t static FunctionMetadata.DifferentiableKind.nonDifferentiable.getter()
{
  return 0;
}

uint64_t static Metadata.Kind.class.getter()
{
  return 0;
}

uint64_t static Metadata.Kind.objcClassWrapper.getter()
{
  return 773;
}

uint64_t static Metadata.Kind.foreignClass.getter()
{
  return 515;
}

uint64_t static Metadata.Kind.foreignReferenceType.getter()
{
  return 516;
}

uint64_t static Metadata.Request.complete.getter()
{
  return 0;
}

BOOL ValueWitnessTable.Flags.isValueInline.getter(int a1)
{
  return (a1 & 0x20000) == 0;
}

uint64_t ValueWitnessTable.Flags.alignmentMask.getter(uint64_t result)
{
  return result;
}

uint64_t static Metadata.Kind.isRuntimePrivate.getter()
{
  return 256;
}

uint64_t static Metadata.Kind.isNonHeap.getter()
{
  return 512;
}

uint64_t static Metadata.Kind.isNonType.getter()
{
  return 1024;
}

uint64_t static Metadata.Kind.opaque.getter()
{
  return 768;
}

uint64_t static Metadata.Kind.function.getter()
{
  return 770;
}

uint64_t static Metadata.Kind.existential.getter()
{
  return 771;
}

uint64_t static Metadata.Kind.metatype.getter()
{
  return 772;
}

uint64_t static Metadata.Kind.existentialMetatype.getter()
{
  return 774;
}

uint64_t static Metadata.Kind.extendedExistential.getter()
{
  return 775;
}

uint64_t static Metadata.Kind.heapLocalVariable.getter()
{
  return 1024;
}

uint64_t static Metadata.Kind.heapGenericLocalVariable.getter()
{
  return 1280;
}

uint64_t static Metadata.Kind.errorObject.getter()
{
  return 1281;
}

uint64_t static Metadata.Kind.task.getter()
{
  return 1282;
}

uint64_t static Metadata.Kind.job.getter()
{
  return 1283;
}

BOOL static Metadata.Kind.== infix(_:_:)(unint64_t a1, unint64_t a2)
{
  if (a2 >= 0x800) {
    unint64_t v2 = 0;
  }
  else {
    unint64_t v2 = a2;
  }
  if (a1 >= 0x800) {
    unint64_t v3 = 0;
  }
  else {
    unint64_t v3 = a1;
  }
  return v3 == v2;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance Metadata.Kind(unint64_t *a1, uint64_t *a2)
{
  unint64_t v2 = *a1;
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0x800) {
    uint64_t v3 = 0;
  }
  if (v2 >= 0x800) {
    unint64_t v2 = 0;
  }
  return v2 == v3;
}

void Metadata.Kind.hash(into:)(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x800) {
    Swift::UInt v2 = 0;
  }
  else {
    Swift::UInt v2 = a2;
  }
  Hasher._combine(_:)(v2);
}

Swift::Int Metadata.Kind.hashValue.getter(unint64_t a1)
{
  Hasher.init(_seed:)();
  if (a1 >= 0x800) {
    Swift::UInt v2 = 0;
  }
  else {
    Swift::UInt v2 = a1;
  }
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Metadata.Kind()
{
  unint64_t v1 = *v0;
  Hasher.init(_seed:)();
  if (v1 >= 0x800) {
    Swift::UInt v2 = 0;
  }
  else {
    Swift::UInt v2 = v1;
  }
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance Metadata.Kind()
{
  if (*v0 >= 0x800) {
    Swift::UInt v1 = 0;
  }
  else {
    Swift::UInt v1 = *v0;
  }
  Hasher._combine(_:)(v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Metadata.Kind()
{
  unint64_t v1 = *v0;
  Hasher.init(_seed:)();
  if (v1 >= 0x800) {
    Swift::UInt v2 = 0;
  }
  else {
    Swift::UInt v2 = v1;
  }
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

unint64_t Metadata.Kind.description.getter(uint64_t a1)
{
  unint64_t result = 0x7373616C63;
  if ((unint64_t)a1 <= 0x7FF)
  {
    if (a1 <= 767)
    {
      switch(a1)
      {
        case 512:
          unint64_t result = 0x746375727473;
          break;
        case 513:
          unint64_t result = 1836412517;
          break;
        case 514:
          unint64_t result = 0x6C616E6F6974706FLL;
          break;
        case 515:
          unint64_t result = 0x436E676965726F66;
          break;
        case 516:
          unint64_t result = 0xD000000000000014;
          break;
        default:
          if (a1) {
LABEL_27:
          }
            unint64_t result = 0x6E776F6E6B6E75;
          break;
      }
    }
    else
    {
      switch(a1)
      {
        case 768:
          unint64_t result = 0x65757161706FLL;
          break;
        case 769:
          unint64_t result = 0x656C707574;
          break;
        case 770:
          unint64_t result = 0x6E6F6974636E7566;
          break;
        case 771:
          unint64_t result = 0x746E657473697865;
          break;
        case 772:
          unint64_t result = 0x657079746174656DLL;
          break;
        case 773:
          unint64_t result = 0xD000000000000010;
          break;
        case 774:
        case 775:
          unint64_t result = 0xD000000000000013;
          break;
        default:
          switch(a1)
          {
            case 1280:
              unint64_t result = 0xD000000000000018;
              break;
            case 1281:
              unint64_t result = 0x6A624F726F727265;
              break;
            case 1282:
              unint64_t result = 1802723700;
              break;
            case 1283:
              unint64_t result = 6451050;
              break;
            default:
              if (a1 != 1024) {
                goto LABEL_27;
              }
              unint64_t result = 0xD000000000000011;
              break;
          }
          break;
      }
    }
  }
  return result;
}

unint64_t protocol witness for CustomStringConvertible.description.getter in conformance Metadata.Kind()
{
  return Metadata.Kind.description.getter(*v0);
}

uint64_t static Metadata.Request.isNonBlockingMask.getter()
{
  return 256;
}

uint64_t Metadata.Request.init(state:isBlocking:)(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return result & 0x100;
  }
  return result;
}

uint64_t static Metadata.State.complete.getter()
{
  return 0;
}

uint64_t static Metadata.State.nonTransitiveComplete.getter()
{
  return 1;
}

uint64_t static Metadata.State.layoutComplete.getter()
{
  return 63;
}

uint64_t static Metadata.State.abstract.getter()
{
  return 255;
}

uint64_t static FunctionMetadata.Convention.swift.getter()
{
  return 0;
}

uint64_t static FunctionMetadata.Convention.block.getter()
{
  return 1;
}

uint64_t static FunctionMetadata.Convention.thin.getter()
{
  return 2;
}

uint64_t static FunctionMetadata.Convention.c.getter()
{
  return 3;
}

BOOL static FunctionMetadata.Convention.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void FunctionMetadata.Convention.hash(into:)(int a1, Swift::UInt a2)
{
}

uint64_t FunctionMetadata.Convention.description.getter()
{
  return 0x6E776F6E6B6E75;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance FunctionMetadata.Convention()
{
  uint64_t result = 0x7466697773;
  switch(*v0)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 0x6B636F6C62;
      break;
    case 2:
      uint64_t result = 1852401780;
      break;
    case 3:
      uint64_t result = 99;
      break;
    default:
      uint64_t result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

uint64_t static FunctionMetadata.DifferentiableKind.forward.getter()
{
  return 1;
}

uint64_t static FunctionMetadata.DifferentiableKind.reverse.getter()
{
  return 2;
}

uint64_t static FunctionMetadata.DifferentiableKind.normal.getter()
{
  return 3;
}

uint64_t static FunctionMetadata.DifferentiableKind.linear.getter()
{
  return 4;
}

uint64_t FunctionMetadata.DifferentiableKind.description.getter()
{
  return 0x6E776F6E6B6E75;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance FunctionMetadata.DifferentiableKind()
{
  return FunctionMetadata.DifferentiableKind.description.getter();
}

uint64_t static ValueWitnessTable.Flags.alignmentMaskMask.getter()
{
  return 255;
}

uint64_t static ValueWitnessTable.Flags.isNonPODMask.getter()
{
  return 0x10000;
}

uint64_t static ValueWitnessTable.Flags.isNonInlineMask.getter()
{
  return 0x20000;
}

uint64_t static ValueWitnessTable.Flags.hasSpareBitsMask.getter()
{
  return 0x80000;
}

uint64_t static ValueWitnessTable.Flags.isNonBitwiseTakableMask.getter()
{
  return 0x100000;
}

uint64_t static ValueWitnessTable.Flags.hasEnumWitnessesMask.getter()
{
  return 0x200000;
}

uint64_t static ValueWitnessTable.Flags.isIncompleteMask.getter()
{
  return 0x400000;
}

uint64_t ValueWitnessTable.Flags.alignment.getter(unsigned __int8 a1)
{
  return a1 + 1;
}

BOOL ValueWitnessTable.Flags.isPOD.getter(int a1)
{
  return (a1 & 0x10000) == 0;
}

uint64_t ValueWitnessTable.Flags.hasSpareBits.getter(unsigned int a1)
{
  return (a1 >> 19) & 1;
}

BOOL ValueWitnessTable.Flags.isBitwiseTakable.getter(int a1)
{
  return (a1 & 0x100000) == 0;
}

uint64_t ValueWitnessTable.Flags.hasEnumWitnesses.getter(unsigned int a1)
{
  return (a1 >> 21) & 1;
}

uint64_t ValueWitnessTable.Flags.isIncomplete.getter(unsigned int a1)
{
  return (a1 >> 22) & 1;
}

unint64_t lazy protocol witness table accessor for type Metadata.Kind and conformance Metadata.Kind()
{
  unint64_t result = lazy protocol witness table cache variable for type Metadata.Kind and conformance Metadata.Kind;
  if (!lazy protocol witness table cache variable for type Metadata.Kind and conformance Metadata.Kind)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Metadata.Kind and conformance Metadata.Kind);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type FunctionMetadata.Convention and conformance FunctionMetadata.Convention()
{
  unint64_t result = lazy protocol witness table cache variable for type FunctionMetadata.Convention and conformance FunctionMetadata.Convention;
  if (!lazy protocol witness table cache variable for type FunctionMetadata.Convention and conformance FunctionMetadata.Convention)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FunctionMetadata.Convention and conformance FunctionMetadata.Convention);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type FunctionMetadata.DifferentiableKind and conformance FunctionMetadata.DifferentiableKind()
{
  unint64_t result = lazy protocol witness table cache variable for type FunctionMetadata.DifferentiableKind and conformance FunctionMetadata.DifferentiableKind;
  if (!lazy protocol witness table cache variable for type FunctionMetadata.DifferentiableKind and conformance FunctionMetadata.DifferentiableKind)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FunctionMetadata.DifferentiableKind and conformance FunctionMetadata.DifferentiableKind);
  }
  return result;
}

ValueMetadata *type metadata accessor for Metadata.Kind()
{
  return &type metadata for Metadata.Kind;
}

ValueMetadata *type metadata accessor for Metadata.Request()
{
  return &type metadata for Metadata.Request;
}

ValueMetadata *type metadata accessor for Metadata.Response()
{
  return &type metadata for Metadata.Response;
}

ValueMetadata *type metadata accessor for Metadata.State()
{
  return &type metadata for Metadata.State;
}

ValueMetadata *type metadata accessor for FunctionMetadata.Convention()
{
  return &type metadata for FunctionMetadata.Convention;
}

ValueMetadata *type metadata accessor for FunctionMetadata.DifferentiableKind()
{
  return &type metadata for FunctionMetadata.DifferentiableKind;
}

ValueMetadata *type metadata accessor for ValueWitnessTable.Flags()
{
  return &type metadata for ValueWitnessTable.Flags;
}

ValueMetadata *type metadata accessor for FunctionMetadata.Flags()
{
  return &type metadata for FunctionMetadata.Flags;
}

ValueMetadata *type metadata accessor for ExistentialMetadata.Flags()
{
  return &type metadata for ExistentialMetadata.Flags;
}

uint64_t ForeignReferenceTypeMetadata.descriptor.getter(uint64_t a1)
{
  swift_getKeyPath();
  uint64_t v2 = dispatch thunk of AnyKeyPath._storedInlineOffset.getter();
  swift_release();
  return *(void *)(a1 + v2);
}

BOOL static ForeignReferenceTypeMetadata.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void ForeignReferenceTypeMetadata.hash(into:)(int a1, Swift::UInt a2)
{
}

Swift::Int ForeignReferenceTypeMetadata.hashValue.getter(Swift::UInt a1)
{
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type ForeignReferenceTypeMetadata and conformance ForeignReferenceTypeMetadata()
{
  unint64_t result = lazy protocol witness table cache variable for type ForeignReferenceTypeMetadata and conformance ForeignReferenceTypeMetadata;
  if (!lazy protocol witness table cache variable for type ForeignReferenceTypeMetadata and conformance ForeignReferenceTypeMetadata)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ForeignReferenceTypeMetadata and conformance ForeignReferenceTypeMetadata);
  }
  return result;
}

ValueMetadata *type metadata accessor for ForeignReferenceTypeMetadata()
{
  return &type metadata for ForeignReferenceTypeMetadata;
}

uint64_t UnsafeRawPointer.unprotectedLoad<A>(fromByteOffset:as:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))(a4, a2 + a1, a3);
}

uint64_t RelativePointer.pointee(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  if ((*(unsigned int (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3))
  {
    uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 24))(a1, a2, a3);
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    UnsafeRawPointer.unprotectedLoad<A>(fromByteOffset:as:)(0, v8, AssociatedTypeWitness, a4);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56);
    uint64_t v11 = a4;
    uint64_t v12 = 0;
    uint64_t v13 = AssociatedTypeWitness;
  }
  else
  {
    uint64_t v14 = swift_getAssociatedTypeWitness();
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);
    uint64_t v13 = v14;
    uint64_t v11 = a4;
    uint64_t v12 = 1;
  }

  return v10(v11, v12, 1, v13);
}

BOOL RelativePointer.isNull.getter(uint64_t a1, uint64_t a2)
{
  return (*(unsigned int (**)(void))(a2 + 16))() == 0;
}

uint64_t dispatch thunk of RelativePointer.offset.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of RelativePointer.address(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of RelativePointer.pointee(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

void anonymous namespace'::addImageCallback<&anonymous namespace'::TextSegment,&anonymous namespace'::ProtocolConformancesSection,(_dyld_section_location_kind)1,&(addImageProtocolConformanceBlockCallbackUnsafe)>()
{
  __assert_rtn("addImageCallback", "ImageInspection.h", 90, "mh->magic == MH_MAGIC_64 && \"loaded non-64-bit image?!\"");
}

Swift::Void __swiftcall Dictionary.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t dispatch thunk of static Comparable.<= infix(_:_:)()
{
  return MEMORY[0x270F9D498]();
}

uint64_t type metadata accessor for UnsafePointer()
{
  return MEMORY[0x270F9D590]();
}

uint64_t static String._fromSubstring(_:)()
{
  return MEMORY[0x270F9D648]();
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

uint64_t String.subscript.getter()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t Sequence._copyContents(initializing:)()
{
  return MEMORY[0x270F9D948]();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x270F9D968]();
}

uint64_t type metadata accessor for Range()
{
  return MEMORY[0x270F9E330]();
}

uint64_t Substring.UTF8View.subscript.getter()
{
  return MEMORY[0x270F9E4E0]();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)()
{
  return MEMORY[0x270F9E5B8]();
}

uint64_t dispatch thunk of AnyKeyPath._storedInlineOffset.getter()
{
  return MEMORY[0x270F9E698]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFF0]();
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

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt16 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _dyld_lookup_section_info()
{
  return MEMORY[0x270ED7FB0]();
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

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_conformsToProtocol()
{
  return MEMORY[0x270FA0210]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getTypeByMangledNameInContext()
{
  return MEMORY[0x270FA0438]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}