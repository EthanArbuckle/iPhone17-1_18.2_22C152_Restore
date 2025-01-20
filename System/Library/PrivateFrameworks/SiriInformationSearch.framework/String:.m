@interface String:
- (uint64_t)AppData;
- (uint64_t)Float;
- (unint64_t)String;
@end

@implementation String:

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

- (uint64_t)AppData
{
  return swift_release();
}

- (uint64_t)Float
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : Float]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

@end