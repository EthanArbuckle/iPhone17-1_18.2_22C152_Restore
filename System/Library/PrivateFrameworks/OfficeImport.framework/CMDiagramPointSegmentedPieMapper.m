@interface CMDiagramPointSegmentedPieMapper
- (id)_arrowFillWithState:(id)a3;
- (id)transformPresentationName;
- (void)mapAt:(id)a3 withState:(id)a4;
- (void)setDrawArrows:(BOOL)a3;
- (void)setSegmentCount:(unint64_t)a3;
- (void)setSegmentIndex:(unint64_t)a3;
- (void)setStartAngle:(double)a3;
- (void)setStopAngle:(double)a3;
@end

@implementation CMDiagramPointSegmentedPieMapper

- (void)setStartAngle:(double)a3
{
  self->mStartAngle = a3;
}

- (void)setStopAngle:(double)a3
{
  self->mStopAngle = a3;
}

- (void)setDrawArrows:(BOOL)a3
{
  self->mDrawArrows = a3;
}

- (void)setSegmentIndex:(unint64_t)a3
{
  self->mSegmentIndex = a3;
}

- (void)setSegmentCount:(unint64_t)a3
{
  self->mSegmentCount = a3;
}

- (id)_arrowFillWithState:(id)a3
{
  id v4 = a3;
  v5 = [(CMDiagramPointMapper *)self fill];
  v6 = +[CMColorProperty nsColorFromOADFill:v5 state:v4];

  [v6 redComponent];
  double v8 = v7 * 1.2;
  if (v8 <= 1.0) {
    double v9 = v8;
  }
  else {
    double v9 = 1.0;
  }
  [v6 greenComponent];
  double v11 = v10 * 1.2;
  if (v11 <= 1.0) {
    double v12 = v11;
  }
  else {
    double v12 = 1.0;
  }
  [v6 blueComponent];
  double v14 = v13;
  v15 = [OADRgbColor alloc];
  double v16 = v14 * 1.2;
  double v17 = 1.0;
  if (v14 * 1.2 <= 1.0) {
    double v18 = v14 * 1.2;
  }
  else {
    double v18 = 1.0;
  }
  *(float *)&double v16 = v9;
  *(float *)&double v17 = v12;
  *(float *)&double v18 = v18;
  v19 = [(OADRgbColor *)v15 initWithRed:v16 green:v17 blue:v18];
  v20 = objc_alloc_init(OADSolidFill);
  [(OADSolidFill *)v20 setColor:v19];

  return v20;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v47 = a3;
  id v48 = a4;
  uint64_t v6 = [(CMDiagramPointSegmentedPieMapper *)self transformPresentationName];
  v46 = (void *)v6;
  if (v6)
  {
    double v7 = [(CMDiagramPointMapper *)self transformForPresentationWithName:v6];
    double v8 = v7;
    if (self->mDrawArrows || !self->mSegmentIndex)
    {
      long long v53 = 0u;
      *(_OWORD *)v54 = 0u;
      long long v52 = 0u;
      if (v7)
      {
        [v7 transformStruct];
        double v9 = v54[1];
        double v10 = v54[0];
      }
      else
      {
        double v9 = 0.0;
        double v10 = 0.0;
      }
      if (v10 == 0.0 && v9 == 0.0)
      {
        [(OADOrientedBounds *)self->super.mOrientedBounds bounds];
        CGFloat x = v55.origin.x;
        CGFloat y = v55.origin.y;
        CGFloat width = v55.size.width;
        CGFloat height = v55.size.height;
        double v15 = CGRectGetWidth(v55);
        v56.origin.CGFloat x = x;
        v56.origin.CGFloat y = y;
        v56.size.CGFloat width = width;
        v56.size.CGFloat height = height;
        double v16 = (v15 + CGRectGetHeight(v56)) * 0.03;
        __double2 v17 = __sincos_stret(((double)self->mSegmentIndex + 0.5 + (double)self->mSegmentIndex + 0.5)* -3.14159265/ (double)self->mSegmentCount+ 1.57079633);
        v54[0] = v16 * v17.__cosval;
        v54[1] = -(v16 * v17.__sinval);
        v51[0] = v52;
        v51[1] = v53;
        v51[2] = *(_OWORD *)v54;
        [v8 setTransformStruct:v51];
      }
    }
    v49 = +[CMShapeUtils transformedBoundsWithBounds:self->super.mOrientedBounds transform:v8];
  }
  else
  {
    v49 = self->super.mOrientedBounds;
  }
  [(CMDiagramPointMapper *)self applyDiagramStyleToShapeProperties];
  v45 = [(CMDiagramPointMapper *)self fill];
  uint64_t v18 = [(CMDiagramPointMapper *)self stroke];
  v19 = NSDictionary;
  double mStartAngle = self->mStartAngle;
  *(float *)&double mStartAngle = mStartAngle;
  v44 = (void *)v18;
  v43 = [NSNumber numberWithFloat:mStartAngle];
  v21 = [NSNumber numberWithInt:0];
  double mStopAngle = self->mStopAngle;
  *(float *)&double mStopAngle = mStopAngle;
  v23 = [NSNumber numberWithFloat:mStopAngle];
  v24 = [NSNumber numberWithInt:1];
  v25 = objc_msgSend(v19, "dictionaryWithObjectsAndKeys:", v43, v21, v23, v24, 0);
  v26 = v48;
  +[CMShapeRenderer renderCanonicalShape:250 fill:v45 stroke:v44 adjustValues:v25 orientedBounds:v49 state:v48 drawingContext:self->super.mDrawingContext];

  if (self->mDrawArrows)
  {
    v27 = [(CMDiagramPointSegmentedPieMapper *)self _arrowFillWithState:v48];
    v28 = NSDictionary;
    double v29 = self->mStartAngle;
    *(float *)&double v29 = v29;
    v30 = [NSNumber numberWithFloat:v29];
    v31 = [NSNumber numberWithInt:0];
    double v32 = self->mStopAngle;
    *(float *)&double v32 = v32;
    v33 = [NSNumber numberWithFloat:v32];
    v34 = [NSNumber numberWithInt:1];
    v35 = objc_msgSend(v28, "dictionaryWithObjectsAndKeys:", v30, v31, v33, v34, 0);
    +[CMShapeRenderer renderCanonicalShape:251 fill:v27 stroke:0 adjustValues:v35 orientedBounds:v49 state:v48 drawingContext:self->super.mDrawingContext];

    v26 = v48;
  }
  [(OADOrientedBounds *)v49 bounds];
  double v36 = v57.origin.x;
  double v37 = v57.origin.y;
  double v38 = CGRectGetWidth(v57);
  __double2 v39 = __sincos_stret((self->mStartAngle + self->mStopAngle) * 0.5);
  -[CMDrawingContext transformRectToGroup:](self->super.mDrawingContext, "transformRectToGroup:", v36 + v38 * 0.5 + v38 / 3.0 * v39.__cosval - v38 / 6.0, v37 + v38 * 0.5 - v38 / 3.0 * v39.__sinval - v38 / 6.0, v38 / 3.0, v38 / 3.0);
  v40 = +[OADOrientedBounds orientedBoundsWithBounds:](OADOrientedBounds, "orientedBoundsWithBounds:");
  v41 = +[OIXMLElement elementWithType:3];
  v42 = objc_alloc_init(CMDrawableStyle);
  [v40 bounds];
  -[CMDrawableStyle addPositionProperties:](v42, "addPositionProperties:");
  [v47 addChild:v41];
  v50.receiver = self;
  v50.super_class = (Class)CMDiagramPointSegmentedPieMapper;
  [(CMMapper *)&v50 addStyleUsingGlobalCacheTo:v41 style:v42];
  [(CMDiagramPointMapper *)self mapTextAt:v41 withBounds:v40 isCentered:1 includeChildren:1 withState:v26];
}

- (id)transformPresentationName
{
  return self->super.mPresentationName;
}

@end