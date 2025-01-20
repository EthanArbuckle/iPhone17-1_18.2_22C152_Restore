@interface PSSubtitleDisclosureTableCell
+ (int64_t)cellStyle;
- (BOOL)canReload;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PSSubtitleDisclosureTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (UILabel)valueLabel;
- (double)contentAccessoryPadding;
- (void)_valueLabelForSpecifier:(id)a3;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setValueLabel:(id)a3;
@end

@implementation PSSubtitleDisclosureTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (PSSubtitleDisclosureTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PSSubtitleDisclosureTableCell;
  v9 = [(PSTableCell *)&v16 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    [(PSSubtitleDisclosureTableCell *)v9 _valueLabelForSpecifier:v8];
    v11 = [MEMORY[0x1E4F42738] sharedApplication];
    v12 = [v11 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);

    if (IsAccessibilityCategory)
    {
      v15.receiver = v10;
      v15.super_class = (Class)PSSubtitleDisclosureTableCell;
      [(PSTableCell *)&v15 layoutSubviews];
    }
  }

  return v10;
}

- (void)_valueLabelForSpecifier:(id)a3
{
  if (!a3) {
    return;
  }
  v4 = [a3 propertyForKey:@"cellSubtitleText"];
  v5 = [(PSSubtitleDisclosureTableCell *)self detailTextLabel];
  [v5 setText:v4];

  v6 = [(PSTableCell *)self value];
  valueLabel = self->_valueLabel;
  id v20 = v6;
  if (valueLabel)
  {
    uint64_t v8 = [(UILabel *)valueLabel text];
    v6 = v20;
    v9 = (void *)v8;
  }
  else
  {
    v9 = 0;
  }
  if (v6 != v9 && ([v6 isEqualToString:v9] & 1) == 0)
  {
    uint64_t v10 = [v20 length];
    v11 = self->_valueLabel;
    if (v10)
    {
      if (!v11)
      {
        id v12 = objc_alloc(MEMORY[0x1E4F42B38]);
        v13 = (UILabel *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        v14 = self->_valueLabel;
        self->_valueLabel = v13;

        objc_super v15 = objc_opt_new();
        objc_super v16 = [v15 detailTextLabel];
        v17 = [v16 font];
        [(UILabel *)self->_valueLabel setFont:v17];

        [(UILabel *)self->_valueLabel setNumberOfLines:0];
        [(UILabel *)self->_valueLabel setLineBreakMode:0];
        [(UILabel *)self->_valueLabel setEnabled:0];
        v18 = [(PSSubtitleDisclosureTableCell *)self contentView];
        [v18 addSubview:self->_valueLabel];

        v11 = self->_valueLabel;
      }
      [(UILabel *)v11 setText:v20];
      goto LABEL_14;
    }
    if (v11)
    {
      [(UILabel *)v11 removeFromSuperview];
      v19 = self->_valueLabel;
      self->_valueLabel = 0;

LABEL_14:
      [(PSSubtitleDisclosureTableCell *)self setNeedsLayout];
    }
  }
}

- (double)contentAccessoryPadding
{
  return 10.0;
}

- (void)layoutSubviews
{
  v78.receiver = self;
  v78.super_class = (Class)PSSubtitleDisclosureTableCell;
  [(PSTableCell *)&v78 layoutSubviews];
  valueLabel = self->_valueLabel;
  if (valueLabel)
  {
    [(UILabel *)valueLabel sizeToFit];
    v4 = [(PSSubtitleDisclosureTableCell *)self layoutManager];
    [v4 contentRectForCell:self forState:0];
    double v6 = v5;
    double v8 = v7;

    [(UILabel *)self->_valueLabel frame];
    CGFloat v10 = v9;
    double v12 = v11;
    double v14 = v13;
    int v15 = [(PSSubtitleDisclosureTableCell *)self _shouldReverseLayoutDirection];
    objc_super v16 = [(PSSubtitleDisclosureTableCell *)self traitCollection];
    v17 = [v16 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v17);

    if (IsAccessibilityCategory)
    {
      v19 = [(PSSubtitleDisclosureTableCell *)self detailTextLabel];
      [v19 frame];
      double MaxX = v20;
      if (v15) {
        double MaxX = CGRectGetMaxX(*(CGRect *)&v20);
      }

      v25 = self->_valueLabel;
      v26 = [(PSSubtitleDisclosureTableCell *)self textLabel];
      [v26 frame];
      -[UILabel sizeThatFits:](v25, "sizeThatFits:", CGRectGetWidth(v79), 1.79769313e308);
      double v28 = v27;
      double v30 = v29;

      double v31 = 0.0;
      if (v15) {
        double v31 = v28;
      }
      CGFloat v32 = MaxX - v31;
      v33 = [(PSSubtitleDisclosureTableCell *)self textLabel];
      [v33 frame];
      double v35 = v34;
      double v37 = v36;
      double v39 = v38;
      double v41 = v40;

      v80.origin.x = v32;
      v80.origin.y = v10;
      v80.size.width = v28;
      v80.size.height = v30;
      double v42 = v37 - CGRectGetHeight(v80) * 0.5;
      v43 = [(PSSubtitleDisclosureTableCell *)self textLabel];
      objc_msgSend(v43, "setFrame:", v35, v42, v39, v41);

      v44 = [(PSSubtitleDisclosureTableCell *)self detailTextLabel];
      [v44 frame];
      double v46 = v45;
      double v48 = v47;
      double v50 = v49;
      double v52 = v51;

      v81.origin.x = v32;
      v81.origin.y = v10;
      v81.size.width = v28;
      v81.size.height = v30;
      double v53 = v48 - CGRectGetHeight(v81) * 0.5;
      v54 = [(PSSubtitleDisclosureTableCell *)self detailTextLabel];
      objc_msgSend(v54, "setFrame:", v46, v53, v50, v52);

      v55 = [(PSSubtitleDisclosureTableCell *)self detailTextLabel];
      [v55 frame];
      double MaxY = CGRectGetMaxY(v82);

      -[UILabel setFrame:](self->_valueLabel, "setFrame:", v32, MaxY, v28, v30);
    }
    else
    {
      if (v15) {
        double v57 = 0.0;
      }
      else {
        double v57 = v6 - v12;
      }
      float v58 = (v8 - v14) * 0.5;
      double v59 = floorf(v58);
      -[UILabel setFrame:](self->_valueLabel, "setFrame:", v57, v59, v12, v14);
      v60 = [(PSSubtitleDisclosureTableCell *)self textLabel];
      [v60 frame];
      double v62 = v61;
      CGFloat v64 = v63;
      double v66 = v65;
      double v68 = v67;

      double v77 = v64;
      if (v15)
      {
        v83.origin.x = v57;
        v83.origin.y = v59;
        v83.size.width = v12;
        v83.size.height = v14;
        double v59 = v64;
        double v69 = CGRectGetMaxX(v83);
        double v57 = v62;
        double v12 = v66;
        double v14 = v68;
      }
      else
      {
        v84.origin.x = v62;
        v84.origin.y = v64;
        v84.size.width = v66;
        v84.size.height = v68;
        double v69 = CGRectGetMaxX(v84);
      }
      v85.origin.x = v57;
      v85.origin.y = v59;
      v85.size.width = v12;
      v85.size.height = v14;
      double v70 = v69 - CGRectGetMinX(v85);
      [(PSSubtitleDisclosureTableCell *)self contentAccessoryPadding];
      if (v70 + v71 > 0.0)
      {
        [(PSSubtitleDisclosureTableCell *)self contentAccessoryPadding];
        double v73 = v70 + v72;
        double v74 = v66 - v73;
        if (!v15) {
          double v73 = -0.0;
        }
        double v75 = v62 + v73;
        v76 = [(PSSubtitleDisclosureTableCell *)self textLabel];
        objc_msgSend(v76, "setFrame:", v75, v77, v74, v68);
      }
    }
  }
}

- (BOOL)canReload
{
  return 1;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PSSubtitleDisclosureTableCell;
  id v4 = a3;
  [(PSTableCell *)&v5 refreshCellContentsWithSpecifier:v4];
  -[PSSubtitleDisclosureTableCell _valueLabelForSpecifier:](self, "_valueLabelForSpecifier:", v4, v5.receiver, v5.super_class);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v17.receiver = self;
  v17.super_class = (Class)PSSubtitleDisclosureTableCell;
  -[PSSubtitleDisclosureTableCell sizeThatFits:](&v17, sel_sizeThatFits_);
  double v7 = v6;
  double v9 = v8;
  CGFloat v10 = [(PSSubtitleDisclosureTableCell *)self traitCollection];
  double v11 = [v10 preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v11))
  {
    valueLabel = self->_valueLabel;

    if (valueLabel)
    {
      double v13 = [(PSSubtitleDisclosureTableCell *)self textLabel];
      [v13 frame];
      CGRectGetMinX(v19);

      -[UILabel sizeThatFits:](self->_valueLabel, "sizeThatFits:", width, height);
      double v9 = v9 + v14;
    }
  }
  else
  {
  }
  double v15 = v7;
  double v16 = v9;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (void).cxx_destruct
{
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
}

@end