@interface PXCuratedLibraryLayoutAssetsSnapshot
@end

@implementation PXCuratedLibraryLayoutAssetsSnapshot

void __64___PXCuratedLibraryLayoutAssetsSnapshot_dominantAssetIdentifier__block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v12 = a2;
  uint64_t v8 = [a3 integerValue];
  uint64_t v9 = v8;
  if (v8 < 0 || (uint64_t v10 = a1[4], v8 >= *(void *)(v10 + 24)))
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a1[6], a1[4], @"PXCuratedLibraryLayoutZoomLevelChangeToOrFromAllPhotosAnimationHelper.m", 482, @"Invalid parameter not satisfying: %@", @"index >= 0 && index < _spriteSnapshotsCount" object file lineNumber description];

    uint64_t v10 = a1[4];
  }
  if (*(unsigned char *)(*(void *)(v10 + 40) + 56 * v9 + 52))
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
    *a4 = 1;
  }
}

uint64_t __77___PXCuratedLibraryLayoutAssetsSnapshot_enumerateAssetIdentifiersUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56___PXCuratedLibraryLayoutAssetsSnapshot_initWithLayout___block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = a2 | 0x100000000;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56___PXCuratedLibraryLayoutAssetsSnapshot_initWithLayout___block_invoke_2;
  v10[3] = &unk_1E5DBFEA8;
  v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v11 = v8;
  uint64_t v12 = v9;
  [v7 enumerateSpritesInRange:v6 usingBlock:v10];
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    *a4 = 1;
  }
}

void __56___PXCuratedLibraryLayoutAssetsSnapshot_initWithLayout___block_invoke_4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56___PXCuratedLibraryLayoutAssetsSnapshot_initWithLayout___block_invoke_5;
  v13[3] = &unk_1E5DBFEF8;
  id v11 = *(void **)(a1 + 32);
  uint64_t v10 = *(void **)(a1 + 40);
  unint64_t v12 = HIDWORD(a2);
  uint64_t v16 = *(void *)(a1 + 48);
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  id v14 = v10;
  id v15 = *(id *)(a1 + 32);
  [v11 enumerateAssetInfoForGeometries:a4 styles:a5 infos:a6 count:v12 options:0 usingBlock:v13];
}

void __56___PXCuratedLibraryLayoutAssetsSnapshot_initWithLayout___block_invoke_5(uint64_t a1, void *a2)
{
}

uint64_t __56___PXCuratedLibraryLayoutAssetsSnapshot_initWithLayout___block_invoke_2(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned char *a9)
{
  uint64_t v10 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56___PXCuratedLibraryLayoutAssetsSnapshot_initWithLayout___block_invoke_3;
  v12[3] = &unk_1E5DBFE80;
  v12[4] = *(void *)(a1 + 40);
  uint64_t result = [v10 enumerateAssetInfoForGeometries:a4 styles:a5 infos:a6 count:HIDWORD(a2) options:0 usingBlock:v12];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a9 = 1;
  }
  return result;
}

void __56___PXCuratedLibraryLayoutAssetsSnapshot_initWithLayout___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 1;
}

@end