@interface String:
- (uint64_t)CharacterSet;
- (uint64_t)String;
- (unint64_t)String;
@end

@implementation String:

- (uint64_t)String
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : String]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

- (uint64_t)CharacterSet
{
  return swift_release();
}

- (unint64_t)String
{
  unint64_t result = lazy protocol witness table cache variable for type [String : String] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [String : String] and conformance <> [A : B])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : String]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : String] and conformance <> [A : B]);
  }
  return result;
}

@end