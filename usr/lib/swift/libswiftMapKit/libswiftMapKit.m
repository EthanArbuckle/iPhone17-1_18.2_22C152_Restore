void protocol witness for RawRepresentable.init(rawValue:) in conformance MKMapItemIdentifier(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = *a1;
  v4 = a1[1];
  v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v6 = (void *)MEMORY[0x2166C7FB0](v3, v4);
  swift_bridgeObjectRelease();
  v7 = [v5 initWithIdentifierString:v6];

  *a2 = v7;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance MKMapItemIdentifier(uint64_t *a1@<X8>)
{
  id v3 = [*v1 sel_identifierString];
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;

  *a1 = v4;
  a1[1] = v6;
}

uint64_t protocol witness for Decodable.init(from:) in conformance MKMapItemIdentifier()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance MKMapItemIdentifier()
{
  return RawRepresentable<>.encode(to:)();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MKCoordinateSpan(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for MKCoordinateSpan(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
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
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for MKCoordinateSpan()
{
  if (!lazy cache variable for type metadata for MKCoordinateSpan)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for MKCoordinateSpan);
    }
  }
}

char *MKGradientPolylineRenderer.locations.getter()
{
  id v1 = [v0 sel_locations];
  type metadata accessor for NSNumber(0, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v3) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v13 = MEMORY[0x263F8EE78];
  __n128 result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = 0;
    uint64_t v6 = v13;
    do
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v7 = (id)MEMORY[0x2166C8010](v5, v2);
      }
      else {
        id v7 = *(id *)(v2 + 8 * v5 + 32);
      }
      v8 = v7;
      [v7 doubleValue];
      uint64_t v10 = v9;

      unint64_t v12 = *(void *)(v13 + 16);
      unint64_t v11 = *(void *)(v13 + 24);
      if (v12 >= v11 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1);
      }
      ++v5;
      *(void *)(v13 + 16) = v12 + 1;
      *(void *)(v13 + 8 * v12 + 32) = v10;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v6;
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall MKGradientPolylineRenderer.setColors(_:locations:)(Swift::OpaquePointer _, Swift::OpaquePointer locations)
{
  uint64_t v3 = *((void *)locations._rawValue + 2);
  if (v3)
  {
    specialized ContiguousArray.reserveCapacity(_:)();
    uint64_t v5 = (double *)((char *)locations._rawValue + 32);
    do
    {
      double v6 = *v5++;
      [objc_allocWithZone(NSNumber) initWithDouble:v6];
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      --v3;
    }
    while (v3);
  }
  type metadata accessor for NSNumber(0, &lazy cache variable for type metadata for UIColor);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  type metadata accessor for NSNumber(0, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  Class v8 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v2 setColors:isa atLocations:v8];
}

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  __n128 result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t type metadata accessor for NSNumber(uint64_t a1, unint64_t *a2)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CGFloat>);
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
  uint64_t v13 = v10 + 32;
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
  swift_release();
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

id one-time initialization function for MKCoordinateSpanInNSValueObjCType()
{
  id v0 = [self valueWithMKCoordinateSpan:0.0, 0.0];
  id v1 = [v0 objCType];
  id result = v0;
  MKCoordinateSpanInNSValueObjCType = (uint64_t)v1;
  return result;
}

NSValue __swiftcall MKCoordinateSpan._bridgeToObjectiveC()()
{
  id v2 = [self valueWithMKCoordinateSpan:v0, v1];

  return (NSValue)v2;
}

id static MKCoordinateSpan._forceBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = (const char *)[v3 objCType];
  if (one-time initialization token for MKCoordinateSpanInNSValueObjCType != -1) {
    swift_once();
  }
  id result = (id)strcmp(v4, (const char *)MKCoordinateSpanInNSValueObjCType);
  if (result)
  {
    __break(1u);
  }
  else
  {
    id result = [v3 MKCoordinateSpanValue];
    *(void *)a2 = v6;
    *(void *)(a2 + 8) = v7;
    *(unsigned char *)(a2 + 16) = 0;
  }
  return result;
}

BOOL static MKCoordinateSpan._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = (const char *)[v3 objCType];
  if (one-time initialization token for MKCoordinateSpanInNSValueObjCType != -1) {
    swift_once();
  }
  int v5 = strcmp(v4, (const char *)MKCoordinateSpanInNSValueObjCType);
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  if (!v5) {
    [v3 MKCoordinateSpanValue:0.0, 0.0];
  }
  BOOL result = v5 == 0;
  *(void *)a2 = v6;
  *(void *)(a2 + 8) = v7;
  *(unsigned char *)(a2 + 16) = v5 != 0;
  return result;
}

id static MKCoordinateSpan._unconditionallyBridgeFromObjectiveC(_:)(id result)
{
  if (!result) {
    goto LABEL_9;
  }
  id v1 = result;
  id v2 = (const char *)[v1 objCType];
  if (one-time initialization token for MKCoordinateSpanInNSValueObjCType != -1) {
    swift_once();
  }
  BOOL result = (id)strcmp(v2, (const char *)MKCoordinateSpanInNSValueObjCType);
  if (result)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    return result;
  }

  return [v1 MKCoordinateSpanValue];
}

id protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance MKCoordinateSpan()
{
  id v1 = [self valueWithMKCoordinateSpan:*v0, v0[1]];

  return v1;
}

id protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance MKCoordinateSpan(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = (const char *)[v3 objCType];
  if (one-time initialization token for MKCoordinateSpanInNSValueObjCType != -1) {
    swift_once();
  }
  id result = (id)strcmp(v4, (const char *)MKCoordinateSpanInNSValueObjCType);
  if (result)
  {
    __break(1u);
  }
  else
  {
    id result = [v3 MKCoordinateSpanValue];
    *(void *)a2 = v6;
    *(void *)(a2 + 8) = v7;
    *(unsigned char *)(a2 + 16) = 0;
  }
  return result;
}

BOOL protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance MKCoordinateSpan(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = (const char *)[v3 objCType];
  if (one-time initialization token for MKCoordinateSpanInNSValueObjCType != -1) {
    swift_once();
  }
  int v5 = strcmp(v4, (const char *)MKCoordinateSpanInNSValueObjCType);
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  if (!v5) {
    [v3 MKCoordinateSpanValue:0.0, 0.0];
  }
  BOOL result = v5 == 0;
  *(void *)a2 = v6;
  *(void *)(a2 + 8) = v7;
  *(unsigned char *)(a2 + 16) = v5 != 0;
  return result;
}

id protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance MKCoordinateSpan@<X0>(id result@<X0>, void *a2@<X8>)
{
  if (result)
  {
    id v3 = result;
    uint64_t v4 = (const char *)[v3 objCType];
    if (one-time initialization token for MKCoordinateSpanInNSValueObjCType != -1) {
      swift_once();
    }
    BOOL result = (id)strcmp(v4, (const char *)MKCoordinateSpanInNSValueObjCType);
    if (!result)
    {
      BOOL result = [v3 MKCoordinateSpanValue];
      *a2 = v5;
      a2[1] = v6;
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

id static MKMapItemDetailSelectionAccessoryPresentationStyle.automatic(presentationViewController:)(uint64_t a1)
{
  id v1 = [self sel_automaticWithPresentationViewController_:a1];

  return v1;
}

id static MKMapItemDetailSelectionAccessoryPresentationStyle.callout(_:)(uint64_t a1)
{
  id v1 = [self calloutWithCalloutStyle:a1];

  return v1;
}

char *MKMultiPoint.locations(at:)@<X0>(NSIndexSet *a1@<X8>)
{
  id v2 = v1;
  IndexSet._bridgeToObjectiveC()(a1);
  uint64_t v4 = v3;
  id v5 = [v2 locationsAtPointIndexes:v3];

  type metadata accessor for NSNumber();
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v6 >> 62))
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v7) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v7) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v17 = MEMORY[0x263F8EE78];
  BOOL result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v7 & ~(v7 >> 63), 0);
  if ((v7 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = 0;
    uint64_t v10 = v17;
    do
    {
      if ((v6 & 0xC000000000000001) != 0) {
        id v11 = (id)MEMORY[0x2166C8010](v9, v6);
      }
      else {
        id v11 = *(id *)(v6 + 8 * v9 + 32);
      }
      uint64_t v12 = v11;
      [v11 sel_doubleValue];
      uint64_t v14 = v13;

      unint64_t v16 = *(void *)(v17 + 16);
      unint64_t v15 = *(void *)(v17 + 24);
      if (v16 >= v15 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v15 > 1), v16 + 1, 1);
      }
      ++v9;
      *(void *)(v17 + 16) = v16 + 1;
      *(void *)(v17 + 8 * v16 + 32) = v14;
    }
    while (v7 != v9);
    swift_bridgeObjectRelease();
    return (char *)v10;
  }
  __break(1u);
  return result;
}

unint64_t type metadata accessor for NSNumber()
{
  unint64_t result = lazy cache variable for type metadata for NSNumber;
  if (!lazy cache variable for type metadata for NSNumber)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  }
  return result;
}

void __swiftcall IndexSet._bridgeToObjectiveC()(NSIndexSet *__return_ptr retstr)
{
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return MEMORY[0x270F9DB00]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B88]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x270F9F080]();
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
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

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}