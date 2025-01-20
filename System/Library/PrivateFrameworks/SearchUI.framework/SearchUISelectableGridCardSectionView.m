@interface SearchUISelectableGridCardSectionView
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
- (id)convertSFTitleSubtitleData:(id)a3;
- (id)setupContentView;
- (void)selectableGridView:(id)a3 didChangeSelectedIndex:(int64_t)a4;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUISelectableGridCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

- (id)setupContentView
{
  v3 = objc_opt_new();
  [v3 setDelegate:self];
  return v3;
}

- (void)updateWithRowModel:(id)a3
{
  id v4 = a3;
  v5 = [v4 cardSection];
  v14.receiver = self;
  v14.super_class = (Class)SearchUISelectableGridCardSectionView;
  [(SearchUICardSectionView *)&v14 updateWithRowModel:v4];

  v6 = [v5 entries];
  v7 = [(SearchUISelectableGridCardSectionView *)self convertSFTitleSubtitleData:v6];

  v8 = [(SearchUICardSectionView *)self contentView];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__SearchUISelectableGridCardSectionView_updateWithRowModel___block_invoke;
  v11[3] = &unk_1E6E72938;
  v11[4] = self;
  id v12 = v7;
  id v13 = v5;
  id v9 = v5;
  id v10 = v7;
  [v8 performBatchUpdates:v11];
}

void __60__SearchUISelectableGridCardSectionView_updateWithRowModel___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = [*(id *)(a1 + 32) contentView];
  [v3 setTuples:v2];

  id v6 = [*(id *)(a1 + 48) initialSelectedIndex];
  uint64_t v4 = [v6 integerValue];
  v5 = [*(id *)(a1 + 32) contentView];
  [v5 setSelectedIndex:v4];
}

- (id)convertSFTitleSubtitleData:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1E4FAE138];
        id v12 = objc_msgSend(v10, "title", (void)v16);
        id v13 = [v10 subtitle];
        objc_super v14 = [v11 tupleWithTitle:v12 subtitle:v13];

        [v4 addObject:v14];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)selectableGridView:(id)a3 didChangeSelectedIndex:(int64_t)a4
{
  uint64_t v6 = [(SearchUICardSectionView *)self feedbackDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(SearchUICardSectionView *)self feedbackDelegate];
    [v8 cardSectionViewDidSelectPreferredPunchoutIndex:a4];
  }
}

@end