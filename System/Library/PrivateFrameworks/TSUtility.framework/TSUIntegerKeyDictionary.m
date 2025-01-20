@interface TSUIntegerKeyDictionary
+ (BOOL)supportsSecureCoding;
- (TSUIntegerKeyDictionary)init;
- (TSUIntegerKeyDictionary)initWithCapacity:(unint64_t)a3;
- (TSUIntegerKeyDictionary)initWithCoder:(id)a3;
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
- (void)encodeWithCoder:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectForKey:(int64_t)a3;
- (void)setObject:(id)a3 forKey:(int64_t)a4;
@end

@implementation TSUIntegerKeyDictionary

- (TSUIntegerKeyDictionary)init
{
  return [(TSUIntegerKeyDictionary *)self initWithCapacity:0];
}

- (TSUIntegerKeyDictionary)initWithCapacity:(unint64_t)a3
{
  CFIndex v4 = *MEMORY[0x263EFFF88];
  keyCallBacks.retain = 0;
  keyCallBacks.release = 0;
  keyCallBacks.equal = 0;
  keyCallBacks.hash = 0;
  keyCallBacks.copyDescription = (CFDictionaryCopyDescriptionCallBack)-[TSUIntegerKeyDictionary initWithCapacity:]::Local::IntegerKeyDescription;
  v7.receiver = self;
  v7.super_class = (Class)TSUIntegerKeyDictionary;
  keyCallBacks.version = v4;
  v5 = [(TSUIntegerKeyDictionary *)&v7 init];
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
  [(TSUIntegerKeyDictionary *)self removeAllObjects];
  CFRelease(self->mDictionary);
  self->mDictionary = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSUIntegerKeyDictionary;
  [(TSUIntegerKeyDictionary *)&v3 dealloc];
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
  v2 = [[TSUIntegerKeyDictionaryKeyEnumerator alloc] initWithIntegerKeyDictionary:self];
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
  id v2 = [(TSUIntegerKeyDictionary *)self allValues];
  return (id)[v2 objectEnumerator];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  unint64_t v4 = objc_alloc_init(TSUIntegerKeyDictionary);
  v4->mDictionary = CFDictionaryCreateMutableCopy(0, 0, self->mDictionary);
  return v4;
}

- (id)description
{
  id v3 = [(TSUIntegerKeyDictionary *)self keyEnumerator];
  unint64_t v4 = (void *)[MEMORY[0x263F089D8] string];
  [v4 appendString:@"{\n"];
  uint64_t v5 = [v3 nextKey];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (uint64_t i = v5; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = [v3 nextKey])
    {
      id v7 = [(TSUIntegerKeyDictionary *)self objectForKey:i];
      [v4 appendString:objc_msgSend(NSString, "stringWithFormat:", @"%ld = %@;\n", i, objc_msgSend(v7, "description"))];
    }
  }
  [v4 appendString:@"}"];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TSUIntegerKeyDictionary)initWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  unint64_t v4 = [(TSUIntegerKeyDictionary *)self initWithCapacity:0];
  if (v4)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "unionSet:", objc_msgSend(a3, "allowedClasses"));
    v6 = (void *)[a3 decodeObjectOfClasses:v5 forKey:@"data"];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          -[TSUIntegerKeyDictionary setObject:forKey:](v4, "setObject:forKey:", [v6 objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * v10)], objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10), "integerValue"));
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", -[TSUIntegerKeyDictionary count](self, "count"));
  id v5 = [(TSUIntegerKeyDictionary *)self keyEnumerator];
  uint64_t v6 = [v5 nextKey];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (uint64_t i = v6; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = [v5 nextKey])
    {
      id v8 = [(TSUIntegerKeyDictionary *)self objectForKey:i];
      objc_msgSend(v9, "setObject:forKey:", v8, objc_msgSend(NSNumber, "numberWithInteger:", i));
    }
  }
  [a3 encodeObject:v9 forKey:@"data"];
}

- (__CFDictionary)p_cfDictionary
{
  return self->mDictionary;
}

@end