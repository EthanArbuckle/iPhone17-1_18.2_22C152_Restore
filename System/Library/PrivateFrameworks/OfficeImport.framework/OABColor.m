@interface OABColor
+ (EshColor)propertyColor:(int)a3 colorPropertiesManager:(id)a4;
+ (id)readColor:(const EshColor *)a3 colorPropertiesManager:(id)a4 state:(id)a5;
+ (int)readColorAdjustmentType:(int)a3;
+ (int)readSystemColorID:(int)a3;
+ (int)writeSystemColorID:(int)a3;
@end

@implementation OABColor

+ (EshColor)propertyColor:(int)a3 colorPropertiesManager:(id)a4
{
  v6 = v4;
  id v7 = a4;
  id v12 = v7;
  switch(a3)
  {
    case 240:
      if (v7) {
        goto LABEL_18;
      }
      goto LABEL_19;
    case 241:
      int v8 = [v7 isStroked];
      id v9 = v12;
      if (v8) {
        goto LABEL_5;
      }
      goto LABEL_17;
    case 242:
      if (v7) {
        goto LABEL_8;
      }
      goto LABEL_19;
    case 243:
      if (!v7) {
        goto LABEL_19;
      }
      [v7 shadowColor];
      goto LABEL_20;
    case 245:
      if (!v7) {
        goto LABEL_19;
      }
      [v7 fillBgColor];
      goto LABEL_20;
    case 246:
      if (!v7) {
        goto LABEL_19;
      }
      [v7 strokeBgColor];
      goto LABEL_20;
    case 247:
      int v10 = [v7 isFilled];
      id v9 = v12;
      if (v10)
      {
LABEL_17:
        id v7 = v9;
        if (v9)
        {
LABEL_18:
          [v7 fillFgColor];
          goto LABEL_20;
        }
      }
      else
      {
LABEL_5:
        id v7 = v9;
        if (v9)
        {
LABEL_8:
          [v7 strokeFgColor];
          goto LABEL_20;
        }
      }
LABEL_19:
      void *v6 = 0;
LABEL_20:

      return v11;
    default:
      *(_DWORD *)v6 = 255;
      goto LABEL_20;
  }
}

+ (int)readColorAdjustmentType:(int)a3
{
  if ((a3 - 1) >= 6) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (id)readColor:(const EshColor *)a3 colorPropertiesManager:(id)a4 state:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  int v10 = 0;
  int var0 = a3->var0.var0;
  switch(a3->var0.var0)
  {
    case 0:
    case 2:
    case 4:
      id v12 = [OADRgbColor alloc];
      unsigned int Red = EshColor::getRed((EshColor *)a3);
      unsigned int Green = EshColor::getGreen((EshColor *)a3);
      unsigned int Blue = EshColor::getBlue((EshColor *)a3);
      *(float *)&double v16 = (float)Red;
      *(float *)&double v17 = (float)Green;
      *(float *)&double v18 = (float)Blue;
      v19 = [(OADRgbColor *)v12 initWithRedByte:v16 greenByte:v17 blueByte:v18];
      goto LABEL_6;
    case 1:
    case 3:
    case 5:
    case 6:
    case 7:
      break;
    case 8:
      uint64_t SchemeIndex = EshColor::getSchemeIndex((EshColor *)a3);
      v21 = [v9 colorPalette];
      v22 = v21;
      if (v21)
      {
        v23 = [v21 colorWithIndex:SchemeIndex];
        v24 = [OADRgbColor alloc];
        [v23 redComponent];
        double v26 = v25;
        [v23 greenComponent];
        double v28 = v27;
        [v23 blueComponent];
        float v29 = v26;
        *(float *)&double v30 = v28;
        *(float *)&double v32 = v31;
        *(float *)&double v31 = v29;
        int v10 = [(OADRgbColor *)v24 initWithRed:v31 green:v30 blue:v32];
      }
      else
      {
        int v10 = -[OADSchemeColor initWithSchemeColorIndex:]([OADSchemeColor alloc], "initWithSchemeColorIndex:", objc_msgSend((id)objc_msgSend(v9, "client"), "oadSchemeColorValueForEshSchemeColorIndex:state:", SchemeIndex, v9));
      }

      break;
    default:
      if (var0 == 33)
      {
        [a1 propertyColor:EshColor::getRed((EshColor *)a3) colorPropertiesManager:v8];
        if (v41 == 33)
        {
          v33 = +[OADRgbColor white];
          uint64_t v34 = [v33 copy];
        }
        else
        {
          v33 = [a1 readColor:&v41 colorPropertiesManager:v8 state:v9];
          uint64_t v35 = [a1 readColorAdjustmentType:EshColor::getAdjustmentType((EshColor *)a3)];
          v36 = [OADAdjustedColor alloc];
          uint64_t v37 = EshColor::getGreen((EshColor *)a3);
          uint64_t isInvert = EshColor::isInvert((EshColor *)a3);
          uint64_t isInvert128 = EshColor::isInvert128((EshColor *)a3);
          uint64_t v34 = [(OADAdjustedColor *)v36 initWithBaseColor:v33 adjustmentType:v35 adjustmentParam:v37 invert:isInvert invert128:isInvert128 gray:EshColor::isGray((EshColor *)a3)];
        }
        int v10 = (OADSchemeColor *)v34;
      }
      else if (var0 == 34)
      {
        v19 = -[OADSystemColor initWithSystemColorID:]([OADSystemColor alloc], "initWithSystemColorID:", [a1 readSystemColorID:EshColor::getRed((EshColor *)a3)]);
LABEL_6:
        int v10 = (OADSchemeColor *)v19;
      }
      break;
  }

  return v10;
}

+ (int)writeSystemColorID:(int)a3
{
  if ((a3 - 1) > 0x1A) {
    return 0;
  }
  else {
    return dword_238EDBFFC[a3 - 1];
  }
}

+ (int)readSystemColorID:(int)a3
{
  if (a3 > 0x18) {
    return 0;
  }
  else {
    return dword_238EDC068[a3];
  }
}

@end