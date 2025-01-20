@interface CHDTrendlineLabel
+ (CHDTrendlineLabel)trendlineLabelWithResources:(id)a3;
- (BOOL)isAutomaticLabelDeleted;
- (BOOL)isContentFormatDerivedFromDataPoints;
- (BOOL)isGeneratedText;
- (CHDTrendlineLabel)initWithResources:(id)a3;
- (EDString)lastCachedName;
- (id)contentFormat;
- (id)description;
- (id)graphicProperties;
- (id)name;
- (unint64_t)contentFormatId;
- (void)setAutomaticLabelDeleted:(BOOL)a3;
- (void)setContentFormat:(id)a3;
- (void)setContentFormatId:(unint64_t)a3;
- (void)setGeneratedText:(BOOL)a3;
- (void)setGraphicProperties:(id)a3;
- (void)setIsContentFormatDerivedFromDataPoints:(BOOL)a3;
- (void)setLastCachedName:(id)a3;
- (void)setName:(id)a3 chart:(id)a4;
@end

@implementation CHDTrendlineLabel

+ (CHDTrendlineLabel)trendlineLabelWithResources:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithResources:v3];

  return (CHDTrendlineLabel *)v4;
}

- (CHDTrendlineLabel)initWithResources:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CHDTrendlineLabel;
  v5 = [(CHDTrendlineLabel *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    v6->mContentFormatId = -1;
    *(_WORD *)&v6->mGeneratedText = 1;
  }

  return v6;
}

- (void)setName:(id)a3 chart:(id)a4
{
  v11 = (CHDFormula *)a3;
  id v7 = a4;
  mName = self->mName;
  p_mName = &self->mName;
  if (mName != v11)
  {
    objc_storeStrong((id *)p_mName, a3);
    if (v11)
    {
      v10 = [v7 processors];
      [v10 markObject:v11 processor:objc_opt_class()];
    }
  }
}

- (void)setContentFormatId:(unint64_t)a3
{
  self->mContentFormatId = a3;
}

- (void)setGeneratedText:(BOOL)a3
{
  self->mGeneratedText = a3;
}

- (void)setAutomaticLabelDeleted:(BOOL)a3
{
  self->mAutomaticLabelDeleted = a3;
}

- (void)setLastCachedName:(id)a3
{
}

- (void)setGraphicProperties:(id)a3
{
  v5 = (OADGraphicProperties *)a3;
  mGraphicProperties = self->mGraphicProperties;
  p_mGraphicProperties = &self->mGraphicProperties;
  if (mGraphicProperties != v5)
  {
    objc_super v8 = v5;
    objc_storeStrong((id *)p_mGraphicProperties, a3);
    v5 = v8;
  }
}

- (void)setContentFormat:(id)a3
{
  id v8 = a3;
  unint64_t v4 = [v8 formatId];
  if (v4 == -1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
    v6 = [WeakRetained contentFormats];

    id v7 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v6, "addOrEquivalentObject:", v8));
    self->mContentFormatId = [v7 formatId];
  }
  else
  {
    self->mContentFormatId = v4;
  }
}

- (id)name
{
  return self->mName;
}

- (id)contentFormat
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  unint64_t v4 = [WeakRetained contentFormats];
  v5 = [v4 objectWithKey:self->mContentFormatId];

  return v5;
}

- (BOOL)isContentFormatDerivedFromDataPoints
{
  return self->mContentFormatDerived;
}

- (void)setIsContentFormatDerivedFromDataPoints:(BOOL)a3
{
  self->mContentFormatDerived = a3;
}

- (BOOL)isGeneratedText
{
  return self->mGeneratedText;
}

- (BOOL)isAutomaticLabelDeleted
{
  return self->mAutomaticLabelDeleted;
}

- (id)graphicProperties
{
  return self->mGraphicProperties;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)CHDTrendlineLabel;
  v2 = [(CHDTrendlineLabel *)&v4 description];
  return v2;
}

- (EDString)lastCachedName
{
  return self->mLastCachedName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mLastCachedName, 0);
  objc_storeStrong((id *)&self->mGraphicProperties, 0);
  objc_storeStrong((id *)&self->mName, 0);
  objc_destroyWeak((id *)&self->mResources);
}

- (unint64_t)contentFormatId
{
  return self->mContentFormatId;
}

@end