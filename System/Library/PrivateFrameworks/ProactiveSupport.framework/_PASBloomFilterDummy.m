@interface _PASBloomFilterDummy
+ (id)instanceThatAlwaysReturns:(BOOL)a3;
- (BOOL)getWithHashes:(id)a3;
- (_PASBloomFilterDummy)initWithResult:(BOOL)a3;
@end

@implementation _PASBloomFilterDummy

- (BOOL)getWithHashes:(id)a3
{
  return *((unsigned char *)&self->super._hashArrayLength + 4);
}

- (_PASBloomFilterDummy)initWithResult:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_PASBloomFilterDummy;
  result = [(_PASBloomFilter *)&v5 initDummy];
  if (result) {
    *((unsigned char *)&result->super._hashArrayLength + 4) = a3;
  }
  return result;
}

+ (id)instanceThatAlwaysReturns:(BOOL)a3
{
  v3 = [[_PASBloomFilterDummy alloc] initWithResult:a3];

  return v3;
}

@end