@interface CMColorProperty
+ (CGColor)copyCGColorFromOADColor:(id)a3 state:(id)a4;
+ (CGColor)copyCGColorFromOADFill:(id)a3 state:(id)a4;
+ (float)resolveColorValueWithPercentage:(float)a3 foregroundComponent:(float)a4 backgroundComponent:(float)a5;
+ (float)transformedAlphaFromOADColor:(id)a3;
+ (id)cssStringFromOADColor:(id)a3;
+ (id)cssStringFromOADGradientFill:(id)a3 state:(id)a4;
+ (id)cssStringFromRed:(float)a3 green:(float)a4 blue:(float)a5;
+ (id)cssStringFromTSUColor:(id)a3;
+ (id)nsColorFromOADColor:(id)a3 state:(id)a4;
+ (id)nsColorFromOADFill:(id)a3 state:(id)a4;
+ (id)nsColorFromShading:(id)a3;
+ (id)resolveStyleColorWithPercentage:(float)a3 foregroundColor:(id)a4 backgroundColor:(id)a5;
+ (id)resolveStyleColorWithPercentage:(float)a3 shading:(id)a4;
- (BOOL)isEqualTo:(id)a3;
- (CMColorProperty)initWithColor:(id)a3;
- (id)cssString;
- (id)cssStringForName:(id)a3;
- (id)value;
@end

@implementation CMColorProperty

+ (id)nsColorFromOADColor:(id)a3 state:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 colorMap];
  v8 = [v6 colorScheme];
  v9 = [v6 resources];
  v10 = [v9 colors];

  v11 = +[OADColor tsuColorWithColor:v5 colorMap:v7 colorScheme:v8 colorPalette:v10];

  return v11;
}

+ (id)cssStringFromTSUColor:(id)a3
{
  id v3 = a3;
  [v3 redComponent];
  double v5 = v4;
  [v3 greenComponent];
  double v7 = v6;
  [v3 blueComponent];
  float v8 = v5;
  *(float *)&double v9 = v7;
  *(float *)&double v11 = v10;
  *(float *)&double v10 = v8;
  v12 = +[CMColorProperty cssStringFromRed:v10 green:v9 blue:v11];

  return v12;
}

+ (id)cssStringFromRed:(float)a3 green:(float)a4 blue:(float)a5
{
  float v5 = a3 * 255.0;
  if (v5 > 255.0) {
    float v5 = 255.0;
  }
  if (v5 < 0.0) {
    float v5 = 0.0;
  }
  uint64_t v6 = (int)v5;
  float v7 = a4 * 255.0;
  if ((float)(a4 * 255.0) > 255.0) {
    float v7 = 255.0;
  }
  if (v7 < 0.0) {
    float v7 = 0.0;
  }
  uint64_t v8 = (int)v7;
  float v9 = a5 * 255.0;
  if ((float)(a5 * 255.0) > 255.0) {
    float v9 = 255.0;
  }
  if (v9 < 0.0) {
    float v9 = 0.0;
  }
  uint64_t v10 = (int)v9;
  double v11 = [NSNumber numberWithInt:(v6 << 16) | (v8 << 8) | v10];
  v12 = +[CMGlobalCache colorPropertyCache];
  v13 = [v12 objectForKey:v11];
  v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @":%c%02x%02x%02x;",
                35,
                v6,
                v8,
                v10);
    [v12 setObject:v15 forKey:v11];
  }

  return v15;
}

+ (id)nsColorFromOADFill:(id)a3 state:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v43 = a4;
  v38 = v5;
  if (!v5) {
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v5 color];
    uint64_t v6 = +[CMColorProperty nsColorFromOADColor:v8 state:v43];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_3:
      uint64_t v6 = 0;
      goto LABEL_4;
    }
    v37 = [v5 stops];
    uint64_t v9 = [v37 count];
    unint64_t v10 = v9;
    if (v9)
    {
      if (v9 == 1)
      {
        double v11 = [v37 objectAtIndexedSubscript:0];
        v12 = [v11 color];
        uint64_t v6 = +[CMColorProperty nsColorFromOADColor:v12 state:v43];
      }
      else
      {
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        obuint64_t j = v37;
        uint64_t v13 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
        if (v13)
        {
          int v42 = 0;
          uint64_t v14 = *(void *)v49;
          float v15 = 0.0;
          float v16 = 0.0;
          float v17 = 0.0;
          float v18 = 0.0;
          unint64_t v39 = v10;
          uint64_t v40 = *(void *)v49;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v49 != v14) {
                objc_enumerationMutation(obj);
              }
              v20 = [*(id *)(*((void *)&v48 + 1) + 8 * i) color];
              v21 = +[CMColorProperty nsColorFromOADColor:v20 state:v43];
              [v21 redComponent];
              double v23 = v22;
              [v21 greenComponent];
              double v25 = v24;
              [v21 blueComponent];
              double v27 = v26;
              v28 = [v20 transforms];
              v29 = v28;
              if (v28)
              {
                long long v46 = 0u;
                long long v47 = 0u;
                long long v44 = 0u;
                long long v45 = 0u;
                id v30 = v28;
                uint64_t v31 = [v30 countByEnumeratingWithState:&v44 objects:v52 count:16];
                if (v31)
                {
                  uint64_t v32 = *(void *)v45;
                  while (2)
                  {
                    for (uint64_t j = 0; j != v31; ++j)
                    {
                      if (*(void *)v45 != v32) {
                        objc_enumerationMutation(v30);
                      }
                      v34 = *(void **)(*((void *)&v44 + 1) + 8 * j);
                      if ([v34 type] == 6)
                      {
                        [v34 value];
                        unint64_t v10 = v39;
                        uint64_t v14 = v40;
                        ++v42;
                        float v18 = v18 + v35;
                        goto LABEL_30;
                      }
                    }
                    uint64_t v31 = [v30 countByEnumeratingWithState:&v44 objects:v52 count:16];
                    if (v31) {
                      continue;
                    }
                    break;
                  }
                  unint64_t v10 = v39;
                  uint64_t v14 = v40;
                }
LABEL_30:
              }
              float v15 = v23 + v15;
              float v16 = v25 + v16;
              float v17 = v27 + v17;
            }
            uint64_t v13 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
          }
          while (v13);
        }
        else
        {
          int v42 = 0;
          float v15 = 0.0;
          float v16 = 0.0;
          float v17 = 0.0;
          float v18 = 0.0;
        }

        double v36 = 1.0;
        if (v42 >= 1) {
          double v36 = (float)(v18 / (float)v42);
        }
        uint64_t v6 = +[OITSUColor colorWithRed:(float)(v15 / (float)v10) green:(float)(v16 / (float)v10) blue:(float)(v17 / (float)v10) alpha:v36];
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
LABEL_4:

  return v6;
}

- (CMColorProperty)initWithColor:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CMColorProperty;
  uint64_t v6 = [(CMColorProperty *)&v10 init];
  float v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->wdValue, a3);
    uint64_t v8 = v7;
  }

  return v7;
}

- (id)cssStringForName:(id)a3
{
  id v4 = a3;
  id v5 = [(CMColorProperty *)self cssString];
  uint64_t v6 = [v4 stringByAppendingString:v5];

  return v6;
}

- (id)cssString
{
  return +[CMColorProperty cssStringFromTSUColor:self->wdValue];
}

+ (id)cssStringFromOADGradientFill:(id)a3 state:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  float v7 = [v5 stops];
  if ([v7 count] != 2)
  {
    id v19 = 0;
    goto LABEL_32;
  }
  uint64_t v8 = [v7 objectAtIndexedSubscript:0];
  uint64_t v9 = [v8 color];

  objc_super v10 = +[CMColorProperty nsColorFromOADColor:v9 state:v6];
  double v11 = [v7 objectAtIndexedSubscript:1];
  v12 = [v11 color];

  uint64_t v13 = +[CMColorProperty nsColorFromOADColor:v12 state:v6];
  uint64_t v14 = [v5 shade];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v14 angle];
    float v16 = v15 * 3.14159265 / 180.0;
    double v17 = v16;
    float v18 = @"left top, right top";
    if (v17 >= 0.392699082)
    {
      if (v17 >= 1.17809725)
      {
        if (v17 >= 5.10508806)
        {
          if (v17 < 5.89048623) {
            float v18 = @"left bottom, right top";
          }
        }
        else
        {
          float v18 = @"left bottom, left top";
        }
      }
      else
      {
        float v18 = @"left top, right bottom";
      }
    }
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v20 = [v14 fillToRect];
    v21 = v20;
    if (v20)
    {
      [v20 left];
      if (v22 == 1.0)
      {
        [v21 top];
        if (v23 == 1.0)
        {
          float v18 = @"right bottom, left top";
LABEL_26:

LABEL_27:
          id v30 = NSString;
          [v10 redComponent];
          double v32 = v31;
          [v10 greenComponent];
          double v34 = v33;
          [v10 blueComponent];
          double v36 = v35;
          [v13 redComponent];
          double v38 = v37;
          [v13 greenComponent];
          double v40 = v39;
          [v13 blueComponent];
          objc_msgSend(v30, "stringWithFormat:", @":-webkit-gradient(linear, %@, from(#%02x%02x%02x), to(#%02x%02x%02x));",
            v18,
            (int)(v32 * 255.0),
            (int)(v34 * 255.0),
            (int)(v36 * 255.0),
            (int)(v38 * 255.0),
            (int)(v40 * 255.0),
            (int)(v41 * 255.0));
          id v19 = (id)objc_claimAutoreleasedReturnValue();
          char v42 = 0;
          goto LABEL_30;
        }
      }
      [v21 right];
      if (v24 == 1.0)
      {
        [v21 top];
        if (v25 == 1.0)
        {
          float v18 = @"left bottom, right top";
          goto LABEL_26;
        }
      }
      [v21 left];
      if (v26 == 1.0)
      {
        [v21 bottom];
        if (v27 == 1.0)
        {
          float v18 = @"right top, left bottom";
          goto LABEL_26;
        }
      }
      [v21 right];
      if (v28 == 1.0)
      {
        [v21 bottom];
        if (v29 == 1.0)
        {
          float v18 = @"left top, right bottom";
          goto LABEL_26;
        }
      }
    }
  }
  id v19 = 0;
  char v42 = 1;
LABEL_30:

  if (v42)
  {
    id v43 = 0;
    goto LABEL_33;
  }
LABEL_32:
  id v19 = v19;
  id v43 = v19;
LABEL_33:

  return v43;
}

+ (float)transformedAlphaFromOADColor:(id)a3
{
  id v3 = [a3 transforms];
  id v4 = v3;
  float v5 = 1.0;
  if (v3)
  {
    uint64_t v6 = [v3 count];
    if (v6)
    {
      uint64_t v7 = 0;
      while (1)
      {
        uint64_t v8 = [v4 objectAtIndex:v7];
        if ([v8 type] == 6) {
          break;
        }

        if (v6 == ++v7) {
          goto LABEL_8;
        }
      }
      [v8 value];
      float v5 = v9;
    }
  }
LABEL_8:

  return v5;
}

+ (id)cssStringFromOADColor:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    [v4 red];
    int v6 = v5;
    [v4 green];
    int v8 = v7;
    [v4 blue];
    LODWORD(v10) = v9;
    LODWORD(v11) = v6;
    LODWORD(v12) = v8;
    uint64_t v13 = +[CMColorProperty cssStringFromRed:v11 green:v12 blue:v10];
  }
  else
  {
    uint64_t v13 = @":white;";
  }

  return v13;
}

+ (id)nsColorFromShading:(id)a3
{
  id v5 = a3;
  int v6 = v5;
  if (v5)
  {
    int v7 = [v5 style];
    double v8 = 0.0;
    switch(v7)
    {
      case 0:
        goto LABEL_47;
      case 1:
        LODWORD(v8) = 1.0;
        goto LABEL_47;
      case 2:
        LODWORD(v8) = 1028443341;
        goto LABEL_47;
      case 3:
        LODWORD(v8) = 1036831949;
        goto LABEL_47;
      case 4:
        LODWORD(v8) = 1045220557;
        goto LABEL_47;
      case 5:
      case 20:
      case 21:
      case 22:
      case 23:
        LODWORD(v8) = 0.25;
        goto LABEL_47;
      case 6:
        LODWORD(v8) = 1050253722;
        goto LABEL_47;
      case 7:
        LODWORD(v8) = 1053609165;
        goto LABEL_47;
      case 8:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 25:
        LODWORD(v8) = 0.5;
        goto LABEL_47;
      case 9:
      case 19:
        LODWORD(v8) = 1058642330;
        goto LABEL_47;
      case 10:
        LODWORD(v8) = 1060320051;
        goto LABEL_47;
      case 11:
        LODWORD(v8) = 0.75;
        goto LABEL_47;
      case 12:
        LODWORD(v8) = 1061997773;
        goto LABEL_47;
      case 13:
        LODWORD(v8) = *(_DWORD *)"fff?";
        goto LABEL_47;
      case 24:
      case 43:
        LODWORD(v8) = 1051931443;
        goto LABEL_47;
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
        goto LABEL_8;
      case 35:
        LODWORD(v8) = 1020054733;
        goto LABEL_47;
      case 36:
        LODWORD(v8) = 1033476506;
        goto LABEL_47;
      case 37:
        LODWORD(v8) = 0.125;
        goto LABEL_47;
      case 38:
        LODWORD(v8) = 1041865114;
        goto LABEL_47;
      case 39:
        LODWORD(v8) = 1043542835;
        goto LABEL_47;
      case 40:
        LODWORD(v8) = 1046898278;
        goto LABEL_47;
      case 41:
        LODWORD(v8) = 1049414861;
        goto LABEL_47;
      case 42:
        LODWORD(v8) = 1051092582;
        goto LABEL_47;
      case 44:
        LODWORD(v8) = 0.375;
        goto LABEL_47;
      case 45:
        LODWORD(v8) = 1054448026;
        goto LABEL_47;
      case 46:
        LODWORD(v8) = 1055286886;
        goto LABEL_47;
      case 47:
        LODWORD(v8) = 1056125747;
        goto LABEL_47;
      case 48:
        LODWORD(v8) = 1057384038;
        goto LABEL_47;
      case 49:
        LODWORD(v8) = 1057803469;
        goto LABEL_47;
      case 50:
        LODWORD(v8) = 1058222899;
        goto LABEL_47;
      case 51:
        LODWORD(v8) = 0.625;
        goto LABEL_47;
      case 52:
        LODWORD(v8) = 1059481190;
        goto LABEL_47;
      case 53:
        LODWORD(v8) = 1059900621;
        goto LABEL_47;
      case 54:
        LODWORD(v8) = 1060739482;
        goto LABEL_47;
      case 55:
        LODWORD(v8) = 1061578342;
        goto LABEL_47;
      case 56:
        LODWORD(v8) = 1062417203;
        goto LABEL_47;
      case 57:
        LODWORD(v8) = 1062836634;
        goto LABEL_47;
      case 58:
        LODWORD(v8) = 0.875;
        goto LABEL_47;
      case 59:
        LODWORD(v8) = 1064094925;
        goto LABEL_47;
      case 60:
        LODWORD(v8) = 1064514355;
        goto LABEL_47;
      case 61:
        LODWORD(v8) = 1064933786;
        goto LABEL_47;
      case 62:
        LODWORD(v8) = 1064849900;
LABEL_47:
        double v10 = [a1 resolveStyleColorWithPercentage:v6 shading:v8];
        goto LABEL_48;
      default:
        if (v7 == 0xFFFF) {
          break;
        }
LABEL_8:
        int v9 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", 0.0);
        [v9 handleFailureInMethod:a2 object:a1 file:@"CMColorProperty.mm" lineNumber:306 description:@"Bad shading style encountered."];

        break;
    }
  }
  double v10 = 0;
LABEL_48:

  return v10;
}

+ (id)resolveStyleColorWithPercentage:(float)a3 shading:(id)a4
{
  id v6 = a4;
  int v7 = [v6 foreground];
  double v8 = [v6 background];
  *(float *)&double v9 = a3;
  double v10 = [a1 resolveStyleColorWithPercentage:v7 foregroundColor:v8 backgroundColor:v9];

  return v10;
}

+ (id)resolveStyleColorWithPercentage:(float)a3 foregroundColor:(id)a4 backgroundColor:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (a3 >= 0.0 && a3 <= 1.0)
  {
    if (v9) {
      goto LABEL_6;
    }
LABEL_16:
    double v38 = [MEMORY[0x263F08690] currentHandler];
    [v38 handleFailureInMethod:a2 object:a1 file:@"CMColorProperty.mm" lineNumber:430 description:@"Foreground color is not set."];

    if (v10) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
  double v37 = [MEMORY[0x263F08690] currentHandler];
  [v37 handleFailureInMethod:a2 object:a1 file:@"CMColorProperty.mm" lineNumber:429 description:@"Percentage out of range."];

  if (!v9) {
    goto LABEL_16;
  }
LABEL_6:
  if (v10) {
    goto LABEL_7;
  }
LABEL_17:
  double v39 = [MEMORY[0x263F08690] currentHandler];
  [v39 handleFailureInMethod:a2 object:a1 file:@"CMColorProperty.mm" lineNumber:431 description:@"Background color is not set."];

LABEL_7:
  [v10 alphaComponent];
  if (v12 == 0.0)
  {
    uint64_t v13 = +[OITSUColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];

    uint64_t v14 = (void *)v13;
  }
  else
  {
    uint64_t v14 = v10;
  }
  [v9 alphaComponent];
  if (v15 == 0.0)
  {
    uint64_t v16 = +[OITSUColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];

    id v9 = (id)v16;
  }
  [v9 redComponent];
  double v18 = v17;
  [v14 redComponent];
  *(float *)&double v19 = v18;
  *(float *)&double v21 = v20;
  *(float *)&double v20 = a3;
  [a1 resolveColorValueWithPercentage:v20 foregroundComponent:v19 backgroundComponent:v21];
  LODWORD(v18) = v22;
  [v9 greenComponent];
  double v24 = v23;
  [v14 greenComponent];
  *(float *)&double v25 = v24;
  *(float *)&double v27 = v26;
  *(float *)&double v26 = a3;
  [a1 resolveColorValueWithPercentage:v26 foregroundComponent:v25 backgroundComponent:v27];
  LODWORD(v24) = v28;
  [v9 blueComponent];
  double v30 = v29;
  [v14 blueComponent];
  *(float *)&double v31 = v30;
  *(float *)&double v33 = v32;
  *(float *)&double v32 = a3;
  [a1 resolveColorValueWithPercentage:v32 foregroundComponent:v31 backgroundComponent:v33];
  double v35 = +[OITSUColor colorWithRed:*(float *)&v18 green:*(float *)&v24 blue:v34 alpha:1.0];

  return v35;
}

+ (float)resolveColorValueWithPercentage:(float)a3 foregroundComponent:(float)a4 backgroundComponent:(float)a5
{
  if (a3 < 0.0 || a3 > 1.0)
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2 object:a1 file:@"CMColorProperty.mm" lineNumber:462 description:@"Percentage out of range."];
  }
  if (a4 < 0.0 || a4 > 1.0)
  {
    uint64_t v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2 object:a1 file:@"CMColorProperty.mm" lineNumber:464 description:@"Foreground component out of range."];
  }
  if (a5 < 0.0 || a5 > 1.0)
  {
    double v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2 object:a1 file:@"CMColorProperty.mm" lineNumber:466 description:@"Background component out of range."];
  }
  return (float)(a3 * a4) + (float)((float)(1.0 - a3) * a5);
}

+ (CGColor)copyCGColorFromOADFill:(id)a3 state:(id)a4
{
  components[4] = *(CGFloat *)MEMORY[0x263EF8340];
  id v4 = [a1 nsColorFromOADFill:a3 state:a4];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  [v4 redComponent];
  components[0] = v6;
  [v4 greenComponent];
  components[1] = v7;
  [v4 blueComponent];
  components[2] = v8;
  [v4 alphaComponent];
  components[3] = v9;
  id v10 = CGColorCreate(DeviceRGB, components);
  CGColorSpaceRelease(DeviceRGB);

  return v10;
}

+ (CGColor)copyCGColorFromOADColor:(id)a3 state:(id)a4
{
  components[4] = *(CGFloat *)MEMORY[0x263EF8340];
  id v4 = [a1 nsColorFromOADColor:a3 state:a4];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  [v4 redComponent];
  components[0] = v6;
  [v4 greenComponent];
  components[1] = v7;
  [v4 blueComponent];
  components[2] = v8;
  [v4 alphaComponent];
  components[3] = v9;
  id v10 = CGColorCreate(DeviceRGB, components);
  CGColorSpaceRelease(DeviceRGB);

  return v10;
}

- (id)value
{
  return self->wdValue;
}

- (BOOL)isEqualTo:(id)a3
{
  wdValue = self->wdValue;
  id v4 = [a3 value];
  LOBYTE(wdValue) = [(OITSUColor *)wdValue isEqual:v4];

  return (char)wdValue;
}

- (void).cxx_destruct
{
}

@end