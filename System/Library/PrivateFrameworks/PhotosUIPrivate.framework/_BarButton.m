@interface _BarButton
- (_BarButton)initWithTitle:(id)a3 titleColor:(id)a4 backgroundColor:(id)a5 target:(id)a6 action:(SEL)a7;
- (void)layoutSubviews;
@end

@implementation _BarButton

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)_BarButton;
  [(_BarButton *)&v6 layoutSubviews];
  [(_BarButton *)self frame];
  double v4 = v3 * 0.5;
  v5 = [(_BarButton *)self layer];
  [v5 setCornerRadius:v4];
}

- (_BarButton)initWithTitle:(id)a3 titleColor:(id)a4 backgroundColor:(id)a5 target:(id)a6 action:(SEL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v23.receiver = self;
  v23.super_class = (Class)_BarButton;
  v16 = -[_BarButton initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v16)
  {
    v17 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
    [v17 setTitle:v12 forState:0];
    [v17 addTarget:v15 action:a7 forControlEvents:64];
    [v17 setTitleColor:v13 forState:0];
    v18 = PXFontWithTextStyleAndWeight();
    v19 = [v17 titleLabel];
    [v19 setFont:v18];

    [v17 sizeToFit];
    [v17 setAutoresizingMask:18];
    [v17 frame];
    PXRectWithOriginAndSize();
    -[_BarButton setFrame:](v16, "setFrame:");
    [(_BarButton *)v16 setBackgroundColor:v14];
    uint64_t v20 = *MEMORY[0x1E4F39EA8];
    v21 = [(_BarButton *)v16 layer];
    [v21 setCornerCurve:v20];

    [(_BarButton *)v16 addSubview:v17];
    [(_BarButton *)v16 bounds];
    PXRectGetCenter();
    [v17 frame];
    PXRectWithCenterAndSize();
    objc_msgSend(v17, "setFrame:");
  }
  return v16;
}

@end