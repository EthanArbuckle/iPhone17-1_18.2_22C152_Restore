@interface _PASBloomFilterHashArray
- (_PASBloomFilterHashArray)initWithCapacity:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initInternal;
- (int)hashes;
- (void)dealloc;
@end

@implementation _PASBloomFilterHashArray

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[_PASBloomFilterHashArray allocWithZone:a3] initInternal];
  if (v4)
  {
    v5 = malloc_type_malloc(self->_size, 0xD291E933uLL);
    if (!v5)
    {
      id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v7);
    }
    v4[2] = v5;
    memcpy(v5, self->_data, self->_size);
  }
  return v4;
}

- (void)dealloc
{
  free(self->_data);
  v3.receiver = self;
  v3.super_class = (Class)_PASBloomFilterHashArray;
  [(_PASBloomFilterHashArray *)&v3 dealloc];
}

- (int)hashes
{
  return self->_data;
}

- (_PASBloomFilterHashArray)initWithCapacity:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_PASBloomFilterHashArray;
  v4 = [(_PASBloomFilterHashArray *)&v8 init];
  if (v4)
  {
    v4->_size = 4 * a3;
    v5 = (int *)malloc_type_malloc(4 * a3, 0x191F9D57uLL);
    if (!v5)
    {
      id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v7);
    }
    v4->_data = v5;
  }
  return v4;
}

- (id)initInternal
{
  v3.receiver = self;
  v3.super_class = (Class)_PASBloomFilterHashArray;
  return [(_PASBloomFilterHashArray *)&v3 init];
}

@end