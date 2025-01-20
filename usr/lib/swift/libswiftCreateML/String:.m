@interface String:
- (id)NSObject;
- (uint64_t)Double;
@end

@implementation String:

- (id)NSObject
{
  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (!v3) {
    return 0;
  }
  type metadata accessor for NSObject();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return isa;
}

- (uint64_t)Double
{
  uint64_t result = *a1;
  if (!*a1)
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable(a4, v6);
    *a1 = result;
  }
  return result;
}

@end