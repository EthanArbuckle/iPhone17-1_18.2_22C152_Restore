@interface (predicted:String,label:
- (uint64_t)String);
@end

@implementation (predicted:String,label:

- (uint64_t)String)
{
  uint64_t result = lazy protocol witness table cache variable for type [(predicted: String, label: String)] and conformance [A];
  if (!lazy protocol witness table cache variable for type [(predicted: String, label: String)] and conformance [A])
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [(predicted: String, label: String)]);
    uint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    lazy protocol witness table cache variable for type [(predicted: String, label: String)] and conformance [A] = result;
  }
  return result;
}

@end