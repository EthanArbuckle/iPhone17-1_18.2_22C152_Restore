@interface _UIStatusBarCellularSmallSignalView
+ (double)_barCornerRadiusForIconSize:(int64_t)a3;
+ (double)_barWidthForIconSize:(int64_t)a3;
+ (double)_heightForNormalBarAtIndex:(int64_t)a3 iconSize:(int64_t)a4;
+ (double)_interspaceForIconSize:(int64_t)a3;
@end

@implementation _UIStatusBarCellularSmallSignalView

+ (double)_barWidthForIconSize:(int64_t)a3
{
  if (_UIGetSecondarySIMUnderBaseline())
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS____UIStatusBarCellularSmallSignalView;
    objc_msgSendSuper2(&v6, sel__barWidthForIconSize_, a3);
  }
  else
  {
    double result = 0.0;
    if ((unint64_t)(a3 - 1) <= 0x10) {
      return dbl_186B9CA20[a3 - 1];
    }
  }
  return result;
}

+ (double)_heightForNormalBarAtIndex:(int64_t)a3 iconSize:(int64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (_UIGetSecondarySIMUnderBaseline())
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS____UIStatusBarCellularSmallSignalView;
    objc_msgSendSuper2(&v10, sel__heightForNormalBarAtIndex_iconSize_, a3, a4);
  }
  else
  {
    double result = 0.0;
    switch(a4)
    {
      case 1:
        long long v11 = xmmword_186B9A4B0;
        long long v12 = xmmword_186B9A3A0;
        uint64_t v9 = 0x4032000000000000;
        goto LABEL_11;
      case 2:
      case 3:
        long long v11 = xmmword_186B9A680;
        long long v12 = xmmword_186B9C9B0;
        uint64_t v8 = 0x4039000000000000;
        goto LABEL_13;
      case 4:
      case 6:
        long long v11 = xmmword_186B9A6C0;
        long long v12 = xmmword_186B9CA00;
        uint64_t v8 = 0x403B000000000000;
        goto LABEL_13;
      case 5:
        long long v11 = xmmword_186B9A4B0;
        long long v12 = xmmword_186B9CA10;
        uint64_t v9 = 0x4034000000000000;
        goto LABEL_11;
      case 7:
        long long v11 = xmmword_186B9A3A0;
        long long v12 = xmmword_186B9AF50;
        uint64_t v8 = 0x403E000000000000;
        goto LABEL_13;
      case 8:
        long long v11 = xmmword_186B9C9F0;
        long long v12 = xmmword_186B9C7F0;
        uint64_t v8 = 0x4040000000000000;
        goto LABEL_13;
      case 16:
        long long v11 = xmmword_186B9C9E0;
        long long v12 = xmmword_186B9C800;
        uint64_t v9 = 0x402C000000000000;
LABEL_11:
        uint64_t v13 = v9;
        double result = *((double *)&v11 + a3) * 0.5;
        break;
      case 17:
        long long v11 = xmmword_186B9C9C0;
        long long v12 = xmmword_186B9C9D0;
        uint64_t v8 = 0x4035000000000000;
LABEL_13:
        uint64_t v13 = v8;
        double result = *((double *)&v11 + a3) / 3.0;
        break;
      default:
        return result;
    }
  }
  return result;
}

+ (double)_barCornerRadiusForIconSize:(int64_t)a3
{
  if (_UIGetSecondarySIMUnderBaseline())
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS____UIStatusBarCellularSmallSignalView;
    objc_msgSendSuper2(&v6, sel__barCornerRadiusForIconSize_, a3);
  }
  else
  {
    double result = 0.0;
    if ((unint64_t)(a3 - 1) <= 0x10) {
      return dbl_186B9CAA8[a3 - 1];
    }
  }
  return result;
}

+ (double)_interspaceForIconSize:(int64_t)a3
{
  if (_UIGetSecondarySIMUnderBaseline())
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS____UIStatusBarCellularSmallSignalView;
    objc_msgSendSuper2(&v6, sel__interspaceForIconSize_, a3);
  }
  else
  {
    double result = 0.0;
    if ((unint64_t)(a3 - 1) <= 0x10) {
      return dbl_186B9CB30[a3 - 1];
    }
  }
  return result;
}

@end