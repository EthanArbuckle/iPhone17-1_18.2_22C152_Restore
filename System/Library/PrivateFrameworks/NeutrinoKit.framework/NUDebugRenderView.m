@interface NUDebugRenderView
- (BOOL)debugMode;
- (NUDebugRenderView)initWithFrame:(CGRect)a3;
- (void)_debugToggle:(id)a3;
- (void)_orientWithX:(double)a3 andY:(double)a4;
- (void)_resetOrientation:(id)a3;
- (void)_setupDeviceMotion;
- (void)_startDeviceMotion;
- (void)_stopDeviceMotion;
- (void)dealloc;
- (void)setBounds:(CGRect)a3;
- (void)setDebugMode:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation NUDebugRenderView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionManager, 0);

  objc_storeStrong((id *)&self->_doubleTap, 0);
}

- (void)_setupDeviceMotion
{
  if ([(CMMotionManager *)self->_motionManager isDeviceMotionAvailable])
  {
    [(CMMotionManager *)self->_motionManager setDeviceMotionUpdateInterval:0.0166666667];
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    v10[3] = 0;
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    v9[3] = 0;
    objc_initWeak(&location, self);
    motionManager = self->_motionManager;
    v4 = [MEMORY[0x263F08A48] mainQueue];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __39__NUDebugRenderView__setupDeviceMotion__block_invoke;
    v5[3] = &unk_2642C3260;
    v5[4] = v10;
    v5[5] = v9;
    objc_copyWeak(&v6, &location);
    long long v7 = xmmword_217C252F0;
    [(CMMotionManager *)motionManager startDeviceMotionUpdatesUsingReferenceFrame:2 toQueue:v4 withHandler:v5];

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
    _Block_object_dispose(v9, 8);
    _Block_object_dispose(v10, 8);
  }
}

void __39__NUDebugRenderView__setupDeviceMotion__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3)
  {
    [a2 rotationRate];
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24)
                                                                - v5 * 0.1;
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24)
                                                                + v6 * 0.1;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _orientWithX:*(double *)(a1 + 56) + *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) andY:*(double *)(a1 + 64) + *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  }
}

- (void)_stopDeviceMotion
{
  [(CMMotionManager *)self->_motionManager stopDeviceMotionUpdates];
  motionManager = self->_motionManager;
  self->_motionManager = 0;
}

- (void)_startDeviceMotion
{
  uint64_t v3 = (CMMotionManager *)objc_alloc_init(MEMORY[0x263F01788]);
  motionManager = self->_motionManager;
  self->_motionManager = v3;

  [(CMMotionManager *)self->_motionManager setShowsDeviceMovementDisplay:1];
  double v5 = self->_motionManager;

  [(CMMotionManager *)v5 setDeviceMotionUpdateInterval:0.0166666667];
}

- (void)_resetOrientation:(id)a3
{
  objc_msgSend(MEMORY[0x263F158F8], "begin", a3);
  [MEMORY[0x263F158F8] setAnimationDuration:0.25];
  v4 = (void *)MEMORY[0x263F158F8];
  double v5 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  [v4 setAnimationTimingFunction:v5];

  double v6 = [(NURenderView *)self _containerLayer];
  long long v7 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  v11[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  v11[5] = v7;
  long long v8 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  v11[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  v11[7] = v8;
  long long v9 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  v11[0] = *MEMORY[0x263F15740];
  v11[1] = v9;
  long long v10 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  v11[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  v11[3] = v10;
  [v6 setSublayerTransform:v11];

  [MEMORY[0x263F158F8] commit];
}

- (void)_orientWithX:(double)a3 andY:(double)a4
{
  [(NUDebugRenderView *)self bounds];
  double Width = CGRectGetWidth(v28);
  [(NUDebugRenderView *)self bounds];
  double Height = CGRectGetHeight(v29);
  if (Width >= Height) {
    double Height = Width;
  }
  double v9 = -1.0 / Height;
  [(NUDebugRenderView *)self bounds];
  double v10 = CGRectGetWidth(v30);
  [(NUDebugRenderView *)self bounds];
  double v11 = CGRectGetHeight(v31);
  if (v10 >= v11) {
    double v11 = v10;
  }
  long long v12 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  *(_OWORD *)&v18.m21 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  *(_OWORD *)&v18.m23 = v12;
  *(_OWORD *)&v18.m31 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  v18.CGFloat m33 = *(CGFloat *)(MEMORY[0x263F15740] + 80);
  long long v13 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  *(_OWORD *)&v18.m11 = *MEMORY[0x263F15740];
  *(_OWORD *)&v18.m13 = v13;
  v18.CGFloat m34 = v9;
  long long v14 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  *(_OWORD *)&v18.m41 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  *(_OWORD *)&v18.m43 = v14;
  CATransform3DTranslate(&v19, &v18, 0.0, 0.0, -v11);
  long long v24 = *(_OWORD *)&v19.m21;
  long long v25 = *(_OWORD *)&v19.m23;
  long long v26 = *(_OWORD *)&v19.m31;
  CGFloat m33 = v19.m33;
  long long v22 = *(_OWORD *)&v19.m11;
  long long v23 = *(_OWORD *)&v19.m13;
  long long v20 = *(_OWORD *)&v19.m41;
  long long v21 = *(_OWORD *)&v19.m43;
  CATransform3D v18 = v19;
  CATransform3DRotate(&v19, &v18, a3, 0.0, 1.0, 0.0);
  long long v24 = *(_OWORD *)&v19.m21;
  long long v25 = *(_OWORD *)&v19.m23;
  long long v26 = *(_OWORD *)&v19.m31;
  CGFloat m33 = v19.m33;
  long long v22 = *(_OWORD *)&v19.m11;
  long long v23 = *(_OWORD *)&v19.m13;
  long long v20 = *(_OWORD *)&v19.m41;
  long long v21 = *(_OWORD *)&v19.m43;
  CATransform3D v18 = v19;
  CATransform3DRotate(&v19, &v18, a4, 1.0, 0.0, 0.0);
  long long v24 = *(_OWORD *)&v19.m21;
  long long v25 = *(_OWORD *)&v19.m23;
  long long v26 = *(_OWORD *)&v19.m31;
  CGFloat m33 = v19.m33;
  long long v22 = *(_OWORD *)&v19.m11;
  long long v23 = *(_OWORD *)&v19.m13;
  CGFloat m34 = v19.m34;
  long long v20 = *(_OWORD *)&v19.m41;
  long long v21 = *(_OWORD *)&v19.m43;
  v16 = [(NURenderView *)self _roiLayer];
  [v16 setZPosition:200.0];

  v17 = [(NURenderView *)self _containerLayer];
  *(_OWORD *)&v19.m21 = v24;
  *(_OWORD *)&v19.m23 = v25;
  *(_OWORD *)&v19.m31 = v26;
  v19.CGFloat m33 = m33;
  *(_OWORD *)&v19.m11 = v22;
  *(_OWORD *)&v19.m13 = v23;
  v19.CGFloat m34 = m34;
  *(_OWORD *)&v19.m41 = v20;
  *(_OWORD *)&v19.m43 = v21;
  [v17 setSublayerTransform:&v19];
}

- (void)_debugToggle:(id)a3
{
  BOOL showDebug = self->_showDebug;
  if ([a3 state] == 1)
  {
    [(NUDebugRenderView *)self setDebugMode:!showDebug];
  }
}

- (BOOL)debugMode
{
  return self->_showDebug;
}

- (void)setDebugMode:(BOOL)a3
{
  if (self->_showDebug != a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)NUDebugRenderView;
    -[NURenderView setDebugMode:](&v8, sel_setDebugMode_);
    self->_BOOL showDebug = a3;
    double v5 = [(NURenderView *)self _roiLayer];
    double v6 = v5;
    if (self->_showDebug)
    {
      [v5 setBorderWidth:2.0];
      id v7 = [MEMORY[0x263F1C550] whiteColor];
      objc_msgSend(v6, "setBorderColor:", objc_msgSend(v7, "CGColor"));

      [(NUDebugRenderView *)self _startDeviceMotion];
      [(NUDebugRenderView *)self _setupDeviceMotion];
    }
    else
    {
      [(NUDebugRenderView *)self _stopDeviceMotion];
      [v6 setBorderWidth:0.0];
      [(NUDebugRenderView *)self _resetOrientation:0];
    }
  }
}

- (void)dealloc
{
  [(NUDebugRenderView *)self _stopDeviceMotion];
  v3.receiver = self;
  v3.super_class = (Class)NUDebugRenderView;
  [(NUDebugRenderView *)&v3 dealloc];
}

- (void)setFrame:(CGRect)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NUDebugRenderView;
  -[NUDebugRenderView setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setBounds:(CGRect)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NUDebugRenderView;
  -[NUDebugRenderView setBounds:](&v3, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NUDebugRenderView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NUDebugRenderView;
  objc_super v3 = -[NURenderView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:v3 action:sel__debugToggle_];
    doubleTap = v3->_doubleTap;
    v3->_doubleTap = (UILongPressGestureRecognizer *)v4;

    [(UILongPressGestureRecognizer *)v3->_doubleTap setNumberOfTouchesRequired:3];
    [(NUDebugRenderView *)v3 addGestureRecognizer:v3->_doubleTap];
    if ([MEMORY[0x263F58620] isViewDebugEnabled])
    {
      v8.receiver = v3;
      v8.super_class = (Class)NUDebugRenderView;
      [(NURenderView *)&v8 setDebugMode:1];
    }
    double v6 = v3;
  }

  return v3;
}

@end