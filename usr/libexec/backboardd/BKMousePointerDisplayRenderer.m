@interface BKMousePointerDisplayRenderer
+ (BKMousePointerDisplayRendererRootLayerProperties)rootLayerPropertiesForDisplay:(SEL)a3 displayController:(id)a4;
- (BKMousePointerDisplayRenderer)initWithDisplayName:(id)a3;
- (BKMousePointerDisplayRendererRootLayerProperties)rootLayerProperties;
- (BKMousePointerDisplayRendererTransformLayerProperties)transformLayerProperties;
- (CALayer)pointerLayer;
- (CGPoint)pointerPosition;
- (void)_updateTransformLayerPosition;
- (void)invalidate;
- (void)setPointerLayer:(id)a3;
- (void)setPointerPosition:(CGPoint)a3;
- (void)setRootLayerProperties:(BKMousePointerDisplayRendererRootLayerProperties *)a3;
- (void)setTransformLayerProperties:(BKMousePointerDisplayRendererTransformLayerProperties *)a3;
@end

@implementation BKMousePointerDisplayRenderer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerLayer, 0);
  objc_storeStrong((id *)&self->_transformLayer, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (BKMousePointerDisplayRendererTransformLayerProperties)transformLayerProperties
{
  CGPoint v3 = *(CGPoint *)&self[1].affineTransform.tx;
  *(_OWORD *)&retstr->affineTransform.tx = *(_OWORD *)&self[1].affineTransform.c;
  retstr->bounds.origin = v3;
  retstr->bounds.size = (CGSize)self[1].bounds.origin;
  long long v4 = *(_OWORD *)&self[1].affineTransform.a;
  *(CGSize *)&retstr->affineTransform.a = self->bounds.size;
  *(_OWORD *)&retstr->affineTransform.c = v4;
  return self;
}

- (BKMousePointerDisplayRendererRootLayerProperties)rootLayerProperties
{
  CGPoint v3 = *(CGPoint *)&self[2].affineTransform.c;
  *(_OWORD *)&retstr->affineTransform.tx = *(_OWORD *)&self[2].affineTransform.a;
  retstr->bounds.origin = v3;
  retstr->bounds.size = *(CGSize *)&self[2].affineTransform.tx;
  retstr->displayScale = self[2].bounds.origin.x;
  long long v4 = *(_OWORD *)&self[1].bounds.size.height;
  *(_OWORD *)&retstr->affineTransform.a = *(_OWORD *)&self[1].bounds.origin.y;
  *(_OWORD *)&retstr->affineTransform.c = v4;
  return self;
}

- (CGPoint)pointerPosition
{
  double x = self->_pointerPosition.x;
  double y = self->_pointerPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CALayer)pointerLayer
{
  return self->_pointerLayer;
}

- (void)_updateTransformLayerPosition
{
  [(CALayer *)self->_rootLayer bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(CALayer *)self->_rootLayer anchorPoint];
  transformLayer = self->_transformLayer;
  double v13 = v4 + v12 * v8;
  double v15 = v6 + v14 * v10;

  -[CALayer setPosition:](transformLayer, "setPosition:", v13, v15);
}

- (void)setTransformLayerProperties:(BKMousePointerDisplayRendererTransformLayerProperties *)a3
{
  long long v5 = *(_OWORD *)&self->_transformLayerProperties.affineTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_transformLayerProperties.affineTransform.a;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tdouble x = *(_OWORD *)&self->_transformLayerProperties.affineTransform.tx;
  long long v6 = *(_OWORD *)&a3->affineTransform.c;
  *(_OWORD *)&v16.a = *(_OWORD *)&a3->affineTransform.a;
  *(_OWORD *)&v16.c = v6;
  *(_OWORD *)&v16.tdouble x = *(_OWORD *)&a3->affineTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v16) || (BSRectEqualToRect() & 1) == 0)
  {
    long long v7 = *(_OWORD *)&a3->affineTransform.c;
    long long v8 = *(_OWORD *)&a3->affineTransform.tx;
    CGSize size = a3->bounds.size;
    self->_transformLayerProperties.bounds.origin = a3->bounds.origin;
    self->_transformLayerProperties.bounds.CGSize size = size;
    long long v10 = *(_OWORD *)&a3->affineTransform.a;
    *(_OWORD *)&self->_transformLayerProperties.affineTransform.c = v7;
    *(_OWORD *)&self->_transformLayerProperties.affineTransform.tdouble x = v8;
    *(_OWORD *)&self->_transformLayerProperties.affineTransform.a = v10;
    *(CGFloat *)&long long v7 = self->_transformLayerProperties.bounds.origin.x;
    *(CGFloat *)&long long v8 = self->_transformLayerProperties.bounds.origin.y;
    *(CGFloat *)&long long v10 = self->_transformLayerProperties.bounds.size.width;
    size.width = self->_transformLayerProperties.bounds.size.height;
    if (!CGRectIsEmpty(*(CGRect *)&v7) && !self->_transformLayer)
    {
      v11 = +[CALayer layer];
      transformLayer = self->_transformLayer;
      self->_transformLayer = v11;

      if (self->_pointerLayer) {
        -[CALayer addSublayer:](self->_transformLayer, "addSublayer:");
      }
      rootLayer = self->_rootLayer;
      if (rootLayer) {
        [(CALayer *)rootLayer addSublayer:self->_transformLayer];
      }
    }
    -[CALayer setBounds:](self->_transformLayer, "setBounds:", self->_transformLayerProperties.bounds.origin.x, self->_transformLayerProperties.bounds.origin.y, self->_transformLayerProperties.bounds.size.width, self->_transformLayerProperties.bounds.size.height);
    double v14 = self->_transformLayer;
    long long v15 = *(_OWORD *)&self->_transformLayerProperties.affineTransform.c;
    *(_OWORD *)&t1.a = *(_OWORD *)&self->_transformLayerProperties.affineTransform.a;
    *(_OWORD *)&t1.c = v15;
    *(_OWORD *)&t1.tdouble x = *(_OWORD *)&self->_transformLayerProperties.affineTransform.tx;
    [(CALayer *)v14 setAffineTransform:&t1];
    [(BKMousePointerDisplayRenderer *)self _updateTransformLayerPosition];
  }
}

- (void)setRootLayerProperties:(BKMousePointerDisplayRendererRootLayerProperties *)a3
{
  long long v5 = *(_OWORD *)&self->_rootLayerProperties.affineTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_rootLayerProperties.affineTransform.a;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&self->_rootLayerProperties.affineTransform.tx;
  long long v6 = *(_OWORD *)&a3->affineTransform.c;
  *(_OWORD *)&v32.a = *(_OWORD *)&a3->affineTransform.a;
  *(_OWORD *)&v32.c = v6;
  *(_OWORD *)&v32.tCGFloat x = *(_OWORD *)&a3->affineTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v32)
    || !BSRectEqualToRect()
    || (BSFloatEqualToFloat() & 1) == 0)
  {
    p_rootLayerProperties = &self->_rootLayerProperties;
    if (BSFloatEqualToFloat()) {
      int v8 = 1;
    }
    else {
      int v8 = BSFloatEqualToFloat();
    }
    long long v9 = *(_OWORD *)&a3->affineTransform.tx;
    CGPoint origin = a3->bounds.origin;
    CGSize size = a3->bounds.size;
    self->_rootLayerProperties.displayScale = a3->displayScale;
    long long v12 = *(_OWORD *)&a3->affineTransform.c;
    *(_OWORD *)&p_rootLayerProperties->affineTransform.a = *(_OWORD *)&a3->affineTransform.a;
    *(_OWORD *)&self->_rootLayerProperties.affineTransform.c = v12;
    self->_rootLayerProperties.bounds.CGPoint origin = origin;
    self->_rootLayerProperties.bounds.CGSize size = size;
    *(_OWORD *)&self->_rootLayerProperties.affineTransform.tCGFloat x = v9;
    if (BSFloatEqualToFloat()) {
      int v13 = 1;
    }
    else {
      int v13 = BSFloatEqualToFloat();
    }
    if (v13 != v8)
    {
      [(CAContext *)self->_context setLayer:0];
      [(CAContext *)self->_context invalidate];
      context = self->_context;
      self->_context = 0;
    }
    if (!CGRectIsEmpty(self->_rootLayerProperties.bounds) && BSFloatGreaterThanFloat())
    {
      if (!self->_rootLayer)
      {
        long long v15 = +[CALayer layer];
        rootLayer = self->_rootLayer;
        self->_rootLayer = v15;
      }
      if (self->_transformLayer) {
        -[CALayer addSublayer:](self->_rootLayer, "addSublayer:");
      }
      v17 = self->_context;
      if (!v17)
      {
        v34[0] = kCAContextDisplayable;
        v34[1] = kCAContextDisplayName;
        displayName = self->_displayName;
        v35[0] = &__kCFBooleanTrue;
        v35[1] = displayName;
        v34[2] = kCAContextIgnoresHitTest;
        v34[3] = kCAContextSecure;
        v35[2] = &__kCFBooleanTrue;
        v35[3] = &__kCFBooleanTrue;
        v19 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4];
        v20 = +[CAContext remoteContextWithOptions:v19];
        v21 = self->_context;
        self->_context = v20;

        LODWORD(v22) = 1173553152;
        [(CAContext *)self->_context setLevel:v22];
        [(CAContext *)self->_context setSecure:1];

        v17 = self->_context;
      }
      [(CAContext *)v17 setLayer:self->_rootLayer];
    }
    v23 = self->_rootLayer;
    long long v24 = *(_OWORD *)&self->_rootLayerProperties.affineTransform.c;
    *(_OWORD *)&t1.a = *(_OWORD *)&p_rootLayerProperties->affineTransform.a;
    *(_OWORD *)&t1.c = v24;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&self->_rootLayerProperties.affineTransform.tx;
    [(CALayer *)v23 setAffineTransform:&t1];
    [(CALayer *)self->_rootLayer setRasterizationScale:self->_rootLayerProperties.displayScale];
    -[CALayer setBounds:](self->_rootLayer, "setBounds:", self->_rootLayerProperties.bounds.origin.x, self->_rootLayerProperties.bounds.origin.y, self->_rootLayerProperties.bounds.size.width, self->_rootLayerProperties.bounds.size.height);
    CGRect bounds = self->_rootLayerProperties.bounds;
    long long v25 = *(_OWORD *)&self->_rootLayerProperties.affineTransform.c;
    *(_OWORD *)&t1.a = *(_OWORD *)&p_rootLayerProperties->affineTransform.a;
    *(_OWORD *)&t1.c = v25;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&self->_rootLayerProperties.affineTransform.tx;
    CGRect v37 = CGRectApplyAffineTransform(bounds, &t1);
    CGFloat x = v37.origin.x;
    CGFloat y = v37.origin.y;
    CGFloat width = v37.size.width;
    CGFloat height = v37.size.height;
    v30 = self->_rootLayer;
    double MidX = CGRectGetMidX(v37);
    v38.origin.CGFloat x = x;
    v38.origin.CGFloat y = y;
    v38.size.CGFloat width = width;
    v38.size.CGFloat height = height;
    -[CALayer setPosition:](v30, "setPosition:", MidX, CGRectGetMidY(v38));
    [(BKMousePointerDisplayRenderer *)self _updateTransformLayerPosition];
  }
}

- (void)setPointerPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ((BSPointEqualToPoint() & 1) == 0)
  {
    self->_pointerPosition.double x = x;
    self->_pointerPosition.double y = y;
    pointerLayer = self->_pointerLayer;
    -[CALayer setPosition:](pointerLayer, "setPosition:", x, y);
  }
}

- (void)setPointerLayer:(id)a3
{
  long long v5 = (CALayer *)a3;
  p_pointerLayer = &self->_pointerLayer;
  pointerLayer = self->_pointerLayer;
  long long v10 = v5;
  if (pointerLayer != v5)
  {
    if (pointerLayer)
    {
      int v8 = [(CALayer *)pointerLayer superlayer];
      transformLayer = self->_transformLayer;

      if (v8 == transformLayer) {
        [(CALayer *)*p_pointerLayer removeFromSuperlayer];
      }
    }
    objc_storeStrong((id *)&self->_pointerLayer, a3);
    if (*p_pointerLayer)
    {
      -[CALayer addSublayer:](self->_transformLayer, "addSublayer:");
      -[CALayer setPosition:](self->_pointerLayer, "setPosition:", self->_pointerPosition.x, self->_pointerPosition.y);
    }
  }
}

- (void)invalidate
{
}

- (BKMousePointerDisplayRenderer)initWithDisplayName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKMousePointerDisplayRenderer;
  long long v5 = [(BKMousePointerDisplayRenderer *)&v9 init];
  if (v5)
  {
    long long v6 = (NSString *)[v4 copy];
    displayName = v5->_displayName;
    v5->_displayName = v6;
  }
  return v5;
}

+ (BKMousePointerDisplayRendererRootLayerProperties)rootLayerPropertiesForDisplay:(SEL)a3 displayController:(id)a4
{
  id v7 = a5;
  long long v13 = 0u;
  long long v14 = 0u;
  int v8 = [a4 uniqueId];
  if (v7)
  {
    [v7 geometryForDisplayUUID:v8];
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
  }

  double v9 = *(double *)&v13;
  double v10 = *(double *)&v14;
  if (BSFloatLessThanOrEqualToFloat()) {
    double v10 = 1.0;
  }
  if ((BYTE8(v14) & 0xFD) == 1) {
    double v11 = *((double *)&v13 + 1);
  }
  else {
    double v11 = *(double *)&v13;
  }
  if ((BYTE8(v14) & 0xFD) != 1) {
    double v9 = *((double *)&v13 + 1);
  }
  CGAffineTransformMakeScale(&retstr->affineTransform, v10, v10);
  retstr->bounds.origin.double x = 0.0;
  retstr->bounds.origin.double y = 0.0;
  retstr->bounds.size.CGFloat width = v11 / v10;
  retstr->bounds.size.CGFloat height = v9 / v10;
  retstr->displayScale = v10;

  return result;
}

@end