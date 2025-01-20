@interface (HKQuantitySample,
- (unint64_t)HKQuantitySample);
@end

@implementation (HKQuantitySample,

- (unint64_t)HKQuantitySample)
{
  uint64_t v2 = lazy protocol witness table cache variable for type [(HKQuantitySample, HKQuantitySample)] and conformance [A];
  if (!lazy protocol witness table cache variable for type [(HKQuantitySample, HKQuantitySample)] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [(HKQuantitySample, HKQuantitySample)]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [(HKQuantitySample, HKQuantitySample)] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

@end