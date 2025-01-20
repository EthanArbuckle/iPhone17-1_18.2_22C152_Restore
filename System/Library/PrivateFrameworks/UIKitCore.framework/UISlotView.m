@interface UISlotView
@end

@implementation UISlotView

id __19___UISlotView_init__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

id __35___UISlotView__setContentDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained _contentDelegate];
  v6 = [v5 currentTagForSlotView:WeakRetained];
  v7 = [v6 resolvedStyleForStyle:v3];
  v8 = v7;
  if (!v7) {
    v7 = v3;
  }
  id v9 = v7;

  return v9;
}

void __35___UISlotView__setContentDelegate___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  v8 = a4;
  id v9 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = [WeakRetained _contentDelegate];
  v12 = [v11 currentTagForSlotView:WeakRetained];
  if ([v11 slotView:WeakRetained shouldSetInitialContentForStyle:v7 tag:v12])
  {
    v13 = [v11 slotView:WeakRetained initialContentForStyle:v7 tag:v12];
    if (v13) {
      uint64_t v14 = v8[2](v8, v13);
    }
    else {
      uint64_t v14 = 0;
    }
    [v11 slotView:WeakRetained didSetInitialContent:v14 forStyle:v7 tag:v12];
  }
  if ([v11 slotView:WeakRetained shouldSetFinalContentForStyle:v7 tag:v12])
  {
    v15 = [v11 slotMachineForFinalContentInSlotView:WeakRetained];
    if ([v11 shouldGetFinalContentSynchronouslyInSlotView:WeakRetained])
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __35___UISlotView__setContentDelegate___block_invoke_3;
      v23[3] = &unk_1E5309818;
      objc_copyWeak(&v27, v9);
      id v24 = v7;
      id v25 = v12;
      v26 = v8;
      [v15 getRemoteContentForLayerContextWithId:a2 style:v24 tag:v25 reply:v23];

      objc_destroyWeak(&v27);
    }
    else
    {
      v16 = dispatch_get_global_queue(33, 0);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __35___UISlotView__setContentDelegate___block_invoke_4;
      v17[3] = &unk_1E5309868;
      id v18 = v15;
      v22[1] = a2;
      id v19 = v7;
      id v20 = v12;
      objc_copyWeak(v22, v9);
      v21 = v8;
      dispatch_async(v16, v17);

      objc_destroyWeak(v22);
    }
  }
}

void __35___UISlotView__setContentDelegate___block_invoke_3(void *a1, void *a2)
{
  id v3 = (id *)(a1 + 7);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  v5 = [WeakRetained _contentDelegate];
  v6 = [v5 slotView:WeakRetained replacementForFinalContent:v4 style:a1[4] tag:a1[5]];

  if (v6) {
    uint64_t v7 = (*(uint64_t (**)(void))(a1[6] + 16))();
  }
  else {
    uint64_t v7 = 0;
  }
  [v5 slotView:WeakRetained didSetFinalContent:v7 forStyle:a1[4] tag:a1[5]];
}

void __35___UISlotView__setContentDelegate___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35___UISlotView__setContentDelegate___block_invoke_5;
  v6[3] = &unk_1E5309818;
  objc_copyWeak(&v10, (id *)(a1 + 64));
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  [v3 getRemoteContentForLayerContextWithId:v2 style:v4 tag:v5 reply:v6];

  objc_destroyWeak(&v10);
}

void __35___UISlotView__setContentDelegate___block_invoke_5(id *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35___UISlotView__setContentDelegate___block_invoke_6;
  block[3] = &unk_1E5309840;
  objc_copyWeak(&v10, a1 + 7);
  id v6 = v3;
  id v7 = a1[4];
  id v8 = a1[5];
  id v9 = a1[6];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v10);
}

void __35___UISlotView__setContentDelegate___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v2 = [WeakRetained _contentDelegate];
  id v3 = [v2 slotView:WeakRetained replacementForFinalContent:*(void *)(a1 + 32) style:*(void *)(a1 + 40) tag:*(void *)(a1 + 48)];
  if (v3) {
    uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else {
    uint64_t v4 = 0;
  }
  [v2 slotView:WeakRetained didSetFinalContent:v4 forStyle:*(void *)(a1 + 40) tag:*(void *)(a1 + 48)];
}

void __25___UISlotView__slotStyle__block_invoke(void *a1, void *a2)
{
  id v7 = a2;
  if (*(void *)(*(void *)(a1[4] + 8) + 24) == -1) {
    *(void *)(*(void *)(a1[4] + 8) + 24) = [v7 accessibilityContrast];
  }
  if (*(void *)(*(void *)(a1[5] + 8) + 24) == -1) {
    *(void *)(*(void *)(a1[5] + 8) + 24) = [v7 displayGamut];
  }
  if (*(double *)(*(void *)(a1[6] + 8) + 24) == 0.0)
  {
    [v7 displayScale];
    *(void *)(*(void *)(a1[6] + 8) + 24) = v3;
  }
  if (*(void *)(*(void *)(a1[7] + 8) + 24) == -1) {
    *(void *)(*(void *)(a1[7] + 8) + 24) = [v7 layoutDirection];
  }
  if (*(void *)(*(void *)(a1[8] + 8) + 24) == -1) {
    *(void *)(*(void *)(a1[8] + 8) + 24) = [v7 legibilityWeight];
  }
  if (*(__CFString **)(*(void *)(a1[9] + 8) + 40) == @"_UICTContentSizeCategoryUnspecified")
  {
    uint64_t v4 = [v7 preferredContentSizeCategory];
    uint64_t v5 = *(void *)(a1[9] + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  if (*(void *)(*(void *)(a1[10] + 8) + 24) == -1) {
    *(void *)(*(void *)(a1[10] + 8) + 24) = [v7 userInterfaceIdiom];
  }
  if (!*(void *)(*(void *)(a1[11] + 8) + 24)) {
    *(void *)(*(void *)(a1[11] + 8) + 24) = [v7 userInterfaceStyle];
  }
}

BOOL __25___UISlotView__slotStyle__block_invoke_2(void *a1)
{
  return *(void *)(*(void *)(a1[4] + 8) + 24) == -1
      || *(void *)(*(void *)(a1[5] + 8) + 24) == -1
      || *(double *)(*(void *)(a1[6] + 8) + 24) == 0.0
      || *(void *)(*(void *)(a1[7] + 8) + 24) == -1
      || *(void *)(*(void *)(a1[8] + 8) + 24) == -1
      || *(__CFString **)(*(void *)(a1[9] + 8) + 40) == @"_UICTContentSizeCategoryUnspecified"
      || *(void *)(*(void *)(a1[10] + 8) + 24) == -1
      || *(void *)(*(void *)(a1[11] + 8) + 24) == 0;
}

void __34___UISlotView__sharedLayerContext__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB3488] newLayerContext];
  v1 = (void *)qword_1EB25CA88;
  qword_1EB25CA88 = v0;
}

uint64_t __29___UISlotView__updateContent__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = v5;
  id v9 = v8;
  if (WeakRetained && *((void *)WeakRetained + 59) == v7)
  {
    [v8 contentSize];
    if (*((double *)WeakRetained + 56) != v10 || *((double *)WeakRetained + 57) != v11)
    {
      *((double *)WeakRetained + 56) = v10;
      *((double *)WeakRetained + 57) = v11;
      [WeakRetained invalidateIntrinsicContentSize];
    }
    if ((objc_opt_respondsToSelector() & 1) == 0 || [v9 shouldReplaceExistingContent])
    {
      v13 = (void *)*((void *)WeakRetained + 58);
      uint64_t v14 = +[_UISlotView _sharedLayerContext]();
      [v13 deleteFromLayerContext:v14];

      objc_storeStrong((id *)WeakRetained + 58, a2);
      v15 = [WeakRetained layer];
      [v15 setNeedsDisplay];
    }
    uint64_t v16 = 1;
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

@end