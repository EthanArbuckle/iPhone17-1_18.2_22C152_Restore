@interface SidebarContentDimmingView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (SidebarContentDimmingView)initWithFrame:(CGRect)a3 dimmedContentFrame:(CGRect)a4;
- (SidebarContentDimmingViewDelegate)delegate;
- (UIView)passthroughView;
- (void)_dismissRecognized:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmedContentFrame:(CGRect)a3;
- (void)setPassthroughView:(id)a3;
- (void)setTransparent:(BOOL)a3;
@end

@implementation SidebarContentDimmingView

- (SidebarContentDimmingView)initWithFrame:(CGRect)a3 dimmedContentFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)SidebarContentDimmingView;
  v8 = -[SidebarContentDimmingView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v8)
  {
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", x, y, width, height);
    dimmingView = v8->_dimmingView;
    v8->_dimmingView = (UIView *)v9;

    v11 = v8->_dimmingView;
    v12 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIView *)v11 setBackgroundColor:v12];

    [(SidebarContentDimmingView *)v8 addSubview:v8->_dimmingView];
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v8 action:sel__dismissRecognized_];
    dismissRecognizer = v8->_dismissRecognizer;
    v8->_dismissRecognizer = (UITapGestureRecognizer *)v13;

    [(UITapGestureRecognizer *)v8->_dismissRecognizer setDelegate:v8];
    [(SidebarContentDimmingView *)v8 addGestureRecognizer:v8->_dismissRecognizer];
    [(SidebarContentDimmingView *)v8 setAccessibilityIdentifier:@"sidebarContentDimmingView"];
    v15 = v8;
  }

  return v8;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  if (([a4 type] | 2) != 0xB) {
    goto LABEL_3;
  }
  [(UIView *)self->_dimmingView bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  -[SidebarContentDimmingView convertPoint:toView:](self, "convertPoint:toView:", self->_dimmingView, x, y);
  v29.double x = v15;
  v29.double y = v16;
  v31.origin.double x = v8;
  v31.origin.double y = v10;
  v31.size.double width = v12;
  v31.size.double height = v14;
  BOOL v17 = CGRectContainsPoint(v31, v29);
  if (v17)
  {
LABEL_3:
    [(UIView *)self->_passthroughView bounds];
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    -[SidebarContentDimmingView convertPoint:toView:](self, "convertPoint:toView:", self->_passthroughView, x, y);
    v30.double x = v26;
    v30.double y = v27;
    v32.origin.double x = v19;
    v32.origin.double y = v21;
    v32.size.double width = v23;
    v32.size.double height = v25;
    LOBYTE(v17) = !CGRectContainsPoint(v32, v30);
  }
  return v17;
}

- (void)setDimmedContentFrame:(CGRect)a3
{
}

- (void)setTransparent:(BOOL)a3
{
  dimmingView = self->_dimmingView;
  double v4 = 0.5;
  if (a3) {
    double v4 = 0.0;
  }
  [(UIView *)dimmingView setAlpha:v4];
}

- (void)_dismissRecognized:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained sidebarDimmingViewDismiss:self];
}

- (UIView)passthroughView
{
  return self->_passthroughView;
}

- (void)setPassthroughView:(id)a3
{
}

- (SidebarContentDimmingViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SidebarContentDimmingViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passthroughView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_dismissRecognizer, 0);
}

@end