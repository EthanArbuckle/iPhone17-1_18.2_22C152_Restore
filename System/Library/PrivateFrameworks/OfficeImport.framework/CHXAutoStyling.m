@interface CHXAutoStyling
+ (id)colorWithSchemeColorId:(int)a3 shade:(float)a4;
+ (id)colorWithSchemeColorId:(int)a3 tint:(float)a4;
+ (id)colorWithSchemeColorId:(int)a3 transformType:(int)a4 transformValue:(float)a5;
+ (int)styleColumnWithStyleId:(int)a3;
+ (int)styleIdWithStyleRow:(int)a3 styleColumn:(int)a4;
+ (int)styleRowWithStyleId:(int)a3;
- (BOOL)_autoChartFillIsHollow;
- (BOOL)_autoChartStrokeIsHollow;
- (id)autoAxisAndMajorGridColor;
- (id)autoChartAreaAndDataTableAndFloorStrokeColor;
- (id)autoChartAreaFillColor;
- (id)autoColorOfFirstColumnSeriesWithIndex:(unint64_t)a3 seriesCount:(unint64_t)a4;
- (id)autoColorOfSeriesWithIndex:(unint64_t)a3;
- (id)autoFloorAndWallsAndPlotArea2DFillColor;
- (id)autoMinorGridColor;
- (id)autoOtherStrokeColor;
- (id)autoStrokeForSeriesIndex:(unint64_t)a3;
- (id)autoTextFill;
- (int)styleColumn;
- (int)styleId;
- (int)styleRow;
- (unsigned)autoFloorAndChartAreaStrokeIndex;
- (unsigned)autoFloorAndWallsFillIndex;
- (void)resolveAxisGraphicProperties:(id)a3;
- (void)resolveChartAreaGraphicProperties:(id)a3;
- (void)resolveFloorGraphicProperties:(id)a3;
- (void)resolveGraphicPropertiesOfErrorBar:(id)a3 forSeriesIndex:(unint64_t)a4;
- (void)resolveGraphicPropertiesOfSeries:(id)a3 forSeriesIndex:(unint64_t)a4;
- (void)resolveGraphicPropertiesOfSeries:(id)a3 forSeriesIndex:(unint64_t)a4 isLine:(BOOL)a5;
- (void)resolveGraphicPropertiesOfTrendline:(id)a3 forSeriesIndex:(unint64_t)a4;
- (void)resolveLegendGraphicProperties:(id)a3;
- (void)resolveMajorGridLinesGraphicProperties:(id)a3;
- (void)resolveMarker:(id)a3 withSeriesGraphicProperties:(id)a4 forSeriesIndex:(unint64_t)a5 clientGraphicPropertyDefaults:(id)a6;
- (void)resolveMinorGridLinesGraphicProperties:(id)a3;
- (void)resolvePlotAreaGraphicProperties:(id)a3;
- (void)resolveWallGraphicProperties:(id)a3;
- (void)setDefaultErrorBarPropertiesInGraphicProperties:(id)a3;
- (void)set_autoChartFillIsHollow:(BOOL)a3;
- (void)set_autoChartStrokeIsHollow:(BOOL)a3;
@end

@implementation CHXAutoStyling

- (void)resolveChartAreaGraphicProperties:(id)a3
{
  id v15 = a3;
  v4 = objc_alloc_init(OADShapeStyle);
  int v5 = [(CHXAutoStyling *)self styleId];
  BOOL v6 = [(CHXAutoStyling *)self _autoChartFillIsHollow];
  if (v5 >= 33 || !v6)
  {
    v8 = [(CHXAutoStyling *)self autoChartAreaFillColor];
    [(OADShapeStyle *)v4 setFillMatrixIndex:1 color:v8];
  }
  BOOL v9 = [(CHXAutoStyling *)self _autoChartFillIsHollow];
  if ((v5 - 41) >= 0xFFFFFFF8 || !v9)
  {
    uint64_t v11 = [(CHXAutoStyling *)self autoFloorAndChartAreaStrokeIndex];
    v12 = [(CHXAutoStyling *)self autoChartAreaAndDataTableAndFloorStrokeColor];
    [(OADShapeStyle *)v4 setLineMatrixIndex:v11 color:v12];
  }
  v13 = [(OADDrawingTheme *)self->super.mDrawingTheme styleMatrix];
  LODWORD(v14) = 1.0;
  [(OADShapeStyle *)v4 applyToGraphicProperties:v15 styleMatrix:v13 useNull:1 strokeWidthMultiplier:v14];
}

- (int)styleRow
{
  uint64_t v2 = [(CHXAutoStyling *)self styleId];
  return +[CHXAutoStyling styleRowWithStyleId:v2];
}

+ (int)styleRowWithStyleId:(int)a3
{
  int v3 = a3 - 1;
  if (a3 < 1) {
    int v3 = a3 + 6;
  }
  return (v3 >> 3) + 1;
}

+ (id)colorWithSchemeColorId:(int)a3 tint:(float)a4
{
  return (id)objc_msgSend(a1, "colorWithSchemeColorId:transformType:transformValue:", *(void *)&a3, 4);
}

+ (id)colorWithSchemeColorId:(int)a3 transformType:(int)a4 transformValue:(float)a5
{
  uint64_t v6 = *(void *)&a4;
  v7 = +[OADSchemeColor schemeColorWithIndex:*(void *)&a3];
  *(float *)&double v8 = a5;
  [v7 addTransformOfType:v6 value:v8];
  return v7;
}

- (void)resolveFloorGraphicProperties:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v12 = v4;
    int v5 = objc_alloc_init(OADShapeStyle);
    if ([(CHXAutoStyling *)self styleId] >= 33)
    {
      uint64_t v6 = [(CHXAutoStyling *)self autoFloorAndWallsFillIndex];
      v7 = [(CHXAutoStyling *)self autoFloorAndWallsAndPlotArea2DFillColor];
      [(OADShapeStyle *)v5 setFillMatrixIndex:v6 color:v7];
    }
    uint64_t v8 = [(CHXAutoStyling *)self autoFloorAndChartAreaStrokeIndex];
    BOOL v9 = [(CHXAutoStyling *)self autoChartAreaAndDataTableAndFloorStrokeColor];
    [(OADShapeStyle *)v5 setLineMatrixIndex:v8 color:v9];

    v10 = [(OADDrawingTheme *)self->super.mDrawingTheme styleMatrix];
    LODWORD(v11) = 1.0;
    [(OADShapeStyle *)v5 applyToGraphicProperties:v12 styleMatrix:v10 useNull:1 strokeWidthMultiplier:v11];

    id v4 = v12;
  }
}

- (void)resolveWallGraphicProperties:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    int v5 = objc_alloc_init(OADShapeStyle);
    if ([(CHXAutoStyling *)self styleId] >= 33)
    {
      uint64_t v6 = [(CHXAutoStyling *)self autoFloorAndWallsFillIndex];
      v7 = [(CHXAutoStyling *)self autoFloorAndWallsAndPlotArea2DFillColor];
      [(OADShapeStyle *)v5 setFillMatrixIndex:v6 color:v7];
    }
    uint64_t v8 = [(OADDrawingTheme *)self->super.mDrawingTheme styleMatrix];
    LODWORD(v9) = 1.0;
    [(OADShapeStyle *)v5 applyToGraphicProperties:v10 styleMatrix:v8 useNull:1 strokeWidthMultiplier:v9];

    id v4 = v10;
  }
}

- (void)resolvePlotAreaGraphicProperties:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v14 = v4;
    int v5 = objc_alloc_init(OADShapeStyle);
    BOOL v6 = [(CHDChart *)self->super.mChart is3D];
    int v7 = [(CHXAutoStyling *)self styleId];
    if (!v6)
    {
      int v8 = v7;
      BOOL v9 = [(CHXAutoStyling *)self _autoChartFillIsHollow];
      if (v8 >= 33 || !v9)
      {
        double v11 = [(CHXAutoStyling *)self autoFloorAndWallsAndPlotArea2DFillColor];
        [(OADShapeStyle *)v5 setFillMatrixIndex:1 color:v11];
      }
    }
    id v12 = [(OADDrawingTheme *)self->super.mDrawingTheme styleMatrix];
    LODWORD(v13) = 1.0;
    [(OADShapeStyle *)v5 applyToGraphicProperties:v14 styleMatrix:v12 useNull:1 strokeWidthMultiplier:v13];

    id v4 = v14;
  }
}

- (void)resolveMinorGridLinesGraphicProperties:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    int v5 = objc_alloc_init(OADShapeStyle);
    BOOL v6 = [(CHXAutoStyling *)self autoMinorGridColor];
    [(OADShapeStyle *)v5 setLineMatrixIndex:1 color:v6];

    int v7 = [(OADDrawingTheme *)self->super.mDrawingTheme styleMatrix];
    LODWORD(v8) = 1.0;
    [(OADShapeStyle *)v5 applyToGraphicProperties:v9 styleMatrix:v7 useNull:1 strokeWidthMultiplier:v8];

    id v4 = v9;
  }
}

- (id)autoMinorGridColor
{
  int v2 = [(CHXAutoStyling *)self styleId];
  int v3 = objc_opt_class();
  if (v2 > 32)
  {
    LODWORD(v4) = *(_DWORD *)"fff?";
    uint64_t v5 = 12;
  }
  else
  {
    LODWORD(v4) = 0.5;
    uint64_t v5 = 1;
  }
  BOOL v6 = [v3 colorWithSchemeColorId:v5 tint:v4];
  return v6;
}

- (void)resolveMajorGridLinesGraphicProperties:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    uint64_t v5 = objc_alloc_init(OADShapeStyle);
    BOOL v6 = [(CHXAutoStyling *)self autoAxisAndMajorGridColor];
    [(OADShapeStyle *)v5 setLineMatrixIndex:1 color:v6];

    int v7 = [(OADDrawingTheme *)self->super.mDrawingTheme styleMatrix];
    LODWORD(v8) = 1.0;
    [(OADShapeStyle *)v5 applyToGraphicProperties:v9 styleMatrix:v7 useNull:1 strokeWidthMultiplier:v8];

    id v4 = v9;
  }
}

- (void)resolveAxisGraphicProperties:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    uint64_t v5 = objc_alloc_init(OADShapeStyle);
    BOOL v6 = [(CHXAutoStyling *)self autoAxisAndMajorGridColor];
    [(OADShapeStyle *)v5 setLineMatrixIndex:1 color:v6];

    int v7 = [(OADDrawingTheme *)self->super.mDrawingTheme styleMatrix];
    LODWORD(v8) = 1.0;
    [(OADShapeStyle *)v5 applyToGraphicProperties:v9 styleMatrix:v7 useNull:1 strokeWidthMultiplier:v8];

    id v4 = v9;
  }
}

- (int)styleColumn
{
  uint64_t v2 = [(CHXAutoStyling *)self styleId];
  return +[CHXAutoStyling styleColumnWithStyleId:v2];
}

+ (int)styleColumnWithStyleId:(int)a3
{
  int v3 = (a3 - 1) & 7;
  if (1 - a3 >= 0) {
    int v3 = -((1 - a3) & 7);
  }
  return v3 + 1;
}

- (void)resolveLegendGraphicProperties:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    uint64_t v5 = objc_alloc_init(OADShapeStyle);
    BOOL v6 = [(OADDrawingTheme *)self->super.mDrawingTheme styleMatrix];
    LODWORD(v7) = 1.0;
    [(OADShapeStyle *)v5 applyToGraphicProperties:v8 styleMatrix:v6 useNull:1 strokeWidthMultiplier:v7];

    id v4 = v8;
  }
}

- (id)autoColorOfFirstColumnSeriesWithIndex:(unint64_t)a3 seriesCount:(unint64_t)a4
{
  unint64_t v5 = a4 % 0x1D;
  if (!(a4 % 0x1D) || (a3 %= v5, v5 <= 5))
  {
    BOOL v6 = &-[CHXAutoStyling autoColorOfFirstColumnSeriesWithIndex:seriesCount:]::baseColors[a3];
LABEL_4:
    int v7 = *v6;
    int v8 = 255;
    goto LABEL_5;
  }
  if (v5 > 0xB)
  {
    if (v5 <= 0x11)
    {
      if (a3 < 6)
      {
        int v8 = 211;
        goto LABEL_26;
      }
      if (a3 > 0xB)
      {
LABEL_28:
        BOOL v6 = &-[CHXAutoStyling autoColorOfFirstColumnSeriesWithIndex:seriesCount:]::baseColors[a3 + 6];
        goto LABEL_4;
      }
LABEL_18:
      BOOL v6 = &-[CHXAutoStyling autoColorOfFirstColumnSeriesWithIndex:seriesCount:]::baseColors[a3 - 6];
      goto LABEL_4;
    }
    if (v5 > 0x17)
    {
      unint64_t v20 = a3 - 6;
      if (a3 < 6)
      {
        int v8 = 192;
        goto LABEL_26;
      }
      if (a3 > 0xB)
      {
        if (a3 <= 0x11)
        {
          BOOL v6 = &-[CHXAutoStyling autoColorOfFirstColumnSeriesWithIndex:seriesCount:]::baseColors[a3 - 12];
          goto LABEL_4;
        }
        if (a3 > 0x17) {
          goto LABEL_28;
        }
        goto LABEL_18;
      }
      int v8 = 226;
    }
    else
    {
      unint64_t v20 = a3 - 6;
      if (a3 < 6)
      {
        int v8 = 200;
        goto LABEL_26;
      }
      if (a3 > 0xB)
      {
        if (a3 > 0x11) {
          goto LABEL_28;
        }
        goto LABEL_18;
      }
      int v8 = 239;
    }
    a3 = v20;
    goto LABEL_26;
  }
  if (a3 >= 6) {
    goto LABEL_28;
  }
  int v8 = 226;
LABEL_26:
  LOBYTE(v4) = -[CHXAutoStyling autoColorOfFirstColumnSeriesWithIndex:seriesCount:]::baseColors[a3];
  float v21 = (double)v8 / 255.0 * (double)v4;
  int v7 = llroundf(v21);
LABEL_5:
  id v9 = +[OADSchemeColor schemeColorWithIndex:1];
  LODWORD(v10) = 1.5;
  [v9 addTransformOfType:29 value:v10];
  double v11 = (double)(v8 - v7) / 255.0;
  float v12 = v11;
  *(float *)&double v11 = v12;
  [v9 addTransformOfType:20 value:v11];
  double v13 = (double)v7 / 255.0;
  float v14 = v13;
  *(float *)&double v13 = v14;
  [v9 addTransformOfType:19 value:v13];
  *(float *)&double v15 = v12;
  [v9 addTransformOfType:23 value:v15];
  *(float *)&double v16 = v14;
  [v9 addTransformOfType:22 value:v16];
  *(float *)&double v17 = v12;
  [v9 addTransformOfType:26 value:v17];
  *(float *)&double v18 = v14;
  [v9 addTransformOfType:25 value:v18];
  return v9;
}

- (void)resolveGraphicPropertiesOfTrendline:(id)a3 forSeriesIndex:(unint64_t)a4
{
  id v5 = a3;
  if (v5)
  {
    id v10 = v5;
    BOOL v6 = +[OADSchemeColor schemeColorWithIndex:1];
    int v7 = objc_alloc_init(OADShapeStyle);
    [(OADShapeStyle *)v7 setLineMatrixIndex:1 color:v6];
    int v8 = [(OADDrawingTheme *)self->super.mDrawingTheme styleMatrix];
    LODWORD(v9) = 1.0;
    [(OADShapeStyle *)v7 applyToGraphicProperties:v10 styleMatrix:v8 useNull:1 strokeWidthMultiplier:v9];

    id v5 = v10;
  }
}

+ (id)colorWithSchemeColorId:(int)a3 shade:(float)a4
{
  return (id)objc_msgSend(a1, "colorWithSchemeColorId:transformType:transformValue:", *(void *)&a3, 5);
}

+ (int)styleIdWithStyleRow:(int)a3 styleColumn:(int)a4
{
  return a4 + 8 * a3 - 8;
}

- (int)styleId
{
  return [(CHDChart *)self->super.mChart styleId];
}

- (id)autoAxisAndMajorGridColor
{
  int v2 = [(CHXAutoStyling *)self styleId];
  int v3 = objc_opt_class();
  if (v2 < 33) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 12;
  }
  LODWORD(v4) = 0.75;
  BOOL v6 = [v3 colorWithSchemeColorId:v5 tint:v4];
  return v6;
}

- (id)autoChartAreaAndDataTableAndFloorStrokeColor
{
  int v2 = [(CHXAutoStyling *)self styleId];
  if (v2 <= 32)
  {
    int v3 = objc_opt_class();
    LODWORD(v4) = 0.75;
    uint64_t v5 = 1;
LABEL_5:
    BOOL v6 = [v3 colorWithSchemeColorId:v5 tint:v4];
    goto LABEL_7;
  }
  if (v2 <= 0x28)
  {
    int v3 = objc_opt_class();
    LODWORD(v4) = 0.75;
    uint64_t v5 = 12;
    goto LABEL_5;
  }
  BOOL v6 = +[OADSchemeColor schemeColorWithIndex:13];
LABEL_7:
  return v6;
}

- (id)autoOtherStrokeColor
{
  int v2 = [(CHXAutoStyling *)self styleId];
  if (v2 > 32)
  {
    if (v2 > 0x22)
    {
      if (v2 <= 0x28)
      {
        double v4 = objc_opt_class();
        LODWORD(v5) = 0.25;
        BOOL v6 = [v4 colorWithSchemeColorId:12 shade:v5];
        goto LABEL_9;
      }
      uint64_t v3 = 13;
    }
    else
    {
      uint64_t v3 = 12;
    }
  }
  else
  {
    uint64_t v3 = 1;
  }
  BOOL v6 = +[OADSchemeColor schemeColorWithIndex:v3];
LABEL_9:
  return v6;
}

- (id)autoChartAreaFillColor
{
  int v2 = [(CHXAutoStyling *)self styleId];
  if (v2 > 32)
  {
    if (v2 > 0x28) {
      uint64_t v3 = 12;
    }
    else {
      uint64_t v3 = 13;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  double v4 = +[OADSchemeColor schemeColorWithIndex:v3];
  return v4;
}

- (id)autoFloorAndWallsAndPlotArea2DFillColor
{
  int v2 = [(CHXAutoStyling *)self styleId];
  if (v2 <= 32)
  {
    uint64_t v3 = +[OADSchemeColor schemeColorWithIndex:0];
    goto LABEL_10;
  }
  unsigned int v4 = v2;
  if (v2 <= 0x22)
  {
    double v5 = objc_opt_class();
    LODWORD(v6) = 1045220557;
LABEL_8:
    uint64_t v7 = 12;
    goto LABEL_9;
  }
  double v5 = objc_opt_class();
  if (v4 > 0x28)
  {
    LODWORD(v6) = 1064514355;
    goto LABEL_8;
  }
  uint64_t v7 = v4 - 31;
  LODWORD(v6) = 1045220557;
LABEL_9:
  uint64_t v3 = [v5 colorWithSchemeColorId:v7 tint:v6];
LABEL_10:
  return v3;
}

- (unsigned)autoFloorAndWallsFillIndex
{
  return [(CHXAutoStyling *)self styleId] > 32;
}

- (unsigned)autoFloorAndChartAreaStrokeIndex
{
  return [(CHXAutoStyling *)self styleId] < 41;
}

- (void)setDefaultErrorBarPropertiesInGraphicProperties:(id)a3
{
  id v11 = a3;
  uint64_t v3 = [v11 isMergedWithParent];
  [v11 setMergedWithParent:0];
  if (([v11 hasStroke] & 1) == 0)
  {
    unsigned int v4 = +[OADStroke blackStroke];
    [v11 setStroke:v4];

    double v5 = [v11 stroke];
    LODWORD(v6) = 0.75;
    [v5 setWidth:v6];
  }
  uint64_t v7 = [v11 stroke];
  uint64_t v8 = [v7 isMergedWithParent];
  [v7 setMergedWithParent:0];
  if (([v7 isFillOverridden] & 1) == 0)
  {
    double v9 = +[OADSolidFill blackFill];
    [v7 setFill:v9];
  }
  if (([v7 isWidthOverridden] & 1) == 0)
  {
    LODWORD(v10) = 0.75;
    [v7 setWidth:v10];
  }
  [v11 setMergedWithParent:v3];
  [v7 setMergedWithParent:v8];
}

- (id)autoColorOfSeriesWithIndex:(unint64_t)a3
{
  if ([(CHDChart *)self->super.mChart isPie]
    && ![(CHDChart *)self->super.mChart isDirectionChanged])
  {
    unint64_t v5 = [(CHDChart *)self->super.mChart categoryCount];
  }
  else
  {
    unint64_t v5 = [(CHDChart *)self->super.mChart seriesCount];
  }
  unint64_t v6 = v5;
  int v7 = [(CHXAutoStyling *)self styleColumn];
  if (v7 == 1)
  {
    uint64_t v8 = [(CHXAutoStyling *)self autoColorOfFirstColumnSeriesWithIndex:a3 seriesCount:v6];
  }
  else if (v7 == 2)
  {
    uint64_t v8 = +[OADSchemeColor schemeColorWithIndex:(a3 % 6) + 4];
  }
  else
  {
    if (v7 > 2) {
      uint64_t v9 = (v7 + 1);
    }
    else {
      uint64_t v9 = 1;
    }
    double v10 = [(OADDrawingTheme *)self->super.mDrawingTheme colorMap];
    if (v10)
    {
      id v11 = [(OADDrawingTheme *)self->super.mDrawingTheme colorScheme];

      if (v11)
      {
        double v10 = +[OADSchemeColor schemeColorWithIndex:v9];
        id v11 = [(OADDrawingTheme *)self->super.mDrawingTheme colorMap];
        float v12 = [(OADDrawingTheme *)self->super.mDrawingTheme colorScheme];
        double v13 = +[OADColor rgbColorWithColor:v10 colorMap:v11 colorScheme:v12 colorPalette:0];

        LODWORD(v10) = [v13 isBlack];
        LODWORD(v11) = [v13 isWhite];
      }
      else
      {
        LODWORD(v10) = 0;
      }
    }
    else
    {
      LODWORD(v11) = 0;
    }
    double v14 = (double)v6;
    if (a3 >= v6 >> 1) {
      int v15 = 1;
    }
    else {
      int v15 = (int)v10;
    }
    if (v15 == 1 && v11 == 0)
    {
      float v22 = (pow(v14, -0.8) * -144.0 + 220.0) / 255.0;
      if (v10) {
        float v22 = 0.25;
      }
      float v23 = 1.0
          - pow(1.0- (float)(1.0- (float)(fabsf((float)((float)a3 - (float)((float)(v6 - 1) * 0.5)) / (float)((float)v6 * 0.5)) * v22)), 2.2);
      v24 = objc_opt_class();
      *(float *)&double v25 = v23;
      uint64_t v8 = [v24 colorWithSchemeColorId:v9 tint:v25];
    }
    else
    {
      float v17 = (pow(v14, -0.62) * 128.0 + 144.0) / -255.0;
      float v18 = v17 + 1.0;
      if (v11) {
        float v18 = 0.25;
      }
      float v19 = pow((float)(1.0- (float)(fabsf((float)((float)((float)v6 * 0.5) - (float)a3) / (float)((float)v6 * 0.5)) * v18)), 2.2);
      unint64_t v20 = objc_opt_class();
      *(float *)&double v21 = v19;
      uint64_t v8 = [v20 colorWithSchemeColorId:v9 shade:v21];
    }
  }
  return v8;
}

- (id)autoTextFill
{
  int v2 = [(CHXAutoStyling *)self styleId];
  if (v2 < 41) {
    unsigned int v3 = 12;
  }
  else {
    unsigned int v3 = 13;
  }
  if (v2 < 33) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = v3;
  }
  unint64_t v5 = +[OADSchemeColor schemeColorWithIndex:v4];
  unint64_t v6 = objc_alloc_init(OADSolidFill);
  [(OADSolidFill *)v6 setColor:v5];

  return v6;
}

- (id)autoStrokeForSeriesIndex:(unint64_t)a3
{
  uint64_t v4 = [(CHXAutoStyling *)self autoColorOfSeriesWithIndex:a3];
  unint64_t v5 = [(OADDrawingTheme *)self->super.mDrawingTheme styleMatrix];
  unint64_t v6 = [v5 strokeAtIndex:1 color:v4];

  return v6;
}

- (void)resolveGraphicPropertiesOfSeries:(id)a3 forSeriesIndex:(unint64_t)a4
{
}

- (void)resolveGraphicPropertiesOfSeries:(id)a3 forSeriesIndex:(unint64_t)a4 isLine:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v26 = a3;
  int v8 = [(CHXAutoStyling *)self styleColumn];
  int v9 = [(CHXAutoStyling *)self styleRow];
  if (v26 && v9 <= 6)
  {
    if (v5)
    {
      uint64_t v11 = 0;
      float v12 = (float)-[CHXAutoStyling resolveGraphicPropertiesOfErrorBar:forSeriesIndex:]::strokeWidthMultiplierArray[v9 - 1];
      *(void *)&long long v10 = 0x100000000;
      long long v25 = v10;
    }
    else
    {
      if ([(CHDChart *)self->super.mChart is3D])
      {
        long long v27 = xmmword_238EDF0E0;
        uint64_t v28 = 1;
        if (v8 == 2) {
          int v14 = 3;
        }
        else {
          int v14 = 1;
        }
        int v29 = v14;
        *((void *)&v13 + 1) = 0;
        uint64_t v30 = 0;
        int v31 = v14;
        long long v32 = xmmword_238EDD7E0;
        int v33 = 0;
        int v34 = v14;
        uint64_t v35 = 0;
        int v15 = (char *)&v27 + 12 * v9;
      }
      else
      {
        int v15 = (char *)&-[CHXAutoStyling resolveGraphicPropertiesOfSeries:forSeriesIndex:isLine:]::styleIndices + 12 * v9;
      }
      *(void *)&long long v13 = *(void *)(v15 - 12);
      long long v25 = v13;
      uint64_t v11 = *((unsigned int *)v15 - 1);
      float v12 = 1.0;
    }
    double v16 = objc_alloc_init(OADShapeStyle);
    float v17 = [(CHXAutoStyling *)self autoColorOfSeriesWithIndex:a4];
    float v18 = (void *)[v17 copy];
    unint64_t v20 = v18;
    if (!v5)
    {
      if (v9 == 5)
      {
        LODWORD(v19) = 1060655596;
        [v18 addTransformOfType:5 value:v19];
      }
      else if (v9 == 2)
      {
        uint64_t v21 = +[OADSchemeColor schemeColorWithIndex:0];

        unint64_t v20 = (void *)v21;
      }
    }
    if (v25) {
      -[OADShapeStyle setFillMatrixIndex:color:](v16, "setFillMatrixIndex:color:");
    }
    if (DWORD1(v25)) {
      -[OADShapeStyle setLineMatrixIndex:color:](v16, "setLineMatrixIndex:color:");
    }
    if (v11) {
      [(OADShapeStyle *)v16 setEffectMatrixIndex:v11 color:v17];
    }
    float v22 = [(OADDrawingTheme *)self->super.mDrawingTheme styleMatrix];
    *(float *)&double v23 = v12;
    [(OADShapeStyle *)v16 applyToGraphicProperties:v26 styleMatrix:v22 useNull:1 strokeWidthMultiplier:v23];
  }
  id v24 = v26;
}

- (void)resolveGraphicPropertiesOfErrorBar:(id)a3 forSeriesIndex:(unint64_t)a4
{
  id v12 = a3;
  int v6 = [(CHXAutoStyling *)self styleRow];
  if (v12)
  {
    int v7 = -[CHXAutoStyling resolveGraphicPropertiesOfErrorBar:forSeriesIndex:]::strokeWidthMultiplierArray[v6 - 1];
    int v8 = [(CHXAutoStyling *)self autoColorOfSeriesWithIndex:a4];
    int v9 = objc_alloc_init(OADShapeStyle);
    [(OADShapeStyle *)v9 setLineMatrixIndex:1 color:v8];
    [(CHXAutoStyling *)self setDefaultErrorBarPropertiesInGraphicProperties:v12];
    long long v10 = [(OADDrawingTheme *)self->super.mDrawingTheme styleMatrix];
    *(float *)&double v11 = (float)v7;
    [(OADShapeStyle *)v9 applyToGraphicProperties:v12 styleMatrix:v10 useNull:1 strokeWidthMultiplier:v11];
  }
}

- (void)resolveMarker:(id)a3 withSeriesGraphicProperties:(id)a4 forSeriesIndex:(unint64_t)a5 clientGraphicPropertyDefaults:(id)a6
{
  id v32 = a3;
  id v10 = a4;
  double v11 = (void (**)(id, id, void *))a6;
  if (v32)
  {
    id v12 = [v32 graphicProperties];

    if (v10)
    {
      if (v12)
      {
        int v13 = [(CHXAutoStyling *)self styleRow];
        if (v13 <= 6)
        {
          if ([v10 hasFill])
          {
            int v14 = [v10 fill];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v15 = v14;
              double v16 = [v15 technique];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              if (isKindOfClass)
              {
                float v18 = (void *)[v15 copy];
                double v19 = [v32 graphicProperties];
                [v19 setFill:v18];
              }
            }
          }
          if (![v32 size])
          {
            [v32 setSize:7];
            if (v11)
            {
              uint64_t v20 = objc_opt_class();
              uint64_t v21 = v11[2](v11, v10, &unk_26EC80B58);
              float v22 = TSUDynamicCast(v20, (uint64_t)v21);

              if (v22) {
                objc_msgSend(v32, "setSize:", objc_msgSend(v22, "unsignedIntValue"));
              }
            }
          }
          if ([v32 style] == -1) {
            objc_msgSend(v32, "setStyle:", -[CHAutoStyling defaultMarkerStyleForSeriesIndex:](self, "defaultMarkerStyleForSeriesIndex:", a5));
          }
          if (![v32 style]) {
            [(CHAutoStyling *)self replaceStrokeAndFillInEmptyMarker:v32 withSeriesGraphicProperties:v10];
          }
          double v23 = objc_alloc_init(OADShapeStyle);
          uint64_t v24 = v13 - 1;
          long long v25 = (unsigned int *)((char *)&-[CHXAutoStyling resolveMarker:withSeriesGraphicProperties:forSeriesIndex:clientGraphicPropertyDefaults:]::styleIndices
                               + 12 * v24);
          uint64_t v26 = *v25;
          uint64_t v27 = v25[2];
          uint64_t v28 = [(CHXAutoStyling *)self autoColorOfSeriesWithIndex:a5];
          if (v26) {
            [(OADShapeStyle *)v23 setFillMatrixIndex:v26 color:v28];
          }
          [(OADShapeStyle *)v23 setLineMatrixIndex:1 color:v28];
          if ((v24 & 0xFFFFFFFB) != 0) {
            [(OADShapeStyle *)v23 setEffectMatrixIndex:v27 color:v28];
          }
          int v29 = [v32 graphicProperties];
          uint64_t v30 = [(OADDrawingTheme *)self->super.mDrawingTheme styleMatrix];
          LODWORD(v31) = 1.0;
          [(OADShapeStyle *)v23 applyToGraphicProperties:v29 styleMatrix:v30 useNull:1 strokeWidthMultiplier:v31];
        }
      }
    }
  }
}

- (BOOL)_autoChartFillIsHollow
{
  return self->__autoChartFillIsHollow;
}

- (void)set_autoChartFillIsHollow:(BOOL)a3
{
  self->__autoChartFillIsHollow = a3;
}

- (BOOL)_autoChartStrokeIsHollow
{
  return self->__autoChartStrokeIsHollow;
}

- (void)set_autoChartStrokeIsHollow:(BOOL)a3
{
  self->__autoChartStrokeIsHollow = a3;
}

@end