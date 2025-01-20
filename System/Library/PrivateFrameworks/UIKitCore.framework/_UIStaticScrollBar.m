@interface _UIStaticScrollBar
- (BOOL)overlay;
- (BOOL)shouldInsetButtonsForIndex;
- (CGRect)centeringBounds;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIButton)downButton;
- (UIButton)upButton;
- (UIScrollView)scrollView;
- (_UIStaticScrollBar)initWithFrame:(CGRect)a3;
- (id)_constraintsForEdge:(int64_t)a3;
- (int64_t)desiredAccessoryEdge;
- (int64_t)edge;
- (unint64_t)_axis;
- (void)_setupSubviewsIfNeeded;
- (void)buttonTapped:(id)a3;
- (void)layoutSubviews;
- (void)setEdge:(int64_t)a3;
- (void)setScrollView:(id)a3;
- (void)setShouldInsetButtonsForIndex:(BOOL)a3;
- (void)updateConstraints;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _UIStaticScrollBar

- (_UIStaticScrollBar)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStaticScrollBar;
  v3 = -[UIView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(UIView *)v3 _setHostsLayoutEngine:1];
  return v3;
}

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStaticScrollBar;
  -[UIView willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (a3) {
    [(UIView *)self setNeedsUpdateConstraints];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  unint64_t v6 = [(_UIStaticScrollBar *)self _axis];
  v7 = [(UIView *)self _screen];
  UIRoundToScreenScale(v7);
  if (v6 == 2) {
    CGFloat width = v8;
  }
  else {
    CGFloat height = v8;
  }

  double v9 = width;
  double v10 = height;
  result.CGFloat height = v10;
  result.CGFloat width = v9;
  return result;
}

- (void)_setupSubviewsIfNeeded
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44___UIStaticScrollBar__setupSubviewsIfNeeded__block_invoke;
  aBlock[3] = &unk_1E530F8F8;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  v4 = (void (**)(void, void))v3;
  if (!self->_upButton)
  {
    (*((void (**)(void *, __CFString *))v3 + 2))(v3, @"chevron.up");
    objc_super v5 = (UIButton *)objc_claimAutoreleasedReturnValue();
    upButton = self->_upButton;
    self->_upButton = v5;

    [(UIView *)self addSubview:self->_upButton];
  }
  if (!self->_downButton)
  {
    ((void (**)(void, __CFString *))v4)[2](v4, @"chevron.down");
    v7 = (UIButton *)objc_claimAutoreleasedReturnValue();
    downButton = self->_downButton;
    self->_downButton = v7;

    [(UIView *)self addSubview:self->_downButton];
  }
  if (!self->_dividerLine)
  {
    double v9 = objc_alloc_init(UIView);
    dividerLine = self->_dividerLine;
    self->_dividerLine = v9;

    [(UIView *)self->_dividerLine setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = +[UIColor clearColor];
    [(UIView *)self->_dividerLine setBackgroundColor:v11];

    [(UIView *)self addSubview:self->_dividerLine];
  }
}

- (void)layoutSubviews
{
  [(_UIStaticScrollBar *)self _setupSubviewsIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)_UIStaticScrollBar;
  [(UIView *)&v3 layoutSubviews];
}

- (void)updateConstraints
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStaticScrollBar;
  [(UIView *)&v5 updateConstraints];
  [(_UIStaticScrollBar *)self _setupSubviewsIfNeeded];
  if (self->_constraints) {
    objc_msgSend(MEMORY[0x1E4F5B268], "deactivateConstraints:");
  }
  objc_super v3 = [(_UIStaticScrollBar *)self _constraintsForEdge:[(_UIStaticScrollBar *)self edge]];
  constraints = self->_constraints;
  self->_constraints = v3;

  [MEMORY[0x1E4F5B268] activateConstraints:self->_constraints];
}

- (id)_constraintsForEdge:(int64_t)a3
{
  v39[4] = *MEMORY[0x1E4F143B8];
  if (!self->_upButton || !self->_downButton || !self->_dividerLine)
  {
    v37 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
    [v37 handleFailureInMethod:a2 object:self file:@"_UIStaticScrollBar.m" lineNumber:131 description:@"you should not request constraints before setting up the required views"];
  }
  unint64_t v5 = [(_UIStaticScrollBar *)self _axis];
  if ([(_UIStaticScrollBar *)self shouldInsetButtonsForIndex]) {
    double v6 = 100.0;
  }
  else {
    double v6 = 0.0;
  }
  v7 = [(UIView *)self _screen];
  UIRoundToScreenScale(v7);
  double v9 = v8;

  double v10 = [(UIButton *)self->_upButton imageForState:0];
  [v10 size];
  double v12 = v11;
  double v14 = v13;

  if (v5 == 2) {
    double v12 = v14;
  }
  v38[0] = @"margin";
  v15 = [NSNumber numberWithDouble:v9];
  v39[0] = v15;
  v38[1] = @"spacing";
  v16 = [NSNumber numberWithDouble:v6];
  v39[1] = v16;
  v38[2] = @"hairline";
  v17 = [NSNumber numberWithDouble:1.0];
  v39[2] = v17;
  v38[3] = @"minLength";
  v18 = [NSNumber numberWithDouble:v12];
  v39[3] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:4];

  v20 = _NSDictionaryOfVariableBindings(&cfstr_DividerlineUpb.isa, self->_dividerLine, self->_upButton, self->_downButton, 0);
  v21 = [MEMORY[0x1E4F1CA48] array];
  if (v5)
  {
    if (v5 != 1)
    {
      if (v5 != 2) {
        goto LABEL_25;
      }
      if ([(_UIStaticScrollBar *)self edge] == 3) {
        unint64_t v22 = 0x10000;
      }
      else {
        unint64_t v22 = (unint64_t)([(_UIStaticScrollBar *)self edge] == 5) << 17;
      }
      v32 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"|[_upButton][_dividerLine(hairline)]|" options:v22 metrics:v19 views:v20];
      [v21 addObjectsFromArray:v32];

      v33 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"|[_downButton][_dividerLine]|" options:v22 metrics:v19 views:v20];
      [v21 addObjectsFromArray:v33];

      v34 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"V:|[_dividerLine]|" options:0 metrics:v19 views:v20];
      [v21 addObjectsFromArray:v34];

      v30 = (void *)MEMORY[0x1E4F5B268];
      v31 = @"V:|-margin-[_upButton(==_downButton)]-spacing@750-[_downButton(>=minLength)]-margin-|";
      goto LABEL_23;
    }
    if ([(_UIStaticScrollBar *)self edge] == 2)
    {
      v25 = @"V:|[_downButton][_dividerLine]|";
      v26 = @"V:|[_upButton][_dividerLine(hairline)]|";
    }
    else
    {
      if ([(_UIStaticScrollBar *)self edge] != 4)
      {
LABEL_20:
        v29 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"|[_dividerLine]|" options:0 metrics:v19 views:v20];
        [v21 addObjectsFromArray:v29];

        v30 = (void *)MEMORY[0x1E4F5B268];
        v31 = @"|-margin-[_upButton(==_downButton)]-spacing@750-[_downButton(>=minLength)]-margin-|";
LABEL_23:
        v23 = [v30 constraintsWithVisualFormat:v31 options:0 metrics:v19 views:v20];
        [v21 addObjectsFromArray:v23];
        goto LABEL_24;
      }
      v25 = @"V:|[_dividerLine][_downButton]|";
      v26 = @"V:|[_dividerLine(hairline)][_upButton]|";
    }
    v27 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:v26 options:0 metrics:v19 views:v20];
    [v21 addObjectsFromArray:v27];

    v28 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:v25 options:0 metrics:v19 views:v20];
    [v21 addObjectsFromArray:v28];

    goto LABEL_20;
  }
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  v24 = objc_msgSend(NSNumber, "numberWithInteger:", -[_UIStaticScrollBar edge](self, "edge"));
  [v23 handleFailureInMethod:a2, self, @"_UIStaticScrollBar.m", 179, @"scroll bar edge is outside expected values (edge:%@)", v24 object file lineNumber description];

LABEL_24:
LABEL_25:
  v35 = (void *)[v21 copy];

  return v35;
}

- (BOOL)overlay
{
  return 0;
}

- (unint64_t)_axis
{
  if ((([(_UIStaticScrollBar *)self edge] - 2) & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)buttonTapped:(id)a3
{
  if (self->_upButton == a3) {
    double v4 = -1.0;
  }
  else {
    double v4 = 1.0;
  }
  id v5 = [(_UIStaticScrollBar *)self scrollView];
  objc_msgSend(v5, "_staticScrollBar:didScrollInDirection:", self, 0.0, v4);
}

- (void)setShouldInsetButtonsForIndex:(BOOL)a3
{
  if (self->_shouldInsetButtonsForIndex != a3)
  {
    self->_shouldInsetButtonsForIndex = a3;
    [(UIView *)self setNeedsUpdateConstraints];
  }
}

- (void)setEdge:(int64_t)a3
{
  if (self->_edge != a3)
  {
    self->_edge = a3;
    [(UIView *)self setNeedsUpdateConstraints];
  }
}

- (int64_t)desiredAccessoryEdge
{
  v2 = +[UIScreen _carScreen];
  if ([v2 _isRightHandDrive]) {
    int64_t v3 = 3;
  }
  else {
    int64_t v3 = 5;
  }

  return v3;
}

- (CGRect)centeringBounds
{
  UIRoundToViewScale(self);
  double v4 = v3;
  if ([(_UIStaticScrollBar *)self _axis] == 2) {
    char v5 = 10;
  }
  else {
    char v5 = 5;
  }
  [(UIView *)self bounds];
  double v10 = UIRectInsetEdges(v5, v6, v7, v8, v9, v4);
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (UIScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  return (UIScrollView *)WeakRetained;
}

- (void)setScrollView:(id)a3
{
}

- (int64_t)edge
{
  return self->_edge;
}

- (UIButton)upButton
{
  return self->_upButton;
}

- (UIButton)downButton
{
  return self->_downButton;
}

- (BOOL)shouldInsetButtonsForIndex
{
  return self->_shouldInsetButtonsForIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downButton, 0);
  objc_storeStrong((id *)&self->_upButton, 0);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_invocation, 0);
  objc_storeStrong((id *)&self->_dividerLine, 0);
}

@end