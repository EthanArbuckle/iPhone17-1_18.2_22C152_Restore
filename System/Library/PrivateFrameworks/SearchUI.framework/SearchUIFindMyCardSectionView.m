@interface SearchUIFindMyCardSectionView
+ (BOOL)fillsBackgroundWithContentForRowModel:(id)a3;
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
- (CNContact)contact;
- (FMUILocationDetailViewController)viewController;
- (TLKLabel)locationLabel;
- (TLKLabel)timeLabel;
- (id)setupContentView;
- (void)setContact:(id)a3;
- (void)setLocationLabel:(id)a3;
- (void)setTimeLabel:(id)a3;
- (void)setViewController:(id)a3;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIFindMyCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

+ (BOOL)fillsBackgroundWithContentForRowModel:(id)a3
{
  return 1;
}

- (id)setupContentView
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  v3 = (void *)getFMUILocationDetailViewControllerViewOptionsClass_softClass;
  uint64_t v21 = getFMUILocationDetailViewControllerViewOptionsClass_softClass;
  if (!getFMUILocationDetailViewControllerViewOptionsClass_softClass)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __getFMUILocationDetailViewControllerViewOptionsClass_block_invoke;
    v16 = &unk_1E6E72C90;
    v17 = &v18;
    __getFMUILocationDetailViewControllerViewOptionsClass_block_invoke((uint64_t)&v13);
    v3 = (void *)v19[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v18, 8);
  v5 = [v4 spotlightWidget];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  v6 = (void *)getFMUILocationDetailViewControllerClass_softClass;
  uint64_t v21 = getFMUILocationDetailViewControllerClass_softClass;
  if (!getFMUILocationDetailViewControllerClass_softClass)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __getFMUILocationDetailViewControllerClass_block_invoke;
    v16 = &unk_1E6E72C90;
    v17 = &v18;
    __getFMUILocationDetailViewControllerClass_block_invoke((uint64_t)&v13);
    v6 = (void *)v19[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v18, 8);
  v8 = objc_opt_new();
  v9 = [v8 view];
  objc_msgSend(v9, "setMinimumLayoutSize:", 0.0, 200.0);

  v10 = [v8 view];
  objc_msgSend(v10, "setMaximumLayoutSize:", 1.79769313e308, 200.0);

  [v8 setViewOptions:v5];
  [(SearchUIFindMyCardSectionView *)self setViewController:v8];
  v11 = [v8 view];

  return v11;
}

- (void)updateWithRowModel:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SearchUIFindMyCardSectionView;
  [(SearchUICardSectionView *)&v21 updateWithRowModel:v4];
  v5 = [(SearchUIFindMyCardSectionView *)self contact];
  v6 = [v5 identifier];

  id v7 = [(SearchUICardSectionView *)self section];
  v8 = [v7 person];
  v9 = [v8 contactIdentifier];

  if (([v6 isEqual:v9] & 1) == 0)
  {
    v10 = [(SearchUIFindMyCardSectionView *)self locationLabel];
    [v10 setText:0];

    v11 = [(SearchUIFindMyCardSectionView *)self timeLabel];
    [v11 setText:0];

    v12 = [(SearchUIFindMyCardSectionView *)self locationLabel];
    [v12 setAlpha:0.0];

    uint64_t v13 = [(SearchUIFindMyCardSectionView *)self timeLabel];
    [v13 setAlpha:0.0];

    uint64_t v14 = [(SearchUIFindMyCardSectionView *)self viewController];
    [v14 stopObserving];

    objc_initWeak(&location, self);
    v15 = +[SearchUIContactCache sharedCache];
    v22[0] = v9;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __52__SearchUIFindMyCardSectionView_updateWithRowModel___block_invoke;
    v17[3] = &unk_1E6E73FD8;
    v17[4] = self;
    id v18 = v4;
    objc_copyWeak(&v19, &location);
    [v15 fetchContactsForIdentifiers:v16 completionHandler:v17];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __52__SearchUIFindMyCardSectionView_updateWithRowModel___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] rowModel];
  id v5 = a1[5];

  if (v4 == v5)
  {
    v6 = [v3 firstObject];
    [a1[4] setContact:v6];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__SearchUIFindMyCardSectionView_updateWithRowModel___block_invoke_2;
    v7[3] = &unk_1E6E73FB0;
    objc_copyWeak(&v10, a1 + 6);
    id v8 = a1[5];
    id v9 = v3;
    +[SearchUIUtilities dispatchMainIfNecessary:v7];

    objc_destroyWeak(&v10);
  }
}

void __52__SearchUIFindMyCardSectionView_updateWithRowModel___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained rowModel];
  id v3 = *(void **)(a1 + 32);

  if (v2 == v3 && [*(id *)(a1 + 40) count])
  {
    id v4 = [WeakRetained viewController];
    [v4 startObservingContacts:*(void *)(a1 + 40)];
  }
}

- (FMUILocationDetailViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (TLKLabel)locationLabel
{
  return self->_locationLabel;
}

- (void)setLocationLabel:(id)a3
{
}

- (TLKLabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end