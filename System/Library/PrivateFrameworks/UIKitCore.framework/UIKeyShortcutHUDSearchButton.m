@interface UIKeyShortcutHUDSearchButton
@end

@implementation UIKeyShortcutHUDSearchButton

void __57___UIKeyShortcutHUDSearchButton__configureCollectionView__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    int v13 = [WeakRetained isSearching];
    v14 = +[UIKeyShortcutHUDMetrics currentMetrics];
    v15 = v14;
    if (v13) {
      [v14 searchHUDTextColor];
    }
    else {
    v16 = [v14 standardHUDTextColor];
    }
    [v7 setSearchIconColor:v16];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __57___UIKeyShortcutHUDSearchButton__configureCollectionView__block_invoke_2;
    v17[3] = &unk_1E530B260;
    objc_copyWeak(&v18, v10);
    [v7 setConfigurationUpdateHandler:v17];
    objc_destroyWeak(&v18);
  }
}

void __57___UIKeyShortcutHUDSearchButton__configureCollectionView__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained toolbarVC];
    [v2 updateScrollingSeparatorViewVisibility];

    id WeakRetained = v3;
  }
}

uint64_t __57___UIKeyShortcutHUDSearchButton__configureCollectionView__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 dequeueConfiguredReusableCellWithRegistration:*(void *)(a1 + 32) forIndexPath:a3 item:a4];
}

@end