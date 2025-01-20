@interface WFRichContentItemCellView
- (BOOL)alwaysLeftAlign;
- (BOOL)hasImage;
- (NSArray)firstRowConstraintsWithAltText;
- (NSArray)firstRowConstraintsWithoutAltText;
- (NSArray)verticalConstraintsWithSubtitle;
- (NSArray)verticalConstraintsWithoutSubtitle;
- (NSLayoutConstraint)imageHeightConstraint;
- (NSLayoutConstraint)imageLeadingConstraint;
- (NSLayoutConstraint)imageWidthConstraint;
- (NSString)accessibilityLabel;
- (UIImage)image;
- (UIImageView)imageView;
- (UILabel)altLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (WFContentItem)item;
- (WFRichContentItemCellView)initWithFrame:(CGRect)a3;
- (double)imageDimension;
- (unint64_t)imageRoundingStyle;
- (void)layoutSubviews;
- (void)setAltLabel:(id)a3;
- (void)setAlwaysLeftAlign:(BOOL)a3;
- (void)setAttributedAlertButton:(id)a3;
- (void)setContentAlertButton:(id)a3;
- (void)setFirstRowConstraintsWithAltText:(id)a3;
- (void)setFirstRowConstraintsWithoutAltText:(id)a3;
- (void)setHasImage:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImage:(id)a3 options:(id)a4;
- (void)setImageHeightConstraint:(id)a3;
- (void)setImageLeadingConstraint:(id)a3;
- (void)setImageRoundingStyle:(unint64_t)a3;
- (void)setImageView:(id)a3;
- (void)setImageWidthConstraint:(id)a3;
- (void)setItem:(id)a3;
- (void)setSelectableAlertButton:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setVerticalConstraintsWithSubtitle:(id)a3;
- (void)setVerticalConstraintsWithoutSubtitle:(id)a3;
- (void)tintColorDidChange;
- (void)updateConstraints;
- (void)updateImageCornerRadius;
@end

@implementation WFRichContentItemCellView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalConstraintsWithoutSubtitle, 0);
  objc_storeStrong((id *)&self->_verticalConstraintsWithSubtitle, 0);
  objc_storeStrong((id *)&self->_firstRowConstraintsWithoutAltText, 0);
  objc_storeStrong((id *)&self->_firstRowConstraintsWithAltText, 0);
  objc_storeStrong((id *)&self->_imageLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_imageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_imageHeightConstraint, 0);
  objc_destroyWeak((id *)&self->_imageView);
  objc_destroyWeak((id *)&self->_altLabel);
  objc_destroyWeak((id *)&self->_subtitleLabel);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

- (void)setVerticalConstraintsWithoutSubtitle:(id)a3
{
}

- (NSArray)verticalConstraintsWithoutSubtitle
{
  return self->_verticalConstraintsWithoutSubtitle;
}

- (void)setVerticalConstraintsWithSubtitle:(id)a3
{
}

- (NSArray)verticalConstraintsWithSubtitle
{
  return self->_verticalConstraintsWithSubtitle;
}

- (void)setFirstRowConstraintsWithoutAltText:(id)a3
{
}

- (NSArray)firstRowConstraintsWithoutAltText
{
  return self->_firstRowConstraintsWithoutAltText;
}

- (void)setFirstRowConstraintsWithAltText:(id)a3
{
}

- (NSArray)firstRowConstraintsWithAltText
{
  return self->_firstRowConstraintsWithAltText;
}

- (void)setImageLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageLeadingConstraint
{
  return self->_imageLeadingConstraint;
}

- (void)setImageWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageWidthConstraint
{
  return self->_imageWidthConstraint;
}

- (void)setImageHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageHeightConstraint
{
  return self->_imageHeightConstraint;
}

- (void)setImageRoundingStyle:(unint64_t)a3
{
  self->_imageRoundingStyle = a3;
}

- (unint64_t)imageRoundingStyle
{
  return self->_imageRoundingStyle;
}

- (BOOL)hasImage
{
  return self->_hasImage;
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)imageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageView);
  return (UIImageView *)WeakRetained;
}

- (void)setAltLabel:(id)a3
{
}

- (UILabel)altLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_altLabel);
  return (UILabel *)WeakRetained;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_subtitleLabel);
  return (UILabel *)WeakRetained;
}

- (void)setItem:(id)a3
{
}

- (WFContentItem)item
{
  return self->_item;
}

- (void)setAlwaysLeftAlign:(BOOL)a3
{
  self->_alwaysLeftAlign = a3;
}

- (BOOL)alwaysLeftAlign
{
  return self->_alwaysLeftAlign;
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setContentAlertButton:(id)a3
{
  id v4 = a3;
  v5 = [v4 contentItem];
  if (v5 != self->_item)
  {
    objc_initWeak(location, self);
    objc_initWeak(&from, v5);
    objc_storeStrong((id *)&self->_item, v5);
    v6 = [(WFContentItem *)v5 richListTitle];
    v7 = [(WFRichContentItemCellView *)self titleLabel];
    [v7 setText:v6];

    v8 = [(WFRichContentItemCellView *)self subtitleLabel];
    [v8 setText:0];

    v9 = [(WFRichContentItemCellView *)self altLabel];
    [v9 setText:0];

    [(WFRichContentItemCellView *)self setImage:0 options:0];
    int v10 = [v4 hideSubtitle];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __51__WFRichContentItemCellView_setContentAlertButton___block_invoke;
    v23[3] = &unk_264C50A98;
    objc_copyWeak(&v24, location);
    objc_copyWeak(&v25, &from);
    [v4 getSubtitle:v23];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __51__WFRichContentItemCellView_setContentAlertButton___block_invoke_2;
    v20[3] = &unk_264C50A98;
    objc_copyWeak(&v21, location);
    objc_copyWeak(&v22, &from);
    char v11 = [(WFContentItem *)v5 getListAltText:v20];
    [(WFRichContentItemCellView *)self imageDimension];
    double v13 = v12;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __51__WFRichContentItemCellView_setContentAlertButton___block_invoke_3;
    v17[3] = &unk_264C50AC0;
    objc_copyWeak(&v18, location);
    objc_copyWeak(&v19, &from);
    -[WFRichContentItemCellView setHasImage:](self, "setHasImage:", -[WFContentItem getListThumbnail:forSize:](v5, "getListThumbnail:forSize:", v17, v13, v13));
    if (self->_hasImage) {
      char v14 = 1;
    }
    else {
      char v14 = v11;
    }
    uint64_t v15 = 4;
    if ((v14 & 1) == 0 && ((v10 ^ 1) & 1) == 0)
    {
      if (self->_alwaysLeftAlign) {
        uint64_t v15 = 4;
      }
      else {
        uint64_t v15 = 1;
      }
    }
    v16 = [(WFRichContentItemCellView *)self titleLabel];
    [v16 setTextAlignment:v15];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);
  }
}

void __51__WFRichContentItemCellView_setContentAlertButton___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained item];

  if (v6 && v4 == v5) {
    [WeakRetained setSubtitle:v6];
  }
}

void __51__WFRichContentItemCellView_setContentAlertButton___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained item];

  if (v7 && v4 == v5)
  {
    id v6 = [WeakRetained altLabel];
    [v6 setText:v7];
  }
}

void __51__WFRichContentItemCellView_setContentAlertButton___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = [WeakRetained item];

  if (v10 && v7 == v8)
  {
    v9 = [v10 UIImage];
    [WeakRetained setImage:v9 options:v5];
  }
}

- (void)setAttributedAlertButton:(id)a3
{
  id v4 = a3;
  id v5 = [v4 attributedTitle];
  id v6 = [(WFRichContentItemCellView *)self titleLabel];
  [v6 setAttributedText:v5];

  id v7 = [(WFRichContentItemCellView *)self titleLabel];
  [v7 setTextAlignment:1];

  id v8 = [(WFRichContentItemCellView *)self subtitleLabel];
  [v8 setText:0];

  v9 = [(WFRichContentItemCellView *)self altLabel];
  [v9 setText:0];

  [(WFRichContentItemCellView *)self setImage:0 options:0];
  item = self->_item;
  self->_item = 0;

  id v11 = [v4 label];

  [(WFRichContentItemCellView *)self setAccessibilityLabel:v11];
}

- (void)setSelectableAlertButton:(id)a3
{
  id v17 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(WFRichContentItemCellView *)self setContentAlertButton:v17];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(WFRichContentItemCellView *)self setAttributedAlertButton:v17];
    }
    else
    {
      id v4 = [v17 image];
      id v5 = [v4 UIImage];

      id v6 = [v17 title];
      id v7 = [(WFRichContentItemCellView *)self titleLabel];
      [v7 setText:v6];

      BOOL v8 = [(WFRichContentItemCellView *)self alwaysLeftAlign];
      if (v8)
      {
        uint64_t v9 = 4;
      }
      else
      {
        id v7 = [v17 subtitle];
        uint64_t v10 = [v7 length];
        uint64_t v11 = 4;
        if (!v5) {
          uint64_t v11 = 1;
        }
        if (v10) {
          uint64_t v9 = 4;
        }
        else {
          uint64_t v9 = v11;
        }
      }
      double v12 = [(WFRichContentItemCellView *)self titleLabel];
      [v12 setTextAlignment:v9];

      if (!v8) {
      double v13 = [v17 subtitle];
      }
      char v14 = [(WFRichContentItemCellView *)self subtitleLabel];
      [v14 setText:v13];

      uint64_t v15 = [(WFRichContentItemCellView *)self altLabel];
      [v15 setText:0];

      [(WFRichContentItemCellView *)self setImage:v5 options:0];
      item = self->_item;
      self->_item = 0;
    }
  }
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  id v5 = [(WFRichContentItemCellView *)self subtitleLabel];
  [v5 setText:v4];

  [(WFRichContentItemCellView *)self setNeedsUpdateConstraints];
}

- (void)updateImageCornerRadius
{
  id v10 = [(WFRichContentItemCellView *)self imageView];
  unint64_t v3 = [(WFRichContentItemCellView *)self imageRoundingStyle];
  [v10 bounds];
  WFContentItemListThumbnailCornerRadiusForRoundingStyle();
  double v5 = v4;
  id v6 = [v10 layer];
  [v6 setCornerRadius:v5];

  id v7 = (uint64_t *)MEMORY[0x263F15A10];
  if (v3 != 3) {
    id v7 = (uint64_t *)MEMORY[0x263F15A20];
  }
  uint64_t v8 = *v7;
  uint64_t v9 = [v10 layer];
  [v9 setCornerCurve:v8];
}

- (void)setImage:(id)a3 options:(id)a4
{
  id v6 = a4;
  [(WFRichContentItemCellView *)self setImage:a3];
  id v8 = [v6 objectForKey:*MEMORY[0x263F85630]];

  if (v8) {
    uint64_t v7 = [v8 unsignedIntegerValue];
  }
  else {
    uint64_t v7 = 0;
  }
  [(WFRichContentItemCellView *)self setImageRoundingStyle:v7];
  [(WFRichContentItemCellView *)self updateImageCornerRadius];
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  [v4 size];
  double v6 = v5;
  double v8 = v7;
  [(WFRichContentItemCellView *)self imageDimension];
  double v10 = v9;
  uint64_t v11 = [(WFRichContentItemCellView *)self imageView];
  double v12 = v11;
  if (v8 <= v10 && v6 <= v10) {
    uint64_t v14 = 4;
  }
  else {
    uint64_t v14 = 1;
  }
  [v11 setContentMode:v14];

  uint64_t v15 = [(WFRichContentItemCellView *)self imageView];
  [v15 setImage:v4];

  [(WFRichContentItemCellView *)self setHasImage:v4 != 0];
}

- (UIImage)image
{
  v2 = [(WFRichContentItemCellView *)self imageView];
  unint64_t v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setHasImage:(BOOL)a3
{
  self->_hasImage = a3;
  [(WFRichContentItemCellView *)self setNeedsUpdateConstraints];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)WFRichContentItemCellView;
  [(WFRichContentItemCellView *)&v3 layoutSubviews];
  [(WFRichContentItemCellView *)self updateImageCornerRadius];
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)WFRichContentItemCellView;
  [(WFRichContentItemCellView *)&v5 tintColorDidChange];
  objc_super v3 = [(WFRichContentItemCellView *)self tintColor];
  id v4 = [(WFRichContentItemCellView *)self titleLabel];
  [v4 setTextColor:v3];
}

- (void)updateConstraints
{
  v22.receiver = self;
  v22.super_class = (Class)WFRichContentItemCellView;
  [(WFRichContentItemCellView *)&v22 updateConstraints];
  double v3 = 0.0;
  double v4 = 0.0;
  if ([(WFRichContentItemCellView *)self hasImage])
  {
    [(WFRichContentItemCellView *)self imageDimension];
    double v3 = v5;
    double v4 = 14.0;
  }
  [(NSLayoutConstraint *)self->_imageWidthConstraint setConstant:v3];
  [(NSLayoutConstraint *)self->_imageHeightConstraint setConstant:v3];
  [(NSLayoutConstraint *)self->_imageLeadingConstraint setConstant:v4];
  double v6 = [(WFRichContentItemCellView *)self altLabel];
  double v7 = [v6 text];
  uint64_t v8 = [v7 length];

  double v9 = (void *)MEMORY[0x263F08938];
  if (v8)
  {
    double v10 = [(WFRichContentItemCellView *)self firstRowConstraintsWithoutAltText];
    [v9 deactivateConstraints:v10];

    uint64_t v11 = (void *)MEMORY[0x263F08938];
    [(WFRichContentItemCellView *)self firstRowConstraintsWithAltText];
  }
  else
  {
    double v12 = [(WFRichContentItemCellView *)self firstRowConstraintsWithAltText];
    [v9 deactivateConstraints:v12];

    uint64_t v11 = (void *)MEMORY[0x263F08938];
    [(WFRichContentItemCellView *)self firstRowConstraintsWithoutAltText];
  double v13 = };
  [v11 activateConstraints:v13];

  uint64_t v14 = [(WFRichContentItemCellView *)self subtitleLabel];
  uint64_t v15 = [v14 text];
  uint64_t v16 = [v15 length];

  id v17 = (void *)MEMORY[0x263F08938];
  if (v16)
  {
    id v18 = [(WFRichContentItemCellView *)self verticalConstraintsWithoutSubtitle];
    [v17 deactivateConstraints:v18];

    id v19 = (void *)MEMORY[0x263F08938];
    [(WFRichContentItemCellView *)self verticalConstraintsWithSubtitle];
  }
  else
  {
    v20 = [(WFRichContentItemCellView *)self verticalConstraintsWithSubtitle];
    [v17 deactivateConstraints:v20];

    id v19 = (void *)MEMORY[0x263F08938];
    [(WFRichContentItemCellView *)self verticalConstraintsWithoutSubtitle];
  id v21 = };
  [v19 activateConstraints:v21];
}

- (WFRichContentItemCellView)initWithFrame:(CGRect)a3
{
  v42[3] = *MEMORY[0x263EF8340];
  v41.receiver = self;
  v41.super_class = (Class)WFRichContentItemCellView;
  double v3 = -[WFRichContentItemCellView initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = (UILabel *)objc_opt_new();
    double v5 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83570]];
    double v6 = [MEMORY[0x263F81708] systemFontOfSize:20.0];
    double v7 = [v5 scaledFontForFont:v6 maximumPointSize:36.0];
    [(UILabel *)v4 setFont:v7];

    uint64_t v8 = [(WFRichContentItemCellView *)v3 tintColor];
    [(UILabel *)v4 setTextColor:v8];

    [(UILabel *)v4 setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v4 setMinimumScaleFactor:0.8];
    [(UILabel *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(WFRichContentItemCellView *)v3 addSubview:v4];
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;
    double v10 = v4;

    uint64_t v11 = objc_opt_new();
    double v12 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
    [v11 setFont:v12];

    [v11 setTextAlignment:0];
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(WFRichContentItemCellView *)v3 addSubview:v11];
    objc_storeWeak((id *)&v3->_subtitleLabel, v11);
    double v13 = objc_opt_new();
    uint64_t v14 = [MEMORY[0x263F81708] systemFontOfSize:13.0];
    [v13 setFont:v14];

    [v13 setTextAlignment:2];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v15) = 1144750080;
    [v13 setContentHuggingPriority:0 forAxis:v15];
    [(WFRichContentItemCellView *)v3 addSubview:v13];
    objc_storeWeak((id *)&v3->_altLabel, v13);
    uint64_t v16 = objc_opt_new();
    [v16 setClipsToBounds:1];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(WFRichContentItemCellView *)v3 addSubview:v16];
    objc_storeWeak((id *)&v3->_imageView, v16);
    v40 = [MEMORY[0x263F08938] constraintWithItem:v16 attribute:10 relatedBy:0 toItem:v3 attribute:10 multiplier:1.0 constant:0.0];
    uint64_t v17 = [MEMORY[0x263F08938] constraintWithItem:v16 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
    imageHeightConstraint = v3->_imageHeightConstraint;
    v3->_imageHeightConstraint = (NSLayoutConstraint *)v17;

    uint64_t v19 = [MEMORY[0x263F08938] constraintWithItem:v16 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
    imageWidthConstraint = v3->_imageWidthConstraint;
    v3->_imageWidthConstraint = (NSLayoutConstraint *)v19;

    id v21 = (void *)MEMORY[0x263F08938];
    v42[0] = v40;
    v42[1] = v3->_imageHeightConstraint;
    v42[2] = v3->_imageWidthConstraint;
    objc_super v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:3];
    [v21 activateConstraints:v22];

    v23 = _NSDictionaryOfVariableBindings(&cfstr_TitlelabelSubt.isa, v10, v11, v13, 0);
    LODWORD(v24) = 1132068864;
    [(UILabel *)v10 setContentCompressionResistancePriority:0 forAxis:v24];
    id v25 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:[titleLabel]-[altLabel]-elementPadding-|" options:0 metrics:&unk_26E894FD8 views:v23];
    [(WFRichContentItemCellView *)v3 setFirstRowConstraintsWithAltText:v25];

    v26 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:[titleLabel]-elementPadding-|" options:0 metrics:&unk_26E894FD8 views:v23];
    [(WFRichContentItemCellView *)v3 setFirstRowConstraintsWithoutAltText:v26];

    v27 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-[titleLabel]-2-[subtitleLabel]-(>=0)-|" options:0 metrics:0 views:v23];
    [(WFRichContentItemCellView *)v3 setVerticalConstraintsWithSubtitle:v27];

    v28 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-[titleLabel]-|" options:0 metrics:0 views:v23];
    [(WFRichContentItemCellView *)v3 setVerticalConstraintsWithoutSubtitle:v28];

    v29 = objc_opt_new();
    uint64_t v30 = [MEMORY[0x263F08938] constraintWithItem:v16 attribute:5 relatedBy:0 toItem:v3 attribute:5 multiplier:1.0 constant:14.0];
    imageLeadingConstraint = v3->_imageLeadingConstraint;
    v3->_imageLeadingConstraint = (NSLayoutConstraint *)v30;

    [v29 addObject:v3->_imageLeadingConstraint];
    v32 = [MEMORY[0x263F08938] constraintWithItem:v10 attribute:5 relatedBy:0 toItem:v16 attribute:6 multiplier:1.0 constant:14.0];
    [v29 addObject:v32];

    v33 = [MEMORY[0x263F08938] constraintWithItem:v11 attribute:5 relatedBy:0 toItem:v16 attribute:6 multiplier:1.0 constant:14.0];
    [v29 addObject:v33];

    v34 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:[subtitleLabel]-elementPadding-|" options:0 metrics:&unk_26E894FD8 views:v23];
    [v29 addObjectsFromArray:v34];

    v35 = [(WFRichContentItemCellView *)v3 firstRowConstraintsWithoutAltText];
    [v29 addObjectsFromArray:v35];

    v36 = [(WFRichContentItemCellView *)v3 verticalConstraintsWithSubtitle];
    [v29 addObjectsFromArray:v36];

    v37 = [MEMORY[0x263F08938] constraintWithItem:v10 attribute:10 relatedBy:0 toItem:v13 attribute:10 multiplier:1.0 constant:0.0];
    [v29 addObject:v37];

    [MEMORY[0x263F08938] activateConstraints:v29];
    v38 = v3;
  }
  return v3;
}

- (double)imageDimension
{
  return 44.0;
}

@end