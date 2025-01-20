@interface UISliderDataModel
- (BOOL)_setValue:(float)a3 minValue:(float)a4 maxValue:(float)a5 minEnabledUsed:(BOOL)a6 minEnabledValue:(float)a7 maxEnabledUsed:(BOOL)a8 maxEnabledValue:(float)a9;
- (BOOL)isContinuous;
- (BOOL)isEnabled;
- (BOOL)isFluidTrackHidden;
- (BOOL)isHighlighted;
- (BOOL)isMinimumTrackVisible;
- (BOOL)isSelected;
- (BOOL)isThumbEnabled;
- (BOOL)isTrackEnabled;
- (BOOL)isTracking;
- (BOOL)isUserInteractionEnabled;
- (BOOL)setMaximumEnabledValue:(float)a3;
- (BOOL)setMaximumValue:(float)a3;
- (BOOL)setMinimumEnabledValue:(float)a3;
- (BOOL)setMinimumValue:(float)minEnabledValue;
- (BOOL)setValue:(float)a3;
- (BOOL)showValue;
- (UIColor)maximumTrackTintColor;
- (UIColor)minimumTrackTintColor;
- (UIColor)thumbTintColor;
- (UIImage)maximumValueImage;
- (UIImage)minimumValueImage;
- (UISliderDataModel)init;
- (_UIEdgeFeedbackGenerator)edgeFeedbackGenerator;
- (_UIModulationFeedbackGenerator)modulationFeedbackGenerator;
- (float)maximumEnabledValue;
- (float)maximumValue;
- (float)minimumEnabledValue;
- (float)minimumValue;
- (float)sliderSpeedMultiplier;
- (float)value;
- (id)_contentForState:(unint64_t)a3;
- (id)maximumTrackImageForState:(unint64_t)a3;
- (id)minimumTrackImageForState:(unint64_t)a3;
- (id)thumbImageForState:(unint64_t)a3;
- (void)_setContent:(id)a3 forState:(unint64_t)a4;
- (void)dealloc;
- (void)setContinuous:(BOOL)a3;
- (void)setEdgeFeedbackGenerator:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFluidTrackHidden:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMaximumTrackImage:(id)a3 forState:(unint64_t)a4;
- (void)setMaximumTrackImage:(id)a3 forStates:(unint64_t)a4;
- (void)setMaximumTrackTintColor:(id)a3;
- (void)setMaximumValueImage:(id)a3;
- (void)setMinimumTrackImage:(id)a3 forState:(unint64_t)a4;
- (void)setMinimumTrackImage:(id)a3 forStates:(unint64_t)a4;
- (void)setMinimumTrackTintColor:(id)a3;
- (void)setMinimumTrackVisible:(BOOL)a3;
- (void)setMinimumValueImage:(id)a3;
- (void)setModulationFeedbackGenerator:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShowValue:(BOOL)a3;
- (void)setSliderSpeedMultiplier:(float)a3;
- (void)setThumbEnabled:(BOOL)a3;
- (void)setThumbImage:(id)a3 forState:(unint64_t)a4;
- (void)setThumbImage:(id)a3 forStates:(unint64_t)a4;
- (void)setThumbTintColor:(id)a3;
- (void)setTrackEnabled:(BOOL)a3;
- (void)setTracking:(BOOL)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
@end

@implementation UISliderDataModel

- (UISliderDataModel)init
{
  v3.receiver = self;
  v3.super_class = (Class)UISliderDataModel;
  result = [(UISliderDataModel *)&v3 init];
  if (result)
  {
    result->_continuous = 1;
    *(_WORD *)&result->_thumbEnabled = 1;
    result->_minimumTrackVisible = 1;
    *(_DWORD *)&result->_userInteractionEnabled = 257;
    *(_OWORD *)&result->_value = xmmword_186B9E8A0;
    *(_WORD *)&result->_overrideMinimumEnabledValue = 0;
    *(void *)&result->_maxEnabledValue = 0x3F8000007F800000;
  }
  return result;
}

- (void)dealloc
{
  contentLookup = self->_contentLookup;
  if (contentLookup) {
    CFRelease(contentLookup);
  }
  v4.receiver = self;
  v4.super_class = (Class)UISliderDataModel;
  [(UISliderDataModel *)&v4 dealloc];
}

- (float)value
{
  return self->_value;
}

- (BOOL)setValue:(float)a3
{
  return self->_value != a3
      && -[UISliderDataModel _setValue:minValue:maxValue:minEnabledUsed:minEnabledValue:maxEnabledUsed:maxEnabledValue:](self, "_setValue:minValue:maxValue:minEnabledUsed:minEnabledValue:maxEnabledUsed:maxEnabledValue:", self->_overrideMinimumEnabledValue, self->_overrideMaximumEnabledValue);
}

- (BOOL)_setValue:(float)a3 minValue:(float)a4 maxValue:(float)a5 minEnabledUsed:(BOOL)a6 minEnabledValue:(float)a7 maxEnabledUsed:(BOOL)a8 maxEnabledValue:(float)a9
{
  BOOL v10 = a8;
  BOOL v12 = a6;
  if (a4 > a5)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UISliderDataModel.m", 83, @"Attempting to set a slider's minimumValue (%f) to be larger than the maximumValue (%f)", a4, a5);
  }
  if (a7 > a9 && v10 && v12)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UISliderDataModel.m", 86, @"Attempting to set a slider's minimumEnabledValue (%f) to be larger than the maximumEnabledValue (%f)", a4, a5);
  }
  if (v10) {
    float v20 = a9;
  }
  else {
    float v20 = a5;
  }
  if (v12) {
    float v21 = a7;
  }
  else {
    float v21 = a4;
  }
  if (v21 < a3) {
    float v21 = a3;
  }
  if (v20 > v21) {
    float v20 = v21;
  }
  if (v20 == self->_value && self->_minValue == a4 && self->_maxValue == a5)
  {
    if (v12 && self->_minEnabledValue != a7)
    {
      self->_value = v20;
      self->_minValue = a4;
      self->_maxValue = a5;
      goto LABEL_25;
    }
    if (!v10 || self->_maxEnabledValue == a9) {
      return 0;
    }
  }
  self->_value = v20;
  self->_minValue = a4;
  self->_maxValue = a5;
  if (v12) {
LABEL_25:
  }
    self->_minEnabledValue = a7;
  if (v10) {
    self->_maxEnabledValue = a9;
  }
  return 1;
}

- (float)minimumValue
{
  return self->_minValue;
}

- (BOOL)setMinimumValue:(float)minEnabledValue
{
  *(float *)&double v3 = minEnabledValue;
  if (self->_minValue == minEnabledValue) {
    return 0;
  }
  *(float *)&double v5 = self->_minEnabledValue;
  if (self->_maxValue >= minEnabledValue) {
    *(float *)&double v4 = self->_maxValue;
  }
  else {
    *(float *)&double v4 = minEnabledValue;
  }
  if (*(float *)&v5 > minEnabledValue) {
    minEnabledValue = self->_minEnabledValue;
  }
  if (*(float *)&v4 <= minEnabledValue) {
    minEnabledValue = *(float *)&v4;
  }
  if (self->_overrideMinimumEnabledValue) {
    *(float *)&double v5 = minEnabledValue;
  }
  if (self->_maxEnabledValue <= *(float *)&v3) {
    *(float *)&double v6 = *(float *)&v3;
  }
  else {
    *(float *)&double v6 = self->_maxEnabledValue;
  }
  if (*(float *)&v4 <= *(float *)&v6) {
    *(float *)&double v6 = *(float *)&v4;
  }
  if (!self->_overrideMaximumEnabledValue) {
    *(float *)&double v6 = self->_maxEnabledValue;
  }
  *(float *)&double v7 = self->_value;
  return -[UISliderDataModel _setValue:minValue:maxValue:minEnabledUsed:minEnabledValue:maxEnabledUsed:maxEnabledValue:](self, "_setValue:minValue:maxValue:minEnabledUsed:minEnabledValue:maxEnabledUsed:maxEnabledValue:", v7, v3, v4, v5, v6);
}

- (float)maximumValue
{
  return self->_maxValue;
}

- (BOOL)setMaximumValue:(float)a3
{
  if (self->_maxValue == a3) {
    return 0;
  }
  *(float *)&double v3 = self->_value;
  return -[UISliderDataModel _setValue:minValue:maxValue:minEnabledUsed:minEnabledValue:maxEnabledUsed:maxEnabledValue:](self, "_setValue:minValue:maxValue:minEnabledUsed:minEnabledValue:maxEnabledUsed:maxEnabledValue:", v3);
}

- (float)minimumEnabledValue
{
  uint64_t v2 = 60;
  if (!self->_overrideMinimumEnabledValue) {
    uint64_t v2 = 52;
  }
  return *(float *)((char *)&self->super.isa + v2);
}

- (BOOL)setMinimumEnabledValue:(float)a3
{
  if (self->_minEnabledValue == a3 || self->_minValue > a3 || self->_maxValue < a3) {
    return 0;
  }
  self->_overrideMinimumEnabledValue = 1;
  *(float *)&double v4 = self->_value;
  return -[UISliderDataModel _setValue:minValue:maxValue:minEnabledUsed:minEnabledValue:maxEnabledUsed:maxEnabledValue:](self, "_setValue:minValue:maxValue:minEnabledUsed:minEnabledValue:maxEnabledUsed:maxEnabledValue:", 1, v4);
}

- (float)maximumEnabledValue
{
  uint64_t v2 = 64;
  if (!self->_overrideMaximumEnabledValue) {
    uint64_t v2 = 56;
  }
  return *(float *)((char *)&self->super.isa + v2);
}

- (BOOL)setMaximumEnabledValue:(float)a3
{
  if (self->_maxEnabledValue == a3 || self->_minValue > a3 || self->_maxValue < a3) {
    return 0;
  }
  self->_overrideMaximumEnabledValue = 1;
  *(float *)&double v4 = self->_value;
  return -[UISliderDataModel _setValue:minValue:maxValue:minEnabledUsed:minEnabledValue:maxEnabledUsed:maxEnabledValue:](self, "_setValue:minValue:maxValue:minEnabledUsed:minEnabledValue:maxEnabledUsed:maxEnabledValue:", v4);
}

- (void)_setContent:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  contentLookup = self->_contentLookup;
  value = v6;
  if (!contentLookup)
  {
    contentLookup = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D540]);
    id v6 = value;
    self->_contentLookup = contentLookup;
  }
  if (v6) {
    CFDictionarySetValue(contentLookup, (const void *)a4, v6);
  }
  else {
    CFDictionaryRemoveValue(contentLookup, (const void *)a4);
  }
}

- (id)_contentForState:(unint64_t)a3
{
  CFDictionaryRef contentLookup = self->_contentLookup;
  if (contentLookup)
  {
    CFDictionaryGetValue(contentLookup, (const void *)a3);
    CFDictionaryRef contentLookup = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return contentLookup;
}

- (void)setThumbImage:(id)a3 forState:(unint64_t)a4
{
  id v7 = a3;
  id v6 = [(UISliderDataModel *)self _contentForState:a4];
  if (!v6)
  {
    id v6 = objc_alloc_init(_UISliderControlStateContent);
    [(UISliderDataModel *)self _setContent:v6 forState:a4];
  }
  [(_UISliderControlStateContent *)v6 setThumb:v7];
  if (!v7 && [(_UISliderControlStateContent *)v6 isEmpty]) {
    [(UISliderDataModel *)self _setContent:0 forState:a4];
  }
}

- (void)setThumbImage:(id)a3 forStates:(unint64_t)a4
{
  id v8 = a3;
  id v6 = (void *)MEMORY[0x18C108260]();
  do
  {
    id v7 = [(UISliderDataModel *)self _contentForState:a4 & -(uint64_t)a4];
    if (!v7)
    {
      id v7 = objc_alloc_init(_UISliderControlStateContent);
      [(UISliderDataModel *)self _setContent:v7 forState:a4 & -(uint64_t)a4];
    }
    [(_UISliderControlStateContent *)v7 setThumb:v8];
    if (!v8 && [(_UISliderControlStateContent *)v7 isEmpty]) {
      [(UISliderDataModel *)self _setContent:0 forState:a4 & -(uint64_t)a4];
    }

    a4 &= a4 - 1;
  }
  while (a4);
}

- (void)setThumbTintColor:(id)a3
{
  id v11 = a3;
  id v5 = [(UISliderDataModel *)self thumbTintColor];

  id v6 = v11;
  if (v5 != v11)
  {
    objc_storeStrong((id *)&self->_thumbTintColor, a3);
    id v7 = _UIImageWithName(@"UISliderKnob");
    id v8 = _UIImageWithName(@"UISliderKnob");
    if (v11)
    {
      uint64_t v9 = [v7 _flatImageWithColor:v11];

      uint64_t v10 = [v8 _flatImageWithColor:v11];

      id v7 = (void *)v9;
      id v8 = (void *)v10;
    }
    [(UISliderDataModel *)self setThumbImage:v7 forState:0];
    [(UISliderDataModel *)self setThumbImage:v8 forState:1];

    id v6 = v11;
  }
}

- (void)setMinimumTrackImage:(id)a3 forState:(unint64_t)a4
{
  id v7 = a3;
  id v6 = [(UISliderDataModel *)self _contentForState:a4];
  if (!v6)
  {
    id v6 = objc_alloc_init(_UISliderControlStateContent);
    [(UISliderDataModel *)self _setContent:v6 forState:a4];
  }
  [(_UISliderControlStateContent *)v6 setMinTrack:v7];
  if (!v7 && [(_UISliderControlStateContent *)v6 isEmpty]) {
    [(UISliderDataModel *)self _setContent:0 forState:a4];
  }
}

- (void)setMinimumTrackImage:(id)a3 forStates:(unint64_t)a4
{
  id v8 = a3;
  id v6 = (void *)MEMORY[0x18C108260]();
  do
  {
    id v7 = [(UISliderDataModel *)self _contentForState:a4 & -(uint64_t)a4];
    if (!v7)
    {
      id v7 = objc_alloc_init(_UISliderControlStateContent);
      [(UISliderDataModel *)self _setContent:v7 forState:a4 & -(uint64_t)a4];
    }
    [(_UISliderControlStateContent *)v7 setMinTrack:v8];
    if (!v8 && [(_UISliderControlStateContent *)v7 isEmpty]) {
      [(UISliderDataModel *)self _setContent:0 forState:a4 & -(uint64_t)a4];
    }

    a4 &= a4 - 1;
  }
  while (a4);
}

- (void)setMaximumTrackImage:(id)a3 forState:(unint64_t)a4
{
  id v7 = a3;
  id v6 = [(UISliderDataModel *)self _contentForState:a4];
  if (!v6)
  {
    id v6 = objc_alloc_init(_UISliderControlStateContent);
    [(UISliderDataModel *)self _setContent:v6 forState:a4];
  }
  [(_UISliderControlStateContent *)v6 setMaxTrack:v7];
  if (!v7 && [(_UISliderControlStateContent *)v6 isEmpty]) {
    [(UISliderDataModel *)self _setContent:0 forState:a4];
  }
}

- (void)setMaximumTrackImage:(id)a3 forStates:(unint64_t)a4
{
  id v8 = a3;
  id v6 = (void *)MEMORY[0x18C108260]();
  do
  {
    id v7 = [(UISliderDataModel *)self _contentForState:a4 & -(uint64_t)a4];
    if (!v7)
    {
      id v7 = objc_alloc_init(_UISliderControlStateContent);
      [(UISliderDataModel *)self _setContent:v7 forState:a4 & -(uint64_t)a4];
    }
    [(_UISliderControlStateContent *)v7 setMaxTrack:v8];
    if (!v8 && [(_UISliderControlStateContent *)v7 isEmpty]) {
      [(UISliderDataModel *)self _setContent:0 forState:a4 & -(uint64_t)a4];
    }

    a4 &= a4 - 1;
  }
  while (a4);
}

- (id)thumbImageForState:(unint64_t)a3
{
  double v4 = [(UISliderDataModel *)self _contentForState:a3];
  id v5 = [v4 thumb];

  if (!v5)
  {
    id v6 = [(UISliderDataModel *)self _contentForState:0];
    id v5 = [v6 thumb];
  }
  return v5;
}

- (id)minimumTrackImageForState:(unint64_t)a3
{
  double v4 = [(UISliderDataModel *)self _contentForState:a3];
  id v5 = [v4 minTrack];

  if (!v5)
  {
    id v6 = [(UISliderDataModel *)self _contentForState:0];
    id v5 = [v6 minTrack];
  }
  return v5;
}

- (id)maximumTrackImageForState:(unint64_t)a3
{
  double v4 = [(UISliderDataModel *)self _contentForState:a3];
  id v5 = [v4 maxTrack];

  if (!v5)
  {
    id v6 = [(UISliderDataModel *)self _contentForState:0];
    id v5 = [v6 maxTrack];
  }
  return v5;
}

- (void)setEdgeFeedbackGenerator:(id)a3
{
  id v5 = (_UIEdgeFeedbackGenerator *)a3;
  if ([(UIFeedbackGenerator *)self->_edgeFeedbackGenerator isActive])
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UISliderDataModel.m" lineNumber:342 description:@"Edge feedback behavior should not be changed while active."];
  }
  edgeFeedbackGenerator = self->_edgeFeedbackGenerator;
  self->_edgeFeedbackGenerator = v5;
}

- (_UIEdgeFeedbackGenerator)edgeFeedbackGenerator
{
  return self->_edgeFeedbackGenerator;
}

- (void)setModulationFeedbackGenerator:(id)a3
{
  id v5 = (_UIModulationFeedbackGenerator *)a3;
  if ([(UIFeedbackGenerator *)self->_modulationFeedbackGenerator isActive])
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UISliderDataModel.m" lineNumber:353 description:@"Modulation feedback behavior should not be changed while active."];
  }
  modulationFeedbackGenerator = self->_modulationFeedbackGenerator;
  self->_modulationFeedbackGenerator = v5;
}

- (_UIModulationFeedbackGenerator)modulationFeedbackGenerator
{
  return self->_modulationFeedbackGenerator;
}

- (UIImage)minimumValueImage
{
  return self->_minimumValueImage;
}

- (void)setMinimumValueImage:(id)a3
{
}

- (UIImage)maximumValueImage
{
  return self->_maximumValueImage;
}

- (void)setMaximumValueImage:(id)a3
{
}

- (UIColor)minimumTrackTintColor
{
  return self->_minTintColor;
}

- (void)setMinimumTrackTintColor:(id)a3
{
}

- (UIColor)maximumTrackTintColor
{
  return self->_maxTintColor;
}

- (void)setMaximumTrackTintColor:(id)a3
{
}

- (UIColor)thumbTintColor
{
  return self->_thumbTintColor;
}

- (BOOL)isContinuous
{
  return self->_continuous;
}

- (void)setContinuous:(BOOL)a3
{
  self->_continuous = a3;
}

- (BOOL)showValue
{
  return self->_showValue;
}

- (void)setShowValue:(BOOL)a3
{
  self->_showValue = a3;
}

- (BOOL)isThumbEnabled
{
  return self->_thumbEnabled;
}

- (void)setThumbEnabled:(BOOL)a3
{
  self->_thumbEnabled = a3;
}

- (BOOL)isTrackEnabled
{
  return self->_trackEnabled;
}

- (void)setTrackEnabled:(BOOL)a3
{
  self->_trackEnabled = a3;
}

- (BOOL)isMinimumTrackVisible
{
  return self->_minimumTrackVisible;
}

- (void)setMinimumTrackVisible:(BOOL)a3
{
  self->_minimumTrackVisible = a3;
}

- (BOOL)isFluidTrackHidden
{
  return self->_fluidTrackHidden;
}

- (void)setFluidTrackHidden:(BOOL)a3
{
  self->_fluidTrackHidden = a3;
}

- (float)sliderSpeedMultiplier
{
  return self->_sliderSpeedMultiplier;
}

- (void)setSliderSpeedMultiplier:(float)a3
{
  self->_sliderSpeedMultiplier = a3;
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  self->_userInteractionEnabled = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)isTracking
{
  return self->_tracking;
}

- (void)setTracking:(BOOL)a3
{
  self->_tracking = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbTintColor, 0);
  objc_storeStrong((id *)&self->_maxTintColor, 0);
  objc_storeStrong((id *)&self->_minTintColor, 0);
  objc_storeStrong((id *)&self->_maximumValueImage, 0);
  objc_storeStrong((id *)&self->_minimumValueImage, 0);
  objc_storeStrong((id *)&self->_modulationFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_edgeFeedbackGenerator, 0);
}

@end