@interface TUISeparatedKBKeyView
- (TUISeparatedKBKeyView)initWithKey:(id)a3;
- (id)_pressRingLayer;
- (void)_addGlassEffect;
- (void)_addShadowEffect;
- (void)_startStateTransitionAnimationsFrom:(int)a3 to:(int)a4;
- (void)updateStateFrom:(int)a3 to:(int)a4;
@end

@implementation TUISeparatedKBKeyView

- (void)_startStateTransitionAnimationsFrom:(int)a3 to:(int)a4
{
  if (a3 != a4)
  {
    uint64_t v56 = v11;
    uint64_t v57 = v10;
    uint64_t v58 = v9;
    uint64_t v59 = v8;
    uint64_t v60 = v7;
    uint64_t v61 = v6;
    uint64_t v62 = v4;
    uint64_t v63 = v5;
    char v12 = a4;
    char v13 = a3;
    v15 = [(TUISeparatedKBKeyView *)self layer];
    [(TUISeparatedKBKeyView *)self bounds];
    CGFloat x = v64.origin.x;
    CGFloat y = v64.origin.y;
    CGFloat width = v64.size.width;
    CGFloat height = v64.size.height;
    double v20 = CGRectGetHeight(v64);
    v65.origin.CGFloat x = x;
    v65.origin.CGFloat y = y;
    v65.size.CGFloat width = width;
    v65.size.CGFloat height = height;
    double v21 = CGRectGetWidth(v65);
    double v22 = vabdd_f64(v21, v20);
    if ((v12 & 4) != 0)
    {
      double v36 = v21;
      CATransform3DMakeTranslation(&v55, 0.0, 0.0, 0.0);
      CATransform3D v54 = v55;
      [(TUISeparatedKBKeyView *)self setTransform3D:&v54];
      [v15 setValue:&unk_1EDC79980 forKeyPath:@"separatedOptions.separatedThickness"];
      [v15 removeAllAnimations];
      double v37 = (v20 + 4.0) / v20;
      v23 = [(TUISeparatedKBKeyView *)self _pressRingLayer];
      [v23 removeAllAnimations];
      if (v22 >= 2.22044605e-16)
      {
        v38 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.scale.x"];
        [v38 setFromValue:&unk_1EDC79DC0];
        v42 = [NSNumber numberWithDouble:(v36 + 4.0) / v36];
        [v38 setToValue:v42];

        [v38 setDuration:0.100000001];
        uint64_t v40 = *MEMORY[0x1E4F39FA8];
        [v38 setFillMode:*MEMORY[0x1E4F39FA8]];
        [v38 setRemovedOnCompletion:0];
        uint64_t v43 = *MEMORY[0x1E4F3A498];
        v44 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
        [v38 setTimingFunction:v44];

        v45 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.scale.y"];
        [v45 setFromValue:&unk_1EDC79DC0];
        v46 = [NSNumber numberWithDouble:v37];
        [v45 setToValue:v46];

        [v45 setDuration:0.100000001];
        [v45 setFillMode:v40];
        [v45 setRemovedOnCompletion:0];
        v47 = [MEMORY[0x1E4F39C10] functionWithName:v43];
        [v45 setTimingFunction:v47];

        [v23 addAnimation:v38 forKey:@"touch down scale X"];
        [v23 addAnimation:v45 forKey:@"touch down scale Y"];
      }
      else
      {
        v38 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.scale"];
        [v38 setFromValue:&unk_1EDC79DC0];
        v39 = [NSNumber numberWithDouble:v37];
        [v38 setToValue:v39];

        [v38 setDuration:0.100000001];
        uint64_t v40 = *MEMORY[0x1E4F39FA8];
        [v38 setFillMode:*MEMORY[0x1E4F39FA8]];
        [v38 setRemovedOnCompletion:0];
        v41 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
        [v38 setTimingFunction:v41];

        [v23 addAnimation:v38 forKey:@"touch down scale"];
      }

      LODWORD(v48) = 1032805417;
      [v23 setOpacity:v48];
      v49 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.translation.z"];
      [v49 setFromValue:&unk_1EDC79DD0];
      [v49 setToValue:&unk_1EDC79DE0];
      [v49 setDuration:0.00749999983];
      [v49 setFillMode:v40];
      [v49 setRemovedOnCompletion:0];
      uint64_t v50 = *MEMORY[0x1E4F3A4A0];
      v51 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
      [v49 setTimingFunction:v51];

      [v15 addAnimation:v49 forKey:@"touch down z translation"];
      v52 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.translation.z"];
      [v52 setFromValue:&unk_1EDC79DE0];
      [v52 setToValue:&unk_1EDC79DF0];
      [v52 setDuration:0.00749999983];
      [v52 setFillMode:v40];
      [v52 setRemovedOnCompletion:0];
      v53 = [MEMORY[0x1E4F39C10] functionWithName:v50];
      [v52 setTimingFunction:v53];

      [v23 addAnimation:v52 forKey:@"touch down z translation reverse"];
    }
    else
    {
      if ((v13 & 0x14) == 0)
      {
LABEL_10:

        return;
      }
      v23 = [(TUISeparatedKBKeyView *)self _pressRingLayer];
      [v23 removeAllAnimations];
      [v15 removeAllAnimations];
      v24 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.scale"];
      LODWORD(v25) = dword_18D515DE0[v22 < 2.22044605e-16];
      v26 = [NSNumber numberWithFloat:v25];
      [v24 setFromValue:v26];

      [v24 setToValue:&unk_1EDC79DC0];
      [v24 setDuration:0.100000001];
      uint64_t v27 = *MEMORY[0x1E4F39FA8];
      [v24 setFillMode:*MEMORY[0x1E4F39FA8]];
      [v24 setRemovedOnCompletion:0];
      uint64_t v28 = *MEMORY[0x1E4F3A498];
      v29 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
      [v24 setTimingFunction:v29];

      [v23 addAnimation:v24 forKey:@"touch up scale"];
      v30 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
      [v30 setFromValue:&unk_1EDC79E00];
      [v30 setToValue:&unk_1EDC79DD0];
      [v30 setDuration:0.100000001];
      [v30 setFillMode:v27];
      [v30 setRemovedOnCompletion:0];
      v31 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
      [v30 setTimingFunction:v31];

      [v23 addAnimation:v30 forKey:@"touch up opacity"];
      v32 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.translation.z"];
      [v32 setFromValue:&unk_1EDC79DE0];
      [v32 setToValue:&unk_1EDC79DD0];
      [v32 setDuration:0.150000006];
      [v32 setFillMode:v27];
      [v32 setRemovedOnCompletion:0];
      v33 = [MEMORY[0x1E4F39C10] functionWithName:v28];
      [v32 setTimingFunction:v33];

      [v15 addAnimation:v32 forKey:@"touch up z translation"];
      v34 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.translation.z"];
      [v34 setFromValue:&unk_1EDC79DF0];
      [v34 setToValue:&unk_1EDC79DE0];
      [v34 setDuration:0.150000006];
      [v34 setFillMode:v27];
      [v34 setRemovedOnCompletion:0];
      v35 = [MEMORY[0x1E4F39C10] functionWithName:v28];
      [v34 setTimingFunction:v35];

      [v23 addAnimation:v34 forKey:@"touch up z translation reverse"];
    }

    goto LABEL_10;
  }
}

- (void)updateStateFrom:(int)a3 to:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  [(TUISeparatedKBKeyView *)self _setContinuousCornerRadius:30.0];
  [(TUISeparatedKBKeyView *)self _updateHoverToEnabled:(v4 & 0x6E) != 0];
  v7.receiver = self;
  v7.super_class = (Class)TUISeparatedKBKeyView;
  [(TUIKBKeyView *)&v7 updateStateFrom:v5 to:v4];
}

- (id)_pressRingLayer
{
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2501;
  v30 = __Block_byref_object_dispose__2502;
  id v31 = 0;
  v3 = [(TUISeparatedKBKeyView *)self layer];
  uint64_t v4 = [v3 sublayers];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __40__TUISeparatedKBKeyView__pressRingLayer__block_invoke;
  v25[3] = &unk_1E5593890;
  v25[4] = &v26;
  [v4 enumerateObjectsUsingBlock:v25];

  uint64_t v5 = (void *)v27[5];
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    [(TUISeparatedKBKeyView *)self bounds];
    CGFloat x = v33.origin.x;
    CGFloat y = v33.origin.y;
    CGFloat width = v33.size.width;
    CGFloat height = v33.size.height;
    CGFloat v11 = v33.origin.x + -2.0;
    CGFloat v12 = v33.origin.y + -2.0;
    CGFloat v13 = CGRectGetWidth(v33) + 4.0;
    v34.origin.CGFloat x = x;
    v34.origin.CGFloat y = y;
    v34.size.CGFloat width = width;
    v34.size.CGFloat height = height;
    CGFloat v14 = CGRectGetHeight(v34) + 4.0;
    id v6 = [MEMORY[0x1E4F39BD0] layer];
    objc_msgSend(v6, "setFrame:", v11, v12, v13, v14);
    v15 = (void *)MEMORY[0x1E4F1C978];
    id v16 = [MEMORY[0x1E4FB1618] colorWithRed:0.666666667 green:0.666666667 blue:0.666666667 alpha:1.0];
    uint64_t v17 = [v16 CGColor];
    id v18 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.7];
    v19 = objc_msgSend(v15, "arrayWithObjects:", v17, objc_msgSend(v18, "CGColor"), 0);
    [v6 setColors:v19];

    [v6 setType:*MEMORY[0x1E4F3A3A0]];
    objc_msgSend(v6, "setStartPoint:", 0.5, 0.5);
    objc_msgSend(v6, "setEndPoint:", 0.95, 0.95);
    id v20 = [MEMORY[0x1E4FB1618] colorWithWhite:0.05 alpha:0.1];
    objc_msgSend(v6, "setBorderColor:", objc_msgSend(v20, "CGColor"));

    [v6 setBorderWidth:3.0];
    [v6 setCornerRadius:32.0];
    [v6 setCornerCurve:*MEMORY[0x1E4F39EA0]];
    [v6 setOpacity:0.0];
    CATransform3DMakeTranslation(&v24, 0.0, 0.0, -4.0);
    CATransform3D v23 = v24;
    [v6 setTransform:&v23];
    [v6 setValue:&unk_1EDC79980 forKeyPath:@"separatedOptions.separatedThickness"];
    [v6 setName:@"KeyPressEffectHighlightLayerName"];
    double v21 = [(TUISeparatedKBKeyView *)self layer];
    [v21 addSublayer:v6];
  }
  _Block_object_dispose(&v26, 8);

  return v6;
}

void __40__TUISeparatedKBKeyView__pressRingLayer__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v7 = [v9 name];
    int v8 = [v7 isEqualToString:@"KeyPressEffectHighlightLayerName"];

    if (v8)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
      *a4 = 1;
    }
  }
}

- (void)_addShadowEffect
{
  id v4 = [(TUISeparatedKBKeyView *)self layer];
  LODWORD(v2) = 1017370378;
  [v4 setShadowOpacity:v2];
  [v4 setShadowRadius:1.0];
  id v3 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  objc_msgSend(v4, "setShadowColor:", objc_msgSend(v3, "CGColor"));

  objc_msgSend(v4, "setShadowOffset:", 0.5, 2.0);
  [v4 setShadowPathIsBounds:1];
  [v4 setValue:&unk_1EDC79D90 forKeyPath:@"separatedOptions.shadows.expansionOpacity"];
  [v4 setValue:&unk_1EDC79DA0 forKeyPath:@"separatedOptions.shadows.expansionRadius"];
  [v4 setValue:&unk_1EDC79DA0 forKeyPath:@"separatedOptions.shadows.expansionSize"];
  [v4 setValue:&unk_1EDC79DA0 forKeyPath:@"separatedOptions.shadows.maxDynamicOffset"];
  [v4 setValue:&unk_1EDC79DB0 forKeyPath:@"separatedOptions.shadows.expansionTargetZ"];
}

- (void)_addGlassEffect
{
  id v3 = [(TUISeparatedKBKeyView *)self layer];
  [v3 setValue:MEMORY[0x1E4F1CC38] forKeyPath:@"separatedOptions.acceptsUpstreamHitTesting"];
  double v2 = [v3 valueForKeyPath:@"separatedOptions.platter.enabled"];

  if (!v2)
  {
    [v3 setValue:MEMORY[0x1E4F1CC38] forKeyPath:@"separatedOptions.platter.enabled"];
    [v3 setValue:&unk_1EDC79D30 forKeyPath:@"separatedOptions.platter.frontDepthForNormals"];
    [v3 setValue:&unk_1EDC79D40 forKeyPath:@"separatedOptions.geometry.frontBevel"];
    [v3 setValue:&unk_1EDC79968 forKeyPath:@"separatedOptions.geometry.flatDepth"];
    [v3 setValue:&unk_1EDC79968 forKeyPath:@"separatedOptions.geometry.backBevel"];
    [v3 setValue:&unk_1EDC79D50 forKeyPath:@"separatedOptions.platter.mainSpecularStrength"];
    [v3 setValue:&unk_1EDC79D40 forKeyPath:@"separatedOptions.platter.fillSpecularStrength"];
    [v3 setValue:&unk_1EDC79D60 forKeyPath:@"separatedOptions.platter.mainSpecularExponent"];
    [v3 setValue:&unk_1EDC79D70 forKeyPath:@"separatedOptions.platter.fillSpecularExponent"];
    [v3 setValue:&unk_1EDC79D80 forKeyPath:@"separatedOptions.platter.fakeFresnelMaxDist"];
    [v3 setValue:&unk_1EDC79D40 forKeyPath:@"separatedOptions.platter.fakeFresnelStrength"];
    [v3 setValue:&unk_1EDC79D30 forKeyPath:@"separatedOptions.platter.fakeFresnelFalloff"];
  }
}

- (TUISeparatedKBKeyView)initWithKey:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUISeparatedKBKeyView;
  id v3 = [(TUIKBKeyView *)&v6 initWithKey:a3];
  id v4 = v3;
  if (v3)
  {
    [(TUISeparatedKBKeyView *)v3 _setContinuousCornerRadius:30.0];
    [(TUISeparatedKBKeyView *)v4 _addGlassEffect];
    [(TUISeparatedKBKeyView *)v4 _addShadowEffect];
    [(TUISeparatedKBKeyView *)v4 _addHoverEffect];
  }
  return v4;
}

@end