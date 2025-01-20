@interface UISelectionGrabberCustomPath
- (BOOL)containsZeroPoint;
- (CGPoint)bottomPoint;
- (CGPoint)topPoint;
- (CGRect)boundingEdgeRect;
- (CGRect)boundingRect;
- (double)lineWidth;
- (id)bezierPathForHostView:(id)a3 targetView:(id)a4;
- (id)description;
- (id)summaryDescription;
- (void)setBottomPoint:(CGPoint)a3;
- (void)setLineWidth:(double)a3;
- (void)setTopPoint:(CGPoint)a3;
@end

@implementation UISelectionGrabberCustomPath

- (BOOL)containsZeroPoint
{
  [(UISelectionGrabberCustomPath *)self bottomPoint];
  double v5 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (v6 == *MEMORY[0x1E4F1DAD8] && v3 == v4) {
    return 1;
  }
  [(UISelectionGrabberCustomPath *)self topPoint];
  return v9 == v4 && v8 == v5;
}

- (CGRect)boundingRect
{
  [(UISelectionGrabberCustomPath *)self topPoint];
  double v4 = v3;
  double v6 = v5;
  [(UISelectionGrabberCustomPath *)self bottomPoint];
  if (v4 >= v7) {
    double v9 = v7;
  }
  else {
    double v9 = v4;
  }
  if (v4 >= v7) {
    double v7 = v4;
  }
  if (v6 >= v8) {
    double v10 = v8;
  }
  else {
    double v10 = v6;
  }
  if (v6 >= v8) {
    double v8 = v6;
  }
  double v11 = v7 - v9;
  double v12 = v8 - v10;
  double v13 = v9;
  double v14 = v10;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)boundingEdgeRect
{
  [(UISelectionGrabberCustomPath *)self boundingRect];
  double v5 = 1.0;
  result.size.height = v4;
  result.size.width = v5;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)summaryDescription
{
  double v3 = NSString;
  [(UISelectionGrabberCustomPath *)self topPoint];
  uint64_t v5 = (uint64_t)v4;
  [(UISelectionGrabberCustomPath *)self topPoint];
  uint64_t v7 = (uint64_t)v6;
  [(UISelectionGrabberCustomPath *)self bottomPoint];
  uint64_t v9 = (uint64_t)v8;
  [(UISelectionGrabberCustomPath *)self bottomPoint];
  uint64_t v11 = (uint64_t)v10;
  [(UISelectionGrabberCustomPath *)self lineWidth];
  return (id)[v3 stringWithFormat:@"top: [%ld, %ld] bottom: [%ld, %ld] lineWidth: %0.1f", v5, v7, v9, v11, v12];
}

- (id)description
{
  double v3 = NSString;
  [(UISelectionGrabberCustomPath *)self topPoint];
  uint64_t v5 = v4;
  [(UISelectionGrabberCustomPath *)self topPoint];
  uint64_t v7 = v6;
  [(UISelectionGrabberCustomPath *)self bottomPoint];
  uint64_t v9 = v8;
  [(UISelectionGrabberCustomPath *)self bottomPoint];
  uint64_t v11 = v10;
  [(UISelectionGrabberCustomPath *)self lineWidth];
  return (id)[v3 stringWithFormat:@"top    : %.2f %.2f \nbottom   : %.2f %.2f \nlineWidth %.1f", v5, v7, v9, v11, v12];
}

- (id)bezierPathForHostView:(id)a3 targetView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(UIBezierPath);
  [(UISelectionGrabberCustomPath *)self bottomPoint];
  objc_msgSend(v7, "convertPoint:toView:", v6);
  double v10 = v9;
  double v12 = v11;
  [(UISelectionGrabberCustomPath *)self topPoint];
  objc_msgSend(v7, "convertPoint:toView:", v6);
  double v14 = v13;
  double v16 = v15;

  -[UIBezierPath moveToPoint:](v8, "moveToPoint:", v10, v12);
  -[UIBezierPath addLineToPoint:](v8, "addLineToPoint:", v14, v16);
  return v8;
}

- (CGPoint)topPoint
{
  double x = self->_topPoint.x;
  double y = self->_topPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTopPoint:(CGPoint)a3
{
  self->_topPoint = a3;
}

- (CGPoint)bottomPoint
{
  double x = self->_bottomPoint.x;
  double y = self->_bottomPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setBottomPoint:(CGPoint)a3
{
  self->_bottomPoint = a3;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

@end