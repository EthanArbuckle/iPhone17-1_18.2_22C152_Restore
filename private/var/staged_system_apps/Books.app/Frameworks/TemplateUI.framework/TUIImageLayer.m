@interface TUIImageLayer
- (BOOL)crossfadesContents;
- (CALayer)contentLayer;
- (CALayer)wrapperLayer;
- (TUIImageResource)resource;
- (UIColor)fallbackColor;
- (void)configWithContentsScale:(double)a3 resource:(id)a4 load:(unint64_t)a5 cornerRadius:(double)a6 cornerCurve:(id)a7 fallbackColor:(id)a8 contentsGravity:(id)a9 crossfadesContents:(BOOL)a10 opacity:(double)a11;
- (void)dealloc;
- (void)imageResourceDidChangeImage:(id)a3;
- (void)layerDidBecomeVisible:(BOOL)a3;
- (void)setCrossfadesContents:(BOOL)a3;
- (void)updateBoundsAndContent:(BOOL)a3;
- (void)updateContentAllowCrossfade:(BOOL)a3;
@end

@implementation TUIImageLayer

- (void)updateBoundsAndContent:(BOOL)a3
{
  BOOL v3 = a3;
  p_contentSize = &self->_contentSize;
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  [(TUIImageLayer *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v12 = +[_TUIAnimationState currentState];
  id v13 = [v12 shouldCaptureCALayerAnimations];
  if (width == v9 && height == v11)
  {
    if (v3) {
      [(TUIImageLayer *)self updateContentAllowCrossfade:v13];
    }
  }
  else
  {
    p_contentSize->double width = v9;
    p_contentSize->double height = v11;
    if (v13)
    {
      double v15 = width / v9;
      double v16 = 1.0;
      if (v9 <= 0.0) {
        double v15 = 1.0;
      }
      memset(&v28.c, 0, 32);
      if (v11 > 0.0) {
        double v16 = height / v11;
      }
      *(_OWORD *)&v28.a = 0uLL;
      CGAffineTransformMakeScale(&v28, v15, v16);
      [(TUIImageLayer *)self updateContentAllowCrossfade:0];
      v17 = [v12 animationForKeyPath:@"transform"];
      CGAffineTransform m = v28;
      CATransform3DMakeAffineTransform(&v27, &m);
      v18 = +[NSValue valueWithCATransform3D:&v27];
      [v17 setFromValue:v18];

      long long v19 = *(_OWORD *)&CATransform3DIdentity.m33;
      v25[4] = *(_OWORD *)&CATransform3DIdentity.m31;
      v25[5] = v19;
      long long v20 = *(_OWORD *)&CATransform3DIdentity.m43;
      v25[6] = *(_OWORD *)&CATransform3DIdentity.m41;
      v25[7] = v20;
      long long v21 = *(_OWORD *)&CATransform3DIdentity.m13;
      v25[0] = *(_OWORD *)&CATransform3DIdentity.m11;
      v25[1] = v21;
      long long v22 = *(_OWORD *)&CATransform3DIdentity.m23;
      v25[2] = *(_OWORD *)&CATransform3DIdentity.m21;
      v25[3] = v22;
      v23 = +[NSValue valueWithCATransform3D:v25];
      [v17 setToValue:v23];

      [v17 setRemovedOnCompletion:1];
      [v17 setAdditive:1];
      v24 = [(CALayer *)self->_wrapperLayer tui_uniqueAnimationKeyWithPrefix:@"transform"];
      [(CALayer *)self->_wrapperLayer addAnimation:v17 forKey:v24];
    }
    else
    {
      -[TUIImageLayer updateContentAllowCrossfade:](self, "updateContentAllowCrossfade:");
    }
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    -[CALayer setBounds:](self->_wrapperLayer, "setBounds:", CGPointZero.x, CGPointZero.y, p_contentSize->width, p_contentSize->height);
    +[CATransaction commit];
    -[CALayer setPosition:](self->_wrapperLayer, "setPosition:", p_contentSize->width * 0.5, p_contentSize->height * 0.5);
  }
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TUIImageLayer;
  -[TUIImageLayer layerDidBecomeVisible:](&v6, "layerDidBecomeVisible:");
  char flags = (char)self->_flags;
  if (v3)
  {
    if ((*(unsigned char *)&self->_flags & 1) == 0)
    {
      [(TUIImageResource *)self->_resource addNonVolatileInterest];
      char flags = (char)self->_flags;
    }
    *(unsigned char *)&self->_char flags = flags | 1;
    [(TUIImageLayer *)self updateContentAllowCrossfade:0];
  }
  else
  {
    if (*(unsigned char *)&self->_flags)
    {
      [(TUIImageResource *)self->_resource removeNonVolatileInterest];
      char flags = (char)self->_flags;
    }
    *(unsigned char *)&self->_char flags = flags & 0xFE;
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    [(CALayer *)self->_contentLayer setContents:0];
    [(TUIImageLayer *)self setBackgroundColor:[(UIColor *)self->_fallbackColor CGColor]];
    +[CATransaction commit];
  }
}

- (void)configWithContentsScale:(double)a3 resource:(id)a4 load:(unint64_t)a5 cornerRadius:(double)a6 cornerCurve:(id)a7 fallbackColor:(id)a8 contentsGravity:(id)a9 crossfadesContents:(BOOL)a10 opacity:(double)a11
{
  BOOL v33 = a10;
  long long v19 = (TUIImageResource *)a4;
  id v36 = a7;
  id v35 = a8;
  id v20 = a9;
  if (!self->_contentLayer)
  {
    long long v21 = +[_TUIImplicitAnimationLayer layer];
    wrapperLayer = self->_wrapperLayer;
    self->_wrapperLayer = v21;

    v38 = self->_wrapperLayer;
    v23 = +[NSArray arrayWithObjects:&v38 count:1];
    [(TUIImageLayer *)self setSublayers:v23];

    v24 = +[_TUIImplicitAnimationLayer layer];
    contentLayer = self->_contentLayer;
    self->_contentLayer = v24;

    v37 = self->_contentLayer;
    v26 = +[NSArray arrayWithObjects:&v37 count:1];
    [(CALayer *)self->_wrapperLayer setSublayers:v26];
  }
  objc_storeStrong((id *)&self->_fallbackColor, a8);
  [(CALayer *)self->_contentLayer setCornerRadius:a6];
  [(CALayer *)self->_contentLayer setCornerCurve:v36];
  if (a6 <= 0.0) {
    uint64_t v27 = [v20 isEqualToString:kCAGravityResize] ^ 1;
  }
  else {
    uint64_t v27 = 1;
  }
  [(CALayer *)self->_contentLayer setMasksToBounds:v27];
  [(CALayer *)self->_contentLayer setContentsGravity:v20];
  [(TUIImageLayer *)self setRasterizationScale:a3];
  [(TUIImageLayer *)self setContentsScale:a3];
  *(float *)&double v28 = a11;
  [(TUIImageLayer *)self setOpacity:v28];
  [(TUIImageLayer *)self setBackgroundColor:[(UIColor *)self->_fallbackColor CGColor]];
  [(TUIImageLayer *)self setCornerRadius:a6];
  p_resource = &self->_resource;
  resource = self->_resource;
  if (resource != v19)
  {
    v31 = resource;
    objc_storeStrong((id *)&self->_resource, a4);
    [(TUIImageResource *)*p_resource addObserver:self];
    [(TUIImageResource *)*p_resource addInterest];
    if (*(unsigned char *)&self->_flags)
    {
      [(TUIImageResource *)*p_resource addNonVolatileInterest];
      if (*(unsigned char *)&self->_flags) {
        [(TUIImageResource *)v31 removeNonVolatileInterest];
      }
    }
    [(TUIImageResource *)v31 removeInterest];
    [(TUIImageResource *)v31 removeObserver:self];
  }
  [(TUIImageLayer *)self updateBoundsAndContent:resource != v19];
  if (a5 == 1) {
    id v32 = [(TUIImageResource *)*p_resource loadImage];
  }
  [(TUIImageLayer *)self setCrossfadesContents:v33];
}

- (void)dealloc
{
  if (*(unsigned char *)&self->_flags) {
    [(TUIImageResource *)self->_resource removeNonVolatileInterest];
  }
  [(TUIImageResource *)self->_resource removeInterest];
  [(TUIImageResource *)self->_resource removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)TUIImageLayer;
  [(TUIImageLayer *)&v3 dealloc];
}

- (void)updateContentAllowCrossfade:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(TUIImageResource *)self->_resource imageContentWithOptions:1];
  id v43 = v5;
  if (v5)
  {
    [v5 insets];
    double v42 = v6;
    double v8 = v7;
    double v10 = v9;
    double v41 = v11;
    [v43 intrinsicSize];
    double v13 = v12;
    double v39 = v8;
    double v40 = v8 + v10;
    double v15 = v14 - (v8 + v10);
    CGFloat y = CGPointZero.y;
    double width = self->_contentSize.width;
    double height = self->_contentSize.height;
    double v19 = 1.0;
    double v20 = 1.0;
    if (v15 > 0.0)
    {
      v45.origin.x = CGPointZero.x;
      v45.origin.CGFloat y = CGPointZero.y;
      v45.size.double width = self->_contentSize.width;
      v45.size.double height = self->_contentSize.height;
      double v20 = CGRectGetWidth(v45) / v15;
    }
    double v21 = v13 - (v42 + v41);
    if (v21 > 0.0)
    {
      v46.origin.x = CGPointZero.x;
      v46.origin.CGFloat y = y;
      v46.size.double width = width;
      v46.size.double height = height;
      double v19 = CGRectGetHeight(v46) / v21;
    }
    long long v22 = [v43 image];
    v23 = [v22 layerContents];
    double v24 = width + v40 * v20;
    double v25 = height + (v42 + v41) * v19;

    double v26 = 0.5;
    double v27 = 0.5;
    if (v24 > 0.0) {
      double v27 = v39 * v20 / v24;
    }
    if (v25 > 0.0) {
      double v26 = v42 * v19 / v25;
    }
    double v28 = CGPointZero.y;
    v29 = [(CALayer *)self->_contentLayer contents];
    if (v3)
    {
      unsigned int v30 = [(TUIImageLayer *)self crossfadesContents];
      unsigned int v31 = v29 ? v30 : 0;
      if (v31 == 1 && v23 && v29 != v23)
      {
        +[CATransaction begin];
        +[CATransaction setDisableActions:1];
        id v32 = self->_contentLayer;
        [(CALayer *)self->_contentLayer removeFromSuperlayer];
        BOOL v33 = +[_TUIImplicitAnimationLayer layer];
        contentLayer = self->_contentLayer;
        self->_contentLayer = v33;

        [(CALayer *)v32 cornerRadius];
        -[CALayer setCornerRadius:](self->_contentLayer, "setCornerRadius:");
        id v35 = [(CALayer *)v32 cornerCurve];
        [(CALayer *)self->_contentLayer setCornerCurve:v35];

        [(CALayer *)self->_contentLayer setMasksToBounds:[(CALayer *)v32 masksToBounds]];
        id v36 = [(CALayer *)v32 contentsGravity];
        [(CALayer *)self->_contentLayer setContentsGravity:v36];

        [(CALayer *)self->_contentLayer setMasksToBounds:[(CALayer *)v32 masksToBounds]];
        [(CALayer *)self->_wrapperLayer addSublayer:self->_contentLayer];
        v37 = +[CATransition animation];
        [v37 setDuration:0.15];
        v38 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [v37 setTimingFunction:v38];

        [v37 setRemovedOnCompletion:1];
        [(CALayer *)self->_wrapperLayer addAnimation:v37 forKey:@"crossfade"];
        +[CATransaction commit];
      }
    }
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    [(TUIImageLayer *)self setBackgroundColor:0];
    -[CALayer setAnchorPoint:](self->_contentLayer, "setAnchorPoint:", v27, v26);
    [(CALayer *)self->_contentLayer setContents:v23];
    -[CALayer setBounds:](self->_contentLayer, "setBounds:", CGPointZero.x, v28, v24, v25);
    +[CATransaction commit];
  }
  else
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    [(CALayer *)self->_contentLayer setContents:0];
    -[CALayer setBounds:](self->_contentLayer, "setBounds:", CGPointZero.x, CGPointZero.y, self->_contentSize.width, self->_contentSize.height);
    -[CALayer setAnchorPoint:](self->_contentLayer, "setAnchorPoint:", 0.5, 0.5);
    [(TUIImageLayer *)self setBackgroundColor:[(UIColor *)self->_fallbackColor CGColor]];
    +[CATransaction commit];
  }
}

- (void)imageResourceDidChangeImage:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_178E10;
  v5[3] = &unk_253310;
  id v6 = a3;
  double v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (TUIImageResource)resource
{
  return self->_resource;
}

- (CALayer)wrapperLayer
{
  return self->_wrapperLayer;
}

- (CALayer)contentLayer
{
  return self->_contentLayer;
}

- (UIColor)fallbackColor
{
  return self->_fallbackColor;
}

- (BOOL)crossfadesContents
{
  return *((unsigned char *)&self->_flags + 1);
}

- (void)setCrossfadesContents:(BOOL)a3
{
  *((unsigned char *)&self->_flags + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackColor, 0);
  objc_storeStrong((id *)&self->_contentLayer, 0);
  objc_storeStrong((id *)&self->_wrapperLayer, 0);

  objc_storeStrong((id *)&self->_resource, 0);
}

@end