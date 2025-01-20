@interface CHDDefaultTextProperty
+ (id)defaultTextPropertyWithResources:(id)a3;
- (BOOL)isShowBubbleSizeLabel;
- (BOOL)isShowCategoryLabel;
- (BOOL)isShowPercentageLabel;
- (BOOL)isShowSeriesLabel;
- (BOOL)isShowValueLabel;
- (CHDDefaultTextProperty)initWithResources:(id)a3;
- (NSString)description;
- (id)contentFormat;
- (id)runs;
- (int)defaultTextType;
- (int)labelPosition;
- (int64_t)key;
- (unint64_t)contentFormatId;
- (void)setContentFormat:(id)a3;
- (void)setContentFormatId:(unint64_t)a3;
- (void)setDefaultTextType:(int)a3;
- (void)setIsShowBubbleSizeLabel:(BOOL)a3;
- (void)setIsShowCategoryLabel:(BOOL)a3;
- (void)setIsShowPercentageLabel:(BOOL)a3;
- (void)setIsShowSeriesLabel:(BOOL)a3;
- (void)setIsShowValueLabel:(BOOL)a3;
- (void)setLabelPosition:(int)a3;
- (void)setRuns:(id)a3;
@end

@implementation CHDDefaultTextProperty

+ (id)defaultTextPropertyWithResources:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithResources:v3];

  return v4;
}

- (CHDDefaultTextProperty)initWithResources:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CHDDefaultTextProperty;
  v5 = [(CHDDefaultTextProperty *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    v6->mDefaultTextType = 2;
    v6->mContentFormatId = -1;
    *(void *)&v6->mLabelPosition = 0;
  }

  return v6;
}

- (void)setRuns:(id)a3
{
  v5 = (EDRunsCollection *)a3;
  mRuns = self->mRuns;
  p_mRuns = &self->mRuns;
  if (mRuns != v5)
  {
    objc_super v8 = v5;
    objc_storeStrong((id *)p_mRuns, a3);
    v5 = v8;
  }
}

- (void)setContentFormatId:(unint64_t)a3
{
  self->mContentFormatId = a3;
}

- (void)setDefaultTextType:(int)a3
{
  self->mDefaultTextType = a3;
}

- (void)setLabelPosition:(int)a3
{
  self->mLabelPosition = a3;
}

- (void)setIsShowCategoryLabel:(BOOL)a3
{
  self->mShowCategoryLabel = a3;
}

- (void)setIsShowValueLabel:(BOOL)a3
{
  self->mShowValueLabel = a3;
}

- (void)setIsShowPercentageLabel:(BOOL)a3
{
  self->mShowPercentageLabel = a3;
}

- (void)setIsShowSeriesLabel:(BOOL)a3
{
  self->mShowSeriesLabel = a3;
}

- (int64_t)key
{
  return self->mDefaultTextType;
}

- (id)runs
{
  return self->mRuns;
}

- (int)defaultTextType
{
  return self->mDefaultTextType;
}

- (id)contentFormat
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v4 = [WeakRetained contentFormats];
  v5 = [v4 objectWithKey:self->mContentFormatId];

  return v5;
}

- (void)setContentFormat:(id)a3
{
  id v8 = a3;
  unint64_t v4 = [v8 formatId];
  if (v4 == -1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
    v6 = [WeakRetained contentFormats];

    v7 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v6, "addOrEquivalentObject:", v8));
    self->mContentFormatId = [v7 formatId];
  }
  else
  {
    self->mContentFormatId = v4;
  }
}

- (int)labelPosition
{
  return self->mLabelPosition;
}

- (BOOL)isShowCategoryLabel
{
  return self->mShowCategoryLabel;
}

- (BOOL)isShowValueLabel
{
  return self->mShowValueLabel;
}

- (BOOL)isShowPercentageLabel
{
  return self->mShowPercentageLabel;
}

- (BOOL)isShowBubbleSizeLabel
{
  return self->mShowBubbleSizeLabel;
}

- (void)setIsShowBubbleSizeLabel:(BOOL)a3
{
  self->mShowBubbleSizeLabel = a3;
}

- (BOOL)isShowSeriesLabel
{
  return self->mShowSeriesLabel;
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)CHDDefaultTextProperty;
  v2 = [(CHDDefaultTextProperty *)&v4 description];
  return (NSString *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRuns, 0);
  objc_destroyWeak((id *)&self->mResources);
}

- (unint64_t)contentFormatId
{
  return self->mContentFormatId;
}

@end