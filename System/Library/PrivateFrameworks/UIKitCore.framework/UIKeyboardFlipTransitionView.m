@interface UIKeyboardFlipTransitionView
- (BOOL)isShowingFrontFace;
- (BOOL)transitionIsVisible;
- (CGImage)defaultKeyboardImage;
- (CGImage)splitKeyboardImage;
- (UIKeyboardFlipTransitionView)initWithFrame:(CGRect)a3;
- (void)_delayedUpdateTransition;
- (void)_flipToFront:(BOOL)a3 animated:(BOOL)a4;
- (void)rebuildBackgroundTransition;
- (void)rebuildControlKeys:(unint64_t)a3;
- (void)rebuildControlSlicesForKeyName:(id)a3;
- (void)rebuildMoreIntlKeys;
- (void)rebuildReturnSlices;
- (void)rebuildShiftSlices;
- (void)setFrame:(CGRect)a3;
- (void)setShowingFrontFace:(BOOL)a3;
- (void)updateMoreIntlKey:(id)a3 asStart:(BOOL)a4 withRect:(CGRect)a5 showIntl:(BOOL)a6 showDictKey:(BOOL)a7;
@end

@implementation UIKeyboardFlipTransitionView

- (UIKeyboardFlipTransitionView)initWithFrame:(CGRect)a3
{
  v39.receiver = self;
  v39.super_class = (Class)UIKeyboardFlipTransitionView;
  v3 = -[UIView initWithFrame:](&v39, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(UIView *)v3 layer];
    objc_msgSend(v5, "setAnchorPoint:", 0.5, 0.5);

    uint64_t v6 = [MEMORY[0x1E4F39BE8] layer];
    container = v4->_container;
    v4->_container = (CALayer *)v6;

    v8 = [(UIView *)v4 layer];
    [v8 anchorPoint];
    -[CALayer setAnchorPoint:](v4->_container, "setAnchorPoint:");

    uint64_t v9 = [MEMORY[0x1E4F39BE8] layer];
    frontFace = v4->_frontFace;
    v4->_frontFace = (CALayer *)v9;

    uint64_t v11 = [MEMORY[0x1E4F39BE8] layer];
    backFace = v4->_backFace;
    v4->_backFace = (CALayer *)v11;

    [(UIKeyboardSplitTransitionView *)v4 initializeLayers];
    v13 = v4->_frontFace;
    v14 = [(UIKeyboardSplitTransitionView *)v4 backgroundLayers];
    v15 = [v14 objectAtIndex:0];
    [(CALayer *)v13 addSublayer:v15];

    v16 = v4->_backFace;
    v17 = [(UIKeyboardSplitTransitionView *)v4 backgroundLayers];
    v18 = [v17 objectAtIndex:1];
    [(CALayer *)v16 addSublayer:v18];

    v19 = v4->_backFace;
    v20 = [(UIKeyboardSplitTransitionView *)v4 backgroundLayers];
    v21 = [v20 objectAtIndex:2];
    [(CALayer *)v19 addSublayer:v21];

    uint64_t v22 = [MEMORY[0x1E4F39BE8] layer];
    frontDarkening = v4->_frontDarkening;
    v4->_frontDarkening = (CALayer *)v22;

    id v24 = +[UIColor blackColor];
    -[CALayer setBackgroundColor:](v4->_frontDarkening, "setBackgroundColor:", [v24 CGColor]);

    uint64_t v25 = [MEMORY[0x1E4F39BE8] layer];
    backDarkening = v4->_backDarkening;
    v4->_backDarkening = (CALayer *)v25;

    id v27 = +[UIColor blackColor];
    -[CALayer setBackgroundColor:](v4->_backDarkening, "setBackgroundColor:", [v27 CGColor]);

    uint64_t v28 = [MEMORY[0x1E4F39BE8] layer];
    backDarkeningLeft = v4->_backDarkeningLeft;
    v4->_backDarkeningLeft = (CALayer *)v28;

    id v30 = +[UIColor blackColor];
    -[CALayer setBackgroundColor:](v4->_backDarkeningLeft, "setBackgroundColor:", [v30 CGColor]);

    uint64_t v31 = [MEMORY[0x1E4F39BE8] layer];
    backDarkeningRight = v4->_backDarkeningRight;
    v4->_backDarkeningRight = (CALayer *)v31;

    id v33 = +[UIColor blackColor];
    -[CALayer setBackgroundColor:](v4->_backDarkeningRight, "setBackgroundColor:", [v33 CGColor]);

    [(CALayer *)v4->_frontFace addSublayer:v4->_frontDarkening];
    [(CALayer *)v4->_backFace addSublayer:v4->_backDarkening];
    [(CALayer *)v4->_backFace addSublayer:v4->_backDarkeningLeft];
    [(CALayer *)v4->_backFace addSublayer:v4->_backDarkeningRight];
    v34 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    controlKeys = v4->_controlKeys;
    v4->_controlKeys = v34;

    v36 = [(UIView *)v4 layer];
    [v36 addSublayer:v4->_container];

    [(CALayer *)v4->_container addSublayer:v4->_frontFace];
    [(CALayer *)v4->_container addSublayer:v4->_backFace];
    v37 = v4;
  }

  return v4;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!CGRectIsEmpty(a3))
  {
    v12.receiver = self;
    v12.super_class = (Class)UIKeyboardFlipTransitionView;
    -[UIKeyboardSplitTransitionView setFrame:](&v12, sel_setFrame_, x, y, width, height);
    [(UIView *)self frame];
    -[UIView setCenter:](self, "setCenter:", width * 0.5, v8 * 0.5);
    [(UIView *)self bounds];
    -[CALayer setBounds:](self->_container, "setBounds:");
    uint64_t v9 = [(UIView *)self layer];
    [v9 position];
    -[CALayer setPosition:](self->_container, "setPosition:");

    [(CALayer *)self->_container setPerspectiveDistance:width];
    v10 = [(CALayer *)self->_container sublayers];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __41__UIKeyboardFlipTransitionView_setFrame___block_invoke;
    v11[3] = &unk_1E52DC4C0;
    v11[4] = self;
    [v10 enumerateObjectsUsingBlock:v11];
  }
}

void __41__UIKeyboardFlipTransitionView_setFrame___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  if ((id)v4[73] != v3 && (id)v4[74] != v3 && (id)v4[75] != v3 && (id)v4[76] != v3)
  {
    id v5 = v3;
    objc_msgSend(v3, "setAnchorPoint:", 0.5, 0.5);
    [*(id *)(*(void *)(a1 + 32) + 560) bounds];
    objc_msgSend(v5, "setBounds:");
    [*(id *)(*(void *)(a1 + 32) + 560) position];
    objc_msgSend(v5, "setPosition:");
    id v3 = v5;
  }
}

- (void)_flipToFront:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  long long v82 = v6;
  long long v84 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  if (a4) {
    double v7 = 0.4;
  }
  else {
    double v7 = 0.0;
  }
  *(_OWORD *)&v93.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&v93.m33 = v6;
  long long v79 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  *(_OWORD *)&v93.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  long long v80 = *(_OWORD *)&v93.m41;
  *(_OWORD *)&v93.m43 = v79;
  long long v76 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  *(_OWORD *)&v93.m11 = *MEMORY[0x1E4F39B10];
  long long v77 = *(_OWORD *)&v93.m11;
  *(_OWORD *)&v93.m13 = v76;
  long long v74 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  *(_OWORD *)&v93.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  long long v75 = *(_OWORD *)&v93.m21;
  *(_OWORD *)&v93.m23 = v74;
  memset(&v92, 0, sizeof(v92));
  CATransform3DMakeRotation(&v92, 1.57079633, 1.0, 0.0, 0.0);
  memset(&v91, 0, sizeof(v91));
  CATransform3DMakeRotation(&v91, 3.14159265, 1.0, 0.0, 0.0);
  *(_OWORD *)&v90.m31 = v84;
  *(_OWORD *)&v90.m33 = v82;
  *(_OWORD *)&v90.m41 = v80;
  *(_OWORD *)&v90.m43 = v79;
  *(_OWORD *)&v90.m11 = v77;
  *(_OWORD *)&v90.m13 = v76;
  *(_OWORD *)&v90.m21 = v75;
  *(_OWORD *)&v90.m23 = v74;
  memset(&v89, 0, sizeof(v89));
  CATransform3DMakeRotation(&v89, -1.57079633, 1.0, 0.0, 0.0);
  memset(&v88, 0, sizeof(v88));
  CATransform3DMakeRotation(&v88, -3.14159265, 1.0, 0.0, 0.0);
  v86 = self;
  unsigned int v73 = v4;
  if (v4)
  {
    CATransform3D v93 = v91;
    double v8 = &v91;
  }
  else
  {
    CATransform3D v90 = v88;
    double v8 = &v88;
  }
  *(_OWORD *)&v8->m31 = v84;
  *(_OWORD *)&v8->m33 = v82;
  *(_OWORD *)&v8->m41 = v80;
  *(_OWORD *)&v8->m43 = v79;
  *(_OWORD *)&v8->m11 = v77;
  *(_OWORD *)&v8->m13 = v76;
  *(_OWORD *)&v8->m21 = v75;
  *(_OWORD *)&v8->m23 = v74;
  uint64_t v9 = (void *)MEMORY[0x1E4F1C978];
  CATransform3D v87 = v93;
  v10 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v87];
  CATransform3D v87 = v92;
  uint64_t v11 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v87];
  CATransform3D v87 = v91;
  objc_super v12 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v87];
  uint64_t v13 = objc_msgSend(v9, "arrayWithObjects:", v10, v11, v12, 0);

  v14 = (void *)MEMORY[0x1E4F1C978];
  CATransform3D v87 = v90;
  v15 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v87];
  CATransform3D v87 = v89;
  v16 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v87];
  CATransform3D v87 = v88;
  v17 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v87];
  uint64_t v18 = objc_msgSend(v14, "arrayWithObjects:", v15, v16, v17, 0);

  v19 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform"];
  [v19 setRemovedOnCompletion:0];
  uint64_t v20 = *MEMORY[0x1E4F39FA8];
  [v19 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v19 setDuration:v7];
  [v19 setCalculationMode:@"cubic"];
  v21 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v22 = [NSNumber numberWithFloat:0.0];
  LODWORD(v23) = 0.5;
  id v24 = [NSNumber numberWithFloat:v23];
  LODWORD(v25) = 1.0;
  v26 = [NSNumber numberWithFloat:v25];
  id v27 = objc_msgSend(v21, "arrayWithObjects:", v22, v24, v26, 0);
  [v19 setKeyTimes:v27];

  v85 = (void *)v13;
  [v19 setValues:v13];
  [(CALayer *)v86->_frontFace addAnimation:v19 forKey:@"front flip animation"];
  uint64_t v28 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform"];
  [v28 setRemovedOnCompletion:0];
  [v28 setFillMode:v20];
  [v28 setDuration:v7];
  [v28 setCalculationMode:@"cubic"];
  v81 = v19;
  v29 = [v19 keyTimes];
  [v28 setKeyTimes:v29];

  v83 = (void *)v18;
  [v28 setValues:v18];
  v78 = v28;
  [(CALayer *)v86->_backFace addAnimation:v28 forKey:@"back flip animation"];
  id v30 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v31 = [NSNumber numberWithFloat:0.0];
  LODWORD(v32) = 0.5;
  id v33 = [NSNumber numberWithFloat:v32];
  LODWORD(v34) = 1056964776;
  v35 = [NSNumber numberWithFloat:v34];
  LODWORD(v36) = 1.0;
  v37 = [NSNumber numberWithFloat:v36];
  v38 = objc_msgSend(v30, "arrayWithObjects:", v31, v33, v35, v37, 0);

  objc_super v39 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"hidden"];
  [v39 setRemovedOnCompletion:0];
  [v39 setFillMode:v20];
  [v39 setDuration:v7];
  [v39 setCalculationMode:@"cubic"];
  [v39 setKeyTimes:v38];
  v40 = (void *)MEMORY[0x1E4F1C978];
  v41 = [NSNumber numberWithBool:v73];
  *(float *)&double v42 = (float)v73;
  v43 = [NSNumber numberWithFloat:v42];
  *(float *)&double v44 = (float)(v73 ^ 1);
  v45 = [NSNumber numberWithFloat:v44];
  *(float *)&double v46 = (float)(v73 ^ 1);
  v47 = [NSNumber numberWithFloat:v46];
  v48 = objc_msgSend(v40, "arrayWithObjects:", v41, v43, v45, v47, 0);
  [v39 setValues:v48];

  [(CALayer *)v86->_frontFace addAnimation:v39 forKey:@"front hidden animation"];
  v49 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"hidden"];
  [v49 setRemovedOnCompletion:0];
  [v49 setFillMode:v20];
  [v49 setDuration:v7];
  [v49 setCalculationMode:@"cubic"];
  [v49 setKeyTimes:v38];
  v50 = (void *)MEMORY[0x1E4F1C978];
  *(float *)&double v51 = (float)(v73 ^ 1);
  v52 = [NSNumber numberWithFloat:v51];
  *(float *)&double v53 = (float)(v73 ^ 1);
  v54 = [NSNumber numberWithFloat:v53];
  *(float *)&double v55 = (float)v73;
  v56 = [NSNumber numberWithFloat:v55];
  *(float *)&double v57 = (float)v73;
  v58 = [NSNumber numberWithFloat:v57];
  v59 = objc_msgSend(v50, "arrayWithObjects:", v52, v54, v56, v58, 0);
  [v49 setValues:v59];

  [(CALayer *)v86->_backFace addAnimation:v49 forKey:@"back hidden animation"];
  v60 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
  [v60 setRemovedOnCompletion:0];
  [v60 setFillMode:v20];
  [v60 setDuration:v7];
  [v60 setCalculationMode:@"cubic"];
  [v60 setKeyTimes:v38];
  v61 = (void *)MEMORY[0x1E4F1C978];
  v62 = [NSNumber numberWithFloat:0.0];
  LODWORD(v63) = 1053609165;
  v64 = [NSNumber numberWithFloat:v63];
  LODWORD(v65) = 1053609165;
  v66 = [NSNumber numberWithFloat:v65];
  v67 = [NSNumber numberWithFloat:0.0];
  v68 = objc_msgSend(v61, "arrayWithObjects:", v62, v64, v66, v67, 0);
  [v60 setValues:v68];

  [(CALayer *)v86->_frontDarkening addAnimation:v60 forKey:@"darkening animation"];
  [(CALayer *)v86->_frontDarkening addAnimation:v39 forKey:@"front hidden animation"];
  if (v86->super._centerFilled)
  {
    p_backDarkening = (id *)&v86->_backDarkening;
    backDarkening = v86->_backDarkening;
    v71 = @"darkening animation";
    v72 = v60;
  }
  else
  {
    [(CALayer *)v86->_backDarkeningLeft addAnimation:v60 forKey:@"darkening animation"];
    p_backDarkening = (id *)&v86->_backDarkeningRight;
    [(CALayer *)v86->_backDarkeningRight addAnimation:v60 forKey:@"darkening animation"];
    backDarkening = v86->_backDarkeningLeft;
    v71 = @"back hidden animation";
    v72 = v49;
  }
  [(CALayer *)backDarkening addAnimation:v72 forKey:v71];
  [*p_backDarkening addAnimation:v49 forKey:@"back hidden animation"];
}

- (void)setShowingFrontFace:(BOOL)a3
{
  if (self->_showingFrontFace != a3)
  {
    self->_showingFrontFace = a3;
    -[UIKeyboardFlipTransitionView _flipToFront:animated:](self, "_flipToFront:animated:");
  }
}

- (CGImage)defaultKeyboardImage
{
  return 0;
}

- (CGImage)splitKeyboardImage
{
  return 0;
}

- (void)rebuildBackgroundTransition
{
  id v3 = [(UIKeyboardSplitTransitionView *)self backgroundLayers];
  id v46 = [v3 objectAtIndex:0];

  [(CALayer *)self->_frontFace insertSublayer:v46 atIndex:0];
  BOOL v4 = [(UIKeyboardSplitTransitionView *)self backgroundLayers];
  id v5 = [v4 objectAtIndex:1];

  long long v6 = [(UIKeyboardSplitTransitionView *)self backgroundLayers];
  double v44 = [v6 objectAtIndex:2];

  LODWORD(v4) = self->super._centerFilled;
  double v7 = +[UIKeyboardPreferencesController sharedPreferencesController];
  double v8 = [v7 preferencesActions];
  [v8 rivenSizeFactor:9.0];
  double v10 = -v9;
  if (v4)
  {
    p_backFace = &self->_backFace;
    [(CALayer *)self->_backFace frame];
    double v13 = v12;
    v14 = +[UIKeyboardPreferencesController sharedPreferencesController];
    v15 = [v14 preferencesActions];
    [v15 rivenSizeFactor:9.0];
    double v17 = v13 + v16 + v16;
    [(UIKeyboardSliceSet *)self->super._sliceSet endRect];
    objc_msgSend(v5, "setBounds:", v10, 0.0, v17);

    uint64_t v18 = off_1E52D4000;
    v19 = v5;
  }
  else
  {
    [(UIKeyboardSliceSet *)self->super._sliceSet leftWidth];
    double v21 = v20;
    uint64_t v22 = +[UIKeyboardPreferencesController sharedPreferencesController];
    double v23 = [v22 preferencesActions];
    [v23 rivenSizeFactor:9.0];
    double v25 = v21 + v24;
    [(UIKeyboardSliceSet *)self->super._sliceSet endRect];
    objc_msgSend(v5, "setBounds:", v10, 0.0, v25);

    uint64_t v18 = off_1E52D4000;
    [(UIKeyboardSliceSet *)self->super._sliceSet rightWidth];
    double v27 = v26;
    uint64_t v28 = +[UIKeyboardPreferencesController sharedPreferencesController];
    v29 = [v28 preferencesActions];
    [v29 rivenSizeFactor:9.0];
    double v31 = v27 + v30;
    [(UIKeyboardSliceSet *)self->super._sliceSet endRect];
    objc_msgSend(v44, "setBounds:", 0.0, 0.0, v31);

    p_backFace = &self->_backFace;
    [(CALayer *)self->_backFace insertSublayer:v5 atIndex:0];
    v19 = v44;
  }
  -[CALayer insertSublayer:atIndex:](*p_backFace, "insertSublayer:atIndex:", v19, 0, v44);
  [(CALayer *)self->_frontFace frame];
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  CGFloat v39 = v38;
  v40 = [(__objc2_class *)v18[20] sharedPreferencesController];
  v41 = [v40 preferencesActions];
  [v41 rivenSizeFactor:9.0];
  CGFloat v43 = -v42;
  v48.origin.double x = v33;
  v48.origin.double y = v35;
  v48.size.double width = v37;
  v48.size.double height = v39;
  CGRect v49 = CGRectInset(v48, v43, 0.0);
  -[CALayer setFrame:](self->_frontDarkening, "setFrame:", v49.origin.x, v49.origin.y, v49.size.width, v49.size.height);

  [(UIKeyboardSliceSet *)self->super._sliceSet endRect];
  -[CALayer setFrame:](self->_backDarkening, "setFrame:");
  [v5 frame];
  -[CALayer setFrame:](self->_backDarkeningLeft, "setFrame:");
  [v45 frame];
  -[CALayer setFrame:](self->_backDarkeningRight, "setFrame:");
  [(CALayer *)self->_backDarkening setHidden:!self->super._centerFilled];
  [(CALayer *)self->_backDarkeningLeft setHidden:self->super._centerFilled];
  [(CALayer *)self->_backDarkeningRight setHidden:self->super._centerFilled];
  [(CALayer *)self->_frontFace addSublayer:self->_frontDarkening];
  [(CALayer *)self->_backFace addSublayer:self->_backDarkening];
  [(CALayer *)self->_backFace addSublayer:self->_backDarkeningLeft];
  [(CALayer *)self->_backFace addSublayer:self->_backDarkeningRight];
}

- (void)rebuildControlSlicesForKeyName:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(UIKeyboardSliceSet *)self->super._sliceSet controlKeys];
  long long v6 = [v5 objectForKey:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObject:v6];

    long long v6 = (void *)v7;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "endToken", (void)v22);
        v15 = v14;
        if (v14)
        {
          id v16 = v14;
        }
        else
        {
          id v16 = [v13 startToken];
        }
        double v17 = v16;

        controlKeys = self->_controlKeys;
        v19 = [v17 name];
        double v20 = [(NSMutableDictionary *)controlKeys objectForKeyedSubscript:v19];

        double v21 = [v20 objectForKeyedSubscript:v17];
        objc_msgSend(v21, "setContents:", -[UIKeyboardSplitTransitionView keyImageWithToken:](self, "keyImageWithToken:", v17));
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
}

- (void)rebuildShiftSlices
{
  *(unsigned char *)&self->_rebuildFlags &= ~1u;
}

- (void)rebuildReturnSlices
{
  *(unsigned char *)&self->_rebuildFlags &= ~2u;
}

- (void)updateMoreIntlKey:(id)a3 asStart:(BOOL)a4 withRect:(CGRect)a5 showIntl:(BOOL)a6 showDictKey:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v20 = a3;
  v15 = [(UIKeyboardSliceSet *)self->super._sliceSet controlKeys];
  id v16 = [v15 objectForKey:v20];

  if (a4) {
    [v16 startToken];
  }
  else {
  double v17 = [v16 endToken];
  }
  uint64_t v18 = [(NSMutableDictionary *)self->_controlKeys objectForKeyedSubscript:v20];
  v19 = [v18 objectForKeyedSubscript:v17];

  objc_msgSend(v17, "setSize:", width, height);
  objc_msgSend(v19, "setFrame:", x, y, width, height);
  objc_msgSend(v16, "setStartRect:", x, y, width, height);
  objc_msgSend(v19, "setContents:", -[UIKeyboardSplitTransitionView keyImageWithToken:](self, "keyImageWithToken:", v17));
  if ([v20 hasSuffix:@"International-Key"]) {
    [v19 setHidden:!v8];
  }
  if ([v20 hasSuffix:@"Dictation-Key"]) {
    [v19 setHidden:!v7];
  }
}

- (void)rebuildMoreIntlKeys
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UIKeyboardSplitTransitionView *)self showIntlKey];
  BOOL v59 = [(UIKeyboardSplitTransitionView *)self showDictationKey];
  if (v59) {
    int v4 = 2;
  }
  else {
    int v4 = 0;
  }
  BOOL v5 = v3;
  BOOL v6 = v4 | v3;
  BOOL v7 = [(UIKeyboardSliceSet *)self->super._sliceSet controlKeys];
  BOOL v8 = [v7 objectForKey:@"MoreIntlStartNames"];

  if (!v8)
  {
    uint64_t v9 = [(UIKeyboardSliceSet *)self->super._sliceSet controlKeys];
    BOOL v8 = [v9 objectForKey:@"MoreIntlNames"];
  }
  uint64_t v10 = [(UIKeyboardSliceSet *)self->super._sliceSet controlKeys];
  uint64_t v11 = [v10 objectForKey:@"MoreIntlStartLeftAligned"];
  uint64_t v12 = v6 | (16 * (v11 != 0)) | 4u;

  double v13 = [(UIKeyboardSliceSet *)self->super._sliceSet controlKeys];
  v14 = [v13 objectForKey:@"MoreIntlStarts"];
  v58 = +[UIKBTree shapesForControlKeyShapes:v14 options:v12];

  v15 = [(UIKeyboardSliceSet *)self->super._sliceSet controlKeys];
  uint64_t v16 = [v15 objectForKey:@"MoreIntlEndNames"];

  if (!v16)
  {
    double v17 = [(UIKeyboardSliceSet *)self->super._sliceSet controlKeys];
    uint64_t v16 = [v17 objectForKey:@"MoreIntlNames"];
  }
  double v57 = (void *)v16;
  uint64_t v18 = [(UIKeyboardSliceSet *)self->super._sliceSet controlKeys];
  v19 = [v18 objectForKey:@"MoreIntlEndLeftAligned"];
  uint64_t v20 = v6 | (16 * (v19 != 0)) | 0xCu;

  double v21 = self;
  long long v22 = [(UIKeyboardSliceSet *)self->super._sliceSet controlKeys];
  long long v23 = [v22 objectForKey:@"MoreIntlEnds"];
  long long v24 = +[UIKBTree shapesForControlKeyShapes:v23 options:v20];

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v25 = v8;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v64 objects:v69 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v65 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void *)(*((void *)&v64 + 1) + 8 * i);
        double v31 = [v25 objectForKey:v30];
        if (([v31 hasSuffix:@"Unlabeled-Space-Key"] & 1) == 0)
        {
          double v32 = [v58 objectForKey:v30];
          [v32 paddedFrame];
          double v34 = v33;
          double v36 = v35;
          double v38 = v37;
          double v40 = v39;

          -[UIKeyboardFlipTransitionView updateMoreIntlKey:asStart:withRect:showIntl:showDictKey:](v21, "updateMoreIntlKey:asStart:withRect:showIntl:showDictKey:", v31, 1, v5, v59, v34, v36, v38, v40);
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v64 objects:v69 count:16];
    }
    while (v27);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v41 = v57;
  uint64_t v42 = [v41 countByEnumeratingWithState:&v60 objects:v68 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v61;
    do
    {
      for (uint64_t j = 0; j != v43; ++j)
      {
        if (*(void *)v61 != v44) {
          objc_enumerationMutation(v41);
        }
        uint64_t v46 = *(void *)(*((void *)&v60 + 1) + 8 * j);
        v47 = [v41 objectForKey:v46];
        CGRect v48 = [v24 objectForKey:v46];
        [v48 paddedFrame];
        double v50 = v49;
        double v52 = v51;
        double v54 = v53;
        double v56 = v55;

        -[UIKeyboardFlipTransitionView updateMoreIntlKey:asStart:withRect:showIntl:showDictKey:](v21, "updateMoreIntlKey:asStart:withRect:showIntl:showDictKey:", v47, 0, v5, v59, v50, v52, v54, v56);
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v60 objects:v68 count:16];
    }
    while (v43);
  }

  *(unsigned char *)&v21->_rebuildFlags &= ~4u;
}

- (void)_delayedUpdateTransition
{
  if ([(UIView *)self isHidden] && self->super._sliceSet)
  {
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    [(UIKeyboardSliceSet *)self->super._sliceSet startRect];
    -[UIKeyboardFlipTransitionView setFrame:](self, "setFrame:");
    BOOL v3 = +[UIKeyboardImpl activeInstance];
    self->super._centerFilled = [v3 centerFilled];

    int v4 = +[UIKeyboardImpl activeInstance];
    char v5 = [v4 showsCandidateBar];

    if (+[UIKeyboardImpl isSplit])
    {
      BOOL v6 = [(UIKeyboardSliceSet *)self->super._sliceSet controlKeys];
      BOOL v7 = [v6 objectForKey:@"Candidate-Selection"];
      BOOL v8 = v7 != 0;

      char v9 = self->super._centerFilled && v8;
      if (self->super._centerFilled && !v8) {
        char v9 = v5 ^ 1;
      }
    }
    else
    {
      char v9 = v5 ^ 1;
      if (!self->super._centerFilled) {
        char v9 = 0;
      }
    }
    self->super._centerFilled = v9;
    [(UIKeyboardFlipTransitionView *)self rebuildTransition];
    [(UIKeyboardFlipTransitionView *)self rebuildMoreIntlKeys];
    char rebuildFlags = (char)self->_rebuildFlags;
    if (rebuildFlags)
    {
      [(UIKeyboardFlipTransitionView *)self rebuildShiftSlices];
      char rebuildFlags = (char)self->_rebuildFlags;
    }
    if ((rebuildFlags & 2) != 0) {
      [(UIKeyboardFlipTransitionView *)self rebuildReturnSlices];
    }
    [MEMORY[0x1E4F39CF8] commit];
    self->super._isRebuilding = 0;
  }
}

- (void)rebuildControlKeys:(unint64_t)a3
{
  *(unsigned char *)&self->_rebuildFlags |= 2 * (a3 & 1);
  [(UIKeyboardFlipTransitionView *)self updateTransition];
}

- (BOOL)transitionIsVisible
{
  return 0;
}

- (BOOL)isShowingFrontFace
{
  return self->_showingFrontFace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlKeys, 0);
  objc_storeStrong((id *)&self->_endKeyplaneToken, 0);
  objc_storeStrong((id *)&self->_startKeyplaneToken, 0);
  objc_storeStrong((id *)&self->_backDarkeningRight, 0);
  objc_storeStrong((id *)&self->_backDarkeningLeft, 0);
  objc_storeStrong((id *)&self->_backDarkening, 0);
  objc_storeStrong((id *)&self->_frontDarkening, 0);
  objc_storeStrong((id *)&self->_backFace, 0);
  objc_storeStrong((id *)&self->_frontFace, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end