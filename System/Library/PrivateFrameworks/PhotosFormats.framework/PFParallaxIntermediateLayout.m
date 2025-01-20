@interface PFParallaxIntermediateLayout
- (BOOL)clockOverlapAcceptableForLayoutConfiguration:(id)a3;
- (BOOL)hasTopEdgeContact;
- (CGRect)inactiveRect;
- (CGRect)visibleRect;
- (NSString)debugStub;
- (PFParallaxIntermediateLayout)initWithVisibleRect:(CGRect)a3;
- (PFParallaxIntermediateLayout)initWithVisibleRect:(CGRect)a3 inactiveRect:(CGRect)a4 zoomStrategy:(unint64_t)a5 overlapStrategy:(unint64_t)a6 parallaxStrategy:(unint64_t)a7 inactiveStrategy:(unint64_t)a8 headroomStrategy:(unint64_t)a9;
- (PFParallaxIntermediateLayout)initWithVisibleRect:(CGRect)a3 inactiveRect:(CGRect)a4 zoomStrategy:(unint64_t)a5 overlapStrategy:(unint64_t)a6 parallaxStrategy:(unint64_t)a7 inactiveStrategy:(unint64_t)a8 headroomStrategy:(unint64_t)a9 cropScore:(double)a10 layoutScore:(double)a11 timeBottomOverlap:(double)a12 timeTopOverlap:(double)a13 unsafeAreaOverlap:(double)a14 uninflatedUnsafeAreaOverlap:(double)a15 hasTopEdgeContact:(BOOL)a16;
- (double)clockOverlapAcceptabilityForLayoutConfiguration:(id)a3 inflated:(BOOL)a4;
- (double)cropScore;
- (double)layoutScore;
- (double)timeBottomOverlap;
- (double)timeTopOverlap;
- (double)uninflatedUnsafeAreaOverlap;
- (double)unsafeAreaOverlap;
- (id)debugDescription;
- (unint64_t)headroomStrategy;
- (unint64_t)inactiveStrategy;
- (unint64_t)overlapStrategy;
- (unint64_t)parallaxStrategy;
- (unint64_t)zoomStrategy;
@end

@implementation PFParallaxIntermediateLayout

- (BOOL)hasTopEdgeContact
{
  return self->_hasTopEdgeContact;
}

- (double)uninflatedUnsafeAreaOverlap
{
  return self->_uninflatedUnsafeAreaOverlap;
}

- (double)unsafeAreaOverlap
{
  return self->_unsafeAreaOverlap;
}

- (double)timeTopOverlap
{
  return self->_timeTopOverlap;
}

- (double)timeBottomOverlap
{
  return self->_timeBottomOverlap;
}

- (double)layoutScore
{
  return self->_layoutScore;
}

- (double)cropScore
{
  return self->_cropScore;
}

- (unint64_t)headroomStrategy
{
  return self->_headroomStrategy;
}

- (unint64_t)inactiveStrategy
{
  return self->_inactiveStrategy;
}

- (unint64_t)parallaxStrategy
{
  return self->_parallaxStrategy;
}

- (unint64_t)overlapStrategy
{
  return self->_overlapStrategy;
}

- (unint64_t)zoomStrategy
{
  return self->_zoomStrategy;
}

- (CGRect)inactiveRect
{
  double x = self->_inactiveRect.origin.x;
  double y = self->_inactiveRect.origin.y;
  double width = self->_inactiveRect.size.width;
  double height = self->_inactiveRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)visibleRect
{
  double x = self->_visibleRect.origin.x;
  double y = self->_visibleRect.origin.y;
  double width = self->_visibleRect.size.width;
  double height = self->_visibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)debugDescription
{
  v3 = operator||([(PFParallaxIntermediateLayout *)self zoomStrategy], 0);
  v4 = OverlapStrategyDescription([(PFParallaxIntermediateLayout *)self overlapStrategy], 0);
  v5 = ParallaxStrategyDescription([(PFParallaxIntermediateLayout *)self parallaxStrategy], 0);
  v6 = InactiveStrategyDescription([(PFParallaxIntermediateLayout *)self inactiveStrategy], 0);
  v7 = [(PFParallaxIntermediateLayout *)self debugStub];
  v8 = NSString;
  v31.receiver = self;
  v31.super_class = (Class)PFParallaxIntermediateLayout;
  v9 = [(PFParallaxIntermediateLayout *)&v31 debugDescription];
  [(PFParallaxIntermediateLayout *)self visibleRect];
  uint64_t v30 = v10;
  [(PFParallaxIntermediateLayout *)self visibleRect];
  uint64_t v12 = v11;
  [(PFParallaxIntermediateLayout *)self visibleRect];
  uint64_t v14 = v13;
  [(PFParallaxIntermediateLayout *)self visibleRect];
  uint64_t v16 = v15;
  [(PFParallaxIntermediateLayout *)self cropScore];
  uint64_t v18 = v17;
  [(PFParallaxIntermediateLayout *)self layoutScore];
  uint64_t v20 = v19;
  [(PFParallaxIntermediateLayout *)self timeBottomOverlap];
  uint64_t v22 = v21;
  [(PFParallaxIntermediateLayout *)self timeTopOverlap];
  uint64_t v24 = v23;
  [(PFParallaxIntermediateLayout *)self unsafeAreaOverlap];
  uint64_t v26 = v25;
  [(PFParallaxIntermediateLayout *)self uninflatedUnsafeAreaOverlap];
  v28 = [v8 stringWithFormat:@"%@ vis:%.0f,%.0f %.0fx%.0f stub:%@ z:%@ o:%@ p:%@ i:%@ scores, crop:%.2f layout:%.2f bot:%.2f top:%.2f unsafe:%.2f uninfunsafe:%.2f", v9, v30, v12, v14, v16, v7, v3, v4, v5, v6, v18, v20, v22, v24, v26, v27];

  return v28;
}

- (NSString)debugStub
{
  v3 = operator||([(PFParallaxIntermediateLayout *)self zoomStrategy], 1);
  v4 = OverlapStrategyDescription([(PFParallaxIntermediateLayout *)self overlapStrategy], 1);
  v5 = ParallaxStrategyDescription([(PFParallaxIntermediateLayout *)self parallaxStrategy], 1);
  v6 = InactiveStrategyDescription([(PFParallaxIntermediateLayout *)self inactiveStrategy], 1);
  v7 = [NSString stringWithFormat:@"%@%@%@%@", v3, v4, v5, v6];

  return (NSString *)v7;
}

- (double)clockOverlapAcceptabilityForLayoutConfiguration:(id)a3 inflated:(BOOL)a4
{
  BOOL v4 = a4;
  [a3 timeOverlapCheckTop];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(PFParallaxIntermediateLayout *)self visibleRect];
  +[PFParallaxLayoutUtilities timeOverlapCheckThresholdForTopRect:isInteractive:](PFParallaxLayoutUtilities, "timeOverlapCheckThresholdForTopRect:isInteractive:", 0, v14 + v7 * v15, v16 + v9 * v17, v11 * v15, v13 * v17);
  double v19 = v18;
  if (v4) {
    [(PFParallaxIntermediateLayout *)self unsafeAreaOverlap];
  }
  else {
    [(PFParallaxIntermediateLayout *)self uninflatedUnsafeAreaOverlap];
  }
  double v21 = v20;
  unint64_t v22 = [(PFParallaxIntermediateLayout *)self overlapStrategy];
  double result = 0.0;
  switch(v22)
  {
    case 0uLL:
      return result;
    case 1uLL:
    case 3uLL:
    case 4uLL:
      goto LABEL_5;
    case 2uLL:
      [(PFParallaxIntermediateLayout *)self timeBottomOverlap];
      if (v24 <= 0.0) {
        goto LABEL_5;
      }
      [(PFParallaxIntermediateLayout *)self timeBottomOverlap];
      double v26 = v25;
      uint64_t v27 = +[PFParallaxLayoutTextOverlapParameters systemParameters];
      [v27 maxBottomOverlap];
      if (v26 >= v28)
      {
      }
      else
      {
        [(PFParallaxIntermediateLayout *)self timeTopOverlap];
        double v30 = v29;

        double result = 1.0;
        if (v30 < v19) {
          return result;
        }
      }
LABEL_5:
      double result = 0.75;
      if (v21 >= 0.01) {
        return fmax(((v21 + -0.01) / -0.99 + 1.0) * 0.5, 0.0);
      }
      return result;
    default:
      return fmax(((v21 + -0.01) / -0.99 + 1.0) * 0.5, 0.0);
  }
}

- (BOOL)clockOverlapAcceptableForLayoutConfiguration:(id)a3
{
  [(PFParallaxIntermediateLayout *)self clockOverlapAcceptabilityForLayoutConfiguration:a3 inflated:1];
  return v3 > 0.5;
}

- (PFParallaxIntermediateLayout)initWithVisibleRect:(CGRect)a3
{
  return -[PFParallaxIntermediateLayout initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:](self, "initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:", 0, 0, 0, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PFParallaxIntermediateLayout)initWithVisibleRect:(CGRect)a3 inactiveRect:(CGRect)a4 zoomStrategy:(unint64_t)a5 overlapStrategy:(unint64_t)a6 parallaxStrategy:(unint64_t)a7 inactiveStrategy:(unint64_t)a8 headroomStrategy:(unint64_t)a9
{
  return -[PFParallaxIntermediateLayout initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:cropScore:layoutScore:timeBottomOverlap:timeTopOverlap:unsafeAreaOverlap:uninflatedUnsafeAreaOverlap:hasTopEdgeContact:](self, "initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:cropScore:layoutScore:timeBottomOverlap:timeTopOverlap:unsafeAreaOverlap:uninflatedUnsafeAreaOverlap:hasTopEdgeContact:", a5, a6, a7, a8, a9, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, 0, 0,
           0,
           0,
           0,
           0);
}

- (PFParallaxIntermediateLayout)initWithVisibleRect:(CGRect)a3 inactiveRect:(CGRect)a4 zoomStrategy:(unint64_t)a5 overlapStrategy:(unint64_t)a6 parallaxStrategy:(unint64_t)a7 inactiveStrategy:(unint64_t)a8 headroomStrategy:(unint64_t)a9 cropScore:(double)a10 layoutScore:(double)a11 timeBottomOverlap:(double)a12 timeTopOverlap:(double)a13 unsafeAreaOverlap:(double)a14 uninflatedUnsafeAreaOverlap:(double)a15 hasTopEdgeContact:(BOOL)a16
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v25 = a3.size.height;
  CGFloat v26 = a3.size.width;
  CGFloat v27 = a3.origin.y;
  CGFloat v28 = a3.origin.x;
  v31.receiver = self;
  v31.super_class = (Class)PFParallaxIntermediateLayout;
  double result = [(PFParallaxIntermediateLayout *)&v31 init];
  result->_visibleRect.origin.CGFloat x = v28;
  result->_visibleRect.origin.CGFloat y = v27;
  result->_visibleRect.size.CGFloat width = v26;
  result->_visibleRect.size.CGFloat height = v25;
  result->_inactiveRect.origin.CGFloat x = x;
  result->_inactiveRect.origin.CGFloat y = y;
  result->_inactiveRect.size.CGFloat width = width;
  result->_inactiveRect.size.CGFloat height = height;
  result->_zoomStrategCGFloat y = a5;
  result->_overlapStrategCGFloat y = a6;
  result->_parallaxStrategCGFloat y = a7;
  result->_inactiveStrategCGFloat y = a8;
  result->_headroomStrategCGFloat y = a9;
  *(_OWORD *)&result->_cropScore = *(_OWORD *)&a10;
  *(_OWORD *)&result->_timeBottomOverlap = *(_OWORD *)&a12;
  result->_unsafeAreaOverlap = a14;
  result->_uninflatedUnsafeAreaOverlap = a15;
  result->_hasTopEdgeContact = a16;
  return result;
}

@end