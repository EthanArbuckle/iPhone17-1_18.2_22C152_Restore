@interface UICollectionViewSubviewManager
@end

@implementation UICollectionViewSubviewManager

uint64_t __50___UICollectionViewSubviewManager_hasVisibleCells__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *a4 = 1;
  return result;
}

void __67___UICollectionViewSubviewManager_allVisibleViewsSubviewCollection__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

uint64_t __79___UICollectionViewSubviewManager_enumerateAllViewsInReuseQueueWithEnumerator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79___UICollectionViewSubviewManager_enumerateAllViewsInReuseQueueWithEnumerator___block_invoke_2;
  v5[3] = &unk_1E5302098;
  v5[4] = *(void *)(a1 + 32);
  v5[5] = a4;
  return [a3 enumerateKeysAndObjectsUsingBlock:v5];
}

void __79___UICollectionViewSubviewManager_enumerateAllViewsInReuseQueueWithEnumerator___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned __int8 *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v13 != v9) {
        objc_enumerationMutation(v6);
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
      int v11 = *a4;
      **(unsigned char **)(a1 + 40) = v11;
      if (v11) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

@end