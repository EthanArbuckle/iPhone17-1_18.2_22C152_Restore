@interface SearchUINewsCardSectionView
+ (BOOL)supportsRecyclingForCardSection:(id)a3;
- (BOOL)overlaysTextInImage;
- (CGRect)highlightFrame;
- (CGSize)largeThumbnailSize;
- (CGSize)smallThumbnailSize;
- (NUIContainerBoxView)baseBoxView;
- (NUIContainerBoxView)textContentBoxView;
- (NUIContainerStackView)textContentStackView;
- (SearchUIImageView)providerImageView;
- (SearchUIImageView)thumbnailImageView;
- (SearchUILabel)providerLabel;
- (SearchUILabel)subtitleLabel;
- (SearchUILabel)titleLabel;
- (SearchUINewsCardGradientView)gradientView;
- (UIEdgeInsets)textContentInset;
- (double)minThumbnailBottomSpacing;
- (double)providerImageVerticalOffset;
- (double)providerImageVerticalSizeDelta;
- (double)stackViewVerticalSpacing;
- (id)highlightReferenceView;
- (id)setupContentView;
- (void)didMoveToWindow;
- (void)setBaseBoxView:(id)a3;
- (void)setGradientView:(id)a3;
- (void)setOverlaysTextInImage:(BOOL)a3;
- (void)setProviderImageView:(id)a3;
- (void)setProviderLabel:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTextContentBoxView:(id)a3;
- (void)setTextContentStackView:(id)a3;
- (void)setThumbnailImageView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateLayoutForCardSection:(id)a3;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUINewsCardSectionView

+ (BOOL)supportsRecyclingForCardSection:(id)a3
{
  return 1;
}

- (double)providerImageVerticalSizeDelta
{
  [MEMORY[0x1E4FAE100] deviceScaledRoundedValue:self forView:-4.0];
  return result;
}

- (double)providerImageVerticalOffset
{
  [MEMORY[0x1E4FAE100] deviceScaledRoundedValue:self forView:-1.0];
  return result;
}

- (double)minThumbnailBottomSpacing
{
  v3 = (void *)MEMORY[0x1E4FAE100];
  int v4 = [MEMORY[0x1E4FAE198] isMacOS];
  double v5 = 8.0;
  if (v4) {
    double v5 = 6.0;
  }
  [v3 deviceScaledRoundedValue:self forView:v5];
  return result;
}

- (double)stackViewVerticalSpacing
{
  int v2 = [MEMORY[0x1E4FAE198] isMacOS];
  double result = 2.0;
  if (v2) {
    return 1.0;
  }
  return result;
}

- (UIEdgeInsets)textContentInset
{
  double v2 = -8.0;
  double v3 = -8.0;
  double v4 = -8.0;
  double v5 = -8.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGSize)smallThumbnailSize
{
  double v2 = 155.0;
  double v3 = 114.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)largeThumbnailSize
{
  [(SearchUINewsCardSectionView *)self smallThumbnailSize];
  double v4 = v3;
  [(SearchUINewsCardSectionView *)self smallThumbnailSize];
  double v6 = v5 * 1.8;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (CGRect)highlightFrame
{
  double v3 = [(SearchUINewsCardSectionView *)self thumbnailImageView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(SearchUINewsCardSectionView *)self thumbnailImageView];
  v13 = [v12 superview];
  -[SearchUINewsCardSectionView convertRect:fromView:](self, "convertRect:fromView:", v13, v5, v7, v9, v11);
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
  double v2 = [(SearchUINewsCardSectionView *)self thumbnailImageView];
  double v3 = [v2 highlightReferenceView];

  return v3;
}

- (id)setupContentView
{
  v63[1] = *MEMORY[0x1E4F143B8];
  double v3 = objc_opt_new();
  [(SearchUINewsCardSectionView *)self setThumbnailImageView:v3];

  double v4 = [(SearchUINewsCardSectionView *)self thumbnailImageView];
  [(SearchUINewsCardSectionView *)self smallThumbnailSize];
  objc_msgSend(v4, "setLayoutSize:withContentPriority:");

  double v5 = [(SearchUINewsCardSectionView *)self thumbnailImageView];
  [v5 setAlignment:2];

  double v6 = objc_opt_new();
  [(SearchUINewsCardSectionView *)self setProviderImageView:v6];

  double v7 = [(SearchUINewsCardSectionView *)self providerImageView];
  [v7 setProminence:1];

  double v8 = [(SearchUINewsCardSectionView *)self providerImageView];
  [v8 setAlignment:4];

  double v9 = +[TLKLabel primaryLabel];
  v55 = v9;
  [(SearchUINewsCardSectionView *)self setTitleLabel:v9];
  double v10 = +[TLKLabel secondaryLabel];
  double v11 = (void *)MEMORY[0x1E4FAE090];
  int v12 = [MEMORY[0x1E4FAE198] isMacOS];
  uint64_t v13 = *MEMORY[0x1E4FB2950];
  if (v12) {
    uint64_t v14 = *MEMORY[0x1E4FB2950];
  }
  else {
    uint64_t v14 = *MEMORY[0x1E4FB28F0];
  }
  double v15 = objc_msgSend(v11, "cachedFontForTextStyle:isBold:isMacStyle:", v14, 0, objc_msgSend(MEMORY[0x1E4FAE198], "isMacOS"));
  v57 = v10;
  [v10 setFont:v15];

  [(SearchUINewsCardSectionView *)self setSubtitleLabel:v10];
  double v16 = +[TLKLabel secondaryLabel];
  double v17 = objc_msgSend(MEMORY[0x1E4FAE090], "cachedFontForTextStyle:isBold:isMacStyle:", *MEMORY[0x1E4FB28E0], 1, objc_msgSend(MEMORY[0x1E4FAE198], "isMacOS"));
  [v16 setFont:v17];

  [(SearchUINewsCardSectionView *)self setProviderLabel:v16];
  double v18 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:v13 addingSymbolicTraits:32834 options:0];
  double v19 = *MEMORY[0x1E4FB0A00] + 0.1;
  uint64_t v62 = *MEMORY[0x1E4FB0950];
  uint64_t v60 = *MEMORY[0x1E4FB0A10];
  double v20 = [NSNumber numberWithDouble:v19];
  v61 = v20;
  double v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
  v63[0] = v21;
  v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:&v62 count:1];

  v54 = [v18 fontDescriptorByAddingAttributes:v56];

  double v22 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v54 size:0.0];
  [v9 setFont:v22];

  id v23 = objc_alloc(MEMORY[0x1E4F4BF00]);
  double v24 = [(SearchUINewsCardSectionView *)self providerImageView];
  v59[0] = v24;
  double v25 = [(SearchUINewsCardSectionView *)self providerLabel];
  v59[1] = v25;
  v26 = [(SearchUINewsCardSectionView *)self titleLabel];
  v59[2] = v26;
  v27 = [(SearchUINewsCardSectionView *)self subtitleLabel];
  v59[3] = v27;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:4];
  v29 = (void *)[v23 initWithArrangedSubviews:v28];

  [v29 setAxis:1];
  [v29 setAlignment:1];
  [v29 setDistribution:2];
  [(SearchUINewsCardSectionView *)self stackViewVerticalSpacing];
  objc_msgSend(v29, "setSpacing:");
  LODWORD(v30) = 1144750080;
  [v29 setContentCompressionResistancePriority:1 forAxis:v30];
  [(SearchUINewsCardSectionView *)self setTextContentStackView:v29];
  id v31 = objc_alloc(MEMORY[0x1E4F4BF00]);
  v32 = [(SearchUINewsCardSectionView *)self thumbnailImageView];
  v58[0] = v32;
  v58[1] = v29;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
  v34 = (void *)[v31 initWithArrangedSubviews:v33];

  [v34 setAxis:1];
  [v34 setAlignment:0];
  v35 = [(SearchUINewsCardSectionView *)self thumbnailImageView];
  [v34 setAlignment:0 forView:v35 inAxis:0];

  [(SearchUINewsCardSectionView *)self stackViewVerticalSpacing];
  objc_msgSend(v34, "setSpacing:");
  [(SearchUINewsCardSectionView *)self stackViewVerticalSpacing];
  double v37 = v36;
  [v16 effectiveBaselineOffsetFromContentBottom];
  double v39 = v37 + v38;
  [(SearchUINewsCardSectionView *)self providerImageVerticalOffset];
  double v41 = v39 + v40;
  v42 = [(SearchUINewsCardSectionView *)self providerImageView];
  [v29 setCustomSpacing:v42 afterView:v41];

  [MEMORY[0x1E4FAE1A0] makeContainerShadowCompatible:v34];
  v43 = [(SearchUINewsCardSectionView *)self providerImageView];
  double v44 = *MEMORY[0x1E4F4BEC8];
  v45 = [(SearchUINewsCardSectionView *)self providerLabel];
  [v45 intrinsicContentSize];
  double v47 = v46;
  [(SearchUINewsCardSectionView *)self providerImageVerticalSizeDelta];
  LODWORD(v49) = 1148846080;
  objc_msgSend(v43, "setLayoutSize:withContentPriority:", v44, v47 + v48, v49);

  v50 = objc_opt_new();
  [v50 setVerticalAlignment:0];
  [v50 setHorizontalAlignment:0];
  [(SearchUINewsCardSectionView *)self setBaseBoxView:v50];
  v51 = objc_opt_new();
  [v51 setVerticalAlignment:4];
  [v51 setHorizontalAlignment:0];
  [(SearchUINewsCardSectionView *)self setTextContentBoxView:v51];
  v52 = objc_opt_new();
  [(SearchUINewsCardSectionView *)self setGradientView:v52];

  return v34;
}

- (void)updateWithRowModel:(id)a3
{
  v37.receiver = self;
  v37.super_class = (Class)SearchUINewsCardSectionView;
  id v4 = a3;
  [(SearchUICardSectionView *)&v37 updateWithRowModel:v4];
  double v5 = objc_msgSend(v4, "cardSection", v37.receiver, v37.super_class);

  [(SearchUINewsCardSectionView *)self updateLayoutForCardSection:v5];
  double v6 = [(SearchUINewsCardSectionView *)self thumbnailImageView];
  double v7 = [v5 thumbnail];
  [v6 updateWithImage:v7];

  double v8 = [(SearchUINewsCardSectionView *)self providerImageView];
  double v9 = [v5 providerImage];
  [v8 updateWithImage:v9];

  double v10 = [v5 title];
  double v11 = [(SearchUINewsCardSectionView *)self titleLabel];
  [v11 setSfText:v10];

  int v12 = [v5 title];
  uint64_t v13 = [(SearchUINewsCardSectionView *)self titleLabel];
  [v13 setHidden:v12 == 0];

  uint64_t v14 = [v5 subtitle];
  double v15 = [(SearchUINewsCardSectionView *)self subtitleLabel];
  [v15 setSfText:v14];

  double v16 = [v5 subtitle];
  double v17 = [(SearchUINewsCardSectionView *)self subtitleLabel];
  [v17 setHidden:v16 == 0];

  double v18 = [v5 providerTitle];
  double v19 = [(SearchUINewsCardSectionView *)self providerLabel];
  [v19 setSfText:v18];

  double v20 = [v5 providerImage];
  BOOL v21 = v20 == 0;
  BOOL v22 = v20 != 0;

  id v23 = [(SearchUINewsCardSectionView *)self providerLabel];
  [v23 setHidden:v22];

  double v24 = [(SearchUINewsCardSectionView *)self providerImageView];
  [v24 setHidden:v21];

  if (![(SearchUINewsCardSectionView *)self overlaysTextInImage])
  {
    double v25 = [v5 providerImage];

    [(SearchUINewsCardSectionView *)self providerImageVerticalSizeDelta];
    if (v25)
    {
      double v27 = fmax(-v26, 0.0);
    }
    else
    {
      double v28 = fmax(v26, 0.0);
      v29 = [(SearchUINewsCardSectionView *)self providerLabel];
      [v29 effectiveBaselineOffsetFromContentBottom];
      double v31 = v28 + v30;
      [(SearchUINewsCardSectionView *)self providerImageVerticalOffset];
      double v27 = v31 + v32;
    }
    v33 = [(SearchUICardSectionView *)self contentView];
    [(SearchUINewsCardSectionView *)self minThumbnailBottomSpacing];
    double v35 = v27 + v34;
    double v36 = [(SearchUINewsCardSectionView *)self thumbnailImageView];
    [v33 setCustomSpacing:v36 afterView:v35];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUINewsCardSectionView;
  [(SearchUINewsCardSectionView *)&v9 traitCollectionDidChange:v4];
  double v5 = [(SearchUINewsCardSectionView *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(SearchUINewsCardSectionView *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  double v6 = [(SearchUINewsCardSectionView *)self traitCollection];
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
  v3.super_class = (Class)SearchUINewsCardSectionView;
  [(SearchUINewsCardSectionView *)&v3 didMoveToWindow];
  [(SearchUINewsCardSectionView *)self tlk_updateWithCurrentAppearance];
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SearchUINewsCardSectionView;
  [(SearchUINewsCardSectionView *)&v10 tlk_updateForAppearance:v4];
  double v5 = [(SearchUICardSectionView *)self rowModel];
  double v6 = [v5 cardSection];

  if ([v6 overlayTextInImage])
  {
    id v7 = [MEMORY[0x1E4FAE060] appearanceWithStyle:3];
  }
  else
  {
    id v7 = v4;
  }
  uint64_t v8 = v7;
  objc_super v9 = [(SearchUINewsCardSectionView *)self textContentStackView];
  [v8 overrideAppearanceForView:v9];
}

- (void)updateLayoutForCardSection:(id)a3
{
  id v43 = a3;
  int v4 = [v43 overlayTextInImage];
  BOOL v5 = v4 == [(SearchUINewsCardSectionView *)self overlaysTextInImage];
  double v6 = v43;
  if (!v5)
  {
    -[SearchUINewsCardSectionView setOverlaysTextInImage:](self, "setOverlaysTextInImage:", [v43 overlayTextInImage]);
    id v7 = [(SearchUINewsCardSectionView *)self textContentStackView];
    [v7 removeFromSuperview];

    uint64_t v8 = [(SearchUINewsCardSectionView *)self thumbnailImageView];
    [v8 removeFromSuperview];

    objc_super v9 = [(SearchUINewsCardSectionView *)self textContentBoxView];
    [v9 removeFromSuperview];

    objc_super v10 = [(SearchUINewsCardSectionView *)self baseBoxView];
    [v10 removeFromSuperview];

    double v11 = [(SearchUINewsCardSectionView *)self gradientView];
    [v11 removeFromSuperview];

    if ([v43 overlayTextInImage])
    {
      [(SearchUINewsCardSectionView *)self textContentInset];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v20 = [(SearchUINewsCardSectionView *)self textContentStackView];
      objc_msgSend(v20, "setCustomAlignmentRectInsets:", v13, v15, v17, v19);

      BOOL v21 = [(SearchUINewsCardSectionView *)self textContentBoxView];
      BOOL v22 = [(SearchUINewsCardSectionView *)self textContentStackView];
      [v21 addArrangedSubview:v22];

      id v23 = [(SearchUINewsCardSectionView *)self baseBoxView];
      double v24 = [(SearchUINewsCardSectionView *)self gradientView];
      [v23 addArrangedSubview:v24];

      double v25 = [(SearchUINewsCardSectionView *)self baseBoxView];
      double v26 = [(SearchUINewsCardSectionView *)self textContentBoxView];
      [v25 addArrangedSubview:v26];

      double v27 = [(SearchUICardSectionView *)self contentView];
      double v28 = [(SearchUINewsCardSectionView *)self thumbnailImageView];
      [v27 addArrangedSubview:v28];

      v29 = [(SearchUINewsCardSectionView *)self thumbnailImageView];
      double v30 = [v29 imageView];
      double v31 = [(SearchUINewsCardSectionView *)self baseBoxView];
      [v30 addSubview:v31];

      double v32 = [(SearchUINewsCardSectionView *)self baseBoxView];
      +[SearchUIAutoLayout fillContainerWithView:v32];

      v33 = [(SearchUINewsCardSectionView *)self thumbnailImageView];
      [(SearchUINewsCardSectionView *)self largeThumbnailSize];
      objc_msgSend(v33, "setLayoutSize:withHorizontalContentPriority:verticalContentPriority:");
    }
    else
    {
      double v34 = *MEMORY[0x1E4FB2848];
      double v35 = *(double *)(MEMORY[0x1E4FB2848] + 8);
      double v36 = *(double *)(MEMORY[0x1E4FB2848] + 16);
      double v37 = *(double *)(MEMORY[0x1E4FB2848] + 24);
      double v38 = [(SearchUINewsCardSectionView *)self textContentStackView];
      objc_msgSend(v38, "setCustomAlignmentRectInsets:", v34, v35, v36, v37);

      double v39 = [(SearchUICardSectionView *)self contentView];
      double v40 = [(SearchUINewsCardSectionView *)self thumbnailImageView];
      [v39 addArrangedSubview:v40];

      double v41 = [(SearchUICardSectionView *)self contentView];
      v42 = [(SearchUINewsCardSectionView *)self textContentStackView];
      [v41 addArrangedSubview:v42];

      v33 = [(SearchUINewsCardSectionView *)self thumbnailImageView];
      [(SearchUINewsCardSectionView *)self smallThumbnailSize];
      objc_msgSend(v33, "setLayoutSize:withContentPriority:");
    }

    double v6 = v43;
  }
}

- (NUIContainerBoxView)baseBoxView
{
  return (NUIContainerBoxView *)objc_getProperty(self, a2, 792, 1);
}

- (void)setBaseBoxView:(id)a3
{
}

- (NUIContainerBoxView)textContentBoxView
{
  return (NUIContainerBoxView *)objc_getProperty(self, a2, 800, 1);
}

- (void)setTextContentBoxView:(id)a3
{
}

- (NUIContainerStackView)textContentStackView
{
  return (NUIContainerStackView *)objc_getProperty(self, a2, 808, 1);
}

- (void)setTextContentStackView:(id)a3
{
}

- (SearchUINewsCardGradientView)gradientView
{
  return (SearchUINewsCardGradientView *)objc_getProperty(self, a2, 816, 1);
}

- (void)setGradientView:(id)a3
{
}

- (SearchUIImageView)thumbnailImageView
{
  return (SearchUIImageView *)objc_getProperty(self, a2, 824, 1);
}

- (void)setThumbnailImageView:(id)a3
{
}

- (SearchUIImageView)providerImageView
{
  return (SearchUIImageView *)objc_getProperty(self, a2, 832, 1);
}

- (void)setProviderImageView:(id)a3
{
}

- (SearchUILabel)providerLabel
{
  return (SearchUILabel *)objc_getProperty(self, a2, 840, 1);
}

- (void)setProviderLabel:(id)a3
{
}

- (SearchUILabel)titleLabel
{
  return (SearchUILabel *)objc_getProperty(self, a2, 848, 1);
}

- (void)setTitleLabel:(id)a3
{
}

- (SearchUILabel)subtitleLabel
{
  return (SearchUILabel *)objc_getProperty(self, a2, 856, 1);
}

- (void)setSubtitleLabel:(id)a3
{
}

- (BOOL)overlaysTextInImage
{
  return self->_overlaysTextInImage;
}

- (void)setOverlaysTextInImage:(BOOL)a3
{
  self->_overlaysTextInImage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_providerLabel, 0);
  objc_storeStrong((id *)&self->_providerImageView, 0);
  objc_storeStrong((id *)&self->_thumbnailImageView, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_textContentStackView, 0);
  objc_storeStrong((id *)&self->_textContentBoxView, 0);
  objc_storeStrong((id *)&self->_baseBoxView, 0);
}

@end