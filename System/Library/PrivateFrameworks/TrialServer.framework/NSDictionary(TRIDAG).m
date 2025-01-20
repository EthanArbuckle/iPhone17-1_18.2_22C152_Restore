@interface NSDictionary(TRIDAG)
- (id)triItemsInDagWithSink:()TRIDAG;
- (id)triItemsInDagWithSource:()TRIDAG;
- (id)triReversedDag;
- (id)triTransformValuesWithBlock:()TRIDAG;
@end

@implementation NSDictionary(TRIDAG)

- (id)triReversedDag
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__51;
  v9 = __Block_byref_object_dispose__51;
  id v10 = (id)objc_opt_new();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__NSDictionary_TRIDAG__triReversedDag__block_invoke;
  v4[3] = &unk_1E6BBDF68;
  v4[4] = &v5;
  [a1 enumerateKeysAndObjectsUsingBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)triItemsInDagWithSink:()TRIDAG
{
  id v4 = a3;
  uint64_t v5 = [a1 triReversedDag];
  v6 = [v5 triItemsInDagWithSource:v4];

  return v6;
}

- (id)triItemsInDagWithSource:()TRIDAG
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 objectForKeyedSubscript:v4];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void *)[v5 mutableCopy];
    if ([v7 count])
    {
      unint64_t v8 = 0;
      do
      {
        v9 = v4;
        id v4 = [v7 objectAtIndexedSubscript:v8];

        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v10 = objc_msgSend(a1, "objectForKeyedSubscript:", v4, 0);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v18;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * i);
              if (([v7 containsObject:v15] & 1) == 0) {
                [v7 addObject:v15];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
          }
          while (v12);
        }
        ++v8;
      }
      while ([v7 count] > v8);
    }
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }

  return v7;
}

- (id)triTransformValuesWithBlock:()TRIDAG
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__51;
  uint64_t v15 = __Block_byref_object_dispose__51;
  id v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__NSDictionary_TRIDAG__triTransformValuesWithBlock___block_invoke;
  v8[3] = &unk_1E6BBDF90;
  id v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [a1 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

@end