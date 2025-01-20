@interface SearchUIMaskedLabelsStackView
+ (Class)layerClass;
- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5;
- (NSString)typedString;
- (SearchUIMaskedLabelsStackView)init;
- (TLKLabel)bridgeLabel;
- (TLKLabel)completionLabel;
- (TLKLabel)extensionLabel;
- (UIColor)completionFillColor;
- (UIFont)font;
- (UIView)extensionLabelBackgroundView;
- (UIView)fillerView;
- (UIView)gradientView;
- (double)completionStringOffset;
- (void)containerViewDidLayoutArrangedSubviews:(id)a3;
- (void)layoutMasksAndLabels;
- (void)resetStringOffset;
- (void)setCompletionFillColor:(id)a3;
- (void)setCompletionStringOffset:(double)a3;
- (void)setExtensionLabelBackgroundView:(id)a3;
- (void)setFillerView:(id)a3;
- (void)setFont:(id)a3;
- (void)setGradientView:(id)a3;
- (void)setTypedString:(id)a3;
@end

@implementation SearchUIMaskedLabelsStackView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SearchUIMaskedLabelsStackView)init
{
  v36[4] = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)SearchUIMaskedLabelsStackView;
  v2 = [(SearchUIMaskedLabelsStackView *)&v35 init];
  v3 = v2;
  if (v2)
  {
    [(SearchUIMaskedLabelsStackView *)v2 setDelegate:v2];
    [(NUIContainerStackView *)v3 setSpacing:0.0];
    uint64_t v4 = [MEMORY[0x1E4FAE0F8] primaryLabel];
    completionLabel = v3->_completionLabel;
    v3->_completionLabel = (TLKLabel *)v4;

    [(TLKLabel *)v3->_completionLabel setLineBreakMode:2];
    uint64_t v6 = [MEMORY[0x1E4FAE0F8] secondaryLabel];
    bridgeLabel = v3->_bridgeLabel;
    v3->_bridgeLabel = (TLKLabel *)v6;

    [(TLKLabel *)v3->_bridgeLabel setLineBreakMode:2];
    uint64_t v8 = [MEMORY[0x1E4FAE0F8] secondaryLabel];
    extensionLabel = v3->_extensionLabel;
    v3->_extensionLabel = (TLKLabel *)v8;

    [(TLKLabel *)v3->_extensionLabel setLineBreakMode:2];
    v10 = [(SearchUIMaskedLabelsStackView *)v3 bridgeLabel];
    LODWORD(v11) = 1148846080;
    [v10 setContentHuggingPriority:0 forAxis:v11];

    v12 = [(SearchUIMaskedLabelsStackView *)v3 completionLabel];
    LODWORD(v13) = 1148829696;
    [v12 setContentHuggingPriority:0 forAxis:v13];

    v14 = [(SearchUIMaskedLabelsStackView *)v3 completionLabel];
    LODWORD(v15) = 1148846080;
    [v14 setContentCompressionResistancePriority:0 forAxis:v15];

    v16 = [(SearchUIMaskedLabelsStackView *)v3 extensionLabel];
    LODWORD(v17) = 1148829696;
    [v16 setContentHuggingPriority:0 forAxis:v17];

    v18 = [(SearchUIMaskedLabelsStackView *)v3 extensionLabel];
    LODWORD(v19) = 1132068864;
    [v18 setContentCompressionResistancePriority:0 forAxis:v19];

    v20 = (void *)[objc_alloc(MEMORY[0x1E4FAE120]) initWithProminence:3];
    [(SearchUIMaskedLabelsStackView *)v3 setExtensionLabelBackgroundView:v20];
    v21 = [(SearchUIMaskedLabelsStackView *)v3 extensionLabelBackgroundView];
    objc_msgSend(v21, "tlks_setCornerRadius:withStyle:", *MEMORY[0x1E4F39EA8], 2.0);

    v22 = [(SearchUIMaskedLabelsStackView *)v3 extensionLabelBackgroundView];
    [(SearchUIMaskedLabelsStackView *)v3 addSubview:v22];

    [(NUIContainerStackView *)v3 setSpacing:0.0];
    v23 = objc_opt_new();
    [(SearchUIMaskedLabelsStackView *)v3 setGradientView:v23];

    v24 = objc_opt_new();
    [(SearchUIMaskedLabelsStackView *)v3 setFillerView:v24];

    v25 = [(SearchUIMaskedLabelsStackView *)v3 fillerView];
    LODWORD(v26) = 1.0;
    [v25 setContentCompressionResistancePriority:0 forAxis:v26];

    v27 = [(SearchUIMaskedLabelsStackView *)v3 completionLabel];
    v36[0] = v27;
    v28 = [(SearchUIMaskedLabelsStackView *)v3 bridgeLabel];
    v36[1] = v28;
    v29 = [(SearchUIMaskedLabelsStackView *)v3 extensionLabel];
    v36[2] = v29;
    v30 = [(SearchUIMaskedLabelsStackView *)v3 fillerView];
    v36[3] = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];
    [(SearchUIMaskedLabelsStackView *)v3 setArrangedSubviews:v31];

    v32 = [(SearchUIMaskedLabelsStackView *)v3 bridgeLabel];
    [(SearchUIMaskedLabelsStackView *)v3 setAlignment:3 forView:v32 inAxis:1];

    v33 = [(SearchUIMaskedLabelsStackView *)v3 extensionLabel];
    [(SearchUIMaskedLabelsStackView *)v3 setAlignment:3 forView:v33 inAxis:1];
  }
  return v3;
}

- (void)setFont:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    double v17 = v5;
    if ((-[UIFont isEqual:](self->_font, "isEqual:") & 1) == 0)
    {
      objc_storeStrong((id *)&self->_font, a3);
      uint64_t v6 = [(SearchUIMaskedLabelsStackView *)self completionLabel];
      [v6 setFont:v17];

      v7 = (void *)MEMORY[0x1E4FB08E0];
      double v8 = 15.0;
      if (!+[SearchUIUtilities isIpad]
        && !+[SearchUIUtilities isLargeIpad])
      {
        [v17 pointSize];
        double v8 = v9 + -2.0;
      }
      v10 = [v7 systemFontOfSize:v8];
      double v11 = [(SearchUIMaskedLabelsStackView *)self extensionLabel];
      [v11 setFont:v10];

      v12 = [(SearchUIMaskedLabelsStackView *)self extensionLabel];
      double v13 = [v12 font];
      v14 = [(SearchUIMaskedLabelsStackView *)self bridgeLabel];
      [v14 setFont:v13];

      [(SearchUIMaskedLabelsStackView *)self resetStringOffset];
      double v15 = [(SearchUIMaskedLabelsStackView *)self extensionLabel];
      v16 = [(SearchUIMaskedLabelsStackView *)self extensionLabel];
      [v16 intrinsicContentSize];
      [v15 setMaximumLayoutSize:3.40282347e38];
    }
  }
  MEMORY[0x1F4181820]();
}

- (void)setTypedString:(id)a3
{
  uint64_t v5 = (uint64_t)a3;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v5 = [(id)v5 isEqualToString:self->_typedString];
    uint64_t v6 = v7;
    if ((v5 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_typedString, a3);
      uint64_t v5 = [(SearchUIMaskedLabelsStackView *)self resetStringOffset];
      uint64_t v6 = v7;
    }
  }
  MEMORY[0x1F41817F8](v5, v6);
}

- (void)resetStringOffset
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = [(SearchUIMaskedLabelsStackView *)self typedString];

  if (v3)
  {
    uint64_t v4 = [(SearchUIMaskedLabelsStackView *)self typedString];
    uint64_t v8 = *MEMORY[0x1E4FB06F8];
    uint64_t v5 = [(SearchUIMaskedLabelsStackView *)self completionLabel];
    uint64_t v6 = [v5 font];
    v9[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [v4 sizeWithAttributes:v7];
    -[SearchUIMaskedLabelsStackView setCompletionStringOffset:](self, "setCompletionStringOffset:");

    [(SearchUIMaskedLabelsStackView *)self setNeedsLayout];
  }
}

- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v10 = a4;
  uint64_t v11 = [(SearchUIMaskedLabelsStackView *)self extensionLabel];
  if ((id)v11 == v10)
  {
  }
  else
  {
    v12 = (void *)v11;
    id v13 = [(SearchUIMaskedLabelsStackView *)self bridgeLabel];

    if (v13 != v10) {
      goto LABEL_7;
    }
  }
  [MEMORY[0x1E4FAE100] deviceScaledRoundedValue:self forView:2.0];
  double y = y + v14;
  id v15 = [(SearchUIMaskedLabelsStackView *)self bridgeLabel];

  if (v15 == v10) {
    double x = x + (double)[MEMORY[0x1E4FAE100] isLTR];
  }
LABEL_7:

  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (void)containerViewDidLayoutArrangedSubviews:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __72__SearchUIMaskedLabelsStackView_containerViewDidLayoutArrangedSubviews___block_invoke;
  v3[3] = &unk_1E6E72730;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
}

uint64_t __72__SearchUIMaskedLabelsStackView_containerViewDidLayoutArrangedSubviews___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutMasksAndLabels];
}

- (void)layoutMasksAndLabels
{
  [(SearchUIMaskedLabelsStackView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(SearchUIMaskedLabelsStackView *)self gradientView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = [(SearchUIMaskedLabelsStackView *)self extensionLabel];
  id v13 = [v12 font];
  [v13 ascender];
  double v15 = v14;
  double v16 = [(SearchUIMaskedLabelsStackView *)self extensionLabel];
  double v17 = [v16 font];
  [v17 descender];
  double v19 = v15 - v18;

  v20 = (void *)MEMORY[0x1E4FAE100];
  v21 = [(SearchUIMaskedLabelsStackView *)self completionLabel];
  v22 = [v21 font];
  [v22 ascender];
  double v24 = v23;
  v25 = [(SearchUIMaskedLabelsStackView *)self completionLabel];
  double v26 = [v25 font];
  [v26 descender];
  [v20 deviceScaledRoundedValue:self forView:v24 - v27];
  double v29 = v28;

  v30 = (void *)MEMORY[0x1E4FAE100];
  v31 = [(SearchUIMaskedLabelsStackView *)self extensionLabel];
  v32 = [v31 font];
  [v32 descender];
  [v30 deviceScaledRoundedValue:self forView:(v29 - v19) * 0.5 - v33];
  double v35 = v34;

  v36 = [(SearchUIMaskedLabelsStackView *)self fillerView];
  [v36 frame];
  if (v37 >= v35)
  {
    [(SearchUIMaskedLabelsStackView *)self setMaskView:0];
  }
  else
  {
    v38 = [(SearchUIMaskedLabelsStackView *)self gradientView];
    [(SearchUIMaskedLabelsStackView *)self setMaskView:v38];
  }
  v39 = [(SearchUIMaskedLabelsStackView *)self completionLabel];
  [v39 alpha];
  double v41 = v40;

  if (v41 != 0.0)
  {
    if ([MEMORY[0x1E4FAE198] isMacOS]) {
      double v42 = 3.0;
    }
    else {
      double v42 = 0.0;
    }
    v43 = [(SearchUIMaskedLabelsStackView *)self completionLabel];
    [v43 frame];
    double v45 = v44;
    double v47 = v46;
    double v49 = v48;
    CGFloat v51 = v50;

    v52 = [(SearchUIMaskedLabelsStackView *)self extensionLabel];
    char v53 = [v52 isHidden];

    if ((v53 & 1) == 0)
    {
      v54 = [(SearchUIMaskedLabelsStackView *)self extensionLabel];
      [v54 frame];
      v96.origin.CGFloat x = v55;
      v96.origin.CGFloat y = v56;
      v96.size.CGFloat width = v57;
      v96.size.CGFloat height = v58;
      v90.origin.CGFloat x = v45;
      v90.origin.CGFloat y = v47;
      v90.size.CGFloat width = v49;
      v90.size.CGFloat height = v51;
      CGRect v91 = CGRectUnion(v90, v96);
      CGFloat x = v91.origin.x;
      CGFloat y = v91.origin.y;
      CGFloat width = v91.size.width;
      CGFloat height = v91.size.height;

      v92.origin.CGFloat x = x;
      v92.origin.CGFloat y = y;
      v92.size.CGFloat width = width;
      v92.size.CGFloat height = height;
      CGRect v93 = CGRectInset(v92, v42, 0.0);
      double v45 = v93.origin.x;
      double v47 = v93.origin.y;
      double v49 = v93.size.width;
    }
    if ([MEMORY[0x1E4FAE100] isLTR])
    {
      [(SearchUIMaskedLabelsStackView *)self completionStringOffset];
      double v64 = v63;
    }
    else
    {
      double v64 = -v35;
    }
    [(SearchUIMaskedLabelsStackView *)self completionStringOffset];
    double v83 = v35 + v49 - v87;
    if (v83 > v42)
    {
      double v86 = v45 + v64;
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  v65 = [(SearchUIMaskedLabelsStackView *)self bridgeLabel];
  char v66 = [v65 isHidden];

  if (v66)
  {
LABEL_19:
    double v86 = *MEMORY[0x1E4F1DB28];
    double v47 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v83 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v29 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    goto LABEL_20;
  }
  v67 = [(SearchUIMaskedLabelsStackView *)self extensionLabel];
  [v67 frame];
  CGFloat v69 = v68;
  CGFloat v71 = v70;
  CGFloat v73 = v72;
  CGFloat v75 = v74;
  v76 = [(SearchUIMaskedLabelsStackView *)self bridgeLabel];
  [v76 frame];
  v97.origin.CGFloat x = v77;
  v97.origin.CGFloat y = v78;
  v97.size.CGFloat width = v79;
  v97.size.CGFloat height = v80;
  v94.origin.CGFloat x = v69;
  v94.origin.CGFloat y = v71;
  v94.size.CGFloat width = v73;
  v94.size.CGFloat height = v75;
  CGRect v95 = CGRectUnion(v94, v97);
  double v81 = v95.origin.x;
  double v47 = v95.origin.y;
  double v82 = v95.size.width;

  double v83 = v35 + v82;
  int v84 = [MEMORY[0x1E4FAE100] isLTR];
  double v85 = 0.0;
  if (!v84) {
    double v85 = v35;
  }
  double v86 = v81 - v85;
LABEL_20:
  id v88 = [(SearchUIMaskedLabelsStackView *)self extensionLabelBackgroundView];
  objc_msgSend(v88, "setFrame:", v86, v47, v83, v29);
}

- (TLKLabel)completionLabel
{
  return self->_completionLabel;
}

- (TLKLabel)bridgeLabel
{
  return self->_bridgeLabel;
}

- (TLKLabel)extensionLabel
{
  return self->_extensionLabel;
}

- (NSString)typedString
{
  return self->_typedString;
}

- (UIFont)font
{
  return self->_font;
}

- (UIColor)completionFillColor
{
  return self->_completionFillColor;
}

- (void)setCompletionFillColor:(id)a3
{
}

- (UIView)extensionLabelBackgroundView
{
  return (UIView *)objc_getProperty(self, a2, 752, 1);
}

- (void)setExtensionLabelBackgroundView:(id)a3
{
}

- (UIView)gradientView
{
  return (UIView *)objc_getProperty(self, a2, 760, 1);
}

- (void)setGradientView:(id)a3
{
}

- (double)completionStringOffset
{
  return self->_completionStringOffset;
}

- (void)setCompletionStringOffset:(double)a3
{
  self->_completionStringOffset = a3;
}

- (UIView)fillerView
{
  return (UIView *)objc_getProperty(self, a2, 776, 1);
}

- (void)setFillerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillerView, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_extensionLabelBackgroundView, 0);
  objc_storeStrong((id *)&self->_completionFillColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_typedString, 0);
  objc_storeStrong((id *)&self->_extensionLabel, 0);
  objc_storeStrong((id *)&self->_bridgeLabel, 0);
  objc_storeStrong((id *)&self->_completionLabel, 0);
}

@end