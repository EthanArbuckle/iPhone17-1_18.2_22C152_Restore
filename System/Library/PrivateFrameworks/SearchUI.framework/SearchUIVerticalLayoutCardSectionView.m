@interface SearchUIVerticalLayoutCardSectionView
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
- (BOOL)useAppIconMetrics;
- (CGRect)highlightFrame;
- (NUIContainerBoxView)thumbnailOverlayContainer;
- (SearchUIImageView)thumbnailOverlayImageView;
- (SearchUIImageView)thumbnailView;
- (SearchUILabel)footnoteLabel;
- (SearchUILabel)thumbnailOverlayLabel;
- (SearchUILabel)titleLabel;
- (UIImageView)gradientImageView;
- (id)highlightReferenceView;
- (id)setupContentView;
- (void)buildThumbnailOverlayContainerIfNecessary;
- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5;
- (void)containerViewDidLayoutArrangedSubviews:(id)a3;
- (void)didMoveToWindow;
- (void)setFootnoteLabel:(id)a3;
- (void)setGradientImageView:(id)a3;
- (void)setThumbnailOverlayContainer:(id)a3;
- (void)setThumbnailOverlayImageView:(id)a3;
- (void)setThumbnailOverlayLabel:(id)a3;
- (void)setThumbnailView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUseAppIconMetrics:(BOOL)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateChevronVisible:(BOOL)a3 leaveSpaceForChevron:(BOOL)a4;
- (void)updateThumbnailOverlayContainerWithText:(id)a3;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIVerticalLayoutCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

- (id)setupContentView
{
  v19[3] = *MEMORY[0x1E4F143B8];
  [(SearchUIVerticalLayoutCardSectionView *)self setUseAppIconMetrics:0];
  v3 = objc_opt_new();
  [(SearchUIVerticalLayoutCardSectionView *)self setThumbnailView:v3];

  v4 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailView];
  objc_msgSend(v4, "setMinimumLayoutSize:", 60.0, 60.0);

  v5 = [MEMORY[0x1E4FAE090] cachedFontForTextStyle:*MEMORY[0x1E4FB2950] isShort:0 isBold:0];
  v6 = objc_opt_new();
  [(SearchUIVerticalLayoutCardSectionView *)self setTitleLabel:v6];

  v7 = [(SearchUIVerticalLayoutCardSectionView *)self titleLabel];
  [v7 setFont:v5];

  v8 = [(SearchUIVerticalLayoutCardSectionView *)self titleLabel];
  [v8 setSupportsColorGlyphs:1];

  v9 = +[TLKLabel secondaryLabel];
  [(SearchUIVerticalLayoutCardSectionView *)self setFootnoteLabel:v9];

  v10 = [(SearchUIVerticalLayoutCardSectionView *)self footnoteLabel];
  [v10 setFont:v5];

  v11 = [(SearchUIVerticalLayoutCardSectionView *)self footnoteLabel];
  [v11 setSupportsColorGlyphs:1];

  id v12 = objc_alloc(MEMORY[0x1E4F4BF00]);
  v13 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailView];
  v14 = [(SearchUIVerticalLayoutCardSectionView *)self titleLabel];
  v19[1] = v14;
  v15 = [(SearchUIVerticalLayoutCardSectionView *)self footnoteLabel];
  v19[2] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  v17 = (void *)[v12 initWithArrangedSubviews:v16];

  [MEMORY[0x1E4FAE100] deviceScaledRoundedValue:self forView:5.5];
  objc_msgSend(v17, "setSpacing:");
  [v17 setAxis:1];
  [v17 setDelegate:self];
  [MEMORY[0x1E4FAE1A0] makeContainerShadowCompatible:v17];

  return v17;
}

- (CGRect)highlightFrame
{
  v3 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailView];
  v13 = [v12 superview];
  -[SearchUIVerticalLayoutCardSectionView convertRect:fromView:](self, "convertRect:fromView:", v13, v5, v7, v9, v11);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (id)highlightReferenceView
{
  v2 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailView];
  v3 = [v2 highlightReferenceView];

  return v3;
}

- (void)updateWithRowModel:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SearchUIVerticalLayoutCardSectionView;
  id v4 = a3;
  [(SearchUICardSectionView *)&v10 updateWithRowModel:v4];
  double v5 = [v4 cardSection];

  -[SearchUIVerticalLayoutCardSectionView setUseAppIconMetrics:](self, "setUseAppIconMetrics:", [v5 useAppIconMetrics]);
  double v6 = [(SearchUICardSectionView *)self contentView];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__SearchUIVerticalLayoutCardSectionView_updateWithRowModel___block_invoke;
  v8[3] = &unk_1E6E72620;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 performBatchUpdates:v8];
}

uint64_t __60__SearchUIVerticalLayoutCardSectionView_updateWithRowModel___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) useAppIconMetrics])
  {
    id v2 = objc_alloc(MEMORY[0x1E4FA6238]);
    v3 = objc_msgSend(v2, "initWithScreenType:", objc_msgSend(MEMORY[0x1E4FA6238], "currentDeviceScreenType"));
    id v4 = [v3 layoutForIconLocation:*MEMORY[0x1E4FA66D0]];

    if (+[SearchUIUtilities isIpad]) {
      uint64_t v5 = 4;
    }
    else {
      uint64_t v5 = 5;
    }
    +[SearchUIAppIconImage sizeForVariant:v5];
    double v7 = v6;
    double v9 = v8;
    objc_super v10 = [*(id *)(a1 + 40) thumbnail];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v11 = 0.0;
    }
    else {
      double v11 = 4.0;
    }

    double v12 = v7 - v11;
    double v13 = v9 - v11;
    double v14 = [*(id *)(a1 + 32) thumbnailView];
    [v14 setProminence:0];

    double v15 = [*(id *)(a1 + 32) traitCollection];
    double v16 = [v15 preferredContentSizeCategory];
    double v17 = [v4 labelVisualConfigurationForContentSizeCategory:v16 options:0];

    double v18 = [MEMORY[0x1E4FAE090] cachedFontForTextStyle:*MEMORY[0x1E4FB28D8] isShort:0 fontWeight:*MEMORY[0x1E4FB09D0]];
    [v17 fontSize];
    double v19 = objc_msgSend(v18, "fontWithSize:");

    double v20 = [*(id *)(a1 + 32) titleLabel];
    [v20 setFont:v19];

    double v21 = [*(id *)(a1 + 32) footnoteLabel];
    [v21 setFont:v19];

    double v22 = [*(id *)(a1 + 32) titleLabel];
    [v22 setProminence:1];

    double v23 = [*(id *)(a1 + 32) titleLabel];
    [v23 setTextAlignment:1];

    double v24 = [*(id *)(a1 + 32) footnoteLabel];
    [v24 setProminence:2];

    double v25 = [*(id *)(a1 + 32) footnoteLabel];
    [v25 setTextAlignment:1];

    v26 = [*(id *)(a1 + 32) contentView];
    [v26 setAlignment:3];

    v27 = [*(id *)(a1 + 32) thumbnailView];
    objc_msgSend(v27, "setMinimumLayoutSize:", v12, v13);

    v28 = [*(id *)(a1 + 32) thumbnailView];
    objc_msgSend(v28, "setMaximumLayoutSize:", v12, v13);

    +[SearchUIAppIconUtilities distanceToTopOfAppIconsForMultiResultCell];
    double v29 = v11 * 0.5;
    double v31 = v29 + v30;
    v32 = [*(id *)(a1 + 32) contentView];
    [v32 setLayoutMarginsRelativeArrangement:1];

    if (+[SearchUIUtilities isIpad]) {
      double v33 = 16.0;
    }
    else {
      double v33 = 10.0;
    }
    v34 = [*(id *)(a1 + 32) contentView];
    objc_msgSend(v34, "setDirectionalLayoutMargins:", v31, 4.0, v33, 4.0);

    v35 = [*(id *)(a1 + 32) contentView];
    [v17 baselineOffsetFromImage];
    double v37 = v29 + v36;
    v38 = [*(id *)(a1 + 32) titleLabel];
    [v38 effectiveFirstBaselineOffsetFromTop];
    double v40 = v37 - v39;
    v41 = [*(id *)(a1 + 32) thumbnailView];
    [v35 setCustomSpacing:v41 afterView:v40];

    v42 = [*(id *)(a1 + 32) contentView];
    v43 = [*(id *)(a1 + 32) titleLabel];
    [v42 setCustomSpacing:v43 afterView:0.0];
  }
  else
  {
    v44 = [*(id *)(a1 + 32) thumbnailView];
    [v44 setProminence:1];

    id v4 = [MEMORY[0x1E4FAE090] cachedFontForTextStyle:*MEMORY[0x1E4FB2950]];
    v45 = [*(id *)(a1 + 32) titleLabel];
    [v45 setFont:v4];

    v46 = [*(id *)(a1 + 32) footnoteLabel];
    [v46 setFont:v4];

    v47 = [*(id *)(a1 + 32) titleLabel];
    [v47 setProminence:0];

    if ([*(id *)(a1 + 40) contentsLeading]) {
      uint64_t v48 = 4;
    }
    else {
      uint64_t v48 = 1;
    }
    v49 = [*(id *)(a1 + 32) titleLabel];
    [v49 setTextAlignment:v48];

    v50 = [*(id *)(a1 + 32) footnoteLabel];
    [v50 setProminence:1];

    if ([*(id *)(a1 + 40) contentsLeading]) {
      uint64_t v51 = 4;
    }
    else {
      uint64_t v51 = 1;
    }
    v52 = [*(id *)(a1 + 32) footnoteLabel];
    [v52 setTextAlignment:v51];

    v53 = [*(id *)(a1 + 40) thumbnailOverlayText];

    if (v53) {
      [*(id *)(a1 + 32) buildThumbnailOverlayContainerIfNecessary];
    }
    if ([*(id *)(a1 + 40) contentsLeading]) {
      uint64_t v54 = 1;
    }
    else {
      uint64_t v54 = 3;
    }
    v55 = [*(id *)(a1 + 32) contentView];
    [v55 setAlignment:v54];

    v56 = [*(id *)(a1 + 32) thumbnailView];
    objc_msgSend(v56, "setMinimumLayoutSize:", 60.0, 60.0);

    v57 = [*(id *)(a1 + 32) thumbnailView];
    objc_msgSend(v57, "setMaximumLayoutSize:", 1.79769313e308, 1.79769313e308);

    v58 = [*(id *)(a1 + 32) contentView];
    int v59 = TLKSnippetModernizationEnabled();
    double v60 = *MEMORY[0x1E4F4BEC8];
    if (v59) {
      double v61 = 8.0;
    }
    else {
      double v61 = *MEMORY[0x1E4F4BEC8];
    }
    v62 = [*(id *)(a1 + 32) thumbnailView];
    [v58 setCustomSpacing:v62 afterView:v61];

    v63 = [*(id *)(a1 + 32) contentView];
    if (TLKSnippetModernizationEnabled()) {
      double v64 = 2.0;
    }
    else {
      double v64 = v60;
    }
    v65 = [*(id *)(a1 + 32) titleLabel];
    [v63 setCustomSpacing:v65 afterView:v64];

    v66 = [*(id *)(a1 + 32) contentView];
    [v66 setLayoutMarginsRelativeArrangement:0];

    double v17 = [*(id *)(a1 + 32) contentView];
    objc_msgSend(v17, "setDirectionalLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
  }

  v67 = *(void **)(a1 + 32);
  v68 = [*(id *)(a1 + 40) thumbnailOverlayText];
  [v67 updateThumbnailOverlayContainerWithText:v68];

  v69 = [*(id *)(a1 + 40) title];
  v70 = [*(id *)(a1 + 32) titleLabel];
  [v70 setSfText:v69];

  v71 = [*(id *)(a1 + 32) titleLabel];
  v72 = [v71 richText];
  uint64_t v73 = [v72 hasContent] ^ 1;
  v74 = [*(id *)(a1 + 32) titleLabel];
  [v74 setHidden:v73];

  v75 = [*(id *)(a1 + 40) footnote];
  v76 = [*(id *)(a1 + 32) footnoteLabel];
  [v76 setSfText:v75];

  v77 = [*(id *)(a1 + 32) footnoteLabel];
  v78 = [v77 richText];
  uint64_t v79 = [v78 hasContent] ^ 1;
  v80 = [*(id *)(a1 + 32) footnoteLabel];
  [v80 setHidden:v79];

  v81 = *(void **)(a1 + 32);
  return objc_msgSend(v81, "tlk_updateWithCurrentAppearance");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUIVerticalLayoutCardSectionView;
  [(SearchUIVerticalLayoutCardSectionView *)&v9 traitCollectionDidChange:v4];
  uint64_t v5 = [(SearchUIVerticalLayoutCardSectionView *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(SearchUIVerticalLayoutCardSectionView *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  double v6 = [(SearchUIVerticalLayoutCardSectionView *)self traitCollection];
  uint64_t v7 = [v6 _vibrancy];
  uint64_t v8 = [v4 _vibrancy];

  if (v7 != v8) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)SearchUIVerticalLayoutCardSectionView;
  [(SearchUIVerticalLayoutCardSectionView *)&v3 didMoveToWindow];
  [(SearchUIVerticalLayoutCardSectionView *)self tlk_updateWithCurrentAppearance];
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SearchUIVerticalLayoutCardSectionView;
  [(SearchUIVerticalLayoutCardSectionView *)&v27 tlk_updateForAppearance:v4];
  uint64_t v5 = [(SearchUICardSectionView *)self rowModel];
  double v6 = [v5 cardSection];

  if (v6)
  {
    uint64_t v7 = [v6 thumbnail];
    if ([(SearchUIVerticalLayoutCardSectionView *)self useAppIconMetrics])
    {
      uint64_t v8 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailView];
      [v8 minimumLayoutSize];
      double v10 = v9;
      double v12 = v11;

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v13 = +[SearchUIImage imageWithSFImage:v7];
        double v14 = v13;
        if (v10 >= v12) {
          double v15 = v12;
        }
        else {
          double v15 = v10;
        }
        [v13 setPreferredSymbolFontSize:v15 * 0.5];
        if ([v4 isDark]) {
          [v4 quaternaryColor];
        }
        else {
        double v19 = [v4 quinaryColor];
        }
        [v14 setCustomBackgroundColor:v19];

        char v20 = [v4 isDark];
        double v21 = [v4 primaryColor];
        double v22 = v21;
        if (v20)
        {
          [v14 setCustomForegroundColor:v21];
        }
        else
        {
          double v23 = [v21 colorWithAlphaComponent:0.75];
          [v14 setCustomForegroundColor:v23];
        }
        objc_msgSend(v14, "setSize:", v10, v12);
      }
      else
      {
        double v14 = v7;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        uint64_t v24 = 0;
LABEL_23:
        double v25 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailView];
        [v25 setAlignment:v24];

        v26 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailView];
        [v26 updateWithImage:v14];

        goto LABEL_24;
      }
      uint64_t v7 = v14;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v16 = NSString;
        double v17 = [v7 photoIdentifier];
        double v18 = [v16 stringWithFormat:@"photoIdentifier: %@", v17];
        [(SearchUIVerticalLayoutCardSectionView *)self setAccessibilityIdentifier:v18];
      }
      else
      {
        [(SearchUIVerticalLayoutCardSectionView *)self setAccessibilityIdentifier:0];
      }
    }
    uint64_t v24 = 2;
    double v14 = v7;
    goto LABEL_23;
  }
LABEL_24:
}

- (void)buildThumbnailOverlayContainerIfNecessary
{
  v32[3] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailOverlayContainer];

  if (!v3)
  {
    id v4 = objc_opt_new();
    [(SearchUIVerticalLayoutCardSectionView *)self setGradientImageView:v4];

    uint64_t v5 = [(SearchUIVerticalLayoutCardSectionView *)self gradientImageView];
    [v5 setAlpha:0.4];

    double v6 = (void *)MEMORY[0x1E4FB1818];
    uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v6 imageNamed:@"PXBadgeGradientRight" inBundle:v7 compatibleWithTraitCollection:0];
    double v9 = [(SearchUIVerticalLayoutCardSectionView *)self gradientImageView];
    [v9 setImage:v8];

    double v10 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:12.0];
    double v11 = objc_opt_new();
    [(SearchUIVerticalLayoutCardSectionView *)self setThumbnailOverlayLabel:v11];

    double v12 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailOverlayLabel];
    [v12 setFont:v10];

    if ([MEMORY[0x1E4FAE100] isLTR]) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = 0;
    }
    double v14 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailOverlayLabel];
    [v14 setTextAlignment:v13];

    double v15 = objc_opt_new();
    [(SearchUIVerticalLayoutCardSectionView *)self setThumbnailOverlayImageView:v15];

    double v16 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailOverlayImageView];
    [v16 setSymbolFont:v10];

    double v17 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailOverlayImageView];
    [v17 setProminence:0];

    id v18 = objc_alloc(MEMORY[0x1E4F4BEE8]);
    double v19 = [(SearchUIVerticalLayoutCardSectionView *)self gradientImageView];
    char v20 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailOverlayLabel];
    v32[1] = v20;
    double v21 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailOverlayImageView];
    v32[2] = v21;
    double v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3];
    double v23 = (void *)[v18 initWithArrangedSubviews:v22];
    [(SearchUIVerticalLayoutCardSectionView *)self setThumbnailOverlayContainer:v23];

    uint64_t v24 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailOverlayContainer];
    [v24 setHorizontalAlignment:4];

    double v25 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailOverlayContainer];
    [v25 setVerticalAlignment:4];

    v26 = [MEMORY[0x1E4FAE060] appearanceWithStyle:1];
    objc_super v27 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailOverlayContainer];
    [v26 overrideAppearanceForView:v27];

    v28 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailView];
    double v29 = [v28 imageView];
    double v30 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailOverlayContainer];
    [v29 addSubview:v30];

    double v31 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailOverlayContainer];
    +[SearchUIAutoLayout fillContainerWithView:v31];
  }
}

- (void)updateChevronVisible:(BOOL)a3 leaveSpaceForChevron:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SearchUIVerticalLayoutCardSectionView;
  [(SearchUICardSectionView *)&v4 updateChevronVisible:0 leaveSpaceForChevron:0];
}

- (void)updateThumbnailOverlayContainerWithText:(id)a3
{
  id v15 = a3;
  objc_super v4 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailOverlayContainer];
  [v4 setHidden:v15 == 0];

  uint64_t v5 = [(SearchUICardSectionView *)self section];
  double v6 = [v5 thumbnailOverlayText];
  uint64_t v7 = [v6 icons];
  uint64_t v8 = [v7 firstObject];

  double v9 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailOverlayImageView];
  [v9 updateWithImage:v8];

  double v10 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailOverlayImageView];
  [v10 setHidden:v8 == 0];

  double v11 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailOverlayLabel];
  [v11 setSfText:v15];

  if (v8)
  {
    int v12 = 0;
    BOOL v13 = 1;
  }
  else
  {
    double v11 = [v15 formattedTextPieces];
    if (v11)
    {
      int v12 = 0;
      BOOL v13 = 0;
    }
    else
    {
      double v10 = [v15 text];
      BOOL v13 = v10 == 0;
      int v12 = 1;
    }
  }
  double v14 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailOverlayLabel];
  [v14 setHidden:v13];

  if (v12) {
  if (!v8)
  }
}

- (void)containerViewDidLayoutArrangedSubviews:(id)a3
{
  id v26 = a3;
  id v4 = [(SearchUICardSectionView *)self contentView];
  if (v4 != v26)
  {
LABEL_2:

    goto LABEL_4;
  }
  uint64_t v5 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailView];
  double v6 = [v5 currentImage];
  uint64_t v7 = [(SearchUICardSectionView *)self section];
  uint64_t v8 = [v7 thumbnail];

  if (v6 == v8)
  {
    double v9 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailOverlayLabel];
    id v4 = [v9 font];

    double v10 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailOverlayImageView];
    double v11 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailView];
    [v11 bounds];
    objc_msgSend(v10, "cornerRadiusForSize:roundingStyle:", 1, v12, v13);
    double v15 = v14;

    double v16 = v15 * 1.74 + -15.11;
    if (v16 < 3.0) {
      double v16 = 3.0;
    }
    [MEMORY[0x1E4FAE100] deviceScaledRoundedValue:self forView:v16];
    double v18 = -v17;
    double v19 = -1.0 - v17;
    char v20 = (void *)MEMORY[0x1E4FAE100];
    [v4 descender];
    [v20 deviceScaledRoundedValue:self forView:v21 * 0.5];
    double v23 = v18 - v22;
    uint64_t v24 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailOverlayLabel];
    objc_msgSend(v24, "setCustomAlignmentRectInsets:", 0.0, 0.0, v23, v19);

    double v25 = [(SearchUIVerticalLayoutCardSectionView *)self thumbnailOverlayImageView];
    objc_msgSend(v25, "setCustomAlignmentRectInsets:", 0.0, 0.0, v18, v19);

    goto LABEL_2;
  }
LABEL_4:
}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  double v9 = (SearchUIVerticalLayoutCardSectionView *)a3;
  double v10 = v9;
  if (v9 == self && !a5 && [(SearchUIVerticalLayoutCardSectionView *)v9 useAppIconMetrics])
  {
    double v11 = [(SearchUIVerticalLayoutCardSectionView *)v10 titleLabel];
    double v12 = [v11 richText];
    if (([v12 hasContent] & 1) == 0)
    {

      goto LABEL_8;
    }
    double v13 = [(SearchUIVerticalLayoutCardSectionView *)v10 footnoteLabel];
    double v14 = [v13 richText];
    int v15 = [v14 hasContent];

    if (v15)
    {
      double v16 = [(SearchUIVerticalLayoutCardSectionView *)v10 titleLabel];
      objc_msgSend(v16, "textRectForBounds:limitedToNumberOfLines:", 1, 0.0, 0.0, width + -16.0, 1.79769313e308);
      double v18 = v17;

      double v19 = [(SearchUIVerticalLayoutCardSectionView *)v10 titleLabel];
      objc_msgSend(v19, "textRectForBounds:limitedToNumberOfLines:", 0, 0.0, 0.0, width + -16.0, 1.79769313e308);
      double v21 = v20;

      double v11 = [(SearchUIVerticalLayoutCardSectionView *)v10 footnoteLabel];
      [v11 setHidden:v21 > ceil(v18)];
LABEL_8:
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)SearchUIVerticalLayoutCardSectionView;
  -[SearchUICardSectionView containerView:willMeasureArrangedSubviewsFittingSize:forReason:](&v22, sel_containerView_willMeasureArrangedSubviewsFittingSize_forReason_, v10, a5, width, height);
}

- (SearchUIImageView)thumbnailView
{
  return self->_thumbnailView;
}

- (void)setThumbnailView:(id)a3
{
}

- (SearchUILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (SearchUILabel)footnoteLabel
{
  return self->_footnoteLabel;
}

- (void)setFootnoteLabel:(id)a3
{
}

- (NUIContainerBoxView)thumbnailOverlayContainer
{
  return self->_thumbnailOverlayContainer;
}

- (void)setThumbnailOverlayContainer:(id)a3
{
}

- (UIImageView)gradientImageView
{
  return self->_gradientImageView;
}

- (void)setGradientImageView:(id)a3
{
}

- (SearchUILabel)thumbnailOverlayLabel
{
  return self->_thumbnailOverlayLabel;
}

- (void)setThumbnailOverlayLabel:(id)a3
{
}

- (SearchUIImageView)thumbnailOverlayImageView
{
  return self->_thumbnailOverlayImageView;
}

- (void)setThumbnailOverlayImageView:(id)a3
{
}

- (BOOL)useAppIconMetrics
{
  return self->_useAppIconMetrics;
}

- (void)setUseAppIconMetrics:(BOOL)a3
{
  self->_useAppIconMetrics = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailOverlayImageView, 0);
  objc_storeStrong((id *)&self->_thumbnailOverlayLabel, 0);
  objc_storeStrong((id *)&self->_gradientImageView, 0);
  objc_storeStrong((id *)&self->_thumbnailOverlayContainer, 0);
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_thumbnailView, 0);
}

@end