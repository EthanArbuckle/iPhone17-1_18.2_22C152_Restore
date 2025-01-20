@interface PFXGraphicStyle
+ (id)frameSpecWithUri:(id)a3 contentState:(id)a4;
+ (id)mapCssBackgroundFromStyleProperties:(id)a3 contentState:(id)a4;
+ (id)mapCssStroke:(const char *)a3 fromStyleProperties:(id)a4 contentState:(id)a5;
+ (id)mapFillFromStyleProperties:(id)a3 contentState:(id)a4;
+ (id)mapMarkerProperty:(const char *)a3 fromStyleProperties:(id)a4 contentState:(id)a5;
+ (id)mapOpacityFromStyleProperties:(id)a3;
+ (id)mapReflectionFromStyleProperties:(id)a3;
+ (id)mapShadowFromStyleProperties:(id)a3 contentState:(id)a4;
+ (id)mapStrokeFromStyleProperties:(id)a3 contentState:(id)a4;
+ (id)newImageFillWithImageData:(id)a3 technique:(int)a4 tintColor:(id)a5 contentState:(id)a6;
+ (id)readGradientStopsFromArray:(id)a3 startIndex:(unint64_t)a4 contentState:(id)a5;
@end

@implementation PFXGraphicStyle

+ (id)frameSpecWithUri:(id)a3 contentState:(id)a4
{
  id v5 = +[PFXCommon absolutePathWithUrl:[a3 stringByRemovingPercentEncoding] relativeToFile:[a4 entryURI]];
  id v6 = [v5 lastPathComponent];
  v7 = (PFXFrameSpec *)[a4 frameSpecForName:v6];
  if (v7) {
    return v7;
  }
  id v8 = objc_msgSend(objc_alloc((Class)NSBundle), "initWithPath:", objc_msgSend(objc_msgSend(objc_msgSend(a4, "archive"), "rootFolder"), "stringByAppendingPathComponent:", v5));
  if (v8)
  {
    v9 = v8;
    v7 = [[PFXFrameSpec alloc] initWithBundle:v8 basePath:v5 readerState:a4 isVolatile:1];

    if (v7)
    {
      [a4 cacheFrameSpec:v7];

      return v7;
    }
  }

  return +[TSDFrameSpec frameSpecWithName:v6];
}

+ (id)mapStrokeFromStyleProperties:(id)a3 contentState:(id)a4
{
  id v7 = [a3 valueForProperty:PFXPropNmApplePubStroke[0]];
  if ([v7 count] == (char *)&dword_0 + 3
    && objc_msgSend(+[PFXStyleUtilities identValueInPair:](PFXStyleUtilities, "identValueInPair:", objc_msgSend(v7, "objectAtIndex:", 0)), "isEqualToString:", @"frame"))
  {
    id v8 = +[PFXStyleUtilities stringInPair:](PFXStyleUtilities, "stringInPair:", [v7 objectAtIndex:1]);
    objc_msgSend(+[PFXStyleUtilities numberStringInPair:](PFXStyleUtilities, "numberStringInPair:", objc_msgSend(v7, "objectAtIndex:", 2)), "doubleValue");
    return [objc_alloc((Class)TSDFrame) initWithFrameSpec:[a1 frameSpecWithUri:v8 contentState:a4] assetScale:v9];
  }
  id v11 = [a3 valueForProperty:"stroke"];
  if ([v11 count] != (char *)&dword_0 + 1) {
    return +[TSDStroke emptyStroke];
  }
  id v12 = +[PFXStyleUtilities htmlPairToColor:](PFXStyleUtilities, "htmlPairToColor:", [v11 objectAtIndex:0]);
  if (!v12) {
    return +[TSDStroke emptyStroke];
  }
  id v13 = [a3 valueForProperty:"stroke-width"];
  if (v13)
  {
    +[PFXStyleUtilities pointLengthInArray:v13 readerState:a4];
    double v15 = v14;
  }
  else
  {
    double v15 = 1.0;
  }
  if ([v7 count] != (char *)&dword_0 + 2
    || !objc_msgSend(+[PFXStyleUtilities identValueInPair:](PFXStyleUtilities, "identValueInPair:", objc_msgSend(v7, "objectAtIndex:", 0)), "isEqualToString:", @"smart"))
  {
    id v18 = [[[a3 valueForProperty:@"stroke-linecap"] lastObject] value];
    if ([v18 isEqualToString:@"round"])
    {
      uint64_t v19 = 1;
    }
    else if ([v18 isEqualToString:@"square"])
    {
      uint64_t v19 = 2;
    }
    else
    {
      uint64_t v19 = 0;
    }
    id v20 = [[[a3 valueForProperty:@"stroke-linejoin"] lastObject] value];
    if ([v20 isEqualToString:@"round"])
    {
      uint64_t v21 = 1;
    }
    else if ([v20 isEqualToString:@"bevel"])
    {
      uint64_t v21 = 2;
    }
    else
    {
      uint64_t v21 = 0;
    }
    objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "valueForProperty:", "stroke-miterlimit"), "lastObject"), "value"), "doubleValue");
    double v23 = v22;
    id v24 = [a3 valueForProperty:"stroke-dashoffset"];
    if (v24)
    {
      +[PFXStyleUtilities pointLengthInArray:v24 readerState:a4];
      double v26 = v25 / v15;
    }
    else
    {
      double v26 = 0.0;
    }
    v27 = (TSDStrokePattern *)+[TSDStrokePattern solidPattern];
    id v28 = [a3 valueForProperty:"stroke-dasharray"];
    v29 = v28;
    if (!v28) {
      return [objc_alloc((Class)TSDStroke) initWithColor:v12 width:v19 cap:v21 join:v27 pattern:v15 miterLimit:v23];
    }
    if ((unint64_t)[v28 count] <= 6)
    {
      id v30 = [v29 count];
      if (!v30)
      {
LABEL_35:
        v27 = +[TSDStrokePattern strokePatternWithPattern:v33 count:v30 phase:v26];
        return [objc_alloc((Class)TSDStroke) initWithColor:v12 width:v19 cap:v21 join:v27 pattern:v15 miterLimit:v23];
      }
    }
    else
    {
      id v30 = &dword_4 + 2;
    }
    for (i = 0; i != v30; i = (char *)i + 1)
    {
      objc_msgSend(objc_msgSend(objc_msgSend(v29, "objectAtIndex:", i), "value"), "doubleValue");
      v33[(void)i] = v32 / v15;
    }
    goto LABEL_35;
  }
  id v16 = +[PFXStyleUtilities stringInPair:](PFXStyleUtilities, "stringInPair:", [v7 objectAtIndex:1]);
  id v17 = +[TSDSmartStroke classForName:v16];
  if ([v17 isEqual:objc_opt_class()]) {
    +[NSException raise:NSGenericException format:@"Unsupported smart stroke"];
  }
  id result = [v17 strokeWithName:v16 color:v12 width:v15];
  if (!result)
  {
    +[NSException raise:NSGenericException format:@"Unable to load smart stroke"];
    return 0;
  }
  return result;
}

+ (id)mapCssStroke:(const char *)a3 fromStyleProperties:(id)a4 contentState:(id)a5
{
  id v6 = [a4 valueForProperty:a3];
  if (![v6 count]) {
    goto LABEL_8;
  }
  if ([v6 count] == (char *)&dword_0 + 1)
  {
    id v7 = [v6 objectAtIndex:0];
    if ([v7 type] == &stru_108) {
      objc_msgSend(objc_msgSend(v7, "value"), "isEqual:", @"none");
    }
    goto LABEL_8;
  }
  if ([v6 count] != (char *)&dword_0 + 3)
  {
LABEL_8:
    return +[TSDStroke emptyStroke];
  }
  +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", [v6 objectAtIndex:0], a5);
  double v9 = v8;
  id v10 = +[PFXStyleUtilities htmlPairToColor:](PFXStyleUtilities, "htmlPairToColor:", [v6 objectAtIndex:2]);
  id v11 = objc_msgSend(objc_msgSend(v6, "objectAtIndex:", 1), "value");
  id v12 = +[TSDStrokePattern solidPattern];
  if ([v11 isEqualToString:@"solid"])
  {
    id v13 = +[TSDStrokePattern solidPattern];
LABEL_15:
    id v12 = v13;
    goto LABEL_16;
  }
  if ([v11 isEqualToString:@"dotted"])
  {
    id v13 = +[TSDStrokePattern roundDashPattern];
    goto LABEL_15;
  }
  if ([v11 isEqualToString:@"dashed"])
  {
    id v13 = +[TSDStrokePattern mediumDashPattern];
    goto LABEL_15;
  }
LABEL_16:

  return +[TSDStroke strokeWithColor:v10 width:0 cap:0 join:v12 pattern:v9];
}

+ (id)mapShadowFromStyleProperties:(id)a3 contentState:(id)a4
{
  id v5 = [a3 valueForProperty:"box-shadow"];
  if (!v5)
  {
LABEL_5:
    return +[TSDShadow defaultDisabledShadow];
  }
  id v6 = v5;
  if ([v5 count] == (char *)&dword_0 + 1)
  {
    id v7 = [v6 objectAtIndex:0];
    if ([v7 type] == &stru_108
      && objc_msgSend(objc_msgSend(v7, "value"), "isEqual:", @"none"))
    {
      goto LABEL_5;
    }
    return 0;
  }
  if ([v6 count] != &dword_4) {
    return 0;
  }
  +[PFXStyleUtilities pointLengthInArray:[v6 subarrayWithRange:0, 1] readerState:a4];
  long double v10 = v9;
  +[PFXStyleUtilities pointLengthInArray:[v6 subarrayWithRange:1, 1] readerState:a4];
  long double v12 = v11;
  +[PFXStyleUtilities pointLengthInArray:readerState:](PFXStyleUtilities, "pointLengthInArray:readerState:", [v6 subarrayWithRange:2, 1], a4);
  double v14 = v13;
  id v15 = [PFXStyleUtilities colorInArray:[v6 subarrayWithRange:3, 1]];
  double v16 = atan2(v12, v10) * 180.0 / 3.14159265;
  double v17 = hypot(v10, v12);
  id v18 = [v15 CGColor];

  return +[TSDShadow shadowWithAngle:v18 offset:1 radius:v16 opacity:v17 color:v14 enabled:1.0];
}

+ (id)mapFillFromStyleProperties:(id)a3 contentState:(id)a4
{
  unsigned int v6 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "archive"), "asset"), "isEpub");
  id v7 = PFXPropNmBackground;
  if (!v6) {
    id v7 = PFXPropNmFill;
  }
  id v8 = [a3 valueForProperty:*v7];
  if ([v8 count] != (char *)&dword_0 + 1
    && objc_msgSend(objc_msgSend(objc_msgSend(a4, "archive"), "asset"), "isEpub"))
  {
    id v8 = [a3 valueForProperty:"-ibooks-popover-background"];
  }
  if ([v8 count] != (char *)&dword_0 + 1) {
    return 0;
  }
  id v9 = [v8 objectAtIndex:0];
  long double v10 = (section_64 *)[v9 type];
  id v11 = [v9 value];
  if ((uint64_t)v10 > 296)
  {
    if (v10 == (section_64 *)((char *)&stru_108.addr + 1))
    {
      id result = objc_msgSend(objc_msgSend(a4, "svgDefinitionCache"), "objectForKey:", objc_msgSend(v11, "substringWithRange:", 5, (char *)objc_msgSend(v11, "length") - 6));
      if (result) {
        return result;
      }
      return 0;
    }
    if (v10 != (section_64 *)((char *)&stru_108.addr + 2)) {
      return 0;
    }
    goto LABEL_18;
  }
  if (v10 != &stru_108)
  {
    if (v10 != (section_64 *)&stru_108.sectname[1]) {
      return 0;
    }
LABEL_18:
    id v13 = +[PFXStyleUtilities htmlPairToColor:v9];
    if (v13)
    {
      return +[TSDColorFill colorWithColor:v13];
    }
    return 0;
  }
  if (![v11 isEqual:@"none"]) {
    goto LABEL_18;
  }

  return +[NSNull null];
}

+ (id)readGradientStopsFromArray:(id)a3 startIndex:(unint64_t)a4 contentState:(id)a5
{
  unint64_t v7 = (unint64_t)[a3 count] - a4;
  id v8 = +[NSMutableArray arrayWithCapacity:v7 >> 1];
  if (v7 >= 2)
  {
    unint64_t v9 = a4 + 1;
    if (v7 >> 1 <= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v7 >> 1;
    }
    do
    {
      id v11 = [a3 objectAtIndex:v9];
      if ([v11 type] == (char *)&stru_108.addr + 2)
      {
        id v12 = [v11 value];
        if (objc_msgSend(objc_msgSend(v12, "objectAtIndex:", 0), "isEqual:", @"color-stop("))
        {
          id v13 = [v12 objectAtIndex:1];
          objc_msgSend(objc_msgSend(objc_msgSend(v13, "objectAtIndex:", 0), "value"), "doubleValue");
          id v15 = [objc_alloc((Class)TSDGradientStop) initWithColor:[PFXStyleUtilities htmlPairToColor:[v13 objectAtIndex:2]] fraction:v14];
          [(NSMutableArray *)v8 addObject:v15];
        }
      }
      v9 += 2;
      --v10;
    }
    while (v10);
  }
  return v8;
}

+ (id)newImageFillWithImageData:(id)a3 technique:(int)a4 tintColor:(id)a5 contentState:(id)a6
{
  id v8 = [objc_alloc((Class)TSDMutableImageFill) initWithImageData:a3 technique:a4 tintColor:a5 size:CGSizeZero.width, CGSizeZero.height];
  [a6 applePubVersion];
  if (v9 >= 1.00999999 && [a3 typeConformsToImage])
  {
    id v10 = [objc_alloc((Class)TSDBitmapImageProvider) initWithImageData:a3];
    id v11 = v10;
    if (v10)
    {
      id v12 = [v10 imageDPI];
      if ((unint64_t)v12 >= 0x49)
      {
        double v13 = 72.0 / (double)(unint64_t)v12;
        [v11 naturalSize];
        [v8 setFillSize:ceil(v13 * v14), ceil(v13 * v15)];
      }
    }
  }
  return v8;
}

+ (id)mapCssBackgroundFromStyleProperties:(id)a3 contentState:(id)a4
{
  id v7 = [a3 valueForProperty:"background-color"];
  id v8 = [a3 valueForProperty:"background-image"];
  id v9 = [a3 valueForProperty:"background-size"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 count] == (char *)&dword_0 + 1)
  {
    id v10 = [v7 objectAtIndex:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = +[PFXStyleUtilities htmlPairToColor:v10];
      if (v11)
      {
        return +[TSDColorFill colorWithColor:v11];
      }
      if ([v10 type] == &stru_108
        && objc_msgSend(objc_msgSend(v10, "value"), "isEqual:", @"none"))
      {
        goto LABEL_39;
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v8 count] != (char *)&dword_0 + 1)
  {
LABEL_39:
    return +[NSNull null];
  }
  id v12 = [v8 objectAtIndex:0];
  double v13 = (char *)[v12 type];
  id v14 = [v12 value];
  double v15 = v14;
  if (v13 != (unsigned char *)&stru_108.addr + 1)
  {
    if (v13 == (unsigned char *)&stru_108.addr + 2)
    {
      if (objc_msgSend(objc_msgSend(v14, "objectAtIndex:", 0), "isEqualToString:", @"-webkit-gradient("))
      {
        id v16 = [v15 objectAtIndex:1];
        if ([v16 count])
        {
          id v17 = [v16 objectAtIndex:0];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (objc_msgSend(objc_msgSend(v17, "value"), "isEqual:", @"linear"))
            {
              id v18 = +[TSDMutableAngleGradient linearGradientWithGradientStops:](TSDMutableAngleGradient, "linearGradientWithGradientStops:", [a1 readGradientStopsFromArray:v16 startIndex:7 contentState:a4]);
              +[PFXStyleUtilities percentageInPair:](PFXStyleUtilities, "percentageInPair:", [v16 objectAtIndex:2]);
              double v20 = v19;
              +[PFXStyleUtilities percentageInPair:](PFXStyleUtilities, "percentageInPair:", [v16 objectAtIndex:3]);
              double v22 = v21;
              +[PFXStyleUtilities percentageInPair:](PFXStyleUtilities, "percentageInPair:", [v16 objectAtIndex:5]);
              double v24 = v23;
              +[PFXStyleUtilities percentageInPair:](PFXStyleUtilities, "percentageInPair:", [v16 objectAtIndex:6]);
              [v18 setGradientAngle:-atan2(v25 - v22, v24 - v20)];
              return v18;
            }
            if (objc_msgSend(objc_msgSend(v17, "value"), "isEqual:", @"radial"))
            {
              id v18 = +[TSDMutableTransformGradient radialGradientWithGradientStops:](TSDMutableTransformGradient, "radialGradientWithGradientStops:", [a1 readGradientStopsFromArray:v16 startIndex:11 contentState:a4]);
              +[PFXStyleUtilities percentageInPair:](PFXStyleUtilities, "percentageInPair:", [v16 objectAtIndex:2]);
              double v35 = v34;
              +[PFXStyleUtilities percentageInPair:](PFXStyleUtilities, "percentageInPair:", [v16 objectAtIndex:3]);
              double v37 = v36;
              +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", [v16 objectAtIndex:10], a4);
              double v39 = v38;
              +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", [v9 objectAtIndex:0], a4);
              double v41 = v40;
              +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", [v9 objectAtIndex:1], a4);
              double v43 = v42;
              [v18 setBaseNaturalSize:v41, v42];
              double v44 = atan(v43 / v41);
              [v18 setStartPoint:v35 * v41, v37 * v43];
              __double2 v45 = __sincos_stret(v44);
              [v18 setEndPoint:v39 * v45.__cosval + v35 * v41, v39 * v45.__sinval + v37 * v43];
              return v18;
            }
          }
        }
      }
    }
    goto LABEL_39;
  }
  id v26 = [a4 imageDataForUri:[v14 stringWithURLFromCssUriValue]];
  if ([v9 count] == (char *)&dword_0 + 2)
  {
    if (!qword_5736E0)
    {
      objc_sync_enter(a1);
      if (!qword_5736E0)
      {
        v27 = [[PFSPair alloc] initWithType:295 value:@"100"];
        __dmb(0xBu);
        qword_5736E0 = (uint64_t)v27;
      }
      objc_sync_exit(a1);
    }
    id v28 = [v9 objectAtIndex:0];
    if ([v28 isEqual:qword_5736E0])
    {
      id v29 = [v9 objectAtIndex:1];
      if ([v29 isEqual:qword_5736E0]) {
        uint64_t v30 = 1;
      }
      else {
        uint64_t v30 = 2;
      }
      goto LABEL_33;
    }
  }
  else if ([v9 count] == (char *)&dword_0 + 1)
  {
    id v31 = [v9 objectAtIndex:0];
    if ([v31 type] == &stru_108)
    {
      id v32 = [v31 value];
      if ([v32 isEqual:@"cover"])
      {
        uint64_t v30 = 3;
      }
      else if ([v32 isEqual:@"contain"])
      {
        uint64_t v30 = 4;
      }
      else if ([v32 isEqual:@"auto"])
      {
        uint64_t v30 = 0;
      }
      else
      {
        uint64_t v30 = 2;
      }
      goto LABEL_33;
    }
  }
  uint64_t v30 = 2;
LABEL_33:
  id v33 = [a1 newImageFillWithImageData:v26 technique:v30 tintColor:0 contentState:a4];

  return v33;
}

+ (id)mapMarkerProperty:(const char *)a3 fromStyleProperties:(id)a4 contentState:(id)a5
{
  id v6 = [a4 valueForProperty:a3];
  if ([v6 count] != (char *)&dword_0 + 1) {
    return 0;
  }
  id v7 = [v6 objectAtIndex:0];
  if ([v7 type] != (char *)&stru_108.addr + 1) {
    return 0;
  }
  id v8 = [v7 value];
  id v9 = [v8 substringWithRange:5, [v8 length] - 6];
  id v10 = [a5 svgDefinitionCache];

  return [v10 objectForKey:v9];
}

+ (id)mapReflectionFromStyleProperties:(id)a3
{
  id v3 = [a3 valueForProperty:PFXPropNmApplePubReflectionOpacity[0]];
  if (!v3) {
    return 0;
  }
  id v4 = [v3 objectAtIndex:0];
  if ([v4 type] != &stru_108.addr) {
    return 0;
  }
  objc_msgSend(objc_msgSend(v4, "value"), "doubleValue");
  if (v5 <= 0.0) {
    return 0;
  }
  id v6 = [objc_alloc((Class)TSDReflection) initWithOpacity:v5];

  return v6;
}

+ (id)mapOpacityFromStyleProperties:(id)a3
{
  id v3 = [a3 valueForProperty:"opacity"];
  if (!v3) {
    return 0;
  }
  id v4 = [v3 objectAtIndex:0];
  if ([v4 type] != &stru_108.addr) {
    return 0;
  }

  return [v4 value];
}

@end