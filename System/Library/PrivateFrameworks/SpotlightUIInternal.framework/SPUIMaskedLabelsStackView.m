@interface SPUIMaskedLabelsStackView
+ (Class)layerClass;
- (BOOL)isRTL;
- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5;
- (NSDirectionalEdgeInsets)additionalPadding;
- (NSString)typedString;
- (SPUIMaskedLabelsStackView)init;
- (TLKProminenceView)extensionLabelProminenceView;
- (UIFont)font;
- (UILabel)bridgeLabel;
- (UILabel)completionLabel;
- (UILabel)extensionLabel;
- (UIView)fillerView;
- (UIView)gradientView;
- (double)completionStringOffset;
- (void)containerViewDidLayoutArrangedSubviews:(id)a3;
- (void)resetStringOffset;
- (void)setCompletionStringOffset:(double)a3;
- (void)setExtensionLabelProminenceView:(id)a3;
- (void)setFillerView:(id)a3;
- (void)setFont:(id)a3;
- (void)setGradientView:(id)a3;
- (void)setTypedString:(id)a3;
@end

@implementation SPUIMaskedLabelsStackView

- (SPUIMaskedLabelsStackView)init
{
  v36[4] = *MEMORY[0x263EF8340];
  v35.receiver = self;
  v35.super_class = (Class)SPUIMaskedLabelsStackView;
  v2 = [(SPUIMaskedLabelsStackView *)&v35 init];
  v3 = v2;
  if (v2)
  {
    [(SPUIMaskedLabelsStackView *)v2 setDelegate:v2];
    [(NUIContainerStackView *)v3 setSpacing:0.0];
    uint64_t v4 = objc_opt_new();
    completionLabel = v3->_completionLabel;
    v3->_completionLabel = (UILabel *)v4;

    [(UILabel *)v3->_completionLabel setLineBreakMode:2];
    uint64_t v6 = [MEMORY[0x263F7E3A8] tertiaryLabel];
    bridgeLabel = v3->_bridgeLabel;
    v3->_bridgeLabel = (UILabel *)v6;

    [(UILabel *)v3->_completionLabel setLineBreakMode:2];
    v8 = [MEMORY[0x263F7E3A8] tertiaryLabel];
    [(UILabel *)v8 setSupportsColorGlyphs:1];
    [(UILabel *)v8 setLineBreakMode:2];
    extensionLabel = v3->_extensionLabel;
    v3->_extensionLabel = v8;
    v10 = v8;

    v11 = [(SPUIMaskedLabelsStackView *)v3 bridgeLabel];
    LODWORD(v12) = 1148846080;
    [v11 setContentHuggingPriority:0 forAxis:v12];

    v13 = [(SPUIMaskedLabelsStackView *)v3 completionLabel];
    LODWORD(v14) = 1148829696;
    [v13 setContentHuggingPriority:0 forAxis:v14];

    v15 = [(SPUIMaskedLabelsStackView *)v3 completionLabel];
    LODWORD(v16) = 1148846080;
    [v15 setContentCompressionResistancePriority:0 forAxis:v16];

    v17 = [(SPUIMaskedLabelsStackView *)v3 extensionLabel];
    LODWORD(v18) = 1148829696;
    [v17 setContentHuggingPriority:0 forAxis:v18];

    v19 = [(SPUIMaskedLabelsStackView *)v3 extensionLabel];
    LODWORD(v20) = 1132068864;
    [v19 setContentCompressionResistancePriority:0 forAxis:v20];

    v21 = (void *)[objc_alloc(MEMORY[0x263F7E3B8]) initWithProminence:3];
    int v22 = [MEMORY[0x263F79140] enableFloatingWindow];
    double v23 = 8.0;
    if (v22) {
      double v23 = 4.0;
    }
    [v21 _setContinuousCornerRadius:v23];
    [(SPUIMaskedLabelsStackView *)v3 setExtensionLabelProminenceView:v21];
    v24 = [(SPUIMaskedLabelsStackView *)v3 extensionLabelProminenceView];
    [(SPUIMaskedLabelsStackView *)v3 addSubview:v24];

    [(NUIContainerStackView *)v3 setSpacing:0.0];
    v25 = objc_opt_new();
    [(SPUIMaskedLabelsStackView *)v3 setGradientView:v25];

    v26 = objc_opt_new();
    [(SPUIMaskedLabelsStackView *)v3 setFillerView:v26];

    v27 = [(SPUIMaskedLabelsStackView *)v3 fillerView];
    [v27 setContentCompressionResistancePriority:0 forAxis:0.0];

    v28 = [(SPUIMaskedLabelsStackView *)v3 completionLabel];
    v36[0] = v28;
    v29 = [(SPUIMaskedLabelsStackView *)v3 bridgeLabel];
    v36[1] = v29;
    v30 = [(SPUIMaskedLabelsStackView *)v3 extensionLabel];
    v36[2] = v30;
    v31 = [(SPUIMaskedLabelsStackView *)v3 fillerView];
    v36[3] = v31;
    v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:4];
    [(SPUIMaskedLabelsStackView *)v3 setArrangedSubviews:v32];

    LODWORD(v28) = [MEMORY[0x263F79140] enableFloatingWindow];
    if (v28)
    {
      v33 = [(SPUIMaskedLabelsStackView *)v3 completionLabel];
      [(NUIContainerStackView *)v3 setCustomSpacing:v33 afterView:2.0];
    }
  }
  return v3;
}

- (UIView)fillerView
{
  return (UIView *)objc_getProperty(self, a2, 768, 1);
}

void __68__SPUIMaskedLabelsStackView_containerViewDidLayoutArrangedSubviews___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) bounds];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  v10 = [*(id *)(a1 + 32) gradientView];
  objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);

  [*(id *)(a1 + 32) additionalPadding];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v19 = [*(id *)(a1 + 32) extensionLabel];
  double v20 = [v19 font];
  [v20 ascender];
  double v22 = v21;
  double v23 = [*(id *)(a1 + 32) extensionLabel];
  v24 = [v23 font];
  [v24 descender];
  double v26 = v22 - v25;

  v27 = (void *)MEMORY[0x263F7E3B0];
  v28 = [*(id *)(a1 + 32) completionLabel];
  v29 = [v28 font];
  [v29 ascender];
  double v31 = v30;
  v32 = [*(id *)(a1 + 32) completionLabel];
  v33 = [v32 font];
  [v33 descender];
  [v27 deviceScaledRoundedValue:*(void *)(a1 + 32) forView:v31 - v34];
  double v36 = v16 + v12 + v35;

  v37 = (void *)MEMORY[0x263F7E3B0];
  v38 = [*(id *)(a1 + 32) extensionLabel];
  v39 = [v38 font];
  [v39 descender];
  [v37 deviceScaledRoundedValue:*(void *)(a1 + 32) forView:(v36 - v26) * 0.5 - v40];
  double v42 = v18 + v41;

  v43 = [*(id *)(a1 + 32) fillerView];
  [v43 frame];
  v44 = *(void **)(a1 + 32);
  if (v45 >= v42)
  {
    [v44 setMaskView:0];
  }
  else
  {
    v46 = [v44 gradientView];
    [*(id *)(a1 + 32) setMaskView:v46];
  }
  v47 = [*(id *)(a1 + 32) completionLabel];
  [v47 alpha];
  double v49 = v48;

  v50 = *(void **)(a1 + 32);
  if (v49 == 0.0)
  {
    v68 = [v50 bridgeLabel];
    char v69 = [v68 isHidden];

    if (v69)
    {
      double v71 = *MEMORY[0x263F001A8];
      double v70 = *(double *)(MEMORY[0x263F001A8] + 8);
      double v72 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v36 = *(double *)(MEMORY[0x263F001A8] + 24);
    }
    else
    {
      v74 = [*(id *)(a1 + 32) extensionLabel];
      [v74 frame];
      CGFloat v76 = v75;
      CGFloat v78 = v77;
      CGFloat v80 = v79;
      CGFloat v82 = v81;
      v83 = [*(id *)(a1 + 32) bridgeLabel];
      [v83 frame];
      v100.origin.double x = v84;
      v100.origin.double y = v85;
      v100.size.double width = v86;
      v100.size.height = v87;
      v97.origin.double x = v76;
      v97.origin.double y = v78;
      v97.size.double width = v80;
      v97.size.height = v82;
      CGRect v98 = CGRectUnion(v97, v100);
      double x = v98.origin.x;
      double y = v98.origin.y;
      double width = v98.size.width;

      double v72 = v14 + v42 + width;
      int v91 = [*(id *)(a1 + 32) isRTL];
      double v92 = 0.0;
      if (v91) {
        double v92 = v42;
      }
      double v71 = x - v92;
      double v70 = y - v14 - v12;
    }
  }
  else
  {
    v51 = [v50 completionLabel];
    [v51 frame];
    double v53 = v52;
    double v55 = v54;
    double v57 = v56;
    CGFloat v59 = v58;

    v60 = [*(id *)(a1 + 32) extensionLabel];
    char v61 = [v60 isHidden];

    if ((v61 & 1) == 0)
    {
      v62 = [*(id *)(a1 + 32) extensionLabel];
      [v62 frame];
      v99.origin.double x = v63;
      v99.origin.double y = v64;
      v99.size.double width = v65;
      v99.size.height = v66;
      v95.origin.double x = v53;
      v95.origin.double y = v55;
      v95.size.double width = v57;
      v95.size.height = v59;
      CGRect v96 = CGRectUnion(v95, v99);
      double v53 = v96.origin.x;
      double v55 = v96.origin.y;
      double v57 = v96.size.width;
    }
    if ([*(id *)(a1 + 32) isRTL]) {
      double v67 = -v42;
    }
    else {
      [*(id *)(a1 + 32) completionStringOffset];
    }
    double v71 = v53 + v67 - v14;
    [*(id *)(a1 + 32) completionStringOffset];
    double v72 = v14 + v42 + v57 - v73;
    double v70 = v55 + v12 * -0.5;
  }
  id v93 = [*(id *)(a1 + 32) extensionLabelProminenceView];
  objc_msgSend(v93, "setFrame:", v71, v70, v72, v36);
}

- (UILabel)extensionLabel
{
  return self->_extensionLabel;
}

- (UILabel)bridgeLabel
{
  return self->_bridgeLabel;
}

- (UILabel)completionLabel
{
  return self->_completionLabel;
}

- (UIView)gradientView
{
  return (UIView *)objc_getProperty(self, a2, 752, 1);
}

- (TLKProminenceView)extensionLabelProminenceView
{
  return (TLKProminenceView *)objc_getProperty(self, a2, 744, 1);
}

- (BOOL)isRTL
{
  double v2 = [MEMORY[0x263F82438] sharedApplication];
  BOOL v3 = [v2 userInterfaceLayoutDirection] == 1;

  return v3;
}

- (NSDirectionalEdgeInsets)additionalPadding
{
  if ([MEMORY[0x263F67C78] isIpad])
  {
    double v2 = 0.0;
    double v3 = 4.0;
    double v4 = 1.0;
    double v5 = 1.0;
  }
  else
  {
    double v3 = *MEMORY[0x263F82250];
    double v4 = *(double *)(MEMORY[0x263F82250] + 8);
    double v5 = *(double *)(MEMORY[0x263F82250] + 16);
    double v2 = *(double *)(MEMORY[0x263F82250] + 24);
  }
  result.trailing = v2;
  result.bottom = v5;
  result.leading = v4;
  result.top = v3;
  return result;
}

- (void)setGradientView:(id)a3
{
}

- (void)setFillerView:(id)a3
{
}

- (void)setExtensionLabelProminenceView:(id)a3
{
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setFont:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    double v16 = v5;
    if ((-[UIFont isEqual:](self->_font, "isEqual:") & 1) == 0)
    {
      objc_storeStrong((id *)&self->_font, a3);
      double v6 = [(SPUIMaskedLabelsStackView *)self completionLabel];
      [v6 setFont:v16];

      double v7 = (void *)MEMORY[0x263F81708];
      char v8 = [MEMORY[0x263F79140] enableFloatingWindow];
      double v9 = 20.0;
      if ((v8 & 1) == 0)
      {
        objc_msgSend(v16, "pointSize", 20.0);
        double v9 = v10 + -2.0;
      }
      double v11 = [v7 systemFontOfSize:v9];
      double v12 = [(SPUIMaskedLabelsStackView *)self extensionLabel];
      [v12 setFont:v11];

      double v13 = [(SPUIMaskedLabelsStackView *)self extensionLabel];
      double v14 = [v13 font];
      double v15 = [(SPUIMaskedLabelsStackView *)self bridgeLabel];
      [v15 setFont:v14];

      [(SPUIMaskedLabelsStackView *)self resetStringOffset];
    }
  }
  MEMORY[0x270F9A790]();
}

- (void)resetStringOffset
{
  v9[1] = *MEMORY[0x263EF8340];
  double v3 = [(SPUIMaskedLabelsStackView *)self typedString];

  if (v3)
  {
    double v4 = [(SPUIMaskedLabelsStackView *)self typedString];
    uint64_t v8 = *MEMORY[0x263F814F0];
    id v5 = [(SPUIMaskedLabelsStackView *)self completionLabel];
    double v6 = [v5 font];
    v9[0] = v6;
    double v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [v4 sizeWithAttributes:v7];
    -[SPUIMaskedLabelsStackView setCompletionStringOffset:](self, "setCompletionStringOffset:");

    [(SPUIMaskedLabelsStackView *)self setNeedsLayout];
  }
}

- (NSString)typedString
{
  return self->_typedString;
}

- (void)containerViewDidLayoutArrangedSubviews:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __68__SPUIMaskedLabelsStackView_containerViewDidLayoutArrangedSubviews___block_invoke;
  v3[3] = &unk_264E90660;
  v3[4] = self;
  [MEMORY[0x263F82E00] performWithoutAnimation:v3];
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
      uint64_t v5 = [(SPUIMaskedLabelsStackView *)self resetStringOffset];
      uint64_t v6 = v7;
    }
  }
  MEMORY[0x270F9A758](v5, v6);
}

- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  double y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v10 = a4;
  id v11 = [(SPUIMaskedLabelsStackView *)self completionLabel];

  if (v11 != v10 && [MEMORY[0x263F67C78] isIpad]) {
    double y = y + 2.0;
  }
  if ([MEMORY[0x263F67C78] isIpad])
  {
    [MEMORY[0x263F7E3D0] pixelWidthForView:self];
    double y = y + v12;
  }
  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.double y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (UIFont)font
{
  return self->_font;
}

- (double)completionStringOffset
{
  return self->_completionStringOffset;
}

- (void)setCompletionStringOffset:(double)a3
{
  self->_completionStringOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillerView, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_extensionLabelProminenceView, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_typedString, 0);
  objc_storeStrong((id *)&self->_extensionLabel, 0);
  objc_storeStrong((id *)&self->_bridgeLabel, 0);
  objc_storeStrong((id *)&self->_completionLabel, 0);
}

@end