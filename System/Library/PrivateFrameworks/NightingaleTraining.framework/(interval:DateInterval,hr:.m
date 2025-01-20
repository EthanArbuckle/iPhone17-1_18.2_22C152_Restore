@interface (interval:DateInterval,hr:
- (unint64_t)Float);
@end

@implementation (interval:DateInterval,hr:

- (unint64_t)Float)
{
  uint64_t v2 = lazy protocol witness table cache variable for type [(interval: DateInterval, hr: Float)] and conformance [A];
  if (!lazy protocol witness table cache variable for type [(interval: DateInterval, hr: Float)] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [(interval: DateInterval, hr: Float)]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [(interval: DateInterval, hr: Float)] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

@end