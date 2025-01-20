@interface TSUIntToIntDictionaryKeyEnumerator
- (TSUIntToIntDictionaryKeyEnumerator)initWithIntegerKeyDictionary:(id)a3;
- (int64_t)nextKey;
- (void)dealloc;
@end

@implementation TSUIntToIntDictionaryKeyEnumerator

- (TSUIntToIntDictionaryKeyEnumerator)initWithIntegerKeyDictionary:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSUIntToIntDictionaryKeyEnumerator;
  v4 = [(TSUIntToIntDictionaryKeyEnumerator *)&v7 init];
  if (v4)
  {
    size_t v5 = [a3 count];
    v4->_count = v5;
    if (v5)
    {
      v4->_keys = (int64_t **)malloc_type_calloc(v5, 8uLL, 0x10040436913F5uLL);
      CFDictionaryGetKeysAndValues((CFDictionaryRef)objc_msgSend(a3, "p_cfDictionary"), (const void **)v4->_keys, 0);
    }
  }
  return v4;
}

- (void)dealloc
{
  keys = self->_keys;
  if (keys) {
    free(keys);
  }
  v4.receiver = self;
  v4.super_class = (Class)TSUIntToIntDictionaryKeyEnumerator;
  [(TSUIntToIntDictionaryKeyEnumerator *)&v4 dealloc];
}

- (int64_t)nextKey
{
  unint64_t index = self->_index;
  if (index >= self->_count) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  keys = self->_keys;
  self->_unint64_t index = index + 1;
  return (int64_t)keys[index];
}

@end