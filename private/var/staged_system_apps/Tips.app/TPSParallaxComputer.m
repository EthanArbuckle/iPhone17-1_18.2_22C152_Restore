@interface TPSParallaxComputer
- (CGPoint)contentParallaxOffsetForViewFrame:(CGRect)a3 visibleRect:(CGRect)a4;
- (double)parallaxFactor;
- (int64_t)model;
- (unint64_t)axis;
- (void)setAxis:(unint64_t)a3;
- (void)setModel:(int64_t)a3;
- (void)setParallaxFactor:(double)a3;
@end

@implementation TPSParallaxComputer

- (CGPoint)contentParallaxOffsetForViewFrame:(CGRect)a3 visibleRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  if (!UIAccessibilityIsReduceMotionEnabled())
  {
    v32.origin.CGFloat x = v11;
    v32.origin.CGFloat y = v10;
    v32.size.CGFloat width = v9;
    v32.size.CGFloat height = v8;
    v41.origin.CGFloat x = x;
    v41.origin.CGFloat y = y;
    v41.size.CGFloat width = width;
    v41.size.CGFloat height = height;
    if (CGRectIntersectsRect(v32, v41))
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100033FD4;
      v30[3] = &unk_1000B7988;
      v30[4] = self;
      v13 = objc_retainBlock(v30);
      unsigned __int8 v14 = [(TPSParallaxComputer *)self axis];
      unsigned __int8 v15 = v14;
      CGFloat v29 = height;
      if (v14)
      {
        v37.origin.CGFloat x = v11;
        v37.origin.CGFloat y = v10;
        v37.size.CGFloat width = v9;
        v37.size.CGFloat height = v8;
        double MinX = CGRectGetMinX(v37);
        v38.origin.CGFloat x = v11;
        v38.origin.CGFloat y = v10;
        v38.size.CGFloat width = v9;
        v38.size.CGFloat height = v8;
        double MaxX = CGRectGetMaxX(v38);
        v39.origin.CGFloat x = x;
        v39.origin.CGFloat y = y;
        v39.size.CGFloat width = width;
        v39.size.CGFloat height = height;
        CGFloat v21 = CGRectGetMinX(v39);
        v40.size.CGFloat height = height;
        double v22 = v21;
        v40.origin.CGFloat x = x;
        v40.origin.CGFloat y = y;
        v40.size.CGFloat width = width;
        CGFloat v23 = CGRectGetMaxX(v40);
        CGFloat v16 = ((double (*)(void *, double, double, double, CGFloat))v13[2])(v13, MinX, MaxX, v22, v23);
        if ((v15 & 2) != 0) {
          goto LABEL_5;
        }
      }
      else
      {
        CGFloat v16 = CGPointZero.x;
        if ((v14 & 2) != 0)
        {
LABEL_5:
          v33.origin.CGFloat x = v11;
          v33.origin.CGFloat y = v10;
          v33.size.CGFloat width = v9;
          v33.size.CGFloat height = v8;
          double MinY = CGRectGetMinY(v33);
          v34.origin.CGFloat x = v11;
          v34.origin.CGFloat y = v10;
          v34.size.CGFloat width = v9;
          v34.size.CGFloat height = v8;
          double MaxY = CGRectGetMaxY(v34);
          v35.origin.CGFloat x = x;
          v35.origin.CGFloat y = y;
          v35.size.CGFloat width = width;
          v35.size.CGFloat height = v29;
          double v18 = CGRectGetMinY(v35);
          v36.origin.CGFloat x = x;
          v36.origin.CGFloat y = y;
          v36.size.CGFloat width = width;
          v36.size.CGFloat height = v29;
          CGFloat v19 = CGRectGetMaxY(v36);
          CGFloat v20 = ((double (*)(void *, double, double, double, CGFloat))v13[2])(v13, MinY, MaxY, v18, v19);
LABEL_9:

          goto LABEL_10;
        }
      }
      CGFloat v20 = CGPointZero.y;
      goto LABEL_9;
    }
  }
  CGFloat v16 = CGPointZero.x;
  CGFloat v20 = CGPointZero.y;
LABEL_10:
  double v24 = v16;
  double v25 = v20;
  result.CGFloat y = v25;
  result.CGFloat x = v24;
  return result;
}

- (int64_t)model
{
  return self->_model;
}

- (void)setModel:(int64_t)a3
{
  self->_model = a3;
}

- (double)parallaxFactor
{
  return self->_parallaxFactor;
}

- (void)setParallaxFactor:(double)a3
{
  self->_parallaxFactor = a3;
}

- (unint64_t)axis
{
  return self->_axis;
}

- (void)setAxis:(unint64_t)a3
{
  self->_axis = a3;
}

@end