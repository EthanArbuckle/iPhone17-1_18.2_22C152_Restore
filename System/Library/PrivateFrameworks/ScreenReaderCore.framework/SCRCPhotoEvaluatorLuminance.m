@interface SCRCPhotoEvaluatorLuminance
+ (id)detect:(id)a3 inRect:(CGRect)a4;
@end

@implementation SCRCPhotoEvaluatorLuminance

+ (id)detect:(id)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v39.origin.double x = x;
  v39.origin.double y = y;
  v39.size.double width = width;
  v39.size.double height = height;
  if (CGRectIsEmpty(v39)) {
    goto LABEL_4;
  }
  v40.origin.double x = x;
  v40.origin.double y = y;
  v40.size.double width = width;
  v40.size.double height = height;
  if (CGRectIsNull(v40)
    || (v41.origin.x = x, v41.origin.y = y, v41.size.width = width, v41.size.double height = height, CGRectIsInfinite(v41)))
  {
LABEL_4:
    v10 = [a1 detect:v9];
  }
  else
  {
    uint64_t v13 = [v9 data];
    uint64_t v14 = [v9 bytesPerPixel];
    uint64_t v15 = [v9 width];
    uint64_t v16 = [v9 height];
    uint64_t v17 = (uint64_t)width;
    uint64_t v18 = (uint64_t)height;
    uint64_t v19 = (uint64_t)y;
    uint64_t v20 = v15 - (uint64_t)width;
    if (v20 >= (uint64_t)x) {
      uint64_t v20 = (uint64_t)x;
    }
    if ((uint64_t)x >= 0) {
      uint64_t v21 = v20;
    }
    else {
      uint64_t v21 = 0;
    }
    uint64_t v22 = v16 - v18;
    if (v16 - v18 >= v19) {
      uint64_t v22 = (uint64_t)y;
    }
    if (v19 >= 0) {
      uint64_t v23 = v22;
    }
    else {
      uint64_t v23 = 0;
    }
    if (v17 < 1)
    {
      int v29 = 0;
      int v28 = 0;
      int v27 = 0;
      int v26 = 0;
      int v25 = 0;
    }
    else
    {
      uint64_t v24 = 0;
      int v25 = 0;
      int v26 = 0;
      int v27 = 0;
      int v28 = 0;
      int v29 = 0;
      uint64_t v30 = v13 + v14 * (v21 + v23 * v15) + 2;
      do
      {
        uint64_t v31 = (uint64_t)height;
        v32 = (unsigned __int8 *)v30;
        if (v18 >= 1)
        {
          do
          {
            int v33 = *(v32 - 2);
            int v34 = *(v32 - 1);
            int v35 = *v32;
            v29 += v33;
            v28 += v34;
            v27 += v35;
            unsigned int v36 = v34 + v33 + v35;
            if (v36 < 0xC0) {
              ++v26;
            }
            if (v36 > 0x242) {
              ++v25;
            }
            v32 += v15 * v14;
            --v31;
          }
          while (v31);
        }
        ++v24;
        v30 += v14;
      }
      while (v24 != v17);
    }
    double v37 = (double)(v17 * v18);
    v10 = [[SCRCPhotoEvaluatorResultLuminance alloc] initWithDarknessLevel:(double)v26 / v37 brightnessLevel:(double)v25 / v37 averageLevel:((double)v29 / (v37 * 255.0) + (double)v28 / (v37 * 255.0) + (double)v27 / (v37 * 255.0)) / 3.0];
  }
  v11 = v10;

  return v11;
}

@end