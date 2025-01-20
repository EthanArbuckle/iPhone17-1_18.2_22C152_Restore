@interface VideosExtrasShelfCollectionViewLayout
@end

@implementation VideosExtrasShelfCollectionViewLayout

uint64_t __57___VideosExtrasShelfCollectionViewLayout__calculateSizes__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  if (*(unsigned char *)(result + 96)) {
    result = [*(id *)(result + 32) collectionView:*(void *)(result + 40) layout:*(void *)(result + 48) insetForSectionAtIndex:a2];
  }
  else {
    uint64_t v3 = *(void *)(result + 72);
  }
  *(void *)(*(void *)(*(void *)(v2 + 56) + 8) + 32) = v3;
  return result;
}

void __57___VideosExtrasShelfCollectionViewLayout__calculateSizes__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v14 = v3;
  if (*(unsigned char *)(a1 + 104))
  {
    [*(id *)(a1 + 32) collectionView:*(void *)(a1 + 40) layout:*(void *)(a1 + 48) sizeForItemAtIndexPath:v3];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v5 = *(double *)(a1 + 80);
    double v7 = *(double *)(a1 + 88);
  }
  v8 = *(void **)(a1 + 56);
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  double v10 = *(double *)(v9 + 32);
  double v11 = *(double *)(v9 + 40);
  v12 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v10, v11, v5, v7);
  [v8 setObject:v12 forKey:v14];

  v16.origin.x = v10;
  v16.origin.y = v11;
  v16.size.width = v5;
  v16.size.height = v7;
  *(CGRect *)(*(void *)(*(void *)(a1 + 72) + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 72) + 8)+ 32), v16);
  if (*(unsigned char *)(a1 + 105)) {
    objc_msgSend(*(id *)(a1 + 32), "collectionView:layout:minimumInteritemSpacingForSectionAtIndex:", *(void *)(a1 + 40), *(void *)(a1 + 48), objc_msgSend(v14, "section"));
  }
  else {
    double v13 = *(double *)(a1 + 96);
  }
  *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 32) = v5
                                                              + v13
                                                              + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                          + 32);
}

@end