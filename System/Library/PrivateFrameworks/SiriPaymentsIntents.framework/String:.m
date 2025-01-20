@interface String:
- (unint64_t)String;
@end

@implementation String:

- (unint64_t)String
{
  uint64_t v2 = lazy protocol witness table cache variable for type [String : String] and conformance [A : B];
  if (!lazy protocol witness table cache variable for type [String : String] and conformance [A : B])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : String]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [String : String] and conformance [A : B]);
    return WitnessTable;
  }
  return v2;
}

@end