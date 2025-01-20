@interface IPABestFitEvenWidthTotalPixelCountImageSizePolicy
- (CGSize)transformSize:(CGSize)a3;
@end

@implementation IPABestFitEvenWidthTotalPixelCountImageSizePolicy

- (CGSize)transformSize:(CGSize)a3
{
  if (a3.width == 0.0 || a3.height == 0.0)
  {
    double height = a3.height;
    double width = a3.width;
  }
  else
  {
    double totalPixelCount = (double)self->super._totalPixelCount;
    double v4 = sqrt(totalPixelCount / (a3.width / a3.height));
    double v5 = (double)(uint64_t)floor(v4);
    unint64_t v6 = vcvtpd_s64_f64(a3.width / a3.height * v5);
    uint64_t v7 = v6 - ((v6 & 0x8000000000000001) == 1);
    unint64_t v8 = vcvtmd_s64_f64(sqrt(a3.width / a3.height * totalPixelCount));
    uint64_t v9 = v8 - ((v8 & 0x8000000000000001) == 1);
    uint64_t v10 = vcvtpd_s64_f64((double)v9 / (a3.width / a3.height));
    if ((uint64_t)(v7 * vcvtmd_s64_f64(v4)) >= v9 * v10)
    {
      double width = (double)v7;
      double height = v5;
      if (v5 * (double)v7 > totalPixelCount)
      {
        double height = (double)v10;
        double width = (double)v9;
      }
    }
    else
    {
      double height = (double)v10;
      double width = (double)v9;
      if ((double)v9 * (double)v10 > totalPixelCount)
      {
        double width = (double)v7;
        double height = v5;
      }
    }
    if (width > a3.width || height > a3.height)
    {
      if (((int)a3.width & 0x80000001) == 1) {
        double width = a3.width + -1.0;
      }
      else {
        double width = a3.width;
      }
      double height = a3.height;
    }
  }
  double v14 = width;
  double v15 = height;
  result.double height = v15;
  result.double width = v14;
  return result;
}

@end