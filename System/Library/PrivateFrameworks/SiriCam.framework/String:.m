@interface String:
- (uint64_t)Int;
- (uint64_t)MLFeatureValue;
- (unint64_t)AnyEncodable;
- (unint64_t)MLFeatureValue;
- (unint64_t)String;
@end

@implementation String:

- (uint64_t)Int
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (autoSendInput: AutoSendInput, crrSignals: [String : Int]));
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

- (uint64_t)MLFeatureValue
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (UUID, [String : MLFeatureValue]));
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

- (unint64_t)AnyEncodable
{
  unint64_t result = lazy protocol witness table cache variable for type [String : AnyEncodable] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [String : AnyEncodable] and conformance <> [A : B])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : AnyEncodable]);
    lazy protocol witness table accessor for type AnyEncodable and conformance AnyEncodable();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : AnyEncodable] and conformance <> [A : B]);
  }
  return result;
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

- (unint64_t)MLFeatureValue
{
  unint64_t result = lazy protocol witness table cache variable for type [String : MLFeatureValue] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [String : MLFeatureValue] and conformance <> [A : B])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : MLFeatureValue]);
    lazy protocol witness table accessor for type MLFeatureValue and conformance MLFeatureValue();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : MLFeatureValue] and conformance <> [A : B]);
  }
  return result;
}

@end