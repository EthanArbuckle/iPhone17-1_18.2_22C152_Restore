@interface CHDChart
+ (id)binaryEffects:(BOOL)a3;
- (BOOL)hasSharedXValues;
- (BOOL)hasVisibleSeriesNames;
- (BOOL)is3D;
- (BOOL)isArea;
- (BOOL)isAutoTitleDeleted;
- (BOOL)isBinary;
- (BOOL)isDirectionChanged;
- (BOOL)isMSGraph;
- (BOOL)isPie;
- (BOOL)isPlotVisibleCellsOnly;
- (BOOL)isScatterOrBubble;
- (BOOL)supportsMarkers;
- (CGRect)logicalBounds;
- (CHDChart)init;
- (NSString)description;
- (id)backWallGraphicProperties;
- (id)chartAreaGraphicProperties;
- (id)childAtIndex:(unint64_t)a3;
- (id)children;
- (id)defaultContentFormat;
- (id)defaultDataLabelFont;
- (id)defaultFontWithResources:(id)a3;
- (id)defaultSeriesTitleFont;
- (id)defaultTextFont;
- (id)defaultTextProperties;
- (id)defaultThemeFont;
- (id)externalData;
- (id)floorGraphicProperties;
- (id)legend;
- (id)mainType;
- (id)plotArea;
- (id)processors;
- (id)sheet;
- (id)sideWallGraphicProperties;
- (id)styleMatrix;
- (id)themeOverrides;
- (id)title;
- (id)view3D;
- (id)workbook;
- (int)defaultLabelPosition;
- (int)direction;
- (int)displayBlankAs;
- (int)styleId;
- (unint64_t)categoryCount;
- (unint64_t)childCount;
- (unint64_t)defaultFontIndex;
- (unint64_t)seriesCount;
- (void)addChild:(id)a3;
- (void)addChildren:(id)a3;
- (void)changeParentTextListStylePreservingEffectiveValues:(id)a3;
- (void)removeChild:(id)a3;
- (void)replaceChild:(id)a3 with:(id)a4;
- (void)setAutoTitleDeleted:(BOOL)a3;
- (void)setBackWallGraphicProperties:(id)a3;
- (void)setChartAreaGraphicProperties:(id)a3;
- (void)setDefaultTextProperties:(id)a3;
- (void)setDirection:(int)a3;
- (void)setDirectionChanged:(BOOL)a3;
- (void)setDisplayBlankAs:(int)a3;
- (void)setExternalData:(id)a3;
- (void)setFloorGraphicProperties:(id)a3;
- (void)setHasSharedXValues:(BOOL)a3;
- (void)setLegend:(id)a3;
- (void)setLogicalBounds:(CGRect)a3;
- (void)setMSGraph:(BOOL)a3;
- (void)setParentTextListStyle:(id)a3;
- (void)setPlotArea:(id)a3;
- (void)setPlotVisibleCellsOnly:(BOOL)a3;
- (void)setSheet:(id)a3;
- (void)setSideWallGraphicProperties:(id)a3;
- (void)setStyleId:(int)a3;
- (void)setThemeOverrides:(id)a3;
- (void)setTitle:(id)a3;
- (void)setView3D:(id)a3;
- (void)setVisibleSeriesNames:(BOOL)a3;
@end

@implementation CHDChart

- (CHDChart)init
{
  uint64_t v3 = objc_opt_class();
  v14.receiver = self;
  v14.super_class = (Class)CHDChart;
  v4 = [(OADDrawable *)&v14 initWithPropertiesClass:v3];
  v5 = v4;
  if (v4)
  {
    v4->mStyleId = -1;
    v6 = [[CHDPlotArea alloc] initWithChart:v4];
    mPlotArea = v5->mPlotArea;
    v5->mPlotArea = v6;

    v5->mAutoTitleDeleted = 1;
    v5->mPlotVisibleCellsOnly = 0;
    v5->mMSGraph = 0;
    v5->mHasSharedXValues = 0;
    v5->mDirectionChanged = 0;
    v5->mHasVisibleSeriesNames = 0;
    v5->mDisplayBlankCellsAs = 2;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mDrawables = v5->mDrawables;
    v5->mDrawables = v8;

    v10 = objc_alloc_init(CHDDefaultTextProperties);
    mDefaultTextProperties = v5->mDefaultTextProperties;
    v5->mDefaultTextProperties = v10;

    v5->mChartDirection = 0;
    mThemeOverrides = v5->mThemeOverrides;
    v5->mThemeOverrides = 0;
  }
  return v5;
}

- (void)setSheet:(id)a3
{
}

- (void)setStyleId:(int)a3
{
  self->mStyleId = a3;
}

- (BOOL)isBinary
{
  return self->mStyleId == 0;
}

- (void)setLogicalBounds:(CGRect)a3
{
  self->mLogicalBounds = a3;
}

+ (id)binaryEffects:(BOOL)a3
{
  if (a3)
  {
    uint64_t v3 = objc_alloc_init(OADOuterShadowEffect);
    v4 = +[OADRgbColor black];
    [(OADShadowEffect *)v3 setColor:v4];

    LODWORD(v5) = 1110704128;
    [(OADShadowEffect *)v3 setAngle:v5];
    LODWORD(v6) = 3.0;
    [(OADShadowEffect *)v3 setDistance:v6];
    [(OADShadowEffect *)v3 setBlurRadius:0.0];
    v7 = [MEMORY[0x263EFF8C0] arrayWithObject:v3];
  }
  else
  {
    v7 = [MEMORY[0x263EFF8C0] array];
  }
  return v7;
}

- (void)setChartAreaGraphicProperties:(id)a3
{
  double v5 = (OADGraphicProperties *)a3;
  if (self->mChartAreaGraphicProperties != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->mChartAreaGraphicProperties, a3);
    double v5 = v6;
  }
}

- (void)setPlotVisibleCellsOnly:(BOOL)a3
{
  self->mPlotVisibleCellsOnly = a3;
}

- (void)setDisplayBlankAs:(int)a3
{
  self->mDisplayBlankCellsAs = a3;
}

- (id)defaultTextProperties
{
  return self->mDefaultTextProperties;
}

- (id)plotArea
{
  return self->mPlotArea;
}

- (void)setSideWallGraphicProperties:(id)a3
{
  double v5 = (OADGraphicProperties *)a3;
  if (self->mSideWallGraphicProperties != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->mSideWallGraphicProperties, a3);
    double v5 = v6;
  }
}

- (void)setBackWallGraphicProperties:(id)a3
{
  double v5 = (OADGraphicProperties *)a3;
  if (self->mBackWallGraphicProperties != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->mBackWallGraphicProperties, a3);
    double v5 = v6;
  }
}

- (void)setFloorGraphicProperties:(id)a3
{
  double v5 = (OADGraphicProperties *)a3;
  if (self->mFloorGraphicProperties != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->mFloorGraphicProperties, a3);
    double v5 = v6;
  }
}

- (void)setView3D:(id)a3
{
  double v5 = (CHDView3D *)a3;
  if (self->mView3D != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->mView3D, a3);
    double v5 = v6;
  }
}

- (id)processors
{
  return [(EDSheet *)self->mSheet processors];
}

- (id)legend
{
  return self->mLegend;
}

- (int)direction
{
  return self->mChartDirection;
}

- (void)setPlotArea:(id)a3
{
  double v5 = (CHDPlotArea *)a3;
  if (self->mPlotArea != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->mPlotArea, a3);
    double v5 = v6;
  }
}

- (void)setTitle:(id)a3
{
  double v5 = (CHDTitle *)a3;
  if (self->mTitle != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->mTitle, a3);
    double v5 = v6;
  }
}

- (void)setAutoTitleDeleted:(BOOL)a3
{
  self->mAutoTitleDeleted = a3;
}

- (BOOL)isMSGraph
{
  return self->mMSGraph;
}

- (void)setDirection:(int)a3
{
  self->mChartDirection = a3;
}

- (id)mainType
{
  v2 = [(CHDChart *)self plotArea];
  uint64_t v3 = [v2 chartTypes];
  v4 = [v3 objectAtIndex:0];

  return v4;
}

- (id)title
{
  return self->mTitle;
}

- (id)chartAreaGraphicProperties
{
  return self->mChartAreaGraphicProperties;
}

- (void)addChild:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NSMutableArray *)self->mDrawables addObject:v4];
    [v4 setParent:self];
  }
}

- (void)setParentTextListStyle:(id)a3
{
}

- (void)setLegend:(id)a3
{
  double v5 = (CHDLegend *)a3;
  if (self->mLegend != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->mLegend, a3);
    double v5 = v6;
  }
}

- (void)setDirectionChanged:(BOOL)a3
{
  self->mDirectionChanged = a3;
}

- (unint64_t)defaultFontIndex
{
  v2 = [(EDKeyedCollection *)self->mDefaultTextProperties objectWithKey:2];
  uint64_t v3 = v2;
  if (v2 && ([v2 runs], id v4 = objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    double v5 = [v3 runs];
    double v6 = [v5 objectAtIndex:0];
    unint64_t v7 = [v6 fontIndex];
  }
  else
  {
    unint64_t v7 = -1;
  }

  return v7;
}

- (int)styleId
{
  return self->mStyleId;
}

- (id)styleMatrix
{
  v2 = [(CHDChart *)self workbook];
  uint64_t v3 = [v2 theme];
  id v4 = [v3 baseStyles];
  double v5 = [v4 styleMatrix];

  return v5;
}

- (id)workbook
{
  return [(EDSheet *)self->mSheet workbook];
}

- (BOOL)is3D
{
  v2 = [(CHDChart *)self mainType];
  char v3 = [(id)objc_opt_class() is3DType];

  return v3;
}

- (BOOL)isPie
{
  v2 = [(CHDChart *)self mainType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)seriesCount
{
  v2 = [(CHDChart *)self plotArea];
  char v3 = [v2 chartTypes];

  uint64_t v4 = [v3 count];
  if (v4)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      unint64_t v7 = [v3 objectAtIndex:v5];
      v6 += [v7 seriesCount];

      ++v5;
    }
    while (v4 != v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (void)setExternalData:(id)a3
{
  uint64_t v5 = (EDWorkbook *)a3;
  if (self->mExternalData != v5)
  {
    unint64_t v6 = v5;
    objc_storeStrong((id *)&self->mExternalData, a3);
    uint64_t v5 = v6;
  }
}

- (id)view3D
{
  return self->mView3D;
}

- (BOOL)isDirectionChanged
{
  return self->mDirectionChanged;
}

- (unint64_t)categoryCount
{
  v2 = [(CHDChart *)self plotArea];
  char v3 = [v2 chartTypes];

  uint64_t v4 = [v3 count];
  if (v4)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      unint64_t v7 = [v3 objectAtIndex:v5];
      unint64_t v8 = [v7 categoryCount];

      if (v8 > v6) {
        unint64_t v6 = v8;
      }
      ++v5;
    }
    while (v4 != v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)sheet
{
  return self->mSheet;
}

- (BOOL)isAutoTitleDeleted
{
  return self->mAutoTitleDeleted;
}

- (BOOL)isPlotVisibleCellsOnly
{
  return self->mPlotVisibleCellsOnly;
}

- (int)displayBlankAs
{
  return self->mDisplayBlankCellsAs;
}

- (id)externalData
{
  return self->mExternalData;
}

- (id)backWallGraphicProperties
{
  return self->mBackWallGraphicProperties;
}

- (id)sideWallGraphicProperties
{
  return self->mSideWallGraphicProperties;
}

- (id)floorGraphicProperties
{
  return self->mFloorGraphicProperties;
}

- (void)setDefaultTextProperties:(id)a3
{
  uint64_t v5 = (CHDDefaultTextProperties *)a3;
  if (self->mDefaultTextProperties != v5)
  {
    unint64_t v6 = v5;
    objc_storeStrong((id *)&self->mDefaultTextProperties, a3);
    uint64_t v5 = v6;
  }
}

- (CGRect)logicalBounds
{
  double x = self->mLogicalBounds.origin.x;
  double y = self->mLogicalBounds.origin.y;
  double width = self->mLogicalBounds.size.width;
  double height = self->mLogicalBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)childCount
{
  return [(NSMutableArray *)self->mDrawables count];
}

- (void)addChildren:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 count];
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      unint64_t v6 = [v7 objectAtIndex:i];
      [v6 setParent:self];
    }
  }
  [(NSMutableArray *)self->mDrawables addObjectsFromArray:v7];
}

- (id)childAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mDrawables objectAtIndex:a3];
}

- (id)children
{
  return self->mDrawables;
}

- (id)themeOverrides
{
  return self->mThemeOverrides;
}

- (void)setThemeOverrides:(id)a3
{
}

- (void)replaceChild:(id)a3 with:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = [(NSMutableArray *)self->mDrawables indexOfObjectIdenticalTo:v8];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [v8 setParent:0];
    [(NSMutableArray *)self->mDrawables replaceObjectAtIndex:v7 withObject:v6];
    [v6 setParent:self];
  }
}

- (void)removeChild:(id)a3
{
  id v5 = a3;
  uint64_t v4 = -[NSMutableArray indexOfObjectIdenticalTo:](self->mDrawables, "indexOfObjectIdenticalTo:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [v5 setParent:0];
    [(NSMutableArray *)self->mDrawables removeObjectAtIndex:v4];
  }
}

- (void)changeParentTextListStylePreservingEffectiveValues:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->mDrawables;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "changeParentTextListStylePreservingEffectiveValues:", v4, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)defaultThemeFont
{
  char v3 = self->mExternalData;
  if (v3 || ([(CHDChart *)self workbook], (char v3 = (EDWorkbook *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = [(OCDDocument *)v3 theme];
    id v5 = [v4 baseStyles];
    uint64_t v6 = [v5 fontScheme];
    uint64_t v7 = [v6 minorFont];
    uint64_t v8 = [v7 latinFont];

    long long v9 = [(EDWorkbook *)v3 resources];
    long long v10 = +[EDFont fontWithResources:v9];

    if (v8) {
      [v10 setName:v8];
    }
    [v10 setHeight:200.0];
    long long v11 = +[OADSchemeColor schemeColorWithIndex:1];
    long long v12 = [(OCDDocument *)v3 theme];
    v13 = [v12 baseStyles];
    uint64_t v14 = [v13 colorScheme];
    v15 = [(EDWorkbook *)v3 resources];
    v16 = [v15 colors];
    v17 = +[OADColor tsuColorWithColor:v11 colorMap:0 colorScheme:v14 colorPalette:v16];

    if (!v17)
    {
      v17 = +[OITSUColor blackColor];
    }
    [v10 setColor:v17];
  }
  else
  {
    long long v10 = 0;
  }

  return v10;
}

- (id)defaultTextFont
{
  char v3 = [(EDKeyedCollection *)self->mDefaultTextProperties objectWithKey:2];
  id v4 = v3;
  if (v3 && ([v3 runs], id v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    uint64_t v6 = [v4 runs];
    uint64_t v7 = [v6 objectAtIndex:0];
    uint64_t v8 = [v7 font];
  }
  else
  {
    uint64_t v8 = [(CHDChart *)self defaultThemeFont];
  }

  return v8;
}

- (id)defaultDataLabelFont
{
  char v3 = [(EDKeyedCollection *)self->mDefaultTextProperties objectWithKey:0];
  id v4 = v3;
  if (v3 && ([v3 runs], id v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    uint64_t v6 = [v4 runs];

    if (v6)
    {
      uint64_t v7 = [v4 runs];
      uint64_t v8 = [v7 objectAtIndex:0];
      long long v9 = [v8 font];

      goto LABEL_7;
    }
    uint64_t v10 = [(CHDChart *)self defaultThemeFont];
  }
  else
  {
    uint64_t v10 = [(CHDChart *)self defaultTextFont];
  }
  long long v9 = (void *)v10;
LABEL_7:

  return v9;
}

- (id)defaultSeriesTitleFont
{
  char v3 = [(EDKeyedCollection *)self->mDefaultTextProperties objectWithKey:3];
  id v4 = v3;
  if (v3 && ([v3 runs], id v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    uint64_t v6 = [v4 runs];

    if (v6)
    {
      uint64_t v7 = [v4 runs];
      uint64_t v8 = [v7 objectAtIndex:0];
      long long v9 = [v8 font];

      goto LABEL_7;
    }
    uint64_t v10 = [(CHDChart *)self defaultThemeFont];
  }
  else
  {
    uint64_t v10 = [(CHDChart *)self defaultTextFont];
  }
  long long v9 = (void *)v10;
LABEL_7:

  return v9;
}

- (id)defaultContentFormat
{
  v2 = [(EDKeyedCollection *)self->mDefaultTextProperties objectWithKey:2];
  char v3 = v2;
  if (v2)
  {
    id v4 = [v2 contentFormat];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)defaultFontWithResources:(id)a3
{
  id v4 = [a3 fonts];
  if (!v4 || (unint64_t v5 = [(CHDChart *)self defaultFontIndex], v5 == -1))
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [v4 objectAtIndex:v5];
  }

  return v6;
}

- (int)defaultLabelPosition
{
  v2 = [(EDKeyedCollection *)self->mDefaultTextProperties objectWithKey:2];
  char v3 = v2;
  if (v2) {
    int v4 = [v2 labelPosition];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)isArea
{
  v2 = [(CHDChart *)self mainType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)supportsMarkers
{
  char v3 = [(CHDChart *)self mainType];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    unint64_t v5 = [(CHDChart *)self mainType];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (BOOL)isScatterOrBubble
{
  char v3 = [(CHDChart *)self mainType];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    unint64_t v5 = [(CHDChart *)self mainType];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (void)setMSGraph:(BOOL)a3
{
  self->mMSGraph = a3;
}

- (BOOL)hasSharedXValues
{
  return self->mHasSharedXValues;
}

- (void)setHasSharedXValues:(BOOL)a3
{
  self->mHasSharedXValues = a3;
}

- (BOOL)hasVisibleSeriesNames
{
  return self->mHasVisibleSeriesNames;
}

- (void)setVisibleSeriesNames:(BOOL)a3
{
  self->mHasVisibleSeriesNames = a3;
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)CHDChart;
  v2 = [(OADGraphic *)&v4 description];
  return (NSString *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mThemeOverrides, 0);
  objc_storeStrong((id *)&self->mDrawables, 0);
  objc_storeStrong((id *)&self->mDefaultTextProperties, 0);
  objc_storeStrong((id *)&self->mFloorGraphicProperties, 0);
  objc_storeStrong((id *)&self->mSideWallGraphicProperties, 0);
  objc_storeStrong((id *)&self->mBackWallGraphicProperties, 0);
  objc_storeStrong((id *)&self->mChartAreaGraphicProperties, 0);
  objc_storeStrong((id *)&self->mExternalData, 0);
  objc_storeStrong((id *)&self->mLegend, 0);
  objc_storeStrong((id *)&self->mTitle, 0);
  objc_storeStrong((id *)&self->mView3D, 0);
  objc_storeStrong((id *)&self->mPlotArea, 0);
  objc_storeStrong((id *)&self->mSheet, 0);
}

@end