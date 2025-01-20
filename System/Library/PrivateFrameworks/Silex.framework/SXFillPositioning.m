@interface SXFillPositioning
+ (CGRect)frameForFillWithDimensions:(CGSize)a3 withinBounds:(CGSize)a4 fillMode:(unint64_t)a5 horizontalAlignment:(unint64_t)a6 verticalAlignment:(unint64_t)a7;
@end

@implementation SXFillPositioning

+ (CGRect)frameForFillWithDimensions:(CGSize)a3 withinBounds:(CGSize)a4 fillMode:(unint64_t)a5 horizontalAlignment:(unint64_t)a6 verticalAlignment:(unint64_t)a7
{
  double height = a3.height;
  double v8 = *(double *)(MEMORY[0x263F001B0] + 8);
  double v9 = 0.0;
  BOOL v10 = *MEMORY[0x263F001B0] == a3.width && v8 == height;
  if (v10 || ((double width = a4.width, *MEMORY[0x263F001B0] == a4.width) ? (v12 = v8 == a4.height) : (v12 = 0), v12))
  {
    double v15 = 0.0;
    goto LABEL_25;
  }
  double v13 = a4.height;
  if (a5)
  {
    if (a5 != 1) {
      goto LABEL_18;
    }
    double v14 = a4.width / a3.width;
    if (a4.width / a3.width < a4.height / height) {
      double v14 = a4.height / height;
    }
  }
  else
  {
    double v14 = a4.width / a3.width;
    if (a4.width / a3.width >= a4.height / height) {
      double v14 = a4.height / height;
    }
  }
  a4.double width = a3.width * v14;
  a4.double height = height * v14;
LABEL_18:
  double v9 = v13 - a4.height;
  if (a7 != 2)
  {
    double v9 = v9 * 0.5;
    if (a7 != 1) {
      double v9 = 0.0;
    }
  }
  if (a6 == 2)
  {
    double v15 = width - a4.width;
  }
  else
  {
    double v15 = 0.0;
    if (a6 == 1) {
      double v15 = (width - a4.width) * 0.5;
    }
  }
LABEL_25:
  result.size.double height = a4.height;
  result.size.double width = a4.width;
  result.origin.y = v9;
  result.origin.x = v15;
  return result;
}

@end