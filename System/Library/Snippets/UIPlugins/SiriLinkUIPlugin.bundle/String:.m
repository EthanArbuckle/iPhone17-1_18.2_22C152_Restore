@interface String:
- (uint64_t)Data;
- (unint64_t)Data;
- (unint64_t)String;
@end

@implementation String:

- (uint64_t)Data
{
  return swift_release();
}

- (unint64_t)String
{
  unint64_t result = OUTLINED_FUNCTION_97(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : String]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

- (unint64_t)Data
{
  unint64_t result = OUTLINED_FUNCTION_97(a1);
  if (!result)
  {
    OUTLINED_FUNCTION_81();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : Data]);
    v2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

@end