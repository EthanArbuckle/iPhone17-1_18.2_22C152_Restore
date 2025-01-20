@interface _UIActivityGroupActivityCellTitleLabel
- (CGSize)sizeThatFits:(CGSize)a3 sizeCategory:(id)a4;
- (void)setText:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateFontWithSizeCategory:(id)a3;
@end

@implementation _UIActivityGroupActivityCellTitleLabel

- (void)setText:(id)a3
{
  id v4 = a3;
  v5 = [(_UIActivityGroupActivityCellTitleLabel *)self text];
  char v6 = [v5 isEqualToString:v4];

  if ((v6 & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIActivityGroupActivityCellTitleLabel;
    [(_UIActivityGroupActivityCellTitleLabel *)&v9 setText:v4];
    v7 = [(_UIActivityGroupActivityCellTitleLabel *)self traitCollection];
    v8 = [v7 preferredContentSizeCategory];
    [(_UIActivityGroupActivityCellTitleLabel *)self updateFontWithSizeCategory:v8];
  }
}

- (void)updateFontWithSizeCategory:(id)a3
{
  id v4 = a3;
  v5 = [(_UIActivityGroupActivityCellTitleLabel *)self _screen];
  char v6 = _UIActivityGroupActivityCellFont(v4, v5);
  [(_UIActivityGroupActivityCellTitleLabel *)self setFont:v6];

  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v4))
  {
    [(_UIActivityGroupActivityCellTitleLabel *)self setNumberOfLines:2];
    LODWORD(v7) = 0.5;
    [(_UIActivityGroupActivityCellTitleLabel *)self _setHyphenationFactor:v7];
    if ([(_UIActivityGroupActivityCellTitleLabel *)self _shouldReverseLayoutDirection])uint64_t v8 = 2; {
    else
    }
      uint64_t v8 = 0;
    [(_UIActivityGroupActivityCellTitleLabel *)self setTextAlignment:v8];
    [(_UIActivityGroupActivityCellTitleLabel *)self setAdjustsFontSizeToFitWidth:0];
  }
  else
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    objc_super v9 = [(_UIActivityGroupActivityCellTitleLabel *)self text];
    uint64_t v10 = [v9 length];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69___UIActivityGroupActivityCellTitleLabel_updateFontWithSizeCategory___block_invoke;
    v12[3] = &unk_1E5A23B90;
    v12[5] = 0;
    v12[6] = v10;
    v12[4] = &v13;
    objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 3, v12);
    if (*((unsigned char *)v14 + 24)) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = 2;
    }
    [(_UIActivityGroupActivityCellTitleLabel *)self setNumberOfLines:v11];
    [(_UIActivityGroupActivityCellTitleLabel *)self _setHyphenationFactor:0.0];
    [(_UIActivityGroupActivityCellTitleLabel *)self setTextAlignment:1];
    [(_UIActivityGroupActivityCellTitleLabel *)self setAdjustsFontSizeToFitWidth:1];

    _Block_object_dispose(&v13, 8);
  }
  [(_UIActivityGroupActivityCellTitleLabel *)self setNeedsDisplay];
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_UIActivityGroupActivityCellTitleLabel;
  id v4 = a3;
  [(_UIActivityGroupActivityCellTitleLabel *)&v10 traitCollectionDidChange:v4];
  v5 = [(_UIActivityGroupActivityCellTitleLabel *)self traitCollection];
  char v6 = [v5 preferredContentSizeCategory];
  double v7 = [v4 preferredContentSizeCategory];

  LOBYTE(v4) = [v6 isEqualToString:v7];
  if ((v4 & 1) == 0)
  {
    uint64_t v8 = [(_UIActivityGroupActivityCellTitleLabel *)self traitCollection];
    objc_super v9 = [v8 preferredContentSizeCategory];
    [(_UIActivityGroupActivityCellTitleLabel *)self updateFontWithSizeCategory:v9];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3 sizeCategory:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  [(_UIActivityGroupActivityCellTitleLabel *)self updateFontWithSizeCategory:a4];
  v9.receiver = self;
  v9.super_class = (Class)_UIActivityGroupActivityCellTitleLabel;
  -[_UIActivityGroupActivityCellTitleLabel sizeThatFits:](&v9, sel_sizeThatFits_, width, height);
  result.double height = v8;
  result.double width = v7;
  return result;
}

@end