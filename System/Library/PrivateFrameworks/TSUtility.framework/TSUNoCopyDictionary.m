@interface TSUNoCopyDictionary
- (TSUNoCopyDictionary)init;
- (TSUNoCopyDictionary)initWithCFDictionary:(__CFDictionary *)a3;
- (TSUNoCopyDictionary)initWithCapacity:(unint64_t)a3;
- (id)allKeys;
- (id)allValues;
- (id)keyEnumerator;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectEnumerator;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
- (void)getObjects:(id *)a3 andKeys:(id *)a4;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forUncopiedKey:(id)a4;
@end

@implementation TSUNoCopyDictionary

- (id)objectForKey:(id)a3
{
  return (id)CFDictionaryGetValue(self->mDictionary, a3);
}

- (TSUNoCopyDictionary)init
{
  return [(TSUNoCopyDictionary *)self initWithCapacity:0];
}

- (void)setObject:(id)a3 forUncopiedKey:(id)a4
{
  if (!a3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Attempt to insert nil value into %@", objc_opt_class() format];
  }
  mDictionary = self->mDictionary;
  CFDictionarySetValue(mDictionary, a4, a3);
}

- (TSUNoCopyDictionary)initWithCapacity:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSUNoCopyDictionary;
  v4 = [(TSUNoCopyDictionary *)&v6 init];
  if (v4) {
    v4->mDictionary = CFDictionaryCreateMutable(0, a3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  return v4;
}

- (TSUNoCopyDictionary)initWithCFDictionary:(__CFDictionary *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSUNoCopyDictionary;
  v4 = [(TSUNoCopyDictionary *)&v6 init];
  if (v4) {
    v4->mDictionary = CFDictionaryCreateMutableCopy(0, 0, a3);
  }
  return v4;
}

- (void)dealloc
{
  mDictionary = self->mDictionary;
  if (mDictionary)
  {
    CFRelease(mDictionary);
    self->mDictionary = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSUNoCopyDictionary;
  [(TSUNoCopyDictionary *)&v4 dealloc];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  objc_super v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  mDictionary = self->mDictionary;
  return (id)[v4 initWithCFDictionary:mDictionary];
}

- (void)removeObjectForKey:(id)a3
{
}

- (void)removeAllObjects
{
}

- (unint64_t)count
{
  return CFDictionaryGetCount(self->mDictionary);
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4
{
  if (CFDictionaryGetCount(self->mDictionary)) {
    BOOL v7 = ((unint64_t)a3 | (unint64_t)a4) == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    mDictionary = self->mDictionary;
    CFDictionaryGetKeysAndValues(mDictionary, (const void **)a4, (const void **)a3);
  }
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
  objc_super v6 = (void *)[MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:v4];
  if (v5 != (const void **)values) {
    free(v5);
  }
  return v6;
}

- (id)objectEnumerator
{
  id v2 = [(TSUNoCopyDictionary *)self allValues];
  return (id)[v2 objectEnumerator];
}

- (id)allKeys
{
  keys[16] = *(void **)MEMORY[0x263EF8340];
  unint64_t Count = CFDictionaryGetCount(self->mDictionary);
  unint64_t v4 = Count;
  v5 = (const void **)keys;
  if (Count >= 0x10) {
    v5 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  }
  CFDictionaryGetKeysAndValues(self->mDictionary, v5, 0);
  objc_super v6 = (void *)[MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:v4];
  if (v5 != (const void **)keys) {
    free(v5);
  }
  return v6;
}

- (id)keyEnumerator
{
  id v2 = [(TSUNoCopyDictionary *)self allKeys];
  return (id)[v2 objectEnumerator];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t Count = CFDictionaryGetCount(self->mDictionary);
  if (a3->var0 >= Count) {
    return 0;
  }
  unint64_t v10 = Count;
  v11 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  CFDictionaryGetKeysAndValues(self->mDictionary, v11, 0);
  if (v10 - a3->var0 < a5) {
    a5 = v10 - a3->var0;
  }
  memcpy(a4, &v11[a3->var0], 8 * a5);
  free(v11);
  a3->var0 += a5;
  a3->var1 = a4;
  a3->var2 = (unint64_t *)&a3->var2;
  return a5;
}

@end