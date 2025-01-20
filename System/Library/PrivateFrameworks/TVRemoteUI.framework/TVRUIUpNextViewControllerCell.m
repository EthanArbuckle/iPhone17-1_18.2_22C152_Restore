@interface TVRUIUpNextViewControllerCell
@end

@implementation TVRUIUpNextViewControllerCell

void __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained openProductPageForKind:3];
}

void __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained openProductPageForKind:2];
}

void __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained openProductPageForKind:1];
}

void __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained openProductPageForKind:1];
}

void __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  v2 = [WeakRetained upNextInfo];
  v3 = [WeakRetained actionButton];
  [v1 shareEpisodeForInfo:v2 sourceView:v3];
}

void __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  v2 = [WeakRetained upNextInfo];
  v3 = [WeakRetained actionButton];
  [v1 shareShowForInfo:v2 sourceView:v3];
}

void __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  v2 = [WeakRetained upNextInfo];
  v3 = [WeakRetained actionButton];
  [v1 sharePrimaryForInfo:v2 sourceView:v3];
}

void __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  v2 = [WeakRetained upNextInfo];
  v3 = [WeakRetained actionButton];
  [v1 sharePrimaryForInfo:v2 sourceView:v3];
}

void __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v2 = [WeakRetained delegate];
    v3 = [v4 upNextInfo];
    [v2 removeItemFromUpNext:v3];

    id WeakRetained = v4;
  }
}

void __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v2 = [WeakRetained delegate];
    v3 = [v4 upNextInfo];
    [v2 markItemAsWatched:v3];

    id WeakRetained = v4;
  }
}

uint64_t __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_392(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) arrayByAddingObject:a2];
  return MEMORY[0x270F9A758]();
}

void __51___TVRUIUpNextViewControllerCell__actionButtonMenu__block_invoke_2_394(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ([*(id *)(a1 + 32) hasURLForProductPageKind:a2]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __55___TVRUIUpNextViewControllerCell__updateForUpNextInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = [WeakRetained upNextInfo];
    v9 = [v8 mediaInfo];
    v10 = [v9 identifier];

    if ([v10 length] && objc_msgSend(v12, "isEqualToString:", v10))
    {
      v11 = [v7 imageView];
      [v11 setImage:v5];
    }
  }
}

__CFString *__62___TVRUIUpNextViewControllerCell__secondaryTextForUpNextInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = &stru_26DB4CAE0;
  if (v4) {
    v6 = v4;
  }
  v7 = v6;
  if ([v5 length])
  {
    if ([(__CFString *)v4 length]) {
      v8 = @" • %@";
    }
    else {
      v8 = @"%@";
    }
    uint64_t v9 = -[__CFString stringByAppendingFormat:](v7, "stringByAppendingFormat:", v8, v5);

    v7 = (__CFString *)v9;
  }

  return v7;
}

@end