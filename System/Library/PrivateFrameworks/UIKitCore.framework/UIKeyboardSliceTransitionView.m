@interface UIKeyboardSliceTransitionView
- (BOOL)canDisplayTransition;
- (CGImage)defaultKeyboardImage;
- (CGImage)getKeyboardImageAsSplit:(BOOL)a3;
- (CGImage)splitKeyboardImage;
- (UIKeyboardSliceTransitionView)initWithFrame:(CGRect)a3;
- (double)adjustedLeftWidthAtMergePoint;
- (double)adjustedRightWidthAtMergePoint;
- (id)crossfadeOpacityAnimation;
- (id)meshTransformForProgress:(double)a3;
- (void)_delayedUpdateTransition;
- (void)dealloc;
- (void)initializeLayers;
- (void)rebuildBackgroundAndShadowTransitions;
- (void)rebuildBackgroundGradientTransitions;
- (void)rebuildControlKeys:(unint64_t)a3;
- (void)rebuildFromKeyplane:(id)a3 toKeyplane:(id)a4 startToken:(id)a5 endToken:(id)a6 keyboardType:(int64_t)a7 orientation:(int64_t)a8;
- (void)rebuildMoreIntlKeys;
- (void)rebuildReturnSlices;
- (void)rebuildShadows;
- (void)rebuildShiftSlices;
- (void)rebuildSliceTransitions;
- (void)rebuildTopEdgeHighlightTransition;
- (void)rebuildTransitionForSplitStyleChange:(id)a3;
- (void)refreshKeyplaneImages;
- (void)setFrame:(CGRect)a3;
- (void)setHidden:(BOOL)a3;
- (void)setRebuildFlags;
- (void)transformForProgress:(double)a3;
- (void)updateTransition;
- (void)updateTransitionForSlice:(id)a3 withStart:(id)a4 startContents:(id)a5 end:(id)a6 endContents:(id)a7 updateContents:(BOOL)a8;
- (void)updateWithProgress:(double)a3;
@end

@implementation UIKeyboardSliceTransitionView

- (UIKeyboardSliceTransitionView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UIKeyboardSliceTransitionView;
  v3 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(UIView *)v3 layer];
    objc_msgSend(v5, "setAnchorPoint:", 0.5, 0.0);

    [(UIKeyboardSliceTransitionView *)v4 initializeLayers];
    [(UIKeyboardSliceTransitionView *)v4 setRebuildFlags];
    v6 = v4;
  }

  return v4;
}

- (void)initializeLayers
{
  v16.receiver = self;
  v16.super_class = (Class)UIKeyboardSliceTransitionView;
  [(UIKeyboardSplitTransitionView *)&v16 initializeLayers];
  v3 = [MEMORY[0x1E4F39BE8] layer];
  leftKeys = self->_leftKeys;
  self->_leftKeys = v3;

  v5 = [MEMORY[0x1E4F39BE8] layer];
  rightKeys = self->_rightKeys;
  self->_rightKeys = v5;

  [(CALayer *)self->_leftKeys setName:@"Keys (left)"];
  [(CALayer *)self->_rightKeys setName:@"Keys (right)"];
  -[CALayer setAnchorPoint:](self->_leftKeys, "setAnchorPoint:", 0.0, 0.0);
  -[CALayer setAnchorPoint:](self->_rightKeys, "setAnchorPoint:", 1.0, 0.0);
  v7 = [(UIView *)self layer];
  [v7 addSublayer:self->_leftKeys];

  objc_super v8 = [(UIView *)self layer];
  [v8 addSublayer:self->_rightKeys];

  v9 = [MEMORY[0x1E4F39BE8] layer];
  spaceFill = self->_spaceFill;
  self->_spaceFill = v9;

  -[CALayer setAnchorPoint:](self->_spaceFill, "setAnchorPoint:", 0.0, 0.0);
  v11 = [(UIView *)self layer];
  [v11 addSublayer:self->_spaceFill];

  v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  controlKeys = self->_controlKeys;
  self->_controlKeys = v12;

  v14 = [(UIKeyboardSplitTransitionView *)self shadowLayers];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __49__UIKeyboardSliceTransitionView_initializeLayers__block_invoke;
  v15[3] = &unk_1E52DC4C0;
  v15[4] = self;
  [v14 enumerateObjectsUsingBlock:v15];
}

void __49__UIKeyboardSliceTransitionView_initializeLayers__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 layer];
  [v4 addSublayer:v3];
}

- (void)setRebuildFlags
{
  *(unsigned char *)&self->_rebuildFlags |= 0xFEu;
}

- (void)dealloc
{
  defaultKeyplaneImage = self->_defaultKeyplaneImage;
  if (defaultKeyplaneImage) {
    CGImageRelease(defaultKeyplaneImage);
  }
  splitKeyplaneImage = self->_splitKeyplaneImage;
  if (splitKeyplaneImage) {
    CGImageRelease(splitKeyplaneImage);
  }
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardSliceTransitionView;
  [(UIKeyboardSplitTransitionView *)&v5 dealloc];
}

- (void)setFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardSliceTransitionView;
  -[UIKeyboardSplitTransitionView setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(UIView *)self bounds];
  -[CALayer setBounds:](self->_leftKeys, "setBounds:");
  [(UIView *)self bounds];
  -[CALayer setBounds:](self->_rightKeys, "setBounds:");
  [(UIView *)self bounds];
  -[CALayer setPosition:](self->_rightKeys, "setPosition:", v4, 0.0);
}

- (void)rebuildTransitionForSplitStyleChange:(id)a3
{
  *(unsigned char *)&self->_rebuildFlags |= 4u;
  [(UIKeyboardSliceTransitionView *)self updateTransition];
}

- (CGImage)getKeyboardImageAsSplit:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._transitionDataSource);
  v6 = (CGImage *)[WeakRetained renderedKeyplaneWithToken:self->_keyplaneToken split:v3];

  return v6;
}

- (CGImage)defaultKeyboardImage
{
  return self->_defaultKeyplaneImage;
}

- (CGImage)splitKeyboardImage
{
  return self->_splitKeyplaneImage;
}

- (double)adjustedLeftWidthAtMergePoint
{
  [(UIKeyboardSliceSet *)self->super._sliceSet startRect];
  double v4 = v3;
  [(UIKeyboardSliceSet *)self->super._sliceSet mergePoint];
  return v4 * (v5 + 0.065);
}

- (double)adjustedRightWidthAtMergePoint
{
  [(UIKeyboardSliceSet *)self->super._sliceSet startRect];
  double v4 = v3;
  [(UIKeyboardSliceSet *)self->super._sliceSet mergePoint];
  return v4 * (1.0 - v5 + 0.065);
}

- (id)crossfadeOpacityAnimation
{
  unint64_t v2 = self->_orientation - 1;
  double v3 = [MEMORY[0x1E4F39BD8] normalizedKeyframeAnimationWithKeyPath:@"opacity"];
  double v4 = (void *)MEMORY[0x1E4F1C978];
  double v5 = [NSNumber numberWithFloat:0.0];
  if (v2 > 1)
  {
    LODWORD(v6) = 1042871747;
    v7 = [NSNumber numberWithFloat:v6];
    objc_super v8 = NSNumber;
    LODWORD(v9) = 0.25;
  }
  else
  {
    LODWORD(v6) = 1047233823;
    v7 = [NSNumber numberWithFloat:v6];
    objc_super v8 = NSNumber;
    LODWORD(v9) = 1052266988;
  }
  v10 = [v8 numberWithFloat:v9];
  LODWORD(v11) = 1.0;
  v12 = [NSNumber numberWithFloat:v11];
  v13 = objc_msgSend(v4, "arrayWithObjects:", v5, v7, v10, v12, 0);

  [v3 setKeyTimes:v13];
  v14 = (void *)MEMORY[0x1E4F1C978];
  v15 = [NSNumber numberWithFloat:0.0];
  objc_super v16 = [NSNumber numberWithFloat:0.0];
  LODWORD(v17) = 1.0;
  v18 = [NSNumber numberWithFloat:v17];
  LODWORD(v19) = 1.0;
  v20 = [NSNumber numberWithFloat:v19];
  v21 = objc_msgSend(v14, "arrayWithObjects:", v15, v16, v18, v20, 0);
  [v3 setValues:v21];

  return v3;
}

- (void)rebuildTopEdgeHighlightTransition
{
  [(CALayer *)self->_topEdgeHighlight removeAllAnimations];
  double v3 = [(CALayer *)self->_topEdgeHighlight sublayers];

  if (v3)
  {
    double v4 = [(CALayer *)self->_topEdgeHighlight sublayers];
    id v18 = [v4 objectAtIndex:0];

    double v5 = [(CALayer *)self->_topEdgeHighlight sublayers];
    double v6 = [v5 objectAtIndex:1];
  }
  else
  {
    id v18 = [MEMORY[0x1E4F39BE8] layer];
    objc_msgSend(v18, "setAnchorPoint:", 0.0, 0.0);
    id v7 = +[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1.0];
    objc_msgSend(v18, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));

    [(CALayer *)self->_topEdgeHighlight addSublayer:v18];
    double v6 = [MEMORY[0x1E4F39BE8] layer];
    objc_msgSend(v6, "setAnchorPoint:", 0.0, 0.0);
    id v8 = +[UIColor colorWithRed:0.75 green:0.75 blue:0.75 alpha:1.0];
    objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));

    [(CALayer *)self->_topEdgeHighlight addSublayer:v6];
  }
  [(UIKeyboardSliceSet *)self->super._sliceSet startRect];
  double v10 = v9;
  objc_msgSend(v18, "setBounds:", 0.0, 0.0);
  objc_msgSend(v6, "setBounds:", 0.0, 0.0, v10, 1.0);
  objc_msgSend(v6, "setPosition:", 0.0, 1.0);
  -[CALayer setBounds:](self->_topEdgeHighlight, "setBounds:", 0.0, 0.0, v10, 2.0);
  if (!self->super._centerFilled)
  {
    double v11 = [(UIKeyboardSliceTransitionView *)self crossfadeOpacityAnimation];
    v12 = (void *)MEMORY[0x1E4F1C978];
    LODWORD(v13) = 1.0;
    v14 = [NSNumber numberWithFloat:v13];
    v15 = [NSNumber numberWithFloat:0.0];
    objc_super v16 = [NSNumber numberWithFloat:0.0];
    double v17 = objc_msgSend(v12, "arrayWithObjects:", v14, v15, v16, 0);
    [v11 setValues:v17];

    [(CALayer *)self->_topEdgeHighlight addAnimation:v11 forKey:@"top edge opacity animation"];
  }
  *(unsigned char *)&self->_rebuildFlags &= ~0x10u;
}

- (void)rebuildShadows
{
  [(UIKeyboardSplitTransitionView *)self sizeForShadowLayer:1];
  double v4 = v3;
  [(UIKeyboardSplitTransitionView *)self sizeForShadowLayer:2];
  double v141 = v5;
  [(UIKeyboardSplitTransitionView *)self sizeForShadowLayer:3];
  double v7 = v6;
  [(UIKeyboardSliceSet *)self->super._sliceSet startRect];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [(UIKeyboardSliceSet *)self->super._sliceSet startRect];
  CGFloat v138 = v16;
  CGFloat v139 = v17;
  CGFloat v136 = v18;
  [(UIKeyboardSliceSet *)self->super._sliceSet leftWidth];
  CGFloat v20 = v19;
  [(UIKeyboardSliceSet *)self->super._sliceSet endRect];
  CGFloat v22 = v21;
  [(UIKeyboardSliceSet *)self->super._sliceSet rightWidth];
  CGFloat v137 = v23;
  [(UIKeyboardSliceSet *)self->super._sliceSet endRect];
  CGFloat v140 = v24;
  CGFloat v132 = v11;
  CGFloat v134 = v9;
  v145.origin.x = v9;
  v145.origin.y = v11;
  v145.size.width = v13;
  CGFloat v128 = v15;
  v145.size.height = v15;
  double v25 = v7 + v4 + CGRectGetHeight(v145) + -2.0 + -2.0;
  v146.origin.x = 0.0;
  v146.origin.y = 0.0;
  v146.size.width = v20;
  v146.size.height = v22;
  double v26 = v7 + v4 + CGRectGetHeight(v146) + -2.0 + -2.0;
  v143 = [(UIKeyboardSplitTransitionView *)self shadowLayers];
  [v143 enumerateObjectsUsingBlock:&__block_literal_global_392];
  [(UIKeyboardSliceSet *)self->super._sliceSet startRect];
  double v28 = v27;
  [(UIKeyboardSliceSet *)self->super._sliceSet startRect];
  double v30 = v29;
  [(UIKeyboardSliceSet *)self->super._sliceSet endRect];
  double v32 = v31 - v30 + -2.0;
  v33 = [v143 objectAtIndex:0];
  [(UIKeyboardSliceSet *)self->super._sliceSet startRect];
  objc_msgSend(v33, "setFrame:", 0.0, v28, v34 + -16.0, v7);
  objc_msgSend(v33, "setPosition:", 8.0, 0.0);
  [v33 setHidden:0];
  v35 = (void *)MEMORY[0x1E4F39B48];
  v36 = [NSNumber numberWithDouble:v28 + -2.0];
  double v37 = v28 + v32;
  double v38 = v26;
  double v39 = v25;
  double v40 = v4;
  v41 = [NSNumber numberWithDouble:v37];
  v42 = [v35 normalizedAnimationWithKeyPath:@"position.y" fromValue:v36 toValue:v41];

  [v33 addAnimation:v42 forKey:@"position animation"];
  v43 = [v143 objectAtIndex:7];
  v44 = [v143 objectAtIndex:8];
  objc_msgSend(v43, "setAnchorPoint:", 0.0, 0.0);
  objc_msgSend(v44, "setAnchorPoint:", 0.0, 0.0);
  double v45 = 2.0 - v4;
  objc_msgSend(v43, "setPosition:", 8.0, 2.0 - v4);
  [(UIKeyboardSliceSet *)self->super._sliceSet startRect];
  objc_msgSend(v44, "setPosition:", v46 + -8.0, 2.0 - v4);
  v47 = [MEMORY[0x1E4F39B48] normalizedAnimationWithKeyPath:@"bounds" fromValue:0 toValue:0];
  v48 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, v141, v39);
  [v47 setFromValue:v48];

  v49 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, v141, v38);
  [v47 setToValue:v49];

  [v43 addAnimation:v47 forKey:@"left outer shadow bounds"];
  [v44 addAnimation:v47 forKey:@"right outer shadow bounds"];
  if (!self->super._centerFilled)
  {
    double v122 = v38;
    v124 = v44;
    v125 = v43;
    v126 = v42;
    v127 = v33;
    v50 = [MEMORY[0x1E4F39BD8] normalizedKeyframeAnimationWithKeyPath:@"opacity"];
    unint64_t v51 = self->_orientation - 1;
    v52 = (void *)MEMORY[0x1E4F1C978];
    v53 = [NSNumber numberWithFloat:0.0];
    double v120 = v7;
    if (v51 > 1)
    {
      LODWORD(v54) = 1038845215;
      v55 = [NSNumber numberWithFloat:v54];
      v56 = NSNumber;
      LODWORD(v57) = 0.25;
    }
    else
    {
      LODWORD(v54) = 1043878380;
      v55 = [NSNumber numberWithFloat:v54];
      v56 = NSNumber;
      LODWORD(v57) = 1052266988;
    }
    v58 = [v56 numberWithFloat:v57];
    v59 = [NSNumber numberWithFloat:0.0];
    v60 = objc_msgSend(v52, "arrayWithObjects:", v53, v55, v58, v59, 0);
    [v50 setKeyTimes:v60];

    v61 = (void *)MEMORY[0x1E4F1C978];
    LODWORD(v62) = 1.0;
    v63 = [NSNumber numberWithFloat:v62];
    LODWORD(v64) = 1.0;
    v65 = [NSNumber numberWithFloat:v64];
    v66 = [NSNumber numberWithFloat:0.0];
    v67 = [NSNumber numberWithFloat:0.0];
    v68 = objc_msgSend(v61, "arrayWithObjects:", v63, v65, v66, v67, 0);
    v123 = v50;
    [v50 setValues:v68];

    [v127 addAnimation:v50 forKey:@"full-width opacity"];
    [(UIKeyboardSliceTransitionView *)self adjustedLeftWidthAtMergePoint];
    CGFloat v70 = v69;
    [(UIKeyboardSliceTransitionView *)self adjustedRightWidthAtMergePoint];
    CGFloat v72 = v71;
    CGFloat rect = v71;
    v73 = [v143 objectAtIndex:1];
    v74 = [v143 objectAtIndex:4];
    objc_msgSend(v73, "setAnchorPoint:", 0.0, 1.0);
    objc_msgSend(v74, "setAnchorPoint:", 1.0, 1.0);
    v75 = v73;
    objc_msgSend(v73, "setPosition:", 0.0, 2.0);
    [(UIKeyboardSliceSet *)self->super._sliceSet startRect];
    objc_msgSend(v74, "setPosition:", v76, 2.0);
    v147.origin.y = v132;
    v147.origin.x = v134;
    v147.size.width = v70;
    v147.size.height = v128;
    CGFloat v77 = CGRectGetWidth(v147) + -16.0 + -8.0;
    v148.origin.x = 0.0;
    v148.origin.y = 0.0;
    v148.size.height = v22;
    v148.size.width = v20;
    CGFloat v130 = CGRectGetWidth(v148) + -16.0 + -1.0;
    v149.origin.x = v138;
    v149.origin.y = v139;
    v149.size.width = v72;
    v149.size.height = v136;
    CGFloat v131 = CGRectGetWidth(v149) + -16.0 + -8.0 + -1.0;
    v150.origin.x = 0.0;
    v150.origin.y = 0.0;
    v150.size.width = v137;
    v150.size.height = v140;
    CGFloat v78 = CGRectGetWidth(v150) + -16.0 + -1.0;
    v79 = [MEMORY[0x1E4F39B48] normalizedAnimationWithKeyPath:@"bounds" fromValue:0 toValue:0];
    v80 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, v77, v40);
    v135 = v79;
    [v79 setFromValue:v80];

    v81 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, v130, v40);
    [v79 setToValue:v81];

    v121 = v75;
    [v75 addAnimation:v79 forKey:@"top left bounds"];
    v82 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, v131, v40);
    [v79 setFromValue:v82];

    CGFloat v83 = v78;
    v84 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, v78, v40);
    [v79 setToValue:v84];

    v129 = v74;
    [v74 addAnimation:v79 forKey:@"top right bounds"];
    [v75 setHidden:0];
    [v74 setHidden:0];
    v85 = [v143 objectAtIndex:2];
    v86 = [v143 objectAtIndex:5];
    objc_msgSend(v85, "setAnchorPoint:", 0.0, 0.0);
    objc_msgSend(v86, "setAnchorPoint:", 1.0, 0.0);
    objc_msgSend(v85, "setPosition:", 0.0, v45);
    objc_msgSend(v86, "setPosition:", 0.0, v45);
    v133 = [MEMORY[0x1E4F39B48] normalizedAnimationWithKeyPath:@"bounds" fromValue:0 toValue:0];
    v87 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, v141, v39);
    [v133 setFromValue:v87];

    v88 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, v141, v122);
    [v133 setToValue:v88];

    v89 = v85;
    [v85 addAnimation:v133 forKey:@"left center bounds"];
    [v86 addAnimation:v133 forKey:@"right center bounds"];
    v90 = [MEMORY[0x1E4F39B48] normalizedAnimationWithKeyPath:@"position.x" fromValue:0 toValue:0];
    v91 = NSNumber;
    v151.origin.x = 0.0;
    v151.origin.y = 0.0;
    v151.size.width = v77;
    v151.size.height = v40;
    CGFloat Width = CGRectGetWidth(v151);
    *(float *)&CGFloat Width = Width;
    v93 = [v91 numberWithFloat:Width];
    [v90 setFromValue:v93];

    v94 = NSNumber;
    v152.origin.x = 0.0;
    v152.origin.y = 0.0;
    v152.size.width = v130;
    v152.size.height = v40;
    CGFloat v95 = CGRectGetWidth(v152);
    *(float *)&CGFloat v95 = v95;
    v96 = [v94 numberWithFloat:v95];
    [v90 setToValue:v96];

    [v85 addAnimation:v90 forKey:@"left center position"];
    v97 = NSNumber;
    [(UIKeyboardSliceSet *)self->super._sliceSet startRect];
    double v98 = CGRectGetWidth(v153);
    v154.origin.x = v138;
    v154.origin.y = v139;
    v154.size.width = rect;
    v154.size.height = v136;
    double v99 = v98 - CGRectGetWidth(v154) + -3.0;
    *(float *)&double v99 = v99;
    v100 = [v97 numberWithFloat:v99];
    v142 = v90;
    [v90 setFromValue:v100];

    v101 = NSNumber;
    [(UIKeyboardSliceSet *)self->super._sliceSet startRect];
    double v102 = CGRectGetWidth(v155);
    v156.origin.x = 0.0;
    v156.origin.y = 0.0;
    v156.size.width = v137;
    v156.size.height = v140;
    double v103 = v102 - CGRectGetWidth(v156) + -8.0 + -3.0;
    *(float *)&double v103 = v103;
    v104 = [v101 numberWithFloat:v103];
    [v90 setToValue:v104];

    [v86 addAnimation:v90 forKey:@"right center position"];
    [v85 setHidden:0];
    [v86 setHidden:0];
    v105 = [v143 objectAtIndex:3];
    v106 = [v143 objectAtIndex:6];
    objc_msgSend(v105, "setAnchorPoint:", 0.0, 0.0);
    objc_msgSend(v106, "setAnchorPoint:", 1.0, 0.0);
    objc_msgSend(v105, "setPosition:", 8.0, -1.0);
    [(UIKeyboardSliceSet *)self->super._sliceSet startRect];
    objc_msgSend(v106, "setPosition:", v107 + -8.0, -1.0);
    v157.origin.x = 0.0;
    v157.origin.y = 0.0;
    v157.size.width = v77;
    v157.size.height = v40;
    CGFloat v108 = CGRectGetWidth(v157) + -8.0;
    v158.origin.x = 0.0;
    v158.origin.y = 0.0;
    v158.size.width = v130;
    v158.size.height = v40;
    CGFloat v109 = CGRectGetWidth(v158) + -8.0;
    v159.origin.x = 0.0;
    v159.origin.y = 0.0;
    v159.size.width = v131;
    v159.size.height = v40;
    CGFloat v110 = CGRectGetWidth(v159) + -8.0;
    v160.origin.x = 0.0;
    v160.origin.y = 0.0;
    v160.size.width = v83;
    v160.size.height = v40;
    CGFloat v111 = CGRectGetWidth(v160) + -8.0;
    v112 = [MEMORY[0x1E4F39B48] normalizedAnimationWithKeyPath:@"bounds" fromValue:0 toValue:0];
    v113 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, v108, v120);
    [v112 setFromValue:v113];

    v114 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, v109, v120);
    [v112 setToValue:v114];

    [v105 addAnimation:v112 forKey:@"bottom left bounds"];
    v115 = [MEMORY[0x1E4F39B48] normalizedAnimationWithKeyPath:@"bounds" fromValue:0 toValue:0];
    v116 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, v110, v120);
    [v115 setFromValue:v116];

    v117 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", 0.0, 0.0, v111, v120);
    [v115 setToValue:v117];

    [v106 addAnimation:v115 forKey:@"bottom right bounds"];
    v42 = v126;
    [v105 addAnimation:v126 forKey:@"position animation"];
    [v106 addAnimation:v126 forKey:@"position animation"];
    [v105 setHidden:0];
    [v106 setHidden:0];
    v118 = [(UIKeyboardSliceTransitionView *)self crossfadeOpacityAnimation];
    [v121 addAnimation:v118 forKey:@"top left opacity"];
    [v129 addAnimation:v118 forKey:@"top right opacity"];
    [v89 addAnimation:v118 forKey:@"center left opacity"];
    [v86 addAnimation:v118 forKey:@"center right opacity"];
    [v105 addAnimation:v118 forKey:@"bottom left opacity"];
    [v106 addAnimation:v118 forKey:@"bottom right opacity"];
    [(UIKeyboardSliceTransitionView *)self rebuildTopEdgeHighlightTransition];

    v33 = v127;
    v44 = v124;
    v43 = v125;
  }
}

void __47__UIKeyboardSliceTransitionView_rebuildShadows__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  if ((unint64_t)(a3 - 9) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    id v5 = v4;
    [v4 setHidden:1];
    [v5 removeAllAnimations];
    id v4 = v5;
  }
}

- (void)rebuildBackgroundAndShadowTransitions
{
  double v3 = [(UIKeyboardSplitTransitionView *)self backgroundLayers];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__UIKeyboardSliceTransitionView_rebuildBackgroundAndShadowTransitions__block_invoke;
  v4[3] = &unk_1E52DC4C0;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];

  [(UIKeyboardSliceTransitionView *)self rebuildShadows];
  *(unsigned char *)&self->_rebuildFlags &= ~4u;
}

void __70__UIKeyboardSliceTransitionView_rebuildBackgroundAndShadowTransitions__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v61 = a2;
  [v61 removeAnimationForKey:@"bounds animation"];
  switch(a3)
  {
    case 2:
      [*(id *)(*(void *)(a1 + 32) + 552) startRect];
      double v8 = v32;
      double v31 = v33;
      double v16 = v34;
      [*(id *)(a1 + 32) adjustedRightWidthAtMergePoint];
      double v14 = v35;
      [*(id *)(*(void *)(a1 + 32) + 552) rightWidth];
      double v37 = v36;
      double v38 = +[UIKeyboardPreferencesController sharedPreferencesController];
      double v39 = [v38 preferencesActions];
      [v39 rivenSizeFactor:9.0];
      double v26 = v37 + v40;
      [*(id *)(*(void *)(a1 + 32) + 552) endRect];
      double v28 = v41;

      v42 = [*(id *)(a1 + 32) layer];
      [v42 insertSublayer:v61 atIndex:0];

      BOOL v30 = *(unsigned char *)(*(void *)(a1 + 32) + 544) != 0;
      double v20 = 0.0;
      goto LABEL_7;
    case 1:
      [*(id *)(*(void *)(a1 + 32) + 552) startRect];
      double v8 = v43;
      double v31 = v44;
      double v16 = v45;
      [*(id *)(a1 + 32) adjustedLeftWidthAtMergePoint];
      double v14 = v46;
      v47 = +[UIKeyboardPreferencesController sharedPreferencesController];
      v48 = [v47 preferencesActions];
      [v48 rivenSizeFactor:9.0];
      double v20 = -v49;
      [*(id *)(*(void *)(a1 + 32) + 552) leftWidth];
      double v51 = v50;
      v52 = +[UIKeyboardPreferencesController sharedPreferencesController];
      v53 = [v52 preferencesActions];
      [v53 rivenSizeFactor:9.0];
      double v26 = v51 + v54;
      [*(id *)(*(void *)(a1 + 32) + 552) endRect];
      double v28 = v55;

      v56 = [*(id *)(a1 + 32) layer];
      [v56 insertSublayer:v61 atIndex:0];

      BOOL v30 = *(unsigned char *)(*(void *)(a1 + 32) + 544) != 0;
      goto LABEL_7;
    case 0:
      id v5 = +[UIKeyboardPreferencesController sharedPreferencesController];
      double v6 = [v5 preferencesActions];
      [v6 rivenSizeFactor:9.0];
      double v8 = -v7;
      [*(id *)(*(void *)(a1 + 32) + 552) startRect];
      double v10 = v9;
      CGFloat v11 = +[UIKeyboardPreferencesController sharedPreferencesController];
      double v12 = [v11 preferencesActions];
      [v12 rivenSizeFactor:9.0];
      double v14 = v10 + v13 + v13;
      [*(id *)(*(void *)(a1 + 32) + 552) startRect];
      double v16 = v15;

      double v17 = +[UIKeyboardPreferencesController sharedPreferencesController];
      double v18 = [v17 preferencesActions];
      [v18 rivenSizeFactor:9.0];
      double v20 = -v19;
      [*(id *)(*(void *)(a1 + 32) + 552) endRect];
      double v22 = v21;
      double v23 = +[UIKeyboardPreferencesController sharedPreferencesController];
      double v24 = [v23 preferencesActions];
      [v24 rivenSizeFactor:9.0];
      double v26 = v22 + v25 + v25;
      [*(id *)(*(void *)(a1 + 32) + 552) endRect];
      double v28 = v27;

      double v29 = [*(id *)(a1 + 32) layer];
      [v29 insertSublayer:v61 atIndex:0];

      BOOL v30 = *(unsigned char *)(*(void *)(a1 + 32) + 544) == 0;
      double v31 = 0.0;
LABEL_7:
      [v61 setHidden:v30];
      double v57 = 0.0;
      goto LABEL_9;
  }
  double v20 = *MEMORY[0x1E4F1DB28];
  double v57 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v28 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v16 = v28;
  double v14 = v26;
  double v31 = v57;
  double v8 = *MEMORY[0x1E4F1DB28];
LABEL_9:
  v58 = [MEMORY[0x1E4F39B48] normalizedAnimationWithKeyPath:@"bounds" fromValue:0 toValue:0];
  v59 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v8, v31, v14, v16);
  [v58 setFromValue:v59];

  v60 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v20, v57, v26, v28);
  [v58 setToValue:v60];

  [v61 addAnimation:v58 forKey:@"bounds animation"];
}

- (void)rebuildBackgroundGradientTransitions
{
  double v3 = [(UIKeyboardSplitTransitionView *)self colorsForBackgroundLayer:0];
  uint64_t v4 = [(UIKeyboardSplitTransitionView *)self colorsForBackgroundLayer:1];
  id v5 = (void *)v4;
  double v6 = 0;
  if (v3 && v4)
  {
    double v6 = [MEMORY[0x1E4F39B48] normalizedAnimationWithKeyPath:@"colors" fromValue:v3 toValue:v4];
    double v7 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A488]];
    [v6 setTimingFunction:v7];
  }
  double v8 = [(UIKeyboardSplitTransitionView *)self backgroundLayers];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__UIKeyboardSliceTransitionView_rebuildBackgroundGradientTransitions__block_invoke;
  v10[3] = &unk_1E52DC4C0;
  id v11 = v6;
  id v9 = v6;
  [v8 enumerateObjectsUsingBlock:v10];

  *(unsigned char *)&self->_rebuildFlags &= ~8u;
}

void __69__UIKeyboardSliceTransitionView_rebuildBackgroundGradientTransitions__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 removeAnimationForKey:@"gradient interpolation"];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    [v4 addAnimation:v3 forKey:@"gradient interpolation"];
  }
  else {
    objc_msgSend(v4, "setColors:");
  }
}

- (void)updateTransitionForSlice:(id)a3 withStart:(id)a4 startContents:(id)a5 end:(id)a6 endContents:(id)a7 updateContents:(BOOL)a8
{
  BOOL v8 = a8;
  id v25 = a3;
  id v13 = a4;
  unint64_t v14 = (unint64_t)a5;
  id v15 = a6;
  unint64_t v16 = (unint64_t)a7;
  double v17 = (void *)v16;
  if (v14 | v16)
  {
    if (v14) {
      BOOL v18 = v16 == 0;
    }
    else {
      BOOL v18 = 1;
    }
    int v19 = !v18;
    if (v8)
    {
      [v13 setContents:v14];
      [v15 setContents:v17];
      double v20 = +[UIScreen mainScreen];
      [v20 scale];
      objc_msgSend(v13, "setContentsScale:");

      [v13 contentsScale];
      objc_msgSend(v15, "setContentsScale:");
    }
    [v13 removeAnimationForKey:@"start opacity interpolation"];
    [v15 removeAnimationForKey:@"end opacity interpolation"];
    if (v19)
    {
      double v21 = [MEMORY[0x1E4F39B48] normalizedAnimationWithKeyPath:@"opacity" fromValue:&unk_1ED3F5850 toValue:&unk_1ED3F5868];
      double v22 = [MEMORY[0x1E4F39C10] _kbTimingFunction];
      [v21 setTimingFunction:v22];

      [v13 addAnimation:v21 forKey:@"start opacity interpolation"];
      double v23 = [MEMORY[0x1E4F39B48] normalizedAnimationWithKeyPath:@"opacity" fromValue:&unk_1ED3F5868 toValue:&unk_1ED3F5850];
      double v24 = [MEMORY[0x1E4F39C10] _kbTimingFunction];
      [v23 setTimingFunction:v24];

      [v15 addAnimation:v23 forKey:@"end opacity interpolation"];
    }
  }
}

- (void)refreshKeyplaneImages
{
  defaultKeyplaneImage = self->_defaultKeyplaneImage;
  if (defaultKeyplaneImage)
  {
    CGImageRelease(defaultKeyplaneImage);
    self->_defaultKeyplaneImage = 0;
  }
  splitKeyplaneImage = self->_splitKeyplaneImage;
  if (splitKeyplaneImage)
  {
    CGImageRelease(splitKeyplaneImage);
    self->_splitKeyplaneImage = 0;
  }
  self->_defaultKeyplaneImage = [(UIKeyboardSliceTransitionView *)self getKeyboardImageAsSplit:0];
  id v5 = [(UIKeyboardSliceTransitionView *)self getKeyboardImageAsSplit:1];
  self->_splitKeyplaneImage = v5;
  if (self->_defaultKeyplaneImage)
  {
    CGImageRetain(self->_defaultKeyplaneImage);
    id v5 = self->_splitKeyplaneImage;
  }
  if (v5)
  {
    CGImageRetain(v5);
  }
}

- (void)rebuildSliceTransitions
{
  unint64_t v2 = self;
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  p_leftKeys = &self->_leftKeys;
  id v4 = [(CALayer *)self->_leftKeys sublayers];
  [v4 makeObjectsPerformSelector:sel_removeFromSuperlayer];

  id v5 = [(CALayer *)v2->_rightKeys sublayers];
  [v5 makeObjectsPerformSelector:sel_removeFromSuperlayer];

  double v102 = p_leftKeys;
  [(CALayer *)*p_leftKeys removeAllAnimations];
  p_rightKeys = &v2->_rightKeys;
  [(CALayer *)v2->_rightKeys removeAllAnimations];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v113 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  [(UIKeyboardSliceSet *)v2->super._sliceSet startRect];
  double v10 = v9;
  [(UIKeyboardSliceSet *)v2->super._sliceSet leftWidth];
  double v12 = v11;
  [(UIKeyboardSliceSet *)v2->super._sliceSet rightWidth];
  double v14 = v13;
  [(UIKeyboardSliceSet *)v2->super._sliceSet leftWidth];
  double v16 = v15;
  [(UIKeyboardSliceSet *)v2->super._sliceSet rightWidth];
  double v18 = v17;
  [(UIKeyboardSliceSet *)v2->super._sliceSet endRect];
  double v94 = v19;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id obj = [(UIKeyboardSliceSet *)v2->super._sliceSet slices];
  uint64_t v103 = [obj countByEnumeratingWithState:&v115 objects:v119 count:16];
  double v104 = v7;
  int v20 = 0;
  double v21 = 0;
  if (v103)
  {
    v105 = 0;
    v97 = 0;
    double v98 = 0;
    double v100 = v10 - v12 - v14 + -3.0;
    double v93 = v16 + v18 + 3.0;
    uint64_t v99 = *(void *)v116;
    double width = v8;
    double y = v6;
    double x = v113;
    do
    {
      for (uint64_t i = 0; i != v103; ++i)
      {
        int v106 = v20;
        if (*(void *)v116 != v99) {
          objc_enumerationMutation(obj);
        }
        double v26 = *(void **)(*((void *)&v115 + 1) + 8 * i);
        [v26 startRect];
        double v28 = v27;
        double v30 = v29;
        double v32 = v31;
        double r2 = v33;
        [v26 endRect];
        double v35 = v34;
        double v112 = v37;
        double v114 = v36;
        double v111 = v38;
        [(UIKeyboardSliceSet *)v2->super._sliceSet endRect];
        double v40 = v100;
        if (v35 <= v39 * 0.5) {
          double v40 = 0.0;
        }
        double v108 = v40;
        double v41 = [MEMORY[0x1E4F39BE8] layer];
        v42 = [MEMORY[0x1E4F39BE8] layer];
        double v43 = [v26 startToken];
        if (v43)
        {
          double v44 = [v26 startToken];
          double v45 = [(UIKeyboardSplitTransitionView *)v2 keyImageWithToken:v44];
        }
        else
        {
          double v45 = v2->_defaultKeyplaneImage;
        }

        double v46 = [v26 endToken];
        if (v46)
        {
          v47 = [v26 endToken];
          v48 = [(UIKeyboardSplitTransitionView *)v2 keyImageWithToken:v47];
        }
        else
        {
          v48 = v2->_splitKeyplaneImage;
        }

        [(UIKeyboardSliceTransitionView *)v2 updateTransitionForSlice:v26 withStart:v41 startContents:v45 end:v42 endContents:v48 updateContents:1];
        double v49 = [v26 startToken];

        if (v49)
        {
          if ([v26 normalization] == 1)
          {
            objc_msgSend(v41, "setContentsRect:", 0.0, 0.0, 0.5, 1.0);
            id v50 = v41;

            double v98 = v50;
          }
          if ([v26 normalization] == 2)
          {
            objc_msgSend(v41, "setContentsRect:", 0.5, 0.0, 0.5, 1.0);
            id v51 = v41;

            v97 = v51;
          }
          double height = r2;
        }
        else
        {
          [(UIKeyboardSliceSet *)v2->super._sliceSet startRect];
          double height = r2;
          objc_msgSend(v41, "setContentsRect:", v28 / v53, v30 / v54, v32 / v53, r2 / v54);
        }
        objc_msgSend(v41, "setAnchorPoint:", 0.0, 0.0);
        objc_msgSend(v41, "setFrame:", v28, v30, v32, height);
        if ([v26 normalization])
        {
          objc_msgSend(v41, "setContentsRect:", 0.0, 0.0, 1.0, 1.0);
          objc_msgSend(v41, "setContentsCenter:", 0.1, 0.0, 0.8, 1.0);
          v121.origin.double x = x;
          v121.origin.double y = y;
          v121.size.double width = width;
          v121.size.double height = v104;
          IsEmptdouble y = CGRectIsEmpty(v121);
          double v56 = v104;
          double v57 = width;
          double width = v32;
          double v58 = y;
          double y = v30;
          double v59 = x;
          double x = v28;
          if (!IsEmpty)
          {
            v124.origin.double x = v28;
            v124.origin.double y = v30;
            v124.size.double width = v32;
            v124.size.double height = r2;
            CGRect v122 = CGRectUnion(*(CGRect *)&v59, v124);
            double x = v122.origin.x;
            double y = v122.origin.y;
            double width = v122.size.width;
            double height = v122.size.height;
          }
          v60 = v45;

          id v61 = v48;
          double v21 = v61;
          v105 = v60;
          double v104 = height;
        }
        double v62 = [v26 endToken];

        if (!v62) {
          objc_msgSend(v42, "setContentsRect:", (v35 - v108) / v93, v114 / v94, v112 / v93, v111 / v94);
        }
        CGFloat v109 = v48;
        objc_msgSend(v42, "setAnchorPoint:", 0.0, 0.0);
        objc_msgSend(v42, "setFrame:", v35, v114, v112, v111);
        uint64_t v63 = [v26 endToken];
        double v107 = v45;
        if (v63)
        {
          double v64 = (void *)v63;
          int v65 = [v26 normalization];

          if (v65 != 2)
          {
            controlKeys = v2->_controlKeys;
            v67 = (void *)MEMORY[0x1E4F1CA60];
            [v26 startToken];
            v68 = v96 = v21;
            double v69 = [v26 endToken];
            CGFloat v70 = objc_msgSend(v67, "dictionaryWithObjectsAndKeys:", v41, v68, v42, v69, 0);
            double v71 = [v26 endToken];
            [v71 name];
            v73 = CGFloat v72 = v2;
            [(NSMutableDictionary *)controlKeys setObject:v70 forKey:v73];

            unint64_t v2 = v72;
            double v21 = v96;
          }
        }
        v74 = [MEMORY[0x1E4F39B48] normalizedAnimationWithKeyPath:@"bounds" fromValue:0 toValue:0];
        v75 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v28, v30, v32, r2);
        [v74 setFromValue:v75];

        double v76 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v35, v114, v112, v111);
        [v74 setToValue:v76];

        [v41 addAnimation:v74 forKey:@"start bounds interpolation"];
        [v42 addAnimation:v74 forKey:@"end bounds interpolation"];
        CGFloat v77 = [MEMORY[0x1E4F39B48] normalizedAnimationWithKeyPath:@"position" fromValue:0 toValue:0];
        CGFloat v78 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v28, v30);
        [v77 setFromValue:v78];

        v79 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v35, v114);
        [v77 setToValue:v79];

        [v41 addAnimation:v77 forKey:@"start position interpolation"];
        [v42 addAnimation:v77 forKey:@"end position interpolation"];
        if (v2->_defaultKeyplaneImage)
        {
          int v20 = 1;
          v80 = v109;
          if (v2->_splitKeyplaneImage && v109)
          {
            v81 = [MEMORY[0x1E4F39B48] normalizedAnimationWithKeyPath:@"opacity" fromValue:&unk_1ED3F5850 toValue:&unk_1ED3F5868];
            [MEMORY[0x1E4F39C10] _kbTimingFunction];
            CGFloat v83 = v82 = v21;
            [v81 setTimingFunction:v83];

            double v21 = v82;
            v80 = v109;
            [v41 addAnimation:v81 forKey:@"start opacity interpolation"];

            int v20 = v106;
          }
        }
        else
        {
          int v20 = 1;
          v80 = v109;
        }
        [(UIView *)v2 bounds];
        v85 = (id *)v102;
        if (v35 >= v84 * 0.5) {
          v85 = (id *)p_rightKeys;
        }
        id v86 = *v85;
        [v86 addSublayer:v42];
        [v86 addSublayer:v41];
      }
      uint64_t v103 = [obj countByEnumeratingWithState:&v115 objects:v119 count:16];
    }
    while (v103);
  }
  else
  {
    v105 = 0;
    v97 = 0;
    double v98 = 0;
    double width = v8;
    double y = v6;
    double x = v113;
  }

  v87 = v105;
  [(CALayer *)v2->_spaceFill setContents:v105];
  [(CALayer *)v2->_spaceFill removeAllAnimations];
  v123.origin.double x = x;
  v123.origin.double y = y;
  v123.size.double width = width;
  v123.size.double height = v104;
  if (!CGRectIsEmpty(v123))
  {
    -[CALayer setFrame:](v2->_spaceFill, "setFrame:", x, y, width, v104);
    v88 = [MEMORY[0x1E4F39BD8] normalizedKeyframeAnimationWithKeyPath:@"opacity"];
    [v88 setKeyTimes:&unk_1ED3F0A30];
    [v88 setValues:&unk_1ED3F0A48];
    [(CALayer *)v2->_spaceFill addAnimation:v88 forKey:@"space fill opacity interpolation"];
    if (v98 && v97 && v21)
    {
      [v98 removeAnimationForKey:@"start opacity interpolation"];
      [MEMORY[0x1E4F39BD8] normalizedKeyframeAnimationWithKeyPath:@"opacity"];
      v90 = v89 = v21;
      [v90 setKeyTimes:&unk_1ED3F0A60];
      [v90 setValues:&unk_1ED3F0A78];
      [v98 addAnimation:v90 forKey:@"start opacity interpolation"];
      [v97 removeAnimationForKey:@"start opacity interpolation"];
      v91 = [MEMORY[0x1E4F39BD8] normalizedKeyframeAnimationWithKeyPath:@"opacity"];

      double v21 = v89;
      v87 = v105;
      [v91 setKeyTimes:&unk_1ED3F0A90];
      [v91 setValues:&unk_1ED3F0AA8];
      [v97 addAnimation:v91 forKey:@"start opacity interpolation"];
    }
  }
  if (v20) {
    char v92 = 2;
  }
  else {
    char v92 = 0;
  }
  *(unsigned char *)&v2->_rebuildFlags = *(unsigned char *)&v2->_rebuildFlags & 0xFD | v92;
}

- (void)rebuildShiftSlices
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [(UIKeyboardSliceSet *)self->super._sliceSet controlKeys];
  uint64_t v2 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v25;
    int v5 = 2;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v25 != v4) {
        objc_enumerationMutation(obj);
      }
      double v7 = *(void **)(*((void *)&v24 + 1) + 8 * v6);
      if ([v7 hasSuffix:@"Shift-Key"])
      {
        int v23 = v5;
        double v8 = [(UIKeyboardSliceSet *)self->super._sliceSet controlKeys];
        double v9 = [v8 objectForKey:v7];

        double v10 = [(NSMutableDictionary *)self->_controlKeys objectForKey:v7];
        double v11 = [v9 startToken];
        double v22 = [v10 objectForKey:v11];

        double v12 = [v9 endToken];
        double v13 = [v10 objectForKey:v12];

        double v14 = [v9 startToken];
        double v15 = [(UIKeyboardSplitTransitionView *)self keyImageWithToken:v14];

        double v16 = [v9 endToken];
        [(UIKeyboardSplitTransitionView *)self keyImageWithToken:v16];
        uint64_t v17 = v3;
        double v19 = v18 = v4;

        [(UIKeyboardSliceTransitionView *)self updateTransitionForSlice:v9 withStart:v22 startContents:v15 end:v13 endContents:v19 updateContents:1];
        uint64_t v4 = v18;
        uint64_t v3 = v17;

        int v5 = 1;
        if (v23 == 1) {
          break;
        }
      }
      if (v3 == ++v6)
      {
        uint64_t v3 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v3) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  *(unsigned char *)&self->_rebuildFlags &= ~0x20u;
}

- (void)rebuildReturnSlices
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v3 = [(UIKeyboardSliceSet *)self->super._sliceSet controlKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v8 hasSuffix:@"Return-Key"])
        {
          double v9 = [(UIKeyboardSliceSet *)self->super._sliceSet controlKeys];
          double v10 = [v9 objectForKey:v8];

          double v11 = [(NSMutableDictionary *)self->_controlKeys objectForKey:v8];
          double v12 = [v10 startToken];
          double v13 = [v11 objectForKey:v12];

          double v14 = [v10 endToken];
          double v15 = [v11 objectForKey:v14];

          double v16 = [v10 startToken];
          uint64_t v17 = [(UIKeyboardSplitTransitionView *)self keyImageWithToken:v16];

          uint64_t v18 = [v10 endToken];
          double v19 = [(UIKeyboardSplitTransitionView *)self keyImageWithToken:v18];

          [(UIKeyboardSliceTransitionView *)self updateTransitionForSlice:v10 withStart:v13 startContents:v17 end:v15 endContents:v19 updateContents:1];
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  *(unsigned char *)&self->_rebuildFlags &= ~0x40u;
}

- (void)rebuildMoreIntlKeys
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  sliceSet = self->super._sliceSet;
  if (sliceSet)
  {
    uint64_t v4 = [(UIKeyboardSliceSet *)sliceSet controlKeys];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      uint64_t v6 = [(NSMutableDictionary *)self->_controlKeys count];

      if (v6)
      {
        double v7 = [(UIKeyboardSliceSet *)self->super._sliceSet controlKeys];
        double v8 = [v7 objectForKey:@"MoreIntlNames"];

        if ([v8 count])
        {
          BOOL v9 = [(UIKeyboardSplitTransitionView *)self showIntlKey];
          BOOL v10 = [(UIKeyboardSplitTransitionView *)self showDictationKey];
          BOOL v11 = [(UIKeyboardSplitTransitionView *)self showIntlKey];
          if ([(UIKeyboardSplitTransitionView *)self showDictationKey]) {
            int v12 = 2;
          }
          else {
            int v12 = 0;
          }
          double v71 = self;
          int v13 = v12 | v11;
          double v14 = [(UIKeyboardSliceSet *)v71->super._sliceSet controlKeys];
          double v15 = [v14 objectForKey:@"MoreIntlStarts"];
          v68 = +[UIKBTree shapesForControlKeyShapes:v15 options:v13 | 4u];

          double v16 = [(UIKeyboardSliceSet *)v71->super._sliceSet controlKeys];
          uint64_t v17 = [v16 objectForKey:@"MoreIntlEnds"];
          uint64_t v18 = v13 | 0xCu;
          double v19 = v71;
          CGFloat v70 = +[UIKBTree shapesForControlKeyShapes:v17 options:v18];

          long long v77 = 0u;
          long long v78 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          int v65 = v8;
          id obj = v8;
          uint64_t v72 = [obj countByEnumeratingWithState:&v75 objects:v79 count:16];
          if (v72)
          {
            unsigned int v66 = !v10;
            unsigned int v67 = !v9;
            uint64_t v69 = *(void *)v76;
            do
            {
              for (uint64_t i = 0; i != v72; ++i)
              {
                if (*(void *)v76 != v69) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v21 = *(void *)(*((void *)&v75 + 1) + 8 * i);
                long long v22 = objc_msgSend(obj, "objectForKey:", v21, v65);
                int v23 = [v22 hasSuffix:@"Space-Key"];
                long long v24 = [(UIKeyboardSliceSet *)v19->super._sliceSet controlKeys];
                uint64_t v25 = [v24 objectForKey:v22];

                long long v26 = [(NSMutableDictionary *)v19->_controlKeys objectForKey:v22];
                long long v27 = [v25 startToken];
                double v28 = [v26 objectForKey:v27];

                uint64_t v29 = [v25 endToken];
                v74 = v26;
                double v30 = [v26 objectForKey:v29];

                if (v23)
                {
                  [v25 startRect];
                  double v32 = v31;
                  double v34 = v33;
                  double v36 = v35;
                  double v38 = v37;
                }
                else
                {
                  double v39 = [v68 objectForKey:v21];
                  [v39 paddedFrame];
                  double v32 = v40;
                  double v34 = v41;
                  double v36 = v42;
                  double v38 = v43;
                }
                double v44 = [v70 objectForKey:v21];
                [v44 paddedFrame];
                double v46 = v45;
                double v48 = v47;
                double v50 = v49;
                double v52 = v51;

                if ((v23 & 1) == 0)
                {
                  double v53 = [v25 startToken];
                  objc_msgSend(v53, "setSize:", v36, v38);
                }
                double v54 = [v25 endToken];
                objc_msgSend(v54, "setSize:", v50, v52);

                objc_msgSend(v28, "setFrame:", v32, v34, v36, v38);
                objc_msgSend(v30, "setFrame:", v46, v48, v50, v52);
                objc_msgSend(v25, "setStartRect:", v32, v34, v36, v38);
                objc_msgSend(v25, "setEndRect:", v46, v48, v50, v52);
                double v55 = [v25 startToken];
                double v56 = [(UIKeyboardSplitTransitionView *)v19 keyImageWithToken:v55];

                double v57 = [v25 endToken];
                double v58 = [(UIKeyboardSplitTransitionView *)v19 keyImageWithToken:v57];

                if (v58) {
                  [v30 setContents:v58];
                }
                if ((v23 & 1) == 0)
                {
                  if (v56) {
                    [v28 setContents:v56];
                  }
                  [(UIKeyboardSliceTransitionView *)v19 updateTransitionForSlice:v25 withStart:v28 startContents:v56 end:v30 endContents:v58 updateContents:0];
                }
                double v59 = [MEMORY[0x1E4F39B48] normalizedAnimationWithKeyPath:@"bounds" fromValue:0 toValue:0];
                v60 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v32, v34, v36, v38);
                [v59 setFromValue:v60];

                id v61 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v46, v48, v50, v52);
                [v59 setToValue:v61];

                [v28 addAnimation:v59 forKey:@"start bounds interpolation"];
                [v30 addAnimation:v59 forKey:@"end bounds interpolation"];
                double v62 = [MEMORY[0x1E4F39B48] normalizedAnimationWithKeyPath:@"position" fromValue:0 toValue:0];
                uint64_t v63 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v32, v34);
                [v62 setFromValue:v63];

                double v64 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v46, v48);
                [v62 setToValue:v64];

                [v28 addAnimation:v62 forKey:@"start position interpolation"];
                [v30 addAnimation:v62 forKey:@"end position interpolation"];
                if ([v22 hasSuffix:@"International-Key"])
                {
                  [v28 setHidden:v67];
                  [v30 setHidden:v67];
                }
                if ([v22 hasSuffix:@"Dictation-Key"])
                {
                  [v28 setHidden:v66];
                  [v30 setHidden:v66];
                }

                double v19 = v71;
              }
              uint64_t v72 = [obj countByEnumeratingWithState:&v75 objects:v79 count:16];
            }
            while (v72);
          }

          *(unsigned char *)&v19->_rebuildFlags &= ~0x80u;
          double v8 = v65;
        }
      }
    }
  }
}

- (id)meshTransformForProgress:(double)a3
{
  BOOL v4 = [(UIKeyboardSplitTransitionView *)self shouldAllowRubberiness];
  if (v4)
  {
    MEMORY[0x1F4188790](v4);
    MEMORY[0x1F4188790](v5);
    int32x4_t v20 = vdupq_n_s32(0x7F7FFFFFu);
    double v8 = (a3 + -1.0) * 0.025;
    double v9 = 0.0;
    if (a3 <= 1.0) {
      double v8 = 0.0;
    }
    if (a3 < 0.0) {
      double v9 = a3 * -0.025;
    }
    *(_OWORD *)uint64_t v6 = xmmword_186B9AEA0;
    *(double *)(v6 + 16) = v9 + -0.05;
    *(_OWORD *)(v6 + 24) = xmmword_186B9AEB0;
    *(_OWORD *)(v6 + 40) = xmmword_186B9AEC0;
    *(double *)(v6 + 56) = 0.5 - v8;
    *(_OWORD *)(v6 + 64) = xmmword_186B9AEB0;
    *(_OWORD *)(v6 + 80) = xmmword_186B9AED0;
    *(double *)(v6 + 96) = 0.5 - v8;
    *(_OWORD *)(v6 + 104) = xmmword_186B9AEE0;
    *(_OWORD *)(v6 + 120) = xmmword_186B9AEF0;
    *(double *)(v6 + 136) = v9 + -0.05;
    double v10 = v8 + 0.5;
    *(_OWORD *)(v6 + 144) = xmmword_186B9AEE0;
    *(_OWORD *)(v6 + 160) = xmmword_186B9AEC0;
    *(double *)(v6 + 176) = v10;
    *(_OWORD *)(v6 + 184) = xmmword_186B9AEB0;
    double v11 = 1.05 - v9;
    *(_OWORD *)(v6 + 200) = xmmword_186B9AF00;
    *(double *)(v6 + 216) = v11;
    *(_OWORD *)(v7 - 256) = xmmword_186B9AEB0;
    *(_OWORD *)(v7 - 240) = xmmword_186B9AF10;
    *(double *)(v7 - 224) = v11;
    *(void *)(v7 - 216) = 0x3FF4000000000000;
    *(_OWORD *)(v7 - 208) = xmmword_186B943E0;
    *(void *)(v7 - 192) = 0x3FF4000000000000;
    *(double *)(v7 - 184) = v10;
    *(void *)(v7 - 128) = *(void *)(v6 + 72);
    long long v12 = *(_OWORD *)(v6 + 56);
    long long v13 = *(_OWORD *)(v6 + 40);
    *(_OWORD *)(v7 - 176) = xmmword_186B9AEE0;
    *(_OWORD *)(v7 - 160) = v13;
    *(_OWORD *)(v7 - 144) = v12;
    long long v14 = *(_OWORD *)(v6 + 160);
    long long v15 = *(_OWORD *)(v6 + 176);
    *(void *)(v7 - 88) = *(void *)(v6 + 192);
    *(_OWORD *)(v7 - 104) = v15;
    *(_OWORD *)(v7 - 120) = v14;
    long long v16 = *(_OWORD *)(v7 - 184);
    *(_OWORD *)(v7 - 80) = *(_OWORD *)(v7 - 200);
    *(_OWORD *)(v7 - 64) = v16;
    *(void *)(v7 - 48) = *(void *)(v7 - 168);
    *(void *)(v7 - 8) = *(void *)(v6 + 112);
    long long v17 = *(_OWORD *)(v6 + 80);
    *(_OWORD *)(v7 - 24) = *(_OWORD *)(v6 + 96);
    *(_OWORD *)(v7 - 40) = v17;
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F39C30], "meshTransformWithVertexCount:vertices:faceCount:faces:depthNormalization:", 12, 0x100000000, 0x300000002, *(_OWORD *)&v20, 0x500000004, 0x700000006, *(_OWORD *)&v20, 0x900000008, 0xB0000000ALL, *(_OWORD *)&v20);
  }
  else
  {
    uint64_t v18 = 0;
  }
  return v18;
}

- (void)transformForProgress:(double)a3
{
  id v5 = [(UIKeyboardSliceTransitionView *)self meshTransformForProgress:a3];
  BOOL v4 = [(UIView *)self layer];
  [v4 setMeshTransform:v5];
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardSliceTransitionView;
  -[UIView setHidden:](&v6, sel_setHidden_);
  if (v3)
  {
    id v5 = [(UIView *)self window];

    if (v5) {
      [(UIKeyboardSliceTransitionView *)self updateTransition];
    }
  }
}

- (void)_delayedUpdateTransition
{
  if ([(UIView *)self isHidden])
  {
    BOOL v3 = [(UIView *)self window];
    if (v3)
    {
      sliceSet = self->super._sliceSet;

      if (sliceSet)
      {
        if (+[UIKeyboardImpl isFloating])
        {
LABEL_12:
          self->super._isRebuilding = 0;
          return;
        }
        [MEMORY[0x1E4F39CF8] begin];
        [MEMORY[0x1E4F39CF8] setDisableActions:1];
        [(UIKeyboardSliceSet *)self->super._sliceSet startRect];
        -[UIKeyboardSliceTransitionView setFrame:](self, "setFrame:");
        id v5 = +[UIKeyboardImpl activeInstance];
        self->super._centerFilled = [v5 centerFilled];

        char rebuildFlags = (char)self->_rebuildFlags;
        if ((rebuildFlags & 2) != 0)
        {
          [(UIKeyboardSliceTransitionView *)self refreshKeyplaneImages];
          [(UIKeyboardSliceTransitionView *)self rebuildSliceTransitions];
          char rebuildFlags = (char)self->_rebuildFlags;
          if ((rebuildFlags & 0x20) == 0)
          {
LABEL_7:
            if ((rebuildFlags & 0x40) == 0) {
              goto LABEL_8;
            }
            goto LABEL_16;
          }
        }
        else if ((*(unsigned char *)&self->_rebuildFlags & 0x20) == 0)
        {
          goto LABEL_7;
        }
        [(UIKeyboardSliceTransitionView *)self rebuildShiftSlices];
        char rebuildFlags = (char)self->_rebuildFlags;
        if ((rebuildFlags & 0x40) == 0)
        {
LABEL_8:
          if ((rebuildFlags & 0x80) == 0) {
            goto LABEL_9;
          }
          goto LABEL_17;
        }
LABEL_16:
        [(UIKeyboardSliceTransitionView *)self rebuildReturnSlices];
        char rebuildFlags = (char)self->_rebuildFlags;
        if ((rebuildFlags & 0x80) == 0)
        {
LABEL_9:
          if ((rebuildFlags & 0x10) == 0)
          {
LABEL_11:
            [MEMORY[0x1E4F39CF8] commit];
            goto LABEL_12;
          }
LABEL_10:
          [(UIKeyboardSliceTransitionView *)self rebuildTopEdgeHighlightTransition];
          goto LABEL_11;
        }
LABEL_17:
        [(UIKeyboardSliceTransitionView *)self rebuildMoreIntlKeys];
        if ((*(unsigned char *)&self->_rebuildFlags & 0x10) == 0) {
          goto LABEL_11;
        }
        goto LABEL_10;
      }
    }
  }
}

- (void)updateTransition
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  [(UIKeyboardSliceTransitionView *)self performSelector:sel__delayedUpdateTransition withObject:0 afterDelay:0.25];
}

- (void)rebuildFromKeyplane:(id)a3 toKeyplane:(id)a4 startToken:(id)a5 endToken:(id)a6 keyboardType:(int64_t)a7 orientation:(int64_t)a8
{
  id v28 = a5;
  if (a7 == 1) {
    a7 = 0;
  }
  long long v13 = [a3 name];
  long long v14 = +[UIKeyboardSliceStore sliceSetIDForKeyplaneName:v13 type:a7 orientation:a8];

  if (self->super._isRebuilding) {
    goto LABEL_4;
  }
  long long v15 = [(UIKeyboardSliceSet *)self->super._sliceSet sliceSetID];
  if ([v14 isEqualToString:v15] && self->_defaultKeyplaneImage)
  {
    splitKeyplaneImage = self->_splitKeyplaneImage;

    if (splitKeyplaneImage)
    {
LABEL_4:
      *(unsigned char *)&self->_rebuildFlags |= 0xEAu;
LABEL_14:
      [(UIKeyboardSliceTransitionView *)self _delayedUpdateTransition];
      goto LABEL_15;
    }
  }
  else
  {
  }
  self->super._isRebuilding = 1;
  objc_storeStrong((id *)&self->_keyplaneToken, a5);
  self->_orientation = a8;
  sliceSet = self->super._sliceSet;
  if (sliceSet)
  {
    self->super._sliceSet = 0;
  }
  uint64_t v18 = +[UIKeyboardSliceStore sliceSetForID:v14];
  double v19 = self->super._sliceSet;
  self->super._sliceSet = v18;

  if (v18)
  {
    [(UIKeyboardSliceSet *)self->super._sliceSet startRect];
    self->super._startFrame.origin.double x = v20;
    self->super._startFrame.origin.double y = v21;
    self->super._startFrame.size.double width = v22;
    self->super._startFrame.size.double height = v23;
    [(UIKeyboardSliceSet *)self->super._sliceSet endRect];
    self->super._endFrame.origin.double x = v24;
    self->super._endFrame.origin.double y = v25;
    self->super._endFrame.size.double width = v26;
    self->super._endFrame.size.double height = v27;
    [(UIKeyboardSliceTransitionView *)self setRebuildFlags];
    goto LABEL_14;
  }
LABEL_15:
}

- (void)rebuildControlKeys:(unint64_t)a3
{
  *(unsigned char *)&self->_rebuildFlags |= (a3 & 1) << 6;
  [(UIKeyboardSliceTransitionView *)self updateTransition];
}

- (void)updateWithProgress:(double)a3
{
  id v5 = [(UIView *)self layer];
  [v5 setMeshTransform:0];

  objc_super v6 = [(UIView *)self layer];
  [v6 setSpeed:0.0];

  v7.receiver = self;
  v7.super_class = (Class)UIKeyboardSliceTransitionView;
  [(UIKeyboardSplitTransitionView *)&v7 updateWithProgress:a3];
}

- (BOOL)canDisplayTransition
{
  if (!self->super._sliceSet) {
    return 0;
  }
  if (!self->_defaultKeyplaneImage && !self->_splitKeyplaneImage) {
    [(UIKeyboardSliceTransitionView *)self refreshKeyplaneImages];
  }
  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardSliceTransitionView;
  return [(UIKeyboardSplitTransitionView *)&v4 canDisplayTransition];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyplaneToken, 0);
  objc_storeStrong((id *)&self->_topEdgeHighlight, 0);
  objc_storeStrong((id *)&self->_controlKeys, 0);
  objc_storeStrong((id *)&self->_spaceFill, 0);
  objc_storeStrong((id *)&self->_rightKeys, 0);
  objc_storeStrong((id *)&self->_leftKeys, 0);
}

@end