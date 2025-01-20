@interface TIFacemarkSorter
+ (id)candidatesSortedByFacemarkCategoryFromCandidates:(id)a3;
@end

@implementation TIFacemarkSorter

+ (id)candidatesSortedByFacemarkCategoryFromCandidates:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = MEMORY[0x192F9B3D0]();
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v27 = (void *)v4;
  context = (void *)v5;
  if (candidatesSortedByFacemarkCategoryFromCandidates__onceToken != -1) {
    dispatch_once(&candidatesSortedByFacemarkCategoryFromCandidates__onceToken, &__block_literal_global_11797);
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v7 = (id)candidatesSortedByFacemarkCategoryFromCandidates__orderedKeys;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        id v13 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v12, v27, context);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v9);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v14 = v3;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v20 = v19;
          v21 = [v20 category];
          v22 = [v6 objectForKeyedSubscript:v21];

          if (!v22)
          {
            v22 = [v6 objectForKey:@"O"];
          }
          objc_msgSend(v22, "addObject:", v20, v27);
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v16);
  }

  v23 = (void *)candidatesSortedByFacemarkCategoryFromCandidates__orderedKeys;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __69__TIFacemarkSorter_candidatesSortedByFacemarkCategoryFromCandidates___block_invoke_2;
  v29[3] = &unk_1E555A338;
  id v30 = v6;
  id v24 = v27;
  id v31 = v24;
  id v25 = v6;
  [v23 enumerateObjectsUsingBlock:v29];

  return v24;
}

void __69__TIFacemarkSorter_candidatesSortedByFacemarkCategoryFromCandidates___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if ([v8 count])
  {
    uint64_t v5 = [(id)candidatesSortedByFacemarkCategoryFromCandidates__orderedNames objectAtIndexedSubscript:a3];
    id v6 = *(void **)(a1 + 40);
    id v7 = [[TIKeyboardCandidateGroup alloc] initWithTitle:v5 candidates:v8];
    [v6 addObject:v7];
  }
}

void __69__TIFacemarkSorter_candidatesSortedByFacemarkCategoryFromCandidates___block_invoke()
{
  id v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.TextInput"];
  v0 = [v7 pathForResource:@"FacemarkCategories" ofType:@"plist"];
  if (v0)
  {
    v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v0];
    v2 = v1;
    if (v1)
    {
      uint64_t v3 = [v1 objectForKeyedSubscript:@"Keys"];
      uint64_t v4 = (void *)candidatesSortedByFacemarkCategoryFromCandidates__orderedKeys;
      candidatesSortedByFacemarkCategoryFromCandidates__orderedKeys = v3;

      uint64_t v5 = [v2 objectForKeyedSubscript:@"Names"];
      id v6 = (void *)candidatesSortedByFacemarkCategoryFromCandidates__orderedNames;
      candidatesSortedByFacemarkCategoryFromCandidates__orderedNames = v5;
    }
  }
}

@end