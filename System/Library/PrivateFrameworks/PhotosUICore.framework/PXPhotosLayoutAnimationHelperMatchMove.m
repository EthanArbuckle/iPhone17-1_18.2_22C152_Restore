@interface PXPhotosLayoutAnimationHelperMatchMove
- (BOOL)wantsAnimationWithSpriteTransfer;
- (BOOL)wantsFromSnapshot;
- (BOOL)wantsPresentationAdjustment;
- (BOOL)wantsToSnapshot;
- (double)animationDuration;
- (unsigned)highFrameRateReason;
- (void)_adjustAnimation:(id)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteIndexRange:(_PXGSpriteIndexRange)a7 appearing:(BOOL)a8;
- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteAppearingIntoRootIndexRange:(_PXGSpriteIndexRange)a7;
- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteDisappearingFromRootIndexRange:(_PXGSpriteIndexRange)a7;
- (void)animation:(id)a3 adjustPresentedGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 count:(unsigned int)a7;
- (void)animation:(id)a3 updateSpriteTransferMap:(unsigned int *)a4 forSpritesRemovedFromIndexes:(id)a5 presentedGeometries:(id *)a6 styles:(id *)a7 infos:(id *)a8 spritesInsertedToIndexes:(id)a9 targetGeometries:(id *)a10 styles:(id *)a11 infos:(id *)a12 rootLayout:(id)a13;
@end

@implementation PXPhotosLayoutAnimationHelperMatchMove

- (void)animation:(id)a3 adjustPresentedGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 count:(unsigned int)a7
{
  if (a7)
  {
    long long v7 = *(_OWORD *)off_1E5DAAF30;
    uint64_t v8 = a7;
    p_var2 = &a5->var2;
    do
    {
      *(_OWORD *)p_var2 = v7;
      p_var2 += 40;
      --v8;
    }
    while (v8);
  }
}

- (void)_adjustAnimation:(id)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteIndexRange:(_PXGSpriteIndexRange)a7 appearing:(BOOL)a8
{
  id v13 = a3;
  v14 = v13;
  if (a8)
  {
    v15 = [v13 fromSnapshot];
    [v14 toSnapshot];
  }
  else
  {
    v15 = [v13 toSnapshot];
    [v14 fromSnapshot];
  v16 = };

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __113__PXPhotosLayoutAnimationHelperMatchMove__adjustAnimation_geometries_styles_infos_forSpriteIndexRange_appearing___block_invoke;
  v19[3] = &unk_1E5DCC090;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  id v20 = v16;
  id v21 = v15;
  id v17 = v15;
  id v18 = v16;
  [v18 enumerateObjectIdentifiersForInfos:a6 count:HIDWORD(*(unint64_t *)&a7) usingBlock:v19];
}

void __113__PXPhotosLayoutAnimationHelperMatchMove__adjustAnimation_geometries_styles_infos_forSpriteIndexRange_appearing___block_invoke(uint64_t a1, void *a2, char a3, unsigned int a4)
{
  id v7 = a2;
  unsigned int v8 = a4;
  uint64_t v9 = *(void *)(a1 + 48) + 32 * a4;
  [*(id *)(a1 + 32) visibleRect];
  float32x2_t v10 = *(float32x2_t *)(v9 + 24);
  float32x2_t v11 = vmul_f32(v10, (float32x2_t)0x3F0000003F000000);
  v22.origin.x = *(double *)v9 - v11.f32[0];
  v22.origin.y = *(double *)(v9 + 8) - v11.f32[1];
  v22.size.width = v10.f32[0];
  v22.size.height = v10.f32[1];
  if (CGRectIntersectsRect(v21, v22))
  {
    uint64_t v12 = *(void *)(a1 + 56) + 160 * v8;
    uint64_t v13 = *(void *)(a1 + 64) + 40 * v8;
    v14 = *(void **)(a1 + 40);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __113__PXPhotosLayoutAnimationHelperMatchMove__adjustAnimation_geometries_styles_infos_forSpriteIndexRange_appearing___block_invoke_2;
    v15[3] = &unk_1E5DCC068;
    uint64_t v17 = v13;
    char v20 = a3;
    id v16 = v14;
    uint64_t v18 = v9;
    uint64_t v19 = v12;
    [v16 enumerateSpritesWithObjectIdentifier:v7 usingBlock:v15];
  }
}

__n128 __113__PXPhotosLayoutAnimationHelperMatchMove__adjustAnimation_geometries_styles_infos_forSpriteIndexRange_appearing___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, int a4, unsigned char *a5)
{
  if (*(unsigned __int8 *)(a3[3] + 1) == *(unsigned __int8 *)(*(void *)(a1 + 40) + 1)
    && *(unsigned __int8 *)(a1 + 64) == a4)
  {
    [*(id *)(a1 + 32) visibleRect];
    uint64_t v8 = a3[1];
    float32x2_t v9 = *(float32x2_t *)(v8 + 24);
    float32x2_t v10 = vmul_f32(v9, (float32x2_t)0x3F0000003F000000);
    v15.origin.x = *(double *)v8 - v10.f32[0];
    v15.origin.y = *(double *)(v8 + 8) - v10.f32[1];
    v15.size.width = v9.f32[0];
    v15.size.height = v9.f32[1];
    if (CGRectIntersectsRect(v14, v15))
    {
      uint64_t v12 = a3[1];
      uint64_t v13 = *(void *)(a1 + 48);
      *(_OWORD *)uint64_t v13 = *(_OWORD *)v12;
      *(void *)(v13 + 16) = *(void *)(v12 + 16);
      *(void *)(v13 + 24) = *(void *)(v12 + 24);
      *(_OWORD *)(*(void *)(a1 + 56) + 4) = *(_OWORD *)(a3[2] + 4);
      __n128 result = *(__n128 *)(a3[2] + 36);
      *(__n128 *)(*(void *)(a1 + 56) + 36) = result;
      *a5 = 1;
    }
  }
  return result;
}

- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteDisappearingFromRootIndexRange:(_PXGSpriteIndexRange)a7
{
  uint64_t length = a7.length;
  if (a7.length)
  {
    p_var2 = &a4->var0.var2;
    float32x2_t v9 = a5;
    do
    {
      v9->var0 = 0.0;
      float32x2_t v9 = ($225AF24142A77900D29617A74D173C5F *)((char *)v9 + 160);
      double *p_var2 = *p_var2 + 50.0;
      p_var2 += 4;
      --length;
    }
    while (length);
  }
  -[PXPhotosLayoutAnimationHelperMatchMove _adjustAnimation:geometries:styles:infos:forSpriteIndexRange:appearing:](self, "_adjustAnimation:geometries:styles:infos:forSpriteIndexRange:appearing:", a3, a4, a5, a6);
}

- (void)animation:(id)a3 adjustGeometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 forSpriteAppearingIntoRootIndexRange:(_PXGSpriteIndexRange)a7
{
  uint64_t length = a7.length;
  if (a7.length)
  {
    uint64_t v8 = a5;
    do
    {
      v8->var0 = 0.0;
      uint64_t v8 = ($225AF24142A77900D29617A74D173C5F *)((char *)v8 + 160);
      --length;
    }
    while (length);
  }
  -[PXPhotosLayoutAnimationHelperMatchMove _adjustAnimation:geometries:styles:infos:forSpriteIndexRange:appearing:](self, "_adjustAnimation:geometries:styles:infos:forSpriteIndexRange:appearing:", a3, a4, a5, a6);
}

- (void)animation:(id)a3 updateSpriteTransferMap:(unsigned int *)a4 forSpritesRemovedFromIndexes:(id)a5 presentedGeometries:(id *)a6 styles:(id *)a7 infos:(id *)a8 spritesInsertedToIndexes:(id)a9 targetGeometries:(id *)a10 styles:(id *)a11 infos:(id *)a12 rootLayout:(id)a13
{
  id v18 = a9;
  id v19 = a5;
  id v20 = a3;
  CGRect v21 = [v20 fromSnapshot];
  CGRect v22 = [v20 toSnapshot];

  v23 = (void *)[v18 mutableCopy];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __204__PXPhotosLayoutAnimationHelperMatchMove_animation_updateSpriteTransferMap_forSpritesRemovedFromIndexes_presentedGeometries_styles_infos_spritesInsertedToIndexes_targetGeometries_styles_infos_rootLayout___block_invoke;
  v27[3] = &unk_1E5DCC040;
  id v28 = v21;
  id v29 = v22;
  id v30 = v23;
  v31 = a6;
  v32 = a8;
  v33 = a4;
  id v24 = v23;
  id v25 = v22;
  id v26 = v21;
  [v26 enumerateObjectIdentifiersForSpriteIndexes:v19 infos:a8 usingBlock:v27];
}

void __204__PXPhotosLayoutAnimationHelperMatchMove_animation_updateSpriteTransferMap_forSpritesRemovedFromIndexes_presentedGeometries_styles_infos_spritesInsertedToIndexes_targetGeometries_styles_infos_rootLayout___block_invoke(uint64_t a1, uint64_t a2, void *a3, char a4, unsigned int a5)
{
  id v9 = a3;
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 56) + 32 * a5;
  [*(id *)(a1 + 32) visibleRect];
  float32x2_t v12 = *(float32x2_t *)(v11 + 24);
  float32x2_t v13 = vmul_f32(v12, (float32x2_t)0x3F0000003F000000);
  v25.origin.x = *(double *)v11 - v13.f32[0];
  v25.origin.y = *(double *)(v11 + 8) - v13.f32[1];
  v25.size.width = v12.f32[0];
  v25.size.height = v12.f32[1];
  if (CGRectIntersectsRect(v24, v25))
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __204__PXPhotosLayoutAnimationHelperMatchMove_animation_updateSpriteTransferMap_forSpritesRemovedFromIndexes_presentedGeometries_styles_infos_spritesInsertedToIndexes_targetGeometries_styles_infos_rootLayout___block_invoke_2;
    v17[3] = &unk_1E5DCC018;
    uint64_t v20 = v10 + 40 * a5;
    char v23 = a4;
    CGRect v14 = *(void **)(a1 + 40);
    id v18 = *(id *)(a1 + 48);
    id v15 = *(id *)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 72);
    id v19 = v15;
    uint64_t v21 = v16;
    uint64_t v22 = a2;
    [v14 enumerateSpritesWithObjectIdentifier:v9 usingBlock:v17];
  }
}

void __204__PXPhotosLayoutAnimationHelperMatchMove_animation_updateSpriteTransferMap_forSpritesRemovedFromIndexes_presentedGeometries_styles_infos_spritesInsertedToIndexes_targetGeometries_styles_infos_rootLayout___block_invoke_2()
{
}

- (unsigned)highFrameRateReason
{
  return 2228229;
}

- (BOOL)wantsPresentationAdjustment
{
  return 1;
}

- (BOOL)wantsAnimationWithSpriteTransfer
{
  return 1;
}

- (BOOL)wantsToSnapshot
{
  return 1;
}

- (BOOL)wantsFromSnapshot
{
  return 1;
}

- (double)animationDuration
{
  v2 = +[PXPhotosGridSettings sharedInstance];
  [v2 matchMoveAnimationDuration];
  double v4 = v3;

  return v4;
}

@end