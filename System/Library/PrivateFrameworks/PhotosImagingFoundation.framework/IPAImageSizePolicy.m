@interface IPAImageSizePolicy
+ (id)bestFitPolicyInSize:(CGSize)a3;
+ (id)bestFitPolicyInSquare:(double)a3;
+ (id)bestFitPolicyShortestEdge:(double)a3;
+ (id)bestFitPolicyThumbnail;
+ (id)bestFitPolicyWithEvenTotalPixelCount:(int64_t)a3;
+ (id)bestFitPolicyWithEvenWidthTotalPixelCount:(int64_t)a3;
+ (id)bestFitPolicyWithHeight:(double)a3;
+ (id)bestFitPolicyWithNominalShortSide:(int64_t)a3 minLongSide:(int64_t)a4 maxLongSide:(int64_t)a5;
+ (id)bestFitPolicyWithTotalPixelCount:(int64_t)a3;
+ (id)bestFitPolicyWithWidth:(double)a3;
+ (id)largestPolicyWithPolicies:(id)a3;
+ (id)originalSizePolicy;
+ (id)scalePolicyWithScale:(double)a3;
- (BOOL)isBestFitPolicy;
- (BOOL)isOriginalSizePolicy;
- (IPAImageSizePolicy)initWithCoder:(id)a3;
- (PFIntSize_st)integralTransformSize:(CGSize)a3;
- (double)transformScaleForSize:(CGSize)a3;
@end

@implementation IPAImageSizePolicy

- (IPAImageSizePolicy)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)IPAImageSizePolicy;
  return [(IPAImageSizePolicy *)&v4 init];
}

- (BOOL)isOriginalSizePolicy
{
  return 0;
}

- (BOOL)isBestFitPolicy
{
  return 0;
}

- (double)transformScaleForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[IPAImageSizePolicy transformSize:](self, "transformSize:");
  double result = v5 / width;
  double v8 = v7 / height;
  if (result >= v8) {
    return v8;
  }
  return result;
}

- (PFIntSize_st)integralTransformSize:(CGSize)a3
{
  -[IPAImageSizePolicy transformSize:](self, "transformSize:", a3.width, a3.height);
  unint64_t v4 = vcvtad_u64_f64(v3);
  unint64_t v6 = vcvtad_u64_f64(v5);
  result.double height = v6;
  result.double width = v4;
  return result;
}

+ (id)bestFitPolicyWithNominalShortSide:(int64_t)a3 minLongSide:(int64_t)a4 maxLongSide:(int64_t)a5
{
  double v5 = [[IPABestFitShortSideWithLongSideLimit alloc] initWithNominalShortSide:a3 minLongSide:a4 maxLongSide:a5];
  return v5;
}

+ (id)largestPolicyWithPolicies:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [[IPAAggregateLargestImageSizePolicy alloc] initWithPolicies:v3];

  return v4;
}

+ (id)bestFitPolicyWithEvenWidthTotalPixelCount:(int64_t)a3
{
  id v3 = [(IPABestFitTotalPixelCountImageSizePolicy *)[IPABestFitEvenWidthTotalPixelCountImageSizePolicy alloc] initWithTotalPixelCount:a3];
  return v3;
}

+ (id)bestFitPolicyWithEvenTotalPixelCount:(int64_t)a3
{
  id v3 = [[IPABestFitEvenTotalPixelCountImageSizePolicy alloc] initWithTotalPixelCount:a3];
  return v3;
}

+ (id)bestFitPolicyWithTotalPixelCount:(int64_t)a3
{
  id v3 = [[IPABestFitTotalPixelCountImageSizePolicy alloc] initWithTotalPixelCount:a3];
  return v3;
}

+ (id)bestFitPolicyThumbnail
{
  return (id)[a1 bestFitPolicyInSquare:1024.0];
}

+ (id)bestFitPolicyWithHeight:(double)a3
{
  id v3 = [[IPABestFitImageHeightPolicy alloc] initWithHeight:a3];
  return v3;
}

+ (id)bestFitPolicyWithWidth:(double)a3
{
  id v3 = [[IPABestFitImageWidthPolicy alloc] initWithWidth:a3];
  return v3;
}

+ (id)bestFitPolicyShortestEdge:(double)a3
{
  id v3 = [[IPAShortestEdgeImageSizePolicy alloc] initWithShortestEdge:a3];
  return v3;
}

+ (id)bestFitPolicyInSquare:(double)a3
{
  return (id)objc_msgSend(a1, "bestFitPolicyInSize:", a3, a3);
}

+ (id)bestFitPolicyInSize:(CGSize)a3
{
  id v3 = -[IPABestFitImageSizePolicy initWithFitSize:]([IPABestFitImageSizePolicy alloc], "initWithFitSize:", a3.width, a3.height);
  return v3;
}

+ (id)scalePolicyWithScale:(double)a3
{
  if (a3 == 1.0)
  {
    id v3 = +[IPAImageSizePolicy originalSizePolicy];
  }
  else
  {
    id v3 = [[IPAScaleImageSizePolicy alloc] initWithScale:a3];
  }
  return v3;
}

+ (id)originalSizePolicy
{
  v2 = objc_opt_new();
  return v2;
}

@end