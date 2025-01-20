@interface _MailActionCellTitleLabel
+ (id)preferredFontForDefaultTitle;
+ (id)preferredFontForHorizontalTitle;
- (BOOL)isHorizontalTitle;
- (BOOL)useActionSheetStyle;
- (CGSize)sizeThatFits:(CGSize)a3 sizeCategory:(id)a4;
- (void)_updateStyle;
- (void)setIsHorizontalTitle:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setUseActionSheetStyle:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateFontWithSizeCategory:(id)a3;
@end

@implementation _MailActionCellTitleLabel

- (void)setText:(id)a3
{
  id v4 = a3;
  v5 = [(_MailActionCellTitleLabel *)self text];
  unsigned __int8 v6 = [v5 isEqualToString:v4];

  if ((v6 & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)_MailActionCellTitleLabel;
    [(_MailActionCellTitleLabel *)&v9 setText:v4];
    v7 = [(_MailActionCellTitleLabel *)self traitCollection];
    v8 = [v7 preferredContentSizeCategory];
    [(_MailActionCellTitleLabel *)self updateFontWithSizeCategory:v8];
  }
}

- (void)setUseActionSheetStyle:(BOOL)a3
{
  if (self->_useActionSheetStyle != a3)
  {
    self->_useActionSheetStyle = a3;
    [(_MailActionCellTitleLabel *)self _updateStyle];
  }
}

- (void)_updateStyle
{
  if ([(_MailActionCellTitleLabel *)self useActionSheetStyle])
  {
    v3 = [(_MailActionCellTitleLabel *)self traitCollection];
    id v4 = [v3 preferredContentSizeCategory];
    BOOL v5 = !UIContentSizeCategoryIsAccessibilityCategory(v4);

    uint64_t v6 = 4;
  }
  else
  {
    uint64_t v6 = 0;
    BOOL v5 = 0;
  }
  [(_MailActionCellTitleLabel *)self setNumberOfLines:v5];

  [(_MailActionCellTitleLabel *)self setLineBreakMode:v6];
}

- (void)updateFontWithSizeCategory:(id)a3
{
  unsigned int v4 = [(_MailActionCellTitleLabel *)self isHorizontalTitle];
  BOOL v5 = objc_opt_class();
  if (v4) {
    [v5 preferredFontForHorizontalTitle];
  }
  else {
  uint64_t v6 = [v5 preferredFontForDefaultTitle];
  }
  [(_MailActionCellTitleLabel *)self setFont:v6];

  [(_MailActionCellTitleLabel *)self setNeedsDisplay];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_MailActionCellTitleLabel;
  [(_MailActionCellTitleLabel *)&v11 traitCollectionDidChange:v4];
  BOOL v5 = [(_MailActionCellTitleLabel *)self traitCollection];
  uint64_t v6 = [v5 preferredContentSizeCategory];
  v7 = [v4 preferredContentSizeCategory];
  unsigned __int8 v8 = [v6 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
    [(_MailActionCellTitleLabel *)self _updateStyle];
    objc_super v9 = [(_MailActionCellTitleLabel *)self traitCollection];
    v10 = [v9 preferredContentSizeCategory];
    [(_MailActionCellTitleLabel *)self updateFontWithSizeCategory:v10];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3 sizeCategory:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  [(_MailActionCellTitleLabel *)self updateFontWithSizeCategory:v7];
  v14.receiver = self;
  v14.super_class = (Class)_MailActionCellTitleLabel;
  -[_MailActionCellTitleLabel sizeThatFits:](&v14, "sizeThatFits:", width, height);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

+ (id)preferredFontForHorizontalTitle
{
  return +[UIFont preferredFontForTextStyle:UIFontTextStyleSubhead];
}

+ (id)preferredFontForDefaultTitle
{
  v2 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody];
  v3 = [v2 fontDescriptorWithSymbolicTraits:0x8000];

  id v4 = +[UIFont fontWithDescriptor:v3 size:0.0];

  return v4;
}

- (BOOL)isHorizontalTitle
{
  return self->_isHorizontalTitle;
}

- (void)setIsHorizontalTitle:(BOOL)a3
{
  self->_isHorizontalTitle = a3;
}

- (BOOL)useActionSheetStyle
{
  return self->_useActionSheetStyle;
}

@end