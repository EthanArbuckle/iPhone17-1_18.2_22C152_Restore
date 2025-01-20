@interface OADColorTransform
+ (float)alphaByApplyingTransforms:(id)a3 toAlpha:(float)a4;
+ (float)applyAlphaTransform:(id)a3 toAlpha:(float)a4;
+ (id)applyExpTransformWithValue:(float)a3 toColor:(id)a4;
+ (id)applyHSLTransform:(id)a3 toColor:(id)a4;
+ (id)applyRGBTransform:(id)a3 toColor:(id)a4 skipGamma:(BOOL)a5;
+ (id)colorByApplyingTransforms:(id)a3 toColor:(id)a4;
- (BOOL)isEqual:(id)a3;
- (OADColorTransform)initWithType:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)type;
- (unint64_t)hash;
@end

@implementation OADColorTransform

- (OADColorTransform)initWithType:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OADColorTransform;
  result = [(OADColorTransform *)&v5 init];
  if (result) {
    result->mType = a3;
  }
  return result;
}

+ (id)colorByApplyingTransforms:(id)a3 toColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 red];
  if (v8 == 0.0 && ([v7 blue], v9 == 0.0))
  {
    [v7 green];
    BOOL v11 = v10 == 0.0;
  }
  else
  {
    BOOL v11 = 0;
  }
  for (unsigned int i = 0; ; unsigned int i = v13 + 1)
  {
    unsigned int v13 = i;
    if ([v6 count] <= (unint64_t)i) {
      break;
    }
    v14 = [v6 objectAtIndex:i];
    switch([v14 type])
    {
      case 1u:
        float v53 = 0.0;
        [v7 red];
        float v53 = v18;
        float v52 = 0.0;
        [v7 green];
        float v52 = v19;
        float v51 = 0.0;
        [v7 blue];
        float v51 = v20;
        float v50 = 0.0;
        uint64_t v49 = 0;
        convertRgbToHsl(v53, v52, v20, &v50, (float *)&v49 + 1, (float *)&v49);
        float v21 = (float)((float)((float)(v50 + 180.0) / 360.0) - floorf((float)(v50 + 180.0) / 360.0)) * 360.0;
        double v22 = *((float *)&v49 + 1);
        if (*((float *)&v49 + 1) < 0.0) {
          double v22 = 0.0;
        }
        float v23 = fmin(v22, 1.0);
        *((float *)&v49 + 1) = v23;
        float v50 = v21;
        double v24 = *(float *)&v49;
        if (*(float *)&v49 < 0.0) {
          double v24 = 0.0;
        }
        float v25 = fmin(v24, 1.0);
        *(float *)&uint64_t v49 = v25;
        convertHslToRgb(v21, v23, v25, &v53, &v52, &v51);
        *(float *)&double v27 = v52;
        *(float *)&double v26 = v53;
        *(float *)&double v28 = v51;
        uint64_t v16 = +[OADRgbColor rgbColorWithRed:v26 green:v27 blue:v28];
        goto LABEL_10;
      case 2u:
        LODWORD(v15) = 1074580685;
        v29 = [a1 applyExpTransformWithValue:v7 toColor:v15];

        [v29 red];
        float v31 = v30;
        [v29 green];
        float v33 = v32;
        [v29 blue];
        *(float *)&double v34 = 1.0 - v33;
        *(float *)&double v36 = 1.0 - v35;
        *(float *)&double v37 = 1.0 - v31;
        v38 = +[OADRgbColor rgbColorWithRed:v37 green:v34 blue:v36];

        LODWORD(v39) = 1055439406;
        id v7 = [a1 applyExpTransformWithValue:v38 toColor:v39];

        break;
      case 3u:
        [v7 red];
        float v41 = v40;
        [v7 green];
        float v43 = v42;
        [v7 blue];
        double v44 = v43 * 0.59;
        double v45 = v44 + v41 * 0.3;
        double v47 = v45 + v46 * 0.11;
        *(float *)&double v47 = v47;
        LODWORD(v45) = LODWORD(v47);
        LODWORD(v44) = LODWORD(v47);
        uint64_t v16 = +[OADRgbColor rgbColorWithRed:v47 green:v45 blue:v44];
        goto LABEL_10;
      case 4u:
      case 5u:
        uint64_t v16 = [a1 applyRGBTransform:v14 toColor:v7 skipGamma:0];
        goto LABEL_10;
      case 9u:
      case 0xAu:
      case 0xBu:
      case 0xCu:
      case 0xDu:
      case 0xEu:
      case 0xFu:
      case 0x10u:
      case 0x11u:
        uint64_t v16 = [a1 applyHSLTransform:v14 toColor:v7];
        goto LABEL_10;
      case 0x12u:
      case 0x13u:
      case 0x14u:
      case 0x15u:
      case 0x16u:
      case 0x17u:
      case 0x18u:
      case 0x19u:
      case 0x1Au:
        uint64_t v16 = [a1 applyRGBTransform:v14 toColor:v7 skipGamma:v11];
        goto LABEL_10;
      case 0x1Bu:
        LODWORD(v15) = 1055439406;
        uint64_t v16 = [a1 applyExpTransformWithValue:v7 toColor:v15];
        goto LABEL_10;
      case 0x1Cu:
        LODWORD(v15) = 1074580685;
        uint64_t v16 = [a1 applyExpTransformWithValue:v7 toColor:v15];
        goto LABEL_10;
      case 0x1Du:
        [v14 value];
        uint64_t v16 = objc_msgSend(a1, "applyExpTransformWithValue:toColor:", v7);
LABEL_10:
        v17 = (void *)v16;

        id v7 = v17;
        break;
      default:
        break;
    }
  }
  return v7;
}

+ (float)alphaByApplyingTransforms:(id)a3 toAlpha:(float)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 count];
  if (v7)
  {
    uint64_t v8 = 0;
    do
    {
      float v9 = [v6 objectAtIndex:v8];
      if ([v9 type] - 6 < 3)
      {
        *(float *)&double v10 = a4;
        [a1 applyAlphaTransform:v9 toAlpha:v10];
        a4 = v11;
      }

      ++v8;
    }
    while (v7 != v8);
  }

  return a4;
}

- (int)type
{
  return self->mType;
}

+ (float)applyAlphaTransform:(id)a3 toAlpha:(float)a4
{
  id v5 = a3;
  [v5 value];
  float v7 = v6;
  int v8 = [v5 type];
  if (v8 != 6)
  {
    float v9 = v7 * a4;
    if (v8 != 8) {
      float v9 = a4;
    }
    if (v8 == 7) {
      float v7 = v7 + a4;
    }
    else {
      float v7 = v9;
    }
  }
  double v10 = v7;
  if (v7 < 0.0) {
    double v10 = 0.0;
  }
  float v11 = fmin(v10, 1.0);

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int mType = self->mType;
    BOOL v6 = mType == [v4 type];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)applyRGBTransform:(id)a3 toColor:(id)a4 skipGamma:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!a5)
  {
    LODWORD(v10) = 1074580685;
    uint64_t v11 = [a1 applyExpTransformWithValue:v9 toColor:v10];

    id v9 = (id)v11;
  }
  [v9 red];
  float v13 = v12;
  [v9 green];
  float v15 = v14;
  [v9 blue];
  float v17 = v16;
  [v8 value];
  float v19 = v18;
  switch([v8 type])
  {
    case 4u:
      float v13 = (float)(1.0 - v19) + (float)(v13 * v19);
      float v15 = (float)(1.0 - v19) + (float)(v15 * v19);
      float v17 = (float)(1.0 - v19) + (float)(v17 * v19);
      break;
    case 5u:
      float v13 = v13 * v19;
      float v15 = v15 * v19;
      goto LABEL_6;
    case 0x12u:
      float v13 = v19;
      break;
    case 0x13u:
      float v13 = v13 + v19;
      break;
    case 0x14u:
      float v13 = v13 * v19;
      break;
    case 0x15u:
      float v15 = v19;
      break;
    case 0x16u:
      float v15 = v15 + v19;
      break;
    case 0x17u:
      float v15 = v15 * v19;
      break;
    case 0x18u:
      float v17 = v19;
      break;
    case 0x19u:
      float v17 = v17 + v19;
      break;
    case 0x1Au:
LABEL_6:
      float v17 = v17 * v19;
      break;
    default:
      break;
  }
  double v20 = v13;
  double v21 = 0.0;
  if (v13 < 0.0) {
    double v20 = 0.0;
  }
  double v22 = fmin(v20, 1.0);
  *(float *)&double v22 = v22;
  double v23 = v15;
  if (v15 < 0.0) {
    double v23 = 0.0;
  }
  double v24 = fmin(v23, 1.0);
  *(float *)&double v24 = v24;
  if (v17 >= 0.0) {
    double v21 = v17;
  }
  double v25 = fmin(v21, 1.0);
  *(float *)&double v25 = v25;
  double v26 = +[OADRgbColor rgbColorWithRed:v22 green:v24 blue:v25];

  if (!a5)
  {
    LODWORD(v27) = 1055439406;
    uint64_t v28 = [a1 applyExpTransformWithValue:v26 toColor:v27];

    double v26 = (void *)v28;
  }

  return v26;
}

+ (id)applyExpTransformWithValue:(float)a3 toColor:(id)a4
{
  id v5 = a4;
  [v5 red];
  float v7 = powf(v6, a3);
  [v5 green];
  float v9 = v8;
  [v5 blue];
  float v11 = v10;
  float v12 = powf(v9, a3);
  LODWORD(v13) = powf(v11, a3);
  *(float *)&double v14 = v7;
  *(float *)&double v15 = v12;
  float v16 = +[OADRgbColor rgbColorWithRed:v14 green:v15 blue:v13];

  return v16;
}

+ (id)applyHSLTransform:(id)a3 toColor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v6 red];
  float v8 = v7;
  float v32 = v7;
  [v6 green];
  float v10 = v9;
  float v31 = v9;
  [v6 blue];
  float v30 = v11;
  float v29 = 0.0;
  uint64_t v28 = 0;
  *(float *)&double v12 = convertRgbToHsl(v8, v10, v11, &v29, (float *)&v28 + 1, (float *)&v28);
  objc_msgSend(v5, "value", v12);
  float v14 = v13;
  switch([v5 type])
  {
    case 9u:
      float v29 = v14;
      break;
    case 0xAu:
      float v15 = v14 + v29;
      goto LABEL_5;
    case 0xBu:
      float v15 = v14 * v29;
LABEL_5:
      float v29 = v15;
      break;
    case 0xCu:
      *((float *)&v28 + 1) = v14;
      break;
    case 0xDu:
      float v16 = v14 + *((float *)&v28 + 1);
      goto LABEL_9;
    case 0xEu:
      float v16 = v14 * *((float *)&v28 + 1);
LABEL_9:
      *((float *)&v28 + 1) = v16;
      break;
    case 0xFu:
      *(float *)&uint64_t v28 = v14;
      break;
    case 0x10u:
      float v17 = v14 + *(float *)&v28;
      goto LABEL_13;
    case 0x11u:
      float v17 = v14 * *(float *)&v28;
LABEL_13:
      *(float *)&uint64_t v28 = v17;
      break;
    default:
      break;
  }
  float v18 = (float)((float)(v29 / 360.0) - floorf(v29 / 360.0)) * 360.0;
  double v19 = *((float *)&v28 + 1);
  double v20 = 0.0;
  if (*((float *)&v28 + 1) < 0.0) {
    double v19 = 0.0;
  }
  float v21 = fmin(v19, 1.0);
  *((float *)&v28 + 1) = v21;
  float v29 = v18;
  if (*(float *)&v28 >= 0.0) {
    double v20 = *(float *)&v28;
  }
  float v22 = fmin(v20, 1.0);
  *(float *)&uint64_t v28 = v22;
  convertHslToRgb(v18, v21, v22, &v32, &v31, &v30);
  *(float *)&double v24 = v31;
  *(float *)&double v23 = v32;
  *(float *)&double v25 = v30;
  double v26 = +[OADRgbColor rgbColorWithRed:v23 green:v24 blue:v25];

  return v26;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t mType = self->mType;
  return (id)[v4 initWithType:mType];
}

- (unint64_t)hash
{
  return self->mType;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADColorTransform;
  v2 = [(OADColorTransform *)&v4 description];
  return v2;
}

@end