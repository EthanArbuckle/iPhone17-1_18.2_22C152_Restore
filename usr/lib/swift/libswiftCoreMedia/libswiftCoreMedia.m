uint64_t CMClockRef.time.getter()
{
  return CMClockRef.time.getter(MEMORY[0x1E4F1EA70]);
}

CMClockRef static CMClockRef.hostTimeClock.getter()
{
  CMClockRef HostTimeClock = CMClockGetHostTimeClock();

  return HostTimeClock;
}

uint64_t CMClockRef.time.getter(void (*a1)(uint64_t *__return_ptr, uint64_t))
{
  a1(&v3, v1);
  return v3;
}

Float64 CMTime.seconds.getter(CMTimeValue a1, uint64_t a2, CMTimeEpoch a3)
{
  time.value = a1;
  *(void *)&time.timescale = a2;
  time.epoch = a3;
  return CMTimeGetSeconds(&time);
}

CMTime __swiftcall CMTime.init(seconds:preferredTimescale:)(Swift::Double seconds, Swift::Int32 preferredTimescale)
{
  CMTimeMakeWithSeconds(&v5, seconds, preferredTimescale);
  CMTimeValue value = v5.value;
  uint64_t v3 = *(void *)&v5.timescale;
  CMTimeEpoch epoch = v5.epoch;
  result.CMTimeEpoch epoch = epoch;
  result.timescale = v3;
  result.flags = HIDWORD(v3);
  result.CMTimeValue value = value;
  return result;
}

BOOL static CMTime.== infix(_:_:)(CMTimeValue a1, uint64_t a2, CMTimeEpoch a3, CMTimeValue a4, uint64_t a5, CMTimeEpoch a6)
{
  v7.CMTimeEpoch epoch = a6;
  time1.CMTimeValue value = a1;
  *(void *)&time1.timescale = a2;
  time1.CMTimeEpoch epoch = a3;
  v7.CMTimeValue value = a4;
  *(void *)&v7.timescale = a5;
  return CMTimeCompare(&time1, &v7) == 0;
}

uint64_t one-time initialization function for tlsKey()
{
  v1[1] = *MEMORY[0x1E4F143B8];
  v1[0] = 0;
  uint64_t result = pthread_key_create(v1, 0);
  static BoxedError.tlsKey = v1[0];
  return result;
}

uint64_t BoxedError.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 24, 7);
}

uint64_t _CMObjectiveCBridgeableWithRawValue<>.hash(into:)()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v1 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1F4188790]();
  uint64_t v3 = (char *)&v5 - v2;
  dispatch thunk of RawRepresentable.rawValue.getter();
  dispatch thunk of Hashable.hash(into:)();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, AssociatedTypeWitness);
}

uint64_t _CMObjectiveCBridgeableWithRawValue<>._bridgeToObjectiveC()()
{
  dispatch thunk of RawRepresentable.rawValue.getter();
  return v1;
}

{
  uint64_t AssociatedTypeWitness;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v1 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1F4188790](AssociatedTypeWitness);
  uint64_t v3 = (char *)&v6 - v2;
  dispatch thunk of RawRepresentable.rawValue.getter();
  v4 = dispatch thunk of _ObjectiveCBridgeable._bridgeToObjectiveC()();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, AssociatedTypeWitness);
  return v4;
}

uint64_t static _CMObjectiveCBridgeableWithRawValue<>._forceBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Optional();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a2, v4);
  id v5 = a1;
  return dispatch thunk of RawRepresentable.init(rawValue:)();
}

uint64_t static _CMObjectiveCBridgeableWithRawValue<>._conditionallyBridgeFromObjectiveC(_:result:)(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Optional();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a2, v4);
  id v5 = a1;
  dispatch thunk of RawRepresentable.init(rawValue:)();
  return 1;
}

uint64_t static _CMObjectiveCBridgeableWithRawValue<>._unconditionallyBridgeFromObjectiveC(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  type metadata accessor for Optional();
  uint64_t v8 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  v12 = (char *)&v16 - v11;
  if (a1)
  {
    uint64_t v17 = (uint64_t)a1;
    v10 = *(char **)(a3 + 16);
    id v13 = a1;
    dispatch thunk of RawRepresentable.init(rawValue:)();
    uint64_t v14 = *(void *)(a2 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, a2) != 1) {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(a4, v12, a2);
    }
    __break(1u);
  }
  uint64_t v17 = MEMORY[0x1C188D3B0](0, 0xE000000000000000);
  dispatch thunk of RawRepresentable.init(rawValue:)();
  uint64_t v14 = *(void *)(a2 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v10, 1, a2);
  v12 = v10;
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(a4, v12, a2);
  }
  __break(1u);
  return result;
}

uint64_t static _CMObjectiveCBridgeableWithRawValue<>._forceBridgeFromObjectiveC(_:result:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v17[1] = a5;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = type metadata accessor for Optional();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  id v13 = (char *)v17 - v12;
  uint64_t v14 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))((char *)v17 - v12, 1, 1, AssociatedTypeWitness);
  dispatch thunk of static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:)();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v11, 1, AssociatedTypeWitness);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v16 = type metadata accessor for Optional();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a2, v16);
    dispatch thunk of RawRepresentable.init(rawValue:)();
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  }
  return result;
}

uint64_t static _CMObjectiveCBridgeableWithRawValue<>._conditionallyBridgeFromObjectiveC(_:result:)(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = type metadata accessor for Optional();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v14 - v8;
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))((char *)&v14 - v8, 1, 1, AssociatedTypeWitness);
  char v11 = dispatch thunk of static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:)();
  if ((v11 & 1) == 0) {
    goto LABEL_4;
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, AssociatedTypeWitness);
  if (result != 1)
  {
    uint64_t v13 = type metadata accessor for Optional();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v15, v13);
    dispatch thunk of RawRepresentable.init(rawValue:)();
LABEL_4:
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
    return v11 & 1;
  }
  __break(1u);
  return result;
}

uint64_t static _CMObjectiveCBridgeableWithRawValue<>._unconditionallyBridgeFromObjectiveC(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x1F4188790](AssociatedTypeWitness);
  uint64_t v5 = type metadata accessor for Optional();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v10 - v6;
  dispatch thunk of static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:)();
  dispatch thunk of RawRepresentable.init(rawValue:)();
  uint64_t v8 = *(void *)(a1 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v7, 1, a1);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(a2, v7, a1);
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for BoxedError()
{
  return self;
}

void type metadata accessor for CFComparisonResult(uint64_t a1)
{
}

__n128 __swift_memcpy24_4(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for CMTime(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CMTime(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

void type metadata accessor for CMTime(uint64_t a1)
{
}

void type metadata accessor for CMTagCategory(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for CMTimeRange(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy48_4(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for CMTimeRange(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CMTimeRange(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 48) = v3;
  return result;
}

void type metadata accessor for CMTimeRange(uint64_t a1)
{
}

void type metadata accessor for CMSimpleQueueRef(uint64_t a1)
{
}

void type metadata accessor for CFStringRef(uint64_t a1)
{
}

void type metadata accessor for CMBufferQueueRef(uint64_t a1)
{
}

void type metadata accessor for CMStereoViewInterpretationOptions(uint64_t a1)
{
}

void type metadata accessor for CMStereoViewComponents(uint64_t a1)
{
}

void type metadata accessor for CMProjectionType(uint64_t a1)
{
}

void type metadata accessor for CMPackingType(uint64_t a1)
{
}

void type metadata accessor for CMFormatDescriptionRef(uint64_t a1)
{
}

__n128 __swift_memcpy72_4(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for CMSampleTimingInfo(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 72)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CMSampleTimingInfo(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 72) = v3;
  return result;
}

void type metadata accessor for CMSampleTimingInfo(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AudioStreamPacketDescription(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AudioStreamPacketDescription(uint64_t result, int a2, int a3)
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

void type metadata accessor for AudioStreamPacketDescription(uint64_t a1)
{
}

void type metadata accessor for CMBlockBufferRef(uint64_t a1)
{
}

void type metadata accessor for CMSampleBufferRef(uint64_t a1)
{
}

void type metadata accessor for CMTagCollectionRef(uint64_t a1)
{
}

void type metadata accessor for CVBufferRef(uint64_t a1)
{
}

void type metadata accessor for CMTimebaseRef(uint64_t a1)
{
}

void type metadata accessor for CMClockRef(uint64_t a1)
{
}

uint64_t closure #1 in CMBufferQueueResetWithHandler(queue:execute:rescue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = a1;
  v8[3] = a2;
  v8[4] = a3;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = partial apply for closure #1 in closure #1 in CMBufferQueueResetWithHandler(queue:execute:rescue:);
  *(void *)(v9 + 24) = v8;
  v13[0] = partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ();
  v13[1] = v9;
  swift_retain();
  swift_retain();
  int v10 = MEMORY[0x1C188DCA0](a4, @objc callClosureFromRefconCMBuffer(_:_:), v13);
  if (v10 != noErr.getter())
  {
    id v11 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v11 initWithDomain:*MEMORY[0x1E4F28760] code:v10 userInfo:0];
    swift_willThrow();
  }
  return swift_release();
}

uint64_t closure #1 in closure #1 in CMBufferQueueResetWithHandler(queue:execute:rescue:)(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t @objc callClosureFromRefconCMBuffer(_:_:)(uint64_t result, void (**a2)(uint64_t *))
{
  if (a2)
  {
    uint64_t v2 = *a2;
    uint64_t v3 = result;
    swift_unknownObjectRetain();
    swift_retain();
    v2(&v3);
    swift_unknownObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance CFStringRef()
{
  return _CFObject.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance CFStringRef()
{
  return _CFObject.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CFStringRef()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance CFStringRef()
{
  swift_getWitnessTable();

  return static _CFObject.== infix(_:_:)();
}

uint64_t base witness table accessor for Hashable in CFStringRef()
{
  return lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, type metadata accessor for CFStringRef);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CMTagCategory()
{
  Swift::UInt32 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance CMTagCategory()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CMTagCategory()
{
  Swift::UInt32 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

_DWORD *protocol witness for OptionSet.init(rawValue:) in conformance CMTimeFlags@<X0>(_DWORD *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void protocol witness for SetAlgebra.init() in conformance CMTimeFlags(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

_DWORD *protocol witness for SetAlgebra.union(_:) in conformance CMTimeFlags@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.intersection(_:) in conformance CMTimeFlags@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.symmetricDifference(_:) in conformance CMTimeFlags@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL protocol witness for SetAlgebra.insert(_:) in conformance CMTimeFlags(_DWORD *a1, int *a2)
{
  int v3 = *a2;
  int v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

_DWORD *protocol witness for SetAlgebra.remove(_:) in conformance CMTimeFlags@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  int v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(_DWORD *)a2 = v3;
  *(unsigned char *)(a2 + 4) = v3 == 0;
  return result;
}

int *protocol witness for SetAlgebra.update(with:) in conformance CMTimeFlags@<X0>(int *result@<X0>, uint64_t a2@<X8>)
{
  int v3 = *result;
  int v4 = *v2;
  *v2 |= *result;
  int v5 = v4 & v3;
  *(_DWORD *)a2 = v5;
  *(unsigned char *)(a2 + 4) = v5 == 0;
  return result;
}

_DWORD *protocol witness for SetAlgebra.formUnion(_:) in conformance CMTimeFlags(_DWORD *result)
{
  *v1 |= *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.formIntersection(_:) in conformance CMTimeFlags(_DWORD *result)
{
  *v1 &= *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance CMTimeFlags(_DWORD *result)
{
  *v1 ^= *result;
  return result;
}

_DWORD *protocol witness for SetAlgebra.subtracting(_:) in conformance CMTimeFlags@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL protocol witness for SetAlgebra.isSubset(of:) in conformance CMTimeFlags(_DWORD *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL protocol witness for SetAlgebra.isDisjoint(with:) in conformance CMTimeFlags(_DWORD *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL protocol witness for SetAlgebra.isSuperset(of:) in conformance CMTimeFlags(_DWORD *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL protocol witness for SetAlgebra.isEmpty.getter in conformance CMTimeFlags()
{
  return *v0 == 0;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance CMTimeFlags(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x1F4184B08](a1, a4, a2, a5, a3);
}

_DWORD *protocol witness for SetAlgebra.subtract(_:) in conformance CMTimeFlags(_DWORD *result)
{
  *v1 &= ~*result;
  return result;
}

_DWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance CMTimeFlags@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance CMTimeFlags(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t base witness table accessor for Equatable in CMTagCategory()
{
  return lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CMTagCategory and conformance CMTagCategory, type metadata accessor for CMTagCategory);
}

uint64_t lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t base witness table accessor for Equatable in CFStringRef()
{
  return lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef, type metadata accessor for CFStringRef);
}

uint64_t sub_1BE1FA20C()
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t partial apply for closure #1 in closure #1 in CMBufferQueueResetWithHandler(queue:execute:rescue:)(uint64_t a1)
{
  return closure #1 in closure #1 in CMBufferQueueResetWithHandler(queue:execute:rescue:)(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_1BE1FA258()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ()(void *a1)
{
  return thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ()(a1, *(uint64_t (**)(void))(v1 + 16));
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CMTimeFlags(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

void type metadata accessor for CMTag(uint64_t a1)
{
}

__n128 __swift_memcpy68_4(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for CMBufferCallbacks(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 68)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 28);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CMBufferCallbacks(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_DWORD *)(result + 64) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 68) = 1;
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
      *(void *)(result + 28) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 68) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for CMBufferCallbacks(uint64_t a1)
{
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

void type metadata accessor for AudioFormatListItem(uint64_t a1)
{
}

void type metadata accessor for CMTimeFlags(uint64_t a1)
{
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance CMTimeFlags@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  int v3 = specialized SetAlgebra<>.init(arrayLiteral:)(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t base witness table accessor for Equatable in CMTimeFlags()
{
  return lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CMTimeFlags and conformance CMTimeFlags, type metadata accessor for CMTimeFlags);
}

uint64_t base witness table accessor for ExpressibleByArrayLiteral in CMTimeFlags()
{
  return lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CMTimeFlags and conformance CMTimeFlags, type metadata accessor for CMTimeFlags);
}

uint64_t base witness table accessor for RawRepresentable in CMTimeFlags()
{
  return lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CMTimeFlags and conformance CMTimeFlags, type metadata accessor for CMTimeFlags);
}

uint64_t base witness table accessor for SetAlgebra in CMTimeFlags()
{
  return lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef(&lazy protocol witness table cache variable for type CMTimeFlags and conformance CMTimeFlags, type metadata accessor for CMTimeFlags);
}

void type metadata accessor for CMTagDataType(uint64_t a1)
{
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

uint64_t getEnumTagSinglePayload for AudioStreamBasicDescription(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AudioStreamBasicDescription(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 40) = v3;
  return result;
}

void type metadata accessor for AudioStreamBasicDescription(uint64_t a1)
{
}

void type metadata accessor for CFComparisonResult(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

id one-time initialization function for missingRequiredParameter()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 sel_initWithDomain_code_userInfo_:*MEMORY[0x1E4F28760] code:-12745 userInfo:0];
  static CMClockRef.Error.missingRequiredParameter = (uint64_t)result;
  return result;
}

{
  id v0;
  id result;

  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 init:MEMORY[0x1E4F28760] code:-12748 userInfo:0];
  static CMTimebaseRef.Error.missingRequiredParameter = (uint64_t)result;
  return result;
}

{
  id v0;
  id result;

  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:MEMORY[0x1E4F28760] code:-12752 userInfo:nil];
  static CMSync.Error.missingRequiredParameter = (uint64_t)result;
  return result;
}

id static CMClockRef.Error.missingRequiredParameter.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for missingRequiredParameter, (void **)&static CMClockRef.Error.missingRequiredParameter);
}

id one-time initialization function for invalidParameter()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:*MEMORY[0x1E4F28760] code:-12746 userInfo:0];
  static CMClockRef.Error.invalidParameter = (uint64_t)result;
  return result;
}

{
  id v0;
  id result;

  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:*MEMORY[0x1E4F28760] code:-12749 userInfo:0];
  static CMTimebaseRef.Error.invalidParameter = (uint64_t)result;
  return result;
}

{
  id v0;
  id result;

  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 sel_initWithDomain_code_userInfo_:MEMORY[0x1E4F28760] code:-12753 userInfo:0];
  static CMSync.Error.invalidParameter = (uint64_t)result;
  return result;
}

{
  id v0;
  id result;

  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:*MEMORY[0x1E4F28760] code:-12710 userInfo:0];
  static CMFormatDescriptionRef.Error.invalidParameter = (uint64_t)result;
  return result;
}

id static CMClockRef.Error.invalidParameter.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for invalidParameter, (void **)&static CMClockRef.Error.invalidParameter);
}

id one-time initialization function for allocationFailed()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:*MEMORY[0x1E4F28760] code:-12747 userInfo:0];
  static CMClockRef.Error.allocationFailed = (uint64_t)result;
  return result;
}

{
  id v0;
  id result;

  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 sel_initWithDomain_code_userInfo_:*MEMORY[0x1E4F28760] code:-12750 userInfo:0];
  static CMTimebaseRef.Error.allocationFailed = (uint64_t)result;
  return result;
}

{
  id v0;
  id result;

  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 init:*MEMORY[0x1E4F28760] code:-12754 userInfo:0];
  static CMSync.Error.allocationFailed = (uint64_t)result;
  return result;
}

{
  id v0;
  id result;

  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:MEMORY[0x1E4F28760] code:-12770 userInfo:0];
  static CMSimpleQueueRef.Error.allocationFailed = (uint64_t)result;
  return result;
}

{
  id v0;
  id result;

  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 init:*MEMORY[0x1E4F28760] code:-12730 userInfo:0];
  static CMSampleBufferRef.Error.allocationFailed = (uint64_t)result;
  return result;
}

{
  id v0;
  id result;

  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 sel_initWithDomain_code_userInfo_:*MEMORY[0x1E4F28760] code:-12760 userInfo:0];
  static CMBufferQueueRef.Error.allocationFailed = (uint64_t)result;
  return result;
}

{
  id v0;
  id result;

  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 sel_initWithDomain_code_userInfo_:*MEMORY[0x1E4F28760] code:-12711 userInfo:0];
  static CMFormatDescriptionRef.Error.allocationFailed = (uint64_t)result;
  return result;
}

id static CMClockRef.Error.allocationFailed.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for allocationFailed, (void **)&static CMClockRef.Error.allocationFailed);
}

id one-time initialization function for unsupportedOperation()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:*MEMORY[0x1E4F28760] code:-12756 userInfo:0];
  static CMClockRef.Error.unsupportedOperation = (uint64_t)result;
  return result;
}

id static CMClockRef.Error.unsupportedOperation.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for unsupportedOperation, (void **)&static CMClockRef.Error.unsupportedOperation);
}

id static CMTimebaseRef.Error.missingRequiredParameter.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for missingRequiredParameter, (void **)&static CMTimebaseRef.Error.missingRequiredParameter);
}

id static CMTimebaseRef.Error.invalidParameter.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for invalidParameter, (void **)&static CMTimebaseRef.Error.invalidParameter);
}

id static CMTimebaseRef.Error.allocationFailed.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for allocationFailed, (void **)&static CMTimebaseRef.Error.allocationFailed);
}

id one-time initialization function for timerIntervalTooShort()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:*MEMORY[0x1E4F28760] code:-12751 userInfo:0];
  static CMTimebaseRef.Error.timerIntervalTooShort = (uint64_t)result;
  return result;
}

id static CMTimebaseRef.Error.timerIntervalTooShort.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for timerIntervalTooShort, (void **)&static CMTimebaseRef.Error.timerIntervalTooShort);
}

id one-time initialization function for readOnly()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:*MEMORY[0x1E4F28760] code:-12757 userInfo:0];
  static CMTimebaseRef.Error.readOnly = (uint64_t)result;
  return result;
}

id static CMTimebaseRef.Error.readOnly.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for readOnly, (void **)&static CMTimebaseRef.Error.readOnly);
}

id static CMSync.Error.missingRequiredParameter.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for missingRequiredParameter, (void **)&static CMSync.Error.missingRequiredParameter);
}

id static CMSync.Error.invalidParameter.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for invalidParameter, (void **)&static CMSync.Error.invalidParameter);
}

id static CMSync.Error.allocationFailed.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for allocationFailed, (void **)&static CMSync.Error.allocationFailed);
}

id one-time initialization function for rateMustBeNonZero()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 sel_initWithDomain_code_userInfo_:*MEMORY[0x1E4F28760] code:-12755];
  static CMSync.Error.rateMustBeNonZero = (uint64_t)result;
  return result;
}

id static CMSync.Error.rateMustBeNonZero.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for rateMustBeNonZero, (void **)&static CMSync.Error.rateMustBeNonZero);
}

id static CMClockRef.Error.missingRequiredParameter.getter(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  char v3 = *a2;

  return v3;
}

uint64_t static CMClockRef.convertHostTimeToSystemUnits(_:)(CMTimeValue a1, uint64_t a2, CMTimeEpoch a3)
{
  hostTime.CMTimeValue value = a1;
  *(void *)&hostTime.timescale = a2;
  hostTime.CMTimeEpoch epoch = a3;
  return CMClockConvertHostTimeToSystemUnits(&hostTime);
}

CMTimeValue static CMClockRef.convertSystemUnitsToHostTime(_:)(uint64_t a1)
{
  CMClockMakeHostTimeFromSystemUnits(&v2, a1);
  return v2.value;
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMClockRef.anchorTime()(Swift::tuple_anchorTime_CMTime_referenceTime_CMTime *__return_ptr retstr)
{
  CMTime v2 = v1;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  memset(&clockTimeOut, 0, sizeof(clockTimeOut));
  memset(&referenceClockTimeOut, 0, sizeof(referenceClockTimeOut));
  OSStatus AnchorTime = CMClockGetAnchorTime(v2, &clockTimeOut, &referenceClockTimeOut);
  if (AnchorTime == noErr.getter())
  {
    CMTimeEpoch epoch = referenceClockTimeOut.epoch;
    CMTimeEpoch v6 = clockTimeOut.epoch;
    CMTimeValue value = referenceClockTimeOut.value;
    uint64_t v8 = *(void *)&referenceClockTimeOut.timescale;
    uint64_t v9 = *(void *)&clockTimeOut.timescale;
    retstr->anchorTime.CMTimeValue value = clockTimeOut.value;
    *(void *)&retstr->anchorTime.timescale = v9;
    retstr->anchorTime.CMTimeEpoch epoch = v6;
    retstr->referenceTime.CMTimeValue value = value;
    *(void *)&retstr->referenceTime.timescale = v8;
    retstr->referenceTime.CMTimeEpoch epoch = epoch;
  }
  else
  {
    id v10 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v10 initWithDomain:*MEMORY[0x1E4F28760] code:AnchorTime userInfo:0];
    swift_willThrow();
  }
}

Swift::Bool __swiftcall CMClockRef.mightDrift(relativeTo:)(CMClockRef relativeTo)
{
  return CMClockMightDrift(v1, relativeTo) != 0;
}

Swift::Void __swiftcall CMClockRef.invalidate()()
{
  CMClockInvalidate(v0);
}

void _CMTimebaseInitTrampoline.init(sourceClock:)(void *a1, uint64_t a2, uint64_t a3)
{
}

void _CMTimebaseInitTrampoline.init(masterClock:)(void *a1, uint64_t a2, uint64_t a3)
{
}

void _CMTimebaseInitTrampoline.init(sourceTimebase:)(void *a1, uint64_t a2, uint64_t a3)
{
}

void _CMTimebaseInitTrampoline.init(masterTimebase:)(void *a1, uint64_t a2, uint64_t a3)
{
}

void _CMTimebaseInitTrampoline.init(sourceClock:)(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void, void *, void *))
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v11[0] = 0;
  int v6 = a4(*MEMORY[0x1E4F1CF80], a1, v11);
  uint64_t v7 = (void *)v11[0];
  if (v6 != noErr.getter())
  {
    id v10 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v10 initWithDomain:*MEMORY[0x1E4F28760] code:v6 userInfo:0];
    swift_willThrow();

    goto LABEL_5;
  }
  if (v7)
  {
    uint64_t v8 = *(void (**)(void))(a3 + 8);
    id v9 = v7;
    v8();

LABEL_5:
    return;
  }
  __break(1u);
}

void protocol witness for _CMTimebaseInitTrampoline.init(referencing:) in conformance CMTimebaseRef(void *a1@<X0>, void *a2@<X8>)
{
  CFTypeRef v4 = CMTimebaseRetain(a1);

  *a2 = v4;
}

CMTimebaseRef CMTimebaseRef.masterTimebase.getter()
{
  return CMTimebaseCopySourceTimebase(v0);
}

CMClockRef CMTimebaseRef.masterClock.getter()
{
  return CMTimebaseCopySourceClock(v0);
}

uint64_t CMTimebaseRef.source.getter@<X0>(uint64_t *a1@<X8>)
{
  return CMTimebaseRef.source.getter(a1);
}

{
  OpaqueCMTimebase *v1;
  OpaqueCMTimebase *v2;
  CMClockOrTimebaseRef v4;
  CFTypeID v5;
  uint64_t v6;
  uint64_t v7;
  _UNKNOWN **v8;
  CFTypeID v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  Swift::String v13;
  Swift::String v14;

  CMTime v2 = v1;
  CFTypeRef v4 = CMTimebaseCopySource(v2);
  int v5 = CFGetTypeID(v4);
  if (v5 == CMTimebaseGetTypeID())
  {
    type metadata accessor for CMTimebaseRef(0);
    uint64_t v7 = v6;
    uint64_t v8 = &protocol witness table for CMTimebaseRef;
LABEL_5:
    swift_unknownObjectRetain();
    id v11 = swift_dynamicCastUnknownClassUnconditional();
    a1[3] = v7;
    a1[4] = (uint64_t)v8;
    id result = swift_unknownObjectRelease();
    *a1 = v11;
    return result;
  }
  id v9 = CFGetTypeID(v4);
  if (v9 == CMClockGetTypeID())
  {
    type metadata accessor for CMClockRef(0);
    uint64_t v7 = v10;
    uint64_t v8 = &protocol witness table for CMClockRef;
    goto LABEL_5;
  }
  _StringGuts.grow(_:)(59);
  v13._object = (void *)0x80000001BE227F20;
  v13._countAndFlagsBits = 0xD000000000000016;
  String.append(_:)(v13);
  _print_unlocked<A, B>(_:_:)();
  v14._countAndFlagsBits = 0xD000000000000023;
  v14._object = (void *)0x80000001BE227F40;
  String.append(_:)(v14);
  id result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t CMTimebaseRef.source.setter(void *a1)
{
  return CMTimebaseRef.source.setter(a1);
}

{
  OpaqueCMTimebase *v1;
  OpaqueCMTimebase *v2;
  const void *v4;
  CFTypeID v5;
  OpaqueCMTimebase *v6;
  CFTypeID v7;
  uint64_t result;
  Swift::String v9;
  Swift::String v10;
  OpaqueCMTimebase *newSourceTimebase;
  unsigned char v12[40];

  CMTime v2 = v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  CFTypeRef v4 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
  int v5 = CFGetTypeID(v4);
  if (v5 == CMTimebaseGetTypeID())
  {
    outlined init with copy of CMSyncProtocol((uint64_t)a1, (uint64_t)v12);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CMSyncProtocol);
    type metadata accessor for CMTimebaseRef(0);
    swift_dynamicCast();
    int v6 = newSourceTimebase;
    CMTimebaseSetSourceTimebase(v2, newSourceTimebase);
LABEL_5:

    swift_unknownObjectRelease();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v7 = CFGetTypeID(v4);
  if (v7 == CMClockGetTypeID())
  {
    outlined init with copy of CMSyncProtocol((uint64_t)a1, (uint64_t)v12);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CMSyncProtocol);
    type metadata accessor for CMClockRef(0);
    swift_dynamicCast();
    int v6 = newSourceTimebase;
    CMTimebaseSetSourceClock(v2, newSourceTimebase);
    goto LABEL_5;
  }
  outlined init with copy of CMSyncProtocol((uint64_t)a1, (uint64_t)v12);
  _StringGuts.grow(_:)(59);
  v9._object = (void *)0x80000001BE227F20;
  v9._countAndFlagsBits = 0xD000000000000016;
  String.append(_:)(v9);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CMSyncProtocol);
  _print_unlocked<A, B>(_:_:)();
  v10._countAndFlagsBits = 0xD000000000000023;
  v10._object = (void *)0x80000001BE227F40;
  String.append(_:)(v10);
  id result = _assertionFailure(_:_:file:line:flags:)();
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

uint64_t outlined init with copy of CMSyncProtocol(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
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

void (*CMTimebaseRef.source.modify(uint64_t **a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = (uint64_t *)malloc(0x58uLL);
  *a1 = v3;
  v3[10] = v1;
  CMTimebaseRef.source.getter(v3);
  return CMTimebaseRef.source.modify;
}

void CMTimebaseRef.source.modify(uint64_t *a1, char a2)
{
}

uint64_t CMTimebaseRef.master.getter@<X0>(uint64_t *a1@<X8>)
{
  return CMTimebaseRef.source.getter(a1);
}

uint64_t CMTimebaseRef.master.setter(void *a1)
{
  return CMTimebaseRef.source.setter(a1);
}

void (*CMTimebaseRef.master.modify(uint64_t **a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = (uint64_t *)malloc(0x58uLL);
  *a1 = v3;
  v3[10] = v1;
  CMTimebaseRef.master.getter(v3);
  return CMTimebaseRef.master.modify;
}

void CMTimebaseRef.master.modify(uint64_t *a1, char a2)
{
}

void CMTimebaseRef.source.modify(uint64_t *a1, char a2, void (*a3)(char *))
{
  CFTypeRef v4 = (char *)*a1;
  if (a2)
  {
    outlined init with copy of CMSyncProtocol(*a1, (uint64_t)(v4 + 40));
    a3(v4 + 40);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  }
  else
  {
    a3((char *)*a1);
  }

  free(v4);
}

CMClockRef CMTimebaseRef.ultimateMasterClock.getter()
{
  return CMTimebaseCopyUltimateSourceClock(v0);
}

uint64_t CMTimebaseRef.time.getter()
{
  return CMClockRef.time.getter(MEMORY[0x1E4F1EB20]);
}

CMTime __swiftcall CMTimebaseRef.time(withTimescale:rounding:)(Swift::Int32 withTimescale, CMTimeRoundingMethod rounding)
{
  CMTimebaseGetTimeWithTimeScale(&v6, v2, withTimescale, rounding);
  CMTimeValue value = v6.value;
  uint64_t v4 = *(void *)&v6.timescale;
  CMTimeEpoch epoch = v6.epoch;
  result.CMTimeEpoch epoch = epoch;
  result.timescale = v4;
  result.flags = HIDWORD(v4);
  result.CMTimeValue value = value;
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMTimebaseRef.setTime(_:)(CMTime a1)
{
  CMTime time = a1;
  OSStatus v2 = CMTimebaseSetTime(v1, &time);
  if (v2 != noErr.getter())
  {
    id v3 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v3 initWithDomain:*MEMORY[0x1E4F28760] code:v2 userInfo:0];
    swift_willThrow();
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMTimebaseRef.setAnchorTime(_:referenceTime:)(CMTime _, CMTime referenceTime)
{
  CMTime v5 = referenceTime;
  CMTime timebaseTime = _;
  OSStatus v3 = CMTimebaseSetAnchorTime(v2, &timebaseTime, &v5);
  if (v3 != noErr.getter())
  {
    id v4 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v4 initWithDomain:*MEMORY[0x1E4F28760] code:v3 userInfo:0];
    swift_willThrow();
  }
}

double CMTimebaseRef.rate.getter()
{
  return CMTimebaseGetRate(v0);
}

Float64 CMTimebaseRef.timeAndRate.getter()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  memset(&timeOut, 0, sizeof(timeOut));
  Float64 rateOut = 0.0;
  CMTimebaseGetTimeAndRate(v0, &timeOut, &rateOut);
  return rateOut;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMTimebaseRef.setRate(_:)(Swift::Double a1)
{
  OSStatus v2 = CMTimebaseSetRate(v1, a1);
  if (v2 != noErr.getter())
  {
    id v3 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v3 initWithDomain:*MEMORY[0x1E4F28760] code:v2 userInfo:0];
    swift_willThrow();
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMTimebaseRef.setRateAndAnchorTime(rate:anchorTime:referenceTime:)(Swift::Double rate, CMTime anchorTime, CMTime referenceTime)
{
  CMTime v6 = referenceTime;
  CMTime timebaseTime = anchorTime;
  OSStatus v4 = CMTimebaseSetRateAndAnchorTime(v3, rate, &timebaseTime, &v6);
  if (v4 != noErr.getter())
  {
    id v5 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v5 initWithDomain:MEMORY[0x1E4F28760] code:v4 userInfo:0];
    swift_willThrow();
  }
}

double CMTimebaseRef.effectiveRate.getter()
{
  return CMTimebaseGetEffectiveRate(v0);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMTimebaseRef.addTimer(_:on:)(NSTimer _, NSRunLoop on)
{
  OSStatus v4 = (__CFRunLoop *)[(objc_class *)on.super.isa getCFRunLoop];
  OSStatus v5 = CMTimebaseAddTimer(v2, _.super.isa, v4);

  if (v5 != noErr.getter())
  {
    id v6 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v6 initWithDomain:*MEMORY[0x1E4F28760] code:v5 userInfo:0];
    swift_willThrow();
  }
}

double static CMTimebaseRef.veryLongTimeInterval.getter()
{
  return 8073216000.0;
}

double static CMTimebaseRef.farFuture.getter()
{
  return 8073216000.0;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMTimebaseRef.removeTimer(_:)(NSTimer a1)
{
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMTimebaseRef.setTimerNextFireTime(_:fireTime:)(NSTimer _, CMTime fireTime)
{
  CMTime fireTimea = fireTime;
  OSStatus v3 = CMTimebaseSetTimerNextFireTime(v2, _.super.isa, &fireTimea, 0);
  if (v3 != noErr.getter())
  {
    id v4 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v4 initWithDomain:MEMORY[0x1E4F28760] code:v3 userInfo:0];
    swift_willThrow();
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMTimebaseRef.setTimerToFireImmediately(_:)(NSTimer a1)
{
}

uint64_t CMTimebaseRef.removeTimer(_:)(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  int v3 = a2(v2, a1);
  uint64_t result = noErr.getter();
  if (v3 != result)
  {
    id v5 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v5 initWithDomain:MEMORY[0x1E4F28760] code:v3 userInfo:0];
    return swift_willThrow();
  }
  return result;
}

uint64_t CMTimebaseRef.addTimer<A>(_:)(uint64_t a1, uint64_t a2)
{
  return CMTimebaseRef.addTimer<A>(_:)(a1, a2, MEMORY[0x1E4F1EB08]);
}

uint64_t CMTimebaseRef.removeTimer<A>(_:)(uint64_t a1, uint64_t a2)
{
  return CMTimebaseRef.addTimer<A>(_:)(a1, a2, MEMORY[0x1E4F1EB30]);
}

uint64_t CMTimebaseRef.addTimer<A>(_:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  int v4 = closure #1 in CMTimebaseRef.addTimer<A>(_:)(v3, a1, a2, a3);
  uint64_t result = noErr.getter();
  if (v4 != result)
  {
    id v6 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v6 initWithDomain:*MEMORY[0x1E4F28760] code:v4 userInfo:0];
    return swift_willThrow();
  }
  return result;
}

uint64_t CMTimebaseRef.setTimerNextFireTime<A>(_:fireTime:)(uint64_t a1, CMTimeValue a2, unint64_t a3, CMTimeEpoch a4)
{
  int v5 = closure #1 in CMTimebaseRef.setTimerNextFireTime<A>(_:fireTime:)(v4, a1, a2, a3, a4);
  uint64_t result = noErr.getter();
  if (v5 != result)
  {
    id v7 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v7 initWithDomain:*MEMORY[0x1E4F28760] code:v5 userInfo:0];
    return swift_willThrow();
  }
  return result;
}

uint64_t closure #1 in CMTimebaseRef.setTimerNextFireTime<A>(_:fireTime:)(OpaqueCMTimebase *a1, uint64_t a2, CMTimeValue a3, unint64_t a4, CMTimeEpoch a5)
{
  CMTimeScale v6 = a4;
  unint64_t v9 = HIDWORD(a4);
  self;
  id v10 = swift_dynamicCastObjCClassUnconditional();
  fireTime.CMTimeValue value = a3;
  fireTime.timescale = v6;
  fireTime.flags = v9;
  fireTime.CMTimeEpoch epoch = a5;
  return CMTimebaseSetTimerDispatchSourceNextFireTime(a1, v10, &fireTime, 0);
}

uint64_t CMTimebaseRef.setTimerToFireImmediately<A>(_:)(uint64_t a1, uint64_t a2)
{
  return CMTimebaseRef.addTimer<A>(_:)(a1, a2, MEMORY[0x1E4F1EB38]);
}

uint64_t closure #1 in CMTimebaseRef.addTimer<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  self;
  uint64_t v5 = swift_dynamicCastObjCClassUnconditional();

  return a4(a1, v5);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMTimebaseRef.notificationBarrier()()
{
  OSStatus v1 = CMTimebaseNotificationBarrier(v0);
  if (v1 != noErr.getter())
  {
    id v2 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v2 initWithDomain:MEMORY[0x1E4F28760] code:v1 userInfo:0];
    swift_willThrow();
  }
}

id one-time initialization function for effectiveRateChanged()
{
  static CMTimebaseRef.effectiveRateChanged = *MEMORY[0x1E4F1FA58];
  return (id)static CMTimebaseRef.effectiveRateChanged;
}

id static CMTimebaseRef.effectiveRateChanged.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for effectiveRateChanged, (void **)&static CMTimebaseRef.effectiveRateChanged);
}

id one-time initialization function for timeJumped()
{
  static CMTimebaseRef.timeJumped = *MEMORY[0x1E4F1FA68];
  return (id)static CMTimebaseRef.timeJumped;
}

id static CMTimebaseRef.timeJumped.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for timeJumped, (void **)&static CMTimebaseRef.timeJumped);
}

id CMTimebaseRef.NotificationKey.rawValue.getter()
{
  return *v0;
}

void CMTimebaseRef.NotificationKey.rawValue.setter(void *a1)
{
  *OSStatus v1 = a1;
}

uint64_t (*CMTimebaseRef.NotificationKey.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

uint64_t CMTimebaseRef.NotificationKey.init(rawValue:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

id one-time initialization function for eventTime()
{
  static CMTimebaseRef.NotificationKey.eventTime = *MEMORY[0x1E4F1FA50];
  return (id)static CMTimebaseRef.NotificationKey.eventTime;
}

id static CMTimebaseRef.NotificationKey.eventTime.getter@<X0>(void *a1@<X8>)
{
  if (one-time initialization token for eventTime != -1) {
    swift_once();
  }
  id v2 = (void *)static CMTimebaseRef.NotificationKey.eventTime;
  *a1 = static CMTimebaseRef.NotificationKey.eventTime;

  return v2;
}

void *protocol witness for RawRepresentable.init(rawValue:) in conformance CMTimebaseRef.NotificationKey@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

id protocol witness for RawRepresentable.rawValue.getter in conformance CMTimebaseRef.NotificationKey@<X0>(void **a1@<X8>)
{
  id v2 = *v1;
  *a1 = *v1;
  return v2;
}

id protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance CMTimebaseRef.NotificationKey()
{
  return *v0;
}

id protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance CMTimebaseRef.NotificationKey(void *a1, id *a2)
{
  *a2 = a1;

  return a1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance CMTimebaseRef.NotificationKey(void *a1, id *a2)
{
  *a2 = a1;
  id v4 = a1;
  return 1;
}

id protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance CMTimebaseRef.NotificationKey@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  id v2 = (void *)a1;
  if (!a1)
  {
    a1 = MEMORY[0x1C188D3B0](0, 0xE000000000000000);
    id v2 = 0;
  }
  *a2 = a1;

  return v2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CMTimebaseRef.NotificationKey()
{
  OSStatus v1 = *v0;
  Hasher.init(_seed:)();
  type metadata accessor for CFStringRef(0);
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef();
  id v2 = v1;
  _CFObject.hash(into:)();

  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance CMTimebaseRef.NotificationKey()
{
  OSStatus v1 = *v0;
  type metadata accessor for CFStringRef(0);
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef();
  id v2 = v1;
  _CFObject.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CMTimebaseRef.NotificationKey()
{
  OSStatus v1 = *v0;
  Hasher.init(_seed:)();
  type metadata accessor for CFStringRef(0);
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef();
  id v2 = v1;
  _CFObject.hash(into:)();

  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance CMTimebaseRef.NotificationKey(void **a1, void **a2)
{
  id v2 = *a1;
  uint64_t v3 = *a2;
  type metadata accessor for CFStringRef(0);
  lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef();
  id v4 = v2;
  id v5 = v3;
  char v6 = static _CFObject.== infix(_:_:)();

  return v6 & 1;
}

uint64_t CMTimebaseRef.rateAndAnchorTime<A>(relativeTo:)@<X0>(uint64_t a1@<X8>)
{
  return CMTimebaseRef.rateAndAnchorTime<A>(relativeTo:)(a1);
}

{
  const void *v1;
  const void *v2;
  const void *v4;
  OSStatus RelativeRateAndAnchorTime;
  uint64_t result;
  CMTimeValue value;
  CMTimeEpoch epoch;
  CMTimeEpoch v9;
  CMTimeValue v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  CMTime v14;
  CMTime outOfClockOrTimebaseAnchorTime;
  Float64 outRelativeRate[2];

  id v2 = v1;
  outRelativeRate[1] = *(Float64 *)MEMORY[0x1E4F143B8];
  outRelativeRate[0] = 0.0;
  memset(&outOfClockOrTimebaseAnchorTime, 0, sizeof(outOfClockOrTimebaseAnchorTime));
  memset(&v14, 0, sizeof(v14));
  id v4 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
  RelativeRateAndOSStatus AnchorTime = CMSyncGetRelativeRateAndAnchorTime(v2, v4, outRelativeRate, &outOfClockOrTimebaseAnchorTime, &v14);
  swift_unknownObjectRelease();
  uint64_t result = noErr.getter();
  if (RelativeRateAndAnchorTime == result)
  {
    CMTimeEpoch epoch = v14.epoch;
    CMTimeValue value = outOfClockOrTimebaseAnchorTime.value;
    unint64_t v9 = outOfClockOrTimebaseAnchorTime.epoch;
    id v10 = v14.value;
    id v11 = *(void *)&v14.timescale;
    uint64_t v12 = *(void *)&outOfClockOrTimebaseAnchorTime.timescale;
    *(Float64 *)a1 = outRelativeRate[0];
    *(void *)(a1 + 8) = value;
    *(void *)(a1 + 16) = v12;
    *(void *)(a1 + 24) = v9;
    *(void *)(a1 + 32) = v10;
    *(void *)(a1 + 40) = v11;
    *(void *)(a1 + 48) = epoch;
  }
  else
  {
    uint64_t v13 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v13 initWithDomain:*MEMORY[0x1E4F28760] code:RelativeRateAndAnchorTime userInfo:0];
    return swift_willThrow();
  }
  return result;
}

double protocol witness for CMSyncProtocol.rateAndAnchorTime<A>(relativeTo:) in conformance CMTimebaseRef@<D0>(uint64_t a1@<X8>)
{
  return protocol witness for CMSyncProtocol.rateAndAnchorTime<A>(relativeTo:) in conformance CMTimebaseRef((void (*)(void *__return_ptr))CMTimebaseRef.rateAndAnchorTime<A>(relativeTo:), a1);
}

uint64_t protocol witness for CMSyncProtocol.time.getter in conformance CMTimebaseRef(uint64_t a1, uint64_t a2)
{
  return protocol witness for CMSyncProtocol.time.getter in conformance CMTimebaseRef(a1, a2, MEMORY[0x1E4F1EB20]);
}

double CMTimebaseRef.rate<A>(relativeTo:)()
{
  OSStatus v1 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
  double RelativeRate = CMSyncGetRelativeRate(v0, v1);
  swift_unknownObjectRelease();
  return RelativeRate;
}

uint64_t CMClockRef.rateAndAnchorTime<A>(relativeTo:)@<X0>(uint64_t a1@<X8>)
{
  return CMTimebaseRef.rateAndAnchorTime<A>(relativeTo:)(a1);
}

CMTimeValue CMTimebaseRef.convertTime<A>(_:to:)(CMTimeValue a1, unint64_t a2, CMTimeEpoch a3)
{
  CMTimeScale v5 = a2;
  unint64_t v7 = HIDWORD(a2);
  uint64_t v8 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
  time.CMTimeValue value = a1;
  time.timescale = v5;
  time.flags = v7;
  time.CMTimeEpoch epoch = a3;
  CMSyncConvertTime(&v11, &time, v3, v8);
  CMTimeValue value = v11.value;
  swift_unknownObjectRelease();
  return value;
}

BOOL CMTimebaseRef.mightDrift<A>(relativeTo:)()
{
  OSStatus v1 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
  int v2 = CMSyncMightDrift(v0, v1);
  swift_unknownObjectRelease();
  return v2 != 0;
}

unint64_t instantiation function for generic protocol witness table for CMTimebaseRef.NotificationKey(void *a1)
{
  a1[1] = lazy protocol witness table accessor for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey();
  a1[2] = lazy protocol witness table accessor for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey();
  unint64_t result = lazy protocol witness table accessor for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey();
  a1[3] = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey()
{
  unint64_t result = lazy protocol witness table cache variable for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey;
  if (!lazy protocol witness table cache variable for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey;
  if (!lazy protocol witness table cache variable for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey;
  if (!lazy protocol witness table cache variable for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey;
  if (!lazy protocol witness table cache variable for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMTimebaseRef.NotificationKey and conformance CMTimebaseRef.NotificationKey);
  }
  return result;
}

uint64_t protocol witness for CMSyncProtocol.rate<A>(relativeTo:) in conformance CMClockRef()
{
  return CMClockRef.rate<A>(relativeTo:)();
}

double protocol witness for CMSyncProtocol.rateAndAnchorTime<A>(relativeTo:) in conformance CMClockRef@<D0>(uint64_t a1@<X8>)
{
  return protocol witness for CMSyncProtocol.rateAndAnchorTime<A>(relativeTo:) in conformance CMTimebaseRef((void (*)(void *__return_ptr))CMClockRef.rateAndAnchorTime<A>(relativeTo:), a1);
}

double protocol witness for CMSyncProtocol.rateAndAnchorTime<A>(relativeTo:) in conformance CMTimebaseRef@<D0>(void (*a1)(void *__return_ptr)@<X5>, uint64_t a2@<X8>)
{
  a1(v10);
  if (!v2)
  {
    double result = *(double *)v10;
    uint64_t v5 = v10[1];
    uint64_t v6 = v10[2];
    long long v7 = v11;
    uint64_t v8 = v12;
    uint64_t v9 = v13;
    *(void *)a2 = v10[0];
    *(void *)(a2 + 8) = v5;
    *(void *)(a2 + 16) = v6;
    *(_OWORD *)(a2 + 24) = v7;
    *(void *)(a2 + 40) = v8;
    *(void *)(a2 + 48) = v9;
  }
  return result;
}

uint64_t protocol witness for CMSyncProtocol.convertTime<A>(_:to:) in conformance CMClockRef()
{
  return CMClockRef.convertTime<A>(_:to:)();
}

uint64_t protocol witness for CMSyncProtocol.mightDrift<A>(relativeTo:) in conformance CMClockRef()
{
  return CMClockRef.mightDrift<A>(relativeTo:)() & 1;
}

uint64_t protocol witness for CMSyncProtocol.time.getter in conformance CMClockRef(uint64_t a1, uint64_t a2)
{
  return protocol witness for CMSyncProtocol.time.getter in conformance CMTimebaseRef(a1, a2, MEMORY[0x1E4F1EA70]);
}

uint64_t protocol witness for CMSyncProtocol.time.getter in conformance CMTimebaseRef(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr, void))
{
  a3(&v5, *v3);
  return v5;
}

uint64_t sub_1BE1FC978@<X0>(uint64_t *a1@<X8>)
{
  return CMTimebaseRef.source.getter(a1);
}

uint64_t sub_1BE1FC99C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(unsigned char *))CMTimebaseRef.source.setter);
}

uint64_t sub_1BE1FC9B4@<X0>(uint64_t *a1@<X8>)
{
  return CMTimebaseRef.master.getter(a1);
}

uint64_t sub_1BE1FC9D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (uint64_t (*)(unsigned char *))CMTimebaseRef.master.setter);
}

uint64_t keypath_setTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(unsigned char *))
{
  outlined init with copy of CMSyncProtocol(a1, (uint64_t)v7);
  return a5(v7);
}

ValueMetadata *type metadata accessor for CMClockRef.Error()
{
  return &type metadata for CMClockRef.Error;
}

ValueMetadata *type metadata accessor for CMTimebaseRef.Error()
{
  return &type metadata for CMTimebaseRef.Error;
}

ValueMetadata *type metadata accessor for CMSync()
{
  return &type metadata for CMSync;
}

ValueMetadata *type metadata accessor for CMSync.Error()
{
  return &type metadata for CMSync.Error;
}

uint64_t dispatch thunk of _CMTimebaseInitTrampoline.init(referencing:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

ValueMetadata *type metadata accessor for CMTimebaseRef.NotificationKey()
{
  return &type metadata for CMTimebaseRef.NotificationKey;
}

uint64_t dispatch thunk of CMSyncProtocol.rate<A>(relativeTo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of CMSyncProtocol.rateAndAnchorTime<A>(relativeTo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of CMSyncProtocol.convertTime<A>(_:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 24))();
}

uint64_t dispatch thunk of CMSyncProtocol.mightDrift<A>(relativeTo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t dispatch thunk of CMSyncProtocol.time.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

unint64_t lazy protocol witness table accessor for type CFStringRef and conformance CFStringRef()
{
  unint64_t result = lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef;
  if (!lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef)
  {
    type metadata accessor for CFStringRef(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
  }
  return result;
}

uint64_t CMTaggedBuffer.tags.getter()
{
  return swift_bridgeObjectRetain();
}

id CMTaggedBuffer.buffer.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void **)(v1 + 8);
  char v3 = *(unsigned char *)(v1 + 16);
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3;
  return v2;
}

uint64_t CMTaggedBuffer.init(tags:buffer:)@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3 = *a2;
  char v4 = *((unsigned char *)a2 + 8);
  *(void *)a3 = result;
  *(void *)(a3 + 8) = v3;
  *(unsigned char *)(a3 + 16) = v4;
  return result;
}

uint64_t CMTaggedBuffer.init(tags:sampleBuffer:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = result;
  *(void *)(a3 + 8) = a2;
  *(unsigned char *)(a3 + 16) = 0;
  return result;
}

uint64_t CMTaggedBuffer.init(tags:pixelBuffer:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = result;
  *(void *)(a3 + 8) = a2;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

uint64_t CMTaggedBuffer.description.getter()
{
  _StringGuts.grow(_:)(20);
  v0._countAndFlagsBits = 0x203A73676174;
  v0._object = (void *)0xE600000000000000;
  String.append(_:)(v0);
  uint64_t v1 = type metadata accessor for CMTag();
  uint64_t v2 = swift_bridgeObjectRetain();
  v3._countAndFlagsBits = MEMORY[0x1C188D4E0](v2, v1);
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 0x726566667562202CLL;
  v4._object = (void *)0xEA0000000000203ALL;
  String.append(_:)(v4);
  _print_unlocked<A, B>(_:_:)();
  return 0;
}

char *Array<A>.init(taggedBufferGroup:)(OpaqueCMTaggedBufferGroup *a1)
{
  uint64_t v2 = specialized Array<A>.init(taggedBufferGroup:)(a1);

  return v2;
}

uint64_t Array<A>.taggedBufferGroup.getter(uint64_t a1)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v23[0] = 0;
  uint64_t v20 = MEMORY[0x1E4FBC860];
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = (id *)(swift_bridgeObjectRetain() + 48);
    Swift::String v3 = (char *)MEMORY[0x1E4FBC860];
    do
    {
      char v4 = *(unsigned char *)v2;
      id v5 = *(v2 - 1);
      unint64_t v6 = swift_bridgeObjectRetain();
      Array<A>.tagCollection.getter(v6);
      MEMORY[0x1C188D4A0]();
      if (*(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      if (v4) {
        type metadata accessor for CVBufferRef(0);
      }
      else {
        type metadata accessor for CMSampleBufferRef(0);
      }
      uint64_t v22 = v7;
      *(void *)&long long v21 = v5;
      id v8 = v5;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        Swift::String v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v3 + 2) + 1, 1, v3);
      }
      unint64_t v10 = *((void *)v3 + 2);
      unint64_t v9 = *((void *)v3 + 3);
      if (v10 >= v9 >> 1) {
        Swift::String v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v9 > 1), v10 + 1, 1, v3);
      }
      *((void *)v3 + 2) = v10 + 1;
      outlined init with take of Any(&v21, &v3[32 * v10 + 32]);
      swift_bridgeObjectRelease();

      v2 += 3;
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
  }
  uint64_t v11 = *MEMORY[0x1E4F1CF80];
  type metadata accessor for CMTagCollectionRef(0);
  swift_bridgeObjectRetain();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  Class v13 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  LODWORD(v11) = MEMORY[0x1C188E240](v11, isa, v13, v23);

  uint64_t v14 = (void *)v23[0];
  if (v11 != noErr.getter() || v14 == 0)
  {
    *(void *)&long long v21 = 0;
    *((void *)&v21 + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(53);
    v18._object = (void *)0x80000001BE227FA0;
    v18._countAndFlagsBits = 0xD000000000000033;
    String.append(_:)(v18);
    v19._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v19);
    swift_bridgeObjectRelease();
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    id v16 = v14;
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    return (uint64_t)v16;
  }
  return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CMTag>);
    unint64_t v10 = (char *)swift_allocObject();
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
    unint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  Class v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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

{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CMTaggedBuffer>);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  Class v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8]) {
      memmove(v12, v13, 24 * v8);
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
    unint64_t v10 = (char *)swift_allocObject();
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
    unint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  Class v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UnsafeMutableRawPointer?>);
    unint64_t v10 = (char *)swift_allocObject();
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
    unint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  Class v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Data>);
    unint64_t v10 = (char *)swift_allocObject();
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
    unint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  Class v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3, char *a4)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, a4, &demangling cache variable for type metadata for _ContiguousArrayStorage<Int>);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, a4, &demangling cache variable for type metadata for _ContiguousArrayStorage<UnsafePointer<UInt8>>);
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  uint64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    int64_t v11 = (char *)swift_allocObject();
    int64_t v12 = _swift_stdlib_malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * (v13 >> 3);
  }
  else
  {
    int64_t v11 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if (v6)
  {
    if (v11 != a4 || v14 >= &v15[8 * v9]) {
      memmove(v14, v15, 8 * v9);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 8 * v9);
  }
  swift_bridgeObjectRelease();
  return v11;
}

char *specialized Array<A>.init(taggedBufferGroup:)(OpaqueCMTaggedBufferGroup *a1)
{
  CMItemCount Count = CMTaggedBufferGroupGetCount(a1);
  if (Count >= 1)
  {
    CMItemCount v3 = Count;
    CFIndex v4 = 0;
    char v5 = (char *)MEMORY[0x1E4FBC860];
    while (1)
    {
      unint64_t v7 = CMTaggedBufferGroupGetTagCollectionAtIndex(a1, v4);
      if (!v7) {
        goto LABEL_5;
      }
      int64_t v8 = v7;
      uint64_t v9 = CMTaggedBufferGroupGetCVPixelBufferAtIndex(a1, v4);
      if (v9) {
        break;
      }
      uint64_t v14 = CMTaggedBufferGroupGetCMSampleBufferAtIndex(a1, v4);
      if (v14)
      {
        uint64_t v15 = v14;
        id v16 = v8;
        uint64_t v17 = v15;
        uint64_t v12 = specialized Array<A>.init(tagCollection:)(v16);
        uint64_t v13 = v17;
        goto LABEL_11;
      }
LABEL_4:

LABEL_5:
      if (v3 == ++v4) {
        return v5;
      }
    }
    uint64_t v10 = v8;
    int64_t v11 = v9;
    uint64_t v12 = specialized Array<A>.init(tagCollection:)(v10);
    uint64_t v13 = v11;
LABEL_11:
    Swift::String v18 = v13;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      char v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v5 + 2) + 1, 1, v5);
    }
    unint64_t v20 = *((void *)v5 + 2);
    unint64_t v19 = *((void *)v5 + 3);
    if (v20 >= v19 >> 1) {
      char v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v19 > 1), v20 + 1, 1, v5);
    }
    *((void *)v5 + 2) = v20 + 1;
    char v6 = &v5[24 * v20];
    *((void *)v6 + 4) = v12;
    *((void *)v6 + 5) = v18;
    v6[48] = v9 != 0;

    goto LABEL_4;
  }
  return (char *)MEMORY[0x1E4FBC860];
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void destroy for CMTaggedBuffer(uint64_t a1)
{
  swift_bridgeObjectRelease();
  long long v2 = *(void **)(a1 + 8);
}

uint64_t initializeBufferWithCopyOfBuffer for CMTaggedBuffer(uint64_t a1, uint64_t a2)
{
  CMItemCount v3 = *(void **)(a2 + 8);
  char v4 = *(unsigned char *)(a2 + 16);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4;
  swift_bridgeObjectRetain();
  id v5 = v3;
  return a1;
}

uint64_t assignWithCopy for CMTaggedBuffer(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  char v4 = *(void **)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  char v6 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  id v7 = v4;

  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for CMTaggedBuffer(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  char v4 = *(unsigned char *)(a2 + 16);
  char v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for CMTaggedBuffer(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CMTaggedBuffer(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
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
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CMTaggedBuffer()
{
  return &type metadata for CMTaggedBuffer;
}

uint64_t initializeBufferWithCopyOfBuffer for CMTaggedBuffer.Buffer(uint64_t a1, uint64_t a2)
{
  CMItemCount v3 = *(void **)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  id v5 = v3;
  return a1;
}

void destroy for CMTaggedBuffer.Buffer(id *a1)
{
}

uint64_t assignWithCopy for CMTaggedBuffer.Buffer(uint64_t a1, uint64_t a2)
{
  CMItemCount v3 = *(void **)a2;
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
  *(void *)__n128 result = v2;
  return result;
}

uint64_t assignWithTake for CMTaggedBuffer.Buffer(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  char v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for CMTaggedBuffer.Buffer(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CMTaggedBuffer.Buffer(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)__n128 result = a2 - 255;
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

uint64_t getEnumTag for CMTaggedBuffer.Buffer(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t destructiveInjectEnumTag for CMTaggedBuffer.Buffer(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CMTaggedBuffer.Buffer()
{
  return &type metadata for CMTaggedBuffer.Buffer;
}

_OWORD *CMAttachmentBearerAttachments.Value.value.getter@<X0>(_OWORD *a1@<X8>)
{
  outlined init with copy of CMAttachmentBearerAttachments.Value(v1, (uint64_t)v4);
  return outlined init with take of Any(v4, a1);
}

uint64_t outlined init with copy of CMAttachmentBearerAttachments.Value(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t CMAttachmentBearerAttachments.Value.mode.getter@<X0>(unsigned char *a1@<X8>)
{
  outlined init with copy of CMAttachmentBearerAttachments.Value(v1, (uint64_t)v4);
  *a1 = v4[32];
  return outlined destroy of CMAttachmentBearerAttachments.Value((uint64_t)v4);
}

uint64_t outlined destroy of CMAttachmentBearerAttachments.Value(uint64_t a1)
{
  return a1;
}

CoreMedia::CMAttachmentBearerAttachments::Mode_optional __swiftcall CMAttachmentBearerAttachments.Mode.init(rawValue:)(Swift::UInt32 rawValue)
{
  if (rawValue == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (!rawValue) {
    char v2 = 0;
  }
  *uint64_t v1 = v2;
  return (CoreMedia::CMAttachmentBearerAttachments::Mode_optional)rawValue;
}

uint64_t CMAttachmentBearerAttachments.Mode.rawValue.getter()
{
  return *v0;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CMAttachmentBearerAttachments.Mode(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CMAttachmentBearerAttachments.Mode()
{
  Swift::UInt32 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance CMAttachmentBearerAttachments.Mode()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CMAttachmentBearerAttachments.Mode()
{
  Swift::UInt32 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

_DWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance CMAttachmentBearerAttachments.Mode@<X0>(_DWORD *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance CMAttachmentBearerAttachments.Mode(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

double CMAttachmentBearerAttachments.subscript.getter@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CMAttachmentMode attachmentModeOut = 0;
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  id v7 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
  int64_t v8 = (__CFString *)MEMORY[0x1C188D3B0](a1, a2);
  CFTypeRef v9 = (id)CMGetAttachment(v7, v8, &attachmentModeOut);
  swift_unknownObjectRelease();

  if (v9)
  {
    if (!attachmentModeOut)
    {
      char v10 = 0;
      uint64_t ObjectType = swift_getObjectType();
      *(void *)&long long v15 = v9;
      goto LABEL_6;
    }
    if (attachmentModeOut == 1)
    {
      uint64_t ObjectType = swift_getObjectType();
      *(void *)&long long v15 = v9;
      char v10 = 1;
LABEL_6:
      outlined init with take of Any(&v15, v13);
      char v14 = v10;
      outlined init with take of CMAttachmentBearerAttachments.Value(v13, a3);
      return result;
    }
    swift_unknownObjectRelease();
  }
  double result = 0.0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(unsigned char *)(a3 + 32) = -1;
  return result;
}

uint64_t outlined init with take of CMAttachmentBearerAttachments.Value(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(unsigned char *)(a2 + 32) = *((unsigned char *)a1 + 32);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t key path setter for CMAttachmentBearerAttachments.subscript(_:) : CMAttachmentBearerAttachments(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  uint64_t v4 = a3[1];
  outlined init with copy of CMAttachmentBearerAttachments.Value?(a1, (uint64_t)v6, &demangling cache variable for type metadata for CMAttachmentBearerAttachments.Value?);
  swift_bridgeObjectRetain();
  return CMAttachmentBearerAttachments.subscript.setter((uint64_t)v6, v3, v4);
}

uint64_t CMAttachmentBearerAttachments.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  outlined init with copy of CMAttachmentBearerAttachments.Value?(a1, (uint64_t)&v29, &demangling cache variable for type metadata for CMAttachmentBearerAttachments.Value?);
  if (v31 == 255)
  {
    outlined destroy of CMAttachmentBearerAttachments.Value?((uint64_t)&v29);
    outlined init with copy of CMAttachmentBearerAttachments(v4, (uint64_t)&v29);
    uint64_t v17 = v30;
    Swift::String v18 = __swift_project_boxed_opaque_existential_1(&v29, v30);
    uint64_t v19 = *(void *)(v17 - 8);
    MEMORY[0x1F4188790](v18);
    long long v21 = (char *)&v24 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v19 + 16))(v21);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v29);
    uint64_t v22 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v17);
    v23 = (__CFString *)MEMORY[0x1C188D3B0](a2, a3);
    swift_bridgeObjectRelease();
    CMRemoveAttachment(v22, v23);

    swift_unknownObjectRelease();
    return outlined destroy of CMAttachmentBearerAttachments.Value?(a1);
  }
  else
  {
    outlined init with take of CMAttachmentBearerAttachments.Value(&v29, (uint64_t)v32);
    outlined init with copy of CMAttachmentBearerAttachments(v4, (uint64_t)&v29);
    uint64_t v8 = v30;
    CFTypeRef v9 = __swift_project_boxed_opaque_existential_1(&v29, v30);
    uint64_t v10 = *(void *)(v8 - 8);
    MEMORY[0x1F4188790](v9);
    uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v29);
    uint64_t v13 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v8);
    char v14 = (__CFString *)MEMORY[0x1C188D3B0](a2, a3);
    swift_bridgeObjectRelease();
    outlined init with copy of CMAttachmentBearerAttachments.Value((uint64_t)v32, (uint64_t)v25);
    outlined init with take of Any(v25, &v27);
    __swift_project_boxed_opaque_existential_1(&v27, v28);
    long long v15 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
    outlined init with copy of CMAttachmentBearerAttachments.Value((uint64_t)v32, (uint64_t)v25);
    LODWORD(v8) = v26;
    outlined destroy of CMAttachmentBearerAttachments.Value((uint64_t)v25);
    CMSetAttachment(v13, v14, v15, v8);

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    outlined destroy of CMAttachmentBearerAttachments.Value?(a1);
    outlined destroy of CMAttachmentBearerAttachments.Value((uint64_t)v32);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v27);
  }
}

uint64_t outlined destroy of CMAttachmentBearerAttachments.Value?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CMAttachmentBearerAttachments.Value?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined init with copy of CMAttachmentBearerAttachments(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void (*CMAttachmentBearerAttachments.subscript.modify(void *a1, uint64_t a2, uint64_t a3))(uint64_t *a1, char a2)
{
  id v7 = malloc(0x68uLL);
  *a1 = v7;
  v7[11] = a3;
  v7[12] = v3;
  v7[10] = a2;
  CMAttachmentBearerAttachments.subscript.getter(a2, a3, (uint64_t)v7);
  return CMAttachmentBearerAttachments.subscript.modify;
}

void CMAttachmentBearerAttachments.subscript.modify(uint64_t *a1, char a2)
{
  uint64_t v2 = (void *)*a1;
  if (a2)
  {
    uint64_t v3 = v2[11];
    uint64_t v4 = v2[10];
    outlined init with copy of CMAttachmentBearerAttachments.Value?(*a1, (uint64_t)(v2 + 5), &demangling cache variable for type metadata for CMAttachmentBearerAttachments.Value?);
    swift_bridgeObjectRetain();
    CMAttachmentBearerAttachments.subscript.setter((uint64_t)(v2 + 5), v4, v3);
    outlined destroy of CMAttachmentBearerAttachments.Value?((uint64_t)v2);
  }
  else
  {
    uint64_t v5 = v2[11];
    uint64_t v6 = v2[10];
    swift_bridgeObjectRetain();
    CMAttachmentBearerAttachments.subscript.setter((uint64_t)v2, v6, v5);
  }

  free(v2);
}

{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  uint64_t vars8;

  uint64_t v2 = (void *)*a1;
  if (a2)
  {
    uint64_t v3 = (__CFString *)v2[11];
    outlined init with copy of CMAttachmentBearerAttachments.Value?(*a1, (uint64_t)(v2 + 5), &demangling cache variable for type metadata for CMAttachmentBearerAttachments.Value?);
    uint64_t v4 = v3;
    CMAttachmentBearerAttachments.subscript.setter((uint64_t)(v2 + 5), &v4);
    outlined destroy of Any?((uint64_t)v2, &demangling cache variable for type metadata for CMAttachmentBearerAttachments.Value?);
  }
  else
  {
    uint64_t v4 = (__CFString *)v2[11];
    CMAttachmentBearerAttachments.subscript.setter((uint64_t)v2, &v4);
  }

  free(v2);
}

Swift::Void __swiftcall CMAttachmentBearerAttachments.removeAll()()
{
  __swift_project_boxed_opaque_existential_1(v0, v0[3]);
  Swift::UInt32 v1 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
  CMRemoveAllAttachments(v1);

  swift_unknownObjectRelease();
}

unint64_t CMAttachmentBearerAttachments.nonPropagated.getter()
{
  return CMAttachmentBearerAttachments.nonPropagated.getter(0);
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Any>);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    outlined init with copy of CMAttachmentBearerAttachments.Value?(v6, (uint64_t)&v15, &demangling cache variable for type metadata for (String, Any));
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)outlined init with take of Any(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  long long v14;

  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, Any>);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    outlined init with copy of CMAttachmentBearerAttachments.Value?(v6, (uint64_t)&v13, &demangling cache variable for type metadata for (CFStringRef, Any));
    uint64_t v7 = v13;
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)outlined init with take of Any(&v14, (_OWORD *)(v3[7] + 32 * result));
    char v10 = v3[2];
    uint64_t v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
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
  void *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  id v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, CGFloat>);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    uint64_t v6 = (id)*(v4 - 1);
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    CFTypeRef v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    char v10 = v2[2];
    uint64_t v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 2;
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

unint64_t CMAttachmentBearerAttachments.propagated.getter()
{
  return CMAttachmentBearerAttachments.nonPropagated.getter(1u);
}

unint64_t CMAttachmentBearerAttachments.nonPropagated.getter(CMAttachmentMode a1)
{
  uint64_t v3 = v1;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  uint64_t v5 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
  CFDictionaryRef v6 = CMCopyDictionaryOfAttachments(v4, v5, a1);
  swift_unknownObjectRelease();
  if (v6)
  {
    v6;
    unint64_t result = static Dictionary._forceBridgeFromObjectiveC(_:result:)();
    __break(1u);
  }
  else
  {
    uint64_t v8 = MEMORY[0x1E4FBC860];
    return specialized Dictionary.init(dictionaryLiteral:)(v8);
  }
  return result;
}

Swift::Void __swiftcall CMAttachmentBearerAttachments.merge(_:mode:)(Swift::OpaquePointer _, CoreMedia::CMAttachmentBearerAttachments::Mode mode)
{
  CMAttachmentMode v3 = *(unsigned __int8 *)mode;
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  CFAllocatorRef v4 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
  CFDictionaryRef isa = Dictionary._bridgeToObjectiveC()().super.isa;
  CMSetAttachments(v4, isa, v3);
  swift_unknownObjectRelease();
}

id CMBlockBufferRef.attachments.getter@<X0>(void *a1@<X8>)
{
  type metadata accessor for CMBlockBufferRef(0);
  a1[3] = v2;
  a1[4] = &protocol witness table for CMBlockBufferRef;
  *a1 = v4;

  return v4;
}

uint64_t (*CMBlockBufferRef.attachments.modify(void *a1))()
{
  CMAttachmentMode v3 = malloc(0x28uLL);
  *a1 = v3;
  type metadata accessor for CMBlockBufferRef(0);
  v3[3] = v4;
  v3[4] = &protocol witness table for CMBlockBufferRef;
  *CMAttachmentMode v3 = v1;
  id v5 = v1;
  return CMSampleBufferRef.attachments.modify;
}

uint64_t CMBlockBufferRef.attachments.setter(uint64_t *a1)
{
  return CMBlockBufferRef.attachments.setter(a1, (uint64_t (*)(void))type metadata accessor for CMBlockBufferRef, (uint64_t)&protocol witness table for CMBlockBufferRef);
}

uint64_t *outlined assign with copy of CMAttachmentBearerAttachments(uint64_t *a1, uint64_t *a2)
{
  return a2;
}

id protocol witness for CMAttachmentBearerProtocol.attachments.getter in conformance CMBlockBufferRef@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  return protocol witness for CMAttachmentBearerProtocol.attachments.getter in conformance CMBlockBufferRef(a1, (uint64_t (*)(void))type metadata accessor for CMBlockBufferRef, a2);
}

id CMSampleBufferRef.attachments.getter@<X0>(void *a1@<X8>)
{
  type metadata accessor for CMSampleBufferRef(0);
  a1[3] = v2;
  a1[4] = &protocol witness table for CMSampleBufferRef;
  *a1 = v4;

  return v4;
}

uint64_t (*CMSampleBufferRef.attachments.modify(void *a1))()
{
  CMAttachmentMode v3 = malloc(0x28uLL);
  *a1 = v3;
  type metadata accessor for CMSampleBufferRef(0);
  v3[3] = v4;
  v3[4] = &protocol witness table for CMSampleBufferRef;
  *CMAttachmentMode v3 = v1;
  id v5 = v1;
  return CMSampleBufferRef.attachments.modify;
}

uint64_t CMSampleBufferRef.attachments.setter(uint64_t *a1)
{
  return CMBlockBufferRef.attachments.setter(a1, (uint64_t (*)(void))type metadata accessor for CMSampleBufferRef, (uint64_t)&protocol witness table for CMSampleBufferRef);
}

id protocol witness for CMAttachmentBearerProtocol.attachments.getter in conformance CMSampleBufferRef@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  return protocol witness for CMAttachmentBearerProtocol.attachments.getter in conformance CMBlockBufferRef(a1, (uint64_t (*)(void))type metadata accessor for CMSampleBufferRef, a2);
}

id CVBufferRef.attachments.getter@<X0>(void *a1@<X8>)
{
  type metadata accessor for CVBufferRef(0);
  a1[3] = v2;
  a1[4] = &protocol witness table for CVBufferRef;
  *a1 = v4;

  return v4;
}

uint64_t key path setter for CMBlockBufferRef.attachments : CMBlockBufferRef(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void), uint64_t a6)
{
  uint64_t v8 = *a2;
  v11[3] = a5(0);
  v11[4] = a6;
  v11[0] = (uint64_t)v8;
  id v9 = v8;
  outlined assign with copy of CMAttachmentBearerAttachments(a1, v11);
  return outlined destroy of CMAttachmentBearerAttachments.Value((uint64_t)v11);
}

void (*CVBufferRef.attachments.modify(void *a1))(uint64_t *a1)
{
  CMAttachmentMode v3 = malloc(0x28uLL);
  *a1 = v3;
  type metadata accessor for CVBufferRef(0);
  v3[3] = v4;
  v3[4] = &protocol witness table for CVBufferRef;
  *CMAttachmentMode v3 = v1;
  id v5 = v1;
  return CVBufferRef.attachments.modify;
}

void CVBufferRef.attachments.modify(uint64_t *a1)
{
  Swift::UInt32 v1 = (void *)*a1;
  outlined destroy of CMAttachmentBearerAttachments.Value(*a1);

  free(v1);
}

uint64_t CVBufferRef.attachments.setter(uint64_t *a1)
{
  return CMBlockBufferRef.attachments.setter(a1, (uint64_t (*)(void))type metadata accessor for CVBufferRef, (uint64_t)&protocol witness table for CVBufferRef);
}

uint64_t CMBlockBufferRef.attachments.setter(uint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  v8[3] = a2(0);
  v8[4] = a3;
  v8[0] = (uint64_t)v3;
  id v6 = v3;
  outlined assign with copy of CMAttachmentBearerAttachments(a1, v8);
  outlined destroy of CMAttachmentBearerAttachments.Value((uint64_t)v8);
  return outlined destroy of CMAttachmentBearerAttachments.Value((uint64_t)a1);
}

uint64_t CMBlockBufferRef.propagateAttachments<A>(to:)()
{
  Swift::UInt32 v1 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
  CMPropagateAttachments(v0, v1);

  return swift_unknownObjectRelease();
}

unint64_t lazy protocol witness table accessor for type CMAttachmentBearerAttachments.Mode and conformance CMAttachmentBearerAttachments.Mode()
{
  unint64_t result = lazy protocol witness table cache variable for type CMAttachmentBearerAttachments.Mode and conformance CMAttachmentBearerAttachments.Mode;
  if (!lazy protocol witness table cache variable for type CMAttachmentBearerAttachments.Mode and conformance CMAttachmentBearerAttachments.Mode)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMAttachmentBearerAttachments.Mode and conformance CMAttachmentBearerAttachments.Mode);
  }
  return result;
}

id protocol witness for CMAttachmentBearerProtocol.attachments.getter in conformance CVBufferRef@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  return protocol witness for CMAttachmentBearerProtocol.attachments.getter in conformance CMBlockBufferRef(a1, (uint64_t (*)(void))type metadata accessor for CVBufferRef, a2);
}

id protocol witness for CMAttachmentBearerProtocol.attachments.getter in conformance CMBlockBufferRef@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(void)@<X2>, void *a3@<X8>)
{
  id v7 = *v3;
  a3[3] = a2(0);
  a3[4] = a1;
  *a3 = v7;

  return v7;
}

uint64_t protocol witness for CMAttachmentBearerProtocol.propagateAttachments<A>(to:) in conformance CVBufferRef()
{
  return CVBufferRef.propagateAttachments<A>(to:)();
}

double sub_1BE1FEEF0@<D0>(uint64_t *a1@<X1>, uint64_t a2@<X8>)
{
  return CMAttachmentBearerAttachments.subscript.getter(*a1, a1[1], a2);
}

uint64_t sub_1BE1FEF1C()
{
  return 0;
}

id sub_1BE1FEF2C@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_1Tm(a1, (uint64_t (*)(void))type metadata accessor for CMBlockBufferRef, (uint64_t)&protocol witness table for CMBlockBufferRef, a2);
}

uint64_t sub_1BE1FEF4C(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CMBlockBufferRef.attachments : CMBlockBufferRef(a1, a2, a3, a4, (uint64_t (*)(void))type metadata accessor for CMBlockBufferRef, (uint64_t)&protocol witness table for CMBlockBufferRef);
}

id sub_1BE1FEF80@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_1Tm(a1, (uint64_t (*)(void))type metadata accessor for CMSampleBufferRef, (uint64_t)&protocol witness table for CMSampleBufferRef, a2);
}

uint64_t sub_1BE1FEFA0(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CMBlockBufferRef.attachments : CMBlockBufferRef(a1, a2, a3, a4, (uint64_t (*)(void))type metadata accessor for CMSampleBufferRef, (uint64_t)&protocol witness table for CMSampleBufferRef);
}

id sub_1BE1FEFD4@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_1Tm(a1, (uint64_t (*)(void))type metadata accessor for CVBufferRef, (uint64_t)&protocol witness table for CVBufferRef, a2);
}

id keypath_get_1Tm@<X0>(id *a1@<X0>, uint64_t (*a2)(void)@<X3>, uint64_t a3@<X4>, void *a4@<X8>)
{
  id v7 = *a1;
  a4[3] = a2(0);
  a4[4] = a3;
  *a4 = v7;

  return v7;
}

uint64_t sub_1BE1FF050(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CMBlockBufferRef.attachments : CMBlockBufferRef(a1, a2, a3, a4, (uint64_t (*)(void))type metadata accessor for CVBufferRef, (uint64_t)&protocol witness table for CVBufferRef);
}

uint64_t dispatch thunk of CMAttachmentBearerProtocol.attachments.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of CMAttachmentBearerProtocol.propagateAttachments<A>(to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t destroy for CMAttachmentBearerAttachments(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t initializeWithCopy for CMAttachmentBearerAttachments(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for CMAttachmentBearerAttachments(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    long long v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
        *long long v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *unint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *long long v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

uint64_t assignWithTake for CMAttachmentBearerAttachments(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for CMAttachmentBearerAttachments(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CMAttachmentBearerAttachments(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CMAttachmentBearerAttachments()
{
  return &type metadata for CMAttachmentBearerAttachments;
}

uint64_t initializeWithCopy for CMAttachmentBearerAttachments.Value(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(unsigned __int8 *)(a2 + 32);
  if (v3 >= 2) {
    unsigned int v3 = *(_DWORD *)a2 + 2;
  }
  BOOL v4 = v3 == 1;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 24) = v5;
  (**(void (***)(uint64_t))(v5 - 8))(a1);
  *(unsigned char *)(a1 + 32) = v4;
  return a1;
}

uint64_t assignWithCopy for CMAttachmentBearerAttachments.Value(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
    unsigned int v4 = *(unsigned __int8 *)(a2 + 32);
    if (v4 >= 2) {
      unsigned int v4 = *(_DWORD *)a2 + 2;
    }
    BOOL v5 = v4 == 1;
    uint64_t v6 = *(void *)(a2 + 24);
    *(void *)(a1 + 24) = v6;
    (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1, a2);
    *(unsigned char *)(a1 + 32) = v5;
  }
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for CMAttachmentBearerAttachments.Value(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
    unsigned int v4 = *(unsigned __int8 *)(a2 + 32);
    if (v4 >= 2) {
      unsigned int v4 = *(_DWORD *)a2 + 2;
    }
    long long v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    *(unsigned char *)(a1 + 32) = v4 == 1;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for CMAttachmentBearerAttachments.Value(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 >= 2) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CMAttachmentBearerAttachments.Value(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 32) = 0;
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for CMAttachmentBearerAttachments.Value(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 32);
  if (result >= 2) {
    return (*(_DWORD *)a1 + 2);
  }
  return result;
}

uint64_t destructiveInjectEnumTag for CMAttachmentBearerAttachments.Value(uint64_t result, unsigned int a2)
{
  if (a2 > 1)
  {
    *(_OWORD *)uint64_t result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)uint64_t result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CMAttachmentBearerAttachments.Value()
{
  return &type metadata for CMAttachmentBearerAttachments.Value;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CMAttachmentBearerAttachments.Mode(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CMAttachmentBearerAttachments.Mode(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x1BE1FF814);
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

uint64_t getEnumTag for CMAttachmentBearerAttachments.Mode(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for CMAttachmentBearerAttachments.Mode(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CMAttachmentBearerAttachments.Mode()
{
  return &type metadata for CMAttachmentBearerAttachments.Mode;
}

uint64_t outlined init with copy of CMAttachmentBearerAttachments.Value?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void _CMSimpleQueueInitTrampoline.init(capacity:)(uint64_t capacity, uint64_t a2, uint64_t a3)
{
  v8[1] = *(CMSimpleQueueRef *)MEMORY[0x1E4F143B8];
  if (capacity == (int)capacity)
  {
    v8[0] = 0;
    OSStatus v5 = CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], capacity, v8);
    CMSimpleQueueRef v6 = v8[0];
    if (v5 == noErr.getter())
    {
      if (v6) {
        (*(void (**)(CMSimpleQueueRef, uint64_t, uint64_t))(a3 + 8))(v6, a2, a3);
      }
      else {
        __break(1u);
      }
    }
    else
    {
      id v7 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
      [v7 initWithDomain:*MEMORY[0x1E4F28760] code:v5 userInfo:0];
      swift_willThrow();
    }
  }
  else
  {
    if (one-time initialization token for parameterOutOfRange != -1) {
      swift_once();
    }
    (id)static CMSimpleQueueRef.Error.parameterOutOfRange;
    swift_willThrow();
  }
}

id static CMSimpleQueueRef.Error.allocationFailed.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for allocationFailed, (void **)&static CMSimpleQueueRef.Error.allocationFailed);
}

id one-time initialization function for requiredParameterMissing()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 init:*MEMORY[0x1E4F28760] code:-12771 userInfo:0];
  static CMSimpleQueueRef.Error.requiredParameterMissing = (uint64_t)result;
  return result;
}

{
  id v0;
  id result;

  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:MEMORY[0x1E4F28760] code:-12731 userInfo:0];
  static CMSampleBufferRef.Error.requiredParameterMissing = (uint64_t)result;
  return result;
}

{
  id v0;
  id result;

  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:*MEMORY[0x1E4F28760] code:-12761 userInfo:0];
  static CMBufferQueueRef.Error.requiredParameterMissing = (uint64_t)result;
  return result;
}

id static CMSimpleQueueRef.Error.requiredParameterMissing.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for requiredParameterMissing, (void **)&static CMSimpleQueueRef.Error.requiredParameterMissing);
}

id one-time initialization function for parameterOutOfRange()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 init:MEMORY[0x1E4F28760] code:-12772 userInfo:0];
  static CMSimpleQueueRef.Error.parameterOutOfRange = (uint64_t)result;
  return result;
}

id static CMSimpleQueueRef.Error.parameterOutOfRange.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for parameterOutOfRange, (void **)&static CMSimpleQueueRef.Error.parameterOutOfRange);
}

id one-time initialization function for queueIsFull()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:*MEMORY[0x1E4F28760] code:-12773 userInfo:0];
  static CMSimpleQueueRef.Error.queueIsFull = (uint64_t)result;
  return result;
}

{
  id v0;
  id result;

  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:MEMORY[0x1E4F28760] code:-12764 userInfo:0];
  static CMBufferQueueRef.Error.queueIsFull = (uint64_t)result;
  return result;
}

id static CMSimpleQueueRef.Error.queueIsFull.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for queueIsFull, (void **)&static CMSimpleQueueRef.Error.queueIsFull);
}

uint64_t CMSimpleQueueRef.enqueue(_:)(void *element)
{
  OSStatus v2 = CMSimpleQueueEnqueue(v1, element);
  uint64_t result = noErr.getter();
  if (v2 != result)
  {
    id v4 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v4 initWithDomain:*MEMORY[0x1E4F28760] code:v2 userInfo:0];
    return swift_willThrow();
  }
  return result;
}

const void *CMSimpleQueueRef.dequeue()()
{
  return CMSimpleQueueDequeue(v0);
}

const void *CMSimpleQueueRef.head.getter()
{
  return CMSimpleQueueGetHead(v0);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMSimpleQueueRef.reset()()
{
  OSStatus v1 = CMSimpleQueueReset(v0);
  if (v1 != noErr.getter())
  {
    id v2 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v2 initWithDomain:*MEMORY[0x1E4F28760] code:v1 userInfo:0];
    swift_willThrow();
  }
}

uint64_t CMSimpleQueueRef.capacity.getter()
{
  return CMSimpleQueueGetCapacity(v0);
}

uint64_t CMSimpleQueueRef.count.getter()
{
  return CMSimpleQueueGetCount(v0);
}

uint64_t CMSimpleQueueRef.fullness.getter()
{
  uint64_t result = CMSimpleQueueGetCapacity(v0);
  if (result)
  {
    CMSimpleQueueGetCount(v0);
    return CMSimpleQueueGetCapacity(v0);
  }
  return result;
}

uint64_t dispatch thunk of _CMSimpleQueueInitTrampoline.init(referencing:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

ValueMetadata *type metadata accessor for CMSimpleQueueRef.Error()
{
  return &type metadata for CMSimpleQueueRef.Error;
}

void __swiftcall CMTimeRange.init(start:end:)(__C::CMTimeRange *__return_ptr retstr, CMTime start, CMTime end)
{
  CMTime starta = start;
  CMTime enda = end;
  CMTimeRangeFromTimeToTime(&v8, &starta, &enda);
  CMTimeEpoch epoch = v8.duration.epoch;
  uint64_t v5 = *(void *)&v8.start.timescale;
  uint64_t v6 = *(void *)&v8.duration.timescale;
  long long v7 = *(_OWORD *)&v8.start.epoch;
  retstr->start.CMTimeValue value = v8.start.value;
  *(void *)&retstr->start.timescale = v5;
  *(_OWORD *)&retstr->start.CMTimeEpoch epoch = v7;
  *(void *)&retstr->duration.timescale = v6;
  retstr->duration.CMTimeEpoch epoch = epoch;
}

BOOL CMTimeRange.isValid.getter()
{
  if ((*(unsigned char *)(v0 + 12) & 1) == 0) {
    return 0;
  }
  if ((*(unsigned char *)(v0 + 36) & 1) == 0) {
    return 0;
  }
  if (*(void *)(v0 + 40)) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = *(uint64_t *)(v0 + 24) < 0;
  }
  return !v2;
}

uint64_t CMTimeRange.isIndefinite.getter()
{
  int v1 = *(_DWORD *)(v0 + 12);
  if ((v1 & 1) == 0) {
    return 0;
  }
  unsigned int v3 = *(_DWORD *)(v0 + 36);
  if ((v3 & 1) == 0) {
    return 0;
  }
  int v4 = (v3 >> 4) & 1;
  if ((v1 & 0x10) != 0) {
    unsigned int v5 = 1;
  }
  else {
    unsigned int v5 = v4;
  }
  if (*(uint64_t *)(v0 + 24) < 0) {
    unsigned int v5 = 0;
  }
  if (*(void *)(v0 + 40)) {
    return 0;
  }
  else {
    return v5;
  }
}

BOOL CMTimeRange.isEmpty.getter()
{
  if ((*(unsigned char *)(v0 + 12) & 1) == 0) {
    return 0;
  }
  BOOL result = 0;
  CMTimeFlags v2 = *(_DWORD *)(v0 + 36);
  if ((v2 & 1) != 0 && !*(void *)(v0 + 40))
  {
    CMTimeValue v3 = *(void *)(v0 + 24);
    if ((v3 & 0x8000000000000000) == 0)
    {
      CMTimeScale v4 = *(_DWORD *)(v0 + 32);
      CMTimeValue v5 = *MEMORY[0x1E4F1FA48];
      v6.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      time1.CMTimeValue value = v3;
      time1.timescale = v4;
      time1.flags = v2;
      time1.CMTimeEpoch epoch = 0;
      v6.CMTimeValue value = v5;
      *(void *)&v6.timescale = *(void *)(MEMORY[0x1E4F1FA48] + 8);
      return CMTimeCompare(&time1, &v6) == 0;
    }
  }
  return result;
}

CMTimeValue CMTimeRange.end.getter()
{
  CMTimeEpoch v1 = *(void *)(v0 + 40);
  range.start.CMTimeValue value = *(void *)v0;
  *(void *)&range.start.timescale = *(void *)(v0 + 8);
  *(_OWORD *)&range.start.CMTimeEpoch epoch = *(_OWORD *)(v0 + 16);
  *(void *)&range.duration.timescale = *(void *)(v0 + 32);
  range.duration.CMTimeEpoch epoch = v1;
  CMTimeRangeGetEnd(&v3, &range);
  return v3.value;
}

void __swiftcall CMTimeRange.union(_:)(__C::CMTimeRange *__return_ptr retstr, __C::CMTimeRange *a2)
{
}

void __swiftcall CMTimeRange.intersection(_:)(__C::CMTimeRange *__return_ptr retstr, __C::CMTimeRange *a2)
{
}

double CMTimeRange.union(_:)@<D0>(uint64_t *a1@<X0>, void (*a2)(void *__return_ptr, void *, void *)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v6 = a1[5];
  uint64_t v7 = *(void *)(v3 + 40);
  v20[0] = *(void *)v3;
  v20[1] = *(void *)(v3 + 8);
  long long v21 = *(_OWORD *)(v3 + 16);
  uint64_t v22 = *(void *)(v3 + 32);
  uint64_t v23 = v7;
  v16[0] = v5;
  v16[1] = a1[1];
  long long v17 = *((_OWORD *)a1 + 1);
  uint64_t v18 = a1[4];
  uint64_t v19 = v6;
  a2(v12, v20, v16);
  uint64_t v8 = v15;
  double result = *(double *)&v12[1];
  uint64_t v10 = v14;
  long long v11 = v13;
  *(void *)a3 = v12[0];
  *(double *)(a3 + 8) = result;
  *(_OWORD *)(a3 + 16) = v11;
  *(void *)(a3 + 32) = v10;
  *(void *)(a3 + 40) = v8;
  return result;
}

Swift::Bool __swiftcall CMTimeRange.containsTime(_:)(CMTime a1)
{
  CMTimeValue v2 = *(void *)v1;
  CMTimeEpoch v3 = *(void *)(v1 + 40);
  time.CMTimeEpoch epoch = a1.epoch;
  range.start.CMTimeValue value = v2;
  *(void *)&range.start.timescale = *(void *)(v1 + 8);
  *(_OWORD *)&range.start.CMTimeEpoch epoch = *(_OWORD *)(v1 + 16);
  *(void *)&range.duration.timescale = *(void *)(v1 + 32);
  range.duration.CMTimeEpoch epoch = v3;
  time.CMTimeValue value = a1.value;
  time.timescale = a1.timescale;
  time.flags = a1.flags;
  return CMTimeRangeContainsTime(&range, &time) != 0;
}

Swift::Bool __swiftcall CMTimeRange.containsTimeRange(_:)(__C::CMTimeRange *a1)
{
  CMTimeValue value = a1->start.value;
  CMTimeValue v3 = *(void *)v1;
  CMTimeEpoch v4 = *(void *)(v1 + 40);
  v6.duration.CMTimeEpoch epoch = a1->duration.epoch;
  range.start.CMTimeValue value = v3;
  *(void *)&range.start.timescale = *(void *)(v1 + 8);
  *(_OWORD *)&range.start.CMTimeEpoch epoch = *(_OWORD *)(v1 + 16);
  *(void *)&range.duration.timescale = *(void *)(v1 + 32);
  range.duration.CMTimeEpoch epoch = v4;
  v6.start.CMTimeValue value = value;
  *(void *)&v6.start.timescale = *(void *)&a1->start.timescale;
  *(_OWORD *)&v6.start.CMTimeEpoch epoch = *(_OWORD *)&a1->start.epoch;
  *(void *)&v6.duration.timescale = *(void *)&a1->duration.timescale;
  return CMTimeRangeContainsTimeRange(&range, &v6) != 0;
}

Swift::Bool __swiftcall CMTIMERANGE_IS_VALID(_:)(__C::CMTimeRange *a1)
{
  if ((a1->start.flags & 1) == 0) {
    return 0;
  }
  if ((a1->duration.flags & 1) == 0) {
    return 0;
  }
  if (a1->duration.epoch) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = a1->duration.value < 0;
  }
  return !v2;
}

Swift::Bool __swiftcall CMTIMERANGE_IS_INVALID(_:)(__C::CMTimeRange *a1)
{
  if ((a1->start.flags & 1) == 0) {
    return 1;
  }
  if ((a1->duration.flags & 1) == 0) {
    return 1;
  }
  return a1->duration.epoch || a1->duration.value < 0;
}

Swift::Bool __swiftcall CMTIMERANGE_IS_INDEFINITE(_:)(__C::CMTimeRange *a1)
{
  CMTimeFlags flags = a1->start.flags;
  if ((flags & 1) == 0) {
    return 0;
  }
  CMTimeFlags v3 = a1->duration.flags;
  if ((v3 & 1) == 0) {
    return 0;
  }
  int v4 = (v3 >> 4) & 1;
  if ((flags & 0x10) != 0) {
    Swift::Bool v5 = 1;
  }
  else {
    Swift::Bool v5 = v4;
  }
  if (a1->duration.value < 0) {
    Swift::Bool v5 = 0;
  }
  return !a1->duration.epoch && v5;
}

Swift::Bool __swiftcall CMTIMERANGE_IS_EMPTY(_:)(__C::CMTimeRange *a1)
{
  if ((a1->start.flags & 1) == 0) {
    return 0;
  }
  Swift::Bool result = 0;
  CMTimeFlags flags = a1->duration.flags;
  if ((flags & 1) != 0 && !a1->duration.epoch)
  {
    CMTimeValue value = a1->duration.value;
    if ((value & 0x8000000000000000) == 0)
    {
      CMTimeScale timescale = a1->duration.timescale;
      CMTimeValue v6 = *MEMORY[0x1E4F1FA48];
      v7.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      time1.CMTimeValue value = value;
      time1.CMTimeScale timescale = timescale;
      time1.CMTimeFlags flags = flags;
      time1.CMTimeEpoch epoch = 0;
      v7.CMTimeValue value = v6;
      *(void *)&v7.CMTimeScale timescale = *(void *)(MEMORY[0x1E4F1FA48] + 8);
      return CMTimeCompare(&time1, &v7) == 0;
    }
  }
  return result;
}

BOOL static CMTimeRange.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  CMTimeValue v2 = *(void *)a2;
  CMTimeValue v3 = *(void *)a1;
  CMTimeEpoch v4 = *(void *)(a1 + 40);
  v6.duration.CMTimeEpoch epoch = *(void *)(a2 + 40);
  range1.start.CMTimeValue value = v3;
  *(void *)&range1.start.CMTimeScale timescale = *(void *)(a1 + 8);
  *(_OWORD *)&range1.start.CMTimeEpoch epoch = *(_OWORD *)(a1 + 16);
  *(void *)&range1.duration.CMTimeScale timescale = *(void *)(a1 + 32);
  range1.duration.CMTimeEpoch epoch = v4;
  v6.start.CMTimeValue value = v2;
  *(void *)&v6.start.CMTimeScale timescale = *(void *)(a2 + 8);
  *(_OWORD *)&v6.start.CMTimeEpoch epoch = *(_OWORD *)(a2 + 16);
  *(void *)&v6.duration.CMTimeScale timescale = *(void *)(a2 + 32);
  return CMTimeRangeEqual(&range1, &v6) != 0;
}

BOOL static CMTimeRange.!= infix(_:_:)(uint64_t a1, uint64_t a2)
{
  CMTimeValue v2 = *(void *)a2;
  CMTimeValue v3 = *(void *)a1;
  CMTimeEpoch v4 = *(void *)(a1 + 40);
  v6.duration.CMTimeEpoch epoch = *(void *)(a2 + 40);
  range1.start.CMTimeValue value = v3;
  *(void *)&range1.start.CMTimeScale timescale = *(void *)(a1 + 8);
  *(_OWORD *)&range1.start.CMTimeEpoch epoch = *(_OWORD *)(a1 + 16);
  *(void *)&range1.duration.CMTimeScale timescale = *(void *)(a1 + 32);
  range1.duration.CMTimeEpoch epoch = v4;
  v6.start.CMTimeValue value = v2;
  *(void *)&v6.start.CMTimeScale timescale = *(void *)(a2 + 8);
  *(_OWORD *)&v6.start.CMTimeEpoch epoch = *(_OWORD *)(a2 + 16);
  *(void *)&v6.duration.CMTimeScale timescale = *(void *)(a2 + 32);
  return CMTimeRangeEqual(&range1, &v6) == 0;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CMTimeRange(uint64_t a1, uint64_t a2)
{
  CMTimeValue v2 = *(void *)a1;
  CMTimeEpoch v3 = *(void *)(a1 + 40);
  CMTimeValue v4 = *(void *)a2;
  v6.duration.CMTimeEpoch epoch = *(void *)(a2 + 40);
  range1.start.CMTimeValue value = v2;
  *(void *)&range1.start.CMTimeScale timescale = *(void *)(a1 + 8);
  *(_OWORD *)&range1.start.CMTimeEpoch epoch = *(_OWORD *)(a1 + 16);
  *(void *)&range1.duration.CMTimeScale timescale = *(void *)(a1 + 32);
  range1.duration.CMTimeEpoch epoch = v3;
  v6.start.CMTimeValue value = v4;
  *(void *)&v6.start.CMTimeScale timescale = *(void *)(a2 + 8);
  *(_OWORD *)&v6.start.CMTimeEpoch epoch = *(_OWORD *)(a2 + 16);
  *(void *)&v6.duration.CMTimeScale timescale = *(void *)(a2 + 32);
  return CMTimeRangeEqual(&range1, &v6) != 0;
}

void CMTimeRange.hash(into:)()
{
  int64_t v1 = *(void *)v0;
  int v2 = *(_DWORD *)(v0 + 12);
  int64_t v3 = *(int *)(v0 + 8);
  Swift::UInt64 v4 = *(void *)(v0 + 16);
  Hasher._combine(_:)(v2 & 0xFFFFFFFD);
  if ((v2 & 0x1D) == 1)
  {
    uint64_t v5 = v1;
    if (v3)
    {
      uint64_t v6 = v3;
      uint64_t v7 = v1;
      while (1)
      {
        uint64_t v5 = v6;
        if (v6 == -1 && v7 == 0x8000000000000000) {
          break;
        }
        uint64_t v6 = v7 % v6;
        uint64_t v7 = v5;
        if (!v6) {
          goto LABEL_8;
        }
      }
      __break(1u);
    }
LABEL_8:
    if (v5)
    {
      if (v1 == 0x8000000000000000 && v5 == -1)
      {
        __break(1u);
        goto LABEL_27;
      }
      v1 /= v5;
      v3 /= v5;
    }
    Hasher._combine(_:)(v1);
    Hasher._combine(_:)(v3);
    Hasher._combine(_:)(v4);
  }
  int64_t v8 = *(void *)(v0 + 24);
  int v9 = *(_DWORD *)(v0 + 36);
  int64_t v10 = *(int *)(v0 + 32);
  Swift::UInt64 v11 = *(void *)(v0 + 40);
  Hasher._combine(_:)(v9 & 0xFFFFFFFD);
  if ((v9 & 0x1D) != 1) {
    return;
  }
  uint64_t v12 = v8;
  if (v10)
  {
    uint64_t v13 = v10;
    uint64_t v14 = v8;
    while (1)
    {
      uint64_t v12 = v13;
      if (v13 == -1 && v14 == 0x8000000000000000) {
        break;
      }
      uint64_t v13 = v14 % v13;
      uint64_t v14 = v12;
      if (!v13) {
        goto LABEL_20;
      }
    }
    __break(1u);
  }
LABEL_20:
  if (v12)
  {
    if (v8 != 0x8000000000000000 || v12 != -1)
    {
      v8 /= v12;
      v10 /= v12;
      goto LABEL_24;
    }
LABEL_27:
    __break(1u);
    return;
  }
LABEL_24:
  Hasher._combine(_:)(v8);
  Hasher._combine(_:)(v10);
  Hasher._combine(_:)(v11);
}

Swift::Int CMTimeRange.hashValue.getter()
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CMTimeRange()
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CMTimeRange()
{
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type CMTimeRange and conformance CMTimeRange()
{
  unint64_t result = lazy protocol witness table cache variable for type CMTimeRange and conformance CMTimeRange;
  if (!lazy protocol witness table cache variable for type CMTimeRange and conformance CMTimeRange)
  {
    type metadata accessor for CMTimeRange(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMTimeRange and conformance CMTimeRange);
  }
  return result;
}

void _CMSampleBufferInitTrampoline.init(dataBuffer:formatDescription:numSamples:sampleTimings:sampleSizes:)(CMBlockBufferRef dataBuffer, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v15[1] = *(CMSampleBufferRef *)MEMORY[0x1E4F143B8];
  v15[0] = 0;
  OSStatus v10 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], dataBuffer, 1u, 0, 0, formatDescription, numSamples, *(void *)(a4 + 16), (const CMSampleTimingInfo *)(a4 + 32), *(void *)(a5 + 16), (const size_t *)(a5 + 32), v15);
  CMSampleBufferRef v11 = v15[0];
  if (v10 != noErr.getter())
  {
    id v14 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v14 initWithDomain:*MEMORY[0x1E4F28760] code:v10 userInfo:0];
    swift_willThrow();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v11)
  {
    uint64_t v12 = *(void (**)(void))(a7 + 8);
    uint64_t v13 = v11;
    v12();

LABEL_5:
    return;
  }
  __break(1u);
}

uint64_t _CMSampleBufferInitTrampoline.init(dataBuffer:dataReady:formatDescription:numSamples:sampleTimings:sampleSizes:makeDataReadyHandler:)(OpaqueCMBlockBuffer *a1, char a2, const opaqueCMFormatDescription *a3, CMItemCount a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sampleBufferOut[1] = *(CMSampleBufferRef *)MEMORY[0x1E4F143B8];
  sampleBufferOut[0] = 0;
  sampleTimingArray = (CMSampleTimingInfo *)(a5 + 32);
  CMItemCount v11 = *(void *)(a5 + 16);
  sampleSizeArray = (const size_t *)(a6 + 32);
  CMItemCount v13 = *(void *)(a6 + 16);
  CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  aBlock[4] = a7;
  aBlock[5] = a8;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed CMSampleBufferRef) -> (@unowned Int32);
  aBlock[3] = &block_descriptor;
  uint64_t v15 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  OSStatus DataReadyHandler = CMSampleBufferCreateWithMakeDataReadyHandler(v14, a1, a2 & 1, a3, a4, v11, sampleTimingArray, v13, sampleSizeArray, sampleBufferOut, v15);
  _Block_release(v15);
  CMSampleBufferRef v17 = sampleBufferOut[0];
  if (DataReadyHandler == noErr.getter())
  {
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v17)
    {
      uint64_t v19 = *(void (**)(void))(a10 + 8);
      uint64_t v20 = v17;
      v19();

      return swift_release();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    id v21 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v21 initWithDomain:*MEMORY[0x1E4F28760] code:DataReadyHandler userInfo:0];
    swift_willThrow();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return swift_release();
  }
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed CMSampleBufferRef) -> (@unowned Int32)(uint64_t a1, void *a2)
{
  int64_t v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  uint64_t v5 = v3();
  swift_release();

  return v5;
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

void _CMSampleBufferInitTrampoline.init(dataBuffer:formatDescription:numSamples:presentationTimeStamp:packetDescriptions:)(CMBlockBufferRef dataBuffer, CMFormatDescriptionRef formatDescription, const AudioStreamPacketDescription *numSamples, CMTimeValue a4, uint64_t a5, CMTimeEpoch a6, uint64_t a7, int a8, uint64_t a9)
{
  v19[1] = *(CMSampleBufferRef *)MEMORY[0x1E4F143B8];
  v19[0] = 0;
  packetDescriptions = *(const AudioStreamPacketDescription **)(a7 + 16);
  if (packetDescriptions)
  {
    if (packetDescriptions != numSamples) {
      __break(1u);
    }
    packetDescriptions = (const AudioStreamPacketDescription *)(a7 + 32);
  }
  CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  presentationTimeStamp.CMTimeValue value = a4;
  *(void *)&presentationTimeStamp.CMTimeScale timescale = a5;
  presentationTimeStamp.CMTimeEpoch epoch = a6;
  OSStatus v13 = CMAudioSampleBufferCreateWithPacketDescriptions(v12, dataBuffer, 1u, 0, 0, formatDescription, (CMItemCount)numSamples, &presentationTimeStamp, packetDescriptions, v19);
  CMSampleBufferRef v14 = v19[0];
  if (v13 == noErr.getter())
  {
    swift_bridgeObjectRelease();
    if (v14)
    {
      uint64_t v15 = *(void (**)(void))(a9 + 8);
      uint64_t v16 = v14;
      v15();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    id v17 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v17 initWithDomain:*MEMORY[0x1E4F28760] code:v13 userInfo:0];
    swift_willThrow();

    swift_bridgeObjectRelease();
  }
}

uint64_t _CMSampleBufferInitTrampoline.init(dataBuffer:dataReady:formatDescription:numSamples:presentationTimeStamp:packetDescriptions:makeDataReadyHandler:)(OpaqueCMBlockBuffer *a1, char a2, const opaqueCMFormatDescription *a3, CMItemCount a4, CMTimeValue a5, unint64_t a6, CMTimeEpoch a7, const AudioStreamPacketDescription *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  CMTimeScale v12 = a6;
  sampleBufferOut[1] = *(CMSampleBufferRef *)MEMORY[0x1E4F143B8];
  sampleBufferOut[0] = 0;
  SInt64 mStartOffset = a8[1].mStartOffset;
  if (mStartOffset)
  {
    if (mStartOffset != a4) {
      __break(1u);
    }
    CMTimeValue v14 = a5;
    char v15 = a2;
    CMTimeEpoch v16 = a7;
    id v17 = a8 + 2;
  }
  else
  {
    CMTimeValue v14 = a5;
    char v15 = a2;
    CMTimeEpoch v16 = a7;
    id v17 = 0;
  }
  unint64_t v18 = HIDWORD(a6);
  CFAllocatorRef v19 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t v32 = a9;
  uint64_t v33 = a10;
  aBlock.CMTimeValue value = MEMORY[0x1E4F143A8];
  *(void *)&aBlock.CMTimeScale timescale = 1107296256;
  aBlock.CMTimeEpoch epoch = (CMTimeEpoch)thunk for @escaping @callee_guaranteed (@guaranteed CMSampleBufferRef) -> (@unowned Int32);
  unsigned __int8 v31 = &block_descriptor_3;
  makeOSStatus DataReadyHandler = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  aBlock.CMTimeValue value = v14;
  aBlock.CMTimeScale timescale = v12;
  aBlock.CMTimeFlags flags = v18;
  aBlock.CMTimeEpoch epoch = v16;
  OSStatus DataReadyHandler = CMAudioSampleBufferCreateWithPacketDescriptionsAndMakeDataReadyHandler(v19, a1, v15 & 1, a3, a4, &aBlock, v17, sampleBufferOut, makeDataReadyHandler);
  _Block_release(makeDataReadyHandler);
  CMSampleBufferRef v22 = sampleBufferOut[0];
  if (DataReadyHandler == noErr.getter())
  {
    uint64_t result = swift_bridgeObjectRelease();
    if (v22)
    {
      uint64_t v24 = *(void (**)(void))(a12 + 8);
      v25 = v22;
      v24();

      return swift_release();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    id v26 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v26 initWithDomain:*MEMORY[0x1E4F28760] code:DataReadyHandler userInfo:0];
    swift_willThrow();

    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

void _CMSampleBufferInitTrampoline.init(imageBuffer:formatDescription:sampleTiming:)(CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef formatDescription, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sampleBufferOut[1] = *(CMSampleBufferRef *)MEMORY[0x1E4F143B8];
  long long v8 = *(_OWORD *)(a3 + 48);
  *(_OWORD *)&sampleTiming.presentationTimeStamp.CMTimeScale timescale = *(_OWORD *)(a3 + 32);
  *(_OWORD *)&sampleTiming.decodeTimeStamp.CMTimeValue value = v8;
  sampleTiming.decodeTimeStamp.CMTimeEpoch epoch = *(void *)(a3 + 64);
  long long v9 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)&sampleTiming.duration.CMTimeValue value = *(_OWORD *)a3;
  *(_OWORD *)&sampleTiming.duration.CMTimeEpoch epoch = v9;
  sampleBufferOut[0] = 0;
  OSStatus v10 = CMSampleBufferCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x1E4F1CF80], imageBuffer, 1u, 0, 0, formatDescription, &sampleTiming, sampleBufferOut);
  CMSampleBufferRef v11 = sampleBufferOut[0];
  if (v10 == noErr.getter())
  {
    if (v11)
    {
      CMTimeScale v12 = *(void (**)(void))(a5 + 8);
      OSStatus v13 = v11;
      v12();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    id v14 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v14 initWithDomain:*MEMORY[0x1E4F28760] code:v10 userInfo:0];
    swift_willThrow();
  }
}

void _CMSampleBufferInitTrampoline.init(taggedBuffers:presentationTimeStamp:duration:formatDescription:)(uint64_t a1, CMTimeValue a2, unint64_t a3, CMTimeEpoch a4, CMTimeValue a5, unint64_t a6, CMTimeEpoch a7, const opaqueCMFormatDescription *a8, uint64_t a9, uint64_t a10)
{
  CMTimeScale v11 = a6;
  CMTimeScale v14 = a3;
  sBufOut[1] = *(CMSampleBufferRef *)MEMORY[0x1E4F143B8];
  unint64_t v16 = HIDWORD(a3);
  unint64_t v17 = HIDWORD(a6);
  sBufOut[0] = 0;
  unint64_t v18 = (OpaqueCMTaggedBufferGroup *)Array<A>.taggedBufferGroup.getter(a1);
  swift_bridgeObjectRelease();
  CFAllocatorRef v19 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  sbufPTS.CMTimeScale timescale = v14;
  sbufPTS.CMTimeFlags flags = v16;
  sbufPTS.CMTimeEpoch epoch = a4;
  sbufDuration.CMTimeValue value = a5;
  sbufDuration.CMTimeScale timescale = v11;
  sbufDuration.CMTimeFlags flags = v17;
  sbufDuration.CMTimeEpoch epoch = a7;
  sbufPTS.CMTimeValue value = a2;
  CMSampleBufferCreateForTaggedBufferGroup(v19, v18, &sbufPTS, &sbufDuration, a8, sBufOut);
  if (!sBufOut[0]) {
    __break(1u);
  }
  uint64_t v20 = *(void (**)(void))(a10 + 8);
  id v21 = sBufOut[0];
  v20();
}

uint64_t _CMSampleBufferInitTrampoline.init(imageBuffer:dataReady:formatDescription:sampleTiming:makeDataReadyHandler:)(__CVBuffer *a1, char a2, const opaqueCMFormatDescription *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sampleBufferOut[1] = *(CMSampleBufferRef *)MEMORY[0x1E4F143B8];
  long long v12 = *(_OWORD *)(a4 + 48);
  *(_OWORD *)&sampleTiming.presentationTimeStamp.CMTimeScale timescale = *(_OWORD *)(a4 + 32);
  *(_OWORD *)&sampleTiming.decodeTimeStamp.CMTimeValue value = v12;
  sampleTiming.decodeTimeStamp.CMTimeEpoch epoch = *(void *)(a4 + 64);
  long long v13 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)&sampleTiming.duration.CMTimeValue value = *(_OWORD *)a4;
  *(_OWORD *)&sampleTiming.duration.CMTimeEpoch epoch = v13;
  sampleBufferOut[0] = 0;
  CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  aBlock[4] = a5;
  aBlock[5] = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed CMSampleBufferRef) -> (@unowned Int32);
  aBlock[3] = &block_descriptor_6;
  char v15 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  OSStatus DataReadyHandler = CMSampleBufferCreateForImageBufferWithMakeDataReadyHandler(v14, a1, a2 & 1, a3, &sampleTiming, sampleBufferOut, v15);
  _Block_release(v15);
  CMSampleBufferRef v17 = sampleBufferOut[0];
  uint64_t result = noErr.getter();
  if (DataReadyHandler != result)
  {
    id v20 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v20 initWithDomain:*MEMORY[0x1E4F28760] code:DataReadyHandler userInfo:0];
    swift_willThrow();
    goto LABEL_5;
  }
  if (v17)
  {
    CFAllocatorRef v19 = *(void (**)(void))(a8 + 8);
    CMSampleBufferRef v17 = v17;
    v19();
LABEL_5:

    return swift_release();
  }
  __break(1u);
  return result;
}

void _CMSampleBufferInitTrampoline.init(copying:)(CMSampleBufferRef sbuf, uint64_t a2, uint64_t a3)
{
  sampleBufferOut[1] = *(CMSampleBufferRef *)MEMORY[0x1E4F143B8];
  sampleBufferOut[0] = 0;
  OSStatus Copy = CMSampleBufferCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], sbuf, sampleBufferOut);
  CMSampleBufferRef v6 = sampleBufferOut[0];
  if (Copy != noErr.getter())
  {
    id v9 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v9 initWithDomain:MEMORY[0x1E4F28760] code:Copy userInfo:0];
    swift_willThrow();

    goto LABEL_5;
  }
  if (v6)
  {
    uint64_t v7 = *(void (**)(void))(a3 + 8);
    long long v8 = v6;
    v7();

LABEL_5:
    return;
  }
  __break(1u);
}

void _CMSampleBufferInitTrampoline.init(copying:withNewTiming:)(CMSampleBufferRef originalSBuf, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sampleBufferOut[1] = *(CMSampleBufferRef *)MEMORY[0x1E4F143B8];
  sampleBufferOut[0] = 0;
  OSStatus CopyWithNewTiming = CMSampleBufferCreateCopyWithNewTiming((CFAllocatorRef)*MEMORY[0x1E4F1CF80], originalSBuf, *(void *)(a2 + 16), (const CMSampleTimingInfo *)(a2 + 32), sampleBufferOut);
  CMSampleBufferRef v7 = sampleBufferOut[0];
  if (CopyWithNewTiming != noErr.getter())
  {
    id v10 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v10 initWithDomain:*MEMORY[0x1E4F28760] code:CopyWithNewTiming userInfo:0];
    swift_willThrow();

    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  if (v7)
  {
    long long v8 = *(void (**)(void))(a4 + 8);
    id v9 = v7;
    v8();

LABEL_5:
    return;
  }
  __break(1u);
}

void _CMSampleBufferInitTrampoline.init(copying:forRange:)(CMSampleBufferRef sbuf, CFRange sampleRange, uint64_t a3, uint64_t a4)
{
  sampleBufferOut[1] = *(CMSampleBufferRef *)MEMORY[0x1E4F143B8];
  sampleBufferOut[0] = 0;
  CFIndex v4 = sampleRange.length - sampleRange.location;
  if (__OFSUB__(sampleRange.length, sampleRange.location)) {
    __break(1u);
  }
  CFIndex location = sampleRange.location;
  OSStatus v8 = CMSampleBufferCopySampleBufferForRange((CFAllocatorRef)*MEMORY[0x1E4F1CF80], sbuf, *(CFRange *)(&v4 - 1), sampleBufferOut);
  CMSampleBufferRef v9 = sampleBufferOut[0];
  if (v8 != noErr.getter())
  {
    id v12 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v12 initWithDomain:*MEMORY[0x1E4F28760] code:v8 userInfo:0];
    swift_willThrow();

    goto LABEL_6;
  }
  if (v9)
  {
    id v10 = *(void (**)(void))(a4 + 8);
    CMTimeScale v11 = v9;
    v10();

LABEL_6:
    return;
  }
  __break(1u);
}

id static CMSampleBufferRef.Error.allocationFailed.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for allocationFailed, (void **)&static CMSampleBufferRef.Error.allocationFailed);
}

id static CMSampleBufferRef.Error.requiredParameterMissing.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for requiredParameterMissing, (void **)&static CMSampleBufferRef.Error.requiredParameterMissing);
}

id one-time initialization function for alreadyHasDataBuffer()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:MEMORY[0x1E4F28760] code:-12732 userInfo:0];
  static CMSampleBufferRef.Error.alreadyHasDataBuffer = (uint64_t)result;
  return result;
}

id static CMSampleBufferRef.Error.alreadyHasDataBuffer.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for alreadyHasDataBuffer, (void **)&static CMSampleBufferRef.Error.alreadyHasDataBuffer);
}

id one-time initialization function for bufferNotReady()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:*MEMORY[0x1E4F28760] code:-12733 userInfo:0];
  static CMSampleBufferRef.Error.bufferNotReady = (uint64_t)result;
  return result;
}

id static CMSampleBufferRef.Error.bufferNotReady.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for bufferNotReady, (void **)&static CMSampleBufferRef.Error.bufferNotReady);
}

id one-time initialization function for sampleIndexOutOfRange()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 sel_initWithDomain_code_userInfo_:*MEMORY[0x1E4F28760] code:-12734 userInfo:0];
  static CMSampleBufferRef.Error.sampleIndexOutOfRange = (uint64_t)result;
  return result;
}

id static CMSampleBufferRef.Error.sampleIndexOutOfRange.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for sampleIndexOutOfRange, (void **)&static CMSampleBufferRef.Error.sampleIndexOutOfRange);
}

id one-time initialization function for bufferHasNoSampleSizes()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:MEMORY[0x1E4F28760] code:-12735 userInfo:0];
  static CMSampleBufferRef.Error.bufferHasNoSampleSizes = (uint64_t)result;
  return result;
}

id static CMSampleBufferRef.Error.bufferHasNoSampleSizes.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for bufferHasNoSampleSizes, (void **)&static CMSampleBufferRef.Error.bufferHasNoSampleSizes);
}

id one-time initialization function for bufferHasNoSampleTimingInfo()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 sel_initWithDomain_code_userInfo_:*MEMORY[0x1E4F28760] code:-12736 userInfo:0];
  static CMSampleBufferRef.Error.bufferHasNoSampleTimingInfo = (uint64_t)result;
  return result;
}

id static CMSampleBufferRef.Error.bufferHasNoSampleTimingInfo.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for bufferHasNoSampleTimingInfo, (void **)&static CMSampleBufferRef.Error.bufferHasNoSampleTimingInfo);
}

id one-time initialization function for arrayTooSmall()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:MEMORY[0x1E4F28760] code:-12737 userInfo:0];
  static CMSampleBufferRef.Error.arrayTooSmall = (uint64_t)result;
  return result;
}

id static CMSampleBufferRef.Error.arrayTooSmall.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for arrayTooSmall, (void **)&static CMSampleBufferRef.Error.arrayTooSmall);
}

id one-time initialization function for invalidEntryCount()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:*MEMORY[0x1E4F28760] code:-12738 userInfo:0];
  static CMSampleBufferRef.Error.invalidEntryCMItemCount Count = (uint64_t)result;
  return result;
}

id static CMSampleBufferRef.Error.invalidEntryCount.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for invalidEntryCount, (void **)&static CMSampleBufferRef.Error.invalidEntryCount);
}

id one-time initialization function for cannotSubdivide()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 sel_initWithDomain_code_userInfo_:*MEMORY[0x1E4F28760] code:-12739 userInfo:0];
  static CMSampleBufferRef.Error.cannotSubdivide = (uint64_t)result;
  return result;
}

id static CMSampleBufferRef.Error.cannotSubdivide.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for cannotSubdivide, (void **)&static CMSampleBufferRef.Error.cannotSubdivide);
}

id one-time initialization function for sampleTimingInfoInvalid()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 sel_initWithDomain_code_userInfo_:MEMORY[0x1E4F28760] code:-12740 userInfo:0];
  static CMSampleBufferRef.Error.sampleTimingInfoInvalid = (uint64_t)result;
  return result;
}

id static CMSampleBufferRef.Error.sampleTimingInfoInvalid.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for sampleTimingInfoInvalid, (void **)&static CMSampleBufferRef.Error.sampleTimingInfoInvalid);
}

id one-time initialization function for invalidMediaTypeForOperation()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:*MEMORY[0x1E4F28760] code:-12741 userInfo:0];
  static CMSampleBufferRef.Error.invalidMediaTypeForOperation = (uint64_t)result;
  return result;
}

id static CMSampleBufferRef.Error.invalidMediaTypeForOperation.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for invalidMediaTypeForOperation, (void **)&static CMSampleBufferRef.Error.invalidMediaTypeForOperation);
}

id one-time initialization function for invalidSampleData()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:*MEMORY[0x1E4F28760] code:-12742 userInfo:0];
  static CMSampleBufferRef.Error.invalidSampleData = (uint64_t)result;
  return result;
}

id static CMSampleBufferRef.Error.invalidSampleData.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for invalidSampleData, (void **)&static CMSampleBufferRef.Error.invalidSampleData);
}

id one-time initialization function for invalidMediaFormat()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:MEMORY[0x1E4F28760] code:-12743 userInfo:0];
  static CMSampleBufferRef.Error.invalidMediaFormat = (uint64_t)result;
  return result;
}

id static CMSampleBufferRef.Error.invalidMediaFormat.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for invalidMediaFormat, (void **)&static CMSampleBufferRef.Error.invalidMediaFormat);
}

id one-time initialization function for invalidated()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:MEMORY[0x1E4F28760] code:-12744 userInfo:0];
  static CMSampleBufferRef.Error.invalidated = (uint64_t)result;
  return result;
}

id static CMSampleBufferRef.Error.invalidated.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for invalidated, (void **)&static CMSampleBufferRef.Error.invalidated);
}

id one-time initialization function for dataFailed()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:*MEMORY[0x1E4F28760] code:-16750 userInfo:0];
  static CMSampleBufferRef.Error.dataFailed = (uint64_t)result;
  return result;
}

{
  static CMSampleBufferRef.dataFailed = *MEMORY[0x1E4F1F3B0];
  return (id)static CMSampleBufferRef.dataFailed;
}

id static CMSampleBufferRef.Error.dataFailed.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for dataFailed, (void **)&static CMSampleBufferRef.Error.dataFailed);
}

id one-time initialization function for dataCanceled()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 init:*MEMORY[0x1E4F28760] code:-16751 userInfo:0];
  static CMSampleBufferRef.Error.dataCanceled = (uint64_t)result;
  return result;
}

id static CMSampleBufferRef.Error.dataCanceled.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for dataCanceled, (void **)&static CMSampleBufferRef.Error.dataCanceled);
}

uint64_t CMSampleBufferRef.Flags.rawValue.getter()
{
  return *v0;
}

uint64_t CMSampleBufferRef.Flags.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static CMSampleBufferRef.Flags.audioBufferListAssure16ByteAlignment.getter(_DWORD *a1@<X8>)
{
  *a1 = 1;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMSampleBufferRef.setDataBuffer(_:)(CMBlockBufferRef a1)
{
}

CMBlockBufferRef CMSampleBufferRef.dataBuffer.getter()
{
  CMBlockBufferRef DataBuffer = CMSampleBufferGetDataBuffer(v0);

  return DataBuffer;
}

CVImageBufferRef CMSampleBufferRef.imageBuffer.getter()
{
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(v0);

  return ImageBuffer;
}

char *CMSampleBufferRef.taggedBuffers.getter()
{
  int64_t v1 = CMSampleBufferGetTaggedBufferGroup(v0);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  int64_t v3 = specialized Array<A>.init(taggedBufferGroup:)(v1);

  return v3;
}

uint64_t CMSampleBufferRef.setDataBuffer(fromAudioBufferList:blockBufferMemoryAllocator:flags:)(AudioBufferList *bufferList, CFAllocatorRef blockBufferBlockAllocator, uint32_t *a3)
{
  OSStatus v4 = CMSampleBufferSetDataBufferFromAudioBufferList(v3, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], blockBufferBlockAllocator, *a3, bufferList);
  uint64_t result = noErr.getter();
  if (v4 != result)
  {
    id v6 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v6 initWithDomain:*MEMORY[0x1E4F28760] code:v4 userInfo:0];
    return swift_willThrow();
  }
  return result;
}

uint64_t CMSampleBufferRef.withAudioBufferList<A>(blockBufferMemoryAllocator:flags:body:)(const __CFAllocator *a1, uint32_t *a2, void (*a3)(char *, OpaqueCMBlockBuffer *), uint64_t a4)
{
  v22[1] = a4;
  uint64_t v23 = a3;
  blockBufferOut[1] = *(CMBlockBufferRef *)MEMORY[0x1E4F143B8];
  uint64_t v8 = type metadata accessor for UnsafeMutableAudioBufferListPointer();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  CMTimeScale v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint32_t v12 = *a2;
  size_t bufferListSizeNeededOut = 0;
  OSStatus AudioBufferListWithRetainedBlockBuffer = CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(v4, &bufferListSizeNeededOut, 0, 0, 0, 0, v12, 0);
  if (AudioBufferListWithRetainedBlockBuffer != noErr.getter())
  {
    id v20 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v20 initWithDomain:*MEMORY[0x1E4F28760] code:AudioBufferListWithRetainedBlockBuffer userInfo:0];
    return swift_willThrow();
  }
  v22[0] = v5;
  size_t v14 = bufferListSizeNeededOut;
  char v15 = (AudioBufferList *)swift_slowAlloc();
  blockBufferOut[0] = 0;
  OSStatus v16 = CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(v4, 0, v15, v14, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], a1, v12, blockBufferOut);
  CMBlockBufferRef v17 = blockBufferOut[0];
  if (v16 != noErr.getter())
  {
    id v21 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v21 initWithDomain:*MEMORY[0x1E4F28760] code:v16 userInfo:0];
    swift_willThrow();

    return MEMORY[0x1C188EB00](v15, -1, -1);
  }
  uint64_t result = UnsafeMutableAudioBufferListPointer.init(_:)();
  if (v17)
  {
    CFAllocatorRef v19 = v17;
    v23(v11, v19);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

    return MEMORY[0x1C188EB00](v15, -1, -1);
  }
  __break(1u);
  return result;
}

uint64_t CMSampleBufferRef.audioStreamPacketDescriptions()()
{
  int64_t v1 = v0;
  v9[1] = *MEMORY[0x1E4F143B8];
  v9[0] = 0;
  uint64_t AudioStreamPacketDescriptions = CMSampleBufferGetAudioStreamPacketDescriptions(v0, 0, 0, v9);
  if (AudioStreamPacketDescriptions != noErr.getter())
  {
    id v5 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v5 initWithDomain:*MEMORY[0x1E4F28760] code:(int)AudioStreamPacketDescriptions userInfo:0];
    swift_willThrow();
    return AudioStreamPacketDescriptions;
  }
  int64_t v3 = v9[0] + 15;
  if ((v9[0] & 0x8000000000000000) == 0) {
    int64_t v3 = v9[0];
  }
  if ((uint64_t)v9[0] < -15)
  {
    __break(1u);
    goto LABEL_14;
  }
  if ((uint64_t)v9[0] <= 15)
  {
    uint64_t AudioStreamPacketDescriptions = MEMORY[0x1E4FBC860];
    unint64_t v4 = *(void *)(MEMORY[0x1E4FBC860] + 16);
  }
  else
  {
    unint64_t v4 = v3 >> 4;
    type metadata accessor for AudioStreamPacketDescription(0);
    uint64_t AudioStreamPacketDescriptions = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(AudioStreamPacketDescriptions + 16) = v4;
    bzero((void *)(AudioStreamPacketDescriptions + 32), 16 * v4);
  }
  if (v4 >> 59) {
LABEL_14:
  }
    __break(1u);
  OSStatus v6 = CMSampleBufferGetAudioStreamPacketDescriptions(v1, 16 * v4, (AudioStreamPacketDescription *)(AudioStreamPacketDescriptions + 32), 0);
  if (v6 != noErr.getter())
  {
    id v7 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v7 initWithDomain:*MEMORY[0x1E4F28760] code:v6 userInfo:0];
    swift_willThrow();
    swift_bridgeObjectRelease();
  }
  return AudioStreamPacketDescriptions;
}

uint64_t CMSampleBufferRef.withUnsafeAudioStreamPacketDescriptions<A>(_:)(uint64_t (*a1)(AudioStreamPacketDescription *, uint64_t))
{
  packetDescriptionsPointerOut[1] = *(AudioStreamPacketDescription **)MEMORY[0x1E4F143B8];
  size_t packetDescriptionsSizeOut = 0;
  packetDescriptionsPointerOut[0] = 0;
  OSStatus AudioStreamPacketDescriptionsPtr = CMSampleBufferGetAudioStreamPacketDescriptionsPtr(v1, (const AudioStreamPacketDescription **)packetDescriptionsPointerOut, &packetDescriptionsSizeOut);
  if (AudioStreamPacketDescriptionsPtr == noErr.getter()) {
    return a1(packetDescriptionsPointerOut[0], (uint64_t)packetDescriptionsSizeOut / 16);
  }
  id v5 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  [v5 initWithDomain:MEMORY[0x1E4F28760] code:AudioStreamPacketDescriptionsPtr userInfo:0];
  return swift_willThrow();
}

uint64_t CMSampleBufferRef.copyPCMData(fromRange:into:)(uint64_t frameOffset, uint64_t a2, AudioBufferList *bufferList)
{
  if (frameOffset != (int)frameOffset) {
    goto LABEL_4;
  }
  uint64_t v5 = a2 - frameOffset;
  if (__OFSUB__(a2, frameOffset))
  {
    __break(1u);
    return frameOffset;
  }
  if (v5 != (int)v5)
  {
LABEL_4:
    if (one-time initialization token for sampleIndexOutOfRange != -1) {
      swift_once();
    }
    id v6 = (id)static CMSampleBufferRef.Error.sampleIndexOutOfRange;
    return swift_willThrow();
  }
  OSStatus v7 = CMSampleBufferCopyPCMDataIntoAudioBufferList(v3, frameOffset, v5, bufferList);
  frameOffset = noErr.getter();
  if (v7 != frameOffset)
  {
    id v8 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v8 initWithDomain:*MEMORY[0x1E4F28760] code:v7 userInfo:0];
    return swift_willThrow();
  }
  return frameOffset;
}

void CMSampleBufferRef.DataReadiness.hash(into:)()
{
  Swift::UInt32 v1 = *(_DWORD *)v0;
  if (*(unsigned char *)(v0 + 4) == 1)
  {
    Hasher._combine(_:)(v1 != 0);
  }
  else
  {
    Hasher._combine(_:)(2uLL);
    Hasher._combine(_:)(v1);
  }
}

uint64_t static CMSampleBufferRef.DataReadiness.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(unsigned __int8 *)(a2 + 4);
  unsigned int v3 = (*(_DWORD *)a1 == *(_DWORD *)a2) & ~v2;
  if (*(_DWORD *)a2) {
    unsigned int v4 = *(unsigned __int8 *)(a2 + 4);
  }
  else {
    unsigned int v4 = 0;
  }
  if (*(_DWORD *)a2) {
    unsigned int v2 = 0;
  }
  if (*(_DWORD *)a1) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = v2;
  }
  if (*(unsigned char *)(a1 + 4) == 1) {
    return v5;
  }
  else {
    return v3;
  }
}

Swift::Int CMSampleBufferRef.DataReadiness.hashValue.getter()
{
  Swift::UInt32 v1 = *(_DWORD *)v0;
  int v2 = *(unsigned __int8 *)(v0 + 4);
  Hasher.init(_seed:)();
  if (v2 == 1)
  {
    Hasher._combine(_:)(v1 != 0);
  }
  else
  {
    Hasher._combine(_:)(2uLL);
    Hasher._combine(_:)(v1);
  }
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CMSampleBufferRef.DataReadiness()
{
  Swift::UInt32 v1 = *(_DWORD *)v0;
  int v2 = *(unsigned __int8 *)(v0 + 4);
  Hasher.init(_seed:)();
  if (v2 == 1)
  {
    Hasher._combine(_:)(v1 != 0);
  }
  else
  {
    Hasher._combine(_:)(2uLL);
    Hasher._combine(_:)(v1);
  }
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance CMSampleBufferRef.DataReadiness()
{
  Swift::UInt32 v1 = *(_DWORD *)v0;
  if (*(unsigned char *)(v0 + 4) == 1)
  {
    Hasher._combine(_:)(v1 != 0);
  }
  else
  {
    Hasher._combine(_:)(2uLL);
    Hasher._combine(_:)(v1);
  }
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CMSampleBufferRef.DataReadiness()
{
  Swift::UInt32 v1 = *(_DWORD *)v0;
  int v2 = *(unsigned __int8 *)(v0 + 4);
  Hasher.init(_seed:)();
  if (v2 == 1)
  {
    Hasher._combine(_:)(v1 != 0);
  }
  else
  {
    Hasher._combine(_:)(2uLL);
    Hasher._combine(_:)(v1);
  }
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance CMSampleBufferRef.DataReadiness(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(unsigned __int8 *)(a2 + 4);
  unsigned int v3 = (*(_DWORD *)a1 == *(_DWORD *)a2) & ~v2;
  if (*(_DWORD *)a2) {
    unsigned int v4 = *(unsigned __int8 *)(a2 + 4);
  }
  else {
    unsigned int v4 = 0;
  }
  if (*(_DWORD *)a2) {
    unsigned int v2 = 0;
  }
  if (*(_DWORD *)a1) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = v2;
  }
  if (*(unsigned char *)(a1 + 4) == 1) {
    return v5;
  }
  else {
    return v3;
  }
}

uint64_t CMSampleBufferRef.dataReadiness.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OSStatus statusOut = noErr.getter();
  uint64_t result = CMSampleBufferDataIsReady(v1);
  if (result)
  {
    OSStatus v4 = 1;
    BOOL v5 = 1;
  }
  else
  {
    uint64_t result = CMSampleBufferHasDataFailed(v1, &statusOut);
    BOOL v5 = result == 0;
    OSStatus v4 = statusOut;
    if (!result) {
      OSStatus v4 = 0;
    }
  }
  *(_DWORD *)a1 = v4;
  *(unsigned char *)(a1 + 4) = v5;
  return result;
}

uint64_t CMSampleBufferRef.setDataReadiness(_:)(uint64_t a1)
{
  OSStatus v2 = *(_DWORD *)a1;
  int v3 = *(unsigned __int8 *)(a1 + 4);
  uint64_t result = noErr.getter();
  if (v3 == 1)
  {
    if (!v2)
    {
      __break(1u);
      return result;
    }
    OSStatus v5 = CMSampleBufferSetDataReady(v1);
  }
  else
  {
    OSStatus v5 = CMSampleBufferSetDataFailed(v1, v2);
  }
  OSStatus v6 = v5;
  uint64_t result = noErr.getter();
  if (v6 != result)
  {
    id v7 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v7 initWithDomain:MEMORY[0x1E4F28760] code:v6 userInfo:0];
    return swift_willThrow();
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMSampleBufferRef.makeDataReady()()
{
  OSStatus DataReady = CMSampleBufferMakeDataReady(v0);
  if (DataReady != noErr.getter())
  {
    id v2 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v2 initWithDomain:*MEMORY[0x1E4F28760] code:DataReady userInfo:0];
    swift_willThrow();
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMSampleBufferRef.trackDataReadiness(_:)(CMSampleBufferRef a1)
{
}

uint64_t CMSampleBufferRef.setDataBuffer(_:)(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  int v3 = a2(v2, a1);
  uint64_t result = noErr.getter();
  if (v3 != result)
  {
    id v5 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v5 initWithDomain:*MEMORY[0x1E4F28760] code:v3 userInfo:0];
    return swift_willThrow();
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMSampleBufferRef.invalidate()()
{
  OSStatus v1 = CMSampleBufferInvalidate(v0);
  if (one-time initialization token for tlsKey != -1) {
    swift_once();
  }
  pthread_key_t v2 = static BoxedError.tlsKey;
  int v3 = (id *)pthread_getspecific(static BoxedError.tlsKey);
  if (v3)
  {
    OSStatus v4 = v3;
    pthread_setspecific(v2, 0);
    id v5 = v4[2];
    swift_release();
  }
  else
  {
    if (v1 == noErr.getter()) {
      return;
    }
    id v6 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v6 initWithDomain:MEMORY[0x1E4F28760] code:v1 userInfo:0];
  }
  swift_willThrow();
}

uint64_t CMSampleBufferRef.setInvalidateHandler(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  v10[4] = partial apply for closure #1 in closure #1 in CMSampleBufferRef.setInvalidateHandler(_:);
  v10[5] = v5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 1107296256;
  v10[2] = thunk for @escaping @callee_guaranteed (@guaranteed CMSampleBufferRef) -> ();
  void v10[3] = &block_descriptor_9;
  id v6 = _Block_copy(v10);
  swift_retain();
  swift_release();
  OSStatus v7 = CMSampleBufferSetInvalidateHandler(v2, v6);
  _Block_release(v6);
  uint64_t result = noErr.getter();
  if (v7 != result)
  {
    id v9 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v9 initWithDomain:*MEMORY[0x1E4F28760] code:v7 userInfo:0];
    return swift_willThrow();
  }
  return result;
}

uint64_t closure #1 in closure #1 in CMSampleBufferRef.setInvalidateHandler(_:)(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

void thunk for @escaping @callee_guaranteed (@guaranteed CMSampleBufferRef) -> ()(uint64_t a1, void *a2)
{
  int v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

BOOL CMSampleBufferRef.isValid.getter()
{
  return CMSampleBufferIsValid(v0) != 0;
}

CMItemCount CMSampleBufferRef.numSamples.getter()
{
  return CMSampleBufferGetNumSamples(v0);
}

uint64_t CMSampleBufferRef.duration.getter()
{
  return CMSampleBufferRef.duration.getter(MEMORY[0x1E4F1EA90]);
}

uint64_t CMSampleBufferRef.presentationTimeStamp.getter()
{
  return CMSampleBufferRef.duration.getter(MEMORY[0x1E4F1EAB8]);
}

uint64_t CMSampleBufferRef.decodeTimeStamp.getter()
{
  return CMSampleBufferRef.duration.getter(MEMORY[0x1E4F1EA88]);
}

uint64_t CMSampleBufferRef.outputDuration.getter()
{
  return CMSampleBufferRef.duration.getter(MEMORY[0x1E4F1EAA0]);
}

uint64_t CMSampleBufferRef.outputPresentationTimeStamp.getter()
{
  return CMSampleBufferRef.duration.getter(MEMORY[0x1E4F1EAA8]);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMSampleBufferRef.setOutputPresentationTimeStamp(_:)(CMTime a1)
{
  CMTime outputPresentationTimeStamp = a1;
  OSStatus v2 = CMSampleBufferSetOutputPresentationTimeStamp(v1, &outputPresentationTimeStamp);
  if (v2 != noErr.getter())
  {
    id v3 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v3 initWithDomain:MEMORY[0x1E4F28760] code:v2 userInfo:0];
    swift_willThrow();
  }
}

uint64_t CMSampleBufferRef.outputDecodeTimeStamp.getter()
{
  return CMSampleBufferRef.duration.getter(MEMORY[0x1E4F1EA98]);
}

uint64_t CMSampleBufferRef.duration.getter(void (*a1)(uint64_t *__return_ptr, uint64_t))
{
  a1(&v3, v1);
  return v3;
}

uint64_t CMSampleBufferRef.sampleTimingInfos()()
{
  return CMSampleBufferRef.sampleTimingInfos()(MEMORY[0x1E4F1EAC0]);
}

uint64_t CMSampleBufferRef.outputSampleTimingInfos()()
{
  return CMSampleBufferRef.sampleTimingInfos()(MEMORY[0x1E4F1EAB0]);
}

uint64_t CMSampleBufferRef.sampleTimingInfos()(uint64_t (*a1)(void))
{
  uint64_t v9 = *MEMORY[0x1E4F1FA70];
  uint64_t v10 = *(void *)(MEMORY[0x1E4F1FA70] + 8);
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
  uint64_t v12 = *(void *)(MEMORY[0x1E4F1FA70] + 32);
  long long v13 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 40);
  uint64_t v14 = *(void *)(MEMORY[0x1E4F1FA70] + 56);
  uint64_t v15 = *(void *)(MEMORY[0x1E4F1FA70] + 64);
  uint64_t v2 = a1();
  if (v2 == -12736) {
    return MEMORY[0x1E4FBC860];
  }
  uint64_t v3 = v2;
  if (v2 == noErr.getter())
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CMSampleTimingInfo>);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_1BE225570;
    *(void *)(v3 + 32) = v9;
    *(void *)(v3 + 40) = v10;
    *(_OWORD *)(v3 + 48) = v11;
    *(void *)(v3 + 64) = v12;
    *(_OWORD *)(v3 + 72) = v13;
    *(void *)(v3 + 88) = v14;
    *(void *)(v3 + 96) = v15;
  }
  else
  {
    if (v3 == -12737) {
      uint64_t v3 = noErr.getter();
    }
    if (v3 == noErr.getter())
    {
      uint64_t v3 = MEMORY[0x1E4FBC860];
      int v5 = ((uint64_t (*)(uint64_t, void, uint64_t, void))a1)(v1, *(void *)(MEMORY[0x1E4FBC860] + 16), MEMORY[0x1E4FBC860] + 32, 0);
      if (v5 != noErr.getter())
      {
        id v6 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
        [v6 initWithDomain:*MEMORY[0x1E4F28760] code:v5 userInfo:0];
        swift_willThrow();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      id v4 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
      [v4 initWithDomain:MEMORY[0x1E4F28760] code:v3 userInfo:0];
      swift_willThrow();
    }
  }
  return v3;
}

void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMSampleBufferRef.sampleTimingInfo(at:)(__C::CMSampleTimingInfo *__return_ptr retstr, Swift::Int at)
{
  uint64_t v3 = v2;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  CMTimeEpoch v5 = *(void *)(MEMORY[0x1E4F1FA70] + 64);
  v14.duration.CMTimeValue value = *MEMORY[0x1E4F1FA70];
  *(void *)&v14.duration.CMTimeScale timescale = *(void *)(MEMORY[0x1E4F1FA70] + 8);
  *(_OWORD *)&v14.duration.CMTimeEpoch epoch = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
  *(void *)&v14.presentationTimeStamp.CMTimeScale timescale = *(void *)(MEMORY[0x1E4F1FA70] + 32);
  *(_OWORD *)&v14.presentationTimeStamp.CMTimeEpoch epoch = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 40);
  *(void *)&v14.decodeTimeStamp.CMTimeScale timescale = *(void *)(MEMORY[0x1E4F1FA70] + 56);
  v14.decodeTimeStamp.CMTimeEpoch epoch = v5;
  OSStatus SampleTimingInfo = CMSampleBufferGetSampleTimingInfo(v3, at, &v14);
  if (SampleTimingInfo == noErr.getter())
  {
    CMTimeEpoch epoch = v14.decodeTimeStamp.epoch;
    uint64_t v8 = *(void *)&v14.duration.timescale;
    uint64_t v9 = *(void *)&v14.presentationTimeStamp.timescale;
    uint64_t v10 = *(void *)&v14.decodeTimeStamp.timescale;
    long long v11 = *(_OWORD *)&v14.duration.epoch;
    long long v12 = *(_OWORD *)&v14.presentationTimeStamp.epoch;
    retstr->duration.CMTimeValue value = v14.duration.value;
    *(void *)&retstr->duration.CMTimeScale timescale = v8;
    *(_OWORD *)&retstr->duration.CMTimeEpoch epoch = v11;
    *(void *)&retstr->presentationTimeStamp.CMTimeScale timescale = v9;
    *(_OWORD *)&retstr->presentationTimeStamp.CMTimeEpoch epoch = v12;
    *(void *)&retstr->decodeTimeStamp.CMTimeScale timescale = v10;
    retstr->decodeTimeStamp.CMTimeEpoch epoch = epoch;
  }
  else
  {
    id v13 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v13 initWithDomain:*MEMORY[0x1E4F28760] code:SampleTimingInfo userInfo:0];
    swift_willThrow();
  }
}

uint64_t CMSampleBufferRef.sampleSizes()()
{
  uint64_t v1 = v0;
  sizeArrayEntriesNeededOut[1] = *MEMORY[0x1E4F143B8];
  size_t sizeArrayOut = 0;
  sizeArrayEntriesNeededOut[0] = 0;
  OSStatus SampleSizeArray = CMSampleBufferGetSampleSizeArray(v0, 1, &sizeArrayOut, sizeArrayEntriesNeededOut);
  uint64_t v3 = MEMORY[0x1E4FBC860];
  if (SampleSizeArray != -12736)
  {
    int v4 = SampleSizeArray;
    if (SampleSizeArray == noErr.getter())
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Int>);
      uint64_t v3 = swift_allocObject();
      *(_OWORD *)(v3 + 16) = xmmword_1BE225570;
      *(void *)(v3 + 32) = sizeArrayOut;
    }
    else
    {
      if (v4 == -12737) {
        int v4 = noErr.getter();
      }
      if (v4 == noErr.getter())
      {
        CMItemCount v5 = sizeArrayEntriesNeededOut[0];
        if (sizeArrayEntriesNeededOut[0] < 0) {
          __break(1u);
        }
        if (sizeArrayEntriesNeededOut[0])
        {
          uint64_t v3 = static Array._allocateBufferUninitialized(minimumCapacity:)();
          *(void *)(v3 + 16) = v5;
          bzero((void *)(v3 + 32), 8 * v5);
        }
        else
        {
          CMItemCount v5 = *(void *)(v3 + 16);
        }
        OSStatus v7 = CMSampleBufferGetSampleSizeArray(v1, v5, (size_t *)(v3 + 32), 0);
        if (v7 != noErr.getter())
        {
          id v8 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
          [v8 initWithDomain:*MEMORY[0x1E4F28760] code:v7 userInfo:0];
          swift_willThrow();
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        id v6 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
        [v6 initWithDomain:MEMORY[0x1E4F28760] code:v4 userInfo:0];
        swift_willThrow();
      }
    }
  }
  return v3;
}

Swift::Int __swiftcall CMSampleBufferRef.sampleSize(at:)(Swift::Int at)
{
  return CMSampleBufferGetSampleSize(v1, at);
}

size_t CMSampleBufferRef.totalSampleSize.getter()
{
  return CMSampleBufferGetTotalSampleSize(v0);
}

CMFormatDescriptionRef CMSampleBufferRef.formatDescription.getter()
{
  CMFormatDescriptionRef FormatDescription = CMSampleBufferGetFormatDescription(v0);

  return FormatDescription;
}

uint64_t (*CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

id one-time initialization function for notSync()
{
  static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync = *MEMORY[0x1E4F1F200];
  return (id)static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync;
}

id static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for notSync, (void **)&static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync, a1);
}

id one-time initialization function for partialSync()
{
  static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.partialSync = *MEMORY[0x1E4F1F208];
  return (id)static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.partialSync;
}

id static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.partialSync.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for partialSync, (void **)&static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.partialSync, a1);
}

id one-time initialization function for hasRedundantCoding()
{
  static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hasRedundantCoding = *MEMORY[0x1E4F1F1F0];
  return (id)static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hasRedundantCoding;
}

id static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hasRedundantCoding.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for hasRedundantCoding, (void **)&static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hasRedundantCoding, a1);
}

id one-time initialization function for isDependedOnByOthers()
{
  static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.isDependedOnByOthers = *MEMORY[0x1E4F1F1F8];
  return (id)static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.isDependedOnByOthers;
}

id static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.isDependedOnByOthers.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for isDependedOnByOthers, (void **)&static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.isDependedOnByOthers, a1);
}

id one-time initialization function for dependsOnOthers()
{
  static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.dependsOnOthers = *MEMORY[0x1E4F1F1A8];
  return (id)static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.dependsOnOthers;
}

id static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.dependsOnOthers.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for dependsOnOthers, (void **)&static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.dependsOnOthers, a1);
}

id one-time initialization function for earlierDisplayTimesAllowed()
{
  static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.earlierDisplayTimesAllowed = *MEMORY[0x1E4F1F1C0];
  return (id)static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.earlierDisplayTimesAllowed;
}

id static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.earlierDisplayTimesAllowed.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for earlierDisplayTimesAllowed, (void **)&static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.earlierDisplayTimesAllowed, a1);
}

id one-time initialization function for displayImmediately()
{
  static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.displayImmediately = *MEMORY[0x1E4F1F1B0];
  return (id)static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.displayImmediately;
}

id static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.displayImmediately.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for displayImmediately, (void **)&static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.displayImmediately, a1);
}

id one-time initialization function for doNotDisplay()
{
  static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.doNotDisplay = *MEMORY[0x1E4F1F1B8];
  return (id)static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.doNotDisplay;
}

id static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.doNotDisplay.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for doNotDisplay, (void **)&static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.doNotDisplay, a1);
}

id one-time initialization function for hevcTemporalLevelInfo()
{
  static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcTemporalLevelInfo = *MEMORY[0x1E4F1F1E0];
  return (id)static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcTemporalLevelInfo;
}

id static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcTemporalLevelInfo.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for hevcTemporalLevelInfo, (void **)&static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcTemporalLevelInfo, a1);
}

id one-time initialization function for hevcTemporalSubLayerAccess()
{
  static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcTemporalSubLayerAccess = *MEMORY[0x1E4F1F1E8];
  return (id)static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcTemporalSubLayerAccess;
}

id static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcTemporalSubLayerAccess.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for hevcTemporalSubLayerAccess, (void **)&static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcTemporalSubLayerAccess, a1);
}

id one-time initialization function for hevcStepwiseTemporalSubLayerAccess()
{
  static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcStepwiseTemporalSubLayerAccess = *MEMORY[0x1E4F1F1D0];
  return (id)static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcStepwiseTemporalSubLayerAccess;
}

id static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcStepwiseTemporalSubLayerAccess.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for hevcStepwiseTemporalSubLayerAccess, (void **)&static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcStepwiseTemporalSubLayerAccess, a1);
}

id one-time initialization function for hevcSyncSampleNALUnitType()
{
  static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcSyncSampleNALUnitType = *MEMORY[0x1E4F1F1D8];
  return (id)static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcSyncSampleNALUnitType;
}

id static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcSyncSampleNALUnitType.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for hevcSyncSampleNALUnitType, (void **)&static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.hevcSyncSampleNALUnitType, a1);
}

id one-time initialization function for audioIndependentSampleDecoderRefreshCount()
{
  static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.audioIndependentSampleDecoderRefreshCMItemCount Count = *MEMORY[0x1E4F1F188];
  return (id)static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.audioIndependentSampleDecoderRefreshCount;
}

id static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.audioIndependentSampleDecoderRefreshCount.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for audioIndependentSampleDecoderRefreshCount, (void **)&static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.audioIndependentSampleDecoderRefreshCount, a1);
}

id CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator.next()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v5 = v1[2];
  int64_t v4 = v1[3];
  int64_t v6 = v4;
  unint64_t v7 = v1[4];
  if (v7)
  {
    uint64_t v8 = (v7 - 1) & v7;
    unint64_t v9 = __clz(__rbit64(v7)) | (v4 << 6);
LABEL_3:
    uint64_t v10 = *(void **)(*(void *)(v2 + 48) + 8 * v9);
    *(void *)a1 = v10;
    outlined init with copy of Any(*(void *)(v2 + 56) + 32 * v9, a1 + 8);
    id result = v10;
LABEL_21:
    *uint64_t v1 = v2;
    v1[1] = v3;
    pthread_key_t v1[2] = v5;
    v1[3] = v6;
    v1[4] = v8;
    return result;
  }
  int64_t v12 = v4 + 1;
  if (!__OFADD__(v4, 1))
  {
    int64_t v13 = (unint64_t)(v5 + 64) >> 6;
    if (v12 < v13)
    {
      unint64_t v14 = *(void *)(v3 + 8 * v12);
      if (v14)
      {
LABEL_7:
        uint64_t v8 = (v14 - 1) & v14;
        unint64_t v9 = __clz(__rbit64(v14)) + (v12 << 6);
        int64_t v6 = v12;
        goto LABEL_3;
      }
      int64_t v6 = v4 + 1;
      if (v4 + 2 < v13)
      {
        unint64_t v14 = *(void *)(v3 + 8 * (v4 + 2));
        if (v14)
        {
          int64_t v12 = v4 + 2;
          goto LABEL_7;
        }
        int64_t v6 = v4 + 2;
        if (v4 + 3 < v13)
        {
          unint64_t v14 = *(void *)(v3 + 8 * (v4 + 3));
          if (v14)
          {
            int64_t v12 = v4 + 3;
            goto LABEL_7;
          }
          int64_t v12 = v4 + 4;
          int64_t v6 = v4 + 3;
          if (v4 + 4 < v13)
          {
            unint64_t v14 = *(void *)(v3 + 8 * v12);
            if (v14) {
              goto LABEL_7;
            }
            int64_t v6 = v13 - 1;
            int64_t v15 = v4 + 5;
            while (v13 != v15)
            {
              unint64_t v14 = *(void *)(v3 + 8 * v15++);
              if (v14)
              {
                int64_t v12 = v15 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
    uint64_t v8 = 0;
    *(void *)(a1 + 32) = 0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

void CMSampleBufferRef.PerSampleAttachmentsDictionary.makeIterator()(void *a1@<X8>)
{
  CFIndex v3 = *(void *)(v1 + 8);
  CFArrayRef v4 = CMSampleBufferGetSampleAttachmentsArray(*(CMSampleBufferRef *)v1, 0);
  if (v4)
  {
    ValueAtIndex = (void *)CFArrayGetValueAtIndex(v4, v3);
    if (ValueAtIndex)
    {
      id v6 = ValueAtIndex;
      lazy protocol witness table accessor for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key();
      v6;
      static Dictionary._forceBridgeFromObjectiveC(_:result:)();
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  else
  {
    uint64_t v7 = -1;
    uint64_t v8 = MEMORY[0x1E4FBC868] + 64;
    uint64_t v9 = -1 << *(unsigned char *)(MEMORY[0x1E4FBC868] + 32);
    if (-v9 < 64) {
      uint64_t v7 = ~(-1 << -(char)v9);
    }
    uint64_t v10 = v7 & *(void *)(MEMORY[0x1E4FBC868] + 64);
    *a1 = MEMORY[0x1E4FBC868];
    a1[1] = v8;
    a1[2] = ~v9;
    a1[3] = 0;
    a1[4] = v10;
  }
}

void CMSampleBufferRef.PerSampleAttachmentsDictionary.subscript.getter(void **a1@<X0>, uint64_t a2@<X8>)
{
  CFArrayRef v4 = *a1;
  CFIndex v5 = *(void *)(v2 + 8);
  CFArrayRef v6 = CMSampleBufferGetSampleAttachmentsArray(*(CMSampleBufferRef *)v2, 0);
  if (v6)
  {
    CFArrayRef v7 = v6;
    id key = v4;
    CFArrayRef v8 = v7;
    ValueAtIndex = (void *)CFArrayGetValueAtIndex(v8, v5);
    if (ValueAtIndex)
    {
      CFDictionaryRef v13 = ValueAtIndex;
      Value = CFDictionaryGetValue(v13, key);
      if (Value)
      {
        long long v11 = Value;
        swift_unknownObjectRetain();
        *(void *)(a2 + 24) = swift_getObjectType();

        *(void *)a2 = v11;
        CFDictionaryRef v12 = (const __CFDictionary *)key;
      }
      else
      {
        *(_OWORD *)a2 = 0u;
        *(_OWORD *)(a2 + 16) = 0u;

        CFDictionaryRef v12 = v13;
      }
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
}

const __CFArray *key path setter for CMSampleBufferRef.PerSampleAttachmentsDictionary.subscript(_:) : CMSampleBufferRef.PerSampleAttachmentsDictionary(uint64_t a1, uint64_t a2, void **a3)
{
  CFIndex v3 = *a3;
  outlined init with copy of CMAttachmentBearerAttachments.Value?(a1, (uint64_t)v7, &demangling cache variable for type metadata for Any?);
  CFArrayRef v6 = v3;
  id v4 = v3;
  return CMSampleBufferRef.PerSampleAttachmentsDictionary.subscript.setter((uint64_t)v7, &v6);
}

const __CFArray *CMSampleBufferRef.PerSampleAttachmentsDictionary.subscript.setter(uint64_t a1, void **a2)
{
  id v4 = *a2;
  CFArrayRef result = CMSampleBufferGetSampleAttachmentsArray(*(CMSampleBufferRef *)v2, 1u);
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  CFArrayRef v6 = result;
  CFArrayRef result = (const __CFArray *)CFArrayGetValueAtIndex(result, *(void *)(v2 + 8));
  if (!result)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  CFArrayRef v7 = result;
  outlined init with copy of CMAttachmentBearerAttachments.Value?(a1, (uint64_t)&v10, &demangling cache variable for type metadata for Any?);
  if (v11)
  {
    outlined init with take of Any(&v10, &v12);
    __swift_project_boxed_opaque_existential_1(&v12, v13);
    CFArrayRef v8 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
    CFDictionarySetValue(v7, v4, v8);

    swift_unknownObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v12);
  }
  else
  {
    outlined destroy of Any?((uint64_t)&v10, &demangling cache variable for type metadata for Any?);
    uint64_t v9 = v7;
    CFDictionaryRemoveValue(v9, v4);
  }
  return (const __CFArray *)outlined destroy of Any?(a1, &demangling cache variable for type metadata for Any?);
}

void (*CMSampleBufferRef.PerSampleAttachmentsDictionary.subscript.modify(void *a1, void **a2))(uint64_t *a1, char a2)
{
  CFIndex v5 = malloc(0x50uLL);
  *a1 = v5;
  CFArrayRef v6 = *a2;
  v5[8] = v2;
  v5[9] = v6;
  CFArrayRef v7 = *(void **)(v2 + 8);
  v10[1] = *(void **)v2;
  v10[2] = v7;
  v10[0] = v6;
  id v8 = v6;
  CMSampleBufferRef.PerSampleAttachmentsDictionary.subscript.getter(v10, (uint64_t)v5);
  return CMSampleBufferRef.PerSampleAttachmentsDictionary.subscript.modify;
}

void CMSampleBufferRef.PerSampleAttachmentsDictionary.subscript.modify(uint64_t *a1, char a2)
{
  uint64_t v2 = (void *)*a1;
  if (a2)
  {
    CFIndex v3 = (void *)v2[9];
    outlined init with copy of CMAttachmentBearerAttachments.Value?(*a1, (uint64_t)(v2 + 4), &demangling cache variable for type metadata for Any?);
    id v4 = v3;
    CMSampleBufferRef.PerSampleAttachmentsDictionary.subscript.setter((uint64_t)(v2 + 4), &v4);
    outlined destroy of Any?((uint64_t)v2, &demangling cache variable for type metadata for Any?);
  }
  else
  {
    id v4 = (void *)v2[9];
    CMSampleBufferRef.PerSampleAttachmentsDictionary.subscript.setter((uint64_t)v2, &v4);
  }

  free(v2);
}

void protocol witness for Sequence.makeIterator() in conformance CMSampleBufferRef.PerSampleAttachmentsDictionary(void *a1@<X8>)
{
  CMSampleBufferRef.PerSampleAttachmentsDictionary.makeIterator()(a1);
  uint64_t v2 = *v1;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance CMSampleBufferRef.PerSampleAttachmentsDictionary()
{
  return 0;
}

uint64_t protocol witness for Sequence._customContainsEquatableElement(_:) in conformance CMSampleBufferRef.PerSampleAttachmentsDictionary()
{
  return 2;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance CMSampleBufferRef.PerSampleAttachmentsDictionary()
{
  uint64_t v1 = (void *)*v0;
  specialized _copySequenceToContiguousArray<A>(_:)(*v0, v0[1]);
  uint64_t v3 = v2;

  return v3;
}

void protocol witness for Sequence._copyContents(initializing:) in conformance CMSampleBufferRef.PerSampleAttachmentsDictionary(uint64_t a1, uint64_t a2, uint64_t a3)
{
  specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *(void **)v3, *(void *)(v3 + 8));
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance CMSampleBufferRef.PerSampleAttachmentsDictionary()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

Swift::Int __swiftcall CMSampleBufferRef.SampleAttachmentsArray.index(after:)(Swift::Int after)
{
  BOOL v1 = __OFADD__(after, 1);
  Swift::Int result = after + 1;
  if (v1) {
    __break(1u);
  }
  return result;
}

uint64_t CMSampleBufferRef.SampleAttachmentsArray.startIndex.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t CMSampleBufferRef.SampleAttachmentsArray.startIndex.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*CMSampleBufferRef.SampleAttachmentsArray.startIndex.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

uint64_t CMSampleBufferRef.SampleAttachmentsArray.endIndex.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t CMSampleBufferRef.SampleAttachmentsArray.endIndex.setter(uint64_t result)
{
  *(void *)(v1 + 16) = result;
  return result;
}

uint64_t (*CMSampleBufferRef.SampleAttachmentsArray.endIndex.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

id CMSampleBufferRef.SampleAttachmentsArray.subscript.getter@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = *v2;
  *a2 = *v2;
  a2[1] = a1;
  return v3;
}

void (*CMSampleBufferRef.SampleAttachmentsArray.subscript.modify(void **a1, void *a2))(id *a1)
{
  uint64_t v3 = *v2;
  *a1 = *v2;
  a1[1] = a2;
  id v4 = v3;
  return destroy for CMTaggedBuffer.Buffer;
}

void CMSampleBufferRef.SampleAttachmentsArray.subscript.setter(id *a1)
{
}

void protocol witness for Collection.startIndex.getter in conformance CMSampleBufferRef.SampleAttachmentsArray(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 8);
}

void protocol witness for Collection.endIndex.getter in conformance CMSampleBufferRef.SampleAttachmentsArray(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 16);
}

void (*protocol witness for Collection.subscript.read in conformance CMSampleBufferRef.SampleAttachmentsArray(void **a1, void **a2))(id *a1)
{
  uint64_t v3 = *a2;
  id v4 = *v2;
  *a1 = *v2;
  a1[1] = v3;
  id v5 = v4;
  return destroy for CMTaggedBuffer.Buffer;
}

uint64_t *protocol witness for Collection.subscript.getter in conformance CMSampleBufferRef.SampleAttachmentsArray@<X0>(uint64_t *result@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(v2 + 8);
  uint64_t v4 = *(void *)(v2 + 16);
  if (v4 < v3)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v5 = *result;
  if (*result < v3)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v6 = result[1];
  if (v4 >= v6)
  {
    CFArrayRef v7 = *(void **)v2;
    a2[2] = *(void *)v2;
    a2[3] = v3;
    a2[4] = v4;
    *a2 = v5;
    a2[1] = v6;
    return (uint64_t *)v7;
  }
LABEL_7:
  __break(1u);
  return result;
}

id protocol witness for Collection.indices.getter in conformance CMSampleBufferRef.SampleAttachmentsArray@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(v1 + 8);
  uint64_t v4 = *(void *)(v1 + 16);
  *a1 = *(void *)v1;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v3;
  a1[4] = v4;
  return v2;
}

BOOL protocol witness for Collection.isEmpty.getter in conformance CMSampleBufferRef.SampleAttachmentsArray()
{
  return *(void *)(v0 + 8) == *(void *)(v0 + 16);
}

void protocol witness for Collection._customIndexOfEquatableElement(_:) in conformance CMSampleBufferRef.SampleAttachmentsArray(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t *protocol witness for Collection.index(_:offsetBy:) in conformance CMSampleBufferRef.SampleAttachmentsArray@<X0>(uint64_t *result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if ((a2 & 0x8000000000000000) == 0)
  {
    uint64_t v3 = *result;
    if (!a2)
    {
LABEL_6:
      *a3 = v3;
      return result;
    }
    unint64_t v4 = v3 ^ 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v5 = a2 - 1;
    while (v4 > v5)
    {
      ++v3;
      if (!--a2) {
        goto LABEL_6;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Collection.index(_:offsetBy:limitedBy:) in conformance CMSampleBufferRef.SampleAttachmentsArray@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result = specialized Collection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3);
  *(void *)a4 = result;
  *(unsigned char *)(a4 + 8) = v6 & 1;
  return result;
}

uint64_t *protocol witness for Collection.distance(from:to:) in conformance CMSampleBufferRef.SampleAttachmentsArray(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = *a2;
  if (*a2 < *result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (*a2 == *result) {
    return 0;
  }
  unint64_t v4 = (uint64_t *)(v3 - v2);
  if (v3 > v2)
  {
    uint64_t result = 0;
    unint64_t v5 = v3 + ~v2;
    while (v5 <= 0x7FFFFFFFFFFFFFFELL)
    {
      uint64_t result = (uint64_t *)((char *)result + 1);
      if (v4 == result) {
        return result;
      }
    }
    __break(1u);
    goto LABEL_10;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance CMSampleBufferRef.SampleAttachmentsArray(uint64_t *result, uint64_t *a2)
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

void *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance CMSampleBufferRef.SampleAttachmentsArray(void *result, void *a2)
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

void *protocol witness for Collection.index(after:) in conformance CMSampleBufferRef.SampleAttachmentsArray@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (__OFADD__(*result, 1)) {
    __break(1u);
  }
  else {
    *a2 = *result + 1;
  }
  return result;
}

void *protocol witness for Collection.formIndex(after:) in conformance CMSampleBufferRef.SampleAttachmentsArray(void *result)
{
  if (__OFADD__(*result, 1)) {
    __break(1u);
  }
  else {
    ++*result;
  }
  return result;
}

__n128 protocol witness for Sequence.makeIterator() in conformance CMSampleBufferRef.SampleAttachmentsArray@<Q0>(uint64_t a1@<X8>)
{
  *(void *)a1 = *(void *)v1;
  __n128 result = *(__n128 *)(v1 + 8);
  *(__n128 *)(a1 + 8) = result;
  *(void *)(a1 + 24) = result.n128_u64[0];
  return result;
}

void protocol witness for Collection.count.getter in conformance CMSampleBufferRef.SampleAttachmentsArray()
{
  uint64_t v1 = *(void *)(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 16);
  if (v2 < v1)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v2 == v1) {
    return;
  }
  uint64_t v3 = v2 - v1;
  if (v2 > v1)
  {
    uint64_t v4 = 0;
    unint64_t v5 = v2 + ~v1;
    while (v5 <= 0x7FFFFFFFFFFFFFFELL)
    {
      if (v3 == ++v4) {
        return;
      }
    }
    __break(1u);
    goto LABEL_9;
  }
LABEL_10:
  __break(1u);
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance CMSampleBufferRef.SampleAttachmentsArray()
{
  uint64_t v1 = *(void **)v0;
  specialized _copyCollectionToContiguousArray<A>(_:)(*(void **)v0, *(void *)(v0 + 8), *(void *)(v0 + 16));
  uint64_t v3 = v2;

  return v3;
}

void *protocol witness for Sequence._copyContents(initializing:) in conformance CMSampleBufferRef.SampleAttachmentsArray(void *a1, void *a2, uint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *(void **)v3, *(void *)(v3 + 8), *(void *)(v3 + 16));
}

CMItemCount CMSampleBufferRef.sampleAttachments.getter@<X0>(opaqueCMSampleBuffer **a1@<X8>)
{
  uint64_t v3 = v1;
  CMItemCount result = CMSampleBufferGetNumSamples(v3);
  *a1 = v3;
  a1[1] = 0;
  a1[2] = (opaqueCMSampleBuffer *)result;
  return result;
}

void (*CMSampleBufferRef.sampleAttachments.modify(opaqueCMSampleBuffer **a1))(id *a1)
{
  uint64_t v3 = v1;
  CMItemCount NumSamples = CMSampleBufferGetNumSamples(v3);
  *a1 = v3;
  a1[1] = 0;
  a1[2] = (opaqueCMSampleBuffer *)NumSamples;
  return destroy for CMTaggedBuffer.Buffer;
}

void CMSampleBufferRef.sampleAttachments.setter(id *a1)
{
  uint64_t v3 = v1;
  CMSampleBufferGetNumSamples(v3);
}

CMSampleBufferRef_optional __swiftcall CMSampleBufferRef.SingleSampleBuffers.Iterator.next()()
{
  uint64_t v2 = *v0;
  unint64_t v1 = v0[1];
  if ((unint64_t)*v0 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    result.CMTimeValue value = (CMSampleBufferRef)swift_bridgeObjectRelease();
    if (v1 == v4) {
      return 0;
    }
  }
  else if (v1 == *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    return 0;
  }
  if ((v2 & 0xC000000000000001) != 0)
  {
    result.CMTimeValue value = (CMSampleBufferRef)MEMORY[0x1C188D620](v1, v2);
    unint64_t v5 = v1 + 1;
    if (!__OFADD__(v1, 1)) {
      goto LABEL_9;
    }
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if ((v1 & 0x8000000000000000) != 0)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v1 < *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    result.CMTimeValue value = (CMSampleBufferRef)*(id *)(v2 + 8 * v1 + 32);
    unint64_t v5 = v1 + 1;
    if (!__OFADD__(v1, 1))
    {
LABEL_9:
      v0[1] = v5;
      return result;
    }
    goto LABEL_12;
  }
LABEL_14:
  __break(1u);
  return result;
}

CMSampleBufferRef_optional protocol witness for IteratorProtocol.next() in conformance CMSampleBufferRef.SingleSampleBuffers.Iterator@<X0>(CMSampleBufferRef_optional *a1@<X8>)
{
  result.CMTimeValue value = CMSampleBufferRef.SingleSampleBuffers.Iterator.next()().value;
  a1->CMTimeValue value = result.value;
  return result;
}

uint64_t CMSampleBufferRef.SingleSampleBuffers.makeIterator()@<X0>(void *a1@<X8>)
{
  *a1 = *v1;
  a1[1] = 0;
  return swift_bridgeObjectRetain();
}

void protocol witness for Sequence.makeIterator() in conformance CMSampleBufferRef.SingleSampleBuffers(void *a1@<X8>)
{
  *a1 = *v1;
  a1[1] = 0;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance CMSampleBufferRef.SingleSampleBuffers()
{
  uint64_t v1 = specialized _copySequenceToContiguousArray<A>(_:)(*v0);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance CMSampleBufferRef.SingleSampleBuffers(uint64_t a1, void *a2, uint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

uint64_t CMSampleBufferRef.singleSampleBuffers()@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v12 = MEMORY[0x1E4FBC860];
  CMItemCount NumSamples = CMSampleBufferGetNumSamples(v1);
  specialized Array._reserveCapacityImpl(minimumCapacity:growForAppend:)(NumSamples, 0);
  specialized Array._endMutation()();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = &v12;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = partial apply for closure #1 in closure #1 in CMSampleBufferRef.singleSampleBuffers();
  *(void *)(v6 + 24) = v5;
  aBlock[4] = partial apply for thunk for @callee_guaranteed (@guaranteed CMSampleBufferRef, @unowned Int) -> (@unowned Int32);
  aBlock[5] = v6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed CMSampleBufferRef, @unowned Int) -> (@unowned Int32);
  aBlock[3] = &block_descriptor_19;
  CFArrayRef v7 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  OSStatus v8 = CMSampleBufferCallBlockForEachSample(v2, v7);
  _Block_release(v7);
  LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v7)
  {
    __break(1u);
  }
  else
  {
    uint64_t result = noErr.getter();
    if (v8 == result)
    {
      *a1 = v12;
    }
    else
    {
      id v10 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
      [v10 initWithDomain:*MEMORY[0x1E4F28760] code:v8 userInfo:0];
      swift_willThrow();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t closure #1 in closure #1 in CMSampleBufferRef.singleSampleBuffers()(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  MEMORY[0x1C188D4A0]();
  if (*(void *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*a3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();

  return noErr.getter();
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed CMSampleBufferRef, @unowned Int) -> (@unowned Int32)(uint64_t a1, void *a2)
{
  uint64_t v2 = *(uint64_t (**)(void))(a1 + 32);
  id v3 = a2;
  uint64_t v4 = v2();

  return v4;
}

id CMSampleBufferRef.AttachmentKey.rawValue.getter()
{
  return *v0;
}

void CMSampleBufferRef.AttachmentKey.rawValue.setter(void *a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*CMSampleBufferRef.AttachmentKey.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

uint64_t CMSampleBufferRef.AttachmentKey.init(rawValue:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

id one-time initialization function for resetDecoderBeforeDecoding()
{
  static CMSampleBufferRef.AttachmentKey.resetDecoderBeforeDecoding = *MEMORY[0x1E4F1F2B8];
  return (id)static CMSampleBufferRef.AttachmentKey.resetDecoderBeforeDecoding;
}

id static CMSampleBufferRef.AttachmentKey.resetDecoderBeforeDecoding.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for resetDecoderBeforeDecoding, (void **)&static CMSampleBufferRef.AttachmentKey.resetDecoderBeforeDecoding, a1);
}

id one-time initialization function for drainAfterDecoding()
{
  static CMSampleBufferRef.AttachmentKey.drainAfterDecoding = *MEMORY[0x1E4F1F238];
  return (id)static CMSampleBufferRef.AttachmentKey.drainAfterDecoding;
}

id static CMSampleBufferRef.AttachmentKey.drainAfterDecoding.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for drainAfterDecoding, (void **)&static CMSampleBufferRef.AttachmentKey.drainAfterDecoding, a1);
}

id one-time initialization function for postNotificationWhenConsumed()
{
  static CMSampleBufferRef.AttachmentKey.postNotificationWhenConsumed = *MEMORY[0x1E4F1F2A8];
  return (id)static CMSampleBufferRef.AttachmentKey.postNotificationWhenConsumed;
}

id static CMSampleBufferRef.AttachmentKey.postNotificationWhenConsumed.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for postNotificationWhenConsumed, (void **)&static CMSampleBufferRef.AttachmentKey.postNotificationWhenConsumed, a1);
}

id one-time initialization function for resumeOutput()
{
  static CMSampleBufferRef.AttachmentKey.resumeOutput = *MEMORY[0x1E4F1F2C0];
  return (id)static CMSampleBufferRef.AttachmentKey.resumeOutput;
}

id static CMSampleBufferRef.AttachmentKey.resumeOutput.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for resumeOutput, (void **)&static CMSampleBufferRef.AttachmentKey.resumeOutput, a1);
}

id one-time initialization function for transitionID()
{
  static CMSampleBufferRef.AttachmentKey.transitionID = *MEMORY[0x1E4F1F2F8];
  return (id)static CMSampleBufferRef.AttachmentKey.transitionID;
}

id static CMSampleBufferRef.AttachmentKey.transitionID.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for transitionID, (void **)&static CMSampleBufferRef.AttachmentKey.transitionID, a1);
}

id one-time initialization function for trimDurationAtStart()
{
  static CMSampleBufferRef.AttachmentKey.trimDurationAtStart = *MEMORY[0x1E4F1F308];
  return (id)static CMSampleBufferRef.AttachmentKey.trimDurationAtStart;
}

id static CMSampleBufferRef.AttachmentKey.trimDurationAtStart.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for trimDurationAtStart, (void **)&static CMSampleBufferRef.AttachmentKey.trimDurationAtStart, a1);
}

id one-time initialization function for trimDurationAtEnd()
{
  static CMSampleBufferRef.AttachmentKey.trimDurationAtEnd = *MEMORY[0x1E4F1F300];
  return (id)static CMSampleBufferRef.AttachmentKey.trimDurationAtEnd;
}

id static CMSampleBufferRef.AttachmentKey.trimDurationAtEnd.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for trimDurationAtEnd, (void **)&static CMSampleBufferRef.AttachmentKey.trimDurationAtEnd, a1);
}

id one-time initialization function for speedMultiplier()
{
  static CMSampleBufferRef.AttachmentKey.speedMultiplier = *MEMORY[0x1E4F1F2E8];
  return (id)static CMSampleBufferRef.AttachmentKey.speedMultiplier;
}

id static CMSampleBufferRef.AttachmentKey.speedMultiplier.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for speedMultiplier, (void **)&static CMSampleBufferRef.AttachmentKey.speedMultiplier, a1);
}

id one-time initialization function for reverse()
{
  static CMSampleBufferRef.AttachmentKey.reverse = *MEMORY[0x1E4F1F2C8];
  return (id)static CMSampleBufferRef.AttachmentKey.reverse;
}

id static CMSampleBufferRef.AttachmentKey.reverse.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for reverse, (void **)&static CMSampleBufferRef.AttachmentKey.reverse, a1);
}

id one-time initialization function for fillDiscontinuitiesWithSilence()
{
  static CMSampleBufferRef.AttachmentKey.fillDiscontinuitiesWithSilence = *MEMORY[0x1E4F1F278];
  return (id)static CMSampleBufferRef.AttachmentKey.fillDiscontinuitiesWithSilence;
}

id static CMSampleBufferRef.AttachmentKey.fillDiscontinuitiesWithSilence.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for fillDiscontinuitiesWithSilence, (void **)&static CMSampleBufferRef.AttachmentKey.fillDiscontinuitiesWithSilence, a1);
}

id one-time initialization function for emptyMedia()
{
  static CMSampleBufferRef.AttachmentKey.emptyMedia = *MEMORY[0x1E4F1F258];
  return (id)static CMSampleBufferRef.AttachmentKey.emptyMedia;
}

id static CMSampleBufferRef.AttachmentKey.emptyMedia.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for emptyMedia, (void **)&static CMSampleBufferRef.AttachmentKey.emptyMedia, a1);
}

id one-time initialization function for permanentEmptyMedia()
{
  static CMSampleBufferRef.AttachmentKey.permanentEmptyMedia = *MEMORY[0x1E4F1F2A0];
  return (id)static CMSampleBufferRef.AttachmentKey.permanentEmptyMedia;
}

id static CMSampleBufferRef.AttachmentKey.permanentEmptyMedia.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for permanentEmptyMedia, (void **)&static CMSampleBufferRef.AttachmentKey.permanentEmptyMedia, a1);
}

id one-time initialization function for displayEmptyMediaImmediately()
{
  static CMSampleBufferRef.AttachmentKey.displayEmptyMediaImmediately = *MEMORY[0x1E4F1F228];
  return (id)static CMSampleBufferRef.AttachmentKey.displayEmptyMediaImmediately;
}

id static CMSampleBufferRef.AttachmentKey.displayEmptyMediaImmediately.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for displayEmptyMediaImmediately, (void **)&static CMSampleBufferRef.AttachmentKey.displayEmptyMediaImmediately, a1);
}

id one-time initialization function for endsPreviousSampleDuration()
{
  static CMSampleBufferRef.AttachmentKey.endsPreviousSampleDuration = *MEMORY[0x1E4F1F270];
  return (id)static CMSampleBufferRef.AttachmentKey.endsPreviousSampleDuration;
}

id static CMSampleBufferRef.AttachmentKey.endsPreviousSampleDuration.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for endsPreviousSampleDuration, (void **)&static CMSampleBufferRef.AttachmentKey.endsPreviousSampleDuration, a1);
}

id one-time initialization function for sampleReferenceURL()
{
  static CMSampleBufferRef.AttachmentKey.sampleReferenceURL = *MEMORY[0x1E4F1F2D8];
  return (id)static CMSampleBufferRef.AttachmentKey.sampleReferenceURL;
}

id static CMSampleBufferRef.AttachmentKey.sampleReferenceURL.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for sampleReferenceURL, (void **)&static CMSampleBufferRef.AttachmentKey.sampleReferenceURL, a1);
}

id one-time initialization function for sampleReferenceByteOffset()
{
  static CMSampleBufferRef.AttachmentKey.sampleReferenceByteOffset = *MEMORY[0x1E4F1F2D0];
  return (id)static CMSampleBufferRef.AttachmentKey.sampleReferenceByteOffset;
}

id static CMSampleBufferRef.AttachmentKey.sampleReferenceByteOffset.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for sampleReferenceByteOffset, (void **)&static CMSampleBufferRef.AttachmentKey.sampleReferenceByteOffset, a1);
}

id one-time initialization function for gradualDecoderRefresh()
{
  static CMSampleBufferRef.AttachmentKey.gradualDecoderRefresh = *MEMORY[0x1E4F1F290];
  return (id)static CMSampleBufferRef.AttachmentKey.gradualDecoderRefresh;
}

id static CMSampleBufferRef.AttachmentKey.gradualDecoderRefresh.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for gradualDecoderRefresh, (void **)&static CMSampleBufferRef.AttachmentKey.gradualDecoderRefresh, a1);
}

id one-time initialization function for droppedFrameReason()
{
  static CMSampleBufferRef.AttachmentKey.droppedFrameReason = *MEMORY[0x1E4F1F240];
  return (id)static CMSampleBufferRef.AttachmentKey.droppedFrameReason;
}

id static CMSampleBufferRef.AttachmentKey.droppedFrameReason.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for droppedFrameReason, (void **)&static CMSampleBufferRef.AttachmentKey.droppedFrameReason, a1);
}

id one-time initialization function for droppedFrameReasonInfo()
{
  static CMSampleBufferRef.AttachmentKey.droppedFrameReasonInfo = *MEMORY[0x1E4F1F248];
  return (id)static CMSampleBufferRef.AttachmentKey.droppedFrameReasonInfo;
}

id static CMSampleBufferRef.AttachmentKey.droppedFrameReasonInfo.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for droppedFrameReasonInfo, (void **)&static CMSampleBufferRef.AttachmentKey.droppedFrameReasonInfo, a1);
}

id one-time initialization function for stillImageLensStabilizationInfo()
{
  static CMSampleBufferRef.AttachmentKey.stillImageLensStabilizationInfo = *MEMORY[0x1E4F1F2F0];
  return (id)static CMSampleBufferRef.AttachmentKey.stillImageLensStabilizationInfo;
}

id static CMSampleBufferRef.AttachmentKey.stillImageLensStabilizationInfo.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for stillImageLensStabilizationInfo, (void **)&static CMSampleBufferRef.AttachmentKey.stillImageLensStabilizationInfo, a1);
}

id one-time initialization function for cameraIntrinsicMatrix()
{
  static CMSampleBufferRef.AttachmentKey.cameraIntrinsicMatrix = *MEMORY[0x1E4F1F218];
  return (id)static CMSampleBufferRef.AttachmentKey.cameraIntrinsicMatrix;
}

id static CMSampleBufferRef.AttachmentKey.cameraIntrinsicMatrix.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for cameraIntrinsicMatrix, (void **)&static CMSampleBufferRef.AttachmentKey.cameraIntrinsicMatrix, a1);
}

id one-time initialization function for forceKeyFrame()
{
  static CMSampleBufferRef.AttachmentKey.forceKeyFrame = *MEMORY[0x1E4F1F288];
  return (id)static CMSampleBufferRef.AttachmentKey.forceKeyFrame;
}

id static CMSampleBufferRef.AttachmentKey.forceKeyFrame.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for forceKeyFrame, (void **)&static CMSampleBufferRef.AttachmentKey.forceKeyFrame, a1);
}

double CMAttachmentBearerAttachments.subscript.getter@<D0>(const __CFString **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  CFStringRef v4 = *a1;
  CMAttachmentMode attachmentModeOut = 0;
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  uint64_t v5 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
  CFTypeRef v6 = (id)CMGetAttachment(v5, v4, &attachmentModeOut);
  swift_unknownObjectRelease();
  if (v6)
  {
    if (!attachmentModeOut)
    {
      char v7 = 0;
      uint64_t ObjectType = swift_getObjectType();
      *(void *)&long long v12 = v6;
      goto LABEL_6;
    }
    if (attachmentModeOut == 1)
    {
      uint64_t ObjectType = swift_getObjectType();
      *(void *)&long long v12 = v6;
      char v7 = 1;
LABEL_6:
      outlined init with take of Any(&v12, v10);
      char v11 = v7;
      outlined init with take of CMAttachmentBearerAttachments.Value(v10, a2);
      return result;
    }
    swift_unknownObjectRelease();
  }
  double result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(unsigned char *)(a2 + 32) = -1;
  return result;
}

uint64_t key path setter for CMAttachmentBearerAttachments.subscript(_:) : CMAttachmentBearerAttachments(uint64_t a1, uint64_t a2, __CFString **a3)
{
  id v3 = *a3;
  outlined init with copy of CMAttachmentBearerAttachments.Value?(a1, (uint64_t)v7, &demangling cache variable for type metadata for CMAttachmentBearerAttachments.Value?);
  CFTypeRef v6 = v3;
  CFStringRef v4 = v3;
  return CMAttachmentBearerAttachments.subscript.setter((uint64_t)v7, &v6);
}

uint64_t CMAttachmentBearerAttachments.subscript.setter(uint64_t a1, __CFString **a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *a2;
  outlined init with copy of CMAttachmentBearerAttachments.Value?(a1, (uint64_t)&v25, &demangling cache variable for type metadata for CMAttachmentBearerAttachments.Value?);
  if (v27 == 255)
  {
    outlined destroy of Any?((uint64_t)&v25, &demangling cache variable for type metadata for CMAttachmentBearerAttachments.Value?);
    outlined init with copy of CMAttachmentBearerAttachments(v3, (uint64_t)&v25);
    uint64_t v14 = v26;
    int64_t v15 = __swift_project_boxed_opaque_existential_1(&v25, v26);
    uint64_t v16 = *(void *)(v14 - 8);
    MEMORY[0x1F4188790](v15);
    unint64_t v18 = (char *)&v20 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v16 + 16))(v18);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
    CFAllocatorRef v19 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v14);
    CMRemoveAttachment(v19, v5);
    swift_unknownObjectRelease();

    return outlined destroy of Any?(a1, &demangling cache variable for type metadata for CMAttachmentBearerAttachments.Value?);
  }
  else
  {
    outlined init with take of CMAttachmentBearerAttachments.Value(&v25, (uint64_t)v28);
    outlined init with copy of CMAttachmentBearerAttachments(v3, (uint64_t)&v25);
    uint64_t v6 = v26;
    char v7 = __swift_project_boxed_opaque_existential_1(&v25, v26);
    uint64_t v8 = *(void *)(v6 - 8);
    MEMORY[0x1F4188790](v7);
    id v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v8 + 16))(v10);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
    char v11 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
    outlined init with copy of CMAttachmentBearerAttachments.Value((uint64_t)v28, (uint64_t)v21);
    outlined init with take of Any(v21, &v23);
    __swift_project_boxed_opaque_existential_1(&v23, v24);
    long long v12 = (const void *)_bridgeAnythingToObjectiveC<A>(_:)();
    outlined init with copy of CMAttachmentBearerAttachments.Value((uint64_t)v28, (uint64_t)v21);
    LODWORD(v10) = v22;
    outlined destroy of CMAttachmentBearerAttachments.Value((uint64_t)v21);
    CMSetAttachment(v11, v5, v12, (CMAttachmentMode)v10);
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
    outlined destroy of Any?(a1, &demangling cache variable for type metadata for CMAttachmentBearerAttachments.Value?);
    outlined destroy of CMAttachmentBearerAttachments.Value((uint64_t)v28);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v23);
  }
}

void (*CMAttachmentBearerAttachments.subscript.modify(void *a1, __CFString **a2))(uint64_t *a1, char a2)
{
  uint64_t v5 = malloc(0x60uLL);
  *a1 = v5;
  uint64_t v6 = *a2;
  v5[10] = v2;
  v5[11] = v6;
  CFStringRef v9 = v6;
  char v7 = v6;
  CMAttachmentBearerAttachments.subscript.getter(&v9, (uint64_t)v5);
  return CMAttachmentBearerAttachments.subscript.modify;
}

id one-time initialization function for dataBecameReady()
{
  static CMSampleBufferRef.dataBecameReady = *MEMORY[0x1E4F1F3A8];
  return (id)static CMSampleBufferRef.dataBecameReady;
}

id static CMSampleBufferRef.dataBecameReady.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for dataBecameReady, (void **)&static CMSampleBufferRef.dataBecameReady);
}

id static CMSampleBufferRef.dataFailed.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for dataFailed, (void **)&static CMSampleBufferRef.dataFailed);
}

uint64_t (*CMSampleBufferRef.NotificationKey.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

id one-time initialization function for status()
{
  static CMSampleBufferRef.NotificationKey.status = *MEMORY[0x1E4F1F3A0];
  return (id)static CMSampleBufferRef.NotificationKey.status;
}

id static CMSampleBufferRef.NotificationKey.status.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for status, (void **)&static CMSampleBufferRef.NotificationKey.status, a1);
}

id static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter@<X0>(void *a1@<X0>, void **a2@<X1>, void **a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = *a2;
  *a3 = *a2;

  return v5;
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
  uint64_t result = MEMORY[0x1C188D630](v7, v9, a2 & 1, v5);
  *uint64_t v2 = result;
  return result;
}

uint64_t sub_1BE2055EC()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t partial apply for closure #1 in closure #1 in CMSampleBufferRef.setInvalidateHandler(_:)(uint64_t a1)
{
  return closure #1 in closure #1 in CMSampleBufferRef.setInvalidateHandler(_:)(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t lazy protocol witness table accessor for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key()
{
  unint64_t result = lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key);
  }
  return result;
}

uint64_t sub_1BE2056DC()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t partial apply for closure #1 in closure #1 in CMSampleBufferRef.singleSampleBuffers()(void *a1, uint64_t a2)
{
  return closure #1 in closure #1 in CMSampleBufferRef.singleSampleBuffers()(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_1BE2056F4()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t partial apply for thunk for @callee_guaranteed (@guaranteed CMSampleBufferRef, @unowned Int) -> (@unowned Int32)()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t outlined destroy of Any?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t lazy protocol witness table accessor for type CMSampleBufferRef.Flags and conformance CMSampleBufferRef.Flags()
{
  unint64_t result = lazy protocol witness table cache variable for type CMSampleBufferRef.Flags and conformance CMSampleBufferRef.Flags;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.Flags and conformance CMSampleBufferRef.Flags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.Flags and conformance CMSampleBufferRef.Flags);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMSampleBufferRef.Flags and conformance CMSampleBufferRef.Flags;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.Flags and conformance CMSampleBufferRef.Flags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.Flags and conformance CMSampleBufferRef.Flags);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMSampleBufferRef.Flags and conformance CMSampleBufferRef.Flags;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.Flags and conformance CMSampleBufferRef.Flags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.Flags and conformance CMSampleBufferRef.Flags);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMSampleBufferRef.Flags and conformance CMSampleBufferRef.Flags;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.Flags and conformance CMSampleBufferRef.Flags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.Flags and conformance CMSampleBufferRef.Flags);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CMSampleBufferRef.DataReadiness and conformance CMSampleBufferRef.DataReadiness()
{
  unint64_t result = lazy protocol witness table cache variable for type CMSampleBufferRef.DataReadiness and conformance CMSampleBufferRef.DataReadiness;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.DataReadiness and conformance CMSampleBufferRef.DataReadiness)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.DataReadiness and conformance CMSampleBufferRef.DataReadiness);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key(void *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key, (uint64_t (*)(void))lazy protocol witness table accessor for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key, (uint64_t (*)(void))lazy protocol witness table accessor for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Key and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Key);
}

unint64_t lazy protocol witness table accessor for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator()
{
  unint64_t result = lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator and conformance CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CMSampleBufferRef.SampleAttachmentsArray and conformance CMSampleBufferRef.SampleAttachmentsArray()
{
  unint64_t result = lazy protocol witness table cache variable for type CMSampleBufferRef.SampleAttachmentsArray and conformance CMSampleBufferRef.SampleAttachmentsArray;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.SampleAttachmentsArray and conformance CMSampleBufferRef.SampleAttachmentsArray)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.SampleAttachmentsArray and conformance CMSampleBufferRef.SampleAttachmentsArray);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.Index : Comparable in CMSampleBufferRef.SampleAttachmentsArray()
{
  return MEMORY[0x1E4FBB568];
}

uint64_t associated type witness table accessor for Collection.Indices : Collection in CMSampleBufferRef.SampleAttachmentsArray()
{
  return lazy protocol witness table accessor for type DefaultIndices<CMSampleBufferRef.SampleAttachmentsArray> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type DefaultIndices<CMSampleBufferRef.SampleAttachmentsArray> and conformance DefaultIndices<A>, &demangling cache variable for type metadata for DefaultIndices<CMSampleBufferRef.SampleAttachmentsArray>);
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

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in CMSampleBufferRef.SampleAttachmentsArray()
{
  return lazy protocol witness table accessor for type DefaultIndices<CMSampleBufferRef.SampleAttachmentsArray> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type Slice<CMSampleBufferRef.SampleAttachmentsArray> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<CMSampleBufferRef.SampleAttachmentsArray>);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in CMSampleBufferRef.SampleAttachmentsArray()
{
  return lazy protocol witness table accessor for type DefaultIndices<CMSampleBufferRef.SampleAttachmentsArray> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type IndexingIterator<CMSampleBufferRef.SampleAttachmentsArray> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<CMSampleBufferRef.SampleAttachmentsArray>);
}

uint64_t lazy protocol witness table accessor for type DefaultIndices<CMSampleBufferRef.SampleAttachmentsArray> and conformance DefaultIndices<A>(unint64_t *a1, uint64_t *a2)
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

unint64_t lazy protocol witness table accessor for type CMSampleBufferRef.SingleSampleBuffers.Iterator and conformance CMSampleBufferRef.SingleSampleBuffers.Iterator()
{
  unint64_t result = lazy protocol witness table cache variable for type CMSampleBufferRef.SingleSampleBuffers.Iterator and conformance CMSampleBufferRef.SingleSampleBuffers.Iterator;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.SingleSampleBuffers.Iterator and conformance CMSampleBufferRef.SingleSampleBuffers.Iterator)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.SingleSampleBuffers.Iterator and conformance CMSampleBufferRef.SingleSampleBuffers.Iterator);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMSampleBufferRef.AttachmentKey(void *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey, (uint64_t (*)(void))lazy protocol witness table accessor for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey, (uint64_t (*)(void))lazy protocol witness table accessor for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey);
}

unint64_t lazy protocol witness table accessor for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey()
{
  unint64_t result = lazy protocol witness table cache variable for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.AttachmentKey and conformance CMSampleBufferRef.AttachmentKey);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMSampleBufferRef.NotificationKey(void *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey, (uint64_t (*)(void))lazy protocol witness table accessor for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey, (uint64_t (*)(void))lazy protocol witness table accessor for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey);
}

uint64_t instantiation function for generic protocol witness table for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void), uint64_t (*a6)(void))
{
  a1[1] = a4();
  a1[2] = a5();
  uint64_t result = a6();
  a1[3] = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey()
{
  unint64_t result = lazy protocol witness table cache variable for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey;
  if (!lazy protocol witness table cache variable for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMSampleBufferRef.NotificationKey and conformance CMSampleBufferRef.NotificationKey);
  }
  return result;
}

void sub_1BE206050(uint64_t a1@<X0>, void **a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3 = *(void **)(a1 + 8);
  CFStringRef v4 = *a2;
  v5[1] = *(void **)a1;
  v5[2] = v3;
  v5[0] = v4;
  CMSampleBufferRef.PerSampleAttachmentsDictionary.subscript.getter(v5, a3);
}

uint64_t sub_1BE206094()
{
  return 0;
}

id sub_1BE2060A4@<X0>(void **a1@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  *a3 = v3;
  a3[1] = v4;
  return v3;
}

uint64_t sub_1BE2060B8()
{
  return 0;
}

CMItemCount sub_1BE2060C8@<X0>(id *a1@<X0>, opaqueCMSampleBuffer **a2@<X8>)
{
  uint64_t v3 = (opaqueCMSampleBuffer *)*a1;
  CMItemCount result = CMSampleBufferGetNumSamples(v3);
  *a2 = v3;
  a2[1] = 0;
  a2[2] = (opaqueCMSampleBuffer *)result;
  return result;
}

void sub_1BE206100(id *a1, opaqueCMSampleBuffer **a2)
{
  uint64_t v2 = *a2;
  id v3 = *a1;
  CMSampleBufferGetNumSamples(v2);
}

double sub_1BE206150@<D0>(const __CFString **a1@<X1>, uint64_t a2@<X8>)
{
  CFStringRef v3 = *a1;
  return CMAttachmentBearerAttachments.subscript.getter(&v3, a2);
}

uint64_t sub_1BE20618C()
{
  return 0;
}

uint64_t dispatch thunk of _CMSampleBufferInitTrampoline.init(referencing:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

ValueMetadata *type metadata accessor for CMSampleBufferRef.Error()
{
  return &type metadata for CMSampleBufferRef.Error;
}

ValueMetadata *type metadata accessor for CMSampleBufferRef.Flags()
{
  return &type metadata for CMSampleBufferRef.Flags;
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(unsigned char *)(result + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)CMItemCount result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for CMSampleBufferRef.DataReadiness(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 5)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CMSampleBufferRef.DataReadiness(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 4) = 0;
    *(_DWORD *)CMItemCount result = a2 - 1;
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
  *(unsigned char *)(result + 5) = v3;
  return result;
}

uint64_t getEnumTag for CMSampleBufferRef.DataReadiness(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t destructiveInjectEnumTag for CMSampleBufferRef.DataReadiness(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)CMItemCount result = a2 - 1;
    *(unsigned char *)(result + 4) = 1;
  }
  else
  {
    *(unsigned char *)(result + 4) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for CMSampleBufferRef.DataReadiness()
{
  return &type metadata for CMSampleBufferRef.DataReadiness;
}

void *initializeBufferWithCopyOfBuffer for CMSampleBufferRef.PerSampleAttachmentsDictionary(void *a1, uint64_t a2)
{
  char v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  return a1;
}

uint64_t assignWithCopy for CMSampleBufferRef.PerSampleAttachmentsDictionary(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for CMSampleBufferRef.PerSampleAttachmentsDictionary(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  return a1;
}

ValueMetadata *type metadata accessor for CMSampleBufferRef.PerSampleAttachmentsDictionary()
{
  return &type metadata for CMSampleBufferRef.PerSampleAttachmentsDictionary;
}

ValueMetadata *type metadata accessor for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key()
{
  return &type metadata for CMSampleBufferRef.PerSampleAttachmentsDictionary.Key;
}

uint64_t destroy for CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator()
{
  return outlined consume of [CMSampleBufferRef.PerSampleAttachmentsDictionary.Key : Any].Iterator._Variant();
}

void *initializeWithCopy for CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  outlined copy of [A : B].Iterator._Variant<A, B>();
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  return a1;
}

void *assignWithCopy for CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  outlined copy of [A : B].Iterator._Variant<A, B>();
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  outlined consume of [CMSampleBufferRef.PerSampleAttachmentsDictionary.Key : Any].Iterator._Variant();
  return a1;
}

uint64_t assignWithTake for CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = v3;
  outlined consume of [CMSampleBufferRef.PerSampleAttachmentsDictionary.Key : Any].Iterator._Variant();
  return a1;
}

uint64_t getEnumTagSinglePayload for CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7F && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 127);
  }
  unsigned int v3 = (((*(void *)a1 >> 57) >> 6) | (2 * ((*(void *)a1 >> 57) & 0x38 | *(void *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7E) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7E)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)CMItemCount result = a2 - 127;
    if (a3 >= 0x7F) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7F) {
      *(unsigned char *)(result + 40) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 1) & 0x3F | ((-a2 & 0x7F) << 6);
      *(void *)CMItemCount result = (v3 | (v3 << 57)) & 0xF000000000000007;
      *(_OWORD *)(result + 8) = 0u;
      *(_OWORD *)(result + 24) = 0u;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator()
{
  return &type metadata for CMSampleBufferRef.PerSampleAttachmentsDictionary.Iterator;
}

uint64_t initializeBufferWithCopyOfBuffer for CMSampleBufferRef.SampleAttachmentsArray(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  id v4 = v3;
  return a1;
}

uint64_t assignWithCopy for CMSampleBufferRef.SampleAttachmentsArray(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for CMSampleBufferRef.SampleAttachmentsArray(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for CMSampleBufferRef.SampleAttachmentsArray(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CMSampleBufferRef.SampleAttachmentsArray(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CMSampleBufferRef.SampleAttachmentsArray()
{
  return &type metadata for CMSampleBufferRef.SampleAttachmentsArray;
}

ValueMetadata *type metadata accessor for CMSampleBufferRef.SingleSampleBuffers()
{
  return &type metadata for CMSampleBufferRef.SingleSampleBuffers;
}

void *initializeBufferWithCopyOfBuffer for CMSampleBufferRef.SingleSampleBuffers.Iterator(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for CMSampleBufferRef.SingleSampleBuffers.Iterator()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for CMSampleBufferRef.SingleSampleBuffers.Iterator(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

void *assignWithTake for CMSampleBufferRef.SingleSampleBuffers.Iterator(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for CMSampleBufferRef.PerSampleAttachmentsDictionary(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CMSampleBufferRef.PerSampleAttachmentsDictionary(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CMSampleBufferRef.SingleSampleBuffers.Iterator()
{
  return &type metadata for CMSampleBufferRef.SingleSampleBuffers.Iterator;
}

ValueMetadata *type metadata accessor for CMSampleBufferRef.AttachmentKey()
{
  return &type metadata for CMSampleBufferRef.AttachmentKey;
}

ValueMetadata *type metadata accessor for CMSampleBufferRef.NotificationKey()
{
  return &type metadata for CMSampleBufferRef.NotificationKey;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CMTagCategory()
{
  return specialized _CMFormatDescriptionFourCCConvertible.description.getter(*v0);
}

NSNumber protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance CMTagCategory()
{
  return UInt32._bridgeToObjectiveC()();
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance CMTagCategory(uint64_t a1, uint64_t a2)
{
  int v4 = 0;
  char v5 = 1;
  uint64_t result = MEMORY[0x1C188D950](a1, &v4);
  if (v5)
  {
    __break(1u);
  }
  else
  {
    *(_DWORD *)a2 = v4;
    *(unsigned char *)(a2 + 4) = 0;
  }
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance CMTagCategory()
{
  uint64_t result = static UInt32._conditionallyBridgeFromObjectiveC(_:result:)();
  if ((result & 1) == 0) {
    return result & 1;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance CMTagCategory@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = static UInt32._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  return result;
}

uint64_t CMTag.rawCategory.getter()
{
  return *(unsigned int *)(v0 + 16);
}

void CMTag.rawTagValue.getter(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 32);
  *(void *)a1 = *(void *)(v1 + 24);
  *(unsigned char *)(a1 + 8) = v2;
}

uint64_t CMTag.__allocating_init(rawCategory:rawTagValue:)(int a1, uint64_t *a2)
{
  uint64_t result = swift_allocObject();
  uint64_t v5 = *a2;
  char v6 = *((unsigned char *)a2 + 8);
  *(_DWORD *)(result + 16) = a1;
  *(void *)(result + 24) = v5;
  *(unsigned char *)(result + 32) = v6;
  return result;
}

uint64_t CMTag.init(rawCategory:rawTagValue:)(int a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  char v4 = *((unsigned char *)a2 + 8);
  *(_DWORD *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  *(unsigned char *)(v2 + 32) = v4;
  return v2;
}

uint64_t CMTag.value<A>(onlyIfMatching:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*(_DWORD *)(v3 + 16) == *(_DWORD *)(a1 + 32))
  {
    char v4 = *(uint64_t (**)(uint64_t *))a1;
    char v5 = *(unsigned char *)(v3 + 32);
    uint64_t v8 = *(void *)(v3 + 24);
    char v9 = v5;
    return v4(&v8);
  }
  else
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56);
    return v7(a3, 1, 1, a2);
  }
}

uint64_t CMTypedTag.Category.value(for:)(uint64_t *a1)
{
  char v2 = *((unsigned char *)a1 + 8);
  uint64_t v3 = *v1;
  uint64_t v5 = *a1;
  char v6 = v2;
  return v3(&v5);
}

uint64_t CMTag.description.getter()
{
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CMTagCategory v2 = *(_DWORD *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  switch(*(unsigned char *)(v0 + 32))
  {
    case 1:
      CMTag v9 = CMTagMakeWithFloat64Value(v2, *(Float64 *)(v0 + 24));
      CMTagValue value = v9.value;
      uint64_t v4 = *(void *)&v9.category;
      break;
    case 2:
      CMTag v7 = CMTagMakeWithOSTypeValue(v2, v3);
      CMTagValue value = v7.value;
      uint64_t v4 = *(void *)&v7.category;
      break;
    case 3:
      CMTag v8 = CMTagMakeWithFlagsValue(v2, v3);
      CMTagValue value = v8.value;
      uint64_t v4 = *(void *)&v8.category;
      break;
    default:
      CMTag v6 = CMTagMakeWithSInt64Value(v2, v3);
      CMTagValue value = v6.value;
      uint64_t v4 = *(void *)&v6.category;
      break;
  }
  v13.CMTagValue value = value;
  *(void *)&v13.category = v4;
  CFStringRef v10 = CMTagCopyDescription(v1, v13);
  if (v10)
  {
    char v11 = (__CFString *)v10;
    static String._conditionallyBridgeFromObjectiveC(_:result:)();
  }
  return 0x2064696C61766E49;
}

uint64_t CMTag.deinit()
{
  return v0;
}

uint64_t CMTag.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 33, 7);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CMTag(uint64_t *a1, uint64_t *a2)
{
  return specialized static CMTag.== infix(_:_:)(*a1, *a2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CMTag()
{
  return CMTag.description.getter();
}

uint64_t CMTypedTag.Category.rawCategory.getter()
{
  return *(unsigned int *)(v0 + 32);
}

uint64_t CMTypedTag.Category.tagValue(for:)()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t CMTypedTag.Category.init(rawCategory:valueForTagValue:tagValueForValue:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(void *)a6 = a2;
  *(void *)(a6 + 8) = a3;
  *(void *)(a6 + 16) = a4;
  *(void *)(a6 + 24) = a5;
  *(_DWORD *)(a6 + 32) = result;
  return result;
}

uint64_t CMTypedTag.category.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 64);
  int v3 = *(_DWORD *)(v1 + 72);
  *(void *)a1 = *(void *)(v1 + 40);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 48);
  *(void *)(a1 + 24) = v2;
  *(_DWORD *)(a1 + 32) = v3;
  swift_retain();

  return swift_retain();
}

uint64_t CMTypedTag.value.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 128);
  uint64_t v4 = type metadata accessor for Optional();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  CMTag v7 = (char *)&v12 - v6;
  CMTag v8 = *(void (**)(uint64_t *))(v1 + 40);
  char v9 = *(unsigned char *)(v1 + 32);
  uint64_t v12 = *(void *)(v1 + 24);
  char v13 = v9;
  v8(&v12);
  uint64_t v10 = *(void *)(v3 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v3) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a1, v7, v3);
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t CMTypedTag.__allocating_init(category:value:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = specialized CMTypedTag.__allocating_init(category:value:)(a1, a2);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v2 + 128) - 8) + 8))(a2);
  return v4;
}

uint64_t CMTypedTag.init(category:value:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *v2;
  uint64_t v5 = specialized CMTypedTag.init(category:value:)(a1, a2);
  (*(void (**)(uint64_t))(*(void *)(*(void *)(v4 + 128) - 8) + 8))(a2);
  return v5;
}

void CMTypedTag.__allocating_init(rawCategory:rawTagValue:)()
{
}

void CMTypedTag.init(rawCategory:rawTagValue:)()
{
}

uint64_t CMTypedTag.__ivar_destroyer()
{
  swift_release();

  return swift_release();
}

uint64_t CMTypedTag.deinit()
{
  swift_release();
  swift_release();
  return v0;
}

uint64_t CMTypedTag.__deallocating_deinit()
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186488](v0, 76, 7);
}

void static CMTypedTag.Category.mediaType.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 1835297121;
}

void static CMTypedTag.Category.mediaSubType.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 1836283234;
}

void static CMTypedTag.Category.trackID.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 1953653099;
}

void static CMTypedTag.Category.channelID.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 1986226286;
}

void static CMTypedTag.Category.videoLayerID.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 1986814329;
}

void static CMTypedTag.Category.pixelFormat.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 1885960294;
}

void static CMTypedTag.Category.packingType.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 1885430635;
}

void static CMTypedTag.Category.projectionType.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 1886547818;
}

void static CMTypedTag.Category.stereoView.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 1702454643;
}

void static CMTypedTag.Category.stereoViewInterpretation.getter(uint64_t a1@<X8>)
{
  *(void *)a1 = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 1702455664;
}

uint64_t static CMTag.mediaType(_:)(unsigned int *a1)
{
  uint64_t v1 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CMTypedTag<CMFormatDescriptionRef.MediaType>);
  uint64_t result = swift_allocObject();
  *(void *)(result + 40) = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(result + 48) = 0;
  *(void *)(result + 56) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(result + 64) = 0;
  *(_DWORD *)(result + 72) = 1835297121;
  *(_DWORD *)(result + 16) = 1835297121;
  *(void *)(result + 24) = v1;
  *(unsigned char *)(result + 32) = 2;
  return result;
}

uint64_t static CMTag.mediaSubType(_:)(unsigned int *a1)
{
  uint64_t v1 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CMTypedTag<CMFormatDescriptionRef.MediaSubType>);
  uint64_t result = swift_allocObject();
  *(void *)(result + 40) = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(result + 48) = 0;
  *(void *)(result + 56) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(result + 64) = 0;
  *(_DWORD *)(result + 72) = 1836283234;
  *(_DWORD *)(result + 16) = 1836283234;
  *(void *)(result + 24) = v1;
  *(unsigned char *)(result + 32) = 2;
  return result;
}

uint64_t static CMTag.trackID(_:)(int a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CMTypedTag<Int32>);
  uint64_t result = swift_allocObject();
  *(void *)(result + 40) = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(result + 48) = 0;
  *(void *)(result + 56) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(result + 64) = 0;
  *(_DWORD *)(result + 72) = 1953653099;
  *(_DWORD *)(result + 16) = 1953653099;
  *(void *)(result + 24) = a1;
  *(unsigned char *)(result + 32) = 0;
  return result;
}

uint64_t static CMTag.channelID(_:)(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CMTypedTag<Int64>);
  uint64_t result = swift_allocObject();
  *(void *)(result + 40) = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(result + 48) = 0;
  *(void *)(result + 56) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(result + 64) = 0;
  *(_DWORD *)(result + 72) = 1986226286;
  *(_DWORD *)(result + 16) = 1986226286;
  *(void *)(result + 24) = a1;
  *(unsigned char *)(result + 32) = 0;
  return result;
}

uint64_t static CMTag.videoLayerID(_:)(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CMTypedTag<Int64>);
  uint64_t result = swift_allocObject();
  *(void *)(result + 40) = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(result + 48) = 0;
  *(void *)(result + 56) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(result + 64) = 0;
  *(_DWORD *)(result + 72) = 1986814329;
  *(_DWORD *)(result + 16) = 1986814329;
  *(void *)(result + 24) = a1;
  *(unsigned char *)(result + 32) = 0;
  return result;
}

uint64_t static CMTag.pixelFormat(_:)(unsigned int a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CMTypedTag<UInt32>);
  uint64_t result = swift_allocObject();
  *(void *)(result + 40) = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(result + 48) = 0;
  *(void *)(result + 56) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(result + 64) = 0;
  *(_DWORD *)(result + 72) = 1885960294;
  *(_DWORD *)(result + 16) = 1885960294;
  *(void *)(result + 24) = a1;
  *(unsigned char *)(result + 32) = 2;
  return result;
}

uint64_t static CMTag.packingType(_:)(unint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CMTypedTag<CMPackingType>);
  uint64_t result = swift_allocObject();
  *(void *)(result + 40) = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(result + 48) = 0;
  *(void *)(result + 56) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(result + 64) = 0;
  *(_DWORD *)(result + 72) = 1885430635;
  if (HIDWORD(a1))
  {
    __break(1u);
  }
  else
  {
    *(_DWORD *)(result + 16) = 1885430635;
    *(void *)(result + 24) = a1;
    *(unsigned char *)(result + 32) = 2;
  }
  return result;
}

uint64_t static CMTag.projectionType(_:)(unint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CMTypedTag<CMProjectionType>);
  uint64_t result = swift_allocObject();
  *(void *)(result + 40) = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(result + 48) = 0;
  *(void *)(result + 56) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(result + 64) = 0;
  *(_DWORD *)(result + 72) = 1886547818;
  if (HIDWORD(a1))
  {
    __break(1u);
  }
  else
  {
    *(_DWORD *)(result + 16) = 1886547818;
    *(void *)(result + 24) = a1;
    *(unsigned char *)(result + 32) = 2;
  }
  return result;
}

uint64_t static CMTag.stereoView(_:)(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CMTypedTag<CMStereoViewComponents>);
  uint64_t result = swift_allocObject();
  *(void *)(result + 40) = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(result + 48) = 0;
  *(void *)(result + 56) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(result + 64) = 0;
  *(_DWORD *)(result + 72) = 1702454643;
  *(_DWORD *)(result + 16) = 1702454643;
  *(void *)(result + 24) = a1;
  *(unsigned char *)(result + 32) = 3;
  return result;
}

uint64_t static CMTag.stereoViewInterpretation(_:)(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CMTypedTag<CMStereoViewInterpretationOptions>);
  uint64_t result = swift_allocObject();
  *(void *)(result + 40) = closure #1 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(result + 48) = 0;
  *(void *)(result + 56) = closure #2 in CMTypedTag.Category<>.init(rawCategory:);
  *(void *)(result + 64) = 0;
  *(_DWORD *)(result + 72) = 1702455664;
  *(_DWORD *)(result + 16) = 1702455664;
  *(void *)(result + 24) = a1;
  *(unsigned char *)(result + 32) = 3;
  return result;
}

unsigned int *closure #2 in CMTypedTag.Category<>.init(rawCategory:)@<X0>(unsigned int *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 2;
  return result;
}

uint64_t closure #1 in CMTypedTag.Category<>.init(rawCategory:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  int v2 = *(unsigned __int8 *)(result + 8);
  if (*(unsigned char *)(result + 8))
  {
    LODWORD(v3) = 0;
LABEL_5:
    *(_DWORD *)a2 = v3;
    *(unsigned char *)(a2 + 4) = v2 != 0;
    return result;
  }
  uint64_t v3 = *(void *)result;
  if (*(void *)result < (int64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (v3 <= 0x7FFFFFFF)
  {
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

int *closure #2 in CMTypedTag.Category<>.init(rawCategory:)@<X0>(int *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

unsigned int *closure #1 in CMTypedTag.Category<>.init(rawCategory:)@<X0>(unsigned int *result@<X0>, uint64_t a2@<X8>)
{
  int v2 = *((unsigned __int8 *)result + 8);
  if (v2 == 2) {
    uint64_t v3 = *result;
  }
  else {
    uint64_t v3 = 0;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v2 != 2;
  return result;
}

void *closure #2 in CMTypedTag.Category<>.init(rawCategory:)@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  if (HIDWORD(*result))
  {
    __break(1u);
  }
  else
  {
    *(void *)a2 = *result;
    *(unsigned char *)(a2 + 8) = 2;
  }
  return result;
}

{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 3;
  return result;
}

{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t *closure #1 in CMTypedTag.Category<>.init(rawCategory:)@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  int v2 = *((unsigned __int8 *)result + 8);
  if (v2 == 3) {
    uint64_t v3 = *result;
  }
  else {
    uint64_t v3 = 0;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v2 != 3;
  return result;
}

{
  int v2;
  uint64_t v3;

  int v2 = *((unsigned __int8 *)result + 8);
  if (*((unsigned char *)result + 8)) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = *result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v2 != 0;
  return result;
}

int *closure #1 in CMTypedTag.Category<>.init(rawCategory:)@<X0>(int *result@<X0>, uint64_t a2@<X8>)
{
  int v2 = *((unsigned __int8 *)result + 8);
  if (v2 == 2) {
    int v3 = *result;
  }
  else {
    int v3 = 0;
  }
  *(_DWORD *)a2 = v3;
  *(unsigned char *)(a2 + 4) = v2 != 2;
  return result;
}

uint64_t Sequence<>.filter<A>(matchingCategory:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  long long v7 = *(_OWORD *)(a1 + 16);
  v16[0] = *(_OWORD *)a1;
  v16[1] = v7;
  int v17 = *(_DWORD *)(a1 + 32);
  long long v8 = *(_OWORD *)(a1 + 16);
  v23[0] = *(_OWORD *)a1;
  v23[1] = v8;
  int v24 = *(_DWORD *)(a1 + 32);
  uint64_t v19 = a2;
  uint64_t v20 = a3;
  uint64_t v21 = a4;
  unsigned __int8 v22 = v23;
  uint64_t v18 = Sequence.compactMap<A>(_:)();
  CMSampleBufferRef v15[2] = a2;
  v15[3] = a3;
  v15[4] = a4;
  v15[5] = v16;
  uint64_t v9 = type metadata accessor for Array();
  uint64_t v10 = type metadata accessor for CMTypedTag();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v13 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in Sequence<>.filter<A>(matchingCategory:), (uint64_t)v15, v9, v10, MEMORY[0x1E4FBC248], WitnessTable, MEMORY[0x1E4FBC278], v12);
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v30 = a5;
  uint64_t v31 = a8;
  v40 = a1;
  uint64_t v41 = a2;
  uint64_t v29 = *(void *)(a5 - 8);
  MEMORY[0x1F4188790](a1);
  v42 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v35 = *(void (***)(char *, uint64_t))(AssociatedTypeWitness - 8);
  uint64_t v11 = MEMORY[0x1F4188790](AssociatedTypeWitness);
  uint64_t v13 = (char *)&v28 - v12;
  uint64_t v14 = a4;
  MEMORY[0x1F4188790](v11);
  uint64_t v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = swift_getAssociatedTypeWitness();
  uint64_t v32 = *(void *)(v17 - 8);
  uint64_t v33 = v17;
  MEMORY[0x1F4188790](v17);
  uint64_t v19 = (char *)&v28 - v18;
  uint64_t v20 = dispatch thunk of Collection.count.getter();
  if (!v20) {
    return static Array._allocateUninitialized(_:)();
  }
  Swift::Int v21 = v20;
  uint64_t v45 = MEMORY[0x1C188D6B0](v14);
  uint64_t v34 = type metadata accessor for ContiguousArray();
  ContiguousArray.reserveCapacity(_:)(v21);
  uint64_t v38 = v8;
  uint64_t result = dispatch thunk of Collection.startIndex.getter();
  if (v21 < 0)
  {
    __break(1u);
  }
  else
  {
    v36 = (void (**)(char *))(v35 + 2);
    v37 = v16;
    ++v35;
    while (1)
    {
      long long v23 = (void (*)(char *, void))dispatch thunk of Collection.subscript.read();
      int v24 = v13;
      long long v25 = v13;
      uint64_t v26 = AssociatedTypeWitness;
      (*v36)(v24);
      v23(v44, 0);
      uint64_t v27 = v43;
      v40(v25, v42);
      if (v27) {
        break;
      }
      uint64_t v43 = 0;
      (*v35)(v25, v26);
      ContiguousArray.append(_:)();
      dispatch thunk of Collection.formIndex(after:)();
      --v21;
      uint64_t v13 = v25;
      if (!v21)
      {
        (*(void (**)(char *, uint64_t))(v32 + 8))(v19, v33);
        return v45;
      }
    }
    (*v35)(v25, v26);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v19, v33);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v29 + 32))(v31, v42, v30);
  }
  return result;
}

uint64_t Sequence<>.firstValue<A>(matchingCategory:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for LazySequence();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)v17 - v10;
  int v12 = *(_DWORD *)(a1 + 32);
  MEMORY[0x1C188D470](a2, a4);
  uint64_t WitnessTable = swift_getWitnessTable();
  long long v14 = *(_OWORD *)(a1 + 16);
  v18[0] = *(_OWORD *)a1;
  v18[1] = v14;
  int v19 = v12;
  void v17[2] = v8;
  v17[3] = a3;
  v17[4] = WitnessTable;
  v17[5] = v18;
  uint64_t v15 = Sequence.compactMap<A>(_:)();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v17[0] = v15;
  type metadata accessor for Array();
  swift_getWitnessTable();
  Collection.first.getter();
  return swift_bridgeObjectRelease();
}

uint64_t Sequence<>.first<A>(matchingCategory:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for LazySequence();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)v17 - v10;
  int v12 = *(_DWORD *)(a1 + 32);
  MEMORY[0x1C188D470](a2, a4);
  long long v13 = *(_OWORD *)(a1 + 16);
  v18[0] = *(_OWORD *)a1;
  v18[1] = v13;
  int v19 = v12;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v15 = Sequence<>.filter<A>(matchingCategory:)((uint64_t)v18, v8, a3, WitnessTable);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v17[1] = v15;
  type metadata accessor for CMTypedTag();
  type metadata accessor for Array();
  swift_getWitnessTable();
  Collection.first.getter();
  swift_bridgeObjectRelease();
  return *(void *)&v18[0];
}

uint64_t specialized static CMTag.Value.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)a1;
  double v3 = *(double *)a2;
  int v4 = *(unsigned __int8 *)(a2 + 8);
  switch(*(unsigned char *)(a1 + 8))
  {
    case 1:
      uint64_t result = v4 == 1 && *(double *)a1 == v3;
      break;
    case 2:
      BOOL v6 = LODWORD(v2) == LODWORD(v3);
      uint64_t result = v4 == 2 && v6;
      break;
    case 3:
      BOOL v5 = v4 == 3;
      goto LABEL_7;
    default:
      BOOL v5 = v4 == 0;
LABEL_7:
      uint64_t result = v5 && *(void *)&v2 == *(void *)&v3;
      break;
  }
  return result;
}

uint64_t type metadata accessor for CMTypedTag.Category()
{
  return __swift_instantiateGenericMetadata();
}

BOOL specialized static CMTag.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  CMTagCategory v4 = *(_DWORD *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 24);
  switch(*(unsigned char *)(a1 + 32))
  {
    case 1:
      CMTag v11 = CMTagMakeWithFloat64Value(v4, *(Float64 *)(a1 + 24));
      CMTagValue value = v11.value;
      uint64_t v6 = *(void *)&v11.category;
      break;
    case 2:
      CMTag v9 = CMTagMakeWithOSTypeValue(v4, v5);
      CMTagValue value = v9.value;
      uint64_t v6 = *(void *)&v9.category;
      break;
    case 3:
      CMTag v10 = CMTagMakeWithFlagsValue(v4, v5);
      CMTagValue value = v10.value;
      uint64_t v6 = *(void *)&v10.category;
      break;
    default:
      CMTag v8 = CMTagMakeWithSInt64Value(v4, v5);
      CMTagValue value = v8.value;
      uint64_t v6 = *(void *)&v8.category;
      break;
  }
  uint64_t v12 = v6;
  CMTagValue v13 = value;
  CMTagCategory v14 = *(_DWORD *)(a2 + 16);
  uint64_t v15 = *(void *)(a2 + 24);
  switch(*(unsigned char *)(a2 + 32))
  {
    case 1:
      CMTag v21 = CMTagMakeWithFloat64Value(v14, *(Float64 *)(a2 + 24));
      CMTagValue v17 = v21.value;
      uint64_t v16 = *(void *)&v21.category;
      break;
    case 2:
      CMTag v19 = CMTagMakeWithOSTypeValue(v14, v15);
      CMTagValue v17 = v19.value;
      uint64_t v16 = *(void *)&v19.category;
      break;
    case 3:
      CMTag v20 = CMTagMakeWithFlagsValue(v14, v15);
      CMTagValue v17 = v20.value;
      uint64_t v16 = *(void *)&v20.category;
      break;
    default:
      CMTag v18 = CMTagMakeWithSInt64Value(v14, v15);
      CMTagValue v17 = v18.value;
      uint64_t v16 = *(void *)&v18.category;
      break;
  }
  *(void *)&v24.category = v16;
  v24.CMTagValue value = v17;
  *(void *)&v23.category = v12;
  v23.CMTagValue value = v13;
  return CMTagEqualToTag(v23, v24) != 0;
}

uint64_t specialized CMTypedTag.init(category:value:)(uint64_t a1, uint64_t a2)
{
  void (*v4)(uint64_t *__return_ptr, uint64_t);
  uint64_t v5;
  int v6;
  uint64_t v7;
  char v8;
  uint64_t v10;
  char v11;

  uint64_t v3 = v2;
  CMTagCategory v4 = *(void (**)(uint64_t *__return_ptr, uint64_t))(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v6 = *(_DWORD *)(a1 + 32);
  *(_OWORD *)(v3 + 40) = *(_OWORD *)a1;
  *(void *)(v3 + 56) = v4;
  *(void *)(v3 + 64) = v5;
  *(_DWORD *)(v3 + 72) = v6;
  v4(&v10, a2);
  long long v7 = v10;
  CMTag v8 = v11;
  *(_DWORD *)(v3 + 16) = v6;
  *(void *)(v3 + 24) = v7;
  *(unsigned char *)(v3 + 32) = v8;
  return v3;
}

uint64_t specialized CMTypedTag.__allocating_init(category:value:)(uint64_t a1, uint64_t a2)
{
  void (*v5)(uint64_t *__return_ptr, uint64_t);
  uint64_t v6;
  int v7;
  uint64_t v8;
  char v9;
  uint64_t v11;
  char v12;

  type metadata accessor for CMTypedTag();
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = *(void (**)(uint64_t *__return_ptr, uint64_t))(a1 + 16);
  uint64_t v6 = *(void *)(a1 + 24);
  long long v7 = *(_DWORD *)(a1 + 32);
  *(_OWORD *)(v4 + 40) = *(_OWORD *)a1;
  *(void *)(v4 + 56) = v5;
  *(void *)(v4 + 64) = v6;
  *(_DWORD *)(v4 + 72) = v7;
  v5(&v11, a2);
  CMTag v8 = v11;
  CMTag v9 = v12;
  *(_DWORD *)(v4 + 16) = v7;
  *(void *)(v4 + 24) = v8;
  *(unsigned char *)(v4 + 32) = v9;
  return v4;
}

void specialized CMTypedTag.init(rawCategory:rawTagValue:)()
{
}

uint64_t partial apply for closure #1 in Sequence<>.filter<A>(matchingCategory:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = *(void *)(v2 + 40);
  type metadata accessor for CMTypedTag();
  long long v6 = *(_OWORD *)(v5 + 16);
  v8[0] = *(_OWORD *)v5;
  v8[1] = v6;
  int v9 = *(_DWORD *)(v5 + 32);
  outlined retain of CMTypedTag<A1>.Category(v5);
  uint64_t result = specialized CMTypedTag.__allocating_init(category:value:)((uint64_t)v8, a1);
  *a2 = result;
  return result;
}

uint64_t type metadata accessor for CMTypedTag()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t instantiation function for generic protocol witness table for CMTagCategory(uint64_t a1)
{
  *(void *)(a1 + 8) = lazy protocol witness table accessor for type CMTagCategory and conformance CMTagCategory(&lazy protocol witness table cache variable for type CMTagCategory and conformance CMTagCategory);
  uint64_t result = lazy protocol witness table accessor for type CMTagCategory and conformance CMTagCategory(&lazy protocol witness table cache variable for type CMTagCategory and conformance CMTagCategory);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMTagCategory(void *a1)
{
  a1[1] = lazy protocol witness table accessor for type CMTagCategory and conformance CMTagCategory(&lazy protocol witness table cache variable for type CMTagCategory and conformance CMTagCategory);
  a1[2] = lazy protocol witness table accessor for type CMTagCategory and conformance CMTagCategory(&lazy protocol witness table cache variable for type CMTagCategory and conformance CMTagCategory);
  uint64_t result = lazy protocol witness table accessor for type CMTagCategory and conformance CMTagCategory(&lazy protocol witness table cache variable for type CMTagCategory and conformance CMTagCategory);
  a1[3] = result;
  return result;
}

uint64_t lazy protocol witness table accessor for type CMTagCategory and conformance CMTagCategory(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CMTagCategory(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for CMTag()
{
  return self;
}

uint64_t method lookup function for CMTag(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CMTag);
}

uint64_t dispatch thunk of CMTag.__allocating_init(rawCategory:rawTagValue:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of CMTag.value<A>(onlyIfMatching:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of CMTag.description.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t getEnumTagSinglePayload for CMTag.Value(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CMTag.Value(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t destructiveInjectEnumTag for CMTag.Value(uint64_t result, char a2)
{
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CMTag.Value()
{
  return &type metadata for CMTag.Value;
}

uint64_t type metadata instantiation function for CMTypedTag()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t type metadata completion function for CMTypedTag()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for CMTypedTag(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for CMTypedTag);
}

uint64_t dispatch thunk of CMTypedTag.value.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of CMTypedTag.__allocating_init(category:value:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t type metadata instantiation function for CMTypedTag.Category(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 24);
}

uint64_t destroy for CMTypedTag.Category()
{
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for CMTypedTag.Category(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v3;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CMTypedTag.Category(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_retain();
  swift_release();
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  return a1;
}

__n128 __swift_memcpy36_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for CMTypedTag.Category(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for CMTypedTag.Category(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 36)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CMTypedTag.Category(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(_DWORD *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 36) = 1;
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
    *(unsigned char *)(result + 36) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t outlined retain of CMTypedTag<A1>.Category(uint64_t a1)
{
  return a1;
}

uint64_t partial apply for closure #1 in Sequence<>.compactMap<A>(toValuesMatchingCategory:)(uint64_t *a1)
{
  uint64_t v2 = *(void *)(v1 + 24);
  uint64_t v3 = *(void *)(v1 + 40);
  uint64_t v4 = *a1;
  long long v5 = *(_OWORD *)(v3 + 16);
  v7[0] = *(_OWORD *)v3;
  v7[1] = v5;
  int v8 = *(_DWORD *)(v3 + 32);
  return (*(uint64_t (**)(_OWORD *, uint64_t))(*(void *)v4 + 112))(v7, v2);
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> ()(void *a1, uint64_t (*a2)(void))
{
  return a2(*a1);
}

uint64_t CMBufferQueueRef.Handlers.getDecodeTimeStamp.getter()
{
  uint64_t v1 = *v0;
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(*v0);
  return v1;
}

uint64_t CMBufferQueueRef.Handlers.getPresentationTimeStamp.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v1);
  return v1;
}

uint64_t CMBufferQueueRef.Handlers.getDuration.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_retain();
  return v1;
}

uint64_t CMBufferQueueRef.Handlers.isDataReady.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v1);
  return v1;
}

uint64_t outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t CMBufferQueueRef.Handlers.compare.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v1);
  return v1;
}

uint64_t CMBufferQueueRef.Handlers.dataBecameReadyNotification.getter()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CMBufferQueueRef.Handlers.getSize.getter()
{
  uint64_t v1 = *(void *)(v0 + 96);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v1);
  return v1;
}

uint64_t CMBufferQueueRef.Handlers.Builder.dataBecameReadyNotification.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 80) = a1;
  *(void *)(v2 + 88) = a2;
  return result;
}

uint64_t (*CMBufferQueueRef.Handlers.Builder.dataBecameReadyNotification.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

uint64_t CMBufferQueueRef.Handlers.Builder.getDecodeTimeStamp(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  swift_retain();
  uint64_t result = outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v5);
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t CMBufferQueueRef.Handlers.Builder.getPresentationTimeStamp(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 16);
  swift_retain();
  uint64_t result = outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v5);
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t CMBufferQueueRef.Handlers.Builder.getDuration(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 32);
  swift_retain();
  uint64_t result = outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v5);
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t CMBufferQueueRef.Handlers.Builder.isDataReady(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 48);
  swift_retain();
  uint64_t result = outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v5);
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return result;
}

uint64_t outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t CMBufferQueueRef.Handlers.Builder.compare(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 64);
  swift_retain();
  uint64_t result = outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v5);
  *(void *)(v2 + 64) = a1;
  *(void *)(v2 + 72) = a2;
  return result;
}

uint64_t CMBufferQueueRef.Handlers.Builder.getSize(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 96);
  swift_retain();
  uint64_t result = outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v5);
  *(void *)(v2 + 96) = a1;
  *(void *)(v2 + 104) = a2;
  return result;
}

uint64_t *CMBufferQueueRef.Handlers.Builder.build(handlers:)@<X0>(uint64_t *result@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v4 = result[1];
  uint64_t v5 = result[4];
  uint64_t v47 = result[2];
  uint64_t v48 = result[6];
  uint64_t v7 = *v2;
  uint64_t v6 = v2[1];
  uint64_t v8 = v2[2];
  uint64_t v9 = v2[5];
  uint64_t v56 = v2[7];
  uint64_t v10 = v2[8];
  uint64_t v58 = v2[9];
  uint64_t v67 = v2[11];
  uint64_t v60 = v2[12];
  uint64_t v62 = v2[4];
  uint64_t v65 = v2[10];
  uint64_t v52 = v2[3];
  uint64_t v53 = v2[13];
  uint64_t v44 = result[13];
  uint64_t v45 = result[11];
  uint64_t v49 = result[8];
  uint64_t v50 = result[12];
  uint64_t v46 = result[10];
  uint64_t v42 = result[7];
  uint64_t v43 = result[9];
  uint64_t v57 = v2[6];
  uint64_t v41 = result[3];
  uint64_t v63 = *result;
  if (v62)
  {
    uint64_t v11 = result[4];
    uint64_t v12 = v2[4];
    uint64_t v13 = v9;
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v12;
    *(void *)(v14 + 24) = v13;
  }
  else
  {
    if (!v5)
    {
      __break(1u);
      return result;
    }
    uint64_t v15 = result[5];
    uint64_t v14 = swift_allocObject();
    uint64_t v11 = v5;
    *(void *)(v14 + 16) = v5;
    *(void *)(v14 + 24) = v15;
    swift_retain();
  }
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned CMTime);
  *(void *)(v16 + 24) = v14;
  uint64_t v55 = v16;
  if (v7)
  {
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v7;
    *(void *)(v17 + 24) = v6;
    uint64_t v18 = v10;
LABEL_10:
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned CMTime);
    *(void *)(v20 + 24) = v17;
    outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v7);
    v66 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Swift.AnyObject) -> (@out CMTime);
    uint64_t v19 = v11;
    goto LABEL_11;
  }
  uint64_t v19 = v11;
  uint64_t v18 = v10;
  v66 = 0;
  uint64_t v20 = 0;
  if (v11 && v63)
  {
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v63;
    *(void *)(v17 + 24) = v4;
    swift_retain();
    goto LABEL_10;
  }
LABEL_11:
  if (v8)
  {
    uint64_t v51 = v19;
    uint64_t v21 = v18;
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = v8;
    *(void *)(v22 + 24) = v52;
    uint64_t v24 = v58;
    uint64_t v23 = v60;
LABEL_16:
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned CMTime);
    *(void *)(v27 + 24) = v22;
    uint64_t v64 = v27;
    outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v8);
    long long v25 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Swift.AnyObject) -> (@out CMTime);
    uint64_t v26 = v24;
    uint64_t v18 = v21;
    uint64_t v19 = v51;
    goto LABEL_17;
  }
  long long v25 = 0;
  uint64_t v26 = v58;
  uint64_t v23 = v60;
  if (v19)
  {
    uint64_t v64 = 0;
    if (!v47) {
      goto LABEL_17;
    }
    uint64_t v51 = v19;
    uint64_t v21 = v18;
    uint64_t v24 = v58;
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = v47;
    *(void *)(v22 + 24) = v41;
    swift_retain();
    goto LABEL_16;
  }
  uint64_t v64 = 0;
LABEL_17:
  v61 = v25;
  uint64_t v54 = v20;
  if (v57)
  {
    uint64_t v28 = swift_allocObject();
    *(void *)(v28 + 16) = v57;
    *(void *)(v28 + 24) = v56;
LABEL_22:
    uint64_t v30 = swift_allocObject();
    *(void *)(v30 + 16) = partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool);
    *(void *)(v30 + 24) = v28;
    outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v57);
    uint64_t v29 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Swift.AnyObject) -> (@out Bool);
    goto LABEL_23;
  }
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  if (v19 && v48)
  {
    uint64_t v28 = swift_allocObject();
    *(void *)(v28 + 16) = v48;
    *(void *)(v28 + 24) = v42;
    swift_retain();
    goto LABEL_22;
  }
LABEL_23:
  v59 = v29;
  if (v18)
  {
    uint64_t v31 = swift_allocObject();
    *(void *)(v31 + 16) = v18;
    *(void *)(v31 + 24) = v26;
LABEL_28:
    uint64_t v33 = swift_allocObject();
    *(void *)(v33 + 16) = partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject, @guaranteed Swift.AnyObject) -> (@unowned CFComparisonResult);
    *(void *)(v33 + 24) = v31;
    outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v18);
    uint64_t v32 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Swift.AnyObject, @in_guaranteed Swift.AnyObject) -> (@out CFComparisonResult);
    goto LABEL_29;
  }
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  if (v19 && v49)
  {
    uint64_t v31 = swift_allocObject();
    *(void *)(v31 + 16) = v49;
    *(void *)(v31 + 24) = v43;
    swift_retain();
    goto LABEL_28;
  }
LABEL_29:
  uint64_t v34 = v66;
  uint64_t v35 = v67;
  if (!v67)
  {
    if (!v19)
    {
      uint64_t v65 = 0;
      uint64_t v35 = 0;
      if (v23) {
        goto LABEL_33;
      }
      goto LABEL_35;
    }
    uint64_t v35 = v45;
    swift_bridgeObjectRetain();
    uint64_t v65 = v46;
  }
  if (v23)
  {
LABEL_33:
    uint64_t v36 = swift_allocObject();
    *(void *)(v36 + 16) = v23;
    *(void *)(v36 + 24) = v53;
    uint64_t v37 = v23;
    uint64_t v38 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Int)partial apply;
LABEL_38:
    uint64_t v40 = swift_allocObject();
    *(void *)(v40 + 16) = v38;
    *(void *)(v40 + 24) = v36;
    outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v37);
    v39 = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Swift.AnyObject) -> (@out Int);
    uint64_t v34 = v66;
    goto LABEL_39;
  }
LABEL_35:
  v39 = 0;
  uint64_t v40 = 0;
  if (v19 && v50)
  {
    uint64_t v36 = swift_allocObject();
    *(void *)(v36 + 16) = v50;
    *(void *)(v36 + 24) = v44;
    swift_retain();
    uint64_t v37 = v23;
    uint64_t v38 = (uint64_t (*)())partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Int);
    goto LABEL_38;
  }
LABEL_39:
  *a2 = v34;
  a2[1] = (uint64_t (*)())v54;
  a2[2] = v61;
  a2[3] = (uint64_t (*)())v64;
  a2[4] = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Swift.AnyObject) -> (@out CMTime);
  a2[5] = (uint64_t (*)())v55;
  a2[6] = (uint64_t (*)())v59;
  a2[7] = (uint64_t (*)())v30;
  a2[8] = (uint64_t (*)())v32;
  a2[9] = (uint64_t (*)())v33;
  a2[10] = (uint64_t (*)())v65;
  a2[11] = (uint64_t (*)())v35;
  a2[12] = (uint64_t (*)())v39;
  a2[13] = (uint64_t (*)())v40;
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v62);

  return (uint64_t *)swift_bridgeObjectRetain();
}

double CMBufferQueueRef.Handlers.init(withHandlers:)@<D0>(void (*a1)(long long *)@<X0>, _OWORD *a2@<X8>)
{
  long long v27 = 0u;
  long long v25 = 0u;
  memset(v26, 0, sizeof(v26));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  a1(&v22);
  uint64_t v3 = v22;
  uint64_t v4 = v23;
  uint64_t v5 = v24;
  uint64_t v6 = v25;
  uint64_t v14 = *(void *)&v26[0];
  uint64_t v15 = v27;
  v16[7] = v22;
  v16[8] = v23;
  v16[9] = v24;
  v16[10] = v25;
  uint64_t v17 = *(void *)&v26[0];
  long long v18 = *(_OWORD *)((char *)v26 + 8);
  uint64_t v19 = *((void *)&v26[1] + 1);
  long long v20 = v27;
  memset(v16, 0, 112);
  CMBufferQueueRef.Handlers.Builder.build(handlers:)((uint64_t *)v16, (uint64_t (**)())v21);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v3);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v4);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v5);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v6);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v14);
  swift_bridgeObjectRelease();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v15);
  double result = *(double *)v21;
  long long v8 = v21[1];
  long long v9 = v21[2];
  long long v10 = v21[3];
  long long v11 = v21[4];
  long long v12 = v21[5];
  long long v13 = v21[6];
  *a2 = v21[0];
  a2[1] = v8;
  a2[2] = v9;
  a2[3] = v10;
  a2[4] = v11;
  a2[5] = v12;
  a2[6] = v13;
  return result;
}

uint64_t CMBufferQueueRef.Handlers.withHandlers(_:)@<X0>(void (*a1)(long long *)@<X0>, uint64_t (**a2)()@<X8>)
{
  long long v11 = *v2;
  uint64_t v9 = *((void *)v2 + 3);
  uint64_t v10 = *((void *)v2 + 2);
  long long v16 = v2[4];
  long long v17 = v2[3];
  long long v15 = v2[5];
  uint64_t v13 = *((void *)v2 + 13);
  uint64_t v14 = *((void *)v2 + 12);
  long long v41 = 0u;
  long long v39 = 0u;
  memset(v40, 0, sizeof(v40));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v36 = 0u;
  a1(&v36);
  uint64_t v3 = v36;
  uint64_t v4 = v37;
  uint64_t v5 = v38;
  uint64_t v6 = v39;
  uint64_t v8 = *(void *)&v40[0];
  uint64_t v12 = v41;
  long long v28 = v36;
  long long v29 = v37;
  long long v30 = v38;
  long long v31 = v39;
  long long v33 = *(_OWORD *)((char *)v40 + 8);
  uint64_t v32 = *(void *)&v40[0];
  uint64_t v34 = *((void *)&v40[1] + 1);
  long long v35 = v41;
  long long v19 = v11;
  uint64_t v20 = v10;
  uint64_t v21 = v9;
  long long v22 = v2[2];
  long long v23 = v17;
  long long v24 = v16;
  long long v25 = v15;
  uint64_t v26 = v14;
  uint64_t v27 = v13;
  CMBufferQueueRef.Handlers.Builder.build(handlers:)((uint64_t *)&v19, a2);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v3);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v4);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v5);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v6);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v8);
  swift_bridgeObjectRelease();

  return outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v12);
}

double CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:)@<D0>(long long *a1@<X0>, _OWORD *a2@<X8>)
{
  long long v27 = 0u;
  long long v25 = 0u;
  memset(v26, 0, sizeof(v26));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  closure #1 in CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:)((uint64_t *)&v22, a1);
  uint64_t v3 = v22;
  uint64_t v4 = v23;
  uint64_t v5 = v24;
  uint64_t v6 = v25;
  uint64_t v14 = *(void *)&v26[0];
  uint64_t v15 = v27;
  v16[7] = v22;
  v16[8] = v23;
  v16[9] = v24;
  v16[10] = v25;
  uint64_t v17 = *(void *)&v26[0];
  long long v18 = *(_OWORD *)((char *)v26 + 8);
  uint64_t v19 = *((void *)&v26[1] + 1);
  long long v20 = v27;
  memset(v16, 0, 112);
  CMBufferQueueRef.Handlers.Builder.build(handlers:)((uint64_t *)v16, (uint64_t (**)())v21);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v3);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v4);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v5);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v6);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v14);
  swift_bridgeObjectRelease();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v15);
  double result = *(double *)v21;
  long long v8 = v21[1];
  long long v9 = v21[2];
  long long v10 = v21[3];
  long long v11 = v21[4];
  long long v12 = v21[5];
  long long v13 = v21[6];
  *a2 = v21[0];
  a2[1] = v8;
  a2[2] = v9;
  a2[3] = v10;
  a2[4] = v11;
  a2[5] = v12;
  a2[6] = v13;
  return result;
}

uint64_t closure #1 in CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:)(uint64_t *a1, long long *a2)
{
  uint64_t v4 = *(void *)((char *)a2 + 12);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    long long v6 = *a2;
    *(_OWORD *)(v5 + 40) = a2[1];
    long long v7 = a2[3];
    *(_OWORD *)(v5 + 56) = a2[2];
    *(_OWORD *)(v5 + 72) = v7;
    *(_DWORD *)(v5 + 88) = *((_DWORD *)a2 + 16);
    *(_OWORD *)(v5 + 24) = v6;
    outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(*a1);
    *a1 = (uint64_t)partial apply for closure #2 in closure #1 in CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:);
    a1[1] = v5;
  }
  uint64_t v8 = *(void *)((char *)a2 + 20);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    long long v10 = *a2;
    *(_OWORD *)(v9 + 40) = a2[1];
    long long v11 = a2[3];
    *(_OWORD *)(v9 + 56) = a2[2];
    *(_OWORD *)(v9 + 72) = v11;
    *(_DWORD *)(v9 + 88) = *((_DWORD *)a2 + 16);
    *(_OWORD *)(v9 + 24) = v10;
    outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(a1[2]);
    a1[2] = (uint64_t)partial apply for closure #2 in closure #1 in CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:);
    a1[3] = v9;
  }
  uint64_t v12 = swift_allocObject();
  long long v13 = a2[3];
  *(_OWORD *)(v12 + 48) = a2[2];
  *(_OWORD *)(v12 + 64) = v13;
  *(_DWORD *)(v12 + 80) = *((_DWORD *)a2 + 16);
  long long v14 = a2[1];
  *(_OWORD *)(v12 + 16) = *a2;
  *(_OWORD *)(v12 + 32) = v14;
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(a1[4]);
  a1[4] = (uint64_t)partial apply for closure #3 in closure #1 in CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:);
  a1[5] = v12;
  uint64_t v15 = *(void *)((char *)a2 + 36);
  if (v15)
  {
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v15;
    long long v17 = *a2;
    *(_OWORD *)(v16 + 40) = a2[1];
    long long v18 = a2[3];
    *(_OWORD *)(v16 + 56) = a2[2];
    *(_OWORD *)(v16 + 72) = v18;
    *(_DWORD *)(v16 + 88) = *((_DWORD *)a2 + 16);
    *(_OWORD *)(v16 + 24) = v17;
    outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(a1[6]);
    a1[6] = (uint64_t)partial apply for closure #4 in closure #1 in CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:);
    a1[7] = v16;
  }
  uint64_t v19 = *(void *)((char *)a2 + 44);
  if (v19)
  {
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v19;
    long long v21 = *a2;
    *(_OWORD *)(v20 + 40) = a2[1];
    long long v22 = a2[3];
    *(_OWORD *)(v20 + 56) = a2[2];
    *(_OWORD *)(v20 + 72) = v22;
    *(_DWORD *)(v20 + 88) = *((_DWORD *)a2 + 16);
    *(_OWORD *)(v20 + 24) = v21;
    outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(a1[8]);
    a1[8] = (uint64_t)partial apply for closure #5 in closure #1 in CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:);
    a1[9] = v20;
  }
  outlined init with take of String?((uint64_t)a2 + 52, (uint64_t)&v32, &demangling cache variable for type metadata for Unmanaged<CFStringRef>?);
  uint64_t result = outlined init with take of String?((uint64_t)&v32, (uint64_t)&v33, &demangling cache variable for type metadata for Unmanaged<CFStringRef>?);
  if (v33)
  {
    id v24 = v33;
    uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v27 = v26;

    uint64_t result = swift_bridgeObjectRelease();
    a1[10] = v25;
    a1[11] = v27;
  }
  uint64_t v28 = *(void *)((char *)a2 + 60);
  if (v28)
  {
    uint64_t v29 = swift_allocObject();
    *(void *)(v29 + 16) = v28;
    long long v30 = *a2;
    *(_OWORD *)(v29 + 40) = a2[1];
    long long v31 = a2[3];
    *(_OWORD *)(v29 + 56) = a2[2];
    *(_OWORD *)(v29 + 72) = v31;
    *(_DWORD *)(v29 + 88) = *((_DWORD *)a2 + 16);
    *(_OWORD *)(v29 + 24) = v30;
    uint64_t result = outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(a1[12]);
    a1[12] = (uint64_t)partial apply for closure #6 in closure #1 in CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:);
    a1[13] = v29;
  }
  return result;
}

double one-time initialization function for unsortedSampleBuffers(uint64_t a1)
{
  return one-time initialization function for unsortedSampleBuffers(a1, MEMORY[0x1E4F1EA20], &static CMBufferQueueRef.Handlers.unsortedSampleBuffers);
}

uint64_t static CMBufferQueueRef.Handlers.unsortedSampleBuffers.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for unsortedSampleBuffers != -1) {
    swift_once();
  }
  uint64_t v2 = static CMBufferQueueRef.Handlers.unsortedSampleBuffers;
  uint64_t v3 = unk_1EA0FD240;
  uint64_t v4 = qword_1EA0FD248;
  uint64_t v5 = unk_1EA0FD250;
  uint64_t v6 = qword_1EA0FD258;
  uint64_t v7 = unk_1EA0FD260;
  uint64_t v8 = qword_1EA0FD268;
  uint64_t v9 = unk_1EA0FD270;
  uint64_t v10 = qword_1EA0FD278;
  uint64_t v11 = qword_1EA0FD290;
  uint64_t v12 = unk_1EA0FD298;
  uint64_t v13 = qword_1EA0FD2A0;
  *(void *)a1 = static CMBufferQueueRef.Handlers.unsortedSampleBuffers;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = v9;
  *(void *)(a1 + 64) = v10;
  *(_OWORD *)(a1 + 72) = unk_1EA0FD280;
  *(void *)(a1 + 88) = v11;
  *(void *)(a1 + 96) = v12;
  *(void *)(a1 + 104) = v13;
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v2);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v4);
  swift_retain();
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v8);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v10);
  swift_bridgeObjectRetain();

  return outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v12);
}

double one-time initialization function for outputPTSSortedSampleBuffers(uint64_t a1)
{
  return one-time initialization function for unsortedSampleBuffers(a1, MEMORY[0x1E4F1EA18], &static CMBufferQueueRef.Handlers.outputPTSSortedSampleBuffers);
}

double one-time initialization function for unsortedSampleBuffers(uint64_t a1, uint64_t (*a2)(void), _OWORD *a3)
{
  uint64_t v4 = a2();
  long long v5 = *(_OWORD *)(v4 + 48);
  _OWORD v8[2] = *(_OWORD *)(v4 + 32);
  v8[3] = v5;
  int v9 = *(_DWORD *)(v4 + 64);
  long long v6 = *(_OWORD *)(v4 + 16);
  v8[0] = *(_OWORD *)v4;
  v8[1] = v6;
  return CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:)(v8, a3);
}

uint64_t static CMBufferQueueRef.Handlers.outputPTSSortedSampleBuffers.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for outputPTSSortedSampleBuffers != -1) {
    swift_once();
  }
  uint64_t v2 = static CMBufferQueueRef.Handlers.outputPTSSortedSampleBuffers;
  uint64_t v3 = unk_1EA0FD2B0;
  uint64_t v4 = qword_1EA0FD2B8;
  uint64_t v5 = unk_1EA0FD2C0;
  uint64_t v6 = qword_1EA0FD2C8;
  uint64_t v7 = unk_1EA0FD2D0;
  uint64_t v8 = qword_1EA0FD2D8;
  uint64_t v9 = unk_1EA0FD2E0;
  uint64_t v10 = qword_1EA0FD2E8;
  uint64_t v11 = qword_1EA0FD300;
  uint64_t v12 = unk_1EA0FD308;
  uint64_t v13 = qword_1EA0FD310;
  *(void *)a1 = static CMBufferQueueRef.Handlers.outputPTSSortedSampleBuffers;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = v9;
  *(void *)(a1 + 64) = v10;
  *(_OWORD *)(a1 + 72) = *(_OWORD *)algn_1EA0FD2F0;
  *(void *)(a1 + 88) = v11;
  *(void *)(a1 + 96) = v12;
  *(void *)(a1 + 104) = v13;
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v2);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v4);
  swift_retain();
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v8);
  outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v10);
  swift_bridgeObjectRetain();

  return outlined copy of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v12);
}

uint64_t specialized CMBufferQueueRef.Handlers.withOpaquePointer<A>(_:)(uint64_t *a1, CMItemCount a2, CMBufferQueueRef *a3)
{
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any?>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1BE226020;
  if (v5)
  {
    uint64_t v48 = v5;
    uint64_t v49 = v6;
    CMTime aBlock = (char *)MEMORY[0x1E4F143A8];
    uint64_t v45 = 1644167168;
    uint64_t v46 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned CMTime);
    uint64_t v47 = &block_descriptor_68;
    uint64_t v8 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for @convention(block) (_:));
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    *(void *)(inited + 40) = 0;
    *(void *)(inited + 48) = 0;
  }
  *(void *)(inited + 32) = v8;
  *(void *)(inited + 56) = v9;
  if (a1[2])
  {
    uint64_t v10 = a1[3];
    uint64_t v48 = a1[2];
    uint64_t v49 = v10;
    CMTime aBlock = (char *)MEMORY[0x1E4F143A8];
    uint64_t v45 = 1644167168;
    uint64_t v46 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned CMTime);
    uint64_t v47 = &block_descriptor_65;
    uint64_t v11 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for @convention(block) (_:));
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    *(void *)(inited + 72) = 0;
    *(void *)(inited + 80) = 0;
  }
  *(void *)(inited + 64) = v11;
  *(void *)(inited + 88) = v12;
  uint64_t v13 = a1[5];
  uint64_t v15 = a1[6];
  uint64_t v14 = a1[7];
  uint64_t v48 = a1[4];
  uint64_t v49 = v13;
  CMTime aBlock = (char *)MEMORY[0x1E4F143A8];
  uint64_t v45 = 1644167168;
  uint64_t v46 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned CMTime);
  uint64_t v47 = &block_descriptor_53;
  uint64_t v16 = _Block_copy(&aBlock);
  *(void *)(inited + 120) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for @convention(block) (_:));
  *(void *)(inited + 96) = v16;
  swift_retain();
  swift_release();
  if (v15)
  {
    uint64_t v48 = v15;
    uint64_t v49 = v14;
    CMTime aBlock = (char *)MEMORY[0x1E4F143A8];
    uint64_t v45 = 1107296256;
    uint64_t v46 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool);
    uint64_t v47 = &block_descriptor_62;
    long long v17 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for @convention(block) (_:));
  }
  else
  {
    long long v17 = 0;
    uint64_t v18 = 0;
    *(void *)(inited + 136) = 0;
    *(void *)(inited + 144) = 0;
  }
  *(void *)(inited + 128) = v17;
  *(void *)(inited + 152) = v18;
  if (a1[8])
  {
    uint64_t v19 = a1[9];
    uint64_t v48 = a1[8];
    uint64_t v49 = v19;
    CMTime aBlock = (char *)MEMORY[0x1E4F143A8];
    uint64_t v45 = 1107296256;
    uint64_t v46 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject, @guaranteed Swift.AnyObject) -> (@unowned CFComparisonResult);
    uint64_t v47 = &block_descriptor_59;
    uint64_t v20 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for @convention(block) (_:_:));
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    *(void *)(inited + 168) = 0;
    *(void *)(inited + 176) = 0;
  }
  *(void *)(inited + 160) = v20;
  *(void *)(inited + 184) = v21;
  outlined init with take of String?((uint64_t)(a1 + 10), (uint64_t)v50, &demangling cache variable for type metadata for String?);
  outlined init with take of String?((uint64_t)v50, (uint64_t)v51, &demangling cache variable for type metadata for String?);
  if (v51[1])
  {
    uint64_t v22 = MEMORY[0x1C188D3B0](v51[0]);
    type metadata accessor for CFStringRef(0);
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    *(void *)(inited + 200) = 0;
    *(void *)(inited + 208) = 0;
  }
  *(void *)(inited + 192) = v22;
  *(void *)(inited + 216) = v23;
  if (a1[12])
  {
    uint64_t v24 = a1[13];
    uint64_t v48 = a1[12];
    uint64_t v49 = v24;
    CMTime aBlock = (char *)MEMORY[0x1E4F143A8];
    uint64_t v45 = 1107296256;
    uint64_t v46 = thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Int);
    uint64_t v47 = &block_descriptor_56;
    uint64_t v25 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for @convention(block) (_:));
  }
  else
  {
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    *(void *)(inited + 232) = 0;
    *(void *)(inited + 240) = 0;
  }
  *(void *)(inited + 224) = v25;
  *(void *)(inited + 248) = v26;
  uint64_t v43 = MEMORY[0x1E4FBC860];
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, 7, 0);
  for (uint64_t i = 32; i != 256; i += 32)
  {
    outlined init with copy of Any?(inited + i, (uint64_t)&aBlock);
    outlined init with copy of Any?((uint64_t)&aBlock, (uint64_t)&v41);
    if (v42)
    {
      outlined init with take of Any(&v41, &v39);
      __swift_project_boxed_opaque_existential_1(&v39, v40);
      uint64_t v28 = _bridgeAnythingToObjectiveC<A>(_:)();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v39);
    }
    else
    {
      uint64_t v28 = 0;
    }
    outlined destroy of Any?((uint64_t)&aBlock);
    uint64_t v29 = v43;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v29 + 16) + 1, 1);
      uint64_t v29 = v43;
    }
    unint64_t v31 = *(void *)(v29 + 16);
    unint64_t v30 = *(void *)(v29 + 24);
    if (v31 >= v30 >> 1)
    {
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v30 > 1), v31 + 1, 1);
      uint64_t v29 = v43;
    }
    *(void *)(v29 + 16) = v31 + 1;
    *(void *)(v29 + 8 * v31 + 32) = v28;
  }
  swift_bridgeObjectRelease();
  CMTime aBlock = (char *)&outlined read-only object #0 of specialized CMBufferQueueRef.Handlers.withOpaquePointer<A>(_:);
  specialized Array.append<A>(contentsOf:)(v29);
  uint64_t v32 = aBlock;
  uint64_t result = CMBufferQueueCreateWithHandlers((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2, (const CMBufferHandlers *)(aBlock + 32), a3);
  uint64_t v34 = result;
  uint64_t v35 = *((void *)v32 + 2);
  uint64_t v36 = v35 - 1;
  if (v35 == 1) {
    goto LABEL_35;
  }
  if (v35)
  {
    swift_bridgeObjectRetain();
    uint64_t v37 = 0;
    do
    {
      if (*(void *)&v32[8 * v37 + 40]) {
        swift_unknownObjectRelease();
      }
      ++v37;
    }
    while (v36 != v37);
    swift_bridgeObjectRelease();
LABEL_35:
    swift_bridgeObjectRelease();
    return v34;
  }
  __break(1u);
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned CMTime)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v4 = swift_unknownObjectRetain();
  uint64_t v5 = v3(v4);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  swift_release();
  uint64_t result = swift_unknownObjectRelease();
  *a2 = v5;
  a2[1] = v7;
  a2[2] = v9;
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool)(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  LOBYTE(v1) = v1(v2);
  swift_release();
  swift_unknownObjectRelease();
  return v1 & 1;
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject, @guaranteed Swift.AnyObject) -> (@unowned CFComparisonResult)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  uint64_t v6 = v5(a2, a3);
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v6;
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Int)(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  uint64_t v3 = v1(v2);
  swift_release();
  swift_unknownObjectRelease();
  return v3;
}

void _CMBufferQueueInitTrampoline.init(capacity:handlers:)(CMItemCount a1, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v6 = a2[5];
  v12[4] = a2[4];
  v12[5] = v6;
  v12[6] = a2[6];
  long long v7 = a2[1];
  v12[0] = *a2;
  v12[1] = v7;
  long long v8 = a2[3];
  void v12[2] = a2[2];
  v12[3] = v8;
  CMBufferQueueRef v11 = 0;
  int v9 = specialized CMBufferQueueRef.Handlers.withOpaquePointer<A>(_:)((uint64_t *)v12, a1, &v11);
  if (v9 == noErr.getter())
  {
    outlined release of CMBufferQueueRef.Handlers((uint64_t *)v12);
    if (v11) {
      (*(void (**)(CMBufferQueueRef, uint64_t, uint64_t))(a4 + 8))(v11, a3, a4);
    }
    else {
      __break(1u);
    }
  }
  else
  {
    id v10 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v10 initWithDomain:MEMORY[0x1E4F28760] code:v9 userInfo:0];
    swift_willThrow();
    outlined release of CMBufferQueueRef.Handlers((uint64_t *)v12);
  }
}

uint64_t *outlined release of CMBufferQueueRef.Handlers(uint64_t *a1)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[6];
  uint64_t v4 = a1[8];
  uint64_t v5 = a1[12];
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(*a1);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v2);
  swift_release();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v3);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v4);
  swift_bridgeObjectRelease();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v5);
  return a1;
}

id static CMBufferQueueRef.Error.allocationFailed.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for allocationFailed, (void **)&static CMBufferQueueRef.Error.allocationFailed);
}

id static CMBufferQueueRef.Error.requiredParameterMissing.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for requiredParameterMissing, (void **)&static CMBufferQueueRef.Error.requiredParameterMissing);
}

id one-time initialization function for invalidCMBufferCallbacksStruct()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:MEMORY[0x1E4F28760] code:-12762 userInfo:0];
  static CMBufferQueueRef.Error.invalidCMBufferCallbacksStruct = (uint64_t)result;
  return result;
}

id static CMBufferQueueRef.Error.invalidCMBufferCallbacksStruct.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for invalidCMBufferCallbacksStruct, (void **)&static CMBufferQueueRef.Error.invalidCMBufferCallbacksStruct);
}

id one-time initialization function for enqueueAfterEndOfData()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 sel_initWithDomain_code_userInfo_:*MEMORY[0x1E4F28760] code:-12763 userInfo:0];
  static CMBufferQueueRef.Error.enqueueAfterEndOfData = (uint64_t)result;
  return result;
}

id static CMBufferQueueRef.Error.enqueueAfterEndOfData.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for enqueueAfterEndOfData, (void **)&static CMBufferQueueRef.Error.enqueueAfterEndOfData);
}

id static CMBufferQueueRef.Error.queueIsFull.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for queueIsFull, (void **)&static CMBufferQueueRef.Error.queueIsFull);
}

id one-time initialization function for badTriggerDuration()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 sel_initWithDomain_code_userInfo_:*MEMORY[0x1E4F28760] code:-12765 userInfo:0];
  static CMBufferQueueRef.Error.badTriggerDuration = (uint64_t)result;
  return result;
}

id static CMBufferQueueRef.Error.badTriggerDuration.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for badTriggerDuration, (void **)&static CMBufferQueueRef.Error.badTriggerDuration);
}

id one-time initialization function for cannotModifyQueueFromTriggerCallback()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:*MEMORY[0x1E4F28760] code:-12766 userInfo:0];
  static CMBufferQueueRef.Error.cannotModifyQueueFromTriggerCallback = (uint64_t)result;
  return result;
}

id static CMBufferQueueRef.Error.cannotModifyQueueFromTriggerCallback.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for cannotModifyQueueFromTriggerCallback, (void **)&static CMBufferQueueRef.Error.cannotModifyQueueFromTriggerCallback);
}

id one-time initialization function for invalidTriggerCondition()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:*MEMORY[0x1E4F28760] code:-12767 userInfo:0];
  static CMBufferQueueRef.Error.invalidTriggerCondition = (uint64_t)result;
  return result;
}

id static CMBufferQueueRef.Error.invalidTriggerCondition.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for invalidTriggerCondition, (void **)&static CMBufferQueueRef.Error.invalidTriggerCondition);
}

id one-time initialization function for invalidTriggerToken()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:*MEMORY[0x1E4F28760] code:-12768 userInfo:0];
  static CMBufferQueueRef.Error.invalidTriggerToken = (uint64_t)result;
  return result;
}

id static CMBufferQueueRef.Error.invalidTriggerToken.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for invalidTriggerToken, (void **)&static CMBufferQueueRef.Error.invalidTriggerToken);
}

id one-time initialization function for invalidBuffer()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:*MEMORY[0x1E4F28760] code:-12769 userInfo:0];
  static CMBufferQueueRef.Error.invalidBuffer = (uint64_t)result;
  return result;
}

id static CMBufferQueueRef.Error.invalidBuffer.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for invalidBuffer, (void **)&static CMBufferQueueRef.Error.invalidBuffer);
}

uint64_t CMBufferQueueRef.enqueue(_:)(CMBufferRef buf)
{
  OSStatus v2 = CMBufferQueueEnqueue(v1, buf);
  if (one-time initialization token for tlsKey != -1) {
    swift_once();
  }
  pthread_key_t v3 = static BoxedError.tlsKey;
  uint64_t v4 = (id *)pthread_getspecific(static BoxedError.tlsKey);
  if (v4)
  {
    uint64_t v5 = v4;
    pthread_setspecific(v3, 0);
    id v6 = v5[2];
    swift_release();
  }
  else
  {
    uint64_t result = noErr.getter();
    if (v2 == result) {
      return result;
    }
    id v8 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v8 initWithDomain:*MEMORY[0x1E4F28760] code:v2 userInfo:0];
  }
  return swift_willThrow();
}

CMBufferRef CMBufferQueueRef.dequeue()()
{
  return CMBufferQueueDequeueAndRetain(v0);
}

CMBufferRef CMBufferQueueRef.dequeueIfDataReady()()
{
  return CMBufferQueueDequeueIfDataReadyAndRetain(v0);
}

CMBufferRef CMBufferQueueRef.head.getter()
{
  return CMBufferQueueCopyHead(v0);
}

BOOL CMBufferQueueRef.isEmpty.getter()
{
  return CMBufferQueueIsEmpty(v0) != 0;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMBufferQueueRef.markEndOfData()()
{
}

BOOL CMBufferQueueRef.containsEndOfData.getter()
{
  return CMBufferQueueContainsEndOfData(v0) != 0;
}

BOOL CMBufferQueueRef.isAtEndOfData.getter()
{
  return CMBufferQueueIsAtEndOfData(v0) != 0;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMBufferQueueRef.reset()()
{
}

uint64_t CMBufferQueueRef.markEndOfData()(uint64_t (*a1)(uint64_t))
{
  int v2 = a1(v1);
  uint64_t result = noErr.getter();
  if (v2 != result)
  {
    id v4 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v4 initWithDomain:MEMORY[0x1E4F28760] code:v2 userInfo:0];
    return swift_willThrow();
  }
  return result;
}

uint64_t CMBufferQueueRef.reset(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = 0;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  closure #1 in CMBufferQueueResetWithHandler(queue:execute:rescue:)((uint64_t)partial apply for thunk for @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@error @owned Error), v7, v6, v2);
  if (v3)
  {
    swift_release();
    return swift_release();
  }
  uint64_t isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
  }
  else
  {
    swift_beginAccess();
    id v10 = *(void **)(v6 + 16);
    if (!v10) {
      return swift_release();
    }
    id v11 = v10;
    swift_willThrow();
    return swift_release();
  }
  return result;
}

uint64_t sub_1BE20B014()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BE20B04C()
{
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t partial apply for thunk for @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@error @owned Error)()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

CMItemCount CMBufferQueueRef.bufferCount.getter()
{
  return CMBufferQueueGetBufferCount(v0);
}

uint64_t CMBufferQueueRef.duration.getter()
{
  return CMBufferQueueRef.duration.getter(MEMORY[0x1E4F1EA28]);
}

uint64_t CMBufferQueueRef.minDecodeTimeStamp.getter()
{
  return CMBufferQueueRef.duration.getter(MEMORY[0x1E4F1EA50]);
}

uint64_t CMBufferQueueRef.firstDecodeTimeStamp.getter()
{
  return CMBufferQueueRef.duration.getter(MEMORY[0x1E4F1EA38]);
}

uint64_t CMBufferQueueRef.minPresentationTimeStamp.getter()
{
  return CMBufferQueueRef.duration.getter(MEMORY[0x1E4F1EA58]);
}

uint64_t CMBufferQueueRef.firstPresentationTimeStamp.getter()
{
  return CMBufferQueueRef.duration.getter(MEMORY[0x1E4F1EA40]);
}

uint64_t CMBufferQueueRef.maxPresentationTimeStamp.getter()
{
  return CMBufferQueueRef.duration.getter(MEMORY[0x1E4F1EA48]);
}

uint64_t CMBufferQueueRef.endPresentationTimeStamp.getter()
{
  return CMBufferQueueRef.duration.getter(MEMORY[0x1E4F1EA30]);
}

uint64_t CMBufferQueueRef.duration.getter(void (*a1)(uint64_t *__return_ptr, uint64_t))
{
  a1(&v3, v1);
  return v3;
}

size_t CMBufferQueueRef.totalSize.getter()
{
  return CMBufferQueueGetTotalSize(v0);
}

CMBufferQueueTriggerToken CMBufferQueueRef.installTrigger(condition:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  triggerTokenOut[1] = *(CMBufferQueueTriggerToken *)MEMORY[0x1E4F143B8];
  CMTimeValue v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  CMTimeEpoch v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 24);
  triggerTokenOut[0] = 0;
  switch(v7)
  {
    case 1:
      if (a2)
      {
        uint64_t v38 = a2;
        uint64_t v39 = a3;
        v36.CMTagValue value = MEMORY[0x1E4F143A8];
        *(void *)&v36.CMTimeScale timescale = 1107296256;
        v36.CMTimeEpoch epoch = (CMTimeEpoch)thunk for @escaping @callee_guaranteed (@unowned OpaquePointer) -> ();
        uint64_t v37 = &block_descriptor_30;
        id v8 = _Block_copy(&v36);
        swift_retain();
        swift_release();
      }
      else
      {
        id v8 = 0;
      }
      v36.CMTagValue value = v4;
      *(void *)&v36.CMTimeScale timescale = v5;
      v36.CMTimeEpoch epoch = v6;
      uint64_t v16 = v3;
      CMBufferQueueTriggerCondition v17 = 2;
      goto LABEL_60;
    case 2:
      if (a2)
      {
        uint64_t v38 = a2;
        uint64_t v39 = a3;
        v36.CMTagValue value = MEMORY[0x1E4F143A8];
        *(void *)&v36.CMTimeScale timescale = 1107296256;
        v36.CMTimeEpoch epoch = (CMTimeEpoch)thunk for @escaping @callee_guaranteed (@unowned OpaquePointer) -> ();
        uint64_t v37 = &block_descriptor_27;
        id v8 = _Block_copy(&v36);
        swift_retain();
        swift_release();
      }
      else
      {
        id v8 = 0;
      }
      v36.CMTagValue value = v4;
      *(void *)&v36.CMTimeScale timescale = v5;
      v36.CMTimeEpoch epoch = v6;
      uint64_t v16 = v3;
      CMBufferQueueTriggerCondition v17 = 3;
      goto LABEL_60;
    case 3:
      if (a2)
      {
        uint64_t v38 = a2;
        uint64_t v39 = a3;
        v36.CMTagValue value = MEMORY[0x1E4F143A8];
        *(void *)&v36.CMTimeScale timescale = 1107296256;
        v36.CMTimeEpoch epoch = (CMTimeEpoch)thunk for @escaping @callee_guaranteed (@unowned OpaquePointer) -> ();
        uint64_t v37 = &block_descriptor_24;
        id v8 = _Block_copy(&v36);
        swift_retain();
        swift_release();
      }
      else
      {
        id v8 = 0;
      }
      v36.CMTagValue value = v4;
      *(void *)&v36.CMTimeScale timescale = v5;
      v36.CMTimeEpoch epoch = v6;
      uint64_t v16 = v3;
      CMBufferQueueTriggerCondition v17 = 4;
      goto LABEL_60;
    case 4:
      if (a2)
      {
        uint64_t v38 = a2;
        uint64_t v39 = a3;
        v36.CMTagValue value = MEMORY[0x1E4F143A8];
        *(void *)&v36.CMTimeScale timescale = 1107296256;
        v36.CMTimeEpoch epoch = (CMTimeEpoch)thunk for @escaping @callee_guaranteed (@unowned OpaquePointer) -> ();
        uint64_t v37 = &block_descriptor_6_0;
        id v8 = _Block_copy(&v36);
        swift_retain();
        swift_release();
      }
      else
      {
        id v8 = 0;
      }
      uint64_t v18 = v3;
      CMBufferQueueTriggerCondition v19 = 10;
      goto LABEL_41;
    case 5:
      if (a2)
      {
        uint64_t v38 = a2;
        uint64_t v39 = a3;
        v36.CMTagValue value = MEMORY[0x1E4F143A8];
        *(void *)&v36.CMTimeScale timescale = 1107296256;
        v36.CMTimeEpoch epoch = (CMTimeEpoch)thunk for @escaping @callee_guaranteed (@unowned OpaquePointer) -> ();
        uint64_t v37 = &block_descriptor_0;
        id v8 = _Block_copy(&v36);
        swift_retain();
        swift_release();
      }
      else
      {
        id v8 = 0;
      }
      uint64_t v18 = v3;
      CMBufferQueueTriggerCondition v19 = 11;
LABEL_41:
      OSStatus v20 = CMBufferQueueInstallTriggerHandlerWithIntegerThreshold(v18, v19, v4, triggerTokenOut, v8);
      goto LABEL_61;
    case 6:
      CMTimeEpoch v9 = v6 | v5;
      if (v6 | v5 | v4)
      {
        if (v4 == 1 && v9 == 0)
        {
          CMTimeValue v24 = *MEMORY[0x1E4F1F9F8];
          uint64_t v25 = *(void *)(MEMORY[0x1E4F1F9F8] + 8);
          CMTimeEpoch v26 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
          if (a2)
          {
            uint64_t v38 = a2;
            uint64_t v39 = a3;
            v36.CMTagValue value = MEMORY[0x1E4F143A8];
            *(void *)&v36.CMTimeScale timescale = 1107296256;
            v36.CMTimeEpoch epoch = (CMTimeEpoch)thunk for @escaping @callee_guaranteed (@unowned OpaquePointer) -> ();
            uint64_t v37 = &block_descriptor_18;
            id v8 = _Block_copy(&v36);
            swift_retain();
            swift_release();
          }
          else
          {
            id v8 = 0;
          }
          v36.CMTagValue value = v24;
          *(void *)&v36.CMTimeScale timescale = v25;
          v36.CMTimeEpoch epoch = v26;
          uint64_t v16 = v3;
          CMBufferQueueTriggerCondition v17 = 6;
        }
        else if (v4 == 2 && v9 == 0)
        {
          CMTimeValue v27 = *MEMORY[0x1E4F1F9F8];
          uint64_t v28 = *(void *)(MEMORY[0x1E4F1F9F8] + 8);
          CMTimeEpoch v29 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
          if (a2)
          {
            uint64_t v38 = a2;
            uint64_t v39 = a3;
            v36.CMTagValue value = MEMORY[0x1E4F143A8];
            *(void *)&v36.CMTimeScale timescale = 1107296256;
            v36.CMTimeEpoch epoch = (CMTimeEpoch)thunk for @escaping @callee_guaranteed (@unowned OpaquePointer) -> ();
            uint64_t v37 = &block_descriptor_15;
            id v8 = _Block_copy(&v36);
            swift_retain();
            swift_release();
          }
          else
          {
            id v8 = 0;
          }
          v36.CMTagValue value = v27;
          *(void *)&v36.CMTimeScale timescale = v28;
          v36.CMTimeEpoch epoch = v29;
          uint64_t v16 = v3;
          CMBufferQueueTriggerCondition v17 = 7;
        }
        else if (v4 == 3 && v9 == 0)
        {
          CMTimeValue v30 = *MEMORY[0x1E4F1F9F8];
          uint64_t v31 = *(void *)(MEMORY[0x1E4F1F9F8] + 8);
          CMTimeEpoch v32 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
          if (a2)
          {
            uint64_t v38 = a2;
            uint64_t v39 = a3;
            v36.CMTagValue value = MEMORY[0x1E4F143A8];
            *(void *)&v36.CMTimeScale timescale = 1107296256;
            v36.CMTimeEpoch epoch = (CMTimeEpoch)thunk for @escaping @callee_guaranteed (@unowned OpaquePointer) -> ();
            uint64_t v37 = &block_descriptor_12;
            id v8 = _Block_copy(&v36);
            swift_retain();
            swift_release();
          }
          else
          {
            id v8 = 0;
          }
          v36.CMTagValue value = v30;
          *(void *)&v36.CMTimeScale timescale = v31;
          v36.CMTimeEpoch epoch = v32;
          uint64_t v16 = v3;
          CMBufferQueueTriggerCondition v17 = 8;
        }
        else
        {
          CMTimeValue v13 = *MEMORY[0x1E4F1F9F8];
          uint64_t v14 = *(void *)(MEMORY[0x1E4F1F9F8] + 8);
          CMTimeEpoch v15 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
          if (a2)
          {
            uint64_t v38 = a2;
            uint64_t v39 = a3;
            v36.CMTagValue value = MEMORY[0x1E4F143A8];
            *(void *)&v36.CMTimeScale timescale = 1107296256;
            v36.CMTimeEpoch epoch = (CMTimeEpoch)thunk for @escaping @callee_guaranteed (@unowned OpaquePointer) -> ();
            uint64_t v37 = &block_descriptor_9_0;
            id v8 = _Block_copy(&v36);
            swift_retain();
            swift_release();
          }
          else
          {
            id v8 = 0;
          }
          v36.CMTagValue value = v13;
          *(void *)&v36.CMTimeScale timescale = v14;
          v36.CMTimeEpoch epoch = v15;
          uint64_t v16 = v3;
          CMBufferQueueTriggerCondition v17 = 9;
        }
      }
      else
      {
        CMTimeValue v21 = *MEMORY[0x1E4F1F9F8];
        uint64_t v22 = *(void *)(MEMORY[0x1E4F1F9F8] + 8);
        CMTimeEpoch v23 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
        if (a2)
        {
          uint64_t v38 = a2;
          uint64_t v39 = a3;
          v36.CMTagValue value = MEMORY[0x1E4F143A8];
          *(void *)&v36.CMTimeScale timescale = 1107296256;
          v36.CMTimeEpoch epoch = (CMTimeEpoch)thunk for @escaping @callee_guaranteed (@unowned OpaquePointer) -> ();
          uint64_t v37 = &block_descriptor_21;
          id v8 = _Block_copy(&v36);
          swift_retain();
          swift_release();
        }
        else
        {
          id v8 = 0;
        }
        v36.CMTagValue value = v21;
        *(void *)&v36.CMTimeScale timescale = v22;
        v36.CMTimeEpoch epoch = v23;
        uint64_t v16 = v3;
        CMBufferQueueTriggerCondition v17 = 5;
      }
      goto LABEL_60;
    default:
      if (a2)
      {
        uint64_t v38 = a2;
        uint64_t v39 = a3;
        v36.CMTagValue value = MEMORY[0x1E4F143A8];
        *(void *)&v36.CMTimeScale timescale = 1107296256;
        v36.CMTimeEpoch epoch = (CMTimeEpoch)thunk for @escaping @callee_guaranteed (@unowned OpaquePointer) -> ();
        uint64_t v37 = &block_descriptor_33;
        id v8 = _Block_copy(&v36);
        swift_retain();
        swift_release();
      }
      else
      {
        id v8 = 0;
      }
      v36.CMTagValue value = v4;
      *(void *)&v36.CMTimeScale timescale = v5;
      v36.CMTimeEpoch epoch = v6;
      uint64_t v16 = v3;
      CMBufferQueueTriggerCondition v17 = 1;
LABEL_60:
      OSStatus v20 = CMBufferQueueInstallTriggerHandler(v16, v17, &v36, triggerTokenOut, v8);
LABEL_61:
      OSStatus v33 = v20;
      _Block_release(v8);
      if (v33 != noErr.getter()) {
        goto LABEL_64;
      }
      CMBufferQueueTriggerToken result = triggerTokenOut[0];
      if (!triggerTokenOut[0])
      {
        __break(1u);
LABEL_64:
        id v35 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
        [v35 initWithDomain:MEMORY[0x1E4F28760] code:v33 userInfo:0];
        return (CMBufferQueueTriggerToken)swift_willThrow();
      }
      return result;
  }
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned OpaquePointer) -> ()(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMBufferQueueRef.removeTrigger(_:)(Swift::OpaquePointer a1)
{
  OSStatus v2 = CMBufferQueueRemoveTrigger(v1, (CMBufferQueueTriggerToken)a1._rawValue);
  if (v2 != noErr.getter())
  {
    id v3 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v3 initWithDomain:MEMORY[0x1E4F28760] code:v2 userInfo:0];
    swift_willThrow();
  }
}

Swift::Bool __swiftcall CMBufferQueueRef.testTrigger(_:)(Swift::OpaquePointer a1)
{
  return CMBufferQueueTestTrigger(v1, (CMBufferQueueTriggerToken)a1._rawValue) != 0;
}

void CMBufferQueueRef.Buffers.Iterator.next()()
{
  uint64_t v2 = *v0;
  unint64_t v1 = v0[1];
  if (!((unint64_t)*v0 >> 62))
  {
    if (v1 == *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      return;
    }
LABEL_5:
    if ((v2 & 0xC000000000000001) != 0)
    {
      MEMORY[0x1C188D620](v1, v2);
      unint64_t v4 = v1 + 1;
      if (!__OFADD__(v1, 1)) {
        goto LABEL_9;
      }
    }
    else
    {
      if ((v1 & 0x8000000000000000) != 0)
      {
LABEL_13:
        __break(1u);
        goto LABEL_14;
      }
      if (v1 >= *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_14:
        __break(1u);
        return;
      }
      swift_unknownObjectRetain();
      unint64_t v4 = v1 + 1;
      if (!__OFADD__(v1, 1))
      {
LABEL_9:
        v0[1] = v4;
        return;
      }
    }
    __break(1u);
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (v1 != v3) {
    goto LABEL_5;
  }
}

void protocol witness for IteratorProtocol.next() in conformance CMBufferQueueRef.Buffers.Iterator(void *a1@<X8>)
{
  CMBufferQueueRef.Buffers.Iterator.next()();
  *a1 = v2;
}

uint64_t CMBufferQueueRef.Buffers.makeIterator()@<X0>(void *a1@<X8>)
{
  *a1 = *v1;
  a1[1] = 0;
  return swift_bridgeObjectRetain();
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance CMBufferQueueRef.Buffers()
{
  uint64_t v1 = specialized _copySequenceToContiguousArray<A>(_:)(*v0);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance CMBufferQueueRef.Buffers(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

uint64_t CMBufferQueueRef.buffers.getter@<X0>(void *a1@<X8>)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = MEMORY[0x1E4FBC860];
  BufferCMItemCount Count = CMBufferQueueGetBufferCount(v1);
  specialized Array._reserveCapacityImpl(minimumCapacity:growForAppend:)(BufferCount, 0);
  specialized Array._endMutation()();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = partial apply for closure #1 in CMBufferQueueRef.buffers.getter;
  *(void *)(v5 + 24) = v3;
  v8[0] = _syXlIegg_yXlytIegnr_TRTA_0;
  v8[1] = v5;
  swift_retain();
  CMBufferQueueCallForEachBuffer(v1, (OSStatus (__cdecl *)(CMBufferRef, void *))@objc callAppendToArray #1 (buffer:refcon:) in CMBufferQueueRef.buffers.getter, v8);
  swift_release();
  swift_beginAccess();
  uint64_t v6 = *(void *)(v3 + 16);
  swift_bridgeObjectRetain();
  uint64_t result = swift_release();
  *a1 = v6;
  return result;
}

uint64_t sub_1BE20BD04()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t closure #1 in CMBufferQueueRef.buffers.getter(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v3 = swift_unknownObjectRetain();
  MEMORY[0x1C188D4A0](v3);
  if (*(void *)((*(void *)(a2 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(a2 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  return swift_endAccess();
}

uint64_t @objc callAppendToArray #1 (buffer:refcon:) in CMBufferQueueRef.buffers.getter(uint64_t a1, void (**a2)(uint64_t *))
{
  if (a2)
  {
    uint64_t v2 = *a2;
    uint64_t v5 = a1;
    swift_unknownObjectRetain();
    swift_retain();
    v2(&v5);
    swift_release();
  }
  else
  {
    swift_unknownObjectRetain();
  }
  uint64_t v3 = noErr.getter();
  swift_unknownObjectRelease();
  return v3;
}

uint64_t CMBufferQueueRef.setValidationHandler(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  void v8[4] = partial apply for closure #1 in CMBufferQueueRef.setValidationHandler(_:);
  uint64_t v8[5] = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 1107296256;
  _OWORD v8[2] = thunk for @escaping @callee_guaranteed (@guaranteed CMBufferQueueRef, @guaranteed Swift.AnyObject) -> (@unowned Int32);
  v8[3] = &block_descriptor_45;
  uint64_t v6 = _Block_copy(v8);
  swift_retain();
  swift_release();
  LODWORD(a2) = CMBufferQueueSetValidationHandler(v2, v6);
  _Block_release(v6);
  uint64_t result = noErr.getter();
  if (a2 != result) {
    __break(1u);
  }
  return result;
}

uint64_t closure #1 in CMBufferQueueRef.setValidationHandler(_:)(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();

  return noErr.getter();
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed CMBufferQueueRef, @guaranteed Swift.AnyObject) -> (@unowned Int32)(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(uint64_t (**)(id, uint64_t))(a1 + 32);
  swift_retain();
  id v6 = a2;
  swift_unknownObjectRetain();
  uint64_t v7 = v5(v6, a3);
  swift_release();

  swift_unknownObjectRelease();
  return v7;
}

uint64_t partial apply for closure #1 in CMBufferQueueRef.buffers.getter(uint64_t a1)
{
  return closure #1 in CMBufferQueueRef.buffers.getter(a1, v1);
}

uint64_t _syXlIegg_yXlytIegnr_TRTA_0(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t partial apply for closure #1 in CMBufferQueueRef.setValidationHandler(_:)(uint64_t a1, uint64_t a2)
{
  return closure #1 in CMBufferQueueRef.setValidationHandler(_:)(a1, a2, *(void (**)(void))(v2 + 16));
}

unint64_t lazy protocol witness table accessor for type CMBufferQueueRef.Buffers.Iterator and conformance CMBufferQueueRef.Buffers.Iterator()
{
  unint64_t result = lazy protocol witness table cache variable for type CMBufferQueueRef.Buffers.Iterator and conformance CMBufferQueueRef.Buffers.Iterator;
  if (!lazy protocol witness table cache variable for type CMBufferQueueRef.Buffers.Iterator and conformance CMBufferQueueRef.Buffers.Iterator)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMBufferQueueRef.Buffers.Iterator and conformance CMBufferQueueRef.Buffers.Iterator);
  }
  return result;
}

uint64_t destroy for CMBufferQueueRef.Handlers(void *a1)
{
  if (*a1) {
    swift_release();
  }
  if (a1[2]) {
    swift_release();
  }
  swift_release();
  if (a1[6]) {
    swift_release();
  }
  if (a1[8]) {
    swift_release();
  }
  uint64_t result = swift_bridgeObjectRelease();
  if (a1[12])
  {
    return swift_release();
  }
  return result;
}

void *initializeWithCopy for CMBufferQueueRef.Handlers(void *a1, void *a2)
{
  if (*a2)
  {
    uint64_t v4 = a2[1];
    *a1 = *a2;
    a1[1] = v4;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  uint64_t v5 = a2[2];
  if (v5)
  {
    uint64_t v6 = a2[3];
    a1[2] = v5;
    a1[3] = v6;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
  }
  uint64_t v7 = a2[6];
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_retain();
  if (v7)
  {
    uint64_t v9 = a2[7];
    a1[6] = v7;
    a1[7] = v9;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
  }
  uint64_t v10 = a2[8];
  if (v10)
  {
    uint64_t v11 = a2[9];
    a1[8] = v10;
    a1[9] = v11;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
  }
  uint64_t v12 = a2[12];
  uint64_t v13 = a2[11];
  a1[10] = a2[10];
  a1[11] = v13;
  swift_bridgeObjectRetain();
  if (v12)
  {
    uint64_t v14 = a2[13];
    a1[12] = v12;
    a1[13] = v14;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 6) = *((_OWORD *)a2 + 6);
  }
  return a1;
}

void *assignWithCopy for CMBufferQueueRef.Handlers(void *a1, void *a2)
{
  uint64_t v4 = *a2;
  if (*a1)
  {
    if (v4)
    {
      uint64_t v5 = a2[1];
      *a1 = v4;
      a1[1] = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = a2[1];
    *a1 = v4;
    a1[1] = v6;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  uint64_t v7 = a2[2];
  if (a1[2])
  {
    if (v7)
    {
      uint64_t v8 = a2[3];
      a1[2] = v7;
      a1[3] = v8;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v7)
  {
    uint64_t v9 = a2[3];
    a1[2] = v7;
    a1[3] = v9;
    swift_retain();
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_15:
  uint64_t v10 = a2[5];
  a1[4] = a2[4];
  a1[5] = v10;
  swift_retain();
  swift_release();
  uint64_t v11 = a2[6];
  if (a1[6])
  {
    if (v11)
    {
      uint64_t v12 = a2[7];
      a1[6] = v11;
      a1[7] = v12;
      swift_retain();
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v11)
  {
    uint64_t v13 = a2[7];
    a1[6] = v11;
    a1[7] = v13;
    swift_retain();
    goto LABEL_22;
  }
  *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
LABEL_22:
  uint64_t v14 = a2[8];
  if (a1[8])
  {
    if (v14)
    {
      uint64_t v15 = a2[9];
      a1[8] = v14;
      a1[9] = v15;
      swift_retain();
      swift_release();
      goto LABEL_29;
    }
    swift_release();
  }
  else if (v14)
  {
    uint64_t v16 = a2[9];
    a1[8] = v14;
    a1[9] = v16;
    swift_retain();
    goto LABEL_29;
  }
  *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
LABEL_29:
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = a2[12];
  if (!a1[12])
  {
    if (v17)
    {
      uint64_t v19 = a2[13];
      a1[12] = v17;
      a1[13] = v19;
      swift_retain();
      return a1;
    }
LABEL_35:
    *((_OWORD *)a1 + 6) = *((_OWORD *)a2 + 6);
    return a1;
  }
  if (!v17)
  {
    swift_release();
    goto LABEL_35;
  }
  uint64_t v18 = a2[13];
  a1[12] = v17;
  a1[13] = v18;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy112_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v5;
  return result;
}

uint64_t assignWithTake for CMBufferQueueRef.Handlers(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (*(void *)a1)
  {
    if (v4)
    {
      uint64_t v5 = a2[1];
      *(void *)a1 = v4;
      *(void *)(a1 + 8) = v5;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = a2[1];
    *(void *)a1 = v4;
    *(void *)(a1 + 8) = v6;
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  uint64_t v7 = a2[2];
  if (*(void *)(a1 + 16))
  {
    if (v7)
    {
      uint64_t v8 = a2[3];
      *(void *)(a1 + 16) = v7;
      *(void *)(a1 + 24) = v8;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v7)
  {
    uint64_t v9 = a2[3];
    *(void *)(a1 + 16) = v7;
    *(void *)(a1 + 24) = v9;
    goto LABEL_15;
  }
  *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
LABEL_15:
  *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
  swift_release();
  uint64_t v10 = a2[6];
  if (*(void *)(a1 + 48))
  {
    if (v10)
    {
      uint64_t v11 = a2[7];
      *(void *)(a1 + 48) = v10;
      *(void *)(a1 + 56) = v11;
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v10)
  {
    uint64_t v12 = a2[7];
    *(void *)(a1 + 48) = v10;
    *(void *)(a1 + 56) = v12;
    goto LABEL_22;
  }
  *(_OWORD *)(a1 + 48) = *((_OWORD *)a2 + 3);
LABEL_22:
  uint64_t v13 = a2[8];
  if (*(void *)(a1 + 64))
  {
    if (v13)
    {
      uint64_t v14 = a2[9];
      *(void *)(a1 + 64) = v13;
      *(void *)(a1 + 72) = v14;
      swift_release();
      goto LABEL_29;
    }
    swift_release();
  }
  else if (v13)
  {
    uint64_t v15 = a2[9];
    *(void *)(a1 + 64) = v13;
    *(void *)(a1 + 72) = v15;
    goto LABEL_29;
  }
  *(_OWORD *)(a1 + 64) = *((_OWORD *)a2 + 4);
LABEL_29:
  uint64_t v16 = a2[11];
  *(void *)(a1 + 80) = a2[10];
  *(void *)(a1 + 88) = v16;
  swift_bridgeObjectRelease();
  uint64_t v17 = a2[12];
  if (!*(void *)(a1 + 96))
  {
    if (v17)
    {
      uint64_t v19 = a2[13];
      *(void *)(a1 + 96) = v17;
      *(void *)(a1 + 104) = v19;
      return a1;
    }
LABEL_35:
    *(_OWORD *)(a1 + 96) = *((_OWORD *)a2 + 6);
    return a1;
  }
  if (!v17)
  {
    swift_release();
    goto LABEL_35;
  }
  uint64_t v18 = a2[13];
  *(void *)(a1 + 96) = v17;
  *(void *)(a1 + 104) = v18;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CMBufferQueueRef.Handlers(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 112)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CMBufferQueueRef.Handlers(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 112) = 1;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 112) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CMBufferQueueRef.Handlers()
{
  return &type metadata for CMBufferQueueRef.Handlers;
}

uint64_t destroy for CMBufferQueueRef.Handlers.Builder(void *a1)
{
  if (*a1) {
    swift_release();
  }
  if (a1[2]) {
    swift_release();
  }
  if (a1[4]) {
    swift_release();
  }
  if (a1[6]) {
    swift_release();
  }
  if (a1[8]) {
    swift_release();
  }
  uint64_t result = swift_bridgeObjectRelease();
  if (a1[12])
  {
    return swift_release();
  }
  return result;
}

void *initializeWithCopy for CMBufferQueueRef.Handlers.Builder(void *a1, void *a2)
{
  if (*a2)
  {
    uint64_t v4 = a2[1];
    *a1 = *a2;
    a1[1] = v4;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  uint64_t v5 = a2[2];
  if (v5)
  {
    uint64_t v6 = a2[3];
    a1[2] = v5;
    a1[3] = v6;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
  }
  uint64_t v7 = a2[4];
  if (v7)
  {
    uint64_t v8 = a2[5];
    a1[4] = v7;
    a1[5] = v8;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  }
  uint64_t v9 = a2[6];
  if (v9)
  {
    uint64_t v10 = a2[7];
    a1[6] = v9;
    a1[7] = v10;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
  }
  uint64_t v11 = a2[8];
  if (v11)
  {
    uint64_t v12 = a2[9];
    a1[8] = v11;
    a1[9] = v12;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
  }
  uint64_t v13 = a2[12];
  uint64_t v14 = a2[11];
  a1[10] = a2[10];
  a1[11] = v14;
  swift_bridgeObjectRetain();
  if (v13)
  {
    uint64_t v15 = a2[13];
    a1[12] = v13;
    a1[13] = v15;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 6) = *((_OWORD *)a2 + 6);
  }
  return a1;
}

void *assignWithCopy for CMBufferQueueRef.Handlers.Builder(void *a1, void *a2)
{
  uint64_t v4 = *a2;
  if (*a1)
  {
    if (v4)
    {
      uint64_t v5 = a2[1];
      *a1 = v4;
      a1[1] = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = a2[1];
    *a1 = v4;
    a1[1] = v6;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  uint64_t v7 = a2[2];
  if (a1[2])
  {
    if (v7)
    {
      uint64_t v8 = a2[3];
      a1[2] = v7;
      a1[3] = v8;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v7)
  {
    uint64_t v9 = a2[3];
    a1[2] = v7;
    a1[3] = v9;
    swift_retain();
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_15:
  uint64_t v10 = a2[4];
  if (a1[4])
  {
    if (v10)
    {
      uint64_t v11 = a2[5];
      a1[4] = v10;
      a1[5] = v11;
      swift_retain();
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v10)
  {
    uint64_t v12 = a2[5];
    a1[4] = v10;
    a1[5] = v12;
    swift_retain();
    goto LABEL_22;
  }
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
LABEL_22:
  uint64_t v13 = a2[6];
  if (a1[6])
  {
    if (v13)
    {
      uint64_t v14 = a2[7];
      a1[6] = v13;
      a1[7] = v14;
      swift_retain();
      swift_release();
      goto LABEL_29;
    }
    swift_release();
  }
  else if (v13)
  {
    uint64_t v15 = a2[7];
    a1[6] = v13;
    a1[7] = v15;
    swift_retain();
    goto LABEL_29;
  }
  *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
LABEL_29:
  uint64_t v16 = a2[8];
  if (a1[8])
  {
    if (v16)
    {
      uint64_t v17 = a2[9];
      a1[8] = v16;
      a1[9] = v17;
      swift_retain();
      swift_release();
      goto LABEL_36;
    }
    swift_release();
  }
  else if (v16)
  {
    uint64_t v18 = a2[9];
    a1[8] = v16;
    a1[9] = v18;
    swift_retain();
    goto LABEL_36;
  }
  *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
LABEL_36:
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v19 = a2[12];
  if (!a1[12])
  {
    if (v19)
    {
      uint64_t v21 = a2[13];
      a1[12] = v19;
      a1[13] = v21;
      swift_retain();
      return a1;
    }
LABEL_42:
    *((_OWORD *)a1 + 6) = *((_OWORD *)a2 + 6);
    return a1;
  }
  if (!v19)
  {
    swift_release();
    goto LABEL_42;
  }
  uint64_t v20 = a2[13];
  a1[12] = v19;
  a1[13] = v20;
  swift_retain();
  swift_release();
  return a1;
}

void *assignWithTake for CMBufferQueueRef.Handlers.Builder(void *a1, void *a2)
{
  uint64_t v4 = *a2;
  if (*a1)
  {
    if (v4)
    {
      uint64_t v5 = a2[1];
      *a1 = v4;
      a1[1] = v5;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = a2[1];
    *a1 = v4;
    a1[1] = v6;
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  uint64_t v7 = a2[2];
  if (a1[2])
  {
    if (v7)
    {
      uint64_t v8 = a2[3];
      a1[2] = v7;
      a1[3] = v8;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v7)
  {
    uint64_t v9 = a2[3];
    a1[2] = v7;
    a1[3] = v9;
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_15:
  uint64_t v10 = a2[4];
  if (a1[4])
  {
    if (v10)
    {
      uint64_t v11 = a2[5];
      a1[4] = v10;
      a1[5] = v11;
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v10)
  {
    uint64_t v12 = a2[5];
    a1[4] = v10;
    a1[5] = v12;
    goto LABEL_22;
  }
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
LABEL_22:
  uint64_t v13 = a2[6];
  if (a1[6])
  {
    if (v13)
    {
      uint64_t v14 = a2[7];
      a1[6] = v13;
      a1[7] = v14;
      swift_release();
      goto LABEL_29;
    }
    swift_release();
  }
  else if (v13)
  {
    uint64_t v15 = a2[7];
    a1[6] = v13;
    a1[7] = v15;
    goto LABEL_29;
  }
  *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
LABEL_29:
  uint64_t v16 = a2[8];
  if (a1[8])
  {
    if (v16)
    {
      uint64_t v17 = a2[9];
      a1[8] = v16;
      a1[9] = v17;
      swift_release();
      goto LABEL_36;
    }
    swift_release();
  }
  else if (v16)
  {
    uint64_t v18 = a2[9];
    a1[8] = v16;
    a1[9] = v18;
    goto LABEL_36;
  }
  *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
LABEL_36:
  uint64_t v19 = a2[11];
  a1[10] = a2[10];
  a1[11] = v19;
  swift_bridgeObjectRelease();
  uint64_t v20 = a2[12];
  if (!a1[12])
  {
    if (v20)
    {
      uint64_t v22 = a2[13];
      a1[12] = v20;
      a1[13] = v22;
      return a1;
    }
LABEL_42:
    *((_OWORD *)a1 + 6) = *((_OWORD *)a2 + 6);
    return a1;
  }
  if (!v20)
  {
    swift_release();
    goto LABEL_42;
  }
  uint64_t v21 = a2[13];
  a1[12] = v20;
  a1[13] = v21;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CMBufferQueueRef.Handlers.Builder(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 112)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CMBufferQueueRef.Handlers.Builder(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 112) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 112) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CMBufferQueueRef.Handlers.Builder()
{
  return &type metadata for CMBufferQueueRef.Handlers.Builder;
}

uint64_t dispatch thunk of _CMBufferQueueInitTrampoline.init(referencing:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

ValueMetadata *type metadata accessor for CMBufferQueueRef.Error()
{
  return &type metadata for CMBufferQueueRef.Error;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for CMBufferQueueRef.TriggerCondition(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFA && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 250);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 6) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CMBufferQueueRef.TriggerCondition(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF9)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 250;
    if (a3 >= 0xFA) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFA) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for CMBufferQueueRef.TriggerCondition(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 5u) {
    return *(unsigned __int8 *)(a1 + 24);
  }
  else {
    return (*(_DWORD *)a1 + 6);
  }
}

uint64_t destructiveInjectEnumTag for CMBufferQueueRef.TriggerCondition(uint64_t result, unsigned int a2)
{
  uint64_t v2 = a2 - 6;
  if (a2 >= 6)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    LOBYTE(a2) = 6;
    *(void *)__n128 result = v2;
  }
  *(unsigned char *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CMBufferQueueRef.TriggerCondition()
{
  return &type metadata for CMBufferQueueRef.TriggerCondition;
}

ValueMetadata *type metadata accessor for CMBufferQueueRef.Buffers()
{
  return &type metadata for CMBufferQueueRef.Buffers;
}

ValueMetadata *type metadata accessor for CMBufferQueueRef.Buffers.Iterator()
{
  return &type metadata for CMBufferQueueRef.Buffers.Iterator;
}

uint64_t specialized _copySequenceToContiguousArray<A>(_:)(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_28;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (v2)
  {
    while (1)
    {
      unint64_t v4 = a1 & 0xC000000000000001;
      if ((a1 & 0xC000000000000001) == 0
        && (unint64_t)(v2 - 1) >= *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
LABEL_37:
        __break(1u);
        return result;
      }
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      uint64_t v7 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v8 = (uint64_t *)(MEMORY[0x1E4FBC860] + 32);
      uint64_t v26 = v2;
      while (v4)
      {
        uint64_t v9 = MEMORY[0x1C188D620](v6, a1);
        if (!v5) {
          goto LABEL_12;
        }
LABEL_8:
        BOOL v10 = __OFSUB__(v5--, 1);
        if (v10) {
          goto LABEL_26;
        }
LABEL_24:
        ++v6;
        *v8++ = v9;
        if (v2 == v6) {
          goto LABEL_32;
        }
      }
      uint64_t v9 = *(void *)(a1 + 8 * v6 + 32);
      swift_unknownObjectRetain();
      if (v5) {
        goto LABEL_8;
      }
LABEL_12:
      unint64_t v11 = v7[3];
      if ((uint64_t)((v11 >> 1) + 0x4000000000000000) < 0) {
        goto LABEL_27;
      }
      unint64_t v12 = v4;
      int64_t v13 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if (v13 <= 1) {
        uint64_t v14 = 1;
      }
      else {
        uint64_t v14 = v13;
      }
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
      uint64_t v15 = (void *)swift_allocObject();
      int64_t v16 = _swift_stdlib_malloc_size(v15);
      uint64_t v17 = v16 - 32;
      if (v16 < 32) {
        uint64_t v17 = v16 - 25;
      }
      uint64_t v18 = v17 >> 3;
      CMSampleBufferRef v15[2] = v14;
      v15[3] = (2 * (v17 >> 3)) | 1;
      unint64_t v19 = (unint64_t)(v15 + 4);
      uint64_t v20 = v7[3] >> 1;
      if (v7[2])
      {
        uint64_t v21 = v7 + 4;
        if (v15 != v7 || v19 >= (unint64_t)v21 + 8 * v20) {
          memmove(v15 + 4, v21, 8 * v20);
        }
        _OWORD v7[2] = 0;
      }
      uint64_t v8 = (uint64_t *)(v19 + 8 * v20);
      uint64_t v22 = (v18 & 0x7FFFFFFFFFFFFFFFLL) - v20;
      swift_release();
      uint64_t v7 = v15;
      unint64_t v4 = v12;
      uint64_t v2 = v26;
      BOOL v10 = __OFSUB__(v22, 1);
      uint64_t v5 = v22 - 1;
      if (!v10) {
        goto LABEL_24;
      }
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
      swift_bridgeObjectRetain();
      if (!_CocoaArrayWrapper.endIndex.getter()) {
        break;
      }
      swift_bridgeObjectRetain();
      uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
      uint64_t result = swift_bridgeObjectRelease();
      if (v2 < 1)
      {
        __break(1u);
        break;
      }
    }
  }
  uint64_t v5 = 0;
  uint64_t v7 = (void *)MEMORY[0x1E4FBC860];
LABEL_32:
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v23 = v7[3];
  if (v23 >= 2)
  {
    unint64_t v24 = v23 >> 1;
    BOOL v10 = __OFSUB__(v24, v5);
    uint64_t v25 = v24 - v5;
    if (v10) {
      goto LABEL_37;
    }
    _OWORD v7[2] = v25;
  }
  return (uint64_t)v7;
}

{
  uint64_t v2;
  uint64_t result;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  void *v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  const void *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (a1 >> 62) {
    goto LABEL_28;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (v2)
  {
    while (1)
    {
      unint64_t v4 = a1 & 0xC000000000000001;
      if ((a1 & 0xC000000000000001) == 0
        && (unint64_t)(v2 - 1) >= *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
LABEL_37:
        __break(1u);
        return result;
      }
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      uint64_t v7 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v8 = (void *)(MEMORY[0x1E4FBC860] + 32);
      uint64_t v26 = v2;
      while (v4)
      {
        uint64_t v9 = (id)MEMORY[0x1C188D620](v6, a1);
        if (!v5) {
          goto LABEL_12;
        }
LABEL_8:
        BOOL v10 = __OFSUB__(v5--, 1);
        if (v10) {
          goto LABEL_26;
        }
LABEL_24:
        ++v6;
        *v8++ = v9;
        if (v2 == v6) {
          goto LABEL_32;
        }
      }
      uint64_t v9 = *(id *)(a1 + 8 * v6 + 32);
      if (v5) {
        goto LABEL_8;
      }
LABEL_12:
      unint64_t v11 = v7[3];
      if ((uint64_t)((v11 >> 1) + 0x4000000000000000) < 0) {
        goto LABEL_27;
      }
      unint64_t v12 = v4;
      int64_t v13 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if (v13 <= 1) {
        uint64_t v14 = 1;
      }
      else {
        uint64_t v14 = v13;
      }
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
      uint64_t v15 = (void *)swift_allocObject();
      int64_t v16 = _swift_stdlib_malloc_size(v15);
      uint64_t v17 = v16 - 32;
      if (v16 < 32) {
        uint64_t v17 = v16 - 25;
      }
      uint64_t v18 = v17 >> 3;
      CMSampleBufferRef v15[2] = v14;
      v15[3] = (2 * (v17 >> 3)) | 1;
      unint64_t v19 = (unint64_t)(v15 + 4);
      uint64_t v20 = v7[3] >> 1;
      if (v7[2])
      {
        uint64_t v21 = v7 + 4;
        if (v15 != v7 || v19 >= (unint64_t)v21 + 8 * v20) {
          memmove(v15 + 4, v21, 8 * v20);
        }
        _OWORD v7[2] = 0;
      }
      uint64_t v8 = (void *)(v19 + 8 * v20);
      uint64_t v22 = (v18 & 0x7FFFFFFFFFFFFFFFLL) - v20;
      swift_release();
      uint64_t v7 = v15;
      unint64_t v4 = v12;
      uint64_t v2 = v26;
      BOOL v10 = __OFSUB__(v22, 1);
      uint64_t v5 = v22 - 1;
      if (!v10) {
        goto LABEL_24;
      }
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
      swift_bridgeObjectRetain();
      if (!_CocoaArrayWrapper.endIndex.getter()) {
        break;
      }
      swift_bridgeObjectRetain();
      uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
      uint64_t result = swift_bridgeObjectRelease();
      if (v2 < 1)
      {
        __break(1u);
        break;
      }
    }
  }
  uint64_t v5 = 0;
  uint64_t v7 = (void *)MEMORY[0x1E4FBC860];
LABEL_32:
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v23 = v7[3];
  if (v23 >= 2)
  {
    unint64_t v24 = v23 >> 1;
    BOOL v10 = __OFSUB__(v24, v5);
    uint64_t v25 = v24 - v5;
    if (v10) {
      goto LABEL_37;
    }
    _OWORD v7[2] = v25;
  }
  return (uint64_t)v7;
}

void specialized _copySequenceToContiguousArray<A>(_:)(uint64_t a1, uint64_t a2)
{
  *(void *)&long long v37 = a1;
  *((void *)&v37 + 1) = a2;
  CMSampleBufferRef.PerSampleAttachmentsDictionary.makeIterator()(v40);
  uint64_t v2 = 0;
  uint64_t v3 = v40[0];
  uint64_t v4 = v40[3];
  uint64_t v33 = v40[1];
  int64_t v34 = (unint64_t)(v40[2] + 64) >> 6;
  uint64_t v5 = (void *)MEMORY[0x1E4FBC860];
  unint64_t v6 = v41;
  uint64_t v7 = MEMORY[0x1E4FBC860] + 32;
  if (!v41) {
    goto LABEL_3;
  }
LABEL_2:
  unint64_t v8 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  unint64_t v9 = v8 | (v4 << 6);
  while (1)
  {
    uint64_t v14 = *(void **)(*(void *)(v3 + 48) + 8 * v9);
    *(void *)&v35[0] = v14;
    outlined init with copy of Any(*(void *)(v3 + 56) + 32 * v9, (uint64_t)v35 + 8);
    long long v37 = v35[0];
    long long v38 = v35[1];
    uint64_t v39 = v36;
    if (v2)
    {
      id v15 = v14;
      int64_t v16 = v5;
      BOOL v17 = __OFSUB__(v2--, 1);
      if (v17) {
        goto LABEL_43;
      }
    }
    else
    {
      unint64_t v18 = v5[3];
      if ((uint64_t)((v18 >> 1) + 0x4000000000000000) < 0) {
        goto LABEL_45;
      }
      int64_t v19 = v18 & 0xFFFFFFFFFFFFFFFELL;
      if (v19 <= 1) {
        uint64_t v20 = 1;
      }
      else {
        uint64_t v20 = v19;
      }
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(key: CMSampleBufferRef.PerSampleAttachmentsDictionary.Key, value: Any)>);
      int64_t v16 = (void *)swift_allocObject();
      uint64_t v21 = (uint64_t)(_swift_stdlib_malloc_size(v16) - 32) / 40;
      _OWORD v16[2] = v20;
      v16[3] = 2 * v21;
      uint64_t v22 = v16 + 4;
      uint64_t v23 = v5[3] >> 1;
      uint64_t v7 = (uint64_t)&v16[5 * v23 + 4];
      uint64_t v24 = (v21 & 0x7FFFFFFFFFFFFFFFLL) - v23;
      if (v5[2])
      {
        if (v16 != v5 || v22 >= &v5[5 * v23 + 4]) {
          memmove(v22, v5 + 4, 40 * v23);
        }
        id v26 = v14;
        v5[2] = 0;
      }
      else
      {
        id v27 = v14;
      }
      swift_release();
      BOOL v17 = __OFSUB__(v24, 1);
      uint64_t v2 = v24 - 1;
      if (v17)
      {
LABEL_43:
        __break(1u);
LABEL_44:
        __break(1u);
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
    }
    long long v28 = v37;
    long long v29 = v38;
    *(void *)(v7 + 32) = v39;
    *(_OWORD *)uint64_t v7 = v28;
    *(_OWORD *)(v7 + 16) = v29;
    v7 += 40;
    uint64_t v5 = v16;
    if (v6) {
      goto LABEL_2;
    }
LABEL_3:
    int64_t v10 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_44;
    }
    if (v10 >= v34) {
      goto LABEL_39;
    }
    unint64_t v11 = *(void *)(v33 + 8 * v10);
    uint64_t v12 = v4 + 1;
    if (!v11)
    {
      uint64_t v12 = v4 + 2;
      if (v4 + 2 >= v34) {
        goto LABEL_39;
      }
      unint64_t v11 = *(void *)(v33 + 8 * v12);
      if (!v11)
      {
        uint64_t v12 = v4 + 3;
        if (v4 + 3 >= v34) {
          goto LABEL_39;
        }
        unint64_t v11 = *(void *)(v33 + 8 * v12);
        if (!v11)
        {
          uint64_t v12 = v4 + 4;
          if (v4 + 4 >= v34) {
            goto LABEL_39;
          }
          unint64_t v11 = *(void *)(v33 + 8 * v12);
          if (!v11)
          {
            uint64_t v12 = v4 + 5;
            if (v4 + 5 >= v34) {
              goto LABEL_39;
            }
            unint64_t v11 = *(void *)(v33 + 8 * v12);
            if (!v11) {
              break;
            }
          }
        }
      }
    }
LABEL_18:
    unint64_t v6 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
    uint64_t v4 = v12;
  }
  uint64_t v13 = v4 + 6;
  while (v34 != v13)
  {
    unint64_t v11 = *(void *)(v33 + 8 * v13++);
    if (v11)
    {
      uint64_t v12 = v13 - 1;
      goto LABEL_18;
    }
  }
LABEL_39:
  outlined consume of [CMSampleBufferRef.PerSampleAttachmentsDictionary.Key : Any].Iterator._Variant();
  unint64_t v30 = v5[3];
  if (v30 < 2) {
    return;
  }
  unint64_t v31 = v30 >> 1;
  BOOL v17 = __OFSUB__(v31, v2);
  uint64_t v32 = v31 - v2;
  if (!v17)
  {
    v5[2] = v32;
    return;
  }
LABEL_46:
  __break(1u);
}

uint64_t outlined init with copy of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t specialized Array.append<A>(contentsOf:)(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
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
  uint64_t result = (uint64_t)memcpy((void *)(v3 + 8 * v7 + 32), (const void *)(v6 + 32), 8 * v2);
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

uint64_t sub_1BE20D8CC()
{
  return MEMORY[0x1F4186498](v0, 84, 7);
}

uint64_t partial apply for closure #3 in closure #1 in CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:)(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr, uint64_t, void))(v1 + 44))(&v3, a1, *(void *)(v1 + 20));
  return v3;
}

uint64_t outlined init with take of String?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1BE20D974()
{
  return MEMORY[0x1F4186498](v0, 92, 7);
}

uint64_t partial apply for closure #6 in closure #1 in CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:)(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, void))(v1 + 16))(a1, *(void *)(v1 + 28));
}

uint64_t sub_1BE20D990()
{
  return MEMORY[0x1F4186498](v0, 92, 7);
}

uint64_t partial apply for closure #5 in closure #1 in CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v2 + 16))(a1, a2, *(void *)(v2 + 28));
}

uint64_t sub_1BE20D9AC()
{
  return MEMORY[0x1F4186498](v0, 92, 7);
}

BOOL partial apply for closure #4 in closure #1 in CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:)(uint64_t a1)
{
  return (*(unsigned int (**)(uint64_t, void))(v1 + 16))(a1, *(void *)(v1 + 28)) != 0;
}

uint64_t sub_1BE20D9E4()
{
  return MEMORY[0x1F4186498](v0, 92, 7);
}

uint64_t sub_1BE20D9F8()
{
  return MEMORY[0x1F4186498](v0, 92, 7);
}

uint64_t partial apply for closure #2 in closure #1 in CMBufferQueueRef.Handlers.init(withCMBufferCallbacks:)(uint64_t a1)
{
  (*(void (**)(uint64_t *__return_ptr, uint64_t, void))(v1 + 16))(&v3, a1, *(void *)(v1 + 28));
  return v3;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Int)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v2 + 16))(*a1);
  *a2 = result;
  return result;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Swift.AnyObject) -> (@out Int)(uint64_t a1)
{
  void (*v2)(uint64_t *__return_ptr, uint64_t *);
  uint64_t v4;
  uint64_t v5;

  uint64_t v2 = *(void (**)(uint64_t *__return_ptr, uint64_t *))(v1 + 16);
  uint64_t v5 = a1;
  v2(&v4, &v5);
  return v4;
}

uint64_t sub_1BE20DAB8()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Swift.AnyObject, @in_guaranteed Swift.AnyObject) -> (@out CFComparisonResult)(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t *__return_ptr, uint64_t *, uint64_t *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  uint64_t v3 = *(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t *))(v2 + 16);
  uint64_t v6 = a2;
  uint64_t v7 = a1;
  v3(&v5, &v7, &v6);
  return v5;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject, @guaranteed Swift.AnyObject) -> (@unowned CFComparisonResult)@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void, void))(v3 + 16))(*a1, *a2);
  *a3 = result;
  return result;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Swift.AnyObject) -> (@out Bool)(uint64_t a1)
{
  void (*v2)(unsigned __int8 *__return_ptr, uint64_t *);
  unsigned __int8 v4;
  uint64_t v5;

  uint64_t v2 = *(void (**)(unsigned __int8 *__return_ptr, uint64_t *))(v1 + 16);
  uint64_t v5 = a1;
  v2(&v4, &v5);
  return v4;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v2 + 16))(*a1);
  *a2 = result & 1;
  return result;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed Swift.AnyObject) -> (@out CMTime)(uint64_t a1)
{
  void (*v2)(uint64_t *__return_ptr, uint64_t *);
  uint64_t v4;
  uint64_t v5;

  uint64_t v2 = *(void (**)(uint64_t *__return_ptr, uint64_t *))(v1 + 16);
  uint64_t v5 = a1;
  v2(&v4, &v5);
  return v4;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned CMTime)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v2 + 16))(*a1);
  *(void *)a2 = result;
  *(_DWORD *)(a2 + 8) = v5;
  *(_DWORD *)(a2 + 12) = v6;
  *(void *)(a2 + 16) = v7;
  return result;
}

uint64_t specialized Collection.count.getter(uint64_t a1)
{
  int64_t v2 = specialized Dictionary.startIndex.getter(a1);
  uint64_t v4 = v3;
  char v6 = v5;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v7 = __CocoaDictionary.endIndex.getter();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 1 << *(unsigned char *)(a1 + 32);
    uint64_t v9 = *(unsigned int *)(a1 + 36);
  }
  char v10 = (a1 & 0xC000000000000001) != 0;
  char v11 = v6 & 1;
  specialized Collection.distance(from:to:)(v2, v4, v11, v7, v9, v10, a1);
  uint64_t v13 = v12;
  outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v7, v9, v10);
  outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v2, v4, v11);
  return v13;
}

uint64_t specialized Collection<>.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = specialized Dictionary.startIndex.getter(a2);
  uint64_t v9 = result;
  uint64_t v10 = v7;
  char v11 = v8;
  if ((a2 & 0xC000000000000001) == 0)
  {
    if ((v8 & 1) == 0)
    {
      uint64_t v14 = *(unsigned int *)(a2 + 36);
      if (v14 != v7)
      {
LABEL_11:
        __break(1u);
        goto LABEL_12;
      }
      uint64_t v13 = 1 << *(unsigned char *)(a2 + 32);
      if (v13 >= result) {
        goto LABEL_4;
      }
LABEL_10:
      __break(1u);
      goto LABEL_11;
    }
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t result = __CocoaDictionary.endIndex.getter();
  if ((v11 & 1) == 0) {
    goto LABEL_12;
  }
  uint64_t v13 = result;
  uint64_t v14 = v12;
  uint64_t result = MEMORY[0x1C188D710]();
  if (result) {
    goto LABEL_10;
  }
LABEL_4:
  *(void *)&long long v16 = v9;
  *((void *)&v16 + 1) = v10;
  char v15 = v11 & 1;
  char v17 = v15;
  uint64_t v18 = v13;
  uint64_t v19 = v14;
  BOOL v20 = (a2 & 0xC000000000000001) != 0;
  specialized Collection._failEarlyRangeCheck(_:bounds:)((long long *)a1, &v16);
  outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v9, v10, v15);
  outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v13, v14, (a2 & 0xC000000000000001) != 0);
  *(void *)(a3 + 48) = a2;
  *(_OWORD *)a3 = *(_OWORD *)a1;
  *(unsigned char *)(a3 + 16) = *(unsigned char *)(a1 + 16);
  *(_OWORD *)(a3 + 24) = *(_OWORD *)(a1 + 24);
  *(unsigned char *)(a3 + 40) = *(unsigned char *)(a1 + 40);
  swift_bridgeObjectRetain();

  return outlined retain of Range<CMFormatDescriptionRef.Extensions.Index>(a1);
}

uint64_t specialized Collection<>.indices.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = a1;
  *(void *)(a2 + 8) = specialized Dictionary.startIndex.getter(a1);
  *(void *)(a2 + 16) = v4;
  *(unsigned char *)(a2 + 24) = v5 & 1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v6 = __CocoaDictionary.endIndex.getter();
  }
  else
  {
    uint64_t v6 = 1 << *(unsigned char *)(a1 + 32);
    uint64_t v7 = *(unsigned int *)(a1 + 36);
  }
  *(void *)(a2 + 32) = v6;
  *(void *)(a2 + 40) = v7;
  *(unsigned char *)(a2 + 48) = (a1 & 0xC000000000000001) != 0;

  return swift_bridgeObjectRetain();
}

uint64_t specialized Collection.isEmpty.getter(uint64_t a1)
{
  uint64_t result = specialized Dictionary.startIndex.getter(a1);
  uint64_t v5 = result;
  uint64_t v6 = v3;
  char v7 = v4;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t result = __CocoaDictionary.endIndex.getter();
    if (v7)
    {
      uint64_t v9 = result;
      uint64_t v10 = v8;
      char v11 = MEMORY[0x1C188D720](v5, v6, result, v8);
      outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v9, v10, 1);
      outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v5, v6, 1);
      return v11 & 1;
    }
  }
  else if ((v4 & 1) == 0)
  {
    if (*(_DWORD *)(a1 + 36) == v3) {
      return result == 1 << *(unsigned char *)(a1 + 32);
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

void specialized Collection.index(_:offsetBy:)(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  if (a4 < 0) {
    goto LABEL_37;
  }
  uint64_t v7 = a2;
  unint64_t v8 = a1;
  char v9 = a3 & 1;
  if (!a4)
  {
    outlined copy of [A : B].Index._Variant<A, B>(a1, a2, a3 & 1);
    uint64_t v14 = v8;
LABEL_31:
    *(void *)a6 = v14;
    *(void *)(a6 + 8) = v7;
    *(unsigned char *)(a6 + 16) = v9;
    return;
  }
  uint64_t v10 = a5;
  unint64_t v11 = a5 & 0xC000000000000001;
  outlined copy of [A : B].Index._Variant<A, B>(a1, a2, a3 & 1);
  uint64_t v12 = 0;
  uint64_t v32 = v10 + 64;
  uint64_t v13 = a4 - 1;
  uint64_t v30 = v10 + 96;
  while (1)
  {
    if (v11)
    {
      if ((v9 & 1) == 0) {
        goto LABEL_38;
      }
      uint64_t v14 = __CocoaDictionary.index(after:)();
      uint64_t v17 = v16;
      char v9 = 1;
      outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v8, v7, 1);
      uint64_t v7 = v17;
      goto LABEL_6;
    }
    if ((v9 & 1) == 0)
    {
      if ((v8 & 0x8000000000000000) != 0) {
        goto LABEL_34;
      }
      uint64_t v14 = 1 << *(unsigned char *)(v10 + 32);
      if ((uint64_t)v8 >= v14) {
        goto LABEL_34;
      }
      unint64_t v24 = v8 >> 6;
      unint64_t v25 = *(void *)(v32 + 8 * (v8 >> 6));
      if (((v25 >> v8) & 1) == 0) {
        goto LABEL_35;
      }
      if (*(_DWORD *)(v10 + 36) != v7) {
        goto LABEL_36;
      }
      unint64_t v26 = v25 & (-2 << (v8 & 0x3F));
      if (v26)
      {
        uint64_t v14 = __clz(__rbit64(v26)) | v8 & 0xFFFFFFFFFFFFFFC0;
      }
      else
      {
        unint64_t v27 = v24 + 1;
        unint64_t v28 = (unint64_t)(v14 + 63) >> 6;
        if (v24 + 1 < v28)
        {
          unint64_t v29 = *(void *)(v32 + 8 * v27);
          if (!v29)
          {
            unint64_t v27 = v24 + 2;
            if (v24 + 2 >= v28) {
              goto LABEL_5;
            }
            unint64_t v29 = *(void *)(v32 + 8 * v27);
            if (!v29)
            {
              unint64_t v27 = v24 + 3;
              if (v24 + 3 >= v28) {
                goto LABEL_5;
              }
              unint64_t v29 = *(void *)(v32 + 8 * v27);
              if (!v29)
              {
                while (v28 - 4 != v24)
                {
                  unint64_t v29 = *(void *)(v30 + 8 * v24++);
                  if (v29)
                  {
                    outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v8, v7, 0);
                    unint64_t v27 = v24 + 3;
                    goto LABEL_21;
                  }
                }
                outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v8, v7, 0);
                goto LABEL_5;
              }
            }
          }
LABEL_21:
          uint64_t v14 = __clz(__rbit64(v29)) + (v27 << 6);
        }
      }
LABEL_5:
      char v9 = 0;
      uint64_t v7 = v7;
      goto LABEL_6;
    }
    if (__CocoaDictionary.Index.age.getter() != *(_DWORD *)(v10 + 36)) {
      break;
    }
    __CocoaDictionary.Index.key.getter();
    outlined copy of [A : B].Index._Variant<A, B>(v8, v7, 1);
    type metadata accessor for CFStringRef(0);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    swift_unknownObjectRelease();
    uint64_t v18 = v10;
    specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v33);
    char v20 = v19;

    if ((v20 & 1) == 0) {
      goto LABEL_33;
    }
    __CocoaDictionary.Index.dictionary.getter();
    uint64_t v14 = __CocoaDictionary.index(after:)();
    uint64_t v21 = v13;
    uint64_t v23 = v22;
    char v9 = 1;
    outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v8, v7, 1);
    swift_unknownObjectRelease();
    outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v8, v7, 1);
    uint64_t v7 = v23;
    uint64_t v13 = v21;
    uint64_t v10 = v18;
LABEL_6:
    unint64_t v8 = v14;
    if (v12++ == v13) {
      goto LABEL_31;
    }
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

void specialized Collection.index(_:offsetBy:limitedBy:)(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  if (a4 < 0) {
    goto LABEL_47;
  }
  uint64_t v13 = a2;
  unint64_t v14 = a1;
  int v15 = a3 & 1;
  outlined copy of [A : B].Index._Variant<A, B>(a1, a2, a3 & 1);
  if (!a4)
  {
    uint64_t v17 = v14;
LABEL_38:
    *(void *)a9 = v17;
    *(void *)(a9 + 8) = v13;
    *(unsigned char *)(a9 + 16) = v15;
    return;
  }
  uint64_t v16 = 0;
  uint64_t v33 = a8 + 64;
  unint64_t v34 = a8 & 0xC000000000000001;
  char v32 = a7;
  while (1)
  {
    if (v15)
    {
      if ((a7 & 1) == 0) {
        goto LABEL_48;
      }
      if (MEMORY[0x1C188D720](v14, v13, a5, a6))
      {
        a5 = v14;
LABEL_40:
        outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(a5, v13, v15);
        *(void *)a9 = 0;
        *(void *)(a9 + 8) = 0;
        *(unsigned char *)(a9 + 16) = -1;
        return;
      }
      if (v34)
      {
        uint64_t v17 = __CocoaDictionary.index(after:)();
        uint64_t v19 = v18;
        outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v14, v13, 1);
        uint64_t v13 = v19;
      }
      else
      {
        if (__CocoaDictionary.Index.age.getter() != *(_DWORD *)(a8 + 36)) {
          goto LABEL_45;
        }
        __CocoaDictionary.Index.key.getter();
        outlined copy of [A : B].Index._Variant<A, B>(v14, v13, 1);
        type metadata accessor for CFStringRef(0);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        swift_unknownObjectRelease();
        specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v36);
        char v21 = v20;

        if ((v21 & 1) == 0) {
          goto LABEL_46;
        }
        __CocoaDictionary.Index.dictionary.getter();
        uint64_t v17 = __CocoaDictionary.index(after:)();
        uint64_t v23 = v22;
        outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v14, v13, 1);
        swift_unknownObjectRelease();
        outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v14, v13, 1);
        uint64_t v13 = v23;
        a7 = v32;
      }
      goto LABEL_5;
    }
    if (a7) {
      goto LABEL_48;
    }
    if (v13 != a6) {
      break;
    }
    if (v14 == a5) {
      goto LABEL_40;
    }
    if (v34) {
      goto LABEL_49;
    }
    if ((v14 & 0x8000000000000000) != 0) {
      goto LABEL_42;
    }
    uint64_t v17 = 1 << *(unsigned char *)(a8 + 32);
    if ((uint64_t)v14 >= v17) {
      goto LABEL_42;
    }
    unint64_t v24 = v14 >> 6;
    unint64_t v25 = *(void *)(v33 + 8 * (v14 >> 6));
    if (((v25 >> v14) & 1) == 0) {
      goto LABEL_43;
    }
    if (*(_DWORD *)(a8 + 36) != v13) {
      goto LABEL_44;
    }
    unint64_t v26 = v25 & (-2 << (v14 & 0x3F));
    if (!v26)
    {
      unint64_t v27 = v24 + 1;
      unint64_t v28 = (unint64_t)(v17 + 63) >> 6;
      if (v24 + 1 >= v28)
      {
        outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v14, v13, 0);
        uint64_t v13 = v13;
        goto LABEL_5;
      }
      unint64_t v29 = *(void *)(v33 + 8 * v27);
      if (v29)
      {
LABEL_25:
        outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v14, v13, 0);
        uint64_t v17 = __clz(__rbit64(v29)) | (v27 << 6);
      }
      else
      {
        unint64_t v27 = v24 + 2;
        if (v24 + 2 < v28)
        {
          unint64_t v29 = *(void *)(v33 + 8 * v27);
          if (v29) {
            goto LABEL_25;
          }
          unint64_t v27 = v24 + 3;
          if (v24 + 3 < v28)
          {
            unint64_t v29 = *(void *)(v33 + 8 * v27);
            if (v29) {
              goto LABEL_25;
            }
            unint64_t v30 = v28 - 4;
            while (v30 != v24)
            {
              unint64_t v29 = *(void *)(a8 + 96 + 8 * v24++);
              if (v29)
              {
                unint64_t v27 = v24 + 3;
                goto LABEL_25;
              }
            }
          }
        }
        outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v14, v13, 0);
      }
      a7 = v32;
      uint64_t v13 = v13;
      goto LABEL_5;
    }
    outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v14, v13, 0);
    uint64_t v17 = __clz(__rbit64(v26)) | v14 & 0xFFFFFFFFFFFFFFC0;
    uint64_t v13 = v13;
LABEL_5:
    ++v16;
    unint64_t v14 = v17;
    if (v16 == a4) {
      goto LABEL_38;
    }
  }
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
}

void specialized Collection.distance(from:to:)(int64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  char v8 = a6;
  uint64_t v12 = a2;
  unint64_t v13 = a1;
  if (a6)
  {
    if ((a3 & 1) == 0) {
      goto LABEL_57;
    }
    if (MEMORY[0x1C188D710](a4, a5, a1, a2)) {
      goto LABEL_53;
    }
    char v30 = MEMORY[0x1C188D720](v13, v12, a4, a5);
    outlined copy of [A : B].Index._Variant<A, B>(v13, v12, 1);
    if ((v30 & 1) == 0) {
      goto LABEL_6;
    }
LABEL_43:
    outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v13, v12, a3 & 1);
    return;
  }
  if (a3) {
    goto LABEL_57;
  }
  if (a4 < a1) {
    goto LABEL_52;
  }
  if (a5 != a2) {
    goto LABEL_54;
  }
  if (a1 == a4) {
    goto LABEL_43;
  }
LABEL_6:
  char v14 = a3 & 1;
  uint64_t v32 = a7 + 64;
  uint64_t v15 = 1;
  char v31 = v8;
  do
  {
    if ((a7 & 0xC000000000000001) != 0)
    {
      if ((v14 & 1) == 0) {
        goto LABEL_56;
      }
      uint64_t v17 = __CocoaDictionary.index(after:)();
      uint64_t v19 = v18;
LABEL_15:
      outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v13, v12, 1);
      if ((v8 & 1) == 0) {
        goto LABEL_55;
      }
      char v23 = MEMORY[0x1C188D720](v17, v19, a4, a5);
      char v14 = 1;
      uint64_t v12 = v19;
      if (v23) {
        goto LABEL_44;
      }
      goto LABEL_7;
    }
    if (v14)
    {
      if (__CocoaDictionary.Index.age.getter() != *(_DWORD *)(a7 + 36)) {
        goto LABEL_46;
      }
      __CocoaDictionary.Index.key.getter();
      outlined copy of [A : B].Index._Variant<A, B>(v13, v12, 1);
      type metadata accessor for CFStringRef(0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v33);
      char v21 = v20;

      if ((v21 & 1) == 0) {
        goto LABEL_48;
      }
      __CocoaDictionary.Index.dictionary.getter();
      uint64_t v17 = __CocoaDictionary.index(after:)();
      uint64_t v19 = v22;
      outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v13, v12, 1);
      char v8 = v31;
      swift_unknownObjectRelease();
      goto LABEL_15;
    }
    if ((v13 & 0x8000000000000000) != 0) {
      goto LABEL_47;
    }
    uint64_t v17 = 1 << *(unsigned char *)(a7 + 32);
    if ((uint64_t)v13 >= v17) {
      goto LABEL_47;
    }
    unint64_t v24 = v13 >> 6;
    unint64_t v25 = *(void *)(v32 + 8 * (v13 >> 6));
    if (((v25 >> v13) & 1) == 0) {
      goto LABEL_49;
    }
    if (*(_DWORD *)(a7 + 36) != v12) {
      goto LABEL_50;
    }
    unint64_t v26 = v25 & (-2 << (v13 & 0x3F));
    if (!v26)
    {
      unint64_t v27 = v24 + 1;
      unint64_t v28 = (unint64_t)(v17 + 63) >> 6;
      if (v24 + 1 >= v28) {
        goto LABEL_28;
      }
      unint64_t v29 = *(void *)(v32 + 8 * v27);
      if (!v29)
      {
        unint64_t v27 = v24 + 2;
        if (v24 + 2 >= v28) {
          goto LABEL_27;
        }
        unint64_t v29 = *(void *)(v32 + 8 * v27);
        if (!v29)
        {
          unint64_t v27 = v24 + 3;
          if (v24 + 3 >= v28) {
            goto LABEL_27;
          }
          unint64_t v29 = *(void *)(v32 + 8 * v27);
          if (!v29)
          {
            while (v28 - 4 != v24)
            {
              unint64_t v29 = *(void *)(a7 + 96 + 8 * v24++);
              if (v29)
              {
                outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v13, v12, 0);
                unint64_t v27 = v24 + 3;
                goto LABEL_26;
              }
            }
            outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v13, v12, 0);
            goto LABEL_27;
          }
        }
      }
LABEL_26:
      uint64_t v17 = __clz(__rbit64(v29)) + (v27 << 6);
LABEL_27:
      char v8 = v31;
      goto LABEL_28;
    }
    uint64_t v17 = __clz(__rbit64(v26)) | v13 & 0xFFFFFFFFFFFFFFC0;
LABEL_28:
    if (v8) {
      goto LABEL_55;
    }
    if (a5 != v12) {
      goto LABEL_51;
    }
    char v14 = 0;
    uint64_t v12 = v12;
    if (v17 == a4)
    {
      uint64_t v19 = v12;
      uint64_t v17 = a4;
LABEL_44:
      outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v17, v19, v14);
      return;
    }
LABEL_7:
    unint64_t v13 = v17;
  }
  while (!__OFADD__(v15++, 1));
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
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
}

uint64_t specialized _CMFormatDescriptionFourCCConvertible.description.getter(unsigned int a1)
{
  uint64_t v2 = type metadata accessor for String.Encoding();
  MEMORY[0x1F4188790](v2 - 8);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1BE2261A0;
  *(unsigned char *)(v3 + 32) = HIBYTE(a1);
  *(unsigned char *)(v3 + 33) = BYTE2(a1);
  *(unsigned char *)(v3 + 34) = BYTE1(a1);
  *(unsigned char *)(v3 + 35) = a1;
  if (isprint(HIBYTE(a1)) && isprint(BYTE2(a1)) && isprint(BYTE1(a1)) && isprint(a1))
  {
    static String.Encoding.utf8.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt8]);
    lazy protocol witness table accessor for type DefaultIndices<CMSampleBufferRef.SampleAttachmentsArray> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type [UInt8] and conformance [A], &demangling cache variable for type metadata for [UInt8]);
    uint64_t v4 = String.init<A>(bytes:encoding:)();
    uint64_t v6 = v5;
    swift_bridgeObjectRelease();
    if (v6)
    {
      v7._countAndFlagsBits = v4;
      v7._object = v6;
      String.append(_:)(v7);
      swift_bridgeObjectRelease();
      v8._countAndFlagsBits = 39;
      v8._object = (void *)0xE100000000000000;
      String.append(_:)(v8);
      return 39;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = MEMORY[0x1E4FBC4C0];
  *(_OWORD *)(v10 + 16) = xmmword_1BE225570;
  uint64_t v12 = MEMORY[0x1E4FBC530];
  *(void *)(v10 + 56) = v11;
  *(void *)(v10 + 64) = v12;
  *(_DWORD *)(v10 + 32) = a1;
  return String.init(format:_:)();
}

uint64_t _CMFormatDescriptionFourCCConvertible.description.getter()
{
  uint64_t v0 = type metadata accessor for String.Encoding();
  MEMORY[0x1F4188790](v0 - 8);
  v16[1] = (char *)v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch thunk of RawRepresentable.rawValue.getter();
  unsigned int v2 = BYTE3(v17);
  dispatch thunk of RawRepresentable.rawValue.getter();
  unsigned __int8 v3 = BYTE2(v17);
  unsigned int v4 = WORD1(v17);
  dispatch thunk of RawRepresentable.rawValue.getter();
  unsigned __int8 v5 = BYTE1(v17);
  dispatch thunk of RawRepresentable.rawValue.getter();
  unsigned __int8 v6 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1BE2261A0;
  *(unsigned char *)(v7 + 32) = v2;
  *(unsigned char *)(v7 + 33) = v4;
  *(unsigned char *)(v7 + 34) = v5;
  *(unsigned char *)(v7 + 35) = v6;
  if (isprint(v2) && isprint(v3) && isprint(v5) && isprint(v6))
  {
    uint64_t v17 = v7;
    static String.Encoding.utf8.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UInt8]);
    lazy protocol witness table accessor for type DefaultIndices<CMSampleBufferRef.SampleAttachmentsArray> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type [UInt8] and conformance [A], &demangling cache variable for type metadata for [UInt8]);
    uint64_t v8 = String.init<A>(bytes:encoding:)();
    uint64_t v10 = v9;
    swift_bridgeObjectRelease();
    if (v10)
    {
      uint64_t v17 = 39;
      unint64_t v18 = 0xE100000000000000;
      v11._countAndFlagsBits = v8;
      v11._object = v10;
      String.append(_:)(v11);
      swift_bridgeObjectRelease();
      v12._countAndFlagsBits = 39;
      v12._object = (void *)0xE100000000000000;
      String.append(_:)(v12);
      return v17;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1BE225570;
  uint64_t v15 = MEMORY[0x1E4FBC530];
  *(void *)(v14 + 56) = MEMORY[0x1E4FBC4C0];
  *(void *)(v14 + 64) = v15;
  dispatch thunk of RawRepresentable.rawValue.getter();
  return String.init(format:_:)();
}

uint64_t CMFormatDescriptionRef.MediaType.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

id CMFormatDescriptionRef.Extensions.Key.rawValue.getter()
{
  return *v0;
}

void CMFormatDescriptionRef.Extensions.Key.rawValue.setter(void *a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*CMFormatDescriptionRef.Extensions.Key.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

uint64_t CMFormatDescriptionRef.Extensions.Key.init(rawValue:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

id one-time initialization function for originalCompressionSettings()
{
  static CMFormatDescriptionRef.Extensions.Key.originalCompressionSettings = *MEMORY[0x1E4F1EE08];
  return (id)static CMFormatDescriptionRef.Extensions.Key.originalCompressionSettings;
}

id static CMFormatDescriptionRef.Extensions.Key.originalCompressionSettings.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for originalCompressionSettings, (void **)&static CMFormatDescriptionRef.Extensions.Key.originalCompressionSettings, a1);
}

id one-time initialization function for sampleDescriptionExtensionAtoms()
{
  static CMFormatDescriptionRef.Extensions.Key.sampleDescriptionExtensionAtoms = *MEMORY[0x1E4F1EE20];
  return (id)static CMFormatDescriptionRef.Extensions.Key.sampleDescriptionExtensionAtoms;
}

id static CMFormatDescriptionRef.Extensions.Key.sampleDescriptionExtensionAtoms.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for sampleDescriptionExtensionAtoms, (void **)&static CMFormatDescriptionRef.Extensions.Key.sampleDescriptionExtensionAtoms, a1);
}

id one-time initialization function for verbatimSampleDescription()
{
  static CMFormatDescriptionRef.Extensions.Key.verbatimSampleDescription = *MEMORY[0x1E4F1EE58];
  return (id)static CMFormatDescriptionRef.Extensions.Key.verbatimSampleDescription;
}

id static CMFormatDescriptionRef.Extensions.Key.verbatimSampleDescription.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for verbatimSampleDescription, (void **)&static CMFormatDescriptionRef.Extensions.Key.verbatimSampleDescription, a1);
}

id one-time initialization function for verbatimISOSampleEntry()
{
  static CMFormatDescriptionRef.Extensions.Key.verbatimISOSampleEntry = *MEMORY[0x1E4F1EE50];
  return (id)static CMFormatDescriptionRef.Extensions.Key.verbatimISOSampleEntry;
}

id static CMFormatDescriptionRef.Extensions.Key.verbatimISOSampleEntry.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for verbatimISOSampleEntry, (void **)&static CMFormatDescriptionRef.Extensions.Key.verbatimISOSampleEntry, a1);
}

id one-time initialization function for formatName()
{
  static CMFormatDescriptionRef.Extensions.Key.formatName = *MEMORY[0x1E4F1EDA8];
  return (id)static CMFormatDescriptionRef.Extensions.Key.formatName;
}

id static CMFormatDescriptionRef.Extensions.Key.formatName.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for formatName, (void **)&static CMFormatDescriptionRef.Extensions.Key.formatName, a1);
}

id one-time initialization function for depth()
{
  static CMFormatDescriptionRef.Extensions.Key.depth = *MEMORY[0x1E4F1ED90];
  return (id)static CMFormatDescriptionRef.Extensions.Key.depth;
}

id static CMFormatDescriptionRef.Extensions.Key.depth.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for depth, (void **)&static CMFormatDescriptionRef.Extensions.Key.depth, a1);
}

id one-time initialization function for cleanAperture()
{
  static CMFormatDescriptionRef.Extensions.Key.cleanAperture = *MEMORY[0x1E4F1ED60];
  return (id)static CMFormatDescriptionRef.Extensions.Key.cleanAperture;
}

id static CMFormatDescriptionRef.Extensions.Key.cleanAperture.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for cleanAperture, (void **)&static CMFormatDescriptionRef.Extensions.Key.cleanAperture, a1);
}

id one-time initialization function for fieldCount()
{
  static CMFormatDescriptionRef.Extensions.Key.fieldCMItemCount Count = *MEMORY[0x1E4F1ED98];
  return (id)static CMFormatDescriptionRef.Extensions.Key.fieldCount;
}

id static CMFormatDescriptionRef.Extensions.Key.fieldCount.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for fieldCount, (void **)&static CMFormatDescriptionRef.Extensions.Key.fieldCount, a1);
}

id one-time initialization function for fieldDetail()
{
  static CMFormatDescriptionRef.Extensions.Key.fieldDetail = *MEMORY[0x1E4F1EDA0];
  return (id)static CMFormatDescriptionRef.Extensions.Key.fieldDetail;
}

id static CMFormatDescriptionRef.Extensions.Key.fieldDetail.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for fieldDetail, (void **)&static CMFormatDescriptionRef.Extensions.Key.fieldDetail, a1);
}

id one-time initialization function for pixelAspectRatio()
{
  static CMFormatDescriptionRef.Extensions.Key.pixelAspectRatio = *MEMORY[0x1E4F1EE10];
  return (id)static CMFormatDescriptionRef.Extensions.Key.pixelAspectRatio;
}

id static CMFormatDescriptionRef.Extensions.Key.pixelAspectRatio.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for pixelAspectRatio, (void **)&static CMFormatDescriptionRef.Extensions.Key.pixelAspectRatio, a1);
}

id one-time initialization function for colorPrimaries()
{
  static CMFormatDescriptionRef.Extensions.Key.colorPrimaries = *MEMORY[0x1E4F1ED68];
  return (id)static CMFormatDescriptionRef.Extensions.Key.colorPrimaries;
}

id static CMFormatDescriptionRef.Extensions.Key.colorPrimaries.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for colorPrimaries, (void **)&static CMFormatDescriptionRef.Extensions.Key.colorPrimaries, a1);
}

id one-time initialization function for transferFunction()
{
  static CMFormatDescriptionRef.Extensions.Key.transferFunction = *MEMORY[0x1E4F1EE40];
  return (id)static CMFormatDescriptionRef.Extensions.Key.transferFunction;
}

id static CMFormatDescriptionRef.Extensions.Key.transferFunction.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for transferFunction, (void **)&static CMFormatDescriptionRef.Extensions.Key.transferFunction, a1);
}

id one-time initialization function for gammaLevel()
{
  static CMFormatDescriptionRef.Extensions.Key.gammaLevel = *MEMORY[0x1E4F1EDB8];
  return (id)static CMFormatDescriptionRef.Extensions.Key.gammaLevel;
}

id static CMFormatDescriptionRef.Extensions.Key.gammaLevel.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for gammaLevel, (void **)&static CMFormatDescriptionRef.Extensions.Key.gammaLevel, a1);
}

id one-time initialization function for yCbCrMatrix()
{
  static CMFormatDescriptionRef.Extensions.Key.yCbCrMatrix = *MEMORY[0x1E4F1EE68];
  return (id)static CMFormatDescriptionRef.Extensions.Key.yCbCrMatrix;
}

id static CMFormatDescriptionRef.Extensions.Key.yCbCrMatrix.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for yCbCrMatrix, (void **)&static CMFormatDescriptionRef.Extensions.Key.yCbCrMatrix, a1);
}

id one-time initialization function for fullRangeVideo()
{
  static CMFormatDescriptionRef.Extensions.Key.fullRangeVideo = *MEMORY[0x1E4F1EDB0];
  return (id)static CMFormatDescriptionRef.Extensions.Key.fullRangeVideo;
}

id static CMFormatDescriptionRef.Extensions.Key.fullRangeVideo.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for fullRangeVideo, (void **)&static CMFormatDescriptionRef.Extensions.Key.fullRangeVideo, a1);
}

id one-time initialization function for iccProfile()
{
  static CMFormatDescriptionRef.Extensions.Key.iccProfile = *MEMORY[0x1E4F1EDF0];
  return (id)static CMFormatDescriptionRef.Extensions.Key.iccProfile;
}

id static CMFormatDescriptionRef.Extensions.Key.iccProfile.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for iccProfile, (void **)&static CMFormatDescriptionRef.Extensions.Key.iccProfile, a1);
}

id one-time initialization function for bytesPerRow()
{
  static CMFormatDescriptionRef.Extensions.Key.bytesPerRow = *MEMORY[0x1E4F1ED48];
  return (id)static CMFormatDescriptionRef.Extensions.Key.bytesPerRow;
}

id static CMFormatDescriptionRef.Extensions.Key.bytesPerRow.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for bytesPerRow, (void **)&static CMFormatDescriptionRef.Extensions.Key.bytesPerRow, a1);
}

id one-time initialization function for chromaLocationTopField()
{
  static CMFormatDescriptionRef.Extensions.Key.chromaLocationTopField = *MEMORY[0x1E4F1ED58];
  return (id)static CMFormatDescriptionRef.Extensions.Key.chromaLocationTopField;
}

id static CMFormatDescriptionRef.Extensions.Key.chromaLocationTopField.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for chromaLocationTopField, (void **)&static CMFormatDescriptionRef.Extensions.Key.chromaLocationTopField, a1);
}

id one-time initialization function for chromaLocationBottomField()
{
  static CMFormatDescriptionRef.Extensions.Key.chromaLocationBottomField = *MEMORY[0x1E4F1ED50];
  return (id)static CMFormatDescriptionRef.Extensions.Key.chromaLocationBottomField;
}

id static CMFormatDescriptionRef.Extensions.Key.chromaLocationBottomField.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for chromaLocationBottomField, (void **)&static CMFormatDescriptionRef.Extensions.Key.chromaLocationBottomField, a1);
}

id one-time initialization function for conformsToMPEG2VideoProfile()
{
  static CMFormatDescriptionRef.Extensions.Key.conformsToMPEG2VideoProfile = *MEMORY[0x1E4F1ED10];
  return (id)static CMFormatDescriptionRef.Extensions.Key.conformsToMPEG2VideoProfile;
}

id static CMFormatDescriptionRef.Extensions.Key.conformsToMPEG2VideoProfile.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for conformsToMPEG2VideoProfile, (void **)&static CMFormatDescriptionRef.Extensions.Key.conformsToMPEG2VideoProfile, a1);
}

id one-time initialization function for temporalQuality()
{
  static CMFormatDescriptionRef.Extensions.Key.temporalQuality = *MEMORY[0x1E4F1EE38];
  return (id)static CMFormatDescriptionRef.Extensions.Key.temporalQuality;
}

id static CMFormatDescriptionRef.Extensions.Key.temporalQuality.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for temporalQuality, (void **)&static CMFormatDescriptionRef.Extensions.Key.temporalQuality, a1);
}

id one-time initialization function for spatialQuality()
{
  static CMFormatDescriptionRef.Extensions.Key.spatialQuality = *MEMORY[0x1E4F1EE28];
  return (id)static CMFormatDescriptionRef.Extensions.Key.spatialQuality;
}

id static CMFormatDescriptionRef.Extensions.Key.spatialQuality.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for spatialQuality, (void **)&static CMFormatDescriptionRef.Extensions.Key.spatialQuality, a1);
}

id one-time initialization function for version()
{
  static CMFormatDescriptionRef.Extensions.Key.version = *MEMORY[0x1E4F1EE60];
  return (id)static CMFormatDescriptionRef.Extensions.Key.version;
}

id static CMFormatDescriptionRef.Extensions.Key.version.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for version, (void **)&static CMFormatDescriptionRef.Extensions.Key.version, a1);
}

id one-time initialization function for revisionLevel()
{
  static CMFormatDescriptionRef.Extensions.Key.revisionLevel = *MEMORY[0x1E4F1EE18];
  return (id)static CMFormatDescriptionRef.Extensions.Key.revisionLevel;
}

id static CMFormatDescriptionRef.Extensions.Key.revisionLevel.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for revisionLevel, (void **)&static CMFormatDescriptionRef.Extensions.Key.revisionLevel, a1);
}

id one-time initialization function for vendor()
{
  static CMFormatDescriptionRef.Extensions.Key.vendor = *MEMORY[0x1E4F1EE48];
  return (id)static CMFormatDescriptionRef.Extensions.Key.vendor;
}

id static CMFormatDescriptionRef.Extensions.Key.vendor.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for vendor, (void **)&static CMFormatDescriptionRef.Extensions.Key.vendor, a1);
}

id one-time initialization function for masteringDisplayColorVolume()
{
  static CMFormatDescriptionRef.Extensions.Key.masteringDisplayColorVolume = *MEMORY[0x1E4F1EE00];
  return (id)static CMFormatDescriptionRef.Extensions.Key.masteringDisplayColorVolume;
}

id static CMFormatDescriptionRef.Extensions.Key.masteringDisplayColorVolume.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for masteringDisplayColorVolume, (void **)&static CMFormatDescriptionRef.Extensions.Key.masteringDisplayColorVolume, a1);
}

id one-time initialization function for contentLightLevelInfo()
{
  static CMFormatDescriptionRef.Extensions.Key.contentLightLevelInfo = *MEMORY[0x1E4F1ED88];
  return (id)static CMFormatDescriptionRef.Extensions.Key.contentLightLevelInfo;
}

id static CMFormatDescriptionRef.Extensions.Key.contentLightLevelInfo.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for contentLightLevelInfo, (void **)&static CMFormatDescriptionRef.Extensions.Key.contentLightLevelInfo, a1);
}

id one-time initialization function for alternativeTransferCharacteristics()
{
  static CMFormatDescriptionRef.Extensions.Key.alternativeTransferCharacteristics = *MEMORY[0x1E4F1ED28];
  return (id)static CMFormatDescriptionRef.Extensions.Key.alternativeTransferCharacteristics;
}

id static CMFormatDescriptionRef.Extensions.Key.alternativeTransferCharacteristics.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for alternativeTransferCharacteristics, (void **)&static CMFormatDescriptionRef.Extensions.Key.alternativeTransferCharacteristics, a1);
}

id one-time initialization function for auxiliaryTypeInfo()
{
  static CMFormatDescriptionRef.Extensions.Key.auxiliaryTypeInfo = *MEMORY[0x1E4F1ED38];
  return (id)static CMFormatDescriptionRef.Extensions.Key.auxiliaryTypeInfo;
}

id static CMFormatDescriptionRef.Extensions.Key.auxiliaryTypeInfo.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for auxiliaryTypeInfo, (void **)&static CMFormatDescriptionRef.Extensions.Key.auxiliaryTypeInfo, a1);
}

id one-time initialization function for alphaChannelMode()
{
  static CMFormatDescriptionRef.Extensions.Key.alphaChannelMode = *MEMORY[0x1E4F1ED20];
  return (id)static CMFormatDescriptionRef.Extensions.Key.alphaChannelMode;
}

id static CMFormatDescriptionRef.Extensions.Key.alphaChannelMode.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for alphaChannelMode, (void **)&static CMFormatDescriptionRef.Extensions.Key.alphaChannelMode, a1);
}

id one-time initialization function for containsAlphaChannel()
{
  static CMFormatDescriptionRef.Extensions.Key.containsAlphaChannel = *MEMORY[0x1E4F1ED70];
  return (id)static CMFormatDescriptionRef.Extensions.Key.containsAlphaChannel;
}

id static CMFormatDescriptionRef.Extensions.Key.containsAlphaChannel.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for containsAlphaChannel, (void **)&static CMFormatDescriptionRef.Extensions.Key.containsAlphaChannel, a1);
}

id one-time initialization function for displayFlags()
{
  static CMFormatDescriptionRef.Extensions.Key.displayFlags = *MEMORY[0x1E4F1F470];
  return (id)static CMFormatDescriptionRef.Extensions.Key.displayFlags;
}

id static CMFormatDescriptionRef.Extensions.Key.displayFlags.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for displayFlags, (void **)&static CMFormatDescriptionRef.Extensions.Key.displayFlags, a1);
}

id one-time initialization function for backgroundColor()
{
  static CMFormatDescriptionRef.Extensions.Key.backgroundColor = *MEMORY[0x1E4F1F450];
  return (id)static CMFormatDescriptionRef.Extensions.Key.backgroundColor;
}

id static CMFormatDescriptionRef.Extensions.Key.backgroundColor.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for backgroundColor, (void **)&static CMFormatDescriptionRef.Extensions.Key.backgroundColor, a1);
}

id one-time initialization function for defaultTextBox()
{
  static CMFormatDescriptionRef.Extensions.Key.defaultTextBox = *MEMORY[0x1E4F1F468];
  return (id)static CMFormatDescriptionRef.Extensions.Key.defaultTextBox;
}

id static CMFormatDescriptionRef.Extensions.Key.defaultTextBox.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for defaultTextBox, (void **)&static CMFormatDescriptionRef.Extensions.Key.defaultTextBox, a1);
}

id one-time initialization function for defaultStyle()
{
  static CMFormatDescriptionRef.Extensions.Key.defaultStyle = *MEMORY[0x1E4F1F460];
  return (id)static CMFormatDescriptionRef.Extensions.Key.defaultStyle;
}

id static CMFormatDescriptionRef.Extensions.Key.defaultStyle.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for defaultStyle, (void **)&static CMFormatDescriptionRef.Extensions.Key.defaultStyle, a1);
}

id one-time initialization function for horizontalJustification()
{
  static CMFormatDescriptionRef.Extensions.Key.horizontalJustification = *MEMORY[0x1E4F1F480];
  return (id)static CMFormatDescriptionRef.Extensions.Key.horizontalJustification;
}

id static CMFormatDescriptionRef.Extensions.Key.horizontalJustification.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for horizontalJustification, (void **)&static CMFormatDescriptionRef.Extensions.Key.horizontalJustification, a1);
}

id one-time initialization function for verticalJustification()
{
  static CMFormatDescriptionRef.Extensions.Key.verticalJustification = *MEMORY[0x1E4F1F498];
  return (id)static CMFormatDescriptionRef.Extensions.Key.verticalJustification;
}

id static CMFormatDescriptionRef.Extensions.Key.verticalJustification.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for verticalJustification, (void **)&static CMFormatDescriptionRef.Extensions.Key.verticalJustification, a1);
}

id one-time initialization function for fontTable()
{
  static CMFormatDescriptionRef.Extensions.Key.fontTable = *MEMORY[0x1E4F1F478];
  return (id)static CMFormatDescriptionRef.Extensions.Key.fontTable;
}

id static CMFormatDescriptionRef.Extensions.Key.fontTable.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for fontTable, (void **)&static CMFormatDescriptionRef.Extensions.Key.fontTable, a1);
}

id one-time initialization function for textJustification()
{
  static CMFormatDescriptionRef.Extensions.Key.textJustification = *MEMORY[0x1E4F1F490];
  return (id)static CMFormatDescriptionRef.Extensions.Key.textJustification;
}

id static CMFormatDescriptionRef.Extensions.Key.textJustification.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for textJustification, (void **)&static CMFormatDescriptionRef.Extensions.Key.textJustification, a1);
}

id one-time initialization function for defaultFontName()
{
  static CMFormatDescriptionRef.Extensions.Key.defaultFontName = *MEMORY[0x1E4F1F458];
  return (id)static CMFormatDescriptionRef.Extensions.Key.defaultFontName;
}

id static CMFormatDescriptionRef.Extensions.Key.defaultFontName.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for defaultFontName, (void **)&static CMFormatDescriptionRef.Extensions.Key.defaultFontName, a1);
}

id one-time initialization function for sourceReferenceName()
{
  static CMFormatDescriptionRef.Extensions.Key.sourceReferenceName = *MEMORY[0x1E4F1F9C8];
  return (id)static CMFormatDescriptionRef.Extensions.Key.sourceReferenceName;
}

id static CMFormatDescriptionRef.Extensions.Key.sourceReferenceName.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for sourceReferenceName, (void **)&static CMFormatDescriptionRef.Extensions.Key.sourceReferenceName, a1);
}

id one-time initialization function for metadataKeyTable()
{
  static CMFormatDescriptionRef.Extensions.Key.metadataKeyTable = *MEMORY[0x1E4F1ED18];
  return (id)static CMFormatDescriptionRef.Extensions.Key.metadataKeyTable;
}

id static CMFormatDescriptionRef.Extensions.Key.metadataKeyTable.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for metadataKeyTable, (void **)&static CMFormatDescriptionRef.Extensions.Key.metadataKeyTable, a1);
}

id one-time initialization function for ambientViewingEnvironment()
{
  static CMFormatDescriptionRef.Extensions.Key.ambientViewingEnvironment = *MEMORY[0x1E4F1ED30];
  return (id)static CMFormatDescriptionRef.Extensions.Key.ambientViewingEnvironment;
}

id static CMFormatDescriptionRef.Extensions.Key.ambientViewingEnvironment.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for ambientViewingEnvironment, (void **)&static CMFormatDescriptionRef.Extensions.Key.ambientViewingEnvironment, a1);
}

id one-time initialization function for bitsPerComponent()
{
  static CMFormatDescriptionRef.Extensions.Key.bitsPerComponent = *MEMORY[0x1E4F1ED40];
  return (id)static CMFormatDescriptionRef.Extensions.Key.bitsPerComponent;
}

id static CMFormatDescriptionRef.Extensions.Key.bitsPerComponent.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for bitsPerComponent, (void **)&static CMFormatDescriptionRef.Extensions.Key.bitsPerComponent, a1);
}

uint64_t CMFormatDescriptionRef.Extensions.Value.propertyListRepresentation.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t CMFormatDescriptionRef.Extensions.Value.propertyListRepresentation.setter(uint64_t a1)
{
  uint64_t result = swift_unknownObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*CMFormatDescriptionRef.Extensions.Value.propertyListRepresentation.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

uint64_t CMFormatDescriptionRef.Extensions.Value.init(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t static CMFormatDescriptionRef.Extensions.Value.number<A>(_:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = _bridgeAnythingToObjectiveC<A>(_:)();
  *a1 = result;
  return result;
}

uint64_t static CMFormatDescriptionRef.Extensions.Value.string(_:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = MEMORY[0x1C188D3B0]();
  *a1 = result;
  return result;
}

id static CMFormatDescriptionRef.Extensions.Value.data(_:)@<X0>(id a1@<X0>, id *a2@<X8>)
{
  *a2 = a1;
  return a1;
}

uint64_t static CMFormatDescriptionRef.Extensions.Value.cleanAperture<A, B, C, D>(width:height:horizontalOffet:verticalOffset:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, Class *a9@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1BE2261A0;
  unint64_t v18 = (void *)*MEMORY[0x1E4F1EED0];
  *(void *)(inited + 32) = *MEMORY[0x1E4F1EED0];
  *(void *)(inited + 64) = a5;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 40));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 16))(boxed_opaque_existential_0, a1, a5);
  char v20 = (void *)*MEMORY[0x1E4F1EEA0];
  *(void *)(inited + 72) = *MEMORY[0x1E4F1EEA0];
  *(void *)(inited + 104) = a6;
  char v21 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 80));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a6 - 8) + 16))(v21, a2, a6);
  uint64_t v22 = (void *)*MEMORY[0x1E4F1EEB0];
  *(void *)(inited + 112) = *MEMORY[0x1E4F1EEB0];
  *(void *)(inited + 144) = a7;
  char v23 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 120));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a7 - 8) + 16))(v23, a3, a7);
  unint64_t v24 = (void *)*MEMORY[0x1E4F1EEC0];
  *(void *)(inited + 152) = *MEMORY[0x1E4F1EEC0];
  *(void *)(inited + 184) = a8;
  unint64_t v25 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 160));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a8 - 8) + 16))(v25, a4, a8);
  id v26 = v18;
  id v27 = v20;
  id v28 = v22;
  id v29 = v24;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  uint64_t result = swift_bridgeObjectRelease();
  *a9 = isa;
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t static CMFormatDescriptionRef.Extensions.Value.cleanAperture(width:height:horizontalOffet:verticalOffset:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, Class *a9@<X8>)
{
  double v13 = (double)a1 / (double)a2;
  double v14 = (double)a3 / (double)a4;
  double v15 = (double)a5 / (double)a6;
  double v16 = (double)a7 / (double)a8;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1BE2261B0;
  uint64_t v42 = (void *)*MEMORY[0x1E4F1EED0];
  *(void *)(inited + 32) = *MEMORY[0x1E4F1EED0];
  uint64_t v18 = MEMORY[0x1E4FBB3D0];
  *(double *)(inited + 40) = v13;
  unint64_t v41 = (void *)*MEMORY[0x1E4F1EEA0];
  uint64_t v19 = *MEMORY[0x1E4F1EEA0];
  *(void *)(inited + 64) = v18;
  *(void *)(inited + 72) = v19;
  *(double *)(inited + 80) = v14;
  char v20 = (void *)*MEMORY[0x1E4F1EEB0];
  *(void *)(inited + 104) = v18;
  *(void *)(inited + 112) = v20;
  *(double *)(inited + 120) = v15;
  char v21 = (void *)*MEMORY[0x1E4F1EEC0];
  *(void *)(inited + 144) = v18;
  *(void *)(inited + 152) = v21;
  *(double *)(inited + 160) = v16;
  uint64_t v22 = (void *)*MEMORY[0x1E4F1EED8];
  *(void *)(inited + 184) = v18;
  *(void *)(inited + 192) = v22;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Int>);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_1BE2261C0;
  *(void *)(v23 + 32) = a1;
  *(void *)(v23 + 40) = a2;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int]);
  *(void *)(inited + 200) = v23;
  unint64_t v25 = (void *)*MEMORY[0x1E4F1EEA8];
  *(void *)(inited + 224) = v24;
  *(void *)(inited + 232) = v25;
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_1BE2261C0;
  *(void *)(v26 + 32) = a3;
  *(void *)(v26 + 40) = a4;
  *(void *)(inited + 240) = v26;
  id v27 = (void *)*MEMORY[0x1E4F1EEB8];
  *(void *)(inited + 264) = v24;
  *(void *)(inited + 272) = v27;
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = xmmword_1BE2261C0;
  *(void *)(v28 + 32) = a5;
  *(void *)(v28 + 40) = a6;
  *(void *)(inited + 280) = v28;
  id v29 = (void *)*MEMORY[0x1E4F1EEC8];
  *(void *)(inited + 304) = v24;
  *(void *)(inited + 312) = v29;
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_1BE2261C0;
  *(void *)(v30 + 32) = a7;
  *(void *)(v30 + 40) = a8;
  *(void *)(inited + 344) = v24;
  *(void *)(inited + 320) = v30;
  id v31 = v42;
  id v32 = v41;
  id v33 = v20;
  id v34 = v21;
  id v35 = v22;
  id v36 = v25;
  id v37 = v27;
  id v38 = v29;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  uint64_t result = swift_bridgeObjectRelease();
  *a9 = isa;
  return result;
}

uint64_t (*CMFormatDescriptionRef.Extensions.Value.FieldDetail.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

id one-time initialization function for temporalTopFirst()
{
  static CMFormatDescriptionRef.Extensions.Value.FieldDetail.temporalTopFirst = *MEMORY[0x1E4F1EE88];
  return (id)static CMFormatDescriptionRef.Extensions.Value.FieldDetail.temporalTopFirst;
}

id static CMFormatDescriptionRef.Extensions.Value.FieldDetail.temporalTopFirst.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for temporalTopFirst, (void **)&static CMFormatDescriptionRef.Extensions.Value.FieldDetail.temporalTopFirst, a1);
}

id one-time initialization function for temporalBottomFirst()
{
  static CMFormatDescriptionRef.Extensions.Value.FieldDetail.temporalBottomFirst = *MEMORY[0x1E4F1EE80];
  return (id)static CMFormatDescriptionRef.Extensions.Value.FieldDetail.temporalBottomFirst;
}

id static CMFormatDescriptionRef.Extensions.Value.FieldDetail.temporalBottomFirst.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for temporalBottomFirst, (void **)&static CMFormatDescriptionRef.Extensions.Value.FieldDetail.temporalBottomFirst, a1);
}

id one-time initialization function for spatialFirstLineEarly()
{
  static CMFormatDescriptionRef.Extensions.Value.FieldDetail.spatialFirstLineEarly = *MEMORY[0x1E4F1EE70];
  return (id)static CMFormatDescriptionRef.Extensions.Value.FieldDetail.spatialFirstLineEarly;
}

id static CMFormatDescriptionRef.Extensions.Value.FieldDetail.spatialFirstLineEarly.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for spatialFirstLineEarly, (void **)&static CMFormatDescriptionRef.Extensions.Value.FieldDetail.spatialFirstLineEarly, a1);
}

id one-time initialization function for spatialFirstLineLate()
{
  static CMFormatDescriptionRef.Extensions.Value.FieldDetail.spatialFirstLineLate = *MEMORY[0x1E4F1EE78];
  return (id)static CMFormatDescriptionRef.Extensions.Value.FieldDetail.spatialFirstLineLate;
}

id static CMFormatDescriptionRef.Extensions.Value.FieldDetail.spatialFirstLineLate.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for spatialFirstLineLate, (void **)&static CMFormatDescriptionRef.Extensions.Value.FieldDetail.spatialFirstLineLate, a1);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CMFormatDescriptionRef.Extensions.Key()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)();
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
  id v2 = v1;
  _CFObject.hash(into:)();

  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance CMFormatDescriptionRef.Extensions.Key()
{
  uint64_t v1 = *v0;
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
  id v2 = v1;
  _CFObject.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CMFormatDescriptionRef.Extensions.Key()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)();
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
  id v2 = v1;
  _CFObject.hash(into:)();

  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance CMFormatDescriptionRef.Extensions.Key(void **a1, void **a2)
{
  id v2 = *a1;
  unsigned __int8 v3 = *a2;
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
  id v4 = v2;
  id v5 = v3;
  char v6 = static _CFObject.== infix(_:_:)();

  return v6 & 1;
}

id static CMFormatDescriptionRef.Extensions.Value.fieldDetail(_:)@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  id v2 = *a1;
  *a2 = v2;
  return v2;
}

uint64_t static CMFormatDescriptionRef.Extensions.Value.pixelAspectRatio<A, B>(horizontalSpacing:verticalSpacing:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, Class *a5@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1BE2261C0;
  Swift::String v11 = (void *)*MEMORY[0x1E4F1EEE0];
  *(void *)(inited + 32) = *MEMORY[0x1E4F1EEE0];
  *(void *)(inited + 64) = a3;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 40));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))(boxed_opaque_existential_0, a1, a3);
  double v13 = (void *)*MEMORY[0x1E4F1EEE8];
  *(void *)(inited + 72) = *MEMORY[0x1E4F1EEE8];
  *(void *)(inited + 104) = a4;
  double v14 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(inited + 80));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 16))(v14, a2, a4);
  id v15 = v11;
  id v16 = v13;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  uint64_t result = swift_bridgeObjectRelease();
  *a5 = isa;
  return result;
}

uint64_t (*CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

id one-time initialization function for itu_R_709_2()
{
  static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.itu_R_709_2 = *MEMORY[0x1E4F1ECF0];
  return (id)static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.itu_R_709_2;
}

{
  static CMFormatDescriptionRef.Extensions.Value.TransferFunction.itu_R_709_2 = *MEMORY[0x1E4F1EF00];
  return (id)static CMFormatDescriptionRef.Extensions.Value.TransferFunction.itu_R_709_2;
}

{
  static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.itu_R_709_2 = *MEMORY[0x1E4F1EF50];
  return (id)static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.itu_R_709_2;
}

id static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.itu_R_709_2.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for itu_R_709_2, (void **)&static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.itu_R_709_2, a1);
}

id one-time initialization function for ebu_3213()
{
  static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.ebu_3213 = *MEMORY[0x1E4F1ECE0];
  return (id)static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.ebu_3213;
}

id static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.ebu_3213.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for ebu_3213, (void **)&static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.ebu_3213, a1);
}

id one-time initialization function for smpte_C()
{
  static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.smpte_C = *MEMORY[0x1E4F1ED08];
  return (id)static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.smpte_C;
}

id static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.smpte_C.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for smpte_C, (void **)&static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.smpte_C, a1);
}

id one-time initialization function for dci_P3()
{
  static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.dci_P3 = *MEMORY[0x1E4F1ECD8];
  return (id)static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.dci_P3;
}

id static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.dci_P3.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for dci_P3, (void **)&static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.dci_P3, a1);
}

id one-time initialization function for p3_D65()
{
  static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.p3_D65 = *MEMORY[0x1E4F1ED00];
  return (id)static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.p3_D65;
}

id static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.p3_D65.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for p3_D65, (void **)&static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.p3_D65, a1);
}

id one-time initialization function for itu_R_2020()
{
  static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.itu_R_2020 = *MEMORY[0x1E4F1ECE8];
  return (id)static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.itu_R_2020;
}

{
  static CMFormatDescriptionRef.Extensions.Value.TransferFunction.itu_R_2020 = *MEMORY[0x1E4F1EEF0];
  return (id)static CMFormatDescriptionRef.Extensions.Value.TransferFunction.itu_R_2020;
}

{
  static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.itu_R_2020 = *MEMORY[0x1E4F1EF40];
  return (id)static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.itu_R_2020;
}

id static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.itu_R_2020.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for itu_R_2020, (void **)&static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.itu_R_2020, a1);
}

id one-time initialization function for p22()
{
  static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.p22 = *MEMORY[0x1E4F1ECF8];
  return (id)static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.p22;
}

id static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.p22.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for p22, (void **)&static CMFormatDescriptionRef.Extensions.Value.ColorPrimaries.p22, a1);
}

uint64_t (*CMFormatDescriptionRef.Extensions.Value.TransferFunction.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

id static CMFormatDescriptionRef.Extensions.Value.TransferFunction.itu_R_709_2.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for itu_R_709_2, (void **)&static CMFormatDescriptionRef.Extensions.Value.TransferFunction.itu_R_709_2, a1);
}

id one-time initialization function for smpte_240M_1995()
{
  static CMFormatDescriptionRef.Extensions.Value.TransferFunction.smpte_240M_1995 = *MEMORY[0x1E4F1EF10];
  return (id)static CMFormatDescriptionRef.Extensions.Value.TransferFunction.smpte_240M_1995;
}

id static CMFormatDescriptionRef.Extensions.Value.TransferFunction.smpte_240M_1995.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for smpte_240M_1995, (void **)&static CMFormatDescriptionRef.Extensions.Value.TransferFunction.smpte_240M_1995, a1);
}

id one-time initialization function for useGamma()
{
  static CMFormatDescriptionRef.Extensions.Value.TransferFunction.useGamma = *MEMORY[0x1E4F1EF28];
  return (id)static CMFormatDescriptionRef.Extensions.Value.TransferFunction.useGamma;
}

id static CMFormatDescriptionRef.Extensions.Value.TransferFunction.useGamma.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for useGamma, (void **)&static CMFormatDescriptionRef.Extensions.Value.TransferFunction.useGamma, a1);
}

id static CMFormatDescriptionRef.Extensions.Value.TransferFunction.itu_R_2020.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for itu_R_2020, (void **)&static CMFormatDescriptionRef.Extensions.Value.TransferFunction.itu_R_2020, a1);
}

id one-time initialization function for smpte_ST_428_1()
{
  static CMFormatDescriptionRef.Extensions.Value.TransferFunction.smpte_ST_428_1 = *MEMORY[0x1E4F1EF20];
  return (id)static CMFormatDescriptionRef.Extensions.Value.TransferFunction.smpte_ST_428_1;
}

id static CMFormatDescriptionRef.Extensions.Value.TransferFunction.smpte_ST_428_1.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for smpte_ST_428_1, (void **)&static CMFormatDescriptionRef.Extensions.Value.TransferFunction.smpte_ST_428_1, a1);
}

id one-time initialization function for smpte_ST_2084_PQ()
{
  static CMFormatDescriptionRef.Extensions.Value.TransferFunction.smpte_ST_2084_PQ = *MEMORY[0x1E4F1EF18];
  return (id)static CMFormatDescriptionRef.Extensions.Value.TransferFunction.smpte_ST_2084_PQ;
}

id static CMFormatDescriptionRef.Extensions.Value.TransferFunction.smpte_ST_2084_PQ.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for smpte_ST_2084_PQ, (void **)&static CMFormatDescriptionRef.Extensions.Value.TransferFunction.smpte_ST_2084_PQ, a1);
}

id one-time initialization function for itu_R_2100_HLG()
{
  static CMFormatDescriptionRef.Extensions.Value.TransferFunction.itu_R_2100_HLG = *MEMORY[0x1E4F1EEF8];
  return (id)static CMFormatDescriptionRef.Extensions.Value.TransferFunction.itu_R_2100_HLG;
}

id static CMFormatDescriptionRef.Extensions.Value.TransferFunction.itu_R_2100_HLG.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for itu_R_2100_HLG, (void **)&static CMFormatDescriptionRef.Extensions.Value.TransferFunction.itu_R_2100_HLG, a1);
}

id one-time initialization function for linear()
{
  static CMFormatDescriptionRef.Extensions.Value.TransferFunction.linear = *MEMORY[0x1E4F1EF08];
  return (id)static CMFormatDescriptionRef.Extensions.Value.TransferFunction.linear;
}

id static CMFormatDescriptionRef.Extensions.Value.TransferFunction.linear.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for linear, (void **)&static CMFormatDescriptionRef.Extensions.Value.TransferFunction.linear, a1);
}

id one-time initialization function for sRGB()
{
  static CMFormatDescriptionRef.Extensions.Value.TransferFunction.sRGB = *MEMORY[0x1E4F1EF30];
  return (id)static CMFormatDescriptionRef.Extensions.Value.TransferFunction.sRGB;
}

id static CMFormatDescriptionRef.Extensions.Value.TransferFunction.sRGB.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for sRGB, (void **)&static CMFormatDescriptionRef.Extensions.Value.TransferFunction.sRGB, a1);
}

uint64_t (*CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

id static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.itu_R_709_2.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for itu_R_709_2, (void **)&static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.itu_R_709_2, a1);
}

id one-time initialization function for itu_R_601_4()
{
  static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.itu_R_601_4 = *MEMORY[0x1E4F1EF48];
  return (id)static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.itu_R_601_4;
}

id static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.itu_R_601_4.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for itu_R_601_4, (void **)&static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.itu_R_601_4, a1);
}

id one-time initialization function for smpted_240M_1995()
{
  static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.smpted_240M_1995 = *MEMORY[0x1E4F1EF58];
  return (id)static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.smpted_240M_1995;
}

id static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.smpted_240M_1995.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for smpted_240M_1995, (void **)&static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.smpted_240M_1995, a1);
}

id static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.itu_R_2020.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for itu_R_2020, (void **)&static CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix.itu_R_2020, a1);
}

uint64_t (*CMFormatDescriptionRef.Extensions.Value.ChromaLocation.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

id one-time initialization function for left()
{
  static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.left = *MEMORY[0x1E4F1ECC0];
  return (id)static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.left;
}

id static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.left.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for left, (void **)&static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.left, a1);
}

id one-time initialization function for center()
{
  static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.center = *MEMORY[0x1E4F1ECB0];
  return (id)static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.center;
}

id static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.center.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for center, (void **)&static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.center, a1);
}

id one-time initialization function for topLeft()
{
  static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.topLeft = *MEMORY[0x1E4F1ECD0];
  return (id)static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.topLeft;
}

id static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.topLeft.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for topLeft, (void **)&static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.topLeft, a1);
}

id one-time initialization function for top()
{
  static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.top = *MEMORY[0x1E4F1ECC8];
  return (id)static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.top;
}

id static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.top.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for top, (void **)&static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.top, a1);
}

id one-time initialization function for bottomLeft()
{
  static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.bottomLeft = *MEMORY[0x1E4F1ECA8];
  return (id)static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.bottomLeft;
}

id static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.bottomLeft.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for bottomLeft, (void **)&static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.bottomLeft, a1);
}

id one-time initialization function for bottom()
{
  static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.bottom = *MEMORY[0x1E4F1ECA0];
  return (id)static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.bottom;
}

id static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.bottom.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for bottom, (void **)&static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.bottom, a1);
}

id one-time initialization function for dv420()
{
  static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.dv420 = *MEMORY[0x1E4F1ECB8];
  return (id)static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.dv420;
}

id static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.dv420.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for dv420, (void **)&static CMFormatDescriptionRef.Extensions.Value.ChromaLocation.dv420, a1);
}

uint64_t CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.rawValue.getter()
{
  return *v0;
}

uint64_t (*CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.hdv_720p30.getter(_DWORD *a1@<X8>)
{
  *a1 = 1751414321;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.hdv_1080i60.getter(_DWORD *a1@<X8>)
{
  *a1 = 1751414322;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.hdv_1080i50.getter(_DWORD *a1@<X8>)
{
  *a1 = 1751414323;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.hdv_720p24.getter(_DWORD *a1@<X8>)
{
  *a1 = 1751414324;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.hdv_720p25.getter(_DWORD *a1@<X8>)
{
  *a1 = 1751414325;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.hdv_1080p24.getter(_DWORD *a1@<X8>)
{
  *a1 = 1751414326;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.hdv_1080p25.getter(_DWORD *a1@<X8>)
{
  *a1 = 1751414327;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.hdv_1080p30.getter(_DWORD *a1@<X8>)
{
  *a1 = 1751414328;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.hdv_720p60.getter(_DWORD *a1@<X8>)
{
  *a1 = 1751414329;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.hdv_720p50.getter(_DWORD *a1@<X8>)
{
  *a1 = 1751414369;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD_1080i60_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849778;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD_1080i50_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849779;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD_1080p24_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849782;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD_1080p25_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849783;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD_1080p30_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849784;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_EX_720p24_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849780;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_EX_720p25_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849781;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_EX_720p30_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849777;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_EX_720p50_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849825;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_EX_720p60_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849785;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_EX_1080i60_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849826;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_EX_1080i50_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849827;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_EX_1080p24_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849828;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_EX_1080p25_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849829;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_EX_1080p30_VBR35.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019849830;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD422_720p50_CBR50.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019833185;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD422_720p60_CBR50.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019833145;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD422_1080i60_CBR50.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019833186;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD422_1080i50_CBR50.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019833187;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD422_1080p24_CBR50.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019833188;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD422_1080p25_CBR50.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019833189;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD422_1080p30_CBR50.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019833190;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD_540p.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019846244;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD422_540p.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019846194;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD422_720p24_CBR50.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019833140;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD422_720p25_CBR50.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019833141;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xdcam_HD422_720p30_CBR50.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019833137;
}

void static CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile.xf.getter(_DWORD *a1@<X8>)
{
  *a1 = 2019981873;
}

NSNumber static CMFormatDescriptionRef.Extensions.Value.mpeg2VideoProfile(_:)@<X0>(NSNumber *a1@<X8>)
{
  result.super.super.Class isa = UInt32._bridgeToObjectiveC()().super.super.isa;
  a1->super.super.Class isa = result.super.super.isa;
  return result;
}

uint64_t (*CMFormatDescriptionRef.Extensions.Value.Vendor.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

id one-time initialization function for apple()
{
  static CMFormatDescriptionRef.Extensions.Value.Vendor.apple = *MEMORY[0x1E4F1EF38];
  return (id)static CMFormatDescriptionRef.Extensions.Value.Vendor.apple;
}

id static CMFormatDescriptionRef.Extensions.Value.Vendor.apple.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for apple, (void **)&static CMFormatDescriptionRef.Extensions.Value.Vendor.apple, a1);
}

uint64_t (*CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

id one-time initialization function for straightAlpha()
{
  static CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode.straightAlpha = *MEMORY[0x1E4F1EC98];
  return (id)static CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode.straightAlpha;
}

id static CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode.straightAlpha.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for straightAlpha, (void **)&static CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode.straightAlpha, a1);
}

id one-time initialization function for premultipliedAlpha()
{
  static CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode.premultipliedAlpha = *MEMORY[0x1E4F1EC90];
  return (id)static CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode.premultipliedAlpha;
}

id static CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode.premultipliedAlpha.getter@<X0>(void **a1@<X8>)
{
  return static CMSampleBufferRef.PerSampleAttachmentsDictionary.Key.notSync.getter(&one-time initialization token for premultipliedAlpha, (void **)&static CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode.premultipliedAlpha, a1);
}

uint64_t static CMFormatDescriptionRef.Extensions.Value.qtTextColor(red:green:blue:alpha:)@<X0>(Class *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, CGFloat)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1BE2261D0;
  char v9 = (void *)*MEMORY[0x1E4F1F448];
  *(void *)(inited + 32) = *MEMORY[0x1E4F1F448];
  *(double *)(inited + 40) = a2 * 65535.0;
  uint64_t v10 = (void *)*MEMORY[0x1E4F1F440];
  *(void *)(inited + 48) = *MEMORY[0x1E4F1F440];
  *(double *)(inited + 56) = a3 * 65535.0;
  Swift::String v11 = (void *)*MEMORY[0x1E4F1F438];
  *(void *)(inited + 64) = *MEMORY[0x1E4F1F438];
  *(double *)(inited + 72) = a4 * 65535.0;
  id v12 = v9;
  id v13 = v10;
  id v14 = v11;
  unint64_t v15 = specialized Dictionary.init(dictionaryLiteral:)(inited);
  specialized _dictionaryUpCast<A, B, C, D>(_:)(v15);
  swift_bridgeObjectRelease();
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = isa;
  return result;
}

uint64_t specialized _dictionaryUpCast<A, B, C, D>(_:)(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, Any>);
    uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = MEMORY[0x1E4FBC868];
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v10 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v11 = v10 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v12 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v12 >= v26) {
      goto LABEL_37;
    }
    unint64_t v13 = *(void *)(v27 + 8 * v12);
    int64_t v14 = v8 + 1;
    if (!v13)
    {
      int64_t v14 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_37;
      }
      unint64_t v13 = *(void *)(v27 + 8 * v14);
      if (!v13)
      {
        int64_t v14 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_37;
        }
        unint64_t v13 = *(void *)(v27 + 8 * v14);
        if (!v13)
        {
          int64_t v14 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_37;
          }
          unint64_t v13 = *(void *)(v27 + 8 * v14);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
    int64_t v8 = v14;
LABEL_28:
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8 * v11);
    *(void *)&v30[0] = *(void *)(*(void *)(a1 + 48) + 8 * v11);
    *(void *)&v29[0] = v16;
    id v17 = *(id *)&v30[0];
    swift_dynamicCast();
    uint64_t v18 = *(void *)&v30[0];
    outlined init with take of Any((_OWORD *)((char *)v30 + 8), v28);
    outlined init with take of Any(v28, v30);
    outlined init with take of Any(v30, v29);
    Hasher.init(_seed:)();
    type metadata accessor for CFStringRef(0);
    _sSo11CFStringRefaABSHSCWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
    _CFObject.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v19 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    *(void *)(*(void *)(v2 + 48) + 8 * v9) = v18;
    uint64_t result = (uint64_t)outlined init with take of Any(v29, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v15 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    outlined consume of [CMSampleBufferRef.PerSampleAttachmentsDictionary.Key : Any].Iterator._Variant();
    return v2;
  }
  unint64_t v13 = *(void *)(v27 + 8 * v15);
  if (v13)
  {
    int64_t v14 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v14 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v14 >= v26) {
      goto LABEL_37;
    }
    unint64_t v13 = *(void *)(v27 + 8 * v14);
    ++v15;
    if (v13) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t static CMFormatDescriptionRef.Extensions.Value.mobile3GPPTextColor(red:green:blue:alpha:)@<X0>(Class *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, CGFloat)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1BE2261A0;
  unint64_t v11 = (void *)*MEMORY[0x1E4F1F448];
  *(void *)(inited + 32) = *MEMORY[0x1E4F1F448];
  *(double *)(inited + 40) = a2 * 255.0;
  int64_t v12 = (void *)*MEMORY[0x1E4F1F440];
  *(void *)(inited + 48) = *MEMORY[0x1E4F1F440];
  *(double *)(inited + 56) = a3 * 255.0;
  unint64_t v13 = (void *)*MEMORY[0x1E4F1F438];
  *(void *)(inited + 64) = *MEMORY[0x1E4F1F438];
  *(double *)(inited + 72) = a4 * 255.0;
  int64_t v14 = (void *)*MEMORY[0x1E4F1F430];
  *(void *)(inited + 80) = *MEMORY[0x1E4F1F430];
  *(double *)(inited + 88) = a5 * 255.0;
  id v15 = v11;
  id v16 = v12;
  id v17 = v13;
  id v18 = v14;
  unint64_t v19 = specialized Dictionary.init(dictionaryLiteral:)(inited);
  specialized _dictionaryUpCast<A, B, C, D>(_:)(v19);
  swift_bridgeObjectRelease();
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = isa;
  return result;
}

uint64_t static CMFormatDescriptionRef.Extensions.Value.fontTable(_:)@<X0>(uint64_t a1@<X0>, Class *a2@<X8>)
{
  uint64_t v7 = MEMORY[0x1E4FBC868];
  Swift::Int v4 = *(void *)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CFStringRef : Any]);
  Dictionary.reserveCapacity(_:)(v4);
  specialized Sequence.forEach(_:)(a1, &v7);
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
  swift_bridgeObjectRetain();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  uint64_t result = swift_bridgeObjectRelease_n();
  *a2 = isa;
  return result;
}

uint64_t specialized Sequence.forEach(_:)(uint64_t a1, void *a2)
{
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v38 = (unint64_t)(v4 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v7 << 6);
    }
    else
    {
      int64_t v11 = v7 + 1;
      if (__OFADD__(v7, 1)) {
        goto LABEL_38;
      }
      if (v11 >= v38) {
        return swift_release();
      }
      unint64_t v12 = *(void *)(v37 + 8 * v11);
      ++v7;
      if (!v12)
      {
        int64_t v7 = v11 + 1;
        if (v11 + 1 >= v38) {
          return swift_release();
        }
        unint64_t v12 = *(void *)(v37 + 8 * v7);
        if (!v12)
        {
          int64_t v7 = v11 + 2;
          if (v11 + 2 >= v38) {
            return swift_release();
          }
          unint64_t v12 = *(void *)(v37 + 8 * v7);
          if (!v12)
          {
            int64_t v7 = v11 + 3;
            if (v11 + 3 >= v38) {
              return swift_release();
            }
            unint64_t v12 = *(void *)(v37 + 8 * v7);
            if (!v12)
            {
              int64_t v13 = v11 + 4;
              if (v13 >= v38) {
                return swift_release();
              }
              unint64_t v12 = *(void *)(v37 + 8 * v13);
              if (!v12)
              {
                while (1)
                {
                  int64_t v7 = v13 + 1;
                  if (__OFADD__(v13, 1)) {
                    goto LABEL_39;
                  }
                  if (v7 >= v38) {
                    return swift_release();
                  }
                  unint64_t v12 = *(void *)(v37 + 8 * v7);
                  ++v13;
                  if (v12) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v7 = v13;
            }
          }
        }
      }
LABEL_23:
      unint64_t v6 = (v12 - 1) & v12;
      unint64_t v10 = __clz(__rbit64(v12)) + (v7 << 6);
    }
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8 * v10);
    id v15 = (uint64_t *)(*(void *)(a1 + 56) + 16 * v10);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_1BE225570;
    *(void *)(v18 + 56) = MEMORY[0x1E4FBB550];
    *(void *)(v18 + 64) = MEMORY[0x1E4FBB5C8];
    *(void *)(v18 + 32) = v14;
    swift_bridgeObjectRetain();
    uint64_t v19 = String.init(format:_:)();
    unint64_t v20 = (void *)MEMORY[0x1C188D3B0](v19);
    swift_bridgeObjectRelease();
    uint64_t v41 = MEMORY[0x1E4FBB1A0];
    *(void *)&long long v40 = v17;
    *((void *)&v40 + 1) = v16;
    outlined init with take of Any(&v40, v39);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v42 = (void *)*a2;
    char v22 = v42;
    *a2 = 0x8000000000000000;
    unint64_t v24 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v20);
    uint64_t v25 = v22[2];
    BOOL v26 = (v23 & 1) == 0;
    uint64_t v27 = v25 + v26;
    if (__OFADD__(v25, v26)) {
      break;
    }
    char v28 = v23;
    if (v22[3] >= v27)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        id v31 = v42;
        if (v23) {
          goto LABEL_4;
        }
      }
      else
      {
        specialized _NativeDictionary.copy()();
        id v31 = v42;
        if (v28) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v27, isUniquelyReferenced_nonNull_native);
      unint64_t v29 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v20);
      if ((v28 & 1) != (v30 & 1)) {
        goto LABEL_40;
      }
      unint64_t v24 = v29;
      id v31 = v42;
      if (v28)
      {
LABEL_4:
        int64_t v8 = (_OWORD *)(v31[7] + 32 * v24);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
        outlined init with take of Any(v39, v8);
        goto LABEL_5;
      }
    }
    v31[(v24 >> 6) + 8] |= 1 << v24;
    *(void *)(v31[6] + 8 * v24) = v20;
    outlined init with take of Any(v39, (_OWORD *)(v31[7] + 32 * v24));
    uint64_t v32 = v31[2];
    BOOL v33 = __OFADD__(v32, 1);
    uint64_t v34 = v32 + 1;
    if (v33) {
      goto LABEL_37;
    }
    v31[2] = v34;
    id v35 = v20;
LABEL_5:
    *a2 = v31;

    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  type metadata accessor for CFStringRef(0);
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t CMFormatDescriptionRef.Extensions.Value.FontFace.rawValue.getter()
{
  return *v0;
}

uint64_t (*CMFormatDescriptionRef.Extensions.Value.FontFace.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

void static CMFormatDescriptionRef.Extensions.Value.FontFace.italic.getter(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

void static CMFormatDescriptionRef.Extensions.Value.FontFace.underline.getter(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

void one-time initialization function for all()
{
  int v0 = byte_1F18C3199;
  if ((byte_1F18C3199 & ~byte_1F18C3198) == 0) {
    int v0 = 0;
  }
  int v1 = v0 | byte_1F18C3198;
  char v2 = byte_1F18C319A;
  if ((byte_1F18C319A & ~v1) == 0) {
    char v2 = 0;
  }
  static CMFormatDescriptionRef.Extensions.Value.FontFace.all = v2 | v1;
}

uint64_t static CMFormatDescriptionRef.Extensions.Value.FontFace.all.getter@<X0>(unsigned char *a1@<X8>)
{
  if (one-time initialization token for all != -1) {
    uint64_t result = swift_once();
  }
  *a1 = static CMFormatDescriptionRef.Extensions.Value.FontFace.all;
  return result;
}

unsigned char *protocol witness for OptionSet.init(rawValue:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void protocol witness for SetAlgebra.init() in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

unsigned char *protocol witness for SetAlgebra.union(_:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

unsigned char *protocol witness for SetAlgebra.intersection(_:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

unsigned char *protocol witness for SetAlgebra.symmetricDifference(_:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL protocol witness for SetAlgebra.insert(_:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(unsigned char *a1, unsigned __int8 *a2)
{
  int v3 = *a2;
  int v4 = *v2;
  if ((v4 & v3) != v3) {
    *char v2 = v4 | v3;
  }
  *a1 = v3;
  return (v4 & v3) != v3;
}

unsigned __int8 *protocol witness for SetAlgebra.remove(_:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace@<X0>(unsigned __int8 *result@<X0>, unsigned char *a2@<X8>)
{
  int v3 = *result;
  int v4 = *v2;
  int v5 = v4 & v3;
  if ((v4 & v3) != 0) {
    *char v2 = v4 & ~(_BYTE)v3;
  }
  *a2 = v5;
  a2[1] = v5 == 0;
  return result;
}

unsigned __int8 *protocol witness for SetAlgebra.update(with:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace@<X0>(unsigned __int8 *result@<X0>, unsigned char *a2@<X8>)
{
  int v3 = *result;
  int v4 = *v2;
  *char v2 = v4 | v3;
  int v5 = v4 & v3;
  *a2 = v5;
  a2[1] = v5 == 0;
  return result;
}

unsigned char *protocol witness for SetAlgebra.formUnion(_:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(unsigned char *result)
{
  *v1 |= *result;
  return result;
}

unsigned char *protocol witness for SetAlgebra.formIntersection(_:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(unsigned char *result)
{
  *v1 &= *result;
  return result;
}

unsigned char *protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(unsigned char *result)
{
  *v1 ^= *result;
  return result;
}

unsigned char *protocol witness for SetAlgebra.subtracting(_:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL protocol witness for SetAlgebra.isSubset(of:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(unsigned __int8 *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL protocol witness for SetAlgebra.isDisjoint(with:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(unsigned char *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL protocol witness for SetAlgebra.isSuperset(of:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(unsigned __int8 *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL protocol witness for SetAlgebra.isEmpty.getter in conformance CMFormatDescriptionRef.Extensions.Value.FontFace()
{
  return *v0 == 0;
}

unsigned char *protocol witness for SetAlgebra.subtract(_:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(unsigned char *result)
{
  *v1 &= ~*result;
  return result;
}

NSNumber protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance CMFormatDescriptionRef.Extensions.Value.FontFace()
{
  return UInt8._bridgeToObjectiveC()();
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(a1, a2, a3, a4, MEMORY[0x1E4F28158]);
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(a1, a2, a3, a4, MEMORY[0x1E4F28160]);
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = static UInt8._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  return result;
}

uint64_t static CMFormatDescriptionRef.Extensions.Value.qtTextDefaultStyle(startChar:height:ascent:localFontID:fontFace:fontSize:foregroundColor:defaultFontName:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X6>, uint64_t a8@<X7>, Class *a9@<X8>, uint64_t a10)
{
  char v15 = *a5;
  uint64_t v16 = *a7;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1BE226020;
  uint64_t v18 = (void *)*MEMORY[0x1E4F1F500];
  uint64_t v19 = MEMORY[0x1E4FBB550];
  unint64_t v20 = (void **)MEMORY[0x1E4F1F4F8];
  *(void *)(inited + 32) = *MEMORY[0x1E4F1F500];
  *(void *)(inited + 40) = a1;
  unint64_t v21 = *v20;
  *(void *)(inited + 64) = v19;
  *(void *)(inited + 72) = v21;
  char v22 = (void **)MEMORY[0x1E4F1F4C8];
  *(void *)(inited + 80) = a2;
  char v23 = *v22;
  *(void *)(inited + 104) = v19;
  *(void *)(inited + 112) = v23;
  unint64_t v24 = (void **)MEMORY[0x1E4F1F4D8];
  *(void *)(inited + 120) = a3;
  uint64_t v25 = *v24;
  *(void *)(inited + 144) = v19;
  *(void *)(inited + 152) = v25;
  BOOL v26 = (void **)MEMORY[0x1E4F1F4E0];
  *(void *)(inited + 160) = a4;
  uint64_t v27 = *v26;
  *(void *)(inited + 184) = v19;
  *(void *)(inited + 192) = v27;
  *(unsigned char *)(inited + 200) = v15;
  char v28 = (void *)*MEMORY[0x1E4F1F4E8];
  *(void *)(inited + 224) = &type metadata for CMFormatDescriptionRef.Extensions.Value.FontFace;
  *(void *)(inited + 232) = v28;
  *(void *)(inited + 240) = a6;
  unint64_t v29 = (void *)*MEMORY[0x1E4F1F4F0];
  *(void *)(inited + 264) = v19;
  *(void *)(inited + 272) = v29;
  *(void *)(inited + 304) = swift_getObjectType();
  *(void *)(inited + 280) = v16;
  id v30 = v18;
  id v31 = v21;
  id v32 = v23;
  id v33 = v25;
  id v34 = v27;
  id v35 = v28;
  id v36 = v29;
  swift_unknownObjectRetain();
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  if (a10)
  {
    uint64_t v37 = (void *)*MEMORY[0x1E4F1F458];
    uint64_t v46 = MEMORY[0x1E4FBB1A0];
    *(void *)&long long v45 = a8;
    *((void *)&v45 + 1) = a10;
    outlined init with take of Any(&v45, v44);
    swift_bridgeObjectRetain();
    id v38 = v37;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v44, v38, isUniquelyReferenced_nonNull_native);

    swift_bridgeObjectRelease();
  }
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  uint64_t result = swift_bridgeObjectRelease();
  *a9 = isa;
  return result;
}

uint64_t static CMFormatDescriptionRef.Extensions.Value.mobile3GPPTextDefaultStyle(startChar:endChar:localFontID:fontFace:fontSize:foregroundColor:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X5>, Class *a7@<X8>)
{
  char v12 = *a4;
  uint64_t v13 = *a6;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1BE2261E0;
  char v15 = (void *)*MEMORY[0x1E4F1F500];
  uint64_t v16 = MEMORY[0x1E4FBB550];
  uint64_t v17 = (void **)MEMORY[0x1E4F1F4D0];
  *(void *)(inited + 32) = *MEMORY[0x1E4F1F500];
  *(void *)(inited + 40) = a1;
  uint64_t v18 = *v17;
  *(void *)(inited + 64) = v16;
  *(void *)(inited + 72) = v18;
  uint64_t v19 = (void **)MEMORY[0x1E4F1F4D8];
  *(void *)(inited + 80) = a2;
  unint64_t v20 = *v19;
  *(void *)(inited + 104) = v16;
  *(void *)(inited + 112) = v20;
  unint64_t v21 = (void **)MEMORY[0x1E4F1F4E0];
  *(void *)(inited + 120) = a3;
  char v22 = *v21;
  *(void *)(inited + 144) = v16;
  *(void *)(inited + 152) = v22;
  *(unsigned char *)(inited + 160) = v12;
  char v23 = (void *)*MEMORY[0x1E4F1F4E8];
  *(void *)(inited + 184) = &type metadata for CMFormatDescriptionRef.Extensions.Value.FontFace;
  *(void *)(inited + 192) = v23;
  *(void *)(inited + 200) = a5;
  unint64_t v24 = (void *)*MEMORY[0x1E4F1F4F0];
  *(void *)(inited + 224) = v16;
  *(void *)(inited + 232) = v24;
  *(void *)(inited + 264) = swift_getObjectType();
  *(void *)(inited + 240) = v13;
  id v25 = v15;
  id v26 = v18;
  id v27 = v20;
  id v28 = v22;
  id v29 = v23;
  id v30 = v24;
  swift_unknownObjectRetain();
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  uint64_t result = swift_bridgeObjectRelease();
  *a7 = isa;
  return result;
}

uint64_t static CMFormatDescriptionRef.Extensions.Value.textRect(top:left:bottom:right:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, Class *a5@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Any)>);
  uint64_t inited = swift_initStackObject();
  int64_t v11 = (void *)*MEMORY[0x1E4F1F4B8];
  uint64_t v12 = MEMORY[0x1E4FBB550];
  *(void *)(inited + 32) = *MEMORY[0x1E4F1F4B8];
  *(void *)(inited + 40) = a1;
  uint64_t v13 = (void **)MEMORY[0x1E4F1F4A8];
  *(_OWORD *)(inited + 16) = xmmword_1BE2261A0;
  uint64_t v14 = *v13;
  *(void *)(inited + 80) = a2;
  char v15 = (void **)MEMORY[0x1E4F1F4A0];
  *(void *)(inited + 64) = v12;
  *(void *)(inited + 72) = v14;
  uint64_t v16 = *v15;
  *(void *)(inited + 120) = a3;
  uint64_t v17 = (void **)MEMORY[0x1E4F1F4B0];
  *(void *)(inited + 104) = v12;
  *(void *)(inited + 112) = v16;
  uint64_t v18 = *v17;
  *(void *)(inited + 144) = v12;
  *(void *)(inited + 152) = v18;
  *(void *)(inited + 184) = v12;
  *(void *)(inited + 160) = a4;
  id v19 = v11;
  id v20 = v14;
  id v21 = v16;
  id v22 = v18;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  uint64_t result = swift_bridgeObjectRelease();
  *a5 = isa;
  return result;
}

uint64_t CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags.rawValue.getter()
{
  return *v0;
}

uint64_t (*CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

void static CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags.scrollOut.getter(_DWORD *a1@<X8>)
{
  *a1 = 64;
}

void static CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags.scrollDirectionMask.getter(_DWORD *a1@<X8>)
{
  *a1 = 384;
}

void static CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags.scrollDirection_bottomToTop.getter(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

void static CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags.scrollDirection_rightToLeft.getter(_DWORD *a1@<X8>)
{
  *a1 = 128;
}

void static CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags.scrollDirection_topToBottom.getter(_DWORD *a1@<X8>)
{
  *a1 = 256;
}

void static CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags.continuousKaraoke.getter(_DWORD *a1@<X8>)
{
  *a1 = 2048;
}

void static CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags.writeTextVertically.getter(_DWORD *a1@<X8>)
{
  *a1 = 0x20000;
}

void static CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags.fillTextRegion.getter(_DWORD *a1@<X8>)
{
  *a1 = 0x40000;
}

void static CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags.obeySubtitleFormatting.getter(_DWORD *a1@<X8>)
{
  *a1 = 0x20000000;
}

void static CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags.forcedSubtitlesPresent.getter(_DWORD *a1@<X8>)
{
  *a1 = 0x40000000;
}

void static CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags.allSubtitlesForced.getter(_DWORD *a1@<X8>)
{
  *a1 = 0x80000000;
}

void CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags.scrollDirection.getter(int *a1@<X8>)
{
  *a1 = *v1 & 0x180;
}

Class static CMFormatDescriptionRef.Extensions.Value.textDisplayFlags(_:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  int64_t v4 = 0;
  Class result = 0;
  uint64_t v6 = a1 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a1 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      unint64_t v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v12 = v11 | (v4 << 6);
      goto LABEL_5;
    }
    int64_t v13 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v13 >= v10) {
      goto LABEL_25;
    }
    unint64_t v14 = *(void *)(v6 + 8 * v13);
    ++v4;
    if (!v14)
    {
      int64_t v4 = v13 + 1;
      if (v13 + 1 >= v10) {
        goto LABEL_25;
      }
      unint64_t v14 = *(void *)(v6 + 8 * v4);
      if (!v14)
      {
        int64_t v4 = v13 + 2;
        if (v13 + 2 >= v10) {
          goto LABEL_25;
        }
        unint64_t v14 = *(void *)(v6 + 8 * v4);
        if (!v14)
        {
          int64_t v4 = v13 + 3;
          if (v13 + 3 >= v10) {
            goto LABEL_25;
          }
          unint64_t v14 = *(void *)(v6 + 8 * v4);
          if (!v14)
          {
            int64_t v4 = v13 + 4;
            if (v13 + 4 >= v10) {
              goto LABEL_25;
            }
            unint64_t v14 = *(void *)(v6 + 8 * v4);
            if (!v14) {
              break;
            }
          }
        }
      }
    }
LABEL_24:
    unint64_t v9 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v4 << 6);
LABEL_5:
    Class result = (Class)(*(_DWORD *)(*(void *)(a1 + 48) + 4 * v12) | result);
  }
  int64_t v15 = v13 + 5;
  if (v15 >= v10)
  {
LABEL_25:
    Class result = UInt32._bridgeToObjectiveC()().super.super.isa;
    *a2 = result;
    return result;
  }
  unint64_t v14 = *(void *)(v6 + 8 * v15);
  if (v14)
  {
    int64_t v4 = v15;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v4 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v4 >= v10) {
      goto LABEL_25;
    }
    unint64_t v14 = *(void *)(v6 + 8 * v4);
    ++v15;
    if (v14) {
      goto LABEL_24;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t CMFormatDescriptionRef.Extensions.Value.TextJustification.rawValue.getter()
{
  return *v0;
}

uint64_t CMFormatDescriptionRef.Extensions.Value.TextJustification.rawValue.setter(uint64_t result)
{
  *int v1 = result;
  return result;
}

uint64_t (*CMFormatDescriptionRef.Extensions.Value.TextJustification.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

uint64_t CMFormatDescriptionRef.Extensions.Value.TextJustification.init(rawValue:)@<X0>(uint64_t result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static CMFormatDescriptionRef.Extensions.Value.TextJustification.top.getter(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

void static CMFormatDescriptionRef.Extensions.Value.TextJustification.centered.getter(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

void static CMFormatDescriptionRef.Extensions.Value.TextJustification.right.getter(unsigned char *a1@<X8>)
{
  *a1 = -1;
}

unsigned __int8 *protocol witness for RawRepresentable.init(rawValue:) in conformance CMFormatDescriptionRef.Extensions.Value.TextJustification@<X0>(unsigned __int8 *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance CMFormatDescriptionRef.Extensions.Value.TextJustification(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

NSNumber protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance CMFormatDescriptionRef.Extensions.Value.TextJustification()
{
  return Int8._bridgeToObjectiveC()();
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance CMFormatDescriptionRef.Extensions.Value.TextJustification(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(a1, a2, a3, a4, MEMORY[0x1E4F28108]);
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, __int16 *))
{
  __int16 v7 = 256;
  uint64_t result = a5(a1, &v7);
  if ((v7 & 0x100) != 0)
  {
    __break(1u);
  }
  else
  {
    *a2 = v7;
    a2[1] = 0;
  }
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance CMFormatDescriptionRef.Extensions.Value.TextJustification(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(a1, a2, a3, a4, MEMORY[0x1E4F28110]);
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, __int16 *))
{
  __int16 v7 = 256;
  uint64_t result = a5(a1, &v7);
  if ((result & 1) == 0) {
    return result & 1;
  }
  if ((v7 & 0x100) == 0)
  {
    *a2 = v7;
    a2[1] = 0;
    return result & 1;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance CMFormatDescriptionRef.Extensions.Value.TextJustification@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = static Int8._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  return result;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CMFormatDescriptionRef.Extensions.Value.FontFace()
{
  Swift::UInt8 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance CMFormatDescriptionRef.Extensions.Value.TextJustification()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CMFormatDescriptionRef.Extensions.Value.FontFace()
{
  Swift::UInt8 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CMFormatDescriptionRef.Extensions.Value.TextJustification(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

NSNumber static CMFormatDescriptionRef.Extensions.Value.textJustification(_:)@<X0>(NSNumber *a1@<X8>)
{
  result.super.super.Class isa = Int8._bridgeToObjectiveC()().super.super.isa;
  a1->super.super.Class isa = result.super.super.isa;
  return result;
}

uint64_t static CMFormatDescriptionRef.Extensions.Value.sourceReferenceName(value:langCode:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, Class *a4@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(CFStringRef, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1BE2261C0;
  unint64_t v9 = (void *)*MEMORY[0x1E4F1F9D8];
  uint64_t v10 = MEMORY[0x1E4FBB1A0];
  *(void *)(inited + 32) = *MEMORY[0x1E4F1F9D8];
  *(void *)(inited + 40) = a1;
  *(void *)(inited + 48) = a2;
  unint64_t v11 = (void *)*MEMORY[0x1E4F1F9D0];
  *(void *)(inited + 64) = v10;
  *(void *)(inited + 72) = v11;
  *(void *)(inited + 104) = MEMORY[0x1E4FBB550];
  *(void *)(inited + 80) = a3;
  id v12 = v9;
  swift_bridgeObjectRetain();
  id v13 = v11;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  uint64_t result = swift_bridgeObjectRelease();
  *a4 = isa;
  return result;
}

void CMFormatDescriptionRef.Extensions.init()(void *a1@<X8>)
{
  *a1 = MEMORY[0x1E4FBC868];
}

uint64_t CMFormatDescriptionRef.Extensions.init(base:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = MEMORY[0x1E4FBC868];
  if (result) {
    uint64_t v2 = result;
  }
  *a2 = v2;
  return result;
}

void CMFormatDescriptionRef.Extensions.subscript.getter(void **a1@<X0>, uint64_t *a2@<X8>)
{
  int64_t v4 = *a1;
  uint64_t v5 = *v2;
  if ((v5 & 0xC000000000000001) != 0)
  {
    id v6 = v4;
    swift_bridgeObjectRetain();
    uint64_t v7 = __CocoaDictionary.lookup(_:)();
  }
  else
  {
    if (!*(void *)(v5 + 16))
    {
      uint64_t v7 = 0;
      goto LABEL_5;
    }
    id v8 = v4;
    swift_bridgeObjectRetain();
    unint64_t v9 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v8);
    if ((v10 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      uint64_t v7 = 0;
      goto LABEL_4;
    }
    uint64_t v7 = *(void *)(*(void *)(v5 + 56) + 8 * v9);
    swift_unknownObjectRetain();
  }
  swift_bridgeObjectRelease();
LABEL_4:

LABEL_5:
  *a2 = v7;
}

void key path getter for CMFormatDescriptionRef.Extensions.subscript(_:) : CMFormatDescriptionRef.Extensions(uint64_t *a1@<X0>, void **a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  swift_bridgeObjectRetain();
  id v6 = v5;
  uint64_t v7 = specialized Dictionary.subscript.getter(v6, v4);
  swift_bridgeObjectRelease();

  *a3 = v7;
}

void key path setter for CMFormatDescriptionRef.Extensions.subscript(_:) : CMFormatDescriptionRef.Extensions(uint64_t *a1, uint64_t a2, void **a3)
{
  int v3 = *a3;
  uint64_t v4 = *a1;
  if (*a1)
  {
    swift_unknownObjectRetain();
    id v6 = v3;
    specialized Dictionary._Variant.setValue(_:forKey:)(v4, v6);
  }
  else
  {
    id v5 = v3;
    specialized Dictionary._Variant.removeValue(forKey:)((unint64_t)v5);

    swift_unknownObjectRelease();
  }
}

void CMFormatDescriptionRef.Extensions.subscript.setter(void *a1, unint64_t *a2)
{
  unint64_t v2 = *a2;
  id v4 = (id)v2;
  if (*a1)
  {
    uint64_t v3 = swift_unknownObjectRetain();
    specialized Dictionary._Variant.setValue(_:forKey:)(v3, v4);
    swift_unknownObjectRelease();
  }
  else
  {
    specialized Dictionary._Variant.removeValue(forKey:)(v2);

    swift_unknownObjectRelease();
  }
}

uint64_t CMFormatDescriptionRef.Extensions.subscript.getter(void *a1)
{
  uint64_t v3 = *v1;
  if ((v3 & 0xC000000000000001) != 0)
  {
    id v4 = a1;
    uint64_t v5 = __CocoaDictionary.lookup(_:)();
  }
  else
  {
    if (!*(void *)(v3 + 16)) {
      return 0;
    }
    unint64_t v7 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)a1);
    if (v8)
    {
      uint64_t v5 = *(void *)(*(void *)(v3 + 56) + 8 * v7);
      swift_unknownObjectRetain();
    }
    else
    {
      uint64_t v5 = 0;
    }
  }

  return v5;
}

uint64_t CMFormatDescriptionRef.Extensions.subscript.setter(uint64_t a1, void *a2)
{
  if (a1)
  {
    uint64_t v3 = swift_unknownObjectRetain();
    specialized Dictionary._Variant.setValue(_:forKey:)(v3, a2);
  }
  else
  {
    specialized Dictionary._Variant.removeValue(forKey:)((unint64_t)a2);

    swift_unknownObjectRelease();
  }

  return swift_unknownObjectRelease();
}

uint64_t (*CMFormatDescriptionRef.Extensions.subscript.modify(uint64_t *a1, void **a2))(uint64_t *a1, char a2)
{
  id v4 = *a2;
  a1[1] = (uint64_t)v2;
  a1[2] = (uint64_t)v4;
  uint64_t v5 = *v2;
  if ((v5 & 0xC000000000000001) == 0)
  {
    uint64_t v8 = *(void *)(v5 + 16);
    id v9 = v4;
    if (v8)
    {
      uint64_t v10 = (uint64_t)v9;
      swift_bridgeObjectRetain();
      unint64_t v11 = specialized __RawDictionaryStorage.find<A>(_:)(v10);
      if (v12)
      {
        uint64_t v7 = *(void *)(*(void *)(v5 + 56) + 8 * v11);
        swift_unknownObjectRetain();
        goto LABEL_3;
      }
      swift_bridgeObjectRelease();
    }
    uint64_t v7 = 0;
    goto LABEL_9;
  }
  id v6 = v4;
  swift_bridgeObjectRetain();
  uint64_t v7 = __CocoaDictionary.lookup(_:)();
LABEL_3:
  swift_bridgeObjectRelease();
LABEL_9:
  *a1 = v7;
  return CMFormatDescriptionRef.Extensions.subscript.modify;
}

uint64_t CMFormatDescriptionRef.Extensions.subscript.modify(uint64_t *a1, char a2)
{
  unint64_t v2 = (void *)a1[2];
  uint64_t v3 = *a1;
  if (a2)
  {
    if (v3)
    {
      uint64_t v4 = swift_unknownObjectRetain_n();
      specialized Dictionary._Variant.setValue(_:forKey:)(v4, v2);
    }
    else
    {
      specialized Dictionary._Variant.removeValue(forKey:)(a1[2]);
    }

    swift_unknownObjectRelease();
  }
  else
  {
    if (v3)
    {
      uint64_t v5 = swift_unknownObjectRetain();
      specialized Dictionary._Variant.setValue(_:forKey:)(v5, v2);
    }
    else
    {
      specialized Dictionary._Variant.removeValue(forKey:)(a1[2]);
    }
  }

  return swift_unknownObjectRelease();
}

{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t vars8;

  unint64_t v2 = (void *)a1[1];
  uint64_t v3 = *a1;
  if (a2)
  {
    if (v3)
    {
      swift_unknownObjectRetain_n();
      uint64_t v4 = v2;
      specialized Dictionary._Variant.setValue(_:forKey:)(v3, v4);

      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v7 = v2;
      specialized Dictionary._Variant.removeValue(forKey:)((unint64_t)v7);

      swift_unknownObjectRelease();
    }
  }
  else if (v3)
  {
    uint64_t v5 = v2;
    id v6 = swift_unknownObjectRetain();
    specialized Dictionary._Variant.setValue(_:forKey:)(v6, v5);
  }
  else
  {
    uint64_t v8 = v2;
    specialized Dictionary._Variant.removeValue(forKey:)((unint64_t)v8);
  }

  return swift_unknownObjectRelease();
}

uint64_t specialized Dictionary.subscript.getter(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) != 0)
  {
    id v2 = a1;
    uint64_t v3 = __CocoaDictionary.lookup(_:)();

    return v3;
  }
  else if (*(void *)(a2 + 16) && (specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)a1), (v5 & 1) != 0))
  {
    return swift_unknownObjectRetain();
  }
  else
  {
    return 0;
  }
}

uint64_t (*CMFormatDescriptionRef.Extensions.subscript.modify(uint64_t *a1, void *a2))(uint64_t *a1, char a2)
{
  a1[1] = (uint64_t)a2;
  a1[2] = (uint64_t)v2;
  uint64_t v5 = *v2;
  if ((v5 & 0xC000000000000001) != 0)
  {
    id v6 = a2;
    uint64_t v7 = __CocoaDictionary.lookup(_:)();
  }
  else
  {
    if (!*(void *)(v5 + 16))
    {
      uint64_t v7 = 0;
      goto LABEL_4;
    }
    unint64_t v9 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)a2);
    if (v10)
    {
      uint64_t v7 = *(void *)(*(void *)(v5 + 56) + 8 * v9);
      swift_unknownObjectRetain();
    }
    else
    {
      uint64_t v7 = 0;
    }
  }

LABEL_4:
  *a1 = v7;
  return CMFormatDescriptionRef.Extensions.subscript.modify;
}

BOOL static CMFormatDescriptionRef.Extensions.Value.== infix(_:_:)(CFTypeRef *a1, CFTypeRef *a2)
{
  return CFEqual(*a1, *a2) != 0;
}

void CMFormatDescriptionRef.Extensions.Value.hash(into:)()
{
  Swift::UInt v1 = CFHash(*v0);
  Hasher._combine(_:)(v1);
}

Swift::Int CMFormatDescriptionRef.Extensions.Value.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Swift::UInt v2 = CFHash(v1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CMFormatDescriptionRef.Extensions.Value()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Swift::UInt v2 = CFHash(v1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance CMFormatDescriptionRef.Extensions.Value()
{
  Swift::UInt v1 = CFHash(*v0);
  Hasher._combine(_:)(v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CMFormatDescriptionRef.Extensions.Value()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Swift::UInt v2 = CFHash(v1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CMFormatDescriptionRef.Extensions.Value(CFTypeRef *a1, CFTypeRef *a2)
{
  return CFEqual(*a1, *a2) != 0;
}

uint64_t CMFormatDescriptionRef.Extensions.startIndex.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = specialized Dictionary.startIndex.getter(*v1);
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  return result;
}

uint64_t specialized Dictionary.startIndex.getter(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0) {
    return __CocoaDictionary.startIndex.getter();
  }
  unint64_t v2 = *(void *)(a1 + 64);
  if (v2)
  {
    uint64_t v3 = 0;
    return __clz(__rbit64(v2)) + v3;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v1 = 1 << v5;
  if (v6 < 7) {
    return v1;
  }
  unint64_t v2 = *(void *)(a1 + 72);
  if (v2)
  {
    uint64_t v3 = 64;
    return __clz(__rbit64(v2)) + v3;
  }
  if (v6 < 8) {
    return v1;
  }
  unint64_t v2 = *(void *)(a1 + 80);
  if (v2)
  {
    uint64_t v3 = 128;
    return __clz(__rbit64(v2)) + v3;
  }
  unint64_t v7 = (unint64_t)(v1 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  unint64_t v9 = (unint64_t *)(a1 + 88);
  uint64_t v3 = 128;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v2 = v10;
    --v8;
    v3 += 64;
    if (v10) {
      return __clz(__rbit64(v2)) + v3;
    }
  }
  return v1;
}

uint64_t CMFormatDescriptionRef.Extensions.endIndex.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  unint64_t v4 = *v1 & 0xC000000000000001;
  if (v4)
  {
    uint64_t result = __CocoaDictionary.endIndex.getter();
  }
  else
  {
    uint64_t result = 1 << *(unsigned char *)(v3 + 32);
    uint64_t v6 = *(unsigned int *)(v3 + 36);
  }
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = v4 != 0;
  return result;
}

void CMFormatDescriptionRef.Extensions.subscript.getter(uint64_t a1)
{
  specialized Dictionary.subscript.getter(&v2, *(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *v1);
}

void specialized Dictionary.subscript.getter(void *a1, uint64_t a2, int a3, char a4, uint64_t a5)
{
  unint64_t v6 = a2;
  if ((a5 & 0xC000000000000001) != 0)
  {
    if (a4)
    {
      __CocoaDictionary.lookup(_:)();
      uint64_t v9 = v8;
      type metadata accessor for CFStringRef(0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      *a1 = v9;
      return;
    }
    goto LABEL_18;
  }
  if (a4)
  {
LABEL_10:
    if (__CocoaDictionary.Index.age.getter() == *(_DWORD *)(a5 + 36))
    {
      __CocoaDictionary.Index.key.getter();
      type metadata accessor for CFStringRef(0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      unint64_t v6 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v13);
      char v11 = v10;

      if (v11) {
        goto LABEL_12;
      }
LABEL_17:
      __break(1u);
LABEL_18:
      __break(1u);
      return;
    }
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (a2 < 0 || 1 << *(unsigned char *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (((*(void *)(a5 + 8 * ((unint64_t)a2 >> 6) + 64) >> a2) & 1) == 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (*(_DWORD *)(a5 + 36) != a3)
  {
    __break(1u);
    goto LABEL_10;
  }
LABEL_12:
  char v12 = *(void **)(*(void *)(a5 + 48) + 8 * v6);
  *a1 = *(void *)(*(void *)(a5 + 56) + 8 * v6);
  v12;
  swift_unknownObjectRetain();
}

void CMFormatDescriptionRef.Extensions.index(after:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)a1;
  if ((*v2 & 0xC000000000000001) == 0)
  {
    specialized _NativeDictionary.index(after:)(v5, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *v2);
    char v8 = v9 & 1;
    goto LABEL_5;
  }
  if (*(unsigned char *)(a1 + 16))
  {
    uint64_t v6 = __CocoaDictionary.index(after:)();
    char v8 = 1;
LABEL_5:
    *(void *)a2 = v6;
    *(void *)(a2 + 8) = v7;
    *(unsigned char *)(a2 + 16) = v8;
    return;
  }
  __break(1u);
}

uint64_t protocol witness for Collection.startIndex.getter in conformance CMFormatDescriptionRef.Extensions@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = specialized Dictionary.startIndex.getter(*v1);
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  return result;
}

void (*protocol witness for Collection.subscript.read in conformance CMFormatDescriptionRef.Extensions(void *a1, uint64_t a2))(uint64_t a1)
{
  specialized Dictionary.subscript.getter(&v8, *(void *)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16), *v2);
  uint64_t v4 = v8;
  a1[2] = v5;
  a1[3] = v4;
  *a1 = v5;
  a1[1] = v4;
  id v6 = v5;
  swift_unknownObjectRetain();
  return protocol witness for Collection.subscript.read in conformance CMFormatDescriptionRef.Extensions;
}

void protocol witness for Collection.subscript.read in conformance CMFormatDescriptionRef.Extensions(uint64_t a1)
{
  id v1 = *(id *)(a1 + 16);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

uint64_t protocol witness for Collection.subscript.getter in conformance CMFormatDescriptionRef.Extensions@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  long long v3 = a1[1];
  long long v5 = *a1;
  v6[0] = v3;
  *(_OWORD *)((char *)v6 + 9) = *(long long *)((char *)a1 + 25);
  return specialized Collection<>.subscript.getter((uint64_t)&v5, *v2, a2);
}

uint64_t protocol witness for Collection.indices.getter in conformance CMFormatDescriptionRef.Extensions@<X0>(uint64_t a1@<X8>)
{
  return specialized Collection<>.indices.getter(*v1, a1);
}

uint64_t protocol witness for Collection.isEmpty.getter in conformance CMFormatDescriptionRef.Extensions()
{
  return specialized Collection.isEmpty.getter(*v0);
}

void protocol witness for Collection._customIndexOfEquatableElement(_:) in conformance CMFormatDescriptionRef.Extensions(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = -2;
}

void protocol witness for Collection.index(_:offsetBy:) in conformance CMFormatDescriptionRef.Extensions(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  specialized Collection.index(_:offsetBy:)(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), a2, *v3, a3);
}

void protocol witness for Collection.index(_:offsetBy:limitedBy:) in conformance CMFormatDescriptionRef.Extensions(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  specialized Collection.index(_:offsetBy:limitedBy:)(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), a2, *(void *)a3, *(void *)(a3 + 8), *(unsigned char *)(a3 + 16), *v4, a4);
}

void protocol witness for Collection.distance(from:to:) in conformance CMFormatDescriptionRef.Extensions(uint64_t a1, uint64_t a2)
{
  specialized Collection.distance(from:to:)(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16), *v2);
}

uint64_t protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance CMFormatDescriptionRef.Extensions(uint64_t *a1, long long *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance CMFormatDescriptionRef.Extensions(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, long long *))specialized Collection._failEarlyRangeCheck(_:bounds:));
}

{
  return protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance CMFormatDescriptionRef.Extensions(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, long long *))specialized Collection._failEarlyRangeCheck(_:bounds:));
}

uint64_t protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance CMFormatDescriptionRef.Extensions(uint64_t *a1, long long *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, long long *))
{
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  uint64_t v7 = *((unsigned __int8 *)a1 + 16);
  long long v8 = a2[1];
  long long v10 = *a2;
  v11[0] = v8;
  *(_OWORD *)((char *)v11 + 9) = *(long long *)((char *)a2 + 25);
  return a5(v5, v6, v7, &v10);
}

uint64_t protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance CMFormatDescriptionRef.Extensions(long long *a1, long long *a2)
{
  long long v2 = a1[1];
  long long v5 = *a1;
  v6[0] = v2;
  *(_OWORD *)((char *)v6 + 9) = *(long long *)((char *)a1 + 25);
  long long v3 = a2[1];
  long long v7 = *a2;
  v8[0] = v3;
  *(_OWORD *)((char *)v8 + 9) = *(long long *)((char *)a2 + 25);
  return specialized Collection._failEarlyRangeCheck(_:bounds:)(&v5, &v7);
}

void protocol witness for Collection.index(after:) in conformance CMFormatDescriptionRef.Extensions(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)a1;
  if ((*v2 & 0xC000000000000001) == 0)
  {
    specialized _NativeDictionary.index(after:)(v5, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *v2);
    char v8 = v9 & 1;
    goto LABEL_5;
  }
  if (*(unsigned char *)(a1 + 16))
  {
    uint64_t v6 = __CocoaDictionary.index(after:)();
    char v8 = 1;
LABEL_5:
    *(void *)a2 = v6;
    *(void *)(a2 + 8) = v7;
    *(unsigned char *)(a2 + 16) = v8;
    return;
  }
  __break(1u);
}

uint64_t protocol witness for Collection.formIndex(after:) in conformance CMFormatDescriptionRef.Extensions(uint64_t result)
{
  uint64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)result;
  uint64_t v5 = *(void *)(result + 8);
  char v6 = *(unsigned char *)(result + 16);
  if ((v3 & 0xC000000000000001) == 0)
  {
    specialized _NativeDictionary.index(after:)(*(void *)result, v5, v6, v3);
    uint64_t v7 = v14;
    uint64_t v9 = v15;
    char v10 = v16 & 1;
    uint64_t v11 = v4;
    uint64_t v12 = v5;
    char v13 = v6;
    goto LABEL_5;
  }
  if (*(unsigned char *)(result + 16))
  {
    uint64_t v7 = __CocoaDictionary.index(after:)();
    uint64_t v9 = v8;
    char v10 = 1;
    uint64_t v11 = v4;
    uint64_t v12 = v5;
    char v13 = 1;
LABEL_5:
    uint64_t result = outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v11, v12, v13);
    *(void *)uint64_t v2 = v7;
    *(void *)(v2 + 8) = v9;
    *(unsigned char *)(v2 + 16) = v10;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Sequence.makeIterator() in conformance CMFormatDescriptionRef.Extensions@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t result = specialized Dictionary.startIndex.getter(v3);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = result;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6 & 1;
  return result;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance CMFormatDescriptionRef.Extensions()
{
  return specialized Collection.count.getter(*v0);
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance CMFormatDescriptionRef.Extensions()
{
  uint64_t v1 = specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance CMFormatDescriptionRef.Extensions(uint64_t a1, void *a2, uint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

BOOL static CMFormatDescriptionRef.Extensions.Index.== infix(_:_:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  if (a1[2])
  {
    if (*(unsigned char *)(a2 + 16)) {
LABEL_9:
    }
      JUMPOUT(0x1C188D720);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (*(unsigned char *)(a2 + 16)) {
    goto LABEL_8;
  }
  if (a1[1] != *(void *)(a2 + 8))
  {
    __break(1u);
    goto LABEL_8;
  }
  return v3 == *(void *)a2;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CMFormatDescriptionRef.Extensions.Index(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  if (a1[2])
  {
    if (*(unsigned char *)(a2 + 16)) {
LABEL_9:
    }
      JUMPOUT(0x1C188D720);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (*(unsigned char *)(a2 + 16)) {
    goto LABEL_8;
  }
  if (a1[1] != *(void *)(a2 + 8))
  {
    __break(1u);
    goto LABEL_8;
  }
  return v3 == *(void *)a2;
}

BOOL static CMFormatDescriptionRef.Extensions.Index.< infix(_:_:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  if (a1[2])
  {
    if (*(unsigned char *)(a2 + 16)) {
LABEL_9:
    }
      JUMPOUT(0x1C188D710);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (*(unsigned char *)(a2 + 16)) {
    goto LABEL_8;
  }
  if (a1[1] != *(void *)(a2 + 8))
  {
    __break(1u);
    goto LABEL_8;
  }
  return v3 < *(void *)a2;
}

BOOL protocol witness for static Comparable.< infix(_:_:) in conformance CMFormatDescriptionRef.Extensions.Index(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  if (a1[2])
  {
    if (*(unsigned char *)(a2 + 16)) {
LABEL_9:
    }
      JUMPOUT(0x1C188D710);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (*(unsigned char *)(a2 + 16)) {
    goto LABEL_8;
  }
  if (a1[1] != *(void *)(a2 + 8))
  {
    __break(1u);
    goto LABEL_8;
  }
  return v3 < *(void *)a2;
}

uint64_t protocol witness for static Comparable.<= infix(_:_:) in conformance CMFormatDescriptionRef.Extensions.Index(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  char v5 = *((unsigned char *)a1 + 16);
  uint64_t result = *a2;
  uint64_t v7 = a2[1];
  if (a2[2])
  {
    if (v5)
    {
      char v8 = MEMORY[0x1C188D710](result, v7, v3, v4);
      return (v8 & 1) == 0;
    }
  }
  else if ((v5 & 1) == 0)
  {
    if (v7 == v4)
    {
      char v8 = result < v3;
      return (v8 & 1) == 0;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for static Comparable.>= infix(_:_:) in conformance CMFormatDescriptionRef.Extensions.Index(uint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  uint64_t v5 = a1[1];
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  char v8 = *((unsigned char *)a2 + 16);
  if (a1[2])
  {
    if (v8)
    {
      char v9 = MEMORY[0x1C188D710](result, v5, v6, v7);
      return (v9 & 1) == 0;
    }
  }
  else if ((v8 & 1) == 0)
  {
    if (v5 == v7)
    {
      char v9 = result < v6;
      return (v9 & 1) == 0;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

BOOL protocol witness for static Comparable.> infix(_:_:) in conformance CMFormatDescriptionRef.Extensions.Index(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  char v5 = *((unsigned char *)a1 + 16);
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  if (a2[2])
  {
    if (v5) {
LABEL_9:
    }
      JUMPOUT(0x1C188D710);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v5) {
    goto LABEL_8;
  }
  if (v7 != v4)
  {
    __break(1u);
    goto LABEL_8;
  }
  return v6 < v3;
}

uint64_t CMFormatDescriptionRef.Extensions.Index.hash(into:)()
{
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);

  return Dictionary.Index.hash(into:)();
}

Swift::Int CMFormatDescriptionRef.Extensions.Index.hashValue.getter()
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CMFormatDescriptionRef.Extensions.Index()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance CMFormatDescriptionRef.Extensions.Index()
{
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);

  return Dictionary.Index.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CMFormatDescriptionRef.Extensions.Index()
{
  return Hasher._finalize()();
}

BOOL static CMFormatDescriptionRef.Extensions.== infix(_:_:)()
{
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  Class v1 = Dictionary._bridgeToObjectiveC()().super.isa;
  int v2 = CFEqual(isa, v1);

  return v2 != 0;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CMFormatDescriptionRef.Extensions()
{
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  Class v1 = Dictionary._bridgeToObjectiveC()().super.isa;
  int v2 = CFEqual(isa, v1);

  return v2 != 0;
}

void CMFormatDescriptionRef.Extensions.hash(into:)()
{
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  Swift::UInt v1 = CFHash(isa);

  Hasher._combine(_:)(v1);
}

Swift::Int CMFormatDescriptionRef.Extensions.hashValue.getter()
{
  Hasher.init(_seed:)();
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  Swift::UInt v1 = CFHash(isa);

  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CMFormatDescriptionRef.Extensions()
{
  Hasher.init(_seed:)();
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  Swift::UInt v1 = CFHash(isa);

  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance CMFormatDescriptionRef.Extensions()
{
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  Swift::UInt v1 = CFHash(isa);

  Hasher._combine(_:)(v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CMFormatDescriptionRef.Extensions()
{
  Hasher.init(_seed:)();
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  Swift::UInt v1 = CFHash(isa);

  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t _CMFormatDescriptionInitTrampoline.init(mediaType:mediaSubType:extensions:)(CMMediaType *a1, FourCharCode *a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  formatDescriptionOut[1] = *(CMFormatDescriptionRef *)MEMORY[0x1E4F143B8];
  CMMediaType v6 = *a1;
  FourCharCode v7 = *a2;
  uint64_t v8 = *a3;
  formatDescriptionOut[0] = 0;
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (v8)
  {
    type metadata accessor for CFStringRef(0);
    _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
    swift_bridgeObjectRetain();
    v10.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v10.super.Class isa = 0;
  }
  OSStatus v11 = CMFormatDescriptionCreate(v9, v6, v7, v10.super.isa, formatDescriptionOut);

  CMFormatDescriptionRef v12 = formatDescriptionOut[0];
  if (v11 == noErr.getter())
  {
    uint64_t result = swift_bridgeObjectRelease();
    if (v12) {
      return (*(uint64_t (**)(CMFormatDescriptionRef, uint64_t, uint64_t))(a5 + 8))(v12, a4, a5);
    }
    else {
      __break(1u);
    }
  }
  else
  {
    id v14 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v14 initWithDomain:MEMORY[0x1E4F28760] code:v11 userInfo:0];
    swift_willThrow();

    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t specialized _CMFormatDescriptionInitTrampoline.init(audioStreamBasicDescription:layoutSize:layout:magicCookie:extensions:)(uint64_t a1, size_t a2, const AudioChannelLayout *a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  formatDescriptionOut[1] = *(CMAudioFormatDescriptionRef *)MEMORY[0x1E4F143B8];
  long long v11 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&asbd.mSampleRate = *(_OWORD *)a1;
  *(_OWORD *)&asbd.mBytesPerPacket = v11;
  *(void *)&asbd.mBitsPerChannel = *(void *)(a1 + 32);
  formatDescriptionOut[0] = 0;
  if (a5 >> 60 == 15)
  {
    uint64_t isa = *MEMORY[0x1E4F1CF80];
    if (a6)
    {
      type metadata accessor for CFStringRef(0);
      _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
      swift_bridgeObjectRetain();
      v13.super.uint64_t isa = Dictionary._bridgeToObjectiveC()().super.isa;
    }
    else
    {
      v13.super.uint64_t isa = 0;
    }
    swift_beginAccess();
    swift_beginAccess();
    OSStatus v16 = CMAudioFormatDescriptionCreate((CFAllocatorRef)isa, &asbd, a2, a3, 0, 0, v13.super.isa, formatDescriptionOut);
    swift_endAccess();
    swift_endAccess();

    goto LABEL_43;
  }
  switch(a5 >> 62)
  {
    case 1uLL:
      uint64_t v18 = (a4 >> 32) - (int)a4;
      if (a4 >> 32 < (int)a4)
      {
        __break(1u);
LABEL_49:
        __break(1u);
LABEL_50:
        __break(1u);
        goto LABEL_51;
      }
      swift_bridgeObjectRetain();
      outlined copy of Data?(a4, a5);
      id v19 = (char *)__DataStorage._bytes.getter();
      if (!v19) {
        goto LABEL_13;
      }
      uint64_t v20 = __DataStorage._offset.getter();
      if (__OFSUB__((int)a4, v20)) {
LABEL_51:
      }
        __break(1u);
      v19 += (int)a4 - v20;
LABEL_13:
      uint64_t v21 = __DataStorage._length.getter();
      if (v21 >= v18) {
        uint64_t v22 = (a4 >> 32) - (int)a4;
      }
      else {
        uint64_t v22 = v21;
      }
      if (!v19) {
        uint64_t v22 = 0;
      }
      size_t magicCookieSize = v22;
      CFAllocatorRef v23 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      if (a6)
      {
        type metadata accessor for CFStringRef(0);
        _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
        swift_bridgeObjectRetain();
        uint64_t isa = (uint64_t)Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t isa = 0;
      }
      swift_beginAccess();
      swift_beginAccess();
      OSStatus v16 = CMAudioFormatDescriptionCreate(v23, &asbd, a2, a3, magicCookieSize, v19, (CFDictionaryRef)isa, formatDescriptionOut);
      swift_endAccess();
      swift_endAccess();

LABEL_42:
      outlined consume of Data?(a4, a5);
LABEL_43:
      if (v16 == noErr.getter())
      {
        swift_beginAccess();
        CMAudioFormatDescriptionRef v33 = formatDescriptionOut[0];
        if (!formatDescriptionOut[0])
        {
          swift_bridgeObjectRelease_n();
          __break(1u);
          JUMPOUT(0x1BE214B58);
        }
        uint64_t isa = (uint64_t)CMTimebaseRetain(formatDescriptionOut[0]);
        outlined consume of Data?(a4, a5);

        swift_bridgeObjectRelease_n();
      }
      else
      {
        id v34 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
        [v34 initWithDomain:*MEMORY[0x1E4F28760] code:v16 userInfo:0];
        swift_willThrow();
        outlined consume of Data?(a4, a5);
        swift_bridgeObjectRelease_n();
      }
      return isa;
    case 2uLL:
      uint64_t isa = a5 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v25 = *(void *)(a4 + 16);
      uint64_t v24 = *(void *)(a4 + 24);
      swift_bridgeObjectRetain();
      outlined copy of Data?(a4, a5);
      swift_retain();
      swift_retain();
      id v26 = (char *)__DataStorage._bytes.getter();
      if (!v26) {
        goto LABEL_23;
      }
      uint64_t v27 = __DataStorage._offset.getter();
      if (__OFSUB__(v25, v27)) {
        goto LABEL_50;
      }
      v26 += v25 - v27;
LABEL_23:
      BOOL v28 = __OFSUB__(v24, v25);
      uint64_t v29 = v24 - v25;
      if (v28) {
        goto LABEL_49;
      }
      uint64_t v30 = __DataStorage._length.getter();
      if (v30 >= v29) {
        size_t v31 = v29;
      }
      else {
        size_t v31 = v30;
      }
      if (!v26) {
        size_t v31 = 0;
      }
      size_t magicCookieSizea = v31;
      CFAllocatorRef v36 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      if (a6)
      {
        type metadata accessor for CFStringRef(0);
        _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
        swift_bridgeObjectRetain();
        v15.super.uint64_t isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
      }
      else
      {
        v15.super.uint64_t isa = 0;
      }
      swift_beginAccess();
      swift_beginAccess();
      OSStatus v16 = CMAudioFormatDescriptionCreate(v36, &asbd, a2, a3, magicCookieSizea, v26, v15.super.isa, formatDescriptionOut);
      swift_endAccess();
      swift_endAccess();
      swift_release();
      swift_release();
LABEL_41:

      goto LABEL_42;
    case 3uLL:
      memset(magicCookie, 0, 14);
      uint64_t isa = *MEMORY[0x1E4F1CF80];
      if (a6)
      {
        type metadata accessor for CFStringRef(0);
        _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
        swift_bridgeObjectRetain();
        v32.super.uint64_t isa = Dictionary._bridgeToObjectiveC()().super.isa;
      }
      else
      {
        v32.super.uint64_t isa = 0;
      }
      swift_beginAccess();
      swift_beginAccess();
      OSStatus v16 = CMAudioFormatDescriptionCreate((CFAllocatorRef)isa, &asbd, a2, a3, 0, magicCookie, v32.super.isa, formatDescriptionOut);
      swift_endAccess();
      swift_endAccess();

      goto LABEL_42;
    default:
      magicCookie[0] = a4;
      LOWORD(magicCookie[1]) = a5;
      BYTE2(magicCookie[1]) = BYTE2(a5);
      BYTE3(magicCookie[1]) = BYTE3(a5);
      BYTE4(magicCookie[1]) = BYTE4(a5);
      uint64_t isa = BYTE6(a5);
      BYTE5(magicCookie[1]) = BYTE5(a5);
      CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      if (a6)
      {
        type metadata accessor for CFStringRef(0);
        _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
        swift_bridgeObjectRetain();
        v15.super.uint64_t isa = Dictionary._bridgeToObjectiveC()().super.isa;
      }
      else
      {
        v15.super.uint64_t isa = 0;
      }
      swift_beginAccess();
      swift_beginAccess();
      OSStatus v16 = CMAudioFormatDescriptionCreate(v14, &asbd, a2, a3, BYTE6(a5), magicCookie, v15.super.isa, formatDescriptionOut);
      swift_endAccess();
      swift_endAccess();
      goto LABEL_41;
  }
}

void _CMFormatDescriptionInitTrampoline.init(audioStreamBasicDescription:layoutSize:layout:magicCookie:extensions:)(uint64_t a1, size_t a2, const AudioChannelLayout *a3, uint64_t a4, unint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a8;
  unint64_t v9 = a5;
  uint64_t v10 = a4;
  size_t v11 = a2;
  formatDescriptionOut[1] = *(CMAudioFormatDescriptionRef *)MEMORY[0x1E4F143B8];
  uint64_t v12 = *a6;
  long long v13 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&asbd.mSampleRate = *(_OWORD *)a1;
  *(_OWORD *)&asbd.mBytesPerPacket = v13;
  *(void *)&asbd.mBitsPerChannel = *(void *)(a1 + 32);
  formatDescriptionOut[0] = 0;
  if (a5 >> 60 != 15)
  {
    switch(a5 >> 62)
    {
      case 1uLL:
        uint64_t v21 = (a4 >> 32) - (int)a4;
        if (a4 >> 32 >= (int)a4)
        {
          swift_bridgeObjectRetain();
          outlined copy of Data?(v10, v9);
          uint64_t v22 = __DataStorage._bytes.getter();
          if (!v22)
          {
            uint64_t v25 = 0;
            goto LABEL_34;
          }
          uint64_t v23 = v22;
          uint64_t v24 = __DataStorage._offset.getter();
          if (!__OFSUB__((int)v10, v24))
          {
            uint64_t v25 = (void *)(v23 + (int)v10 - v24);
LABEL_34:
            uint64_t v39 = __DataStorage._length.getter();
            if (v39 >= v21) {
              uint64_t v40 = (v10 >> 32) - (int)v10;
            }
            else {
              uint64_t v40 = v39;
            }
            if (!v25) {
              uint64_t v40 = 0;
            }
            size_t v50 = v40;
            CFAllocatorRef v41 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
            if (v12)
            {
              type metadata accessor for CFStringRef(0);
              _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
              swift_bridgeObjectRetain();
              v33.super.uint64_t isa = Dictionary._bridgeToObjectiveC()().super.isa;
              swift_bridgeObjectRelease();
            }
            else
            {
              v33.super.uint64_t isa = 0;
            }
            uint64_t v8 = a8;
            swift_beginAccess();
            swift_beginAccess();
            CFAllocatorRef v35 = v41;
            size_t v36 = v11;
            uint64_t v37 = a3;
            size_t v38 = v50;
            id v34 = v25;
LABEL_45:
            OSStatus v20 = CMAudioFormatDescriptionCreate(v35, &asbd, v36, v37, v38, v34, v33.super.isa, formatDescriptionOut);
            swift_endAccess();
            swift_endAccess();
LABEL_46:

            outlined consume of Data?(v10, v9);
            goto LABEL_47;
          }
LABEL_53:
          __break(1u);
        }
        __break(1u);
        goto LABEL_52;
      case 2uLL:
        uint64_t v8 = *(void *)(a4 + 16);
        size_t v11 = *(void *)(a4 + 24);
        swift_bridgeObjectRetain();
        outlined copy of Data?(v10, v9);
        swift_retain();
        swift_retain();
        uint64_t v26 = __DataStorage._bytes.getter();
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = __DataStorage._offset.getter();
          if (__OFSUB__(v8, v28))
          {
LABEL_52:
            __break(1u);
            goto LABEL_53;
          }
          uint64_t v29 = (const void *)(v27 + v8 - v28);
          uint64_t v30 = v11 - v8;
          if (!__OFSUB__(v11, v8))
          {
LABEL_17:
            uint64_t v31 = __DataStorage._length.getter();
            if (v31 >= v30) {
              size_t v32 = v30;
            }
            else {
              size_t v32 = v31;
            }
            if (!v29) {
              size_t v32 = 0;
            }
            size_t v46 = v32;
            CFAllocatorRef v45 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
            uint64_t v8 = a8;
            if (v12)
            {
              type metadata accessor for CFStringRef(0);
              _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
              swift_bridgeObjectRetain();
              v33.super.uint64_t isa = Dictionary._bridgeToObjectiveC()().super.isa;
              swift_bridgeObjectRelease();
            }
            else
            {
              v33.super.uint64_t isa = 0;
            }
            swift_beginAccess();
            swift_beginAccess();
            OSStatus v20 = CMAudioFormatDescriptionCreate(v45, &asbd, a2, a3, v46, v29, v33.super.isa, formatDescriptionOut);
            swift_endAccess();
            swift_endAccess();
            swift_release();
            swift_release();
            goto LABEL_46;
          }
        }
        else
        {
          uint64_t v29 = 0;
          uint64_t v30 = v11 - v8;
          if (!__OFSUB__(v11, v8)) {
            goto LABEL_17;
          }
        }
        __break(1u);
LABEL_31:
        v33.super.uint64_t isa = 0;
LABEL_32:
        swift_beginAccess();
        swift_beginAccess();
        id v34 = magicCookie;
        CFAllocatorRef v35 = (const __CFAllocator *)v29;
        size_t v36 = v11;
        uint64_t v37 = a3;
        size_t v38 = 0;
        goto LABEL_45;
      case 3uLL:
        memset(magicCookie, 0, 14);
        uint64_t v29 = (const void *)*MEMORY[0x1E4F1CF80];
        if (!v12) {
          goto LABEL_31;
        }
        type metadata accessor for CFStringRef(0);
        _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
        swift_bridgeObjectRetain();
        v33.super.uint64_t isa = Dictionary._bridgeToObjectiveC()().super.isa;
        goto LABEL_32;
      default:
        uint64_t v51 = a8;
        magicCookie[0] = a4;
        LOWORD(magicCookie[1]) = a5;
        BYTE2(magicCookie[1]) = BYTE2(a5);
        BYTE3(magicCookie[1]) = BYTE3(a5);
        BYTE4(magicCookie[1]) = BYTE4(a5);
        BYTE5(magicCookie[1]) = BYTE5(a5);
        CFAllocatorRef v18 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        if (v12)
        {
          type metadata accessor for CFStringRef(0);
          _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
          swift_bridgeObjectRetain();
          v19.super.uint64_t isa = Dictionary._bridgeToObjectiveC()().super.isa;
        }
        else
        {
          v19.super.uint64_t isa = 0;
        }
        swift_beginAccess();
        swift_beginAccess();
        OSStatus v20 = CMAudioFormatDescriptionCreate(v18, &asbd, v11, a3, BYTE6(v9), magicCookie, v19.super.isa, formatDescriptionOut);
        swift_endAccess();
        swift_endAccess();

        outlined consume of Data?(v10, v9);
        goto LABEL_9;
    }
  }
  uint64_t v51 = a8;
  CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (v12)
  {
    type metadata accessor for CFStringRef(0);
    _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
    swift_bridgeObjectRetain();
    v17.super.uint64_t isa = Dictionary._bridgeToObjectiveC()().super.isa;
  }
  else
  {
    v17.super.uint64_t isa = 0;
  }
  swift_beginAccess();
  swift_beginAccess();
  OSStatus v20 = CMAudioFormatDescriptionCreate(v16, &asbd, v11, a3, 0, 0, v17.super.isa, formatDescriptionOut);
  swift_endAccess();
  swift_endAccess();

  uint64_t v10 = a4;
  unint64_t v9 = a5;
LABEL_9:
  uint64_t v8 = v51;
LABEL_47:
  if (v20 == noErr.getter())
  {
    swift_beginAccess();
    if (!formatDescriptionOut[0])
    {
      swift_bridgeObjectRelease_n();
      __break(1u);
      JUMPOUT(0x1BE2152F4);
    }
    uint64_t v42 = *(void (**)(void))(v8 + 8);
    uint64_t v43 = formatDescriptionOut[0];
    v42();
    outlined consume of Data?(v10, v9);

    swift_bridgeObjectRelease_n();
  }
  else
  {
    id v44 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v44 initWithDomain:*MEMORY[0x1E4F28760] code:v20 userInfo:0];
    swift_willThrow();
    outlined consume of Data?(v10, v9);
    swift_bridgeObjectRelease_n();
  }
}

uint64_t _CMFormatDescriptionInitTrampoline.init(audioStreamBasicDescription:layout:magicCookie:extensions:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  unint64_t v33 = a4;
  uint64_t v31 = a1;
  uint64_t v34 = a3;
  uint64_t v30 = a8;
  uint64_t v29 = *(void *)(a6 - 8);
  MEMORY[0x1F4188790](a1);
  long long v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedAudioChannelLayout?);
  MEMORY[0x1F4188790](v14 - 8);
  CFAllocatorRef v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for ManagedAudioChannelLayout();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17);
  OSStatus v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *a5;
  outlined init with copy of ManagedAudioChannelLayout?(a2, (uint64_t)v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
  {
    outlined destroy of ManagedAudioChannelLayout?((uint64_t)v16);
    uint64_t v35 = v21;
    uint64_t v22 = v32;
    _CMFormatDescriptionInitTrampoline.init(audioStreamBasicDescription:layoutSize:layout:magicCookie:extensions:)(v31, 0, 0, v34, v33, &v35, a6, a7);
    uint64_t result = outlined destroy of ManagedAudioChannelLayout?(a2);
    if (!v22) {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v29 + 32))(v30, v13, a6);
    }
  }
  else
  {
    uint64_t v28 = a6;
    uint64_t v29 = a7;
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v20, v16, v17);
    uint64_t v24 = ManagedAudioChannelLayout.sizeInBytes.getter();
    uint64_t v25 = MEMORY[0x1F4188790](v24);
    *(&v28 - 6) = v31;
    *(&v28 - 5) = v25;
    unint64_t v26 = v33;
    *(&v28 - 4) = v34;
    *(&v28 - 3) = v26;
    *(&v28 - 2) = v21;
    type metadata accessor for CMFormatDescriptionRef(0);
    uint64_t v27 = v32;
    ManagedAudioChannelLayout.withUnsafePointer<A>(_:)();
    if (v27)
    {
      outlined destroy of ManagedAudioChannelLayout?(a2);
      (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
      outlined consume of Data?(v34, v26);
      return swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v35, v28);
      outlined consume of Data?(v34, v26);
      outlined destroy of ManagedAudioChannelLayout?(a2);
      return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    }
  }
  return result;
}

uint64_t closure #1 in _CMFormatDescriptionInitTrampoline.init(audioStreamBasicDescription:layout:magicCookie:extensions:)@<X0>(const AudioChannelLayout *a1@<X0>, uint64_t a2@<X1>, size_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  outlined copy of Data?(a4, a5);
  swift_bridgeObjectRetain();
  uint64_t result = specialized _CMFormatDescriptionInitTrampoline.init(audioStreamBasicDescription:layoutSize:layout:magicCookie:extensions:)(a2, a3, a1, a4, a5, a6);
  if (!v7) {
    *a7 = result;
  }
  return result;
}

uint64_t _CMFormatDescriptionInitTrampoline.init(audioFormatDescriptionArray:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v11[1] = *(CMAudioFormatDescriptionRef *)MEMORY[0x1E4F143B8];
  v11[0] = 0;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  type metadata accessor for CMFormatDescriptionRef(0);
  CFArrayRef isa = Array._bridgeToObjectiveC()().super.isa;
  OSStatus Summary = CMAudioFormatDescriptionCreateSummary(v5, isa, 0, v11);

  CMAudioFormatDescriptionRef v8 = v11[0];
  if (Summary == noErr.getter())
  {
    uint64_t result = swift_bridgeObjectRelease();
    if (v8) {
      return (*(uint64_t (**)(CMAudioFormatDescriptionRef, uint64_t, uint64_t))(a3 + 8))(v8, a2, a3);
    }
    else {
      __break(1u);
    }
  }
  else
  {
    id v10 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v10 initWithDomain:*MEMORY[0x1E4F28760] code:Summary userInfo:0];
    swift_willThrow();

    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _CMFormatDescriptionInitTrampoline.init(videoCodecType:width:height:extensions:)(CMVideoCodecType *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  int32_t v6 = a2;
  formatDescriptionOut[1] = *(CMVideoFormatDescriptionRef *)MEMORY[0x1E4F143B8];
  uint64_t v7 = *a4;
  if (a2 == (int)a2 && (int32_t v8 = a3, a3 == (int)a3))
  {
    CMVideoCodecType v12 = *a1;
    formatDescriptionOut[0] = 0;
    CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    if (v7)
    {
      CFAllocatorRef v18 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CMVideoCodecType v19 = v12;
      type metadata accessor for CFStringRef(0);
      _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
      swift_bridgeObjectRetain();
      v14.super.CFArrayRef isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      CFAllocatorRef v13 = v18;
      CMVideoCodecType v12 = v19;
    }
    else
    {
      v14.super.CFArrayRef isa = 0;
    }
    OSStatus v15 = CMVideoFormatDescriptionCreate(v13, v12, v6, v8, v14.super.isa, formatDescriptionOut);

    CMVideoFormatDescriptionRef v16 = formatDescriptionOut[0];
    if (v15 == noErr.getter())
    {
      uint64_t result = swift_bridgeObjectRelease();
      if (v16) {
        return (*(uint64_t (**)(CMVideoFormatDescriptionRef, uint64_t, uint64_t))(a6 + 8))(v16, a5, a6);
      }
      else {
        __break(1u);
      }
    }
    else
    {
      id v17 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
      [v17 initWithDomain:MEMORY[0x1E4F28760] code:v15 userInfo:0];
      swift_willThrow();

      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    if (one-time initialization token for invalidParameter != -1) {
      swift_once();
    }
    (id)static CMFormatDescriptionRef.Error.invalidParameter;
    return swift_willThrow();
  }
  return result;
}

void _CMFormatDescriptionInitTrampoline.init(imageBuffer:)(CVImageBufferRef imageBuffer, uint64_t a2, uint64_t a3)
{
  formatDescriptionOut[1] = *(CMVideoFormatDescriptionRef *)MEMORY[0x1E4F143B8];
  formatDescriptionOut[0] = 0;
  OSStatus v5 = CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x1E4F1CF80], imageBuffer, formatDescriptionOut);
  CMVideoFormatDescriptionRef v6 = formatDescriptionOut[0];
  if (v5 != noErr.getter())
  {
    id v9 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v9 initWithDomain:*MEMORY[0x1E4F28760] code:v5 userInfo:0];
    swift_willThrow();

    goto LABEL_5;
  }
  if (v6)
  {
    uint64_t v7 = *(void (**)(void))(a3 + 8);
    int32_t v8 = v6;
    v7();

LABEL_5:
    return;
  }
  __break(1u);
}

uint64_t _CMFormatDescriptionInitTrampoline.init(h264ParameterSets:nalUnitHeaderLength:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v6 = a2;
  formatDescriptionOut[1] = *(CMFormatDescriptionRef *)MEMORY[0x1E4F143B8];
  if (specialized Sequence<>.contains(_:)(a2, (uint64_t)&outlined read-only object #0 of _CMFormatDescriptionInitTrampoline.init(h264ParameterSets:nalUnitHeaderLength:)))
  {
    uint64_t v28 = a3;
    unint64_t v8 = specialized _arrayForceCast<A, B>(_:)(a1);
    int64_t v9 = *(void *)(a1 + 16);
    swift_bridgeObjectRelease();
    id v10 = (char *)MEMORY[0x1E4FBC860];
    uint64_t v32 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v9, 0, MEMORY[0x1E4FBC860]);
    parameterSetCMItemCount Count = v9;
    size_t v11 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v9, 0, v10);
    if (v8 >> 62) {
      goto LABEL_27;
    }
    uint64_t v12 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    while (1)
    {
      uint64_t v31 = v6;
      uint64_t v29 = a4;
      if (!v12) {
        break;
      }
      uint64_t v13 = 4;
      while (1)
      {
        CFDataRef v14 = (v8 & 0xC000000000000001) != 0
            ? (const __CFData *)MEMORY[0x1C188D620](v13 - 4, v8)
            : (const __CFData *)*(id *)(v8 + 8 * v13);
        CFDataRef v15 = v14;
        a4 = v13 - 3;
        if (__OFADD__(v13 - 4, 1)) {
          break;
        }
        BytePtr = CFDataGetBytePtr(v14);
        if (!BytePtr) {
          goto LABEL_30;
        }
        id v17 = BytePtr;
        CFAllocatorRef v18 = v32;
        unint64_t v20 = *((void *)v32 + 2);
        unint64_t v19 = *((void *)v32 + 3);
        if (v20 >= v19 >> 1) {
          CFAllocatorRef v18 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v19 > 1), v20 + 1, 1, v32);
        }
        *((void *)v18 + 2) = v20 + 1;
        uint64_t v32 = v18;
        *(void *)&v18[8 * v20 + 32] = v17;
        CFIndex Length = CFDataGetLength(v15);
        unint64_t v6 = *((void *)v11 + 2);
        unint64_t v22 = *((void *)v11 + 3);
        if (v6 >= v22 >> 1) {
          size_t v11 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v22 > 1), v6 + 1, 1, v11);
        }
        *((void *)v11 + 2) = v6 + 1;
        *(void *)&v11[8 * v6 + 32] = Length;

        ++v13;
        if (a4 == v12) {
          goto LABEL_20;
        }
      }
      __break(1u);
LABEL_27:
      swift_bridgeObjectRetain();
      uint64_t v12 = _CocoaArrayWrapper.endIndex.getter();
    }
LABEL_20:
    swift_bridgeObjectRelease();
    formatDescriptionOut[0] = 0;
    if (v31 < (uint64_t)0xFFFFFFFF80000000)
    {
      __break(1u);
    }
    else if (v31 <= 0x7FFFFFFF)
    {
      CFAllocatorRef v24 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      OSStatus v25 = CMVideoFormatDescriptionCreateFromH264ParameterSets(v24, parameterSetCount, (const uint8_t *const *)v32 + 4, (const size_t *)v11 + 4, v31, formatDescriptionOut);
      CMFormatDescriptionRef v26 = formatDescriptionOut[0];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t result = noErr.getter();
      if (v25 == result)
      {
        if (v26)
        {
          (*(void (**)(CMFormatDescriptionRef, uint64_t))(v29 + 8))(v26, v28);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        else
        {
          __break(1u);
        }
      }
      else
      {
        id v27 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
        [v27 initWithDomain:*MEMORY[0x1E4F28760] code:v25 userInfo:0];
        swift_willThrow();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        return swift_bridgeObjectRelease();
      }
      return result;
    }
    __break(1u);
LABEL_30:
    __break(1u);
  }
  swift_bridgeObjectRelease();
  if (one-time initialization token for invalidParameter != -1) {
    swift_once();
  }
  (id)static CMFormatDescriptionRef.Error.invalidParameter;
  return swift_willThrow();
}

uint64_t specialized Sequence<>.contains(_:)(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(void *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 5; ; ++i)
  {
    uint64_t v4 = i - 3;
    if (__OFADD__(i - 4, 1)) {
      break;
    }
    BOOL v6 = *(void *)(a2 + 8 * i) == result;
    BOOL v5 = v6;
    BOOL v6 = v6 || v4 == v2;
    if (v6) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t specialized _arrayForceCast<A, B>(_:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x1E4FBC860];
  if (v2)
  {
    uint64_t v7 = MEMORY[0x1E4FBC860];
    specialized ContiguousArray.reserveCapacity(_:)();
    uint64_t v4 = (unint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      unint64_t v6 = *v4;
      outlined copy of Data._Representation(v5, *v4);
      Data._bridgeToObjectiveC()();
      outlined consume of Data._Representation(v5, v6);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t _CMFormatDescriptionInitTrampoline.init(hevcParameterSets:nalUnitHeaderLength:extensions:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  formatDescriptionOut[1] = *(CMFormatDescriptionRef *)MEMORY[0x1E4F143B8];
  uint64_t v8 = *a3;
  if (specialized Sequence<>.contains(_:)(a2, (uint64_t)&outlined read-only object #0 of _CMFormatDescriptionInitTrampoline.init(hevcParameterSets:nalUnitHeaderLength:extensions:)))
  {
    uint64_t v31 = a4;
    uint64_t v32 = a5;
    unint64_t v9 = specialized _arrayForceCast<A, B>(_:)(a1);
    int64_t v10 = *(void *)(a1 + 16);
    swift_bridgeObjectRelease();
    size_t v11 = (char *)MEMORY[0x1E4FBC860];
    uint64_t v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v10, 0, MEMORY[0x1E4FBC860]);
    parameterSetCMItemCount Count = v10;
    uint64_t v13 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v10, 0, v11);
    if (v9 >> 62) {
      goto LABEL_30;
    }
    uint64_t v14 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    while (1)
    {
      uint64_t v34 = v8;
      unint64_t v37 = v9;
      if (!v14) {
        break;
      }
      unint64_t v36 = v9 & 0xC000000000000001;
      uint64_t v15 = 4;
      while (1)
      {
        CFDataRef v16 = v36
            ? (const __CFData *)MEMORY[0x1C188D620](v15 - 4, v9)
            : (const __CFData *)*(id *)(v9 + 8 * v15);
        unint64_t v9 = (unint64_t)v16;
        uint64_t v17 = v15 - 3;
        if (__OFADD__(v15 - 4, 1)) {
          break;
        }
        uint64_t v8 = v14;
        BytePtr = CFDataGetBytePtr(v16);
        if (!BytePtr) {
          goto LABEL_33;
        }
        unint64_t v19 = BytePtr;
        unint64_t v21 = *((void *)v12 + 2);
        unint64_t v20 = *((void *)v12 + 3);
        if (v21 >= v20 >> 1) {
          uint64_t v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v20 > 1), v21 + 1, 1, v12);
        }
        *((void *)v12 + 2) = v21 + 1;
        *(void *)&v12[8 * v21 + 32] = v19;
        CFIndex Length = CFDataGetLength((CFDataRef)v9);
        unint64_t v24 = *((void *)v13 + 2);
        unint64_t v23 = *((void *)v13 + 3);
        if (v24 >= v23 >> 1) {
          uint64_t v13 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v23 > 1), v24 + 1, 1, v13);
        }
        *((void *)v13 + 2) = v24 + 1;
        *(void *)&v13[8 * v24 + 32] = Length;

        ++v15;
        unint64_t v9 = v37;
        if (v17 == v14) {
          goto LABEL_20;
        }
      }
      __break(1u);
LABEL_30:
      swift_bridgeObjectRetain();
      uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
    }
LABEL_20:
    swift_bridgeObjectRelease();
    formatDescriptionOut[0] = 0;
    if (a2 < (uint64_t)0xFFFFFFFF80000000)
    {
      __break(1u);
    }
    else if (a2 <= 0x7FFFFFFF)
    {
      CFAllocatorRef v26 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      if (v34)
      {
        type metadata accessor for CFStringRef(0);
        _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v27.super.CFArrayRef isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v27.super.CFArrayRef isa = 0;
      }
      OSStatus v28 = CMVideoFormatDescriptionCreateFromHEVCParameterSets(v26, parameterSetCount, (const uint8_t *const *)v12 + 4, (const size_t *)v13 + 4, a2, v27.super.isa, formatDescriptionOut);

      CMFormatDescriptionRef v29 = formatDescriptionOut[0];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v28 == noErr.getter())
      {
        uint64_t result = swift_bridgeObjectRelease();
        if (v29)
        {
          (*(void (**)(CMFormatDescriptionRef, uint64_t))(v32 + 8))(v29, v31);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
        else
        {
          __break(1u);
        }
      }
      else
      {
        id v30 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
        [v30 initWithDomain:*MEMORY[0x1E4F28760] code:v28 userInfo:0];
        swift_willThrow();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      return result;
    }
    __break(1u);
LABEL_33:
    __break(1u);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (one-time initialization token for invalidParameter != -1) {
    swift_once();
  }
  (id)static CMFormatDescriptionRef.Error.invalidParameter;
  return swift_willThrow();
}

void _CMFormatDescriptionInitTrampoline.init(taggedBuffers:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[1] = *(CMTaggedBufferGroupFormatDescriptionRef *)MEMORY[0x1E4F143B8];
  v7[0] = 0;
  uint64_t v4 = (OpaqueCMTaggedBufferGroup *)Array<A>.taggedBufferGroup.getter(a1);
  swift_bridgeObjectRelease();
  CMTaggedBufferGroupFormatDescriptionCreateForTaggedBufferGroup((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v4, v7);
  if (!v7[0]) {
    __break(1u);
  }
  uint64_t v5 = *(void (**)(void))(a3 + 8);
  unint64_t v6 = v7[0];
  v5();
}

uint64_t _CMFormatDescriptionInitTrampoline.init(muxedStreamType:extensions:)(CMMuxedStreamType *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  v14[1] = *(CMMuxedFormatDescriptionRef *)MEMORY[0x1E4F143B8];
  CMMuxedStreamType v6 = *a1;
  uint64_t v7 = *a2;
  v14[0] = 0;
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (v7)
  {
    type metadata accessor for CFStringRef(0);
    _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
    swift_bridgeObjectRetain();
    v9.super.CFArrayRef isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.CFArrayRef isa = 0;
  }
  OSStatus v10 = CMMuxedFormatDescriptionCreate(v8, v6, v9.super.isa, v14);

  CMMuxedFormatDescriptionRef v11 = v14[0];
  if (v10 == noErr.getter())
  {
    uint64_t result = swift_bridgeObjectRelease();
    if (v11) {
      return (*(uint64_t (**)(CMMuxedFormatDescriptionRef, uint64_t, uint64_t))(a4 + 8))(v11, a3, a4);
    }
    else {
      __break(1u);
    }
  }
  else
  {
    id v13 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v13 initWithDomain:*MEMORY[0x1E4F28760] code:v10 userInfo:0];
    swift_willThrow();

    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _CMFormatDescriptionInitTrampoline.init(timeCodeFormatType:frameDuration:frameQuanta:flags:extensions:)(CMTimeCodeFormatType *a1, CMTimeValue a2, unint64_t a3, CMTimeEpoch a4, unint64_t a5, uint32_t *a6, uint64_t *a7, uint64_t a8, uint64_t a9)
{
  formatDescriptionOut[1] = *(CMTimeCodeFormatDescriptionRef *)MEMORY[0x1E4F143B8];
  uint64_t v9 = *a7;
  if (HIDWORD(a5))
  {
    swift_bridgeObjectRelease();
    if (one-time initialization token for invalidParameter != -1) {
      swift_once();
    }
    (id)static CMFormatDescriptionRef.Error.invalidParameter;
    return swift_willThrow();
  }
  else
  {
    uint32_t v11 = a5;
    CMTimeScale v13 = a3;
    unint64_t v15 = HIDWORD(a3);
    CMTimeCodeFormatType v16 = *a1;
    uint32_t v17 = *a6;
    formatDescriptionOut[0] = 0;
    CFAllocatorRef v18 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    if (v9)
    {
      uint32_t v23 = v17;
      CMTimeCodeFormatType v24 = v16;
      type metadata accessor for CFStringRef(0);
      _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
      swift_bridgeObjectRetain();
      v19.super.CFArrayRef isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      uint32_t v17 = v23;
      CMTimeCodeFormatType v16 = v24;
    }
    else
    {
      v19.super.CFArrayRef isa = 0;
    }
    frameDuration.CMTagValue value = a2;
    frameDuration.CMTimeScale timescale = v13;
    frameDuration.CMTimeFlags flags = v15;
    frameDuration.CMTimeEpoch epoch = a4;
    OSStatus v20 = CMTimeCodeFormatDescriptionCreate(v18, v16, &frameDuration, v11, v17, v19.super.isa, formatDescriptionOut);

    CMTimeCodeFormatDescriptionRef v21 = formatDescriptionOut[0];
    if (v20 == noErr.getter())
    {
      uint64_t result = swift_bridgeObjectRelease();
      if (v21) {
        return (*(uint64_t (**)(CMTimeCodeFormatDescriptionRef, uint64_t))(a9 + 8))(v21, a8);
      }
      else {
        __break(1u);
      }
    }
    else
    {
      id v22 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
      [v22 initWithDomain:*MEMORY[0x1E4F28760] code:v20 userInfo:0];
      swift_willThrow();

      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

void _CMFormatDescriptionInitTrampoline.init(metadataFormatType:)(CMMetadataFormatType *a1, uint64_t a2, uint64_t a3)
{
  v9[1] = *(CMMetadataFormatDescriptionRef *)MEMORY[0x1E4F143B8];
  CMMetadataFormatType v5 = *a1;
  v9[0] = 0;
  OSStatus v6 = CMMetadataFormatDescriptionCreateWithKeys((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v5, 0, v9);
  CMMetadataFormatDescriptionRef v7 = v9[0];
  if (v6 == noErr.getter())
  {
    if (v7) {
      (*(void (**)(CMMetadataFormatDescriptionRef, uint64_t, uint64_t))(a3 + 8))(v7, a2, a3);
    }
    else {
      __break(1u);
    }
  }
  else
  {
    id v8 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v8 initWithDomain:MEMORY[0x1E4F28760] code:v6 userInfo:0];
    swift_willThrow();
  }
}

uint64_t _CMFormatDescriptionInitTrampoline.init(boxedMetadataKeys:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _CMFormatDescriptionInitTrampoline.init(boxedMetadataKeys:)(a1, a2, a3, MEMORY[0x1E4F1EA78]);
}

uint64_t _CMFormatDescriptionInitTrampoline.init(boxedMetadataSpecifications:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _CMFormatDescriptionInitTrampoline.init(boxedMetadataKeys:)(a1, a2, a3, MEMORY[0x1E4F1EA80]);
}

uint64_t _CMFormatDescriptionInitTrampoline.init(boxedMetadataKeys:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, Class, void *))
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v13[0] = 0;
  uint64_t v7 = *MEMORY[0x1E4F1CF80];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Swift.AnyObject]);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  int v9 = a4(v7, 1835360888, isa, v13);

  OSStatus v10 = (void *)v13[0];
  if (v9 == noErr.getter())
  {
    uint64_t result = swift_bridgeObjectRelease();
    if (v10) {
      return (*(uint64_t (**)(void *, uint64_t, uint64_t))(a3 + 8))(v10, a2, a3);
    }
    else {
      __break(1u);
    }
  }
  else
  {
    id v12 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v12 initWithDomain:MEMORY[0x1E4F28760] code:v9 userInfo:nil];
    swift_willThrow();

    return swift_bridgeObjectRelease();
  }
  return result;
}

void _CMFormatDescriptionInitTrampoline.init(sourceMetadata:specifications:)(const opaqueCMFormatDescription *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  formatDescriptionOut[1] = *(CMMetadataFormatDescriptionRef *)MEMORY[0x1E4F143B8];
  formatDescriptionOut[0] = 0;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Swift.AnyObject]);
  CFArrayRef isa = Array._bridgeToObjectiveC()().super.isa;
  OSStatus v8 = CMMetadataFormatDescriptionCreateWithMetadataFormatDescriptionAndMetadataSpecifications(v6, a1, isa, formatDescriptionOut);

  CMMetadataFormatDescriptionRef v9 = formatDescriptionOut[0];
  if (v8 == noErr.getter())
  {
    swift_bridgeObjectRelease();
    if (v9)
    {
      OSStatus v10 = *(void (**)(void))(a4 + 8);
      uint32_t v11 = v9;
      v10();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    id v12 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v12 initWithDomain:*MEMORY[0x1E4F28760] code:v8 userInfo:0];
    swift_willThrow();

    swift_bridgeObjectRelease();
  }
}

void _CMFormatDescriptionInitTrampoline.init(sourceMetadata:otherSourceDescription:)(CMMetadataFormatDescriptionRef sourceDescription, CMMetadataFormatDescriptionRef otherSourceDescription, uint64_t a3, uint64_t a4)
{
  formatDescriptionOut[1] = *(CMMetadataFormatDescriptionRef *)MEMORY[0x1E4F143B8];
  formatDescriptionOut[0] = 0;
  OSStatus v7 = CMMetadataFormatDescriptionCreateByMergingMetadataFormatDescriptions((CFAllocatorRef)*MEMORY[0x1E4F1CF80], sourceDescription, otherSourceDescription, formatDescriptionOut);
  CMMetadataFormatDescriptionRef v8 = formatDescriptionOut[0];
  if (v7 == noErr.getter())
  {
    CMMetadataFormatDescriptionRef v12 = otherSourceDescription;
    if (v8)
    {
      CMMetadataFormatDescriptionRef v9 = *(void (**)(void))(a4 + 8);
      OSStatus v10 = v8;
      v9();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    id v11 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v11 initWithDomain:*MEMORY[0x1E4F28760] code:v7 userInfo:0];
    swift_willThrow();
  }
}

id static CMFormatDescriptionRef.Error.invalidParameter.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for invalidParameter, (void **)&static CMFormatDescriptionRef.Error.invalidParameter);
}

id static CMFormatDescriptionRef.Error.allocationFailed.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for allocationFailed, (void **)&static CMFormatDescriptionRef.Error.allocationFailed);
}

id one-time initialization function for valueNotAvailable()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:MEMORY[0x1E4F28760] code:-12718 userInfo:0];
  static CMFormatDescriptionRef.Error.valueNotAvailable = (uint64_t)result;
  return result;
}

id static CMFormatDescriptionRef.Error.valueNotAvailable.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for valueNotAvailable, (void **)&static CMFormatDescriptionRef.Error.valueNotAvailable);
}

uint64_t _CMFormatDescriptionFourCCConvertible.init(string:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Optional();
  MEMORY[0x1F4188790](v4 - 8);
  CFAllocatorRef v6 = (char *)v12 - v5;
  uint64_t v7 = String.utf8CString.getter();
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v9 = *(void *)(v7 + 16);
  if (v9 < 2 || ((v9 - 1) & 0x7FFFFFFFFFFFFFFFLL) != 4) {
    goto LABEL_18;
  }
  if (*(char *)(v7 + 32) < 0 || *(char *)(v7 + 33) < 0 || *(char *)(v7 + 34) < 0 || *(char *)(v7 + 35) < 0)
  {
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(char *)(v7 + 32) < 0 || *(char *)(v7 + 33) < 0 || *(char *)(v7 + 34) < 0 || *(char *)(v7 + 35) < 0) {
    goto LABEL_17;
  }
  v12[3] = *(unsigned __int8 *)(v7 + 35) | (((*(unsigned __int8 *)(v7 + 33) << 8) | (*(unsigned __int8 *)(v7 + 32) << 16) | *(unsigned __int8 *)(v7 + 34)) << 8);
  dispatch thunk of RawRepresentable.init(rawValue:)();
  uint64_t v11 = *(void *)(a1 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v6, 1, a1);
  if (result != 1)
  {
    swift_unknownObjectRelease();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a2, v6, a1);
  }
LABEL_19:
  __break(1u);
  return result;
}

uint64_t CMFormatDescriptionRef.MediaType.rawValue.getter()
{
  return *v0;
}

uint64_t CMFormatDescriptionRef.MediaType.rawValue.setter(uint64_t result)
{
  *Swift::UInt v1 = result;
  return result;
}

uint64_t (*CMFormatDescriptionRef.MediaType.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

void static CMFormatDescriptionRef.MediaType.video.getter(_DWORD *a1@<X8>)
{
  *a1 = 1986618469;
}

void static CMFormatDescriptionRef.MediaType.audio.getter(_DWORD *a1@<X8>)
{
  *a1 = 1936684398;
}

void static CMFormatDescriptionRef.MediaType.muxed.getter(_DWORD *a1@<X8>)
{
  *a1 = 1836415096;
}

void static CMFormatDescriptionRef.MediaType.text.getter(_DWORD *a1@<X8>)
{
  *a1 = 1952807028;
}

void static CMFormatDescriptionRef.MediaType.closedCaption.getter(_DWORD *a1@<X8>)
{
  *a1 = 1668047728;
}

void static CMFormatDescriptionRef.MediaType.subtitle.getter(_DWORD *a1@<X8>)
{
  *a1 = 1935832172;
}

void static CMFormatDescriptionRef.MediaType.timeCode.getter(_DWORD *a1@<X8>)
{
  *a1 = 1953325924;
}

void static CMFormatDescriptionRef.MediaType.metadata.getter(_DWORD *a1@<X8>)
{
  *a1 = 1835365473;
}

void static CMFormatDescriptionRef.MediaType.taggedBufferGroup.getter(_DWORD *a1@<X8>)
{
  *a1 = 1952606066;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CMFormatDescriptionRef.MediaType()
{
  return specialized _CMFormatDescriptionFourCCConvertible.description.getter(*v0);
}

uint64_t CMFormatDescriptionRef.MediaSubType.rawValue.getter()
{
  return *v0;
}

uint64_t (*CMFormatDescriptionRef.MediaSubType.rawValue.modify())()
{
  return CMTimebaseRef.NotificationKey.rawValue.modify;
}

void static CMFormatDescriptionRef.MediaSubType.linearPCM.getter(_DWORD *a1@<X8>)
{
  *a1 = 1819304813;
}

void static CMFormatDescriptionRef.MediaSubType.ac3.getter(_DWORD *a1@<X8>)
{
  *a1 = 1633889587;
}

void static CMFormatDescriptionRef.MediaSubType.iec60958AC3.getter(_DWORD *a1@<X8>)
{
  *a1 = 1667326771;
}

void static CMFormatDescriptionRef.MediaSubType.appleIMA4.getter(_DWORD *a1@<X8>)
{
  *a1 = 1768775988;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg4AAC.getter(_DWORD *a1@<X8>)
{
  *a1 = 1633772320;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg4CELP.getter(_DWORD *a1@<X8>)
{
  *a1 = 1667591280;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg4HVXC.getter(_DWORD *a1@<X8>)
{
  *a1 = 1752594531;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg4TwinVQ.getter(_DWORD *a1@<X8>)
{
  *a1 = 1953986161;
}

void static CMFormatDescriptionRef.MediaSubType.mace3.getter(_DWORD *a1@<X8>)
{
  *a1 = 1296122675;
}

void static CMFormatDescriptionRef.MediaSubType.mace6.getter(_DWORD *a1@<X8>)
{
  *a1 = 1296122678;
}

void static CMFormatDescriptionRef.MediaSubType.uLaw.getter(_DWORD *a1@<X8>)
{
  *a1 = 1970037111;
}

void static CMFormatDescriptionRef.MediaSubType.aLaw.getter(_DWORD *a1@<X8>)
{
  *a1 = 1634492791;
}

void static CMFormatDescriptionRef.MediaSubType.qDesign.getter(_DWORD *a1@<X8>)
{
  *a1 = 1363430723;
}

void static CMFormatDescriptionRef.MediaSubType.qDesign2.getter(_DWORD *a1@<X8>)
{
  *a1 = 1363430706;
}

void static CMFormatDescriptionRef.MediaSubType.qualcomm.getter(_DWORD *a1@<X8>)
{
  *a1 = 1365470320;
}

void static CMFormatDescriptionRef.MediaSubType.mpegLayer1.getter(_DWORD *a1@<X8>)
{
  *a1 = 778924081;
}

void static CMFormatDescriptionRef.MediaSubType.mpegLayer2.getter(_DWORD *a1@<X8>)
{
  *a1 = 778924082;
}

void static CMFormatDescriptionRef.MediaSubType.mpegLayer3.getter(_DWORD *a1@<X8>)
{
  *a1 = 778924083;
}

void static CMFormatDescriptionRef.MediaSubType.timeCode.getter(_DWORD *a1@<X8>)
{
  *a1 = 1953066341;
}

void static CMFormatDescriptionRef.MediaSubType.midiStream.getter(_DWORD *a1@<X8>)
{
  *a1 = 1835623529;
}

void static CMFormatDescriptionRef.MediaSubType.parameterValueStream.getter(_DWORD *a1@<X8>)
{
  *a1 = 1634760307;
}

void static CMFormatDescriptionRef.MediaSubType.appleLossless.getter(_DWORD *a1@<X8>)
{
  *a1 = 1634492771;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg4AAC_HE.getter(_DWORD *a1@<X8>)
{
  *a1 = 1633772392;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg4AAC_LD.getter(_DWORD *a1@<X8>)
{
  *a1 = 1633772396;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg4AAC_ELD.getter(_DWORD *a1@<X8>)
{
  *a1 = 1633772389;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg4AAC_ELD_SBR.getter(_DWORD *a1@<X8>)
{
  *a1 = 1633772390;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg4AAC_ELD_V2.getter(_DWORD *a1@<X8>)
{
  *a1 = 1633772391;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg4AAC_HE_V2.getter(_DWORD *a1@<X8>)
{
  *a1 = 1633772400;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg4AAC_Spatial.getter(_DWORD *a1@<X8>)
{
  *a1 = 1633772403;
}

void static CMFormatDescriptionRef.MediaSubType.mpegD_USAC.getter(_DWORD *a1@<X8>)
{
  *a1 = 1970495843;
}

void static CMFormatDescriptionRef.MediaSubType.amr.getter(_DWORD *a1@<X8>)
{
  *a1 = 1935764850;
}

void static CMFormatDescriptionRef.MediaSubType.amr_WB.getter(_DWORD *a1@<X8>)
{
  *a1 = 1935767394;
}

void static CMFormatDescriptionRef.MediaSubType.audible.getter(_DWORD *a1@<X8>)
{
  *a1 = 1096107074;
}

void static CMFormatDescriptionRef.MediaSubType.iLBC.getter(_DWORD *a1@<X8>)
{
  *a1 = 1768710755;
}

void static CMFormatDescriptionRef.MediaSubType.dviIntelIMA.getter(_DWORD *a1@<X8>)
{
  *a1 = 1836253201;
}

void static CMFormatDescriptionRef.MediaSubType.microsoftGSM.getter(_DWORD *a1@<X8>)
{
  *a1 = 1836253233;
}

void static CMFormatDescriptionRef.MediaSubType.aes3.getter(_DWORD *a1@<X8>)
{
  *a1 = 1634038579;
}

void static CMFormatDescriptionRef.MediaSubType.enhancedAC3.getter(_DWORD *a1@<X8>)
{
  *a1 = 1700998451;
}

void static CMFormatDescriptionRef.MediaSubType.flac.getter(_DWORD *a1@<X8>)
{
  *a1 = 1718378851;
}

void static CMFormatDescriptionRef.MediaSubType.opus.getter(_DWORD *a1@<X8>)
{
  *a1 = 1869641075;
}

void static CMFormatDescriptionRef.MediaSubType.aacLCProtected.getter(_DWORD *a1@<X8>)
{
  *a1 = 1885430115;
}

void static CMFormatDescriptionRef.MediaSubType.aacAudibleProtected.getter(_DWORD *a1@<X8>)
{
  *a1 = 1633771875;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_32ARGB.getter(_DWORD *a1@<X8>)
{
  *a1 = 32;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_32BGRA.getter(_DWORD *a1@<X8>)
{
  *a1 = 1111970369;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_24RGB.getter(_DWORD *a1@<X8>)
{
  *a1 = 24;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_16BE555.getter(_DWORD *a1@<X8>)
{
  *a1 = 16;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_16BE565.getter(_DWORD *a1@<X8>)
{
  *a1 = 1110783541;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_16LE555.getter(_DWORD *a1@<X8>)
{
  *a1 = 1278555445;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_16LE565.getter(_DWORD *a1@<X8>)
{
  *a1 = 1278555701;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_16LE5551.getter(_DWORD *a1@<X8>)
{
  *a1 = 892679473;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_422YpCbCr8.getter(_DWORD *a1@<X8>)
{
  *a1 = 846624121;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_422YpCbCr8_yuvs.getter(_DWORD *a1@<X8>)
{
  *a1 = 2037741171;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_444YpCbCr8.getter(_DWORD *a1@<X8>)
{
  *a1 = 1983066168;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_4444YpCbCrA8.getter(_DWORD *a1@<X8>)
{
  *a1 = 1983131704;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_422YpCbCr16.getter(_DWORD *a1@<X8>)
{
  *a1 = 1983000886;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_422YpCbCr10.getter(_DWORD *a1@<X8>)
{
  *a1 = 1983000880;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_444YpCbCr10.getter(_DWORD *a1@<X8>)
{
  *a1 = 1983131952;
}

void static CMFormatDescriptionRef.MediaSubType.pixelFormat_8IndexedGray_WhiteIsZero.getter(_DWORD *a1@<X8>)
{
  *a1 = 40;
}

void static CMFormatDescriptionRef.MediaSubType.animation.getter(_DWORD *a1@<X8>)
{
  *a1 = 1919706400;
}

void static CMFormatDescriptionRef.MediaSubType.cinepak.getter(_DWORD *a1@<X8>)
{
  *a1 = 1668704612;
}

void static CMFormatDescriptionRef.MediaSubType.jpeg.getter(_DWORD *a1@<X8>)
{
  *a1 = 1785750887;
}

void static CMFormatDescriptionRef.MediaSubType.jpeg_OpenDML.getter(_DWORD *a1@<X8>)
{
  *a1 = 1684890161;
}

void static CMFormatDescriptionRef.MediaSubType.sorensonVideo.getter(_DWORD *a1@<X8>)
{
  *a1 = 1398165809;
}

void static CMFormatDescriptionRef.MediaSubType.sorensonVideo3.getter(_DWORD *a1@<X8>)
{
  *a1 = 1398165811;
}

void static CMFormatDescriptionRef.MediaSubType.h263.getter(_DWORD *a1@<X8>)
{
  *a1 = 1748121139;
}

void static CMFormatDescriptionRef.MediaSubType.h264.getter(_DWORD *a1@<X8>)
{
  *a1 = 1635148593;
}

void static CMFormatDescriptionRef.MediaSubType.hevc.getter(_DWORD *a1@<X8>)
{
  *a1 = 1752589105;
}

void static CMFormatDescriptionRef.MediaSubType.hevcWithAlpha.getter(_DWORD *a1@<X8>)
{
  *a1 = 1836415073;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg4Video.getter(_DWORD *a1@<X8>)
{
  *a1 = 1836070006;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg2Video.getter(_DWORD *a1@<X8>)
{
  *a1 = 1836069494;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg1Video.getter(_DWORD *a1@<X8>)
{
  *a1 = 1836069238;
}

void static CMFormatDescriptionRef.MediaSubType.dvcNTSC.getter(_DWORD *a1@<X8>)
{
  *a1 = 1685480224;
}

void static CMFormatDescriptionRef.MediaSubType.dvcPAL.getter(_DWORD *a1@<X8>)
{
  *a1 = 1685480304;
}

void static CMFormatDescriptionRef.MediaSubType.dvcProPAL.getter(_DWORD *a1@<X8>)
{
  *a1 = 1685483632;
}

void static CMFormatDescriptionRef.MediaSubType.dvcPro50NTSC.getter(_DWORD *a1@<X8>)
{
  *a1 = 1685468526;
}

void static CMFormatDescriptionRef.MediaSubType.dvcPro50PAL.getter(_DWORD *a1@<X8>)
{
  *a1 = 1685468528;
}

void static CMFormatDescriptionRef.MediaSubType.dvcPROHD720p60.getter(_DWORD *a1@<X8>)
{
  *a1 = 1685481584;
}

void static CMFormatDescriptionRef.MediaSubType.dvcPROHD720p50.getter(_DWORD *a1@<X8>)
{
  *a1 = 1685481585;
}

void static CMFormatDescriptionRef.MediaSubType.dvcPROHD1080i60.getter(_DWORD *a1@<X8>)
{
  *a1 = 1685481526;
}

void static CMFormatDescriptionRef.MediaSubType.dvcPROHD1080i50.getter(_DWORD *a1@<X8>)
{
  *a1 = 1685481525;
}

void static CMFormatDescriptionRef.MediaSubType.dvcPROHD1080p30.getter(_DWORD *a1@<X8>)
{
  *a1 = 1685481523;
}

void static CMFormatDescriptionRef.MediaSubType.dvcPROHD1080p25.getter(_DWORD *a1@<X8>)
{
  *a1 = 1685481522;
}

void static CMFormatDescriptionRef.MediaSubType.proRes4444XQ.getter(_DWORD *a1@<X8>)
{
  *a1 = 1634743416;
}

void static CMFormatDescriptionRef.MediaSubType.proRes4444.getter(_DWORD *a1@<X8>)
{
  *a1 = 1634743400;
}

void static CMFormatDescriptionRef.MediaSubType.proRes422HQ.getter(_DWORD *a1@<X8>)
{
  *a1 = 1634755432;
}

void static CMFormatDescriptionRef.MediaSubType.proRes422.getter(_DWORD *a1@<X8>)
{
  *a1 = 1634755438;
}

void static CMFormatDescriptionRef.MediaSubType.proRes422LT.getter(_DWORD *a1@<X8>)
{
  *a1 = 1634755443;
}

void static CMFormatDescriptionRef.MediaSubType.proRes422Proxy.getter(_DWORD *a1@<X8>)
{
  *a1 = 1634755439;
}

void static CMFormatDescriptionRef.MediaSubType.proResRAW.getter(_DWORD *a1@<X8>)
{
  *a1 = 1634759278;
}

void static CMFormatDescriptionRef.MediaSubType.proResRAWHQ.getter(_DWORD *a1@<X8>)
{
  *a1 = 1634759272;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg1System.getter(_DWORD *a1@<X8>)
{
  *a1 = 1836069235;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg2Transport.getter(_DWORD *a1@<X8>)
{
  *a1 = 1836069492;
}

void static CMFormatDescriptionRef.MediaSubType.mpeg2Program.getter(_DWORD *a1@<X8>)
{
  *a1 = 1836069488;
}

void static CMFormatDescriptionRef.MediaSubType.dv.getter(_DWORD *a1@<X8>)
{
  *a1 = 1685463072;
}

void static CMFormatDescriptionRef.MediaSubType.embeddedDeviceScreenRecording.getter(_DWORD *a1@<X8>)
{
  *a1 = 1769173536;
}

void static CMFormatDescriptionRef.MediaSubType.cea608.getter(_DWORD *a1@<X8>)
{
  *a1 = 1664495672;
}

void static CMFormatDescriptionRef.MediaSubType.cea708.getter(_DWORD *a1@<X8>)
{
  *a1 = 1664561208;
}

void static CMFormatDescriptionRef.MediaSubType.atsc.getter(_DWORD *a1@<X8>)
{
  *a1 = 1635017571;
}

void static CMFormatDescriptionRef.MediaSubType.mobile3GPP.getter(_DWORD *a1@<X8>)
{
  *a1 = 1954034535;
}

void static CMFormatDescriptionRef.MediaSubType.webVTT.getter(_DWORD *a1@<X8>)
{
  *a1 = 2004251764;
}

void static CMFormatDescriptionRef.MediaSubType.timeCode64.getter(_DWORD *a1@<X8>)
{
  *a1 = 1952658996;
}

void static CMFormatDescriptionRef.MediaSubType.counter32.getter(_DWORD *a1@<X8>)
{
  *a1 = 1668166450;
}

void static CMFormatDescriptionRef.MediaSubType.counter64.getter(_DWORD *a1@<X8>)
{
  *a1 = 1668167220;
}

void static CMFormatDescriptionRef.MediaSubType.icy.getter(_DWORD *a1@<X8>)
{
  *a1 = 1768126752;
}

void static CMFormatDescriptionRef.MediaSubType.id3.getter(_DWORD *a1@<X8>)
{
  *a1 = 1768174368;
}

void static CMFormatDescriptionRef.MediaSubType.boxed.getter(_DWORD *a1@<X8>)
{
  *a1 = 1835360888;
}

void static CMFormatDescriptionRef.MediaSubType.emsg.getter(_DWORD *a1@<X8>)
{
  *a1 = 1701671783;
}

Swift::Bool __swiftcall CMFormatDescriptionRef.equalTo(_:extensionKeysToIgnore:sampleDescriptionExtensionAtomKeysToIgnore:)(CMFormatDescriptionRef _, Swift::OpaquePointer extensionKeysToIgnore, Swift::OpaquePointer sampleDescriptionExtensionAtomKeysToIgnore)
{
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  Class v6 = Array._bridgeToObjectiveC()().super.isa;
  int v7 = CMFormatDescriptionEqualIgnoringExtensionKeys(v3, _, isa, v6);

  return v7 != 0;
}

uint64_t CMFormatDescriptionRef.mediaType.getter@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = CMFormatDescriptionGetMediaType(v1);
  *a1 = result;
  return result;
}

uint64_t CMFormatDescriptionRef.mediaSubType.getter@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = CMFormatDescriptionGetMediaSubType(v1);
  *a1 = result;
  return result;
}

void CMFormatDescriptionRef.extensions.getter(void *a1@<X8>)
{
  CFDictionaryRef v3 = CMFormatDescriptionGetExtensions(v1);
  uint64_t v4 = MEMORY[0x1E4FBC868];
  if (v3)
  {
    CFDictionaryRef v5 = v3;
    type metadata accessor for CFStringRef(0);
    _sSo11CFStringRefaABSHSCWlTm_0(&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
    CFDictionaryRef v6 = v5;
    static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
  }
  *a1 = v4;
}

BOOL static CMFormatDescriptionRef.== infix(_:_:)(const opaqueCMFormatDescription *a1, const opaqueCMFormatDescription *a2)
{
  return CMFormatDescriptionEqual(a1, a2) != 0;
}

const AudioStreamBasicDescription *CMFormatDescriptionRef.audioStreamBasicDescription.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = CMAudioFormatDescriptionGetStreamBasicDescription(v1);
  if (result)
  {
    long long v4 = *(_OWORD *)&result->mSampleRate;
    long long v5 = *(_OWORD *)&result->mBytesPerPacket;
    uint64_t v6 = *(void *)&result->mBitsPerChannel;
  }
  else
  {
    uint64_t v6 = 0;
    long long v4 = 0uLL;
    long long v5 = 0uLL;
  }
  *(_OWORD *)a1 = v4;
  *(_OWORD *)(a1 + 16) = v5;
  *(void *)(a1 + 32) = v6;
  *(unsigned char *)(a1 + 40) = result == 0;
  return result;
}

uint64_t CMFormatDescriptionRef.withMagicCookie<A>(_:)(uint64_t (*a1)(const void *, size_t, BOOL))
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  MagicCookie = CMAudioFormatDescriptionGetMagicCookie(v1, v6);
  if (MagicCookie) {
    size_t v4 = (size_t)MagicCookie + v6[0];
  }
  else {
    size_t v4 = 0;
  }
  return a1(MagicCookie, v4, MagicCookie == 0);
}

unsigned char *CMFormatDescriptionRef.magicCookie.getter()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  uint64_t result = CMAudioFormatDescriptionGetMagicCookie(v0, v2);
  if (result) {
    return (unsigned char *)specialized Data.init(bytes:count:)(result, v2[0]);
  }
  return result;
}

uint64_t CMFormatDescriptionRef.audioChannelLayout.getter@<X0>(uint64_t a1@<X8>)
{
  sizeOut[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = type metadata accessor for AudioChannelLayout.UnsafePointer();
  MEMORY[0x1F4188790](v3 - 8);
  sizeOut[0] = 0;
  if (CMAudioFormatDescriptionGetChannelLayout((CMAudioFormatDescriptionRef)v1, sizeOut))
  {
    UnsafeMutableAudioBufferListPointer.init(_:)();
    *(void *)(swift_allocObject() + 16) = v1;
    id v4 = v1;
    ManagedAudioChannelLayout.init(audioChannelLayoutPointer:deallocator:)();
    uint64_t v5 = type metadata accessor for ManagedAudioChannelLayout();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(a1, 0, 1, v5);
  }
  else
  {
    uint64_t v7 = type metadata accessor for ManagedAudioChannelLayout();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(a1, 1, 1, v7);
  }
}

void *CMFormatDescriptionRef.audioFormatList.getter()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  FormatList = CMAudioFormatDescriptionGetFormatList(v0, v3);
  if (FormatList) {
    return specialized _copyCollectionToContiguousArray<A>(_:)(FormatList, (int64_t)v3[0] / 48);
  }
  else {
    return (void *)MEMORY[0x1E4FBC860];
  }
}

uint64_t CMFormatDescriptionRef.richestDecodableFormat.getter@<X0>(uint64_t a1@<X8>)
{
  return CMFormatDescriptionRef.richestDecodableFormat.getter(MEMORY[0x1E4F1EA10], a1);
}

uint64_t CMFormatDescriptionRef.mostCompatibleFormat.getter@<X0>(uint64_t a1@<X8>)
{
  return CMFormatDescriptionRef.richestDecodableFormat.getter(MEMORY[0x1E4F1EA08], a1);
}

uint64_t CMFormatDescriptionRef.richestDecodableFormat.getter@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = a1(v2);
  if (result)
  {
    long long v5 = *(_OWORD *)result;
    long long v6 = *(_OWORD *)(result + 16);
    uint64_t v7 = *(void *)(result + 32);
    uint64_t v8 = *(unsigned int *)(result + 40);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    long long v5 = 0uLL;
    long long v6 = 0uLL;
  }
  *(_OWORD *)a2 = v5;
  *(_OWORD *)(a2 + 16) = v6;
  *(void *)(a2 + 32) = v7;
  *(void *)(a2 + 40) = v8;
  *(unsigned char *)(a2 + 48) = result == 0;
  return result;
}

uint64_t CMFormatDescriptionRef.EqualityMask.rawValue.getter()
{
  return *v0;
}

void static CMFormatDescriptionRef.EqualityMask.streamBasicDescription.getter(_DWORD *a1@<X8>)
{
  *a1 = 1;
}

void static CMFormatDescriptionRef.EqualityMask.magicCookie.getter(_DWORD *a1@<X8>)
{
  *a1 = 2;
}

void static CMFormatDescriptionRef.EqualityMask.channelLayout.getter(_DWORD *a1@<X8>)
{
  *a1 = 4;
}

void static CMFormatDescriptionRef.EqualityMask.extensions.getter(_DWORD *a1@<X8>)
{
  *a1 = 8;
}

void static CMFormatDescriptionRef.EqualityMask.all.getter(_DWORD *a1@<X8>)
{
  *a1 = 15;
}

BOOL CMFormatDescriptionRef.equalTo(_:equalityMask:)(CMAudioFormatDescriptionMask *a1, const opaqueCMFormatDescription *a2, CMAudioFormatDescriptionMask *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  CMAudioFormatDescriptionMask v5 = *a3;
  CMAudioFormatDescriptionMask equalityMaskOut = 0;
  BOOL result = CMAudioFormatDescriptionEqual(v3, a2, v5, &equalityMaskOut) != 0;
  *a1 = equalityMaskOut;
  return result;
}

uint64_t CMFormatDescriptionRef.ParameterSetCollection.startIndex.getter()
{
  return 0;
}

uint64_t CMFormatDescriptionRef.ParameterSetCollection.endIndex.getter()
{
  return *(void *)(*(void *)v0 + 16);
}

unint64_t CMFormatDescriptionRef.ParameterSetCollection.subscript.getter(unint64_t result)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)(*(void *)v1 + 16) > result)
  {
    uint64_t v2 = *(void *)v1 + 16 * result;
    uint64_t v3 = *(void *)(v2 + 32);
    outlined copy of Data._Representation(v3, *(void *)(v2 + 40));
    return v3;
  }
  __break(1u);
  return result;
}

unint64_t specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(unint64_t result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a4 + 16);
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

void *protocol witness for BidirectionalCollection.index(before:) in conformance CMFormatDescriptionRef.ParameterSetCollection@<X0>(void *result@<X0>, unint64_t *a2@<X8>)
{
  unint64_t v3 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else if (v3 < *(void *)(*(void *)v2 + 16))
  {
    *a2 = v3;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t *protocol witness for BidirectionalCollection.formIndex(before:) in conformance CMFormatDescriptionRef.ParameterSetCollection(unint64_t *result)
{
  unint64_t v2 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else if (v2 < *(void *)(*(void *)v1 + 16))
  {
    *BOOL result = v2;
    return result;
  }
  __break(1u);
  return result;
}

void protocol witness for Collection.startIndex.getter in conformance CMFormatDescriptionRef.ParameterSetCollection(void *a1@<X8>)
{
  *a1 = 0;
}

void protocol witness for Collection.endIndex.getter in conformance CMFormatDescriptionRef.ParameterSetCollection(void *a1@<X8>)
{
  *a1 = *(void *)(*(void *)v1 + 16);
}

uint64_t (*protocol witness for Collection.subscript.read in conformance CMFormatDescriptionRef.ParameterSetCollection(uint64_t (*result)(), unint64_t *a2))()
{
  unint64_t v3 = *a2;
  if ((*a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(void *)(*(void *)v2 + 16))
  {
    *(_OWORD *)BOOL result = *(_OWORD *)(*(void *)v2 + 16 * v3 + 32);
    return CMTimebaseRef.NotificationKey.rawValue.modify;
  }
  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection.subscript.getter in conformance CMFormatDescriptionRef.ParameterSetCollection@<X0>(uint64_t *result@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *result;
  if (*result < 0 || (v4 = result[1], BOOL result = *v2, (*v2)[2] < v4))
  {
    __break(1u);
  }
  else
  {
    a2[1] = v4;
    a2[2] = result;
    *a2 = v3;
    return (uint64_t *)swift_bridgeObjectRetain();
  }
  return result;
}

void protocol witness for Collection.indices.getter in conformance CMFormatDescriptionRef.ParameterSetCollection(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 16);
  *a1 = 0;
  a1[1] = v2;
}

BOOL protocol witness for Collection.isEmpty.getter in conformance CMFormatDescriptionRef.ParameterSetCollection()
{
  return *(void *)(*(void *)v0 + 16) == 0;
}

void *protocol witness for RandomAccessCollection.index(_:offsetBy:) in conformance CMFormatDescriptionRef.ParameterSetCollection@<X0>(void *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  unint64_t v4 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else if (v4 <= *(void *)(*(void *)v3 + 16))
  {
    *a3 = v4;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance CMFormatDescriptionRef.ParameterSetCollection@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t result = specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(*a1, a2, *a3, *v4);
  *(void *)a4 = result;
  *(unsigned char *)(a4 + 8) = v7 & 1;
  return result;
}

unint64_t *protocol witness for RandomAccessCollection.distance(from:to:) in conformance CMFormatDescriptionRef.ParameterSetCollection(unint64_t *result, unint64_t *a2)
{
  unint64_t v3 = *a2;
  unint64_t v4 = *(void *)(*(void *)v2 + 16);
  if (*result <= v4 && v3 <= v4) {
    return (unint64_t *)(v3 - *result);
  }
  __break(1u);
  return result;
}

void *protocol witness for Collection.index(after:) in conformance CMFormatDescriptionRef.ParameterSetCollection@<X0>(void *result@<X0>, void *a2@<X8>)
{
  if (*result >= *(void *)(*(void *)v2 + 16)) {
    __break(1u);
  }
  else {
    *a2 = *result + 1;
  }
  return result;
}

void *protocol witness for Collection.formIndex(after:) in conformance CMFormatDescriptionRef.ParameterSetCollection(void *result)
{
  if (*result >= *(void *)(*(void *)v1 + 16)) {
    __break(1u);
  }
  else {
    ++*result;
  }
  return result;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance CMFormatDescriptionRef.ParameterSetCollection()
{
  return *(void *)(*(void *)v0 + 16);
}

uint64_t *protocol witness for Sequence._copyToContiguousArray() in conformance CMFormatDescriptionRef.ParameterSetCollection()
{
  uint64_t v1 = specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
  swift_bridgeObjectRelease();
  return v1;
}

void *protocol witness for Sequence._copyContents(initializing:) in conformance CMFormatDescriptionRef.ParameterSetCollection(void *a1, uint64_t *a2, uint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

uint64_t CMFormatDescriptionRef.nalUnitHeaderLength.getter()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int NALUnitHeaderLengthOut = 0;
  int v1 = noErr.getter();
  if (v1 == CMVideoFormatDescriptionGetH264ParameterSetAtIndex(v0, 0, 0, 0, 0, &NALUnitHeaderLengthOut)) {
    return NALUnitHeaderLengthOut;
  }
  int v2 = noErr.getter();
  if (v2 == CMVideoFormatDescriptionGetHEVCParameterSetAtIndex(v0, 0, 0, 0, 0, &NALUnitHeaderLengthOut)) {
    return NALUnitHeaderLengthOut;
  }
  else {
    return 0;
  }
}

uint64_t CMFormatDescriptionRef.parameterSets.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = MEMORY[0x1E4FBC860];
  unint64_t v3 = (uint64_t *)(v2 + 16);
  v7[4] = partial apply for closure #1 in CMFormatDescriptionRef.parameterSets.getter;
  v7[5] = v2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 1107296256;
  CMTaggedBufferGroupFormatDescriptionRef v7[2] = thunk for @escaping @callee_guaranteed (@unowned Int, @unowned UnsafePointer<UInt8>, @unowned Int) -> ();
  v7[3] = &block_descriptor_1;
  unint64_t v4 = _Block_copy(v7);
  swift_retain();
  swift_release();
  FigVideoFormatDescriptionVisitAllParameterSets();
  _Block_release(v4);
  swift_beginAccess();
  uint64_t v5 = *v3;
  swift_bridgeObjectRetain();
  uint64_t result = swift_release();
  *a1 = v5;
  return result;
}

uint64_t closure #1 in CMFormatDescriptionRef.parameterSets.getter(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v8 = (uint64_t *)(a4 + 16);
  swift_beginAccess();
  if (*(void *)(*(void *)(v4 + 16) + 16) == a1)
  {
    a3 = specialized Data.init(bytes:count:)(a2, a3);
    a2 = v9;
    swift_beginAccess();
    uint64_t v4 = *v8;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v8 = v4;
    if (result) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v4 + 16) + 1, 1, (char *)v4);
  uint64_t v4 = result;
  *uint64_t v8 = result;
LABEL_3:
  unint64_t v12 = *(void *)(v4 + 16);
  unint64_t v11 = *(void *)(v4 + 24);
  if (v12 >= v11 >> 1)
  {
    uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1, (char *)v4);
    uint64_t v4 = result;
    *uint64_t v8 = result;
  }
  *(void *)(v4 + 16) = v12 + 1;
  unint64_t v13 = v4 + 16 * v12;
  *(void *)(v13 + 32) = a3;
  *(void *)(v13 + 40) = a2;
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned Int, @unowned UnsafePointer<UInt8>, @unowned Int) -> ()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v7(a2, a3, a4);

  return swift_release();
}

CMVideoDimensions CMFormatDescriptionRef.dimensions.getter()
{
  return CMVideoFormatDescriptionGetDimensions(v0);
}

CGSize __swiftcall CMFormatDescriptionRef.presentationDimensions(usePixelAspectRatio:useCleanAperture:)(Swift::Bool usePixelAspectRatio, Swift::Bool useCleanAperture)
{
  CGSize PresentationDimensions = CMVideoFormatDescriptionGetPresentationDimensions(v2, usePixelAspectRatio, useCleanAperture);
  double height = PresentationDimensions.height;
  double width = PresentationDimensions.width;
  result.double height = height;
  result.double width = width;
  return result;
}

CGRect __swiftcall CMFormatDescriptionRef.cleanAperture(originIsAtTopLeft:)(Swift::Bool originIsAtTopLeft)
{
  return CMVideoFormatDescriptionGetCleanAperture(v1, originIsAtTopLeft);
}

uint64_t static CMFormatDescriptionRef.extensionKeysCommonWithImageBuffers.getter()
{
  CMVideoFormatDescriptionGetExtensionKeysCommonWithImageBuffers();
  uint64_t result = static Array._forceBridgeFromObjectiveC(_:result:)();
  __break(1u);
  return result;
}

Swift::Bool __swiftcall CMFormatDescriptionRef.matchesImageBuffer(_:)(CVBufferRef a1)
{
  return CMVideoFormatDescriptionMatchesImageBuffer(v1, a1) != 0;
}

uint64_t CMFormatDescriptionRef.tagCollections.getter()
{
  tagCollectionsOut[1] = *(CFArrayRef *)MEMORY[0x1E4F143B8];
  tagCollectionsOut[0] = 0;
  CMVideoFormatDescriptionCopyTagCollectionArray(v0, tagCollectionsOut);
  CFArrayRef v1 = tagCollectionsOut[0];
  if (tagCollectionsOut[0])
  {
    type metadata accessor for CMTagCollectionRef(0);
    CFArrayRef v2 = v1;
    static Array._conditionallyBridgeFromObjectiveC(_:result:)();
  }
  return 0;
}

Swift::Bool __swiftcall CMFormatDescriptionRef.matchesTaggedBufferGroup(_:)(Swift::OpaquePointer a1)
{
  CFArrayRef v2 = (OpaqueCMTaggedBufferGroup *)Array<A>.taggedBufferGroup.getter((uint64_t)a1._rawValue);
  int v3 = CMTaggedBufferGroupFormatDescriptionMatchesTaggedBufferGroup(v1, v2);

  return v3 != 0;
}

uint64_t CMFormatDescriptionRef.displayFlags()@<X0>(CMTextDisplayFlags *a1@<X8>)
{
  CFArrayRef v2 = v1;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  CMTextDisplayFlags displayFlagsOut = 0;
  OSStatus DisplayFlags = CMTextFormatDescriptionGetDisplayFlags(v2, &displayFlagsOut);
  uint64_t result = noErr.getter();
  if (DisplayFlags == result)
  {
    *a1 = displayFlagsOut;
  }
  else
  {
    id v6 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v6 initWithDomain:*MEMORY[0x1E4F28760] code:DisplayFlags userInfo:0];
    return swift_willThrow();
  }
  return result;
}

uint64_t CMFormatDescriptionRef.justification()(unsigned char *a1, unsigned char *a2)
{
  int v3 = v2;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  *(_WORD *)verticalJustificationOut = 0;
  OSStatus Justification = CMTextFormatDescriptionGetJustification(v3, &verticalJustificationOut[1], verticalJustificationOut);
  uint64_t result = noErr.getter();
  if (Justification == result)
  {
    *a1 = verticalJustificationOut[1];
    *a2 = verticalJustificationOut[0];
  }
  else
  {
    id v8 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v8 initWithDomain:*MEMORY[0x1E4F28760] code:Justification userInfo:0];
    return swift_willThrow();
  }
  return result;
}

uint64_t CMFormatDescriptionRef.defaultTextBox(originIsAtTopLeft:heightOfTextTrack:)(char a1, CGFloat a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  memset(&v6, 0, sizeof(v6));
  OSStatus DefaultTextBox = CMTextFormatDescriptionGetDefaultTextBox(v2, a1 & 1, a2, &v6);
  uint64_t result = noErr.getter();
  if (DefaultTextBox != result)
  {
    id v5 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v5 initWithDomain:*MEMORY[0x1E4F28760] code:DefaultTextBox userInfo:0];
    return swift_willThrow();
  }
  return result;
}

uint64_t CMFormatDescriptionRef.defaultStyle()()
{
  CFArrayRef v1 = v0;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint16_t localFontIDOut = 0;
  *(_WORD *)italicOut = 0;
  Boolean underlineOut = 0;
  CGFloat fontSizeOut = 0.0;
  uint64_t v2 = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(void *)(v2 + 16) = 4;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  OSStatus DefaultStyle = CMTextFormatDescriptionGetDefaultStyle(v1, &localFontIDOut, &italicOut[1], italicOut, &underlineOut, &fontSizeOut, (CGFloat *)(v2 + 32));
  if (DefaultStyle == noErr.getter()) {
    return localFontIDOut;
  }
  id v5 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  [v5 initWithDomain:*MEMORY[0x1E4F28760] code:DefaultStyle userInfo:0];
  swift_willThrow();
  return swift_bridgeObjectRelease();
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMFormatDescriptionRef.fontName(localFontID:)(Swift::Int localFontID)
{
  v10[1] = *(CFStringRef *)MEMORY[0x1E4F143B8];
  if ((unint64_t)localFontID >> 16)
  {
    if (one-time initialization token for invalidParameter != -1) {
      swift_once();
    }
    (id)static CMFormatDescriptionRef.Error.invalidParameter;
    swift_willThrow();
  }
  else
  {
    v10[0] = 0;
    uint64_t FontName = CMTextFormatDescriptionGetFontName(v1, localFontID, v10);
    CFStringRef v3 = v10[0];
    uint64_t v4 = (id)v10[0];
    uint64_t v5 = noErr.getter();
    if (FontName == v5)
    {
      if (!v4)
      {
        __break(1u);
        goto LABEL_11;
      }
      uint64_t FontName = static String._unconditionallyBridgeFromObjectiveC(_:)();
      CFStringRef v3 = v7;
    }
    else
    {
      id v8 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
      [v8 initWithDomain:MEMORY[0x1E4F28760] code:FontName userInfo:0];
      swift_willThrow();
    }
  }
  uint64_t v5 = FontName;
  CGRect v6 = (__CFString *)v3;
LABEL_11:
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

uint64_t CMFormatDescriptionRef.TimeCode.Flag.rawValue.getter()
{
  return *v0;
}

CMTimeValue CMFormatDescriptionRef.frameDuration.getter()
{
  CMTimeCodeFormatDescriptionGetFrameDuration(&v2, v0);
  return v2.value;
}

uint64_t CMFormatDescriptionRef.frameQuanta.getter()
{
  return CMTimeCodeFormatDescriptionGetFrameQuanta(v0);
}

uint64_t CMFormatDescriptionRef.timeCodeFlags.getter@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = CMTimeCodeFormatDescriptionGetTimeCodeFlags(v1);
  *a1 = result;
  return result;
}

Swift::OpaquePointer_optional __swiftcall CMFormatDescriptionRef.keyWithLocalID(_:)(Swift::UInt32 a1)
{
  if (CMMetadataFormatDescriptionGetKeyWithLocalID(v1, a1))
  {
    CFStringRef v3 = (void *)static Dictionary._forceBridgeFromObjectiveC(_:result:)();
    __break(1u);
  }
  else
  {
    CFStringRef v3 = 0;
  }
  result.value._rawValue = v3;
  result.is_nil = v2;
  return result;
}

uint64_t CMFormatDescriptionRef.identifiers.getter()
{
  CFArrayRef v1 = CMMetadataFormatDescriptionGetIdentifiers(v0);
  if (!v1) {
    return MEMORY[0x1E4FBC860];
  }
  v1;
  uint64_t result = static Array._forceBridgeFromObjectiveC(_:result:)();
  __break(1u);
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  Hasher.init(_seed:)();
  type metadata accessor for CFStringRef(0);
  _sSo11CFStringRefaABSHSCWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
  _CFObject.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for CFStringRef(0);
    CGRect v6 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    _sSo11CFStringRefaABSHSCWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
    id v7 = v6;
    char v8 = static _CFObject.== infix(_:_:)();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v4;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v11 = static _CFObject.== infix(_:_:)();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
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
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(uint64_t result, uint64_t *a2, uint64_t a3, unint64_t a4)
{
  id v7 = (void *)result;
  if (!a2) {
    goto LABEL_26;
  }
  uint64_t v8 = a3;
  if (!a3)
  {
LABEL_27:
    *id v7 = a4;
    v7[1] = v8;
    return v8;
  }
  if (a3 < 0) {
    goto LABEL_24;
  }
  uint64_t v4 = a2;
  unint64_t v5 = a4 >> 62;
  if (a4 >> 62) {
    goto LABEL_25;
  }
  if (!*(void *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_26:
    uint64_t v8 = 0;
    goto LABEL_27;
  }
  while (1)
  {
    if ((a4 & 0xC000000000000001) != 0)
    {
      uint64_t v9 = MEMORY[0x1C188D620](0, a4);
      goto LABEL_9;
    }
    if (!*(void *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      break;
    }
    uint64_t v9 = swift_unknownObjectRetain();
LABEL_9:
    *uint64_t v4 = v9;
    uint64_t v10 = v8 - 1;
    if (v8 == 1) {
      goto LABEL_27;
    }
    if (v5)
    {
      unint64_t v5 = a4 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain();
      uint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      unint64_t v5 = a4 & 0xFFFFFFFFFFFFFF8;
      uint64_t v11 = *(void *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v12 = 0;
    ++v4;
    while (v10 != v12)
    {
      if (v11 - 1 == v12)
      {
        uint64_t v8 = v11;
        goto LABEL_27;
      }
      unint64_t v14 = v12 + 1;
      if ((a4 & 0xC000000000000001) != 0)
      {
        uint64_t v13 = MEMORY[0x1C188D620](v14, a4);
      }
      else
      {
        if (v14 >= *(void *)(v5 + 16)) {
          goto LABEL_23;
        }
        uint64_t v13 = swift_unknownObjectRetain();
      }
      v4[v12++] = v13;
      if (v10 == v12) {
        goto LABEL_27;
      }
    }
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v15) {
      goto LABEL_26;
    }
  }
  __break(1u);
  return result;
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(uint64_t result, void *a2, uint64_t a3, unint64_t a4)
{
  id v7 = (void *)result;
  if (!a2) {
    goto LABEL_26;
  }
  uint64_t v8 = a3;
  if (!a3)
  {
LABEL_27:
    *id v7 = a4;
    v7[1] = v8;
    return v8;
  }
  if (a3 < 0) {
    goto LABEL_24;
  }
  uint64_t v4 = a2;
  unint64_t v5 = a4 >> 62;
  if (a4 >> 62) {
    goto LABEL_25;
  }
  if (!*(void *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_26:
    uint64_t v8 = 0;
    goto LABEL_27;
  }
  while (1)
  {
    if ((a4 & 0xC000000000000001) != 0)
    {
      id v9 = (id)MEMORY[0x1C188D620](0, a4);
      goto LABEL_9;
    }
    if (!*(void *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      break;
    }
    id v9 = *(id *)(a4 + 32);
LABEL_9:
    *uint64_t v4 = v9;
    uint64_t v10 = v8 - 1;
    if (v8 == 1) {
      goto LABEL_27;
    }
    if (v5)
    {
      unint64_t v5 = a4 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain();
      uint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      unint64_t v5 = a4 & 0xFFFFFFFFFFFFFF8;
      uint64_t v11 = *(void *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v12 = 0;
    ++v4;
    while (v10 != v12)
    {
      if (v11 - 1 == v12)
      {
        uint64_t v8 = v11;
        goto LABEL_27;
      }
      unint64_t v14 = v12 + 1;
      if ((a4 & 0xC000000000000001) != 0)
      {
        id v13 = (id)MEMORY[0x1C188D620](v14, a4);
      }
      else
      {
        if (v14 >= *(void *)(v5 + 16)) {
          goto LABEL_23;
        }
        id v13 = *(id *)(a4 + 40 + 8 * v12);
      }
      v4[v12++] = v13;
      if (v10 == v12) {
        goto LABEL_27;
      }
    }
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v15) {
      goto LABEL_26;
    }
  }
  __break(1u);
  return result;
}

void *specialized Sequence._copySequenceContents(initializing:)(void *result, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = result;
  if (!a2)
  {
LABEL_5:
    uint64_t v11 = 0;
    goto LABEL_6;
  }
  uint64_t v11 = a3;
  if (!a3)
  {
LABEL_6:
    uint64_t v12 = a5;
LABEL_7:
    void *v10 = a4;
    v10[1] = a5;
    CFStringRef v10[2] = a6;
    void v10[3] = v12;
    return (void *)v11;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (a5 != a6)
    {
      uint64_t v13 = a5 + 1;
      if (__OFADD__(a5, 1))
      {
LABEL_16:
        __break(1u);
LABEL_17:
        uint64_t v12 = a6;
        uint64_t v11 = v6;
      }
      else
      {
        unint64_t v14 = a2;
        uint64_t v6 = 1;
        uint64_t v12 = a5;
        while (1)
        {
          *unint64_t v14 = a4;
          v14[1] = v12;
          uint64_t v12 = v13;
          if (v11 == v6) {
            break;
          }
          if (v13 == a6) {
            goto LABEL_17;
          }
          ++v6;
          BOOL v16 = __OFADD__(v13++, 1);
          id v17 = a4;
          v14 += 2;
          if (v16) {
            goto LABEL_16;
          }
        }
      }
      id v18 = a4;
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

void specialized Sequence._copySequenceContents(initializing:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v42 = a4;
  uint64_t v43 = a5;
  CMSampleBufferRef.PerSampleAttachmentsDictionary.makeIterator()(&v38);

  if (!a2)
  {
    long long v10 = v38;
    uint64_t v27 = v39;
    int64_t v12 = v40;
    goto LABEL_30;
  }
  if (!a3)
  {
    long long v10 = v38;
    uint64_t v27 = v39;
    int64_t v12 = v40;
LABEL_30:
    unint64_t v11 = v41;
LABEL_31:
    *(_OWORD *)a1 = v10;
    *(void *)(a1 + 16) = v27;
    *(void *)(a1 + 24) = v12;
    *(void *)(a1 + 32) = v11;
    return;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  uint64_t v9 = 0;
  long long v10 = v38;
  int64_t v12 = v40;
  unint64_t v11 = v41;
  uint64_t v13 = *((void *)&v38 + 1);
  uint64_t v14 = v38;
  uint64_t v29 = v39;
  uint64_t v30 = a1;
  int64_t v15 = (unint64_t)(v39 + 64) >> 6;
  long long v31 = v38;
  if (!v41) {
    goto LABEL_6;
  }
LABEL_5:
  unint64_t v16 = __clz(__rbit64(v11));
  v11 &= v11 - 1;
  unint64_t v17 = v16 | (v12 << 6);
  while (1)
  {
    ++v9;
    id v22 = *(void **)(*(void *)(v14 + 48) + 8 * v17);
    *(void *)&long long v32 = v22;
    outlined init with copy of Any(*(void *)(v14 + 56) + 32 * v17, (uint64_t)&v32 + 8);
    uint64_t v23 = v34;
    uint64_t v37 = v34;
    long long v24 = v33;
    long long v35 = v32;
    long long v36 = v33;
    *(_OWORD *)a2 = v32;
    *(_OWORD *)(a2 + 16) = v24;
    *(void *)(a2 + 32) = v23;
    if (v9 == a3)
    {
      id v28 = v22;
      uint64_t v27 = v29;
      a1 = v30;
      long long v10 = v31;
      goto LABEL_31;
    }
    a2 += 40;
    id v25 = v22;
    long long v10 = v31;
    if (v11) {
      goto LABEL_5;
    }
LABEL_6:
    int64_t v18 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v18 >= v15)
    {
      int64_t v21 = v12;
LABEL_33:
      unint64_t v11 = 0;
      int64_t v12 = v21;
      uint64_t v27 = v29;
      a1 = v30;
      goto LABEL_31;
    }
    unint64_t v19 = *(void *)(v13 + 8 * v18);
    if (!v19)
    {
      int64_t v20 = v12 + 2;
      int64_t v21 = v12 + 1;
      if (v12 + 2 >= v15) {
        goto LABEL_33;
      }
      unint64_t v19 = *(void *)(v13 + 8 * v20);
      if (v19) {
        goto LABEL_11;
      }
      int64_t v21 = v12 + 2;
      if (v12 + 3 >= v15) {
        goto LABEL_33;
      }
      unint64_t v19 = *(void *)(v13 + 8 * (v12 + 3));
      if (v19)
      {
        int64_t v18 = v12 + 3;
      }
      else
      {
        int64_t v20 = v12 + 4;
        int64_t v21 = v12 + 3;
        if (v12 + 4 >= v15) {
          goto LABEL_33;
        }
        unint64_t v19 = *(void *)(v13 + 8 * v20);
        if (v19)
        {
LABEL_11:
          int64_t v18 = v20;
          goto LABEL_15;
        }
        int64_t v18 = v12 + 5;
        int64_t v21 = v12 + 4;
        if (v12 + 5 >= v15) {
          goto LABEL_33;
        }
        unint64_t v19 = *(void *)(v13 + 8 * v18);
        if (!v19)
        {
          int64_t v26 = v12 + 6;
          while (v15 != v26)
          {
            unint64_t v19 = *(void *)(v13 + 8 * v26++);
            if (v19)
            {
              int64_t v18 = v26 - 1;
              goto LABEL_15;
            }
          }
          int64_t v21 = v15 - 1;
          goto LABEL_33;
        }
      }
    }
LABEL_15:
    unint64_t v11 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v18 << 6);
    int64_t v12 = v18;
  }
  __break(1u);
LABEL_36:
  __break(1u);
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = specialized Dictionary.startIndex.getter(a4);
  uint64_t v9 = result;
  uint64_t v11 = v10;
  char v13 = v12 & 1;
  if (!a2)
  {
    uint64_t v14 = 0;
LABEL_19:
    *(void *)a1 = a4;
    *(void *)(a1 + 8) = v9;
    *(void *)(a1 + 16) = v11;
    *(unsigned char *)(a1 + 24) = v13;
    return v14;
  }
  if (!a3)
  {
    uint64_t v14 = 0;
    goto LABEL_19;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v32 = a1;
    uint64_t v33 = a3;
    uint64_t v14 = 0;
    while (1)
    {
      if ((a4 & 0xC000000000000001) != 0)
      {
        uint64_t result = __CocoaDictionary.endIndex.getter();
        if ((v13 & 1) == 0) {
          goto LABEL_22;
        }
        uint64_t v16 = result;
        uint64_t v17 = v15;
        char v18 = MEMORY[0x1C188D720](v9, v11, result, v15);
        char v13 = 1;
        outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v16, v17, 1);
        if (v18) {
          goto LABEL_18;
        }
        specialized Dictionary.subscript.getter(&v34, v9, v11, 1, a4);
        uint64_t v20 = v19;
        uint64_t v21 = v34;
        uint64_t v22 = __CocoaDictionary.index(after:)();
        uint64_t v24 = v23;
        swift_bridgeObjectRetain();
        uint64_t v25 = v9;
        uint64_t v26 = v11;
        char v27 = 1;
      }
      else
      {
        if (v13) {
          goto LABEL_22;
        }
        if (*(_DWORD *)(a4 + 36) != v11)
        {
          __break(1u);
          break;
        }
        if (v9 == 1 << *(unsigned char *)(a4 + 32))
        {
          char v13 = 0;
          goto LABEL_18;
        }
        specialized Dictionary.subscript.getter(&v34, v9, v11, 0, a4);
        uint64_t v20 = v28;
        uint64_t v21 = v34;
        swift_bridgeObjectRetain();
        specialized _NativeDictionary.index(after:)(v9, v11, 0, a4);
        uint64_t v22 = v29;
        uint64_t v24 = v30;
        char v13 = v31 & 1;
        uint64_t v25 = v9;
        uint64_t v26 = v11;
        char v27 = 0;
      }
      outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v25, v26, v27);
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v9 = v22;
      uint64_t v11 = v24;
      ++v14;
      *a2 = v20;
      a2[1] = v21;
      a2 += 2;
      if (v33 == v14)
      {
        uint64_t v14 = v33;
LABEL_18:
        a1 = v32;
        goto LABEL_19;
      }
    }
  }
  __break(1u);
LABEL_22:
  __break(1u);
  return result;
}

void *specialized Sequence._copySequenceContents(initializing:)(void *result, uint64_t *a2, uint64_t a3, void *a4)
{
  unint64_t v5 = result;
  if (!a2)
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
LABEL_15:
    *unint64_t v5 = a4;
    v5[1] = v7;
    return (void *)v6;
  }
  uint64_t v6 = a3;
  if (!a3)
  {
    uint64_t v7 = 0;
    goto LABEL_15;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v7 = a4[2];
    if (v7)
    {
      uint64_t v9 = a4[4];
      unint64_t v10 = a4[5];
      *a2 = v9;
      a2[1] = v10;
      if (a3 == 1)
      {
        uint64_t v11 = 1;
LABEL_13:
        outlined copy of Data._Representation(v9, v10);
        uint64_t v7 = v11;
      }
      else
      {
        char v12 = a4 + 7;
        char v13 = (unint64_t *)(a2 + 3);
        uint64_t v11 = 1;
        while (v7 != v11)
        {
          outlined copy of Data._Representation(v9, v10);
          uint64_t v9 = *(v12 - 1);
          unint64_t v10 = *v12;
          ++v11;
          *(v13 - 1) = v9;
          *char v13 = v10;
          v12 += 2;
          v13 += 2;
          if (v6 == v11) {
            goto LABEL_13;
          }
        }
        outlined copy of Data._Representation(v9, v10);
        uint64_t v6 = v11;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

void specialized _copyCollectionToContiguousArray<A>(_:)(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3 < a2)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    return;
  }
  if (a3 == a2) {
    return;
  }
  if (a3 <= a2) {
    goto LABEL_18;
  }
  uint64_t v6 = 0;
  uint64_t v7 = 32;
  do
  {
    if ((unint64_t)(~a2 + a3) > 0x7FFFFFFFFFFFFFFELL)
    {
      __break(1u);
      goto LABEL_17;
    }
    ++v6;
    v7 += 16;
  }
  while (a3 - a2 != v6);
  if (v6)
  {
    if ((unint64_t)(v6 - 1) >= 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = (void *)MEMORY[0x1E4FBC860];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CMSampleBufferRef.PerSampleAttachmentsDictionary>);
      uint64_t v8 = (void *)swift_allocObject();
      int64_t v9 = _swift_stdlib_malloc_size(v8);
      uint64_t v10 = v9 - 32;
      if (v9 < 32) {
        uint64_t v10 = v9 - 17;
      }
      _OWORD v8[2] = v6;
      v8[3] = 2 * (v10 >> 4);
    }
    uint64_t v11 = specialized Sequence._copySequenceContents(initializing:)(&v14, v8 + 4, v6, a1, a2, a3);
    char v12 = v14;
    id v13 = a1;

    if (v11 != (void *)v6) {
      goto LABEL_19;
    }
  }
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1)
{
  uint64_t v2 = specialized Collection.count.getter(a1);
  if (!v2) {
    return MEMORY[0x1E4FBC860];
  }
  uint64_t v3 = v2;
  if (v2 <= 0)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4FBC860];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(key: CFStringRef, value: Swift.AnyObject)>);
    uint64_t v4 = (void *)swift_allocObject();
    int64_t v5 = _swift_stdlib_malloc_size(v4);
    uint64_t v6 = v5 - 32;
    if (v5 < 32) {
      uint64_t v6 = v5 - 17;
    }
    _OWORD v4[2] = v3;
    v4[3] = 2 * (v6 >> 4);
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = specialized Sequence._copySequenceContents(initializing:)((uint64_t)v12, v4 + 4, v3, a1);
  uint64_t v8 = v12[1];
  uint64_t v9 = v12[2];
  char v10 = v13;
  swift_bridgeObjectRelease();
  uint64_t result = outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v8, v9, v10);
  if (v7 == v3) {
    return (uint64_t)v4;
  }
  __break(1u);
  return result;
}

uint64_t *specialized _copyCollectionToContiguousArray<A>(_:)(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return (uint64_t *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Data>);
  uint64_t v3 = (uint64_t *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  size_t v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = specialized Sequence._copySequenceContents(initializing:)(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v6 != (void *)v1)
  {
    __break(1u);
    return (uint64_t *)MEMORY[0x1E4FBC860];
  }
  return v3;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(const void *a1, uint64_t a2)
{
  if (!a2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  if (a2 <= 0)
  {
    size_t v4 = 48 * a2;
    uint64_t v5 = (void *)MEMORY[0x1E4FBC860];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AudioFormatListItem>);
    size_t v4 = 48 * a2;
    uint64_t v5 = (void *)swift_allocObject();
    size_t v6 = _swift_stdlib_malloc_size(v5);
    v5[2] = a2;
    v5[3] = 2 * ((uint64_t)(v6 - 32) / 48);
  }
  memcpy(v5 + 4, a1, v4);
  return v5;
}

uint64_t specialized Dictionary._Variant.removeValue(forKey:)(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  if ((v4 & 0xC000000000000001) == 0)
  {
LABEL_8:
    swift_bridgeObjectRetain();
    a1 = specialized __RawDictionaryStorage.find<A>(_:)(a1);
    char v13 = v12;
    swift_bridgeObjectRelease();
    if (v13)
    {
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      Swift::Int v9 = *v2;
      Swift::Int v17 = *v2;
      *uint64_t v2 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        specialized _NativeDictionary.copy()();
        Swift::Int v9 = v17;
      }
      goto LABEL_11;
    }
    return 0;
  }
  if (v4 < 0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = v4 & 0xFFFFFFFFFFFFFF8;
  }
  swift_bridgeObjectRetain();
  id v6 = (id)a1;
  uint64_t v7 = __CocoaDictionary.lookup(_:)();

  if (!v7)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_unknownObjectRelease();
  uint64_t v8 = MEMORY[0x1C188D750](v5);
  Swift::Int v9 = specialized _NativeDictionary.init(_:capacity:)(v5, v8);
  swift_retain();
  a1 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v6);
  char v11 = v10;
  swift_release();
  if ((v11 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
LABEL_11:

  uint64_t v15 = *(void *)(*(void *)(v9 + 56) + 8 * a1);
  specialized _NativeDictionary._delete(at:)(a1, v9);
  *uint64_t v2 = v9;
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t specialized Dictionary._Variant.setValue(_:forKey:)(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    uint64_t result = MEMORY[0x1C188D750](v7);
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    *uint64_t v3 = specialized _NativeDictionary.init(_:capacity:)(v7, result + 1);
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  Swift::Int v10 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a1, a2, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v10;

  return swift_bridgeObjectRelease();
}

Swift::Int specialized _NativeDictionary.init(_:capacity:)(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, Swift.AnyObject>);
    uint64_t v2 = static _DictionaryStorage.convert(_:capacity:)();
    uint64_t v20 = v2;
    __CocoaDictionary.makeIterator()();
    if (__CocoaDictionary.Iterator.next()())
    {
      uint64_t v4 = v3;
      type metadata accessor for CFStringRef(0);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v20;
        unint64_t v14 = *(void *)(v20 + 16);
        if (*(void *)(v20 + 24) <= v14)
        {
          specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v14 + 1, 1);
          uint64_t v2 = v20;
        }
        Hasher.init(_seed:)();
        _sSo11CFStringRefaABSHSCWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
        _CFObject.hash(into:)();
        Swift::Int result = Hasher._finalize()();
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v15 = 0;
          unint64_t v16 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v16 && (v15 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v17 = v9 == v16;
            if (v9 == v16) {
              unint64_t v9 = 0;
            }
            v15 |= v17;
            uint64_t v18 = *(void *)(v6 + 8 * v9);
          }
          while (v18 == -1);
          unint64_t v10 = __clz(__rbit64(~v18)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v19;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v12 = __CocoaDictionary.Iterator.next()();
        uint64_t v4 = v13;
      }
      while (v12);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E4FBC868];
  }
  return v2;
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, Any>);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v33 = v2;
  uint64_t v34 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v11) {
      break;
    }
    uint64_t v19 = (void *)(v5 + 64);
    unint64_t v20 = *(void *)(v34 + 8 * v18);
    ++v14;
    if (!v20)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v11) {
        goto LABEL_34;
      }
      unint64_t v20 = *(void *)(v34 + 8 * v14);
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v11)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v33;
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v20 = *(void *)(v34 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            int64_t v14 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v11) {
              goto LABEL_34;
            }
            unint64_t v20 = *(void *)(v34 + 8 * v14);
            ++v21;
            if (v20) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v21;
      }
    }
LABEL_21:
    unint64_t v10 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v14 << 6);
LABEL_22:
    uint64_t v22 = *(void **)(*(void *)(v5 + 48) + 8 * v17);
    uint64_t v23 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
    if (a2)
    {
      outlined init with take of Any(v23, v35);
    }
    else
    {
      outlined init with copy of Any((uint64_t)v23, (uint64_t)v35);
      id v24 = v22;
    }
    Hasher.init(_seed:)();
    type metadata accessor for CFStringRef(0);
    _sSo11CFStringRefaABSHSCWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
    _CFObject.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v26 = result & ~v25;
    unint64_t v27 = v26 >> 6;
    if (((-1 << v26) & ~*(void *)(v12 + 8 * (v26 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v26) & ~*(void *)(v12 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v28 = 0;
      unint64_t v29 = (unint64_t)(63 - v25) >> 6;
      do
      {
        if (++v27 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v30 = v27 == v29;
        if (v27 == v29) {
          unint64_t v27 = 0;
        }
        v28 |= v30;
        uint64_t v31 = *(void *)(v12 + 8 * v27);
      }
      while (v31 == -1);
      unint64_t v15 = __clz(__rbit64(~v31)) + (v27 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(void *)(*(void *)(v7 + 48) + 8 * v15) = v22;
    uint64_t result = (uint64_t)outlined init with take of Any(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v33;
  uint64_t v19 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
  if (v32 >= 64) {
    bzero(v19, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v19 = -1 << v32;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
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
  uint64_t v18;
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
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;

  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, Swift.AnyObject>);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  long long v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v34 = (unint64_t)(v8 + 63) >> 6;
  int64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  uint64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      uint64_t v19 = __clz(__rbit64(v10));
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
    uint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      uint64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      uint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        id v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        uint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            uint64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            uint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        uint64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    unint64_t v29 = 8 * v20;
    BOOL v30 = *(void **)(*(void *)(v5 + 48) + v29);
    uint64_t v31 = *(void *)(*(void *)(v5 + 56) + v29);
    if ((a2 & 1) == 0)
    {
      uint64_t v32 = v30;
      swift_unknownObjectRetain();
    }
    Hasher.init(_seed:)();
    type metadata accessor for CFStringRef(0);
    _sSo11CFStringRefaABSHSCWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
    _CFObject.hash(into:)();
    uint64_t result = Hasher._finalize()();
    int64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      uint64_t v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        unint64_t v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        char v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    int64_t v18 = 8 * v17;
    *(void *)(*(void *)(v7 + 48) + v18) = v30;
    *(void *)(*(void *)(v7 + 56) + v18) = v31;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
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

void specialized _NativeDictionary._delete(at:)(unint64_t a1, uint64_t a2)
{
  int64_t v3 = a1;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t v8 = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        unint64_t v10 = *(void **)(*(void *)(a2 + 48) + 8 * v6);
        Hasher.init(_seed:)();
        type metadata accessor for CFStringRef(0);
        _sSo11CFStringRefaABSHSCWlTm_0((unint64_t *)&lazy protocol witness table cache variable for type CFStringRef and conformance CFStringRef);
        id v11 = v10;
        _CFObject.hash(into:)();
        Swift::Int v12 = Hasher._finalize()();

        unint64_t v13 = v12 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v13 < v9) {
            goto LABEL_5;
          }
        }
        else if (v13 >= v9)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v13)
        {
LABEL_11:
          uint64_t v14 = *(void *)(a2 + 48);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || v15 >= v16 + 1) {
            *unint64_t v15 = *v16;
          }
          uint64_t v17 = *(void *)(a2 + 56);
          int64_t v18 = (void *)(v17 + 8 * v3);
          uint64_t v19 = (void *)(v17 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v18 >= v19 + 1))
          {
            *int64_t v18 = *v19;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v20 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << a1) - 1;
  }
  *unint64_t v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
}

_OWORD *specialized _NativeDictionary.setValue(_:forKey:isUnique:)(_OWORD *a1, void *a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v7 = (void *)*v3;
  unint64_t v9 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)a2);
  uint64_t v10 = v7[2];
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v13 = v8;
  uint64_t v14 = v7[3];
  if (v14 < v12 || (a3 & 1) == 0)
  {
    if (v14 >= v12 && (a3 & 1) == 0)
    {
      specialized _NativeDictionary.copy()();
      goto LABEL_7;
    }
    specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v12, a3 & 1);
    unint64_t v18 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)a2);
    if ((v13 & 1) == (v19 & 1))
    {
      unint64_t v9 = v18;
      unint64_t v15 = *v4;
      if (v13) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    type metadata accessor for CFStringRef(0);
    uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v15 = *v4;
  if (v13)
  {
LABEL_8:
    unint64_t v16 = (_OWORD *)(v15[7] + 32 * v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    return outlined init with take of Any(a1, v16);
  }
LABEL_13:
  specialized _NativeDictionary._insert(at:key:value:)(v9, (uint64_t)a2, a1, v15);

  return a2;
}

id specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    specialized _NativeDictionary.copy()();
LABEL_7:
    unint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];
      id result = (id)swift_unknownObjectRelease();
      *(void *)(v16 + 8 * v9) = a1;
      return result;
    }
    goto LABEL_11;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v12, a3 & 1);
  unint64_t v18 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)a2);
  if ((v13 & 1) != (v19 & 1))
  {
LABEL_17:
    type metadata accessor for CFStringRef(0);
    id result = (id)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v9 = v18;
  unint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v20 = 8 * v9;
  *(void *)(v15[6] + v20) = a2;
  *(void *)(v15[7] + v20) = a1;
  uint64_t v21 = v15[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  CMSampleBufferRef v15[2] = v23;

  return a2;
}

_OWORD *specialized _NativeDictionary._insert(at:key:value:)(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  id result = outlined init with take of Any(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

id specialized _NativeDictionary.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, Any>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 32 * v15;
    outlined init with copy of Any(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    outlined init with take of Any(v22, (_OWORD *)(*(void *)(v4 + 56) + v18));
    id result = v17;
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

void *specialized _NativeDictionary.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CFStringRef, Swift.AnyObject>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = (void *)swift_unknownObjectRetain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void specialized _NativeDictionary.index(after:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  if ((a3 & 1) == 0)
  {
    if (a1 < 0 || -(-1 << *(unsigned char *)(a4 + 32)) <= a1)
    {
      __break(1u);
    }
    else if ((*(void *)(a4 + 64 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> a1))
    {
      if (*(_DWORD *)(a4 + 36) == a2)
      {
        _HashTable.occupiedBucket(after:)();
        return;
      }
      goto LABEL_12;
    }
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (__CocoaDictionary.Index.age.getter() != *(_DWORD *)(a4 + 36))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  __CocoaDictionary.Index.key.getter();
  outlined copy of [A : B].Index._Variant<A, B>(a1, a2, 1);
  type metadata accessor for CFStringRef(0);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
  specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v8);
  char v7 = v6;

  if (v7)
  {
    __CocoaDictionary.Index.dictionary.getter();
    __CocoaDictionary.index(after:)();
    outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(a1, a2, 1);
    swift_unknownObjectRelease();
    return;
  }
LABEL_14:
  __break(1u);
}

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined consume of Data._Representation(a1, a2);
  }
  return a1;
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

uint64_t outlined copy of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined copy of Data._Representation(a1, a2);
  }
  return a1;
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

uint64_t outlined init with copy of ManagedAudioChannelLayout?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedAudioChannelLayout?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of ManagedAudioChannelLayout?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedAudioChannelLayout?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t partial apply for closure #1 in _CMFormatDescriptionInitTrampoline.init(audioStreamBasicDescription:layout:magicCookie:extensions:)@<X0>(const AudioChannelLayout *a1@<X0>, uint64_t *a2@<X8>)
{
  return closure #1 in _CMFormatDescriptionInitTrampoline.init(audioStreamBasicDescription:layout:magicCookie:extensions:)(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(void *)(v2 + 48), a2);
}

uint64_t specialized Collection._failEarlyRangeCheck(_:bounds:)(uint64_t a1, uint64_t a2, char a3, long long *a4)
{
  long long v13 = *a4;
  char v14 = *((unsigned char *)a4 + 16);
  outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)&v13, (uint64_t)v15);
  uint64_t result = (uint64_t)v15;
  int64_t v9 = &v16;
  if ((a3 & 1) == 0)
  {
    uint64_t result = outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)v15, (uint64_t)&v16);
    if (v18)
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    if (v17 != a2)
    {
      __break(1u);
      goto LABEL_15;
    }
    if (v16 > a1)
    {
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }
    long long v10 = *(long long *)((char *)a4 + 24);
    char v11 = *((unsigned char *)a4 + 40);
    outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)&v10, (uint64_t)v12);
    uint64_t result = outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)v12, (uint64_t)&v19);
    if (v21)
    {
LABEL_20:
      __break(1u);
      return result;
    }
    if (v20 != a2)
    {
LABEL_18:
      __break(1u);
      goto LABEL_19;
    }
    if (v19 > a1) {
      return result;
    }
    __break(1u);
  }
  uint64_t result = outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant(result, (uint64_t)v9);
  if ((v18 & 1) == 0) {
    goto LABEL_19;
  }
  uint64_t result = MEMORY[0x1C188D710](a1, a2, v16, v17);
  if (result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  long long v10 = *(long long *)((char *)a4 + 24);
  char v11 = *((unsigned char *)a4 + 40);
  outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)&v10, (uint64_t)v12);
  uint64_t result = outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)v12, (uint64_t)&v19);
  if ((v21 & 1) == 0) {
    goto LABEL_20;
  }
  uint64_t result = MEMORY[0x1C188D710](a1, a2, v19, v20);
  if ((result & 1) == 0)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  return result;
}

{
  uint64_t result;
  uint64_t *v9;
  long long v10;
  char v11;
  unsigned char v12[24];
  long long v13;
  char v14;
  unsigned char v15[24];
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  long long v13 = *a4;
  char v14 = *((unsigned char *)a4 + 16);
  outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)&v13, (uint64_t)v15);
  uint64_t result = (uint64_t)v15;
  int64_t v9 = &v16;
  if (a3) {
    goto LABEL_6;
  }
  uint64_t result = outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)v15, (uint64_t)&v16);
  if (v18) {
    goto LABEL_18;
  }
  if (v17 != a2) {
    goto LABEL_16;
  }
  if (v16 > a1)
  {
    do
    {
      __break(1u);
LABEL_6:
      uint64_t result = outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant(result, (uint64_t)v9);
      if ((v18 & 1) == 0) {
        goto LABEL_18;
      }
      uint64_t result = MEMORY[0x1C188D710](a1, a2, v16, v17);
    }
    while ((result & 1) != 0);
  }
  long long v10 = *(long long *)((char *)a4 + 24);
  char v11 = *((unsigned char *)a4 + 40);
  outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)&v10, (uint64_t)v12);
  uint64_t result = outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)v12, (uint64_t)&v19);
  if (v21)
  {
    if (a3)
    {
      uint64_t result = MEMORY[0x1C188D710](v19, v20, a1, a2);
      if ((result & 1) == 0) {
        return result;
      }
LABEL_15:
      __break(1u);
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }
LABEL_19:
    __break(1u);
    return result;
  }
  if (a3) {
    goto LABEL_19;
  }
  if (v20 != a2)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (v19 < a1) {
    goto LABEL_15;
  }
  return result;
}

uint64_t specialized Collection._failEarlyRangeCheck(_:bounds:)(long long *a1, long long *a2)
{
  long long v19 = *a1;
  char v20 = *((unsigned char *)a1 + 16);
  outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)&v19, (uint64_t)v21);
  long long v22 = *a2;
  char v23 = *((unsigned char *)a2 + 16);
  outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)&v22, (uint64_t)v24);
  outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)v21, (uint64_t)&v28);
  if (v30)
  {
    uint64_t v4 = v28;
    uint64_t v5 = v29;
    uint64_t result = outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)v24, (uint64_t)&v25);
    if (v27)
    {
      if ((MEMORY[0x1C188D710](v4, v5, v25, v26) & 1) == 0) {
        goto LABEL_4;
      }
LABEL_11:
      __break(1u);
      goto LABEL_12;
    }
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v9 = v28;
  int v10 = v29;
  uint64_t result = outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)v24, (uint64_t)&v25);
  if (v27) {
    goto LABEL_18;
  }
  if (v10 != v26)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v9 < v25) {
    goto LABEL_11;
  }
LABEL_4:
  long long v13 = *(long long *)((char *)a2 + 24);
  char v14 = *((unsigned char *)a2 + 40);
  outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)&v13, (uint64_t)v15);
  long long v16 = *(long long *)((char *)a1 + 24);
  char v17 = *((unsigned char *)a1 + 40);
  outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)&v16, (uint64_t)v18);
  outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)v15, (uint64_t)&v34);
  if (v36)
  {
    uint64_t v7 = v34;
    uint64_t v8 = v35;
    uint64_t result = outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)v18, (uint64_t)&v31);
    if (v33)
    {
      uint64_t result = MEMORY[0x1C188D710](v7, v8, v31, v32);
      if ((result & 1) == 0) {
        return result;
      }
LABEL_15:
      __break(1u);
      goto LABEL_16;
    }
LABEL_19:
    __break(1u);
    return result;
  }
LABEL_12:
  uint64_t v11 = v34;
  int v12 = v35;
  uint64_t result = outlined init with take of [CFStringRef : Swift.AnyObject].Index._Variant((uint64_t)v18, (uint64_t)&v31);
  if (v33) {
    goto LABEL_19;
  }
  if (v12 != v32)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v11 < v31) {
    goto LABEL_15;
  }
  return result;
}

uint64_t specialized Collection.index(_:offsetBy:limitedBy:)(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2 < 0)
  {
LABEL_21:
    __break(1u);
    return result;
  }
  if (a2)
  {
    unint64_t v3 = a3 - result;
    if (a3 - result >= (unint64_t)(a2 - 1)) {
      unint64_t v3 = a2 - 1;
    }
    if (v3 >= (result ^ 0x7FFFFFFFFFFFFFFFuLL)) {
      unint64_t v3 = result ^ 0x7FFFFFFFFFFFFFFFLL;
    }
    unint64_t v4 = v3 + 1;
    if (v4 >= 5)
    {
      uint64_t v7 = v4 & 3;
      if ((v4 & 3) == 0) {
        uint64_t v7 = 4;
      }
      unint64_t v5 = v4 - v7;
      int64x2_t v8 = 0uLL;
      v9.i64[0] = 0;
      v9.i64[1] = result;
      int64x2_t v10 = vdupq_n_s64(1uLL);
      unint64_t v11 = v5;
      do
      {
        int64x2_t v8 = vaddq_s64(v8, v10);
        int64x2_t v9 = vaddq_s64(v9, v10);
        v11 -= 4;
      }
      while (v11);
      uint64_t v6 = vaddvq_s64(vaddq_s64(vzip1q_s64(v9, v8), vzip2q_s64(v9, v8)));
    }
    else
    {
      unint64_t v5 = 0;
      uint64_t v6 = result;
    }
    uint64_t v12 = v5 + result - 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v13 = v5 + result - a3;
    uint64_t v14 = a2 - v5;
    uint64_t result = v6;
    while (1)
    {
      if (!v13) {
        return 0;
      }
      if (!v12) {
        break;
      }
      ++result;
      ++v12;
      ++v13;
      if (!--v14) {
        return result;
      }
    }
    __break(1u);
    goto LABEL_21;
  }
  return result;
}

uint64_t specialized Data.init(bytes:count:)(unsigned char *__src, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 <= 14) {
    return specialized Data.InlineData.init(_:)(__src, &__src[a2]);
  }
  type metadata accessor for __DataStorage();
  swift_allocObject();
  __DataStorage.init(bytes:length:)();
  if ((unint64_t)a2 < 0x7FFFFFFF) {
    return a2 << 32;
  }
  type metadata accessor for Data.RangeReference();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t sub_1BE21BCB4()
{
  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t sub_1BE21BCEC()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t partial apply for closure #1 in CMFormatDescriptionRef.parameterSets.getter(uint64_t a1, unsigned char *a2, uint64_t a3)
{
  return closure #1 in CMFormatDescriptionRef.parameterSets.getter(a1, a2, a3, v3);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Key(void *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key);
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key()
{
  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Key and conformance CMFormatDescriptionRef.Extensions.Key);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.FieldDetail(void *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail);
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail()
{
  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FieldDetail and conformance CMFormatDescriptionRef.Extensions.Value.FieldDetail);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.ColorPrimaries(void *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries);
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries()
{
  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ColorPrimaries and conformance CMFormatDescriptionRef.Extensions.Value.ColorPrimaries);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.TransferFunction(void *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction);
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction()
{
  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TransferFunction and conformance CMFormatDescriptionRef.Extensions.Value.TransferFunction);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix(void *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix);
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix()
{
  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix and conformance CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.ChromaLocation(void *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation);
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation()
{
  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.ChromaLocation and conformance CMFormatDescriptionRef.Extensions.Value.ChromaLocation);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile);
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile()
{
  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile(void *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile and conformance CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile);
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.Vendor(void *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor);
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor()
{
  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.Vendor and conformance CMFormatDescriptionRef.Extensions.Value.Vendor);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode(void *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode);
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode()
{
  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode and conformance CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace()
{
  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.FontFace(void *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.FontFace and conformance CMFormatDescriptionRef.Extensions.Value.FontFace);
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags(void *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags);
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags()
{
  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags and conformance CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.TextJustification(void *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification);
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification()
{
  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value.TextJustification and conformance CMFormatDescriptionRef.Extensions.Value.TextJustification);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Value and conformance CMFormatDescriptionRef.Extensions.Value()
{
  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value and conformance CMFormatDescriptionRef.Extensions.Value;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value and conformance CMFormatDescriptionRef.Extensions.Value)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Value and conformance CMFormatDescriptionRef.Extensions.Value);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions and conformance CMFormatDescriptionRef.Extensions()
{
  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions and conformance CMFormatDescriptionRef.Extensions;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions and conformance CMFormatDescriptionRef.Extensions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions and conformance CMFormatDescriptionRef.Extensions);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions and conformance CMFormatDescriptionRef.Extensions;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions and conformance CMFormatDescriptionRef.Extensions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions and conformance CMFormatDescriptionRef.Extensions);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.Extensions.Index and conformance CMFormatDescriptionRef.Extensions.Index()
{
  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Index and conformance CMFormatDescriptionRef.Extensions.Index;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Index and conformance CMFormatDescriptionRef.Extensions.Index)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Index and conformance CMFormatDescriptionRef.Extensions.Index);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Index and conformance CMFormatDescriptionRef.Extensions.Index;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Index and conformance CMFormatDescriptionRef.Extensions.Index)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.Extensions.Index and conformance CMFormatDescriptionRef.Extensions.Index);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.Indices : Collection in CMFormatDescriptionRef.Extensions()
{
  return lazy protocol witness table accessor for type DefaultIndices<CMSampleBufferRef.SampleAttachmentsArray> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type DefaultIndices<CMFormatDescriptionRef.Extensions> and conformance DefaultIndices<A>, &demangling cache variable for type metadata for DefaultIndices<CMFormatDescriptionRef.Extensions>);
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in CMFormatDescriptionRef.Extensions()
{
  return lazy protocol witness table accessor for type DefaultIndices<CMSampleBufferRef.SampleAttachmentsArray> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type Slice<CMFormatDescriptionRef.Extensions> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<CMFormatDescriptionRef.Extensions>);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in CMFormatDescriptionRef.Extensions()
{
  return lazy protocol witness table accessor for type DefaultIndices<CMSampleBufferRef.SampleAttachmentsArray> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type IndexingIterator<CMFormatDescriptionRef.Extensions> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<CMFormatDescriptionRef.Extensions>);
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.MediaType(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType);
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType()
{
  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.MediaType(void *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.MediaType and conformance CMFormatDescriptionRef.MediaType);
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.MediaSubType(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType);
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  *(void *)(a1 + 8) = a4();
  uint64_t result = a5();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType()
{
  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType);
  }
  return result;
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.MediaSubType(void *a1, uint64_t a2, uint64_t a3)
{
  return instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Key(a1, a2, a3, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType, (uint64_t (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.MediaSubType and conformance CMFormatDescriptionRef.MediaSubType);
}

uint64_t instantiation function for generic protocol witness table for CMFormatDescriptionRef.Extensions.Key(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void), uint64_t (*a6)(void))
{
  a1[1] = a4();
  a1[2] = a5();
  uint64_t result = a6();
  a1[3] = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.EqualityMask and conformance CMFormatDescriptionRef.EqualityMask()
{
  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.EqualityMask and conformance CMFormatDescriptionRef.EqualityMask;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.EqualityMask and conformance CMFormatDescriptionRef.EqualityMask)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.EqualityMask and conformance CMFormatDescriptionRef.EqualityMask);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.EqualityMask and conformance CMFormatDescriptionRef.EqualityMask;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.EqualityMask and conformance CMFormatDescriptionRef.EqualityMask)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.EqualityMask and conformance CMFormatDescriptionRef.EqualityMask);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.EqualityMask and conformance CMFormatDescriptionRef.EqualityMask;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.EqualityMask and conformance CMFormatDescriptionRef.EqualityMask)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.EqualityMask and conformance CMFormatDescriptionRef.EqualityMask);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.EqualityMask and conformance CMFormatDescriptionRef.EqualityMask;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.EqualityMask and conformance CMFormatDescriptionRef.EqualityMask)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.EqualityMask and conformance CMFormatDescriptionRef.EqualityMask);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection()
{
  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.Indices : RandomAccessCollection in CMFormatDescriptionRef.ParameterSetCollection()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>);
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

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in CMFormatDescriptionRef.ParameterSetCollection()
{
  return lazy protocol witness table accessor for type Slice<CMFormatDescriptionRef.ParameterSetCollection> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<CMFormatDescriptionRef.ParameterSetCollection> and conformance <> Slice<A>, (void (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection);
}

uint64_t associated type witness table accessor for Collection.Indices : BidirectionalCollection in CMFormatDescriptionRef.ParameterSetCollection()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in CMFormatDescriptionRef.ParameterSetCollection()
{
  return lazy protocol witness table accessor for type Slice<CMFormatDescriptionRef.ParameterSetCollection> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<CMFormatDescriptionRef.ParameterSetCollection> and conformance <> Slice<A>, (void (*)(void))lazy protocol witness table accessor for type CMFormatDescriptionRef.ParameterSetCollection and conformance CMFormatDescriptionRef.ParameterSetCollection);
}

uint64_t lazy protocol witness table accessor for type Slice<CMFormatDescriptionRef.ParameterSetCollection> and conformance <> Slice<A>(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Slice<CMFormatDescriptionRef.ParameterSetCollection>);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.Indices : Collection in CMFormatDescriptionRef.ParameterSetCollection()
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

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in CMFormatDescriptionRef.ParameterSetCollection()
{
  return lazy protocol witness table accessor for type DefaultIndices<CMSampleBufferRef.SampleAttachmentsArray> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type Slice<CMFormatDescriptionRef.ParameterSetCollection> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<CMFormatDescriptionRef.ParameterSetCollection>);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in CMFormatDescriptionRef.ParameterSetCollection()
{
  return lazy protocol witness table accessor for type DefaultIndices<CMSampleBufferRef.SampleAttachmentsArray> and conformance DefaultIndices<A>(&lazy protocol witness table cache variable for type IndexingIterator<CMFormatDescriptionRef.ParameterSetCollection> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<CMFormatDescriptionRef.ParameterSetCollection>);
}

unint64_t lazy protocol witness table accessor for type CMFormatDescriptionRef.TimeCode.Flag and conformance CMFormatDescriptionRef.TimeCode.Flag()
{
  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.TimeCode.Flag and conformance CMFormatDescriptionRef.TimeCode.Flag;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.TimeCode.Flag and conformance CMFormatDescriptionRef.TimeCode.Flag)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.TimeCode.Flag and conformance CMFormatDescriptionRef.TimeCode.Flag);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.TimeCode.Flag and conformance CMFormatDescriptionRef.TimeCode.Flag;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.TimeCode.Flag and conformance CMFormatDescriptionRef.TimeCode.Flag)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.TimeCode.Flag and conformance CMFormatDescriptionRef.TimeCode.Flag);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.TimeCode.Flag and conformance CMFormatDescriptionRef.TimeCode.Flag;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.TimeCode.Flag and conformance CMFormatDescriptionRef.TimeCode.Flag)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.TimeCode.Flag and conformance CMFormatDescriptionRef.TimeCode.Flag);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMFormatDescriptionRef.TimeCode.Flag and conformance CMFormatDescriptionRef.TimeCode.Flag;
  if (!lazy protocol witness table cache variable for type CMFormatDescriptionRef.TimeCode.Flag and conformance CMFormatDescriptionRef.TimeCode.Flag)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMFormatDescriptionRef.TimeCode.Flag and conformance CMFormatDescriptionRef.TimeCode.Flag);
  }
  return result;
}

uint64_t sub_1BE21E084()
{
  return 0;
}

uint64_t sub_1BE21E09C()
{
  return 0;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions()
{
  return &type metadata for CMFormatDescriptionRef.Extensions;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions.Key()
{
  return &type metadata for CMFormatDescriptionRef.Extensions.Key;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions.Value()
{
  return &type metadata for CMFormatDescriptionRef.Extensions.Value;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions.Value.FieldDetail()
{
  return &type metadata for CMFormatDescriptionRef.Extensions.Value.FieldDetail;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions.Value.ColorPrimaries()
{
  return &type metadata for CMFormatDescriptionRef.Extensions.Value.ColorPrimaries;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions.Value.TransferFunction()
{
  return &type metadata for CMFormatDescriptionRef.Extensions.Value.TransferFunction;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix()
{
  return &type metadata for CMFormatDescriptionRef.Extensions.Value.YCbCrMatrix;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions.Value.ChromaLocation()
{
  return &type metadata for CMFormatDescriptionRef.Extensions.Value.ChromaLocation;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile()
{
  return &type metadata for CMFormatDescriptionRef.Extensions.Value.MPEG2VideoProfile;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions.Value.Vendor()
{
  return &type metadata for CMFormatDescriptionRef.Extensions.Value.Vendor;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode()
{
  return &type metadata for CMFormatDescriptionRef.Extensions.Value.AlphaChannelMode;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions.Value.FontFace()
{
  return &type metadata for CMFormatDescriptionRef.Extensions.Value.FontFace;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags()
{
  return &type metadata for CMFormatDescriptionRef.Extensions.Value.TextDisplayFlags;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions.Value.TextJustification()
{
  return &type metadata for CMFormatDescriptionRef.Extensions.Value.TextJustification;
}

uint64_t destroy for CMFormatDescriptionRef.Extensions.Index(uint64_t a1)
{
  return outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t initializeBufferWithCopyOfBuffer for CMFormatDescriptionRef.Extensions.Index(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  outlined copy of [A : B].Index._Variant<A, B>(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for CMFormatDescriptionRef.Extensions.Index(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  outlined copy of [A : B].Index._Variant<A, B>(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for CMFormatDescriptionRef.Extensions.Index(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  outlined consume of [CFStringRef : Swift.AnyObject].Index._Variant(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for CMFormatDescriptionRef.Extensions.Index(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CMFormatDescriptionRef.Extensions.Index(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)unint64_t result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Extensions.Index()
{
  return &type metadata for CMFormatDescriptionRef.Extensions.Index;
}

uint64_t dispatch thunk of _CMFormatDescriptionInitTrampoline.init(referencing:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.Error()
{
  return &type metadata for CMFormatDescriptionRef.Error;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.MediaType()
{
  return &type metadata for CMFormatDescriptionRef.MediaType;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.MediaSubType()
{
  return &type metadata for CMFormatDescriptionRef.MediaSubType;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.EqualityMask()
{
  return &type metadata for CMFormatDescriptionRef.EqualityMask;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.ParameterSetCollection()
{
  return &type metadata for CMFormatDescriptionRef.ParameterSetCollection;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.TimeCode()
{
  return &type metadata for CMFormatDescriptionRef.TimeCode;
}

ValueMetadata *type metadata accessor for CMFormatDescriptionRef.TimeCode.Flag()
{
  return &type metadata for CMFormatDescriptionRef.TimeCode.Flag;
}

uint64_t outlined retain of Range<CMFormatDescriptionRef.Extensions.Index>(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = *(unsigned char *)(a1 + 40);
  outlined copy of [A : B].Index._Variant<A, B>(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  outlined copy of [A : B].Index._Variant<A, B>(v2, v3, v4);
  return a1;
}

uint64_t _sSo11CFStringRefaABSHSCWlTm_0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CFStringRef(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t CMTime.isValid.getter(uint64_t a1, unint64_t a2)
{
  return HIDWORD(a2) & 1;
}

BOOL CMTime.isIndefinite.getter(uint64_t a1, uint64_t a2)
{
  return (~a2 & 0x1100000000) == 0;
}

CMTime __swiftcall CMTime.init(value:timescale:)(Swift::Int64 value, Swift::Int32 timescale)
{
  CMTimeMake(&v5, value, timescale);
  CMTimeValue v2 = v5.value;
  uint64_t v3 = *(void *)&v5.timescale;
  CMTimeEpoch epoch = v5.epoch;
  result.CMTimeEpoch epoch = epoch;
  result.CMTimeScale timescale = v3;
  result.CMTimeFlags flags = HIDWORD(v3);
  result.CMTagValue value = v2;
  return result;
}

BOOL CMTime.isPositiveInfinity.getter(uint64_t a1, uint64_t a2)
{
  return (~a2 & 0x500000000) == 0;
}

BOOL CMTime.isNegativeInfinity.getter(uint64_t a1, uint64_t a2)
{
  return (~a2 & 0x900000000) == 0;
}

BOOL CMTime.isNumeric.getter(uint64_t a1, uint64_t a2)
{
  return (a2 & 0x1D00000000) == 0x100000000;
}

BOOL CMTime.hasBeenRounded.getter(uint64_t a1, uint64_t a2)
{
  return (a2 & 0x1F00000000) == 0x300000000;
}

CMTime __swiftcall CMTime.convertScale(_:method:)(Swift::Int32 _, CMTimeRoundingMethod method)
{
  time.CMTimeValue value = v2;
  *(void *)&time.CMTimeScale timescale = v3;
  time.CMTimeEpoch epoch = v4;
  CMTimeConvertScale(&v8, &time, _, method);
  CMTimeValue value = v8.value;
  uint64_t v6 = *(void *)&v8.timescale;
  CMTimeEpoch epoch = v8.epoch;
  result.CMTimeEpoch epoch = epoch;
  result.CMTimeScale timescale = v6;
  result.CMTimeFlags flags = HIDWORD(v6);
  result.CMTimeValue value = value;
  return result;
}

Swift::Bool __swiftcall CMTIME_IS_VALID(_:)(CMTime a1)
{
  return a1.flags & 1;
}

Swift::Bool __swiftcall CMTIME_IS_INVALID(_:)(CMTime a1)
{
  return (*(void *)&a1.timescale & 0x100000000) == 0;
}

Swift::Bool __swiftcall CMTIME_IS_POSITIVEINFINITY(_:)(CMTime a1)
{
  return (~*(void *)&a1.timescale & 0x500000000) == 0;
}

Swift::Bool __swiftcall CMTIME_IS_NEGATIVEINFINITY(_:)(CMTime a1)
{
  return (~*(void *)&a1.timescale & 0x900000000) == 0;
}

Swift::Bool __swiftcall CMTIME_IS_INDEFINITE(_:)(CMTime a1)
{
  return (~*(void *)&a1.timescale & 0x1100000000) == 0;
}

Swift::Bool __swiftcall CMTIME_IS_NUMERIC(_:)(CMTime a1)
{
  return (*(void *)&a1.timescale & 0x1D00000000) == 0x100000000;
}

Swift::Bool __swiftcall CMTIME_HAS_BEEN_ROUNDED(_:)(CMTime a1)
{
  return (*(void *)&a1.timescale & 0x1F00000000) == 0x300000000;
}

uint64_t static CMTime.+ infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return static CMTime.+ infix(_:_:)(a1, a2, a3, a4, a5, a6, MEMORY[0x1E4F1EAE8]);
}

uint64_t static CMTime.- infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return static CMTime.+ infix(_:_:)(a1, a2, a3, a4, a5, a6, MEMORY[0x1E4F1EB00]);
}

uint64_t static CMTime.+ infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t *__return_ptr, void *, void *))
{
  v10[0] = a1;
  v10[1] = a2;
  CFStringRef v10[2] = a3;
  v9[0] = a4;
  v9[1] = a5;
  CMMetadataFormatDescriptionRef v9[2] = a6;
  a7(&v8, v10, v9);
  return v8;
}

uint64_t static CMTime.< infix(_:_:)(CMTimeValue a1, uint64_t a2, CMTimeEpoch a3, CMTimeValue a4, uint64_t a5, CMTimeEpoch a6)
{
  v7.CMTimeEpoch epoch = a6;
  time1.CMTimeValue value = a1;
  *(void *)&time1.CMTimeScale timescale = a2;
  time1.CMTimeEpoch epoch = a3;
  v7.CMTimeValue value = a4;
  *(void *)&v7.CMTimeScale timescale = a5;
  return CMTimeCompare(&time1, &v7) >> 31;
}

BOOL static CMTime.<= infix(_:_:)(CMTimeValue a1, uint64_t a2, CMTimeEpoch a3, CMTimeValue a4, uint64_t a5, CMTimeEpoch a6)
{
  v7.CMTimeEpoch epoch = a6;
  time1.CMTimeValue value = a1;
  *(void *)&time1.CMTimeScale timescale = a2;
  time1.CMTimeEpoch epoch = a3;
  v7.CMTimeValue value = a4;
  *(void *)&v7.CMTimeScale timescale = a5;
  return CMTimeCompare(&time1, &v7) < 1;
}

BOOL static CMTime.> infix(_:_:)(CMTimeValue a1, uint64_t a2, CMTimeEpoch a3, CMTimeValue a4, uint64_t a5, CMTimeEpoch a6)
{
  v7.CMTimeEpoch epoch = a6;
  time1.CMTimeValue value = a1;
  *(void *)&time1.CMTimeScale timescale = a2;
  time1.CMTimeEpoch epoch = a3;
  v7.CMTimeValue value = a4;
  *(void *)&v7.CMTimeScale timescale = a5;
  return CMTimeCompare(&time1, &v7) > 0;
}

BOOL static CMTime.>= infix(_:_:)(CMTimeValue a1, uint64_t a2, CMTimeEpoch a3, CMTimeValue a4, uint64_t a5, CMTimeEpoch a6)
{
  v7.CMTimeEpoch epoch = a6;
  time1.CMTimeValue value = a1;
  *(void *)&time1.CMTimeScale timescale = a2;
  time1.CMTimeEpoch epoch = a3;
  v7.CMTimeValue value = a4;
  *(void *)&v7.CMTimeScale timescale = a5;
  return CMTimeCompare(&time1, &v7) >= 0;
}

BOOL static CMTime.!= infix(_:_:)(CMTimeValue a1, uint64_t a2, CMTimeEpoch a3, CMTimeValue a4, uint64_t a5, CMTimeEpoch a6)
{
  v7.CMTimeEpoch epoch = a6;
  time1.CMTimeValue value = a1;
  *(void *)&time1.CMTimeScale timescale = a2;
  time1.CMTimeEpoch epoch = a3;
  v7.CMTimeValue value = a4;
  *(void *)&v7.CMTimeScale timescale = a5;
  return CMTimeCompare(&time1, &v7) != 0;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CMTime(CMTimeValue *a1, CMTimeValue *a2)
{
  CMTimeValue v2 = *a1;
  CMTimeEpoch v3 = a1[2];
  CMTimeValue v4 = *a2;
  v6.CMTimeEpoch epoch = a2[2];
  time1.CMTimeValue value = v2;
  *(void *)&time1.CMTimeScale timescale = a1[1];
  time1.CMTimeEpoch epoch = v3;
  v6.CMTimeValue value = v4;
  *(void *)&v6.CMTimeScale timescale = a2[1];
  return CMTimeCompare(&time1, &v6) == 0;
}

uint64_t protocol witness for static Comparable.< infix(_:_:) in conformance CMTime(CMTimeValue *a1, CMTimeValue *a2)
{
  CMTimeValue v2 = *a1;
  CMTimeEpoch v3 = a1[2];
  CMTimeValue v4 = *a2;
  v6.CMTimeEpoch epoch = a2[2];
  time1.CMTimeValue value = v2;
  *(void *)&time1.CMTimeScale timescale = a1[1];
  time1.CMTimeEpoch epoch = v3;
  v6.CMTimeValue value = v4;
  *(void *)&v6.CMTimeScale timescale = a2[1];
  return CMTimeCompare(&time1, &v6) >> 31;
}

BOOL protocol witness for static Comparable.<= infix(_:_:) in conformance CMTime(CMTimeValue *a1, CMTimeValue *a2)
{
  CMTimeValue v2 = *a1;
  CMTimeEpoch v3 = a1[2];
  CMTimeValue v4 = *a2;
  v6.CMTimeEpoch epoch = a2[2];
  time1.CMTimeValue value = v2;
  *(void *)&time1.CMTimeScale timescale = a1[1];
  time1.CMTimeEpoch epoch = v3;
  v6.CMTimeValue value = v4;
  *(void *)&v6.CMTimeScale timescale = a2[1];
  return CMTimeCompare(&time1, &v6) < 1;
}

BOOL protocol witness for static Comparable.>= infix(_:_:) in conformance CMTime(CMTimeValue *a1, CMTimeValue *a2)
{
  CMTimeValue v2 = *a1;
  CMTimeEpoch v3 = a1[2];
  CMTimeValue v4 = *a2;
  v6.CMTimeEpoch epoch = a2[2];
  time1.CMTimeValue value = v2;
  *(void *)&time1.CMTimeScale timescale = a1[1];
  time1.CMTimeEpoch epoch = v3;
  v6.CMTimeValue value = v4;
  *(void *)&v6.CMTimeScale timescale = a2[1];
  return CMTimeCompare(&time1, &v6) >= 0;
}

BOOL protocol witness for static Comparable.> infix(_:_:) in conformance CMTime(CMTimeValue *a1, CMTimeValue *a2)
{
  CMTimeValue v2 = *a1;
  CMTimeEpoch v3 = a1[2];
  CMTimeValue v4 = *a2;
  v6.CMTimeEpoch epoch = a2[2];
  time1.CMTimeValue value = v2;
  *(void *)&time1.CMTimeScale timescale = a1[1];
  time1.CMTimeEpoch epoch = v3;
  v6.CMTimeValue value = v4;
  *(void *)&v6.CMTimeScale timescale = a2[1];
  return CMTimeCompare(&time1, &v6) > 0;
}

void CMTime.hash(into:)(uint64_t a1, int64_t a2, Swift::UInt64 a3, Swift::UInt64 a4)
{
  Swift::UInt64 v5 = a3;
  Swift::UInt64 v7 = HIDWORD(a3);
  Hasher._combine(_:)(HIDWORD(a3) & 0xFFFFFFFD);
  if ((v7 & 0x1D) == 1)
  {
    Swift::UInt64 v8 = v5 << 32;
    Swift::UInt64 v5 = (int)v5;
    uint64_t v9 = a2;
    if (v8)
    {
      uint64_t v10 = (int)v5;
      uint64_t v11 = a2;
      while (1)
      {
        uint64_t v9 = v10;
        if (v10 == -1 && v11 == 0x8000000000000000) {
          break;
        }
        uint64_t v10 = v11 % v10;
        uint64_t v11 = v9;
        if (!v10) {
          goto LABEL_8;
        }
      }
      __break(1u);
    }
LABEL_8:
    if (v9)
    {
      if (a2 == 0x8000000000000000 && v9 == -1)
      {
        __break(1u);
        return;
      }
      a2 /= v9;
      Swift::UInt64 v5 = (int)v5 / v9;
    }
    Hasher._combine(_:)(a2);
    Hasher._combine(_:)(v5);
    Hasher._combine(_:)(a4);
  }
}

void CMTime.hashValue.getter(int64_t a1, Swift::UInt64 a2, Swift::UInt64 a3)
{
  Swift::UInt64 v4 = a2;
  Swift::UInt64 v6 = HIDWORD(a2);
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v6 & 0xFFFFFFFD);
  if ((v6 & 0x1D) != 1) {
    goto LABEL_13;
  }
  Swift::UInt64 v7 = v4 << 32;
  Swift::UInt64 v4 = (int)v4;
  uint64_t v8 = a1;
  if (v7)
  {
    uint64_t v9 = (int)v4;
    uint64_t v10 = a1;
    while (1)
    {
      uint64_t v8 = v9;
      if (v9 == -1 && v10 == 0x8000000000000000) {
        break;
      }
      uint64_t v9 = v10 % v9;
      uint64_t v10 = v8;
      if (!v9) {
        goto LABEL_8;
      }
    }
    __break(1u);
  }
LABEL_8:
  if (!v8)
  {
LABEL_12:
    Hasher._combine(_:)(a1);
    Hasher._combine(_:)(v4);
    Hasher._combine(_:)(a3);
LABEL_13:
    Hasher._finalize()();
    return;
  }
  if (a1 != 0x8000000000000000 || v8 != -1)
  {
    a1 /= v8;
    Swift::UInt64 v4 = (int)v4 / v8;
    goto LABEL_12;
  }
  __break(1u);
}

void protocol witness for Hashable.hashValue.getter in conformance CMTime()
{
  CMTime.hashValue.getter(*(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16));
}

void protocol witness for Hashable.hash(into:) in conformance CMTime(uint64_t a1)
{
  CMTime.hash(into:)(a1, *(void *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16));
}

void protocol witness for Hashable._rawHashValue(seed:) in conformance CMTime()
{
  int64_t v1 = *(void *)v0;
  int v2 = *(_DWORD *)(v0 + 12);
  int64_t v3 = *(int *)(v0 + 8);
  Swift::UInt64 v4 = *(void *)(v0 + 16);
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v2 & 0xFFFFFFFD);
  if ((v2 & 0x1D) != 1) {
    goto LABEL_13;
  }
  uint64_t v5 = v1;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v7 = v1;
    while (1)
    {
      uint64_t v5 = v6;
      if (v6 == -1 && v7 == 0x8000000000000000) {
        break;
      }
      uint64_t v6 = v7 % v6;
      uint64_t v7 = v5;
      if (!v6) {
        goto LABEL_8;
      }
    }
    __break(1u);
  }
LABEL_8:
  if (!v5)
  {
LABEL_12:
    Hasher._combine(_:)(v1);
    Hasher._combine(_:)(v3);
    Hasher._combine(_:)(v4);
LABEL_13:
    Hasher._finalize()();
    return;
  }
  if (v1 != 0x8000000000000000 || v5 != -1)
  {
    v1 /= v5;
    v3 /= v5;
    goto LABEL_12;
  }
  __break(1u);
}

Swift::Int __swiftcall CMTime.compareApproximately(to:)(CMTime to)
{
  CMTime v5 = to;
  v6.CMTimeValue value = v1;
  *(void *)&v6.CMTimeScale timescale = v2;
  v6.CMTimeEpoch epoch = v3;
  return (int)CMTimeCompareApproximately(&v6, &v5);
}

CMTime __swiftcall CMTime.fromSourceTimeToTargetTime(speedRamp:)(Swift::OpaquePointer speedRamp)
{
  CMTimeValue v4 = CMTime.fromSourceTimeToTargetTime(speedRamp:)((uint64_t)speedRamp._rawValue, v1, v2, v3, MEMORY[0x1E4F1EAD8]);
  result.CMTimeEpoch epoch = v6;
  result.CMTimeScale timescale = v5;
  result.CMTimeFlags flags = HIDWORD(v5);
  result.CMTimeValue value = v4;
  return result;
}

CMTime __swiftcall CMTime.fromTargetTimeToSourceTime(speedRamp:)(Swift::OpaquePointer speedRamp)
{
  CMTimeValue v4 = CMTime.fromSourceTimeToTargetTime(speedRamp:)((uint64_t)speedRamp._rawValue, v1, v2, v3, MEMORY[0x1E4F1EAE0]);
  result.CMTimeEpoch epoch = v6;
  result.CMTimeScale timescale = v5;
  result.CMTimeFlags flags = HIDWORD(v5);
  result.CMTimeValue value = v4;
  return result;
}

uint64_t CMTime.fromSourceTimeToTargetTime(speedRamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t *__return_ptr, void *, uint64_t, uint64_t))
{
  uint64_t v5 = *(void *)(a1 + 16);
  v8[0] = a2;
  v8[1] = a3;
  _OWORD v8[2] = a4;
  a5(&v7, v8, a1 + 32, v5);
  return v7;
}

uint64_t CMTimeCompareApproximately(CMTime *a1, CMTime *a2)
{
  if ((a1->flags & 0x1F) == 3 || (a2->flags & 0x1F) == 3)
  {
    memset(&time1, 0, sizeof(time1));
    CMTime lhs = *a1;
    CMTime rhs = *a2;
    CMTimeSubtract(&time, &lhs, &rhs);
    CMTimeAbsoluteValue(&time1, &time);
    CMTimeMake(&time2, 1, 1000000000);
    CMTime lhs = time1;
    if (CMTimeCompare(&lhs, &time2) < 1) {
      return 0;
    }
  }
  CMTime time1 = *a1;
  CMTime lhs = *a2;
  return CMTimeCompare(&time1, &lhs);
}

unint64_t lazy protocol witness table accessor for type CMTime and conformance CMTime()
{
  unint64_t result = lazy protocol witness table cache variable for type CMTime and conformance CMTime;
  if (!lazy protocol witness table cache variable for type CMTime and conformance CMTime)
  {
    type metadata accessor for CMTime(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMTime and conformance CMTime);
  }
  return result;
}

CMTagCollectionRef Array<A>.tagCollection.getter(unint64_t a1)
{
  newCollectionOut[1] = *(CMTagCollectionRef *)MEMORY[0x1E4F143B8];
  newCollectionOut[0] = 0;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = MEMORY[0x1E4FBC860];
  if (v2)
  {
    uint64_t v34 = MEMORY[0x1E4FBC860];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0)
    {
      __break(1u);
LABEL_29:
      __break(1u);
    }
    uint64_t v3 = v34;
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v4 = 0;
      do
      {
        uint64_t v5 = MEMORY[0x1C188D620](v4, a1);
        CMTagCategory v6 = *(_DWORD *)(v5 + 16);
        uint64_t v7 = *(void *)(v5 + 24);
        switch(*(unsigned char *)(v5 + 32))
        {
          case 1:
            CMTag v11 = CMTagMakeWithFloat64Value(v6, *(Float64 *)(v5 + 24));
            CMTagValue value = v11.value;
            uint64_t v8 = *(void *)&v11.category;
            break;
          case 2:
            CMTag v12 = CMTagMakeWithOSTypeValue(v6, v7);
            CMTagValue value = v12.value;
            uint64_t v8 = *(void *)&v12.category;
            break;
          case 3:
            CMTag v13 = CMTagMakeWithFlagsValue(v6, v7);
            CMTagValue value = v13.value;
            uint64_t v8 = *(void *)&v13.category;
            break;
          default:
            CMTag v10 = CMTagMakeWithSInt64Value(v6, v7);
            CMTagValue value = v10.value;
            uint64_t v8 = *(void *)&v10.category;
            break;
        }
        uint64_t v14 = v8;
        CMTagValue v15 = value;
        swift_unknownObjectRelease();
        unint64_t v17 = *(void *)(v34 + 16);
        unint64_t v16 = *(void *)(v34 + 24);
        if (v17 >= v16 >> 1) {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v16 > 1), v17 + 1, 1);
        }
        ++v4;
        *(void *)(v34 + 16) = v17 + 1;
        uint64_t v18 = v34 + 16 * v17;
        *(void *)(v18 + 32) = v14;
        *(void *)(v18 + 40) = v15;
      }
      while (v2 != v4);
    }
    else
    {
      unint64_t v19 = a1 + 32;
      do
      {
        CMTagCategory v20 = *(_DWORD *)(*(void *)v19 + 16);
        uint64_t v21 = *(void *)(*(void *)v19 + 24);
        switch(*(unsigned char *)(*(void *)v19 + 32))
        {
          case 1:
            CMTag v25 = CMTagMakeWithFloat64Value(v20, *(Float64 *)(*(void *)v19 + 24));
            CMTagValue v23 = v25.value;
            uint64_t v22 = *(void *)&v25.category;
            break;
          case 2:
            CMTag v26 = CMTagMakeWithOSTypeValue(v20, v21);
            CMTagValue v23 = v26.value;
            uint64_t v22 = *(void *)&v26.category;
            break;
          case 3:
            CMTag v27 = CMTagMakeWithFlagsValue(v20, v21);
            CMTagValue v23 = v27.value;
            uint64_t v22 = *(void *)&v27.category;
            break;
          default:
            CMTag v24 = CMTagMakeWithSInt64Value(v20, v21);
            CMTagValue v23 = v24.value;
            uint64_t v22 = *(void *)&v24.category;
            break;
        }
        uint64_t v28 = v22;
        CMTagValue v29 = v23;
        unint64_t v31 = *(void *)(v34 + 16);
        unint64_t v30 = *(void *)(v34 + 24);
        if (v31 >= v30 >> 1) {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v30 > 1), v31 + 1, 1);
        }
        *(void *)(v34 + 16) = v31 + 1;
        uint64_t v32 = v34 + 16 * v31;
        *(void *)(v32 + 32) = v28;
        *(void *)(v32 + 40) = v29;
        v19 += 8;
        --v2;
      }
      while (v2);
    }
  }
  closure #2 in Array<A>.tagCollection.getter((CMTag *)(v3 + 32), *(void *)(v3 + 16), a1, newCollectionOut);
  swift_bridgeObjectRelease();
  CMTagCollectionRef result = newCollectionOut[0];
  if (!newCollectionOut[0]) {
    goto LABEL_29;
  }
  return result;
}

uint64_t closure #2 in Array<A>.tagCollection.getter(CMTag *tags, int a2, unint64_t a3, CMTagCollectionRef *newCollectionOut)
{
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    CMItemCount v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    CMItemCount v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  OSStatus v8 = CMTagCollectionCreate(v6, tags, v7, newCollectionOut);
  uint64_t result = noErr.getter();
  if (v8 != result || !*newCollectionOut)
  {
    _StringGuts.grow(_:)(43);
    swift_bridgeObjectRelease();
    v10._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v10);
    swift_bridgeObjectRelease();
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
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

void *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(void *a1, int64_t a2, char a3)
{
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CMTag>);
    Swift::String v10 = (char *)swift_allocObject();
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
    Swift::String v10 = (char *)MEMORY[0x1E4FBC860];
  }
  CMTag v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UnsafeMutableRawPointer?>);
    Swift::String v10 = (char *)swift_allocObject();
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
    Swift::String v10 = (char *)MEMORY[0x1E4FBC860];
  }
  CMTag v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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

void *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<[CMTag]>);
    Swift::String v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    CFStringRef v10[2] = v8;
    void v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    Swift::String v10 = (void *)MEMORY[0x1E4FBC860];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [CMTag]);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t specialized Array<A>.init(tagCollection:)(const OpaqueCMTagCollection *a1)
{
  CMItemCount Count = CMTagCollectionGetCount(a1);
  if (Count < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  CMItemCount v3 = Count;
  uint64_t v4 = MEMORY[0x1E4FBC860];
  if (Count)
  {
    uint64_t v5 = *MEMORY[0x1E4F1F3D8];
    uint64_t v6 = *(void *)(MEMORY[0x1E4F1F3D8] + 8);
    type metadata accessor for CMTag(0);
    uint64_t v7 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    uint64_t v8 = v7;
    *(void *)(v7 + 16) = v3;
    uint64_t v9 = 32;
    do
    {
      Swift::String v10 = (void *)(v7 + v9);
      void *v10 = v5;
      v10[1] = v6;
      v9 += 16;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v8 = MEMORY[0x1E4FBC860];
  }
  OSStatus Tags = CMTagCollectionGetTags(a1, (CMTag *)(v8 + 32), *(void *)(v8 + 16), 0);
  if (Tags != noErr.getter())
  {
    while (1)
    {
      _StringGuts.grow(_:)(35);
      swift_bridgeObjectRelease();
      v25._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v25);
      swift_bridgeObjectRelease();
      v26._countAndFlagsBits = 0xD00000000000001BLL;
      v26._object = (void *)0x80000001BE228200;
      String.append(_:)(v26);
LABEL_23:
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
    }
  }
  uint64_t v27 = v4;
  uint64_t v12 = *(void *)(v8 + 16);
  swift_bridgeObjectRetain();
  if (v12)
  {
    CMTag v13 = (CMTagValue *)(v8 + 40);
    do
    {
      unint64_t v18 = *(v13 - 1);
      CMTagValue v17 = *v13;
      if (CMTagIsValid(v18))
      {
        *(void *)&v29.category = v18;
        v29.CMTagValue value = v17;
        CMTagDataType ValueDataType = CMTagGetValueDataType(v29);
        int v20 = CMTimebaseRef.NotificationKey.rawValue.modify(v18, v17);
        switch(ValueDataType)
        {
          case kCMTagDataType_SInt64:
            *(void *)&v30.category = v18;
            v30.CMTagValue value = v17;
            int64_t SInt64Value = CMTagGetSInt64Value(v30);
            type metadata accessor for CMTag();
            uint64_t v15 = swift_allocObject();
            char v16 = 0;
            *(_DWORD *)(v15 + 16) = v20;
            *(void *)(v15 + 24) = SInt64Value;
            goto LABEL_11;
          case kCMTagDataType_Float64:
            *(void *)&v32.category = v18;
            v32.CMTagValue value = v17;
            Float64 Float64Value = CMTagGetFloat64Value(v32);
            type metadata accessor for CMTag();
            uint64_t v15 = swift_allocObject();
            *(_DWORD *)(v15 + 16) = v20;
            *(Float64 *)(v15 + 24) = Float64Value;
            char v16 = 1;
            goto LABEL_11;
          case kCMTagDataType_OSType:
            *(void *)&v31.category = v18;
            v31.CMTagValue value = v17;
            uint64_t OSTypeValue = CMTagGetOSTypeValue(v31);
            type metadata accessor for CMTag();
            uint64_t v15 = swift_allocObject();
            *(_DWORD *)(v15 + 16) = v20;
            *(void *)(v15 + 24) = OSTypeValue;
            char v16 = 2;
            goto LABEL_11;
          case kCMTagDataType_Flags:
            *(void *)&v28.category = v18;
            v28.CMTagValue value = v17;
            uint64_t FlagsValue = CMTagGetFlagsValue(v28);
            type metadata accessor for CMTag();
            uint64_t v15 = swift_allocObject();
            *(_DWORD *)(v15 + 16) = v20;
            *(void *)(v15 + 24) = FlagsValue;
            char v16 = 3;
LABEL_11:
            *(unsigned char *)(v15 + 32) = v16;
            MEMORY[0x1C188D4A0]();
            if (*(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
            }
            specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
            specialized Array._endMutation()();
            break;
          default:
            goto LABEL_23;
        }
      }
      v13 += 2;
      --v12;
    }
    while (v12);
    uint64_t v4 = v27;
  }
  swift_bridgeObjectRelease_n();

  return v4;
}

BOOL CMTagIsValid(unint64_t a1)
{
  return HIDWORD(a1) != 0;
}

uint64_t specialized SetAlgebra<>.init(arrayLiteral:)@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    int v4 = 0;
    uint64_t v5 = (unsigned __int8 *)(a1 + 32);
    do
    {
      int v7 = *v5++;
      int v6 = v7;
      if ((v7 & ~v4) == 0) {
        int v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t specialized SetAlgebra<>.init(arrayLiteral:)@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    int v4 = 0;
    uint64_t v5 = (int *)(a1 + 32);
    do
    {
      int v7 = *v5++;
      int v6 = v7;
      if ((v7 & ~v4) == 0) {
        int v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    int v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

size_t CMBlockBufferRef.endIndex.getter()
{
  return CMBlockBufferGetDataLength(v0);
}

id CMBlockBufferRef.Slice.owner.getter()
{
  return *v0;
}

uint64_t CMBlockBufferRef.Slice.startIndex.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t CMBlockBufferRef.Slice.endIndex.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t protocol witness for CMBlockBufferProtocol.startIndex.getter in conformance CMBlockBufferRef.Slice()
{
  return *(void *)(v0 + 8);
}

uint64_t protocol witness for CMBlockBufferProtocol.endIndex.getter in conformance CMBlockBufferRef.Slice()
{
  return *(void *)(v0 + 16);
}

id CMBlockBufferRef.owner.getter()
{
  return v0;
}

uint64_t CMBlockBufferRef.startIndex.getter()
{
  return 0;
}

size_t protocol witness for CMBlockBufferProtocol.endIndex.getter in conformance CMBlockBufferRef()
{
  return CMBlockBufferGetDataLength(*v0);
}

OpaqueCMBlockBuffer *CMBlockBufferProtocol.subscript.getter@<X0>(OpaqueCMBlockBuffer *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, OpaqueCMBlockBuffer **a5@<X8>)
{
  uint64_t result = (OpaqueCMBlockBuffer *)(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a3, a4);
  BOOL v9 = __OFADD__(a2, 1);
  uint64_t v10 = a2 + 1;
  if (v9)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (((unint64_t)a1 & 0x8000000000000000) != 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  int64_t v11 = result;
  uint64_t result = (OpaqueCMBlockBuffer *)CMBlockBufferGetDataLength(result);
  if ((uint64_t)result >= v10)
  {
    *a5 = v11;
    a5[1] = a1;
    a5[2] = (OpaqueCMBlockBuffer *)v10;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

{
  OpaqueCMBlockBuffer *result;
  OpaqueCMBlockBuffer *v9;

  uint64_t result = (OpaqueCMBlockBuffer *)(*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a3, a4);
  if (((unint64_t)a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    BOOL v9 = result;
    uint64_t result = (OpaqueCMBlockBuffer *)CMBlockBufferGetDataLength(result);
    if ((uint64_t)result >= a2)
    {
      *a5 = v9;
      a5[1] = a1;
      a5[2] = (OpaqueCMBlockBuffer *)a2;
      return result;
    }
  }
  __break(1u);
  return result;
}

int64_t CMBlockBufferProtocol.subscript.getter@<X0>(int64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, OpaqueCMBlockBuffer **a4@<X8>)
{
  int v6 = (OpaqueCMBlockBuffer *)(*(uint64_t (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
  int64_t result = CMBlockBufferGetDataLength(v6);
  if (result < a1)
  {
    __break(1u);
  }
  else
  {
    *a4 = v6;
    a4[1] = 0;
    a4[2] = (OpaqueCMBlockBuffer *)a1;
  }
  return result;
}

OpaqueCMBlockBuffer *CMBlockBufferProtocol.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, OpaqueCMBlockBuffer **a4@<X8>)
{
  int64_t result = (OpaqueCMBlockBuffer *)(*(uint64_t (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
  BOOL v7 = __OFADD__(a1, 1);
  uint64_t v8 = a1 + 1;
  if (v7)
  {
    __break(1u);
  }
  else
  {
    BOOL v9 = result;
    int64_t result = (OpaqueCMBlockBuffer *)CMBlockBufferGetDataLength(result);
    if ((uint64_t)result >= v8)
    {
      *a4 = v9;
      a4[1] = 0;
      a4[2] = (OpaqueCMBlockBuffer *)v8;
      return result;
    }
  }
  __break(1u);
  return result;
}

void CMBlockBufferProtocol.subscript.getter(OpaqueCMBlockBuffer *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, OpaqueCMBlockBuffer **a4@<X8>)
{
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 8);
  BOOL v9 = (OpaqueCMBlockBuffer *)v8(a2, a3);
  uint64_t v10 = (OpaqueCMBlockBuffer *)v8(a2, a3);
  DataCFIndex Length = CMBlockBufferGetDataLength(v10);

  if (((unint64_t)a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if ((uint64_t)CMBlockBufferGetDataLength(v9) >= DataLength)
  {
    *a4 = v9;
    a4[1] = a1;
    a4[2] = (OpaqueCMBlockBuffer *)DataLength;
    return;
  }
  __break(1u);
}

int64_t CMBlockBufferProtocol.subscript.getter@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, OpaqueCMBlockBuffer **a3@<X8>)
{
  int v6 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 8);
  BOOL v7 = (OpaqueCMBlockBuffer *)v6(a1, a2);
  uint64_t v8 = (OpaqueCMBlockBuffer *)v6(a1, a2);
  DataCFIndex Length = CMBlockBufferGetDataLength(v8);

  int64_t result = CMBlockBufferGetDataLength(v7);
  if (result < DataLength)
  {
    __break(1u);
  }
  else
  {
    *a3 = v7;
    a3[1] = 0;
    a3[2] = (OpaqueCMBlockBuffer *)DataLength;
  }
  return result;
}

uint64_t CustomAllocatorAllocateBlock(refcon:sizeInBytes:)(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  swift_unknownObjectRetain();
  swift_dynamicCast();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v6);
  if (!v5
    || (swift_retain(),
        uint64_t v3 = v5(a2),
        outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?((uint64_t)v5),
        outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?((uint64_t)v5),
        !v3))
  {
    __break(1u);
    return 0;
  }
  return v3;
}

uint64_t CustomAllocatorFreeBlock(refcon:doomedMemoryBlock:sizeInBytes:)(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    swift_unknownObjectRetain();
    swift_dynamicCast();
    swift_unknownObjectRelease();
    int64_t result = outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?(v5);
    if (v6)
    {
      swift_retain();
      v6(a2, a3);
      outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?((uint64_t)v6);
      return outlined consume of (@escaping @callee_guaranteed (@guaranteed Swift.AnyObject) -> (@unowned Bool))?((uint64_t)v6);
    }
  }
  return result;
}

void _CMBlockBufferInitTrampoline.init(capacity:flags:)(unint64_t subBlockCapacity, CMBlockBufferFlags *a2, uint64_t a3, uint64_t a4)
{
  v10[1] = *(CMBlockBufferRef *)MEMORY[0x1E4F143B8];
  if (HIDWORD(subBlockCapacity)) {
    __break(1u);
  }
  CMBlockBufferFlags v6 = *a2;
  v10[0] = 0;
  OSStatus Empty = CMBlockBufferCreateEmpty((CFAllocatorRef)*MEMORY[0x1E4F1CF80], subBlockCapacity, v6, v10);
  CMBlockBufferRef v8 = v10[0];
  if (Empty == noErr.getter())
  {
    if (v8) {
      (*(void (**)(CMBlockBufferRef, uint64_t, uint64_t))(a4 + 8))(v8, a3, a4);
    }
    else {
      __break(1u);
    }
  }
  else
  {
    id v9 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v9 initWithDomain:MEMORY[0x1E4F28760] code:Empty userInfo:0];
    swift_willThrow();
  }
}

void _CMBlockBufferInitTrampoline.init(buffer:allocator:flags:)(void *memoryBlock, uint64_t a2, CFAllocatorRef blockAllocator, CMBlockBufferFlags *a4, uint64_t a5, uint64_t a6)
{
  if (memoryBlock) {
    int64_t v7 = a2 - (void)memoryBlock;
  }
  else {
    int64_t v7 = 0;
  }
  if (v7 < 0)
  {
    __break(1u);
  }
  else
  {
    CMBlockBufferFlags v8 = *a4;
    _CMBlockBufferInitTrampoline.init(buffer:allocator:flags:)(0, v7, memoryBlock, a2, blockAllocator, &v8, a5, a6);
  }
}

void _CMBlockBufferInitTrampoline.init(buffer:allocator:flags:)(int64_t offsetToData, int64_t a2, void *memoryBlock, uint64_t a4, CFAllocatorRef blockAllocator, CMBlockBufferFlags *a6, uint64_t a7, uint64_t a8)
{
  blockBufferOut[1] = *(CMBlockBufferRef *)MEMORY[0x1E4F143B8];
  int64_t v8 = a4 - (void)memoryBlock;
  if (!memoryBlock) {
    int64_t v8 = 0;
  }
  if (offsetToData < 0 || v8 < offsetToData)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (a2 < 0 || v8 < a2) {
LABEL_12:
  }
    __break(1u);
  CMBlockBufferFlags v11 = *a6;
  blockBufferOut[0] = 0;
  OSStatus v12 = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E4F1CF80], memoryBlock, v8, blockAllocator, 0, offsetToData, a2 - offsetToData, v11, blockBufferOut);
  CMBlockBufferRef v13 = blockBufferOut[0];
  if (v12 == noErr.getter())
  {
    if (v13)
    {
      uint64_t v14 = *(void (**)(void))(a8 + 8);
      uint64_t v15 = v13;
      v14();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    id v16 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v16 initWithDomain:*MEMORY[0x1E4F28760] code:v12 userInfo:0];
    swift_willThrow();
  }
}

void _CMBlockBufferInitTrampoline.init(length:allocator:range:flags:)(size_t blockLength, CFAllocatorRef blockAllocator, size_t offsetToData, uint64_t a4, char a5, CMBlockBufferFlags *a6, uint64_t a7, uint64_t a8)
{
  size_t v9 = offsetToData;
  blockBufferOut[1] = *(CMBlockBufferRef *)MEMORY[0x1E4F143B8];
  CMBlockBufferFlags v11 = *a6;
  if (a5) {
    goto LABEL_5;
  }
  size_t v12 = a4 - offsetToData;
  if (__OFSUB__(a4, offsetToData))
  {
    __break(1u);
LABEL_5:
    size_t v9 = 0;
    size_t v12 = blockLength;
  }
  blockBufferOut[0] = 0;
  OSStatus v13 = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, blockLength, blockAllocator, 0, v9, v12, v11, blockBufferOut);
  CMBlockBufferRef v14 = blockBufferOut[0];
  if (v13 == noErr.getter())
  {
    if (v14)
    {
      uint64_t v15 = *(void (**)(void))(a8 + 8);
      id v16 = v14;
      v15();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    id v17 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v17 initWithDomain:MEMORY[0x1E4F28760] code:v13 userInfo:0];
    swift_willThrow();
  }
}

void *_CMBlockBufferInitTrampoline.init(buffer:deallocator:flags:)(void *result, uint64_t a2, uint64_t a3, uint64_t a4, CMBlockBufferFlags *a5, uint64_t a6, uint64_t a7)
{
  if (result) {
    int64_t v10 = a2 - (void)result;
  }
  else {
    int64_t v10 = 0;
  }
  if (v10 < 0)
  {
    __break(1u);
  }
  else
  {
    CMBlockBufferFlags v11 = *a5;
    return (void *)_CMBlockBufferInitTrampoline.init(buffer:deallocator:flags:)(0, v10, result, a2, a3, a4, &v11, a6, a7);
  }
  return result;
}

uint64_t _CMBlockBufferInitTrampoline.init(buffer:deallocator:flags:)(int64_t a1, int64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, CMBlockBufferFlags *a7, uint64_t a8, uint64_t a9)
{
  blockBufferOut[1] = *(CMBlockBufferRef *)MEMORY[0x1E4F143B8];
  if (a3) {
    int64_t v9 = a4 - (void)a3;
  }
  else {
    int64_t v9 = 0;
  }
  if (a1 < 0 || v9 < a1)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (a2 < 0 || v9 < a2) {
LABEL_14:
  }
    __break(1u);
  CMBlockBufferFlags v12 = *a7;
  size_t v13 = a2 - a1;
  blockBufferOut[0] = 0;
  swift_retain();
  customBlockSource.version = 0;
  customBlockSource.AllocateBlock = (void *(__cdecl *)(void *, size_t))@objc CustomAllocatorAllocateBlock(refcon:sizeInBytes:);
  customBlockSource.FreeBlock = (void (__cdecl *)(void *, void *, size_t))@objc CustomAllocatorFreeBlock(refcon:doomedMemoryBlock:sizeInBytes:);
  customBlockSource.refCon = (void *)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
  OSStatus v14 = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3, v9, 0, &customBlockSource, a1, v13, v12, blockBufferOut);
  CMBlockBufferRef v15 = blockBufferOut[0];
  uint64_t result = noErr.getter();
  if (v14 != result)
  {
    id v19 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v19 initWithDomain:MEMORY[0x1E4F28760] code:v14 userInfo:0];
    swift_willThrow();

    return swift_release();
  }
  if (v15)
  {
    id v17 = *(void (**)(void))(a9 + 8);
    unint64_t v18 = v15;
    v17();

    return swift_release();
  }
  __break(1u);
  return result;
}

uint64_t _CMBlockBufferInitTrampoline.init(length:allocator:deallocator:range:flags:)(size_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, size_t a6, uint64_t a7, char a8, CMBlockBufferFlags *a9, uint64_t a10, uint64_t a11)
{
  blockBufferOut[1] = *(CMBlockBufferRef *)MEMORY[0x1E4F143B8];
  CMBlockBufferFlags v12 = *a9;
  if (a8) {
    goto LABEL_5;
  }
  size_t v13 = a6;
  size_t v14 = a7 - a6;
  if (__OFSUB__(a7, a6))
  {
    __break(1u);
LABEL_5:
    size_t v13 = 0;
    size_t v14 = a1;
  }
  blockBufferOut[0] = 0;
  swift_retain();
  swift_retain();
  customBlockSource.version = 0;
  customBlockSource.AllocateBlock = (void *(__cdecl *)(void *, size_t))@objc CustomAllocatorAllocateBlock(refcon:sizeInBytes:);
  customBlockSource.FreeBlock = (void (__cdecl *)(void *, void *, size_t))@objc CustomAllocatorFreeBlock(refcon:doomedMemoryBlock:sizeInBytes:);
  customBlockSource.refCon = (void *)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
  OSStatus v15 = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, a1, 0, &customBlockSource, v13, v14, v12, blockBufferOut);
  CMBlockBufferRef v16 = blockBufferOut[0];
  uint64_t result = noErr.getter();
  if (v15 == result)
  {
    if (v16)
    {
      unint64_t v18 = *(void (**)(void))(a11 + 8);
      id v19 = v16;
      v18();

      swift_release();
      return swift_release();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    id v20 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v20 initWithDomain:*MEMORY[0x1E4F28760] code:v15 userInfo:0];
    swift_willThrow();

    swift_release();
    return swift_release();
  }
  return result;
}

void _CMBlockBufferInitTrampoline.init<A>(bufferReference:flags:)(uint64_t a1, CMBlockBufferFlags *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (**a6)(uint64_t, uint64_t))
{
  v14[1] = *(CMBlockBufferRef *)MEMORY[0x1E4F143B8];
  CMBlockBufferFlags v9 = *a2;
  v14[0] = 0;
  int v10 = closure #1 in _CMBlockBufferInitTrampoline.init<A>(bufferReference:flags:)(a1, v9, v14, a3, a4, a5, a6);
  if (v10 == noErr.getter())
  {
    if (v14[0])
    {
      CMBlockBufferFlags v11 = *(void (**)(void))(a5 + 8);
      CMBlockBufferFlags v12 = v14[0];
      v11();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(a4 - 8) + 8))(a1, a4);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    id v13 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v13 initWithDomain:*MEMORY[0x1E4F28760] code:v10 userInfo:0];
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(a4 - 8) + 8))(a1, a4);
  }
}

uint64_t closure #1 in _CMBlockBufferInitTrampoline.init<A>(bufferReference:flags:)(uint64_t a1, CMBlockBufferFlags a2, CMBlockBufferRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (**a7)(uint64_t, uint64_t))
{
  CMBlockBufferFlags v11 = (OpaqueCMBlockBuffer *)a7[1](a5, (uint64_t)a7);
  CMBlockBufferFlags v12 = a7[2];
  size_t v13 = v12(a5, (uint64_t)a7);
  uint64_t v14 = a7[3](a5, (uint64_t)a7);
  uint64_t result = v12(a5, (uint64_t)a7);
  if (__OFSUB__(v14, result))
  {
    __break(1u);
  }
  else
  {
    uint64_t v16 = CMBlockBufferCreateWithBufferReference((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v11, v13, v14 - result, a2, a3);

    return v16;
  }
  return result;
}

uint64_t CMBlockBufferProtocol.dataLength.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(void))(a2 + 24))();
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  BOOL v6 = __OFSUB__(v4, v5);
  uint64_t result = v4 - v5;
  if (v6) {
    __break(1u);
  }
  return result;
}

id one-time initialization function for structureAllocationFailed()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:*MEMORY[0x1E4F28760] code:-12700 userInfo:0];
  static CMBlockBufferRef.Error.structureAllocationFailed = (uint64_t)result;
  return result;
}

id static CMBlockBufferRef.Error.structureAllocationFailed.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for structureAllocationFailed, (void **)&static CMBlockBufferRef.Error.structureAllocationFailed);
}

id one-time initialization function for blockAllocationFailed()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 sel_initWithDomain_code_userInfo_:*MEMORY[0x1E4F28760] code:-12701 userInfo:0];
  static CMBlockBufferRef.Error.blockAllocationFailed = (uint64_t)result;
  return result;
}

id static CMBlockBufferRef.Error.blockAllocationFailed.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for blockAllocationFailed, (void **)&static CMBlockBufferRef.Error.blockAllocationFailed);
}

id one-time initialization function for badCustomBlockSource()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 init:*MEMORY[0x1E4F28760] code:-12702 userInfo:0];
  static CMBlockBufferRef.Error.badCustomBlockSource = (uint64_t)result;
  return result;
}

id static CMBlockBufferRef.Error.badCustomBlockSource.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for badCustomBlockSource, (void **)&static CMBlockBufferRef.Error.badCustomBlockSource);
}

id one-time initialization function for badOffsetParameter()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:*MEMORY[0x1E4F28760] code:-12703 userInfo:0];
  static CMBlockBufferRef.Error.badOffsetParameter = (uint64_t)result;
  return result;
}

id static CMBlockBufferRef.Error.badOffsetParameter.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for badOffsetParameter, (void **)&static CMBlockBufferRef.Error.badOffsetParameter);
}

id one-time initialization function for badLengthParameter()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:*MEMORY[0x1E4F28760] code:-12704 userInfo:0];
  static CMBlockBufferRef.Error.badLengthParameter = (uint64_t)result;
  return result;
}

id static CMBlockBufferRef.Error.badLengthParameter.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for badLengthParameter, (void **)&static CMBlockBufferRef.Error.badLengthParameter);
}

id one-time initialization function for badPointerParameter()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 init:MEMORY[0x1E4F28760] code:-12705 userInfo:0];
  static CMBlockBufferRef.Error.badPointerParameter = (uint64_t)result;
  return result;
}

id static CMBlockBufferRef.Error.badPointerParameter.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for badPointerParameter, (void **)&static CMBlockBufferRef.Error.badPointerParameter);
}

id one-time initialization function for emptyBlockBuffer()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 initWithDomain:*MEMORY[0x1E4F28760] code:-12706 userInfo:0];
  static CMBlockBufferRef.Error.emptyBlockBuffer = (uint64_t)result;
  return result;
}

id static CMBlockBufferRef.Error.emptyBlockBuffer.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for emptyBlockBuffer, (void **)&static CMBlockBufferRef.Error.emptyBlockBuffer);
}

id one-time initialization function for unallocatedBlock()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 sel_initWithDomain_code_userInfo_:*MEMORY[0x1E4F28760] code:-12707 userInfo:0];
  static CMBlockBufferRef.Error.unallocatedBlock = (uint64_t)result;
  return result;
}

id static CMBlockBufferRef.Error.unallocatedBlock.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for unallocatedBlock, (void **)&static CMBlockBufferRef.Error.unallocatedBlock);
}

id one-time initialization function for insufficientSpace()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  id result = [v0 sel_initWithDomain_code_userInfo_:*MEMORY[0x1E4F28760] code:-12708 userInfo:0];
  static CMBlockBufferRef.Error.insufficientSpace = (uint64_t)result;
  return result;
}

id static CMBlockBufferRef.Error.insufficientSpace.getter()
{
  return static CMClockRef.Error.missingRequiredParameter.getter(&one-time initialization token for insufficientSpace, (void **)&static CMBlockBufferRef.Error.insufficientSpace);
}

uint64_t CMBlockBufferRef.Flags.rawValue.getter()
{
  return *v0;
}

uint64_t CMBlockBufferRef.Flags.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static CMBlockBufferRef.Flags.assureMemoryNow.getter(_DWORD *a1@<X8>)
{
  *a1 = 1;
}

void static CMBlockBufferRef.Flags.alwaysCopyData.getter(_DWORD *a1@<X8>)
{
  *a1 = 2;
}

void static CMBlockBufferRef.Flags.dontOptimizeDepth.getter(_DWORD *a1@<X8>)
{
  *a1 = 4;
}

void static CMBlockBufferRef.Flags.permitEmptyReference.getter(_DWORD *a1@<X8>)
{
  *a1 = 8;
}

uint64_t protocol witness for ExpressibleByArrayLiteral.init(arrayLiteral:) in conformance CMBlockBufferRef.Flags@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  return specialized SetAlgebra<>.init(arrayLiteral:)(a1, a2);
}

void CMBlockBufferProtocol.makeContiguous(allocator:flags:)(const __CFAllocator *a1, CMBlockBufferFlags *a2, uint64_t a3, uint64_t (**a4)(uint64_t, uint64_t))
{
  v9[1] = *(CMBlockBufferRef *)MEMORY[0x1E4F143B8];
  CMBlockBufferFlags v6 = *a2;
  v9[0] = 0;
  int v7 = closure #1 in CMBlockBufferProtocol.makeContiguous(allocator:flags:)(v4, a1, v6, v9, a3, a4);
  if (v7 == noErr.getter())
  {
    if (v9[0]) {
      return;
    }
    __break(1u);
  }
  id v8 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  [v8 initWithDomain:*MEMORY[0x1E4F28760] code:v7 userInfo:0];
  swift_willThrow();
}

uint64_t closure #1 in CMBlockBufferProtocol.makeContiguous(allocator:flags:)(uint64_t a1, const __CFAllocator *a2, CMBlockBufferFlags a3, CMBlockBufferRef *a4, uint64_t a5, uint64_t (**a6)(uint64_t, uint64_t))
{
  int v10 = (OpaqueCMBlockBuffer *)a6[1](a5, (uint64_t)a6);
  CMBlockBufferFlags v11 = a6[2];
  size_t v12 = v11(a5, (uint64_t)a6);
  uint64_t v13 = a6[3](a5, (uint64_t)a6);
  uint64_t result = v11(a5, (uint64_t)a6);
  if (__OFSUB__(v13, result))
  {
    __break(1u);
  }
  else
  {
    uint64_t Contiguous = CMBlockBufferCreateContiguous((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v10, a2, 0, v12, v13 - result, a3, a4);

    return Contiguous;
  }
  return result;
}

void CMBlockBufferProtocol.makeContiguous(allocator:deallocator:flags:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, CMBlockBufferFlags *a5, uint64_t a6, uint64_t (**a7)(uint64_t, uint64_t))
{
  v18[1] = *(CMBlockBufferRef *)MEMORY[0x1E4F143B8];
  CMBlockBufferFlags v10 = *a5;
  v18[0] = 0;
  swift_retain();
  swift_retain();
  v17.version = 0;
  v17.AllocateBlock = (void *(__cdecl *)(void *, size_t))@objc CustomAllocatorAllocateBlock(refcon:sizeInBytes:);
  v17.FreeBlock = (void (__cdecl *)(void *, void *, size_t))@objc CustomAllocatorFreeBlock(refcon:doomedMemoryBlock:sizeInBytes:);
  v17.refCon = (void *)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
  int v11 = closure #1 in CMBlockBufferProtocol.makeContiguous(allocator:deallocator:flags:)(v7, &v17, v10, v18, a6, a7);
  if (v11 == noErr.getter())
  {
    if (v18[0]) {
      return;
    }
    __break(1u);
  }
  id v12 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  [v12 sel_initWithDomain_code_userInfo_:*MEMORY[0x1E4F28760] userInfo:v11 code:a1];
  swift_willThrow();
}

uint64_t closure #1 in CMBlockBufferProtocol.makeContiguous(allocator:deallocator:flags:)(uint64_t a1, const CMBlockBufferCustomBlockSource *a2, CMBlockBufferFlags a3, CMBlockBufferRef *a4, uint64_t a5, uint64_t (**a6)(uint64_t, uint64_t))
{
  CMBlockBufferFlags v10 = (OpaqueCMBlockBuffer *)a6[1](a5, (uint64_t)a6);
  int v11 = a6[2];
  size_t v12 = v11(a5, (uint64_t)a6);
  uint64_t v13 = a6[3](a5, (uint64_t)a6);
  uint64_t result = v11(a5, (uint64_t)a6);
  if (__OFSUB__(v13, result))
  {
    __break(1u);
  }
  else
  {
    uint64_t Contiguous = CMBlockBufferCreateContiguous((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v10, 0, a2, v12, v13 - result, a3, a4);

    return Contiguous;
  }
  return result;
}

uint64_t CMBlockBufferRef.append(length:allocator:range:flags:)(size_t blockLength, CFAllocatorRef blockAllocator, size_t offsetToData, uint64_t a4, char a5, CMBlockBufferFlags *a6)
{
  size_t v7 = offsetToData;
  CMBlockBufferFlags v8 = *a6;
  if (a5) {
    goto LABEL_5;
  }
  size_t v9 = a4 - offsetToData;
  if (__OFSUB__(a4, offsetToData))
  {
    __break(1u);
LABEL_5:
    size_t v7 = 0;
    size_t v9 = blockLength;
  }
  OSStatus appended = CMBlockBufferAppendMemoryBlock(v6, 0, blockLength, blockAllocator, 0, v7, v9, v8);
  uint64_t result = noErr.getter();
  if (appended != result)
  {
    id v12 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v12 initWithDomain:MEMORY[0x1E4F28760] code:appended userInfo:0];
    return swift_willThrow();
  }
  return result;
}

void *CMBlockBufferRef.append(buffer:allocator:flags:)(void *memoryBlock, uint64_t a2, CFAllocatorRef blockAllocator, CMBlockBufferFlags *a4)
{
  if (memoryBlock) {
    size_t v6 = a2 - (void)memoryBlock;
  }
  else {
    size_t v6 = 0;
  }
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    OSStatus appended = CMBlockBufferAppendMemoryBlock(v4, memoryBlock, v6, blockAllocator, 0, 0, v6, *a4);
    memoryBlock = (void *)noErr.getter();
    if (appended != memoryBlock)
    {
      id v8 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
      [v8 initWithDomain:MEMORY[0x1E4F28760] code:appended userInfo:0];
      return (void *)swift_willThrow();
    }
  }
  return memoryBlock;
}

uint64_t CMBlockBufferRef.append(buffer:allocator:flags:)(uint64_t offsetToData, int64_t a2, void *memoryBlock, uint64_t a4, CFAllocatorRef blockAllocator, CMBlockBufferFlags *a6)
{
  int64_t v7 = a4 - (void)memoryBlock;
  if (!memoryBlock) {
    int64_t v7 = 0;
  }
  if (offsetToData < 0 || v7 < offsetToData)
  {
    __break(1u);
LABEL_11:
    __break(1u);
    return offsetToData;
  }
  if (a2 < 0 || v7 < a2) {
    goto LABEL_11;
  }
  OSStatus appended = CMBlockBufferAppendMemoryBlock(v6, memoryBlock, v7, blockAllocator, 0, offsetToData, a2 - offsetToData, *a6);
  offsetToData = noErr.getter();
  if (appended != offsetToData)
  {
    id v9 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v9 initWithDomain:*MEMORY[0x1E4F28760] code:appended userInfo:0];
    return swift_willThrow();
  }
  return offsetToData;
}

uint64_t CMBlockBufferRef.append(length:allocator:deallocator:range:flags:)(size_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, size_t a6, uint64_t a7, char a8, CMBlockBufferFlags *a9)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  CMBlockBufferFlags v11 = *a9;
  if (a8) {
    goto LABEL_5;
  }
  size_t v12 = a6;
  size_t v13 = a7 - a6;
  if (__OFSUB__(a7, a6))
  {
    __break(1u);
LABEL_5:
    size_t v12 = 0;
    size_t v13 = a1;
  }
  swift_retain();
  swift_retain();
  customBlockSource.version = 0;
  customBlockSource.AllocateBlock = (void *(__cdecl *)(void *, size_t))@objc CustomAllocatorAllocateBlock(refcon:sizeInBytes:);
  customBlockSource.FreeBlock = (void (__cdecl *)(void *, void *, size_t))@objc CustomAllocatorFreeBlock(refcon:doomedMemoryBlock:sizeInBytes:);
  customBlockSource.refCon = (void *)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
  OSStatus appended = CMBlockBufferAppendMemoryBlock(v9, 0, a1, 0, &customBlockSource, v12, v13, v11);
  uint64_t result = noErr.getter();
  if (appended != result)
  {
    id v16 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v16 initWithDomain:MEMORY[0x1E4F28760] code:appended userInfo:0];
    return swift_willThrow();
  }
  return result;
}

void *CMBlockBufferRef.append(buffer:deallocator:flags:)(void *result, uint64_t a2, uint64_t a3, uint64_t a4, CMBlockBufferFlags *a5)
{
  if (result) {
    int64_t v7 = a2 - (void)result;
  }
  else {
    int64_t v7 = 0;
  }
  if (v7 < 0)
  {
    __break(1u);
  }
  else
  {
    CMBlockBufferFlags v8 = *a5;
    return (void *)CMBlockBufferRef.append(buffer:deallocator:flags:)(0, v7, result, a2, a3, a4, &v8);
  }
  return result;
}

uint64_t CMBlockBufferRef.append(buffer:deallocator:flags:)(int64_t a1, int64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, CMBlockBufferFlags *a7)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3) {
    int64_t v8 = a4 - (void)a3;
  }
  else {
    int64_t v8 = 0;
  }
  if (a1 < 0 || v8 < a1)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (a2 < 0 || v8 < a2) {
LABEL_12:
  }
    __break(1u);
  CMBlockBufferFlags v11 = *a7;
  size_t v12 = a2 - a1;
  swift_retain();
  customBlockSource.version = 0;
  customBlockSource.AllocateBlock = (void *(__cdecl *)(void *, size_t))@objc CustomAllocatorAllocateBlock(refcon:sizeInBytes:);
  customBlockSource.FreeBlock = (void (__cdecl *)(void *, void *, size_t))@objc CustomAllocatorFreeBlock(refcon:doomedMemoryBlock:sizeInBytes:);
  customBlockSource.refCon = (void *)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
  OSStatus appended = CMBlockBufferAppendMemoryBlock(v7, a3, v8, 0, &customBlockSource, a1, v12, v11);
  uint64_t result = noErr.getter();
  if (appended != result)
  {
    id v15 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v15 initWithDomain:*MEMORY[0x1E4F28760] code:appended userInfo:0];
    return swift_willThrow();
  }
  return result;
}

uint64_t CMBlockBufferRef.append<A>(bufferReference:flags:)(uint64_t a1, CMBlockBufferFlags *a2, uint64_t a3, uint64_t (**a4)(uint64_t, uint64_t))
{
  int v5 = closure #1 in CMBlockBufferRef.append<A>(bufferReference:flags:)(v4, a1, *a2, a3, a4);
  uint64_t result = noErr.getter();
  if (v5 != result)
  {
    id v7 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v7 initWithDomain:*MEMORY[0x1E4F28760] code:v5 userInfo:0];
    return swift_willThrow();
  }
  return result;
}

uint64_t closure #1 in CMBlockBufferRef.append<A>(bufferReference:flags:)(OpaqueCMBlockBuffer *a1, uint64_t a2, CMBlockBufferFlags a3, uint64_t a4, uint64_t (**a5)(uint64_t, uint64_t))
{
  id v9 = (OpaqueCMBlockBuffer *)a5[1](a4, (uint64_t)a5);
  CMBlockBufferFlags v10 = a5[2];
  size_t v11 = v10(a4, (uint64_t)a5);
  uint64_t v12 = a5[3](a4, (uint64_t)a5);
  uint64_t result = v10(a4, (uint64_t)a5);
  if (__OFSUB__(v12, result))
  {
    __break(1u);
  }
  else
  {
    uint64_t appended = CMBlockBufferAppendBufferReference(a1, v9, v11, v12 - result, a3);

    return appended;
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMBlockBufferRef.assureBlockMemory()()
{
  OSStatus v1 = CMBlockBufferAssureBlockMemory(v0);
  if (v1 != noErr.getter())
  {
    id v2 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v2 initWithDomain:*MEMORY[0x1E4F28760] code:v1 userInfo:0];
    swift_willThrow();
  }
}

uint64_t CMBlockBufferProtocol.withContiguousStorage<A>(_:)(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (**a5)(uint64_t, uint64_t))
{
  v21[1] = *(char **)MEMORY[0x1E4F143B8];
  id v9 = a5[3];
  uint64_t v10 = v9(a3, (uint64_t)a5);
  size_t v11 = a5[2];
  if (__OFSUB__(v10, v11(a3, (uint64_t)a5)))
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v12 = (void *)swift_slowAlloc();
  v21[0] = 0;
  int v13 = closure #1 in CMBlockBufferProtocol.withContiguousStorage<A>(_:)(v5, v12, v21, a3, a4, a5);
  if (v13 != noErr.getter())
  {
    id v18 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v18 initWithDomain:*MEMORY[0x1E4F28760] code:v13 userInfo:0];
    swift_willThrow();
    return MEMORY[0x1C188EB00](v12, -1, -1);
  }
  uint64_t v14 = v21[0];
  uint64_t v15 = v9(a3, (uint64_t)a5);
  uint64_t v16 = v11(a3, (uint64_t)a5);
  if (__OFSUB__(v15, v16)) {
LABEL_11:
  }
    __break(1u);
  if (v14) {
    uint64_t v17 = &v14[v15 - v16];
  }
  else {
    uint64_t v17 = 0;
  }
  a1(v14, v17);
  return MEMORY[0x1C188EB00](v12, -1, -1);
}

uint64_t closure #1 in CMBlockBufferProtocol.withContiguousStorage<A>(_:)(uint64_t a1, void *a2, char **a3, uint64_t a4, uint64_t a5, uint64_t (**a6)(uint64_t, uint64_t))
{
  uint64_t v10 = (OpaqueCMBlockBuffer *)a6[1](a4, (uint64_t)a6);
  size_t v11 = a6[2];
  size_t v12 = v11(a4, (uint64_t)a6);
  uint64_t v13 = a6[3](a4, (uint64_t)a6);
  uint64_t result = v11(a4, (uint64_t)a6);
  if (__OFSUB__(v13, result))
  {
    __break(1u);
  }
  else
  {
    uint64_t v15 = CMBlockBufferAccessDataBytes(v10, v12, v13 - result, a2, a3);

    return v15;
  }
  return result;
}

uint64_t CMBlockBufferProtocol.dataBytes()(uint64_t a1, uint64_t (**a2)(uint64_t, uint64_t))
{
  uint64_t v26 = type metadata accessor for Data.Deallocator();
  uint64_t v25 = *(void *)(v26 - 8);
  MEMORY[0x1F4188790](v26);
  CMTag v24 = (void (**)())((char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v7 = a2[3];
  uint64_t v8 = v7(a1, (uint64_t)a2);
  id v9 = a2[2];
  uint64_t v10 = v9(a1, (uint64_t)a2);
  BOOL v11 = __OFSUB__(v8, v10);
  uint64_t result = v8 - v10;
  if (v11)
  {
    __break(1u);
  }
  else
  {
    v23[1] = v3;
    uint64_t v13 = (void *)swift_slowAlloc();
    int v14 = closure #1 in CMBlockBufferProtocol.dataBytes()(v2, v13, a1, a2);
    if (v14 != noErr.getter())
    {
      id v21 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
      [v21 initWithDomain:*MEMORY[0x1E4F28760] code:v14 userInfo:0];
      swift_willThrow();
      return v2;
    }
    uint64_t v15 = v7(a1, (uint64_t)a2);
    uint64_t result = v9(a1, (uint64_t)a2);
    uint64_t v16 = v15 - result;
    if (!__OFSUB__(v15, result))
    {
      id v18 = v24;
      uint64_t v17 = v25;
      *CMTag v24 = closure #2 in CMBlockBufferProtocol.dataBytes();
      v18[1] = 0;
      uint64_t v19 = v26;
      (*(void (**)(void (**)(), void, uint64_t))(v17 + 104))(v18, *MEMORY[0x1E4F27758], v26);
      Data.Deallocator._deallocator.getter();
      if (v16)
      {
        type metadata accessor for __DataStorage();
        swift_allocObject();
        swift_retain();
        uint64_t v20 = __DataStorage.init(bytes:length:copy:deallocator:offset:)();
        uint64_t v2 = specialized Data._Representation.init(_:count:)(v20, v16);
        swift_release();
      }
      else
      {
        uint64_t v22 = (void (*)(void *, void))Data.Deallocator._deallocator.getter();
        v22(v13, 0);
        swift_release();
        swift_release();
        uint64_t v2 = 0;
      }
      (*(void (**)(void (**)(), uint64_t))(v17 + 8))(v18, v19);
      return v2;
    }
  }
  __break(1u);
  return result;
}

void closure #2 in CMBlockBufferProtocol.dataBytes()()
{
}

uint64_t CMBlockBufferProtocol.copyDataBytes(to:)(void *a1, uint64_t a2, uint64_t a3, uint64_t (**a4)(uint64_t, uint64_t))
{
  uint64_t v5 = v4;
  uint64_t v10 = *(void *)(a3 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](a1);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v11)
  {
    if (one-time initialization token for badPointerParameter == -1)
    {
LABEL_7:
      (id)static CMBlockBufferRef.Error.badPointerParameter;
      return swift_willThrow();
    }
LABEL_12:
    swift_once();
    goto LABEL_7;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v5, a3);
  uint64_t v14 = a4[3](a3, (uint64_t)a4);
  uint64_t v15 = a4[2](a3, (uint64_t)a4);
  BOOL v16 = __OFSUB__(v14, v15);
  uint64_t v17 = v14 - v15;
  if (v16)
  {
    __break(1u);
    goto LABEL_11;
  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, a3);
  if (a2 - (uint64_t)a1 < v17)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int v18 = closure #1 in CMBlockBufferProtocol.dataBytes()(v5, a1, a3, a4);
  uint64_t result = noErr.getter();
  if (v18 == result) {
    return result;
  }
  id v20 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  [v20 initWithDomain:MEMORY[0x1E4F28760] code:v18 userInfo:0];
  return swift_willThrow();
}

uint64_t closure #1 in CMBlockBufferProtocol.dataBytes()(uint64_t a1, void *a2, uint64_t a3, uint64_t (**a4)(uint64_t, uint64_t))
{
  id v7 = (OpaqueCMBlockBuffer *)a4[1](a3, (uint64_t)a4);
  uint64_t v8 = a4[2];
  size_t v9 = v8(a3, (uint64_t)a4);
  uint64_t v10 = a4[3](a3, (uint64_t)a4);
  uint64_t result = v8(a3, (uint64_t)a4);
  if (__OFSUB__(v10, result))
  {
    __break(1u);
  }
  else
  {
    uint64_t v12 = CMBlockBufferCopyDataBytes(v7, v9, v10 - result, a2);

    return v12;
  }
  return result;
}

uint64_t CMBlockBufferProtocol.replaceDataBytes(with:)(const void *a1, uint64_t a2, uint64_t a3, uint64_t (**a4)(uint64_t, uint64_t))
{
  uint64_t v5 = v4;
  uint64_t v10 = *(void *)(a3 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](a1);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v11)
  {
    if (one-time initialization token for badPointerParameter == -1)
    {
LABEL_7:
      (id)static CMBlockBufferRef.Error.badPointerParameter;
      return swift_willThrow();
    }
LABEL_12:
    swift_once();
    goto LABEL_7;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v5, a3);
  uint64_t v14 = a4[3](a3, (uint64_t)a4);
  uint64_t v15 = a4[2](a3, (uint64_t)a4);
  BOOL v16 = __OFSUB__(v14, v15);
  uint64_t v17 = v14 - v15;
  if (v16)
  {
    __break(1u);
    goto LABEL_11;
  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, a3);
  if (v17 < a2 - (uint64_t)a1)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int v18 = closure #1 in CMBlockBufferProtocol.replaceDataBytes(with:)(a1, v5, a3, a4);
  uint64_t result = noErr.getter();
  if (v18 == result) {
    return result;
  }
  id v20 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
  [v20 initWithDomain:MEMORY[0x1E4F28760] code:v18 userInfo:0];
  return swift_willThrow();
}

uint64_t closure #1 in CMBlockBufferProtocol.replaceDataBytes(with:)(const void *a1, uint64_t a2, uint64_t a3, uint64_t (**a4)(uint64_t, uint64_t))
{
  id v7 = (OpaqueCMBlockBuffer *)a4[1](a3, (uint64_t)a4);
  uint64_t v8 = a4[2];
  size_t v9 = v8(a3, (uint64_t)a4);
  uint64_t v10 = a4[3](a3, (uint64_t)a4);
  uint64_t result = v8(a3, (uint64_t)a4);
  if (__OFSUB__(v10, result))
  {
    __break(1u);
  }
  else
  {
    uint64_t v12 = CMBlockBufferReplaceDataBytes(a1, v7, v9, v10 - result);

    return v12;
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CMBlockBufferProtocol.fillDataBytes(with:)(Swift::UInt8 with)
{
  int v4 = closure #1 in CMBlockBufferProtocol.fillDataBytes(with:)(with, v3, v1, v2);
  if (v4 != noErr.getter())
  {
    id v5 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v5 initWithDomain:*MEMORY[0x1E4F28760] code:v4 userInfo:0];
    swift_willThrow();
  }
}

uint64_t closure #1 in CMBlockBufferProtocol.fillDataBytes(with:)(char a1, uint64_t a2, uint64_t a3, uint64_t (**a4)(uint64_t, uint64_t))
{
  id v7 = (OpaqueCMBlockBuffer *)a4[1](a3, (uint64_t)a4);
  uint64_t v8 = a4[2];
  size_t v9 = v8(a3, (uint64_t)a4);
  uint64_t v10 = a4[3](a3, (uint64_t)a4);
  uint64_t result = v8(a3, (uint64_t)a4);
  if (__OFSUB__(v10, result))
  {
    __break(1u);
  }
  else
  {
    uint64_t v12 = CMBlockBufferFillDataBytes(a1, v7, v9, v10 - result);

    return v12;
  }
  return result;
}

char *CMBlockBufferRef.withUnsafeMutableBytes<A>(atOffset:_:)(size_t offset, uint64_t (*a2)(char *, char *))
{
  dataPointerOut[1] = *(char **)MEMORY[0x1E4F143B8];
  size_t lengthAtOffsetOut = 0;
  dataPointerOut[0] = 0;
  OSStatus DataPointer = CMBlockBufferGetDataPointer(v2, offset, &lengthAtOffsetOut, 0, dataPointerOut);
  if (DataPointer == noErr.getter())
  {
    uint64_t result = dataPointerOut[0];
    if (dataPointerOut[0]) {
      return (char *)a2(dataPointerOut[0], &dataPointerOut[0][lengthAtOffsetOut]);
    }
    else {
      __break(1u);
    }
  }
  else
  {
    id v6 = objc_allocWithZone(MEMORY[0x1E4F28C58]);
    [v6 initWithDomain:*MEMORY[0x1E4F28760] code:DataPointer userInfo:0];
    return (char *)swift_willThrow();
  }
  return result;
}

uint64_t CMBlockBufferProtocol.isContiguous.getter(uint64_t a1, uint64_t a2)
{
  int v4 = (OpaqueCMBlockBuffer *)(*(uint64_t (**)(void))(a2 + 8))();
  id v5 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 16);
  size_t v6 = v5(a1, a2);
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 24))(a1, a2);
  uint64_t result = v5(a1, a2);
  if (__OFSUB__(v7, result))
  {
    __break(1u);
  }
  else
  {
    IsRangeuint64_t Contiguous = CMBlockBufferIsRangeContiguous(v4, v6, v7 - result);

    return IsRangeContiguous != 0;
  }
  return result;
}

BOOL CMBlockBufferRef.isEmpty.getter()
{
  return CMBlockBufferIsEmpty(v0) != 0;
}

uint64_t specialized SetAlgebra<>.init(arrayLiteral:)(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = result;
  LODWORD(result) = 0;
  uint64_t v3 = (int *)(v2 + 32);
  do
  {
    int v5 = *v3++;
    int v4 = v5;
    if ((v5 & ~result) == 0) {
      int v4 = 0;
    }
    uint64_t result = v4 | result;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t specialized Data.InlineData.init(_:)(unsigned char *__src, unsigned char *a2)
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

uint64_t specialized Data._Representation.init(_:count:)(uint64_t result, uint64_t a2)
{
  if (!a2)
  {
    swift_release();
    return 0;
  }
  if (a2 > 14)
  {
    if ((unint64_t)a2 < 0x7FFFFFFF) {
      return a2 << 32;
    }
    type metadata accessor for Data.RangeReference();
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = 0;
    *(void *)(v3 + 24) = a2;
    return v3;
  }
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    int v4 = (unsigned char *)__DataStorage._bytes.getter();
    if (!v4)
    {
LABEL_10:
      uint64_t v5 = __DataStorage._length.getter();
      if (v5 >= a2) {
        uint64_t v6 = a2;
      }
      else {
        uint64_t v6 = v5;
      }
      uint64_t v7 = &v4[v6];
      if (v4) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      uint64_t v3 = specialized Data.InlineData.init(_:)(v4, v8);
      swift_release();
      return v3;
    }
    uint64_t result = __DataStorage._offset.getter();
    if (!__OFSUB__(0, result))
    {
      v4 -= result;
      goto LABEL_10;
    }
  }
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type CMBlockBufferRef.Flags and conformance CMBlockBufferRef.Flags()
{
  unint64_t result = lazy protocol witness table cache variable for type CMBlockBufferRef.Flags and conformance CMBlockBufferRef.Flags;
  if (!lazy protocol witness table cache variable for type CMBlockBufferRef.Flags and conformance CMBlockBufferRef.Flags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMBlockBufferRef.Flags and conformance CMBlockBufferRef.Flags);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMBlockBufferRef.Flags and conformance CMBlockBufferRef.Flags;
  if (!lazy protocol witness table cache variable for type CMBlockBufferRef.Flags and conformance CMBlockBufferRef.Flags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMBlockBufferRef.Flags and conformance CMBlockBufferRef.Flags);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMBlockBufferRef.Flags and conformance CMBlockBufferRef.Flags;
  if (!lazy protocol witness table cache variable for type CMBlockBufferRef.Flags and conformance CMBlockBufferRef.Flags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMBlockBufferRef.Flags and conformance CMBlockBufferRef.Flags);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type CMBlockBufferRef.Flags and conformance CMBlockBufferRef.Flags;
  if (!lazy protocol witness table cache variable for type CMBlockBufferRef.Flags and conformance CMBlockBufferRef.Flags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CMBlockBufferRef.Flags and conformance CMBlockBufferRef.Flags);
  }
  return result;
}

uint64_t dispatch thunk of CMBlockBufferProtocol.owner.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of CMBlockBufferProtocol.startIndex.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of CMBlockBufferProtocol.endIndex.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

ValueMetadata *type metadata accessor for CMBlockBufferRef.Slice()
{
  return &type metadata for CMBlockBufferRef.Slice;
}

uint64_t dispatch thunk of _CMBlockBufferInitTrampoline.init(referencing:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

ValueMetadata *type metadata accessor for CMBlockBufferRef.Error()
{
  return &type metadata for CMBlockBufferRef.Error;
}

ValueMetadata *type metadata accessor for CMBlockBufferRef.Flags()
{
  return &type metadata for CMBlockBufferRef.Flags;
}

void *destroy for CMBlockBufferRef.CustomAllocator(void *result)
{
  uint64_t v1 = result;
  if (*result) {
    unint64_t result = (void *)swift_release();
  }
  if (v1[2])
  {
    return (void *)swift_release();
  }
  return result;
}

void *initializeWithCopy for CMBlockBufferRef.CustomAllocator(void *a1, void *a2)
{
  if (*a2)
  {
    uint64_t v4 = a2[1];
    *a1 = *a2;
    a1[1] = v4;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  uint64_t v5 = a2[2];
  if (v5)
  {
    uint64_t v6 = a2[3];
    a1[2] = v5;
    a1[3] = v6;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
  }
  return a1;
}

void *assignWithCopy for CMBlockBufferRef.CustomAllocator(void *a1, void *a2)
{
  uint64_t v4 = *a2;
  if (*a1)
  {
    if (v4)
    {
      uint64_t v5 = a2[1];
      *a1 = v4;
      a1[1] = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = a2[1];
    *a1 = v4;
    a1[1] = v6;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  uint64_t v7 = a2[2];
  if (!a1[2])
  {
    if (v7)
    {
      uint64_t v9 = a2[3];
      a1[2] = v7;
      a1[3] = v9;
      swift_retain();
      return a1;
    }
LABEL_14:
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    return a1;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v8 = a2[3];
  a1[2] = v7;
  a1[3] = v8;
  swift_retain();
  swift_release();
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

void *assignWithTake for CMBlockBufferRef.CustomAllocator(void *a1, void *a2)
{
  uint64_t v4 = *a2;
  if (*a1)
  {
    if (v4)
    {
      uint64_t v5 = a2[1];
      *a1 = v4;
      a1[1] = v5;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    uint64_t v6 = a2[1];
    *a1 = v4;
    a1[1] = v6;
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  uint64_t v7 = a2[2];
  if (!a1[2])
  {
    if (v7)
    {
      uint64_t v9 = a2[3];
      a1[2] = v7;
      a1[3] = v9;
      return a1;
    }
LABEL_14:
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    return a1;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_14;
  }
  uint64_t v8 = a2[3];
  a1[2] = v7;
  a1[3] = v8;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CMBlockBufferRef.CustomAllocator(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 32)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CMBlockBufferRef.CustomAllocator(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

void *type metadata accessor for CMBlockBufferRef.CustomAllocator()
{
  return &unk_1F18C3958;
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return MEMORY[0x1F40E37C0]();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return MEMORY[0x1F40E37D0]();
}

uint64_t __DataStorage._bytes.getter()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t __DataStorage._length.getter()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t __DataStorage._offset.getter()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t type metadata accessor for __DataStorage()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t Data.Deallocator._deallocator.getter()
{
  return MEMORY[0x1F40E4BF0]();
}

uint64_t type metadata accessor for Data.Deallocator()
{
  return MEMORY[0x1F40E4C00]();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return MEMORY[0x1F40E4C80]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x1F40E4D48]();
}

uint64_t static _CFObject.== infix(_:_:)()
{
  return MEMORY[0x1F4186958]();
}

uint64_t _CFObject.hash(into:)()
{
  return MEMORY[0x1F4186968]();
}

uint64_t _CFObject.hashValue.getter()
{
  return MEMORY[0x1F4186978]();
}

uint64_t noErr.getter()
{
  return MEMORY[0x1F4186BA0]();
}

uint64_t type metadata accessor for UnsafeMutableAudioBufferListPointer()
{
  return MEMORY[0x1F41868F8]();
}

uint64_t UnsafeMutableAudioBufferListPointer.init(_:)()
{
  return MEMORY[0x1F4186900]();
}

uint64_t ManagedAudioChannelLayout.init(audioChannelLayoutPointer:deallocator:)()
{
  return MEMORY[0x1F4186910]();
}

uint64_t ManagedAudioChannelLayout.sizeInBytes.getter()
{
  return MEMORY[0x1F4186918]();
}

uint64_t ManagedAudioChannelLayout.withUnsafePointer<A>(_:)()
{
  return MEMORY[0x1F4186928]();
}

uint64_t type metadata accessor for ManagedAudioChannelLayout()
{
  return MEMORY[0x1F4186938]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x1F40E6000]();
}

uint64_t static Dictionary._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1F40E6008]();
}

uint64_t static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1F40E6018]();
}

Swift::Void __swiftcall Dictionary.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t Dictionary.Index.hash(into:)()
{
  return MEMORY[0x1F41833B0]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x1F41835C8]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x1F40E6190]();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t String.init<A>(bytes:encoding:)()
{
  return MEMORY[0x1F40E6200]();
}

uint64_t String.init(format:_:)()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x1F41839B0]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t Sequence.compactMap<A>(_:)()
{
  return MEMORY[0x1F4183BE8]();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x1F4183C18]();
}

uint64_t Sequence.lazy.getter()
{
  return MEMORY[0x1F4183C38]();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t dispatch thunk of RawRepresentable.init(rawValue:)()
{
  return MEMORY[0x1F4183D78]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1F4183E80]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x1F40E6338]();
}

uint64_t static Array._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1F40E6348]();
}

uint64_t static Array._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1F40E6360]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return MEMORY[0x1F4184338]();
}

uint64_t Collection.first.getter()
{
  return MEMORY[0x1F4184398]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x1F4184440]();
}

uint64_t type metadata accessor for AudioChannelLayout.UnsafePointer()
{
  return MEMORY[0x1F4186940]();
}

uint64_t AudioChannelLayout.UnsafePointer.init(_:)()
{
  return MEMORY[0x1F4186948]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x1F4184640]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t _HashTable.occupiedBucket(after:)()
{
  return MEMORY[0x1F4184B28]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t type metadata accessor for LazySequence()
{
  return MEMORY[0x1F4184D18]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x1F4184ED8]();
}

Swift::Void __swiftcall ContiguousArray.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t ContiguousArray.append(_:)()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t ContiguousArray.init()()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t type metadata accessor for ContiguousArray()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x1F4185050]();
}

uint64_t __CocoaDictionary.startIndex.getter()
{
  return MEMORY[0x1F41851F0]();
}

uint64_t __CocoaDictionary.makeIterator()()
{
  return MEMORY[0x1F41851F8]();
}

uint64_t __CocoaDictionary.Index.dictionary.getter()
{
  return MEMORY[0x1F4185208]();
}

uint64_t static __CocoaDictionary.Index.< infix(_:_:)()
{
  return MEMORY[0x1F4185218]();
}

uint64_t static __CocoaDictionary.Index.== infix(_:_:)()
{
  return MEMORY[0x1F4185220]();
}

uint64_t __CocoaDictionary.Index.age.getter()
{
  return MEMORY[0x1F4185228]();
}

uint64_t __CocoaDictionary.Index.key.getter()
{
  return MEMORY[0x1F4185230]();
}

uint64_t __CocoaDictionary.count.getter()
{
  return MEMORY[0x1F4185238]();
}

uint64_t __CocoaDictionary.index(after:)()
{
  return MEMORY[0x1F4185240]();
}

uint64_t __CocoaDictionary.lookup(_:)()
{
  return MEMORY[0x1F4185258]();
}

{
  return MEMORY[0x1F4185260]();
}

uint64_t __CocoaDictionary.Iterator.next()()
{
  return MEMORY[0x1F4185270]();
}

uint64_t __CocoaDictionary.endIndex.getter()
{
  return MEMORY[0x1F4185288]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x1F4185350]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x1F4185368]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x1F4185370]();
}

uint64_t static _DictionaryStorage.convert(_:capacity:)()
{
  return MEMORY[0x1F4185378]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x1F4185380]();
}

uint64_t dispatch thunk of static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1F4185498]();
}

uint64_t dispatch thunk of static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1F41854A0]();
}

uint64_t dispatch thunk of static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F41854A8]();
}

uint64_t dispatch thunk of _ObjectiveCBridgeable._bridgeToObjectiveC()()
{
  return MEMORY[0x1F41854B0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x1F4185758]();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return MEMORY[0x1F4185D68]();
}

NSNumber __swiftcall Int8._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x1F40E6DE8]();
}

uint64_t static Int8._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E6DF0]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x1F4185DE0]();
}

NSNumber __swiftcall UInt8._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x1F40E6E80]();
}

uint64_t static UInt8._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E6E88]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x1F4185EB0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x1F4185EF8]();
}

NSNumber __swiftcall UInt32._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x1F40E6EA8]();
}

uint64_t static UInt32._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1F40E6EB0]();
}

uint64_t static UInt32._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1F40E6EB8]();
}

uint64_t static UInt32._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E6EC0]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

OSStatus CMAudioFormatDescriptionCreate(CFAllocatorRef allocator, const AudioStreamBasicDescription *asbd, size_t layoutSize, const AudioChannelLayout *layout, size_t magicCookieSize, const void *magicCookie, CFDictionaryRef extensions, CMAudioFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DB880](allocator, asbd, layoutSize, layout, magicCookieSize, magicCookie, extensions, formatDescriptionOut);
}

OSStatus CMAudioFormatDescriptionCreateSummary(CFAllocatorRef allocator, CFArrayRef formatDescriptionArray, uint32_t flags, CMAudioFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DB888](allocator, formatDescriptionArray, *(void *)&flags, formatDescriptionOut);
}

Boolean CMAudioFormatDescriptionEqual(CMAudioFormatDescriptionRef formatDescription, CMAudioFormatDescriptionRef otherFormatDescription, CMAudioFormatDescriptionMask equalityMask, CMAudioFormatDescriptionMask *equalityMaskOut)
{
  return MEMORY[0x1F40DB890](formatDescription, otherFormatDescription, *(void *)&equalityMask, equalityMaskOut);
}

const AudioChannelLayout *__cdecl CMAudioFormatDescriptionGetChannelLayout(CMAudioFormatDescriptionRef desc, size_t *sizeOut)
{
  return (const AudioChannelLayout *)MEMORY[0x1F40DB8A0](desc, sizeOut);
}

const AudioFormatListItem *__cdecl CMAudioFormatDescriptionGetFormatList(CMAudioFormatDescriptionRef desc, size_t *sizeOut)
{
  return (const AudioFormatListItem *)MEMORY[0x1F40DB8A8](desc, sizeOut);
}

const void *__cdecl CMAudioFormatDescriptionGetMagicCookie(CMAudioFormatDescriptionRef desc, size_t *sizeOut)
{
  return (const void *)MEMORY[0x1F40DB8B0](desc, sizeOut);
}

const AudioStreamBasicDescription *__cdecl CMAudioFormatDescriptionGetStreamBasicDescription(CMAudioFormatDescriptionRef desc)
{
  return (const AudioStreamBasicDescription *)MEMORY[0x1F40DB8D8](desc);
}

OSStatus CMAudioSampleBufferCreateWithPacketDescriptions(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMTime *presentationTimeStamp, const AudioStreamPacketDescription *packetDescriptions, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1F40DB8E8](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, presentationTimeStamp);
}

OSStatus CMAudioSampleBufferCreateWithPacketDescriptionsAndMakeDataReadyHandler(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMTime *presentationTimeStamp, const AudioStreamPacketDescription *packetDescriptions, CMSampleBufferRef *sampleBufferOut, CMSampleBufferMakeDataReadyHandler makeDataReadyHandler)
{
  return MEMORY[0x1F40DB8F0](allocator, dataBuffer, dataReady, formatDescription, numSamples, presentationTimeStamp, packetDescriptions, sampleBufferOut);
}

OSStatus CMBlockBufferAccessDataBytes(CMBlockBufferRef theBuffer, size_t offset, size_t length, void *temporaryBlock, char **returnedPointerOut)
{
  return MEMORY[0x1F40DB948](theBuffer, offset, length, temporaryBlock, returnedPointerOut);
}

OSStatus CMBlockBufferAppendBufferReference(CMBlockBufferRef theBuffer, CMBlockBufferRef targetBBuf, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags)
{
  return MEMORY[0x1F40DB950](theBuffer, targetBBuf, offsetToData, dataLength, *(void *)&flags);
}

OSStatus CMBlockBufferAppendMemoryBlock(CMBlockBufferRef theBuffer, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags)
{
  return MEMORY[0x1F40DB958](theBuffer, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags);
}

OSStatus CMBlockBufferAssureBlockMemory(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x1F40DB960](theBuffer);
}

OSStatus CMBlockBufferCopyDataBytes(CMBlockBufferRef theSourceBuffer, size_t offsetToData, size_t dataLength, void *destination)
{
  return MEMORY[0x1F40DB968](theSourceBuffer, offsetToData, dataLength, destination);
}

OSStatus CMBlockBufferCreateContiguous(CFAllocatorRef structureAllocator, CMBlockBufferRef sourceBuffer, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1F40DB970](structureAllocator, sourceBuffer, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateEmpty(CFAllocatorRef structureAllocator, uint32_t subBlockCapacity, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1F40DB978](structureAllocator, *(void *)&subBlockCapacity, *(void *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateWithBufferReference(CFAllocatorRef structureAllocator, CMBlockBufferRef bufferReference, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1F40DB980](structureAllocator, bufferReference, offsetToData, dataLength, *(void *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1F40DB988](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(void *)&flags);
}

OSStatus CMBlockBufferFillDataBytes(char fillByte, CMBlockBufferRef destinationBuffer, size_t offsetIntoDestination, size_t dataLength)
{
  return MEMORY[0x1F40DB990](fillByte, destinationBuffer, offsetIntoDestination, dataLength);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x1F40DB998](theBuffer);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x1F40DB9A0](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

CFTypeID CMBlockBufferGetTypeID(void)
{
  return MEMORY[0x1F40DB9B0]();
}

Boolean CMBlockBufferIsEmpty(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x1F40DB9B8](theBuffer);
}

Boolean CMBlockBufferIsRangeContiguous(CMBlockBufferRef theBuffer, size_t offset, size_t length)
{
  return MEMORY[0x1F40DB9C0](theBuffer, offset, length);
}

OSStatus CMBlockBufferReplaceDataBytes(const void *sourceBytes, CMBlockBufferRef destinationBuffer, size_t offsetIntoDestination, size_t dataLength)
{
  return MEMORY[0x1F40DB9C8](sourceBytes, destinationBuffer, offsetIntoDestination, dataLength);
}

OSStatus CMBufferQueueCallForEachBuffer(CMBufferQueueRef queue, OSStatus (__cdecl *callback)(CMBufferRef, void *), void *refcon)
{
  return MEMORY[0x1F40DB9D0](queue, callback, refcon);
}

Boolean CMBufferQueueContainsEndOfData(CMBufferQueueRef queue)
{
  return MEMORY[0x1F40DB9D8](queue);
}

CMBufferRef CMBufferQueueCopyHead(CMBufferQueueRef queue)
{
  return (CMBufferRef)MEMORY[0x1F40DB9E0](queue);
}

OSStatus CMBufferQueueCreateWithHandlers(CFAllocatorRef allocator, CMItemCount capacity, const CMBufferHandlers *handlers, CMBufferQueueRef *queueOut)
{
  return MEMORY[0x1F40DB9F0](allocator, capacity, handlers, queueOut);
}

CMBufferRef CMBufferQueueDequeueAndRetain(CMBufferQueueRef queue)
{
  return (CMBufferRef)MEMORY[0x1F40DB9F8](queue);
}

CMBufferRef CMBufferQueueDequeueIfDataReadyAndRetain(CMBufferQueueRef queue)
{
  return (CMBufferRef)MEMORY[0x1F40DBA00](queue);
}

OSStatus CMBufferQueueEnqueue(CMBufferQueueRef queue, CMBufferRef buf)
{
  return MEMORY[0x1F40DBA08](queue, buf);
}

CMItemCount CMBufferQueueGetBufferCount(CMBufferQueueRef queue)
{
  return MEMORY[0x1F40DBA10](queue);
}

size_t CMBufferQueueGetTotalSize(CMBufferQueueRef queue)
{
  return MEMORY[0x1F40DBA58](queue);
}

CFTypeID CMBufferQueueGetTypeID(void)
{
  return MEMORY[0x1F40DBA60]();
}

OSStatus CMBufferQueueInstallTriggerHandler(CMBufferQueueRef queue, CMBufferQueueTriggerCondition condition, CMTime *time, CMBufferQueueTriggerToken *triggerTokenOut, CMBufferQueueTriggerHandler handler)
{
  return MEMORY[0x1F40DBA70](queue, *(void *)&condition, time, triggerTokenOut, handler);
}

OSStatus CMBufferQueueInstallTriggerHandlerWithIntegerThreshold(CMBufferQueueRef queue, CMBufferQueueTriggerCondition condition, CMItemCount threshold, CMBufferQueueTriggerToken *triggerTokenOut, CMBufferQueueTriggerHandler handler)
{
  return MEMORY[0x1F40DBA78](queue, *(void *)&condition, threshold, triggerTokenOut, handler);
}

Boolean CMBufferQueueIsAtEndOfData(CMBufferQueueRef queue)
{
  return MEMORY[0x1F40DBA88](queue);
}

Boolean CMBufferQueueIsEmpty(CMBufferQueueRef queue)
{
  return MEMORY[0x1F40DBA90](queue);
}

OSStatus CMBufferQueueRemoveTrigger(CMBufferQueueRef queue, CMBufferQueueTriggerToken triggerToken)
{
  return MEMORY[0x1F40DBAA0](queue, triggerToken);
}

OSStatus CMBufferQueueResetWithCallback(CMBufferQueueRef queue, void (__cdecl *callback)(CMBufferRef, void *), void *refcon)
{
  return MEMORY[0x1F40DBAB0](queue, callback, refcon);
}

OSStatus CMBufferQueueSetValidationHandler(CMBufferQueueRef queue, CMBufferValidationHandler handler)
{
  return MEMORY[0x1F40DBAC0](queue, handler);
}

Boolean CMBufferQueueTestTrigger(CMBufferQueueRef queue, CMBufferQueueTriggerToken triggerToken)
{
  return MEMORY[0x1F40DBAC8](queue, triggerToken);
}

uint64_t CMClockConvertHostTimeToSystemUnits(CMTime *hostTime)
{
  return MEMORY[0x1F40DBB20](hostTime);
}

OSStatus CMClockGetAnchorTime(CMClockRef clock, CMTime *clockTimeOut, CMTime *referenceClockTimeOut)
{
  return MEMORY[0x1F40DBB28](clock, clockTimeOut, referenceClockTimeOut);
}

CMClockRef CMClockGetHostTimeClock(void)
{
  return (CMClockRef)MEMORY[0x1F40DBB30]();
}

CFTypeID CMClockGetTypeID(void)
{
  return MEMORY[0x1F40DBB40]();
}

void CMClockInvalidate(CMClockRef clock)
{
}

CMTime *__cdecl CMClockMakeHostTimeFromSystemUnits(CMTime *__return_ptr retstr, uint64_t hostTime)
{
  return (CMTime *)MEMORY[0x1F40DBB50](retstr, hostTime);
}

Boolean CMClockMightDrift(CMClockRef clock, CMClockRef otherClock)
{
  return MEMORY[0x1F40DBB58](clock, otherClock);
}

CFDictionaryRef CMCopyDictionaryOfAttachments(CFAllocatorRef allocator, CMAttachmentBearerRef target, CMAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x1F40DBB70](allocator, target, *(void *)&attachmentMode);
}

OSStatus CMFormatDescriptionCreate(CFAllocatorRef allocator, CMMediaType mediaType, FourCharCode mediaSubType, CFDictionaryRef extensions, CMFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DBBA0](allocator, *(void *)&mediaType, *(void *)&mediaSubType, extensions, formatDescriptionOut);
}

Boolean CMFormatDescriptionEqual(CMFormatDescriptionRef formatDescription, CMFormatDescriptionRef otherFormatDescription)
{
  return MEMORY[0x1F40DBBA8](formatDescription, otherFormatDescription);
}

Boolean CMFormatDescriptionEqualIgnoringExtensionKeys(CMFormatDescriptionRef formatDescription, CMFormatDescriptionRef otherFormatDescription, CFTypeRef formatDescriptionExtensionKeysToIgnore, CFTypeRef sampleDescriptionExtensionAtomKeysToIgnore)
{
  return MEMORY[0x1F40DBBB0](formatDescription, otherFormatDescription, formatDescriptionExtensionKeysToIgnore, sampleDescriptionExtensionAtomKeysToIgnore);
}

CFDictionaryRef CMFormatDescriptionGetExtensions(CMFormatDescriptionRef desc)
{
  return (CFDictionaryRef)MEMORY[0x1F40DBBC0](desc);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1F40DBBC8](desc);
}

CMMediaType CMFormatDescriptionGetMediaType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x1F40DBBD0](desc);
}

CFTypeID CMFormatDescriptionGetTypeID(void)
{
  return MEMORY[0x1F40DBBD8]();
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x1F40DBBF0](target, key, attachmentModeOut);
}

OSStatus CMMetadataFormatDescriptionCreateByMergingMetadataFormatDescriptions(CFAllocatorRef allocator, CMMetadataFormatDescriptionRef sourceDescription, CMMetadataFormatDescriptionRef otherSourceDescription, CMMetadataFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DBC60](allocator, sourceDescription, otherSourceDescription, formatDescriptionOut);
}

OSStatus CMMetadataFormatDescriptionCreateWithKeys(CFAllocatorRef allocator, CMMetadataFormatType metadataType, CFArrayRef keys, CMMetadataFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DBC70](allocator, *(void *)&metadataType, keys, formatDescriptionOut);
}

OSStatus CMMetadataFormatDescriptionCreateWithMetadataFormatDescriptionAndMetadataSpecifications(CFAllocatorRef allocator, CMMetadataFormatDescriptionRef sourceDescription, CFArrayRef metadataSpecifications, CMMetadataFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DBC78](allocator, sourceDescription, metadataSpecifications, formatDescriptionOut);
}

CFArrayRef CMMetadataFormatDescriptionGetIdentifiers(CMMetadataFormatDescriptionRef desc)
{
  return (CFArrayRef)MEMORY[0x1F40DBC88](desc);
}

CFDictionaryRef CMMetadataFormatDescriptionGetKeyWithLocalID(CMMetadataFormatDescriptionRef desc, OSType localKeyID)
{
  return (CFDictionaryRef)MEMORY[0x1F40DBC90](desc, *(void *)&localKeyID);
}

OSStatus CMMuxedFormatDescriptionCreate(CFAllocatorRef allocator, CMMuxedStreamType muxType, CFDictionaryRef extensions, CMMuxedFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DBC98](allocator, *(void *)&muxType, extensions, formatDescriptionOut);
}

void CMPropagateAttachments(CMAttachmentBearerRef source, CMAttachmentBearerRef destination)
{
}

void CMRemoveAllAttachments(CMAttachmentBearerRef target)
{
}

void CMRemoveAttachment(CMAttachmentBearerRef target, CFStringRef key)
{
}

OSStatus CMSampleBufferCallBlockForEachSample(CMSampleBufferRef sbuf, void *handler)
{
  return MEMORY[0x1F40DBD10](sbuf, handler);
}

OSStatus CMSampleBufferCopyPCMDataIntoAudioBufferList(CMSampleBufferRef sbuf, int32_t frameOffset, int32_t numFrames, AudioBufferList *bufferList)
{
  return MEMORY[0x1F40DBD20](sbuf, *(void *)&frameOffset, *(void *)&numFrames, bufferList);
}

OSStatus CMSampleBufferCopySampleBufferForRange(CFAllocatorRef allocator, CMSampleBufferRef sbuf, CFRange sampleRange, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1F40DBD28](allocator, sbuf, sampleRange.location, sampleRange.length, sampleBufferOut);
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1F40DBD30](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

OSStatus CMSampleBufferCreateCopy(CFAllocatorRef allocator, CMSampleBufferRef sbuf, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1F40DBD38](allocator, sbuf, sampleBufferOut);
}

OSStatus CMSampleBufferCreateCopyWithNewTiming(CFAllocatorRef allocator, CMSampleBufferRef originalSBuf, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1F40DBD40](allocator, originalSBuf, numSampleTimingEntries, sampleTimingArray, sampleBufferOut);
}

OSStatus CMSampleBufferCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x1F40DBD48](allocator, imageBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, sampleTiming, sampleBufferOut);
}

OSStatus CMSampleBufferCreateForImageBufferWithMakeDataReadyHandler(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, Boolean dataReady, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut, CMSampleBufferMakeDataReadyHandler makeDataReadyHandler)
{
  return MEMORY[0x1F40DBD50](allocator, imageBuffer, dataReady, formatDescription, sampleTiming, sampleBufferOut, makeDataReadyHandler);
}

OSStatus CMSampleBufferCreateForTaggedBufferGroup(CFAllocatorRef allocator, CMTaggedBufferGroupRef taggedBufferGroup, CMTime *sbufPTS, CMTime *sbufDuration, CMTaggedBufferGroupFormatDescriptionRef formatDescription, CMSampleBufferRef *sBufOut)
{
  return MEMORY[0x1F40DBD58](allocator, taggedBufferGroup, sbufPTS, sbufDuration, formatDescription, sBufOut);
}

OSStatus CMSampleBufferCreateWithMakeDataReadyHandler(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut, CMSampleBufferMakeDataReadyHandler makeDataReadyHandler)
{
  return MEMORY[0x1F40DBD78](allocator, dataBuffer, dataReady, formatDescription, numSamples, numSampleTimingEntries, sampleTimingArray, numSampleSizeEntries);
}

Boolean CMSampleBufferDataIsReady(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1F40DBD80](sbuf);
}

OSStatus CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(CMSampleBufferRef sbuf, size_t *bufferListSizeNeededOut, AudioBufferList *bufferListOut, size_t bufferListSize, CFAllocatorRef blockBufferStructureAllocator, CFAllocatorRef blockBufferBlockAllocator, uint32_t flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x1F40DBD88](sbuf, bufferListSizeNeededOut, bufferListOut, bufferListSize, blockBufferStructureAllocator, blockBufferBlockAllocator, *(void *)&flags, blockBufferOut);
}

OSStatus CMSampleBufferGetAudioStreamPacketDescriptions(CMSampleBufferRef sbuf, size_t packetDescriptionsSize, AudioStreamPacketDescription *packetDescriptionsOut, size_t *packetDescriptionsSizeNeededOut)
{
  return MEMORY[0x1F40DBD90](sbuf, packetDescriptionsSize, packetDescriptionsOut, packetDescriptionsSizeNeededOut);
}

OSStatus CMSampleBufferGetAudioStreamPacketDescriptionsPtr(CMSampleBufferRef sbuf, const AudioStreamPacketDescription **packetDescriptionsPointerOut, size_t *packetDescriptionsSizeOut)
{
  return MEMORY[0x1F40DBD98](sbuf, packetDescriptionsPointerOut, packetDescriptionsSizeOut);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x1F40DBDA0](sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x1F40DBDC0](sbuf);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x1F40DBDC8](sbuf);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1F40DBDD0](sbuf);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return (CFArrayRef)MEMORY[0x1F40DBE00](sbuf, createIfNecessary);
}

size_t CMSampleBufferGetSampleSize(CMSampleBufferRef sbuf, CMItemIndex sampleIndex)
{
  return MEMORY[0x1F40DBE08](sbuf, sampleIndex);
}

OSStatus CMSampleBufferGetSampleSizeArray(CMSampleBufferRef sbuf, CMItemCount sizeArrayEntries, size_t *sizeArrayOut, CMItemCount *sizeArrayEntriesNeededOut)
{
  return MEMORY[0x1F40DBE10](sbuf, sizeArrayEntries, sizeArrayOut, sizeArrayEntriesNeededOut);
}

OSStatus CMSampleBufferGetSampleTimingInfo(CMSampleBufferRef sbuf, CMItemIndex sampleIndex, CMSampleTimingInfo *timingInfoOut)
{
  return MEMORY[0x1F40DBE18](sbuf, sampleIndex, timingInfoOut);
}

CMTaggedBufferGroupRef CMSampleBufferGetTaggedBufferGroup(CMSampleBufferRef sbuf)
{
  return (CMTaggedBufferGroupRef)MEMORY[0x1F40DBE28](sbuf);
}

size_t CMSampleBufferGetTotalSampleSize(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1F40DBE30](sbuf);
}

CFTypeID CMSampleBufferGetTypeID(void)
{
  return MEMORY[0x1F40DBE38]();
}

Boolean CMSampleBufferHasDataFailed(CMSampleBufferRef sbuf, OSStatus *statusOut)
{
  return MEMORY[0x1F40DBE40](sbuf, statusOut);
}

OSStatus CMSampleBufferInvalidate(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1F40DBE48](sbuf);
}

Boolean CMSampleBufferIsValid(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1F40DBE50](sbuf);
}

OSStatus CMSampleBufferMakeDataReady(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1F40DBE58](sbuf);
}

OSStatus CMSampleBufferSetDataBufferFromAudioBufferList(CMSampleBufferRef sbuf, CFAllocatorRef blockBufferStructureAllocator, CFAllocatorRef blockBufferBlockAllocator, uint32_t flags, const AudioBufferList *bufferList)
{
  return MEMORY[0x1F40DBE68](sbuf, blockBufferStructureAllocator, blockBufferBlockAllocator, *(void *)&flags, bufferList);
}

OSStatus CMSampleBufferSetDataFailed(CMSampleBufferRef sbuf, OSStatus status)
{
  return MEMORY[0x1F40DBE70](sbuf, *(void *)&status);
}

OSStatus CMSampleBufferSetDataReady(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1F40DBE78](sbuf);
}

OSStatus CMSampleBufferSetInvalidateHandler(CMSampleBufferRef sbuf, CMSampleBufferInvalidateHandler invalidateHandler)
{
  return MEMORY[0x1F40DBE90](sbuf, invalidateHandler);
}

OSStatus CMSampleBufferSetOutputPresentationTimeStamp(CMSampleBufferRef sbuf, CMTime *outputPresentationTimeStamp)
{
  return MEMORY[0x1F40DBE98](sbuf, outputPresentationTimeStamp);
}

void CMSetAttachment(CMAttachmentBearerRef target, CFStringRef key, CFTypeRef value, CMAttachmentMode attachmentMode)
{
}

void CMSetAttachments(CMAttachmentBearerRef target, CFDictionaryRef theAttachments, CMAttachmentMode attachmentMode)
{
}

OSStatus CMSimpleQueueCreate(CFAllocatorRef allocator, int32_t capacity, CMSimpleQueueRef *queueOut)
{
  return MEMORY[0x1F40DBED0](allocator, *(void *)&capacity, queueOut);
}

const void *__cdecl CMSimpleQueueDequeue(CMSimpleQueueRef queue)
{
  return (const void *)MEMORY[0x1F40DBED8](queue);
}

OSStatus CMSimpleQueueEnqueue(CMSimpleQueueRef queue, const void *element)
{
  return MEMORY[0x1F40DBEE0](queue, element);
}

int32_t CMSimpleQueueGetCapacity(CMSimpleQueueRef queue)
{
  return MEMORY[0x1F40DBEE8](queue);
}

int32_t CMSimpleQueueGetCount(CMSimpleQueueRef queue)
{
  return MEMORY[0x1F40DBEF0](queue);
}

const void *__cdecl CMSimpleQueueGetHead(CMSimpleQueueRef queue)
{
  return (const void *)MEMORY[0x1F40DBEF8](queue);
}

CFTypeID CMSimpleQueueGetTypeID(void)
{
  return MEMORY[0x1F40DBF00]();
}

OSStatus CMSimpleQueueReset(CMSimpleQueueRef queue)
{
  return MEMORY[0x1F40DBF08](queue);
}

CMTime *__cdecl CMSyncConvertTime(CMTime *__return_ptr retstr, CMTime *time, CMClockOrTimebaseRef fromClockOrTimebase, CMClockOrTimebaseRef toClockOrTimebase)
{
  return (CMTime *)MEMORY[0x1F40DBF20](retstr, time, fromClockOrTimebase, toClockOrTimebase);
}

Float64 CMSyncGetRelativeRate(CMClockOrTimebaseRef ofClockOrTimebase, CMClockOrTimebaseRef relativeToClockOrTimebase)
{
  MEMORY[0x1F40DBF28](ofClockOrTimebase, relativeToClockOrTimebase);
  return result;
}

OSStatus CMSyncGetRelativeRateAndAnchorTime(CMClockOrTimebaseRef ofClockOrTimebase, CMClockOrTimebaseRef relativeToClockOrTimebase, Float64 *outRelativeRate, CMTime *outOfClockOrTimebaseAnchorTime, CMTime *outRelativeToClockOrTimebaseAnchorTime)
{
  return MEMORY[0x1F40DBF30](ofClockOrTimebase, relativeToClockOrTimebase, outRelativeRate, outOfClockOrTimebaseAnchorTime, outRelativeToClockOrTimebaseAnchorTime);
}

Boolean CMSyncMightDrift(CMClockOrTimebaseRef clockOrTimebase1, CMClockOrTimebaseRef clockOrTimebase2)
{
  return MEMORY[0x1F40DBF40](clockOrTimebase1, clockOrTimebase2);
}

OSStatus CMTagCollectionCreate(CFAllocatorRef allocator, const CMTag *tags, CMItemCount tagCount, CMTagCollectionRef *newCollectionOut)
{
  return MEMORY[0x1F40DBF68](allocator, tags, tagCount, newCollectionOut);
}

CMItemCount CMTagCollectionGetCount(CMTagCollectionRef tagCollection)
{
  return MEMORY[0x1F40DBF80](tagCollection);
}

OSStatus CMTagCollectionGetTags(CMTagCollectionRef tagCollection, CMTag *tagBuffer, CMItemCount tagBufferCount, CMItemCount *numberOfTagsCopied)
{
  return MEMORY[0x1F40DBF88](tagCollection, tagBuffer, tagBufferCount, numberOfTagsCopied);
}

CFStringRef CMTagCopyDescription(CFAllocatorRef allocator, CMTag tag)
{
  return (CFStringRef)MEMORY[0x1F40DBFB0](allocator, *(void *)&tag.category, tag.value);
}

Boolean CMTagEqualToTag(CMTag tag1, CMTag tag2)
{
  return MEMORY[0x1F40DBFB8](*(void *)&tag1.category, tag1.value, *(void *)&tag2.category, tag2.value);
}

uint64_t CMTagGetFlagsValue(CMTag tag)
{
  return MEMORY[0x1F40DBFC0](*(void *)&tag.category, tag.value);
}

Float64 CMTagGetFloat64Value(CMTag tag)
{
  MEMORY[0x1F40DBFC8](*(void *)&tag.category, tag.value);
  return result;
}

OSType CMTagGetOSTypeValue(CMTag tag)
{
  return MEMORY[0x1F40DBFD0](*(void *)&tag.category, tag.value);
}

int64_t CMTagGetSInt64Value(CMTag tag)
{
  return MEMORY[0x1F40DBFD8](*(void *)&tag.category, tag.value);
}

CMTagDataType CMTagGetValueDataType(CMTag tag)
{
  return MEMORY[0x1F40DBFE0](*(void *)&tag.category, tag.value);
}

CMTag CMTagMakeWithFlagsValue(CMTagCategory category, uint64_t flagsForTag)
{
  uint64_t v2 = MEMORY[0x1F40DBFE8](*(void *)&category, flagsForTag);
  result.CMTagValue value = v3;
  result.category = v2;
  result.dataType = HIDWORD(v2);
  return result;
}

CMTag CMTagMakeWithFloat64Value(CMTagCategory category, Float64 value)
{
  uint64_t v2 = MEMORY[0x1F40DBFF0](*(void *)&category, value);
  result.CMTagValue value = v3;
  result.category = v2;
  result.dataType = HIDWORD(v2);
  return result;
}

CMTag CMTagMakeWithOSTypeValue(CMTagCategory category, OSType value)
{
  uint64_t v2 = MEMORY[0x1F40DBFF8](*(void *)&category, *(void *)&value);
  result.CMTagValue value = v3;
  result.category = v2;
  result.dataType = HIDWORD(v2);
  return result;
}

CMTag CMTagMakeWithSInt64Value(CMTagCategory category, int64_t value)
{
  uint64_t v2 = MEMORY[0x1F40DC000](*(void *)&category, value);
  result.CMTagValue value = v3;
  result.category = v2;
  result.dataType = HIDWORD(v2);
  return result;
}

OSStatus CMTaggedBufferGroupCreate(CFAllocatorRef allocator, CFArrayRef tagCollections, CFArrayRef buffers, CMTaggedBufferGroupRef *groupOut)
{
  return MEMORY[0x1F40DC008](allocator, tagCollections, buffers, groupOut);
}

OSStatus CMTaggedBufferGroupFormatDescriptionCreateForTaggedBufferGroup(CFAllocatorRef allocator, CMTaggedBufferGroupRef taggedBufferGroup, CMTaggedBufferGroupFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DC010](allocator, taggedBufferGroup, formatDescriptionOut);
}

Boolean CMTaggedBufferGroupFormatDescriptionMatchesTaggedBufferGroup(CMTaggedBufferGroupFormatDescriptionRef desc, CMTaggedBufferGroupRef taggedBufferGroup)
{
  return MEMORY[0x1F40DC018](desc, taggedBufferGroup);
}

CMSampleBufferRef CMTaggedBufferGroupGetCMSampleBufferAtIndex(CMTaggedBufferGroupRef group, CFIndex index)
{
  return (CMSampleBufferRef)MEMORY[0x1F40DC020](group, index);
}

CVPixelBufferRef CMTaggedBufferGroupGetCVPixelBufferAtIndex(CMTaggedBufferGroupRef group, CFIndex index)
{
  return (CVPixelBufferRef)MEMORY[0x1F40DC028](group, index);
}

CMItemCount CMTaggedBufferGroupGetCount(CMTaggedBufferGroupRef group)
{
  return MEMORY[0x1F40DC038](group);
}

CMTagCollectionRef CMTaggedBufferGroupGetTagCollectionAtIndex(CMTaggedBufferGroupRef group, CFIndex index)
{
  return (CMTagCollectionRef)MEMORY[0x1F40DC040](group, index);
}

OSStatus CMTextFormatDescriptionGetDefaultStyle(CMFormatDescriptionRef desc, uint16_t *localFontIDOut, Boolean *boldOut, Boolean *italicOut, Boolean *underlineOut, CGFloat *fontSizeOut, CGFloat *colorComponentsOut)
{
  return MEMORY[0x1F40DC058](desc, localFontIDOut, boldOut, italicOut, underlineOut, fontSizeOut, colorComponentsOut);
}

OSStatus CMTextFormatDescriptionGetDefaultTextBox(CMFormatDescriptionRef desc, Boolean originIsAtTopLeft, CGFloat heightOfTextTrack, CGRect *defaultTextBoxOut)
{
  return MEMORY[0x1F40DC060](desc, originIsAtTopLeft, defaultTextBoxOut, heightOfTextTrack);
}

OSStatus CMTextFormatDescriptionGetDisplayFlags(CMFormatDescriptionRef desc, CMTextDisplayFlags *displayFlagsOut)
{
  return MEMORY[0x1F40DC068](desc, displayFlagsOut);
}

OSStatus CMTextFormatDescriptionGetFontName(CMFormatDescriptionRef desc, uint16_t localFontID, CFStringRef *fontNameOut)
{
  return MEMORY[0x1F40DC070](desc, localFontID, fontNameOut);
}

OSStatus CMTextFormatDescriptionGetJustification(CMFormatDescriptionRef desc, CMTextJustificationValue *horizontaJustificationlOut, CMTextJustificationValue *verticalJustificationOut)
{
  return MEMORY[0x1F40DC078](desc, horizontaJustificationlOut, verticalJustificationOut);
}

CMTime *__cdecl CMTimeAbsoluteValue(CMTime *__return_ptr retstr, CMTime *time)
{
  return (CMTime *)MEMORY[0x1F40DC080](retstr, time);
}

OSStatus CMTimeCodeFormatDescriptionCreate(CFAllocatorRef allocator, CMTimeCodeFormatType timeCodeFormatType, CMTime *frameDuration, uint32_t frameQuanta, uint32_t flags, CFDictionaryRef extensions, CMTimeCodeFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DC0A0](allocator, *(void *)&timeCodeFormatType, frameDuration, *(void *)&frameQuanta, *(void *)&flags, extensions, formatDescriptionOut);
}

CMTime *__cdecl CMTimeCodeFormatDescriptionGetFrameDuration(CMTime *__return_ptr retstr, CMTimeCodeFormatDescriptionRef timeCodeFormatDescription)
{
  return (CMTime *)MEMORY[0x1F40DC0B0](retstr, timeCodeFormatDescription);
}

uint32_t CMTimeCodeFormatDescriptionGetFrameQuanta(CMTimeCodeFormatDescriptionRef timeCodeFormatDescription)
{
  return MEMORY[0x1F40DC0B8](timeCodeFormatDescription);
}

uint32_t CMTimeCodeFormatDescriptionGetTimeCodeFlags(CMTimeCodeFormatDescriptionRef desc)
{
  return MEMORY[0x1F40DC0C0](desc);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1F40DC0C8](time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x1F40DC0D0](retstr, time, *(void *)&newTimescale, *(void *)&method);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x1F40DC190](range, time);
}

Boolean CMTimeRangeContainsTimeRange(CMTimeRange *range, CMTimeRange *otherRange)
{
  return MEMORY[0x1F40DC198](range, otherRange);
}

Boolean CMTimeRangeEqual(CMTimeRange *range1, CMTimeRange *range2)
{
  return MEMORY[0x1F40DC1B0](range1, range2);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1B8](retstr, start, end);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1F40DC1C0](retstr, range);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC1F0](retstr, lhs, rhs);
}

OSStatus CMTimebaseAddTimer(CMTimebaseRef timebase, CFRunLoopTimerRef timer, CFRunLoopRef runloop)
{
  return MEMORY[0x1F40DC200](timebase, timer, runloop);
}

CMClockOrTimebaseRef CMTimebaseCopySource(CMTimebaseRef timebase)
{
  return (CMClockOrTimebaseRef)MEMORY[0x1F40DC210](timebase);
}

CMClockRef CMTimebaseCopySourceClock(CMTimebaseRef timebase)
{
  return (CMClockRef)MEMORY[0x1F40DC218](timebase);
}

CMTimebaseRef CMTimebaseCopySourceTimebase(CMTimebaseRef timebase)
{
  return (CMTimebaseRef)MEMORY[0x1F40DC220](timebase);
}

CMClockRef CMTimebaseCopyUltimateSourceClock(CMTimebaseRef timebase)
{
  return (CMClockRef)MEMORY[0x1F40DC228](timebase);
}

Float64 CMTimebaseGetEffectiveRate(CMTimebaseRef timebase)
{
  MEMORY[0x1F40DC250](timebase);
  return result;
}

Float64 CMTimebaseGetRate(CMTimebaseRef timebase)
{
  MEMORY[0x1F40DC258](timebase);
  return result;
}

OSStatus CMTimebaseGetTimeAndRate(CMTimebaseRef timebase, CMTime *timeOut, Float64 *rateOut)
{
  return MEMORY[0x1F40DC268](timebase, timeOut, rateOut);
}

CMTime *__cdecl CMTimebaseGetTimeWithTimeScale(CMTime *__return_ptr retstr, CMTimebaseRef timebase, CMTimeScale timescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x1F40DC280](retstr, timebase, *(void *)&timescale, *(void *)&method);
}

CFTypeID CMTimebaseGetTypeID(void)
{
  return MEMORY[0x1F40DC288]();
}

OSStatus CMTimebaseNotificationBarrier(CMTimebaseRef timebase)
{
  return MEMORY[0x1F40DC290](timebase);
}

OSStatus CMTimebaseSetAnchorTime(CMTimebaseRef timebase, CMTime *timebaseTime, CMTime *immediateSourceTime)
{
  return MEMORY[0x1F40DC2A0](timebase, timebaseTime, immediateSourceTime);
}

OSStatus CMTimebaseSetRate(CMTimebaseRef timebase, Float64 rate)
{
  return MEMORY[0x1F40DC2A8](timebase, rate);
}

OSStatus CMTimebaseSetRateAndAnchorTime(CMTimebaseRef timebase, Float64 rate, CMTime *timebaseTime, CMTime *immediateSourceTime)
{
  return MEMORY[0x1F40DC2B0](timebase, timebaseTime, immediateSourceTime, rate);
}

OSStatus CMTimebaseSetSourceClock(CMTimebaseRef timebase, CMClockRef newSourceClock)
{
  return MEMORY[0x1F40DC2C0](timebase, newSourceClock);
}

OSStatus CMTimebaseSetSourceTimebase(CMTimebaseRef timebase, CMTimebaseRef newSourceTimebase)
{
  return MEMORY[0x1F40DC2C8](timebase, newSourceTimebase);
}

OSStatus CMTimebaseSetTime(CMTimebaseRef timebase, CMTime *time)
{
  return MEMORY[0x1F40DC2D0](timebase, time);
}

OSStatus CMTimebaseSetTimerDispatchSourceNextFireTime(CMTimebaseRef timebase, dispatch_source_t timerSource, CMTime *fireTime, uint32_t flags)
{
  return MEMORY[0x1F40DC2D8](timebase, timerSource, fireTime, *(void *)&flags);
}

OSStatus CMTimebaseSetTimerNextFireTime(CMTimebaseRef timebase, CFRunLoopTimerRef timer, CMTime *fireTime, uint32_t flags)
{
  return MEMORY[0x1F40DC2E8](timebase, timer, fireTime, *(void *)&flags);
}

OSStatus CMVideoFormatDescriptionCopyTagCollectionArray(CMVideoFormatDescriptionRef formatDescription, CFArrayRef *tagCollectionsOut)
{
  return MEMORY[0x1F40DC2F8](formatDescription, tagCollectionsOut);
}

OSStatus CMVideoFormatDescriptionCreate(CFAllocatorRef allocator, CMVideoCodecType codecType, int32_t width, int32_t height, CFDictionaryRef extensions, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DC300](allocator, *(void *)&codecType, *(void *)&width, *(void *)&height, extensions, formatDescriptionOut);
}

OSStatus CMVideoFormatDescriptionCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DC308](allocator, imageBuffer, formatDescriptionOut);
}

OSStatus CMVideoFormatDescriptionCreateFromH264ParameterSets(CFAllocatorRef allocator, size_t parameterSetCount, const uint8_t *const *parameterSetPointers, const size_t *parameterSetSizes, int NALUnitHeaderLength, CMFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DC320](allocator, parameterSetCount, parameterSetPointers, parameterSetSizes, *(void *)&NALUnitHeaderLength, formatDescriptionOut);
}

OSStatus CMVideoFormatDescriptionCreateFromHEVCParameterSets(CFAllocatorRef allocator, size_t parameterSetCount, const uint8_t *const *parameterSetPointers, const size_t *parameterSetSizes, int NALUnitHeaderLength, CFDictionaryRef extensions, CMFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x1F40DC328](allocator, parameterSetCount, parameterSetPointers, parameterSetSizes, *(void *)&NALUnitHeaderLength, extensions, formatDescriptionOut);
}

CGRect CMVideoFormatDescriptionGetCleanAperture(CMVideoFormatDescriptionRef videoDesc, Boolean originIsAtTopLeft)
{
  MEMORY[0x1F40DC330](videoDesc, originIsAtTopLeft);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x1F40DC338](videoDesc);
}

CFArrayRef CMVideoFormatDescriptionGetExtensionKeysCommonWithImageBuffers(void)
{
  return (CFArrayRef)MEMORY[0x1F40DC340]();
}

OSStatus CMVideoFormatDescriptionGetH264ParameterSetAtIndex(CMFormatDescriptionRef videoDesc, size_t parameterSetIndex, const uint8_t **parameterSetPointerOut, size_t *parameterSetSizeOut, size_t *parameterSetCountOut, int *NALUnitHeaderLengthOut)
{
  return MEMORY[0x1F40DC348](videoDesc, parameterSetIndex, parameterSetPointerOut, parameterSetSizeOut, parameterSetCountOut, NALUnitHeaderLengthOut);
}

OSStatus CMVideoFormatDescriptionGetHEVCParameterSetAtIndex(CMFormatDescriptionRef videoDesc, size_t parameterSetIndex, const uint8_t **parameterSetPointerOut, size_t *parameterSetSizeOut, size_t *parameterSetCountOut, int *NALUnitHeaderLengthOut)
{
  return MEMORY[0x1F40DC350](videoDesc, parameterSetIndex, parameterSetPointerOut, parameterSetSizeOut, parameterSetCountOut, NALUnitHeaderLengthOut);
}

CGSize CMVideoFormatDescriptionGetPresentationDimensions(CMVideoFormatDescriptionRef videoDesc, Boolean usePixelAspectRatio, Boolean useCleanAperture)
{
  MEMORY[0x1F40DC360](videoDesc, usePixelAspectRatio, useCleanAperture);
  result.double height = v4;
  result.double width = v3;
  return result;
}

Boolean CMVideoFormatDescriptionMatchesImageBuffer(CMVideoFormatDescriptionRef desc, CVImageBufferRef imageBuffer)
{
  return MEMORY[0x1F40DC370](desc, imageBuffer);
}

uint64_t FigVideoFormatDescriptionVisitAllParameterSets()
{
  return MEMORY[0x1F40DE868]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

int isprint(int _c)
{
  return MEMORY[0x1F40CC6B8](*(void *)&_c);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1F40CDA20](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1F40CDA40](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1F40CDB70](a1, a2);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1F41864E8]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x1F4186510]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}