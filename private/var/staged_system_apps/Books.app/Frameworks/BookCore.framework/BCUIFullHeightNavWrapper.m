@interface BCUIFullHeightNavWrapper
- (BCUIFullHeightNavWrapper)initWithView:(id)a3;
- (BOOL)lift;
- (CGSize)intrinsicContentSize;
- (UIEdgeInsets)cursorInsets;
- (double)specifiedWidth;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)didMoveToSuperview;
- (void)setCursorInsets:(UIEdgeInsets)a3;
- (void)setLift:(BOOL)a3;
- (void)setSpecifiedWidth:(double)a3;
@end

@implementation BCUIFullHeightNavWrapper

- (BCUIFullHeightNavWrapper)initWithView:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BCUIFullHeightNavWrapper;
  v5 = -[BCUIFullHeightNavWrapper initWithFrame:](&v22, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v5)
  {
    v6 = (UIPointerInteraction *)[objc_alloc((Class)UIPointerInteraction) initWithDelegate:v5];
    pointerInteraction = v5->_pointerInteraction;
    v5->_pointerInteraction = v6;

    [(BCUIFullHeightNavWrapper *)v5 addInteraction:v5->_pointerInteraction];
    [(BCUIFullHeightNavWrapper *)v5 addSubview:v4];
    v8 = [(BCUIFullHeightNavWrapper *)v5 heightAnchor];
    uint64_t v9 = [v8 constraintEqualToConstant:44.0];
    heightConstraint = v5->_heightConstraint;
    v5->_heightConstraint = (NSLayoutConstraint *)v9;

    v21 = [(BCUIFullHeightNavWrapper *)v5 widthAnchor];
    v20 = [v4 widthAnchor];
    v11 = [v21 constraintEqualToAnchor:v20 multiplier:1.0 constant:0.0];
    v23[0] = v11;
    v23[1] = v5->_heightConstraint;
    v12 = [v4 centerYAnchor];
    v13 = [(BCUIFullHeightNavWrapper *)v5 centerYAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    v23[2] = v14;
    v15 = [v4 leadingAnchor];
    v16 = [(BCUIFullHeightNavWrapper *)v5 leadingAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    v23[3] = v17;
    v18 = +[NSArray arrayWithObjects:v23 count:4];
    +[NSLayoutConstraint activateConstraints:v18];
  }
  return v5;
}

- (void)didMoveToSuperview
{
  if (self->_heightConstraint)
  {
    -[BCUIFullHeightNavWrapper removeConstraint:](self, "removeConstraint:");
    heightConstraint = self->_heightConstraint;
    self->_heightConstraint = 0;
  }
  id v4 = [(BCUIFullHeightNavWrapper *)self superview];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 heightAnchor];
    v7 = [(BCUIFullHeightNavWrapper *)self heightAnchor];
    v8 = [v6 constraintEqualToAnchor:v7 multiplier:1.0];
    uint64_t v9 = self->_heightConstraint;
    self->_heightConstraint = v8;

    v11 = self->_heightConstraint;
    v10 = +[NSArray arrayWithObjects:&v11 count:1];
    +[NSLayoutConstraint activateConstraints:v10];
  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = a5;

  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = [objc_alloc((Class)UITargetedPreview) initWithView:self];
  if (self->_lift) {
    v6 = (id *)UIPointerLiftEffect_ptr;
  }
  else {
    v6 = (id *)UIPointerHighlightEffect_ptr;
  }
  v7 = [*v6 effectWithPreview:v5];
  if (self->_lift) {
    p_cursorInsets = &UIEdgeInsetsZero;
  }
  else {
    p_cursorInsets = &self->_cursorInsets;
  }
  double top = p_cursorInsets->top;
  double left = p_cursorInsets->left;
  double bottom = p_cursorInsets->bottom;
  double right = p_cursorInsets->right;
  [(BCUIFullHeightNavWrapper *)self bounds];
  double v14 = left + v13;
  double v16 = top + v15;
  double v18 = v17 - (left + right);
  double v20 = v19 - (top + bottom);
  v21 = [(BCUIFullHeightNavWrapper *)self superview];
  -[BCUIFullHeightNavWrapper convertRect:toView:](self, "convertRect:toView:", v21, v14, v16, v18, v20);
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  if (self->_lift)
  {
    v30 = 0;
  }
  else
  {
    v30 = +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:", v23, v25, v27, v29);
  }
  v31 = +[UIPointerStyle styleWithEffect:v7 shape:v30];

  return v31;
}

- (void)setCursorInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_cursorInsets.left
    || a3.top != self->_cursorInsets.top
    || a3.right != self->_cursorInsets.right
    || a3.bottom != self->_cursorInsets.bottom)
  {
    self->_cursorInsets = a3;
    [(UIPointerInteraction *)self->_pointerInteraction invalidate];
  }
}

- (void)setLift:(BOOL)a3
{
  if (self->_lift != a3)
  {
    self->_lift = a3;
    [(UIPointerInteraction *)self->_pointerInteraction invalidate];
  }
}

- (CGSize)intrinsicContentSize
{
  double specifiedWidth = self->_specifiedWidth;
  double v3 = -1.0;
  if (vabdd_f64(0.0, specifiedWidth) < 0.00999999978)
  {
    v4.receiver = self;
    v4.super_class = (Class)BCUIFullHeightNavWrapper;
    [(BCUIFullHeightNavWrapper *)&v4 intrinsicContentSize];
  }
  result.height = v3;
  result.width = specifiedWidth;
  return result;
}

- (UIEdgeInsets)cursorInsets
{
  double top = self->_cursorInsets.top;
  double left = self->_cursorInsets.left;
  double bottom = self->_cursorInsets.bottom;
  double right = self->_cursorInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)lift
{
  return self->_lift;
}

- (double)specifiedWidth
{
  return self->_specifiedWidth;
}

- (void)setSpecifiedWidth:(double)a3
{
  self->_double specifiedWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerInteraction, 0);

  objc_storeStrong((id *)&self->_heightConstraint, 0);
}

@end