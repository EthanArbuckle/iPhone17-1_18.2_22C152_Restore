@interface SFDialogTextField
- (CGRect)textRectForBounds:(CGRect)a3;
- (SFDialogTextField)initWithFrame:(CGRect)a3;
- (id)_placeholderColor;
- (unint64_t)stackPosition;
- (void)layoutSubviews;
- (void)setStackPosition:(unint64_t)a3;
@end

@implementation SFDialogTextField

- (SFDialogTextField)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SFDialogTextField;
  v3 = -[SFDialogTextField initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SFDialogTextField *)v3 setAdjustsFontForContentSizeCategory:1];
    v5 = [MEMORY[0x1E4FB1618] tertiarySystemBackgroundColor];
    [(SFDialogTextField *)v4 setBackgroundColor:v5];

    v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(SFDialogTextField *)v4 setFont:v6];

    [(SFDialogTextField *)v4 _setContinuousCornerRadius:5.0];
    v7 = [(SFDialogTextField *)v4 layer];
    id v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.78 alpha:1.0];
    objc_msgSend(v7, "setBorderColor:", objc_msgSend(v8, "CGColor"));

    [v7 setBorderWidth:_SFOnePixel()];
    v9 = v4;
  }
  return v4;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)SFDialogTextField;
  [(SFDialogTextField *)&v6 layoutSubviews];
  id v3 = [MEMORY[0x1E4FB1618] opaqueSeparatorColor];
  uint64_t v4 = [v3 CGColor];
  v5 = [(SFDialogTextField *)self layer];
  [v5 setBorderColor:v4];
}

- (id)_placeholderColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithWhite:0.73 alpha:1.0];
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  return CGRectInset(a3, 7.0, 7.0);
}

- (void)setStackPosition:(unint64_t)a3
{
  if (self->_stackPosition != a3)
  {
    self->_stackPosition = a3;
    if (a3 == 2)
    {
      id v3 = [(SFDialogTextField *)self layer];
      id v5 = v3;
      uint64_t v4 = 12;
    }
    else if (a3 == 1)
    {
      id v3 = [(SFDialogTextField *)self layer];
      id v5 = v3;
      uint64_t v4 = 3;
    }
    else
    {
      if (a3) {
        return;
      }
      id v3 = [(SFDialogTextField *)self layer];
      id v5 = v3;
      uint64_t v4 = 15;
    }
    [v3 setMaskedCorners:v4];
  }
}

- (unint64_t)stackPosition
{
  return self->_stackPosition;
}

@end