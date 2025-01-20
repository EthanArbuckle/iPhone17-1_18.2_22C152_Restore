@interface __SwiftEmptyNSEnumerator
- (_TtCs24__SwiftEmptyNSEnumerator)initWithCoder:(id)a3;
- (id)nextObject;
- (int64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(int64_t)a5;
@end

@implementation __SwiftEmptyNSEnumerator

- (id)nextObject
{
  return 0;
}

- (int64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(int64_t)a5
{
  unint64_t var0 = a3->var0;
  var1 = a3->var1;
  var2 = a3->var2;
  if (!a3->var0)
  {
    var2 = &_fastEnumerationStorageMutationsTarget;
    var1 = a4;
  }
  if (var0 <= 1) {
    unint64_t var0 = 1;
  }
  a3->unint64_t var0 = var0;
  a3->var1 = var1;
  a3->var2 = var2;
  return 0;
}

- (_TtCs24__SwiftEmptyNSEnumerator)initWithCoder:(id)a3
{
  closure #1 in _unimplementedInitializer(className:initName:file:line:column:)("Swift.__SwiftEmptyNSEnumerator", 30, "init(coder:)", 12, 2, "Swift/Hashing.swift", 19, 2, 0x4DuLL, 0x16uLL);
  __break(1u);
  return result;
}

@end