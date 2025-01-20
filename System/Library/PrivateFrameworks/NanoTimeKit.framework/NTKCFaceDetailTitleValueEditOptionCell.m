@interface NTKCFaceDetailTitleValueEditOptionCell
- (BOOL)active;
- (NSString)titleText;
- (NSString)valueText;
- (NTKCFaceDetailTitleValueEditOptionCell)initWithEditOption:(id)a3;
- (NTKEditOption)editOption;
- (double)_reservedSizeForImage;
- (double)rowHeight;
- (id)_checkmarkImage;
- (void)_setupSubviews;
- (void)setActive:(BOOL)a3;
- (void)setTitleText:(id)a3;
- (void)setValueText:(id)a3;
@end

@implementation NTKCFaceDetailTitleValueEditOptionCell

- (NTKCFaceDetailTitleValueEditOptionCell)initWithEditOption:(id)a3
{
  id v5 = a3;
  v6 = [(id)objc_opt_class() reuseIdentifier];
  v18.receiver = self;
  v18.super_class = (Class)NTKCFaceDetailTitleValueEditOptionCell;
  v7 = [(NTKCDetailTableViewCell *)&v18 initWithStyle:0 reuseIdentifier:v6];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_editOption, a3);
    v7->_active = 0;
    uint64_t v8 = objc_opt_new();
    leadingAccessoryView = v7->_leadingAccessoryView;
    v7->_leadingAccessoryView = (UIImageView *)v8;

    uint64_t v10 = objc_opt_new();
    titleLabel = v7->_titleLabel;
    v7->_titleLabel = (UILabel *)v10;

    uint64_t v12 = objc_opt_new();
    valueLabel = v7->_valueLabel;
    v7->_valueLabel = (UILabel *)v12;

    id v14 = objc_alloc(MEMORY[0x1E4FB1C60]);
    uint64_t v15 = objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    alignmentView = v7->_alignmentView;
    v7->_alignmentView = (UIStackView *)v15;

    [(NTKCFaceDetailTitleValueEditOptionCell *)v7 _setupSubviews];
  }

  return v7;
}

- (id)_checkmarkImage
{
  v2 = [MEMORY[0x1E4FB1830] configurationWithWeight:6];
  v3 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8]];
  v4 = [v2 configurationByApplyingConfiguration:v3];
  id v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark" withConfiguration:v4];

  return v5;
}

- (double)_reservedSizeForImage
{
  v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v2 pointSize];
  double v4 = v3;

  return v4;
}

- (double)rowHeight
{
  v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v2 _scaledValueForValue:44.0];
  double v4 = v3;

  return v4;
}

- (void)_setupSubviews
{
  v33[4] = *MEMORY[0x1E4F143B8];
  v32 = objc_opt_new();
  [(UIStackView *)self->_alignmentView addArrangedSubview:self->_leadingAccessoryView];
  [(UIStackView *)self->_alignmentView addArrangedSubview:self->_titleLabel];
  [(UIStackView *)self->_alignmentView addArrangedSubview:v32];
  [(UIStackView *)self->_alignmentView addArrangedSubview:self->_valueLabel];
  double v3 = [(NTKCFaceDetailTitleValueEditOptionCell *)self contentView];
  [v3 addSubview:self->_alignmentView];

  [(UIStackView *)self->_alignmentView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_alignmentView setPreservesSuperviewLayoutMargins:1];
  double v4 = [(NTKCFaceDetailTitleValueEditOptionCell *)self contentView];
  id v5 = [v4 layoutMarginsGuide];

  v25 = (void *)MEMORY[0x1E4F28DC8];
  v30 = [(UIStackView *)self->_alignmentView leadingAnchor];
  v29 = [v5 leadingAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v33[0] = v28;
  v27 = [(UIStackView *)self->_alignmentView trailingAnchor];
  v26 = [v5 trailingAnchor];
  v6 = [v27 constraintEqualToAnchor:v26];
  v33[1] = v6;
  v7 = [(UIStackView *)self->_alignmentView topAnchor];
  v31 = v5;
  uint64_t v8 = [v5 topAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  v33[2] = v9;
  uint64_t v10 = [(UIStackView *)self->_alignmentView bottomAnchor];
  v11 = [v5 bottomAnchor];
  uint64_t v12 = [v10 constraintEqualToAnchor:v11];
  v33[3] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
  [v25 activateConstraints:v13];

  [(UIStackView *)self->_alignmentView setAxis:0];
  [(UIStackView *)self->_alignmentView setAlignment:3];
  [(UIStackView *)self->_alignmentView setSpacing:8.0];
  id v14 = [(UIImageView *)self->_leadingAccessoryView widthAnchor];
  [(NTKCFaceDetailTitleValueEditOptionCell *)self _reservedSizeForImage];
  uint64_t v15 = objc_msgSend(v14, "constraintEqualToConstant:");
  [v15 setActive:1];

  titleLabel = self->_titleLabel;
  uint64_t v17 = *MEMORY[0x1E4FB28C8];
  objc_super v18 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(UILabel *)titleLabel setFont:v18];

  v19 = self->_titleLabel;
  v20 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)v19 setTextColor:v20];

  valueLabel = self->_valueLabel;
  v22 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v17];
  [(UILabel *)valueLabel setFont:v22];

  v23 = self->_valueLabel;
  v24 = [MEMORY[0x1E4FB1618] tintColor];
  [(UILabel *)v23 setTextColor:v24];

  [(NTKCDetailTableViewCell *)self setShowsSeparator:1];
  [(NTKCFaceDetailTitleValueEditOptionCell *)self setAccessoryType:1];
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3)
    {
      double v4 = [(NTKCFaceDetailTitleValueEditOptionCell *)self _checkmarkImage];
      [(UIImageView *)self->_leadingAccessoryView setImage:v4];
    }
    else
    {
      [(UIImageView *)self->_leadingAccessoryView setImage:0];
    }
    if (self->_active) {
      valueText = self->_valueText;
    }
    else {
      valueText = 0;
    }
    valueLabel = self->_valueLabel;
    [(UILabel *)valueLabel setText:valueText];
  }
}

- (void)setTitleText:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_titleText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_titleText, a3);
    [(UILabel *)self->_titleLabel setText:v5];
  }
}

- (void)setValueText:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_valueText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_valueText, a3);
    if (self->_active) {
      id v5 = v6;
    }
    else {
      id v5 = 0;
    }
    [(UILabel *)self->_valueLabel setText:v5];
  }
}

- (NTKEditOption)editOption
{
  return self->_editOption;
}

- (BOOL)active
{
  return self->_active;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)valueText
{
  return self->_valueText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_editOption, 0);
  objc_storeStrong((id *)&self->_alignmentView, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_leadingAccessoryView, 0);
}

@end