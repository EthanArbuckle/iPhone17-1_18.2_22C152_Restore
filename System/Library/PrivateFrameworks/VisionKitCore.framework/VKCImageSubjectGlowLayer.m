@interface VKCImageSubjectGlowLayer
- (BOOL)active;
- (CALayer)glowLayer;
- (NSMutableDictionary)subLayersMap;
- (VKCImageSubjectGlowLayer)init;
- (id)animationGroupWithDuration:(double)a3 beginTime:(double)a4 animations:(id)a5;
- (id)animationWithKeyPath:(id)a3 beginTime:(double)a4 duration:(double)a5;
- (id)shapeLayerLineWidth:(double)a3 opacity:(double)a4 path:(CGPath *)a5;
- (id)thickGlowParametersWithViewScale:(double)a3;
- (id)thinGlowParametersWithScreenScale:(double)a3 viewScale:(double)a4;
- (void)beginAnimationWithViewScale:(double)a3 screenScale:(double)a4 path:(id)a5 index:(int64_t)a6 count:(int64_t)a7 identifier:(id)a8;
- (void)configureAnimationWithViewScale:(double)a3 screenScale:(double)a4 path:(id)a5 index:(int64_t)a6 count:(int64_t)a7 identifier:(id)a8;
- (void)hideGlow:(BOOL)a3;
- (void)renderGlowParameters:(id)a3 path:(CGPath *)a4 pathLength:(double)a5 duration:(double)a6 maxStrokeLengthFraction:(id)a7 beginDelay:(double)a8 identifier:(id)a9;
- (void)setActive:(BOOL)a3;
- (void)setGlowLayer:(id)a3;
- (void)setSubLayersMap:(id)a3;
- (void)stopAnimationAnimated:(BOOL)a3;
- (void)stopAnimationForIdentifier:(id)a3 animated:(BOOL)a4;
@end

@implementation VKCImageSubjectGlowLayer

- (VKCImageSubjectGlowLayer)init
{
  v8.receiver = self;
  v8.super_class = (Class)VKCImageSubjectGlowLayer;
  v2 = [(VKCImageSubjectGlowLayer *)&v8 init];
  if (v2)
  {
    v3 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    glowLayer = v2->_glowLayer;
    v2->_glowLayer = v3;

    [(CALayer *)v2->_glowLayer setBackgroundColor:0];
    [(VKCImageSubjectGlowLayer *)v2 addSublayer:v2->_glowLayer];
    [(CALayer *)v2->_glowLayer setAllowsGroupBlending:0];
    [(CALayer *)v2->_glowLayer setAllowsGroupOpacity:0];
    [(CALayer *)v2->_glowLayer setOpacity:0.0];
    [(VKCImageSubjectGlowLayer *)v2 setAllowsGroupBlending:0];
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    subLayersMap = v2->_subLayersMap;
    v2->_subLayersMap = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (id)thinGlowParametersWithScreenScale:(double)a3 viewScale:(double)a4
{
  v6 = objc_alloc_init(VKCGlowParameters);
  [(VKCGlowParameters *)v6 setMinThickness:a4 * 0.3];
  [(VKCGlowParameters *)v6 setMaxThickness:a4 * 1.5];
  [(VKCGlowParameters *)v6 setBlurRadius:a4 * 1.5];
  [(VKCGlowParameters *)v6 setStrokeLengthFraction:0.25];
  [(VKCGlowParameters *)v6 setStrokeTaperLength:a4 * 200.0];
  [(VKCGlowParameters *)v6 setMinOpacity:1.0];
  [(VKCGlowParameters *)v6 setMaxOpacity:1.0];
  uint64_t v7 = 12;
  if (a3 == 2.0) {
    uint64_t v7 = 8;
  }
  if (a3 == 1.0) {
    uint64_t v8 = 6;
  }
  else {
    uint64_t v8 = v7;
  }
  [(VKCGlowParameters *)v6 setStrokeCount:v8];
  return v6;
}

- (id)thickGlowParametersWithViewScale:(double)a3
{
  v4 = objc_alloc_init(VKCGlowParameters);
  [(VKCGlowParameters *)v4 setMinThickness:a3 * 4.0];
  [(VKCGlowParameters *)v4 setMaxThickness:a3 * 16.0];
  [(VKCGlowParameters *)v4 setBlurRadius:a3 * 20.0];
  [(VKCGlowParameters *)v4 setStrokeLengthFraction:0.25];
  [(VKCGlowParameters *)v4 setStrokeTaperLength:a3 * 200.0];
  [(VKCGlowParameters *)v4 setMinOpacity:0.1];
  [(VKCGlowParameters *)v4 setMaxOpacity:0.2];
  [(VKCGlowParameters *)v4 setStrokeCount:3];
  return v4;
}

- (void)beginAnimationWithViewScale:(double)a3 screenScale:(double)a4 path:(id)a5 index:(int64_t)a6 count:(int64_t)a7 identifier:(id)a8
{
  [(VKCImageSubjectGlowLayer *)self configureAnimationWithViewScale:a5 screenScale:a6 path:a7 index:a8 count:a3 identifier:a4];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  v9 = [(VKCImageSubjectGlowLayer *)self glowLayer];
  [v9 setOpacity:0.0];

  [MEMORY[0x1E4F39CF8] commit];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:2.0];
  v10 = [(VKCImageSubjectGlowLayer *)self glowLayer];
  LODWORD(v11) = 1.0;
  [v10 setOpacity:v11];

  [MEMORY[0x1E4F39CF8] commit];
  [(VKCImageSubjectGlowLayer *)self setActive:1];
}

- (void)stopAnimationAnimated:(BOOL)a3
{
  [(VKCImageSubjectGlowLayer *)self hideGlow:a3];
  [(VKCImageSubjectGlowLayer *)self setActive:0];
}

- (void)hideGlow:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x1E4F39CF8] begin];
  uint64_t v5 = [(VKCImageSubjectGlowLayer *)self glowLayer];
  v6 = [v5 sublayers];
  uint64_t v7 = (void *)[v6 copy];

  if (v3)
  {
    [MEMORY[0x1E4F39CF8] setAnimationDuration:0.35];
    [v5 setOpacity:0.0];
    uint64_t v8 = (void *)MEMORY[0x1E4F39CF8];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __37__VKCImageSubjectGlowLayer_hideGlow___block_invoke;
    v10[3] = &unk_1E6BF0D18;
    id v11 = v7;
    [v8 setCompletionBlock:v10];
  }
  else
  {
    [v5 setOpacity:0.0];
    [v7 makeObjectsPerformSelector:sel_removeFromSuperlayer];
  }
  v9 = [(VKCImageSubjectGlowLayer *)self subLayersMap];
  [v9 removeAllObjects];

  [MEMORY[0x1E4F39CF8] commit];
}

uint64_t __37__VKCImageSubjectGlowLayer_hideGlow___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) makeObjectsPerformSelector:sel_removeFromSuperlayer];
}

- (void)stopAnimationForIdentifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(VKCImageSubjectGlowLayer *)self subLayersMap];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];
  v9 = (void *)[v8 copy];

  if (v4)
  {
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setAnimationDuration:0.2];
    v10 = (void *)MEMORY[0x1E4F39CF8];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__VKCImageSubjectGlowLayer_stopAnimationForIdentifier_animated___block_invoke;
    v12[3] = &unk_1E6BF0D18;
    id v13 = v9;
    [v10 setCompletionBlock:v12];
    [MEMORY[0x1E4F39CF8] commit];
  }
  else
  {
    [v9 makeObjectsPerformSelector:sel_removeFromSuperlayer];
  }
  id v11 = [(VKCImageSubjectGlowLayer *)self subLayersMap];
  [v11 setObject:0 forKeyedSubscript:v6];
}

uint64_t __64__VKCImageSubjectGlowLayer_stopAnimationForIdentifier_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) makeObjectsPerformSelector:sel_removeFromSuperlayer];
}

- (void)configureAnimationWithViewScale:(double)a3 screenScale:(double)a4 path:(id)a5 index:(int64_t)a6 count:(int64_t)a7 identifier:(id)a8
{
  v48[2] = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  id v15 = a8;
  v16 = [(VKCImageSubjectGlowLayer *)self thinGlowParametersWithScreenScale:a4 viewScale:a3];
  v48[0] = v16;
  v17 = [(VKCImageSubjectGlowLayer *)self thickGlowParametersWithViewScale:a3];
  v48[1] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v19 = v18;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v43 objects:v47 count:16];
  double v21 = 0.0;
  double v22 = 0.0;
  if (v20)
  {
    uint64_t v23 = v20;
    uint64_t v24 = *(void *)v44;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v44 != v24) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v43 + 1) + 8 * v25) strokeLengthFraction];
        if (v22 < v26) {
          double v22 = v26;
        }
        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [v19 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v23);
  }

  v27 = [v14 bezierPathByReversingPath];

  uint64_t v28 = objc_msgSend(v27, "vk_CGPath");
  objc_msgSend(v27, "vk_lengthIgnoringCurves");
  double v30 = v29;
  double v31 = VKMClamp(v29 / 350.0, 4.5, 6.0);
  double v32 = v31 / (double)a7 * (double)a6;
  if (a7 < 1) {
    double v32 = 0.0;
  }
  if (a6 >= 1) {
    double v21 = v32;
  }
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  v33 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v19, "count"));
  v34 = [(VKCImageSubjectGlowLayer *)self subLayersMap];
  [v34 setObject:v33 forKeyedSubscript:v15];

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __100__VKCImageSubjectGlowLayer_configureAnimationWithViewScale_screenScale_path_index_count_identifier___block_invoke;
  v36[3] = &unk_1E6BF3940;
  id v37 = v15;
  uint64_t v38 = v28;
  double v39 = v30;
  double v40 = v31;
  double v41 = v22;
  double v42 = v21;
  v36[4] = self;
  id v35 = v15;
  [v19 enumerateObjectsUsingBlock:v36];
  [MEMORY[0x1E4F39CF8] commit];
}

void __100__VKCImageSubjectGlowLayer_configureAnimationWithViewScale_screenScale_path_index_count_identifier___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  uint64_t v7 = NSNumber;
  double v8 = *(double *)(a1 + 72);
  id v9 = a2;
  id v10 = [v7 numberWithDouble:v8];
  [v3 renderGlowParameters:v9 path:v4 pathLength:v10 duration:*(void *)(a1 + 40) maxStrokeLengthFraction:v5 beginDelay:v6 identifier:*(double *)(a1 + 80)];
}

- (void)renderGlowParameters:(id)a3 path:(CGPath *)a4 pathLength:(double)a5 duration:(double)a6 maxStrokeLengthFraction:(id)a7 beginDelay:(double)a8 identifier:(id)a9
{
  v74[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a7;
  id v62 = a9;
  [v16 blurRadius];
  uint64_t v19 = __64__VKCImageSubjectBaseView_configurePulseAnimationWithViewScale___block_invoke(v18);
  uint64_t v20 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A350]];
  v71[0] = xmmword_1DB33EC40;
  v71[1] = xmmword_1DB33EC50;
  v71[2] = xmmword_1DB33EC60;
  v71[3] = xmmword_1DB33EC70;
  v71[4] = xmmword_1DB33EC80;
  double v21 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v71];
  v60 = v20;
  [v20 setValue:v21 forKeyPath:@"inputColorMatrix"];

  id v22 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
  v61 = (void *)v19;
  v74[0] = v19;
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:1];
  [v22 setFilters:v23];

  [v22 setCompositingFilter:*MEMORY[0x1E4F3A248]];
  double v24 = CACurrentMediaTime() + a8;
  [v16 strokeLengthFraction];
  double v26 = v25;
  [v16 strokeTaperLength];
  double v28 = v26 - v27 / a5;
  [v16 strokeLengthFraction];
  double v30 = v29;
  double v31 = self;
  if (v17) {
    [v17 doubleValue];
  }
  else {
    [v16 strokeLengthFraction];
  }
  v63 = v17;
  double v65 = v30 * a6;
  double v66 = v28 * a6;
  double v64 = v32 * a6;
  [v16 strokeCount];
  uint64_t v33 = -1;
  double v34 = v24 - a6;
  v67 = a4;
  do
  {
    ++v33;
    double v35 = v24;
    double v36 = (double)v33 / (double)(unint64_t)[v16 strokeCount];
    [v16 minThickness];
    double v38 = v37;
    [v16 maxThickness];
    double v40 = VKMMix(v38, v39, v36);
    double v41 = VKMMix(v66, v65, 1.0 - v36);
    [v16 minOpacity];
    double v43 = v42;
    [v16 maxOpacity];
    double v45 = VKMMix(v43, v44, v36);
    double v46 = v64 + v41 * -0.5;
    v70 = [(VKCImageSubjectGlowLayer *)v31 shapeLayerLineWidth:a4 opacity:v40 path:v45];
    v47 = [(VKCImageSubjectGlowLayer *)v31 shapeLayerLineWidth:a4 opacity:v40 path:v45];
    v69 = [(VKCImageSubjectGlowLayer *)v31 animationWithKeyPath:@"strokeEnd" beginTime:v46 duration:a6];
    double v48 = v41 + v46;
    v68 = [(VKCImageSubjectGlowLayer *)v31 animationWithKeyPath:@"strokeStart" beginTime:v48 duration:a6];
    double v49 = v46;
    double v24 = v35;
    v50 = [(VKCImageSubjectGlowLayer *)v31 animationWithKeyPath:@"strokeEnd" beginTime:v49 duration:a6];
    v51 = [(VKCImageSubjectGlowLayer *)v31 animationWithKeyPath:@"strokeStart" beginTime:v48 duration:a6];
    v73[0] = v68;
    v73[1] = v69;
    v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:2];
    v53 = [(VKCImageSubjectGlowLayer *)v31 animationGroupWithDuration:v52 beginTime:a6 + a6 animations:v35];

    v72[0] = v51;
    v72[1] = v50;
    v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:2];
    [(VKCImageSubjectGlowLayer *)v31 animationGroupWithDuration:v54 beginTime:a6 + a6 animations:v34];
    v56 = v55 = v16;

    [v70 addAnimation:v53 forKey:@"strokeAnimationGroup"];
    [v47 addAnimation:v56 forKey:@"strokeAnimationGroup2"];
    [v22 addSublayer:v47];
    [v22 addSublayer:v70];

    id v16 = v55;
    a4 = v67;
  }
  while (v33 < (unint64_t)[v55 strokeCount]);
  v57 = [(VKCImageSubjectGlowLayer *)v31 glowLayer];
  [v57 addSublayer:v22];

  v58 = [(VKCImageSubjectGlowLayer *)v31 subLayersMap];
  v59 = [v58 objectForKeyedSubscript:v62];
  [v59 addObject:v22];
}

- (id)shapeLayerLineWidth:(double)a3 opacity:(double)a4 path:(CGPath *)a5
{
  id v8 = objc_alloc_init(MEMORY[0x1E4F39C88]);
  id v9 = [MEMORY[0x1E4F428B8] whiteColor];
  objc_msgSend(v8, "setStrokeColor:", objc_msgSend(v9, "CGColor"));

  [v8 setLineWidth:a3];
  [v8 setFillColor:0];
  *(float *)&double v10 = a4;
  [v8 setOpacity:v10];
  [v8 setPath:a5];
  [v8 setStrokeStart:0.0];
  [v8 setStrokeEnd:0.0];
  return v8;
}

- (id)animationWithKeyPath:(id)a3 beginTime:(double)a4 duration:(double)a5
{
  uint64_t v7 = [MEMORY[0x1E4F39B48] animationWithKeyPath:a3];
  [v7 setFromValue:&unk_1F357DE00];
  [v7 setToValue:&unk_1F357DE10];
  [v7 setBeginTime:a4];
  [v7 setDuration:a5];
  [v7 setFillMode:*MEMORY[0x1E4F39FA8]];
  return v7;
}

- (id)animationGroupWithDuration:(double)a3 beginTime:(double)a4 animations:(id)a5
{
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F39B38];
  id v8 = a5;
  id v9 = objc_alloc_init(v7);
  [v9 setDuration:a3];
  LODWORD(v10) = 2139095040;
  [v9 setRepeatCount:v10];
  [v9 setBeginTime:a4];
  [v9 setAnimations:v8];

  return v9;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (CALayer)glowLayer
{
  return self->_glowLayer;
}

- (void)setGlowLayer:(id)a3
{
}

- (NSMutableDictionary)subLayersMap
{
  return self->_subLayersMap;
}

- (void)setSubLayersMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subLayersMap, 0);
  objc_storeStrong((id *)&self->_glowLayer, 0);
}

@end