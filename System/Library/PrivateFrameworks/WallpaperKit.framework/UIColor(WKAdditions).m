@interface UIColor(WKAdditions)
+ (id)wk_colorWithHexString:()WKAdditions;
- (id)wk_colorHexString;
- (id)wk_interpolatedToColor:()WKAdditions progress:;
@end

@implementation UIColor(WKAdditions)

+ (id)wk_colorWithHexString:()WKAdditions
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 hasPrefix:@"#"] && (unint64_t)objc_msgSend(v3, "length") >= 2)
  {
    uint64_t v4 = [v3 substringFromIndex:1];

    id v3 = (id)v4;
  }
  if ([v3 length] == 3)
  {
    int v5 = 1;
    uint64_t v6 = 3;
    uint64_t v7 = 1;
  }
  else if ([v3 length] == 4)
  {
    uint64_t v7 = 1;
    uint64_t v6 = 4;
    int v5 = 1;
  }
  else
  {
    if ([v3 length] == 6)
    {
      int v5 = 0;
      uint64_t v6 = 3;
    }
    else
    {
      if ([v3 length] != 8) {
        goto LABEL_19;
      }
      int v5 = 0;
      uint64_t v6 = 4;
    }
    uint64_t v7 = 2;
  }
  uint64_t v8 = 0;
  unint64_t v9 = 0;
  double v22 = 1.0;
  uint64_t v10 = 8 * v6;
  int v11 = 1;
  do
  {
    id v12 = v3;
    v13 = objc_msgSend(v3, "substringWithRange:", v8, v7);
    v14 = v13;
    if (v5)
    {
      uint64_t v15 = [v13 stringByAppendingString:v13];

      v14 = (void *)v15;
    }
    v16 = [MEMORY[0x1E4F28FE8] scannerWithString:v14];
    int v20 = 0;
    v11 &= [v16 scanHexInt:&v20];
    LODWORD(v17) = v20;
    v21[v9 / 8] = (double)v17 / 255.0;

    v9 += 8;
    v8 += v7;
    id v3 = v12;
  }
  while (v10 != v9);
  if (v11)
  {
    v18 = [MEMORY[0x1E4FB1618] colorWithRed:v21[0] green:v21[1] blue:v21[2] alpha:v22];
    goto LABEL_20;
  }
LABEL_19:
  v18 = 0;
LABEL_20:

  return v18;
}

- (id)wk_colorHexString
{
  v1 = (CGColor *)[a1 CGColor];
  if (CGColorGetNumberOfComponents(v1) >= 3)
  {
    Components = CGColorGetComponents(v1);
    v2 = objc_msgSend(NSString, "stringWithFormat:", @"#%02lX%02lX%02lX", llround(*Components * 255.0), llround(Components[1] * 255.0), llround(Components[2] * 255.0));
    double Alpha = CGColorGetAlpha(v1);
    if (Alpha < 1.0)
    {
      uint64_t v5 = objc_msgSend(v2, "stringByAppendingFormat:", @"%02lX", llround(Alpha * 255.0));

      v2 = (void *)v5;
    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)wk_interpolatedToColor:()WKAdditions progress:
{
  id v6 = a1;
  id v7 = a4;
  uint64_t v8 = [v6 CGColor];
  id v9 = v7;
  uint64_t v10 = [v9 CGColor];

  *(float *)&double v11 = a2;
  id v12 = objc_msgSend(v8, "CA_interpolateValue:byFraction:", v10, v11);
  v13 = [MEMORY[0x1E4FB1618] colorWithCGColor:v12];

  return v13;
}

@end