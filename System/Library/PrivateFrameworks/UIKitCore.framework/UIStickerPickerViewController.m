@interface UIStickerPickerViewController
@end

@implementation UIStickerPickerViewController

void __42___UIStickerPickerViewController_loadView__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v9 = _stickersLog();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (isKindOfClass)
    {
      if (v10)
      {
        int v12 = 138412290;
        id v13 = v5;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "Loaded remote view controller %@", (uint8_t *)&v12, 0xCu);
      }

      [WeakRetained _remoteViewDidLoad:v5];
    }
    else
    {
      if (v10)
      {
        int v12 = 138412290;
        id v13 = v6;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "Unable to load remote view controller: %@", (uint8_t *)&v12, 0xCu);
      }

      [*(id *)(a1 + 32) dismissCard];
    }
    v11 = [*(id *)(a1 + 32) _viewServiceProxy];
    [v11 prepareForAddStickerFromSubjectLift];
  }
}

uint64_t __103___UIStickerPickerViewController_addStickerWithRepresentations_previewView_originatingView_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __103___UIStickerPickerViewController_addStickerWithRepresentations_previewView_originatingView_completion___block_invoke_48(uint64_t a1, void *a2, void *a3, double a4, double a5, double a6, double a7)
{
  id v13 = a2;
  id v14 = a3;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __103___UIStickerPickerViewController_addStickerWithRepresentations_previewView_originatingView_completion___block_invoke_2;
  v20[3] = &unk_1E5307E28;
  uint64_t v15 = *(void *)(a1 + 32);
  v16 = *(void **)(a1 + 40);
  id v21 = v14;
  uint64_t v22 = v15;
  double v27 = a4;
  double v28 = a5;
  double v29 = a6;
  double v30 = a7;
  id v23 = v16;
  id v24 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  id v25 = v13;
  id v26 = v17;
  id v18 = v13;
  id v19 = v14;
  dispatch_async(MEMORY[0x1E4F14428], v20);
}

uint64_t __103___UIStickerPickerViewController_addStickerWithRepresentations_previewView_originatingView_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = _stickersLog();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v7 = *(void **)(a1 + 32);
      int v8 = 138412290;
      v9 = v7;
      _os_log_error_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "Unexpected error adding stickers to store: %@", (uint8_t *)&v8, 0xCu);
    }

    [*(id *)(a1 + 40) dismissCard];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = NSStringFromCGRect(*(CGRect *)(a1 + 80));
      int v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "Got a successful add to sticker store with target sticker bounds %@", (uint8_t *)&v8, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 40), "_addStickerWithRepresentations:previewView:animatingTo:", *(void *)(a1 + 48), *(void *)(a1 + 56), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  }
  uint64_t result = *(void *)(a1 + 72);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(a1 + 64), *(void *)(a1 + 32));
  }
  return result;
}

void __103___UIStickerPickerViewController_addStickerWithRepresentations_previewView_originatingView_completion___block_invoke_50(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11 = a2;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __103___UIStickerPickerViewController_addStickerWithRepresentations_previewView_originatingView_completion___block_invoke_2_51;
  v15[3] = &unk_1E5307E78;
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(a1 + 40);
  id v16 = v11;
  uint64_t v17 = v12;
  double v20 = a3;
  double v21 = a4;
  double v22 = a5;
  double v23 = a6;
  id v18 = v13;
  id v19 = *(id *)(a1 + 48);
  id v14 = v11;
  dispatch_async(MEMORY[0x1E4F14428], v15);
}

uint64_t __103___UIStickerPickerViewController_addStickerWithRepresentations_previewView_originatingView_completion___block_invoke_2_51(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = _stickersLog();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v7 = *(void **)(a1 + 32);
      int v8 = 138412290;
      v9 = v7;
      _os_log_error_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "Unexpected error adding stickers to store: %@", (uint8_t *)&v8, 0xCu);
    }

    return [*(id *)(a1 + 40) dismissCard];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = NSStringFromCGRect(*(CGRect *)(a1 + 64));
      int v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "Got a successful add to sticker store with target sticker bounds %@", (uint8_t *)&v8, 0xCu);
    }
    return objc_msgSend(*(id *)(a1 + 40), "_addStickerWithRepresentations:previewView:animatingTo:", *(void *)(a1 + 48), *(void *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  }
}

void __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke(uint64_t a1)
{
  CAFrameRateRange v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v10.minimum;
  float maximum = v10.maximum;
  float preferred = v10.preferred;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_2;
  v7[3] = &unk_1E52DD178;
  id v8 = *(id *)(a1 + 32);
  long long v9 = *(_OWORD *)(a1 + 40);
  *(float *)&double v5 = maximum;
  *(float *)&double v6 = preferred;
  +[UIView sticker_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "sticker_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048626, v7, COERCE_DOUBLE(__PAIR64__(DWORD1(v9), LODWORD(minimum))), v5, v6);
}

uint64_t __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_3(uint64_t a1)
{
}

void __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_4(uint64_t a1)
{
  CAFrameRateRange v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v13.minimum;
  float maximum = v13.maximum;
  float preferred = v13.preferred;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_5;
  v8[3] = &unk_1E52E7948;
  id v9 = *(id *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 56);
  long long v10 = *(_OWORD *)(a1 + 40);
  long long v11 = v5;
  long long v12 = *(_OWORD *)(a1 + 72);
  *(float *)&double v6 = maximum;
  *(float *)&double v7 = preferred;
  +[UIView sticker_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "sticker_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048626, v8, COERCE_DOUBLE(__PAIR64__(DWORD1(v12), LODWORD(minimum))), v6, v7);
}

uint64_t __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_5(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

void __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_6(uint64_t a1)
{
}

void __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_7(uint64_t a1)
{
  CAFrameRateRange v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v13.minimum;
  float maximum = v13.maximum;
  float preferred = v13.preferred;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_8;
  v8[3] = &unk_1E52E7948;
  id v9 = *(id *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 56);
  long long v10 = *(_OWORD *)(a1 + 40);
  long long v11 = v5;
  long long v12 = *(_OWORD *)(a1 + 72);
  *(float *)&double v6 = maximum;
  *(float *)&double v7 = preferred;
  +[UIView sticker_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "sticker_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048626, v8, COERCE_DOUBLE(__PAIR64__(DWORD1(v12), LODWORD(minimum))), v6, v7);
}

uint64_t __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_8(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

void __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_9(uint64_t a1)
{
}

void __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_10(uint64_t a1)
{
  CAFrameRateRange v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v13.minimum;
  float maximum = v13.maximum;
  float preferred = v13.preferred;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_11;
  v8[3] = &unk_1E52E7948;
  id v9 = *(id *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 56);
  long long v10 = *(_OWORD *)(a1 + 40);
  long long v11 = v5;
  long long v12 = *(_OWORD *)(a1 + 72);
  *(float *)&double v6 = maximum;
  *(float *)&double v7 = preferred;
  +[UIView sticker_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "sticker_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048626, v8, COERCE_DOUBLE(__PAIR64__(DWORD1(v12), LODWORD(minimum))), v6, v7);
}

uint64_t __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_11(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

void __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_12(uint64_t a1)
{
}

void __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_13(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) _viewServiceProxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_14;
  v5[3] = &unk_1E52D9F98;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 addStickerAnimationDidFinishWithCompletion:v5];
}

void __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_14(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_15;
  _OWORD v4[3] = &unk_1E52D9F98;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

void __89___UIStickerPickerViewController__addStickerWithRepresentations_previewView_animatingTo___block_invoke_15(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  id v2 = [*(id *)(a1 + 40) _viewServiceProxy];
  [v2 didRemoveStickerPreview];
}

uint64_t __65___UIStickerPickerViewController__insertStickerFromItemProvider___block_invoke(uint64_t a1, int a2)
{
  uint64_t v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = +[UIWindow _applicationKeyWindow];
    id v7 = objc_loadWeakRetained(v4);
    id v9 = *(void **)(a1 + 32);
    id v8 = (void **)(a1 + 32);
    [v9 setKeyWindowChangedDuringInsert:v6 != v7];
  }
  else
  {
    long long v10 = *(void **)(a1 + 32);
    id v8 = (void **)(a1 + 32);
    [v10 setKeyWindowChangedDuringInsert:0];
  }

  long long v11 = *v8;
  if (a2)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65___UIStickerPickerViewController__insertStickerFromItemProvider___block_invoke_2;
    v13[3] = &unk_1E52D9F70;
    v13[4] = v11;
    return [v11 dismissCardAnimated:1 completion:v13];
  }
  else
  {
    return [v11 setKeyWindowChangedDuringInsert:0];
  }
}

uint64_t __65___UIStickerPickerViewController__insertStickerFromItemProvider___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setKeyWindowChangedDuringInsert:0];
}

uint64_t __65___UIStickerPickerViewController_dismissCardAnimated_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissCard];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __45___UIStickerPickerViewController_dismissCard__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) card];
  uint64_t v3 = [v2 view];
  [(id)v3 removeFromSuperview];

  uint64_t v4 = [*(id *)(a1 + 32) card];
  [v4 removeFromParentViewController];

  [*(id *)(a1 + 32) setCard:0];
  id v5 = [*(id *)(a1 + 32) delegate];
  LOBYTE(v3) = objc_opt_respondsToSelector();

  if (v3)
  {
    id v6 = [*(id *)(a1 + 32) delegate];
    [v6 stickerPickerViewControllerDidDismiss];
  }
}

@end