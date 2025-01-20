GKPath __swiftcall GKPath.init(points:radius:cyclical:)(Swift::OpaquePointer points, Swift::Float radius, Swift::Bool cyclical)
{
  return (GKPath)GKPath.init(points:radius:cyclical:)((uint64_t)points._rawValue, cyclical, (uint64_t (*)(void, uint64_t, void, uint64_t))specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:), (SEL *)&selRef_initWithPoints_count_radius_cyclical_, radius);
}

{
  return (GKPath)GKPath.init(points:radius:cyclical:)((uint64_t)points._rawValue, cyclical, (uint64_t (*)(void, uint64_t, void, uint64_t))specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:), (SEL *)&selRef_initWithFloat3Points_count_radius_cyclical_, radius);
}

id GKPath.init(points:radius:cyclical:)(uint64_t a1, char a2, uint64_t (*a3)(void, uint64_t, void, uint64_t), SEL *a4, float a5)
{
  uint64_t v9 = a1;
  uint64_t v10 = *(void *)(a1 + 16);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v9 = a3(0, v10, 0, v9);
  }
  id v11 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  *(float *)&double v12 = a5;
  id v13 = [v11 *a4:v9 + 32, v10, a2 & 1, v12];
  swift_bridgeObjectRelease();
  return v13;
}

GKPolygonObstacle __swiftcall GKPolygonObstacle.init(points:)(Swift::OpaquePointer points)
{
  rawValue = (char *)points._rawValue;
  int64_t v2 = *((void *)points._rawValue + 2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    rawValue = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0, rawValue);
  }
  id v3 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithPoints:rawValue + 32 count:v2];
  swift_bridgeObjectRelease();
  return (GKPolygonObstacle)v3;
}

id GKEntity.component<A>(ofType:)()
{
  id result = [v0 componentForClass:swift_getObjCClassFromMetadata()];
  if (result)
  {
    int64_t v2 = result;
    id result = (id)swift_dynamicCastUnknownClass();
    if (!result)
    {

      return 0;
    }
  }
  return result;
}

id GKEntity.removeComponent<A>(ofType:)()
{
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();

  return [v0 removeComponentForClass:ObjCClassFromMetadata];
}

uint64_t GKStateMachine.state<A>(forClass:)()
{
  swift_getMetatypeMetadata();
  id v1 = [v0 sel_performSelector_withObject_:sel_stateForClass_:[_bridgeAnythingToObjectiveC<A>(_:)()]];
  swift_unknownObjectRelease();
  if (!v1) {
    return 0;
  }
  swift_unknownObjectRetain();
  return swift_dynamicCastUnknownClassUnconditional();
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SIMD2<Float>>);
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
  id v13 = v10 + 32;
  v14 = a4 + 32;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SIMD3<Float>>);
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
  id v13 = v10 + 32;
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
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
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

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return MEMORY[0x270F9F7C0]();
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x270FA02B0]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x270FA02B8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}