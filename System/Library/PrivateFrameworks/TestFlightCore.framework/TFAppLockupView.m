@interface TFAppLockupView
- (CGSize)displayedIconSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (TFAppLockupView)initWithFrame:(CGRect)a3;
- (TFAppLockupViewSpecification)specification;
- (UIImageView)iconView;
- (UILabel)primarySubtitleLabel;
- (UILabel)secondarySubtitleLabel;
- (UILabel)titleLabel;
- (void)_layoutLabelsInLayoutBounds:(CGRect)a3;
- (void)_prepareForDisplayWithTraitCollection:(id)a3;
- (void)_styleSubviews;
- (void)layoutSubviews;
- (void)setImage:(id)a3 animated:(BOOL)a4;
- (void)setSpecification:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TFAppLockupView

- (TFAppLockupView)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)TFAppLockupView;
  v3 = -[TFAppLockupView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [TFAppLockupViewSpecification alloc];
    v5 = [(TFAppLockupView *)v3 traitCollection];
    uint64_t v6 = [(TFAppLockupViewSpecification *)v4 initWithTraitCollection:v5];
    specification = v3->_specification;
    v3->_specification = (TFAppLockupViewSpecification *)v6;

    id v8 = objc_alloc(MEMORY[0x263F1C6D0]);
    double v9 = *MEMORY[0x263F001A8];
    double v10 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v11 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v12 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v13 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x263F001A8], v10, v11, v12);
    iconView = v3->_iconView;
    v3->_iconView = (UIImageView *)v13;

    [(TFAppLockupView *)v3 addSubview:v3->_iconView];
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v9, v10, v11, v12);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v15;

    [(TFAppLockupView *)v3 addSubview:v3->_titleLabel];
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v9, v10, v11, v12);
    primarySubtitleLabel = v3->_primarySubtitleLabel;
    v3->_primarySubtitleLabel = (UILabel *)v17;

    [(TFAppLockupView *)v3 addSubview:v3->_primarySubtitleLabel];
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", v9, v10, v11, v12);
    secondarySubtitleLabel = v3->_secondarySubtitleLabel;
    v3->_secondarySubtitleLabel = (UILabel *)v19;

    [(TFAppLockupView *)v3 addSubview:v3->_secondarySubtitleLabel];
    [(TFAppLockupView *)v3 _styleSubviews];
    v21 = [(TFAppLockupView *)v3 traitCollection];
    [(TFAppLockupView *)v3 _prepareForDisplayWithTraitCollection:v21];
  }
  return v3;
}

- (void)_styleSubviews
{
  v3 = [(TFAppLockupView *)self titleLabel];
  v4 = [(TFAppLockupView *)self specification];
  v5 = [v4 titleLabelFont];
  [v3 setFont:v5];

  uint64_t v6 = [(TFAppLockupView *)self titleLabel];
  v7 = [(TFAppLockupView *)self specification];
  id v8 = [v7 titleTextColor];
  [v6 setTextColor:v8];

  double v9 = [(TFAppLockupView *)self titleLabel];
  [v9 setNumberOfLines:2];

  double v10 = [(TFAppLockupView *)self titleLabel];
  [v10 setLineBreakMode:0];

  double v11 = [(TFAppLockupView *)self primarySubtitleLabel];
  double v12 = [(TFAppLockupView *)self specification];
  uint64_t v13 = [v12 subtitleLabelFont];
  [v11 setFont:v13];

  v14 = [(TFAppLockupView *)self primarySubtitleLabel];
  uint64_t v15 = [(TFAppLockupView *)self specification];
  v16 = [v15 subtitleTextColor];
  [v14 setTextColor:v16];

  uint64_t v17 = [(TFAppLockupView *)self primarySubtitleLabel];
  [v17 setNumberOfLines:1];

  v18 = [(TFAppLockupView *)self primarySubtitleLabel];
  [v18 setLineBreakMode:4];

  uint64_t v19 = [(TFAppLockupView *)self secondarySubtitleLabel];
  v20 = [(TFAppLockupView *)self specification];
  v21 = [v20 subtitleLabelFont];
  [v19 setFont:v21];

  v22 = [(TFAppLockupView *)self secondarySubtitleLabel];
  objc_super v23 = [(TFAppLockupView *)self specification];
  v24 = [v23 subtitleTextColor];
  [v22 setTextColor:v24];

  v25 = [(TFAppLockupView *)self secondarySubtitleLabel];
  [v25 setNumberOfLines:1];

  v26 = [(TFAppLockupView *)self secondarySubtitleLabel];
  [v26 setLineBreakMode:4];

  v27 = [(TFAppLockupView *)self iconView];
  v28 = [(TFAppLockupView *)self specification];
  v29 = [v28 iconPlaceholderColor];
  [v27 setBackgroundColor:v29];

  v30 = [(TFAppLockupView *)self iconView];
  [v30 setClipsToBounds:1];

  id v31 = [(TFAppLockupView *)self iconView];
  [v31 _setContinuousCornerRadius:24.0];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(TFAppLockupView *)self specification];
  [v6 iconSize];
  double v8 = v7;

  double v9 = [(TFAppLockupView *)self specification];
  [v9 paddingBetweenIconAndText];
  double v11 = width - v10 - v8;

  double v12 = [(TFAppLockupView *)self titleLabel];
  objc_msgSend(v12, "sizeThatFits:", v11, height);
  double v14 = v13;

  uint64_t v15 = [(TFAppLockupView *)self primarySubtitleLabel];
  objc_msgSend(v15, "sizeThatFits:", v11, height);
  double v17 = v16;

  v18 = [(TFAppLockupView *)self secondarySubtitleLabel];
  objc_msgSend(v18, "sizeThatFits:", v11, height);
  double v20 = v19;

  if (v14 + v17 + v20 >= v8) {
    double v21 = v14 + v17 + v20;
  }
  else {
    double v21 = v8;
  }
  double v22 = width;
  result.double height = v21;
  result.double width = v22;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TFAppLockupView;
  [(TFAppLockupView *)&v5 traitCollectionDidChange:a3];
  v4 = [(TFAppLockupView *)self traitCollection];
  [(TFAppLockupView *)self _prepareForDisplayWithTraitCollection:v4];

  [(TFAppLockupView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v38.receiver = self;
  v38.super_class = (Class)TFAppLockupView;
  [(TFAppLockupView *)&v38 layoutSubviews];
  [(TFAppLockupView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = [(TFAppLockupView *)self specification];
  [v11 iconSize];
  double v13 = v12;
  double v15 = v14;

  v39.origin.x = v4;
  v39.origin.y = v6;
  v39.size.double width = v8;
  v39.size.double height = v10;
  double Width = CGRectGetWidth(v39);
  double v16 = [(TFAppLockupView *)self specification];
  [v16 paddingBetweenIconAndText];
  double v36 = v17;

  v18 = [(TFAppLockupView *)self traitCollection];
  uint64_t v19 = [v18 layoutDirection];

  CGFloat v20 = v4;
  CGFloat v21 = v6;
  CGFloat v22 = v8;
  CGFloat v23 = v10;
  if (v19 == 1)
  {
    CGFloat v24 = CGRectGetMaxX(*(CGRect *)&v20) - v13;
    v40.origin.x = v4;
    v40.origin.y = v6;
    v40.size.double width = v8;
    v40.size.double height = v10;
    double MinY = CGRectGetMinY(v40);
    v26 = [(TFAppLockupView *)self iconView];
    objc_msgSend(v26, "setFrame:", v24, MinY, v13, v15);

    v41.origin.x = v4;
    v41.origin.y = v6;
    v41.size.double width = v8;
    v41.size.double height = v10;
    double MinX = CGRectGetMinX(v41);
    v42.origin.x = v24;
    v42.origin.y = MinY;
    v42.size.double width = v13;
    v42.size.double height = v15;
    double v28 = CGRectGetMinY(v42);
    v43.origin.x = v24;
    v43.origin.y = MinY;
    v43.size.double width = v13;
    v43.size.double height = v15;
    double Height = CGRectGetHeight(v43);
  }
  else
  {
    double v30 = CGRectGetMinX(*(CGRect *)&v20);
    v44.origin.x = v4;
    v44.origin.y = v6;
    v44.size.double width = v8;
    v44.size.double height = v10;
    double v31 = CGRectGetMinY(v44);
    v32 = [(TFAppLockupView *)self iconView];
    objc_msgSend(v32, "setFrame:", v30, v31, v13, v15);

    v45.origin.x = v30;
    v45.origin.y = v31;
    v45.size.double width = v13;
    v45.size.double height = v15;
    double MaxX = CGRectGetMaxX(v45);
    v34 = [(TFAppLockupView *)self specification];
    [v34 paddingBetweenIconAndText];
    double MinX = MaxX + v35;
    v46.origin.x = v30;
    v46.origin.y = v31;
    v46.size.double width = v13;
    v46.size.double height = v15;
    double v28 = CGRectGetMinY(v46);
    v47.origin.x = v30;
    v47.origin.y = v31;
    v47.size.double width = v13;
    v47.size.double height = v15;
    double Height = CGRectGetHeight(v47);
  }
  -[TFAppLockupView _layoutLabelsInLayoutBounds:](self, "_layoutLabelsInLayoutBounds:", MinX, v28, Width - v36 - v13, Height, *(void *)&v36);
}

- (void)_layoutLabelsInLayoutBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat v8 = [(TFAppLockupView *)self titleLabel];
  objc_msgSend(v8, "sizeThatFits:", width, height);
  CGFloat v10 = v9;
  double v59 = v9;

  double v11 = [(TFAppLockupView *)self primarySubtitleLabel];
  objc_msgSend(v11, "sizeThatFits:", width, height);
  double v13 = v12;

  double v14 = [(TFAppLockupView *)self secondarySubtitleLabel];
  objc_msgSend(v14, "sizeThatFits:", width, height);
  id v60 = v15;

  double v16 = [(TFAppLockupView *)self titleLabel];
  [v16 _firstBaselineOffsetFromTop];
  double v18 = v17;
  uint64_t v19 = [(TFAppLockupView *)self specification];
  [v19 titleLabelBaselineToFirstSubtitleLabelBaseline];
  double v21 = v18 + v20;
  CGFloat v22 = [(TFAppLockupView *)self specification];
  [v22 firstSubtitleLabelBaselineToSecondSubtitleLabelBaseline];
  double v24 = v21 + v23;
  v25 = [(TFAppLockupView *)self secondarySubtitleLabel];
  [v25 _baselineOffsetFromBottom];
  double v27 = v24 + v26;

  v63.origin.CGFloat x = x;
  v63.origin.CGFloat y = y;
  v63.size.double width = width;
  v63.size.double height = height;
  double v28 = (CGRectGetHeight(v63) - v27) * 0.5;
  if (v28 >= 0.0) {
    double v29 = v28;
  }
  else {
    double v29 = 0.0;
  }
  double v58 = v29;
  v64.origin.CGFloat x = x;
  v64.origin.CGFloat y = y;
  v64.size.double width = width;
  v64.size.double height = height;
  double MinX = CGRectGetMinX(v64);
  v65.origin.CGFloat x = x;
  v65.origin.CGFloat y = y;
  v65.size.double width = width;
  v65.size.double height = height;
  v66.size.double width = CGRectGetWidth(v65);
  double v56 = v66.size.width;
  v66.origin.CGFloat x = MinX;
  v66.origin.CGFloat y = v29;
  v66.size.double height = v10;
  double MaxY = CGRectGetMaxY(v66);
  double v31 = [(TFAppLockupView *)self titleLabel];
  [v31 _baselineOffsetFromBottom];
  double v33 = MaxY - v32;
  v34 = [(TFAppLockupView *)self specification];
  [v34 titleLabelBaselineToFirstSubtitleLabelBaseline];
  double v36 = v33 + v35;
  v37 = [(TFAppLockupView *)self primarySubtitleLabel];
  [v37 _firstBaselineOffsetFromTop];
  CGFloat v55 = v36 - v38;

  v67.origin.CGFloat x = x;
  v67.origin.CGFloat y = y;
  v67.size.double width = width;
  v67.size.double height = height;
  double v54 = CGRectGetMinX(v67);
  v68.origin.CGFloat x = x;
  v68.origin.CGFloat y = y;
  v68.size.double width = width;
  v68.size.double height = height;
  double v39 = CGRectGetWidth(v68);
  v69.origin.CGFloat x = v54;
  v69.origin.CGFloat y = v55;
  v69.size.double width = v39;
  v69.size.double height = v13;
  double v40 = CGRectGetMaxY(v69);
  CGRect v41 = [(TFAppLockupView *)self primarySubtitleLabel];
  [v41 _baselineOffsetFromBottom];
  double v43 = v40 - v42;
  CGRect v44 = [(TFAppLockupView *)self specification];
  [v44 firstSubtitleLabelBaselineToSecondSubtitleLabelBaseline];
  double v46 = v43 + v45;
  CGRect v47 = [(TFAppLockupView *)self secondarySubtitleLabel];
  [v47 _firstBaselineOffsetFromTop];
  double v49 = v46 - v48;

  v70.origin.CGFloat x = x;
  v70.origin.CGFloat y = y;
  v70.size.double width = width;
  v70.size.double height = height;
  double v50 = CGRectGetMinX(v70);
  v71.origin.CGFloat x = x;
  v71.origin.CGFloat y = y;
  v71.size.double width = width;
  v71.size.double height = height;
  double v51 = CGRectGetWidth(v71);
  v52 = [(TFAppLockupView *)self secondarySubtitleLabel];
  objc_msgSend(v52, "setFrame:", v50, v49, v51, *(double *)&v60);

  v53 = [(TFAppLockupView *)self titleLabel];
  objc_msgSend(v53, "setFrame:", MinX, v58, v56, v59);

  id v61 = [(TFAppLockupView *)self primarySubtitleLabel];
  objc_msgSend(v61, "setFrame:", v54, v55, v39, v13);
}

- (void)_prepareForDisplayWithTraitCollection:(id)a3
{
  CGFloat v4 = [TFAppLockupViewSpecification alloc];
  double v5 = [(TFAppLockupView *)self traitCollection];
  CGFloat v6 = [(TFAppLockupViewSpecification *)v4 initWithTraitCollection:v5];
  [(TFAppLockupView *)self setSpecification:v6];

  double v7 = [(TFAppLockupView *)self titleLabel];
  CGFloat v8 = [(TFAppLockupView *)self specification];
  double v9 = [v8 titleLabelFont];
  [v7 setFont:v9];

  CGFloat v10 = [(TFAppLockupView *)self primarySubtitleLabel];
  double v11 = [(TFAppLockupView *)self specification];
  double v12 = [v11 subtitleLabelFont];
  [v10 setFont:v12];

  id v15 = [(TFAppLockupView *)self secondarySubtitleLabel];
  double v13 = [(TFAppLockupView *)self specification];
  double v14 = [v13 subtitleLabelFont];
  [v15 setFont:v14];
}

- (CGSize)displayedIconSize
{
  v2 = [(TFAppLockupView *)self specification];
  [v2 iconSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(TFAppLockupView *)self iconView];
  [v7 setImage:v6];

  if (v4)
  {
    id v11 = [MEMORY[0x263F15910] animation];
    [v11 setDuration:0.3];
    double v8 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
    [v11 setTimingFunction:v8];

    [v11 setType:*MEMORY[0x263F15FD8]];
    double v9 = [(TFAppLockupView *)self iconView];
    CGFloat v10 = [v9 layer];
    [v10 addAnimation:v11 forKey:0];
  }
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)primarySubtitleLabel
{
  return self->_primarySubtitleLabel;
}

- (UILabel)secondarySubtitleLabel
{
  return self->_secondarySubtitleLabel;
}

- (TFAppLockupViewSpecification)specification
{
  return self->_specification;
}

- (void)setSpecification:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specification, 0);
  objc_storeStrong((id *)&self->_secondarySubtitleLabel, 0);
  objc_storeStrong((id *)&self->_primarySubtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_iconView, 0);
}

@end