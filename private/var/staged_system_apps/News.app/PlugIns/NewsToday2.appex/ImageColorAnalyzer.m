@interface ImageColorAnalyzer
+ (id)colorsForImage:(id)a3;
- (BOOL)color:(id)a3 isCloseToOtherColor:(id)a4;
- (NSArray)dominantColors;
- (UIColor)backgroundColor;
- (id).cxx_construct;
- (void)analyzeImage:(id)a3;
@end

@implementation ImageColorAnalyzer

+ (id)colorsForImage:(id)a3
{
  id v20 = a3;
  id v4 = objc_alloc_init((Class)a1);
  [v4 analyzeImage:v20];
  v22 = [v4 backgroundColor];
  v21 = [v4 dominantColors];
  v5 = +[NSMutableArray array];
  [v5 addObject:v22];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v21;
  id v6 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v33;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v10 = [v5 copy];
        id v11 = [v10 countByEnumeratingWithState:&v28 objects:v37 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v29;
          while (2)
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v29 != v12) {
                objc_enumerationMutation(v10);
              }
              if ([v4 color:v9 isCloseToOtherColor:*(void *)(*((void *)&v28 + 1) + 8 * (void)j)])
              {

                goto LABEL_16;
              }
            }
            id v11 = [v10 countByEnumeratingWithState:&v28 objects:v37 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        [v5 addObject:v9];
LABEL_16:
        ;
      }
      id v6 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v6);
  }

  if ((unint64_t)[v5 count] <= 7)
  {
    [v5 removeAllObjects];
    [v5 addObject:v22];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v14 = obj;
    id v15 = [v14 countByEnumeratingWithState:&v24 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v25;
      do
      {
        for (k = 0; k != v15; k = (char *)k + 1)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * (void)k);
          if ((objc_msgSend(v4, "color:isCloseToOtherColor:", v18, v22, v20) & 1) == 0) {
            [v5 addObject:v18];
          }
        }
        id v15 = [v14 countByEnumeratingWithState:&v24 objects:v36 count:16];
      }
      while (v15);
    }
  }

  return v5;
}

- (void)analyzeImage:(id)a3
{
  id v4 = (CGImage *)[a3 CGImage];
  SRGB = (CGColorSpace *)CGColorSpaceGetSRGB();
  if (SRGB)
  {
    CGImageRef CopyWithColorSpace = CGImageCreateCopyWithColorSpace(v4, SRGB);
    uint64_t v7 = CopyWithColorSpace;
    if (CopyWithColorSpace) {
      id v4 = CopyWithColorSpace;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = TSDBitmapContextCreate(3, 102.0, 102.0);
  CGContextSetInterpolationQuality(v8, kCGInterpolationHigh);
  if (v8)
  {
    v10.origin.x = CGPointZero.x;
    v10.origin.y = CGPointZero.y;
    v10.size.width = 102.0;
    v10.size.height = 102.0;
    CGContextDrawImage(v8, v10, v4);
  }
  if (v7) {
    CGImageRelease(v7);
  }
  AnalyzeImagePlease((BOOL)v8, &self->_analyzedColors);
  if (v8)
  {
    CGContextRelease(v8);
  }
}

- (UIColor)backgroundColor
{
  return +[UIColor colorWithRed:self->_analyzedColors.backgroundColor.mRed green:self->_analyzedColors.backgroundColor.mGreen blue:self->_analyzedColors.backgroundColor.mBlue alpha:self->_analyzedColors.backgroundColor.mAlpha];
}

- (NSArray)dominantColors
{
  v3 = +[NSMutableArray array];
  __p = 0;
  CGRect v10 = 0;
  uint64_t v11 = 0;
  sub_100018F44(&__p, self->_analyzedColors.completeColorList.__begin_, (uint64_t)self->_analyzedColors.completeColorList.__end_, self->_analyzedColors.completeColorList.__end_ - self->_analyzedColors.completeColorList.__begin_);
  id v4 = (char *)__p;
  if (v10 != __p)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = +[UIColor colorWithRed:*(double *)&v4[v5] green:*(double *)&v4[v5 + 8] blue:*(double *)&v4[v5 + 16] alpha:*(double *)&v4[v5 + 24]];
      [v3 addObject:v7];

      ++v6;
      id v4 = (char *)__p;
      v5 += 32;
    }
    while (v6 < (v10 - (unsigned char *)__p) >> 5);
  }
  if (__p)
  {
    CGRect v10 = __p;
    operator delete(__p);
  }

  return (NSArray *)v3;
}

- (BOOL)color:(id)a3 isCloseToOtherColor:(id)a4
{
  return _[a3 _isSimilarToColor:a4 withinPercentage:0.2];
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end