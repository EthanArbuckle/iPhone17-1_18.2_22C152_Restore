@interface THTOCSplitTransitionView
- (BOOL)isReverse;
- (BOOL)keepScaleAnimationView;
- (BOOL)keepSplitAnimationView;
- (BOOL)wasReversed;
- (CATransform3D)_scaleInstanceTransformForOpen:(SEL)a3;
- (CATransform3D)_splitInstanceTransformForOpen:(SEL)a3;
- (CGPoint)_shadowLayerPositionForOpen:(BOOL)a3 top:(BOOL)a4;
- (CGPoint)_splitReplicatorLayerPositionForOpen:(BOOL)a3;
- (UIView)scaleAnimationView;
- (UIView)splitAnimationView;
- (double)_scaleInstanceAlphaOffsetForOpen:(BOOL)a3;
- (double)animationDelay;
- (double)animationDuration;
- (double)scale;
- (double)slideAnimationDuration;
- (double)slideAnimationScalar;
- (double)splitPositionY;
- (void)_adjustScaleReplicatorLayers:(CGRect)a3;
- (void)_adjustSplitReplicatorLayers:(CGRect)a3;
- (void)_animate;
- (void)_animateInteractive;
- (void)_animationDidStop;
- (void)_setupAnimation;
- (void)_setupLayers;
- (void)_setupQuickAnimationToLayer:(id)a3 withKeyPath:(id)a4 toValue:(id)a5;
- (void)_setupScaleAnimationLayers;
- (void)_setupSplitAnimationLayers;
- (void)beginInteractiveTransition;
- (void)beginTransition;
- (void)dealloc;
- (void)finishInteractiveTransition;
- (void)reverseInteractiveTransition;
- (void)setAnimationDelay:(double)a3;
- (void)setAnimationDuration:(double)a3;
- (void)setKeepScaleAnimationView:(BOOL)a3;
- (void)setKeepSplitAnimationView:(BOOL)a3;
- (void)setReverse:(BOOL)a3;
- (void)setScale:(double)a3;
- (void)setScaleAnimationView:(id)a3;
- (void)setSplitAnimationView:(id)a3;
- (void)setSplitPositionY:(double)a3;
@end

@implementation THTOCSplitTransitionView

- (void)dealloc
{
  self->_splitAnimationView = 0;
  self->_scaleAnimationView = 0;
  v3.receiver = self;
  v3.super_class = (Class)THTOCSplitTransitionView;
  [(THTransitionView *)&v3 dealloc];
}

- (double)slideAnimationScalar
{
  return 0.75;
}

- (double)slideAnimationDuration
{
  double animationDuration = self->_animationDuration;
  [(THTOCSplitTransitionView *)self slideAnimationScalar];
  return animationDuration * v3;
}

- (CGPoint)_splitReplicatorLayerPositionForOpen:(BOOL)a3
{
  double x = self->_splitLayerOriginalPosition.x;
  double y = self->_splitLayerOriginalPosition.y;
  if (self->_isInteractive)
  {
    double splitPositionY = self->_splitPositionY;
    double scale = self->_scale;
    double v7 = splitPositionY - splitPositionY * scale;
    double v8 = splitPositionY * scale;
    if (a3) {
      double v8 = v7;
    }
    goto LABEL_7;
  }
  if (a3)
  {
    double v8 = self->_splitPositionY;
LABEL_7:
    double y = y - v8;
  }
  result.double y = y;
  result.double x = x;
  return result;
}

- (CATransform3D)_splitInstanceTransformForOpen:(SEL)a3
{
  BOOL v4 = a4;
  [(CAReplicatorLayer *)self->_splitReplicatorLayer bounds];
  if (self->_isInteractive)
  {
    double scale = self->_scale;
    if (v4) {
      double v9 = v7 - v7 * scale;
    }
    else {
      double v9 = v7 * scale;
    }
  }
  else if (v4)
  {
    double v9 = v7;
  }
  else
  {
    double v9 = 0.0001;
  }

  return CATransform3DMakeTranslation(retstr, 0.0, v9, 0.0);
}

- (CGPoint)_shadowLayerPositionForOpen:(BOOL)a3 top:(BOOL)a4
{
  BOOL v4 = a3;
  CGFloat x = self->_splitLayerOriginalPosition.x;
  double y = self->_splitLayerOriginalPosition.y;
  if (a4)
  {
    [(CALayer *)self->_topShadowLayer bounds];
    if (self->_isInteractive)
    {
      double scale = self->_scale;
      if (v4) {
        double scale = 1.0 - scale;
      }
      double v10 = v8 * scale;
    }
    else
    {
      double v10 = 0.0;
      if (v4) {
        double v10 = v8;
      }
    }
    double v15 = y - v10;
  }
  else
  {
    double v11 = y + self->_splitPositionY;
    [(CALayer *)self->_bottomShadowLayer bounds];
    if (self->_isInteractive)
    {
      double v13 = self->_scale;
      if (v4) {
        double v13 = 1.0 - v13;
      }
      double v14 = v12 * v13;
    }
    else
    {
      double v14 = -0.0;
      if (v4) {
        double v14 = v12;
      }
    }
    double v15 = v11 + v14;
  }
  double v16 = x;
  result.double y = v15;
  result.CGFloat x = v16;
  return result;
}

- (void)_setupSplitAnimationLayers
{
  [(CALayer *)[(UIView *)self->_splitAnimationView layer] bounds];
  uint64_t v7 = v3;
  CGFloat v8 = v4;
  uint64_t v9 = v5;
  uint64_t v10 = v6;
  CGFloat splitPositionY = self->_splitPositionY;
  if (splitPositionY >= 0.0 && splitPositionY <= 0.0)
  {
    CGFloat splitPositionY = CGRectGetMidY(*(CGRect *)&v3);
    self->_CGFloat splitPositionY = splitPositionY;
  }
  CGSize size = CGRectNull.size;
  slice.origin = CGRectNull.origin;
  slice.CGSize size = size;
  remainder.origin = slice.origin;
  remainder.CGSize size = size;
  uint64_t v13 = v7;
  size.width = v8;
  uint64_t v14 = v9;
  uint64_t v15 = v10;
  CGRectDivide(*(CGRect *)((char *)&size - 8), &slice, &remainder, splitPositionY, CGRectMinYEdge);
  double v16 = +[CALayer layer];
  self->_bottomShadowLayer = v16;
  [(CALayer *)v16 setName:@"_bottomShadowLayer"];
  double y = CGPointZero.y;
  -[CALayer setAnchorPoint:](self->_bottomShadowLayer, "setAnchorPoint:", CGPointZero.x, y);
  -[CALayer setFrame:](self->_bottomShadowLayer, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
  [(CALayer *)self->_bottomShadowLayer setOpaque:0];
  [(CALayer *)self->_bottomShadowLayer bounds];
  [(CALayer *)self->_bottomShadowLayer setShadowPath:[+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:") CGPath]];
  -[CALayer setShadowOffset:](self->_bottomShadowLayer, "setShadowOffset:", 0.0, -5.0);
  [(CALayer *)self->_bottomShadowLayer setShadowRadius:15.0];
  LODWORD(v18) = 0.5;
  [(CALayer *)self->_bottomShadowLayer setShadowOpacity:v18];
  [self->_layer addSublayer:self->_bottomShadowLayer];
  v19 = +[CALayer layer];
  self->_topShadowLayer = v19;
  [(CALayer *)v19 setName:@"_topShadowLayer"];
  -[CALayer setAnchorPoint:](self->_topShadowLayer, "setAnchorPoint:", CGPointZero.x, y);
  -[CALayer setFrame:](self->_topShadowLayer, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  [(CALayer *)self->_topShadowLayer setOpaque:0];
  [(CALayer *)self->_topShadowLayer bounds];
  [(CALayer *)self->_topShadowLayer setShadowPath:[+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:") CGPath]];
  -[CALayer setShadowOffset:](self->_topShadowLayer, "setShadowOffset:", 0.0, 5.0);
  [(CALayer *)self->_topShadowLayer setShadowRadius:15.0];
  LODWORD(v20) = 0.5;
  [(CALayer *)self->_topShadowLayer setShadowOpacity:v20];
  [self->_layer addSublayer:self->_topShadowLayer];
  id v21 = [(THTOCSplitTransitionView *)self layer];
  [(CALayer *)[(UIView *)self->_splitAnimationView layer] bounds];
  [v21 convertPoint:v22 fromLayer:[self->_splitAnimationView layer]];
  self->_splitLayerOriginalPosition.CGFloat x = v24;
  self->_splitLayerOriginalPosition.double y = v25;
  v26 = (CAReplicatorLayer *)+[CAReplicatorLayer layer];
  self->_splitReplicatorLayer = v26;
  [(CAReplicatorLayer *)v26 setName:@"_splitReplicatorLayer"];
  [(CAReplicatorLayer *)self->_splitReplicatorLayer setInstanceCount:2];
  [(CAReplicatorLayer *)self->_splitReplicatorLayer setInstanceDelay:self->_animationDuration + 100.0];
  -[CAReplicatorLayer setAnchorPoint:](self->_splitReplicatorLayer, "setAnchorPoint:", CGPointZero.x, y);
  [(CALayer *)[(UIView *)self->_splitAnimationView layer] bounds];
  -[CAReplicatorLayer setBounds:](self->_splitReplicatorLayer, "setBounds:");
  [(THTOCSplitTransitionView *)self _splitReplicatorLayerPositionForOpen:self->_isReverse];
  -[CAReplicatorLayer setPosition:](self->_splitReplicatorLayer, "setPosition:");
  [(CAReplicatorLayer *)self->_splitReplicatorLayer setPreservesDepth:1];
  [(THTOCSplitTransitionView *)self _splitInstanceTransformForOpen:self->_isReverse];
  splitReplicatorLayer = self->_splitReplicatorLayer;
  v34[4] = v34[12];
  v34[5] = v34[13];
  v34[6] = v34[14];
  v34[7] = v34[15];
  v34[0] = v34[8];
  v34[1] = v34[9];
  v34[2] = v34[10];
  v34[3] = v34[11];
  [(CAReplicatorLayer *)splitReplicatorLayer setInstanceTransform:v34];
  v28 = +[CALayer layer];
  self->_hostLayer = v28;
  [(CALayer *)v28 setName:@"_hostLayer"];
  [(CAReplicatorLayer *)self->_splitReplicatorLayer bounds];
  -[CALayer setFrame:](self->_hostLayer, "setFrame:");
  v29 = +[CALayer layer];
  self->_shadowedLayer = v29;
  [(CALayer *)v29 setName:@"_shadowedLayer"];
  -[CALayer setAnchorPoint:](self->_shadowedLayer, "setAnchorPoint:", CGPointZero.x, y);
  -[CALayer setFrame:](self->_shadowedLayer, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
  [(CALayer *)self->_shadowedLayer setOpaque:0];
  v30 = +[CALayer layer];
  self->_maskLayer = v30;
  [(CALayer *)v30 setName:@"_maskLayer"];
  -[CALayer setAnchorPoint:](self->_maskLayer, "setAnchorPoint:", CGPointZero.x, y);
  [(CALayer *)self->_shadowedLayer bounds];
  -[CALayer setFrame:](self->_maskLayer, "setFrame:");
  CATransform3DMakeTranslation(&v33, 0.0, -self->_splitPositionY, 0.0);
  maskLayer = self->_maskLayer;
  CATransform3D v32 = v33;
  [(CALayer *)maskLayer setSublayerTransform:&v32];
  [(CALayer *)self->_maskLayer setOpaque:1];
  [(CALayer *)self->_maskLayer setMasksToBounds:1];
  [(CALayer *)self->_maskLayer addSublayer:[(UIView *)self->_splitAnimationView layer]];
  [(CALayer *)self->_shadowedLayer addSublayer:self->_maskLayer];
  [(CALayer *)self->_hostLayer addSublayer:self->_shadowedLayer];
  [(CAReplicatorLayer *)self->_splitReplicatorLayer addSublayer:self->_hostLayer];
  [self->_layer addSublayer:self->_splitReplicatorLayer];
}

- (void)_adjustSplitReplicatorLayers:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(THTOCSplitTransitionView *)self _setupQuickAnimationToLayer:self->_shadowedLayer withKeyPath:@"position" toValue:+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", CGPointZero.x, CGPointZero.y)];
  [(THTOCSplitTransitionView *)self _setupQuickAnimationToLayer:self->_shadowedLayer withKeyPath:@"bounds" toValue:+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", x, y, width, height)];
  [(THTOCSplitTransitionView *)self _setupQuickAnimationToLayer:self->_maskLayer withKeyPath:@"bounds" toValue:+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", x, y, width, height)];
  maskLayer = self->_maskLayer;
  long long v9 = *(_OWORD *)&CATransform3DIdentity.m33;
  v13[4] = *(_OWORD *)&CATransform3DIdentity.m31;
  v13[5] = v9;
  long long v10 = *(_OWORD *)&CATransform3DIdentity.m43;
  v13[6] = *(_OWORD *)&CATransform3DIdentity.m41;
  v13[7] = v10;
  long long v11 = *(_OWORD *)&CATransform3DIdentity.m13;
  v13[0] = *(_OWORD *)&CATransform3DIdentity.m11;
  v13[1] = v11;
  long long v12 = *(_OWORD *)&CATransform3DIdentity.m23;
  v13[2] = *(_OWORD *)&CATransform3DIdentity.m21;
  v13[3] = v12;
  [(THTOCSplitTransitionView *)self _setupQuickAnimationToLayer:maskLayer withKeyPath:@"sublayerTransform" toValue:+[NSValue valueWithCATransform3D:v13]];
}

- (CATransform3D)_scaleInstanceTransformForOpen:(SEL)a3
{
  if (self->_isInteractive)
  {
    if (a4)
    {
      double v4 = 0.999899983;
      double v5 = -0.0598999858;
    }
    else
    {
      double v4 = 0.939999998;
      double v5 = 0.0598999858;
    }
    double v6 = v4 + self->_scale * v5;
  }
  else
  {
    double v6 = 0.939999998;
    if (a4) {
      double v6 = 0.999899983;
    }
  }
  return CATransform3DMakeScale(retstr, v6, v6, 1.0);
}

- (double)_scaleInstanceAlphaOffsetForOpen:(BOOL)a3
{
  TSUClamp();
  return result;
}

- (void)_setupScaleAnimationLayers
{
  [(THTOCSplitTransitionView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  long long v11 = +[CALayer layer];
  self->_blackBackgroundLayer = v11;
  [(CALayer *)v11 setName:@"_blackBackgroundLayer"];
  -[CALayer setFrame:](self->_blackBackgroundLayer, "setFrame:", v4, v6, v8, v10);
  [(CALayer *)self->_blackBackgroundLayer setBackgroundColor:[+[UIColor blackColor] CGColor]];
  [(CALayer *)self->_blackBackgroundLayer setOpaque:1];
  [self->_layer insertSublayer:self->_blackBackgroundLayer below:self->_bottomShadowLayer];
  long long v12 = (CAReplicatorLayer *)+[CAReplicatorLayer layer];
  self->_scaleReplicatorLayer = v12;
  [(CAReplicatorLayer *)v12 setName:@"_scaleReplicatorLayer"];
  -[CAReplicatorLayer setFrame:](self->_scaleReplicatorLayer, "setFrame:", v4, v6, v8, v10);
  [(CAReplicatorLayer *)self->_scaleReplicatorLayer setInstanceCount:2];
  [(CAReplicatorLayer *)self->_scaleReplicatorLayer setInstanceDelay:self->_animationDuration + 100.0];
  [(CAReplicatorLayer *)self->_scaleReplicatorLayer setPreservesDepth:1];
  [(THTOCSplitTransitionView *)self _scaleInstanceTransformForOpen:self->_isReverse];
  scaleReplicatorLayer = self->_scaleReplicatorLayer;
  v15[4] = v15[12];
  v15[5] = v15[13];
  v15[6] = v15[14];
  v15[7] = v15[15];
  v15[0] = v15[8];
  v15[1] = v15[9];
  v15[2] = v15[10];
  v15[3] = v15[11];
  [(CAReplicatorLayer *)scaleReplicatorLayer setInstanceTransform:v15];
  [(THTOCSplitTransitionView *)self _scaleInstanceAlphaOffsetForOpen:self->_isReverse];
  *(float *)&double v14 = v14;
  [(CAReplicatorLayer *)self->_scaleReplicatorLayer setInstanceAlphaOffset:v14];
  [(CAReplicatorLayer *)self->_scaleReplicatorLayer addSublayer:[(UIView *)self->_scaleAnimationView layer]];
  [(CALayer *)self->_blackBackgroundLayer addSublayer:self->_scaleReplicatorLayer];
}

- (void)_adjustScaleReplicatorLayers:(CGRect)a3
{
  double v4 = [(UIView *)self->_scaleAnimationView layer];
  double v5 = +[NSNumber numberWithFloat:0.0];

  [(THTOCSplitTransitionView *)self _setupQuickAnimationToLayer:v4 withKeyPath:@"opacity" toValue:v5];
}

- (void)_setupLayers
{
  +[CATransaction setDisableActions:1];
  if (!self->_keepSplitAnimationView)
  {

    self->_splitAnimationView = 0;
  }
  if (!self->_keepScaleAnimationView)
  {

    self->_scaleAnimationView = 0;
  }
  if (!self->_splitAnimationView)
  {
    if (self->_isReverse) {
      double v3 = &OBJC_IVAR___THTransitionView__toViewController;
    }
    else {
      double v3 = &OBJC_IVAR___THTransitionView__fromViewController;
    }
    self->_splitAnimationView = (UIView *)objc_msgSend(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v3), "view"), "snapshotViewAfterScreenUpdates:", 1);
  }
  if (!self->_scaleAnimationView)
  {
    if (self->_isReverse) {
      double v4 = &OBJC_IVAR___THTransitionView__fromViewController;
    }
    else {
      double v4 = &OBJC_IVAR___THTransitionView__toViewController;
    }
    self->_scaleAnimationView = (UIView *)objc_msgSend(objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v4), "view"), "snapshotViewAfterScreenUpdates:", 1);
  }
  [(THTOCSplitTransitionView *)self _setupSplitAnimationLayers];
  [(THTOCSplitTransitionView *)self _setupScaleAnimationLayers];
  [(THTOCSplitTransitionView *)self frame];
  double Width = CGRectGetWidth(v8);
  double splitPositionY = self->_splitPositionY;
  -[THTOCSplitTransitionView _adjustSplitReplicatorLayers:](self, "_adjustSplitReplicatorLayers:", 0.0, 0.0, Width, splitPositionY);
  -[THTOCSplitTransitionView _adjustScaleReplicatorLayers:](self, "_adjustScaleReplicatorLayers:", 0.0, 0.0, Width, splitPositionY);

  +[CATransaction setDisableActions:0];
}

- (void)_animate
{
  [(THTransitionViewDelegate *)[(THTransitionView *)self delegate] transitionWillFinish:self];
  +[CATransaction begin];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10ED50;
  v9[3] = &unk_456DE0;
  v9[4] = self;
  +[CATransaction setCompletionBlock:v9];
  [(THTOCSplitTransitionView *)self slideAnimationDuration];
  +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:");
  if (self->_isFinishingInteractive) {
    double v3 = &kCAMediaTimingFunctionLinear;
  }
  else {
    double v3 = &kCAMediaTimingFunctionEaseIn;
  }
  +[CATransaction setAnimationTimingFunction:](CATransaction, "setAnimationTimingFunction:", +[CAMediaTimingFunction functionWithName:*v3]);
  [(THTOCSplitTransitionView *)self _splitReplicatorLayerPositionForOpen:!self->_isReverse];
  -[CAReplicatorLayer setPosition:](self->_splitReplicatorLayer, "setPosition:");
  [(THTOCSplitTransitionView *)self _splitInstanceTransformForOpen:!self->_isReverse];
  splitReplicatorLayer = self->_splitReplicatorLayer;
  *(_OWORD *)&v8[8] = *(_OWORD *)&v8[25];
  *(_OWORD *)&v8[10] = *(_OWORD *)&v8[27];
  *(_OWORD *)&v8[12] = *(_OWORD *)&v8[29];
  *(_OWORD *)&v8[14] = *(_OWORD *)&v8[31];
  *(_OWORD *)CGRect v8 = *(_OWORD *)&v8[17];
  *(_OWORD *)&v8[2] = *(_OWORD *)&v8[19];
  *(_OWORD *)&v8[4] = *(_OWORD *)&v8[21];
  *(_OWORD *)&v8[6] = *(_OWORD *)&v8[23];
  [(CAReplicatorLayer *)splitReplicatorLayer setInstanceTransform:v8];
  [(THTOCSplitTransitionView *)self _shadowLayerPositionForOpen:!self->_isReverse top:1];
  -[CALayer setPosition:](self->_topShadowLayer, "setPosition:");
  [(CALayer *)self->_topShadowLayer setOpacity:0.0];
  [(THTOCSplitTransitionView *)self _shadowLayerPositionForOpen:!self->_isReverse top:0];
  -[CALayer setPosition:](self->_bottomShadowLayer, "setPosition:");
  [(CALayer *)self->_bottomShadowLayer setOpacity:0.0];
  +[CATransaction setAnimationDuration:self->_animationDuration];
  +[CATransaction setAnimationTimingFunction:](CATransaction, "setAnimationTimingFunction:", +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]);
  [(THTOCSplitTransitionView *)self _scaleInstanceTransformForOpen:!self->_isReverse];
  scaleReplicatorLayer = self->_scaleReplicatorLayer;
  v7[4] = v7[12];
  v7[5] = v7[13];
  v7[6] = v7[14];
  v7[7] = v7[15];
  v7[0] = v7[8];
  v7[1] = v7[9];
  v7[2] = v7[10];
  v7[3] = v7[11];
  [(CAReplicatorLayer *)scaleReplicatorLayer setInstanceTransform:v7];
  [(THTOCSplitTransitionView *)self _scaleInstanceAlphaOffsetForOpen:!self->_isReverse];
  *(float *)&double v6 = v6;
  [(CAReplicatorLayer *)self->_scaleReplicatorLayer setInstanceAlphaOffset:v6];
  +[CATransaction commit];
}

- (void)_animateInteractive
{
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  [(THTOCSplitTransitionView *)self _splitReplicatorLayerPositionForOpen:!self->_isReverse];
  -[CAReplicatorLayer setPosition:](self->_splitReplicatorLayer, "setPosition:");
  [(THTOCSplitTransitionView *)self _splitInstanceTransformForOpen:!self->_isReverse];
  splitReplicatorLayer = self->_splitReplicatorLayer;
  v7[4] = v7[12];
  v7[5] = v7[13];
  v7[6] = v7[14];
  v7[7] = v7[15];
  v7[0] = v7[8];
  v7[1] = v7[9];
  v7[2] = v7[10];
  v7[3] = v7[11];
  [(CAReplicatorLayer *)splitReplicatorLayer setInstanceTransform:v7];
  [(THTOCSplitTransitionView *)self _shadowLayerPositionForOpen:!self->_isReverse top:1];
  -[CALayer setPosition:](self->_topShadowLayer, "setPosition:");
  [(THTOCSplitTransitionView *)self _shadowLayerPositionForOpen:!self->_isReverse top:0];
  -[CALayer setPosition:](self->_bottomShadowLayer, "setPosition:");
  [(THTOCSplitTransitionView *)self _scaleInstanceTransformForOpen:!self->_isReverse];
  scaleReplicatorLayer = self->_scaleReplicatorLayer;
  v6[4] = v6[12];
  v6[5] = v6[13];
  v6[6] = v6[14];
  v6[7] = v6[15];
  v6[0] = v6[8];
  v6[1] = v6[9];
  v6[2] = v6[10];
  v6[3] = v6[11];
  [(CAReplicatorLayer *)scaleReplicatorLayer setInstanceTransform:v6];
  [(THTOCSplitTransitionView *)self _scaleInstanceAlphaOffsetForOpen:!self->_isReverse];
  *(float *)&double v5 = v5;
  [(CAReplicatorLayer *)self->_scaleReplicatorLayer setInstanceAlphaOffset:v5];
  +[CATransaction commit];
}

- (void)_setupAnimation
{
  if (self->_isInteractive)
  {
    v2 = "_animateInteractive";
    animationDeladouble y = 0.0;
  }
  else
  {
    v2 = "_animate";
    animationDeladouble y = self->_animationDelay;
  }
  [(THTOCSplitTransitionView *)self performSelector:v2 withObject:0 afterDelay:animationDelay];
}

- (void)beginTransition
{
  [(THTOCSplitTransitionView *)self _setupLayers];
  [(THTOCSplitTransitionView *)self _setupAnimation];
  v3.receiver = self;
  v3.super_class = (Class)THTOCSplitTransitionView;
  [(THTransitionView *)&v3 beginTransition];
}

- (void)beginInteractiveTransition
{
  self->_isInteractive = 1;
  self->_double scale = 0.0;
  [(THTOCSplitTransitionView *)self beginTransition];
}

- (void)finishInteractiveTransition
{
  self->_isInteractive = 0;
  self->_isFinishingInteractive = 1;
  [(THTOCSplitTransitionView *)self _setupAnimation];
}

- (void)reverseInteractiveTransition
{
  self->_wasReversed = 1;
  self->_isReverse ^= 1u;
  [(THTOCSplitTransitionView *)self finishInteractiveTransition];
}

- (void)_animationDidStop
{
  self->_splitAnimationView = 0;
  self->_scaleAnimationView = 0;
}

- (void)_setupQuickAnimationToLayer:(id)a3 withKeyPath:(id)a4 toValue:(id)a5
{
  CGRect v8 = +[CABasicAnimation animationWithKeyPath:a4];
  [(CABasicAnimation *)v8 setDuration:0.00100000005];
  [(CABasicAnimation *)v8 setBeginTime:0.0];
  [(CABasicAnimation *)v8 setBeginTimeMode:kCAAnimationRelative];
  [(CABasicAnimation *)v8 setFillMode:kCAFillModeBoth];
  [(CABasicAnimation *)v8 setRemovedOnCompletion:0];
  [(CABasicAnimation *)v8 setToValue:a5];

  [a3 addAnimation:v8 forKey:a4];
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_double scale = a3;
  [(THTOCSplitTransitionView *)self _animateInteractive];
}

- (double)splitPositionY
{
  return self->_splitPositionY;
}

- (void)setSplitPositionY:(double)a3
{
  self->_double splitPositionY = a3;
}

- (double)animationDelay
{
  return self->_animationDelay;
}

- (void)setAnimationDelay:(double)a3
{
  self->_animationDeladouble y = a3;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_double animationDuration = a3;
}

- (BOOL)isReverse
{
  return self->_isReverse;
}

- (void)setReverse:(BOOL)a3
{
  self->_isReverse = a3;
}

- (BOOL)wasReversed
{
  return self->_wasReversed;
}

- (UIView)splitAnimationView
{
  return self->_splitAnimationView;
}

- (void)setSplitAnimationView:(id)a3
{
}

- (UIView)scaleAnimationView
{
  return self->_scaleAnimationView;
}

- (void)setScaleAnimationView:(id)a3
{
}

- (BOOL)keepScaleAnimationView
{
  return self->_keepScaleAnimationView;
}

- (void)setKeepScaleAnimationView:(BOOL)a3
{
  self->_keepScaleAnimationView = a3;
}

- (BOOL)keepSplitAnimationView
{
  return self->_keepSplitAnimationView;
}

- (void)setKeepSplitAnimationView:(BOOL)a3
{
  self->_keepSplitAnimationView = a3;
}

@end