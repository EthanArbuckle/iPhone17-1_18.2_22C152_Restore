@interface UIPanelBorderView
- (BOOL)isDraggable;
- (BOOL)observesTime;
- (BOOL)renderAsShadow;
- (NSString)backdropGroupName;
- (UIPanelBorderReplicatingView)replicatingView;
- (UIPanelBorderView)initWithFrame:(CGRect)a3;
- (id)_cachedBackdropGroupName;
- (int64_t)statusBarAvoidance;
- (void)layoutSubviews;
- (void)setBackdropGroupName:(id)a3;
- (void)setDraggable:(BOOL)a3;
- (void)setObservesTime:(BOOL)a3;
- (void)setRenderAsShadow:(BOOL)a3;
- (void)setReplicatingView:(id)a3;
- (void)setStatusBarAvoidance:(int64_t)a3;
@end

@implementation UIPanelBorderView

- (UIPanelBorderView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UIPanelBorderView;
  v3 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(UIView *)v3 layer];
    [v5 setAllowsEdgeAntialiasing:1];

    v6 = [(UIView *)v4 layer];
    [v6 setHitTestsAsOpaque:1];
  }
  return v4;
}

- (void)setStatusBarAvoidance:(int64_t)a3
{
  if (self->_statusBarAvoidance != a3)
  {
    self->_statusBarAvoidance = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setRenderAsShadow:(BOOL)a3
{
  self->_renderAsShadow = a3;
  if (a3)
  {
    if (qword_1EB25CB88 != -1) {
      dispatch_once(&qword_1EB25CB88, &__block_literal_global_138);
    }
    id v6 = [(UIView *)self traitCollection];
    uint64_t v4 = [v6 userInterfaceStyle];
    v5 = &_MergedGlobals_3_6;
    if (v4 == 2) {
      v5 = &qword_1EB25CB80;
    }
    [(UIView *)self setBackgroundColor:*v5];
  }
}

void __39__UIPanelBorderView_setRenderAsShadow___block_invoke()
{
  uint64_t v0 = +[UIColor colorWithWhite:0.0 alpha:0.16];
  v1 = (void *)_MergedGlobals_3_6;
  _MergedGlobals_3_6 = v0;

  uint64_t v2 = +[UIColor opaqueSeparatorColor];
  v3 = (void *)qword_1EB25CB80;
  qword_1EB25CB80 = v2;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)UIPanelBorderView;
  [(UIView *)&v18 layoutSubviews];
  int64_t v3 = [(UIPanelBorderView *)self statusBarAvoidance];
  uint64_t v4 = [(UIPanelBorderView *)self replicatingView];
  v5 = v4;
  if (v3 == 1)
  {

    if (!v5)
    {
      [(UIView *)self bounds];
      double v7 = v6;
      objc_super v8 = [(UIView *)self window];
      v9 = __UIStatusBarManagerForWindow(v8);
      [v9 statusBarHeight];
      double v11 = v10;

      BOOL v12 = [(UIView *)self _shouldReverseLayoutDirection];
      double v13 = -1.0;
      if (v12) {
        double v13 = 1.0;
      }
      v14 = -[UIPanelBorderReplicatingView initWithFrame:replicaOffset:]([UIPanelBorderReplicatingView alloc], "initWithFrame:replicaOffset:", v7 * v13, 0.0, v7, v11, -(v13 * v7));
      [(UIView *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIPanelBorderView *)self setReplicatingView:v14];
      v15 = [[_UIBackdropView alloc] initWithPrivateStyle:-4];
      v16 = [(UIPanelBorderView *)self _cachedBackdropGroupName];
      [(_UIBackdropView *)v15 setGroupName:v16];

      [(UIView *)v14 addSubview:v15];
      [(UIView *)self addSubview:v14];
    }
  }
  else
  {

    if (v5)
    {
      v17 = [(UIPanelBorderView *)self replicatingView];
      [v17 removeFromSuperview];

      [(UIPanelBorderView *)self setReplicatingView:0];
    }
  }
}

- (id)_cachedBackdropGroupName
{
  int64_t v3 = [(UIPanelBorderView *)self backdropGroupName];
  if (!v3)
  {
    uint64_t v4 = NSString;
    v5 = (objc_class *)objc_opt_class();
    double v6 = NSStringFromClass(v5);
    int64_t v3 = [v4 stringWithFormat:@"%@-%p", v6, self];

    [(UIPanelBorderView *)self setBackdropGroupName:v3];
  }
  return v3;
}

- (int64_t)statusBarAvoidance
{
  return self->_statusBarAvoidance;
}

- (BOOL)isDraggable
{
  return self->_draggable;
}

- (void)setDraggable:(BOOL)a3
{
  self->_draggable = a3;
}

- (BOOL)renderAsShadow
{
  return self->_renderAsShadow;
}

- (UIPanelBorderReplicatingView)replicatingView
{
  return self->_replicatingView;
}

- (void)setReplicatingView:(id)a3
{
}

- (BOOL)observesTime
{
  return self->_observesTime;
}

- (void)setObservesTime:(BOOL)a3
{
  self->_observesTime = a3;
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (void)setBackdropGroupName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropGroupName, 0);
  objc_storeStrong((id *)&self->_replicatingView, 0);
}

@end