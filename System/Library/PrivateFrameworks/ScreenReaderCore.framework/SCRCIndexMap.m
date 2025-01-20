@interface SCRCIndexMap
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (SCRCIndexMap)init;
- (SCRCIndexMap)initWithCoder:(id)a3;
- (SCRCIndexMap)initWithObjects:(const void *)a3 andIndexes:(unint64_t *)a4 count:(unint64_t)a5;
- (id)_initAndDeepCopyIndexMap:(id)a3;
- (id)_initWithIndexMap:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deepCopyWithZone:(_NSZone *)a3;
- (id)description;
- (id)indexes;
- (id)objectForIndex:(unint64_t)a3;
- (unint64_t)_createIndexesWithSize:(unint64_t *)a3;
- (unint64_t)count;
- (void)addObjectsFromIndexMap:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectForIndex:(unint64_t)a3;
- (void)setObject:(id)a3 forIndex:(unint64_t)a4;
@end

@implementation SCRCIndexMap

- (SCRCIndexMap)initWithObjects:(const void *)a3 andIndexes:(unint64_t *)a4 count:(unint64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)SCRCIndexMap;
  v8 = [(SCRCIndexMap *)&v12 init];
  if (v8
    && (CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, MEMORY[0x263EFFF90]),
        (v8->_map = Mutable) != 0))
  {
    for (; a5; --a5)
    {
      if (*a3) {
        CFDictionarySetValue(v8->_map, (const void *)*a4, *a3);
      }
      ++a4;
      ++a3;
    }
    v10 = v8;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (SCRCIndexMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)SCRCIndexMap;
  v2 = [(SCRCIndexMap *)&v6 init];
  if (v2
    && (CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, MEMORY[0x263EFFF90]),
        (v2->_map = Mutable) != 0))
  {
    v4 = v2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_initWithIndexMap:(id)a3
{
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCRCIndexMap;
  v5 = [(SCRCIndexMap *)&v11 init];
  if (v5
    && (CFDictionaryRef v6 = (const __CFDictionary *)v4[1],
        CFIndex Count = CFDictionaryGetCount(v6),
        CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, Count, v6),
        (v5->_map = MutableCopy) != 0))
  {
    v9 = v5;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_initAndDeepCopyIndexMap:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SCRCIndexMap;
  v5 = [(SCRCIndexMap *)&v15 init];
  if (v5
    && (CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, MEMORY[0x263EFFF90]),
        (v5->_map = Mutable) != 0))
  {
    unint64_t v14 = 0;
    uint64_t v7 = [v4 _createIndexesWithSize:&v14];
    if (v7)
    {
      v8 = (void *)v7;
      if (v14)
      {
        for (unint64_t i = 0; i < v14; ++i)
        {
          v10 = [v4 objectForIndex:v8[i]];
          objc_super v11 = (void *)[v10 copy];

          CFDictionarySetValue(v5->_map, (const void *)v8[i], v11);
        }
      }
      free(v8);
    }
    objc_super v12 = v5;
  }
  else
  {
    objc_super v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[SCRCIndexMap allocWithZone:a3];
  return [(SCRCIndexMap *)v4 _initWithIndexMap:self];
}

- (id)deepCopyWithZone:(_NSZone *)a3
{
  id v4 = +[SCRCIndexMap allocWithZone:a3];
  return [(SCRCIndexMap *)v4 _initAndDeepCopyIndexMap:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCRCIndexMap)initWithCoder:(id)a3
{
  v20[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(SCRCIndexMap *)self init];
  if (v5)
  {
    CFDictionaryRef v6 = (void *)MEMORY[0x263EFFA08];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
    v8 = [v6 setWithArray:v7];
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"indexes"];

    v10 = (void *)MEMORY[0x263EFFA08];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v19[3] = objc_opt_class();
    objc_super v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:4];
    objc_super v12 = [v10 setWithArray:v11];
    v13 = [v4 decodeObjectOfClasses:v12 forKey:@"values"];

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __30__SCRCIndexMap_initWithCoder___block_invoke;
    v16[3] = &unk_2643D6F88;
    v17 = v5;
    id v18 = v13;
    id v14 = v13;
    [v9 enumerateObjectsUsingBlock:v16];
  }
  return v5;
}

void __30__SCRCIndexMap_initWithCoder___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  id v6 = a2;
  id v8 = [v5 objectAtIndex:a3];
  uint64_t v7 = [v6 unsignedLongValue];

  [v4 setObject:v8 forIndex:v7];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = objc_opt_new();
  unint64_t v12 = 0;
  uint64_t v7 = [(SCRCIndexMap *)self _createIndexesWithSize:&v12];
  if (v12)
  {
    for (unint64_t i = 0; i < v12; ++i)
    {
      unint64_t v9 = v7[i];
      v10 = [(SCRCIndexMap *)self objectForIndex:v9];
      if ([v10 conformsToProtocol:&unk_26CC2FFE0])
      {
        objc_super v11 = [NSNumber numberWithUnsignedLong:v9];
        [v5 addObject:v11];

        [v6 addObject:v10];
      }
    }
  }
  [v4 encodeObject:v5 forKey:@"indexes"];
  [v4 encodeObject:v6 forKey:@"values"];
  free(v7);
}

- (void)dealloc
{
  map = self->_map;
  if (map) {
    CFRelease(map);
  }
  v4.receiver = self;
  v4.super_class = (Class)SCRCIndexMap;
  [(SCRCIndexMap *)&v4 dealloc];
}

- (void)setObject:(id)a3 forIndex:(unint64_t)a4
{
  if (a3) {
    CFDictionarySetValue(self->_map, (const void *)a4, a3);
  }
}

- (void)removeObjectForIndex:(unint64_t)a3
{
}

- (void)removeAllObjects
{
}

- (id)objectForIndex:(unint64_t)a3
{
  return (id)CFDictionaryGetValue(self->_map, (const void *)a3);
}

- (unint64_t)count
{
  return CFDictionaryGetCount(self->_map);
}

- (unint64_t)_createIndexesWithSize:(unint64_t *)a3
{
  CFIndex Count = CFDictionaryGetCount(self->_map);
  if (a3) {
    *a3 = Count;
  }
  size_t v6 = 8 * Count;
  uint64_t v7 = (const void **)malloc_type_malloc(8 * Count, 0xC823C8AuLL);
  id v8 = v7;
  if (v7)
  {
    bzero(v7, v6);
    CFDictionaryGetKeysAndValues(self->_map, v8, 0);
  }
  return (unint64_t *)v8;
}

- (id)indexes
{
  unint64_t v6 = 0;
  v2 = [(SCRCIndexMap *)self _createIndexesWithSize:&v6];
  id v3 = objc_alloc_init(MEMORY[0x263F089C8]);
  if (v6)
  {
    for (unint64_t i = 0; i < v6; ++i)
      [v3 addIndex:v2[i]];
  }
  free(v2);
  return v3;
}

- (void)addObjectsFromIndexMap:(id)a3
{
  id v4 = a3;
  unint64_t v9 = 0;
  uint64_t v5 = [v4 _createIndexesWithSize:&v9];
  if (v5)
  {
    unint64_t v6 = (void *)v5;
    if (v9)
    {
      for (unint64_t i = 0; i < v9; ++i)
      {
        id v8 = [v4 objectForIndex:v6[i]];
        [(SCRCIndexMap *)self setObject:v8 forIndex:v6[i]];
      }
    }
    free(v6);
  }
}

- (id)description
{
  id v3 = [MEMORY[0x263F089D8] stringWithString:@"SCRCIndexMap:\n"];
  unint64_t v13 = 0;
  id v4 = [(SCRCIndexMap *)self _createIndexesWithSize:&v13];
  if (v4)
  {
    uint64_t v5 = v4;
    if (v13)
    {
      for (unint64_t i = 0; i < v13; ++i)
      {
        id v7 = [NSString alloc];
        unint64_t v8 = v5[i];
        unint64_t v9 = [(SCRCIndexMap *)self objectForIndex:v8];
        v10 = (void *)[v7 initWithFormat:@"\t%lu (0x%lx) -> %@\n", v8, v8, v9];

        [v3 appendString:v10];
      }
    }
    free(v5);
    id v11 = v3;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(SCRCIndexMap *)self count];
    if (v6 == [v5 count])
    {
      id v7 = [(SCRCIndexMap *)self indexes];
      unint64_t v8 = [v5 indexes];
      unint64_t v9 = (void *)[v8 mutableCopy];

      if ([v7 isEqualToIndexSet:v9])
      {
        uint64_t v15 = 0;
        v16 = &v15;
        uint64_t v17 = 0x2020000000;
        char v18 = 1;
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __24__SCRCIndexMap_isEqual___block_invoke;
        v12[3] = &unk_2643D6FB0;
        v12[4] = self;
        id v13 = v5;
        id v14 = &v15;
        [v7 enumerateIndexesUsingBlock:v12];
        BOOL v10 = *((unsigned char *)v16 + 24) != 0;

        _Block_object_dispose(&v15, 8);
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

void __24__SCRCIndexMap_isEqual___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v7 = [*(id *)(a1 + 32) objectForIndex:a2];
  id v6 = [*(id *)(a1 + 40) objectForIndex:a2];
  if (v7 != v6 && ([v7 isEqual:v6] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a3 = 1;
  }
}

@end