@interface TKPickerTableViewCell
- (BOOL)shouldTintTextLabel;
- (UIColor)textLabelColor;
- (void)_updateTextLabelColor;
- (void)setSectionLocation:(int)a3 animated:(BOOL)a4;
- (void)setShouldTintTextLabel:(BOOL)a3;
- (void)setTextLabelColor:(id)a3;
- (void)tintColorDidChange;
@end

@implementation TKPickerTableViewCell

- (void)setTextLabelColor:(id)a3
{
  v5 = (UIColor *)a3;
  p_textLabelColor = &self->_textLabelColor;
  if (self->_textLabelColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_textLabelColor, a3);
    p_textLabelColor = (UIColor **)[(TKPickerTableViewCell *)self _updateTextLabelColor];
    v5 = v7;
  }

  MEMORY[0x270F9A758](p_textLabelColor, v5);
}

- (void)setShouldTintTextLabel:(BOOL)a3
{
  if (self->_shouldTintTextLabel != a3)
  {
    self->_shouldTintTextLabel = a3;
    if (!self->_textLabelColor) {
      [(TKPickerTableViewCell *)self _updateTextLabelColor];
    }
  }
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)TKPickerTableViewCell;
  [(TKPickerTableViewCell *)&v3 tintColorDidChange];
  if (!self->_textLabelColor && self->_shouldTintTextLabel) {
    [(TKPickerTableViewCell *)self _updateTextLabelColor];
  }
}

- (void)_updateTextLabelColor
{
  objc_super v3 = self->_textLabelColor;
  if (!v3)
  {
    if (!self->_shouldTintTextLabel
      || ([(TKPickerTableViewCell *)self tintColor],
          (objc_super v3 = (UIColor *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_super v3 = +[TKUIKitConstants defaultTableViewCellTextColor];
    }
  }
  v5 = v3;
  v4 = [(TKPickerTableViewCell *)self textLabel];
  [v4 setTextColor:v5];
}

- (void)setSectionLocation:(int)a3 animated:(BOOL)a4
{
  uint64_t v4 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)TKPickerTableViewCell;
  [(TKPickerTableViewCell *)&v8 setSectionLocation:*(void *)&a3 animated:a4];
  v6 = [(TKPickerTableViewCell *)self backgroundView];
  if (objc_opt_respondsToSelector()) {
    [v6 setSectionLocation:v4];
  }
  v7 = [(TKPickerTableViewCell *)self selectedBackgroundView];
  if (objc_opt_respondsToSelector()) {
    [v7 setSectionLocation:v4];
  }
}

- (UIColor)textLabelColor
{
  return self->_textLabelColor;
}

- (BOOL)shouldTintTextLabel
{
  return self->_shouldTintTextLabel;
}

- (void).cxx_destruct
{
}

@end