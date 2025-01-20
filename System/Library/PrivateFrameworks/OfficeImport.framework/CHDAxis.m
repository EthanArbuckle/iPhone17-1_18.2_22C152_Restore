@interface CHDAxis
- (BOOL)isAutoCrossValue;
- (BOOL)isAutoMaximumValue;
- (BOOL)isAutoMinimumValue;
- (BOOL)isContentFormatDerivedFromDataPoints;
- (BOOL)isDate;
- (BOOL)isDateTimeFormattingFlag;
- (BOOL)isDeleted;
- (BOOL)isHorizontalPosition;
- (BOOL)isLineVisible;
- (BOOL)isReverseOrder;
- (BOOL)isReverseOrderOverridden;
- (BOOL)isSecondary;
- (BOOL)isTickLabelAutoRotation;
- (BOOL)isTickLabelVisible;
- (CHDAxis)initWithResources:(id)a3;
- (NSString)description;
- (double)crossAxisId;
- (double)crossAxisIdForXml;
- (double)crossesAt;
- (double)scalingMaximum;
- (double)scalingMinimum;
- (double)tickLabelRotationAngle;
- (id)axisGraphicProperties;
- (id)contentFormat;
- (id)defaultDateTimeContentFormat;
- (id)font;
- (id)labelEffects;
- (id)majorGridLinesGraphicProperties;
- (id)minorGridLinesGraphicProperties;
- (id)tickLabelColor;
- (id)title;
- (int)axisId;
- (int)axisIdForXml;
- (int)axisPosition;
- (int)axisType;
- (int)crossBetween;
- (int)crosses;
- (int)majorTickMark;
- (int)minorTickMark;
- (int)orientation;
- (int)tickLabelPosition;
- (int64_t)key;
- (unint64_t)contentFormatId;
- (unint64_t)fontIndex;
- (unint64_t)tickLabelColorIndex;
- (void)setAxisGraphicProperties:(id)a3;
- (void)setAxisId:(int)a3;
- (void)setAxisPosition:(int)a3;
- (void)setAxisType:(int)a3;
- (void)setContentFormat:(id)a3;
- (void)setContentFormatId:(unint64_t)a3;
- (void)setCrossAxisId:(double)a3;
- (void)setCrossBetween:(int)a3;
- (void)setCrosses:(int)a3;
- (void)setCrossesAt:(double)a3;
- (void)setDateTimeFormattingFlag:(BOOL)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setFontIndex:(unint64_t)a3;
- (void)setIsContentFormatDerivedFromDataPoints:(BOOL)a3;
- (void)setLabelEffects:(id)a3;
- (void)setLineVisible:(BOOL)a3;
- (void)setMajorGridLinesGraphicProperties:(id)a3;
- (void)setMajorTickMark:(int)a3;
- (void)setMinorGridLinesGraphicProperties:(id)a3;
- (void)setMinorTickMark:(int)a3;
- (void)setOrientation:(int)a3;
- (void)setReverseOrder:(BOOL)a3;
- (void)setReverseOrderOverridden:(BOOL)a3;
- (void)setScalingMaximum:(double)a3;
- (void)setScalingMinimum:(double)a3;
- (void)setSecondary:(BOOL)a3;
- (void)setTickLabelAutoRotation:(BOOL)a3;
- (void)setTickLabelColorIndex:(unint64_t)a3;
- (void)setTickLabelPosition:(int)a3;
- (void)setTickLabelRotationAngle:(double)a3;
- (void)setTitle:(id)a3;
@end

@implementation CHDAxis

- (CHDAxis)initWithResources:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CHDAxis;
  v5 = [(CHDAxis *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    *(_WORD *)&v6->mAutoCrossValue = 1;
    *(void *)&v6->mReverseOrder = 0x101000100000000;
    v6->mContentFormatId = -1;
    v6->mFontIndex = -1;
    v6->mScalingMaximum = 0.0;
    v6->mScalingMinimum = 0.0;
    v6->mOrientation = 0;
    v6->mTickLabelPosition = 3;
    v6->mAxisId = -1;
    *(void *)&v6->mCrossBetween = 1;
    *(_OWORD *)&v6->mCrossAxisId = xmmword_238EDF060;
    *(_OWORD *)&v6->mMajorTickMark = xmmword_238EDF050;
    v6->mTickLabelRotation = 0.0;
    v6->mIsAutoRotation = 0;
    v6->mTickLabelColorIndex = -1;
  }

  return v6;
}

- (void)setReverseOrder:(BOOL)a3
{
  self->mReverseOrder = a3;
  self->mOrientation = a3;
}

- (void)setCrossesAt:(double)a3
{
  self->mCrossesAt = a3;
  self->mAutoCrossValue = 0;
}

- (void)setCrossBetween:(int)a3
{
  self->mCrossBetween = a3;
}

- (void)setAxisId:(int)a3
{
  self->mAxisId = a3;
}

- (void)setAxisType:(int)a3
{
  self->mAxisType = a3;
}

- (void)setAxisPosition:(int)a3
{
  self->mAxisPosition = a3;
}

- (void)setAxisGraphicProperties:(id)a3
{
  v5 = (OADGraphicProperties *)a3;
  mAxisGraphicProperties = self->mAxisGraphicProperties;
  p_mAxisGraphicProperties = &self->mAxisGraphicProperties;
  if (mAxisGraphicProperties != v5)
  {
    objc_super v8 = v5;
    objc_storeStrong((id *)p_mAxisGraphicProperties, a3);
    v5 = v8;
  }
}

- (void)setMajorTickMark:(int)a3
{
  self->mMajorTickMark = a3;
}

- (void)setMinorTickMark:(int)a3
{
  self->mMinorTickMark = a3;
}

- (void)setTickLabelPosition:(int)a3
{
  self->mTickLabelPosition = a3;
}

- (void)setTickLabelAutoRotation:(BOOL)a3
{
  self->mIsAutoRotation = a3;
}

- (void)setTickLabelRotationAngle:(double)a3
{
  self->mTickLabelRotation = a3;
}

- (void)setTickLabelColorIndex:(unint64_t)a3
{
  self->mTickLabelColorIndex = a3;
}

- (void)setMinorGridLinesGraphicProperties:(id)a3
{
  v5 = (OADGraphicProperties *)a3;
  mMinorGridLinesGraphicProperties = self->mMinorGridLinesGraphicProperties;
  p_mMinorGridLinesGraphicProperties = &self->mMinorGridLinesGraphicProperties;
  if (mMinorGridLinesGraphicProperties != v5)
  {
    objc_super v8 = v5;
    objc_storeStrong((id *)p_mMinorGridLinesGraphicProperties, a3);
    v5 = v8;
  }
}

- (void)setMajorGridLinesGraphicProperties:(id)a3
{
  v5 = (OADGraphicProperties *)a3;
  mMajorGridLinesGraphicProperties = self->mMajorGridLinesGraphicProperties;
  p_mMajorGridLinesGraphicProperties = &self->mMajorGridLinesGraphicProperties;
  if (mMajorGridLinesGraphicProperties != v5)
  {
    objc_super v8 = v5;
    objc_storeStrong((id *)p_mMajorGridLinesGraphicProperties, a3);
    v5 = v8;
  }
}

- (int64_t)key
{
  return self->mAxisId;
}

- (void)setScalingMaximum:(double)a3
{
  self->mScalingMaximum = a3;
  self->mAutoMaximumValue = 0;
}

- (void)setTitle:(id)a3
{
  v5 = (CHDTitle *)a3;
  mTitle = self->mTitle;
  p_mTitle = &self->mTitle;
  if (mTitle != v5)
  {
    objc_super v8 = v5;
    objc_storeStrong((id *)p_mTitle, a3);
    v5 = v8;
  }
}

- (BOOL)isReverseOrder
{
  return self->mReverseOrder;
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

- (void)setIsContentFormatDerivedFromDataPoints:(BOOL)a3
{
  self->mContentFormatDerived = a3;
}

- (int)axisPosition
{
  return self->mAxisPosition;
}

- (BOOL)isSecondary
{
  return self->mSecondary;
}

- (id)font
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  unint64_t v4 = [WeakRetained fonts];
  v5 = [v4 objectAtIndex:self->mFontIndex];

  return v5;
}

- (id)majorGridLinesGraphicProperties
{
  return self->mMajorGridLinesGraphicProperties;
}

- (double)scalingMinimum
{
  return self->mScalingMinimum;
}

- (double)scalingMaximum
{
  return self->mScalingMaximum;
}

- (void)setScalingMinimum:(double)a3
{
  self->mScalingMinimum = a3;
  self->mAutoMinimumValue = 0;
}

- (void)setLineVisible:(BOOL)a3
{
  self->mLineVisible = a3;
}

- (void)setDeleted:(BOOL)a3
{
  self->mDeleted = a3;
}

- (void)setFontIndex:(unint64_t)a3
{
  self->mFontIndex = a3;
}

- (void)setContentFormatId:(unint64_t)a3
{
  self->mContentFormatId = a3;
}

- (void)setCrosses:(int)a3
{
  self->mCrosses = a3;
}

- (BOOL)isHorizontalPosition
{
  int mAxisPosition = self->mAxisPosition;
  return !mAxisPosition || mAxisPosition == 3;
}

- (void)setSecondary:(BOOL)a3
{
  self->mSecondary = a3;
}

- (void)setFont:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  v5 = [WeakRetained fonts];
  self->mFontIndex = [v5 addOrEquivalentObject:v6];
}

- (int)axisId
{
  return self->mAxisId;
}

- (int)axisIdForXml
{
  return self->mAxisId + 2094734552;
}

- (BOOL)isReverseOrderOverridden
{
  return self->mReverseOrderOverridden;
}

- (void)setReverseOrderOverridden:(BOOL)a3
{
  self->mReverseOrderOverridden = a3;
}

- (BOOL)isLineVisible
{
  return self->mLineVisible;
}

- (BOOL)isDeleted
{
  return self->mDeleted;
}

- (BOOL)isAutoMinimumValue
{
  return self->mAutoMinimumValue;
}

- (BOOL)isAutoMaximumValue
{
  return self->mAutoMaximumValue;
}

- (BOOL)isAutoCrossValue
{
  return self->mAutoCrossValue;
}

- (id)defaultDateTimeContentFormat
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  v3 = [WeakRetained contentFormats];
  unint64_t v4 = [v3 objectWithKey:14];

  return v4;
}

- (BOOL)isContentFormatDerivedFromDataPoints
{
  return self->mContentFormatDerived;
}

- (int)orientation
{
  return self->mOrientation;
}

- (void)setOrientation:(int)a3
{
  self->mOrientation = a3;
}

- (double)crossAxisId
{
  return self->mCrossAxisId;
}

- (double)crossAxisIdForXml
{
  return self->mCrossAxisId + 2094734550.0;
}

- (void)setCrossAxisId:(double)a3
{
  self->mCrossAxisId = a3;
}

- (double)crossesAt
{
  return self->mCrossesAt;
}

- (int)majorTickMark
{
  return self->mMajorTickMark;
}

- (int)minorTickMark
{
  return self->mMinorTickMark;
}

- (int)axisType
{
  return self->mAxisType;
}

- (int)tickLabelPosition
{
  return self->mTickLabelPosition;
}

- (BOOL)isTickLabelVisible
{
  return self->mTickLabelPosition != 0;
}

- (id)title
{
  return self->mTitle;
}

- (id)minorGridLinesGraphicProperties
{
  return self->mMinorGridLinesGraphicProperties;
}

- (id)axisGraphicProperties
{
  return self->mAxisGraphicProperties;
}

- (int)crossBetween
{
  return self->mCrossBetween;
}

- (int)crosses
{
  return self->mCrosses;
}

- (BOOL)isDate
{
  return 0;
}

- (BOOL)isDateTimeFormattingFlag
{
  return self->mDateTimeFormattingFlag;
}

- (void)setDateTimeFormattingFlag:(BOOL)a3
{
  self->mDateTimeFormattingFlag = a3;
}

- (double)tickLabelRotationAngle
{
  return self->mTickLabelRotation;
}

- (BOOL)isTickLabelAutoRotation
{
  return self->mIsAutoRotation;
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
    id v8 = v5;
    objc_storeStrong((id *)p_mLabelEffects, a3);
    v5 = v8;
  }
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)CHDAxis;
  v2 = [(CHDAxis *)&v4 description];
  return (NSString *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mLabelEffects, 0);
  objc_destroyWeak((id *)&self->mResources);
  objc_storeStrong((id *)&self->mAxisGraphicProperties, 0);
  objc_storeStrong((id *)&self->mMajorGridLinesGraphicProperties, 0);
  objc_storeStrong((id *)&self->mMinorGridLinesGraphicProperties, 0);
  objc_storeStrong((id *)&self->mTitle, 0);
}

- (unint64_t)contentFormatId
{
  return self->mContentFormatId;
}

- (unint64_t)fontIndex
{
  return self->mFontIndex;
}

- (unint64_t)tickLabelColorIndex
{
  return self->mTickLabelColorIndex;
}

- (id)tickLabelColor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  objc_super v4 = [WeakRetained colors];
  v5 = [v4 objectAtIndex:self->mTickLabelColorIndex];

  return v5;
}

@end