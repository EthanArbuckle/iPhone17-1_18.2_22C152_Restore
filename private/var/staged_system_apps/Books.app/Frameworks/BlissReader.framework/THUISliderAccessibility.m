@interface THUISliderAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
+ (void)tsaxAddSafeCategoryDependenciesToCollection:(id)a3;
- (float)thaxMaximumValue;
- (float)thaxMinimumValue;
- (float)thaxValue;
- (id)_thaxValueHandler;
- (id)accessibilityValue;
- (id)thaxValueHandler;
- (void)_thaxPageScrubberModify:(BOOL)a3;
- (void)_thaxPerformTargetActionsForControlEvents:(unint64_t)a3;
- (void)_thaxSetValueHandler:(id)a3;
- (void)_thaxTangierEndSlider;
- (void)_thaxTangierStartSlider;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)thaxSetValueHandler:(id)a3;
@end

@implementation THUISliderAccessibility

+ (id)tsaxTargetClassName
{
  return @"UISlider";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)_thaxValueHandler
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_573A82);
}

- (void)_thaxSetValueHandler:(id)a3
{
}

+ (void)tsaxAddSafeCategoryDependenciesToCollection:(id)a3
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___THUISliderAccessibility;
  [super tsaxAddSafeCategoryDependenciesToCollection:];
  [a3 addObject:@"TSUISliderAccessibility"];
}

- (float)thaxValue
{
  [(THUISliderAccessibility *)self tsaxFloatValueForKey:@"value"];
  return result;
}

- (float)thaxMinimumValue
{
  [(THUISliderAccessibility *)self tsaxFloatValueForKey:@"minimumValue"];
  return result;
}

- (float)thaxMaximumValue
{
  [(THUISliderAccessibility *)self tsaxFloatValueForKey:@"maximumValue"];
  return result;
}

- (id)thaxValueHandler
{
  return [(THUISliderAccessibility *)self _thaxValueHandler];
}

- (void)thaxSetValueHandler:(id)a3
{
  objc_super v4 = _Block_copy(a3);

  [(THUISliderAccessibility *)self _thaxSetValueHandler:v4];
}

- (id)accessibilityValue
{
  v3 = [(THUISliderAccessibility *)self thaxValueHandler];
  if (v3)
  {
    objc_super v4 = (uint64_t (*)(void))v3[2];
    return (id)v4();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)THUISliderAccessibility;
    return [(THUISliderAccessibility *)&v6 accessibilityValue];
  }
}

- (void)accessibilityIncrement
{
  [(THUISliderAccessibility *)self _thaxTangierStartSlider];
  if (objc_msgSend(-[THUISliderAccessibility accessibilityIdentifier](self, "accessibilityIdentifier"), "isEqualToString:", @"PageScrubber"))
  {
    [(THUISliderAccessibility *)self _thaxPageScrubberModify:1];
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)THUISliderAccessibility;
    [(THUISliderAccessibility *)&v3 accessibilityIncrement];
  }
  [(THUISliderAccessibility *)self _thaxTangierEndSlider];
}

- (void)accessibilityDecrement
{
  [(THUISliderAccessibility *)self _thaxTangierStartSlider];
  if (objc_msgSend(-[THUISliderAccessibility accessibilityIdentifier](self, "accessibilityIdentifier"), "isEqualToString:", @"PageScrubber"))
  {
    [(THUISliderAccessibility *)self _thaxPageScrubberModify:0];
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)THUISliderAccessibility;
    [(THUISliderAccessibility *)&v3 accessibilityDecrement];
  }
  [(THUISliderAccessibility *)self _thaxTangierEndSlider];
}

- (void)_thaxPerformTargetActionsForControlEvents:(unint64_t)a3
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [(THUISliderAccessibility *)self allTargets];
  id v18 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v18)
  {
    uint64_t v16 = *(void *)v25;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = v4;
        v5 = *(void **)(*((void *)&v24 + 1) + 8 * v4);
        id v6 = [(THUISliderAccessibility *)self actionsForTarget:v5 forControlEvent:a3];
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v21;
          do
          {
            for (i = 0; i != v8; i = (char *)i + 1)
            {
              if (*(void *)v21 != v9) {
                objc_enumerationMutation(v6);
              }
              v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
              v12 = (char *)[v11 rangeOfString:@":"];
              v13 = (char *)[v11 length] - 1;
              SEL v14 = NSSelectorFromString((NSString *)v11);
              if (v12 == v13) {
                [v5 performSelector:v14 withObject:self];
              }
              else {
                [v5 performSelector:v14];
              }
            }
            id v8 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v8);
        }
        uint64_t v4 = v19 + 1;
      }
      while ((id)(v19 + 1) != v18);
      id v18 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v18);
  }
}

- (void)_thaxTangierStartSlider
{
}

- (void)_thaxTangierEndSlider
{
}

- (void)_thaxPageScrubberModify:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(THUISliderAccessibility *)self isUserInteractionEnabled])
  {
    id v5 = [self allTargets].anyObject;
    id v6 = [[[v5 tsaxValueForKey:@"pageNumberLabel"] tsaxValueForKey:@"text"]];
    objc_opt_class();
    id v7 = (objc_opt_isKindOfClass() & 1) != 0 ? (char *)[v6 integerValue] : 0;
    if (objc_opt_respondsToSelector())
    {
      if (v3) {
        id v8 = v7;
      }
      else {
        id v8 = v7 - 2;
      }
      [v5 p_scrollToAbsolutePageIndex:v8];
      [v5 tsaxValueForKey:@"p_fadeOutSingleThumbViewController"];
    }
  }
}

@end