@interface _UIActivityGroupActivityCell
+ (CGSize)preferredSizeForSheetWidth:(double)a3 sizeCategory:(id)a4 titleLabelText:(id)a5 screenScale:(double)a6;
+ (void)invalidatePreferredSizes;
- (CALayer)highlightLayer;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIImageView)highlightedImageView;
- (UIImageView)imageView;
- (UIView)imageSlot;
- (UIView)shadowView;
- (UIView)titleSlot;
- (_UIActivityGroupActivityCell)initWithFrame:(CGRect)a3;
- (_UIActivityGroupActivityCellTitleLabel)titleLabel;
- (_UIHostActivityProxy)activityProxy;
- (id)draggingView;
- (unint64_t)sequence;
- (void)initHighlightLayerIfNeeded;
- (void)initHighlightedImageViewIfNeeded;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setActivityProxy:(id)a3;
- (void)setHighlightLayer:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlightedImageView:(id)a3;
- (void)setImageSlot:(id)a3;
- (void)setImageView:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSequence:(unint64_t)a3;
- (void)setShadowView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleSlot:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateHighlightedImageViewIfNeeded;
@end

@implementation _UIActivityGroupActivityCell

- (_UIActivityGroupActivityCell)initWithFrame:(CGRect)a3
{
  v28.receiver = self;
  v28.super_class = (Class)_UIActivityGroupActivityCell;
  v3 = -[_UIActivityGroupActivityCell initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    [v4 setContentMode:2];
    v5 = [v4 layer];
    [v5 setCornerRadius:10.0];

    [v4 setClipsToBounds:1];
    [(_UIActivityGroupActivityCell *)v3 setImageView:v4];
    id v6 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [v6 setClipsToBounds:0];
    v7 = [MEMORY[0x1E4FB1618] blackColor];
    id v8 = [v7 colorWithAlphaComponent:0.25];
    uint64_t v9 = [v8 CGColor];
    v10 = [v6 layer];
    [v10 setShadowColor:v9];

    v11 = [v6 layer];
    LODWORD(v12) = 1058642330;
    [v11 setShadowOpacity:v12];

    double v13 = *MEMORY[0x1E4F1DB30];
    double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    v15 = [v6 layer];
    objc_msgSend(v15, "setShadowOffset:", v13, v14);

    v16 = [v6 layer];
    [v16 setShadowRadius:5.0];

    [v6 setAlpha:0.4];
    [(_UIActivityGroupActivityCell *)v3 setShadowView:v6];
    id v17 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v18 = [v17 layer];
    [v18 setCornerRadius:12.0];

    [(_UIActivityGroupActivityCell *)v3 setImageSlot:v17];
    id v19 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(_UIActivityGroupActivityCell *)v3 setTitleSlot:v19];
    v20 = [(_UIActivityGroupActivityCell *)v3 contentView];
    [v20 addSubview:v6];

    v21 = [(_UIActivityGroupActivityCell *)v3 contentView];
    [v21 addSubview:v4];

    v22 = [(_UIActivityGroupActivityCell *)v3 contentView];
    [v22 addSubview:v17];

    v23 = [(_UIActivityGroupActivityCell *)v3 contentView];
    [v23 addSubview:v19];

    v24 = createTitleLabel();
    [(_UIActivityGroupActivityCell *)v3 setTitleLabel:v24];
    v25 = [(_UIActivityGroupActivityCell *)v3 contentView];
    [v25 addSubview:v24];

    v26 = v3;
  }

  return v3;
}

- (void)prepareForReuse
{
  v14.receiver = self;
  v14.super_class = (Class)_UIActivityGroupActivityCell;
  [(_UIActivityGroupActivityCell *)&v14 prepareForReuse];
  v3 = [(_UIActivityGroupActivityCell *)self imageView];
  [v3 setImage:0];

  id v4 = [(_UIActivityGroupActivityCell *)self highlightedImageView];
  [v4 setImage:0];

  v5 = [(_UIActivityGroupActivityCell *)self titleLabel];
  [v5 setText:0];

  [(_UIActivityGroupActivityCell *)self setShadowView:0];
  id v6 = [(_UIActivityGroupActivityCell *)self titleLabel];
  v7 = [v6 layer];
  [v7 setContents:0];

  id v8 = [(_UIActivityGroupActivityCell *)self imageView];
  uint64_t v9 = [v8 layer];
  [v9 setContents:0];

  v10 = [(_UIActivityGroupActivityCell *)self imageSlot];
  v11 = [v10 layer];
  [v11 setContents:0];

  double v12 = [(_UIActivityGroupActivityCell *)self titleSlot];
  double v13 = [v12 layer];
  [v13 setContents:0];
}

+ (void)invalidatePreferredSizes
{
}

+ (CGSize)preferredSizeForSheetWidth:(double)a3 sizeCategory:(id)a4 titleLabelText:(id)a5 screenScale:(double)a6
{
  id v8 = (NSString *)a4;
  id v9 = a5;
  if (sCachedPreferredSizesBySheetParams)
  {
    if (!v8) {
      goto LABEL_7;
    }
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    v11 = (void *)sCachedPreferredSizesBySheetParams;
    sCachedPreferredSizesBySheetParams = (uint64_t)v10;

    if (!v8) {
      goto LABEL_7;
    }
  }
  if (UIContentSizeCategoryIsAccessibilityCategory(v8))
  {
    double v12 = [NSString stringWithFormat:@"%@-%ld", v9, (uint64_t)a3];
    int v13 = 1;
    goto LABEL_8;
  }
LABEL_7:
  int v13 = 0;
  double v12 = @"~";
LABEL_8:
  objc_super v14 = [(id)sCachedPreferredSizesBySheetParams objectForKey:v12];
  v15 = v14;
  if (v14)
  {
    [v14 CGSizeValue];
    double v17 = v16;
    double v19 = v18;
  }
  else
  {
    double ChickletSize = getChickletSize();
    if (v13)
    {
      if (!sCachedCellWidthBySheetWidth)
      {
        id v21 = objc_alloc_init(MEMORY[0x1E4F1C998]);
        v22 = (void *)sCachedCellWidthBySheetWidth;
        sCachedCellWidthBySheetWidth = (uint64_t)v21;
      }
      v23 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
      v24 = [(id)sCachedCellWidthBySheetWidth objectForKey:v23];
      v25 = v24;
      if (v24)
      {
        [v24 floatValue];
        double v27 = v26;
      }
      else
      {
        double v27 = 240.0;
        double v37 = a3 / 240.0 - floor(a3 / 240.0);
        uint64_t v38 = 10;
        do
        {
          if (v37 >= 0.25 && v37 <= 0.5) {
            break;
          }
          double v27 = v27 + 10.0;
          double v37 = a3 / v27 - floor(a3 / v27);
          --v38;
        }
        while (v38);
        v40 = (void *)sCachedCellWidthBySheetWidth;
        v41 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:", v27, 0.5, 10.0);
        [v40 setObject:v41 forKey:v23];
      }
      getTitleLabelHeightForWidthTextAndSizeCategory(v9, v8, v27 + -1.0 - ChickletSize);
    }
    else
    {
      objc_super v28 = [(id)sTitleLabel _screen];
      _UIActivityGroupActivityCellFont(v8, v28);
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      v30 = v8;
      v31 = v30;
      double v32 = 1.0;
      if (v8
        && UIContentSizeCategoryCompareToCategory(v30, (UIContentSizeCategory)*MEMORY[0x1E4FB27C0]) != NSOrderedAscending)
      {
        [v29 pointSize];
        double v34 = v33 / 11.0;
        if (v34 <= 2.0) {
          double v32 = v34;
        }
        else {
          double v32 = 2.0;
        }
      }

      double v35 = ChickletSize * v32 + 0.0;
      v36 = getTitleLabelFontForWidthTextAndSizeCategory(v31, v35 + -1.0);
      [v36 ascender];
      getTitleLabelHeightForWidthTextAndSizeCategory(@"\n", v31, v35);
      [v36 descender];
    }
    UIRectIntegralWithScale();
    double v17 = v42;
    double v19 = v43;
    v44 = (void *)sCachedPreferredSizesBySheetParams;
    *(double *)v48 = v42;
    *(double *)&v48[1] = v43;
    v45 = [MEMORY[0x1E4F29238] valueWithBytes:v48 objCType:"{CGSize=dd}"];
    [v44 setObject:v45 forKey:v12];
  }
  double v46 = v17;
  double v47 = v19;
  result.height = v47;
  result.width = v46;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v5 = objc_opt_class();
  id v6 = [(_UIActivityGroupActivityCell *)self traitCollection];
  v7 = [v6 preferredContentSizeCategory];
  id v8 = [(_UIActivityGroupActivityCell *)self titleLabel];
  id v9 = [v8 text];
  id v10 = [(_UIActivityGroupActivityCell *)self traitCollection];
  [v10 displayScale];
  [v5 preferredSizeForSheetWidth:v7 sizeCategory:v9 titleLabelText:width screenScale:v11];
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.height = v17;
  result.double width = v16;
  return result;
}

- (void)layoutSubviews
{
  v81.receiver = self;
  v81.super_class = (Class)_UIActivityGroupActivityCell;
  [(_UIActivityGroupActivityCell *)&v81 layoutSubviews];
  v3 = [(_UIActivityGroupActivityCell *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];

  int v5 = [(_UIActivityGroupActivityCell *)self _shouldReverseLayoutDirection];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);
  v7 = [(_UIActivityGroupActivityCell *)self traitCollection];
  [v7 displayScale];

  id v8 = [(_UIActivityGroupActivityCell *)self contentView];
  [v8 bounds];
  CGRectGetMidX(v82);

  id v9 = [(_UIActivityGroupActivityCell *)self contentView];
  [v9 bounds];
  CGRectGetMidY(v83);

  double ChickletSize = getChickletSize();
  if (IsAccessibilityCategory)
  {
    if (v5)
    {
      double v11 = [(_UIActivityGroupActivityCell *)self contentView];
      [v11 bounds];
      CGRectGetMaxX(v84);
    }
    UIRoundToScale();
  }
  UIRectIntegralWithScale();
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(_UIActivityGroupActivityCell *)self shadowView];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  id v21 = (void *)MEMORY[0x1E4FB14C0];
  v22 = [(_UIActivityGroupActivityCell *)self shadowView];
  [v22 bounds];
  objc_msgSend(v21, "bezierPathWithRoundedRect:cornerRadius:");
  id v23 = objc_claimAutoreleasedReturnValue();
  uint64_t v24 = [v23 CGPath];
  v25 = [(_UIActivityGroupActivityCell *)self shadowView];
  float v26 = [v25 layer];
  [v26 setShadowPath:v24];

  UIRectIntegralWithScale();
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v35 = [(_UIActivityGroupActivityCell *)self imageView];
  double v36 = v32;
  double v37 = ChickletSize;
  objc_msgSend(v35, "setFrame:", v28, v30, v36, v34);

  UIRectIntegralWithScale();
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v46 = [(_UIActivityGroupActivityCell *)self imageSlot];
  objc_msgSend(v46, "setFrame:", v39, v41, v43, v45);

  double v47 = [(_UIActivityGroupActivityCell *)self contentView];
  [v47 bounds];
  double Width = CGRectGetWidth(v85);

  if (IsAccessibilityCategory)
  {
    v49 = [(_UIActivityGroupActivityCell *)self titleLabel];
    v50 = [v49 text];
    getTitleLabelHeightForWidthTextAndSizeCategory(v50, v4, Width - (v37 + 1.0 + 10.0));

    if ((v5 & 1) == 0)
    {
      v51 = [(_UIActivityGroupActivityCell *)self imageView];
      [v51 frame];
      CGRectGetMaxX(v86);
    }
  }
  else
  {
    getTitleLabelHeightForWidthTextAndSizeCategory(@"\n", v4, Width + -1.0);
    v52 = getTitleLabelFontForWidthTextAndSizeCategory(v4, Width + -1.0);
    [v52 ascender];
    v53 = [(_UIActivityGroupActivityCell *)self imageView];
    [v53 frame];
    CGRectGetMaxY(v87);
  }
  UIRectIntegralWithScale();
  double v55 = v54;
  double v57 = v56;
  double v59 = v58;
  double v61 = v60;
  v62 = [(_UIActivityGroupActivityCell *)self titleLabel];
  objc_msgSend(v62, "setFrame:", v55, v57, v59, v61);

  v63 = [(_UIActivityGroupActivityCell *)self titleLabel];
  [v63 frame];
  double v65 = v64;
  double v67 = v66;
  double v69 = v68;
  double v71 = v70;
  v72 = [(_UIActivityGroupActivityCell *)self titleSlot];
  objc_msgSend(v72, "setFrame:", v65, v67, v69, v71);

  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    v73 = [(_UIActivityGroupActivityCell *)self contentView];
    [v73 frame];
    double v75 = v74;
    double v77 = v76;
    double v79 = v78;

    v80 = [(_UIActivityGroupActivityCell *)self contentView];
    objc_msgSend(v80, "setFrame:", v75, 0.0, v77, v79);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)_UIActivityGroupActivityCell;
  id v4 = a3;
  [(_UIActivityGroupActivityCell *)&v13 traitCollectionDidChange:v4];
  int v5 = [(_UIActivityGroupActivityCell *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  v7 = [v4 preferredContentSizeCategory];

  LOBYTE(v4) = [v6 isEqualToString:v7];
  if ((v4 & 1) == 0)
  {
    id v8 = [(_UIActivityGroupActivityCell *)self traitCollection];
    id v9 = [v8 preferredContentSizeCategory];

    if (([v9 isEqualToString:*MEMORY[0x1E4FB27F0]] & 1) == 0)
    {
      id v10 = [(_UIActivityGroupActivityCell *)self traitCollection];
      double v11 = [v10 preferredContentSizeCategory];
      BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v11);

      if (!IsAccessibilityCategory) {
        [(id)sCachedCellWidthBySheetWidth removeAllObjects];
      }
    }
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(_UIActivityGroupActivityCell *)self imageSlot];
  id v6 = [v5 layer];
  v7 = [v6 contents];

  id v8 = [(_UIActivityGroupActivityCell *)self titleSlot];
  id v9 = [v8 layer];
  id v10 = [v9 contents];

  v16.receiver = self;
  v16.super_class = (Class)_UIActivityGroupActivityCell;
  [(_UIActivityGroupActivityCell *)&v16 setHighlighted:v3];
  double v11 = [(_UIActivityGroupActivityCell *)self imageSlot];
  double v12 = [v11 layer];
  [v12 setContents:v7];

  objc_super v13 = [(_UIActivityGroupActivityCell *)self titleSlot];
  double v14 = [v13 layer];
  [v14 setContents:v10];

  [(_UIActivityGroupActivityCell *)self initHighlightLayerIfNeeded];
  double v15 = [(_UIActivityGroupActivityCell *)self highlightLayer];
  [v15 setHidden:v3 ^ 1];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(_UIActivityGroupActivityCell *)self imageSlot];
  id v6 = [v5 layer];
  v7 = [v6 contents];

  id v8 = [(_UIActivityGroupActivityCell *)self titleSlot];
  id v9 = [v8 layer];
  id v10 = [v9 contents];

  v15.receiver = self;
  v15.super_class = (Class)_UIActivityGroupActivityCell;
  [(_UIActivityGroupActivityCell *)&v15 setSelected:v3];
  double v11 = [(_UIActivityGroupActivityCell *)self imageSlot];
  double v12 = [v11 layer];
  [v12 setContents:v7];

  objc_super v13 = [(_UIActivityGroupActivityCell *)self titleSlot];
  double v14 = [v13 layer];
  [v14 setContents:v10];
}

- (void)initHighlightLayerIfNeeded
{
  BOOL v3 = [(_UIActivityGroupActivityCell *)self highlightLayer];

  if (!v3)
  {
    id v9 = [MEMORY[0x1E4F39BE8] layer];
    id v4 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.466666667];
    objc_msgSend(v9, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));

    [v9 setCornerRadius:12.0];
    int v5 = [(_UIActivityGroupActivityCell *)self imageSlot];
    id v6 = [v5 layer];
    [v6 bounds];
    objc_msgSend(v9, "setFrame:");

    [v9 setHidden:1];
    [(_UIActivityGroupActivityCell *)self setHighlightLayer:v9];
    v7 = [(_UIActivityGroupActivityCell *)self imageSlot];
    id v8 = [v7 layer];
    [v8 insertSublayer:v9 atIndex:0];
  }
}

- (void)updateHighlightedImageViewIfNeeded
{
  [(_UIActivityGroupActivityCell *)self initHighlightedImageViewIfNeeded];
  id v5 = [(_UIActivityGroupActivityCell *)self imageView];
  BOOL v3 = [v5 image];
  id v4 = [(_UIActivityGroupActivityCell *)self highlightedImageView];
  [v4 setImage:v3];
}

- (void)initHighlightedImageViewIfNeeded
{
  BOOL v3 = [(_UIActivityGroupActivityCell *)self highlightedImageView];

  if (!v3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __64___UIActivityGroupActivityCell_initHighlightedImageViewIfNeeded__block_invoke;
    v4[3] = &unk_1E5A21900;
    v4[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v4];
  }
}

- (unint64_t)sequence
{
  return self->_sequence;
}

- (void)setSequence:(unint64_t)a3
{
  self->_sequence = a3;
}

- (_UIActivityGroupActivityCellTitleLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIView)imageSlot
{
  return self->_imageSlot;
}

- (void)setImageSlot:(id)a3
{
}

- (UIView)titleSlot
{
  return self->_titleSlot;
}

- (void)setTitleSlot:(id)a3
{
}

- (_UIHostActivityProxy)activityProxy
{
  return self->_activityProxy;
}

- (void)setActivityProxy:(id)a3
{
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
}

- (UIImageView)highlightedImageView
{
  return self->_highlightedImageView;
}

- (void)setHighlightedImageView:(id)a3
{
}

- (CALayer)highlightLayer
{
  return self->_highlightLayer;
}

- (void)setHighlightLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightLayer, 0);
  objc_storeStrong((id *)&self->_highlightedImageView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_activityProxy, 0);
  objc_storeStrong((id *)&self->_titleSlot, 0);
  objc_storeStrong((id *)&self->_imageSlot, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

- (id)draggingView
{
  [(_UIActivityGroupActivityCell *)self frame];
  v7 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", v3, v4, v5, v6);
  id v8 = [(_UIActivityGroupActivityCell *)self titleLabel];
  id v9 = [v8 text];
  id v10 = [v7 titleLabel];
  [v10 setText:v9];

  double v11 = [(_UIActivityGroupActivityCell *)self imageView];
  double v12 = [v11 image];
  objc_super v13 = [v7 imageView];
  [v13 setImage:v12];

  double v14 = [(_UIActivityGroupActivityCell *)self shadowView];
  [v7 setShadowView:v14];

  objc_msgSend(v7, "setHighlighted:", -[_UIActivityGroupActivityCell isHighlighted](self, "isHighlighted"));
  objc_super v15 = [(_UIActivityGroupActivityCell *)self imageSlot];
  [v7 setImageSlot:v15];

  objc_super v16 = [(_UIActivityGroupActivityCell *)self titleSlot];
  [v7 setTitleSlot:v16];

  [v7 setUserInteractionEnabled:0];
  return v7;
}

@end