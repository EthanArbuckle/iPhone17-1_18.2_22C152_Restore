@interface MFArrowControlsView
- (MFArrowControlsView)initWithFrame:(CGRect)a3;
- (MFArrowControlsViewDelegate)delegate;
- (UIButton)downButton;
- (UIButton)upButton;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)_arrowButtonWasTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation MFArrowControlsView

- (MFArrowControlsView)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)MFArrowControlsView;
  v3 = -[MFArrowControlsView initWithFrame:](&v17, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[UIButton buttonWithType:1];
    upButton = v3->_upButton;
    v3->_upButton = (UIButton *)v4;

    [(UIButton *)v3->_upButton setContentMode:4];
    [(UIButton *)v3->_upButton addTarget:v3 action:"_arrowButtonWasTapped:" forControlEvents:1];
    [(UIButton *)v3->_upButton setAccessibilityIdentifier:MSAccessibilityIdentifierMailMessageViewUpArrow];
    [(MFArrowControlsView *)v3 addSubview:v3->_upButton];
    uint64_t v6 = +[UIButton buttonWithType:1];
    downButton = v3->_downButton;
    v3->_downButton = (UIButton *)v6;

    [(UIButton *)v3->_downButton setContentMode:4];
    [(UIButton *)v3->_downButton addTarget:v3 action:"_arrowButtonWasTapped:" forControlEvents:1];
    [(UIButton *)v3->_downButton setAccessibilityIdentifier:MSAccessibilityIdentifierMailMessageViewDownArrow];
    [(MFArrowControlsView *)v3 addSubview:v3->_downButton];
    -[MFArrowControlsView setBounds:](v3, "setBounds:", 0.0, 0.0, 0.0, 44.0);
    [(MFArrowControlsView *)v3 setAutoresizingMask:56];
    v8 = v3->_upButton;
    id v9 = [objc_alloc((Class)UIPointerInteraction) initWithDelegate:v3];
    [(UIButton *)v8 addInteraction:v9];

    v10 = v3->_downButton;
    id v11 = [objc_alloc((Class)UIPointerInteraction) initWithDelegate:v3];
    [(UIButton *)v10 addInteraction:v11];

    v12 = v3->_upButton;
    v13 = sub_100173DC0(-1);
    [(UIButton *)v12 setImage:v13 forState:0];

    [(UIButton *)v3->_upButton sizeToFit];
    v14 = v3->_downButton;
    v15 = sub_100173DC0(1);
    [(UIButton *)v14 setImage:v15 forState:0];

    [(UIButton *)v3->_downButton sizeToFit];
  }
  return v3;
}

- (void)_arrowButtonWasTapped:(id)a3
{
  uint64_t v6 = (UIButton *)a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    if (self->_upButton == v6) {
      uint64_t v5 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v5 = 1;
    }
    [WeakRetained arrowControlsView:self didTapButtonWithDirection:v5];
  }
}

- (void)setFrame:(CGRect)a3
{
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIButton *)self->_upButton frame];
  double v7 = v6;
  double v9 = v8;
  v10 = [(UIButton *)self->_upButton imageView];
  id v11 = [v10 image];
  [v11 size];
  double v13 = v12;

  v14 = [(UIButton *)self->_upButton imageView];
  v15 = [v14 image];
  [v15 size];
  double v17 = v16 + 24.0;

  -[UIButton setFrame:](self->_upButton, "setFrame:", v7, v9, v13 + 16.0, v17);
  [(UIButton *)self->_downButton frame];
  double v19 = v18;
  v20 = [(UIButton *)self->_downButton imageView];
  v21 = [v20 image];
  [v21 size];
  double v23 = v22;

  v24 = [(UIButton *)self->_downButton imageView];
  v25 = [v24 image];
  [v25 size];
  double v26 = v23 + 16.0;
  double v28 = v27 + 24.0;

  [(UIButton *)self->_upButton frame];
  double MaxX = CGRectGetMaxX(v41);
  if (+[UIDevice mf_isPad]) {
    double v30 = 18.0;
  }
  else {
    double v30 = 20.0;
  }
  -[UIButton setFrame:](self->_downButton, "setFrame:", MaxX + v30 + -16.0, v19, v26, v28);
  [(UIButton *)self->_upButton frame];
  double v32 = v31;
  if (+[UIDevice mf_isPad]) {
    double v33 = 18.0;
  }
  else {
    double v33 = 20.0;
  }
  double v34 = v32 + v33;
  [(UIButton *)self->_downButton frame];
  double v36 = v34 + v35 + -24.0;
  [(UIButton *)self->_upButton frame];
  double v38 = v37;
  [(UIButton *)self->_downButton frame];
  if (v38 >= v39) {
    double v39 = v38;
  }
  v40.receiver = self;
  v40.super_class = (Class)MFArrowControlsView;
  -[MFArrowControlsView setFrame:](&v40, "setFrame:", x, y, v36, v39);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(UIButton *)self->_downButton frame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v12 = v11;
  CGFloat v14 = v13;
  [(UIButton *)self->_upButton frame];
  v24.origin.CGFloat x = v15 + -10.0;
  v24.size.width = v16 + 10.0;
  v22.CGFloat x = x;
  v22.CGFloat y = y;
  double v17 = v12 + 10.0;
  if (CGRectContainsPoint(v24, v22)) {
    double v18 = self->_upButton;
  }
  else {
    double v18 = 0;
  }
  v25.origin.CGFloat x = v8;
  v25.origin.CGFloat y = v10;
  v25.size.width = v17;
  v25.size.height = v14;
  v23.CGFloat x = x;
  v23.CGFloat y = y;
  if (CGRectContainsPoint(v25, v23))
  {
    double v19 = self->_downButton;

    double v18 = v19;
  }

  return v18;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a5;
  double v7 = [a3 view];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 isEnabled]) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v4 = a3;
  id v5 = objc_alloc((Class)UITargetedPreview);
  id v6 = [v4 view];
  id v7 = [v5 initWithView:v6];
  id v8 = +[UIPointerEffect effectWithPreview:v7];

  double v9 = +[UIPointerStyle styleWithEffect:v8 shape:0];

  return v9;
}

- (MFArrowControlsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFArrowControlsViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIButton)downButton
{
  return self->_downButton;
}

- (UIButton)upButton
{
  return self->_upButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upButton, 0);
  objc_storeStrong((id *)&self->_downButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end