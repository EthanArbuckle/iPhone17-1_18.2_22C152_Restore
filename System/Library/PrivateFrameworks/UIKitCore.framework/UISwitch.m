@interface UISwitch
+ (BOOL)_allowsUnsupportedMacIdiomBehavior;
+ (id)visualElementForTraitCollection:(id)a3;
+ (void)_setAllowsUnsupportedMacIdiomBehavior:(BOOL)a3;
+ (void)setVisualElementProvider:(id)a3;
- (BOOL)_alwaysShowOnOffLabel;
- (BOOL)_isFixedSize;
- (BOOL)_shouldShowOnOffLabels;
- (BOOL)isAccessibilityElementByDefault;
- (BOOL)isElementAccessibilityExposedToInterfaceBuilder;
- (BOOL)isOn;
- (BOOL)pointMostlyInside:(CGPoint)a3;
- (CGPoint)accessibilityActivationPoint;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (NSString)title;
- (UIColor)onTintColor;
- (UIColor)thumbTintColor;
- (UIColor)tintColor;
- (UIEdgeInsets)alignmentRectInsets;
- (UIImage)offImage;
- (UIImage)onImage;
- (UIImpactFeedbackGenerator)_impactFeedbackGenerator;
- (UISwitch)init;
- (UISwitch)initWithCoder:(NSCoder *)coder;
- (UISwitch)initWithFrame:(CGRect)frame;
- (UISwitchStyle)preferredStyle;
- (UISwitchStyle)style;
- (UISwitchVisualElement)visualElement;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)switchStyle;
- (unint64_t)_controlEventsForActionTriggered;
- (unint64_t)defaultAccessibilityTraits;
- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3;
- (void)_populateArchivedSubviews:(id)a3;
- (void)_refreshVisualElement;
- (void)_refreshVisualElementForTraitCollection:(id)a3 populatingAPIProperties:(BOOL)a4;
- (void)_setAlwaysShowsOnOffLabel:(BOOL)a3;
- (void)_setImpactFeedbackGenerator:(id)a3;
- (void)_setStyle:(int64_t)a3;
- (void)_showingOnOffLabelChanged;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)setEnabled:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setOffImage:(UIImage *)offImage;
- (void)setOn:(BOOL)a3 animated:(BOOL)a4 notifyingVisualElement:(BOOL)a5;
- (void)setOn:(BOOL)on;
- (void)setOn:(BOOL)on animated:(BOOL)animated;
- (void)setOnImage:(UIImage *)onImage;
- (void)setOnTintColor:(UIColor *)onTintColor;
- (void)setPreferredStyle:(UISwitchStyle)preferredStyle;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setThumbTintColor:(UIColor *)thumbTintColor;
- (void)setTintColor:(id)a3;
- (void)setTitle:(NSString *)title;
- (void)setVisualElement:(id)a3;
- (void)tintColorDidChange;
- (void)visualElement:(id)a3 transitionedToOn:(BOOL)a4;
- (void)visualElementHadTouchUpInside:(id)a3;
@end

@implementation UISwitch

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UISwitch;
  -[UIView setSemanticContentAttribute:](&v6, sel_setSemanticContentAttribute_);
  v5 = [(UISwitch *)self visualElement];
  [v5 setSemanticContentAttribute:a3];
}

- (void)setOn:(BOOL)on animated:(BOOL)animated
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualElement, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_offImage, 0);
  objc_storeStrong((id *)&self->_onImage, 0);
  objc_storeStrong((id *)&self->_thumbTintColor, 0);
  objc_storeStrong((id *)&self->_onTintColor, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (UISwitch)initWithFrame:(CGRect)frame
{
  v5.receiver = self;
  v5.super_class = (Class)UISwitch;
  v3 = -[UIControl initWithFrame:](&v5, sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
  _UISwitchCommonInit(v3);
  return v3;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
  id v5 = a3;
  id v6 = [(UISwitch *)self visualElement];
  [v6 setTintColor:v5];
}

- (void)setOnTintColor:(UIColor *)onTintColor
{
  objc_storeStrong((id *)&self->_onTintColor, onTintColor);
  id v5 = onTintColor;
  id v6 = [(UISwitch *)self visualElement];
  [v6 setOnTintColor:v5];
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)UISwitch;
  [(UIView *)&v4 tintColorDidChange];
  v3 = [(UISwitch *)self visualElement];
  [v3 tintColorDidChange];
}

+ (id)visualElementForTraitCollection:(id)a3
{
  uint64_t v5 = [a3 userInterfaceIdiom];
  id v6 = 0;
  switch(v5)
  {
    case -1:
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      v9 = v8;
      v10 = @"UISwitch attempted to be initialized or updated with a trait collection containing UIUserInterfaceIdiomUnspecified.";
      SEL v11 = a2;
      id v12 = a1;
      uint64_t v13 = 229;
      goto LABEL_5;
    case 0:
    case 1:
    case 5:
    case 8:
      v7 = UISwitchModernVisualElement;
      goto LABEL_7;
    case 2:
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      v9 = v8;
      v10 = @"UISwitch cannot be used on tvOS.";
      SEL v11 = a2;
      id v12 = a1;
      uint64_t v13 = 226;
LABEL_5:
      [v8 handleFailureInMethod:v11 object:v12 file:@"UISwitch.m" lineNumber:v13 description:v10];

      id v6 = 0;
      break;
    case 3:
      v7 = UISwitchCarPlayVisualElement;
LABEL_7:
      id v6 = objc_alloc_init(v7);
      break;
    default:
      break;
  }
  return v6;
}

- (void)_refreshVisualElementForTraitCollection:(id)a3 populatingAPIProperties:(BOOL)a4
{
  BOOL v4 = a4;
  v8 = (UISwitch *)__visualElementProvider;
  if (!__visualElementProvider) {
    v8 = self;
  }
  v24 = v8;
  id v9 = a3;
  v10 = objc_opt_class();
  UISwitchStyle v11 = [(UISwitch *)self style];
  if (objc_opt_respondsToSelector()) {
    [v10 visualElementForTraitCollection:v9 style:v11];
  }
  else {
  id v12 = [v10 visualElementForTraitCollection:v9];
  }

  if (!v12)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    v23 = [(UIView *)v24 description];
    [v22 handleFailureInMethod:a2, self, @"UISwitch.m", 254, @"Nil UISwitch visual element provided by %@", v23 object file lineNumber description];
  }
  uint64_t v13 = [(UISwitch *)self visualElement];
  [v13 removeFromSuperview];

  v14 = [(UISwitch *)self visualElement];
  [v14 setSwitchControl:0];

  [(UISwitch *)self setVisualElement:0];
  [(UISwitch *)self setVisualElement:v12];
  v15 = [(UISwitch *)self visualElement];
  [v15 setSwitchControl:self];

  if ([(UISwitch *)self _isFixedSize])
  {
    [(UIView *)self frame];
    v16 = self;
  }
  else
  {
    [(UIView *)v12 setAutoresizingMask:18];
    [(UIView *)self bounds];
    v16 = v12;
  }
  -[UISwitch setFrame:](v16, "setFrame:");
  [(UIView *)self invalidateIntrinsicContentSize];
  [(UIView *)self addSubview:v12];
  [(UISwitch *)v12 setOn:[(UISwitch *)self isOn] animated:0];
  [(UISwitch *)v12 setShowsOnOffLabel:[(UISwitch *)self _shouldShowOnOffLabels]];
  [(UISwitch *)v12 setEnabled:[(UIControl *)self isEnabled]];
  [(UISwitch *)v12 setSemanticContentAttribute:[(UIView *)self semanticContentAttribute]];
  if (v4)
  {
    v17 = [(UISwitch *)self onImage];
    [(UISwitch *)v12 setOnImage:v17];

    v18 = [(UISwitch *)self offImage];
    [(UISwitch *)v12 setOffImage:v18];

    v19 = [(UISwitch *)self tintColor];
    [(UISwitch *)v12 setTintColor:v19];

    v20 = [(UISwitch *)self onTintColor];
    [(UISwitch *)v12 setOnTintColor:v20];

    v21 = [(UISwitch *)self thumbTintColor];
    [(UISwitch *)v12 setThumbTintColor:v21];
  }
}

- (void)setVisualElement:(id)a3
{
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(UISwitch *)self _isFixedSize])
  {
    -[UISwitch sizeThatFits:](self, "sizeThatFits:", width, height);
    double width = v8;
    double height = v9;
  }
  v10.receiver = self;
  v10.super_class = (Class)UISwitch;
  -[UIView setFrame:](&v10, sel_setFrame_, x, y, width, height);
}

- (UIEdgeInsets)alignmentRectInsets
{
  v3 = [(UISwitch *)self visualElement];
  BOOL v4 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = objc_opt_class();
    if ([(UISwitch *)self _isFixedSize]) {
      [v6 preferredAlignmentRectInsets];
    }
    else {
      [v3 alignmentRectInsets];
    }
    double v12 = v7;
    double v13 = v8;
    double v14 = v9;
    double v11 = v10;
  }
  else
  {
    double v11 = 2.0;
    double v12 = 0.0;
    double v13 = 0.0;
    double v14 = 0.0;
  }

  double v15 = v12;
  double v16 = v13;
  double v17 = v14;
  double v18 = v11;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(UISwitch *)self visualElement];
  double v7 = objc_opt_class();
  if ([(UISwitch *)self _isFixedSize]) {
    [v7 preferredContentSize];
  }
  else {
    objc_msgSend(v6, "_intrinsicSizeWithinSize:", width, height);
  }
  double v10 = v8;
  double v11 = v9;

  double v12 = v10;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (BOOL)_isFixedSize
{
  v2 = [(UISwitch *)self visualElement];
  v3 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    char v5 = [(id)objc_opt_class() isFixedSize];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (UISwitchVisualElement)visualElement
{
  return self->_visualElement;
}

- (UISwitchStyle)style
{
  return self->_style;
}

- (UISwitchStyle)preferredStyle
{
  return self->_preferredStyle;
}

- (BOOL)isOn
{
  return self->_on;
}

- (BOOL)_shouldShowOnOffLabels
{
  return [(UISwitch *)self _alwaysShowOnOffLabel]
      || _AXSIncreaseButtonLegibility() != 0;
}

- (BOOL)_alwaysShowOnOffLabel
{
  return self->_alwaysShowOnOffLabel;
}

- (UISwitch)init
{
  return -[UISwitch initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIAccessibilityOnOffSwitchLabelsDidChangeNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)UISwitch;
  [(UIView *)&v4 dealloc];
}

- (void)setOn:(BOOL)a3 animated:(BOOL)a4 notifyingVisualElement:(BOOL)a5
{
  if (self->_on != a3)
  {
    BOOL v5 = a3;
    self->_on = a3;
    if (a5)
    {
      BOOL v6 = a4;
      id v7 = [(UISwitch *)self visualElement];
      [v7 setOn:v5 animated:v6];
    }
  }
}

- (UIColor)onTintColor
{
  return self->_onTintColor;
}

- (void)_setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(UISwitch *)self _refreshVisualElement];
  }
}

- (void)setPreferredStyle:(UISwitchStyle)preferredStyle
{
  if (self->_preferredStyle != preferredStyle)
  {
    self->_preferredStyle = preferredStyle;
    objc_super v4 = [(UIView *)self traitCollection];
    [v4 userInterfaceIdiom];

    [(UISwitch *)self _setStyle:2];
  }
}

- (BOOL)isAccessibilityElementByDefault
{
  return 1;
}

- (unint64_t)defaultAccessibilityTraits
{
  return 1;
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 1;
}

- (UISwitch)initWithCoder:(NSCoder *)coder
{
  objc_super v4 = coder;
  v12.receiver = self;
  v12.super_class = (Class)UISwitch;
  BOOL v5 = [(UIControl *)&v12 initWithCoder:v4];
  if (v5)
  {
    v5->_preferredStyle = [(NSCoder *)v4 decodeIntegerForKey:@"UISwitchStyle"];
    _UISwitchCommonInit(v5);
    [(UISwitch *)v5 setEnabled:[(NSCoder *)v4 decodeBoolForKey:@"UISwitchEnabled"]];
    [(UISwitch *)v5 setOn:[(NSCoder *)v4 decodeBoolForKey:@"UISwitchOn"]];
    if ([(NSCoder *)v4 containsValueForKey:@"UISwitchOnTintColor"])
    {
      BOOL v6 = [(NSCoder *)v4 decodeObjectForKey:@"UISwitchOnTintColor"];
      [(UISwitch *)v5 setOnTintColor:v6];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UISwitchTintColor"])
    {
      id v7 = [(NSCoder *)v4 decodeObjectForKey:@"UISwitchTintColor"];
      [(UISwitch *)v5 setTintColor:v7];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UISwitchThumbTintColor"])
    {
      double v8 = [(NSCoder *)v4 decodeObjectForKey:@"UISwitchThumbTintColor"];
      [(UISwitch *)v5 setThumbTintColor:v8];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UISwitchOnImage"])
    {
      double v9 = [(NSCoder *)v4 decodeObjectForKey:@"UISwitchOnImage"];
      [(UISwitch *)v5 setOnImage:v9];
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UISwitchOffImage"])
    {
      double v10 = [(NSCoder *)v4 decodeObjectForKey:@"UISwitchOffImage"];
      [(UISwitch *)v5 setOffImage:v10];
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UISwitch;
  [(UIControl *)&v15 encodeWithCoder:v4];
  if ([(UIControl *)self isEnabled]) {
    objc_msgSend(v4, "encodeBool:forKey:", -[UIControl isEnabled](self, "isEnabled"), @"UISwitchEnabled");
  }
  if ([(UISwitch *)self isOn]) {
    objc_msgSend(v4, "encodeBool:forKey:", -[UISwitch isOn](self, "isOn"), @"UISwitchOn");
  }
  BOOL v5 = [(UISwitch *)self onTintColor];

  if (v5)
  {
    BOOL v6 = [(UISwitch *)self onTintColor];
    [v4 encodeObject:v6 forKey:@"UISwitchOnTintColor"];
  }
  id v7 = [(UISwitch *)self tintColor];

  if (v7)
  {
    double v8 = [(UISwitch *)self tintColor];
    [v4 encodeObject:v8 forKey:@"UISwitchTintColor"];
  }
  double v9 = [(UISwitch *)self thumbTintColor];

  if (v9)
  {
    double v10 = [(UISwitch *)self thumbTintColor];
    [v4 encodeObject:v10 forKey:@"UISwitchThumbTintColor"];
  }
  double v11 = [(UISwitch *)self onImage];

  if (v11)
  {
    objc_super v12 = [(UISwitch *)self onImage];
    [v4 encodeObject:v12 forKey:@"UISwitchOnImage"];
  }
  double v13 = [(UISwitch *)self offImage];

  if (v13)
  {
    double v14 = [(UISwitch *)self offImage];
    [v4 encodeObject:v14 forKey:@"UISwitchOffImage"];
  }
  if ([(UISwitch *)self preferredStyle]) {
    [v4 encodeInteger:self->_style forKey:@"UISwitchStyle"];
  }
}

- (void)_populateArchivedSubviews:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UISwitch;
  id v4 = a3;
  [(UIView *)&v6 _populateArchivedSubviews:v4];
  BOOL v5 = [(UISwitch *)self visualElement];
  [v4 removeObject:v5];
}

+ (void)setVisualElementProvider:(id)a3
{
}

- (void)_refreshVisualElement
{
  id v3 = [(UIView *)self traitCollection];
  [(UISwitch *)self _refreshVisualElementForTraitCollection:v3 populatingAPIProperties:1];
}

- (void)visualElement:(id)a3 transitionedToOn:(BOOL)a4
{
  [(UISwitch *)self setOn:a4 animated:0 notifyingVisualElement:0];
  [(UIControl *)self sendActionsForControlEvents:4096];
}

- (void)visualElementHadTouchUpInside:(id)a3
{
}

- (BOOL)pointMostlyInside:(CGPoint)a3
{
  return -[UIControl pointMostlyInside:withEvent:](self, "pointMostlyInside:withEvent:", 0, a3.x, a3.y);
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  if (![(UISwitch *)self _isFixedSize])
  {
    [(UIView *)self invalidateIntrinsicContentSize];
  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(UISwitch *)self visualElement];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    double v13 = [(UISwitch *)self visualElement];
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
  id v8 = [(UISwitch *)self visualElement];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(UISwitch *)self visualElement];
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
  id v10 = [(UISwitch *)self visualElement];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    char v12 = [(UISwitch *)self visualElement];
    [v12 pointerInteraction:v13 willEnterRegion:v8 animator:v9];
  }
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(UISwitch *)self visualElement];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    char v12 = [(UISwitch *)self visualElement];
    [v12 pointerInteraction:v13 willExitRegion:v8 animator:v9];
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UISwitch;
  -[UIControl setEnabled:](&v6, sel_setEnabled_);
  BOOL v5 = [(UISwitch *)self visualElement];
  [v5 setEnabled:v3];
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 4096;
}

- (void)setOn:(BOOL)on
{
}

- (void)setThumbTintColor:(UIColor *)thumbTintColor
{
  objc_storeStrong((id *)&self->_thumbTintColor, thumbTintColor);
  BOOL v5 = thumbTintColor;
  id v6 = [(UISwitch *)self visualElement];
  [v6 setThumbTintColor:v5];
}

- (void)setOffImage:(UIImage *)offImage
{
  objc_storeStrong((id *)&self->_offImage, offImage);
  BOOL v5 = offImage;
  id v6 = [(UISwitch *)self visualElement];
  [v6 setOffImage:v5];
}

- (void)setOnImage:(UIImage *)onImage
{
  objc_storeStrong((id *)&self->_onImage, onImage);
  BOOL v5 = onImage;
  id v6 = [(UISwitch *)self visualElement];
  [v6 setOnImage:v5];
}

- (void)_setAlwaysShowsOnOffLabel:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(UISwitch *)self visualElement];
  [v5 setShowsOnOffLabel:v3];

  self->_alwaysShowOnOffLabel = v3;
}

- (void)_showingOnOffLabelChanged
{
  id v3 = [(UISwitch *)self visualElement];
  objc_msgSend(v3, "setShowsOnOffLabel:", -[UISwitch _shouldShowOnOffLabels](self, "_shouldShowOnOffLabels"));
}

- (void)setTitle:(NSString *)title
{
  id v4 = NSString;
  NSStringFromSelector(a2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = [v4 stringWithValidatedFormat:0x1ED17C2A0, @"%@ %@", 0, v8, v6 validFormatSpecifiers error];
  [(UIView *)self _throwForUnsupportedNonMacIdiomBehaviorWithReason:v7];
}

- (void)_setImpactFeedbackGenerator:(id)a3
{
  id v5 = a3;
  id v6 = [(UISwitch *)self visualElement];
  id v7 = [v6 impactFeedbackGenerator];
  int v8 = [v7 isActive];

  if (v8)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"UISwitch.m" lineNumber:539 description:@"Impact feedback behavior should not be changed while active."];
  }
  id v10 = [(UISwitch *)self visualElement];
  [v10 setImpactFeedbackGenerator:v5];
}

- (UIImpactFeedbackGenerator)_impactFeedbackGenerator
{
  v2 = [(UISwitch *)self visualElement];
  id v3 = [v2 impactFeedbackGenerator];

  return (UIImpactFeedbackGenerator *)v3;
}

- (CGPoint)accessibilityActivationPoint
{
  id v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 5
    && ([(UISwitch *)self visualElement],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    id v6 = [(UISwitch *)self visualElement];
    [v6 accessibilityActivationPoint];
    double v8 = v7;
    double v10 = v9;

    double v11 = v8;
    double v12 = v10;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)UISwitch;
    [&v13 accessibilityActivationPoint];
  }
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (UIColor)thumbTintColor
{
  return self->_thumbTintColor;
}

- (UIImage)onImage
{
  return self->_onImage;
}

- (UIImage)offImage
{
  return self->_offImage;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (int64_t)switchStyle
{
  return self->_switchStyle;
}

+ (void)_setAllowsUnsupportedMacIdiomBehavior:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  _UnsupportedFlags_0 = _UnsupportedFlags_0 & 0xEF | v3;
}

+ (BOOL)_allowsUnsupportedMacIdiomBehavior
{
  return (_UnsupportedFlags_0 >> 4) & 1;
}

@end