@interface NUNIAstronomyVistaView
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
- (id)_mtlQuadView;
- (id)_panAnimationArrayFromSceneDescription:(id)a3 toSceneDescription:(id)a4;
- (id)_zoomAnimationArrayFromSceneDescription:(id)a3 toSceneDescription:(id)a4;
- (id)contentMaskLayer;
- (id)generateAnimationArrayFromSceneDescription:(id)a3 toSceneDescription:(id)a4 transitionStyle:(unint64_t)a5;
- (id)generateAnimationArrayFromVista:(unint64_t)a3 fromSceneBlock:(id)a4 toVista:(unint64_t)a5 toSceneBlock:(id)a6 transitionStyle:(unint64_t)a7;
- (id)generateAnimationArrayFromVista:(unint64_t)a3 toVista:(unint64_t)a4 transitionStyle:(unint64_t)a5;
- (id)rotatable:(unint64_t)a3;
- (id)snapshotImage;
- (id)spheroidAtPoint:(CGPoint)a3;
- (int64_t)frameInterval;
- (void)_startAnimation;
- (void)_stopAnimation;
- (void)_updateAnimation;
- (void)applyVista:(unint64_t)a3 transitionStyle:(unint64_t)a4;
- (void)astronomySceneAnimationFinished:(id)a3;
- (void)dealloc;
- (void)disableCloudDataFetch:(BOOL)a3;
- (void)discardContents;
- (void)layoutSubviews;
- (void)purgeUnused;
- (void)quadViewWillDisplay:(id)a3 forTime:(double)a4;
- (void)removeBackBuffers;
- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)setAPLFilterAmount:(double)a3;
- (void)setCacheDirectory:(id)a3;
- (void)setFrameInterval:(int64_t)a3;
- (void)setObserver:(id)a3;
- (void)setOpaque:(BOOL)a3;
- (void)setScene:(id)a3;
- (void)setSupplementalBottomInset:(float)a3;
- (void)setSupplementalHorizontalInset:(float)a3;
- (void)setSupplementalSpheroidSize:(float)a3;
- (void)setSupplementalTopInset:(float)a3;
- (void)setTritiumBrightness:(double)a3;
- (void)showSupplemental:(BOOL)a3 animated:(BOOL)a4;
- (void)startAnimation;
- (void)stopAnimation;
- (void)updateLightingPreference:(BOOL)a3;
- (void)updatePortalLayerBounds:(CGRect)a3;
- (void)updateSunLocationAnimated:(BOOL)a3;
- (void)updateSunLocationAnimated:(BOOL)a3 adjustEarthRotation:(BOOL)a4;
@end

@implementation NUNIAstronomyVistaView

- (NUNIAstronomyVistaView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v48[1] = *MEMORY[0x263EF8340];
  id v10 = a4;
  v44.receiver = self;
  v44.super_class = (Class)NUNIAstronomyVistaView;
  v11 = -[NUNIAstronomyVistaView initWithFrame:](&v44, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_configuration, a4);
    uint64_t v13 = [v10 device];
    device = v12->_device;
    v12->_device = (CLKDevice *)v13;

    uint64_t v15 = objc_msgSend(MEMORY[0x263F32158], "quadViewWithFrame:identifier:options:colorSpace:", @"NUV0", objc_msgSend(v10, "quadViewOptions"), objc_msgSend(v10, "colorSpace"), x, y, width, height);
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
    if ((v18 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      [(CLKUIQuadView *)v12->_quadView0 setOpaque:1];
      [(CLKUIQuad *)v12->_quad setOpaque:1];
      v26 = [MEMORY[0x263F157E8] layer];
      contentMaskLayer = v12->_contentMaskLayer;
      v12->_contentMaskLayer = v26;

      v28 = v26;
      -[NSArray setFrame:](v28, "setFrame:", x, y, width, height);
      [(NSArray *)v28 setCompositingFilter:*MEMORY[0x263F15B90]];
      [(NSArray *)v28 setOpaque:0];
      v47 = @"contents";
      v29 = [MEMORY[0x263EFF9D0] null];
      v48[0] = v29;
      v30 = [NSDictionary dictionaryWithObjects:v48 forKeys:&v47 count:1];
      [(NSArray *)v28 setActions:v30];

      [(NUNIRenderer *)v12->_renderer setContentMaskLayer:v28];
      v31 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, width, floor(height / 3.0));
      quadView1 = v12->_quadView1;
      v12->_quadView1 = v31;

      v33 = v31;
      v34 = (void *)MGGetStringAnswer();
      if ([v34 isEqualToString:@"t8010"])
      {
        v35 = 0;
      }
      else
      {
        v35 = [MEMORY[0x263F15840] layer];
        v37 = [v17 metalLayer];
        [v35 setSourceLayer:v37];

        objc_msgSend(v35, "setFrame:", x, y, width, height);
        [v35 addSublayer:v28];
        [v35 setOpaque:0];
        objc_storeStrong((id *)&v12->_portalLayer, v35);
      }
      v38 = [(UIView *)v33 layer];
      [v38 setOpaque:0];
      if (v35) {
        [v38 addSublayer:v35];
      }
      [(UIView *)v33 setOpaque:0];
      [(NUNIAstronomyVistaView *)v12 insertSubview:v33 aboveSubview:v12->_quadView0];
      v46[0] = v33;
      v46[1] = v12->_quadView0;
      uint64_t v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:2];
      quadViews = v12->_quadViews;
      v12->_quadViews = (NSArray *)v39;
    }
    else
    {
      v45 = v12->_quadView0;
      uint64_t v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
      v28 = v12->_quadViews;
      v12->_quadViews = (NSArray *)v36;
    }

    v12->_vista = -1;
    v12->_transitionStyle = 0;
    [(NUNIAstronomyVistaView *)v12 updateLightingPreference:0];
    *((unsigned char *)v12 + 488) |= 2u;
    v41 = [v10 initialSetupOperation];

    if (v41)
    {
      v42 = [v10 initialSetupOperation];
      ((void (**)(void, NUNIAstronomyVistaView *))v42)[2](v42, v12);
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
  uint64_t v14 = *MEMORY[0x263EF8340];
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

  uint64_t v5 = [MEMORY[0x263F32160] sharedInstance];
  [v5 purgeAllUnused];

  v6.receiver = self;
  v6.super_class = (Class)NUNIAstronomyVistaView;
  [(NUNIAstronomyVistaView *)&v6 dealloc];
}

- (void)purgeUnused
{
}

- (void)setCacheDirectory:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(NUNIRenderer *)self->_renderer resourceManager];
    uint64_t v5 = [v4 cloudsService];
    [v5 setDirectory:v6];
  }
}

- (void)disableCloudDataFetch:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(NUNIRenderer *)self->_renderer resourceManager];
    uint64_t v5 = [v6 cloudsService];
    [v5 setDisableFetch:v3];
  }
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
  CLKUIComputeDimmingRequiredToObtainQuadAPL();
  float v4 = v3;

  return v4;
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
    [(NUNIScene *)v5 setObserver:self];
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

- (void)updateSunLocationAnimated:(BOOL)a3 adjustEarthRotation:(BOOL)a4
{
}

- (void)_startAnimation
{
  if ([(CLKUIQuadView *)self->_quadView0 isPaused])
  {
    kdebug_trace();
    quadView0 = self->_quadView0;
    [(CLKUIQuadView *)quadView0 setPaused:0];
  }
}

- (void)_stopAnimation
{
  if (([(CLKUIQuadView *)self->_quadView0 isPaused] & 1) == 0)
  {
    [(CLKUIQuadView *)self->_quadView0 setPaused:1];
    kdebug_trace();
  }
}

- (void)startAnimation
{
  *((unsigned char *)self + 488) |= 4u;
  [(NUNIAstronomyVistaView *)self _updateAnimation];
}

- (void)stopAnimation
{
  *((unsigned char *)self + 488) &= ~4u;
  [(NUNIAstronomyVistaView *)self _updateAnimation];
}

- (void)_updateAnimation
{
  if ((*((unsigned char *)self + 488) & 4) != 0 && (*((unsigned char *)self + 488) & 2) != 0) {
    [(NUNIAstronomyVistaView *)self _startAnimation];
  }
  else {
    [(NUNIAstronomyVistaView *)self _stopAnimation];
  }
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
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[CLKUIQuadView setFrame:](self->_quadView0, "setFrame:");
  if (self->_quadView1)
  {
    -[CALayer setFrame:](self->_contentMaskLayer, "setFrame:", v4, v6, v8, v10);
    -[UIView setFrame:](self->_quadView1, "setFrame:", 0.0, 0.0, v8, floor(v10 / 3.0));
    portalLayer = self->_portalLayer;
    if (portalLayer) {
      -[CAPortalLayer setFrame:](portalLayer, "setFrame:", v4, v6, v8, v10);
    }
  }
}

- (void)updatePortalLayerBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(NUNIAstronomyVistaView *)self bounds];
  if (self->_quadView1)
  {
    double v12 = v8;
    double v13 = v9;
    double v14 = v10;
    double v15 = v11;
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    -[CALayer setFrame:](self->_contentMaskLayer, "setFrame:", v12, v13, v14, v15);
    -[UIView setFrame:](self->_quadView1, "setFrame:", x, y, width, height);
    [(UIView *)self->_quadView1 setClipsToBounds:1];
    portalLayer = self->_portalLayer;
    if (portalLayer) {
      -[CAPortalLayer setFrame:](portalLayer, "setFrame:", -x, -y, v14, v15);
    }
    v17 = (void *)MEMORY[0x263F158F8];
    [v17 commit];
  }
}

- (id)rotatable:(unint64_t)a3
{
  if (a3 <= 9 && ((0x3FBu >> a3) & 1) != 0)
  {
    double v5 = -[NUNIScene spheroidOfType:](self->_scene, "spheroidOfType:", qword_21E8F1D58[a3], v3);
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

- (void)showSupplemental:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v105 = *MEMORY[0x263EF8340];
  char v7 = *((unsigned char *)self + 488);
  v89 = self->_scene;
  if (v89 && ((((v7 & 1) == 0) ^ v5) & 1) == 0)
  {
    *((unsigned char *)self + 488) = *((unsigned char *)self + 488) & 0xFE | v5;
    if (v5)
    {
      [(NUNIAstronomyVistaView *)self supplementalSpheroidSize];
      float v9 = v8;
      [(CLKDevice *)self->_device screenBounds];
      double v11 = v10;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      id obj = [(NUNIScene *)v89 spheroids];
      uint64_t v12 = [obj countByEnumeratingWithState:&v99 objects:v104 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        double v14 = 0;
        float v15 = v9 / v11;
        uint64_t v86 = *(void *)v100;
        float v85 = v15;
        float v84 = v15 * 0.5;
        while (1)
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v100 != v86) {
              objc_enumerationMutation(obj);
            }
            v17 = *(void **)(*((void *)&v99 + 1) + 8 * v16);
            uint64_t v18 = [v17 type];
            int v19 = 1 << v18;
            LODWORD(v20) = 897988541;
            if (v18 != 4)
            {
              float v21 = v85;
              if ((v19 & 0x3000) != 0 || (float v21 = v84, ((1 << v18) & 0xFBFBFE) != 0))
              {
                objc_msgSend(v17, "radius", v20);
                *(float *)&double v20 = v21 / *(float *)&v20;
              }
              else
              {
                LODWORD(v20) = 1.0;
              }
            }
            double v90 = v20;
            [v17 radiusScale];
            BOOL v23 = v22 == *(float *)&v90;
            double v24 = v90;
            if (!v23)
            {
              if (v4)
              {
                v25 = [[NUNIAnimation alloc] initWithAnimatable:v17 value:7 key:*(double *)vdupq_lane_s32(*(int32x2_t *)&v90, 0).i64];

                LODWORD(v26) = 1062557008;
                [(NUNIAnimation *)v25 setDuration:v26];
                [(NUNIScene *)v89 addAnimation:v25];
                double v14 = v25;
              }
              else
              {
                [v17 setRadiusScale:v90];
              }
            }
            if (((1 << v18) & 0xFFF000) == 0)
            {
              objc_msgSend(v17, "opacity", v24);
              if (*(float *)&v35 == 0.0) {
                goto LABEL_40;
              }
              int32x2_t v36 = 0;
              if (v4) {
                goto LABEL_37;
              }
LABEL_39:
              LODWORD(v35) = v36.i32[0];
              [v17 setOpacity:v35];
              goto LABEL_40;
            }
            if ((v19 & 0x3000) != 0) {
              unint64_t v27 = 7;
            }
            else {
              unint64_t v27 = v18 - 14;
            }
            if (v27 <= 3) {
              uint64_t v28 = 0;
            }
            else {
              uint64_t v28 = -1;
            }
            if ([(NUNIAstronomyVistaConfiguration *)self->_configuration isRTLLayout])
            {
              [(CLKDevice *)self->_device screenBounds];
              double v30 = v29;
              [(NUNIAstronomyVistaView *)self supplementalHorizontalInset];
              double v32 = v30 - v31;
              [(NUNIAstronomyVistaView *)self supplementalSpheroidSize];
              float v34 = v32 + (float)(v33 * -0.5);
            }
            else
            {
              [(NUNIAstronomyVistaView *)self supplementalHorizontalInset];
              float v38 = v37;
              [(NUNIAstronomyVistaView *)self supplementalSpheroidSize];
              float v34 = v38 + (float)(v39 * 0.5);
            }
            [(CLKDevice *)self->_device screenBounds];
            double v41 = v40;
            [(NUNIAstronomyVistaView *)self supplementalTopInset];
            double v43 = v41 - v42;
            [(NUNIAstronomyVistaView *)self supplementalBottomInset];
            double v45 = (v43 - v44) / 7.0;
            [(NUNIAstronomyVistaView *)self supplementalTopInset];
            float v47 = v46 + v45 * (double)(v27 + v28 - 1);
            [(CLKDevice *)self->_device screenBounds];
            double v49 = v48;
            [(CLKDevice *)self->_device screenBounds];
            *(float *)&double v49 = v49 / v50;
            [(CLKDevice *)self->_device screenBounds];
            double v91 = v34 / v51;
            [(CLKDevice *)self->_device screenBounds];
            v53.f64[0] = v91;
            v53.f64[1] = (v47 / v52 + -0.5) * (float)-*(float *)&v49 + 0.5;
            float32x2_t v54 = vadd_f32(vcvt_f32_f64(v53), (float32x2_t)0xBF000000BF000000);
            *(float32x2_t *)&v53.f64[0] = vmul_f32(v54, v54);
            *(float *)v53.f64 = sqrtf(vmlas_n_f32(*((float *)v53.f64 + 1), v54.f32[0], v54.f32[0]));
            double v92 = v53.f64[0];
            float32x2_t v88 = vdiv_f32(v54, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v53.f64[0], 0));
            [v17 angle];
            LODWORD(v49) = v55;
            *(float *)&double v56 = atan2f(v88.f32[1], v88.f32[0]);
            *(float *)&double v56 = *(float *)&v56 + (float)(floorf(*(float *)&v56 / 6.2832) * -6.2832);
            float v57 = vabds_f32(*(float *)&v56, *(float *)&v49);
            if (*(float *)&v49 >= *(float *)&v56) {
              float v58 = 6.2832;
            }
            else {
              float v58 = -6.2832;
            }
            BOOL v59 = v57 <= 3.1416;
            float v60 = -0.0;
            if (!v59) {
              float v60 = v58;
            }
            *(float *)&double v56 = *(float *)&v56 + v60;
            if (v4)
            {
              v61 = [[NUNIAnimation alloc] initWithAnimatable:v17 value:8 key:*(double *)vdupq_lane_s32(*(int32x2_t *)&v56, 0).i64];

              LODWORD(v62) = 1062557008;
              [(NUNIAnimation *)v61 setDuration:v62];
              [(NUNIScene *)v89 addAnimation:v61];
              double v14 = [[NUNIAnimation alloc] initWithAnimatable:v17 value:4 key:*(double *)vdupq_lane_s32(*(int32x2_t *)&v92, 0).i64];

              LODWORD(v63) = 1062557008;
              [(NUNIAnimation *)v14 setDuration:v63];
              [(NUNIScene *)v89 addAnimation:v14];
              [v17 opacity];
              v36.i32[0] = 1.0;
              if (v64 == 1.0) {
                goto LABEL_40;
              }
LABEL_37:
              v65 = [[NUNIAnimation alloc] initWithAnimatable:v17 value:9 key:*(double *)vdupq_lane_s32(v36, 0).i64];

              LODWORD(v66) = 1062557008;
              [(NUNIAnimation *)v65 setDuration:v66];
              [(NUNIScene *)v89 addAnimation:v65];
              double v14 = v65;
              goto LABEL_40;
            }
            [v17 setAngle:v56];
            [v17 setDistance:v92];
            [v17 opacity];
            v36.i32[0] = 1.0;
            if (*(float *)&v35 != 1.0) {
              goto LABEL_39;
            }
LABEL_40:
            ++v16;
          }
          while (v13 != v16);
          uint64_t v67 = [obj countByEnumeratingWithState:&v99 objects:v104 count:16];
          uint64_t v13 = v67;
          if (!v67) {
            goto LABEL_68;
          }
        }
      }
LABEL_67:
      double v14 = 0;
      goto LABEL_68;
    }
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    id obj = [(NUNIScene *)v89 spheroids];
    uint64_t v68 = [obj countByEnumeratingWithState:&v95 objects:v103 count:16];
    if (!v68) {
      goto LABEL_67;
    }
    uint64_t v69 = v68;
    double v14 = 0;
    uint64_t v70 = *(void *)v96;
    unint64_t v71 = 0x2644CD000uLL;
    do
    {
      for (uint64_t i = 0; i != v69; ++i)
      {
        if (*(void *)v96 != v70) {
          objc_enumerationMutation(obj);
        }
        v73 = *(void **)(*((void *)&v95 + 1) + 8 * i);
        int v74 = [v73 type];
        char v76 = v74;
        if (v74 == 4) {
          *(float *)&double v75 = 0.000001;
        }
        else {
          *(float *)&double v75 = 1.0;
        }
        double v93 = v75;
        [v73 radiusScale];
        if (*(float *)&v77 != *(float *)&v93)
        {
          if (v4)
          {
            unint64_t v78 = v71;
            v79 = (NUNIAnimation *)objc_msgSend(objc_alloc(*(Class *)(v71 + 1752)), "initWithAnimatable:value:key:", v73, 7, *(double *)vdupq_lane_s32(*(int32x2_t *)&v93, 0).i64);

            LODWORD(v80) = 1054168400;
            [(NUNIAnimation *)v79 setDuration:v80];
            [(NUNIScene *)v89 addAnimation:v79];
            double v14 = v79;
            unint64_t v71 = v78;
          }
          else
          {
            [v73 setRadiusScale:v93];
          }
        }
        if (((1 << v76) & 0xFFF400) != 0) {
          *(float *)&double v77 = 1.0;
        }
        else {
          *(float *)&double v77 = 0.0;
        }
        double v94 = v77;
        [v73 opacity];
        if (v81 != *(float *)&v94)
        {
          if (v4)
          {
            v82 = (NUNIAnimation *)objc_msgSend(objc_alloc(*(Class *)(v71 + 1752)), "initWithAnimatable:value:key:", v73, 9, *(double *)vdupq_lane_s32(*(int32x2_t *)&v94, 0).i64);

            LODWORD(v83) = 1062557008;
            [(NUNIAnimation *)v82 setDuration:v83];
            [(NUNIScene *)v89 addAnimation:v82];
            double v14 = v82;
          }
          else
          {
            [v73 setOpacity:v94];
          }
        }
      }
      uint64_t v69 = [obj countByEnumeratingWithState:&v95 objects:v103 count:16];
    }
    while (v69);
LABEL_68:
  }
}

- (id)generateAnimationArrayFromVista:(unint64_t)a3 toVista:(unint64_t)a4 transitionStyle:(unint64_t)a5
{
  if (a3 == a4)
  {
    char v7 = (void *)MEMORY[0x263EFFA68];
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
  uint64_t v13 = +[NUNISceneUpdateDescription descriptionWithVista:a3 updateBlock:a4];
  double v14 = +[NUNISceneUpdateDescription descriptionWithVista:a5 updateBlock:v12];

  float v15 = [(NUNIAstronomyVistaView *)self generateAnimationArrayFromSceneDescription:v13 toSceneDescription:v14 transitionStyle:a7];

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
    double v11 = (void *)v10;
    goto LABEL_7;
  }
  double v11 = (void *)MEMORY[0x263EFFA68];
LABEL_7:

  return v11;
}

- (id)_panAnimationArrayFromSceneDescription:(id)a3 toSceneDescription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 vista];
  uint64_t v9 = [v7 vista];
  if (v8 == 2 || (uint64_t v10 = v9, v9 == 2))
  {
    double v20 = [(NUNIAstronomyVistaView *)self _zoomAnimationArrayFromSceneDescription:v6 toSceneDescription:v7];
  }
  else
  {
    double v11 = self->_scene;
    id v12 = [(NUNIScene *)v11 packIntoBlob];
    uint64_t v13 = [(NUNIScene *)v11 date];
    [(NUNIAstronomyVistaView *)self applyVista:v8 transitionStyle:1];
    [(NUNIScene *)v11 updateSunLocationForDate:v13 animated:0 lightingPreference:self->_preferredCarouselLighting adjustEarthRotation:1];
    uint64_t v14 = [v6 updateBlock];
    float v15 = (void *)v14;
    if (v14) {
      (*(void (**)(uint64_t, NUNIScene *))(v14 + 16))(v14, v11);
    }
    [(NUNIScene *)v11 updateCamera];
    uint64_t v16 = [(NUNIScene *)v11 packIntoBlob];
    [(NUNIAstronomyVistaView *)self applyVista:v10 transitionStyle:1];
    [(NUNIScene *)v11 updateSunLocationForDate:v13 animated:0 lightingPreference:self->_preferredCarouselLighting adjustEarthRotation:1];
    uint64_t v17 = [v7 updateBlock];
    uint64_t v18 = (void *)v17;
    if (v17) {
      (*(void (**)(uint64_t, NUNIScene *))(v17 + 16))(v17, v11);
    }
    [(NUNIScene *)v11 updateCamera];
    int v19 = [(NUNIScene *)v11 packIntoBlob];
    double v20 = NUNIAstronomyVistaView_GenerateCarouselAnimationArrayFromSceneBlob(v11, v16, v19);
    [(NUNIScene *)v11 unpackFromBlob:v12];
  }
  return v20;
}

- (id)_zoomAnimationArrayFromSceneDescription:(id)a3 toSceneDescription:(id)a4
{
  id v7 = self->_scene;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(NUNIScene *)v7 packIntoBlob];
  double v11 = [(NUNIScene *)v7 date];
  -[NUNIAstronomyVistaView applyVista:transitionStyle:](self, "applyVista:transitionStyle:", [v9 vista], 0);
  [(NUNIScene *)v7 updateSunLocationForDate:v11 animated:0 lightingPreference:0 adjustEarthRotation:1];
  id v12 = [v9 updateBlock];

  if (v12)
  {
    ((void (**)(void, NUNIScene *))v12)[2](v12, v7);
    [(NUNIScene *)v7 updateCamera];
  }
  uint64_t v13 = [(NUNIScene *)v7 packIntoBlob];
  -[NUNIAstronomyVistaView applyVista:transitionStyle:](self, "applyVista:transitionStyle:", [v8 vista], 0);
  [(NUNIScene *)v7 updateSunLocationForDate:v11 animated:0 lightingPreference:0 adjustEarthRotation:1];
  uint64_t v14 = [v8 updateBlock];

  if (v14)
  {
    ((void (**)(void, NUNIScene *))v14)[2](v14, v7);
    [(NUNIScene *)v7 updateCamera];
  }
  float v15 = [(NUNIScene *)v7 packIntoBlob];
  uint64_t v16 = NUNIAstronomyVistaView_GenerateZoomAnimationArrayFromSceneBlob(v7, v13, v15);
  [(NUNIScene *)v7 unpackFromBlob:v10];

  return v16;
}

- (void)applyVista:(unint64_t)a3 transitionStyle:(unint64_t)a4
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  self->_vista = a3;
  self->_transitionStyle = a4;
  if (a3 <= 9)
  {
    unint64_t v5 = a3;
    id v7 = self->_scene;
    id v8 = v7;
    if (v7)
    {
      switch(v5)
      {
        case 1uLL:
          uint64_t v9 = 16;
          unint64_t v5 = 4;
          goto LABEL_32;
        case 2uLL:
          uint64_t v10 = [(NUNIQuad *)self->_quad renderer];
          uint64_t v11 = [v10 rendererStyle];

          if (v11 == 3)
          {
            long long v64 = 0uLL;
            long long v65 = 0uLL;
            long long v62 = 0uLL;
            long long v63 = 0uLL;
            id v12 = [(NUNIScene *)v8 spheroids];
            uint64_t v13 = [v12 countByEnumeratingWithState:&v62 objects:v68 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              float v15 = v8;
              uint64_t v16 = *(void *)v63;
              do
              {
                for (uint64_t i = 0; i != v14; ++i)
                {
                  if (*(void *)v63 != v16) {
                    objc_enumerationMutation(v12);
                  }
                  uint64_t v18 = *(void **)(*((void *)&v62 + 1) + 8 * i);
                  uint64_t v19 = [v18 structure];
                  uint64_t v22 = v19;
                  int v23 = *(_DWORD *)v19;
                  if (*(_DWORD *)v19 == 4) {
                    float v24 = 0.000001;
                  }
                  else {
                    float v24 = 1.0;
                  }
                  if (*(float *)(v19 + 88) != v24) {
                    objc_msgSend(v18, "setRadiusScale:");
                  }
                  int v25 = 1 << v23;
                  if ((v25 & 0x47FE) != 0) {
                    float v26 = 1.0;
                  }
                  else {
                    float v26 = 0.0;
                  }
                  if (*(float *)(v22 + 48) != v26) {
                    objc_msgSend(v18, "setOpacity:");
                  }
                  v20.i64[0] = 0;
                  v21.i64[0] = v25 & 0x3FE;
                  objc_msgSend(v18, "setOrientation:", *(double *)vbslq_s8((int8x16_t)vdupq_lane_s64(vceqq_s64(v21, v20).i64[0], 0), (int8x16_t)xmmword_21E8F1CC0, (int8x16_t)xmmword_21E8F1CB0).i64);
                  LODWORD(v27) = 1.0;
                  [v18 setDistanceScale:v27];
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v62 objects:v68 count:16];
              }
              while (v14);
              id v8 = v15;
            }
          }
          else
          {
            long long v60 = 0uLL;
            long long v61 = 0uLL;
            long long v58 = 0uLL;
            long long v59 = 0uLL;
            id v12 = [(NUNIScene *)v8 spheroids];
            uint64_t v42 = [v12 countByEnumeratingWithState:&v58 objects:v67 count:16];
            if (v42)
            {
              uint64_t v43 = v42;
              uint64_t v44 = *(void *)v59;
              do
              {
                for (uint64_t j = 0; j != v43; ++j)
                {
                  if (*(void *)v59 != v44) {
                    objc_enumerationMutation(v12);
                  }
                  float v46 = *(void **)(*((void *)&v58 + 1) + 8 * j);
                  int v47 = [v46 type];
                  char v48 = v47;
                  if (v47 == 4) {
                    float v49 = 0.000001;
                  }
                  else {
                    float v49 = 1.0;
                  }
                  [v46 radiusScale];
                  if (*(float *)&v50 != v49)
                  {
                    *(float *)&double v50 = v49;
                    [v46 setRadiusScale:v50];
                  }
                  if (((1 << v48) & 0xFFF400) != 0) {
                    float v51 = 1.0;
                  }
                  else {
                    float v51 = 0.0;
                  }
                  [v46 opacity];
                  if (*(float *)&v52 != v51)
                  {
                    *(float *)&double v52 = v51;
                    [v46 setOpacity:v52];
                  }
                }
                uint64_t v43 = [v12 countByEnumeratingWithState:&v58 objects:v67 count:16];
              }
              while (v43);
            }
          }
          unint64_t v5 = 24;
          goto LABEL_52;
        case 3uLL:
          uint64_t v9 = 2097280;
          unint64_t v5 = 7;
          goto LABEL_32;
        case 4uLL:
          uint64_t v9 = 32770;
          unint64_t v5 = 1;
          goto LABEL_32;
        case 5uLL:
          uint64_t v9 = 65540;
          unint64_t v5 = 2;
          goto LABEL_32;
        case 6uLL:
          uint64_t v9 = 524320;
          unint64_t v5 = 5;
          goto LABEL_32;
        case 7uLL:
          uint64_t v9 = 1048640;
          unint64_t v5 = 6;
          goto LABEL_32;
        case 8uLL:
          uint64_t v9 = 4194560;
          goto LABEL_32;
        case 9uLL:
          uint64_t v9 = 8389120;
          goto LABEL_32;
        default:
          uint64_t v9 = 131080;
          unint64_t v5 = 3;
LABEL_32:
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v12 = [(NUNIScene *)v7 spheroids];
          uint64_t v28 = [v12 countByEnumeratingWithState:&v54 objects:v66 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            unint64_t v53 = v5;
            uint64_t v30 = *(void *)v55;
            uint64_t v31 = v9 | 0x400;
            uint64_t v32 = v9 & 0x3FE;
            if (a4 == 1) {
              float v33 = 0.0001;
            }
            else {
              float v33 = 1.0;
            }
            do
            {
              for (uint64_t k = 0; k != v29; ++k)
              {
                if (*(void *)v55 != v30) {
                  objc_enumerationMutation(v12);
                }
                double v35 = *(void **)(*((void *)&v54 + 1) + 8 * k);
                uint64_t v36 = [v35 structure];
                uint64_t v37 = v36;
                uint64_t v38 = (1 << *(_DWORD *)v36);
                if ((v31 & v38) != 0) {
                  float v39 = 1.0;
                }
                else {
                  float v39 = 0.000001;
                }
                if (*(float *)(v36 + 88) != v39) {
                  objc_msgSend(v35, "setRadiusScale:");
                }
                if ((v32 & v38) != 0) {
                  float v40 = 1.0;
                }
                else {
                  float v40 = 0.0;
                }
                if (*(float *)(v37 + 48) != v40) {
                  objc_msgSend(v35, "setOpacity:");
                }
                [v35 setOrientation:*(double *)&_PromotedConst];
                *(float *)&double v41 = v33;
                [v35 setDistanceScale:v41];
              }
              uint64_t v29 = [v12 countByEnumeratingWithState:&v54 objects:v66 count:16];
            }
            while (v29);
            unint64_t v5 = v53;
          }
LABEL_52:

          [(NUNIScene *)v8 setSnap:v5];
          break;
      }
    }
  }
}

- (void)astronomySceneAnimationFinished:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  [WeakRetained astronomyVistaViewContentsAnimationFinished:self];
}

- (void)quadViewWillDisplay:(id)a3 forTime:(double)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  [WeakRetained astronomyVistaViewWillDisplay:self forTime:a4];
}

- (id)contentMaskLayer
{
  return self->_contentMaskLayer;
}

- (id)spheroidAtPoint:(CGPoint)a3
{
  return -[NUNIQuad spheroidAtPoint:](self->_quad, "spheroidAtPoint:", a3.x, a3.y);
}

- (void)updateLightingPreference:(BOOL)a3
{
  if (a3)
  {
    unint64_t v4 = 0;
  }
  else
  {
    self->_preferredCarouselLighting = 1;
    if (objc_msgSend(MEMORY[0x263F82E00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[NUNIAstronomyVistaView semanticContentAttribute](self, "semanticContentAttribute")) != 1)return; {
    unint64_t v4 = 2;
    }
  }
  self->_preferredCarouselLighting = v4;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quadViews, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_portalLayer, 0);
  objc_storeStrong((id *)&self->_contentMaskLayer, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->_quadView1, 0);
  objc_storeStrong((id *)&self->_quadView0, 0);
}

@end