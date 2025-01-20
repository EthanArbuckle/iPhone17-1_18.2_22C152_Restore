@interface SearchUIMiniCardSectionView
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
- (BOOL)highlightFrameMatchesHighlightView;
- (SearchUIImageView)imageView;
- (SearchUILabel)subtitleLabel;
- (SearchUILabel)titleLabel;
- (id)setupContentView;
- (void)setImageView:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateImplicitVisibilityForWatchNowCardSection:(id)a3 animated:(BOOL)a4;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIMiniCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

- (id)setupContentView
{
  v33[2] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  [(SearchUIMiniCardSectionView *)self setImageView:v3];

  v4 = [(SearchUIMiniCardSectionView *)self imageView];
  LODWORD(v5) = 1148846080;
  objc_msgSend(v4, "setLayoutSize:withContentPriority:", 45.0, 45.0, v5);

  v6 = [(SearchUIMiniCardSectionView *)self imageView];
  +[SearchUIAutoLayout requireIntrinsicSizeForView:v6];

  v7 = objc_opt_new();
  [(SearchUIMiniCardSectionView *)self setTitleLabel:v7];

  uint64_t v8 = *MEMORY[0x1E4FB2950];
  v9 = [MEMORY[0x1E4FAE090] cachedFontForTextStyle:*MEMORY[0x1E4FB2950] isShort:TLKSnippetModernizationEnabled() ^ 1 isBold:0];
  v10 = [(SearchUIMiniCardSectionView *)self titleLabel];
  [v10 setFont:v9];

  v11 = [(SearchUIMiniCardSectionView *)self titleLabel];
  [v11 customAlignmentRectInsets];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  v18 = [(SearchUIMiniCardSectionView *)self titleLabel];
  objc_msgSend(v18, "setCustomAlignmentRectInsets:", -1.0, v13, v15, v17);

  v19 = +[TLKLabel secondaryLabel];
  [(SearchUIMiniCardSectionView *)self setSubtitleLabel:v19];

  v20 = [MEMORY[0x1E4FAE090] cachedFontForTextStyle:v8 isShort:TLKSnippetModernizationEnabled() ^ 1 isBold:0];
  v21 = [(SearchUIMiniCardSectionView *)self subtitleLabel];
  [v21 setFont:v20];

  id v22 = objc_alloc(MEMORY[0x1E4F4BF00]);
  v23 = [(SearchUIMiniCardSectionView *)self titleLabel];
  v33[0] = v23;
  v24 = [(SearchUIMiniCardSectionView *)self subtitleLabel];
  v33[1] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  v26 = (void *)[v22 initWithArrangedSubviews:v25];

  [v26 setAxis:1];
  [v26 setSpacing:2.0];
  id v27 = objc_alloc(MEMORY[0x1E4F4BF00]);
  v28 = [(SearchUIMiniCardSectionView *)self imageView];
  v32[0] = v28;
  v32[1] = v26;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  v30 = (void *)[v27 initWithArrangedSubviews:v29];

  [v30 setAlignment:1];
  [v30 setSpacing:10.0];
  [MEMORY[0x1E4FAE1A0] makeContainerShadowCompatible:v30];

  return v30;
}

- (void)updateWithRowModel:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SearchUIMiniCardSectionView;
  id v4 = a3;
  [(SearchUICardSectionView *)&v13 updateWithRowModel:v4];
  double v5 = objc_msgSend(v4, "cardSection", v13.receiver, v13.super_class);

  v6 = [v5 title];
  [v6 setMaxLines:1];

  v7 = [v5 title];
  uint64_t v8 = [(SearchUIMiniCardSectionView *)self titleLabel];
  [v8 setSfText:v7];

  v9 = [v5 subtitle];
  v10 = [(SearchUIMiniCardSectionView *)self subtitleLabel];
  [v10 setSfText:v9];

  v11 = [(SearchUIMiniCardSectionView *)self imageView];
  double v12 = [v5 image];
  [v11 updateWithImage:v12];
}

- (void)updateImplicitVisibilityForWatchNowCardSection:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = 0.0;
  [(SearchUIMiniCardSectionView *)self setAlpha:0.0];
  int v8 = [v6 isPlaceholder];

  if (!v8) {
    double v7 = 1.0;
  }
  [(SearchUIMiniCardSectionView *)self alpha];
  if (v7 != v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __87__SearchUIMiniCardSectionView_updateImplicitVisibilityForWatchNowCardSection_animated___block_invoke;
    v10[3] = &unk_1E6E730F0;
    v10[4] = self;
    *(double *)&v10[5] = v7;
    +[SearchUIUtilities performAnimatableChanges:v10 animated:v4];
  }
}

uint64_t __87__SearchUIMiniCardSectionView_updateImplicitVisibilityForWatchNowCardSection_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (BOOL)highlightFrameMatchesHighlightView
{
  return 0;
}

- (SearchUIImageView)imageView
{
  return (SearchUIImageView *)objc_getProperty(self, a2, 784, 1);
}

- (void)setImageView:(id)a3
{
}

- (SearchUILabel)titleLabel
{
  return (SearchUILabel *)objc_getProperty(self, a2, 792, 1);
}

- (void)setTitleLabel:(id)a3
{
}

- (SearchUILabel)subtitleLabel
{
  return (SearchUILabel *)objc_getProperty(self, a2, 800, 1);
}

- (void)setSubtitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end