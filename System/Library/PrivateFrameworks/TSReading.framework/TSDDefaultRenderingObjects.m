@interface TSDDefaultRenderingObjects
+ (double)defaultAssetScaleForFrame:(id)a3;
+ (id)defaultBasicStrokes;
+ (id)defaultColorAndGrayscaleFillsForTheme:(id)a3;
+ (id)defaultColorAndGrayscaleFillsForTheme:(id)a3 withNoFillButton:(BOOL)a4;
+ (id)defaultColorFillsForTheme:(id)a3;
+ (id)defaultEndpoints;
+ (id)defaultFrames;
+ (id)defaultGradientFillsForTheme:(id)a3;
+ (id)defaultGrayscaleFillsWithNoFillButton:(BOOL)a3 forTheme:(id)a4;
+ (id)defaultGrayscaleTextColorsForTheme:(id)a3;
+ (id)defaultImageFillsForTheme:(id)a3;
+ (id)defaultLines;
+ (id)defaultPresetImageStrokesForTheme:(id)a3;
+ (id)defaultPresetStrokesForShapes;
+ (id)defaultShadowsForTheme:(id)a3;
+ (id)defaultStrokes;
+ (id)p_frameInspectorDictionary;
+ (id)p_transposedArrayOfColorFills:(id)a3;
@end

@implementation TSDDefaultRenderingObjects

+ (id)defaultColorFillsForTheme:(id)a3
{
  if (a3)
  {
    v3 = (void *)[a3 presetsOfKind:String];
    if (v3)
    {
      v4 = v3;
      if ([v3 count])
      {
        v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
        if ((unint64_t)[v4 count] >= 7)
        {
          unint64_t v6 = 6;
          do
            objc_msgSend(v5, "addObject:", +[TSDColorFill colorWithColor:](TSDColorFill, "colorWithColor:", objc_msgSend(v4, "objectAtIndex:", v6++)));
          while (v6 < [v4 count]);
        }
        if (v5) {
          return v5;
        }
      }
    }
  }
  v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v9 = [NSString stringWithUTF8String:"+[TSDDefaultRenderingObjects defaultColorFillsForTheme:]"];
  objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDefaultRenderingObjects.m"), 57, @"Couldn't find color fills in theme; falling back on hardcoded grayscale swatches.");
  return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.176470588, 0.235294118, 0.333333333, 1.0), +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.231372549, 0.349019608, 0.525490196, 1.0), +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:",
                 0.603921569,
                 0.71372549,
                 0.784313725,
                 1.0),
               +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.529, 0.359, 0.051, 1.0), +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.875, 0.502, 0.058, 1.0), +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.98, 0.801, 0.519,
                 1.0),
               +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.361, 0.101, 0.079, 1.0), +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.714, 0.171, 0.122, 1.0), +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.727, 0.441, 0.391,
                 1.0),
               +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.174, 0.257, 0.074, 1.0), +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.364, 0.467, 0.086, 1.0), +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.548, 0.696, 0.4,
                 1.0),
               +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.659, 0.195, 0.035, 1.0), +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.838, 0.256, 0.033, 1.0), +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 1.0, 0.685, 0.502,
                 1.0),
               +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.349019608, 0.180392157, 0.0980392157, 1.0), +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.447058824, 0.28627451, 0.203921569, 1.0), +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.780392157, 0.603921569, 0.509803922,
                 1.0),
               0);
}

+ (id)defaultGradientFillsForTheme:(id)a3
{
  v3 = (void *)[a3 presetsOfKind:String];
  if ([v3 count]) {
    return v3;
  }
  v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v6 = [NSString stringWithUTF8String:"+[TSDDefaultRenderingObjects defaultGradientFillsForTheme:]"];
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDefaultRenderingObjects.m"), 94, @"Couldn't find gradients in theme; falling back on hardcoded gradient swatches.");
  uint64_t v7 = [MEMORY[0x263F7C808] colorWithRed:0.580392157 green:0.0549019608 blue:0.0980392157 alpha:1.0];
  id v8 = +[TSDGradient linearGradientWithStartColor:endColor:](TSDAngleGradient, "linearGradientWithStartColor:endColor:", v7, [MEMORY[0x263F7C808] colorWithRed:0.305882353 green:0.0274509804 blue:0.0509803922 alpha:1.0]);
  uint64_t v9 = [MEMORY[0x263F7C808] colorWithRed:0.133333333 green:0.592156863 blue:0.062745098 alpha:1.0];
  id v10 = +[TSDGradient linearGradientWithStartColor:endColor:](TSDAngleGradient, "linearGradientWithStartColor:endColor:", v9, [MEMORY[0x263F7C808] colorWithRed:0.0862745098 green:0.329411765 blue:0.0470588235 alpha:1.0]);
  uint64_t v11 = [MEMORY[0x263F7C808] colorWithRed:0.0941176471 green:0.368627451 blue:0.803921569 alpha:1.0];
  id v12 = +[TSDGradient linearGradientWithStartColor:endColor:](TSDAngleGradient, "linearGradientWithStartColor:endColor:", v11, [MEMORY[0x263F7C808] colorWithRed:0.0509803922 green:0.180392157 blue:0.450980392 alpha:1.0]);
  return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v8, v10, v12, 0);
}

+ (id)defaultImageFillsForTheme:(id)a3
{
  return (id)[a3 presetsOfKind:String];
}

+ (id)defaultColorAndGrayscaleFillsForTheme:(id)a3
{
  v5 = objc_msgSend(a1, "p_transposedArrayOfColorFills:", objc_msgSend(a1, "defaultColorFillsForTheme:"));
  uint64_t v6 = [a1 defaultGrayscaleFillsWithNoFillButton:0 forTheme:a3];

  return (id)[v5 arrayByAddingObjectsFromArray:v6];
}

+ (id)defaultColorAndGrayscaleFillsForTheme:(id)a3 withNoFillButton:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = objc_msgSend(a1, "p_transposedArrayOfColorFills:", objc_msgSend(a1, "defaultColorFillsForTheme:"));
  uint64_t v8 = [a1 defaultGrayscaleFillsWithNoFillButton:v4 forTheme:a3];

  return (id)[v7 arrayByAddingObjectsFromArray:v8];
}

+ (id)defaultBasicStrokes
{
  uint64_t v2 = [MEMORY[0x263F7C808] blackColor];
  v3 = +[TSDStroke strokeWithColor:v2 width:5.0];
  [(TSDMutableStroke *)v3 setPattern:+[TSDStrokePattern solidPattern]];
  BOOL v4 = +[TSDStroke strokeWithColor:v2 width:5.0];
  [(TSDMutableStroke *)v4 setPattern:+[TSDStrokePattern shortDashPattern]];
  v5 = +[TSDStroke strokeWithColor:v2 width:5.0];
  [(TSDMutableStroke *)v5 setPattern:+[TSDStrokePattern mediumDashPattern]];
  uint64_t v6 = +[TSDStroke strokeWithColor:v2 width:5.0];
  [(TSDMutableStroke *)v6 setPattern:+[TSDStrokePattern longDashPattern]];
  uint64_t v7 = +[TSDStroke strokeWithColor:v2 width:5.0];
  [(TSDMutableStroke *)v7 setCap:1];
  [(TSDMutableStroke *)v7 setJoin:1];
  [(TSDMutableStroke *)v7 setPattern:+[TSDStrokePattern roundDashPattern]];
  return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v3, v4, v5, v6, v7, 0);
}

+ (id)defaultStrokes
{
  v5[5] = *MEMORY[0x263EF8340];
  id v2 = +[TSDDefaultRenderingObjects defaultBasicStrokes];
  uint64_t v3 = [MEMORY[0x263F7C808] blackColor];
  v5[0] = +[TSDSmartStroke strokeWithName:@"Chalk2" color:v3 width:10.0];
  v5[1] = +[TSDSmartStroke strokeWithName:@"Feathered Brush" color:v3 width:10.0];
  v5[2] = +[TSDStroke strokeWithColor:v3 width:5.0];
  v5[3] = +[TSDSmartStroke strokeWithName:@"Dry Brush" color:v3 width:10.0];
  v5[4] = +[TSDSmartStroke strokeWithName:@"Pen" color:v3 width:10.0];
  return (id)objc_msgSend(v2, "arrayByAddingObjectsFromArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v5, 5));
}

+ (id)defaultPresetStrokesForShapes
{
  v7[6] = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F7C808] blackColor];
  uint64_t v3 = +[TSDStroke strokeWithColor:v2 width:1.0];
  [(TSDMutableStroke *)v3 setPattern:+[TSDStrokePattern solidPattern]];
  BOOL v4 = +[TSDStroke strokeWithColor:v2 width:2.0];
  [(TSDMutableStroke *)v4 setPattern:+[TSDStrokePattern solidPattern]];
  v5 = +[TSDStroke strokeWithColor:v2 width:4.0];
  [(TSDMutableStroke *)v5 setPattern:+[TSDStrokePattern solidPattern]];
  v7[0] = v3;
  v7[1] = v4;
  v7[2] = v5;
  v7[3] = +[TSDSmartStroke strokeWithName:@"Dry Brush" color:v2 width:6.0];
  v7[4] = +[TSDSmartStroke strokeWithName:@"Chalk2" color:v2 width:6.0];
  v7[5] = +[TSDSmartStroke strokeWithName:@"Pen" color:v2 width:6.0];
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:6];
}

+ (id)defaultPresetImageStrokesForTheme:(id)a3
{
  v5 = (void *)[MEMORY[0x263EFF980] array];
  uint64_t v6 = [MEMORY[0x263F7C808] blackColor];
  uint64_t v7 = +[TSDStroke strokeWithColor:v6 width:1.0];
  [(TSDMutableStroke *)v7 setPattern:+[TSDStrokePattern solidPattern]];
  [v5 addObject:v7];
  uint64_t v8 = +[TSDStroke strokeWithColor:v6 width:2.0];
  [(TSDMutableStroke *)v8 setPattern:+[TSDStrokePattern solidPattern]];
  [v5 addObject:v8];
  uint64_t v9 = +[TSDStroke strokeWithColor:v6 width:4.0];
  [(TSDMutableStroke *)v9 setPattern:+[TSDStrokePattern solidPattern]];
  [v5 addObject:v9];
  id v10 = (void *)[MEMORY[0x263EFF980] array];
  if (a3)
  {
    uint64_t v11 = (void *)[a3 presetsOfKind:String];
    if (v11)
    {
      id v12 = v11;
      if ([v11 count])
      {
        if ([v12 count])
        {
          unint64_t v13 = 0;
          do
          {
            if ((unint64_t)[v10 count] > 2) {
              break;
            }
            v14 = objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", v13), "boxedValueForProperty:", 517);
            if ([v14 isFrame])
            {
              objc_opt_class();
              v15 = (void *)TSUDynamicCast();
              if ((objc_msgSend(v10, "containsObject:", objc_msgSend(v15, "frameName")) & 1) == 0)
              {
                [v5 addObject:v14];
                objc_msgSend(v10, "addObject:", objc_msgSend(v15, "frameName"));
              }
            }
            ++v13;
          }
          while (v13 < [v12 count]);
        }
      }
    }
  }
  if ((unint64_t)[v10 count] <= 2)
  {
    v16 = objc_msgSend(a1, "p_frameInspectorDictionary");
    if (v16)
    {
      v17 = (void *)[v16 objectForKey:@"Display Order"];
      if ((unint64_t)[v10 count] <= 2)
      {
        unint64_t v18 = 0;
        do
        {
          if (v18 >= [v17 count]) {
            break;
          }
          v19 = -[TSDFrame initWithFrameSpec:]([TSDFrame alloc], "initWithFrameSpec:", +[TSDFrameSpec frameSpecWithName:](TSDFrameSpec, "frameSpecWithName:", [v17 objectAtIndexedSubscript:v18]));
          if ((objc_msgSend(v10, "containsObject:", -[TSDFrame frameName](v19, "frameName")) & 1) == 0)
          {
            [v5 addObject:v19];
            objc_msgSend(v10, "addObject:", -[TSDFrame frameName](v19, "frameName"));
          }

          ++v18;
        }
        while ((unint64_t)[v10 count] < 3);
      }
    }
  }
  return v5;
}

+ (id)defaultLines
{
  v9[6] = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F7C808] blackColor];
  uint64_t v3 = +[TSDStroke strokeWithColor:v2 width:2.0];
  [(TSDMutableStroke *)v3 setPattern:+[TSDStrokePattern solidPattern]];
  id v4 = +[TSDLinePreset lineWithStroke:headLineEnd:tailLineEnd:](TSDLinePreset, "lineWithStroke:headLineEnd:tailLineEnd:", v3, +[TSDLineEnd none](TSDLineEnd, "none"), +[TSDLineEnd none]);
  v5 = +[TSDSmartStroke strokeWithName:@"Chalk2" color:v2 width:6.0];
  id v6 = +[TSDLinePreset lineWithStroke:headLineEnd:tailLineEnd:](TSDLinePreset, "lineWithStroke:headLineEnd:tailLineEnd:", v5, +[TSDLineEnd none](TSDLineEnd, "none"), +[TSDLineEnd none]);
  uint64_t v7 = +[TSDStroke strokeWithColor:v2 width:3.0];
  [(TSDMutableStroke *)v7 setPattern:+[TSDStrokePattern mediumDashPattern]];
  v9[0] = v4;
  v9[1] = v6;
  v9[2] = +[TSDLinePreset lineWithStroke:headLineEnd:tailLineEnd:](TSDLinePreset, "lineWithStroke:headLineEnd:tailLineEnd:", v7, +[TSDLineEnd none](TSDLineEnd, "none"), +[TSDLineEnd none]);
  v9[3] = +[TSDLinePreset lineWithStroke:headLineEnd:tailLineEnd:](TSDLinePreset, "lineWithStroke:headLineEnd:tailLineEnd:", v3, +[TSDLineEnd openArrow](TSDLineEnd, "openArrow"), +[TSDLineEnd openArrow]);
  v9[4] = +[TSDLinePreset lineWithStroke:headLineEnd:tailLineEnd:](TSDLinePreset, "lineWithStroke:headLineEnd:tailLineEnd:", v5, +[TSDLineEnd simpleArrow](TSDLineEnd, "simpleArrow"), +[TSDLineEnd simpleArrow]);
  v9[5] = +[TSDLinePreset lineWithStroke:headLineEnd:tailLineEnd:](TSDLinePreset, "lineWithStroke:headLineEnd:tailLineEnd:", v7, +[TSDLineEnd filledCircle](TSDLineEnd, "filledCircle"), +[TSDLineEnd filledCircle]);
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:6];
}

+ (id)defaultEndpoints
{
  v3[11] = *MEMORY[0x263EF8340];
  v3[1] = +[TSDLineEnd simpleArrow](TSDLineEnd, "simpleArrow", +[TSDLineEnd none]);
  v3[2] = +[TSDLineEnd filledCircle];
  v3[3] = +[TSDLineEnd filledDiamond];
  v3[4] = +[TSDLineEnd openArrow];
  v3[5] = +[TSDLineEnd filledArrow];
  v3[6] = +[TSDLineEnd filledSquare];
  v3[7] = +[TSDLineEnd openSquare];
  v3[8] = +[TSDLineEnd openCircle];
  v3[9] = +[TSDLineEnd invertedArrow];
  v3[10] = +[TSDLineEnd line];
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:11];
}

+ (id)defaultFrames
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[MEMORY[0x263EFF980] array];
  id v4 = objc_msgSend(a1, "p_frameInspectorDictionary");
  if (v4)
  {
    v5 = (void *)[v4 objectForKey:@"Display Order"];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [[TSDFrame alloc] initWithFrameSpec:+[TSDFrameSpec frameSpecWithName:*(void *)(*((void *)&v12 + 1) + 8 * v9)]];
          [v3 addObject:v10];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return (id)[MEMORY[0x263EFF8C0] arrayWithArray:v3];
}

+ (id)defaultShadowsForTheme:(id)a3
{
  if (a3)
  {
    uint64_t v3 = (void *)[a3 presetsOfKind:String];
    if (v3)
    {
      id v4 = v3;
      if ([v3 count])
      {
        v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
        if ([v4 count])
        {
          unint64_t v6 = 0;
          do
          {
            uint64_t v7 = (void *)[v4 objectAtIndexedSubscript:v6];
            if ([v7 isEnabled])
            {
              if ((v6 & 0xFFFFFFFFFFFFFFFELL) != 2) {
                objc_msgSend(v5, "addObject:", -[TSDShadowSwatch initWithShadow:]([TSDShadowSwatch alloc], "initWithShadow:", v7));
              }
            }
            ++v6;
          }
          while (v6 < [v4 count]);
        }
        if (v5) {
          return v5;
        }
      }
    }
  }
  uint64_t v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "colorWithWhite:alpha:", 0.0, 1.0), "CGColor");
  id v10 = [[TSDShadowSwatch alloc] initWithShadow:+[TSDShadow shadowWithAngle:v9 offset:1 radius:312.0 opacity:0.0 color:5.0 enabled:0.5]];
  uint64_t v11 = [[TSDShadowSwatch alloc] initWithShadow:+[TSDShadow shadowWithAngle:v9 offset:1 radius:312.0 opacity:3.0 color:5.0 enabled:0.5]];
  long long v12 = [[TSDShadowSwatch alloc] initWithShadow:+[TSDShadow shadowWithAngle:v9 offset:1 radius:312.0 opacity:6.0 color:8.0 enabled:0.5]];
  long long v13 = [[TSDShadowSwatch alloc] initWithShadow:+[TSDShadow shadowWithAngle:v9 offset:1 radius:312.0 opacity:6.0 color:8.0 enabled:0.5]];
  long long v14 = [[TSDShadowSwatch alloc] initWithShadow:+[TSDShadow curvedShadowWithOffset:v9 angle:1 radius:0.66577 curve:90.0 opacity:15.0 color:-0.123095 enabled:1.0]];
  long long v15 = [[TSDShadowSwatch alloc] initWithShadow:+[TSDShadow curvedShadowWithOffset:v9 angle:1 radius:1.0 curve:90.0 opacity:10.0 color:0.164879 enabled:0.75]];
  uint64_t v16 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "blackColor"), "CGColor");
  uint64_t v17 = [[TSDShadowSwatch alloc] initWithShadow:+[TSDShadow contactShadowWithAngle:v16 offset:1 radius:0.0 height:0.0 opacity:28.0 color:0.17365 enabled:0.75]];
  unint64_t v18 = [[TSDShadowSwatch alloc] initWithShadow:+[TSDShadow contactShadowWithAngle:v16 offset:1 radius:0.0 height:9.41875 opacity:30.0 color:0.25 enabled:0.75]];
  return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v10, v11, v12, v13, v14, v15, v17, v18, 0);
}

+ (id)defaultGrayscaleTextColorsForTheme:(id)a3
{
  return (id)[a1 defaultGrayscaleFillsWithNoFillButton:0 forTheme:a3];
}

+ (id)defaultGrayscaleFillsWithNoFillButton:(BOOL)a3 forTheme:(id)a4
{
  BOOL v4 = a3;
  if (!a4) {
    goto LABEL_9;
  }
  v5 = (void *)[a4 presetsOfKind:String];
  if (!v5) {
    goto LABEL_9;
  }
  unint64_t v6 = v5;
  if (![v5 count]) {
    goto LABEL_9;
  }
  uint64_t v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  for (uint64_t i = 0; i != 6; ++i)
  {
    uint64_t v9 = (void *)[v6 objectAtIndex:i];
    [v9 alphaComponent];
    if (v10 != 0.0) {
      objc_msgSend(v7, "addObject:", +[TSDColorFill colorWithColor:](TSDColorFill, "colorWithColor:", v9));
    }
  }
  if (!v7)
  {
LABEL_9:
    uint64_t v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"+[TSDDefaultRenderingObjects defaultGrayscaleFillsWithNoFillButton:forTheme:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDefaultRenderingObjects.m"), 378, @"Couldn't find grayscale fills in theme; falling back on hardcoded grayscale swatches.");
    uint64_t v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", +[TSDColorFill whiteColor](TSDColorFill, "whiteColor"), +[TSDColorFill colorWithWhite:alpha:](TSDColorFill, "colorWithWhite:alpha:", 0.8, 1.0), +[TSDColorFill colorWithWhite:alpha:](TSDColorFill, "colorWithWhite:alpha:", 0.4, 1.0), +[TSDColorFill colorWithWhite:alpha:](TSDColorFill, "colorWithWhite:alpha:", 0.2, 1.0), +[TSDColorFill blackColor](TSDColorFill, "blackColor"), 0);
  }
  if (v4) {
    objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x263EFF9D0], "null"));
  }
  return v7;
}

+ (double)defaultAssetScaleForFrame:(id)a3
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "p_frameInspectorDictionary"), "objectForKey:", @"Asset Scales"), "objectForKey:", objc_msgSend(a3, "frameName"));
  if (!v3) {
    return 1.0;
  }
  [v3 floatValue];
  return v4;
}

+ (id)p_frameInspectorDictionary
{
  if (p_frameInspectorDictionary_sOnce != -1) {
    dispatch_once(&p_frameInspectorDictionary_sOnce, &__block_literal_global_51);
  }
  return (id)p_frameInspectorDictionary_sFrameInspectorDictionary;
}

id __56__TSDDefaultRenderingObjects_p_frameInspectorDictionary__block_invoke()
{
  id result = (id)objc_msgSend(MEMORY[0x263EFF8F8], "dataWithContentsOfFile:options:error:", objc_msgSend((id)TSDBundle(), "pathForResource:ofType:inDirectory:", @"FrameInspectorLayoutInfo", @"plist", @"Frames"), 2, 0);
  if (result)
  {
    id result = (id)[MEMORY[0x263F08AC0] propertyListWithData:result options:0 format:0 error:0];
    p_frameInspectorDictionary_sFrameInspectorDictionary = (uint64_t)result;
  }
  return result;
}

+ (id)p_transposedArrayOfColorFills:(id)a3
{
  unint64_t v4 = [a3 count];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v4)
  {
    for (unint64_t i = 0; i != v4; ++i)
      objc_msgSend(v5, "addObject:", objc_msgSend(a3, "objectAtIndex:", i / (v4 >> 2) + 4 * (i % (v4 >> 2))));
  }

  return v5;
}

@end