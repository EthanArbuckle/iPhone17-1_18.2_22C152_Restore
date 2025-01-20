@interface __SwiftNativeNSArrayWithContiguousStorage
- (id)objectAtIndex:(int64_t)a3;
- (id)objectAtIndexedSubscript:(int64_t)a3;
- (int64_t)count;
- (int64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(int64_t)a5;
- (void)getObjects:(id *)a3 range:(id)a4;
@end

@implementation __SwiftNativeNSArrayWithContiguousStorage

- (int64_t)count
{
  void (*v3)(int64_t *__return_ptr, void (*)(uint64_t@<X1>, void *@<X8>), void, ValueMetadata *);
  int64_t v5;

  v3 = (void (*)(int64_t *__return_ptr, void (*)(uint64_t@<X1>, void *@<X8>), void, ValueMetadata *))*((void *)self->super.super.super.isa + 11);
  swift_retain((atomic_ullong *)self);
  v3(&v5, closure #1 in __SwiftNativeNSArrayWithContiguousStorage.count.getter, 0, &type metadata for Int);
  swift_release((uint64_t)self);
  return v5;
}

- (id)objectAtIndexedSubscript:(int64_t)a3
{
  return (id)@objc __SwiftNativeNSArrayWithContiguousStorage.objectAtSubscript(_:)((uint64_t)self, (uint64_t)a2, a3, (uint64_t)closure #1 in __SwiftNativeNSArrayWithContiguousStorage._objectAt(_:)partial apply);
}

- (id)objectAtIndex:(int64_t)a3
{
  return (id)@objc __SwiftNativeNSArrayWithContiguousStorage.objectAtSubscript(_:)((uint64_t)self, (uint64_t)a2, a3, (uint64_t)partial apply for closure #1 in __SwiftNativeNSArrayWithContiguousStorage._objectAt(_:));
}

- (void)getObjects:(id *)a3 range:(id)a4
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v7 = a4;
  v8 = a3;
  v5 = (void (*)(char *(*)(char *, uint64_t), uint64_t *, void *))*((void *)self->super.super.super.isa
                                                                                      + 11);
  swift_retain((atomic_ullong *)self);
  v5(partial apply for closure #1 in __SwiftNativeNSArrayWithContiguousStorage.getObjects(_:range:), &v6, &unk_1ECA06270);
  swift_release((uint64_t)self);
}

- (int64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(int64_t)a5
{
  void (*v10)(int64_t *__return_ptr, __n128 (*)@<Q0>(uint64_t@<X0>, uint64_t@<X1>, void *@<X8>), void *, ValueMetadata *);
  void v11[5];
  int64_t v12;
  _OWORD v13[4];

  int64_t result = 0;
  long long v7 = *(_OWORD *)&a3->var2;
  v13[0] = *(_OWORD *)&a3->var0;
  v13[1] = v7;
  long long v8 = *(_OWORD *)&a3->var3[3];
  v13[2] = *(_OWORD *)&a3->var3[1];
  v13[3] = v8;
  if (!*(void *)&v13[0])
  {
    MEMORY[0x1F4188790](0);
    v11[2] = v13;
    v11[3] = v9;
    v10 = (void (*)(int64_t *__return_ptr, __n128 (*)@<Q0>(uint64_t@<X0>, uint64_t@<X1>, void *@<X8>), void *, ValueMetadata *))*((void *)self->super.super.super.isa + 11);
    swift_retain((atomic_ullong *)self);
    v10(&v12, partial apply for closure #1 in __SwiftNativeNSArrayWithContiguousStorage.countByEnumerating(with:objects:count:), v11, &type metadata for Int);
    swift_release((uint64_t)self);
    return v12;
  }
  return result;
}

@end