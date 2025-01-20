@interface NURenderView
- (BOOL)debugMode;
- (BOOL)inLiveResize;
- (CGRect)convertRectToImage:(CGRect)a3;
- (NUImageGeometry)geometry;
- (NURenderView)initWithCoder:(id)a3;
- (NURenderView)initWithFrame:(CGRect)a3;
- (id)_backfillLayer;
- (id)_containerLayer;
- (id)_roiLayer;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)layoutSubviews;
- (void)renderFrameReachedTargetSize;
- (void)setDebugMode:(BOOL)a3;
- (void)setGeometry:(id)a3;
- (void)transitionToSize:(CGSize)a3 duration:(double)a4 animationCurve:(id)a5 completion:(id)a6;
- (void)transitionToSize:(CGSize)a3 offset:(CGPoint)a4 duration:(double)a5 animationCurve:(id)a6 completion:(id)a7;
- (void)willMoveToWindow:(id)a3;
@end

@implementation NURenderView

- (NUImageGeometry)geometry
{
  return self->_geometry;
}

- (id)_containerLayer
{
  return self->_containerLayer;
}

- (id)_roiLayer
{
  return self->_roiLayer;
}

- (id)_backfillLayer
{
  return self->_backfillLayer;
}

- (void)setGeometry:(id)a3
{
  id v4 = a3;
  v5 = [(NURenderView *)self geometry];
  [v4 size];
  [v5 size];
  if ((NUPixelSizeEqualToSize() & 1) == 0)
  {
    [v4 size];
    NUPixelSizeToCGSize();
    double v7 = v6;
    double v9 = v8;
    v10 = [(NURenderView *)self window];
    v11 = [v10 screen];

    double v12 = 1.0;
    if (v11) {
      objc_msgSend(v11, "scale", 1.0);
    }
    double v13 = 1.0 / v12;
    CGFloat v14 = v7 * v13;
    CGFloat v15 = v9 * v13;
    -[NURenderView setBounds:](self, "setBounds:", 0.0, 0.0, v14, v15);
    memset(&v17[1], 0, sizeof(CGAffineTransform));
    [(NURenderView *)self transform];
    v17[0] = v17[1];
    v18.origin.x = 0.0;
    v18.origin.y = 0.0;
    v18.size.width = v14;
    v18.size.height = v15;
    CGRect v19 = CGRectApplyAffineTransform(v18, v17);
    -[NURenderView setFrame:](self, "setFrame:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
  }
  geometry = self->_geometry;
  self->_geometry = (NUImageGeometry *)v4;
}

- (void)transitionToSize:(CGSize)a3 offset:(CGPoint)a4 duration:(double)a5 animationCurve:(id)a6 completion:(id)a7
{
  double y = a4.y;
  double x = a4.x;
  id v12 = a6;
  double v13 = (void (**)(void))a7;
  [(NURenderView *)self frame];
  NUPixelSizeFromCGSize();
  NUPixelSizeFromCGSize();
  long long v14 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  *(_OWORD *)&v31.m31 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  *(_OWORD *)&v31.m33 = v14;
  long long v15 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  *(_OWORD *)&v31.m41 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  *(_OWORD *)&v31.m43 = v15;
  long long v16 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  *(_OWORD *)&v31.m11 = *MEMORY[0x263F15740];
  *(_OWORD *)&v31.m13 = v16;
  long long v17 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  *(_OWORD *)&v31.m21 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  *(_OWORD *)&v31.m23 = v17;
  if ((NUPixelSizeIsEmpty() & 1) == 0 && (NUPixelSizeIsEmpty() & 1) == 0)
  {
    NUScaleToFitSizeInSize();
    NUScaleToDouble();
    CGFloat v19 = v18;
    [(NURenderView *)self transform];
    double v20 = 1.0;
    if (v30 != 0.0)
    {
      [(NURenderView *)self transform];
      double v20 = v29;
    }
    CATransform3DMakeTranslation(&v31, x * (1.0 / v20), y * (1.0 / v20), 0.0);
    CATransform3D v27 = v31;
    CATransform3DScale(&v28, &v27, v19, v19, 1.0);
    CATransform3D v31 = v28;
  }
  if (a5 <= 0.0)
  {
    [(CALayer *)self->_geometryAnimationLayer removeAllAnimations];
    CATransform3D v24 = v31;
    [(CALayer *)self->_geometryAnimationLayer setSublayerTransform:&v24];
    if (v13) {
      v13[2](v13);
    }
  }
  else
  {
    v21 = [MEMORY[0x263F15760] animationWithKeyPath:@"sublayerTransform"];
    [v21 setDuration:a5];
    [v21 setTimingFunction:v12];
    CATransform3D v28 = v31;
    v22 = [MEMORY[0x263F08D40] valueWithCATransform3D:&v28];
    [v21 setToValue:v22];

    [v21 setRemovedOnCompletion:0];
    [v21 setFillMode:*MEMORY[0x263F15AB0]];
    [v21 setDelegate:self];
    [MEMORY[0x263F158F8] begin];
    v23 = (void *)MEMORY[0x263F158F8];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __75__NURenderView_transitionToSize_offset_duration_animationCurve_completion___block_invoke;
    v25[3] = &unk_2642C3238;
    v26 = v13;
    [v23 setCompletionBlock:v25];
    [(CALayer *)self->_geometryAnimationLayer addAnimation:v21 forKey:@"NUTransitionAnimationKey"];
    [MEMORY[0x263F158F8] commit];
  }
}

- (NURenderView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NURenderView;
  v3 = -[NURenderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    _NUViewCommonInit(v3);
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometryAnimationLayer, 0);
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_containerLayer, 0);
  objc_storeStrong((id *)&self->_roiLayer, 0);

  objc_storeStrong((id *)&self->_backfillLayer, 0);
}

- (void)setDebugMode:(BOOL)a3
{
  self->_debugMode = a3;
}

- (BOOL)debugMode
{
  return self->_debugMode;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  geometryAnimationLayer = self->_geometryAnimationLayer;
  id v7 = a3;
  double v8 = [(CALayer *)geometryAnimationLayer animationForKey:@"NUTransitionAnimationKey"];
  int v9 = [v8 isEqual:v7];

  if (v9)
  {
    v10 = (void *)MEMORY[0x263F586F0];
    if (*MEMORY[0x263F586F0] != -1) {
      dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_589);
    }
    v11 = (os_log_t *)MEMORY[0x263F58700];
    id v12 = *MEMORY[0x263F58700];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEBUG))
    {
      BOOL shouldRemoveAnimation = self->_shouldRemoveAnimation;
      v17[0] = 67109376;
      v17[1] = v4;
      __int16 v18 = 1024;
      BOOL v19 = shouldRemoveAnimation;
      _os_log_debug_impl(&dword_217C0A000, v12, OS_LOG_TYPE_DEBUG, "-[NURenderView animationDidStop:finished:] - finished: %d shouldRemoveAnimation: %d", (uint8_t *)v17, 0xEu);
    }
    self->_transitionAnimationInFlight = 0;
    if (self->_shouldRemoveAnimation && v4)
    {
      long long v14 = [(CALayer *)self->_geometryAnimationLayer animationForKey:@"NUTransitionAnimationKey"];

      if (v14)
      {
        if (*v10 != -1) {
          dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_589);
        }
        long long v15 = *v11;
        if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v17[0]) = 0;
          _os_log_debug_impl(&dword_217C0A000, v15, OS_LOG_TYPE_DEBUG, "-[NURenderView animationDidStop:finished:] - removing transition", (uint8_t *)v17, 2u);
        }
        [(CALayer *)self->_geometryAnimationLayer removeAnimationForKey:@"NUTransitionAnimationKey"];
      }
    }
  }
}

- (void)animationDidStart:(id)a3
{
  geometryAnimationLayer = self->_geometryAnimationLayer;
  id v5 = a3;
  objc_super v6 = [(CALayer *)geometryAnimationLayer animationForKey:@"NUTransitionAnimationKey"];
  int v7 = [v6 isEqual:v5];

  if (v7)
  {
    self->_transitionAnimationInFlight = 1;
    self->_BOOL shouldRemoveAnimation = 0;
  }
}

uint64_t __75__NURenderView_transitionToSize_offset_duration_animationCurve_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)transitionToSize:(CGSize)a3 duration:(double)a4 animationCurve:(id)a5 completion:(id)a6
{
  double height = a3.height;
  double width = a3.width;
  id v11 = a6;
  id v14 = a5;
  [(NURenderView *)self frame];
  -[NURenderView transitionToSize:offset:duration:animationCurve:completion:](self, "transitionToSize:offset:duration:animationCurve:completion:", v14, v11, width, height, (v12 - width) * -0.5, (v13 - height) * -0.5, a4);
}

- (void)willMoveToWindow:(id)a3
{
  BOOL v4 = [a3 screen];
  id v5 = v4;
  if (v4)
  {
    [v4 scale];
    double v7 = v6;
  }
  else
  {
    double v8 = [MEMORY[0x263F1C920] mainScreen];
    [v8 scale];
    double v7 = v9;
  }
  memset(&v12, 0, sizeof(v12));
  CATransform3DMakeScale(&v12, 1.0 / v7, 1.0 / v7, 1.0);
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  containerLayer = self->_containerLayer;
  CATransform3D v11 = v12;
  [(_NUContainerLayer *)containerLayer setTransform:&v11];
  [MEMORY[0x263F158F8] commit];
}

- (CGRect)convertRectToImage:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(NURenderView *)self layer];
  objc_msgSend(v8, "convertRect:toLayer:", self->_containerLayer, x, y, width, height);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (void)renderFrameReachedTargetSize
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  [(NURenderView *)self frame];
  NUPixelSizeFromCGSize();
  geometryAnimationLayer = self->_geometryAnimationLayer;
  if (geometryAnimationLayer) {
    [(CALayer *)geometryAnimationLayer sublayerTransform];
  }
  else {
    memset(&v20, 0, sizeof(v20));
  }
  BOOL v4 = CATransform3DIsIdentity(&v20);
  id v5 = [(CALayer *)self->_geometryAnimationLayer animationForKey:@"NUTransitionAnimationKey"];

  double v6 = (void *)MEMORY[0x263F586F0];
  if (*MEMORY[0x263F586F0] != -1) {
    dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_589);
  }
  double v7 = (os_log_t *)MEMORY[0x263F58700];
  double v8 = (void *)*MEMORY[0x263F58700];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F58700], OS_LOG_TYPE_DEBUG))
  {
    BOOL transitionAnimationInFlight = self->_transitionAnimationInFlight;
    double v10 = v8;
    double v11 = NSStringFromNUPixelSize();
    *(_DWORD *)buf = 67109890;
    BOOL v22 = transitionAnimationInFlight;
    __int16 v23 = 1024;
    BOOL v24 = v5 != 0;
    __int16 v25 = 1024;
    int v26 = !v4;
    __int16 v27 = 2112;
    CATransform3D v28 = v11;
    _os_log_debug_impl(&dword_217C0A000, v10, OS_LOG_TYPE_DEBUG, "-[NURenderView renderFrameReachedTargetSize] - transitionInFlight: %d   has animation: %d   hasSublayerTransform: %d   currentSize: %@", buf, 0x1Eu);

    if (v4)
    {
LABEL_8:
      if (!v5) {
        return;
      }
      goto LABEL_16;
    }
  }
  else if (v4)
  {
    goto LABEL_8;
  }
  if (*v6 != -1) {
    dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_589);
  }
  double v12 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_217C0A000, v12, OS_LOG_TYPE_DEBUG, "-[NURenderView renderFrameReachedTargetSize] - removing sublayer transform", buf, 2u);
  }
  double v13 = self->_geometryAnimationLayer;
  long long v14 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  v19[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  v19[5] = v14;
  long long v15 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  v19[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  v19[7] = v15;
  long long v16 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  v19[0] = *MEMORY[0x263F15740];
  v19[1] = v16;
  long long v17 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  v19[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  v19[3] = v17;
  [(CALayer *)v13 setSublayerTransform:v19];
  if (v5)
  {
LABEL_16:
    if (self->_transitionAnimationInFlight)
    {
      self->_BOOL shouldRemoveAnimation = 1;
    }
    else
    {
      if (*v6 != -1) {
        dispatch_once(MEMORY[0x263F586F0], &__block_literal_global_589);
      }
      double v18 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_217C0A000, v18, OS_LOG_TYPE_DEBUG, "-[NURenderView renderFrameReachedTargetSize] - removing transition", buf, 2u);
      }
      [(CALayer *)self->_geometryAnimationLayer removeAnimationForKey:@"NUTransitionAnimationKey"];
    }
  }
}

- (void)layoutSubviews
{
  v3 = [(NURenderView *)self window];

  if (v3)
  {
    [(NURenderView *)self bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    -[_NUContainerLayer setFrame:](self->_containerLayer, "setFrame:", v5, v7, v9, v11);
    double v12 = (void *)MEMORY[0x263F158F8];
    [v12 commit];
  }
}

- (BOOL)inLiveResize
{
  return 0;
}

- (NURenderView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NURenderView;
  v3 = [(NURenderView *)&v6 initWithCoder:a3];
  double v4 = v3;
  if (v3) {
    _NUViewCommonInit(v3);
  }
  return v4;
}

@end