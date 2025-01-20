@interface NUNIAstronomyVistaView
- (BOOL)pauseAnimationWhenNoUpdate;
- (CLKDevice)device;
- (NSArray)quadViews;
- (NUNIAstronomyVistaView)initWithFrame:(CGRect)a3 configuration:(id)a4;
- (NUNIAstronomyVistaViewObserver)observer;
- (NUNIScene)scene;
- (float)computeDimming;
- (float)supplementalBottomInset;
- (float)supplementalHorizontalInset;
- (float)supplementalSpheroidSize;
- (float)supplementalTopInset;
- (id)_earthLunaPanAnimationArrayFromSceneDescription:(id)a3 toSceneDescription:(id)a4;
- (id)_mtlQuadView;
- (id)_panAnimationArrayFromSceneDescription:(id)a3 toSceneDescription:(id)a4;
- (id)_zoomAnimationArrayFromSceneDescription:(id)a3 toSceneDescription:(id)a4;
- (id)contentMaskLayer;
- (id)generateAnimationArrayFromSceneDescription:(id)a3 toSceneDescription:(id)a4 transitionStyle:(unint64_t)a5;
- (id)generateAnimationArrayFromVista:(unint64_t)a3 fromSceneBlock:(id)a4 toVista:(unint64_t)a5 toSceneBlock:(id)a6 transitionStyle:(unint64_t)a7;
- (id)generateAnimationArrayFromVista:(unint64_t)a3 toVista:(unint64_t)a4 transitionStyle:(unint64_t)a5;
- (id)rotatable:(unint64_t)a3;
- (id)snapshotImage;
- (int64_t)frameInterval;
- (unint64_t)vista;
- (void)_setVista:(unint64_t)a3 scene:(id)a4;
- (void)_startAnimation;
- (void)_stopAnimation;
- (void)_updateAnimation;
- (void)dealloc;
- (void)debouncedEventHandler;
- (void)discardContents;
- (void)layoutSubviews;
- (void)purgeUnused;
- (void)quadViewWillDisplay:(id)a3 forTime:(double)a4;
- (void)removeBackBuffers;
- (void)renderOnce;
- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)setAPLFilterAmount:(double)a3;
- (void)setFrameInterval:(int64_t)a3;
- (void)setObserver:(id)a3;
- (void)setOpaque:(BOOL)a3;
- (void)setPauseAnimationWhenNoUpdate:(BOOL)a3;
- (void)setScene:(id)a3;
- (void)setSupplementalBottomInset:(float)a3;
- (void)setSupplementalHorizontalInset:(float)a3;
- (void)setSupplementalSpheroidSize:(float)a3;
- (void)setSupplementalTopInset:(float)a3;
- (void)setTritiumBrightness:(double)a3;
- (void)setVista:(unint64_t)a3;
- (void)showSupplemental:(BOOL)a3 animated:(BOOL)a4;
- (void)startAnimation;
- (void)stopAnimation;
- (void)universeAnimationFinished:(id)a3;
- (void)updateSunLocationAnimated:(BOOL)a3;
- (void)updateSunLocationForDate:(id)a3;
@end

@implementation NUNIAstronomyVistaView

- (NUNIAstronomyVistaView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v45[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  NSLog(&cfstr_Nuniastronomyv.isa);
  v41.receiver = self;
  v41.super_class = (Class)NUNIAstronomyVistaView;
  v11 = -[NUNIAstronomyVistaView initWithFrame:](&v41, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    *((unsigned char *)v11 + 496) |= 0x10u;
    objc_storeStrong((id *)&v11->_configuration, a4);
    uint64_t v13 = [v10 device];
    device = v12->_device;
    v12->_device = (CLKDevice *)v13;

    uint64_t v15 = +[CLKUIQuadView quadViewWithFrame:identifier:options:colorSpace:](CLKUIQuadView, "quadViewWithFrame:identifier:options:colorSpace:", @"NUV0", [v10 quadViewOptions], objc_msgSend(v10, "colorSpace"), x, y, width, height);
    quadView0 = v12->_quadView0;
    v12->_quadView0 = (CLKUIQuadView *)v15;

    v17 = [(NUNIAstronomyVistaView *)v12 _mtlQuadView];
    [v10 maxAPL];
    objc_msgSend(v17, "setMaxAPL:");
    [(NUNIAstronomyVistaView *)v12 addSubview:v12->_quadView0];
    uint64_t v18 = [v10 rendererStyle];
    uint64_t v19 = [v17 colorPixelFormat];
    v20 = [v10 textureSuffix];
    uint64_t v21 = +[NUNIRenderer sharedInstanceWithPixelFormat:v19 textureSuffix:v20 rendererStyle:v18];
    renderer = v12->_renderer;
    v12->_renderer = (NUNIRenderer *)v21;

    [v10 screenScale];
    v24 = [[NUNIQuad alloc] initWithScreenScale:v12->_renderer renderer:v23];
    quad = v12->_quad;
    v12->_quad = v24;

    [(CLKUIQuadView *)v12->_quadView0 addQuad:v12->_quad];
    [(CLKUIQuadView *)v12->_quadView0 setPaused:1];
    [(CLKUIQuadView *)v12->_quadView0 setDelegate:v12];
    if (v18 == 2)
    {
      [(CLKUIQuadView *)v12->_quadView0 setOpaque:0];
      [(CLKUIQuad *)v12->_quad setOpaque:0];
      v26 = [MEMORY[0x1E4F39BE8] layer];
      contentMaskLayer = v12->_contentMaskLayer;
      v12->_contentMaskLayer = v26;

      objc_storeStrong((id *)&v12->maskLayer, v26);
      -[CALayer setFrame:](v12->maskLayer, "setFrame:", x, y, width, height);
      [(CALayer *)v12->maskLayer setCompositingFilter:*MEMORY[0x1E4F3A098]];
      [(CALayer *)v12->maskLayer setOpaque:0];
      maskLayer = v12->maskLayer;
      v44 = @"contents";
      v29 = [MEMORY[0x1E4F1CA98] null];
      v45[0] = v29;
      v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
      [(CALayer *)maskLayer setActions:v30];

      [(NUNIRenderer *)v12->_renderer setContentMaskLayer:v12->maskLayer];
      v31 = [v17 metalLayer];
      [v31 addSublayer:v12->maskLayer];

      v43 = v12->_quadView0;
      v32 = (void *)MEMORY[0x1E4F1C978];
      v33 = &v43;
    }
    else
    {
      v42 = v12->_quadView0;
      v32 = (void *)MEMORY[0x1E4F1C978];
      v33 = &v42;
    }
    uint64_t v34 = [v32 arrayWithObjects:v33 count:1];
    quadViews = v12->_quadViews;
    v12->_quadViews = (NSArray *)v34;

    v12->_vista = -1;
    uint64_t v36 = [MEMORY[0x1E4F1CA80] set];
    activeContentsAnimations = v12->_activeContentsAnimations;
    v12->_activeContentsAnimations = (NSMutableSet *)v36;

    *((unsigned char *)v12 + 496) |= 2u;
    v38 = [v10 initialSetupOperation];

    if (v38)
    {
      v39 = [v10 initialSetupOperation];
      ((void (**)(void, NUNIAstronomyVistaView *))v39)[2](v39, v12);
    }
  }

  return v12;
}

- (void)discardContents
{
  id v3 = [(NUNIAstronomyVistaView *)self _mtlQuadView];
  v2 = [v3 metalLayer];
  [v2 discardContents];
}

- (void)removeBackBuffers
{
  id v3 = [(NUNIAstronomyVistaView *)self _mtlQuadView];
  v2 = [v3 metalLayer];
  [v2 removeBackBuffers];
}

- (void)setTritiumBrightness:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = self->_quadViews;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setTritiumBrightness:", a3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)dealloc
{
  [(NUNIAstronomyVistaView *)self _stopAnimation];
  quad = self->_quad;
  self->_quad = 0;

  [(CLKUIQuadView *)self->_quadView0 removeAllQuads];
  quadView0 = self->_quadView0;
  self->_quadView0 = 0;

  uint64_t v5 = +[CLKUIResourceManager sharedInstance];
  [v5 purgeAllUnused];

  v6.receiver = self;
  v6.super_class = (Class)NUNIAstronomyVistaView;
  [(NUNIAstronomyVistaView *)&v6 dealloc];
}

- (void)purgeUnused
{
}

- (id)snapshotImage
{
  quadView0 = self->_quadView0;
  [(NUNIAstronomyVistaView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  long long v12 = [(NUNIAstronomyVistaView *)self device];
  [v12 screenScale];
  uint64_t v14 = -[CLKUIQuadView snapshotInRect:scale:time:](quadView0, "snapshotInRect:scale:time:", v5, v7, v9, v11, v13, 0.0);

  return v14;
}

- (float)computeDimming
{
  v2 = [(NUNIAstronomyVistaView *)self _mtlQuadView];
  float v3 = CLKUIComputeDimmingRequiredToObtainQuadAPL(v2, 0.021, 1.0);

  return v3;
}

- (id)_mtlQuadView
{
  return self->_quadView0;
}

- (void)setAPLFilterAmount:(double)a3
{
  id v5 = [(NUNIAstronomyVistaView *)self _mtlQuadView];
  *(float *)&double v4 = a3;
  [v5 setAplFilterAmount:v4];
}

- (NUNIScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
  id v5 = (NUNIScene *)a3;
  if (self->_scene != v5)
  {
    objc_storeStrong((id *)&self->_scene, a3);
    [(NUNIQuad *)self->_quad setScene:v5];
  }
}

- (void)setOpaque:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NUNIAstronomyVistaView;
  if ([(NUNIAstronomyVistaView *)&v8 isOpaque] != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)NUNIAstronomyVistaView;
    [(NUNIAstronomyVistaView *)&v7 setOpaque:v3];
    if (v3) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 1;
    }
    [(NUNIScene *)self->_scene setBackgroundType:v5];
    double v6 = [(NSArray *)self->_quadViews lastObject];
    [v6 setOpaque:v3];
  }
}

- (void)setFrameInterval:(int64_t)a3
{
  if (self->_frameInterval != a3)
  {
    self->_frameInterval = a3;
    uint64_t v4 = _NUNIFrameIntervalToFramesPerSecond_framePerSeconds[a3];
    if ([(CLKUIQuadView *)self->_quadView0 preferredFramesPerSecond] != v4)
    {
      quadView0 = self->_quadView0;
      [(CLKUIQuadView *)quadView0 setPreferredFramesPerSecond:v4];
    }
  }
}

- (void)updateSunLocationAnimated:(BOOL)a3
{
}

- (void)updateSunLocationForDate:(id)a3
{
  [(NUNIScene *)self->_scene updateSunLocationForDate:a3 animated:0];
  if (self->_pauseAnimationWhenNoUpdate)
  {
    [(NUNIAstronomyVistaView *)self debouncedEventHandler];
  }
}

- (void)debouncedEventHandler
{
  [(NUNIAstronomyVistaView *)self startAnimation];
  [(NSTimer *)self->_debounceTimer invalidate];
  self->_debounceTimer = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_performDebouncedAction selector:0 userInfo:0 repeats:1.0];
  MEMORY[0x1F41817F8]();
}

- (void)_startAnimation
{
  if ([(CLKUIQuadView *)self->_quadView0 isPaused])
  {
    quadView0 = self->_quadView0;
    [(CLKUIQuadView *)quadView0 setPaused:0];
  }
}

- (void)_stopAnimation
{
  if (![(CLKUIQuadView *)self->_quadView0 isPaused])
  {
    quadView0 = self->_quadView0;
    [(CLKUIQuadView *)quadView0 setPaused:1];
  }
}

- (void)startAnimation
{
  if ((*((unsigned char *)self + 496) & 8) == 0 && (*((unsigned char *)self + 496) & 4) == 0)
  {
    NSLog(&cfstr_Nuniastronomyv_0.isa, a2);
    *((unsigned char *)self + 496) |= 8u;
    objc_initWeak(&location, self);
    renderer = self->_renderer;
    uint64_t v4 = [(NUNIScene *)self->_scene spheroids];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __40__NUNIAstronomyVistaView_startAnimation__block_invoke;
    v5[3] = &unk_1E609E580;
    objc_copyWeak(&v6, &location);
    [(NUNIRenderer *)renderer prepareForRenderingSpheroids:v4 completionHandler:v5];

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __40__NUNIAstronomyVistaView_startAnimation__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[496] &= ~8u;
    WeakRetained[496] |= 4u;
    v2 = WeakRetained;
    [WeakRetained _updateAnimation];
    WeakRetained = v2;
  }
}

- (void)stopAnimation
{
  if ((*((unsigned char *)self + 496) & 4) != 0)
  {
    NSLog(&cfstr_Nuniastronomyv_1.isa, a2);
    *((unsigned char *)self + 496) &= ~4u;
    *((unsigned char *)self + 496) &= ~8u;
    [(NUNIAstronomyVistaView *)self _updateAnimation];
  }
}

- (void)_updateAnimation
{
  if ((*((unsigned char *)self + 496) & 4) != 0 && (*((unsigned char *)self + 496) & 2) != 0) {
    [(NUNIAstronomyVistaView *)self _startAnimation];
  }
  else {
    [(NUNIAstronomyVistaView *)self _stopAnimation];
  }
}

- (void)renderOnce
{
  if ((*((unsigned char *)self + 496) & 4) == 0) {
    [(NUNIAstronomyVistaView *)self startAnimation];
  }
  *((unsigned char *)self + 496) &= ~0x10u;
}

- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)NUNIAstronomyVistaView;
  [(NUNIAstronomyVistaView *)&v12 layoutSubviews];
  [(NUNIAstronomyVistaView *)self bounds];
  double v7 = v3;
  double v8 = v4;
  if (*MEMORY[0x1E4F1DB30] != v5 || *(double *)(MEMORY[0x1E4F1DB30] + 8) != v6)
  {
    double v10 = v5;
    double v11 = v6;
    -[CALayer setFrame:](self->maskLayer, "setFrame:", v3, v4);
    -[CLKUIQuadView setFrame:](self->_quadView0, "setFrame:", v7, v8, v10, v11);
  }
}

- (id)rotatable:(unint64_t)a3
{
  if (a3 <= 9 && ((0x3FBu >> a3) & 1) != 0)
  {
    double v5 = -[NUNIScene spheroidOfType:](self->_scene, "spheroidOfType:", qword_1B4855948[a3], v3);
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

- (unint64_t)vista
{
  return self->_vista;
}

- (void)showSupplemental:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  char v7 = *((unsigned char *)self + 496);
  double v8 = self->_scene;
  if (v8 && self->_vista == 2 && ((((v7 & 1) == 0) ^ v5) & 1) == 0)
  {
    while ([(NSMutableSet *)self->_activeContentsAnimations count])
    {
      double v9 = [(NSMutableSet *)self->_activeContentsAnimations anyObject];
      [(NUNIScene *)v8 removeAnimation:v9];
    }
    *((unsigned char *)self + 496) = *((unsigned char *)self + 496) & 0xFE | v5;
    v88 = v8;
    if (v5)
    {
      [(NUNIAstronomyVistaView *)self supplementalSpheroidSize];
      float v11 = v10;
      [(CLKDevice *)self->_device screenBounds];
      double v13 = v12;
      long long v98 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      id obj = [(NUNIScene *)v8 spheroids];
      uint64_t v14 = [obj countByEnumeratingWithState:&v98 objects:v103 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        v16 = 0;
        float v17 = v11 / v13;
        uint64_t v85 = *(void *)v99;
        *((float *)&v84 + 1) = v17;
        *(float *)&uint64_t v84 = v17 * 0.5;
        while (1)
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v99 != v85) {
              objc_enumerationMutation(obj);
            }
            uint64_t v19 = *(void **)(*((void *)&v98 + 1) + 8 * v18);
            uint64_t v20 = objc_msgSend(v19, "type", v84);
            int v21 = 1 << v20;
            LODWORD(v22) = 897988541;
            if (v20 != 4)
            {
              float v23 = *((float *)&v84 + 1);
              if ((v21 & 0x3000) != 0 || (float v23 = *(float *)&v84, ((1 << v20) & 0xFBFBFE) != 0))
              {
                objc_msgSend(v19, "radius", v22);
                *(float *)&double v22 = v23 / *(float *)&v22;
              }
              else
              {
                LODWORD(v22) = 1.0;
              }
            }
            double v89 = v22;
            [v19 radiusScale];
            BOOL v25 = v24 == *(float *)&v89;
            double v26 = v89;
            if (!v25)
            {
              if (v4)
              {
                v27 = [[NUNIAnimation alloc] initWithAnimatable:v19 value:6 key:*(double *)vdupq_lane_s32(*(int32x2_t *)&v89, 0).i64];

                LODWORD(v28) = 1062557008;
                [(NUNIAnimation *)v27 setDuration:v28];
                [(NUNIAnimation *)v27 setObserver:self];
                [(NUNIScene *)v88 addAnimation:v27];
                [(NSMutableSet *)self->_activeContentsAnimations addObject:v27];
                v16 = v27;
                double v8 = v88;
              }
              else
              {
                [v19 setRadiusScale:v89];
              }
            }
            if (((1 << v20) & 0xFFF000) == 0)
            {
              objc_msgSend(v19, "opacity", v26);
              if (*(float *)&v37 == 0.0) {
                goto LABEL_43;
              }
              int32x2_t v38 = 0;
              if (v4) {
                goto LABEL_40;
              }
LABEL_42:
              LODWORD(v37) = v38.i32[0];
              [v19 setOpacity:v37];
              goto LABEL_43;
            }
            if ((v21 & 0x3000) != 0) {
              unint64_t v29 = 7;
            }
            else {
              unint64_t v29 = v20 - 14;
            }
            if (v29 <= 3) {
              uint64_t v30 = 0;
            }
            else {
              uint64_t v30 = -1;
            }
            if ([(NUNIAstronomyVistaConfiguration *)self->_configuration isRTLLayout])
            {
              [(CLKDevice *)self->_device screenBounds];
              double v32 = v31;
              [(NUNIAstronomyVistaView *)self supplementalHorizontalInset];
              double v34 = v32 - v33;
              [(NUNIAstronomyVistaView *)self supplementalSpheroidSize];
              float v36 = v34 + (float)(v35 * -0.5);
            }
            else
            {
              [(NUNIAstronomyVistaView *)self supplementalHorizontalInset];
              float v40 = v39;
              [(NUNIAstronomyVistaView *)self supplementalSpheroidSize];
              float v36 = v40 + (float)(v41 * 0.5);
            }
            [(CLKDevice *)self->_device screenBounds];
            double v43 = v42;
            [(NUNIAstronomyVistaView *)self supplementalTopInset];
            double v45 = v43 - v44;
            [(NUNIAstronomyVistaView *)self supplementalBottomInset];
            double v47 = (v45 - v46) / 7.0;
            [(NUNIAstronomyVistaView *)self supplementalTopInset];
            float v49 = v48 + v47 * (double)(v29 + v30 - 1);
            [(CLKDevice *)self->_device screenBounds];
            double v51 = v50;
            [(CLKDevice *)self->_device screenBounds];
            *(float *)&double v51 = v51 / v52;
            [(CLKDevice *)self->_device screenBounds];
            double v90 = v36 / v53;
            [(CLKDevice *)self->_device screenBounds];
            v55.f64[0] = v90;
            v55.f64[1] = (v49 / v54 + -0.5) * (float)-*(float *)&v51 + 0.5;
            float32x2_t v56 = vadd_f32(vcvt_f32_f64(v55), (float32x2_t)0xBF000000BF000000);
            *(float32x2_t *)&v55.f64[0] = vmul_f32(v56, v56);
            *(float *)v55.f64 = sqrtf(vmlas_n_f32(*((float *)v55.f64 + 1), v56.f32[0], v56.f32[0]));
            double v91 = v55.f64[0];
            float32x2_t v87 = vdiv_f32(v56, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v55.f64[0], 0));
            [v19 angle];
            LODWORD(v51) = v57;
            *(float *)&double v58 = atan2f(v87.f32[1], v87.f32[0]);
            *(float *)&double v58 = *(float *)&v58 + (float)(floorf(*(float *)&v58 / 6.2832) * -6.2832);
            float v59 = vabds_f32(*(float *)&v58, *(float *)&v51);
            if (*(float *)&v51 >= *(float *)&v58) {
              float v60 = 6.2832;
            }
            else {
              float v60 = -6.2832;
            }
            BOOL v61 = v59 <= 3.1416;
            float v62 = -0.0;
            if (!v61) {
              float v62 = v60;
            }
            *(float *)&double v58 = *(float *)&v58 + v62;
            if (v4)
            {
              v63 = [[NUNIAnimation alloc] initWithAnimatable:v19 value:7 key:*(double *)vdupq_lane_s32(*(int32x2_t *)&v58, 0).i64];

              LODWORD(v64) = 1062557008;
              [(NUNIAnimation *)v63 setDuration:v64];
              [(NUNIScene *)v8 addAnimation:v63];
              v16 = [[NUNIAnimation alloc] initWithAnimatable:v19 value:4 key:*(double *)vdupq_lane_s32(*(int32x2_t *)&v91, 0).i64];

              LODWORD(v65) = 1062557008;
              [(NUNIAnimation *)v16 setDuration:v65];
              [(NUNIAnimation *)v16 setObserver:self];
              [(NUNIScene *)v8 addAnimation:v16];
              [(NSMutableSet *)self->_activeContentsAnimations addObject:v16];
              [v19 opacity];
              v38.i32[0] = 1.0;
              if (v66 == 1.0) {
                goto LABEL_43;
              }
LABEL_40:
              v67 = [[NUNIAnimation alloc] initWithAnimatable:v19 value:8 key:*(double *)vdupq_lane_s32(v38, 0).i64];

              LODWORD(v68) = 1062557008;
              [(NUNIAnimation *)v67 setDuration:v68];
              [(NUNIAnimation *)v67 setObserver:self];
              [(NUNIScene *)v8 addAnimation:v67];
              [(NSMutableSet *)self->_activeContentsAnimations addObject:v67];
              v16 = v67;
              goto LABEL_43;
            }
            [v19 setAngle:v58];
            [v19 setDistance:v91];
            [v19 opacity];
            v38.i32[0] = 1.0;
            if (*(float *)&v37 != 1.0) {
              goto LABEL_42;
            }
LABEL_43:
            ++v18;
          }
          while (v15 != v18);
          uint64_t v69 = [obj countByEnumeratingWithState:&v98 objects:v103 count:16];
          uint64_t v15 = v69;
          if (!v69) {
            goto LABEL_71;
          }
        }
      }
LABEL_70:
      v16 = 0;
      goto LABEL_71;
    }
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id obj = [(NUNIScene *)v8 spheroids];
    uint64_t v70 = [obj countByEnumeratingWithState:&v94 objects:v102 count:16];
    if (!v70) {
      goto LABEL_70;
    }
    uint64_t v71 = v70;
    v16 = 0;
    uint64_t v72 = *(void *)v95;
    do
    {
      for (uint64_t i = 0; i != v71; ++i)
      {
        if (*(void *)v95 != v72) {
          objc_enumerationMutation(obj);
        }
        v74 = *(void **)(*((void *)&v94 + 1) + 8 * i);
        int v75 = [v74 type];
        char v77 = v75;
        if (v75 == 4) {
          *(float *)&double v76 = 0.000001;
        }
        else {
          *(float *)&double v76 = 1.0;
        }
        double v92 = v76;
        [v74 radiusScale];
        if (*(float *)&v78 != *(float *)&v92)
        {
          if (v4)
          {
            v79 = [[NUNIAnimation alloc] initWithAnimatable:v74 value:6 key:*(double *)vdupq_lane_s32(*(int32x2_t *)&v92, 0).i64];

            LODWORD(v80) = 1054168400;
            [(NUNIAnimation *)v79 setDuration:v80];
            [(NUNIAnimation *)v79 setObserver:self];
            [(NUNIScene *)v88 addAnimation:v79];
            [(NSMutableSet *)self->_activeContentsAnimations addObject:v79];
            v16 = v79;
            double v8 = v88;
          }
          else
          {
            [v74 setRadiusScale:v92];
          }
        }
        if (((1 << v77) & 0xFFF400) != 0) {
          *(float *)&double v78 = 1.0;
        }
        else {
          *(float *)&double v78 = 0.0;
        }
        double v93 = v78;
        [v74 opacity];
        if (v81 != *(float *)&v93)
        {
          if (v4)
          {
            v82 = [[NUNIAnimation alloc] initWithAnimatable:v74 value:8 key:*(double *)vdupq_lane_s32(*(int32x2_t *)&v93, 0).i64];

            LODWORD(v83) = 1062557008;
            [(NUNIAnimation *)v82 setDuration:v83];
            [(NUNIAnimation *)v82 setObserver:self];
            [(NUNIScene *)v8 addAnimation:v82];
            [(NSMutableSet *)self->_activeContentsAnimations addObject:v82];
            v16 = v82;
          }
          else
          {
            [v74 setOpacity:v93];
          }
        }
      }
      uint64_t v71 = [obj countByEnumeratingWithState:&v94 objects:v102 count:16];
    }
    while (v71);
LABEL_71:
  }
}

- (id)_earthLunaPanAnimationArrayFromSceneDescription:(id)a3 toSceneDescription:(id)a4
{
  id v6 = a3;
  id v151 = a4;
  char v7 = objc_opt_new();
  double v8 = self->_scene;
  [(NUNIScene *)v8 updateSunLocationAnimated:0];
  v149 = self;
  -[NUNIAstronomyVistaView _setVista:scene:](self, "_setVista:scene:", [v6 vista], v8);
  uint64_t v9 = [v6 updateBlock];
  float v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, NUNIScene *))(v9 + 16))(v9, v8);
    [(NUNIScene *)v8 updateCamera];
  }
  v139 = v10;
  uint64_t v11 = [(NUNIScene *)v8 structure];
  float32x4_t v152 = *(float32x4_t *)(v11 + 16);
  float32x4_t v12 = *(float32x4_t *)(v11 + 32);
  float32x4_t v147 = *(float32x4_t *)v11;
  float32x4_t v148 = v12;
  v12.i32[0] = *(_DWORD *)(v11 + 52);
  int32x2_t v136 = *(int32x2_t *)v12.f32;
  double v144 = *(double *)(v11 + 96);
  double v145 = *(double *)(v11 + 104);
  v150 = v8;
  double v13 = [(NUNIScene *)v8 spheroids];
  uint64_t v14 = [v13 count];
  id v138 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:32 * v14];
  uint64_t v15 = [v138 mutableBytes];
  int v141 = [v6 isEarth];
  v140 = v6;
  int v16 = [v6 isLuna];
  if (v14)
  {
    uint64_t v17 = 0;
    if (v16) {
      float v18 = 1.0;
    }
    else {
      float v18 = 0.00001;
    }
    if (v141) {
      float v19 = 1.0;
    }
    else {
      float v19 = 0.00001;
    }
    uint64_t v20 = v15;
    do
    {
      int v21 = [v13 objectAtIndex:v17];
      uint64_t v22 = [v21 structure];
      float v23 = v19;
      if (*(void *)v22 != 3)
      {
        float v23 = *(float *)(v22 + 88);
        if (*(void *)v22 == 4) {
          float v23 = v18;
        }
      }
      *(_OWORD *)&v180[4] = *(_OWORD *)(v22 + 32);
      uint64_t v24 = *(void *)(v22 + 48);
      *(float *)uint64_t v20 = v23;
      *(void *)(v20 + 4) = v24;
      *(_DWORD *)(v20 + 28) = *(_DWORD *)&v180[16];
      *(_OWORD *)(v20 + 12) = *(_OWORD *)v180;

      ++v17;
      v20 += 32;
    }
    while (v14 != v17);
  }
  -[NUNIAstronomyVistaView _setVista:scene:](v149, "_setVista:scene:", [v151 vista], v150);
  uint64_t v25 = [v151 updateBlock];
  double v26 = (void *)v25;
  if (v25)
  {
    (*(void (**)(uint64_t, NUNIScene *))(v25 + 16))(v25, v150);
    [(NUNIScene *)v150 updateCamera];
  }
  v137 = v26;
  float32x4_t v146 = *(float32x4_t *)v11;
  float32x4_t v27 = *(float32x4_t *)v11;
  v27.i32[0] = *(_DWORD *)(v11 + 52);
  int32x2_t v135 = *(int32x2_t *)v27.f32;
  double v142 = *(double *)(v11 + 96);
  double v143 = *(double *)(v11 + 104);
  int v28 = objc_msgSend(v151, "isEarth", *(void *)(v11 + 32), *(void *)(v11 + 40));
  int v29 = [v151 isLuna];
  if (v14)
  {
    uint64_t v30 = 0;
    double v31 = 0;
    if (v29) {
      float v32 = 1.0;
    }
    else {
      float v32 = 0.00001;
    }
    if (v28) {
      float v33 = 1.0;
    }
    else {
      float v33 = 0.00001;
    }
    uint64_t v34 = v15 + 8;
    __asm { FMOV            V0.4S, #1.0 }
    double v155 = *(double *)&_Q0;
    while (1)
    {
      float v39 = [v13 objectAtIndex:v30];
      uint64_t v40 = [v39 structure];
      *(float *)v41.i32 = v33;
      int32x2_t v176 = v41;
      if (*(void *)v40 != 3)
      {
        v41.i32[0] = *(_DWORD *)(v40 + 88);
        if (*(void *)v40 == 4) {
          *(float *)v41.i32 = v32;
        }
        int32x2_t v176 = v41;
      }
      v41.i32[0] = *(_DWORD *)(v34 - 8);
      int32x2_t v172 = v41;
      v41.i32[0] = *(_DWORD *)(v34 - 4);
      int32x2_t v167 = v41;
      v41.i32[0] = *(_DWORD *)v34;
      int32x2_t v158 = v41;
      float32x4_t v164 = *(float32x4_t *)(v34 + 8);
      v42.i32[1] = v164.i32[1];
      v42.i32[0] = *(_DWORD *)(v40 + 48);
      int32x2_t v156 = v42;
      v42.i32[0] = *(_DWORD *)(v40 + 52);
      int32x2_t v157 = v42;
      float32x4_t v160 = *(float32x4_t *)(v40 + 32);
      *(void *)&double v153 = vdupq_lane_s32(v176, 0).u64[0];
      *(void *)&double v154 = vdupq_lane_s32(v172, 0).u64[0];
      double v43 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v39, 6, v154);

      [(NUNIAnimation *)v43 setFunction:0];
      if (*(float *)v172.i32 == 1.0 && *(float *)v176.i32 <= 0.00001) {
        break;
      }
      float v44 = [NUNIAnimation alloc];
      if (*(float *)v172.i32 <= 0.00001 && *(float *)v176.i32 == 1.0)
      {
        double v48 = 0.0;
        double v49 = 0.0;
        double v47 = v39;
        double v45 = v155;
        double v46 = v155;
        goto LABEL_38;
      }
      double v51 = [(NUNIAnimation *)v44 initWithAnimatable:v39 from:6 to:v154 key:v153];

      double v52 = v51;
      uint64_t v53 = 0;
LABEL_39:
      [(NUNIAnimation *)v52 setFunction:v53];
      [v7 addObject:v51];
      if (*(float *)v167.i32 == 1.0 && *(float *)v156.i32 == 0.0)
      {
        double v54 = [NUNIAnimation alloc];
        double v55 = 0.0;
        double v56 = 0.0000305175853;
        int v57 = v39;
        double v58 = v155;
        double v59 = v155;
      }
      else
      {
        double v54 = [NUNIAnimation alloc];
        if (*(float *)v167.i32 != 0.0 || *(float *)v156.i32 != 1.0)
        {
          double v31 = [(NUNIAnimation *)v54 initWithAnimatable:v39 from:8 to:*(double *)vdupq_lane_s32(v167, 0).i64 key:*(double *)vdupq_lane_s32(v156, 0).i64];

          float v60 = v31;
          uint64_t v61 = 0;
          goto LABEL_47;
        }
        double v58 = 0.0;
        double v59 = 0.0000305175853;
        int v57 = v39;
        double v55 = v155;
        double v56 = v155;
      }
      double v31 = [(NUNIAnimation *)v54 initWithAnimatable:v57 from:8 to:v58 ctrl1:v55 ctrl2:v59 key:v56];

      float v60 = v31;
      uint64_t v61 = 2;
LABEL_47:
      [(NUNIAnimation *)v60 setFunction:v61];
      [v7 addObject:v31];
      if (*(float *)v158.i32 != *(float *)v157.i32)
      {
        float v62 = [[NUNIAnimation alloc] initWithAnimatable:v39 from:11 to:*(double *)vdupq_lane_s32(v158, 0).i64 key:*(double *)vdupq_lane_s32(v157, 0).i64];

        [(NUNIAnimation *)v62 setFunction:0];
        [v7 addObject:v62];
        double v31 = v62;
      }
      if ((vminvq_u32((uint32x4_t)vceqq_f32(v164, v160)) & 0x80000000) == 0)
      {
        v63 = [[NUNIAnimation alloc] initWithAnimatable:v39 from:2 to:*(double *)v164.i64 key:*(double *)v160.i64];

        [(NUNIAnimation *)v63 setFunction:4];
        [v7 addObject:v63];
        double v31 = v63;
      }

      ++v30;
      v34 += 32;
      if (v14 == v30) {
        goto LABEL_54;
      }
    }
    float v44 = [NUNIAnimation alloc];
    double v45 = 0.0;
    double v46 = 0.0;
    double v47 = v39;
    double v48 = v155;
    double v49 = v155;
LABEL_38:
    double v51 = [(NUNIAnimation *)v44 initWithAnimatable:v47 from:6 to:v48 ctrl1:v45 ctrl2:v49 key:v46];

    double v52 = v51;
    uint64_t v53 = 2;
    goto LABEL_39;
  }
  double v31 = 0;
LABEL_54:
  _Q1 = vsubq_f32(v147, v152);
  _S9 = _Q1.i32[2];
  float v66 = _Q1.f32[1];
  __asm { FMLA            S0, S9, V1.S[2] }
  float v173 = sqrtf(_S0);
  float32x4_t v177 = _Q1;
  float v168 = acosf(_Q1.f32[2] / v173);
  _Q0.f32[0] = atan2f(v66, v177.f32[0]);
  float v161 = _Q0.f32[0];
  _Q1 = _Q0;
  _Q1.f32[1] = v168;
  _Q1.f32[2] = v173;
  float32x4_t v165 = _Q1;
  float32x4_t v159 = vsubq_f32(v146, v152);
  _Q1.i32[0] = v159.i32[2];
  __asm { FMLA            S0, S1, V2.S[2] }
  float v169 = sqrtf(_Q0.f32[0]);
  float v174 = acosf(v159.f32[2] / v169);
  v70.f32[0] = atan2f(v159.f32[1], v159.f32[0]);
  v73.f32[0] = v161 - v70.f32[0];
  if ((float)(v161 - v70.f32[0]) <= 3.1416)
  {
    float32x4_t v74 = v165;
    float32x4_t v71 = v165;
    int v75 = v150;
    if (v73.f32[0] < -3.1416)
    {
      v71.f32[0] = v161 + 6.2832;
      *(uint64_t *)((char *)v71.i64 + 4) = *(uint64_t *)((char *)v165.i64 + 4);
    }
  }
  else
  {
    v71.f32[0] = v161 + -6.2832;
    float32x4_t v74 = v165;
    *(uint64_t *)((char *)v71.i64 + 4) = *(uint64_t *)((char *)v165.i64 + 4);
    int v75 = v150;
  }
  _V21.S[2] = v177.i32[2];
  if ((float)(v71.f32[1] - v174) <= 3.1416)
  {
    if ((float)(v71.f32[1] - v174) >= -3.1416) {
      goto LABEL_63;
    }
    float v77 = 6.2832;
  }
  else
  {
    float v77 = -6.2832;
  }
  v78.i64[0] = __PAIR64__(v71.f32[1] + v77, v71.u32[0]);
  v78.i64[1] = v71.i64[1];
  float32x4_t v71 = v78;
LABEL_63:
  v70.f32[1] = v174;
  if (v73.f32[0] <= 3.1416)
  {
    float32x4_t v72 = v74;
    if (v73.f32[0] >= -3.1416) {
      goto LABEL_68;
    }
    float v79 = 6.2832;
  }
  else
  {
    float v79 = -6.2832;
  }
  v72.f32[0] = v161 + v79;
  v72.i32[1] = v74.i32[1];
  v72.i32[2] = v74.i32[2];
LABEL_68:
  v70.f32[2] = v169;
  float32x4_t v80 = (float32x4_t)vdupq_n_s32(0x3EA8F5C3u);
  if ((float)(v72.f32[1] - v174) <= 3.1416)
  {
    if ((float)(v72.f32[1] - v174) >= -3.1416) {
      goto LABEL_73;
    }
    float v81 = 6.2832;
  }
  else
  {
    float v81 = -6.2832;
  }
  v82.i64[0] = __PAIR64__(v72.f32[1] + v81, v72.u32[0]);
  v82.i64[1] = v72.i64[1];
  float32x4_t v72 = v82;
LABEL_73:
  __asm { FMLA            S4, S9, V21.S[2] }
  float32x4_t v84 = (float32x4_t)vdupq_n_s32(0x3F2B851Eu);
  float32x4_t v85 = vmulq_f32(v70, v80);
  float32x4_t v86 = vmulq_f32(v70, (float32x4_t)vdupq_n_s32(0x3F28F5C3u));
  float32x4_t v87 = (float32x4_t)vdupq_n_s32(0x3EAE147Au);
  if (v73.f32[0] <= 3.1416)
  {
    if (v73.f32[0] >= -3.1416) {
      goto LABEL_78;
    }
    v73.i32[0] = 1086918619;
  }
  else
  {
    v73.i32[0] = -1060565029;
  }
  v73.f32[0] = v161 + v73.f32[0];
  v73.i32[1] = v74.i32[1];
  v73.i32[2] = v74.i32[2];
  float32x4_t v74 = v73;
LABEL_78:
  float32x4_t v88 = vmlaq_f32(v85, v84, v71);
  float v89 = sqrtf(_S4);
  float32x4_t v178 = vmlaq_f32(v86, v87, v72);
  if ((float)(v74.f32[1] - v174) <= 3.1416)
  {
    if ((float)(v74.f32[1] - v174) >= -3.1416) {
      goto LABEL_83;
    }
    float v90 = 6.2832;
  }
  else
  {
    float v90 = -6.2832;
  }
  v91.i32[0] = v74.i32[0];
  v91.f32[1] = v74.f32[1] + v90;
  v91.i64[1] = v74.i64[1];
  float32x4_t v74 = v91;
LABEL_83:
  v92.i64[0] = 0x3F0000003F000000;
  v92.i64[1] = 0x3F0000003F000000;
  float32x4_t v170 = v88;
  float32x4_t v175 = vmlaq_f32(vmulq_f32(v70, v92), v92, v74);
  __float2 v93 = __sincosf_stret(v88.f32[0]);
  __float2 v94 = __sincosf_stret(v170.f32[1]);
  *(float32x2_t *)v95.f32 = vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v93.__sinval), LODWORD(v93.__cosval)), vmuls_lane_f32(v94.__sinval, v170, 2));
  v95.i32[2] = vmuls_lane_f32(v94.__cosval, v170, 2);
  *(void *)&double v171 = vaddq_f32(v152, v95).u64[0];
  __float2 v96 = __sincosf_stret(v178.f32[0]);
  __float2 v97 = __sincosf_stret(v178.f32[1]);
  *(float32x2_t *)v98.f32 = vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v96.__sinval), LODWORD(v96.__cosval)), vmuls_lane_f32(v97.__sinval, v178, 2));
  v98.i32[2] = vmuls_lane_f32(v97.__cosval, v178, 2);
  *(void *)&double v166 = vaddq_f32(v152, v98).u64[0];
  long long v99 = [(NUNIScene *)v75 spheroidOfType:3];
  long long v100 = [(NUNIScene *)v75 spheroidOfType:4];
  __float2 v101 = __sincosf_stret(v175.f32[0]);
  __float2 v102 = __sincosf_stret(v175.f32[1]);
  *(float32x2_t *)v103.f32 = vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v101.__sinval), LODWORD(v101.__cosval)), vmuls_lane_f32(v102.__sinval, v175, 2));
  v103.i32[2] = vmuls_lane_f32(v102.__cosval, v175, 2);
  _Q0 = vsubq_f32(vaddq_f32(v152, v103), v152);
  _Q1 = vmulq_f32(_Q0, _Q0);
  _S2 = _Q0.i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  _Q1.f32[0] = sqrtf(_Q1.f32[0]);
  int32x4_t v107 = (int32x4_t)vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
  _Q0 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v107, (int8x16_t)v107, 0xCuLL), (int8x16_t)v107, 8uLL), vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v148, (int32x4_t)v148), (int8x16_t)v148, 0xCuLL))), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v107, v107), (int8x16_t)v107, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v148, (int8x16_t)v148, 0xCuLL), (int8x16_t)v148, 8uLL));
  _Q1 = vmulq_f32(_Q0, _Q0);
  _S2 = _Q0.i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  _Q1.f32[0] = sqrtf(_Q1.f32[0]);
  float32x4_t v111 = vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
  float32x4_t v179 = v111;
  v111.f32[0] = v89 * 0.75;
  int32x2_t v162 = *(int32x2_t *)v111.f32;
  v112 = [NUNIAnimation alloc];
  float32x4_t v163 = (float32x4_t)vdupq_lane_s32(v162, 0);
  if (v141)
  {
    v113 = -[NUNIAnimation initWithAnimatable:from:to:key:](v112, "initWithAnimatable:from:to:key:", v99, 0);

    [(NUNIAnimation *)v113 setFunction:0];
    [v7 addObject:v113];
    v114 = [NUNIAnimation alloc];
    unint64_t v115 = vmlaq_f32(v152, v163, v179).u64[0];
    v116 = v100;
  }
  else
  {
    v113 = -[NUNIAnimation initWithAnimatable:from:to:key:](v112, "initWithAnimatable:from:to:key:", v100, 0);

    [(NUNIAnimation *)v113 setFunction:0];
    [v7 addObject:v113];
    v114 = [NUNIAnimation alloc];
    unint64_t v115 = vmlsq_f32(v152, v163, v179).u64[0];
    v116 = v99;
  }
  v117 = [(NUNIAnimation *)v114 initWithAnimatable:v116 from:0 to:*(double *)&v115 key:*(double *)v152.i64];

  [(NUNIAnimation *)v117 setFunction:0];
  [v7 addObject:v117];
  v118 = [[NUNIAnimation alloc] initWithAnimatable:v75 from:0 to:*(double *)v147.i64 ctrl1:*(double *)v146.i64 ctrl2:v171 key:v166];

  [(NUNIAnimation *)v118 setFunction:2];
  [v7 addObject:v118];
  v119 = [NUNIAnimation alloc];
  __asm
  {
    FMOV            V3.4S, #0.25
    FMOV            V4.4S, #0.75
  }
  _Q2 = vmlaq_f32(vmulq_f32(v134, _Q3), _Q4, v148);
  _Q5 = vmulq_f32(_Q2, _Q2);
  _S6 = _Q2.i32[2];
  __asm { FMLA            S5, S6, V2.S[2] }
  _Q5.f32[0] = sqrtf(_Q5.f32[0]);
  _Q2.i64[0] = vdivq_f32(_Q2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q5.f32, 0)).u64[0];
  _Q4 = vmlaq_f32(vmulq_f32(v134, _Q4), _Q3, v148);
  _Q3 = vmulq_f32(_Q4, _Q4);
  _Q5.i32[0] = _Q4.i32[2];
  __asm { FMLA            S3, S5, V4.S[2] }
  _Q3.f32[0] = sqrtf(_Q3.f32[0]);
  v127 = [(NUNIAnimation *)v119 initWithAnimatable:v75 from:2 to:*(double *)v148.i64 ctrl1:*(double *)v134.i64 ctrl2:*(double *)_Q2.i64 key:*(double *)vdivq_f32(_Q4, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q3.f32, 0)).i64];

  [(NUNIAnimation *)v127 setFunction:2];
  [v7 addObject:v127];
  v128 = [[NUNIAnimation alloc] initWithAnimatable:v75 from:3 to:*(double *)vdupq_lane_s32(v136, 0).i64 key:*(double *)vdupq_lane_s32(v135, 0).i64];

  [(NUNIAnimation *)v128 setFunction:0];
  [v7 addObject:v128];
  uint32x2_t v129 = (uint32x2_t)vceq_f32(*(float32x2_t *)&v144, *(float32x2_t *)&v142);
  if ((vpmin_u32(v129, v129).u32[0] & 0x80000000) == 0)
  {
    v130 = [[NUNIAnimation alloc] initWithAnimatable:v75 from:6 to:v144 key:v142];

    [(NUNIAnimation *)v130 setFunction:0];
    [v7 addObject:v130];
    v128 = v130;
  }
  uint32x2_t v131 = (uint32x2_t)vceq_f32(*(float32x2_t *)&v145, *(float32x2_t *)&v143);
  if ((vpmin_u32(v131, v131).u32[0] & 0x80000000) == 0)
  {
    v132 = [[NUNIAnimation alloc] initWithAnimatable:v75 from:7 to:v145 key:v143];

    [(NUNIAnimation *)v132 setFunction:0];
    [v7 addObject:v132];
    v128 = v132;
  }
  [(NUNIAstronomyVistaView *)v149 _setVista:v149->_vista scene:v75];

  return v7;
}

- (id)generateAnimationArrayFromVista:(unint64_t)a3 toVista:(unint64_t)a4 transitionStyle:(unint64_t)a5
{
  if (a3 == a4)
  {
    char v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    char v7 = -[NUNIAstronomyVistaView generateAnimationArrayFromVista:fromSceneBlock:toVista:toSceneBlock:transitionStyle:](self, "generateAnimationArrayFromVista:fromSceneBlock:toVista:toSceneBlock:transitionStyle:", a3, 0, a4, 0, a5, v5);
  }
  return v7;
}

- (id)generateAnimationArrayFromVista:(unint64_t)a3 fromSceneBlock:(id)a4 toVista:(unint64_t)a5 toSceneBlock:(id)a6 transitionStyle:(unint64_t)a7
{
  id v12 = a6;
  double v13 = +[NUNISceneUpdateDescription descriptionWithVista:a3 updateBlock:a4];
  uint64_t v14 = +[NUNISceneUpdateDescription descriptionWithVista:a5 updateBlock:v12];

  uint64_t v15 = [(NUNIAstronomyVistaView *)self generateAnimationArrayFromSceneDescription:v13 toSceneDescription:v14 transitionStyle:a7];

  return v15;
}

- (id)generateAnimationArrayFromSceneDescription:(id)a3 toSceneDescription:(id)a4 transitionStyle:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5 == 1)
  {
    uint64_t v10 = [(NUNIAstronomyVistaView *)self _panAnimationArrayFromSceneDescription:v8 toSceneDescription:v9];
    goto LABEL_5;
  }
  if (!a5)
  {
    uint64_t v10 = [(NUNIAstronomyVistaView *)self _zoomAnimationArrayFromSceneDescription:v8 toSceneDescription:v9];
LABEL_5:
    uint64_t v11 = (void *)v10;
    goto LABEL_7;
  }
  uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_7:

  return v11;
}

- (id)_panAnimationArrayFromSceneDescription:(id)a3 toSceneDescription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isLuna] && (objc_msgSend(v7, "isEarth") & 1) != 0
    || [v6 isEarth] && objc_msgSend(v7, "isLuna"))
  {
    uint64_t v8 = [(NUNIAstronomyVistaView *)self _earthLunaPanAnimationArrayFromSceneDescription:v6 toSceneDescription:v7];
  }
  else
  {
    uint64_t v8 = [(NUNIAstronomyVistaView *)self _zoomAnimationArrayFromSceneDescription:v6 toSceneDescription:v7];
  }
  id v9 = (void *)v8;

  return v9;
}

- (id)_zoomAnimationArrayFromSceneDescription:(id)a3 toSceneDescription:(id)a4
{
  id v6 = a3;
  id v140 = a4;
  id v7 = objc_opt_new();
  uint64_t v8 = self->_scene;
  -[NUNIAstronomyVistaView _setVista:scene:](self, "_setVista:scene:", [v6 vista], v8);
  v133 = v6;
  uint64_t v9 = [v6 updateBlock];
  uint64_t v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, NUNIScene *))(v9 + 16))(v9, v8);
    [(NUNIScene *)v8 updateCamera];
  }
  v132 = v10;
  uint64_t v11 = [(NUNIScene *)v8 structure];
  float32x4_t v142 = *(float32x4_t *)v11;
  float32x4_t v139 = *(float32x4_t *)(v11 + 16);
  v12.i32[1] = v139.i32[1];
  v12.i32[0] = *(_DWORD *)(v11 + 52);
  float32x4_t v129 = *(float32x4_t *)(v11 + 32);
  int32x2_t v130 = v12;
  double v136 = *(double *)(v11 + 96);
  double v137 = *(double *)(v11 + 104);
  double v13 = [(NUNIScene *)v8 spheroids];
  uint64_t v14 = [v13 count];
  id v131 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:32 * v14];
  uint64_t v15 = [v131 mutableBytes];
  int v16 = (float32x4_t *)v15;
  if (v14)
  {
    uint64_t v17 = 0;
    uint64_t v18 = v15 + 8;
    do
    {
      float v19 = [v13 objectAtIndex:v17];
      uint64_t v20 = [v19 structure];
      int v21 = *(_DWORD *)(v20 + 48);
      *(_OWORD *)&v157[4] = *(_OWORD *)(v20 + 32);
      *(_DWORD *)(v18 - 8) = *(_DWORD *)(v20 + 88);
      *(_DWORD *)(v18 - 4) = v21;
      *(_DWORD *)uint64_t v18 = 0;
      *(_DWORD *)(v18 + 20) = *(_DWORD *)&v157[16];
      *(_OWORD *)(v18 + 4) = *(_OWORD *)v157;

      ++v17;
      v18 += 32;
    }
    while (v14 != v17);
  }
  -[NUNIAstronomyVistaView _setVista:scene:](self, "_setVista:scene:", [v140 vista], v8);
  uint64_t v22 = [v140 updateBlock];
  float v23 = (void *)v22;
  if (v22)
  {
    (*(void (**)(uint64_t, NUNIScene *))(v22 + 16))(v22, v8);
    [(NUNIScene *)v8 updateCamera];
  }
  float32x4_t v25 = *(float32x4_t *)v11;
  float32x4_t v138 = *(float32x4_t *)(v11 + 16);
  v24.i32[1] = v138.i32[1];
  v24.i32[0] = *(_DWORD *)(v11 + 52);
  float32x4_t v127 = *(float32x4_t *)(v11 + 32);
  int32x2_t v128 = v24;
  double v134 = *(double *)(v11 + 96);
  double v135 = *(double *)(v11 + 104);
  float32x4_t v141 = *(float32x4_t *)v11;
  if (v14)
  {
    v125 = v23;
    uint64_t v26 = 0;
    float32x4_t v27 = 0;
    __asm { FMOV            V0.4S, #1.0 }
    double v143 = *(double *)&_Q0;
    while (1)
    {
      float v32 = [v13 objectAtIndex:v26];
      uint64_t v33 = [v32 structure];
      uint64_t v34 = (const float *)v16;
      *(void *)&double v35 = vld1q_dup_f32(v34++).u64[0];
      *(float *)v36.i32 = *v34;
      int32x2_t v147 = v36;
      double v37 = (const float *)(v33 + 88);
      v36.i32[0] = *(_DWORD *)(v33 + 48);
      float32x4_t v151 = v16[1];
      int32x2_t v154 = v36;
      float32x4_t v149 = *(float32x4_t *)(v33 + 32);
      *(void *)&double v38 = vld1q_dup_f32(v37).u64[0];
      float v39 = [[NUNIAnimation alloc] initWithAnimatable:v32 from:6 to:v35 key:v38];

      [(NUNIAnimation *)v39 setFunction:0];
      [v7 addObject:v39];
      if (*(float *)v147.i32 == 1.0 && *(float *)v154.i32 == 0.0) {
        break;
      }
      uint64_t v40 = [NUNIAnimation alloc];
      *(void *)&double v43 = vdupq_lane_s32(v147, 0).u64[0];
      if (*(float *)v147.i32 == 0.0 && *(float *)v154.i32 == 1.0)
      {
        int32x2_t v42 = v32;
        double v41 = v143;
        double v44 = v43;
        double v45 = v43;
        goto LABEL_19;
      }
      float32x4_t v27 = [(NUNIAnimation *)v40 initWithAnimatable:v32 from:8 to:v43 key:*(double *)vdupq_lane_s32(v154, 0).i64];

      double v47 = v27;
      uint64_t v48 = 0;
LABEL_20:
      [(NUNIAnimation *)v47 setFunction:v48];
      [v7 addObject:v27];
      if ((vminvq_u32((uint32x4_t)vceqq_f32(v151, v149)) & 0x80000000) == 0)
      {
        double v49 = [[NUNIAnimation alloc] initWithAnimatable:v32 from:2 to:*(double *)v151.i64 key:*(double *)v149.i64];

        [(NUNIAnimation *)v49 setFunction:4];
        [v7 addObject:v49];
        float32x4_t v27 = v49;
      }

      ++v26;
      v16 += 2;
      if (v14 == v26)
      {

        float v23 = v125;
        float32x4_t v25 = v141;
        goto LABEL_24;
      }
    }
    uint64_t v40 = [NUNIAnimation alloc];
    *(void *)&double v41 = vdupq_lane_s32(v154, 0).u64[0];
    int32x2_t v42 = v32;
    double v43 = v143;
    double v44 = v41;
    double v45 = v41;
LABEL_19:
    float32x4_t v27 = [(NUNIAnimation *)v40 initWithAnimatable:v42 from:8 to:v43 ctrl1:v41 ctrl2:v44 key:v45];

    double v47 = v27;
    uint64_t v48 = 2;
    goto LABEL_20;
  }
LABEL_24:
  _Q3 = vsubq_f32(v25, v142);
  _Q0 = vmulq_f32(_Q3, _Q3);
  _S1 = _Q3.i32[2];
  __asm { FMLA            S0, S1, V3.S[2] }
  _Q0.f32[0] = sqrtf(_Q0.f32[0]);
  int32x2_t v152 = *(int32x2_t *)_Q0.f32;
  float32x4_t v155 = _Q3;
  uint64_t v53 = [(NUNIScene *)v8 spheroidOfType:3];
  double v54 = [(NUNIScene *)v8 spheroidOfType:4];
  float32x4_t v146 = vdivq_f32(v155, (float32x4_t)vdupq_lane_s32(v152, 0));
  int32x4_t v126 = (int32x4_t)vmulq_f32(v146, (float32x4_t)xmmword_1B4855910);
  float32x4_t v55 = (float32x4_t)vzip1q_s32((int32x4_t)vextq_s8((int8x16_t)v126, (int8x16_t)v126, 4uLL), v126);
  _Q0 = vsubq_f32(v138, v141);
  _Q1 = vmulq_f32(_Q0, _Q0);
  _S2 = _Q0.i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  _Q1.f32[0] = sqrtf(_Q1.f32[0]);
  float32x4_t v124 = vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
  _Q0 = vsubq_f32(v139, v142);
  _Q1 = vmulq_f32(_Q0, _Q0);
  _S2 = _Q0.i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  _Q1.f32[0] = sqrtf(_Q1.f32[0]);
  float32x4_t v148 = vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
  *(void *)&double v156 = vmlaq_n_f32(vmlaq_n_f32(v142, v146, *(float *)v152.i32 * 0.25), v55, *(float *)v152.i32 * 0.05).u64[0];
  float32x4_t v144 = v55;
  *(void *)&double v153 = vmlaq_n_f32(vmlaq_n_f32(v142, v146, *(float *)v152.i32 * 0.75), v55, *(float *)v152.i32 * 0.05).u64[0];
  [v53 position];
  float32x4_t v145 = v62;
  [v53 radius];
  float v64 = v63;
  [v54 position];
  float32x4_t v150 = v65;
  [v54 radius];
  _Q18 = v148;
  _S3 = vsubq_f32(v142, v145).i32[2];
  __asm { FMLA            S2, S3, V1.S[2] }
  BOOL v70 = sqrtf(_S2) > (float)(v64 * 5.7588);
  _S2 = v148.i32[2];
  _S1 = v146.i32[2];
  if (v70)
  {
    _S7 = vsubq_f32(v141, v145).i32[2];
    __asm { FMLA            S6, S7, V5.S[2] }
    float32x4_t v75 = v141;
    if (sqrtf(_S6) <= (float)(v64 * 5.7588))
    {
      _V6.S[2] = v124.i32[2];
      _Q4 = vmulq_f32(v124, v146);
      __asm { FMLA            S4, S1, V6.S[2] }
      if (_Q4.f32[0] < -0.25)
      {
        _Q4.i32[0] = v124.i32[2];
        _S17 = v124.i32[0];
        _Q6 = v126;
        __asm
        {
          FMLA            S5, S17, V6.S[1]
          FMLA            S5, S4, V6.S[2]
        }
        _Q4.f32[0] = (float)(v64 * 5.7588) * 3.0;
        float32x4_t v82 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q4.f32, 0);
        if (_S5 <= 0.1) {
          unint64_t v83 = vmlaq_f32(v141, v82, v144).u64[0];
        }
        else {
          unint64_t v83 = vmlsq_f32(v141, v82, v144).u64[0];
        }
        double v153 = *(double *)&v83;
      }
    }
    goto LABEL_38;
  }
  _Q4 = vmulq_f32(v148, v146);
  __asm { FMLA            S4, S1, V18.S[2] }
  if (_Q4.f32[0] <= 0.25)
  {
    float32x4_t v75 = v141;
LABEL_38:
    float32x4_t v87 = v150;
    goto LABEL_39;
  }
  _Q5 = v126;
  __asm
  {
    FMLA            S4, S18, V5.S[1]
    FMLA            S4, S2, V5.S[2]
  }
  *(double *)_Q5.i64 = _Q4.f32[0];
  _Q4.f32[0] = (float)(v64 * 5.7588) * 3.0;
  float32x4_t v86 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q4.f32, 0);
  float32x4_t v75 = v141;
  float32x4_t v87 = v150;
  if (*(double *)_Q5.i64 <= 0.1) {
    unint64_t v88 = vmlaq_f32(v142, v86, v144).u64[0];
  }
  else {
    unint64_t v88 = vmlsq_f32(v142, v86, v144).u64[0];
  }
  double v156 = *(double *)&v88;
LABEL_39:
  _S6 = vsubq_f32(v142, v87).i32[2];
  __asm { FMLA            S5, S6, V4.S[2] }
  if (sqrtf(_S5) <= (float)(*(float *)v66.i32 * 5.7588))
  {
    __asm { FMLA            S3, S1, V18.S[2] }
    if (_S3 > 0.25)
    {
      _Q3 = v126;
      __asm
      {
        FMLA            S1, S18, V3.S[1]
        FMLA            S1, S2, V3.S[2]
      }
      *(float *)v66.i32 = (float)(*(float *)v66.i32 * 5.7588) * 3.0;
      float32x4_t v105 = (float32x4_t)vdupq_lane_s32(v66, 0);
      if (_S1 <= 0.1) {
        unint64_t v106 = vmlaq_f32(v142, v105, v144).u64[0];
      }
      else {
        unint64_t v106 = vmlsq_f32(v142, v105, v144).u64[0];
      }
      double v156 = *(double *)&v106;
    }
  }
  else
  {
    _S5 = vsubq_f32(v75, v87).i32[2];
    __asm { FMLA            S4, S5, V2.S[2] }
    if (sqrtf(_S4) <= (float)(*(float *)v66.i32 * 5.7588))
    {
      _Q4 = v124;
      __asm { FMLA            S2, S1, V4.S[2] }
      if (_S2 < -0.25)
      {
        _S1 = v124.i32[2];
        _Q3 = v126;
        __asm
        {
          FMLA            S2, S4, V3.S[1]
          FMLA            S2, S1, V3.S[2]
        }
        *(float *)v66.i32 = (float)(*(float *)v66.i32 * 5.7588) * 3.0;
        float32x4_t v99 = (float32x4_t)vdupq_lane_s32(v66, 0);
        if (_S2 <= 0.1) {
          unint64_t v100 = vmlaq_f32(v75, v99, v144).u64[0];
        }
        else {
          unint64_t v100 = vmlsq_f32(v75, v99, v144).u64[0];
        }
        double v153 = *(double *)&v100;
      }
    }
  }
  int32x4_t v107 = [[NUNIAnimation alloc] initWithAnimatable:v8 from:0 to:*(double *)v142.i64 ctrl1:*(double *)v141.i64 ctrl2:v156 key:v153];
  [(NUNIAnimation *)v107 setFunction:2];
  [v7 addObject:v107];
  v108 = [[NUNIAnimation alloc] initWithAnimatable:v8 from:1 to:*(double *)v139.i64 key:*(double *)v138.i64];

  [(NUNIAnimation *)v108 setFunction:0];
  [v7 addObject:v108];
  v109 = [NUNIAnimation alloc];
  __asm
  {
    FMOV            V3.4S, #0.25
    FMOV            V4.4S, #0.75
  }
  _Q2 = vmlaq_f32(vmulq_f32(v127, _Q3), _Q4, v129);
  _Q5 = vmulq_f32(_Q2, _Q2);
  _S6 = _Q2.i32[2];
  __asm { FMLA            S5, S6, V2.S[2] }
  _Q5.f32[0] = sqrtf(_Q5.f32[0]);
  _Q2.i64[0] = vdivq_f32(_Q2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q5.f32, 0)).u64[0];
  _Q4 = vmlaq_f32(vmulq_f32(v127, _Q4), _Q3, v129);
  _Q3 = vmulq_f32(_Q4, _Q4);
  _Q5.i32[0] = _Q4.i32[2];
  __asm { FMLA            S3, S5, V4.S[2] }
  _Q3.f32[0] = sqrtf(_Q3.f32[0]);
  v117 = [(NUNIAnimation *)v109 initWithAnimatable:v8 from:2 to:*(double *)v129.i64 ctrl1:*(double *)v127.i64 ctrl2:*(double *)_Q2.i64 key:*(double *)vdivq_f32(_Q4, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q3.f32, 0)).i64];

  [(NUNIAnimation *)v117 setFunction:2];
  [v7 addObject:v117];
  v118 = [[NUNIAnimation alloc] initWithAnimatable:v8 from:3 to:*(double *)vdupq_lane_s32(v130, 0).i64 key:*(double *)vdupq_lane_s32(v128, 0).i64];

  [(NUNIAnimation *)v118 setFunction:0];
  [v7 addObject:v118];
  uint32x2_t v119 = (uint32x2_t)vceq_f32(*(float32x2_t *)&v136, *(float32x2_t *)&v134);
  if ((vpmin_u32(v119, v119).u32[0] & 0x80000000) == 0)
  {
    v120 = [[NUNIAnimation alloc] initWithAnimatable:v8 from:6 to:v136 key:v134];

    [(NUNIAnimation *)v120 setFunction:2];
    [v7 addObject:v120];
    v118 = v120;
  }
  uint32x2_t v121 = (uint32x2_t)vceq_f32(*(float32x2_t *)&v137, *(float32x2_t *)&v135);
  if ((vpmin_u32(v121, v121).u32[0] & 0x80000000) == 0)
  {
    v122 = [[NUNIAnimation alloc] initWithAnimatable:v8 from:7 to:v137 key:v135];

    [(NUNIAnimation *)v122 setFunction:2];
    [v7 addObject:v122];
    v118 = v122;
  }
  [(NUNIAstronomyVistaView *)self _setVista:self->_vista scene:v8];

  return v7;
}

- (void)setVista:(unint64_t)a3
{
  if (self->_scene)
  {
    if (self->_vista != a3)
    {
      self->_vista = a3;
      -[NUNIAstronomyVistaView _setVista:scene:](self, "_setVista:scene:");
    }
  }
}

- (void)_setVista:(unint64_t)a3 scene:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = v5;
  switch(a3)
  {
    case 1uLL:
      uint64_t v7 = 16;
      a3 = 4;
      goto LABEL_30;
    case 2uLL:
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      uint64_t v8 = [v5 spheroids];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = v6;
        uint64_t v12 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v42 != v12) {
              objc_enumerationMutation(v8);
            }
            uint64_t v14 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            uint64_t v15 = [v14 structure];
            uint64_t v18 = v15;
            int v19 = *(_DWORD *)v15;
            if (*(_DWORD *)v15 == 4) {
              float v20 = 0.000001;
            }
            else {
              float v20 = 1.0;
            }
            if (*(float *)(v15 + 88) != v20) {
              objc_msgSend(v14, "setRadiusScale:");
            }
            int v21 = 1 << v19;
            if ((v21 & 0x4FFE) != 0) {
              float v22 = 1.0;
            }
            else {
              float v22 = 0.0;
            }
            if (*(float *)(v18 + 48) != v22) {
              objc_msgSend(v14, "setOpacity:");
            }
            v16.i64[0] = 0;
            v17.i64[0] = v21 & 0x3FE;
            objc_msgSend(v14, "setOrientation:", *(double *)vbslq_s8((int8x16_t)vdupq_lane_s64(vceqq_s64(v17, v16).i64[0], 0), (int8x16_t)xmmword_1B483DAE0, (int8x16_t)xmmword_1B4855920).i64);
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v41 objects:v46 count:16];
        }
        while (v10);
        id v6 = v11;
      }
      a3 = 24;
      goto LABEL_48;
    case 3uLL:
      uint64_t v7 = 32770;
      a3 = 1;
      goto LABEL_30;
    case 4uLL:
      uint64_t v7 = 65540;
      a3 = 2;
      goto LABEL_30;
    case 5uLL:
      uint64_t v7 = 524320;
      goto LABEL_30;
    case 6uLL:
      uint64_t v7 = 1048640;
      goto LABEL_30;
    case 7uLL:
      uint64_t v7 = 2097280;
      goto LABEL_30;
    case 8uLL:
      uint64_t v7 = 4194560;
      goto LABEL_30;
    case 9uLL:
      uint64_t v7 = 8389120;
      goto LABEL_30;
    default:
      uint64_t v7 = 131080;
      a3 = 3;
LABEL_30:
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v8 = [v5 spheroids];
      uint64_t v23 = [v8 countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        unint64_t v35 = a3;
        int32x2_t v36 = v6;
        uint64_t v25 = *(void *)v38;
        uint64_t v26 = v7 | 0x400;
        uint64_t v27 = v7 & 0x3FE;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v38 != v25) {
              objc_enumerationMutation(v8);
            }
            int v29 = *(void **)(*((void *)&v37 + 1) + 8 * j);
            uint64_t v30 = [v29 structure];
            uint64_t v31 = v30;
            uint64_t v32 = (1 << *(_DWORD *)v30);
            if ((v26 & v32) != 0) {
              float v33 = 1.0;
            }
            else {
              float v33 = 0.000001;
            }
            if (*(float *)(v30 + 88) != v33) {
              objc_msgSend(v29, "setRadiusScale:");
            }
            if ((v27 & v32) != 0) {
              float v34 = 1.0;
            }
            else {
              float v34 = 0.0;
            }
            if (*(float *)(v31 + 48) != v34) {
              objc_msgSend(v29, "setOpacity:");
            }
            [v29 setOrientation:*(double *)&_PromotedConst];
          }
          uint64_t v24 = [v8 countByEnumeratingWithState:&v37 objects:v45 count:16];
        }
        while (v24);
        a3 = v35;
        id v6 = v36;
      }
LABEL_48:

      [v6 setSnap:a3];
      return;
  }
}

- (void)universeAnimationFinished:(id)a3
{
  [(NSMutableSet *)self->_activeContentsAnimations removeObject:a3];
  if (![(NSMutableSet *)self->_activeContentsAnimations count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
    [WeakRetained astronomyVistaViewContentsAnimationFinished:self];
  }
}

- (void)quadViewWillDisplay:(id)a3 forTime:(double)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  [WeakRetained astronomyVistaViewWillDisplay:self forTime:a4];

  if ((*((unsigned char *)self + 496) & 0x10) == 0)
  {
    [(NUNIAstronomyVistaView *)self stopAnimation];
    *((unsigned char *)self + 496) |= 0x10u;
  }
}

- (id)contentMaskLayer
{
  return self->_contentMaskLayer;
}

- (CLKDevice)device
{
  return self->_device;
}

- (NUNIAstronomyVistaViewObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (NUNIAstronomyVistaViewObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (NSArray)quadViews
{
  return self->_quadViews;
}

- (float)supplementalSpheroidSize
{
  return self->_supplementalSpheroidSize;
}

- (void)setSupplementalSpheroidSize:(float)a3
{
  self->_supplementalSpheroidSize = a3;
}

- (float)supplementalHorizontalInset
{
  return self->_supplementalHorizontalInset;
}

- (void)setSupplementalHorizontalInset:(float)a3
{
  self->_supplementalHorizontalInset = a3;
}

- (float)supplementalTopInset
{
  return self->_supplementalTopInset;
}

- (void)setSupplementalTopInset:(float)a3
{
  self->_supplementalTopInset = a3;
}

- (float)supplementalBottomInset
{
  return self->_supplementalBottomInset;
}

- (void)setSupplementalBottomInset:(float)a3
{
  self->_supplementalBottomInset = a3;
}

- (int64_t)frameInterval
{
  return self->_frameInterval;
}

- (BOOL)pauseAnimationWhenNoUpdate
{
  return self->_pauseAnimationWhenNoUpdate;
}

- (void)setPauseAnimationWhenNoUpdate:(BOOL)a3
{
  self->_pauseAnimationWhenNoUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quadViews, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_activeContentsAnimations, 0);
  objc_storeStrong((id *)&self->maskLayer, 0);
  objc_storeStrong((id *)&self->_portalLayer, 0);
  objc_storeStrong((id *)&self->_contentMaskLayer, 0);
  objc_storeStrong((id *)&self->_debounceTimer, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->_quadView1, 0);
  objc_storeStrong((id *)&self->_quadView0, 0);
}

@end