@interface OAVFill
+ (id)readBlipRefFromManager:(id)a3 state:(id)a4;
+ (id)readFromManager:(id)a3 state:(id)a4;
+ (id)targetBgColorWithManager:(id)a3;
+ (id)targetFgColorWithManager:(id)a3;
+ (void)addStopsFromArray:(const OAVGradientStop *)a3 stopCount:(int)a4 inverted:(BOOL)a5 startPos:(float)a6 endPos:(float)a7 toGradientFill:(id)a8 manager:(id)a9;
+ (void)readGradientFill:(id)a3 fromManager:(id)a4;
+ (void)readImageFill:(id)a3 fromManager:(id)a4 state:(id)a5;
@end

@implementation OAVFill

+ (id)readFromManager:(id)a3 state:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 fillType];
  if ([v6 isFilled])
  {
    if ([v8 isEqualToString:@"solid"])
    {
      v9 = objc_alloc_init(OADSolidFill);
      v10 = [a1 targetFgColorWithManager:v6];
      [(OADSolidFill *)v9 setColor:v10];
LABEL_15:

      goto LABEL_17;
    }
    if ([v8 isEqualToString:@"gradient"])
    {
      v9 = objc_alloc_init(OADGradientFill);
      [a1 readGradientFill:v9 fromManager:v6];
      v10 = objc_alloc_init(OADLinearShade);
      [(OADLinearShade *)v10 setScaled:0];
      [v6 fillAngle];
      *(float *)&double v12 = (float)((float)((float)(270.0 - v11) / 360.0) - floorf((float)(270.0 - v11) / 360.0)) * 360.0;
      [(OADLinearShade *)v10 setAngle:v12];
      [(OADSolidFill *)v9 setShade:v10];
      goto LABEL_15;
    }
    if ([v8 isEqualToString:@"gradientRadial"])
    {
      v9 = objc_alloc_init(OADGradientFill);
      [a1 readGradientFill:v9 fromManager:v6];
      v10 = objc_alloc_init(OADPathShade);
      [(OADLinearShade *)v10 setType:1];
      [(OADSolidFill *)v9 setShade:v10];
      goto LABEL_15;
    }
    if ([v8 isEqualToString:@"pattern"])
    {
      v10 = [a1 readBlipRefFromManager:v6 state:v7];
      v13 = [a1 targetFgColorWithManager:v6];
      v14 = [a1 targetBgColorWithManager:v6];
      v9 = objc_alloc_init(OADPatternFill);
      [(OADSolidFill *)v9 setFgColor:v13];
      [(OADSolidFill *)v9 setBgColor:v14];
      v15 = objc_alloc_init(OADCustomPattern);
      [(OADCustomPattern *)v15 setBlipRef:v10];
      [(OADSolidFill *)v9 setPattern:v15];

      goto LABEL_15;
    }
    if ([v8 isEqualToString:@"tile"])
    {
      v9 = objc_alloc_init(OADImageFill);
      v16 = [a1 readBlipRefFromManager:v6 state:v7];
      [(OADSolidFill *)v9 setBlipRef:v16];

      v10 = objc_alloc_init(OADTileTechnique);
      [(OADSolidFill *)v9 setTechnique:v10];
      goto LABEL_15;
    }
    if ([v8 isEqualToString:@"frame"])
    {
      v17 = [v6 imageFillId];

      if (v17)
      {
        v9 = objc_alloc_init(OADImageFill);
        v18 = [a1 readBlipRefFromManager:v6 state:v7];
        [(OADSolidFill *)v9 setBlipRef:v18];

        v10 = objc_alloc_init(OADStretchTechnique);
        [(OADSolidFill *)v9 setTechnique:v10];
        goto LABEL_15;
      }
    }
  }
  v9 = +[OADNullFill nullFill];
LABEL_17:

  return v9;
}

+ (id)targetFgColorWithManager:(id)a3
{
  id v3 = a3;
  v4 = [v3 fillFgColor];
  [v3 fillFgAlpha];
  v5 = +[OAVColor readColorFromAttribute:alpha:manager:](OAVColor, "readColorFromAttribute:alpha:manager:", v4, v3);

  return v5;
}

+ (void)readGradientFill:(id)a3 fromManager:(id)a4
{
  a3;
  id v5 = a4;
  [v5 fillType];
  if ([(id)objc_claimAutoreleasedReturnValue() isEqualToString:@"gradient"]) {
    [v5 fillAngle];
  }
  [v5 fillFocus];
  uint64_t v6 = [v5 fillFgColor];
  LODWORD(v7) = 1.0;
  +[OAVColor readColorFromAttribute:v6 alpha:v5 manager:v7];
  objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v5 fillBgColor];
  LODWORD(v9) = 1.0;
  +[OAVColor readColorFromAttribute:v8 alpha:v5 manager:v9];
  objc_claimAutoreleasedReturnValue();
  [v5 fillGradientColors];
  [(id)objc_claimAutoreleasedReturnValue() componentsSeparatedByString:@";"];
  [(id)objc_claimAutoreleasedReturnValue() count];
  operator new[]();
}

+ (void)addStopsFromArray:(const OAVGradientStop *)a3 stopCount:(int)a4 inverted:(BOOL)a5 startPos:(float)a6 endPos:(float)a7 toGradientFill:(id)a8 manager:(id)a9
{
  BOOL v12 = a5;
  id v37 = a8;
  id v15 = a9;
  v16 = v15;
  if (a6 < a7)
  {
    id v36 = v15;
    [v15 fillFgAlpha];
    float v18 = v17;
    [v16 fillBgAlpha];
    float v20 = v19;
    v21 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:a4];
    int v22 = a4 - 1;
    if (v12)
    {
      int v23 = -1;
    }
    else
    {
      int v22 = 0;
      int v23 = a4;
    }
    int v24 = v22 - v23;
    if (v22 != v23)
    {
      double v25 = a6;
      double v26 = (float)(a7 - a6);
      if (v12) {
        uint64_t v27 = -1;
      }
      else {
        uint64_t v27 = 1;
      }
      p_var1 = &a3[v22].var1;
      do
      {
        id v29 = *((id *)p_var1 - 1);
        if (v12) {
          double v30 = 1.0 - *p_var1;
        }
        else {
          double v30 = *p_var1;
        }
        float v31 = (float)(v18 * (float)(1.0 - *p_var1)) + (float)(*p_var1 * v20);
        id v32 = v29;
        if (v31 != 1.0)
        {
          v33 = [(OADColorTransform *)[OADValueColorTransform alloc] initWithType:6];
          *(float *)&double v34 = v31;
          [(OADValueColorTransform *)v33 setValue:v34];
          [v32 addTransform:v33];
        }
        double v35 = v25 + v30 * v26;
        *(float *)&double v35 = v35;
        +[OADGradientFillStop addStopWithColor:v32 position:v21 toArray:v35];

        p_var1 += 4 * v27;
        v24 += v27;
      }
      while (v24);
    }
    [v37 setStops:v21];

    v16 = v36;
  }
}

+ (id)readBlipRefFromManager:(id)a3 state:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 imageFillId];
  if (v8)
  {
    double v9 = [v6 packagePart];
    v10 = [v9 relationshipForIdentifier:v8];

    float v11 = [v10 targetLocation];
    BOOL v12 = [v7 blipRefForURL:v11];

    v13 = objc_alloc_init(OADForegroundColorEffect);
    v14 = [a1 targetFgColorWithManager:v6];
    [(OADForegroundColorEffect *)v13 setForegroundColor:v14];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

+ (id)targetBgColorWithManager:(id)a3
{
  id v3 = a3;
  v4 = [v3 fillBgColor];
  [v3 fillBgAlpha];
  id v5 = +[OAVColor readColorFromAttribute:alpha:manager:](OAVColor, "readColorFromAttribute:alpha:manager:", v4, v3);

  return v5;
}

+ (void)readImageFill:(id)a3 fromManager:(id)a4 state:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v8 imageFillId];
  float v11 = [v8 packagePart];
  BOOL v12 = [v11 relationshipForIdentifier:v10];

  v13 = [v12 targetLocation];
  v14 = [v9 blipRefForURL:v13];

  [v17 setBlipRef:v14];
  id v15 = objc_alloc_init(OADForegroundColorEffect);
  v16 = [a1 targetFgColorWithManager:v8];
  [(OADForegroundColorEffect *)v15 setForegroundColor:v16];
}

@end