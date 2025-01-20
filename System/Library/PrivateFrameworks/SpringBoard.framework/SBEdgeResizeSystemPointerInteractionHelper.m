@interface SBEdgeResizeSystemPointerInteractionHelper
+ (BOOL)shouldBeginPointerInteractionAtLocation:(CGPoint)a3 frame:(CGRect)a4 innerLengthOfInteractionRegion:(double)a5 outerLengthOfInteractionRegion:(double)a6 cornerLengthOfInteractionRegion:(double)a7 occupiedCorners:(unint64_t)a8 hoveringOverEdge:(unint64_t *)a9 pointerRegion:(CGRect *)a10;
+ (id)fancyResizePointerShapeHoveringOverEdge:(unint64_t)a3 innerLengthOfInteractionRegion:(double)a4 outerLengthOfInteractionRegion:(double)a5 cornerRadii:(UIRectCornerRadii)a6;
+ (unint64_t)latchingAxesForHoveredEdge:(unint64_t)a3;
@end

@implementation SBEdgeResizeSystemPointerInteractionHelper

+ (BOOL)shouldBeginPointerInteractionAtLocation:(CGPoint)a3 frame:(CGRect)a4 innerLengthOfInteractionRegion:(double)a5 outerLengthOfInteractionRegion:(double)a6 cornerLengthOfInteractionRegion:(double)a7 occupiedCorners:(unint64_t)a8 hoveringOverEdge:(unint64_t *)a9 pointerRegion:(CGRect *)a10
{
  char v12 = a8;
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  CGFloat v18 = a5 + a6;
  SBRectWithSize();
  v40.origin.CGFloat x = -a6;
  CGFloat v19 = v18;
  CGFloat v20 = v40.origin.x;
  double v21 = height + a7 * -2.0;
  v40.origin.CGFloat y = a7;
  v40.size.double width = v19;
  v40.size.double height = v21;
  v32.CGFloat x = x;
  v32.CGFloat y = y;
  if (CGRectContainsPoint(v40, v32))
  {
    BOOL result = 1;
    unint64_t v23 = 3;
    double v24 = v19;
    double v25 = a7;
    double v26 = v20;
    goto LABEL_22;
  }
  double v30 = height;
  double v26 = width - a5;
  v41.origin.CGFloat x = width - a5;
  v41.origin.CGFloat y = a7;
  v41.size.double width = v19;
  v41.size.double height = v21;
  v33.CGFloat x = x;
  v33.CGFloat y = y;
  if (CGRectContainsPoint(v41, v33))
  {
    BOOL result = 1;
    unint64_t v23 = 4;
    double v24 = v19;
    double v25 = a7;
    goto LABEL_22;
  }
  double v21 = v19;
  double v25 = v30 - a5;
  CGFloat v27 = y;
  double v24 = width + -a7 * 2.0;
  v42.origin.CGFloat x = a7;
  v42.origin.CGFloat y = v25;
  v42.size.double width = v24;
  v42.size.double height = v21;
  v34.CGFloat x = x;
  v34.CGFloat y = v27;
  if (CGRectContainsPoint(v42, v34))
  {
    BOOL result = 1;
    unint64_t v23 = 2;
    double v26 = a7;
    goto LABEL_22;
  }
  double v26 = a7;
  v43.origin.CGFloat x = a7;
  CGFloat v29 = v20;
  v43.origin.CGFloat y = v20;
  v43.size.double width = width + -a7 * 2.0;
  CGFloat v28 = v21;
  v43.size.double height = v21;
  v35.CGFloat x = x;
  v35.CGFloat y = v27;
  BOOL result = CGRectContainsPoint(v43, v35);
  unint64_t v23 = 1;
  if ((v12 & 8) == 0)
  {
    if (!result)
    {
      UIRectCenteredAboutPoint();
      double v26 = v44.origin.x;
      double v24 = v44.size.width;
      CGFloat v28 = v44.size.height;
      CGFloat v29 = v44.origin.y;
      v36.CGFloat y = v27;
      v36.CGFloat x = x;
      BOOL result = CGRectContainsPoint(v44, v36);
      unint64_t v23 = 8;
    }
    if ((v12 & 4) != 0) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if ((v12 & 4) == 0)
  {
LABEL_13:
    if (!result)
    {
      UIRectCenteredAboutPoint();
      double v26 = v45.origin.x;
      double v24 = v45.size.width;
      CGFloat v28 = v45.size.height;
      CGFloat v29 = v45.origin.y;
      v37.CGFloat y = v27;
      v37.CGFloat x = x;
      BOOL result = CGRectContainsPoint(v45, v37);
      unint64_t v23 = 7;
    }
  }
LABEL_15:
  if ((v12 & 2) == 0 && !result)
  {
    UIRectCenteredAboutPoint();
    double v26 = v46.origin.x;
    double v24 = v46.size.width;
    CGFloat v28 = v46.size.height;
    CGFloat v29 = v46.origin.y;
    v38.CGFloat y = v27;
    v38.CGFloat x = x;
    BOOL result = CGRectContainsPoint(v46, v38);
    unint64_t v23 = 6;
  }
  double v21 = v28;
  if (v12)
  {
    double v25 = v29;
  }
  else
  {
    double v25 = v29;
    if (!result)
    {
      UIRectCenteredAboutPoint();
      double v26 = v47.origin.x;
      double v25 = v47.origin.y;
      double v24 = v47.size.width;
      double v21 = v47.size.height;
      v39.CGFloat y = v27;
      v39.CGFloat x = x;
      BOOL result = CGRectContainsPoint(v47, v39);
      unint64_t v23 = 5;
    }
  }
LABEL_22:
  *a9 = v23;
  a10->origin.CGFloat x = v26;
  a10->origin.CGFloat y = v25;
  a10->size.double width = v24;
  a10->size.double height = v21;
  return result;
}

+ (id)fancyResizePointerShapeHoveringOverEdge:(unint64_t)a3 innerLengthOfInteractionRegion:(double)a4 outerLengthOfInteractionRegion:(double)a5 cornerRadii:(UIRectCornerRadii)a6
{
  double topRight = a6.topRight;
  double bottomRight = a6.bottomRight;
  double bottomLeft = a6.bottomLeft;
  double topLeft = a6.topLeft;
  Mutable = CGPathCreateMutable();
  CGFloat v14 = 1.57079633;
  switch(a3)
  {
    case 1uLL:
      CGFloat v14 = -1.57079633;
      goto LABEL_5;
    case 2uLL:
      goto LABEL_5;
    case 3uLL:
      CGFloat v14 = 3.14159265;
      goto LABEL_5;
    case 5uLL:
      CGFloat v14 = -2.35619449;
      double bottomRight = topLeft;
      goto LABEL_10;
    case 6uLL:
      CGFloat v14 = -0.785398163;
      double bottomRight = topRight;
      goto LABEL_10;
    case 7uLL:
      CGFloat v14 = 2.35619449;
      double bottomRight = bottomLeft;
      goto LABEL_10;
    case 8uLL:
      CGFloat v14 = 0.785398163;
LABEL_10:
      double v15 = bottomRight - sqrt(bottomRight * bottomRight + bottomRight * bottomRight);
      break;
    default:
      CGFloat v14 = 0.0;
LABEL_5:
      double v15 = (a4 - a5) * 0.5;
      break;
  }
  memset(&m, 0, sizeof(m));
  CGAffineTransformMakeRotation(&v19, v14);
  CGAffineTransformTranslate(&m, &v19, v15, 0.0);
  CGPathMoveToPoint(Mutable, &m, -3.0, 0.0);
  CGPathAddArcToPoint(Mutable, &m, -3.0, 8.0, -19.8947368, 0.0, 2.0);
  CGPathAddArcToPoint(Mutable, &m, -19.8947368, 0.0, -3.0, -8.0, 2.0);
  CGPathAddArcToPoint(Mutable, &m, -3.0, -8.0, -3.0, 8.0, 2.0);
  CGPathCloseSubpath(Mutable);
  CGPathMoveToPoint(Mutable, &m, 3.0, 0.0);
  CGPathAddArcToPoint(Mutable, &m, 3.0, 8.0, 19.8947368, 0.0, 2.0);
  CGPathAddArcToPoint(Mutable, &m, 19.8947368, 0.0, 3.0, -8.0, 2.0);
  CGPathAddArcToPoint(Mutable, &m, 3.0, -8.0, 3.0, 8.0, 2.0);
  CGPathCloseSubpath(Mutable);
  id v16 = objc_alloc_init(MEMORY[0x1E4F427D0]);
  [v16 setCGPath:Mutable];
  CGPathRelease(Mutable);
  v17 = [MEMORY[0x1E4F42CB8] shapeWithPath:v16];

  return v17;
}

+ (unint64_t)latchingAxesForHoveredEdge:(unint64_t)a3
{
  if (a3 - 1 > 7) {
    return 0;
  }
  else {
    return qword_1D8FD2A48[a3 - 1];
  }
}

@end