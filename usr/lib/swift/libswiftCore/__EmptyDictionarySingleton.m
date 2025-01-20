@interface __EmptyDictionarySingleton
- (_TtCs26__EmptyDictionarySingleton)initWithObjects:(const void *)a3 forKeys:(void *)a4 count:(int64_t)a5;
- (id)objectForKey:(id)a3;
- (int64_t)count;
@end

@implementation __EmptyDictionarySingleton

- (_TtCs26__EmptyDictionarySingleton)initWithObjects:(const void *)a3 forKeys:(void *)a4 count:(int64_t)a5
{
  result = (_TtCs26__EmptyDictionarySingleton *)swift_release((uint64_t)self);
  __break(1u);
  return result;
}

- (int64_t)count
{
  return 0;
}

- (id)objectForKey:(id)a3
{
  return 0;
}

@end