@interface String:
- (uint64_t)NSNumber;
- (uint64_t)SAPerson;
- (uint64_t)Set<String>;
- (unint64_t)AnyEncodable;
- (unint64_t)Bool;
- (unint64_t)String;
@end

@implementation String:

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

- (unint64_t)Bool
{
  unint64_t result = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x1E4FBC860]);
  *a1 = result;
  return result;
}

- (uint64_t)NSNumber
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Error);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return MEMORY[0x1F4188208](v3, v5);
  }
  else
  {
    type metadata accessor for NSNumber();
    **(void **)(*(void *)(v3 + 64) + 40) = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
    return MEMORY[0x1F4188200](v3);
  }
}

- (unint64_t)String
{
  unint64_t result = lazy protocol witness table cache variable for type [String : String] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [String : String] and conformance <> [A : B])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&demangling cache variable for type metadata for [String : String]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : String] and conformance <> [A : B]);
  }
  return result;
}

- (uint64_t)Set<String>
{
  return a1;
}

- (uint64_t)SAPerson
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Error);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return MEMORY[0x1F4188208](v3, v5);
  }
  else
  {
    type metadata accessor for OS_dispatch_queue(0, (unint64_t *)&lazy cache variable for type metadata for SAPerson);
    **(void **)(*(void *)(v3 + 64) + 40) = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
    return MEMORY[0x1F4188200](v3);
  }
}

@end