@interface _TVRUITabSelectorControlCell
- (UILabel)label;
- (_TVRUITabSelectorControlCell)initWithFrame:(CGRect)a3;
- (void)_configure;
- (void)_configureBackgroundCornerRadius;
- (void)_updateForSelectedState:(BOOL)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setSelected:(BOOL)a3;
@end

@implementation _TVRUITabSelectorControlCell

- (_TVRUITabSelectorControlCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVRUITabSelectorControlCell;
  v3 = -[_TVRUITabSelectorControlCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(_TVRUITabSelectorControlCell *)v3 _configure];
  }
  return v4;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)_TVRUITabSelectorControlCell;
  [(_TVRUITabSelectorControlCell *)&v4 prepareForReuse];
  v3 = [(_TVRUITabSelectorControlCell *)self label];
  [v3 setText:0];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_TVRUITabSelectorControlCell;
  -[_TVRUITabSelectorControlCell setSelected:](&v5, sel_setSelected_);
  [(_TVRUITabSelectorControlCell *)self _updateForSelectedState:v3];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_TVRUITabSelectorControlCell;
  [(_TVRUITabSelectorControlCell *)&v3 layoutSubviews];
  [(_TVRUITabSelectorControlCell *)self _configureBackgroundCornerRadius];
}

- (void)_configure
{
  v34[4] = *MEMORY[0x263EF8340];
  objc_super v3 = [MEMORY[0x263F825C8] whiteColor];
  id v4 = objc_alloc_init(MEMORY[0x263F82E00]);
  [v4 setBackgroundColor:v3];
  id v5 = [MEMORY[0x263F825C8] colorWithWhite:0.1 alpha:1.0];
  uint64_t v6 = [v5 CGColor];
  id v7 = v4;
  v33 = v4;
  v8 = [v4 layer];
  [v8 setBorderColor:v6];

  [(_TVRUITabSelectorControlCell *)self setSelectedBackgroundView:v7];
  id v31 = objc_alloc_init(MEMORY[0x263F82E00]);
  v9 = [v31 layer];
  [v9 setBorderWidth:1.0];

  id v32 = v3;
  uint64_t v10 = [v32 CGColor];
  v11 = [v31 layer];
  [v11 setBorderColor:v10];

  v30 = self;
  [(_TVRUITabSelectorControlCell *)self setBackgroundView:v31];
  v12 = [(_TVRUITabSelectorControlCell *)self contentView];
  v13 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  [(UILabel *)v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)v13 setTextAlignment:1];
  v14 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F835F0] variant:1024];
  [(UILabel *)v13 setFont:v14];

  [(UILabel *)v13 setAdjustsFontForContentSizeCategory:1];
  [v12 addSubview:v13];
  v24 = (void *)MEMORY[0x263F08938];
  v29 = [(UILabel *)v13 leadingAnchor];
  v28 = [v12 leadingAnchor];
  v27 = [v29 constraintEqualToAnchor:v28 constant:11.0];
  v34[0] = v27;
  v26 = [(UILabel *)v13 trailingAnchor];
  v25 = [v12 trailingAnchor];
  v15 = [v26 constraintEqualToAnchor:v25 constant:-11.0];
  v34[1] = v15;
  v16 = [(UILabel *)v13 topAnchor];
  v17 = [v12 topAnchor];
  v18 = [v16 constraintEqualToAnchor:v17 constant:5.0];
  v34[2] = v18;
  v19 = [(UILabel *)v13 bottomAnchor];
  v20 = [v12 bottomAnchor];
  v21 = [v19 constraintEqualToAnchor:v20 constant:-5.0];
  v34[3] = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];
  [v24 activateConstraints:v22];

  label = v30->_label;
  v30->_label = v13;

  [(_TVRUITabSelectorControlCell *)v30 _updateForSelectedState:0];
}

- (void)_configureBackgroundCornerRadius
{
  objc_super v3 = [(_TVRUITabSelectorControlCell *)self backgroundView];
  [v3 _setContinuousCornerRadius:7.0];

  id v4 = [(_TVRUITabSelectorControlCell *)self selectedBackgroundView];
  [v4 _setContinuousCornerRadius:7.0];
}

- (void)_updateForSelectedState:(BOOL)a3
{
  if (a3) {
    [MEMORY[0x263F825C8] darkTextColor];
  }
  else {
  id v5 = [MEMORY[0x263F825C8] whiteColor];
  }
  id v4 = [(_TVRUITabSelectorControlCell *)self label];
  [v4 setTextColor:v5];
}

- (UILabel)label
{
  return self->_label;
}

- (void).cxx_destruct
{
}

@end