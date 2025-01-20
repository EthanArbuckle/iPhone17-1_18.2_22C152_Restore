@interface PKPaymentAuthorizationSummaryItemsView
- (BOOL)occludesBodyView;
- (BOOL)showsBoldValueText;
- (BOOL)showsTopSeparator;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3 andLayout:(BOOL)a4;
- (NSString)title;
- (PKPaymentAuthorizationLayout)layout;
- (PKPaymentAuthorizationSummaryItemsView)initWithFrame:(CGRect)a3;
- (PKPaymentAuthorizationSummaryItemsView)initWithLayout:(id)a3;
- (id)_labelAttributedStringWithString:(id)a3 withDarkColor:(BOOL)a4 largeFont:(BOOL)a5;
- (id)_valueAttributedStringWithString:(id)a3 type:(unint64_t)a4;
- (id)makeTitleLabel;
- (id)titleLabel;
- (void)addLabel:(id)a3 value:(id)a4 title:(id)a5 itemType:(unint64_t)a6 maxLabelLines:(int64_t)a7 maxValueLines:(int64_t)a8 hasBottomPadding:(BOOL)a9 useDarkColor:(BOOL)a10 useLargeFont:(BOOL)a11;
- (void)dealloc;
- (void)layoutSubviews;
- (void)removeLabelsAndValues;
- (void)setLayout:(id)a3;
- (void)setOccludesBodyView:(BOOL)a3;
- (void)setShowsBoldValueText:(BOOL)a3;
- (void)setShowsTopSeparator:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKPaymentAuthorizationSummaryItemsView

- (PKPaymentAuthorizationSummaryItemsView)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)PKPaymentAuthorizationSummaryItemsView;
  v3 = -[PKPaymentAuthorizationSummaryItemsView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(PKPaymentAuthorizationSummaryItemsView *)v3 setBackgroundColor:v4];

    [(PKPaymentAuthorizationSummaryItemsView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    labelViews = v3->_labelViews;
    v3->_labelViews = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    valueViews = v3->_valueViews;
    v3->_valueViews = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    titleViews = v3->_titleViews;
    v3->_titleViews = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    hasBottomPadding = v3->_hasBottomPadding;
    v3->_hasBottomPadding = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    usesLargeFont = v3->_usesLargeFont;
    v3->_usesLargeFont = v13;

    v15 = (NSString *)*MEMORY[0x1E4FB2790];
    uint64_t v16 = PKConstrainedAuthorizationViewCellLabelSmallFont((void *)*MEMORY[0x1E4FB2790], 0);
    titleFont = v3->_titleFont;
    v3->_titleFont = (UIFont *)v16;

    uint64_t v18 = PKConstrainedAuthorizationViewBodyFont(v15);
    labelLargeFont = v3->_labelLargeFont;
    v3->_labelLargeFont = (UIFont *)v18;

    uint64_t v20 = PKConstrainedAuthorizationViewCellLabelSmallFont(v15, 0);
    labelRegularFont = v3->_labelRegularFont;
    v3->_labelRegularFont = (UIFont *)v20;

    v3->_showsBoldValueText = 0;
  }
  return v3;
}

- (PKPaymentAuthorizationSummaryItemsView)initWithLayout:(id)a3
{
  id v4 = a3;
  v5 = -[PKPaymentAuthorizationSummaryItemsView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_layout, v4);
  }

  return v6;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKPaymentAuthorizationSummaryItemsView;
  [(PKPaymentAuthorizationSummaryItemsView *)&v2 dealloc];
}

- (void)setTitle:(id)a3
{
  id v11 = a3;
  objc_storeStrong((id *)&self->_title, a3);
  if (!self->_title
    || ([(NSMutableArray *)self->_titleViews firstObject],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 text],
        v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 length],
        v6,
        v5,
        v7))
  {
    v8 = [(UILabel *)self->_titleLabel superview];

    if (!v8) {
      goto LABEL_7;
    }
    [(UILabel *)self->_titleLabel removeFromSuperview];
    goto LABEL_5;
  }
  v9 = [(PKPaymentAuthorizationSummaryItemsView *)self titleLabel];
  [v9 setText:self->_title];

  v10 = [(UILabel *)self->_titleLabel superview];

  if (!v10)
  {
    [(PKPaymentAuthorizationSummaryItemsView *)self addSubview:self->_titleLabel];
LABEL_5:
    [(PKPaymentAuthorizationSummaryItemsView *)self setNeedsLayout];
  }
LABEL_7:
}

- (id)titleLabel
{
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    id v4 = [(PKPaymentAuthorizationSummaryItemsView *)self makeTitleLabel];
    v5 = self->_titleLabel;
    self->_titleLabel = v4;

    titleLabel = self->_titleLabel;
  }

  return titleLabel;
}

- (void)removeLabelsAndValues
{
  v3 = [(PKPaymentAuthorizationSummaryItemsView *)self subviews];
  [v3 makeObjectsPerformSelector:sel_removeFromSuperview];

  [(NSMutableArray *)self->_labelViews removeAllObjects];
  [(NSMutableArray *)self->_valueViews removeAllObjects];
  [(NSMutableArray *)self->_titleViews removeAllObjects];
  [(NSMutableArray *)self->_hasBottomPadding removeAllObjects];
  [(NSMutableArray *)self->_usesLargeFont removeAllObjects];
  title = self->_title;
  self->_title = 0;

  if (self->_separatorView) {
    -[PKPaymentAuthorizationSummaryItemsView addSubview:](self, "addSubview:");
  }

  [(PKPaymentAuthorizationSummaryItemsView *)self setNeedsLayout];
}

- (void)addLabel:(id)a3 value:(id)a4 title:(id)a5 itemType:(unint64_t)a6 maxLabelLines:(int64_t)a7 maxValueLines:(int64_t)a8 hasBottomPadding:(BOOL)a9 useDarkColor:(BOOL)a10 useLargeFont:(BOOL)a11
{
  id v30 = a5;
  uint64_t v16 = (objc_class *)MEMORY[0x1E4FB1930];
  id v17 = a4;
  id v18 = a3;
  id v19 = objc_alloc_init(v16);
  [v19 setOpaque:0];
  [v19 setNumberOfLines:a7];
  uint64_t v20 = [(PKPaymentAuthorizationSummaryItemsView *)self _labelAttributedStringWithString:v18 withDarkColor:a10 largeFont:a11];

  [v19 setAttributedText:v20];
  [(PKPaymentAuthorizationSummaryItemsView *)self addSubview:v19];
  [(NSMutableArray *)self->_labelViews addObject:v19];
  id v21 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v21 setOpaque:0];
  [v21 setNumberOfLines:a8];
  v22 = [(PKPaymentAuthorizationSummaryItemsView *)self _valueAttributedStringWithString:v17 type:a6];

  [v21 setAttributedText:v22];
  [(PKPaymentAuthorizationSummaryItemsView *)self addSubview:v21];
  [(NSMutableArray *)self->_valueViews addObject:v21];
  objc_super v23 = [(PKPaymentAuthorizationSummaryItemsView *)self makeTitleLabel];
  [v23 setText:v30];
  [(PKPaymentAuthorizationSummaryItemsView *)self addSubview:v23];
  [(NSMutableArray *)self->_titleViews addObject:v23];
  hasBottomPadding = self->_hasBottomPadding;
  v25 = [NSNumber numberWithBool:a9];
  [(NSMutableArray *)hasBottomPadding addObject:v25];

  usesLargeFont = self->_usesLargeFont;
  v27 = [NSNumber numberWithBool:a11];
  [(NSMutableArray *)usesLargeFont addObject:v27];

  if (-[NSMutableArray count](self->_titleViews, "count") == 1 && [v30 length])
  {
    title = self->_title;
    self->_title = 0;
  }
  [(PKPaymentAuthorizationSummaryItemsView *)self setNeedsLayout];
}

- (void)setShowsTopSeparator:(BOOL)a3
{
  if (((!self->_showsTopSeparator ^ a3) & 1) == 0)
  {
    self->_showsTopSeparator = a3;
    if (a3)
    {
      id v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      separatorView = self->_separatorView;
      self->_separatorView = v4;

      v6 = self->_separatorView;
      uint64_t v7 = PKAuthorizationSeparatorColor();
      [(UIView *)v6 setBackgroundColor:v7];

      v8 = self->_separatorView;
      [(PKPaymentAuthorizationSummaryItemsView *)self addSubview:v8];
    }
    else
    {
      [(UIView *)self->_separatorView removeFromSuperview];
      v9 = self->_separatorView;
      self->_separatorView = 0;
    }
  }
}

- (id)makeTitleLabel
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v3 setTextAlignment:2];
  [v3 setOpaque:0];
  [v3 setNumberOfLines:0];
  [v3 setLineBreakMode:0];
  LODWORD(v4) = 1.0;
  [v3 _setHyphenationFactor:v4];
  [v3 setFont:self->_titleFont];
  v5 = PKAuthorizationViewLabelColor();
  [v3 setTextColor:v5];

  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKPaymentAuthorizationSummaryItemsView sizeThatFits:andLayout:](self, "sizeThatFits:andLayout:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentAuthorizationSummaryItemsView;
  [(PKPaymentAuthorizationSummaryItemsView *)&v5 layoutSubviews];
  [(PKPaymentAuthorizationSummaryItemsView *)self bounds];
  -[PKPaymentAuthorizationSummaryItemsView sizeThatFits:andLayout:](self, "sizeThatFits:andLayout:", 1, v3, v4);
}

- (CGSize)sizeThatFits:(CGSize)a3 andLayout:(BOOL)a4
{
  BOOL v4 = a4;
  double width = a3.width;
  if ([(NSMutableArray *)self->_labelViews count])
  {
    int v97 = [(PKPaymentAuthorizationSummaryItemsView *)self _shouldReverseLayoutDirection];
    v6 = self;
    BOOL v7 = [(UIView *)self pkui_userInterfaceIdiomSupportsLargeLayouts];
    v8 = (id *)MEMORY[0x1E4FB2608];
    v9 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
    BOOL v10 = UIContentSizeCategoryCompareToCategory(v9, (UIContentSizeCategory)*MEMORY[0x1E4FB27C0]) == NSOrderedDescending;

    id v11 = [*v8 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v11);

    if (v7) {
      BOOL v13 = IsAccessibilityCategory;
    }
    else {
      BOOL v13 = v10;
    }
    v101 = v6;
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_layout);
    v15 = WeakRetained;
    if (v13) {
      [WeakRetained contentHorizontalMargin];
    }
    else {
      [WeakRetained valueLeftMargin];
    }
    double v98 = v16;

    id v19 = PKConstrainedAuthorizationViewCellLabelSmallFont((void *)*MEMORY[0x1E4FB2790], 0);
    [v19 _bodyLeading];

    PKFloatCeilToPixel();
    double v106 = v20;
    PKFloatCeilToPixel();
    double v108 = v21;
    [(UIFont *)v6->_titleFont lineHeight];
    double v23 = v22;
    [(UIFont *)v6->_titleFont ascender];
    double v25 = v24;
    [(UIFont *)v6->_labelLargeFont lineHeight];
    double v27 = v26;
    [(UIFont *)v6->_labelLargeFont ascender];
    double v29 = v28;
    id v30 = objc_loadWeakRetained((id *)&v6->_layout);
    [v30 contentHorizontalMargin];
    double v99 = v31;

    separatorView = v6->_separatorView;
    if (separatorView && v4)
    {
      if (v6->_occludesBodyView) {
        double v33 = 0.0;
      }
      else {
        double v33 = (double)(uint64_t)v99;
      }
      -[UIView setFrame:](separatorView, "setFrame:", v33, 0.0, width - v33, PKUIPixelLength());
    }
    double v110 = v98 + v99 * -2.0;
    titleLabel = v6->_titleLabel;
    double v94 = 0.0;
    if (titleLabel)
    {
      v35 = [(UILabel *)titleLabel superview];

      if (v35)
      {
        -[UILabel sizeThatFits:](v6->_titleLabel, "sizeThatFits:", v110, 3.40282347e38);
        double v37 = v36;
        if (v4)
        {
          if (v97) {
            double v38 = width - v110 - v99;
          }
          else {
            double v38 = v99;
          }
          v39 = v6->_titleLabel;
          v40 = [(UILabel *)v39 font];
          [v40 lineHeight];
          -[UILabel setFrame:](v39, "setFrame:", v38, v106 - v41, v110, v37);
        }
        double v94 = fmax(v37, 0.0);
      }
    }
    p_isa = (id *)&v6->super.super.super.isa;
    uint64_t v43 = [(NSMutableArray *)v6->_labelViews count];
    if (v43)
    {
      unint64_t v47 = 0;
      double v104 = width - v98 - v99;
      double v107 = v27 - v29 - (v23 - v25);
      double v103 = v104 - v110 + -8.0;
      unint64_t v102 = v43 - 1;
      double v48 = width - v110 - v99;
      if (!v97) {
        double v48 = v99;
      }
      double v96 = v48;
      double v49 = v106;
      BOOL v95 = v4;
      uint64_t v105 = v43;
      do
      {
        v50 = [p_isa[51] objectAtIndex:v47];
        v51 = [p_isa[52] objectAtIndex:v47];
        v52 = [p_isa[53] objectAtIndex:v47];
        v53 = [p_isa[54] objectAtIndex:v47];
        int v112 = [v53 BOOLValue];

        v54 = [p_isa[55] objectAtIndex:v47];
        int v55 = [v54 BOOLValue];

        v56 = [v52 font];
        [v56 lineHeight];
        double v109 = v57;

        double v58 = 0.0;
        if (v47 < v102)
        {
          v59 = [p_isa[53] objectAtIndex:v47 + 1];
          v60 = [v59 text];
          uint64_t v61 = [v60 length];

          p_isa = (id *)&v101->super.super.super.isa;
          if (v61) {
            double v58 = v108 + 0.0;
          }
          else {
            double v58 = 0.0;
          }
          v62 = [(NSMutableArray *)v101->_usesLargeFont objectAtIndex:v47 + 1];
          int v63 = [v62 BOOLValue];

          if (v63)
          {
            [(UIFont *)v101->_labelLargeFont lineHeight];
            double v58 = v58 + v107 + v64 - v108;
          }
          BOOL v4 = v95;
        }
        double v111 = v58;
        v65 = [v50 font];
        [v65 lineHeight];
        double v67 = v49 - v66;

        double v68 = -0.0;
        if (v55) {
          double v68 = v107;
        }
        double v69 = v68 + v67;
        double v70 = v104 - v110 + -8.0;
        objc_msgSend(v51, "sizeThatFits:", v103, 3.40282347e38);
        if (v71.n128_f64[0] < v103) {
          double v70 = v71.n128_f64[0];
        }
        v71.n128_f64[0] = v70;
        PKSizeCeilToPixel(v71, v72, v73);
        double v75 = v74;
        double v77 = v76;
        double v78 = v104 - v70 + -8.0;
        if (v110 > v78) {
          double v78 = v98 + v99 * -2.0;
        }
        objc_msgSend(v50, "sizeThatFits:", v78, 3.40282347e38);
        PKSizeCeilToPixel(v79, v80, v81);
        double v83 = v82;
        double v85 = v84;
        objc_msgSend(v52, "sizeThatFits:", v110, 3.40282347e38);
        if (v4)
        {
          double v87 = v86;
          double v88 = v49 - v109;
          double v89 = width - v98 - v83;
          if (v97)
          {
            double v90 = v99;
          }
          else
          {
            double v89 = v98;
            double v90 = width - v75 - v99;
          }
          objc_msgSend(v50, "setFrame:", v89, v69, v83, v85);
          if (v85 <= v77) {
            double v91 = v69;
          }
          else {
            double v91 = v69 + v85 - v77;
          }
          objc_msgSend(v51, "setFrame:", v90, v91, v75, v77);
          objc_msgSend(v52, "setFrame:", v96, v88, v110, v87);
        }
        if (v77 <= v85) {
          double v92 = v85;
        }
        else {
          double v92 = v77;
        }
        double v93 = v106;
        if (!v112) {
          double v93 = v108;
        }
        double v49 = v69 + v111 + v93 + v92;

        ++v47;
      }
      while (v105 != v47);
      v45.n128_f64[0] = fmax(v49, v94);
    }
    else
    {
      v45.n128_f64[0] = v94;
    }
    v44.n128_f64[0] = width;
    PKSizeCeilToPixel(v44, v45, v46);
  }
  else
  {
    double v17 = *MEMORY[0x1E4F1DB30];
    double v18 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  result.height = v18;
  result.double width = v17;
  return result;
}

- (id)_labelAttributedStringWithString:(id)a3 withDarkColor:(BOOL)a4 largeFont:(BOOL)a5
{
  v21[3] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v5 = a5;
    v8 = (void *)MEMORY[0x1E4FB0850];
    id v9 = a3;
    BOOL v10 = [v8 defaultParagraphStyle];
    id v11 = (void *)[v10 mutableCopy];

    [v11 setLineBreakMode:4];
    if (a4) {
      PKAuthorizationViewValueLabelColor();
    }
    else {
    uint64_t v12 = PKAuthorizationViewLabelColor();
    }
    v14 = (void *)v12;
    uint64_t v15 = 7;
    if (v5) {
      uint64_t v15 = 6;
    }
    uint64_t v16 = *(uint64_t *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PKPaymentAuthorizationSummaryItemsView__labelViews[v15]);
    uint64_t v17 = *MEMORY[0x1E4FB0738];
    v20[0] = *MEMORY[0x1E4FB06F8];
    v20[1] = v17;
    v21[0] = v16;
    v21[1] = v11;
    v20[2] = *MEMORY[0x1E4FB0700];
    v21[2] = v12;
    double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
    BOOL v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v9 attributes:v18];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)_valueAttributedStringWithString:(id)a3 type:(unint64_t)a4
{
  v19[3] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v6 = (void *)MEMORY[0x1E4FB0850];
    id v7 = a3;
    v8 = [v6 defaultParagraphStyle];
    id v9 = (void *)[v8 mutableCopy];

    [v9 setLineBreakMode:0];
    if ([(PKPaymentAuthorizationSummaryItemsView *)self _shouldReverseLayoutDirection])uint64_t v10 = 0; {
    else
    }
      uint64_t v10 = 2;
    [v9 setAlignment:v10];
    if (a4) {
      PKAuthorizationViewLabelColor();
    }
    else {
    uint64_t v12 = PKAuthorizationViewValueLabelColor();
    }
    v18[0] = *MEMORY[0x1E4FB06F8];
    BOOL v13 = PKConstrainedAuthorizationViewCellLabelSmallFont((void *)*MEMORY[0x1E4FB2790], self->_showsBoldValueText);
    uint64_t v14 = *MEMORY[0x1E4FB0738];
    v19[0] = v13;
    v19[1] = v9;
    uint64_t v15 = *MEMORY[0x1E4FB0700];
    v18[1] = v14;
    v18[2] = v15;
    v19[2] = v12;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];

    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7 attributes:v16];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (PKPaymentAuthorizationLayout)layout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);

  return (PKPaymentAuthorizationLayout *)WeakRetained;
}

- (void)setLayout:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)showsBoldValueText
{
  return self->_showsBoldValueText;
}

- (void)setShowsBoldValueText:(BOOL)a3
{
  self->_showsBoldValueText = a3;
}

- (BOOL)showsTopSeparator
{
  return self->_showsTopSeparator;
}

- (BOOL)occludesBodyView
{
  return self->_occludesBodyView;
}

- (void)setOccludesBodyView:(BOOL)a3
{
  self->_occludesBodyView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_layout);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_labelRegularFont, 0);
  objc_storeStrong((id *)&self->_labelLargeFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_usesLargeFont, 0);
  objc_storeStrong((id *)&self->_hasBottomPadding, 0);
  objc_storeStrong((id *)&self->_titleViews, 0);
  objc_storeStrong((id *)&self->_valueViews, 0);

  objc_storeStrong((id *)&self->_labelViews, 0);
}

@end