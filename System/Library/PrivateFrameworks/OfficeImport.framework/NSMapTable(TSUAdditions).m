@interface NSMapTable(TSUAdditions)
- (OITSUNoCopyDictionary)tsu_noCopyDictionaryRepresentation;
- (id)tsu_allKeys;
@end

@implementation NSMapTable(TSUAdditions)

- (id)tsu_allKeys
{
  v1 = [a1 keyEnumerator];
  v2 = [v1 allObjects];

  return v2;
}

- (OITSUNoCopyDictionary)tsu_noCopyDictionaryRepresentation
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(OITSUNoCopyDictionary);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        v9 = objc_msgSend(v3, "objectForKey:", v8, (void)v11);
        [(OITSUNoCopyDictionary *)v2 setObject:v9 forUncopiedKey:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v2;
}

@end