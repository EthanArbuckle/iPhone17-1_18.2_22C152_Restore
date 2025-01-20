@interface HKSHBatteryRing
- (HKSHBatteryRing)init;
- (HKSHBatteryRing)initWithFillFraction:(double)a3 radius:(double)a4 strokeWidth:(double)a5;
- (double)_validFillFraction:(double)a3;
- (double)backgroundRingAlpha;
- (double)fillFraction;
- (double)radius;
- (double)strokeWidth;
- (id)fillColor;
- (id)fillFractionString;
- (id)ringImage;
- (int64_t)fillFractionPercent;
- (void)setBackgroundRingAlpha:(double)a3;
- (void)setFillFraction:(double)a3;
- (void)setRadius:(double)a3;
- (void)setStrokeWidth:(double)a3;
@end

@implementation HKSHBatteryRing

- (HKSHBatteryRing)init
{
  return [(HKSHBatteryRing *)self initWithFillFraction:0.0 radius:0.0 strokeWidth:0.0];
}

- (HKSHBatteryRing)initWithFillFraction:(double)a3 radius:(double)a4 strokeWidth:(double)a5
{
  v12.receiver = self;
  v12.super_class = (Class)HKSHBatteryRing;
  v8 = [(HKSHBatteryRing *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(HKSHBatteryRing *)v8 _validFillFraction:a3];
    v9->_radius = a4;
    v9->_fillFraction = v10;
    v9->_strokeWidth = a5;
    v9->_backgroundRingAlpha = 0.200000003;
  }
  return v9;
}

- (id)ringImage
{
  double radius = self->_radius;
  double v4 = radius + self->_strokeWidth * -0.5;
  v14.width = radius + radius;
  double v5 = (self->_fillFraction + self->_fillFraction) * 3.14159274 + -1.57079637;
  v14.height = radius + radius;
  UIGraphicsBeginImageContextWithOptions(v14, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(CurrentContext, self->_strokeWidth);
  CGContextSetLineCap(CurrentContext, kCGLineCapRound);
  v7 = [(HKSHBatteryRing *)self fillColor];
  [v7 setStroke];
  CGContextAddArc(CurrentContext, radius, radius, v4, -1.57079637, v5, 0);
  CGContextStrokePath(CurrentContext);
  if (self->_fillFraction != 1.0)
  {
    v8 = (void *)ringImage_drainColor;
    if (!ringImage_drainColor)
    {
      uint64_t v9 = [v7 colorWithAlphaComponent:self->_backgroundRingAlpha];
      double v10 = (void *)ringImage_drainColor;
      ringImage_drainColor = v9;

      v8 = (void *)ringImage_drainColor;
    }
    [v8 setStroke];
    CGContextAddArc(CurrentContext, radius, radius, v4, v5, 4.71238899, 0);
    CGContextStrokePath(CurrentContext);
  }
  v11 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v11;
}

- (id)fillFractionString
{
  if (qword_1E9A5A678 != -1) {
    dispatch_once(&qword_1E9A5A678, &__block_literal_global_0);
  }
  v3 = (void *)_MergedGlobals_1;
  double v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[HKSHBatteryRing fillFractionPercent](self, "fillFractionPercent"));
  double v5 = [v3 stringFromNumber:v4];

  return v5;
}

void __37__HKSHBatteryRing_fillFractionString__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = (uint64_t)v0;

  [(id)_MergedGlobals_1 setNumberStyle:0];
  v2 = (void *)_MergedGlobals_1;
  id v3 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v2 setLocale:v3];
}

- (int64_t)fillFractionPercent
{
  return (uint64_t)(self->_fillFraction * 100.0);
}

- (id)fillColor
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1618], "hkshui_batteryColorForFillFraction:", self->_fillFraction);
}

- (double)_validFillFraction:(double)a3
{
  double v3 = 1.0;
  if (a3 <= 1.0) {
    double v3 = a3;
  }
  BOOL v4 = a3 < 0.0;
  double result = 0.0;
  if (!v4) {
    return v3;
  }
  return result;
}

- (double)fillFraction
{
  return self->_fillFraction;
}

- (void)setFillFraction:(double)a3
{
  self->_fillFraction = a3;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeWidth:(double)a3
{
  self->_strokeWidth = a3;
}

- (double)backgroundRingAlpha
{
  return self->_backgroundRingAlpha;
}

- (void)setBackgroundRingAlpha:(double)a3
{
  self->_backgroundRingAlpha = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_double radius = a3;
}

@end