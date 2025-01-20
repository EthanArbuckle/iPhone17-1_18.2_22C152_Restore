@interface THWInteractiveImageCalloutInfo
- (BOOL)shouldDraw;
- (CGPoint)contentOffset;
- (CGPoint)sourcePoint;
- (CGPoint)targetPoint;
- (CGRect)unscaledTitleRect;
- (THWInteractiveImageCalloutInfo)initWithViewScale:(double)a3 contentOffset:(CGPoint)a4;
- (THWInteractiveImageCalloutInfo)initWithViewScale:(double)a3 contentOffset:(CGPoint)a4 groupShape:(id)a5 titleStorage:(id)a6 titleGeometry:(id)a7 descriptionStorage:(id)a8 descriptionGeometry:(id)a9 lineShape:(id)a10;
- (TSDInfoGeometry)descriptionGeometry;
- (TSDInfoGeometry)titleGeometry;
- (TSDShapeInfo)groupShape;
- (TSDShapeInfo)lineShape;
- (TSWPStorage)descriptionStorage;
- (TSWPStorage)titleStorage;
- (UIEdgeInsets)contentInset;
- (double)verticalSpacing;
- (double)viewScale;
- (id)description;
- (id)p_geometry:(id)a3 offsetBy:(CGPoint)a4;
- (void)dealloc;
- (void)setContentOffset:(CGPoint)a3;
- (void)setDescriptionGeometry:(id)a3;
- (void)setDescriptionStorage:(id)a3;
- (void)setGroupShape:(id)a3;
- (void)setLineShape:(id)a3;
- (void)setSourcePoint:(CGPoint)a3;
- (void)setTargetPoint:(CGPoint)a3;
- (void)setTitleGeometry:(id)a3;
- (void)setTitleStorage:(id)a3;
- (void)setViewScale:(double)a3;
@end

@implementation THWInteractiveImageCalloutInfo

- (THWInteractiveImageCalloutInfo)initWithViewScale:(double)a3 contentOffset:(CGPoint)a4 groupShape:(id)a5 titleStorage:(id)a6 titleGeometry:(id)a7 descriptionStorage:(id)a8 descriptionGeometry:(id)a9 lineShape:(id)a10
{
  double y = a4.y;
  double x = a4.x;
  v46.receiver = self;
  v46.super_class = (Class)THWInteractiveImageCalloutInfo;
  v19 = [(THWInteractiveImageCalloutInfo *)&v46 init];
  if (v19)
  {
    id v20 = objc_msgSend(objc_msgSend(objc_msgSend(a10, "pathSource"), "bezierPath"), "CGPath");
    CGPoint v44 = CGPointZero;
    CGPoint v45 = CGPointZero;
    if (v20)
    {
      TSDPathGetStartAndEndPoints();
      id v21 = [a10 geometry];
      if (v21)
      {
        [v21 transform];
        float64x2_t v22 = v41;
        float64x2_t v23 = v42;
        float64x2_t v24 = v43;
      }
      else
      {
        float64x2_t v24 = 0uLL;
        float64x2_t v42 = 0u;
        float64x2_t v43 = 0u;
        float64x2_t v41 = 0u;
        float64x2_t v22 = 0uLL;
        float64x2_t v23 = 0uLL;
      }
      CGPoint v45 = (CGPoint)vaddq_f64(v24, vmlaq_n_f64(vmulq_n_f64(v23, v45.y), v22, v45.x));
      id v25 = [a10 geometry];
      if (v25)
      {
        [v25 transform];
        float64x2_t v26 = v38;
        float64x2_t v27 = v39;
        float64x2_t v28 = v40;
      }
      else
      {
        float64x2_t v28 = 0uLL;
        float64x2_t v39 = 0u;
        float64x2_t v40 = 0u;
        float64x2_t v38 = 0u;
        float64x2_t v26 = 0uLL;
        float64x2_t v27 = 0uLL;
      }
      CGPoint v44 = (CGPoint)vaddq_f64(v28, vmlaq_n_f64(vmulq_n_f64(v27, v44.y), v26, v44.x));
    }
    objc_msgSend(objc_msgSend(a5, "geometry", *(_OWORD *)&v38, *(_OWORD *)&v39, *(_OWORD *)&v40, *(_OWORD *)&v41, *(_OWORD *)&v42, *(_OWORD *)&v43), "boundsBeforeRotation");
    double v30 = v29;
    double v32 = v31;
    [(THWInteractiveImageCalloutInfo *)v19 setViewScale:a3];
    -[THWInteractiveImageCalloutInfo setContentOffset:](v19, "setContentOffset:", x, y);
    [(THWInteractiveImageCalloutInfo *)v19 setGroupShape:a5];
    [(THWInteractiveImageCalloutInfo *)v19 setTitleStorage:a6];
    -[THWInteractiveImageCalloutInfo setTitleGeometry:](v19, "setTitleGeometry:", -[THWInteractiveImageCalloutInfo p_geometry:offsetBy:](v19, "p_geometry:offsetBy:", a7, v30, v32));
    [(THWInteractiveImageCalloutInfo *)v19 setDescriptionStorage:a8];
    -[THWInteractiveImageCalloutInfo setDescriptionGeometry:](v19, "setDescriptionGeometry:", -[THWInteractiveImageCalloutInfo p_geometry:offsetBy:](v19, "p_geometry:offsetBy:", a9, v30, v32));
    [(THWInteractiveImageCalloutInfo *)v19 setLineShape:a10];
    [(THWInteractiveImageCalloutInfo *)v19 setSourcePoint:v45];
    [(THWInteractiveImageCalloutInfo *)v19 setTargetPoint:v44];
    [(TSDInfoGeometry *)[(THWInteractiveImageCalloutInfo *)v19 titleGeometry] position];
    double v34 = v33;
    [(-[THWInteractiveImageCalloutInfo groupShape](v19, "groupShape"), "geometry") position];
    v19->_marginInset = v34 - v35;
    [(TSDInfoGeometry *)[(THWInteractiveImageCalloutInfo *)v19 descriptionGeometry] boundsBeforeRotation];
    double MinY = CGRectGetMinY(v47);
    [(TSDInfoGeometry *)[(THWInteractiveImageCalloutInfo *)v19 titleGeometry] boundsBeforeRotation];
    v19->_verticalSpacing = MinY - CGRectGetMaxY(v48);
  }
  return v19;
}

- (THWInteractiveImageCalloutInfo)initWithViewScale:(double)a3 contentOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v11.receiver = self;
  v11.super_class = (Class)THWInteractiveImageCalloutInfo;
  v7 = [(THWInteractiveImageCalloutInfo *)&v11 init];
  v8 = v7;
  if (v7)
  {
    [(THWInteractiveImageCalloutInfo *)v7 setViewScale:a3];
    -[THWInteractiveImageCalloutInfo setContentOffset:](v8, "setContentOffset:", x, y);
    [(THWInteractiveImageCalloutInfo *)v8 setGroupShape:0];
    [(THWInteractiveImageCalloutInfo *)v8 setTitleStorage:0];
    [(THWInteractiveImageCalloutInfo *)v8 setTitleGeometry:0];
    [(THWInteractiveImageCalloutInfo *)v8 setDescriptionStorage:0];
    [(THWInteractiveImageCalloutInfo *)v8 setDescriptionGeometry:0];
    [(THWInteractiveImageCalloutInfo *)v8 setLineShape:0];
    double v9 = CGPointZero.y;
    -[THWInteractiveImageCalloutInfo setSourcePoint:](v8, "setSourcePoint:", CGPointZero.x, v9);
    -[THWInteractiveImageCalloutInfo setTargetPoint:](v8, "setTargetPoint:", CGPointZero.x, v9);
  }
  return v8;
}

- (void)dealloc
{
  [(THWInteractiveImageCalloutInfo *)self setGroupShape:0];
  [(THWInteractiveImageCalloutInfo *)self setTitleStorage:0];
  [(THWInteractiveImageCalloutInfo *)self setTitleGeometry:0];
  [(THWInteractiveImageCalloutInfo *)self setDescriptionStorage:0];
  [(THWInteractiveImageCalloutInfo *)self setDescriptionGeometry:0];
  [(THWInteractiveImageCalloutInfo *)self setLineShape:0];
  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageCalloutInfo;
  [(THWInteractiveImageCalloutInfo *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  [(THWInteractiveImageCalloutInfo *)self viewScale];
  uint64_t v6 = v5;
  [(THWInteractiveImageCalloutInfo *)self contentOffset];
  v7 = NSStringFromCGPoint(v12);
  id v8 = [(TSWPStorage *)[(THWInteractiveImageCalloutInfo *)self titleStorage] string];
  id v9 = [[-[THWInteractiveImageCalloutInfo groupShape](self, "groupShape") geometry] description];
  [(THWInteractiveImageCalloutInfo *)self sourcePoint];
  v10 = NSStringFromCGPoint(v13);
  [(THWInteractiveImageCalloutInfo *)self targetPoint];
  return +[NSString stringWithFormat:@"<%@=%p viewScale=%.1f contentOffset=%@ title=%@ groupShape.geometry=%@ sourcePoint=%@ targetPoint=%@>", v4, self, v6, v7, v8, v9, v10, NSStringFromCGPoint(v14)];
}

- (CGRect)unscaledTitleRect
{
  v2 = [(THWInteractiveImageCalloutInfo *)self titleGeometry];

  [(TSDInfoGeometry *)v2 boundsBeforeRotation];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (BOOL)shouldDraw
{
  return [(THWInteractiveImageCalloutInfo *)self groupShape] != 0;
}

- (UIEdgeInsets)contentInset
{
  double marginInset = self->_marginInset;
  double v3 = marginInset;
  double v4 = marginInset;
  double v5 = marginInset;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = marginInset;
  return result;
}

- (id)p_geometry:(id)a3 offsetBy:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  [a3 position];
  double v8 = x + v7;
  double v10 = y + v9;
  id v11 = objc_alloc((Class)TSDInfoGeometry);
  [a3 size];
  double v13 = v12;
  double v15 = v14;
  id v16 = [a3 widthValid];
  id v17 = [a3 heightValid];
  id v18 = [a3 horizontalFlip];
  id v19 = [a3 verticalFlip];
  [a3 angle];
  id v21 = [v11 initWithPosition:v16 size:v17 widthValid:v18 heightValid:v19 horizontalFlip:v8 verticalFlip:v10 angle:v13];

  return v21;
}

- (TSDShapeInfo)groupShape
{
  return self->mGroupShape;
}

- (void)setGroupShape:(id)a3
{
}

- (TSWPStorage)titleStorage
{
  return self->mTitleStorage;
}

- (void)setTitleStorage:(id)a3
{
}

- (TSDInfoGeometry)titleGeometry
{
  return self->mTitleGeometry;
}

- (void)setTitleGeometry:(id)a3
{
}

- (TSWPStorage)descriptionStorage
{
  return self->mDescriptionStorage;
}

- (void)setDescriptionStorage:(id)a3
{
}

- (TSDInfoGeometry)descriptionGeometry
{
  return self->mDescriptionGeometry;
}

- (void)setDescriptionGeometry:(id)a3
{
}

- (TSDShapeInfo)lineShape
{
  return self->mLineShape;
}

- (void)setLineShape:(id)a3
{
}

- (double)viewScale
{
  return self->mViewScale;
}

- (void)setViewScale:(double)a3
{
  self->mViewScale = a3;
}

- (CGPoint)contentOffset
{
  double x = self->mContentOffset.x;
  double y = self->mContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  self->mContentOffset = a3;
}

- (CGPoint)sourcePoint
{
  double x = self->mSourcePoint.x;
  double y = self->mSourcePoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setSourcePoint:(CGPoint)a3
{
  self->mSourcePoint = a3;
}

- (CGPoint)targetPoint
{
  double x = self->mTargetPoint.x;
  double y = self->mTargetPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTargetPoint:(CGPoint)a3
{
  self->mTargetPoint = a3;
}

- (double)verticalSpacing
{
  return self->_verticalSpacing;
}

@end