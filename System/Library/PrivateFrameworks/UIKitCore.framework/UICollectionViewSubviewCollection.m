@interface UICollectionViewSubviewCollection
@end

@implementation UICollectionViewSubviewCollection

uint64_t __67___UICollectionViewSubviewCollection_enumerateCellsWithEnumerator___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __43___UICollectionViewSubviewCollection_cells__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

uint64_t __56___UICollectionViewSubviewCollection_indexPathsForCells__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __77___UICollectionViewSubviewCollection_enumerateSupplementariesWithEnumerator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77___UICollectionViewSubviewCollection_enumerateSupplementariesWithEnumerator___block_invoke_2;
  v6[3] = &unk_1E52EB038;
  uint64_t v4 = *(void *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v4;
  v6[6] = a4;
  return [a3 enumerateKeysAndObjectsUsingBlock:v6];
}

uint64_t __73___UICollectionViewSubviewCollection_enumerateDecorationsWithEnumerator___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73___UICollectionViewSubviewCollection_enumerateDecorationsWithEnumerator___block_invoke_2;
  v6[3] = &unk_1E52EB038;
  uint64_t v4 = *(void *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v4;
  v6[6] = a4;
  return [a3 enumerateKeysAndObjectsUsingBlock:v6];
}

uint64_t __61___UICollectionViewSubviewCollection_updateCellsUsingFilter___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result)
  {
    v7 = *(void **)(a1 + 32);
    return [v7 setObject:a3 forKeyedSubscript:a2];
  }
  return result;
}

uint64_t __77___UICollectionViewSubviewCollection_enumerateSupplementariesWithEnumerator___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  **(unsigned char **)(a1 + 48) = *a4;
  return result;
}

uint64_t __70___UICollectionViewSubviewCollection_enumerateAllViewsWithEnumerator___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *a5;
  return result;
}

uint64_t __73___UICollectionViewSubviewCollection_enumerateAuxillariesWithEnumerator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *a5;
  return result;
}

void __71___UICollectionViewSubviewCollection_updateSupplementariesUsingFilter___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:a3];
    if (!v8)
    {
      id v9 = (id)objc_opt_new();
      [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:a3];
      v8 = v9;
    }
    id v10 = v8;
    [v8 setObject:a4 forKeyedSubscript:a2];
  }
}

uint64_t __73___UICollectionViewSubviewCollection_enumerateDecorationsWithEnumerator___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  **(unsigned char **)(a1 + 48) = *a4;
  return result;
}

uint64_t __70___UICollectionViewSubviewCollection_enumerateAllViewsWithEnumerator___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *a5;
  return result;
}

uint64_t __73___UICollectionViewSubviewCollection_enumerateAuxillariesWithEnumerator___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67___UICollectionViewSubviewCollection_updateDecorationsUsingFilter___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:a3];
    if (!v8)
    {
      id v9 = (id)objc_opt_new();
      [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:a3];
      v8 = v9;
    }
    id v10 = v8;
    [v8 setObject:a4 forKeyedSubscript:a2];
  }
}

uint64_t __70___UICollectionViewSubviewCollection_enumerateAllViewsWithEnumerator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *a4;
  return result;
}

uint64_t __51___UICollectionViewSubviewCollection_containsView___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  if (*(void *)(result + 32) == a5)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *a6 = 1;
  }
  return result;
}

uint64_t __46___UICollectionViewSubviewCollection_allViews__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) addObject:a5];
}

uint64_t __55___UICollectionViewSubviewCollection_allViewsHashTable__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) addObject:a5];
}

uint64_t __87___UICollectionViewSubviewCollection_enumerateSupplementariesOfElementKind_enumerator___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __83___UICollectionViewSubviewCollection_enumerateDecorationsOfElementKind_enumerator___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end