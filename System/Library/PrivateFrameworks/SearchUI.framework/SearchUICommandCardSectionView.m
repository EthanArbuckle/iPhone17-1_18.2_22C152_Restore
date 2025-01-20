@interface SearchUICommandCardSectionView
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
- (SearchUICommandCardSectionView)initWithRowModel:(id)a3 feedbackDelegate:(id)a4;
- (TLKSimpleRowView)rowView;
- (UIView)checkmarkImageView;
- (id)setupContentView;
- (void)fetchStateForNewRowModel:(id)a3;
- (void)setCheckmarkImageView:(id)a3;
- (void)setRowView:(id)a3;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUICommandCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

- (SearchUICommandCardSectionView)initWithRowModel:(id)a3 feedbackDelegate:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SearchUICommandCardSectionView;
  v7 = [(SearchUICardSectionView *)&v10 initWithRowModel:v6 feedbackDelegate:a4];
  v8 = v7;
  if (v7) {
    [(SearchUICommandCardSectionView *)v7 fetchStateForNewRowModel:v6];
  }

  return v8;
}

- (id)setupContentView
{
  v24[3] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  [(SearchUICommandCardSectionView *)self setRowView:v3];

  double v4 = *MEMORY[0x1E4FB2848];
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v7 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  v8 = [(SearchUICommandCardSectionView *)self rowView];
  objc_msgSend(v8, "setLayoutMargins:", v4, v5, v6, v7);

  v9 = objc_opt_new();
  [v9 setSymbolName:@"clock.badge.fill"];
  [v9 setIsTemplate:1];
  +[SearchUIAppIconImage sizeForVariant:2];
  objc_msgSend(v9, "setSize:");
  objc_super v10 = objc_opt_new();
  [v10 setProminence:0];
  v11 = +[SearchUITLKImageConverter imageForSFImage:v9];
  [v10 setTlkImage:v11];

  +[SearchUIAutoLayout requireIntrinsicSizeForView:v10];
  v12 = objc_opt_new();
  [v12 setSymbolName:@"checkmark"];
  [v12 setIsTemplate:1];
  v13 = objc_opt_new();
  [v13 setProminence:0];
  v14 = +[SearchUITLKImageConverter imageForSFImage:v12];
  [v13 setTlkImage:v14];

  v15 = [MEMORY[0x1E4FAE090] cachedFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v13 setSymbolFont:v15];

  [v13 setSymbolWeight:6];
  +[SearchUIAutoLayout requireIntrinsicSizeForView:v13];
  [(SearchUICommandCardSectionView *)self setCheckmarkImageView:v13];
  id v16 = objc_alloc(MEMORY[0x1E4F4BF00]);
  v17 = [(SearchUICommandCardSectionView *)self rowView];
  v24[1] = v17;
  v24[2] = v13;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
  v19 = (void *)[v16 initWithArrangedSubviews:v18];

  [v19 setAlignment:3];
  [v19 setSpacing:10.0];
  [v19 setLayoutMarginsRelativeArrangement:1];
  [MEMORY[0x1E4FAE1A0] defaultLayoutMargins];
  double v21 = v20;
  [MEMORY[0x1E4FAE1A0] defaultLayoutMargins];
  objc_msgSend(v19, "setDirectionalLayoutMargins:", 0.0, v21, 0.0);
  v22 = [(SearchUICommandCardSectionView *)self layer];
  [v22 setAllowsGroupOpacity:0];

  return v19;
}

- (void)updateWithRowModel:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUICardSectionView *)self rowModel];

  v12.receiver = self;
  v12.super_class = (Class)SearchUICommandCardSectionView;
  [(SearchUICardSectionView *)&v12 updateWithRowModel:v4];
  double v6 = [v4 title];
  double v7 = [(SearchUICommandCardSectionView *)self rowView];
  [v7 setLeadingTitle:v6];

  v8 = [v4 subtitle];
  v9 = [(SearchUICommandCardSectionView *)self rowView];
  [v9 setLeadingSubtitle:v8];

  uint64_t v10 = [v4 toggled] ^ 1;
  v11 = [(SearchUICommandCardSectionView *)self checkmarkImageView];
  [v11 setHidden:v10];

  if (v5 != v4) {
    [(SearchUICommandCardSectionView *)self fetchStateForNewRowModel:v4];
  }
}

- (void)fetchStateForNewRowModel:(id)a3
{
  id v4 = a3;
  [(SearchUICommandCardSectionView *)self setAlpha:0.0];
  id v5 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__SearchUICommandCardSectionView_fetchStateForNewRowModel___block_invoke;
  v7[3] = &unk_1E6E72620;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [v5 performBlock:v7];
}

void __59__SearchUICommandCardSectionView_fetchStateForNewRowModel___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__SearchUICommandCardSectionView_fetchStateForNewRowModel___block_invoke_2;
  v5[3] = &unk_1E6E72820;
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  [v3 checkIfCommandIsValidWithCompletionHandler:v5];
}

void __59__SearchUICommandCardSectionView_fetchStateForNewRowModel___block_invoke_2(uint64_t a1, char a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__SearchUICommandCardSectionView_fetchStateForNewRowModel___block_invoke_3;
  v6[3] = &unk_1E6E727F8;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  char v9 = a2;
  +[SearchUIUtilities dispatchMainIfNecessary:v6];
}

void __59__SearchUICommandCardSectionView_fetchStateForNewRowModel___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) rowModel];

  if (v2 == v3)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      [*(id *)(a1 + 32) updateStateWithCommandCardSectionView:*(void *)(a1 + 40)];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __59__SearchUICommandCardSectionView_fetchStateForNewRowModel___block_invoke_4;
      v5[3] = &unk_1E6E72730;
      void v5[4] = *(void *)(a1 + 40);
      [MEMORY[0x1E4FAE198] performAnimatableChanges:v5];
    }
    else
    {
      id v4 = *(void **)(a1 + 40);
      [v4 requestRemovalFromEnclosingView];
    }
  }
}

uint64_t __59__SearchUICommandCardSectionView_fetchStateForNewRowModel___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (TLKSimpleRowView)rowView
{
  return self->_rowView;
}

- (void)setRowView:(id)a3
{
}

- (UIView)checkmarkImageView
{
  return self->_checkmarkImageView;
}

- (void)setCheckmarkImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkImageView, 0);
  objc_storeStrong((id *)&self->_rowView, 0);
}

@end