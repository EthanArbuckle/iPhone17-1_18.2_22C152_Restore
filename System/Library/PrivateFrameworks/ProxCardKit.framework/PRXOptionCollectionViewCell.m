@interface PRXOptionCollectionViewCell
- (PRXOptionCollectionViewCell)initWithFrame:(CGRect)a3;
- (UILabel)textLabel;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)setSelected:(BOOL)a3;
@end

@implementation PRXOptionCollectionViewCell

- (PRXOptionCollectionViewCell)initWithFrame:(CGRect)a3
{
  v47[6] = *MEMORY[0x263EF8340];
  v46.receiver = self;
  v46.super_class = (Class)PRXOptionCollectionViewCell;
  v3 = -[PRXOptionCollectionViewCell initWithFrame:](&v46, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(PRXOptionCollectionViewCell *)v3 contentView];
    objc_msgSend(v5, "setDirectionalLayoutMargins:", 8.0, 15.0, 8.0, 15.0);

    v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    textLabel = v4->_textLabel;
    v4->_textLabel = v6;

    v8 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D260]];
    v45 = [v8 fontDescriptorWithSymbolicTraits:2];

    v9 = (void *)MEMORY[0x263F1C658];
    [v45 pointSize];
    v10 = objc_msgSend(v9, "fontWithDescriptor:size:", v45);
    [(UILabel *)v4->_textLabel setFont:v10];

    [(UILabel *)v4->_textLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = [(PRXOptionCollectionViewCell *)v4 contentView];
    [v11 addSubview:v4->_textLabel];

    v12 = objc_alloc_init(PRXSelectionIndicatorView);
    selectionIndicator = v4->_selectionIndicator;
    v4->_selectionIndicator = v12;

    [(PRXSelectionIndicatorView *)v4->_selectionIndicator setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = [(PRXOptionCollectionViewCell *)v4 contentView];
    [v14 addSubview:v4->_selectionIndicator];

    id v15 = objc_alloc_init(MEMORY[0x263F1CB60]);
    id v16 = [MEMORY[0x263F1C550] systemFillColor];
    uint64_t v17 = [v16 CGColor];
    v18 = [v15 layer];
    [v18 setBorderColor:v17];

    v19 = [v15 layer];
    [v19 setBorderWidth:1.0];

    v44 = v15;
    [v15 _setContinuousCornerRadius:12.0];
    [(PRXOptionCollectionViewCell *)v4 setBackgroundView:v15];
    v20 = [(PRXOptionCollectionViewCell *)v4 contentView];
    v21 = [v20 layoutMarginsGuide];

    v36 = (void *)MEMORY[0x263F08938];
    v43 = [(UILabel *)v4->_textLabel leadingAnchor];
    v42 = [v21 leadingAnchor];
    v41 = [v43 constraintEqualToAnchor:v42];
    v47[0] = v41;
    v40 = [(UILabel *)v4->_textLabel trailingAnchor];
    v39 = [(PRXSelectionIndicatorView *)v4->_selectionIndicator leadingAnchor];
    v38 = [v40 constraintEqualToAnchor:v39];
    v47[1] = v38;
    v37 = [(UILabel *)v4->_textLabel centerYAnchor];
    v35 = [v21 centerYAnchor];
    v34 = [v37 constraintEqualToAnchor:v35];
    v47[2] = v34;
    v33 = [(UILabel *)v4->_textLabel topAnchor];
    v32 = [v21 topAnchor];
    v22 = [v33 constraintGreaterThanOrEqualToAnchor:v32];
    v47[3] = v22;
    v23 = [(PRXSelectionIndicatorView *)v4->_selectionIndicator centerYAnchor];
    v24 = [v21 centerYAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    v47[4] = v25;
    v26 = [(PRXSelectionIndicatorView *)v4->_selectionIndicator trailingAnchor];
    v27 = [v21 trailingAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    v47[5] = v28;
    v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:6];
    [v36 activateConstraints:v29];

    v30 = v4;
  }

  return v4;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)PRXOptionCollectionViewCell;
  [(PRXOptionCollectionViewCell *)&v7 _dynamicUserInterfaceTraitDidChange];
  id v3 = [MEMORY[0x263F1C550] systemFillColor];
  uint64_t v4 = [v3 CGColor];
  v5 = [(PRXOptionCollectionViewCell *)self backgroundView];
  v6 = [v5 layer];
  [v6 setBorderColor:v4];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PRXOptionCollectionViewCell;
  -[PRXOptionCollectionViewCell setSelected:](&v5, sel_setSelected_);
  [(PRXSelectionIndicatorView *)self->_selectionIndicator setSelected:v3];
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_selectionIndicator, 0);
}

@end