@interface UIStepper
+ (BOOL)_allowsUnsupportedMacIdiomBehavior;
+ (Class)_fallbackVisualElementClass;
+ (Class)visualElementClassForTraitCollection:(id)a3;
+ (id)visualElementForTraitCollection:(id)a3;
+ (void)_registerVisualElementClass:(Class)a3 forIdiom:(int64_t)a4;
+ (void)_setAllowsUnsupportedMacIdiomBehavior:(BOOL)a3;
- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight;
- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth;
- (BOOL)autorepeat;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isContinuous;
- (BOOL)wraps;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIEdgeInsets)alignmentRectInsets;
- (UIImage)backgroundImageForState:(UIControlState)state;
- (UIImage)decrementImageForState:(UIControlState)state;
- (UIImage)dividerImageForLeftSegmentState:(UIControlState)state rightSegmentState:(UIControlState)a4;
- (UIImage)incrementImageForState:(UIControlState)state;
- (UIStepper)initWithCoder:(id)a3;
- (UIStepper)initWithFrame:(CGRect)a3;
- (UIStepperVisualElement)visualElement;
- (double)maximumValue;
- (double)minimumValue;
- (double)stepValue;
- (double)value;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (unint64_t)_controlEventsForActionTriggered;
- (void)_commonStepperInit;
- (void)_emitValueChanged;
- (void)_populateArchivedSubviews:(id)a3;
- (void)_refreshVisualElement;
- (void)_refreshVisualElementForTraitCollection:(id)a3 populatingAPIProperties:(BOOL)a4;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)setAutorepeat:(BOOL)autorepeat;
- (void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state;
- (void)setContinuous:(BOOL)continuous;
- (void)setDecrementImage:(UIImage *)image forState:(UIControlState)state;
- (void)setDividerImage:(UIImage *)image forLeftSegmentState:(UIControlState)leftState rightSegmentState:(UIControlState)rightState;
- (void)setEnabled:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setIncrementImage:(UIImage *)image forState:(UIControlState)state;
- (void)setMaximumValue:(double)maximumValue;
- (void)setMinimumValue:(double)minimumValue;
- (void)setStepValue:(double)stepValue;
- (void)setTintColor:(id)a3;
- (void)setValue:(double)value;
- (void)setVisualElement:(id)a3;
- (void)setWraps:(BOOL)wraps;
- (void)tintColorDidChange;
- (void)visualElementDidSetValue:(id)a3;
@end

@implementation UIStepper

- (UIStepper)initWithFrame:(CGRect)a3
{
  double y = a3.origin.y;
  double x = a3.origin.x;
  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_fallbackVisualElementClass"), "initialSize");
  v11.receiver = self;
  v11.super_class = (Class)UIStepper;
  v8 = -[UIControl initWithFrame:](&v11, sel_initWithFrame_, x, y, v6, v7);
  v9 = v8;
  if (v8)
  {
    [(UIStepper *)v8 _commonStepperInit];
    [(UIStepper *)v9 _refreshVisualElement];
  }
  return v9;
}

- (void)_populateArchivedSubviews:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIStepper;
  id v4 = a3;
  [(UIView *)&v6 _populateArchivedSubviews:v4];
  v5 = [(UIStepper *)self visualElement];
  [v4 removeObject:v5];
}

- (void)setFrame:(CGRect)a3
{
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[UIStepper sizeThatFits:](self, "sizeThatFits:", a3.size.width, a3.size.height);
  v8.receiver = self;
  v8.super_class = (Class)UIStepper;
  -[UIView setFrame:](&v8, sel_setFrame_, x, y, v6, v7);
}

- (void)setValue:(double)value
{
  if (self->_minimumValue > value) {
    value = self->_minimumValue;
  }
  if (value >= self->_maximumValue) {
    double maximumValue = self->_maximumValue;
  }
  else {
    double maximumValue = value;
  }
  if (maximumValue != self->_value)
  {
    self->_value = maximumValue;
    id v4 = [(UIStepper *)self visualElement];
    [v4 setValue:maximumValue];
  }
}

- (void)setMinimumValue:(double)minimumValue
{
  if (self->_minimumValue != minimumValue)
  {
    if (self->_maximumValue < minimumValue) {
      [(UIStepper *)self setMaximumValue:minimumValue];
    }
    self->_minimumValue = minimumValue;
    double value = self->_value;
    if (value < minimumValue) {
      double value = minimumValue;
    }
    [(UIStepper *)self setValue:value];
    id v6 = [(UIStepper *)self visualElement];
    [v6 setMinimumValue:minimumValue];
  }
}

- (void)setMaximumValue:(double)maximumValue
{
  if (self->_maximumValue != maximumValue)
  {
    if (self->_minimumValue > maximumValue) {
      [(UIStepper *)self setMinimumValue:maximumValue];
    }
    self->_double maximumValue = maximumValue;
    double value = self->_value;
    if (value >= maximumValue) {
      double value = maximumValue;
    }
    [(UIStepper *)self setValue:value];
    id v6 = [(UIStepper *)self visualElement];
    [v6 setMaximumValue:maximumValue];
  }
}

- (void)setStepValue:(double)stepValue
{
  if (self->_stepValue != stepValue)
  {
    if (stepValue <= 0.0) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"stepValue must be greater than 0"];
    }
    self->_stepValue = stepValue;
    id v5 = [(UIStepper *)self visualElement];
    [v5 setStepValue:stepValue];
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIControl *)self isEnabled] != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)UIStepper;
    [(UIControl *)&v6 setEnabled:v3];
    id v5 = [(UIStepper *)self visualElement];
    [v5 setEnabled:v3];
  }
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth
{
  return 1;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  objc_super v6 = [(UIStepper *)self visualElement];
  double v7 = v6;
  if (v6) {
    objc_msgSend(v6, "sizeThatFits:forControl:", self, width, height);
  }
  else {
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_fallbackVisualElementClass"), "initialSize");
  }
  double v10 = v8;
  double v11 = v9;

  double v12 = v10;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  objc_super v6 = [(UIStepper *)self visualElement];
  double v7 = v6;
  if (v6) {
    objc_msgSend(v6, "intrinsicSizeWithinSize:forControl:", self, width, height);
  }
  else {
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_fallbackVisualElementClass"), "initialIntrinsicSize");
  }
  double v10 = v8;
  double v11 = v9;

  double v12 = v10;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  BOOL v3 = [(UIStepper *)self visualElement];
  id v4 = v3;
  if (v3) {
    [v3 alignmentRectInsetsForControl:self];
  }
  else {
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_fallbackVisualElementClass"), "initialAlignmentRectInsets");
  }
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;

  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)setContinuous:(BOOL)continuous
{
  if (self->_continuous != continuous)
  {
    BOOL v3 = continuous;
    self->_continuous = continuous;
    id v4 = [(UIStepper *)self visualElement];
    [v4 setContinuous:v3];
  }
}

- (void)setAutorepeat:(BOOL)autorepeat
{
  if (self->_autorepeat != autorepeat)
  {
    BOOL v3 = autorepeat;
    self->_autorepeat = autorepeat;
    id v4 = [(UIStepper *)self visualElement];
    [v4 setAutorepeat:v3];
  }
}

- (void)setWraps:(BOOL)wraps
{
  if (self->_wraps != wraps)
  {
    BOOL v3 = wraps;
    self->_wraps = wraps;
    id v4 = [(UIStepper *)self visualElement];
    [v4 setWraps:v3];
  }
}

- (UIStepper)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIStepper;
  double v5 = [(UIControl *)&v12 initWithCoder:v4];
  double v6 = v5;
  if (v5)
  {
    [(UIStepper *)v5 _commonStepperInit];
    if ([v4 containsValueForKey:@"UIValue"])
    {
      [v4 decodeDoubleForKey:@"UIValue"];
      v6->_double value = v7;
    }
    if ([v4 containsValueForKey:@"UIMinimumValue"])
    {
      [v4 decodeDoubleForKey:@"UIMinimumValue"];
      v6->_minimumValue = v8;
    }
    if ([v4 containsValueForKey:@"UIMaximumValue"])
    {
      [v4 decodeDoubleForKey:@"UIMaximumValue"];
      v6->_double maximumValue = v9;
    }
    if ([v4 containsValueForKey:@"UIStepValue"])
    {
      [v4 decodeDoubleForKey:@"UIStepValue"];
      v6->_stepValue = v10;
    }
    if ([v4 containsValueForKey:@"UIContinuous"]) {
      v6->_continuous = [v4 decodeBoolForKey:@"UIContinuous"];
    }
    if ([v4 containsValueForKey:@"UIAutorepeat"]) {
      v6->_autorepeat = [v4 decodeBoolForKey:@"UIAutorepeat"];
    }
    if ([v4 containsValueForKey:@"UIWraps"]) {
      v6->_wraps = [v4 decodeBoolForKey:@"UIWraps"];
    }
    [(UIStepper *)v6 _refreshVisualElement];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIStepper;
  [(UIControl *)&v5 encodeWithCoder:v4];
  if (self->_value != 0.0) {
    objc_msgSend(v4, "encodeDouble:forKey:", @"UIValue");
  }
  if (self->_minimumValue != 0.0) {
    objc_msgSend(v4, "encodeDouble:forKey:", @"UIMinimumValue");
  }
  if (self->_maximumValue != 100.0) {
    objc_msgSend(v4, "encodeDouble:forKey:", @"UIMaximumValue");
  }
  if (self->_stepValue != 1.0) {
    objc_msgSend(v4, "encodeDouble:forKey:", @"UIStepValue");
  }
  if (!self->_continuous) {
    [v4 encodeBool:0 forKey:@"UIContinuous"];
  }
  if (!self->_autorepeat) {
    [v4 encodeBool:0 forKey:@"UIAutorepeat"];
  }
  if (self->_wraps) {
    [v4 encodeBool:1 forKey:@"UIWraps"];
  }
}

- (void)_commonStepperInit
{
  self->_double maximumValue = 100.0;
  self->_stepValue = 1.0;
  self->_continuous = 1;
  self->_autorepeat = 1;
  BOOL v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  dividerImages = self->_dividerImages;
  self->_dividerImages = v3;

  objc_super v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  backgroundImages = self->_backgroundImages;
  self->_backgroundImages = v5;

  double v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  incrementImages = self->_incrementImages;
  self->_incrementImages = v7;

  double v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  decrementImages = self->_decrementImages;
  self->_decrementImages = v9;
}

+ (void)_registerVisualElementClass:(Class)a3 forIdiom:(int64_t)a4
{
  double v6 = (void *)__stepperIdiomsToVisualElementClasses;
  if (!__stepperIdiomsToVisualElementClasses)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    double v8 = (void *)__stepperIdiomsToVisualElementClasses;
    __stepperIdiomsToVisualElementClasses = v7;

    double v6 = (void *)__stepperIdiomsToVisualElementClasses;
  }
  id v9 = [NSNumber numberWithInteger:a4];
  [v6 setObject:a3 forKey:v9];
}

+ (Class)_fallbackVisualElementClass
{
  v2 = objc_opt_class();
  BOOL v3 = +[UITraitCollection _fallbackTraitCollection]();
  id v4 = [v2 visualElementClassForTraitCollection:v3];

  return (Class)v4;
}

+ (Class)visualElementClassForTraitCollection:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  objc_super v5 = (void *)__stepperIdiomsToVisualElementClasses;
  if (__stepperIdiomsToVisualElementClasses
    && (objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "userInterfaceIdiom")),
        double v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = (void *)[v5 objectForKeyedSubscript:v6],
        v6,
        v7))
  {
    id v8 = v7;
  }
  else
  {
    self;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v9 = v8;

  return (Class)v9;
}

+ (id)visualElementForTraitCollection:(id)a3
{
  id v3 = [a1 visualElementClassForTraitCollection:a3];
  id v4 = objc_msgSend((id)objc_msgSend(v3, "alloc"), "init");

  return v4;
}

- (void)_refreshVisualElement
{
  id v3 = [(UIView *)self traitCollection];
  [(UIStepper *)self _refreshVisualElementForTraitCollection:v3 populatingAPIProperties:0];
}

- (void)_refreshVisualElementForTraitCollection:(id)a3 populatingAPIProperties:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() visualElementForTraitCollection:v7];

  if (!v8)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"UIStepper.m" lineNumber:314 description:@"Nil UIStepper visual element"];
  }
  id v9 = [(UIStepper *)self visualElement];
  [v9 removeFromSuperview];

  double v10 = [(UIStepper *)self visualElement];
  [v10 setStepperControl:0];

  [(UIStepper *)self setVisualElement:v8];
  [v8 setStepperControl:self];
  [(UIView *)self addSubview:v8];
  [(UIView *)self invalidateIntrinsicContentSize];
  [(UIView *)self setNeedsLayout];
  [(UIView *)self setNeedsDisplay];
  objc_msgSend(v8, "setEnabled:", -[UIControl isEnabled](self, "isEnabled"));
  [(UIStepper *)self minimumValue];
  objc_msgSend(v8, "setMinimumValue:");
  [(UIStepper *)self maximumValue];
  objc_msgSend(v8, "setMaximumValue:");
  [(UIStepper *)self value];
  objc_msgSend(v8, "setValue:");
  [(UIStepper *)self stepValue];
  objc_msgSend(v8, "setStepValue:");
  objc_msgSend(v8, "setContinuous:", -[UIStepper isContinuous](self, "isContinuous"));
  objc_msgSend(v8, "setWraps:", -[UIStepper wraps](self, "wraps"));
  objc_msgSend(v8, "setAutorepeat:", -[UIStepper autorepeat](self, "autorepeat"));
  if (v4)
  {
    double v11 = [(UIView *)self tintColor];
    [v8 setTintColor:v11];
  }
  dividerImages = self->_dividerImages;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __77__UIStepper__refreshVisualElementForTraitCollection_populatingAPIProperties___block_invoke;
  v27[3] = &unk_1E52EB1A0;
  id v13 = v8;
  id v28 = v13;
  [(NSMutableDictionary *)dividerImages enumerateKeysAndObjectsUsingBlock:v27];
  incrementImages = self->_incrementImages;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __77__UIStepper__refreshVisualElementForTraitCollection_populatingAPIProperties___block_invoke_2;
  v25[3] = &unk_1E52EB1C8;
  id v15 = v13;
  id v26 = v15;
  [(NSMutableDictionary *)incrementImages enumerateKeysAndObjectsUsingBlock:v25];
  decrementImages = self->_decrementImages;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __77__UIStepper__refreshVisualElementForTraitCollection_populatingAPIProperties___block_invoke_3;
  v23[3] = &unk_1E52EB1C8;
  id v17 = v15;
  id v24 = v17;
  [(NSMutableDictionary *)decrementImages enumerateKeysAndObjectsUsingBlock:v23];
  backgroundImages = self->_backgroundImages;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __77__UIStepper__refreshVisualElementForTraitCollection_populatingAPIProperties___block_invoke_4;
  v21[3] = &unk_1E52EB1C8;
  id v22 = v17;
  id v19 = v17;
  [(NSMutableDictionary *)backgroundImages enumerateKeysAndObjectsUsingBlock:v21];
}

void __77__UIStepper__refreshVisualElementForTraitCollection_populatingAPIProperties___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  id v5 = a3;
  [a2 getValue:&v6 size:16];
  [*(id *)(a1 + 32) setDividerImage:v5 forLeftSegmentState:v6 rightSegmentState:v7];
}

void __77__UIStepper__refreshVisualElementForTraitCollection_populatingAPIProperties___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = a3;
  objc_msgSend(v4, "setIncrementImage:forState:", v5, objc_msgSend(a2, "unsignedIntegerValue"));
}

void __77__UIStepper__refreshVisualElementForTraitCollection_populatingAPIProperties___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = a3;
  objc_msgSend(v4, "setDecrementImage:forState:", v5, objc_msgSend(a2, "unsignedIntegerValue"));
}

void __77__UIStepper__refreshVisualElementForTraitCollection_populatingAPIProperties___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = a3;
  objc_msgSend(v4, "setBackgroundImage:forState:", v5, objc_msgSend(a2, "unsignedIntegerValue"));
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)UIStepper;
  -[UIControl hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  id v5 = (UIStepper *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [(UIStepper *)self visualElement];

  if (v5 == v6) {
    uint64_t v7 = self;
  }
  else {
    uint64_t v7 = v5;
  }
  id v8 = v7;

  return v8;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UIStepper *)self visualElement];
  char v9 = [v8 beginTrackingWithTouch:v7 withEvent:v6];

  return v9;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UIStepper *)self visualElement];
  char v9 = [v8 continueTrackingWithTouch:v7 withEvent:v6];

  return v9;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UIStepper *)self visualElement];
  [v8 endTrackingWithTouch:v7 withEvent:v6];
}

- (void)cancelTrackingWithEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(UIStepper *)self visualElement];
  [v5 cancelTrackingWithEvent:v4];
}

- (void)visualElementDidSetValue:(id)a3
{
  [a3 value];
  self->_double value = v4;
}

- (void)_emitValueChanged
{
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 4096;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(UIStepper *)self visualElement];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = [(UIStepper *)self visualElement];
    double v14 = [v13 pointerInteraction:v8 regionForRequest:v9 defaultRegion:v10];
  }
  else
  {
    double v14 = 0;
  }

  return v14;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UIStepper *)self visualElement];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(UIStepper *)self visualElement];
    double v11 = [v10 pointerInteraction:v6 styleForRegion:v7];
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(UIStepper *)self visualElement];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    char v12 = [(UIStepper *)self visualElement];
    [v12 pointerInteraction:v13 willEnterRegion:v8 animator:v9];
  }
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(UIStepper *)self visualElement];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    char v12 = [(UIStepper *)self visualElement];
    [v12 pointerInteraction:v13 willExitRegion:v8 animator:v9];
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [v4 view];
  BOOL v6 = v5 == self
    || ![v4 _isGestureType:0]
    || [v4 numberOfTouchesRequired] != 1
    || [v4 numberOfTapsRequired] != 1;

  return v6;
}

- (void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state
{
  backgroundImages = self->_backgroundImages;
  id v7 = NSNumber;
  id v8 = image;
  id v9 = [v7 numberWithUnsignedInteger:state];
  [(NSMutableDictionary *)backgroundImages setObject:v8 forKeyedSubscript:v9];

  id v10 = [(UIStepper *)self visualElement];
  [v10 setBackgroundImage:v8 forState:state];
}

- (UIImage)backgroundImageForState:(UIControlState)state
{
  id v4 = [(UIStepper *)self visualElement];
  id v5 = [v4 backgroundImageForState:state];

  return (UIImage *)v5;
}

- (void)setDividerImage:(UIImage *)image forLeftSegmentState:(UIControlState)leftState rightSegmentState:(UIControlState)rightState
{
  dividerImages = self->_dividerImages;
  UIControlState v13 = leftState;
  UIControlState v14 = rightState;
  id v9 = (void *)MEMORY[0x1E4F29238];
  id v10 = image;
  char v11 = [v9 valueWithBytes:&v13 objCType:"{?=QQ}"];
  -[NSMutableDictionary setObject:forKeyedSubscript:](dividerImages, "setObject:forKeyedSubscript:", v10, v11, v13, v14);

  char v12 = [(UIStepper *)self visualElement];
  [v12 setDividerImage:v10 forLeftSegmentState:leftState rightSegmentState:rightState];
}

- (UIImage)dividerImageForLeftSegmentState:(UIControlState)state rightSegmentState:(UIControlState)a4
{
  BOOL v6 = [(UIStepper *)self visualElement];
  id v7 = [v6 dividerImageForLeftSegmentState:state rightSegmentState:a4];

  return (UIImage *)v7;
}

- (void)setIncrementImage:(UIImage *)image forState:(UIControlState)state
{
  incrementImages = self->_incrementImages;
  id v7 = NSNumber;
  id v8 = image;
  id v9 = [v7 numberWithUnsignedInteger:state];
  [(NSMutableDictionary *)incrementImages setObject:v8 forKeyedSubscript:v9];

  id v10 = [(UIStepper *)self visualElement];
  [v10 setIncrementImage:v8 forState:state];
}

- (UIImage)incrementImageForState:(UIControlState)state
{
  id v4 = [(UIStepper *)self visualElement];
  id v5 = [v4 incrementImageForState:state];

  return (UIImage *)v5;
}

- (void)setDecrementImage:(UIImage *)image forState:(UIControlState)state
{
  decrementImages = self->_decrementImages;
  id v7 = NSNumber;
  id v8 = image;
  id v9 = [v7 numberWithUnsignedInteger:state];
  [(NSMutableDictionary *)decrementImages setObject:v8 forKeyedSubscript:v9];

  id v10 = [(UIStepper *)self visualElement];
  [v10 setDecrementImage:v8 forState:state];
}

- (UIImage)decrementImageForState:(UIControlState)state
{
  id v4 = [(UIStepper *)self visualElement];
  id v5 = [v4 decrementImageForState:state];

  return (UIImage *)v5;
}

- (void)setTintColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIStepper;
  id v4 = a3;
  [(UIView *)&v6 setTintColor:v4];
  id v5 = [(UIStepper *)self visualElement];
  [v5 setTintColor:v4];
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)UIStepper;
  [(UIView *)&v4 tintColorDidChange];
  id v3 = [(UIStepper *)self visualElement];
  [v3 tintColorDidChange];
}

- (double)value
{
  return self->_value;
}

- (double)minimumValue
{
  return self->_minimumValue;
}

- (double)maximumValue
{
  return self->_maximumValue;
}

- (double)stepValue
{
  return self->_stepValue;
}

- (BOOL)isContinuous
{
  return self->_continuous;
}

- (BOOL)autorepeat
{
  return self->_autorepeat;
}

- (BOOL)wraps
{
  return self->_wraps;
}

- (UIStepperVisualElement)visualElement
{
  return self->_visualElement;
}

- (void)setVisualElement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualElement, 0);
  objc_storeStrong((id *)&self->_backgroundImages, 0);
  objc_storeStrong((id *)&self->_decrementImages, 0);
  objc_storeStrong((id *)&self->_incrementImages, 0);
  objc_storeStrong((id *)&self->_dividerImages, 0);
}

+ (void)_setAllowsUnsupportedMacIdiomBehavior:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  _UnsupportedFlags_0 = _UnsupportedFlags_0 & 0xFD | v3;
}

+ (BOOL)_allowsUnsupportedMacIdiomBehavior
{
  return (_UnsupportedFlags_0 >> 1) & 1;
}

@end