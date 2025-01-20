@interface SearchUIMovieCardSectionView
+ (id)dragTitleForCardSection:(id)a3;
- (SearchUIMovieCardSectionView)initWithRowModel:(id)a3 feedbackDelegate:(id)a4;
- (id)setupContentView;
@end

@implementation SearchUIMovieCardSectionView

- (SearchUIMovieCardSectionView)initWithRowModel:(id)a3 feedbackDelegate:(id)a4
{
  id v6 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SearchUIMovieCardSectionView;
  v7 = [(SearchUICardSectionView *)&v32 initWithRowModel:v6 feedbackDelegate:a4];
  if (!v7) {
    goto LABEL_9;
  }
  v8 = [v6 cardSection];
  v9 = [v8 mediaItem];
  v10 = [v9 thumbnail];
  if (v10)
  {

LABEL_5:
    v12 = objc_opt_new();
    LODWORD(v13) = 1148846080;
    [v12 setContentCompressionResistancePriority:1 forAxis:v13];
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __66__SearchUIMovieCardSectionView_initWithRowModel_feedbackDelegate___block_invoke;
    v29 = &unk_1E6E72620;
    id v30 = v8;
    id v31 = v12;
    id v14 = v12;
    [v14 performBatchUpdates:&v26];
    v15 = [(SearchUICardSectionView *)v7 contentView];
    [v15 addArrangedSubview:v14];

    goto LABEL_6;
  }
  v11 = [v8 details];

  if (v11) {
    goto LABEL_5;
  }
LABEL_6:
  v16 = [v8 watchListIdentifier];
  uint64_t v17 = [v16 length];

  if (v17)
  {
    v18 = [[SearchUIButtonsView alloc] initWithCardSectionView:v7];
    [(SearchUIButtonsView *)v18 setLayoutMarginsRelativeArrangement:1];
    +[SearchUIUtilities standardTableCellContentInset];
    double v20 = v19;
    [MEMORY[0x1E4FAE100] deviceScaledRoundedValue:v7 forView:11.5];
    double v22 = v21;
    +[SearchUIUtilities standardTableCellContentInset];
    -[SearchUIButtonsView setLayoutMargins:](v18, "setLayoutMargins:", 0.0, v20, v22, v23);
    v24 = [(SearchUICardSectionView *)v7 contentView];
    [v24 addArrangedSubview:v18];
  }
LABEL_9:

  return v7;
}

void __66__SearchUIMovieCardSectionView_initWithRowModel_feedbackDelegate___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) mediaItem];
  v3 = [v2 thumbnail];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) mediaItem];
    v5 = [v4 thumbnail];
    id v6 = +[SearchUITLKImageConverter imageForSFImage:v5];
    [*(id *)(a1 + 40) setImage:v6];
  }
  v7 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [*(id *)(a1 + 32) details];
  uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        double v13 = objc_opt_new();
        id v14 = [v12 title];
        v15 = +[SearchUITLKMultilineTextConverter textForSearchUIString:v14];
        [v13 setTitle:v15];

        v16 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v17 = [v12 content];
        v18 = +[SearchUITLKMultilineTextConverter textForSearchUIText:v17];
        double v19 = [v16 arrayWithObject:v18];
        [v13 setDetails:v19];

        [v7 addObject:v13];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  [*(id *)(a1 + 40) setContents:v7];
}

- (id)setupContentView
{
  v2 = objc_opt_new();
  [v2 setAxis:1];
  [v2 setSpacing:4.0];
  return v2;
}

+ (id)dragTitleForCardSection:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28E78] string];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [v3 details];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = [v10 title];
        v12 = [v10 content];
        double v13 = [v12 text];
        [v4 appendFormat:@"%@\n%@\n\n", v11, v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

@end