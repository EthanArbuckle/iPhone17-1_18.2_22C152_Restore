@interface PUHeadroomGradientView
- (BOOL)isInactive;
- (BOOL)usesHighKeyStyle;
- (CAGradientLayer)bottomGradientLayer;
- (CAGradientLayer)topGradientLayer;
- (PUHeadroomGradientView)initWithFrame:(CGRect)a3;
- (PUHeadroomVariableBlurView)blurView;
- (UIColor)primaryGradientColor;
- (double)visibilityAmount;
- (void)_layoutBlurAndGradientsAnimated:(BOOL)a3;
- (void)_updateBlurEffect;
- (void)_updateGradientProperties;
- (void)didMoveToWindow;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setFrame:(CGRect)a3 animated:(BOOL)a4;
- (void)setIsInactive:(BOOL)a3;
- (void)setPrimaryGradientColor:(id)a3;
- (void)setUsesHighKeyStyle:(BOOL)a3;
- (void)setVisibilityAmount:(double)a3;
- (void)settings:(id)a3 changedValueForKeyPath:(id)a4;
@end

@implementation PUHeadroomGradientView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_topGradientLayer, 0);
  objc_storeStrong((id *)&self->_bottomGradientLayer, 0);
  objc_storeStrong((id *)&self->_primaryGradientColor, 0);
}

- (PUHeadroomVariableBlurView)blurView
{
  return self->_blurView;
}

- (CAGradientLayer)topGradientLayer
{
  return self->_topGradientLayer;
}

- (CAGradientLayer)bottomGradientLayer
{
  return self->_bottomGradientLayer;
}

- (BOOL)isInactive
{
  return self->_isInactive;
}

- (UIColor)primaryGradientColor
{
  return self->_primaryGradientColor;
}

- (BOOL)usesHighKeyStyle
{
  return self->_usesHighKeyStyle;
}

- (double)visibilityAmount
{
  return self->_visibilityAmount;
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  [(PUHeadroomGradientView *)self _updateBlurEffect];
  [(PUHeadroomGradientView *)self _updateGradientProperties];
}

- (void)setIsInactive:(BOOL)a3
{
  if (self->_isInactive != a3)
  {
    self->_isInactive = a3;
    [(PUHeadroomGradientView *)self _updateGradientProperties];
  }
}

- (void)setPrimaryGradientColor:(id)a3
{
  v8 = (UIColor *)a3;
  v5 = self->_primaryGradientColor;
  if (v5 == v8)
  {
  }
  else
  {
    v6 = v5;
    char v7 = [(UIColor *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_primaryGradientColor, a3);
      [(PUHeadroomGradientView *)self _updateGradientProperties];
    }
  }
}

- (void)setUsesHighKeyStyle:(BOOL)a3
{
  if (self->_usesHighKeyStyle != a3)
  {
    self->_usesHighKeyStyle = a3;
    [(PUHeadroomGradientView *)self _updateGradientProperties];
  }
}

- (void)setVisibilityAmount:(double)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_visibilityAmount = a3;
    v5 = +[PUPosterHeadroomSettings sharedInstance];
    [v5 blurVisibilityFraction];
    double v7 = a3 / v6;

    v8 = [(PUHeadroomGradientView *)self blurView];
    objc_msgSend(v8, "setAlpha:", fmin(v7, 1.0));

    [(PUHeadroomGradientView *)self visibilityAmount];
    -[PUHeadroomGradientView setAlpha:](self, "setAlpha:");
  }
}

- (void)_layoutBlurAndGradientsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PUHeadroomGradientView *)self window];
  double v6 = [v5 screen];
  [v6 scale];
  double v8 = v7;

  if (v8 > 0.0)
  {
    [(PUHeadroomGradientView *)self bounds];
    PXRectRoundToPixel();
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    PXSizeGetAspectRatio();
    v17 = +[PUPosterHeadroomSettings sharedInstance];
    [v17 gradientHeight];
    PFSizeWithAspectRatioFittingSize();

    v18 = [(PUHeadroomGradientView *)self blurView];
    double v19 = v10;
    objc_msgSend(v18, "setFrame:", v10, v12, v14, v16);

    v20 = [(PUHeadroomGradientView *)self bottomGradientLayer];
    [v20 bounds];
    double v65 = v21;
    double v66 = v22;
    double v67 = v23;
    double v68 = v24;

    PXRectWithSizeAlignedToRectEdges();
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    v33 = [(PUHeadroomGradientView *)self bottomGradientLayer];
    double v34 = v26;
    double v35 = v19;
    double v36 = v14;
    double v37 = v12;
    double v38 = v28;
    double v39 = v16;
    objc_msgSend(v33, "setBounds:", v34, v38, v30, v32);

    double v40 = v36;
    PXRectWithSizeAlignedToRectEdges();
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;
    double v48 = v47;
    v49 = [(PUHeadroomGradientView *)self topGradientLayer];
    objc_msgSend(v49, "setBounds:", v42, v44, v46, v48);

    if (v3)
    {
      id v69 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"bounds"];
      [MEMORY[0x1E4FB1EB0] inheritedAnimationDuration];
      objc_msgSend(v69, "setDuration:");
      switch([MEMORY[0x1E4FB1EB0] _currentAnimationCurve])
      {
        case 0:
          v53 = (void *)MEMORY[0x1E4F39C10];
          v54 = (void *)MEMORY[0x1E4F3A490];
          goto LABEL_10;
        case 1:
          v53 = (void *)MEMORY[0x1E4F39C10];
          v54 = (void *)MEMORY[0x1E4F3A488];
          goto LABEL_10;
        case 2:
          v53 = (void *)MEMORY[0x1E4F39C10];
          v54 = (void *)MEMORY[0x1E4F3A498];
          goto LABEL_10;
        case 3:
          v53 = (void *)MEMORY[0x1E4F39C10];
          v54 = (void *)MEMORY[0x1E4F3A4A0];
          goto LABEL_10;
        case 4:
          LODWORD(v50) = 1059648963;
          LODWORD(v51) = 1051260355;
          LODWORD(v52) = 1.0;
          uint64_t v55 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v50 :0.0 :v51 :v52];
          goto LABEL_11;
        default:
          v53 = (void *)MEMORY[0x1E4F39C10];
          v54 = (void *)MEMORY[0x1E4F3A480];
LABEL_10:
          uint64_t v55 = objc_msgSend(v53, "functionWithName:", *v54, *(void *)&v65, *(void *)&v66, *(void *)&v67, *(void *)&v68);
LABEL_11:
          v56 = (void *)v55;
          double v58 = v67;
          double v57 = v68;
          double v60 = v65;
          double v59 = v66;
          objc_msgSend(v69, "setTimingFunction:", v55, *(void *)&v65, *(void *)&v66, *(void *)&v67, *(void *)&v68);

          v61 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v35, v37, v40, v39);
          [v69 setToValue:v61];

          v62 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v60, v59, v58, v57);
          [v69 setFromValue:v62];

          v63 = [(PUHeadroomGradientView *)self bottomGradientLayer];
          [v63 addAnimation:v69 forKey:@"boundsAnimation"];

          v64 = [(PUHeadroomGradientView *)self topGradientLayer];
          [v64 addAnimation:v69 forKey:@"boundsAnimation"];

          break;
      }
    }
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)PUHeadroomGradientView;
  [(PUHeadroomGradientView *)&v3 didMoveToWindow];
  [(PUHeadroomGradientView *)self _layoutBlurAndGradientsAnimated:0];
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PUHeadroomGradientView *)self bounds];
  v8.receiver = self;
  v8.super_class = (Class)PUHeadroomGradientView;
  -[PUHeadroomGradientView setBounds:](&v8, sel_setBounds_, x, y, width, height);
  if ((PXRectApproximatelyEqualToRect() & 1) == 0) {
    [(PUHeadroomGradientView *)self _layoutBlurAndGradientsAnimated:0];
  }
}

- (void)setFrame:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PUHeadroomGradientView *)self frame];
  v10.receiver = self;
  v10.super_class = (Class)PUHeadroomGradientView;
  -[PUHeadroomGradientView setFrame:](&v10, sel_setFrame_, x, y, width, height);
  if ((PXRectApproximatelyEqualToRect() & 1) == 0) {
    [(PUHeadroomGradientView *)self _layoutBlurAndGradientsAnimated:v4];
  }
}

- (void)setFrame:(CGRect)a3
{
}

- (void)_updateGradientProperties
{
  v60[2] = *MEMORY[0x1E4F143B8];
  objc_super v3 = +[PUPosterHeadroomSettings sharedInstance];
  if ([(PUHeadroomGradientView *)self usesHighKeyStyle]) {
    [v3 highKeyGradientWhite];
  }
  else {
    [v3 gradientWhite];
  }
  double v5 = v4;
  double v6 = [(PUHeadroomGradientView *)self primaryGradientColor];
  double v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4FB1618] colorWithWhite:v5 alpha:1.0];
  }
  double v9 = v8;

  objc_super v10 = [v9 colorWithAlphaComponent:0.0];
  id v11 = v9;
  v60[0] = [v11 CGColor];
  id v12 = v10;
  v60[1] = [v12 CGColor];
  double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
  double v14 = [(PUHeadroomGradientView *)self bottomGradientLayer];
  [v14 setColors:v13];

  double v15 = NSNumber;
  [v3 bottomGradientTopLocation];
  double v16 = objc_msgSend(v15, "numberWithDouble:");
  v59[0] = v16;
  v17 = NSNumber;
  [v3 bottomGradientBottomLocation];
  v18 = objc_msgSend(v17, "numberWithDouble:");
  v59[1] = v18;
  double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
  v20 = [(PUHeadroomGradientView *)self bottomGradientLayer];
  [v20 setLocations:v19];

  [v3 bottomGradientAlpha];
  float v22 = v21;
  double v23 = [(PUHeadroomGradientView *)self bottomGradientLayer];
  *(float *)&double v24 = v22;
  [v23 setOpacity:v24];

  id v25 = v11;
  v58[0] = [v25 CGColor];
  id v26 = v12;
  v58[1] = [v26 CGColor];
  double v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
  double v28 = [(PUHeadroomGradientView *)self topGradientLayer];
  [v28 setColors:v27];

  double v29 = NSNumber;
  [v3 topGradientTopLocation];
  double v30 = objc_msgSend(v29, "numberWithDouble:");
  v57[0] = v30;
  double v31 = NSNumber;
  [v3 topGradientBottomLocation];
  double v32 = objc_msgSend(v31, "numberWithDouble:");
  v57[1] = v32;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
  double v34 = [(PUHeadroomGradientView *)self topGradientLayer];
  [v34 setLocations:v33];

  [v3 topGradientAlpha];
  float v36 = v35;
  double v37 = [(PUHeadroomGradientView *)self topGradientLayer];
  *(float *)&double v38 = v36;
  [v37 setOpacity:v38];

  int v39 = [v3 useSoftLightBlendingModeForTopGradient];
  if (v39)
  {
    double v40 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A300]];
  }
  else
  {
    double v40 = 0;
  }
  double v41 = [(PUHeadroomGradientView *)self topGradientLayer];
  [v41 setCompositingFilter:v40];

  if (v39) {
  if ([(PUHeadroomGradientView *)self isInactive])
  }
  {
    double v42 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A038]];
    [v42 setName:@"colorMatrix"];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v50 = 0u;
    PUColorMatrixMakeInactive(&v50);
    v49[2] = v52;
    v49[3] = v53;
    v49[4] = v54;
    v49[0] = v50;
    v49[1] = v51;
    double v43 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v49];
    [v42 setValue:v43 forKey:*MEMORY[0x1E4F3A168]];

    v56 = v42;
    double v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
    double v45 = [(PUHeadroomGradientView *)self bottomGradientLayer];
    [v45 setFilters:v44];

    uint64_t v55 = v42;
    double v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
    double v47 = [(PUHeadroomGradientView *)self topGradientLayer];
    [v47 setFilters:v46];
  }
  else
  {
    double v48 = [(PUHeadroomGradientView *)self bottomGradientLayer];
    [v48 setFilters:0];

    double v42 = [(PUHeadroomGradientView *)self topGradientLayer];
    [v42 setFilters:0];
  }
}

- (void)_updateBlurEffect
{
  id v2 = [(PUHeadroomGradientView *)self blurView];
  [v2 _updateBlurProperties];
}

- (PUHeadroomGradientView)initWithFrame:(CGRect)a3
{
  v26[2] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)PUHeadroomGradientView;
  objc_super v3 = -[PUHeadroomGradientView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = objc_alloc_init(PUHeadroomVariableBlurView);
    blurView = v3->_blurView;
    v3->_blurView = v4;

    [(PUHeadroomVariableBlurView *)v3->_blurView setAlpha:0.0];
    [(PUHeadroomGradientView *)v3 addSubview:v3->_blurView];
    uint64_t v6 = [MEMORY[0x1E4F39BD0] layer];
    bottomGradientLayer = v3->_bottomGradientLayer;
    v3->_bottomGradientLayer = (CAGradientLayer *)v6;

    double v8 = *MEMORY[0x1E4F1DAD8];
    double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    -[CAGradientLayer setAnchorPoint:](v3->_bottomGradientLayer, "setAnchorPoint:", *MEMORY[0x1E4F1DAD8], v9);
    v25[0] = @"bounds";
    objc_super v10 = [MEMORY[0x1E4F1CA98] null];
    v25[1] = @"opacity";
    v26[0] = v10;
    id v11 = [MEMORY[0x1E4F1CA98] null];
    v26[1] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
    [(CAGradientLayer *)v3->_bottomGradientLayer setActions:v12];

    double v13 = [(PUHeadroomGradientView *)v3 layer];
    [v13 addSublayer:v3->_bottomGradientLayer];

    uint64_t v14 = [MEMORY[0x1E4F39BD0] layer];
    topGradientLayer = v3->_topGradientLayer;
    v3->_topGradientLayer = (CAGradientLayer *)v14;

    -[CAGradientLayer setAnchorPoint:](v3->_topGradientLayer, "setAnchorPoint:", v8, v9);
    v23[0] = @"bounds";
    double v16 = [MEMORY[0x1E4F1CA98] null];
    v23[1] = @"opacity";
    v24[0] = v16;
    v17 = [MEMORY[0x1E4F1CA98] null];
    v24[1] = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
    [(CAGradientLayer *)v3->_topGradientLayer setActions:v18];

    double v19 = [(PUHeadroomGradientView *)v3 layer];
    [v19 addSublayer:v3->_topGradientLayer];

    [(PUHeadroomGradientView *)v3 setAlpha:0.0];
    [(PUHeadroomGradientView *)v3 _updateBlurEffect];
    [(PUHeadroomGradientView *)v3 _updateGradientProperties];
    v20 = +[PUPosterHeadroomSettings sharedInstance];
    [v20 addDeferredKeyPathObserver:v3];
  }
  return v3;
}

@end