@interface SearchUISectionHeaderCardSectionView
+ (BOOL)fillsBackgroundWithContentForRowModel:(id)a3;
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
- (id)setupContentView;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUISectionHeaderCardSectionView

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
  v10.super_class = (Class)SearchUISectionHeaderCardSectionView;
  [(SearchUICardSectionView *)&v10 updateWithRowModel:v4];

  v6 = [(SearchUICardSectionView *)self contentView];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__SearchUISectionHeaderCardSectionView_updateWithRowModel___block_invoke;
  v8[3] = &unk_1E6E72620;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 performBatchUpdates:v8];
}

void __59__SearchUISectionHeaderCardSectionView_updateWithRowModel___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 40) text];
  v2 = +[SearchUITLKMultilineTextConverter richTextForSearchUIText:v4];
  v3 = [*(id *)(a1 + 32) contentView];
  [v3 setHeaderText:v2];
}

+ (BOOL)fillsBackgroundWithContentForRowModel:(id)a3
{
  return 1;
}

@end