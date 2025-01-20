@interface SearchUIHeroCardSectionView
+ (BOOL)fillsBackgroundWithContentForRowModel:(id)a3;
+ (BOOL)showsBackgroundImageViewForRowModel:(id)a3;
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
+ (int)defaultSeparatorStyleForRowModel:(id)a3;
- (BOOL)hasBackground;
- (BOOL)showBackgroundImageView;
- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5;
- (NUIContainerStackView)buttonStackView;
- (NUIContainerStackView)containerStackView;
- (NUIContainerStackView)labelsStackView;
- (NUIContainerStackView)thumbnailAndLabelsStackView;
- (SFImage)currentImage;
- (SearchUIButtonItemStackView)buttonItemStackView;
- (SearchUIHeroCardSectionView)initWithRowModel:(id)a3 feedbackDelegate:(id)a4;
- (SearchUIImageView)backgroundImageView;
- (SearchUIImageView)punchoutIndicatorImageView;
- (SearchUIImageView)thumbnailImageView;
- (SearchUILabel)subtitleLabel;
- (SearchUILabel)titleLabel;
- (UIVisualEffectView)punchoutIndicatorBackgroundBlurView;
- (id)highlightReferenceView;
- (id)setupContentView;
- (void)buttonPressed:(id)a3;
- (void)didUpdateWithImage:(id)a3;
- (void)setBackgroundImageView:(id)a3;
- (void)setButtonItemStackView:(id)a3;
- (void)setButtonStackView:(id)a3;
- (void)setContainerStackView:(id)a3;
- (void)setCurrentImage:(id)a3;
- (void)setLabelsStackView:(id)a3;
- (void)setPunchoutIndicatorBackgroundBlurView:(id)a3;
- (void)setPunchoutIndicatorImageView:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setThumbnailAndLabelsStackView:(id)a3;
- (void)setThumbnailImageView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)showGradientAnimated:(BOOL)a3;
- (void)updateButtonsForCardSection:(id)a3;
- (void)updatePunchoutIconForRowModel:(id)a3;
- (void)updatePunchoutImageWithBundleIdentifier:(id)a3;
- (void)updateWithButtonViews:(id)a3 visible:(BOOL)a4 addBackground:(BOOL)a5 animate:(BOOL)a6;
- (void)updateWithPunchoutImage:(id)a3;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIHeroCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

+ (BOOL)fillsBackgroundWithContentForRowModel:(id)a3
{
  id v4 = a3;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___SearchUIHeroCardSectionView;
  if (objc_msgSendSuper2(&v7, sel_fillsBackgroundWithContentForRowModel_, v4)) {
    char v5 = 1;
  }
  else {
    char v5 = [a1 showsBackgroundImageViewForRowModel:v4];
  }

  return v5;
}

+ (BOOL)showsBackgroundImageViewForRowModel:(id)a3
{
  id v3 = a3;
  id v4 = [v3 cardSection];
  char v5 = [v4 image];
  if (v5 && [v4 imageAlign] == 4)
  {
    v6 = [v3 backgroundColor];
    BOOL v7 = v6 == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (int)defaultSeparatorStyleForRowModel:(id)a3
{
  return 1;
}

- (SearchUIHeroCardSectionView)initWithRowModel:(id)a3 feedbackDelegate:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SearchUIHeroCardSectionView;
  id v4 = [(SearchUICardSectionView *)&v7 initWithRowModel:a3 feedbackDelegate:a4];
  if (v4)
  {
    if ((TLKSnippetModernizationEnabled() & 1) == 0)
    {
      +[SearchUIAutoLayout sectionCornerRadius];
      -[SearchUIHeroCardSectionView _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:");
    }
    if (initWithRowModel_feedbackDelegate__onceToken != -1) {
      dispatch_once(&initWithRowModel_feedbackDelegate__onceToken, &__block_literal_global_38);
    }
    char v5 = [(SearchUIHeroCardSectionView *)v4 layer];
    [v5 setShadowPathIsBounds:1];
  }
  return v4;
}

uint64_t __65__SearchUIHeroCardSectionView_initWithRowModel_feedbackDelegate___block_invoke()
{
  return +[SearchUIMediaUtilities prewarmMediaLibrary];
}

- (id)setupContentView
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  [v3 setDelegate:self];
  id v4 = objc_opt_new();
  [v4 setAlignment:3];
  [v4 setDelegate:self];
  [v4 setDisableCornerRounding:1];
  [(SearchUIHeroCardSectionView *)self setBackgroundImageView:v4];
  [v3 addArrangedSubview:v4];
  [v3 setAlignment:0 forView:v4 inAxis:0];
  v46 = v4;
  [v3 setAlignment:0 forView:v4 inAxis:1];
  char v5 = objc_opt_new();
  [v5 setProminence:0];
  v6 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
  [v5 setSymbolFont:v6];

  [v5 setSymbolWeight:7];
  v45 = v5;
  [(SearchUIHeroCardSectionView *)self setPunchoutIndicatorImageView:v5];
  objc_super v7 = objc_opt_new();
  v8 = [v7 layer];
  [v8 setMasksToBounds:1];

  [MEMORY[0x1E4FAE198] appIconCornerRadiusRatio];
  double v10 = v9 * 24.0;
  v11 = [v7 layer];
  [v11 setCornerRadius:v10];

  uint64_t v12 = *MEMORY[0x1E4F39EA8];
  v13 = [v7 layer];
  [v13 setCornerCurve:v12];

  LODWORD(v14) = 1148846080;
  objc_msgSend(v7, "setLayoutSize:withContentPriority:", 24.0, 24.0, v14);
  [v3 addArrangedSubview:v7];
  [v3 setAlignment:4 forView:v7 inAxis:0];
  v47 = v3;
  [v3 setAlignment:1 forView:v7 inAxis:1];
  id v15 = objc_alloc(MEMORY[0x1E4F4BEE8]);
  v16 = [(SearchUIHeroCardSectionView *)self punchoutIndicatorImageView];
  v51[0] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
  v18 = (void *)[v15 initWithArrangedSubviews:v17];

  [v18 setHorizontalAlignment:3];
  [v18 setVerticalAlignment:3];
  v19 = [v7 contentView];
  [v19 addSubview:v18];

  v44 = v18;
  +[SearchUIAutoLayout fillContainerWithView:v18];
  [(SearchUIHeroCardSectionView *)self setPunchoutIndicatorBackgroundBlurView:v7];
  v20 = objc_opt_new();
  LODWORD(v21) = 1148846080;
  [v20 setContentHuggingPriority:0 forAxis:v21];
  LODWORD(v22) = 1148846080;
  [v20 setContentCompressionResistancePriority:0 forAxis:v22];
  [(SearchUIHeroCardSectionView *)self setThumbnailImageView:v20];
  v23 = objc_opt_new();
  [(SearchUIHeroCardSectionView *)self setTitleLabel:v23];
  v24 = objc_opt_new();
  v25 = [MEMORY[0x1E4FAE090] cachedFontForTextStyle:*MEMORY[0x1E4FB28D0] isShort:TLKSnippetModernizationEnabled() ^ 1 isBold:0];
  [v24 setFont:v25];

  [v24 setProminence:1];
  [(SearchUIHeroCardSectionView *)self setSubtitleLabel:v24];
  v26 = objc_opt_new();
  [(SearchUIHeroCardSectionView *)self setButtonStackView:v26];

  v27 = [(SearchUIHeroCardSectionView *)self buttonStackView];
  [v27 setDistribution:1];

  v28 = [(SearchUIHeroCardSectionView *)self buttonStackView];
  [v28 setSpacing:8.0];

  v29 = [(SearchUIHeroCardSectionView *)self buttonStackView];
  +[SearchUIAutoLayout requireIntrinsicSizeForView:v29];

  id v30 = objc_alloc(MEMORY[0x1E4F4BF00]);
  v43 = v24;
  v50[0] = v23;
  v50[1] = v24;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
  v32 = (void *)[v30 initWithArrangedSubviews:v31];

  [v32 setAxis:1];
  [v32 setSpacing:2.0];
  LODWORD(v33) = 1148846080;
  [v32 setContentCompressionResistancePriority:1 forAxis:v33];
  [(SearchUIHeroCardSectionView *)self setLabelsStackView:v32];
  v49[0] = v20;
  v49[1] = v32;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
  if (TLKSnippetModernizationEnabled())
  {
    v35 = objc_opt_new();
    [v35 setShouldReverseButtonOrder:1];
    [(SearchUIHeroCardSectionView *)self setButtonItemStackView:v35];
    uint64_t v36 = [v34 arrayByAddingObject:v35];

    v34 = (void *)v36;
  }
  v37 = (void *)[objc_alloc(MEMORY[0x1E4F4BF00]) initWithArrangedSubviews:v34];
  [v37 setAlignment:1 forView:v20 inAxis:1];
  [MEMORY[0x1E4FAE1A0] makeContainerShadowCompatible:v37];
  [(SearchUIHeroCardSectionView *)self setThumbnailAndLabelsStackView:v37];
  id v38 = objc_alloc(MEMORY[0x1E4F4BF00]);
  v48[0] = v37;
  v39 = [(SearchUIHeroCardSectionView *)self buttonStackView];
  v48[1] = v39;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
  v41 = (void *)[v38 initWithArrangedSubviews:v40];

  [v41 setLayoutMarginsRelativeArrangement:1];
  [MEMORY[0x1E4FAE1A0] makeContainerShadowCompatible:v41];
  [(SearchUIHeroCardSectionView *)self setContainerStackView:v41];
  [v47 addArrangedSubview:v41];

  return v47;
}

- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5
{
  double width = a4.width;
  id v7 = a5;
  id v8 = [(SearchUICardSectionView *)self contentView];
  if (v8 != v7)
  {

LABEL_5:
    double width = *MEMORY[0x1E4F4BED8];
    double v10 = *(double *)(MEMORY[0x1E4F4BED8] + 8);
    goto LABEL_6;
  }
  BOOL v9 = [(SearchUIHeroCardSectionView *)self hasBackground];

  if (!v9) {
    goto LABEL_5;
  }
  double v10 = width * 10.0 * 0.0625;
LABEL_6:

  double v11 = width;
  double v12 = v10;
  result.height = v12;
  result.double width = v11;
  return result;
}

- (void)updateWithRowModel:(id)a3
{
  id v4 = a3;
  v87.receiver = self;
  v87.super_class = (Class)SearchUIHeroCardSectionView;
  [(SearchUICardSectionView *)&v87 updateWithRowModel:v4];
  [MEMORY[0x1E4FAE1A0] enableShadow:0 forView:self];
  char v5 = [v4 cardSection];
  uint64_t v6 = [v5 image];
  BOOL v7 = [(SearchUIHeroCardSectionView *)self hasBackground];
  if (v7)
  {
    id v8 = [v5 title];
    [v8 setMaxLines:1];

    BOOL v9 = [v5 subtitle];
    [v9 setMaxLines:1];
  }
  double v10 = (void *)MEMORY[0x1E4FAE090];
  if (v6 && [v5 imageAlign] != 1 && (TLKSnippetModernizationEnabled() & 1) != 0) {
    double v11 = (void *)MEMORY[0x1E4FB2990];
  }
  else {
    double v11 = (void *)MEMORY[0x1E4FB2988];
  }
  double v12 = [v10 cachedFontForTextStyle:*v11 isShort:TLKSnippetModernizationEnabled() ^ 1 isBold:1];
  v13 = [(SearchUIHeroCardSectionView *)self titleLabel];
  [v13 setFont:v12];

  double v14 = [v5 title];
  id v15 = [(SearchUIHeroCardSectionView *)self titleLabel];
  [v15 setSfText:v14];

  v16 = [(SearchUIHeroCardSectionView *)self titleLabel];
  v17 = [v16 richText];
  uint64_t v18 = [v17 hasContent] ^ 1;
  v19 = [(SearchUIHeroCardSectionView *)self titleLabel];
  [v19 setHidden:v18];

  v20 = [v5 subtitle];
  double v21 = [(SearchUIHeroCardSectionView *)self subtitleLabel];
  [v21 setSfText:v20];

  double v22 = [(SearchUIHeroCardSectionView *)self subtitleLabel];
  v23 = [v22 richText];
  uint64_t v24 = [v23 hasContent] ^ 1;
  v25 = [(SearchUIHeroCardSectionView *)self subtitleLabel];
  [v25 setHidden:v24];

  v26 = [(SearchUIHeroCardSectionView *)self titleLabel];
  int v27 = [v26 isHidden];
  BOOL v85 = v7;
  id v28 = v4;
  if (v27)
  {
    uint64_t v24 = [(SearchUIHeroCardSectionView *)self subtitleLabel];
    uint64_t v29 = [(id)v24 isHidden];
  }
  else
  {
    uint64_t v29 = 0;
  }
  id v30 = [(SearchUIHeroCardSectionView *)self labelsStackView];
  [v30 setHidden:v29];

  if (v27) {
  v31 = (void *)MEMORY[0x1E4FAE060];
  }
  v32 = [(SearchUIHeroCardSectionView *)self containerStackView];
  [v31 disableAppearanceOverrideForView:v32];

  double v33 = (void *)MEMORY[0x1E4FAE060];
  v34 = [(SearchUIHeroCardSectionView *)self punchoutIndicatorImageView];
  [v33 disableAppearanceOverrideForView:v34];

  v35 = (void *)MEMORY[0x1E4FAE060];
  uint64_t v36 = [(SearchUIHeroCardSectionView *)self punchoutIndicatorBackgroundBlurView];
  [v35 disableAppearanceOverrideForView:v36];

  int v37 = [v5 imageAlign];
  BOOL v38 = [(SearchUIHeroCardSectionView *)self showBackgroundImageView];
  BOOL v39 = v38;
  if (v6) {
    BOOL v40 = v37 == 0;
  }
  else {
    BOOL v40 = 0;
  }
  v41 = (void *)v6;
  int v42 = !v40;
  BOOL v43 = !v38;
  int v44 = v37 == 4 && !v38;
  if (v37 == 1) {
    unsigned int v45 = 1;
  }
  else {
    unsigned int v45 = v44;
  }
  v86 = v41;
  if (v41) {
    uint64_t v46 = v45;
  }
  else {
    uint64_t v46 = 0;
  }
  v47 = v4;
  if (v38)
  {
    v48 = [(SearchUIHeroCardSectionView *)self backgroundImageView];
    [v48 updateWithImage:v86];

    v49 = [(SearchUIHeroCardSectionView *)self backgroundImageView];
    v50 = [v49 imageView];
    v51 = [v50 image];

    v47 = v28;
    if (v51) {
      [(SearchUIHeroCardSectionView *)self showGradientAnimated:0];
    }
  }
  v52 = [(SearchUICardSectionView *)self contentView];
  v53 = [v52 layer];
  [v53 setMasksToBounds:v85];

  v54 = [(SearchUIHeroCardSectionView *)self backgroundImageView];
  [v54 setHidden:v43];

  if ((v42 ^ 1 | v46) == 1)
  {
    v55 = [(SearchUIHeroCardSectionView *)self thumbnailImageView];
    [v55 updateWithImage:v86];
  }
  v56 = [(SearchUIHeroCardSectionView *)self thumbnailImageView];
  [v56 setHidden:v42 & (v46 ^ 1)];

  v57 = [v47 backgroundColor];

  if (v57) {
    [(SearchUIHeroCardSectionView *)self showGradientAnimated:0];
  }
  [(SearchUIHeroCardSectionView *)self updateButtonsForCardSection:v5];
  [(SearchUIHeroCardSectionView *)self updatePunchoutIconForRowModel:v47];
  v58 = [(SearchUIHeroCardSectionView *)self thumbnailAndLabelsStackView];
  [v58 setAxis:v46];

  if (v46) {
    uint64_t v59 = 0;
  }
  else {
    uint64_t v59 = 3;
  }
  v60 = [(SearchUIHeroCardSectionView *)self thumbnailAndLabelsStackView];
  [v60 setAlignment:v59];

  if ((v46 & !v85) != 0) {
    uint64_t v61 = 1;
  }
  else {
    uint64_t v61 = 4;
  }
  v62 = [(SearchUIHeroCardSectionView *)self titleLabel];
  [v62 setTextAlignment:v61];

  v63 = [(SearchUIHeroCardSectionView *)self subtitleLabel];
  [v63 setTextAlignment:v61];

  double v64 = 4.0;
  if (v85) {
    double v64 = 16.0;
  }
  if (v42) {
    double v65 = v64;
  }
  else {
    double v65 = 12.0;
  }
  v66 = [(SearchUIHeroCardSectionView *)self thumbnailAndLabelsStackView];
  [v66 setSpacing:v65];

  v67 = [(SearchUICardSectionView *)self contentView];
  if (v39) {
    uint64_t v68 = 4;
  }
  else {
    uint64_t v68 = 3;
  }
  v69 = [(SearchUIHeroCardSectionView *)self containerStackView];
  [v67 setAlignment:v68 forView:v69 inAxis:1];

  v70 = [(SearchUICardSectionView *)self rowModel];
  int v71 = [v70 shouldFillAvailableSpace];

  double v73 = *MEMORY[0x1E4FB2848];
  double v72 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v74 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  if (v71)
  {
    double v75 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  }
  else if ([(SearchUIHeroCardSectionView *)self hasBackground] {
         && ([(SearchUICardSectionView *)self rowModel],
  }
             v76 = objc_claimAutoreleasedReturnValue(),
             [v76 backgroundColor],
             v77 = objc_claimAutoreleasedReturnValue(),
             v77,
             v76,
             !v77))
  {
    double v75 = 0.0;
    double v74 = -11.0;
    double v72 = -11.0;
    double v73 = 0.0;
  }
  else
  {
    double v75 = -12.0;
  }
  v78 = [(SearchUICardSectionView *)self contentView];
  objc_msgSend(v78, "setCustomAlignmentRectInsets:", v73, v72, v75, v74);

  if ([MEMORY[0x1E4FAE198] isSiri])
  {
    double v79 = 28.0 - 12.0;
  }
  else
  {
    if (v71) {
      v80 = &SearchUIHeroCardSectionViewCornerRadiusForLeadingTrailingView;
    }
    else {
      v80 = &SearchUIHeroCardSectionViewCornerRadius;
    }
    double v79 = *(double *)v80;
  }
  v81 = [(SearchUICardSectionView *)self contentView];
  objc_msgSend(v81, "tlks_setCornerRadius:withStyle:", *MEMORY[0x1E4F39EA8], v79);

  double v82 = v79 + -12.0;
  if (v79 + -12.0 < 7.0) {
    double v82 = 7.0;
  }
  double v83 = -v82;
  v84 = [(SearchUIHeroCardSectionView *)self punchoutIndicatorBackgroundBlurView];
  objc_msgSend(v84, "setCustomAlignmentRectInsets:", v83, 0.0, 0.0, v83);
}

- (BOOL)hasBackground
{
  id v3 = objc_opt_class();
  id v4 = [(SearchUICardSectionView *)self rowModel];
  LOBYTE(v3) = [v3 fillsBackgroundWithContentForRowModel:v4];

  return (char)v3;
}

- (BOOL)showBackgroundImageView
{
  id v3 = objc_opt_class();
  id v4 = [(SearchUICardSectionView *)self rowModel];
  LOBYTE(v3) = [v3 showsBackgroundImageViewForRowModel:v4];

  return (char)v3;
}

- (void)updatePunchoutIconForRowModel:(id)a3
{
  id v4 = a3;
  char v5 = [v4 cardSection];
  uint64_t v6 = [(SearchUIHeroCardSectionView *)self punchoutIndicatorBackgroundBlurView];
  [v6 setAlpha:0.0];

  BOOL v7 = [(SearchUIHeroCardSectionView *)self punchoutIndicatorBackgroundBlurView];
  [v7 setEffect:0];

  id v8 = [v5 command];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    double v10 = [v9 mediaMetadata];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __61__SearchUIHeroCardSectionView_updatePunchoutIconForRowModel___block_invoke;
    v23[3] = &unk_1E6E74208;
    id v24 = v5;
    v25 = self;
    id v26 = v10;
    id v27 = v9;
    id v11 = v9;
    id v12 = v10;
    +[SearchUIMediaUtilities predictionForMediaMetadata:v12 completion:v23];

LABEL_15:
    goto LABEL_16;
  }
  v13 = [v4 punchouts];
  id v12 = [v13 firstObject];

  if (v12
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v8 punchout], (id v12 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v14 = [v12 bundleIdentifier];

    if (v14)
    {
      id v15 = [v12 bundleIdentifier];
      [(SearchUIHeroCardSectionView *)self updatePunchoutImageWithBundleIdentifier:v15];
    }
    else
    {
      v16 = [v12 preferredOpenableURL];
      id v15 = v16;
      if (v16)
      {
        v17 = [v16 scheme];
        uint64_t v18 = [v17 lowercaseString];

        if (([v18 isEqualToString:@"http"] & 1) == 0
          && ([v18 isEqualToString:@"https"] & 1) == 0)
        {
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __61__SearchUIHeroCardSectionView_updatePunchoutIconForRowModel___block_invoke_3;
          v19[3] = &unk_1E6E72938;
          id v20 = v15;
          id v21 = v5;
          double v22 = self;
          +[SearchUIUtilities dispatchAsyncIfNecessary:v19];
        }
      }
    }

    goto LABEL_15;
  }
LABEL_16:
}

void __61__SearchUIHeroCardSectionView_updatePunchoutIconForRowModel___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__SearchUIHeroCardSectionView_updatePunchoutIconForRowModel___block_invoke_2;
  v8[3] = &unk_1E6E741E0;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void **)(a1 + 48);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v3;
  id v12 = v6;
  id v13 = *(id *)(a1 + 56);
  id v7 = v3;
  +[SearchUIUtilities dispatchMainIfNecessary:v8];
}

void __61__SearchUIHeroCardSectionView_updatePunchoutIconForRowModel___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) rowModel];
  id v4 = [v3 cardSection];

  if (v2 == v4)
  {
    id v10 = [*(id *)(a1 + 48) selectedBundleIdentifier];
    if (v10
      && ([*(id *)(a1 + 56) bundleIdentifiersToExclude],
          uint64_t v5 = objc_claimAutoreleasedReturnValue(),
          char v6 = [v5 containsObject:v10],
          v5,
          (v6 & 1) == 0))
    {
      [*(id *)(a1 + 64) setClientSelectedBundleIdentifier:v10];
      [*(id *)(a1 + 40) updatePunchoutImageWithBundleIdentifier:v10];
    }
    else
    {
      id v7 = [[SearchUISymbolImage alloc] initWithSymbolName:@"arrow.up.forward"];
      id v8 = [MEMORY[0x1E4FB14C8] effectWithStyle:4];
      id v9 = [*(id *)(a1 + 40) punchoutIndicatorBackgroundBlurView];
      [v9 setEffect:v8];

      [*(id *)(a1 + 40) updateWithPunchoutImage:v7];
    }
  }
}

void __61__SearchUIHeroCardSectionView_updatePunchoutIconForRowModel___block_invoke_3(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F22408]) initWithURL:*(void *)(a1 + 32) error:0];
  id v3 = [v2 bundleRecord];
  id v4 = [v3 bundleIdentifier];

  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__SearchUIHeroCardSectionView_updatePunchoutIconForRowModel___block_invoke_4;
    v7[3] = &unk_1E6E72938;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    id v8 = v5;
    uint64_t v9 = v6;
    id v10 = v4;
    +[SearchUIUtilities dispatchMainIfNecessary:v7];
  }
}

void __61__SearchUIHeroCardSectionView_updatePunchoutIconForRowModel___block_invoke_4(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) rowModel];
  id v4 = [v3 cardSection];

  if (v2 == v4)
  {
    id v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    [v5 updatePunchoutImageWithBundleIdentifier:v6];
  }
}

- (void)updatePunchoutImageWithBundleIdentifier:(id)a3
{
  id v4 = +[SearchUIAppIconImage appIconForBundleIdentifier:a3 variant:5];
  [(SearchUIHeroCardSectionView *)self updateWithPunchoutImage:v4];
}

- (void)updateWithPunchoutImage:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchUICardSectionView *)self section];
  uint64_t v6 = [v5 image];
  id v7 = [(SearchUIHeroCardSectionView *)self punchoutIndicatorImageView];
  [v7 setHidden:v6 == 0];

  id v8 = [(SearchUIHeroCardSectionView *)self punchoutIndicatorImageView];
  LOBYTE(v6) = [v8 isHidden];

  if ((v6 & 1) == 0)
  {
    uint64_t v9 = [(SearchUIHeroCardSectionView *)self punchoutIndicatorImageView];
    [v9 updateWithImage:v4];
  }
  id v10 = [(SearchUICardSectionView *)self section];
  uint64_t v11 = [v10 image];
  id v12 = [(SearchUIHeroCardSectionView *)self punchoutIndicatorBackgroundBlurView];
  [v12 setHidden:v11 == 0];

  id v13 = [(SearchUIHeroCardSectionView *)self punchoutIndicatorBackgroundBlurView];
  LOBYTE(v11) = [v13 isHidden];

  if ((v11 & 1) == 0)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __55__SearchUIHeroCardSectionView_updateWithPunchoutImage___block_invoke;
    v14[3] = &unk_1E6E72730;
    v14[4] = self;
    +[SearchUIUtilities performAnimatableChanges:v14];
  }
}

void __55__SearchUIHeroCardSectionView_updateWithPunchoutImage___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) punchoutIndicatorBackgroundBlurView];
  [v1 setAlpha:1.0];
}

- (void)updateButtonsForCardSection:(id)a3
{
  v79[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v63 = self;
  id v5 = [(SearchUIHeroCardSectionView *)self buttonStackView];
  [v5 setHidden:1];

  uint64_t v6 = [v4 buttonItems];
  id v7 = [v4 image];
  if (v7 && [v4 imageAlign]) {
    int v8 = 0;
  }
  else {
    int v8 = TLKSnippetModernizationEnabled();
  }

  uint64_t v9 = [(SearchUIHeroCardSectionView *)v63 buttonItemStackView];
  if (v8)
  {
    id v10 = [v4 buttonItems];
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v11 = [(SearchUICardSectionView *)v63 rowModel];
  id v12 = [(SearchUICardSectionView *)v63 feedbackDelegate];
  [v9 updateWithButtonItems:v10 maxButtonItems:2 buttonItemViewType:1 rowModel:v11 feedbackDelegate:v12];

  if (v8)
  {

LABEL_12:
    char v21 = 0;
    goto LABEL_37;
  }

  id v13 = [v6 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v15 = objc_opt_new();
    v79[0] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:1];
    [(SearchUIHeroCardSectionView *)v63 updateWithButtonViews:v16 visible:0 addBackground:1 animate:0];

    v17 = [v6 firstObject];
    uint64_t v18 = [v17 watchListItem];

    uint64_t v19 = +[SearchUIWatchListUtilities watchListTypeForType:isMediaContainer:](SearchUIWatchListUtilities, "watchListTypeForType:isMediaContainer:", [v18 type], objc_msgSend(v18, "isMediaContainer"));
    id v20 = [v18 watchListIdentifier];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __59__SearchUIHeroCardSectionView_updateButtonsForCardSection___block_invoke;
    v73[3] = &unk_1E6E74258;
    id v74 = v4;
    double v75 = v63;
    id v76 = v6;
    +[SearchUIWatchListUtilities fetchWatchListStateForWatchListIdentifier:v20 type:v19 completion:v73];

    goto LABEL_12;
  }
  id v61 = v4;
  double v22 = objc_opt_new();
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  v60 = v6;
  id v23 = v6;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v69 objects:v78 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    char v21 = 0;
    uint64_t v26 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v70 != v26) {
          objc_enumerationMutation(v23);
        }
        id v28 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v29 = v28;
          [v22 addObject:v29];
          id v30 = [v29 title];

          uint64_t v31 = [v30 length];
          v21 |= v31 != 0;
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v69 objects:v78 count:16];
    }
    while (v25);
  }
  else
  {
    char v21 = 0;
  }

  v32 = objc_opt_new();
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  obuint64_t j = v22;
  uint64_t v33 = [obj countByEnumeratingWithState:&v65 objects:v77 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v66;
    uint64_t v62 = *MEMORY[0x1E4FB2928];
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v66 != v35) {
          objc_enumerationMutation(obj);
        }
        int v37 = *(void **)(*((void *)&v65 + 1) + 8 * j);
        if (v21)
        {
          BOOL v38 = [*(id *)(*((void *)&v65 + 1) + 8 * j) image];
          BOOL v39 = +[SearchUIImage imageWithSFImage:v38];
          [(SearchUIHeroCardSectionView *)v63 effectiveScreenScale];
          double v41 = v40;
          int v42 = [MEMORY[0x1E4FAE060] bestAppearanceForView:v63];
          BOOL v43 = objc_msgSend(v39, "loadImageWithScale:isDarkStyle:", objc_msgSend(v42, "isDark"), v41);

          int v44 = [SearchUIHeroButton alloc];
          unsigned int v45 = [v37 title];
          uint64_t v46 = [v37 command];
          v47 = [(SearchUIHeroButton *)v44 initWithTitle:v45 image:v43 command:v46];
        }
        else
        {
          v47 = (SearchUIHeroButton *)objc_opt_new();
          v48 = [v37 image];
          BOOL v43 = +[SearchUITLKImageConverter imageForSFImage:v48];

          [(SearchUIHeroButton *)v47 setTlkImage:v43];
          unsigned int v45 = [MEMORY[0x1E4FAE090] cachedFontForTextStyle:v62];
          uint64_t v46 = [(SearchUIHeroButton *)v47 tlkImageView];
          [v46 setSymbolFont:v45];
        }

        [(SearchUIHeroButton *)v47 setButtonItem:v37];
        [v32 addObject:v47];
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v65 objects:v77 count:16];
    }
    while (v34);
  }

  if ([v32 count]) {
    [(SearchUIHeroCardSectionView *)v63 updateWithButtonViews:v32 visible:1 addBackground:0 animate:0];
  }

  uint64_t v6 = v60;
  id v4 = v61;
LABEL_37:
  +[SearchUIUtilities standardTableCellContentInset];
  if (TLKSnippetModernizationEnabled())
  {
    if ([(SearchUIHeroCardSectionView *)v63 hasBackground])
    {
      double v49 = 12.0;
      goto LABEL_42;
    }
  }
  else
  {
    double v49 = 8.0;
    if (v21) {
      goto LABEL_42;
    }
  }
  +[SearchUIUtilities standardTableCellContentInset];
  double v49 = v50;
LABEL_42:
  if ([(SearchUIHeroCardSectionView *)v63 hasBackground]) {
    double v51 = v49;
  }
  else {
    double v51 = 0.0;
  }
  v52 = [(SearchUIHeroCardSectionView *)v63 containerStackView];
  objc_msgSend(v52, "setLayoutMargins:", v49, v49, v51, v49);

  v53 = [(SearchUIHeroCardSectionView *)v63 containerStackView];
  [v53 setAxis:v21 & 1];

  double v54 = *MEMORY[0x1E4FAE1B8];
  v55 = [(SearchUIHeroCardSectionView *)v63 containerStackView];
  v56 = v55;
  double v57 = 16.0;
  if (v21)
  {
    uint64_t v58 = 0;
  }
  else
  {
    double v57 = v54;
    uint64_t v58 = 4;
  }
  [v55 setSpacing:v57];

  uint64_t v59 = [(SearchUIHeroCardSectionView *)v63 containerStackView];
  [v59 setAlignment:v58];
}

void __59__SearchUIHeroCardSectionView_updateButtonsForCardSection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [MEMORY[0x1E4F29060] isMainThread] ^ 1;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__SearchUIHeroCardSectionView_updateButtonsForCardSection___block_invoke_2;
  v9[3] = &unk_1E6E74230;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = v3;
  id v13 = v7;
  char v14 = v4;
  id v8 = v3;
  +[SearchUIUtilities dispatchMainIfNecessary:v9];
}

void __59__SearchUIHeroCardSectionView_updateButtonsForCardSection___block_invoke_2(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) rowModel];
  id v3 = [v10 cardSection];
  if (v2 == v3)
  {
    uint64_t v4 = *(void *)(a1 + 48);

    if (v4)
    {
      id v5 = [[SearchUICommandButton alloc] initWithWatchListState:*(void *)(a1 + 48)];
      uint64_t v6 = [*(id *)(a1 + 56) firstObject];
      [(SearchUICommandButton *)v5 setButtonItem:v6];

      id v7 = *(void **)(a1 + 40);
      v11[0] = v5;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      [v7 updateWithButtonViews:v8 visible:1 addBackground:1 animate:*(unsigned __int8 *)(a1 + 64)];

      uint64_t v9 = [*(id *)(a1 + 40) buttonStackView];
      [v9 layoutIfNeeded];
    }
  }
  else
  {
  }
}

- (void)updateWithButtonViews:(id)a3 visible:(BOOL)a4 addBackground:(BOOL)a5 animate:(BOOL)a6
{
  BOOL v28 = a6;
  BOOL v6 = a5;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [(SearchUIHeroCardSectionView *)self buttonStackView];
  [v9 setHidden:0];

  id v10 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        [v15 addTarget:self action:sel_buttonPressed_];
        id v16 = v15;
        if (v6)
        {
          v17 = objc_opt_new();
          [v17 _setCornerRadius:18.0];
          uint64_t v18 = v13;
          BOOL v19 = v6;
          id v20 = objc_alloc(MEMORY[0x1E4F4BEE8]);
          v36[0] = v17;
          v36[1] = v16;
          [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
          char v21 = v10;
          v23 = double v22 = self;
          uint64_t v24 = (void *)[v20 initWithArrangedSubviews:v23];

          self = v22;
          id v10 = v21;
          LODWORD(v25) = 1148846080;
          objc_msgSend(v24, "setLayoutSize:withContentPriority:", 36.0, 36.0, v25);
          [v24 setAlignment:3 forView:v16 inAxis:0];
          [v24 setAlignment:3 forView:v16 inAxis:1];

          id v16 = v24;
          BOOL v6 = v19;
          uint64_t v13 = v18;
        }
        [v10 addObject:v16];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v12);
  }

  uint64_t v26 = [(SearchUIHeroCardSectionView *)self buttonStackView];
  [v26 setArrangedSubviews:v10];

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __83__SearchUIHeroCardSectionView_updateWithButtonViews_visible_addBackground_animate___block_invoke;
  v30[3] = &unk_1E6E72758;
  v30[4] = self;
  BOOL v31 = a4;
  +[SearchUIUtilities performAnimatableChanges:v30 animated:v28];
}

void __83__SearchUIHeroCardSectionView_updateWithButtonViews_visible_addBackground_animate___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  double v2 = (double)*(unint64_t *)&a2;
  id v3 = [*(id *)(a1 + 32) buttonStackView];
  [v3 setAlpha:v2];
}

- (void)buttonPressed:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(SearchUICardSectionView *)self feedbackDelegate];
  id v5 = +[SearchUIUtilities environmentForDelegate:v4];

  if ([v9 conformsToProtocol:&unk_1F40BCF88]) {
    [v5 setWatchListDelegate:v9];
  }
  BOOL v6 = [v9 buttonItem];
  id v7 = [(SearchUICardSectionView *)self rowModel];
  id v8 = +[SearchUICommandHandler handlerForButton:v6 rowModel:v7 environment:v5];
  [v8 executeWithTriggerEvent:2];
}

- (void)didUpdateWithImage:(id)a3
{
  if ([(SearchUIHeroCardSectionView *)self showBackgroundImageView])
  {
    [(SearchUIHeroCardSectionView *)self showGradientAnimated:1];
  }
}

- (void)showGradientAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x1E4FAE1A0] enableShadow:1 forView:self];
  id v5 = [(SearchUIHeroCardSectionView *)self layer];
  [v5 shadowOpacity];
  int v7 = v6;

  id v8 = [(SearchUIHeroCardSectionView *)self layer];
  [v8 setShadowOpacity:0.0];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__SearchUIHeroCardSectionView_showGradientAnimated___block_invoke;
  v9[3] = &unk_1E6E74280;
  void v9[4] = self;
  int v10 = v7;
  [MEMORY[0x1E4FAE198] performAnimatableChanges:v9 animated:v3];
}

void __52__SearchUIHeroCardSectionView_showGradientAnimated___block_invoke(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 40);
  BOOL v3 = [*(id *)(a1 + 32) layer];
  LODWORD(v4) = v2;
  [v3 setShadowOpacity:v4];

  id v9 = [MEMORY[0x1E4FAE060] appearanceWithStyle:3];
  id v5 = [*(id *)(a1 + 32) containerStackView];
  [v9 overrideAppearanceForView:v5];

  int v6 = [*(id *)(a1 + 32) punchoutIndicatorImageView];
  [v9 overrideAppearanceForView:v6];

  int v7 = [MEMORY[0x1E4FAE060] appearanceWithStyle:2];
  id v8 = [*(id *)(a1 + 32) punchoutIndicatorBackgroundBlurView];
  [v7 overrideAppearanceForView:v8];
}

- (id)highlightReferenceView
{
  if ([(SearchUIHeroCardSectionView *)self hasBackground])
  {
    BOOL v3 = [(SearchUICardSectionView *)self contentView];
  }
  else
  {
    BOOL v3 = 0;
  }
  return v3;
}

- (SearchUIImageView)backgroundImageView
{
  return (SearchUIImageView *)objc_getProperty(self, a2, 784, 1);
}

- (void)setBackgroundImageView:(id)a3
{
}

- (SearchUIImageView)thumbnailImageView
{
  return (SearchUIImageView *)objc_getProperty(self, a2, 792, 1);
}

- (void)setThumbnailImageView:(id)a3
{
}

- (SearchUIImageView)punchoutIndicatorImageView
{
  return (SearchUIImageView *)objc_getProperty(self, a2, 800, 1);
}

- (void)setPunchoutIndicatorImageView:(id)a3
{
}

- (NUIContainerStackView)thumbnailAndLabelsStackView
{
  return (NUIContainerStackView *)objc_getProperty(self, a2, 808, 1);
}

- (void)setThumbnailAndLabelsStackView:(id)a3
{
}

- (NUIContainerStackView)labelsStackView
{
  return (NUIContainerStackView *)objc_getProperty(self, a2, 816, 1);
}

- (void)setLabelsStackView:(id)a3
{
}

- (SearchUILabel)titleLabel
{
  return (SearchUILabel *)objc_getProperty(self, a2, 824, 1);
}

- (void)setTitleLabel:(id)a3
{
}

- (SearchUILabel)subtitleLabel
{
  return (SearchUILabel *)objc_getProperty(self, a2, 832, 1);
}

- (void)setSubtitleLabel:(id)a3
{
}

- (NUIContainerStackView)containerStackView
{
  return (NUIContainerStackView *)objc_getProperty(self, a2, 840, 1);
}

- (void)setContainerStackView:(id)a3
{
}

- (NUIContainerStackView)buttonStackView
{
  return (NUIContainerStackView *)objc_getProperty(self, a2, 848, 1);
}

- (void)setButtonStackView:(id)a3
{
}

- (SFImage)currentImage
{
  return (SFImage *)objc_getProperty(self, a2, 856, 1);
}

- (void)setCurrentImage:(id)a3
{
}

- (SearchUIButtonItemStackView)buttonItemStackView
{
  return self->_buttonItemStackView;
}

- (void)setButtonItemStackView:(id)a3
{
}

- (UIVisualEffectView)punchoutIndicatorBackgroundBlurView
{
  return (UIVisualEffectView *)objc_getProperty(self, a2, 872, 1);
}

- (void)setPunchoutIndicatorBackgroundBlurView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_punchoutIndicatorBackgroundBlurView, 0);
  objc_storeStrong((id *)&self->_buttonItemStackView, 0);
  objc_storeStrong((id *)&self->_currentImage, 0);
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_containerStackView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_labelsStackView, 0);
  objc_storeStrong((id *)&self->_thumbnailAndLabelsStackView, 0);
  objc_storeStrong((id *)&self->_punchoutIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_thumbnailImageView, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
}

@end