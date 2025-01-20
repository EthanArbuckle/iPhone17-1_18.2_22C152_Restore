@interface NSTextLayoutManager(IC)
- (double)ic_rectForRange:()IC;
- (id)ic_textRangeForRange:()IC;
- (uint64_t)ic_rangeForTextRange:()IC;
@end

@implementation NSTextLayoutManager(IC)

- (uint64_t)ic_rangeForTextRange:()IC
{
  id v4 = a3;
  v5 = [a1 documentRange];
  uint64_t v6 = [v5 location];
  if (!v6)
  {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_6;
  }
  v7 = (void *)v6;
  v8 = [v4 location];

  if (!v8)
  {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_8;
  }
  v9 = [a1 documentRange];
  v10 = [v9 location];
  v11 = [v4 location];
  uint64_t v12 = [a1 offsetFromLocation:v10 toLocation:v11];

  v13 = [v4 endLocation];

  if (v13)
  {
    v5 = [v4 location];
    v14 = [v4 endLocation];
    [a1 offsetFromLocation:v5 toLocation:v14];

LABEL_6:
  }
LABEL_8:

  return v12;
}

- (id)ic_textRangeForRange:()IC
{
  v7 = [a1 documentRange];
  v8 = [v7 location];

  if (v8)
  {
    v9 = [a1 documentRange];
    v10 = [v9 location];
    v11 = [a1 locationFromLocation:v10 withOffset:a3];

    if (v11)
    {
      uint64_t v12 = [a1 locationFromLocation:v11 withOffset:a4];
      if (v12) {
        v13 = (void *)[objc_alloc(MEMORY[0x1E4FB08B0]) initWithLocation:v11 endLocation:v12];
      }
      else {
        v13 = 0;
      }
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (double)ic_rectForRange:()IC
{
  v2 = objc_msgSend(a1, "ic_textRangeForRange:");
  if (v2)
  {
    uint64_t v8 = 0;
    v9 = (CGRect *)&v8;
    uint64_t v10 = 0x4010000000;
    v11 = &unk_1B0BF84BB;
    long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    long long v12 = *MEMORY[0x1E4F1DB20];
    long long v13 = v3;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__NSTextLayoutManager_IC__ic_rectForRange___block_invoke;
    v7[3] = &unk_1E5FDC920;
    v7[4] = &v8;
    [a1 enumerateTextSegmentsInRange:v2 type:0 options:0 usingBlock:v7];
    if (CGRectIsNull(v9[1])) {
      p_x = (double *)MEMORY[0x1E4F1DB28];
    }
    else {
      p_x = &v9[1].origin.x;
    }
    double v5 = *p_x;
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB28];
  }

  return v5;
}

@end