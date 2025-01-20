@interface OAVStroke
+ (char)readPresetDashStyle:(id)a3;
+ (id)readFromManager:(id)a3;
+ (id)readLineEndWithType:(id)a3 width:(id)a4 length:(id)a5;
+ (id)targetFgColorWithManager:(id)a3;
+ (unsigned)readCapStyle:(id)a3;
+ (unsigned)readCompoundType:(id)a3;
+ (unsigned)readLineEndLength:(id)a3;
+ (unsigned)readLineEndType:(id)a3;
+ (unsigned)readLineEndWidth:(id)a3;
+ (void)initialize;
+ (void)readDashStyleFromManager:(id)a3 toStroke:(id)a4;
+ (void)readFillStyleFromManager:(id)a3 toStroke:(id)a4;
+ (void)readJoinStyleFromManager:(id)a3 toStroke:(id)a4;
@end

@implementation OAVStroke

+ (id)readFromManager:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(OADStroke);
  v6 = [a1 targetFgColorWithManager:v4];
  [(OADStroke *)v5 setColor:v6];

  [a1 readFillStyleFromManager:v4 toStroke:v5];
  [a1 readDashStyleFromManager:v4 toStroke:v5];
  [a1 readJoinStyleFromManager:v4 toStroke:v5];
  v7 = [v4 strokeStartArrowType];
  v8 = [v4 strokeStartArrowWidth];
  v9 = [v4 strokeStartArrowLength];
  v10 = [a1 readLineEndWithType:v7 width:v8 length:v9];
  [(OADStroke *)v5 setTail:v10];

  v11 = [v4 strokeEndArrowType];
  v12 = [v4 strokeEndArrowWidth];
  v13 = [v4 strokeEndArrowLength];
  v14 = [a1 readLineEndWithType:v11 width:v12 length:v13];
  [(OADStroke *)v5 setHead:v14];

  [v4 strokeWidth];
  -[OADStroke setWidth:](v5, "setWidth:");
  v15 = [v4 strokeCapStyle];
  -[OADStroke setCap:](v5, "setCap:", [a1 readCapStyle:v15]);
  v16 = [v4 strokeCompoundType];
  -[OADStroke setCompoundType:](v5, "setCompoundType:", [a1 readCompoundType:v16]);

  return v5;
}

+ (id)targetFgColorWithManager:(id)a3
{
  id v3 = a3;
  id v4 = [v3 strokeFgColor];
  [v3 strokeFgAlpha];
  v5 = +[OAVColor readColorFromAttribute:alpha:manager:](OAVColor, "readColorFromAttribute:alpha:manager:", v4, v3);

  return v5;
}

+ (void)readFillStyleFromManager:(id)a3 toStroke:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  char v7 = [v12 isStroked];
  v8 = [v12 strokeFillType];
  v9 = v8;
  if (v7)
  {
    if ([v8 isEqualToString:@"solid"])
    {
      v10 = objc_alloc_init(OADSolidFill);
      v11 = [a1 targetFgColorWithManager:v12];
      [(OADSolidFill *)v10 setColor:v11];
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = +[OADNullFill nullFill];
  }
  [v6 setFill:v10];
}

+ (void)readDashStyleFromManager:(id)a3 toStroke:(id)a4
{
  id v20 = a4;
  id v6 = [a3 strokeDashStyle];
  uint64_t v7 = [a1 readPresetDashStyle:v6];
  if (v7 == -1)
  {
    v9 = [v6 componentsSeparatedByString:@" "];
    unint64_t v10 = [v9 count];
    v8 = objc_alloc_init(OADCustomDash);
    v11 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v10 >> 1];
    if (v10 >= 2)
    {
      if (v10 >> 1 <= 1) {
        uint64_t v12 = 1;
      }
      else {
        uint64_t v12 = v10 >> 1;
      }
      uint64_t v13 = 1;
      do
      {
        v14 = [v9 objectAtIndex:v13 - 1];
        float v15 = OAVReadFraction(v14);

        v16 = [v9 objectAtIndex:v13];
        float v17 = OAVReadFraction(v16);

        *(float *)&double v18 = v15;
        *(float *)&double v19 = v17;
        +[OADDashStop addStopWithDash:v11 space:v18 toArray:v19];
        v13 += 2;
        --v12;
      }
      while (v12);
    }
    [(OADCustomDash *)v8 setStops:v11];
  }
  else
  {
    v8 = objc_alloc_init(OADPresetDash);
    [(OADCustomDash *)v8 setType:v7];
  }
  [v20 setDash:v8];
}

+ (char)readPresetDashStyle:(id)a3
{
  char v3 = [(id)presetDashStyleEnumMap valueForString:a3];
  if (v3 == 126) {
    return -1;
  }
  else {
    return v3;
  }
}

+ (void)readJoinStyleFromManager:(id)a3 toStroke:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  id v6 = [v10 strokeJoinStyle];
  if ([v6 isEqualToString:@"bevel"])
  {
    uint64_t v7 = off_264D60508;
LABEL_3:
    v8 = (OADMiterLineJoin *)objc_alloc_init(*v7);
    goto LABEL_9;
  }
  if ([v6 isEqualToString:@"miter"])
  {
    v9 = objc_alloc_init(OADMiterLineJoin);
    [v10 strokeMiterLimit];
    v8 = v9;
    -[OADMiterLineJoin setLimit:](v9, "setLimit:");
  }
  else
  {
    if ([v6 isEqualToString:@"round"])
    {
      uint64_t v7 = off_264D60540;
      goto LABEL_3;
    }
    v8 = 0;
  }
LABEL_9:
  [v5 setJoin:v8];
}

+ (unsigned)readLineEndType:(id)a3
{
  return [(id)lineEndTypeEnumMap valueForString:a3];
}

+ (unsigned)readLineEndWidth:(id)a3
{
  return [(id)lineEndWidthEnumMap valueForString:a3];
}

+ (unsigned)readLineEndLength:(id)a3
{
  return [(id)lineEndLengthEnumMap valueForString:a3];
}

+ (unsigned)readCapStyle:(id)a3
{
  return [(id)capStyleEnumMap valueForString:a3];
}

+ (unsigned)readCompoundType:(id)a3
{
  return [(id)compoundTypeEnumMap valueForString:a3];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_17, 0, &dword_238A75000);
    }
    v2 = [[TCEnumerationMap alloc] initWithStructs:&+[OAVStroke initialize]::compoundTypeEnumStructs count:5 caseSensitive:0];
    char v3 = (void *)compoundTypeEnumMap;
    compoundTypeEnumMap = (uint64_t)v2;

    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_47, 0, &dword_238A75000);
    }
    id v4 = [[TCEnumerationMap alloc] initWithStructs:&+[OAVStroke initialize]::presetDashStyleEnumStructs count:11 caseSensitive:0];
    id v5 = (void *)presetDashStyleEnumMap;
    presetDashStyleEnumMap = (uint64_t)v4;

    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_66, 0, &dword_238A75000);
    }
    id v6 = [[TCEnumerationMap alloc] initWithStructs:&+[OAVStroke initialize]::lineEndTypeEnumStructs count:6 caseSensitive:0];
    uint64_t v7 = (void *)lineEndTypeEnumMap;
    lineEndTypeEnumMap = (uint64_t)v6;

    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_76_0, 0, &dword_238A75000);
    }
    v8 = [[TCEnumerationMap alloc] initWithStructs:&+[OAVStroke initialize]::lineEndWidthEnumStructs count:3 caseSensitive:0];
    v9 = (void *)lineEndWidthEnumMap;
    lineEndWidthEnumMap = (uint64_t)v8;

    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_83, 0, &dword_238A75000);
    }
    id v10 = [[TCEnumerationMap alloc] initWithStructs:&+[OAVStroke initialize]::lineEndLengthEnumStructs count:3 caseSensitive:0];
    v11 = (void *)lineEndLengthEnumMap;
    lineEndLengthEnumMap = (uint64_t)v10;

    {
      __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_93, 0, &dword_238A75000);
    }
    uint64_t v12 = [[TCEnumerationMap alloc] initWithStructs:&+[OAVStroke initialize]::capStyleEnumStructs count:3 caseSensitive:0];
    uint64_t v13 = (void *)capStyleEnumMap;
    capStyleEnumMap = (uint64_t)v12;
  }
}

+ (id)readLineEndWithType:(id)a3 width:(id)a4 length:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_alloc_init(OADLineEnd);
  uint64_t v12 = [a1 readLineEndType:v8];
  uint64_t v13 = [a1 readLineEndWidth:v9];
  uint64_t v14 = [a1 readLineEndLength:v10];
  [(OADLineEnd *)v11 setType:v12];
  [(OADLineEnd *)v11 setWidth:v13];
  [(OADLineEnd *)v11 setLength:v14];

  return v11;
}

@end