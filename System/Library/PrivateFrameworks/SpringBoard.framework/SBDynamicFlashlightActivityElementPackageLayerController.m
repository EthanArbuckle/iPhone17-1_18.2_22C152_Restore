@interface SBDynamicFlashlightActivityElementPackageLayerController
- (SBDynamicFlashlightActivityElementPackageLayerController)initWithPackageView:(id)a3;
- (id)sensorShadowPortalLayer;
- (void)setBeamIntensity:(double)a3 width:(double)a4 animated:(BOOL)a5;
- (void)setTouching:(BOOL)a3 animated:(BOOL)a4;
- (void)updateBeamLayersForIntensity:(double)a3 width:(double)a4 animated:(BOOL)a5;
- (void)updateIndicatorLayersForIntensity:(double)a3 width:(double)a4 animated:(BOOL)a5;
@end

@implementation SBDynamicFlashlightActivityElementPackageLayerController

- (SBDynamicFlashlightActivityElementPackageLayerController)initWithPackageView:(id)a3
{
  id v6 = a3;
  v82.receiver = self;
  v82.super_class = (Class)SBDynamicFlashlightActivityElementPackageLayerController;
  v7 = [(SBDynamicFlashlightActivityElementPackageLayerController *)&v82 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_packageView, a3);
    uint64_t v9 = [(BSUICAPackageView *)v8->_packageView publishedObjectWithName:@"sensor hiding gradient"];
    shadowLayer = v8->_shadowLayer;
    v8->_shadowLayer = (CALayer *)v9;

    if (!v8->_shadowLayer)
    {
      v56 = [MEMORY[0x1E4F28B00] currentHandler];
      [v56 handleFailureInMethod:a2, v8, @"SBDynamicFlashlightActivityElementPackageLayerController.m", 81, @"Couldn't find layer %@", @"sensor hiding gradient" object file lineNumber description];
    }
    uint64_t v11 = [(BSUICAPackageView *)v8->_packageView publishedObjectWithName:@"indicator"];
    indicatorLayer = v8->_indicatorLayer;
    v8->_indicatorLayer = (CALayer *)v11;

    if (!v8->_indicatorLayer)
    {
      v57 = [MEMORY[0x1E4F28B00] currentHandler];
      [v57 handleFailureInMethod:a2, v8, @"SBDynamicFlashlightActivityElementPackageLayerController.m", 87, @"Couldn't find layer %@", @"indicator" object file lineNumber description];
    }
    uint64_t v13 = [(BSUICAPackageView *)v8->_packageView publishedObjectWithName:@"circle"];
    circleLayer = v8->_circleLayer;
    v8->_circleLayer = (CALayer *)v13;

    if (!v8->_circleLayer)
    {
      v58 = [MEMORY[0x1E4F28B00] currentHandler];
      [v58 handleFailureInMethod:a2, v8, @"SBDynamicFlashlightActivityElementPackageLayerController.m", 89, @"Couldn't find layer %@", @"circle" object file lineNumber description];
    }
    uint64_t v15 = [(BSUICAPackageView *)v8->_packageView publishedObjectWithName:@"arc_crop_left"];
    arcCropLeftLayer = v8->_arcCropLeftLayer;
    v8->_arcCropLeftLayer = (CALayer *)v15;

    if (!v8->_arcCropLeftLayer)
    {
      v59 = [MEMORY[0x1E4F28B00] currentHandler];
      [v59 handleFailureInMethod:a2, v8, @"SBDynamicFlashlightActivityElementPackageLayerController.m", 91, @"Couldn't find layer %@", @"arc_crop_left" object file lineNumber description];
    }
    uint64_t v17 = [(BSUICAPackageView *)v8->_packageView publishedObjectWithName:@"arc_crop_right"];
    arcCropRightLayer = v8->_arcCropRightLayer;
    v8->_arcCropRightLayer = (CALayer *)v17;

    if (!v8->_arcCropRightLayer)
    {
      v60 = [MEMORY[0x1E4F28B00] currentHandler];
      [v60 handleFailureInMethod:a2, v8, @"SBDynamicFlashlightActivityElementPackageLayerController.m", 92, @"Couldn't find layer %@", @"arc_crop_right" object file lineNumber description];
    }
    uint64_t v19 = [(BSUICAPackageView *)v8->_packageView publishedObjectWithName:@"tick"];
    tickLineLayer = v8->_tickLineLayer;
    v8->_tickLineLayer = (CALayer *)v19;

    if (!v8->_tickLineLayer)
    {
      v61 = [MEMORY[0x1E4F28B00] currentHandler];
      [v61 handleFailureInMethod:a2, v8, @"SBDynamicFlashlightActivityElementPackageLayerController.m", 94, @"Couldn't find layer %@", @"tick" object file lineNumber description];
    }
    uint64_t v21 = [(BSUICAPackageView *)v8->_packageView publishedObjectWithName:@"ticksring"];
    ticksRingLayer = v8->_ticksRingLayer;
    v8->_ticksRingLayer = (CAReplicatorLayer *)v21;

    if (!v8->_ticksRingLayer)
    {
      v62 = [MEMORY[0x1E4F28B00] currentHandler];
      [v62 handleFailureInMethod:a2, v8, @"SBDynamicFlashlightActivityElementPackageLayerController.m", 95, @"Couldn't find layer %@", @"ticksring" object file lineNumber description];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v63 = [MEMORY[0x1E4F28B00] currentHandler];
      v64 = (objc_class *)objc_opt_class();
      v65 = NSStringFromClass(v64);
      [v63 handleFailureInMethod:a2, v8, @"SBDynamicFlashlightActivityElementPackageLayerController.m", 96, @"Wrong class: %@", v65 object file lineNumber description];
    }
    uint64_t v23 = [(BSUICAPackageView *)v8->_packageView publishedObjectWithName:@"glyph_holder"];
    glyphHolderLayer = v8->_glyphHolderLayer;
    v8->_glyphHolderLayer = (CALayer *)v23;

    if (!v8->_glyphHolderLayer)
    {
      v66 = [MEMORY[0x1E4F28B00] currentHandler];
      [v66 handleFailureInMethod:a2, v8, @"SBDynamicFlashlightActivityElementPackageLayerController.m", 97, @"Couldn't find layer %@", @"glyph_holder" object file lineNumber description];
    }
    uint64_t v25 = [(BSUICAPackageView *)v8->_packageView publishedObjectWithName:@"glyph"];
    glyphLayer = v8->_glyphLayer;
    v8->_glyphLayer = (CALayer *)v25;

    if (!v8->_glyphLayer)
    {
      v67 = [MEMORY[0x1E4F28B00] currentHandler];
      [v67 handleFailureInMethod:a2, v8, @"SBDynamicFlashlightActivityElementPackageLayerController.m", 98, @"Couldn't find layer %@", @"glyph" object file lineNumber description];
    }
    uint64_t v27 = [(BSUICAPackageView *)v8->_packageView publishedObjectWithName:@"contents"];
    maskContentsLayer = v8->_maskContentsLayer;
    v8->_maskContentsLayer = (CALayer *)v27;

    if (!v8->_maskContentsLayer)
    {
      v68 = [MEMORY[0x1E4F28B00] currentHandler];
      [v68 handleFailureInMethod:a2, v8, @"SBDynamicFlashlightActivityElementPackageLayerController.m", 100, @"Couldn't find layer %@", @"contents" object file lineNumber description];
    }
    uint64_t v29 = [(BSUICAPackageView *)v8->_packageView publishedObjectWithName:@"wide rainbow"];
    wideRainbowLayer = v8->_wideRainbowLayer;
    v8->_wideRainbowLayer = (CALayer *)v29;

    if (!v8->_wideRainbowLayer)
    {
      v69 = [MEMORY[0x1E4F28B00] currentHandler];
      [v69 handleFailureInMethod:a2, v8, @"SBDynamicFlashlightActivityElementPackageLayerController.m", 102, @"Couldn't find layer %@", @"wide rainbow" object file lineNumber description];
    }
    uint64_t v31 = [(BSUICAPackageView *)v8->_packageView publishedObjectWithName:@"rainL"];
    rainbowLeftLayer = v8->_rainbowLeftLayer;
    v8->_rainbowLeftLayer = (CALayer *)v31;

    if (!v8->_rainbowLeftLayer)
    {
      v70 = [MEMORY[0x1E4F28B00] currentHandler];
      [v70 handleFailureInMethod:a2, v8, @"SBDynamicFlashlightActivityElementPackageLayerController.m", 103, @"Couldn't find layer %@", @"rainL" object file lineNumber description];
    }
    uint64_t v33 = [(BSUICAPackageView *)v8->_packageView publishedObjectWithName:@"rainR"];
    rainbowRightLayer = v8->_rainbowRightLayer;
    v8->_rainbowRightLayer = (CALayer *)v33;

    if (!v8->_rainbowRightLayer)
    {
      v71 = [MEMORY[0x1E4F28B00] currentHandler];
      [v71 handleFailureInMethod:a2, v8, @"SBDynamicFlashlightActivityElementPackageLayerController.m", 104, @"Couldn't find layer %@", @"rainR" object file lineNumber description];
    }
    uint64_t v35 = [(BSUICAPackageView *)v8->_packageView publishedObjectWithName:@"spreadBeamImage"];
    spreadBeamImageLayer = v8->_spreadBeamImageLayer;
    v8->_spreadBeamImageLayer = (CALayer *)v35;

    if (!v8->_spreadBeamImageLayer)
    {
      v72 = [MEMORY[0x1E4F28B00] currentHandler];
      [v72 handleFailureInMethod:a2, v8, @"SBDynamicFlashlightActivityElementPackageLayerController.m", 105, @"Couldn't find layer %@", @"spreadBeamImage" object file lineNumber description];
    }
    uint64_t v37 = [(BSUICAPackageView *)v8->_packageView publishedObjectWithName:@"straightBeamImage"];
    straightBeamImageLayer = v8->_straightBeamImageLayer;
    v8->_straightBeamImageLayer = (CALayer *)v37;

    if (!v8->_straightBeamImageLayer)
    {
      v73 = [MEMORY[0x1E4F28B00] currentHandler];
      [v73 handleFailureInMethod:a2, v8, @"SBDynamicFlashlightActivityElementPackageLayerController.m", 106, @"Couldn't find layer %@", @"straightBeamImage" object file lineNumber description];
    }
    uint64_t v39 = [(BSUICAPackageView *)v8->_packageView publishedObjectWithName:@"circle flares shifter"];
    circleFlaresShifterLayer = v8->_circleFlaresShifterLayer;
    v8->_circleFlaresShifterLayer = (CALayer *)v39;

    if (!v8->_circleFlaresShifterLayer)
    {
      v74 = [MEMORY[0x1E4F28B00] currentHandler];
      [v74 handleFailureInMethod:a2, v8, @"SBDynamicFlashlightActivityElementPackageLayerController.m", 107, @"Couldn't find layer %@", @"circle flares shifter" object file lineNumber description];
    }
    uint64_t v41 = [(BSUICAPackageView *)v8->_packageView publishedObjectWithName:@"spreadBeamDimmer"];
    spreadBeamDimmerLayer = v8->_spreadBeamDimmerLayer;
    v8->_spreadBeamDimmerLayer = (CALayer *)v41;

    if (!v8->_spreadBeamDimmerLayer)
    {
      v75 = [MEMORY[0x1E4F28B00] currentHandler];
      [v75 handleFailureInMethod:a2, v8, @"SBDynamicFlashlightActivityElementPackageLayerController.m", 109, @"Couldn't find layer %@", @"spreadBeamDimmer" object file lineNumber description];
    }
    uint64_t v43 = [(BSUICAPackageView *)v8->_packageView publishedObjectWithName:@"straightBeamDimmer"];
    straightBeamDimmerLayer = v8->_straightBeamDimmerLayer;
    v8->_straightBeamDimmerLayer = (CALayer *)v43;

    if (!v8->_straightBeamDimmerLayer)
    {
      v76 = [MEMORY[0x1E4F28B00] currentHandler];
      [v76 handleFailureInMethod:a2, v8, @"SBDynamicFlashlightActivityElementPackageLayerController.m", 110, @"Couldn't find layer %@", @"straightBeamDimmer" object file lineNumber description];
    }
    uint64_t v45 = [(BSUICAPackageView *)v8->_packageView publishedObjectWithName:@"rainLdimmer"];
    rainbowLeftdimmerLayer = v8->_rainbowLeftdimmerLayer;
    v8->_rainbowLeftdimmerLayer = (CALayer *)v45;

    if (!v8->_rainbowLeftdimmerLayer)
    {
      v77 = [MEMORY[0x1E4F28B00] currentHandler];
      [v77 handleFailureInMethod:a2, v8, @"SBDynamicFlashlightActivityElementPackageLayerController.m", 111, @"Couldn't find layer %@", @"rainLdimmer" object file lineNumber description];
    }
    uint64_t v47 = [(BSUICAPackageView *)v8->_packageView publishedObjectWithName:@"rainRdimmer"];
    rainbowRightdimmerLayer = v8->_rainbowRightdimmerLayer;
    v8->_rainbowRightdimmerLayer = (CALayer *)v47;

    if (!v8->_rainbowRightdimmerLayer)
    {
      v78 = [MEMORY[0x1E4F28B00] currentHandler];
      [v78 handleFailureInMethod:a2, v8, @"SBDynamicFlashlightActivityElementPackageLayerController.m", 112, @"Couldn't find layer %@", @"rainRdimmer" object file lineNumber description];
    }
    uint64_t v49 = [(BSUICAPackageView *)v8->_packageView publishedObjectWithName:@"flashlightImage"];
    flashlightImageLayer = v8->_flashlightImageLayer;
    v8->_flashlightImageLayer = (CALayer *)v49;

    if (!v8->_flashlightImageLayer)
    {
      v79 = [MEMORY[0x1E4F28B00] currentHandler];
      [v79 handleFailureInMethod:a2, v8, @"SBDynamicFlashlightActivityElementPackageLayerController.m", 113, @"Couldn't find layer %@", @"flashlightImage" object file lineNumber description];
    }
    uint64_t v51 = [(BSUICAPackageView *)v8->_packageView publishedObjectWithName:@"widerainbowdimmer"];
    wideRainbowDimmerLayer = v8->_wideRainbowDimmerLayer;
    v8->_wideRainbowDimmerLayer = (CALayer *)v51;

    if (!v8->_wideRainbowDimmerLayer)
    {
      v80 = [MEMORY[0x1E4F28B00] currentHandler];
      [v80 handleFailureInMethod:a2, v8, @"SBDynamicFlashlightActivityElementPackageLayerController.m", 114, @"Couldn't find layer %@", @"widerainbowdimmer" object file lineNumber description];
    }
    uint64_t v53 = [(BSUICAPackageView *)v8->_packageView publishedObjectWithName:@"middleglowDimmer"];
    middleGlowDimmerLayer = v8->_middleGlowDimmerLayer;
    v8->_middleGlowDimmerLayer = (CALayer *)v53;

    if (!v8->_middleGlowDimmerLayer)
    {
      v81 = [MEMORY[0x1E4F28B00] currentHandler];
      [v81 handleFailureInMethod:a2, v8, @"SBDynamicFlashlightActivityElementPackageLayerController.m", 115, @"Couldn't find layer %@", @"middleglowDimmer" object file lineNumber description];
    }
  }

  return v8;
}

- (id)sensorShadowPortalLayer
{
  shadowPortalLayer = self->_shadowPortalLayer;
  if (!shadowPortalLayer)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F39C40]);
    [v4 setSourceLayer:self->_shadowLayer];
    [v4 setHidesSourceLayer:1];
    [v4 setGeometryFlipped:1];
    [(CALayer *)self->_shadowLayer bounds];
    SBRectWithSize();
    objc_msgSend(v4, "setBounds:");
    CGAffineTransformMakeScale(&v7, 0.333333333, 0.333333333);
    [v4 setAffineTransform:&v7];
    v5 = self->_shadowPortalLayer;
    self->_shadowPortalLayer = (CAPortalLayer *)v4;

    shadowPortalLayer = self->_shadowPortalLayer;
  }
  return shadowPortalLayer;
}

- (void)updateIndicatorLayersForIntensity:(double)a3 width:(double)a4 animated:(BOOL)a5
{
  long double v8 = 1.0 - a4;
  arcCropLeftLayer = self->_arcCropLeftLayer;
  CGAffineTransformMakeRotation(&v24, (a4 * 42.0 + (1.0 - a4) * 5.0) * 0.0174532925);
  [(CALayer *)arcCropLeftLayer setAffineTransform:&v24];
  arcCropRightLayer = self->_arcCropRightLayer;
  CGAffineTransformMakeRotation(&v23, (a4 * -35.0 + v8 * -5.0) * 0.0174532925);
  [(CALayer *)arcCropRightLayer setAffineTransform:&v23];
  double v11 = 1.0 - a3;
  glyphHolderLayer = self->_glyphHolderLayer;
  CGAffineTransformMakeRotation(&v22, (a3 * 0.0 + (1.0 - a3) * -10.0) * 0.0174532925 + (a4 * -38.0 + v8 * -6.4) * 0.0174532925);
  [(CALayer *)glyphHolderLayer setAffineTransform:&v22];
  long double v13 = a4 + v8 * 1.35;
  -[CALayer setBounds:](self->_circleLayer, "setBounds:", 0.0, 0.0, (double)((a3 * 1000.0 + v11 * 180.0) * v13), (double)((a3 * 1000.0 + v11 * 180.0) * v13));
  [(CALayer *)self->_circleLayer setCornerRadius:(double)((a3 * 1000.0 + (1.0 - a3) * 180.0) * v13 * 0.5)];
  long double v14 = (v13 * 641.0 + -641.0) * 0.5;
  -[CALayer setPosition:](self->_tickLineLayer, "setPosition:", 19.0, (double)(v14 + 822.1));
  ticksRingLayer = self->_ticksRingLayer;
  CATransform3DMakeRotation(&v21, (a4 * 3.8 + v8 * 2.5) * 0.0174532925, 0.0, 0.0, 1.0);
  [(CAReplicatorLayer *)ticksRingLayer setInstanceTransform:&v21];
  v16 = self->_ticksRingLayer;
  CATransform3DMakeRotation(&v20, (a4 * 0.0 + v8 * 10.5) * 0.0174532925, 0.0, 0.0, 1.0);
  [(CAReplicatorLayer *)v16 setTransform:&v20];
  long double v17 = pow(v8, 3.0) * 12.0;
  -[CALayer setPosition:](self->_glyphLayer, "setPosition:", (double)(v8 * 10.0 * a3 + v11 * 20.0 + 276.1637), (double)(v11 * (a4 * -50.0 + v8 * 0.0) + v14 * a3 + v11 * -220.0 + v17 * pow(a4, 3.0) + 320.5));
  if (a3 >= 0.9) {
    v18 = @"normal";
  }
  else {
    v18 = @"showing_max";
  }
  uint64_t v19 = v18;
  if (self->_maxLineState != v19)
  {
    objc_storeStrong((id *)&self->_maxLineState, v18);
    [(BSUICAPackageView *)self->_packageView setState:self->_maxLineState onLayer:self->_maskContentsLayer animated:1 transitionSpeed:0 completion:1.0];
  }
}

- (void)updateBeamLayersForIntensity:(double)a3 width:(double)a4 animated:(BOOL)a5
{
  double v5 = a4;
  long double v8 = 1.0 - a4;
  wideRainbowLayer = self->_wideRainbowLayer;
  CGAffineTransformMakeScale(&v38, a4 * 0.57 + (1.0 - a4) * 0.79, a4 * 1.11 + (1.0 - a4) * 0.79);
  [(CALayer *)wideRainbowLayer setAffineTransform:&v38];
  long double v10 = v5 * 0.53 + v8 * 0.25;
  *(float *)&long double v10 = v10;
  [(CALayer *)self->_wideRainbowLayer setOpacity:(double)v10];
  -[CALayer setPosition:](self->_wideRainbowLayer, "setPosition:", 237.6717, (double)(v5 * 312.0 + v8 * 390.0));
  spreadBeamImageLayer = self->_spreadBeamImageLayer;
  CATransform3DMakeScale(&v37, v5 * 3.749 + v8 * 1.969, 1.37, 1.81);
  [(CALayer *)spreadBeamImageLayer setTransform:&v37];
  long double v12 = pow(v8, 3.0);
  long double v13 = v12 * 0.525 + (1.0 - v12) * 0.0;
  *(float *)&long double v13 = v13;
  [(CALayer *)self->_straightBeamImageLayer setOpacity:(double)v13];
  straightBeamImageLayer = self->_straightBeamImageLayer;
  CGAffineTransformMakeScale(&v36, v5 * 3.33 + v8 * 0.63, v5 + v8 * 2.96);
  [(CALayer *)straightBeamImageLayer setAffineTransform:&v36];
  long double v15 = v5 * 0.28 + v8 * 0.03;
  float v16 = v15;
  *(float *)&long double v15 = v16;
  [(CALayer *)self->_rainbowLeftLayer setOpacity:(double)v15];
  *(float *)&double v17 = v16;
  [(CALayer *)self->_rainbowRightLayer setOpacity:v17];
  v18 = self->_wideRainbowLayer;
  CGAffineTransformMakeScale(&v35, v5 + v8 * 0.3, v5 + v8 * 0.5);
  [(CALayer *)v18 setAffineTransform:&v35];
  memset(&v34, 0, sizeof(v34));
  CGAffineTransformMakeRotation(&t1, (v5 * 0.0 + v8 * -50.9) * 0.0174532925);
  CGAffineTransformMakeScale(&t2, 3.56, 3.56);
  CGAffineTransformConcat(&v34, &t1, &t2);
  rainbowLeftLayer = self->_rainbowLeftLayer;
  CGAffineTransform v31 = v34;
  [(CALayer *)rainbowLeftLayer setAffineTransform:&v31];
  memset(&v31, 0, sizeof(v31));
  CGAffineTransformMakeRotation(&v30, (v5 * 0.0 + v8 * 54.1) * 0.0174532925);
  CGAffineTransformMakeScale(&v29, 3.56, 3.56);
  CGAffineTransformConcat(&v31, &v30, &v29);
  rainbowRightLayer = self->_rainbowRightLayer;
  CGAffineTransform v28 = v31;
  [(CALayer *)rainbowRightLayer setAffineTransform:&v28];
  double v21 = a3 * 0.0 + (1.0 - a3) * 0.7;
  *(float *)&long double v8 = v21;
  LODWORD(v21) = LODWORD(v8);
  [(CALayer *)self->_spreadBeamDimmerLayer setOpacity:v21];
  LODWORD(v22) = LODWORD(v8);
  [(CALayer *)self->_straightBeamDimmerLayer setOpacity:v22];
  double v23 = a3 * 0.0 + (1.0 - a3) * 0.95;
  *(float *)&double v5 = v23;
  LODWORD(v23) = LODWORD(v5);
  [(CALayer *)self->_rainbowLeftdimmerLayer setOpacity:v23];
  LODWORD(v24) = LODWORD(v5);
  [(CALayer *)self->_rainbowRightdimmerLayer setOpacity:v24];
  double v25 = a3 * 0.419 + (1.0 - a3) * 0.25;
  *(float *)&double v25 = v25;
  [(CALayer *)self->_flashlightImageLayer setOpacity:v25];
  LODWORD(v26) = LODWORD(v8);
  [(CALayer *)self->_wideRainbowDimmerLayer setOpacity:v26];
  double v27 = 1.0 - a3 + a3 * 0.0;
  *(float *)&double v27 = v27;
  [(CALayer *)self->_middleGlowDimmerLayer setOpacity:v27];
}

- (void)setBeamIntensity:(double)a3 width:(double)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  -[SBDynamicFlashlightActivityElementPackageLayerController updateBeamLayersForIntensity:width:animated:](self, "updateBeamLayersForIntensity:width:animated:");
  [(SBDynamicFlashlightActivityElementPackageLayerController *)self updateIndicatorLayersForIntensity:v5 width:a3 animated:a4];
}

- (void)setTouching:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3) {
    CGAffineTransform v7 = @"touching";
  }
  else {
    CGAffineTransform v7 = @"normal";
  }
  long double v8 = v7;
  if (self->_touchingState != v8)
  {
    uint64_t v9 = SBLogFlashlightHUD();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[SBDynamicFlashlightActivityElementPackageLayerController setTouching:animated:](a3, v9);
    }

    objc_storeStrong((id *)&self->_touchingState, v7);
    [(BSUICAPackageView *)self->_packageView setState:self->_touchingState onLayer:self->_indicatorLayer animated:v4 transitionSpeed:0 completion:1.0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchingState, 0);
  objc_storeStrong((id *)&self->_maxLineState, 0);
  objc_storeStrong((id *)&self->_middleGlowDimmerLayer, 0);
  objc_storeStrong((id *)&self->_wideRainbowDimmerLayer, 0);
  objc_storeStrong((id *)&self->_flashlightImageLayer, 0);
  objc_storeStrong((id *)&self->_rainbowRightdimmerLayer, 0);
  objc_storeStrong((id *)&self->_rainbowLeftdimmerLayer, 0);
  objc_storeStrong((id *)&self->_straightBeamDimmerLayer, 0);
  objc_storeStrong((id *)&self->_spreadBeamDimmerLayer, 0);
  objc_storeStrong((id *)&self->_circleFlaresShifterLayer, 0);
  objc_storeStrong((id *)&self->_straightBeamImageLayer, 0);
  objc_storeStrong((id *)&self->_spreadBeamImageLayer, 0);
  objc_storeStrong((id *)&self->_rainbowRightLayer, 0);
  objc_storeStrong((id *)&self->_rainbowLeftLayer, 0);
  objc_storeStrong((id *)&self->_wideRainbowLayer, 0);
  objc_storeStrong((id *)&self->_maskContentsLayer, 0);
  objc_storeStrong((id *)&self->_glyphLayer, 0);
  objc_storeStrong((id *)&self->_glyphHolderLayer, 0);
  objc_storeStrong((id *)&self->_ticksRingLayer, 0);
  objc_storeStrong((id *)&self->_tickLineLayer, 0);
  objc_storeStrong((id *)&self->_arcCropRightLayer, 0);
  objc_storeStrong((id *)&self->_arcCropLeftLayer, 0);
  objc_storeStrong((id *)&self->_circleLayer, 0);
  objc_storeStrong((id *)&self->_indicatorLayer, 0);
  objc_storeStrong((id *)&self->_shadowPortalLayer, 0);
  objc_storeStrong((id *)&self->_shadowLayer, 0);
  objc_storeStrong((id *)&self->_packageView, 0);
}

- (void)setTouching:(char)a1 animated:(NSObject *)a2 .cold.1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "Layer Touching -> %{BOOL}u", (uint8_t *)v2, 8u);
}

@end