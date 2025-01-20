@interface IMCalloutButton
- (IMCalloutBar)bar;
- (IMCalloutButton)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)pointerInsets;
- (UIPointerInteraction)pointerInteraction;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int)position;
- (void)setBar:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setPointerInsets:(UIEdgeInsets)a3;
- (void)setPointerInteraction:(id)a3;
- (void)setPosition:(int)a3;
@end

@implementation IMCalloutButton

- (IMCalloutButton)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IMCalloutButton;
  v3 = -[IMCalloutButton initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(IMCalloutButton *)v3 setAdjustsImageWhenHighlighted:0];
    [(IMCalloutButton *)v4 setShowsTouchWhenHighlighted:0];
    v4->_position = -1;
    v4->_pointerInsets.top = 0.0;
    v4->_pointerInsets.left = -6.0;
    v4->_pointerInsets.bottom = 0.0;
    v4->_pointerInsets.right = -6.0;
    v5 = (UIPointerInteraction *)[objc_alloc((Class)UIPointerInteraction) initWithDelegate:v4];
    pointerInteraction = v4->_pointerInteraction;
    v4->_pointerInteraction = v5;

    [(IMCalloutButton *)v4 addInteraction:v4->_pointerInteraction];
  }
  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)IMCalloutButton;
  -[IMCalloutButton setHighlighted:](&v6, "setHighlighted:");
  v5 = [(IMCalloutButton *)self bar];
  [v5 setHighlighted:v3 forControl:self];
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7 = a5;
  objc_super v8 = v7;
  if (self->_pointerInteraction == a3)
  {
    [(IMCalloutButton *)self bounds];
    objc_super v8 = +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", 0, v9 + self->_pointerInsets.left, v10 + self->_pointerInsets.top, v11 - (self->_pointerInsets.left + self->_pointerInsets.right), v12 - (self->_pointerInsets.top + self->_pointerInsets.bottom));
  }

  return v8;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = [objc_alloc((Class)UITargetedPreview) initWithView:self];
  objc_super v6 = +[UIPointerHighlightEffect effectWithPreview:v5];
  [(IMCalloutButton *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(IMCalloutButton *)self pointerInsets];
  double v16 = v8 + v15;
  double v18 = v10 + v17;
  double v20 = v12 - (v15 + v19);
  double v22 = v14 - (v17 + v21);
  v23 = [(IMCalloutButton *)self superview];
  -[IMCalloutButton convertRect:toView:](self, "convertRect:toView:", v23, v16, v18, v20, v22);
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  v32 = +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:", v25, v27, v29, v31);
  v33 = +[UIPointerStyle styleWithEffect:v6 shape:v32];

  return v33;
}

- (int)position
{
  return self->_position;
}

- (void)setPosition:(int)a3
{
  self->_position = a3;
}

- (IMCalloutBar)bar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bar);

  return (IMCalloutBar *)WeakRetained;
}

- (void)setBar:(id)a3
{
}

- (UIEdgeInsets)pointerInsets
{
  double top = self->_pointerInsets.top;
  double left = self->_pointerInsets.left;
  double bottom = self->_pointerInsets.bottom;
  double right = self->_pointerInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPointerInsets:(UIEdgeInsets)a3
{
  self->_pointerInsets = a3;
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerInteraction, 0);

  objc_destroyWeak((id *)&self->_bar);
}

@end