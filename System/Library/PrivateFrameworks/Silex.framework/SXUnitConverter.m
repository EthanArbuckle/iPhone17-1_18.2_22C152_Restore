@interface SXUnitConverter
- (SXUnitConverter)initWithComponentWidth:(double)a3 parentWidth:(double)a4 documentGutter:(double)a5 documentMargin:(double)a6 viewportSize:(CGSize)a7 contentScaleFactor:(double)a8;
- (double)convertValueToPoints:(_SXConvertibleValue)a3;
- (double)convertValueToPoints:(_SXConvertibleValue)a3 allowNegativeValues:(BOOL)a4;
@end

@implementation SXUnitConverter

- (SXUnitConverter)initWithComponentWidth:(double)a3 parentWidth:(double)a4 documentGutter:(double)a5 documentMargin:(double)a6 viewportSize:(CGSize)a7 contentScaleFactor:(double)a8
{
  CGFloat height = a7.height;
  CGFloat width = a7.width;
  v16.receiver = self;
  v16.super_class = (Class)SXUnitConverter;
  result = [(SXUnitConverter *)&v16 init];
  if (result)
  {
    result->_componentWidth = a3;
    result->_parentWidth = a4;
    result->_documentGutter = a5;
    result->_documentMargin = a6;
    result->_viewportSize.CGFloat width = width;
    result->_viewportSize.CGFloat height = height;
    result->_contentScaleFactor = a8;
  }
  return result;
}

- (double)convertValueToPoints:(_SXConvertibleValue)a3
{
  -[SXUnitConverter convertValueToPoints:allowNegativeValues:](self, "convertValueToPoints:allowNegativeValues:", *(void *)&a3.value, a3.unit, 0);
  return result;
}

- (double)convertValueToPoints:(_SXConvertibleValue)a3 allowNegativeValues:(BOOL)a4
{
  double v4 = 0.0;
  if (a3.value > 0.0 || a4)
  {
    switch(a3.unit)
    {
      case 0uLL:
      case 1uLL:
        double v4 = self->_contentScaleFactor * a3.value;
        return round(v4);
      case 2uLL:
        if (!self) {
          goto LABEL_33;
        }
        double height = self->_viewportSize.height;
        goto LABEL_18;
      case 3uLL:
        if (!self) {
          goto LABEL_33;
        }
        double height = self->_viewportSize.width;
LABEL_18:
        double v7 = a3.value / 100.0;
        goto LABEL_22;
      case 4uLL:
        if (!self) {
          goto LABEL_33;
        }
        double height = self->_viewportSize.height;
        double v7 = a3.value / 100.0;
        if (height >= self->_viewportSize.width) {
          double height = self->_viewportSize.width;
        }
        goto LABEL_22;
      case 5uLL:
        if (self)
        {
          double height = self->_viewportSize.height;
          double v7 = a3.value / 100.0;
          if (height < self->_viewportSize.width) {
            double height = self->_viewportSize.width;
          }
LABEL_22:
          double v9 = v7 * height;
        }
        else
        {
LABEL_33:
          double v9 = 0.0;
        }
        double contentScaleFactor = self->_contentScaleFactor;
        goto LABEL_31;
      case 6uLL:
        if (!self) {
          return round(v4);
        }
        double contentScaleFactor = self->_documentGutter;
        goto LABEL_30;
      case 7uLL:
        if (!self) {
          return round(v4);
        }
        double contentScaleFactor = self->_componentWidth;
        goto LABEL_30;
      case 8uLL:
        if (!self) {
          return round(v4);
        }
        double contentScaleFactor = self->_documentMargin;
        goto LABEL_30;
      case 9uLL:
        if (!self) {
          return round(v4);
        }
        double contentScaleFactor = self->_parentWidth;
        if (contentScaleFactor <= 2.22044605e-16) {
          double contentScaleFactor = self->_viewportSize.width * self->_contentScaleFactor;
        }
LABEL_30:
        double v9 = a3.value / 100.0;
LABEL_31:
        double v4 = v9 * contentScaleFactor;
        break;
      default:
        return round(v4);
    }
  }
  return round(v4);
}

@end