@interface SUUIItemBrowseCellLayout
- (BOOL)isLargeSpacing;
- (CGSize)imageBoundingSize;
- (NSString)indexNumberString;
- (NSString)subtitle;
- (NSString)title;
- (SUUIItemBrowseCellLayout)initWithCollectionViewCell:(id)a3;
- (SUUIItemBrowseCellLayout)initWithParentView:(id)a3;
- (SUUIItemBrowseCellLayout)initWithTableViewCell:(id)a3;
- (double)userRating;
- (id)_decimalNumberFormatter;
- (int64_t)numberOfUserRatings;
- (void)_initSUUIItemBrowseCellLayout;
- (void)_reloadUserRatingViews;
- (void)layoutForItemOfferChange;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setColoringWithColorScheme:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setImageBoundingSize:(CGSize)a3;
- (void)setIndexNumberString:(id)a3;
- (void)setLargeSpacing:(BOOL)a3;
- (void)setNumberOfUserRatings:(int64_t)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserRating:(double)a3;
@end

@implementation SUUIItemBrowseCellLayout

- (SUUIItemBrowseCellLayout)initWithCollectionViewCell:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIItemBrowseCellLayout;
  v3 = [(SUUICellLayout *)&v6 initWithCollectionViewCell:a3];
  v4 = v3;
  if (v3) {
    [(SUUIItemBrowseCellLayout *)v3 _initSUUIItemBrowseCellLayout];
  }
  return v4;
}

- (SUUIItemBrowseCellLayout)initWithParentView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIItemBrowseCellLayout;
  v3 = [(SUUICellLayout *)&v6 initWithParentView:a3];
  v4 = v3;
  if (v3) {
    [(SUUIItemBrowseCellLayout *)v3 _initSUUIItemBrowseCellLayout];
  }
  return v4;
}

- (SUUIItemBrowseCellLayout)initWithTableViewCell:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIItemBrowseCellLayout;
  v3 = [(SUUICellLayout *)&v6 initWithTableViewCell:a3];
  v4 = v3;
  if (v3) {
    [(SUUIItemBrowseCellLayout *)v3 _initSUUIItemBrowseCellLayout];
  }
  return v4;
}

- (NSString)indexNumberString
{
  v2 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView indexNumberLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setColoringWithColorScheme:(id)a3
{
  id v4 = a3;
  v5 = [v4 primaryTextColor];
  primaryTextColor = self->_primaryTextColor;
  self->_primaryTextColor = v5;

  v7 = [(SUUIItemCellLayout *)self itemOfferNoticeLabel];
  v8 = v7;
  if (self->_primaryTextColor)
  {
    objc_msgSend(v7, "setTextColor:");
  }
  else
  {
    v9 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
    [v8 setTextColor:v9];
  }
  v10 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView subtitleLabel];
  v11 = v10;
  if (self->_primaryTextColor)
  {
    objc_msgSend(v10, "setTextColor:");
  }
  else
  {
    v12 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
    [v11 setTextColor:v12];
  }
  v13 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView indexNumberLabel];
  v14 = v13;
  if (self->_primaryTextColor)
  {
    objc_msgSend(v13, "setTextColor:");
  }
  else
  {
    v15 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.4];
    [v14 setTextColor:v15];
  }
  v16 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView userRatingLabel];
  v17 = v16;
  if (self->_primaryTextColor)
  {
    objc_msgSend(v16, "setTextColor:");
  }
  else
  {
    v18 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
    [v17 setTextColor:v18];
  }
  v19 = [v4 secondaryTextColor];

  v20 = v19;
  if (!v19) {
    v20 = self->_primaryTextColor;
  }
  objc_storeStrong((id *)&self->_secondaryTextColor, v20);

  v21 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView titleLabel];
  id v23 = v21;
  if (self->_secondaryTextColor)
  {
    objc_msgSend(v21, "setTextColor:");
  }
  else
  {
    v22 = [MEMORY[0x263F825C8] blackColor];
    [v23 setTextColor:v22];
  }
}

- (void)setImageBoundingSize:(CGSize)a3
{
  if (self->_imageBoundingSize.width != a3.width || self->_imageBoundingSize.height != a3.height)
  {
    self->_imageBoundingSize = a3;
    [(SUUICellLayout *)self setNeedsLayout];
  }
}

- (void)setIndexNumberString:(id)a3
{
  id v22 = a3;
  id v4 = [(SUUIItemBrowseCellLayout *)self indexNumberString];
  if (v4 != v22 && ([v4 isEqualToString:v22] & 1) == 0)
  {
    cellContentView = self->_cellContentView;
    if (v22)
    {
      objc_super v6 = [(_SUUIItemBrowseCellContentView *)cellContentView indexNumberLabel];

      if (!v6)
      {
        v7 = self->_cellContentView;
        id v8 = objc_alloc_init(MEMORY[0x263F828E0]);
        [(_SUUIItemBrowseCellContentView *)v7 setIndexNumberLabel:v8];

        v9 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView indexNumberLabel];
        [v9 setAdjustsFontSizeToFitWidth:1];

        v10 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView indexNumberLabel];
        v11 = [(SUUICellLayout *)self parentCellView];
        v12 = [v11 backgroundColor];
        [v10 setBackgroundColor:v12];

        v13 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView indexNumberLabel];
        [v13 setTextAlignment:1];

        v14 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView indexNumberLabel];
        v15 = v14;
        if (self->_primaryTextColor)
        {
          objc_msgSend(v14, "setTextColor:");
        }
        else
        {
          v16 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.4];
          [v15 setTextColor:v16];
        }
        BOOL largeSpacing = self->_largeSpacing;
        v18 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView indexNumberLabel];
        double v19 = 20.0;
        if (!largeSpacing) {
          double v19 = 15.0;
        }
        v20 = [MEMORY[0x263F81708] systemFontOfSize:v19];
        [v18 setFont:v20];
      }
      v21 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView indexNumberLabel];
      [v21 setText:v22];
    }
    else
    {
      [(_SUUIItemBrowseCellContentView *)cellContentView setIndexNumberLabel:0];
    }
    [(SUUICellLayout *)self setNeedsLayout];
  }
}

- (void)setLargeSpacing:(BOOL)a3
{
  if (self->_largeSpacing != a3)
  {
    self->_BOOL largeSpacing = a3;
    [(SUUICellLayout *)self setNeedsLayout];
  }
}

- (void)setNumberOfUserRatings:(int64_t)a3
{
  if (self->_numberOfUserRatings != a3
    || ([(_SUUIItemBrowseCellContentView *)self->_cellContentView userRatingLabel],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    self->_numberOfUserRatings = a3;
    [(SUUIItemBrowseCellLayout *)self _reloadUserRatingViews];
  }
}

- (void)setSubtitle:(id)a3
{
  id v18 = a3;
  id v4 = [(SUUIItemBrowseCellLayout *)self subtitle];
  if (v4 != v18 && ([v4 isEqualToString:v18] & 1) == 0)
  {
    cellContentView = self->_cellContentView;
    if (v18)
    {
      objc_super v6 = [(_SUUIItemBrowseCellContentView *)cellContentView subtitleLabel];

      if (!v6)
      {
        v7 = self->_cellContentView;
        id v8 = objc_alloc_init(MEMORY[0x263F828E0]);
        [(_SUUIItemBrowseCellContentView *)v7 setSubtitleLabel:v8];

        v9 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView subtitleLabel];
        v10 = [(SUUICellLayout *)self parentCellView];
        v11 = [v10 backgroundColor];
        [v9 setBackgroundColor:v11];

        v12 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView subtitleLabel];
        v13 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
        [v12 setFont:v13];

        v14 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView subtitleLabel];
        v15 = v14;
        if (self->_primaryTextColor)
        {
          objc_msgSend(v14, "setTextColor:");
        }
        else
        {
          v16 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
          [v15 setTextColor:v16];
        }
      }
      v17 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView subtitleLabel];
      [v17 setText:v18];
    }
    else
    {
      [(_SUUIItemBrowseCellContentView *)cellContentView setSubtitleLabel:0];
    }
    [(SUUICellLayout *)self setNeedsLayout];
    [(_SUUIItemBrowseCellContentView *)self->_cellContentView setNeedsDisplay];
  }
}

- (void)setTitle:(id)a3
{
  id v19 = a3;
  id v4 = [(SUUIItemBrowseCellLayout *)self title];
  if (v4 != v19 && ([v4 isEqualToString:v19] & 1) == 0)
  {
    cellContentView = self->_cellContentView;
    if (v19)
    {
      objc_super v6 = [(_SUUIItemBrowseCellContentView *)cellContentView titleLabel];

      if (!v6)
      {
        v7 = self->_cellContentView;
        id v8 = objc_alloc_init(MEMORY[0x263F828E0]);
        [(_SUUIItemBrowseCellContentView *)v7 setTitleLabel:v8];

        v9 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView titleLabel];
        [v9 setNumberOfLines:2];

        v10 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView titleLabel];
        v11 = [(SUUICellLayout *)self parentCellView];
        v12 = [v11 backgroundColor];
        [v10 setBackgroundColor:v12];

        v13 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView titleLabel];
        v14 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
        [v13 setFont:v14];

        v15 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView titleLabel];
        v16 = v15;
        if (self->_secondaryTextColor)
        {
          objc_msgSend(v15, "setTextColor:");
        }
        else
        {
          v17 = [MEMORY[0x263F825C8] blackColor];
          [v16 setTextColor:v17];
        }
      }
      id v18 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView titleLabel];
      [v18 setText:v19];
    }
    else
    {
      [(_SUUIItemBrowseCellContentView *)cellContentView setTitleLabel:0];
    }
    [(SUUICellLayout *)self setNeedsLayout];
  }
}

- (void)setUserRating:(double)a3
{
  if (self->_userRating != a3
    || ([(_SUUIItemBrowseCellContentView *)self->_cellContentView userRatingImageView],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    self->_userRating = a3;
    [(SUUIItemBrowseCellLayout *)self _reloadUserRatingViews];
  }
}

- (NSString)subtitle
{
  v2 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView subtitleLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (NSString)title
{
  v2 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView titleLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)layoutForItemOfferChange
{
  v3 = [(SUUICellLayout *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  id v24 = [(SUUIItemCellLayout *)self itemOfferButton];
  [v24 frame];
  objc_msgSend(v24, "sizeThatFits:", *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
  double v9 = v8;
  double v11 = v10;
  double v12 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v13 = *(double *)(MEMORY[0x263F001A8] + 24);
  v14 = [(SUUIItemCellLayout *)self itemOfferNoticeLabel];
  if ([v14 isHidden])
  {

    v14 = 0;
  }
  else if (v14)
  {
    [v14 frame];
    objc_msgSend(v14, "sizeThatFits:", v9 + 10.0, 1.79769313e308);
    double v12 = v15;
    double v13 = v16;
    double v17 = v11 + v16 + 3.0;
    goto LABEL_6;
  }
  double v17 = v11;
LABEL_6:
  float v18 = (v7 - v17) * 0.5;
  CGFloat v19 = floorf(v18);
  CGFloat v20 = v5 + -15.0 - v9;
  float v21 = (v9 - v12) * 0.5;
  CGFloat v22 = v20 + floorf(v21);
  v26.origin.x = v20;
  v26.origin.y = v19;
  v26.size.width = v9;
  v26.size.height = v11;
  CGFloat v23 = CGRectGetMaxY(v26) + 3.0;
  objc_msgSend(v24, "setFrame:", v20, v19, v9, v11);
  objc_msgSend(v14, "setFrame:", v22, v23, v12, v13);
}

- (void)layoutSubviews
{
  v83.receiver = self;
  v83.super_class = (Class)SUUIItemBrowseCellLayout;
  [(SUUICellLayout *)&v83 layoutSubviews];
  v3 = [(SUUICellLayout *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[_SUUIItemBrowseCellContentView setFrame:](self->_cellContentView, "setFrame:", v5, v7, v9, v11);
  [(_SUUIItemBrowseCellContentView *)self->_cellContentView setNeedsDisplay];
  double v12 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView indexNumberLabel];

  if (v12)
  {
    double v13 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView indexNumberLabel];
    [v13 frame];

    if (self->_largeSpacing) {
      double v14 = 24.0;
    }
    else {
      double v14 = 21.0;
    }
    if (self->_largeSpacing) {
      double v15 = 32.0;
    }
    else {
      double v15 = 24.0;
    }
    float v16 = (v11 - v14) * 0.5;
    CGFloat v17 = floorf(v16);
    float v18 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView indexNumberLabel];
    objc_msgSend(v18, "setFrame:", 10.0, v17, v15, v14);

    v84.origin.x = 10.0;
    v84.origin.y = v17;
    v84.size.double width = v15;
    v84.size.double height = v14;
    double v19 = CGRectGetMaxX(v84) + 10.0;
  }
  else
  {
    double v19 = 15.0;
  }
  CGFloat v20 = [(SUUIItemCellLayout *)self iconImageView];
  float v21 = v20;
  if (v20)
  {
    [v20 frame];
    double width = self->_imageBoundingSize.width;
    if (width <= 0.00000011920929)
    {
      double height = v23;
      double width = v22;
    }
    else
    {
      double height = self->_imageBoundingSize.height;
    }
    CGFloat v26 = floor((v11 - height) * 0.5);
    objc_msgSend(v21, "setFrame:", v19, v26, width, height);
    v85.origin.x = v19;
    v85.origin.y = v26;
    v85.size.double width = width;
    v85.size.double height = height;
    double v19 = CGRectGetMaxX(v85) + 10.0;
  }
  v86.origin.x = v5;
  v86.origin.y = v7;
  v86.size.double width = v9;
  v86.size.double height = v11;
  double MaxX = CGRectGetMaxX(v86);
  v28 = [(SUUIItemCellLayout *)self itemOfferNoticeLabel];
  if ([v28 isHidden])
  {

    v28 = 0;
  }
  else if (self->_primaryTextColor)
  {
    objc_msgSend(v28, "setTextColor:");
  }
  else
  {
    v29 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
    [v28 setTextColor:v29];
  }
  double v30 = MaxX + -15.0;
  v31 = [(SUUIItemCellLayout *)self itemOfferButton];
  v32 = v31;
  if (v31 && ([v31 isHidden] & 1) == 0)
  {
    [v32 frame];
    double v34 = v33;
    double v36 = v35;
    objc_msgSend(v32, "layoutSizeThatFits:", *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
    double v81 = v19;
    double v82 = v37;
    if (v28)
    {
      objc_msgSend(v28, "sizeThatFits:", v37 + 10.0, 1.79769313e308);
      double v39 = v38;
      double v80 = v40;
      double v41 = v36 + v40 + 3.0;
    }
    else
    {
      double v39 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v80 = *(double *)(MEMORY[0x263F001A8] + 24);
      double v41 = v36;
    }
    double v42 = v30;
    CGFloat v43 = v30 - v34;
    float v44 = (v11 - v41) * 0.5;
    CGFloat v45 = floorf(v44);
    float v46 = (v34 - v39) * 0.5;
    CGFloat v47 = v43 + floorf(v46);
    v87.origin.x = v43;
    v87.origin.y = v45;
    v87.size.double width = v34;
    v87.size.double height = v36;
    CGFloat MaxY = CGRectGetMaxY(v87);
    double v49 = v36;
    CGFloat v50 = MaxY + 3.0;
    objc_msgSend(v32, "setFrame:", v43, v45, v34, v49);
    objc_msgSend(v28, "setFrame:", v47, v50, v39, v80);
    double v19 = v81;
    double v30 = v42 - v82 + -15.0;
  }
  v51 = [(SUUIItemCellLayout *)self removeControlView];
  v52 = v51;
  if (v51)
  {
    [v51 frame];
    double v30 = v53 + -15.0;
  }
  double v54 = v30 - v19;
  v55 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView titleLabel];
  objc_msgSend(v55, "sizeThatFits:", v30 - v19, 1.79769313e308);
  double v57 = v56;

  v58 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView userRatingImageView];
  v59 = v58;
  double v60 = 0.0;
  if (v58 && ([v58 isHidden] & 1) == 0)
  {
    [v59 frame];
    double v60 = v61;
  }
  v62 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView userRatingLabel];

  if (v60 >= 16.0) {
    double v63 = v60;
  }
  else {
    double v63 = 16.0;
  }
  if (v62) {
    double v60 = v63;
  }
  double v64 = v60 + 1.0;
  if (v60 <= 0.00000011920929) {
    double v64 = 0.0;
  }
  float v65 = (v11 - (v57 + 1.0 + 16.0 + v64)) * 0.5;
  double v66 = ceilf(v65);
  v67 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView titleLabel];

  if (v67)
  {
    v68 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView titleLabel];
    [v68 frame];

    v69 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView titleLabel];
    objc_msgSend(v69, "setFrame:", v19, v66, v30 - v19, v57);

    v88.origin.x = v19;
    v88.origin.y = v66;
    v88.size.double width = v30 - v19;
    v88.size.double height = v57;
    double v66 = CGRectGetMaxY(v88) + 1.0;
  }
  v70 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView subtitleLabel];

  if (v70)
  {
    v71 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView subtitleLabel];
    [v71 frame];

    v72 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView subtitleLabel];
    objc_msgSend(v72, "setFrame:", v19, v66, v30 - v19, 16.0);

    v89.size.double height = 16.0;
    v89.origin.x = v19;
    v89.origin.y = v66;
    v89.size.double width = v30 - v19;
    double v66 = CGRectGetMaxY(v89);
  }
  if (v59 && ([v59 isHidden] & 1) == 0)
  {
    [v59 frame];
    float v74 = (v60 - v73) * 0.5;
    objc_msgSend(v59, "setFrame:", v19, v66 + 1.0 + floorf(v74));
  }
  v75 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView userRatingLabel];

  if (v75)
  {
    v76 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView userRatingLabel];
    [v76 frame];

    if (v59 && ([v59 isHidden] & 1) == 0)
    {
      [v59 frame];
      double v19 = CGRectGetMaxX(v90) + 3.0;
      double v54 = v30 - v19;
    }
    float v77 = (v60 + -16.0) * 0.5;
    double v78 = v66 + floorf(v77);
    v79 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView userRatingLabel];
    objc_msgSend(v79, "setFrame:", v19, v78, v54, 16.0);
  }
}

- (void)setBackgroundColor:(id)a3
{
  cellContentView = self->_cellContentView;
  id v5 = a3;
  [(_SUUIItemBrowseCellContentView *)cellContentView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIItemBrowseCellLayout;
  [(SUUIItemCellLayout *)&v6 setBackgroundColor:v5];
}

- (void)setIconImage:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIItemBrowseCellLayout;
  [(SUUIItemCellLayout *)&v7 setIconImage:a3];
  double v4 = [(SUUIItemCellLayout *)self iconImageView];
  [v4 setContentMode:4];

  id v5 = [(SUUICellLayout *)self contentView];
  objc_super v6 = [(SUUIItemCellLayout *)self iconImageView];
  [v5 insertSubview:v6 aboveSubview:self->_cellContentView];
}

- (id)_decimalNumberFormatter
{
  if (_decimalNumberFormatter_sOnce_0 != -1) {
    dispatch_once(&_decimalNumberFormatter_sOnce_0, &__block_literal_global_57);
  }
  v2 = (void *)_decimalNumberFormatter_sNumberFormatter_0;
  return v2;
}

uint64_t __51__SUUIItemBrowseCellLayout__decimalNumberFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  v1 = (void *)_decimalNumberFormatter_sNumberFormatter_0;
  _decimalNumberFormatter_sNumberFormatter_0 = (uint64_t)v0;

  v2 = (void *)_decimalNumberFormatter_sNumberFormatter_0;
  return [v2 setNumberStyle:1];
}

- (void)_initSUUIItemBrowseCellLayout
{
  v3 = [MEMORY[0x263F82670] currentDevice];
  self->_BOOL largeSpacing = [v3 userInterfaceIdiom] == 1;

  double v4 = objc_alloc_init(_SUUIItemBrowseCellContentView);
  cellContentView = self->_cellContentView;
  self->_cellContentView = v4;

  id v6 = [(SUUICellLayout *)self contentView];
  [v6 addSubview:self->_cellContentView];
}

- (void)_reloadUserRatingViews
{
  id v20 = [(SUUICellLayout *)self parentCellView];
  v3 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView userRatingLabel];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F828E0]);
    id v5 = [v20 backgroundColor];
    [v4 setBackgroundColor:v5];

    id v6 = [MEMORY[0x263F81708] systemFontOfSize:10.0];
    [v4 setFont:v6];

    if (self->_primaryTextColor)
    {
      objc_msgSend(v4, "setTextColor:");
    }
    else
    {
      objc_super v7 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
      [v4 setTextColor:v7];
    }
    [(_SUUIItemBrowseCellContentView *)self->_cellContentView setUserRatingLabel:v4];
  }
  if (self->_numberOfUserRatings)
  {
    double v8 = [(SUUIItemBrowseCellLayout *)self _decimalNumberFormatter];
    double v9 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView userRatingLabel];
    double v10 = NSString;
    double v11 = [NSNumber numberWithInteger:self->_numberOfUserRatings];
    double v12 = [v8 stringFromNumber:v11];
    double v13 = [v10 stringWithFormat:@"(%@)", v12];
    [v9 setText:v13];

    double v14 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView userRatingImageView];
    if (!v14)
    {
      double v14 = objc_alloc_init(SUUICellImageView);
      [(_SUUIItemBrowseCellContentView *)self->_cellContentView setUserRatingImageView:v14];
      double v15 = [v20 backgroundColor];
      [(SUUICellImageView *)v14 setBackgroundColor:v15];
    }
    float v16 = +[SUUIRatingStarsCache cacheWithProperties:1];
    [(SUUICellImageView *)v14 setHidden:0];
    CGFloat v17 = [v16 ratingStarsImageForRating:self->_userRating];
    [(SUUICellImageView *)v14 setImage:v17];

    [(SUUICellImageView *)v14 sizeToFit];
  }
  else
  {
    float v18 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView userRatingImageView];
    [v18 setHidden:1];

    double v8 = [(_SUUIItemBrowseCellContentView *)self->_cellContentView userRatingLabel];
    double v19 = [(SUUICellLayout *)self clientContext];
    double v14 = v19;
    if (v19) {
      [(SUUICellImageView *)v19 localizedStringForKey:@"NO_RATINGS"];
    }
    else {
    float v16 = +[SUUIClientContext localizedStringForKey:@"NO_RATINGS" inBundles:0];
    }
    [v8 setText:v16];
  }

  [(SUUICellLayout *)self setNeedsLayout];
}

- (CGSize)imageBoundingSize
{
  double width = self->_imageBoundingSize.width;
  double height = self->_imageBoundingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isLargeSpacing
{
  return self->_largeSpacing;
}

- (int64_t)numberOfUserRatings
{
  return self->_numberOfUserRatings;
}

- (double)userRating
{
  return self->_userRating;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_cellContentView, 0);
}

@end