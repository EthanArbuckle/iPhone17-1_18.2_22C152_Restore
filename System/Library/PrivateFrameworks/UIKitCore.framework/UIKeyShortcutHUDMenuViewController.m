@interface UIKeyShortcutHUDMenuViewController
@end

@implementation UIKeyShortcutHUDMenuViewController

void __63___UIKeyShortcutHUDMenuViewController__configureCollectionView__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v8 = a2;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [v8 configureWithShortcut:v6];
  }
}

void __63___UIKeyShortcutHUDMenuViewController__configureCollectionView__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v17 = a2;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = +[UIKeyShortcutHUDMetrics currentMetrics];
    [v8 menuSeparatorHorizontalMargin];
    objc_msgSend(v17, "setDirectionalLayoutMargins:", 0.0, v9, 0.0, v9);
    v10 = [v8 menuSeparatorColor];
    v11 = [v17 separatorView];
    [v11 setSeparatorColor:v10];

    v12 = [v8 menuSeparatorVisualEffect];
    v13 = [v17 separatorView];
    [v13 setVisualEffect:v12];

    v14 = [WeakRetained collectionViewManager];
    uint64_t v15 = [v14 client:WeakRetained shouldHideSeparatorAtIndexPath:v6];
    v16 = [v17 separatorView];
    [v16 setSeparatorHidden:v15];
  }
}

void __63___UIKeyShortcutHUDMenuViewController__configureCollectionView__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v13 = a2;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    double v9 = [WeakRetained dataSource];
    v10 = [v9 snapshot];
    v11 = [v10 sectionIdentifiers];
    v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));

    [v13 configureWithCategory:v12];
  }
}

uint64_t __63___UIKeyShortcutHUDMenuViewController__configureCollectionView__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 dequeueConfiguredReusableCellWithRegistration:*(void *)(a1 + 32) forIndexPath:a3 item:a4];
}

id __63___UIKeyShortcutHUDMenuViewController__configureCollectionView__block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a2;
  int v9 = [a3 isEqualToString:@"UICollectionElementKindSectionHeader"];
  uint64_t v10 = 40;
  if (v9) {
    uint64_t v10 = 32;
  }
  v11 = [v8 dequeueConfiguredReusableSupplementaryViewWithRegistration:*(void *)(a1 + v10) forIndexPath:v7];

  return v11;
}

uint64_t __80___UIKeyShortcutHUDMenuViewController_flashShortcutIfVisible_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a1 + 32;
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(v5 + 8);
  if (v3) {
    uint64_t v6 = [v3 section];
  }
  else {
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  id v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  return v7(v4, a2, v6);
}

@end