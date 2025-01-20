@interface WTTextEffectView
@end

@implementation WTTextEffectView

void __53___WTTextEffectView__handleAddEffect_forAsyncSource___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 updateEffectWith:v4];
  [*(id *)(a1 + 40) _cacheHeightOfPreviews:v4 forEffect:*(void *)(a1 + 32)];

  if ([*(id *)(a1 + 40) _shouldApplyRemainderEffectForEffect:*(void *)(a1 + 32)])
  {
    v5 = [_WTReplaceRemainderTextEffect alloc];
    v6 = [*(id *)(a1 + 32) chunk];
    v7 = [(_WTReplaceTextEffect *)v5 initWithChunk:v6 effectView:*(void *)(a1 + 40)];

    v8 = [MEMORY[0x263F08C38] UUID];
    v9 = [*(id *)(a1 + 40) textEffects];
    [v9 setObject:v7 forKey:v8];

    [(_WTTextEffect *)v7 setIdentifier:v8];
    [*(id *)(a1 + 40) replaceSourceDuration];
    double v11 = v10;
    [*(id *)(a1 + 40) replaceDestinationDuration];
    if (v11 >= v12) {
      double v12 = v11;
    }
    [(_WTReplaceRemainderTextEffect *)v7 setDurationOverride:v12];
    v13 = [*(id *)(a1 + 40) replaceSourceRect];
    [v13 platformCGRectValue];
    double v15 = v14;

    v16 = [*(id *)(a1 + 40) replaceDestinationRect];
    [v16 platformCGRectValue];
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    double v24 = v23;

    [(_WTReplaceRemainderTextEffect *)v7 setOffset:v24 - v15];
    v45.origin.x = v18;
    v45.origin.y = v20;
    v45.size.width = v22;
    v45.size.height = v24;
    CGFloat MaxY = CGRectGetMaxY(v45);
    *(CGFloat *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = MaxY
                                                                 + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                             + 40);
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 56) = *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                            + 56)
                                                                - MaxY;
    double v26 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 56);
    [*(id *)(a1 + 40) platformGetVisibleRect];
    if (v26 >= v27) {
      double v28 = v27;
    }
    else {
      double v28 = v26;
    }
    *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 56) = v28;
    [*(id *)(a1 + 40) setReplaceSourceRect:0];
    [*(id *)(a1 + 40) setReplaceSourceDuration:0.0];
    [*(id *)(a1 + 40) setReplaceDestinationRect:0];
    [*(id *)(a1 + 40) setReplaceDestinationDuration:0.0];
    v29 = *(void **)(a1 + 48);
    v30 = *(double **)(*(void *)(a1 + 56) + 8);
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __53___WTTextEffectView__handleAddEffect_forAsyncSource___block_invoke_2;
    v42[3] = &unk_26558E870;
    v43 = v7;
    id v44 = v29;
    double v31 = v30[4];
    double v32 = v30[5];
    double v33 = v30[6];
    double v34 = v30[7];
    v35 = v7;
    objc_msgSend(v29, "textPreviewForRect:completion:", v42, v31, v32, v33, v34);
  }
  if ([*(id *)(a1 + 32) hidesOriginal])
  {
    v36 = *(void **)(a1 + 48);
    v37 = [*(id *)(a1 + 32) chunk];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __53___WTTextEffectView__handleAddEffect_forAsyncSource___block_invoke_4;
    v40[3] = &unk_26558E530;
    v41 = (void (**)(void))*(id *)(a1 + 32);
    [v36 updateIsTextVisible:0 forChunk:v37 completion:v40];

    v38 = v41;
  }
  else
  {
    v39 = [*(id *)(a1 + 32) preCompletion];

    if (!v39) {
      return;
    }
    v38 = [*(id *)(a1 + 32) preCompletion];
    v38[2]();
  }
}

void __53___WTTextEffectView__handleAddEffect_forAsyncSource___block_invoke_2(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    v13[0] = v3;
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    [v5 updateEffectWith:v6];

    if ([*(id *)(a1 + 32) hidesOriginal])
    {
      v7 = *(void **)(a1 + 40);
      v8 = [*(id *)(a1 + 32) chunk];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __53___WTTextEffectView__handleAddEffect_forAsyncSource___block_invoke_3;
      v11[3] = &unk_26558E530;
      double v12 = (void (**)(void))*(id *)(a1 + 32);
      [v7 updateIsTextVisible:0 forChunk:v8 completion:v11];

      v9 = v12;
LABEL_6:

      goto LABEL_7;
    }
    double v10 = [*(id *)(a1 + 32) preCompletion];

    if (v10)
    {
      v9 = [*(id *)(a1 + 32) preCompletion];
      v9[2]();
      goto LABEL_6;
    }
  }
LABEL_7:
}

void __53___WTTextEffectView__handleAddEffect_forAsyncSource___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) preCompletion];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) preCompletion];
    v3[2]();
  }
}

void __53___WTTextEffectView__handleAddEffect_forAsyncSource___block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) preCompletion];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) preCompletion];
    v3[2]();
  }
}

void __43___WTTextEffectView_removeEffect_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate:*(unsigned __int8 *)(a1 + 56)];
  id v2 = [*(id *)(a1 + 40) textEffects];
  [v2 removeObjectForKey:*(void *)(a1 + 48)];
}

void __45___WTTextEffectView_updateSnapshotForEffect___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) updateEffectWith:a2];
  if ([*(id *)(a1 + 32) hidesOriginal])
  {
    id v4 = [*(id *)(a1 + 40) asyncSource];
    id v3 = [*(id *)(a1 + 32) chunk];
    [v4 updateIsTextVisible:0 forChunk:v3 completion:0];
  }
}

@end