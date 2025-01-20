@interface BKAVRouteButtonAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (NSString)bkaxAccessibilityLabelOverride;
- (id)accessibilityLabel;
- (void)bkaxSetAccessibilityLabelOverride:(id)a3;
- (void)setAccessibilityLabel:(id)a3;
@end

@implementation BKAVRouteButtonAccessibility

+ (id)imaxTargetClassName
{
  return @"AVRoutePickerView";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)bkaxAccessibilityLabelOverride
{
  return (NSString *)___IMAccessibilityGetAssociatedObject(self, &unk_100B4A4B0);
}

- (void)bkaxSetAccessibilityLabelOverride:(id)a3
{
}

- (id)accessibilityLabel
{
  v3 = [(BKAVRouteButtonAccessibility *)self bkaxAccessibilityLabelOverride];

  if (v3)
  {
    id v4 = [(BKAVRouteButtonAccessibility *)self bkaxAccessibilityLabelOverride];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)BKAVRouteButtonAccessibility;
    id v4 = [(BKAVRouteButtonAccessibility *)&v14 accessibilityLabel];
    if (!v4)
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      v5 = [(BKAVRouteButtonAccessibility *)self imaxValueForKey:@"subviews", 0];
      id v4 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
      if (v4)
      {
        uint64_t v6 = *(void *)v11;
        while (2)
        {
          for (i = 0; i != v4; i = (char *)i + 1)
          {
            if (*(void *)v11 != v6) {
              objc_enumerationMutation(v5);
            }
            v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v4 = [v8 accessibilityLabel];
              goto LABEL_14;
            }
          }
          id v4 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
          if (v4) {
            continue;
          }
          break;
        }
      }
LABEL_14:
    }
  }

  return v4;
}

- (void)setAccessibilityLabel:(id)a3
{
  id v4 = a3;
  [(BKAVRouteButtonAccessibility *)self bkaxSetAccessibilityLabelOverride:v4];
  id v5 = [(BKAVRouteButtonAccessibility *)self imaxValueForKey:@"_routePickerButton"];
  [v5 setAccessibilityLabel:v4];
}

@end