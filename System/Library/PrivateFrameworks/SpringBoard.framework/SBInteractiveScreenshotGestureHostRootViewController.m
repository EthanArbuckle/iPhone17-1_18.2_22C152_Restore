@interface SBInteractiveScreenshotGestureHostRootViewController
- (BOOL)_canShowWhileLocked;
- (SBInteractiveScreenshotGestureHostRootViewController)initWithScreen:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_reloadLayerHostView;
- (void)invalidate;
- (void)setHostingContextID:(unsigned int)a3 pid:(int)a4;
- (void)viewDidLoad;
@end

@implementation SBInteractiveScreenshotGestureHostRootViewController

- (SBInteractiveScreenshotGestureHostRootViewController)initWithScreen:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBInteractiveScreenshotGestureHostRootViewController;
  v6 = [(SBInteractiveScreenshotGestureHostRootViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_screen, a3);
  }

  return v7;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SBInteractiveScreenshotGestureHostRootViewController;
  [(SBInteractiveScreenshotGestureHostRootViewController *)&v3 viewDidLoad];
  [(SBInteractiveScreenshotGestureHostRootViewController *)self _reloadLayerHostView];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)invalidate
{
  [(_UILayerHostView *)self->_layerHostView removeFromSuperview];
  layerHostView = self->_layerHostView;
  self->_layerHostView = 0;
}

- (void)setHostingContextID:(unsigned int)a3 pid:(int)a4
{
  if (self->_hostingContextID != a3 || self->_hostingPid != a4)
  {
    self->_hostingContextID = a3;
    self->_hostingPid = a4;
    if ([(SBInteractiveScreenshotGestureHostRootViewController *)self isViewLoaded])
    {
      [(SBInteractiveScreenshotGestureHostRootViewController *)self _reloadLayerHostView];
    }
  }
}

- (void)_reloadLayerHostView
{
  layerHostView = self->_layerHostView;
  if (layerHostView)
  {
    [(_UILayerHostView *)layerHostView removeFromSuperview];
    v4 = self->_layerHostView;
    self->_layerHostView = 0;
  }
  if (self->_hostingContextID && self->_hostingPid)
  {
    id v5 = [(SBInteractiveScreenshotGestureHostRootViewController *)self view];
    [v5 bounds];
    [(UIScreen *)self->_screen nativeBounds];
    double v7 = v6;
    double v9 = v8;
    [(UIScreen *)self->_screen bounds];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    double v15 = v14;
    double v17 = v16;
    [(UIScreen *)self->_screen _rotation];
    double v19 = v18;
    [(UIScreen *)self->_screen scale];
    double v21 = v20;
    double v22 = v15 * v20;
    int v23 = (v7 >= v9) ^ (v22 < v17 * v21);
    if (v23) {
      double v24 = v17 * v21;
    }
    else {
      double v24 = v22;
    }
    if (v23) {
      double v25 = v22;
    }
    else {
      double v25 = v17 * v21;
    }
    CGAffineTransformMakeRotation(&v32, -v19);
    UIIntegralTransform();
    v34.origin.x = v11;
    v34.origin.y = v13;
    v34.size.width = v25;
    v34.size.height = v24;
    CGRectApplyAffineTransform(v34, &v33);
    id v26 = objc_alloc(MEMORY[0x1E4F43218]);
    BSRectWithSize();
    UIRectGetCenter();
    UIRectCenteredAboutPoint();
    v27 = (_UILayerHostView *)objc_msgSend(v26, "initWithFrame:pid:contextID:", self->_hostingPid, self->_hostingContextID);
    v28 = self->_layerHostView;
    self->_layerHostView = v27;

    memset(&v31, 0, sizeof(v31));
    CGAffineTransformMakeRotation(&v31, v19);
    CGAffineTransform v29 = v31;
    CGAffineTransformScale(&v30, &v29, 1.0 / v21, 1.0 / v21);
    CGAffineTransform v31 = v30;
    [(_UILayerHostView *)self->_layerHostView setTransform:&v30];
    [v5 addSubview:self->_layerHostView];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_layerHostView, 0);
}

@end