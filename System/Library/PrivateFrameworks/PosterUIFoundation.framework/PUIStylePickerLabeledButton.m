@interface PUIStylePickerLabeledButton
- (CGSize)intrinsicContentSize;
- (PUIStylePickerLabeledButton)initWithFrame:(CGRect)a3;
- (UILabel)contentLabel;
- (UILabel)nameLabel;
- (void)setSelected:(BOOL)a3;
@end

@implementation PUIStylePickerLabeledButton

- (PUIStylePickerLabeledButton)initWithFrame:(CGRect)a3
{
  v52[10] = *MEMORY[0x263EF8340];
  v51.receiver = self;
  v51.super_class = (Class)PUIStylePickerLabeledButton;
  v3 = -[PUIStylePickerLabeledButton initWithFrame:](&v51, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(PUIStylePickerLabeledButton *)v3 layer];
    [v5 setCornerCurve:*MEMORY[0x263F15A20]];

    v6 = [(PUIStylePickerLabeledButton *)v4 layer];
    [v6 setCornerRadius:14.0];

    v7 = [(PUIStylePickerLabeledButton *)v4 layer];
    id v8 = [MEMORY[0x263F1C550] systemBlueColor];
    objc_msgSend(v7, "setBorderColor:", objc_msgSend(v8, "CGColor"));

    v9 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    contentLabel = v4->_contentLabel;
    v4->_contentLabel = v9;

    [(UILabel *)v4->_contentLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUIStylePickerLabeledButton *)v4 addSubview:v4->_contentLabel];
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    nameLabel = v4->_nameLabel;
    v4->_nameLabel = v11;

    [(UILabel *)v4->_nameLabel setNumberOfLines:2];
    v13 = v4->_nameLabel;
    v14 = [MEMORY[0x263F1C658] systemFontOfSize:14.0];
    [(UILabel *)v13 setFont:v14];

    [(UILabel *)v4->_nameLabel setTextAlignment:1];
    v15 = v4->_nameLabel;
    v16 = [MEMORY[0x263F1C550] labelColor];
    [(UILabel *)v15 setTextColor:v16];

    [(UILabel *)v4->_nameLabel setUserInteractionEnabled:0];
    [(UILabel *)v4->_nameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUIStylePickerLabeledButton *)v4 addSubview:v4->_nameLabel];
    id v17 = objc_alloc_init(MEMORY[0x263F1C778]);
    [(PUIStylePickerLabeledButton *)v4 addLayoutGuide:v17];
    v38 = (void *)MEMORY[0x263F08938];
    v50 = [v17 leadingAnchor];
    v49 = [(PUIStylePickerLabeledButton *)v4 leadingAnchor];
    v48 = [v50 constraintEqualToAnchor:v49];
    v52[0] = v48;
    v47 = [v17 trailingAnchor];
    v46 = [(PUIStylePickerLabeledButton *)v4 trailingAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v52[1] = v45;
    v44 = [v17 centerYAnchor];
    v43 = [(PUIStylePickerLabeledButton *)v4 centerYAnchor];
    v42 = [v44 constraintEqualToAnchor:v43];
    v52[2] = v42;
    v41 = [(UILabel *)v4->_contentLabel topAnchor];
    v40 = [v17 topAnchor];
    v39 = [v41 constraintEqualToAnchor:v40];
    v52[3] = v39;
    v37 = [(UILabel *)v4->_contentLabel centerXAnchor];
    v36 = [v17 centerXAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v52[4] = v35;
    v34 = [(UILabel *)v4->_nameLabel topAnchor];
    v33 = [(UILabel *)v4->_contentLabel lastBaselineAnchor];
    v32 = [v34 constraintEqualToAnchor:v33 constant:4.0];
    v52[5] = v32;
    v31 = [(UILabel *)v4->_nameLabel centerXAnchor];
    v30 = [v17 centerXAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v52[6] = v29;
    v28 = [(UILabel *)v4->_nameLabel leadingAnchor];
    v27 = [v17 leadingAnchor];
    v18 = [v28 constraintEqualToAnchor:v27 constant:2.0];
    v52[7] = v18;
    v19 = [(UILabel *)v4->_nameLabel trailingAnchor];
    v20 = [v17 trailingAnchor];
    v21 = [v19 constraintEqualToAnchor:v20 constant:-2.0];
    v52[8] = v21;
    v22 = [(UILabel *)v4->_nameLabel bottomAnchor];
    v23 = [v17 bottomAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    v52[9] = v24;
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:10];
    [v38 activateConstraints:v25];
  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  [(UILabel *)self->_contentLabel intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  [(UILabel *)self->_nameLabel intrinsicContentSize];
  double v9 = v8 + 8.0 + 8.0;
  if (v4 >= v9) {
    double v9 = v4;
  }
  double v10 = v6 + 2.0 + v7 + 2.0;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUIStylePickerLabeledButton;
  -[PUIStylePickerLabeledButton setSelected:](&v8, sel_setSelected_);
  double v5 = [(PUIStylePickerLabeledButton *)self layer];
  double v6 = v5;
  double v7 = 0.0;
  if (v3) {
    double v7 = 2.0;
  }
  [v5 setBorderWidth:v7];
}

- (UILabel)contentLabel
{
  return self->_contentLabel;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_contentLabel, 0);
}

@end