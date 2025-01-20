@interface SFWebFormAccessoryViewWrapper
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SFWebFormAccessoryViewWrapper)initWithWebFormAccessoryView:(id)a3 bottomBarHeight:(double)a4;
- (double)bottomBarHeight;
- (void)layoutSubviews;
- (void)setBottomBarHeight:(double)a3;
@end

@implementation SFWebFormAccessoryViewWrapper

- (SFWebFormAccessoryViewWrapper)initWithWebFormAccessoryView:(id)a3 bottomBarHeight:(double)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFWebFormAccessoryViewWrapper;
  v8 = [(SFWebFormAccessoryViewWrapper *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_bottomBarHeight = a4;
    objc_storeStrong((id *)&v8->_webFormAccessoryView, a3);
    [(SFWebFormAccessoryViewWrapper *)v9 addSubview:v7];
    [(SFWebFormAccessoryViewWrapper *)v9 sizeToFit];
    v10 = v9;
  }

  return v9;
}

- (void)setBottomBarHeight:(double)a3
{
  if (self->_bottomBarHeight != a3)
  {
    self->_bottomBarHeight = a3;
    [(SFWebFormAccessoryViewWrapper *)self sizeToFit];
    [(SFWebFormAccessoryViewWrapper *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  *(void *)&rect.origin.y = self;
  *(void *)&rect.size.width = SFWebFormAccessoryViewWrapper;
  [(CGFloat *)(objc_super *)&rect.origin.y layoutSubviews];
  [(SFWebFormAccessoryViewWrapper *)self bounds];
  CGFloat v4 = v3;
  rect.origin.x = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(UIView *)self->_webFormAccessoryView frame];
  double v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  double v18 = v17;
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  double Height = CGRectGetHeight(v22);
  v23.origin.x = v12;
  v23.origin.y = v14;
  v23.size.width = v16;
  v23.size.height = v18;
  double v20 = Height - CGRectGetHeight(v23);
  v24.origin.x = rect.origin.x;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  -[UIView setFrame:](self->_webFormAccessoryView, "setFrame:", v12, v20, CGRectGetWidth(v24), v18);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  bottomBardouble Height = self->_bottomBarHeight;
  [(UIView *)self->_webFormAccessoryView bounds];
  double v5 = bottomBarHeight + CGRectGetHeight(v8);
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(UIView *)self->_webFormAccessoryView frame];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (double)bottomBarHeight
{
  return self->_bottomBarHeight;
}

- (void).cxx_destruct
{
}

@end