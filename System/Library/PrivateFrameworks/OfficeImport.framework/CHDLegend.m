@interface CHDLegend
- (BOOL)isAutoSizeAndPosition;
- (BOOL)isOverlay;
- (BOOL)isSingleColumnLegend;
- (CHDLegend)initWithResources:(id)a3;
- (id)description;
- (id)font;
- (id)graphicProperties;
- (id)labelEffects;
- (id)legendEntries;
- (int)legendPosition;
- (unint64_t)fontIndex;
- (void)setFont:(id)a3;
- (void)setFontIndex:(unint64_t)a3;
- (void)setGraphicProperties:(id)a3;
- (void)setIsOverlay:(BOOL)a3;
- (void)setIsSingleColumnLegend:(BOOL)a3;
- (void)setLabelEffects:(id)a3;
- (void)setLegendPosition:(int)a3;
@end

@implementation CHDLegend

- (CHDLegend)initWithResources:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CHDLegend;
  v5 = [(CHDLegend *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    v6->mFontIndex = -1;
    v6->mLegendPosition = 0;
    v7 = objc_alloc_init(EDCollection);
    mLegendEntries = v6->mLegendEntries;
    v6->mLegendEntries = v7;

    *(_WORD *)&v6->mIsVertical = 1;
  }

  return v6;
}

- (void)setFontIndex:(unint64_t)a3
{
  self->mFontIndex = a3;
}

- (void)setGraphicProperties:(id)a3
{
  v5 = (OADGraphicProperties *)a3;
  mGraphicProperties = self->mGraphicProperties;
  p_mGraphicProperties = &self->mGraphicProperties;
  if (mGraphicProperties != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mGraphicProperties, a3);
    v5 = v8;
  }
}

- (void)setLegendPosition:(int)a3
{
  self->mLegendPosition = a3;
}

- (void)setIsSingleColumnLegend:(BOOL)a3
{
  self->mIsVertical = a3;
}

- (id)legendEntries
{
  return self->mLegendEntries;
}

- (int)legendPosition
{
  return self->mLegendPosition;
}

- (id)font
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v4 = [WeakRetained fonts];
  v5 = [v4 objectAtIndex:self->mFontIndex];

  return v5;
}

- (void)setFont:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  v5 = [WeakRetained fonts];
  self->mFontIndex = [v5 addOrEquivalentObject:v6];
}

- (id)graphicProperties
{
  return self->mGraphicProperties;
}

- (BOOL)isSingleColumnLegend
{
  return self->mIsVertical;
}

- (BOOL)isOverlay
{
  return self->mIsOverlay;
}

- (void)setIsOverlay:(BOOL)a3
{
  self->mIsOverlay = a3;
}

- (id)labelEffects
{
  return self->mLabelEffects;
}

- (void)setLabelEffects:(id)a3
{
  v5 = (NSArray *)a3;
  mLabelEffects = self->mLabelEffects;
  p_mLabelEffects = &self->mLabelEffects;
  if (mLabelEffects != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mLabelEffects, a3);
    v5 = v8;
  }
}

- (BOOL)isAutoSizeAndPosition
{
  return ![(OADDrawableProperties *)self->mGraphicProperties hasOrientedBounds];
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)CHDLegend;
  v2 = [(CHDLegend *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mLabelEffects, 0);
  objc_destroyWeak((id *)&self->mResources);
  objc_storeStrong((id *)&self->mLegendEntries, 0);
  objc_storeStrong((id *)&self->mGraphicProperties, 0);
}

- (unint64_t)fontIndex
{
  return self->mFontIndex;
}

@end