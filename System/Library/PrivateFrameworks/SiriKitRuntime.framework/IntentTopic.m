@interface IntentTopic
- (unint64_t):;
@end

@implementation IntentTopic

- (unint64_t):
{
  unint64_t result = lazy protocol witness table cache variable for type [IntentTopic : [String]] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [IntentTopic : [String]] and conformance <> [A : B])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [IntentTopic : [String]]);
    lazy protocol witness table accessor for type IntentTopic and conformance IntentTopic(&lazy protocol witness table cache variable for type IntentTopic and conformance IntentTopic, MEMORY[0x1E4FA1AB0]);
    lazy protocol witness table accessor for type [String] and conformance <A> [A]();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [IntentTopic : [String]] and conformance <> [A : B]);
  }
  return result;
}

@end