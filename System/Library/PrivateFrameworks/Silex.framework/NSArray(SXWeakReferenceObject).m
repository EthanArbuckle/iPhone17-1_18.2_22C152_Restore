@interface NSArray(SXWeakReferenceObject)
- (id)weakReferenceObjects;
@end

@implementation NSArray(SXWeakReferenceObject)

- (id)weakReferenceObjects
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v9 = objc_msgSend(v8, "object", (void)v12);

          if (v9)
          {
            v10 = [v8 object];
            [v2 addObject:v10];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

@end