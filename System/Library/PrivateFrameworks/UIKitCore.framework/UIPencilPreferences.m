@interface UIPencilPreferences
@end

@implementation UIPencilPreferences

void __41___UIPencilPreferences_sharedPreferences__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_1212;
  _MergedGlobals_1212 = (uint64_t)v1;
}

void __52___UIPencilPreferences__preferredTapActionDidChange__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [(id)objc_opt_class() willChangeValueForKey:@"preferredTapAction"];
    WeakRetained[1] = _UIPencilPreferredActionForKey(@"UIPencilPreferredTapAction");
    [(id)objc_opt_class() didChangeValueForKey:@"preferredTapAction"];
  }
}

uint64_t __52___UIPencilPreferences__preferredTapActionDidChange__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56___UIPencilPreferences__preferredSqueezeActionDidChange__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [(id)objc_opt_class() willChangeValueForKey:@"_preferredSqueezeAction"];
    WeakRetained[2] = _UIPencilPreferredActionForKey(@"UIPencilPreferredSqueezeAction");
    [(id)objc_opt_class() didChangeValueForKey:@"_preferredSqueezeAction"];
  }
}

uint64_t __56___UIPencilPreferences__preferredSqueezeActionDidChange__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58___UIPencilPreferences__prefersPencilOnlyDrawingDidChange__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [(id)objc_opt_class() willChangeValueForKey:@"prefersPencilOnlyDrawing"];
    WeakRetained[24] = WeakRetained[24] & 0xFE | _UIPencilPrefersPencilOnlyDrawingForKey();
    [(id)objc_opt_class() didChangeValueForKey:@"prefersPencilOnlyDrawing"];
  }
}

uint64_t __58___UIPencilPreferences__prefersPencilOnlyDrawingDidChange__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57___UIPencilPreferences__prefersHoverToolPreviewDidChange__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [(id)objc_opt_class() willChangeValueForKey:@"prefersHoverToolPreview"];
    if (_UIPencilPrefersHoverToolPreview()) {
      char v1 = 2;
    }
    else {
      char v1 = 0;
    }
    WeakRetained[24] = WeakRetained[24] & 0xFD | v1;
    [(id)objc_opt_class() didChangeValueForKey:@"prefersHoverToolPreview"];
  }
}

uint64_t __57___UIPencilPreferences__prefersHoverToolPreviewDidChange__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end