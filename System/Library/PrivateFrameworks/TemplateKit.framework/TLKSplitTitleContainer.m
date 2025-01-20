@interface TLKSplitTitleContainer
+ (double)widthForString:(id)a3 font:(id)a4;
- (BOOL)titleLabelsFitInWidth:(double)a3 pointSize:(double)a4;
- (BOOL)useLargeTitle;
- (CGSize)effectiveLayoutSizeFittingSize:(CGSize)a3;
- (TLKLabel)centerLeadingTitleLabel;
- (TLKLabel)centerTrailingTitleLabel;
- (TLKLabel)titleLabel;
- (TLKSplitTitleContainer)init;
- (TLKStackView)titleStackView;
- (id)titleFont;
- (void)layoutSubviews;
- (void)setCenterLeadingTitleLabel:(id)a3;
- (void)setCenterTrailingTitleLabel:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleStackView:(id)a3;
- (void)setUseLargeTitle:(BOOL)a3;
@end

@implementation TLKSplitTitleContainer

- (TLKSplitTitleContainer)init
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)TLKSplitTitleContainer;
  v2 = [(TLKSplitTitleContainer *)&v12 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [v3 setTextAlignment:1];
    LODWORD(v4) = 1132068864;
    [v3 setContentCompressionResistancePriority:0 forAxis:v4];
    [(TLKSplitTitleContainer *)v2 setTitleLabel:v3];
    v5 = objc_opt_new();
    [(TLKSplitTitleContainer *)v2 setCenterLeadingTitleLabel:v5];
    v6 = objc_opt_new();
    [(TLKSplitTitleContainer *)v2 setCenterTrailingTitleLabel:v6];
    v7 = [TLKStackView alloc];
    v13[0] = v5;
    v13[1] = v3;
    v13[2] = v6;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
    v9 = [(NUIContainerStackView *)v7 initWithArrangedSubviews:v8];

    [(TLKStackView *)v9 setAlignment:4 forView:v5 inAxis:0];
    [(TLKStackView *)v9 setAlignment:1 forView:v6 inAxis:0];
    [(TLKSplitTitleContainer *)v2 setTitleStackView:v9];
    v10 = [(TLKSplitTitleContainer *)v2 titleStackView];
    [(TLKSplitTitleContainer *)v2 addSubview:v10];
  }
  return v2;
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TLKSplitTitleContainer;
  -[TLKSplitTitleContainer setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(TLKSplitTitleContainer *)self setNeedsLayout];
}

- (CGSize)effectiveLayoutSizeFittingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(TLKSplitTitleContainer *)self titleFont];
  v7 = [(TLKSplitTitleContainer *)self titleLabel];
  [v7 setFont:v6];

  v8 = [(TLKSplitTitleContainer *)self centerLeadingTitleLabel];
  [v8 setFont:v6];

  v9 = [(TLKSplitTitleContainer *)self centerTrailingTitleLabel];
  [v9 setFont:v6];

  v10 = [(TLKSplitTitleContainer *)self titleLabel];
  char v11 = [v10 isHidden];

  if ((v11 & 1) == 0)
  {
    objc_super v12 = [(TLKSplitTitleContainer *)self titleStackView];
    [v12 spacing];
    double v14 = v13;
    v15 = [(TLKSplitTitleContainer *)self titleStackView];
    v16 = [v15 arrangedSubviews];
    double v17 = width - v14 * (double)(unint64_t)([v16 count] - 1);

    v18 = [(TLKSplitTitleContainer *)self titleFont];
    [v18 pointSize];
    double v20 = v19;

    if (![(TLKSplitTitleContainer *)self titleLabelsFitInWidth:v17 pointSize:v20])
    {
      double v21 = 10.0;
      if (v20 > 10.0 && v20 + -10.0 > 1.0)
      {
        do
        {
          double v22 = (v21 + v20) * 0.5;
          if ([(TLKSplitTitleContainer *)self titleLabelsFitInWidth:v17 pointSize:v22])
          {
            double v21 = v22 + 1.0;
          }
          else
          {
            double v20 = v22;
          }
        }
        while (v21 < v20 && v20 - v21 > 1.0);
      }
      v24 = [v6 fontWithSize:v21];
      v25 = [(TLKSplitTitleContainer *)self titleLabel];
      [v25 setFont:v24];

      v26 = [v6 fontWithSize:v21];
      v27 = [(TLKSplitTitleContainer *)self centerLeadingTitleLabel];
      [v27 setFont:v26];

      v28 = [v6 fontWithSize:v21];
      v29 = [(TLKSplitTitleContainer *)self centerTrailingTitleLabel];
      [v29 setFont:v28];
    }
  }
  v30 = [(TLKSplitTitleContainer *)self titleStackView];
  objc_msgSend(v30, "effectiveLayoutSizeFittingSize:", width, height);
  double v32 = v31;
  double v34 = v33;

  double v35 = v32;
  double v36 = v34;
  result.double height = v36;
  result.double width = v35;
  return result;
}

- (void)layoutSubviews
{
  v35.receiver = self;
  v35.super_class = (Class)TLKSplitTitleContainer;
  [(TLKSplitTitleContainer *)&v35 layoutSubviews];
  v3 = [(TLKSplitTitleContainer *)self titleStackView];
  [(TLKSplitTitleContainer *)self bounds];
  objc_msgSend(v3, "effectiveLayoutSizeFittingSize:", v4, v5);
  double v7 = v6;
  double v9 = v8;

  [(TLKSplitTitleContainer *)self bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = [(TLKSplitTitleContainer *)self titleStackView];
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  [(TLKSplitTitleContainer *)self bounds];
  double MidX = CGRectGetMidX(v36);
  [(TLKSplitTitleContainer *)self bounds];
  CGFloat v20 = CGRectGetHeight(v37) - v9;
  double v21 = [(TLKSplitTitleContainer *)self titleLabel];
  double v22 = [v21 font];
  [v22 descender];
  double v24 = v20 - v23;

  if ([(TLKSplitTitleContainer *)self useLargeTitle]) {
    double v25 = v24 + -9.0;
  }
  else {
    double v25 = v24;
  }
  +[TLKLayoutUtilities deviceScaledRoundedRect:forView:](TLKLayoutUtilities, "deviceScaledRoundedRect:forView:", self, MidX + v7 * -0.5, v25, v7, v9);
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v34 = [(TLKSplitTitleContainer *)self titleStackView];
  objc_msgSend(v34, "setFrame:", v27, v29, v31, v33);
}

- (BOOL)titleLabelsFitInWidth:(double)a3 pointSize:(double)a4
{
  double v7 = [(TLKSplitTitleContainer *)self titleFont];
  double v8 = [v7 fontWithSize:a4];

  double v9 = objc_opt_class();
  double v10 = [(TLKSplitTitleContainer *)self centerLeadingTitleLabel];
  double v11 = [v10 text];
  [v9 widthForString:v11 font:v8];
  double v13 = v12;
  double v14 = objc_opt_class();
  double v15 = [(TLKSplitTitleContainer *)self titleLabel];
  double v16 = [v15 text];
  [v14 widthForString:v16 font:v8];
  double v18 = v13 + v17;
  double v19 = objc_opt_class();
  CGFloat v20 = [(TLKSplitTitleContainer *)self centerTrailingTitleLabel];
  double v21 = [v20 text];
  [v19 widthForString:v21 font:v8];
  double v23 = v18 + v22;

  return v23 < a3;
}

+ (double)widthForString:(id)a3 font:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = *MEMORY[0x1E4FB12B0];
  v13[0] = a4;
  double v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a4;
  id v7 = a3;
  double v8 = [v5 dictionaryWithObjects:v13 forKeys:&v12 count:1];

  objc_msgSend(v7, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, 1.79769313e308, 1.79769313e308);
  double v10 = v9;

  return v10;
}

- (id)titleFont
{
  BOOL v2 = [(TLKSplitTitleContainer *)self useLargeTitle];
  v3 = (uint64_t *)MEMORY[0x1E4FB2928];
  if (!v2) {
    v3 = (uint64_t *)MEMORY[0x1E4FB2990];
  }
  uint64_t v4 = *v3;
  uint64_t v5 = TLKSnippetModernizationEnabled() ^ 1;
  double v6 = *MEMORY[0x1E4FB29C0];
  return +[TLKFontUtilities cachedFontForTextStyle:v4 isShort:v5 fontWeight:v6];
}

- (TLKLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (TLKLabel)centerLeadingTitleLabel
{
  return self->_centerLeadingTitleLabel;
}

- (void)setCenterLeadingTitleLabel:(id)a3
{
}

- (TLKLabel)centerTrailingTitleLabel
{
  return self->_centerTrailingTitleLabel;
}

- (void)setCenterTrailingTitleLabel:(id)a3
{
}

- (TLKStackView)titleStackView
{
  return self->_titleStackView;
}

- (void)setTitleStackView:(id)a3
{
}

- (BOOL)useLargeTitle
{
  return self->_useLargeTitle;
}

- (void)setUseLargeTitle:(BOOL)a3
{
  self->_useLargeTitle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleStackView, 0);
  objc_storeStrong((id *)&self->_centerTrailingTitleLabel, 0);
  objc_storeStrong((id *)&self->_centerLeadingTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end