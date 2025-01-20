@interface OBStyle
+ (CGSize)sheetSizeForParentWindowSize:(CGSize)a3;
@end

@implementation OBStyle

+ (CGSize)sheetSizeForParentWindowSize:(CGSize)a3
{
  BOOL v3 = a3.height == *(double *)(MEMORY[0x1E4F1DB30] + 8) && a3.width == *MEMORY[0x1E4F1DB30];
  double v4 = fmax(a3.height * 0.88, 546.0);
  if (v3) {
    double v4 = 546.0;
  }
  double v5 = fmin(v4, 600.0);
  double v6 = 482.0;
  result.height = v5;
  result.width = v6;
  return result;
}

@end