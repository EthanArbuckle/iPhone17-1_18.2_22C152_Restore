@interface UIDOMHTMLOptionPickerCell
- (BOOL)_isSelectable;
- (BOOL)disabled;
- (UIDOMHTMLOptionPickerCell)initWithHTMLOptionNode:(id)a3;
- (id)initCommon;
- (void)setDisabled:(BOOL)a3;
@end

@implementation UIDOMHTMLOptionPickerCell

- (BOOL)_isSelectable
{
  return ![(UIDOMHTMLOptionPickerCell *)self disabled];
}

- (id)initCommon
{
  v5.receiver = self;
  v5.super_class = (Class)UIDOMHTMLOptionPickerCell;
  v2 = -[UIView initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v3 = v2;
  if (v2) {
    [(UILabel *)[(UIPickerContentView *)v2 titleLabel] setLineBreakMode:5];
  }
  return v3;
}

- (UIDOMHTMLOptionPickerCell)initWithHTMLOptionNode:(id)a3
{
  v4 = [(UIDOMHTMLOptionPickerCell *)self initCommon];
  if (v4)
  {
    -[UILabel setText:](-[UIPickerContentView titleLabel](v4, "titleLabel"), "setText:", [a3 itemTitle]);
    -[UIPickerContentView setChecked:](v4, "setChecked:", [a3 selected]);
    -[UIDOMHTMLOptionPickerCell setDisabled:](v4, "setDisabled:", [a3 disabled]);
    if ([(UIDOMHTMLOptionPickerCell *)v4 disabled]) {
      [(UILabel *)[(UIPickerContentView *)v4 titleLabel] setTextColor:+[UIColor colorWithWhite:0.0 alpha:0.3]];
    }
  }
  return v4;
}

- (BOOL)disabled
{
  return *((unsigned char *)&self->super._pickerContentViewFlags + 4);
}

- (void)setDisabled:(BOOL)a3
{
  *((unsigned char *)&self->super._pickerContentViewFlags + 4) = a3;
}

@end