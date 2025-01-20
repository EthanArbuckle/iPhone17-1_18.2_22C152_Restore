@interface OABFill
+ (id)patternFromBlipId:(unsigned int)a3 blipName:(id)a4 blipDataReference:(EshBlip *)a5 state:(id)a6;
+ (id)readFillFromFillPropertiesManager:(id)a3 state:(id)a4;
+ (void)addStopsFromArray:(const OABGradientStop *)a3 stopCount:(int)a4 inverted:(BOOL)a5 startPos:(float)a6 endPos:(float)a7 toStopArray:(id)a8 fillPropertiesManager:(id)a9;
+ (void)readGradientFill:(id)a3 fromFillPropertiesManager:(id)a4 state:(id)a5;
+ (void)readImageFill:(id)a3 fromFillPropertiesManager:(id)a4 state:(id)a5;
@end

@implementation OABFill

+ (id)readFillFromFillPropertiesManager:(id)a3 state:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 fillType];
  if ([v6 isFilled])
  {
    if (!v8)
    {
      if (v6) {
        [v6 fillFgColor];
      }
      else {
        EshColor v35 = 0;
      }
      float v21 = EshFixedPointUtil::toFloat((EshFixedPointUtil *)[v6 fillFgAlpha]);
      EshColor::EshColor(&v34, &v35);
      *(float *)&double v22 = v21;
      v10 = +[OABShapeProperties targetColorWithSourceColor:&v34 alpha:v6 colorPropertiesManager:v7 state:v22];
      v9 = objc_alloc_init(OADSolidFill);
      [(OADSolidFill *)v9 setColor:v10];
      goto LABEL_18;
    }
    if (v8 == 7 || v8 == 4)
    {
      v9 = objc_alloc_init(OADGradientFill);
      [a1 readGradientFill:v9 fromFillPropertiesManager:v6 state:v7];
      v10 = objc_alloc_init(OADLinearShade);
      [(OADLinearShade *)v10 setScaled:v8 == 7];
      float v11 = EshFixedPointUtil::toFloat((EshFixedPointUtil *)[v6 fillAngle]);
      *(float *)&double v12 = (float)((float)((float)(270.0 - v11) / 360.0) - floorf((float)(270.0 - v11) / 360.0)) * 360.0;
      [(OADLinearShade *)v10 setAngle:v12];
      [(OADSolidFill *)v9 setShade:v10];
LABEL_18:

      goto LABEL_19;
    }
    if ((v8 - 5) <= 1)
    {
      v9 = objc_alloc_init(OADGradientFill);
      [a1 readGradientFill:v9 fromFillPropertiesManager:v6 state:v7];
      v14 = objc_alloc_init(OADPathShade);
      v10 = (OADLinearShade *)v14;
      if (v8 == 6) {
        uint64_t v15 = 1;
      }
      else {
        uint64_t v15 = 3;
      }
      [(OADPathShade *)v14 setType:v15];
      v16 = objc_alloc_init(OADRelativeRect);
      *(float *)&double v17 = EshFixedPointUtil::toFloat((EshFixedPointUtil *)[v6 fillFocusLeft]);
      [(OADRelativeRect *)v16 setLeft:v17];
      *(float *)&double v18 = EshFixedPointUtil::toFloat((EshFixedPointUtil *)[v6 fillFocusTop]);
      [(OADRelativeRect *)v16 setTop:v18];
      *(float *)&double v19 = 1.0 - EshFixedPointUtil::toFloat((EshFixedPointUtil *)[v6 fillFocusRight]);
      [(OADRelativeRect *)v16 setRight:v19];
      *(float *)&double v20 = 1.0 - EshFixedPointUtil::toFloat((EshFixedPointUtil *)[v6 fillFocusBottom]);
      [(OADRelativeRect *)v16 setBottom:v20];
      [(OADLinearShade *)v10 setFillToRect:v16];
      [(OADSolidFill *)v9 setShade:v10];
LABEL_15:

      goto LABEL_18;
    }
    v9 = 0;
    switch(v8)
    {
      case 1:
        uint64_t v24 = [v6 fillBlipID];
        v10 = [v6 fillBlipName];
        objc_msgSend(a1, "patternFromBlipId:blipName:blipDataReference:state:", v24, v10, objc_msgSend(v6, "fillBlipDataReference"), v7);
        v16 = (OADRelativeRect *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          if (v6) {
            [v6 fillFgColor];
          }
          else {
            EshColor v35 = 0;
          }
          float v25 = EshFixedPointUtil::toFloat((EshFixedPointUtil *)[v6 fillFgAlpha]);
          EshColor::EshColor(&v33, &v35);
          *(float *)&double v26 = v25;
          v27 = +[OABShapeProperties targetColorWithSourceColor:&v33 alpha:v6 colorPropertiesManager:v7 state:v26];
          if (v6) {
            [v6 fillBgColor];
          }
          else {
            EshColor v32 = 0;
          }
          float v28 = EshFixedPointUtil::toFloat((EshFixedPointUtil *)[v6 fillBgAlpha]);
          EshColor::EshColor(&v31, &v32);
          *(float *)&double v29 = v28;
          v30 = +[OABShapeProperties targetColorWithSourceColor:&v31 alpha:v6 colorPropertiesManager:v7 state:v29];
          v9 = objc_alloc_init(OADPatternFill);
          [(OADSolidFill *)v9 setFgColor:v27];
          [(OADSolidFill *)v9 setBgColor:v30];
          [(OADSolidFill *)v9 setPattern:v16];
        }
        else
        {
          v9 = +[OADNullFill nullFill];
        }
        goto LABEL_15;
      case 2:
        v9 = objc_alloc_init(OADImageFill);
        [a1 readImageFill:v9 fromFillPropertiesManager:v6 state:v7];
        v10 = objc_alloc_init(OADTileTechnique);
        [(OADSolidFill *)v9 setTechnique:v10];
        goto LABEL_18;
      case 3:
        v9 = objc_alloc_init(OADImageFill);
        [a1 readImageFill:v9 fromFillPropertiesManager:v6 state:v7];
        v10 = objc_alloc_init(OADStretchTechnique);
        [(OADSolidFill *)v9 setTechnique:v10];
        goto LABEL_18;
      case 9:
        v13 = objc_alloc_init(OADBackgroundFill);
        goto LABEL_7;
      default:
        break;
    }
  }
  else
  {
    v13 = +[OADNullFill nullFill];
LABEL_7:
    v9 = (OADSolidFill *)v13;
  }
LABEL_19:

  return v9;
}

+ (id)patternFromBlipId:(unsigned int)a3 blipName:(id)a4 blipDataReference:(EshBlip *)a5 state:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v9 = a4;
  id v10 = a6;
  float v11 = v10;
  double v12 = a5;
  if (v8)
  {
    double v12 = a5;
    if (!a5)
    {
      v13 = [v10 bstoreContainerHolder];
      if ([v13 childCount] >= (unint64_t)v8)
      {
        v14 = [v13 childAt:(v8 - 1)];
        uint64_t v15 = (const void *)[v14 eshObject];
        if (v15
        {
          double v12 = (EshBlip *)*((void *)v16 + 4);
        }
        else
        {
          double v12 = 0;
        }
      }
      else
      {
        double v12 = 0;
      }
    }
  }
  if (v12
    && (*((unsigned int (**)(EshBlip *))v12->var0 + 2))(v12) == 61471
    && (unsigned int var4 = v12[2].var2.var4, var4 >= 0xC4)
    && (unsigned __int8 v18 = var4 + 60, v18 <= 0x2Fu))
  {
    uint64_t v19 = +[OABFill patternFromBlipId:blipName:blipDataReference:state:]::kPresetPatternTypeArray[v18];
    double v20 = objc_alloc_init(OADPresetPattern);
    [(OADPresetPattern *)v20 setType:v19];
    if (!a5) {
      goto LABEL_20;
    }
  }
  else
  {
    double v20 = 0;
    if (!a5) {
      goto LABEL_20;
    }
  }
  float v21 = +[OABBlip readBlipFromEshBlip:a5];
  if (v21)
  {
    double v22 = [[OADBlipRef alloc] initWithIndex:v8 name:v9 blip:v21];
    v23 = objc_alloc_init(OADCustomPattern);
    [(OADCustomPattern *)v23 setBlipRef:v22];

    goto LABEL_23;
  }
LABEL_20:
  if (v20) {
    v23 = v20;
  }
  else {
    v23 = 0;
  }
LABEL_23:

  return v23;
}

+ (void)addStopsFromArray:(const OABGradientStop *)a3 stopCount:(int)a4 inverted:(BOOL)a5 startPos:(float)a6 endPos:(float)a7 toStopArray:(id)a8 fillPropertiesManager:(id)a9
{
  BOOL v12 = a5;
  id v34 = a8;
  id v15 = a9;
  v16 = v15;
  if (a6 < a7)
  {
    float v17 = EshFixedPointUtil::toFloat((EshFixedPointUtil *)[v15 fillFgAlpha]);
    float v18 = EshFixedPointUtil::toFloat((EshFixedPointUtil *)[v16 fillBgAlpha]);
    int v19 = a4 - 1;
    if (v12)
    {
      int v20 = -1;
    }
    else
    {
      int v19 = 0;
      int v20 = a4;
    }
    int v21 = v19 - v20;
    if (v19 != v20)
    {
      float v22 = v18;
      double v23 = a6;
      double v24 = (float)(a7 - a6);
      if (v12) {
        uint64_t v25 = -1;
      }
      else {
        uint64_t v25 = 1;
      }
      p_var1 = &a3[v19].var1;
      do
      {
        id v27 = *((id *)p_var1 - 1);
        if (v12) {
          double v28 = 1.0 - *p_var1;
        }
        else {
          double v28 = *p_var1;
        }
        float v29 = (float)(v17 * (float)(1.0 - *p_var1)) + (float)(*p_var1 * v22);
        id v30 = v27;
        if (v29 != 1.0)
        {
          EshColor v31 = [(OADColorTransform *)[OADValueColorTransform alloc] initWithType:6];
          *(float *)&double v32 = v29;
          [(OADValueColorTransform *)v31 setValue:v32];
          [v30 addTransform:v31];
        }
        double v33 = v23 + v28 * v24;
        *(float *)&double v33 = v33;
        +[OADGradientFillStop addStopWithColor:v30 position:v34 toArray:v33];

        p_var1 += 4 * v25;
        v21 += v25;
      }
      while (v21);
    }
  }
}

+ (void)readGradientFill:(id)a3 fromFillPropertiesManager:(id)a4 state:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = [v8 fillType];
  if (v10 == 7 || v10 == 4) {
    vcvtms_s32_f32(EshFixedPointUtil::toFloat((EshFixedPointUtil *)[v8 fillAngle]) / 360.0);
  }
  [v8 fillFocus];
  if (v8) {
    [v8 fillFgColor];
  }
  else {
    EshColor v16 = 0;
  }
  EshColor::EshColor(&v15, &v16);
  LODWORD(v11) = 1.0;
  +[OABShapeProperties targetColorWithSourceColor:&v15 alpha:v8 colorPropertiesManager:v9 state:v11];
  objc_claimAutoreleasedReturnValue();
  if (v8) {
    [v8 fillBgColor];
  }
  else {
    EshColor v14 = 0;
  }
  EshColor::EshColor(&v13, &v14);
  LODWORD(v12) = 1.0;
  +[OABShapeProperties targetColorWithSourceColor:&v13 alpha:v8 colorPropertiesManager:v9 state:v12];
  objc_claimAutoreleasedReturnValue();
  [v8 fillGradientColors];
  operator new[]();
}

+ (void)readImageFill:(id)a3 fromFillPropertiesManager:(id)a4 state:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 fillBlipID];
  double v11 = [v8 fillBlipName];
  uint64_t v12 = [v8 fillBlipDataReference];
  if (v12)
  {
    EshColor v13 = +[OABBlip readBlipFromEshBlip:v12];
  }
  else
  {
    EshColor v13 = 0;
  }
  EshColor v14 = [[OADBlipRef alloc] initWithIndex:v10 name:v11 blip:v13];
  [v7 setBlipRef:v14];
  if (v8) {
    [v8 fillFgColor];
  }
  else {
    EshColor v20 = 0;
  }
  float v15 = EshFixedPointUtil::toFloat((EshFixedPointUtil *)[v8 fillFgAlpha]);
  EshColor::EshColor(&v19, &v20);
  *(float *)&double v16 = v15;
  float v17 = +[OABShapeProperties targetColorWithSourceColor:&v19 alpha:v8 colorPropertiesManager:v9 state:v16];
  float v18 = objc_alloc_init(OADForegroundColorEffect);
  [(OADForegroundColorEffect *)v18 setForegroundColor:v17];
  [(OADBlipRef *)v14 addEffect:v18];
}

@end