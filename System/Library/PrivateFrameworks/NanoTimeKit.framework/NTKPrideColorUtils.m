@interface NTKPrideColorUtils
+ (id)axialColorGradientLayer:(unint64_t)a3 forDevice:(id)a4;
+ (id)gradientColorsForColor:(unint64_t)a3 device:(id)a4;
+ (id)layerForGradientWithColors:(id)a3 type:(id)a4 gradientLocations:(id)a5 startPoint:(CGPoint)a6 endPoint:(CGPoint)a7;
+ (id)prideColorGradientColors2020;
@end

@implementation NTKPrideColorUtils

+ (id)layerForGradientWithColors:(id)a3 type:(id)a4 gradientLocations:(id)a5 startPoint:(CGPoint)a6 endPoint:(CGPoint)a7
{
  double y = a7.y;
  double x = a7.x;
  double v9 = a6.y;
  double v10 = a6.x;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = objc_alloc_init(MEMORY[0x1E4F39BD0]);
  uint64_t v17 = [v13 count];
  uint64_t v18 = v17;
  if ((id)*MEMORY[0x1E4F3A398] == v14)
  {
    if (v15)
    {
      uint64_t v20 = [v15 count];
      if (v20 != [v13 count]) {
        goto LABEL_10;
      }
LABEL_7:
      id v34 = v15;
      id v35 = v14;
      unsigned int v19 = 0;
      LODWORD(v15) = 0;
      goto LABEL_12;
    }
    id v34 = 0;
    id v35 = v14;
    unsigned int v19 = 0;
    uint64_t v18 = v17 + 1;
    LODWORD(v15) = 1;
  }
  else
  {
    if (v15)
    {
      uint64_t v18 = [v15 count];
      if (v18 == [v13 count] + 2)
      {
        id v34 = v15;
        id v35 = v14;
        LODWORD(v15) = 0;
        unsigned int v19 = 1;
        goto LABEL_12;
      }
      if (v18 != [v13 count])
      {
LABEL_10:
        id v21 = 0;
        goto LABEL_24;
      }
      goto LABEL_7;
    }
    id v34 = 0;
    id v35 = v14;
    unsigned int v19 = 0;
  }
LABEL_12:
  v22 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v18];
  int v33 = (int)v15;
  if (v19 | v15) {
    unint64_t v23 = v18 - 1;
  }
  else {
    unint64_t v23 = v18;
  }
  uint64_t v24 = v19;
  if (v23 > v19)
  {
    uint64_t v25 = 0;
    unint64_t v26 = v23 - v19;
    do
    {
      id v27 = [v13 objectAtIndexedSubscript:v25];
      Copdouble y = CGColorCreateCopy((CGColorRef)[v27 CGColor]);
      [v22 insertObject:Copy atIndex:v24 + v25];

      ++v25;
    }
    while (v26 != v25);
  }
  if (v24)
  {
    v29 = [v22 objectAtIndexedSubscript:1];
    [v22 setObject:v29 atIndexedSubscript:0];

    uint64_t v30 = v18 - 2;
    id v15 = v34;
LABEL_22:
    v31 = [v22 objectAtIndexedSubscript:v30];
    [v22 insertObject:v31 atIndex:v18 - 1];

    goto LABEL_23;
  }
  id v15 = v34;
  if (v33)
  {
    uint64_t v30 = 0;
    goto LABEL_22;
  }
LABEL_23:
  [v16 setColors:v22];
  [v16 setLocations:v15];
  objc_msgSend(v16, "setStartPoint:", v10, v9);
  objc_msgSend(v16, "setEndPoint:", x, y);
  id v14 = v35;
  [v16 setType:v35];
  id v21 = v16;

LABEL_24:
  return v21;
}

+ (id)prideColorGradientColors2020
{
  v2 = (void *)prideColorGradientColors2020__prideColorGradientColors2020;
  if (!prideColorGradientColors2020__prideColorGradientColors2020)
  {
    v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:6];
    uint64_t v8 = 0;
    double v9 = &byte_1E9FA16BB;
    do
    {
      LOBYTE(v4) = *(v9 - 3);
      LOBYTE(v5) = *(v9 - 2);
      LOBYTE(v6) = *(v9 - 1);
      LOBYTE(v7) = *v9;
      double v10 = [MEMORY[0x1E4FB1618] colorWithRed:(double)v4 / 255.0 green:(double)v5 / 255.0 blue:(double)v6 / 255.0 alpha:(double)v7 / 255.0];
      [v3 insertObject:v10 atIndex:v8];

      ++v8;
      v9 += 4;
    }
    while (v8 != 6);
    uint64_t v11 = [v3 copy];
    v12 = (void *)prideColorGradientColors2020__prideColorGradientColors2020;
    prideColorGradientColors2020__prideColorGradientColors2020 = v11;

    v2 = (void *)prideColorGradientColors2020__prideColorGradientColors2020;
  }
  return v2;
}

+ (id)gradientColorsForColor:(unint64_t)a3 device:(id)a4
{
  if (a3)
  {
    unint64_t v6 = 0;
  }
  else
  {
    unint64_t v6 = objc_msgSend(a1, "prideColorGradientColors2020", a3, a4, v4);
  }
  return v6;
}

+ (id)axialColorGradientLayer:(unint64_t)a3 forDevice:(id)a4
{
  uint64_t v5 = [a1 gradientColorsForColor:a3 device:a4];
  unint64_t v6 = objc_msgSend(a1, "layerForGradientWithColors:type:gradientLocations:startPoint:endPoint:", v5, *MEMORY[0x1E4F3A390], 0, 0.5, 0.0, 0.5, 1.0);

  return v6;
}

@end