@interface String:
- (uint64_t)Any;
- (uint64_t)ModerationEnvelope.ProbabilityEnvelope;
- (uint64_t)PromptTemplateInfoEnvelope.RichVariableBindingEnvelope;
- (uint64_t)String;
@end

@implementation String:

- (uint64_t)Any
{
  return swift_release();
}

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

- (uint64_t)PromptTemplateInfoEnvelope.RichVariableBindingEnvelope
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : PromptTemplateInfoEnvelope.RichVariableBindingEnvelope]);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

- (uint64_t)ModerationEnvelope.ProbabilityEnvelope
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : ModerationEnvelope.ProbabilityEnvelope]);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

@end