Swift::Void __swiftcall WKInterfaceController.presentController(withNamesAndContexts:)(Swift::OpaquePointer withNamesAndContexts)
{
  void *v1;
  void *v2;
  int64_t v4;
  uint64_t v5;
  uint64_t *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSArray v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  Class isa;
  void *v20;
  long long v21;
  uint64_t ObjectType;
  uint64_t v23;

  v2 = v1;
  v4 = *((void *)withNamesAndContexts._rawValue + 2);
  if (v4)
  {
    v20 = v1;
    *(void *)&v21 = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4, 0);
    v5 = v21;
    v6 = (uint64_t *)((char *)withNamesAndContexts._rawValue + 40);
    v7 = v4;
    do
    {
      v9 = *(v6 - 1);
      v8 = *v6;
      *(void *)&v21 = v5;
      v11 = *(void *)(v5 + 16);
      v10 = *(void *)(v5 + 24);
      swift_bridgeObjectRetain();
      if (v11 >= v10 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1);
        v5 = v21;
      }
      v6 += 3;
      *(void *)(v5 + 16) = v11 + 1;
      v12 = v5 + 16 * v11;
      *(void *)(v12 + 32) = v9;
      *(void *)(v12 + 40) = v8;
      --v7;
    }
    while (v7);
    v2 = v20;
  }
  v13.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  if (v4)
  {
    v23 = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4, 0);
    v14 = v23;
    v15 = (uint64_t *)((char *)withNamesAndContexts._rawValue + 48);
    do
    {
      v16 = *v15;
      ObjectType = swift_getObjectType();
      v23 = v14;
      *(void *)&v21 = v16;
      v18 = *(void *)(v14 + 16);
      v17 = *(void *)(v14 + 24);
      swift_unknownObjectRetain();
      if (v18 >= v17 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v17 > 1), v18 + 1, 1);
        v14 = v23;
      }
      *(void *)(v14 + 16) = v18 + 1;
      outlined init with take of Any(&v21, (_OWORD *)(v14 + 32 * v18 + 32));
      v15 += 3;
      --v4;
    }
    while (v4);
  }
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v2 presentControllerWithNames:v13.super.isa contexts:isa];
}

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

{
  char **v3;
  char *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = result;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
    v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x263F8EE78];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    v10 = (char *)swift_allocObject();
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
    v10 = (char *)MEMORY[0x263F8EE78];
  }
  v13 = v10 + 32;
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
  swift_release();
  return v10;
}

void specialized static WKInterfaceController.reloadRootControllers(withNamesAndContexts:)(int64_t *a1)
{
  int64_t v2 = a1[2];
  if (v2)
  {
    *(void *)&long long v19 = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0);
    uint64_t v3 = v19;
    v4 = a1 + 5;
    int64_t v5 = v2;
    do
    {
      uint64_t v7 = *(v4 - 1);
      uint64_t v6 = *v4;
      *(void *)&long long v19 = v3;
      unint64_t v8 = *(void *)(v3 + 16);
      unint64_t v9 = *(void *)(v3 + 24);
      swift_bridgeObjectRetain();
      if (v8 >= v9 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v9 > 1), v8 + 1, 1);
        uint64_t v3 = v19;
      }
      v4 += 3;
      *(void *)(v3 + 16) = v8 + 1;
      uint64_t v10 = v3 + 16 * v8;
      *(void *)(v10 + 32) = v7;
      *(void *)(v10 + 40) = v6;
      --v5;
    }
    while (v5);
  }
  v11.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  if (v2)
  {
    uint64_t v21 = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0);
    uint64_t v12 = v21;
    v13 = a1 + 6;
    do
    {
      uint64_t v14 = *v13;
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v21 = v12;
      *(void *)&long long v19 = v14;
      unint64_t v15 = *(void *)(v12 + 16);
      unint64_t v16 = *(void *)(v12 + 24);
      swift_unknownObjectRetain();
      if (v15 >= v16 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v16 > 1), v15 + 1, 1);
        uint64_t v12 = v21;
      }
      *(void *)(v12 + 16) = v15 + 1;
      outlined init with take of Any(&v19, (_OWORD *)(v12 + 32 * v15 + 32));
      v13 += 3;
      --v2;
    }
    while (v2);
  }
  v17 = self;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v17 reloadRootControllersWithNames:v11.super.isa contexts:isa];
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
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

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B88]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}