@interface UIEditMenuListViewCell
@end

@implementation UIEditMenuListViewCell

uint64_t __41___UIEditMenuListViewCell__setupSlotView__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) resolvedStyleForStyle:a2];
}

void __41___UIEditMenuListViewCell__setupSlotView__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v9 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41___UIEditMenuListViewCell__setupSlotView__block_invoke_3;
  block[3] = &unk_1E52FBD90;
  v16[1] = a2;
  id v13 = v7;
  id v14 = *(id *)(a1 + 32);
  id v10 = v7;
  objc_copyWeak(v16, (id *)(a1 + 40));
  id v15 = v8;
  id v11 = v8;
  dispatch_async(v9, block);

  objc_destroyWeak(v16);
}

void __41___UIEditMenuListViewCell__setupSlotView__block_invoke_3(uint64_t a1)
{
  v2 = +[_UIConcretePasteboard _remoteContentForLayerContextWithId:*(void *)(a1 + 64) slotStyle:*(void *)(a1 + 32) pasteButtonTag:*(void *)(a1 + 40)];
  if (v2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41___UIEditMenuListViewCell__setupSlotView__block_invoke_4;
    block[3] = &unk_1E52DF578;
    objc_copyWeak(&v6, (id *)(a1 + 56));
    id v5 = *(id *)(a1 + 48);
    id v4 = v2;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v6);
  }
}

void __41___UIEditMenuListViewCell__setupSlotView__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained _wantsPasteSlotView]
    && (*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    [WeakRetained _hideContents];
  }
}

@end