@interface RCDebugOverlay
- (BOOL)observingUserDefaults;
- (CATextLayer)overlayLayer;
- (RCDebugOverlay)initWithParentView:(id)a3 shouldObserveChanges:(BOOL)a4;
- (UIView)parentView;
- (void)_createOverlayLayerIfNeeded;
- (void)_removeOverlayLayerIfNeeded;
- (void)addToParentView;
- (void)dealloc;
- (void)needsUpdateForBoundsChange;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeFromParentView;
- (void)setObservingUserDefaults:(BOOL)a3;
- (void)setOverlayLayer:(id)a3;
- (void)setParentView:(id)a3;
- (void)updateOverlayLayerStringWithPresentationTime:(id)a3 presentationInterval:(id)a4 elapsedRecordingTime:(double)a5;
@end

@implementation RCDebugOverlay

- (RCDebugOverlay)initWithParentView:(id)a3 shouldObserveChanges:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RCDebugOverlay;
  v7 = [(RCDebugOverlay *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_parentView, v6);
    [(RCDebugOverlay *)v8 _createOverlayLayerIfNeeded];
    int v9 = RCIsInternalInstall();
    v8->_observingUserDefaults = v9 & v4;
    if ((v9 & v4) == 1)
    {
      v10 = +[NSUserDefaults standardUserDefaults];
      [v10 addObserver:v8 forKeyPath:RCDebugAODOverlay options:1 context:RCDebugAODOverlay];
    }
  }

  return v8;
}

- (void)_createOverlayLayerIfNeeded
{
  if (!self->_overlayLayer)
  {
    v3 = (CATextLayer *)objc_alloc_init((Class)CATextLayer);
    overlayLayer = self->_overlayLayer;
    self->_overlayLayer = v3;
    v11 = v3;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
    [WeakRetained bounds];
    -[CATextLayer setBounds:](v11, "setBounds:");

    id v6 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    -[CATextLayer setForegroundColor:](v11, "setForegroundColor:", [v6 CGColor]);

    id v7 = +[UIColor colorWithRed:0.9 green:0.0 blue:0.9 alpha:0.7];
    -[CATextLayer setBackgroundColor:](v11, "setBackgroundColor:", [v7 CGColor]);

    [(CATextLayer *)v11 setFontSize:16.0];
    v8 = +[UIScreen mainScreen];
    [v8 scale];
    double v10 = v9;

    [(CATextLayer *)v11 setRasterizationScale:v10];
    [(CATextLayer *)v11 setContentsScale:v10];
    [(CATextLayer *)v11 setAlignmentMode:kCAAlignmentCenter];
    [(CATextLayer *)v11 setWrapped:1];
  }
}

- (void)dealloc
{
  if (self->_observingUserDefaults)
  {
    v3 = +[NSUserDefaults standardUserDefaults];
    [v3 removeObserver:self forKeyPath:RCDebugAODOverlay];
  }
  v4.receiver = self;
  v4.super_class = (Class)RCDebugOverlay;
  [(RCDebugOverlay *)&v4 dealloc];
}

- (void)addToParentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
  v3 = [WeakRetained layer];
  [v3 addSublayer:self->_overlayLayer];
}

- (void)removeFromParentView
{
  overlayLayer = self->_overlayLayer;
  if (overlayLayer)
  {
    [(CATextLayer *)overlayLayer removeFromSuperlayer];
    objc_super v4 = self->_overlayLayer;
    [(CATextLayer *)v4 setString:0];
  }
}

- (void)_removeOverlayLayerIfNeeded
{
  overlayLayer = self->_overlayLayer;
  if (overlayLayer)
  {
    [(CATextLayer *)overlayLayer removeFromSuperlayer];
    objc_super v4 = self->_overlayLayer;
    self->_overlayLayer = 0;
  }
}

- (void)updateOverlayLayerStringWithPresentationTime:(id)a3 presentationInterval:(id)a4 elapsedRecordingTime:(double)a5
{
  id v7 = a4;
  id v8 = a3;
  +[CATransaction begin];
  +[CATransaction setValue:kCFBooleanTrue forKey:kCATransactionDisableActions];
  double v9 = [v8 bls_shortLoggingString];

  double v10 = [v7 bls_shortLoggingString];

  v11 = RCDebugStringForTimeInterval();
  objc_super v12 = +[NSString stringWithFormat:@"Presentation time: %@\rPresentation interval: %@\rElapsed time: %@", v9, v10, v11];
  [(CATextLayer *)self->_overlayLayer setString:v12];

  [(CATextLayer *)self->_overlayLayer displayIfNeeded];

  +[CATransaction commit];
}

- (void)needsUpdateForBoundsChange
{
  v3 = [(RCDebugOverlay *)self parentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  objc_super v12 = [(RCDebugOverlay *)self parentView];
  [v12 safeAreaInsets];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v5 + v16;
  double v22 = v7 + v14;
  double v23 = v9 - (v16 + v20);
  double v24 = v11 - v18;
  [(CATextLayer *)self->_overlayLayer frame];
  v31.origin.x = v25;
  v31.origin.y = v26;
  v31.size.width = v27;
  v31.size.height = v28;
  v30.origin.x = v21;
  v30.origin.y = v22;
  v30.size.width = v23;
  v30.size.height = v24;
  if (!CGRectEqualToRect(v30, v31))
  {
    +[CATransaction begin];
    +[CATransaction setValue:kCFBooleanTrue forKey:kCATransactionDisableActions];
    -[CATextLayer setFrame:](self->_overlayLayer, "setFrame:", v21, v22, v23, v24);
    +[CATransaction commit];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  if ((void *)RCDebugAODOverlay == a6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v10 BOOLForKey:a6])
      {
        [(RCDebugOverlay *)self _createOverlayLayerIfNeeded];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
        objc_super v12 = [WeakRetained traitCollection];
        id v13 = [v12 activeAppearance];

        if (!v13 && RCSupportsDebugAODOverlay())
        {
          id v14 = objc_loadWeakRetained((id *)&self->_parentView);
          double v15 = [v14 layer];
          [v15 addSublayer:self->_overlayLayer];
        }
      }
      else
      {
        [(RCDebugOverlay *)self _removeOverlayLayerIfNeeded];
      }
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)RCDebugOverlay;
    [(RCDebugOverlay *)&v16 observeValueForKeyPath:a3 ofObject:v10 change:a5 context:a6];
  }
}

- (CATextLayer)overlayLayer
{
  return self->_overlayLayer;
}

- (void)setOverlayLayer:(id)a3
{
}

- (UIView)parentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);

  return (UIView *)WeakRetained;
}

- (void)setParentView:(id)a3
{
}

- (BOOL)observingUserDefaults
{
  return self->_observingUserDefaults;
}

- (void)setObservingUserDefaults:(BOOL)a3
{
  self->_observingUserDefaults = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentView);

  objc_storeStrong((id *)&self->_overlayLayer, 0);
}

@end