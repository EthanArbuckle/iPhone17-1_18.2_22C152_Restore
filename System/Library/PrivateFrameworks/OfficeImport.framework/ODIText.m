@interface ODIText
+ (id)baseListStyleForPoint:(id)a3 shape:(id)a4 isCentered:(BOOL)a5 state:(id)a6;
+ (void)addTextFromPoint:(id)a3 level:(unsigned int)a4 includeChildren:(BOOL)a5 toShape:(id)a6 baseListStyle:(id)a7 state:(id)a8;
+ (void)mapTextFromPoint:(id)a3 toShape:(id)a4 isCentered:(BOOL)a5 includeChildren:(BOOL)a6 state:(id)a7;
+ (void)mapTextFromPoint:(id)a3 toShape:(id)a4 isCenteredHorizontally:(BOOL)a5 isCenteredVertically:(BOOL)a6 includeChildren:(BOOL)a7 state:(id)a8;
@end

@implementation ODIText

+ (void)mapTextFromPoint:(id)a3 toShape:(id)a4 isCentered:(BOOL)a5 includeChildren:(BOOL)a6 state:(id)a7
{
}

+ (void)mapTextFromPoint:(id)a3 toShape:(id)a4 isCenteredHorizontally:(BOOL)a5 isCenteredVertically:(BOOL)a6 includeChildren:(BOOL)a7 state:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v38 = a3;
  id v14 = a4;
  id v15 = a8;
  v16 = [v38 text];
  v17 = [v16 properties];
  [v17 setMergedWithParent:0];
  if (([v17 hasTextAnchorType] & 1) == 0)
  {
    if (v10)
    {
      v18 = [v38 children];
      BOOL v19 = [v18 count] == 0;
    }
    else
    {
      BOOL v19 = 0;
    }
    [v17 setTextAnchorType:v19];
  }
  v20 = [v14 textBody];
  [v20 setProperties:v17];
  v21 = [a1 baseListStyleForPoint:v38 shape:v14 isCentered:v11 state:v15];
  [a1 addTextFromPoint:v38 level:0 includeChildren:v9 toShape:v14 baseListStyle:v21 state:v15];
  [v16 setProperties:0];
  v22 = [v14 drawableProperties];
  v23 = [v22 orientedBounds];

  [v23 rotation];
  float v25 = v24;
  [v23 flipY];
  TSUNormalizeAngleInDegrees(v25);
  *(float *)&double v26 = v26;
  TSUNormalizeAngleInDegrees((float)(*(float *)&v26 + 45.0));
  float v28 = v27 / 90.0;
  unsigned int v29 = vcvtms_s32_f32(v28);
  float v30 = (float)(int)floorf(v28);
  int v31 = (v29 + 3) & 3;
  if ((int)(v29 + 3) <= 0) {
    int v31 = -(-(v29 + 3) & 3);
  }
  if (v30 != v28) {
    int v31 = v29;
  }
  if (v29) {
    int v32 = v29;
  }
  else {
    int v32 = v31;
  }
  v33 = [v20 properties];
  v35 = v33;
  if (v32 >= 0) {
    int v36 = v32;
  }
  else {
    int v36 = v32 + 1;
  }
  *(float *)&double v34 = (float)(180 * (v36 >> 1));
  [v33 setRotation:v34];

  v37 = [v20 properties];
  [v37 setFlowType:(v32 << 31 >> 31) & 3];
}

+ (id)baseListStyleForPoint:(id)a3 shape:(id)a4 isCentered:(BOOL)a5 state:(id)a6
{
  BOOL v6 = a5;
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = objc_alloc_init(OADTextListStyle);
  BOOL v11 = +[OAITOrientedBounds absoluteOrientedBoundsOfDrawable:v9];
  [v11 bounds];
  double v13 = v12;
  double v15 = v14;

  if (v13 >= v15) {
    double v16 = v15;
  }
  else {
    double v16 = v13;
  }
  float v17 = v16 * 0.200000003;
  if (v17 >= 9.0) {
    float v18 = v17;
  }
  else {
    float v18 = 9.0;
  }
  if (v6)
  {
    BOOL v19 = [v8 children];
    BOOL v20 = [v19 count] == 0;
  }
  else
  {
    BOOL v20 = 0;
  }
  __int16 v30 = 8226;
  v21 = [NSString stringWithCharacters:&v30 length:1];
  uint64_t v22 = 0;
  float v23 = fminf(v18, 100.0);
  do
  {
    float v24 = [(OADTextListStyle *)v10 propertiesForListLevel:v22];
    *(float *)&double v25 = v23;
    [v24 setSize:v25];
    [v24 setAlign:v20];
    if (v22)
    {
      double v26 = v23 * 0.8 * (double)(v22 - 1);
      *(float *)&double v26 = v26;
      [v24 setLeftMargin:v26];
      *(float *)&double v27 = v23;
      [v24 setIndent:v27];
      float v28 = [[OADCharacterBulletProperties alloc] initWithBullet:v21];
      [v24 setBulletProperties:v28];
    }
    ++v22;
  }
  while (v22 != 9);

  return v10;
}

+ (void)addTextFromPoint:(id)a3 level:(unsigned int)a4 includeChildren:(BOOL)a5 toShape:(id)a6 baseListStyle:(id)a7 state:(id)a8
{
  BOOL v34 = a5;
  id v35 = a3;
  id v37 = a6;
  id v12 = a7;
  id v13 = a8;
  double v14 = [v35 text];
  if (v14)
  {
    double v15 = [v13 textStyle];
    [v15 applyToTextBody:v14];

    uint64_t v16 = [v14 paragraphCount];
    float v17 = [v14 textListStyle];
    if (v17 || ([v14 overrideTextListStyle], (float v17 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      for (uint64_t i = 0; i != 9; ++i)
      {
        BOOL v19 = [v17 propertiesForListLevel:i];
        if (a4 + i >= 8) {
          uint64_t v20 = 8;
        }
        else {
          uint64_t v20 = a4 + i;
        }
        v21 = [v12 propertiesForListLevel:v20];
        [v19 setParent:v21];
      }
      uint64_t v22 = v17;
    }
    else if (v16)
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        float v28 = v14;
        unsigned int v29 = [v14 paragraphAtIndex:j];
        __int16 v30 = [v29 properties];
        unsigned int v31 = [v30 level] + a4;
        if (v31 >= 8) {
          uint64_t v32 = 8;
        }
        else {
          uint64_t v32 = v31;
        }
        v33 = [v12 propertiesForListLevel:v32];
        [v30 setParent:v33];

        double v14 = v28;
      }
      uint64_t v22 = 0;
    }
    else
    {
      uint64_t v22 = 0;
    }
    float v23 = [v37 textBody];
    [v23 addParagraphsFromTextBody:v14];

    if (v34)
    {
      float v24 = [v35 children];
      double v25 = [v24 objectEnumerator];

      while (1)
      {
        double v26 = [v25 nextObject];
        if (!v26) {
          break;
        }
        [a1 addTextFromPoint:v26 level:a4 + 1 includeChildren:1 toShape:v37 baseListStyle:v12 state:v13];
      }
    }
  }
}

@end