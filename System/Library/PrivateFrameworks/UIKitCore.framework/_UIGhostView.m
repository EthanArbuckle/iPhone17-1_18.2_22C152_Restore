@interface _UIGhostView
+ (id)ghostViewForView:(id)a3;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIView)view;
- (_UIGhostView)initWithView:(id)a3;
- (_UIPortalView)portalView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setHidden:(BOOL)a3;
@end

@implementation _UIGhostView

+ (id)ghostViewForView:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithView:v4];

  return v5;
}

- (_UIGhostView)initWithView:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIGhostView;
  v6 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_view, a3);
    v8 = [[_UIPortalView alloc] initWithSourceView:v5];
    portalView = v7->_portalView;
    v7->_portalView = v8;

    [(_UIPortalView *)v7->_portalView setHidesSourceView:1];
    [(UIView *)v7 addSubview:v7->_portalView];
  }

  return v7;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)_UIGhostView;
  [(UIView *)&v4 didMoveToWindow];
  v3 = [(UIView *)self window];
  [(UIView *)self->_view setHidden:v3 == 0];
}

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)_UIGhostView;
  [(UIView *)&v4 didMoveToSuperview];
  v3 = [(UIView *)self superview];
  [(UIView *)self->_view setHidden:v3 == 0];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UIGhostView;
  -[UIView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
  v8 = (_UIPortalView *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 == self->_portalView)
  {
    -[UIView hitTest:withEvent:](self->_view, "hitTest:withEvent:", v7, x, y);
    v10 = (_UIPortalView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v8;
  }
  objc_super v11 = v10;

  return v11;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return -[UIView pointInside:withEvent:](self->_view, "pointInside:withEvent:", a4, a3.x, a3.y);
}

- (CGSize)intrinsicContentSize
{
  [(UIView *)self->_view intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UIView sizeThatFits:](self->_view, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  -[UIView setHidden:](self->_view, "setHidden:");
  v5.receiver = self;
  v5.super_class = (Class)_UIGhostView;
  [(UIView *)&v5 setHidden:v3];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UIGhostView;
  [(UIView *)&v3 layoutSubviews];
  [(UIView *)self bounds];
  -[UIView setBounds:](self->_view, "setBounds:");
  [(UIView *)self bounds];
  -[_UIPortalView setFrame:](self->_portalView, "setFrame:");
  [(UIView *)self->_portalView bounds];
  if (!CGRectIsEmpty(v4))
  {
    [(UIView *)self->_portalView center];
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", 0);
    -[UIView setCenter:](self->_view, "setCenter:");
  }
}

- (UIView)view
{
  return self->_view;
}

- (_UIPortalView)portalView
{
  return self->_portalView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portalView, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end