@interface Interval<Date,
- (unint64_t)UInt32>;
@end

@implementation Interval<Date,

- (unint64_t)UInt32>
{
  uint64_t v2 = lazy protocol witness table cache variable for type [Interval<Date, UInt32>] and conformance [A];
  if (!lazy protocol witness table cache variable for type [Interval<Date, UInt32>] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Interval<Date, UInt32>]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [Interval<Date, UInt32>] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

@end