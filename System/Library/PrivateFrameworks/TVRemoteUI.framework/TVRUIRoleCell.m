@interface TVRUIRoleCell
@end

@implementation TVRUIRoleCell

void __36___TVRUIRoleCell__updateUIWithRole___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = [WeakRetained imageView];
    [v6 setImage:v7];

    [v5 setNeedsLayout];
    [v5 layoutIfNeeded];
    if (!v7) {
      [v5 _updateFallbackImageForRole:*(void *)(a1 + 32)];
    }
  }
}

void __46___TVRUIRoleCell__updateFallbackImageForRole___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = [WeakRetained role];
    v9 = [v8 canonicalID];
    int v10 = [v12 isEqualToString:v9];

    if (v10)
    {
      v11 = [v7 imageView];
      [v11 setImage:v5];
    }
  }
}

@end