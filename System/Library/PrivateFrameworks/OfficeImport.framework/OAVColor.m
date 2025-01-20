@interface OAVColor
+ (id)readColorFromAttribute:(id)a3 alpha:(float)a4 manager:(id)a5;
+ (id)readColorProperty:(int)a3 manager:(id)a4;
+ (id)readPropertyColorFromAttribute:(id)a3 manager:(id)a4;
+ (id)readRGBColorFromAttribute:(id)a3;
+ (int)readColorAdjustmentType:(id)a3;
+ (int)readColorProperty:(id)a3;
@end

@implementation OAVColor

+ (id)readColorFromAttribute:(id)a3 alpha:(float)a4 manager:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  v11 = [v8 stringByTrimmingCharactersInSet:v10];

  if ([v11 length])
  {
    v12 = [a1 readRGBColorFromAttribute:v11];
    if (!v12)
    {
      v12 = +[OAXColor readPresetColorFromAttribute:v11];
      if (!v12)
      {
        v12 = [a1 readPropertyColorFromAttribute:v11 manager:v9];
        if (!v12)
        {
          v12 = +[OAXColor readSystemColorFromAttribute:v11];
        }
      }
    }
    if (a4 != 1.0)
    {
      v13 = [(OADColorTransform *)[OADValueColorTransform alloc] initWithType:6];
      *(float *)&double v14 = a4;
      [(OADValueColorTransform *)v13 setValue:v14];
      [v12 addTransform:v13];
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)readRGBColorFromAttribute:(id)a3
{
  id v3 = a3;
  if ([v3 characterAtIndex:0] != 35)
  {
    v6 = 0;
    goto LABEL_11;
  }
  v4 = [v3 componentsSeparatedByString:@" "];
  v5 = [v4 objectAtIndex:0];

  int v14 = 0;
  int v12 = 0;
  int v13 = 0;
  if ([v5 length] == 4
    && sscanf((const char *)[v5 UTF8String], "#%01x%01x%01x", &v14, &v13, &v12) == 3)
  {
    v14 *= 17;
    v12 *= 17;
    v13 *= 17;
  }
  else if ([v5 length] != 7 {
         || sscanf((const char *)[v5 UTF8String], "#%02x%02x%02x", &v14, &v13, &v12) != 3)
  }
  {
    v6 = 0;
    goto LABEL_10;
  }
  v7 = [OADRgbColor alloc];
  *(float *)&double v8 = (float)v14;
  *(float *)&double v9 = (float)v13;
  *(float *)&double v10 = (float)v12;
  v6 = [(OADRgbColor *)v7 initWithRedByte:v8 greenByte:v9 blueByte:v10];
LABEL_10:

LABEL_11:
  return v6;
}

+ (id)readPropertyColorFromAttribute:(id)a3 manager:(id)a4
{
  id v22 = a3;
  id v23 = a4;
  v6 = [v22 componentsSeparatedByString:@" "];
  v21 = [v6 objectAtIndex:0];
  uint64_t v7 = objc_msgSend(a1, "readColorProperty:");
  if (v7 == -130883970)
  {
    double v8 = 0;
  }
  else
  {
    id v20 = a1;
    v19 = [a1 readColorProperty:v7 manager:v23];
    char v9 = 0;
    uint64_t v24 = 0;
    unsigned __int8 v10 = 0;
    uint64_t v11 = 0;
    for (unsigned int i = 1; objc_msgSend(v6, "count", v19) > (unint64_t)i; ++i)
    {
      int v13 = [v6 objectAtIndex:i];
      if ([v13 isEqualToString:@"invert"])
      {
        char v9 = 1;
      }
      else if ([v13 isEqualToString:@"invert128"])
      {
        BYTE4(v24) = 1;
      }
      else if ([v13 isEqualToString:@"gray"])
      {
        LOBYTE(v24) = 1;
      }
      else
      {
        uint64_t v14 = [v13 length];
        uint64_t v15 = objc_msgSend(v13, "rangeOfString:", @"(");
        if (v15 == 0x7FFFFFFFFFFFFFFFLL || [v13 characterAtIndex:v14 - 1] != 41)
        {

          break;
        }
        v16 = [v13 substringToIndex:v15];
        uint64_t v11 = [v20 readColorAdjustmentType:v16];
        v17 = objc_msgSend(v13, "substringWithRange:", v15 + 1, v14 - v15 - 2);
        unsigned __int8 v10 = [v17 intValue];
      }
    }
    double v8 = [[OADAdjustedColor alloc] initWithBaseColor:v19 adjustmentType:v11 adjustmentParam:v10 invert:v9 & 1 invert128:BYTE4(v24) & 1 gray:v24 & 1];
  }
  return v8;
}

+ (int)readColorProperty:(id)a3
{
  id v3 = a3;
  v4 = (void *)+[OAVColor readColorProperty:]::colorPropertyEnumMap;
  if (!+[OAVColor readColorProperty:]::colorPropertyEnumMap)
  {
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_16, 0, &dword_238A75000);
    }
    v5 = [[TCEnumerationMap alloc] initWithStructs:&+[OAVColor readColorProperty:]::colorPropertyEnumStructs count:7 caseSensitive:1];
    v6 = (void *)+[OAVColor readColorProperty:]::colorPropertyEnumMap;
    +[OAVColor readColorProperty:]::colorPropertyEnumMap = (uint64_t)v5;

    v4 = (void *)+[OAVColor readColorProperty:]::colorPropertyEnumMap;
  }
  int v7 = [v4 valueForString:v3];

  return v7;
}

+ (int)readColorAdjustmentType:(id)a3
{
  id v3 = a3;
  v4 = (void *)+[OAVColor readColorAdjustmentType:]::adjustmentTypeEnumMap;
  if (!+[OAVColor readColorAdjustmentType:]::adjustmentTypeEnumMap)
  {
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_37, 0, &dword_238A75000);
    }
    v5 = [[TCEnumerationMap alloc] initWithStructs:&+[OAVColor readColorAdjustmentType:]::adjustmentTypeEnumStructs count:6 caseSensitive:1];
    v6 = (void *)+[OAVColor readColorAdjustmentType:]::adjustmentTypeEnumMap;
    +[OAVColor readColorAdjustmentType:]::adjustmentTypeEnumMap = (uint64_t)v5;

    v4 = (void *)+[OAVColor readColorAdjustmentType:]::adjustmentTypeEnumMap;
  }
  int v7 = [v4 valueForString:v3];

  return v7;
}

+ (id)readColorProperty:(int)a3 manager:(id)a4
{
  id v6 = a4;
  double v8 = v6;
  char v9 = 0;
  switch(a3)
  {
    case 240:
      goto LABEL_3;
    case 241:
      if (([v6 isStroked] & 1) == 0) {
        goto LABEL_3;
      }
      goto LABEL_8;
    case 242:
      goto LABEL_8;
    case 243:
      uint64_t v10 = [v6 shadowColor];
      goto LABEL_9;
    case 245:
      uint64_t v10 = [v6 fillBgColor];
      goto LABEL_9;
    case 246:
      uint64_t v10 = [v6 strokeBgColor];
      goto LABEL_9;
    case 247:
      if ([v6 isFilled])
      {
LABEL_3:
        uint64_t v10 = [v8 fillFgColor];
      }
      else
      {
LABEL_8:
        uint64_t v10 = [v8 strokeFgColor];
      }
LABEL_9:
      char v9 = (void *)v10;
      break;
    default:
      break;
  }
  LODWORD(v7) = 1.0;
  uint64_t v11 = [a1 readColorFromAttribute:v9 alpha:v8 manager:v7];

  return v11;
}

@end