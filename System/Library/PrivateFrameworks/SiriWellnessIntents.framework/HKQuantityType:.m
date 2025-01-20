@interface HKQuantityType:
- (unint64_t)HKUnit;
- (void)HKUnit;
@end

@implementation HKQuantityType:

- (void)HKUnit
{
  id v3 = a2;
  id v4 = a3;
  uint64_t v12 = *(void *)(a1 + 32);
  if (a3)
  {
    id v7 = a3;
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [HKQuantityType : HKUnit]);
    _resumeUnsafeThrowingContinuationWithError<A>(_:_:)(v12, (uint64_t)a3, v8);
  }
  else
  {
    id v5 = a2;
    type metadata accessor for HKQuantityType();
    type metadata accessor for HKUnit();
    lazy protocol witness table accessor for type HKQuantityType and conformance NSObject();
    uint64_t v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [HKQuantityType : HKUnit]);
    _resumeUnsafeThrowingContinuation<A>(_:_:)(v12, (uint64_t)&v13, v6);
  }
}

- (unint64_t)HKUnit
{
  uint64_t v2 = lazy protocol witness table cache variable for type [HKQuantityType : HKUnit] and conformance [A : B];
  if (!lazy protocol witness table cache variable for type [HKQuantityType : HKUnit] and conformance [A : B])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [HKQuantityType : HKUnit]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [HKQuantityType : HKUnit] and conformance [A : B]);
    return WitnessTable;
  }
  return v2;
}

@end