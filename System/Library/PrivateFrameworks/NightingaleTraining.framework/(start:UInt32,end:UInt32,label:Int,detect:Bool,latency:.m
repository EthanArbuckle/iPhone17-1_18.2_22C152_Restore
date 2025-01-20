@interface (start:UInt32,end:UInt32,label:Int,detect:Bool,latency:
- (unint64_t)Int?);
@end

@implementation (start:UInt32,end:UInt32,label:Int,detect:Bool,latency:

- (unint64_t)Int?)
{
  uint64_t v2 = lazy protocol witness table cache variable for type [(start: UInt32, end: UInt32, label: Int, detect: Bool, latency: Int?)] and conformance [A];
  if (!lazy protocol witness table cache variable for type [(start: UInt32, end: UInt32, label: Int, detect: Bool, latency: Int?)] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [(start: UInt32, end: UInt32, label: Int, detect: Bool, latency: Int?)]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [(start: UInt32, end: UInt32, label: Int, detect: Bool, latency: Int?)] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

@end