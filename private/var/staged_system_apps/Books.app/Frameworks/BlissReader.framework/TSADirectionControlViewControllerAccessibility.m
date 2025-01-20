@interface TSADirectionControlViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSArray)_tsaxAllButtons;
- (TSADirectionControlViewAccessibilityElement)_tsaxDirectionElement;
- (UIButton)_tsaxArrowButton;
- (UIButton)_tsaxBackgroundButton;
- (UIButton)_tsaxBottomLeftButton;
- (UIButton)_tsaxBottomRightButton;
- (UIButton)_tsaxDownButton;
- (UIButton)_tsaxLastSelectedButton;
- (UIButton)_tsaxLeftButton;
- (UIButton)_tsaxRightButton;
- (UIButton)_tsaxSelectedButton;
- (UIButton)_tsaxTopLeftButton;
- (UIButton)_tsaxTopRightButton;
- (UIButton)_tsaxUpButton;
- (id)_tsaxStringForDirection:(unint64_t)a3;
- (id)accessibilityValue;
- (id)tsaxDirectionView;
- (unint64_t)_tsaxDirection;
- (unint64_t)_tsaxDirectionForButton:(id)a3;
- (unint64_t)_tsaxDirectionType;
- (void)_tsaxApplyAccessibilityInfo;
- (void)_tsaxBumpValue:(BOOL)a3;
- (void)_tsaxSetDirectionElement:(id)a3;
- (void)_tsaxSetLastSelectedButton:(id)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)dealloc;
- (void)p_selectDetentForButton:(id)a3 forEvent:(id)a4;
- (void)touchUpInsideButton:(id)a3 forEvent:(id)a4;
- (void)tsaxLoadAccessibilityInformation;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TSADirectionControlViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSADirectionControlViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (TSADirectionControlViewAccessibilityElement)_tsaxDirectionElement
{
  return (TSADirectionControlViewAccessibilityElement *)__TSAccessibilityGetAssociatedObject(self, &unk_5738C3);
}

- (void)_tsaxSetDirectionElement:(id)a3
{
}

- (UIButton)_tsaxLastSelectedButton
{
  return (UIButton *)__TSAccessibilityGetAssociatedObject(self, &unk_5738C4);
}

- (void)_tsaxSetLastSelectedButton:(id)a3
{
}

- (id)tsaxDirectionView
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  id result = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSADirectionControlViewControllerAccessibility *)self tsaxValueForKey:@"directionView"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSADirectionControlViewControllerAccessibility;
  [(TSADirectionControlViewControllerAccessibility *)&v4 viewWillAppear:a3];
  [(TSADirectionControlViewControllerAccessibility *)self _tsaxApplyAccessibilityInfo];
}

- (void)p_selectDetentForButton:(id)a3 forEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TSADirectionControlViewControllerAccessibility;
  [(TSADirectionControlViewControllerAccessibility *)&v6 p_selectDetentForButton:a3 forEvent:a4];
  char v5 = [(TSADirectionControlViewControllerAccessibility *)self _tsaxSelectedButton];
  if (v5 != [(TSADirectionControlViewControllerAccessibility *)self _tsaxLastSelectedButton])
  {
    TSAccessibilityPostHighPriorityAnnouncementNotification((uint64_t)self, (uint64_t)[(TSADirectionControlViewControllerAccessibility *)self _tsaxStringForDirection:[(TSADirectionControlViewControllerAccessibility *)self _tsaxDirectionForButton:v5]]);
    [(TSADirectionControlViewControllerAccessibility *)self _tsaxSetLastSelectedButton:v5];
  }
}

- (void)touchUpInsideButton:(id)a3 forEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TSADirectionControlViewControllerAccessibility;
  [(TSADirectionControlViewControllerAccessibility *)&v5 touchUpInsideButton:a3 forEvent:a4];
  TSAccessibilityPostHighPriorityAnnouncementNotification((uint64_t)self, (uint64_t)[(TSADirectionControlViewControllerAccessibility *)self accessibilityValue]);
  [(TSADirectionControlViewControllerAccessibility *)self _tsaxSetLastSelectedButton:0];
}

- (void)dealloc
{
  [(TSADirectionControlViewAccessibilityElement *)[(TSADirectionControlViewControllerAccessibility *)self _tsaxDirectionElement] setDirectionViewController:0];
  v3.receiver = self;
  v3.super_class = (Class)TSADirectionControlViewControllerAccessibility;
  [(TSADirectionControlViewControllerAccessibility *)&v3 dealloc];
}

- (id)accessibilityValue
{
  unint64_t v3 = [(TSADirectionControlViewControllerAccessibility *)self _tsaxDirection];

  return [(TSADirectionControlViewControllerAccessibility *)self _tsaxStringForDirection:v3];
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (void)tsaxLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)TSADirectionControlViewControllerAccessibility;
  [(TSADirectionControlViewControllerAccessibility *)&v3 tsaxLoadAccessibilityInformation];
  [(TSADirectionControlViewControllerAccessibility *)self _tsaxApplyAccessibilityInfo];
}

- (unint64_t)_tsaxDirection
{
  return (unint64_t)[(TSADirectionControlViewControllerAccessibility *)self tsaxUnsignedIntegerValueForKey:@"direction"];
}

- (unint64_t)_tsaxDirectionType
{
  return (unint64_t)[(TSADirectionControlViewControllerAccessibility *)self tsaxUnsignedIntegerValueForKey:@"directionType"];
}

- (NSArray)_tsaxAllButtons
{
  id v3 = +[NSMutableArray array];
  id v4 = [[self tsaxDirectionView] subviews];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        char v14 = 0;
        v10 = objc_opt_class();
        Class v11 = __TSAccessibilityCastAsSafeCategory(v10, v9, 1, &v14);
        if (v14) {
          abort();
        }
        Class v12 = v11;
        if (v11 != (Class)[(TSADirectionControlViewControllerAccessibility *)self _tsaxArrowButton]
          && v12 != (Class)[(TSADirectionControlViewControllerAccessibility *)self _tsaxBackgroundButton])
        {
          [v3 tsaxAddObjectIfNotNil:v12];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  return +[NSArray arrayWithArray:v3];
}

- (UIButton)_tsaxSelectedButton
{
  v2 = [(TSADirectionControlViewControllerAccessibility *)self _tsaxAllButtons];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  id v5 = 0;
  uint64_t v6 = *(void *)v11;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(v2);
      }
      v8 = *(UIButton **)(*((void *)&v10 + 1) + 8 * i);
      if ([(UIButton *)v8 isSelected]) {
        id v5 = v8;
      }
    }
    id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v4);
  return v5;
}

- (UIButton)_tsaxArrowButton
{
  char v5 = 0;
  id v3 = (objc_class *)objc_opt_class();
  id result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSADirectionControlViewControllerAccessibility *)self tsaxValueForKey:@"arrowButton"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (UIButton)_tsaxBackgroundButton
{
  char v5 = 0;
  id v3 = (objc_class *)objc_opt_class();
  id result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSADirectionControlViewControllerAccessibility *)self tsaxValueForKey:@"backgroundButton"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (UIButton)_tsaxUpButton
{
  char v5 = 0;
  id v3 = (objc_class *)objc_opt_class();
  id result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSADirectionControlViewControllerAccessibility *)self tsaxValueForKey:@"upButton"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (UIButton)_tsaxDownButton
{
  char v5 = 0;
  id v3 = (objc_class *)objc_opt_class();
  id result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSADirectionControlViewControllerAccessibility *)self tsaxValueForKey:@"downButton"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (UIButton)_tsaxLeftButton
{
  char v5 = 0;
  id v3 = (objc_class *)objc_opt_class();
  id result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSADirectionControlViewControllerAccessibility *)self tsaxValueForKey:@"leftButton"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (UIButton)_tsaxRightButton
{
  char v5 = 0;
  id v3 = (objc_class *)objc_opt_class();
  id result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSADirectionControlViewControllerAccessibility *)self tsaxValueForKey:@"rightButton"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (UIButton)_tsaxTopLeftButton
{
  char v5 = 0;
  id v3 = (objc_class *)objc_opt_class();
  id result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSADirectionControlViewControllerAccessibility *)self tsaxValueForKey:@"topLeftButton"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (UIButton)_tsaxTopRightButton
{
  char v5 = 0;
  id v3 = (objc_class *)objc_opt_class();
  id result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSADirectionControlViewControllerAccessibility *)self tsaxValueForKey:@"topRightButton"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (UIButton)_tsaxBottomLeftButton
{
  char v5 = 0;
  id v3 = (objc_class *)objc_opt_class();
  id result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSADirectionControlViewControllerAccessibility *)self tsaxValueForKey:@"bottomLeftButton"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (UIButton)_tsaxBottomRightButton
{
  char v5 = 0;
  id v3 = (objc_class *)objc_opt_class();
  id result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSADirectionControlViewControllerAccessibility *)self tsaxValueForKey:@"bottomRightButton"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (void)_tsaxBumpValue:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(TSADirectionControlViewControllerAccessibility *)self _tsaxDirectionType];
  unint64_t v6 = [(TSADirectionControlViewControllerAccessibility *)self _tsaxDirection];
  if (v5 <= 4 && ((0x1Du >> v5) & 1) != 0)
  {
    int v7 = dword_34FB90[2 * v5];
    int v8 = dword_34FBB8[2 * v5];
    if (v6 <= 7) {
      LOBYTE(v7) = v6;
    }
    if (!v3) {
      int v8 = -v8;
    }
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_261C34;
    v9[3] = &unk_457250;
    v9[4] = self;
    v9[5] = ((_BYTE)v8 + (_BYTE)v7) & 7;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v9)) {
      abort();
    }
  }
}

- (void)_tsaxApplyAccessibilityInfo
{
  if (![(TSADirectionControlViewControllerAccessibility *)self _tsaxDirectionElement])
  {
    BOOL v3 = [[TSADirectionControlViewAccessibilityElement alloc] initWithAccessibilityContainer:[(TSADirectionControlViewControllerAccessibility *)self tsaxDirectionView]];
    [(TSADirectionControlViewAccessibilityElement *)v3 setDirectionViewController:self];
    [(TSADirectionControlViewControllerAccessibility *)self _tsaxSetDirectionElement:v3];
    id v4 = v3;
    [(-[TSADirectionControlViewControllerAccessibility tsaxDirectionView](self, "tsaxDirectionView")) setAccessibilityElements:+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v4, 1)];
  }
}

- (id)_tsaxStringForDirection:(unint64_t)a3
{
  if (a3 > 7) {
    return TSAccessibilityLocalizedString(@"cardinal.Undefined");
  }
  else {
    return TSAccessibilityLocalizedString((uint64_t)off_46BCA0[a3]);
  }
}

- (unint64_t)_tsaxDirectionForButton:(id)a3
{
  if ([(TSADirectionControlViewControllerAccessibility *)self _tsaxUpButton] == a3) {
    return 0;
  }
  if ([(TSADirectionControlViewControllerAccessibility *)self _tsaxTopRightButton] == a3) {
    return 1;
  }
  if ([(TSADirectionControlViewControllerAccessibility *)self _tsaxRightButton] == a3) {
    return 2;
  }
  if ([(TSADirectionControlViewControllerAccessibility *)self _tsaxBottomRightButton] == a3) {
    return 3;
  }
  if ([(TSADirectionControlViewControllerAccessibility *)self _tsaxDownButton] == a3) {
    return 4;
  }
  if ([(TSADirectionControlViewControllerAccessibility *)self _tsaxBottomLeftButton] == a3) {
    return 5;
  }
  if ([(TSADirectionControlViewControllerAccessibility *)self _tsaxLeftButton] == a3) {
    return 6;
  }
  if ([(TSADirectionControlViewControllerAccessibility *)self _tsaxTopLeftButton] == a3) {
    return 7;
  }
  return 16;
}

@end