@interface UInt32:(Float,
- (unint64_t)String);
@end

@implementation UInt32:(Float,

- (unint64_t)String)
{
  uint64_t v2 = lazy protocol witness table cache variable for type [UInt32 : (Float, String)].Keys and conformance [A : B].Keys;
  if (!lazy protocol witness table cache variable for type [UInt32 : (Float, String)].Keys and conformance [A : B].Keys)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [UInt32 : (Float, String)].Keys);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [UInt32 : (Float, String)].Keys and conformance [A : B].Keys);
    return WitnessTable;
  }
  return v2;
}

@end