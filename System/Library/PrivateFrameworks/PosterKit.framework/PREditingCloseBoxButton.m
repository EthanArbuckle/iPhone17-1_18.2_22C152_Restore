@interface PREditingCloseBoxButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIEdgeInsets)backgroundInsets;
- (UIEdgeInsets)hitTestPadding;
- (UITapGestureRecognizer)actionTapGestureRecognizer;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)setActionTapGestureRecognizer:(id)a3;
@end

@implementation PREditingCloseBoxButton

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
  double v3 = 26.0;
  double v4 = 26.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2 = 26.0;
  double v3 = 26.0;
  result.height = v3;
  result.width = v2;
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
  [(PREditingCloseBoxButton *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(PREditingCloseBoxButton *)self hitTestPadding];
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
  [(PREditingCloseBoxButton *)self bounds];
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

- (void).cxx_destruct
{
}

@end