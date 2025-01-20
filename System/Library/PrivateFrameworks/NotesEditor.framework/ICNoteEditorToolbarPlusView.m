@interface ICNoteEditorToolbarPlusView
+ (id)newCircleMaskWithBounds:(CGRect)a3;
- (BOOL)closeState;
- (CAGradientLayer)gradientLayer;
- (CGSize)intrinsicContentSize;
- (ICNoteEditorToolbarPlusView)initWithFrame:(CGRect)a3;
- (UIColor)itemColor;
- (UIView)gradientView;
- (UIView)plainView;
- (UIView)plusView;
- (id)backgroundColor;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)setCloseState:(BOOL)a3;
- (void)setGradientLayer:(id)a3;
- (void)setGradientView:(id)a3;
- (void)setPlainView:(id)a3;
- (void)setPlusView:(id)a3;
- (void)updateGradientLayerColors;
@end

@implementation ICNoteEditorToolbarPlusView

- (ICNoteEditorToolbarPlusView)initWithFrame:(CGRect)a3
{
  v36.receiver = self;
  v36.super_class = (Class)ICNoteEditorToolbarPlusView;
  v3 = -[ICNoteEditorToolbarPlusView initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F157D0]);
    [(ICNoteEditorToolbarPlusView *)v3 bounds];
    objc_msgSend(v4, "setFrame:");
    v5 = objc_opt_class();
    [(ICNoteEditorToolbarPlusView *)v3 bounds];
    v6 = objc_msgSend(v5, "newCircleMaskWithBounds:");
    [v4 setMask:v6];

    objc_msgSend(v4, "setStartPoint:", 0.0, 0.0);
    objc_msgSend(v4, "setEndPoint:", 0.0, 1.0);
    [(ICNoteEditorToolbarPlusView *)v3 setGradientLayer:v4];
    [(ICNoteEditorToolbarPlusView *)v3 updateGradientLayerColors];
    id v7 = objc_alloc(MEMORY[0x263F82E00]);
    [(ICNoteEditorToolbarPlusView *)v3 bounds];
    v8 = objc_msgSend(v7, "initWithFrame:");
    [(ICNoteEditorToolbarPlusView *)v3 setGradientView:v8];

    v9 = [(ICNoteEditorToolbarPlusView *)v3 gradientView];
    v10 = [v9 layer];
    [v10 addSublayer:v4];

    v11 = [(ICNoteEditorToolbarPlusView *)v3 gradientView];
    [(ICNoteEditorToolbarPlusView *)v3 addSubview:v11];

    id v12 = objc_alloc(MEMORY[0x263F82E00]);
    [(ICNoteEditorToolbarPlusView *)v3 bounds];
    v13 = objc_msgSend(v12, "initWithFrame:");
    [(ICNoteEditorToolbarPlusView *)v3 setPlainView:v13];

    v14 = objc_opt_class();
    [(ICNoteEditorToolbarPlusView *)v3 bounds];
    v15 = objc_msgSend(v14, "newCircleMaskWithBounds:");
    v16 = [(ICNoteEditorToolbarPlusView *)v3 plainView];
    v17 = [v16 layer];
    [v17 setMask:v15];

    v18 = [(ICNoteEditorToolbarPlusView *)v3 plainView];
    [v18 setBackgroundColor:0];

    v19 = [(ICNoteEditorToolbarPlusView *)v3 plainView];
    [(ICNoteEditorToolbarPlusView *)v3 addSubview:v19];

    [(ICNoteEditorToolbarPlusView *)v3 bounds];
    double v21 = v20 * 0.5;
    id v22 = objc_alloc_init(MEMORY[0x263F157E8]);
    double v23 = v21 + -1.0;
    double v24 = v21 + -8.0;
    objc_msgSend(v22, "setFrame:", v23, v24, 2.0, 16.0);
    [v22 setCornerRadius:1.0];
    id v25 = [(ICNoteEditorToolbarPlusView *)v3 itemColor];
    objc_msgSend(v22, "setBackgroundColor:", objc_msgSend(v25, "CGColor"));

    id v26 = objc_alloc_init(MEMORY[0x263F157E8]);
    objc_msgSend(v26, "setFrame:", v24, v23, 16.0, 2.0);
    [v26 setCornerRadius:1.0];
    id v27 = [(ICNoteEditorToolbarPlusView *)v3 itemColor];
    objc_msgSend(v26, "setBackgroundColor:", objc_msgSend(v27, "CGColor"));

    id v28 = objc_alloc(MEMORY[0x263F82E00]);
    [(ICNoteEditorToolbarPlusView *)v3 bounds];
    v29 = objc_msgSend(v28, "initWithFrame:");
    [(ICNoteEditorToolbarPlusView *)v3 setPlusView:v29];

    v30 = [(ICNoteEditorToolbarPlusView *)v3 plusView];
    v31 = [v30 layer];
    [v31 addSublayer:v26];

    v32 = [(ICNoteEditorToolbarPlusView *)v3 plusView];
    v33 = [v32 layer];
    [v33 addSublayer:v22];

    v34 = [(ICNoteEditorToolbarPlusView *)v3 plusView];
    [(ICNoteEditorToolbarPlusView *)v3 addSubview:v34];

    v3->_closeState = 1;
    [(ICNoteEditorToolbarPlusView *)v3 setCloseState:0];
  }
  return v3;
}

- (UIView)plusView
{
  return self->_plusView;
}

- (UIView)plainView
{
  return self->_plainView;
}

- (UIView)gradientView
{
  return self->_gradientView;
}

- (UIColor)itemColor
{
  return (UIColor *)[MEMORY[0x263F825C8] whiteColor];
}

+ (id)newCircleMaskWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = objc_alloc_init(MEMORY[0x263F15880]);
  objc_msgSend(v7, "setFrame:", x, y, width, height);
  id v8 = [MEMORY[0x263F825C8] blackColor];
  objc_msgSend(v7, "setFillColor:", objc_msgSend(v8, "CGColor"));

  id v9 = [MEMORY[0x263F825C8] clearColor];
  objc_msgSend(v7, "setStrokeColor:", objc_msgSend(v9, "CGColor"));

  Mutable = CGPathCreateMutable();
  [v7 bounds];
  CGPathAddEllipseInRect(Mutable, 0, v12);
  [v7 setPath:Mutable];
  CGPathRelease(Mutable);
  return v7;
}

- (void)setPlusView:(id)a3
{
}

- (void)setPlainView:(id)a3
{
}

- (void)setGradientView:(id)a3
{
}

- (void)setGradientLayer:(id)a3
{
}

- (void)setCloseState:(BOOL)a3
{
  if (self->_closeState != a3)
  {
    BOOL v3 = a3;
    self->_closeState = a3;
    v5 = [(ICNoteEditorToolbarPlusView *)self plusView];
    v6 = v5;
    if (v3)
    {
      [v5 setAlpha:0.0];

      id v7 = [(ICNoteEditorToolbarPlusView *)self plainView];
      [v7 setAlpha:1.0];

      id v8 = [(ICNoteEditorToolbarPlusView *)self gradientView];
      double v9 = 0.0;
    }
    else
    {
      [v5 setAlpha:1.0];

      v10 = [(ICNoteEditorToolbarPlusView *)self plainView];
      [v10 setAlpha:0.0];

      id v8 = [(ICNoteEditorToolbarPlusView *)self gradientView];
      double v9 = 1.0;
    }
    id v11 = v8;
    [v8 setAlpha:v9];
  }
}

- (void)updateGradientLayerColors
{
  v9[2] = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263F825C8] colorNamed:@"notes_format_plus_button_gradient_top"];
  id v4 = [MEMORY[0x263F825C8] colorNamed:@"notes_format_plus_button_gradient_bottom"];
  id v5 = v3;
  v9[0] = [v5 CGColor];
  id v6 = v4;
  v9[1] = [v6 CGColor];
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  id v8 = [(ICNoteEditorToolbarPlusView *)self gradientLayer];
  [v8 setColors:v7];
}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (id)backgroundColor
{
  v2 = [MEMORY[0x263F825C8] systemFillColor];
  BOOL v3 = [v2 colorWithAlphaComponent:0.8];

  return v3;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)ICNoteEditorToolbarPlusView;
  [(ICNoteEditorToolbarPlusView *)&v7 _dynamicUserInterfaceTraitDidChange];
  BOOL v3 = [(ICNoteEditorToolbarPlusView *)self plusView];
  id v4 = [v3 layer];
  id v5 = [v4 sublayers];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__ICNoteEditorToolbarPlusView__dynamicUserInterfaceTraitDidChange__block_invoke;
  v6[3] = &unk_2640B9C48;
  v6[4] = self;
  [v5 enumerateObjectsUsingBlock:v6];

  [(ICNoteEditorToolbarPlusView *)self updateGradientLayerColors];
}

void __66__ICNoteEditorToolbarPlusView__dynamicUserInterfaceTraitDidChange__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 itemColor];
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));
}

- (CGSize)intrinsicContentSize
{
  double v2 = 44.0;
  double v3 = 44.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (BOOL)closeState
{
  return self->_closeState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_plusView, 0);
  objc_storeStrong((id *)&self->_plainView, 0);

  objc_storeStrong((id *)&self->_gradientView, 0);
}

@end