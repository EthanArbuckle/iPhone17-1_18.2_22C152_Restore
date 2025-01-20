@interface OITSUIntegerKeyDictionary
- (OITSUIntegerKeyDictionary)init;
- (OITSUIntegerKeyDictionary)initWithCapacity:(unint64_t)a3;
- (__CFDictionary)p_cfDictionary;
- (id)allValues;
- (id)description;
- (id)keyEnumerator;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectForKey:(int64_t)a3;
- (id)valueEnumerator;
- (uint64_t)initWithCapacity:(uint64_t)a1;
- (unint64_t)count;
- (void)dealloc;
- (void)removeAllObjects;
- (void)removeObjectForKey:(int64_t)a3;
- (void)setObject:(id)a3 forKey:(int64_t)a4;
@end

@implementation OITSUIntegerKeyDictionary

- (OITSUIntegerKeyDictionary)init
{
  return [(OITSUIntegerKeyDictionary *)self initWithCapacity:0];
}

- (OITSUIntegerKeyDictionary)initWithCapacity:(unint64_t)a3
{
  CFIndex v4 = *MEMORY[0x263EFFF88];
  keyCallBacks.retain = 0;
  keyCallBacks.release = 0;
  keyCallBacks.equal = 0;
  keyCallBacks.hash = 0;
  keyCallBacks.copyDescription = (CFDictionaryCopyDescriptionCallBack)-[OITSUIntegerKeyDictionary initWithCapacity:]::Local::IntegerKeyDescription;
  v7.receiver = self;
  v7.super_class = (Class)OITSUIntegerKeyDictionary;
  keyCallBacks.version = v4;
  v5 = [(OITSUIntegerKeyDictionary *)&v7 init];
  if (v5) {
    v5->mDictionary = CFDictionaryCreateMutable(0, a3, &keyCallBacks, MEMORY[0x263EFFF90]);
  }
  return v5;
}

- (uint64_t)initWithCapacity:(uint64_t)a1
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%p", a1);
}

- (void)dealloc
{
  [(OITSUIntegerKeyDictionary *)self removeAllObjects];
  CFRelease(self->mDictionary);
  self->mDictionary = 0;
  v3.receiver = self;
  v3.super_class = (Class)OITSUIntegerKeyDictionary;
  [(OITSUIntegerKeyDictionary *)&v3 dealloc];
}

- (unint64_t)count
{
  return CFDictionaryGetCount(self->mDictionary);
}

- (id)objectForKey:(int64_t)a3
{
  return (id)CFDictionaryGetValue(self->mDictionary, (const void *)a3);
}

- (void)removeObjectForKey:(int64_t)a3
{
}

- (void)setObject:(id)a3 forKey:(int64_t)a4
{
}

- (void)removeAllObjects
{
}

- (id)keyEnumerator
{
  v2 = [[OITSUIntegerKeyDictionaryKeyEnumerator alloc] initWithIntegerKeyDictionary:self];
  return v2;
}

- (id)allValues
{
  values[16] = *(void **)MEMORY[0x263EF8340];
  unint64_t Count = CFDictionaryGetCount(self->mDictionary);
  unint64_t v4 = Count;
  v5 = (const void **)values;
  if (Count >= 0x10) {
    v5 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  }
  CFDictionaryGetKeysAndValues(self->mDictionary, 0, v5);
  v6 = (void *)[MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:v4];
  if (v5 != (const void **)values) {
    free(v5);
  }
  return v6;
}

- (id)valueEnumerator
{
  id v2 = [(OITSUIntegerKeyDictionary *)self allValues];
  return (id)[v2 objectEnumerator];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  unint64_t v4 = objc_alloc_init(OITSUIntegerKeyDictionary);
  mDictionary = v4->mDictionary;
  if (mDictionary) {
    CFRelease(mDictionary);
  }
  v4->mDictionary = CFDictionaryCreateMutableCopy(0, 0, self->mDictionary);
  return v4;
}

- (id)description
{
  id v3 = [(OITSUIntegerKeyDictionary *)self keyEnumerator];
  unint64_t v4 = (void *)[MEMORY[0x263F089D8] string];
  [v4 appendString:@"{\n"];
  uint64_t v5 = [v3 nextKey];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (uint64_t i = v5; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = [v3 nextKey])
    {
      id v7 = [(OITSUIntegerKeyDictionary *)self objectForKey:i];
      [v4 appendString:objc_msgSend(NSString, "stringWithFormat:", @"%ld = %@;\n", i, objc_msgSend(v7, "description"))];
    }
  }
  [v4 appendString:@"}"];
  return v4;
}

- (__CFDictionary)p_cfDictionary
{
  return self->mDictionary;
}

@end