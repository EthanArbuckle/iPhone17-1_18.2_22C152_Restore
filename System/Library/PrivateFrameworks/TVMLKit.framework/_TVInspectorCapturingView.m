@interface _TVInspectorCapturingView
- (BOOL)isTestingHits;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (UILabel)descriptionLabel;
- (_TVInspectorCapturingView)initWithFrame:(CGRect)a3;
- (_TVInspectorCapturingViewDelegate)delegate;
- (void)didTapView:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
@end

@implementation _TVInspectorCapturingView

- (_TVInspectorCapturingView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_TVInspectorCapturingView;
  v3 = -[_TVInspectorCapturingView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_testingHits = 0;
    [(_TVInspectorCapturingView *)v3 setUserInteractionEnabled:1];
    v5 = [MEMORY[0x263F1C550] clearColor];
    [(_TVInspectorCapturingView *)v4 setBackgroundColor:v5];

    v6 = [(_TVInspectorCapturingView *)v4 layer];
    id v7 = [MEMORY[0x263F1C550] systemBlueColor];
    objc_msgSend(v6, "setBorderColor:", objc_msgSend(v7, "CGColor"));

    v8 = [(_TVInspectorCapturingView *)v4 layer];
    [v8 setBorderWidth:10.0];

    v9 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v4 action:sel_didTapView_];
    [v9 setNumberOfTapsRequired:1];
    [v9 setNumberOfTouchesRequired:1];
    [(_TVInspectorCapturingView *)v4 addGestureRecognizer:v9];
  }
  return v4;
}

- (UILabel)descriptionLabel
{
  p_descriptionLabel = &self->_descriptionLabel;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_descriptionLabel);

  if (!WeakRetained)
  {
    id v5 = objc_alloc(MEMORY[0x263F1C768]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    id v7 = [MEMORY[0x263F1C550] systemBlueColor];
    [v6 setBackgroundColor:v7];

    v8 = [MEMORY[0x263F1C550] whiteColor];
    [v6 setTextColor:v8];

    [v6 setText:@"Tap a view to inspect"];
    [v6 setTextAlignment:1];
    [v6 setUserInteractionEnabled:0];
    v9 = [MEMORY[0x263F1C658] boldSystemFontOfSize:11.0];
    [v6 setFont:v9];

    [(_TVInspectorCapturingView *)self addSubview:v6];
    objc_storeWeak((id *)p_descriptionLabel, v6);
  }
  id v10 = objc_loadWeakRetained((id *)p_descriptionLabel);
  return (UILabel *)v10;
}

- (void)layoutSubviews
{
  *(void *)&rect.origin.y = self;
  *(void *)&rect.size.width = _TVInspectorCapturingView;
  [(CGFloat *)(objc_super *)&rect.origin.y layoutSubviews];
  v3 = [(_TVInspectorCapturingView *)self descriptionLabel];
  [v3 sizeToFit];

  [(_TVInspectorCapturingView *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  v12 = [(_TVInspectorCapturingView *)self descriptionLabel];
  [v12 bounds];
  rect.origin.x = v13;
  CGFloat v15 = v14;
  double v17 = v16;
  double v19 = v18;

  v20 = [(_TVInspectorCapturingView *)self descriptionLabel];
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  double MidX = CGRectGetMidX(v24);
  v25.origin.x = rect.origin.x;
  v25.origin.y = v15;
  v25.size.width = v17;
  v25.size.height = v19;
  double v22 = MidX - CGRectGetMidX(v25);
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  objc_msgSend(v20, "setFrame:", v22, CGRectGetMaxY(v26) + -10.0 - v19 + -10.0, v17 + 10.0, v19 + 10.0);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_TVInspectorCapturingView;
  unsigned __int8 v5 = -[_TVInspectorCapturingView pointInside:withEvent:](&v7, sel_pointInside_withEvent_, a4, a3.x, a3.y);
  return v5 & ~[(_TVInspectorCapturingView *)self isTestingHits];
}

- (void)didTapView:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(_TVInspectorCapturingView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v6 = [(_TVInspectorCapturingView *)self delegate];
    id v15 = [v6 rootView];
  }
  else
  {
    id v15 = 0;
  }

  self->_testingHits = 1;
  [v4 locationInView:self];
  double v8 = v7;
  double v10 = v9;

  CGFloat v11 = objc_msgSend(v15, "hitTest:withEvent:", 0, v8, v10);
  self->_testingHits = 0;
  if (v11)
  {
    v12 = [(_TVInspectorCapturingView *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      double v14 = [(_TVInspectorCapturingView *)self delegate];
      [v14 capturingView:self didCaptureTapOnView:v11];
    }
  }
}

- (BOOL)isTestingHits
{
  return self->_testingHits;
}

- (_TVInspectorCapturingViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_TVInspectorCapturingViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_descriptionLabel);
}

@end