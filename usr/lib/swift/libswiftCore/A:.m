@interface A:
- (Class)B;
- (Swift::Int)B;
- (_UNKNOWN)B;
- (atomic_ullong)B;
- (double)B;
- (id)B;
- (uint64_t)B;
- (unint64_t)B;
- (void)B;
@end

@implementation A:

- (uint64_t)B
{
  uint64_t v5 = *(void *)(*(void *)a3 + 8);
  uint64_t result = swift_getWitnessTable(protocol conformance descriptor for <> [A : B], a2, (uint64_t)&v5);
  *(void *)(a1 + 8) = result;
  return result;
}

- (double)B
{
  uint64_t v3 = *v1;
  if ((v3 & 0xC000000000000001) != 0)
  {
    v4 = (void *)specialized _ArrayBuffer._nonNative.getter(v3);
    swift_unknownObjectRetain(v4);
    swift_bridgeObjectRelease(v3);
    uint64_t v5 = (unint64_t *)type metadata accessor for __CocoaDictionary.Iterator();
    v6 = swift_allocObject(v5, 0xE8uLL, 7uLL);
    *((_OWORD *)v6 + 1) = 0u;
    *((_OWORD *)v6 + 2) = 0u;
    *((_OWORD *)v6 + 3) = 0u;
    *((_OWORD *)v6 + 4) = 0u;
    *((_OWORD *)v6 + 5) = 0u;
    *((_OWORD *)v6 + 6) = 0u;
    *((_OWORD *)v6 + 7) = 0u;
    *((_OWORD *)v6 + 8) = 0u;
    *((_OWORD *)v6 + 9) = 0u;
    *((_OWORD *)v6 + 10) = 0u;
    *((_OWORD *)v6 + 11) = 0u;
    *((_OWORD *)v6 + 12) = 0u;
    v6[27] = 0;
    v6[28] = 0;
    v6[26] = v4;
    Dictionary.Iterator.init(_cocoa:)((uint64_t)v6, (uint64_t)v11);
  }
  else
  {
    _NativeDictionary.makeIterator()(v3, v10);
    Dictionary.Iterator.init(_native:)((uint64_t)v10, (uint64_t)v11);
  }
  uint64_t v7 = v12;
  double result = *(double *)v11;
  long long v9 = v11[1];
  *(_OWORD *)a1 = v11[0];
  *(_OWORD *)(a1 + 16) = v9;
  *(void *)(a1 + 32) = v7;
  return result;
}

- (atomic_ullong)B
{
  return swift_retain((atomic_ullong *)(a1 & 0x7FFFFFFFFFFFFFFFLL));
}

- (unint64_t)B
{
  if (a3) {
    return swift_bridgeObjectRetain(result);
  }
  return result;
}

- (id)B
{
  return Dictionary.Keys.count.getter(*v0);
}

- (void)B
{
  return a1;
}

- (Swift::Int)B
{
  v3[0] = 0;
  v3[1] = _swift_stdlib_Hashing_parameters ^ a1 ^ 0x736F6D6570736575;
  v3[2] = unk_1EB208F00 ^ 0x646F72616E646F6DLL;
  v3[3] = _swift_stdlib_Hashing_parameters ^ a1 ^ 0x6C7967656E657261;
  v3[4] = unk_1EB208F00 ^ 0x7465646279746573;
  long long v4 = 0u;
  long long v5 = 0u;
  Dictionary.Index.hash(into:)((uint64_t)v3, *(void *)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16));
  return Hasher._finalize()();
}

- (Class)B
{
  return Dictionary<>._toCustomAnyHashable()(*v3, *(char **)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a2 - 8), a3);
}

- (_UNKNOWN)B
{
  return &protocol witness table for [A : B].Index;
}

@end