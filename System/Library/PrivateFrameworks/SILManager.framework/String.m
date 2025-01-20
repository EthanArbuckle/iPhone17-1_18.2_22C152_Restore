@interface String
- (uint64_t):;
- (uint64_t):(void *)(a3;
- (uint64_t):.Iterator._Variant();
- (unint64_t):;
@end

@implementation String

- (uint64_t):
{
  return lazy protocol witness table accessor for type [String : [String : [String : [Int]]]] and conformance <> [A : B](&lazy protocol witness table cache variable for type [String : [String : [Int]]] and conformance <> [A : B], &demangling cache variable for type metadata for [String : [String : [Int]]], (void (*)(void))lazy protocol witness table accessor for type [String : [Int]] and conformance <> [A : B]);
}

- (uint64_t):(void *)(a3
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

- (unint64_t):
{
  unint64_t result = lazy protocol witness table cache variable for type [String : [Int]] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [String : [Int]] and conformance <> [A : B])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : [Int]]);
    lazy protocol witness table accessor for type [String] and conformance <A> [A](&lazy protocol witness table cache variable for type [Int] and conformance <A> [A], &demangling cache variable for type metadata for [Int]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : [Int]] and conformance <> [A : B]);
  }
  return result;
}

- (uint64_t):.Iterator._Variant()
{
  return swift_release();
}

@end