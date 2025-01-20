@interface UISlider
+ (BOOL)_allowActionsToQueue;
+ (BOOL)_allowsUnsupportedMacIdiomBehavior;
+ (void)_setAllowsUnsupportedMacIdiomBehavior:(BOOL)a3;
- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight;
- (BOOL)_fluidTrackHidden;
- (BOOL)_isThumbEnabled;
- (BOOL)_trackEnabled;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)cancelMouseTracking;
- (BOOL)cancelTouchTracking;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isAccessibilityElementByDefault;
- (BOOL)isAnimatingValueChange;
- (BOOL)isContinuous;
- (BOOL)isElementAccessibilityExposedToInterfaceBuilder;
- (BOOL)isTracking;
- (CGRect)maximumValueImageRectForBounds:(CGRect)bounds;
- (CGRect)minimumValueImageRectForBounds:(CGRect)bounds;
- (CGRect)thumbRectForBounds:(CGRect)bounds trackRect:(CGRect)rect value:(float)value;
- (CGRect)trackRectForBounds:(CGRect)bounds;
- (CGRect)valueTextRectForBounds:(CGRect)a3;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (UIBehavioralStyle)behavioralStyle;
- (UIBehavioralStyle)preferredBehavioralStyle;
- (UIColor)maximumTrackTintColor;
- (UIColor)minimumTrackTintColor;
- (UIColor)thumbTintColor;
- (UIEdgeInsets)_thumbHitEdgeInsets;
- (UIEdgeInsets)alignmentRectInsets;
- (UIImage)currentMaximumTrackImage;
- (UIImage)currentMinimumTrackImage;
- (UIImage)currentThumbImage;
- (UIImage)maximumTrackImageForState:(UIControlState)state;
- (UIImage)maximumValueImage;
- (UIImage)minimumTrackImageForState:(UIControlState)state;
- (UIImage)minimumValueImage;
- (UIImage)thumbImageForState:(UIControlState)state;
- (UISlider)init;
- (UISlider)initWithCoder:(id)a3;
- (UISlider)initWithFrame:(CGRect)a3;
- (_UIEdgeFeedbackGenerator)_edgeFeedbackGenerator;
- (_UIModulationFeedbackGenerator)_modulationFeedbackGenerator;
- (_UISliderConfiguration)_sliderConfiguration;
- (float)_maximumEnabledValue;
- (float)_minimumEnabledValue;
- (float)_sliderSpeedMultiplier;
- (float)maximumValue;
- (float)minimumValue;
- (float)value;
- (id)_maxTrackView;
- (id)_maxValueView;
- (id)_minTrackView;
- (id)_minValueView;
- (id)_thumbView;
- (id)_thumbViewNeue;
- (id)createThumbView;
- (id)description;
- (unint64_t)_controlEventsForActionTriggered;
- (unint64_t)_fluidUpdateSource;
- (unint64_t)_sliderStyle;
- (void)_controlTouchBegan:(id)a3 withEvent:(id)a4;
- (void)_controlTouchEnded:(id)a3 withEvent:(id)a4;
- (void)_controlTouchMoved:(id)a3 withEvent:(id)a4;
- (void)_installVisualElement;
- (void)_installVisualElement:(id)a3;
- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3;
- (void)_populateArchivedSubviews:(id)a3;
- (void)_setEdgeFeedbackGenerator:(id)a3;
- (void)_setFluidTrackHidden:(BOOL)a3;
- (void)_setMaxValue:(float)a3;
- (void)_setMaximumEnabledValue:(float)a3;
- (void)_setMinValue:(float)a3;
- (void)_setMinimumEnabledValue:(float)a3;
- (void)_setMinimumTrackVisible:(BOOL)a3 withDuration:(double)a4;
- (void)_setModulationFeedbackGenerator:(id)a3;
- (void)_setSliderConfiguration:(id)a3;
- (void)_setSliderSpeedMultiplier:(float)a3;
- (void)_setSliderStyle:(unint64_t)a3;
- (void)_setThumbEnabled:(BOOL)a3;
- (void)_setTrackEnabled:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setContinuous:(BOOL)continuous;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMaximumTrackImage:(UIImage *)image forState:(UIControlState)state;
- (void)setMaximumTrackImage:(id)a3 forStates:(unint64_t)a4;
- (void)setMaximumTrackTintColor:(UIColor *)maximumTrackTintColor;
- (void)setMaximumValue:(float)maximumValue;
- (void)setMaximumValueImage:(UIImage *)maximumValueImage;
- (void)setMinimumTrackImage:(UIImage *)image forState:(UIControlState)state;
- (void)setMinimumTrackImage:(id)a3 forStates:(unint64_t)a4;
- (void)setMinimumTrackTintColor:(UIColor *)minimumTrackTintColor;
- (void)setMinimumValue:(float)minimumValue;
- (void)setMinimumValueImage:(UIImage *)minimumValueImage;
- (void)setPreferredBehavioralStyle:(UIBehavioralStyle)preferredBehavioralStyle;
- (void)setSelected:(BOOL)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setShowValue:(BOOL)a3;
- (void)setThumbImage:(UIImage *)image forState:(UIControlState)state;
- (void)setThumbImage:(id)a3 forStates:(unint64_t)a4;
- (void)setThumbTintColor:(UIColor *)thumbTintColor;
- (void)setTracking:(BOOL)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setValue:(float)value;
- (void)setValue:(float)value animated:(BOOL)animated;
@end

@implementation UISlider

- (BOOL)isAccessibilityElementByDefault
{
  return 1;
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 1;
}

+ (BOOL)_allowActionsToQueue
{
  return 1;
}

- (UISlider)init
{
  return -[UISlider initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 100.0, 34.0);
}

- (UISlider)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UISlider;
  v3 = -[UIControl initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setOpaque:0];
    uint64_t v5 = objc_opt_new();
    data = v4->_data;
    v4->_data = (UISliderDataModel *)v5;

    [(UISlider *)v4 _installVisualElement];
    [(UIControl *)v4 setSymbolAnimationEnabled:1];
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      [(UIView *)v4 bounds];
      LODWORD(v8) = 0;
      -[UISlider thumbRectForBounds:trackRect:value:](v4, "thumbRectForBounds:trackRect:value:", v8);
    }
    [(UISlider *)v4 _registerForTraitChanges];
  }
  return v4;
}

- (UISlider)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UISlider;
  uint64_t v5 = [(UIControl *)&v20 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    data = v5->_data;
    v5->_data = (UISliderDataModel *)v6;

    [(UISlider *)v5 _installVisualElement];
    [(UIControl *)v5 setSymbolAnimationEnabled:1];
    [(UISlider *)v5 _registerForTraitChanges];
    if ([v4 containsValueForKey:@"UIBehavioralStyle"]) {
      uint64_t v8 = [v4 decodeIntegerForKey:@"UIBehavioralStyle"];
    }
    else {
      uint64_t v8 = 0;
    }
    [(UISlider *)v5 setPreferredBehavioralStyle:v8];
    [v4 decodeFloatForKey:@"UIMinValue"];
    -[UISliderDataModel setMinimumValue:](v5->_data, "setMinimumValue:");
    int v9 = [v4 containsValueForKey:@"UIMaxValue"];
    LODWORD(v10) = 1.0;
    if (v9) {
      objc_msgSend(v4, "decodeFloatForKey:", @"UIMaxValue", v10);
    }
    [(UISliderDataModel *)v5->_data setMaximumValue:v10];
    [v4 decodeFloatForKey:@"UIValue"];
    -[UISliderDataModel setValue:](v5->_data, "setValue:");
    [(_UISliderVisualElement *)v5->_visualElement didSetValues];
    if ([v4 containsValueForKey:@"UIContinuous"])
    {
      -[UISliderDataModel setContinuous:](v5->_data, "setContinuous:", [v4 decodeBoolForKey:@"UIContinuous"]);
      [(_UISliderVisualElement *)v5->_visualElement didSetContinuous];
    }
    v11 = [v4 decodeObjectForKey:@"UIMinimumValueImage"];
    if (v11)
    {
      [(UISliderDataModel *)v5->_data setMinimumValueImage:v11];
      [(_UISliderVisualElement *)v5->_visualElement didSetMinimumValueImage];
    }
    v12 = [v4 decodeObjectForKey:@"UIMaximumValueImage"];
    if (v12)
    {
      [(UISliderDataModel *)v5->_data setMaximumValueImage:v12];
      [(_UISliderVisualElement *)v5->_visualElement didSetMaximumValueImage];
    }
    if ([v4 containsValueForKey:@"UIMinimumTintColor"])
    {
      v13 = v5->_data;
      v14 = [v4 decodeObjectForKey:@"UIMinimumTintColor"];
      [(UISliderDataModel *)v13 setMinimumTrackTintColor:v14];

      [(_UISliderVisualElement *)v5->_visualElement didSetMinimumTrackTintColor];
    }
    if ([v4 containsValueForKey:@"UIMaximumTintColor"])
    {
      v15 = v5->_data;
      v16 = [v4 decodeObjectForKey:@"UIMaximumTintColor"];
      [(UISliderDataModel *)v15 setMaximumTrackTintColor:v16];

      [(_UISliderVisualElement *)v5->_visualElement didSetMaximumTrackTintColor];
    }
    if ([v4 containsValueForKey:@"UIThumbTintColor"])
    {
      v17 = v5->_data;
      v18 = [v4 decodeObjectForKey:@"UIThumbTintColor"];
      [(UISliderDataModel *)v17 setThumbTintColor:v18];

      [(UISlider *)v5 setThumbImage:0 forStates:7];
      [(_UISliderVisualElement *)v5->_visualElement didSetThumbTintColor];
    }
  }
  return v5;
}

- (void)_installVisualElement:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  p_visualElement = &self->_visualElement;
  [(_UISliderVisualElement *)self->_visualElement setSlider:0];
  [(_UISliderVisualElement *)self->_visualElement removeFromSuperview];
  objc_storeStrong((id *)&self->_visualElement, a3);
  *(unsigned char *)&self->_visualElementFlags = *(unsigned char *)&self->_visualElementFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  if (objc_opt_respondsToSelector()) {
    char v8 = 2;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)&self->_visualElementFlags = *(unsigned char *)&self->_visualElementFlags & 0xFD | v8;
  if (objc_opt_respondsToSelector()) {
    char v9 = 4;
  }
  else {
    char v9 = 0;
  }
  *(unsigned char *)&self->_visualElementFlags = *(unsigned char *)&self->_visualElementFlags & 0xFB | v9;
  if (objc_opt_respondsToSelector()) {
    char v10 = 8;
  }
  else {
    char v10 = 0;
  }
  *(unsigned char *)&self->_visualElementFlags = *(unsigned char *)&self->_visualElementFlags & 0xF7 | v10;
  if (objc_opt_respondsToSelector()) {
    char v11 = 16;
  }
  else {
    char v11 = 0;
  }
  *(unsigned char *)&self->_visualElementFlags = *(unsigned char *)&self->_visualElementFlags & 0xEF | v11;
  [(_UISliderVisualElement *)*p_visualElement setSlider:self];
  [(_UISliderVisualElement *)*p_visualElement setSemanticContentAttribute:[(UIView *)self semanticContentAttribute]];
  if (!self->_data)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"UISlider.m" lineNumber:223 description:@"Installing visual element before data model has been created"];
  }
  -[_UISliderVisualElement setData:](*p_visualElement, "setData:");
  v12 = *p_visualElement;
  [(UIView *)self bounds];
  -[_UISliderVisualElement setFrame:](v12, "setFrame:");
  [(_UISliderVisualElement *)*p_visualElement setAutoresizingMask:18];
  if ((dyld_program_sdk_at_least() & 1) == 0 && !self->_dummyViews)
  {
    v13 = objc_opt_new();
    v20[0] = v13;
    v14 = objc_opt_new();
    v20[1] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    dummyViews = self->_dummyViews;
    self->_dummyViews = v15;

    v17 = self->_dummyViews;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __34__UISlider__installVisualElement___block_invoke;
    v19[3] = &unk_1E52DA8E8;
    v19[4] = self;
    [(NSArray *)v17 enumerateObjectsUsingBlock:v19];
  }
  [(UIView *)self addSubview:*p_visualElement];
}

void __34__UISlider__installVisualElement___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setAutoresizingMask:18];
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(v3, "setFrame:");
  [*(id *)(a1 + 32) addSubview:v3];
}

- (void)_installVisualElement
{
  int64_t sliderStyle = self->_sliderStyle;
  if (sliderStyle > 109)
  {
    if (sliderStyle != 110)
    {
LABEL_5:
      uint64_t v4 = objc_opt_new();
      goto LABEL_7;
    }
  }
  else if (sliderStyle != 100)
  {
    goto LABEL_5;
  }
  id v5 = (id)objc_opt_new();
  [v5 setChangeWithVolumeButtons:0];
  uint64_t v4 = (uint64_t)v5;
LABEL_7:
  id v6 = (id)v4;
  [(UISlider *)self _installVisualElement:v4];
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UISlider;
  -[UIView setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  [(_UISliderVisualElement *)self->_visualElement setSemanticContentAttribute:a3];
}

- (void)_setEdgeFeedbackGenerator:(id)a3
{
}

- (_UIEdgeFeedbackGenerator)_edgeFeedbackGenerator
{
  return [(UISliderDataModel *)self->_data edgeFeedbackGenerator];
}

- (void)_setModulationFeedbackGenerator:(id)a3
{
}

- (_UIModulationFeedbackGenerator)_modulationFeedbackGenerator
{
  return [(UISliderDataModel *)self->_data modulationFeedbackGenerator];
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UISlider;
  [(UIView *)&v9 _populateArchivedSubviews:v4];
  [v4 removeObject:self->_visualElement];
  [v4 removeObject:self->_visualElement];
  dummyViews = self->_dummyViews;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__UISlider__populateArchivedSubviews___block_invoke;
  v7[3] = &unk_1E52DA8E8;
  id v8 = v4;
  id v6 = v4;
  [(NSArray *)dummyViews enumerateObjectsUsingBlock:v7];
}

uint64_t __38__UISlider__populateArchivedSubviews___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeObject:a2];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UISlider;
  [(UIControl *)&v15 encodeWithCoder:v4];
  [(UISliderDataModel *)self->_data value];
  if (v5 != 0.0) {
    objc_msgSend(v4, "encodeFloat:forKey:", @"UIValue");
  }
  [(UISliderDataModel *)self->_data minimumValue];
  if (v6 != 0.0) {
    objc_msgSend(v4, "encodeFloat:forKey:", @"UIMinValue");
  }
  [(UISliderDataModel *)self->_data maximumValue];
  if (v7 != 1.0) {
    objc_msgSend(v4, "encodeFloat:forKey:", @"UIMaxValue");
  }
  if (![(UISliderDataModel *)self->_data isContinuous]) {
    [v4 encodeBool:0 forKey:@"UIContinuous"];
  }
  id v8 = [(UISlider *)self minimumValueImage];

  if (v8)
  {
    objc_super v9 = [(UISlider *)self minimumValueImage];
    [v4 encodeObject:v9 forKey:@"UIMinimumValueImage"];
  }
  char v10 = [(UISlider *)self maximumValueImage];

  if (v10)
  {
    char v11 = [(UISlider *)self maximumValueImage];
    [v4 encodeObject:v11 forKey:@"UIMaximumValueImage"];
  }
  v12 = [(UISliderDataModel *)self->_data minimumTrackTintColor];
  if (v12) {
    [v4 encodeObject:v12 forKey:@"UIMinimumTintColor"];
  }
  v13 = [(UISliderDataModel *)self->_data maximumTrackTintColor];
  if (v13) {
    [v4 encodeObject:v13 forKey:@"UIMaximumTintColor"];
  }
  v14 = [(UISliderDataModel *)self->_data thumbTintColor];
  if (v14) {
    [v4 encodeObject:v14 forKey:@"UIThumbTintColor"];
  }
  objc_msgSend(v4, "encodeInteger:forKey:", -[UISlider preferredBehavioralStyle](self, "preferredBehavioralStyle"), @"UIBehavioralStyle");
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)UISlider;
  id v3 = [(UIView *)&v7 description];
  id v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
  [(UISlider *)self value];
  objc_msgSend(v4, "appendFormat:", @"; value: %f>", v5);
  return v4;
}

- (void)setThumbImage:(UIImage *)image forState:(UIControlState)state
{
  data = self->_data;
  objc_super v7 = image;
  [(UISliderDataModel *)data setThumbTintColor:0];
  [(UISliderDataModel *)self->_data setThumbImage:v7 forState:state];

  visualElement = self->_visualElement;
  [(_UISliderVisualElement *)visualElement didSetThumbImageForState:state];
}

- (UIColor)thumbTintColor
{
  return [(UISliderDataModel *)self->_data thumbTintColor];
}

- (void)setThumbTintColor:(UIColor *)thumbTintColor
{
  float v6 = thumbTintColor;
  id v4 = [(UISliderDataModel *)self->_data thumbTintColor];

  float v5 = v6;
  if (v4 != v6)
  {
    [(UISliderDataModel *)self->_data setThumbTintColor:v6];
    [(UISlider *)self setThumbImage:0 forStates:7];
    [(_UISliderVisualElement *)self->_visualElement didSetThumbTintColor];
    float v5 = v6;
  }
}

- (void)setMinimumTrackImage:(UIImage *)image forState:(UIControlState)state
{
  -[UISliderDataModel setMinimumTrackImage:forState:](self->_data, "setMinimumTrackImage:forState:", image);
  visualElement = self->_visualElement;
  [(_UISliderVisualElement *)visualElement didSetMinimumTrackImageForState:state];
}

- (UIColor)minimumTrackTintColor
{
  return [(UISliderDataModel *)self->_data minimumTrackTintColor];
}

- (void)setMinimumTrackTintColor:(UIColor *)minimumTrackTintColor
{
  float v6 = minimumTrackTintColor;
  id v4 = [(UISliderDataModel *)self->_data minimumTrackTintColor];

  float v5 = v6;
  if (v4 != v6)
  {
    [(UISliderDataModel *)self->_data setMinimumTrackTintColor:v6];
    [(_UISliderVisualElement *)self->_visualElement didSetMinimumTrackTintColor];
    float v5 = v6;
  }
}

- (void)setMaximumTrackImage:(UIImage *)image forState:(UIControlState)state
{
  -[UISliderDataModel setMaximumTrackImage:forState:](self->_data, "setMaximumTrackImage:forState:", image);
  visualElement = self->_visualElement;
  [(_UISliderVisualElement *)visualElement didSetMaximumTrackImageForState:state];
}

- (UIColor)maximumTrackTintColor
{
  return [(UISliderDataModel *)self->_data maximumTrackTintColor];
}

- (void)setMaximumTrackTintColor:(UIColor *)maximumTrackTintColor
{
  [(UISliderDataModel *)self->_data setMaximumTrackTintColor:maximumTrackTintColor];
  visualElement = self->_visualElement;
  [(_UISliderVisualElement *)visualElement didSetMaximumTrackTintColor];
}

- (UIImage)thumbImageForState:(UIControlState)state
{
  return (UIImage *)[(UISliderDataModel *)self->_data thumbImageForState:state];
}

- (UIImage)minimumTrackImageForState:(UIControlState)state
{
  return (UIImage *)[(UISliderDataModel *)self->_data minimumTrackImageForState:state];
}

- (UIImage)maximumTrackImageForState:(UIControlState)state
{
  return (UIImage *)[(UISliderDataModel *)self->_data maximumTrackImageForState:state];
}

- (UIImage)currentThumbImage
{
  return (UIImage *)[(_UISliderVisualElement *)self->_visualElement currentThumbImage];
}

- (UIImage)currentMinimumTrackImage
{
  return (UIImage *)[(_UISliderVisualElement *)self->_visualElement currentMinimumTrackImage];
}

- (UIImage)currentMaximumTrackImage
{
  return (UIImage *)[(_UISliderVisualElement *)self->_visualElement currentMaximumTrackImage];
}

- (void)setMinimumValueImage:(UIImage *)minimumValueImage
{
  float v6 = minimumValueImage;
  id v4 = [(UISliderDataModel *)self->_data minimumValueImage];

  float v5 = v6;
  if (v4 != v6)
  {
    [(UISliderDataModel *)self->_data setMinimumValueImage:v6];
    [(_UISliderVisualElement *)self->_visualElement didSetMinimumValueImage];
    float v5 = v6;
  }
}

- (UIImage)minimumValueImage
{
  return [(UISliderDataModel *)self->_data minimumValueImage];
}

- (void)setMaximumValueImage:(UIImage *)maximumValueImage
{
  float v6 = maximumValueImage;
  id v4 = [(UISliderDataModel *)self->_data maximumValueImage];

  float v5 = v6;
  if (v4 != v6)
  {
    [(UISliderDataModel *)self->_data setMaximumValueImage:v6];
    [(_UISliderVisualElement *)self->_visualElement didSetMaximumValueImage];
    float v5 = v6;
  }
}

- (UIImage)maximumValueImage
{
  return [(UISliderDataModel *)self->_data maximumValueImage];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return [(_UISliderVisualElement *)self->_visualElement gestureRecognizerShouldBegin:a3];
}

- (CGRect)minimumValueImageRectForBounds:(CGRect)bounds
{
  -[_UISliderVisualElement minimumValueImageRectForBounds:](self->_visualElement, "minimumValueImageRectForBounds:", bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)maximumValueImageRectForBounds:(CGRect)bounds
{
  -[_UISliderVisualElement maximumValueImageRectForBounds:](self->_visualElement, "maximumValueImageRectForBounds:", bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)trackRectForBounds:(CGRect)bounds
{
  -[_UISliderVisualElement trackRectForBounds:](self->_visualElement, "trackRectForBounds:", bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)thumbRectForBounds:(CGRect)bounds trackRect:(CGRect)rect value:(float)value
{
  -[_UISliderVisualElement thumbRectForBounds:trackRect:value:](self->_visualElement, "thumbRectForBounds:trackRect:value:", bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return 1;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  -[_UISliderVisualElement _intrinsicSizeWithinSize:](self->_visualElement, "_intrinsicSizeWithinSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  double v4 = (_UISliderVisualElement *)a3;
  if (self->_visualElement == v4) {
    [(UIView *)self invalidateIntrinsicContentSize];
  }
  v5.receiver = self;
  v5.super_class = (Class)UISlider;
  [(UIView *)&v5 _intrinsicContentSizeInvalidatedForChildView:v4];
}

- (UIEdgeInsets)alignmentRectInsets
{
  [(_UISliderVisualElement *)self->_visualElement alignmentRectInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)UISlider;
  [(UIView *)&v3 layoutSubviews];
  [(_UISliderVisualElement *)self->_visualElement didPerformLayout];
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIView *)self isUserInteractionEnabled] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UISlider;
    [(UIView *)&v5 setUserInteractionEnabled:v3];
    [(UISliderDataModel *)self->_data setUserInteractionEnabled:v3];
    if ((*(unsigned char *)&self->_visualElementFlags & 4) != 0) {
      [(_UISliderVisualElement *)self->_visualElement didSetUserInteractionEnabled];
    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIControl *)self isEnabled] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UISlider;
    [(UIControl *)&v5 setEnabled:v3];
    [(UISliderDataModel *)self->_data setEnabled:v3];
    [(_UISliderVisualElement *)self->_visualElement didSetEnabled];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIControl *)self isHighlighted] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UISlider;
    [(UIControl *)&v5 setHighlighted:v3];
    [(UISliderDataModel *)self->_data setHighlighted:v3];
    [(_UISliderVisualElement *)self->_visualElement didSetHighlighted];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIControl *)self isSelected] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UISlider;
    [(UIControl *)&v5 setSelected:v3];
    [(UISliderDataModel *)self->_data setSelected:v3];
    [(_UISliderVisualElement *)self->_visualElement didSetSelected];
  }
}

- (void)setContinuous:(BOOL)continuous
{
  [(UISliderDataModel *)self->_data setContinuous:continuous];
  visualElement = self->_visualElement;
  [(_UISliderVisualElement *)visualElement didSetContinuous];
}

- (BOOL)isContinuous
{
  return [(UISliderDataModel *)self->_data isContinuous];
}

- (float)value
{
  [(UISliderDataModel *)self->_data value];
  return result;
}

- (void)setValue:(float)value
{
}

- (void)setValue:(float)value animated:(BOOL)animated
{
}

- (float)minimumValue
{
  [(UISliderDataModel *)self->_data minimumValue];
  return result;
}

- (void)setMinimumValue:(float)minimumValue
{
  if (-[UISliderDataModel setMinimumValue:](self->_data, "setMinimumValue:"))
  {
    visualElement = self->_visualElement;
    [(_UISliderVisualElement *)visualElement didSetValues];
  }
}

- (float)maximumValue
{
  [(UISliderDataModel *)self->_data maximumValue];
  return result;
}

- (void)setMaximumValue:(float)maximumValue
{
  if (-[UISliderDataModel setMaximumValue:](self->_data, "setMaximumValue:"))
  {
    visualElement = self->_visualElement;
    [(_UISliderVisualElement *)visualElement didSetValues];
  }
}

- (void)_setMaxValue:(float)a3
{
}

- (void)_setMinValue:(float)a3
{
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 4096;
}

- (BOOL)cancelMouseTracking
{
  return [(_UISliderVisualElement *)self->_visualElement cancelMouseTracking];
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  return [(_UISliderVisualElement *)self->_visualElement beginTrackingWithTouch:a3 withEvent:a4];
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  return [(_UISliderVisualElement *)self->_visualElement continueTrackingWithTouch:a3 withEvent:a4];
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
}

- (void)_controlTouchBegan:(id)a3 withEvent:(id)a4
{
}

- (void)_controlTouchMoved:(id)a3 withEvent:(id)a4
{
}

- (void)_controlTouchEnded:(id)a3 withEvent:(id)a4
{
}

- (BOOL)cancelTouchTracking
{
  return [(_UISliderVisualElement *)self->_visualElement cancelTouchTracking];
}

- (BOOL)isTracking
{
  if ((*(unsigned char *)&self->_visualElementFlags & 8) != 0) {
    return [(_UISliderVisualElement *)self->_visualElement overriddenTrackingState];
  }
  else {
    return [(UISliderDataModel *)self->_data isTracking];
  }
}

- (void)setTracking:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UISlider;
  -[UIControl setTracking:](&v5, sel_setTracking_);
  [(UISliderDataModel *)self->_data setTracking:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sliderConfiguration, 0);
  objc_storeStrong((id *)&self->_dummyViews, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_visualElement, 0);
}

- (BOOL)isAnimatingValueChange
{
  return [(_UISliderVisualElement *)self->_visualElement isAnimatingValueChange];
}

- (void)setShowValue:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UISliderDataModel *)self->_data showValue] != a3)
  {
    [(UISliderDataModel *)self->_data setShowValue:v3];
    visualElement = self->_visualElement;
    [(_UISliderVisualElement *)visualElement didSetShowValue];
  }
}

- (CGRect)valueTextRectForBounds:(CGRect)a3
{
  -[_UISliderVisualElement valueTextRectForBounds:](self->_visualElement, "valueTextRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)createThumbView
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setThumbImage:(id)a3 forStates:(unint64_t)a4
{
  [(UISliderDataModel *)self->_data setThumbImage:a3 forStates:a4];
  visualElement = self->_visualElement;
  [(_UISliderVisualElement *)visualElement didSetThumbImageForStates];
}

- (void)setMinimumTrackImage:(id)a3 forStates:(unint64_t)a4
{
  [(UISliderDataModel *)self->_data setMinimumTrackImage:a3 forStates:a4];
  visualElement = self->_visualElement;
  [(_UISliderVisualElement *)visualElement didSetMinimumTrackImageForStates];
}

- (void)setMaximumTrackImage:(id)a3 forStates:(unint64_t)a4
{
  [(UISliderDataModel *)self->_data setMaximumTrackImage:a3 forStates:a4];
  visualElement = self->_visualElement;
  [(_UISliderVisualElement *)visualElement didSetMaximumTrackImageForStates];
}

- (void)_setTrackEnabled:(BOOL)a3
{
}

- (BOOL)_trackEnabled
{
  return [(UISliderDataModel *)self->_data isTrackEnabled];
}

- (void)_setThumbEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UISliderDataModel *)self->_data isThumbEnabled] != a3)
  {
    [(UISliderDataModel *)self->_data setThumbEnabled:v3];
    visualElement = self->_visualElement;
    [(_UISliderVisualElement *)visualElement didSetThumbEnabled];
  }
}

- (void)_setMinimumTrackVisible:(BOOL)a3 withDuration:(double)a4
{
  BOOL v5 = a3;
  if ([(UISliderDataModel *)self->_data isMinimumTrackVisible] != a3)
  {
    [(UISliderDataModel *)self->_data setMinimumTrackVisible:v5];
    visualElement = self->_visualElement;
    [(_UISliderVisualElement *)visualElement didChangeMinimumTrackVisibleWithDuration:a4];
  }
}

- (BOOL)_isThumbEnabled
{
  return [(UISliderDataModel *)self->_data isThumbEnabled];
}

- (UIEdgeInsets)_thumbHitEdgeInsets
{
  [(_UISliderVisualElement *)self->_visualElement thumbHitEdgeInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)_minTrackView
{
  return (id)[(_UISliderVisualElement *)self->_visualElement minTrackView];
}

- (id)_maxTrackView
{
  return (id)[(_UISliderVisualElement *)self->_visualElement maxTrackView];
}

- (id)_minValueView
{
  return (id)[(_UISliderVisualElement *)self->_visualElement minValueImageView];
}

- (id)_maxValueView
{
  return (id)[(_UISliderVisualElement *)self->_visualElement maxValueImageView];
}

- (id)_thumbView
{
  return (id)[(_UISliderVisualElement *)self->_visualElement thumbView];
}

- (id)_thumbViewNeue
{
  return (id)[(_UISliderVisualElement *)self->_visualElement thumbViewNeue];
}

- (_UISliderConfiguration)_sliderConfiguration
{
  double v2 = (void *)[(_UISliderConfiguration *)self->_sliderConfiguration copyWithZone:0];
  return (_UISliderConfiguration *)v2;
}

- (void)_setSliderConfiguration:(id)a3
{
  id v6 = a3;
  if (([v6 isEqual:self->_sliderConfiguration] & 1) == 0)
  {
    double v4 = (_UISliderConfiguration *)[v6 copyWithZone:0];
    sliderConfiguration = self->_sliderConfiguration;
    self->_sliderConfiguration = v4;

    if ((*(unsigned char *)&self->_visualElementFlags & 2) != 0) {
      [(_UISliderVisualElement *)self->_visualElement didUpdateConfiguration];
    }
  }
}

- (unint64_t)_sliderStyle
{
  return self->_sliderStyle;
}

- (void)_setSliderStyle:(unint64_t)a3
{
  if (self->_sliderStyle != a3)
  {
    self->_int64_t sliderStyle = a3;
    [(UISlider *)self _installVisualElement];
  }
}

- (unint64_t)_fluidUpdateSource
{
  if (*(unsigned char *)&self->_visualElementFlags) {
    return [(_UISliderVisualElement *)self->_visualElement fluidUpdateSource];
  }
  else {
    return 0;
  }
}

- (void)_setFluidTrackHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ((*(unsigned char *)&self->_visualElementFlags & 1) == 0)
  {
    double v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UISlider.m" lineNumber:1003 description:@"Using fluid slider methods on non-fluid slider."];
  }
  [(UISliderDataModel *)self->_data setFluidTrackHidden:v3];
  visualElement = self->_visualElement;
  [(_UISliderVisualElement *)visualElement didSetFluidTrackHidden];
}

- (BOOL)_fluidTrackHidden
{
  if ((*(unsigned char *)&self->_visualElementFlags & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"UISlider.m" lineNumber:1010 description:@"Using fluid slider methods on non-fluid slider."];
  }
  data = self->_data;
  return [(UISliderDataModel *)data isFluidTrackHidden];
}

- (float)_minimumEnabledValue
{
  [(UISliderDataModel *)self->_data minimumEnabledValue];
  return result;
}

- (void)_setMinimumEnabledValue:(float)a3
{
  if (-[UISliderDataModel setMinimumEnabledValue:](self->_data, "setMinimumEnabledValue:"))
  {
    visualElement = self->_visualElement;
    [(_UISliderVisualElement *)visualElement didSetValues];
  }
}

- (float)_maximumEnabledValue
{
  [(UISliderDataModel *)self->_data maximumEnabledValue];
  return result;
}

- (void)_setMaximumEnabledValue:(float)a3
{
  if (-[UISliderDataModel setMaximumEnabledValue:](self->_data, "setMaximumEnabledValue:"))
  {
    visualElement = self->_visualElement;
    [(_UISliderVisualElement *)visualElement didSetValues];
  }
}

- (float)_sliderSpeedMultiplier
{
  [(UISliderDataModel *)self->_data sliderSpeedMultiplier];
  return result;
}

- (void)_setSliderSpeedMultiplier:(float)a3
{
  [(UISliderDataModel *)self->_data sliderSpeedMultiplier];
  if (vabds_f32(*(float *)&v5, a3) >= 0.00000011921)
  {
    *(float *)&double v5 = a3;
    [(UISliderDataModel *)self->_data setSliderSpeedMultiplier:v5];
    if ((*(unsigned char *)&self->_visualElementFlags & 0x10) != 0)
    {
      visualElement = self->_visualElement;
      [(_UISliderVisualElement *)visualElement didSetSpeedMultiplier];
    }
  }
}

- (UIBehavioralStyle)behavioralStyle
{
  return 1;
}

- (UIBehavioralStyle)preferredBehavioralStyle
{
  return self->_preferredBehavioralStyle;
}

- (void)setPreferredBehavioralStyle:(UIBehavioralStyle)preferredBehavioralStyle
{
  UIBehavioralStyle v5 = [(UISlider *)self behavioralStyle];
  self->_preferredBehavioralStyle = preferredBehavioralStyle;
  if (!self->_visualElement || v5 != [(UISlider *)self behavioralStyle])
  {
    [(UISlider *)self _installVisualElement];
  }
}

+ (void)_setAllowsUnsupportedMacIdiomBehavior:(BOOL)a3
{
  _UnsupportedFlags_0 = _UnsupportedFlags_0 & 0xFE | a3;
}

+ (BOOL)_allowsUnsupportedMacIdiomBehavior
{
  return _UnsupportedFlags_0 & 1;
}

@end