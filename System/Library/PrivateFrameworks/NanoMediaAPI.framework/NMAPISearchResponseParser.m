@interface NMAPISearchResponseParser
- (id)resultsWithDictionary:(id)a3 error:(id *)a4;
@end

@implementation NMAPISearchResponseParser

- (id)resultsWithDictionary:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
  v6 = [v5 objectForKey:@"results"];
  v7 = NMAPIDictionaryWithObject(v6, @"results", a4);

  if (v7)
  {
    v8 = [v5 valueForKeyPath:@"meta.results.order"];
    v9 = NMAPIArrayWithObject(v8, @"resultsOrder", a4);

    if (v9)
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id obj = v9;
      uint64_t v29 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v29)
      {
        uint64_t v28 = *(void *)v32;
        v10 = @"data";
        v25 = v9;
        id v26 = v5;
        while (2)
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v32 != v28) {
              objc_enumerationMutation(obj);
            }
            uint64_t v12 = NMAPIStringWithObject(*(void **)(*((void *)&v31 + 1) + 8 * i), @"resultKey", a4);
            if (!v12) {
              goto LABEL_18;
            }
            v13 = (void *)v12;
            v14 = [v7 objectForKey:v12];
            v15 = NMAPIDictionaryWithObject(v14, @"section", a4);

            if (!v15)
            {

LABEL_18:
              v23 = 0;
              v9 = v25;
              id v5 = v26;
              goto LABEL_19;
            }
            v16 = [v15 objectForKey:v10];
            v17 = NMAPIArrayWithObject(v16, @"items", a4);

            if (v17)
            {
              v18 = (void *)[v15 mutableCopy];
              [v18 removeObjectForKey:v10];
              v19 = [NMAPISectionResult alloc];
              v20 = v10;
              v21 = (void *)[v18 copy];
              v22 = [(NMAPISectionResult *)v19 initWithSectionIdentifier:v13 sectionDictionary:v21 itemsArray:v17];
              [v30 addObject:v22];

              v10 = v20;
            }
          }
          v9 = v25;
          id v5 = v26;
          uint64_t v29 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
          if (v29) {
            continue;
          }
          break;
        }
      }

      v23 = (void *)[v30 copy];
    }
    else
    {
      v23 = 0;
    }
LABEL_19:
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

@end