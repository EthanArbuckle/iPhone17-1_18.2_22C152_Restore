@interface IKTextBadgeAttachment
@end

@implementation IKTextBadgeAttachment

uint64_t __92__IKTextBadgeAttachment_TVMLKitAdditions__tv_resolveWithTextLayoutDirection_layoutObserver___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  v6 = [v4 uiImage];

  objc_msgSend(WeakRetained, "tv_setImage:", v6);
  id v7 = objc_loadWeakRetained(v3);
  objc_msgSend(v7, "tv_setResolving:", 0);

  id v8 = objc_loadWeakRetained(v3);
  objc_msgSend(v8, "tv_setImageProxy:", 0);

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    v10 = *(uint64_t (**)(void))(result + 16);
    return v10();
  }
  return result;
}

@end