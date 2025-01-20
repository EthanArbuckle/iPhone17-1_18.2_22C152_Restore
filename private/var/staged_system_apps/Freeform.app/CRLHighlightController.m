@interface CRLHighlightController
- (BOOL)drawRoundedRect;
- (BOOL)shouldCreateBackground;
- (CALayer)imageLayer;
- (CALayer)layer;
- (CALayer)layerToAnimate;
- (CAShapeLayer)backgroundLayer;
- (CGAffineTransform)transform;
- (CGColor)backgroundColor;
- (CGPath)path;
- (CGRect)rectToAnimate;
- (CRLImage)image;
- (double)viewScale;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (void)buildLayersForPath:(CGPath *)a3 withImage:(id)a4;
- (void)createLayerWithZOrder:(double)a3 contentsScaleForLayers:(double)a4;
- (void)dealloc;
- (void)hide;
- (void)p_buildLayersForPath:(CGPath *)a3 withImage:(id)a4;
- (void)p_buildLayersWithBackgroundForPath:(CGPath *)a3 withImage:(id)a4;
- (void)reset;
- (void)setBackgroundColor:(CGColor *)a3;
- (void)setBackgroundLayer:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageLayer:(id)a3;
- (void)setPath:(CGPath *)a3;
- (void)setShouldCreateBackground:(BOOL)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)setViewScale:(double)a3;
@end

@implementation CRLHighlightController

- (CALayer)layerToAnimate
{
  unsigned int v3 = [(CRLHighlightController *)self shouldCreateBackground];
  uint64_t v4 = 24;
  if (v3) {
    uint64_t v4 = 56;
  }
  v5 = *(Class *)((char *)&self->super.isa + v4);

  return (CALayer *)v5;
}

- (void)setPath:(CGPath *)a3
{
  path = self->_path;
  if (path != a3)
  {
    if (path) {
      CGPathRelease(path);
    }
    self->_path = CGPathRetain(a3);
  }
}

- (void)setBackgroundColor:(CGColor *)a3
{
  backgroundColor = self->_backgroundColor;
  if (backgroundColor != a3)
  {
    if (backgroundColor) {
      CGColorRelease(backgroundColor);
    }
    self->_backgroundColor = CGColorRetain(a3);
  }
}

- (void)dealloc
{
  [(CRLHighlightController *)self reset];
  [(CRLHighlightController *)self setPath:0];
  [(CRLHighlightController *)self setBackgroundColor:0];
  v3.receiver = self;
  v3.super_class = (Class)CRLHighlightController;
  [(CRLHighlightController *)&v3 dealloc];
}

- (void)reset
{
  CGSize size = CGRectZero.size;
  self->_rectToAnimate.origin = CGRectZero.origin;
  self->_rectToAnimate.CGSize size = size;
  [(CRLHighlightController *)self setImage:0];
  [(CRLHighlightController *)self setPath:0];
  [(CALayer *)self->_layer setDelegate:0];
  uint64_t v4 = [(CALayer *)self->_layer sublayers];
  [v4 makeObjectsPerformSelector:"setDelegate:" withObject:0];

  layer = self->_layer;
  self->_layer = 0;
}

- (BOOL)drawRoundedRect
{
  return 0;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return +[NSNull null];
}

- (void)hide
{
}

- (void)createLayerWithZOrder:(double)a3 contentsScaleForLayers:(double)a4
{
  if (self->_layer)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DFC00);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010874E8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DFC20);
    }
    v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v7);
    }
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLHighlightController createLayerWithZOrder:contentsScaleForLayers:]");
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLHighlightController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:99 isFatal:0 description:"Shouldn't be creating _layer again"];

    [(CRLHighlightController *)self reset];
  }
  if (a4 <= 0.0) {
    a4 = 1.0;
  }
  v10 = (CALayer *)objc_alloc_init((Class)CALayer);
  layer = self->_layer;
  self->_layer = v10;

  double y = CGPointZero.y;
  -[CALayer setAnchorPoint:](self->_layer, "setAnchorPoint:", CGPointZero.x, y);
  [(CALayer *)self->_layer setEdgeAntialiasingMask:0];
  [(CALayer *)self->_layer setContentsScale:a4];
  [(CALayer *)self->_layer setZPosition:a3];
  [(CALayer *)self->_layer setDelegate:self];
  v13 = (CALayer *)objc_alloc_init((Class)CALayer);
  imageLayer = self->_imageLayer;
  self->_imageLayer = v13;

  -[CALayer setAnchorPoint:](self->_imageLayer, "setAnchorPoint:", CGPointZero.x, y);
  [(CALayer *)self->_imageLayer setEdgeAntialiasingMask:0];
  [(CALayer *)self->_imageLayer setContentsScale:a4];
  [(CALayer *)self->_layer addSublayer:self->_imageLayer];
  [(CALayer *)self->_imageLayer setDelegate:self];
  [(CALayer *)self->_imageLayer setZPosition:1.0];
}

- (void)p_buildLayersForPath:(CGPath *)a3 withImage:(id)a4
{
  id v6 = a4;
  CGSize size = CGRectZero.size;
  self->_rectToAnimate.origin = CGRectZero.origin;
  self->_rectToAnimate.CGSize size = size;
  [(CRLHighlightController *)self setImage:v6];
  [(CRLHighlightController *)self setPath:a3];
  if (a3)
  {
    BoundingBoCGFloat x = CGPathGetBoundingBox(a3);
    long long v8 = *(_OWORD *)&self->_transform.c;
    *(_OWORD *)&v35.a = *(_OWORD *)&self->_transform.a;
    *(_OWORD *)&v35.c = v8;
    *(_OWORD *)&v35.tCGFloat x = *(_OWORD *)&self->_transform.tx;
    CGRect v37 = CGRectApplyAffineTransform(BoundingBox, &v35);
    CGFloat x = v37.origin.x;
    CGFloat y = v37.origin.y;
    CGFloat width = v37.size.width;
    CGFloat height = v37.size.height;
    if (sub_100065AF4(v37.origin.x, v37.origin.y, v37.size.width, v37.size.height))
    {
      [(CRLHighlightController *)self viewScale];
      if (v13 != 0.0)
      {
        [(CRLHighlightController *)self viewScale];
        CGFloat v15 = v14;
        [(CRLHighlightController *)self viewScale];
        CGAffineTransformMakeScale(&v34, v15, v16);
        v38.origin.CGFloat x = x;
        v38.origin.CGFloat y = y;
        v38.size.CGFloat width = width;
        v38.size.CGFloat height = height;
        CGRect v39 = CGRectApplyAffineTransform(v38, &v34);
        CGFloat x = v39.origin.x;
        CGFloat y = v39.origin.y;
        CGFloat width = v39.size.width;
        CGFloat height = v39.size.height;
      }
      v40.origin.CGFloat x = x;
      v40.origin.CGFloat y = y;
      v40.size.CGFloat width = width;
      v40.size.CGFloat height = height;
      self->_rectToAnimate = CGRectIntegral(v40);
      -[CALayer setFrame:](self->_layer, "setFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      double v17 = self->_rectToAnimate.origin.x;
      double v18 = self->_rectToAnimate.origin.y;
      double v19 = self->_rectToAnimate.size.width;
      double v20 = self->_rectToAnimate.size.height;
      [v6 size];
      double v22 = v21;
      double v24 = v23;
      *(float *)&double v21 = (v23 - v20) * 0.5;
      double v25 = roundf(*(float *)&v21);
      *(float *)&double v23 = (v22 - v19) * 0.5;
      double v26 = v17 - roundf(*(float *)&v23);
      double v27 = v18 - v25;
      LODWORD(v25) = 0.75;
      [(CALayer *)self->_imageLayer setShadowOpacity:v25];
      [(CALayer *)self->_imageLayer setShadowRadius:1.0];
      -[CALayer setShadowOffset:](self->_imageLayer, "setShadowOffset:", 0.0, 0.0);
      [(CALayer *)self->_imageLayer setContents:[(CRLImage *)self->_image CGImage]];
      -[CALayer setFrame:](self->_imageLayer, "setFrame:", v26, v27, v22, v24);
      [(CALayer *)self->_imageLayer setContentsGravity:kCAGravityCenter];
      long long v28 = *(_OWORD *)&self->_transform.c;
      *(_OWORD *)&v35.a = *(_OWORD *)&self->_transform.a;
      *(_OWORD *)&v35.c = v28;
      *(_OWORD *)&v35.tCGFloat x = *(_OWORD *)&self->_transform.tx;
      double v29 = sub_10007F81C(&v35.a);
      memset(&v35, 0, sizeof(v35));
      CGAffineTransformMakeScale(&v35, v29, v30);
      CGAffineTransform v32 = v35;
      sub_10007FCC0(&v32, &v33, v22 * -0.5, v24 * -0.5);
      CGAffineTransform v35 = v33;
      CGAffineTransform v31 = v33;
      [(CALayer *)self->_imageLayer setAffineTransform:&v31];
      [(CALayer *)self->_layer setHidden:0];
    }
  }
}

- (void)p_buildLayersWithBackgroundForPath:(CGPath *)a3 withImage:(id)a4
{
  id v6 = a4;
  [(CRLHighlightController *)self setImage:v6];
  [(CRLHighlightController *)self setPath:a3];
  if (a3)
  {
    v7 = (CAShapeLayer *)objc_alloc_init((Class)CAShapeLayer);
    backgroundLayer = self->_backgroundLayer;
    self->_backgroundLayer = v7;

    -[CAShapeLayer setAnchorPoint:](self->_backgroundLayer, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
    [(CAShapeLayer *)self->_backgroundLayer setEdgeAntialiasingMask:0];
    [(CALayer *)self->_imageLayer contentsScale];
    -[CAShapeLayer setContentsScale:](self->_backgroundLayer, "setContentsScale:");
    [(CALayer *)self->_layer addSublayer:self->_backgroundLayer];
    [(CAShapeLayer *)self->_backgroundLayer setDelegate:self];
    [(CAShapeLayer *)self->_backgroundLayer setZPosition:-1.0];
    LODWORD(v9) = 0.75;
    [(CAShapeLayer *)self->_backgroundLayer setShadowOpacity:v9];
    [(CAShapeLayer *)self->_backgroundLayer setShadowRadius:1.0];
    -[CAShapeLayer setShadowOffset:](self->_backgroundLayer, "setShadowOffset:", 0.0, 0.0);
    [(CRLHighlightController *)self p_buildLayersForPath:a3 withImage:v6];
    [(CALayer *)self->_imageLayer setShadowOpacity:0.0];
    -[CALayer setFrame:](self->_layer, "setFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    BoundingBoCGFloat x = CGPathGetBoundingBox(a3);
    long long v10 = *(_OWORD *)&self->_transform.c;
    *(_OWORD *)&transform.a = *(_OWORD *)&self->_transform.a;
    *(_OWORD *)&transform.c = v10;
    *(_OWORD *)&transform.tCGFloat x = *(_OWORD *)&self->_transform.tx;
    CGRect v32 = CGRectApplyAffineTransform(BoundingBox, &transform);
    CGFloat x = v32.origin.x;
    CGFloat y = v32.origin.y;
    CGFloat width = v32.size.width;
    CGFloat height = v32.size.height;
    [(CRLHighlightController *)self viewScale];
    if (v15 == 0.0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DFC40);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108762C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DFC60);
      }
      CGFloat v16 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v16);
      }
      double v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLHighlightController p_buildLayersWithBackgroundForPath:withImage:]");
      double v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLHighlightController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v17 file:v18 lineNumber:209 isFatal:0 description:"viewScale must be set before calling this method!"];
    }
    memset(&transform, 0, sizeof(transform));
    [(CRLHighlightController *)self viewScale];
    CGFloat v20 = v19;
    [(CRLHighlightController *)self viewScale];
    CGAffineTransformMakeScale(&transform, v20, v21);
    [(CRLHighlightController *)self viewScale];
    if (v22 != 0.0)
    {
      CGAffineTransform v29 = transform;
      v33.origin.CGFloat x = x;
      v33.origin.CGFloat y = y;
      v33.size.CGFloat width = width;
      v33.size.CGFloat height = height;
      CGRect v34 = CGRectApplyAffineTransform(v33, &v29);
      CGFloat x = v34.origin.x;
      CGFloat y = v34.origin.y;
      CGFloat width = v34.size.width;
      CGFloat height = v34.size.height;
    }
    v35.origin.CGFloat x = x;
    v35.origin.CGFloat y = y;
    v35.size.CGFloat width = width;
    v35.size.CGFloat height = height;
    self->_rectToAnimate = CGRectIntegral(v35);
    CopyByTransformingPath = CGPathCreateCopyByTransformingPath(a3, &self->_transform);
    double v24 = CGPathCreateCopyByTransformingPath(CopyByTransformingPath, &transform);
    [(CAShapeLayer *)self->_backgroundLayer setPath:v24];
    backgroundColor = self->_backgroundColor;
    if (!backgroundColor)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DFC80);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108757C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DFCA0);
      }
      double v26 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v26);
      }
      double v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLHighlightController p_buildLayersWithBackgroundForPath:withImage:]");
      long long v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLHighlightController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 218, 0, "invalid nil value for '%{public}s'", "_backgroundColor");

      backgroundColor = self->_backgroundColor;
    }
    [(CAShapeLayer *)self->_backgroundLayer setFillColor:backgroundColor];
    [(CAShapeLayer *)self->_backgroundLayer setContentsGravity:kCAGravityCenter];
    CGPathRelease(v24);
    CGPathRelease(CopyByTransformingPath);
    [(CALayer *)self->_layer setHidden:0];
  }
}

- (void)buildLayersForPath:(CGPath *)a3 withImage:(id)a4
{
  id v6 = a4;
  if ([(CRLHighlightController *)self shouldCreateBackground]) {
    [(CRLHighlightController *)self p_buildLayersWithBackgroundForPath:a3 withImage:v6];
  }
  else {
    [(CRLHighlightController *)self p_buildLayersForPath:a3 withImage:v6];
  }
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[2].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&self[2].ty;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tCGFloat x = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (double)viewScale
{
  return self->_viewScale;
}

- (void)setViewScale:(double)a3
{
  self->_viewScale = a3;
}

- (CALayer)layer
{
  return self->_layer;
}

- (CGRect)rectToAnimate
{
  double x = self->_rectToAnimate.origin.x;
  double y = self->_rectToAnimate.origin.y;
  double width = self->_rectToAnimate.size.width;
  double height = self->_rectToAnimate.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGPath)path
{
  return self->_path;
}

- (CGColor)backgroundColor
{
  return self->_backgroundColor;
}

- (BOOL)shouldCreateBackground
{
  return self->_shouldCreateBackground;
}

- (void)setShouldCreateBackground:(BOOL)a3
{
  self->_shouldCreateBackground = a3;
}

- (CRLImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (CAShapeLayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (void)setBackgroundLayer:(id)a3
{
}

- (CALayer)imageLayer
{
  return self->_imageLayer;
}

- (void)setImageLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageLayer, 0);
  objc_storeStrong((id *)&self->_backgroundLayer, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_layer, 0);
}

@end