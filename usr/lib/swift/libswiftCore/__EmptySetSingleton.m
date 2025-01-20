@interface __EmptySetSingleton
- (_TtCs19__EmptySetSingleton)initWithObjects:(const void *)a3 count:(int64_t)a4;
- (id)member:(id)a3;
- (id)objectEnumerator;
- (int64_t)count;
@end

@implementation __EmptySetSingleton

- (_TtCs19__EmptySetSingleton)initWithObjects:(const void *)a3 count:(int64_t)a4
{
  result = (_TtCs19__EmptySetSingleton *)swift_release((uint64_t)self);
  __break(1u);
  return result;
}

- (int64_t)count
{
  return 0;
}

- (id)member:(id)a3
{
  return 0;
}

- (id)objectEnumerator
{
  v2 = (unint64_t *)type metadata accessor for __SwiftEmptyNSEnumerator();
  v3 = swift_allocObject(v2, 0x10uLL, 7uLL);

  return v3;
}

@end