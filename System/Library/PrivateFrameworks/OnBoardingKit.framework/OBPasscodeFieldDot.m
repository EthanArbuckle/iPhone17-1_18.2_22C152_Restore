@interface OBPasscodeFieldDot
- (BOOL)isFilled;
- (CGSize)intrinsicContentSize;
- (OBPasscodeFieldDot)init;
- (void)_updateView;
- (void)setFilled:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation OBPasscodeFieldDot

- (OBPasscodeFieldDot)init
{
  v8.receiver = self;
  v8.super_class = (Class)OBPasscodeFieldDot;
  v2 = -[OBPasscodeFieldDot initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v3 = v2;
  if (v2)
  {
    v4 = [(OBPasscodeFieldDot *)v2 layer];
    [v4 setCornerRadius:10.0];

    v5 = [(OBPasscodeFieldDot *)v3 layer];
    [v5 setMasksToBounds:1];

    v6 = [(OBPasscodeFieldDot *)v3 layer];
    [v6 setBorderWidth:2.0];

    [(OBPasscodeFieldDot *)v3 _updateView];
  }
  return v3;
}

- (void)setFilled:(BOOL)a3
{
  if (self->_filled != a3)
  {
    self->_filled = a3;
    [(OBPasscodeFieldDot *)self _updateView];
  }
}

- (CGSize)intrinsicContentSize
{
  double v2 = 20.0;
  double v3 = 20.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)OBPasscodeFieldDot;
  [(OBPasscodeFieldDot *)&v4 traitCollectionDidChange:a3];
  [(OBPasscodeFieldDot *)self _updateView];
}

- (void)_updateView
{
  if ([(OBPasscodeFieldDot *)self isFilled])
  {
    id v3 = [MEMORY[0x1E4FB1618] labelColor];
    uint64_t v4 = [v3 CGColor];
    v5 = [(OBPasscodeFieldDot *)self layer];
    [v5 setBackgroundColor:v4];

    [MEMORY[0x1E4FB1618] clearColor];
  }
  else
  {
    id v6 = [MEMORY[0x1E4FB1618] clearColor];
    uint64_t v7 = [v6 CGColor];
    objc_super v8 = [(OBPasscodeFieldDot *)self layer];
    [v8 setBackgroundColor:v7];

    [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  }
  id v11 = objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v11 CGColor];
  v10 = [(OBPasscodeFieldDot *)self layer];
  [v10 setBorderColor:v9];
}

- (BOOL)isFilled
{
  return self->_filled;
}

@end