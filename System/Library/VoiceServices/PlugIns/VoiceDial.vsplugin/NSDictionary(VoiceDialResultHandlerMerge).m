@interface NSDictionary(VoiceDialResultHandlerMerge)
- (id)mergeSetValuesIntoArray;
@end

@implementation NSDictionary(VoiceDialResultHandlerMerge)

- (id)mergeSetValuesIntoArray
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263EFF980]);
  v3 = [a1 allKeys];
  v4 = objc_msgSend(v2, "initWithCapacity:", objc_msgSend(v3, "count"));

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(v5, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

@end