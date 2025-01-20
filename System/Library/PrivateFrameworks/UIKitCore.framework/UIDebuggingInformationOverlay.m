@interface UIDebuggingInformationOverlay
+ (id)overlay;
+ (void)prepareDebuggingOverlay;
- (BOOL)checkingTouches;
- (BOOL)isFullscreen;
- (BOOL)touchCaptureEnabled;
- (CGPoint)drawingOrigin;
- (NSMutableArray)touchObservers;
- (UIDebuggingInformationOverlay)init;
- (UIDebuggingInformationOverlay)initWithFrame:(CGRect)a3;
- (UIDebuggingInformationRootTableViewController)rootTableViewController;
- (UIEvent)lastTouch;
- (UIWindow)inspectedWindow;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_setHidden:(BOOL)a3;
- (void)setCheckingTouches:(BOOL)a3;
- (void)setDrawingOrigin:(CGPoint)a3;
- (void)setInspectedWindow:(id)a3;
- (void)setIsFullscreen:(BOOL)a3;
- (void)setLastTouch:(id)a3;
- (void)setRootTableViewController:(id)a3;
- (void)setTouchCaptureEnabled:(BOOL)a3;
- (void)setTouchObservers:(id)a3;
- (void)toggleFullscreen;
- (void)toggleVisibility;
@end

@implementation UIDebuggingInformationOverlay

- (UIDebuggingInformationOverlay)init
{
  if (qword_1EB25D478 != -1) {
    dispatch_once(&qword_1EB25D478, &__block_literal_global_90_3);
  }
  if (_MergedGlobals_11_15)
  {
    v7.receiver = self;
    v7.super_class = (Class)UIDebuggingInformationOverlay;
    v3 = [(UIWindow *)&v7 init];
    v4 = v3;
    if (v3) {
      [(UIWindow *)v3 _setWindowControlsStatusBarOrientation:0];
    }
    self = v4;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isFullscreen
{
  v2 = [(UIDebuggingInformationOverlay *)self overlayViewController];
  char v3 = [v2 isFullscreen];

  return v3;
}

+ (void)prepareDebuggingOverlay
{
  if (_UIGetDebuggingOverlayEnabled())
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v2 = (id)[v3 addObserverForName:@"UIApplicationProtectedDataWillBecomeUnavailable" object:0 queue:0 usingBlock:&__block_literal_global_88_1];
  }
}

void __56__UIDebuggingInformationOverlay_prepareDebuggingOverlay__block_invoke()
{
  id v0 = +[UIDebuggingInformationOverlay overlay];
  [v0 _setHidden:1];
}

+ (id)overlay
{
  if (qword_1EB25D488 != -1) {
    dispatch_once(&qword_1EB25D488, &__block_literal_global_93_2);
  }
  id v2 = (void *)qword_1EB25D480;
  return v2;
}

uint64_t __40__UIDebuggingInformationOverlay_overlay__block_invoke()
{
  id v0 = objc_alloc_init(UIDebuggingInformationOverlay);
  v1 = (void *)qword_1EB25D480;
  qword_1EB25D480 = (uint64_t)v0;

  id v2 = (void *)qword_1EB25D480;
  id v3 = objc_alloc_init(UIDebuggingInformationOverlayViewController);
  [v2 setRootViewController:v3];

  v4 = (void *)qword_1EB25D480;
  return [v4 setHidden:1];
}

- (void)_setHidden:(BOOL)a3
{
  [(UIView *)self frame];
  double v6 = v5;
  objc_super v7 = [(UIDebuggingInformationOverlay *)self overlayViewController];
  v8 = [v7 containerView];
  [v8 frame];
  CGFloat v10 = v6 - v9;

  memset(&v20, 0, sizeof(v20));
  CGAffineTransformMakeTranslation(&v20, 0.0, v10);
  if (a3)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    CGAffineTransform v17 = v20;
    aBlock[2] = __44__UIDebuggingInformationOverlay__setHidden___block_invoke_2;
    aBlock[3] = &unk_1E52E7948;
    aBlock[4] = self;
    v11 = _Block_copy(aBlock);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __44__UIDebuggingInformationOverlay__setHidden___block_invoke_3;
    v15[3] = &unk_1E52DC3A0;
    v15[4] = self;
    v12 = _Block_copy(v15);
  }
  else
  {
    [(UIWindow *)self setHidden:0];
    CGAffineTransform v19 = v20;
    [(UIView *)self setTransform:&v19];
    [(UIWindow *)self makeKeyAndVisible];
    v13 = +[UIColor clearColor];
    [(UIView *)self setBackgroundColor:v13];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __44__UIDebuggingInformationOverlay__setHidden___block_invoke;
    v18[3] = &unk_1E52D9F70;
    v18[4] = self;
    v11 = _Block_copy(v18);
    v14 = +[_UIPrototypingSettingsManager sharedManager];
    [v14 synchronizeStoredSettings];

    v12 = 0;
  }
  +[UIView animateWithDuration:v11 animations:v12 completion:0.2];
}

uint64_t __44__UIDebuggingInformationOverlay__setHidden___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

uint64_t __44__UIDebuggingInformationOverlay__setHidden___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

uint64_t __44__UIDebuggingInformationOverlay__setHidden___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:1];
  long long v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v2 setTransform:v5];
}

- (void)toggleVisibility
{
  long long v3 = [(UIDebuggingInformationOverlay *)self inspectedWindow];

  if (!v3)
  {
    v4 = +[UIWindow _applicationKeyWindow];
    [(UIDebuggingInformationOverlay *)self setInspectedWindow:v4];
  }
  uint64_t v5 = [(UIView *)self isHidden] ^ 1;
  [(UIDebuggingInformationOverlay *)self _setHidden:v5];
}

- (void)toggleFullscreen
{
  id v2 = [(UIDebuggingInformationOverlay *)self overlayViewController];
  [v2 toggleFullscreen];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = [(UIDebuggingInformationOverlay *)self overlayViewController];
  double v9 = [v8 containerView];
  [v9 frame];
  v32.double x = x;
  v32.double y = y;
  BOOL v10 = CGRectContainsPoint(v33, v32);

  if (v10)
  {
    v28.receiver = self;
    v28.super_class = (Class)UIDebuggingInformationOverlay;
    -[UIView hitTest:withEvent:](&v28, sel_hitTest_withEvent_, v7, x, y, v23.receiver, v23.super_class);
LABEL_3:
    v11 = (UIDebuggingInformationOverlay *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if ([(UIDebuggingInformationOverlay *)self checkingTouches]
    || ([(UIDebuggingInformationOverlay *)self lastTouch],
        id v12 = (id)objc_claimAutoreleasedReturnValue(),
        v12,
        v12 == v7))
  {
    v13 = [(UIDebuggingInformationOverlay *)self inspectedWindow];
    v14 = objc_msgSend(v13, "hitTest:withEvent:", v7, x, y);

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v15 = [(UIDebuggingInformationOverlay *)self touchObservers];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * i) didReceiveNewView:v14];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v17);
    }

    [(UIDebuggingInformationOverlay *)self setCheckingTouches:0];
    id v20 = [(UIDebuggingInformationOverlay *)self lastTouch];

    if (v20 == v7) {
      id v21 = 0;
    }
    else {
      id v21 = v7;
    }
    [(UIDebuggingInformationOverlay *)self setLastTouch:v21];
    v11 = self;
  }
  else
  {
    if ([(UIDebuggingInformationOverlay *)self touchCaptureEnabled])
    {
      -[UIView hitTest:withEvent:](&v23, sel_hitTest_withEvent_, v7, x, y, self, UIDebuggingInformationOverlay);
      goto LABEL_3;
    }
    v11 = 0;
  }
LABEL_19:

  return v11;
}

- (UIDebuggingInformationOverlay)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIDebuggingInformationOverlay;
  long long v3 = -[UIWindow initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    touchObservers = v3->_touchObservers;
    v3->_touchObservers = (NSMutableArray *)v4;

    [(UIWindow *)v3 setWindowLevel:2200.0];
  }
  return v3;
}

- (UIDebuggingInformationRootTableViewController)rootTableViewController
{
  id v2 = [(UIDebuggingInformationOverlay *)self overlayViewController];
  long long v3 = [v2 rootTableViewController];

  return (UIDebuggingInformationRootTableViewController *)v3;
}

- (void)setRootTableViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(UIDebuggingInformationOverlay *)self overlayViewController];
  [v5 setRootTableViewController:v4];
}

- (void)setIsFullscreen:(BOOL)a3
{
  self->_isFullscreen = a3;
}

- (BOOL)checkingTouches
{
  return self->_checkingTouches;
}

- (void)setCheckingTouches:(BOOL)a3
{
  self->_checkingTouches = a3;
}

- (BOOL)touchCaptureEnabled
{
  return self->_touchCaptureEnabled;
}

- (void)setTouchCaptureEnabled:(BOOL)a3
{
  self->_touchCaptureEnabled = a3;
}

- (NSMutableArray)touchObservers
{
  return self->_touchObservers;
}

- (void)setTouchObservers:(id)a3
{
}

- (UIWindow)inspectedWindow
{
  return self->_inspectedWindow;
}

- (void)setInspectedWindow:(id)a3
{
}

- (UIEvent)lastTouch
{
  return self->_lastTouch;
}

- (void)setLastTouch:(id)a3
{
}

- (CGPoint)drawingOrigin
{
  double x = self->_drawingOrigin.x;
  double y = self->_drawingOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setDrawingOrigin:(CGPoint)a3
{
  self->_drawingOrigin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTouch, 0);
  objc_storeStrong((id *)&self->_inspectedWindow, 0);
  objc_storeStrong((id *)&self->_touchObservers, 0);
}

@end