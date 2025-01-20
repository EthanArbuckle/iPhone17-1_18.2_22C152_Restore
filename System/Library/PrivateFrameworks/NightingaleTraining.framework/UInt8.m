@interface UInt8
- (uint64_t):(start:(end:)UInt32 )UInt32 .Iterator._Variant();
- (unint64_t):()UInt32 .Keys and conformance [A : B].Keys();
- (unint64_t):(start:(end:)UInt32 )UInt32;
- (void):(start:(end:)UInt32 )UInt32 .Iterator();
@end

@implementation UInt8

- (unint64_t):()UInt32 .Keys and conformance [A : B].Keys()
{
  uint64_t v2 = lazy protocol witness table cache variable for type [UInt8 : [(UInt32, UInt32)]].Keys and conformance [A : B].Keys;
  if (!lazy protocol witness table cache variable for type [UInt8 : [(UInt32, UInt32)]].Keys and conformance [A : B].Keys)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [UInt8 : [(UInt32, UInt32)]].Keys);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [UInt8 : [(UInt32, UInt32)]].Keys and conformance [A : B].Keys);
    return WitnessTable;
  }
  return v2;
}

- (unint64_t):(start:(end:)UInt32 )UInt32
{
  uint64_t v2 = lazy protocol witness table cache variable for type [UInt8 : [(start: UInt32, end: UInt32)]] and conformance [A : B];
  if (!lazy protocol witness table cache variable for type [UInt8 : [(start: UInt32, end: UInt32)]] and conformance [A : B])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [UInt8 : [(start: UInt32, end: UInt32)]]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [UInt8 : [(start: UInt32, end: UInt32)]] and conformance [A : B]);
    return WitnessTable;
  }
  return v2;
}

- (void):(start:(end:)UInt32 )UInt32 .Iterator()
{
}

- (uint64_t):(start:(end:)UInt32 )UInt32 .Iterator._Variant()
{
  return swift_release();
}

@end