@interface UIAccessibilityElementSuperCategory
+ (BOOL)_isSerializableAccessibilityElement;
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsFKARunningForFocusItem;
- (BOOL)_accessibilityProvidesOwnFrame;
- (BOOL)_accessibilitySetNativeFocus;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)_accessibilitySupportsHandwriting;
- (BOOL)_accessibilityUsesFrameInContainerSpace;
- (BOOL)_accessibilityViewHierarchyHasNativeFocus;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3;
- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)accessibilityFrame;
- (UIAccessibilityElementSuperCategory)init;
- (UIAccessibilityElementSuperCategory)initWithAccessibilityContainer:(id)a3;
- (float)_accessibilityActivationDelay;
- (id)_accessibilityAutomaticIdentifier;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityLanguage;
- (id)accessibilityPath;
- (id)accessibilityValue;
- (id)description;
- (id)focusGroupIdentifier;
- (unint64_t)accessibilityTraits;
- (void)_accessibilitySetValue:(id)a3;
- (void)accessibilityDecrement;
- (void)accessibilityElementDidBecomeFocused;
- (void)accessibilityElementDidLoseFocus;
- (void)accessibilityIncrement;
- (void)dealloc;
@end

@implementation UIAccessibilityElementSuperCategory

+ (id)safeCategoryTargetClassName
{
  return @"UIAccessibilityElement";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIAccessibilityElement", @"initWithAccessibilityContainer:", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIAccessibilityElement", @"_destroyFocusLayer", "v", 0);
}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (UIAccessibilityElementSuperCategory)init
{
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Use initWithAccessibilityContainer:"];
  v4.receiver = self;
  v4.super_class = (Class)UIAccessibilityElementSuperCategory;

  return 0;
}

- (UIAccessibilityElementSuperCategory)initWithAccessibilityContainer:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UIAccessibilityElementSuperCategory;
  objc_super v4 = -[UIAccessibilityElementSuperCategory initWithAccessibilityContainer:](&v9, sel_initWithAccessibilityContainer_);
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (!a3)
  {
    v7 = [MEMORY[0x1E4F29060] callStackSymbols];
    NSLog(&cfstr_ErrorUiaccessi.isa, v7);

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"ERROR: UIAccessibilityElement initialized with nil container"];
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  v6 = v4;
LABEL_6:

  return v6;
}

- (void)dealloc
{
  [self _accessibilityUnregister];
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  v6 = __46__UIAccessibilityElementSuperCategory_dealloc__block_invoke;
  v7 = &unk_1E59B9300;
  v8 = self;
  AXPerformSafeBlock();
  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityElementSuperCategory;
  [(UIAccessibilityElementSuperCategory *)&v3 dealloc];
}

uint64_t __46__UIAccessibilityElementSuperCategory_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _destroyFocusLayer];
}

- (void)_accessibilitySetValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIAccessibilityElementSuperCategory *)self accessibilityDelegate];
  v6 = v5;
  if (v5)
  {
    [v5 _accessibilitySetValue:v4];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIAccessibilityElementSuperCategory;
    [&v7 _accessibilitySetValue:v4];
  }
}

- (void)accessibilityElementDidBecomeFocused
{
  objc_super v3 = [(UIAccessibilityElementSuperCategory *)self accessibilityDelegate];
  id v4 = v3;
  if (v3)
  {
    [v3 accessibilityElementDidBecomeFocused];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UIAccessibilityElementSuperCategory;
    [&v5 accessibilityElementDidBecomeFocused];
  }
}

- (void)accessibilityElementDidLoseFocus
{
  objc_super v3 = [(UIAccessibilityElementSuperCategory *)self accessibilityDelegate];
  id v4 = v3;
  if (v3)
  {
    [v3 accessibilityElementDidLoseFocus];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UIAccessibilityElementSuperCategory;
    [&v5 accessibilityElementDidLoseFocus];
  }
}

- (BOOL)accessibilityActivate
{
  objc_super v3 = [(UIAccessibilityElementSuperCategory *)self accessibilityDelegate];
  id v4 = v3;
  if (v3)
  {
    unsigned __int8 v5 = [v3 accessibilityActivate];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIAccessibilityElementSuperCategory;
    unsigned __int8 v5 = [(UIAccessibilityElementSuperCategory *)&v8 accessibilityActivate];
  }
  BOOL v6 = v5;

  return v6;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  objc_super v3 = [(UIAccessibilityElementSuperCategory *)self accessibilityDelegate];
  id v4 = v3;
  if (v3)
  {
    char v5 = [v3 _accessibilitySupportsActivateAction];
  }
  else
  {
    if (!_accessibilitySupportsActivateAction_BaseActivateAction)
    {
      BOOL v6 = (objc_class *)objc_opt_class();
      _accessibilitySupportsActivateAction_BaseActivateAction = (uint64_t)class_getInstanceMethod(v6, sel_accessibilityActivate);
    }
    objc_super v7 = (objc_class *)objc_opt_class();
    if (class_getInstanceMethod(v7, sel_accessibilityActivate) == (Method)_accessibilitySupportsActivateAction_BaseActivateAction)
    {
      objc_super v8 = [self _accessibilityGetBlockForAttribute:17];
      char v5 = v8 != 0;
    }
    else
    {
      char v5 = 1;
    }
  }

  return v5;
}

- (float)_accessibilityActivationDelay
{
  objc_super v3 = [(UIAccessibilityElementSuperCategory *)self accessibilityDelegate];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v3 _accessibilityActivationDelay:self];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIAccessibilityElementSuperCategory;
    [&v7 _accessibilityActivationDelay];
  }
  float v5 = v4;

  return v5;
}

- (CGPoint)accessibilityActivationPoint
{
  objc_super v3 = [(UIAccessibilityElementSuperCategory *)self accessibilityDelegate];
  if (v3)
  {
    if (objc_opt_respondsToSelector()) {
      [v3 accessibilityActivationPoint:self];
    }
    else {
      [v3 accessibilityActivationPoint];
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIAccessibilityElementSuperCategory;
    [(UIAccessibilityElementSuperCategory *)&v10 accessibilityActivationPoint];
  }
  double v6 = v4;
  double v7 = v5;

  double v8 = v6;
  double v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (BOOL)isAccessibilityElement
{
  v6.receiver = self;
  v6.super_class = (Class)UIAccessibilityElementSuperCategory;
  unsigned __int8 v3 = [(UIAccessibilityElementSuperCategory *)&v6 isAccessibilityElement];
  double v4 = [(UIAccessibilityElementSuperCategory *)self accessibilityDelegate];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    unsigned __int8 v3 = [v4 isAccessibilityElement:self];
  }

  return v3;
}

- (id)accessibilityLabel
{
  unsigned __int8 v3 = [(UIAccessibilityElementSuperCategory *)self accessibilityDelegate];
  if (!v3) {
    goto LABEL_6;
  }
  if (objc_opt_respondsToSelector()) {
    [v3 accessibilityLabel:self];
  }
  else {
  double v4 = [v3 accessibilityLabel];
  }
  if (!v4)
  {
LABEL_6:
    v6.receiver = self;
    v6.super_class = (Class)UIAccessibilityElementSuperCategory;
    double v4 = [(UIAccessibilityElementSuperCategory *)&v6 accessibilityLabel];
  }

  return v4;
}

- (id)accessibilityHint
{
  unsigned __int8 v3 = [(UIAccessibilityElementSuperCategory *)self accessibilityDelegate];
  if (!v3) {
    goto LABEL_6;
  }
  if (objc_opt_respondsToSelector()) {
    [v3 accessibilityHint:self];
  }
  else {
  double v4 = [v3 accessibilityHint];
  }
  if (!v4)
  {
LABEL_6:
    v6.receiver = self;
    v6.super_class = (Class)UIAccessibilityElementSuperCategory;
    double v4 = [(UIAccessibilityElementSuperCategory *)&v6 accessibilityHint];
  }

  return v4;
}

- (id)accessibilityLanguage
{
  unsigned __int8 v3 = [(UIAccessibilityElementSuperCategory *)self accessibilityDelegate];
  if (!v3) {
    goto LABEL_6;
  }
  if (objc_opt_respondsToSelector()) {
    [v3 accessibilityLanguage:self];
  }
  else {
  double v4 = [v3 accessibilityLanguage];
  }
  if (!v4)
  {
LABEL_6:
    v6.receiver = self;
    v6.super_class = (Class)UIAccessibilityElementSuperCategory;
    double v4 = [(UIAccessibilityElementSuperCategory *)&v6 accessibilityLanguage];
  }

  return v4;
}

- (id)accessibilityPath
{
  unsigned __int8 v3 = [(UIAccessibilityElementSuperCategory *)self accessibilityDelegate];
  if (!v3) {
    goto LABEL_6;
  }
  if (objc_opt_respondsToSelector()) {
    [v3 accessibilityPath:self];
  }
  else {
  double v4 = [v3 accessibilityPath];
  }
  if (!v4)
  {
LABEL_6:
    v6.receiver = self;
    v6.super_class = (Class)UIAccessibilityElementSuperCategory;
    double v4 = [(UIAccessibilityElementSuperCategory *)&v6 accessibilityPath];
  }

  return v4;
}

- (BOOL)_accessibilityUsesFrameInContainerSpace
{
  [(UIAccessibilityElementSuperCategory *)self accessibilityFrameInContainerSpace];
  return !CGRectIsNull(v3);
}

- (CGRect)accessibilityFrame
{
  double x = *MEMORY[0x1E4F1DB28];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  [(UIAccessibilityElementSuperCategory *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v74.origin.double x = x;
  v74.origin.CGFloat y = y;
  v74.size.CGFloat width = width;
  v74.size.CGFloat height = height;
  v80.origin.double x = v8;
  v80.origin.CGFloat y = v10;
  v80.size.CGFloat width = v12;
  v80.size.CGFloat height = v14;
  if (!CGRectEqualToRect(v74, v80))
  {
    v15 = [(UIAccessibilityElementSuperCategory *)self accessibilityContainer];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v17 = [(UIAccessibilityElementSuperCategory *)self accessibilityContainer];
      double v18 = UIAccessibilityFrameForBounds(v17, v8, v10, v12, v14);
LABEL_10:
      double x = v18;
      CGFloat y = v19;
      CGFloat width = v20;
      CGFloat height = v21;

      goto LABEL_18;
    }
  }
  [(UIAccessibilityElementSuperCategory *)self accessibilityFrameInContainerSpace];
  if (CGRectIsNull(v75))
  {
    v22 = [(UIAccessibilityElementSuperCategory *)self accessibilityDelegate];
    if (v22)
    {
      if (objc_opt_respondsToSelector()) {
        [v22 accessibilityFrame:self];
      }
      else {
        [v22 accessibilityFrame];
      }
      double x = v23;
      CGFloat y = v24;
      CGFloat width = v25;
      CGFloat height = v26;
    }
    id v72 = v22;
    SEL aSelector = 0;
    [(UIAccessibilityElementSuperCategory *)self delegateSpecificsForAttribute:2003 delegate:&v72 selector:&aSelector];
    id v51 = v72;

    if (v51 && aSelector)
    {
      v52 = NSStringFromSelector(aSelector);
      v53 = [v51 safeValueForKey:v52];
      [v53 rectValue];
      double x = v54;
      CGFloat y = v55;
      CGFloat width = v56;
      CGFloat height = v57;
    }
  }
  else
  {
    [(UIAccessibilityElementSuperCategory *)self accessibilityFrameInContainerSpace];
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    v35 = [(UIAccessibilityElementSuperCategory *)self accessibilityContainer];
    objc_opt_class();
    char v36 = objc_opt_isKindOfClass();

    if (v36)
    {
      v17 = [self _accessibilityWindow];
      v37 = [(UIAccessibilityElementSuperCategory *)self accessibilityContainer];
      objc_msgSend(v37, "convertRect:toView:", 0, v28, v30, v32, v34);
      double v39 = v38;
      double v41 = v40;
      double v43 = v42;
      double v45 = v44;

      objc_msgSend(v17, "convertRect:toWindow:", 0, v39, v41, v43, v45);
      goto LABEL_10;
    }
    v46 = [(UIAccessibilityElementSuperCategory *)self accessibilityContainer];
    [v46 accessibilityFrame];
    CGFloat v48 = v47;
    CGFloat v50 = v49;

    v76.origin.double x = v28;
    v76.origin.CGFloat y = v30;
    v76.size.CGFloat width = v32;
    v76.size.CGFloat height = v34;
    CGRect v77 = CGRectOffset(v76, v48, v50);
    double x = v77.origin.x;
    CGFloat y = v77.origin.y;
    CGFloat width = v77.size.width;
    CGFloat height = v77.size.height;
  }
LABEL_18:
  v78.origin.double x = x;
  v78.origin.CGFloat y = y;
  v78.size.CGFloat width = width;
  v78.size.CGFloat height = height;
  if (CGRectIsEmpty(v78))
  {
    uint64_t v58 = [self _accessibilityGetBlockForAttribute:6];
    if (v58)
    {
      v59 = (void *)v58;
      double x = (*(double (**)(void))(v58 + 16))();
      CGFloat y = v60;
      CGFloat width = v61;
      CGFloat height = v62;
    }
    else
    {
      v71.receiver = self;
      v71.super_class = (Class)UIAccessibilityElementSuperCategory;
      [(UIAccessibilityElementSuperCategory *)&v71 accessibilityFrame];
      double x = v63;
      CGFloat y = v64;
      CGFloat width = v65;
      CGFloat height = v66;
    }
  }
  double v67 = x;
  double v68 = y;
  double v69 = width;
  double v70 = height;
  result.size.CGFloat height = v70;
  result.size.CGFloat width = v69;
  result.origin.CGFloat y = v68;
  result.origin.double x = v67;
  return result;
}

- (id)accessibilityValue
{
  CGRect v3 = [(UIAccessibilityElementSuperCategory *)self accessibilityDelegate];
  if (!v3) {
    goto LABEL_6;
  }
  if (objc_opt_respondsToSelector()) {
    [v3 accessibilityValue:self];
  }
  else {
  double v4 = [v3 accessibilityValue];
  }
  if (!v4)
  {
LABEL_6:
    v6.receiver = self;
    v6.super_class = (Class)UIAccessibilityElementSuperCategory;
    double v4 = [(UIAccessibilityElementSuperCategory *)&v6 accessibilityValue];
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)UIAccessibilityElementSuperCategory;
  unint64_t v3 = [(UIAccessibilityElementSuperCategory *)&v7 accessibilityTraits];
  double v4 = [(UIAccessibilityElementSuperCategory *)self accessibilityDelegate];
  if (v4)
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = [v4 accessibilityTraits:self];
    }
    else {
      uint64_t v5 = [v4 accessibilityTraits];
    }
    v3 |= v5;
  }

  return v3;
}

- (void)accessibilityIncrement
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:18];
  double v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    uint64_t v5 = [(UIAccessibilityElementSuperCategory *)self accessibilityDelegate];
    if (v5)
    {
      if (objc_opt_respondsToSelector()) {
        [v5 accessibilityIncrement:self];
      }
      else {
        [v5 accessibilityIncrement];
      }
    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)UIAccessibilityElementSuperCategory;
      [(UIAccessibilityElementSuperCategory *)&v6 accessibilityIncrement];
    }
  }
}

- (void)accessibilityDecrement
{
  uint64_t v3 = [self _accessibilityGetBlockForAttribute:19];
  double v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    uint64_t v5 = [(UIAccessibilityElementSuperCategory *)self accessibilityDelegate];
    if (v5)
    {
      if (objc_opt_respondsToSelector()) {
        [v5 accessibilityDecrement:self];
      }
      else {
        [v5 accessibilityDecrement];
      }
    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)UIAccessibilityElementSuperCategory;
      [(UIAccessibilityElementSuperCategory *)&v6 accessibilityDecrement];
    }
  }
}

- (BOOL)_accessibilityProvidesOwnFrame
{
  return 0;
}

- (id)description
{
  uint64_t v3 = [(id)objc_opt_class() description];
  double v4 = [(UIAccessibilityElementSuperCategory *)self accessibilityLabel];
  [(UIAccessibilityElementSuperCategory *)self accessibilityFrame];
  uint64_t v5 = NSStringFromCGRect(v9);
  objc_super v6 = [NSString stringWithFormat:@"%@ [%p] %@ %@", v3, self, v4, v5];

  return v6;
}

- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = [(UIAccessibilityElementSuperCategory *)self accessibilityContainer];
  char v6 = objc_msgSend(v5, "accessibilityZoomInAtPoint:", x, y);

  return v6;
}

- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v5 = [(UIAccessibilityElementSuperCategory *)self accessibilityContainer];
  char v6 = objc_msgSend(v5, "accessibilityZoomOutAtPoint:", x, y);

  return v6;
}

- (id)_accessibilityAutomaticIdentifier
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    uint64_t v3 = 0;
  }
  else
  {
    double v4 = [(UIAccessibilityElementSuperCategory *)self accessibilityContainer];
    uint64_t v5 = [v4 _accessibilityAutomaticIdentifier];

    char v6 = [(UIAccessibilityElementSuperCategory *)self accessibilityContainer];
    uint64_t v7 = [v6 indexOfAccessibilityElement:self];

    double v8 = NSString;
    CGRect v9 = [NSNumber numberWithInteger:v7];
    uint64_t v3 = [v8 stringWithFormat:@"%@:%@", v5, v9];
  }

  return v3;
}

- (BOOL)_accessibilitySetNativeFocus
{
  if ([(UIAccessibilityElementSuperCategory *)self _accessibilityIsFKARunningForFocusItem]&& [(UIAccessibilityElementSuperCategory *)self safeBoolForKey:@"canBecomeFocused"])
  {
    v6.receiver = self;
    v6.super_class = (Class)UIAccessibilityElementSuperCategory;
    return [&v6 _accessibilitySetNativeFocus];
  }
  else
  {
    double v4 = [(UIAccessibilityElementSuperCategory *)self accessibilityContainer];
    char v5 = [v4 _accessibilitySetNativeFocus];

    return v5;
  }
}

- (BOOL)_accessibilityViewHierarchyHasNativeFocus
{
  v2 = [(UIAccessibilityElementSuperCategory *)self accessibilityContainer];
  char v3 = [v2 _accessibilityViewHierarchyHasNativeFocus];

  return v3;
}

- (BOOL)_accessibilitySupportsHandwriting
{
  return 0;
}

- (BOOL)_accessibilityIsFKARunningForFocusItem
{
  v2 = [self _accessibilityAncestorIsKindOf:objc_opt_class()];
  char v3 = [v2 _accessibilityIsFKARunningForFocusItem];

  return v3;
}

- (id)focusGroupIdentifier
{
  char v3 = [self _accessibilityParentView];
  double v4 = [v3 safeValueForKey:@"_containingScrollView"];

  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)UIAccessibilityElementSuperCategory;
    char v5 = [&v7 focusGroupIdentifier];
  }
  else
  {
    char v5 = [self _accessibilityDefaultFocusGroupIdentifier];
  }

  return v5;
}

@end