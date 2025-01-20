@interface CAMediaTimingFunction(UIPageCurlAdditions)
+ (uint64_t)uiFunctionWithControlPoints:()UIPageCurlAdditions;
@end

@implementation CAMediaTimingFunction(UIPageCurlAdditions)

+ (uint64_t)uiFunctionWithControlPoints:()UIPageCurlAdditions
{
  double v3 = *a3;
  double v4 = a3[1];
  *(float *)&double v3 = *a3;
  *(float *)&double v4 = v4;
  double v5 = a3[2];
  double v6 = a3[3];
  *(float *)&double v5 = v5;
  *(float *)&double v6 = v6;
  return [MEMORY[0x1E4F39C10] functionWithControlPoints:v3 :v4 :v5 :v6];
}

@end