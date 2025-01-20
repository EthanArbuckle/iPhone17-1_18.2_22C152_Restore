@interface UILabel(SBStringDrawing)
- (SBStringMetrics)stringMetricsForFirstLineWidth:()SBStringDrawing;
- (void)drawWithMetrics:()SBStringDrawing inContext:;
@end

@implementation UILabel(SBStringDrawing)

- (SBStringMetrics)stringMetricsForFirstLineWidth:()SBStringDrawing
{
  v54 = objc_alloc_init(SBStringMetrics);
  v4 = [a1 text];
  [a1 frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  unint64_t v13 = [v4 length];
  v57.origin.x = v6;
  v57.origin.y = v8;
  v57.size.width = v10;
  v57.size.height = v12;
  double Height = CGRectGetHeight(v57);
  v15 = [a1 font];
  [v15 lineHeight];
  double v17 = Height / v16;

  uint64_t v18 = [a1 numberOfLines];
  if (v17 >= (double)v18) {
    double v17 = (double)v18;
  }
  v19 = [a1 _defaultAttributes];
  v55 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  if (!stringMetricsForFirstLineWidth____NonWhitespace)
  {
    uint64_t v20 = [v55 invertedSet];
    v21 = (void *)stringMetricsForFirstLineWidth____NonWhitespace;
    stringMetricsForFirstLineWidth____NonWhitespace = v20;
  }
  if (v13)
  {
    unint64_t v22 = (unint64_t)v17;
    if ((unint64_t)v17)
    {
      unint64_t v23 = 0;
      unint64_t v24 = 0;
      unint64_t v52 = v22 - 1;
      unint64_t v53 = (unint64_t)v17;
      do
      {
        uint64_t v25 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", stringMetricsForFirstLineWidth____NonWhitespace, 0, v23, v13 - v23);
        if (v25 == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        unint64_t v23 = v25;
        v58.origin.x = v6;
        v58.origin.y = v8;
        v58.size.width = v10;
        v58.size.height = v12;
        double Width = CGRectGetWidth(v58);
        double v27 = fmin(a2, Width);
        double v28 = v24 ? Width : v27;
        if (v28 <= 0.0)
        {
          ++v24;
          v38 = +[SBLineFragment fragmentWithIndex:v23 length:0 lineWidth:v28];
          [(SBStringMetrics *)v54 addFragment:v38];
        }
        else
        {
          v29 = (void *)MEMORY[0x1D948C4D0]();
          if (v23 >= v13)
          {
            unint64_t v35 = v23;
          }
          else
          {
            unint64_t v30 = v23;
            double v31 = v28;
            while (1)
            {
              if (v31 == v28)
              {
                uint64_t v33 = v30;
              }
              else
              {
                uint64_t v32 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", stringMetricsForFirstLineWidth____NonWhitespace, 0, v30, v13 - v30);
                if (v32 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  unint64_t v35 = v13 + 1;
                  goto LABEL_47;
                }
                uint64_t v33 = v32;
              }
              uint64_t v34 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", v55, 0, v33, v13 - v33);
              unint64_t v35 = v34 == 0x7FFFFFFFFFFFFFFFLL ? v13 : v34;
              v36 = objc_msgSend(v4, "substringWithRange:", v30, v35 - v30);
              [v36 sizeWithAttributes:v19];
              if (v37 > v31) {
                break;
              }
              double v31 = v31 - v37;

              unint64_t v30 = v35;
              if (v35 >= v13) {
                goto LABEL_47;
              }
            }
            if (v31 == v28 && v24 < v52)
            {
              double v39 = v31 * (double)(uint64_t)(v35 - v30) / v37;
              uint64_t v40 = (uint64_t)v39;
              if ((uint64_t)v39)
              {
                unint64_t v41 = v30 + v40;
                if (v30 + v40 <= v30)
                {
                  unint64_t v44 = v30 + v40;
                }
                else
                {
                  unint64_t v50 = v30 + v40;
                  uint64_t v51 = (uint64_t)v39;
                  do
                  {
                    v42 = v36;
                    v36 = objc_msgSend(v4, "substringWithRange:", v30, v40);

                    [v36 sizeWithAttributes:v19];
                    --v40;
                  }
                  while (v37 > v31 && v40 + v30 > v30);
                  unint64_t v44 = v30 + v40;
                  unint64_t v41 = v50;
                  uint64_t v40 = v51;
                }
                if (v44 + 1 == v41)
                {
                  if (v37 >= v31)
                  {
                    unint64_t v30 = v44;
                  }
                  else
                  {
                    uint64_t v45 = v40 - 1;
                    do
                    {
                      v46 = v36;
                      v36 = objc_msgSend(v4, "substringWithRange:", v30, v45 + 2);

                      [v36 sizeWithAttributes:v19];
                      ++v45;
                    }
                    while (v47 < v31);
                    v30 += v45;
                  }
                }
                else
                {
                  unint64_t v30 = v44 + 1;
                }
              }
            }
            ++v24;

            unint64_t v35 = v30;
          }
LABEL_47:
          v48 = +[SBLineFragment fragmentWithIndex:v23 length:v35 - v23 lineWidth:v28];
          [(SBStringMetrics *)v54 addFragment:v48];

          unint64_t v23 = v35;
          unint64_t v22 = v53;
        }
      }
      while (v23 < v13 && v24 < v22);
    }
  }

  return v54;
}

- (void)drawWithMetrics:()SBStringDrawing inContext:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [a1 frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  unint64_t v13 = [a1 text];
  v14 = [a1 font];
  [v14 lineHeight];
  double v16 = v15;

  v42.origin.x = v6;
  v42.origin.y = v8;
  v42.size.width = v10;
  v42.size.height = v12;
  double v17 = CGRectGetHeight(v42) / v16;
  uint64_t v18 = [a1 numberOfLines];
  if (v17 >= (double)v18) {
    double v17 = (double)v18;
  }
  uint64_t v34 = [a1 _defaultAttributes];
  v19 = [a1 textColor];
  [v19 set];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v20 = v4;
  uint64_t v32 = [v20 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v32)
  {
    uint64_t v35 = 0;
    unint64_t v30 = 1 - (unint64_t)v17;
    uint64_t v31 = *(void *)v37;
LABEL_5:
    uint64_t v21 = 0;
    uint64_t v33 = v30 + v35;
    while (1)
    {
      if (*(void *)v37 != v31) {
        objc_enumerationMutation(v20);
      }
      unint64_t v22 = *(void **)(*((void *)&v36 + 1) + 8 * v21);
      uint64_t v23 = objc_msgSend(v22, "index", v30);
      uint64_t v24 = [v22 range];
      uint64_t v26 = v25;
      uint64_t v27 = v33 + v21;
      if (v35 + v21 + 1 == [v20 fragmentCount] || !v27) {
        uint64_t v26 = [v13 length] - v23;
      }
      else {
        uint64_t v23 = v24;
      }
      double v28 = objc_msgSend(v13, "substringWithRange:", v23, v26);
      [v22 lineWidth];
      objc_msgSend(v28, "drawInRect:withAttributes:", v34, 0.0, v16 * (double)(unint64_t)(v35 + v21), v29, 1.79769313e308);

      if (!v27) {
        break;
      }
      if (v32 == ++v21)
      {
        v35 += v21;
        uint64_t v32 = [v20 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v32) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
}

@end