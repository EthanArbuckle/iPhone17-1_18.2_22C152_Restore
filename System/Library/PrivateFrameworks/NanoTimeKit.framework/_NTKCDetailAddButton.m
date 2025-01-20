@interface _NTKCDetailAddButton
- (BOOL)disabled;
- (NSString)disabledReason;
- (_NTKCDetailAddButton)initWithFrame:(CGRect)a3;
- (void)_updateColor;
- (void)setDisabled:(BOOL)a3 forReason:(id)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation _NTKCDetailAddButton

- (_NTKCDetailAddButton)initWithFrame:(CGRect)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)_NTKCDetailAddButton;
  v3 = -[_NTKCDetailAddButton initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if (_os_feature_enabled_impl())
    {
      v5 = NTKCCustomizationLocalizedString(@"ACTION_ADD", @"Add", v4);
      uint64_t v20 = *MEMORY[0x1E4FB06F8];
      v6 = [MEMORY[0x1E4FB08E0] systemFontOfSize:15.0];
      v21[0] = v6;
      v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];

      v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v7];
      v9 = [MEMORY[0x1E4FB14D8] grayButtonConfiguration];
      [v9 setAttributedTitle:v8];
      [v9 setButtonSize:1];
      objc_msgSend(v9, "setContentInsets:", 5.0, 8.0, 5.0, 8.0);
      [v9 setCornerStyle:4];
      [(_NTKCDetailAddButton *)v3 setConfiguration:v9];
    }
    else
    {
      v10 = [MEMORY[0x1E4FB08E0] systemFontOfSize:15.0];
      v11 = [(_NTKCDetailAddButton *)v3 titleLabel];
      [v11 setFont:v10];

      -[_NTKCDetailAddButton setContentEdgeInsets:](v3, "setContentEdgeInsets:", 5.0, 8.0, 5.0, 8.0);
      v12 = [(_NTKCDetailAddButton *)v3 layer];
      [v12 setBorderWidth:1.0];

      v13 = [(_NTKCDetailAddButton *)v3 layer];
      [v13 setCornerRadius:4.0];

      v15 = NTKCCustomizationLocalizedString(@"ACTION_ADD", @"Add", v14);
      [(_NTKCDetailAddButton *)v3 setTitle:v15 forState:0];

      v16 = BPSBackgroundColor();
      [(_NTKCDetailAddButton *)v3 setTitleColor:v16 forState:1];

      v17 = BPSBackgroundColor();
      [(_NTKCDetailAddButton *)v3 setTitleColor:v17 forState:4];

      v5 = BPSBackgroundColor();
      [(_NTKCDetailAddButton *)v3 setTitleColor:v5 forState:5];
    }

    [(_NTKCDetailAddButton *)v3 _updateColor];
  }
  return v3;
}

- (void)setDisabled:(BOOL)a3 forReason:(id)a4
{
  self->_disabled = a3;
  objc_storeStrong((id *)&self->_disabledReason, a4);
  [(_NTKCDetailAddButton *)self _updateColor];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_NTKCDetailAddButton *)self isHighlighted] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_NTKCDetailAddButton;
    [(_NTKCDetailAddButton *)&v5 setHighlighted:v3];
    [(_NTKCDetailAddButton *)self _updateColor];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_NTKCDetailAddButton *)self isSelected] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_NTKCDetailAddButton;
    [(_NTKCDetailAddButton *)&v5 setSelected:v3];
    [(_NTKCDetailAddButton *)self _updateColor];
  }
}

- (void)_updateColor
{
  if (_os_feature_enabled_impl())
  {
    if (self->_disabled) {
      [MEMORY[0x1E4FB1618] systemGrayColor];
    }
    else {
      BPSBridgeTintColor();
    }
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    [(_NTKCDetailAddButton *)self setTintColor:v10];
    goto LABEL_17;
  }
  if ([(_NTKCDetailAddButton *)self isHighlighted]) {
    int v3 = 1;
  }
  else {
    int v3 = [(_NTKCDetailAddButton *)self isSelected];
  }
  if (!self->_disabled)
  {
    objc_super v5 = NTKCActionColor();
    if (v3)
    {
      NTKCActionColor();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  uint64_t v4 = [MEMORY[0x1E4FB1618] systemGrayColor];
  objc_super v5 = v4;
  if (!v3) {
    goto LABEL_15;
  }
  id v6 = v4;
  objc_super v5 = v6;
LABEL_14:
  v7 = v6;
LABEL_16:
  [(_NTKCDetailAddButton *)self setTitleColor:v5 forState:0];
  id v10 = v5;
  uint64_t v8 = [v10 CGColor];
  v9 = [(_NTKCDetailAddButton *)self layer];
  [v9 setBorderColor:v8];

  [(_NTKCDetailAddButton *)self setBackgroundColor:v7];
LABEL_17:
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (NSString)disabledReason
{
  return self->_disabledReason;
}

- (void).cxx_destruct
{
}

@end