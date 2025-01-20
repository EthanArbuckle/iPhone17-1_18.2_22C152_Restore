@interface __ContiguousArrayStorageBase
- (id)mutableCopyWithZone:(void *)a3;
- (int64_t)indexOfObjectIdenticalTo:(id)a3;
@end

@implementation __ContiguousArrayStorageBase

- (id)mutableCopyWithZone:(void *)a3
{
  v4 = (unint64_t *)type metadata accessor for _SwiftNSMutableArray();
  v5 = swift_allocObject(v4, 0x18uLL, 7uLL);
  v5[2] = self;
  swift_retain((atomic_ullong *)self);
  return v5;
}

- (int64_t)indexOfObjectIdenticalTo:(id)a3
{
  return @objc _SwiftNSMutableArray.index(ofObjectIdenticalTo:)((atomic_ullong *)self, (uint64_t)a2, a3, __ContiguousArrayStorageBase.index(ofObjectIdenticalTo:));
}

@end