@interface String:
- (unint64_t)DecodingBuffer;
@end

@implementation String:

- (unint64_t)DecodingBuffer
{
  unint64_t result = lazy protocol witness table cache variable for type [String : DecodingBuffer].Keys and conformance [A : B].Keys;
  if (!lazy protocol witness table cache variable for type [String : DecodingBuffer].Keys and conformance [A : B].Keys)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&demangling cache variable for type metadata for [String : DecodingBuffer].Keys);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : DecodingBuffer].Keys and conformance [A : B].Keys);
  }
  return result;
}

@end