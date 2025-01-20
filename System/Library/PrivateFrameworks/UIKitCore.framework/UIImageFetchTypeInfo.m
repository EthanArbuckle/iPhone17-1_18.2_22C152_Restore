@interface UIImageFetchTypeInfo
@end

@implementation UIImageFetchTypeInfo

void ___UIImageFetchTypeInfo_block_invoke()
{
  v37[5] = *MEMORY[0x1E4F143B8];
  v0 = [(id)*MEMORY[0x1E4F443E0] identifier];
  v37[0] = v0;
  v1 = [(id)*MEMORY[0x1E4F44460] identifier];
  v37[1] = v1;
  v2 = [(id)*MEMORY[0x1E4F444E0] identifier];
  v37[2] = v2;
  v3 = [(id)*MEMORY[0x1E4F44410] identifier];
  v37[3] = v3;
  v4 = [(id)*MEMORY[0x1E4F443D0] identifier];
  v37[4] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:5];
  v6 = (void *)[v5 mutableCopy];

  CFArrayRef v7 = CGImageSourceCopyTypeIdentifiers();
  v8 = (void *)[(__CFArray *)v7 mutableCopy];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v31;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v9);
        }
        [v8 removeObject:*(void *)(*((void *)&v30 + 1) + 8 * v13++)];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v11);
  }

  [v9 addObjectsFromArray:v8];
  v35 = @"com.apple.uikit.image";
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  uint64_t v15 = [v14 arrayByAddingObjectsFromArray:v9];
  v16 = (void *)qword_1EB262120;
  qword_1EB262120 = v15;

  v17 = [MEMORY[0x1E4F1CA48] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v18 = v9;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = objc_msgSend(MEMORY[0x1E4F442D8], "_typeWithIdentifier:allowUndeclared:", *(void *)(*((void *)&v26 + 1) + 8 * v22), 1, (void)v26);
        [v17 addObject:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v20);
  }

  uint64_t v24 = [v17 copy];
  v25 = (void *)_MergedGlobals_1177;
  _MergedGlobals_1177 = v24;
}

@end