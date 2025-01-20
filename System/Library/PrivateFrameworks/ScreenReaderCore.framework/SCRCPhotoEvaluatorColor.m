@interface SCRCPhotoEvaluatorColor
+ (id)detect:(id)a3 inRect:(CGRect)a4;
@end

@implementation SCRCPhotoEvaluatorColor

+ (id)detect:(id)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v33.origin.double x = x;
  v33.origin.double y = y;
  v33.size.double width = width;
  v33.size.double height = height;
  if (CGRectIsEmpty(v33)) {
    goto LABEL_4;
  }
  v34.origin.double x = x;
  v34.origin.double y = y;
  v34.size.double width = width;
  v34.size.double height = height;
  if (CGRectIsNull(v34)
    || (v35.origin.x = x, v35.origin.y = y, v35.size.width = width, v35.size.double height = height, CGRectIsInfinite(v35)))
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
      uint64_t v27 = 0;
      uint64_t v26 = 0;
      uint64_t v25 = 0;
    }
    else
    {
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      uint64_t v27 = 0;
      uint64_t v28 = v13 + v14 * (v21 + v23 * v15) + 2;
      do
      {
        uint64_t v29 = (uint64_t)height;
        v30 = (unsigned __int8 *)v28;
        if (v18 >= 1)
        {
          do
          {
            v27 += *(v30 - 2);
            v26 += *(v30 - 1);
            v25 += *v30;
            v30 += v15 * v14;
            --v29;
          }
          while (v29);
        }
        ++v24;
        v28 += v14;
      }
      while (v24 != v17);
    }
    double v31 = (double)(v17 * v18) * 255.0;
    v10 = [[SCRCPhotoEvaluatorResultColor alloc] initWithRedLevel:(double)v27 / v31 blueLevel:(double)v25 / v31 greenLevel:(double)v26 / v31];
  }
  v11 = v10;

  return v11;
}

@end