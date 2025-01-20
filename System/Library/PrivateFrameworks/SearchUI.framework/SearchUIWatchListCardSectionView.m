@interface SearchUIWatchListCardSectionView
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
- (id)setupContentView;
- (void)didUpdateRowModel:(id)a3 animate:(BOOL)a4;
- (void)updateTitle:(id)a3 subtitle:(id)a4 image:(id)a5;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIWatchListCardSectionView

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
  v5.receiver = self;
  v5.super_class = (Class)SearchUIWatchListCardSectionView;
  id v4 = a3;
  [(SearchUICardSectionView *)&v5 updateWithRowModel:v4];
  objc_msgSend(v4, "setDelegate:", self, v5.receiver, v5.super_class);
  [(SearchUIWatchListCardSectionView *)self didUpdateRowModel:v4 animate:0];
}

- (void)didUpdateRowModel:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(SearchUICardSectionView *)self rowModel];

  if (v7 == v6)
  {
    if ([v6 hasError])
    {
      [(SearchUICardSectionView *)self requestRemovalFromEnclosingView];
    }
    else if ([v6 hasLoaded])
    {
      v8 = [v6 title];
      v9 = [v6 subtitle];
      v10 = [v6 image];
      [(SearchUIWatchListCardSectionView *)self updateTitle:v8 subtitle:v9 image:v10];

      v11 = [(SearchUIWatchListCardSectionView *)self layer];
      [v11 setAllowsGroupOpacity:0];

      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __62__SearchUIWatchListCardSectionView_didUpdateRowModel_animate___block_invoke;
      v13[3] = &unk_1E6E72730;
      v13[4] = self;
      +[SearchUIUtilities performAnimatableChanges:v13 animated:v4];
    }
    else
    {
      [(SearchUIWatchListCardSectionView *)self setAlpha:0.0];
      v12 = objc_opt_new();
      +[SearchUIAppIconImage sizeForVariant:2];
      objc_msgSend(v12, "setSize:");
      [(SearchUIWatchListCardSectionView *)self updateTitle:&stru_1F40279D8 subtitle:&stru_1F40279D8 image:v12];
    }
  }
}

uint64_t __62__SearchUIWatchListCardSectionView_didUpdateRowModel_animate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)updateTitle:(id)a3 subtitle:(id)a4 image:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(SearchUICardSectionView *)self contentView];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__SearchUIWatchListCardSectionView_updateTitle_subtitle_image___block_invoke;
  v15[3] = &unk_1E6E73970;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 performBatchUpdates:v15];
}

void __63__SearchUIWatchListCardSectionView_updateTitle_subtitle_image___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4FAE128] textWithString:*(void *)(a1 + 40)];
  v3 = [*(id *)(a1 + 32) contentView];
  [v3 setLeadingTitle:v2];

  BOOL v4 = [MEMORY[0x1E4FAE128] textWithString:*(void *)(a1 + 48)];
  objc_super v5 = [*(id *)(a1 + 32) contentView];
  [v5 setLeadingSubtitle:v4];

  uint64_t v6 = *(void *)(a1 + 56);
  if (v6)
  {
    id v9 = +[SearchUIImage imageWithSFImage:v6 variantForAppIcon:2];
    id v7 = +[SearchUITLKImageConverter imageForSFImage:v9];
    id v8 = [*(id *)(a1 + 32) contentView];
    [v8 setLeadingImage:v7];
  }
}

@end