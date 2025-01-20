@interface _UIScrollViewScrollIndicator
+ (id)visualStyleForIdiom:(int64_t)a3;
+ (id)visualStyleForTraitCollection:(id)a3;
+ (void)_ensureDefaultStyles;
+ (void)registerVisualStyle:(id)a3 forIdiom:(int64_t)a4;
- (BOOL)expandedForDirectManipulation;
- (BOOL)hasPointer;
- (CGRect)_offsetFillViewRectForExpandedState:(CGRect)a3;
- (CGSize)layoutOffset;
- (UIColor)foregroundColor;
- (UIView)roundedFillView;
- (_UIScrollViewScrollIndicator)initWithFrame:(CGRect)a3;
- (_UIScrollViewScrollIndicatorVisualStyle)_visualStyle;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)style;
- (unint64_t)type;
- (void)_layoutFillViewAnimated:(BOOL)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)setExpandedForDirectManipulation:(BOOL)a3;
- (void)setForegroundColor:(id)a3;
- (void)setHasPointer:(BOOL)a3;
- (void)setRoundedFillView:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation _UIScrollViewScrollIndicator

- (void)didMoveToWindow
{
  v3 = [(UIView *)self window];

  if (v3)
  {
    visualStyle = self->_visualStyle;
    self->_visualStyle = 0;
  }
}

- (_UIScrollViewScrollIndicator)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)_UIScrollViewScrollIndicator;
  v3 = -[UIView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(_UIScrollViewScrollIndicator *)v3 _visualStyle];
    -[UIView setClipsToBounds:](v4, "setClipsToBounds:", [v5 clipsToBounds]);

    v6 = [(_UIScrollViewScrollIndicator *)v4 _visualStyle];
    v7 = [v6 fillView];
    [(_UIScrollViewScrollIndicator *)v4 setRoundedFillView:v7];

    v8 = [(_UIScrollViewScrollIndicator *)v4 roundedFillView];
    [(UIView *)v4 addSubview:v8];

    v9 = [[UIPointerInteraction alloc] initWithDelegate:v4];
    [(UIView *)v4 addInteraction:v9];
    v10 = [(_UIScrollViewScrollIndicator *)v4 _visualStyle];
    [v10 cursorHitTestingInsets];
    -[UIView setHitTestInsets:](v4, "setHitTestInsets:");
  }
  return v4;
}

- (_UIScrollViewScrollIndicatorVisualStyle)_visualStyle
{
  visualStyle = self->_visualStyle;
  if (!visualStyle)
  {
    v4 = [(UIView *)self traitCollection];
    v5 = +[_UIScrollViewScrollIndicator visualStyleForTraitCollection:v4];
    v6 = self->_visualStyle;
    self->_visualStyle = v5;

    visualStyle = self->_visualStyle;
  }
  return visualStyle;
}

+ (id)visualStyleForTraitCollection:(id)a3
{
  uint64_t v4 = [a3 userInterfaceIdiom];
  return (id)[a1 visualStyleForIdiom:v4];
}

+ (id)visualStyleForIdiom:(int64_t)a3
{
  [a1 _ensureDefaultStyles];
  uint64_t v4 = (void *)_MergedGlobals_1198;
  v5 = [NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    v7 = (void *)qword_1EB262460;
    if (!qword_1EB262460)
    {
      uint64_t v8 = objc_opt_new();
      v9 = (void *)qword_1EB262460;
      qword_1EB262460 = v8;

      v7 = (void *)qword_1EB262460;
    }
    id v6 = v7;
  }
  return v6;
}

+ (void)_ensureDefaultStyles
{
  if (!_MergedGlobals_1198)
  {
    uint64_t v2 = objc_opt_new();
    v3 = (void *)_MergedGlobals_1198;
    _MergedGlobals_1198 = v2;

    id v6 = (id)objc_opt_new();
    [(id)_MergedGlobals_1198 setObject:v6 forKeyedSubscript:&unk_1ED3F60D8];
    [(id)_MergedGlobals_1198 setObject:v6 forKeyedSubscript:&unk_1ED3F60F0];
    [(id)_MergedGlobals_1198 setObject:v6 forKeyedSubscript:&unk_1ED3F6108];
    uint64_t v4 = objc_opt_new();
    [(id)_MergedGlobals_1198 setObject:v4 forKeyedSubscript:&unk_1ED3F6120];

    v5 = objc_opt_new();
    [(id)_MergedGlobals_1198 setObject:v5 forKeyedSubscript:&unk_1ED3F6138];
  }
}

- (void)setRoundedFillView:(id)a3
{
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
  id v6 = [(_UIScrollViewScrollIndicator *)self _visualStyle];
  v5 = [v6 colorForIndicatorStyle:a3 expanded:self->_expandedForDirectManipulation];
  [(_UIScrollViewScrollIndicator *)self setForegroundColor:v5];
}

- (void)setForegroundColor:(id)a3
{
  id v5 = a3;
  id v6 = self->_foregroundColor;
  v7 = (UIColor *)v5;
  v11 = v7;
  if (v6 == v7)
  {

    v10 = v11;
LABEL_9:

    v9 = v11;
    goto LABEL_10;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(UIColor *)v6 isEqual:v7];

  v9 = v11;
  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_foregroundColor, a3);
    v10 = [(_UIScrollViewScrollIndicator *)self roundedFillView];
    [v10 setBackgroundColor:v11];
    goto LABEL_9;
  }
LABEL_10:
}

- (UIView)roundedFillView
{
  return self->_roundedFillView;
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)expandedForDirectManipulation
{
  return self->_expandedForDirectManipulation;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UIScrollViewScrollIndicator;
  [(UIView *)&v3 layoutSubviews];
  [(_UIScrollViewScrollIndicator *)self _layoutFillViewAnimated:0];
}

- (void)_layoutFillViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56___UIScrollViewScrollIndicator__layoutFillViewAnimated___block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  aBlock[4] = self;
  id v5 = _Block_copy(aBlock);
  if (v3)
  {
    long long v8 = 0u;
    long long v9 = 0u;
    id v6 = [(_UIScrollViewScrollIndicator *)self _visualStyle];
    BOOL v7 = [(_UIScrollViewScrollIndicator *)self expandedForDirectManipulation];
    if (v6)
    {
      [v6 valuesForLayoutSizeAnimationWhenExpanding:v7];
    }
    else
    {
      long long v8 = 0u;
      long long v9 = 0u;
    }

    +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v5, 0, v8, v9);
  }
  else
  {
    +[UIView performWithoutAnimation:v5];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_roundedFillView, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
}

- (void)setExpandedForDirectManipulation:(BOOL)a3
{
  if (self->_expandedForDirectManipulation != a3)
  {
    BOOL v3 = a3;
    self->_expandedForDirectManipulation = a3;
    id v5 = [(_UIScrollViewScrollIndicator *)self _visualStyle];
    id v6 = objc_msgSend(v5, "colorForIndicatorStyle:expanded:", -[_UIScrollViewScrollIndicator style](self, "style"), v3);
    [(_UIScrollViewScrollIndicator *)self setForegroundColor:v6];

    [(_UIScrollViewScrollIndicator *)self _layoutFillViewAnimated:1];
  }
}

- (CGRect)_offsetFillViewRectForExpandedState:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  UIUserInterfaceLayoutDirection v8 = [(UIView *)self effectiveUserInterfaceLayoutDirection];
  long long v9 = [(_UIScrollViewScrollIndicator *)self _visualStyle];
  [v9 staticDimensionExpandedSize];
  double v11 = v10;
  objc_super v12 = [(_UIScrollViewScrollIndicator *)self _visualStyle];
  [v12 staticDimensionSize];
  double v14 = v11 - v13;

  unint64_t v15 = [(_UIScrollViewScrollIndicator *)self type];
  if (v8) {
    BOOL v16 = 0;
  }
  else {
    BOOL v16 = v15 == 1;
  }
  if (v16) {
    double v17 = v14;
  }
  else {
    double v17 = 0.0;
  }
  double v18 = x - v17;
  if ([(_UIScrollViewScrollIndicator *)self type] == 1) {
    double v19 = 0.0;
  }
  else {
    double v19 = v14;
  }
  double v20 = y - v19;
  double v21 = v18;
  double v22 = width;
  double v23 = height;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.double y = v20;
  result.origin.double x = v21;
  return result;
}

- (CGSize)layoutOffset
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIScrollViewScrollIndicator;
  UIUserInterfaceLayoutDirection v8 = -[UIView hitTest:withEvent:](&v11, sel_hitTest_withEvent_, v7, x, y);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (([v7 _containsHIDPointerEvent] & 1) == 0)
    {
LABEL_3:
      id v9 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_3;
    }
  }
  id v9 = v8;
LABEL_6:

  return v9;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a5;
  id v7 = [(_UIScrollViewScrollIndicator *)self _visualStyle];
  [(UIView *)self bounds];
  objc_msgSend(v7, "hitTestingRectForIndicatorRect:");
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  BOOL v16 = [v6 identifier];

  double v17 = +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v16, v9, v11, v13, v15);

  return v17;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  return 0;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
}

- (BOOL)hasPointer
{
  return self->_hasPointer;
}

- (void)setHasPointer:(BOOL)a3
{
  self->_hasPointer = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

+ (void)registerVisualStyle:(id)a3 forIdiom:(int64_t)a4
{
  id v6 = a3;
  [a1 _ensureDefaultStyles];
  id v7 = (void *)_MergedGlobals_1198;
  id v8 = [NSNumber numberWithInteger:a4];
  [v7 setObject:v6 forKeyedSubscript:v8];
}

@end