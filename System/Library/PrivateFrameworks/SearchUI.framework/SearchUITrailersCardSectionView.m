@interface SearchUITrailersCardSectionView
- (SearchUITrailersCardSectionView)initWithRowModel:(id)a3 feedbackDelegate:(id)a4;
- (id)setupContentView;
@end

@implementation SearchUITrailersCardSectionView

- (SearchUITrailersCardSectionView)initWithRowModel:(id)a3 feedbackDelegate:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SearchUITrailersCardSectionView;
  v7 = [(SearchUICardSectionView *)&v30 initWithRowModel:v6 feedbackDelegate:a4];
  if (v7)
  {
    v8 = [v6 cardSection];
    v9 = objc_opt_new();
    v10 = [v8 title];
    [v9 setText:v10];

    v11 = [MEMORY[0x1E4FAE090] boldBodyFont];
    [v9 setFont:v11];

    v12 = [(SearchUICardSectionView *)v7 contentView];
    [v12 addArrangedSubview:v9];

    v13 = objc_opt_new();
    [v13 setSpacing:14.0];
    LODWORD(v14) = 1148846080;
    [v13 setContentCompressionResistancePriority:0 forAxis:v14];
    LODWORD(v15) = 1148846080;
    [v13 setContentHuggingPriority:0 forAxis:v15];
    [MEMORY[0x1E4FAE1A0] makeContainerShadowCompatible:v13];
    v16 = (void *)[objc_alloc(MEMORY[0x1E4FAE118]) initWithDocumentView:v13];
    [v16 setShowsHorizontalScrollIndicator:0];
    [v16 setCanScrollDocumentViewVertically:0];
    [v16 setHorizontalAlignment:1];
    [MEMORY[0x1E4FAE1A0] makeContainerShadowCompatible:v16];
    v17 = [(SearchUICardSectionView *)v7 contentView];
    [v17 addArrangedSubview:v16];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v25 = v8;
    v18 = [v8 mediaItems];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = [[SearchUITrailerView alloc] initWithMediaItem:*(void *)(*((void *)&v26 + 1) + 8 * i) cardSectionView:v7];
          [v13 addArrangedSubview:v23];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v20);
    }

    [(SearchUITrailersCardSectionView *)v7 setClipsToBounds:1];
  }

  return v7;
}

- (id)setupContentView
{
  v2 = objc_opt_new();
  v3 = [v2 layer];
  [v3 setMasksToBounds:1];

  [v2 setAxis:1];
  [v2 setLayoutMarginsRelativeArrangement:1];
  [v2 setSpacing:10.0];
  [v2 setBaselineRelativeArrangement:1];
  [MEMORY[0x1E4FAE1A0] defaultLayoutMargins];
  objc_msgSend(v2, "setLayoutMargins:");
  return v2;
}

@end