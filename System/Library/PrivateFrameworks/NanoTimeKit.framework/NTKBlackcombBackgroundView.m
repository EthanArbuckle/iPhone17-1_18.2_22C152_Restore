@interface NTKBlackcombBackgroundView
- (BOOL)usesLongSideTicks;
- (CGRect)_tickLayoutBounds;
- (double)_innerDialRadiusAtLargeTick:(int64_t)a3 verticalLength:(double)a4 horizontalLength:(double)a5;
- (double)_outerDialRadiusAtMediumTick:(int64_t)a3 verticalLength:(double)a4 horizontalLength:(double)a5;
- (id)initForDevice:(id)a3;
- (void)_applyBackgroundColor:(id)a3;
- (void)_layoutTopLargeTick;
- (void)_setupTicks;
- (void)applyPalette:(id)a3;
- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5;
- (void)applyTransitionFractionToUsesLongSideTicks:(double)a3;
- (void)configureTicksForStatus:(BOOL)a3;
- (void)setUsesLongSideTicks:(BOOL)a3;
@end

@implementation NTKBlackcombBackgroundView

- (id)initForDevice:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKBlackcombBackgroundView;
  v6 = [(NTKBlackcombBackgroundView *)&v11 init];
  p_isa = (id *)&v6->super.super.super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = [p_isa layer];
    [p_isa[51] screenCornerRadius];
    objc_msgSend(v8, "setCornerRadius:");

    v9 = [p_isa layer];
    [v9 setCornerCurve:*MEMORY[0x1E4F39EA8]];

    [p_isa _setupTicks];
    [p_isa _layoutTopLargeTick];
  }

  return p_isa;
}

- (CGRect)_tickLayoutBounds
{
  uint64_t v17 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  *(_OWORD *)dx = 0u;
  long long v10 = 0u;
  _LayoutConstants_13(self->_device, (uint64_t)dx);
  [(CLKDevice *)self->_device screenBounds];
  CGFloat v7 = dx[0];
  CGFloat v8 = dx[0];

  return CGRectInset(*(CGRect *)&v3, v7, v8);
}

- (void)_setupTicks
{
  uint64_t v84 = 0;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  _LayoutConstants_13(self->_device, (uint64_t)&v76);
  uint64_t v3 = [(NTKBlackcombBackgroundView *)self _tickLayoutBounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = MEMORY[0x1C1874A70](v3);
  double v14 = v13;
  long long v15 = [MEMORY[0x1E4F39BE8] layer];
  double v67 = v5;
  objc_msgSend(v15, "setBounds:", v5, v7, v9, v11);
  objc_msgSend(v15, "setPosition:", v12, v14);
  [(CLKDevice *)self->_device screenCornerRadius];
  double v17 = v16;
  [(CLKDevice *)self->_device screenBounds];
  double v19 = v17 * (v18 + *(double *)&v76 * -2.0);
  [(CLKDevice *)self->_device screenBounds];
  [v15 setCornerRadius:v19 / v20];
  uint64_t v21 = *MEMORY[0x1E4F39EA8];
  [v15 setCornerCurve:*MEMORY[0x1E4F39EA8]];
  [v15 setMasksToBounds:1];
  if ([MEMORY[0x1E4FB1438] isRunningInStoreDemoMode])
  {
    [v15 setShouldRasterize:1];
    [(CLKDevice *)self->_device screenScale];
    objc_msgSend(v15, "setRasterizationScale:");
  }
  uint64_t v22 = *((void *)&v76 + 1);
  uint64_t v72 = *((void *)&v80 + 1);
  v63 = [MEMORY[0x1E4F1CA48] array];
  if (v22 >= 1)
  {
    uint64_t v23 = 0;
    double v24 = *(double *)&v77;
    do
    {
      if (v23 % (v22 / v72))
      {
        v25 = [MEMORY[0x1E4F39BE8] layer];
        objc_msgSend(v25, "setBounds:", 0.0, 0.0, v11, v24);
        objc_msgSend(v25, "setAnchorPoint:", 0.0, 0.5);
        objc_msgSend(v25, "setPosition:", v12, v14);
        id v26 = [MEMORY[0x1E4FB1618] colorWithWhite:0.4 alpha:1.0];
        objc_msgSend(v25, "setBackgroundColor:", objc_msgSend(v26, "CGColor"));

        CGAffineTransformMakeRotation(&v75, (double)v23 * (6.28318531 / (double)v22) + -1.57079633);
        [v25 setAffineTransform:&v75];
        [v15 addSublayer:v25];
        [v63 addObject:v25];
      }
      ++v23;
    }
    while (v22 != v23);
  }
  double v70 = v14;
  double v71 = v12;
  v27 = (NSArray *)[v63 copy];
  smallTicks = self->_smallTicks;
  self->_smallTicks = v27;

  v29 = [MEMORY[0x1E4F39BE8] layer];
  smallTickCoveringLayer = self->_smallTickCoveringLayer;
  self->_smallTickCoveringLayer = v29;

  v31 = self->_smallTickCoveringLayer;
  MEMORY[0x1C1874A70](v67, v7, v9, v11);
  -[CALayer setPosition:](v31, "setPosition:");
  v32 = self->_smallTickCoveringLayer;
  double v33 = *((double *)&v77 + 1);
  v91.origin.x = v67;
  v91.origin.y = v7;
  v91.size.width = v9;
  v91.size.height = v11;
  CGRect v92 = CGRectInset(v91, *((CGFloat *)&v77 + 1), *((CGFloat *)&v77 + 1));
  -[CALayer setBounds:](v32, "setBounds:", v92.origin.x, v92.origin.y, v92.size.width, v92.size.height);
  v34 = self->_smallTickCoveringLayer;
  id v35 = [(NTKBlackcombColorPalette *)self->_palette background];
  -[CALayer setBackgroundColor:](v34, "setBackgroundColor:", [v35 CGColor]);

  [(CLKDevice *)self->_device screenCornerRadius];
  [(CALayer *)self->_smallTickCoveringLayer setCornerRadius:v36 - v33];
  [(CALayer *)self->_smallTickCoveringLayer setCornerCurve:v21];
  [v15 addSublayer:self->_smallTickCoveringLayer];
  v37 = [(NTKBlackcombBackgroundView *)self layer];
  [v37 addSublayer:v15];

  v38 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v39 = v72;
  double v62 = (double)v72;
  if (v72 >= 1)
  {
    uint64_t v40 = 0;
    long long v41 = v78;
    double v65 = *(double *)&v78;
    double v68 = *((double *)&v79 + 1) + *((double *)&v79 + 1);
    double v64 = *(double *)&v78 * 0.5;
    double v42 = 6.28318531 / v62;
    do
    {
      double v43 = _LargeOrMediumTickLengthAtIndex(v40, self->_device, *((double *)&v41 + 1), *((double *)&v41 + 1), v68);
      v44 = [MEMORY[0x1E4F39BE8] layer];
      objc_msgSend(v44, "setBounds:", 0.0, 0.0, v65, v43);
      [v44 setCornerRadius:v64];
      CGAffineTransformMakeRotation(&v74, (double)v40 * v42 + 3.14159265);
      [v44 setAffineTransform:&v74];
      id v45 = [MEMORY[0x1E4FB1618] colorWithWhite:0.6 alpha:1.0];
      objc_msgSend(v44, "setBackgroundColor:", objc_msgSend(v45, "CGColor"));
      [(NTKBlackcombBackgroundView *)self _outerDialRadiusAtMediumTick:v40 verticalLength:*((double *)&v41 + 1) horizontalLength:*((double *)&v41 + 1)];
      objc_msgSend(v44, "setPosition:", _TickPosition(self->_device, v12, v14, v46, (double)v40 * v42 + -1.57079633));
      v47 = [(NTKBlackcombBackgroundView *)self layer];
      [v47 addSublayer:v44];

      [v38 addObject:v44];
      uint64_t v39 = v72;

      ++v40;
    }
    while (v72 != v40);
  }
  v48 = (NSArray *)[v38 copy];
  mediumTicks = self->_mediumTicks;
  self->_mediumTicks = v48;

  v50 = [MEMORY[0x1E4F1CA48] array];
  if (v39 >= 1)
  {
    uint64_t v51 = 0;
    double v53 = *((double *)&v81 + 1);
    double v52 = *(double *)&v82;
    double v66 = *(double *)&v81 * 0.5;
    double v69 = *(double *)&v81;
    do
    {
      double v54 = _LargeOrMediumTickLengthAtIndex(v51, self->_device, v52, v53, 0.0);
      v55 = [MEMORY[0x1E4F39BE8] layer];
      objc_msgSend(v55, "setBounds:", 0.0, 0.0, v69, v54);
      [v55 setCornerRadius:v66];
      device = self->_device;
      uint64_t v90 = 0;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      memset(v85, 0, sizeof(v85));
      _LayoutConstants_13(device, (uint64_t)v85);
      CGAffineTransformMakeRotation(&v73, (double)v51 * (6.28318531 / (double)*((uint64_t *)&v86 + 1)) + 3.14159265);
      [v55 setAffineTransform:&v73];
      id v57 = [MEMORY[0x1E4FB1618] whiteColor];
      objc_msgSend(v55, "setBackgroundColor:", objc_msgSend(v57, "CGColor"));
      [(NTKBlackcombBackgroundView *)self _innerDialRadiusAtLargeTick:v51 verticalLength:v52 horizontalLength:v53];
      objc_msgSend(v55, "setPosition:", _TickPosition(self->_device, v71, v70, v58, (double)v51 * (6.28318531 / v62) + -1.57079633));
      v59 = [(NTKBlackcombBackgroundView *)self layer];
      [v59 addSublayer:v55];

      [v50 addObject:v55];
      ++v51;
    }
    while (v72 != v51);
  }
  v60 = (NSArray *)[v50 copy];
  largeTicks = self->_largeTicks;
  self->_largeTicks = v60;
}

- (void)_applyBackgroundColor:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F39CF8];
  id v5 = a3;
  [v4 begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(NTKBlackcombBackgroundView *)self setBackgroundColor:v5];
  smallTickCoveringLayer = self->_smallTickCoveringLayer;
  id v7 = v5;
  uint64_t v8 = [v7 CGColor];

  [(CALayer *)smallTickCoveringLayer setBackgroundColor:v8];
  double v9 = (void *)MEMORY[0x1E4F39CF8];

  [v9 commit];
}

- (void)applyPalette:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_palette, a3);
  smallTicks = self->_smallTicks;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __43__NTKBlackcombBackgroundView_applyPalette___block_invoke;
  v17[3] = &unk_1E62C33C0;
  id v7 = v5;
  id v18 = v7;
  [(NSArray *)smallTicks enumerateObjectsUsingBlock:v17];
  mediumTicks = self->_mediumTicks;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __43__NTKBlackcombBackgroundView_applyPalette___block_invoke_2;
  v15[3] = &unk_1E62C33C0;
  id v9 = v7;
  id v16 = v9;
  [(NSArray *)mediumTicks enumerateObjectsUsingBlock:v15];
  largeTicks = self->_largeTicks;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __43__NTKBlackcombBackgroundView_applyPalette___block_invoke_3;
  v13[3] = &unk_1E62C33C0;
  id v14 = v9;
  id v11 = v9;
  [(NSArray *)largeTicks enumerateObjectsUsingBlock:v13];
  double v12 = [(NTKBlackcombColorPalette *)self->_palette background];
  [(NTKBlackcombBackgroundView *)self _applyBackgroundColor:v12];
}

void __43__NTKBlackcombBackgroundView_applyPalette___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 smallTick];
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));
}

void __43__NTKBlackcombBackgroundView_applyPalette___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 largeTick];
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));
}

void __43__NTKBlackcombBackgroundView_applyPalette___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 hourMarker];
  objc_msgSend(v3, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));
}

- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  double v10 = [v8 identifier];
  id v11 = [v9 identifier];
  int v12 = [v10 isEqual:v11];

  if (v12)
  {
    [(NTKBlackcombBackgroundView *)self applyPalette:v8];
  }
  else
  {
    double v13 = [v8 background];
    id v14 = [v9 background];
    long long v15 = NTKInterpolateBetweenColors();
    [(NTKBlackcombBackgroundView *)self _applyBackgroundColor:v15];

    if (a3 <= 0.5) {
      id v16 = v8;
    }
    else {
      id v16 = v9;
    }
    objc_storeStrong((id *)&self->_palette, v16);
    CLKCompressFraction();
    double v18 = v17;
    uint64_t v59 = 0;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    memset(v54, 0, sizeof(v54));
    _LayoutConstants_13(self->_device, (uint64_t)v54);
    double v19 = (double)*((uint64_t *)&v54[0] + 1);
    uint64_t v20 = (uint64_t)(v18 * (double)*((uint64_t *)&v54[0] + 1));
    unint64_t v21 = [(NSArray *)self->_smallTicks count];
    smallTicks = self->_smallTicks;
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __76__NTKBlackcombBackgroundView_applyTransitionFraction_fromPalette_toPalette___block_invoke;
    v49[3] = &unk_1E62C33E8;
    double v52 = v19 / (double)v21;
    uint64_t v53 = v20;
    id v23 = v9;
    id v50 = v23;
    id v24 = v8;
    id v51 = v24;
    [(NSArray *)smallTicks enumerateObjectsUsingBlock:v49];
    mediumTicks = self->_mediumTicks;
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __76__NTKBlackcombBackgroundView_applyTransitionFraction_fromPalette_toPalette___block_invoke_2;
    v44[3] = &unk_1E62C33E8;
    double v26 = v19 / (double)*((uint64_t *)&v55 + 1);
    double v47 = v26;
    uint64_t v48 = v20;
    id v27 = v23;
    id v45 = v27;
    id v28 = v24;
    id v46 = v28;
    [(NSArray *)mediumTicks enumerateObjectsUsingBlock:v44];
    double v29 = MEMORY[0x1C1874A70]([(NTKBlackcombBackgroundView *)self _tickLayoutBounds]);
    uint64_t v31 = v30;
    v32 = [v28 hourMarker];
    double v33 = [v27 hourMarker];
    largeTicks = self->_largeTicks;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __76__NTKBlackcombBackgroundView_applyTransitionFraction_fromPalette_toPalette___block_invoke_3;
    v37[3] = &unk_1E62C3410;
    double v40 = v26;
    uint64_t v41 = v20;
    id v38 = v32;
    id v39 = v33;
    double v42 = v29;
    uint64_t v43 = v31;
    id v35 = v33;
    id v36 = v32;
    [(NSArray *)largeTicks enumerateObjectsUsingBlock:v37];
  }
}

void __76__NTKBlackcombBackgroundView_applyTransitionFraction_fromPalette_toPalette___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v3 = 40;
  if (*(double *)(a1 + 48) * (double)a3 < (double)*(uint64_t *)(a1 + 56)) {
    uint64_t v3 = 32;
  }
  id v4 = *(void **)(a1 + v3);
  id v5 = a2;
  id v6 = [v4 smallTick];
  objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(v6, "CGColor"));
}

void __76__NTKBlackcombBackgroundView_applyTransitionFraction_fromPalette_toPalette___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v3 = 40;
  if (*(double *)(a1 + 48) * (double)a3 < (double)*(uint64_t *)(a1 + 56)) {
    uint64_t v3 = 32;
  }
  id v4 = *(void **)(a1 + v3);
  id v5 = a2;
  id v6 = [v4 largeTick];
  objc_msgSend(v5, "setBackgroundColor:", objc_msgSend(v6, "CGColor"));
}

void __76__NTKBlackcombBackgroundView_applyTransitionFraction_fromPalette_toPalette___block_invoke_3(uint64_t a1, void *a2, unint64_t a3)
{
  v35[9] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = 32;
  if (*(double *)(a1 + 48) * (double)a3 < (double)*(uint64_t *)(a1 + 56)) {
    uint64_t v6 = 40;
  }
  id v7 = (CGColor *)[*(id *)(a1 + v6) CGColor];
  id v8 = (CGColor *)[v5 backgroundColor];
  [v5 setBackgroundColor:v7];
  if (!CGColorEqualToColor(v7, v8))
  {
    [v5 position];
    double v10 = *(double *)(a1 + 64) - v9;
    double v12 = *(double *)(a1 + 72) - v11;
    double v13 = sqrt(v12 * v12 + v10 * v10);
    double v14 = v10 / v13;
    double v15 = v12 / v13;
    double v16 = v10 / v13 * 5.0;
    double v17 = v12 / v13 * 5.0;
    double v33 = objc_opt_new();
    [v33 setDuration:0.5];
    v34 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"backgroundColor"];
    [v34 setDuration:0.5];
    [v34 setFromValue:v8];
    [v34 setToValue:v7];
    v32 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.scale.xy"];
    [v32 setDuration:0.33];
    [v32 setByValue:&unk_1F16E7250];
    [v32 setCumulative:1];
    uint64_t v18 = *MEMORY[0x1E4F39FA0];
    [v32 setFillMode:*MEMORY[0x1E4F39FA0]];
    double v19 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.translation.x"];
    [v19 setDuration:0.33];
    uint64_t v20 = [NSNumber numberWithDouble:v16];
    [v19 setByValue:v20];

    [v19 setCumulative:1];
    [v19 setFillMode:v18];
    uint64_t v31 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.translation.y"];
    [v31 setDuration:0.33];
    unint64_t v21 = [NSNumber numberWithDouble:v17];
    [v31 setByValue:v21];

    [v31 setCumulative:1];
    [v31 setFillMode:v18];
    uint64_t v22 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
    [v22 setDuration:0.33];
    [v22 setByValue:&unk_1F16E7260];
    [v22 setCumulative:1];
    [v22 setFillMode:v18];
    id v23 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.scale.xy"];
    [v23 setDuration:0.17];
    [v23 setByValue:&unk_1F16E7270];
    [v23 setBeginTime:0.33];
    [v23 setCumulative:1];
    id v24 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.translation.x"];
    [v24 setDuration:0.17];
    v25 = [NSNumber numberWithDouble:-(v14 * 5.0)];
    [v24 setByValue:v25];

    [v24 setBeginTime:0.33];
    [v24 setCumulative:1];
    double v26 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.translation.y"];
    [v26 setDuration:0.17];
    id v27 = [NSNumber numberWithDouble:-(v15 * 5.0)];
    [v26 setByValue:v27];

    [v26 setBeginTime:0.33];
    [v26 setCumulative:1];
    [v26 setFillMode:v18];
    id v28 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
    [v28 setDuration:0.17];
    [v28 setByValue:&unk_1F16E7280];
    [v28 setBeginTime:0.33];
    [v28 setCumulative:1];
    v35[0] = v34;
    v35[1] = v32;
    v35[2] = v19;
    v35[3] = v31;
    v35[4] = v22;
    v35[5] = v23;
    v35[6] = v24;
    v35[7] = v26;
    v35[8] = v28;
    double v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:9];
    [v33 setAnimations:v29];

    LODWORD(v30) = 2.0;
    [v33 setSpeed:v30];

    [v5 addAnimation:v33 forKey:@"Key"];
  }
}

- (void)_layoutTopLargeTick
{
  uint64_t v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  memset(v13, 0, sizeof(v13));
  _LayoutConstants_13(self->_device, (uint64_t)v13);
  double v3 = *(double *)&v14;
  if (self->_showingStatus) {
    double v4 = *(double *)&v15;
  }
  else {
    double v4 = 0.0;
  }
  double v5 = MEMORY[0x1C1874A70]([(NTKBlackcombBackgroundView *)self _tickLayoutBounds]);
  double v7 = v6;
  [(NTKBlackcombBackgroundView *)self _innerDialRadiusAtLargeTick:0 verticalLength:v3 horizontalLength:0.0];
  double v9 = v8 + v4 * -0.5;
  id v12 = [(NSArray *)self->_largeTicks objectAtIndexedSubscript:0];
  objc_msgSend(v12, "setPosition:", _TickPosition(self->_device, v5, v7, v9, -1.57079633));
  [v12 bounds];
  double v11 = v10;
  _LayoutConstants_13(self->_device, (uint64_t)v17);
  objc_msgSend(v12, "setBounds:", 0.0, 0.0, v11, v3 - v4 + v18);
}

- (void)setUsesLongSideTicks:(BOOL)a3
{
  if (self->_usesLongSideTicks != a3)
  {
    BOOL v3 = a3;
    self->_usesLongSideTicks = a3;
    uint64_t v32 = 0;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    _LayoutConstants_13(self->_device, (uint64_t)&v24);
    uint64_t v5 = v30;
    if (v3) {
      uint64_t v6 = v30;
    }
    else {
      uint64_t v6 = *((void *)&v29 + 1);
    }
    double v7 = MEMORY[0x1C1874A70]([(NTKBlackcombBackgroundView *)self _tickLayoutBounds]);
    largeTicks = self->_largeTicks;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    long long v16 = v29;
    long long v17 = v30;
    long long v18 = v31;
    long long v12 = v25;
    long long v13 = v26;
    long long v14 = v27;
    long long v15 = v28;
    v10[2] = __51__NTKBlackcombBackgroundView_setUsesLongSideTicks___block_invoke;
    v10[3] = &unk_1E62C3438;
    v10[4] = self;
    uint64_t v19 = v32;
    long long v11 = v24;
    uint64_t v20 = v5;
    uint64_t v21 = v6;
    double v22 = v7;
    uint64_t v23 = v9;
    [(NSArray *)largeTicks enumerateObjectsUsingBlock:v10];
  }
}

void __51__NTKBlackcombBackgroundView_setUsesLongSideTicks___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (a3)
  {
    double v5 = (double)(unint64_t)a3 * (6.28318531 / (double)*(uint64_t *)(a1 + 112)) + -1.57079633;
    [*(id *)(a1 + 32) _innerDialRadiusAtLargeTick:a3 verticalLength:*(double *)(a1 + 176) horizontalLength:*(double *)(a1 + 184)];
    objc_msgSend(v8, "setPosition:", _TickPosition(*(void **)(*(void *)(a1 + 32) + 408), *(double *)(a1 + 192), *(double *)(a1 + 200), v6, v5));
    [v8 bounds];
    objc_msgSend(v8, "setBounds:", 0.0, 0.0, v7, _LargeOrMediumTickLengthAtIndex(a3, *(void **)(*(void *)(a1 + 32) + 408), *(double *)(a1 + 176), *(double *)(a1 + 184), 0.0));
  }
  else
  {
    [*(id *)(a1 + 32) _layoutTopLargeTick];
  }
}

- (void)applyTransitionFractionToUsesLongSideTicks:(double)a3
{
  uint64_t v32 = 0;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  _LayoutConstants_13(self->_device, (uint64_t)&v24);
  uint64_t v4 = v30;
  CLKInterpolateBetweenFloatsClipped();
  uint64_t v6 = v5;
  double v7 = MEMORY[0x1C1874A70]([(NTKBlackcombBackgroundView *)self _tickLayoutBounds]);
  largeTicks = self->_largeTicks;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  long long v16 = v29;
  long long v17 = v30;
  long long v18 = v31;
  long long v12 = v25;
  long long v13 = v26;
  long long v14 = v27;
  long long v15 = v28;
  v10[2] = __73__NTKBlackcombBackgroundView_applyTransitionFractionToUsesLongSideTicks___block_invoke;
  v10[3] = &unk_1E62C3438;
  v10[4] = self;
  uint64_t v19 = v32;
  long long v11 = v24;
  uint64_t v20 = v4;
  uint64_t v21 = v6;
  double v22 = v7;
  uint64_t v23 = v9;
  [(NSArray *)largeTicks enumerateObjectsUsingBlock:v10];
}

void __73__NTKBlackcombBackgroundView_applyTransitionFractionToUsesLongSideTicks___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (a3)
  {
    double v5 = (double)(unint64_t)a3 * (6.28318531 / (double)*(uint64_t *)(a1 + 112)) + -1.57079633;
    [*(id *)(a1 + 32) _innerDialRadiusAtLargeTick:a3 verticalLength:*(double *)(a1 + 176) horizontalLength:*(double *)(a1 + 184)];
    objc_msgSend(v8, "setPosition:", _TickPosition(*(void **)(*(void *)(a1 + 32) + 408), *(double *)(a1 + 192), *(double *)(a1 + 200), v6, v5));
    [v8 bounds];
    objc_msgSend(v8, "setBounds:", 0.0, 0.0, v7, _LargeOrMediumTickLengthAtIndex(a3, *(void **)(*(void *)(a1 + 32) + 408), *(double *)(a1 + 176), *(double *)(a1 + 184), 0.0));
  }
  else
  {
    [*(id *)(a1 + 32) _layoutTopLargeTick];
  }
}

- (void)configureTicksForStatus:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showingStatus = a3;
  double v5 = [(NSArray *)self->_mediumTicks firstObject];
  [v5 setHidden:v3];

  double v6 = [(NSArray *)self->_smallTicks firstObject];
  [v6 setHidden:v3];

  double v7 = [(NSArray *)self->_smallTicks lastObject];
  [v7 setHidden:v3];

  [(NTKBlackcombBackgroundView *)self _layoutTopLargeTick];
}

- (double)_outerDialRadiusAtMediumTick:(int64_t)a3 verticalLength:(double)a4 horizontalLength:(double)a5
{
  [(NTKBlackcombBackgroundView *)self _tickLayoutBounds];
  double v10 = v9;
  double v12 = v11;
  _LayoutConstants_13(self->_device, (uint64_t)v18);
  double v13 = v19;
  _LayoutConstants_13(self->_device, (uint64_t)v17);
  double v14 = (v10 - a5) * 0.5;
  double v15 = (v12 - a4) * 0.5;
  switch(a3)
  {
    case 0:
    case 6:
      double result = v15 + v13;
      break;
    case 1:
    case 5:
    case 7:
    case 11:
      double result = v15 / 0.866025404 - v17[8];
      break;
    case 2:
    case 4:
    case 8:
    case 10:
      double result = v13 + v14 / 0.866025404;
      break;
    case 3:
    case 9:
      double result = v14 + v13;
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

- (double)_innerDialRadiusAtLargeTick:(int64_t)a3 verticalLength:(double)a4 horizontalLength:(double)a5
{
  [(NTKBlackcombBackgroundView *)self _tickLayoutBounds];
  double v10 = v9;
  double v12 = v11;
  _LayoutConstants_13(self->_device, (uint64_t)v19);
  double result = (v10 - a5) * 0.5 - v20;
  double v14 = (v12 - a4) * 0.5 - v20;
  switch(a3)
  {
    case 0:
    case 6:
      _LayoutConstants_13(self->_device, (uint64_t)v17);
      double result = v14 + v18;
      break;
    case 1:
    case 5:
    case 7:
    case 11:
      _LayoutConstants_13(self->_device, (uint64_t)v15);
      double result = v14 / 0.866025404 - v16;
      break;
    case 2:
    case 4:
    case 8:
    case 10:
      double result = result / 0.866025404;
      break;
    case 3:
    case 9:
      return result;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

- (BOOL)usesLongSideTicks
{
  return self->_usesLongSideTicks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeTicks, 0);
  objc_storeStrong((id *)&self->_mediumTicks, 0);
  objc_storeStrong((id *)&self->_smallTicks, 0);
  objc_storeStrong((id *)&self->_smallTickCoveringLayer, 0);
  objc_storeStrong((id *)&self->_palette, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end