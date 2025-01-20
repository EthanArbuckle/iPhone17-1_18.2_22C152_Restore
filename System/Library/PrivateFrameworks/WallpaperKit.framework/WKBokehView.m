@interface WKBokehView
+ (id)thumbnailImageWithBokehInput:(id)a3;
- (CATransform3D)_contentTransform;
- (WKBokehView)initWithBokehWallpaperInput:(id)a3;
- (WKBokehWallpaperInput)bokehWallpaperInput;
- (double)_parallaxTransform;
- (void)_disableAnimation;
- (void)_enableAnimation;
- (void)_screenDidUpdate:(id)a3;
- (void)_updateRenderForCurrentBokehWallpaperInput;
- (void)layoutSubviews;
- (void)setAnimationEnabled:(BOOL)a3;
- (void)setBokehWallpaperInput:(id)a3;
@end

@implementation WKBokehView

- (WKBokehView)initWithBokehWallpaperInput:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)WKBokehView;
  v5 = -[WKBokehView initWithFrame:](&v25, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bokehWallpaperInput = v5->_bokehWallpaperInput;
    v5->_bokehWallpaperInput = (WKBokehWallpaperInput *)v6;

    v8 = objc_alloc_init(WKBokehMotionFilter);
    motionFilter = v5->_motionFilter;
    v5->_motionFilter = v8;

    v10 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E4F39BD0]);
    contentLayer = v5->_contentLayer;
    v5->_contentLayer = v10;

    v12 = [(WKBokehView *)v5 layer];
    [v12 addSublayer:v5->_contentLayer];

    displayLink = v5->_displayLink;
    v5->_displayLink = 0;

    -[WKBokehView _disableAnimation]((uint64_t)v5);
    [(WKBokehView *)v5 setAutoresizingMask:18];
    unsigned int v24 = [(WKBokehWallpaperInput *)v5->_bokehWallpaperInput thumbnailSeed];
    [(WKBokehWallpaperInput *)v5->_bokehWallpaperInput bubbleScale];
    CGFloat v15 = v14;
    uint64_t v16 = [(WKBokehWallpaperInput *)v5->_bokehWallpaperInput bubbleCount];
    memset(&v23, 0, sizeof(v23));
    CATransform3DMakeScale(&v23, v15, v15, 1.0);
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    bubbles = v5->_bubbles;
    v5->_bubbles = v17;

    for (; v16; --v16)
    {
      v19 = -[WKBokehBubble initWithSeed:]([WKBokehBubble alloc], &v24);
      CATransform3D v22 = v23;
      [v19 setTransform:&v22];
      [(CAGradientLayer *)v5->_contentLayer addSublayer:v19];
      [(NSMutableArray *)v5->_bubbles addObject:v19];
    }
    -[WKBokehView _updateRenderForCurrentBokehWallpaperInput]((id *)&v5->super.super.super.isa);
    v20 = [MEMORY[0x1E4FB1618] clearColor];
    [(WKBokehView *)v5 setBackgroundColor:v20];
  }
  return v5;
}

- (void)_disableAnimation
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = WKLogForCategory(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136446210;
      v7 = "-[WKBokehView _disableAnimation]";
      _os_log_impl(&dword_1BE13A000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: start.", (uint8_t *)&v6, 0xCu);
    }

    [*(id *)(a1 + 432) invalidate];
    v3 = *(void **)(a1 + 432);
    *(void *)(a1 + 432) = 0;

    -[WKBokehMotionFilter pauseDeviceMotionUpdates](*(void **)(a1 + 408));
    [*(id *)(a1 + 416) convertTime:0 fromLayer:CACurrentMediaTime()];
    double v5 = v4;
    [*(id *)(a1 + 416) setSpeed:0.0];
    [*(id *)(a1 + 416) setTimeOffset:v5];
    __32__WKBokehView__disableAnimation__block_invoke();
  }
}

- (void)_updateRenderForCurrentBokehWallpaperInput
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [a1 bokehWallpaperInput];
    v3 = [v2 backgroundColors];
    double v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_9);

    [a1[52] setColors:v4];
    double v5 = [a1 bokehWallpaperInput];
    int v6 = [v5 bubbleColors];

    v7 = [a1 bokehWallpaperInput];
    unsigned int v8 = [v7 thumbnailSeed];

    unsigned int v20 = v8;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = a1[53];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
          CGFloat v15 = objc_msgSend(v6, "objectAtIndex:", vcvtms_u32_f32((float)((float)((float)rand_r(&v20) * 4.6566e-10)* (float)(unint64_t)objc_msgSend(v6, "count", (void)v16))+ 0.0));
          objc_msgSend(v14, "setContentsMultiplyColor:", objc_msgSend(v15, "cgColor"));

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v11);
    }
  }
}

- (void)setBokehWallpaperInput:(id)a3
{
  id v6 = a3;
  if (([v6 isEqual:self->_bokehWallpaperInput] & 1) == 0)
  {
    double v4 = (WKBokehWallpaperInput *)[v6 copy];
    bokehWallpaperInput = self->_bokehWallpaperInput;
    self->_bokehWallpaperInput = v4;

    -[WKBokehView _updateRenderForCurrentBokehWallpaperInput]((id *)&self->super.super.super.isa);
  }
}

uint64_t __57__WKBokehView__updateRenderForCurrentBokehWallpaperInput__block_invoke(uint64_t a1, void *a2)
{
  return [a2 cgColor];
}

- (void)setAnimationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  double v5 = WKLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v10 = "-[WKBokehView setAnimationEnabled:]";
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl(&dword_1BE13A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: start %d.", buf, 0x12u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__WKBokehView_setAnimationEnabled___block_invoke;
  aBlock[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v8 = v3;
  id v6 = (void (**)(void))_Block_copy(aBlock);
  if ((((self->_displayLink == 0) ^ v3) & 1) == 0)
  {
    if (v3) {
      -[WKBokehView _enableAnimation]((uint64_t)self);
    }
    else {
      -[WKBokehView _disableAnimation]((uint64_t)self);
    }
  }
  v6[2](v6);
}

void __35__WKBokehView_setAnimationEnabled___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = WKLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 32);
    int v4 = 136446466;
    double v5 = "-[WKBokehView setAnimationEnabled:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = v3;
    _os_log_impl(&dword_1BE13A000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: complete %d.", (uint8_t *)&v4, 0x12u);
  }
}

- (void)_enableAnimation
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = WKLogForCategory(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136446210;
      BOOL v12 = "-[WKBokehView _enableAnimation]";
      _os_log_impl(&dword_1BE13A000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: start.", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v3 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:a1 selector:sel__screenDidUpdate_];
    int v4 = *(void **)(a1 + 432);
    *(void *)(a1 + 432) = v3;

    double v5 = *(void **)(a1 + 432);
    CAFrameRateRange v14 = CAFrameRateRangeMake(30.0, 120.0, 40.0);
    objc_msgSend(v5, "setPreferredFrameRateRange:", *(double *)&v14.minimum, *(double *)&v14.maximum, *(double *)&v14.preferred);
    __int16 v6 = *(void **)(a1 + 432);
    int v7 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v6 addToRunLoop:v7 forMode:*MEMORY[0x1E4F1C4B0]];

    -[WKBokehMotionFilter startDeviceMotionUpdates](*(void *)(a1 + 408));
    [*(id *)(a1 + 416) timeOffset];
    double v9 = v8;
    LODWORD(v8) = 1.0;
    [*(id *)(a1 + 416) setSpeed:v8];
    [*(id *)(a1 + 416) setTimeOffset:0.0];
    [*(id *)(a1 + 416) setBeginTime:0.0];
    [*(id *)(a1 + 416) convertTime:0 fromLayer:CACurrentMediaTime()];
    [*(id *)(a1 + 416) setBeginTime:v10 - v9];
    __31__WKBokehView__enableAnimation__block_invoke();
  }
}

void __31__WKBokehView__enableAnimation__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = WKLogForCategory(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446210;
    v2 = "-[WKBokehView _enableAnimation]_block_invoke";
    _os_log_impl(&dword_1BE13A000, v0, OS_LOG_TYPE_DEFAULT, "%{public}s: complete.", (uint8_t *)&v1, 0xCu);
  }
}

void __32__WKBokehView__disableAnimation__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = WKLogForCategory(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446210;
    v2 = "-[WKBokehView _disableAnimation]_block_invoke";
    _os_log_impl(&dword_1BE13A000, v0, OS_LOG_TYPE_DEFAULT, "%{public}s: complete.", (uint8_t *)&v1, 0xCu);
  }
}

- (void)_screenDidUpdate:(id)a3
{
  *(void *)&double v4 = *(_OWORD *)&-[WKBokehMotionFilter updatePosition]((uint64_t)self->_motionFilter);
  [(WKBokehView *)self setNeedsLayout];
}

- (CATransform3D)_contentTransform
{
  if (result)
  {
    [(CATransform3D *)result bounds];
    double v5 = (long long *)MEMORY[0x1E4F39B10];
    if (v3 >= v4) {
      double v6 = v3;
    }
    else {
      double v6 = v4;
    }
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    a2[4] = v7;
    a2[5] = v8;
    long long v9 = v5[6];
    long long v10 = v5[7];
    a2[6] = v9;
    a2[7] = v10;
    long long v11 = *v5;
    long long v12 = v5[1];
    *a2 = *v5;
    a2[1] = v12;
    long long v13 = v5[2];
    long long v14 = v5[3];
    a2[2] = v13;
    a2[3] = v14;
    *(_OWORD *)&v27.m31 = v7;
    *(_OWORD *)&v27.m33 = v8;
    *(_OWORD *)&v27.m41 = v9;
    *(_OWORD *)&v27.m43 = v10;
    *(_OWORD *)&v27.m11 = v11;
    *(_OWORD *)&v27.m13 = v12;
    *(_OWORD *)&v27.m21 = v13;
    *(_OWORD *)&v27.m23 = v14;
    CATransform3DTranslate(&v28, &v27, v3 * 0.5, v4 * 0.5, 0.0);
    long long v15 = *(_OWORD *)&v28.m33;
    a2[4] = *(_OWORD *)&v28.m31;
    a2[5] = v15;
    long long v16 = *(_OWORD *)&v28.m43;
    a2[6] = *(_OWORD *)&v28.m41;
    a2[7] = v16;
    long long v17 = *(_OWORD *)&v28.m13;
    *a2 = *(_OWORD *)&v28.m11;
    a2[1] = v17;
    long long v18 = *(_OWORD *)&v28.m23;
    a2[2] = *(_OWORD *)&v28.m21;
    a2[3] = v18;
    long long v19 = a2[5];
    *(_OWORD *)&v27.m31 = a2[4];
    *(_OWORD *)&v27.m33 = v19;
    long long v20 = a2[7];
    *(_OWORD *)&v27.m41 = a2[6];
    *(_OWORD *)&v27.m43 = v20;
    long long v21 = a2[1];
    *(_OWORD *)&v27.m11 = *a2;
    *(_OWORD *)&v27.m13 = v21;
    long long v22 = a2[3];
    *(_OWORD *)&v27.m21 = a2[2];
    *(_OWORD *)&v27.m23 = v22;
    result = CATransform3DScale(&v28, &v27, v6 * 0.5, v6 * 0.5, 1.0);
    long long v23 = *(_OWORD *)&v28.m33;
    a2[4] = *(_OWORD *)&v28.m31;
    a2[5] = v23;
    long long v24 = *(_OWORD *)&v28.m43;
    a2[6] = *(_OWORD *)&v28.m41;
    a2[7] = v24;
    long long v25 = *(_OWORD *)&v28.m13;
    *a2 = *(_OWORD *)&v28.m11;
    a2[1] = v25;
    long long v26 = *(_OWORD *)&v28.m23;
    a2[2] = *(_OWORD *)&v28.m21;
    a2[3] = v26;
  }
  else
  {
    a2[6] = 0u;
    a2[7] = 0u;
    a2[4] = 0u;
    a2[5] = 0u;
    a2[2] = 0u;
    a2[3] = 0u;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

- (double)_parallaxTransform
{
  if (a1)
  {
    v2 = (_OWORD *)MEMORY[0x1E4F39B10];
    long long v3 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    *a2 = *MEMORY[0x1E4F39B10];
    a2[1] = v4;
    long long v6 = v2[3];
    long long v5 = v2[4];
    a2[2] = v2[2];
    a2[3] = v6;
    a2[4] = v5;
    a2[5] = xmmword_1BE1D2210;
    double result = 0.375;
    a2[6] = v3;
    a2[7] = xmmword_1BE1D2220;
  }
  else
  {
    double result = 0.0;
    a2[6] = 0u;
    a2[7] = 0u;
    a2[4] = 0u;
    a2[5] = 0u;
    a2[2] = 0u;
    a2[3] = 0u;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)WKBokehView;
  [(WKBokehView *)&v17 layoutSubviews];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  memset(&v16, 0, sizeof(v16));
  [(WKBokehView *)(CATransform3D *)self _contentTransform];
  -[CAGradientLayer setBounds:](self->_contentLayer, "setBounds:", -1.0, -1.0, 2.0, 2.0);
  contentLayer = self->_contentLayer;
  CATransform3D v15 = v16;
  [(CAGradientLayer *)contentLayer setTransform:&v15];
  long long v4 = [(WKBokehView *)self bokehWallpaperInput];
  [v4 parallaxMultiplier];
  double v6 = v5;

  double v7 = -[WKBokehMotionFilter position]((uint64_t)self->_motionFilter);
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  *(_OWORD *)&v13.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  *(_OWORD *)&v13.m23 = v9;
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  *(_OWORD *)&v13.m11 = *MEMORY[0x1E4F39B10];
  *(_OWORD *)&v13.m13 = v11;
  *(_OWORD *)&v13.m31 = v10;
  *(_OWORD *)&v13.m33 = xmmword_1BE1D2210;
  *(_OWORD *)&v13.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  *(_OWORD *)&v13.m43 = xmmword_1BE1D2220;
  CATransform3DTranslate(&v15, &v13, v6 * v7, v6 * v8, 0.0);
  *(_OWORD *)&v13.m21 = *(_OWORD *)&v15.m21;
  *(_OWORD *)&v13.m23 = *(_OWORD *)&v15.m23;
  *(_OWORD *)&v13.m31 = *(_OWORD *)&v15.m31;
  *(_OWORD *)&v13.m11 = *(_OWORD *)&v15.m11;
  *(_OWORD *)&v13.m13 = *(_OWORD *)&v15.m13;
  long long v12 = self->_contentLayer;
  long long v14 = *(_OWORD *)&v15.m41;
  -[CAGradientLayer setSublayerTransform:](v12, "setSublayerTransform:", &v15, *(void *)&v15.m11, *(void *)&v15.m12, *(void *)&v15.m13, *(void *)&v15.m14, *(void *)&v15.m21, *(void *)&v15.m22, *(void *)&v15.m23, *(void *)&v15.m24, *(void *)&v15.m31, *(void *)&v15.m32);
  [MEMORY[0x1E4F39CF8] commit];
}

+ (id)thumbnailImageWithBokehInput:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v4 = WKLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.m11) = 136446210;
    *(void *)((char *)&buf.m11 + 4) = "+[WKBokehView thumbnailImageWithBokehInput:]";
    _os_log_impl(&dword_1BE13A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: start.", (uint8_t *)&buf, 0xCu);
  }

  double v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  double v6 = [v5 fixedCoordinateSpace];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  long long v11 = [[WKBokehView alloc] initWithBokehWallpaperInput:v3];
  p_isa = (id *)&v11->super.super.super.isa;
  double v38 = v10 / 3.0;
  double v39 = v8 / 3.0;
  if (v8 / 3.0 >= v10 / 3.0) {
    double v13 = v8 / 3.0;
  }
  else {
    double v13 = v10 / 3.0;
  }
  -[WKBokehView setFrame:](v11, "setFrame:", 0.0, 0.0, v13, v13);
  if (p_isa)
  {
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    long long v16 = *MEMORY[0x1E4F39B10];
    long long v49 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    long long v50 = v14;
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    long long v51 = v15;
    long long v52 = v17;
    CGFloat v18 = 0.375;
    CGFloat v19 = -1.0;
    long long v47 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    long long v48 = v16;
    CGFloat v20 = -0.25;
  }
  else
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v48 = 0u;
    CGFloat v20 = 0.0;
    CGFloat v19 = 0.0;
    CGFloat v18 = 0.0;
    long long v47 = 0uLL;
  }
  id v21 = p_isa[52];
  long long v22 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&buf.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&buf.m33 = v22;
  long long v23 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  *(_OWORD *)&buf.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  *(_OWORD *)&buf.m43 = v23;
  long long v24 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  *(_OWORD *)&buf.m11 = *MEMORY[0x1E4F39B10];
  *(_OWORD *)&buf.m13 = v24;
  long long v25 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  *(_OWORD *)&buf.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  *(_OWORD *)&buf.m23 = v25;
  [v21 setSublayerTransform:&buf];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v26 = [p_isa[52] sublayers];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v44 != v28) {
          objc_enumerationMutation(v26);
        }
        v30 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        [v30 zPosition];
        CGFloat v32 = v31;
        [v30 frame];
        *(_OWORD *)&v42.m21 = v50;
        *(_OWORD *)&v42.m23 = v51;
        *(_OWORD *)&v42.m31 = v52;
        *(_OWORD *)&v42.m11 = v48;
        *(_OWORD *)&v42.m13 = v49;
        memset(&buf, 0, sizeof(buf));
        v42.m33 = v20;
        v42.m34 = v19;
        *(_OWORD *)&v42.m41 = v47;
        v42.m43 = v18;
        v42.m44 = 0.0;
        CATransform3DTranslate(&buf, &v42, 0.0, 0.0, v32);
        CATransform3D v42 = buf;
        CA_CGRectApplyTransform();
        objc_msgSend(v30, "setFrame:");
        LODWORD(v33) = 1.0;
        [v30 setOpacity:v33];
      }
      uint64_t v27 = [v26 countByEnumeratingWithState:&v43 objects:v53 count:16];
    }
    while (v27);
  }

  v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", v39, v38);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __44__WKBokehView_thumbnailImageWithBokehInput___block_invoke_22;
  v40[3] = &unk_1E6376C48;
  v35 = p_isa;
  v41 = v35;
  v36 = [v34 imageWithActions:v40];

  __44__WKBokehView_thumbnailImageWithBokehInput___block_invoke();
  return v36;
}

void __44__WKBokehView_thumbnailImageWithBokehInput___block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = WKLogForCategory(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446210;
    v2 = "+[WKBokehView thumbnailImageWithBokehInput:]_block_invoke";
    _os_log_impl(&dword_1BE13A000, v0, OS_LOG_TYPE_DEFAULT, "%{public}s: complete.", (uint8_t *)&v1, 0xCu);
  }
}

void __44__WKBokehView_thumbnailImageWithBokehInput___block_invoke_22(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 layer];
  uint64_t v4 = [v3 CGContext];

  [v5 renderInContext:v4];
}

- (WKBokehWallpaperInput)bokehWallpaperInput
{
  return self->_bokehWallpaperInput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bokehWallpaperInput, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_bubbles, 0);
  objc_storeStrong((id *)&self->_contentLayer, 0);
  objc_storeStrong((id *)&self->_motionFilter, 0);
}

@end