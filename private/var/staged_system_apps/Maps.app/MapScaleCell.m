@interface MapScaleCell
- (MapScaleCell)initWithDistanceInMeters:(double)a3;
- (id)_legendStringForDistanceString:(id)a3 index:(int)a4;
- (void)drawInRect:(CGRect)a3;
@end

@implementation MapScaleCell

- (MapScaleCell)initWithDistanceInMeters:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MapScaleCell;
  result = [(MapScaleCell *)&v5 init];
  if (result) {
    result->_distanceInMeters = a3;
  }
  return result;
}

- (id)_legendStringForDistanceString:(id)a3 index:(int)a4
{
  id v5 = a3;
  v6 = v5;
  switch(a4)
  {
    case 0:
      v9 = @"0";
      break;
    case 1:
      [v5 floatValue];
      goto LABEL_7;
    case 2:
      [v5 floatValue];
      float v8 = v10 + v10;
      goto LABEL_7;
    case 3:
    case 4:
      [v5 floatValue];
      float v8 = v7 * 3.0;
LABEL_7:
      v9 = +[NSString stringWithFormat:@"%g", v8];
      break;
    default:
      v9 = 0;
      break;
  }

  return v9;
}

- (void)drawInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v36 = +[UIColor whiteColor];
  id v8 = [objc_alloc((Class)UIColor) initWithRed:0.470588235 green:0.435294118 blue:0.345098039 alpha:1.0];
  id v9 = [objc_alloc((Class)UIColor) initWithWhite:0.0 alpha:0.800000012];
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(CurrentContext, 1.0);
  v38.origin.CGFloat x = x;
  v38.origin.CGFloat y = y;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = height;
  double v11 = CGRectGetWidth(v38);
  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = width;
  v39.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v39);
  CGFloat v35 = x;
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.CGFloat width = width;
  v40.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v40);
  v14 = +[NSString _mapkit_localizedDistanceStringWithMeters:(self->_distanceInMeters * 0.0625) abbreviated:0];
  v15 = [v14 componentsSeparatedByString:@" "];
  if ([v15 count])
  {
    v33 = v14;
    v34 = v9;
    double v16 = v11 * 0.0625;
    double v17 = MaxY + -16.0;
    double v18 = MinX + 12.0;
    v32 = v15;
    v19 = [v15 objectAtIndexedSubscript:0];
    v20 = +[UIFont systemFontOfSize:5.0];
    v21 = 0;
    uint64_t v22 = 0;
    char v23 = 1;
    while (1)
    {
      v41.size.CGFloat height = 2.0;
      v41.origin.CGFloat x = v18;
      v41.origin.CGFloat y = MaxY + -16.0;
      v41.size.CGFloat width = v16;
      double MaxX = CGRectGetMaxX(v41);
      v42.origin.CGFloat x = v35;
      v42.origin.CGFloat y = y;
      v42.size.CGFloat width = width;
      v42.size.CGFloat height = height;
      if (MaxX > CGRectGetMaxX(v42)) {
        break;
      }
      v25 = v36;
      if (v23) {
        v25 = v8;
      }
      [v25 set];
      v23 ^= 1u;
      v43.size.CGFloat height = 2.0;
      v43.origin.CGFloat x = v18;
      v43.origin.CGFloat y = MaxY + -16.0;
      v43.size.CGFloat width = v16;
      CGContextFillRect(CurrentContext, v43);
      v26 = [(MapScaleCell *)self _legendStringForDistanceString:v19 index:v22];

      v27 = +[UIColor blackColor];
      [v27 set];

      [v26 _maps_sizeWithFont:v20];
      [v26 _maps_drawAtPoint:v20 withFont:v18 + v28 * -0.5, v17 + -7.0];
      double v18 = v16 + v18;
      uint64_t v22 = (v22 + 1);
      v21 = v26;
      if (v22 == 4) {
        goto LABEL_9;
      }
    }
    v26 = v21;
LABEL_9:
    v29 = [(MapScaleCell *)self _legendStringForDistanceString:v19 index:v22];

    [v29 _maps_sizeWithFont:v20];
    [v29 _maps_drawAtPoint:v20 withFont:v18 + v30 * -0.5, v17 + -7.0];
    v15 = v32;
    v14 = v33;
    if ((unint64_t)[v32 count] >= 2)
    {
      v31 = [v32 objectAtIndexedSubscript:1];

      [v31 _maps_drawAtPoint:v20 withFont:v18 + 3.0, v17 + -3.0];
      v29 = v31;
    }
    id v9 = v34;
    [v34 set];
    v44.origin.CGFloat x = v35;
    v44.origin.CGFloat y = y;
    v44.size.CGFloat width = width;
    v44.size.CGFloat height = height;
    v45.origin.CGFloat x = CGRectGetMinX(v44) + 12.0;
    v45.size.CGFloat width = v16 * (double)(int)v22;
    v45.size.CGFloat height = 2.0;
    v45.origin.CGFloat y = MaxY + -16.0;
    CGContextStrokeRect(CurrentContext, v45);
  }
}

@end