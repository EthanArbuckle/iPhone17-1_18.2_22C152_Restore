@interface IPABestFitEvenTotalPixelCountImageSizePolicy
- (CGSize)transformSize:(CGSize)a3;
- (IPABestFitEvenTotalPixelCountImageSizePolicy)initWithTotalPixelCount:(int64_t)a3;
- (double)transformScaleForSize:(CGSize)a3;
- (id)description;
@end

@implementation IPABestFitEvenTotalPixelCountImageSizePolicy

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p> even pixels totalPixelCount=%ld", objc_opt_class(), self, 4 * self->super._totalPixelCount];
}

- (double)transformScaleForSize:(CGSize)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IPABestFitEvenTotalPixelCountImageSizePolicy;
  -[IPABestFitTotalPixelCountImageSizePolicy transformScaleForSize:](&v5, sel_transformScaleForSize_, a3.width, a3.height);
  return v3 + v3;
}

- (CGSize)transformSize:(CGSize)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IPABestFitEvenTotalPixelCountImageSizePolicy;
  -[IPABestFitTotalPixelCountImageSizePolicy transformSize:](&v7, sel_transformSize_, a3.width, a3.height);
  double v4 = v3 + v3;
  double v6 = v5 + v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (IPABestFitEvenTotalPixelCountImageSizePolicy)initWithTotalPixelCount:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IPABestFitEvenTotalPixelCountImageSizePolicy;
  return [(IPABestFitTotalPixelCountImageSizePolicy *)&v4 initWithTotalPixelCount:a3 / 4];
}

@end