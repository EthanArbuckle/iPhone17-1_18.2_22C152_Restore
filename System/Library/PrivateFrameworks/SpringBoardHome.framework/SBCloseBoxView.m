@interface SBCloseBoxView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)shouldTrack;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SBCloseBoxViewDelegate)delegate;
- (SBIconListLayout)listLayout;
- (UIEdgeInsets)backgroundInsets;
- (UIEdgeInsets)hitTestPadding;
- (UITapGestureRecognizer)actionTapGestureRecognizer;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)setActionTapGestureRecognizer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setListLayout:(id)a3;
@end

@implementation SBCloseBoxView

- (BOOL)shouldTrack
{
  v7.receiver = self;
  v7.super_class = (Class)SBCloseBoxView;
  if (![(SBCloseBoxView *)&v7 shouldTrack]) {
    return 0;
  }
  v3 = [(SBCloseBoxView *)self delegate];
  v4 = v3;
  if (v3) {
    char v5 = [v3 closeBoxShouldTrack:self];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (UIEdgeInsets)backgroundInsets
{
  double v2 = 1.0;
  double v3 = 1.0;
  double v4 = 1.0;
  double v5 = 1.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = [(SBCloseBoxView *)self listLayout];
  double v4 = 26.0;
  double v5 = 26.0;
  if (objc_opt_respondsToSelector())
  {
    v6 = [v3 iconAccessoryVisualConfiguration];
    [v6 size];
    double v5 = v7;
    double v4 = v8;
  }
  double v9 = v5;
  double v10 = v4;
  result.height = v10;
  result.width = v9;
  return result;
}

- (UIEdgeInsets)hitTestPadding
{
  double v2 = -9.0;
  double v3 = -9.0;
  double v4 = -9.0;
  double v5 = -9.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(SBCloseBoxView *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(SBCloseBoxView *)self hitTestPadding];
  double v16 = v10 + v15;
  double v19 = v12 - (v17 + v18);
  double v21 = v14 - (v15 + v20);
  double v22 = v8 + v17;
  double v23 = v16;
  double v24 = v19;
  CGFloat v25 = x;
  CGFloat v26 = y;
  return CGRectContainsPoint(*(CGRect *)&v22, *(CGPoint *)&v25);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = a5;
  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
  v6 = (void *)MEMORY[0x1E4FB14C0];
  [(SBCloseBoxView *)self bounds];
  CGRect v15 = CGRectInset(v14, 1.0, 1.0);
  double v7 = objc_msgSend(v6, "bezierPathWithOvalInRect:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
  [v5 setShadowPath:v7];
  double v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self parameters:v5];
  double v9 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v8];
  double v10 = [MEMORY[0x1E4FB1AE0] shapeWithPath:v7];
  double v11 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v9 shape:v10];

  return v11;
}

- (UITapGestureRecognizer)actionTapGestureRecognizer
{
  return self->_actionTapGestureRecognizer;
}

- (void)setActionTapGestureRecognizer:(id)a3
{
}

- (SBCloseBoxViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBCloseBoxViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBIconListLayout)listLayout
{
  return self->_listLayout;
}

- (void)setListLayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listLayout, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actionTapGestureRecognizer, 0);
}

@end