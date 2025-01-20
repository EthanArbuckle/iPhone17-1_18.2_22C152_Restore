@interface ContactsLabelCATContainer.LabelType:
- (unint64_t)String;
@end

@implementation ContactsLabelCATContainer.LabelType:

- (unint64_t)String
{
  unint64_t result = OUTLINED_FUNCTION_41(a1);
  if (!result)
  {
    v4 = v3;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [ContactsLabelCATContainer.LabelType : String]);
    v4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

@end