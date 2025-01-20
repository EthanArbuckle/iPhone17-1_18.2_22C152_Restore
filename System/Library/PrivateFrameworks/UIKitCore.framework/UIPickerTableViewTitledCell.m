@interface UIPickerTableViewTitledCell
- (BOOL)_canBeReusedInPickerView;
- (BOOL)_isAttributed;
- (NSAttributedString)attributedTitle;
- (NSString)title;
- (UILabel)_titleLabel;
- (UIPickerTableViewTitledCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 textColor:(id)a5 forceTextAlignmentCentered:(BOOL)a6;
- (void)_setIsCenterCell:(BOOL)a3 shouldModifyAlphaOfView:(BOOL)a4;
- (void)prepareForReuse;
- (void)setAttributedTitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation UIPickerTableViewTitledCell

- (UIPickerTableViewTitledCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 textColor:(id)a5 forceTextAlignmentCentered:(BOOL)a6
{
  id v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)UIPickerTableViewTitledCell;
  v11 = [(UIPickerTableViewCell *)&v31 initWithStyle:a3 reuseIdentifier:a4];
  if (v11)
  {
    v12 = [UILabel alloc];
    [(UIView *)v11 bounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    v21 = [(UIPickerTableViewCell *)v11 style];
    [v21 labelSideOffset];
    double v23 = v22;
    v24 = [(UIPickerTableViewCell *)v11 style];
    [v24 labelSideOffset];
    uint64_t v26 = -[UILabel initWithFrame:](v12, "initWithFrame:", v14 + v25, v16 + 0.0, v18 - (v23 + v25), v20);
    titleLabel = v11->_titleLabel;
    v11->_titleLabel = (UILabel *)v26;

    [(UILabel *)v11->_titleLabel setTextAlignment:1];
    [(UIView *)v11->_titleLabel setAutoresizingMask:18];
    v28 = [off_1E52D39B8 boldSystemFontOfSize:20.0];
    [(UILabel *)v11->_titleLabel setFont:v28];

    v29 = +[UIColor clearColor];
    [(UIView *)v11->_titleLabel setBackgroundColor:v29];

    [(UIView *)v11 addSubview:v11->_titleLabel];
    [(UITableViewCell *)v11 setSelectionStyle:0];
    objc_storeStrong((id *)&v11->_textColor, a5);
    [(UILabel *)v11->_titleLabel setTextColor:v11->_textColor];
  }

  return v11;
}

- (void)_setIsCenterCell:(BOOL)a3 shouldModifyAlphaOfView:(BOOL)a4
{
  BOOL v4 = a3;
  if (a4)
  {
    titleLabel = self->_titleLabel;
    double v7 = 0.447;
    if (a3) {
      double v7 = 1.0;
    }
    [(UIView *)titleLabel setAlpha:v7];
  }
  v8 = self->_titleLabel;
  id v11 = [(UIPickerTableViewCell *)self style];
  v9 = [(UIView *)self traitCollection];
  if (v4) {
    [v11 centerCellFontWithTraitCollection:v9];
  }
  else {
  id v10 = [v11 nonCenterCellFontWithTraitCollection:v9];
  }
  [(UILabel *)v8 setFont:v10];
}

- (BOOL)_canBeReusedInPickerView
{
  return 1;
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
  self->_isAttributed = 0;
  [(UILabel *)self->_titleLabel setText:a3];
}

- (NSAttributedString)attributedTitle
{
  return [(UILabel *)self->_titleLabel attributedText];
}

- (void)setAttributedTitle:(id)a3
{
  self->_isAttributed = 1;
  [(UILabel *)self->_titleLabel setAttributedText:a3];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)UIPickerTableViewTitledCell;
  [(UITableViewCell *)&v3 prepareForReuse];
  if (!self->_isAttributed) {
    [(UILabel *)self->_titleLabel setTextColor:self->_textColor];
  }
}

- (UILabel)_titleLabel
{
  return self->_titleLabel;
}

- (BOOL)_isAttributed
{
  return self->_isAttributed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end