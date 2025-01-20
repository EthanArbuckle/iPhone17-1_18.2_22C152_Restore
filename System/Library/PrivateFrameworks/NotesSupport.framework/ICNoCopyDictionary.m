@interface ICNoCopyDictionary
+ (Class)classForKeyedUnarchiver;
- (ICNoCopyDictionary)init;
- (ICNoCopyDictionary)initWithCFDictionary:(__CFDictionary *)a3;
- (ICNoCopyDictionary)initWithCapacity:(unint64_t)a3;
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
- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forUncopiedKey:(id)a4;
@end

@implementation ICNoCopyDictionary

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (ICNoCopyDictionary)init
{
  return [(ICNoCopyDictionary *)self initWithCapacity:0];
}

- (ICNoCopyDictionary)initWithCFDictionary:(__CFDictionary *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICNoCopyDictionary;
  v4 = [(ICNoCopyDictionary *)&v6 init];
  if (v4) {
    v4->mDictionary = CFDictionaryCreateMutableCopy(0, 0, a3);
  }
  return v4;
}

- (ICNoCopyDictionary)initWithCapacity:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICNoCopyDictionary;
  v4 = [(ICNoCopyDictionary *)&v6 init];
  if (v4) {
    v4->mDictionary = CFDictionaryCreateMutable(0, a3, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
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
  v4.super_class = (Class)ICNoCopyDictionary;
  [(ICNoCopyDictionary *)&v4 dealloc];
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

- (void)setObject:(id)a3 forUncopiedKey:(id)a4
{
  if (!a3)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Attempt to insert nil value into %@", objc_opt_class() format];
    if (a4) {
      goto LABEL_3;
    }
LABEL_7:
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "aKey != ((void *)0)", "-[ICNoCopyDictionary setObject:forUncopiedKey:]", 1, 0, @"Inserting a value into no-copy dictionary with a NULL key into %p! Object is %@", self, a3);
    return;
  }
  if (!a4) {
    goto LABEL_7;
  }
LABEL_3:
  mDictionary = self->mDictionary;
  CFDictionarySetValue(mDictionary, a4, a3);
}

- (unint64_t)count
{
  return CFDictionaryGetCount(self->mDictionary);
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4
{
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5
{
  unint64_t Count = CFDictionaryGetCount(self->mDictionary);
  if (Count >= a5) {
    unint64_t v10 = a5;
  }
  else {
    unint64_t v10 = Count;
  }
  if (v10) {
    BOOL v11 = ((unint64_t)a3 | (unint64_t)a4) == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    mDictionary = self->mDictionary;
    CFDictionaryGetKeysAndValues(mDictionary, (const void **)a4, (const void **)a3);
  }
}

- (id)objectForKey:(id)a3
{
  if (a3) {
    return (id)CFDictionaryGetValue(self->mDictionary, a3);
  }
  else {
    return 0;
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
  id v2 = [(ICNoCopyDictionary *)self allValues];
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
  id v2 = [(ICNoCopyDictionary *)self allKeys];
  return (id)[v2 objectEnumerator];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t Count = CFDictionaryGetCount(self->mDictionary);
  if (a3->var0 >= Count) {
    return 0;
  }
  unint64_t v10 = Count;
  BOOL v11 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
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