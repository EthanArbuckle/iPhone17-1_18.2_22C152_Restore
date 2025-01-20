@interface UInt32:
- (unint64_t)Bool;
- (unint64_t)Float;
- (unint64_t)Int;
- (unint64_t)UInt8;
@end

@implementation UInt32:

- (unint64_t)Float
{
  uint64_t v2 = lazy protocol witness table cache variable for type [UInt32 : Float] and conformance [A : B];
  if (!lazy protocol witness table cache variable for type [UInt32 : Float] and conformance [A : B])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [UInt32 : Float]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [UInt32 : Float] and conformance [A : B]);
    return WitnessTable;
  }
  return v2;
}

- (unint64_t)UInt8
{
  uint64_t v2 = lazy protocol witness table cache variable for type [UInt32 : UInt8].Keys and conformance [A : B].Keys;
  if (!lazy protocol witness table cache variable for type [UInt32 : UInt8].Keys and conformance [A : B].Keys)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [UInt32 : UInt8].Keys);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [UInt32 : UInt8].Keys and conformance [A : B].Keys);
    return WitnessTable;
  }
  return v2;
}

- (unint64_t)Bool
{
  uint64_t v2 = lazy protocol witness table cache variable for type [UInt32 : Bool].Keys and conformance [A : B].Keys;
  if (!lazy protocol witness table cache variable for type [UInt32 : Bool].Keys and conformance [A : B].Keys)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [UInt32 : Bool].Keys);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [UInt32 : Bool].Keys and conformance [A : B].Keys);
    return WitnessTable;
  }
  return v2;
}

- (unint64_t)Int
{
  uint64_t v2 = lazy protocol witness table cache variable for type [UInt32 : Int].Keys and conformance [A : B].Keys;
  if (!lazy protocol witness table cache variable for type [UInt32 : Int].Keys and conformance [A : B].Keys)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [UInt32 : Int].Keys);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [UInt32 : Int].Keys and conformance [A : B].Keys);
    return WitnessTable;
  }
  return v2;
}

@end