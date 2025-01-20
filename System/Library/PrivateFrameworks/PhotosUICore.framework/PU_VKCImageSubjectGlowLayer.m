@interface PU_VKCImageSubjectGlowLayer
- (BOOL)active;
- (CALayer)glowLayer;
- (NSMutableDictionary)subLayersMap;
- (PU_VKCImageSubjectGlowLayer)init;
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

@implementation PU_VKCImageSubjectGlowLayer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subLayersMap, 0);
  objc_storeStrong((id *)&self->_glowLayer, 0);
}

- (void)setSubLayersMap:(id)a3
{
}

- (NSMutableDictionary)subLayersMap
{
  return self->_subLayersMap;
}

- (void)setGlowLayer:(id)a3
{
}

- (CALayer)glowLayer
{
  return self->_glowLayer;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)active
{
  return self->_active;
}

- (id)animationGroupWithDuration:(double)a3 beginTime:(double)a4 animations:(id)a5
{
  v7 = (objc_class *)MEMORY[0x1E4F39B38];
  id v8 = a5;
  id v9 = objc_alloc_init(v7);
  [v9 setDuration:a3];
  LODWORD(v10) = 2139095040;
  [v9 setRepeatCount:v10];
  [v9 setBeginTime:a4];
  [v9 setAnimations:v8];

  return v9;
}

- (id)animationWithKeyPath:(id)a3 beginTime:(double)a4 duration:(double)a5
{
  v7 = [MEMORY[0x1E4F39B48] animationWithKeyPath:a3];
  [v7 setFromValue:&unk_1F02DA850];
  [v7 setToValue:&unk_1F02DA860];
  [v7 setBeginTime:a4];
  [v7 setDuration:a5];
  [v7 setFillMode:*MEMORY[0x1E4F39FA8]];
  return v7;
}

- (id)shapeLayerLineWidth:(double)a3 opacity:(double)a4 path:(CGPath *)a5
{
  id v8 = objc_alloc_init(MEMORY[0x1E4F39C88]);
  id v9 = [MEMORY[0x1E4FB1618] whiteColor];
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

- (void)renderGlowParameters:(id)a3 path:(CGPath *)a4 pathLength:(double)a5 duration:(double)a6 maxStrokeLengthFraction:(id)a7 beginDelay:(double)a8 identifier:(id)a9
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a7;
  id v59 = a9;
  [v15 blurRadius];
  double v18 = v17;
  v19 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
  v20 = [NSNumber numberWithDouble:v18];
  [v19 setValue:v20 forKeyPath:*MEMORY[0x1E4F3A1D8]];

  [v19 setValue:@"low" forKey:*MEMORY[0x1E4F3A1D0]];
  v21 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A350]];
  v67[0] = xmmword_1AB35A1D0;
  v67[1] = xmmword_1AB35A1E0;
  v67[2] = xmmword_1AB35A1F0;
  v67[3] = xmmword_1AB35A200;
  v67[4] = xmmword_1AB35A210;
  v22 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v67];
  v57 = v21;
  [v21 setValue:v22 forKeyPath:@"inputColorMatrix"];

  id v23 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
  v58 = v19;
  v70[0] = v19;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:1];
  [v23 setFilters:v24];

  [v23 setCompositingFilter:*MEMORY[0x1E4F3A248]];
  double v25 = CACurrentMediaTime() + a8;
  [v15 strokeLengthFraction];
  double v27 = v26;
  [v15 strokeTaperLength];
  double v29 = (v27 - v28 / a5) * a6;
  [v15 strokeLengthFraction];
  double v31 = v30 * a6;
  if (v16) {
    [v16 doubleValue];
  }
  else {
    [v15 strokeLengthFraction];
  }
  v60 = v16;
  double v61 = v32 * a6;
  [v15 strokeCount];
  unint64_t v33 = -1;
  v34 = self;
  v62 = v15;
  do
  {
    double v35 = (double)(uint64_t)++v33 / (double)(unint64_t)[v15 strokeCount];
    [v15 minThickness];
    double v37 = v36;
    [v15 maxThickness];
    double v39 = v37 + (v38 - v37) * v35;
    double v40 = v29 + (v31 - v29) * (1.0 - v35);
    [v15 minOpacity];
    double v42 = v41;
    [v15 maxOpacity];
    double v44 = v42 + (v43 - v42) * v35;
    double v45 = v61 + v40 * -0.5;
    v66 = [(PU_VKCImageSubjectGlowLayer *)v34 shapeLayerLineWidth:a4 opacity:v39 path:v44];
    v46 = [(PU_VKCImageSubjectGlowLayer *)v34 shapeLayerLineWidth:a4 opacity:v39 path:v44];
    v65 = [(PU_VKCImageSubjectGlowLayer *)v34 animationWithKeyPath:@"strokeEnd" beginTime:v45 duration:a6];
    v64 = [(PU_VKCImageSubjectGlowLayer *)v34 animationWithKeyPath:@"strokeStart" beginTime:v40 + v45 duration:a6];
    v47 = [(PU_VKCImageSubjectGlowLayer *)v34 animationWithKeyPath:@"strokeEnd" beginTime:v45 duration:a6];
    v48 = [(PU_VKCImageSubjectGlowLayer *)v34 animationWithKeyPath:@"strokeStart" beginTime:v40 + v45 duration:a6];
    v69[0] = v64;
    v69[1] = v65;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];
    v50 = v49 = v23;
    v51 = [(PU_VKCImageSubjectGlowLayer *)v34 animationGroupWithDuration:v50 beginTime:a6 + a6 animations:v25];

    v68[0] = v48;
    v68[1] = v47;
    v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];
    v53 = [(PU_VKCImageSubjectGlowLayer *)v34 animationGroupWithDuration:v52 beginTime:a6 + a6 animations:v25 - a6];

    id v23 = v49;
    [v66 addAnimation:v51 forKey:@"strokeAnimationGroup"];
    [v46 addAnimation:v53 forKey:@"strokeAnimationGroup2"];
    [v49 addSublayer:v46];
    [v49 addSublayer:v66];

    v34 = self;
    id v15 = v62;
  }
  while (v33 < [v62 strokeCount]);
  v54 = [(PU_VKCImageSubjectGlowLayer *)self glowLayer];
  [v54 addSublayer:v49];

  v55 = [(PU_VKCImageSubjectGlowLayer *)self subLayersMap];
  v56 = [v55 objectForKeyedSubscript:v59];
  [v56 addObject:v49];
}

- (void)configureAnimationWithViewScale:(double)a3 screenScale:(double)a4 path:(id)a5 index:(int64_t)a6 count:(int64_t)a7 identifier:(id)a8
{
  v49[2] = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  id v15 = a8;
  id v16 = [(PU_VKCImageSubjectGlowLayer *)self thinGlowParametersWithScreenScale:a4 viewScale:a3];
  v49[0] = v16;
  double v17 = [(PU_VKCImageSubjectGlowLayer *)self thickGlowParametersWithViewScale:a3];
  v49[1] = v17;
  double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v19 = v18;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v45;
    double v23 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v45 != v22) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v44 + 1) + 8 * i) strokeLengthFraction];
        if (v23 < v25) {
          double v23 = v25;
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v21);
  }
  else
  {
    double v23 = 0.0;
  }

  double v26 = [v14 bezierPathByReversingPath];

  uint64_t v27 = objc_msgSend(v26, "vk_CGPath");
  objc_msgSend(v26, "vk_lengthIgnoringCurves");
  double v29 = v28;
  double v30 = v28 / 550.0;
  double v31 = 1.5;
  if (v30 >= 1.5)
  {
    double v31 = v30;
    if (v30 > 3.0) {
      double v31 = 3.0;
    }
  }
  double v32 = v31 / (double)a7 * (double)a6;
  if (a7 < 1) {
    double v32 = 0.0;
  }
  if (a6 >= 1) {
    double v33 = v32;
  }
  else {
    double v33 = 0.0;
  }
  objc_msgSend(MEMORY[0x1E4F39CF8], "begin", 0.0, v32);
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  v34 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v19, "count"));
  double v35 = [(PU_VKCImageSubjectGlowLayer *)self subLayersMap];
  [v35 setObject:v34 forKeyedSubscript:v15];

  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __103__PU_VKCImageSubjectGlowLayer_configureAnimationWithViewScale_screenScale_path_index_count_identifier___block_invoke;
  v37[3] = &unk_1E5DD3720;
  id v38 = v15;
  uint64_t v39 = v27;
  double v40 = v29;
  double v41 = v31;
  double v42 = v23;
  double v43 = v33;
  v37[4] = self;
  id v36 = v15;
  [v19 enumerateObjectsUsingBlock:v37];
  [MEMORY[0x1E4F39CF8] commit];
}

- (void)stopAnimationForIdentifier:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(PU_VKCImageSubjectGlowLayer *)self subLayersMap];
  id v8 = [v7 objectForKeyedSubscript:v6];
  id v9 = (void *)[v8 copy];

  if (v4)
  {
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setAnimationDuration:0.2];
    double v10 = (void *)MEMORY[0x1E4F39CF8];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__PU_VKCImageSubjectGlowLayer_stopAnimationForIdentifier_animated___block_invoke;
    v12[3] = &unk_1E5DD36F8;
    id v13 = v9;
    [v10 setCompletionBlock:v12];
    [MEMORY[0x1E4F39CF8] commit];
  }
  else
  {
    [v9 makeObjectsPerformSelector:sel_removeFromSuperlayer];
  }
  v11 = [(PU_VKCImageSubjectGlowLayer *)self subLayersMap];
  [v11 setObject:0 forKeyedSubscript:v6];
}

- (void)hideGlow:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x1E4F39CF8] begin];
  v5 = [(PU_VKCImageSubjectGlowLayer *)self glowLayer];
  id v6 = [v5 sublayers];
  v7 = (void *)[v6 copy];

  if (v3)
  {
    [MEMORY[0x1E4F39CF8] setAnimationDuration:0.35];
    [v5 setOpacity:0.0];
    id v8 = (void *)MEMORY[0x1E4F39CF8];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__PU_VKCImageSubjectGlowLayer_hideGlow___block_invoke;
    v10[3] = &unk_1E5DD36F8;
    id v11 = v7;
    [v8 setCompletionBlock:v10];
  }
  else
  {
    [v5 setOpacity:0.0];
    [v7 makeObjectsPerformSelector:sel_removeFromSuperlayer];
  }
  id v9 = [(PU_VKCImageSubjectGlowLayer *)self subLayersMap];
  [v9 removeAllObjects];

  [MEMORY[0x1E4F39CF8] commit];
}

- (void)stopAnimationAnimated:(BOOL)a3
{
  [(PU_VKCImageSubjectGlowLayer *)self hideGlow:a3];
  [(PU_VKCImageSubjectGlowLayer *)self setActive:0];
}

- (void)beginAnimationWithViewScale:(double)a3 screenScale:(double)a4 path:(id)a5 index:(int64_t)a6 count:(int64_t)a7 identifier:(id)a8
{
  [(PU_VKCImageSubjectGlowLayer *)self configureAnimationWithViewScale:a5 screenScale:a6 path:a7 index:a8 count:a3 identifier:a4];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  id v9 = [(PU_VKCImageSubjectGlowLayer *)self glowLayer];
  [v9 setOpacity:0.0];

  [MEMORY[0x1E4F39CF8] commit];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:2.0];
  double v10 = [(PU_VKCImageSubjectGlowLayer *)self glowLayer];
  LODWORD(v11) = 1.0;
  [v10 setOpacity:v11];

  [MEMORY[0x1E4F39CF8] commit];
  [(PU_VKCImageSubjectGlowLayer *)self setActive:1];
}

- (id)thickGlowParametersWithViewScale:(double)a3
{
  BOOL v4 = objc_alloc_init(PU_VKCGlowParameters);
  [(PU_VKCGlowParameters *)v4 setMinThickness:a3 * 4.0];
  [(PU_VKCGlowParameters *)v4 setMaxThickness:a3 * 16.0];
  [(PU_VKCGlowParameters *)v4 setBlurRadius:a3 * 20.0];
  [(PU_VKCGlowParameters *)v4 setStrokeLengthFraction:0.25];
  [(PU_VKCGlowParameters *)v4 setStrokeTaperLength:a3 * 200.0];
  [(PU_VKCGlowParameters *)v4 setMinOpacity:0.1];
  [(PU_VKCGlowParameters *)v4 setMaxOpacity:0.2];
  [(PU_VKCGlowParameters *)v4 setStrokeCount:3];
  return v4;
}

- (id)thinGlowParametersWithScreenScale:(double)a3 viewScale:(double)a4
{
  id v6 = objc_alloc_init(PU_VKCGlowParameters);
  [(PU_VKCGlowParameters *)v6 setMinThickness:a4 * 0.3];
  [(PU_VKCGlowParameters *)v6 setMaxThickness:a4 * 1.5];
  [(PU_VKCGlowParameters *)v6 setBlurRadius:a4 * 1.5];
  [(PU_VKCGlowParameters *)v6 setStrokeLengthFraction:0.25];
  [(PU_VKCGlowParameters *)v6 setStrokeTaperLength:a4 * 200.0];
  [(PU_VKCGlowParameters *)v6 setMinOpacity:1.0];
  [(PU_VKCGlowParameters *)v6 setMaxOpacity:1.0];
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
  [(PU_VKCGlowParameters *)v6 setStrokeCount:v8];
  return v6;
}

- (PU_VKCImageSubjectGlowLayer)init
{
  v8.receiver = self;
  v8.super_class = (Class)PU_VKCImageSubjectGlowLayer;
  v2 = [(PU_VKCImageSubjectGlowLayer *)&v8 init];
  if (v2)
  {
    BOOL v3 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    glowLayer = v2->_glowLayer;
    v2->_glowLayer = v3;

    [(CALayer *)v2->_glowLayer setBackgroundColor:0];
    [(PU_VKCImageSubjectGlowLayer *)v2 addSublayer:v2->_glowLayer];
    [(CALayer *)v2->_glowLayer setAllowsGroupBlending:0];
    [(CALayer *)v2->_glowLayer setAllowsGroupOpacity:0];
    [(CALayer *)v2->_glowLayer setOpacity:0.0];
    [(PU_VKCImageSubjectGlowLayer *)v2 setAllowsGroupBlending:0];
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    subLayersMap = v2->_subLayersMap;
    v2->_subLayersMap = (NSMutableDictionary *)v5;
  }
  return v2;
}

@end