@interface UIColor(NNMKWebColors)
+ (id)colorWithWebColor:()NNMKWebColors;
+ (id)colorWithWebColorName:()NNMKWebColors;
+ (id)colorWithWebHexTriplet:()NNMKWebColors;
+ (id)colorWithWebRgb:()NNMKWebColors;
@end

@implementation UIColor(NNMKWebColors)

+ (id)colorWithWebColor:()NNMKWebColors
{
  id v3 = a3;
  v4 = [MEMORY[0x263F1C550] colorWithWebColorName:v3];
  if (!v4)
  {
    v4 = [MEMORY[0x263F1C550] colorWithWebRgb:v3];
    if (!v4)
    {
      v4 = [MEMORY[0x263F1C550] colorWithWebHexTriplet:v3];
    }
  }

  return v4;
}

+ (id)colorWithWebColorName:()NNMKWebColors
{
  uint64_t v3 = colorWithWebColorName__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&colorWithWebColorName__onceToken, &__block_literal_global_2);
  }
  v5 = (void *)__colorsByColorNames;
  v6 = [v4 lowercaseString];

  v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

+ (id)colorWithWebRgb:()NNMKWebColors
{
  id v3 = a3;
  id v4 = v3;
  if (v3
    && ((char v5 = [v3 hasPrefix:@"rgb"], (v5 & 1) != 0)
     || [v4 hasPrefix:@"hsl"]))
  {
    uint64_t v6 = objc_msgSend(v4, "rangeOfString:", @"(");
    uint64_t v7 = [v4 rangeOfString:@""]);
    v8 = 0;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL && v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      char v45 = v5;
      v44 = objc_msgSend(v4, "substringWithRange:", v6 + 1, v7 - (v6 + 1));
      v9 = [v44 componentsSeparatedByString:@","];
      v10 = [MEMORY[0x263EFF980] arrayWithCapacity:4];
      if ([v9 count])
      {
        unint64_t v11 = 0;
        while (1)
        {
          v12 = [v9 objectAtIndexedSubscript:v11];
          v13 = [MEMORY[0x263F08708] whitespaceCharacterSet];
          v14 = [v12 stringByTrimmingCharactersInSet:v13];

          if ([v14 hasSuffix:@"%"])
          {
            v15 = objc_msgSend(v14, "substringToIndex:", objc_msgSend(v14, "length") - 1);
            uint64_t v16 = [v15 integerValue];

            v17 = NSNumber;
            double v18 = (float)v16 / 100.0;
          }
          else
          {
            if ([v14 rangeOfString:@"."] != 0x7FFFFFFFFFFFFFFFLL)
            {
              [v14 floatValue];
              v22 = NSNumber;
LABEL_16:
              uint64_t v23 = objc_msgSend(v22, "numberWithFloat:");
              goto LABEL_26;
            }
            uint64_t v19 = [v14 integerValue];
            char v20 = v45 ^ 1;
            if (v11 > 2) {
              char v20 = 1;
            }
            if (v20)
            {
              if (v11) {
                char v24 = 1;
              }
              else {
                char v24 = v45;
              }
              if (v24)
              {
                if ((unint64_t)v19 > 1)
                {
                  v8 = 0;
                  v42 = v44;
                  goto LABEL_37;
                }
                v22 = NSNumber;
                goto LABEL_16;
              }
              v21 = NSNumber;
              double v18 = (float)v19 / 360.0;
            }
            else
            {
              v21 = NSNumber;
              double v18 = (float)v19 / 255.0;
            }
            v17 = v21;
          }
          uint64_t v23 = [v17 numberWithDouble:v18];
LABEL_26:
          v25 = (void *)v23;
          [v10 addObject:v23];

          unint64_t v26 = [v9 count];
          if (v11 <= 2 && ++v11 < v26) {
            continue;
          }
          break;
        }
      }
      unint64_t v27 = [v10 count];
      if (v27 <= 3)
      {
        unint64_t v28 = v27 - 4;
        do
          [v10 addObject:&unk_26F131728];
        while (!__CFADD__(v28++, 1));
      }
      v30 = (void *)MEMORY[0x263F1C550];
      v14 = [v10 objectAtIndexedSubscript:0];
      [v14 floatValue];
      double v32 = v31;
      v33 = [v10 objectAtIndexedSubscript:1];
      [v33 floatValue];
      double v35 = v34;
      v36 = [v10 objectAtIndexedSubscript:2];
      [v36 floatValue];
      double v38 = v37;
      v39 = [v10 objectAtIndexedSubscript:3];
      [v39 floatValue];
      double v41 = v40;
      if (v45) {
        [v30 colorWithRed:v32 green:v35 blue:v38 alpha:v41];
      }
      else {
      v8 = [v30 colorWithHue:v32 saturation:v35 brightness:v38 alpha:v41];
      }
      v42 = v44;

LABEL_37:
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)colorWithWebHexTriplet:()NNMKWebColors
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_11;
  }
  if ([v3 hasPrefix:@"#"])
  {
    uint64_t v5 = [v4 substringFromIndex:1];

    id v4 = (void *)v5;
  }
  if ([v4 length] == 3)
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%C%C%C%C%C%C", objc_msgSend(v4, "characterAtIndex:", 0), objc_msgSend(v4, "characterAtIndex:", 0), objc_msgSend(v4, "characterAtIndex:", 1), objc_msgSend(v4, "characterAtIndex:", 1), objc_msgSend(v4, "characterAtIndex:", 2), objc_msgSend(v4, "characterAtIndex:", 2));

    id v4 = (void *)v6;
  }
  if ([v4 length] != 6) {
    goto LABEL_11;
  }
  unsigned int v21 = 255;
  unsigned int v22 = 255;
  unsigned int v23 = 255;
  uint64_t v7 = (void *)MEMORY[0x263F08B08];
  v8 = objc_msgSend(v4, "substringWithRange:", 0, 2);
  v9 = [v7 scannerWithString:v8];
  int v10 = [v9 scanHexInt:&v23];

  unint64_t v11 = 0;
  if (!v10) {
    goto LABEL_12;
  }
  v12 = (void *)MEMORY[0x263F08B08];
  v13 = objc_msgSend(v4, "substringWithRange:", 2, 2);
  v14 = [v12 scannerWithString:v13];
  int v15 = [v14 scanHexInt:&v22];

  if (!v15) {
    goto LABEL_11;
  }
  uint64_t v16 = (void *)MEMORY[0x263F08B08];
  v17 = objc_msgSend(v4, "substringWithRange:", 4, 2);
  double v18 = [v16 scannerWithString:v17];
  int v19 = [v18 scanHexInt:&v21];

  if (v19)
  {
    unint64_t v11 = [MEMORY[0x263F1C550] colorWithRed:(float)v23 / 255.0 green:(float)v22 / 255.0 blue:(float)v21 / 255.0 alpha:1.0];
  }
  else
  {
LABEL_11:
    unint64_t v11 = 0;
  }
LABEL_12:

  return v11;
}

@end