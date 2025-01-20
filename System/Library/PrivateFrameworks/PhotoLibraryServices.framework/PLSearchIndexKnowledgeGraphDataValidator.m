@interface PLSearchIndexKnowledgeGraphDataValidator
+ (BOOL)isGraphDataValid:(id)a3;
@end

@implementation PLSearchIndexKnowledgeGraphDataValidator

+ (BOOL)isGraphDataValid:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__PLSearchIndexKnowledgeGraphDataValidator_isGraphDataValid___block_invoke;
  v6[3] = &unk_1E5863140;
  v6[4] = &v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __61__PLSearchIndexKnowledgeGraphDataValidator_isGraphDataValid___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v6 = [a3 objectForKeyedSubscript:&unk_1EEBED230];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        if ((unint64_t)[*(id *)(*((void *)&v11 + 1) + 8 * v10) count] <= 1)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
          *a4 = 1;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

@end