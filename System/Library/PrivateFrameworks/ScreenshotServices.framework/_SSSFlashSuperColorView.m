@interface _SSSFlashSuperColorView
- (_SSSFlashSuperColorView)initWithFrame:(CGRect)a3;
- (unint64_t)style;
- (void)_updateBackgroundColor;
- (void)setStyle:(unint64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation _SSSFlashSuperColorView

- (_SSSFlashSuperColorView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_SSSFlashSuperColorView;
  v3 = -[_SSSFlashSuperColorView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_SSSFlashSuperColorView *)v3 _updateBackgroundColor];
  return v3;
}

- (void)setStyle:(unint64_t)a3
{
  if ([(_SSSFlashSuperColorView *)self style] != a3)
  {
    self->_style = a3;
    [(_SSSFlashSuperColorView *)self _updateBackgroundColor];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_SSSFlashSuperColorView;
  id v4 = a3;
  [(_SSSFlashSuperColorView *)&v8 traitCollectionDidChange:v4];
  uint64_t v5 = objc_msgSend(v4, "userInterfaceStyle", v8.receiver, v8.super_class);

  v6 = [(_SSSFlashSuperColorView *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  if (v5 != v7) {
    [(_SSSFlashSuperColorView *)self _updateBackgroundColor];
  }
}

- (void)_updateBackgroundColor
{
  unint64_t v3 = [(_SSSFlashSuperColorView *)self style];
  if (v3 != 2)
  {
    if (v3)
    {
      id v17 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D50]];
      v10 = (void *)MEMORY[0x263F1C550];
      double v11 = -2.0;
      double v12 = -2.0;
      double v13 = -2.0;
      double v14 = 0.75;
    }
    else
    {
      id v4 = [(_SSSFlashSuperColorView *)self traitCollection];
      uint64_t v5 = [v4 userInterfaceStyle];

      if (v5 == 2)
      {
        v6 = (void *)MEMORY[0x263F1C550];
        goto LABEL_6;
      }
      id v17 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D58]];
      v10 = (void *)MEMORY[0x263F1C550];
      double v11 = 2.0;
      double v12 = 2.0;
      double v13 = 2.0;
      double v14 = 1.0;
    }
    v15 = [v10 colorWithRed:v11 green:v12 blue:v13 alpha:v14];
    goto LABEL_12;
  }
  uint64_t v7 = [(_SSSFlashSuperColorView *)self traitCollection];
  uint64_t v8 = [v7 userInterfaceStyle];

  v6 = (void *)MEMORY[0x263F1C550];
  if (v8 != 2)
  {
    uint64_t v9 = [MEMORY[0x263F1C550] colorWithRed:1.1 green:1.1 blue:1.1 alpha:1.0];
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v9 = [v6 colorWithWhite:0.85 alpha:1.0];
LABEL_11:
  v15 = (void *)v9;
  id v17 = 0;
LABEL_12:
  v16 = [(_SSSFlashSuperColorView *)self layer];
  [v16 setCompositingFilter:v17];

  [(_SSSFlashSuperColorView *)self setBackgroundColor:v15];
}

- (unint64_t)style
{
  return self->_style;
}

@end