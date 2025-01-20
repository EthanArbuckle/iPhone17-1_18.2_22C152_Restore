@interface CHXReadState
- (BOOL)ignoreFormulas;
- (CHXReadState)initWithDrawingState:(id)a3;
- (id)autoStyling;
- (id)chart;
- (id)chartPart;
- (id)currentChartType;
- (id)currentSeries;
- (id)defaultTextProperties;
- (id)drawingState;
- (id)exState;
- (id)resources;
- (void)popDefaultTextProperties;
- (void)popTitleTextProperties;
- (void)pushDefaultTextProperties:(id)a3;
- (void)pushTitleTextProperties:(BOOL)a3;
- (void)setChart:(id)a3;
- (void)setChartPart:(id)a3;
- (void)setCurrentChartType:(id)a3;
- (void)setCurrentSeries:(id)a3;
- (void)setDefaultTextProperties:(id)a3;
- (void)setDefaultTextPropertiesHaveExplicitFontSize:(BOOL)a3;
- (void)setIgnoreFormulas:(BOOL)a3;
- (void)setResources:(id)a3;
@end

@implementation CHXReadState

- (CHXReadState)initWithDrawingState:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHXReadState;
  v6 = [(CHXReadState *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->mDrawingState, a3);
  }

  return v7;
}

- (id)drawingState
{
  return self->mDrawingState;
}

- (id)chart
{
  return self->mChart;
}

- (void)setChart:(id)a3
{
  id v5 = (CHDChart *)a3;
  if (self->mChart != v5)
  {
    v14 = v5;
    objc_storeStrong((id *)&self->mChart, a3);
    v6 = [OADDrawingTheme alloc];
    v7 = [(OAXDrawingState *)self->mDrawingState styleMatrix];
    v8 = [(OAXDrawingState *)self->mDrawingState fontScheme];
    objc_super v9 = [(OAXDrawingState *)self->mDrawingState colorScheme];
    v10 = [(OAXDrawingState *)self->mDrawingState colorMap];
    v11 = [(OADDrawingTheme *)v6 initWithStyleMatrix:v7 fontScheme:v8 colorScheme:v9 colorMap:v10 colorPalette:0];

    v12 = +[CHAutoStyling autoStylingWithChart:v14 drawingTheme:v11];
    mAutoStyling = self->mAutoStyling;
    self->mAutoStyling = v12;

    id v5 = v14;
  }
}

- (id)resources
{
  return self->mResources;
}

- (void)setResources:(id)a3
{
  id v5 = (EDResources *)a3;
  mResources = self->mResources;
  p_mResources = &self->mResources;
  if (mResources != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mResources, a3);
    id v5 = v8;
  }
}

- (id)chartPart
{
  return self->mChartPart;
}

- (void)setChartPart:(id)a3
{
  id v5 = (OCPPackagePart *)a3;
  mChartPart = self->mChartPart;
  p_mChartPart = &self->mChartPart;
  if (mChartPart != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mChartPart, a3);
    id v5 = v8;
  }
}

- (id)currentChartType
{
  return self->mCurrentChartType;
}

- (void)setCurrentChartType:(id)a3
{
  id v5 = (CHDChartType *)a3;
  mCurrentChartType = self->mCurrentChartType;
  p_mCurrentChartType = &self->mCurrentChartType;
  if (mCurrentChartType != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mCurrentChartType, a3);
    id v5 = v8;
  }
}

- (id)currentSeries
{
  return self->mCurrentSeries;
}

- (void)setCurrentSeries:(id)a3
{
  id v5 = (CHDSeries *)a3;
  mCurrentSeries = self->mCurrentSeries;
  p_mCurrentSeries = &self->mCurrentSeries;
  if (mCurrentSeries != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mCurrentSeries, a3);
    id v5 = v8;
  }
}

- (id)exState
{
  return [(EXOfficeArtState *)self->mDrawingState excelState];
}

- (id)defaultTextProperties
{
  return self->mDefaultTextProperties;
}

- (void)setDefaultTextProperties:(id)a3
{
  id v5 = (OADParagraphProperties *)a3;
  mDefaultTextProperties = self->mDefaultTextProperties;
  p_mDefaultTextProperties = &self->mDefaultTextProperties;
  if (mDefaultTextProperties != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mDefaultTextProperties, a3);
    id v5 = v8;
  }
}

- (void)setDefaultTextPropertiesHaveExplicitFontSize:(BOOL)a3
{
  self->mDefaultTextPropertiesHaveExplicitFontSize = a3;
}

- (void)pushTitleTextProperties:(BOOL)a3
{
  BOOL v3 = a3;
  v7 = objc_alloc_init(OADParagraphProperties);
  [(OADProperties *)self->mDefaultTextProperties setMergedWithParent:0];
  if (![(OADCharacterProperties *)self->mDefaultTextProperties hasIsBold]) {
    [(OADCharacterProperties *)v7 setIsBold:1];
  }
  [(OADProperties *)self->mDefaultTextProperties setMergedWithParent:1];
  if (v3)
  {
    if (self->mDefaultTextPropertiesHaveExplicitFontSize)
    {
      [(OADCharacterProperties *)self->mDefaultTextProperties size];
      double v5 = v6 * 1.2;
      *(float *)&double v5 = v5;
    }
    else
    {
      LODWORD(v5) = 18.0;
    }
    [(OADCharacterProperties *)v7 setSize:v5];
  }
  [(OADProperties *)v7 setParent:self->mDefaultTextProperties];
  [(CHXReadState *)self setDefaultTextProperties:v7];
}

- (void)popTitleTextProperties
{
  id v3 = [(OADProperties *)self->mDefaultTextProperties parent];
  -[CHXReadState setDefaultTextProperties:](self, "setDefaultTextProperties:");
}

- (void)pushDefaultTextProperties:(id)a3
{
  id v4 = a3;
  [v4 setParent:self->mDefaultTextProperties];
  [(CHXReadState *)self setDefaultTextProperties:v4];
}

- (void)popDefaultTextProperties
{
  id v3 = [(OADProperties *)self->mDefaultTextProperties parent];
  -[CHXReadState setDefaultTextProperties:](self, "setDefaultTextProperties:");
}

- (id)autoStyling
{
  return self->mAutoStyling;
}

- (BOOL)ignoreFormulas
{
  return self->mIgnoreFormulas;
}

- (void)setIgnoreFormulas:(BOOL)a3
{
  self->mIgnoreFormulas = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mAutoStyling, 0);
  objc_storeStrong((id *)&self->mDefaultTextProperties, 0);
  objc_storeStrong((id *)&self->mCurrentSeries, 0);
  objc_storeStrong((id *)&self->mCurrentChartType, 0);
  objc_storeStrong((id *)&self->mChartPart, 0);
  objc_storeStrong((id *)&self->mResources, 0);
  objc_storeStrong((id *)&self->mChart, 0);
  objc_storeStrong((id *)&self->mDrawingState, 0);
}

@end