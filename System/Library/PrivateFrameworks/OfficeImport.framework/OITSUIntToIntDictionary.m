@interface OITSUIntToIntDictionary
- (BOOL)containsKey:(int64_t)a3;
- (BOOL)intIsPresentForKey:(int64_t)a3 outValue:(int64_t *)a4;
- (OITSUIntToIntDictionary)init;
- (OITSUIntToIntDictionary)initWithCapacity:(unint64_t)a3;
- (__CFDictionary)p_cfDictionary;
- (id)allKeys;
- (id)allValues;
- (id)arrayOfBoxedKeys;
- (id)description;
- (id)keyEnumerator;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)intForKey:(int64_t)a3;
- (uint64_t)initWithCapacity:(uint64_t)a1;
- (unint64_t)count;
- (void)applyFromIntToIntDictionary:(id)a3;
- (void)dealloc;
- (void)enumerateKeysAndValuesUsingBlock:(id)a3;
- (void)removeAllInts;
- (void)removeIntForKey:(int64_t)a3;
- (void)setInt:(int64_t)a3 forKey:(int64_t)a4;
@end

@implementation OITSUIntToIntDictionary

- (OITSUIntToIntDictionary)init
{
  return [(OITSUIntToIntDictionary *)self initWithCapacity:0];
}

- (OITSUIntToIntDictionary)initWithCapacity:(unint64_t)a3
{
  CFIndex v4 = *MEMORY[0x263EFFF88];
  keyCallBacks.retain = 0;
  keyCallBacks.release = 0;
  keyCallBacks.version = v4;
  keyCallBacks.equal = 0;
  keyCallBacks.hash = 0;
  keyCallBacks.copyDescription = (CFDictionaryCopyDescriptionCallBack)-[OITSUIntToIntDictionary initWithCapacity:]::Local::IntegerKeyDescription;
  valueCallBacks.version = *MEMORY[0x263EFFF90];
  valueCallBacks.retain = 0;
  valueCallBacks.release = 0;
  valueCallBacks.copyDescription = (CFDictionaryCopyDescriptionCallBack)-[OITSUIntToIntDictionary initWithCapacity:]::Local::IntegerKeyDescription;
  valueCallBacks.equal = 0;
  v7.receiver = self;
  v7.super_class = (Class)OITSUIntToIntDictionary;
  v5 = [(OITSUIntToIntDictionary *)&v7 init];
  if (v5) {
    v5->mDictionary = CFDictionaryCreateMutable(0, a3, &keyCallBacks, &valueCallBacks);
  }
  return v5;
}

- (uint64_t)initWithCapacity:(uint64_t)a1
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%p", a1);
}

- (void)dealloc
{
  CFRelease(self->mDictionary);
  v3.receiver = self;
  v3.super_class = (Class)OITSUIntToIntDictionary;
  [(OITSUIntToIntDictionary *)&v3 dealloc];
}

- (unint64_t)count
{
  return CFDictionaryGetCount(self->mDictionary);
}

- (BOOL)intIsPresentForKey:(int64_t)a3 outValue:(int64_t *)a4
{
  return CFDictionaryGetValueIfPresent(self->mDictionary, (const void *)a3, (const void **)a4) != 0;
}

- (int64_t)intForKey:(int64_t)a3
{
  return (int64_t)CFDictionaryGetValue(self->mDictionary, (const void *)a3);
}

- (void)removeIntForKey:(int64_t)a3
{
}

- (void)setInt:(int64_t)a3 forKey:(int64_t)a4
{
}

- (void)removeAllInts
{
}

- (id)keyEnumerator
{
  v2 = [[OITSUIntToIntDictionaryKeyEnumerator alloc] initWithIntegerKeyDictionary:self];
  return v2;
}

- (BOOL)containsKey:(int64_t)a3
{
  return CFDictionaryGetCountOfKey(self->mDictionary, (const void *)a3) != 0;
}

- (void)applyFromIntToIntDictionary:(id)a3
{
  if (a3)
  {
    size_t v5 = [a3 count];
    v6 = (const void **)malloc_type_calloc(v5, 8uLL, 0x10040436913F5uLL);
    CFDictionaryGetKeysAndValues((CFDictionaryRef)objc_msgSend(a3, "p_cfDictionary"), v6, 0);
    if (v5)
    {
      uint64_t v7 = 0;
      unsigned int v8 = 1;
      do
      {
        -[OITSUIntToIntDictionary setInt:forKey:](self, "setInt:forKey:", [a3 intForKey:v6[v7]], v6[v7]);
        uint64_t v7 = v8;
      }
      while (v5 > v8++);
    }
    free(v6);
  }
}

- (id)arrayOfBoxedKeys
{
  size_t v3 = [(OITSUIntToIntDictionary *)self count];
  CFIndex v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[OITSUIntToIntDictionary count](self, "count"));
  size_t v5 = (const void **)malloc_type_calloc(v3, 8uLL, 0x10040436913F5uLL);
  CFDictionaryGetKeysAndValues([(OITSUIntToIntDictionary *)self p_cfDictionary], v5, 0);
  if (v3)
  {
    uint64_t v6 = 0;
    unsigned int v7 = 1;
    do
    {
      unsigned int v8 = (void *)[objc_alloc(NSNumber) initWithInteger:v5[v6]];
      [v4 addObject:v8];

      uint64_t v6 = v7;
    }
    while (v3 > v7++);
  }
  free(v5);
  v10 = (void *)[MEMORY[0x263EFF8C0] arrayWithArray:v4];

  return v10;
}

- (id)allKeys
{
  size_t v3 = [(OITSUIntToIntDictionary *)self count];
  id v4 = objc_alloc_init(MEMORY[0x263F089C8]);
  size_t v5 = (const void **)malloc_type_calloc(v3, 8uLL, 0x100004000313F17uLL);
  CFDictionaryGetKeysAndValues([(OITSUIntToIntDictionary *)self p_cfDictionary], v5, 0);
  if (v3)
  {
    uint64_t v6 = v5;
    do
    {
      uint64_t v7 = (uint64_t)*v6++;
      [v4 addIndex:v7];
      --v3;
    }
    while (v3);
  }
  free(v5);
  return v4;
}

- (id)allValues
{
  size_t v3 = [(OITSUIntToIntDictionary *)self count];
  id v4 = objc_alloc_init(MEMORY[0x263F089C8]);
  size_t v5 = (const void **)malloc_type_calloc(v3, 8uLL, 0x100004000313F17uLL);
  CFDictionaryGetKeysAndValues([(OITSUIntToIntDictionary *)self p_cfDictionary], 0, v5);
  if (v3)
  {
    uint64_t v6 = v5;
    do
    {
      uint64_t v7 = (uint64_t)*v6++;
      [v4 addIndex:v7];
      --v3;
    }
    while (v3);
  }
  free(v5);
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(OITSUIntToIntDictionary);
  mDictionary = v4->mDictionary;
  if (mDictionary) {
    CFRelease(mDictionary);
  }
  v4->mDictionary = CFDictionaryCreateMutableCopy(0, 0, self->mDictionary);
  return v4;
}

- (id)description
{
  id v3 = [(OITSUIntToIntDictionary *)self keyEnumerator];
  id v4 = (void *)[MEMORY[0x263F089D8] string];
  [v4 appendString:@"{\n"];
  uint64_t v5 = [v3 nextKey];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (uint64_t i = v5; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = [v3 nextKey])
    {
      int64_t v7 = [(OITSUIntToIntDictionary *)self intForKey:i];
      [v4 appendString:objc_msgSend(NSString, "stringWithFormat:", @"%ld = %ld;\n", i, v7)];
    }
  }
  [v4 appendString:@"}"];
  return v4;
}

- (void)enumerateKeysAndValuesUsingBlock:(id)a3
{
  if (a3)
  {
    id v5 = [(OITSUIntToIntDictionary *)self keyEnumerator];
    uint64_t v6 = [v5 nextKey];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (uint64_t i = (const void *)v6; i != (const void *)0x7FFFFFFFFFFFFFFFLL; uint64_t i = (const void *)[v5 nextKey])
      {
        Value = CFDictionaryGetValue(self->mDictionary, i);
        char v9 = 0;
        (*((void (**)(id, const void *, const void *, char *))a3 + 2))(a3, i, Value, &v9);
        if (v9) {
          break;
        }
      }
    }
  }
}

- (__CFDictionary)p_cfDictionary
{
  return self->mDictionary;
}

@end