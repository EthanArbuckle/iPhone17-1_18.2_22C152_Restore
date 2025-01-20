uint64_t __dbg_ScreenShape()
{
  uint64_t result;
  BOOL v1;

  result = _UIScreenTypePrivateForScreen();
  v1 = (unint64_t)(result - 10000) > 0xA || ((1 << (result - 16)) & 0x41F) == 0;
  if (v1 && ((unint64_t)(result - 20000) > 0xB || ((1 << (result - 32)) & 0xC03) == 0)) {
    return -1;
  }
  return result;
}

char *resetDyldInsertLibraries()
{
  result = getenv("DYLD_INSERT_LIBRARIES");
  if (result)
  {
    v1 = result;
    strlen(result);
    v2 = (char *)&v15 - ((off_3C480() + 16) & 0xFFFFFFFFFFFFFFF0);
    bzero(v2, v3);
    int v4 = *(unsigned __int8 *)v1;
    if (!*v1) {
      return (char *)unsetenv("DYLD_INSERT_LIBRARIES");
    }
    v5 = v2;
    int v6 = *(unsigned __int8 *)v1;
    do
    {
      for (i = 0; v6; int v6 = v1[++i])
      {
        if (v6 == 58) {
          break;
        }
      }
      v8 = v1;
      if (i)
      {
        size_t v9 = i;
        while (v1[v9] != 47)
        {
          if (!--v9)
          {
            int v4 = *(unsigned __int8 *)v1;
            v8 = v1;
            goto LABEL_13;
          }
        }
        v8 = &v1[v9];
        int v4 = 47;
      }
LABEL_13:
      BOOL v10 = v4 == 47;
      BOOL v11 = v4 == 47;
      if (v10) {
        v12 = v8 + 1;
      }
      else {
        v12 = v8;
      }
      if (&v1[i] == v12)
      {
        v1 += i;
      }
      else
      {
        if (strncmp(v12, "libViewDebuggerSupport.dylib", v1 - v8 - v11 + i))
        {
          v13 = v2;
          if (v5 != v2)
          {
            char *v5 = 58;
            v13 = v5 + 1;
          }
          v5 = stpncpy(v13, v1, i);
          int v6 = v1[i];
        }
        if (v6 == 58) {
          v14 = v1 + 1;
        }
        else {
          v14 = v1;
        }
        v1 = &v14[i];
        int v6 = v14[i];
      }
      int v4 = v6;
    }
    while (v6);
    if (v5 > v2)
    {
      char *v5 = 0;
      return (char *)setenv("DYLD_INSERT_LIBRARIES", v2, 1);
    }
    else
    {
      return (char *)unsetenv("DYLD_INSERT_LIBRARIES");
    }
  }
  return result;
}

void sub_F96C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,NSString *a30,__CFString *a31,NSArray *a32)
{
  if (a2 == 1)
  {
    [objc_begin_catch(exception_object) callStackSymbols];
    a30 = +[NSString stringWithFormat:@"Exception gathering view hierarchy information: %@ \n%@"];
    a31 = @"exceptions";
    a32 = +[NSArray arrayWithObjects:&a30 count:1];
    +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", +[NSDictionary dictionaryWithObjects:&a32 forKeys:&a31 count:1], 200, 0, 0);
    objc_end_catch();
    JUMPOUT(0xF92CLL);
  }
  _Unwind_Resume(exception_object);
}

id arrayOfObjectPointers(void *a1)
{
  id v1 = a1;
  id v2 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v1 count]];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (size_t i = 0; i != v5; size_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = +[NSString stringWithFormat:@"%p", *(void *)(*((void *)&v10 + 1) + 8 * i)];
        [v2 addObject:v8];
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

id viewWantsAutoLayout(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector()) {
    id v2 = [v1 _wantsAutolayout];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

_UNKNOWN **static ARView.fallback_debugHierarchyAdditionalGroupingIDs()()
{
  return &outlined read-only object #0 of static ARView.fallback_debugHierarchyAdditionalGroupingIDs();
}

id @objc static ARView.fallback_debugHierarchyAdditionalGroupingIDs()(id a1, SEL a2)
{
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;

  return v2.super.isa;
}

id @objc static ARView.fallback_debugHierarchyObjectsInGroup(withID:on:outOptions:)(id a1, SEL a2, id a3, id a4, id *a5)
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  id v8 = specialized static ARView.fallback_debugHierarchyObjectsInGroup(withID:on:outOptions:)(v5, v7, (uint64_t)v11);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for DebugHierarchyObject_Fallback);
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }

  return v9.super.isa;
}

UIImage_optional __swiftcall ARView.__dbg_snapshotImage()()
{
  [v0 bounds];
  CGFloat v2 = v1;
  CGFloat v4 = v3;
  id v5 = [self mainScreen];
  [v5 scale];
  CGFloat v7 = v6;

  v12.width = v2;
  v12.height = v4;
  UIGraphicsBeginImageContextWithOptions(v12, 0, v7);
  [v0 bounds];
  [v0 drawViewHierarchyInRect:1];
  id v8 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  long long v10 = (objc_class *)v8;
  result.value.super.isa = v10;
  result.is_nil = v9;
  return result;
}

id @objc ARView.__dbg_snapshotImage()(id a1, SEL a2)
{
  id v2 = a1;
  [v2 bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  id v7 = [self mainScreen];
  [v7 scale];
  CGFloat v9 = v8;

  v13.width = v4;
  v13.height = v6;
  UIGraphicsBeginImageContextWithOptions(v13, 0, v9);
  [v2 bounds];
  [v2 drawViewHierarchyInRect:1];
  long long v10 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v10;
}

void protocol witness for SetAlgebra.init() in conformance DebugHierarchyPropertyOptions(void *a1@<X8>)
{
  *a1 = 0;
}

void *protocol witness for OptionSet.init(rawValue:) in conformance DebugHierarchyPropertyOptions@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    long long v10 = (void *)(v9 + 16 * v6);
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
        CGSize v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

id specialized static ARView.fallback_debugHierarchyObjectsInGroup(withID:on:outOptions:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  outlined init with copy of Any(a3, (uint64_t)v34);
  type metadata accessor for ARView();
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  id v5 = v33;
  if ((a1 != 0xD000000000000021 || a2 != 0x8000000000031530)
    && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {

    return 0;
  }
  v34[0] = v33;
  uint64_t v6 = _Pointer.debugDescription.getter();
  uint64_t v8 = v7;
  uint64_t v9 = self;
  long long v10 = &selRef_xHeight;
  id result = [v9 sharedHub];
  if (!result)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v12 = result;
  specialized DebugHierarchyTargetHub.spatialSceneDebugRepresentationCache.getter();
  uint64_t v14 = v13;

  if (*(void *)(v14 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v15 = specialized __RawDictionaryStorage.find<A>(_:)(v6, v8);
    if (v16)
    {
      unint64_t v17 = *(void *)(*(void *)(v14 + 56) + 8 * v15);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      if (!(v17 >> 62))
      {
        swift_bridgeObjectRetain();
        dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();

        swift_bridgeObjectRelease();
        return (id)v17;
      }
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for DebugHierarchyObject_Fallback);
      uint64_t v18 = _bridgeCocoaArray<A>(_:)();

LABEL_32:
      swift_bridgeObjectRelease_n();
      return (id)v18;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  type metadata accessor for RealityKitHierarchyExporter();
  unint64_t v19 = static RealityKitHierarchyExporter.exportDebugRepresentation(for:)();
  if (!v19)
  {

    swift_bridgeObjectRelease();
    return 0;
  }
  unint64_t v20 = v19;
  if (!(v19 >> 62))
  {
    uint64_t v21 = *(void *)((char *)&dword_10 + (v19 & 0xFFFFFFFFFFFFFF8));
    if (v21) {
      goto LABEL_15;
    }
LABEL_26:
    swift_bridgeObjectRelease();
    unint64_t v27 = (unint64_t)&_swiftEmptyArrayStorage;
    goto LABEL_27;
  }
  uint64_t v21 = _CocoaArrayWrapper.endIndex.getter();
  if (!v21) {
    goto LABEL_26;
  }
LABEL_15:
  id v29 = v9;
  uint64_t v30 = v6;
  id v31 = v33;
  v34[0] = &_swiftEmptyArrayStorage;
  id result = (id)specialized ContiguousArray.reserveCapacity(_:)();
  if (v21 < 0)
  {
    __break(1u);
    goto LABEL_34;
  }
  uint64_t v22 = 0;
  do
  {
    if ((v20 & 0xC000000000000001) != 0) {
      id v23 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v23 = *(id *)(v20 + 8 * v22 + 32);
    }
    id v24 = v23;
    ++v22;
    v25 = (objc_class *)type metadata accessor for SpatialSceneDebugRepresentationWrapper();
    v26 = (char *)objc_allocWithZone(v25);
    *(void *)&v26[OBJC_IVAR____TtC22libViewDebuggerSupport38SpatialSceneDebugRepresentationWrapper_sceneDebugRepresentation] = v24;
    v32.receiver = v26;
    v32.super_class = v25;
    [super init];
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
    specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized ContiguousArray._endMutation()();
  }
  while (v21 != v22);
  unint64_t v27 = (unint64_t)v34[0];
  swift_bridgeObjectRelease();
  long long v10 = &selRef_xHeight;
LABEL_27:
  id result = [v9 v10[31] v29 v30 v31];
  if (result)
  {
    v28 = result;
    specialized DebugHierarchyTargetHub.cache(spatialSceneDebugRepresentation:for:)(v27, v6, v8);

    swift_bridgeObjectRelease();
    if (!(v27 >> 62))
    {
      swift_bridgeObjectRetain();
      dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();

      swift_bridgeObjectRelease();
      return (id)v27;
    }
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for DebugHierarchyObject_Fallback);
    uint64_t v18 = _bridgeCocoaArray<A>(_:)();

    goto LABEL_32;
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
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

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, [SpatialSceneDebugRepresentationWrapper]>);
  char v36 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
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
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
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
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    id v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    specialized _NativeDictionary.copy()();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v15, a4 & 1);
  unint64_t v21 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;

  return swift_bridgeObjectRetain();
}

void *specialized _NativeDictionary.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, [SpatialSceneDebugRepresentationWrapper]>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
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
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void specialized DebugHierarchyTargetHub.spatialSceneDebugRepresentationCache.getter()
{
  v0 = self;
  id v1 = [v0 sharedHub];
  if (!v1)
  {
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v2 = v1;
  id v3 = [v1 additionalKnownObjects];

  if (!v3)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  *(void *)&v9[0] = 0xD000000000000018;
  *((void *)&v9[0] + 1) = 0x80000000000315A0;
  id v4 = [v3 __swift_objectForKeyedSubscript:_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()];
  swift_unknownObjectRelease();

  if (v4)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  outlined init with take of Any?((uint64_t)v9, (uint64_t)v10);
  if (!v10[3])
  {
    outlined destroy of Any?((uint64_t)v10);
LABEL_10:
    id v5 = [v0 sharedHub];
    if (v5)
    {
      uint64_t v6 = v5;
      id v7 = [v5 additionalKnownObjects];

      if (v7)
      {
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [SpatialSceneDebugRepresentationWrapper]);
        Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
        v10[0] = 0xD000000000000018;
        v10[1] = 0x80000000000315A0;
        [v7 __swift_setObject:isa forKeyedSubscript:_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()];

        swift_unknownObjectRelease();
        return;
      }
      goto LABEL_16;
    }
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    return;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : [SpatialSceneDebugRepresentationWrapper]]);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_10;
  }
}

void specialized DebugHierarchyTargetHub.cache(spatialSceneDebugRepresentation:for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  specialized DebugHierarchyTargetHub.spatialSceneDebugRepresentationCache.getter();
  uint64_t v7 = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v9 = [self sharedHub:v7];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = [v9 additionalKnownObjects];

    if (v11)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [SpatialSceneDebugRepresentationWrapper]);
      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v11 __swift_setObject:_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)() forKeyedSubscript:isa];

      swift_unknownObjectRelease();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t outlined init with take of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id SpatialSceneDebugRepresentationWrapper.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SpatialSceneDebugRepresentationWrapper();
  return [super dealloc];
}

uint64_t type metadata accessor for SpatialSceneDebugRepresentationWrapper()
{
  return self;
}

void static SpatialSceneDebugRepresentationWrapper.fallback_debugHierarchyValueForProperty(withName:on:outOptions:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  if ((a1 != 0xD000000000000018 || a2 != 0x80000000000315A0)
    && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    goto LABEL_7;
  }
  outlined init with copy of Any(a3, (uint64_t)v14);
  type metadata accessor for SpatialSceneDebugRepresentationWrapper();
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_7;
  }
  uint64_t v7 = (char *)v14[5];
  type metadata accessor for PropertyListEncoder();
  swift_allocObject();
  PropertyListEncoder.init()();
  v14[0] = *(void *)&v7[OBJC_IVAR____TtC22libViewDebuggerSupport38SpatialSceneDebugRepresentationWrapper_sceneDebugRepresentation];
  uint64_t v8 = (void *)v14[0];
  type metadata accessor for SpatialSceneDebugRepresentation();
  lazy protocol witness table accessor for type SpatialSceneDebugRepresentation and conformance SpatialSceneDebugRepresentation();
  id v9 = v8;
  uint64_t v10 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
  if (v4)
  {

    swift_release();
    swift_errorRelease();

LABEL_7:
    a4[3] = (uint64_t)&type metadata for () + 8;
    return;
  }
  uint64_t v12 = v10;
  uint64_t v13 = v11;

  swift_release();
  a4[3] = (uint64_t)&type metadata for Data;

  *a4 = v12;
  a4[1] = v13;
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t lazy protocol witness table accessor for type SpatialSceneDebugRepresentation and conformance SpatialSceneDebugRepresentation()
{
  unint64_t result = lazy protocol witness table cache variable for type SpatialSceneDebugRepresentation and conformance SpatialSceneDebugRepresentation;
  if (!lazy protocol witness table cache variable for type SpatialSceneDebugRepresentation and conformance SpatialSceneDebugRepresentation)
  {
    type metadata accessor for SpatialSceneDebugRepresentation();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SpatialSceneDebugRepresentation and conformance SpatialSceneDebugRepresentation);
  }
  return result;
}

uint64_t specialized static SpatialSceneDebugRepresentationWrapper.fallback_debugHierarchyPropertyDescriptions()()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<[String : Any]>);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2DDC0;
  NSString v1 = String._bridgeToObjectiveC()();
  type metadata accessor for NSData();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  id v3 = NSStringFromClass(ObjCClassFromMetadata);
  if (!v3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v3 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  uint64_t v4 = (__CFString *)String._bridgeToObjectiveC()();
  id v5 = v4;
  if (v4) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = @"DebugHierarchyLogicalPropertyTypeCustom";
  }
  id v7 = v1;
  uint64_t v8 = v3;
  id v9 = v5;
  Mutable = CFDictionaryCreateMutable(0, 7, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  uint64_t v11 = Mutable;
  if (v7) {
    CFDictionaryAddValue(Mutable, @"propertyName", v7);
  }
  if (v8) {
    CFDictionaryAddValue(v11, @"propertyRuntimeType", v8);
  }
  CFDictionaryAddValue(v11, @"propertyLogicalType", v6);
  CFDictionaryAddValue(v11, @"propertyFormat", @"public.data");
  if (!v11)
  {
    uint64_t v16 = +[NSAssertionHandler currentHandler];
    uint64_t v17 = +[NSString stringWithUTF8String:"CFDictionaryRef  _Nonnull CreateDebugHierarchyPropertyDescriptionWithValue(CFTypeRef _Nullable, CFStringRef _Nonnull, CFStringRef _Nullable, CFDebugHierarchyLogicalPropertyType _Nullable, CFStringRef _Nullable, DebugHierarchyVisibility, DebugHierarchyPropertyOptions)"];
    [v16 handleFailureInFunction:v17 file:@"DebugHierarchyHelpers_CoreFoundation.h" lineNumber:568 description:&stru_3C770];

    uint64_t v18 = +[NSAssertionHandler currentHandler];
    uint64_t v19 = +[NSString stringWithUTF8String:"CFDictionaryRef  _Nonnull CreateDebugHierarchyPropertyDescription(CFStringRef _Nonnull, CFStringRef _Nullable, CFDebugHierarchyLogicalPropertyType _Nullable, CFStringRef _Nullable, DebugHierarchyVisibility, DebugHierarchyPropertyOptions)"];
    [v18 handleFailureInFunction:v19 file:@"DebugHierarchyHelpers_CoreFoundation.h" lineNumber:575 description:&stru_3C770];
  }
  uint64_t v12 = v11;
  if (!v12)
  {
    uint64_t v20 = +[NSAssertionHandler currentHandler];
    unint64_t v21 = +[NSString stringWithUTF8String:"DebugHierarchyPropertyDescriptionDictionary  _Nonnull DebugHierarchyPropertyDescriptionOfData(NSString * _Nonnull __strong, NSString * _Nullable __strong, DebugHierarchyLogicalPropertyType  _Nullable __strong, NSString * _Nullable __strong, DebugHierarchyVisibility, DebugHierarchyPropertyOptions)"];
    [v20 handleFailureInFunction:v21 file:@"DebugHierarchyHelpers_Foundation.h" lineNumber:666 description:&stru_3C770];
  }
  uint64_t v13 = v12;

  uint64_t v14 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(v0 + 32) = v14;
  return v0;
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

uint64_t dispatch thunk of PropertyListEncoder.encode<A>(_:)()
{
  return dispatch thunk of PropertyListEncoder.encode<A>(_:)();
}

uint64_t PropertyListEncoder.init()()
{
  return PropertyListEncoder.init()();
}

uint64_t type metadata accessor for PropertyListEncoder()
{
  return type metadata accessor for PropertyListEncoder();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t type metadata accessor for ARView()
{
  return type metadata accessor for ARView();
}

uint64_t static RealityKitHierarchyExporter.exportDebugRepresentation(for:)()
{
  return static RealityKitHierarchyExporter.exportDebugRepresentation(for:)();
}

uint64_t type metadata accessor for RealityKitHierarchyExporter()
{
  return type metadata accessor for RealityKitHierarchyExporter();
}

uint64_t type metadata accessor for SpatialSceneDebugRepresentation()
{
  return type metadata accessor for SpatialSceneDebugRepresentation();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t _bridgeCocoaArray<A>(_:)()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t _Pointer.debugDescription.getter()
{
  return _Pointer.debugDescription.getter();
}

uint64_t CAEncodeLayerTree()
{
  return _CAEncodeLayerTree();
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return _CFMakeCollectable(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return _CGColorCreateGenericRGB(red, green, blue, alpha);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return _CGColorGetColorSpace(color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return _CGColorGetComponents(color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return _CGColorGetNumberOfComponents(color);
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return _CGColorSpaceCopyName(space);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return _CGColorSpaceGetModel(space);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectIntersectsRect(rect1, rect2);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

BOOL CGRectIsNull(CGRect rect)
{
  return _CGRectIsNull(rect);
}

uint64_t MTLPixelFormatGetName()
{
  return _MTLPixelFormatGetName();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

uint64_t _UIImageIdentityBundleIdentifier()
{
  return __UIImageIdentityBundleIdentifier();
}

uint64_t _UIImageIdentityName()
{
  return __UIImageIdentityName();
}

uint64_t _UIImageIsFromMainBundle()
{
  return __UIImageIsFromMainBundle();
}

uint64_t _UIImageIsSystemSymbol()
{
  return __UIImageIsSystemSymbol();
}

uint64_t _UIImageIsUIKitImage()
{
  return __UIImageIsUIKitImage();
}

uint64_t _UIImageSymbolConfigurationTextualSummary()
{
  return __UIImageSymbolConfigurationTextualSummary();
}

uint64_t _UIImageViewGetCurrentImage()
{
  return __UIImageViewGetCurrentImage();
}

uint64_t _UIScreenTypePrivateForScreen()
{
  return __UIScreenTypePrivateForScreen();
}

uint64_t _UIScreenTypePrivateIsRectangular()
{
  return __UIScreenTypePrivateIsRectangular();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL object_isClass(id obj)
{
  return _object_isClass(obj);
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return _setenv(__name, __value, __overwrite);
}

char *__cdecl stpncpy(char *__dst, const char *__src, size_t __n)
{
  return _stpncpy(__dst, __src, __n);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

int uname(utsname *a1)
{
  return _uname(a1);
}

int unsetenv(const char *a1)
{
  return _unsetenv(a1);
}

id objc_msgSend_CATransform3DValue(void *a1, const char *a2, ...)
{
  return _[a1 CATransform3DValue];
}

id objc_msgSend_CGAffineTransformValue(void *a1, const char *a2, ...)
{
  return _[a1 CGAffineTransformValue];
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _[a1 CGColor];
}

id objc_msgSend_CGPointValue(void *a1, const char *a2, ...)
{
  return _[a1 CGPointValue];
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return _[a1 CGRectValue];
}

id objc_msgSend_CGSizeValue(void *a1, const char *a2, ...)
{
  return _[a1 CGSizeValue];
}

id objc_msgSend_CGVectorValue(void *a1, const char *a2, ...)
{
  return _[a1 CGVectorValue];
}

id objc_msgSend_UIEdgeInsetsValue(void *a1, const char *a2, ...)
{
  return _[a1 UIEdgeInsetsValue];
}

id objc_msgSend_UIOffsetValue(void *a1, const char *a2, ...)
{
  return _[a1 UIOffsetValue];
}

id objc_msgSend__CGPDFPage(void *a1, const char *a2, ...)
{
  return _[a1 _CGPDFPage];
}

id objc_msgSend__CGSVGDocument(void *a1, const char *a2, ...)
{
  return _[a1 _CGSVGDocument];
}

id objc_msgSend___dbg_ambiguityStatusMask(void *a1, const char *a2, ...)
{
  return [a1 __dbg_ambiguityStatusMask];
}

id objc_msgSend___dbg_constraintsAffectingLayoutForAxis_(void *a1, const char *a2, ...)
{
  return [a1 __dbg_constraintsAffectingLayoutForAxis:];
}

id objc_msgSend___dbg_contentOffsetForSelectedSegment(void *a1, const char *a2, ...)
{
  return [a1 __dbg_contentOffsetForSelectedSegment];
}

id objc_msgSend___dbg_firstBaselineOffsetFromTop(void *a1, const char *a2, ...)
{
  return [a1 __dbg_firstBaselineOffsetFromTop];
}

id objc_msgSend___dbg_formattedDisplayName(void *a1, const char *a2, ...)
{
  return [a1 __dbg_formattedDisplayName];
}

id objc_msgSend___dbg_hasAmbiguousLayout(void *a1, const char *a2, ...)
{
  return [a1 __dbg_hasAmbiguousLayout];
}

id objc_msgSend___dbg_hasValidSelectedSegmentIndex(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "__dbg_hasValidSelectedSegmentIndex");
}

id objc_msgSend___dbg_isEnabledForSelectedSegment(void *a1, const char *a2, ...)
{
  return [a1 __dbg_isEnabledForSelectedSegment];
}

id objc_msgSend___dbg_lastBaselineOffsetFromBottom(void *a1, const char *a2, ...)
{
  return [a1 __dbg_lastBaselineOffsetFromBottom];
}

id objc_msgSend___dbg_layer(void *a1, const char *a2, ...)
{
  return [a1 __dbg_layer];
}

id objc_msgSend___dbg_pointOfViewIndexPath(void *a1, const char *a2, ...)
{
  return [a1 __dbg_pointOfViewIndexPath];
}

id objc_msgSend___dbg_renderingModeIsMultiLayer(void *a1, const char *a2, ...)
{
  return [a1 __dbg_renderingModeIsMultiLayer];
}

id objc_msgSend___dbg_scopeButtonTitles(void *a1, const char *a2, ...)
{
  return [a1 __dbg_scopeButtonTitles];
}

id objc_msgSend___dbg_shouldIgnoreScrollableContentHeightAmbiguity(void *a1, const char *a2, ...)
{
  return [a1 __dbg_shouldIgnoreScrollableContentHeightAmbiguity];
}

id objc_msgSend___dbg_shouldIgnoreScrollableContentWidthAmbiguity(void *a1, const char *a2, ...)
{
  return [a1 __dbg_shouldIgnoreScrollableContentWidthAmbiguity];
}

id objc_msgSend___dbg_snapshotImage(void *a1, const char *a2, ...)
{
  return [a1 __dbg_snapshotImage];
}

id objc_msgSend___dbg_snapshotImageRenderedUsingDrawHierarchyInRect(void *a1, const char *a2, ...)
{
  return [a1 __dbg_snapshotImageRenderedUsingDrawHierarchyInRect];
}

id objc_msgSend___dbg_titleForSelectedSegment(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "__dbg_titleForSelectedSegment");
}

id objc_msgSend___dbg_traitCollectionDisplayCornerRadius(void *a1, const char *a2, ...)
{
  return [a1 __dbg_traitCollectionDisplayCornerRadius];
}

id objc_msgSend___dbg_viewController(void *a1, const char *a2, ...)
{
  return [a1 __dbg_viewController];
}

id objc_msgSend___dbg_viewForFirstBaselineLayout(void *a1, const char *a2, ...)
{
  return [a1 __dbg_viewForFirstBaselineLayout];
}

id objc_msgSend___dbg_viewForLastBaselineLayout(void *a1, const char *a2, ...)
{
  return [a1 __dbg_viewForLastBaselineLayout];
}

id objc_msgSend___dbg_wantsAutoLayout(void *a1, const char *a2, ...)
{
  return [a1 __dbg_wantsAutoLayout];
}

id objc_msgSend___dbg_widthForSelectedSegment(void *a1, const char *a2, ...)
{
  return [a1 __dbg_widthForSelectedSegment];
}

id objc_msgSend__arrayEncodedIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 _arrayEncodedIndexPath:];
}

id objc_msgSend__baselineOffsetFromBottom(void *a1, const char *a2, ...)
{
  return _[a1 _baselineOffsetFromBottom];
}

id objc_msgSend__boundsHeightVariable(void *a1, const char *a2, ...)
{
  return _[a1 _boundsHeightVariable];
}

id objc_msgSend__boundsWidthVariable(void *a1, const char *a2, ...)
{
  return _[a1 _boundsWidthVariable];
}

id objc_msgSend__collectSubviewInfoForView_encodeLayers_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_collectSubviewInfoForView:encodeLayers:");
}

id objc_msgSend__contentHeightVariable(void *a1, const char *a2, ...)
{
  return _[a1 _contentHeightVariable];
}

id objc_msgSend__contentWidthVariable(void *a1, const char *a2, ...)
{
  return _[a1 _contentWidthVariable];
}

id objc_msgSend__debugCatalogBundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _debugCatalogBundleIdentifier];
}

id objc_msgSend__debugName(void *a1, const char *a2, ...)
{
  return _[a1 _debugName];
}

id objc_msgSend__firstBaselineOffsetFromTop(void *a1, const char *a2, ...)
{
  return _[a1 _firstBaselineOffsetFromTop];
}

id objc_msgSend__imageResizedForDisplayInInspector(void *a1, const char *a2, ...)
{
  return _[a1 _imageResizedForDisplayInInspector];
}

id objc_msgSend__indexPathForNode_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_indexPathForNode:");
}

id objc_msgSend__isEffectView_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_isEffectView:");
}

id objc_msgSend__layerInfo_view_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_layerInfo:view:");
}

id objc_msgSend__layerShouldSupersedeSnapshot_(void *a1, const char *a2, ...)
{
  return [a1 _layerShouldSupersedeSnapshot:];
}

id objc_msgSend__layoutVariablesWithAmbiguousValue(void *a1, const char *a2, ...)
{
  return _[a1 _layoutVariablesWithAmbiguousValue];
}

id objc_msgSend__messagesUIExtensionViews(void *a1, const char *a2, ...)
{
  return _[a1 _messagesUIExtensionViews];
}

id objc_msgSend__minXVariable(void *a1, const char *a2, ...)
{
  return _[a1 _minXVariable];
}

id objc_msgSend__minYVariable(void *a1, const char *a2, ...)
{
  return _[a1 _minYVariable];
}

id objc_msgSend__nativeDisplayBounds(void *a1, const char *a2, ...)
{
  return _[a1 _nativeDisplayBounds];
}

id objc_msgSend__outermostLayer(void *a1, const char *a2, ...)
{
  return _[a1 _outermostLayer];
}

id objc_msgSend__pointsPerInch(void *a1, const char *a2, ...)
{
  return _[a1 _pointsPerInch];
}

id objc_msgSend__populateConstraintInfosArray_forViewHierarchy_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_populateConstraintInfosArray:forViewHierarchy:");
}

id objc_msgSend__renderEffectViewUsingDrawHierarchyInRect_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_renderEffectViewUsingDrawHierarchyInRect:");
}

id objc_msgSend__shouldEncodeLayers(void *a1, const char *a2, ...)
{
  return _[a1 _shouldEncodeLayers];
}

id objc_msgSend__snapshotView_andAddDataToDictionary_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_snapshotView:andAddDataToDictionary:");
}

id objc_msgSend__uiib_hostsLayoutEngine(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_uiib_hostsLayoutEngine")
}

id objc_msgSend__uiib_layoutEngineCreatingIfNecessary(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_uiib_layoutEngineCreatingIfNecessary")
}

id objc_msgSend__viewDelegate(void *a1, const char *a2, ...)
{
  return _[a1 _viewDelegate];
}

id objc_msgSend__viewHasAmbiguousLayout_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_viewHasAmbiguousLayout:");
}

id objc_msgSend__wantsAutolayout(void *a1, const char *a2, ...)
{
  return _[a1 _wantsAutolayout];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_accessibilityCustomActions(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityCustomActions];
}

id objc_msgSend_accessibilityElements(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityElements];
}

id objc_msgSend_accessibilityLabel(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityLabel];
}

id objc_msgSend_actionsForTarget_forControlEvent_(void *a1, const char *a2, ...)
{
  return [a1 actionsForTarget:forControlEvent:];
}

id objc_msgSend_activeExtensionContext(void *a1, const char *a2, ...)
{
  return _[a1 activeExtensionContext];
}

id objc_msgSend_addFrameBasics_toDict_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "addFrameBasics:toDict:");
}

id objc_msgSend_addLayoutInfoForView_toDict_(void *a1, const char *a2, ...)
{
  return [a1 addLayoutInfoForView:toDict:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectBasics_toDict_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "addObjectBasics:toDict:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addPathForClass_(void *a1, const char *a2, ...)
{
  return [a1 addPathForClass:];
}

id objc_msgSend_addViewBasics_toDict_(void *a1, const char *a2, ...)
{
  return [a1 addViewBasics:toDict:];
}

id objc_msgSend_addViewLayerInfo_toDict_(void *a1, const char *a2, ...)
{
  return [a1 addViewLayerInfo:toDict:];
}

id objc_msgSend_addViewSubclassSpecificInfoForView_toDict_(void *a1, const char *a2, ...)
{
  return [a1 addViewSubclassSpecificInfoForView:toDict:];
}

id objc_msgSend_additionalRootLevelViewsToArchive(void *a1, const char *a2, ...)
{
  return _[a1 additionalRootLevelViewsToArchive];
}

id objc_msgSend_alignmentRectForFrame_(void *a1, const char *a2, ...)
{
  return [a1 alignmentRectForFrame:];
}

id objc_msgSend_allTargets(void *a1, const char *a2, ...)
{
  return _[a1 allTargets];
}

id objc_msgSend_allWindowsIncludingInternalWindows_onlyVisibleWindows_(void *a1, const char *a2, ...)
{
  return [a1 allWindowsIncludingInternalWindows:onlyVisibleWindows:];
}

id objc_msgSend_allowsNextDrawableTimeout(void *a1, const char *a2, ...)
{
  return _[a1 allowsNextDrawableTimeout];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return _[a1 alpha];
}

id objc_msgSend_ambiguityStatusMaskForView_(void *a1, const char *a2, ...)
{
  return [a1 ambiguityStatusMaskForView:];
}

id objc_msgSend_anchorPoint(void *a1, const char *a2, ...)
{
  return _[a1 anchorPoint];
}

id objc_msgSend_anchorPointZ(void *a1, const char *a2, ...)
{
  return _[a1 anchorPointZ];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_appWindows(void *a1, const char *a2, ...)
{
  return _[a1 appWindows];
}

id objc_msgSend_archivedDataWithRootObject_options_(void *a1, const char *a2, ...)
{
  return [a1 archivedDataWithRootObject:x0 options:x1];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return [a1 arrayByAddingObject:];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithCapacity:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:];
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return _[a1 ascender];
}

id objc_msgSend_attributedText(void *a1, const char *a2, ...)
{
  return _[a1 attributedText];
}

id objc_msgSend_autocapitalizationType(void *a1, const char *a2, ...)
{
  return _[a1 autocapitalizationType];
}

id objc_msgSend_autocorrectionType(void *a1, const char *a2, ...)
{
  return _[a1 autocorrectionType];
}

id objc_msgSend_backBarButtonItem(void *a1, const char *a2, ...)
{
  return _[a1 backBarButtonItem];
}

id objc_msgSend_baselineOffsetFromBottom(void *a1, const char *a2, ...)
{
  return _[a1 baselineOffsetFromBottom];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return _[a1 bundlePath];
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return _[a1 callStackSymbols];
}

id objc_msgSend_capHeight(void *a1, const char *a2, ...)
{
  return _[a1 capHeight];
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return _[a1 childViewControllers];
}

id objc_msgSend_classMap(void *a1, const char *a2, ...)
{
  return _[a1 classMap];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_clipsToBounds(void *a1, const char *a2, ...)
{
  return _[a1 clipsToBounds];
}

id objc_msgSend_collectViewInfo_(void *a1, const char *a2, ...)
{
  return [a1 collectViewInfo:];
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return _[a1 collectionView];
}

id objc_msgSend_colorPixelFormat(void *a1, const char *a2, ...)
{
  return _[a1 colorPixelFormat];
}

id objc_msgSend_colorspace(void *a1, const char *a2, ...)
{
  return _[a1 colorspace];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsJoinedByString:];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsSeparatedByString:];
}

id objc_msgSend_compositingFilter(void *a1, const char *a2, ...)
{
  return _[a1 compositingFilter];
}

id objc_msgSend_constant(void *a1, const char *a2, ...)
{
  return _[a1 constant];
}

id objc_msgSend_constraints(void *a1, const char *a2, ...)
{
  return _[a1 constraints];
}

id objc_msgSend_constraintsAffectingLayoutForAxis_(void *a1, const char *a2, ...)
{
  return [a1 constraintsAffectingLayoutForAxis:];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_contentCompressionResistancePriorityForAxis_(void *a1, const char *a2, ...)
{
  return [a1 contentCompressionResistancePriorityForAxis:];
}

id objc_msgSend_contentHuggingPriorityForAxis_(void *a1, const char *a2, ...)
{
  return [a1 contentHuggingPriorityForAxis:];
}

id objc_msgSend_contentInsets(void *a1, const char *a2, ...)
{
  return _[a1 contentInsets];
}

id objc_msgSend_contentOffsetForSegmentAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 contentOffsetForSegmentAtIndex:];
}

id objc_msgSend_contentScaleFactor(void *a1, const char *a2, ...)
{
  return _[a1 contentScaleFactor];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_contents(void *a1, const char *a2, ...)
{
  return _[a1 contents];
}

id objc_msgSend_convertRect_fromView_(void *a1, const char *a2, ...)
{
  return [a1 convertRect:fromView:];
}

id objc_msgSend_convertRect_toView_(void *a1, const char *a2, ...)
{
  return [a1 convertRect:toView:];
}

id objc_msgSend_coordinateSpace(void *a1, const char *a2, ...)
{
  return _[a1 coordinateSpace];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "countByEnumeratingWithState:objects:count:")];
}

id objc_msgSend_currentAttributedTitle(void *a1, const char *a2, ...)
{
  return _[a1 currentAttributedTitle];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentTitle(void *a1, const char *a2, ...)
{
  return _[a1 currentTitle];
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return [a1 dataWithPropertyList:x0 format:x1 options:x2 error:x3];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_depthStencilPixelFormat(void *a1, const char *a2, ...)
{
  return _[a1 depthStencilPixelFormat];
}

id objc_msgSend_descender(void *a1, const char *a2, ...)
{
  return _[a1 descender];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return _[a1 device];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithDictionary:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_directionalEdgeInsetsValue(void *a1, const char *a2, ...)
{
  return _[a1 directionalEdgeInsetsValue];
}

id objc_msgSend_displayCornerRadius(void *a1, const char *a2, ...)
{
  return _[a1 displayCornerRadius];
}

id objc_msgSend_displayNameForView_(void *a1, const char *a2, ...)
{
  return [a1 displayNameForView:];
}

id objc_msgSend_documentStorageURL(void *a1, const char *a2, ...)
{
  return _[a1 documentStorageURL];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_drawInRect_(void *a1, const char *a2, ...)
{
  return [a1 drawInRect:];
}

id objc_msgSend_drawInRect_blendMode_alpha_(void *a1, const char *a2, ...)
{
  return [a1 drawInRect:x0 blendMode:x1 alpha:x2];
}

id objc_msgSend_drawViewHierarchyInRect_afterScreenUpdates_(void *a1, const char *a2, ...)
{
  return [a1 drawViewHierarchyInRect:x0 afterScreenUpdates:x1];
}

id objc_msgSend_enablesReturnKeyAutomatically(void *a1, const char *a2, ...)
{
  return _[a1 enablesReturnKeyAutomatically];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:userInfo:];
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return _[a1 familyName];
}

id objc_msgSend_fetchViewHierarchy(void *a1, const char *a2, ...)
{
  return _[a1 fetchViewHierarchy];
}

id objc_msgSend_firstAttribute(void *a1, const char *a2, ...)
{
  return _[a1 firstAttribute];
}

id objc_msgSend_firstBaselineOffsetFromTopForView_(void *a1, const char *a2, ...)
{
  return [a1 firstBaselineOffsetFromTopForView:];
}

id objc_msgSend_firstItem(void *a1, const char *a2, ...)
{
  return _[a1 firstItem];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_fontName(void *a1, const char *a2, ...)
{
  return _[a1 fontName];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_getIndexes_range_(void *a1, const char *a2, ...)
{
  return [a1 getIndexes:range:];
}

id objc_msgSend_getRendererInfo_size_(void *a1, const char *a2, ...)
{
  return [a1 getRendererInfo:x0 size:x1];
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return [a1 handleFailureInFunction:file:lineNumber:description:];
}

id objc_msgSend_hasBaseline(void *a1, const char *a2, ...)
{
  return _[a1 hasBaseline];
}

id objc_msgSend_hasContentInsets(void *a1, const char *a2, ...)
{
  return _[a1 hasContentInsets];
}

id objc_msgSend_hasMidline(void *a1, const char *a2, ...)
{
  return _[a1 hasMidline];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_hasValue_forVariable_(void *a1, const char *a2, ...)
{
  return [a1 hasValue:forVariable:];
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return _[a1 horizontalSizeClass];
}

id objc_msgSend_ibShouldIgnoreScrollableContentHeightAmbiguityForRepresentationOfItem_(void *a1, const char *a2, ...)
{
  return [a1 ibShouldIgnoreScrollableContentHeightAmbiguityForRepresentationOfItem:];
}

id objc_msgSend_ibShouldIgnoreScrollableContentWidthAmbiguityForRepresentationOfItem_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "ibShouldIgnoreScrollableContentWidthAmbiguityForRepresentationOfItem:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _[a1 image];
}

id objc_msgSend_imageForSegmentAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 imageForSegmentAtIndex:];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return _[a1 imageView];
}

id objc_msgSend_indexAtPosition_(void *a1, const char *a2, ...)
{
  return [a1 indexAtPosition:];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return [a1 indexOfObject:];
}

id objc_msgSend_indexPathWithIndexes_length_(void *a1, const char *a2, ...)
{
  return [a1 indexPathWithIndexes:x0 length:x1];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_isDoubleSided(void *a1, const char *a2, ...)
{
  return _[a1 isDoubleSided];
}

id objc_msgSend_isEnabledForSegmentAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 isEnabledForSegmentAtIndex:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _[a1 isHidden];
}

id objc_msgSend_isHiddenForWindow_(void *a1, const char *a2, ...)
{
  return [a1 isHiddenForWindow:];
}

id objc_msgSend_isSecureTextEntry(void *a1, const char *a2, ...)
{
  return _[a1 isSecureTextEntry];
}

id objc_msgSend_isViewSubclass_(void *a1, const char *a2, ...)
{
  return [a1 isViewSubclass:];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 keyEnumerator];
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return _[a1 keyWindow];
}

id objc_msgSend_keyboardAppearance(void *a1, const char *a2, ...)
{
  return _[a1 keyboardAppearance];
}

id objc_msgSend_keyboardType(void *a1, const char *a2, ...)
{
  return _[a1 keyboardType];
}

id objc_msgSend_largeTitleTextAttributes(void *a1, const char *a2, ...)
{
  return _[a1 largeTitleTextAttributes];
}

id objc_msgSend_lastBaselineOffsetFromBottomForView_(void *a1, const char *a2, ...)
{
  return [a1 lastBaselineOffsetFromBottomForView:];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layerClass(void *a1, const char *a2, ...)
{
  return _[a1 layerClass];
}

id objc_msgSend_layerForView_(void *a1, const char *a2, ...)
{
  return [a1 layerForView:];
}

id objc_msgSend_layoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 layoutDirection];
}

id objc_msgSend_layoutGuides(void *a1, const char *a2, ...)
{
  return _[a1 layoutGuides];
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return _[a1 layoutMargins];
}

id objc_msgSend_leading(void *a1, const char *a2, ...)
{
  return _[a1 leading];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lineHeight(void *a1, const char *a2, ...)
{
  return _[a1 lineHeight];
}

id objc_msgSend_locale(void *a1, const char *a2, ...)
{
  return _[a1 locale];
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 localeIdentifier];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_makeViewDebugData(void *a1, const char *a2, ...)
{
  return _[a1 makeViewDebugData];
}

id objc_msgSend_mapTableWithKeyOptions_valueOptions_(void *a1, const char *a2, ...)
{
  return [a1 mapTableWithKeyOptions:valueOptions:];
}

id objc_msgSend_masksToBounds(void *a1, const char *a2, ...)
{
  return _[a1 masksToBounds];
}

id objc_msgSend_maximumDate(void *a1, const char *a2, ...)
{
  return _[a1 maximumDate];
}

id objc_msgSend_maximumDrawableCount(void *a1, const char *a2, ...)
{
  return _[a1 maximumDrawableCount];
}

id objc_msgSend_midlineOffsetFromCenter(void *a1, const char *a2, ...)
{
  return _[a1 midlineOffsetFromCenter];
}

id objc_msgSend_minimumDate(void *a1, const char *a2, ...)
{
  return _[a1 minimumDate];
}

id objc_msgSend_multiplier(void *a1, const char *a2, ...)
{
  return _[a1 multiplier];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nibBundle(void *a1, const char *a2, ...)
{
  return _[a1 nibBundle];
}

id objc_msgSend_numberOfSegments(void *a1, const char *a2, ...)
{
  return _[a1 numberOfSegments];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return [a1 numberWithFloat:];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInt:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInt:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLong:];
}

id objc_msgSend_objCType(void *a1, const char *a2, ...)
{
  return _[a1 objCType];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndex:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_opacity(void *a1, const char *a2, ...)
{
  return _[a1 opacity];
}

id objc_msgSend_optimizationOpportunities_(void *a1, const char *a2, ...)
{
  return [a1 optimizationOpportunities:];
}

id objc_msgSend_originalURL(void *a1, const char *a2, ...)
{
  return _[a1 originalURL];
}

id objc_msgSend_pathForClass_(void *a1, const char *a2, ...)
{
  return [a1 pathForClass:];
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return [a1 performSelector:];
}

id objc_msgSend_pixelFormat(void *a1, const char *a2, ...)
{
  return _[a1 pixelFormat];
}

id objc_msgSend_pointOfView(void *a1, const char *a2, ...)
{
  return _[a1 pointOfView];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return _[a1 pointSize];
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return _[a1 position];
}

id objc_msgSend_preferredDevice(void *a1, const char *a2, ...)
{
  return _[a1 preferredDevice];
}

id objc_msgSend_preferredSymbolConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 preferredSymbolConfiguration];
}

id objc_msgSend_presentationLayer(void *a1, const char *a2, ...)
{
  return _[a1 presentationLayer];
}

id objc_msgSend_presentsWithTransaction(void *a1, const char *a2, ...)
{
  return _[a1 presentsWithTransaction];
}

id objc_msgSend_primaryWindowFromWindows_(void *a1, const char *a2, ...)
{
  return [a1 primaryWindowFromWindows:];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return _[a1 priority];
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfString:];
}

id objc_msgSend_readableContentGuide(void *a1, const char *a2, ...)
{
  return _[a1 readableContentGuide];
}

id objc_msgSend_refreshControl(void *a1, const char *a2, ...)
{
  return _[a1 refreshControl];
}

id objc_msgSend_relation(void *a1, const char *a2, ...)
{
  return _[a1 relation];
}

id objc_msgSend_renderInContext_(void *a1, const char *a2, ...)
{
  return [a1 renderInContext:];
}

id objc_msgSend_returnKeyType(void *a1, const char *a2, ...)
{
  return _[a1 returnKeyType];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _[a1 rootViewController];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scene(void *a1, const char *a2, ...)
{
  return _[a1 scene];
}

id objc_msgSend_scopeButtonTitles(void *a1, const char *a2, ...)
{
  return _[a1 scopeButtonTitles];
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return _[a1 screen];
}

id objc_msgSend_screenBackingScaleForView_(void *a1, const char *a2, ...)
{
  return [a1 screenBackingScaleForView:];
}

id objc_msgSend_screenBackingScaleForWindow_(void *a1, const char *a2, ...)
{
  return [a1 screenBackingScaleForWindow:];
}

id objc_msgSend_secondAttribute(void *a1, const char *a2, ...)
{
  return _[a1 secondAttribute];
}

id objc_msgSend_secondItem(void *a1, const char *a2, ...)
{
  return _[a1 secondItem];
}

id objc_msgSend_selectedSegmentIndex(void *a1, const char *a2, ...)
{
  return _[a1 selectedSegmentIndex];
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return [a1 setAlpha:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setOpacity_(void *a1, const char *a2, ...)
{
  return [a1 setOpacity:];
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return [a1 setWithArray:];
}

id objc_msgSend_shadowColor(void *a1, const char *a2, ...)
{
  return _[a1 shadowColor];
}

id objc_msgSend_shadowOffset(void *a1, const char *a2, ...)
{
  return _[a1 shadowOffset];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_snapshot(void *a1, const char *a2, ...)
{
  return _[a1 snapshot];
}

id objc_msgSend_snapshotMethodForView_(void *a1, const char *a2, ...)
{
  return [a1 snapshotMethodForView:];
}

id objc_msgSend_snapshotView_errorString_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "snapshotView:errorString:")];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingPathComponent:];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingString:];
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return [a1 stringWithCString:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _[a1 style];
}

id objc_msgSend_sublayerTransform(void *a1, const char *a2, ...)
{
  return _[a1 sublayerTransform];
}

id objc_msgSend_sublayers(void *a1, const char *a2, ...)
{
  return _[a1 sublayers];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringFromIndex:];
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringToIndex:];
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return [a1 substringWithRange:];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _[a1 subviews];
}

id objc_msgSend_subviewsForView_(void *a1, const char *a2, ...)
{
  return [a1 subviewsForView:];
}

id objc_msgSend_superclass(void *a1, const char *a2, ...)
{
  return _[a1 superclass];
}

id objc_msgSend_superlayer(void *a1, const char *a2, ...)
{
  return _[a1 superlayer];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_swiftUI_displayListID(void *a1, const char *a2, ...)
{
  return [a1 swiftUI_displayListID];
}

id objc_msgSend_symbolConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 symbolConfiguration];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return _[a1 tableView];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_titleForSegmentAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 titleForSegmentAtIndex:];
}

id objc_msgSend_titleForWindow_(void *a1, const char *a2, ...)
{
  return [a1 titleForWindow:];
}

id objc_msgSend_titleTextAttributes(void *a1, const char *a2, ...)
{
  return _[a1 titleTextAttributes];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return _[a1 transform];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseString];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceStyle];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}

id objc_msgSend_valueWithCGRect_(void *a1, const char *a2, ...)
{
  return [a1 valueWithCGRect:x0];
}

id objc_msgSend_verticalSizeClass(void *a1, const char *a2, ...)
{
  return _[a1 verticalSizeClass];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return _[a1 viewController];
}

id objc_msgSend_viewDebuggerEffectViewsToSnapshotAsImage(void *a1, const char *a2, ...)
{
  return _[a1 viewDebuggerEffectViewsToSnapshotAsImage];
}

id objc_msgSend_viewForFirstBaselineLayout(void *a1, const char *a2, ...)
{
  return _[a1 viewForFirstBaselineLayout];
}

id objc_msgSend_viewForFirstBaselineLayoutPointerForView_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "viewForFirstBaselineLayoutPointerForView:");
}

id objc_msgSend_viewForLastBaselineLayout(void *a1, const char *a2, ...)
{
  return _[a1 viewForLastBaselineLayout];
}

id objc_msgSend_viewForLastBaselineLayoutPointerForView_(void *a1, const char *a2, ...)
{
  return [a1 viewForLastBaselineLayoutPointerForView:];
}

id objc_msgSend_viewIfLoaded(void *a1, const char *a2, ...)
{
  return _[a1 viewIfLoaded];
}

id objc_msgSend_widthForSegmentAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 widthForSegmentAtIndex:];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}

id objc_msgSend_windowContentViewForWindow_(void *a1, const char *a2, ...)
{
  return [a1 windowContentViewForWindow:];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _[a1 windowScene];
}

id objc_msgSend_windows(void *a1, const char *a2, ...)
{
  return _[a1 windows];
}

id objc_msgSend_xHeight(void *a1, const char *a2, ...)
{
  return _[a1 xHeight];
}

id objc_msgSend_zPosition(void *a1, const char *a2, ...)
{
  return _[a1 zPosition];
}