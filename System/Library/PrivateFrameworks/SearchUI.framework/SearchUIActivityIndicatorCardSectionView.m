@interface SearchUIActivityIndicatorCardSectionView
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
- (id)setupContentView;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIActivityIndicatorCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

- (id)setupContentView
{
  v2 = objc_opt_new();
  return v2;
}

- (void)updateWithRowModel:(id)a3
{
  id v4 = a3;
  v5 = [v4 cardSection];
  v10.receiver = self;
  v10.super_class = (Class)SearchUIActivityIndicatorCardSectionView;
  [(SearchUICardSectionView *)&v10 updateWithRowModel:v4];

  v6 = [(SearchUICardSectionView *)self contentView];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__SearchUIActivityIndicatorCardSectionView_updateWithRowModel___block_invoke;
  v8[3] = &unk_1E6E72620;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 performBatchUpdates:v8];
}

void __63__SearchUIActivityIndicatorCardSectionView_updateWithRowModel___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4FAE110];
  id v5 = [*(id *)(a1 + 40) text];
  v3 = [v2 textWithString:v5];
  id v4 = [*(id *)(a1 + 32) contentView];
  [v4 setSubtitle:v3];
}

@end