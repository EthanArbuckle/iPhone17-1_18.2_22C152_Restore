@interface UIColor(SXAdditions)
+ (uint64_t)colorWithHue:()SXAdditions saturation:lightness:alpha:;
- (double)brightness;
- (double)getHue:()SXAdditions saturation:lightness:alpha:;
- (double)relativeLuminance;
- (id)hex;
- (id)invertedBrightness;
- (id)invertedLightness;
- (id)invertedRGB;
- (void)_getHSBA:()SXAdditions;
@end

@implementation UIColor(SXAdditions)

- (double)brightness
{
  uint64_t v4 = 0;
  v5 = (double *)&v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __34__UIColor_SXAdditions__brightness__block_invoke;
  v3[3] = &unk_264653C48;
  v3[4] = &v4;
  [a1 _getHSBA:v3];
  double v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (void)_getHSBA:()SXAdditions
{
  double v7 = 0.0;
  double v8 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  uint64_t v4 = a3;
  [a1 getHue:&v8 saturation:&v7 brightness:&v6 alpha:&v5];
  v4[2](v4, v8, v7, v6, v5);
}

- (id)invertedRGB
{
  double v6 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  uint64_t v3 = 0;
  [a1 getRed:&v6 green:&v5 blue:&v4 alpha:&v3];
  double v6 = 1.0 - v6;
  double v4 = 1.0 - v4;
  double v5 = 1.0 - v5;
  double v1 = objc_msgSend(MEMORY[0x263F1C550], "colorWithRed:green:blue:alpha:");
  return v1;
}

- (id)invertedBrightness
{
  double v6 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  uint64_t v3 = 0;
  [a1 getHue:&v6 saturation:&v5 brightness:&v4 alpha:&v3];
  double v4 = 1.0 - v4;
  double v1 = objc_msgSend(MEMORY[0x263F1C550], "colorWithHue:saturation:brightness:alpha:", v6, v5);
  return v1;
}

- (id)hex
{
  double v12 = 0.0;
  double v13 = 0.0;
  double v11 = 0.0;
  double v10 = 0.0;
  [a1 getRed:&v13 green:&v12 blue:&v11 alpha:&v10];
  float v1 = v13 * 255.0;
  unint64_t v2 = llroundf(v1);
  float v3 = v12 * 255.0;
  unint64_t v4 = llroundf(v3);
  float v5 = v11 * 255.0;
  unint64_t v6 = llroundf(v5);
  float v7 = v10 * 255.0;
  double v8 = objc_msgSend(NSString, "stringWithFormat:", @"#%02lX%02lX%02lX%02lX", v2, v4, v6, llroundf(v7));
  return v8;
}

- (double)getHue:()SXAdditions saturation:lightness:alpha:
{
  double v26 = 0.0;
  double v27 = 0.0;
  double v24 = 0.0;
  double v25 = 0.0;
  if ([a1 getRed:&v27 green:&v26 blue:&v25 alpha:&v24])
  {
    if (v27 >= v26) {
      double v11 = v27;
    }
    else {
      double v11 = v26;
    }
    if (v27 >= v26) {
      double v12 = v26;
    }
    else {
      double v12 = v27;
    }
    if (v11 >= v25) {
      double v13 = v11;
    }
    else {
      double v13 = v25;
    }
    if (v12 >= v25) {
      double v14 = v25;
    }
    else {
      double v14 = v12;
    }
    double result = (v13 + v14) * 0.5;
    double v15 = 0.0;
    double v16 = 0.0;
    if (v13 > v14)
    {
      double v17 = v13 - v14;
      double v18 = 2.0 - v13 - v14;
      if (result <= 0.5) {
        double v18 = v13 + v14;
      }
      double v16 = v17 / v18;
      double v19 = (v27 - v26) / v17 + 4.0;
      if (v26 == v13) {
        double v19 = (v25 - v27) / v17 + 2.0;
      }
      double v20 = (v26 - v25) / v17;
      double v21 = 0.0;
      if (v26 < v25) {
        double v21 = 6.0;
      }
      double v22 = v21 + v20;
      if (v27 == v13) {
        double v23 = v22;
      }
      else {
        double v23 = v19;
      }
      double v15 = v23 / 6.0;
    }
    if (a3) {
      *a3 = v15;
    }
    if (a4) {
      *a4 = v16;
    }
    if (a5) {
      *a5 = result;
    }
    if (a6)
    {
      double result = v24;
      *a6 = v24;
    }
  }
  return result;
}

+ (uint64_t)colorWithHue:()SXAdditions saturation:lightness:alpha:
{
  BOOL v5 = a3 < 0.5;
  double v6 = a2 + a3 - a3 * a2;
  double v7 = (a2 + 1.0) * a3;
  if (v5) {
    double v6 = v7;
  }
  double v8 = -(v6 - a3 * 2.0);
  double v9 = a1 + 0.333333343;
  if (a1 + 0.333333343 < 0.0) {
    double v9 = a1 + 0.333333343 + 1.0;
  }
  if (v9 > 1.0) {
    double v9 = v9 + -1.0;
  }
  if (v9 < 0.166666672)
  {
    double v10 = (v6 - v8) * 6.0;
LABEL_13:
    double v11 = v8 + v10 * v9;
    goto LABEL_14;
  }
  double v11 = v6;
  if (v9 >= 0.5)
  {
    double v11 = v8;
    if (v9 < 0.666666687)
    {
      double v10 = (0.666666687 - v9) * (v6 - v8);
      double v9 = 6.0;
      goto LABEL_13;
    }
  }
LABEL_14:
  double v12 = a1 + 1.0;
  if (a1 >= 0.0) {
    double v12 = a1;
  }
  if (v12 > 1.0) {
    double v12 = v12 + -1.0;
  }
  if (v12 < 0.166666672)
  {
    double v13 = (v6 - v8) * 6.0;
LABEL_23:
    double v14 = v8 + v13 * v12;
    goto LABEL_24;
  }
  double v14 = v6;
  if (v12 >= 0.5)
  {
    double v14 = v8;
    if (v12 < 0.666666687)
    {
      double v13 = (0.666666687 - v12) * (v6 - v8);
      double v12 = 6.0;
      goto LABEL_23;
    }
  }
LABEL_24:
  double v15 = a1 + -0.333333343;
  if (v15 < 0.0) {
    double v15 = v15 + 1.0;
  }
  if (v15 > 1.0) {
    double v15 = v15 + -1.0;
  }
  if (v15 < 0.166666672)
  {
    double v16 = (v6 - v8) * 6.0;
LABEL_33:
    double v6 = v8 + v16 * v15;
    return objc_msgSend(MEMORY[0x263F1C550], "colorWithRed:green:blue:alpha:", v11, v14, v6);
  }
  if (v15 >= 0.5)
  {
    if (v15 >= 0.666666687)
    {
      double v6 = v8;
      return objc_msgSend(MEMORY[0x263F1C550], "colorWithRed:green:blue:alpha:", v11, v14, v6);
    }
    double v16 = (0.666666687 - v15) * (v6 - v8);
    double v15 = 6.0;
    goto LABEL_33;
  }
  return objc_msgSend(MEMORY[0x263F1C550], "colorWithRed:green:blue:alpha:", v11, v14, v6);
}

- (id)invertedLightness
{
  double v7 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  double v4 = 0.0;
  [a1 getHue:&v7 saturation:&v6 lightness:&v5 alpha:&v4];
  double v1 = 1.0 - v5;
  double v5 = 1.0 - v5;
  if (v6 >= 2.22044605e-16) {
    objc_msgSend(MEMORY[0x263F1C550], "colorWithHue:saturation:lightness:alpha:", v7, v6);
  }
  else {
  unint64_t v2 = [MEMORY[0x263F1C550] colorWithRed:v1 green:v1 blue:v1 alpha:v4];
  }
  return v2;
}

- (double)relativeLuminance
{
  double v9 = 0.0;
  double v10 = 0.0;
  double v8 = 0.0;
  [a1 getRed:&v10 green:&v9 blue:&v8 alpha:0];
  double v1 = v10 * 255.0;
  if (v10 * 255.0 >= 10.0) {
    double v2 = pow(v1 / 269.0 + 0.0513, 2.4);
  }
  else {
    double v2 = v1 / 3294.0;
  }
  double v3 = v9 * 255.0;
  if (v9 * 255.0 >= 10.0) {
    double v4 = pow(v3 / 269.0 + 0.0513, 2.4);
  }
  else {
    double v4 = v3 / 3294.0;
  }
  double v5 = v8 * 255.0;
  if (v8 * 255.0 >= 10.0) {
    double v6 = pow(v5 / 269.0 + 0.0513, 2.4);
  }
  else {
    double v6 = v5 / 3294.0;
  }
  return v4 * 0.7152 + v2 * 0.2126 + v6 * 0.0722;
}

@end